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
	GRM_DT: 
		dq 0 
		dq 0 
		dq 0 
		dq 0 
		dq 0 
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

LB_252: db 95,0
LB_1030: db 10,0
LB_1031: db 58,0
LB_1032: db 45,0
LB_1033: db 112,114,115,95,101,114,114,32,0
LB_1035: db 59,32,226,136,142,124,10,101,120,110,32,53,49,48,50,57,58,10,0
LB_1040: db 58,10,0
LB_1041: db 45,0
LB_1042: db 110,108,115,95,101,114,114,32,0
LB_1044: db 59,32,226,136,142,124,10,101,120,110,32,53,49,49,55,56,58,10,0
LB_1083: db 59,32,226,136,142,124,10,101,120,110,32,53,49,53,56,56,58,10,0
LB_1167: db 34,108,105,110,101,95,114,101,115,95,99,32,48,34,0
LB_1169: db 59,32,226,136,142,124,10,101,120,110,32,53,50,52,52,54,58,10,0
LB_2972: db 34,33,33,33,34,0
LB_2978: db 34,63,63,63,34,0
LB_3352: db 34,100,116,95,101,116,114,32,48,34,0
LB_3638: db 34,108,99,95,101,116,114,95,98,111,100,121,32,48,34,0
LB_3940: db 34,103,114,109,95,101,116,114,95,97,99,116,95,97,99,116,32,48,34,0
LB_3943: db 59,32,226,136,142,124,10,101,120,110,32,55,54,53,56,57,58,10,0
LB_3966: db 34,103,114,109,95,101,116,114,95,97,99,116,95,97,99,116,32,49,34,0
LB_3969: db 59,32,226,136,142,124,10,101,120,110,32,55,54,56,53,56,58,10,0
LB_4218: db 194,167,194,167,32,77,48,10,9,226,136,142,226,136,142,32,10,194,167,194,167,32,77,49,32,61,32,77,48,10,0
LB_4219: db 9,226,136,142,32,120,32,10,0
LB_4226: db 194,167,194,167,32,77,48,10,9,226,136,142,226,136,142,32,10,194,167,194,167,32,77,49,32,61,32,77,48,10,0
LB_4235: db 39,48,226,151,130,0
LB_4237: db 39,49,226,151,130,0
LB_4242: db 39,48,226,151,130,0
LB_4244: db 39,49,226,151,130,0
LB_4250: db 39,48,226,151,130,0
LB_4251: db 39,49,226,151,130,0
LB_4256: db 39,48,226,151,130,0
LB_4258: db 39,49,226,151,130,0
LB_4267: db 39,48,226,151,130,0
LB_4269: db 39,49,226,151,130,0
LB_4271: db 39,50,226,151,130,0
LB_4273: db 39,51,226,151,130,0
LB_4275: db 39,52,226,151,130,0
LB_4277: db 39,53,226,151,130,0
LB_4283: db 39,48,226,151,130,0
LB_4284: db 39,49,226,151,130,0
LB_4289: db 39,48,226,151,130,0
LB_4292: db 39,49,226,151,130,0
LB_4301: db 39,48,226,151,130,0
LB_4303: db 39,49,226,151,130,0
LB_4304: db 39,50,226,151,130,0
LB_4305: db 39,51,226,151,130,0
LB_4307: db 39,52,226,151,130,0
LB_4312: db 39,48,226,151,130,0
LB_4313: db 39,49,226,151,130,0
LB_4318: db 39,48,226,151,130,0
LB_4319: db 39,49,226,151,130,0
LB_4324: db 39,48,226,151,130,0
LB_4325: db 39,49,226,151,130,0
LB_4330: db 39,48,226,151,130,0
LB_4331: db 39,49,226,151,130,0
LB_4336: db 39,48,226,151,130,0
LB_4340: db 39,49,226,151,130,0
LB_4350: db 39,48,226,151,130,0
LB_4352: db 39,49,226,151,130,0
LB_4354: db 39,50,226,151,130,0
LB_4356: db 39,51,226,151,130,0
LB_4358: db 39,52,226,151,130,0
LB_4360: db 39,53,226,151,130,0
LB_4362: db 39,54,226,151,130,0
LB_4367: db 39,48,226,151,130,0
LB_4368: db 39,49,226,151,130,0
LB_4373: db 39,48,226,151,130,0
LB_4375: db 39,49,226,151,130,0
LB_4381: db 39,48,226,151,130,0
LB_4382: db 39,49,226,151,130,0
LB_4387: db 39,48,226,151,130,0
LB_4391: db 39,49,226,151,130,0
LB_4397: db 39,48,226,151,130,0
LB_4398: db 39,49,226,151,130,0
LB_4399: db 39,50,226,151,130,0
LB_4404: db 39,48,226,151,130,0
LB_4406: db 39,49,226,151,130,0
LB_4412: db 39,48,226,151,130,0
LB_4413: db 39,49,226,151,130,0
LB_4415: db 39,50,226,151,130,0
LB_4420: db 39,48,226,151,130,0
LB_4422: db 39,49,226,151,130,0
LB_4432: db 39,48,226,151,130,0
LB_4434: db 39,49,226,151,130,0
LB_4437: db 39,50,226,151,130,0
LB_4438: db 39,51,226,151,130,0
LB_4439: db 39,52,226,151,130,0
LB_4440: db 39,53,226,151,130,0
LB_4441: db 39,54,226,151,130,0
LB_4451: db 39,48,226,151,130,0
LB_4453: db 39,49,226,151,130,0
LB_4455: db 39,50,226,151,130,0
LB_4457: db 39,51,226,151,130,0
LB_4459: db 39,52,226,151,130,0
LB_4461: db 39,53,226,151,130,0
LB_4463: db 39,54,226,151,130,0
LB_4468: db 39,48,226,151,130,0
LB_4469: db 39,49,226,151,130,0
LB_4474: db 39,48,226,151,130,0
LB_4476: db 39,49,226,151,130,0
LB_4482: db 39,48,226,151,130,0
LB_4483: db 39,49,226,151,130,0
LB_4488: db 39,48,226,151,130,0
LB_4492: db 39,49,226,151,130,0
LB_4498: db 39,48,226,151,130,0
LB_4499: db 39,49,226,151,130,0
LB_4500: db 39,50,226,151,130,0
LB_4505: db 39,48,226,151,130,0
LB_4507: db 39,49,226,151,130,0
LB_4513: db 39,48,226,151,130,0
LB_4514: db 39,49,226,151,130,0
LB_4516: db 39,50,226,151,130,0
LB_4521: db 39,48,226,151,130,0
LB_4523: db 39,49,226,151,130,0
LB_4533: db 39,48,226,151,130,0
LB_4534: db 39,49,226,151,130,0
LB_4535: db 39,50,226,151,130,0
LB_4536: db 39,51,226,151,130,0
LB_4537: db 39,52,226,151,130,0
LB_4538: db 39,53,226,151,130,0
LB_4539: db 39,54,226,151,130,0
LB_4544: db 39,48,226,151,130,0
LB_4546: db 39,49,226,151,130,0
LB_4554: db 39,48,226,151,130,0
LB_4555: db 39,49,226,151,130,0
LB_4556: db 39,50,226,151,130,0
LB_4558: db 39,51,226,151,130,0
LB_4563: db 39,48,226,151,130,0
LB_4564: db 39,49,226,151,130,0
LB_4569: db 39,48,226,151,130,0
LB_4570: db 39,49,226,151,130,0
LB_4575: db 39,48,226,151,130,0
LB_4576: db 39,49,226,151,130,0
LB_4583: db 39,48,226,151,130,0
LB_4584: db 39,49,226,151,130,0
LB_4585: db 39,50,226,151,130,0
LB_4586: db 39,51,226,151,130,0
LB_4594: db 39,48,226,151,130,0
LB_4596: db 39,49,226,151,130,0
LB_4601: db 39,48,226,151,130,0
LB_4602: db 39,49,226,151,130,0
LB_4607: db 39,48,226,151,130,0
LB_4608: db 39,49,226,151,130,0
LB_4613: db 39,48,226,151,130,0
LB_4615: db 39,49,226,151,130,0
LB_4621: db 39,48,226,151,130,0
LB_4622: db 39,49,226,151,130,0
LB_4624: db 39,50,226,151,130,0
LB_4631: db 39,48,226,151,130,0
LB_4632: db 39,49,226,151,130,0
LB_4633: db 39,50,226,151,130,0
LB_4634: db 39,51,226,151,130,0
LB_4639: db 39,48,226,151,130,0
LB_4640: db 39,49,226,151,130,0
LB_4645: db 39,48,226,151,130,0
LB_4647: db 39,49,226,151,130,0
LB_4652: db 39,48,226,151,130,0
LB_4653: db 39,49,226,151,130,0
LB_4658: db 39,48,226,151,130,0
LB_4659: db 39,49,226,151,130,0
LB_4664: db 39,48,226,151,130,0
LB_4666: db 39,49,226,151,130,0
LB_4674: db 39,48,226,151,130,0
LB_4676: db 39,49,226,151,130,0
LB_4677: db 39,50,226,151,130,0
LB_4678: db 39,51,226,151,130,0
LB_4685: db 39,48,226,151,130,0
LB_4687: db 39,49,226,151,130,0
LB_4688: db 39,50,226,151,130,0
LB_4689: db 39,51,226,151,130,0
LB_4695: db 39,48,226,151,130,0
LB_4696: db 39,49,226,151,130,0
LB_4704: db 39,48,226,151,130,0
LB_4705: db 39,49,226,151,130,0
LB_4706: db 39,50,226,151,130,0
LB_4707: db 39,51,226,151,130,0
LB_4708: db 39,52,226,151,130,0
LB_4713: db 39,48,226,151,130,0
LB_4714: db 39,49,226,151,130,0
LB_4719: db 39,48,226,151,130,0
LB_4721: db 39,49,226,151,130,0
LB_4729: db 39,48,226,151,130,0
LB_4730: db 39,49,226,151,130,0
LB_4731: db 39,50,226,151,130,0
LB_4733: db 39,51,226,151,130,0
LB_4738: db 39,48,226,151,130,0
LB_4739: db 39,49,226,151,130,0
LB_4744: db 39,48,226,151,130,0
LB_4745: db 39,49,226,151,130,0
LB_4750: db 39,48,226,151,130,0
LB_4751: db 39,49,226,151,130,0
LB_4758: db 39,48,226,151,130,0
LB_4759: db 39,49,226,151,130,0
LB_4760: db 39,50,226,151,130,0
LB_4761: db 39,51,226,151,130,0
LB_4769: db 39,48,226,151,130,0
LB_4771: db 39,49,226,151,130,0
LB_4776: db 39,48,226,151,130,0
LB_4777: db 39,49,226,151,130,0
LB_4782: db 39,48,226,151,130,0
LB_4783: db 39,49,226,151,130,0
LB_4788: db 39,48,226,151,130,0
LB_4790: db 39,49,226,151,130,0
LB_4796: db 39,48,226,151,130,0
LB_4797: db 39,49,226,151,130,0
LB_4798: db 39,50,226,151,130,0
LB_4803: db 39,48,226,151,130,0
LB_4804: db 39,49,226,151,130,0
LB_4809: db 39,48,226,151,130,0
LB_4811: db 39,49,226,151,130,0
LB_4816: db 39,48,226,151,130,0
LB_4817: db 39,49,226,151,130,0
LB_4822: db 39,48,226,151,130,0
LB_4823: db 39,49,226,151,130,0
LB_4828: db 39,48,226,151,130,0
LB_4829: db 39,49,226,151,130,0
LB_4835: db 39,48,226,151,130,0
LB_4836: db 39,49,226,151,130,0
LB_4837: db 39,50,226,151,130,0
LB_4842: db 39,48,226,151,130,0
LB_4844: db 39,49,226,151,130,0
LB_4849: db 39,48,226,151,130,0
LB_4851: db 39,49,226,151,130,0
LB_4857: db 39,48,226,151,130,0
LB_4861: db 39,49,226,151,130,0
LB_4866: db 39,48,226,151,130,0
LB_4867: db 39,49,226,151,130,0
LB_4873: db 39,48,226,151,130,0
LB_4875: db 39,49,226,151,130,0
LB_4877: db 39,50,226,151,130,0
LB_4882: db 39,48,226,151,130,0
LB_4884: db 39,49,226,151,130,0
LB_4889: db 39,48,226,151,130,0
LB_4890: db 39,49,226,151,130,0
LB_4895: db 39,48,226,151,130,0
LB_4896: db 39,49,226,151,130,0
LB_4902: db 39,48,226,151,130,0
LB_4903: db 39,49,226,151,130,0
LB_4904: db 39,50,226,151,130,0
LB_4909: db 39,48,226,151,130,0
LB_4911: db 39,49,226,151,130,0
LB_4916: db 39,48,226,151,130,0
LB_4917: db 39,49,226,151,130,0
LB_4922: db 39,48,226,151,130,0
LB_4923: db 39,49,226,151,130,0
LB_4930: db 34,68,49,34,0
LB_4933: db 59,32,226,136,142,124,10,101,120,110,32,52,51,48,57,56,57,58,10,0
LB_4934: db 59,32,226,136,142,124,10,101,120,110,32,52,51,49,48,49,54,58,10,0
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
LB_10: ;; #67 0'(= a14◂ [ ] ) ⊢ { 0'(= a14◂ [ ] ) 1'(= r ) } : (_t14→{ _t14 _r64 })
;; rsp=0 , %131~0'(= a14◂ [ ] ) 
;; ? 0'(= a14◂ [ ] ) ⊢ 0(<4)◂{ 1'(= a14◂ [ ] ) 2'(= r ) 3'(= a14◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_12
	jmp LB_13
LB_12:
	jmp LB_11
LB_13:
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_11:
;; ? 0'(= a14◂ [ ] ) ⊢ 3(<4)◂1'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_15
	jmp LB_16
LB_15:
	jmp LB_14
LB_16:
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_14:
;; ? 0'(= a14◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_18
	jmp LB_19
LB_18:
	jmp LB_17
LB_19:
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_17:
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_9: ;; #69 { 0'(= {| l |} ) 1'(= a14◂ [ ] ) } ⊢ 0'(= a14◂ [ ] ) : ({ _s8 _t14 }→_t14)
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
; mov_ptn2.
	call LB_10
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_55: ;; #71 { 0'(= r ) 1'(= a14◂ [ ] ) } ⊢ 0'(= a14◂ [ ] ) : ({ _r64 _t14 }→_t14)
;; rsp=0 , %175~1'(= a14◂ [ ] ) %174~0'(= r ) 
; #67 1'(= a14◂ [ ] ) ⊢ { 2'(= a14◂ [ ] ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 1'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 1100000010.. |}
	mov r13,r14
; mov_ptn2.
	call LB_10
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 1
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
; mov_ptn2.
; .add_rsp 0
	ret
ETR_99:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_99
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_99:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3
	add r14,1
	jmp LB_2
LB_3:
; .rb_rle 
	add rsp,0
	jmp LB_1
LB_2:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_5
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4
LB_5:
; .rb_rle 
	add rsp,0
	jmp LB_1
LB_4:
	jmp LB_7
LB_6:
; .rb_rle 
	add rsp,8
	jmp LB_1
LB_7:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
	call LB_9
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
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
; mov_ptn2.
	jmp LB_8
LB_8:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_0
LB_1:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_22
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],9
	jnz LB_22
	add r14,1
	jmp LB_21
LB_22:
; .rb_rle 
	add rsp,0
	jmp LB_20
LB_21:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_24
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_23
LB_24:
; .rb_rle 
	add rsp,0
	jmp LB_20
LB_23:
	jmp LB_26
LB_25:
; .rb_rle 
	add rsp,8
	jmp LB_20
LB_26:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
	call LB_9
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
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
; mov_ptn2.
	jmp LB_27
LB_27:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_0
LB_20:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_30
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_30
	add r14,1
	jmp LB_29
LB_30:
; .rb_rle 
	add rsp,0
	jmp LB_28
LB_29:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_32
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_31
LB_32:
; .rb_rle 
	add rsp,0
	jmp LB_28
LB_31:
	jmp LB_34
LB_33:
; .rb_rle 
	add rsp,8
	jmp LB_28
LB_34:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
	call LB_9
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
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
; mov_ptn2.
	jmp LB_35
LB_35:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_0
LB_28:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_38
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_38
	add r14,1
	jmp LB_37
LB_38:
; .rb_rle 
	add rsp,0
	jmp LB_36
LB_37:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_40
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_39
LB_40:
; .rb_rle 
	add rsp,0
	jmp LB_36
LB_39:
	jmp LB_42
LB_41:
; .rb_rle 
	add rsp,8
	jmp LB_36
LB_42:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
	call LB_9
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
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
; mov_ptn2.
	jmp LB_43
LB_43:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_0
LB_36:
	mov r14,QWORD [rsp]
	cmp r14,r9
	jge LB_46
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_45
LB_46:
; .rb_rle 
	add rsp,0
	jmp LB_44
LB_45:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_48
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_47
LB_48:
; .rb_rle 
	add rsp,8
	jmp LB_44
LB_47:
	jmp LB_50
LB_49:
; .rb_rle 
	add rsp,16
	jmp LB_44
LB_50:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %394~1'(= r ) %393~0'(= r ) %392~9'(= a14◂ [ ] ) %391~8'(= r ) 
	cmp QWORD [rsp-8+8*2],0
	jnz LB_54
	jmp LB_53
LB_54:
	jmp LB_52
LB_53:
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
; mov_ptn2.
	call LB_9
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_51
LB_52:
;; rsp=2 , %394~1'(= r ) %393~0'(= r ) %392~9'(= a14◂ [ ] ) %391~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_55
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
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
; mov_ptn2.
	jmp LB_51
LB_51:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_0
LB_44:
	mov r14,QWORD [rsp]
	jmp LB_58
LB_57:
; .rb_rle 
	add rsp,0
	jmp LB_56
LB_58:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_59
LB_59:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_0
LB_56:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_0:
; discard r14
	add rsp,8
	ret
LB_70: ;; #73 { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t14 _s8 _r64 }→{ _t14 _s8 _r64 })
;; rsp=0 , %192~2'(= r ) %191~1'(= {| l |} ) %190~0'(= a14◂ [ ] ) 
;; ? 0'(= a14◂ [ ] ) ⊢ 0(<4)◂{ 3'(= a14◂ [ ] ) 4'(= r ) 5'(= a14◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_72
	jmp LB_73
LB_72:
	jmp LB_71
LB_73:
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
; mov_ptn2.
	call LB_70
	mov r11,QWORD [rsp-8+8*2]
	mov r10,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %200~2'(= r ) %199~1'(= {| l |} ) %198~0'(= a14◂ [ ] ) %197~5'(= a14◂ [ ] ) %196~4'(= r ) 
; #73 { 5'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r10
; .mov_ptn2 { 5'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 11100100110.. |}
	mov r13,r11
; mov_ptn2.
	call LB_70
	mov r10,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_71:
;; ? 0'(= a14◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_75
	jmp LB_76
LB_75:
	jmp LB_74
LB_76:
;; rsp=0 , %192~2'(= r ) %191~1'(= {| l |} ) 
; #63 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %205~2(<4)◂{ } %192~2'(= r ) %191~1'(= {| l |} ) 
; ∎ { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; {| 1110.. |}
	mov r13,unt_2
; mov_ptn2.
; .add_rsp 0
	ret
LB_74:
;; ? 0'(= a14◂ [ ] ) ⊢ 3(<4)◂3'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_78
	jmp LB_79
LB_78:
	jmp LB_77
LB_79:
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_77:
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_69: ;; #74 0'(= a14◂ [ ] ) ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) } : (_t14→{ _t14 _s8 })
;; rsp=0 , %220~0'(= a14◂ [ ] ) 
; #67 0'(= a14◂ [ ] ) ⊢ { 0'(= a14◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 10.. |}
; mov_ptn2.
	call LB_10
; .add_rsp 0
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
; mov_ptn2.
	call LB_70
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
; .add_rsp 1
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_80:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_85+8*rax]
LB_85: dq LB_81,LB_82,LB_83,LB_84
LB_81:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_80
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_80
	pop r8 
	FREE_RCD 3, r8
	jmp LB_86
LB_82:
	mov rdi,r8
	call free_s8
	jmp LB_86
LB_83:
	jmp LB_86
LB_84:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_86
LB_86:
	ret
ETR_101:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_101
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_101:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_63
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_63
	add r14,1
	jmp LB_62
LB_63:
; .rb_rle 
	add rsp,0
	jmp LB_61
LB_62:
	call GRM_102
	cmp BYTE [r8+6],0
	jnz LB_65
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_64
LB_65:
; .rb_rle 
	add rsp,0
	jmp LB_61
LB_64:
	jmp LB_67
LB_66:
; .rb_rle 
	add rsp,8
	jmp LB_61
LB_67:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %416~1'(= r ) %415~0'(= r ) %414~8'(= a14◂ [ ] ) 
; #74 8'(= a14◂ [ ] ) ⊢ { 3'(= a14◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 8'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 100000001110.. |}
	mov r13,QWORD [rsp-8+8*3]
; mov_ptn2.
	call LB_69
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
	add rsp,24
;; rsp=0 , %418~2'(= {| l |} ) %417~3'(= a14◂ [ ] ) %416~1'(= r ) %415~0'(= r ) 
; #26 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %419~0(<2)◂2'(= {| l |} ) %417~3'(= a14◂ [ ] ) %416~1'(= r ) %415~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .dlt.ptn 3'(= a14◂ [ ] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_80
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
; mov_ptn2.
	jmp LB_68
LB_68:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_60
LB_61:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_60:
; discard r14
	add rsp,8
	ret
ETR_102:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_102
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_102:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_90
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_90
	add r14,1
	jmp LB_89
LB_90:
; .rb_rle 
	add rsp,0
	jmp LB_88
LB_89:
	jmp LB_92
LB_91:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_87
LB_92:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_93
LB_93:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_87
LB_88:
	mov r14,QWORD [rsp] 
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_96
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_96
	add r14,1
	jmp LB_95
LB_96:
; .rb_rle 
	add rsp,0
	jmp LB_94
LB_95:
	call GRM_103
	cmp BYTE [r8+6],0
	jnz LB_98
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_97
LB_98:
; .rb_rle 
	add rsp,0
	jmp LB_94
LB_97:
	call GRM_102
	cmp BYTE [r8+6],0
	jnz LB_100
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_99
LB_100:
; .rb_rle 
	add rsp,8
	jmp LB_94
LB_99:
	jmp LB_102
LB_101:
; .rb_rle 
	add rsp,16
	jmp LB_94
LB_102:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %427~1'(= r ) %426~0'(= r ) %425~9'(= a14◂ [ ] ) %424~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_55
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
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
; mov_ptn2.
	jmp LB_103
LB_103:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_87
LB_94:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_106
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_106
	add r14,1
	jmp LB_105
LB_106:
; .rb_rle 
	add rsp,0
	jmp LB_104
LB_105:
	jmp LB_108
LB_107:
; .rb_rle 
	add rsp,0
	jmp LB_104
LB_108:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_109
LB_109:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_87
LB_104:
	mov r14,QWORD [rsp]
	cmp r14,r9
	jge LB_112
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_111
LB_112:
; .rb_rle 
	add rsp,0
	jmp LB_110
LB_111:
	call GRM_102
	cmp BYTE [r8+6],0
	jnz LB_114
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_113
LB_114:
; .rb_rle 
	add rsp,8
	jmp LB_110
LB_113:
	jmp LB_116
LB_115:
; .rb_rle 
	add rsp,16
	jmp LB_110
LB_116:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %437~1'(= r ) %436~0'(= r ) %435~9'(= a14◂ [ ] ) %434~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_55
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
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
; mov_ptn2.
	jmp LB_117
LB_117:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_87
LB_110:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_87:
; discard r14
	add rsp,8
	ret
ETR_103:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_103
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_103:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_121
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_121
	add r14,1
	jmp LB_120
LB_121:
; .rb_rle 
	add rsp,0
	jmp LB_119
LB_120:
	jmp LB_123
LB_122:
; .rb_rle 
	add rsp,0
	jmp LB_119
LB_123:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_124
LB_124:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_118
LB_119:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_127
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_127
	add r14,1
	jmp LB_126
LB_127:
; .rb_rle 
	add rsp,0
	jmp LB_125
LB_126:
	jmp LB_129
LB_128:
; .rb_rle 
	add rsp,0
	jmp LB_125
LB_129:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_130
LB_130:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_118
LB_125:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_133
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],110
	jnz LB_133
	add r14,1
	jmp LB_132
LB_133:
; .rb_rle 
	add rsp,0
	jmp LB_131
LB_132:
	jmp LB_135
LB_134:
; .rb_rle 
	add rsp,0
	jmp LB_131
LB_135:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_136
LB_136:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_118
LB_131:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_139
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],116
	jnz LB_139
	add r14,1
	jmp LB_138
LB_139:
; .rb_rle 
	add rsp,0
	jmp LB_137
LB_138:
	jmp LB_141
LB_140:
; .rb_rle 
	add rsp,0
	jmp LB_137
LB_141:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_142
LB_142:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_118
LB_137:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_145
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_145
	add r14,1
	jmp LB_144
LB_145:
; .rb_rle 
	add rsp,0
	jmp LB_143
LB_144:
	jmp LB_147
LB_146:
; .rb_rle 
	add rsp,0
	jmp LB_143
LB_147:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_148
LB_148:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_118
LB_143:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_118:
; discard r14
	add rsp,8
	ret
LB_156: ;; #34 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 _r64 })
;; rsp=0 , %2~1'(= r ) %1~0'(= r ) 
;;1'(= r )=<0'(= r )
	cmp r14,r13
	jg LB_159
	jmp LB_158
LB_159:
	jmp LB_157
LB_158:
;; rsp=0 , %2~1'(= r ) %1~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) %[ 1r ] }
; .mov_ptn2 { 0'(= r ) 1'(= r ) %[ 1r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110.. |}
	mov r8,1
; mov_ptn2.
; .add_rsp 0
	ret
LB_157:
;; rsp=0 , %2~1'(= r ) %1~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) %[ 0r ] }
; .mov_ptn2 { 0'(= r ) 1'(= r ) %[ 0r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110.. |}
	mov r8,0
; mov_ptn2.
; .add_rsp 0
	ret
ETR_104:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_104
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_104:
	push r14
	cmp r14,r9
	jge LB_152
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_151
LB_152:
; .rb_rle 
	add rsp,0
	jmp LB_150
LB_151:
	jmp LB_154
LB_153:
; .rb_rle 
	add rsp,8
	jmp LB_150
LB_154:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
	call LB_156
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
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
; mov_ptn2.
	call LB_156
	mov r9,QWORD [rsp-8+8*4]
	mov r10,r8
	mov r8,QWORD [rsp-8+8*3]
	mov r11,r14
	mov r14,QWORD [rsp-8+8*2]
	mov rcx,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %470~4'(= r ) %469~5'(= r ) %468~6'(= r ) %467~2'(= r ) %466~3'(= r ) %462~1'(= r ) %461~0'(= r ) 
	cmp r8,1
	jnz LB_162
	jmp LB_161
LB_162:
	jmp LB_160
LB_161:
	cmp r10,1
	jnz LB_164
	jmp LB_163
LB_164:
	jmp LB_160
LB_163:
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
; mov_ptn2.
	jmp LB_155
LB_160:
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
; mov_ptn2.
	jmp LB_155
LB_155:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_149
LB_150:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_149:
; discard r14
	add rsp,8
	ret
ETR_105:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_105
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_105:
	push r14
	cmp r14,r9
	jge LB_168
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_167
LB_168:
; .rb_rle 
	add rsp,0
	jmp LB_166
LB_167:
	jmp LB_170
LB_169:
; .rb_rle 
	add rsp,8
	jmp LB_166
LB_170:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
	call LB_156
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
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
; mov_ptn2.
	call LB_156
	mov r9,QWORD [rsp-8+8*4]
	mov r10,r8
	mov r8,QWORD [rsp-8+8*3]
	mov r11,r14
	mov r14,QWORD [rsp-8+8*2]
	mov rcx,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %483~4'(= r ) %482~5'(= r ) %481~6'(= r ) %480~2'(= r ) %479~3'(= r ) %475~1'(= r ) %474~0'(= r ) 
	cmp r8,1
	jnz LB_174
	jmp LB_173
LB_174:
	jmp LB_172
LB_173:
	cmp r10,1
	jnz LB_176
	jmp LB_175
LB_176:
	jmp LB_172
LB_175:
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
; mov_ptn2.
	jmp LB_171
LB_172:
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
; mov_ptn2.
	jmp LB_171
LB_171:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_165
LB_166:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_165:
; discard r14
	add rsp,8
	ret
ETR_106:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_106
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_106:
	push r14
	cmp r14,r9
	jge LB_180
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_179
LB_180:
; .rb_rle 
	add rsp,0
	jmp LB_178
LB_179:
	jmp LB_182
LB_181:
; .rb_rle 
	add rsp,8
	jmp LB_178
LB_182:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
	call LB_156
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
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
; mov_ptn2.
	call LB_156
	mov r9,QWORD [rsp-8+8*4]
	mov r10,r8
	mov r8,QWORD [rsp-8+8*3]
	mov r11,r14
	mov r14,QWORD [rsp-8+8*2]
	mov rcx,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %496~4'(= r ) %495~5'(= r ) %494~6'(= r ) %493~2'(= r ) %492~3'(= r ) %488~1'(= r ) %487~0'(= r ) 
	cmp r8,1
	jnz LB_186
	jmp LB_185
LB_186:
	jmp LB_184
LB_185:
	cmp r10,1
	jnz LB_188
	jmp LB_187
LB_188:
	jmp LB_184
LB_187:
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
; mov_ptn2.
	jmp LB_183
LB_184:
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
; mov_ptn2.
	jmp LB_183
LB_183:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_177
LB_178:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_177:
; discard r14
	add rsp,8
	ret
ETR_107:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_107
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_107:
	push r14
	call GRM_106
	cmp BYTE [r8+6],0
	jnz LB_192
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_191
LB_192:
; .rb_rle 
	add rsp,0
	jmp LB_190
LB_191:
	jmp LB_194
LB_193:
; .rb_rle 
	add rsp,8
	jmp LB_190
LB_194:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_195
LB_195:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_189
LB_190:
	mov r14,QWORD [rsp]
	call GRM_105
	cmp BYTE [r8+6],0
	jnz LB_198
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_197
LB_198:
; .rb_rle 
	add rsp,0
	jmp LB_196
LB_197:
	jmp LB_200
LB_199:
; .rb_rle 
	add rsp,8
	jmp LB_196
LB_200:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_201
LB_201:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_189
LB_196:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_189:
; discard r14
	add rsp,8
	ret
ETR_108:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_108
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_108:
	push r14
	call GRM_107
	cmp BYTE [r8+6],0
	jnz LB_205
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_204
LB_205:
; .rb_rle 
	add rsp,0
	jmp LB_203
LB_204:
	call GRM_109
	cmp BYTE [r8+6],0
	jnz LB_207
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_206
LB_207:
; .rb_rle 
	add rsp,8
	jmp LB_203
LB_206:
	jmp LB_209
LB_208:
; .rb_rle 
	add rsp,16
	jmp LB_203
LB_209:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %510~1'(= r ) %509~0'(= r ) %508~9'(= a14◂ [ ] ) %507~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_55
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %511~2'(= a14◂ [ ] ) %510~1'(= r ) %509~0'(= r ) 
; #74 2'(= a14◂ [ ] ) ⊢ { 3'(= a14◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 10100000110.. |}
	mov r13,r8
; mov_ptn2.
	call LB_69
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %513~2'(= {| l |} ) %512~3'(= a14◂ [ ] ) %510~1'(= r ) %509~0'(= r ) 
; #26 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %514~0(<2)◂2'(= {| l |} ) %512~3'(= a14◂ [ ] ) %510~1'(= r ) %509~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .dlt.ptn 3'(= a14◂ [ ] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_80
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
; mov_ptn2.
	jmp LB_210
LB_210:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_202
LB_203:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_202:
; discard r14
	add rsp,8
	ret
ETR_109:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_109
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_109:
	push r14
	call GRM_110
	cmp BYTE [r8+6],0
	jnz LB_214
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_213
LB_214:
; .rb_rle 
	add rsp,0
	jmp LB_212
LB_213:
	call GRM_109
	cmp BYTE [r8+6],0
	jnz LB_216
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_215
LB_216:
; .rb_rle 
	add rsp,8
	jmp LB_212
LB_215:
	jmp LB_218
LB_217:
; .rb_rle 
	add rsp,16
	jmp LB_212
LB_218:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %518~1'(= r ) %517~0'(= r ) %516~9'(= a14◂ [ ] ) %515~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_55
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
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
; mov_ptn2.
	jmp LB_219
LB_219:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_211
LB_212:
	mov r14,QWORD [rsp]
	jmp LB_222
LB_221:
; .rb_rle 
	add rsp,0
	jmp LB_220
LB_222:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_223
LB_223:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_211
LB_220:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_211:
; discard r14
	add rsp,8
	ret
ETR_110:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_110
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_110:
	push r14
	call GRM_107
	cmp BYTE [r8+6],0
	jnz LB_227
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_226
LB_227:
; .rb_rle 
	add rsp,0
	jmp LB_225
LB_226:
	jmp LB_229
LB_228:
; .rb_rle 
	add rsp,8
	jmp LB_225
LB_229:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_230
LB_230:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_224
LB_225:
	mov r14,QWORD [rsp]
	call GRM_104
	cmp BYTE [r8+6],0
	jnz LB_233
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_232
LB_233:
; .rb_rle 
	add rsp,0
	jmp LB_231
LB_232:
	jmp LB_235
LB_234:
; .rb_rle 
	add rsp,8
	jmp LB_231
LB_235:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_236
LB_236:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_224
LB_231:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_239
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_239
	add r14,1
	jmp LB_238
LB_239:
; .rb_rle 
	add rsp,0
	jmp LB_237
LB_238:
	jmp LB_241
LB_240:
; .rb_rle 
	add rsp,0
	jmp LB_237
LB_241:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_242
LB_242:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_224
LB_237:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_224:
; discard r14
	add rsp,8
	ret
ETR_111:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_111
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_111:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_246
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_246
	add r14,1
	jmp LB_245
LB_246:
; .rb_rle 
	add rsp,0
	jmp LB_244
LB_245:
	call GRM_109
	cmp BYTE [r8+6],0
	jnz LB_248
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_247
LB_248:
; .rb_rle 
	add rsp,0
	jmp LB_244
LB_247:
	jmp LB_250
LB_249:
; .rb_rle 
	add rsp,8
	jmp LB_244
LB_250:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %539~1'(= r ) %538~0'(= r ) %537~8'(= a14◂ [ ] ) 
; #74 8'(= a14◂ [ ] ) ⊢ { 3'(= a14◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 8'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 100000001110.. |}
	mov r13,QWORD [rsp-8+8*3]
; mov_ptn2.
	call LB_69
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
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
	lea rsi,[LB_252+1-1]
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
	call LB_80
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
; mov_ptn2.
	jmp LB_251
LB_251:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_243
LB_244:
	mov r14,QWORD [rsp]
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_255
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_254
LB_255:
; .rb_rle 
	add rsp,0
	jmp LB_253
LB_254:
	jmp LB_257
LB_256:
; .rb_rle 
	add rsp,8
	jmp LB_253
LB_257:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_258
LB_258:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_243
LB_253:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_243:
; discard r14
	add rsp,8
	ret
ETR_302:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_302
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_302:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_262
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_262
	add r14,1
	jmp LB_261
LB_262:
; .rb_rle 
	add rsp,0
	jmp LB_260
LB_261:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_268
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],32
	jnz LB_268
	add r14,1
	jmp LB_267
LB_268:
; .rb_rle 
	add rsp,0
	jmp LB_266
LB_267:
	jmp LB_270
LB_269:
; .rb_rle 
	add rsp,0
	jmp LB_266
LB_270:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_271
LB_271:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_265
LB_266:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_274
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],9
	jnz LB_274
	add r14,1
	jmp LB_273
LB_274:
; .rb_rle 
	add rsp,0
	jmp LB_272
LB_273:
	jmp LB_276
LB_275:
; .rb_rle 
	add rsp,0
	jmp LB_272
LB_276:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_277
LB_277:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_265
LB_272:
	mov r14,QWORD [rsp]
	call GRM_303
	cmp BYTE [r8+6],0
	jnz LB_280
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_279
LB_280:
; .rb_rle 
	add rsp,0
	jmp LB_278
LB_279:
	jmp LB_282
LB_281:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_265
LB_282:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_283
LB_283:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_265
LB_278:
	mov r14,QWORD [rsp] 
	jmp LB_286
LB_285:
; .rb_rle 
	add rsp,0
	jmp LB_284
LB_286:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_287
LB_287:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_265
LB_284:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_265:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_263
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1110.. |}
; mov_ptn2.
	jmp LB_264
LB_263:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_259
LB_264:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_288
LB_288:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_259
LB_260:
	mov r14,QWORD [rsp] 
	mov r8,unt_1
LB_259:
; discard r14
	add rsp,8
	ret
ETR_303:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_303
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_303:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_292
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_292
	add r14,1
	jmp LB_291
LB_292:
; .rb_rle 
	add rsp,0
	jmp LB_290
LB_291:
	jmp LB_294
LB_293:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_289
LB_294:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_295
LB_295:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_289
LB_290:
	mov r14,QWORD [rsp] 
	jmp LB_298
LB_297:
; .rb_rle 
	add rsp,0
	jmp LB_296
LB_298:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_299
LB_299:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_289
LB_296:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_289:
; discard r14
	add rsp,8
	ret
ETR_304:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_304
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_304:
	push r14
	jmp LB_303
LB_302:
	add r14,1 
LB_303:
	cmp r14,r9
	jge LB_304
	JZ_LINE_SPC BYTE [r13+8+r14], LB_302
LB_304
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_306
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_305
LB_306:
; .rb_rle 
	add rsp,0
	jmp LB_301
LB_305:
	jmp LB_308
LB_307:
	add r14,1 
LB_308:
	cmp r14,r9
	jge LB_309
	JZ_LINE_SPC BYTE [r13+8+r14], LB_307
LB_309
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_311
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_311
	add r14,1
	jmp LB_310
LB_311:
; .rb_rle 
	add rsp,8
	jmp LB_301
LB_310:
	jmp LB_313
LB_312:
	add r14,1 
LB_313:
	cmp r14,r9
	jge LB_314
	JZ_LINE_SPC BYTE [r13+8+r14], LB_312
LB_314
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_316
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 9'(= a18◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_315
LB_316:
; .rb_rle 
	add rsp,8
	jmp LB_301
LB_315:
	jmp LB_318
LB_317:
; .rb_rle 
	add rsp,16
	jmp LB_301
LB_318:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_319
LB_319:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_300
LB_301:
	mov r14,QWORD [rsp]
	jmp LB_322
LB_321:
	add r14,1 
LB_322:
	cmp r14,r9
	jge LB_323
	JZ_LINE_SPC BYTE [r13+8+r14], LB_321
LB_323
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_325
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_324
LB_325:
; .rb_rle 
	add rsp,0
	jmp LB_320
LB_324:
	jmp LB_327
LB_326:
; .rb_rle 
	add rsp,8
	jmp LB_320
LB_327:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_328
LB_328:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_300
LB_320:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_300:
; discard r14
	add rsp,8
	ret
ETR_305:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_305
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_305:
	push r14
	cmp r14,r9
	jge LB_332
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_332
	add r14,rsi
	push rdi
	jmp LB_331
LB_332:
; .rb_rle 
	add rsp,0
	jmp LB_330
LB_331:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_334
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],114
	jnz LB_334
	add r14,1
	jmp LB_333
LB_334:
; .rb_rle 
	add rsp,8
	jmp LB_330
LB_333:
	jmp LB_336
LB_335:
; .rb_rle 
	add rsp,8
	jmp LB_330
LB_336:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_337
LB_337:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_329
LB_330:
	mov r14,QWORD [rsp]
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_340
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_340
	cmp BYTE [rdi+1],120
	jnz LB_340
	add r14,2
	jmp LB_339
LB_340:
; .rb_rle 
	add rsp,0
	jmp LB_338
LB_339:
	cmp r14,r9
	jge LB_342
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_x
	C_POP_REGS
	cmp rax,0 
	jz LB_342
	jmp LB_341
LB_342:
; .rb_rle 
	add rsp,0
	jmp LB_338
LB_341:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_344
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],114
	jnz LB_344
	add r14,1
	jmp LB_343
LB_344:
; .rb_rle 
	add rsp,8
	jmp LB_338
LB_343:
	jmp LB_346
LB_345:
; .rb_rle 
	add rsp,8
	jmp LB_338
LB_346:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_347
LB_347:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_329
LB_338:
	mov r14,QWORD [rsp]
	call GRM_101
	cmp BYTE [r8+6],0
	jnz LB_350
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_349
LB_350:
; .rb_rle 
	add rsp,0
	jmp LB_348
LB_349:
	jmp LB_352
LB_351:
; .rb_rle 
	add rsp,8
	jmp LB_348
LB_352:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_353
LB_353:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_329
LB_348:
	mov r14,QWORD [rsp]
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_356
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_355
LB_356:
; .rb_rle 
	add rsp,0
	jmp LB_354
LB_355:
	jmp LB_358
LB_357:
; .rb_rle 
	add rsp,8
	jmp LB_354
LB_358:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_359
LB_359:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_329
LB_354:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_329:
; discard r14
	add rsp,8
	ret
ETR_306:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_306
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_306:
	push r14
	jmp LB_363
LB_362:
	add r14,1 
LB_363:
	cmp r14,r9
	jge LB_364
	JZ_LINE_SPC BYTE [r13+8+r14], LB_362
LB_364
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_366
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_366
	add r14,1
	jmp LB_365
LB_366:
; .rb_rle 
	add rsp,0
	jmp LB_361
LB_365:
	jmp LB_368
LB_367:
	add r14,1 
LB_368:
	cmp r14,r9
	jge LB_369
	JZ_LINE_SPC BYTE [r13+8+r14], LB_367
LB_369
	call GRM_307
	cmp BYTE [r8+6],0
	jnz LB_371
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_370
LB_371:
; .rb_rle 
	add rsp,0
	jmp LB_361
LB_370:
	jmp LB_373
LB_372:
; .rb_rle 
	add rsp,0
	jmp LB_361
LB_373:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1789~1'(= r ) %1788~0'(= r ) %1787~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1790~0(<2)◂{ } %1789~1'(= r ) %1788~0'(= r ) %1787~{ } 
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
; mov_ptn2.
	jmp LB_374
LB_374:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_360
LB_361:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_360:
; discard r14
	add rsp,8
	ret
ETR_307:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_307
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_307:
	push r14
	jmp LB_378
LB_377:
	add r14,1 
LB_378:
	cmp r14,r9
	jge LB_379
	JZ_LINE_SPC BYTE [r13+8+r14], LB_377
LB_379
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_381
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_381
	add r14,1
	jmp LB_380
LB_381:
; .rb_rle 
	add rsp,0
	jmp LB_376
LB_380:
	jmp LB_383
LB_382:
	add r14,1 
LB_383:
	cmp r14,r9
	jge LB_384
	JZ_LINE_SPC BYTE [r13+8+r14], LB_382
LB_384
	call GRM_307
	cmp BYTE [r8+6],0
	jnz LB_386
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_385
LB_386:
; .rb_rle 
	add rsp,0
	jmp LB_376
LB_385:
	jmp LB_388
LB_387:
; .rb_rle 
	add rsp,0
	jmp LB_376
LB_388:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1793~1'(= r ) %1792~0'(= r ) %1791~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1794~0(<2)◂{ } %1793~1'(= r ) %1792~0'(= r ) %1791~{ } 
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
; mov_ptn2.
	jmp LB_389
LB_389:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_375
LB_376:
	mov r14,QWORD [rsp]
	jmp LB_392
LB_391:
; .rb_rle 
	add rsp,0
	jmp LB_390
LB_392:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1796~1'(= r ) %1795~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1797~0(<2)◂{ } %1796~1'(= r ) %1795~0'(= r ) 
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
; mov_ptn2.
	jmp LB_393
LB_393:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_375
LB_390:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_375:
; discard r14
	add rsp,8
	ret
ETR_314:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_314
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_314:
	push r14
	jmp LB_397
LB_396:
	add r14,1 
LB_397:
	cmp r14,r9
	jge LB_398
	JZ_LINE_SPC BYTE [r13+8+r14], LB_396
LB_398
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_400
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_400
	add r14,1
	jmp LB_399
LB_400:
; .rb_rle 
	add rsp,0
	jmp LB_395
LB_399:
	jmp LB_402
LB_401:
	add r14,1 
LB_402:
	cmp r14,r9
	jge LB_403
	JZ_LINE_SPC BYTE [r13+8+r14], LB_401
LB_403
	call GRM_315
	cmp BYTE [r8+6],0
	jnz LB_405
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_404
LB_405:
; .rb_rle 
	add rsp,0
	jmp LB_395
LB_404:
	jmp LB_407
LB_406:
	add r14,1 
LB_407:
	cmp r14,r9
	jge LB_408
	JZ_LINE_SPC BYTE [r13+8+r14], LB_406
LB_408
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_410
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_410
	add r14,1
	jmp LB_409
LB_410:
; .rb_rle 
	add rsp,8
	jmp LB_395
LB_409:
	jmp LB_412
LB_411:
; .rb_rle 
	add rsp,8
	jmp LB_395
LB_412:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1842~1'(= r ) %1841~0'(= r ) %1840~8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) 
; #113 8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
;; rsp=1 , %1843~0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) %1842~1'(= r ) %1841~0'(= r ) 
; #26 0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
;; rsp=1 , %1844~0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) %1842~1'(= r ) %1841~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_413
LB_413:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_394
LB_395:
	mov r14,QWORD [rsp]
	jmp LB_416
LB_415:
	add r14,1 
LB_416:
	cmp r14,r9
	jge LB_417
	JZ_LINE_SPC BYTE [r13+8+r14], LB_415
LB_417
	call GRM_317
	cmp BYTE [r8+6],0
	jnz LB_419
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a26◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_418
LB_419:
; .rb_rle 
	add rsp,0
	jmp LB_414
LB_418:
	jmp LB_421
LB_420:
; .rb_rle 
	add rsp,8
	jmp LB_414
LB_421:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1847~1'(= r ) %1846~0'(= r ) %1845~8'(= a26◂ [ a18◂ [ ]{| l |}] ) 
; #112 8'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %1848~1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] ) %1847~1'(= r ) %1846~0'(= r ) 
; #26 1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %1849~0(<2)◂1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] ) %1847~1'(= r ) %1846~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_422
LB_422:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_394
LB_414:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_394:
; discard r14
	add rsp,8
	ret
ETR_315:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_315
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_315:
	push r14
	jmp LB_426
LB_425:
	add r14,1 
LB_426:
	cmp r14,r9
	jge LB_427
	JZ_LINE_SPC BYTE [r13+8+r14], LB_425
LB_427
	call GRM_314
	cmp BYTE [r8+6],0
	jnz LB_429
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_428
LB_429:
; .rb_rle 
	add rsp,0
	jmp LB_424
LB_428:
	jmp LB_431
LB_430:
	add r14,1 
LB_431:
	cmp r14,r9
	jge LB_432
	JZ_LINE_SPC BYTE [r13+8+r14], LB_430
LB_432
	call GRM_315
	cmp BYTE [r8+6],0
	jnz LB_434
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_433
LB_434:
; .rb_rle 
	add rsp,8
	jmp LB_424
LB_433:
	jmp LB_436
LB_435:
; .rb_rle 
	add rsp,16
	jmp LB_424
LB_436:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1853~1'(= r ) %1852~0'(= r ) %1851~9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) %1850~8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 
; #25 { 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1854~0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } %1853~1'(= r ) %1852~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1855~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } %1853~1'(= r ) %1852~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_437
LB_437:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_423
LB_424:
	mov r14,QWORD [rsp]
	jmp LB_440
LB_439:
; .rb_rle 
	add rsp,0
	jmp LB_438
LB_440:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1857~1'(= r ) %1856~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1858~1(<2)◂{ } %1857~1'(= r ) %1856~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1859~0(<2)◂1(<2)◂{ } %1857~1'(= r ) %1856~0'(= r ) 
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
; mov_ptn2.
	jmp LB_441
LB_441:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_423
LB_438:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_423:
; discard r14
	add rsp,8
	ret
ETR_316:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_316
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_316:
	push r14
	jmp LB_445
LB_444:
	add r14,1 
LB_445:
	cmp r14,r9
	jge LB_446
	JZ_LINE_SPC BYTE [r13+8+r14], LB_444
LB_446
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_448
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_448
	add r14,1
	jmp LB_447
LB_448:
; .rb_rle 
	add rsp,0
	jmp LB_443
LB_447:
	jmp LB_450
LB_449:
	add r14,1 
LB_450:
	cmp r14,r9
	jge LB_451
	JZ_LINE_SPC BYTE [r13+8+r14], LB_449
LB_451
	call GRM_317
	cmp BYTE [r8+6],0
	jnz LB_453
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a26◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_452
LB_453:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_442
LB_452:
	jmp LB_455
LB_454:
	add r14,1 
LB_455:
	cmp r14,r9
	jge LB_456
	JZ_LINE_SPC BYTE [r13+8+r14], LB_454
LB_456
	call GRM_316
	cmp BYTE [r8+6],0
	jnz LB_458
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_457
LB_458:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_442
LB_457:
	jmp LB_460
LB_459:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_442
LB_460:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1863~1'(= r ) %1862~0'(= r ) %1861~9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %1860~8'(= a26◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1864~0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %1863~1'(= r ) %1862~0'(= r ) 
; #26 0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1865~0(<2)◂0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %1863~1'(= r ) %1862~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_461
LB_461:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_442
LB_443:
	mov r14,QWORD [rsp] 
	jmp LB_464
LB_463:
; .rb_rle 
	add rsp,0
	jmp LB_462
LB_464:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1867~1'(= r ) %1866~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1868~1(<2)◂{ } %1867~1'(= r ) %1866~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1869~0(<2)◂1(<2)◂{ } %1867~1'(= r ) %1866~0'(= r ) 
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
; mov_ptn2.
	jmp LB_465
LB_465:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_442
LB_462:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_442:
; discard r14
	add rsp,8
	ret
ETR_317:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_317
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_317:
	push r14
	jmp LB_469
LB_468:
	add r14,1 
LB_469:
	cmp r14,r9
	jge LB_470
	JZ_LINE_SPC BYTE [r13+8+r14], LB_468
LB_470
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_472
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_471
LB_472:
; .rb_rle 
	add rsp,0
	jmp LB_467
LB_471:
	jmp LB_474
LB_473:
	add r14,1 
LB_474:
	cmp r14,r9
	jge LB_475
	JZ_LINE_SPC BYTE [r13+8+r14], LB_473
LB_475
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_477
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_477
	cmp BYTE [rdi+1],151
	jnz LB_477
	cmp BYTE [rdi+2],130
	jnz LB_477
	add r14,3
	jmp LB_476
LB_477:
; .rb_rle 
	add rsp,8
	jmp LB_467
LB_476:
	jmp LB_479
LB_478:
	add r14,1 
LB_479:
	cmp r14,r9
	jge LB_480
	JZ_LINE_SPC BYTE [r13+8+r14], LB_478
LB_480
	call GRM_314
	cmp BYTE [r8+6],0
	jnz LB_482
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_481
LB_482:
; .rb_rle 
	add rsp,8
	jmp LB_467
LB_481:
	jmp LB_484
LB_483:
; .rb_rle 
	add rsp,16
	jmp LB_467
LB_484:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1873~1'(= r ) %1872~0'(= r ) %1871~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %1870~8'(= a18◂ [ ] ) 
; #189 { 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1874~0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %1873~1'(= r ) %1872~0'(= r ) 
; #26 0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1875~0(<2)◂0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %1873~1'(= r ) %1872~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_485
LB_485:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_466
LB_467:
	mov r14,QWORD [rsp]
	jmp LB_488
LB_487:
	add r14,1 
LB_488:
	cmp r14,r9
	jge LB_489
	JZ_LINE_SPC BYTE [r13+8+r14], LB_487
LB_489
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_491
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_491
	cmp BYTE [rdi+1],91
	jnz LB_491
	add r14,2
	jmp LB_490
LB_491:
; .rb_rle 
	add rsp,0
	jmp LB_486
LB_490:
	jmp LB_493
LB_492:
	add r14,1 
LB_493:
	cmp r14,r9
	jge LB_494
	JZ_LINE_SPC BYTE [r13+8+r14], LB_492
LB_494
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_496
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_495
LB_496:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_466
LB_495:
	jmp LB_498
LB_497:
	add r14,1 
LB_498:
	cmp r14,r9
	jge LB_499
	JZ_LINE_SPC BYTE [r13+8+r14], LB_497
LB_499
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_501
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],93
	jnz LB_501
	add r14,1
	jmp LB_500
LB_501:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_466
LB_500:
	jmp LB_503
LB_502:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_466
LB_503:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1878~1'(= r ) %1877~0'(= r ) %1876~8'(= a27◂ [ a18◂ [ ]] ) 
; #188 8'(= a27◂ [ a18◂ [ ]] ) ⊢ 1(<4)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %1879~1(<4)◂8'(= a27◂ [ a18◂ [ ]] ) %1878~1'(= r ) %1877~0'(= r ) 
; #26 1(<4)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂1(<4)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %1880~0(<2)◂1(<4)◂8'(= a27◂ [ a18◂ [ ]] ) %1878~1'(= r ) %1877~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_504
LB_504:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_466
LB_486:
	mov r14,QWORD [rsp] 
	jmp LB_507
LB_506:
	add r14,1 
LB_507:
	cmp r14,r9
	jge LB_508
	JZ_LINE_SPC BYTE [r13+8+r14], LB_506
LB_508
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_510
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_510
	add r14,1
	jmp LB_509
LB_510:
; .rb_rle 
	add rsp,0
	jmp LB_505
LB_509:
	jmp LB_512
LB_511:
	add r14,1 
LB_512:
	cmp r14,r9
	jge LB_513
	JZ_LINE_SPC BYTE [r13+8+r14], LB_511
LB_513
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_515
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_514
LB_515:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_466
LB_514:
	jmp LB_517
LB_516:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_466
LB_517:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1883~1'(= r ) %1882~0'(= r ) %1881~8'(= {| l |} ) 
; #186 8'(= {| l |} ) ⊢ 3(<4)◂8'(= {| l |} )
;; rsp=1 , %1884~3(<4)◂8'(= {| l |} ) %1883~1'(= r ) %1882~0'(= r ) 
; #26 3(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂3(<4)◂8'(= {| l |} )
;; rsp=1 , %1885~0(<2)◂3(<4)◂8'(= {| l |} ) %1883~1'(= r ) %1882~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_518
LB_518:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_466
LB_505:
	mov r14,QWORD [rsp] 
	jmp LB_521
LB_520:
	add r14,1 
LB_521:
	cmp r14,r9
	jge LB_522
	JZ_LINE_SPC BYTE [r13+8+r14], LB_520
LB_522
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_524
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_523
LB_524:
; .rb_rle 
	add rsp,0
	jmp LB_519
LB_523:
	jmp LB_526
LB_525:
; .rb_rle 
	add rsp,8
	jmp LB_519
LB_526:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1888~1'(= r ) %1887~0'(= r ) %1886~8'(= {| l |} ) 
; #186 8'(= {| l |} ) ⊢ 3(<4)◂8'(= {| l |} )
;; rsp=1 , %1889~3(<4)◂8'(= {| l |} ) %1888~1'(= r ) %1887~0'(= r ) 
; #26 3(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂3(<4)◂8'(= {| l |} )
;; rsp=1 , %1890~0(<2)◂3(<4)◂8'(= {| l |} ) %1888~1'(= r ) %1887~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_527
LB_527:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_466
LB_519:
	mov r14,QWORD [rsp]
	jmp LB_530
LB_529:
	add r14,1 
LB_530:
	cmp r14,r9
	jge LB_531
	JZ_LINE_SPC BYTE [r13+8+r14], LB_529
LB_531
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_533
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_533
	add r14,1
	jmp LB_532
LB_533:
; .rb_rle 
	add rsp,0
	jmp LB_528
LB_532:
	jmp LB_535
LB_534:
; .rb_rle 
	add rsp,0
	jmp LB_528
LB_535:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1892~1'(= r ) %1891~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1893~1(<2)◂{ } %1892~1'(= r ) %1891~0'(= r ) 
; #187 1(<2)◂{ } ⊢ 2(<4)◂1(<2)◂{ }
;; rsp=0 , %1894~2(<4)◂1(<2)◂{ } %1892~1'(= r ) %1891~0'(= r ) 
; #26 2(<4)◂1(<2)◂{ } ⊢ 0(<2)◂2(<4)◂1(<2)◂{ }
;; rsp=0 , %1895~0(<2)◂2(<4)◂1(<2)◂{ } %1892~1'(= r ) %1891~0'(= r ) 
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
; mov_ptn2.
	jmp LB_536
LB_536:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_466
LB_528:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_466:
; discard r14
	add rsp,8
	ret
ETR_318:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_318
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_318:
	push r14
	jmp LB_540
LB_539:
	add r14,1 
LB_540:
	cmp r14,r9
	jge LB_541
	JZ_LINE_SPC BYTE [r13+8+r14], LB_539
LB_541
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_543
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_543
	add r14,1
	jmp LB_542
LB_543:
; .rb_rle 
	add rsp,0
	jmp LB_538
LB_542:
	jmp LB_545
LB_544:
	add r14,1 
LB_545:
	cmp r14,r9
	jge LB_546
	JZ_LINE_SPC BYTE [r13+8+r14], LB_544
LB_546
	call GRM_319
	cmp BYTE [r8+6],0
	jnz LB_548
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_547
LB_548:
; .rb_rle 
	add rsp,0
	jmp LB_538
LB_547:
	jmp LB_550
LB_549:
	add r14,1 
LB_550:
	cmp r14,r9
	jge LB_551
	JZ_LINE_SPC BYTE [r13+8+r14], LB_549
LB_551
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_553
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_553
	add r14,1
	jmp LB_552
LB_553:
; .rb_rle 
	add rsp,8
	jmp LB_538
LB_552:
	jmp LB_555
LB_554:
; .rb_rle 
	add rsp,8
	jmp LB_538
LB_555:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1898~1'(= r ) %1897~0'(= r ) %1896~8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) 
; #113 8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
;; rsp=1 , %1899~0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) %1898~1'(= r ) %1897~0'(= r ) 
; #26 0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
;; rsp=1 , %1900~0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) %1898~1'(= r ) %1897~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_556
LB_556:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_537
LB_538:
	mov r14,QWORD [rsp]
	jmp LB_559
LB_558:
	add r14,1 
LB_559:
	cmp r14,r9
	jge LB_560
	JZ_LINE_SPC BYTE [r13+8+r14], LB_558
LB_560
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_562
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a24◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_561
LB_562:
; .rb_rle 
	add rsp,0
	jmp LB_557
LB_561:
	jmp LB_564
LB_563:
; .rb_rle 
	add rsp,8
	jmp LB_557
LB_564:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1903~1'(= r ) %1902~0'(= r ) %1901~8'(= a24◂ [ a18◂ [ ]{| l |}] ) 
; #112 8'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %1904~1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] ) %1903~1'(= r ) %1902~0'(= r ) 
; #26 1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %1905~0(<2)◂1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] ) %1903~1'(= r ) %1902~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_565
LB_565:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_537
LB_557:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_537:
; discard r14
	add rsp,8
	ret
ETR_319:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_319
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_319:
	push r14
	jmp LB_569
LB_568:
	add r14,1 
LB_569:
	cmp r14,r9
	jge LB_570
	JZ_LINE_SPC BYTE [r13+8+r14], LB_568
LB_570
	call GRM_318
	cmp BYTE [r8+6],0
	jnz LB_572
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_571
LB_572:
; .rb_rle 
	add rsp,0
	jmp LB_567
LB_571:
	jmp LB_574
LB_573:
	add r14,1 
LB_574:
	cmp r14,r9
	jge LB_575
	JZ_LINE_SPC BYTE [r13+8+r14], LB_573
LB_575
	call GRM_319
	cmp BYTE [r8+6],0
	jnz LB_577
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_576
LB_577:
; .rb_rle 
	add rsp,8
	jmp LB_567
LB_576:
	jmp LB_579
LB_578:
; .rb_rle 
	add rsp,16
	jmp LB_567
LB_579:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1909~1'(= r ) %1908~0'(= r ) %1907~9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) %1906~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #25 { 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1910~0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } %1909~1'(= r ) %1908~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1911~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } %1909~1'(= r ) %1908~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_580
LB_580:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_566
LB_567:
	mov r14,QWORD [rsp]
	jmp LB_583
LB_582:
; .rb_rle 
	add rsp,0
	jmp LB_581
LB_583:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1913~1'(= r ) %1912~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1914~1(<2)◂{ } %1913~1'(= r ) %1912~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1915~0(<2)◂1(<2)◂{ } %1913~1'(= r ) %1912~0'(= r ) 
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
; mov_ptn2.
	jmp LB_584
LB_584:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_566
LB_581:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_566:
; discard r14
	add rsp,8
	ret
ETR_320:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_320
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_320:
	push r14
	jmp LB_588
LB_587:
	add r14,1 
LB_588:
	cmp r14,r9
	jge LB_589
	JZ_LINE_SPC BYTE [r13+8+r14], LB_587
LB_589
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_591
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_591
	add r14,1
	jmp LB_590
LB_591:
; .rb_rle 
	add rsp,0
	jmp LB_586
LB_590:
	jmp LB_593
LB_592:
	add r14,1 
LB_593:
	cmp r14,r9
	jge LB_594
	JZ_LINE_SPC BYTE [r13+8+r14], LB_592
LB_594
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_596
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a24◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_595
LB_596:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_585
LB_595:
	jmp LB_598
LB_597:
	add r14,1 
LB_598:
	cmp r14,r9
	jge LB_599
	JZ_LINE_SPC BYTE [r13+8+r14], LB_597
LB_599
	call GRM_320
	cmp BYTE [r8+6],0
	jnz LB_601
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_600
LB_601:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_585
LB_600:
	jmp LB_603
LB_602:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_585
LB_603:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1919~1'(= r ) %1918~0'(= r ) %1917~9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %1916~8'(= a24◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1920~0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %1919~1'(= r ) %1918~0'(= r ) 
; #26 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1921~0(<2)◂0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %1919~1'(= r ) %1918~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_604
LB_604:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_585
LB_586:
	mov r14,QWORD [rsp] 
	jmp LB_607
LB_606:
; .rb_rle 
	add rsp,0
	jmp LB_605
LB_607:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1923~1'(= r ) %1922~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1924~1(<2)◂{ } %1923~1'(= r ) %1922~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1925~0(<2)◂1(<2)◂{ } %1923~1'(= r ) %1922~0'(= r ) 
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
; mov_ptn2.
	jmp LB_608
LB_608:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_585
LB_605:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_585:
; discard r14
	add rsp,8
	ret
ETR_321:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_321
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_321:
	push r14
	jmp LB_612
LB_611:
	add r14,1 
LB_612:
	cmp r14,r9
	jge LB_613
	JZ_LINE_SPC BYTE [r13+8+r14], LB_611
LB_613
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_615
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_615
	cmp BYTE [rdi+1],91
	jnz LB_615
	add r14,2
	jmp LB_614
LB_615:
; .rb_rle 
	add rsp,0
	jmp LB_610
LB_614:
	jmp LB_617
LB_616:
	add r14,1 
LB_617:
	cmp r14,r9
	jge LB_618
	JZ_LINE_SPC BYTE [r13+8+r14], LB_616
LB_618
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_620
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_619
LB_620:
; .rb_rle 
	add rsp,0
	jmp LB_610
LB_619:
	jmp LB_622
LB_621:
	add r14,1 
LB_622:
	cmp r14,r9
	jge LB_623
	JZ_LINE_SPC BYTE [r13+8+r14], LB_621
LB_623
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_625
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],93
	jnz LB_625
	add r14,1
	jmp LB_624
LB_625:
; .rb_rle 
	add rsp,8
	jmp LB_610
LB_624:
	jmp LB_627
LB_626:
; .rb_rle 
	add rsp,8
	jmp LB_610
LB_627:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1928~1'(= r ) %1927~0'(= r ) %1926~8'(= a27◂ [ a18◂ [ ]] ) 
; #193 8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %1929~0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) %1928~1'(= r ) %1927~0'(= r ) 
; #26 0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %1930~0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) %1928~1'(= r ) %1927~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_628
LB_628:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_609
LB_610:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_631
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_631
	add r14,1
	jmp LB_630
LB_631:
; .rb_rle 
	add rsp,0
	jmp LB_629
LB_630:
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_633
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_632
LB_633:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_609
LB_632:
	jmp LB_635
LB_634:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_609
LB_635:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1933~1'(= r ) %1932~0'(= r ) %1931~8'(= {| l |} ) 
; #192 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1934~1(<2)◂8'(= {| l |} ) %1933~1'(= r ) %1932~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1935~0(<2)◂1(<2)◂8'(= {| l |} ) %1933~1'(= r ) %1932~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_636
LB_636:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_609
LB_629:
	mov r14,QWORD [rsp] 
	jmp LB_639
LB_638:
	add r14,1 
LB_639:
	cmp r14,r9
	jge LB_640
	JZ_LINE_SPC BYTE [r13+8+r14], LB_638
LB_640
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_642
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_641
LB_642:
; .rb_rle 
	add rsp,0
	jmp LB_637
LB_641:
	jmp LB_644
LB_643:
; .rb_rle 
	add rsp,8
	jmp LB_637
LB_644:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1938~1'(= r ) %1937~0'(= r ) %1936~8'(= {| l |} ) 
; #192 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1939~1(<2)◂8'(= {| l |} ) %1938~1'(= r ) %1937~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1940~0(<2)◂1(<2)◂8'(= {| l |} ) %1938~1'(= r ) %1937~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_645
LB_645:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_609
LB_637:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_609:
; discard r14
	add rsp,8
	ret
ETR_322:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_322
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_322:
	push r14
	jmp LB_649
LB_648:
	add r14,1 
LB_649:
	cmp r14,r9
	jge LB_650
	JZ_LINE_SPC BYTE [r13+8+r14], LB_648
LB_650
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_652
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_652
	add r14,1
	jmp LB_651
LB_652:
; .rb_rle 
	add rsp,0
	jmp LB_647
LB_651:
	jmp LB_654
LB_653:
	add r14,1 
LB_654:
	cmp r14,r9
	jge LB_655
	JZ_LINE_SPC BYTE [r13+8+r14], LB_653
LB_655
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_657
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_656
LB_657:
; .rb_rle 
	add rsp,0
	jmp LB_647
LB_656:
	jmp LB_659
LB_658:
	add r14,1 
LB_659:
	cmp r14,r9
	jge LB_660
	JZ_LINE_SPC BYTE [r13+8+r14], LB_658
LB_660
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_662
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_662
	add r14,1
	jmp LB_661
LB_662:
; .rb_rle 
	add rsp,8
	jmp LB_647
LB_661:
	jmp LB_664
LB_663:
; .rb_rle 
	add rsp,8
	jmp LB_647
LB_664:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1943~1'(= r ) %1942~0'(= r ) %1941~8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) 
; #113 8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
;; rsp=1 , %1944~0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %1943~1'(= r ) %1942~0'(= r ) 
; #26 0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
;; rsp=1 , %1945~0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %1943~1'(= r ) %1942~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_665
LB_665:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_646
LB_647:
	mov r14,QWORD [rsp]
	jmp LB_668
LB_667:
	add r14,1 
LB_668:
	cmp r14,r9
	jge LB_669
	JZ_LINE_SPC BYTE [r13+8+r14], LB_667
LB_669
	call GRM_326
	cmp BYTE [r8+6],0
	jnz LB_671
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a25◂ [ {| l |}] ) ⊢ 8'(= a25◂ [ {| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_670
LB_671:
; .rb_rle 
	add rsp,0
	jmp LB_666
LB_670:
	jmp LB_673
LB_672:
; .rb_rle 
	add rsp,8
	jmp LB_666
LB_673:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1948~1'(= r ) %1947~0'(= r ) %1946~8'(= a25◂ [ {| l |}] ) 
; #112 8'(= a25◂ [ {| l |}] ) ⊢ 1(<2)◂8'(= a25◂ [ {| l |}] )
;; rsp=1 , %1949~1(<2)◂8'(= a25◂ [ {| l |}] ) %1948~1'(= r ) %1947~0'(= r ) 
; #26 1(<2)◂8'(= a25◂ [ {| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a25◂ [ {| l |}] )
;; rsp=1 , %1950~0(<2)◂1(<2)◂8'(= a25◂ [ {| l |}] ) %1948~1'(= r ) %1947~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_674
LB_674:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_646
LB_666:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_646:
; discard r14
	add rsp,8
	ret
ETR_323:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_323
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_323:
	push r14
	jmp LB_678
LB_677:
	add r14,1 
LB_678:
	cmp r14,r9
	jge LB_679
	JZ_LINE_SPC BYTE [r13+8+r14], LB_677
LB_679
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_681
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_680
LB_681:
; .rb_rle 
	add rsp,0
	jmp LB_676
LB_680:
	jmp LB_683
LB_682:
	add r14,1 
LB_683:
	cmp r14,r9
	jge LB_684
	JZ_LINE_SPC BYTE [r13+8+r14], LB_682
LB_684
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_686
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_685
LB_686:
; .rb_rle 
	add rsp,8
	jmp LB_676
LB_685:
	jmp LB_688
LB_687:
; .rb_rle 
	add rsp,16
	jmp LB_676
LB_688:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1954~1'(= r ) %1953~0'(= r ) %1952~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %1951~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #25 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=2 , %1955~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %1954~1'(= r ) %1953~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=2 , %1956~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %1954~1'(= r ) %1953~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_689
LB_689:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_675
LB_676:
	mov r14,QWORD [rsp]
	jmp LB_692
LB_691:
; .rb_rle 
	add rsp,0
	jmp LB_690
LB_692:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1958~1'(= r ) %1957~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1959~1(<2)◂{ } %1958~1'(= r ) %1957~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1960~0(<2)◂1(<2)◂{ } %1958~1'(= r ) %1957~0'(= r ) 
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
; mov_ptn2.
	jmp LB_693
LB_693:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_675
LB_690:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_675:
; discard r14
	add rsp,8
	ret
ETR_324:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_324
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_324:
	push r14
	jmp LB_697
LB_696:
	add r14,1 
LB_697:
	cmp r14,r9
	jge LB_698
	JZ_LINE_SPC BYTE [r13+8+r14], LB_696
LB_698
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_700
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_700
	add r14,1
	jmp LB_699
LB_700:
; .rb_rle 
	add rsp,0
	jmp LB_695
LB_699:
	jmp LB_702
LB_701:
	add r14,1 
LB_702:
	cmp r14,r9
	jge LB_703
	JZ_LINE_SPC BYTE [r13+8+r14], LB_701
LB_703
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_705
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_704
LB_705:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_694
LB_704:
	jmp LB_707
LB_706:
	add r14,1 
LB_707:
	cmp r14,r9
	jge LB_708
	JZ_LINE_SPC BYTE [r13+8+r14], LB_706
LB_708
	call GRM_324
	cmp BYTE [r8+6],0
	jnz LB_710
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_709
LB_710:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_694
LB_709:
	jmp LB_712
LB_711:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_694
LB_712:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1964~1'(= r ) %1963~0'(= r ) %1962~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %1961~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #25 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=2 , %1965~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %1964~1'(= r ) %1963~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=2 , %1966~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %1964~1'(= r ) %1963~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_713
LB_713:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_694
LB_695:
	mov r14,QWORD [rsp] 
	jmp LB_716
LB_715:
; .rb_rle 
	add rsp,0
	jmp LB_714
LB_716:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1968~1'(= r ) %1967~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1969~1(<2)◂{ } %1968~1'(= r ) %1967~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1970~0(<2)◂1(<2)◂{ } %1968~1'(= r ) %1967~0'(= r ) 
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
; mov_ptn2.
	jmp LB_717
LB_717:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_694
LB_714:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_694:
; discard r14
	add rsp,8
	ret
ETR_325:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_325
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_325:
	push r14
	jmp LB_721
LB_720:
	add r14,1 
LB_721:
	cmp r14,r9
	jge LB_722
	JZ_LINE_SPC BYTE [r13+8+r14], LB_720
LB_722
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_724
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_724
	add r14,1
	jmp LB_723
LB_724:
; .rb_rle 
	add rsp,0
	jmp LB_719
LB_723:
	jmp LB_726
LB_725:
	add r14,1 
LB_726:
	cmp r14,r9
	jge LB_727
	JZ_LINE_SPC BYTE [r13+8+r14], LB_725
LB_727
	call GRM_326
	cmp BYTE [r8+6],0
	jnz LB_729
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a25◂ [ {| l |}] ) ⊢ 8'(= a25◂ [ {| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_728
LB_729:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_718
LB_728:
	jmp LB_731
LB_730:
	add r14,1 
LB_731:
	cmp r14,r9
	jge LB_732
	JZ_LINE_SPC BYTE [r13+8+r14], LB_730
LB_732
	call GRM_325
	cmp BYTE [r8+6],0
	jnz LB_734
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a25◂ [ {| l |}]] ) ⊢ 9'(= a2◂ [ a25◂ [ {| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_733
LB_734:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_718
LB_733:
	jmp LB_736
LB_735:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_718
LB_736:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1974~1'(= r ) %1973~0'(= r ) %1972~9'(= a2◂ [ a25◂ [ {| l |}]] ) %1971~8'(= a25◂ [ {| l |}] ) 
; #25 { 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=2 , %1975~0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } %1974~1'(= r ) %1973~0'(= r ) 
; #26 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=2 , %1976~0(<2)◂0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } %1974~1'(= r ) %1973~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_737
LB_737:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_718
LB_719:
	mov r14,QWORD [rsp] 
	jmp LB_740
LB_739:
; .rb_rle 
	add rsp,0
	jmp LB_738
LB_740:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1978~1'(= r ) %1977~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1979~1(<2)◂{ } %1978~1'(= r ) %1977~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1980~0(<2)◂1(<2)◂{ } %1978~1'(= r ) %1977~0'(= r ) 
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
; mov_ptn2.
	jmp LB_741
LB_741:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_718
LB_738:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_718:
; discard r14
	add rsp,8
	ret
ETR_326:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_326
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_326:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_745
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_745
	add r14,1
	jmp LB_744
LB_745:
; .rb_rle 
	add rsp,0
	jmp LB_743
LB_744:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_747
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_746
LB_747:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_742
LB_746:
	jmp LB_749
LB_748:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_742
LB_749:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1983~1'(= r ) %1982~0'(= r ) %1981~8'(= {| l |} ) 
; #190 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1984~1(<2)◂8'(= {| l |} ) %1983~1'(= r ) %1982~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1985~0(<2)◂1(<2)◂8'(= {| l |} ) %1983~1'(= r ) %1982~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_750
LB_750:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_742
LB_743:
	mov r14,QWORD [rsp] 
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_753
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_752
LB_753:
; .rb_rle 
	add rsp,0
	jmp LB_751
LB_752:
	jmp LB_755
LB_754:
; .rb_rle 
	add rsp,8
	jmp LB_751
LB_755:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1988~1'(= r ) %1987~0'(= r ) %1986~8'(= {| l |} ) 
; #190 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1989~1(<2)◂8'(= {| l |} ) %1988~1'(= r ) %1987~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1990~0(<2)◂1(<2)◂8'(= {| l |} ) %1988~1'(= r ) %1987~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_756
LB_756:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_742
LB_751:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_759
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_759
	add r14,1
	jmp LB_758
LB_759:
; .rb_rle 
	add rsp,0
	jmp LB_757
LB_758:
	jmp LB_761
LB_760:
; .rb_rle 
	add rsp,0
	jmp LB_757
LB_761:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1992~1'(= r ) %1991~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1993~1(<2)◂{ } %1992~1'(= r ) %1991~0'(= r ) 
; #191 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1994~0(<2)◂1(<2)◂{ } %1992~1'(= r ) %1991~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %1995~0(<2)◂0(<2)◂1(<2)◂{ } %1992~1'(= r ) %1991~0'(= r ) 
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
; mov_ptn2.
	jmp LB_762
LB_762:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_742
LB_757:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_742:
; discard r14
	add rsp,8
	ret
LB_783: ;; #301 { 0'(= a34◂ [ ] ) 1'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0'(= a34◂ [ ] ) : ({ _t34 _lst◂_t34 }→_t34)
;; rsp=0 , %1728~1'(= a2◂ [ a34◂ [ ]] ) %1727~0'(= a34◂ [ ] ) 
;; ?; 1'(= a2◂ [ a34◂ [ ]] ) ⊢ 0(<2)◂{ 2'(= a34◂ [ ] ) 3'(= a2◂ [ a34◂ [ ]] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_785
	jmp LB_786
LB_785:
	jmp LB_784
LB_786:
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
; mov_ptn2.
	call LB_783
; .add_rsp 0
;; rsp=0 , %1732~0'(= a34◂ [ ] ) 
; ∎ 0'(= a34◂ [ ] )
; .mov_ptn2 0'(= a34◂ [ ] ) ⊢ 0'(= a34◂ [ ] )
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
	ret
LB_784:
;; ?; 1'(= a2◂ [ a34◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %1727~0'(= a34◂ [ ] ) 
; ∎ 0'(= a34◂ [ ] )
; .mov_ptn2 0'(= a34◂ [ ] ) ⊢ 0'(= a34◂ [ ] )
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
	ret
ETR_327:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_327
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_327:
	push r14
	jmp LB_766
LB_765:
	add r14,1 
LB_766:
	cmp r14,r9
	jge LB_767
	JZ_LINE_SPC BYTE [r13+8+r14], LB_765
LB_767
	call GRM_331
	cmp BYTE [r8+6],0
	jnz LB_769
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_768
LB_769:
; .rb_rle 
	add rsp,0
	jmp LB_764
LB_768:
	jmp LB_771
LB_770:
	add r14,1 
LB_771:
	cmp r14,r9
	jge LB_772
	JZ_LINE_SPC BYTE [r13+8+r14], LB_770
LB_772
	call GRM_329
	cmp BYTE [r8+6],0
	jnz LB_774
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a34◂ [ ]] ) ⊢ 9'(= a2◂ [ a34◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_773
LB_774:
; .rb_rle 
	add rsp,8
	jmp LB_764
LB_773:
	jmp LB_776
LB_775:
	add r14,1 
LB_776:
	cmp r14,r9
	jge LB_777
	JZ_LINE_SPC BYTE [r13+8+r14], LB_775
LB_777
	call GRM_328
	cmp BYTE [r8+6],0
	jnz LB_779
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a34◂ [ ]] ) ⊢ 10'(= a3◂ [ a34◂ [ ]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_778
LB_779:
; .rb_rle 
	add rsp,16
	jmp LB_764
LB_778:
	jmp LB_781
LB_780:
; .rb_rle 
	add rsp,24
	jmp LB_764
LB_781:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2000~1'(= r ) %1999~0'(= r ) %1998~10'(= a3◂ [ a34◂ [ ]] ) %1997~9'(= a2◂ [ a34◂ [ ]] ) %1996~8'(= a34◂ [ ] ) 
; #301 { 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 2'(= a34◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ { 0'(= a34◂ [ ] ) 1'(= a2◂ [ a34◂ [ ]] ) }
; {| 11000000111110.. |}
	mov r14,QWORD [rsp-8+8*4]
	mov r13,QWORD [rsp-8+8*5]
; mov_ptn2.
	call LB_783
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=3 , %2001~2'(= a34◂ [ ] ) %2000~1'(= r ) %1999~0'(= r ) %1998~10'(= a3◂ [ a34◂ [ ]] ) 
;; ?; 10'(= a3◂ [ a34◂ [ ]] ) ⊢ 0(<2)◂3'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_788
	jmp LB_789
LB_788:
	jmp LB_787
LB_789:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2002~3'(= a34◂ [ ] ) %2001~2'(= a34◂ [ ] ) %2000~1'(= r ) %1999~0'(= r ) 
; #228 { 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } ⊢ 1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) }
;; rsp=3 , %2003~1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } %2000~1'(= r ) %1999~0'(= r ) 
; #26 1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } ⊢ 0(<2)◂1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) }
;; rsp=3 , %2004~0(<2)◂1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } %2000~1'(= r ) %1999~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_782
LB_787:
;; ?; 10'(= a3◂ [ a34◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %2001~2'(= a34◂ [ ] ) %2000~1'(= r ) %1999~0'(= r ) 
; #26 2'(= a34◂ [ ] ) ⊢ 0(<2)◂2'(= a34◂ [ ] )
;; rsp=3 , %2005~0(<2)◂2'(= a34◂ [ ] ) %2000~1'(= r ) %1999~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_782
LB_782:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_763
LB_764:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_763:
; discard r14
	add rsp,8
	ret
ETR_328:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_328
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_328:
	push r14
	jmp LB_793
LB_792:
	add r14,1 
LB_793:
	cmp r14,r9
	jge LB_794
	JZ_LINE_SPC BYTE [r13+8+r14], LB_792
LB_794
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_796
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_796
	cmp BYTE [rdi+1],134
	jnz LB_796
	cmp BYTE [rdi+2],146
	jnz LB_796
	add r14,3
	jmp LB_795
LB_796:
; .rb_rle 
	add rsp,0
	jmp LB_791
LB_795:
	jmp LB_798
LB_797:
	add r14,1 
LB_798:
	cmp r14,r9
	jge LB_799
	JZ_LINE_SPC BYTE [r13+8+r14], LB_797
LB_799
	call GRM_327
	cmp BYTE [r8+6],0
	jnz LB_801
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_800
LB_801:
; .rb_rle 
	add rsp,0
	jmp LB_791
LB_800:
	jmp LB_803
LB_802:
; .rb_rle 
	add rsp,8
	jmp LB_791
LB_803:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2008~1'(= r ) %2007~0'(= r ) %2006~8'(= a34◂ [ ] ) 
; #26 8'(= a34◂ [ ] ) ⊢ 0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %2009~0(<2)◂8'(= a34◂ [ ] ) %2008~1'(= r ) %2007~0'(= r ) 
; #26 0(<2)◂8'(= a34◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %2010~0(<2)◂0(<2)◂8'(= a34◂ [ ] ) %2008~1'(= r ) %2007~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_804
LB_804:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_790
LB_791:
	mov r14,QWORD [rsp]
	jmp LB_807
LB_806:
; .rb_rle 
	add rsp,0
	jmp LB_805
LB_807:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2012~1'(= r ) %2011~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2013~1(<2)◂{ } %2012~1'(= r ) %2011~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2014~0(<2)◂1(<2)◂{ } %2012~1'(= r ) %2011~0'(= r ) 
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
; mov_ptn2.
	jmp LB_808
LB_808:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_790
LB_805:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_790:
; discard r14
	add rsp,8
	ret
ETR_329:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_329
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_329:
	push r14
	jmp LB_812
LB_811:
	add r14,1 
LB_812:
	cmp r14,r9
	jge LB_813
	JZ_LINE_SPC BYTE [r13+8+r14], LB_811
LB_813
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_815
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_815
	cmp BYTE [rdi+1],151
	jnz LB_815
	cmp BYTE [rdi+2],130
	jnz LB_815
	add r14,3
	jmp LB_814
LB_815:
; .rb_rle 
	add rsp,0
	jmp LB_810
LB_814:
	jmp LB_817
LB_816:
	add r14,1 
LB_817:
	cmp r14,r9
	jge LB_818
	JZ_LINE_SPC BYTE [r13+8+r14], LB_816
LB_818
	call GRM_331
	cmp BYTE [r8+6],0
	jnz LB_820
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_819
LB_820:
; .rb_rle 
	add rsp,0
	jmp LB_810
LB_819:
	jmp LB_822
LB_821:
	add r14,1 
LB_822:
	cmp r14,r9
	jge LB_823
	JZ_LINE_SPC BYTE [r13+8+r14], LB_821
LB_823
	call GRM_329
	cmp BYTE [r8+6],0
	jnz LB_825
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a34◂ [ ]] ) ⊢ 9'(= a2◂ [ a34◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_824
LB_825:
; .rb_rle 
	add rsp,8
	jmp LB_810
LB_824:
	jmp LB_827
LB_826:
; .rb_rle 
	add rsp,16
	jmp LB_810
LB_827:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2018~1'(= r ) %2017~0'(= r ) %2016~9'(= a2◂ [ a34◂ [ ]] ) %2015~8'(= a34◂ [ ] ) 
; #25 { 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) }
;; rsp=2 , %2019~0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } %2018~1'(= r ) %2017~0'(= r ) 
; #26 0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) }
;; rsp=2 , %2020~0(<2)◂0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } %2018~1'(= r ) %2017~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_828
LB_828:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_809
LB_810:
	mov r14,QWORD [rsp]
	jmp LB_831
LB_830:
; .rb_rle 
	add rsp,0
	jmp LB_829
LB_831:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2022~1'(= r ) %2021~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2023~1(<2)◂{ } %2022~1'(= r ) %2021~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2024~0(<2)◂1(<2)◂{ } %2022~1'(= r ) %2021~0'(= r ) 
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
; mov_ptn2.
	jmp LB_832
LB_832:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_809
LB_829:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_809:
; discard r14
	add rsp,8
	ret
ETR_330:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_330
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_330:
	push r14
	jmp LB_836
LB_835:
	add r14,1 
LB_836:
	cmp r14,r9
	jge LB_837
	JZ_LINE_SPC BYTE [r13+8+r14], LB_835
LB_837
	call GRM_327
	cmp BYTE [r8+6],0
	jnz LB_839
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_838
LB_839:
; .rb_rle 
	add rsp,0
	jmp LB_834
LB_838:
	jmp LB_841
LB_840:
	add r14,1 
LB_841:
	cmp r14,r9
	jge LB_842
	JZ_LINE_SPC BYTE [r13+8+r14], LB_840
LB_842
	call GRM_330
	cmp BYTE [r8+6],0
	jnz LB_844
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a34◂ [ ]] ) ⊢ 9'(= a2◂ [ a34◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_843
LB_844:
; .rb_rle 
	add rsp,8
	jmp LB_834
LB_843:
	jmp LB_846
LB_845:
; .rb_rle 
	add rsp,16
	jmp LB_834
LB_846:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2028~1'(= r ) %2027~0'(= r ) %2026~9'(= a2◂ [ a34◂ [ ]] ) %2025~8'(= a34◂ [ ] ) 
; #25 { 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) }
;; rsp=2 , %2029~0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } %2028~1'(= r ) %2027~0'(= r ) 
; #26 0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) }
;; rsp=2 , %2030~0(<2)◂0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } %2028~1'(= r ) %2027~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_847
LB_847:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_833
LB_834:
	mov r14,QWORD [rsp]
	jmp LB_850
LB_849:
; .rb_rle 
	add rsp,0
	jmp LB_848
LB_850:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2032~1'(= r ) %2031~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2033~1(<2)◂{ } %2032~1'(= r ) %2031~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2034~0(<2)◂1(<2)◂{ } %2032~1'(= r ) %2031~0'(= r ) 
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
; mov_ptn2.
	jmp LB_851
LB_851:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_833
LB_848:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_833:
; discard r14
	add rsp,8
	ret
ETR_331:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_331
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_331:
	push r14
	jmp LB_855
LB_854:
	add r14,1 
LB_855:
	cmp r14,r9
	jge LB_856
	JZ_LINE_SPC BYTE [r13+8+r14], LB_854
LB_856
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_858
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_858
	add r14,1
	jmp LB_857
LB_858:
; .rb_rle 
	add rsp,0
	jmp LB_853
LB_857:
	jmp LB_860
LB_859:
	add r14,1 
LB_860:
	cmp r14,r9
	jge LB_861
	JZ_LINE_SPC BYTE [r13+8+r14], LB_859
LB_861
	call GRM_330
	cmp BYTE [r8+6],0
	jnz LB_863
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a34◂ [ ]] ) ⊢ 8'(= a2◂ [ a34◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_862
LB_863:
; .rb_rle 
	add rsp,0
	jmp LB_853
LB_862:
	jmp LB_865
LB_864:
	add r14,1 
LB_865:
	cmp r14,r9
	jge LB_866
	JZ_LINE_SPC BYTE [r13+8+r14], LB_864
LB_866
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_868
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_868
	add r14,1
	jmp LB_867
LB_868:
; .rb_rle 
	add rsp,8
	jmp LB_853
LB_867:
	jmp LB_870
LB_869:
; .rb_rle 
	add rsp,8
	jmp LB_853
LB_870:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2037~1'(= r ) %2036~0'(= r ) %2035~8'(= a2◂ [ a34◂ [ ]] ) 
; #229 8'(= a2◂ [ a34◂ [ ]] ) ⊢ 0(<5)◂8'(= a2◂ [ a34◂ [ ]] )
;; rsp=1 , %2038~0(<5)◂8'(= a2◂ [ a34◂ [ ]] ) %2037~1'(= r ) %2036~0'(= r ) 
; #26 0(<5)◂8'(= a2◂ [ a34◂ [ ]] ) ⊢ 0(<2)◂0(<5)◂8'(= a2◂ [ a34◂ [ ]] )
;; rsp=1 , %2039~0(<2)◂0(<5)◂8'(= a2◂ [ a34◂ [ ]] ) %2037~1'(= r ) %2036~0'(= r ) 
; ∎ 0(<2)◂0(<5)◂8'(= a2◂ [ a34◂ [ ]] )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<5)◂8'(= a2◂ [ a34◂ [ ]] ) ⊢ 2'(= a3◂ [ a34◂ [ ]] )
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_871
LB_871:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_852
LB_853:
	mov r14,QWORD [rsp]
	jmp LB_874
LB_873:
	add r14,1 
LB_874:
	cmp r14,r9
	jge LB_875
	JZ_LINE_SPC BYTE [r13+8+r14], LB_873
LB_875
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_877
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],40
	jnz LB_877
	add r14,1
	jmp LB_876
LB_877:
; .rb_rle 
	add rsp,0
	jmp LB_872
LB_876:
	jmp LB_879
LB_878:
	add r14,1 
LB_879:
	cmp r14,r9
	jge LB_880
	JZ_LINE_SPC BYTE [r13+8+r14], LB_878
LB_880
	call GRM_327
	cmp BYTE [r8+6],0
	jnz LB_882
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_881
LB_882:
; .rb_rle 
	add rsp,0
	jmp LB_872
LB_881:
	jmp LB_884
LB_883:
	add r14,1 
LB_884:
	cmp r14,r9
	jge LB_885
	JZ_LINE_SPC BYTE [r13+8+r14], LB_883
LB_885
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_887
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],41
	jnz LB_887
	add r14,1
	jmp LB_886
LB_887:
; .rb_rle 
	add rsp,8
	jmp LB_872
LB_886:
	jmp LB_889
LB_888:
; .rb_rle 
	add rsp,8
	jmp LB_872
LB_889:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2042~1'(= r ) %2041~0'(= r ) %2040~8'(= a34◂ [ ] ) 
; #26 8'(= a34◂ [ ] ) ⊢ 0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %2043~0(<2)◂8'(= a34◂ [ ] ) %2042~1'(= r ) %2041~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_890
LB_890:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_852
LB_872:
	mov r14,QWORD [rsp]
	jmp LB_893
LB_892:
	add r14,1 
LB_893:
	cmp r14,r9
	jge LB_894
	JZ_LINE_SPC BYTE [r13+8+r14], LB_892
LB_894
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_896
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_895
LB_896:
; .rb_rle 
	add rsp,0
	jmp LB_891
LB_895:
	jmp LB_898
LB_897:
; .rb_rle 
	add rsp,8
	jmp LB_891
LB_898:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2046~1'(= r ) %2045~0'(= r ) %2044~8'(= {| l |} ) 
; #225 8'(= {| l |} ) ⊢ 4(<5)◂8'(= {| l |} )
;; rsp=1 , %2047~4(<5)◂8'(= {| l |} ) %2046~1'(= r ) %2045~0'(= r ) 
; #26 4(<5)◂8'(= {| l |} ) ⊢ 0(<2)◂4(<5)◂8'(= {| l |} )
;; rsp=1 , %2048~0(<2)◂4(<5)◂8'(= {| l |} ) %2046~1'(= r ) %2045~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_899
LB_899:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_852
LB_891:
	mov r14,QWORD [rsp]
	jmp LB_902
LB_901:
	add r14,1 
LB_902:
	cmp r14,r9
	jge LB_903
	JZ_LINE_SPC BYTE [r13+8+r14], LB_901
LB_903
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_905
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_904
LB_905:
; .rb_rle 
	add rsp,0
	jmp LB_900
LB_904:
	jmp LB_907
LB_906:
; .rb_rle 
	add rsp,8
	jmp LB_900
LB_907:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2051~1'(= r ) %2050~0'(= r ) %2049~8'(= a18◂ [ ] ) 
; #226 8'(= a18◂ [ ] ) ⊢ 3(<5)◂8'(= a18◂ [ ] )
;; rsp=1 , %2052~3(<5)◂8'(= a18◂ [ ] ) %2051~1'(= r ) %2050~0'(= r ) 
; #26 3(<5)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂3(<5)◂8'(= a18◂ [ ] )
;; rsp=1 , %2053~0(<2)◂3(<5)◂8'(= a18◂ [ ] ) %2051~1'(= r ) %2050~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_908
LB_908:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_852
LB_900:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_852:
; discard r14
	add rsp,8
	ret
ETR_332:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_332
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_332:
	push r14
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_912
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_911
LB_912:
; .rb_rle 
	add rsp,0
	jmp LB_910
LB_911:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_914
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_914
	add r14,1
	jmp LB_913
LB_914:
; .rb_rle 
	add rsp,8
	jmp LB_910
LB_913:
	jmp LB_916
LB_915:
; .rb_rle 
	add rsp,8
	jmp LB_910
LB_916:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2056~1'(= r ) %2055~0'(= r ) %2054~8'(= {| l |} ) 
; #26 8'(= {| l |} ) ⊢ 0(<2)◂8'(= {| l |} )
;; rsp=1 , %2057~0(<2)◂8'(= {| l |} ) %2056~1'(= r ) %2055~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_917
LB_917:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_909
LB_910:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_909:
; discard r14
	add rsp,8
	ret
LB_933:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_936+8*rax]
LB_936: dq LB_934,LB_935
LB_934:
	jmp LB_937
LB_935:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_938
	jmp LB_937
LB_937:
	ret
LB_938:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_941+8*rax]
LB_941: dq LB_939,LB_940
LB_939:
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
	call LB_938
	pop r8 
	FREE_RCD 2, r8
	jmp LB_942
LB_940:
	jmp LB_942
LB_942:
	ret
LB_1019: ;; #84 { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] ) : ({ _lst◂{ _r64 _r64 _s8 } _lst◂{ _r64 _r64 _s8 } }→_lst◂{ _r64 _r64 _s8 })
;; rsp=0 , %250~1'(= a2◂ [ *{ rr{| l |}}] ) %249~0'(= a2◂ [ *{ rr{| l |}}] ) 
;; ? 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂{ 2'(= *{ rr{| l |}} ) 3'(= a2◂ [ *{ rr{| l |}}] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_1021
	jmp LB_1022
LB_1021:
	jmp LB_1020
LB_1022:
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
; mov_ptn2.
	call LB_1019
	mov r8,QWORD [rsp-8+8*1]
; .add_rsp 1
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_1020:
;; ?. 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %250~1'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 110.. |}
	mov r13,r14
; mov_ptn2.
; .add_rsp 0
	ret
LB_1009: ;; #310 { 0'(= a47◂ [ *{ }] ) 1'(= a47◂ [ *{ }] ) } ⊢ 0'(= a47◂ [ *{ *{ }*{ }}] ) : ({ _t47◂{ } _t47◂{ } }→_t47◂{ { } { } })
;; rsp=0 , %1799~1'(= a47◂ [ *{ }] ) %1798~0'(= a47◂ [ *{ }] ) 
;; ? 0'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂0'(= *{ } )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_1011
	jmp LB_1012
LB_1011:
	jmp LB_1010
LB_1012:
;; rsp=0 , %1801~0'(= *{ } ) %1799~1'(= a47◂ [ *{ }] ) 
;; ? 1'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂1'(= *{ } )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_1014
	jmp LB_1015
LB_1014:
	jmp LB_1013
LB_1015:
;; rsp=0 , %1803~1'(= *{ } ) %1801~0'(= *{ } ) 
; #309 { 0'(= *{ } ) 1'(= *{ } ) } ⊢ 0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) }
;; rsp=0 , %1804~0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) } 
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_1013:
;; ?. 1'(= a47◂ [ *{ }] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1802~2'(= a2◂ [ *{ rr{| l |}}] ) %1801~0'(= *{ } ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1805~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1801~0'(= *{ } ) 
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_1010:
;; ?. 0'(= a47◂ [ *{ }] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1800~2'(= a2◂ [ *{ rr{| l |}}] ) %1799~1'(= a47◂ [ *{ }] ) 
;; ? 1'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂1'(= *{ } )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_1017
	jmp LB_1018
LB_1017:
	jmp LB_1016
LB_1018:
;; rsp=0 , %1807~1'(= *{ } ) %1800~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1808~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1807~1'(= *{ } ) 
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_1016:
;; ?. 1'(= a47◂ [ *{ }] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1806~0'(= a2◂ [ *{ rr{| l |}}] ) %1800~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110.. |}
	mov r14,r13
	mov r13,r8
; mov_ptn2.
	call LB_1019
; .add_rsp 0
;; rsp=0 , %1809~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1810~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ *{ }*{ }}] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_1026: ;; #313 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= {| l |} ) : (_lst◂{ _r64 _r64 _s8 }→_s8)
;; rsp=0 , %1828~0'(= a2◂ [ *{ rr{| l |}}] ) 
;; ? 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂{ { 2'(= r ) 3'(= r ) 4'(= {| l |} ) } 5'(= a2◂ [ *{ rr{| l |}}] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_1028
	jmp LB_1029
LB_1028:
	jmp LB_1027
LB_1029:
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
;; rsp=0 , %1832~5'(= a2◂ [ *{ rr{| l |}}] ) %1831~4'(= {| l |} ) %1830~3'(= r ) %1829~2'(= r ) 
; #313 5'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+0],r8
	mov QWORD [rsp+8],r9
	mov QWORD [rsp+16],r10
; .mov_ptn2 5'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 100001001110.. |}
	mov r13,r11
; mov_ptn2.
	call LB_1026
	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov r8,QWORD [rsp-8+8*1]
; .add_rsp 3
	add rsp,24
;; rsp=0 , %1833~0'(= {| l |} ) %1831~4'(= {| l |} ) %1830~3'(= r ) %1829~2'(= r ) 
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
	lea rsi,[LB_1030+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r10+7+rcx]
	rep movsb
	lea rsi,[LB_1031+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1032+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1033+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1838~1'(= {| l |} ) %1837~0'(= {| l |} ) %1836~4'(= {| l |} ) %1835~3'(= r ) %1834~2'(= r ) 
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_1027:
;; ?. 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %1839~%[ "" ] 
; ∎ %[ "" ]
; .mov_ptn2 %[ "" ] ⊢ 0'(= {| l |} )
; {| 10.. |}
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
ETR_334:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_334
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_334:
	push r14
	jmp LB_921
LB_920:
	add r14,1 
LB_921:
	cmp r14,r9
	jge LB_922
	JZ_LINE_SPC BYTE [r13+8+r14], LB_920
LB_922
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_924
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_924
	add r14,1
	jmp LB_923
LB_924:
; .rb_rle 
	add rsp,0
	jmp LB_919
LB_923:
	jmp LB_926
LB_925:
	add r14,1 
LB_926:
	cmp r14,r9
	jge LB_927
	JZ_LINE_SPC BYTE [r13+8+r14], LB_925
LB_927
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_929
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_928
LB_929:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_918
LB_928:
	jmp LB_931
LB_930:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_918
LB_931:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2060~1'(= r ) %2059~0'(= r ) %2058~8'(= a47◂ [ *{ }] ) 
; #309 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2061~0(<2)◂{ } %2060~1'(= r ) %2059~0'(= r ) %2058~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=1 , %2062~0(<2)◂0(<2)◂{ } %2060~1'(= r ) %2059~0'(= r ) %2058~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a47◂ [ *{ }]] )
; {| 0010.. |}
	mov r8,unt_0
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_932
LB_932:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_918
LB_919:
	mov r14,QWORD [rsp] 
	jmp LB_945
LB_944:
	add r14,1 
LB_945:
	cmp r14,r9
	jge LB_946
	JZ_LINE_SPC BYTE [r13+8+r14], LB_944
LB_946
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_948
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],35
	jnz LB_948
	cmp BYTE [rdi+1],35
	jnz LB_948
	add r14,2
	jmp LB_947
LB_948:
; .rb_rle 
	add rsp,0
	jmp LB_943
LB_947:
	jmp LB_950
LB_949:
	add r14,1 
LB_950:
	cmp r14,r9
	jge LB_951
	JZ_LINE_SPC BYTE [r13+8+r14], LB_949
LB_951
	call GRM_337
	cmp BYTE [r8+6],0
	jnz LB_953
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_952
LB_953:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_918
LB_952:
	jmp LB_955
LB_954:
	add r14,1 
LB_955:
	cmp r14,r9
	jge LB_956
	JZ_LINE_SPC BYTE [r13+8+r14], LB_954
LB_956
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_958
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 10'(= a47◂ [ *{ }] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_957
LB_958:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_918
LB_957:
	jmp LB_960
LB_959:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_918
LB_960:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2066~1'(= r ) %2065~0'(= r ) %2064~10'(= a47◂ [ *{ }] ) %2063~{ 8'(= r ) 9'(= r ) } 
; #309 { } ⊢ 0(<2)◂{ }
;; rsp=3 , %2067~0(<2)◂{ } %2066~1'(= r ) %2065~0'(= r ) %2064~10'(= a47◂ [ *{ }] ) %2063~{ 8'(= r ) 9'(= r ) } 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=3 , %2068~0(<2)◂0(<2)◂{ } %2066~1'(= r ) %2065~0'(= r ) %2064~10'(= a47◂ [ *{ }] ) %2063~{ 8'(= r ) 9'(= r ) } 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_961
LB_961:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_918
LB_943:
	mov r14,QWORD [rsp] 
	jmp LB_964
LB_963:
	add r14,1 
LB_964:
	cmp r14,r9
	jge LB_965
	JZ_LINE_SPC BYTE [r13+8+r14], LB_963
LB_965
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_967
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_967
	cmp BYTE [rdi+1],92
	jnz LB_967
	add r14,2
	jmp LB_966
LB_967:
; .rb_rle 
	add rsp,0
	jmp LB_962
LB_966:
	jmp LB_969
LB_968:
	add r14,1 
LB_969:
	cmp r14,r9
	jge LB_970
	JZ_LINE_SPC BYTE [r13+8+r14], LB_968
LB_970
	call GRM_337
	cmp BYTE [r8+6],0
	jnz LB_972
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_971
LB_972:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_918
LB_971:
	jmp LB_974
LB_973:
	add r14,1 
LB_974:
	cmp r14,r9
	jge LB_975
	JZ_LINE_SPC BYTE [r13+8+r14], LB_973
LB_975
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_977
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 10'(= a47◂ [ *{ }] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_976
LB_977:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_918
LB_976:
	jmp LB_979
LB_978:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_918
LB_979:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2072~1'(= r ) %2071~0'(= r ) %2070~10'(= a47◂ [ *{ }] ) %2069~{ 8'(= r ) 9'(= r ) } 
; #309 { } ⊢ 0(<2)◂{ }
;; rsp=3 , %2073~0(<2)◂{ } %2072~1'(= r ) %2071~0'(= r ) %2070~10'(= a47◂ [ *{ }] ) %2069~{ 8'(= r ) 9'(= r ) } 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=3 , %2074~0(<2)◂0(<2)◂{ } %2072~1'(= r ) %2071~0'(= r ) %2070~10'(= a47◂ [ *{ }] ) %2069~{ 8'(= r ) 9'(= r ) } 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_980
LB_980:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_918
LB_962:
	mov r14,QWORD [rsp] 
	jmp LB_983
LB_982:
	add r14,1 
LB_983:
	cmp r14,r9
	jge LB_984
	JZ_LINE_SPC BYTE [r13+8+r14], LB_982
LB_984
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_986
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_986
	cmp BYTE [rdi+1],91
	jnz LB_986
	add r14,2
	jmp LB_985
LB_986:
; .rb_rle 
	add rsp,0
	jmp LB_981
LB_985:
	push r14
	jmp LB_992
LB_991:
	add r14,1 
LB_992:
	cmp r14,r9
	jge LB_993
	JZ_LINE_SPC BYTE [r13+8+r14], LB_991
LB_993
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_995
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_995
	add r14,1
	jmp LB_994
LB_995:
; .rb_rle 
	add rsp,0
	jmp LB_990
LB_994:
	jmp LB_997
LB_996:
	add r14,1 
LB_997:
	cmp r14,r9
	jge LB_998
	JZ_LINE_SPC BYTE [r13+8+r14], LB_996
LB_998
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1000
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_999
LB_1000:
; .rb_rle 
	add rsp,0
	jmp LB_990
LB_999:
	jmp LB_1002
LB_1001:
	add r14,1 
LB_1002:
	cmp r14,r9
	jge LB_1003
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1001
LB_1003
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_1005
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1004
LB_1005:
; .rb_rle 
	add rsp,8
	jmp LB_990
LB_1004:
	jmp LB_1007
LB_1006:
; .rb_rle 
	add rsp,16
	jmp LB_990
LB_1007:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2080~1'(= r ) %2079~0'(= r ) %2078~9'(= a47◂ [ *{ }] ) %2077~8'(= a47◂ [ *{ }] ) 
; #310 { 8'(= a47◂ [ *{ }] ) 9'(= a47◂ [ *{ }] ) } ⊢ 2'(= a47◂ [ *{ *{ }*{ }}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= a47◂ [ *{ }] ) 9'(= a47◂ [ *{ }] ) } ⊢ { 0'(= a47◂ [ *{ }] ) 1'(= a47◂ [ *{ }] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_1009
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %2081~2'(= a47◂ [ *{ *{ }*{ }}] ) %2080~1'(= r ) %2079~0'(= r ) 
;; ? 2'(= a47◂ [ *{ *{ }*{ }}] ) ⊢ 0(<2)◂{ 3'(= *{ } ) 4'(= *{ } ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_1024
	jmp LB_1025
LB_1024:
	jmp LB_1023
LB_1025:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %2084~4'(= *{ } ) %2083~3'(= *{ } ) %2080~1'(= r ) %2079~0'(= r ) 
; #309 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2085~0(<2)◂{ } %2084~4'(= *{ } ) %2083~3'(= *{ } ) %2080~1'(= r ) %2079~0'(= r ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %2086~0(<2)◂0(<2)◂{ } %2084~4'(= *{ } ) %2083~3'(= *{ } ) %2080~1'(= r ) %2079~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1008
LB_1023:
;; ?. 2'(= a47◂ [ *{ *{ }*{ }}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %2082~3'(= a2◂ [ *{ rr{| l |}}] ) %2080~1'(= r ) %2079~0'(= r ) 
; #313 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 10010000110.. |}
	mov r13,r9
; mov_ptn2.
	call LB_1026
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %2087~2'(= {| l |} ) %2080~1'(= r ) %2079~0'(= r ) 
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
	jmp LB_1034
LB_1034:
;; rsp=0 , %2088~2'(= {| l |} ) %2080~1'(= r ) %2079~0'(= r ) 
	mov rdi,LB_1035
	call emt_stg 
	jmp err
LB_1008:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_989
LB_990:
	mov r14,QWORD [rsp]
	jmp LB_1038
LB_1037:
; .rb_rle 
	add rsp,0
	jmp LB_1036
LB_1038:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2090~1'(= r ) %2089~0'(= r ) 
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
	lea rsi,[LB_1040+2-1]
	mov rcx,2
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1041+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1042+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %2093~2'(= {| l |} ) %2092~1'(= r ) %2091~0'(= r ) 
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
	jmp LB_1043
LB_1043:
;; rsp=0 , %2094~2'(= {| l |} ) %2092~1'(= r ) %2091~0'(= r ) 
	mov rdi,LB_1044
	call emt_stg 
	jmp err
LB_1039:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_989
LB_1036:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_989:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_987
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 3'(= a47◂ [ *{ }] )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_988
LB_987:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_918
LB_988:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2095~3'(= a47◂ [ *{ }] ) %2076~1'(= r ) %2075~0'(= r ) 
; #26 3'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂3'(= a47◂ [ *{ }] )
;; rsp=0 , %2096~0(<2)◂3'(= a47◂ [ *{ }] ) %2076~1'(= r ) %2075~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1045
LB_1045:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_918
LB_981:
	mov r14,QWORD [rsp] 
	jmp LB_1048
LB_1047:
; .rb_rle 
	add rsp,0
	jmp LB_1046
LB_1048:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2098~1'(= r ) %2097~0'(= r ) 
; #309 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2099~0(<2)◂{ } %2098~1'(= r ) %2097~0'(= r ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %2100~0(<2)◂0(<2)◂{ } %2098~1'(= r ) %2097~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1049
LB_1049:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_918
LB_1046:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_918:
; discard r14
	add rsp,8
	ret
ETR_335:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_335
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_335:
	push r14
	jmp LB_1053
LB_1052:
	add r14,1 
LB_1053:
	cmp r14,r9
	jge LB_1054
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1052
LB_1054
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1056
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1056
	cmp BYTE [rdi+1],91
	jnz LB_1056
	add r14,2
	jmp LB_1055
LB_1056:
; .rb_rle 
	add rsp,0
	jmp LB_1051
LB_1055:
	push r14
	jmp LB_1062
LB_1061:
	add r14,1 
LB_1062:
	cmp r14,r9
	jge LB_1063
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1061
LB_1063
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1065
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1065
	add r14,1
	jmp LB_1064
LB_1065:
; .rb_rle 
	add rsp,0
	jmp LB_1060
LB_1064:
	jmp LB_1067
LB_1066:
	add r14,1 
LB_1067:
	cmp r14,r9
	jge LB_1068
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1066
LB_1068
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1070
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1069
LB_1070:
; .rb_rle 
	add rsp,0
	jmp LB_1060
LB_1069:
	jmp LB_1072
LB_1071:
	add r14,1 
LB_1072:
	cmp r14,r9
	jge LB_1073
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1071
LB_1073
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1075
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1074
LB_1075:
; .rb_rle 
	add rsp,8
	jmp LB_1060
LB_1074:
	jmp LB_1077
LB_1076:
; .rb_rle 
	add rsp,16
	jmp LB_1060
LB_1077:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2106~1'(= r ) %2105~0'(= r ) %2104~9'(= a47◂ [ *{ }] ) %2103~8'(= a47◂ [ *{ }] ) 
; #310 { 8'(= a47◂ [ *{ }] ) 9'(= a47◂ [ *{ }] ) } ⊢ 2'(= a47◂ [ *{ *{ }*{ }}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= a47◂ [ *{ }] ) 9'(= a47◂ [ *{ }] ) } ⊢ { 0'(= a47◂ [ *{ }] ) 1'(= a47◂ [ *{ }] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_1009
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %2107~2'(= a47◂ [ *{ *{ }*{ }}] ) %2106~1'(= r ) %2105~0'(= r ) 
;; ? 2'(= a47◂ [ *{ *{ }*{ }}] ) ⊢ 0(<2)◂{ 3'(= *{ } ) 4'(= *{ } ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_1080
	jmp LB_1081
LB_1080:
	jmp LB_1079
LB_1081:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %2110~4'(= *{ } ) %2109~3'(= *{ } ) %2106~1'(= r ) %2105~0'(= r ) 
; #309 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2111~0(<2)◂{ } %2110~4'(= *{ } ) %2109~3'(= *{ } ) %2106~1'(= r ) %2105~0'(= r ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %2112~0(<2)◂0(<2)◂{ } %2110~4'(= *{ } ) %2109~3'(= *{ } ) %2106~1'(= r ) %2105~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1078
LB_1079:
;; ?. 2'(= a47◂ [ *{ *{ }*{ }}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %2108~3'(= a2◂ [ *{ rr{| l |}}] ) %2106~1'(= r ) %2105~0'(= r ) 
; #313 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 10010000110.. |}
	mov r13,r9
; mov_ptn2.
	call LB_1026
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %2113~2'(= {| l |} ) %2106~1'(= r ) %2105~0'(= r ) 
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
	jmp LB_1082
LB_1082:
;; rsp=0 , %2114~2'(= {| l |} ) %2106~1'(= r ) %2105~0'(= r ) 
	mov rdi,LB_1083
	call emt_stg 
	jmp err
LB_1078:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1059
LB_1060:
	mov r14,QWORD [rsp]
	jmp LB_1086
LB_1085:
; .rb_rle 
	add rsp,0
	jmp LB_1084
LB_1086:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2116~1'(= r ) %2115~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2117~1(<2)◂{ } %2116~1'(= r ) %2115~0'(= r ) 
; $ %[ "blk_cmt 0" ] ⊢ %[ "blk_cmt 0" ]
;; rsp=0 , %2118~%[ "blk_cmt 0" ] %2117~1(<2)◂{ } %2116~1'(= r ) %2115~0'(= r ) 
; #25 { { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %2119~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %2120~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %2121~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
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
; mov_ptn2.
	jmp LB_1087
LB_1087:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1059
LB_1084:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1059:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_1057
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 3'(= a47◂ [ *{ }] )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_1058
LB_1057:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1050
LB_1058:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2122~3'(= a47◂ [ *{ }] ) %2102~1'(= r ) %2101~0'(= r ) 
; #26 3'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂3'(= a47◂ [ *{ }] )
;; rsp=0 , %2123~0(<2)◂3'(= a47◂ [ *{ }] ) %2102~1'(= r ) %2101~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1088
LB_1088:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1050
LB_1051:
	mov r14,QWORD [rsp] 
	jmp LB_1091
LB_1090:
	add r14,1 
LB_1091:
	cmp r14,r9
	jge LB_1092
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1090
LB_1092
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1094
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1094
	cmp BYTE [rdi+1],93
	jnz LB_1094
	add r14,2
	jmp LB_1093
LB_1094:
; .rb_rle 
	add rsp,0
	jmp LB_1089
LB_1093:
	push r14
	jmp LB_1100
LB_1099:
	add r14,1 
LB_1100:
	cmp r14,r9
	jge LB_1101
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1099
LB_1101
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1103
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1103
	add r14,1
	jmp LB_1102
LB_1103:
; .rb_rle 
	add rsp,0
	jmp LB_1098
LB_1102:
	jmp LB_1105
LB_1104:
; .rb_rle 
	add rsp,0
	jmp LB_1098
LB_1105:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2127~1'(= r ) %2126~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2128~0(<2)◂{ } %2127~1'(= r ) %2126~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1106
LB_1106:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1097
LB_1098:
	mov r14,QWORD [rsp]
	jmp LB_1109
LB_1108:
	add r14,1 
LB_1109:
	cmp r14,r9
	jge LB_1110
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1108
LB_1110
	cmp r14,r9
	jge LB_1112
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1111
LB_1112:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1097
LB_1111:
	jmp LB_1114
LB_1113:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1097
LB_1114:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2131~1'(= r ) %2130~0'(= r ) %2129~8'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2132~1(<2)◂{ } %2131~1'(= r ) %2130~0'(= r ) %2129~8'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1115
LB_1115:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1097
LB_1107:
	mov r14,QWORD [rsp] 
	jmp LB_1118
LB_1117:
; .rb_rle 
	add rsp,0
	jmp LB_1116
LB_1118:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2134~1'(= r ) %2133~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2135~0(<2)◂{ } %2134~1'(= r ) %2133~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1119
LB_1119:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1097
LB_1116:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1097:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_1095
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1110.. |}
; mov_ptn2.
	jmp LB_1096
LB_1095:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1050
LB_1096:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2136~{ } %2125~1'(= r ) %2124~0'(= r ) 
; #309 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2137~0(<2)◂{ } %2136~{ } %2125~1'(= r ) %2124~0'(= r ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %2138~0(<2)◂0(<2)◂{ } %2136~{ } %2125~1'(= r ) %2124~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1120
LB_1120:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1050
LB_1089:
	mov r14,QWORD [rsp] 
	jmp LB_1123
LB_1122:
	add r14,1 
LB_1123:
	cmp r14,r9
	jge LB_1124
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1122
LB_1124
	call GRM_336
	cmp BYTE [r8+6],0
	jnz LB_1126
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1125
LB_1126:
; .rb_rle 
	add rsp,0
	jmp LB_1121
LB_1125:
	jmp LB_1128
LB_1127:
; .rb_rle 
	add rsp,8
	jmp LB_1121
LB_1128:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2141~1'(= r ) %2140~0'(= r ) %2139~8'(= a47◂ [ *{ }] ) 
; #26 8'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂8'(= a47◂ [ *{ }] )
;; rsp=1 , %2142~0(<2)◂8'(= a47◂ [ *{ }] ) %2141~1'(= r ) %2140~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1129
LB_1129:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1050
LB_1121:
	mov r14,QWORD [rsp]
	jmp LB_1132
LB_1131:
; .rb_rle 
	add rsp,0
	jmp LB_1130
LB_1132:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2144~1'(= r ) %2143~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2145~1(<2)◂{ } %2144~1'(= r ) %2143~0'(= r ) 
; $ %[ "blk_cmt 1" ] ⊢ %[ "blk_cmt 1" ]
;; rsp=0 , %2146~%[ "blk_cmt 1" ] %2145~1(<2)◂{ } %2144~1'(= r ) %2143~0'(= r ) 
; #25 { { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2147~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2148~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2149~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
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
; mov_ptn2.
	jmp LB_1133
LB_1133:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1050
LB_1130:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1050:
; discard r14
	add rsp,8
	ret
ETR_336:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_336
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_336:
	push r14
	jmp LB_1137
LB_1136:
	add r14,1 
LB_1137:
	cmp r14,r9
	jge LB_1138
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1136
LB_1138
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1140
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1140
	add r14,1
	jmp LB_1139
LB_1140:
; .rb_rle 
	add rsp,0
	jmp LB_1135
LB_1139:
	jmp LB_1142
LB_1141:
	add r14,1 
LB_1142:
	cmp r14,r9
	jge LB_1143
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1141
LB_1143
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1145
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1144
LB_1145:
; .rb_rle 
	add rsp,0
	jmp LB_1135
LB_1144:
	jmp LB_1147
LB_1146:
; .rb_rle 
	add rsp,8
	jmp LB_1135
LB_1147:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2152~1'(= r ) %2151~0'(= r ) %2150~8'(= a47◂ [ *{ }] ) 
; #26 8'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂8'(= a47◂ [ *{ }] )
;; rsp=1 , %2153~0(<2)◂8'(= a47◂ [ *{ }] ) %2152~1'(= r ) %2151~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1148
LB_1148:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1134
LB_1135:
	mov r14,QWORD [rsp]
	jmp LB_1151
LB_1150:
	add r14,1 
LB_1151:
	cmp r14,r9
	jge LB_1152
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1150
LB_1152
	cmp r14,r9
	jge LB_1154
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1153
LB_1154:
; .rb_rle 
	add rsp,0
	jmp LB_1149
LB_1153:
	jmp LB_1156
LB_1155:
	add r14,1 
LB_1156:
	cmp r14,r9
	jge LB_1157
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1155
LB_1157
	call GRM_336
	cmp BYTE [r8+6],0
	jnz LB_1159
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1158
LB_1159:
; .rb_rle 
	add rsp,8
	jmp LB_1149
LB_1158:
	jmp LB_1161
LB_1160:
; .rb_rle 
	add rsp,16
	jmp LB_1149
LB_1161:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2157~1'(= r ) %2156~0'(= r ) %2155~9'(= a47◂ [ *{ }] ) %2154~8'(= r ) 
; #26 9'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂9'(= a47◂ [ *{ }] )
;; rsp=2 , %2158~0(<2)◂9'(= a47◂ [ *{ }] ) %2157~1'(= r ) %2156~0'(= r ) %2154~8'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_1162
LB_1162:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1134
LB_1149:
	mov r14,QWORD [rsp]
	jmp LB_1165
LB_1164:
; .rb_rle 
	add rsp,0
	jmp LB_1163
LB_1165:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2160~1'(= r ) %2159~0'(= r ) 
; $ %[ "line_res_c 0" ] ⊢ %[ "line_res_c 0" ]
;; rsp=0 , %2161~%[ "line_res_c 0" ] %2160~1'(= r ) %2159~0'(= r ) 
; #10 %[ "line_res_c 0" ] ⊢ %[ "line_res_c 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_1167
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_1168
LB_1168:
;; rsp=0 , %2162~%[ "line_res_c 0" ] %2160~1'(= r ) %2159~0'(= r ) 
	mov rdi,LB_1169
	call emt_stg 
	jmp err
LB_1166:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1134
LB_1163:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1134:
; discard r14
	add rsp,8
	ret
ETR_337:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_337
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_337:
	push r14
	jmp LB_1173
LB_1172:
	add r14,1 
LB_1173:
	cmp r14,r9
	jge LB_1174
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1172
LB_1174
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1176
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1176
	add r14,1
	jmp LB_1175
LB_1176:
; .rb_rle 
	add rsp,0
	jmp LB_1171
LB_1175:
	jmp LB_1178
LB_1177:
; .rb_rle 
	add rsp,0
	jmp LB_1171
LB_1178:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2164~1'(= r ) %2163~0'(= r ) 
; #26 { 0'(= r ) 1'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 1'(= r ) }
;; rsp=0 , %2165~0(<2)◂{ 0'(= r ) 1'(= r ) } 
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
; mov_ptn2.
	jmp LB_1179
LB_1179:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1170
LB_1171:
	mov r14,QWORD [rsp]
	jmp LB_1182
LB_1181:
	add r14,1 
LB_1182:
	cmp r14,r9
	jge LB_1183
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1181
LB_1183
	cmp r14,r9
	jge LB_1185
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1184
LB_1185:
; .rb_rle 
	add rsp,0
	jmp LB_1180
LB_1184:
	jmp LB_1187
LB_1186:
	add r14,1 
LB_1187:
	cmp r14,r9
	jge LB_1188
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1186
LB_1188
	call GRM_337
	cmp BYTE [r8+6],0
	jnz LB_1190
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 9'(= r ) 10'(= r ) }
; {| 111100001110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_1189
LB_1190:
; .rb_rle 
	add rsp,8
	jmp LB_1180
LB_1189:
	jmp LB_1192
LB_1191:
; .rb_rle 
	add rsp,24
	jmp LB_1180
LB_1192:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2170~1'(= r ) %2169~0'(= r ) %2168~10'(= r ) %2167~9'(= r ) %2166~8'(= r ) 
; #26 { 0'(= r ) 10'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 10'(= r ) }
;; rsp=3 , %2171~0(<2)◂{ 0'(= r ) 10'(= r ) } %2170~1'(= r ) %2167~9'(= r ) %2166~8'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_1193
LB_1193:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1170
LB_1180:
	mov r14,QWORD [rsp]
	jmp LB_1196
LB_1195:
; .rb_rle 
	add rsp,0
	jmp LB_1194
LB_1196:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2173~1'(= r ) %2172~0'(= r ) 
; #26 { 0'(= r ) 1'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 1'(= r ) }
;; rsp=0 , %2174~0(<2)◂{ 0'(= r ) 1'(= r ) } 
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
; mov_ptn2.
	jmp LB_1197
LB_1197:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1170
LB_1194:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1170:
; discard r14
	add rsp,8
	ret
ETR_338:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_338
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_338:
	push r14
	jmp LB_1201
LB_1200:
	add r14,1 
LB_1201:
	cmp r14,r9
	jge LB_1202
	JZ_SPC BYTE [r13+8+r14], LB_1200
LB_1202
	lea rax,[r14+7]
	cmp rax,r9
	jg LB_1204
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1204
	cmp BYTE [rdi+1],167
	jnz LB_1204
	cmp BYTE [rdi+2],194
	jnz LB_1204
	cmp BYTE [rdi+3],167
	jnz LB_1204
	cmp BYTE [rdi+4],43
	jnz LB_1204
	cmp BYTE [rdi+5],115
	jnz LB_1204
	cmp BYTE [rdi+6],56
	jnz LB_1204
	add r14,7
	jmp LB_1203
LB_1204:
; .rb_rle 
	add rsp,0
	jmp LB_1199
LB_1203:
	jmp LB_1206
LB_1205:
; .rb_rle 
	add rsp,0
	jmp LB_1199
LB_1206:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2176~1'(= r ) %2175~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2177~0(<2)◂{ } %2176~1'(= r ) %2175~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1207
LB_1207:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1198
LB_1199:
	mov r14,QWORD [rsp]
	jmp LB_1210
LB_1209:
	add r14,1 
LB_1210:
	cmp r14,r9
	jge LB_1211
	JZ_SPC BYTE [r13+8+r14], LB_1209
LB_1211
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_1213
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1213
	cmp BYTE [rdi+1],167
	jnz LB_1213
	cmp BYTE [rdi+2],194
	jnz LB_1213
	cmp BYTE [rdi+3],167
	jnz LB_1213
	add r14,4
	jmp LB_1212
LB_1213:
; .rb_rle 
	add rsp,0
	jmp LB_1208
LB_1212:
	jmp LB_1215
LB_1214:
; .rb_rle 
	add rsp,0
	jmp LB_1208
LB_1215:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2179~1'(= r ) %2178~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2180~0(<2)◂{ } %2179~1'(= r ) %2178~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1216
LB_1216:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1198
LB_1208:
	mov r14,QWORD [rsp]
	jmp LB_1219
LB_1218:
	add r14,1 
LB_1219:
	cmp r14,r9
	jge LB_1220
	JZ_SPC BYTE [r13+8+r14], LB_1218
LB_1220
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1222
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1222
	cmp BYTE [rdi+1],167
	jnz LB_1222
	add r14,2
	jmp LB_1221
LB_1222:
; .rb_rle 
	add rsp,0
	jmp LB_1217
LB_1221:
	jmp LB_1224
LB_1223:
; .rb_rle 
	add rsp,0
	jmp LB_1217
LB_1224:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2182~1'(= r ) %2181~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2183~0(<2)◂{ } %2182~1'(= r ) %2181~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1225
LB_1225:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1198
LB_1217:
	mov r14,QWORD [rsp]
	jmp LB_1228
LB_1227:
	add r14,1 
LB_1228:
	cmp r14,r9
	jge LB_1229
	JZ_SPC BYTE [r13+8+r14], LB_1227
LB_1229
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1231
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1231
	cmp BYTE [rdi+1],182
	jnz LB_1231
	add r14,2
	jmp LB_1230
LB_1231:
; .rb_rle 
	add rsp,0
	jmp LB_1226
LB_1230:
	jmp LB_1233
LB_1232:
; .rb_rle 
	add rsp,0
	jmp LB_1226
LB_1233:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2185~1'(= r ) %2184~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2186~0(<2)◂{ } %2185~1'(= r ) %2184~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1234
LB_1234:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1198
LB_1226:
	mov r14,QWORD [rsp]
	jmp LB_1237
LB_1236:
	add r14,1 
LB_1237:
	cmp r14,r9
	jge LB_1238
	JZ_SPC BYTE [r13+8+r14], LB_1236
LB_1238
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_1240
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1240
	cmp BYTE [rdi+1],136
	jnz LB_1240
	cmp BYTE [rdi+2],142
	jnz LB_1240
	cmp BYTE [rdi+3],226
	jnz LB_1240
	cmp BYTE [rdi+4],136
	jnz LB_1240
	cmp BYTE [rdi+5],142
	jnz LB_1240
	add r14,6
	jmp LB_1239
LB_1240:
; .rb_rle 
	add rsp,0
	jmp LB_1235
LB_1239:
	jmp LB_1242
LB_1241:
; .rb_rle 
	add rsp,0
	jmp LB_1235
LB_1242:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2188~1'(= r ) %2187~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2189~0(<2)◂{ } %2188~1'(= r ) %2187~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1243
LB_1243:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1198
LB_1235:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1198:
; discard r14
	add rsp,8
	ret
ETR_339:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_339
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_339:
	push r14
	jmp LB_1247
LB_1246:
	add r14,1 
LB_1247:
	cmp r14,r9
	jge LB_1248
	JZ_SPC BYTE [r13+8+r14], LB_1246
LB_1248
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_1250
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_1249
LB_1250:
; .rb_rle 
	add rsp,0
	jmp LB_1245
LB_1249:
	jmp LB_1252
LB_1251:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1244
LB_1252:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2192~1'(= r ) %2191~0'(= r ) %2190~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2193~1(<2)◂{ } %2192~1'(= r ) %2191~0'(= r ) %2190~{ } 
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
; mov_ptn2.
	jmp LB_1253
LB_1253:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1244
LB_1245:
	mov r14,QWORD [rsp] 
	jmp LB_1256
LB_1255:
	add r14,1 
LB_1256:
	cmp r14,r9
	jge LB_1257
	JZ_SPC BYTE [r13+8+r14], LB_1255
LB_1257
	cmp r14,r9
	jge LB_1259
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1258
LB_1259:
; .rb_rle 
	add rsp,0
	jmp LB_1254
LB_1258:
	jmp LB_1261
LB_1260:
; .rb_rle 
	add rsp,8
	jmp LB_1254
LB_1261:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2196~1'(= r ) %2195~0'(= r ) %2194~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2197~0(<2)◂{ } %2196~1'(= r ) %2195~0'(= r ) %2194~8'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1262
LB_1262:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1244
LB_1254:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1244:
; discard r14
	add rsp,8
	ret
ETR_340:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_340
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_340:
	push r14
	jmp LB_1266
LB_1265:
	add r14,1 
LB_1266:
	cmp r14,r9
	jge LB_1267
	JZ_SPC BYTE [r13+8+r14], LB_1265
LB_1267
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1269
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_1269
	add r14,1
	jmp LB_1268
LB_1269:
; .rb_rle 
	add rsp,0
	jmp LB_1264
LB_1268:
	jmp LB_1271
LB_1270:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1263
LB_1271:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2200~1'(= r ) %2199~0'(= r ) %2198~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2201~1(<2)◂{ } %2200~1'(= r ) %2199~0'(= r ) %2198~{ } 
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
; mov_ptn2.
	jmp LB_1272
LB_1272:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1263
LB_1264:
	mov r14,QWORD [rsp] 
	jmp LB_1275
LB_1274:
	add r14,1 
LB_1275:
	cmp r14,r9
	jge LB_1276
	JZ_SPC BYTE [r13+8+r14], LB_1274
LB_1276
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_1278
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_1277
LB_1278:
; .rb_rle 
	add rsp,0
	jmp LB_1273
LB_1277:
	jmp LB_1280
LB_1279:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1263
LB_1280:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
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
; mov_ptn2.
	jmp LB_1281
LB_1281:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1263
LB_1273:
	mov r14,QWORD [rsp] 
	jmp LB_1284
LB_1283:
	add r14,1 
LB_1284:
	cmp r14,r9
	jge LB_1285
	JZ_SPC BYTE [r13+8+r14], LB_1283
LB_1285
	cmp r14,r9
	jge LB_1287
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1286
LB_1287:
; .rb_rle 
	add rsp,0
	jmp LB_1282
LB_1286:
	jmp LB_1289
LB_1288:
; .rb_rle 
	add rsp,8
	jmp LB_1282
LB_1289:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2208~1'(= r ) %2207~0'(= r ) %2206~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2209~0(<2)◂{ } %2208~1'(= r ) %2207~0'(= r ) %2206~8'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1290
LB_1290:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1263
LB_1282:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1263:
; discard r14
	add rsp,8
	ret
ETR_341:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_341
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_341:
	push r14
	jmp LB_1294
LB_1293:
	add r14,1 
LB_1294:
	cmp r14,r9
	jge LB_1295
	JZ_SPC BYTE [r13+8+r14], LB_1293
LB_1295
	call GRM_340
	cmp BYTE [r8+6],0
	jnz LB_1297
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_1296
LB_1297:
; .rb_rle 
	add rsp,0
	jmp LB_1292
LB_1296:
	jmp LB_1299
LB_1298:
	add r14,1 
LB_1299:
	cmp r14,r9
	jge LB_1300
	JZ_SPC BYTE [r13+8+r14], LB_1298
LB_1300
	call GRM_341
	cmp BYTE [r8+6],0
	jnz LB_1302
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_1301
LB_1302:
; .rb_rle 
	add rsp,0
	jmp LB_1292
LB_1301:
	jmp LB_1304
LB_1303:
; .rb_rle 
	add rsp,0
	jmp LB_1292
LB_1304:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2213~1'(= r ) %2212~0'(= r ) %2211~{ } %2210~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2214~0(<2)◂{ } %2213~1'(= r ) %2212~0'(= r ) %2211~{ } %2210~{ } 
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
; mov_ptn2.
	jmp LB_1305
LB_1305:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1291
LB_1292:
	mov r14,QWORD [rsp]
	jmp LB_1308
LB_1307:
; .rb_rle 
	add rsp,0
	jmp LB_1306
LB_1308:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2216~1'(= r ) %2215~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2217~0(<2)◂{ } %2216~1'(= r ) %2215~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1309
LB_1309:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1291
LB_1306:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1291:
; discard r14
	add rsp,8
	ret
ETR_342:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_342
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_342:
	push r14
	jmp LB_1313
LB_1312:
	add r14,1 
LB_1313:
	cmp r14,r9
	jge LB_1314
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1312
LB_1314
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1316
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1316
	add r14,1
	jmp LB_1315
LB_1316:
; .rb_rle 
	add rsp,0
	jmp LB_1311
LB_1315:
	jmp LB_1318
LB_1317:
; .rb_rle 
	add rsp,0
	jmp LB_1311
LB_1318:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2220~1'(= r ) %2219~0'(= r ) %2218~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2221~0(<2)◂{ } %2220~1'(= r ) %2219~0'(= r ) %2218~{ } 
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
; mov_ptn2.
	jmp LB_1319
LB_1319:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1310
LB_1311:
	mov r14,QWORD [rsp]
	jmp LB_1322
LB_1321:
	add r14,1 
LB_1322:
	cmp r14,r9
	jge LB_1323
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1321
LB_1323
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_1325
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_1324
LB_1325:
; .rb_rle 
	add rsp,0
	jmp LB_1320
LB_1324:
	jmp LB_1327
LB_1326:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1310
LB_1327:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2224~1'(= r ) %2223~0'(= r ) %2222~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2225~1(<2)◂{ } %2224~1'(= r ) %2223~0'(= r ) %2222~{ } 
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
; mov_ptn2.
	jmp LB_1328
LB_1328:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1310
LB_1320:
	mov r14,QWORD [rsp] 
	jmp LB_1331
LB_1330:
	add r14,1 
LB_1331:
	cmp r14,r9
	jge LB_1332
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1330
LB_1332
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1334
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_1334
	add r14,1
	jmp LB_1333
LB_1334:
; .rb_rle 
	add rsp,0
	jmp LB_1329
LB_1333:
	jmp LB_1336
LB_1335:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1310
LB_1336:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2228~1'(= r ) %2227~0'(= r ) %2226~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2229~1(<2)◂{ } %2228~1'(= r ) %2227~0'(= r ) %2226~{ } 
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
; mov_ptn2.
	jmp LB_1337
LB_1337:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1310
LB_1329:
	mov r14,QWORD [rsp] 
	jmp LB_1340
LB_1339:
	add r14,1 
LB_1340:
	cmp r14,r9
	jge LB_1341
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1339
LB_1341
	cmp r14,r9
	jge LB_1343
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1342
LB_1343:
; .rb_rle 
	add rsp,0
	jmp LB_1338
LB_1342:
	jmp LB_1345
LB_1344:
	add r14,1 
LB_1345:
	cmp r14,r9
	jge LB_1346
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1344
LB_1346
	call GRM_342
	cmp BYTE [r8+6],0
	jnz LB_1348
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1111000010.. |}
; mov_ptn2.
	jmp LB_1347
LB_1348:
; .rb_rle 
	add rsp,8
	jmp LB_1338
LB_1347:
	jmp LB_1350
LB_1349:
; .rb_rle 
	add rsp,8
	jmp LB_1338
LB_1350:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2233~1'(= r ) %2232~0'(= r ) %2231~{ } %2230~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2234~0(<2)◂{ } %2233~1'(= r ) %2232~0'(= r ) %2231~{ } %2230~8'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1351
LB_1351:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1310
LB_1338:
	mov r14,QWORD [rsp]
	jmp LB_1354
LB_1353:
	add r14,1 
LB_1354:
	cmp r14,r9
	jge LB_1355
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1353
LB_1355
	cmp r14,r9
	jge LB_1357
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1356
LB_1357:
; .rb_rle 
	add rsp,0
	jmp LB_1352
LB_1356:
	jmp LB_1359
LB_1358:
; .rb_rle 
	add rsp,8
	jmp LB_1352
LB_1359:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2237~1'(= r ) %2236~0'(= r ) %2235~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2238~0(<2)◂{ } %2237~1'(= r ) %2236~0'(= r ) %2235~8'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1360
LB_1360:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1310
LB_1352:
	mov r14,QWORD [rsp]
	jmp LB_1363
LB_1362:
; .rb_rle 
	add rsp,0
	jmp LB_1361
LB_1363:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2240~1'(= r ) %2239~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2241~0(<2)◂{ } %2240~1'(= r ) %2239~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1364
LB_1364:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1310
LB_1361:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1310:
; discard r14
	add rsp,8
	ret
ETR_343:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_343
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_343:
	push r14
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1368
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1368
	cmp BYTE [rdi+1],167
	jnz LB_1368
	cmp BYTE [rdi+2],126
	jnz LB_1368
	add r14,3
	jmp LB_1367
LB_1368:
; .rb_rle 
	add rsp,0
	jmp LB_1366
LB_1367:
	jmp LB_1370
LB_1369:
; .rb_rle 
	add rsp,0
	jmp LB_1366
LB_1370:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2243~1'(= r ) %2242~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2244~0(<2)◂{ } %2243~1'(= r ) %2242~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1371
LB_1371:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1365
LB_1366:
	mov r14,QWORD [rsp]
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1374
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1374
	cmp BYTE [rdi+1],167
	jnz LB_1374
	cmp BYTE [rdi+2],37
	jnz LB_1374
	add r14,3
	jmp LB_1373
LB_1374:
; .rb_rle 
	add rsp,0
	jmp LB_1372
LB_1373:
	jmp LB_1376
LB_1375:
; .rb_rle 
	add rsp,0
	jmp LB_1372
LB_1376:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2246~1'(= r ) %2245~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2247~0(<2)◂{ } %2246~1'(= r ) %2245~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1377
LB_1377:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1365
LB_1372:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1365:
; discard r14
	add rsp,8
	ret
ETR_344:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_344
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_344:
	push r14
	jmp LB_1381
LB_1380:
	add r14,1 
LB_1381:
	cmp r14,r9
	jge LB_1382
	JZ_SPC BYTE [r13+8+r14], LB_1380
LB_1382
	call GRM_345
	cmp BYTE [r8+6],0
	jnz LB_1384
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1383
LB_1384:
; .rb_rle 
	add rsp,0
	jmp LB_1379
LB_1383:
	jmp LB_1386
LB_1385:
	add r14,1 
LB_1386:
	cmp r14,r9
	jge LB_1387
	JZ_SPC BYTE [r13+8+r14], LB_1385
LB_1387
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1389
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],42
	jnz LB_1389
	add r14,1
	jmp LB_1388
LB_1389:
; .rb_rle 
	add rsp,8
	jmp LB_1379
LB_1388:
	jmp LB_1391
LB_1390:
	add r14,1 
LB_1391:
	cmp r14,r9
	jge LB_1392
	JZ_SPC BYTE [r13+8+r14], LB_1390
LB_1392
	call GRM_101
	cmp BYTE [r8+6],0
	jnz LB_1394
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1393
LB_1394:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1378
LB_1393:
	jmp LB_1396
LB_1395:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1378
LB_1396:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2251~1'(= r ) %2250~0'(= r ) %2249~9'(= {| l |} ) %2248~8'(= r ) 
; #181 9'(= {| l |} ) ⊢ 4(<7)◂9'(= {| l |} )
;; rsp=2 , %2252~4(<7)◂9'(= {| l |} ) %2251~1'(= r ) %2250~0'(= r ) %2248~8'(= r ) 
; #194 { 8'(= r ) 4(<7)◂9'(= {| l |} ) } ⊢ 2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) }
;; rsp=2 , %2253~2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) } %2251~1'(= r ) %2250~0'(= r ) 
; #26 2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) } ⊢ 0(<2)◂2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) }
;; rsp=2 , %2254~0(<2)◂2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) } %2251~1'(= r ) %2250~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_1397
LB_1397:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1378
LB_1379:
	mov r14,QWORD [rsp] 
	jmp LB_1400
LB_1399:
	add r14,1 
LB_1400:
	cmp r14,r9
	jge LB_1401
	JZ_SPC BYTE [r13+8+r14], LB_1399
LB_1401
	call GRM_347
	cmp BYTE [r8+6],0
	jnz LB_1403
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1402
LB_1403:
; .rb_rle 
	add rsp,0
	jmp LB_1398
LB_1402:
	jmp LB_1405
LB_1404:
; .rb_rle 
	add rsp,8
	jmp LB_1398
LB_1405:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2257~1'(= r ) %2256~0'(= r ) %2255~8'(= {| l |} ) 
; #181 8'(= {| l |} ) ⊢ 4(<7)◂8'(= {| l |} )
;; rsp=1 , %2258~4(<7)◂8'(= {| l |} ) %2257~1'(= r ) %2256~0'(= r ) 
; #196 4(<7)◂8'(= {| l |} ) ⊢ 0(<3)◂4(<7)◂8'(= {| l |} )
;; rsp=1 , %2259~0(<3)◂4(<7)◂8'(= {| l |} ) %2257~1'(= r ) %2256~0'(= r ) 
; #26 0(<3)◂4(<7)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} )
;; rsp=1 , %2260~0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} ) %2257~1'(= r ) %2256~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1406
LB_1406:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1378
LB_1398:
	mov r14,QWORD [rsp]
	jmp LB_1409
LB_1408:
	add r14,1 
LB_1409:
	cmp r14,r9
	jge LB_1410
	JZ_SPC BYTE [r13+8+r14], LB_1408
LB_1410
	call GRM_101
	cmp BYTE [r8+6],0
	jnz LB_1412
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1411
LB_1412:
; .rb_rle 
	add rsp,0
	jmp LB_1407
LB_1411:
	jmp LB_1414
LB_1413:
; .rb_rle 
	add rsp,8
	jmp LB_1407
LB_1414:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2263~1'(= r ) %2262~0'(= r ) %2261~8'(= {| l |} ) 
; #181 8'(= {| l |} ) ⊢ 4(<7)◂8'(= {| l |} )
;; rsp=1 , %2264~4(<7)◂8'(= {| l |} ) %2263~1'(= r ) %2262~0'(= r ) 
; #196 4(<7)◂8'(= {| l |} ) ⊢ 0(<3)◂4(<7)◂8'(= {| l |} )
;; rsp=1 , %2265~0(<3)◂4(<7)◂8'(= {| l |} ) %2263~1'(= r ) %2262~0'(= r ) 
; #26 0(<3)◂4(<7)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} )
;; rsp=1 , %2266~0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} ) %2263~1'(= r ) %2262~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1415
LB_1415:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1378
LB_1407:
	mov r14,QWORD [rsp]
	jmp LB_1418
LB_1417:
	add r14,1 
LB_1418:
	cmp r14,r9
	jge LB_1419
	JZ_SPC BYTE [r13+8+r14], LB_1417
LB_1419
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_1421
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1420
LB_1421:
; .rb_rle 
	add rsp,0
	jmp LB_1416
LB_1420:
	jmp LB_1423
LB_1422:
; .rb_rle 
	add rsp,8
	jmp LB_1416
LB_1423:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2269~1'(= r ) %2268~0'(= r ) %2267~8'(= a18◂ [ ] ) 
; #180 8'(= a18◂ [ ] ) ⊢ 5(<7)◂8'(= a18◂ [ ] )
;; rsp=1 , %2270~5(<7)◂8'(= a18◂ [ ] ) %2269~1'(= r ) %2268~0'(= r ) 
; #196 5(<7)◂8'(= a18◂ [ ] ) ⊢ 0(<3)◂5(<7)◂8'(= a18◂ [ ] )
;; rsp=1 , %2271~0(<3)◂5(<7)◂8'(= a18◂ [ ] ) %2269~1'(= r ) %2268~0'(= r ) 
; #26 0(<3)◂5(<7)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂0(<3)◂5(<7)◂8'(= a18◂ [ ] )
;; rsp=1 , %2272~0(<2)◂0(<3)◂5(<7)◂8'(= a18◂ [ ] ) %2269~1'(= r ) %2268~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1424
LB_1424:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1378
LB_1416:
	mov r14,QWORD [rsp]
	jmp LB_1427
LB_1426:
	add r14,1 
LB_1427:
	cmp r14,r9
	jge LB_1428
	JZ_SPC BYTE [r13+8+r14], LB_1426
LB_1428
	call GRM_346
	cmp BYTE [r8+6],0
	jnz LB_1430
	sub rsp,16
; .mov_ptn2 2'(= *{ a22◂ [ ]r} ) ⊢ { 8'(= a22◂ [ ] ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_1429
LB_1430:
; .rb_rle 
	add rsp,0
	jmp LB_1425
LB_1429:
	jmp LB_1432
LB_1431:
; .rb_rle 
	add rsp,16
	jmp LB_1425
LB_1432:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2275~1'(= r ) %2274~0'(= r ) %2273~{ 8'(= a22◂ [ ] ) 9'(= r ) } 
; #195 { 8'(= a22◂ [ ] ) 9'(= r ) } ⊢ 1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) }
;; rsp=2 , %2276~1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) } %2275~1'(= r ) %2274~0'(= r ) 
; #26 1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) } ⊢ 0(<2)◂1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) }
;; rsp=2 , %2277~0(<2)◂1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) } %2275~1'(= r ) %2274~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_1433
LB_1433:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1378
LB_1425:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1378:
; discard r14
	add rsp,8
	ret
ETR_345:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_345
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_345:
	push r14
	cmp r14,r9
	jge LB_1437
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_1437
	add r14,rsi
	push rdi
	jmp LB_1436
LB_1437:
; .rb_rle 
	add rsp,0
	jmp LB_1435
LB_1436:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1439
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_1439
	add r14,1
	jmp LB_1438
LB_1439:
; .rb_rle 
	add rsp,8
	jmp LB_1435
LB_1438:
	jmp LB_1441
LB_1440:
; .rb_rle 
	add rsp,8
	jmp LB_1435
LB_1441:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2280~1'(= r ) %2279~0'(= r ) %2278~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %2281~0(<2)◂8'(= r ) %2280~1'(= r ) %2279~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1442
LB_1442:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1434
LB_1435:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1434:
; discard r14
	add rsp,8
	ret
ETR_346:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_346
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_346:
	push r14
	cmp r14,r9
	jge LB_1446
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_1446
	add r14,rsi
	push rdi
	jmp LB_1445
LB_1446:
; .rb_rle 
	add rsp,0
	jmp LB_1444
LB_1445:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1448
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],100
	jnz LB_1448
	cmp BYTE [rdi+1],39
	jnz LB_1448
	add r14,2
	jmp LB_1447
LB_1448:
; .rb_rle 
	add rsp,8
	jmp LB_1444
LB_1447:
	jmp LB_1450
LB_1449:
; .rb_rle 
	add rsp,8
	jmp LB_1444
LB_1450:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2284~1'(= r ) %2283~0'(= r ) %2282~8'(= r ) 
; #199 { } ⊢ 1(<4)◂{ }
;; rsp=1 , %2285~1(<4)◂{ } %2284~1'(= r ) %2283~0'(= r ) %2282~8'(= r ) 
; #26 { 1(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 1(<4)◂{ } 8'(= r ) }
;; rsp=1 , %2286~0(<2)◂{ 1(<4)◂{ } 8'(= r ) } %2284~1'(= r ) %2283~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1451
LB_1451:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1443
LB_1444:
	mov r14,QWORD [rsp]
	cmp r14,r9
	jge LB_1454
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_1454
	add r14,rsi
	push rdi
	jmp LB_1453
LB_1454:
; .rb_rle 
	add rsp,0
	jmp LB_1452
LB_1453:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1456
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
	jnz LB_1456
	cmp BYTE [rdi+1],39
	jnz LB_1456
	add r14,2
	jmp LB_1455
LB_1456:
; .rb_rle 
	add rsp,8
	jmp LB_1452
LB_1455:
	jmp LB_1458
LB_1457:
; .rb_rle 
	add rsp,8
	jmp LB_1452
LB_1458:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2289~1'(= r ) %2288~0'(= r ) %2287~8'(= r ) 
; #198 { } ⊢ 2(<4)◂{ }
;; rsp=1 , %2290~2(<4)◂{ } %2289~1'(= r ) %2288~0'(= r ) %2287~8'(= r ) 
; #26 { 2(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 2(<4)◂{ } 8'(= r ) }
;; rsp=1 , %2291~0(<2)◂{ 2(<4)◂{ } 8'(= r ) } %2289~1'(= r ) %2288~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1459
LB_1459:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1443
LB_1452:
	mov r14,QWORD [rsp]
	cmp r14,r9
	jge LB_1462
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_1462
	add r14,rsi
	push rdi
	jmp LB_1461
LB_1462:
; .rb_rle 
	add rsp,0
	jmp LB_1460
LB_1461:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1464
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_1464
	add r14,1
	jmp LB_1463
LB_1464:
; .rb_rle 
	add rsp,8
	jmp LB_1460
LB_1463:
	jmp LB_1466
LB_1465:
; .rb_rle 
	add rsp,8
	jmp LB_1460
LB_1466:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2294~1'(= r ) %2293~0'(= r ) %2292~8'(= r ) 
; #200 { } ⊢ 0(<4)◂{ }
;; rsp=1 , %2295~0(<4)◂{ } %2294~1'(= r ) %2293~0'(= r ) %2292~8'(= r ) 
; #26 { 0(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 0(<4)◂{ } 8'(= r ) }
;; rsp=1 , %2296~0(<2)◂{ 0(<4)◂{ } 8'(= r ) } %2294~1'(= r ) %2293~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1467
LB_1467:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1443
LB_1460:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1443:
; discard r14
	add rsp,8
	ret
ETR_347:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_347
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_347:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1471
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],96
	jnz LB_1471
	add r14,1
	jmp LB_1470
LB_1471:
; .rb_rle 
	add rsp,0
	jmp LB_1469
LB_1470:
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_1473
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1472
LB_1473:
; .rb_rle 
	add rsp,0
	jmp LB_1469
LB_1472:
	jmp LB_1475
LB_1474:
; .rb_rle 
	add rsp,8
	jmp LB_1469
LB_1475:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2299~1'(= r ) %2298~0'(= r ) %2297~8'(= a14◂ [ ] ) 
; #74 8'(= a14◂ [ ] ) ⊢ { 3'(= a14◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 8'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 100000001110.. |}
	mov r13,QWORD [rsp-8+8*3]
; mov_ptn2.
	call LB_69
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
	add rsp,24
;; rsp=0 , %2301~2'(= {| l |} ) %2300~3'(= a14◂ [ ] ) %2299~1'(= r ) %2298~0'(= r ) 
; #26 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %2302~0(<2)◂2'(= {| l |} ) %2300~3'(= a14◂ [ ] ) %2299~1'(= r ) %2298~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .dlt.ptn 3'(= a14◂ [ ] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_80
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
; mov_ptn2.
	jmp LB_1476
LB_1476:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1468
LB_1469:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1468:
; discard r14
	add rsp,8
	ret
ETR_348:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_348
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_348:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1480
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1480
	add r14,1
	jmp LB_1479
LB_1480:
; .rb_rle 
	add rsp,0
	jmp LB_1478
LB_1479:
	jmp LB_1482
LB_1481:
; .rb_rle 
	add rsp,0
	jmp LB_1478
LB_1482:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2304~1'(= r ) %2303~0'(= r ) 
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %2305~%[ 10r ] %2304~1'(= r ) %2303~0'(= r ) 
; #63 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %2306~2(<4)◂{ } %2305~%[ 10r ] %2304~1'(= r ) %2303~0'(= r ) 
; #71 { %[ 10r ] 2(<4)◂{ } } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ 10r ] 2(<4)◂{ } } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 11000000110.. |}
	mov r14,unt_2
	mov r13,10
; mov_ptn2.
	call LB_55
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %2307~2'(= a14◂ [ ] ) %2304~1'(= r ) %2303~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %2308~0(<2)◂2'(= a14◂ [ ] ) %2304~1'(= r ) %2303~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1483
LB_1483:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1477
LB_1478:
	mov r14,QWORD [rsp]
	cmp r14,r9
	jge LB_1486
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1485
LB_1486:
; .rb_rle 
	add rsp,0
	jmp LB_1484
LB_1485:
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_1488
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1487
LB_1488:
; .rb_rle 
	add rsp,8
	jmp LB_1484
LB_1487:
	jmp LB_1490
LB_1489:
; .rb_rle 
	add rsp,16
	jmp LB_1484
LB_1490:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2312~1'(= r ) %2311~0'(= r ) %2310~9'(= a14◂ [ ] ) %2309~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_55
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %2313~2'(= a14◂ [ ] ) %2312~1'(= r ) %2311~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %2314~0(<2)◂2'(= a14◂ [ ] ) %2312~1'(= r ) %2311~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1491
LB_1491:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1477
LB_1484:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1477:
; discard r14
	add rsp,8
	ret
ETR_349:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_349
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_349:
	push r14
	jmp LB_1495
LB_1494:
	add r14,1 
LB_1495:
	cmp r14,r9
	jge LB_1496
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1494
LB_1496
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_1498
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1497
LB_1498:
; .rb_rle 
	add rsp,0
	jmp LB_1493
LB_1497:
	jmp LB_1500
LB_1499:
	add r14,1 
LB_1500:
	cmp r14,r9
	jge LB_1501
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1499
LB_1501
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1503
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],47
	jnz LB_1503
	cmp BYTE [rdi+1],47
	jnz LB_1503
	add r14,2
	jmp LB_1502
LB_1503:
; .rb_rle 
	add rsp,8
	jmp LB_1493
LB_1502:
	jmp LB_1505
LB_1504:
; .rb_rle 
	add rsp,8
	jmp LB_1493
LB_1505:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2317~1'(= r ) %2316~0'(= r ) %2315~8'(= a47◂ [ *{ }] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2318~1(<2)◂{ } %2317~1'(= r ) %2316~0'(= r ) %2315~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=1 , %2319~0(<2)◂1(<2)◂{ } %2317~1'(= r ) %2316~0'(= r ) %2315~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
	C_POP_REGS
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ a18◂ [ ]]]] )
; {| 0010.. |}
	mov r8,unt_1
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1506
LB_1506:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1492
LB_1493:
	mov r14,QWORD [rsp]
	jmp LB_1509
LB_1508:
	add r14,1 
LB_1509:
	cmp r14,r9
	jge LB_1510
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1508
LB_1510
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_1512
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1511
LB_1512:
; .rb_rle 
	add rsp,0
	jmp LB_1507
LB_1511:
	jmp LB_1514
LB_1513:
	add r14,1 
LB_1514:
	cmp r14,r9
	jge LB_1515
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1513
LB_1515
	call GRM_344
	cmp BYTE [r8+6],0
	jnz LB_1517
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a23◂ [ a18◂ [ ]] ) ⊢ 9'(= a23◂ [ a18◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1516
LB_1517:
; .rb_rle 
	add rsp,8
	jmp LB_1507
LB_1516:
	jmp LB_1519
LB_1518:
	add r14,1 
LB_1519:
	cmp r14,r9
	jge LB_1520
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1518
LB_1520
	call GRM_349
	cmp BYTE [r8+6],0
	jnz LB_1522
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) ⊢ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1521
LB_1522:
; .rb_rle 
	add rsp,16
	jmp LB_1507
LB_1521:
	jmp LB_1524
LB_1523:
; .rb_rle 
	add rsp,24
	jmp LB_1507
LB_1524:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2324~1'(= r ) %2323~0'(= r ) %2322~10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) %2321~9'(= a23◂ [ a18◂ [ ]] ) %2320~8'(= a47◂ [ *{ }] ) 
; #25 { 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } ⊢ 0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) }
;; rsp=3 , %2325~0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } %2324~1'(= r ) %2323~0'(= r ) %2320~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } ⊢ 0(<2)◂0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) }
;; rsp=3 , %2326~0(<2)◂0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } %2324~1'(= r ) %2323~0'(= r ) %2320~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_1525
LB_1525:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1492
LB_1507:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1492:
; discard r14
	add rsp,8
	ret
LB_1673:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1676+8*rax]
LB_1676: dq LB_1674,LB_1675
LB_1674:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1672
	jmp LB_1677
LB_1675:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1678
	jmp LB_1677
LB_1677:
	ret
LB_1678:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1681+8*rax]
LB_1681: dq LB_1679,LB_1680
LB_1679:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1683
	jmp LB_1682
LB_1680:
	mov rdi,r8
	call free_s8
	jmp LB_1682
LB_1682:
	ret
LB_1683:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1686+8*rax]
LB_1686: dq LB_1684,LB_1685
LB_1684:
	mov rdi,r8
	call free_s8
	jmp LB_1687
LB_1685:
	jmp LB_1687
LB_1687:
	ret
LB_1672:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1690+8*rax]
LB_1690: dq LB_1688,LB_1689
LB_1688:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1673
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1672
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1691
LB_1689:
	jmp LB_1691
LB_1691:
	ret
LB_1710:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1713+8*rax]
LB_1713: dq LB_1711,LB_1712
LB_1711:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1715
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1716
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1717
	pop r8 
	FREE_RCD 3, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1710
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1714
LB_1712:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1715
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1716
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1717
	pop r8 
	FREE_RCD 3, r8
	jmp LB_1714
LB_1714:
	ret
LB_1717:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1721+8*rax]
LB_1721: dq LB_1718,LB_1719,LB_1720
LB_1718:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1723
	jmp LB_1722
LB_1719:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1724
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1710
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1722
LB_1720:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1725
	jmp LB_1722
LB_1722:
	ret
LB_1725:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1733+8*rax]
LB_1733: dq LB_1726,LB_1727,LB_1728,LB_1729,LB_1730,LB_1731,LB_1732
LB_1726:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1735
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1724
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1734
LB_1727:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1736
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1724
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1734
LB_1728:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1737
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1725
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1734
LB_1729:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1723
	jmp LB_1734
LB_1730:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1724
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1738
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1734
LB_1731:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1739
	jmp LB_1734
LB_1732:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1734
LB_1734:
	ret
LB_1739:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1742+8*rax]
LB_1742: dq LB_1740,LB_1741
LB_1740:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1724
	jmp LB_1743
LB_1741:
	jmp LB_1743
LB_1743:
	ret
LB_1738:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1746+8*rax]
LB_1746: dq LB_1744,LB_1745
LB_1744:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1710
	jmp LB_1747
LB_1745:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1672
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1725
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1747
LB_1747:
	ret
LB_1737:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1752+8*rax]
LB_1752: dq LB_1748,LB_1749,LB_1750,LB_1751
LB_1748:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1735
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1724
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1673
	pop r8 
	FREE_RCD 3, r8
	jmp LB_1753
LB_1749:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1736
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1724
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1673
	pop r8 
	FREE_RCD 3, r8
	jmp LB_1753
LB_1750:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1754
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1724
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1673
	pop r8 
	FREE_RCD 3, r8
	jmp LB_1753
LB_1751:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1755
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1756
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1757
	pop r8 
	FREE_RCD 3, r8
	jmp LB_1753
LB_1753:
	ret
LB_1757:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1760+8*rax]
LB_1760: dq LB_1758,LB_1759
LB_1758:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1678
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1757
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1761
LB_1759:
	jmp LB_1761
LB_1761:
	ret
LB_1756:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1764+8*rax]
LB_1764: dq LB_1762,LB_1763
LB_1762:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1736
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1756
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1765
LB_1763:
	jmp LB_1765
LB_1765:
	ret
LB_1755:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1768+8*rax]
LB_1768: dq LB_1766,LB_1767
LB_1766:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1770
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1755
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1769
LB_1767:
	jmp LB_1769
LB_1769:
	ret
LB_1770:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1774+8*rax]
LB_1774: dq LB_1771,LB_1772,LB_1773
LB_1771:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1754
	jmp LB_1775
LB_1772:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1776
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1775
LB_1773:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1754
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1775
LB_1775:
	ret
LB_1776:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1781+8*rax]
LB_1781: dq LB_1777,LB_1778,LB_1779,LB_1780
LB_1777:
	jmp LB_1782
LB_1778:
	jmp LB_1782
LB_1779:
	jmp LB_1782
LB_1780:
	jmp LB_1782
LB_1782:
	ret
LB_1754:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1790+8*rax]
LB_1790: dq LB_1783,LB_1784,LB_1785,LB_1786,LB_1787,LB_1788,LB_1789
LB_1783:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1792
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_1792
	pop r8 
	FREE_RCD 4, r8
	jmp LB_1791
LB_1784:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1793
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1794
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1791
LB_1785:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1791
LB_1786:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1791
LB_1787:
	mov rdi,r8
	call free_s8
	jmp LB_1791
LB_1788:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1735
	jmp LB_1791
LB_1789:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1791
LB_1791:
	ret
LB_1794:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1802+8*rax]
LB_1802: dq LB_1795,LB_1796,LB_1797,LB_1798,LB_1799,LB_1800,LB_1801
LB_1795:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1804
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1803
LB_1796:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1805
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1804
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1803
LB_1797:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1806
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1794
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1803
LB_1798:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1807
	jmp LB_1803
LB_1799:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1804
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1808
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1803
LB_1800:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1809
	jmp LB_1803
LB_1801:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1803
LB_1803:
	ret
LB_1809:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1812+8*rax]
LB_1812: dq LB_1810,LB_1811
LB_1810:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1804
	jmp LB_1813
LB_1811:
	jmp LB_1813
LB_1813:
	ret
LB_1808:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1816+8*rax]
LB_1816: dq LB_1814,LB_1815
LB_1814:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1818
	jmp LB_1817
LB_1815:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1819
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1794
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1817
LB_1817:
	ret
LB_1819:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1822+8*rax]
LB_1822: dq LB_1820,LB_1821
LB_1820:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1793
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1819
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1823
LB_1821:
	jmp LB_1823
LB_1823:
	ret
LB_1818:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1826+8*rax]
LB_1826: dq LB_1824,LB_1825
LB_1824:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1828
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1829
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1830
	pop r8 
	FREE_RCD 3, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1818
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1827
LB_1825:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1828
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1829
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1830
	pop r8 
	FREE_RCD 3, r8
	jmp LB_1827
LB_1827:
	ret
LB_1830:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1834+8*rax]
LB_1834: dq LB_1831,LB_1832,LB_1833
LB_1831:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1807
	jmp LB_1835
LB_1832:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1804
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1818
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1835
LB_1833:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1794
	jmp LB_1835
LB_1835:
	ret
LB_1829:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1838+8*rax]
LB_1838: dq LB_1836,LB_1837
LB_1836:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1840
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1829
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1839
LB_1837:
	jmp LB_1839
LB_1839:
	ret
LB_1840:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1844+8*rax]
LB_1844: dq LB_1841,LB_1842,LB_1843
LB_1841:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1804
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1828
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1845
LB_1842:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1846
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1846
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1845
LB_1843:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1846
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1846
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1845
LB_1845:
	ret
LB_1846:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1849+8*rax]
LB_1849: dq LB_1847,LB_1848
LB_1847:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1851
	jmp LB_1850
LB_1848:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1850
LB_1850:
	ret
LB_1851:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1859+8*rax]
LB_1859: dq LB_1852,LB_1853,LB_1854,LB_1855,LB_1856,LB_1857,LB_1858
LB_1852:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1792
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_1792
	pop r8 
	FREE_RCD 4, r8
	jmp LB_1860
LB_1853:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1793
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1794
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1860
LB_1854:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1860
LB_1855:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1860
LB_1856:
	mov rdi,r8
	call free_s8
	jmp LB_1860
LB_1857:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1860
LB_1858:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1860
LB_1860:
	ret
LB_1828:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1863+8*rax]
LB_1863: dq LB_1861,LB_1862
LB_1861:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1865
	jmp LB_1864
LB_1862:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1866
	jmp LB_1864
LB_1864:
	ret
LB_1866:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1871+8*rax]
LB_1871: dq LB_1867,LB_1868,LB_1869,LB_1870
LB_1867:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1828
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1872
LB_1868:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1851
	jmp LB_1872
LB_1869:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1873
	jmp LB_1872
LB_1870:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1872
LB_1872:
	ret
LB_1873:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1876+8*rax]
LB_1876: dq LB_1874,LB_1875
LB_1874:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1877
LB_1875:
	jmp LB_1877
LB_1877:
	ret
LB_1865:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1880+8*rax]
LB_1880: dq LB_1878,LB_1879
LB_1878:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1828
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1865
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1881
LB_1879:
	jmp LB_1881
LB_1881:
	ret
LB_1807:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1884+8*rax]
LB_1884: dq LB_1882,LB_1883
LB_1882:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1829
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1830
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1807
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1885
LB_1883:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1829
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1830
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1885
LB_1885:
	ret
LB_1806:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1890+8*rax]
LB_1890: dq LB_1886,LB_1887,LB_1888,LB_1889
LB_1886:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1804
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1793
	pop r8 
	FREE_RCD 3, r8
	jmp LB_1891
LB_1887:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1805
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1804
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1793
	pop r8 
	FREE_RCD 3, r8
	jmp LB_1891
LB_1888:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1851
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1804
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1793
	pop r8 
	FREE_RCD 3, r8
	jmp LB_1891
LB_1889:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1892
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1893
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1894
	pop r8 
	FREE_RCD 3, r8
	jmp LB_1891
LB_1891:
	ret
LB_1894:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1897+8*rax]
LB_1897: dq LB_1895,LB_1896
LB_1895:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1899
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1894
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1898
LB_1896:
	jmp LB_1898
LB_1898:
	ret
LB_1899:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1902+8*rax]
LB_1902: dq LB_1900,LB_1901
LB_1900:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1873
	jmp LB_1903
LB_1901:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1903
LB_1903:
	ret
LB_1893:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1906+8*rax]
LB_1906: dq LB_1904,LB_1905
LB_1904:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1805
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1893
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1907
LB_1905:
	jmp LB_1907
LB_1907:
	ret
LB_1892:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1910+8*rax]
LB_1910: dq LB_1908,LB_1909
LB_1908:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1912
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1892
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1911
LB_1909:
	jmp LB_1911
LB_1911:
	ret
LB_1912:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1916+8*rax]
LB_1916: dq LB_1913,LB_1914,LB_1915
LB_1913:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1851
	jmp LB_1917
LB_1914:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1776
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1917
LB_1915:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1851
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1917
LB_1917:
	ret
LB_1805:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1920+8*rax]
LB_1920: dq LB_1918,LB_1919
LB_1918:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1851
	jmp LB_1921
LB_1919:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1921
LB_1921:
	ret
LB_1804:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1924+8*rax]
LB_1924: dq LB_1922,LB_1923
LB_1922:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1926
	jmp LB_1925
LB_1923:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1805
	jmp LB_1925
LB_1925:
	ret
LB_1926:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1929+8*rax]
LB_1929: dq LB_1927,LB_1928
LB_1927:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1804
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1926
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1930
LB_1928:
	jmp LB_1930
LB_1930:
	ret
LB_1793:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1933+8*rax]
LB_1933: dq LB_1931,LB_1932
LB_1931:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1819
	jmp LB_1934
LB_1932:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1899
	jmp LB_1934
LB_1934:
	ret
LB_1792:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1937+8*rax]
LB_1937: dq LB_1935,LB_1936
LB_1935:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1939
	jmp LB_1938
LB_1936:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1940
	jmp LB_1938
LB_1938:
	ret
LB_1940:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1945+8*rax]
LB_1945: dq LB_1941,LB_1942,LB_1943,LB_1944
LB_1941:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1947
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1946
LB_1942:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1851
	jmp LB_1946
LB_1943:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1792
	pop r8 
	FREE_RCD 3, r8
	jmp LB_1946
LB_1944:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1946
LB_1946:
	ret
LB_1947:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1952+8*rax]
LB_1952: dq LB_1948,LB_1949,LB_1950,LB_1951
LB_1948:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1954
	jmp LB_1953
LB_1949:
	jmp LB_1953
LB_1950:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_1953
LB_1951:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1955
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1953
LB_1953:
	ret
LB_1955:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1958+8*rax]
LB_1958: dq LB_1956,LB_1957
LB_1956:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1947
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1955
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1959
LB_1957:
	jmp LB_1959
LB_1959:
	ret
LB_1954:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1965+8*rax]
LB_1965: dq LB_1960,LB_1961,LB_1962,LB_1963,LB_1964
LB_1960:
	jmp LB_1966
LB_1961:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1947
	jmp LB_1966
LB_1962:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1947
	jmp LB_1966
LB_1963:
	jmp LB_1966
LB_1964:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1955
	jmp LB_1966
LB_1966:
	ret
LB_1939:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1969+8*rax]
LB_1969: dq LB_1967,LB_1968
LB_1967:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1792
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1939
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1970
LB_1968:
	jmp LB_1970
LB_1970:
	ret
LB_1736:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1973+8*rax]
LB_1973: dq LB_1971,LB_1972
LB_1971:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1754
	jmp LB_1974
LB_1972:
	mov rdi,r8
	call free_s8
	jmp LB_1974
LB_1974:
	ret
LB_1735:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1977+8*rax]
LB_1977: dq LB_1975,LB_1976
LB_1975:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1735
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1978
LB_1976:
	mov rdi,r8
	call free_s8
	jmp LB_1978
LB_1978:
	ret
LB_1724:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1981+8*rax]
LB_1981: dq LB_1979,LB_1980
LB_1979:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1983
	jmp LB_1982
LB_1980:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1736
	jmp LB_1982
LB_1982:
	ret
LB_1983:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1986+8*rax]
LB_1986: dq LB_1984,LB_1985
LB_1984:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1724
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1983
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1987
LB_1985:
	jmp LB_1987
LB_1987:
	ret
LB_1723:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1990+8*rax]
LB_1990: dq LB_1988,LB_1989
LB_1988:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1716
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1717
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1723
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1991
LB_1989:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1716
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1717
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1991
LB_1991:
	ret
LB_1716:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1994+8*rax]
LB_1994: dq LB_1992,LB_1993
LB_1992:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1996
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1716
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1995
LB_1993:
	jmp LB_1995
LB_1995:
	ret
LB_1996:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2000+8*rax]
LB_2000: dq LB_1997,LB_1998,LB_1999
LB_1997:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1724
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1715
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2001
LB_1998:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2002
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2002
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2001
LB_1999:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2002
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2002
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2001
LB_2001:
	ret
LB_2002:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2005+8*rax]
LB_2005: dq LB_2003,LB_2004
LB_2003:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1754
	jmp LB_2006
LB_2004:
	mov rdi,r8
	call free_s8
	jmp LB_2006
LB_2006:
	ret
LB_1715:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2009+8*rax]
LB_2009: dq LB_2007,LB_2008
LB_2007:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2011
	jmp LB_2010
LB_2008:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2012
	jmp LB_2010
LB_2010:
	ret
LB_2012:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2017+8*rax]
LB_2017: dq LB_2013,LB_2014,LB_2015,LB_2016
LB_2013:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1735
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1715
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2018
LB_2014:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1754
	jmp LB_2018
LB_2015:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1683
	jmp LB_2018
LB_2016:
	mov rdi,r8
	call free_s8
	jmp LB_2018
LB_2018:
	ret
LB_2011:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2021+8*rax]
LB_2021: dq LB_2019,LB_2020
LB_2019:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1715
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2011
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2022
LB_2020:
	jmp LB_2022
LB_2022:
	ret
LB_2291: ;; #312 { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } ⊢ 0'(= a47◂ [ q0] ) : ({ _r64 _r64 _s8 }→_t47◂6402'(=6403'(1)))
;; rsp=0 , %1824~2'(= {| l |} ) %1823~1'(= r ) %1822~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1825~1(<2)◂{ } %1824~2'(= {| l |} ) %1823~1'(= r ) %1822~0'(= r ) 
; #25 { { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
;; rsp=0 , %1826~0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
;; rsp=0 , %1827~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } 
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
; mov_ptn2.
; .add_rsp 0
	ret
ETR_350:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_350
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_350:
	push r14
	jmp LB_1529
LB_1528:
	add r14,1 
LB_1529:
	cmp r14,r9
	jge LB_1530
	JZ_SPC BYTE [r13+8+r14], LB_1528
LB_1530
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_1532
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1531
LB_1532:
; .rb_rle 
	add rsp,0
	jmp LB_1527
LB_1531:
	jmp LB_1534
LB_1533:
	add r14,1 
LB_1534:
	cmp r14,r9
	jge LB_1535
	JZ_SPC BYTE [r13+8+r14], LB_1533
LB_1535
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_1537
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1537
	cmp BYTE [rdi+1],136
	jnz LB_1537
	cmp BYTE [rdi+2],142
	jnz LB_1537
	cmp BYTE [rdi+3],124
	jnz LB_1537
	add r14,4
	jmp LB_1536
LB_1537:
; .rb_rle 
	add rsp,8
	jmp LB_1527
LB_1536:
	jmp LB_1539
LB_1538:
; .rb_rle 
	add rsp,8
	jmp LB_1527
LB_1539:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2329~1'(= r ) %2328~0'(= r ) %2327~8'(= a47◂ [ *{ }] ) 
; #172 0'(= r ) ⊢ 6(<7)◂0'(= r )
;; rsp=1 , %2330~6(<7)◂0'(= r ) %2329~1'(= r ) %2327~8'(= a47◂ [ *{ }] ) 
; #309 6(<7)◂0'(= r ) ⊢ 0(<2)◂6(<7)◂0'(= r )
;; rsp=1 , %2331~0(<2)◂6(<7)◂0'(= r ) %2329~1'(= r ) %2327~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂6(<7)◂0'(= r ) ⊢ 0(<2)◂0(<2)◂6(<7)◂0'(= r )
;; rsp=1 , %2332~0(<2)◂0(<2)◂6(<7)◂0'(= r ) %2329~1'(= r ) %2327~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1540
LB_1540:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1526
LB_1527:
	mov r14,QWORD [rsp]
	jmp LB_1543
LB_1542:
	add r14,1 
LB_1543:
	cmp r14,r9
	jge LB_1544
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1542
LB_1544
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_1546
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1545
LB_1546:
; .rb_rle 
	add rsp,0
	jmp LB_1541
LB_1545:
	jmp LB_1548
LB_1547:
	add r14,1 
LB_1548:
	cmp r14,r9
	jge LB_1549
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1547
LB_1549
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1551
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1551
	cmp BYTE [rdi+1],136
	jnz LB_1551
	cmp BYTE [rdi+2],142
	jnz LB_1551
	add r14,3
	jmp LB_1550
LB_1551:
; .rb_rle 
	add rsp,8
	jmp LB_1541
LB_1550:
	push r14
	jmp LB_1557
LB_1556:
	add r14,1 
LB_1557:
	cmp r14,r9
	jge LB_1558
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1556
LB_1558
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1560
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1560
	add r14,1
	jmp LB_1559
LB_1560:
; .rb_rle 
	add rsp,0
	jmp LB_1555
LB_1559:
	jmp LB_1562
LB_1561:
; .rb_rle 
	add rsp,0
	jmp LB_1555
LB_1562:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2337~1'(= r ) %2336~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2338~1(<2)◂{ } %2337~1'(= r ) %2336~0'(= r ) 
; #173 1(<2)◂{ } ⊢ 5(<7)◂1(<2)◂{ }
;; rsp=0 , %2339~5(<7)◂1(<2)◂{ } %2337~1'(= r ) %2336~0'(= r ) 
; #309 5(<7)◂1(<2)◂{ } ⊢ 0(<2)◂5(<7)◂1(<2)◂{ }
;; rsp=0 , %2340~0(<2)◂5(<7)◂1(<2)◂{ } %2337~1'(= r ) %2336~0'(= r ) 
; #26 0(<2)◂5(<7)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂5(<7)◂1(<2)◂{ }
;; rsp=0 , %2341~0(<2)◂0(<2)◂5(<7)◂1(<2)◂{ } %2337~1'(= r ) %2336~0'(= r ) 
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
; mov_ptn2.
	jmp LB_1563
LB_1563:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1554
LB_1555:
	mov r14,QWORD [rsp]
	jmp LB_1566
LB_1565:
	add r14,1 
LB_1566:
	cmp r14,r9
	jge LB_1567
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1565
LB_1567
	call GRM_318
	cmp BYTE [r8+6],0
	jnz LB_1569
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1568
LB_1569:
; .rb_rle 
	add rsp,0
	jmp LB_1564
LB_1568:
	jmp LB_1571
LB_1570:
	add r14,1 
LB_1571:
	cmp r14,r9
	jge LB_1572
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1570
LB_1572
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1574
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1574
	add r14,1
	jmp LB_1573
LB_1574:
; .rb_rle 
	add rsp,8
	jmp LB_1564
LB_1573:
	jmp LB_1576
LB_1575:
; .rb_rle 
	add rsp,8
	jmp LB_1564
LB_1576:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2344~1'(= r ) %2343~0'(= r ) %2342~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #26 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2345~0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2344~1'(= r ) %2343~0'(= r ) 
; #173 0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2346~5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2344~1'(= r ) %2343~0'(= r ) 
; #309 5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2347~0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2344~1'(= r ) %2343~0'(= r ) 
; #26 0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2348~0(<2)◂0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2344~1'(= r ) %2343~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1577
LB_1577:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1554
LB_1564:
	mov r14,QWORD [rsp]
	jmp LB_1580
LB_1579:
	add r14,1 
LB_1580:
	cmp r14,r9
	jge LB_1581
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1579
LB_1581
	call GRM_337
	cmp BYTE [r8+6],0
	jnz LB_1583
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_1582
LB_1583:
; .rb_rle 
	add rsp,0
	jmp LB_1578
LB_1582:
	jmp LB_1585
LB_1584:
; .rb_rle 
	add rsp,16
	jmp LB_1578
LB_1585:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2351~1'(= r ) %2350~0'(= r ) %2349~{ 8'(= r ) 9'(= r ) } 
; $ %[ "lc_code ∎ .. " ] ⊢ %[ "lc_code ∎ .. " ]
;; rsp=2 , %2352~%[ "lc_code ∎ .. " ] %2351~1'(= r ) %2350~0'(= r ) %2349~{ 8'(= r ) 9'(= r ) } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2353~1(<2)◂{ } %2352~%[ "lc_code ∎ .. " ] %2351~1'(= r ) %2350~0'(= r ) %2349~{ 8'(= r ) 9'(= r ) } 
; #25 { { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %2354~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %2349~{ 8'(= r ) 9'(= r ) } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %2355~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %2349~{ 8'(= r ) 9'(= r ) } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %2356~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %2349~{ 8'(= r ) 9'(= r ) } 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_1586
LB_1586:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1554
LB_1578:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1554:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_1552
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_1553
LB_1552:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_1553:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2357~3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2335~1'(= r ) %2334~0'(= r ) %2333~8'(= a47◂ [ *{ }] ) 
; #26 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2358~0(<2)◂3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2335~1'(= r ) %2334~0'(= r ) %2333~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
	C_POP_REGS
; .mov_ptn2 0(<2)◂3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1587
LB_1587:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1526
LB_1541:
	mov r14,QWORD [rsp] 
	jmp LB_1590
LB_1589:
	add r14,1 
LB_1590:
	cmp r14,r9
	jge LB_1591
	JZ_SPC BYTE [r13+8+r14], LB_1589
LB_1591
	call GRM_354
	cmp BYTE [r8+6],0
	jnz LB_1593
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1592
LB_1593:
; .rb_rle 
	add rsp,0
	jmp LB_1588
LB_1592:
	jmp LB_1595
LB_1594:
; .rb_rle 
	add rsp,8
	jmp LB_1588
LB_1595:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2361~1'(= r ) %2360~0'(= r ) %2359~8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_1598
	jmp LB_1599
LB_1598:
	jmp LB_1597
LB_1599:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2363~2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2361~1'(= r ) %2360~0'(= r ) 
; #175 2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2364~3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2361~1'(= r ) %2360~0'(= r ) 
; #309 3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2365~0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2361~1'(= r ) %2360~0'(= r ) 
; #26 0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2366~0(<2)◂0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2361~1'(= r ) %2360~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1596
LB_1597:
;; ?. 8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2362~2'(= a2◂ [ *{ rr{| l |}}] ) %2361~1'(= r ) %2360~0'(= r ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2367~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2361~1'(= r ) %2360~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2368~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2361~1'(= r ) %2360~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1596
LB_1596:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1526
LB_1588:
	mov r14,QWORD [rsp]
	jmp LB_1602
LB_1601:
	add r14,1 
LB_1602:
	cmp r14,r9
	jge LB_1603
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1601
LB_1603
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_1605
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1604
LB_1605:
; .rb_rle 
	add rsp,0
	jmp LB_1600
LB_1604:
	jmp LB_1607
LB_1606:
	add r14,1 
LB_1607:
	cmp r14,r9
	jge LB_1608
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1606
LB_1608
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1610
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],36
	jnz LB_1610
	add r14,1
	jmp LB_1609
LB_1610:
; .rb_rle 
	add rsp,8
	jmp LB_1600
LB_1609:
	push r14
	jmp LB_1616
LB_1615:
	add r14,1 
LB_1616:
	cmp r14,r9
	jge LB_1617
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1615
LB_1617
	call GRM_318
	cmp BYTE [r8+6],0
	jnz LB_1619
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1618
LB_1619:
; .rb_rle 
	add rsp,0
	jmp LB_1614
LB_1618:
	jmp LB_1621
LB_1620:
	add r14,1 
LB_1621:
	cmp r14,r9
	jge LB_1622
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1620
LB_1622
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1624
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1624
	cmp BYTE [rdi+1],138
	jnz LB_1624
	cmp BYTE [rdi+2],162
	jnz LB_1624
	add r14,3
	jmp LB_1623
LB_1624:
; .rb_rle 
	add rsp,8
	jmp LB_1614
LB_1623:
	push r14
	jmp LB_1630
LB_1629:
	add r14,1 
LB_1630:
	cmp r14,r9
	jge LB_1631
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1629
LB_1631
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1633
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1633
	add r14,1
	jmp LB_1632
LB_1633:
; .rb_rle 
	add rsp,0
	jmp LB_1628
LB_1632:
	jmp LB_1635
LB_1634:
	add r14,1 
LB_1635:
	cmp r14,r9
	jge LB_1636
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1634
LB_1636
	call GRM_355
	cmp BYTE [r8+6],0
	jnz LB_1638
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1637
LB_1638:
; .rb_rle 
	add rsp,0
	jmp LB_1628
LB_1637:
	jmp LB_1640
LB_1639:
; .rb_rle 
	add rsp,8
	jmp LB_1628
LB_1640:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2377~1'(= r ) %2376~0'(= r ) %2375~8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_1643
	jmp LB_1644
LB_1643:
	jmp LB_1642
LB_1644:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2379~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2377~1'(= r ) %2376~0'(= r ) 
; #171 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2380~0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2377~1'(= r ) %2376~0'(= r ) 
; #309 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2381~0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2377~1'(= r ) %2376~0'(= r ) 
; #26 0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2382~0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2377~1'(= r ) %2376~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1641
LB_1642:
;; ?. 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2378~2'(= a2◂ [ *{ rr{| l |}}] ) %2377~1'(= r ) %2376~0'(= r ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2383~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2377~1'(= r ) %2376~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2384~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2377~1'(= r ) %2376~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1641
LB_1641:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1627
LB_1628:
	mov r14,QWORD [rsp]
	jmp LB_1647
LB_1646:
	add r14,1 
LB_1647:
	cmp r14,r9
	jge LB_1648
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1646
LB_1648
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_1650
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1649
LB_1650:
; .rb_rle 
	add rsp,0
	jmp LB_1645
LB_1649:
	jmp LB_1652
LB_1651:
	add r14,1 
LB_1652:
	cmp r14,r9
	jge LB_1653
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1651
LB_1653
	call GRM_324
	cmp BYTE [r8+6],0
	jnz LB_1655
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1654
LB_1655:
; .rb_rle 
	add rsp,8
	jmp LB_1645
LB_1654:
	jmp LB_1657
LB_1656:
	add r14,1 
LB_1657:
	cmp r14,r9
	jge LB_1658
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1656
LB_1658
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1660
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1660
	add r14,1
	jmp LB_1659
LB_1660:
; .rb_rle 
	add rsp,16
	jmp LB_1645
LB_1659:
	jmp LB_1662
LB_1661:
	add r14,1 
LB_1662:
	cmp r14,r9
	jge LB_1663
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1661
LB_1663
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_1665
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1664
LB_1665:
; .rb_rle 
	add rsp,16
	jmp LB_1645
LB_1664:
	jmp LB_1667
LB_1666:
; .rb_rle 
	add rsp,24
	jmp LB_1645
LB_1667:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2389~1'(= r ) %2388~0'(= r ) %2387~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2386~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2385~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_1670
	jmp LB_1671
LB_1670:
	jmp LB_1669
LB_1671:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2391~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2389~1'(= r ) %2388~0'(= r ) %2386~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2385~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #25 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=3 , %2392~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %2391~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2389~1'(= r ) %2388~0'(= r ) 
; #170 { 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2393~1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2389~1'(= r ) %2388~0'(= r ) 
; #309 1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2394~0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2389~1'(= r ) %2388~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2395~0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2389~1'(= r ) %2388~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_1668
LB_1669:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2390~2'(= a2◂ [ *{ rr{| l |}}] ) %2389~1'(= r ) %2388~0'(= r ) %2386~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2385~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2396~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2389~1'(= r ) %2388~0'(= r ) %2386~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2385~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2397~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2389~1'(= r ) %2388~0'(= r ) %2386~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2385~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	call LB_1672
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1673
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_1668
LB_1668:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1627
LB_1645:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1627:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_1625
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) ⊢ 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_1626
LB_1625:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1613
LB_1626:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2398~3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) %2374~1'(= r ) %2373~0'(= r ) %2372~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #309 { 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=1 , %2399~0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) } %2374~1'(= r ) %2373~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=1 , %2400~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) } %2374~1'(= r ) %2373~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_1692
LB_1692:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1613
LB_1614:
	mov r14,QWORD [rsp] 
	jmp LB_1695
LB_1694:
	add r14,1 
LB_1695:
	cmp r14,r9
	jge LB_1696
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1694
LB_1696
	call GRM_337
	cmp BYTE [r8+6],0
	jnz LB_1698
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_1697
LB_1698:
; .rb_rle 
	add rsp,0
	jmp LB_1693
LB_1697:
	jmp LB_1700
LB_1699:
	add r14,1 
LB_1700:
	cmp r14,r9
	jge LB_1701
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1699
LB_1701
	call GRM_355
	cmp BYTE [r8+6],0
	jnz LB_1703
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1702
LB_1703:
; .rb_rle 
	add rsp,16
	jmp LB_1693
LB_1702:
	jmp LB_1705
LB_1704:
; .rb_rle 
	add rsp,24
	jmp LB_1693
LB_1705:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2405~1'(= r ) %2404~0'(= r ) %2403~10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2402~9'(= r ) %2401~8'(= r ) 
;; ? 10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_1708
	jmp LB_1709
LB_1708:
	jmp LB_1707
LB_1709:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2407~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2405~1'(= r ) %2404~0'(= r ) %2402~9'(= r ) %2401~8'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %2408~1(<2)◂{ } %2407~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2405~1'(= r ) %2404~0'(= r ) %2402~9'(= r ) %2401~8'(= r ) 
; $ %[ "glb_etr id_line line_res 0" ] ⊢ %[ "glb_etr id_line line_res 0" ]
;; rsp=3 , %2409~%[ "glb_etr id_line line_res 0" ] %2408~1(<2)◂{ } %2407~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2405~1'(= r ) %2404~0'(= r ) %2402~9'(= r ) %2401~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
;; rsp=3 , %2410~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } %2407~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2405~1'(= r ) %2404~0'(= r ) 
; #308 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
;; rsp=3 , %2411~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } %2407~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2405~1'(= r ) %2404~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
;; rsp=3 , %2412~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } %2407~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2405~1'(= r ) %2404~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
; .dlt.ptn 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1710
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_1706
LB_1707:
;; ?. 10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2406~2'(= a2◂ [ *{ rr{| l |}}] ) %2405~1'(= r ) %2404~0'(= r ) %2402~9'(= r ) %2401~8'(= r ) 
; $ %[ "glb_etr id_line line_res 1" ] ⊢ %[ "glb_etr id_line line_res 1" ]
;; rsp=3 , %2413~%[ "glb_etr id_line line_res 1" ] %2406~2'(= a2◂ [ *{ rr{| l |}}] ) %2405~1'(= r ) %2404~0'(= r ) %2402~9'(= r ) %2401~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2414~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2405~1'(= r ) %2404~0'(= r ) 
; #308 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2415~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2405~1'(= r ) %2404~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2416~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2405~1'(= r ) %2404~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_1706
LB_1706:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1613
LB_1693:
	mov r14,QWORD [rsp]
	jmp LB_2025
LB_2024:
	add r14,1 
LB_2025:
	cmp r14,r9
	jge LB_2026
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2024
LB_2026
	call GRM_337
	cmp BYTE [r8+6],0
	jnz LB_2028
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_2027
LB_2028:
; .rb_rle 
	add rsp,0
	jmp LB_2023
LB_2027:
	jmp LB_2030
LB_2029:
	add r14,1 
LB_2030:
	cmp r14,r9
	jge LB_2031
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2029
LB_2031
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2033
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2032
LB_2033:
; .rb_rle 
	add rsp,16
	jmp LB_2023
LB_2032:
	jmp LB_2035
LB_2034:
; .rb_rle 
	add rsp,24
	jmp LB_2023
LB_2035:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2421~1'(= r ) %2420~0'(= r ) %2419~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2418~9'(= r ) %2417~8'(= r ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2038
	jmp LB_2039
LB_2038:
	jmp LB_2037
LB_2039:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2423~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2421~1'(= r ) %2420~0'(= r ) %2418~9'(= r ) %2417~8'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %2424~1(<2)◂{ } %2423~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2421~1'(= r ) %2420~0'(= r ) %2418~9'(= r ) %2417~8'(= r ) 
; $ %[ "glb_etr id_line line_res 2" ] ⊢ %[ "glb_etr id_line line_res 2" ]
;; rsp=3 , %2425~%[ "glb_etr id_line line_res 2" ] %2424~1(<2)◂{ } %2423~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2421~1'(= r ) %2420~0'(= r ) %2418~9'(= r ) %2417~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
;; rsp=3 , %2426~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } %2423~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2421~1'(= r ) %2420~0'(= r ) 
; #308 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
;; rsp=3 , %2427~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } %2423~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2421~1'(= r ) %2420~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
;; rsp=3 , %2428~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } %2423~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2421~1'(= r ) %2420~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
; .dlt.ptn 2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2036
LB_2037:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2422~2'(= a2◂ [ *{ rr{| l |}}] ) %2421~1'(= r ) %2420~0'(= r ) %2418~9'(= r ) %2417~8'(= r ) 
; $ %[ "glb_etr id_line line_res 3" ] ⊢ %[ "glb_etr id_line line_res 3" ]
;; rsp=3 , %2429~%[ "glb_etr id_line line_res 3" ] %2422~2'(= a2◂ [ *{ rr{| l |}}] ) %2421~1'(= r ) %2420~0'(= r ) %2418~9'(= r ) %2417~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2430~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2421~1'(= r ) %2420~0'(= r ) 
; #308 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2431~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2421~1'(= r ) %2420~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2432~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2421~1'(= r ) %2420~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2036
LB_2036:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1613
LB_2023:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1613:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_1611
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}] ) ⊢ 3'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}] )
; {| 1111000010.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_1612
LB_1611:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_1612:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2433~3'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}] ) %2371~1'(= r ) %2370~0'(= r ) %2369~8'(= a47◂ [ *{ }] ) 
;; ? 3'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}] ) ⊢ 0(<2)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) }
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2042
	jmp LB_2043
LB_2042:
	jmp LB_2041
LB_2043:
	mov r8, QWORD [r9+8]
	mov r10, QWORD [r9+16]
	mov QWORD [GBG_VCT+8*0],r9
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=1 , %2436~4'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) %2435~2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2371~1'(= r ) %2370~0'(= r ) %2369~8'(= a47◂ [ *{ }] ) 
;; ? 4'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a29◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r10
	cmp BYTE [rdi+6],0
	jnz LB_2045
	jmp LB_2046
LB_2045:
	jmp LB_2044
LB_2046:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2438~3'(= a29◂ [ a18◂ [ ]{| l |}] ) %2435~2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2371~1'(= r ) %2370~0'(= r ) %2369~8'(= a47◂ [ *{ }] ) 
; #174 { 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2439~4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } %2371~1'(= r ) %2370~0'(= r ) %2369~8'(= a47◂ [ *{ }] ) 
; #309 4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2440~0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } %2371~1'(= r ) %2370~0'(= r ) %2369~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2441~0(<2)◂0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a29◂ [ a18◂ [ ]{| l |}] ) } %2371~1'(= r ) %2370~0'(= r ) %2369~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2040
LB_2044:
;; ?. 4'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2437~3'(= a2◂ [ *{ rr{| l |}}] ) %2435~2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2371~1'(= r ) %2370~0'(= r ) %2369~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2442~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2435~2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2371~1'(= r ) %2370~0'(= r ) %2369~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2443~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2435~2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2371~1'(= r ) %2370~0'(= r ) %2369~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1724
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2040
LB_2041:
;; ?. 3'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a47◂ [ a29◂ [ a18◂ [ ]{| l |}]]}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2434~2'(= a2◂ [ *{ rr{| l |}}] ) %2371~1'(= r ) %2370~0'(= r ) %2369~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2444~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2371~1'(= r ) %2370~0'(= r ) %2369~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2445~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2371~1'(= r ) %2370~0'(= r ) %2369~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2040
LB_2040:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1526
LB_1600:
	mov r14,QWORD [rsp] 
	jmp LB_2049
LB_2048:
	add r14,1 
LB_2049:
	cmp r14,r9
	jge LB_2050
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2048
LB_2050
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_2052
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2051
LB_2052:
; .rb_rle 
	add rsp,0
	jmp LB_2047
LB_2051:
	jmp LB_2054
LB_2053:
	add r14,1 
LB_2054:
	cmp r14,r9
	jge LB_2055
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2053
LB_2055
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2057
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],94
	jnz LB_2057
	add r14,1
	jmp LB_2056
LB_2057:
; .rb_rle 
	add rsp,8
	jmp LB_2047
LB_2056:
	jmp LB_2059
LB_2058:
	add r14,1 
LB_2059:
	cmp r14,r9
	jge LB_2060
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2058
LB_2060
	call GRM_353
	cmp BYTE [r8+6],0
	jnz LB_2062
	sub rsp,16
; .mov_ptn2 2'(= *{ a2◂ [ a24◂ [ a18◂ [ ]{| l |}]]a2◂ [ a25◂ [ {| l |}]]} ) ⊢ { 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) }
; {| 111100001110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_2061
LB_2062:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_2061:
	jmp LB_2064
LB_2063:
	add r14,1 
LB_2064:
	cmp r14,r9
	jge LB_2065
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2063
LB_2065
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2067
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2067
	add r14,1
	jmp LB_2066
LB_2067:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_2066:
	jmp LB_2069
LB_2068:
	add r14,1 
LB_2069:
	cmp r14,r9
	jge LB_2070
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2068
LB_2070
	call GRM_349
	cmp BYTE [r8+6],0
	jnz LB_2072
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) ⊢ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2071
LB_2072:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_2071:
	jmp LB_2074
LB_2073:
	add r14,1 
LB_2074:
	cmp r14,r9
	jge LB_2075
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2073
LB_2075
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2077
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2076
LB_2077:
; .rb_rle 
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_2076:
	jmp LB_2079
LB_2078:
; .rb_rle 
	add rsp,40
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_2079:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*5]
;; rsp=5 , %2452~1'(= r ) %2451~0'(= r ) %2450~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2449~11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) %2448~10'(= a2◂ [ a25◂ [ {| l |}]] ) %2447~9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2446~8'(= a47◂ [ *{ }] ) 
; #166 { 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=5 , %2453~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2452~1'(= r ) %2451~0'(= r ) %2450~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2446~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2082
	jmp LB_2083
LB_2082:
	jmp LB_2081
LB_2083:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2455~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2453~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2452~1'(= r ) %2451~0'(= r ) %2446~8'(= a47◂ [ *{ }] ) 
; #176 { 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %2456~2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2452~1'(= r ) %2451~0'(= r ) %2446~8'(= a47◂ [ *{ }] ) 
; #309 2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %2457~0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2452~1'(= r ) %2451~0'(= r ) %2446~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %2458~0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2452~1'(= r ) %2451~0'(= r ) %2446~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 5
	add rsp,40
	jmp LB_2080
LB_2081:
;; ?. 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2454~2'(= a2◂ [ *{ rr{| l |}}] ) %2453~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2452~1'(= r ) %2451~0'(= r ) %2446~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2459~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2453~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2452~1'(= r ) %2451~0'(= r ) %2446~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2460~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2453~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2452~1'(= r ) %2451~0'(= r ) %2446~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1755
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1756
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1757
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 5
	add rsp,40
	jmp LB_2080
LB_2080:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1526
LB_2047:
	mov r14,QWORD [rsp] 
	jmp LB_2086
LB_2085:
	add r14,1 
LB_2086:
	cmp r14,r9
	jge LB_2087
	JZ_SPC BYTE [r13+8+r14], LB_2085
LB_2087
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_2089
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2088
LB_2089:
; .rb_rle 
	add rsp,0
	jmp LB_2084
LB_2088:
	jmp LB_2091
LB_2090:
	add r14,1 
LB_2091:
	cmp r14,r9
	jge LB_2092
	JZ_SPC BYTE [r13+8+r14], LB_2090
LB_2092
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2094
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_2094
	cmp BYTE [rdi+1],187
	jnz LB_2094
	add r14,2
	jmp LB_2093
LB_2094:
; .rb_rle 
	add rsp,8
	jmp LB_2084
LB_2093:
	jmp LB_2096
LB_2095:
	add r14,1 
LB_2096:
	cmp r14,r9
	jge LB_2097
	JZ_SPC BYTE [r13+8+r14], LB_2095
LB_2097
	call GRM_352
	cmp BYTE [r8+6],0
	jnz LB_2099
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a30◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a30◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2098
LB_2099:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_2098:
	jmp LB_2101
LB_2100:
	add r14,1 
LB_2101:
	cmp r14,r9
	jge LB_2102
	JZ_SPC BYTE [r13+8+r14], LB_2100
LB_2102
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2104
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2103
LB_2104:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_2103:
	jmp LB_2106
LB_2105:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_2106:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2465~1'(= r ) %2464~0'(= r ) %2463~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2462~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2461~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2109
	jmp LB_2110
LB_2109:
	jmp LB_2108
LB_2110:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2467~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2465~1'(= r ) %2464~0'(= r ) %2462~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2461~8'(= a47◂ [ *{ }] ) 
;; ?; 9'(= a30◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<4)◂{ 3'(= a27◂ [ a18◂ [ ]] ) 4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 5'(= a17◂ [ a25◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],2
	jnz LB_2112
	jmp LB_2113
LB_2112:
	jmp LB_2111
LB_2113:
	mov rdi,QWORD [rsp-8+8*2]
	mov r9, QWORD [rdi+8]
	mov rdi,QWORD [rsp-8+8*2]
	mov r10, QWORD [rdi+16]
	mov rdi,QWORD [rsp-8+8*2]
	mov r11, QWORD [rdi+24]
	MOV_RAX QWORD [GBG_VCT+8*0],QWORD [rsp-8+8*2]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 3,rdi
;; rsp=3 , %2470~5'(= a17◂ [ a25◂ [ {| l |}]] ) %2469~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2468~3'(= a27◂ [ a18◂ [ ]] ) %2467~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2465~1'(= r ) %2464~0'(= r ) %2461~8'(= a47◂ [ *{ }] ) 
; #193 3'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂3'(= a27◂ [ a18◂ [ ]] )
;; rsp=3 , %2471~0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2470~5'(= a17◂ [ a25◂ [ {| l |}]] ) %2469~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2467~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2465~1'(= r ) %2464~0'(= r ) %2461~8'(= a47◂ [ *{ }] ) 
; #112 0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) ⊢ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] )
;; rsp=3 , %2472~1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2470~5'(= a17◂ [ a25◂ [ {| l |}]] ) %2469~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2467~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2465~1'(= r ) %2464~0'(= r ) %2461~8'(= a47◂ [ *{ }] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %2473~1(<2)◂{ } %2472~1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2470~5'(= a17◂ [ a25◂ [ {| l |}]] ) %2469~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2467~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2465~1'(= r ) %2464~0'(= r ) %2461~8'(= a47◂ [ *{ }] ) 
; #25 { 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } }
;; rsp=3 , %2474~0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } %2472~1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2469~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2467~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2465~1'(= r ) %2464~0'(= r ) %2461~8'(= a47◂ [ *{ }] ) 
; #170 { 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2475~1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2472~1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2469~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2465~1'(= r ) %2464~0'(= r ) %2461~8'(= a47◂ [ *{ }] ) 
; #174 { 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } }
;; rsp=3 , %2476~4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } %2469~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2465~1'(= r ) %2464~0'(= r ) %2461~8'(= a47◂ [ *{ }] ) 
; #309 4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } }
;; rsp=3 , %2477~0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } %2469~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2465~1'(= r ) %2464~0'(= r ) %2461~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } }
;; rsp=3 , %2478~0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } %2469~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2465~1'(= r ) %2464~0'(= r ) %2461~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } }
; .dlt.ptn 4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_1724
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2107
LB_2111:
;; rsp=3 , %2467~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2465~1'(= r ) %2464~0'(= r ) %2462~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2461~8'(= a47◂ [ *{ }] ) 
; #176 { 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2479~2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2465~1'(= r ) %2464~0'(= r ) %2461~8'(= a47◂ [ *{ }] ) 
; #309 2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2480~0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2465~1'(= r ) %2464~0'(= r ) %2461~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2481~0(<2)◂0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2465~1'(= r ) %2464~0'(= r ) %2461~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2107
LB_2108:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2466~2'(= a2◂ [ *{ rr{| l |}}] ) %2465~1'(= r ) %2464~0'(= r ) %2462~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2461~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2482~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2465~1'(= r ) %2464~0'(= r ) %2462~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2461~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2483~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2465~1'(= r ) %2464~0'(= r ) %2462~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2461~8'(= a47◂ [ *{ }] ) 
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
	call LB_1737
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2107
LB_2107:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1526
LB_2084:
	mov r14,QWORD [rsp] 
	jmp LB_2116
LB_2115:
	add r14,1 
LB_2116:
	cmp r14,r9
	jge LB_2117
	JZ_SPC BYTE [r13+8+r14], LB_2115
LB_2117
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_2119
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2118
LB_2119:
; .rb_rle 
	add rsp,0
	jmp LB_2114
LB_2118:
	jmp LB_2121
LB_2120:
	add r14,1 
LB_2121:
	cmp r14,r9
	jge LB_2122
	JZ_SPC BYTE [r13+8+r14], LB_2120
LB_2122
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2124
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2124
	cmp BYTE [rdi+1],151
	jnz LB_2124
	cmp BYTE [rdi+2],130
	jnz LB_2124
	add r14,3
	jmp LB_2123
LB_2124:
; .rb_rle 
	add rsp,8
	jmp LB_2114
LB_2123:
	jmp LB_2126
LB_2125:
	add r14,1 
LB_2126:
	cmp r14,r9
	jge LB_2127
	JZ_SPC BYTE [r13+8+r14], LB_2125
LB_2127
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_2129
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a24◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2128
LB_2129:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_2128:
	jmp LB_2131
LB_2130:
	add r14,1 
LB_2131:
	cmp r14,r9
	jge LB_2132
	JZ_SPC BYTE [r13+8+r14], LB_2130
LB_2132
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2134
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_2134
	add r14,1
	jmp LB_2133
LB_2134:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_2133:
	jmp LB_2136
LB_2135:
	add r14,1 
LB_2136:
	cmp r14,r9
	jge LB_2137
	JZ_SPC BYTE [r13+8+r14], LB_2135
LB_2137
	call GRM_318
	cmp BYTE [r8+6],0
	jnz LB_2139
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2138
LB_2139:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_2138:
	push r14
	jmp LB_2145
LB_2144:
	add r14,1 
LB_2145:
	cmp r14,r9
	jge LB_2146
	JZ_SPC BYTE [r13+8+r14], LB_2144
LB_2146
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2148
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2148
	cmp BYTE [rdi+1],138
	jnz LB_2148
	cmp BYTE [rdi+2],162
	jnz LB_2148
	cmp BYTE [rdi+3],124
	jnz LB_2148
	add r14,4
	jmp LB_2147
LB_2148:
; .rb_rle 
	add rsp,0
	jmp LB_2143
LB_2147:
	jmp LB_2150
LB_2149:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2142
LB_2150:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2490~1'(= r ) %2489~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2491~1(<2)◂{ } %2490~1'(= r ) %2489~0'(= r ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2492~0(<2)◂1(<2)◂{ } %2490~1'(= r ) %2489~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2493~0(<2)◂0(<2)◂1(<2)◂{ } %2490~1'(= r ) %2489~0'(= r ) 
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
; mov_ptn2.
	jmp LB_2151
LB_2151:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2142
LB_2143:
	mov r14,QWORD [rsp] 
	jmp LB_2154
LB_2153:
	add r14,1 
LB_2154:
	cmp r14,r9
	jge LB_2155
	JZ_SPC BYTE [r13+8+r14], LB_2153
LB_2155
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2157
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2157
	cmp BYTE [rdi+1],138
	jnz LB_2157
	cmp BYTE [rdi+2],162
	jnz LB_2157
	add r14,3
	jmp LB_2156
LB_2157:
; .rb_rle 
	add rsp,0
	jmp LB_2152
LB_2156:
	jmp LB_2159
LB_2158:
	add r14,1 
LB_2159:
	cmp r14,r9
	jge LB_2160
	JZ_SPC BYTE [r13+8+r14], LB_2158
LB_2160
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_2162
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2161
LB_2162:
; .rb_rle 
	add rsp,0
	jmp LB_2152
LB_2161:
	jmp LB_2164
LB_2163:
	add r14,1 
LB_2164:
	cmp r14,r9
	jge LB_2165
	JZ_SPC BYTE [r13+8+r14], LB_2163
LB_2165
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2167
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2166
LB_2167:
; .rb_rle 
	add rsp,8
	jmp LB_2152
LB_2166:
	jmp LB_2169
LB_2168:
; .rb_rle 
	add rsp,16
	jmp LB_2152
LB_2169:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2497~1'(= r ) %2496~0'(= r ) %2495~9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2494~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2172
	jmp LB_2173
LB_2172:
	jmp LB_2171
LB_2173:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2499~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2497~1'(= r ) %2496~0'(= r ) %2494~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2500~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2497~1'(= r ) %2496~0'(= r ) 
; #309 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2501~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2497~1'(= r ) %2496~0'(= r ) 
; #26 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2502~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2497~1'(= r ) %2496~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2170
LB_2171:
;; ?. 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2498~2'(= a2◂ [ *{ rr{| l |}}] ) %2497~1'(= r ) %2496~0'(= r ) %2494~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2503~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2497~1'(= r ) %2496~0'(= r ) %2494~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2504~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2497~1'(= r ) %2496~0'(= r ) %2494~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	call LB_1673
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2170
LB_2170:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2142
LB_2152:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2142:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_2140
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_2141
LB_2140:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1526
LB_2141:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2505~3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) %2488~1'(= r ) %2487~0'(= r ) %2486~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2485~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2484~8'(= a47◂ [ *{ }] ) 
;; ? 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2176
	jmp LB_2177
LB_2176:
	jmp LB_2175
LB_2177:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2507~2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) %2488~1'(= r ) %2487~0'(= r ) %2486~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2485~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2484~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a17◂ [ a25◂ [ {| l |}]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2179
	jmp LB_2180
LB_2179:
	jmp LB_2178
LB_2180:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=3 , %2509~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2508~3'(= a17◂ [ a25◂ [ {| l |}]] ) %2488~1'(= r ) %2487~0'(= r ) %2486~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2485~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2484~8'(= a47◂ [ *{ }] ) 
; #168 { 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) }
;; rsp=3 , %2510~1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } %2509~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2488~1'(= r ) %2487~0'(= r ) %2484~8'(= a47◂ [ *{ }] ) 
; #176 { 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2511~2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2488~1'(= r ) %2487~0'(= r ) %2484~8'(= a47◂ [ *{ }] ) 
; #309 2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2512~0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2488~1'(= r ) %2487~0'(= r ) %2484~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2513~0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2488~1'(= r ) %2487~0'(= r ) %2484~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2174
LB_2178:
;; ?. 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %2488~1'(= r ) %2487~0'(= r ) %2486~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2485~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2484~8'(= a47◂ [ *{ }] ) 
; #177 { 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2514~1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2488~1'(= r ) %2487~0'(= r ) %2484~8'(= a47◂ [ *{ }] ) 
; #309 1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2515~0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2488~1'(= r ) %2487~0'(= r ) %2484~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2516~0(<2)◂0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2488~1'(= r ) %2487~0'(= r ) %2484~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2174
LB_2175:
;; ?. 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2506~2'(= a2◂ [ *{ rr{| l |}}] ) %2488~1'(= r ) %2487~0'(= r ) %2486~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2485~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2484~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2517~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2488~1'(= r ) %2487~0'(= r ) %2486~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2485~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2484~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2518~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2488~1'(= r ) %2487~0'(= r ) %2486~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2485~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2484~8'(= a47◂ [ *{ }] ) 
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
	call LB_1724
	C_POP_REGS
; .dlt.ptn 9'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1736
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2174
LB_2174:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1526
LB_2114:
	mov r14,QWORD [rsp] 
	jmp LB_2183
LB_2182:
	add r14,1 
LB_2183:
	cmp r14,r9
	jge LB_2184
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2182
LB_2184
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_2186
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2185
LB_2186:
; .rb_rle 
	add rsp,0
	jmp LB_2181
LB_2185:
	jmp LB_2188
LB_2187:
	add r14,1 
LB_2188:
	cmp r14,r9
	jge LB_2189
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2187
LB_2189
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_2191
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 9'(= a18◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2190
LB_2191:
; .rb_rle 
	add rsp,8
	jmp LB_2181
LB_2190:
	jmp LB_2193
LB_2192:
	add r14,1 
LB_2193:
	cmp r14,r9
	jge LB_2194
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2192
LB_2194
	call GRM_318
	cmp BYTE [r8+6],0
	jnz LB_2196
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2195
LB_2196:
; .rb_rle 
	add rsp,16
	jmp LB_2181
LB_2195:
	push r14
	jmp LB_2202
LB_2201:
	add r14,1 
LB_2202:
	cmp r14,r9
	jge LB_2203
	JZ_SPC BYTE [r13+8+r14], LB_2201
LB_2203
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2205
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2205
	cmp BYTE [rdi+1],138
	jnz LB_2205
	cmp BYTE [rdi+2],162
	jnz LB_2205
	cmp BYTE [rdi+3],124
	jnz LB_2205
	add r14,4
	jmp LB_2204
LB_2205:
; .rb_rle 
	add rsp,0
	jmp LB_2200
LB_2204:
	jmp LB_2207
LB_2206:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2199
LB_2207:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2525~1'(= r ) %2524~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2526~1(<2)◂{ } %2525~1'(= r ) %2524~0'(= r ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2527~0(<2)◂1(<2)◂{ } %2525~1'(= r ) %2524~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2528~0(<2)◂0(<2)◂1(<2)◂{ } %2525~1'(= r ) %2524~0'(= r ) 
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
; mov_ptn2.
	jmp LB_2208
LB_2208:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2199
LB_2200:
	mov r14,QWORD [rsp] 
	jmp LB_2211
LB_2210:
	add r14,1 
LB_2211:
	cmp r14,r9
	jge LB_2212
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2210
LB_2212
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2214
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2214
	cmp BYTE [rdi+1],138
	jnz LB_2214
	cmp BYTE [rdi+2],162
	jnz LB_2214
	add r14,3
	jmp LB_2213
LB_2214:
; .rb_rle 
	add rsp,0
	jmp LB_2209
LB_2213:
	jmp LB_2216
LB_2215:
	add r14,1 
LB_2216:
	cmp r14,r9
	jge LB_2217
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2215
LB_2217
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_2219
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2218
LB_2219:
; .rb_rle 
	add rsp,0
	jmp LB_2209
LB_2218:
	jmp LB_2221
LB_2220:
	add r14,1 
LB_2221:
	cmp r14,r9
	jge LB_2222
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2220
LB_2222
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2224
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2224
	add r14,1
	jmp LB_2223
LB_2224:
; .rb_rle 
	add rsp,8
	jmp LB_2209
LB_2223:
	jmp LB_2226
LB_2225:
	add r14,1 
LB_2226:
	cmp r14,r9
	jge LB_2227
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2225
LB_2227
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2229
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2228
LB_2229:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2199
LB_2228:
	jmp LB_2231
LB_2230:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2199
LB_2231:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2532~1'(= r ) %2531~0'(= r ) %2530~9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2529~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2234
	jmp LB_2235
LB_2234:
	jmp LB_2233
LB_2235:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2534~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2532~1'(= r ) %2531~0'(= r ) %2529~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2535~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2532~1'(= r ) %2531~0'(= r ) 
; #309 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2536~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2532~1'(= r ) %2531~0'(= r ) 
; #26 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2537~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2532~1'(= r ) %2531~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2232
LB_2233:
;; ?. 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2533~2'(= a2◂ [ *{ rr{| l |}}] ) %2532~1'(= r ) %2531~0'(= r ) %2529~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2538~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2532~1'(= r ) %2531~0'(= r ) %2529~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2539~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2532~1'(= r ) %2531~0'(= r ) %2529~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	call LB_1673
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2232
LB_2232:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2199
LB_2209:
	mov r14,QWORD [rsp] 
	jmp LB_2238
LB_2237:
	add r14,1 
LB_2238:
	cmp r14,r9
	jge LB_2239
	JZ_SPC BYTE [r13+8+r14], LB_2237
LB_2239
	call GRM_337
	cmp BYTE [r8+6],0
	jnz LB_2241
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_2240
LB_2241:
; .rb_rle 
	add rsp,0
	jmp LB_2236
LB_2240:
	jmp LB_2243
LB_2242:
	add r14,1 
LB_2243:
	cmp r14,r9
	jge LB_2244
	JZ_SPC BYTE [r13+8+r14], LB_2242
LB_2244
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2246
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2245
LB_2246:
; .rb_rle 
	add rsp,16
	jmp LB_2236
LB_2245:
	jmp LB_2248
LB_2247:
; .rb_rle 
	add rsp,24
	jmp LB_2236
LB_2248:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2544~1'(= r ) %2543~0'(= r ) %2542~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2541~9'(= r ) %2540~8'(= r ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2251
	jmp LB_2252
LB_2251:
	jmp LB_2250
LB_2252:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2546~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2544~1'(= r ) %2543~0'(= r ) %2541~9'(= r ) %2540~8'(= r ) 
; $ %[ "lc_code 20" ] ⊢ %[ "lc_code 20" ]
;; rsp=3 , %2547~%[ "lc_code 20" ] %2546~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2544~1'(= r ) %2543~0'(= r ) %2541~9'(= r ) %2540~8'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %2548~1(<2)◂{ } %2547~%[ "lc_code 20" ] %2546~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2544~1'(= r ) %2543~0'(= r ) %2541~9'(= r ) %2540~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %2549~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %2546~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2544~1'(= r ) %2543~0'(= r ) 
; #308 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %2550~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %2546~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2544~1'(= r ) %2543~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %2551~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %2546~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2544~1'(= r ) %2543~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
; .dlt.ptn 2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2249
LB_2250:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2545~2'(= a2◂ [ *{ rr{| l |}}] ) %2544~1'(= r ) %2543~0'(= r ) %2541~9'(= r ) %2540~8'(= r ) 
; $ %[ "lc_code 21" ] ⊢ %[ "lc_code 21" ]
;; rsp=3 , %2552~%[ "lc_code 21" ] %2545~2'(= a2◂ [ *{ rr{| l |}}] ) %2544~1'(= r ) %2543~0'(= r ) %2541~9'(= r ) %2540~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2553~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2544~1'(= r ) %2543~0'(= r ) 
; #308 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2554~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2544~1'(= r ) %2543~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2555~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2544~1'(= r ) %2543~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2249
LB_2249:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2199
LB_2236:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2199:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_2197
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_2198
LB_2197:
; .rb_rle 
	add rsp,24
	jmp LB_2181
LB_2198:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2556~3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) %2523~1'(= r ) %2522~0'(= r ) %2521~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2520~9'(= a18◂ [ ] ) %2519~8'(= a47◂ [ *{ }] ) 
;; ? 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2255
	jmp LB_2256
LB_2255:
	jmp LB_2254
LB_2256:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2558~2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) %2523~1'(= r ) %2522~0'(= r ) %2521~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2520~9'(= a18◂ [ ] ) %2519~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a17◂ [ a25◂ [ {| l |}]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2258
	jmp LB_2259
LB_2258:
	jmp LB_2257
LB_2259:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=3 , %2560~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2559~3'(= a17◂ [ a25◂ [ {| l |}]] ) %2523~1'(= r ) %2522~0'(= r ) %2521~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2520~9'(= a18◂ [ ] ) %2519~8'(= a47◂ [ *{ }] ) 
; #169 { 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) }
;; rsp=3 , %2561~0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } %2560~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2523~1'(= r ) %2522~0'(= r ) %2519~8'(= a47◂ [ *{ }] ) 
; #176 { 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2562~2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2523~1'(= r ) %2522~0'(= r ) %2519~8'(= a47◂ [ *{ }] ) 
; #309 2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2563~0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2523~1'(= r ) %2522~0'(= r ) %2519~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2564~0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2523~1'(= r ) %2522~0'(= r ) %2519~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2253
LB_2257:
;; ?. 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %2523~1'(= r ) %2522~0'(= r ) %2521~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2520~9'(= a18◂ [ ] ) %2519~8'(= a47◂ [ *{ }] ) 
; #178 { 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2565~0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2523~1'(= r ) %2522~0'(= r ) %2519~8'(= a47◂ [ *{ }] ) 
; #309 0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2566~0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2523~1'(= r ) %2522~0'(= r ) %2519~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2567~0(<2)◂0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2523~1'(= r ) %2522~0'(= r ) %2519~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2253
LB_2254:
;; ?. 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2557~2'(= a2◂ [ *{ rr{| l |}}] ) %2523~1'(= r ) %2522~0'(= r ) %2521~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2520~9'(= a18◂ [ ] ) %2519~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2568~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2523~1'(= r ) %2522~0'(= r ) %2521~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2520~9'(= a18◂ [ ] ) %2519~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2569~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2523~1'(= r ) %2522~0'(= r ) %2521~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2520~9'(= a18◂ [ ] ) %2519~8'(= a47◂ [ *{ }] ) 
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
	call LB_1724
	C_POP_REGS
; .dlt.ptn 9'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1735
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2253
LB_2253:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1526
LB_2181:
	mov r14,QWORD [rsp]
	jmp LB_2262
LB_2261:
	add r14,1 
LB_2262:
	cmp r14,r9
	jge LB_2263
	JZ_SPC BYTE [r13+8+r14], LB_2261
LB_2263
	call GRM_342
	cmp BYTE [r8+6],0
	jnz LB_2265
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_2264
LB_2265:
; .rb_rle 
	add rsp,0
	jmp LB_2260
LB_2264:
	push r14
	jmp LB_2271
LB_2270:
	add r14,1 
LB_2271:
	cmp r14,r9
	jge LB_2272
	JZ_SPC BYTE [r13+8+r14], LB_2270
LB_2272
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2274
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2273
LB_2274:
; .rb_rle 
	add rsp,0
	jmp LB_2269
LB_2273:
	jmp LB_2276
LB_2275:
; .rb_rle 
	add rsp,8
	jmp LB_2269
LB_2276:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2575~1'(= r ) %2574~0'(= r ) %2573~8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
; #26 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2576~0(<2)◂8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2575~1'(= r ) %2574~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2277
LB_2277:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2268
LB_2269:
	mov r14,QWORD [rsp]
	jmp LB_2280
LB_2279:
	add r14,1 
LB_2280:
	cmp r14,r9
	jge LB_2281
	JZ_SPC BYTE [r13+8+r14], LB_2279
LB_2281
	call GRM_341
	cmp BYTE [r8+6],0
	jnz LB_2283
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_2282
LB_2283:
; .rb_rle 
	add rsp,0
	jmp LB_2278
LB_2282:
	jmp LB_2285
LB_2284:
; .rb_rle 
	add rsp,0
	jmp LB_2278
LB_2285:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2579~1'(= r ) %2578~0'(= r ) %2577~{ } 
; $ %[ "lc_code 11" ] ⊢ %[ "lc_code 11" ]
;; rsp=0 , %2580~%[ "lc_code 11" ] %2579~1'(= r ) %2578~0'(= r ) %2577~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2581~1(<2)◂{ } %2580~%[ "lc_code 11" ] %2579~1'(= r ) %2578~0'(= r ) %2577~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
;; rsp=0 , %2582~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } %2577~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
;; rsp=0 , %2583~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } %2577~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
;; rsp=0 , %2584~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } %2577~{ } 
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
; mov_ptn2.
	jmp LB_2286
LB_2286:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2268
LB_2278:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2268:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_2266
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_2267
LB_2266:
; .rb_rle 
	add rsp,0
	jmp LB_2260
LB_2267:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2585~3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2572~1'(= r ) %2571~0'(= r ) %2570~{ } 
;; ? 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2289
	jmp LB_2290
LB_2289:
	jmp LB_2288
LB_2290:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %2587~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2572~1'(= r ) %2571~0'(= r ) %2570~{ } 
; $ %[ "lc_code 9" ] ⊢ %[ "lc_code 9" ]
;; rsp=0 , %2588~%[ "lc_code 9" ] %2587~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2572~1'(= r ) %2571~0'(= r ) %2570~{ } 
; #312 { 0'(= r ) 1'(= r ) %[ "lc_code 9" ] } ⊢ 0'(= a47◂ [ q0] )
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
; mov_ptn2.
	call LB_2291
	mov r8,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %2589~0'(= a47◂ [ q0] ) %2587~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2570~{ } 
; #26 0'(= a47◂ [ q0] ) ⊢ 0(<2)◂0'(= a47◂ [ q0] )
;; rsp=0 , %2590~0(<2)◂0'(= a47◂ [ q0] ) %2587~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2570~{ } 
; ∎ 0(<2)◂0'(= a47◂ [ q0] )
; .dlt.ptn 2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
	C_POP_REGS
; .dlt.ptn { }
; .mov_ptn2 0(<2)◂0'(= a47◂ [ q0] ) ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 1010.. |}
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_2287
LB_2288:
;; ?. 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %2586~2'(= a2◂ [ *{ rr{| l |}}] ) %2572~1'(= r ) %2571~0'(= r ) %2570~{ } 
; $ %[ "lc_code 10" ] ⊢ %[ "lc_code 10" ]
;; rsp=0 , %2591~%[ "lc_code 10" ] %2586~2'(= a2◂ [ *{ rr{| l |}}] ) %2572~1'(= r ) %2571~0'(= r ) %2570~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %2592~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2570~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %2593~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2570~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %2594~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2570~{ } 
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
; mov_ptn2.
	jmp LB_2287
LB_2287:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1526
LB_2260:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1526:
; discard r14
	add rsp,8
	ret
ETR_351:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_351
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_351:
	push r14
	jmp LB_2295
LB_2294:
	add r14,1 
LB_2295:
	cmp r14,r9
	jge LB_2296
	JZ_SPC BYTE [r13+8+r14], LB_2294
LB_2296
	call GRM_355
	cmp BYTE [r8+6],0
	jnz LB_2298
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2297
LB_2298:
; .rb_rle 
	add rsp,0
	jmp LB_2293
LB_2297:
	jmp LB_2300
LB_2299:
; .rb_rle 
	add rsp,8
	jmp LB_2293
LB_2300:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2597~1'(= r ) %2596~0'(= r ) %2595~8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2303
	jmp LB_2304
LB_2303:
	jmp LB_2302
LB_2304:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2599~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2597~1'(= r ) %2596~0'(= r ) 
; #171 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2600~0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2597~1'(= r ) %2596~0'(= r ) 
; #309 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2601~0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2597~1'(= r ) %2596~0'(= r ) 
; #26 0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2602~0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2597~1'(= r ) %2596~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2301
LB_2302:
;; ?. 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2598~2'(= a2◂ [ *{ rr{| l |}}] ) %2597~1'(= r ) %2596~0'(= r ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2603~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2597~1'(= r ) %2596~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2604~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2597~1'(= r ) %2596~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2301
LB_2301:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2292
LB_2293:
	mov r14,QWORD [rsp]
	jmp LB_2307
LB_2306:
	add r14,1 
LB_2307:
	cmp r14,r9
	jge LB_2308
	JZ_SPC BYTE [r13+8+r14], LB_2306
LB_2308
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_2310
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2309
LB_2310:
; .rb_rle 
	add rsp,0
	jmp LB_2305
LB_2309:
	jmp LB_2312
LB_2311:
	add r14,1 
LB_2312:
	cmp r14,r9
	jge LB_2313
	JZ_SPC BYTE [r13+8+r14], LB_2311
LB_2313
	call GRM_324
	cmp BYTE [r8+6],0
	jnz LB_2315
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2314
LB_2315:
; .rb_rle 
	add rsp,8
	jmp LB_2305
LB_2314:
	jmp LB_2317
LB_2316:
	add r14,1 
LB_2317:
	cmp r14,r9
	jge LB_2318
	JZ_SPC BYTE [r13+8+r14], LB_2316
LB_2318
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2320
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2319
LB_2320:
; .rb_rle 
	add rsp,16
	jmp LB_2305
LB_2319:
	jmp LB_2322
LB_2321:
; .rb_rle 
	add rsp,24
	jmp LB_2305
LB_2322:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2609~1'(= r ) %2608~0'(= r ) %2607~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2606~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2605~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2325
	jmp LB_2326
LB_2325:
	jmp LB_2324
LB_2326:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2611~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2609~1'(= r ) %2608~0'(= r ) %2606~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2605~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #25 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=3 , %2612~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %2611~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2609~1'(= r ) %2608~0'(= r ) 
; #170 { 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2613~1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2609~1'(= r ) %2608~0'(= r ) 
; #309 1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2614~0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2609~1'(= r ) %2608~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2615~0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2609~1'(= r ) %2608~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2323
LB_2324:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2610~2'(= a2◂ [ *{ rr{| l |}}] ) %2609~1'(= r ) %2608~0'(= r ) %2606~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2605~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2616~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2609~1'(= r ) %2608~0'(= r ) %2606~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2605~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2617~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2609~1'(= r ) %2608~0'(= r ) %2606~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2605~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	call LB_1672
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1673
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2323
LB_2323:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2292
LB_2305:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2292:
; discard r14
	add rsp,8
	ret
ETR_352:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_352
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_352:
	push r14
	jmp LB_2330
LB_2329:
	add r14,1 
LB_2330:
	cmp r14,r9
	jge LB_2331
	JZ_SPC BYTE [r13+8+r14], LB_2329
LB_2331
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2333
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_2333
	cmp BYTE [rdi+1],94
	jnz LB_2333
	add r14,2
	jmp LB_2332
LB_2333:
; .rb_rle 
	add rsp,0
	jmp LB_2328
LB_2332:
	jmp LB_2335
LB_2334:
	add r14,1 
LB_2335:
	cmp r14,r9
	jge LB_2336
	JZ_SPC BYTE [r13+8+r14], LB_2334
LB_2336
	call GRM_353
	cmp BYTE [r8+6],0
	jnz LB_2338
	sub rsp,16
; .mov_ptn2 2'(= *{ a2◂ [ a24◂ [ a18◂ [ ]{| l |}]]a2◂ [ a25◂ [ {| l |}]]} ) ⊢ { 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_2337
LB_2338:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2327
LB_2337:
	jmp LB_2340
LB_2339:
	add r14,1 
LB_2340:
	cmp r14,r9
	jge LB_2341
	JZ_SPC BYTE [r13+8+r14], LB_2339
LB_2341
	call GRM_349
	cmp BYTE [r8+6],0
	jnz LB_2343
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) ⊢ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2342
LB_2343:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2327
LB_2342:
	jmp LB_2345
LB_2344:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2327
LB_2345:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2622~1'(= r ) %2621~0'(= r ) %2620~10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) %2619~9'(= a2◂ [ a25◂ [ {| l |}]] ) %2618~8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #166 { 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=3 , %2623~3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } %2622~1'(= r ) %2621~0'(= r ) 
; #26 3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=3 , %2624~0(<2)◂3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } %2622~1'(= r ) %2621~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2346
LB_2346:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2327
LB_2328:
	mov r14,QWORD [rsp] 
	jmp LB_2349
LB_2348:
	add r14,1 
LB_2349:
	cmp r14,r9
	jge LB_2350
	JZ_SPC BYTE [r13+8+r14], LB_2348
LB_2350
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_2352
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2351
LB_2352:
; .rb_rle 
	add rsp,0
	jmp LB_2347
LB_2351:
	jmp LB_2354
LB_2353:
	add r14,1 
LB_2354:
	cmp r14,r9
	jge LB_2355
	JZ_SPC BYTE [r13+8+r14], LB_2353
LB_2355
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2357
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_2357
	add r14,1
	jmp LB_2356
LB_2357:
; .rb_rle 
	add rsp,8
	jmp LB_2347
LB_2356:
	jmp LB_2359
LB_2358:
	add r14,1 
LB_2359:
	cmp r14,r9
	jge LB_2360
	JZ_SPC BYTE [r13+8+r14], LB_2358
LB_2360
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2362
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2362
	cmp BYTE [rdi+1],138
	jnz LB_2362
	cmp BYTE [rdi+2],162
	jnz LB_2362
	add r14,3
	jmp LB_2361
LB_2362:
; .rb_rle 
	add rsp,8
	jmp LB_2347
LB_2361:
	jmp LB_2364
LB_2363:
	add r14,1 
LB_2364:
	cmp r14,r9
	jge LB_2365
	JZ_SPC BYTE [r13+8+r14], LB_2363
LB_2365
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_2367
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 9'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2366
LB_2367:
; .rb_rle 
	add rsp,8
	jmp LB_2347
LB_2366:
	jmp LB_2369
LB_2368:
; .rb_rle 
	add rsp,16
	jmp LB_2347
LB_2369:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2628~1'(= r ) %2627~0'(= r ) %2626~9'(= a17◂ [ a25◂ [ {| l |}]] ) %2625~8'(= a27◂ [ a18◂ [ ]] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2629~1(<2)◂{ } %2628~1'(= r ) %2627~0'(= r ) %2626~9'(= a17◂ [ a25◂ [ {| l |}]] ) %2625~8'(= a27◂ [ a18◂ [ ]] ) 
; #113 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=2 , %2630~0(<2)◂1(<2)◂{ } %2628~1'(= r ) %2627~0'(= r ) %2626~9'(= a17◂ [ a25◂ [ {| l |}]] ) %2625~8'(= a27◂ [ a18◂ [ ]] ) 
; #167 { 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) }
;; rsp=2 , %2631~2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } %2628~1'(= r ) %2627~0'(= r ) 
; #26 2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) }
;; rsp=2 , %2632~0(<2)◂2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } %2628~1'(= r ) %2627~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2370
LB_2370:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2327
LB_2347:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2327:
; discard r14
	add rsp,8
	ret
ETR_353:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_353
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_353:
	push r14
	jmp LB_2374
LB_2373:
	add r14,1 
LB_2374:
	cmp r14,r9
	jge LB_2375
	JZ_SPC BYTE [r13+8+r14], LB_2373
LB_2375
	call GRM_302
	cmp BYTE [r8+6],0
	jnz LB_2377
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_2376
LB_2377:
; .rb_rle 
	add rsp,0
	jmp LB_2372
LB_2376:
	jmp LB_2379
LB_2378:
	add r14,1 
LB_2379:
	cmp r14,r9
	jge LB_2380
	JZ_SPC BYTE [r13+8+r14], LB_2378
LB_2380
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2382
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2382
	cmp BYTE [rdi+1],138
	jnz LB_2382
	cmp BYTE [rdi+2],162
	jnz LB_2382
	add r14,3
	jmp LB_2381
LB_2382:
; .rb_rle 
	add rsp,0
	jmp LB_2372
LB_2381:
	jmp LB_2384
LB_2383:
	add r14,1 
LB_2384:
	cmp r14,r9
	jge LB_2385
	JZ_SPC BYTE [r13+8+r14], LB_2383
LB_2385
	call GRM_326
	cmp BYTE [r8+6],0
	jnz LB_2387
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a25◂ [ {| l |}] ) ⊢ 8'(= a25◂ [ {| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2386
LB_2387:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2371
LB_2386:
	jmp LB_2389
LB_2388:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2371
LB_2389:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2636~1'(= r ) %2635~0'(= r ) %2634~8'(= a25◂ [ {| l |}] ) %2633~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2637~1(<2)◂{ } %2636~1'(= r ) %2635~0'(= r ) %2634~8'(= a25◂ [ {| l |}] ) %2633~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2638~1(<2)◂{ } %2637~1(<2)◂{ } %2636~1'(= r ) %2635~0'(= r ) %2634~8'(= a25◂ [ {| l |}] ) %2633~{ } 
; #25 { 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } }
;; rsp=1 , %2639~0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } %2637~1(<2)◂{ } %2636~1'(= r ) %2635~0'(= r ) %2633~{ } 
; #26 { 1(<2)◂{ } 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } } ⊢ 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } }
;; rsp=1 , %2640~0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } } %2636~1'(= r ) %2635~0'(= r ) %2633~{ } 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2390
LB_2390:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2371
LB_2372:
	mov r14,QWORD [rsp] 
	jmp LB_2393
LB_2392:
	add r14,1 
LB_2393:
	cmp r14,r9
	jge LB_2394
	JZ_SPC BYTE [r13+8+r14], LB_2392
LB_2394
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_2396
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a24◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2395
LB_2396:
; .rb_rle 
	add rsp,0
	jmp LB_2391
LB_2395:
	jmp LB_2398
LB_2397:
	add r14,1 
LB_2398:
	cmp r14,r9
	jge LB_2399
	JZ_SPC BYTE [r13+8+r14], LB_2397
LB_2399
	call GRM_320
	cmp BYTE [r8+6],0
	jnz LB_2401
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2400
LB_2401:
; .rb_rle 
	add rsp,8
	jmp LB_2391
LB_2400:
	jmp LB_2403
LB_2402:
	add r14,1 
LB_2403:
	cmp r14,r9
	jge LB_2404
	JZ_SPC BYTE [r13+8+r14], LB_2402
LB_2404
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2406
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2406
	cmp BYTE [rdi+1],138
	jnz LB_2406
	cmp BYTE [rdi+2],162
	jnz LB_2406
	add r14,3
	jmp LB_2405
LB_2406:
; .rb_rle 
	add rsp,16
	jmp LB_2391
LB_2405:
	jmp LB_2408
LB_2407:
	add r14,1 
LB_2408:
	cmp r14,r9
	jge LB_2409
	JZ_SPC BYTE [r13+8+r14], LB_2407
LB_2409
	call GRM_326
	cmp BYTE [r8+6],0
	jnz LB_2411
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a25◂ [ {| l |}] ) ⊢ 10'(= a25◂ [ {| l |}] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2410
LB_2411:
; .rb_rle 
	add rsp,16
	jmp LB_2391
LB_2410:
	jmp LB_2413
LB_2412:
	add r14,1 
LB_2413:
	cmp r14,r9
	jge LB_2414
	JZ_SPC BYTE [r13+8+r14], LB_2412
LB_2414
	call GRM_325
	cmp BYTE [r8+6],0
	jnz LB_2416
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a25◂ [ {| l |}]] ) ⊢ 11'(= a2◂ [ a25◂ [ {| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2415
LB_2416:
; .rb_rle 
	add rsp,24
	jmp LB_2391
LB_2415:
	jmp LB_2418
LB_2417:
; .rb_rle 
	add rsp,32
	jmp LB_2391
LB_2418:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %2646~1'(= r ) %2645~0'(= r ) %2644~11'(= a2◂ [ a25◂ [ {| l |}]] ) %2643~10'(= a25◂ [ {| l |}] ) %2642~9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2641~8'(= a24◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=4 , %2647~0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2646~1'(= r ) %2645~0'(= r ) %2644~11'(= a2◂ [ a25◂ [ {| l |}]] ) %2643~10'(= a25◂ [ {| l |}] ) 
; #25 { 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=4 , %2648~0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } %2647~0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2646~1'(= r ) %2645~0'(= r ) 
; #26 { 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } } ⊢ 0(<2)◂{ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } }
;; rsp=4 , %2649~0(<2)◂{ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } } %2646~1'(= r ) %2645~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_2419
LB_2419:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2371
LB_2391:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2371:
; discard r14
	add rsp,8
	ret
ETR_354:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_354
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_354:
	push r14
	jmp LB_2423
LB_2422:
	add r14,1 
LB_2423:
	cmp r14,r9
	jge LB_2424
	JZ_SPC BYTE [r13+8+r14], LB_2422
LB_2424
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_2426
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2425
LB_2426:
; .rb_rle 
	add rsp,0
	jmp LB_2421
LB_2425:
	jmp LB_2428
LB_2427:
	add r14,1 
LB_2428:
	cmp r14,r9
	jge LB_2429
	JZ_SPC BYTE [r13+8+r14], LB_2427
LB_2429
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2431
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2431
	cmp BYTE [rdi+1],136
	jnz LB_2431
	cmp BYTE [rdi+2],144
	jnz LB_2431
	cmp BYTE [rdi+3],46
	jnz LB_2431
	add r14,4
	jmp LB_2430
LB_2431:
; .rb_rle 
	add rsp,8
	jmp LB_2421
LB_2430:
	jmp LB_2433
LB_2432:
	add r14,1 
LB_2433:
	cmp r14,r9
	jge LB_2434
	JZ_SPC BYTE [r13+8+r14], LB_2432
LB_2434
	call GRM_356
	cmp BYTE [r8+6],0
	jnz LB_2436
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2435
LB_2436:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2420
LB_2435:
	jmp LB_2438
LB_2437:
	add r14,1 
LB_2438:
	cmp r14,r9
	jge LB_2439
	JZ_SPC BYTE [r13+8+r14], LB_2437
LB_2439
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2441
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2440
LB_2441:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2420
LB_2440:
	jmp LB_2443
LB_2442:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2420
LB_2443:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2654~1'(= r ) %2653~0'(= r ) %2652~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2651~9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) %2650~8'(= a47◂ [ *{ }] ) 
;; ? 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_2446
	jmp LB_2447
LB_2446:
	jmp LB_2445
LB_2447:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2656~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2654~1'(= r ) %2653~0'(= r ) %2652~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2650~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2449
	jmp LB_2450
LB_2449:
	jmp LB_2448
LB_2450:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2658~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2656~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; #163 3'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=3 , %2659~2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2656~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; #80 { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2660~1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; #309 1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2661~0(<2)◂1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2662~0(<2)◂0(<2)◂1(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2444
LB_2448:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2657~3'(= a2◂ [ *{ rr{| l |}}] ) %2656~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2663~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2656~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2664~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2656~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1716
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2444
LB_2445:
;; ?. 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2655~2'(= a2◂ [ *{ rr{| l |}}] ) %2654~1'(= r ) %2653~0'(= r ) %2652~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2650~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2452
	jmp LB_2453
LB_2452:
	jmp LB_2451
LB_2453:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2666~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2655~2'(= a2◂ [ *{ rr{| l |}}] ) %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2667~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2666~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2668~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2666~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2444
LB_2451:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2665~3'(= a2◂ [ *{ rr{| l |}}] ) %2655~2'(= a2◂ [ *{ rr{| l |}}] ) %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 11110000100110.. |}
	mov r14,r9
	mov r13,r8
; mov_ptn2.
	call LB_1019
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=1 , %2669~2'(= a2◂ [ *{ rr{| l |}}] ) %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2670~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2671~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2654~1'(= r ) %2653~0'(= r ) %2650~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2444
LB_2444:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2420
LB_2421:
	mov r14,QWORD [rsp] 
	jmp LB_2456
LB_2455:
	add r14,1 
LB_2456:
	cmp r14,r9
	jge LB_2457
	JZ_SPC BYTE [r13+8+r14], LB_2455
LB_2457
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_2459
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2458
LB_2459:
; .rb_rle 
	add rsp,0
	jmp LB_2454
LB_2458:
	jmp LB_2461
LB_2460:
	add r14,1 
LB_2461:
	cmp r14,r9
	jge LB_2462
	JZ_SPC BYTE [r13+8+r14], LB_2460
LB_2462
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2464
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2464
	cmp BYTE [rdi+1],136
	jnz LB_2464
	cmp BYTE [rdi+2],144
	jnz LB_2464
	add r14,3
	jmp LB_2463
LB_2464:
; .rb_rle 
	add rsp,8
	jmp LB_2454
LB_2463:
	jmp LB_2466
LB_2465:
	add r14,1 
LB_2466:
	cmp r14,r9
	jge LB_2467
	JZ_SPC BYTE [r13+8+r14], LB_2465
LB_2467
	call GRM_356
	cmp BYTE [r8+6],0
	jnz LB_2469
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2468
LB_2469:
; .rb_rle 
	add rsp,8
	jmp LB_2454
LB_2468:
	jmp LB_2471
LB_2470:
	add r14,1 
LB_2471:
	cmp r14,r9
	jge LB_2472
	JZ_SPC BYTE [r13+8+r14], LB_2470
LB_2472
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2474
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2473
LB_2474:
; .rb_rle 
	add rsp,16
	jmp LB_2454
LB_2473:
	jmp LB_2476
LB_2475:
	add r14,1 
LB_2476:
	cmp r14,r9
	jge LB_2477
	JZ_SPC BYTE [r13+8+r14], LB_2475
LB_2477
	call GRM_354
	cmp BYTE [r8+6],0
	jnz LB_2479
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2478
LB_2479:
; .rb_rle 
	add rsp,24
	jmp LB_2454
LB_2478:
	jmp LB_2481
LB_2480:
; .rb_rle 
	add rsp,32
	jmp LB_2454
LB_2481:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %2677~1'(= r ) %2676~0'(= r ) %2675~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2674~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2673~9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) %2672~8'(= a47◂ [ *{ }] ) 
;; ? 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	cmp BYTE [rdi+6],0
	jnz LB_2484
	jmp LB_2485
LB_2484:
	jmp LB_2483
LB_2485:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2675~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2674~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2672~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_2487
	jmp LB_2488
LB_2487:
	jmp LB_2486
LB_2488:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2681~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2675~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2672~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2490
	jmp LB_2491
LB_2490:
	jmp LB_2489
LB_2491:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2683~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2681~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #163 3'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=4 , %2684~2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2683~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #81 { { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %2685~0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #309 0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %2686~0(<2)◂0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %2687~0(<2)◂0(<2)◂0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_2482
LB_2489:
;; ?. 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2682~4'(= a2◂ [ *{ rr{| l |}}] ) %2681~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #308 4'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2688~1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) %2681~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2689~0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) %2681~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
	C_POP_REGS
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1716
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_2482
LB_2486:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2680~3'(= a2◂ [ *{ rr{| l |}}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2675~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2672~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2493
	jmp LB_2494
LB_2493:
	jmp LB_2492
LB_2494:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2691~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2680~3'(= a2◂ [ *{ rr{| l |}}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2692~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2691~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2693~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2691~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_1723
	C_POP_REGS
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1716
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_2482
LB_2492:
;; ?. 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2690~4'(= a2◂ [ *{ rr{| l |}}] ) %2680~3'(= a2◂ [ *{ rr{| l |}}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #84 { 3'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 3'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
; .mov_ptn2 { 3'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1101100010001110.. |}
	mov r14,r10
	mov r13,r9
; mov_ptn2.
	call LB_1019
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 6
	add rsp,48
;; rsp=1 , %2694~3'(= a2◂ [ *{ rr{| l |}}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2695~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2696~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2679~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1716
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2482
LB_2483:
;; ?. 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2678~2'(= a2◂ [ *{ rr{| l |}}] ) %2677~1'(= r ) %2676~0'(= r ) %2675~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2674~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2672~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_2496
	jmp LB_2497
LB_2496:
	jmp LB_2495
LB_2497:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2698~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2678~2'(= a2◂ [ *{ rr{| l |}}] ) %2677~1'(= r ) %2676~0'(= r ) %2675~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2672~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2499
	jmp LB_2500
LB_2499:
	jmp LB_2498
LB_2500:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2700~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2698~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2678~2'(= a2◂ [ *{ rr{| l |}}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2701~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2700~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2698~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2702~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2700~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2698~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_1723
	C_POP_REGS
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_2482
LB_2498:
;; ?. 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2699~4'(= a2◂ [ *{ rr{| l |}}] ) %2698~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2678~2'(= a2◂ [ *{ rr{| l |}}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r9
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110100010001110.. |}
	mov r14,r10
	mov r13,r8
; mov_ptn2.
	call LB_1019
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 6
	add rsp,48
;; rsp=1 , %2703~2'(= a2◂ [ *{ rr{| l |}}] ) %2698~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2704~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2698~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2705~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2698~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2482
LB_2495:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2697~3'(= a2◂ [ *{ rr{| l |}}] ) %2678~2'(= a2◂ [ *{ rr{| l |}}] ) %2677~1'(= r ) %2676~0'(= r ) %2675~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2672~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2502
	jmp LB_2503
LB_2502:
	jmp LB_2501
LB_2503:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2707~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2697~3'(= a2◂ [ *{ rr{| l |}}] ) %2678~2'(= a2◂ [ *{ rr{| l |}}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r10
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1111000010001110.. |}
	mov r14,r9
	mov r13,r8
; mov_ptn2.
	call LB_1019
	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 6
	add rsp,48
;; rsp=1 , %2708~2'(= a2◂ [ *{ rr{| l |}}] ) %2707~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2709~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2707~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2710~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2707~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_1723
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2482
LB_2501:
;; ?. 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2706~4'(= a2◂ [ *{ rr{| l |}}] ) %2697~3'(= a2◂ [ *{ rr{| l |}}] ) %2678~2'(= a2◂ [ *{ rr{| l |}}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r10
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1111000010001110.. |}
	mov r14,r9
	mov r13,r8
; mov_ptn2.
	call LB_1019
	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 6
	add rsp,48
;; rsp=1 , %2711~2'(= a2◂ [ *{ rr{| l |}}] ) %2706~4'(= a2◂ [ *{ rr{| l |}}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 111010001110.. |}
	mov r14,r10
	mov r13,r8
; mov_ptn2.
	call LB_1019
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=1 , %2712~2'(= a2◂ [ *{ rr{| l |}}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2713~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2714~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2677~1'(= r ) %2676~0'(= r ) %2672~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2482
LB_2482:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2420
LB_2454:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2420:
; discard r14
	add rsp,8
	ret
ETR_355:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_355
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_355:
	push r14
	jmp LB_2507
LB_2506:
	add r14,1 
LB_2507:
	cmp r14,r9
	jge LB_2508
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2506
LB_2508
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_2510
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2509
LB_2510:
; .rb_rle 
	add rsp,0
	jmp LB_2505
LB_2509:
	jmp LB_2512
LB_2511:
	add r14,1 
LB_2512:
	cmp r14,r9
	jge LB_2513
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2511
LB_2513
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2515
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2515
	cmp BYTE [rdi+1],136
	jnz LB_2515
	cmp BYTE [rdi+2],144
	jnz LB_2515
	cmp BYTE [rdi+3],46
	jnz LB_2515
	add r14,4
	jmp LB_2514
LB_2515:
; .rb_rle 
	add rsp,8
	jmp LB_2505
LB_2514:
	jmp LB_2517
LB_2516:
	add r14,1 
LB_2517:
	cmp r14,r9
	jge LB_2518
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2516
LB_2518
	call GRM_314
	cmp BYTE [r8+6],0
	jnz LB_2520
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2519
LB_2520:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2504
LB_2519:
	jmp LB_2522
LB_2521:
	add r14,1 
LB_2522:
	cmp r14,r9
	jge LB_2523
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2521
LB_2523
	call GRM_359
	cmp BYTE [r8+6],0
	jnz LB_2525
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2524
LB_2525:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2504
LB_2524:
	jmp LB_2527
LB_2526:
	add r14,1 
LB_2527:
	cmp r14,r9
	jge LB_2528
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2526
LB_2528
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2530
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2529
LB_2530:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2504
LB_2529:
	jmp LB_2532
LB_2531:
; .rb_rle 
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2504
LB_2532:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %2720~1'(= r ) %2719~0'(= r ) %2718~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2717~10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_2535
	jmp LB_2536
LB_2535:
	jmp LB_2534
LB_2536:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2722~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2720~1'(= r ) %2719~0'(= r ) %2718~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2538
	jmp LB_2539
LB_2538:
	jmp LB_2537
LB_2539:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2724~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2722~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2720~1'(= r ) %2719~0'(= r ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
; #163 3'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=4 , %2725~2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2722~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2720~1'(= r ) %2719~0'(= r ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
; #80 { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=4 , %2726~1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2720~1'(= r ) %2719~0'(= r ) %2715~8'(= a47◂ [ *{ }] ) 
; #309 1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=4 , %2727~0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2720~1'(= r ) %2719~0'(= r ) %2715~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=4 , %2728~0(<2)◂0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2720~1'(= r ) %2719~0'(= r ) %2715~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_2533
LB_2537:
;; ?. 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2723~3'(= a2◂ [ *{ rr{| l |}}] ) %2722~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2720~1'(= r ) %2719~0'(= r ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2729~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2722~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2720~1'(= r ) %2719~0'(= r ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2730~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2722~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2720~1'(= r ) %2719~0'(= r ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1716
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
	call LB_1715
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_2533
LB_2534:
;; ?. 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2721~2'(= a2◂ [ *{ rr{| l |}}] ) %2720~1'(= r ) %2719~0'(= r ) %2718~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2541
	jmp LB_2542
LB_2541:
	jmp LB_2540
LB_2542:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2732~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2721~2'(= a2◂ [ *{ rr{| l |}}] ) %2720~1'(= r ) %2719~0'(= r ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2733~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2732~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2720~1'(= r ) %2719~0'(= r ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2734~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2732~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2720~1'(= r ) %2719~0'(= r ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
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
	call LB_1715
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_2533
LB_2540:
;; ?. 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %2731~3'(= a2◂ [ *{ rr{| l |}}] ) %2721~2'(= a2◂ [ *{ rr{| l |}}] ) %2720~1'(= r ) %2719~0'(= r ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 111100001100110.. |}
	mov r14,r9
	mov r13,r8
; mov_ptn2.
	call LB_1019
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=2 , %2735~2'(= a2◂ [ *{ rr{| l |}}] ) %2720~1'(= r ) %2719~0'(= r ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2736~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2720~1'(= r ) %2719~0'(= r ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2737~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2720~1'(= r ) %2719~0'(= r ) %2716~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2715~8'(= a47◂ [ *{ }] ) 
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
	call LB_1715
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2533
LB_2533:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2504
LB_2505:
	mov r14,QWORD [rsp] 
	jmp LB_2545
LB_2544:
	add r14,1 
LB_2545:
	cmp r14,r9
	jge LB_2546
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2544
LB_2546
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_2548
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2547
LB_2548:
; .rb_rle 
	add rsp,0
	jmp LB_2543
LB_2547:
	jmp LB_2550
LB_2549:
	add r14,1 
LB_2550:
	cmp r14,r9
	jge LB_2551
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2549
LB_2551
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2553
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2553
	cmp BYTE [rdi+1],136
	jnz LB_2553
	cmp BYTE [rdi+2],144
	jnz LB_2553
	add r14,3
	jmp LB_2552
LB_2553:
; .rb_rle 
	add rsp,8
	jmp LB_2543
LB_2552:
	jmp LB_2555
LB_2554:
	add r14,1 
LB_2555:
	cmp r14,r9
	jge LB_2556
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2554
LB_2556
	call GRM_314
	cmp BYTE [r8+6],0
	jnz LB_2558
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2557
LB_2558:
; .rb_rle 
	add rsp,8
	jmp LB_2543
LB_2557:
	jmp LB_2560
LB_2559:
	add r14,1 
LB_2560:
	cmp r14,r9
	jge LB_2561
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2559
LB_2561
	call GRM_359
	cmp BYTE [r8+6],0
	jnz LB_2563
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2562
LB_2563:
; .rb_rle 
	add rsp,16
	jmp LB_2543
LB_2562:
	jmp LB_2565
LB_2564:
	add r14,1 
LB_2565:
	cmp r14,r9
	jge LB_2566
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2564
LB_2566
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2568
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2567
LB_2568:
; .rb_rle 
	add rsp,24
	jmp LB_2543
LB_2567:
	jmp LB_2570
LB_2569:
	add r14,1 
LB_2570:
	cmp r14,r9
	jge LB_2571
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2569
LB_2571
	call GRM_355
	cmp BYTE [r8+6],0
	jnz LB_2573
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2572
LB_2573:
; .rb_rle 
	add rsp,32
	jmp LB_2543
LB_2572:
	jmp LB_2575
LB_2574:
; .rb_rle 
	add rsp,40
	jmp LB_2543
LB_2575:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*5]
;; rsp=5 , %2744~1'(= r ) %2743~0'(= r ) %2742~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2741~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2740~10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	cmp BYTE [rdi+6],0
	jnz LB_2578
	jmp LB_2579
LB_2578:
	jmp LB_2577
LB_2579:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2742~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2741~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_2581
	jmp LB_2582
LB_2581:
	jmp LB_2580
LB_2582:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2748~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2742~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2584
	jmp LB_2585
LB_2584:
	jmp LB_2583
LB_2585:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2750~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2748~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #163 3'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=5 , %2751~2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2750~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #81 { { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=5 , %2752~0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2744~1'(= r ) %2743~0'(= r ) %2738~8'(= a47◂ [ *{ }] ) 
; #309 0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=5 , %2753~0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2744~1'(= r ) %2743~0'(= r ) %2738~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=5 , %2754~0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2744~1'(= r ) %2743~0'(= r ) %2738~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 5
	add rsp,40
	jmp LB_2576
LB_2583:
;; ?. 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2749~4'(= a2◂ [ *{ rr{| l |}}] ) %2748~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #308 4'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2755~1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) %2748~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2756~0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] ) %2748~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
	C_POP_REGS
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1716
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
	call LB_1715
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 5
	add rsp,40
	jmp LB_2576
LB_2580:
;; ?. 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2747~3'(= a2◂ [ *{ rr{| l |}}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2742~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2587
	jmp LB_2588
LB_2587:
	jmp LB_2586
LB_2588:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2758~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2747~3'(= a2◂ [ *{ rr{| l |}}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2759~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2758~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2760~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2758~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_1710
	C_POP_REGS
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1716
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
	call LB_1715
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 5
	add rsp,40
	jmp LB_2576
LB_2586:
;; ?. 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2757~4'(= a2◂ [ *{ rr{| l |}}] ) %2747~3'(= a2◂ [ *{ rr{| l |}}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #84 { 3'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 3'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r8
; .mov_ptn2 { 3'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 11011000110001110.. |}
	mov r14,r10
	mov r13,r9
; mov_ptn2.
	call LB_1019
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 6
	add rsp,48
;; rsp=2 , %2761~3'(= a2◂ [ *{ rr{| l |}}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2762~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2763~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2746~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_1716
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
	call LB_1715
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2576
LB_2577:
;; ?. 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2745~2'(= a2◂ [ *{ rr{| l |}}] ) %2744~1'(= r ) %2743~0'(= r ) %2742~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2741~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
;; ? 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_2590
	jmp LB_2591
LB_2590:
	jmp LB_2589
LB_2591:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2765~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2745~2'(= a2◂ [ *{ rr{| l |}}] ) %2744~1'(= r ) %2743~0'(= r ) %2742~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2593
	jmp LB_2594
LB_2593:
	jmp LB_2592
LB_2594:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2767~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2765~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2745~2'(= a2◂ [ *{ rr{| l |}}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2768~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2767~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2765~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2769~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2767~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2765~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_1710
	C_POP_REGS
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
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
	call LB_1715
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 5
	add rsp,40
	jmp LB_2576
LB_2592:
;; ?. 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2766~4'(= a2◂ [ *{ rr{| l |}}] ) %2765~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2745~2'(= a2◂ [ *{ rr{| l |}}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r9
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 11101000110001110.. |}
	mov r14,r10
	mov r13,r8
; mov_ptn2.
	call LB_1019
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 6
	add rsp,48
;; rsp=2 , %2770~2'(= a2◂ [ *{ rr{| l |}}] ) %2765~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2771~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2765~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2772~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2765~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
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
	call LB_1715
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2576
LB_2589:
;; ?. 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2764~3'(= a2◂ [ *{ rr{| l |}}] ) %2745~2'(= a2◂ [ *{ rr{| l |}}] ) %2744~1'(= r ) %2743~0'(= r ) %2742~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2596
	jmp LB_2597
LB_2596:
	jmp LB_2595
LB_2597:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2774~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2764~3'(= a2◂ [ *{ rr{| l |}}] ) %2745~2'(= a2◂ [ *{ rr{| l |}}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r10
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 11110000110001110.. |}
	mov r14,r9
	mov r13,r8
; mov_ptn2.
	call LB_1019
	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 6
	add rsp,48
;; rsp=2 , %2775~2'(= a2◂ [ *{ rr{| l |}}] ) %2774~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2776~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2774~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2777~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2774~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_1710
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
	call LB_1715
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2576
LB_2595:
;; ?. 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂4'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r10,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2773~4'(= a2◂ [ *{ rr{| l |}}] ) %2764~3'(= a2◂ [ *{ rr{| l |}}] ) %2745~2'(= a2◂ [ *{ rr{| l |}}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,24
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
	mov QWORD [rsp+16],r10
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 11110000110001110.. |}
	mov r14,r9
	mov r13,r8
; mov_ptn2.
	call LB_1019
	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 6
	add rsp,48
;; rsp=2 , %2778~2'(= a2◂ [ *{ rr{| l |}}] ) %2773~4'(= a2◂ [ *{ rr{| l |}}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 4'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110100011110.. |}
	mov r14,r10
	mov r13,r8
; mov_ptn2.
	call LB_1019
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=2 , %2779~2'(= a2◂ [ *{ rr{| l |}}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2780~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2781~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2744~1'(= r ) %2743~0'(= r ) %2739~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2738~8'(= a47◂ [ *{ }] ) 
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
	call LB_1715
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2576
LB_2576:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2504
LB_2543:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2504:
; discard r14
	add rsp,8
	ret
ETR_356:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_356
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_356:
	push r14
	jmp LB_2601
LB_2600:
	add r14,1 
LB_2601:
	cmp r14,r9
	jge LB_2602
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2600
LB_2602
	call GRM_357
	cmp BYTE [r8+6],0
	jnz LB_2604
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a32◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a32◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2603
LB_2604:
; .rb_rle 
	add rsp,0
	jmp LB_2599
LB_2603:
	jmp LB_2606
LB_2605:
	add r14,1 
LB_2606:
	cmp r14,r9
	jge LB_2607
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2605
LB_2607
	call GRM_358
	cmp BYTE [r8+6],0
	jnz LB_2609
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2608
LB_2609:
; .rb_rle 
	add rsp,8
	jmp LB_2599
LB_2608:
	jmp LB_2611
LB_2610:
; .rb_rle 
	add rsp,16
	jmp LB_2599
LB_2611:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2785~1'(= r ) %2784~0'(= r ) %2783~9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2782~8'(= a32◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2786~0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2785~1'(= r ) %2784~0'(= r ) 
; #309 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2787~0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2785~1'(= r ) %2784~0'(= r ) 
; #26 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2788~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2785~1'(= r ) %2784~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2612
LB_2612:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2598
LB_2599:
	mov r14,QWORD [rsp]
	jmp LB_2615
LB_2614:
	add r14,1 
LB_2615:
	cmp r14,r9
	jge LB_2616
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2614
LB_2616
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2618
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_2618
	add r14,1
	jmp LB_2617
LB_2618:
; .rb_rle 
	add rsp,0
	jmp LB_2613
LB_2617:
	jmp LB_2620
LB_2619:
	add r14,1 
LB_2620:
	cmp r14,r9
	jge LB_2621
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2619
LB_2621
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2623
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2623
	add r14,1
	jmp LB_2622
LB_2623:
; .rb_rle 
	add rsp,0
	jmp LB_2613
LB_2622:
	jmp LB_2625
LB_2624:
; .rb_rle 
	add rsp,0
	jmp LB_2613
LB_2625:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2790~1'(= r ) %2789~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2791~1(<2)◂{ } %2790~1'(= r ) %2789~0'(= r ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2792~0(<2)◂1(<2)◂{ } %2790~1'(= r ) %2789~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2793~0(<2)◂0(<2)◂1(<2)◂{ } %2790~1'(= r ) %2789~0'(= r ) 
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
; mov_ptn2.
	jmp LB_2626
LB_2626:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2598
LB_2613:
	mov r14,QWORD [rsp]
	jmp LB_2629
LB_2628:
	add r14,1 
LB_2629:
	cmp r14,r9
	jge LB_2630
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2628
LB_2630
	call GRM_337
	cmp BYTE [r8+6],0
	jnz LB_2632
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_2631
LB_2632:
; .rb_rle 
	add rsp,0
	jmp LB_2627
LB_2631:
	jmp LB_2634
LB_2633:
; .rb_rle 
	add rsp,16
	jmp LB_2627
LB_2634:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2796~1'(= r ) %2795~0'(= r ) %2794~{ 8'(= r ) 9'(= r ) } 
; $ %[ "mtc_line 0" ] ⊢ %[ "mtc_line 0" ]
;; rsp=2 , %2797~%[ "mtc_line 0" ] %2796~1'(= r ) %2795~0'(= r ) %2794~{ 8'(= r ) 9'(= r ) } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2798~1(<2)◂{ } %2797~%[ "mtc_line 0" ] %2796~1'(= r ) %2795~0'(= r ) %2794~{ 8'(= r ) 9'(= r ) } 
; #25 { { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2799~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } %2794~{ 8'(= r ) 9'(= r ) } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2800~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } %2794~{ 8'(= r ) 9'(= r ) } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2801~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } %2794~{ 8'(= r ) 9'(= r ) } 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2635
LB_2635:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2598
LB_2627:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2598:
; discard r14
	add rsp,8
	ret
ETR_357:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_357
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_357:
	push r14
	jmp LB_2639
LB_2638:
	add r14,1 
LB_2639:
	cmp r14,r9
	jge LB_2640
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2638
LB_2640
	call GRM_318
	cmp BYTE [r8+6],0
	jnz LB_2642
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2641
LB_2642:
; .rb_rle 
	add rsp,0
	jmp LB_2637
LB_2641:
	jmp LB_2644
LB_2643:
	add r14,1 
LB_2644:
	cmp r14,r9
	jge LB_2645
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2643
LB_2645
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2647
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2647
	cmp BYTE [rdi+1],138
	jnz LB_2647
	cmp BYTE [rdi+2],162
	jnz LB_2647
	add r14,3
	jmp LB_2646
LB_2647:
; .rb_rle 
	add rsp,8
	jmp LB_2637
LB_2646:
	jmp LB_2649
LB_2648:
	add r14,1 
LB_2649:
	cmp r14,r9
	jge LB_2650
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2648
LB_2650
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_2652
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 9'(= a18◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2651
LB_2652:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2636
LB_2651:
	jmp LB_2654
LB_2653:
	add r14,1 
LB_2654:
	cmp r14,r9
	jge LB_2655
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2653
LB_2655
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2657
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2657
	cmp BYTE [rdi+1],151
	jnz LB_2657
	cmp BYTE [rdi+2],130
	jnz LB_2657
	add r14,3
	jmp LB_2656
LB_2657:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2636
LB_2656:
	jmp LB_2659
LB_2658:
	add r14,1 
LB_2659:
	cmp r14,r9
	jge LB_2660
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2658
LB_2660
	call GRM_314
	cmp BYTE [r8+6],0
	jnz LB_2662
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2661
LB_2662:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2636
LB_2661:
	jmp LB_2664
LB_2663:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2636
LB_2664:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2806~1'(= r ) %2805~0'(= r ) %2804~10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2803~9'(= a18◂ [ ] ) %2802~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #189 { 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2807~0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %2806~1'(= r ) %2805~0'(= r ) %2802~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #112 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2808~1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %2806~1'(= r ) %2805~0'(= r ) %2802~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #162 { 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } ⊢ 0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } }
;; rsp=3 , %2809~0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } %2806~1'(= r ) %2805~0'(= r ) 
; #26 0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } ⊢ 0(<2)◂0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } }
;; rsp=3 , %2810~0(<2)◂0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } %2806~1'(= r ) %2805~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_2665
LB_2665:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2636
LB_2637:
	mov r14,QWORD [rsp] 
	jmp LB_2668
LB_2667:
	add r14,1 
LB_2668:
	cmp r14,r9
	jge LB_2669
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2667
LB_2669
	call GRM_360
	cmp BYTE [r8+6],0
	jnz LB_2671
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a33◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a33◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2670
LB_2671:
; .rb_rle 
	add rsp,0
	jmp LB_2666
LB_2670:
	jmp LB_2673
LB_2672:
	add r14,1 
LB_2673:
	cmp r14,r9
	jge LB_2674
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2672
LB_2674
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2676
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_2676
	cmp BYTE [rdi+1],60
	jnz LB_2676
	add r14,2
	jmp LB_2675
LB_2676:
; .rb_rle 
	add rsp,8
	jmp LB_2666
LB_2675:
	jmp LB_2678
LB_2677:
	add r14,1 
LB_2678:
	cmp r14,r9
	jge LB_2679
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2677
LB_2679
	call GRM_360
	cmp BYTE [r8+6],0
	jnz LB_2681
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a33◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a33◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2680
LB_2681:
; .rb_rle 
	add rsp,8
	jmp LB_2666
LB_2680:
	jmp LB_2683
LB_2682:
; .rb_rle 
	add rsp,16
	jmp LB_2666
LB_2683:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2814~1'(= r ) %2813~0'(= r ) %2812~9'(= a33◂ [ a18◂ [ ]{| l |}] ) %2811~8'(= a33◂ [ a18◂ [ ]{| l |}] ) 
; #160 { 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2815~2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } %2814~1'(= r ) %2813~0'(= r ) 
; #26 2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2816~0(<2)◂2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } %2814~1'(= r ) %2813~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2684
LB_2684:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2636
LB_2666:
	mov r14,QWORD [rsp]
	jmp LB_2687
LB_2686:
	add r14,1 
LB_2687:
	cmp r14,r9
	jge LB_2688
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2686
LB_2688
	call GRM_360
	cmp BYTE [r8+6],0
	jnz LB_2690
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a33◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a33◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2689
LB_2690:
; .rb_rle 
	add rsp,0
	jmp LB_2685
LB_2689:
	jmp LB_2692
LB_2691:
	add r14,1 
LB_2692:
	cmp r14,r9
	jge LB_2693
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2691
LB_2693
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2695
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_2695
	add r14,1
	jmp LB_2694
LB_2695:
; .rb_rle 
	add rsp,8
	jmp LB_2685
LB_2694:
	jmp LB_2697
LB_2696:
	add r14,1 
LB_2697:
	cmp r14,r9
	jge LB_2698
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2696
LB_2698
	call GRM_360
	cmp BYTE [r8+6],0
	jnz LB_2700
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a33◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a33◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2699
LB_2700:
; .rb_rle 
	add rsp,8
	jmp LB_2685
LB_2699:
	jmp LB_2702
LB_2701:
; .rb_rle 
	add rsp,16
	jmp LB_2685
LB_2702:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2820~1'(= r ) %2819~0'(= r ) %2818~9'(= a33◂ [ a18◂ [ ]{| l |}] ) %2817~8'(= a33◂ [ a18◂ [ ]{| l |}] ) 
; #161 { 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2821~1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } %2820~1'(= r ) %2819~0'(= r ) 
; #26 1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2822~0(<2)◂1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } %2820~1'(= r ) %2819~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2703
LB_2703:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2636
LB_2685:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2636:
; discard r14
	add rsp,8
	ret
ETR_358:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_358
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_358:
	push r14
	jmp LB_2707
LB_2706:
	add r14,1 
LB_2707:
	cmp r14,r9
	jge LB_2708
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2706
LB_2708
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2710
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_2710
	add r14,1
	jmp LB_2709
LB_2710:
; .rb_rle 
	add rsp,0
	jmp LB_2705
LB_2709:
	jmp LB_2712
LB_2711:
	add r14,1 
LB_2712:
	cmp r14,r9
	jge LB_2713
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2711
LB_2713
	call GRM_357
	cmp BYTE [r8+6],0
	jnz LB_2715
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a32◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a32◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2714
LB_2715:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2704
LB_2714:
	jmp LB_2717
LB_2716:
	add r14,1 
LB_2717:
	cmp r14,r9
	jge LB_2718
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2716
LB_2718
	call GRM_358
	cmp BYTE [r8+6],0
	jnz LB_2720
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2719
LB_2720:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2704
LB_2719:
	jmp LB_2722
LB_2721:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2704
LB_2722:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2826~1'(= r ) %2825~0'(= r ) %2824~9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2823~8'(= a32◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2827~0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2826~1'(= r ) %2825~0'(= r ) 
; #26 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2828~0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2826~1'(= r ) %2825~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2723
LB_2723:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2704
LB_2705:
	mov r14,QWORD [rsp] 
	jmp LB_2726
LB_2725:
	add r14,1 
LB_2726:
	cmp r14,r9
	jge LB_2727
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2725
LB_2727
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2729
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_2729
	add r14,1
	jmp LB_2728
LB_2729:
; .rb_rle 
	add rsp,0
	jmp LB_2724
LB_2728:
	jmp LB_2731
LB_2730:
	add r14,1 
LB_2731:
	cmp r14,r9
	jge LB_2732
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2730
LB_2732
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2734
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2734
	add r14,1
	jmp LB_2733
LB_2734:
; .rb_rle 
	add rsp,0
	jmp LB_2724
LB_2733:
	jmp LB_2736
LB_2735:
; .rb_rle 
	add rsp,0
	jmp LB_2724
LB_2736:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2830~1'(= r ) %2829~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2831~1(<2)◂{ } %2830~1'(= r ) %2829~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2832~0(<2)◂1(<2)◂{ } %2830~1'(= r ) %2829~0'(= r ) 
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
; mov_ptn2.
	jmp LB_2737
LB_2737:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2704
LB_2724:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2704:
; discard r14
	add rsp,8
	ret
ETR_359:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_359
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_359:
	push r14
	jmp LB_2741
LB_2740:
	add r14,1 
LB_2741:
	cmp r14,r9
	jge LB_2742
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2740
LB_2742
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2744
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_2744
	add r14,1
	jmp LB_2743
LB_2744:
; .rb_rle 
	add rsp,0
	jmp LB_2739
LB_2743:
	jmp LB_2746
LB_2745:
	add r14,1 
LB_2746:
	cmp r14,r9
	jge LB_2747
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2745
LB_2747
	call GRM_357
	cmp BYTE [r8+6],0
	jnz LB_2749
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a32◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a32◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2748
LB_2749:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2738
LB_2748:
	jmp LB_2751
LB_2750:
	add r14,1 
LB_2751:
	cmp r14,r9
	jge LB_2752
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2750
LB_2752
	call GRM_358
	cmp BYTE [r8+6],0
	jnz LB_2754
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2753
LB_2754:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2738
LB_2753:
	jmp LB_2756
LB_2755:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2738
LB_2756:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2836~1'(= r ) %2835~0'(= r ) %2834~9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2833~8'(= a32◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2837~0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2836~1'(= r ) %2835~0'(= r ) 
; #309 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2838~0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2836~1'(= r ) %2835~0'(= r ) 
; #26 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2839~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2836~1'(= r ) %2835~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2757
LB_2757:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2738
LB_2739:
	mov r14,QWORD [rsp] 
	jmp LB_2760
LB_2759:
	add r14,1 
LB_2760:
	cmp r14,r9
	jge LB_2761
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2759
LB_2761
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2763
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_2763
	add r14,1
	jmp LB_2762
LB_2763:
; .rb_rle 
	add rsp,0
	jmp LB_2758
LB_2762:
	jmp LB_2765
LB_2764:
	add r14,1 
LB_2765:
	cmp r14,r9
	jge LB_2766
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2764
LB_2766
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2768
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2768
	add r14,1
	jmp LB_2767
LB_2768:
; .rb_rle 
	add rsp,0
	jmp LB_2758
LB_2767:
	jmp LB_2770
LB_2769:
; .rb_rle 
	add rsp,0
	jmp LB_2758
LB_2770:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2841~1'(= r ) %2840~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2842~1(<2)◂{ } %2841~1'(= r ) %2840~0'(= r ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2843~0(<2)◂1(<2)◂{ } %2841~1'(= r ) %2840~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2844~0(<2)◂0(<2)◂1(<2)◂{ } %2841~1'(= r ) %2840~0'(= r ) 
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
; mov_ptn2.
	jmp LB_2771
LB_2771:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2738
LB_2758:
	mov r14,QWORD [rsp]
	jmp LB_2774
LB_2773:
	add r14,1 
LB_2774:
	cmp r14,r9
	jge LB_2775
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2773
LB_2775
	call GRM_337
	cmp BYTE [r8+6],0
	jnz LB_2777
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_2776
LB_2777:
; .rb_rle 
	add rsp,0
	jmp LB_2772
LB_2776:
	jmp LB_2779
LB_2778:
; .rb_rle 
	add rsp,16
	jmp LB_2772
LB_2779:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2847~1'(= r ) %2846~0'(= r ) %2845~{ 8'(= r ) 9'(= r ) } 
; $ %[ "mtc_line_tl 0" ] ⊢ %[ "mtc_line_tl 0" ]
;; rsp=2 , %2848~%[ "mtc_line_tl 0" ] %2847~1'(= r ) %2846~0'(= r ) %2845~{ 8'(= r ) 9'(= r ) } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2849~1(<2)◂{ } %2848~%[ "mtc_line_tl 0" ] %2847~1'(= r ) %2846~0'(= r ) %2845~{ 8'(= r ) 9'(= r ) } 
; #25 { { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2850~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } %2845~{ 8'(= r ) 9'(= r ) } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2851~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } %2845~{ 8'(= r ) 9'(= r ) } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2852~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } %2845~{ 8'(= r ) 9'(= r ) } 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_2780
LB_2780:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2738
LB_2772:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2738:
; discard r14
	add rsp,8
	ret
ETR_360:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_360
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_360:
	push r14
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_2784
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2783
LB_2784:
; .rb_rle 
	add rsp,0
	jmp LB_2782
LB_2783:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2786
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_2786
	add r14,1
	jmp LB_2785
LB_2786:
; .rb_rle 
	add rsp,8
	jmp LB_2782
LB_2785:
	jmp LB_2788
LB_2787:
; .rb_rle 
	add rsp,8
	jmp LB_2782
LB_2788:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2855~1'(= r ) %2854~0'(= r ) %2853~8'(= {| l |} ) 
; #158 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %2856~1(<2)◂8'(= {| l |} ) %2855~1'(= r ) %2854~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %2857~0(<2)◂1(<2)◂8'(= {| l |} ) %2855~1'(= r ) %2854~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2789
LB_2789:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2781
LB_2782:
	mov r14,QWORD [rsp]
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_2792
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2791
LB_2792:
; .rb_rle 
	add rsp,0
	jmp LB_2790
LB_2791:
	jmp LB_2794
LB_2793:
; .rb_rle 
	add rsp,8
	jmp LB_2790
LB_2794:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2860~1'(= r ) %2859~0'(= r ) %2858~8'(= a27◂ [ a18◂ [ ]] ) 
; #159 8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %2861~0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) %2860~1'(= r ) %2859~0'(= r ) 
; #26 0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %2862~0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) %2860~1'(= r ) %2859~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2795
LB_2795:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2781
LB_2790:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2781:
; discard r14
	add rsp,8
	ret
LB_2823:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2830+8*rax]
LB_2830: dq LB_2824,LB_2825,LB_2826,LB_2827,LB_2828,LB_2829
LB_2824:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2832
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2831
LB_2825:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2833
	jmp LB_2831
LB_2826:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2834
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2831
LB_2827:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2835
	jmp LB_2831
LB_2828:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2836
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2831
LB_2829:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2837
	jmp LB_2831
LB_2831:
	ret
LB_2837:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2840+8*rax]
LB_2840: dq LB_2838,LB_2839
LB_2838:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2836
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2837
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2841
LB_2839:
	jmp LB_2841
LB_2841:
	ret
LB_2836:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2844+8*rax]
LB_2844: dq LB_2842,LB_2843
LB_2842:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2846
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2847
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2845
LB_2843:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2846
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2848
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2845
LB_2845:
	ret
LB_2848:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2854+8*rax]
LB_2854: dq LB_2849,LB_2850,LB_2851,LB_2852,LB_2853
LB_2849:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2856
	jmp LB_2855
LB_2850:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2848
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2848
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2855
LB_2851:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2848
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2848
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2855
LB_2852:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1735
	jmp LB_2855
LB_2853:
	mov rdi,r8
	call free_s8
	jmp LB_2855
LB_2855:
	ret
LB_2856:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2859+8*rax]
LB_2859: dq LB_2857,LB_2858
LB_2857:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2848
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2856
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2860
LB_2858:
	jmp LB_2860
LB_2860:
	ret
LB_2847:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2863+8*rax]
LB_2863: dq LB_2861,LB_2862
LB_2861:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2848
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2847
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2864
LB_2862:
	jmp LB_2864
LB_2864:
	ret
LB_2846:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2867+8*rax]
LB_2867: dq LB_2865,LB_2866
LB_2865:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2846
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2868
LB_2866:
	jmp LB_2868
LB_2868:
	ret
LB_2835:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2871+8*rax]
LB_2871: dq LB_2869,LB_2870
LB_2869:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1673
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2873
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_1725
	pop r8 
	FREE_RCD 4, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2835
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2872
LB_2870:
	jmp LB_2872
LB_2872:
	ret
LB_2873:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2876+8*rax]
LB_2876: dq LB_2874,LB_2875
LB_2874:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2848
	jmp LB_2877
LB_2875:
	jmp LB_2877
LB_2877:
	ret
LB_2834:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2881+8*rax]
LB_2881: dq LB_2878,LB_2879,LB_2880
LB_2878:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1673
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2873
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1725
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2882
LB_2879:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1754
	jmp LB_2882
LB_2880:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1725
	jmp LB_2882
LB_2882:
	ret
LB_2833:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2885+8*rax]
LB_2885: dq LB_2883,LB_2884
LB_2883:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2887
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2833
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2886
LB_2884:
	jmp LB_2886
LB_2886:
	ret
LB_2887:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2890+8*rax]
LB_2890: dq LB_2888,LB_2889
LB_2888:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2892
	jmp LB_2891
LB_2889:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2893
	jmp LB_2891
LB_2891:
	ret
LB_2893:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2896+8*rax]
LB_2896: dq LB_2894,LB_2895
LB_2894:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1757
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1673
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1725
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_2898
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_2899
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_2900
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*6]
	call LB_2893
	pop r8 
	FREE_RCD 7, r8
	jmp LB_2897
LB_2895:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1757
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1673
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1725
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_2898
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_2899
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_2900
	pop r8 
	FREE_RCD 6, r8
	jmp LB_2897
LB_2897:
	ret
LB_2900:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2903+8*rax]
LB_2903: dq LB_2901,LB_2902
LB_2901:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1673
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2893
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2904
LB_2902:
	jmp LB_2904
LB_2904:
	ret
LB_2899:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2908+8*rax]
LB_2908: dq LB_2905,LB_2906,LB_2907
LB_2905:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2910
	jmp LB_2909
LB_2906:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2911
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2899
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2909
LB_2907:
	jmp LB_2909
LB_2909:
	ret
LB_2911:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2914+8*rax]
LB_2914: dq LB_2912,LB_2913
LB_2912:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2916
	jmp LB_2915
LB_2913:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2916
	jmp LB_2915
LB_2915:
	ret
LB_2916:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2919+8*rax]
LB_2919: dq LB_2917,LB_2918
LB_2917:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1735
	jmp LB_2920
LB_2918:
	mov rdi,r8
	call free_s8
	jmp LB_2920
LB_2920:
	ret
LB_2910:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2923+8*rax]
LB_2923: dq LB_2921,LB_2922
LB_2921:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2911
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2910
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2924
LB_2922:
	jmp LB_2924
LB_2924:
	ret
LB_2898:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2928+8*rax]
LB_2928: dq LB_2925,LB_2926,LB_2927
LB_2925:
	jmp LB_2929
LB_2926:
	jmp LB_2929
LB_2927:
	jmp LB_2929
LB_2929:
	ret
LB_2892:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2932+8*rax]
LB_2932: dq LB_2930,LB_2931
LB_2930:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1683
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2898
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2899
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_2934
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_2892
	pop r8 
	FREE_RCD 5, r8
	jmp LB_2933
LB_2931:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1683
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2898
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2899
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_2934
	pop r8 
	FREE_RCD 4, r8
	jmp LB_2933
LB_2933:
	ret
LB_2934:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2937+8*rax]
LB_2937: dq LB_2935,LB_2936
LB_2935:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2892
	jmp LB_2938
LB_2936:
	jmp LB_2938
LB_2938:
	ret
LB_2832:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2941+8*rax]
LB_2941: dq LB_2939,LB_2940
LB_2939:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2943
	jmp LB_2942
LB_2940:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1735
	jmp LB_2942
LB_2942:
	ret
LB_2943:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2946+8*rax]
LB_2946: dq LB_2944,LB_2945
LB_2944:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2823
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2943
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2947
LB_2945:
	jmp LB_2947
LB_2947:
	ret
LB_2816: ;; #310 { 0'(= a47◂ [ a42◂ [ ]] ) 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ 0'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) : ({ _t47◂_t42 _t47◂_lst◂_t42 }→_t47◂{ _t42 _lst◂_t42 })
;; rsp=0 , %1799~1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %1798~0'(= a47◂ [ a42◂ [ ]] ) 
;; ? 0'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂2'(= a42◂ [ ] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_2818
	jmp LB_2819
LB_2818:
	jmp LB_2817
LB_2819:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1801~2'(= a42◂ [ ] ) %1799~1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) 
;; ? 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 0(<2)◂0'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2821
	jmp LB_2822
LB_2821:
	jmp LB_2820
LB_2822:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1803~0'(= a2◂ [ a42◂ [ ]] ) %1801~2'(= a42◂ [ ] ) 
; #309 { 2'(= a42◂ [ ] ) 0'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂{ 2'(= a42◂ [ ] ) 0'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=0 , %1804~0(<2)◂{ 2'(= a42◂ [ ] ) 0'(= a2◂ [ a42◂ [ ]] ) } 
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_2820:
;; ?. 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1802~0'(= a2◂ [ *{ rr{| l |}}] ) %1801~2'(= a42◂ [ ] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1805~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) %1801~2'(= a42◂ [ ] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a42◂ [ ] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2823
	C_POP_REGS
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_2817:
;; ?. 0'(= a47◂ [ a42◂ [ ]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1800~2'(= a2◂ [ *{ rr{| l |}}] ) %1799~1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) 
;; ? 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 0(<2)◂0'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2949
	jmp LB_2950
LB_2949:
	jmp LB_2948
LB_2950:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1807~0'(= a2◂ [ a42◂ [ ]] ) %1800~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1808~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1807~0'(= a2◂ [ a42◂ [ ]] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	call LB_2943
	C_POP_REGS
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
; {| 1010.. |}
	mov r13,r8
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_2948:
;; ?. 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1806~0'(= a2◂ [ *{ rr{| l |}}] ) %1800~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110.. |}
	mov r14,r13
	mov r13,r8
; mov_ptn2.
	call LB_1019
; .add_rsp 0
;; rsp=0 , %1809~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1810~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_3690: ;; #310 { 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) : ({ _t47◂_lst◂{ _s8 _t17◂_t25◂_s8 _opn◂_t34 _t28◂_s8◂_t18 } _t47◂_t28◂_s8◂_t18 }→_t47◂{ _lst◂{ _s8 _t17◂_t25◂_s8 _opn◂_t34 _t28◂_s8◂_t18 } _t28◂_s8◂_t18 })
;; rsp=0 , %1799~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %1798~0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_3692
	jmp LB_3693
LB_3692:
	jmp LB_3691
LB_3693:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1801~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %1799~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_3695
	jmp LB_3696
LB_3695:
	jmp LB_3694
LB_3696:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1803~0'(= a28◂ [ a18◂ [ ]{| l |}] ) %1801~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 
; #309 { 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=0 , %1804~0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) } 
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
; mov_ptn2.
; .add_rsp 0
	ret
LB_3694:
;; ?. 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1802~0'(= a2◂ [ *{ rr{| l |}}] ) %1801~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1805~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) %1801~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2835
	C_POP_REGS
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_3691:
;; ?. 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1800~2'(= a2◂ [ *{ rr{| l |}}] ) %1799~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_3698
	jmp LB_3699
LB_3698:
	jmp LB_3697
LB_3699:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1807~0'(= a28◂ [ a18◂ [ ]{| l |}] ) %1800~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1808~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1807~0'(= a28◂ [ a18◂ [ ]{| l |}] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
	C_POP_REGS
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] )
; {| 1010.. |}
	mov r13,r8
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_3697:
;; ?. 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1806~0'(= a2◂ [ *{ rr{| l |}}] ) %1800~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110.. |}
	mov r14,r13
	mov r13,r8
; mov_ptn2.
	call LB_1019
; .add_rsp 0
;; rsp=0 , %1809~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1810~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] )
; {| 10.. |}
	mov r14,r13
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_3872: ;; #254 { } ⊢ 0'(= a2◂ [ a25◂ [ {| l |}]] ) : ({ }→_lst◂_t25◂_s8)
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
; mov_ptn2.
; .add_rsp 0
	ret
ETR_361:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_361
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_361:
	push r14
	jmp LB_2799
LB_2798:
	add r14,1 
LB_2799:
	cmp r14,r9
	jge LB_2800
	JZ_SPC BYTE [r13+8+r14], LB_2798
LB_2800
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_2802
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2801
LB_2802:
; .rb_rle 
	add rsp,0
	jmp LB_2797
LB_2801:
	jmp LB_2804
LB_2803:
	add r14,1 
LB_2804:
	cmp r14,r9
	jge LB_2805
	JZ_SPC BYTE [r13+8+r14], LB_2803
LB_2805
	call GRM_362
	cmp BYTE [r8+6],0
	jnz LB_2807
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 9'(= a47◂ [ a42◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2806
LB_2807:
; .rb_rle 
	add rsp,8
	jmp LB_2797
LB_2806:
	jmp LB_2809
LB_2808:
	add r14,1 
LB_2809:
	cmp r14,r9
	jge LB_2810
	JZ_SPC BYTE [r13+8+r14], LB_2808
LB_2810
	call GRM_361
	cmp BYTE [r8+6],0
	jnz LB_2812
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2811
LB_2812:
; .rb_rle 
	add rsp,16
	jmp LB_2797
LB_2811:
	jmp LB_2814
LB_2813:
; .rb_rle 
	add rsp,24
	jmp LB_2797
LB_2814:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2867~1'(= r ) %2866~0'(= r ) %2865~10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %2864~9'(= a47◂ [ a42◂ [ ]] ) %2863~8'(= a47◂ [ *{ }] ) 
; #310 { 9'(= a47◂ [ a42◂ [ ]] ) 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 9'(= a47◂ [ a42◂ [ ]] ) 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ { 0'(= a47◂ [ a42◂ [ ]] ) 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) }
; {| 11000000111110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_2816
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=1 , %2868~2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) %2867~1'(= r ) %2866~0'(= r ) %2863~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) ⊢ 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2952
	jmp LB_2953
LB_2952:
	jmp LB_2951
LB_2953:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=1 , %2871~4'(= a2◂ [ a42◂ [ ]] ) %2870~3'(= a42◂ [ ] ) %2867~1'(= r ) %2866~0'(= r ) %2863~8'(= a47◂ [ *{ }] ) 
; #25 { 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %2872~0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %2867~1'(= r ) %2866~0'(= r ) %2863~8'(= a47◂ [ *{ }] ) 
; #309 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %2873~0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %2867~1'(= r ) %2866~0'(= r ) %2863~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %2874~0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %2867~1'(= r ) %2866~0'(= r ) %2863~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2815
LB_2951:
;; ?. 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2869~3'(= a2◂ [ *{ rr{| l |}}] ) %2867~1'(= r ) %2866~0'(= r ) %2863~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2875~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2867~1'(= r ) %2866~0'(= r ) %2863~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2876~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2867~1'(= r ) %2866~0'(= r ) %2863~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2815
LB_2815:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2796
LB_2797:
	mov r14,QWORD [rsp]
	jmp LB_2956
LB_2955:
	add r14,1 
LB_2956:
	cmp r14,r9
	jge LB_2957
	JZ_SPC BYTE [r13+8+r14], LB_2955
LB_2957
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_2959
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2958
LB_2959:
; .rb_rle 
	add rsp,0
	jmp LB_2954
LB_2958:
	push r14
	jmp LB_2965
LB_2964:
	add r14,1 
LB_2965:
	cmp r14,r9
	jge LB_2966
	JZ_SPC BYTE [r13+8+r14], LB_2964
LB_2966
	cmp r14,r9
	jge LB_2968
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_2967
LB_2968:
; .rb_rle 
	add rsp,0
	jmp LB_2963
LB_2967:
	jmp LB_2970
LB_2969:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2962
LB_2970:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2882~1'(= r ) %2881~0'(= r ) %2880~8'(= r ) 
; $ %[ "!!!" ] ⊢ %[ "!!!" ]
;; rsp=1 , %2883~%[ "!!!" ] %2882~1'(= r ) %2881~0'(= r ) %2880~8'(= r ) 
; #10 %[ "!!!" ] ⊢ %[ "!!!" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_2972
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_2973
LB_2973:
;; rsp=1 , %2884~%[ "!!!" ] %2882~1'(= r ) %2881~0'(= r ) %2880~8'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2885~1(<2)◂{ } %2884~%[ "!!!" ] %2882~1'(= r ) %2881~0'(= r ) %2880~8'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2971
LB_2971:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2962
LB_2963:
	mov r14,QWORD [rsp] 
	jmp LB_2976
LB_2975:
; .rb_rle 
	add rsp,0
	jmp LB_2974
LB_2976:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2887~1'(= r ) %2886~0'(= r ) 
; $ %[ "???" ] ⊢ %[ "???" ]
;; rsp=0 , %2888~%[ "???" ] %2887~1'(= r ) %2886~0'(= r ) 
; #10 %[ "???" ] ⊢ %[ "???" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_2978
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_2979
LB_2979:
;; rsp=0 , %2889~%[ "???" ] %2887~1'(= r ) %2886~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2890~0(<2)◂{ } %2889~%[ "???" ] %2887~1'(= r ) %2886~0'(= r ) 
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
; mov_ptn2.
	jmp LB_2977
LB_2977:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2962
LB_2974:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2962:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_2960
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1110000010.. |}
; mov_ptn2.
	jmp LB_2961
LB_2960:
; .rb_rle 
	add rsp,8
	jmp LB_2954
LB_2961:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2891~{ } %2879~1'(= r ) %2878~0'(= r ) %2877~8'(= a47◂ [ *{ }] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2892~1(<2)◂{ } %2891~{ } %2879~1'(= r ) %2878~0'(= r ) %2877~8'(= a47◂ [ *{ }] ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=1 , %2893~0(<2)◂1(<2)◂{ } %2891~{ } %2879~1'(= r ) %2878~0'(= r ) %2877~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=1 , %2894~0(<2)◂0(<2)◂1(<2)◂{ } %2891~{ } %2879~1'(= r ) %2878~0'(= r ) %2877~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_2980
LB_2980:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2796
LB_2954:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2796:
; discard r14
	add rsp,8
	ret
ETR_362:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_362
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_362:
	push r14
	jmp LB_2984
LB_2983:
	add r14,1 
LB_2984:
	cmp r14,r9
	jge LB_2985
	JZ_SPC BYTE [r13+8+r14], LB_2983
LB_2985
	lea rax,[r14+7]
	cmp rax,r9
	jg LB_2987
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_2987
	cmp BYTE [rdi+1],167
	jnz LB_2987
	cmp BYTE [rdi+2],194
	jnz LB_2987
	cmp BYTE [rdi+3],167
	jnz LB_2987
	cmp BYTE [rdi+4],43
	jnz LB_2987
	cmp BYTE [rdi+5],115
	jnz LB_2987
	cmp BYTE [rdi+6],56
	jnz LB_2987
	add r14,7
	jmp LB_2986
LB_2987:
; .rb_rle 
	add rsp,0
	jmp LB_2982
LB_2986:
	push r14
	jmp LB_2993
LB_2992:
	add r14,1 
LB_2993:
	cmp r14,r9
	jge LB_2994
	JZ_SPC BYTE [r13+8+r14], LB_2992
LB_2994
	call GRM_377
	cmp BYTE [r8+6],0
	jnz LB_2996
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]} ) ⊢ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_2995
LB_2996:
; .rb_rle 
	add rsp,0
	jmp LB_2991
LB_2995:
	jmp LB_2998
LB_2997:
	add r14,1 
LB_2998:
	cmp r14,r9
	jge LB_2999
	JZ_SPC BYTE [r13+8+r14], LB_2997
LB_2999
	call GRM_378
	cmp BYTE [r8+6],0
	jnz LB_3001
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3000
LB_3001:
; .rb_rle 
	add rsp,16
	jmp LB_2991
LB_3000:
	jmp LB_3003
LB_3002:
; .rb_rle 
	add rsp,24
	jmp LB_2991
LB_3003:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2900~1'(= r ) %2899~0'(= r ) %2898~10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) %2897~{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 
; #25 { { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2901~0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %2900~1'(= r ) %2899~0'(= r ) 
; #266 0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2902~1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %2900~1'(= r ) %2899~0'(= r ) 
; #309 1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2903~0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %2900~1'(= r ) %2899~0'(= r ) 
; #26 0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2904~0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %2900~1'(= r ) %2899~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_3004
LB_3004:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2990
LB_2991:
	mov r14,QWORD [rsp]
	jmp LB_3007
LB_3006:
	add r14,1 
LB_3007:
	cmp r14,r9
	jge LB_3008
	JZ_SPC BYTE [r13+8+r14], LB_3006
LB_3008
	call GRM_363
	cmp BYTE [r8+6],0
	jnz LB_3010
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3009
LB_3010:
; .rb_rle 
	add rsp,0
	jmp LB_3005
LB_3009:
	jmp LB_3012
LB_3011:
; .rb_rle 
	add rsp,0
	jmp LB_3005
LB_3012:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2907~1'(= r ) %2906~0'(= r ) %2905~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2908~1(<2)◂{ } %2907~1'(= r ) %2906~0'(= r ) %2905~{ } 
; $ %[ "grb_etr 1" ] ⊢ %[ "grb_etr 1" ]
;; rsp=0 , %2909~%[ "grb_etr 1" ] %2908~1(<2)◂{ } %2907~1'(= r ) %2906~0'(= r ) %2905~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2910~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } %2905~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2911~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } %2905~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2912~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } %2905~{ } 
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
; mov_ptn2.
	jmp LB_3013
LB_3013:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2990
LB_3005:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2990:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_2988
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 3'(= a47◂ [ a42◂ [ ]] )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_2989
LB_2988:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2981
LB_2989:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2913~3'(= a47◂ [ a42◂ [ ]] ) %2896~1'(= r ) %2895~0'(= r ) 
; #26 3'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
;; rsp=0 , %2914~0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) %2896~1'(= r ) %2895~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3014
LB_3014:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2981
LB_2982:
	mov r14,QWORD [rsp] 
	jmp LB_3017
LB_3016:
	add r14,1 
LB_3017:
	cmp r14,r9
	jge LB_3018
	JZ_SPC BYTE [r13+8+r14], LB_3016
LB_3018
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_3020
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3019
LB_3020:
; .rb_rle 
	add rsp,0
	jmp LB_3015
LB_3019:
	jmp LB_3022
LB_3021:
	add r14,1 
LB_3022:
	cmp r14,r9
	jge LB_3023
	JZ_SPC BYTE [r13+8+r14], LB_3021
LB_3023
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_3025
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3025
	cmp BYTE [rdi+1],167
	jnz LB_3025
	cmp BYTE [rdi+2],194
	jnz LB_3025
	cmp BYTE [rdi+3],167
	jnz LB_3025
	add r14,4
	jmp LB_3024
LB_3025:
; .rb_rle 
	add rsp,8
	jmp LB_3015
LB_3024:
	push r14
	jmp LB_3031
LB_3030:
	add r14,1 
LB_3031:
	cmp r14,r9
	jge LB_3032
	JZ_SPC BYTE [r13+8+r14], LB_3030
LB_3032
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3034
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3033
LB_3034:
; .rb_rle 
	add rsp,0
	jmp LB_3029
LB_3033:
	jmp LB_3036
LB_3035:
	add r14,1 
LB_3036:
	cmp r14,r9
	jge LB_3037
	JZ_SPC BYTE [r13+8+r14], LB_3035
LB_3037
	call GRM_365
	cmp BYTE [r8+6],0
	jnz LB_3039
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a43◂ [ ]] ) ⊢ 9'(= a47◂ [ a43◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3038
LB_3039:
; .rb_rle 
	add rsp,8
	jmp LB_3029
LB_3038:
	jmp LB_3041
LB_3040:
; .rb_rle 
	add rsp,16
	jmp LB_3029
LB_3041:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2921~1'(= r ) %2920~0'(= r ) %2919~9'(= a47◂ [ a43◂ [ ]] ) %2918~8'(= {| l |} ) 
;; ? 9'(= a47◂ [ a43◂ [ ]] ) ⊢ 0(<2)◂2'(= a43◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3044
	jmp LB_3045
LB_3044:
	jmp LB_3043
LB_3045:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2923~2'(= a43◂ [ ] ) %2921~1'(= r ) %2920~0'(= r ) %2918~8'(= {| l |} ) 
; #267 { 8'(= {| l |} ) 2'(= a43◂ [ ] ) } ⊢ 0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) }
;; rsp=2 , %2924~0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } %2921~1'(= r ) %2920~0'(= r ) 
; #309 0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } ⊢ 0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) }
;; rsp=2 , %2925~0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } %2921~1'(= r ) %2920~0'(= r ) 
; #26 0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } ⊢ 0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) }
;; rsp=2 , %2926~0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } %2921~1'(= r ) %2920~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3042
LB_3043:
;; ?. 9'(= a47◂ [ a43◂ [ ]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2922~2'(= a2◂ [ *{ rr{| l |}}] ) %2921~1'(= r ) %2920~0'(= r ) %2918~8'(= {| l |} ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2927~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2921~1'(= r ) %2920~0'(= r ) %2918~8'(= {| l |} ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2928~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2921~1'(= r ) %2920~0'(= r ) %2918~8'(= {| l |} ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3042
LB_3042:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3028
LB_3029:
	mov r14,QWORD [rsp]
	jmp LB_3048
LB_3047:
	add r14,1 
LB_3048:
	cmp r14,r9
	jge LB_3049
	JZ_SPC BYTE [r13+8+r14], LB_3047
LB_3049
	call GRM_364
	cmp BYTE [r8+6],0
	jnz LB_3051
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3050
LB_3051:
; .rb_rle 
	add rsp,0
	jmp LB_3046
LB_3050:
	jmp LB_3053
LB_3052:
; .rb_rle 
	add rsp,0
	jmp LB_3046
LB_3053:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2931~1'(= r ) %2930~0'(= r ) %2929~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2932~1(<2)◂{ } %2931~1'(= r ) %2930~0'(= r ) %2929~{ } 
; $ %[ "glb_etr 0.1" ] ⊢ %[ "glb_etr 0.1" ]
;; rsp=0 , %2933~%[ "glb_etr 0.1" ] %2932~1(<2)◂{ } %2931~1'(= r ) %2930~0'(= r ) %2929~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
;; rsp=0 , %2934~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } %2929~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
;; rsp=0 , %2935~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } %2929~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
;; rsp=0 , %2936~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } %2929~{ } 
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
; mov_ptn2.
	jmp LB_3054
LB_3054:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3028
LB_3046:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3028:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_3026
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 3'(= a47◂ [ a42◂ [ ]] )
; {| 1111000010.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_3027
LB_3026:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2981
LB_3027:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2937~3'(= a47◂ [ a42◂ [ ]] ) %2917~1'(= r ) %2916~0'(= r ) %2915~8'(= a47◂ [ *{ }] ) 
; #26 3'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
;; rsp=1 , %2938~0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) %2917~1'(= r ) %2916~0'(= r ) %2915~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
	C_POP_REGS
; .mov_ptn2 0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
; {| 00110.. |}
	mov r8,r9
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3055
LB_3055:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2981
LB_3015:
	mov r14,QWORD [rsp] 
	jmp LB_3058
LB_3057:
	add r14,1 
LB_3058:
	cmp r14,r9
	jge LB_3059
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3057
LB_3059
	call GRM_343
	cmp BYTE [r8+6],0
	jnz LB_3061
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3060
LB_3061:
; .rb_rle 
	add rsp,0
	jmp LB_3056
LB_3060:
	jmp LB_3063
LB_3062:
	add r14,1 
LB_3063:
	cmp r14,r9
	jge LB_3064
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3062
LB_3064
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3066
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3066
	add r14,1
	jmp LB_3065
LB_3066:
; .rb_rle 
	add rsp,0
	jmp LB_3056
LB_3065:
	jmp LB_3068
LB_3067:
	add r14,1 
LB_3068:
	cmp r14,r9
	jge LB_3069
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3067
LB_3069
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_3071
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3070
LB_3071:
; .rb_rle 
	add rsp,0
	jmp LB_3056
LB_3070:
	jmp LB_3073
LB_3072:
; .rb_rle 
	add rsp,8
	jmp LB_3056
LB_3073:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2941~1'(= r ) %2940~0'(= r ) %2939~8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3076
	jmp LB_3077
LB_3076:
	jmp LB_3075
LB_3077:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2943~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2941~1'(= r ) %2940~0'(= r ) 
; #257 2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %2944~2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2941~1'(= r ) %2940~0'(= r ) 
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=1 , %2945~%[ "" ] %2944~2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2941~1'(= r ) %2940~0'(= r ) 
; #265 { %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2946~2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2941~1'(= r ) %2940~0'(= r ) 
; #309 2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2947~0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2941~1'(= r ) %2940~0'(= r ) 
; #26 0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2948~0(<2)◂0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2941~1'(= r ) %2940~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3074
LB_3075:
;; ?. 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2942~2'(= a2◂ [ *{ rr{| l |}}] ) %2941~1'(= r ) %2940~0'(= r ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2949~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2941~1'(= r ) %2940~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2950~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2941~1'(= r ) %2940~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3074
LB_3074:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2981
LB_3056:
	mov r14,QWORD [rsp]
	jmp LB_3080
LB_3079:
	add r14,1 
LB_3080:
	cmp r14,r9
	jge LB_3081
	JZ_SPC BYTE [r13+8+r14], LB_3079
LB_3081
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_3083
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3083
	cmp BYTE [rdi+1],167
	jnz LB_3083
	add r14,2
	jmp LB_3082
LB_3083:
; .rb_rle 
	add rsp,0
	jmp LB_3078
LB_3082:
	push r14
	jmp LB_3089
LB_3088:
	add r14,1 
LB_3089:
	cmp r14,r9
	jge LB_3090
	JZ_SPC BYTE [r13+8+r14], LB_3088
LB_3090
	call GRM_373
	cmp BYTE [r8+6],0
	jnz LB_3092
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 8'(= a47◂ [ a42◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3091
LB_3092:
; .rb_rle 
	add rsp,0
	jmp LB_3087
LB_3091:
	jmp LB_3094
LB_3093:
; .rb_rle 
	add rsp,8
	jmp LB_3087
LB_3094:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2955~1'(= r ) %2954~0'(= r ) %2953~8'(= a47◂ [ a42◂ [ ]] ) 
; #26 8'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂8'(= a47◂ [ a42◂ [ ]] )
;; rsp=1 , %2956~0(<2)◂8'(= a47◂ [ a42◂ [ ]] ) %2955~1'(= r ) %2954~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3095
LB_3095:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3086
LB_3087:
	mov r14,QWORD [rsp]
	jmp LB_3098
LB_3097:
	add r14,1 
LB_3098:
	cmp r14,r9
	jge LB_3099
	JZ_SPC BYTE [r13+8+r14], LB_3097
LB_3099
	call GRM_363
	cmp BYTE [r8+6],0
	jnz LB_3101
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3100
LB_3101:
; .rb_rle 
	add rsp,0
	jmp LB_3096
LB_3100:
	jmp LB_3103
LB_3102:
; .rb_rle 
	add rsp,0
	jmp LB_3096
LB_3103:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2959~1'(= r ) %2958~0'(= r ) %2957~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2960~1(<2)◂{ } %2959~1'(= r ) %2958~0'(= r ) %2957~{ } 
; $ %[ "glb_etr 3" ] ⊢ %[ "glb_etr 3" ]
;; rsp=0 , %2961~%[ "glb_etr 3" ] %2960~1(<2)◂{ } %2959~1'(= r ) %2958~0'(= r ) %2957~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
;; rsp=0 , %2962~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } %2957~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
;; rsp=0 , %2963~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } %2957~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
;; rsp=0 , %2964~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } %2957~{ } 
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
; mov_ptn2.
	jmp LB_3104
LB_3104:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3086
LB_3096:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3086:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_3084
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 3'(= a47◂ [ a42◂ [ ]] )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_3085
LB_3084:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2981
LB_3085:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2965~3'(= a47◂ [ a42◂ [ ]] ) %2952~1'(= r ) %2951~0'(= r ) 
; #26 3'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
;; rsp=0 , %2966~0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) %2952~1'(= r ) %2951~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3105
LB_3105:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2981
LB_3078:
	mov r14,QWORD [rsp] 
	jmp LB_3108
LB_3107:
	add r14,1 
LB_3108:
	cmp r14,r9
	jge LB_3109
	JZ_SPC BYTE [r13+8+r14], LB_3107
LB_3109
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_3111
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3111
	cmp BYTE [rdi+1],182
	jnz LB_3111
	add r14,2
	jmp LB_3110
LB_3111:
; .rb_rle 
	add rsp,0
	jmp LB_3106
LB_3110:
	push r14
	jmp LB_3117
LB_3116:
	add r14,1 
LB_3117:
	cmp r14,r9
	jge LB_3118
	JZ_SPC BYTE [r13+8+r14], LB_3116
LB_3118
	call GRM_367
	cmp BYTE [r8+6],0
	jnz LB_3120
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a42◂ [ ] ) ⊢ 8'(= a42◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3119
LB_3120:
; .rb_rle 
	add rsp,0
	jmp LB_3115
LB_3119:
	jmp LB_3122
LB_3121:
; .rb_rle 
	add rsp,8
	jmp LB_3115
LB_3122:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2971~1'(= r ) %2970~0'(= r ) %2969~8'(= a42◂ [ ] ) 
; #309 8'(= a42◂ [ ] ) ⊢ 0(<2)◂8'(= a42◂ [ ] )
;; rsp=1 , %2972~0(<2)◂8'(= a42◂ [ ] ) %2971~1'(= r ) %2970~0'(= r ) 
; #26 0(<2)◂8'(= a42◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a42◂ [ ] )
;; rsp=1 , %2973~0(<2)◂0(<2)◂8'(= a42◂ [ ] ) %2971~1'(= r ) %2970~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3123
LB_3123:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3114
LB_3115:
	mov r14,QWORD [rsp]
	jmp LB_3126
LB_3125:
	add r14,1 
LB_3126:
	cmp r14,r9
	jge LB_3127
	JZ_SPC BYTE [r13+8+r14], LB_3125
LB_3127
	call GRM_363
	cmp BYTE [r8+6],0
	jnz LB_3129
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3128
LB_3129:
; .rb_rle 
	add rsp,0
	jmp LB_3124
LB_3128:
	jmp LB_3131
LB_3130:
; .rb_rle 
	add rsp,0
	jmp LB_3124
LB_3131:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2976~1'(= r ) %2975~0'(= r ) %2974~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2977~1(<2)◂{ } %2976~1'(= r ) %2975~0'(= r ) %2974~{ } 
; $ %[ "glb_etr 4" ] ⊢ %[ "glb_etr 4" ]
;; rsp=0 , %2978~%[ "glb_etr 4" ] %2977~1(<2)◂{ } %2976~1'(= r ) %2975~0'(= r ) %2974~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
;; rsp=0 , %2979~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } %2974~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
;; rsp=0 , %2980~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } %2974~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
;; rsp=0 , %2981~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } %2974~{ } 
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
; mov_ptn2.
	jmp LB_3132
LB_3132:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3114
LB_3124:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3114:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_3112
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 3'(= a47◂ [ a42◂ [ ]] )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_3113
LB_3112:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2981
LB_3113:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2982~3'(= a47◂ [ a42◂ [ ]] ) %2968~1'(= r ) %2967~0'(= r ) 
; #26 3'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
;; rsp=0 , %2983~0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) %2968~1'(= r ) %2967~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3133
LB_3133:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2981
LB_3106:
	mov r14,QWORD [rsp] 
	mov r8,unt_1
LB_2981:
; discard r14
	add rsp,8
	ret
ETR_363:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_363
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_363:
	push r14
	jmp LB_3137
LB_3136:
	add r14,1 
LB_3137:
	cmp r14,r9
	jge LB_3138
	JZ_SPC BYTE [r13+8+r14], LB_3136
LB_3138
	call GRM_339
	cmp BYTE [r8+6],0
	jnz LB_3140
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3139
LB_3140:
; .rb_rle 
	add rsp,0
	jmp LB_3135
LB_3139:
	jmp LB_3142
LB_3141:
	add r14,1 
LB_3142:
	cmp r14,r9
	jge LB_3143
	JZ_SPC BYTE [r13+8+r14], LB_3141
LB_3143
	call GRM_363
	cmp BYTE [r8+6],0
	jnz LB_3145
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3144
LB_3145:
; .rb_rle 
	add rsp,0
	jmp LB_3135
LB_3144:
	jmp LB_3147
LB_3146:
; .rb_rle 
	add rsp,0
	jmp LB_3135
LB_3147:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2987~1'(= r ) %2986~0'(= r ) %2985~{ } %2984~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2988~0(<2)◂{ } %2987~1'(= r ) %2986~0'(= r ) %2985~{ } %2984~{ } 
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
; mov_ptn2.
	jmp LB_3148
LB_3148:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3134
LB_3135:
	mov r14,QWORD [rsp]
	jmp LB_3151
LB_3150:
; .rb_rle 
	add rsp,0
	jmp LB_3149
LB_3151:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2990~1'(= r ) %2989~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2991~0(<2)◂{ } %2990~1'(= r ) %2989~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3152
LB_3152:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3134
LB_3149:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3134:
; discard r14
	add rsp,8
	ret
ETR_364:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_364
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_364:
	push r14
	jmp LB_3156
LB_3155:
	add r14,1 
LB_3156:
	cmp r14,r9
	jge LB_3157
	JZ_SPC BYTE [r13+8+r14], LB_3155
LB_3157
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_3159
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3159
	cmp BYTE [rdi+1],136
	jnz LB_3159
	cmp BYTE [rdi+2],142
	jnz LB_3159
	cmp BYTE [rdi+3],226
	jnz LB_3159
	cmp BYTE [rdi+4],136
	jnz LB_3159
	cmp BYTE [rdi+5],142
	jnz LB_3159
	add r14,6
	jmp LB_3158
LB_3159:
; .rb_rle 
	add rsp,0
	jmp LB_3154
LB_3158:
	jmp LB_3161
LB_3160:
; .rb_rle 
	add rsp,0
	jmp LB_3154
LB_3161:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2993~1'(= r ) %2992~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2994~0(<2)◂{ } %2993~1'(= r ) %2992~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3162
LB_3162:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3153
LB_3154:
	mov r14,QWORD [rsp]
	jmp LB_3165
LB_3164:
	add r14,1 
LB_3165:
	cmp r14,r9
	jge LB_3166
	JZ_SPC BYTE [r13+8+r14], LB_3164
LB_3166
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_3168
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3168
	cmp BYTE [rdi+1],167
	jnz LB_3168
	cmp BYTE [rdi+2],194
	jnz LB_3168
	cmp BYTE [rdi+3],167
	jnz LB_3168
	add r14,4
	jmp LB_3167
LB_3168:
; .rb_rle 
	add rsp,0
	jmp LB_3163
LB_3167:
	push r14
	jmp LB_3174
LB_3173:
	add r14,1 
LB_3174:
	cmp r14,r9
	jge LB_3175
	JZ_SPC BYTE [r13+8+r14], LB_3173
LB_3175
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3177
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3176
LB_3177:
; .rb_rle 
	add rsp,0
	jmp LB_3172
LB_3176:
	jmp LB_3179
LB_3178:
	add r14,1 
LB_3179:
	cmp r14,r9
	jge LB_3180
	JZ_SPC BYTE [r13+8+r14], LB_3178
LB_3180
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3182
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3182
	add r14,1
	jmp LB_3181
LB_3182:
; .rb_rle 
	add rsp,8
	jmp LB_3172
LB_3181:
	jmp LB_3184
LB_3183:
	add r14,1 
LB_3184:
	cmp r14,r9
	jge LB_3185
	JZ_SPC BYTE [r13+8+r14], LB_3183
LB_3185
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_3187
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 9'(= a18◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3186
LB_3187:
; .rb_rle 
	add rsp,8
	jmp LB_3172
LB_3186:
	jmp LB_3189
LB_3188:
	add r14,1 
LB_3189:
	cmp r14,r9
	jge LB_3190
	JZ_SPC BYTE [r13+8+r14], LB_3188
LB_3190
	call GRM_364
	cmp BYTE [r8+6],0
	jnz LB_3192
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110000110.. |}
; mov_ptn2.
	jmp LB_3191
LB_3192:
; .rb_rle 
	add rsp,16
	jmp LB_3172
LB_3191:
	jmp LB_3194
LB_3193:
; .rb_rle 
	add rsp,16
	jmp LB_3172
LB_3194:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3001~1'(= r ) %3000~0'(= r ) %2999~{ } %2998~9'(= a18◂ [ ] ) %2997~8'(= {| l |} ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=2 , %3002~0(<2)◂{ } %3001~1'(= r ) %3000~0'(= r ) %2999~{ } %2998~9'(= a18◂ [ ] ) %2997~8'(= {| l |} ) 
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
	call LB_1735
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3195
LB_3195:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3171
LB_3172:
	mov r14,QWORD [rsp]
	jmp LB_3198
LB_3197:
	add r14,1 
LB_3198:
	cmp r14,r9
	jge LB_3199
	JZ_SPC BYTE [r13+8+r14], LB_3197
LB_3199
	call GRM_364
	cmp BYTE [r8+6],0
	jnz LB_3201
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3200
LB_3201:
; .rb_rle 
	add rsp,0
	jmp LB_3196
LB_3200:
	jmp LB_3203
LB_3202:
	add r14,1 
LB_3203:
	cmp r14,r9
	jge LB_3204
	JZ_SPC BYTE [r13+8+r14], LB_3202
LB_3204
	call GRM_364
	cmp BYTE [r8+6],0
	jnz LB_3206
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3205
LB_3206:
; .rb_rle 
	add rsp,0
	jmp LB_3196
LB_3205:
	jmp LB_3208
LB_3207:
; .rb_rle 
	add rsp,0
	jmp LB_3196
LB_3208:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3006~1'(= r ) %3005~0'(= r ) %3004~{ } %3003~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %3007~0(<2)◂{ } %3006~1'(= r ) %3005~0'(= r ) %3004~{ } %3003~{ } 
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
; mov_ptn2.
	jmp LB_3209
LB_3209:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3171
LB_3196:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3171:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_3169
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1110.. |}
; mov_ptn2.
	jmp LB_3170
LB_3169:
; .rb_rle 
	add rsp,0
	jmp LB_3163
LB_3170:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3008~{ } %2996~1'(= r ) %2995~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %3009~0(<2)◂{ } %3008~{ } %2996~1'(= r ) %2995~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3210
LB_3210:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3153
LB_3163:
	mov r14,QWORD [rsp]
	jmp LB_3213
LB_3212:
	add r14,1 
LB_3213:
	cmp r14,r9
	jge LB_3214
	JZ_SPC BYTE [r13+8+r14], LB_3212
LB_3214
	cmp r14,r9
	jge LB_3216
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_3215
LB_3216:
; .rb_rle 
	add rsp,0
	jmp LB_3211
LB_3215:
	jmp LB_3218
LB_3217:
	add r14,1 
LB_3218:
	cmp r14,r9
	jge LB_3219
	JZ_SPC BYTE [r13+8+r14], LB_3217
LB_3219
	call GRM_364
	cmp BYTE [r8+6],0
	jnz LB_3221
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1111000010.. |}
; mov_ptn2.
	jmp LB_3220
LB_3221:
; .rb_rle 
	add rsp,8
	jmp LB_3211
LB_3220:
	jmp LB_3223
LB_3222:
; .rb_rle 
	add rsp,8
	jmp LB_3211
LB_3223:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3013~1'(= r ) %3012~0'(= r ) %3011~{ } %3010~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %3014~0(<2)◂{ } %3013~1'(= r ) %3012~0'(= r ) %3011~{ } %3010~8'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3224
LB_3224:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3153
LB_3211:
	mov r14,QWORD [rsp]
	jmp LB_3227
LB_3226:
; .rb_rle 
	add rsp,0
	jmp LB_3225
LB_3227:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3016~1'(= r ) %3015~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %3017~0(<2)◂{ } %3016~1'(= r ) %3015~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3228
LB_3228:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3153
LB_3225:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3153:
; discard r14
	add rsp,8
	ret
ETR_365:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_365
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_365:
	push r14
	jmp LB_3232
LB_3231:
	add r14,1 
LB_3232:
	cmp r14,r9
	jge LB_3233
	JZ_SPC BYTE [r13+8+r14], LB_3231
LB_3233
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3235
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3235
	add r14,1
	jmp LB_3234
LB_3235:
; .rb_rle 
	add rsp,0
	jmp LB_3230
LB_3234:
	jmp LB_3237
LB_3236:
	add r14,1 
LB_3237:
	cmp r14,r9
	jge LB_3238
	JZ_SPC BYTE [r13+8+r14], LB_3236
LB_3238
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_3240
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3239
LB_3240:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3229
LB_3239:
	jmp LB_3242
LB_3241:
	add r14,1 
LB_3242:
	cmp r14,r9
	jge LB_3243
	JZ_SPC BYTE [r13+8+r14], LB_3241
LB_3243
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_3245
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3244
LB_3245:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3229
LB_3244:
	jmp LB_3247
LB_3246:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3229
LB_3247:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3021~1'(= r ) %3020~0'(= r ) %3019~9'(= a47◂ [ *{ }] ) %3018~8'(= a18◂ [ ] ) 
; #260 8'(= a18◂ [ ] ) ⊢ 1(<2)◂8'(= a18◂ [ ] )
;; rsp=2 , %3022~1(<2)◂8'(= a18◂ [ ] ) %3021~1'(= r ) %3020~0'(= r ) %3019~9'(= a47◂ [ *{ }] ) 
; #309 1(<2)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂1(<2)◂8'(= a18◂ [ ] )
;; rsp=2 , %3023~0(<2)◂1(<2)◂8'(= a18◂ [ ] ) %3021~1'(= r ) %3020~0'(= r ) %3019~9'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂0(<2)◂1(<2)◂8'(= a18◂ [ ] )
;; rsp=2 , %3024~0(<2)◂0(<2)◂1(<2)◂8'(= a18◂ [ ] ) %3021~1'(= r ) %3020~0'(= r ) %3019~9'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3248
LB_3248:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3229
LB_3230:
	mov r14,QWORD [rsp] 
	jmp LB_3251
LB_3250:
	add r14,1 
LB_3251:
	cmp r14,r9
	jge LB_3252
	JZ_SPC BYTE [r13+8+r14], LB_3250
LB_3252
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_3254
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3253
LB_3254:
; .rb_rle 
	add rsp,0
	jmp LB_3249
LB_3253:
	jmp LB_3256
LB_3255:
	add r14,1 
LB_3256:
	cmp r14,r9
	jge LB_3257
	JZ_SPC BYTE [r13+8+r14], LB_3255
LB_3257
	call GRM_366
	cmp BYTE [r8+6],0
	jnz LB_3259
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 9'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3258
LB_3259:
; .rb_rle 
	add rsp,8
	jmp LB_3249
LB_3258:
	jmp LB_3261
LB_3260:
; .rb_rle 
	add rsp,16
	jmp LB_3249
LB_3261:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3028~1'(= r ) %3027~0'(= r ) %3026~9'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %3025~8'(= a47◂ [ *{ }] ) 
;; ? 9'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3264
	jmp LB_3265
LB_3264:
	jmp LB_3263
LB_3265:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3030~2'(= a2◂ [ a42◂ [ ]] ) %3028~1'(= r ) %3027~0'(= r ) %3025~8'(= a47◂ [ *{ }] ) 
; #261 2'(= a2◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
;; rsp=2 , %3031~0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) %3028~1'(= r ) %3027~0'(= r ) %3025~8'(= a47◂ [ *{ }] ) 
; #309 0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
;; rsp=2 , %3032~0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) %3028~1'(= r ) %3027~0'(= r ) %3025~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
;; rsp=2 , %3033~0(<2)◂0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) %3028~1'(= r ) %3027~0'(= r ) %3025~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3262
LB_3263:
;; ?. 9'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3029~2'(= a2◂ [ *{ rr{| l |}}] ) %3028~1'(= r ) %3027~0'(= r ) %3025~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %3034~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3028~1'(= r ) %3027~0'(= r ) %3025~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %3035~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3028~1'(= r ) %3027~0'(= r ) %3025~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3262
LB_3262:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3229
LB_3249:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3229:
; discard r14
	add rsp,8
	ret
ETR_366:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_366
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_366:
	push r14
	jmp LB_3269
LB_3268:
	add r14,1 
LB_3269:
	cmp r14,r9
	jge LB_3270
	JZ_SPC BYTE [r13+8+r14], LB_3268
LB_3270
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_3272
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3271
LB_3272:
; .rb_rle 
	add rsp,0
	jmp LB_3267
LB_3271:
	jmp LB_3274
LB_3273:
	add r14,1 
LB_3274:
	cmp r14,r9
	jge LB_3275
	JZ_SPC BYTE [r13+8+r14], LB_3273
LB_3275
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_3277
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3277
	cmp BYTE [rdi+1],136
	jnz LB_3277
	cmp BYTE [rdi+2],142
	jnz LB_3277
	cmp BYTE [rdi+3],226
	jnz LB_3277
	cmp BYTE [rdi+4],136
	jnz LB_3277
	cmp BYTE [rdi+5],142
	jnz LB_3277
	add r14,6
	jmp LB_3276
LB_3277:
; .rb_rle 
	add rsp,8
	jmp LB_3267
LB_3276:
	jmp LB_3279
LB_3278:
	add r14,1 
LB_3279:
	cmp r14,r9
	jge LB_3280
	JZ_SPC BYTE [r13+8+r14], LB_3278
LB_3280
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_3282
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3281
LB_3282:
; .rb_rle 
	add rsp,8
	jmp LB_3267
LB_3281:
	jmp LB_3284
LB_3283:
; .rb_rle 
	add rsp,16
	jmp LB_3267
LB_3284:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3039~1'(= r ) %3038~0'(= r ) %3037~9'(= a47◂ [ *{ }] ) %3036~8'(= a47◂ [ *{ }] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %3040~1(<2)◂{ } %3039~1'(= r ) %3038~0'(= r ) %3037~9'(= a47◂ [ *{ }] ) %3036~8'(= a47◂ [ *{ }] ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=2 , %3041~0(<2)◂1(<2)◂{ } %3039~1'(= r ) %3038~0'(= r ) %3037~9'(= a47◂ [ *{ }] ) %3036~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=2 , %3042~0(<2)◂0(<2)◂1(<2)◂{ } %3039~1'(= r ) %3038~0'(= r ) %3037~9'(= a47◂ [ *{ }] ) %3036~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_933
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3285
LB_3285:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3266
LB_3267:
	mov r14,QWORD [rsp]
	jmp LB_3288
LB_3287:
	add r14,1 
LB_3288:
	cmp r14,r9
	jge LB_3289
	JZ_SPC BYTE [r13+8+r14], LB_3287
LB_3289
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_3291
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3290
LB_3291:
; .rb_rle 
	add rsp,0
	jmp LB_3286
LB_3290:
	jmp LB_3293
LB_3292:
	add r14,1 
LB_3293:
	cmp r14,r9
	jge LB_3294
	JZ_SPC BYTE [r13+8+r14], LB_3292
LB_3294
	call GRM_362
	cmp BYTE [r8+6],0
	jnz LB_3296
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 9'(= a47◂ [ a42◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3295
LB_3296:
; .rb_rle 
	add rsp,8
	jmp LB_3286
LB_3295:
	jmp LB_3298
LB_3297:
	add r14,1 
LB_3298:
	cmp r14,r9
	jge LB_3299
	JZ_SPC BYTE [r13+8+r14], LB_3297
LB_3299
	call GRM_366
	cmp BYTE [r8+6],0
	jnz LB_3301
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3300
LB_3301:
; .rb_rle 
	add rsp,16
	jmp LB_3286
LB_3300:
	jmp LB_3303
LB_3302:
; .rb_rle 
	add rsp,24
	jmp LB_3286
LB_3303:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %3047~1'(= r ) %3046~0'(= r ) %3045~10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %3044~9'(= a47◂ [ a42◂ [ ]] ) %3043~8'(= a47◂ [ *{ }] ) 
; #310 { 9'(= a47◂ [ a42◂ [ ]] ) 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 9'(= a47◂ [ a42◂ [ ]] ) 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ { 0'(= a47◂ [ a42◂ [ ]] ) 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) }
; {| 11000000111110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_2816
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=1 , %3048~2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) %3047~1'(= r ) %3046~0'(= r ) %3043~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) ⊢ 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_3306
	jmp LB_3307
LB_3306:
	jmp LB_3305
LB_3307:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=1 , %3051~4'(= a2◂ [ a42◂ [ ]] ) %3050~3'(= a42◂ [ ] ) %3047~1'(= r ) %3046~0'(= r ) %3043~8'(= a47◂ [ *{ }] ) 
; #25 { 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %3052~0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %3047~1'(= r ) %3046~0'(= r ) %3043~8'(= a47◂ [ *{ }] ) 
; #309 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %3053~0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %3047~1'(= r ) %3046~0'(= r ) %3043~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %3054~0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %3047~1'(= r ) %3046~0'(= r ) %3043~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3304
LB_3305:
;; ?. 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %3049~3'(= a2◂ [ *{ rr{| l |}}] ) %3047~1'(= r ) %3046~0'(= r ) %3043~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %3055~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3047~1'(= r ) %3046~0'(= r ) %3043~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %3056~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3047~1'(= r ) %3046~0'(= r ) %3043~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3304
LB_3304:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3266
LB_3286:
	mov r14,QWORD [rsp]
	call GRM_364
	cmp BYTE [r8+6],0
	jnz LB_3310
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3309
LB_3310:
; .rb_rle 
	add rsp,0
	jmp LB_3308
LB_3309:
	jmp LB_3312
LB_3311:
; .rb_rle 
	add rsp,0
	jmp LB_3308
LB_3312:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3059~1'(= r ) %3058~0'(= r ) %3057~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3060~1(<2)◂{ } %3059~1'(= r ) %3058~0'(= r ) %3057~{ } 
; $ %[ "glb_etr 7" ] ⊢ %[ "glb_etr 7" ]
;; rsp=0 , %3061~%[ "glb_etr 7" ] %3060~1(<2)◂{ } %3059~1'(= r ) %3058~0'(= r ) %3057~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
;; rsp=0 , %3062~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } %3057~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
;; rsp=0 , %3063~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } %3057~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
;; rsp=0 , %3064~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } %3057~{ } 
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
; mov_ptn2.
	jmp LB_3313
LB_3313:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3266
LB_3308:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3266:
; discard r14
	add rsp,8
	ret
ETR_367:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_367
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_367:
	push r14
	jmp LB_3317
LB_3316:
	add r14,1 
LB_3317:
	cmp r14,r9
	jge LB_3318
	JZ_SPC BYTE [r13+8+r14], LB_3316
LB_3318
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3320
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_3320
	add r14,1
	jmp LB_3319
LB_3320:
; .rb_rle 
	add rsp,0
	jmp LB_3315
LB_3319:
	jmp LB_3322
LB_3321:
	add r14,1 
LB_3322:
	cmp r14,r9
	jge LB_3323
	JZ_SPC BYTE [r13+8+r14], LB_3321
LB_3323
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3325
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3325
	add r14,1
	jmp LB_3324
LB_3325:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3314
LB_3324:
	jmp LB_3327
LB_3326:
	add r14,1 
LB_3327:
	cmp r14,r9
	jge LB_3328
	JZ_SPC BYTE [r13+8+r14], LB_3326
LB_3328
	call GRM_368
	cmp BYTE [r8+6],0
	jnz LB_3330
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a45◂ [ ]} ) ⊢ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_3329
LB_3330:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3314
LB_3329:
	jmp LB_3332
LB_3331:
	add r14,1 
LB_3332:
	cmp r14,r9
	jge LB_3333
	JZ_SPC BYTE [r13+8+r14], LB_3331
LB_3333
	call GRM_371
	cmp BYTE [r8+6],0
	jnz LB_3335
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3334
LB_3335:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3314
LB_3334:
	jmp LB_3337
LB_3336:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3314
LB_3337:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %3068~1'(= r ) %3067~0'(= r ) %3066~10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) %3065~{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 
; #25 { { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=3 , %3069~0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3068~1'(= r ) %3067~0'(= r ) 
; #262 0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=3 , %3070~5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3068~1'(= r ) %3067~0'(= r ) 
; #26 5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=3 , %3071~0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3068~1'(= r ) %3067~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_3338
LB_3338:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3314
LB_3315:
	mov r14,QWORD [rsp] 
	jmp LB_3341
LB_3340:
	add r14,1 
LB_3341:
	cmp r14,r9
	jge LB_3342
	JZ_SPC BYTE [r13+8+r14], LB_3340
LB_3342
	call GRM_368
	cmp BYTE [r8+6],0
	jnz LB_3344
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a45◂ [ ]} ) ⊢ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_3343
LB_3344:
; .rb_rle 
	add rsp,0
	jmp LB_3339
LB_3343:
	jmp LB_3346
LB_3345:
; .rb_rle 
	add rsp,16
	jmp LB_3339
LB_3346:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3074~1'(= r ) %3073~0'(= r ) %3072~{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 
; #263 { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } ⊢ 4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
;; rsp=2 , %3075~4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } %3074~1'(= r ) %3073~0'(= r ) 
; #26 4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } ⊢ 0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
;; rsp=2 , %3076~0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } %3074~1'(= r ) %3073~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3347
LB_3347:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3314
LB_3339:
	mov r14,QWORD [rsp]
	jmp LB_3350
LB_3349:
; .rb_rle 
	add rsp,0
	jmp LB_3348
LB_3350:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3078~1'(= r ) %3077~0'(= r ) 
; $ %[ "dt_etr 0" ] ⊢ %[ "dt_etr 0" ]
;; rsp=0 , %3079~%[ "dt_etr 0" ] %3078~1'(= r ) %3077~0'(= r ) 
; #10 %[ "dt_etr 0" ] ⊢ %[ "dt_etr 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3352
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3353
LB_3353:
;; rsp=0 , %3080~%[ "dt_etr 0" ] %3078~1'(= r ) %3077~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3081~1(<2)◂{ } %3080~%[ "dt_etr 0" ] %3078~1'(= r ) %3077~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3351
LB_3351:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3314
LB_3348:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3314:
; discard r14
	add rsp,8
	ret
ETR_368:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_368
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_368:
	push r14
	jmp LB_3357
LB_3356:
	add r14,1 
LB_3357:
	cmp r14,r9
	jge LB_3358
	JZ_SPC BYTE [r13+8+r14], LB_3356
LB_3358
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3360
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3359
LB_3360:
; .rb_rle 
	add rsp,0
	jmp LB_3355
LB_3359:
	jmp LB_3362
LB_3361:
	add r14,1 
LB_3362:
	cmp r14,r9
	jge LB_3363
	JZ_SPC BYTE [r13+8+r14], LB_3361
LB_3363
	call GRM_369
	cmp BYTE [r8+6],0
	jnz LB_3365
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3364
LB_3365:
; .rb_rle 
	add rsp,8
	jmp LB_3355
LB_3364:
	jmp LB_3367
LB_3366:
	add r14,1 
LB_3367:
	cmp r14,r9
	jge LB_3368
	JZ_SPC BYTE [r13+8+r14], LB_3366
LB_3368
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3370
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3370
	add r14,1
	jmp LB_3369
LB_3370:
; .rb_rle 
	add rsp,16
	jmp LB_3355
LB_3369:
	jmp LB_3372
LB_3371:
	add r14,1 
LB_3372:
	cmp r14,r9
	jge LB_3373
	JZ_SPC BYTE [r13+8+r14], LB_3371
LB_3373
	call GRM_327
	cmp BYTE [r8+6],0
	jnz LB_3375
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 10'(= a34◂ [ ] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3374
LB_3375:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3354
LB_3374:
	jmp LB_3377
LB_3376:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3354
LB_3377:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %3086~1'(= r ) %3085~0'(= r ) %3084~10'(= a34◂ [ ] ) %3083~9'(= a2◂ [ {| l |}] ) %3082~8'(= {| l |} ) 
; #255 { 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } ⊢ 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) }
;; rsp=3 , %3087~1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } %3086~1'(= r ) %3085~0'(= r ) %3082~8'(= {| l |} ) 
; #26 { 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } } ⊢ 0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } }
;; rsp=3 , %3088~0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } } %3086~1'(= r ) %3085~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_3378
LB_3378:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3354
LB_3355:
	mov r14,QWORD [rsp] 
	jmp LB_3381
LB_3380:
	add r14,1 
LB_3381:
	cmp r14,r9
	jge LB_3382
	JZ_SPC BYTE [r13+8+r14], LB_3380
LB_3382
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3384
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3383
LB_3384:
; .rb_rle 
	add rsp,0
	jmp LB_3379
LB_3383:
	jmp LB_3386
LB_3385:
	add r14,1 
LB_3386:
	cmp r14,r9
	jge LB_3387
	JZ_SPC BYTE [r13+8+r14], LB_3385
LB_3387
	call GRM_369
	cmp BYTE [r8+6],0
	jnz LB_3389
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3388
LB_3389:
; .rb_rle 
	add rsp,8
	jmp LB_3379
LB_3388:
	jmp LB_3391
LB_3390:
	add r14,1 
LB_3391:
	cmp r14,r9
	jge LB_3392
	JZ_SPC BYTE [r13+8+r14], LB_3390
LB_3392
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_3394
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 10'(= a47◂ [ *{ }] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3393
LB_3394:
; .rb_rle 
	add rsp,16
	jmp LB_3379
LB_3393:
	jmp LB_3396
LB_3395:
	add r14,1 
LB_3396:
	cmp r14,r9
	jge LB_3397
	JZ_SPC BYTE [r13+8+r14], LB_3395
LB_3397
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3399
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3399
	cmp BYTE [rdi+1],136
	jnz LB_3399
	cmp BYTE [rdi+2],144
	jnz LB_3399
	add r14,3
	jmp LB_3398
LB_3399:
; .rb_rle 
	add rsp,24
	jmp LB_3379
LB_3398:
	jmp LB_3401
LB_3400:
	add r14,1 
LB_3401:
	cmp r14,r9
	jge LB_3402
	JZ_SPC BYTE [r13+8+r14], LB_3400
LB_3402
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3404
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 11'(= {| l |} )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3403
LB_3404:
; .rb_rle 
	add rsp,24
	jmp LB_3379
LB_3403:
	jmp LB_3406
LB_3405:
	add r14,1 
LB_3406:
	cmp r14,r9
	jge LB_3407
	JZ_SPC BYTE [r13+8+r14], LB_3405
LB_3407
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3409
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_3409
	add r14,1
	jmp LB_3408
LB_3409:
; .rb_rle 
	add rsp,32
	jmp LB_3379
LB_3408:
	jmp LB_3411
LB_3410:
	add r14,1 
LB_3411:
	cmp r14,r9
	jge LB_3412
	JZ_SPC BYTE [r13+8+r14], LB_3410
LB_3412
	call GRM_327
	cmp BYTE [r8+6],0
	jnz LB_3414
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 12'(= a34◂ [ ] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3413
LB_3414:
; .rb_rle 
	add rsp,32
	jmp LB_3379
LB_3413:
	jmp LB_3416
LB_3415:
	add r14,1 
LB_3416:
	cmp r14,r9
	jge LB_3417
	JZ_SPC BYTE [r13+8+r14], LB_3415
LB_3417
	call GRM_372
	cmp BYTE [r8+6],0
	jnz LB_3419
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
; {| 111100001111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3418
LB_3419:
; .rb_rle 
	add rsp,40
	jmp LB_3379
LB_3418:
	jmp LB_3421
LB_3420:
; .rb_rle 
	add rsp,48
	jmp LB_3379
LB_3421:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*6]
;; rsp=6 , %3096~1'(= r ) %3095~0'(= r ) %3094~13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %3093~12'(= a34◂ [ ] ) %3092~11'(= {| l |} ) %3091~10'(= a47◂ [ *{ }] ) %3090~9'(= a2◂ [ {| l |}] ) %3089~8'(= {| l |} ) 
; #25 { { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=6 , %3097~0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %3096~1'(= r ) %3095~0'(= r ) %3091~10'(= a47◂ [ *{ }] ) %3090~9'(= a2◂ [ {| l |}] ) %3089~8'(= {| l |} ) 
; #256 { 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } ⊢ 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } }
;; rsp=6 , %3098~0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } %3096~1'(= r ) %3095~0'(= r ) %3091~10'(= a47◂ [ *{ }] ) %3089~8'(= {| l |} ) 
; #26 { 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } } ⊢ 0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } }
;; rsp=6 , %3099~0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } } %3096~1'(= r ) %3095~0'(= r ) %3091~10'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 6
	add rsp,48
	jmp LB_3422
LB_3422:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3354
LB_3379:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3354:
; discard r14
	add rsp,8
	ret
ETR_369:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_369
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_369:
	push r14
	jmp LB_3426
LB_3425:
	add r14,1 
LB_3426:
	cmp r14,r9
	jge LB_3427
	JZ_SPC BYTE [r13+8+r14], LB_3425
LB_3427
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3429
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3429
	cmp BYTE [rdi+1],151
	jnz LB_3429
	cmp BYTE [rdi+2],130
	jnz LB_3429
	add r14,3
	jmp LB_3428
LB_3429:
; .rb_rle 
	add rsp,0
	jmp LB_3424
LB_3428:
	jmp LB_3431
LB_3430:
	add r14,1 
LB_3431:
	cmp r14,r9
	jge LB_3432
	JZ_SPC BYTE [r13+8+r14], LB_3430
LB_3432
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3434
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3433
LB_3434:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3423
LB_3433:
	jmp LB_3436
LB_3435:
	add r14,1 
LB_3436:
	cmp r14,r9
	jge LB_3437
	JZ_SPC BYTE [r13+8+r14], LB_3435
LB_3437
	call GRM_370
	cmp BYTE [r8+6],0
	jnz LB_3439
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3438
LB_3439:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3423
LB_3438:
	jmp LB_3441
LB_3440:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3423
LB_3441:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3103~1'(= r ) %3102~0'(= r ) %3101~9'(= a2◂ [ {| l |}] ) %3100~8'(= {| l |} ) 
; #25 { 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3104~0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3103~1'(= r ) %3102~0'(= r ) 
; #26 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3105~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3103~1'(= r ) %3102~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3442
LB_3442:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3423
LB_3424:
	mov r14,QWORD [rsp] 
	jmp LB_3445
LB_3444:
	add r14,1 
LB_3445:
	cmp r14,r9
	jge LB_3446
	JZ_SPC BYTE [r13+8+r14], LB_3444
LB_3446
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3448
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3447
LB_3448:
; .rb_rle 
	add rsp,0
	jmp LB_3443
LB_3447:
	jmp LB_3450
LB_3449:
	add r14,1 
LB_3450:
	cmp r14,r9
	jge LB_3451
	JZ_SPC BYTE [r13+8+r14], LB_3449
LB_3451
	call GRM_370
	cmp BYTE [r8+6],0
	jnz LB_3453
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3452
LB_3453:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3423
LB_3452:
	jmp LB_3455
LB_3454:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3423
LB_3455:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3109~1'(= r ) %3108~0'(= r ) %3107~9'(= a2◂ [ {| l |}] ) %3106~8'(= {| l |} ) 
; #25 { 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3110~0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3109~1'(= r ) %3108~0'(= r ) 
; #26 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3111~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3109~1'(= r ) %3108~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3456
LB_3456:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3423
LB_3443:
	mov r14,QWORD [rsp] 
	jmp LB_3459
LB_3458:
; .rb_rle 
	add rsp,0
	jmp LB_3457
LB_3459:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3113~1'(= r ) %3112~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3114~1(<2)◂{ } %3113~1'(= r ) %3112~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3115~0(<2)◂1(<2)◂{ } %3113~1'(= r ) %3112~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3460
LB_3460:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3423
LB_3457:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3423:
; discard r14
	add rsp,8
	ret
ETR_370:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_370
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_370:
	push r14
	jmp LB_3464
LB_3463:
	add r14,1 
LB_3464:
	cmp r14,r9
	jge LB_3465
	JZ_SPC BYTE [r13+8+r14], LB_3463
LB_3465
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3467
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_3467
	add r14,1
	jmp LB_3466
LB_3467:
; .rb_rle 
	add rsp,0
	jmp LB_3462
LB_3466:
	jmp LB_3469
LB_3468:
	add r14,1 
LB_3469:
	cmp r14,r9
	jge LB_3470
	JZ_SPC BYTE [r13+8+r14], LB_3468
LB_3470
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_3472
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3471
LB_3472:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3461
LB_3471:
	jmp LB_3474
LB_3473:
	add r14,1 
LB_3474:
	cmp r14,r9
	jge LB_3475
	JZ_SPC BYTE [r13+8+r14], LB_3473
LB_3475
	call GRM_370
	cmp BYTE [r8+6],0
	jnz LB_3477
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3476
LB_3477:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3461
LB_3476:
	jmp LB_3479
LB_3478:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3461
LB_3479:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3119~1'(= r ) %3118~0'(= r ) %3117~9'(= a2◂ [ {| l |}] ) %3116~8'(= {| l |} ) 
; #25 { 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3120~0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3119~1'(= r ) %3118~0'(= r ) 
; #26 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3121~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3119~1'(= r ) %3118~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3480
LB_3480:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3461
LB_3462:
	mov r14,QWORD [rsp] 
	jmp LB_3483
LB_3482:
; .rb_rle 
	add rsp,0
	jmp LB_3481
LB_3483:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3123~1'(= r ) %3122~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3124~1(<2)◂{ } %3123~1'(= r ) %3122~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3125~0(<2)◂1(<2)◂{ } %3123~1'(= r ) %3122~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3484
LB_3484:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3461
LB_3481:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3461:
; discard r14
	add rsp,8
	ret
ETR_371:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_371
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_371:
	push r14
	jmp LB_3488
LB_3487:
	add r14,1 
LB_3488:
	cmp r14,r9
	jge LB_3489
	JZ_SPC BYTE [r13+8+r14], LB_3487
LB_3489
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_3491
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3490
LB_3491:
; .rb_rle 
	add rsp,0
	jmp LB_3486
LB_3490:
	jmp LB_3493
LB_3492:
	add r14,1 
LB_3493:
	cmp r14,r9
	jge LB_3494
	JZ_SPC BYTE [r13+8+r14], LB_3492
LB_3494
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3496
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_3496
	add r14,1
	jmp LB_3495
LB_3496:
; .rb_rle 
	add rsp,8
	jmp LB_3486
LB_3495:
	jmp LB_3498
LB_3497:
	add r14,1 
LB_3498:
	cmp r14,r9
	jge LB_3499
	JZ_SPC BYTE [r13+8+r14], LB_3497
LB_3499
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3501
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3501
	add r14,1
	jmp LB_3500
LB_3501:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3485
LB_3500:
	jmp LB_3503
LB_3502:
	add r14,1 
LB_3503:
	cmp r14,r9
	jge LB_3504
	JZ_SPC BYTE [r13+8+r14], LB_3502
LB_3504
	call GRM_368
	cmp BYTE [r8+6],0
	jnz LB_3506
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a45◂ [ ]} ) ⊢ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) }
; {| 111100001110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_3505
LB_3506:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3485
LB_3505:
	jmp LB_3508
LB_3507:
	add r14,1 
LB_3508:
	cmp r14,r9
	jge LB_3509
	JZ_SPC BYTE [r13+8+r14], LB_3507
LB_3509
	call GRM_371
	cmp BYTE [r8+6],0
	jnz LB_3511
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) ⊢ 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3510
LB_3511:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3485
LB_3510:
	jmp LB_3513
LB_3512:
; .rb_rle 
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3485
LB_3513:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %3130~1'(= r ) %3129~0'(= r ) %3128~11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) %3127~{ 9'(= {| l |} ) 10'(= a45◂ [ ] ) } %3126~8'(= a47◂ [ *{ }] ) 
; #25 { { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=4 , %3131~0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3130~1'(= r ) %3129~0'(= r ) %3126~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=4 , %3132~0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3130~1'(= r ) %3129~0'(= r ) %3126~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_3514
LB_3514:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3485
LB_3486:
	mov r14,QWORD [rsp] 
	jmp LB_3517
LB_3516:
; .rb_rle 
	add rsp,0
	jmp LB_3515
LB_3517:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3134~1'(= r ) %3133~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3135~1(<2)◂{ } %3134~1'(= r ) %3133~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3136~0(<2)◂1(<2)◂{ } %3134~1'(= r ) %3133~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3518
LB_3518:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3485
LB_3515:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3485:
; discard r14
	add rsp,8
	ret
ETR_372:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_372
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_372:
	push r14
	jmp LB_3522
LB_3521:
	add r14,1 
LB_3522:
	cmp r14,r9
	jge LB_3523
	JZ_SPC BYTE [r13+8+r14], LB_3521
LB_3523
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_3525
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3524
LB_3525:
; .rb_rle 
	add rsp,0
	jmp LB_3520
LB_3524:
	jmp LB_3527
LB_3526:
	add r14,1 
LB_3527:
	cmp r14,r9
	jge LB_3528
	JZ_SPC BYTE [r13+8+r14], LB_3526
LB_3528
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3530
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3530
	cmp BYTE [rdi+1],136
	jnz LB_3530
	cmp BYTE [rdi+2],144
	jnz LB_3530
	add r14,3
	jmp LB_3529
LB_3530:
; .rb_rle 
	add rsp,8
	jmp LB_3520
LB_3529:
	jmp LB_3532
LB_3531:
	add r14,1 
LB_3532:
	cmp r14,r9
	jge LB_3533
	JZ_SPC BYTE [r13+8+r14], LB_3531
LB_3533
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3535
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3534
LB_3535:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3519
LB_3534:
	jmp LB_3537
LB_3536:
	add r14,1 
LB_3537:
	cmp r14,r9
	jge LB_3538
	JZ_SPC BYTE [r13+8+r14], LB_3536
LB_3538
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3540
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_3540
	add r14,1
	jmp LB_3539
LB_3540:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3519
LB_3539:
	jmp LB_3542
LB_3541:
	add r14,1 
LB_3542:
	cmp r14,r9
	jge LB_3543
	JZ_SPC BYTE [r13+8+r14], LB_3541
LB_3543
	call GRM_327
	cmp BYTE [r8+6],0
	jnz LB_3545
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 10'(= a34◂ [ ] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3544
LB_3545:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3519
LB_3544:
	jmp LB_3547
LB_3546:
	add r14,1 
LB_3547:
	cmp r14,r9
	jge LB_3548
	JZ_SPC BYTE [r13+8+r14], LB_3546
LB_3548
	call GRM_372
	cmp BYTE [r8+6],0
	jnz LB_3550
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3549
LB_3550:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3519
LB_3549:
	jmp LB_3552
LB_3551:
; .rb_rle 
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3519
LB_3552:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %3142~1'(= r ) %3141~0'(= r ) %3140~11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %3139~10'(= a34◂ [ ] ) %3138~9'(= {| l |} ) %3137~8'(= a47◂ [ *{ }] ) 
; #25 { { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=4 , %3143~0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %3142~1'(= r ) %3141~0'(= r ) %3137~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=4 , %3144~0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %3142~1'(= r ) %3141~0'(= r ) %3137~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_3553
LB_3553:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3519
LB_3520:
	mov r14,QWORD [rsp] 
	jmp LB_3556
LB_3555:
; .rb_rle 
	add rsp,0
	jmp LB_3554
LB_3556:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3146~1'(= r ) %3145~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3147~1(<2)◂{ } %3146~1'(= r ) %3145~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3148~0(<2)◂1(<2)◂{ } %3146~1'(= r ) %3145~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3557
LB_3557:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3519
LB_3554:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3519:
; discard r14
	add rsp,8
	ret
ETR_373:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_373
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_373:
	push r14
	jmp LB_3561
LB_3560:
	add r14,1 
LB_3561:
	cmp r14,r9
	jge LB_3562
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3560
LB_3562
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_3564
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3563
LB_3564:
; .rb_rle 
	add rsp,0
	jmp LB_3559
LB_3563:
	jmp LB_3566
LB_3565:
	add r14,1 
LB_3566:
	cmp r14,r9
	jge LB_3567
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3565
LB_3567
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3569
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_3569
	add r14,1
	jmp LB_3568
LB_3569:
; .rb_rle 
	add rsp,8
	jmp LB_3559
LB_3568:
	jmp LB_3571
LB_3570:
	add r14,1 
LB_3571:
	cmp r14,r9
	jge LB_3572
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3570
LB_3572
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3574
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3574
	add r14,1
	jmp LB_3573
LB_3574:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3558
LB_3573:
	jmp LB_3576
LB_3575:
	add r14,1 
LB_3576:
	cmp r14,r9
	jge LB_3577
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3575
LB_3577
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3579
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3578
LB_3579:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3558
LB_3578:
	jmp LB_3581
LB_3580:
	add r14,1 
LB_3581:
	cmp r14,r9
	jge LB_3582
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3580
LB_3582
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_3584
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 10'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3583
LB_3584:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3558
LB_3583:
	jmp LB_3586
LB_3585:
	add r14,1 
LB_3586:
	cmp r14,r9
	jge LB_3587
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3585
LB_3587
	call GRM_375
	cmp BYTE [r8+6],0
	jnz LB_3589
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a34◂ [ ]] ) ⊢ 11'(= a3◂ [ a34◂ [ ]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3588
LB_3589:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3558
LB_3588:
	jmp LB_3591
LB_3590:
	add r14,1 
LB_3591:
	cmp r14,r9
	jge LB_3592
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3590
LB_3592
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3594
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3594
	add r14,1
	jmp LB_3593
LB_3594:
; .rb_rle 
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3558
LB_3593:
	jmp LB_3596
LB_3595:
	add r14,1 
LB_3596:
	cmp r14,r9
	jge LB_3597
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3595
LB_3597
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_3599
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3598
LB_3599:
; .rb_rle 
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3558
LB_3598:
	jmp LB_3601
LB_3600:
	add r14,1 
LB_3601:
	cmp r14,r9
	jge LB_3602
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3600
LB_3602
	call GRM_374
	cmp BYTE [r8+6],0
	jnz LB_3604
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3603
LB_3604:
; .rb_rle 
	add rsp,40
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3558
LB_3603:
	jmp LB_3606
LB_3605:
; .rb_rle 
	add rsp,48
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3558
LB_3606:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*6]
;; rsp=6 , %3156~1'(= r ) %3155~0'(= r ) %3154~13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) %3153~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
;; ? 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3609
	jmp LB_3610
LB_3609:
	jmp LB_3608
LB_3610:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=6 , %3158~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3156~1'(= r ) %3155~0'(= r ) %3153~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_3612
	jmp LB_3613
LB_3612:
	jmp LB_3611
LB_3613:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=6 , %3160~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %3158~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3156~1'(= r ) %3155~0'(= r ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
; #25 { { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=6 , %3161~0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3156~1'(= r ) %3155~0'(= r ) %3149~8'(= a47◂ [ *{ }] ) 
; #264 0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=6 , %3162~3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3156~1'(= r ) %3155~0'(= r ) %3149~8'(= a47◂ [ *{ }] ) 
; #309 3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=6 , %3163~0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3156~1'(= r ) %3155~0'(= r ) %3149~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=6 , %3164~0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3156~1'(= r ) %3155~0'(= r ) %3149~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 6
	add rsp,48
	jmp LB_3607
LB_3611:
;; ?. 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=6 , %3159~3'(= a2◂ [ *{ rr{| l |}}] ) %3158~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3156~1'(= r ) %3155~0'(= r ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=6 , %3165~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3158~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3156~1'(= r ) %3155~0'(= r ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=6 , %3166~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3158~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3156~1'(= r ) %3155~0'(= r ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2835
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
	call LB_2873
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1673
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 6
	add rsp,48
	jmp LB_3607
LB_3608:
;; ?. 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=6 , %3157~2'(= a2◂ [ *{ rr{| l |}}] ) %3156~1'(= r ) %3155~0'(= r ) %3153~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_3615
	jmp LB_3616
LB_3615:
	jmp LB_3614
LB_3616:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=6 , %3168~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %3157~2'(= a2◂ [ *{ rr{| l |}}] ) %3156~1'(= r ) %3155~0'(= r ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=6 , %3169~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3168~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %3156~1'(= r ) %3155~0'(= r ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=6 , %3170~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3168~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %3156~1'(= r ) %3155~0'(= r ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_1725
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
	call LB_2873
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1673
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 6
	add rsp,48
	jmp LB_3607
LB_3614:
;; ?. 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=6 , %3167~3'(= a2◂ [ *{ rr{| l |}}] ) %3157~2'(= a2◂ [ *{ rr{| l |}}] ) %3156~1'(= r ) %3155~0'(= r ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 11110000111100110.. |}
	mov r14,r9
	mov r13,r8
; mov_ptn2.
	call LB_1019
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=4 , %3171~2'(= a2◂ [ *{ rr{| l |}}] ) %3156~1'(= r ) %3155~0'(= r ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %3172~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3156~1'(= r ) %3155~0'(= r ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %3173~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3156~1'(= r ) %3155~0'(= r ) %3152~11'(= a3◂ [ a34◂ [ ]] ) %3151~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3150~9'(= {| l |} ) %3149~8'(= a47◂ [ *{ }] ) 
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
	call LB_2873
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1673
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_3607
LB_3607:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3558
LB_3559:
	mov r14,QWORD [rsp] 
	jmp LB_3619
LB_3618:
	add r14,1 
LB_3619:
	cmp r14,r9
	jge LB_3620
	JZ_SPC BYTE [r13+8+r14], LB_3618
LB_3620
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3622
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3621
LB_3622:
; .rb_rle 
	add rsp,0
	jmp LB_3617
LB_3621:
	jmp LB_3624
LB_3623:
	add r14,1 
LB_3624:
	cmp r14,r9
	jge LB_3625
	JZ_SPC BYTE [r13+8+r14], LB_3623
LB_3625
	call GRM_376
	cmp BYTE [r8+6],0
	jnz LB_3627
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a44◂ [ ]] ) ⊢ 9'(= a47◂ [ a44◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3626
LB_3627:
; .rb_rle 
	add rsp,8
	jmp LB_3617
LB_3626:
	jmp LB_3629
LB_3628:
; .rb_rle 
	add rsp,16
	jmp LB_3617
LB_3629:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3177~1'(= r ) %3176~0'(= r ) %3175~9'(= a47◂ [ a44◂ [ ]] ) %3174~8'(= {| l |} ) 
;; ? 9'(= a47◂ [ a44◂ [ ]] ) ⊢ 0(<2)◂2'(= a44◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3632
	jmp LB_3633
LB_3632:
	jmp LB_3631
LB_3633:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3179~2'(= a44◂ [ ] ) %3177~1'(= r ) %3176~0'(= r ) %3174~8'(= {| l |} ) 
; #265 { 8'(= {| l |} ) 2'(= a44◂ [ ] ) } ⊢ 2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) }
;; rsp=2 , %3180~2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } %3177~1'(= r ) %3176~0'(= r ) 
; #309 2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } ⊢ 0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) }
;; rsp=2 , %3181~0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } %3177~1'(= r ) %3176~0'(= r ) 
; #26 0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } ⊢ 0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) }
;; rsp=2 , %3182~0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } %3177~1'(= r ) %3176~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3630
LB_3631:
;; ?. 9'(= a47◂ [ a44◂ [ ]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3178~2'(= a2◂ [ *{ rr{| l |}}] ) %3177~1'(= r ) %3176~0'(= r ) %3174~8'(= {| l |} ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %3183~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3177~1'(= r ) %3176~0'(= r ) %3174~8'(= {| l |} ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %3184~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3177~1'(= r ) %3176~0'(= r ) %3174~8'(= {| l |} ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3630
LB_3630:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3558
LB_3617:
	mov r14,QWORD [rsp]
	jmp LB_3636
LB_3635:
; .rb_rle 
	add rsp,0
	jmp LB_3634
LB_3636:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3186~1'(= r ) %3185~0'(= r ) 
; $ %[ "lc_etr_body 0" ] ⊢ %[ "lc_etr_body 0" ]
;; rsp=0 , %3187~%[ "lc_etr_body 0" ] %3186~1'(= r ) %3185~0'(= r ) 
; #10 %[ "lc_etr_body 0" ] ⊢ %[ "lc_etr_body 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3638
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3639
LB_3639:
;; rsp=0 , %3188~%[ "lc_etr_body 0" ] %3186~1'(= r ) %3185~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3189~1(<2)◂{ } %3188~%[ "lc_etr_body 0" ] %3186~1'(= r ) %3185~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3637
LB_3637:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3558
LB_3634:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3558:
; discard r14
	add rsp,8
	ret
ETR_374:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_374
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_374:
	push r14
	jmp LB_3643
LB_3642:
	add r14,1 
LB_3643:
	cmp r14,r9
	jge LB_3644
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3642
LB_3644
	call GRM_334
	cmp BYTE [r8+6],0
	jnz LB_3646
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3645
LB_3646:
; .rb_rle 
	add rsp,0
	jmp LB_3641
LB_3645:
	jmp LB_3648
LB_3647:
	add r14,1 
LB_3648:
	cmp r14,r9
	jge LB_3649
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3647
LB_3649
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3651
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_3651
	add r14,1
	jmp LB_3650
LB_3651:
; .rb_rle 
	add rsp,8
	jmp LB_3641
LB_3650:
	jmp LB_3653
LB_3652:
	add r14,1 
LB_3653:
	cmp r14,r9
	jge LB_3654
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3652
LB_3654
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3656
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3656
	add r14,1
	jmp LB_3655
LB_3656:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3640
LB_3655:
	jmp LB_3658
LB_3657:
	add r14,1 
LB_3658:
	cmp r14,r9
	jge LB_3659
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3657
LB_3659
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3661
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3660
LB_3661:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3640
LB_3660:
	jmp LB_3663
LB_3662:
	add r14,1 
LB_3663:
	cmp r14,r9
	jge LB_3664
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3662
LB_3664
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_3666
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 10'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3665
LB_3666:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3640
LB_3665:
	jmp LB_3668
LB_3667:
	add r14,1 
LB_3668:
	cmp r14,r9
	jge LB_3669
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3667
LB_3669
	call GRM_375
	cmp BYTE [r8+6],0
	jnz LB_3671
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a34◂ [ ]] ) ⊢ 11'(= a3◂ [ a34◂ [ ]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3670
LB_3671:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3640
LB_3670:
	jmp LB_3673
LB_3672:
	add r14,1 
LB_3673:
	cmp r14,r9
	jge LB_3674
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3672
LB_3674
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3676
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3676
	add r14,1
	jmp LB_3675
LB_3676:
; .rb_rle 
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3640
LB_3675:
	jmp LB_3678
LB_3677:
	add r14,1 
LB_3678:
	cmp r14,r9
	jge LB_3679
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3677
LB_3679
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_3681
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3680
LB_3681:
; .rb_rle 
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3640
LB_3680:
	jmp LB_3683
LB_3682:
	add r14,1 
LB_3683:
	cmp r14,r9
	jge LB_3684
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3682
LB_3684
	call GRM_374
	cmp BYTE [r8+6],0
	jnz LB_3686
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3685
LB_3686:
; .rb_rle 
	add rsp,40
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3640
LB_3685:
	jmp LB_3688
LB_3687:
; .rb_rle 
	add rsp,48
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3640
LB_3688:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*6]
;; rsp=6 , %3197~1'(= r ) %3196~0'(= r ) %3195~13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) %3194~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3193~11'(= a3◂ [ a34◂ [ ]] ) %3192~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3191~9'(= {| l |} ) %3190~8'(= a47◂ [ *{ }] ) 
; #310 { 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ { 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) }
; {| 11000000111111110.. |}
	mov r14,QWORD [rsp-8+8*4]
	mov r13,QWORD [rsp-8+8*3]
; mov_ptn2.
	call LB_3690
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=4 , %3198~2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) %3197~1'(= r ) %3196~0'(= r ) %3193~11'(= a3◂ [ a34◂ [ ]] ) %3192~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3191~9'(= {| l |} ) %3190~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_3701
	jmp LB_3702
LB_3701:
	jmp LB_3700
LB_3702:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=4 , %3201~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %3200~3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3197~1'(= r ) %3196~0'(= r ) %3193~11'(= a3◂ [ a34◂ [ ]] ) %3192~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3191~9'(= {| l |} ) %3190~8'(= a47◂ [ *{ }] ) 
; #25 { { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3202~0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3197~1'(= r ) %3196~0'(= r ) %3190~8'(= a47◂ [ *{ }] ) 
; #309 0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3203~0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3197~1'(= r ) %3196~0'(= r ) %3190~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3204~0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3197~1'(= r ) %3196~0'(= r ) %3190~8'(= a47◂ [ *{ }] ) 
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_3689
LB_3700:
;; ?. 2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %3199~3'(= a2◂ [ *{ rr{| l |}}] ) %3197~1'(= r ) %3196~0'(= r ) %3193~11'(= a3◂ [ a34◂ [ ]] ) %3192~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3191~9'(= {| l |} ) %3190~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %3205~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3197~1'(= r ) %3196~0'(= r ) %3193~11'(= a3◂ [ a34◂ [ ]] ) %3192~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3191~9'(= {| l |} ) %3190~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %3206~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3197~1'(= r ) %3196~0'(= r ) %3193~11'(= a3◂ [ a34◂ [ ]] ) %3192~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3191~9'(= {| l |} ) %3190~8'(= a47◂ [ *{ }] ) 
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
	call LB_2873
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1673
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
	call LB_933
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_3689
LB_3689:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3640
LB_3641:
	mov r14,QWORD [rsp] 
	jmp LB_3705
LB_3704:
; .rb_rle 
	add rsp,0
	jmp LB_3703
LB_3705:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3208~1'(= r ) %3207~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3209~1(<2)◂{ } %3208~1'(= r ) %3207~0'(= r ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3210~0(<2)◂1(<2)◂{ } %3208~1'(= r ) %3207~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %3211~0(<2)◂0(<2)◂1(<2)◂{ } %3208~1'(= r ) %3207~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3706
LB_3706:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3640
LB_3703:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3640:
; discard r14
	add rsp,8
	ret
ETR_375:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_375
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_375:
	push r14
	jmp LB_3710
LB_3709:
	add r14,1 
LB_3710:
	cmp r14,r9
	jge LB_3711
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3709
LB_3711
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3713
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_3713
	add r14,1
	jmp LB_3712
LB_3713:
; .rb_rle 
	add rsp,0
	jmp LB_3708
LB_3712:
	jmp LB_3715
LB_3714:
	add r14,1 
LB_3715:
	cmp r14,r9
	jge LB_3716
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3714
LB_3716
	call GRM_327
	cmp BYTE [r8+6],0
	jnz LB_3718
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3717
LB_3718:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3707
LB_3717:
	jmp LB_3720
LB_3719:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3707
LB_3720:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3214~1'(= r ) %3213~0'(= r ) %3212~8'(= a34◂ [ ] ) 
; #26 8'(= a34◂ [ ] ) ⊢ 0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %3215~0(<2)◂8'(= a34◂ [ ] ) %3214~1'(= r ) %3213~0'(= r ) 
; #26 0(<2)◂8'(= a34◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %3216~0(<2)◂0(<2)◂8'(= a34◂ [ ] ) %3214~1'(= r ) %3213~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3721
LB_3721:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3707
LB_3708:
	mov r14,QWORD [rsp] 
	jmp LB_3724
LB_3723:
; .rb_rle 
	add rsp,0
	jmp LB_3722
LB_3724:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3218~1'(= r ) %3217~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3219~1(<2)◂{ } %3218~1'(= r ) %3217~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3220~0(<2)◂1(<2)◂{ } %3218~1'(= r ) %3217~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3725
LB_3725:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3707
LB_3722:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3707:
; discard r14
	add rsp,8
	ret
ETR_376:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_376
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_376:
	push r14
	jmp LB_3729
LB_3728:
	add r14,1 
LB_3729:
	cmp r14,r9
	jge LB_3730
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3728
LB_3730
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3732
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3732
	add r14,1
	jmp LB_3731
LB_3732:
; .rb_rle 
	add rsp,0
	jmp LB_3727
LB_3731:
	jmp LB_3734
LB_3733:
	add r14,1 
LB_3734:
	cmp r14,r9
	jge LB_3735
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3733
LB_3735
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_3737
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3736
LB_3737:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3726
LB_3736:
	jmp LB_3739
LB_3738:
	add r14,1 
LB_3739:
	cmp r14,r9
	jge LB_3740
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3738
LB_3740
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3742
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3742
	add r14,1
	jmp LB_3741
LB_3742:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3726
LB_3741:
	jmp LB_3744
LB_3743:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3726
LB_3744:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3223~1'(= r ) %3222~0'(= r ) %3221~8'(= a27◂ [ a18◂ [ ]] ) 
; #258 8'(= a27◂ [ a18◂ [ ]] ) ⊢ 1(<3)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %3224~1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) %3223~1'(= r ) %3222~0'(= r ) 
; #309 1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %3225~0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) %3223~1'(= r ) %3222~0'(= r ) 
; #26 0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %3226~0(<2)◂0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) %3223~1'(= r ) %3222~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3745
LB_3745:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3726
LB_3727:
	mov r14,QWORD [rsp] 
	jmp LB_3748
LB_3747:
	add r14,1 
LB_3748:
	cmp r14,r9
	jge LB_3749
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3747
LB_3749
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_3751
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3751
	cmp BYTE [rdi+1],171
	jnz LB_3751
	add r14,2
	jmp LB_3750
LB_3751:
; .rb_rle 
	add rsp,0
	jmp LB_3746
LB_3750:
	jmp LB_3753
LB_3752:
	add r14,1 
LB_3753:
	cmp r14,r9
	jge LB_3754
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3752
LB_3754
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3756
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3756
	add r14,1
	jmp LB_3755
LB_3756:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3726
LB_3755:
	jmp LB_3758
LB_3757:
	add r14,1 
LB_3758:
	cmp r14,r9
	jge LB_3759
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3757
LB_3759
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_3761
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3760
LB_3761:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3726
LB_3760:
	jmp LB_3763
LB_3762:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3726
LB_3763:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3229~1'(= r ) %3228~0'(= r ) %3227~8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3766
	jmp LB_3767
LB_3766:
	jmp LB_3765
LB_3767:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %3231~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3229~1'(= r ) %3228~0'(= r ) 
; #257 2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3232~2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3229~1'(= r ) %3228~0'(= r ) 
; #309 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3233~0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3229~1'(= r ) %3228~0'(= r ) 
; #26 0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3234~0(<2)◂0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3229~1'(= r ) %3228~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3764
LB_3765:
;; ?. 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %3230~2'(= a2◂ [ *{ rr{| l |}}] ) %3229~1'(= r ) %3228~0'(= r ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %3235~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3229~1'(= r ) %3228~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %3236~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3229~1'(= r ) %3228~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3764
LB_3764:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3726
LB_3746:
	mov r14,QWORD [rsp] 
	jmp LB_3770
LB_3769:
	add r14,1 
LB_3770:
	cmp r14,r9
	jge LB_3771
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3769
LB_3771
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_3773
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3772
LB_3773:
; .rb_rle 
	add rsp,0
	jmp LB_3768
LB_3772:
	jmp LB_3775
LB_3774:
	add r14,1 
LB_3775:
	cmp r14,r9
	jge LB_3776
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3774
LB_3776
	call GRM_375
	cmp BYTE [r8+6],0
	jnz LB_3778
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a34◂ [ ]] ) ⊢ 9'(= a3◂ [ a34◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3777
LB_3778:
; .rb_rle 
	add rsp,8
	jmp LB_3768
LB_3777:
	jmp LB_3780
LB_3779:
	add r14,1 
LB_3780:
	cmp r14,r9
	jge LB_3781
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3779
LB_3781
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3783
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3783
	add r14,1
	jmp LB_3782
LB_3783:
; .rb_rle 
	add rsp,16
	jmp LB_3768
LB_3782:
	jmp LB_3785
LB_3784:
	add r14,1 
LB_3785:
	cmp r14,r9
	jge LB_3786
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3784
LB_3786
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_3788
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3787
LB_3788:
; .rb_rle 
	add rsp,16
	jmp LB_3768
LB_3787:
	jmp LB_3790
LB_3789:
; .rb_rle 
	add rsp,24
	jmp LB_3768
LB_3790:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %3241~1'(= r ) %3240~0'(= r ) %3239~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3238~9'(= a3◂ [ a34◂ [ ]] ) %3237~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3793
	jmp LB_3794
LB_3793:
	jmp LB_3792
LB_3794:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %3243~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3241~1'(= r ) %3240~0'(= r ) %3238~9'(= a3◂ [ a34◂ [ ]] ) %3237~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #259 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %3244~0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %3241~1'(= r ) %3240~0'(= r ) 
; #309 0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %3245~0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %3241~1'(= r ) %3240~0'(= r ) 
; #26 0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %3246~0(<2)◂0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %3241~1'(= r ) %3240~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_3791
LB_3792:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %3242~2'(= a2◂ [ *{ rr{| l |}}] ) %3241~1'(= r ) %3240~0'(= r ) %3238~9'(= a3◂ [ a34◂ [ ]] ) %3237~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %3247~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3241~1'(= r ) %3240~0'(= r ) %3238~9'(= a3◂ [ a34◂ [ ]] ) %3237~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %3248~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3241~1'(= r ) %3240~0'(= r ) %3238~9'(= a3◂ [ a34◂ [ ]] ) %3237~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	call LB_2873
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1673
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_3791
LB_3791:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3726
LB_3768:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3726:
; discard r14
	add rsp,8
	ret
ETR_377:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_377
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_377:
	push r14
	jmp LB_3798
LB_3797:
	add r14,1 
LB_3798:
	cmp r14,r9
	jge LB_3799
	JZ_SPC BYTE [r13+8+r14], LB_3797
LB_3799
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3801
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_3801
	add r14,1
	jmp LB_3800
LB_3801:
; .rb_rle 
	add rsp,0
	jmp LB_3796
LB_3800:
	jmp LB_3803
LB_3802:
	add r14,1 
LB_3803:
	cmp r14,r9
	jge LB_3804
	JZ_SPC BYTE [r13+8+r14], LB_3802
LB_3804
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3806
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3806
	add r14,1
	jmp LB_3805
LB_3806:
; .rb_rle 
	add rsp,0
	jmp LB_3796
LB_3805:
	jmp LB_3808
LB_3807:
	add r14,1 
LB_3808:
	cmp r14,r9
	jge LB_3809
	JZ_SPC BYTE [r13+8+r14], LB_3807
LB_3809
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3811
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3810
LB_3811:
; .rb_rle 
	add rsp,0
	jmp LB_3796
LB_3810:
	jmp LB_3813
LB_3812:
	add r14,1 
LB_3813:
	cmp r14,r9
	jge LB_3814
	JZ_SPC BYTE [r13+8+r14], LB_3812
LB_3814
	call GRM_379
	cmp BYTE [r8+6],0
	jnz LB_3816
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a35◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a35◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3815
LB_3816:
; .rb_rle 
	add rsp,8
	jmp LB_3796
LB_3815:
	jmp LB_3818
LB_3817:
; .rb_rle 
	add rsp,16
	jmp LB_3796
LB_3818:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3252~1'(= r ) %3251~0'(= r ) %3250~9'(= a35◂ [ a18◂ [ ]{| l |}] ) %3249~8'(= {| l |} ) 
; #26 { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %3253~0(<2)◂{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } %3252~1'(= r ) %3251~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3819
LB_3819:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3795
LB_3796:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3795:
; discard r14
	add rsp,8
	ret
ETR_378:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_378
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_378:
	push r14
	call GRM_377
	cmp BYTE [r8+6],0
	jnz LB_3823
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]} ) ⊢ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) }
; {| 11110000110.. |}
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r10, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r10
	mov rdi,r8
	FREE_RCD 2,rdi
; mov_ptn2.
	jmp LB_3822
LB_3823:
; .rb_rle 
	add rsp,0
	jmp LB_3821
LB_3822:
	call GRM_378
	cmp BYTE [r8+6],0
	jnz LB_3825
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3824
LB_3825:
; .rb_rle 
	add rsp,16
	jmp LB_3821
LB_3824:
	jmp LB_3827
LB_3826:
; .rb_rle 
	add rsp,24
	jmp LB_3821
LB_3827:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %3257~1'(= r ) %3256~0'(= r ) %3255~10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) %3254~{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 
; #25 { { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %3258~0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %3257~1'(= r ) %3256~0'(= r ) 
; #26 0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %3259~0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %3257~1'(= r ) %3256~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 3
	add rsp,24
	jmp LB_3828
LB_3828:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3820
LB_3821:
	mov r14,QWORD [rsp]
	jmp LB_3831
LB_3830:
; .rb_rle 
	add rsp,0
	jmp LB_3829
LB_3831:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3261~1'(= r ) %3260~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3262~1(<2)◂{ } %3261~1'(= r ) %3260~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3263~0(<2)◂1(<2)◂{ } %3261~1'(= r ) %3260~0'(= r ) 
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
; mov_ptn2.
	jmp LB_3832
LB_3832:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3820
LB_3829:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3820:
; discard r14
	add rsp,8
	ret
ETR_379:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_379
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_379:
	push r14
	jmp LB_3836
LB_3835:
	add r14,1 
LB_3836:
	cmp r14,r9
	jge LB_3837
	JZ_SPC BYTE [r13+8+r14], LB_3835
LB_3837
	call GRM_380
	cmp BYTE [r8+6],0
	jnz LB_3839
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a37◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3838
LB_3839:
; .rb_rle 
	add rsp,0
	jmp LB_3834
LB_3838:
	jmp LB_3841
LB_3840:
; .rb_rle 
	add rsp,8
	jmp LB_3834
LB_3841:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3266~1'(= r ) %3265~0'(= r ) %3264~8'(= a37◂ [ a18◂ [ ]{| l |}] ) 
; #244 8'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3267~1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] ) %3266~1'(= r ) %3265~0'(= r ) 
; #26 1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3268~0(<2)◂1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] ) %3266~1'(= r ) %3265~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3842
LB_3842:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3833
LB_3834:
	mov r14,QWORD [rsp]
	jmp LB_3845
LB_3844:
	add r14,1 
LB_3845:
	cmp r14,r9
	jge LB_3846
	JZ_SPC BYTE [r13+8+r14], LB_3844
LB_3846
	call GRM_388
	cmp BYTE [r8+6],0
	jnz LB_3848
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a36◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3847
LB_3848:
; .rb_rle 
	add rsp,0
	jmp LB_3843
LB_3847:
	jmp LB_3850
LB_3849:
; .rb_rle 
	add rsp,8
	jmp LB_3843
LB_3850:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3271~1'(= r ) %3270~0'(= r ) %3269~8'(= a36◂ [ a18◂ [ ]{| l |}] ) 
; #245 8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3272~0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) %3271~1'(= r ) %3270~0'(= r ) 
; #26 0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3273~0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) %3271~1'(= r ) %3270~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3851
LB_3851:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3833
LB_3843:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3833:
; discard r14
	add rsp,8
	ret
ETR_380:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_380
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_380:
	push r14
	jmp LB_3855
LB_3854:
	add r14,1 
LB_3855:
	cmp r14,r9
	jge LB_3856
	JZ_SPC BYTE [r13+8+r14], LB_3854
LB_3856
	call GRM_387
	cmp BYTE [r8+6],0
	jnz LB_3858
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a38◂ [ ] ) ⊢ 8'(= a38◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3857
LB_3858:
; .rb_rle 
	add rsp,0
	jmp LB_3853
LB_3857:
	jmp LB_3860
LB_3859:
	add r14,1 
LB_3860:
	cmp r14,r9
	jge LB_3861
	JZ_SPC BYTE [r13+8+r14], LB_3859
LB_3861
	call GRM_382
	cmp BYTE [r8+6],0
	jnz LB_3863
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 9'(= a39◂ [ a18◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3862
LB_3863:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3852
LB_3862:
	jmp LB_3865
LB_3864:
	add r14,1 
LB_3865:
	cmp r14,r9
	jge LB_3866
	JZ_SPC BYTE [r13+8+r14], LB_3864
LB_3866
	call GRM_381
	cmp BYTE [r8+6],0
	jnz LB_3868
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
; mov_ptn2.
	jmp LB_3867
LB_3868:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3852
LB_3867:
	jmp LB_3870
LB_3869:
; .rb_rle 
	add rsp,40
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3852
LB_3870:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*5]
;; rsp=5 , %3280~1'(= r ) %3279~0'(= r ) %3278~12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) %3277~11'(= a28◂ [ a18◂ [ ]{| l |}] ) %3276~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3275~9'(= a39◂ [ a18◂ [ ]] ) %3274~8'(= a38◂ [ ] ) 
; #254 { } ⊢ 2'(= a2◂ [ a25◂ [ {| l |}]] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { } ⊢ { }
; {| 0000000011111110.. |}
; mov_ptn2.
	call LB_3872
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=5 , %3281~2'(= a2◂ [ a25◂ [ {| l |}]] ) %3280~1'(= r ) %3279~0'(= r ) %3278~12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) %3277~11'(= a28◂ [ a18◂ [ ]{| l |}] ) %3276~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3275~9'(= a39◂ [ a18◂ [ ]] ) %3274~8'(= a38◂ [ ] ) 
; #240 { 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=5 , %3282~1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } %3280~1'(= r ) %3279~0'(= r ) 
; #26 1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=5 , %3283~0(<2)◂1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } %3280~1'(= r ) %3279~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 5
	add rsp,40
	jmp LB_3871
LB_3871:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3852
LB_3853:
	mov r14,QWORD [rsp] 
	jmp LB_3875
LB_3874:
	add r14,1 
LB_3875:
	cmp r14,r9
	jge LB_3876
	JZ_SPC BYTE [r13+8+r14], LB_3874
LB_3876
	call GRM_386
	cmp BYTE [r8+6],0
	jnz LB_3878
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a38◂ [ ] ) ⊢ 8'(= a38◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3877
LB_3878:
; .rb_rle 
	add rsp,0
	jmp LB_3873
LB_3877:
	jmp LB_3880
LB_3879:
	add r14,1 
LB_3880:
	cmp r14,r9
	jge LB_3881
	JZ_SPC BYTE [r13+8+r14], LB_3879
LB_3881
	call GRM_382
	cmp BYTE [r8+6],0
	jnz LB_3883
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 9'(= a39◂ [ a18◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3882
LB_3883:
; .rb_rle 
	add rsp,8
	jmp LB_3873
LB_3882:
	jmp LB_3885
LB_3884:
	add r14,1 
LB_3885:
	cmp r14,r9
	jge LB_3886
	JZ_SPC BYTE [r13+8+r14], LB_3884
LB_3886
	call GRM_381
	cmp BYTE [r8+6],0
	jnz LB_3888
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
; mov_ptn2.
	jmp LB_3887
LB_3888:
; .rb_rle 
	add rsp,16
	jmp LB_3873
LB_3887:
	jmp LB_3890
LB_3889:
	add r14,1 
LB_3890:
	cmp r14,r9
	jge LB_3891
	JZ_SPC BYTE [r13+8+r14], LB_3889
LB_3891
	call GRM_380
	cmp BYTE [r8+6],0
	jnz LB_3893
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 13'(= a37◂ [ a18◂ [ ]{| l |}] )
; {| 111100001111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3892
LB_3893:
; .rb_rle 
	add rsp,40
	jmp LB_3873
LB_3892:
	jmp LB_3895
LB_3894:
; .rb_rle 
	add rsp,48
	jmp LB_3873
LB_3895:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*6]
;; rsp=6 , %3291~1'(= r ) %3290~0'(= r ) %3289~13'(= a37◂ [ a18◂ [ ]{| l |}] ) %3288~12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) %3287~11'(= a28◂ [ a18◂ [ ]{| l |}] ) %3286~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3285~9'(= a39◂ [ a18◂ [ ]] ) %3284~8'(= a38◂ [ ] ) 
; #254 { } ⊢ 2'(= a2◂ [ a25◂ [ {| l |}]] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { } ⊢ { }
; {| 00000000111111110.. |}
; mov_ptn2.
	call LB_3872
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=6 , %3292~2'(= a2◂ [ a25◂ [ {| l |}]] ) %3291~1'(= r ) %3290~0'(= r ) %3289~13'(= a37◂ [ a18◂ [ ]{| l |}] ) %3288~12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) %3287~11'(= a28◂ [ a18◂ [ ]{| l |}] ) %3286~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3285~9'(= a39◂ [ a18◂ [ ]] ) %3284~8'(= a38◂ [ ] ) 
; #241 { 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=6 , %3293~0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } %3291~1'(= r ) %3290~0'(= r ) 
; #26 0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=6 , %3294~0(<2)◂0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } %3291~1'(= r ) %3290~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 6
	add rsp,48
	jmp LB_3896
LB_3896:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3852
LB_3873:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3852:
; discard r14
	add rsp,8
	ret
ETR_381:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_381
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_381:
	push r14
	jmp LB_3900
LB_3899:
	add r14,1 
LB_3900:
	cmp r14,r9
	jge LB_3901
	JZ_SPC BYTE [r13+8+r14], LB_3899
LB_3901
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3903
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_3903
	add r14,1
	jmp LB_3902
LB_3903:
; .rb_rle 
	add rsp,0
	jmp LB_3898
LB_3902:
	jmp LB_3905
LB_3904:
	add r14,1 
LB_3905:
	cmp r14,r9
	jge LB_3906
	JZ_SPC BYTE [r13+8+r14], LB_3904
LB_3906
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3908
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3908
	cmp BYTE [rdi+1],138
	jnz LB_3908
	cmp BYTE [rdi+2],162
	jnz LB_3908
	add r14,3
	jmp LB_3907
LB_3908:
; .rb_rle 
	add rsp,0
	jmp LB_3898
LB_3907:
	jmp LB_3910
LB_3909:
	add r14,1 
LB_3910:
	cmp r14,r9
	jge LB_3911
	JZ_SPC BYTE [r13+8+r14], LB_3909
LB_3911
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_3913
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3912
LB_3913:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3897
LB_3912:
	jmp LB_3915
LB_3914:
	add r14,1 
LB_3915:
	cmp r14,r9
	jge LB_3916
	JZ_SPC BYTE [r13+8+r14], LB_3914
LB_3916
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3918
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_3918
	add r14,1
	jmp LB_3917
LB_3918:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3897
LB_3917:
	jmp LB_3920
LB_3919:
	add r14,1 
LB_3920:
	cmp r14,r9
	jge LB_3921
	JZ_SPC BYTE [r13+8+r14], LB_3919
LB_3921
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_3923
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 9'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3922
LB_3923:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3897
LB_3922:
	jmp LB_3925
LB_3924:
	add r14,1 
LB_3925:
	cmp r14,r9
	jge LB_3926
	JZ_SPC BYTE [r13+8+r14], LB_3924
LB_3926
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_3928
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3927
LB_3928:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3897
LB_3927:
	jmp LB_3930
LB_3929:
	add r14,1 
LB_3930:
	cmp r14,r9
	jge LB_3931
	JZ_SPC BYTE [r13+8+r14], LB_3929
LB_3931
	call GRM_380
	cmp BYTE [r8+6],0
	jnz LB_3933
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 11'(= a37◂ [ a18◂ [ ]{| l |}] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3932
LB_3933:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3897
LB_3932:
	jmp LB_3935
LB_3934:
; .rb_rle 
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3897
LB_3935:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %3300~1'(= r ) %3299~0'(= r ) %3298~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3297~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3296~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3295~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_3938
	jmp LB_3939
LB_3938:
	jmp LB_3937
LB_3939:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %3302~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3300~1'(= r ) %3299~0'(= r ) %3298~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3296~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3295~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=4 , %3303~0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } %3302~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3300~1'(= r ) %3299~0'(= r ) %3295~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } }
;; rsp=4 , %3304~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } } %3300~1'(= r ) %3299~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_3936
LB_3937:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %3301~2'(= a2◂ [ *{ rr{| l |}}] ) %3300~1'(= r ) %3299~0'(= r ) %3298~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3296~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3295~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; $ %[ "grm_etr_act_act 0" ] ⊢ %[ "grm_etr_act_act 0" ]
;; rsp=4 , %3305~%[ "grm_etr_act_act 0" ] %3301~2'(= a2◂ [ *{ rr{| l |}}] ) %3300~1'(= r ) %3299~0'(= r ) %3298~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3296~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3295~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #10 %[ "grm_etr_act_act 0" ] ⊢ %[ "grm_etr_act_act 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3940
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3941
LB_3941:
;; rsp=4 , %3306~%[ "grm_etr_act_act 0" ] %3301~2'(= a2◂ [ *{ rr{| l |}}] ) %3300~1'(= r ) %3299~0'(= r ) %3298~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3296~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3295~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	jmp LB_3942
LB_3942:
;; rsp=4 , %3307~{ 0'(= r ) 1'(= r ) } %3306~%[ "grm_etr_act_act 0" ] %3301~2'(= a2◂ [ *{ rr{| l |}}] ) %3298~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3296~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3295~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
	mov rdi,LB_3943
	call emt_stg 
	jmp err
LB_3936:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3897
LB_3898:
	mov r14,QWORD [rsp] 
	jmp LB_3946
LB_3945:
	add r14,1 
LB_3946:
	cmp r14,r9
	jge LB_3947
	JZ_SPC BYTE [r13+8+r14], LB_3945
LB_3947
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3949
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3949
	cmp BYTE [rdi+1],138
	jnz LB_3949
	cmp BYTE [rdi+2],162
	jnz LB_3949
	add r14,3
	jmp LB_3948
LB_3949:
; .rb_rle 
	add rsp,0
	jmp LB_3944
LB_3948:
	jmp LB_3951
LB_3950:
	add r14,1 
LB_3951:
	cmp r14,r9
	jge LB_3952
	JZ_SPC BYTE [r13+8+r14], LB_3950
LB_3952
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_3954
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3953
LB_3954:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3897
LB_3953:
	jmp LB_3956
LB_3955:
	add r14,1 
LB_3956:
	cmp r14,r9
	jge LB_3957
	JZ_SPC BYTE [r13+8+r14], LB_3955
LB_3957
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_3959
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3958
LB_3959:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3897
LB_3958:
	jmp LB_3961
LB_3960:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3897
LB_3961:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3311~1'(= r ) %3310~0'(= r ) %3309~9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3308~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3964
	jmp LB_3965
LB_3964:
	jmp LB_3963
LB_3965:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3313~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3311~1'(= r ) %3310~0'(= r ) %3308~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %3314~1(<2)◂{ } %3313~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3311~1'(= r ) %3310~0'(= r ) %3308~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 1(<2)◂{ } }
;; rsp=2 , %3315~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 1(<2)◂{ } } %3311~1'(= r ) %3310~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3962
LB_3963:
;; ?. 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3312~2'(= a2◂ [ *{ rr{| l |}}] ) %3311~1'(= r ) %3310~0'(= r ) %3308~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; $ %[ "grm_etr_act_act 1" ] ⊢ %[ "grm_etr_act_act 1" ]
;; rsp=2 , %3316~%[ "grm_etr_act_act 1" ] %3312~2'(= a2◂ [ *{ rr{| l |}}] ) %3311~1'(= r ) %3310~0'(= r ) %3308~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #10 %[ "grm_etr_act_act 1" ] ⊢ %[ "grm_etr_act_act 1" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3966
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3967
LB_3967:
;; rsp=2 , %3317~%[ "grm_etr_act_act 1" ] %3312~2'(= a2◂ [ *{ rr{| l |}}] ) %3311~1'(= r ) %3310~0'(= r ) %3308~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	jmp LB_3968
LB_3968:
;; rsp=2 , %3318~{ 0'(= r ) 1'(= r ) } %3317~%[ "grm_etr_act_act 1" ] %3312~2'(= a2◂ [ *{ rr{| l |}}] ) %3308~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
	mov rdi,LB_3969
	call emt_stg 
	jmp err
LB_3962:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3897
LB_3944:
	mov r14,QWORD [rsp] 
	mov r8,unt_1
LB_3897:
; discard r14
	add rsp,8
	ret
ETR_382:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_382
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_382:
	push r14
	jmp LB_3973
LB_3972:
	add r14,1 
LB_3973:
	cmp r14,r9
	jge LB_3974
	JZ_SPC BYTE [r13+8+r14], LB_3972
LB_3974
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_3976
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],33
	jnz LB_3976
	cmp BYTE [rdi+1],124
	jnz LB_3976
	add r14,2
	jmp LB_3975
LB_3976:
; .rb_rle 
	add rsp,0
	jmp LB_3971
LB_3975:
	jmp LB_3978
LB_3977:
	add r14,1 
LB_3978:
	cmp r14,r9
	jge LB_3979
	JZ_SPC BYTE [r13+8+r14], LB_3977
LB_3979
	call GRM_383
	cmp BYTE [r8+6],0
	jnz LB_3981
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 8'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3980
LB_3981:
; .rb_rle 
	add rsp,0
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3970
LB_3980:
	jmp LB_3983
LB_3982:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3970
LB_3983:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3321~1'(= r ) %3320~0'(= r ) %3319~8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) 
; #236 8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
;; rsp=1 , %3322~0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) %3321~1'(= r ) %3320~0'(= r ) 
; #26 0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 0(<2)◂0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
;; rsp=1 , %3323~0(<2)◂0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) %3321~1'(= r ) %3320~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_3984
LB_3984:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3970
LB_3971:
	mov r14,QWORD [rsp] 
	jmp LB_3987
LB_3986:
	add r14,1 
LB_3987:
	cmp r14,r9
	jge LB_3988
	JZ_SPC BYTE [r13+8+r14], LB_3986
LB_3988
	call GRM_384
	cmp BYTE [r8+6],0
	jnz LB_3990
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a40◂ [ a18◂ [ ]] ) ⊢ 8'(= a40◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3989
LB_3990:
; .rb_rle 
	add rsp,0
	jmp LB_3985
LB_3989:
	jmp LB_3992
LB_3991:
	add r14,1 
LB_3992:
	cmp r14,r9
	jge LB_3993
	JZ_SPC BYTE [r13+8+r14], LB_3991
LB_3993
	call GRM_382
	cmp BYTE [r8+6],0
	jnz LB_3995
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 9'(= a39◂ [ a18◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3994
LB_3995:
; .rb_rle 
	add rsp,8
	jmp LB_3985
LB_3994:
	jmp LB_3997
LB_3996:
; .rb_rle 
	add rsp,16
	jmp LB_3985
LB_3997:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3327~1'(= r ) %3326~0'(= r ) %3325~9'(= a39◂ [ a18◂ [ ]] ) %3324~8'(= a40◂ [ a18◂ [ ]] ) 
; #235 { 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } ⊢ 1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) }
;; rsp=2 , %3328~1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } %3327~1'(= r ) %3326~0'(= r ) 
; #26 1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } ⊢ 0(<2)◂1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) }
;; rsp=2 , %3329~0(<2)◂1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } %3327~1'(= r ) %3326~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_3998
LB_3998:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3970
LB_3985:
	mov r14,QWORD [rsp]
	jmp LB_4001
LB_4000:
; .rb_rle 
	add rsp,0
	jmp LB_3999
LB_4001:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3331~1'(= r ) %3330~0'(= r ) 
; #234 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %3332~2(<3)◂{ } %3331~1'(= r ) %3330~0'(= r ) 
; #26 2(<3)◂{ } ⊢ 0(<2)◂2(<3)◂{ }
;; rsp=0 , %3333~0(<2)◂2(<3)◂{ } %3331~1'(= r ) %3330~0'(= r ) 
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
; mov_ptn2.
	jmp LB_4002
LB_4002:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3970
LB_3999:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3970:
; discard r14
	add rsp,8
	ret
ETR_383:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_383
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_383:
	push r14
	jmp LB_4006
LB_4005:
	add r14,1 
LB_4006:
	cmp r14,r9
	jge LB_4007
	JZ_SPC BYTE [r13+8+r14], LB_4005
LB_4007
	call GRM_384
	cmp BYTE [r8+6],0
	jnz LB_4009
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a40◂ [ a18◂ [ ]] ) ⊢ 8'(= a40◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4008
LB_4009:
; .rb_rle 
	add rsp,0
	jmp LB_4004
LB_4008:
	jmp LB_4011
LB_4010:
	add r14,1 
LB_4011:
	cmp r14,r9
	jge LB_4012
	JZ_SPC BYTE [r13+8+r14], LB_4010
LB_4012
	call GRM_383
	cmp BYTE [r8+6],0
	jnz LB_4014
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4013
LB_4014:
; .rb_rle 
	add rsp,8
	jmp LB_4004
LB_4013:
	jmp LB_4016
LB_4015:
; .rb_rle 
	add rsp,16
	jmp LB_4004
LB_4016:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3337~1'(= r ) %3336~0'(= r ) %3335~9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) %3334~8'(= a40◂ [ a18◂ [ ]] ) 
; #25 { 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } ⊢ 0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) }
;; rsp=2 , %3338~0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } %3337~1'(= r ) %3336~0'(= r ) 
; #26 0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) }
;; rsp=2 , %3339~0(<2)◂0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } %3337~1'(= r ) %3336~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 2
	add rsp,16
	jmp LB_4017
LB_4017:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4003
LB_4004:
	mov r14,QWORD [rsp]
	jmp LB_4020
LB_4019:
; .rb_rle 
	add rsp,0
	jmp LB_4018
LB_4020:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3341~1'(= r ) %3340~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3342~1(<2)◂{ } %3341~1'(= r ) %3340~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3343~0(<2)◂1(<2)◂{ } %3341~1'(= r ) %3340~0'(= r ) 
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
; mov_ptn2.
	jmp LB_4021
LB_4021:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4003
LB_4018:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4003:
; discard r14
	add rsp,8
	ret
ETR_384:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_384
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_384:
	push r14
	jmp LB_4025
LB_4024:
	add r14,1 
LB_4025:
	cmp r14,r9
	jge LB_4026
	JZ_SPC BYTE [r13+8+r14], LB_4024
LB_4026
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4028
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4028
	cmp BYTE [rdi+1],159
	jnz LB_4028
	cmp BYTE [rdi+2],166
	jnz LB_4028
	add r14,3
	jmp LB_4027
LB_4028:
; .rb_rle 
	add rsp,0
	jmp LB_4023
LB_4027:
	jmp LB_4030
LB_4029:
	add r14,1 
LB_4030:
	cmp r14,r9
	jge LB_4031
	JZ_SPC BYTE [r13+8+r14], LB_4029
LB_4031
	call GRM_385
	cmp BYTE [r8+6],0
	jnz LB_4033
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a41◂ [ a18◂ [ ]] ) ⊢ 8'(= a41◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4032
LB_4033:
; .rb_rle 
	add rsp,0
	jmp LB_4023
LB_4032:
	jmp LB_4035
LB_4034:
	add r14,1 
LB_4035:
	cmp r14,r9
	jge LB_4036
	JZ_SPC BYTE [r13+8+r14], LB_4034
LB_4036
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4038
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4038
	cmp BYTE [rdi+1],159
	jnz LB_4038
	cmp BYTE [rdi+2],167
	jnz LB_4038
	add r14,3
	jmp LB_4037
LB_4038:
; .rb_rle 
	add rsp,8
	jmp LB_4023
LB_4037:
	jmp LB_4040
LB_4039:
; .rb_rle 
	add rsp,8
	jmp LB_4023
LB_4040:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3346~1'(= r ) %3345~0'(= r ) %3344~8'(= a41◂ [ a18◂ [ ]] ) 
; #233 8'(= a41◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂8'(= a41◂ [ a18◂ [ ]] )
;; rsp=1 , %3347~0(<2)◂8'(= a41◂ [ a18◂ [ ]] ) %3346~1'(= r ) %3345~0'(= r ) 
; #26 0(<2)◂8'(= a41◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a41◂ [ a18◂ [ ]] )
;; rsp=1 , %3348~0(<2)◂0(<2)◂8'(= a41◂ [ a18◂ [ ]] ) %3346~1'(= r ) %3345~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_4041
LB_4041:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4022
LB_4023:
	mov r14,QWORD [rsp]
	jmp LB_4044
LB_4043:
	add r14,1 
LB_4044:
	cmp r14,r9
	jge LB_4045
	JZ_SPC BYTE [r13+8+r14], LB_4043
LB_4045
	call GRM_385
	cmp BYTE [r8+6],0
	jnz LB_4047
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a41◂ [ a18◂ [ ]] ) ⊢ 8'(= a41◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4046
LB_4047:
; .rb_rle 
	add rsp,0
	jmp LB_4042
LB_4046:
	jmp LB_4049
LB_4048:
; .rb_rle 
	add rsp,8
	jmp LB_4042
LB_4049:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3351~1'(= r ) %3350~0'(= r ) %3349~8'(= a41◂ [ a18◂ [ ]] ) 
; #232 8'(= a41◂ [ a18◂ [ ]] ) ⊢ 1(<2)◂8'(= a41◂ [ a18◂ [ ]] )
;; rsp=1 , %3352~1(<2)◂8'(= a41◂ [ a18◂ [ ]] ) %3351~1'(= r ) %3350~0'(= r ) 
; #26 1(<2)◂8'(= a41◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂1(<2)◂8'(= a41◂ [ a18◂ [ ]] )
;; rsp=1 , %3353~0(<2)◂1(<2)◂8'(= a41◂ [ a18◂ [ ]] ) %3351~1'(= r ) %3350~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_4050
LB_4050:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4022
LB_4042:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4022:
; discard r14
	add rsp,8
	ret
ETR_385:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_385
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_385:
	push r14
	jmp LB_4054
LB_4053:
	add r14,1 
LB_4054:
	cmp r14,r9
	jge LB_4055
	JZ_SPC BYTE [r13+8+r14], LB_4053
LB_4055
	call GRM_101
	cmp BYTE [r8+6],0
	jnz LB_4057
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4056
LB_4057:
; .rb_rle 
	add rsp,0
	jmp LB_4052
LB_4056:
	jmp LB_4059
LB_4058:
; .rb_rle 
	add rsp,8
	jmp LB_4052
LB_4059:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3356~1'(= r ) %3355~0'(= r ) %3354~8'(= {| l |} ) 
; #230 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %3357~1(<2)◂8'(= {| l |} ) %3356~1'(= r ) %3355~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %3358~0(<2)◂1(<2)◂8'(= {| l |} ) %3356~1'(= r ) %3355~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_4060
LB_4060:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4051
LB_4052:
	mov r14,QWORD [rsp]
	jmp LB_4063
LB_4062:
	add r14,1 
LB_4063:
	cmp r14,r9
	jge LB_4064
	JZ_SPC BYTE [r13+8+r14], LB_4062
LB_4064
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_4066
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4065
LB_4066:
; .rb_rle 
	add rsp,0
	jmp LB_4061
LB_4065:
	jmp LB_4068
LB_4067:
; .rb_rle 
	add rsp,8
	jmp LB_4061
LB_4068:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3361~1'(= r ) %3360~0'(= r ) %3359~8'(= a18◂ [ ] ) 
; #231 8'(= a18◂ [ ] ) ⊢ 0(<2)◂8'(= a18◂ [ ] )
;; rsp=1 , %3362~0(<2)◂8'(= a18◂ [ ] ) %3361~1'(= r ) %3360~0'(= r ) 
; #26 0(<2)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a18◂ [ ] )
;; rsp=1 , %3363~0(<2)◂0(<2)◂8'(= a18◂ [ ] ) %3361~1'(= r ) %3360~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_4069
LB_4069:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4051
LB_4061:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4051:
; discard r14
	add rsp,8
	ret
ETR_386:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_386
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_386:
	push r14
	jmp LB_4073
LB_4072:
	add r14,1 
LB_4073:
	cmp r14,r9
	jge LB_4074
	JZ_SPC BYTE [r13+8+r14], LB_4072
LB_4074
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_4076
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4076
	cmp BYTE [rdi+1],136
	jnz LB_4076
	cmp BYTE [rdi+2],144
	jnz LB_4076
	cmp BYTE [rdi+3],42
	jnz LB_4076
	add r14,4
	jmp LB_4075
LB_4076:
; .rb_rle 
	add rsp,0
	jmp LB_4071
LB_4075:
	jmp LB_4078
LB_4077:
; .rb_rle 
	add rsp,0
	jmp LB_4071
LB_4078:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3365~1'(= r ) %3364~0'(= r ) 
; #238 { } ⊢ 1(<3)◂{ }
;; rsp=0 , %3366~1(<3)◂{ } %3365~1'(= r ) %3364~0'(= r ) 
; #26 1(<3)◂{ } ⊢ 0(<2)◂1(<3)◂{ }
;; rsp=0 , %3367~0(<2)◂1(<3)◂{ } %3365~1'(= r ) %3364~0'(= r ) 
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
; mov_ptn2.
	jmp LB_4079
LB_4079:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4070
LB_4071:
	mov r14,QWORD [rsp]
	jmp LB_4082
LB_4081:
	add r14,1 
LB_4082:
	cmp r14,r9
	jge LB_4083
	JZ_SPC BYTE [r13+8+r14], LB_4081
LB_4083
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_4085
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4085
	cmp BYTE [rdi+1],136
	jnz LB_4085
	cmp BYTE [rdi+2],144
	jnz LB_4085
	cmp BYTE [rdi+3],35
	jnz LB_4085
	add r14,4
	jmp LB_4084
LB_4085:
; .rb_rle 
	add rsp,0
	jmp LB_4080
LB_4084:
	jmp LB_4087
LB_4086:
; .rb_rle 
	add rsp,0
	jmp LB_4080
LB_4087:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3369~1'(= r ) %3368~0'(= r ) 
; #237 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %3370~2(<3)◂{ } %3369~1'(= r ) %3368~0'(= r ) 
; #26 2(<3)◂{ } ⊢ 0(<2)◂2(<3)◂{ }
;; rsp=0 , %3371~0(<2)◂2(<3)◂{ } %3369~1'(= r ) %3368~0'(= r ) 
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
; mov_ptn2.
	jmp LB_4088
LB_4088:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4070
LB_4080:
	mov r14,QWORD [rsp]
	jmp LB_4091
LB_4090:
	add r14,1 
LB_4091:
	cmp r14,r9
	jge LB_4092
	JZ_SPC BYTE [r13+8+r14], LB_4090
LB_4092
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4094
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4094
	cmp BYTE [rdi+1],136
	jnz LB_4094
	cmp BYTE [rdi+2],144
	jnz LB_4094
	add r14,3
	jmp LB_4093
LB_4094:
; .rb_rle 
	add rsp,0
	jmp LB_4089
LB_4093:
	jmp LB_4096
LB_4095:
; .rb_rle 
	add rsp,0
	jmp LB_4089
LB_4096:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3373~1'(= r ) %3372~0'(= r ) 
; #239 { } ⊢ 0(<3)◂{ }
;; rsp=0 , %3374~0(<3)◂{ } %3373~1'(= r ) %3372~0'(= r ) 
; #26 0(<3)◂{ } ⊢ 0(<2)◂0(<3)◂{ }
;; rsp=0 , %3375~0(<2)◂0(<3)◂{ } %3373~1'(= r ) %3372~0'(= r ) 
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
; mov_ptn2.
	jmp LB_4097
LB_4097:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4070
LB_4089:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4070:
; discard r14
	add rsp,8
	ret
ETR_387:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_387
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_387:
	push r14
	jmp LB_4101
LB_4100:
	add r14,1 
LB_4101:
	cmp r14,r9
	jge LB_4102
	JZ_SPC BYTE [r13+8+r14], LB_4100
LB_4102
	lea rax,[r14+5]
	cmp rax,r9
	jg LB_4104
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4104
	cmp BYTE [rdi+1],136
	jnz LB_4104
	cmp BYTE [rdi+2],144
	jnz LB_4104
	cmp BYTE [rdi+3],46
	jnz LB_4104
	cmp BYTE [rdi+4],42
	jnz LB_4104
	add r14,5
	jmp LB_4103
LB_4104:
; .rb_rle 
	add rsp,0
	jmp LB_4099
LB_4103:
	jmp LB_4106
LB_4105:
; .rb_rle 
	add rsp,0
	jmp LB_4099
LB_4106:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3377~1'(= r ) %3376~0'(= r ) 
; #238 { } ⊢ 1(<3)◂{ }
;; rsp=0 , %3378~1(<3)◂{ } %3377~1'(= r ) %3376~0'(= r ) 
; #26 1(<3)◂{ } ⊢ 0(<2)◂1(<3)◂{ }
;; rsp=0 , %3379~0(<2)◂1(<3)◂{ } %3377~1'(= r ) %3376~0'(= r ) 
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
; mov_ptn2.
	jmp LB_4107
LB_4107:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4098
LB_4099:
	mov r14,QWORD [rsp]
	jmp LB_4110
LB_4109:
	add r14,1 
LB_4110:
	cmp r14,r9
	jge LB_4111
	JZ_SPC BYTE [r13+8+r14], LB_4109
LB_4111
	lea rax,[r14+5]
	cmp rax,r9
	jg LB_4113
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4113
	cmp BYTE [rdi+1],136
	jnz LB_4113
	cmp BYTE [rdi+2],144
	jnz LB_4113
	cmp BYTE [rdi+3],46
	jnz LB_4113
	cmp BYTE [rdi+4],35
	jnz LB_4113
	add r14,5
	jmp LB_4112
LB_4113:
; .rb_rle 
	add rsp,0
	jmp LB_4108
LB_4112:
	jmp LB_4115
LB_4114:
; .rb_rle 
	add rsp,0
	jmp LB_4108
LB_4115:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3381~1'(= r ) %3380~0'(= r ) 
; #237 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %3382~2(<3)◂{ } %3381~1'(= r ) %3380~0'(= r ) 
; #26 2(<3)◂{ } ⊢ 0(<2)◂2(<3)◂{ }
;; rsp=0 , %3383~0(<2)◂2(<3)◂{ } %3381~1'(= r ) %3380~0'(= r ) 
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
; mov_ptn2.
	jmp LB_4116
LB_4116:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4098
LB_4108:
	mov r14,QWORD [rsp]
	jmp LB_4119
LB_4118:
	add r14,1 
LB_4119:
	cmp r14,r9
	jge LB_4120
	JZ_SPC BYTE [r13+8+r14], LB_4118
LB_4120
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_4122
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4122
	cmp BYTE [rdi+1],136
	jnz LB_4122
	cmp BYTE [rdi+2],144
	jnz LB_4122
	cmp BYTE [rdi+3],46
	jnz LB_4122
	add r14,4
	jmp LB_4121
LB_4122:
; .rb_rle 
	add rsp,0
	jmp LB_4117
LB_4121:
	jmp LB_4124
LB_4123:
; .rb_rle 
	add rsp,0
	jmp LB_4117
LB_4124:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3385~1'(= r ) %3384~0'(= r ) 
; #239 { } ⊢ 0(<3)◂{ }
;; rsp=0 , %3386~0(<3)◂{ } %3385~1'(= r ) %3384~0'(= r ) 
; #26 0(<3)◂{ } ⊢ 0(<2)◂0(<3)◂{ }
;; rsp=0 , %3387~0(<2)◂0(<3)◂{ } %3385~1'(= r ) %3384~0'(= r ) 
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
; mov_ptn2.
	jmp LB_4125
LB_4125:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4098
LB_4117:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4098:
; discard r14
	add rsp,8
	ret
ETR_388:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_388
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_388:
	push r14
	jmp LB_4129
LB_4128:
	add r14,1 
LB_4129:
	cmp r14,r9
	jge LB_4130
	JZ_SPC BYTE [r13+8+r14], LB_4128
LB_4130
	call GRM_387
	cmp BYTE [r8+6],0
	jnz LB_4132
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a38◂ [ ] ) ⊢ 8'(= a38◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4131
LB_4132:
; .rb_rle 
	add rsp,0
	jmp LB_4127
LB_4131:
	jmp LB_4134
LB_4133:
	add r14,1 
LB_4134:
	cmp r14,r9
	jge LB_4135
	JZ_SPC BYTE [r13+8+r14], LB_4133
LB_4135
	call GRM_390
	cmp BYTE [r8+6],0
	jnz LB_4137
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ {| l |}] ) ⊢ 9'(= a3◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4136
LB_4137:
; .rb_rle 
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4126
LB_4136:
	jmp LB_4139
LB_4138:
	add r14,1 
LB_4139:
	cmp r14,r9
	jge LB_4140
	JZ_SPC BYTE [r13+8+r14], LB_4138
LB_4140
	call GRM_382
	cmp BYTE [r8+6],0
	jnz LB_4142
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 10'(= a39◂ [ a18◂ [ ]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4141
LB_4142:
; .rb_rle 
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4126
LB_4141:
	jmp LB_4144
LB_4143:
	add r14,1 
LB_4144:
	cmp r14,r9
	jge LB_4145
	JZ_SPC BYTE [r13+8+r14], LB_4143
LB_4145
	call GRM_389
	cmp BYTE [r8+6],0
	jnz LB_4147
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) ⊢ 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4146
LB_4147:
; .rb_rle 
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4126
LB_4146:
	jmp LB_4149
LB_4148:
; .rb_rle 
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4126
LB_4149:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %3393~1'(= r ) %3392~0'(= r ) %3391~11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) %3390~10'(= a39◂ [ a18◂ [ ]] ) %3389~9'(= a3◂ [ {| l |}] ) %3388~8'(= a38◂ [ ] ) 
; #242 { 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=4 , %3394~1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } %3393~1'(= r ) %3392~0'(= r ) 
; #26 1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=4 , %3395~0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } %3393~1'(= r ) %3392~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 4
	add rsp,32
	jmp LB_4150
LB_4150:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4126
LB_4127:
	mov r14,QWORD [rsp] 
	jmp LB_4153
LB_4152:
	add r14,1 
LB_4153:
	cmp r14,r9
	jge LB_4154
	JZ_SPC BYTE [r13+8+r14], LB_4152
LB_4154
	call GRM_386
	cmp BYTE [r8+6],0
	jnz LB_4156
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a38◂ [ ] ) ⊢ 8'(= a38◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4155
LB_4156:
; .rb_rle 
	add rsp,0
	jmp LB_4151
LB_4155:
	jmp LB_4158
LB_4157:
	add r14,1 
LB_4158:
	cmp r14,r9
	jge LB_4159
	JZ_SPC BYTE [r13+8+r14], LB_4157
LB_4159
	call GRM_390
	cmp BYTE [r8+6],0
	jnz LB_4161
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ {| l |}] ) ⊢ 9'(= a3◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4160
LB_4161:
; .rb_rle 
	add rsp,8
	jmp LB_4151
LB_4160:
	jmp LB_4163
LB_4162:
	add r14,1 
LB_4163:
	cmp r14,r9
	jge LB_4164
	JZ_SPC BYTE [r13+8+r14], LB_4162
LB_4164
	call GRM_382
	cmp BYTE [r8+6],0
	jnz LB_4166
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 10'(= a39◂ [ a18◂ [ ]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4165
LB_4166:
; .rb_rle 
	add rsp,16
	jmp LB_4151
LB_4165:
	jmp LB_4168
LB_4167:
	add r14,1 
LB_4168:
	cmp r14,r9
	jge LB_4169
	JZ_SPC BYTE [r13+8+r14], LB_4167
LB_4169
	call GRM_389
	cmp BYTE [r8+6],0
	jnz LB_4171
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) ⊢ 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4170
LB_4171:
; .rb_rle 
	add rsp,24
	jmp LB_4151
LB_4170:
	jmp LB_4173
LB_4172:
	add r14,1 
LB_4173:
	cmp r14,r9
	jge LB_4174
	JZ_SPC BYTE [r13+8+r14], LB_4172
LB_4174
	call GRM_388
	cmp BYTE [r8+6],0
	jnz LB_4176
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 12'(= a36◂ [ a18◂ [ ]{| l |}] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4175
LB_4176:
; .rb_rle 
	add rsp,32
	jmp LB_4151
LB_4175:
	jmp LB_4178
LB_4177:
; .rb_rle 
	add rsp,40
	jmp LB_4151
LB_4178:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*5]
;; rsp=5 , %3402~1'(= r ) %3401~0'(= r ) %3400~12'(= a36◂ [ a18◂ [ ]{| l |}] ) %3399~11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) %3398~10'(= a39◂ [ a18◂ [ ]] ) %3397~9'(= a3◂ [ {| l |}] ) %3396~8'(= a38◂ [ ] ) 
; #243 { 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %3403~0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } %3402~1'(= r ) %3401~0'(= r ) 
; #26 0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %3404~0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } %3402~1'(= r ) %3401~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 5
	add rsp,40
	jmp LB_4179
LB_4179:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4126
LB_4151:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4126:
; discard r14
	add rsp,8
	ret
ETR_389:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_389
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_389:
	push r14
	jmp LB_4183
LB_4182:
	add r14,1 
LB_4183:
	cmp r14,r9
	jge LB_4184
	JZ_SPC BYTE [r13+8+r14], LB_4182
LB_4184
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4186
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_4186
	add r14,1
	jmp LB_4185
LB_4186:
; .rb_rle 
	add rsp,0
	jmp LB_4181
LB_4185:
	jmp LB_4188
LB_4187:
	add r14,1 
LB_4188:
	cmp r14,r9
	jge LB_4189
	JZ_SPC BYTE [r13+8+r14], LB_4187
LB_4189
	call GRM_388
	cmp BYTE [r8+6],0
	jnz LB_4191
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a36◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4190
LB_4191:
; .rb_rle 
	add rsp,0
	jmp LB_4181
LB_4190:
	jmp LB_4193
LB_4192:
; .rb_rle 
	add rsp,8
	jmp LB_4181
LB_4193:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3407~1'(= r ) %3406~0'(= r ) %3405~8'(= a36◂ [ a18◂ [ ]{| l |}] ) 
; #26 8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3408~0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) %3407~1'(= r ) %3406~0'(= r ) 
; #26 0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3409~0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) %3407~1'(= r ) %3406~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_4194
LB_4194:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4180
LB_4181:
	mov r14,QWORD [rsp]
	jmp LB_4197
LB_4196:
; .rb_rle 
	add rsp,0
	jmp LB_4195
LB_4197:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3411~1'(= r ) %3410~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3412~1(<2)◂{ } %3411~1'(= r ) %3410~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3413~0(<2)◂1(<2)◂{ } %3411~1'(= r ) %3410~0'(= r ) 
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
; mov_ptn2.
	jmp LB_4198
LB_4198:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4180
LB_4195:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4180:
; discard r14
	add rsp,8
	ret
ETR_390:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	sub rsp,32 
	mov rax,QWORD [GRM_DT]
	mov QWORD [rsp],rax 
	mov rax,QWORD [GRM_DT+8]
	mov QWORD [rsp+8],rax 
	mov rax,QWORD [GRM_DT+16]
	mov QWORD [rsp+16],rax 
	mov rax,QWORD [GRM_DT+24]
	mov QWORD [rsp+24],rax 
	mov QWORD [GRM_DT],r13
	mov QWORD [GRM_DT+8],r9
	mov QWORD [GRM_DT+16],r14
	mov QWORD [GRM_DT+24],r14
	call GRM_390
	mov rax,QWORD [rsp] 
	mov QWORD [GRM_DT],rax
	mov rax,QWORD [rsp+8] 
	mov QWORD [GRM_DT+8],rax
	mov rax,QWORD [rsp+16] 
	mov QWORD [GRM_DT+16],rax
	mov rax,QWORD [rsp+24] 
	mov QWORD [GRM_DT+24],rax
	add rsp,32 
	ret
GRM_390:
	push r14
	jmp LB_4202
LB_4201:
	add r14,1 
LB_4202:
	cmp r14,r9
	jge LB_4203
	JZ_SPC BYTE [r13+8+r14], LB_4201
LB_4203
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_4205
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4204
LB_4205:
; .rb_rle 
	add rsp,0
	jmp LB_4200
LB_4204:
	jmp LB_4207
LB_4206:
	add r14,1 
LB_4207:
	cmp r14,r9
	jge LB_4208
	JZ_SPC BYTE [r13+8+r14], LB_4206
LB_4208
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4210
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_4210
	add r14,1
	jmp LB_4209
LB_4210:
; .rb_rle 
	add rsp,8
	jmp LB_4200
LB_4209:
	jmp LB_4212
LB_4211:
; .rb_rle 
	add rsp,8
	jmp LB_4200
LB_4212:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3416~1'(= r ) %3415~0'(= r ) %3414~8'(= {| l |} ) 
; #26 8'(= {| l |} ) ⊢ 0(<2)◂8'(= {| l |} )
;; rsp=1 , %3417~0(<2)◂8'(= {| l |} ) %3416~1'(= r ) %3415~0'(= r ) 
; #26 0(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<2)◂8'(= {| l |} )
;; rsp=1 , %3418~0(<2)◂0(<2)◂8'(= {| l |} ) %3416~1'(= r ) %3415~0'(= r ) 
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
; mov_ptn2.
; .add_rsp 1
	add rsp,8
	jmp LB_4213
LB_4213:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4199
LB_4200:
	mov r14,QWORD [rsp]
	jmp LB_4216
LB_4215:
; .rb_rle 
	add rsp,0
	jmp LB_4214
LB_4216:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3420~1'(= r ) %3419~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3421~1(<2)◂{ } %3420~1'(= r ) %3419~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3422~0(<2)◂1(<2)◂{ } %3420~1'(= r ) %3419~0'(= r ) 
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
; mov_ptn2.
	jmp LB_4217
LB_4217:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4199
LB_4214:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4199:
; discard r14
	add rsp,8
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
	lea rsi,[LB_4218+30-1]
	mov rcx,30
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %18498~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_1
LB_4229:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4233+8*rax]
LB_4233: dq LB_4231,LB_4232
LB_4231:
	mov rdi,LB_4235
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4236
	jmp LB_4234
LB_4232:
	mov rdi,LB_4237
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4234
LB_4234:
	ret
LB_4236:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4240+8*rax]
LB_4240: dq LB_4238,LB_4239
LB_4238:
	mov rdi,LB_4242
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4243
	jmp LB_4241
LB_4239:
	mov rdi,LB_4244
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4245
	jmp LB_4241
LB_4241:
	ret
LB_4245:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4248+8*rax]
LB_4248: dq LB_4246,LB_4247
LB_4246:
	mov rdi,LB_4250
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
	call LB_4245
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4249
LB_4247:
	mov rdi,LB_4251
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4249
LB_4249:
	ret
LB_4243:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4254+8*rax]
LB_4254: dq LB_4252,LB_4253
LB_4252:
	mov rdi,LB_4256
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4257
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4243
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4255
LB_4253:
	mov rdi,LB_4258
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4255
LB_4255:
	ret
LB_4257:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4265+8*rax]
LB_4265: dq LB_4259,LB_4260,LB_4261,LB_4262,LB_4263,LB_4264
LB_4259:
	mov rdi,LB_4267
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
	call LB_4268
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4266
LB_4260:
	mov rdi,LB_4269
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4270
	jmp LB_4266
LB_4261:
	mov rdi,LB_4271
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
	call LB_4272
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4266
LB_4262:
	mov rdi,LB_4273
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4274
	jmp LB_4266
LB_4263:
	mov rdi,LB_4275
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
	call LB_4276
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4266
LB_4264:
	mov rdi,LB_4277
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4278
	jmp LB_4266
LB_4266:
	ret
LB_4278:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4281+8*rax]
LB_4281: dq LB_4279,LB_4280
LB_4279:
	mov rdi,LB_4283
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
	call LB_4276
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
	call LB_4278
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4282
LB_4280:
	mov rdi,LB_4284
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4282
LB_4282:
	ret
LB_4276:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4287+8*rax]
LB_4287: dq LB_4285,LB_4286
LB_4285:
	mov rdi,LB_4289
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4290
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4291
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4288
LB_4286:
	mov rdi,LB_4292
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4290
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4293
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4288
LB_4288:
	ret
LB_4293:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4299+8*rax]
LB_4299: dq LB_4294,LB_4295,LB_4296,LB_4297,LB_4298
LB_4294:
	mov rdi,LB_4301
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4302
	jmp LB_4300
LB_4295:
	mov rdi,LB_4303
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4293
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4293
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4300
LB_4296:
	mov rdi,LB_4304
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4293
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4293
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4300
LB_4297:
	mov rdi,LB_4305
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4306
	jmp LB_4300
LB_4298:
	mov rdi,LB_4307
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4300
LB_4300:
	ret
LB_4306:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4310+8*rax]
LB_4310: dq LB_4308,LB_4309
LB_4308:
	mov rdi,LB_4312
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
	call LB_4306
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4311
LB_4309:
	mov rdi,LB_4313
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4311
LB_4311:
	ret
LB_4302:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4316+8*rax]
LB_4316: dq LB_4314,LB_4315
LB_4314:
	mov rdi,LB_4318
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4293
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4302
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4317
LB_4315:
	mov rdi,LB_4319
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4317
LB_4317:
	ret
LB_4291:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4322+8*rax]
LB_4322: dq LB_4320,LB_4321
LB_4320:
	mov rdi,LB_4324
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
	call LB_4293
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
	call LB_4291
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4323
LB_4321:
	mov rdi,LB_4325
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4323
LB_4323:
	ret
LB_4290:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4328+8*rax]
LB_4328: dq LB_4326,LB_4327
LB_4326:
	mov rdi,LB_4330
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
	call LB_4290
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4329
LB_4327:
	mov rdi,LB_4331
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4329
LB_4329:
	ret
LB_4274:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4334+8*rax]
LB_4334: dq LB_4332,LB_4333
LB_4332:
	mov rdi,LB_4336
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
	call LB_4337
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4338
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_4339
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
	call LB_4274
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4335
LB_4333:
	mov rdi,LB_4340
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4335
LB_4335:
	ret
LB_4339:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4348+8*rax]
LB_4348: dq LB_4341,LB_4342,LB_4343,LB_4344,LB_4345,LB_4346,LB_4347
LB_4341:
	mov rdi,LB_4350
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4306
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4351
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4349
LB_4342:
	mov rdi,LB_4352
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4353
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4351
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4349
LB_4343:
	mov rdi,LB_4354
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4355
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4339
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4349
LB_4344:
	mov rdi,LB_4356
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4357
	jmp LB_4349
LB_4345:
	mov rdi,LB_4358
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4351
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4359
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4349
LB_4346:
	mov rdi,LB_4360
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4361
	jmp LB_4349
LB_4347:
	mov rdi,LB_4362
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4349
LB_4349:
	ret
LB_4361:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4365+8*rax]
LB_4365: dq LB_4363,LB_4364
LB_4363:
	mov rdi,LB_4367
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4351
	jmp LB_4366
LB_4364:
	mov rdi,LB_4368
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4366
LB_4366:
	ret
LB_4359:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4371+8*rax]
LB_4371: dq LB_4369,LB_4370
LB_4369:
	mov rdi,LB_4373
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4374
	jmp LB_4372
LB_4370:
	mov rdi,LB_4375
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4376
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4339
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4372
LB_4372:
	ret
LB_4376:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4379+8*rax]
LB_4379: dq LB_4377,LB_4378
LB_4377:
	mov rdi,LB_4381
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4337
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4376
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4380
LB_4378:
	mov rdi,LB_4382
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4380
LB_4380:
	ret
LB_4374:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4385+8*rax]
LB_4385: dq LB_4383,LB_4384
LB_4383:
	mov rdi,LB_4387
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4388
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4389
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4390
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
	call LB_4374
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4386
LB_4384:
	mov rdi,LB_4391
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4388
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4389
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4390
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4386
LB_4386:
	ret
LB_4390:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4395+8*rax]
LB_4395: dq LB_4392,LB_4393,LB_4394
LB_4392:
	mov rdi,LB_4397
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4357
	jmp LB_4396
LB_4393:
	mov rdi,LB_4398
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4351
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4374
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4396
LB_4394:
	mov rdi,LB_4399
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4339
	jmp LB_4396
LB_4396:
	ret
LB_4389:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4402+8*rax]
LB_4402: dq LB_4400,LB_4401
LB_4400:
	mov rdi,LB_4404
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4405
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4389
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4403
LB_4401:
	mov rdi,LB_4406
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4403
LB_4403:
	ret
LB_4405:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4410+8*rax]
LB_4410: dq LB_4407,LB_4408,LB_4409
LB_4407:
	mov rdi,LB_4412
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4351
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4388
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4411
LB_4408:
	mov rdi,LB_4413
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4414
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4414
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4411
LB_4409:
	mov rdi,LB_4415
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4414
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4414
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4411
LB_4411:
	ret
LB_4414:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4418+8*rax]
LB_4418: dq LB_4416,LB_4417
LB_4416:
	mov rdi,LB_4420
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4421
	jmp LB_4419
LB_4417:
	mov rdi,LB_4422
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4419
LB_4419:
	ret
LB_4421:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4430+8*rax]
LB_4430: dq LB_4423,LB_4424,LB_4425,LB_4426,LB_4427,LB_4428,LB_4429
LB_4423:
	mov rdi,LB_4432
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
	call LB_4433
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
	call LB_4433
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4431
LB_4424:
	mov rdi,LB_4434
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4435
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4436
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4431
LB_4425:
	mov rdi,LB_4437
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4431
LB_4426:
	mov rdi,LB_4438
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4431
LB_4427:
	mov rdi,LB_4439
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4431
LB_4428:
	mov rdi,LB_4440
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4306
	jmp LB_4431
LB_4429:
	mov rdi,LB_4441
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
	jmp LB_4431
LB_4431:
	ret
LB_4436:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4449+8*rax]
LB_4449: dq LB_4442,LB_4443,LB_4444,LB_4445,LB_4446,LB_4447,LB_4448
LB_4442:
	mov rdi,LB_4451
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
	call LB_4452
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4450
LB_4443:
	mov rdi,LB_4453
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4454
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4452
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4450
LB_4444:
	mov rdi,LB_4455
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4456
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4436
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4450
LB_4445:
	mov rdi,LB_4457
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4458
	jmp LB_4450
LB_4446:
	mov rdi,LB_4459
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4452
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4460
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4450
LB_4447:
	mov rdi,LB_4461
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4462
	jmp LB_4450
LB_4448:
	mov rdi,LB_4463
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4450
LB_4450:
	ret
LB_4462:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4466+8*rax]
LB_4466: dq LB_4464,LB_4465
LB_4464:
	mov rdi,LB_4468
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4452
	jmp LB_4467
LB_4465:
	mov rdi,LB_4469
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4467
LB_4467:
	ret
LB_4460:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4472+8*rax]
LB_4472: dq LB_4470,LB_4471
LB_4470:
	mov rdi,LB_4474
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4475
	jmp LB_4473
LB_4471:
	mov rdi,LB_4476
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4477
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4436
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4473
LB_4473:
	ret
LB_4477:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4480+8*rax]
LB_4480: dq LB_4478,LB_4479
LB_4478:
	mov rdi,LB_4482
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4435
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4477
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4481
LB_4479:
	mov rdi,LB_4483
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4481
LB_4481:
	ret
LB_4475:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4486+8*rax]
LB_4486: dq LB_4484,LB_4485
LB_4484:
	mov rdi,LB_4488
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4489
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4490
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4491
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
	call LB_4475
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4487
LB_4485:
	mov rdi,LB_4492
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4489
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4490
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4491
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4487
LB_4487:
	ret
LB_4491:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4496+8*rax]
LB_4496: dq LB_4493,LB_4494,LB_4495
LB_4493:
	mov rdi,LB_4498
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4458
	jmp LB_4497
LB_4494:
	mov rdi,LB_4499
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4452
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4475
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4497
LB_4495:
	mov rdi,LB_4500
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4436
	jmp LB_4497
LB_4497:
	ret
LB_4490:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4503+8*rax]
LB_4503: dq LB_4501,LB_4502
LB_4501:
	mov rdi,LB_4505
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4506
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4490
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4504
LB_4502:
	mov rdi,LB_4507
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4504
LB_4504:
	ret
LB_4506:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4511+8*rax]
LB_4511: dq LB_4508,LB_4509,LB_4510
LB_4508:
	mov rdi,LB_4513
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4452
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4489
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4512
LB_4509:
	mov rdi,LB_4514
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4515
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4515
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4512
LB_4510:
	mov rdi,LB_4516
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4515
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4515
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4512
LB_4512:
	ret
LB_4515:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4519+8*rax]
LB_4519: dq LB_4517,LB_4518
LB_4517:
	mov rdi,LB_4521
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4522
	jmp LB_4520
LB_4518:
	mov rdi,LB_4523
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4520
LB_4520:
	ret
LB_4522:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4531+8*rax]
LB_4531: dq LB_4524,LB_4525,LB_4526,LB_4527,LB_4528,LB_4529,LB_4530
LB_4524:
	mov rdi,LB_4533
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
	call LB_4433
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
	call LB_4433
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4532
LB_4525:
	mov rdi,LB_4534
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4435
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4436
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4532
LB_4526:
	mov rdi,LB_4535
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4532
LB_4527:
	mov rdi,LB_4536
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4532
LB_4528:
	mov rdi,LB_4537
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4532
LB_4529:
	mov rdi,LB_4538
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4532
LB_4530:
	mov rdi,LB_4539
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
	jmp LB_4532
LB_4532:
	ret
LB_4489:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4542+8*rax]
LB_4542: dq LB_4540,LB_4541
LB_4540:
	mov rdi,LB_4544
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4545
	jmp LB_4543
LB_4541:
	mov rdi,LB_4546
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4547
	jmp LB_4543
LB_4543:
	ret
LB_4547:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4552+8*rax]
LB_4552: dq LB_4548,LB_4549,LB_4550,LB_4551
LB_4548:
	mov rdi,LB_4554
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
	call LB_4489
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4553
LB_4549:
	mov rdi,LB_4555
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4522
	jmp LB_4553
LB_4550:
	mov rdi,LB_4556
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4557
	jmp LB_4553
LB_4551:
	mov rdi,LB_4558
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4553
LB_4553:
	ret
LB_4557:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4561+8*rax]
LB_4561: dq LB_4559,LB_4560
LB_4559:
	mov rdi,LB_4563
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4562
LB_4560:
	mov rdi,LB_4564
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4562
LB_4562:
	ret
LB_4545:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4567+8*rax]
LB_4567: dq LB_4565,LB_4566
LB_4565:
	mov rdi,LB_4569
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4489
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4545
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4568
LB_4566:
	mov rdi,LB_4570
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4568
LB_4568:
	ret
LB_4458:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4573+8*rax]
LB_4573: dq LB_4571,LB_4572
LB_4571:
	mov rdi,LB_4575
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4490
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4491
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
	call LB_4458
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4574
LB_4572:
	mov rdi,LB_4576
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4490
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4491
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4574
LB_4574:
	ret
LB_4456:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4581+8*rax]
LB_4581: dq LB_4577,LB_4578,LB_4579,LB_4580
LB_4577:
	mov rdi,LB_4583
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
	call LB_4452
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4435
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4582
LB_4578:
	mov rdi,LB_4584
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4454
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4452
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4435
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4582
LB_4579:
	mov rdi,LB_4585
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4522
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4452
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4435
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4582
LB_4580:
	mov rdi,LB_4586
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4587
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4588
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4589
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4582
LB_4582:
	ret
LB_4589:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4592+8*rax]
LB_4592: dq LB_4590,LB_4591
LB_4590:
	mov rdi,LB_4594
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4595
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4589
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4593
LB_4591:
	mov rdi,LB_4596
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4593
LB_4593:
	ret
LB_4595:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4599+8*rax]
LB_4599: dq LB_4597,LB_4598
LB_4597:
	mov rdi,LB_4601
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4557
	jmp LB_4600
LB_4598:
	mov rdi,LB_4602
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4600
LB_4600:
	ret
LB_4588:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4605+8*rax]
LB_4605: dq LB_4603,LB_4604
LB_4603:
	mov rdi,LB_4607
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4454
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4588
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4606
LB_4604:
	mov rdi,LB_4608
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4606
LB_4606:
	ret
LB_4587:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4611+8*rax]
LB_4611: dq LB_4609,LB_4610
LB_4609:
	mov rdi,LB_4613
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4614
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4587
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4612
LB_4610:
	mov rdi,LB_4615
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4612
LB_4612:
	ret
LB_4614:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4619+8*rax]
LB_4619: dq LB_4616,LB_4617,LB_4618
LB_4616:
	mov rdi,LB_4621
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4522
	jmp LB_4620
LB_4617:
	mov rdi,LB_4622
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4623
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
	jmp LB_4620
LB_4618:
	mov rdi,LB_4624
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
	call LB_4522
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4620
LB_4620:
	ret
LB_4623:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4629+8*rax]
LB_4629: dq LB_4625,LB_4626,LB_4627,LB_4628
LB_4625:
	mov rdi,LB_4631
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4630
LB_4626:
	mov rdi,LB_4632
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4630
LB_4627:
	mov rdi,LB_4633
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4630
LB_4628:
	mov rdi,LB_4634
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4630
LB_4630:
	ret
LB_4454:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4637+8*rax]
LB_4637: dq LB_4635,LB_4636
LB_4635:
	mov rdi,LB_4639
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4522
	jmp LB_4638
LB_4636:
	mov rdi,LB_4640
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4638
LB_4638:
	ret
LB_4452:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4643+8*rax]
LB_4643: dq LB_4641,LB_4642
LB_4641:
	mov rdi,LB_4645
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4646
	jmp LB_4644
LB_4642:
	mov rdi,LB_4647
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4454
	jmp LB_4644
LB_4644:
	ret
LB_4646:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4650+8*rax]
LB_4650: dq LB_4648,LB_4649
LB_4648:
	mov rdi,LB_4652
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4452
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4646
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4651
LB_4649:
	mov rdi,LB_4653
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4651
LB_4651:
	ret
LB_4435:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4656+8*rax]
LB_4656: dq LB_4654,LB_4655
LB_4654:
	mov rdi,LB_4658
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4477
	jmp LB_4657
LB_4655:
	mov rdi,LB_4659
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4595
	jmp LB_4657
LB_4657:
	ret
LB_4433:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4662+8*rax]
LB_4662: dq LB_4660,LB_4661
LB_4660:
	mov rdi,LB_4664
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4665
	jmp LB_4663
LB_4661:
	mov rdi,LB_4666
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4667
	jmp LB_4663
LB_4663:
	ret
LB_4667:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4672+8*rax]
LB_4672: dq LB_4668,LB_4669,LB_4670,LB_4671
LB_4668:
	mov rdi,LB_4674
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
	call LB_4675
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4673
LB_4669:
	mov rdi,LB_4676
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4522
	jmp LB_4673
LB_4670:
	mov rdi,LB_4677
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
	call LB_4433
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4673
LB_4671:
	mov rdi,LB_4678
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
	jmp LB_4673
LB_4673:
	ret
LB_4675:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4683+8*rax]
LB_4683: dq LB_4679,LB_4680,LB_4681,LB_4682
LB_4679:
	mov rdi,LB_4685
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4686
	jmp LB_4684
LB_4680:
	mov rdi,LB_4687
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4684
LB_4681:
	mov rdi,LB_4688
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4684
LB_4682:
	mov rdi,LB_4689
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
	call LB_4690
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4684
LB_4684:
	ret
LB_4690:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4693+8*rax]
LB_4693: dq LB_4691,LB_4692
LB_4691:
	mov rdi,LB_4695
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4675
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4690
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4694
LB_4692:
	mov rdi,LB_4696
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4694
LB_4694:
	ret
LB_4686:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4702+8*rax]
LB_4702: dq LB_4697,LB_4698,LB_4699,LB_4700,LB_4701
LB_4697:
	mov rdi,LB_4704
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4703
LB_4698:
	mov rdi,LB_4705
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4675
	jmp LB_4703
LB_4699:
	mov rdi,LB_4706
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4675
	jmp LB_4703
LB_4700:
	mov rdi,LB_4707
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4703
LB_4701:
	mov rdi,LB_4708
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4690
	jmp LB_4703
LB_4703:
	ret
LB_4665:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4711+8*rax]
LB_4711: dq LB_4709,LB_4710
LB_4709:
	mov rdi,LB_4713
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4433
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4665
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4712
LB_4710:
	mov rdi,LB_4714
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4712
LB_4712:
	ret
LB_4388:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4717+8*rax]
LB_4717: dq LB_4715,LB_4716
LB_4715:
	mov rdi,LB_4719
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4720
	jmp LB_4718
LB_4716:
	mov rdi,LB_4721
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4722
	jmp LB_4718
LB_4718:
	ret
LB_4722:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4727+8*rax]
LB_4727: dq LB_4723,LB_4724,LB_4725,LB_4726
LB_4723:
	mov rdi,LB_4729
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4306
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4388
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4728
LB_4724:
	mov rdi,LB_4730
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4421
	jmp LB_4728
LB_4725:
	mov rdi,LB_4731
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4732
	jmp LB_4728
LB_4726:
	mov rdi,LB_4733
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4728
LB_4728:
	ret
LB_4732:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4736+8*rax]
LB_4736: dq LB_4734,LB_4735
LB_4734:
	mov rdi,LB_4738
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4737
LB_4735:
	mov rdi,LB_4739
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4737
LB_4737:
	ret
LB_4720:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4742+8*rax]
LB_4742: dq LB_4740,LB_4741
LB_4740:
	mov rdi,LB_4744
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4388
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4720
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4743
LB_4741:
	mov rdi,LB_4745
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4743
LB_4743:
	ret
LB_4357:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4748+8*rax]
LB_4748: dq LB_4746,LB_4747
LB_4746:
	mov rdi,LB_4750
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4389
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4390
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
	call LB_4357
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4749
LB_4747:
	mov rdi,LB_4751
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4389
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4390
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4749
LB_4749:
	ret
LB_4355:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4756+8*rax]
LB_4756: dq LB_4752,LB_4753,LB_4754,LB_4755
LB_4752:
	mov rdi,LB_4758
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4306
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4351
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4337
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4757
LB_4753:
	mov rdi,LB_4759
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4353
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4351
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4337
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4757
LB_4754:
	mov rdi,LB_4760
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4421
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4351
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4337
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4757
LB_4755:
	mov rdi,LB_4761
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4762
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4763
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4764
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4757
LB_4757:
	ret
LB_4764:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4767+8*rax]
LB_4767: dq LB_4765,LB_4766
LB_4765:
	mov rdi,LB_4769
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4770
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4764
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4768
LB_4766:
	mov rdi,LB_4771
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4768
LB_4768:
	ret
LB_4770:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4774+8*rax]
LB_4774: dq LB_4772,LB_4773
LB_4772:
	mov rdi,LB_4776
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4732
	jmp LB_4775
LB_4773:
	mov rdi,LB_4777
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4775
LB_4775:
	ret
LB_4763:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4780+8*rax]
LB_4780: dq LB_4778,LB_4779
LB_4778:
	mov rdi,LB_4782
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4353
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4763
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4781
LB_4779:
	mov rdi,LB_4783
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4781
LB_4781:
	ret
LB_4762:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4786+8*rax]
LB_4786: dq LB_4784,LB_4785
LB_4784:
	mov rdi,LB_4788
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4789
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4762
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4787
LB_4785:
	mov rdi,LB_4790
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4787
LB_4787:
	ret
LB_4789:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4794+8*rax]
LB_4794: dq LB_4791,LB_4792,LB_4793
LB_4791:
	mov rdi,LB_4796
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4421
	jmp LB_4795
LB_4792:
	mov rdi,LB_4797
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4623
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
	jmp LB_4795
LB_4793:
	mov rdi,LB_4798
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
	call LB_4421
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4795
LB_4795:
	ret
LB_4353:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4801+8*rax]
LB_4801: dq LB_4799,LB_4800
LB_4799:
	mov rdi,LB_4803
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4421
	jmp LB_4802
LB_4800:
	mov rdi,LB_4804
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4802
LB_4802:
	ret
LB_4351:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4807+8*rax]
LB_4807: dq LB_4805,LB_4806
LB_4805:
	mov rdi,LB_4809
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4810
	jmp LB_4808
LB_4806:
	mov rdi,LB_4811
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4353
	jmp LB_4808
LB_4808:
	ret
LB_4810:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4814+8*rax]
LB_4814: dq LB_4812,LB_4813
LB_4812:
	mov rdi,LB_4816
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4351
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4810
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4815
LB_4813:
	mov rdi,LB_4817
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4815
LB_4815:
	ret
LB_4338:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4820+8*rax]
LB_4820: dq LB_4818,LB_4819
LB_4818:
	mov rdi,LB_4822
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4293
	jmp LB_4821
LB_4819:
	mov rdi,LB_4823
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4821
LB_4821:
	ret
LB_4337:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4826+8*rax]
LB_4826: dq LB_4824,LB_4825
LB_4824:
	mov rdi,LB_4828
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4376
	jmp LB_4827
LB_4825:
	mov rdi,LB_4829
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4770
	jmp LB_4827
LB_4827:
	ret
LB_4272:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4833+8*rax]
LB_4833: dq LB_4830,LB_4831,LB_4832
LB_4830:
	mov rdi,LB_4835
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4337
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4338
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4339
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4834
LB_4831:
	mov rdi,LB_4836
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4421
	jmp LB_4834
LB_4832:
	mov rdi,LB_4837
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4339
	jmp LB_4834
LB_4834:
	ret
LB_4270:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4840+8*rax]
LB_4840: dq LB_4838,LB_4839
LB_4838:
	mov rdi,LB_4842
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
	call LB_4843
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
	call LB_4270
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4841
LB_4839:
	mov rdi,LB_4844
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4841
LB_4841:
	ret
LB_4843:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4847+8*rax]
LB_4847: dq LB_4845,LB_4846
LB_4845:
	mov rdi,LB_4849
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4850
	jmp LB_4848
LB_4846:
	mov rdi,LB_4851
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4852
	jmp LB_4848
LB_4848:
	ret
LB_4852:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4855+8*rax]
LB_4855: dq LB_4853,LB_4854
LB_4853:
	mov rdi,LB_4857
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4764
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4337
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4339
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_4858
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_4859
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_4860
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*6]
	call LB_4852
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4856
LB_4854:
	mov rdi,LB_4861
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4764
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4337
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4339
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_4858
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_4859
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_4860
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4856
LB_4856:
	ret
LB_4860:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4864+8*rax]
LB_4864: dq LB_4862,LB_4863
LB_4862:
	mov rdi,LB_4866
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4337
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4852
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4865
LB_4863:
	mov rdi,LB_4867
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4865
LB_4865:
	ret
LB_4859:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4871+8*rax]
LB_4871: dq LB_4868,LB_4869,LB_4870
LB_4868:
	mov rdi,LB_4873
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4874
	jmp LB_4872
LB_4869:
	mov rdi,LB_4875
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4876
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4859
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4872
LB_4870:
	mov rdi,LB_4877
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4872
LB_4872:
	ret
LB_4876:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4880+8*rax]
LB_4880: dq LB_4878,LB_4879
LB_4878:
	mov rdi,LB_4882
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4883
	jmp LB_4881
LB_4879:
	mov rdi,LB_4884
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4883
	jmp LB_4881
LB_4881:
	ret
LB_4883:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4887+8*rax]
LB_4887: dq LB_4885,LB_4886
LB_4885:
	mov rdi,LB_4889
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4306
	jmp LB_4888
LB_4886:
	mov rdi,LB_4890
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4888
LB_4888:
	ret
LB_4874:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4893+8*rax]
LB_4893: dq LB_4891,LB_4892
LB_4891:
	mov rdi,LB_4895
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4876
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4874
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4894
LB_4892:
	mov rdi,LB_4896
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4894
LB_4894:
	ret
LB_4858:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4900+8*rax]
LB_4900: dq LB_4897,LB_4898,LB_4899
LB_4897:
	mov rdi,LB_4902
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4901
LB_4898:
	mov rdi,LB_4903
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4901
LB_4899:
	mov rdi,LB_4904
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4901
LB_4901:
	ret
LB_4850:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4907+8*rax]
LB_4907: dq LB_4905,LB_4906
LB_4905:
	mov rdi,LB_4909
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4732
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4858
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4859
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_4910
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_4850
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4908
LB_4906:
	mov rdi,LB_4911
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4732
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4858
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4859
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_4910
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4908
LB_4908:
	ret
LB_4910:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4914+8*rax]
LB_4914: dq LB_4912,LB_4913
LB_4912:
	mov rdi,LB_4916
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4850
	jmp LB_4915
LB_4913:
	mov rdi,LB_4917
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4915
LB_4915:
	ret
LB_4268:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4920+8*rax]
LB_4920: dq LB_4918,LB_4919
LB_4918:
	mov rdi,LB_4922
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4243
	jmp LB_4921
LB_4919:
	mov rdi,LB_4923
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4306
	jmp LB_4921
LB_4921:
	ret
LB_4225: ;; #819 0'(= {| l |} ) ⊢ { } : (_s8→{ })
;; rsp=0 , %18483~0'(= {| l |} ) 
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
	lea rsi,[LB_4226+30-1]
	mov rcx,30
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %18484~1'(= {| l |} ) %18483~0'(= {| l |} ) 
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
;; rsp=0 , %18486~2'(= {| l |} ) %18484~1'(= {| l |} ) 
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
	jmp LB_4227
LB_4227:
;; rsp=0 , %18487~2'(= {| l |} ) %18484~1'(= {| l |} ) 
; #361 { 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) }
	sub rsp,8
	mov QWORD [rsp+0],r14
; .mov_ptn2 { 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; {| 1110000010.. |}
	mov r14,0
	mov r13,r8
; mov_ptn2.
	call ETR_361
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
;; rsp=0 , %18490~2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) %18489~3'(= r ) %18484~1'(= {| l |} ) 
; #10 3'(= r ) ⊢ 3'(= r )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4228
LB_4228:
; .dlt.ptn 3'(= r )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %18490~2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) %18484~1'(= {| l |} ) 
; #10 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_4229
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4230
LB_4230:
;; rsp=0 , %18492~2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) %18484~1'(= {| l |} ) 
;; ? 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) ⊢ 0(<2)◂0'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_4925
	jmp LB_4926
LB_4925:
	jmp LB_4924
LB_4926:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %18493~0'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %18484~1'(= {| l |} ) 
;; ? 0'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_4928
	jmp LB_4929
LB_4928:
	jmp LB_4927
LB_4929:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %18495~2'(= a2◂ [ a42◂ [ ]] ) %18484~1'(= {| l |} ) 
; #10 %[ "D1" ] ⊢ %[ "D1" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_4930
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4931
LB_4931:
; .dlt.ptn %[ "D1" ]
;; rsp=0 , %18495~2'(= a2◂ [ a42◂ [ ]] ) %18484~1'(= {| l |} ) 
; #10 2'(= a2◂ [ a42◂ [ ]] ) ⊢ 2'(= a2◂ [ a42◂ [ ]] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_4243
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4932
LB_4932:
;; rsp=0 , %18497~2'(= a2◂ [ a42◂ [ ]] ) %18484~1'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 2'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2943
	C_POP_REGS
; .dlt.ptn 1'(= {| l |} )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .mov_ptn2 { } ⊢ { }
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
	ret
LB_4927:
;; ?. 0'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %18494~2'(= a2◂ [ *{ rr{| l |}}] ) %18484~1'(= {| l |} ) 
	mov rdi,LB_4933
	call emt_stg 
	jmp err
LB_4924:
;; ?. 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %18484~1'(= {| l |} ) 
	mov rdi,LB_4934
	call emt_stg 
	jmp err
RTM_1:
;; rsp=0 , %18498~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
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
	lea rsi,[LB_4219+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %18499~2'(= {| l |} ) %18498~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
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
LB_4220:
	cmp rsi,rax 
	jz LB_4221
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
	jmp LB_4220
LB_4221:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4222
LB_4222:
;; rsp=0 , %18500~0'(= {| {| l |}|} ) %18499~2'(= {| l |} ) %18498~1'(= {| l |} ) 
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
; mov_ptn2.
; .dlt.ptn %[ 1r ]
; .dlt.ptn 0'(= {| {| l |}|} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	GET_LEN rsi,r8
	mov rax,0 
LB_4223:
	cmp rsi,rax 
	jz LB_4224
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
	jmp LB_4223
LB_4224:
	C_POP_REGS
;; rsp=0 , %18503~4'(= {| l |} ) %18499~2'(= {| l |} ) %18498~1'(= {| l |} ) 
; #819 4'(= {| l |} ) ⊢ { }
	sub rsp,16
	mov QWORD [rsp+0],r14
	mov QWORD [rsp+8],r8
; .mov_ptn2 4'(= {| l |} ) ⊢ 0'(= {| l |} )
; {| 10001000110.. |}
	mov r13,r10
; mov_ptn2.
	call LB_4225
	mov r8,QWORD [rsp-8+8*2]
	mov r14,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
; .dlt.ptn { }
;; rsp=0 , %18499~2'(= {| l |} ) %18498~1'(= {| l |} ) 
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
