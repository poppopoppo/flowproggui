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

LB_280: db 95,0
LB_1408: db 10,0
LB_1409: db 58,0
LB_1410: db 45,0
LB_1411: db 112,114,115,95,101,114,114,32,0
LB_1413: db 59,32,226,136,142,124,10,101,120,110,32,53,49,49,55,51,58,10,0
LB_1419: db 58,10,0
LB_1420: db 45,0
LB_1421: db 110,108,115,95,101,114,114,32,0
LB_1423: db 59,32,226,136,142,124,10,101,120,110,32,53,49,51,50,50,58,10,0
LB_1465: db 59,32,226,136,142,124,10,101,120,110,32,53,49,55,51,50,58,10,0
LB_1560: db 34,108,105,110,101,95,114,101,115,95,99,32,48,34,0
LB_1562: db 59,32,226,136,142,124,10,101,120,110,32,53,50,53,57,48,58,10,0
LB_3191: db 34,33,33,33,34,0
LB_3198: db 34,63,63,63,34,0
LB_3607: db 34,100,116,95,101,116,114,32,48,34,0
LB_3921: db 34,108,99,95,101,116,114,95,98,111,100,121,32,48,34,0
LB_4228: db 34,103,114,109,95,101,116,114,95,97,99,116,95,97,99,116,32,48,34,0
LB_4231: db 59,32,226,136,142,124,10,101,120,110,32,55,52,49,49,55,58,10,0
LB_4255: db 34,103,114,109,95,101,116,114,95,97,99,116,95,97,99,116,32,49,34,0
LB_4258: db 59,32,226,136,142,124,10,101,120,110,32,55,52,51,56,54,58,10,0
LB_4528: db 194,167,194,167,32,77,48,10,9,226,136,142,226,136,142,32,10,194,167,194,167,32,77,49,32,61,32,77,48,10,0
LB_4529: db 9,226,136,142,32,120,32,10,0
LB_4536: db 194,167,194,167,32,77,48,10,9,226,136,142,226,136,142,32,10,194,167,194,167,32,77,49,32,61,32,77,48,10,0
LB_4545: db 39,48,226,151,130,0
LB_4547: db 39,49,226,151,130,0
LB_4552: db 39,48,226,151,130,0
LB_4554: db 39,49,226,151,130,0
LB_4560: db 39,48,226,151,130,0
LB_4561: db 39,49,226,151,130,0
LB_4566: db 39,48,226,151,130,0
LB_4568: db 39,49,226,151,130,0
LB_4577: db 39,48,226,151,130,0
LB_4579: db 39,49,226,151,130,0
LB_4581: db 39,50,226,151,130,0
LB_4583: db 39,51,226,151,130,0
LB_4585: db 39,52,226,151,130,0
LB_4587: db 39,53,226,151,130,0
LB_4593: db 39,48,226,151,130,0
LB_4594: db 39,49,226,151,130,0
LB_4599: db 39,48,226,151,130,0
LB_4602: db 39,49,226,151,130,0
LB_4611: db 39,48,226,151,130,0
LB_4613: db 39,49,226,151,130,0
LB_4614: db 39,50,226,151,130,0
LB_4615: db 39,51,226,151,130,0
LB_4617: db 39,52,226,151,130,0
LB_4622: db 39,48,226,151,130,0
LB_4623: db 39,49,226,151,130,0
LB_4628: db 39,48,226,151,130,0
LB_4629: db 39,49,226,151,130,0
LB_4634: db 39,48,226,151,130,0
LB_4635: db 39,49,226,151,130,0
LB_4640: db 39,48,226,151,130,0
LB_4641: db 39,49,226,151,130,0
LB_4646: db 39,48,226,151,130,0
LB_4650: db 39,49,226,151,130,0
LB_4660: db 39,48,226,151,130,0
LB_4662: db 39,49,226,151,130,0
LB_4664: db 39,50,226,151,130,0
LB_4666: db 39,51,226,151,130,0
LB_4668: db 39,52,226,151,130,0
LB_4670: db 39,53,226,151,130,0
LB_4672: db 39,54,226,151,130,0
LB_4677: db 39,48,226,151,130,0
LB_4678: db 39,49,226,151,130,0
LB_4683: db 39,48,226,151,130,0
LB_4685: db 39,49,226,151,130,0
LB_4691: db 39,48,226,151,130,0
LB_4692: db 39,49,226,151,130,0
LB_4697: db 39,48,226,151,130,0
LB_4701: db 39,49,226,151,130,0
LB_4707: db 39,48,226,151,130,0
LB_4708: db 39,49,226,151,130,0
LB_4709: db 39,50,226,151,130,0
LB_4714: db 39,48,226,151,130,0
LB_4716: db 39,49,226,151,130,0
LB_4722: db 39,48,226,151,130,0
LB_4723: db 39,49,226,151,130,0
LB_4725: db 39,50,226,151,130,0
LB_4730: db 39,48,226,151,130,0
LB_4732: db 39,49,226,151,130,0
LB_4742: db 39,48,226,151,130,0
LB_4744: db 39,49,226,151,130,0
LB_4747: db 39,50,226,151,130,0
LB_4748: db 39,51,226,151,130,0
LB_4749: db 39,52,226,151,130,0
LB_4750: db 39,53,226,151,130,0
LB_4751: db 39,54,226,151,130,0
LB_4761: db 39,48,226,151,130,0
LB_4763: db 39,49,226,151,130,0
LB_4765: db 39,50,226,151,130,0
LB_4767: db 39,51,226,151,130,0
LB_4769: db 39,52,226,151,130,0
LB_4771: db 39,53,226,151,130,0
LB_4773: db 39,54,226,151,130,0
LB_4778: db 39,48,226,151,130,0
LB_4779: db 39,49,226,151,130,0
LB_4784: db 39,48,226,151,130,0
LB_4786: db 39,49,226,151,130,0
LB_4792: db 39,48,226,151,130,0
LB_4793: db 39,49,226,151,130,0
LB_4798: db 39,48,226,151,130,0
LB_4802: db 39,49,226,151,130,0
LB_4808: db 39,48,226,151,130,0
LB_4809: db 39,49,226,151,130,0
LB_4810: db 39,50,226,151,130,0
LB_4815: db 39,48,226,151,130,0
LB_4817: db 39,49,226,151,130,0
LB_4823: db 39,48,226,151,130,0
LB_4824: db 39,49,226,151,130,0
LB_4826: db 39,50,226,151,130,0
LB_4831: db 39,48,226,151,130,0
LB_4833: db 39,49,226,151,130,0
LB_4843: db 39,48,226,151,130,0
LB_4844: db 39,49,226,151,130,0
LB_4845: db 39,50,226,151,130,0
LB_4846: db 39,51,226,151,130,0
LB_4847: db 39,52,226,151,130,0
LB_4848: db 39,53,226,151,130,0
LB_4849: db 39,54,226,151,130,0
LB_4854: db 39,48,226,151,130,0
LB_4856: db 39,49,226,151,130,0
LB_4864: db 39,48,226,151,130,0
LB_4865: db 39,49,226,151,130,0
LB_4866: db 39,50,226,151,130,0
LB_4868: db 39,51,226,151,130,0
LB_4873: db 39,48,226,151,130,0
LB_4874: db 39,49,226,151,130,0
LB_4879: db 39,48,226,151,130,0
LB_4880: db 39,49,226,151,130,0
LB_4885: db 39,48,226,151,130,0
LB_4886: db 39,49,226,151,130,0
LB_4893: db 39,48,226,151,130,0
LB_4894: db 39,49,226,151,130,0
LB_4895: db 39,50,226,151,130,0
LB_4896: db 39,51,226,151,130,0
LB_4904: db 39,48,226,151,130,0
LB_4906: db 39,49,226,151,130,0
LB_4911: db 39,48,226,151,130,0
LB_4912: db 39,49,226,151,130,0
LB_4917: db 39,48,226,151,130,0
LB_4918: db 39,49,226,151,130,0
LB_4923: db 39,48,226,151,130,0
LB_4925: db 39,49,226,151,130,0
LB_4931: db 39,48,226,151,130,0
LB_4932: db 39,49,226,151,130,0
LB_4934: db 39,50,226,151,130,0
LB_4941: db 39,48,226,151,130,0
LB_4942: db 39,49,226,151,130,0
LB_4943: db 39,50,226,151,130,0
LB_4944: db 39,51,226,151,130,0
LB_4949: db 39,48,226,151,130,0
LB_4950: db 39,49,226,151,130,0
LB_4955: db 39,48,226,151,130,0
LB_4957: db 39,49,226,151,130,0
LB_4962: db 39,48,226,151,130,0
LB_4963: db 39,49,226,151,130,0
LB_4968: db 39,48,226,151,130,0
LB_4969: db 39,49,226,151,130,0
LB_4974: db 39,48,226,151,130,0
LB_4976: db 39,49,226,151,130,0
LB_4984: db 39,48,226,151,130,0
LB_4986: db 39,49,226,151,130,0
LB_4987: db 39,50,226,151,130,0
LB_4988: db 39,51,226,151,130,0
LB_4995: db 39,48,226,151,130,0
LB_4997: db 39,49,226,151,130,0
LB_4998: db 39,50,226,151,130,0
LB_4999: db 39,51,226,151,130,0
LB_5005: db 39,48,226,151,130,0
LB_5006: db 39,49,226,151,130,0
LB_5014: db 39,48,226,151,130,0
LB_5015: db 39,49,226,151,130,0
LB_5016: db 39,50,226,151,130,0
LB_5017: db 39,51,226,151,130,0
LB_5018: db 39,52,226,151,130,0
LB_5023: db 39,48,226,151,130,0
LB_5024: db 39,49,226,151,130,0
LB_5029: db 39,48,226,151,130,0
LB_5031: db 39,49,226,151,130,0
LB_5039: db 39,48,226,151,130,0
LB_5040: db 39,49,226,151,130,0
LB_5041: db 39,50,226,151,130,0
LB_5043: db 39,51,226,151,130,0
LB_5048: db 39,48,226,151,130,0
LB_5049: db 39,49,226,151,130,0
LB_5054: db 39,48,226,151,130,0
LB_5055: db 39,49,226,151,130,0
LB_5060: db 39,48,226,151,130,0
LB_5061: db 39,49,226,151,130,0
LB_5068: db 39,48,226,151,130,0
LB_5069: db 39,49,226,151,130,0
LB_5070: db 39,50,226,151,130,0
LB_5071: db 39,51,226,151,130,0
LB_5079: db 39,48,226,151,130,0
LB_5081: db 39,49,226,151,130,0
LB_5086: db 39,48,226,151,130,0
LB_5087: db 39,49,226,151,130,0
LB_5092: db 39,48,226,151,130,0
LB_5093: db 39,49,226,151,130,0
LB_5098: db 39,48,226,151,130,0
LB_5100: db 39,49,226,151,130,0
LB_5106: db 39,48,226,151,130,0
LB_5107: db 39,49,226,151,130,0
LB_5108: db 39,50,226,151,130,0
LB_5113: db 39,48,226,151,130,0
LB_5114: db 39,49,226,151,130,0
LB_5119: db 39,48,226,151,130,0
LB_5121: db 39,49,226,151,130,0
LB_5126: db 39,48,226,151,130,0
LB_5127: db 39,49,226,151,130,0
LB_5132: db 39,48,226,151,130,0
LB_5133: db 39,49,226,151,130,0
LB_5138: db 39,48,226,151,130,0
LB_5139: db 39,49,226,151,130,0
LB_5145: db 39,48,226,151,130,0
LB_5146: db 39,49,226,151,130,0
LB_5147: db 39,50,226,151,130,0
LB_5152: db 39,48,226,151,130,0
LB_5154: db 39,49,226,151,130,0
LB_5159: db 39,48,226,151,130,0
LB_5161: db 39,49,226,151,130,0
LB_5167: db 39,48,226,151,130,0
LB_5171: db 39,49,226,151,130,0
LB_5176: db 39,48,226,151,130,0
LB_5177: db 39,49,226,151,130,0
LB_5183: db 39,48,226,151,130,0
LB_5185: db 39,49,226,151,130,0
LB_5187: db 39,50,226,151,130,0
LB_5192: db 39,48,226,151,130,0
LB_5194: db 39,49,226,151,130,0
LB_5199: db 39,48,226,151,130,0
LB_5200: db 39,49,226,151,130,0
LB_5205: db 39,48,226,151,130,0
LB_5206: db 39,49,226,151,130,0
LB_5212: db 39,48,226,151,130,0
LB_5213: db 39,49,226,151,130,0
LB_5214: db 39,50,226,151,130,0
LB_5219: db 39,48,226,151,130,0
LB_5221: db 39,49,226,151,130,0
LB_5226: db 39,48,226,151,130,0
LB_5227: db 39,49,226,151,130,0
LB_5232: db 39,48,226,151,130,0
LB_5233: db 39,49,226,151,130,0
LB_5240: db 34,68,49,34,0
LB_5243: db 59,32,226,136,142,124,10,101,120,110,32,52,50,57,49,51,50,58,10,0
LB_5244: db 59,32,226,136,142,124,10,101,120,110,32,52,50,57,49,53,57,58,10,0
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
LB_8:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_13+8*rax]
LB_13: dq LB_9,LB_10,LB_11,LB_12
LB_9:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_8
	pop r8 
	FREE_RCD 3, r8
	jmp LB_14
LB_10:
	mov rdi,r8
	call free_s8
	jmp LB_14
LB_11:
	jmp LB_14
LB_12:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_14
LB_14:
	ret
LB_18: ;; #67 0'(= a14◂ [ ] ) ⊢ { 0'(= a14◂ [ ] ) 1'(= r ) } : (_t14→{ _t14 _r64 })
;; rsp=0 , %131~0'(= a14◂ [ ] ) 
;; ? 0'(= a14◂ [ ] ) ⊢ 0(<4)◂{ 1'(= a14◂ [ ] ) 2'(= r ) 3'(= a14◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_20
	jmp LB_21
LB_20:
	jmp LB_19
LB_21:
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
LB_19:
;; ? 0'(= a14◂ [ ] ) ⊢ 3(<4)◂1'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_23
	jmp LB_24
LB_23:
	jmp LB_22
LB_24:
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
LB_22:
;; ? 0'(= a14◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_26
	jmp LB_27
LB_26:
	jmp LB_25
LB_27:
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
LB_25:
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
LB_17: ;; #69 { 0'(= {| l |} ) 1'(= a14◂ [ ] ) } ⊢ 0'(= a14◂ [ ] ) : ({ _s8 _t14 }→_t14)
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
	call LB_18
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
LB_67: ;; #71 { 0'(= r ) 1'(= a14◂ [ ] ) } ⊢ 0'(= a14◂ [ ] ) : ({ _r64 _t14 }→_t14)
;; rsp=0 , %175~1'(= a14◂ [ ] ) %174~0'(= r ) 
; #67 1'(= a14◂ [ ] ) ⊢ { 2'(= a14◂ [ ] ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+0],r13
; .mov_ptn2 1'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 1100000010.. |}
	mov r13,r14
; mov_ptn2.
	call LB_18
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
; .dlt.ptn { }
	jmp LB_1
LB_4:
	jmp LB_7
LB_6:
; .dlt.ptn 8'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
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
	call LB_17
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
	jmp LB_15
LB_15:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_0
LB_1:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_30
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],9
	jnz LB_30
	add r14,1
	jmp LB_29
LB_30:
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
; .dlt.ptn { }
	jmp LB_28
LB_31:
	jmp LB_34
LB_33:
; .dlt.ptn 8'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_28
LB_34:
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
	call LB_17
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
	jg LB_39
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_39
	add r14,1
	jmp LB_38
LB_39:
	jmp LB_37
LB_38:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_41
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_40
LB_41:
; .dlt.ptn { }
	jmp LB_37
LB_40:
	jmp LB_43
LB_42:
; .dlt.ptn 8'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_37
LB_43:
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
	call LB_17
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
	jmp LB_44
LB_44:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_0
LB_37:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_48
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_48
	add r14,1
	jmp LB_47
LB_48:
	jmp LB_46
LB_47:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_50
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_49
LB_50:
; .dlt.ptn { }
	jmp LB_46
LB_49:
	jmp LB_52
LB_51:
; .dlt.ptn 8'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_46
LB_52:
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
	call LB_17
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
	jmp LB_53
LB_53:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_0
LB_46:
	mov r14,QWORD [rsp]
	cmp r14,r9
	jge LB_57
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_56
LB_57:
	jmp LB_55
LB_56:
	call GRM_99
	cmp BYTE [r8+6],0
	jnz LB_59
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_58
LB_59:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_55
LB_58:
	jmp LB_61
LB_60:
; .dlt.ptn 9'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_55
LB_61:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %394~1'(= r ) %393~0'(= r ) %392~9'(= a14◂ [ ] ) %391~8'(= r ) 
	cmp QWORD [rsp-8+8*2],0
	jnz LB_66
	jmp LB_65
LB_66:
	jmp LB_64
LB_65:
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
	call LB_17
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
	jmp LB_62
LB_64:
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
	call LB_67
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
	jmp LB_62
LB_62:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_0
LB_55:
	mov r14,QWORD [rsp]
	jmp LB_70
LB_69:
	jmp LB_68
LB_70:
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
	jmp LB_71
LB_71:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_0
LB_68:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_0:
; discard r14
	add rsp,8
	ret
LB_84: ;; #73 { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t14 _s8 _r64 }→{ _t14 _s8 _r64 })
;; rsp=0 , %192~2'(= r ) %191~1'(= {| l |} ) %190~0'(= a14◂ [ ] ) 
;; ? 0'(= a14◂ [ ] ) ⊢ 0(<4)◂{ 3'(= a14◂ [ ] ) 4'(= r ) 5'(= a14◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_86
	jmp LB_87
LB_86:
	jmp LB_85
LB_87:
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
	call LB_84
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
	call LB_84
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
LB_85:
;; ? 0'(= a14◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_89
	jmp LB_90
LB_89:
	jmp LB_88
LB_90:
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
LB_88:
;; ? 0'(= a14◂ [ ] ) ⊢ 3(<4)◂3'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_92
	jmp LB_93
LB_92:
	jmp LB_91
LB_93:
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
LB_91:
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
LB_83: ;; #74 0'(= a14◂ [ ] ) ⊢ { 0'(= a14◂ [ ] ) 1'(= {| l |} ) } : (_t14→{ _t14 _s8 })
;; rsp=0 , %220~0'(= a14◂ [ ] ) 
; #67 0'(= a14◂ [ ] ) ⊢ { 0'(= a14◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 10.. |}
; mov_ptn2.
	call LB_18
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
	call LB_84
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
	jg LB_76
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_76
	add r14,1
	jmp LB_75
LB_76:
	jmp LB_74
LB_75:
	call GRM_102
	cmp BYTE [r8+6],0
	jnz LB_78
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_77
LB_78:
; .dlt.ptn { }
	jmp LB_74
LB_77:
	jmp LB_80
LB_79:
; .dlt.ptn 8'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_74
LB_80:
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
	call LB_83
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
	call LB_8
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
	jmp LB_81
LB_81:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_73
LB_74:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_73:
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
	jg LB_97
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_97
	add r14,1
	jmp LB_96
LB_97:
	jmp LB_95
LB_96:
	jmp LB_99
LB_98:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_94
LB_99:
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
	jmp LB_100
LB_100:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_94
LB_95:
	mov r14,QWORD [rsp] 
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_104
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_104
	add r14,1
	jmp LB_103
LB_104:
	jmp LB_102
LB_103:
	call GRM_103
	cmp BYTE [r8+6],0
	jnz LB_106
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_105
LB_106:
; .dlt.ptn { }
	jmp LB_102
LB_105:
	call GRM_102
	cmp BYTE [r8+6],0
	jnz LB_108
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_107
LB_108:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_102
LB_107:
	jmp LB_110
LB_109:
; .dlt.ptn 9'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	jmp LB_102
LB_110:
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
	call LB_67
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
	jmp LB_111
LB_111:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_94
LB_102:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_115
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_115
	add r14,1
	jmp LB_114
LB_115:
	jmp LB_113
LB_114:
	jmp LB_117
LB_116:
; .dlt.ptn { }
	jmp LB_113
LB_117:
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
	jmp LB_118
LB_118:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_94
LB_113:
	mov r14,QWORD [rsp]
	cmp r14,r9
	jge LB_122
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_121
LB_122:
	jmp LB_120
LB_121:
	call GRM_102
	cmp BYTE [r8+6],0
	jnz LB_124
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_123
LB_124:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_120
LB_123:
	jmp LB_126
LB_125:
; .dlt.ptn 9'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_120
LB_126:
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
	call LB_67
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
	jmp LB_127
LB_127:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_94
LB_120:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_94:
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
	jg LB_132
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_132
	add r14,1
	jmp LB_131
LB_132:
	jmp LB_130
LB_131:
	jmp LB_134
LB_133:
; .dlt.ptn { }
	jmp LB_130
LB_134:
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
	jmp LB_135
LB_135:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_129
LB_130:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_139
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_139
	add r14,1
	jmp LB_138
LB_139:
	jmp LB_137
LB_138:
	jmp LB_141
LB_140:
; .dlt.ptn { }
	jmp LB_137
LB_141:
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
	jmp LB_142
LB_142:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_129
LB_137:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_146
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],110
	jnz LB_146
	add r14,1
	jmp LB_145
LB_146:
	jmp LB_144
LB_145:
	jmp LB_148
LB_147:
; .dlt.ptn { }
	jmp LB_144
LB_148:
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
	jmp LB_149
LB_149:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_129
LB_144:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_153
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],116
	jnz LB_153
	add r14,1
	jmp LB_152
LB_153:
	jmp LB_151
LB_152:
	jmp LB_155
LB_154:
; .dlt.ptn { }
	jmp LB_151
LB_155:
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
	jmp LB_156
LB_156:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_129
LB_151:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_160
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_160
	add r14,1
	jmp LB_159
LB_160:
	jmp LB_158
LB_159:
	jmp LB_162
LB_161:
; .dlt.ptn { }
	jmp LB_158
LB_162:
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
	jmp LB_163
LB_163:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_129
LB_158:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_129:
; discard r14
	add rsp,8
	ret
LB_173: ;; #34 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) } : ({ _r64 _r64 }→{ _r64 _r64 _r64 })
;; rsp=0 , %2~1'(= r ) %1~0'(= r ) 
;;1'(= r )=<0'(= r )
	cmp r14,r13
	jg LB_176
	jmp LB_175
LB_176:
	jmp LB_174
LB_175:
;; rsp=0 , %2~1'(= r ) %1~0'(= r ) 
; ∎ { 0'(= r ) 1'(= r ) %[ 1r ] }
; .mov_ptn2 { 0'(= r ) 1'(= r ) %[ 1r ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= r ) }
; {| 1110.. |}
	mov r8,1
; mov_ptn2.
; .add_rsp 0
	ret
LB_174:
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
	jge LB_168
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_167
LB_168:
	jmp LB_166
LB_167:
	jmp LB_170
LB_169:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_166
LB_170:
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
	call LB_173
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
	call LB_173
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
	jnz LB_179
	jmp LB_178
LB_179:
	jmp LB_177
LB_178:
	cmp r10,1
	jnz LB_181
	jmp LB_180
LB_181:
	jmp LB_177
LB_180:
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
	jmp LB_171
LB_177:
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
	jge LB_185
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_184
LB_185:
	jmp LB_183
LB_184:
	jmp LB_187
LB_186:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_183
LB_187:
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
	call LB_173
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
	call LB_173
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
	jnz LB_192
	jmp LB_191
LB_192:
	jmp LB_190
LB_191:
	cmp r10,1
	jnz LB_194
	jmp LB_193
LB_194:
	jmp LB_190
LB_193:
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
	jmp LB_188
LB_190:
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
	jmp LB_188
LB_188:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_182
LB_183:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_182:
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
	jge LB_198
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_197
LB_198:
	jmp LB_196
LB_197:
	jmp LB_200
LB_199:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_196
LB_200:
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
	call LB_173
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
	call LB_173
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
	jnz LB_205
	jmp LB_204
LB_205:
	jmp LB_203
LB_204:
	cmp r10,1
	jnz LB_207
	jmp LB_206
LB_207:
	jmp LB_203
LB_206:
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
	jmp LB_201
LB_203:
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
	jmp LB_201
LB_201:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_195
LB_196:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_195:
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
	jnz LB_211
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_210
LB_211:
	jmp LB_209
LB_210:
	jmp LB_213
LB_212:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_209
LB_213:
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
	jmp LB_214
LB_214:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_208
LB_209:
	mov r14,QWORD [rsp]
	call GRM_105
	cmp BYTE [r8+6],0
	jnz LB_218
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_217
LB_218:
	jmp LB_216
LB_217:
	jmp LB_220
LB_219:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_216
LB_220:
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
	jmp LB_221
LB_221:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_208
LB_216:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_208:
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
	jnz LB_226
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_225
LB_226:
	jmp LB_224
LB_225:
	call GRM_109
	cmp BYTE [r8+6],0
	jnz LB_228
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_227
LB_228:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_224
LB_227:
	jmp LB_230
LB_229:
; .dlt.ptn 9'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_224
LB_230:
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
	call LB_67
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
	call LB_83
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
	call LB_8
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
	jmp LB_231
LB_231:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_223
LB_224:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_223:
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
	jnz LB_236
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_235
LB_236:
	jmp LB_234
LB_235:
	call GRM_109
	cmp BYTE [r8+6],0
	jnz LB_238
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_237
LB_238:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_234
LB_237:
	jmp LB_240
LB_239:
; .dlt.ptn 9'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_234
LB_240:
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
	call LB_67
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
	jmp LB_241
LB_241:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_233
LB_234:
	mov r14,QWORD [rsp]
	jmp LB_245
LB_244:
	jmp LB_243
LB_245:
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
	jmp LB_246
LB_246:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_233
LB_243:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_233:
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
	jnz LB_251
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_250
LB_251:
	jmp LB_249
LB_250:
	jmp LB_253
LB_252:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_249
LB_253:
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
	jmp LB_254
LB_254:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_248
LB_249:
	mov r14,QWORD [rsp]
	call GRM_104
	cmp BYTE [r8+6],0
	jnz LB_258
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_257
LB_258:
	jmp LB_256
LB_257:
	jmp LB_260
LB_259:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_256
LB_260:
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
	jmp LB_261
LB_261:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_248
LB_256:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_265
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_265
	add r14,1
	jmp LB_264
LB_265:
	jmp LB_263
LB_264:
	jmp LB_267
LB_266:
; .dlt.ptn { }
	jmp LB_263
LB_267:
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
	jmp LB_268
LB_268:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_248
LB_263:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_248:
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
	jg LB_273
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_273
	add r14,1
	jmp LB_272
LB_273:
	jmp LB_271
LB_272:
	call GRM_109
	cmp BYTE [r8+6],0
	jnz LB_275
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_274
LB_275:
; .dlt.ptn { }
	jmp LB_271
LB_274:
	jmp LB_277
LB_276:
; .dlt.ptn 8'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_271
LB_277:
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
	call LB_83
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
	lea rsi,[LB_280+1-1]
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
	call LB_8
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
	jmp LB_278
LB_278:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_270
LB_271:
	mov r14,QWORD [rsp]
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_283
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_282
LB_283:
	jmp LB_281
LB_282:
	jmp LB_285
LB_284:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_281
LB_285:
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
	jmp LB_286
LB_286:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_270
LB_281:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_270:
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
	jg LB_291
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_291
	add r14,1
	jmp LB_290
LB_291:
	jmp LB_289
LB_290:
	push r14
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_297
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],32
	jnz LB_297
	add r14,1
	jmp LB_296
LB_297:
	jmp LB_295
LB_296:
	jmp LB_299
LB_298:
; .dlt.ptn { }
	jmp LB_295
LB_299:
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
	jmp LB_300
LB_300:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_294
LB_295:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_304
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],9
	jnz LB_304
	add r14,1
	jmp LB_303
LB_304:
	jmp LB_302
LB_303:
	jmp LB_306
LB_305:
; .dlt.ptn { }
	jmp LB_302
LB_306:
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
	jmp LB_307
LB_307:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_294
LB_302:
	mov r14,QWORD [rsp]
	call GRM_303
	cmp BYTE [r8+6],0
	jnz LB_311
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_310
LB_311:
	jmp LB_309
LB_310:
	jmp LB_313
LB_312:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_294
LB_313:
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
	jmp LB_314
LB_314:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_294
LB_309:
	mov r14,QWORD [rsp] 
	jmp LB_318
LB_317:
	jmp LB_316
LB_318:
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
	jmp LB_319
LB_319:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_294
LB_316:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_294:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_292
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1110.. |}
; mov_ptn2.
	jmp LB_293
LB_292:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_288
LB_293:
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
	jmp LB_321
LB_321:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_288
LB_289:
	mov r14,QWORD [rsp] 
	mov r8,unt_1
LB_288:
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
	jg LB_326
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_326
	add r14,1
	jmp LB_325
LB_326:
	jmp LB_324
LB_325:
	jmp LB_328
LB_327:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_323
LB_328:
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
	jmp LB_329
LB_329:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_323
LB_324:
	mov r14,QWORD [rsp] 
	jmp LB_333
LB_332:
	jmp LB_331
LB_333:
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
	jmp LB_334
LB_334:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_323
LB_331:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_323:
; discard r14
	add rsp,8
	ret
LB_355:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_358+8*rax]
LB_358: dq LB_356,LB_357
LB_356:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_355
	pop r8 
	FREE_RCD 2, r8
	jmp LB_359
LB_357:
	mov rdi,r8
	call free_s8
	jmp LB_359
LB_359:
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
	jmp LB_339
LB_338:
	add r14,1 
LB_339:
	cmp r14,r9
	jge LB_340
	JZ_LINE_SPC BYTE [r13+8+r14], LB_338
LB_340:
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_342
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_341
LB_342:
	jmp LB_337
LB_341:
	jmp LB_344
LB_343:
	add r14,1 
LB_344:
	cmp r14,r9
	jge LB_345
	JZ_LINE_SPC BYTE [r13+8+r14], LB_343
LB_345:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_347
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_347
	add r14,1
	jmp LB_346
LB_347:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_337
LB_346:
	jmp LB_349
LB_348:
	add r14,1 
LB_349:
	cmp r14,r9
	jge LB_350
	JZ_LINE_SPC BYTE [r13+8+r14], LB_348
LB_350:
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_352
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 9'(= a18◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_351
LB_352:
; .dlt.ptn { }
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_337
LB_351:
	jmp LB_354
LB_353:
; .dlt.ptn 9'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_337
LB_354:
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
	jmp LB_360
LB_360:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_336
LB_337:
	mov r14,QWORD [rsp]
	jmp LB_364
LB_363:
	add r14,1 
LB_364:
	cmp r14,r9
	jge LB_365
	JZ_LINE_SPC BYTE [r13+8+r14], LB_363
LB_365:
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_367
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_366
LB_367:
	jmp LB_362
LB_366:
	jmp LB_369
LB_368:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_362
LB_369:
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
	jmp LB_370
LB_370:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_336
LB_362:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_336:
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
	jge LB_375
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_375
	add r14,rsi
	push rdi
	jmp LB_374
LB_375:
	jmp LB_373
LB_374:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_377
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],114
	jnz LB_377
	add r14,1
	jmp LB_376
LB_377:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_373
LB_376:
	jmp LB_379
LB_378:
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_373
LB_379:
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
	jmp LB_380
LB_380:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_372
LB_373:
	mov r14,QWORD [rsp]
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_384
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_384
	cmp BYTE [rdi+1],120
	jnz LB_384
	add r14,2
	jmp LB_383
LB_384:
	jmp LB_382
LB_383:
	cmp r14,r9
	jge LB_386
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_x
	C_POP_REGS
	cmp rax,0 
	jz LB_386
	jmp LB_385
LB_386:
; .dlt.ptn { }
	jmp LB_382
LB_385:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_388
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],114
	jnz LB_388
	add r14,1
	jmp LB_387
LB_388:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_382
LB_387:
	jmp LB_390
LB_389:
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_382
LB_390:
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
	jmp LB_391
LB_391:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_372
LB_382:
	mov r14,QWORD [rsp]
	call GRM_101
	cmp BYTE [r8+6],0
	jnz LB_395
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_394
LB_395:
	jmp LB_393
LB_394:
	jmp LB_397
LB_396:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_393
LB_397:
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
	jmp LB_398
LB_398:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_372
LB_393:
	mov r14,QWORD [rsp]
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_402
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_401
LB_402:
	jmp LB_400
LB_401:
	jmp LB_404
LB_403:
; .dlt.ptn 8'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_400
LB_404:
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
	jmp LB_405
LB_405:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_372
LB_400:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_372:
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
	jmp LB_410
LB_409:
	add r14,1 
LB_410:
	cmp r14,r9
	jge LB_411
	JZ_LINE_SPC BYTE [r13+8+r14], LB_409
LB_411:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_413
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_413
	add r14,1
	jmp LB_412
LB_413:
	jmp LB_408
LB_412:
	jmp LB_415
LB_414:
	add r14,1 
LB_415:
	cmp r14,r9
	jge LB_416
	JZ_LINE_SPC BYTE [r13+8+r14], LB_414
LB_416:
	call GRM_307
	cmp BYTE [r8+6],0
	jnz LB_418
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_417
LB_418:
; .dlt.ptn { }
	jmp LB_408
LB_417:
	jmp LB_420
LB_419:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_408
LB_420:
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
	jmp LB_421
LB_421:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_407
LB_408:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_407:
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
	jmp LB_426
LB_425:
	add r14,1 
LB_426:
	cmp r14,r9
	jge LB_427
	JZ_LINE_SPC BYTE [r13+8+r14], LB_425
LB_427:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_429
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_429
	add r14,1
	jmp LB_428
LB_429:
	jmp LB_424
LB_428:
	jmp LB_431
LB_430:
	add r14,1 
LB_431:
	cmp r14,r9
	jge LB_432
	JZ_LINE_SPC BYTE [r13+8+r14], LB_430
LB_432:
	call GRM_307
	cmp BYTE [r8+6],0
	jnz LB_434
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_433
LB_434:
; .dlt.ptn { }
	jmp LB_424
LB_433:
	jmp LB_436
LB_435:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_424
LB_436:
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
	jmp LB_437
LB_437:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_423
LB_424:
	mov r14,QWORD [rsp]
	jmp LB_441
LB_440:
	jmp LB_439
LB_441:
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
	jmp LB_442
LB_442:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_423
LB_439:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_423:
; discard r14
	add rsp,8
	ret
LB_461:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_464+8*rax]
LB_464: dq LB_462,LB_463
LB_462:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_466
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_461
	pop r8 
	FREE_RCD 2, r8
	jmp LB_465
LB_463:
	jmp LB_465
LB_465:
	ret
LB_466:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_469+8*rax]
LB_469: dq LB_467,LB_468
LB_467:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_461
	jmp LB_470
LB_468:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_471
	jmp LB_470
LB_470:
	ret
LB_471:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_476+8*rax]
LB_476: dq LB_472,LB_473,LB_474,LB_475
LB_472:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_355
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_466
	pop r8 
	FREE_RCD 2, r8
	jmp LB_477
LB_473:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_478
	jmp LB_477
LB_474:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_479
	jmp LB_477
LB_475:
	mov rdi,r8
	call free_s8
	jmp LB_477
LB_477:
	ret
LB_479:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_482+8*rax]
LB_482: dq LB_480,LB_481
LB_480:
	mov rdi,r8
	call free_s8
	jmp LB_483
LB_481:
	jmp LB_483
LB_483:
	ret
LB_478:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_491+8*rax]
LB_491: dq LB_484,LB_485,LB_486,LB_487,LB_488,LB_489,LB_490
LB_484:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_493
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_493
	pop r8 
	FREE_RCD 4, r8
	jmp LB_492
LB_485:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_494
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_495
	pop r8 
	FREE_RCD 2, r8
	jmp LB_492
LB_486:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_492
LB_487:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_492
LB_488:
	mov rdi,r8
	call free_s8
	jmp LB_492
LB_489:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_355
	jmp LB_492
LB_490:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_492
LB_492:
	ret
LB_495:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_503+8*rax]
LB_503: dq LB_496,LB_497,LB_498,LB_499,LB_500,LB_501,LB_502
LB_496:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_505
	pop r8 
	FREE_RCD 2, r8
	jmp LB_504
LB_497:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_506
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_505
	pop r8 
	FREE_RCD 2, r8
	jmp LB_504
LB_498:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_507
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_495
	pop r8 
	FREE_RCD 2, r8
	jmp LB_504
LB_499:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_508
	jmp LB_504
LB_500:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_505
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_509
	pop r8 
	FREE_RCD 2, r8
	jmp LB_504
LB_501:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_510
	jmp LB_504
LB_502:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_504
LB_504:
	ret
LB_510:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_513+8*rax]
LB_513: dq LB_511,LB_512
LB_511:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_505
	jmp LB_514
LB_512:
	jmp LB_514
LB_514:
	ret
LB_509:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_517+8*rax]
LB_517: dq LB_515,LB_516
LB_515:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_519
	jmp LB_518
LB_516:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_520
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_495
	pop r8 
	FREE_RCD 2, r8
	jmp LB_518
LB_518:
	ret
LB_520:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_523+8*rax]
LB_523: dq LB_521,LB_522
LB_521:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_494
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_520
	pop r8 
	FREE_RCD 2, r8
	jmp LB_524
LB_522:
	jmp LB_524
LB_524:
	ret
LB_519:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_527+8*rax]
LB_527: dq LB_525,LB_526
LB_525:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_529
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_530
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_531
	pop r8 
	FREE_RCD 3, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_519
	pop r8 
	FREE_RCD 2, r8
	jmp LB_528
LB_526:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_529
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_530
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_531
	pop r8 
	FREE_RCD 3, r8
	jmp LB_528
LB_528:
	ret
LB_531:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_535+8*rax]
LB_535: dq LB_532,LB_533,LB_534
LB_532:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_508
	jmp LB_536
LB_533:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_505
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_519
	pop r8 
	FREE_RCD 2, r8
	jmp LB_536
LB_534:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_495
	jmp LB_536
LB_536:
	ret
LB_530:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_539+8*rax]
LB_539: dq LB_537,LB_538
LB_537:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_541
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_530
	pop r8 
	FREE_RCD 2, r8
	jmp LB_540
LB_538:
	jmp LB_540
LB_540:
	ret
LB_541:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_545+8*rax]
LB_545: dq LB_542,LB_543,LB_544
LB_542:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_505
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_529
	pop r8 
	FREE_RCD 2, r8
	jmp LB_546
LB_543:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_547
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_547
	pop r8 
	FREE_RCD 2, r8
	jmp LB_546
LB_544:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_547
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_547
	pop r8 
	FREE_RCD 2, r8
	jmp LB_546
LB_546:
	ret
LB_547:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_550+8*rax]
LB_550: dq LB_548,LB_549
LB_548:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_552
	jmp LB_551
LB_549:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_551
LB_551:
	ret
LB_552:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_560+8*rax]
LB_560: dq LB_553,LB_554,LB_555,LB_556,LB_557,LB_558,LB_559
LB_553:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_493
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_493
	pop r8 
	FREE_RCD 4, r8
	jmp LB_561
LB_554:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_494
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_495
	pop r8 
	FREE_RCD 2, r8
	jmp LB_561
LB_555:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_561
LB_556:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_561
LB_557:
	mov rdi,r8
	call free_s8
	jmp LB_561
LB_558:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_561
LB_559:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_561
LB_561:
	ret
LB_529:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_564+8*rax]
LB_564: dq LB_562,LB_563
LB_562:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_566
	jmp LB_565
LB_563:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_567
	jmp LB_565
LB_565:
	ret
LB_567:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_572+8*rax]
LB_572: dq LB_568,LB_569,LB_570,LB_571
LB_568:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_529
	pop r8 
	FREE_RCD 2, r8
	jmp LB_573
LB_569:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_552
	jmp LB_573
LB_570:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_574
	jmp LB_573
LB_571:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_573
LB_573:
	ret
LB_574:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_577+8*rax]
LB_577: dq LB_575,LB_576
LB_575:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_578
LB_576:
	jmp LB_578
LB_578:
	ret
LB_566:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_581+8*rax]
LB_581: dq LB_579,LB_580
LB_579:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_529
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_566
	pop r8 
	FREE_RCD 2, r8
	jmp LB_582
LB_580:
	jmp LB_582
LB_582:
	ret
LB_508:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_585+8*rax]
LB_585: dq LB_583,LB_584
LB_583:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_530
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_531
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_508
	pop r8 
	FREE_RCD 2, r8
	jmp LB_586
LB_584:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_530
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_531
	pop r8 
	FREE_RCD 2, r8
	jmp LB_586
LB_586:
	ret
LB_507:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_591+8*rax]
LB_591: dq LB_587,LB_588,LB_589,LB_590
LB_587:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_505
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_494
	pop r8 
	FREE_RCD 3, r8
	jmp LB_592
LB_588:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_506
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_505
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_494
	pop r8 
	FREE_RCD 3, r8
	jmp LB_592
LB_589:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_552
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_505
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_494
	pop r8 
	FREE_RCD 3, r8
	jmp LB_592
LB_590:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_593
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_594
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_595
	pop r8 
	FREE_RCD 3, r8
	jmp LB_592
LB_592:
	ret
LB_595:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_598+8*rax]
LB_598: dq LB_596,LB_597
LB_596:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_600
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_595
	pop r8 
	FREE_RCD 2, r8
	jmp LB_599
LB_597:
	jmp LB_599
LB_599:
	ret
LB_600:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_603+8*rax]
LB_603: dq LB_601,LB_602
LB_601:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_574
	jmp LB_604
LB_602:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_604
LB_604:
	ret
LB_594:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_607+8*rax]
LB_607: dq LB_605,LB_606
LB_605:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_506
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_594
	pop r8 
	FREE_RCD 2, r8
	jmp LB_608
LB_606:
	jmp LB_608
LB_608:
	ret
LB_593:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_611+8*rax]
LB_611: dq LB_609,LB_610
LB_609:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_613
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_593
	pop r8 
	FREE_RCD 2, r8
	jmp LB_612
LB_610:
	jmp LB_612
LB_612:
	ret
LB_613:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_617+8*rax]
LB_617: dq LB_614,LB_615,LB_616
LB_614:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_552
	jmp LB_618
LB_615:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_619
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_618
LB_616:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_552
	pop r8 
	FREE_RCD 2, r8
	jmp LB_618
LB_618:
	ret
LB_619:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_624+8*rax]
LB_624: dq LB_620,LB_621,LB_622,LB_623
LB_620:
	jmp LB_625
LB_621:
	jmp LB_625
LB_622:
	jmp LB_625
LB_623:
	jmp LB_625
LB_625:
	ret
LB_506:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_628+8*rax]
LB_628: dq LB_626,LB_627
LB_626:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_552
	jmp LB_629
LB_627:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_629
LB_629:
	ret
LB_505:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_632+8*rax]
LB_632: dq LB_630,LB_631
LB_630:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_634
	jmp LB_633
LB_631:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_506
	jmp LB_633
LB_633:
	ret
LB_634:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_637+8*rax]
LB_637: dq LB_635,LB_636
LB_635:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_505
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_634
	pop r8 
	FREE_RCD 2, r8
	jmp LB_638
LB_636:
	jmp LB_638
LB_638:
	ret
LB_494:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_641+8*rax]
LB_641: dq LB_639,LB_640
LB_639:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_520
	jmp LB_642
LB_640:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_600
	jmp LB_642
LB_642:
	ret
LB_493:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_645+8*rax]
LB_645: dq LB_643,LB_644
LB_643:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_647
	jmp LB_646
LB_644:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_648
	jmp LB_646
LB_646:
	ret
LB_648:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_653+8*rax]
LB_653: dq LB_649,LB_650,LB_651,LB_652
LB_649:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_655
	pop r8 
	FREE_RCD 2, r8
	jmp LB_654
LB_650:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_552
	jmp LB_654
LB_651:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_493
	pop r8 
	FREE_RCD 3, r8
	jmp LB_654
LB_652:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_654
LB_654:
	ret
LB_655:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_660+8*rax]
LB_660: dq LB_656,LB_657,LB_658,LB_659
LB_656:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_662
	jmp LB_661
LB_657:
	jmp LB_661
LB_658:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_661
LB_659:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_663
	pop r8 
	FREE_RCD 2, r8
	jmp LB_661
LB_661:
	ret
LB_663:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_666+8*rax]
LB_666: dq LB_664,LB_665
LB_664:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_655
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_663
	pop r8 
	FREE_RCD 2, r8
	jmp LB_667
LB_665:
	jmp LB_667
LB_667:
	ret
LB_662:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_673+8*rax]
LB_673: dq LB_668,LB_669,LB_670,LB_671,LB_672
LB_668:
	jmp LB_674
LB_669:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_655
	jmp LB_674
LB_670:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_655
	jmp LB_674
LB_671:
	jmp LB_674
LB_672:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_663
	jmp LB_674
LB_674:
	ret
LB_647:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_677+8*rax]
LB_677: dq LB_675,LB_676
LB_675:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_493
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_647
	pop r8 
	FREE_RCD 2, r8
	jmp LB_678
LB_676:
	jmp LB_678
LB_678:
	ret
LB_733:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_736+8*rax]
LB_736: dq LB_734,LB_735
LB_734:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_471
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_733
	pop r8 
	FREE_RCD 2, r8
	jmp LB_737
LB_735:
	jmp LB_737
LB_737:
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
	jmp LB_447
LB_446:
	add r14,1 
LB_447:
	cmp r14,r9
	jge LB_448
	JZ_LINE_SPC BYTE [r13+8+r14], LB_446
LB_448:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_450
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_450
	add r14,1
	jmp LB_449
LB_450:
	jmp LB_445
LB_449:
	jmp LB_452
LB_451:
	add r14,1 
LB_452:
	cmp r14,r9
	jge LB_453
	JZ_LINE_SPC BYTE [r13+8+r14], LB_451
LB_453:
	call GRM_316
	cmp BYTE [r8+6],0
	jnz LB_455
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_454
LB_455:
; .dlt.ptn { }
	jmp LB_445
LB_454:
	jmp LB_457
LB_456:
	add r14,1 
LB_457:
	cmp r14,r9
	jge LB_458
	JZ_LINE_SPC BYTE [r13+8+r14], LB_456
LB_458:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_460
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_460
	add r14,1
	jmp LB_459
LB_460:
; .dlt.ptn 8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_461
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_445
LB_459:
	jmp LB_680
LB_679:
; .dlt.ptn { }
; .dlt.ptn 8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_461
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_445
LB_680:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1848~1'(= r ) %1847~0'(= r ) %1846~8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) 
; #113 8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
;; rsp=1 , %1849~0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) %1848~1'(= r ) %1847~0'(= r ) 
; #26 0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
;; rsp=1 , %1850~0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) %1848~1'(= r ) %1847~0'(= r ) 
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
	jmp LB_681
LB_681:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_444
LB_445:
	mov r14,QWORD [rsp]
	jmp LB_685
LB_684:
	add r14,1 
LB_685:
	cmp r14,r9
	jge LB_686
	JZ_LINE_SPC BYTE [r13+8+r14], LB_684
LB_686:
	call GRM_318
	cmp BYTE [r8+6],0
	jnz LB_688
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a26◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_687
LB_688:
	jmp LB_683
LB_687:
	jmp LB_690
LB_689:
; .dlt.ptn 8'(= a26◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_471
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_683
LB_690:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1853~1'(= r ) %1852~0'(= r ) %1851~8'(= a26◂ [ a18◂ [ ]{| l |}] ) 
; #112 8'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %1854~1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] ) %1853~1'(= r ) %1852~0'(= r ) 
; #26 1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %1855~0(<2)◂1(<2)◂8'(= a26◂ [ a18◂ [ ]{| l |}] ) %1853~1'(= r ) %1852~0'(= r ) 
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
	jmp LB_691
LB_691:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_444
LB_683:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_444:
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
	jmp LB_696
LB_695:
	add r14,1 
LB_696:
	cmp r14,r9
	jge LB_697
	JZ_LINE_SPC BYTE [r13+8+r14], LB_695
LB_697:
	call GRM_315
	cmp BYTE [r8+6],0
	jnz LB_699
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_698
LB_699:
	jmp LB_694
LB_698:
	jmp LB_701
LB_700:
	add r14,1 
LB_701:
	cmp r14,r9
	jge LB_702
	JZ_LINE_SPC BYTE [r13+8+r14], LB_700
LB_702:
	call GRM_316
	cmp BYTE [r8+6],0
	jnz LB_704
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_703
LB_704:
; .dlt.ptn 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_694
LB_703:
	jmp LB_706
LB_705:
; .dlt.ptn 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_461
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_694
LB_706:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1859~1'(= r ) %1858~0'(= r ) %1857~9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) %1856~8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 
; #25 { 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1860~0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } %1859~1'(= r ) %1858~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1861~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]] ) } %1859~1'(= r ) %1858~0'(= r ) 
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
	jmp LB_707
LB_707:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_693
LB_694:
	mov r14,QWORD [rsp]
	jmp LB_711
LB_710:
	jmp LB_709
LB_711:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1863~1'(= r ) %1862~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1864~1(<2)◂{ } %1863~1'(= r ) %1862~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1865~0(<2)◂1(<2)◂{ } %1863~1'(= r ) %1862~0'(= r ) 
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
	jmp LB_712
LB_712:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_693
LB_709:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_693:
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
	jmp LB_717
LB_716:
	add r14,1 
LB_717:
	cmp r14,r9
	jge LB_718
	JZ_LINE_SPC BYTE [r13+8+r14], LB_716
LB_718:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_720
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_720
	add r14,1
	jmp LB_719
LB_720:
	jmp LB_715
LB_719:
	jmp LB_722
LB_721:
	add r14,1 
LB_722:
	cmp r14,r9
	jge LB_723
	JZ_LINE_SPC BYTE [r13+8+r14], LB_721
LB_723:
	call GRM_318
	cmp BYTE [r8+6],0
	jnz LB_725
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a26◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a26◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_724
LB_725:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_714
LB_724:
	jmp LB_727
LB_726:
	add r14,1 
LB_727:
	cmp r14,r9
	jge LB_728
	JZ_LINE_SPC BYTE [r13+8+r14], LB_726
LB_728:
	call GRM_317
	cmp BYTE [r8+6],0
	jnz LB_730
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_729
LB_730:
; .dlt.ptn 8'(= a26◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_471
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_714
LB_729:
	jmp LB_732
LB_731:
; .dlt.ptn 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_733
	C_POP_REGS
; .dlt.ptn 8'(= a26◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_471
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_714
LB_732:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1869~1'(= r ) %1868~0'(= r ) %1867~9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %1866~8'(= a26◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1870~0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %1869~1'(= r ) %1868~0'(= r ) 
; #26 0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1871~0(<2)◂0(<2)◂{ 8'(= a26◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %1869~1'(= r ) %1868~0'(= r ) 
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
	jmp LB_738
LB_738:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_714
LB_715:
	mov r14,QWORD [rsp] 
	jmp LB_742
LB_741:
	jmp LB_740
LB_742:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1873~1'(= r ) %1872~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1874~1(<2)◂{ } %1873~1'(= r ) %1872~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1875~0(<2)◂1(<2)◂{ } %1873~1'(= r ) %1872~0'(= r ) 
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
	jmp LB_743
LB_743:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_714
LB_740:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_714:
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
	jmp LB_748
LB_747:
	add r14,1 
LB_748:
	cmp r14,r9
	jge LB_749
	JZ_LINE_SPC BYTE [r13+8+r14], LB_747
LB_749:
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_751
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_750
LB_751:
	jmp LB_746
LB_750:
	jmp LB_753
LB_752:
	add r14,1 
LB_753:
	cmp r14,r9
	jge LB_754
	JZ_LINE_SPC BYTE [r13+8+r14], LB_752
LB_754:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_756
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_756
	cmp BYTE [rdi+1],151
	jnz LB_756
	cmp BYTE [rdi+2],130
	jnz LB_756
	add r14,3
	jmp LB_755
LB_756:
; .dlt.ptn 8'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_746
LB_755:
	jmp LB_758
LB_757:
	add r14,1 
LB_758:
	cmp r14,r9
	jge LB_759
	JZ_LINE_SPC BYTE [r13+8+r14], LB_757
LB_759:
	call GRM_315
	cmp BYTE [r8+6],0
	jnz LB_761
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_760
LB_761:
; .dlt.ptn { }
; .dlt.ptn 8'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_746
LB_760:
	jmp LB_763
LB_762:
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_746
LB_763:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1879~1'(= r ) %1878~0'(= r ) %1877~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %1876~8'(= a18◂ [ ] ) 
; #189 { 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1880~0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %1879~1'(= r ) %1878~0'(= r ) 
; #26 0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1881~0(<2)◂0(<4)◂{ 8'(= a18◂ [ ] ) 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %1879~1'(= r ) %1878~0'(= r ) 
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
	jmp LB_764
LB_764:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_745
LB_746:
	mov r14,QWORD [rsp]
	jmp LB_768
LB_767:
	add r14,1 
LB_768:
	cmp r14,r9
	jge LB_769
	JZ_LINE_SPC BYTE [r13+8+r14], LB_767
LB_769:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_771
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_771
	cmp BYTE [rdi+1],91
	jnz LB_771
	add r14,2
	jmp LB_770
LB_771:
	jmp LB_766
LB_770:
	jmp LB_773
LB_772:
	add r14,1 
LB_773:
	cmp r14,r9
	jge LB_774
	JZ_LINE_SPC BYTE [r13+8+r14], LB_772
LB_774:
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_776
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_775
LB_776:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_745
LB_775:
	jmp LB_778
LB_777:
	add r14,1 
LB_778:
	cmp r14,r9
	jge LB_779
	JZ_LINE_SPC BYTE [r13+8+r14], LB_777
LB_779:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_781
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],93
	jnz LB_781
	add r14,1
	jmp LB_780
LB_781:
; .dlt.ptn 8'(= a27◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_478
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_745
LB_780:
	jmp LB_783
LB_782:
; .dlt.ptn { }
; .dlt.ptn 8'(= a27◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_478
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_745
LB_783:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1884~1'(= r ) %1883~0'(= r ) %1882~8'(= a27◂ [ a18◂ [ ]] ) 
; #188 8'(= a27◂ [ a18◂ [ ]] ) ⊢ 1(<4)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %1885~1(<4)◂8'(= a27◂ [ a18◂ [ ]] ) %1884~1'(= r ) %1883~0'(= r ) 
; #26 1(<4)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂1(<4)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %1886~0(<2)◂1(<4)◂8'(= a27◂ [ a18◂ [ ]] ) %1884~1'(= r ) %1883~0'(= r ) 
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
	jmp LB_784
LB_784:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_745
LB_766:
	mov r14,QWORD [rsp] 
	jmp LB_788
LB_787:
	add r14,1 
LB_788:
	cmp r14,r9
	jge LB_789
	JZ_LINE_SPC BYTE [r13+8+r14], LB_787
LB_789:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_791
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_791
	add r14,1
	jmp LB_790
LB_791:
	jmp LB_786
LB_790:
	jmp LB_793
LB_792:
	add r14,1 
LB_793:
	cmp r14,r9
	jge LB_794
	JZ_LINE_SPC BYTE [r13+8+r14], LB_792
LB_794:
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_796
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_795
LB_796:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_745
LB_795:
	jmp LB_798
LB_797:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_745
LB_798:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1889~1'(= r ) %1888~0'(= r ) %1887~8'(= {| l |} ) 
; #186 8'(= {| l |} ) ⊢ 3(<4)◂8'(= {| l |} )
;; rsp=1 , %1890~3(<4)◂8'(= {| l |} ) %1889~1'(= r ) %1888~0'(= r ) 
; #26 3(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂3(<4)◂8'(= {| l |} )
;; rsp=1 , %1891~0(<2)◂3(<4)◂8'(= {| l |} ) %1889~1'(= r ) %1888~0'(= r ) 
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
	jmp LB_799
LB_799:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_745
LB_786:
	mov r14,QWORD [rsp] 
	jmp LB_803
LB_802:
	add r14,1 
LB_803:
	cmp r14,r9
	jge LB_804
	JZ_LINE_SPC BYTE [r13+8+r14], LB_802
LB_804:
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_806
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_805
LB_806:
	jmp LB_801
LB_805:
	jmp LB_808
LB_807:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_801
LB_808:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1894~1'(= r ) %1893~0'(= r ) %1892~8'(= {| l |} ) 
; #186 8'(= {| l |} ) ⊢ 3(<4)◂8'(= {| l |} )
;; rsp=1 , %1895~3(<4)◂8'(= {| l |} ) %1894~1'(= r ) %1893~0'(= r ) 
; #26 3(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂3(<4)◂8'(= {| l |} )
;; rsp=1 , %1896~0(<2)◂3(<4)◂8'(= {| l |} ) %1894~1'(= r ) %1893~0'(= r ) 
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
	jmp LB_809
LB_809:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_745
LB_801:
	mov r14,QWORD [rsp]
	jmp LB_813
LB_812:
	add r14,1 
LB_813:
	cmp r14,r9
	jge LB_814
	JZ_LINE_SPC BYTE [r13+8+r14], LB_812
LB_814:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_816
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_816
	add r14,1
	jmp LB_815
LB_816:
	jmp LB_811
LB_815:
	jmp LB_818
LB_817:
; .dlt.ptn { }
	jmp LB_811
LB_818:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1898~1'(= r ) %1897~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1899~1(<2)◂{ } %1898~1'(= r ) %1897~0'(= r ) 
; #187 1(<2)◂{ } ⊢ 2(<4)◂1(<2)◂{ }
;; rsp=0 , %1900~2(<4)◂1(<2)◂{ } %1898~1'(= r ) %1897~0'(= r ) 
; #26 2(<4)◂1(<2)◂{ } ⊢ 0(<2)◂2(<4)◂1(<2)◂{ }
;; rsp=0 , %1901~0(<2)◂2(<4)◂1(<2)◂{ } %1898~1'(= r ) %1897~0'(= r ) 
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
	jmp LB_819
LB_819:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_745
LB_811:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_745:
; discard r14
	add rsp,8
	ret
LB_838:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_841+8*rax]
LB_841: dq LB_839,LB_840
LB_839:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_843
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_838
	pop r8 
	FREE_RCD 2, r8
	jmp LB_842
LB_840:
	jmp LB_842
LB_842:
	ret
LB_843:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_846+8*rax]
LB_846: dq LB_844,LB_845
LB_844:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_838
	jmp LB_847
LB_845:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_848
	jmp LB_847
LB_847:
	ret
LB_848:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_851+8*rax]
LB_851: dq LB_849,LB_850
LB_849:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_478
	jmp LB_852
LB_850:
	mov rdi,r8
	call free_s8
	jmp LB_852
LB_852:
	ret
LB_907:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_910+8*rax]
LB_910: dq LB_908,LB_909
LB_908:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_848
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_907
	pop r8 
	FREE_RCD 2, r8
	jmp LB_911
LB_909:
	jmp LB_911
LB_911:
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
	jmp LB_824
LB_823:
	add r14,1 
LB_824:
	cmp r14,r9
	jge LB_825
	JZ_LINE_SPC BYTE [r13+8+r14], LB_823
LB_825:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_827
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_827
	add r14,1
	jmp LB_826
LB_827:
	jmp LB_822
LB_826:
	jmp LB_829
LB_828:
	add r14,1 
LB_829:
	cmp r14,r9
	jge LB_830
	JZ_LINE_SPC BYTE [r13+8+r14], LB_828
LB_830:
	call GRM_320
	cmp BYTE [r8+6],0
	jnz LB_832
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_831
LB_832:
; .dlt.ptn { }
	jmp LB_822
LB_831:
	jmp LB_834
LB_833:
	add r14,1 
LB_834:
	cmp r14,r9
	jge LB_835
	JZ_LINE_SPC BYTE [r13+8+r14], LB_833
LB_835:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_837
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_837
	add r14,1
	jmp LB_836
LB_837:
; .dlt.ptn 8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_838
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_822
LB_836:
	jmp LB_854
LB_853:
; .dlt.ptn { }
; .dlt.ptn 8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_838
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_822
LB_854:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1904~1'(= r ) %1903~0'(= r ) %1902~8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) 
; #113 8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
;; rsp=1 , %1905~0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) %1904~1'(= r ) %1903~0'(= r ) 
; #26 0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
;; rsp=1 , %1906~0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) %1904~1'(= r ) %1903~0'(= r ) 
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
	jmp LB_855
LB_855:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_821
LB_822:
	mov r14,QWORD [rsp]
	jmp LB_859
LB_858:
	add r14,1 
LB_859:
	cmp r14,r9
	jge LB_860
	JZ_LINE_SPC BYTE [r13+8+r14], LB_858
LB_860:
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_862
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a24◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_861
LB_862:
	jmp LB_857
LB_861:
	jmp LB_864
LB_863:
; .dlt.ptn 8'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_848
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_857
LB_864:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1909~1'(= r ) %1908~0'(= r ) %1907~8'(= a24◂ [ a18◂ [ ]{| l |}] ) 
; #112 8'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %1910~1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] ) %1909~1'(= r ) %1908~0'(= r ) 
; #26 1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %1911~0(<2)◂1(<2)◂8'(= a24◂ [ a18◂ [ ]{| l |}] ) %1909~1'(= r ) %1908~0'(= r ) 
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
	jmp LB_865
LB_865:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_821
LB_857:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_821:
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
	jmp LB_870
LB_869:
	add r14,1 
LB_870:
	cmp r14,r9
	jge LB_871
	JZ_LINE_SPC BYTE [r13+8+r14], LB_869
LB_871:
	call GRM_319
	cmp BYTE [r8+6],0
	jnz LB_873
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_872
LB_873:
	jmp LB_868
LB_872:
	jmp LB_875
LB_874:
	add r14,1 
LB_875:
	cmp r14,r9
	jge LB_876
	JZ_LINE_SPC BYTE [r13+8+r14], LB_874
LB_876:
	call GRM_320
	cmp BYTE [r8+6],0
	jnz LB_878
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_877
LB_878:
; .dlt.ptn 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_868
LB_877:
	jmp LB_880
LB_879:
; .dlt.ptn 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_838
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_868
LB_880:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1915~1'(= r ) %1914~0'(= r ) %1913~9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) %1912~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #25 { 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1916~0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } %1915~1'(= r ) %1914~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1917~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]] ) } %1915~1'(= r ) %1914~0'(= r ) 
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
	jmp LB_881
LB_881:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_867
LB_868:
	mov r14,QWORD [rsp]
	jmp LB_885
LB_884:
	jmp LB_883
LB_885:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1919~1'(= r ) %1918~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1920~1(<2)◂{ } %1919~1'(= r ) %1918~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1921~0(<2)◂1(<2)◂{ } %1919~1'(= r ) %1918~0'(= r ) 
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
	jmp LB_886
LB_886:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_867
LB_883:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_867:
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
	jmp LB_891
LB_890:
	add r14,1 
LB_891:
	cmp r14,r9
	jge LB_892
	JZ_LINE_SPC BYTE [r13+8+r14], LB_890
LB_892:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_894
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_894
	add r14,1
	jmp LB_893
LB_894:
	jmp LB_889
LB_893:
	jmp LB_896
LB_895:
	add r14,1 
LB_896:
	cmp r14,r9
	jge LB_897
	JZ_LINE_SPC BYTE [r13+8+r14], LB_895
LB_897:
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_899
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a24◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_898
LB_899:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_888
LB_898:
	jmp LB_901
LB_900:
	add r14,1 
LB_901:
	cmp r14,r9
	jge LB_902
	JZ_LINE_SPC BYTE [r13+8+r14], LB_900
LB_902:
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_904
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_903
LB_904:
; .dlt.ptn 8'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_848
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_888
LB_903:
	jmp LB_906
LB_905:
; .dlt.ptn 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_907
	C_POP_REGS
; .dlt.ptn 8'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_848
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_888
LB_906:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1925~1'(= r ) %1924~0'(= r ) %1923~9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %1922~8'(= a24◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1926~0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %1925~1'(= r ) %1924~0'(= r ) 
; #26 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %1927~0(<2)◂0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %1925~1'(= r ) %1924~0'(= r ) 
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
	jmp LB_912
LB_912:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_888
LB_889:
	mov r14,QWORD [rsp] 
	jmp LB_916
LB_915:
	jmp LB_914
LB_916:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1929~1'(= r ) %1928~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1930~1(<2)◂{ } %1929~1'(= r ) %1928~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1931~0(<2)◂1(<2)◂{ } %1929~1'(= r ) %1928~0'(= r ) 
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
	jmp LB_917
LB_917:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_888
LB_914:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_888:
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
	jmp LB_922
LB_921:
	add r14,1 
LB_922:
	cmp r14,r9
	jge LB_923
	JZ_LINE_SPC BYTE [r13+8+r14], LB_921
LB_923:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_925
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_925
	cmp BYTE [rdi+1],91
	jnz LB_925
	add r14,2
	jmp LB_924
LB_925:
	jmp LB_920
LB_924:
	jmp LB_927
LB_926:
	add r14,1 
LB_927:
	cmp r14,r9
	jge LB_928
	JZ_LINE_SPC BYTE [r13+8+r14], LB_926
LB_928:
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_930
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_929
LB_930:
; .dlt.ptn { }
	jmp LB_920
LB_929:
	jmp LB_932
LB_931:
	add r14,1 
LB_932:
	cmp r14,r9
	jge LB_933
	JZ_LINE_SPC BYTE [r13+8+r14], LB_931
LB_933:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_935
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],93
	jnz LB_935
	add r14,1
	jmp LB_934
LB_935:
; .dlt.ptn 8'(= a27◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_478
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_920
LB_934:
	jmp LB_937
LB_936:
; .dlt.ptn { }
; .dlt.ptn 8'(= a27◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_478
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_920
LB_937:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1934~1'(= r ) %1933~0'(= r ) %1932~8'(= a27◂ [ a18◂ [ ]] ) 
; #193 8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %1935~0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) %1934~1'(= r ) %1933~0'(= r ) 
; #26 0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %1936~0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) %1934~1'(= r ) %1933~0'(= r ) 
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
	jmp LB_938
LB_938:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_919
LB_920:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_942
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_942
	add r14,1
	jmp LB_941
LB_942:
	jmp LB_940
LB_941:
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_944
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_943
LB_944:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_919
LB_943:
	jmp LB_946
LB_945:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_919
LB_946:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1939~1'(= r ) %1938~0'(= r ) %1937~8'(= {| l |} ) 
; #192 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1940~1(<2)◂8'(= {| l |} ) %1939~1'(= r ) %1938~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1941~0(<2)◂1(<2)◂8'(= {| l |} ) %1939~1'(= r ) %1938~0'(= r ) 
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
	jmp LB_947
LB_947:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_919
LB_940:
	mov r14,QWORD [rsp] 
	jmp LB_951
LB_950:
	add r14,1 
LB_951:
	cmp r14,r9
	jge LB_952
	JZ_LINE_SPC BYTE [r13+8+r14], LB_950
LB_952:
	call GRM_111
	cmp BYTE [r8+6],0
	jnz LB_954
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_953
LB_954:
	jmp LB_949
LB_953:
	jmp LB_956
LB_955:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_949
LB_956:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1944~1'(= r ) %1943~0'(= r ) %1942~8'(= {| l |} ) 
; #192 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1945~1(<2)◂8'(= {| l |} ) %1944~1'(= r ) %1943~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1946~0(<2)◂1(<2)◂8'(= {| l |} ) %1944~1'(= r ) %1943~0'(= r ) 
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
	jmp LB_957
LB_957:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_919
LB_949:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_919:
; discard r14
	add rsp,8
	ret
LB_976:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_979+8*rax]
LB_979: dq LB_977,LB_978
LB_977:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_981
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_976
	pop r8 
	FREE_RCD 2, r8
	jmp LB_980
LB_978:
	jmp LB_980
LB_980:
	ret
LB_981:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_984+8*rax]
LB_984: dq LB_982,LB_983
LB_982:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_976
	jmp LB_985
LB_983:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_986
	jmp LB_985
LB_985:
	ret
LB_986:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_989+8*rax]
LB_989: dq LB_987,LB_988
LB_987:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_479
	jmp LB_990
LB_988:
	mov rdi,r8
	call free_s8
	jmp LB_990
LB_990:
	ret
LB_1071:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1074+8*rax]
LB_1074: dq LB_1072,LB_1073
LB_1072:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_986
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1071
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1075
LB_1073:
	jmp LB_1075
LB_1075:
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
	jmp LB_962
LB_961:
	add r14,1 
LB_962:
	cmp r14,r9
	jge LB_963
	JZ_LINE_SPC BYTE [r13+8+r14], LB_961
LB_963:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_965
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_965
	add r14,1
	jmp LB_964
LB_965:
	jmp LB_960
LB_964:
	jmp LB_967
LB_966:
	add r14,1 
LB_967:
	cmp r14,r9
	jge LB_968
	JZ_LINE_SPC BYTE [r13+8+r14], LB_966
LB_968:
	call GRM_324
	cmp BYTE [r8+6],0
	jnz LB_970
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_969
LB_970:
; .dlt.ptn { }
	jmp LB_960
LB_969:
	jmp LB_972
LB_971:
	add r14,1 
LB_972:
	cmp r14,r9
	jge LB_973
	JZ_LINE_SPC BYTE [r13+8+r14], LB_971
LB_973:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_975
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_975
	add r14,1
	jmp LB_974
LB_975:
; .dlt.ptn 8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_976
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_960
LB_974:
	jmp LB_992
LB_991:
; .dlt.ptn { }
; .dlt.ptn 8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_976
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_960
LB_992:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1949~1'(= r ) %1948~0'(= r ) %1947~8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) 
; #113 8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
;; rsp=1 , %1950~0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %1949~1'(= r ) %1948~0'(= r ) 
; #26 0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
;; rsp=1 , %1951~0(<2)◂0(<2)◂8'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %1949~1'(= r ) %1948~0'(= r ) 
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
	jmp LB_993
LB_993:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_959
LB_960:
	mov r14,QWORD [rsp]
	jmp LB_997
LB_996:
	add r14,1 
LB_997:
	cmp r14,r9
	jge LB_998
	JZ_LINE_SPC BYTE [r13+8+r14], LB_996
LB_998:
	call GRM_327
	cmp BYTE [r8+6],0
	jnz LB_1000
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a25◂ [ {| l |}] ) ⊢ 8'(= a25◂ [ {| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_999
LB_1000:
	jmp LB_995
LB_999:
	jmp LB_1002
LB_1001:
; .dlt.ptn 8'(= a25◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_986
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_995
LB_1002:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1954~1'(= r ) %1953~0'(= r ) %1952~8'(= a25◂ [ {| l |}] ) 
; #112 8'(= a25◂ [ {| l |}] ) ⊢ 1(<2)◂8'(= a25◂ [ {| l |}] )
;; rsp=1 , %1955~1(<2)◂8'(= a25◂ [ {| l |}] ) %1954~1'(= r ) %1953~0'(= r ) 
; #26 1(<2)◂8'(= a25◂ [ {| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a25◂ [ {| l |}] )
;; rsp=1 , %1956~0(<2)◂1(<2)◂8'(= a25◂ [ {| l |}] ) %1954~1'(= r ) %1953~0'(= r ) 
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
	jmp LB_1003
LB_1003:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_959
LB_995:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_959:
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
	jmp LB_1008
LB_1007:
	add r14,1 
LB_1008:
	cmp r14,r9
	jge LB_1009
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1007
LB_1009:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_1011
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1010
LB_1011:
	jmp LB_1006
LB_1010:
	jmp LB_1013
LB_1012:
	add r14,1 
LB_1013:
	cmp r14,r9
	jge LB_1014
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1012
LB_1014:
	call GRM_324
	cmp BYTE [r8+6],0
	jnz LB_1016
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1015
LB_1016:
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1006
LB_1015:
	jmp LB_1018
LB_1017:
; .dlt.ptn 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_976
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_1006
LB_1018:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1960~1'(= r ) %1959~0'(= r ) %1958~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %1957~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #25 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=2 , %1961~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %1960~1'(= r ) %1959~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=2 , %1962~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %1960~1'(= r ) %1959~0'(= r ) 
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
	jmp LB_1019
LB_1019:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1005
LB_1006:
	mov r14,QWORD [rsp]
	jmp LB_1023
LB_1022:
	jmp LB_1021
LB_1023:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1964~1'(= r ) %1963~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1965~1(<2)◂{ } %1964~1'(= r ) %1963~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1966~0(<2)◂1(<2)◂{ } %1964~1'(= r ) %1963~0'(= r ) 
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
	jmp LB_1024
LB_1024:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1005
LB_1021:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1005:
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
	jmp LB_1029
LB_1028:
	add r14,1 
LB_1029:
	cmp r14,r9
	jge LB_1030
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1028
LB_1030:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1032
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_1032
	add r14,1
	jmp LB_1031
LB_1032:
	jmp LB_1027
LB_1031:
	jmp LB_1034
LB_1033:
	add r14,1 
LB_1034:
	cmp r14,r9
	jge LB_1035
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1033
LB_1035:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_1037
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1036
LB_1037:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1026
LB_1036:
	jmp LB_1039
LB_1038:
	add r14,1 
LB_1039:
	cmp r14,r9
	jge LB_1040
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1038
LB_1040:
	call GRM_325
	cmp BYTE [r8+6],0
	jnz LB_1042
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1041
LB_1042:
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1026
LB_1041:
	jmp LB_1044
LB_1043:
; .dlt.ptn 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_976
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1026
LB_1044:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1970~1'(= r ) %1969~0'(= r ) %1968~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %1967~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #25 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=2 , %1971~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %1970~1'(= r ) %1969~0'(= r ) 
; #26 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=2 , %1972~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %1970~1'(= r ) %1969~0'(= r ) 
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
	jmp LB_1045
LB_1045:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1026
LB_1027:
	mov r14,QWORD [rsp] 
	jmp LB_1049
LB_1048:
	jmp LB_1047
LB_1049:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1974~1'(= r ) %1973~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1975~1(<2)◂{ } %1974~1'(= r ) %1973~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1976~0(<2)◂1(<2)◂{ } %1974~1'(= r ) %1973~0'(= r ) 
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
	jmp LB_1050
LB_1050:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1026
LB_1047:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1026:
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
	jmp LB_1055
LB_1054:
	add r14,1 
LB_1055:
	cmp r14,r9
	jge LB_1056
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1054
LB_1056:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1058
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_1058
	add r14,1
	jmp LB_1057
LB_1058:
	jmp LB_1053
LB_1057:
	jmp LB_1060
LB_1059:
	add r14,1 
LB_1060:
	cmp r14,r9
	jge LB_1061
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1059
LB_1061:
	call GRM_327
	cmp BYTE [r8+6],0
	jnz LB_1063
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a25◂ [ {| l |}] ) ⊢ 8'(= a25◂ [ {| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1062
LB_1063:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1052
LB_1062:
	jmp LB_1065
LB_1064:
	add r14,1 
LB_1065:
	cmp r14,r9
	jge LB_1066
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1064
LB_1066:
	call GRM_326
	cmp BYTE [r8+6],0
	jnz LB_1068
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a25◂ [ {| l |}]] ) ⊢ 9'(= a2◂ [ a25◂ [ {| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1067
LB_1068:
; .dlt.ptn 8'(= a25◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_986
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1052
LB_1067:
	jmp LB_1070
LB_1069:
; .dlt.ptn 9'(= a2◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1071
	C_POP_REGS
; .dlt.ptn 8'(= a25◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_986
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1052
LB_1070:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %1980~1'(= r ) %1979~0'(= r ) %1978~9'(= a2◂ [ a25◂ [ {| l |}]] ) %1977~8'(= a25◂ [ {| l |}] ) 
; #25 { 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=2 , %1981~0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } %1980~1'(= r ) %1979~0'(= r ) 
; #26 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=2 , %1982~0(<2)◂0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } %1980~1'(= r ) %1979~0'(= r ) 
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
	jmp LB_1076
LB_1076:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1052
LB_1053:
	mov r14,QWORD [rsp] 
	jmp LB_1080
LB_1079:
	jmp LB_1078
LB_1080:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1984~1'(= r ) %1983~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1985~1(<2)◂{ } %1984~1'(= r ) %1983~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1986~0(<2)◂1(<2)◂{ } %1984~1'(= r ) %1983~0'(= r ) 
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
	jmp LB_1081
LB_1081:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1052
LB_1078:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1052:
; discard r14
	add rsp,8
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
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1086
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_1086
	add r14,1
	jmp LB_1085
LB_1086:
	jmp LB_1084
LB_1085:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_1088
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1087
LB_1088:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1083
LB_1087:
	jmp LB_1090
LB_1089:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1083
LB_1090:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1989~1'(= r ) %1988~0'(= r ) %1987~8'(= {| l |} ) 
; #190 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1990~1(<2)◂8'(= {| l |} ) %1989~1'(= r ) %1988~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1991~0(<2)◂1(<2)◂8'(= {| l |} ) %1989~1'(= r ) %1988~0'(= r ) 
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
	jmp LB_1091
LB_1091:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1083
LB_1084:
	mov r14,QWORD [rsp] 
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_1095
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1094
LB_1095:
	jmp LB_1093
LB_1094:
	jmp LB_1097
LB_1096:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1093
LB_1097:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %1994~1'(= r ) %1993~0'(= r ) %1992~8'(= {| l |} ) 
; #190 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1995~1(<2)◂8'(= {| l |} ) %1994~1'(= r ) %1993~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1996~0(<2)◂1(<2)◂8'(= {| l |} ) %1994~1'(= r ) %1993~0'(= r ) 
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
	jmp LB_1098
LB_1098:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1083
LB_1093:
	mov r14,QWORD [rsp]
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1102
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_1102
	add r14,1
	jmp LB_1101
LB_1102:
	jmp LB_1100
LB_1101:
	jmp LB_1104
LB_1103:
; .dlt.ptn { }
	jmp LB_1100
LB_1104:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %1998~1'(= r ) %1997~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1999~1(<2)◂{ } %1998~1'(= r ) %1997~0'(= r ) 
; #191 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2000~0(<2)◂1(<2)◂{ } %1998~1'(= r ) %1997~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2001~0(<2)◂0(<2)◂1(<2)◂{ } %1998~1'(= r ) %1997~0'(= r ) 
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
	jmp LB_1105
LB_1105:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1083
LB_1100:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1083:
; discard r14
	add rsp,8
	ret
LB_1119:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1125+8*rax]
LB_1125: dq LB_1120,LB_1121,LB_1122,LB_1123,LB_1124
LB_1120:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1127
	jmp LB_1126
LB_1121:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1119
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1119
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1126
LB_1122:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1119
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1119
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1126
LB_1123:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_355
	jmp LB_1126
LB_1124:
	mov rdi,r8
	call free_s8
	jmp LB_1126
LB_1126:
	ret
LB_1127:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1130+8*rax]
LB_1130: dq LB_1128,LB_1129
LB_1128:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1119
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1127
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1131
LB_1129:
	jmp LB_1131
LB_1131:
	ret
LB_1139:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1142+8*rax]
LB_1142: dq LB_1140,LB_1141
LB_1140:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1119
	jmp LB_1143
LB_1141:
	jmp LB_1143
LB_1143:
	ret
LB_1146: ;; #301 { 0'(= a34◂ [ ] ) 1'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0'(= a34◂ [ ] ) : ({ _t34 _lst◂_t34 }→_t34)
;; rsp=0 , %1728~1'(= a2◂ [ a34◂ [ ]] ) %1727~0'(= a34◂ [ ] ) 
;; ?; 1'(= a2◂ [ a34◂ [ ]] ) ⊢ 0(<2)◂{ 2'(= a34◂ [ ] ) 3'(= a2◂ [ a34◂ [ ]] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_1148
	jmp LB_1149
LB_1148:
	jmp LB_1147
LB_1149:
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
	call LB_1146
; .add_rsp 0
;; rsp=0 , %1732~0'(= a34◂ [ ] ) 
; ∎ 0'(= a34◂ [ ] )
; .mov_ptn2 0'(= a34◂ [ ] ) ⊢ 0'(= a34◂ [ ] )
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
	ret
LB_1147:
;; ?; 1'(= a2◂ [ a34◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %1727~0'(= a34◂ [ ] ) 
; ∎ 0'(= a34◂ [ ] )
; .mov_ptn2 0'(= a34◂ [ ] ) ⊢ 0'(= a34◂ [ ] )
; {| 10.. |}
; mov_ptn2.
; .add_rsp 0
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
	jmp LB_1110
LB_1109:
	add r14,1 
LB_1110:
	cmp r14,r9
	jge LB_1111
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1109
LB_1111:
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_1113
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1112
LB_1113:
	jmp LB_1108
LB_1112:
	jmp LB_1115
LB_1114:
	add r14,1 
LB_1115:
	cmp r14,r9
	jge LB_1116
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1114
LB_1116:
	call GRM_330
	cmp BYTE [r8+6],0
	jnz LB_1118
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a34◂ [ ]] ) ⊢ 9'(= a2◂ [ a34◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1117
LB_1118:
; .dlt.ptn 8'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1108
LB_1117:
	jmp LB_1133
LB_1132:
	add r14,1 
LB_1133:
	cmp r14,r9
	jge LB_1134
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1132
LB_1134:
	call GRM_329
	cmp BYTE [r8+6],0
	jnz LB_1136
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a34◂ [ ]] ) ⊢ 10'(= a3◂ [ a34◂ [ ]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1135
LB_1136:
; .dlt.ptn 9'(= a2◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1127
	C_POP_REGS
; .dlt.ptn 8'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_1108
LB_1135:
	jmp LB_1138
LB_1137:
; .dlt.ptn 10'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1139
	C_POP_REGS
; .dlt.ptn 9'(= a2◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1127
	C_POP_REGS
; .dlt.ptn 8'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_1108
LB_1138:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2006~1'(= r ) %2005~0'(= r ) %2004~10'(= a3◂ [ a34◂ [ ]] ) %2003~9'(= a2◂ [ a34◂ [ ]] ) %2002~8'(= a34◂ [ ] ) 
; #301 { 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 2'(= a34◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ { 0'(= a34◂ [ ] ) 1'(= a2◂ [ a34◂ [ ]] ) }
; {| 11000000111110.. |}
	mov r14,QWORD [rsp-8+8*4]
	mov r13,QWORD [rsp-8+8*5]
; mov_ptn2.
	call LB_1146
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=3 , %2007~2'(= a34◂ [ ] ) %2006~1'(= r ) %2005~0'(= r ) %2004~10'(= a3◂ [ a34◂ [ ]] ) 
;; ?; 10'(= a3◂ [ a34◂ [ ]] ) ⊢ 0(<2)◂3'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_1151
	jmp LB_1152
LB_1151:
	jmp LB_1150
LB_1152:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2008~3'(= a34◂ [ ] ) %2007~2'(= a34◂ [ ] ) %2006~1'(= r ) %2005~0'(= r ) 
; #228 { 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } ⊢ 1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) }
;; rsp=3 , %2009~1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } %2006~1'(= r ) %2005~0'(= r ) 
; #26 1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } ⊢ 0(<2)◂1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) }
;; rsp=3 , %2010~0(<2)◂1(<5)◂{ 2'(= a34◂ [ ] ) 3'(= a34◂ [ ] ) } %2006~1'(= r ) %2005~0'(= r ) 
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
	jmp LB_1144
LB_1150:
;; ?; 10'(= a3◂ [ a34◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %2007~2'(= a34◂ [ ] ) %2006~1'(= r ) %2005~0'(= r ) 
; #26 2'(= a34◂ [ ] ) ⊢ 0(<2)◂2'(= a34◂ [ ] )
;; rsp=3 , %2011~0(<2)◂2'(= a34◂ [ ] ) %2006~1'(= r ) %2005~0'(= r ) 
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
	jmp LB_1144
LB_1144:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1107
LB_1108:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1107:
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
	jmp LB_1156
LB_1155:
	add r14,1 
LB_1156:
	cmp r14,r9
	jge LB_1157
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1155
LB_1157:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1159
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1159
	cmp BYTE [rdi+1],134
	jnz LB_1159
	cmp BYTE [rdi+2],146
	jnz LB_1159
	add r14,3
	jmp LB_1158
LB_1159:
	jmp LB_1154
LB_1158:
	jmp LB_1161
LB_1160:
	add r14,1 
LB_1161:
	cmp r14,r9
	jge LB_1162
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1160
LB_1162:
	call GRM_328
	cmp BYTE [r8+6],0
	jnz LB_1164
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1163
LB_1164:
; .dlt.ptn { }
	jmp LB_1154
LB_1163:
	jmp LB_1166
LB_1165:
; .dlt.ptn 8'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_1154
LB_1166:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2014~1'(= r ) %2013~0'(= r ) %2012~8'(= a34◂ [ ] ) 
; #26 8'(= a34◂ [ ] ) ⊢ 0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %2015~0(<2)◂8'(= a34◂ [ ] ) %2014~1'(= r ) %2013~0'(= r ) 
; #26 0(<2)◂8'(= a34◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %2016~0(<2)◂0(<2)◂8'(= a34◂ [ ] ) %2014~1'(= r ) %2013~0'(= r ) 
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
	jmp LB_1167
LB_1167:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1153
LB_1154:
	mov r14,QWORD [rsp]
	jmp LB_1171
LB_1170:
	jmp LB_1169
LB_1171:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2018~1'(= r ) %2017~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2019~1(<2)◂{ } %2018~1'(= r ) %2017~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2020~0(<2)◂1(<2)◂{ } %2018~1'(= r ) %2017~0'(= r ) 
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
	jmp LB_1172
LB_1172:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1153
LB_1169:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1153:
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
	jmp LB_1177
LB_1176:
	add r14,1 
LB_1177:
	cmp r14,r9
	jge LB_1178
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1176
LB_1178:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1180
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1180
	cmp BYTE [rdi+1],151
	jnz LB_1180
	cmp BYTE [rdi+2],130
	jnz LB_1180
	add r14,3
	jmp LB_1179
LB_1180:
	jmp LB_1175
LB_1179:
	jmp LB_1182
LB_1181:
	add r14,1 
LB_1182:
	cmp r14,r9
	jge LB_1183
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1181
LB_1183:
	call GRM_332
	cmp BYTE [r8+6],0
	jnz LB_1185
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1184
LB_1185:
; .dlt.ptn { }
	jmp LB_1175
LB_1184:
	jmp LB_1187
LB_1186:
	add r14,1 
LB_1187:
	cmp r14,r9
	jge LB_1188
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1186
LB_1188:
	call GRM_330
	cmp BYTE [r8+6],0
	jnz LB_1190
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a34◂ [ ]] ) ⊢ 9'(= a2◂ [ a34◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1189
LB_1190:
; .dlt.ptn 8'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_1175
LB_1189:
	jmp LB_1192
LB_1191:
; .dlt.ptn 9'(= a2◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1127
	C_POP_REGS
; .dlt.ptn 8'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	jmp LB_1175
LB_1192:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2024~1'(= r ) %2023~0'(= r ) %2022~9'(= a2◂ [ a34◂ [ ]] ) %2021~8'(= a34◂ [ ] ) 
; #25 { 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) }
;; rsp=2 , %2025~0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } %2024~1'(= r ) %2023~0'(= r ) 
; #26 0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) }
;; rsp=2 , %2026~0(<2)◂0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } %2024~1'(= r ) %2023~0'(= r ) 
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
	jmp LB_1193
LB_1193:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1174
LB_1175:
	mov r14,QWORD [rsp]
	jmp LB_1197
LB_1196:
	jmp LB_1195
LB_1197:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2028~1'(= r ) %2027~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2029~1(<2)◂{ } %2028~1'(= r ) %2027~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2030~0(<2)◂1(<2)◂{ } %2028~1'(= r ) %2027~0'(= r ) 
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
	jmp LB_1198
LB_1198:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1174
LB_1195:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1174:
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
	jmp LB_1203
LB_1202:
	add r14,1 
LB_1203:
	cmp r14,r9
	jge LB_1204
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1202
LB_1204:
	call GRM_328
	cmp BYTE [r8+6],0
	jnz LB_1206
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1205
LB_1206:
	jmp LB_1201
LB_1205:
	jmp LB_1208
LB_1207:
	add r14,1 
LB_1208:
	cmp r14,r9
	jge LB_1209
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1207
LB_1209:
	call GRM_331
	cmp BYTE [r8+6],0
	jnz LB_1211
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a34◂ [ ]] ) ⊢ 9'(= a2◂ [ a34◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1210
LB_1211:
; .dlt.ptn 8'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1201
LB_1210:
	jmp LB_1213
LB_1212:
; .dlt.ptn 9'(= a2◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1127
	C_POP_REGS
; .dlt.ptn 8'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_1201
LB_1213:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2034~1'(= r ) %2033~0'(= r ) %2032~9'(= a2◂ [ a34◂ [ ]] ) %2031~8'(= a34◂ [ ] ) 
; #25 { 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) }
;; rsp=2 , %2035~0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } %2034~1'(= r ) %2033~0'(= r ) 
; #26 0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) }
;; rsp=2 , %2036~0(<2)◂0(<2)◂{ 8'(= a34◂ [ ] ) 9'(= a2◂ [ a34◂ [ ]] ) } %2034~1'(= r ) %2033~0'(= r ) 
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
	jmp LB_1214
LB_1214:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1200
LB_1201:
	mov r14,QWORD [rsp]
	jmp LB_1218
LB_1217:
	jmp LB_1216
LB_1218:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2038~1'(= r ) %2037~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2039~1(<2)◂{ } %2038~1'(= r ) %2037~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2040~0(<2)◂1(<2)◂{ } %2038~1'(= r ) %2037~0'(= r ) 
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
	jmp LB_1219
LB_1219:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1200
LB_1216:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1200:
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
	jmp LB_1224
LB_1223:
	add r14,1 
LB_1224:
	cmp r14,r9
	jge LB_1225
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1223
LB_1225:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1227
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_1227
	add r14,1
	jmp LB_1226
LB_1227:
	jmp LB_1222
LB_1226:
	jmp LB_1229
LB_1228:
	add r14,1 
LB_1229:
	cmp r14,r9
	jge LB_1230
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1228
LB_1230:
	call GRM_331
	cmp BYTE [r8+6],0
	jnz LB_1232
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a34◂ [ ]] ) ⊢ 8'(= a2◂ [ a34◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1231
LB_1232:
; .dlt.ptn { }
	jmp LB_1222
LB_1231:
	jmp LB_1234
LB_1233:
	add r14,1 
LB_1234:
	cmp r14,r9
	jge LB_1235
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1233
LB_1235:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1237
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_1237
	add r14,1
	jmp LB_1236
LB_1237:
; .dlt.ptn 8'(= a2◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1127
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_1222
LB_1236:
	jmp LB_1239
LB_1238:
; .dlt.ptn { }
; .dlt.ptn 8'(= a2◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1127
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_1222
LB_1239:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2043~1'(= r ) %2042~0'(= r ) %2041~8'(= a2◂ [ a34◂ [ ]] ) 
; #229 8'(= a2◂ [ a34◂ [ ]] ) ⊢ 0(<5)◂8'(= a2◂ [ a34◂ [ ]] )
;; rsp=1 , %2044~0(<5)◂8'(= a2◂ [ a34◂ [ ]] ) %2043~1'(= r ) %2042~0'(= r ) 
; #26 0(<5)◂8'(= a2◂ [ a34◂ [ ]] ) ⊢ 0(<2)◂0(<5)◂8'(= a2◂ [ a34◂ [ ]] )
;; rsp=1 , %2045~0(<2)◂0(<5)◂8'(= a2◂ [ a34◂ [ ]] ) %2043~1'(= r ) %2042~0'(= r ) 
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
	jmp LB_1240
LB_1240:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1221
LB_1222:
	mov r14,QWORD [rsp]
	jmp LB_1244
LB_1243:
	add r14,1 
LB_1244:
	cmp r14,r9
	jge LB_1245
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1243
LB_1245:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1247
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],40
	jnz LB_1247
	add r14,1
	jmp LB_1246
LB_1247:
	jmp LB_1242
LB_1246:
	jmp LB_1249
LB_1248:
	add r14,1 
LB_1249:
	cmp r14,r9
	jge LB_1250
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1248
LB_1250:
	call GRM_328
	cmp BYTE [r8+6],0
	jnz LB_1252
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1251
LB_1252:
; .dlt.ptn { }
	jmp LB_1242
LB_1251:
	jmp LB_1254
LB_1253:
	add r14,1 
LB_1254:
	cmp r14,r9
	jge LB_1255
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1253
LB_1255:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1257
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],41
	jnz LB_1257
	add r14,1
	jmp LB_1256
LB_1257:
; .dlt.ptn 8'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_1242
LB_1256:
	jmp LB_1259
LB_1258:
; .dlt.ptn { }
; .dlt.ptn 8'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_1242
LB_1259:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2048~1'(= r ) %2047~0'(= r ) %2046~8'(= a34◂ [ ] ) 
; #26 8'(= a34◂ [ ] ) ⊢ 0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %2049~0(<2)◂8'(= a34◂ [ ] ) %2048~1'(= r ) %2047~0'(= r ) 
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
	jmp LB_1260
LB_1260:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1221
LB_1242:
	mov r14,QWORD [rsp]
	jmp LB_1264
LB_1263:
	add r14,1 
LB_1264:
	cmp r14,r9
	jge LB_1265
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1263
LB_1265:
	call GRM_333
	cmp BYTE [r8+6],0
	jnz LB_1267
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1266
LB_1267:
	jmp LB_1262
LB_1266:
	jmp LB_1269
LB_1268:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1262
LB_1269:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2052~1'(= r ) %2051~0'(= r ) %2050~8'(= {| l |} ) 
; #225 8'(= {| l |} ) ⊢ 4(<5)◂8'(= {| l |} )
;; rsp=1 , %2053~4(<5)◂8'(= {| l |} ) %2052~1'(= r ) %2051~0'(= r ) 
; #26 4(<5)◂8'(= {| l |} ) ⊢ 0(<2)◂4(<5)◂8'(= {| l |} )
;; rsp=1 , %2054~0(<2)◂4(<5)◂8'(= {| l |} ) %2052~1'(= r ) %2051~0'(= r ) 
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
	jmp LB_1270
LB_1270:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1221
LB_1262:
	mov r14,QWORD [rsp]
	jmp LB_1274
LB_1273:
	add r14,1 
LB_1274:
	cmp r14,r9
	jge LB_1275
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1273
LB_1275:
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_1277
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1276
LB_1277:
	jmp LB_1272
LB_1276:
	jmp LB_1279
LB_1278:
; .dlt.ptn 8'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1272
LB_1279:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2057~1'(= r ) %2056~0'(= r ) %2055~8'(= a18◂ [ ] ) 
; #226 8'(= a18◂ [ ] ) ⊢ 3(<5)◂8'(= a18◂ [ ] )
;; rsp=1 , %2058~3(<5)◂8'(= a18◂ [ ] ) %2057~1'(= r ) %2056~0'(= r ) 
; #26 3(<5)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂3(<5)◂8'(= a18◂ [ ] )
;; rsp=1 , %2059~0(<2)◂3(<5)◂8'(= a18◂ [ ] ) %2057~1'(= r ) %2056~0'(= r ) 
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
	jmp LB_1280
LB_1280:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1221
LB_1272:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1221:
; discard r14
	add rsp,8
	ret
ETR_333:
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
	call GRM_333
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
GRM_333:
	push r14
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_1285
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1284
LB_1285:
	jmp LB_1283
LB_1284:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1287
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_1287
	add r14,1
	jmp LB_1286
LB_1287:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1283
LB_1286:
	jmp LB_1289
LB_1288:
; .dlt.ptn { }
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1283
LB_1289:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2062~1'(= r ) %2061~0'(= r ) %2060~8'(= {| l |} ) 
; #26 8'(= {| l |} ) ⊢ 0(<2)◂8'(= {| l |} )
;; rsp=1 , %2063~0(<2)◂8'(= {| l |} ) %2062~1'(= r ) %2061~0'(= r ) 
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
	jmp LB_1290
LB_1290:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1282
LB_1283:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1282:
; discard r14
	add rsp,8
	ret
LB_1306:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1309+8*rax]
LB_1309: dq LB_1307,LB_1308
LB_1307:
	jmp LB_1310
LB_1308:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1311
	jmp LB_1310
LB_1310:
	ret
LB_1311:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1314+8*rax]
LB_1314: dq LB_1312,LB_1313
LB_1312:
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
	call LB_1311
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1315
LB_1313:
	jmp LB_1315
LB_1315:
	ret
LB_1397: ;; #84 { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] ) : ({ _lst◂{ _r64 _r64 _s8 } _lst◂{ _r64 _r64 _s8 } }→_lst◂{ _r64 _r64 _s8 })
;; rsp=0 , %250~1'(= a2◂ [ *{ rr{| l |}}] ) %249~0'(= a2◂ [ *{ rr{| l |}}] ) 
;; ? 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂{ 2'(= *{ rr{| l |}} ) 3'(= a2◂ [ *{ rr{| l |}}] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_1399
	jmp LB_1400
LB_1399:
	jmp LB_1398
LB_1400:
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
	call LB_1397
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
LB_1398:
;; ?. 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %250~1'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 110.. |}
	mov r13,r14
; mov_ptn2.
; .add_rsp 0
	ret
LB_1387: ;; #311 { 0'(= a47◂ [ *{ }] ) 1'(= a47◂ [ *{ }] ) } ⊢ 0'(= a47◂ [ *{ *{ }*{ }}] ) : ({ _t47◂{ } _t47◂{ } }→_t47◂{ { } { } })
;; rsp=0 , %1805~1'(= a47◂ [ *{ }] ) %1804~0'(= a47◂ [ *{ }] ) 
;; ? 0'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂0'(= *{ } )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_1389
	jmp LB_1390
LB_1389:
	jmp LB_1388
LB_1390:
;; rsp=0 , %1807~0'(= *{ } ) %1805~1'(= a47◂ [ *{ }] ) 
;; ? 1'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂1'(= *{ } )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_1392
	jmp LB_1393
LB_1392:
	jmp LB_1391
LB_1393:
;; rsp=0 , %1809~1'(= *{ } ) %1807~0'(= *{ } ) 
; #309 { 0'(= *{ } ) 1'(= *{ } ) } ⊢ 0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) }
;; rsp=0 , %1810~0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) } 
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
LB_1391:
;; ?. 1'(= a47◂ [ *{ }] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1808~2'(= a2◂ [ *{ rr{| l |}}] ) %1807~0'(= *{ } ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1811~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1807~0'(= *{ } ) 
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
LB_1388:
;; ?. 0'(= a47◂ [ *{ }] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1806~2'(= a2◂ [ *{ rr{| l |}}] ) %1805~1'(= a47◂ [ *{ }] ) 
;; ? 1'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂1'(= *{ } )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_1395
	jmp LB_1396
LB_1395:
	jmp LB_1394
LB_1396:
;; rsp=0 , %1813~1'(= *{ } ) %1806~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1814~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1813~1'(= *{ } ) 
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
LB_1394:
;; ?. 1'(= a47◂ [ *{ }] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1812~0'(= a2◂ [ *{ rr{| l |}}] ) %1806~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110.. |}
	mov r14,r13
	mov r13,r8
; mov_ptn2.
	call LB_1397
; .add_rsp 0
;; rsp=0 , %1815~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1816~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
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
LB_1404: ;; #314 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= {| l |} ) : (_lst◂{ _r64 _r64 _s8 }→_s8)
;; rsp=0 , %1834~0'(= a2◂ [ *{ rr{| l |}}] ) 
;; ? 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂{ { 2'(= r ) 3'(= r ) 4'(= {| l |} ) } 5'(= a2◂ [ *{ rr{| l |}}] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_1406
	jmp LB_1407
LB_1406:
	jmp LB_1405
LB_1407:
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
;; rsp=0 , %1838~5'(= a2◂ [ *{ rr{| l |}}] ) %1837~4'(= {| l |} ) %1836~3'(= r ) %1835~2'(= r ) 
; #314 5'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+0],r8
	mov QWORD [rsp+8],r9
	mov QWORD [rsp+16],r10
; .mov_ptn2 5'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 100001001110.. |}
	mov r13,r11
; mov_ptn2.
	call LB_1404
	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov r8,QWORD [rsp-8+8*1]
; .add_rsp 3
	add rsp,24
;; rsp=0 , %1839~0'(= {| l |} ) %1837~4'(= {| l |} ) %1836~3'(= r ) %1835~2'(= r ) 
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
	lea rsi,[LB_1408+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r10+7+rcx]
	rep movsb
	lea rsi,[LB_1409+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1410+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1411+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1844~1'(= {| l |} ) %1843~0'(= {| l |} ) %1842~4'(= {| l |} ) %1841~3'(= r ) %1840~2'(= r ) 
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
LB_1405:
;; ?. 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %1845~%[ "" ] 
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
	jmp LB_1295
LB_1294:
	add r14,1 
LB_1295:
	cmp r14,r9
	jge LB_1296
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1294
LB_1296:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1298
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1298
	add r14,1
	jmp LB_1297
LB_1298:
	jmp LB_1293
LB_1297:
	jmp LB_1300
LB_1299:
	add r14,1 
LB_1300:
	cmp r14,r9
	jge LB_1301
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1299
LB_1301:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1303
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1302
LB_1303:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1292
LB_1302:
	jmp LB_1305
LB_1304:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1292
LB_1305:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2066~1'(= r ) %2065~0'(= r ) %2064~8'(= a47◂ [ *{ }] ) 
; #309 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2067~0(<2)◂{ } %2066~1'(= r ) %2065~0'(= r ) %2064~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=1 , %2068~0(<2)◂0(<2)◂{ } %2066~1'(= r ) %2065~0'(= r ) %2064~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_1316
LB_1316:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1292
LB_1293:
	mov r14,QWORD [rsp] 
	jmp LB_1320
LB_1319:
	add r14,1 
LB_1320:
	cmp r14,r9
	jge LB_1321
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1319
LB_1321:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1323
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],35
	jnz LB_1323
	cmp BYTE [rdi+1],35
	jnz LB_1323
	add r14,2
	jmp LB_1322
LB_1323:
	jmp LB_1318
LB_1322:
	jmp LB_1325
LB_1324:
	add r14,1 
LB_1325:
	cmp r14,r9
	jge LB_1326
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1324
LB_1326:
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_1328
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
	jmp LB_1327
LB_1328:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1292
LB_1327:
	jmp LB_1330
LB_1329:
	add r14,1 
LB_1330:
	cmp r14,r9
	jge LB_1331
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1329
LB_1331:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1333
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 10'(= a47◂ [ *{ }] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1332
LB_1333:
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1292
LB_1332:
	jmp LB_1335
LB_1334:
; .dlt.ptn 10'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
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
; .dlt.ptn { }
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1292
LB_1335:
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
	call LB_1306
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
	jmp LB_1336
LB_1336:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1292
LB_1318:
	mov r14,QWORD [rsp] 
	jmp LB_1340
LB_1339:
	add r14,1 
LB_1340:
	cmp r14,r9
	jge LB_1341
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1339
LB_1341:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1343
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1343
	cmp BYTE [rdi+1],92
	jnz LB_1343
	add r14,2
	jmp LB_1342
LB_1343:
	jmp LB_1338
LB_1342:
	jmp LB_1345
LB_1344:
	add r14,1 
LB_1345:
	cmp r14,r9
	jge LB_1346
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1344
LB_1346:
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_1348
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
	jmp LB_1347
LB_1348:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1292
LB_1347:
	jmp LB_1350
LB_1349:
	add r14,1 
LB_1350:
	cmp r14,r9
	jge LB_1351
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1349
LB_1351:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1353
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 10'(= a47◂ [ *{ }] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1352
LB_1353:
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1292
LB_1352:
	jmp LB_1355
LB_1354:
; .dlt.ptn 10'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
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
; .dlt.ptn { }
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1292
LB_1355:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2078~1'(= r ) %2077~0'(= r ) %2076~10'(= a47◂ [ *{ }] ) %2075~{ 8'(= r ) 9'(= r ) } 
; #309 { } ⊢ 0(<2)◂{ }
;; rsp=3 , %2079~0(<2)◂{ } %2078~1'(= r ) %2077~0'(= r ) %2076~10'(= a47◂ [ *{ }] ) %2075~{ 8'(= r ) 9'(= r ) } 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=3 , %2080~0(<2)◂0(<2)◂{ } %2078~1'(= r ) %2077~0'(= r ) %2076~10'(= a47◂ [ *{ }] ) %2075~{ 8'(= r ) 9'(= r ) } 
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
	call LB_1306
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
	jmp LB_1356
LB_1356:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1292
LB_1338:
	mov r14,QWORD [rsp] 
	jmp LB_1360
LB_1359:
	add r14,1 
LB_1360:
	cmp r14,r9
	jge LB_1361
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1359
LB_1361:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1363
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1363
	cmp BYTE [rdi+1],91
	jnz LB_1363
	add r14,2
	jmp LB_1362
LB_1363:
	jmp LB_1358
LB_1362:
	push r14
	jmp LB_1369
LB_1368:
	add r14,1 
LB_1369:
	cmp r14,r9
	jge LB_1370
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1368
LB_1370:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1372
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1372
	add r14,1
	jmp LB_1371
LB_1372:
	jmp LB_1367
LB_1371:
	jmp LB_1374
LB_1373:
	add r14,1 
LB_1374:
	cmp r14,r9
	jge LB_1375
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1373
LB_1375:
	call GRM_336
	cmp BYTE [r8+6],0
	jnz LB_1377
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1376
LB_1377:
; .dlt.ptn { }
	jmp LB_1367
LB_1376:
	jmp LB_1379
LB_1378:
	add r14,1 
LB_1379:
	cmp r14,r9
	jge LB_1380
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1378
LB_1380:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1382
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1381
LB_1382:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_1367
LB_1381:
	jmp LB_1384
LB_1383:
; .dlt.ptn 9'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	jmp LB_1367
LB_1384:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2086~1'(= r ) %2085~0'(= r ) %2084~9'(= a47◂ [ *{ }] ) %2083~8'(= a47◂ [ *{ }] ) 
; #311 { 8'(= a47◂ [ *{ }] ) 9'(= a47◂ [ *{ }] ) } ⊢ 2'(= a47◂ [ *{ *{ }*{ }}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= a47◂ [ *{ }] ) 9'(= a47◂ [ *{ }] ) } ⊢ { 0'(= a47◂ [ *{ }] ) 1'(= a47◂ [ *{ }] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_1387
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %2087~2'(= a47◂ [ *{ *{ }*{ }}] ) %2086~1'(= r ) %2085~0'(= r ) 
;; ? 2'(= a47◂ [ *{ *{ }*{ }}] ) ⊢ 0(<2)◂{ 3'(= *{ } ) 4'(= *{ } ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_1402
	jmp LB_1403
LB_1402:
	jmp LB_1401
LB_1403:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %2090~4'(= *{ } ) %2089~3'(= *{ } ) %2086~1'(= r ) %2085~0'(= r ) 
; #309 { } ⊢ 0(<2)◂{ }
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
; mov_ptn2.
	jmp LB_1385
LB_1401:
;; ?. 2'(= a47◂ [ *{ *{ }*{ }}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %2088~3'(= a2◂ [ *{ rr{| l |}}] ) %2086~1'(= r ) %2085~0'(= r ) 
; #314 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 10010000110.. |}
	mov r13,r9
; mov_ptn2.
	call LB_1404
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
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
	jmp LB_1412
LB_1412:
;; rsp=0 , %2094~2'(= {| l |} ) %2086~1'(= r ) %2085~0'(= r ) 
	mov rdi,LB_1413
	call emt_stg 
	jmp err
LB_1385:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1366
LB_1367:
	mov r14,QWORD [rsp]
	jmp LB_1416
LB_1415:
	jmp LB_1414
LB_1416:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2096~1'(= r ) %2095~0'(= r ) 
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
	lea rsi,[LB_1419+2-1]
	mov rcx,2
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1420+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1421+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %2099~2'(= {| l |} ) %2098~1'(= r ) %2097~0'(= r ) 
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
	jmp LB_1422
LB_1422:
;; rsp=0 , %2100~2'(= {| l |} ) %2098~1'(= r ) %2097~0'(= r ) 
	mov rdi,LB_1423
	call emt_stg 
	jmp err
LB_1417:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1366
LB_1414:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1366:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_1364
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 3'(= a47◂ [ *{ }] )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_1365
LB_1364:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1292
LB_1365:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2101~3'(= a47◂ [ *{ }] ) %2082~1'(= r ) %2081~0'(= r ) 
; #26 3'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂3'(= a47◂ [ *{ }] )
;; rsp=0 , %2102~0(<2)◂3'(= a47◂ [ *{ }] ) %2082~1'(= r ) %2081~0'(= r ) 
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
	jmp LB_1424
LB_1424:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1292
LB_1358:
	mov r14,QWORD [rsp] 
	jmp LB_1428
LB_1427:
	jmp LB_1426
LB_1428:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2104~1'(= r ) %2103~0'(= r ) 
; #309 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2105~0(<2)◂{ } %2104~1'(= r ) %2103~0'(= r ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %2106~0(<2)◂0(<2)◂{ } %2104~1'(= r ) %2103~0'(= r ) 
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
	jmp LB_1429
LB_1429:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1292
LB_1426:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1292:
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
	jmp LB_1434
LB_1433:
	add r14,1 
LB_1434:
	cmp r14,r9
	jge LB_1435
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1433
LB_1435:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1437
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1437
	cmp BYTE [rdi+1],91
	jnz LB_1437
	add r14,2
	jmp LB_1436
LB_1437:
	jmp LB_1432
LB_1436:
	push r14
	jmp LB_1443
LB_1442:
	add r14,1 
LB_1443:
	cmp r14,r9
	jge LB_1444
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1442
LB_1444:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1446
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1446
	add r14,1
	jmp LB_1445
LB_1446:
	jmp LB_1441
LB_1445:
	jmp LB_1448
LB_1447:
	add r14,1 
LB_1448:
	cmp r14,r9
	jge LB_1449
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1447
LB_1449:
	call GRM_336
	cmp BYTE [r8+6],0
	jnz LB_1451
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1450
LB_1451:
; .dlt.ptn { }
	jmp LB_1441
LB_1450:
	jmp LB_1453
LB_1452:
	add r14,1 
LB_1453:
	cmp r14,r9
	jge LB_1454
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1452
LB_1454:
	call GRM_336
	cmp BYTE [r8+6],0
	jnz LB_1456
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1455
LB_1456:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_1441
LB_1455:
	jmp LB_1458
LB_1457:
; .dlt.ptn 9'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	jmp LB_1441
LB_1458:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2112~1'(= r ) %2111~0'(= r ) %2110~9'(= a47◂ [ *{ }] ) %2109~8'(= a47◂ [ *{ }] ) 
; #311 { 8'(= a47◂ [ *{ }] ) 9'(= a47◂ [ *{ }] ) } ⊢ 2'(= a47◂ [ *{ *{ }*{ }}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= a47◂ [ *{ }] ) 9'(= a47◂ [ *{ }] ) } ⊢ { 0'(= a47◂ [ *{ }] ) 1'(= a47◂ [ *{ }] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_1387
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %2113~2'(= a47◂ [ *{ *{ }*{ }}] ) %2112~1'(= r ) %2111~0'(= r ) 
;; ? 2'(= a47◂ [ *{ *{ }*{ }}] ) ⊢ 0(<2)◂{ 3'(= *{ } ) 4'(= *{ } ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_1462
	jmp LB_1463
LB_1462:
	jmp LB_1461
LB_1463:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %2116~4'(= *{ } ) %2115~3'(= *{ } ) %2112~1'(= r ) %2111~0'(= r ) 
; #309 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2117~0(<2)◂{ } %2116~4'(= *{ } ) %2115~3'(= *{ } ) %2112~1'(= r ) %2111~0'(= r ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %2118~0(<2)◂0(<2)◂{ } %2116~4'(= *{ } ) %2115~3'(= *{ } ) %2112~1'(= r ) %2111~0'(= r ) 
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
	jmp LB_1459
LB_1461:
;; ?. 2'(= a47◂ [ *{ *{ }*{ }}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %2114~3'(= a2◂ [ *{ rr{| l |}}] ) %2112~1'(= r ) %2111~0'(= r ) 
; #314 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; {| 10010000110.. |}
	mov r13,r9
; mov_ptn2.
	call LB_1404
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %2119~2'(= {| l |} ) %2112~1'(= r ) %2111~0'(= r ) 
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
	jmp LB_1464
LB_1464:
;; rsp=0 , %2120~2'(= {| l |} ) %2112~1'(= r ) %2111~0'(= r ) 
	mov rdi,LB_1465
	call emt_stg 
	jmp err
LB_1459:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1440
LB_1441:
	mov r14,QWORD [rsp]
	jmp LB_1468
LB_1467:
	jmp LB_1466
LB_1468:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2122~1'(= r ) %2121~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2123~1(<2)◂{ } %2122~1'(= r ) %2121~0'(= r ) 
; $ %[ "blk_cmt 0" ] ⊢ %[ "blk_cmt 0" ]
;; rsp=0 , %2124~%[ "blk_cmt 0" ] %2123~1(<2)◂{ } %2122~1'(= r ) %2121~0'(= r ) 
; #25 { { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %2125~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %2126~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %2127~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
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
	jmp LB_1469
LB_1469:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1440
LB_1466:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1440:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_1438
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 3'(= a47◂ [ *{ }] )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_1439
LB_1438:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1431
LB_1439:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2128~3'(= a47◂ [ *{ }] ) %2108~1'(= r ) %2107~0'(= r ) 
; #26 3'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂3'(= a47◂ [ *{ }] )
;; rsp=0 , %2129~0(<2)◂3'(= a47◂ [ *{ }] ) %2108~1'(= r ) %2107~0'(= r ) 
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
	jmp LB_1471
LB_1471:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1431
LB_1432:
	mov r14,QWORD [rsp] 
	jmp LB_1475
LB_1474:
	add r14,1 
LB_1475:
	cmp r14,r9
	jge LB_1476
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1474
LB_1476:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1478
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1478
	cmp BYTE [rdi+1],93
	jnz LB_1478
	add r14,2
	jmp LB_1477
LB_1478:
	jmp LB_1473
LB_1477:
	push r14
	jmp LB_1484
LB_1483:
	add r14,1 
LB_1484:
	cmp r14,r9
	jge LB_1485
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1483
LB_1485:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1487
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1487
	add r14,1
	jmp LB_1486
LB_1487:
	jmp LB_1482
LB_1486:
	jmp LB_1489
LB_1488:
; .dlt.ptn { }
	jmp LB_1482
LB_1489:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2133~1'(= r ) %2132~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2134~0(<2)◂{ } %2133~1'(= r ) %2132~0'(= r ) 
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
	jmp LB_1490
LB_1490:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1481
LB_1482:
	mov r14,QWORD [rsp]
	jmp LB_1494
LB_1493:
	add r14,1 
LB_1494:
	cmp r14,r9
	jge LB_1495
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1493
LB_1495:
	cmp r14,r9
	jge LB_1497
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1496
LB_1497:
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1481
LB_1496:
	jmp LB_1499
LB_1498:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1481
LB_1499:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2137~1'(= r ) %2136~0'(= r ) %2135~8'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2138~1(<2)◂{ } %2137~1'(= r ) %2136~0'(= r ) %2135~8'(= r ) 
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
	jmp LB_1500
LB_1500:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1481
LB_1492:
	mov r14,QWORD [rsp] 
	jmp LB_1504
LB_1503:
	jmp LB_1502
LB_1504:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2140~1'(= r ) %2139~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2141~0(<2)◂{ } %2140~1'(= r ) %2139~0'(= r ) 
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
	jmp LB_1505
LB_1505:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1481
LB_1502:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1481:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_1479
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1110.. |}
; mov_ptn2.
	jmp LB_1480
LB_1479:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1431
LB_1480:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2142~{ } %2131~1'(= r ) %2130~0'(= r ) 
; #309 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2143~0(<2)◂{ } %2142~{ } %2131~1'(= r ) %2130~0'(= r ) 
; #26 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %2144~0(<2)◂0(<2)◂{ } %2142~{ } %2131~1'(= r ) %2130~0'(= r ) 
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
	jmp LB_1507
LB_1507:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1431
LB_1473:
	mov r14,QWORD [rsp] 
	jmp LB_1511
LB_1510:
	add r14,1 
LB_1511:
	cmp r14,r9
	jge LB_1512
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1510
LB_1512:
	call GRM_337
	cmp BYTE [r8+6],0
	jnz LB_1514
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1513
LB_1514:
	jmp LB_1509
LB_1513:
	jmp LB_1516
LB_1515:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1509
LB_1516:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2147~1'(= r ) %2146~0'(= r ) %2145~8'(= a47◂ [ *{ }] ) 
; #26 8'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂8'(= a47◂ [ *{ }] )
;; rsp=1 , %2148~0(<2)◂8'(= a47◂ [ *{ }] ) %2147~1'(= r ) %2146~0'(= r ) 
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
	jmp LB_1517
LB_1517:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1431
LB_1509:
	mov r14,QWORD [rsp]
	jmp LB_1521
LB_1520:
	jmp LB_1519
LB_1521:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2150~1'(= r ) %2149~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2151~1(<2)◂{ } %2150~1'(= r ) %2149~0'(= r ) 
; $ %[ "blk_cmt 1" ] ⊢ %[ "blk_cmt 1" ]
;; rsp=0 , %2152~%[ "blk_cmt 1" ] %2151~1(<2)◂{ } %2150~1'(= r ) %2149~0'(= r ) 
; #25 { { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2153~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2154~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2155~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
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
	jmp LB_1522
LB_1522:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1431
LB_1519:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1431:
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
	jmp LB_1527
LB_1526:
	add r14,1 
LB_1527:
	cmp r14,r9
	jge LB_1528
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1526
LB_1528:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1530
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1530
	add r14,1
	jmp LB_1529
LB_1530:
	jmp LB_1525
LB_1529:
	jmp LB_1532
LB_1531:
	add r14,1 
LB_1532:
	cmp r14,r9
	jge LB_1533
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1531
LB_1533:
	call GRM_336
	cmp BYTE [r8+6],0
	jnz LB_1535
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1534
LB_1535:
; .dlt.ptn { }
	jmp LB_1525
LB_1534:
	jmp LB_1537
LB_1536:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_1525
LB_1537:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2158~1'(= r ) %2157~0'(= r ) %2156~8'(= a47◂ [ *{ }] ) 
; #26 8'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂8'(= a47◂ [ *{ }] )
;; rsp=1 , %2159~0(<2)◂8'(= a47◂ [ *{ }] ) %2158~1'(= r ) %2157~0'(= r ) 
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
	jmp LB_1538
LB_1538:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1524
LB_1525:
	mov r14,QWORD [rsp]
	jmp LB_1542
LB_1541:
	add r14,1 
LB_1542:
	cmp r14,r9
	jge LB_1543
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1541
LB_1543:
	cmp r14,r9
	jge LB_1545
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1544
LB_1545:
	jmp LB_1540
LB_1544:
	jmp LB_1547
LB_1546:
	add r14,1 
LB_1547:
	cmp r14,r9
	jge LB_1548
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1546
LB_1548:
	call GRM_337
	cmp BYTE [r8+6],0
	jnz LB_1550
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1549
LB_1550:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1540
LB_1549:
	jmp LB_1552
LB_1551:
; .dlt.ptn 9'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_1540
LB_1552:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2163~1'(= r ) %2162~0'(= r ) %2161~9'(= a47◂ [ *{ }] ) %2160~8'(= r ) 
; #26 9'(= a47◂ [ *{ }] ) ⊢ 0(<2)◂9'(= a47◂ [ *{ }] )
;; rsp=2 , %2164~0(<2)◂9'(= a47◂ [ *{ }] ) %2163~1'(= r ) %2162~0'(= r ) %2160~8'(= r ) 
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
	jmp LB_1553
LB_1553:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1524
LB_1540:
	mov r14,QWORD [rsp]
	jmp LB_1557
LB_1556:
	jmp LB_1555
LB_1557:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2166~1'(= r ) %2165~0'(= r ) 
; $ %[ "line_res_c 0" ] ⊢ %[ "line_res_c 0" ]
;; rsp=0 , %2167~%[ "line_res_c 0" ] %2166~1'(= r ) %2165~0'(= r ) 
; #10 %[ "line_res_c 0" ] ⊢ %[ "line_res_c 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_1560
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_1561
LB_1561:
;; rsp=0 , %2168~%[ "line_res_c 0" ] %2166~1'(= r ) %2165~0'(= r ) 
	mov rdi,LB_1562
	call emt_stg 
	jmp err
LB_1558:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1524
LB_1555:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1524:
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
	jmp LB_1566
LB_1565:
	add r14,1 
LB_1566:
	cmp r14,r9
	jge LB_1567
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1565
LB_1567:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1569
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1569
	add r14,1
	jmp LB_1568
LB_1569:
	jmp LB_1564
LB_1568:
	jmp LB_1571
LB_1570:
; .dlt.ptn { }
	jmp LB_1564
LB_1571:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2170~1'(= r ) %2169~0'(= r ) 
; #26 { 0'(= r ) 1'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 1'(= r ) }
;; rsp=0 , %2171~0(<2)◂{ 0'(= r ) 1'(= r ) } 
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
	jmp LB_1572
LB_1572:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1563
LB_1564:
	mov r14,QWORD [rsp]
	jmp LB_1576
LB_1575:
	add r14,1 
LB_1576:
	cmp r14,r9
	jge LB_1577
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1575
LB_1577:
	cmp r14,r9
	jge LB_1579
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1578
LB_1579:
	jmp LB_1574
LB_1578:
	jmp LB_1581
LB_1580:
	add r14,1 
LB_1581:
	cmp r14,r9
	jge LB_1582
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1580
LB_1582:
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_1584
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
	jmp LB_1583
LB_1584:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1574
LB_1583:
	jmp LB_1586
LB_1585:
; .dlt.ptn { 9'(= r ) 10'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_1574
LB_1586:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2176~1'(= r ) %2175~0'(= r ) %2174~10'(= r ) %2173~9'(= r ) %2172~8'(= r ) 
; #26 { 0'(= r ) 10'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 10'(= r ) }
;; rsp=3 , %2177~0(<2)◂{ 0'(= r ) 10'(= r ) } %2176~1'(= r ) %2173~9'(= r ) %2172~8'(= r ) 
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
	jmp LB_1587
LB_1587:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1563
LB_1574:
	mov r14,QWORD [rsp]
	jmp LB_1591
LB_1590:
	jmp LB_1589
LB_1591:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2179~1'(= r ) %2178~0'(= r ) 
; #26 { 0'(= r ) 1'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 1'(= r ) }
;; rsp=0 , %2180~0(<2)◂{ 0'(= r ) 1'(= r ) } 
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
	jmp LB_1592
LB_1592:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1563
LB_1589:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1563:
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
	jmp LB_1597
LB_1596:
	add r14,1 
LB_1597:
	cmp r14,r9
	jge LB_1598
	JZ_SPC BYTE [r13+8+r14], LB_1596
LB_1598:
	lea rax,[r14+7]
	cmp rax,r9
	jg LB_1600
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1600
	cmp BYTE [rdi+1],167
	jnz LB_1600
	cmp BYTE [rdi+2],194
	jnz LB_1600
	cmp BYTE [rdi+3],167
	jnz LB_1600
	cmp BYTE [rdi+4],43
	jnz LB_1600
	cmp BYTE [rdi+5],115
	jnz LB_1600
	cmp BYTE [rdi+6],56
	jnz LB_1600
	add r14,7
	jmp LB_1599
LB_1600:
	jmp LB_1595
LB_1599:
	jmp LB_1602
LB_1601:
; .dlt.ptn { }
	jmp LB_1595
LB_1602:
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
	jmp LB_1603
LB_1603:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1594
LB_1595:
	mov r14,QWORD [rsp]
	jmp LB_1607
LB_1606:
	add r14,1 
LB_1607:
	cmp r14,r9
	jge LB_1608
	JZ_SPC BYTE [r13+8+r14], LB_1606
LB_1608:
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_1610
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1610
	cmp BYTE [rdi+1],167
	jnz LB_1610
	cmp BYTE [rdi+2],194
	jnz LB_1610
	cmp BYTE [rdi+3],167
	jnz LB_1610
	add r14,4
	jmp LB_1609
LB_1610:
	jmp LB_1605
LB_1609:
	jmp LB_1612
LB_1611:
; .dlt.ptn { }
	jmp LB_1605
LB_1612:
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
	jmp LB_1613
LB_1613:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1594
LB_1605:
	mov r14,QWORD [rsp]
	jmp LB_1617
LB_1616:
	add r14,1 
LB_1617:
	cmp r14,r9
	jge LB_1618
	JZ_SPC BYTE [r13+8+r14], LB_1616
LB_1618:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1620
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1620
	cmp BYTE [rdi+1],167
	jnz LB_1620
	add r14,2
	jmp LB_1619
LB_1620:
	jmp LB_1615
LB_1619:
	jmp LB_1622
LB_1621:
; .dlt.ptn { }
	jmp LB_1615
LB_1622:
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
	jmp LB_1623
LB_1623:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1594
LB_1615:
	mov r14,QWORD [rsp]
	jmp LB_1627
LB_1626:
	add r14,1 
LB_1627:
	cmp r14,r9
	jge LB_1628
	JZ_SPC BYTE [r13+8+r14], LB_1626
LB_1628:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1630
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1630
	cmp BYTE [rdi+1],182
	jnz LB_1630
	add r14,2
	jmp LB_1629
LB_1630:
	jmp LB_1625
LB_1629:
	jmp LB_1632
LB_1631:
; .dlt.ptn { }
	jmp LB_1625
LB_1632:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2191~1'(= r ) %2190~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2192~0(<2)◂{ } %2191~1'(= r ) %2190~0'(= r ) 
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
	jmp LB_1633
LB_1633:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1594
LB_1625:
	mov r14,QWORD [rsp]
	jmp LB_1637
LB_1636:
	add r14,1 
LB_1637:
	cmp r14,r9
	jge LB_1638
	JZ_SPC BYTE [r13+8+r14], LB_1636
LB_1638:
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_1640
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1640
	cmp BYTE [rdi+1],136
	jnz LB_1640
	cmp BYTE [rdi+2],142
	jnz LB_1640
	cmp BYTE [rdi+3],226
	jnz LB_1640
	cmp BYTE [rdi+4],136
	jnz LB_1640
	cmp BYTE [rdi+5],142
	jnz LB_1640
	add r14,6
	jmp LB_1639
LB_1640:
	jmp LB_1635
LB_1639:
	jmp LB_1642
LB_1641:
; .dlt.ptn { }
	jmp LB_1635
LB_1642:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2194~1'(= r ) %2193~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2195~0(<2)◂{ } %2194~1'(= r ) %2193~0'(= r ) 
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
	jmp LB_1643
LB_1643:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1594
LB_1635:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1594:
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
	jmp LB_1648
LB_1647:
	add r14,1 
LB_1648:
	cmp r14,r9
	jge LB_1649
	JZ_SPC BYTE [r13+8+r14], LB_1647
LB_1649:
	call GRM_339
	cmp BYTE [r8+6],0
	jnz LB_1651
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_1650
LB_1651:
	jmp LB_1646
LB_1650:
	jmp LB_1653
LB_1652:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1645
LB_1653:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2198~1'(= r ) %2197~0'(= r ) %2196~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2199~1(<2)◂{ } %2198~1'(= r ) %2197~0'(= r ) %2196~{ } 
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
	jmp LB_1654
LB_1654:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1645
LB_1646:
	mov r14,QWORD [rsp] 
	jmp LB_1658
LB_1657:
	add r14,1 
LB_1658:
	cmp r14,r9
	jge LB_1659
	JZ_SPC BYTE [r13+8+r14], LB_1657
LB_1659:
	cmp r14,r9
	jge LB_1661
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1660
LB_1661:
	jmp LB_1656
LB_1660:
	jmp LB_1663
LB_1662:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1656
LB_1663:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2202~1'(= r ) %2201~0'(= r ) %2200~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2203~0(<2)◂{ } %2202~1'(= r ) %2201~0'(= r ) %2200~8'(= r ) 
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
	jmp LB_1664
LB_1664:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1645
LB_1656:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1645:
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
	jmp LB_1669
LB_1668:
	add r14,1 
LB_1669:
	cmp r14,r9
	jge LB_1670
	JZ_SPC BYTE [r13+8+r14], LB_1668
LB_1670:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1672
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_1672
	add r14,1
	jmp LB_1671
LB_1672:
	jmp LB_1667
LB_1671:
	jmp LB_1674
LB_1673:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1666
LB_1674:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2206~1'(= r ) %2205~0'(= r ) %2204~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2207~1(<2)◂{ } %2206~1'(= r ) %2205~0'(= r ) %2204~{ } 
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
	jmp LB_1675
LB_1675:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1666
LB_1667:
	mov r14,QWORD [rsp] 
	jmp LB_1679
LB_1678:
	add r14,1 
LB_1679:
	cmp r14,r9
	jge LB_1680
	JZ_SPC BYTE [r13+8+r14], LB_1678
LB_1680:
	call GRM_339
	cmp BYTE [r8+6],0
	jnz LB_1682
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_1681
LB_1682:
	jmp LB_1677
LB_1681:
	jmp LB_1684
LB_1683:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1666
LB_1684:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2210~1'(= r ) %2209~0'(= r ) %2208~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2211~1(<2)◂{ } %2210~1'(= r ) %2209~0'(= r ) %2208~{ } 
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
	jmp LB_1685
LB_1685:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1666
LB_1677:
	mov r14,QWORD [rsp] 
	jmp LB_1689
LB_1688:
	add r14,1 
LB_1689:
	cmp r14,r9
	jge LB_1690
	JZ_SPC BYTE [r13+8+r14], LB_1688
LB_1690:
	cmp r14,r9
	jge LB_1692
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1691
LB_1692:
	jmp LB_1687
LB_1691:
	jmp LB_1694
LB_1693:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1687
LB_1694:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2214~1'(= r ) %2213~0'(= r ) %2212~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2215~0(<2)◂{ } %2214~1'(= r ) %2213~0'(= r ) %2212~8'(= r ) 
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
	jmp LB_1695
LB_1695:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1666
LB_1687:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1666:
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
	jmp LB_1700
LB_1699:
	add r14,1 
LB_1700:
	cmp r14,r9
	jge LB_1701
	JZ_SPC BYTE [r13+8+r14], LB_1699
LB_1701:
	call GRM_341
	cmp BYTE [r8+6],0
	jnz LB_1703
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_1702
LB_1703:
	jmp LB_1698
LB_1702:
	jmp LB_1705
LB_1704:
	add r14,1 
LB_1705:
	cmp r14,r9
	jge LB_1706
	JZ_SPC BYTE [r13+8+r14], LB_1704
LB_1706:
	call GRM_342
	cmp BYTE [r8+6],0
	jnz LB_1708
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_1707
LB_1708:
; .dlt.ptn { }
	jmp LB_1698
LB_1707:
	jmp LB_1710
LB_1709:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_1698
LB_1710:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2219~1'(= r ) %2218~0'(= r ) %2217~{ } %2216~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2220~0(<2)◂{ } %2219~1'(= r ) %2218~0'(= r ) %2217~{ } %2216~{ } 
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
	jmp LB_1711
LB_1711:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1697
LB_1698:
	mov r14,QWORD [rsp]
	jmp LB_1715
LB_1714:
	jmp LB_1713
LB_1715:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2222~1'(= r ) %2221~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2223~0(<2)◂{ } %2222~1'(= r ) %2221~0'(= r ) 
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
	jmp LB_1716
LB_1716:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1697
LB_1713:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1697:
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
	jmp LB_1721
LB_1720:
	add r14,1 
LB_1721:
	cmp r14,r9
	jge LB_1722
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1720
LB_1722:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1724
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1724
	add r14,1
	jmp LB_1723
LB_1724:
	jmp LB_1719
LB_1723:
	jmp LB_1726
LB_1725:
; .dlt.ptn { }
	jmp LB_1719
LB_1726:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2226~1'(= r ) %2225~0'(= r ) %2224~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2227~0(<2)◂{ } %2226~1'(= r ) %2225~0'(= r ) %2224~{ } 
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
	jmp LB_1727
LB_1727:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1718
LB_1719:
	mov r14,QWORD [rsp]
	jmp LB_1731
LB_1730:
	add r14,1 
LB_1731:
	cmp r14,r9
	jge LB_1732
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1730
LB_1732:
	call GRM_339
	cmp BYTE [r8+6],0
	jnz LB_1734
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_1733
LB_1734:
	jmp LB_1729
LB_1733:
	jmp LB_1736
LB_1735:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1718
LB_1736:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2230~1'(= r ) %2229~0'(= r ) %2228~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2231~1(<2)◂{ } %2230~1'(= r ) %2229~0'(= r ) %2228~{ } 
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
	jmp LB_1737
LB_1737:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1718
LB_1729:
	mov r14,QWORD [rsp] 
	jmp LB_1741
LB_1740:
	add r14,1 
LB_1741:
	cmp r14,r9
	jge LB_1742
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1740
LB_1742:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1744
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_1744
	add r14,1
	jmp LB_1743
LB_1744:
	jmp LB_1739
LB_1743:
	jmp LB_1746
LB_1745:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1718
LB_1746:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2234~1'(= r ) %2233~0'(= r ) %2232~{ } 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2235~1(<2)◂{ } %2234~1'(= r ) %2233~0'(= r ) %2232~{ } 
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
	jmp LB_1747
LB_1747:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1718
LB_1739:
	mov r14,QWORD [rsp] 
	jmp LB_1751
LB_1750:
	add r14,1 
LB_1751:
	cmp r14,r9
	jge LB_1752
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1750
LB_1752:
	cmp r14,r9
	jge LB_1754
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1753
LB_1754:
	jmp LB_1749
LB_1753:
	jmp LB_1756
LB_1755:
	add r14,1 
LB_1756:
	cmp r14,r9
	jge LB_1757
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1755
LB_1757:
	call GRM_343
	cmp BYTE [r8+6],0
	jnz LB_1759
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1111000010.. |}
; mov_ptn2.
	jmp LB_1758
LB_1759:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1749
LB_1758:
	jmp LB_1761
LB_1760:
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1749
LB_1761:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2239~1'(= r ) %2238~0'(= r ) %2237~{ } %2236~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2240~0(<2)◂{ } %2239~1'(= r ) %2238~0'(= r ) %2237~{ } %2236~8'(= r ) 
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
	jmp LB_1762
LB_1762:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1718
LB_1749:
	mov r14,QWORD [rsp]
	jmp LB_1766
LB_1765:
	add r14,1 
LB_1766:
	cmp r14,r9
	jge LB_1767
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1765
LB_1767:
	cmp r14,r9
	jge LB_1769
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1768
LB_1769:
	jmp LB_1764
LB_1768:
	jmp LB_1771
LB_1770:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1764
LB_1771:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2243~1'(= r ) %2242~0'(= r ) %2241~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2244~0(<2)◂{ } %2243~1'(= r ) %2242~0'(= r ) %2241~8'(= r ) 
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
	jmp LB_1772
LB_1772:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1718
LB_1764:
	mov r14,QWORD [rsp]
	jmp LB_1776
LB_1775:
	jmp LB_1774
LB_1776:
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
	jmp LB_1777
LB_1777:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1718
LB_1774:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1718:
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
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1782
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1782
	cmp BYTE [rdi+1],167
	jnz LB_1782
	cmp BYTE [rdi+2],126
	jnz LB_1782
	add r14,3
	jmp LB_1781
LB_1782:
	jmp LB_1780
LB_1781:
	jmp LB_1784
LB_1783:
; .dlt.ptn { }
	jmp LB_1780
LB_1784:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2249~1'(= r ) %2248~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2250~0(<2)◂{ } %2249~1'(= r ) %2248~0'(= r ) 
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
	jmp LB_1785
LB_1785:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1779
LB_1780:
	mov r14,QWORD [rsp]
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1789
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1789
	cmp BYTE [rdi+1],167
	jnz LB_1789
	cmp BYTE [rdi+2],37
	jnz LB_1789
	add r14,3
	jmp LB_1788
LB_1789:
	jmp LB_1787
LB_1788:
	jmp LB_1791
LB_1790:
; .dlt.ptn { }
	jmp LB_1787
LB_1791:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2252~1'(= r ) %2251~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2253~0(<2)◂{ } %2252~1'(= r ) %2251~0'(= r ) 
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
	jmp LB_1792
LB_1792:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1779
LB_1787:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1779:
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
	jmp LB_1797
LB_1796:
	add r14,1 
LB_1797:
	cmp r14,r9
	jge LB_1798
	JZ_SPC BYTE [r13+8+r14], LB_1796
LB_1798:
	call GRM_346
	cmp BYTE [r8+6],0
	jnz LB_1800
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1799
LB_1800:
	jmp LB_1795
LB_1799:
	jmp LB_1802
LB_1801:
	add r14,1 
LB_1802:
	cmp r14,r9
	jge LB_1803
	JZ_SPC BYTE [r13+8+r14], LB_1801
LB_1803:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1805
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],42
	jnz LB_1805
	add r14,1
	jmp LB_1804
LB_1805:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1795
LB_1804:
	jmp LB_1807
LB_1806:
	add r14,1 
LB_1807:
	cmp r14,r9
	jge LB_1808
	JZ_SPC BYTE [r13+8+r14], LB_1806
LB_1808:
	call GRM_101
	cmp BYTE [r8+6],0
	jnz LB_1810
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1809
LB_1810:
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1794
LB_1809:
	jmp LB_1812
LB_1811:
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1794
LB_1812:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2257~1'(= r ) %2256~0'(= r ) %2255~9'(= {| l |} ) %2254~8'(= r ) 
; #181 9'(= {| l |} ) ⊢ 4(<7)◂9'(= {| l |} )
;; rsp=2 , %2258~4(<7)◂9'(= {| l |} ) %2257~1'(= r ) %2256~0'(= r ) %2254~8'(= r ) 
; #194 { 8'(= r ) 4(<7)◂9'(= {| l |} ) } ⊢ 2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) }
;; rsp=2 , %2259~2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) } %2257~1'(= r ) %2256~0'(= r ) 
; #26 2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) } ⊢ 0(<2)◂2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) }
;; rsp=2 , %2260~0(<2)◂2(<3)◂{ 8'(= r ) 4(<7)◂9'(= {| l |} ) } %2257~1'(= r ) %2256~0'(= r ) 
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
	jmp LB_1813
LB_1813:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1794
LB_1795:
	mov r14,QWORD [rsp] 
	jmp LB_1817
LB_1816:
	add r14,1 
LB_1817:
	cmp r14,r9
	jge LB_1818
	JZ_SPC BYTE [r13+8+r14], LB_1816
LB_1818:
	call GRM_348
	cmp BYTE [r8+6],0
	jnz LB_1820
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1819
LB_1820:
	jmp LB_1815
LB_1819:
	jmp LB_1822
LB_1821:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1815
LB_1822:
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
	jmp LB_1823
LB_1823:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1794
LB_1815:
	mov r14,QWORD [rsp]
	jmp LB_1827
LB_1826:
	add r14,1 
LB_1827:
	cmp r14,r9
	jge LB_1828
	JZ_SPC BYTE [r13+8+r14], LB_1826
LB_1828:
	call GRM_101
	cmp BYTE [r8+6],0
	jnz LB_1830
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1829
LB_1830:
	jmp LB_1825
LB_1829:
	jmp LB_1832
LB_1831:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1825
LB_1832:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2269~1'(= r ) %2268~0'(= r ) %2267~8'(= {| l |} ) 
; #181 8'(= {| l |} ) ⊢ 4(<7)◂8'(= {| l |} )
;; rsp=1 , %2270~4(<7)◂8'(= {| l |} ) %2269~1'(= r ) %2268~0'(= r ) 
; #196 4(<7)◂8'(= {| l |} ) ⊢ 0(<3)◂4(<7)◂8'(= {| l |} )
;; rsp=1 , %2271~0(<3)◂4(<7)◂8'(= {| l |} ) %2269~1'(= r ) %2268~0'(= r ) 
; #26 0(<3)◂4(<7)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} )
;; rsp=1 , %2272~0(<2)◂0(<3)◂4(<7)◂8'(= {| l |} ) %2269~1'(= r ) %2268~0'(= r ) 
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
	jmp LB_1833
LB_1833:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1794
LB_1825:
	mov r14,QWORD [rsp]
	jmp LB_1837
LB_1836:
	add r14,1 
LB_1837:
	cmp r14,r9
	jge LB_1838
	JZ_SPC BYTE [r13+8+r14], LB_1836
LB_1838:
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_1840
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1839
LB_1840:
	jmp LB_1835
LB_1839:
	jmp LB_1842
LB_1841:
; .dlt.ptn 8'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1835
LB_1842:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2275~1'(= r ) %2274~0'(= r ) %2273~8'(= a18◂ [ ] ) 
; #180 8'(= a18◂ [ ] ) ⊢ 5(<7)◂8'(= a18◂ [ ] )
;; rsp=1 , %2276~5(<7)◂8'(= a18◂ [ ] ) %2275~1'(= r ) %2274~0'(= r ) 
; #196 5(<7)◂8'(= a18◂ [ ] ) ⊢ 0(<3)◂5(<7)◂8'(= a18◂ [ ] )
;; rsp=1 , %2277~0(<3)◂5(<7)◂8'(= a18◂ [ ] ) %2275~1'(= r ) %2274~0'(= r ) 
; #26 0(<3)◂5(<7)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂0(<3)◂5(<7)◂8'(= a18◂ [ ] )
;; rsp=1 , %2278~0(<2)◂0(<3)◂5(<7)◂8'(= a18◂ [ ] ) %2275~1'(= r ) %2274~0'(= r ) 
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
	jmp LB_1843
LB_1843:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1794
LB_1835:
	mov r14,QWORD [rsp]
	jmp LB_1847
LB_1846:
	add r14,1 
LB_1847:
	cmp r14,r9
	jge LB_1848
	JZ_SPC BYTE [r13+8+r14], LB_1846
LB_1848:
	call GRM_347
	cmp BYTE [r8+6],0
	jnz LB_1850
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
	jmp LB_1849
LB_1850:
	jmp LB_1845
LB_1849:
	jmp LB_1852
LB_1851:
; .dlt.ptn { 8'(= a22◂ [ ] ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_619
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_1845
LB_1852:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2281~1'(= r ) %2280~0'(= r ) %2279~{ 8'(= a22◂ [ ] ) 9'(= r ) } 
; #195 { 8'(= a22◂ [ ] ) 9'(= r ) } ⊢ 1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) }
;; rsp=2 , %2282~1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) } %2281~1'(= r ) %2280~0'(= r ) 
; #26 1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) } ⊢ 0(<2)◂1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) }
;; rsp=2 , %2283~0(<2)◂1(<3)◂{ 8'(= a22◂ [ ] ) 9'(= r ) } %2281~1'(= r ) %2280~0'(= r ) 
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
	jmp LB_1853
LB_1853:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1794
LB_1845:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1794:
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
	jge LB_1858
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_1858
	add r14,rsi
	push rdi
	jmp LB_1857
LB_1858:
	jmp LB_1856
LB_1857:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1860
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_1860
	add r14,1
	jmp LB_1859
LB_1860:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1856
LB_1859:
	jmp LB_1862
LB_1861:
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1856
LB_1862:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2286~1'(= r ) %2285~0'(= r ) %2284~8'(= r ) 
; #26 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %2287~0(<2)◂8'(= r ) %2286~1'(= r ) %2285~0'(= r ) 
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
	jmp LB_1863
LB_1863:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1855
LB_1856:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1855:
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
	cmp r14,r9
	jge LB_1868
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_1868
	add r14,rsi
	push rdi
	jmp LB_1867
LB_1868:
	jmp LB_1866
LB_1867:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1870
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],100
	jnz LB_1870
	cmp BYTE [rdi+1],39
	jnz LB_1870
	add r14,2
	jmp LB_1869
LB_1870:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1866
LB_1869:
	jmp LB_1872
LB_1871:
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1866
LB_1872:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2290~1'(= r ) %2289~0'(= r ) %2288~8'(= r ) 
; #199 { } ⊢ 1(<4)◂{ }
;; rsp=1 , %2291~1(<4)◂{ } %2290~1'(= r ) %2289~0'(= r ) %2288~8'(= r ) 
; #26 { 1(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 1(<4)◂{ } 8'(= r ) }
;; rsp=1 , %2292~0(<2)◂{ 1(<4)◂{ } 8'(= r ) } %2290~1'(= r ) %2289~0'(= r ) 
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
	jmp LB_1873
LB_1873:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1865
LB_1866:
	mov r14,QWORD [rsp]
	cmp r14,r9
	jge LB_1877
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_1877
	add r14,rsi
	push rdi
	jmp LB_1876
LB_1877:
	jmp LB_1875
LB_1876:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1879
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
	jnz LB_1879
	cmp BYTE [rdi+1],39
	jnz LB_1879
	add r14,2
	jmp LB_1878
LB_1879:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1875
LB_1878:
	jmp LB_1881
LB_1880:
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1875
LB_1881:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2295~1'(= r ) %2294~0'(= r ) %2293~8'(= r ) 
; #198 { } ⊢ 2(<4)◂{ }
;; rsp=1 , %2296~2(<4)◂{ } %2295~1'(= r ) %2294~0'(= r ) %2293~8'(= r ) 
; #26 { 2(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 2(<4)◂{ } 8'(= r ) }
;; rsp=1 , %2297~0(<2)◂{ 2(<4)◂{ } 8'(= r ) } %2295~1'(= r ) %2294~0'(= r ) 
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
	jmp LB_1882
LB_1882:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1865
LB_1875:
	mov r14,QWORD [rsp]
	cmp r14,r9
	jge LB_1886
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_1886
	add r14,rsi
	push rdi
	jmp LB_1885
LB_1886:
	jmp LB_1884
LB_1885:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1888
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_1888
	add r14,1
	jmp LB_1887
LB_1888:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1884
LB_1887:
	jmp LB_1890
LB_1889:
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1884
LB_1890:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2300~1'(= r ) %2299~0'(= r ) %2298~8'(= r ) 
; #200 { } ⊢ 0(<4)◂{ }
;; rsp=1 , %2301~0(<4)◂{ } %2300~1'(= r ) %2299~0'(= r ) %2298~8'(= r ) 
; #26 { 0(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 0(<4)◂{ } 8'(= r ) }
;; rsp=1 , %2302~0(<2)◂{ 0(<4)◂{ } 8'(= r ) } %2300~1'(= r ) %2299~0'(= r ) 
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
	jmp LB_1891
LB_1891:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1865
LB_1884:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1865:
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
	jg LB_1896
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],96
	jnz LB_1896
	add r14,1
	jmp LB_1895
LB_1896:
	jmp LB_1894
LB_1895:
	call GRM_349
	cmp BYTE [r8+6],0
	jnz LB_1898
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 8'(= a14◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1897
LB_1898:
; .dlt.ptn { }
	jmp LB_1894
LB_1897:
	jmp LB_1900
LB_1899:
; .dlt.ptn 8'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_1894
LB_1900:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2305~1'(= r ) %2304~0'(= r ) %2303~8'(= a14◂ [ ] ) 
; #74 8'(= a14◂ [ ] ) ⊢ { 3'(= a14◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 8'(= a14◂ [ ] ) ⊢ 0'(= a14◂ [ ] )
; {| 100000001110.. |}
	mov r13,QWORD [rsp-8+8*3]
; mov_ptn2.
	call LB_83
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
	add rsp,24
;; rsp=0 , %2307~2'(= {| l |} ) %2306~3'(= a14◂ [ ] ) %2305~1'(= r ) %2304~0'(= r ) 
; #26 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %2308~0(<2)◂2'(= {| l |} ) %2306~3'(= a14◂ [ ] ) %2305~1'(= r ) %2304~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .dlt.ptn 3'(= a14◂ [ ] )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
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
	jmp LB_1901
LB_1901:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1893
LB_1894:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1893:
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
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1906
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1906
	add r14,1
	jmp LB_1905
LB_1906:
	jmp LB_1904
LB_1905:
	jmp LB_1908
LB_1907:
; .dlt.ptn { }
	jmp LB_1904
LB_1908:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2310~1'(= r ) %2309~0'(= r ) 
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %2311~%[ 10r ] %2310~1'(= r ) %2309~0'(= r ) 
; #63 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %2312~2(<4)◂{ } %2311~%[ 10r ] %2310~1'(= r ) %2309~0'(= r ) 
; #71 { %[ 10r ] 2(<4)◂{ } } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { %[ 10r ] 2(<4)◂{ } } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 11000000110.. |}
	mov r14,unt_2
	mov r13,10
; mov_ptn2.
	call LB_67
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=0 , %2313~2'(= a14◂ [ ] ) %2310~1'(= r ) %2309~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %2314~0(<2)◂2'(= a14◂ [ ] ) %2310~1'(= r ) %2309~0'(= r ) 
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
	jmp LB_1909
LB_1909:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1903
LB_1904:
	mov r14,QWORD [rsp]
	cmp r14,r9
	jge LB_1913
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1912
LB_1913:
	jmp LB_1911
LB_1912:
	call GRM_349
	cmp BYTE [r8+6],0
	jnz LB_1915
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a14◂ [ ] ) ⊢ 9'(= a14◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1914
LB_1915:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1911
LB_1914:
	jmp LB_1917
LB_1916:
; .dlt.ptn 9'(= a14◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_8
	C_POP_REGS
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_1911
LB_1917:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2318~1'(= r ) %2317~0'(= r ) %2316~9'(= a14◂ [ ] ) %2315~8'(= r ) 
; #71 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ 2'(= a14◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= r ) 9'(= a14◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a14◂ [ ] ) }
; {| 1100000011110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_67
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=0 , %2319~2'(= a14◂ [ ] ) %2318~1'(= r ) %2317~0'(= r ) 
; #26 2'(= a14◂ [ ] ) ⊢ 0(<2)◂2'(= a14◂ [ ] )
;; rsp=0 , %2320~0(<2)◂2'(= a14◂ [ ] ) %2318~1'(= r ) %2317~0'(= r ) 
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
	jmp LB_1918
LB_1918:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1903
LB_1911:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1903:
; discard r14
	add rsp,8
	ret
LB_1952:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1956+8*rax]
LB_1956: dq LB_1953,LB_1954,LB_1955
LB_1953:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_478
	jmp LB_1957
LB_1954:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_619
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1957
LB_1955:
	push r8
	mov r8,QWORD [r8+8+8*0]
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_478
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1957
LB_1957:
	ret
LB_1960:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_1963+8*rax]
LB_1963: dq LB_1961,LB_1962
LB_1961:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1952
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1960
	pop r8 
	FREE_RCD 2, r8
	jmp LB_1964
LB_1962:
	jmp LB_1964
LB_1964:
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
	jmp LB_1923
LB_1922:
	add r14,1 
LB_1923:
	cmp r14,r9
	jge LB_1924
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1922
LB_1924:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1926
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1925
LB_1926:
	jmp LB_1921
LB_1925:
	jmp LB_1928
LB_1927:
	add r14,1 
LB_1928:
	cmp r14,r9
	jge LB_1929
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1927
LB_1929:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1931
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],47
	jnz LB_1931
	cmp BYTE [rdi+1],47
	jnz LB_1931
	add r14,2
	jmp LB_1930
LB_1931:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1921
LB_1930:
	jmp LB_1933
LB_1932:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1921
LB_1933:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2323~1'(= r ) %2322~0'(= r ) %2321~8'(= a47◂ [ *{ }] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2324~1(<2)◂{ } %2323~1'(= r ) %2322~0'(= r ) %2321~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=1 , %2325~0(<2)◂1(<2)◂{ } %2323~1'(= r ) %2322~0'(= r ) %2321~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_1934
LB_1934:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1920
LB_1921:
	mov r14,QWORD [rsp]
	jmp LB_1938
LB_1937:
	add r14,1 
LB_1938:
	cmp r14,r9
	jge LB_1939
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1937
LB_1939:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1941
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1940
LB_1941:
	jmp LB_1936
LB_1940:
	jmp LB_1943
LB_1942:
	add r14,1 
LB_1943:
	cmp r14,r9
	jge LB_1944
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1942
LB_1944:
	call GRM_345
	cmp BYTE [r8+6],0
	jnz LB_1946
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a23◂ [ a18◂ [ ]] ) ⊢ 9'(= a23◂ [ a18◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1945
LB_1946:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1936
LB_1945:
	jmp LB_1948
LB_1947:
	add r14,1 
LB_1948:
	cmp r14,r9
	jge LB_1949
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1947
LB_1949:
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_1951
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) ⊢ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1950
LB_1951:
; .dlt.ptn 9'(= a23◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1952
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_1936
LB_1950:
	jmp LB_1959
LB_1958:
; .dlt.ptn 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1960
	C_POP_REGS
; .dlt.ptn 9'(= a23◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1952
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_1936
LB_1959:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2330~1'(= r ) %2329~0'(= r ) %2328~10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) %2327~9'(= a23◂ [ a18◂ [ ]] ) %2326~8'(= a47◂ [ *{ }] ) 
; #25 { 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } ⊢ 0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) }
;; rsp=3 , %2331~0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } %2330~1'(= r ) %2329~0'(= r ) %2326~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } ⊢ 0(<2)◂0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) }
;; rsp=3 , %2332~0(<2)◂0(<2)◂{ 9'(= a23◂ [ a18◂ [ ]] ) 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) } %2330~1'(= r ) %2329~0'(= r ) %2326~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_1965
LB_1965:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1920
LB_1936:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1920:
; discard r14
	add rsp,8
	ret
LB_2042:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2045+8*rax]
LB_2045: dq LB_2043,LB_2044
LB_2043:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2047
	jmp LB_2046
LB_2044:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1311
	jmp LB_2046
LB_2046:
	ret
LB_2047:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2050+8*rax]
LB_2050: dq LB_2048,LB_2049
LB_2048:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2052
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2053
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2047
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2051
LB_2049:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2052
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2053
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2051
LB_2051:
	ret
LB_2053:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2057+8*rax]
LB_2057: dq LB_2054,LB_2055,LB_2056
LB_2054:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2047
	jmp LB_2058
LB_2055:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_843
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2059
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2058
LB_2056:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2060
	jmp LB_2058
LB_2058:
	ret
LB_2060:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2068+8*rax]
LB_2068: dq LB_2061,LB_2062,LB_2063,LB_2064,LB_2065,LB_2066,LB_2067
LB_2061:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_355
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_843
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2069
LB_2062:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_848
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_843
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2069
LB_2063:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2070
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2060
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2069
LB_2064:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2047
	jmp LB_2069
LB_2065:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_843
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2071
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2069
LB_2066:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2072
	jmp LB_2069
LB_2067:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	jmp LB_2069
LB_2069:
	ret
LB_2072:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2075+8*rax]
LB_2075: dq LB_2073,LB_2074
LB_2073:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_843
	jmp LB_2076
LB_2074:
	jmp LB_2076
LB_2076:
	ret
LB_2071:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2079+8*rax]
LB_2079: dq LB_2077,LB_2078
LB_2077:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2059
	jmp LB_2080
LB_2078:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_976
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2060
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2080
LB_2080:
	ret
LB_2070:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2085+8*rax]
LB_2085: dq LB_2081,LB_2082,LB_2083,LB_2084
LB_2081:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_355
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_843
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_981
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2086
LB_2082:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_848
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_843
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_981
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2086
LB_2083:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_478
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_843
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_981
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2086
LB_2084:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1960
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_907
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1071
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2086
LB_2086:
	ret
LB_2059:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2089+8*rax]
LB_2089: dq LB_2087,LB_2088
LB_2087:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_466
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2052
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2053
	pop r8 
	FREE_RCD 3, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2059
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2090
LB_2088:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_466
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2052
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2053
	pop r8 
	FREE_RCD 3, r8
	jmp LB_2090
LB_2090:
	ret
LB_2052:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2093+8*rax]
LB_2093: dq LB_2091,LB_2092
LB_2091:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2095
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2052
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2094
LB_2092:
	jmp LB_2094
LB_2094:
	ret
LB_2095:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2099+8*rax]
LB_2099: dq LB_2096,LB_2097,LB_2098
LB_2096:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_843
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_466
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2100
LB_2097:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2101
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2101
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2100
LB_2098:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2101
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2101
	pop r8 
	FREE_RCD 2, r8
	jmp LB_2100
LB_2100:
	ret
LB_2101:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2104+8*rax]
LB_2104: dq LB_2102,LB_2103
LB_2102:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_478
	jmp LB_2105
LB_2103:
	mov rdi,r8
	call free_s8
	jmp LB_2105
LB_2105:
	ret
LB_2152:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2155+8*rax]
LB_2155: dq LB_2153,LB_2154
LB_2153:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2059
	jmp LB_2156
LB_2154:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1311
	jmp LB_2156
LB_2156:
	ret
LB_2185:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2188+8*rax]
LB_2188: dq LB_2186,LB_2187
LB_2186:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2060
	jmp LB_2189
LB_2187:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1311
	jmp LB_2189
LB_2189:
	ret
LB_2197: ;; #310 { 0'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] ) : ({ _t17◂_t24◂_s8◂_t18 _t47◂_t29◂_s8◂_t18 }→_t47◂{ _t17◂_t24◂_s8◂_t18 _t29◂_s8◂_t18 })
;; rsp=0 , %1799~1'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) %1798~0'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 1'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a29◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2199
	jmp LB_2200
LB_2199:
	jmp LB_2198
LB_2200:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1801~2'(= a29◂ [ a18◂ [ ]{| l |}] ) %1798~0'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #309 { 0'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 2'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 0'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 2'(= a29◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=0 , %1802~0(<2)◂{ 0'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 2'(= a29◂ [ a18◂ [ ]{| l |}] ) } 
; ∎ 0(<2)◂{ 0'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 2'(= a29◂ [ a18◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂{ 0'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 2'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] )
; {| 1010.. |}
	mov r14,r13
	ALC_RCD 2, rax
	mov r13,rax
	mov r9,r14
	mov rax,r9
	mov QWORD [r13+8],rax
	mov r9,r8
	mov rax,r9
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
; mov_ptn2.
; .add_rsp 0
	ret
LB_2198:
;; ?. 1'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1800~2'(= a2◂ [ *{ rr{| l |}}] ) %1798~0'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1803~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1798~0'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] )
; {| 1010.. |}
	mov r13,r8
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_2498: ;; #313 { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } ⊢ 0'(= a47◂ [ q0] ) : ({ _r64 _r64 _s8 }→_t47◂6184'(=6185'(1)))
;; rsp=0 , %1830~2'(= {| l |} ) %1829~1'(= r ) %1828~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1831~1(<2)◂{ } %1830~2'(= {| l |} ) %1829~1'(= r ) %1828~0'(= r ) 
; #25 { { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
;; rsp=0 , %1832~0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
;; rsp=0 , %1833~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } 
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
LB_2655:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_2658+8*rax]
LB_2658: dq LB_2656,LB_2657
LB_2656:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2052
	jmp LB_2659
LB_2657:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1311
	jmp LB_2659
LB_2659:
	ret
LB_2664: ;; #311 { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) : ({ _t47◂_lst◂_t32◂_s8◂_t18 _t47◂_t28◂_s8◂_t18 }→_t47◂{ _lst◂_t32◂_s8◂_t18 _t28◂_s8◂_t18 })
;; rsp=0 , %1805~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %1804~0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 
;; ? 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_2666
	jmp LB_2667
LB_2666:
	jmp LB_2665
LB_2667:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1807~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %1805~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2669
	jmp LB_2670
LB_2669:
	jmp LB_2668
LB_2670:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1809~0'(= a28◂ [ a18◂ [ ]{| l |}] ) %1807~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 
; #309 { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=0 , %1810~0(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) } 
; ∎ 0(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
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
LB_2668:
;; ?. 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1808~0'(= a2◂ [ *{ rr{| l |}}] ) %1807~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1811~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) %1807~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2052
	C_POP_REGS
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
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
LB_2665:
;; ?. 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1806~2'(= a2◂ [ *{ rr{| l |}}] ) %1805~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2672
	jmp LB_2673
LB_2672:
	jmp LB_2671
LB_2673:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1813~0'(= a28◂ [ a18◂ [ ]{| l |}] ) %1806~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1814~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1813~0'(= a28◂ [ a18◂ [ ]{| l |}] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	call LB_2060
	C_POP_REGS
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
; {| 1010.. |}
	mov r13,r8
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_2671:
;; ?. 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1812~0'(= a2◂ [ *{ rr{| l |}}] ) %1806~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110.. |}
	mov r14,r13
	mov r13,r8
; mov_ptn2.
	call LB_1397
; .add_rsp 0
;; rsp=0 , %1815~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1816~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
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
LB_2708: ;; #311 { 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) 1'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) } ⊢ 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) : ({ _t47◂{ _lst◂_t32◂_s8◂_t18 _t28◂_s8◂_t18 } _t47◂_t16◂{ _lst◂_t32◂_s8◂_t18 _t31◂_s8◂_t18 } }→_t47◂{ { _lst◂_t32◂_s8◂_t18 _t28◂_s8◂_t18 } _t16◂{ _lst◂_t32◂_s8◂_t18 _t31◂_s8◂_t18 } })
;; rsp=0 , %1805~1'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %1804~0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) 
;; ? 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_2710
	jmp LB_2711
LB_2710:
	jmp LB_2709
LB_2711:
;; rsp=0 , %1807~0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) %1805~1'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 1'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2713
	jmp LB_2714
LB_2713:
	jmp LB_2712
LB_2714:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1809~2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %1807~0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 
; #309 { 0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ 0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=0 , %1810~0(<2)◂{ 0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } 
; ∎ 0(<2)◂{ 0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂{ 0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
; {| 1010.. |}
	mov r14,r13
	ALC_RCD 2, rax
	mov r13,rax
	mov r9,r14
	mov rax,r9
	mov QWORD [r13+8],rax
	mov r9,r8
	mov rax,r9
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
; mov_ptn2.
; .add_rsp 0
	ret
LB_2712:
;; ?. 1'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1808~2'(= a2◂ [ *{ rr{| l |}}] ) %1807~0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1811~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1807~0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2052
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2060
	pop r8 
	FREE_RCD 2, r8
	C_POP_REGS
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
; {| 1010.. |}
	mov r13,r8
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_2709:
;; ?. 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1806~2'(= a2◂ [ *{ rr{| l |}}] ) %1805~1'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 1'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂0'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2716
	jmp LB_2717
LB_2716:
	jmp LB_2715
LB_2717:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1813~0'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %1806~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1814~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1813~0'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	call LB_2047
	C_POP_REGS
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
; {| 1010.. |}
	mov r13,r8
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_2715:
;; ?. 1'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1812~0'(= a2◂ [ *{ rr{| l |}}] ) %1806~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110.. |}
	mov r14,r13
	mov r13,r8
; mov_ptn2.
	call LB_1397
; .add_rsp 0
;; rsp=0 , %1815~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1816~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
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
LB_2707: ;; #312 { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 2'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) } ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) : ({ _t47◂_lst◂_t32◂_s8◂_t18 _t47◂_t28◂_s8◂_t18 _t47◂_t16◂{ _lst◂_t32◂_s8◂_t18 _t31◂_s8◂_t18 } }→_t47◂{ _lst◂_t32◂_s8◂_t18 _t28◂_s8◂_t18 _t16◂{ _lst◂_t32◂_s8◂_t18 _t31◂_s8◂_t18 } })
;; rsp=0 , %1819~2'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %1818~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %1817~0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 
; #311 { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
	sub rsp,8
	mov QWORD [rsp+0],r8
; .mov_ptn2 { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) }
; {| 1100000010.. |}
; mov_ptn2.
	call LB_2664
	mov r8,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %1820~0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) %1819~2'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
; #311 { 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) 2'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) } ⊢ 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
; .mov_ptn2 { 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) 2'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) } ⊢ { 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) 1'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) }
; {| 1110.. |}
	mov r14,r8
; mov_ptn2.
	call LB_2708
; .add_rsp 0
;; rsp=0 , %1821~0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) 
;; ? 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) ⊢ 0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_2719
	jmp LB_2720
LB_2719:
	jmp LB_2718
LB_2720:
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov QWORD [GBG_VCT+8*0],r14
	mov r10, QWORD [r13+16]
	mov QWORD [GBG_VCT+8*1],r13
	mov rdi,QWORD [GBG_VCT+8*1]
	FREE_RCD 2,rdi
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %1825~4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %1824~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %1823~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 
; #309 { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=0 , %1826~0(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } 
; ∎ 0(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) 4'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
; {| 101110.. |}
	ALC_RCD 3, rax
	mov r13,rax
	mov r14,r8
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,r9
	mov rax,r14
	mov QWORD [r13+16],rax
	mov r14,r10
	mov rax,r14
	mov QWORD [r13+24],rax
	mov BYTE [r13+6],0
; mov_ptn2.
; .add_rsp 0
	ret
LB_2718:
;; ?. 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) ⊢ 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r14,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1822~1'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1827~1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
; {| 110.. |}
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_2794: ;; #311 { 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) 1'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) } ⊢ 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) : ({ _t47◂{ _lst◂_t32◂_s8◂_t18 _t28◂_s8◂_t18 } _t47◂_t16◂{ _t17◂_t26◂_s8◂_t18 _lst◂_t32◂_s8◂_t18 _t31◂_s8◂_t18 } }→_t47◂{ { _lst◂_t32◂_s8◂_t18 _t28◂_s8◂_t18 } _t16◂{ _t17◂_t26◂_s8◂_t18 _lst◂_t32◂_s8◂_t18 _t31◂_s8◂_t18 } })
;; rsp=0 , %1805~1'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %1804~0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) 
;; ? 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_2796
	jmp LB_2797
LB_2796:
	jmp LB_2795
LB_2797:
;; rsp=0 , %1807~0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) %1805~1'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 1'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2799
	jmp LB_2800
LB_2799:
	jmp LB_2798
LB_2800:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1809~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %1807~0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 
; #309 { 0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ 0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=0 , %1810~0(<2)◂{ 0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } 
; ∎ 0(<2)◂{ 0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂{ 0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
; {| 1010.. |}
	mov r14,r13
	ALC_RCD 2, rax
	mov r13,rax
	mov r9,r14
	mov rax,r9
	mov QWORD [r13+8],rax
	mov r9,r8
	mov rax,r9
	mov QWORD [r13+16],rax
	mov BYTE [r13+6],0
; mov_ptn2.
; .add_rsp 0
	ret
LB_2798:
;; ?. 1'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1808~2'(= a2◂ [ *{ rr{| l |}}] ) %1807~0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1811~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1807~0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]} )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_2052
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_2060
	pop r8 
	FREE_RCD 2, r8
	C_POP_REGS
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
; {| 1010.. |}
	mov r13,r8
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_2795:
;; ?. 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1806~2'(= a2◂ [ *{ rr{| l |}}] ) %1805~1'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 1'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂0'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2802
	jmp LB_2803
LB_2802:
	jmp LB_2801
LB_2803:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1813~0'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %1806~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1814~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1813~0'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	call LB_2059
	C_POP_REGS
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
; {| 1010.. |}
	mov r13,r8
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
	ret
LB_2801:
;; ?. 1'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1812~0'(= a2◂ [ *{ rr{| l |}}] ) %1806~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110.. |}
	mov r14,r13
	mov r13,r8
; mov_ptn2.
	call LB_1397
; .add_rsp 0
;; rsp=0 , %1815~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1816~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
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
LB_2793: ;; #312 { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) } ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) : ({ _t47◂_lst◂_t32◂_s8◂_t18 _t47◂_t28◂_s8◂_t18 _t47◂_t16◂{ _t17◂_t26◂_s8◂_t18 _lst◂_t32◂_s8◂_t18 _t31◂_s8◂_t18 } }→_t47◂{ _lst◂_t32◂_s8◂_t18 _t28◂_s8◂_t18 _t16◂{ _t17◂_t26◂_s8◂_t18 _lst◂_t32◂_s8◂_t18 _t31◂_s8◂_t18 } })
;; rsp=0 , %1819~2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %1818~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %1817~0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 
; #311 { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
	sub rsp,8
	mov QWORD [rsp+0],r8
; .mov_ptn2 { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) }
; {| 1100000010.. |}
; mov_ptn2.
	call LB_2664
	mov r8,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %1820~0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) %1819~2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
; #311 { 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) } ⊢ 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
; .mov_ptn2 { 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) } ⊢ { 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) 1'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) }
; {| 1110.. |}
	mov r14,r8
; mov_ptn2.
	call LB_2794
; .add_rsp 0
;; rsp=0 , %1821~0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) 
;; ? 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) ⊢ 0(<2)◂{ { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) } 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_2805
	jmp LB_2806
LB_2805:
	jmp LB_2804
LB_2806:
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov QWORD [GBG_VCT+8*0],r14
	mov r10, QWORD [r13+16]
	mov QWORD [GBG_VCT+8*1],r13
	mov rdi,QWORD [GBG_VCT+8*1]
	FREE_RCD 2,rdi
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=0 , %1825~4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %1824~3'(= a28◂ [ a18◂ [ ]{| l |}] ) %1823~2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 
; #309 { 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=0 , %1826~0(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } 
; ∎ 0(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂{ 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 3'(= a28◂ [ a18◂ [ ]{| l |}] ) 4'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
; {| 101110.. |}
	ALC_RCD 3, rax
	mov r13,rax
	mov r14,r8
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,r9
	mov rax,r14
	mov QWORD [r13+16],rax
	mov r14,r10
	mov rax,r14
	mov QWORD [r13+24],rax
	mov BYTE [r13+6],0
; mov_ptn2.
; .add_rsp 0
	ret
LB_2804:
;; ?. 0'(= a47◂ [ *{ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) ⊢ 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r14,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1822~1'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1827~1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
; {| 110.. |}
	mov r13,r14
	ALC_LN rax
	mov BYTE [rax+6],1
	mov QWORD [rax+8],r13
	mov r13,rax
; mov_ptn2.
; .add_rsp 0
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
	jmp LB_1970
LB_1969:
	add r14,1 
LB_1970:
	cmp r14,r9
	jge LB_1971
	JZ_SPC BYTE [r13+8+r14], LB_1969
LB_1971:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1973
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1972
LB_1973:
	jmp LB_1968
LB_1972:
	jmp LB_1975
LB_1974:
	add r14,1 
LB_1975:
	cmp r14,r9
	jge LB_1976
	JZ_SPC BYTE [r13+8+r14], LB_1974
LB_1976:
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_1978
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1978
	cmp BYTE [rdi+1],136
	jnz LB_1978
	cmp BYTE [rdi+2],142
	jnz LB_1978
	cmp BYTE [rdi+3],124
	jnz LB_1978
	add r14,4
	jmp LB_1977
LB_1978:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1968
LB_1977:
	jmp LB_1980
LB_1979:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1968
LB_1980:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2335~1'(= r ) %2334~0'(= r ) %2333~8'(= a47◂ [ *{ }] ) 
; #172 0'(= r ) ⊢ 6(<7)◂0'(= r )
;; rsp=1 , %2336~6(<7)◂0'(= r ) %2335~1'(= r ) %2333~8'(= a47◂ [ *{ }] ) 
; #309 6(<7)◂0'(= r ) ⊢ 0(<2)◂6(<7)◂0'(= r )
;; rsp=1 , %2337~0(<2)◂6(<7)◂0'(= r ) %2335~1'(= r ) %2333~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂6(<7)◂0'(= r ) ⊢ 0(<2)◂0(<2)◂6(<7)◂0'(= r )
;; rsp=1 , %2338~0(<2)◂0(<2)◂6(<7)◂0'(= r ) %2335~1'(= r ) %2333~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_1981
LB_1981:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1967
LB_1968:
	mov r14,QWORD [rsp]
	jmp LB_1985
LB_1984:
	add r14,1 
LB_1985:
	cmp r14,r9
	jge LB_1986
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1984
LB_1986:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_1988
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_1987
LB_1988:
	jmp LB_1983
LB_1987:
	jmp LB_1990
LB_1989:
	add r14,1 
LB_1990:
	cmp r14,r9
	jge LB_1991
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1989
LB_1991:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1993
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1993
	cmp BYTE [rdi+1],136
	jnz LB_1993
	cmp BYTE [rdi+2],142
	jnz LB_1993
	add r14,3
	jmp LB_1992
LB_1993:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_1983
LB_1992:
	push r14
	jmp LB_1999
LB_1998:
	add r14,1 
LB_1999:
	cmp r14,r9
	jge LB_2000
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1998
LB_2000:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2002
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2002
	add r14,1
	jmp LB_2001
LB_2002:
	jmp LB_1997
LB_2001:
	jmp LB_2004
LB_2003:
; .dlt.ptn { }
	jmp LB_1997
LB_2004:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2343~1'(= r ) %2342~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2344~1(<2)◂{ } %2343~1'(= r ) %2342~0'(= r ) 
; #173 1(<2)◂{ } ⊢ 5(<7)◂1(<2)◂{ }
;; rsp=0 , %2345~5(<7)◂1(<2)◂{ } %2343~1'(= r ) %2342~0'(= r ) 
; #309 5(<7)◂1(<2)◂{ } ⊢ 0(<2)◂5(<7)◂1(<2)◂{ }
;; rsp=0 , %2346~0(<2)◂5(<7)◂1(<2)◂{ } %2343~1'(= r ) %2342~0'(= r ) 
; #26 0(<2)◂5(<7)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂5(<7)◂1(<2)◂{ }
;; rsp=0 , %2347~0(<2)◂0(<2)◂5(<7)◂1(<2)◂{ } %2343~1'(= r ) %2342~0'(= r ) 
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
	jmp LB_2005
LB_2005:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1996
LB_1997:
	mov r14,QWORD [rsp]
	jmp LB_2009
LB_2008:
	add r14,1 
LB_2009:
	cmp r14,r9
	jge LB_2010
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2008
LB_2010:
	call GRM_319
	cmp BYTE [r8+6],0
	jnz LB_2012
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2011
LB_2012:
	jmp LB_2007
LB_2011:
	jmp LB_2014
LB_2013:
	add r14,1 
LB_2014:
	cmp r14,r9
	jge LB_2015
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2013
LB_2015:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2017
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2017
	add r14,1
	jmp LB_2016
LB_2017:
; .dlt.ptn 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2007
LB_2016:
	jmp LB_2019
LB_2018:
; .dlt.ptn { }
; .dlt.ptn 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2007
LB_2019:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2350~1'(= r ) %2349~0'(= r ) %2348~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #26 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2351~0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2350~1'(= r ) %2349~0'(= r ) 
; #173 0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2352~5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2350~1'(= r ) %2349~0'(= r ) 
; #309 5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2353~0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2350~1'(= r ) %2349~0'(= r ) 
; #26 0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2354~0(<2)◂0(<2)◂5(<7)◂0(<2)◂8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2350~1'(= r ) %2349~0'(= r ) 
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
	jmp LB_2020
LB_2020:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1996
LB_2007:
	mov r14,QWORD [rsp]
	jmp LB_2024
LB_2023:
	add r14,1 
LB_2024:
	cmp r14,r9
	jge LB_2025
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2023
LB_2025:
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_2027
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
	jmp LB_2026
LB_2027:
	jmp LB_2022
LB_2026:
	jmp LB_2029
LB_2028:
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2022
LB_2029:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2357~1'(= r ) %2356~0'(= r ) %2355~{ 8'(= r ) 9'(= r ) } 
; $ %[ "lc_code ∎ .. " ] ⊢ %[ "lc_code ∎ .. " ]
;; rsp=2 , %2358~%[ "lc_code ∎ .. " ] %2357~1'(= r ) %2356~0'(= r ) %2355~{ 8'(= r ) 9'(= r ) } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2359~1(<2)◂{ } %2358~%[ "lc_code ∎ .. " ] %2357~1'(= r ) %2356~0'(= r ) %2355~{ 8'(= r ) 9'(= r ) } 
; #25 { { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %2360~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %2355~{ 8'(= r ) 9'(= r ) } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %2361~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %2355~{ 8'(= r ) 9'(= r ) } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %2362~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %2355~{ 8'(= r ) 9'(= r ) } 
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
	jmp LB_2030
LB_2030:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1996
LB_2022:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1996:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_1994
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_1995
LB_1994:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_1995:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2363~3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2341~1'(= r ) %2340~0'(= r ) %2339~8'(= a47◂ [ *{ }] ) 
; #26 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2364~0(<2)◂3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2341~1'(= r ) %2340~0'(= r ) %2339~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_2032
LB_2032:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1967
LB_1983:
	mov r14,QWORD [rsp] 
	jmp LB_2036
LB_2035:
	add r14,1 
LB_2036:
	cmp r14,r9
	jge LB_2037
	JZ_SPC BYTE [r13+8+r14], LB_2035
LB_2037:
	call GRM_355
	cmp BYTE [r8+6],0
	jnz LB_2039
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2038
LB_2039:
	jmp LB_2034
LB_2038:
	jmp LB_2041
LB_2040:
; .dlt.ptn 8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2042
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2034
LB_2041:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2367~1'(= r ) %2366~0'(= r ) %2365~8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
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
;; rsp=1 , %2369~2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2367~1'(= r ) %2366~0'(= r ) 
; #175 2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2370~3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2367~1'(= r ) %2366~0'(= r ) 
; #309 3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2371~0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2367~1'(= r ) %2366~0'(= r ) 
; #26 0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2372~0(<2)◂0(<2)◂3(<7)◂2'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2367~1'(= r ) %2366~0'(= r ) 
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
	jmp LB_2106
LB_2108:
;; ?. 8'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2368~2'(= a2◂ [ *{ rr{| l |}}] ) %2367~1'(= r ) %2366~0'(= r ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2373~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2367~1'(= r ) %2366~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2374~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2367~1'(= r ) %2366~0'(= r ) 
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
	jmp LB_2106
LB_2106:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1967
LB_2034:
	mov r14,QWORD [rsp]
	jmp LB_2113
LB_2112:
	add r14,1 
LB_2113:
	cmp r14,r9
	jge LB_2114
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2112
LB_2114:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_2116
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2115
LB_2116:
	jmp LB_2111
LB_2115:
	jmp LB_2118
LB_2117:
	add r14,1 
LB_2118:
	cmp r14,r9
	jge LB_2119
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2117
LB_2119:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2121
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],36
	jnz LB_2121
	add r14,1
	jmp LB_2120
LB_2121:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2111
LB_2120:
	push r14
	jmp LB_2127
LB_2126:
	add r14,1 
LB_2127:
	cmp r14,r9
	jge LB_2128
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2126
LB_2128:
	call GRM_319
	cmp BYTE [r8+6],0
	jnz LB_2130
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2129
LB_2130:
	jmp LB_2125
LB_2129:
	jmp LB_2132
LB_2131:
	add r14,1 
LB_2132:
	cmp r14,r9
	jge LB_2133
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2131
LB_2133:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2135
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2135
	cmp BYTE [rdi+1],138
	jnz LB_2135
	cmp BYTE [rdi+2],162
	jnz LB_2135
	add r14,3
	jmp LB_2134
LB_2135:
; .dlt.ptn 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2125
LB_2134:
	push r14
	jmp LB_2141
LB_2140:
	add r14,1 
LB_2141:
	cmp r14,r9
	jge LB_2142
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2140
LB_2142:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2144
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2144
	add r14,1
	jmp LB_2143
LB_2144:
	jmp LB_2139
LB_2143:
	jmp LB_2146
LB_2145:
	add r14,1 
LB_2146:
	cmp r14,r9
	jge LB_2147
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2145
LB_2147:
	call GRM_356
	cmp BYTE [r8+6],0
	jnz LB_2149
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2148
LB_2149:
; .dlt.ptn { }
	jmp LB_2139
LB_2148:
	jmp LB_2151
LB_2150:
; .dlt.ptn 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2152
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_2139
LB_2151:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2383~1'(= r ) %2382~0'(= r ) %2381~8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2160
	jmp LB_2161
LB_2160:
	jmp LB_2159
LB_2161:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2385~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2383~1'(= r ) %2382~0'(= r ) 
; #171 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2386~0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2383~1'(= r ) %2382~0'(= r ) 
; #309 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2387~0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2383~1'(= r ) %2382~0'(= r ) 
; #26 0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2388~0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2383~1'(= r ) %2382~0'(= r ) 
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
	jmp LB_2157
LB_2159:
;; ?. 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2384~2'(= a2◂ [ *{ rr{| l |}}] ) %2383~1'(= r ) %2382~0'(= r ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2389~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2383~1'(= r ) %2382~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2390~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2383~1'(= r ) %2382~0'(= r ) 
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
	jmp LB_2157
LB_2157:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2138
LB_2139:
	mov r14,QWORD [rsp]
	jmp LB_2164
LB_2163:
	add r14,1 
LB_2164:
	cmp r14,r9
	jge LB_2165
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2163
LB_2165:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_2167
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2166
LB_2167:
	jmp LB_2162
LB_2166:
	jmp LB_2169
LB_2168:
	add r14,1 
LB_2169:
	cmp r14,r9
	jge LB_2170
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2168
LB_2170:
	call GRM_325
	cmp BYTE [r8+6],0
	jnz LB_2172
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2171
LB_2172:
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2162
LB_2171:
	jmp LB_2174
LB_2173:
	add r14,1 
LB_2174:
	cmp r14,r9
	jge LB_2175
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2173
LB_2175:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2177
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2177
	add r14,1
	jmp LB_2176
LB_2177:
; .dlt.ptn 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_976
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2162
LB_2176:
	jmp LB_2179
LB_2178:
	add r14,1 
LB_2179:
	cmp r14,r9
	jge LB_2180
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2178
LB_2180:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2182
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2181
LB_2182:
; .dlt.ptn { }
; .dlt.ptn 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_976
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2162
LB_2181:
	jmp LB_2184
LB_2183:
; .dlt.ptn 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_976
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_2162
LB_2184:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2395~1'(= r ) %2394~0'(= r ) %2393~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2392~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2391~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2193
	jmp LB_2194
LB_2193:
	jmp LB_2192
LB_2194:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2397~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2395~1'(= r ) %2394~0'(= r ) %2392~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2391~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #25 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=3 , %2398~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %2397~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2395~1'(= r ) %2394~0'(= r ) 
; #170 { 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2399~1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2395~1'(= r ) %2394~0'(= r ) 
; #309 1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2400~0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2395~1'(= r ) %2394~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2401~0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2395~1'(= r ) %2394~0'(= r ) 
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
	jmp LB_2190
LB_2192:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2396~2'(= a2◂ [ *{ rr{| l |}}] ) %2395~1'(= r ) %2394~0'(= r ) %2392~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2391~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2402~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2395~1'(= r ) %2394~0'(= r ) %2392~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2391~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2403~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2395~1'(= r ) %2394~0'(= r ) %2392~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2391~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	call LB_976
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
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
	jmp LB_2190
LB_2190:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2138
LB_2162:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2138:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_2136
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) ⊢ 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_2137
LB_2136:
; .dlt.ptn { }
; .dlt.ptn 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2124
LB_2137:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2404~3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) %2380~1'(= r ) %2379~0'(= r ) %2378~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #310 { 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) } ⊢ { 0'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1'(= a47◂ [ a29◂ [ a18◂ [ ]{| l |}]] ) }
; {| 110100001110.. |}
	mov r14,r9
	mov r13,QWORD [rsp-8+8*3]
; mov_ptn2.
	call LB_2197
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 3
	add rsp,24
;; rsp=0 , %2405~2'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] ) %2380~1'(= r ) %2379~0'(= r ) 
; #26 2'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂2'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=0 , %2406~0(<2)◂2'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] ) %2380~1'(= r ) %2379~0'(= r ) 
; ∎ 0(<2)◂2'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] )
; .dlt.ptn 1'(= r )
	mov rdi,r14
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .dlt.ptn 0'(= r )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .mov_ptn2 0(<2)◂2'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 2'(= a3◂ [ a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}]] )
; {| 0010.. |}
	mov r13,r8
	mov r8,r13
	ALC_LN rax
	mov BYTE [rax+6],0
	mov QWORD [rax+8],r8
	mov r8,rax
; mov_ptn2.
	jmp LB_2195
LB_2195:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2124
LB_2125:
	mov r14,QWORD [rsp] 
	jmp LB_2203
LB_2202:
	add r14,1 
LB_2203:
	cmp r14,r9
	jge LB_2204
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2202
LB_2204:
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_2206
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
	jmp LB_2205
LB_2206:
	jmp LB_2201
LB_2205:
	jmp LB_2208
LB_2207:
	add r14,1 
LB_2208:
	cmp r14,r9
	jge LB_2209
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2207
LB_2209:
	call GRM_356
	cmp BYTE [r8+6],0
	jnz LB_2211
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2210
LB_2211:
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2201
LB_2210:
	jmp LB_2213
LB_2212:
; .dlt.ptn 10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2152
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
; .add_rsp 3
	add rsp,24
	jmp LB_2201
LB_2213:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2411~1'(= r ) %2410~0'(= r ) %2409~10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2408~9'(= r ) %2407~8'(= r ) 
;; ? 10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2217
	jmp LB_2218
LB_2217:
	jmp LB_2216
LB_2218:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2413~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2411~1'(= r ) %2410~0'(= r ) %2408~9'(= r ) %2407~8'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %2414~1(<2)◂{ } %2413~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2411~1'(= r ) %2410~0'(= r ) %2408~9'(= r ) %2407~8'(= r ) 
; $ %[ "glb_etr id_line line_res 0" ] ⊢ %[ "glb_etr id_line line_res 0" ]
;; rsp=3 , %2415~%[ "glb_etr id_line line_res 0" ] %2414~1(<2)◂{ } %2413~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2411~1'(= r ) %2410~0'(= r ) %2408~9'(= r ) %2407~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
;; rsp=3 , %2416~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } %2413~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2411~1'(= r ) %2410~0'(= r ) 
; #308 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
;; rsp=3 , %2417~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } %2413~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2411~1'(= r ) %2410~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
;; rsp=3 , %2418~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } %2413~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2411~1'(= r ) %2410~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
; .dlt.ptn 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2059
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
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}]] )
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
	jmp LB_2214
LB_2216:
;; ?. 10'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2412~2'(= a2◂ [ *{ rr{| l |}}] ) %2411~1'(= r ) %2410~0'(= r ) %2408~9'(= r ) %2407~8'(= r ) 
; $ %[ "glb_etr id_line line_res 1" ] ⊢ %[ "glb_etr id_line line_res 1" ]
;; rsp=3 , %2419~%[ "glb_etr id_line line_res 1" ] %2412~2'(= a2◂ [ *{ rr{| l |}}] ) %2411~1'(= r ) %2410~0'(= r ) %2408~9'(= r ) %2407~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2420~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2411~1'(= r ) %2410~0'(= r ) 
; #308 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2421~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2411~1'(= r ) %2410~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2422~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2411~1'(= r ) %2410~0'(= r ) 
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
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}]] )
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
	jmp LB_2214
LB_2214:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2124
LB_2201:
	mov r14,QWORD [rsp]
	jmp LB_2221
LB_2220:
	add r14,1 
LB_2221:
	cmp r14,r9
	jge LB_2222
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2220
LB_2222:
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_2224
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
	jmp LB_2223
LB_2224:
	jmp LB_2219
LB_2223:
	jmp LB_2226
LB_2225:
	add r14,1 
LB_2226:
	cmp r14,r9
	jge LB_2227
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2225
LB_2227:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2229
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2228
LB_2229:
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2219
LB_2228:
	jmp LB_2231
LB_2230:
; .dlt.ptn 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
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
; .add_rsp 3
	add rsp,24
	jmp LB_2219
LB_2231:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2427~1'(= r ) %2426~0'(= r ) %2425~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2424~9'(= r ) %2423~8'(= r ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2235
	jmp LB_2236
LB_2235:
	jmp LB_2234
LB_2236:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2429~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2427~1'(= r ) %2426~0'(= r ) %2424~9'(= r ) %2423~8'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %2430~1(<2)◂{ } %2429~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2427~1'(= r ) %2426~0'(= r ) %2424~9'(= r ) %2423~8'(= r ) 
; $ %[ "glb_etr id_line line_res 2" ] ⊢ %[ "glb_etr id_line line_res 2" ]
;; rsp=3 , %2431~%[ "glb_etr id_line line_res 2" ] %2430~1(<2)◂{ } %2429~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2427~1'(= r ) %2426~0'(= r ) %2424~9'(= r ) %2423~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
;; rsp=3 , %2432~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } %2429~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2427~1'(= r ) %2426~0'(= r ) 
; #308 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
;; rsp=3 , %2433~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } %2429~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2427~1'(= r ) %2426~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
;; rsp=3 , %2434~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } %2429~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2427~1'(= r ) %2426~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
; .dlt.ptn 2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2060
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
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}]] )
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
	jmp LB_2232
LB_2234:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2428~2'(= a2◂ [ *{ rr{| l |}}] ) %2427~1'(= r ) %2426~0'(= r ) %2424~9'(= r ) %2423~8'(= r ) 
; $ %[ "glb_etr id_line line_res 3" ] ⊢ %[ "glb_etr id_line line_res 3" ]
;; rsp=3 , %2435~%[ "glb_etr id_line line_res 3" ] %2428~2'(= a2◂ [ *{ rr{| l |}}] ) %2427~1'(= r ) %2426~0'(= r ) %2424~9'(= r ) %2423~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2436~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2427~1'(= r ) %2426~0'(= r ) 
; #308 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2437~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2427~1'(= r ) %2426~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2438~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2427~1'(= r ) %2426~0'(= r ) 
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
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}]] )
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
	jmp LB_2232
LB_2232:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2124
LB_2219:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2124:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_2122
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 3'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] )
; {| 1111000010.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_2123
LB_2122:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2123:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2439~3'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] ) %2377~1'(= r ) %2376~0'(= r ) %2375~8'(= a47◂ [ *{ }] ) 
;; ? 3'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a29◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2240
	jmp LB_2241
LB_2240:
	jmp LB_2239
LB_2241:
	mov r8, QWORD [r9+8]
	mov r10, QWORD [r9+16]
	mov QWORD [GBG_VCT+8*0],r9
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=1 , %2442~4'(= a29◂ [ a18◂ [ ]{| l |}] ) %2441~2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2377~1'(= r ) %2376~0'(= r ) %2375~8'(= a47◂ [ *{ }] ) 
; #174 { 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a29◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2443~4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a29◂ [ a18◂ [ ]{| l |}] ) } %2377~1'(= r ) %2376~0'(= r ) %2375~8'(= a47◂ [ *{ }] ) 
; #309 4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a29◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2444~0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a29◂ [ a18◂ [ ]{| l |}] ) } %2377~1'(= r ) %2376~0'(= r ) %2375~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a29◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2445~0(<2)◂0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a29◂ [ a18◂ [ ]{| l |}] ) } %2377~1'(= r ) %2376~0'(= r ) %2375~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a29◂ [ a18◂ [ ]{| l |}] ) }
; .dlt.ptn 1'(= r )
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
	call LB_1306
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂4(<7)◂{ 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 4'(= a29◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a28◂ [ a18◂ [ ]{| l |}]]] )
; {| 001010.. |}
	mov r13,r8
	ALC_RCD 2, rax
	mov r8,rax
	mov r14,r13
	mov rax,r14
	mov QWORD [r8+8],rax
	mov r14,r10
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
	jmp LB_2237
LB_2239:
;; ?. 3'(= a47◂ [ *{ a17◂ [ a24◂ [ a18◂ [ ]{| l |}]]a29◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2440~2'(= a2◂ [ *{ rr{| l |}}] ) %2377~1'(= r ) %2376~0'(= r ) %2375~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2446~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2377~1'(= r ) %2376~0'(= r ) %2375~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2447~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2377~1'(= r ) %2376~0'(= r ) %2375~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_2237
LB_2237:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1967
LB_2111:
	mov r14,QWORD [rsp] 
	jmp LB_2244
LB_2243:
	add r14,1 
LB_2244:
	cmp r14,r9
	jge LB_2245
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2243
LB_2245:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_2247
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2246
LB_2247:
	jmp LB_2242
LB_2246:
	jmp LB_2249
LB_2248:
	add r14,1 
LB_2249:
	cmp r14,r9
	jge LB_2250
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2248
LB_2250:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2252
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],94
	jnz LB_2252
	add r14,1
	jmp LB_2251
LB_2252:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2242
LB_2251:
	jmp LB_2254
LB_2253:
	add r14,1 
LB_2254:
	cmp r14,r9
	jge LB_2255
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2253
LB_2255:
	call GRM_354
	cmp BYTE [r8+6],0
	jnz LB_2257
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
	jmp LB_2256
LB_2257:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2256:
	jmp LB_2259
LB_2258:
	add r14,1 
LB_2259:
	cmp r14,r9
	jge LB_2260
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2258
LB_2260:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2262
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2262
	add r14,1
	jmp LB_2261
LB_2262:
; .dlt.ptn { 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_907
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1071
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2261:
	jmp LB_2264
LB_2263:
	add r14,1 
LB_2264:
	cmp r14,r9
	jge LB_2265
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2263
LB_2265:
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2267
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) ⊢ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2266
LB_2267:
; .dlt.ptn { }
; .dlt.ptn { 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_907
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1071
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2266:
	jmp LB_2269
LB_2268:
	add r14,1 
LB_2269:
	cmp r14,r9
	jge LB_2270
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2268
LB_2270:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2272
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2271
LB_2272:
; .dlt.ptn 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1960
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_907
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1071
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2271:
	jmp LB_2274
LB_2273:
; .dlt.ptn 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1960
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_907
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1071
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 5
	add rsp,40
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2274:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*5]
;; rsp=5 , %2454~1'(= r ) %2453~0'(= r ) %2452~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2451~11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) %2450~10'(= a2◂ [ a25◂ [ {| l |}]] ) %2449~9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2448~8'(= a47◂ [ *{ }] ) 
; #166 { 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=5 , %2455~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2454~1'(= r ) %2453~0'(= r ) %2452~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2448~8'(= a47◂ [ *{ }] ) 
;; ? 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2278
	jmp LB_2279
LB_2278:
	jmp LB_2277
LB_2279:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2457~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2455~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2454~1'(= r ) %2453~0'(= r ) %2448~8'(= a47◂ [ *{ }] ) 
; #176 { 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %2458~2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2454~1'(= r ) %2453~0'(= r ) %2448~8'(= a47◂ [ *{ }] ) 
; #309 2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %2459~0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2454~1'(= r ) %2453~0'(= r ) %2448~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %2460~0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2454~1'(= r ) %2453~0'(= r ) %2448~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_2275
LB_2277:
;; ?. 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=5 , %2456~2'(= a2◂ [ *{ rr{| l |}}] ) %2455~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2454~1'(= r ) %2453~0'(= r ) %2448~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2461~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2455~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2454~1'(= r ) %2453~0'(= r ) %2448~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %2462~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2455~3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) } %2454~1'(= r ) %2453~0'(= r ) %2448~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 3(<4)◂{ 11'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 10'(= a2◂ [ a25◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1960
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_907
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1071
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
	call LB_1306
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
	jmp LB_2275
LB_2275:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1967
LB_2242:
	mov r14,QWORD [rsp] 
	jmp LB_2282
LB_2281:
	add r14,1 
LB_2282:
	cmp r14,r9
	jge LB_2283
	JZ_SPC BYTE [r13+8+r14], LB_2281
LB_2283:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_2285
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2284
LB_2285:
	jmp LB_2280
LB_2284:
	jmp LB_2287
LB_2286:
	add r14,1 
LB_2287:
	cmp r14,r9
	jge LB_2288
	JZ_SPC BYTE [r13+8+r14], LB_2286
LB_2288:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2290
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_2290
	cmp BYTE [rdi+1],187
	jnz LB_2290
	add r14,2
	jmp LB_2289
LB_2290:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2280
LB_2289:
	jmp LB_2292
LB_2291:
	add r14,1 
LB_2292:
	cmp r14,r9
	jge LB_2293
	JZ_SPC BYTE [r13+8+r14], LB_2291
LB_2293:
	call GRM_353
	cmp BYTE [r8+6],0
	jnz LB_2295
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a30◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a30◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2294
LB_2295:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2294:
	jmp LB_2297
LB_2296:
	add r14,1 
LB_2297:
	cmp r14,r9
	jge LB_2298
	JZ_SPC BYTE [r13+8+r14], LB_2296
LB_2298:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2300
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2299
LB_2300:
; .dlt.ptn 9'(= a30◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2070
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2299:
	jmp LB_2302
LB_2301:
; .dlt.ptn 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 9'(= a30◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2070
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2302:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2467~1'(= r ) %2466~0'(= r ) %2465~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2464~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2463~8'(= a47◂ [ *{ }] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2306
	jmp LB_2307
LB_2306:
	jmp LB_2305
LB_2307:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2469~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2467~1'(= r ) %2466~0'(= r ) %2464~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2463~8'(= a47◂ [ *{ }] ) 
;; ?; 9'(= a30◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<4)◂{ 3'(= a27◂ [ a18◂ [ ]] ) 4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 5'(= a17◂ [ a25◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],2
	jnz LB_2309
	jmp LB_2310
LB_2309:
	jmp LB_2308
LB_2310:
	mov rdi,QWORD [rsp-8+8*2]
	mov r9, QWORD [rdi+8]
	mov rdi,QWORD [rsp-8+8*2]
	mov r10, QWORD [rdi+16]
	mov rdi,QWORD [rsp-8+8*2]
	mov r11, QWORD [rdi+24]
	MOV_RAX QWORD [GBG_VCT+8*0],QWORD [rsp-8+8*2]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 3,rdi
;; rsp=3 , %2472~5'(= a17◂ [ a25◂ [ {| l |}]] ) %2471~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2470~3'(= a27◂ [ a18◂ [ ]] ) %2469~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2467~1'(= r ) %2466~0'(= r ) %2463~8'(= a47◂ [ *{ }] ) 
; #193 3'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂3'(= a27◂ [ a18◂ [ ]] )
;; rsp=3 , %2473~0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2472~5'(= a17◂ [ a25◂ [ {| l |}]] ) %2471~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2469~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2467~1'(= r ) %2466~0'(= r ) %2463~8'(= a47◂ [ *{ }] ) 
; #112 0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) ⊢ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] )
;; rsp=3 , %2474~1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2472~5'(= a17◂ [ a25◂ [ {| l |}]] ) %2471~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2469~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2467~1'(= r ) %2466~0'(= r ) %2463~8'(= a47◂ [ *{ }] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %2475~1(<2)◂{ } %2474~1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2472~5'(= a17◂ [ a25◂ [ {| l |}]] ) %2471~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2469~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2467~1'(= r ) %2466~0'(= r ) %2463~8'(= a47◂ [ *{ }] ) 
; #25 { 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } }
;; rsp=3 , %2476~0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } %2474~1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2471~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2469~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2467~1'(= r ) %2466~0'(= r ) %2463~8'(= a47◂ [ *{ }] ) 
; #170 { 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2477~1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2474~1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) %2471~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2467~1'(= r ) %2466~0'(= r ) %2463~8'(= a47◂ [ *{ }] ) 
; #174 { 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } }
;; rsp=3 , %2478~4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } %2471~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2467~1'(= r ) %2466~0'(= r ) %2463~8'(= a47◂ [ *{ }] ) 
; #309 4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } }
;; rsp=3 , %2479~0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } %2471~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2467~1'(= r ) %2466~0'(= r ) %2463~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } }
;; rsp=3 , %2480~0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } } %2471~4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2467~1'(= r ) %2466~0'(= r ) %2463~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a27◂ [ a18◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a17◂ [ a25◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } }
; .dlt.ptn 4'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,r10
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
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
	call LB_1306
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
	jmp LB_2303
LB_2308:
;; rsp=3 , %2469~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2467~1'(= r ) %2466~0'(= r ) %2464~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2463~8'(= a47◂ [ *{ }] ) 
; #176 { 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2481~2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2467~1'(= r ) %2466~0'(= r ) %2463~8'(= a47◂ [ *{ }] ) 
; #309 2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2482~0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2467~1'(= r ) %2466~0'(= r ) %2463~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2483~0(<2)◂0(<2)◂2(<7)◂{ 9'(= a30◂ [ a18◂ [ ]{| l |}] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2467~1'(= r ) %2466~0'(= r ) %2463~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_2303
LB_2305:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2468~2'(= a2◂ [ *{ rr{| l |}}] ) %2467~1'(= r ) %2466~0'(= r ) %2464~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2463~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2484~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2467~1'(= r ) %2466~0'(= r ) %2464~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2463~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2485~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2467~1'(= r ) %2466~0'(= r ) %2464~9'(= a30◂ [ a18◂ [ ]{| l |}] ) %2463~8'(= a47◂ [ *{ }] ) 
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
	call LB_2070
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
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
	jmp LB_2303
LB_2303:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1967
LB_2280:
	mov r14,QWORD [rsp] 
	jmp LB_2313
LB_2312:
	add r14,1 
LB_2313:
	cmp r14,r9
	jge LB_2314
	JZ_SPC BYTE [r13+8+r14], LB_2312
LB_2314:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_2316
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2315
LB_2316:
	jmp LB_2311
LB_2315:
	jmp LB_2318
LB_2317:
	add r14,1 
LB_2318:
	cmp r14,r9
	jge LB_2319
	JZ_SPC BYTE [r13+8+r14], LB_2317
LB_2319:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2321
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2321
	cmp BYTE [rdi+1],151
	jnz LB_2321
	cmp BYTE [rdi+2],130
	jnz LB_2321
	add r14,3
	jmp LB_2320
LB_2321:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2311
LB_2320:
	jmp LB_2323
LB_2322:
	add r14,1 
LB_2323:
	cmp r14,r9
	jge LB_2324
	JZ_SPC BYTE [r13+8+r14], LB_2322
LB_2324:
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_2326
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a24◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2325
LB_2326:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2325:
	jmp LB_2328
LB_2327:
	add r14,1 
LB_2328:
	cmp r14,r9
	jge LB_2329
	JZ_SPC BYTE [r13+8+r14], LB_2327
LB_2329:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2331
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_2331
	add r14,1
	jmp LB_2330
LB_2331:
; .dlt.ptn 9'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_848
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2330:
	jmp LB_2333
LB_2332:
	add r14,1 
LB_2333:
	cmp r14,r9
	jge LB_2334
	JZ_SPC BYTE [r13+8+r14], LB_2332
LB_2334:
	call GRM_319
	cmp BYTE [r8+6],0
	jnz LB_2336
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2335
LB_2336:
; .dlt.ptn { }
; .dlt.ptn 9'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_848
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2335:
	push r14
	jmp LB_2342
LB_2341:
	add r14,1 
LB_2342:
	cmp r14,r9
	jge LB_2343
	JZ_SPC BYTE [r13+8+r14], LB_2341
LB_2343:
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2345
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2345
	cmp BYTE [rdi+1],138
	jnz LB_2345
	cmp BYTE [rdi+2],162
	jnz LB_2345
	cmp BYTE [rdi+3],124
	jnz LB_2345
	add r14,4
	jmp LB_2344
LB_2345:
	jmp LB_2340
LB_2344:
	jmp LB_2347
LB_2346:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2339
LB_2347:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2492~1'(= r ) %2491~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2493~1(<2)◂{ } %2492~1'(= r ) %2491~0'(= r ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2494~0(<2)◂1(<2)◂{ } %2492~1'(= r ) %2491~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2495~0(<2)◂0(<2)◂1(<2)◂{ } %2492~1'(= r ) %2491~0'(= r ) 
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
	jmp LB_2348
LB_2348:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2339
LB_2340:
	mov r14,QWORD [rsp] 
	jmp LB_2352
LB_2351:
	add r14,1 
LB_2352:
	cmp r14,r9
	jge LB_2353
	JZ_SPC BYTE [r13+8+r14], LB_2351
LB_2353:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2355
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2355
	cmp BYTE [rdi+1],138
	jnz LB_2355
	cmp BYTE [rdi+2],162
	jnz LB_2355
	add r14,3
	jmp LB_2354
LB_2355:
	jmp LB_2350
LB_2354:
	jmp LB_2357
LB_2356:
	add r14,1 
LB_2357:
	cmp r14,r9
	jge LB_2358
	JZ_SPC BYTE [r13+8+r14], LB_2356
LB_2358:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_2360
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2359
LB_2360:
; .dlt.ptn { }
	jmp LB_2350
LB_2359:
	jmp LB_2362
LB_2361:
	add r14,1 
LB_2362:
	cmp r14,r9
	jge LB_2363
	JZ_SPC BYTE [r13+8+r14], LB_2361
LB_2363:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2365
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2364
LB_2365:
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_2350
LB_2364:
	jmp LB_2367
LB_2366:
; .dlt.ptn 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	jmp LB_2350
LB_2367:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2499~1'(= r ) %2498~0'(= r ) %2497~9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2496~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2371
	jmp LB_2372
LB_2371:
	jmp LB_2370
LB_2372:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2501~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2499~1'(= r ) %2498~0'(= r ) %2496~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2502~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2499~1'(= r ) %2498~0'(= r ) 
; #309 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2503~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2499~1'(= r ) %2498~0'(= r ) 
; #26 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2504~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2499~1'(= r ) %2498~0'(= r ) 
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
	jmp LB_2368
LB_2370:
;; ?. 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2500~2'(= a2◂ [ *{ rr{| l |}}] ) %2499~1'(= r ) %2498~0'(= r ) %2496~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2505~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2499~1'(= r ) %2498~0'(= r ) %2496~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2506~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2499~1'(= r ) %2498~0'(= r ) %2496~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	call LB_981
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
	jmp LB_2368
LB_2368:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2339
LB_2350:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2339:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_2337
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_2338
LB_2337:
; .dlt.ptn 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 9'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_848
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_1967
LB_2338:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2507~3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) %2490~1'(= r ) %2489~0'(= r ) %2488~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2487~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2486~8'(= a47◂ [ *{ }] ) 
;; ? 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2376
	jmp LB_2377
LB_2376:
	jmp LB_2375
LB_2377:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2509~2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) %2490~1'(= r ) %2489~0'(= r ) %2488~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2487~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2486~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a17◂ [ a25◂ [ {| l |}]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2379
	jmp LB_2380
LB_2379:
	jmp LB_2378
LB_2380:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=3 , %2511~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2510~3'(= a17◂ [ a25◂ [ {| l |}]] ) %2490~1'(= r ) %2489~0'(= r ) %2488~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2487~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2486~8'(= a47◂ [ *{ }] ) 
; #168 { 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) }
;; rsp=3 , %2512~1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } %2511~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2490~1'(= r ) %2489~0'(= r ) %2486~8'(= a47◂ [ *{ }] ) 
; #176 { 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2513~2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2490~1'(= r ) %2489~0'(= r ) %2486~8'(= a47◂ [ *{ }] ) 
; #309 2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2514~0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2490~1'(= r ) %2489~0'(= r ) %2486~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2515~0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2490~1'(= r ) %2489~0'(= r ) %2486~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_2373
LB_2378:
;; ?. 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %2490~1'(= r ) %2489~0'(= r ) %2488~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2487~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2486~8'(= a47◂ [ *{ }] ) 
; #177 { 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2516~1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2490~1'(= r ) %2489~0'(= r ) %2486~8'(= a47◂ [ *{ }] ) 
; #309 1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2517~0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2490~1'(= r ) %2489~0'(= r ) %2486~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2518~0(<2)◂0(<2)◂1(<7)◂{ 9'(= a24◂ [ a18◂ [ ]{| l |}] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2490~1'(= r ) %2489~0'(= r ) %2486~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_2373
LB_2375:
;; ?. 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2508~2'(= a2◂ [ *{ rr{| l |}}] ) %2490~1'(= r ) %2489~0'(= r ) %2488~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2487~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2486~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2519~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2490~1'(= r ) %2489~0'(= r ) %2488~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2487~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2486~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2520~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2490~1'(= r ) %2489~0'(= r ) %2488~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2487~9'(= a24◂ [ a18◂ [ ]{| l |}] ) %2486~8'(= a47◂ [ *{ }] ) 
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
	call LB_843
	C_POP_REGS
; .dlt.ptn 9'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_848
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
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
	jmp LB_2373
LB_2373:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1967
LB_2311:
	mov r14,QWORD [rsp] 
	jmp LB_2383
LB_2382:
	add r14,1 
LB_2383:
	cmp r14,r9
	jge LB_2384
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2382
LB_2384:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_2386
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2385
LB_2386:
	jmp LB_2381
LB_2385:
	jmp LB_2388
LB_2387:
	add r14,1 
LB_2388:
	cmp r14,r9
	jge LB_2389
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2387
LB_2389:
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_2391
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 9'(= a18◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2390
LB_2391:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2381
LB_2390:
	jmp LB_2393
LB_2392:
	add r14,1 
LB_2393:
	cmp r14,r9
	jge LB_2394
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2392
LB_2394:
	call GRM_319
	cmp BYTE [r8+6],0
	jnz LB_2396
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2395
LB_2396:
; .dlt.ptn 9'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2381
LB_2395:
	push r14
	jmp LB_2402
LB_2401:
	add r14,1 
LB_2402:
	cmp r14,r9
	jge LB_2403
	JZ_SPC BYTE [r13+8+r14], LB_2401
LB_2403:
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2405
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2405
	cmp BYTE [rdi+1],138
	jnz LB_2405
	cmp BYTE [rdi+2],162
	jnz LB_2405
	cmp BYTE [rdi+3],124
	jnz LB_2405
	add r14,4
	jmp LB_2404
LB_2405:
	jmp LB_2400
LB_2404:
	jmp LB_2407
LB_2406:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2399
LB_2407:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2527~1'(= r ) %2526~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2528~1(<2)◂{ } %2527~1'(= r ) %2526~0'(= r ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2529~0(<2)◂1(<2)◂{ } %2527~1'(= r ) %2526~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2530~0(<2)◂0(<2)◂1(<2)◂{ } %2527~1'(= r ) %2526~0'(= r ) 
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
	jmp LB_2408
LB_2408:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2399
LB_2400:
	mov r14,QWORD [rsp] 
	jmp LB_2412
LB_2411:
	add r14,1 
LB_2412:
	cmp r14,r9
	jge LB_2413
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2411
LB_2413:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2415
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2415
	cmp BYTE [rdi+1],138
	jnz LB_2415
	cmp BYTE [rdi+2],162
	jnz LB_2415
	add r14,3
	jmp LB_2414
LB_2415:
	jmp LB_2410
LB_2414:
	jmp LB_2417
LB_2416:
	add r14,1 
LB_2417:
	cmp r14,r9
	jge LB_2418
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2416
LB_2418:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_2420
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2419
LB_2420:
; .dlt.ptn { }
	jmp LB_2410
LB_2419:
	jmp LB_2422
LB_2421:
	add r14,1 
LB_2422:
	cmp r14,r9
	jge LB_2423
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2421
LB_2423:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2425
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2425
	add r14,1
	jmp LB_2424
LB_2425:
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_2410
LB_2424:
	jmp LB_2427
LB_2426:
	add r14,1 
LB_2427:
	cmp r14,r9
	jge LB_2428
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2426
LB_2428:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2430
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2429
LB_2430:
; .dlt.ptn { }
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2399
LB_2429:
	jmp LB_2432
LB_2431:
; .dlt.ptn 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2399
LB_2432:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2534~1'(= r ) %2533~0'(= r ) %2532~9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2531~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2436
	jmp LB_2437
LB_2436:
	jmp LB_2435
LB_2437:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2536~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2534~1'(= r ) %2533~0'(= r ) %2531~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2537~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2534~1'(= r ) %2533~0'(= r ) 
; #309 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2538~0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2534~1'(= r ) %2533~0'(= r ) 
; #26 0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2539~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2534~1'(= r ) %2533~0'(= r ) 
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
	jmp LB_2433
LB_2435:
;; ?. 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2535~2'(= a2◂ [ *{ rr{| l |}}] ) %2534~1'(= r ) %2533~0'(= r ) %2531~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2540~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2534~1'(= r ) %2533~0'(= r ) %2531~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2541~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2534~1'(= r ) %2533~0'(= r ) %2531~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	call LB_981
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
	jmp LB_2433
LB_2433:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2399
LB_2410:
	mov r14,QWORD [rsp] 
	jmp LB_2440
LB_2439:
	add r14,1 
LB_2440:
	cmp r14,r9
	jge LB_2441
	JZ_SPC BYTE [r13+8+r14], LB_2439
LB_2441:
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_2443
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
	jmp LB_2442
LB_2443:
	jmp LB_2438
LB_2442:
	jmp LB_2445
LB_2444:
	add r14,1 
LB_2445:
	cmp r14,r9
	jge LB_2446
	JZ_SPC BYTE [r13+8+r14], LB_2444
LB_2446:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2448
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2447
LB_2448:
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2438
LB_2447:
	jmp LB_2450
LB_2449:
; .dlt.ptn 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
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
; .add_rsp 3
	add rsp,24
	jmp LB_2438
LB_2450:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2546~1'(= r ) %2545~0'(= r ) %2544~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2543~9'(= r ) %2542~8'(= r ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2454
	jmp LB_2455
LB_2454:
	jmp LB_2453
LB_2455:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2548~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2546~1'(= r ) %2545~0'(= r ) %2543~9'(= r ) %2542~8'(= r ) 
; $ %[ "lc_code 20" ] ⊢ %[ "lc_code 20" ]
;; rsp=3 , %2549~%[ "lc_code 20" ] %2548~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2546~1'(= r ) %2545~0'(= r ) %2543~9'(= r ) %2542~8'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %2550~1(<2)◂{ } %2549~%[ "lc_code 20" ] %2548~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2546~1'(= r ) %2545~0'(= r ) %2543~9'(= r ) %2542~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %2551~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %2548~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2546~1'(= r ) %2545~0'(= r ) 
; #308 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %2552~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %2548~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2546~1'(= r ) %2545~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %2553~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %2548~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2546~1'(= r ) %2545~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
; .dlt.ptn 2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2060
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
	jmp LB_2451
LB_2453:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2547~2'(= a2◂ [ *{ rr{| l |}}] ) %2546~1'(= r ) %2545~0'(= r ) %2543~9'(= r ) %2542~8'(= r ) 
; $ %[ "lc_code 21" ] ⊢ %[ "lc_code 21" ]
;; rsp=3 , %2554~%[ "lc_code 21" ] %2547~2'(= a2◂ [ *{ rr{| l |}}] ) %2546~1'(= r ) %2545~0'(= r ) %2543~9'(= r ) %2542~8'(= r ) 
; #25 { { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2555~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2546~1'(= r ) %2545~0'(= r ) 
; #308 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2556~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2546~1'(= r ) %2545~0'(= r ) 
; #26 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %2557~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2546~1'(= r ) %2545~0'(= r ) 
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
	jmp LB_2451
LB_2451:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2399
LB_2438:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2399:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_2397
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_2398
LB_2397:
; .dlt.ptn 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .dlt.ptn 9'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_2381
LB_2398:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2558~3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) %2525~1'(= r ) %2524~0'(= r ) %2523~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2522~9'(= a18◂ [ ] ) %2521~8'(= a47◂ [ *{ }] ) 
;; ? 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2459
	jmp LB_2460
LB_2459:
	jmp LB_2458
LB_2460:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2560~2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) %2525~1'(= r ) %2524~0'(= r ) %2523~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2522~9'(= a18◂ [ ] ) %2521~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a17◂ [ a25◂ [ {| l |}]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2462
	jmp LB_2463
LB_2462:
	jmp LB_2461
LB_2463:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=3 , %2562~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2561~3'(= a17◂ [ a25◂ [ {| l |}]] ) %2525~1'(= r ) %2524~0'(= r ) %2523~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2522~9'(= a18◂ [ ] ) %2521~8'(= a47◂ [ *{ }] ) 
; #169 { 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) }
;; rsp=3 , %2563~0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } %2562~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2525~1'(= r ) %2524~0'(= r ) %2521~8'(= a47◂ [ *{ }] ) 
; #176 { 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2564~2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2525~1'(= r ) %2524~0'(= r ) %2521~8'(= a47◂ [ *{ }] ) 
; #309 2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2565~0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2525~1'(= r ) %2524~0'(= r ) %2521~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2566~0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 3'(= a17◂ [ a25◂ [ {| l |}]] ) } 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2525~1'(= r ) %2524~0'(= r ) %2521~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_2456
LB_2461:
;; ?. 2'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %2525~1'(= r ) %2524~0'(= r ) %2523~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2522~9'(= a18◂ [ ] ) %2521~8'(= a47◂ [ *{ }] ) 
; #178 { 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2567~0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2525~1'(= r ) %2524~0'(= r ) %2521~8'(= a47◂ [ *{ }] ) 
; #309 0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2568~0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2525~1'(= r ) %2524~0'(= r ) %2521~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2569~0(<2)◂0(<2)◂0(<7)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2525~1'(= r ) %2524~0'(= r ) %2521~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_2456
LB_2458:
;; ?. 3'(= a47◂ [ a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2559~2'(= a2◂ [ *{ rr{| l |}}] ) %2525~1'(= r ) %2524~0'(= r ) %2523~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2522~9'(= a18◂ [ ] ) %2521~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2570~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2525~1'(= r ) %2524~0'(= r ) %2523~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2522~9'(= a18◂ [ ] ) %2521~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2571~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2525~1'(= r ) %2524~0'(= r ) %2523~10'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2522~9'(= a18◂ [ ] ) %2521~8'(= a47◂ [ *{ }] ) 
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
	call LB_843
	C_POP_REGS
; .dlt.ptn 9'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
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
	jmp LB_2456
LB_2456:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1967
LB_2381:
	mov r14,QWORD [rsp]
	jmp LB_2466
LB_2465:
	add r14,1 
LB_2466:
	cmp r14,r9
	jge LB_2467
	JZ_SPC BYTE [r13+8+r14], LB_2465
LB_2467:
	call GRM_343
	cmp BYTE [r8+6],0
	jnz LB_2469
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_2468
LB_2469:
	jmp LB_2464
LB_2468:
	push r14
	jmp LB_2475
LB_2474:
	add r14,1 
LB_2475:
	cmp r14,r9
	jge LB_2476
	JZ_SPC BYTE [r13+8+r14], LB_2474
LB_2476:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2478
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2477
LB_2478:
	jmp LB_2473
LB_2477:
	jmp LB_2480
LB_2479:
; .dlt.ptn 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2473
LB_2480:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2577~1'(= r ) %2576~0'(= r ) %2575~8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
; #26 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
;; rsp=1 , %2578~0(<2)◂8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2577~1'(= r ) %2576~0'(= r ) 
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
	jmp LB_2481
LB_2481:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2472
LB_2473:
	mov r14,QWORD [rsp]
	jmp LB_2485
LB_2484:
	add r14,1 
LB_2485:
	cmp r14,r9
	jge LB_2486
	JZ_SPC BYTE [r13+8+r14], LB_2484
LB_2486:
	call GRM_342
	cmp BYTE [r8+6],0
	jnz LB_2488
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_2487
LB_2488:
	jmp LB_2483
LB_2487:
	jmp LB_2490
LB_2489:
; .dlt.ptn { }
	jmp LB_2483
LB_2490:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2581~1'(= r ) %2580~0'(= r ) %2579~{ } 
; $ %[ "lc_code 11" ] ⊢ %[ "lc_code 11" ]
;; rsp=0 , %2582~%[ "lc_code 11" ] %2581~1'(= r ) %2580~0'(= r ) %2579~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2583~1(<2)◂{ } %2582~%[ "lc_code 11" ] %2581~1'(= r ) %2580~0'(= r ) %2579~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
;; rsp=0 , %2584~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } %2579~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
;; rsp=0 , %2585~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } %2579~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
;; rsp=0 , %2586~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } %2579~{ } 
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
	jmp LB_2491
LB_2491:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2472
LB_2483:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2472:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_2470
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_2471
LB_2470:
; .dlt.ptn { }
	jmp LB_2464
LB_2471:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2587~3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2574~1'(= r ) %2573~0'(= r ) %2572~{ } 
;; ? 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2496
	jmp LB_2497
LB_2496:
	jmp LB_2495
LB_2497:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %2589~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2574~1'(= r ) %2573~0'(= r ) %2572~{ } 
; $ %[ "lc_code 9" ] ⊢ %[ "lc_code 9" ]
;; rsp=0 , %2590~%[ "lc_code 9" ] %2589~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2574~1'(= r ) %2573~0'(= r ) %2572~{ } 
; #313 { 0'(= r ) 1'(= r ) %[ "lc_code 9" ] } ⊢ 0'(= a47◂ [ q0] )
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
	call LB_2498
	mov r8,QWORD [rsp-8+8*1]
; .add_rsp 1
	add rsp,8
;; rsp=0 , %2591~0'(= a47◂ [ q0] ) %2589~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2572~{ } 
; #26 0'(= a47◂ [ q0] ) ⊢ 0(<2)◂0'(= a47◂ [ q0] )
;; rsp=0 , %2592~0(<2)◂0'(= a47◂ [ q0] ) %2589~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2572~{ } 
; ∎ 0(<2)◂0'(= a47◂ [ q0] )
; .dlt.ptn 2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_2060
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
	jmp LB_2493
LB_2495:
;; ?. 3'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %2588~2'(= a2◂ [ *{ rr{| l |}}] ) %2574~1'(= r ) %2573~0'(= r ) %2572~{ } 
; $ %[ "lc_code 10" ] ⊢ %[ "lc_code 10" ]
;; rsp=0 , %2593~%[ "lc_code 10" ] %2588~2'(= a2◂ [ *{ rr{| l |}}] ) %2574~1'(= r ) %2573~0'(= r ) %2572~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %2594~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2572~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %2595~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2572~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %2596~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %2572~{ } 
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
	jmp LB_2493
LB_2493:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_1967
LB_2464:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_1967:
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
	jmp LB_2502
LB_2501:
	add r14,1 
LB_2502:
	cmp r14,r9
	jge LB_2503
	JZ_SPC BYTE [r13+8+r14], LB_2501
LB_2503:
	call GRM_356
	cmp BYTE [r8+6],0
	jnz LB_2505
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2504
LB_2505:
	jmp LB_2500
LB_2504:
	jmp LB_2507
LB_2506:
; .dlt.ptn 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2152
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2500
LB_2507:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2599~1'(= r ) %2598~0'(= r ) %2597~8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2511
	jmp LB_2512
LB_2511:
	jmp LB_2510
LB_2512:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2601~2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2599~1'(= r ) %2598~0'(= r ) 
; #171 2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2602~0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2599~1'(= r ) %2598~0'(= r ) 
; #309 0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2603~0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2599~1'(= r ) %2598~0'(= r ) 
; #26 0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] )
;; rsp=1 , %2604~0(<2)◂0(<2)◂0(<2)◂2'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2599~1'(= r ) %2598~0'(= r ) 
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
	jmp LB_2508
LB_2510:
;; ?. 8'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2600~2'(= a2◂ [ *{ rr{| l |}}] ) %2599~1'(= r ) %2598~0'(= r ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2605~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2599~1'(= r ) %2598~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2606~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2599~1'(= r ) %2598~0'(= r ) 
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
	jmp LB_2508
LB_2508:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2499
LB_2500:
	mov r14,QWORD [rsp]
	jmp LB_2515
LB_2514:
	add r14,1 
LB_2515:
	cmp r14,r9
	jge LB_2516
	JZ_SPC BYTE [r13+8+r14], LB_2514
LB_2516:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_2518
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2517
LB_2518:
	jmp LB_2513
LB_2517:
	jmp LB_2520
LB_2519:
	add r14,1 
LB_2520:
	cmp r14,r9
	jge LB_2521
	JZ_SPC BYTE [r13+8+r14], LB_2519
LB_2521:
	call GRM_325
	cmp BYTE [r8+6],0
	jnz LB_2523
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2522
LB_2523:
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2513
LB_2522:
	jmp LB_2525
LB_2524:
	add r14,1 
LB_2525:
	cmp r14,r9
	jge LB_2526
	JZ_SPC BYTE [r13+8+r14], LB_2524
LB_2526:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2528
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2527
LB_2528:
; .dlt.ptn 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_976
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2513
LB_2527:
	jmp LB_2530
LB_2529:
; .dlt.ptn 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_976
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_2513
LB_2530:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2611~1'(= r ) %2610~0'(= r ) %2609~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2608~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2607~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2534
	jmp LB_2535
LB_2534:
	jmp LB_2533
LB_2535:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2613~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2611~1'(= r ) %2610~0'(= r ) %2608~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2607~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #25 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) }
;; rsp=3 , %2614~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } %2613~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2611~1'(= r ) %2610~0'(= r ) 
; #170 { 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2615~1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2611~1'(= r ) %2610~0'(= r ) 
; #309 1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2616~0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2611~1'(= r ) %2610~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %2617~0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) } 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2611~1'(= r ) %2610~0'(= r ) 
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
	jmp LB_2531
LB_2533:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %2612~2'(= a2◂ [ *{ rr{| l |}}] ) %2611~1'(= r ) %2610~0'(= r ) %2608~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2607~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2618~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2611~1'(= r ) %2610~0'(= r ) %2608~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2607~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2619~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2611~1'(= r ) %2610~0'(= r ) %2608~9'(= a2◂ [ a17◂ [ a25◂ [ {| l |}]]] ) %2607~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	call LB_976
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
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
	jmp LB_2531
LB_2531:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2499
LB_2513:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2499:
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
	jmp LB_2539
LB_2538:
	add r14,1 
LB_2539:
	cmp r14,r9
	jge LB_2540
	JZ_SPC BYTE [r13+8+r14], LB_2538
LB_2540:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2542
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_2542
	cmp BYTE [rdi+1],94
	jnz LB_2542
	add r14,2
	jmp LB_2541
LB_2542:
	jmp LB_2537
LB_2541:
	jmp LB_2544
LB_2543:
	add r14,1 
LB_2544:
	cmp r14,r9
	jge LB_2545
	JZ_SPC BYTE [r13+8+r14], LB_2543
LB_2545:
	call GRM_354
	cmp BYTE [r8+6],0
	jnz LB_2547
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
	jmp LB_2546
LB_2547:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2536
LB_2546:
	jmp LB_2549
LB_2548:
	add r14,1 
LB_2549:
	cmp r14,r9
	jge LB_2550
	JZ_SPC BYTE [r13+8+r14], LB_2548
LB_2550:
	call GRM_350
	cmp BYTE [r8+6],0
	jnz LB_2552
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) ⊢ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2551
LB_2552:
; .dlt.ptn { 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_907
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1071
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2536
LB_2551:
	jmp LB_2554
LB_2553:
; .dlt.ptn 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1960
	C_POP_REGS
; .dlt.ptn { 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_907
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1071
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2536
LB_2554:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2624~1'(= r ) %2623~0'(= r ) %2622~10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) %2621~9'(= a2◂ [ a25◂ [ {| l |}]] ) %2620~8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #166 { 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=3 , %2625~3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } %2624~1'(= r ) %2623~0'(= r ) 
; #26 3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=3 , %2626~0(<2)◂3(<4)◂{ 10'(= a2◂ [ a23◂ [ a18◂ [ ]]] ) 8'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 9'(= a2◂ [ a25◂ [ {| l |}]] ) } %2624~1'(= r ) %2623~0'(= r ) 
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
	jmp LB_2555
LB_2555:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2536
LB_2537:
	mov r14,QWORD [rsp] 
	jmp LB_2559
LB_2558:
	add r14,1 
LB_2559:
	cmp r14,r9
	jge LB_2560
	JZ_SPC BYTE [r13+8+r14], LB_2558
LB_2560:
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_2562
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2561
LB_2562:
	jmp LB_2557
LB_2561:
	jmp LB_2564
LB_2563:
	add r14,1 
LB_2564:
	cmp r14,r9
	jge LB_2565
	JZ_SPC BYTE [r13+8+r14], LB_2563
LB_2565:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2567
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_2567
	add r14,1
	jmp LB_2566
LB_2567:
; .dlt.ptn 8'(= a27◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_478
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2557
LB_2566:
	jmp LB_2569
LB_2568:
	add r14,1 
LB_2569:
	cmp r14,r9
	jge LB_2570
	JZ_SPC BYTE [r13+8+r14], LB_2568
LB_2570:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2572
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2572
	cmp BYTE [rdi+1],138
	jnz LB_2572
	cmp BYTE [rdi+2],162
	jnz LB_2572
	add r14,3
	jmp LB_2571
LB_2572:
; .dlt.ptn { }
; .dlt.ptn 8'(= a27◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_478
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2557
LB_2571:
	jmp LB_2574
LB_2573:
	add r14,1 
LB_2574:
	cmp r14,r9
	jge LB_2575
	JZ_SPC BYTE [r13+8+r14], LB_2573
LB_2575:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_2577
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 9'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2576
LB_2577:
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a27◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_478
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2557
LB_2576:
	jmp LB_2579
LB_2578:
; .dlt.ptn 9'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a27◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_478
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2557
LB_2579:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2630~1'(= r ) %2629~0'(= r ) %2628~9'(= a17◂ [ a25◂ [ {| l |}]] ) %2627~8'(= a27◂ [ a18◂ [ ]] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2631~1(<2)◂{ } %2630~1'(= r ) %2629~0'(= r ) %2628~9'(= a17◂ [ a25◂ [ {| l |}]] ) %2627~8'(= a27◂ [ a18◂ [ ]] ) 
; #113 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=2 , %2632~0(<2)◂1(<2)◂{ } %2630~1'(= r ) %2629~0'(= r ) %2628~9'(= a17◂ [ a25◂ [ {| l |}]] ) %2627~8'(= a27◂ [ a18◂ [ ]] ) 
; #167 { 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) }
;; rsp=2 , %2633~2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } %2630~1'(= r ) %2629~0'(= r ) 
; #26 2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) }
;; rsp=2 , %2634~0(<2)◂2(<4)◂{ 8'(= a27◂ [ a18◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a17◂ [ a25◂ [ {| l |}]] ) } %2630~1'(= r ) %2629~0'(= r ) 
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
	jmp LB_2580
LB_2580:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2536
LB_2557:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2536:
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
	jmp LB_2585
LB_2584:
	add r14,1 
LB_2585:
	cmp r14,r9
	jge LB_2586
	JZ_SPC BYTE [r13+8+r14], LB_2584
LB_2586:
	call GRM_302
	cmp BYTE [r8+6],0
	jnz LB_2588
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_2587
LB_2588:
	jmp LB_2583
LB_2587:
	jmp LB_2590
LB_2589:
	add r14,1 
LB_2590:
	cmp r14,r9
	jge LB_2591
	JZ_SPC BYTE [r13+8+r14], LB_2589
LB_2591:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2593
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2593
	cmp BYTE [rdi+1],138
	jnz LB_2593
	cmp BYTE [rdi+2],162
	jnz LB_2593
	add r14,3
	jmp LB_2592
LB_2593:
; .dlt.ptn { }
	jmp LB_2583
LB_2592:
	jmp LB_2595
LB_2594:
	add r14,1 
LB_2595:
	cmp r14,r9
	jge LB_2596
	JZ_SPC BYTE [r13+8+r14], LB_2594
LB_2596:
	call GRM_327
	cmp BYTE [r8+6],0
	jnz LB_2598
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a25◂ [ {| l |}] ) ⊢ 8'(= a25◂ [ {| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2597
LB_2598:
; .dlt.ptn { }
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2582
LB_2597:
	jmp LB_2600
LB_2599:
; .dlt.ptn 8'(= a25◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_986
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2582
LB_2600:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2638~1'(= r ) %2637~0'(= r ) %2636~8'(= a25◂ [ {| l |}] ) %2635~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2639~1(<2)◂{ } %2638~1'(= r ) %2637~0'(= r ) %2636~8'(= a25◂ [ {| l |}] ) %2635~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2640~1(<2)◂{ } %2639~1(<2)◂{ } %2638~1'(= r ) %2637~0'(= r ) %2636~8'(= a25◂ [ {| l |}] ) %2635~{ } 
; #25 { 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } }
;; rsp=1 , %2641~0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } %2639~1(<2)◂{ } %2638~1'(= r ) %2637~0'(= r ) %2635~{ } 
; #26 { 1(<2)◂{ } 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } } ⊢ 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } }
;; rsp=1 , %2642~0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a25◂ [ {| l |}] ) 1(<2)◂{ } } } %2638~1'(= r ) %2637~0'(= r ) %2635~{ } 
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
	jmp LB_2601
LB_2601:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2582
LB_2583:
	mov r14,QWORD [rsp] 
	jmp LB_2605
LB_2604:
	add r14,1 
LB_2605:
	cmp r14,r9
	jge LB_2606
	JZ_SPC BYTE [r13+8+r14], LB_2604
LB_2606:
	call GRM_322
	cmp BYTE [r8+6],0
	jnz LB_2608
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a24◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a24◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2607
LB_2608:
	jmp LB_2603
LB_2607:
	jmp LB_2610
LB_2609:
	add r14,1 
LB_2610:
	cmp r14,r9
	jge LB_2611
	JZ_SPC BYTE [r13+8+r14], LB_2609
LB_2611:
	call GRM_321
	cmp BYTE [r8+6],0
	jnz LB_2613
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2612
LB_2613:
; .dlt.ptn 8'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_848
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2603
LB_2612:
	jmp LB_2615
LB_2614:
	add r14,1 
LB_2615:
	cmp r14,r9
	jge LB_2616
	JZ_SPC BYTE [r13+8+r14], LB_2614
LB_2616:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2618
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2618
	cmp BYTE [rdi+1],138
	jnz LB_2618
	cmp BYTE [rdi+2],162
	jnz LB_2618
	add r14,3
	jmp LB_2617
LB_2618:
; .dlt.ptn 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_907
	C_POP_REGS
; .dlt.ptn 8'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_848
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2603
LB_2617:
	jmp LB_2620
LB_2619:
	add r14,1 
LB_2620:
	cmp r14,r9
	jge LB_2621
	JZ_SPC BYTE [r13+8+r14], LB_2619
LB_2621:
	call GRM_327
	cmp BYTE [r8+6],0
	jnz LB_2623
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a25◂ [ {| l |}] ) ⊢ 10'(= a25◂ [ {| l |}] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2622
LB_2623:
; .dlt.ptn { }
; .dlt.ptn 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_907
	C_POP_REGS
; .dlt.ptn 8'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_848
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2603
LB_2622:
	jmp LB_2625
LB_2624:
	add r14,1 
LB_2625:
	cmp r14,r9
	jge LB_2626
	JZ_SPC BYTE [r13+8+r14], LB_2624
LB_2626:
	call GRM_326
	cmp BYTE [r8+6],0
	jnz LB_2628
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a25◂ [ {| l |}]] ) ⊢ 11'(= a2◂ [ a25◂ [ {| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2627
LB_2628:
; .dlt.ptn 10'(= a25◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_986
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_907
	C_POP_REGS
; .dlt.ptn 8'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_848
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_2603
LB_2627:
	jmp LB_2630
LB_2629:
; .dlt.ptn 11'(= a2◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1071
	C_POP_REGS
; .dlt.ptn 10'(= a25◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_986
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_907
	C_POP_REGS
; .dlt.ptn 8'(= a24◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_848
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	jmp LB_2603
LB_2630:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %2648~1'(= r ) %2647~0'(= r ) %2646~11'(= a2◂ [ a25◂ [ {| l |}]] ) %2645~10'(= a25◂ [ {| l |}] ) %2644~9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) %2643~8'(= a24◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=4 , %2649~0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2648~1'(= r ) %2647~0'(= r ) %2646~11'(= a2◂ [ a25◂ [ {| l |}]] ) %2645~10'(= a25◂ [ {| l |}] ) 
; #25 { 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } ⊢ 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) }
;; rsp=4 , %2650~0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } %2649~0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } %2648~1'(= r ) %2647~0'(= r ) 
; #26 { 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } } ⊢ 0(<2)◂{ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } }
;; rsp=4 , %2651~0(<2)◂{ 0(<2)◂{ 8'(= a24◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a25◂ [ {| l |}] ) 11'(= a2◂ [ a25◂ [ {| l |}]] ) } } %2648~1'(= r ) %2647~0'(= r ) 
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
	jmp LB_2631
LB_2631:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2582
LB_2603:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2582:
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
	jmp LB_2636
LB_2635:
	add r14,1 
LB_2636:
	cmp r14,r9
	jge LB_2637
	JZ_SPC BYTE [r13+8+r14], LB_2635
LB_2637:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_2639
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2638
LB_2639:
	jmp LB_2634
LB_2638:
	jmp LB_2641
LB_2640:
	add r14,1 
LB_2641:
	cmp r14,r9
	jge LB_2642
	JZ_SPC BYTE [r13+8+r14], LB_2640
LB_2642:
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2644
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2644
	cmp BYTE [rdi+1],136
	jnz LB_2644
	cmp BYTE [rdi+2],144
	jnz LB_2644
	cmp BYTE [rdi+3],46
	jnz LB_2644
	add r14,4
	jmp LB_2643
LB_2644:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2634
LB_2643:
	jmp LB_2646
LB_2645:
	add r14,1 
LB_2646:
	cmp r14,r9
	jge LB_2647
	JZ_SPC BYTE [r13+8+r14], LB_2645
LB_2647:
	call GRM_357
	cmp BYTE [r8+6],0
	jnz LB_2649
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2648
LB_2649:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2633
LB_2648:
	jmp LB_2651
LB_2650:
	add r14,1 
LB_2651:
	cmp r14,r9
	jge LB_2652
	JZ_SPC BYTE [r13+8+r14], LB_2650
LB_2652:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2654
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2653
LB_2654:
; .dlt.ptn 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2655
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2633
LB_2653:
	jmp LB_2661
LB_2660:
; .dlt.ptn 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2655
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2633
LB_2661:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2656~1'(= r ) %2655~0'(= r ) %2654~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2653~9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) %2652~8'(= a47◂ [ *{ }] ) 
; #311 { 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) }
; {| 11000000111110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_2664
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=1 , %2657~2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) %2656~1'(= r ) %2655~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2675
	jmp LB_2676
LB_2675:
	jmp LB_2674
LB_2676:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=1 , %2660~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2659~3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2656~1'(= r ) %2655~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #163 4'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %2661~2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2659~3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2656~1'(= r ) %2655~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #80 { 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2662~1(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2656~1'(= r ) %2655~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #309 1(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2663~0(<2)◂1(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2656~1'(= r ) %2655~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2664~0(<2)◂0(<2)◂1(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2656~1'(= r ) %2655~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
; .dlt.ptn 1'(= r )
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
	call LB_1306
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 001110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	mov r13,r9
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,r10
	ALC_LN rax
	mov BYTE [rax+6],2
	mov QWORD [rax+8],r13
	mov r13,rax
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
; .add_rsp 1
	add rsp,8
	jmp LB_2662
LB_2674:
;; ?. 2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2658~3'(= a2◂ [ *{ rr{| l |}}] ) %2656~1'(= r ) %2655~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2665~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2656~1'(= r ) %2655~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2666~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2656~1'(= r ) %2655~0'(= r ) %2652~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_2662
LB_2662:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2633
LB_2634:
	mov r14,QWORD [rsp] 
	jmp LB_2679
LB_2678:
	add r14,1 
LB_2679:
	cmp r14,r9
	jge LB_2680
	JZ_SPC BYTE [r13+8+r14], LB_2678
LB_2680:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_2682
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2681
LB_2682:
	jmp LB_2677
LB_2681:
	jmp LB_2684
LB_2683:
	add r14,1 
LB_2684:
	cmp r14,r9
	jge LB_2685
	JZ_SPC BYTE [r13+8+r14], LB_2683
LB_2685:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2687
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2687
	cmp BYTE [rdi+1],136
	jnz LB_2687
	cmp BYTE [rdi+2],144
	jnz LB_2687
	add r14,3
	jmp LB_2686
LB_2687:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2677
LB_2686:
	jmp LB_2689
LB_2688:
	add r14,1 
LB_2689:
	cmp r14,r9
	jge LB_2690
	JZ_SPC BYTE [r13+8+r14], LB_2688
LB_2690:
	call GRM_357
	cmp BYTE [r8+6],0
	jnz LB_2692
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2691
LB_2692:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2677
LB_2691:
	jmp LB_2694
LB_2693:
	add r14,1 
LB_2694:
	cmp r14,r9
	jge LB_2695
	JZ_SPC BYTE [r13+8+r14], LB_2693
LB_2695:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2697
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2696
LB_2697:
; .dlt.ptn 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2655
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2677
LB_2696:
	jmp LB_2699
LB_2698:
	add r14,1 
LB_2699:
	cmp r14,r9
	jge LB_2700
	JZ_SPC BYTE [r13+8+r14], LB_2698
LB_2700:
	call GRM_355
	cmp BYTE [r8+6],0
	jnz LB_2702
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2701
LB_2702:
; .dlt.ptn 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2655
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_2677
LB_2701:
	jmp LB_2704
LB_2703:
; .dlt.ptn 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2042
	C_POP_REGS
; .dlt.ptn 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2655
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	jmp LB_2677
LB_2704:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %2672~1'(= r ) %2671~0'(= r ) %2670~11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2669~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2668~9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) %2667~8'(= a47◂ [ *{ }] ) 
; #312 { 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) } ⊢ 2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 9'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 11'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) } ⊢ { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 2'(= a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) }
; {| 111000001111110.. |}
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*4]
	mov r13,QWORD [rsp-8+8*5]
; mov_ptn2.
	call LB_2707
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 5
	add rsp,40
;; rsp=1 , %2673~2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) %2672~1'(= r ) %2671~0'(= r ) %2667~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) ⊢ 0(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) 5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2722
	jmp LB_2723
LB_2722:
	jmp LB_2721
LB_2723:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov r11, QWORD [r8+24]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 3,rdi
;; rsp=1 , %2677~5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2676~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2675~3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2672~1'(= r ) %2671~0'(= r ) %2667~8'(= a47◂ [ *{ }] ) 
; #163 4'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %2678~2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2677~5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2675~3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2672~1'(= r ) %2671~0'(= r ) %2667~8'(= a47◂ [ *{ }] ) 
; #81 { { 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=1 , %2679~0(<2)◂{ { 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2672~1'(= r ) %2671~0'(= r ) %2667~8'(= a47◂ [ *{ }] ) 
; #309 0(<2)◂{ { 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=1 , %2680~0(<2)◂0(<2)◂{ { 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2672~1'(= r ) %2671~0'(= r ) %2667~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ { 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ { 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=1 , %2681~0(<2)◂0(<2)◂0(<2)◂{ { 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2672~1'(= r ) %2671~0'(= r ) %2667~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ { 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
; .dlt.ptn 1'(= r )
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
	call LB_1306
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ { 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 0011110.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 2, rax
	mov r13,rax
	mov r14,r9
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,r10
	ALC_LN rax
	mov BYTE [rax+6],2
	mov QWORD [rax+8],r14
	mov r14,rax
	mov rax,r14
	mov QWORD [r13+16],rax
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,r11
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
	jmp LB_2705
LB_2721:
;; ?. 2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2674~3'(= a2◂ [ *{ rr{| l |}}] ) %2672~1'(= r ) %2671~0'(= r ) %2667~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2682~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2672~1'(= r ) %2671~0'(= r ) %2667~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2683~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2672~1'(= r ) %2671~0'(= r ) %2667~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_2705
LB_2705:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2633
LB_2677:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2633:
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
	jmp LB_2727
LB_2726:
	add r14,1 
LB_2727:
	cmp r14,r9
	jge LB_2728
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2726
LB_2728:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_2730
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2729
LB_2730:
	jmp LB_2725
LB_2729:
	jmp LB_2732
LB_2731:
	add r14,1 
LB_2732:
	cmp r14,r9
	jge LB_2733
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2731
LB_2733:
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2735
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2735
	cmp BYTE [rdi+1],136
	jnz LB_2735
	cmp BYTE [rdi+2],144
	jnz LB_2735
	cmp BYTE [rdi+3],46
	jnz LB_2735
	add r14,4
	jmp LB_2734
LB_2735:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2725
LB_2734:
	jmp LB_2737
LB_2736:
	add r14,1 
LB_2737:
	cmp r14,r9
	jge LB_2738
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2736
LB_2738:
	call GRM_315
	cmp BYTE [r8+6],0
	jnz LB_2740
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2739
LB_2740:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2724
LB_2739:
	jmp LB_2742
LB_2741:
	add r14,1 
LB_2742:
	cmp r14,r9
	jge LB_2743
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2741
LB_2743:
	call GRM_360
	cmp BYTE [r8+6],0
	jnz LB_2745
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2744
LB_2745:
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2724
LB_2744:
	jmp LB_2747
LB_2746:
	add r14,1 
LB_2747:
	cmp r14,r9
	jge LB_2748
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2746
LB_2748:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2750
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2749
LB_2750:
; .dlt.ptn 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2655
	C_POP_REGS
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2724
LB_2749:
	jmp LB_2752
LB_2751:
; .dlt.ptn 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2655
	C_POP_REGS
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2724
LB_2752:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %2689~1'(= r ) %2688~0'(= r ) %2687~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2686~10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) %2685~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2684~8'(= a47◂ [ *{ }] ) 
; #311 { 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) }
; {| 110000001111110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_2664
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=2 , %2690~2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) %2689~1'(= r ) %2688~0'(= r ) %2685~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2684~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2756
	jmp LB_2757
LB_2756:
	jmp LB_2755
LB_2757:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=2 , %2693~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2692~3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2689~1'(= r ) %2688~0'(= r ) %2685~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2684~8'(= a47◂ [ *{ }] ) 
; #163 4'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=2 , %2694~2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2692~3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2689~1'(= r ) %2688~0'(= r ) %2685~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2684~8'(= a47◂ [ *{ }] ) 
; #80 { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2695~1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2689~1'(= r ) %2688~0'(= r ) %2684~8'(= a47◂ [ *{ }] ) 
; #309 1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2696~0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2689~1'(= r ) %2688~0'(= r ) %2684~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2697~0(<2)◂0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2689~1'(= r ) %2688~0'(= r ) %2684~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
; .dlt.ptn 1'(= r )
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
	call LB_1306
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00111000010.. |}
	ALC_RCD 3, rax
	mov r8,rax
	mov r13,QWORD [rsp-8+8*1]
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,r9
	mov rax,r13
	mov QWORD [r8+16],rax
	mov r13,r10
	ALC_LN rax
	mov BYTE [rax+6],2
	mov QWORD [rax+8],r13
	mov r13,rax
	mov rax,r13
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
; .add_rsp 2
	add rsp,16
	jmp LB_2753
LB_2755:
;; ?. 2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2691~3'(= a2◂ [ *{ rr{| l |}}] ) %2689~1'(= r ) %2688~0'(= r ) %2685~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2684~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2698~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2689~1'(= r ) %2688~0'(= r ) %2685~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2684~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2699~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2689~1'(= r ) %2688~0'(= r ) %2685~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2684~8'(= a47◂ [ *{ }] ) 
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
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
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
	jmp LB_2753
LB_2753:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2724
LB_2725:
	mov r14,QWORD [rsp] 
	jmp LB_2760
LB_2759:
	add r14,1 
LB_2760:
	cmp r14,r9
	jge LB_2761
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2759
LB_2761:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_2763
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2762
LB_2763:
	jmp LB_2758
LB_2762:
	jmp LB_2765
LB_2764:
	add r14,1 
LB_2765:
	cmp r14,r9
	jge LB_2766
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2764
LB_2766:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2768
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2768
	cmp BYTE [rdi+1],136
	jnz LB_2768
	cmp BYTE [rdi+2],144
	jnz LB_2768
	add r14,3
	jmp LB_2767
LB_2768:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2758
LB_2767:
	jmp LB_2770
LB_2769:
	add r14,1 
LB_2770:
	cmp r14,r9
	jge LB_2771
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2769
LB_2771:
	call GRM_315
	cmp BYTE [r8+6],0
	jnz LB_2773
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2772
LB_2773:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2758
LB_2772:
	jmp LB_2775
LB_2774:
	add r14,1 
LB_2775:
	cmp r14,r9
	jge LB_2776
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2774
LB_2776:
	call GRM_360
	cmp BYTE [r8+6],0
	jnz LB_2778
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) ⊢ 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2777
LB_2778:
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2758
LB_2777:
	jmp LB_2780
LB_2779:
	add r14,1 
LB_2780:
	cmp r14,r9
	jge LB_2781
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2779
LB_2781:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_2783
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2782
LB_2783:
; .dlt.ptn 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2655
	C_POP_REGS
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_2758
LB_2782:
	jmp LB_2785
LB_2784:
	add r14,1 
LB_2785:
	cmp r14,r9
	jge LB_2786
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2784
LB_2786:
	call GRM_356
	cmp BYTE [r8+6],0
	jnz LB_2788
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2787
LB_2788:
; .dlt.ptn 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2655
	C_POP_REGS
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	jmp LB_2758
LB_2787:
	jmp LB_2790
LB_2789:
; .dlt.ptn 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2152
	C_POP_REGS
; .dlt.ptn 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2655
	C_POP_REGS
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 5
	add rsp,40
	jmp LB_2758
LB_2790:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*5]
;; rsp=5 , %2706~1'(= r ) %2705~0'(= r ) %2704~12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) %2703~11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %2702~10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) %2701~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2700~8'(= a47◂ [ *{ }] ) 
; #312 { 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) } ⊢ 2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 10'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 11'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 12'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) } ⊢ { 0'(= a47◂ [ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 2'(= a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]] ) }
; {| 1110000011111110.. |}
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*4]
	mov r13,QWORD [rsp-8+8*5]
; mov_ptn2.
	call LB_2793
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 5
	add rsp,40
;; rsp=2 , %2707~2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) %2706~1'(= r ) %2705~0'(= r ) %2701~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2700~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) ⊢ 0(<2)◂{ 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) 5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2808
	jmp LB_2809
LB_2808:
	jmp LB_2807
LB_2809:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov r11, QWORD [r8+24]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 3,rdi
;; rsp=2 , %2711~5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2710~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2709~3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2706~1'(= r ) %2705~0'(= r ) %2701~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2700~8'(= a47◂ [ *{ }] ) 
; #163 4'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=2 , %2712~2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) %2711~5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) %2709~3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2706~1'(= r ) %2705~0'(= r ) %2701~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2700~8'(= a47◂ [ *{ }] ) 
; #81 { { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=2 , %2713~0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2706~1'(= r ) %2705~0'(= r ) %2700~8'(= a47◂ [ *{ }] ) 
; #309 0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=2 , %2714~0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2706~1'(= r ) %2705~0'(= r ) %2700~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=2 , %2715~0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } %2706~1'(= r ) %2705~0'(= r ) %2700~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) }
; .dlt.ptn 1'(= r )
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
	call LB_1306
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) 3'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) 2(<3)◂4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 5'(= a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]]] )
; {| 00111100010.. |}
	ALC_RCD 2, rax
	mov r8,rax
	ALC_RCD 3, rax
	mov r13,rax
	mov r14,QWORD [rsp-8+8*1]
	mov rax,r14
	mov QWORD [r13+8],rax
	mov r14,r9
	mov rax,r14
	mov QWORD [r13+16],rax
	mov r14,r10
	ALC_LN rax
	mov BYTE [rax+6],2
	mov QWORD [rax+8],r14
	mov r14,rax
	mov rax,r14
	mov QWORD [r13+24],rax
	mov rax,r13
	mov QWORD [r8+8],rax
	mov r13,r11
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
	jmp LB_2791
LB_2807:
;; ?. 2'(= a47◂ [ *{ a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a28◂ [ a18◂ [ ]{| l |}]a16◂ [ *{ a17◂ [ a26◂ [ a18◂ [ ]{| l |}]]a2◂ [ a32◂ [ a18◂ [ ]{| l |}]]a31◂ [ a18◂ [ ]{| l |}]}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2708~3'(= a2◂ [ *{ rr{| l |}}] ) %2706~1'(= r ) %2705~0'(= r ) %2701~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2700~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2716~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2706~1'(= r ) %2705~0'(= r ) %2701~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2700~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2717~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2706~1'(= r ) %2705~0'(= r ) %2701~9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2700~8'(= a47◂ [ *{ }] ) 
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
; .dlt.ptn 9'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
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
	jmp LB_2791
LB_2791:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2724
LB_2758:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2724:
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
	jmp LB_2813
LB_2812:
	add r14,1 
LB_2813:
	cmp r14,r9
	jge LB_2814
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2812
LB_2814:
	call GRM_358
	cmp BYTE [r8+6],0
	jnz LB_2816
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a32◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a32◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2815
LB_2816:
	jmp LB_2811
LB_2815:
	jmp LB_2818
LB_2817:
	add r14,1 
LB_2818:
	cmp r14,r9
	jge LB_2819
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2817
LB_2819:
	call GRM_359
	cmp BYTE [r8+6],0
	jnz LB_2821
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2820
LB_2821:
; .dlt.ptn 8'(= a32◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2095
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2811
LB_2820:
	jmp LB_2823
LB_2822:
; .dlt.ptn 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2052
	C_POP_REGS
; .dlt.ptn 8'(= a32◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2095
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2811
LB_2823:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2721~1'(= r ) %2720~0'(= r ) %2719~9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2718~8'(= a32◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2722~0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2721~1'(= r ) %2720~0'(= r ) 
; #309 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2723~0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2721~1'(= r ) %2720~0'(= r ) 
; #26 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2724~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2721~1'(= r ) %2720~0'(= r ) 
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
	jmp LB_2824
LB_2824:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2810
LB_2811:
	mov r14,QWORD [rsp]
	jmp LB_2828
LB_2827:
	add r14,1 
LB_2828:
	cmp r14,r9
	jge LB_2829
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2827
LB_2829:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2831
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_2831
	add r14,1
	jmp LB_2830
LB_2831:
	jmp LB_2826
LB_2830:
	jmp LB_2833
LB_2832:
	add r14,1 
LB_2833:
	cmp r14,r9
	jge LB_2834
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2832
LB_2834:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2836
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2836
	add r14,1
	jmp LB_2835
LB_2836:
; .dlt.ptn { }
	jmp LB_2826
LB_2835:
	jmp LB_2838
LB_2837:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_2826
LB_2838:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2726~1'(= r ) %2725~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2727~1(<2)◂{ } %2726~1'(= r ) %2725~0'(= r ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2728~0(<2)◂1(<2)◂{ } %2726~1'(= r ) %2725~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2729~0(<2)◂0(<2)◂1(<2)◂{ } %2726~1'(= r ) %2725~0'(= r ) 
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
	jmp LB_2839
LB_2839:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2810
LB_2826:
	mov r14,QWORD [rsp]
	jmp LB_2843
LB_2842:
	add r14,1 
LB_2843:
	cmp r14,r9
	jge LB_2844
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2842
LB_2844:
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_2846
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
	jmp LB_2845
LB_2846:
	jmp LB_2841
LB_2845:
	jmp LB_2848
LB_2847:
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2841
LB_2848:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2732~1'(= r ) %2731~0'(= r ) %2730~{ 8'(= r ) 9'(= r ) } 
; $ %[ "mtc_line 0" ] ⊢ %[ "mtc_line 0" ]
;; rsp=2 , %2733~%[ "mtc_line 0" ] %2732~1'(= r ) %2731~0'(= r ) %2730~{ 8'(= r ) 9'(= r ) } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2734~1(<2)◂{ } %2733~%[ "mtc_line 0" ] %2732~1'(= r ) %2731~0'(= r ) %2730~{ 8'(= r ) 9'(= r ) } 
; #25 { { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2735~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } %2730~{ 8'(= r ) 9'(= r ) } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2736~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } %2730~{ 8'(= r ) 9'(= r ) } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2737~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } %2730~{ 8'(= r ) 9'(= r ) } 
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
	jmp LB_2849
LB_2849:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2810
LB_2841:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2810:
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
	jmp LB_2854
LB_2853:
	add r14,1 
LB_2854:
	cmp r14,r9
	jge LB_2855
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2853
LB_2855:
	call GRM_319
	cmp BYTE [r8+6],0
	jnz LB_2857
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2856
LB_2857:
	jmp LB_2852
LB_2856:
	jmp LB_2859
LB_2858:
	add r14,1 
LB_2859:
	cmp r14,r9
	jge LB_2860
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2858
LB_2860:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2862
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2862
	cmp BYTE [rdi+1],138
	jnz LB_2862
	cmp BYTE [rdi+2],162
	jnz LB_2862
	add r14,3
	jmp LB_2861
LB_2862:
; .dlt.ptn 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2852
LB_2861:
	jmp LB_2864
LB_2863:
	add r14,1 
LB_2864:
	cmp r14,r9
	jge LB_2865
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2863
LB_2865:
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_2867
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 9'(= a18◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2866
LB_2867:
; .dlt.ptn { }
; .dlt.ptn 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2851
LB_2866:
	jmp LB_2869
LB_2868:
	add r14,1 
LB_2869:
	cmp r14,r9
	jge LB_2870
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2868
LB_2870:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2872
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2872
	cmp BYTE [rdi+1],151
	jnz LB_2872
	cmp BYTE [rdi+2],130
	jnz LB_2872
	add r14,3
	jmp LB_2871
LB_2872:
; .dlt.ptn 9'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2851
LB_2871:
	jmp LB_2874
LB_2873:
	add r14,1 
LB_2874:
	cmp r14,r9
	jge LB_2875
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2873
LB_2875:
	call GRM_315
	cmp BYTE [r8+6],0
	jnz LB_2877
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2876
LB_2877:
; .dlt.ptn { }
; .dlt.ptn 9'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2851
LB_2876:
	jmp LB_2879
LB_2878:
; .dlt.ptn 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_466
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 9'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_843
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2851
LB_2879:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2742~1'(= r ) %2741~0'(= r ) %2740~10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) %2739~9'(= a18◂ [ ] ) %2738~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #189 { 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2743~0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %2742~1'(= r ) %2741~0'(= r ) %2738~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #112 0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=3 , %2744~1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } %2742~1'(= r ) %2741~0'(= r ) %2738~8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 
; #162 { 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } ⊢ 0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } }
;; rsp=3 , %2745~0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } %2742~1'(= r ) %2741~0'(= r ) 
; #26 0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } ⊢ 0(<2)◂0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } }
;; rsp=3 , %2746~0(<2)◂0(<3)◂{ 8'(= a17◂ [ a24◂ [ a18◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a18◂ [ ] ) 10'(= a17◂ [ a26◂ [ a18◂ [ ]{| l |}]] ) } } %2742~1'(= r ) %2741~0'(= r ) 
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
	jmp LB_2880
LB_2880:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2851
LB_2852:
	mov r14,QWORD [rsp] 
	jmp LB_2884
LB_2883:
	add r14,1 
LB_2884:
	cmp r14,r9
	jge LB_2885
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2883
LB_2885:
	call GRM_361
	cmp BYTE [r8+6],0
	jnz LB_2887
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a33◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a33◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2886
LB_2887:
	jmp LB_2882
LB_2886:
	jmp LB_2889
LB_2888:
	add r14,1 
LB_2889:
	cmp r14,r9
	jge LB_2890
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2888
LB_2890:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2892
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_2892
	cmp BYTE [rdi+1],60
	jnz LB_2892
	add r14,2
	jmp LB_2891
LB_2892:
; .dlt.ptn 8'(= a33◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2101
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2882
LB_2891:
	jmp LB_2894
LB_2893:
	add r14,1 
LB_2894:
	cmp r14,r9
	jge LB_2895
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2893
LB_2895:
	call GRM_361
	cmp BYTE [r8+6],0
	jnz LB_2897
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a33◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a33◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2896
LB_2897:
; .dlt.ptn { }
; .dlt.ptn 8'(= a33◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2101
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2882
LB_2896:
	jmp LB_2899
LB_2898:
; .dlt.ptn 9'(= a33◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2101
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a33◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2101
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2882
LB_2899:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2750~1'(= r ) %2749~0'(= r ) %2748~9'(= a33◂ [ a18◂ [ ]{| l |}] ) %2747~8'(= a33◂ [ a18◂ [ ]{| l |}] ) 
; #160 { 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2751~2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } %2750~1'(= r ) %2749~0'(= r ) 
; #26 2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2752~0(<2)◂2(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } %2750~1'(= r ) %2749~0'(= r ) 
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
	jmp LB_2900
LB_2900:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2851
LB_2882:
	mov r14,QWORD [rsp]
	jmp LB_2904
LB_2903:
	add r14,1 
LB_2904:
	cmp r14,r9
	jge LB_2905
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2903
LB_2905:
	call GRM_361
	cmp BYTE [r8+6],0
	jnz LB_2907
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a33◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a33◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2906
LB_2907:
	jmp LB_2902
LB_2906:
	jmp LB_2909
LB_2908:
	add r14,1 
LB_2909:
	cmp r14,r9
	jge LB_2910
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2908
LB_2910:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2912
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_2912
	add r14,1
	jmp LB_2911
LB_2912:
; .dlt.ptn 8'(= a33◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2101
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2902
LB_2911:
	jmp LB_2914
LB_2913:
	add r14,1 
LB_2914:
	cmp r14,r9
	jge LB_2915
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2913
LB_2915:
	call GRM_361
	cmp BYTE [r8+6],0
	jnz LB_2917
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a33◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a33◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2916
LB_2917:
; .dlt.ptn { }
; .dlt.ptn 8'(= a33◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2101
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_2902
LB_2916:
	jmp LB_2919
LB_2918:
; .dlt.ptn 9'(= a33◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2101
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a33◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2101
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2902
LB_2919:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2756~1'(= r ) %2755~0'(= r ) %2754~9'(= a33◂ [ a18◂ [ ]{| l |}] ) %2753~8'(= a33◂ [ a18◂ [ ]{| l |}] ) 
; #161 { 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2757~1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } %2756~1'(= r ) %2755~0'(= r ) 
; #26 1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %2758~0(<2)◂1(<3)◂{ 8'(= a33◂ [ a18◂ [ ]{| l |}] ) 9'(= a33◂ [ a18◂ [ ]{| l |}] ) } %2756~1'(= r ) %2755~0'(= r ) 
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
	jmp LB_2920
LB_2920:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2851
LB_2902:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2851:
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
	jmp LB_2925
LB_2924:
	add r14,1 
LB_2925:
	cmp r14,r9
	jge LB_2926
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2924
LB_2926:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2928
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_2928
	add r14,1
	jmp LB_2927
LB_2928:
	jmp LB_2923
LB_2927:
	jmp LB_2930
LB_2929:
	add r14,1 
LB_2930:
	cmp r14,r9
	jge LB_2931
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2929
LB_2931:
	call GRM_358
	cmp BYTE [r8+6],0
	jnz LB_2933
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a32◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a32◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2932
LB_2933:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2922
LB_2932:
	jmp LB_2935
LB_2934:
	add r14,1 
LB_2935:
	cmp r14,r9
	jge LB_2936
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2934
LB_2936:
	call GRM_359
	cmp BYTE [r8+6],0
	jnz LB_2938
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2937
LB_2938:
; .dlt.ptn 8'(= a32◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2095
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2922
LB_2937:
	jmp LB_2940
LB_2939:
; .dlt.ptn 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2052
	C_POP_REGS
; .dlt.ptn 8'(= a32◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2095
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2922
LB_2940:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2762~1'(= r ) %2761~0'(= r ) %2760~9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2759~8'(= a32◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2763~0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2762~1'(= r ) %2761~0'(= r ) 
; #26 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2764~0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2762~1'(= r ) %2761~0'(= r ) 
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
	jmp LB_2941
LB_2941:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2922
LB_2923:
	mov r14,QWORD [rsp] 
	jmp LB_2945
LB_2944:
	add r14,1 
LB_2945:
	cmp r14,r9
	jge LB_2946
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2944
LB_2946:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2948
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_2948
	add r14,1
	jmp LB_2947
LB_2948:
	jmp LB_2943
LB_2947:
	jmp LB_2950
LB_2949:
	add r14,1 
LB_2950:
	cmp r14,r9
	jge LB_2951
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2949
LB_2951:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2953
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2953
	add r14,1
	jmp LB_2952
LB_2953:
; .dlt.ptn { }
	jmp LB_2943
LB_2952:
	jmp LB_2955
LB_2954:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_2943
LB_2955:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2766~1'(= r ) %2765~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2767~1(<2)◂{ } %2766~1'(= r ) %2765~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2768~0(<2)◂1(<2)◂{ } %2766~1'(= r ) %2765~0'(= r ) 
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
	jmp LB_2956
LB_2956:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2922
LB_2943:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2922:
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
	jmp LB_2961
LB_2960:
	add r14,1 
LB_2961:
	cmp r14,r9
	jge LB_2962
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2960
LB_2962:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2964
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_2964
	add r14,1
	jmp LB_2963
LB_2964:
	jmp LB_2959
LB_2963:
	jmp LB_2966
LB_2965:
	add r14,1 
LB_2966:
	cmp r14,r9
	jge LB_2967
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2965
LB_2967:
	call GRM_358
	cmp BYTE [r8+6],0
	jnz LB_2969
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a32◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a32◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2968
LB_2969:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2958
LB_2968:
	jmp LB_2971
LB_2970:
	add r14,1 
LB_2971:
	cmp r14,r9
	jge LB_2972
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2970
LB_2972:
	call GRM_359
	cmp BYTE [r8+6],0
	jnz LB_2974
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_2973
LB_2974:
; .dlt.ptn 8'(= a32◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2095
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2958
LB_2973:
	jmp LB_2976
LB_2975:
; .dlt.ptn 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2052
	C_POP_REGS
; .dlt.ptn 8'(= a32◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2095
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_2958
LB_2976:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2772~1'(= r ) %2771~0'(= r ) %2770~9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) %2769~8'(= a32◂ [ a18◂ [ ]{| l |}] ) 
; #25 { 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2773~0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2772~1'(= r ) %2771~0'(= r ) 
; #309 0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2774~0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2772~1'(= r ) %2771~0'(= r ) 
; #26 0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=2 , %2775~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a32◂ [ a18◂ [ ]{| l |}] ) 9'(= a2◂ [ a32◂ [ a18◂ [ ]{| l |}]] ) } %2772~1'(= r ) %2771~0'(= r ) 
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
	jmp LB_2977
LB_2977:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2958
LB_2959:
	mov r14,QWORD [rsp] 
	jmp LB_2981
LB_2980:
	add r14,1 
LB_2981:
	cmp r14,r9
	jge LB_2982
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2980
LB_2982:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2984
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_2984
	add r14,1
	jmp LB_2983
LB_2984:
	jmp LB_2979
LB_2983:
	jmp LB_2986
LB_2985:
	add r14,1 
LB_2986:
	cmp r14,r9
	jge LB_2987
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2985
LB_2987:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2989
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2989
	add r14,1
	jmp LB_2988
LB_2989:
; .dlt.ptn { }
	jmp LB_2979
LB_2988:
	jmp LB_2991
LB_2990:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_2979
LB_2991:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2777~1'(= r ) %2776~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2778~1(<2)◂{ } %2777~1'(= r ) %2776~0'(= r ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2779~0(<2)◂1(<2)◂{ } %2777~1'(= r ) %2776~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2780~0(<2)◂0(<2)◂1(<2)◂{ } %2777~1'(= r ) %2776~0'(= r ) 
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
	jmp LB_2992
LB_2992:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2958
LB_2979:
	mov r14,QWORD [rsp]
	jmp LB_2996
LB_2995:
	add r14,1 
LB_2996:
	cmp r14,r9
	jge LB_2997
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2995
LB_2997:
	call GRM_338
	cmp BYTE [r8+6],0
	jnz LB_2999
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
	jmp LB_2998
LB_2999:
	jmp LB_2994
LB_2998:
	jmp LB_3001
LB_3000:
; .dlt.ptn { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_2994
LB_3001:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2783~1'(= r ) %2782~0'(= r ) %2781~{ 8'(= r ) 9'(= r ) } 
; $ %[ "mtc_line_tl 0" ] ⊢ %[ "mtc_line_tl 0" ]
;; rsp=2 , %2784~%[ "mtc_line_tl 0" ] %2783~1'(= r ) %2782~0'(= r ) %2781~{ 8'(= r ) 9'(= r ) } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2785~1(<2)◂{ } %2784~%[ "mtc_line_tl 0" ] %2783~1'(= r ) %2782~0'(= r ) %2781~{ 8'(= r ) 9'(= r ) } 
; #25 { { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2786~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } %2781~{ 8'(= r ) 9'(= r ) } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2787~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } %2781~{ 8'(= r ) 9'(= r ) } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2788~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } %2781~{ 8'(= r ) 9'(= r ) } 
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
	jmp LB_3002
LB_3002:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_2958
LB_2994:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_2958:
; discard r14
	add rsp,8
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
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3007
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3006
LB_3007:
	jmp LB_3005
LB_3006:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3009
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_3009
	add r14,1
	jmp LB_3008
LB_3009:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3005
LB_3008:
	jmp LB_3011
LB_3010:
; .dlt.ptn { }
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3005
LB_3011:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2791~1'(= r ) %2790~0'(= r ) %2789~8'(= {| l |} ) 
; #158 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %2792~1(<2)◂8'(= {| l |} ) %2791~1'(= r ) %2790~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %2793~0(<2)◂1(<2)◂8'(= {| l |} ) %2791~1'(= r ) %2790~0'(= r ) 
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
	jmp LB_3012
LB_3012:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3004
LB_3005:
	mov r14,QWORD [rsp]
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_3016
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3015
LB_3016:
	jmp LB_3014
LB_3015:
	jmp LB_3018
LB_3017:
; .dlt.ptn 8'(= a27◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_478
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3014
LB_3018:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2796~1'(= r ) %2795~0'(= r ) %2794~8'(= a27◂ [ a18◂ [ ]] ) 
; #159 8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %2797~0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) %2796~1'(= r ) %2795~0'(= r ) 
; #26 0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %2798~0(<2)◂0(<2)◂8'(= a27◂ [ a18◂ [ ]] ) %2796~1'(= r ) %2795~0'(= r ) 
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
	jmp LB_3019
LB_3019:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3004
LB_3014:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3004:
; discard r14
	add rsp,8
	ret
LB_3038:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3041+8*rax]
LB_3041: dq LB_3039,LB_3040
LB_3039:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3043
	jmp LB_3042
LB_3040:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1311
	jmp LB_3042
LB_3042:
	ret
LB_3043:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3050+8*rax]
LB_3050: dq LB_3044,LB_3045,LB_3046,LB_3047,LB_3048,LB_3049
LB_3044:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3052
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3051
LB_3045:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3053
	jmp LB_3051
LB_3046:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3054
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3051
LB_3047:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3055
	jmp LB_3051
LB_3048:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3056
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3051
LB_3049:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3057
	jmp LB_3051
LB_3051:
	ret
LB_3057:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3060+8*rax]
LB_3060: dq LB_3058,LB_3059
LB_3058:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3056
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3057
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3061
LB_3059:
	jmp LB_3061
LB_3061:
	ret
LB_3056:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3064+8*rax]
LB_3064: dq LB_3062,LB_3063
LB_3062:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3066
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3067
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3065
LB_3063:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3066
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1119
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3065
LB_3065:
	ret
LB_3067:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3070+8*rax]
LB_3070: dq LB_3068,LB_3069
LB_3068:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1119
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3067
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3071
LB_3069:
	jmp LB_3071
LB_3071:
	ret
LB_3066:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3074+8*rax]
LB_3074: dq LB_3072,LB_3073
LB_3072:
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3066
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3075
LB_3073:
	jmp LB_3075
LB_3075:
	ret
LB_3055:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3078+8*rax]
LB_3078: dq LB_3076,LB_3077
LB_3076:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_981
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_1139
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_2060
	pop r8 
	FREE_RCD 4, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3055
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3079
LB_3077:
	jmp LB_3079
LB_3079:
	ret
LB_3054:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3083+8*rax]
LB_3083: dq LB_3080,LB_3081,LB_3082
LB_3080:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_981
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_1139
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2060
	pop r8 
	FREE_RCD 3, r8
	jmp LB_3084
LB_3081:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_478
	jmp LB_3084
LB_3082:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_2060
	jmp LB_3084
LB_3084:
	ret
LB_3053:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3087+8*rax]
LB_3087: dq LB_3085,LB_3086
LB_3085:
	push r8
	mov r8,QWORD [r8+8+8*0]
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,r8
	call free_s8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3089
	pop r8 
	FREE_RCD 2, r8
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3053
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3088
LB_3086:
	jmp LB_3088
LB_3088:
	ret
LB_3089:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3092+8*rax]
LB_3092: dq LB_3090,LB_3091
LB_3090:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3094
	jmp LB_3093
LB_3091:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3095
	jmp LB_3093
LB_3093:
	ret
LB_3095:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3098+8*rax]
LB_3098: dq LB_3096,LB_3097
LB_3096:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1071
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_981
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2060
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_3100
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_3101
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_3102
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*6]
	call LB_3095
	pop r8 
	FREE_RCD 7, r8
	jmp LB_3099
LB_3097:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_1071
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_981
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_2060
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_3100
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_3101
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_3102
	pop r8 
	FREE_RCD 6, r8
	jmp LB_3099
LB_3099:
	ret
LB_3102:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3105+8*rax]
LB_3105: dq LB_3103,LB_3104
LB_3103:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_981
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3095
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3106
LB_3104:
	jmp LB_3106
LB_3106:
	ret
LB_3101:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3110+8*rax]
LB_3110: dq LB_3107,LB_3108,LB_3109
LB_3107:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3112
	jmp LB_3111
LB_3108:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3113
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3101
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3111
LB_3109:
	jmp LB_3111
LB_3111:
	ret
LB_3113:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3116+8*rax]
LB_3116: dq LB_3114,LB_3115
LB_3114:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3118
	jmp LB_3117
LB_3115:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3118
	jmp LB_3117
LB_3117:
	ret
LB_3118:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3121+8*rax]
LB_3121: dq LB_3119,LB_3120
LB_3119:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_355
	jmp LB_3122
LB_3120:
	mov rdi,r8
	call free_s8
	jmp LB_3122
LB_3122:
	ret
LB_3112:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3125+8*rax]
LB_3125: dq LB_3123,LB_3124
LB_3123:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3113
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3112
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3126
LB_3124:
	jmp LB_3126
LB_3126:
	ret
LB_3100:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3130+8*rax]
LB_3130: dq LB_3127,LB_3128,LB_3129
LB_3127:
	jmp LB_3131
LB_3128:
	jmp LB_3131
LB_3129:
	jmp LB_3131
LB_3131:
	ret
LB_3094:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3134+8*rax]
LB_3134: dq LB_3132,LB_3133
LB_3132:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_479
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3100
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_3101
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_3136
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_3094
	pop r8 
	FREE_RCD 5, r8
	jmp LB_3135
LB_3133:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_479
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3100
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_3101
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_3136
	pop r8 
	FREE_RCD 4, r8
	jmp LB_3135
LB_3135:
	ret
LB_3136:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3139+8*rax]
LB_3139: dq LB_3137,LB_3138
LB_3137:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3094
	jmp LB_3140
LB_3138:
	jmp LB_3140
LB_3140:
	ret
LB_3052:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3143+8*rax]
LB_3143: dq LB_3141,LB_3142
LB_3141:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3145
	jmp LB_3144
LB_3142:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_355
	jmp LB_3144
LB_3144:
	ret
LB_3145:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3148+8*rax]
LB_3148: dq LB_3146,LB_3147
LB_3146:
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_3043
	pop r8 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_3145
	pop r8 
	FREE_RCD 2, r8
	jmp LB_3149
LB_3147:
	jmp LB_3149
LB_3149:
	ret
LB_3152:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3155+8*rax]
LB_3155: dq LB_3153,LB_3154
LB_3153:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3145
	jmp LB_3156
LB_3154:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1311
	jmp LB_3156
LB_3156:
	ret
LB_3159: ;; #311 { 0'(= a47◂ [ a42◂ [ ]] ) 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ 0'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) : ({ _t47◂_t42 _t47◂_lst◂_t42 }→_t47◂{ _t42 _lst◂_t42 })
;; rsp=0 , %1805~1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %1804~0'(= a47◂ [ a42◂ [ ]] ) 
;; ? 0'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂2'(= a42◂ [ ] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_3161
	jmp LB_3162
LB_3161:
	jmp LB_3160
LB_3162:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1807~2'(= a42◂ [ ] ) %1805~1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) 
;; ? 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 0(<2)◂0'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_3164
	jmp LB_3165
LB_3164:
	jmp LB_3163
LB_3165:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1809~0'(= a2◂ [ a42◂ [ ]] ) %1807~2'(= a42◂ [ ] ) 
; #309 { 2'(= a42◂ [ ] ) 0'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂{ 2'(= a42◂ [ ] ) 0'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=0 , %1810~0(<2)◂{ 2'(= a42◂ [ ] ) 0'(= a2◂ [ a42◂ [ ]] ) } 
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
LB_3163:
;; ?. 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1808~0'(= a2◂ [ *{ rr{| l |}}] ) %1807~2'(= a42◂ [ ] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1811~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) %1807~2'(= a42◂ [ ] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a42◂ [ ] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_3043
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
LB_3160:
;; ?. 0'(= a47◂ [ a42◂ [ ]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1806~2'(= a2◂ [ *{ rr{| l |}}] ) %1805~1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) 
;; ? 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 0(<2)◂0'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_3167
	jmp LB_3168
LB_3167:
	jmp LB_3166
LB_3168:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1813~0'(= a2◂ [ a42◂ [ ]] ) %1806~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1814~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1813~0'(= a2◂ [ a42◂ [ ]] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	call LB_3145
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
LB_3166:
;; ?. 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1812~0'(= a2◂ [ *{ rr{| l |}}] ) %1806~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110.. |}
	mov r14,r13
	mov r13,r8
; mov_ptn2.
	call LB_1397
; .add_rsp 0
;; rsp=0 , %1815~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1816~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
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
LB_3266:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3269+8*rax]
LB_3269: dq LB_3267,LB_3268
LB_3267:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3052
	jmp LB_3270
LB_3268:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1311
	jmp LB_3270
LB_3270:
	ret
LB_3873:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3876+8*rax]
LB_3876: dq LB_3874,LB_3875
LB_3874:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3055
	jmp LB_3877
LB_3875:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1311
	jmp LB_3877
LB_3877:
	ret
LB_3880: ;; #311 { 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) : ({ _t47◂_lst◂{ _s8 _t17◂_t25◂_s8 _opn◂_t34 _t28◂_s8◂_t18 } _t47◂_t28◂_s8◂_t18 }→_t47◂{ _lst◂{ _s8 _t17◂_t25◂_s8 _opn◂_t34 _t28◂_s8◂_t18 } _t28◂_s8◂_t18 })
;; rsp=0 , %1805~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %1804~0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 
;; ? 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_3882
	jmp LB_3883
LB_3882:
	jmp LB_3881
LB_3883:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1807~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %1805~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_3885
	jmp LB_3886
LB_3885:
	jmp LB_3884
LB_3886:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1809~0'(= a28◂ [ a18◂ [ ]{| l |}] ) %1807~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 
; #309 { 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=0 , %1810~0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 0'(= a28◂ [ a18◂ [ ]{| l |}] ) } 
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
LB_3884:
;; ?. 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1808~0'(= a2◂ [ *{ rr{| l |}}] ) %1807~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1811~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) %1807~2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 2'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_3055
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
LB_3881:
;; ?. 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1806~2'(= a2◂ [ *{ rr{| l |}}] ) %1805~1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_3888
	jmp LB_3889
LB_3888:
	jmp LB_3887
LB_3889:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1813~0'(= a28◂ [ a18◂ [ ]{| l |}] ) %1806~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1814~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1813~0'(= a28◂ [ a18◂ [ ]{| l |}] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .dlt.ptn 0'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,r13
	C_PUSH_REGS
	mov r8,rdi
	call LB_2060
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
LB_3887:
;; ?. 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %1812~0'(= a2◂ [ *{ rr{| l |}}] ) %1806~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #84 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; {| 1110.. |}
	mov r14,r13
	mov r13,r8
; mov_ptn2.
	call LB_1397
; .add_rsp 0
;; rsp=0 , %1815~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #308 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1816~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
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
LB_3906:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_3909+8*rax]
LB_3909: dq LB_3907,LB_3908
LB_3907:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_3054
	jmp LB_3910
LB_3908:
	FREE_LN r8 
	mov r8,QWORD [r8+8]
	call LB_1311
	jmp LB_3910
LB_3910:
	ret
LB_4158: ;; #254 { } ⊢ 0'(= a2◂ [ a25◂ [ {| l |}]] ) : ({ }→_lst◂_t25◂_s8)
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
	jmp LB_3024
LB_3023:
	add r14,1 
LB_3024:
	cmp r14,r9
	jge LB_3025
	JZ_SPC BYTE [r13+8+r14], LB_3023
LB_3025:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3027
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3026
LB_3027:
	jmp LB_3022
LB_3026:
	jmp LB_3029
LB_3028:
	add r14,1 
LB_3029:
	cmp r14,r9
	jge LB_3030
	JZ_SPC BYTE [r13+8+r14], LB_3028
LB_3030:
	call GRM_363
	cmp BYTE [r8+6],0
	jnz LB_3032
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 9'(= a47◂ [ a42◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3031
LB_3032:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3022
LB_3031:
	jmp LB_3034
LB_3033:
	add r14,1 
LB_3034:
	cmp r14,r9
	jge LB_3035
	JZ_SPC BYTE [r13+8+r14], LB_3033
LB_3035:
	call GRM_362
	cmp BYTE [r8+6],0
	jnz LB_3037
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3036
LB_3037:
; .dlt.ptn 9'(= a47◂ [ a42◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3038
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_3022
LB_3036:
	jmp LB_3151
LB_3150:
; .dlt.ptn 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3152
	C_POP_REGS
; .dlt.ptn 9'(= a47◂ [ a42◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3038
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_3022
LB_3151:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2803~1'(= r ) %2802~0'(= r ) %2801~10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %2800~9'(= a47◂ [ a42◂ [ ]] ) %2799~8'(= a47◂ [ *{ }] ) 
; #311 { 9'(= a47◂ [ a42◂ [ ]] ) 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 9'(= a47◂ [ a42◂ [ ]] ) 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ { 0'(= a47◂ [ a42◂ [ ]] ) 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) }
; {| 11000000111110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_3159
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=1 , %2804~2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) %2803~1'(= r ) %2802~0'(= r ) %2799~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) ⊢ 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_3170
	jmp LB_3171
LB_3170:
	jmp LB_3169
LB_3171:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=1 , %2807~4'(= a2◂ [ a42◂ [ ]] ) %2806~3'(= a42◂ [ ] ) %2803~1'(= r ) %2802~0'(= r ) %2799~8'(= a47◂ [ *{ }] ) 
; #25 { 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %2808~0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %2803~1'(= r ) %2802~0'(= r ) %2799~8'(= a47◂ [ *{ }] ) 
; #309 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %2809~0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %2803~1'(= r ) %2802~0'(= r ) %2799~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %2810~0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %2803~1'(= r ) %2802~0'(= r ) %2799~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3157
LB_3169:
;; ?. 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2805~3'(= a2◂ [ *{ rr{| l |}}] ) %2803~1'(= r ) %2802~0'(= r ) %2799~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2811~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2803~1'(= r ) %2802~0'(= r ) %2799~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2812~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2803~1'(= r ) %2802~0'(= r ) %2799~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3157
LB_3157:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3021
LB_3022:
	mov r14,QWORD [rsp]
	jmp LB_3174
LB_3173:
	add r14,1 
LB_3174:
	cmp r14,r9
	jge LB_3175
	JZ_SPC BYTE [r13+8+r14], LB_3173
LB_3175:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3177
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3176
LB_3177:
	jmp LB_3172
LB_3176:
	push r14
	jmp LB_3183
LB_3182:
	add r14,1 
LB_3183:
	cmp r14,r9
	jge LB_3184
	JZ_SPC BYTE [r13+8+r14], LB_3182
LB_3184:
	cmp r14,r9
	jge LB_3186
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_3185
LB_3186:
	jmp LB_3181
LB_3185:
	jmp LB_3188
LB_3187:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3180
LB_3188:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2818~1'(= r ) %2817~0'(= r ) %2816~8'(= r ) 
; $ %[ "!!!" ] ⊢ %[ "!!!" ]
;; rsp=1 , %2819~%[ "!!!" ] %2818~1'(= r ) %2817~0'(= r ) %2816~8'(= r ) 
; #10 %[ "!!!" ] ⊢ %[ "!!!" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3191
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3192
LB_3192:
;; rsp=1 , %2820~%[ "!!!" ] %2818~1'(= r ) %2817~0'(= r ) %2816~8'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2821~1(<2)◂{ } %2820~%[ "!!!" ] %2818~1'(= r ) %2817~0'(= r ) %2816~8'(= r ) 
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
	jmp LB_3189
LB_3189:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3180
LB_3181:
	mov r14,QWORD [rsp] 
	jmp LB_3195
LB_3194:
	jmp LB_3193
LB_3195:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2823~1'(= r ) %2822~0'(= r ) 
; $ %[ "???" ] ⊢ %[ "???" ]
;; rsp=0 , %2824~%[ "???" ] %2823~1'(= r ) %2822~0'(= r ) 
; #10 %[ "???" ] ⊢ %[ "???" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3198
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3199
LB_3199:
;; rsp=0 , %2825~%[ "???" ] %2823~1'(= r ) %2822~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2826~0(<2)◂{ } %2825~%[ "???" ] %2823~1'(= r ) %2822~0'(= r ) 
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
	jmp LB_3196
LB_3196:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3180
LB_3193:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3180:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_3178
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1110000010.. |}
; mov_ptn2.
	jmp LB_3179
LB_3178:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3172
LB_3179:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2827~{ } %2815~1'(= r ) %2814~0'(= r ) %2813~8'(= a47◂ [ *{ }] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2828~1(<2)◂{ } %2827~{ } %2815~1'(= r ) %2814~0'(= r ) %2813~8'(= a47◂ [ *{ }] ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=1 , %2829~0(<2)◂1(<2)◂{ } %2827~{ } %2815~1'(= r ) %2814~0'(= r ) %2813~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=1 , %2830~0(<2)◂0(<2)◂1(<2)◂{ } %2827~{ } %2815~1'(= r ) %2814~0'(= r ) %2813~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3200
LB_3200:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3021
LB_3172:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3021:
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
	jmp LB_3205
LB_3204:
	add r14,1 
LB_3205:
	cmp r14,r9
	jge LB_3206
	JZ_SPC BYTE [r13+8+r14], LB_3204
LB_3206:
	lea rax,[r14+7]
	cmp rax,r9
	jg LB_3208
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3208
	cmp BYTE [rdi+1],167
	jnz LB_3208
	cmp BYTE [rdi+2],194
	jnz LB_3208
	cmp BYTE [rdi+3],167
	jnz LB_3208
	cmp BYTE [rdi+4],43
	jnz LB_3208
	cmp BYTE [rdi+5],115
	jnz LB_3208
	cmp BYTE [rdi+6],56
	jnz LB_3208
	add r14,7
	jmp LB_3207
LB_3208:
	jmp LB_3203
LB_3207:
	push r14
	jmp LB_3214
LB_3213:
	add r14,1 
LB_3214:
	cmp r14,r9
	jge LB_3215
	JZ_SPC BYTE [r13+8+r14], LB_3213
LB_3215:
	call GRM_378
	cmp BYTE [r8+6],0
	jnz LB_3217
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
	jmp LB_3216
LB_3217:
	jmp LB_3212
LB_3216:
	jmp LB_3219
LB_3218:
	add r14,1 
LB_3219:
	cmp r14,r9
	jge LB_3220
	JZ_SPC BYTE [r13+8+r14], LB_3218
LB_3220:
	call GRM_379
	cmp BYTE [r8+6],0
	jnz LB_3222
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3221
LB_3222:
; .dlt.ptn { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3089
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_3212
LB_3221:
	jmp LB_3224
LB_3223:
; .dlt.ptn 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3053
	C_POP_REGS
; .dlt.ptn { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3089
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_3212
LB_3224:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2836~1'(= r ) %2835~0'(= r ) %2834~10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) %2833~{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 
; #25 { { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2837~0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %2836~1'(= r ) %2835~0'(= r ) 
; #266 0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2838~1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %2836~1'(= r ) %2835~0'(= r ) 
; #309 1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2839~0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %2836~1'(= r ) %2835~0'(= r ) 
; #26 0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2840~0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %2836~1'(= r ) %2835~0'(= r ) 
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
	jmp LB_3225
LB_3225:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3211
LB_3212:
	mov r14,QWORD [rsp]
	jmp LB_3229
LB_3228:
	add r14,1 
LB_3229:
	cmp r14,r9
	jge LB_3230
	JZ_SPC BYTE [r13+8+r14], LB_3228
LB_3230:
	call GRM_364
	cmp BYTE [r8+6],0
	jnz LB_3232
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3231
LB_3232:
	jmp LB_3227
LB_3231:
	jmp LB_3234
LB_3233:
; .dlt.ptn { }
	jmp LB_3227
LB_3234:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2843~1'(= r ) %2842~0'(= r ) %2841~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2844~1(<2)◂{ } %2843~1'(= r ) %2842~0'(= r ) %2841~{ } 
; $ %[ "grb_etr 1" ] ⊢ %[ "grb_etr 1" ]
;; rsp=0 , %2845~%[ "grb_etr 1" ] %2844~1(<2)◂{ } %2843~1'(= r ) %2842~0'(= r ) %2841~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2846~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } %2841~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2847~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } %2841~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2848~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } %2841~{ } 
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
	jmp LB_3235
LB_3235:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3211
LB_3227:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3211:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_3209
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 3'(= a47◂ [ a42◂ [ ]] )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_3210
LB_3209:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3202
LB_3210:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2849~3'(= a47◂ [ a42◂ [ ]] ) %2832~1'(= r ) %2831~0'(= r ) 
; #26 3'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
;; rsp=0 , %2850~0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) %2832~1'(= r ) %2831~0'(= r ) 
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
	jmp LB_3237
LB_3237:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3202
LB_3203:
	mov r14,QWORD [rsp] 
	jmp LB_3241
LB_3240:
	add r14,1 
LB_3241:
	cmp r14,r9
	jge LB_3242
	JZ_SPC BYTE [r13+8+r14], LB_3240
LB_3242:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3244
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3243
LB_3244:
	jmp LB_3239
LB_3243:
	jmp LB_3246
LB_3245:
	add r14,1 
LB_3246:
	cmp r14,r9
	jge LB_3247
	JZ_SPC BYTE [r13+8+r14], LB_3245
LB_3247:
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_3249
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3249
	cmp BYTE [rdi+1],167
	jnz LB_3249
	cmp BYTE [rdi+2],194
	jnz LB_3249
	cmp BYTE [rdi+3],167
	jnz LB_3249
	add r14,4
	jmp LB_3248
LB_3249:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3239
LB_3248:
	push r14
	jmp LB_3255
LB_3254:
	add r14,1 
LB_3255:
	cmp r14,r9
	jge LB_3256
	JZ_SPC BYTE [r13+8+r14], LB_3254
LB_3256:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3258
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3257
LB_3258:
	jmp LB_3253
LB_3257:
	jmp LB_3260
LB_3259:
	add r14,1 
LB_3260:
	cmp r14,r9
	jge LB_3261
	JZ_SPC BYTE [r13+8+r14], LB_3259
LB_3261:
	call GRM_366
	cmp BYTE [r8+6],0
	jnz LB_3263
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a43◂ [ ]] ) ⊢ 9'(= a47◂ [ a43◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3262
LB_3263:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3253
LB_3262:
	jmp LB_3265
LB_3264:
; .dlt.ptn 9'(= a47◂ [ a43◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3266
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_3253
LB_3265:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2857~1'(= r ) %2856~0'(= r ) %2855~9'(= a47◂ [ a43◂ [ ]] ) %2854~8'(= {| l |} ) 
;; ? 9'(= a47◂ [ a43◂ [ ]] ) ⊢ 0(<2)◂2'(= a43◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3274
	jmp LB_3275
LB_3274:
	jmp LB_3273
LB_3275:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2859~2'(= a43◂ [ ] ) %2857~1'(= r ) %2856~0'(= r ) %2854~8'(= {| l |} ) 
; #267 { 8'(= {| l |} ) 2'(= a43◂ [ ] ) } ⊢ 0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) }
;; rsp=2 , %2860~0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } %2857~1'(= r ) %2856~0'(= r ) 
; #309 0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } ⊢ 0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) }
;; rsp=2 , %2861~0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } %2857~1'(= r ) %2856~0'(= r ) 
; #26 0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } ⊢ 0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) }
;; rsp=2 , %2862~0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a43◂ [ ] ) } %2857~1'(= r ) %2856~0'(= r ) 
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
	jmp LB_3271
LB_3273:
;; ?. 9'(= a47◂ [ a43◂ [ ]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2858~2'(= a2◂ [ *{ rr{| l |}}] ) %2857~1'(= r ) %2856~0'(= r ) %2854~8'(= {| l |} ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2863~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2857~1'(= r ) %2856~0'(= r ) %2854~8'(= {| l |} ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2864~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2857~1'(= r ) %2856~0'(= r ) %2854~8'(= {| l |} ) 
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
	jmp LB_3271
LB_3271:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3252
LB_3253:
	mov r14,QWORD [rsp]
	jmp LB_3278
LB_3277:
	add r14,1 
LB_3278:
	cmp r14,r9
	jge LB_3279
	JZ_SPC BYTE [r13+8+r14], LB_3277
LB_3279:
	call GRM_365
	cmp BYTE [r8+6],0
	jnz LB_3281
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3280
LB_3281:
	jmp LB_3276
LB_3280:
	jmp LB_3283
LB_3282:
; .dlt.ptn { }
	jmp LB_3276
LB_3283:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2867~1'(= r ) %2866~0'(= r ) %2865~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2868~1(<2)◂{ } %2867~1'(= r ) %2866~0'(= r ) %2865~{ } 
; $ %[ "glb_etr 0.1" ] ⊢ %[ "glb_etr 0.1" ]
;; rsp=0 , %2869~%[ "glb_etr 0.1" ] %2868~1(<2)◂{ } %2867~1'(= r ) %2866~0'(= r ) %2865~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
;; rsp=0 , %2870~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } %2865~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
;; rsp=0 , %2871~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } %2865~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
;; rsp=0 , %2872~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } %2865~{ } 
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
	jmp LB_3284
LB_3284:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3252
LB_3276:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3252:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_3250
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 3'(= a47◂ [ a42◂ [ ]] )
; {| 1111000010.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_3251
LB_3250:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3202
LB_3251:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2873~3'(= a47◂ [ a42◂ [ ]] ) %2853~1'(= r ) %2852~0'(= r ) %2851~8'(= a47◂ [ *{ }] ) 
; #26 3'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
;; rsp=1 , %2874~0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) %2853~1'(= r ) %2852~0'(= r ) %2851~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3286
LB_3286:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3202
LB_3239:
	mov r14,QWORD [rsp] 
	jmp LB_3290
LB_3289:
	add r14,1 
LB_3290:
	cmp r14,r9
	jge LB_3291
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3289
LB_3291:
	call GRM_344
	cmp BYTE [r8+6],0
	jnz LB_3293
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3292
LB_3293:
	jmp LB_3288
LB_3292:
	jmp LB_3295
LB_3294:
	add r14,1 
LB_3295:
	cmp r14,r9
	jge LB_3296
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3294
LB_3296:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3298
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3298
	add r14,1
	jmp LB_3297
LB_3298:
; .dlt.ptn { }
	jmp LB_3288
LB_3297:
	jmp LB_3300
LB_3299:
	add r14,1 
LB_3300:
	cmp r14,r9
	jge LB_3301
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3299
LB_3301:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_3303
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3302
LB_3303:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_3288
LB_3302:
	jmp LB_3305
LB_3304:
; .dlt.ptn 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_3288
LB_3305:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2877~1'(= r ) %2876~0'(= r ) %2875~8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3309
	jmp LB_3310
LB_3309:
	jmp LB_3308
LB_3310:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2879~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2877~1'(= r ) %2876~0'(= r ) 
; #257 2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %2880~2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2877~1'(= r ) %2876~0'(= r ) 
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=1 , %2881~%[ "" ] %2880~2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %2877~1'(= r ) %2876~0'(= r ) 
; #265 { %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2882~2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2877~1'(= r ) %2876~0'(= r ) 
; #309 2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2883~0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2877~1'(= r ) %2876~0'(= r ) 
; #26 0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=1 , %2884~0(<2)◂0(<2)◂2(<6)◂{ %[ "" ] 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %2877~1'(= r ) %2876~0'(= r ) 
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
	jmp LB_3306
LB_3308:
;; ?. 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2878~2'(= a2◂ [ *{ rr{| l |}}] ) %2877~1'(= r ) %2876~0'(= r ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2885~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2877~1'(= r ) %2876~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2886~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2877~1'(= r ) %2876~0'(= r ) 
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
	jmp LB_3306
LB_3306:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3202
LB_3288:
	mov r14,QWORD [rsp]
	jmp LB_3313
LB_3312:
	add r14,1 
LB_3313:
	cmp r14,r9
	jge LB_3314
	JZ_SPC BYTE [r13+8+r14], LB_3312
LB_3314:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_3316
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3316
	cmp BYTE [rdi+1],167
	jnz LB_3316
	add r14,2
	jmp LB_3315
LB_3316:
	jmp LB_3311
LB_3315:
	push r14
	jmp LB_3322
LB_3321:
	add r14,1 
LB_3322:
	cmp r14,r9
	jge LB_3323
	JZ_SPC BYTE [r13+8+r14], LB_3321
LB_3323:
	call GRM_374
	cmp BYTE [r8+6],0
	jnz LB_3325
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 8'(= a47◂ [ a42◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3324
LB_3325:
	jmp LB_3320
LB_3324:
	jmp LB_3327
LB_3326:
; .dlt.ptn 8'(= a47◂ [ a42◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3038
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3320
LB_3327:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2891~1'(= r ) %2890~0'(= r ) %2889~8'(= a47◂ [ a42◂ [ ]] ) 
; #26 8'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂8'(= a47◂ [ a42◂ [ ]] )
;; rsp=1 , %2892~0(<2)◂8'(= a47◂ [ a42◂ [ ]] ) %2891~1'(= r ) %2890~0'(= r ) 
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
	jmp LB_3328
LB_3328:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3319
LB_3320:
	mov r14,QWORD [rsp]
	jmp LB_3332
LB_3331:
	add r14,1 
LB_3332:
	cmp r14,r9
	jge LB_3333
	JZ_SPC BYTE [r13+8+r14], LB_3331
LB_3333:
	call GRM_364
	cmp BYTE [r8+6],0
	jnz LB_3335
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3334
LB_3335:
	jmp LB_3330
LB_3334:
	jmp LB_3337
LB_3336:
; .dlt.ptn { }
	jmp LB_3330
LB_3337:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2895~1'(= r ) %2894~0'(= r ) %2893~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2896~1(<2)◂{ } %2895~1'(= r ) %2894~0'(= r ) %2893~{ } 
; $ %[ "glb_etr 3" ] ⊢ %[ "glb_etr 3" ]
;; rsp=0 , %2897~%[ "glb_etr 3" ] %2896~1(<2)◂{ } %2895~1'(= r ) %2894~0'(= r ) %2893~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
;; rsp=0 , %2898~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } %2893~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
;; rsp=0 , %2899~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } %2893~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
;; rsp=0 , %2900~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } %2893~{ } 
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
	jmp LB_3338
LB_3338:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3319
LB_3330:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3319:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_3317
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 3'(= a47◂ [ a42◂ [ ]] )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_3318
LB_3317:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3202
LB_3318:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2901~3'(= a47◂ [ a42◂ [ ]] ) %2888~1'(= r ) %2887~0'(= r ) 
; #26 3'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
;; rsp=0 , %2902~0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) %2888~1'(= r ) %2887~0'(= r ) 
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
	jmp LB_3340
LB_3340:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3202
LB_3311:
	mov r14,QWORD [rsp] 
	jmp LB_3344
LB_3343:
	add r14,1 
LB_3344:
	cmp r14,r9
	jge LB_3345
	JZ_SPC BYTE [r13+8+r14], LB_3343
LB_3345:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_3347
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3347
	cmp BYTE [rdi+1],182
	jnz LB_3347
	add r14,2
	jmp LB_3346
LB_3347:
	jmp LB_3342
LB_3346:
	push r14
	jmp LB_3353
LB_3352:
	add r14,1 
LB_3353:
	cmp r14,r9
	jge LB_3354
	JZ_SPC BYTE [r13+8+r14], LB_3352
LB_3354:
	call GRM_368
	cmp BYTE [r8+6],0
	jnz LB_3356
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a42◂ [ ] ) ⊢ 8'(= a42◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3355
LB_3356:
	jmp LB_3351
LB_3355:
	jmp LB_3358
LB_3357:
; .dlt.ptn 8'(= a42◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3043
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3351
LB_3358:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2907~1'(= r ) %2906~0'(= r ) %2905~8'(= a42◂ [ ] ) 
; #309 8'(= a42◂ [ ] ) ⊢ 0(<2)◂8'(= a42◂ [ ] )
;; rsp=1 , %2908~0(<2)◂8'(= a42◂ [ ] ) %2907~1'(= r ) %2906~0'(= r ) 
; #26 0(<2)◂8'(= a42◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a42◂ [ ] )
;; rsp=1 , %2909~0(<2)◂0(<2)◂8'(= a42◂ [ ] ) %2907~1'(= r ) %2906~0'(= r ) 
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
	jmp LB_3359
LB_3359:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3350
LB_3351:
	mov r14,QWORD [rsp]
	jmp LB_3363
LB_3362:
	add r14,1 
LB_3363:
	cmp r14,r9
	jge LB_3364
	JZ_SPC BYTE [r13+8+r14], LB_3362
LB_3364:
	call GRM_364
	cmp BYTE [r8+6],0
	jnz LB_3366
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3365
LB_3366:
	jmp LB_3361
LB_3365:
	jmp LB_3368
LB_3367:
; .dlt.ptn { }
	jmp LB_3361
LB_3368:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2912~1'(= r ) %2911~0'(= r ) %2910~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2913~1(<2)◂{ } %2912~1'(= r ) %2911~0'(= r ) %2910~{ } 
; $ %[ "glb_etr 4" ] ⊢ %[ "glb_etr 4" ]
;; rsp=0 , %2914~%[ "glb_etr 4" ] %2913~1(<2)◂{ } %2912~1'(= r ) %2911~0'(= r ) %2910~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
;; rsp=0 , %2915~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } %2910~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
;; rsp=0 , %2916~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } %2910~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
;; rsp=0 , %2917~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } %2910~{ } 
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
	jmp LB_3369
LB_3369:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3350
LB_3361:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3350:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_3348
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi 
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 3'(= a47◂ [ a42◂ [ ]] )
; {| 11110.. |}
	mov r9,r8
; mov_ptn2.
	jmp LB_3349
LB_3348:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3202
LB_3349:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2918~3'(= a47◂ [ a42◂ [ ]] ) %2904~1'(= r ) %2903~0'(= r ) 
; #26 3'(= a47◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂3'(= a47◂ [ a42◂ [ ]] )
;; rsp=0 , %2919~0(<2)◂3'(= a47◂ [ a42◂ [ ]] ) %2904~1'(= r ) %2903~0'(= r ) 
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
	jmp LB_3371
LB_3371:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3202
LB_3342:
	mov r14,QWORD [rsp] 
	mov r8,unt_1
LB_3202:
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
	jmp LB_3376
LB_3375:
	add r14,1 
LB_3376:
	cmp r14,r9
	jge LB_3377
	JZ_SPC BYTE [r13+8+r14], LB_3375
LB_3377:
	call GRM_340
	cmp BYTE [r8+6],0
	jnz LB_3379
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3378
LB_3379:
	jmp LB_3374
LB_3378:
	jmp LB_3381
LB_3380:
	add r14,1 
LB_3381:
	cmp r14,r9
	jge LB_3382
	JZ_SPC BYTE [r13+8+r14], LB_3380
LB_3382:
	call GRM_364
	cmp BYTE [r8+6],0
	jnz LB_3384
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3383
LB_3384:
; .dlt.ptn { }
	jmp LB_3374
LB_3383:
	jmp LB_3386
LB_3385:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_3374
LB_3386:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2923~1'(= r ) %2922~0'(= r ) %2921~{ } %2920~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2924~0(<2)◂{ } %2923~1'(= r ) %2922~0'(= r ) %2921~{ } %2920~{ } 
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
	jmp LB_3387
LB_3387:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3373
LB_3374:
	mov r14,QWORD [rsp]
	jmp LB_3391
LB_3390:
	jmp LB_3389
LB_3391:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2926~1'(= r ) %2925~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2927~0(<2)◂{ } %2926~1'(= r ) %2925~0'(= r ) 
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
	jmp LB_3392
LB_3392:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3373
LB_3389:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3373:
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
	jmp LB_3397
LB_3396:
	add r14,1 
LB_3397:
	cmp r14,r9
	jge LB_3398
	JZ_SPC BYTE [r13+8+r14], LB_3396
LB_3398:
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_3400
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3400
	cmp BYTE [rdi+1],136
	jnz LB_3400
	cmp BYTE [rdi+2],142
	jnz LB_3400
	cmp BYTE [rdi+3],226
	jnz LB_3400
	cmp BYTE [rdi+4],136
	jnz LB_3400
	cmp BYTE [rdi+5],142
	jnz LB_3400
	add r14,6
	jmp LB_3399
LB_3400:
	jmp LB_3395
LB_3399:
	jmp LB_3402
LB_3401:
; .dlt.ptn { }
	jmp LB_3395
LB_3402:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2929~1'(= r ) %2928~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2930~0(<2)◂{ } %2929~1'(= r ) %2928~0'(= r ) 
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
	jmp LB_3403
LB_3403:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3394
LB_3395:
	mov r14,QWORD [rsp]
	jmp LB_3407
LB_3406:
	add r14,1 
LB_3407:
	cmp r14,r9
	jge LB_3408
	JZ_SPC BYTE [r13+8+r14], LB_3406
LB_3408:
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_3410
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3410
	cmp BYTE [rdi+1],167
	jnz LB_3410
	cmp BYTE [rdi+2],194
	jnz LB_3410
	cmp BYTE [rdi+3],167
	jnz LB_3410
	add r14,4
	jmp LB_3409
LB_3410:
	jmp LB_3405
LB_3409:
	push r14
	jmp LB_3416
LB_3415:
	add r14,1 
LB_3416:
	cmp r14,r9
	jge LB_3417
	JZ_SPC BYTE [r13+8+r14], LB_3415
LB_3417:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3419
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3418
LB_3419:
	jmp LB_3414
LB_3418:
	jmp LB_3421
LB_3420:
	add r14,1 
LB_3421:
	cmp r14,r9
	jge LB_3422
	JZ_SPC BYTE [r13+8+r14], LB_3420
LB_3422:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3424
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3424
	add r14,1
	jmp LB_3423
LB_3424:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3414
LB_3423:
	jmp LB_3426
LB_3425:
	add r14,1 
LB_3426:
	cmp r14,r9
	jge LB_3427
	JZ_SPC BYTE [r13+8+r14], LB_3425
LB_3427:
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_3429
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 9'(= a18◂ [ ] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3428
LB_3429:
; .dlt.ptn { }
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3414
LB_3428:
	jmp LB_3431
LB_3430:
	add r14,1 
LB_3431:
	cmp r14,r9
	jge LB_3432
	JZ_SPC BYTE [r13+8+r14], LB_3430
LB_3432:
	call GRM_365
	cmp BYTE [r8+6],0
	jnz LB_3434
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110000110.. |}
; mov_ptn2.
	jmp LB_3433
LB_3434:
; .dlt.ptn 9'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_3414
LB_3433:
	jmp LB_3436
LB_3435:
; .dlt.ptn { }
; .dlt.ptn 9'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_3414
LB_3436:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2937~1'(= r ) %2936~0'(= r ) %2935~{ } %2934~9'(= a18◂ [ ] ) %2933~8'(= {| l |} ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=2 , %2938~0(<2)◂{ } %2937~1'(= r ) %2936~0'(= r ) %2935~{ } %2934~9'(= a18◂ [ ] ) %2933~8'(= {| l |} ) 
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
	call LB_355
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
	jmp LB_3437
LB_3437:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3413
LB_3414:
	mov r14,QWORD [rsp]
	jmp LB_3441
LB_3440:
	add r14,1 
LB_3441:
	cmp r14,r9
	jge LB_3442
	JZ_SPC BYTE [r13+8+r14], LB_3440
LB_3442:
	call GRM_365
	cmp BYTE [r8+6],0
	jnz LB_3444
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3443
LB_3444:
	jmp LB_3439
LB_3443:
	jmp LB_3446
LB_3445:
	add r14,1 
LB_3446:
	cmp r14,r9
	jge LB_3447
	JZ_SPC BYTE [r13+8+r14], LB_3445
LB_3447:
	call GRM_365
	cmp BYTE [r8+6],0
	jnz LB_3449
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3448
LB_3449:
; .dlt.ptn { }
	jmp LB_3439
LB_3448:
	jmp LB_3451
LB_3450:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_3439
LB_3451:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2942~1'(= r ) %2941~0'(= r ) %2940~{ } %2939~{ } 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2943~0(<2)◂{ } %2942~1'(= r ) %2941~0'(= r ) %2940~{ } %2939~{ } 
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
	jmp LB_3452
LB_3452:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3413
LB_3439:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3413:
; discard r14
	add rsp,8
	cmp BYTE [r8+6],0
	jnz LB_3411
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1110.. |}
; mov_ptn2.
	jmp LB_3412
LB_3411:
; .dlt.ptn { }
	jmp LB_3405
LB_3412:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2944~{ } %2932~1'(= r ) %2931~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2945~0(<2)◂{ } %2944~{ } %2932~1'(= r ) %2931~0'(= r ) 
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
	jmp LB_3454
LB_3454:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3394
LB_3405:
	mov r14,QWORD [rsp]
	jmp LB_3458
LB_3457:
	add r14,1 
LB_3458:
	cmp r14,r9
	jge LB_3459
	JZ_SPC BYTE [r13+8+r14], LB_3457
LB_3459:
	cmp r14,r9
	jge LB_3461
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_3460
LB_3461:
	jmp LB_3456
LB_3460:
	jmp LB_3463
LB_3462:
	add r14,1 
LB_3463:
	cmp r14,r9
	jge LB_3464
	JZ_SPC BYTE [r13+8+r14], LB_3462
LB_3464:
	call GRM_365
	cmp BYTE [r8+6],0
	jnz LB_3466
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 1111000010.. |}
; mov_ptn2.
	jmp LB_3465
LB_3466:
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3456
LB_3465:
	jmp LB_3468
LB_3467:
; .dlt.ptn { }
; .dlt.ptn 8'(= r )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3456
LB_3468:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %2949~1'(= r ) %2948~0'(= r ) %2947~{ } %2946~8'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2950~0(<2)◂{ } %2949~1'(= r ) %2948~0'(= r ) %2947~{ } %2946~8'(= r ) 
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
	jmp LB_3469
LB_3469:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3394
LB_3456:
	mov r14,QWORD [rsp]
	jmp LB_3473
LB_3472:
	jmp LB_3471
LB_3473:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2952~1'(= r ) %2951~0'(= r ) 
; #26 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2953~0(<2)◂{ } %2952~1'(= r ) %2951~0'(= r ) 
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
	jmp LB_3474
LB_3474:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3394
LB_3471:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3394:
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
	jmp LB_3479
LB_3478:
	add r14,1 
LB_3479:
	cmp r14,r9
	jge LB_3480
	JZ_SPC BYTE [r13+8+r14], LB_3478
LB_3480:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3482
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3482
	add r14,1
	jmp LB_3481
LB_3482:
	jmp LB_3477
LB_3481:
	jmp LB_3484
LB_3483:
	add r14,1 
LB_3484:
	cmp r14,r9
	jge LB_3485
	JZ_SPC BYTE [r13+8+r14], LB_3483
LB_3485:
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_3487
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3486
LB_3487:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3476
LB_3486:
	jmp LB_3489
LB_3488:
	add r14,1 
LB_3489:
	cmp r14,r9
	jge LB_3490
	JZ_SPC BYTE [r13+8+r14], LB_3488
LB_3490:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3492
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3491
LB_3492:
; .dlt.ptn 8'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3476
LB_3491:
	jmp LB_3494
LB_3493:
; .dlt.ptn 9'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn 8'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3476
LB_3494:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2957~1'(= r ) %2956~0'(= r ) %2955~9'(= a47◂ [ *{ }] ) %2954~8'(= a18◂ [ ] ) 
; #260 8'(= a18◂ [ ] ) ⊢ 1(<2)◂8'(= a18◂ [ ] )
;; rsp=2 , %2958~1(<2)◂8'(= a18◂ [ ] ) %2957~1'(= r ) %2956~0'(= r ) %2955~9'(= a47◂ [ *{ }] ) 
; #309 1(<2)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂1(<2)◂8'(= a18◂ [ ] )
;; rsp=2 , %2959~0(<2)◂1(<2)◂8'(= a18◂ [ ] ) %2957~1'(= r ) %2956~0'(= r ) %2955~9'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂0(<2)◂1(<2)◂8'(= a18◂ [ ] )
;; rsp=2 , %2960~0(<2)◂0(<2)◂1(<2)◂8'(= a18◂ [ ] ) %2957~1'(= r ) %2956~0'(= r ) %2955~9'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3495
LB_3495:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3476
LB_3477:
	mov r14,QWORD [rsp] 
	jmp LB_3499
LB_3498:
	add r14,1 
LB_3499:
	cmp r14,r9
	jge LB_3500
	JZ_SPC BYTE [r13+8+r14], LB_3498
LB_3500:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3502
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3501
LB_3502:
	jmp LB_3497
LB_3501:
	jmp LB_3504
LB_3503:
	add r14,1 
LB_3504:
	cmp r14,r9
	jge LB_3505
	JZ_SPC BYTE [r13+8+r14], LB_3503
LB_3505:
	call GRM_367
	cmp BYTE [r8+6],0
	jnz LB_3507
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 9'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3506
LB_3507:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3497
LB_3506:
	jmp LB_3509
LB_3508:
; .dlt.ptn 9'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3152
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_3497
LB_3509:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2964~1'(= r ) %2963~0'(= r ) %2962~9'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %2961~8'(= a47◂ [ *{ }] ) 
;; ? 9'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3513
	jmp LB_3514
LB_3513:
	jmp LB_3512
LB_3514:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2966~2'(= a2◂ [ a42◂ [ ]] ) %2964~1'(= r ) %2963~0'(= r ) %2961~8'(= a47◂ [ *{ }] ) 
; #261 2'(= a2◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
;; rsp=2 , %2967~0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) %2964~1'(= r ) %2963~0'(= r ) %2961~8'(= a47◂ [ *{ }] ) 
; #309 0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
;; rsp=2 , %2968~0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) %2964~1'(= r ) %2963~0'(= r ) %2961~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
;; rsp=2 , %2969~0(<2)◂0(<2)◂0(<2)◂2'(= a2◂ [ a42◂ [ ]] ) %2964~1'(= r ) %2963~0'(= r ) %2961~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3510
LB_3512:
;; ?. 9'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %2965~2'(= a2◂ [ *{ rr{| l |}}] ) %2964~1'(= r ) %2963~0'(= r ) %2961~8'(= a47◂ [ *{ }] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2970~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2964~1'(= r ) %2963~0'(= r ) %2961~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2971~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2964~1'(= r ) %2963~0'(= r ) %2961~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3510
LB_3510:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3476
LB_3497:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3476:
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
	jmp LB_3518
LB_3517:
	add r14,1 
LB_3518:
	cmp r14,r9
	jge LB_3519
	JZ_SPC BYTE [r13+8+r14], LB_3517
LB_3519:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3521
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3520
LB_3521:
	jmp LB_3516
LB_3520:
	jmp LB_3523
LB_3522:
	add r14,1 
LB_3523:
	cmp r14,r9
	jge LB_3524
	JZ_SPC BYTE [r13+8+r14], LB_3522
LB_3524:
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_3526
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3526
	cmp BYTE [rdi+1],136
	jnz LB_3526
	cmp BYTE [rdi+2],142
	jnz LB_3526
	cmp BYTE [rdi+3],226
	jnz LB_3526
	cmp BYTE [rdi+4],136
	jnz LB_3526
	cmp BYTE [rdi+5],142
	jnz LB_3526
	add r14,6
	jmp LB_3525
LB_3526:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3516
LB_3525:
	jmp LB_3528
LB_3527:
	add r14,1 
LB_3528:
	cmp r14,r9
	jge LB_3529
	JZ_SPC BYTE [r13+8+r14], LB_3527
LB_3529:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3531
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 9'(= a47◂ [ *{ }] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3530
LB_3531:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3516
LB_3530:
	jmp LB_3533
LB_3532:
; .dlt.ptn 9'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_3516
LB_3533:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %2975~1'(= r ) %2974~0'(= r ) %2973~9'(= a47◂ [ *{ }] ) %2972~8'(= a47◂ [ *{ }] ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2976~1(<2)◂{ } %2975~1'(= r ) %2974~0'(= r ) %2973~9'(= a47◂ [ *{ }] ) %2972~8'(= a47◂ [ *{ }] ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=2 , %2977~0(<2)◂1(<2)◂{ } %2975~1'(= r ) %2974~0'(= r ) %2973~9'(= a47◂ [ *{ }] ) %2972~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=2 , %2978~0(<2)◂0(<2)◂1(<2)◂{ } %2975~1'(= r ) %2974~0'(= r ) %2973~9'(= a47◂ [ *{ }] ) %2972~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
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
	jmp LB_3534
LB_3534:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3515
LB_3516:
	mov r14,QWORD [rsp]
	jmp LB_3538
LB_3537:
	add r14,1 
LB_3538:
	cmp r14,r9
	jge LB_3539
	JZ_SPC BYTE [r13+8+r14], LB_3537
LB_3539:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3541
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3540
LB_3541:
	jmp LB_3536
LB_3540:
	jmp LB_3543
LB_3542:
	add r14,1 
LB_3543:
	cmp r14,r9
	jge LB_3544
	JZ_SPC BYTE [r13+8+r14], LB_3542
LB_3544:
	call GRM_363
	cmp BYTE [r8+6],0
	jnz LB_3546
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a42◂ [ ]] ) ⊢ 9'(= a47◂ [ a42◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3545
LB_3546:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3536
LB_3545:
	jmp LB_3548
LB_3547:
	add r14,1 
LB_3548:
	cmp r14,r9
	jge LB_3549
	JZ_SPC BYTE [r13+8+r14], LB_3547
LB_3549:
	call GRM_367
	cmp BYTE [r8+6],0
	jnz LB_3551
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3550
LB_3551:
; .dlt.ptn 9'(= a47◂ [ a42◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3038
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_3536
LB_3550:
	jmp LB_3553
LB_3552:
; .dlt.ptn 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3152
	C_POP_REGS
; .dlt.ptn 9'(= a47◂ [ a42◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3038
	C_POP_REGS
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_3536
LB_3553:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %2983~1'(= r ) %2982~0'(= r ) %2981~10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %2980~9'(= a47◂ [ a42◂ [ ]] ) %2979~8'(= a47◂ [ *{ }] ) 
; #311 { 9'(= a47◂ [ a42◂ [ ]] ) 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 9'(= a47◂ [ a42◂ [ ]] ) 10'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) } ⊢ { 0'(= a47◂ [ a42◂ [ ]] ) 1'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) }
; {| 11000000111110.. |}
	mov r14,QWORD [rsp-8+8*3]
	mov r13,QWORD [rsp-8+8*4]
; mov_ptn2.
	call LB_3159
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=1 , %2984~2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) %2983~1'(= r ) %2982~0'(= r ) %2979~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) ⊢ 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_3557
	jmp LB_3558
LB_3557:
	jmp LB_3556
LB_3558:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=1 , %2987~4'(= a2◂ [ a42◂ [ ]] ) %2986~3'(= a42◂ [ ] ) %2983~1'(= r ) %2982~0'(= r ) %2979~8'(= a47◂ [ *{ }] ) 
; #25 { 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %2988~0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %2983~1'(= r ) %2982~0'(= r ) %2979~8'(= a47◂ [ *{ }] ) 
; #309 0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %2989~0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %2983~1'(= r ) %2982~0'(= r ) %2979~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) }
;; rsp=1 , %2990~0(<2)◂0(<2)◂0(<2)◂{ 3'(= a42◂ [ ] ) 4'(= a2◂ [ a42◂ [ ]] ) } %2983~1'(= r ) %2982~0'(= r ) %2979~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3554
LB_3556:
;; ?. 2'(= a47◂ [ *{ a42◂ [ ]a2◂ [ a42◂ [ ]]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %2985~3'(= a2◂ [ *{ rr{| l |}}] ) %2983~1'(= r ) %2982~0'(= r ) %2979~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2991~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2983~1'(= r ) %2982~0'(= r ) %2979~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2992~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2983~1'(= r ) %2982~0'(= r ) %2979~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3554
LB_3554:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3515
LB_3536:
	mov r14,QWORD [rsp]
	call GRM_365
	cmp BYTE [r8+6],0
	jnz LB_3561
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; {| 11110.. |}
; mov_ptn2.
	jmp LB_3560
LB_3561:
	jmp LB_3559
LB_3560:
	jmp LB_3563
LB_3562:
; .dlt.ptn { }
	jmp LB_3559
LB_3563:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %2995~1'(= r ) %2994~0'(= r ) %2993~{ } 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2996~1(<2)◂{ } %2995~1'(= r ) %2994~0'(= r ) %2993~{ } 
; $ %[ "glb_etr 7" ] ⊢ %[ "glb_etr 7" ]
;; rsp=0 , %2997~%[ "glb_etr 7" ] %2996~1(<2)◂{ } %2995~1'(= r ) %2994~0'(= r ) %2993~{ } 
; #25 { { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
;; rsp=0 , %2998~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } %2993~{ } 
; #308 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
;; rsp=0 , %2999~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } %2993~{ } 
; #26 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
;; rsp=0 , %3000~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } %2993~{ } 
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
	jmp LB_3564
LB_3564:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3515
LB_3559:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3515:
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
	jmp LB_3569
LB_3568:
	add r14,1 
LB_3569:
	cmp r14,r9
	jge LB_3570
	JZ_SPC BYTE [r13+8+r14], LB_3568
LB_3570:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3572
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_3572
	add r14,1
	jmp LB_3571
LB_3572:
	jmp LB_3567
LB_3571:
	jmp LB_3574
LB_3573:
	add r14,1 
LB_3574:
	cmp r14,r9
	jge LB_3575
	JZ_SPC BYTE [r13+8+r14], LB_3573
LB_3575:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3577
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3577
	add r14,1
	jmp LB_3576
LB_3577:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3566
LB_3576:
	jmp LB_3579
LB_3578:
	add r14,1 
LB_3579:
	cmp r14,r9
	jge LB_3580
	JZ_SPC BYTE [r13+8+r14], LB_3578
LB_3580:
	call GRM_369
	cmp BYTE [r8+6],0
	jnz LB_3582
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
	jmp LB_3581
LB_3582:
; .dlt.ptn { }
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3566
LB_3581:
	jmp LB_3584
LB_3583:
	add r14,1 
LB_3584:
	cmp r14,r9
	jge LB_3585
	JZ_SPC BYTE [r13+8+r14], LB_3583
LB_3585:
	call GRM_372
	cmp BYTE [r8+6],0
	jnz LB_3587
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3586
LB_3587:
; .dlt.ptn { 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3056
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3566
LB_3586:
	jmp LB_3589
LB_3588:
; .dlt.ptn 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3057
	C_POP_REGS
; .dlt.ptn { 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3056
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3566
LB_3589:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %3004~1'(= r ) %3003~0'(= r ) %3002~10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) %3001~{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 
; #25 { { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=3 , %3005~0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3004~1'(= r ) %3003~0'(= r ) 
; #262 0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=3 , %3006~5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3004~1'(= r ) %3003~0'(= r ) 
; #26 5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=3 , %3007~0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3004~1'(= r ) %3003~0'(= r ) 
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
	jmp LB_3590
LB_3590:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3566
LB_3567:
	mov r14,QWORD [rsp] 
	jmp LB_3594
LB_3593:
	add r14,1 
LB_3594:
	cmp r14,r9
	jge LB_3595
	JZ_SPC BYTE [r13+8+r14], LB_3593
LB_3595:
	call GRM_369
	cmp BYTE [r8+6],0
	jnz LB_3597
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
	jmp LB_3596
LB_3597:
	jmp LB_3592
LB_3596:
	jmp LB_3599
LB_3598:
; .dlt.ptn { 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3056
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_3592
LB_3599:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3010~1'(= r ) %3009~0'(= r ) %3008~{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } 
; #263 { 8'(= {| l |} ) 9'(= a45◂ [ ] ) } ⊢ 4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
;; rsp=2 , %3011~4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } %3010~1'(= r ) %3009~0'(= r ) 
; #26 4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } ⊢ 0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) }
;; rsp=2 , %3012~0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a45◂ [ ] ) } %3010~1'(= r ) %3009~0'(= r ) 
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
	jmp LB_3600
LB_3600:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3566
LB_3592:
	mov r14,QWORD [rsp]
	jmp LB_3604
LB_3603:
	jmp LB_3602
LB_3604:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3014~1'(= r ) %3013~0'(= r ) 
; $ %[ "dt_etr 0" ] ⊢ %[ "dt_etr 0" ]
;; rsp=0 , %3015~%[ "dt_etr 0" ] %3014~1'(= r ) %3013~0'(= r ) 
; #10 %[ "dt_etr 0" ] ⊢ %[ "dt_etr 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3607
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3608
LB_3608:
;; rsp=0 , %3016~%[ "dt_etr 0" ] %3014~1'(= r ) %3013~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3017~1(<2)◂{ } %3016~%[ "dt_etr 0" ] %3014~1'(= r ) %3013~0'(= r ) 
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
	jmp LB_3605
LB_3605:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3566
LB_3602:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3566:
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
	jmp LB_3612
LB_3611:
	add r14,1 
LB_3612:
	cmp r14,r9
	jge LB_3613
	JZ_SPC BYTE [r13+8+r14], LB_3611
LB_3613:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3615
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3614
LB_3615:
	jmp LB_3610
LB_3614:
	jmp LB_3617
LB_3616:
	add r14,1 
LB_3617:
	cmp r14,r9
	jge LB_3618
	JZ_SPC BYTE [r13+8+r14], LB_3616
LB_3618:
	call GRM_370
	cmp BYTE [r8+6],0
	jnz LB_3620
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3619
LB_3620:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3610
LB_3619:
	jmp LB_3622
LB_3621:
	add r14,1 
LB_3622:
	cmp r14,r9
	jge LB_3623
	JZ_SPC BYTE [r13+8+r14], LB_3621
LB_3623:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3625
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3625
	add r14,1
	jmp LB_3624
LB_3625:
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_3610
LB_3624:
	jmp LB_3627
LB_3626:
	add r14,1 
LB_3627:
	cmp r14,r9
	jge LB_3628
	JZ_SPC BYTE [r13+8+r14], LB_3626
LB_3628:
	call GRM_328
	cmp BYTE [r8+6],0
	jnz LB_3630
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 10'(= a34◂ [ ] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3629
LB_3630:
; .dlt.ptn { }
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3609
LB_3629:
	jmp LB_3632
LB_3631:
; .dlt.ptn 10'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3609
LB_3632:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %3022~1'(= r ) %3021~0'(= r ) %3020~10'(= a34◂ [ ] ) %3019~9'(= a2◂ [ {| l |}] ) %3018~8'(= {| l |} ) 
; #255 { 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } ⊢ 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) }
;; rsp=3 , %3023~1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } %3022~1'(= r ) %3021~0'(= r ) %3018~8'(= {| l |} ) 
; #26 { 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } } ⊢ 0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } }
;; rsp=3 , %3024~0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a34◂ [ ] ) } } %3022~1'(= r ) %3021~0'(= r ) 
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
	jmp LB_3633
LB_3633:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3609
LB_3610:
	mov r14,QWORD [rsp] 
	jmp LB_3637
LB_3636:
	add r14,1 
LB_3637:
	cmp r14,r9
	jge LB_3638
	JZ_SPC BYTE [r13+8+r14], LB_3636
LB_3638:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3640
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3639
LB_3640:
	jmp LB_3635
LB_3639:
	jmp LB_3642
LB_3641:
	add r14,1 
LB_3642:
	cmp r14,r9
	jge LB_3643
	JZ_SPC BYTE [r13+8+r14], LB_3641
LB_3643:
	call GRM_370
	cmp BYTE [r8+6],0
	jnz LB_3645
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3644
LB_3645:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3635
LB_3644:
	jmp LB_3647
LB_3646:
	add r14,1 
LB_3647:
	cmp r14,r9
	jge LB_3648
	JZ_SPC BYTE [r13+8+r14], LB_3646
LB_3648:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3650
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 10'(= a47◂ [ *{ }] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3649
LB_3650:
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_3635
LB_3649:
	jmp LB_3652
LB_3651:
	add r14,1 
LB_3652:
	cmp r14,r9
	jge LB_3653
	JZ_SPC BYTE [r13+8+r14], LB_3651
LB_3653:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3655
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3655
	cmp BYTE [rdi+1],136
	jnz LB_3655
	cmp BYTE [rdi+2],144
	jnz LB_3655
	add r14,3
	jmp LB_3654
LB_3655:
; .dlt.ptn 10'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_3635
LB_3654:
	jmp LB_3657
LB_3656:
	add r14,1 
LB_3657:
	cmp r14,r9
	jge LB_3658
	JZ_SPC BYTE [r13+8+r14], LB_3656
LB_3658:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3660
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 11'(= {| l |} )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3659
LB_3660:
; .dlt.ptn { }
; .dlt.ptn 10'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_3635
LB_3659:
	jmp LB_3662
LB_3661:
	add r14,1 
LB_3662:
	cmp r14,r9
	jge LB_3663
	JZ_SPC BYTE [r13+8+r14], LB_3661
LB_3663:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3665
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_3665
	add r14,1
	jmp LB_3664
LB_3665:
; .dlt.ptn 11'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 10'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	jmp LB_3635
LB_3664:
	jmp LB_3667
LB_3666:
	add r14,1 
LB_3667:
	cmp r14,r9
	jge LB_3668
	JZ_SPC BYTE [r13+8+r14], LB_3666
LB_3668:
	call GRM_328
	cmp BYTE [r8+6],0
	jnz LB_3670
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 12'(= a34◂ [ ] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3669
LB_3670:
; .dlt.ptn { }
; .dlt.ptn 11'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 10'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	jmp LB_3635
LB_3669:
	jmp LB_3672
LB_3671:
	add r14,1 
LB_3672:
	cmp r14,r9
	jge LB_3673
	JZ_SPC BYTE [r13+8+r14], LB_3671
LB_3673:
	call GRM_373
	cmp BYTE [r8+6],0
	jnz LB_3675
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
; {| 111100001111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3674
LB_3675:
; .dlt.ptn 12'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 11'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 10'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 5
	add rsp,40
	jmp LB_3635
LB_3674:
	jmp LB_3677
LB_3676:
; .dlt.ptn 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3067
	C_POP_REGS
; .dlt.ptn 12'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 11'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 10'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*6]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 6
	add rsp,48
	jmp LB_3635
LB_3677:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*6]
;; rsp=6 , %3032~1'(= r ) %3031~0'(= r ) %3030~13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %3029~12'(= a34◂ [ ] ) %3028~11'(= {| l |} ) %3027~10'(= a47◂ [ *{ }] ) %3026~9'(= a2◂ [ {| l |}] ) %3025~8'(= {| l |} ) 
; #25 { { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=6 , %3033~0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %3032~1'(= r ) %3031~0'(= r ) %3027~10'(= a47◂ [ *{ }] ) %3026~9'(= a2◂ [ {| l |}] ) %3025~8'(= {| l |} ) 
; #256 { 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } ⊢ 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } }
;; rsp=6 , %3034~0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } %3032~1'(= r ) %3031~0'(= r ) %3027~10'(= a47◂ [ *{ }] ) %3025~8'(= {| l |} ) 
; #26 { 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } } ⊢ 0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } }
;; rsp=6 , %3035~0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a34◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } } } %3032~1'(= r ) %3031~0'(= r ) %3027~10'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3678
LB_3678:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3609
LB_3635:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3609:
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
	jmp LB_3683
LB_3682:
	add r14,1 
LB_3683:
	cmp r14,r9
	jge LB_3684
	JZ_SPC BYTE [r13+8+r14], LB_3682
LB_3684:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3686
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3686
	cmp BYTE [rdi+1],151
	jnz LB_3686
	cmp BYTE [rdi+2],130
	jnz LB_3686
	add r14,3
	jmp LB_3685
LB_3686:
	jmp LB_3681
LB_3685:
	jmp LB_3688
LB_3687:
	add r14,1 
LB_3688:
	cmp r14,r9
	jge LB_3689
	JZ_SPC BYTE [r13+8+r14], LB_3687
LB_3689:
	call GRM_333
	cmp BYTE [r8+6],0
	jnz LB_3691
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3690
LB_3691:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3680
LB_3690:
	jmp LB_3693
LB_3692:
	add r14,1 
LB_3693:
	cmp r14,r9
	jge LB_3694
	JZ_SPC BYTE [r13+8+r14], LB_3692
LB_3694:
	call GRM_371
	cmp BYTE [r8+6],0
	jnz LB_3696
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3695
LB_3696:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3680
LB_3695:
	jmp LB_3698
LB_3697:
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3680
LB_3698:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3039~1'(= r ) %3038~0'(= r ) %3037~9'(= a2◂ [ {| l |}] ) %3036~8'(= {| l |} ) 
; #25 { 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3040~0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3039~1'(= r ) %3038~0'(= r ) 
; #26 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3041~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3039~1'(= r ) %3038~0'(= r ) 
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
	jmp LB_3699
LB_3699:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3680
LB_3681:
	mov r14,QWORD [rsp] 
	jmp LB_3703
LB_3702:
	add r14,1 
LB_3703:
	cmp r14,r9
	jge LB_3704
	JZ_SPC BYTE [r13+8+r14], LB_3702
LB_3704:
	call GRM_333
	cmp BYTE [r8+6],0
	jnz LB_3706
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3705
LB_3706:
	jmp LB_3701
LB_3705:
	jmp LB_3708
LB_3707:
	add r14,1 
LB_3708:
	cmp r14,r9
	jge LB_3709
	JZ_SPC BYTE [r13+8+r14], LB_3707
LB_3709:
	call GRM_371
	cmp BYTE [r8+6],0
	jnz LB_3711
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3710
LB_3711:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3680
LB_3710:
	jmp LB_3713
LB_3712:
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3680
LB_3713:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3045~1'(= r ) %3044~0'(= r ) %3043~9'(= a2◂ [ {| l |}] ) %3042~8'(= {| l |} ) 
; #25 { 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3046~0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3045~1'(= r ) %3044~0'(= r ) 
; #26 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3047~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3045~1'(= r ) %3044~0'(= r ) 
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
	jmp LB_3714
LB_3714:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3680
LB_3701:
	mov r14,QWORD [rsp] 
	jmp LB_3718
LB_3717:
	jmp LB_3716
LB_3718:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3049~1'(= r ) %3048~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3050~1(<2)◂{ } %3049~1'(= r ) %3048~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3051~0(<2)◂1(<2)◂{ } %3049~1'(= r ) %3048~0'(= r ) 
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
	jmp LB_3719
LB_3719:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3680
LB_3716:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3680:
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
	jmp LB_3724
LB_3723:
	add r14,1 
LB_3724:
	cmp r14,r9
	jge LB_3725
	JZ_SPC BYTE [r13+8+r14], LB_3723
LB_3725:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3727
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_3727
	add r14,1
	jmp LB_3726
LB_3727:
	jmp LB_3722
LB_3726:
	jmp LB_3729
LB_3728:
	add r14,1 
LB_3729:
	cmp r14,r9
	jge LB_3730
	JZ_SPC BYTE [r13+8+r14], LB_3728
LB_3730:
	call GRM_333
	cmp BYTE [r8+6],0
	jnz LB_3732
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3731
LB_3732:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3721
LB_3731:
	jmp LB_3734
LB_3733:
	add r14,1 
LB_3734:
	cmp r14,r9
	jge LB_3735
	JZ_SPC BYTE [r13+8+r14], LB_3733
LB_3735:
	call GRM_371
	cmp BYTE [r8+6],0
	jnz LB_3737
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3736
LB_3737:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3721
LB_3736:
	jmp LB_3739
LB_3738:
; .dlt.ptn 9'(= a2◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3066
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3721
LB_3739:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3055~1'(= r ) %3054~0'(= r ) %3053~9'(= a2◂ [ {| l |}] ) %3052~8'(= {| l |} ) 
; #25 { 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3056~0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3055~1'(= r ) %3054~0'(= r ) 
; #26 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %3057~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %3055~1'(= r ) %3054~0'(= r ) 
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
	jmp LB_3740
LB_3740:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3721
LB_3722:
	mov r14,QWORD [rsp] 
	jmp LB_3744
LB_3743:
	jmp LB_3742
LB_3744:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3059~1'(= r ) %3058~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3060~1(<2)◂{ } %3059~1'(= r ) %3058~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3061~0(<2)◂1(<2)◂{ } %3059~1'(= r ) %3058~0'(= r ) 
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
	jmp LB_3745
LB_3745:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3721
LB_3742:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3721:
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
	jmp LB_3750
LB_3749:
	add r14,1 
LB_3750:
	cmp r14,r9
	jge LB_3751
	JZ_SPC BYTE [r13+8+r14], LB_3749
LB_3751:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3753
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3752
LB_3753:
	jmp LB_3748
LB_3752:
	jmp LB_3755
LB_3754:
	add r14,1 
LB_3755:
	cmp r14,r9
	jge LB_3756
	JZ_SPC BYTE [r13+8+r14], LB_3754
LB_3756:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3758
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_3758
	add r14,1
	jmp LB_3757
LB_3758:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3748
LB_3757:
	jmp LB_3760
LB_3759:
	add r14,1 
LB_3760:
	cmp r14,r9
	jge LB_3761
	JZ_SPC BYTE [r13+8+r14], LB_3759
LB_3761:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3763
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3763
	add r14,1
	jmp LB_3762
LB_3763:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3747
LB_3762:
	jmp LB_3765
LB_3764:
	add r14,1 
LB_3765:
	cmp r14,r9
	jge LB_3766
	JZ_SPC BYTE [r13+8+r14], LB_3764
LB_3766:
	call GRM_369
	cmp BYTE [r8+6],0
	jnz LB_3768
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
	jmp LB_3767
LB_3768:
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3747
LB_3767:
	jmp LB_3770
LB_3769:
	add r14,1 
LB_3770:
	cmp r14,r9
	jge LB_3771
	JZ_SPC BYTE [r13+8+r14], LB_3769
LB_3771:
	call GRM_372
	cmp BYTE [r8+6],0
	jnz LB_3773
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) ⊢ 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3772
LB_3773:
; .dlt.ptn { 9'(= {| l |} ) 10'(= a45◂ [ ] ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3056
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3747
LB_3772:
	jmp LB_3775
LB_3774:
; .dlt.ptn 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3057
	C_POP_REGS
; .dlt.ptn { 9'(= {| l |} ) 10'(= a45◂ [ ] ) }
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3056
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3747
LB_3775:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %3066~1'(= r ) %3065~0'(= r ) %3064~11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) %3063~{ 9'(= {| l |} ) 10'(= a45◂ [ ] ) } %3062~8'(= a47◂ [ *{ }] ) 
; #25 { { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=4 , %3067~0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3066~1'(= r ) %3065~0'(= r ) %3062~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) }
;; rsp=4 , %3068~0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a45◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a45◂ [ ]}] ) } %3066~1'(= r ) %3065~0'(= r ) %3062~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3776
LB_3776:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3747
LB_3748:
	mov r14,QWORD [rsp] 
	jmp LB_3780
LB_3779:
	jmp LB_3778
LB_3780:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3070~1'(= r ) %3069~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3071~1(<2)◂{ } %3070~1'(= r ) %3069~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3072~0(<2)◂1(<2)◂{ } %3070~1'(= r ) %3069~0'(= r ) 
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
	jmp LB_3781
LB_3781:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3747
LB_3778:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3747:
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
	jmp LB_3786
LB_3785:
	add r14,1 
LB_3786:
	cmp r14,r9
	jge LB_3787
	JZ_SPC BYTE [r13+8+r14], LB_3785
LB_3787:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3789
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3788
LB_3789:
	jmp LB_3784
LB_3788:
	jmp LB_3791
LB_3790:
	add r14,1 
LB_3791:
	cmp r14,r9
	jge LB_3792
	JZ_SPC BYTE [r13+8+r14], LB_3790
LB_3792:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3794
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3794
	cmp BYTE [rdi+1],136
	jnz LB_3794
	cmp BYTE [rdi+2],144
	jnz LB_3794
	add r14,3
	jmp LB_3793
LB_3794:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3784
LB_3793:
	jmp LB_3796
LB_3795:
	add r14,1 
LB_3796:
	cmp r14,r9
	jge LB_3797
	JZ_SPC BYTE [r13+8+r14], LB_3795
LB_3797:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3799
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3798
LB_3799:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3783
LB_3798:
	jmp LB_3801
LB_3800:
	add r14,1 
LB_3801:
	cmp r14,r9
	jge LB_3802
	JZ_SPC BYTE [r13+8+r14], LB_3800
LB_3802:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3804
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_3804
	add r14,1
	jmp LB_3803
LB_3804:
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3783
LB_3803:
	jmp LB_3806
LB_3805:
	add r14,1 
LB_3806:
	cmp r14,r9
	jge LB_3807
	JZ_SPC BYTE [r13+8+r14], LB_3805
LB_3807:
	call GRM_328
	cmp BYTE [r8+6],0
	jnz LB_3809
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 10'(= a34◂ [ ] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3808
LB_3809:
; .dlt.ptn { }
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3783
LB_3808:
	jmp LB_3811
LB_3810:
	add r14,1 
LB_3811:
	cmp r14,r9
	jge LB_3812
	JZ_SPC BYTE [r13+8+r14], LB_3810
LB_3812:
	call GRM_373
	cmp BYTE [r8+6],0
	jnz LB_3814
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3813
LB_3814:
; .dlt.ptn 10'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3783
LB_3813:
	jmp LB_3816
LB_3815:
; .dlt.ptn 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3067
	C_POP_REGS
; .dlt.ptn 10'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3783
LB_3816:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %3078~1'(= r ) %3077~0'(= r ) %3076~11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %3075~10'(= a34◂ [ ] ) %3074~9'(= {| l |} ) %3073~8'(= a47◂ [ *{ }] ) 
; #25 { { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=4 , %3079~0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %3078~1'(= r ) %3077~0'(= r ) %3073~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=4 , %3080~0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %3078~1'(= r ) %3077~0'(= r ) %3073~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3817
LB_3817:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3783
LB_3784:
	mov r14,QWORD [rsp] 
	jmp LB_3821
LB_3820:
	jmp LB_3819
LB_3821:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3082~1'(= r ) %3081~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3083~1(<2)◂{ } %3082~1'(= r ) %3081~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3084~0(<2)◂1(<2)◂{ } %3082~1'(= r ) %3081~0'(= r ) 
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
	jmp LB_3822
LB_3822:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3783
LB_3819:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3783:
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
	jmp LB_3827
LB_3826:
	add r14,1 
LB_3827:
	cmp r14,r9
	jge LB_3828
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3826
LB_3828:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3830
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3829
LB_3830:
	jmp LB_3825
LB_3829:
	jmp LB_3832
LB_3831:
	add r14,1 
LB_3832:
	cmp r14,r9
	jge LB_3833
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3831
LB_3833:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3835
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_3835
	add r14,1
	jmp LB_3834
LB_3835:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3825
LB_3834:
	jmp LB_3837
LB_3836:
	add r14,1 
LB_3837:
	cmp r14,r9
	jge LB_3838
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3836
LB_3838:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3840
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3840
	add r14,1
	jmp LB_3839
LB_3840:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3824
LB_3839:
	jmp LB_3842
LB_3841:
	add r14,1 
LB_3842:
	cmp r14,r9
	jge LB_3843
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3841
LB_3843:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3845
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3844
LB_3845:
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3824
LB_3844:
	jmp LB_3847
LB_3846:
	add r14,1 
LB_3847:
	cmp r14,r9
	jge LB_3848
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3846
LB_3848:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_3850
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 10'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3849
LB_3850:
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3824
LB_3849:
	jmp LB_3852
LB_3851:
	add r14,1 
LB_3852:
	cmp r14,r9
	jge LB_3853
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3851
LB_3853:
	call GRM_376
	cmp BYTE [r8+6],0
	jnz LB_3855
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a34◂ [ ]] ) ⊢ 11'(= a3◂ [ a34◂ [ ]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3854
LB_3855:
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3824
LB_3854:
	jmp LB_3857
LB_3856:
	add r14,1 
LB_3857:
	cmp r14,r9
	jge LB_3858
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3856
LB_3858:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3860
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3860
	add r14,1
	jmp LB_3859
LB_3860:
; .dlt.ptn 11'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1139
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3824
LB_3859:
	jmp LB_3862
LB_3861:
	add r14,1 
LB_3862:
	cmp r14,r9
	jge LB_3863
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3861
LB_3863:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_3865
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3864
LB_3865:
; .dlt.ptn { }
; .dlt.ptn 11'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1139
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3824
LB_3864:
	jmp LB_3867
LB_3866:
	add r14,1 
LB_3867:
	cmp r14,r9
	jge LB_3868
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3866
LB_3868:
	call GRM_375
	cmp BYTE [r8+6],0
	jnz LB_3870
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3869
LB_3870:
; .dlt.ptn 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 11'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1139
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 5
	add rsp,40
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3824
LB_3869:
	jmp LB_3872
LB_3871:
; .dlt.ptn 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3873
	C_POP_REGS
; .dlt.ptn 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 11'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1139
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*6]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 6
	add rsp,48
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3824
LB_3872:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*6]
;; rsp=6 , %3092~1'(= r ) %3091~0'(= r ) %3090~13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) %3089~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3088~11'(= a3◂ [ a34◂ [ ]] ) %3087~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3086~9'(= {| l |} ) %3085~8'(= a47◂ [ *{ }] ) 
; #311 { 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ { 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) }
; {| 11000000111111110.. |}
	mov r14,QWORD [rsp-8+8*4]
	mov r13,QWORD [rsp-8+8*3]
; mov_ptn2.
	call LB_3880
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=4 , %3093~2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) %3092~1'(= r ) %3091~0'(= r ) %3088~11'(= a3◂ [ a34◂ [ ]] ) %3087~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3086~9'(= {| l |} ) %3085~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_3891
	jmp LB_3892
LB_3891:
	jmp LB_3890
LB_3892:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=4 , %3096~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %3095~3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3092~1'(= r ) %3091~0'(= r ) %3088~11'(= a3◂ [ a34◂ [ ]] ) %3087~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3086~9'(= {| l |} ) %3085~8'(= a47◂ [ *{ }] ) 
; #25 { { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3097~0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3092~1'(= r ) %3091~0'(= r ) %3085~8'(= a47◂ [ *{ }] ) 
; #264 0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3098~3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3092~1'(= r ) %3091~0'(= r ) %3085~8'(= a47◂ [ *{ }] ) 
; #309 3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3099~0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3092~1'(= r ) %3091~0'(= r ) %3085~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3100~0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3092~1'(= r ) %3091~0'(= r ) %3085~8'(= a47◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
; .dlt.ptn 1'(= r )
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
	call LB_1306
	C_POP_REGS
; .mov_ptn2 0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a47◂ [ a42◂ [ ]]] )
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
; .add_rsp 4
	add rsp,32
	jmp LB_3878
LB_3890:
;; ?. 2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %3094~3'(= a2◂ [ *{ rr{| l |}}] ) %3092~1'(= r ) %3091~0'(= r ) %3088~11'(= a3◂ [ a34◂ [ ]] ) %3087~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3086~9'(= {| l |} ) %3085~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %3101~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3092~1'(= r ) %3091~0'(= r ) %3088~11'(= a3◂ [ a34◂ [ ]] ) %3087~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3086~9'(= {| l |} ) %3085~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %3102~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3092~1'(= r ) %3091~0'(= r ) %3088~11'(= a3◂ [ a34◂ [ ]] ) %3087~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3086~9'(= {| l |} ) %3085~8'(= a47◂ [ *{ }] ) 
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
	call LB_1139
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
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
	call LB_1306
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
; .add_rsp 4
	add rsp,32
	jmp LB_3878
LB_3878:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3824
LB_3825:
	mov r14,QWORD [rsp] 
	jmp LB_3895
LB_3894:
	add r14,1 
LB_3895:
	cmp r14,r9
	jge LB_3896
	JZ_SPC BYTE [r13+8+r14], LB_3894
LB_3896:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3898
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3897
LB_3898:
	jmp LB_3893
LB_3897:
	jmp LB_3900
LB_3899:
	add r14,1 
LB_3900:
	cmp r14,r9
	jge LB_3901
	JZ_SPC BYTE [r13+8+r14], LB_3899
LB_3901:
	call GRM_377
	cmp BYTE [r8+6],0
	jnz LB_3903
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a44◂ [ ]] ) ⊢ 9'(= a47◂ [ a44◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3902
LB_3903:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3893
LB_3902:
	jmp LB_3905
LB_3904:
; .dlt.ptn 9'(= a47◂ [ a44◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3906
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_3893
LB_3905:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3106~1'(= r ) %3105~0'(= r ) %3104~9'(= a47◂ [ a44◂ [ ]] ) %3103~8'(= {| l |} ) 
;; ? 9'(= a47◂ [ a44◂ [ ]] ) ⊢ 0(<2)◂2'(= a44◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3914
	jmp LB_3915
LB_3914:
	jmp LB_3913
LB_3915:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3108~2'(= a44◂ [ ] ) %3106~1'(= r ) %3105~0'(= r ) %3103~8'(= {| l |} ) 
; #265 { 8'(= {| l |} ) 2'(= a44◂ [ ] ) } ⊢ 2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) }
;; rsp=2 , %3109~2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } %3106~1'(= r ) %3105~0'(= r ) 
; #309 2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } ⊢ 0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) }
;; rsp=2 , %3110~0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } %3106~1'(= r ) %3105~0'(= r ) 
; #26 0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } ⊢ 0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) }
;; rsp=2 , %3111~0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a44◂ [ ] ) } %3106~1'(= r ) %3105~0'(= r ) 
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
	jmp LB_3911
LB_3913:
;; ?. 9'(= a47◂ [ a44◂ [ ]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3107~2'(= a2◂ [ *{ rr{| l |}}] ) %3106~1'(= r ) %3105~0'(= r ) %3103~8'(= {| l |} ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %3112~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3106~1'(= r ) %3105~0'(= r ) %3103~8'(= {| l |} ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %3113~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3106~1'(= r ) %3105~0'(= r ) %3103~8'(= {| l |} ) 
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
	jmp LB_3911
LB_3911:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3824
LB_3893:
	mov r14,QWORD [rsp]
	jmp LB_3918
LB_3917:
	jmp LB_3916
LB_3918:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3115~1'(= r ) %3114~0'(= r ) 
; $ %[ "lc_etr_body 0" ] ⊢ %[ "lc_etr_body 0" ]
;; rsp=0 , %3116~%[ "lc_etr_body 0" ] %3115~1'(= r ) %3114~0'(= r ) 
; #10 %[ "lc_etr_body 0" ] ⊢ %[ "lc_etr_body 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3921
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3922
LB_3922:
;; rsp=0 , %3117~%[ "lc_etr_body 0" ] %3115~1'(= r ) %3114~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3118~1(<2)◂{ } %3117~%[ "lc_etr_body 0" ] %3115~1'(= r ) %3114~0'(= r ) 
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
	jmp LB_3919
LB_3919:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3824
LB_3916:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3824:
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
	jmp LB_3926
LB_3925:
	add r14,1 
LB_3926:
	cmp r14,r9
	jge LB_3927
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3925
LB_3927:
	call GRM_335
	cmp BYTE [r8+6],0
	jnz LB_3929
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ *{ }] ) ⊢ 8'(= a47◂ [ *{ }] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3928
LB_3929:
	jmp LB_3924
LB_3928:
	jmp LB_3931
LB_3930:
	add r14,1 
LB_3931:
	cmp r14,r9
	jge LB_3932
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3930
LB_3932:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3934
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_3934
	add r14,1
	jmp LB_3933
LB_3934:
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_3924
LB_3933:
	jmp LB_3936
LB_3935:
	add r14,1 
LB_3936:
	cmp r14,r9
	jge LB_3937
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3935
LB_3937:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3939
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3939
	add r14,1
	jmp LB_3938
LB_3939:
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3923
LB_3938:
	jmp LB_3941
LB_3940:
	add r14,1 
LB_3941:
	cmp r14,r9
	jge LB_3942
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3940
LB_3942:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_3944
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3943
LB_3944:
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3923
LB_3943:
	jmp LB_3946
LB_3945:
	add r14,1 
LB_3946:
	cmp r14,r9
	jge LB_3947
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3945
LB_3947:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_3949
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 10'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3948
LB_3949:
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3923
LB_3948:
	jmp LB_3951
LB_3950:
	add r14,1 
LB_3951:
	cmp r14,r9
	jge LB_3952
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3950
LB_3952:
	call GRM_376
	cmp BYTE [r8+6],0
	jnz LB_3954
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a34◂ [ ]] ) ⊢ 11'(= a3◂ [ a34◂ [ ]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3953
LB_3954:
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3923
LB_3953:
	jmp LB_3956
LB_3955:
	add r14,1 
LB_3956:
	cmp r14,r9
	jge LB_3957
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3955
LB_3957:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3959
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3959
	add r14,1
	jmp LB_3958
LB_3959:
; .dlt.ptn 11'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1139
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3923
LB_3958:
	jmp LB_3961
LB_3960:
	add r14,1 
LB_3961:
	cmp r14,r9
	jge LB_3962
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3960
LB_3962:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_3964
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3963
LB_3964:
; .dlt.ptn { }
; .dlt.ptn 11'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1139
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3923
LB_3963:
	jmp LB_3966
LB_3965:
	add r14,1 
LB_3966:
	cmp r14,r9
	jge LB_3967
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3965
LB_3967:
	call GRM_375
	cmp BYTE [r8+6],0
	jnz LB_3969
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) ⊢ 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] )
; {| 111100001111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3968
LB_3969:
; .dlt.ptn 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 11'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1139
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 5
	add rsp,40
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3923
LB_3968:
	jmp LB_3971
LB_3970:
; .dlt.ptn 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3873
	C_POP_REGS
; .dlt.ptn 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 11'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1139
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn 9'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .dlt.ptn 8'(= a47◂ [ *{ }] )
	mov rdi,QWORD [rsp-8+8*6]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1306
	C_POP_REGS
; .add_rsp 6
	add rsp,48
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3923
LB_3971:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*6]
;; rsp=6 , %3126~1'(= r ) %3125~0'(= r ) %3124~13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) %3123~12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3122~11'(= a3◂ [ a34◂ [ ]] ) %3121~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3120~9'(= {| l |} ) %3119~8'(= a47◂ [ *{ }] ) 
; #311 { 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { 13'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 12'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) } ⊢ { 0'(= a47◂ [ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]] ) 1'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) }
; {| 11000000111111110.. |}
	mov r14,QWORD [rsp-8+8*4]
	mov r13,QWORD [rsp-8+8*3]
; mov_ptn2.
	call LB_3880
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 4
	add rsp,32
;; rsp=4 , %3127~2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) %3126~1'(= r ) %3125~0'(= r ) %3122~11'(= a3◂ [ a34◂ [ ]] ) %3121~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3120~9'(= {| l |} ) %3119~8'(= a47◂ [ *{ }] ) 
;; ? 2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_3975
	jmp LB_3976
LB_3975:
	jmp LB_3974
LB_3976:
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov QWORD [GBG_VCT+8*0],r8
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_RCD 2,rdi
;; rsp=4 , %3130~4'(= a28◂ [ a18◂ [ ]{| l |}] ) %3129~3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) %3126~1'(= r ) %3125~0'(= r ) %3122~11'(= a3◂ [ a34◂ [ ]] ) %3121~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3120~9'(= {| l |} ) %3119~8'(= a47◂ [ *{ }] ) 
; #25 { { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3131~0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3126~1'(= r ) %3125~0'(= r ) %3119~8'(= a47◂ [ *{ }] ) 
; #309 0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3132~0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3126~1'(= r ) %3125~0'(= r ) %3119~8'(= a47◂ [ *{ }] ) 
; #26 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=4 , %3133~0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a3◂ [ a34◂ [ ]] ) 4'(= a28◂ [ a18◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}] ) } %3126~1'(= r ) %3125~0'(= r ) %3119~8'(= a47◂ [ *{ }] ) 
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
	call LB_1306
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
	jmp LB_3972
LB_3974:
;; ?. 2'(= a47◂ [ *{ a2◂ [ *{ {| l |}a17◂ [ a25◂ [ {| l |}]]a3◂ [ a34◂ [ ]]a28◂ [ a18◂ [ ]{| l |}]}]a28◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r9,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %3128~3'(= a2◂ [ *{ rr{| l |}}] ) %3126~1'(= r ) %3125~0'(= r ) %3122~11'(= a3◂ [ a34◂ [ ]] ) %3121~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3120~9'(= {| l |} ) %3119~8'(= a47◂ [ *{ }] ) 
; #308 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %3134~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3126~1'(= r ) %3125~0'(= r ) %3122~11'(= a3◂ [ a34◂ [ ]] ) %3121~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3120~9'(= {| l |} ) %3119~8'(= a47◂ [ *{ }] ) 
; #26 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %3135~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %3126~1'(= r ) %3125~0'(= r ) %3122~11'(= a3◂ [ a34◂ [ ]] ) %3121~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3120~9'(= {| l |} ) %3119~8'(= a47◂ [ *{ }] ) 
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
	call LB_1139
	C_POP_REGS
; .dlt.ptn 10'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
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
	call LB_1306
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
	jmp LB_3972
LB_3972:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3923
LB_3924:
	mov r14,QWORD [rsp] 
	jmp LB_3979
LB_3978:
	jmp LB_3977
LB_3979:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3137~1'(= r ) %3136~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3138~1(<2)◂{ } %3137~1'(= r ) %3136~0'(= r ) 
; #309 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3139~0(<2)◂1(<2)◂{ } %3137~1'(= r ) %3136~0'(= r ) 
; #26 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %3140~0(<2)◂0(<2)◂1(<2)◂{ } %3137~1'(= r ) %3136~0'(= r ) 
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
	jmp LB_3980
LB_3980:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3923
LB_3977:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3923:
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
	jmp LB_3985
LB_3984:
	add r14,1 
LB_3985:
	cmp r14,r9
	jge LB_3986
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3984
LB_3986:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3988
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_3988
	add r14,1
	jmp LB_3987
LB_3988:
	jmp LB_3983
LB_3987:
	jmp LB_3990
LB_3989:
	add r14,1 
LB_3990:
	cmp r14,r9
	jge LB_3991
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3989
LB_3991:
	call GRM_328
	cmp BYTE [r8+6],0
	jnz LB_3993
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a34◂ [ ] ) ⊢ 8'(= a34◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_3992
LB_3993:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3982
LB_3992:
	jmp LB_3995
LB_3994:
; .dlt.ptn 8'(= a34◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1119
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_3982
LB_3995:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3143~1'(= r ) %3142~0'(= r ) %3141~8'(= a34◂ [ ] ) 
; #26 8'(= a34◂ [ ] ) ⊢ 0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %3144~0(<2)◂8'(= a34◂ [ ] ) %3143~1'(= r ) %3142~0'(= r ) 
; #26 0(<2)◂8'(= a34◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a34◂ [ ] )
;; rsp=1 , %3145~0(<2)◂0(<2)◂8'(= a34◂ [ ] ) %3143~1'(= r ) %3142~0'(= r ) 
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
	jmp LB_3996
LB_3996:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3982
LB_3983:
	mov r14,QWORD [rsp] 
	jmp LB_4000
LB_3999:
	jmp LB_3998
LB_4000:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3147~1'(= r ) %3146~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3148~1(<2)◂{ } %3147~1'(= r ) %3146~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3149~0(<2)◂1(<2)◂{ } %3147~1'(= r ) %3146~0'(= r ) 
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
	jmp LB_4001
LB_4001:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_3982
LB_3998:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_3982:
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
	jmp LB_4006
LB_4005:
	add r14,1 
LB_4006:
	cmp r14,r9
	jge LB_4007
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4005
LB_4007:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4009
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_4009
	add r14,1
	jmp LB_4008
LB_4009:
	jmp LB_4004
LB_4008:
	jmp LB_4011
LB_4010:
	add r14,1 
LB_4011:
	cmp r14,r9
	jge LB_4012
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4010
LB_4012:
	call GRM_305
	cmp BYTE [r8+6],0
	jnz LB_4014
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a27◂ [ a18◂ [ ]] ) ⊢ 8'(= a27◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4013
LB_4014:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4003
LB_4013:
	jmp LB_4016
LB_4015:
	add r14,1 
LB_4016:
	cmp r14,r9
	jge LB_4017
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4015
LB_4017:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4019
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4019
	add r14,1
	jmp LB_4018
LB_4019:
; .dlt.ptn 8'(= a27◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_478
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4003
LB_4018:
	jmp LB_4021
LB_4020:
; .dlt.ptn { }
; .dlt.ptn 8'(= a27◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_478
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4003
LB_4021:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3152~1'(= r ) %3151~0'(= r ) %3150~8'(= a27◂ [ a18◂ [ ]] ) 
; #258 8'(= a27◂ [ a18◂ [ ]] ) ⊢ 1(<3)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %3153~1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) %3152~1'(= r ) %3151~0'(= r ) 
; #309 1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %3154~0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) %3152~1'(= r ) %3151~0'(= r ) 
; #26 0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] )
;; rsp=1 , %3155~0(<2)◂0(<2)◂1(<3)◂8'(= a27◂ [ a18◂ [ ]] ) %3152~1'(= r ) %3151~0'(= r ) 
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
	jmp LB_4022
LB_4022:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4003
LB_4004:
	mov r14,QWORD [rsp] 
	jmp LB_4026
LB_4025:
	add r14,1 
LB_4026:
	cmp r14,r9
	jge LB_4027
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4025
LB_4027:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_4029
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_4029
	cmp BYTE [rdi+1],171
	jnz LB_4029
	add r14,2
	jmp LB_4028
LB_4029:
	jmp LB_4024
LB_4028:
	jmp LB_4031
LB_4030:
	add r14,1 
LB_4031:
	cmp r14,r9
	jge LB_4032
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4030
LB_4032:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4034
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4034
	add r14,1
	jmp LB_4033
LB_4034:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4003
LB_4033:
	jmp LB_4036
LB_4035:
	add r14,1 
LB_4036:
	cmp r14,r9
	jge LB_4037
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4035
LB_4037:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_4039
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4038
LB_4039:
; .dlt.ptn { }
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4003
LB_4038:
	jmp LB_4041
LB_4040:
; .dlt.ptn 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4003
LB_4041:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3158~1'(= r ) %3157~0'(= r ) %3156~8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) 
;; ? 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4045
	jmp LB_4046
LB_4045:
	jmp LB_4044
LB_4046:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %3160~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3158~1'(= r ) %3157~0'(= r ) 
; #257 2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3161~2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3158~1'(= r ) %3157~0'(= r ) 
; #309 2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3162~0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3158~1'(= r ) %3157~0'(= r ) 
; #26 0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3163~0(<2)◂0(<2)◂2(<3)◂2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3158~1'(= r ) %3157~0'(= r ) 
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
	jmp LB_4042
LB_4044:
;; ?. 8'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=1 , %3159~2'(= a2◂ [ *{ rr{| l |}}] ) %3158~1'(= r ) %3157~0'(= r ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %3164~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3158~1'(= r ) %3157~0'(= r ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %3165~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3158~1'(= r ) %3157~0'(= r ) 
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
	jmp LB_4042
LB_4042:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4003
LB_4024:
	mov r14,QWORD [rsp] 
	jmp LB_4049
LB_4048:
	add r14,1 
LB_4049:
	cmp r14,r9
	jge LB_4050
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4048
LB_4050:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_4052
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4051
LB_4052:
	jmp LB_4047
LB_4051:
	jmp LB_4054
LB_4053:
	add r14,1 
LB_4054:
	cmp r14,r9
	jge LB_4055
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4053
LB_4055:
	call GRM_376
	cmp BYTE [r8+6],0
	jnz LB_4057
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a34◂ [ ]] ) ⊢ 9'(= a3◂ [ a34◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4056
LB_4057:
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_4047
LB_4056:
	jmp LB_4059
LB_4058:
	add r14,1 
LB_4059:
	cmp r14,r9
	jge LB_4060
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4058
LB_4060:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4062
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4062
	add r14,1
	jmp LB_4061
LB_4062:
; .dlt.ptn 9'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1139
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_4047
LB_4061:
	jmp LB_4064
LB_4063:
	add r14,1 
LB_4064:
	cmp r14,r9
	jge LB_4065
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4063
LB_4065:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_4067
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4066
LB_4067:
; .dlt.ptn { }
; .dlt.ptn 9'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1139
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_4047
LB_4066:
	jmp LB_4069
LB_4068:
; .dlt.ptn 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 9'(= a3◂ [ a34◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_1139
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_4047
LB_4069:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %3170~1'(= r ) %3169~0'(= r ) %3168~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3167~9'(= a3◂ [ a34◂ [ ]] ) %3166~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4073
	jmp LB_4074
LB_4073:
	jmp LB_4072
LB_4074:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %3172~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3170~1'(= r ) %3169~0'(= r ) %3167~9'(= a3◂ [ a34◂ [ ]] ) %3166~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #259 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %3173~0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %3170~1'(= r ) %3169~0'(= r ) 
; #309 0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %3174~0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %3170~1'(= r ) %3169~0'(= r ) 
; #26 0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=3 , %3175~0(<2)◂0(<2)◂0(<3)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 9'(= a3◂ [ a34◂ [ ]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) } %3170~1'(= r ) %3169~0'(= r ) 
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
	jmp LB_4070
LB_4072:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=3 , %3171~2'(= a2◂ [ *{ rr{| l |}}] ) %3170~1'(= r ) %3169~0'(= r ) %3167~9'(= a3◂ [ a34◂ [ ]] ) %3166~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #308 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %3176~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3170~1'(= r ) %3169~0'(= r ) %3167~9'(= a3◂ [ a34◂ [ ]] ) %3166~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %3177~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %3170~1'(= r ) %3169~0'(= r ) %3167~9'(= a3◂ [ a34◂ [ ]] ) %3166~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	call LB_1139
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
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
	jmp LB_4070
LB_4070:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4003
LB_4047:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4003:
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
	jmp LB_4078
LB_4077:
	add r14,1 
LB_4078:
	cmp r14,r9
	jge LB_4079
	JZ_SPC BYTE [r13+8+r14], LB_4077
LB_4079:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4081
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_4081
	add r14,1
	jmp LB_4080
LB_4081:
	jmp LB_4076
LB_4080:
	jmp LB_4083
LB_4082:
	add r14,1 
LB_4083:
	cmp r14,r9
	jge LB_4084
	JZ_SPC BYTE [r13+8+r14], LB_4082
LB_4084:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4086
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_4086
	add r14,1
	jmp LB_4085
LB_4086:
; .dlt.ptn { }
	jmp LB_4076
LB_4085:
	jmp LB_4088
LB_4087:
	add r14,1 
LB_4088:
	cmp r14,r9
	jge LB_4089
	JZ_SPC BYTE [r13+8+r14], LB_4087
LB_4089:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_4091
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4090
LB_4091:
; .dlt.ptn { }
; .dlt.ptn { }
	jmp LB_4076
LB_4090:
	jmp LB_4093
LB_4092:
	add r14,1 
LB_4093:
	cmp r14,r9
	jge LB_4094
	JZ_SPC BYTE [r13+8+r14], LB_4092
LB_4094:
	call GRM_380
	cmp BYTE [r8+6],0
	jnz LB_4096
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a35◂ [ a18◂ [ ]{| l |}] ) ⊢ 9'(= a35◂ [ a18◂ [ ]{| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4095
LB_4096:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_4076
LB_4095:
	jmp LB_4098
LB_4097:
; .dlt.ptn 9'(= a35◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3089
	C_POP_REGS
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	jmp LB_4076
LB_4098:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3181~1'(= r ) %3180~0'(= r ) %3179~9'(= a35◂ [ a18◂ [ ]{| l |}] ) %3178~8'(= {| l |} ) 
; #26 { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=2 , %3182~0(<2)◂{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } %3181~1'(= r ) %3180~0'(= r ) 
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
	jmp LB_4099
LB_4099:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4075
LB_4076:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4075:
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
	call GRM_378
	cmp BYTE [r8+6],0
	jnz LB_4104
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
	jmp LB_4103
LB_4104:
	jmp LB_4102
LB_4103:
	call GRM_379
	cmp BYTE [r8+6],0
	jnz LB_4106
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4105
LB_4106:
; .dlt.ptn { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3089
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_4102
LB_4105:
	jmp LB_4108
LB_4107:
; .dlt.ptn 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3053
	C_POP_REGS
; .dlt.ptn { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) }
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3089
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_4102
LB_4108:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*3]
;; rsp=3 , %3186~1'(= r ) %3185~0'(= r ) %3184~10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) %3183~{ 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 
; #25 { { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %3187~0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %3186~1'(= r ) %3185~0'(= r ) 
; #26 0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=3 , %3188~0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a35◂ [ a18◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a35◂ [ a18◂ [ ]{| l |}]}] ) } %3186~1'(= r ) %3185~0'(= r ) 
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
	jmp LB_4109
LB_4109:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4101
LB_4102:
	mov r14,QWORD [rsp]
	jmp LB_4113
LB_4112:
	jmp LB_4111
LB_4113:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3190~1'(= r ) %3189~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3191~1(<2)◂{ } %3190~1'(= r ) %3189~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3192~0(<2)◂1(<2)◂{ } %3190~1'(= r ) %3189~0'(= r ) 
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
	jmp LB_4114
LB_4114:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4101
LB_4111:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4101:
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
	jmp LB_4119
LB_4118:
	add r14,1 
LB_4119:
	cmp r14,r9
	jge LB_4120
	JZ_SPC BYTE [r13+8+r14], LB_4118
LB_4120:
	call GRM_381
	cmp BYTE [r8+6],0
	jnz LB_4122
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a37◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4121
LB_4122:
	jmp LB_4117
LB_4121:
	jmp LB_4124
LB_4123:
; .dlt.ptn 8'(= a37◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3095
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_4117
LB_4124:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3195~1'(= r ) %3194~0'(= r ) %3193~8'(= a37◂ [ a18◂ [ ]{| l |}] ) 
; #244 8'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3196~1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] ) %3195~1'(= r ) %3194~0'(= r ) 
; #26 1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3197~0(<2)◂1(<2)◂8'(= a37◂ [ a18◂ [ ]{| l |}] ) %3195~1'(= r ) %3194~0'(= r ) 
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
	jmp LB_4125
LB_4125:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4116
LB_4117:
	mov r14,QWORD [rsp]
	jmp LB_4129
LB_4128:
	add r14,1 
LB_4129:
	cmp r14,r9
	jge LB_4130
	JZ_SPC BYTE [r13+8+r14], LB_4128
LB_4130:
	call GRM_389
	cmp BYTE [r8+6],0
	jnz LB_4132
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a36◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4131
LB_4132:
	jmp LB_4127
LB_4131:
	jmp LB_4134
LB_4133:
; .dlt.ptn 8'(= a36◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3094
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_4127
LB_4134:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3200~1'(= r ) %3199~0'(= r ) %3198~8'(= a36◂ [ a18◂ [ ]{| l |}] ) 
; #245 8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3201~0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) %3200~1'(= r ) %3199~0'(= r ) 
; #26 0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3202~0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) %3200~1'(= r ) %3199~0'(= r ) 
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
	jmp LB_4135
LB_4135:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4116
LB_4127:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4116:
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
	jmp LB_4140
LB_4139:
	add r14,1 
LB_4140:
	cmp r14,r9
	jge LB_4141
	JZ_SPC BYTE [r13+8+r14], LB_4139
LB_4141:
	call GRM_388
	cmp BYTE [r8+6],0
	jnz LB_4143
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a38◂ [ ] ) ⊢ 8'(= a38◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4142
LB_4143:
	jmp LB_4138
LB_4142:
	jmp LB_4145
LB_4144:
	add r14,1 
LB_4145:
	cmp r14,r9
	jge LB_4146
	JZ_SPC BYTE [r13+8+r14], LB_4144
LB_4146:
	call GRM_383
	cmp BYTE [r8+6],0
	jnz LB_4148
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 9'(= a39◂ [ a18◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4147
LB_4148:
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4137
LB_4147:
	jmp LB_4150
LB_4149:
	add r14,1 
LB_4150:
	cmp r14,r9
	jge LB_4151
	JZ_SPC BYTE [r13+8+r14], LB_4149
LB_4151:
	call GRM_382
	cmp BYTE [r8+6],0
	jnz LB_4153
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
	jmp LB_4152
LB_4153:
; .dlt.ptn 9'(= a39◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3101
	C_POP_REGS
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4137
LB_4152:
	jmp LB_4155
LB_4154:
; .dlt.ptn { 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) }
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2060
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3102
	C_POP_REGS
; .dlt.ptn 9'(= a39◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3101
	C_POP_REGS
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 5
	add rsp,40
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4137
LB_4155:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*5]
;; rsp=5 , %3209~1'(= r ) %3208~0'(= r ) %3207~12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) %3206~11'(= a28◂ [ a18◂ [ ]{| l |}] ) %3205~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3204~9'(= a39◂ [ a18◂ [ ]] ) %3203~8'(= a38◂ [ ] ) 
; #254 { } ⊢ 2'(= a2◂ [ a25◂ [ {| l |}]] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { } ⊢ { }
; {| 0000000011111110.. |}
; mov_ptn2.
	call LB_4158
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=5 , %3210~2'(= a2◂ [ a25◂ [ {| l |}]] ) %3209~1'(= r ) %3208~0'(= r ) %3207~12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) %3206~11'(= a28◂ [ a18◂ [ ]{| l |}] ) %3205~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3204~9'(= a39◂ [ a18◂ [ ]] ) %3203~8'(= a38◂ [ ] ) 
; #240 { 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=5 , %3211~1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } %3209~1'(= r ) %3208~0'(= r ) 
; #26 1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) }
;; rsp=5 , %3212~0(<2)◂1(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) } %3209~1'(= r ) %3208~0'(= r ) 
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
	jmp LB_4156
LB_4156:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4137
LB_4138:
	mov r14,QWORD [rsp] 
	jmp LB_4161
LB_4160:
	add r14,1 
LB_4161:
	cmp r14,r9
	jge LB_4162
	JZ_SPC BYTE [r13+8+r14], LB_4160
LB_4162:
	call GRM_387
	cmp BYTE [r8+6],0
	jnz LB_4164
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a38◂ [ ] ) ⊢ 8'(= a38◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4163
LB_4164:
	jmp LB_4159
LB_4163:
	jmp LB_4166
LB_4165:
	add r14,1 
LB_4166:
	cmp r14,r9
	jge LB_4167
	JZ_SPC BYTE [r13+8+r14], LB_4165
LB_4167:
	call GRM_383
	cmp BYTE [r8+6],0
	jnz LB_4169
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 9'(= a39◂ [ a18◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4168
LB_4169:
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_4159
LB_4168:
	jmp LB_4171
LB_4170:
	add r14,1 
LB_4171:
	cmp r14,r9
	jge LB_4172
	JZ_SPC BYTE [r13+8+r14], LB_4170
LB_4172:
	call GRM_382
	cmp BYTE [r8+6],0
	jnz LB_4174
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
	jmp LB_4173
LB_4174:
; .dlt.ptn 9'(= a39◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3101
	C_POP_REGS
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_4159
LB_4173:
	jmp LB_4176
LB_4175:
	add r14,1 
LB_4176:
	cmp r14,r9
	jge LB_4177
	JZ_SPC BYTE [r13+8+r14], LB_4175
LB_4177:
	call GRM_381
	cmp BYTE [r8+6],0
	jnz LB_4179
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 13'(= a37◂ [ a18◂ [ ]{| l |}] )
; {| 111100001111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4178
LB_4179:
; .dlt.ptn { 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) }
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2060
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3102
	C_POP_REGS
; .dlt.ptn 9'(= a39◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3101
	C_POP_REGS
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 5
	add rsp,40
	jmp LB_4159
LB_4178:
	jmp LB_4181
LB_4180:
; .dlt.ptn 13'(= a37◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3095
	C_POP_REGS
; .dlt.ptn { 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) }
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2060
	C_POP_REGS
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3102
	C_POP_REGS
; .dlt.ptn 9'(= a39◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3101
	C_POP_REGS
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*6]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 6
	add rsp,48
	jmp LB_4159
LB_4181:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*6]
;; rsp=6 , %3220~1'(= r ) %3219~0'(= r ) %3218~13'(= a37◂ [ a18◂ [ ]{| l |}] ) %3217~12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) %3216~11'(= a28◂ [ a18◂ [ ]{| l |}] ) %3215~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3214~9'(= a39◂ [ a18◂ [ ]] ) %3213~8'(= a38◂ [ ] ) 
; #254 { } ⊢ 2'(= a2◂ [ a25◂ [ {| l |}]] )
	sub rsp,16
	mov QWORD [rsp+0],r13
	mov QWORD [rsp+8],r14
; .mov_ptn2 { } ⊢ { }
; {| 00000000111111110.. |}
; mov_ptn2.
	call LB_4158
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
;; rsp=6 , %3221~2'(= a2◂ [ a25◂ [ {| l |}]] ) %3220~1'(= r ) %3219~0'(= r ) %3218~13'(= a37◂ [ a18◂ [ ]{| l |}] ) %3217~12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) %3216~11'(= a28◂ [ a18◂ [ ]{| l |}] ) %3215~10'(= a17◂ [ a25◂ [ {| l |}]] ) %3214~9'(= a39◂ [ a18◂ [ ]] ) %3213~8'(= a38◂ [ ] ) 
; #241 { 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=6 , %3222~0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } %3220~1'(= r ) %3219~0'(= r ) 
; #26 0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=6 , %3223~0(<2)◂0(<2)◂{ 2'(= a2◂ [ a25◂ [ {| l |}]] ) 10'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a28◂ [ a18◂ [ ]{| l |}] ) 8'(= a38◂ [ ] ) 9'(= a39◂ [ a18◂ [ ]] ) 12'(= a3◂ [ *{ a17◂ [ a25◂ [ {| l |}]]a37◂ [ a18◂ [ ]{| l |}]}] ) 13'(= a37◂ [ a18◂ [ ]{| l |}] ) } %3220~1'(= r ) %3219~0'(= r ) 
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
	jmp LB_4182
LB_4182:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4137
LB_4159:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4137:
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
	jmp LB_4187
LB_4186:
	add r14,1 
LB_4187:
	cmp r14,r9
	jge LB_4188
	JZ_SPC BYTE [r13+8+r14], LB_4186
LB_4188:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4190
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_4190
	add r14,1
	jmp LB_4189
LB_4190:
	jmp LB_4185
LB_4189:
	jmp LB_4192
LB_4191:
	add r14,1 
LB_4192:
	cmp r14,r9
	jge LB_4193
	JZ_SPC BYTE [r13+8+r14], LB_4191
LB_4193:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4195
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4195
	cmp BYTE [rdi+1],138
	jnz LB_4195
	cmp BYTE [rdi+2],162
	jnz LB_4195
	add r14,3
	jmp LB_4194
LB_4195:
; .dlt.ptn { }
	jmp LB_4185
LB_4194:
	jmp LB_4197
LB_4196:
	add r14,1 
LB_4197:
	cmp r14,r9
	jge LB_4198
	JZ_SPC BYTE [r13+8+r14], LB_4196
LB_4198:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_4200
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4199
LB_4200:
; .dlt.ptn { }
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4184
LB_4199:
	jmp LB_4202
LB_4201:
	add r14,1 
LB_4202:
	cmp r14,r9
	jge LB_4203
	JZ_SPC BYTE [r13+8+r14], LB_4201
LB_4203:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4205
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_4205
	add r14,1
	jmp LB_4204
LB_4205:
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4184
LB_4204:
	jmp LB_4207
LB_4206:
	add r14,1 
LB_4207:
	cmp r14,r9
	jge LB_4208
	JZ_SPC BYTE [r13+8+r14], LB_4206
LB_4208:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_4210
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 9'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4209
LB_4210:
; .dlt.ptn { }
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4184
LB_4209:
	jmp LB_4212
LB_4211:
	add r14,1 
LB_4212:
	cmp r14,r9
	jge LB_4213
	JZ_SPC BYTE [r13+8+r14], LB_4211
LB_4213:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_4215
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4214
LB_4215:
; .dlt.ptn 9'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4184
LB_4214:
	jmp LB_4217
LB_4216:
	add r14,1 
LB_4217:
	cmp r14,r9
	jge LB_4218
	JZ_SPC BYTE [r13+8+r14], LB_4216
LB_4218:
	call GRM_381
	cmp BYTE [r8+6],0
	jnz LB_4220
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a37◂ [ a18◂ [ ]{| l |}] ) ⊢ 11'(= a37◂ [ a18◂ [ ]{| l |}] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4219
LB_4220:
; .dlt.ptn 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 9'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4184
LB_4219:
	jmp LB_4222
LB_4221:
; .dlt.ptn 11'(= a37◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3095
	C_POP_REGS
; .dlt.ptn 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 9'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .dlt.ptn { }
; .add_rsp 4
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4184
LB_4222:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %3229~1'(= r ) %3228~0'(= r ) %3227~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3226~10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3225~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3224~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_4226
	jmp LB_4227
LB_4226:
	jmp LB_4225
LB_4227:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %3231~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3229~1'(= r ) %3228~0'(= r ) %3227~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3225~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3224~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=4 , %3232~0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } %3231~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3229~1'(= r ) %3228~0'(= r ) %3224~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } }
;; rsp=4 , %3233~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a17◂ [ a25◂ [ {| l |}]] ) 11'(= a37◂ [ a18◂ [ ]{| l |}] ) } } %3229~1'(= r ) %3228~0'(= r ) 
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
	jmp LB_4223
LB_4225:
;; ?. 10'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=4 , %3230~2'(= a2◂ [ *{ rr{| l |}}] ) %3229~1'(= r ) %3228~0'(= r ) %3227~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3225~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3224~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; $ %[ "grm_etr_act_act 0" ] ⊢ %[ "grm_etr_act_act 0" ]
;; rsp=4 , %3234~%[ "grm_etr_act_act 0" ] %3230~2'(= a2◂ [ *{ rr{| l |}}] ) %3229~1'(= r ) %3228~0'(= r ) %3227~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3225~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3224~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #10 %[ "grm_etr_act_act 0" ] ⊢ %[ "grm_etr_act_act 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_4228
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4229
LB_4229:
;; rsp=4 , %3235~%[ "grm_etr_act_act 0" ] %3230~2'(= a2◂ [ *{ rr{| l |}}] ) %3229~1'(= r ) %3228~0'(= r ) %3227~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3225~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3224~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	jmp LB_4230
LB_4230:
;; rsp=4 , %3236~{ 0'(= r ) 1'(= r ) } %3235~%[ "grm_etr_act_act 0" ] %3230~2'(= a2◂ [ *{ rr{| l |}}] ) %3227~11'(= a37◂ [ a18◂ [ ]{| l |}] ) %3225~9'(= a17◂ [ a25◂ [ {| l |}]] ) %3224~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
	mov rdi,LB_4231
	call emt_stg 
	jmp err
LB_4223:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4184
LB_4185:
	mov r14,QWORD [rsp] 
	jmp LB_4234
LB_4233:
	add r14,1 
LB_4234:
	cmp r14,r9
	jge LB_4235
	JZ_SPC BYTE [r13+8+r14], LB_4233
LB_4235:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4237
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4237
	cmp BYTE [rdi+1],138
	jnz LB_4237
	cmp BYTE [rdi+2],162
	jnz LB_4237
	add r14,3
	jmp LB_4236
LB_4237:
	jmp LB_4232
LB_4236:
	jmp LB_4239
LB_4238:
	add r14,1 
LB_4239:
	cmp r14,r9
	jge LB_4240
	JZ_SPC BYTE [r13+8+r14], LB_4238
LB_4240:
	call GRM_323
	cmp BYTE [r8+6],0
	jnz LB_4242
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a17◂ [ a25◂ [ {| l |}]] ) ⊢ 8'(= a17◂ [ a25◂ [ {| l |}]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4241
LB_4242:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4184
LB_4241:
	jmp LB_4244
LB_4243:
	add r14,1 
LB_4244:
	cmp r14,r9
	jge LB_4245
	JZ_SPC BYTE [r13+8+r14], LB_4243
LB_4245:
	call GRM_351
	cmp BYTE [r8+6],0
	jnz LB_4247
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4246
LB_4247:
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4184
LB_4246:
	jmp LB_4249
LB_4248:
; .dlt.ptn 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_2185
	C_POP_REGS
; .dlt.ptn 8'(= a17◂ [ a25◂ [ {| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_981
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4184
LB_4249:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3240~1'(= r ) %3239~0'(= r ) %3238~9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) %3237~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
;; ? 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a28◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4253
	jmp LB_4254
LB_4253:
	jmp LB_4252
LB_4254:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3242~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3240~1'(= r ) %3239~0'(= r ) %3237~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %3243~1(<2)◂{ } %3242~2'(= a28◂ [ a18◂ [ ]{| l |}] ) %3240~1'(= r ) %3239~0'(= r ) %3237~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #26 { 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 1(<2)◂{ } }
;; rsp=2 , %3244~0(<2)◂{ 8'(= a17◂ [ a25◂ [ {| l |}]] ) 2'(= a28◂ [ a18◂ [ ]{| l |}] ) 1(<2)◂{ } } %3240~1'(= r ) %3239~0'(= r ) 
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
	jmp LB_4250
LB_4252:
;; ?. 9'(= a47◂ [ a28◂ [ a18◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=2 , %3241~2'(= a2◂ [ *{ rr{| l |}}] ) %3240~1'(= r ) %3239~0'(= r ) %3237~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; $ %[ "grm_etr_act_act 1" ] ⊢ %[ "grm_etr_act_act 1" ]
;; rsp=2 , %3245~%[ "grm_etr_act_act 1" ] %3241~2'(= a2◂ [ *{ rr{| l |}}] ) %3240~1'(= r ) %3239~0'(= r ) %3237~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
; #10 %[ "grm_etr_act_act 1" ] ⊢ %[ "grm_etr_act_act 1" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_4255
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4256
LB_4256:
;; rsp=2 , %3246~%[ "grm_etr_act_act 1" ] %3241~2'(= a2◂ [ *{ rr{| l |}}] ) %3240~1'(= r ) %3239~0'(= r ) %3237~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
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
	jmp LB_4257
LB_4257:
;; rsp=2 , %3247~{ 0'(= r ) 1'(= r ) } %3246~%[ "grm_etr_act_act 1" ] %3241~2'(= a2◂ [ *{ rr{| l |}}] ) %3237~8'(= a17◂ [ a25◂ [ {| l |}]] ) 
	mov rdi,LB_4258
	call emt_stg 
	jmp err
LB_4250:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4184
LB_4232:
	mov r14,QWORD [rsp] 
	mov r8,unt_1
LB_4184:
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
	jmp LB_4262
LB_4261:
	add r14,1 
LB_4262:
	cmp r14,r9
	jge LB_4263
	JZ_SPC BYTE [r13+8+r14], LB_4261
LB_4263:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_4265
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],33
	jnz LB_4265
	cmp BYTE [rdi+1],124
	jnz LB_4265
	add r14,2
	jmp LB_4264
LB_4265:
	jmp LB_4260
LB_4264:
	jmp LB_4267
LB_4266:
	add r14,1 
LB_4267:
	cmp r14,r9
	jge LB_4268
	JZ_SPC BYTE [r13+8+r14], LB_4266
LB_4268:
	call GRM_384
	cmp BYTE [r8+6],0
	jnz LB_4270
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 8'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4269
LB_4270:
; .dlt.ptn { }
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4259
LB_4269:
	jmp LB_4272
LB_4271:
; .dlt.ptn 8'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3112
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4259
LB_4272:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3250~1'(= r ) %3249~0'(= r ) %3248~8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) 
; #236 8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
;; rsp=1 , %3251~0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) %3250~1'(= r ) %3249~0'(= r ) 
; #26 0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 0(<2)◂0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
;; rsp=1 , %3252~0(<2)◂0(<3)◂8'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) %3250~1'(= r ) %3249~0'(= r ) 
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
	jmp LB_4273
LB_4273:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4259
LB_4260:
	mov r14,QWORD [rsp] 
	jmp LB_4277
LB_4276:
	add r14,1 
LB_4277:
	cmp r14,r9
	jge LB_4278
	JZ_SPC BYTE [r13+8+r14], LB_4276
LB_4278:
	call GRM_385
	cmp BYTE [r8+6],0
	jnz LB_4280
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a40◂ [ a18◂ [ ]] ) ⊢ 8'(= a40◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4279
LB_4280:
	jmp LB_4275
LB_4279:
	jmp LB_4282
LB_4281:
	add r14,1 
LB_4282:
	cmp r14,r9
	jge LB_4283
	JZ_SPC BYTE [r13+8+r14], LB_4281
LB_4283:
	call GRM_383
	cmp BYTE [r8+6],0
	jnz LB_4285
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 9'(= a39◂ [ a18◂ [ ]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4284
LB_4285:
; .dlt.ptn 8'(= a40◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3113
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_4275
LB_4284:
	jmp LB_4287
LB_4286:
; .dlt.ptn 9'(= a39◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3101
	C_POP_REGS
; .dlt.ptn 8'(= a40◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3113
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_4275
LB_4287:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3256~1'(= r ) %3255~0'(= r ) %3254~9'(= a39◂ [ a18◂ [ ]] ) %3253~8'(= a40◂ [ a18◂ [ ]] ) 
; #235 { 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } ⊢ 1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) }
;; rsp=2 , %3257~1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } %3256~1'(= r ) %3255~0'(= r ) 
; #26 1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } ⊢ 0(<2)◂1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) }
;; rsp=2 , %3258~0(<2)◂1(<3)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a39◂ [ a18◂ [ ]] ) } %3256~1'(= r ) %3255~0'(= r ) 
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
	jmp LB_4288
LB_4288:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4259
LB_4275:
	mov r14,QWORD [rsp]
	jmp LB_4292
LB_4291:
	jmp LB_4290
LB_4292:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3260~1'(= r ) %3259~0'(= r ) 
; #234 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %3261~2(<3)◂{ } %3260~1'(= r ) %3259~0'(= r ) 
; #26 2(<3)◂{ } ⊢ 0(<2)◂2(<3)◂{ }
;; rsp=0 , %3262~0(<2)◂2(<3)◂{ } %3260~1'(= r ) %3259~0'(= r ) 
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
	jmp LB_4293
LB_4293:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4259
LB_4290:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4259:
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
	jmp LB_4298
LB_4297:
	add r14,1 
LB_4298:
	cmp r14,r9
	jge LB_4299
	JZ_SPC BYTE [r13+8+r14], LB_4297
LB_4299:
	call GRM_385
	cmp BYTE [r8+6],0
	jnz LB_4301
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a40◂ [ a18◂ [ ]] ) ⊢ 8'(= a40◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4300
LB_4301:
	jmp LB_4296
LB_4300:
	jmp LB_4303
LB_4302:
	add r14,1 
LB_4303:
	cmp r14,r9
	jge LB_4304
	JZ_SPC BYTE [r13+8+r14], LB_4302
LB_4304:
	call GRM_384
	cmp BYTE [r8+6],0
	jnz LB_4306
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) ⊢ 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4305
LB_4306:
; .dlt.ptn 8'(= a40◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3113
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_4296
LB_4305:
	jmp LB_4308
LB_4307:
; .dlt.ptn 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3112
	C_POP_REGS
; .dlt.ptn 8'(= a40◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3113
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_4296
LB_4308:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*2]
;; rsp=2 , %3266~1'(= r ) %3265~0'(= r ) %3264~9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) %3263~8'(= a40◂ [ a18◂ [ ]] ) 
; #25 { 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } ⊢ 0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) }
;; rsp=2 , %3267~0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } %3266~1'(= r ) %3265~0'(= r ) 
; #26 0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) }
;; rsp=2 , %3268~0(<2)◂0(<2)◂{ 8'(= a40◂ [ a18◂ [ ]] ) 9'(= a2◂ [ a40◂ [ a18◂ [ ]]] ) } %3266~1'(= r ) %3265~0'(= r ) 
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
	jmp LB_4309
LB_4309:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4295
LB_4296:
	mov r14,QWORD [rsp]
	jmp LB_4313
LB_4312:
	jmp LB_4311
LB_4313:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3270~1'(= r ) %3269~0'(= r ) 
; #24 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3271~1(<2)◂{ } %3270~1'(= r ) %3269~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3272~0(<2)◂1(<2)◂{ } %3270~1'(= r ) %3269~0'(= r ) 
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
	jmp LB_4314
LB_4314:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4295
LB_4311:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4295:
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
	jmp LB_4319
LB_4318:
	add r14,1 
LB_4319:
	cmp r14,r9
	jge LB_4320
	JZ_SPC BYTE [r13+8+r14], LB_4318
LB_4320:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4322
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4322
	cmp BYTE [rdi+1],159
	jnz LB_4322
	cmp BYTE [rdi+2],166
	jnz LB_4322
	add r14,3
	jmp LB_4321
LB_4322:
	jmp LB_4317
LB_4321:
	jmp LB_4324
LB_4323:
	add r14,1 
LB_4324:
	cmp r14,r9
	jge LB_4325
	JZ_SPC BYTE [r13+8+r14], LB_4323
LB_4325:
	call GRM_386
	cmp BYTE [r8+6],0
	jnz LB_4327
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a41◂ [ a18◂ [ ]] ) ⊢ 8'(= a41◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4326
LB_4327:
; .dlt.ptn { }
	jmp LB_4317
LB_4326:
	jmp LB_4329
LB_4328:
	add r14,1 
LB_4329:
	cmp r14,r9
	jge LB_4330
	JZ_SPC BYTE [r13+8+r14], LB_4328
LB_4330:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4332
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4332
	cmp BYTE [rdi+1],159
	jnz LB_4332
	cmp BYTE [rdi+2],167
	jnz LB_4332
	add r14,3
	jmp LB_4331
LB_4332:
; .dlt.ptn 8'(= a41◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3118
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_4317
LB_4331:
	jmp LB_4334
LB_4333:
; .dlt.ptn { }
; .dlt.ptn 8'(= a41◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3118
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_4317
LB_4334:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3275~1'(= r ) %3274~0'(= r ) %3273~8'(= a41◂ [ a18◂ [ ]] ) 
; #233 8'(= a41◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂8'(= a41◂ [ a18◂ [ ]] )
;; rsp=1 , %3276~0(<2)◂8'(= a41◂ [ a18◂ [ ]] ) %3275~1'(= r ) %3274~0'(= r ) 
; #26 0(<2)◂8'(= a41◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a41◂ [ a18◂ [ ]] )
;; rsp=1 , %3277~0(<2)◂0(<2)◂8'(= a41◂ [ a18◂ [ ]] ) %3275~1'(= r ) %3274~0'(= r ) 
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
	jmp LB_4335
LB_4335:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4316
LB_4317:
	mov r14,QWORD [rsp]
	jmp LB_4339
LB_4338:
	add r14,1 
LB_4339:
	cmp r14,r9
	jge LB_4340
	JZ_SPC BYTE [r13+8+r14], LB_4338
LB_4340:
	call GRM_386
	cmp BYTE [r8+6],0
	jnz LB_4342
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a41◂ [ a18◂ [ ]] ) ⊢ 8'(= a41◂ [ a18◂ [ ]] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4341
LB_4342:
	jmp LB_4337
LB_4341:
	jmp LB_4344
LB_4343:
; .dlt.ptn 8'(= a41◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3118
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_4337
LB_4344:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3280~1'(= r ) %3279~0'(= r ) %3278~8'(= a41◂ [ a18◂ [ ]] ) 
; #232 8'(= a41◂ [ a18◂ [ ]] ) ⊢ 1(<2)◂8'(= a41◂ [ a18◂ [ ]] )
;; rsp=1 , %3281~1(<2)◂8'(= a41◂ [ a18◂ [ ]] ) %3280~1'(= r ) %3279~0'(= r ) 
; #26 1(<2)◂8'(= a41◂ [ a18◂ [ ]] ) ⊢ 0(<2)◂1(<2)◂8'(= a41◂ [ a18◂ [ ]] )
;; rsp=1 , %3282~0(<2)◂1(<2)◂8'(= a41◂ [ a18◂ [ ]] ) %3280~1'(= r ) %3279~0'(= r ) 
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
	jmp LB_4345
LB_4345:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4316
LB_4337:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4316:
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
	jmp LB_4350
LB_4349:
	add r14,1 
LB_4350:
	cmp r14,r9
	jge LB_4351
	JZ_SPC BYTE [r13+8+r14], LB_4349
LB_4351:
	call GRM_101
	cmp BYTE [r8+6],0
	jnz LB_4353
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4352
LB_4353:
	jmp LB_4348
LB_4352:
	jmp LB_4355
LB_4354:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_4348
LB_4355:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3285~1'(= r ) %3284~0'(= r ) %3283~8'(= {| l |} ) 
; #230 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %3286~1(<2)◂8'(= {| l |} ) %3285~1'(= r ) %3284~0'(= r ) 
; #26 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %3287~0(<2)◂1(<2)◂8'(= {| l |} ) %3285~1'(= r ) %3284~0'(= r ) 
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
	jmp LB_4356
LB_4356:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4347
LB_4348:
	mov r14,QWORD [rsp]
	jmp LB_4360
LB_4359:
	add r14,1 
LB_4360:
	cmp r14,r9
	jge LB_4361
	JZ_SPC BYTE [r13+8+r14], LB_4359
LB_4361:
	call GRM_304
	cmp BYTE [r8+6],0
	jnz LB_4363
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a18◂ [ ] ) ⊢ 8'(= a18◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4362
LB_4363:
	jmp LB_4358
LB_4362:
	jmp LB_4365
LB_4364:
; .dlt.ptn 8'(= a18◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_355
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_4358
LB_4365:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3290~1'(= r ) %3289~0'(= r ) %3288~8'(= a18◂ [ ] ) 
; #231 8'(= a18◂ [ ] ) ⊢ 0(<2)◂8'(= a18◂ [ ] )
;; rsp=1 , %3291~0(<2)◂8'(= a18◂ [ ] ) %3290~1'(= r ) %3289~0'(= r ) 
; #26 0(<2)◂8'(= a18◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a18◂ [ ] )
;; rsp=1 , %3292~0(<2)◂0(<2)◂8'(= a18◂ [ ] ) %3290~1'(= r ) %3289~0'(= r ) 
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
	jmp LB_4366
LB_4366:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4347
LB_4358:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4347:
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
	jmp LB_4371
LB_4370:
	add r14,1 
LB_4371:
	cmp r14,r9
	jge LB_4372
	JZ_SPC BYTE [r13+8+r14], LB_4370
LB_4372:
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_4374
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4374
	cmp BYTE [rdi+1],136
	jnz LB_4374
	cmp BYTE [rdi+2],144
	jnz LB_4374
	cmp BYTE [rdi+3],42
	jnz LB_4374
	add r14,4
	jmp LB_4373
LB_4374:
	jmp LB_4369
LB_4373:
	jmp LB_4376
LB_4375:
; .dlt.ptn { }
	jmp LB_4369
LB_4376:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3294~1'(= r ) %3293~0'(= r ) 
; #238 { } ⊢ 1(<3)◂{ }
;; rsp=0 , %3295~1(<3)◂{ } %3294~1'(= r ) %3293~0'(= r ) 
; #26 1(<3)◂{ } ⊢ 0(<2)◂1(<3)◂{ }
;; rsp=0 , %3296~0(<2)◂1(<3)◂{ } %3294~1'(= r ) %3293~0'(= r ) 
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
	jmp LB_4377
LB_4377:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4368
LB_4369:
	mov r14,QWORD [rsp]
	jmp LB_4381
LB_4380:
	add r14,1 
LB_4381:
	cmp r14,r9
	jge LB_4382
	JZ_SPC BYTE [r13+8+r14], LB_4380
LB_4382:
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_4384
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4384
	cmp BYTE [rdi+1],136
	jnz LB_4384
	cmp BYTE [rdi+2],144
	jnz LB_4384
	cmp BYTE [rdi+3],35
	jnz LB_4384
	add r14,4
	jmp LB_4383
LB_4384:
	jmp LB_4379
LB_4383:
	jmp LB_4386
LB_4385:
; .dlt.ptn { }
	jmp LB_4379
LB_4386:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3298~1'(= r ) %3297~0'(= r ) 
; #237 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %3299~2(<3)◂{ } %3298~1'(= r ) %3297~0'(= r ) 
; #26 2(<3)◂{ } ⊢ 0(<2)◂2(<3)◂{ }
;; rsp=0 , %3300~0(<2)◂2(<3)◂{ } %3298~1'(= r ) %3297~0'(= r ) 
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
	jmp LB_4387
LB_4387:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4368
LB_4379:
	mov r14,QWORD [rsp]
	jmp LB_4391
LB_4390:
	add r14,1 
LB_4391:
	cmp r14,r9
	jge LB_4392
	JZ_SPC BYTE [r13+8+r14], LB_4390
LB_4392:
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4394
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4394
	cmp BYTE [rdi+1],136
	jnz LB_4394
	cmp BYTE [rdi+2],144
	jnz LB_4394
	add r14,3
	jmp LB_4393
LB_4394:
	jmp LB_4389
LB_4393:
	jmp LB_4396
LB_4395:
; .dlt.ptn { }
	jmp LB_4389
LB_4396:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3302~1'(= r ) %3301~0'(= r ) 
; #239 { } ⊢ 0(<3)◂{ }
;; rsp=0 , %3303~0(<3)◂{ } %3302~1'(= r ) %3301~0'(= r ) 
; #26 0(<3)◂{ } ⊢ 0(<2)◂0(<3)◂{ }
;; rsp=0 , %3304~0(<2)◂0(<3)◂{ } %3302~1'(= r ) %3301~0'(= r ) 
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
	jmp LB_4397
LB_4397:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4368
LB_4389:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4368:
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
	jmp LB_4402
LB_4401:
	add r14,1 
LB_4402:
	cmp r14,r9
	jge LB_4403
	JZ_SPC BYTE [r13+8+r14], LB_4401
LB_4403:
	lea rax,[r14+5]
	cmp rax,r9
	jg LB_4405
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4405
	cmp BYTE [rdi+1],136
	jnz LB_4405
	cmp BYTE [rdi+2],144
	jnz LB_4405
	cmp BYTE [rdi+3],46
	jnz LB_4405
	cmp BYTE [rdi+4],42
	jnz LB_4405
	add r14,5
	jmp LB_4404
LB_4405:
	jmp LB_4400
LB_4404:
	jmp LB_4407
LB_4406:
; .dlt.ptn { }
	jmp LB_4400
LB_4407:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3306~1'(= r ) %3305~0'(= r ) 
; #238 { } ⊢ 1(<3)◂{ }
;; rsp=0 , %3307~1(<3)◂{ } %3306~1'(= r ) %3305~0'(= r ) 
; #26 1(<3)◂{ } ⊢ 0(<2)◂1(<3)◂{ }
;; rsp=0 , %3308~0(<2)◂1(<3)◂{ } %3306~1'(= r ) %3305~0'(= r ) 
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
	jmp LB_4408
LB_4408:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4399
LB_4400:
	mov r14,QWORD [rsp]
	jmp LB_4412
LB_4411:
	add r14,1 
LB_4412:
	cmp r14,r9
	jge LB_4413
	JZ_SPC BYTE [r13+8+r14], LB_4411
LB_4413:
	lea rax,[r14+5]
	cmp rax,r9
	jg LB_4415
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4415
	cmp BYTE [rdi+1],136
	jnz LB_4415
	cmp BYTE [rdi+2],144
	jnz LB_4415
	cmp BYTE [rdi+3],46
	jnz LB_4415
	cmp BYTE [rdi+4],35
	jnz LB_4415
	add r14,5
	jmp LB_4414
LB_4415:
	jmp LB_4410
LB_4414:
	jmp LB_4417
LB_4416:
; .dlt.ptn { }
	jmp LB_4410
LB_4417:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3310~1'(= r ) %3309~0'(= r ) 
; #237 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %3311~2(<3)◂{ } %3310~1'(= r ) %3309~0'(= r ) 
; #26 2(<3)◂{ } ⊢ 0(<2)◂2(<3)◂{ }
;; rsp=0 , %3312~0(<2)◂2(<3)◂{ } %3310~1'(= r ) %3309~0'(= r ) 
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
	jmp LB_4418
LB_4418:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4399
LB_4410:
	mov r14,QWORD [rsp]
	jmp LB_4422
LB_4421:
	add r14,1 
LB_4422:
	cmp r14,r9
	jge LB_4423
	JZ_SPC BYTE [r13+8+r14], LB_4421
LB_4423:
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_4425
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4425
	cmp BYTE [rdi+1],136
	jnz LB_4425
	cmp BYTE [rdi+2],144
	jnz LB_4425
	cmp BYTE [rdi+3],46
	jnz LB_4425
	add r14,4
	jmp LB_4424
LB_4425:
	jmp LB_4420
LB_4424:
	jmp LB_4427
LB_4426:
; .dlt.ptn { }
	jmp LB_4420
LB_4427:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3314~1'(= r ) %3313~0'(= r ) 
; #239 { } ⊢ 0(<3)◂{ }
;; rsp=0 , %3315~0(<3)◂{ } %3314~1'(= r ) %3313~0'(= r ) 
; #26 0(<3)◂{ } ⊢ 0(<2)◂0(<3)◂{ }
;; rsp=0 , %3316~0(<2)◂0(<3)◂{ } %3314~1'(= r ) %3313~0'(= r ) 
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
	jmp LB_4428
LB_4428:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4399
LB_4420:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4399:
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
	jmp LB_4433
LB_4432:
	add r14,1 
LB_4433:
	cmp r14,r9
	jge LB_4434
	JZ_SPC BYTE [r13+8+r14], LB_4432
LB_4434:
	call GRM_388
	cmp BYTE [r8+6],0
	jnz LB_4436
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a38◂ [ ] ) ⊢ 8'(= a38◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4435
LB_4436:
	jmp LB_4431
LB_4435:
	jmp LB_4438
LB_4437:
	add r14,1 
LB_4438:
	cmp r14,r9
	jge LB_4439
	JZ_SPC BYTE [r13+8+r14], LB_4437
LB_4439:
	call GRM_391
	cmp BYTE [r8+6],0
	jnz LB_4441
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ {| l |}] ) ⊢ 9'(= a3◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4440
LB_4441:
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4430
LB_4440:
	jmp LB_4443
LB_4442:
	add r14,1 
LB_4443:
	cmp r14,r9
	jge LB_4444
	JZ_SPC BYTE [r13+8+r14], LB_4442
LB_4444:
	call GRM_383
	cmp BYTE [r8+6],0
	jnz LB_4446
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 10'(= a39◂ [ a18◂ [ ]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4445
LB_4446:
; .dlt.ptn 9'(= a3◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_479
	C_POP_REGS
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4430
LB_4445:
	jmp LB_4448
LB_4447:
	add r14,1 
LB_4448:
	cmp r14,r9
	jge LB_4449
	JZ_SPC BYTE [r13+8+r14], LB_4447
LB_4449:
	call GRM_390
	cmp BYTE [r8+6],0
	jnz LB_4451
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) ⊢ 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4450
LB_4451:
; .dlt.ptn 10'(= a39◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3101
	C_POP_REGS
; .dlt.ptn 9'(= a3◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_479
	C_POP_REGS
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4430
LB_4450:
	jmp LB_4453
LB_4452:
; .dlt.ptn 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3136
	C_POP_REGS
; .dlt.ptn 10'(= a39◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3101
	C_POP_REGS
; .dlt.ptn 9'(= a3◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_479
	C_POP_REGS
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	mov r14,QWORD [rsp]
	mov r8,unt_1
	jmp LB_4430
LB_4453:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*4]
;; rsp=4 , %3322~1'(= r ) %3321~0'(= r ) %3320~11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) %3319~10'(= a39◂ [ a18◂ [ ]] ) %3318~9'(= a3◂ [ {| l |}] ) %3317~8'(= a38◂ [ ] ) 
; #242 { 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=4 , %3323~1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } %3322~1'(= r ) %3321~0'(= r ) 
; #26 1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) }
;; rsp=4 , %3324~0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) } %3322~1'(= r ) %3321~0'(= r ) 
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
	jmp LB_4454
LB_4454:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4430
LB_4431:
	mov r14,QWORD [rsp] 
	jmp LB_4458
LB_4457:
	add r14,1 
LB_4458:
	cmp r14,r9
	jge LB_4459
	JZ_SPC BYTE [r13+8+r14], LB_4457
LB_4459:
	call GRM_387
	cmp BYTE [r8+6],0
	jnz LB_4461
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a38◂ [ ] ) ⊢ 8'(= a38◂ [ ] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4460
LB_4461:
	jmp LB_4456
LB_4460:
	jmp LB_4463
LB_4462:
	add r14,1 
LB_4463:
	cmp r14,r9
	jge LB_4464
	JZ_SPC BYTE [r13+8+r14], LB_4462
LB_4464:
	call GRM_391
	cmp BYTE [r8+6],0
	jnz LB_4466
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ {| l |}] ) ⊢ 9'(= a3◂ [ {| l |}] )
; {| 11110000110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4465
LB_4466:
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_4456
LB_4465:
	jmp LB_4468
LB_4467:
	add r14,1 
LB_4468:
	cmp r14,r9
	jge LB_4469
	JZ_SPC BYTE [r13+8+r14], LB_4467
LB_4469:
	call GRM_383
	cmp BYTE [r8+6],0
	jnz LB_4471
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a39◂ [ a18◂ [ ]] ) ⊢ 10'(= a39◂ [ a18◂ [ ]] )
; {| 111100001110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4470
LB_4471:
; .dlt.ptn 9'(= a3◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_479
	C_POP_REGS
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 2
	add rsp,16
	jmp LB_4456
LB_4470:
	jmp LB_4473
LB_4472:
	add r14,1 
LB_4473:
	cmp r14,r9
	jge LB_4474
	JZ_SPC BYTE [r13+8+r14], LB_4472
LB_4474:
	call GRM_390
	cmp BYTE [r8+6],0
	jnz LB_4476
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) ⊢ 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] )
; {| 1111000011110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4475
LB_4476:
; .dlt.ptn 10'(= a39◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3101
	C_POP_REGS
; .dlt.ptn 9'(= a3◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_479
	C_POP_REGS
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 3
	add rsp,24
	jmp LB_4456
LB_4475:
	jmp LB_4478
LB_4477:
	add r14,1 
LB_4478:
	cmp r14,r9
	jge LB_4479
	JZ_SPC BYTE [r13+8+r14], LB_4477
LB_4479:
	call GRM_389
	cmp BYTE [r8+6],0
	jnz LB_4481
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 12'(= a36◂ [ a18◂ [ ]{| l |}] )
; {| 11110000111110.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4480
LB_4481:
; .dlt.ptn 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3136
	C_POP_REGS
; .dlt.ptn 10'(= a39◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3101
	C_POP_REGS
; .dlt.ptn 9'(= a3◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_479
	C_POP_REGS
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 4
	add rsp,32
	jmp LB_4456
LB_4480:
	jmp LB_4483
LB_4482:
; .dlt.ptn 12'(= a36◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3094
	C_POP_REGS
; .dlt.ptn 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] )
	mov rdi,QWORD [rsp-8+8*2]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3136
	C_POP_REGS
; .dlt.ptn 10'(= a39◂ [ a18◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*3]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3101
	C_POP_REGS
; .dlt.ptn 9'(= a3◂ [ {| l |}] )
	mov rdi,QWORD [rsp-8+8*4]
	C_PUSH_REGS
	mov r8,rdi
	call LB_479
	C_POP_REGS
; .dlt.ptn 8'(= a38◂ [ ] )
	mov rdi,QWORD [rsp-8+8*5]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3100
	C_POP_REGS
; .add_rsp 5
	add rsp,40
	jmp LB_4456
LB_4483:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*5]
;; rsp=5 , %3331~1'(= r ) %3330~0'(= r ) %3329~12'(= a36◂ [ a18◂ [ ]{| l |}] ) %3328~11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) %3327~10'(= a39◂ [ a18◂ [ ]] ) %3326~9'(= a3◂ [ {| l |}] ) %3325~8'(= a38◂ [ ] ) 
; #243 { 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %3332~0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } %3331~1'(= r ) %3330~0'(= r ) 
; #26 0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) }
;; rsp=5 , %3333~0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a38◂ [ ] ) 10'(= a39◂ [ a18◂ [ ]] ) 11'(= a3◂ [ a36◂ [ a18◂ [ ]{| l |}]] ) 12'(= a36◂ [ a18◂ [ ]{| l |}] ) } %3331~1'(= r ) %3330~0'(= r ) 
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
	jmp LB_4484
LB_4484:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4430
LB_4456:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4430:
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
	jmp LB_4489
LB_4488:
	add r14,1 
LB_4489:
	cmp r14,r9
	jge LB_4490
	JZ_SPC BYTE [r13+8+r14], LB_4488
LB_4490:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4492
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_4492
	add r14,1
	jmp LB_4491
LB_4492:
	jmp LB_4487
LB_4491:
	jmp LB_4494
LB_4493:
	add r14,1 
LB_4494:
	cmp r14,r9
	jge LB_4495
	JZ_SPC BYTE [r13+8+r14], LB_4493
LB_4495:
	call GRM_389
	cmp BYTE [r8+6],0
	jnz LB_4497
	sub rsp,8
	mov rdi,[r8+8]
	FREE_LN r8 
	mov r8,rdi
; .mov_ptn2 2'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 8'(= a36◂ [ a18◂ [ ]{| l |}] )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4496
LB_4497:
; .dlt.ptn { }
	jmp LB_4487
LB_4496:
	jmp LB_4499
LB_4498:
; .dlt.ptn 8'(= a36◂ [ a18◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	call LB_3094
	C_POP_REGS
; .dlt.ptn { }
; .add_rsp 1
	add rsp,8
	jmp LB_4487
LB_4499:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3336~1'(= r ) %3335~0'(= r ) %3334~8'(= a36◂ [ a18◂ [ ]{| l |}] ) 
; #26 8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3337~0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) %3336~1'(= r ) %3335~0'(= r ) 
; #26 0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) ⊢ 0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] )
;; rsp=1 , %3338~0(<2)◂0(<2)◂8'(= a36◂ [ a18◂ [ ]{| l |}] ) %3336~1'(= r ) %3335~0'(= r ) 
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
	jmp LB_4500
LB_4500:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4486
LB_4487:
	mov r14,QWORD [rsp]
	jmp LB_4504
LB_4503:
	jmp LB_4502
LB_4504:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3340~1'(= r ) %3339~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3341~1(<2)◂{ } %3340~1'(= r ) %3339~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3342~0(<2)◂1(<2)◂{ } %3340~1'(= r ) %3339~0'(= r ) 
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
	jmp LB_4505
LB_4505:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4486
LB_4502:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4486:
; discard r14
	add rsp,8
	ret
ETR_391:
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
	call GRM_391
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
GRM_391:
	push r14
	jmp LB_4510
LB_4509:
	add r14,1 
LB_4510:
	cmp r14,r9
	jge LB_4511
	JZ_SPC BYTE [r13+8+r14], LB_4509
LB_4511:
	call GRM_108
	cmp BYTE [r8+6],0
	jnz LB_4513
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; {| 1111000010.. |}
	mov QWORD [rsp-8+8*1],r8
; mov_ptn2.
	jmp LB_4512
LB_4513:
	jmp LB_4508
LB_4512:
	jmp LB_4515
LB_4514:
	add r14,1 
LB_4515:
	cmp r14,r9
	jge LB_4516
	JZ_SPC BYTE [r13+8+r14], LB_4514
LB_4516:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4518
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_4518
	add r14,1
	jmp LB_4517
LB_4518:
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_4508
LB_4517:
	jmp LB_4520
LB_4519:
; .dlt.ptn { }
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	C_PUSH_REGS
	mov r8,rdi
	mov rdi,r8
	call free_s8
	C_POP_REGS
; .add_rsp 1
	add rsp,8
	jmp LB_4508
LB_4520:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*1]
;; rsp=1 , %3345~1'(= r ) %3344~0'(= r ) %3343~8'(= {| l |} ) 
; #26 8'(= {| l |} ) ⊢ 0(<2)◂8'(= {| l |} )
;; rsp=1 , %3346~0(<2)◂8'(= {| l |} ) %3345~1'(= r ) %3344~0'(= r ) 
; #26 0(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<2)◂8'(= {| l |} )
;; rsp=1 , %3347~0(<2)◂0(<2)◂8'(= {| l |} ) %3345~1'(= r ) %3344~0'(= r ) 
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
	jmp LB_4521
LB_4521:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4507
LB_4508:
	mov r14,QWORD [rsp]
	jmp LB_4525
LB_4524:
	jmp LB_4523
LB_4525:
	mov QWORD [GRM_DT+24],r14
	mov r13,QWORD [rsp+8*0]
;; rsp=0 , %3349~1'(= r ) %3348~0'(= r ) 
; #27 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %3350~1(<2)◂{ } %3349~1'(= r ) %3348~0'(= r ) 
; #26 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %3351~0(<2)◂1(<2)◂{ } %3349~1'(= r ) %3348~0'(= r ) 
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
	jmp LB_4526
LB_4526:
	mov r13,QWORD [GRM_DT]
	mov r9,QWORD [GRM_DT+8]
	mov r14,QWORD [GRM_DT+24]
	cmp BYTE [r8+6],0
	jz LB_4507
LB_4523:
	mov r14,QWORD [rsp]
	mov r8,unt_1
LB_4507:
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
	lea rsi,[LB_4528+30-1]
	mov rcx,30
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %18455~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_1
LB_4539:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4543+8*rax]
LB_4543: dq LB_4541,LB_4542
LB_4541:
	mov rdi,LB_4545
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4546
	jmp LB_4544
LB_4542:
	mov rdi,LB_4547
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4544
LB_4544:
	ret
LB_4546:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4550+8*rax]
LB_4550: dq LB_4548,LB_4549
LB_4548:
	mov rdi,LB_4552
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4553
	jmp LB_4551
LB_4549:
	mov rdi,LB_4554
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4555
	jmp LB_4551
LB_4551:
	ret
LB_4555:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4558+8*rax]
LB_4558: dq LB_4556,LB_4557
LB_4556:
	mov rdi,LB_4560
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
	call LB_4555
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4559
LB_4557:
	mov rdi,LB_4561
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4559
LB_4559:
	ret
LB_4553:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4564+8*rax]
LB_4564: dq LB_4562,LB_4563
LB_4562:
	mov rdi,LB_4566
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4567
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4553
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4565
LB_4563:
	mov rdi,LB_4568
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4565
LB_4565:
	ret
LB_4567:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4575+8*rax]
LB_4575: dq LB_4569,LB_4570,LB_4571,LB_4572,LB_4573,LB_4574
LB_4569:
	mov rdi,LB_4577
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
	call LB_4578
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4576
LB_4570:
	mov rdi,LB_4579
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4580
	jmp LB_4576
LB_4571:
	mov rdi,LB_4581
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
	call LB_4582
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4576
LB_4572:
	mov rdi,LB_4583
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4584
	jmp LB_4576
LB_4573:
	mov rdi,LB_4585
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
	call LB_4586
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4576
LB_4574:
	mov rdi,LB_4587
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4588
	jmp LB_4576
LB_4576:
	ret
LB_4588:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4591+8*rax]
LB_4591: dq LB_4589,LB_4590
LB_4589:
	mov rdi,LB_4593
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
	call LB_4586
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
	call LB_4588
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4592
LB_4590:
	mov rdi,LB_4594
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4592
LB_4592:
	ret
LB_4586:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4597+8*rax]
LB_4597: dq LB_4595,LB_4596
LB_4595:
	mov rdi,LB_4599
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4600
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4601
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4598
LB_4596:
	mov rdi,LB_4602
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4600
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4603
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4598
LB_4598:
	ret
LB_4603:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4609+8*rax]
LB_4609: dq LB_4604,LB_4605,LB_4606,LB_4607,LB_4608
LB_4604:
	mov rdi,LB_4611
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4612
	jmp LB_4610
LB_4605:
	mov rdi,LB_4613
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4603
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4603
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4610
LB_4606:
	mov rdi,LB_4614
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4603
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4603
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4610
LB_4607:
	mov rdi,LB_4615
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4616
	jmp LB_4610
LB_4608:
	mov rdi,LB_4617
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4610
LB_4610:
	ret
LB_4616:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4620+8*rax]
LB_4620: dq LB_4618,LB_4619
LB_4618:
	mov rdi,LB_4622
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
	call LB_4616
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4621
LB_4619:
	mov rdi,LB_4623
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4621
LB_4621:
	ret
LB_4612:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4626+8*rax]
LB_4626: dq LB_4624,LB_4625
LB_4624:
	mov rdi,LB_4628
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4603
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4612
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4627
LB_4625:
	mov rdi,LB_4629
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4627
LB_4627:
	ret
LB_4601:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4632+8*rax]
LB_4632: dq LB_4630,LB_4631
LB_4630:
	mov rdi,LB_4634
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
	call LB_4603
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
	call LB_4601
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4633
LB_4631:
	mov rdi,LB_4635
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4633
LB_4633:
	ret
LB_4600:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4638+8*rax]
LB_4638: dq LB_4636,LB_4637
LB_4636:
	mov rdi,LB_4640
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
	call LB_4600
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4639
LB_4637:
	mov rdi,LB_4641
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4639
LB_4639:
	ret
LB_4584:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4644+8*rax]
LB_4644: dq LB_4642,LB_4643
LB_4642:
	mov rdi,LB_4646
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
	call LB_4647
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4648
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_4649
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
	call LB_4584
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4645
LB_4643:
	mov rdi,LB_4650
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4645
LB_4645:
	ret
LB_4649:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4658+8*rax]
LB_4658: dq LB_4651,LB_4652,LB_4653,LB_4654,LB_4655,LB_4656,LB_4657
LB_4651:
	mov rdi,LB_4660
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4616
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4661
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4659
LB_4652:
	mov rdi,LB_4662
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4663
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4661
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4659
LB_4653:
	mov rdi,LB_4664
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4665
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4649
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4659
LB_4654:
	mov rdi,LB_4666
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4667
	jmp LB_4659
LB_4655:
	mov rdi,LB_4668
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4661
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4669
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4659
LB_4656:
	mov rdi,LB_4670
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4671
	jmp LB_4659
LB_4657:
	mov rdi,LB_4672
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4659
LB_4659:
	ret
LB_4671:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4675+8*rax]
LB_4675: dq LB_4673,LB_4674
LB_4673:
	mov rdi,LB_4677
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4661
	jmp LB_4676
LB_4674:
	mov rdi,LB_4678
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4676
LB_4676:
	ret
LB_4669:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4681+8*rax]
LB_4681: dq LB_4679,LB_4680
LB_4679:
	mov rdi,LB_4683
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4684
	jmp LB_4682
LB_4680:
	mov rdi,LB_4685
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4686
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4649
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4682
LB_4682:
	ret
LB_4686:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4689+8*rax]
LB_4689: dq LB_4687,LB_4688
LB_4687:
	mov rdi,LB_4691
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4647
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4686
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4690
LB_4688:
	mov rdi,LB_4692
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4690
LB_4690:
	ret
LB_4684:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4695+8*rax]
LB_4695: dq LB_4693,LB_4694
LB_4693:
	mov rdi,LB_4697
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4698
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4699
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4700
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
	call LB_4684
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4696
LB_4694:
	mov rdi,LB_4701
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4698
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4699
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4700
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4696
LB_4696:
	ret
LB_4700:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4705+8*rax]
LB_4705: dq LB_4702,LB_4703,LB_4704
LB_4702:
	mov rdi,LB_4707
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4667
	jmp LB_4706
LB_4703:
	mov rdi,LB_4708
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4661
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4684
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4706
LB_4704:
	mov rdi,LB_4709
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4649
	jmp LB_4706
LB_4706:
	ret
LB_4699:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4712+8*rax]
LB_4712: dq LB_4710,LB_4711
LB_4710:
	mov rdi,LB_4714
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4715
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4699
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4713
LB_4711:
	mov rdi,LB_4716
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4713
LB_4713:
	ret
LB_4715:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4720+8*rax]
LB_4720: dq LB_4717,LB_4718,LB_4719
LB_4717:
	mov rdi,LB_4722
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4661
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4698
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4721
LB_4718:
	mov rdi,LB_4723
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4724
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4724
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4721
LB_4719:
	mov rdi,LB_4725
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4724
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4724
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4721
LB_4721:
	ret
LB_4724:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4728+8*rax]
LB_4728: dq LB_4726,LB_4727
LB_4726:
	mov rdi,LB_4730
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4731
	jmp LB_4729
LB_4727:
	mov rdi,LB_4732
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4729
LB_4729:
	ret
LB_4731:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4740+8*rax]
LB_4740: dq LB_4733,LB_4734,LB_4735,LB_4736,LB_4737,LB_4738,LB_4739
LB_4733:
	mov rdi,LB_4742
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
	call LB_4743
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
	call LB_4743
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4741
LB_4734:
	mov rdi,LB_4744
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4745
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4746
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4741
LB_4735:
	mov rdi,LB_4747
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4741
LB_4736:
	mov rdi,LB_4748
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4741
LB_4737:
	mov rdi,LB_4749
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4741
LB_4738:
	mov rdi,LB_4750
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4616
	jmp LB_4741
LB_4739:
	mov rdi,LB_4751
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
	jmp LB_4741
LB_4741:
	ret
LB_4746:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4759+8*rax]
LB_4759: dq LB_4752,LB_4753,LB_4754,LB_4755,LB_4756,LB_4757,LB_4758
LB_4752:
	mov rdi,LB_4761
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
	call LB_4762
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4760
LB_4753:
	mov rdi,LB_4763
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
	call LB_4762
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4760
LB_4754:
	mov rdi,LB_4765
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4766
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4746
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4760
LB_4755:
	mov rdi,LB_4767
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4768
	jmp LB_4760
LB_4756:
	mov rdi,LB_4769
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
	call LB_4770
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4760
LB_4757:
	mov rdi,LB_4771
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4772
	jmp LB_4760
LB_4758:
	mov rdi,LB_4773
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4760
LB_4760:
	ret
LB_4772:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4776+8*rax]
LB_4776: dq LB_4774,LB_4775
LB_4774:
	mov rdi,LB_4778
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4762
	jmp LB_4777
LB_4775:
	mov rdi,LB_4779
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4777
LB_4777:
	ret
LB_4770:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4782+8*rax]
LB_4782: dq LB_4780,LB_4781
LB_4780:
	mov rdi,LB_4784
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4785
	jmp LB_4783
LB_4781:
	mov rdi,LB_4786
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4787
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4746
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4783
LB_4783:
	ret
LB_4787:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4790+8*rax]
LB_4790: dq LB_4788,LB_4789
LB_4788:
	mov rdi,LB_4792
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4745
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4787
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4791
LB_4789:
	mov rdi,LB_4793
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4791
LB_4791:
	ret
LB_4785:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4796+8*rax]
LB_4796: dq LB_4794,LB_4795
LB_4794:
	mov rdi,LB_4798
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4799
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4800
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4801
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
	call LB_4785
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4797
LB_4795:
	mov rdi,LB_4802
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4799
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4800
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4801
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4797
LB_4797:
	ret
LB_4801:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4806+8*rax]
LB_4806: dq LB_4803,LB_4804,LB_4805
LB_4803:
	mov rdi,LB_4808
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4768
	jmp LB_4807
LB_4804:
	mov rdi,LB_4809
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
	call LB_4785
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4807
LB_4805:
	mov rdi,LB_4810
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4746
	jmp LB_4807
LB_4807:
	ret
LB_4800:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4813+8*rax]
LB_4813: dq LB_4811,LB_4812
LB_4811:
	mov rdi,LB_4815
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4816
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4800
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4814
LB_4812:
	mov rdi,LB_4817
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4814
LB_4814:
	ret
LB_4816:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4821+8*rax]
LB_4821: dq LB_4818,LB_4819,LB_4820
LB_4818:
	mov rdi,LB_4823
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
	call LB_4799
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4822
LB_4819:
	mov rdi,LB_4824
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4825
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4825
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4822
LB_4820:
	mov rdi,LB_4826
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4825
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4825
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4822
LB_4822:
	ret
LB_4825:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4829+8*rax]
LB_4829: dq LB_4827,LB_4828
LB_4827:
	mov rdi,LB_4831
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4832
	jmp LB_4830
LB_4828:
	mov rdi,LB_4833
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4830
LB_4830:
	ret
LB_4832:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4841+8*rax]
LB_4841: dq LB_4834,LB_4835,LB_4836,LB_4837,LB_4838,LB_4839,LB_4840
LB_4834:
	mov rdi,LB_4843
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
	call LB_4743
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
	call LB_4743
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4842
LB_4835:
	mov rdi,LB_4844
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4745
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4746
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4842
LB_4836:
	mov rdi,LB_4845
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4842
LB_4837:
	mov rdi,LB_4846
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4842
LB_4838:
	mov rdi,LB_4847
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4842
LB_4839:
	mov rdi,LB_4848
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4842
LB_4840:
	mov rdi,LB_4849
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
	jmp LB_4842
LB_4842:
	ret
LB_4799:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4852+8*rax]
LB_4852: dq LB_4850,LB_4851
LB_4850:
	mov rdi,LB_4854
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4855
	jmp LB_4853
LB_4851:
	mov rdi,LB_4856
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4857
	jmp LB_4853
LB_4853:
	ret
LB_4857:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4862+8*rax]
LB_4862: dq LB_4858,LB_4859,LB_4860,LB_4861
LB_4858:
	mov rdi,LB_4864
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
	call LB_4799
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4863
LB_4859:
	mov rdi,LB_4865
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4832
	jmp LB_4863
LB_4860:
	mov rdi,LB_4866
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4867
	jmp LB_4863
LB_4861:
	mov rdi,LB_4868
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4863
LB_4863:
	ret
LB_4867:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4871+8*rax]
LB_4871: dq LB_4869,LB_4870
LB_4869:
	mov rdi,LB_4873
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4872
LB_4870:
	mov rdi,LB_4874
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4872
LB_4872:
	ret
LB_4855:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4877+8*rax]
LB_4877: dq LB_4875,LB_4876
LB_4875:
	mov rdi,LB_4879
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4799
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4855
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4878
LB_4876:
	mov rdi,LB_4880
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4878
LB_4878:
	ret
LB_4768:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4883+8*rax]
LB_4883: dq LB_4881,LB_4882
LB_4881:
	mov rdi,LB_4885
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4800
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4801
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
	call LB_4768
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4884
LB_4882:
	mov rdi,LB_4886
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4800
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4801
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4884
LB_4884:
	ret
LB_4766:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4891+8*rax]
LB_4891: dq LB_4887,LB_4888,LB_4889,LB_4890
LB_4887:
	mov rdi,LB_4893
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
	call LB_4762
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4745
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4892
LB_4888:
	mov rdi,LB_4894
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
	call LB_4762
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4745
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4892
LB_4889:
	mov rdi,LB_4895
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4832
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4762
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4745
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4892
LB_4890:
	mov rdi,LB_4896
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4897
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4898
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4899
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4892
LB_4892:
	ret
LB_4899:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4902+8*rax]
LB_4902: dq LB_4900,LB_4901
LB_4900:
	mov rdi,LB_4904
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4905
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4899
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4903
LB_4901:
	mov rdi,LB_4906
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4903
LB_4903:
	ret
LB_4905:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4909+8*rax]
LB_4909: dq LB_4907,LB_4908
LB_4907:
	mov rdi,LB_4911
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4867
	jmp LB_4910
LB_4908:
	mov rdi,LB_4912
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4910
LB_4910:
	ret
LB_4898:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4915+8*rax]
LB_4915: dq LB_4913,LB_4914
LB_4913:
	mov rdi,LB_4917
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
	call LB_4898
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4916
LB_4914:
	mov rdi,LB_4918
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4916
LB_4916:
	ret
LB_4897:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4921+8*rax]
LB_4921: dq LB_4919,LB_4920
LB_4919:
	mov rdi,LB_4923
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4924
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4897
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4922
LB_4920:
	mov rdi,LB_4925
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4922
LB_4922:
	ret
LB_4924:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4929+8*rax]
LB_4929: dq LB_4926,LB_4927,LB_4928
LB_4926:
	mov rdi,LB_4931
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4832
	jmp LB_4930
LB_4927:
	mov rdi,LB_4932
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4933
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
	jmp LB_4930
LB_4928:
	mov rdi,LB_4934
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
	call LB_4832
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4930
LB_4930:
	ret
LB_4933:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4939+8*rax]
LB_4939: dq LB_4935,LB_4936,LB_4937,LB_4938
LB_4935:
	mov rdi,LB_4941
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4940
LB_4936:
	mov rdi,LB_4942
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4940
LB_4937:
	mov rdi,LB_4943
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4940
LB_4938:
	mov rdi,LB_4944
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4940
LB_4940:
	ret
LB_4764:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4947+8*rax]
LB_4947: dq LB_4945,LB_4946
LB_4945:
	mov rdi,LB_4949
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4832
	jmp LB_4948
LB_4946:
	mov rdi,LB_4950
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4948
LB_4948:
	ret
LB_4762:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4953+8*rax]
LB_4953: dq LB_4951,LB_4952
LB_4951:
	mov rdi,LB_4955
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4956
	jmp LB_4954
LB_4952:
	mov rdi,LB_4957
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4764
	jmp LB_4954
LB_4954:
	ret
LB_4956:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4960+8*rax]
LB_4960: dq LB_4958,LB_4959
LB_4958:
	mov rdi,LB_4962
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
	call LB_4956
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4961
LB_4959:
	mov rdi,LB_4963
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4961
LB_4961:
	ret
LB_4745:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4966+8*rax]
LB_4966: dq LB_4964,LB_4965
LB_4964:
	mov rdi,LB_4968
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4787
	jmp LB_4967
LB_4965:
	mov rdi,LB_4969
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4905
	jmp LB_4967
LB_4967:
	ret
LB_4743:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4972+8*rax]
LB_4972: dq LB_4970,LB_4971
LB_4970:
	mov rdi,LB_4974
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4975
	jmp LB_4973
LB_4971:
	mov rdi,LB_4976
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4977
	jmp LB_4973
LB_4973:
	ret
LB_4977:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4982+8*rax]
LB_4982: dq LB_4978,LB_4979,LB_4980,LB_4981
LB_4978:
	mov rdi,LB_4984
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
	call LB_4985
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4983
LB_4979:
	mov rdi,LB_4986
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4832
	jmp LB_4983
LB_4980:
	mov rdi,LB_4987
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
	call LB_4743
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4983
LB_4981:
	mov rdi,LB_4988
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
	jmp LB_4983
LB_4983:
	ret
LB_4985:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4993+8*rax]
LB_4993: dq LB_4989,LB_4990,LB_4991,LB_4992
LB_4989:
	mov rdi,LB_4995
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4996
	jmp LB_4994
LB_4990:
	mov rdi,LB_4997
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4994
LB_4991:
	mov rdi,LB_4998
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4994
LB_4992:
	mov rdi,LB_4999
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
	call LB_5000
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4994
LB_4994:
	ret
LB_5000:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5003+8*rax]
LB_5003: dq LB_5001,LB_5002
LB_5001:
	mov rdi,LB_5005
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4985
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5000
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5004
LB_5002:
	mov rdi,LB_5006
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5004
LB_5004:
	ret
LB_4996:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5012+8*rax]
LB_5012: dq LB_5007,LB_5008,LB_5009,LB_5010,LB_5011
LB_5007:
	mov rdi,LB_5014
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5013
LB_5008:
	mov rdi,LB_5015
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4985
	jmp LB_5013
LB_5009:
	mov rdi,LB_5016
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4985
	jmp LB_5013
LB_5010:
	mov rdi,LB_5017
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5013
LB_5011:
	mov rdi,LB_5018
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5000
	jmp LB_5013
LB_5013:
	ret
LB_4975:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5021+8*rax]
LB_5021: dq LB_5019,LB_5020
LB_5019:
	mov rdi,LB_5023
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4743
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4975
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5022
LB_5020:
	mov rdi,LB_5024
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5022
LB_5022:
	ret
LB_4698:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5027+8*rax]
LB_5027: dq LB_5025,LB_5026
LB_5025:
	mov rdi,LB_5029
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5030
	jmp LB_5028
LB_5026:
	mov rdi,LB_5031
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5032
	jmp LB_5028
LB_5028:
	ret
LB_5032:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5037+8*rax]
LB_5037: dq LB_5033,LB_5034,LB_5035,LB_5036
LB_5033:
	mov rdi,LB_5039
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4616
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4698
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5038
LB_5034:
	mov rdi,LB_5040
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4731
	jmp LB_5038
LB_5035:
	mov rdi,LB_5041
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5042
	jmp LB_5038
LB_5036:
	mov rdi,LB_5043
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5038
LB_5038:
	ret
LB_5042:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5046+8*rax]
LB_5046: dq LB_5044,LB_5045
LB_5044:
	mov rdi,LB_5048
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5047
LB_5045:
	mov rdi,LB_5049
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5047
LB_5047:
	ret
LB_5030:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5052+8*rax]
LB_5052: dq LB_5050,LB_5051
LB_5050:
	mov rdi,LB_5054
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4698
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5030
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5053
LB_5051:
	mov rdi,LB_5055
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5053
LB_5053:
	ret
LB_4667:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5058+8*rax]
LB_5058: dq LB_5056,LB_5057
LB_5056:
	mov rdi,LB_5060
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4699
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4700
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
	call LB_4667
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5059
LB_5057:
	mov rdi,LB_5061
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4699
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4700
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5059
LB_5059:
	ret
LB_4665:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5066+8*rax]
LB_5066: dq LB_5062,LB_5063,LB_5064,LB_5065
LB_5062:
	mov rdi,LB_5068
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4616
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4661
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4647
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5067
LB_5063:
	mov rdi,LB_5069
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4663
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4661
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4647
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5067
LB_5064:
	mov rdi,LB_5070
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4731
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4661
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4647
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5067
LB_5065:
	mov rdi,LB_5071
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5072
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5073
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5074
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5067
LB_5067:
	ret
LB_5074:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5077+8*rax]
LB_5077: dq LB_5075,LB_5076
LB_5075:
	mov rdi,LB_5079
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5080
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5074
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5078
LB_5076:
	mov rdi,LB_5081
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5078
LB_5078:
	ret
LB_5080:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5084+8*rax]
LB_5084: dq LB_5082,LB_5083
LB_5082:
	mov rdi,LB_5086
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5042
	jmp LB_5085
LB_5083:
	mov rdi,LB_5087
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5085
LB_5085:
	ret
LB_5073:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5090+8*rax]
LB_5090: dq LB_5088,LB_5089
LB_5088:
	mov rdi,LB_5092
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4663
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5073
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5091
LB_5089:
	mov rdi,LB_5093
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5091
LB_5091:
	ret
LB_5072:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5096+8*rax]
LB_5096: dq LB_5094,LB_5095
LB_5094:
	mov rdi,LB_5098
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5099
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5072
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5097
LB_5095:
	mov rdi,LB_5100
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5097
LB_5097:
	ret
LB_5099:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5104+8*rax]
LB_5104: dq LB_5101,LB_5102,LB_5103
LB_5101:
	mov rdi,LB_5106
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4731
	jmp LB_5105
LB_5102:
	mov rdi,LB_5107
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4933
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
	jmp LB_5105
LB_5103:
	mov rdi,LB_5108
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
	call LB_4731
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5105
LB_5105:
	ret
LB_4663:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5111+8*rax]
LB_5111: dq LB_5109,LB_5110
LB_5109:
	mov rdi,LB_5113
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4731
	jmp LB_5112
LB_5110:
	mov rdi,LB_5114
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5112
LB_5112:
	ret
LB_4661:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5117+8*rax]
LB_5117: dq LB_5115,LB_5116
LB_5115:
	mov rdi,LB_5119
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5120
	jmp LB_5118
LB_5116:
	mov rdi,LB_5121
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4663
	jmp LB_5118
LB_5118:
	ret
LB_5120:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5124+8*rax]
LB_5124: dq LB_5122,LB_5123
LB_5122:
	mov rdi,LB_5126
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4661
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5120
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5125
LB_5123:
	mov rdi,LB_5127
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5125
LB_5125:
	ret
LB_4648:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5130+8*rax]
LB_5130: dq LB_5128,LB_5129
LB_5128:
	mov rdi,LB_5132
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4603
	jmp LB_5131
LB_5129:
	mov rdi,LB_5133
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5131
LB_5131:
	ret
LB_4647:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5136+8*rax]
LB_5136: dq LB_5134,LB_5135
LB_5134:
	mov rdi,LB_5138
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4686
	jmp LB_5137
LB_5135:
	mov rdi,LB_5139
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5080
	jmp LB_5137
LB_5137:
	ret
LB_4582:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5143+8*rax]
LB_5143: dq LB_5140,LB_5141,LB_5142
LB_5140:
	mov rdi,LB_5145
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4647
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4648
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4649
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5144
LB_5141:
	mov rdi,LB_5146
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4731
	jmp LB_5144
LB_5142:
	mov rdi,LB_5147
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4649
	jmp LB_5144
LB_5144:
	ret
LB_4580:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5150+8*rax]
LB_5150: dq LB_5148,LB_5149
LB_5148:
	mov rdi,LB_5152
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
	call LB_5153
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
	call LB_4580
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5151
LB_5149:
	mov rdi,LB_5154
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5151
LB_5151:
	ret
LB_5153:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5157+8*rax]
LB_5157: dq LB_5155,LB_5156
LB_5155:
	mov rdi,LB_5159
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5160
	jmp LB_5158
LB_5156:
	mov rdi,LB_5161
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5162
	jmp LB_5158
LB_5158:
	ret
LB_5162:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5165+8*rax]
LB_5165: dq LB_5163,LB_5164
LB_5163:
	mov rdi,LB_5167
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5074
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4647
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4649
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5168
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_5169
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_5170
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*6]
	call LB_5162
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5166
LB_5164:
	mov rdi,LB_5171
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5074
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4647
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4649
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5168
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_5169
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_5170
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5166
LB_5166:
	ret
LB_5170:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5174+8*rax]
LB_5174: dq LB_5172,LB_5173
LB_5172:
	mov rdi,LB_5176
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4647
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5162
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5175
LB_5173:
	mov rdi,LB_5177
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5175
LB_5175:
	ret
LB_5169:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5181+8*rax]
LB_5181: dq LB_5178,LB_5179,LB_5180
LB_5178:
	mov rdi,LB_5183
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5184
	jmp LB_5182
LB_5179:
	mov rdi,LB_5185
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5186
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5169
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5182
LB_5180:
	mov rdi,LB_5187
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5182
LB_5182:
	ret
LB_5186:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5190+8*rax]
LB_5190: dq LB_5188,LB_5189
LB_5188:
	mov rdi,LB_5192
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5193
	jmp LB_5191
LB_5189:
	mov rdi,LB_5194
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5193
	jmp LB_5191
LB_5191:
	ret
LB_5193:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5197+8*rax]
LB_5197: dq LB_5195,LB_5196
LB_5195:
	mov rdi,LB_5199
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4616
	jmp LB_5198
LB_5196:
	mov rdi,LB_5200
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5198
LB_5198:
	ret
LB_5184:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5203+8*rax]
LB_5203: dq LB_5201,LB_5202
LB_5201:
	mov rdi,LB_5205
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5186
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
	jmp LB_5204
LB_5202:
	mov rdi,LB_5206
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5204
LB_5204:
	ret
LB_5168:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5210+8*rax]
LB_5210: dq LB_5207,LB_5208,LB_5209
LB_5207:
	mov rdi,LB_5212
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5211
LB_5208:
	mov rdi,LB_5213
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5211
LB_5209:
	mov rdi,LB_5214
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5211
LB_5211:
	ret
LB_5160:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5217+8*rax]
LB_5217: dq LB_5215,LB_5216
LB_5215:
	mov rdi,LB_5219
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5042
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5168
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5169
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5220
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_5160
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5218
LB_5216:
	mov rdi,LB_5221
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5042
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5168
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5169
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5220
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5218
LB_5218:
	ret
LB_5220:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5224+8*rax]
LB_5224: dq LB_5222,LB_5223
LB_5222:
	mov rdi,LB_5226
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5160
	jmp LB_5225
LB_5223:
	mov rdi,LB_5227
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5225
LB_5225:
	ret
LB_4578:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5230+8*rax]
LB_5230: dq LB_5228,LB_5229
LB_5228:
	mov rdi,LB_5232
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4553
	jmp LB_5231
LB_5229:
	mov rdi,LB_5233
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4616
	jmp LB_5231
LB_5231:
	ret
LB_4535: ;; #820 0'(= {| l |} ) ⊢ { } : (_s8→{ })
;; rsp=0 , %18440~0'(= {| l |} ) 
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
	lea rsi,[LB_4536+30-1]
	mov rcx,30
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %18441~1'(= {| l |} ) %18440~0'(= {| l |} ) 
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
;; rsp=0 , %18443~2'(= {| l |} ) %18441~1'(= {| l |} ) 
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
	jmp LB_4537
LB_4537:
;; rsp=0 , %18444~2'(= {| l |} ) %18441~1'(= {| l |} ) 
; #362 { 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) }
	sub rsp,8
	mov QWORD [rsp+0],r14
; .mov_ptn2 { 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; {| 1110000010.. |}
	mov r14,0
	mov r13,r8
; mov_ptn2.
	call ETR_362
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
;; rsp=0 , %18447~2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) %18446~3'(= r ) %18441~1'(= {| l |} ) 
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
	jmp LB_4538
LB_4538:
; .dlt.ptn 3'(= r )
	mov rdi,r9
	C_PUSH_REGS
	mov r8,rdi
	C_POP_REGS
;; rsp=0 , %18447~2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) %18441~1'(= {| l |} ) 
; #10 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) ⊢ 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_4539
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4540
LB_4540:
;; rsp=0 , %18449~2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) %18441~1'(= {| l |} ) 
;; ? 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) ⊢ 0(<2)◂0'(= a47◂ [ a2◂ [ a42◂ [ ]]] )
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_5235
	jmp LB_5236
LB_5235:
	jmp LB_5234
LB_5236:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r13,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %18450~0'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) %18441~1'(= {| l |} ) 
;; ? 0'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_5238
	jmp LB_5239
LB_5238:
	jmp LB_5237
LB_5239:
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %18452~2'(= a2◂ [ a42◂ [ ]] ) %18441~1'(= {| l |} ) 
; #10 %[ "D1" ] ⊢ %[ "D1" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_5240
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5241
LB_5241:
; .dlt.ptn %[ "D1" ]
;; rsp=0 , %18452~2'(= a2◂ [ a42◂ [ ]] ) %18441~1'(= {| l |} ) 
; #10 2'(= a2◂ [ a42◂ [ ]] ) ⊢ 2'(= a2◂ [ a42◂ [ ]] )
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_4553
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5242
LB_5242:
;; rsp=0 , %18454~2'(= a2◂ [ a42◂ [ ]] ) %18441~1'(= {| l |} ) 
; ∎ { }
; .dlt.ptn 2'(= a2◂ [ a42◂ [ ]] )
	mov rdi,r8
	C_PUSH_REGS
	mov r8,rdi
	call LB_3145
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
LB_5237:
;; ?. 0'(= a47◂ [ a2◂ [ a42◂ [ ]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov QWORD [GBG_VCT+8*0],rdi
	mov r8,QWORD [rdi+8]
	mov rdi,QWORD [GBG_VCT+8*0]
	FREE_LN rdi
;; rsp=0 , %18451~2'(= a2◂ [ *{ rr{| l |}}] ) %18441~1'(= {| l |} ) 
	mov rdi,LB_5243
	call emt_stg 
	jmp err
LB_5234:
;; ?. 2'(= a3◂ [ a47◂ [ a2◂ [ a42◂ [ ]]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %18441~1'(= {| l |} ) 
	mov rdi,LB_5244
	call emt_stg 
	jmp err
RTM_1:
;; rsp=0 , %18455~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
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
	lea rsi,[LB_4529+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %18456~2'(= {| l |} ) %18455~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
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
LB_4530:
	cmp rsi,rax 
	jz LB_4531
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
	jmp LB_4530
LB_4531:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4532
LB_4532:
;; rsp=0 , %18457~0'(= {| {| l |}|} ) %18456~2'(= {| l |} ) %18455~1'(= {| l |} ) 
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
LB_4533:
	cmp rsi,rax 
	jz LB_4534
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
	jmp LB_4533
LB_4534:
	C_POP_REGS
;; rsp=0 , %18460~4'(= {| l |} ) %18456~2'(= {| l |} ) %18455~1'(= {| l |} ) 
; #820 4'(= {| l |} ) ⊢ { }
	sub rsp,16
	mov QWORD [rsp+0],r14
	mov QWORD [rsp+8],r8
; .mov_ptn2 4'(= {| l |} ) ⊢ 0'(= {| l |} )
; {| 10001000110.. |}
	mov r13,r10
; mov_ptn2.
	call LB_4535
	mov r8,QWORD [rsp-8+8*2]
	mov r14,QWORD [rsp-8+8*1]
; .add_rsp 2
	add rsp,16
; .dlt.ptn { }
;; rsp=0 , %18456~2'(= {| l |} ) %18455~1'(= {| l |} ) 
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
