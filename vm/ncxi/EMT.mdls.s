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

%macro JZ_SPC 2
	movzx rax,%1
	cmp rax,9 
	jz %2
	cmp rax,10 
	jz %2
	cmp rax,32 
	jz %2
%endmacro
 
%macro JZ_LINE_SPC 2
	movzx rax,%1 
	cmp rax,9 
	jz %2
	cmp rax,32 
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

%macro ALC_RCD 1 
	mov rax,[SS_RCD_%1_TOP]
	mov rsi,[rax]
	mov QWORD [SS_RCD_%1_TOP],rsi
%endmacro 

%macro MOV_RAX 2 
	mov rax,%2 
	mov %1,rax
	%endmacro

%macro MOV_RDI 2 
	mov rdi,%2 
	mov %1,rdi
	%endmacro

%macro BSS_SS_RCD 2 
	SS_RCD_%1_TOP: resq 1 
	SS_RCD_%1_VCT: resq (%1+1)*%2
	Ss_RCD_%1_BTM: resq 1 
%endmacro 

%define SS_MAX 2000
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX 2048
%define SS_LN_REG r15
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

	BSS_SS_RCD 1, SS_MAX
	BSS_SS_RCD 2, SS_MAX
	BSS_SS_RCD 3, SS_MAX
	BSS_SS_RCD 4, SS_MAX
	BSS_SS_RCD 5, SS_MAX
	BSS_SS_RCD 6, SS_MAX
	BSS_SS_RCD 7, SS_MAX
	BSS_SS_RCD 8, SS_MAX
	BSS_SS_RCD 9, SS_MAX
	BSS_SS_RCD 10, SS_MAX
	BSS_SS_RCD 11, SS_MAX
	BSS_SS_RCD 12, SS_MAX
	BSS_SS_RCD 13, SS_MAX
	BSS_SS_RCD 14, SS_MAX
	BSS_SS_RCD 15, SS_MAX
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

LB_96: db 34,101,115,99,95,115,116,103,95,108,116,114,34,0
LB_98: db 59,32,226,136,142,124,10,101,120,110,32,54,52,49,49,58,10,0
LB_308: db 95,0
LB_317: db 46,0
LB_319: db 114,0
LB_320: db 34,0
LB_321: db 34,0
LB_324: db 125,0
LB_325: db 123,32,0
LB_327: db 32,93,32,0
LB_328: db 37,91,32,0
LB_330: db 32,0
LB_333: db 125,0
LB_334: db 123,32,0
LB_338: db 32,0
LB_379: db 125,0
LB_380: db 123,32,0
LB_382: db 32,93,32,0
LB_383: db 37,91,32,0
LB_385: db 226,151,130,0
LB_387: db 37,0
LB_390: db 32,0
LB_393: db 32,226,138,162,124,10,0
LB_394: db 32,0
LB_395: db 9,0
LB_399: db 32,226,138,162,124,10,0
LB_400: db 44,0
LB_401: db 226,151,130,0
LB_402: db 9,0
LB_409: db 10,0
LB_410: db 32,226,138,162,32,0
LB_411: db 36,32,0
LB_412: db 9,0
LB_415: db 32,226,138,162,10,0
LB_416: db 36,32,0
LB_417: db 9,0
LB_421: db 226,136,142,32,46,46,10,0
LB_422: db 9,0
LB_425: db 226,136,142,124,10,0
LB_426: db 9,0
LB_430: db 10,0
LB_431: db 32,226,138,162,32,0
LB_432: db 32,0
LB_433: db 9,0
LB_437: db 10,0
LB_438: db 32,226,138,162,32,0
LB_439: db 44,0
LB_440: db 226,151,130,32,0
LB_441: db 9,0
LB_445: db 10,0
LB_446: db 32,226,138,162,32,0
LB_447: db 32,0
LB_448: db 194,187,32,0
LB_449: db 9,0
LB_452: db 194,187,32,95,94,32,46,46,32,226,138,162,32,46,46,10,32,46,46,32,47,47,10,0
LB_453: db 9,0
LB_458: db 226,136,144,32,46,46,32,59,10,0
LB_459: db 9,0
LB_463: db 226,138,162,32,10,0
LB_464: db 226,136,144,32,46,46,32,59,32,0
LB_465: db 9,0
LB_468: db 226,136,144,32,46,46,32,46,10,0
LB_469: db 9,0
LB_473: db 226,136,144,46,32,46,46,32,46,10,0
LB_474: db 9,0
LB_478: db 226,138,162,32,10,0
LB_479: db 226,136,144,32,46,46,32,59,32,0
LB_480: db 9,0
LB_483: db 226,136,144,46,32,46,46,32,46,10,0
LB_484: db 9,0
LB_489: db 46,46,32,59,10,0
LB_490: db 226,136,144,32,0
LB_491: db 9,0
LB_495: db 226,138,162,32,10,0
LB_496: db 226,136,144,32,46,46,32,59,32,0
LB_497: db 9,0
LB_500: db 226,136,144,32,46,46,32,46,10,0
LB_501: db 9,0
LB_505: db 226,136,144,46,32,46,46,32,59,10,0
LB_506: db 9,0
LB_510: db 226,138,162,32,10,0
LB_511: db 226,136,144,32,46,46,32,59,32,0
LB_512: db 9,0
LB_515: db 226,136,144,46,32,46,46,32,46,10,0
LB_516: db 9,0
LB_520: db 10,0
LB_521: db 64,46,0
LB_522: db 9,0
LB_528: db 226,136,144,32,46,46,10,0
LB_529: db 9,0
LB_532: db 226,136,144,46,32,46,46,32,10,0
LB_533: db 9,0
LB_537: db 10,0
LB_538: db 226,136,144,32,46,46,32,226,138,162,32,0
LB_539: db 9,0
LB_542: db 10,0
LB_543: db 226,136,144,46,32,46,46,32,226,138,162,32,0
LB_544: db 9,0
LB_553: db 9,226,136,142,226,136,142,10,0
LB_554: db 9,0
LB_557: db 10,0
LB_558: db 194,167,194,167,32,0
LB_559: db 9,0
LB_562: db 10,0
LB_563: db 32,61,32,0
LB_564: db 194,167,194,167,32,0
LB_565: db 9,0
LB_569: db 194,167,194,167,43,115,56,10,0
LB_570: db 9,0
LB_574: db 194,167,32,0
LB_575: db 9,0
LB_579: db 194,167,32,10,0
LB_580: db 9,0
LB_585: db 10,0
LB_586: db 194,182,32,0
LB_587: db 9,0
LB_590: db 32,61,32,46,46,32,10,0
LB_591: db 194,182,32,0
LB_592: db 9,0
LB_595: db 194,182,10,0
LB_596: db 9,0
LB_601: db 10,0
LB_602: db 64,46,0
LB_603: db 9,0
LB_606: db 32,61,32,46,46,32,10,0
LB_607: db 64,46,0
LB_608: db 9,0
LB_613: db 10,0
LB_614: db 10,0
LB_615: db 32,61,32,0
LB_617: db 10,0
LB_618: db 32,58,32,0
LB_619: db 226,136,144,32,0
LB_620: db 9,0
LB_625: db 125,0
LB_626: db 123,32,0
LB_628: db 32,226,134,146,32,0
LB_630: db 226,151,130,0
LB_632: db 39,0
LB_634: db 32,0
LB_638: db 10,0
LB_639: db 32,58,32,0
LB_640: db 32,0
LB_641: db 10,0
LB_642: db 32,0
LB_644: db 10,0
LB_645: db 32,61,32,0
LB_646: db 32,194,171,32,10,0
LB_649: db 10,0
LB_650: db 32,58,32,0
LB_651: db 32,0
LB_652: db 64,46,0
LB_653: db 9,0
LB_656: db 10,0
LB_657: db 32,0
LB_658: db 64,46,0
LB_659: db 9,0
LB_830: db 10,0
LB_831: db 58,0
LB_832: db 45,0
LB_833: db 112,114,115,95,101,114,114,32,0
LB_1604: db 59,32,226,136,142,124,10,101,120,110,32,51,52,49,55,48,58,10,0
LB_1608: db 58,10,0
LB_1609: db 45,0
LB_1610: db 110,108,115,95,101,114,114,32,0
LB_1612: db 59,32,226,136,142,124,10,101,120,110,32,51,52,51,49,57,58,10,0
LB_1659: db 59,32,226,136,142,124,10,101,120,110,32,51,52,55,50,57,58,10,0
LB_1762: db 34,108,105,110,101,95,114,101,115,95,99,32,48,34,0
LB_1764: db 59,32,226,136,142,124,10,101,120,110,32,51,53,53,56,55,58,10,0
LB_3365: db 34,102,105,108,101,32,101,110,100,34,0
LB_3371: db 34,102,105,108,101,32,101,110,100,32,110,108,34,0
LB_3812: db 34,100,116,95,101,116,114,32,48,34,0
LB_4179: db 34,108,99,95,101,116,114,95,98,111,100,121,32,48,34,0
LB_4564: db 34,103,114,109,95,101,116,114,95,97,99,116,95,97,99,116,32,48,34,0
LB_4567: db 59,32,226,136,142,124,10,101,120,110,32,53,55,55,48,55,58,10,0
LB_4596: db 34,103,114,109,95,101,116,114,95,97,99,116,95,97,99,116,32,49,34,0
LB_4599: db 59,32,226,136,142,124,10,101,120,110,32,53,55,57,55,54,58,10,0
LB_4902: db 120,121,48,0
LB_4910: db 39,48,226,151,130,0
LB_4912: db 39,49,226,151,130,0
LB_4917: db 39,48,226,151,130,0
LB_4919: db 39,49,226,151,130,0
LB_4925: db 39,48,226,151,130,0
LB_4927: db 39,49,226,151,130,0
LB_4932: db 39,48,226,151,130,0
LB_4933: db 39,49,226,151,130,0
LB_4938: db 39,48,226,151,130,0
LB_4939: db 39,49,226,151,130,0
LB_4941: db 34,68,48,34,0
LB_4944: db 59,32,226,136,142,124,10,101,120,110,32,54,48,56,53,52,58,10,0
LB_4946: db 194,167,194,167,32,77,48,10,9,226,136,142,226,136,142,32,10,0
LB_4948: db 9,226,136,142,32,120,32,10,0
LB_4955: db 39,48,226,151,130,0
LB_4957: db 39,49,226,151,130,0
LB_4962: db 39,48,226,151,130,0
LB_4964: db 39,49,226,151,130,0
LB_4970: db 39,48,226,151,130,0
LB_4971: db 39,49,226,151,130,0
LB_4981: db 39,48,226,151,130,0
LB_4984: db 39,49,226,151,130,0
LB_4986: db 39,50,226,151,130,0
LB_4988: db 39,51,226,151,130,0
LB_4990: db 39,52,226,151,130,0
LB_4992: db 39,53,226,151,130,0
LB_4993: db 39,54,226,151,130,0
LB_4998: db 39,48,226,151,130,0
LB_5000: db 39,49,226,151,130,0
LB_5005: db 39,48,226,151,130,0
LB_5009: db 39,49,226,151,130,0
LB_5015: db 39,48,226,151,130,0
LB_5016: db 39,49,226,151,130,0
LB_5017: db 39,50,226,151,130,0
LB_5022: db 39,48,226,151,130,0
LB_5024: db 39,49,226,151,130,0
LB_5030: db 39,48,226,151,130,0
LB_5031: db 39,49,226,151,130,0
LB_5033: db 39,50,226,151,130,0
LB_5038: db 39,48,226,151,130,0
LB_5040: db 39,49,226,151,130,0
LB_5045: db 39,48,226,151,130,0
LB_5047: db 39,49,226,151,130,0
LB_5052: db 39,48,226,151,130,0
LB_5053: db 39,49,226,151,130,0
LB_5058: db 39,48,226,151,130,0
LB_5060: db 39,49,226,151,130,0
LB_5068: db 39,48,226,151,130,0
LB_5069: db 39,49,226,151,130,0
LB_5070: db 39,50,226,151,130,0
LB_5071: db 39,51,226,151,130,0
LB_5076: db 39,48,226,151,130,0
LB_5077: db 39,49,226,151,130,0
LB_5082: db 39,48,226,151,130,0
LB_5083: db 39,49,226,151,130,0
LB_5090: db 39,48,226,151,130,0
LB_5091: db 39,49,226,151,130,0
LB_5092: db 39,50,226,151,130,0
LB_5093: db 39,51,226,151,130,0
LB_5101: db 39,48,226,151,130,0
LB_5102: db 39,49,226,151,130,0
LB_5107: db 39,48,226,151,130,0
LB_5108: db 39,49,226,151,130,0
LB_5113: db 39,48,226,151,130,0
LB_5115: db 39,49,226,151,130,0
LB_5122: db 39,48,226,151,130,0
LB_5123: db 39,49,226,151,130,0
LB_5124: db 39,50,226,151,130,0
LB_5126: db 39,51,226,151,130,0
LB_5133: db 39,48,226,151,130,0
LB_5134: db 39,49,226,151,130,0
LB_5135: db 39,50,226,151,130,0
LB_5136: db 39,51,226,151,130,0
LB_5141: db 39,48,226,151,130,0
LB_5142: db 39,49,226,151,130,0
LB_5147: db 39,48,226,151,130,0
LB_5149: db 39,49,226,151,130,0
LB_5154: db 39,48,226,151,130,0
LB_5155: db 39,49,226,151,130,0
LB_5160: db 39,48,226,151,130,0
LB_5161: db 39,49,226,151,130,0
LB_5166: db 194,167,194,167,32,77,48,10,9,226,136,142,226,136,142,32,10,0
LB_5168: db 99,115,116,50,52,46,109,100,108,115,0
LB_5176: db 39,48,226,151,130,0
LB_5178: db 39,49,226,151,130,0
LB_5183: db 39,48,226,151,130,0
LB_5185: db 39,49,226,151,130,0
LB_5190: db 39,48,226,151,130,0
LB_5192: db 39,49,226,151,130,0
LB_5201: db 39,48,226,151,130,0
LB_5203: db 39,49,226,151,130,0
LB_5205: db 39,50,226,151,130,0
LB_5207: db 39,51,226,151,130,0
LB_5209: db 39,52,226,151,130,0
LB_5211: db 39,53,226,151,130,0
LB_5217: db 39,48,226,151,130,0
LB_5218: db 39,49,226,151,130,0
LB_5223: db 39,48,226,151,130,0
LB_5226: db 39,49,226,151,130,0
LB_5235: db 39,48,226,151,130,0
LB_5237: db 39,49,226,151,130,0
LB_5238: db 39,50,226,151,130,0
LB_5239: db 39,51,226,151,130,0
LB_5240: db 39,52,226,151,130,0
LB_5245: db 39,48,226,151,130,0
LB_5246: db 39,49,226,151,130,0
LB_5251: db 39,48,226,151,130,0
LB_5252: db 39,49,226,151,130,0
LB_5257: db 39,48,226,151,130,0
LB_5258: db 39,49,226,151,130,0
LB_5263: db 39,48,226,151,130,0
LB_5265: db 39,49,226,151,130,0
LB_5270: db 39,48,226,151,130,0
LB_5271: db 39,49,226,151,130,0
LB_5277: db 39,48,226,151,130,0
LB_5278: db 39,49,226,151,130,0
LB_5279: db 39,50,226,151,130,0
LB_5284: db 39,48,226,151,130,0
LB_5286: db 39,49,226,151,130,0
LB_5291: db 39,48,226,151,130,0
LB_5293: db 39,49,226,151,130,0
LB_5299: db 39,48,226,151,130,0
LB_5303: db 39,49,226,151,130,0
LB_5308: db 39,48,226,151,130,0
LB_5309: db 39,49,226,151,130,0
LB_5315: db 39,48,226,151,130,0
LB_5317: db 39,49,226,151,130,0
LB_5319: db 39,50,226,151,130,0
LB_5324: db 39,48,226,151,130,0
LB_5326: db 39,49,226,151,130,0
LB_5331: db 39,48,226,151,130,0
LB_5332: db 39,49,226,151,130,0
LB_5337: db 39,48,226,151,130,0
LB_5338: db 39,49,226,151,130,0
LB_5344: db 39,48,226,151,130,0
LB_5345: db 39,49,226,151,130,0
LB_5346: db 39,50,226,151,130,0
LB_5351: db 39,48,226,151,130,0
LB_5353: db 39,49,226,151,130,0
LB_5358: db 39,48,226,151,130,0
LB_5359: db 39,49,226,151,130,0
LB_5364: db 39,48,226,151,130,0
LB_5365: db 39,49,226,151,130,0
LB_5368: db 34,68,48,34,0
LB_5373: db 59,32,226,136,142,124,10,101,120,110,32,54,48,53,52,56,58,10,0
LB_5374: db 59,32,226,136,142,124,10,101,120,110,32,54,48,53,55,53,58,10,0
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
	xor rax,rax 
	mov rdi,EMT_BUF 
	C_CALL printf 
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
	mov r15,SS_LN_VCT 
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
ETR_35: ;; of_s8 0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] ) : (_s8→_t5)
;; rsp=0 , %4~0'(= {| l |} ) 
; #33 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %5~1(<4)◂0'(= {| l |} ) 
; ∎ 1(<4)◂0'(= {| l |} )
; .mov_ptn2 1(<4)◂0'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 1(<4)◂1'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov BYTE [rax+6],1
	mov r13,rax
	ret
ETR_36: ;; len 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) } : (_t5→{ _t5 _r64 })
;; rsp=0 , %6~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<4)◂{ 1'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_0
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r13+16]
	mov r9, QWORD [r13+24]
;; rsp=0 , %11~3'(= a5◂ [ ] ) %10~2'(= r ) %9~1'(= a5◂ [ ] ) 
	jmp LB_1
LB_1:
; $ 2'(= r ) ⊢ 2'(= r ),0'(= r )
	mov rdi,r8
	mov rax,rdi
	mov r13,rax
;; rsp=0 , %13~0'(= r ) %12~2'(= r ) %11~3'(= a5◂ [ ] ) %9~1'(= a5◂ [ ] ) 
; #34 { 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %14~0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } %12~2'(= r ) 
; ∎ { 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 1'(= a5◂ [ ] ) 0'(= r ) 3'(= a5◂ [ ] ) } 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r10,r13
; .mov_ptn 0(<4)◂{ 1'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
	mov r11,rax
	mov rax,r14
	mov QWORD [r11+8+8*0],rax
	mov rax,r10
	mov QWORD [r11+8+8*1],rax
	mov rax,r9
	mov QWORD [r11+8+8*2],rax
	mov rax,r11
	mov BYTE [rax+6],0
	mov r13,rax
; .mov_ptn 2'(= r ) ⊢ 1'(= r )
	mov rax,r8
	mov r14,rax
	ret
LB_0:
;; ? 0'(= a5◂ [ ] ) ⊢ 3(<4)◂1'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_2
	mov r14,QWORD [rdi+8]
;; rsp=0 , %8~1'(= r ) 
	jmp LB_3
LB_3:
; $ %[ 1r ] ⊢ %[ 1r ]
;; rsp=0 , %15~%[ 1r ] %8~1'(= r ) 
; #31 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %16~3(<4)◂1'(= r ) %15~%[ 1r ] 
; ∎ { 3(<4)◂1'(= r ) %[ 1r ] }
; .mov_ptn2 { 3(<4)◂1'(= r ) %[ 1r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn 3(<4)◂1'(= r ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov r13,rax
; .mov_ptn %[ 1r ] ⊢ 1'(= r )
	mov rax,1
	mov r14,rax
	ret
LB_2:
;; ? 0'(= a5◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_4
;; rsp=0 , 
; #32 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %17~2(<4)◂{ } 
	jmp LB_5
LB_5:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %18~%[ 0r ] %17~2(<4)◂{ } 
; ∎ { 2(<4)◂{ } %[ 0r ] }
; .mov_ptn2 { 2(<4)◂{ } %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn 2(<4)◂{ } ⊢ 0'(= a5◂ [ ] )
	mov rax,unt 
	mov rax,unt_2
	mov r13,rax
	ret
LB_4:
;; ?. 0'(= a5◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %7~0'(= {| l |} ) 
; #9 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 1'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi] 
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi 
	mov r14,rdi
;; rsp=0 , %20~1'(= r ) %19~0'(= {| l |} ) 
; #33 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %21~1(<4)◂0'(= {| l |} ) %20~1'(= r ) 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
	mov r8,r13
; .mov_ptn 1(<4)◂2'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r8
	mov BYTE [rax+6],1
	mov r13,rax
	ret
ETR_37: ;; add_s8 { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _s8 }→_t5)
;; rsp=0 , %23~1'(= {| l |} ) %22~0'(= a5◂ [ ] ) 
; #9 1'(= {| l |} ) ⊢ { 1'(= {| l |} ) 2'(= r ) }
	mov rdi,r14
	mov rdi,QWORD [rdi] 
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi 
	mov r8,rdi
;; rsp=0 , %25~2'(= r ) %24~1'(= {| l |} ) %22~0'(= a5◂ [ ] ) 
; #36 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 3'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_36
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %27~3'(= r ) %26~0'(= a5◂ [ ] ) %25~2'(= r ) %24~1'(= {| l |} ) 
; #13 { 2'(= r ) 3'(= r ) } ⊢ { 2'(= r ) 3'(= r ) }
	add r8,r9
;; rsp=0 , %29~3'(= r ) %28~2'(= r ) %26~0'(= a5◂ [ ] ) %24~1'(= {| l |} ) 
; #33 1'(= {| l |} ) ⊢ 1(<4)◂1'(= {| l |} )
;; rsp=0 , %30~1(<4)◂1'(= {| l |} ) %29~3'(= r ) %28~2'(= r ) %26~0'(= a5◂ [ ] ) 
; #34 { 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
;; rsp=0 , %31~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } %29~3'(= r ) 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) }
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3'(= a5◂ [ ] ) 2'(= r ) 1(<4)◂1'(= {| l |} ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
	mov r10,rax
	mov rax,r9
	mov QWORD [r10+8+8*0],rax
	mov rax,r8
	mov QWORD [r10+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_38: ;; pfx_s8 { 0'(= {| l |} ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _s8 _t5 }→_t5)
;; rsp=0 , %33~1'(= a5◂ [ ] ) %32~0'(= {| l |} ) 
; #9 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 2'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi] 
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi 
	mov r8,rdi
;; rsp=0 , %35~2'(= r ) %34~0'(= {| l |} ) %33~1'(= a5◂ [ ] ) 
; #36 1'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 1'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_36
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %37~1'(= r ) %36~3'(= a5◂ [ ] ) %35~2'(= r ) %34~0'(= {| l |} ) 
; #13 { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %39~1'(= r ) %38~2'(= r ) %36~3'(= a5◂ [ ] ) %34~0'(= {| l |} ) 
; #33 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %40~1(<4)◂0'(= {| l |} ) %39~1'(= r ) %38~2'(= r ) %36~3'(= a5◂ [ ] ) 
; #34 { 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %41~0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } %39~1'(= r ) 
; ∎ 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) }
; .mov_ptn2 0(<4)◂{ 1(<4)◂0'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 0(<4)◂{ 1(<4)◂1'(= {| l |} ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
	mov r10,rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov QWORD [r10+8+8*0],rax
	mov rax,r8
	mov QWORD [r10+8+8*1],rax
	mov rax,r9
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_39: ;; add_chr { 0'(= a5◂ [ ] ) 1'(= r ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _r64 }→_t5)
;; rsp=0 , %43~1'(= r ) %42~0'(= a5◂ [ ] ) 
; #36 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_36
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %45~2'(= r ) %44~0'(= a5◂ [ ] ) %43~1'(= r ) 
; #11 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %46~2'(= r ) %44~0'(= a5◂ [ ] ) %43~1'(= r ) 
; #31 1'(= r ) ⊢ 3(<4)◂1'(= r )
;; rsp=0 , %47~3(<4)◂1'(= r ) %46~2'(= r ) %44~0'(= a5◂ [ ] ) 
; #34 { 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) }
;; rsp=0 , %48~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) }
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3'(= a5◂ [ ] ) 2'(= r ) 3(<4)◂1'(= r ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
	mov r10,rax
	mov rax,r9
	mov QWORD [r10+8+8*0],rax
	mov rax,r8
	mov QWORD [r10+8+8*1],rax
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_40: ;; pfx_chr { 0'(= r ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _r64 _t5 }→_t5)
;; rsp=0 , %50~1'(= a5◂ [ ] ) %49~0'(= r ) 
; #36 1'(= a5◂ [ ] ) ⊢ { 2'(= a5◂ [ ] ) 1'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_36
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %52~1'(= r ) %51~2'(= a5◂ [ ] ) %49~0'(= r ) 
; #11 1'(= r ) ⊢ 1'(= r )
	add r14,1
;; rsp=0 , %53~1'(= r ) %51~2'(= a5◂ [ ] ) %49~0'(= r ) 
; #31 0'(= r ) ⊢ 3(<4)◂0'(= r )
;; rsp=0 , %54~3(<4)◂0'(= r ) %53~1'(= r ) %51~2'(= a5◂ [ ] ) 
; #34 { 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) }
;; rsp=0 , %55~0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } 
; ∎ 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) }
; .mov_ptn2 0(<4)◂{ 3(<4)◂0'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r9,r13
; .mov_ptn 0(<4)◂{ 3(<4)◂3'(= r ) 1'(= r ) 2'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
	mov r10,rax
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
	mov rax,r8
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_41: ;; cct { 0'(= a5◂ [ ] ) 1'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] ) : ({ _t5 _t5 }→_t5)
;; rsp=0 , %57~1'(= a5◂ [ ] ) %56~0'(= a5◂ [ ] ) 
; #36 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_36
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %59~2'(= r ) %58~0'(= a5◂ [ ] ) %57~1'(= a5◂ [ ] ) 
; #36 1'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 1'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 1'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_36
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %61~1'(= r ) %60~3'(= a5◂ [ ] ) %59~2'(= r ) %58~0'(= a5◂ [ ] ) 
; #13 { 2'(= r ) 1'(= r ) } ⊢ { 2'(= r ) 1'(= r ) }
	add r8,r14
;; rsp=0 , %63~1'(= r ) %62~2'(= r ) %60~3'(= a5◂ [ ] ) %58~0'(= a5◂ [ ] ) 
; #34 { 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %64~0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } %63~1'(= r ) 
; ∎ 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) }
; .mov_ptn2 0(<4)◂{ 0'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	mov r14,r13
; .mov_ptn 0(<4)◂{ 1'(= a5◂ [ ] ) 2'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
	mov r10,rax
	mov rax,r14
	mov QWORD [r10+8+8*0],rax
	mov rax,r8
	mov QWORD [r10+8+8*1],rax
	mov rax,r9
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_42: ;; mk_s8_i { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } : ({ _t5 _s8 _r64 }→{ _t5 _s8 _r64 })
;; rsp=0 , %67~2'(= r ) %66~1'(= {| l |} ) %65~0'(= a5◂ [ ] ) 
;; ? 0'(= a5◂ [ ] ) ⊢ 0(<4)◂{ 3'(= a5◂ [ ] ) 4'(= r ) 5'(= a5◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_6
	mov r9, QWORD [r13+8]
	mov r10, QWORD [r13+16]
	mov r11, QWORD [r13+24]
;; rsp=0 , %72~5'(= a5◂ [ ] ) %71~4'(= r ) %70~3'(= a5◂ [ ] ) %67~2'(= r ) %66~1'(= {| l |} ) 
; #42 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r10
	mov QWORD [rsp+8*1],r11
; .mov_ptn2 { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov r13,rax
	call ETR_42
	mov r11,QWORD [rsp-8+8*2]
	mov r10,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %75~2'(= r ) %74~1'(= {| l |} ) %73~0'(= a5◂ [ ] ) %72~5'(= a5◂ [ ] ) %71~4'(= r ) 
; #42 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 5'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 5'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r11
	mov r13,rax
	call ETR_42
	mov r10,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %78~2'(= r ) %77~1'(= {| l |} ) %76~3'(= a5◂ [ ] ) %73~0'(= a5◂ [ ] ) %71~4'(= r ) 
; #34 { 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) }
;; rsp=0 , %79~0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } %78~2'(= r ) %77~1'(= {| l |} ) 
; ∎ { 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 0(<4)◂{ 0'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r11,r13
; .mov_ptn 0(<4)◂{ 5'(= a5◂ [ ] ) 4'(= r ) 3'(= a5◂ [ ] ) } ⊢ 0'(= a5◂ [ ] )
	ALC_RCD 3
	mov rcx,rax
	mov rax,r11
	mov QWORD [rcx+8+8*0],rax
	mov rax,r10
	mov QWORD [rcx+8+8*1],rax
	mov rax,r9
	mov QWORD [rcx+8+8*2],rax
	mov rax,rcx
	mov BYTE [rax+6],0
	mov r13,rax
	ret
LB_6:
;; ? 0'(= a5◂ [ ] ) ⊢ 2(<4)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_7
;; rsp=0 , %67~2'(= r ) %66~1'(= {| l |} ) 
; #32 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %80~2(<4)◂{ } %67~2'(= r ) %66~1'(= {| l |} ) 
; ∎ { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 2(<4)◂{ } 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 2(<4)◂{ } ⊢ 0'(= a5◂ [ ] )
	mov rax,unt 
	mov rax,unt_2
	mov r13,rax
	ret
LB_7:
;; ? 0'(= a5◂ [ ] ) ⊢ 3(<4)◂3'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_8
	mov r9,QWORD [rdi+8]
;; rsp=0 , %69~3'(= r ) %67~2'(= r ) %66~1'(= {| l |} ) 
; #16 { 1'(= {| l |} ) 2'(= r ) 3'(= r ) } ⊢ { 1'(= {| l |} ) 2'(= r ) 3'(= r ) }
; _sts { 1'(= {| l |} ) 2'(= r ) 3'(= r ) } ⊢ { 1'(= {| l |} ) 2'(= r ) 3'(= r ) }
	mov rax,r14
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rax]
	cmp rdi,r8
	jle err
	mov rsi,r8
	mov rdi,r9
	mov BYTE [rax+8+rsi],dil
;; rsp=0 , %83~3'(= r ) %82~2'(= r ) %81~1'(= {| l |} ) 
; #11 2'(= r ) ⊢ 2'(= r )
	add r8,1
;; rsp=0 , %84~2'(= r ) %83~3'(= r ) %81~1'(= {| l |} ) 
; #31 3'(= r ) ⊢ 3(<4)◂3'(= r )
;; rsp=0 , %85~3(<4)◂3'(= r ) %84~2'(= r ) %81~1'(= {| l |} ) 
; ∎ { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 3(<4)◂3'(= r ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn 3(<4)◂3'(= r ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_8:
;; ?. 0'(= a5◂ [ ] ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %68~0'(= {| l |} ) %67~2'(= r ) %66~1'(= {| l |} ) 
; #9 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 3'(= r ) }
	mov rdi,r13
	mov rdi,QWORD [rdi] 
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi 
	mov r9,rdi
;; rsp=0 , %87~3'(= r ) %86~0'(= {| l |} ) %67~2'(= r ) %66~1'(= {| l |} ) 
	jmp LB_9
LB_9:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %88~%[ 0r ] %87~3'(= r ) %86~0'(= {| l |} ) %67~2'(= r ) %66~1'(= {| l |} ) 
; #19 { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) }
; _rep_movsb { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) } ⊢ { 3'(= r ) 0'(= {| l |} ) %[ 0r ] 1'(= {| l |} ) 2'(= r ) }
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
;; rsp=0 , %93~2'(= r ) %92~1'(= {| l |} ) %91~%[ 0r ] %90~0'(= {| l |} ) %89~3'(= r ) 
; #33 0'(= {| l |} ) ⊢ 1(<4)◂0'(= {| l |} )
;; rsp=0 , %94~1(<4)◂0'(= {| l |} ) %93~2'(= r ) %92~1'(= {| l |} ) %91~%[ 0r ] %89~3'(= r ) 
; ∎ { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) }
; .mov_ptn2 { 1(<4)◂0'(= {| l |} ) 1'(= {| l |} ) 2'(= r ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r13
; .mov_ptn 1(<4)◂3'(= {| l |} ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov BYTE [rax+6],1
	mov r13,rax
	ret
ETR_43: ;; mk_s8 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) } : (_t5→{ _t5 _s8 })
;; rsp=0 , %95~0'(= a5◂ [ ] ) 
; #36 0'(= a5◂ [ ] ) ⊢ { 0'(= a5◂ [ ] ) 1'(= r ) }
; .mov_ptn2 0'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	call ETR_36
;; rsp=0 , %97~1'(= r ) %96~0'(= a5◂ [ ] ) 
; #8 1'(= r ) ⊢ { 1'(= r ) 2'(= {| l |} ) }
	mov rdi,r14
	call mlc_s8
	mov r8,rax
;; rsp=0 , %99~2'(= {| l |} ) %98~1'(= r ) %96~0'(= a5◂ [ ] ) 
	jmp LB_10
LB_10:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %100~%[ 0r ] %99~2'(= {| l |} ) %98~1'(= r ) %96~0'(= a5◂ [ ] ) 
; #42 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) 2'(= r ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 { 0'(= a5◂ [ ] ) 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) 2'(= r ) }
	mov r9,r8
; .mov_ptn %[ 0r ] ⊢ 2'(= r )
	mov rax,0
	mov r8,rax
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	call ETR_42
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %103~2'(= r ) %102~3'(= {| l |} ) %101~0'(= a5◂ [ ] ) %98~1'(= r ) 
; ∎ { 0'(= a5◂ [ ] ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= a5◂ [ ] ) 3'(= {| l |} ) } ⊢ { 0'(= a5◂ [ ] ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
ETR_46: ;; and { 0'(= a6◂ [ ] ) 1'(= a6◂ [ ] ) } ⊢ 0'(= a6◂ [ ] ) : ({ _t6 _t6 }→_t6)
;; rsp=0 , %105~1'(= a6◂ [ ] ) %104~0'(= a6◂ [ ] ) 
;; ?; 0'(= a6◂ [ ] ) ⊢ 0(<2)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_11
;; ?; 1'(= a6◂ [ ] ) ⊢ 0(<2)◂{ }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_11
;; rsp=0 , 
; #45 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %106~0(<2)◂{ } 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 0(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
	mov rax,unt 
	mov rax,unt_0
	mov r13,rax
	ret
LB_11:
;; rsp=0 , %105~1'(= a6◂ [ ] ) %104~0'(= a6◂ [ ] ) 
; #44 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %107~1(<2)◂{ } %105~1'(= a6◂ [ ] ) %104~0'(= a6◂ [ ] ) 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
	mov rax,unt 
	mov rax,unt_1
	mov r13,rax
	ret
ETR_47: ;; or { 0'(= a6◂ [ ] ) 1'(= a6◂ [ ] ) } ⊢ 0'(= a6◂ [ ] ) : ({ _t6 _t6 }→_t6)
;; rsp=0 , %109~1'(= a6◂ [ ] ) %108~0'(= a6◂ [ ] ) 
;; ?; 0'(= a6◂ [ ] ) ⊢ 1(<2)◂{ }
	mov rdi,r13
	cmp BYTE [rdi+6],1
	jnz LB_12
;; ?; 1'(= a6◂ [ ] ) ⊢ 1(<2)◂{ }
	mov rdi,r14
	cmp BYTE [rdi+6],1
	jnz LB_12
;; rsp=0 , 
; #44 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %110~1(<2)◂{ } 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
	mov rax,unt 
	mov rax,unt_1
	mov r13,rax
	ret
LB_12:
;; rsp=0 , %109~1'(= a6◂ [ ] ) %108~0'(= a6◂ [ ] ) 
; #45 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %111~0(<2)◂{ } %109~1'(= a6◂ [ ] ) %108~0'(= a6◂ [ ] ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 0(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
	mov rax,unt 
	mov rax,unt_0
	mov r13,rax
	ret
ETR_48: ;; sub { 0'(= a6◂ [ ] ) 1'(= a6◂ [ ] ) } ⊢ 0'(= a6◂ [ ] ) : ({ _t6 _t6 }→_t6)
;; rsp=0 , %113~1'(= a6◂ [ ] ) %112~0'(= a6◂ [ ] ) 
;; ?; 1'(= a6◂ [ ] ) ⊢ 1(<2)◂{ }
	mov rdi,r14
	cmp BYTE [rdi+6],1
	jnz LB_13
;; rsp=0 , %112~0'(= a6◂ [ ] ) 
; ∎ 0'(= a6◂ [ ] )
; .mov_ptn2 0'(= a6◂ [ ] ) ⊢ 0'(= a6◂ [ ] )
	ret
LB_13:
;; ?; 1'(= a6◂ [ ] ) ⊢ 0(<2)◂{ }
;; rsp=0 , %112~0'(= a6◂ [ ] ) 
; #44 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %114~1(<2)◂{ } %112~0'(= a6◂ [ ] ) 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a6◂ [ ] )
	mov rax,unt 
	mov rax,unt_1
	mov r13,rax
	ret
ETR_54: ;; s8_of_r64_lst_i { 0'(= r ) 1'(= a2◂ [ r] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _lst◂_r64 }→{ _r64 _s8 })
;; rsp=0 , %131~1'(= a2◂ [ r] ) %130~0'(= r ) 
;; ?; 1'(= a2◂ [ r] ) ⊢ 0(<2)◂{ 2'(= r ) 3'(= a2◂ [ r] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_14
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %133~3'(= a2◂ [ r] ) %132~2'(= r ) %130~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %134~0'(= r ) %133~3'(= a2◂ [ r] ) %132~2'(= r ) 
; #54 { 0'(= r ) 3'(= a2◂ [ r] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 3'(= a2◂ [ r] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ r] ) }
; .mov_ptn 3'(= a2◂ [ r] ) ⊢ 1'(= a2◂ [ r] )
	mov rax,r9
	mov r14,rax
	call ETR_54
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %136~1'(= {| l |} ) %135~0'(= r ) %132~2'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %137~0'(= r ) %136~1'(= {| l |} ) %132~2'(= r ) 
; #16 { 1'(= {| l |} ) 0'(= r ) 2'(= r ) } ⊢ { 1'(= {| l |} ) 0'(= r ) 2'(= r ) }
; _sts { 1'(= {| l |} ) 0'(= r ) 2'(= r ) } ⊢ { 1'(= {| l |} ) 0'(= r ) 2'(= r ) }
	mov rax,r14
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rax]
	cmp rdi,r13
	jle err
	mov rsi,r13
	mov rdi,r8
	mov BYTE [rax+8+rsi],dil
;; rsp=0 , %140~2'(= r ) %139~0'(= r ) %138~1'(= {| l |} ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
LB_14:
;; ?; 1'(= a2◂ [ r] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %130~0'(= r ) 
; #8 0'(= r ) ⊢ { 0'(= r ) 1'(= {| l |} ) }
	mov rdi,r13
	call mlc_s8
	mov r14,rax
;; rsp=0 , %142~1'(= {| l |} ) %141~0'(= r ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
ETR_55: ;; s8_of_r64_lst 0'(= a2◂ [ r] ) ⊢ 0'(= {| l |} ) : (_lst◂_r64→_s8)
;; rsp=0 , %143~0'(= a2◂ [ r] ) 
	jmp LB_15
LB_15:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %144~%[ 0r ] %143~0'(= a2◂ [ r] ) 
; #54 { %[ 0r ] 0'(= a2◂ [ r] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { %[ 0r ] 0'(= a2◂ [ r] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ r] ) }
; .mov_ptn 0'(= a2◂ [ r] ) ⊢ 1'(= a2◂ [ r] )
	mov rax,r13
	mov r14,rax
; .mov_ptn %[ 0r ] ⊢ 0'(= r )
	mov rax,0
	mov r13,rax
	call ETR_54
;; rsp=0 , %146~1'(= {| l |} ) %145~0'(= r ) 
; ∎ 1'(= {| l |} )
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
ETR_56: ;; s8_of_s8_lst_i { 0'(= r ) 1'(= a2◂ [ {| l |}] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) } : ({ _r64 _lst◂_s8 }→{ _s8 _r64 })
;; rsp=0 , %148~1'(= a2◂ [ {| l |}] ) %147~0'(= r ) 
;; ? 1'(= a2◂ [ {| l |}] ) ⊢ 0(<2)◂{ 2'(= {| l |} ) 3'(= a2◂ [ {| l |}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_16
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %150~3'(= a2◂ [ {| l |}] ) %149~2'(= {| l |} ) %147~0'(= r ) 
; #9 2'(= {| l |} ) ⊢ { 2'(= {| l |} ) 1'(= r ) }
	mov rdi,r8
	mov rdi,QWORD [rdi] 
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi 
	mov r14,rdi
;; rsp=0 , %152~1'(= r ) %151~2'(= {| l |} ) %150~3'(= a2◂ [ {| l |}] ) %147~0'(= r ) 
; #13 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	add r13,r14
;; rsp=0 , %154~1'(= r ) %153~0'(= r ) %151~2'(= {| l |} ) %150~3'(= a2◂ [ {| l |}] ) 
; #56 { 0'(= r ) 3'(= a2◂ [ {| l |}] ) } ⊢ { 0'(= {| l |} ) 3'(= r ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 { 0'(= r ) 3'(= a2◂ [ {| l |}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ {| l |}] ) }
; .mov_ptn 3'(= a2◂ [ {| l |}] ) ⊢ 1'(= a2◂ [ {| l |}] )
	mov rax,r9
	mov r14,rax
	call ETR_56
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %156~3'(= r ) %155~0'(= {| l |} ) %154~1'(= r ) %151~2'(= {| l |} ) 
	jmp LB_17
LB_17:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %157~%[ 0r ] %156~3'(= r ) %155~0'(= {| l |} ) %154~1'(= r ) %151~2'(= {| l |} ) 
	jmp LB_18
LB_18:
; $ 1'(= r ) ⊢ 1'(= r ),4'(= r )
	mov rdi,r14
	mov rax,rdi
	mov r10,rax
;; rsp=0 , %159~4'(= r ) %158~1'(= r ) %157~%[ 0r ] %156~3'(= r ) %155~0'(= {| l |} ) %151~2'(= {| l |} ) 
; #19 { 1'(= r ) 2'(= {| l |} ) %[ 0r ] 0'(= {| l |} ) 3'(= r ) } ⊢ { 1'(= r ) 2'(= {| l |} ) %[ 0r ] 0'(= {| l |} ) 3'(= r ) }
; _rep_movsb { 1'(= r ) 2'(= {| l |} ) %[ 0r ] 0'(= {| l |} ) 3'(= r ) } ⊢ { 1'(= r ) 2'(= {| l |} ) %[ 0r ] 0'(= {| l |} ) 3'(= r ) }
	mov rax,r14
	mov rsi,r8
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rsi]
	sub rdi,rax
	lea rsi,[rsi+8]
	cmp rdi,0
	jl err
	lea rsi,[rsi+0]
	push rsi 
	mov rsi,r13
	mov rdi,0x0000_ffff_ffff_ffff
	and rdi,[rsi]
	sub rdi,rax
	lea rsi,[rsi+8]
	cmp rdi,r9
	jl err
	add rsi,r9
	mov rdi,rsi 
	pop rsi 
	push rcx 
	mov rcx,rax 
	cld 
	rep movsb
	pop rcx 
;; rsp=0 , %164~3'(= r ) %163~0'(= {| l |} ) %162~%[ 0r ] %161~2'(= {| l |} ) %160~1'(= r ) %159~4'(= r ) 
; ∎ { 0'(= {| l |} ) 3'(= r ) }
; .mov_ptn2 { 0'(= {| l |} ) 3'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn 3'(= r ) ⊢ 1'(= r )
	mov rax,r9
	mov r14,rax
	ret
LB_16:
;; ?. 1'(= a2◂ [ {| l |}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %147~0'(= r ) 
; #8 0'(= r ) ⊢ { 0'(= r ) 1'(= {| l |} ) }
	mov rdi,r13
	call mlc_s8
	mov r14,rax
;; rsp=0 , %166~1'(= {| l |} ) %165~0'(= r ) 
	jmp LB_19
LB_19:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %167~%[ 0r ] %166~1'(= {| l |} ) %165~0'(= r ) 
; ∎ { 1'(= {| l |} ) %[ 0r ] }
; .mov_ptn2 { 1'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
	ret
ETR_57: ;; s8_of_s8_lst 0'(= a2◂ [ {| l |}] ) ⊢ 0'(= {| l |} ) : (_lst◂_s8→_s8)
;; rsp=0 , %168~0'(= a2◂ [ {| l |}] ) 
	jmp LB_20
LB_20:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %169~%[ 0r ] %168~0'(= a2◂ [ {| l |}] ) 
; #56 { %[ 0r ] 0'(= a2◂ [ {| l |}] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn2 { %[ 0r ] 0'(= a2◂ [ {| l |}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ {| l |}] ) }
; .mov_ptn 0'(= a2◂ [ {| l |}] ) ⊢ 1'(= a2◂ [ {| l |}] )
	mov rax,r13
	mov r14,rax
; .mov_ptn %[ 0r ] ⊢ 0'(= r )
	mov rax,0
	mov r13,rax
	call ETR_56
;; rsp=0 , %171~1'(= r ) %170~0'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
ETR_65:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_65
	ret
GRM_65:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_24
	jmp LB_25
LB_24:
	mov r8,unt_1
	jmp LB_22
LB_25:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_26
	jmp LB_27
LB_26:
	mov r8,unt_1
	jmp LB_22
LB_27:
	add r14,1
	jmp LB_23
LB_22:
	add rsp,0
	jmp LB_21
LB_23:
	call GRM_65
	cmp BYTE [r8+6],0
	jnz LB_30
	jmp LB_31
LB_30:
	jmp LB_28
LB_31:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_29
LB_28:
	add rsp,0
	jmp LB_21
LB_29:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_32
LB_32
;; rsp=1 , %246~1'(= r ) %245~0'(= r ) %244~8'(= a5◂ [ ] ) 
	jmp LB_34
LB_34:
; $ %[ "\\n" ] ⊢ %[ "\\n" ]
;; rsp=1 , %247~%[ "\\n" ] %246~1'(= r ) %245~0'(= r ) %244~8'(= a5◂ [ ] ) 
; #38 { %[ "\\n" ] 8'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "\\n" ] 8'(= a5◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a5◂ [ ] ) }
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn %[ "\\n" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],110
	mov r13,rax
	call ETR_38
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %248~2'(= a5◂ [ ] ) %246~1'(= r ) %245~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %249~0(<2)◂2'(= a5◂ [ ] ) %246~1'(= r ) %245~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_33
LB_33:
	cmp BYTE [r8+6],0
	jnz LB_21
	POP_GRM_SCC
	ret
LB_21:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_38
	jmp LB_39
LB_38:
	mov r8,unt_1
	jmp LB_36
LB_39:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],9
	jnz LB_40
	jmp LB_41
LB_40:
	mov r8,unt_1
	jmp LB_36
LB_41:
	add r14,1
	jmp LB_37
LB_36:
	add rsp,0
	jmp LB_35
LB_37:
	call GRM_65
	cmp BYTE [r8+6],0
	jnz LB_44
	jmp LB_45
LB_44:
	jmp LB_42
LB_45:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_43
LB_42:
	add rsp,0
	jmp LB_35
LB_43:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_46
LB_46
;; rsp=1 , %252~1'(= r ) %251~0'(= r ) %250~8'(= a5◂ [ ] ) 
	jmp LB_48
LB_48:
; $ %[ "\\t" ] ⊢ %[ "\\t" ]
;; rsp=1 , %253~%[ "\\t" ] %252~1'(= r ) %251~0'(= r ) %250~8'(= a5◂ [ ] ) 
; #38 { %[ "\\t" ] 8'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "\\t" ] 8'(= a5◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a5◂ [ ] ) }
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn %[ "\\t" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],116
	mov r13,rax
	call ETR_38
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %254~2'(= a5◂ [ ] ) %252~1'(= r ) %251~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %255~0(<2)◂2'(= a5◂ [ ] ) %252~1'(= r ) %251~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_47
LB_47:
	cmp BYTE [r8+6],0
	jnz LB_35
	POP_GRM_SCC
	ret
LB_35:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_52
	jmp LB_53
LB_52:
	mov r8,unt_1
	jmp LB_50
LB_53:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_54
	jmp LB_55
LB_54:
	mov r8,unt_1
	jmp LB_50
LB_55:
	add r14,1
	jmp LB_51
LB_50:
	add rsp,0
	jmp LB_49
LB_51:
	call GRM_65
	cmp BYTE [r8+6],0
	jnz LB_58
	jmp LB_59
LB_58:
	jmp LB_56
LB_59:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_57
LB_56:
	add rsp,0
	jmp LB_49
LB_57:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_60
LB_60
;; rsp=1 , %258~1'(= r ) %257~0'(= r ) %256~8'(= a5◂ [ ] ) 
	jmp LB_62
LB_62:
; $ %[ "\\\\" ] ⊢ %[ "\\\\" ]
;; rsp=1 , %259~%[ "\\\\" ] %258~1'(= r ) %257~0'(= r ) %256~8'(= a5◂ [ ] ) 
; #38 { %[ "\\\\" ] 8'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "\\\\" ] 8'(= a5◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a5◂ [ ] ) }
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn %[ "\\\\" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],92
	mov r13,rax
	call ETR_38
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %260~2'(= a5◂ [ ] ) %258~1'(= r ) %257~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %261~0(<2)◂2'(= a5◂ [ ] ) %258~1'(= r ) %257~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_61
LB_61:
	cmp BYTE [r8+6],0
	jnz LB_49
	POP_GRM_SCC
	ret
LB_49:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_66
	jmp LB_67
LB_66:
	mov r8,unt_1
	jmp LB_64
LB_67:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_68
	jmp LB_69
LB_68:
	mov r8,unt_1
	jmp LB_64
LB_69:
	add r14,1
	jmp LB_65
LB_64:
	add rsp,0
	jmp LB_63
LB_65:
	call GRM_65
	cmp BYTE [r8+6],0
	jnz LB_72
	jmp LB_73
LB_72:
	jmp LB_70
LB_73:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_71
LB_70:
	add rsp,0
	jmp LB_63
LB_71:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_74
LB_74
;; rsp=1 , %264~1'(= r ) %263~0'(= r ) %262~8'(= a5◂ [ ] ) 
	jmp LB_76
LB_76:
; $ %[ "\\\"" ] ⊢ %[ "\\\"" ]
;; rsp=1 , %265~%[ "\\\"" ] %264~1'(= r ) %263~0'(= r ) %262~8'(= a5◂ [ ] ) 
; #38 { %[ "\\\"" ] 8'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "\\\"" ] 8'(= a5◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a5◂ [ ] ) }
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn %[ "\\\"" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],34
	mov r13,rax
	call ETR_38
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %266~2'(= a5◂ [ ] ) %264~1'(= r ) %263~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %267~0(<2)◂2'(= a5◂ [ ] ) %264~1'(= r ) %263~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_75
LB_75:
	cmp BYTE [r8+6],0
	jnz LB_63
	POP_GRM_SCC
	ret
LB_63:
	RB_GRM
	cmp r14,r9
	jge LB_80
	jmp LB_81
LB_80:
	mov r8,unt_1 
	jmp LB_78
LB_81:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_79
LB_78:
	add rsp,0
	jmp LB_77
LB_79:
	call GRM_65
	cmp BYTE [r8+6],0
	jnz LB_84
	jmp LB_85
LB_84:
	jmp LB_82
LB_85:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_83
LB_82:
	add rsp,8
	jmp LB_77
LB_83:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_86
LB_86
;; rsp=2 , %271~1'(= r ) %270~0'(= r ) %269~9'(= a5◂ [ ] ) %268~8'(= r ) 
	mov rdi,0
	cmp QWORD [rsp-8+8*2],rdi
	jnz LB_88
;; rsp=2 , %271~1'(= r ) %270~0'(= r ) %269~9'(= a5◂ [ ] ) %268~8'(= r ) 
	jmp LB_89
LB_89:
; $ %[ "\\0" ] ⊢ %[ "\\0" ]
;; rsp=2 , %272~%[ "\\0" ] %271~1'(= r ) %270~0'(= r ) %269~9'(= a5◂ [ ] ) %268~8'(= r ) 
; #38 { %[ "\\0" ] 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ "\\0" ] 9'(= a5◂ [ ] ) } ⊢ { 0'(= {| l |} ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn %[ "\\0" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],92
	mov BYTE [rax+8+1],48
	mov r13,rax
	call ETR_38
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=1 , %273~2'(= a5◂ [ ] ) %271~1'(= r ) %270~0'(= r ) %268~8'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=1 , %274~0(<2)◂2'(= a5◂ [ ] ) %271~1'(= r ) %270~0'(= r ) %268~8'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_87
LB_88:
;; rsp=2 , %271~1'(= r ) %270~0'(= r ) %269~9'(= a5◂ [ ] ) %268~8'(= r ) 
; #40 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_40
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %275~2'(= a5◂ [ ] ) %271~1'(= r ) %270~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %276~0(<2)◂2'(= a5◂ [ ] ) %271~1'(= r ) %270~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_87
LB_87:
	cmp BYTE [r8+6],0
	jnz LB_77
	POP_GRM_SCC
	ret
LB_77:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_91
LB_91
;; rsp=0 , %278~1'(= r ) %277~0'(= r ) 
; #32 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %279~2(<4)◂{ } %278~1'(= r ) %277~0'(= r ) 
; #22 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %280~0(<2)◂2(<4)◂{ } %278~1'(= r ) %277~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ }
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,unt 
	mov rax,unt_2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_92
LB_92:
	cmp BYTE [r8+6],0
	jnz LB_90
	POP_GRM_SCC
	ret
LB_90:
	POP_GRM_FAIL 
	ret
ETR_66: ;; mk_esc_s8 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) } : (_s8→{ _s8 _s8 })
;; rsp=0 , %281~0'(= {| l |} ) 
	jmp LB_93
LB_93:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %282~%[ 0r ] %281~0'(= {| l |} ) 
; #65 { 0'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a5◂ [ ]] ) }
; .mov_ptn2 { 0'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
	call ETR_65
;; rsp=0 , %285~2'(= a3◂ [ a5◂ [ ]] ) %284~1'(= r ) %283~0'(= {| l |} ) 
;; ?; 2'(= a3◂ [ a5◂ [ ]] ) ⊢ 0(<2)◂3'(= a5◂ [ ] )
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_94
	mov r9,QWORD [rdi+8]
;; rsp=0 , %286~3'(= a5◂ [ ] ) %284~1'(= r ) %283~0'(= {| l |} ) 
; #43 3'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 3'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r9
	mov r13,rax
	call ETR_43
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %288~2'(= {| l |} ) %287~3'(= a5◂ [ ] ) %284~1'(= r ) %283~0'(= {| l |} ) 
; ∎ { 0'(= {| l |} ) 2'(= {| l |} ) }
; .mov_ptn2 { 0'(= {| l |} ) 2'(= {| l |} ) } ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
LB_94:
;; rsp=0 , %285~2'(= a3◂ [ a5◂ [ ]] ) %284~1'(= r ) %283~0'(= {| l |} ) 
	jmp LB_95
LB_95:
; $ %[ "esc_stg_ltr" ] ⊢ %[ "esc_stg_ltr" ]
;; rsp=0 , %289~%[ "esc_stg_ltr" ] %285~2'(= a3◂ [ a5◂ [ ]] ) %284~1'(= r ) %283~0'(= {| l |} ) 
; #10 %[ "esc_stg_ltr" ] ⊢ %[ "esc_stg_ltr" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_96
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_97
LB_97:
;; rsp=0 , %290~%[ "esc_stg_ltr" ] %285~2'(= a3◂ [ a5◂ [ ]] ) %284~1'(= r ) %283~0'(= {| l |} ) 
	mov rdi,LB_98
	call emt_stg 
	jmp err
ETR_67:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_67
	ret
GRM_67:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_102
	jmp LB_103
LB_102:
	mov r8,unt_1
	jmp LB_100
LB_103:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_104
	jmp LB_105
LB_104:
	mov r8,unt_1
	jmp LB_100
LB_105:
	add r14,1
	jmp LB_101
LB_100:
	add rsp,0
	jmp LB_99
LB_101:
	call GRM_68
	cmp BYTE [r8+6],0
	jnz LB_108
	jmp LB_109
LB_108:
	jmp LB_106
LB_109:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_107
LB_106:
	add rsp,0
	jmp LB_99
LB_107:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_110
LB_110
;; rsp=1 , %293~1'(= r ) %292~0'(= r ) %291~8'(= a5◂ [ ] ) 
; #43 8'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 8'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r13,rax
	call ETR_43
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %295~2'(= {| l |} ) %294~3'(= a5◂ [ ] ) %293~1'(= r ) %292~0'(= r ) 
; #22 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %296~0(<2)◂2'(= {| l |} ) %294~3'(= a5◂ [ ] ) %293~1'(= r ) %292~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .mov_ptn2 0(<2)◂2'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	jmp LB_111
LB_111:
	cmp BYTE [r8+6],0
	jnz LB_99
	POP_GRM_SCC
	ret
LB_99:
	POP_GRM_FAIL 
	ret
ETR_68:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_68
	ret
GRM_68:
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
;; rsp=0 , %299~1'(= r ) %298~0'(= r ) %297~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %300~1(<2)◂{ } %299~1'(= r ) %298~0'(= r ) %297~{ } 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
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
	call GRM_69
	cmp BYTE [r8+6],0
	jnz LB_130
	jmp LB_131
LB_130:
	jmp LB_128
LB_131:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_129
LB_128:
	add rsp,0
	jmp LB_121
LB_129:
	call GRM_68
	cmp BYTE [r8+6],0
	jnz LB_134
	jmp LB_135
LB_134:
	jmp LB_132
LB_135:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
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
;; rsp=2 , %304~1'(= r ) %303~0'(= r ) %302~9'(= a5◂ [ ] ) %301~8'(= r ) 
; #40 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_40
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %305~2'(= a5◂ [ ] ) %304~1'(= r ) %303~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %306~0(<2)◂2'(= a5◂ [ ] ) %304~1'(= r ) %303~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
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
;; rsp=0 , %308~1'(= r ) %307~0'(= r ) 
; #32 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %309~2(<4)◂{ } %308~1'(= r ) %307~0'(= r ) 
; #22 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %310~0(<2)◂2(<4)◂{ } %308~1'(= r ) %307~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ }
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,unt 
	mov rax,unt_2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
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
	call GRM_68
	cmp BYTE [r8+6],0
	jnz LB_154
	jmp LB_155
LB_154:
	jmp LB_152
LB_155:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
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
;; rsp=2 , %314~1'(= r ) %313~0'(= r ) %312~9'(= a5◂ [ ] ) %311~8'(= r ) 
; #40 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_40
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %315~2'(= a5◂ [ ] ) %314~1'(= r ) %313~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %316~0(<2)◂2'(= a5◂ [ ] ) %314~1'(= r ) %313~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
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
ETR_69:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_69
	ret
GRM_69:
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
;; rsp=0 , %318~1'(= r ) %317~0'(= r ) 
	jmp LB_167
LB_167:
; $ %[ 92r ] ⊢ %[ 92r ]
;; rsp=0 , %319~%[ 92r ] %318~1'(= r ) %317~0'(= r ) 
; #22 %[ 92r ] ⊢ 0(<2)◂%[ 92r ]
;; rsp=0 , %320~0(<2)◂%[ 92r ] %318~1'(= r ) %317~0'(= r ) 
; ∎ 0(<2)◂%[ 92r ]
; .mov_ptn2 0(<2)◂%[ 92r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 92r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,92
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
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
	jg LB_171
	jmp LB_172
LB_171:
	mov r8,unt_1
	jmp LB_169
LB_172:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],34
	jnz LB_173
	jmp LB_174
LB_173:
	mov r8,unt_1
	jmp LB_169
LB_174:
	add r14,1
	jmp LB_170
LB_169:
	add rsp,0
	jmp LB_168
LB_170:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_175
LB_175
;; rsp=0 , %322~1'(= r ) %321~0'(= r ) 
	jmp LB_177
LB_177:
; $ %[ 34r ] ⊢ %[ 34r ]
;; rsp=0 , %323~%[ 34r ] %322~1'(= r ) %321~0'(= r ) 
; #22 %[ 34r ] ⊢ 0(<2)◂%[ 34r ]
;; rsp=0 , %324~0(<2)◂%[ 34r ] %322~1'(= r ) %321~0'(= r ) 
; ∎ 0(<2)◂%[ 34r ]
; .mov_ptn2 0(<2)◂%[ 34r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 34r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,34
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_176
LB_176:
	cmp BYTE [r8+6],0
	jnz LB_168
	POP_GRM_SCC
	ret
LB_168:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_181
	jmp LB_182
LB_181:
	mov r8,unt_1
	jmp LB_179
LB_182:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],110
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
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_185
LB_185
;; rsp=0 , %326~1'(= r ) %325~0'(= r ) 
	jmp LB_187
LB_187:
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %327~%[ 10r ] %326~1'(= r ) %325~0'(= r ) 
; #22 %[ 10r ] ⊢ 0(<2)◂%[ 10r ]
;; rsp=0 , %328~0(<2)◂%[ 10r ] %326~1'(= r ) %325~0'(= r ) 
; ∎ 0(<2)◂%[ 10r ]
; .mov_ptn2 0(<2)◂%[ 10r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 10r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,10
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_186
LB_186:
	cmp BYTE [r8+6],0
	jnz LB_178
	POP_GRM_SCC
	ret
LB_178:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_191
	jmp LB_192
LB_191:
	mov r8,unt_1
	jmp LB_189
LB_192:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],116
	jnz LB_193
	jmp LB_194
LB_193:
	mov r8,unt_1
	jmp LB_189
LB_194:
	add r14,1
	jmp LB_190
LB_189:
	add rsp,0
	jmp LB_188
LB_190:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_195
LB_195
;; rsp=0 , %330~1'(= r ) %329~0'(= r ) 
	jmp LB_197
LB_197:
; $ %[ 9r ] ⊢ %[ 9r ]
;; rsp=0 , %331~%[ 9r ] %330~1'(= r ) %329~0'(= r ) 
; #22 %[ 9r ] ⊢ 0(<2)◂%[ 9r ]
;; rsp=0 , %332~0(<2)◂%[ 9r ] %330~1'(= r ) %329~0'(= r ) 
; ∎ 0(<2)◂%[ 9r ]
; .mov_ptn2 0(<2)◂%[ 9r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 9r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_196
LB_196:
	cmp BYTE [r8+6],0
	jnz LB_188
	POP_GRM_SCC
	ret
LB_188:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_201
	jmp LB_202
LB_201:
	mov r8,unt_1
	jmp LB_199
LB_202:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_203
	jmp LB_204
LB_203:
	mov r8,unt_1
	jmp LB_199
LB_204:
	add r14,1
	jmp LB_200
LB_199:
	add rsp,0
	jmp LB_198
LB_200:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_205
LB_205
;; rsp=0 , %334~1'(= r ) %333~0'(= r ) 
	jmp LB_207
LB_207:
; $ %[ 0r ] ⊢ %[ 0r ]
;; rsp=0 , %335~%[ 0r ] %334~1'(= r ) %333~0'(= r ) 
; #22 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %336~0(<2)◂%[ 0r ] %334~1'(= r ) %333~0'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_206
LB_206:
	cmp BYTE [r8+6],0
	jnz LB_198
	POP_GRM_SCC
	ret
LB_198:
	POP_GRM_FAIL 
	ret
ETR_70:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_70
	ret
GRM_70:
	PUSH_GRM
	cmp r14,r9
	jge LB_211
	jmp LB_212
LB_211:
	mov r8,unt_1 
	jmp LB_209
LB_212:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_210
LB_209:
	add rsp,0
	jmp LB_208
LB_210:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_213
LB_213
;; rsp=1 , %339~1'(= r ) %338~0'(= r ) %337~8'(= r ) 
	mov rdi,48
	cmp QWORD [rsp-8+8*1],rdi
;;48 =< .. 
	jl LB_215
	mov rdi,57
	cmp QWORD [rsp-8+8*1],rdi
;; .. =< 57
	jg LB_215
;; rsp=1 , %339~1'(= r ) %338~0'(= r ) %337~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %340~0(<2)◂8'(= r ) %339~1'(= r ) %338~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_214
LB_215:
;; rsp=1 , %339~1'(= r ) %338~0'(= r ) %337~8'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %341~1(<2)◂{ } %339~1'(= r ) %338~0'(= r ) %337~8'(= r ) 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	add rsp,8
	jmp LB_214
LB_214:
	cmp BYTE [r8+6],0
	jnz LB_208
	POP_GRM_SCC
	ret
LB_208:
	POP_GRM_FAIL 
	ret
ETR_71:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_71
	ret
GRM_71:
	PUSH_GRM
	cmp r14,r9
	jge LB_219
	jmp LB_220
LB_219:
	mov r8,unt_1 
	jmp LB_217
LB_220:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_218
LB_217:
	add rsp,0
	jmp LB_216
LB_218:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_221
LB_221
;; rsp=1 , %344~1'(= r ) %343~0'(= r ) %342~8'(= r ) 
	mov rdi,97
	cmp QWORD [rsp-8+8*1],rdi
;;97 =< .. 
	jl LB_223
	mov rdi,122
	cmp QWORD [rsp-8+8*1],rdi
;; .. =< 122
	jg LB_223
;; rsp=1 , %344~1'(= r ) %343~0'(= r ) %342~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %345~0(<2)◂8'(= r ) %344~1'(= r ) %343~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_222
LB_223:
;; rsp=1 , %344~1'(= r ) %343~0'(= r ) %342~8'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %346~1(<2)◂{ } %344~1'(= r ) %343~0'(= r ) %342~8'(= r ) 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	add rsp,8
	jmp LB_222
LB_222:
	cmp BYTE [r8+6],0
	jnz LB_216
	POP_GRM_SCC
	ret
LB_216:
	POP_GRM_FAIL 
	ret
ETR_72:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_72
	ret
GRM_72:
	PUSH_GRM
	cmp r14,r9
	jge LB_227
	jmp LB_228
LB_227:
	mov r8,unt_1 
	jmp LB_225
LB_228:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_226
LB_225:
	add rsp,0
	jmp LB_224
LB_226:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_229
LB_229
;; rsp=1 , %349~1'(= r ) %348~0'(= r ) %347~8'(= r ) 
	mov rdi,65
	cmp QWORD [rsp-8+8*1],rdi
;;65 =< .. 
	jl LB_231
	mov rdi,90
	cmp QWORD [rsp-8+8*1],rdi
;; .. =< 90
	jg LB_231
;; rsp=1 , %349~1'(= r ) %348~0'(= r ) %347~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %350~0(<2)◂8'(= r ) %349~1'(= r ) %348~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_230
LB_231:
;; rsp=1 , %349~1'(= r ) %348~0'(= r ) %347~8'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %351~1(<2)◂{ } %349~1'(= r ) %348~0'(= r ) %347~8'(= r ) 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ r] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	add rsp,8
	jmp LB_230
LB_230:
	cmp BYTE [r8+6],0
	jnz LB_224
	POP_GRM_SCC
	ret
LB_224:
	POP_GRM_FAIL 
	ret
ETR_73:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_73
	ret
GRM_73:
	PUSH_GRM
	call GRM_72
	cmp BYTE [r8+6],0
	jnz LB_235
	jmp LB_236
LB_235:
	jmp LB_233
LB_236:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_234
LB_233:
	add rsp,0
	jmp LB_232
LB_234:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_237
LB_237
;; rsp=1 , %354~1'(= r ) %353~0'(= r ) %352~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %355~0(<2)◂8'(= r ) %354~1'(= r ) %353~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_238
LB_238:
	cmp BYTE [r8+6],0
	jnz LB_232
	POP_GRM_SCC
	ret
LB_232:
	RB_GRM
	call GRM_71
	cmp BYTE [r8+6],0
	jnz LB_242
	jmp LB_243
LB_242:
	jmp LB_240
LB_243:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_241
LB_240:
	add rsp,0
	jmp LB_239
LB_241:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_244
LB_244
;; rsp=1 , %358~1'(= r ) %357~0'(= r ) %356~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %359~0(<2)◂8'(= r ) %358~1'(= r ) %357~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_245
LB_245:
	cmp BYTE [r8+6],0
	jnz LB_239
	POP_GRM_SCC
	ret
LB_239:
	POP_GRM_FAIL 
	ret
ETR_74:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_74
	ret
GRM_74:
	PUSH_GRM
	call GRM_73
	cmp BYTE [r8+6],0
	jnz LB_249
	jmp LB_250
LB_249:
	jmp LB_247
LB_250:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_248
LB_247:
	add rsp,0
	jmp LB_246
LB_248:
	call GRM_75
	cmp BYTE [r8+6],0
	jnz LB_253
	jmp LB_254
LB_253:
	jmp LB_251
LB_254:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_252
LB_251:
	add rsp,8
	jmp LB_246
LB_252:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_255
LB_255
;; rsp=2 , %363~1'(= r ) %362~0'(= r ) %361~9'(= a5◂ [ ] ) %360~8'(= r ) 
; #40 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_40
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %364~2'(= a5◂ [ ] ) %363~1'(= r ) %362~0'(= r ) 
; #43 2'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,r8
	mov r13,rax
	call ETR_43
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %366~2'(= {| l |} ) %365~3'(= a5◂ [ ] ) %363~1'(= r ) %362~0'(= r ) 
; #22 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %367~0(<2)◂2'(= {| l |} ) %365~3'(= a5◂ [ ] ) %363~1'(= r ) %362~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .mov_ptn2 0(<2)◂2'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	jmp LB_256
LB_256:
	cmp BYTE [r8+6],0
	jnz LB_246
	POP_GRM_SCC
	ret
LB_246:
	POP_GRM_FAIL 
	ret
ETR_75:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_75
	ret
GRM_75:
	PUSH_GRM
	call GRM_76
	cmp BYTE [r8+6],0
	jnz LB_260
	jmp LB_261
LB_260:
	jmp LB_258
LB_261:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_259
LB_258:
	add rsp,0
	jmp LB_257
LB_259:
	call GRM_75
	cmp BYTE [r8+6],0
	jnz LB_264
	jmp LB_265
LB_264:
	jmp LB_262
LB_265:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
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
;; rsp=2 , %371~1'(= r ) %370~0'(= r ) %369~9'(= a5◂ [ ] ) %368~8'(= r ) 
; #40 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_40
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %372~2'(= a5◂ [ ] ) %371~1'(= r ) %370~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %373~0(<2)◂2'(= a5◂ [ ] ) %371~1'(= r ) %370~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_267
LB_267:
	cmp BYTE [r8+6],0
	jnz LB_257
	POP_GRM_SCC
	ret
LB_257:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_269
LB_269
;; rsp=0 , %375~1'(= r ) %374~0'(= r ) 
; #32 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %376~2(<4)◂{ } %375~1'(= r ) %374~0'(= r ) 
; #22 2(<4)◂{ } ⊢ 0(<2)◂2(<4)◂{ }
;; rsp=0 , %377~0(<2)◂2(<4)◂{ } %375~1'(= r ) %374~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ }
; .mov_ptn2 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
; .mov_ptn 0(<2)◂2(<4)◂{ } ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,unt 
	mov rax,unt_2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_270
LB_270:
	cmp BYTE [r8+6],0
	jnz LB_268
	POP_GRM_SCC
	ret
LB_268:
	POP_GRM_FAIL 
	ret
ETR_76:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_76
	ret
GRM_76:
	PUSH_GRM
	call GRM_73
	cmp BYTE [r8+6],0
	jnz LB_274
	jmp LB_275
LB_274:
	jmp LB_272
LB_275:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_273
LB_272:
	add rsp,0
	jmp LB_271
LB_273:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_276
LB_276
;; rsp=1 , %380~1'(= r ) %379~0'(= r ) %378~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %381~0(<2)◂8'(= r ) %380~1'(= r ) %379~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_277
LB_277:
	cmp BYTE [r8+6],0
	jnz LB_271
	POP_GRM_SCC
	ret
LB_271:
	RB_GRM
	call GRM_70
	cmp BYTE [r8+6],0
	jnz LB_281
	jmp LB_282
LB_281:
	jmp LB_279
LB_282:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_280
LB_279:
	add rsp,0
	jmp LB_278
LB_280:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_283
LB_283
;; rsp=1 , %384~1'(= r ) %383~0'(= r ) %382~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %385~0(<2)◂8'(= r ) %384~1'(= r ) %383~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_284
LB_284:
	cmp BYTE [r8+6],0
	jnz LB_278
	POP_GRM_SCC
	ret
LB_278:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_288
	jmp LB_289
LB_288:
	mov r8,unt_1
	jmp LB_286
LB_289:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_290
	jmp LB_291
LB_290:
	mov r8,unt_1
	jmp LB_286
LB_291:
	add r14,1
	jmp LB_287
LB_286:
	add rsp,0
	jmp LB_285
LB_287:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_292
LB_292
;; rsp=0 , %387~1'(= r ) %386~0'(= r ) 
	jmp LB_294
LB_294:
; $ %[ 95r ] ⊢ %[ 95r ]
;; rsp=0 , %388~%[ 95r ] %387~1'(= r ) %386~0'(= r ) 
; #22 %[ 95r ] ⊢ 0(<2)◂%[ 95r ]
;; rsp=0 , %389~0(<2)◂%[ 95r ] %387~1'(= r ) %386~0'(= r ) 
; ∎ 0(<2)◂%[ 95r ]
; .mov_ptn2 0(<2)◂%[ 95r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 95r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,95
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_293
LB_293:
	cmp BYTE [r8+6],0
	jnz LB_285
	POP_GRM_SCC
	ret
LB_285:
	POP_GRM_FAIL 
	ret
ETR_77:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_77
	ret
GRM_77:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_298
	jmp LB_299
LB_298:
	mov r8,unt_1
	jmp LB_296
LB_299:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_300
	jmp LB_301
LB_300:
	mov r8,unt_1
	jmp LB_296
LB_301:
	add r14,1
	jmp LB_297
LB_296:
	add rsp,0
	jmp LB_295
LB_297:
	call GRM_75
	cmp BYTE [r8+6],0
	jnz LB_304
	jmp LB_305
LB_304:
	jmp LB_302
LB_305:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_303
LB_302:
	add rsp,0
	jmp LB_295
LB_303:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_306
LB_306
;; rsp=1 , %392~1'(= r ) %391~0'(= r ) %390~8'(= a5◂ [ ] ) 
; #43 8'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 8'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r13,rax
	call ETR_43
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %394~2'(= {| l |} ) %393~3'(= a5◂ [ ] ) %392~1'(= r ) %391~0'(= r ) 
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
	lea rsi,[LB_308+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %396~4'(= {| l |} ) %395~2'(= {| l |} ) %393~3'(= a5◂ [ ] ) %392~1'(= r ) %391~0'(= r ) 
; #22 4'(= {| l |} ) ⊢ 0(<2)◂4'(= {| l |} )
;; rsp=0 , %397~0(<2)◂4'(= {| l |} ) %395~2'(= {| l |} ) %393~3'(= a5◂ [ ] ) %392~1'(= r ) %391~0'(= r ) 
; ∎ 0(<2)◂4'(= {| l |} )
; .mov_ptn2 0(<2)◂4'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
; .mov_ptn 0(<2)◂4'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov rax,r10
	mov BYTE [rax+6],0
	mov r8,rax
	jmp LB_307
LB_307:
	cmp BYTE [r8+6],0
	jnz LB_295
	POP_GRM_SCC
	ret
LB_295:
	RB_GRM
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_312
	jmp LB_313
LB_312:
	jmp LB_310
LB_313:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_311
LB_310:
	add rsp,0
	jmp LB_309
LB_311:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_314
LB_314
;; rsp=1 , %400~1'(= r ) %399~0'(= r ) %398~8'(= {| l |} ) 
; #22 8'(= {| l |} ) ⊢ 0(<2)◂8'(= {| l |} )
;; rsp=1 , %401~0(<2)◂8'(= {| l |} ) %400~1'(= r ) %399~0'(= r ) 
; ∎ 0(<2)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
; .mov_ptn 0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,8
	jmp LB_315
LB_315:
	cmp BYTE [r8+6],0
	jnz LB_309
	POP_GRM_SCC
	ret
LB_309:
	POP_GRM_FAIL 
	ret
ETR_82: ;; pnt_name 0'(= a9◂ [ ] ) ⊢ 0'(= {| l |} ) : (_t9→_s8)
;; rsp=0 , %402~0'(= a9◂ [ ] ) 
;; ?; 0'(= a9◂ [ ] ) ⊢ 0(<2)◂{ 1'(= {| l |} ) 2'(= a9◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_316
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r13+16]
;; rsp=0 , %404~2'(= a9◂ [ ] ) %403~1'(= {| l |} ) 
; #82 2'(= a9◂ [ ] ) ⊢ 0'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	mov rax,r8
	mov r13,rax
	call ETR_82
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %405~0'(= {| l |} ) %403~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	add rdi,1
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	lea rsi,[LB_317+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %408~2'(= {| l |} ) %407~0'(= {| l |} ) %406~1'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_316:
;; ?; 0'(= a9◂ [ ] ) ⊢ 1(<2)◂0'(= {| l |} )
;; rsp=0 , %409~0'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
ETR_87: ;; pnt_cst_v 0'(= a10◂ [ ] ) ⊢ 0'(= {| l |} ) : (_t10→_s8)
;; rsp=0 , %410~0'(= a10◂ [ ] ) 
;; ? 0'(= a10◂ [ ] ) ⊢ 0(<2)◂1'(= r )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_318
	mov r14,QWORD [rdi+8]
;; rsp=0 , %412~1'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
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
	add rdi,1
	push rdi 
	call mlc_s8
	pop rdi
	mov r13,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_319+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	mov rcx,QWORD [tmp] 
;; rsp=0 , %414~0'(= {| l |} ) %413~1'(= r ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
LB_318:
;; ?. 0'(= a10◂ [ ] ) ⊢ 1(<2)◂0'(= {| l |} )
;; rsp=0 , %411~0'(= {| l |} ) 
; #66 0'(= {| l |} ) ⊢ { 0'(= {| l |} ) 1'(= {| l |} ) }
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	call ETR_66
;; rsp=0 , %416~1'(= {| l |} ) %415~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,2
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_320+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_321+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %418~2'(= {| l |} ) %417~1'(= {| l |} ) %415~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
ETR_88: ;; pnt_cst 0'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= {| l |} ) : (_t11◂_t9→_s8)
;; rsp=0 , %419~0'(= a11◂ [ a9◂ [ ]] ) 
;; ? 0'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂1'(= a10◂ [ ] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_322
	mov r14,QWORD [rdi+8]
;; rsp=0 , %421~1'(= a10◂ [ ] ) 
; #87 1'(= a10◂ [ ] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 1'(= a10◂ [ ] ) ⊢ 0'(= a10◂ [ ] )
; .mov_ptn 1'(= a10◂ [ ] ) ⊢ 0'(= a10◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_87
;; rsp=0 , %422~0'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
LB_322:
;; ?. 0'(= a11◂ [ a9◂ [ ]] ) ⊢ 1(<2)◂1'(= a9◂ [ ] )
	mov r14,QWORD [rdi+8]
;; rsp=0 , %420~1'(= a9◂ [ ] ) 
; #82 1'(= a9◂ [ ] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 1'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
; .mov_ptn 1'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_82
;; rsp=0 , %423~0'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
ETR_97: ;; pnt_src_ptn 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= {| l |} ) : (_t8◂_t12◂_s8◂_t9→_s8)
;; rsp=0 , %424~0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
;; ?; 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂1'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_323
	mov r14,QWORD [rdi+8]
;; rsp=0 , %425~1'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) 
; #98 1'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 1'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 1'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r14
	mov r13,rax
	call ETR_98
;; rsp=0 , %426~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	add rdi,3
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_324+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	lea rsi,[LB_325+2-1]
	mov rcx,2
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %428~1'(= {| l |} ) %427~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_323:
;; ?; 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂1'(= a12◂ [ a9◂ [ ]{| l |}] )
	mov r14,QWORD [rdi+8]
;; rsp=0 , %429~1'(= a12◂ [ a9◂ [ ]{| l |}] ) 
;; ?; 1'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂0'(= a11◂ [ a9◂ [ ]] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_326
	mov r13,QWORD [rdi+8]
;; rsp=0 , %430~0'(= a11◂ [ a9◂ [ ]] ) 
; #88 0'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 0'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
	call ETR_88
;; rsp=0 , %431~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	add rdi,6
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_327+3-1]
	mov rcx,3
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	lea rsi,[LB_328+3-1]
	mov rcx,3
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %433~1'(= {| l |} ) %432~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_326:
;; ?; 1'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂1'(= {| l |} )
;; rsp=0 , %434~1'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
ETR_98: ;; pnt_src_ptn_lst 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= {| l |} ) : (_lst◂_t8◂_t12◂_s8◂_t9→_s8)
;; rsp=0 , %435~0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) 
;; ?; 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂{ 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_329
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r13+16]
;; rsp=0 , %437~2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) %436~1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; #97 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r14
	mov r13,rax
	call ETR_97
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %438~0'(= {| l |} ) %437~2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) 
; #98 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov r13,rax
	call ETR_98
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %439~1'(= {| l |} ) %438~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,1
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_330+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %442~2'(= {| l |} ) %441~1'(= {| l |} ) %440~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_329:
;; ?; 0'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	jmp LB_331
LB_331:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %443~%[ "" ] 
; ∎ %[ "" ]
; .mov_ptn2 %[ "" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r13,rax
	ret
ETR_99: ;; pnt_dst_ptn 0'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= {| l |} ) : (_t8◂_t13◂_s8→_s8)
;; rsp=0 , %444~0'(= a8◂ [ a13◂ [ {| l |}]] ) 
;; ?; 0'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0(<2)◂1'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_332
	mov r14,QWORD [rdi+8]
;; rsp=0 , %445~1'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) 
; #100 1'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 1'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 1'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r14
	mov r13,rax
	call ETR_100
;; rsp=0 , %446~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	add rdi,3
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_333+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	lea rsi,[LB_334+2-1]
	mov rcx,2
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %448~1'(= {| l |} ) %447~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_332:
;; ?; 0'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 1(<2)◂1'(= a13◂ [ {| l |}] )
	mov r14,QWORD [rdi+8]
;; rsp=0 , %449~1'(= a13◂ [ {| l |}] ) 
;; ?; 1'(= a13◂ [ {| l |}] ) ⊢ 0(<2)◂0'(= a3◂ [ {| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_335
	mov r13,QWORD [rdi+8]
;; rsp=0 , %450~0'(= a3◂ [ {| l |}] ) 
	jmp LB_336
LB_336:
; $ %[ "_ " ] ⊢ %[ "_ " ]
;; rsp=0 , %451~%[ "_ " ] %450~0'(= a3◂ [ {| l |}] ) 
; ∎ %[ "_ " ]
; .mov_ptn2 %[ "_ " ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "_ " ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],95
	mov BYTE [rax+8+1],32
	mov r13,rax
	ret
LB_335:
;; ?; 1'(= a13◂ [ {| l |}] ) ⊢ 1(<2)◂1'(= {| l |} )
;; rsp=0 , %452~1'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
ETR_100: ;; pnt_dst_ptn_lst 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= {| l |} ) : (_lst◂_t8◂_t13◂_s8→_s8)
;; rsp=0 , %453~0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) 
;; ?; 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0(<2)◂{ 1'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_337
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r13+16]
;; rsp=0 , %455~2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %454~1'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #99 1'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 1'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 1'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r14
	mov r13,rax
	call ETR_99
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %456~0'(= {| l |} ) %455~2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) 
; #100 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 1'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r8
	mov r13,rax
	call ETR_100
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %457~1'(= {| l |} ) %456~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,1
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_338+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %460~2'(= {| l |} ) %459~1'(= {| l |} ) %458~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_337:
;; ?; 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	jmp LB_339
LB_339:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %461~%[ "" ] 
; ∎ %[ "" ]
; .mov_ptn2 %[ "" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r13,rax
	ret
LB_342:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_345+8*rsi]
LB_345: dq LB_343,LB_344
LB_343:
	ALC_RCD 2
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*0]
	call LB_347
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*0],rax
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*1]
	call LB_342
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*1],rax
	mov rax,rsi 
	mov BYTE [rax+6],0
	jmp LB_346
LB_344:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_346
LB_346:
	ret
LB_347:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_350+8*rsi]
LB_350: dq LB_348,LB_349
LB_348:
	mov rdi,QWORD [rdi+8]
	call LB_342
	mov rsi,r15 
	mov r15,QWORD [r15]
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],0
	mov rax,rsi
	jmp LB_351
LB_349:
	mov rdi,QWORD [rdi+8]
	call LB_352
	mov rsi,r15 
	mov r15,QWORD [r15]
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],1
	mov rax,rsi
	jmp LB_351
LB_351:
	ret
LB_352:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_357+8*rsi]
LB_357: dq LB_353,LB_354,LB_355,LB_356
LB_353:
	ALC_RCD 2
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*0]
	call LB_359
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*0],rax
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*1]
	call LB_347
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*1],rax
	mov rax,rsi 
	mov BYTE [rax+6],0
	jmp LB_358
LB_354:
	mov rdi,QWORD [rdi+8]
	call LB_360
	mov rsi,r15 
	mov r15,QWORD [r15]
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],1
	mov rax,rsi
	jmp LB_358
LB_355:
	mov rdi,QWORD [rdi+8]
	call LB_361
	mov rsi,r15 
	mov r15,QWORD [r15]
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],2
	mov rax,rsi
	jmp LB_358
LB_356:
	C_PUSH_REGS
	call rpc_s8  
	C_POP_REGS
	mov BYTE [rax+6],3
	jmp LB_358
LB_358:
	ret
LB_361:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_364+8*rsi]
LB_364: dq LB_362,LB_363
LB_362:
	C_PUSH_REGS
	call rpc_s8  
	C_POP_REGS
	mov BYTE [rax+6],0
	jmp LB_365
LB_363:
	mov rax,unt
	mov BYTE [rax+6],1
	jmp LB_365
LB_365:
	ret
LB_360:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_368+8*rsi]
LB_368: dq LB_366,LB_367
LB_366:
	mov rdi,QWORD [rdi+8]
	call LB_370
	mov rsi,r15 
	mov r15,QWORD [r15]
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],0
	mov rax,rsi
	jmp LB_369
LB_367:
	mov rdi,QWORD [rdi+8]
	call LB_359
	mov rsi,r15 
	mov r15,QWORD [r15]
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],1
	mov rax,rsi
	jmp LB_369
LB_369:
	ret
LB_370:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_373+8*rsi]
LB_373: dq LB_371,LB_372
LB_371:
	mov rdi,QWORD [rdi+8]
	mov rax,rdi
	mov rsi,r15 
	mov r15,QWORD [r15]
	mov QWORD [rsi+8],rax
	mov BYTE [rsi+6],0
	mov rax,rsi
	jmp LB_374
LB_372:
	C_PUSH_REGS
	call rpc_s8  
	C_POP_REGS
	mov BYTE [rax+6],1
	jmp LB_374
LB_374:
	ret
LB_359:
	movzx rsi,BYTE [rdi+6]
	jmp QWORD [LB_377+8*rsi]
LB_377: dq LB_375,LB_376
LB_375:
	ALC_RCD 2
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*0]
	C_PUSH_REGS
	call rpc_s8  
	C_POP_REGS
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*0],rax
	push rdi
	push rsi
	mov rdi,QWORD [rdi+8+8*1]
	call LB_359
	pop rsi  
	pop rdi 
	mov QWORD [rsi+8+8*1],rax
	mov rax,rsi 
	mov BYTE [rax+6],0
	jmp LB_378
LB_376:
	C_PUSH_REGS
	call rpc_s8  
	C_POP_REGS
	mov BYTE [rax+6],1
	jmp LB_378
LB_378:
	ret
ETR_101: ;; pnt_mtc_ptn 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= {| l |} ) : (_t8◂_t14◂_s8◂_t9→_s8)
;; rsp=0 , %462~0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
;; ? 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_340
	mov r14,QWORD [rdi+8]
;; rsp=0 , %464~1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
	jmp LB_341
LB_341:
; $ 1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ),0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rdi,r14
	call LB_342
	mov r13,rax
;; rsp=0 , %466~0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) %465~1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
; #79 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
;; rsp=0 , %467~0(<2)◂0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) %465~1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
; #102 1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 1'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r14
	mov r13,rax
	call ETR_102
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %468~1'(= {| l |} ) %467~0(<2)◂0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,3
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_379+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_380+2-1]
	mov rcx,2
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %470~2'(= {| l |} ) %469~1'(= {| l |} ) %467~0(<2)◂0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
; ∎ 2'(= {| l |} )
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_340:
;; ?. 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂1'(= a14◂ [ a9◂ [ ]{| l |}] )
	mov r14,QWORD [rdi+8]
;; rsp=0 , %463~1'(= a14◂ [ a9◂ [ ]{| l |}] ) 
;; ? 1'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<4)◂0'(= a11◂ [ a9◂ [ ]] )
	mov rdi,r14
	cmp BYTE [rdi+6],1
	jnz LB_381
	mov r13,QWORD [rdi+8]
;; rsp=0 , %475~0'(= a11◂ [ a9◂ [ ]] ) 
; #88 0'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 0'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
	call ETR_88
;; rsp=0 , %476~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	add rdi,6
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_382+3-1]
	mov rcx,3
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	lea rsi,[LB_383+3-1]
	mov rcx,3
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %478~1'(= {| l |} ) %477~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_381:
;; ? 1'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<4)◂{ 0'(= a9◂ [ ] ) 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_384
	mov r13, QWORD [r14+8]
	mov r8, QWORD [r14+16]
;; rsp=0 , %474~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %473~0'(= a9◂ [ ] ) 
; #101 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov r13,rax
	call ETR_101
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %479~1'(= {| l |} ) %473~0'(= a9◂ [ ] ) 
; #82 0'(= a9◂ [ ] ) ⊢ 0'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 0'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	call ETR_82
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %480~0'(= {| l |} ) %479~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,3
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_385+3-1]
	mov rcx,3
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %483~2'(= {| l |} ) %482~1'(= {| l |} ) %481~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_384:
;; ? 1'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 3(<4)◂1'(= {| l |} )
	mov rdi,r14
	cmp BYTE [rdi+6],3
	jnz LB_386
;; rsp=0 , %472~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,1
	push rdi 
	call mlc_s8
	pop rdi
	mov r13,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_387+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %485~0'(= {| l |} ) %484~1'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
LB_386:
;; ?. 1'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<4)◂0'(= a3◂ [ {| l |}] )
	mov r13,QWORD [rdi+8]
;; rsp=0 , %471~0'(= a3◂ [ {| l |}] ) 
	jmp LB_388
LB_388:
; $ %[ "_" ] ⊢ %[ "_" ]
;; rsp=0 , %486~%[ "_" ] %471~0'(= a3◂ [ {| l |}] ) 
; ∎ %[ "_" ]
; .mov_ptn2 %[ "_" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "_" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],1
	mov BYTE [rax+8+0],95
	mov r13,rax
	ret
ETR_102: ;; pnt_mtc_ptn_lst 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= {| l |} ) : (_lst◂_t8◂_t14◂_s8◂_t9→_s8)
;; rsp=0 , %487~0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
;; ? 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂{ 1'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_389
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r13+16]
;; rsp=0 , %489~2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) %488~1'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; #101 1'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 1'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 1'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r14
	mov r13,rax
	call ETR_101
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %490~0'(= {| l |} ) %489~2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
; #102 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov r13,rax
	call ETR_102
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %491~1'(= {| l |} ) %490~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,1
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_390+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %494~2'(= {| l |} ) %493~1'(= {| l |} ) %492~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_389:
;; ?. 0'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	jmp LB_391
LB_391:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %495~%[ "" ] 
; ∎ %[ "" ]
; .mov_ptn2 %[ "" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r13,rax
	ret
ETR_132: ;; pnt_lc_code { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t17◂_s8◂_t9 }→{ _r64 _s8 })
;; rsp=0 , %497~1'(= a17◂ [ a9◂ [ ]{| l |}] ) %496~0'(= r ) 
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<7)◂{ 2'(= a9◂ [ ] ) 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_392
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %508~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %507~2'(= a9◂ [ ] ) %496~0'(= r ) 
; #82 2'(= a9◂ [ ] ) ⊢ 1'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	mov rax,r8
	mov r13,rax
	call ETR_82
	mov r9,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %509~1'(= {| l |} ) %508~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %496~0'(= r ) 
; #97 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_97
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %510~2'(= {| l |} ) %509~1'(= {| l |} ) %496~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,7
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_393+6-1]
	mov rcx,6
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_394+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	mov rax,r13
LB_396:
	cmp rax,0
	jz LB_397
	sub rax,1
	lea rsi,[LB_395+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_396
LB_397:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %514~3'(= {| l |} ) %513~2'(= {| l |} ) %512~1'(= {| l |} ) %511~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_392:
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<7)◂{ 2'(= a12◂ [ a9◂ [ ]{| l |}] ) 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],1
	jnz LB_398
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %506~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %505~2'(= a12◂ [ a9◂ [ ]{| l |}] ) %496~0'(= r ) 
; #78 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] )
;; rsp=0 , %515~1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) %506~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %496~0'(= r ) 
; #97 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	call ETR_97
	mov r9,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %516~1'(= {| l |} ) %506~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %496~0'(= r ) 
; #97 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_97
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %517~2'(= {| l |} ) %516~1'(= {| l |} ) %496~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,10
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_399+6-1]
	mov rcx,6
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_400+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_401+3-1]
	mov rcx,3
	rep movsb
	mov rax,r13
LB_403:
	cmp rax,0
	jz LB_404
	sub rax,1
	lea rsi,[LB_402+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_403
LB_404:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %521~3'(= {| l |} ) %520~2'(= {| l |} ) %519~1'(= {| l |} ) %518~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_398:
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<7)◂{ 2'(= a19◂ [ a9◂ [ ]{| l |}] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],2
	jnz LB_405
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %504~3'(= a17◂ [ a9◂ [ ]{| l |}] ) %503~2'(= a19◂ [ a9◂ [ ]{| l |}] ) %496~0'(= r ) 
; #133 { 0'(= r ) 2'(= a19◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r9
; .mov_ptn2 { 0'(= r ) 2'(= a19◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a19◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 2'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a19◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov r14,rax
	call ETR_133
	mov r9,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %523~1'(= {| l |} ) %522~0'(= r ) %504~3'(= a17◂ [ a9◂ [ ]{| l |}] ) 
; #132 { 0'(= r ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 { 0'(= r ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 3'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r9
	mov r14,rax
	call ETR_132
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %525~2'(= {| l |} ) %524~0'(= r ) %523~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,0
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %528~3'(= {| l |} ) %527~2'(= {| l |} ) %526~1'(= {| l |} ) %524~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_405:
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 3(<7)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r14
	cmp BYTE [rdi+6],3
	jnz LB_406
	mov r8,QWORD [rdi+8]
;; rsp=0 , %502~2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %496~0'(= r ) 
; #134 { 0'(= r ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov r14,rax
	call ETR_134
;; rsp=0 , %530~1'(= {| l |} ) %529~0'(= r ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
LB_406:
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 4(<7)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],4
	jnz LB_407
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %501~3'(= a18◂ [ a9◂ [ ]{| l |}] ) %500~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %496~0'(= r ) 
; #97 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov r13,rax
	call ETR_97
	mov r9,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %531~1'(= {| l |} ) %501~3'(= a18◂ [ a9◂ [ ]{| l |}] ) %496~0'(= r ) 
;; ? 3'(= a18◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂{ 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r9
	cmp BYTE [rdi+6],1
	jnz LB_408
	mov r8, QWORD [r9+8]
	mov r10, QWORD [r9+16]
;; rsp=0 , %534~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %533~2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %531~1'(= {| l |} ) %496~0'(= r ) 
; #100 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 2'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r8
	mov r13,rax
	call ETR_100
	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %535~2'(= {| l |} ) %534~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %531~1'(= {| l |} ) %496~0'(= r ) 
; #132 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_132
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %537~3'(= {| l |} ) %536~0'(= r ) %535~2'(= {| l |} ) %531~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	add rdi,8
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_409+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_410+5-1]
	mov rcx,5
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_411+2-1]
	mov rcx,2
	rep movsb
	mov rax,r13
LB_413:
	cmp rax,0
	jz LB_414
	sub rax,1
	lea rsi,[LB_412+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_413
LB_414:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %542~4'(= {| l |} ) %541~3'(= {| l |} ) %540~2'(= {| l |} ) %539~1'(= {| l |} ) %538~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_408:
;; ?. 3'(= a18◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %532~2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %531~1'(= {| l |} ) %496~0'(= r ) 
; #135 { 0'(= r ) 2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 { 0'(= r ) 2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov r14,rax
	call ETR_135
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %544~2'(= {| l |} ) %543~0'(= r ) %531~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,7
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_415+5-1]
	mov rcx,5
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_416+2-1]
	mov rcx,2
	rep movsb
	mov rax,r13
LB_418:
	cmp rax,0
	jz LB_419
	sub rax,1
	lea rsi,[LB_417+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_418
LB_419:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %548~3'(= {| l |} ) %547~2'(= {| l |} ) %546~1'(= {| l |} ) %545~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_407:
;; ? 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 5(<7)◂2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rdi,r14
	cmp BYTE [rdi+6],5
	jnz LB_420
	mov r8,QWORD [rdi+8]
;; rsp=0 , %499~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %496~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	add rdi,7
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_421+7-1]
	mov rcx,7
	rep movsb
	mov rax,r13
LB_423:
	cmp rax,0
	jz LB_424
	sub rax,1
	lea rsi,[LB_422+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_423
LB_424:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %550~1'(= {| l |} ) %549~0'(= r ) %499~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
LB_420:
;; ?. 1'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 6(<7)◂2'(= r )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %498~2'(= r ) %496~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	add rdi,5
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_425+5-1]
	mov rcx,5
	rep movsb
	mov rax,r13
LB_427:
	cmp rax,0
	jz LB_428
	sub rax,1
	lea rsi,[LB_426+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_427
LB_428:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %552~1'(= {| l |} ) %551~0'(= r ) %498~2'(= r ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
ETR_133: ;; pnt_lc_line { 0'(= r ) 1'(= a19◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t19◂_s8◂_t9 }→{ _r64 _s8 })
;; rsp=0 , %554~1'(= a19◂ [ a9◂ [ ]{| l |}] ) %553~0'(= r ) 
;; ?; 1'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<4)◂{ 2'(= a9◂ [ ] ) 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 4'(= a8◂ [ a13◂ [ {| l |}]] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_429
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov r10, QWORD [r14+24]
;; rsp=0 , %557~4'(= a8◂ [ a13◂ [ {| l |}]] ) %556~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %555~2'(= a9◂ [ ] ) %553~0'(= r ) 
; #97 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_97
	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %558~1'(= {| l |} ) %557~4'(= a8◂ [ a13◂ [ {| l |}]] ) %555~2'(= a9◂ [ ] ) %553~0'(= r ) 
; #99 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 3'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
; .mov_ptn2 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r10
	mov r13,rax
	call ETR_99
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %559~3'(= {| l |} ) %558~1'(= {| l |} ) %555~2'(= a9◂ [ ] ) %553~0'(= r ) 
; #82 2'(= a9◂ [ ] ) ⊢ 2'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	mov rax,r8
	mov r13,rax
	call ETR_82
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %560~2'(= {| l |} ) %559~3'(= {| l |} ) %558~1'(= {| l |} ) %553~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	add rdi,7
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_430+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_431+5-1]
	mov rcx,5
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_432+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	mov rax,r13
LB_434:
	cmp rax,0
	jz LB_435
	sub rax,1
	lea rsi,[LB_433+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_434
LB_435:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %565~4'(= {| l |} ) %564~3'(= {| l |} ) %563~1'(= {| l |} ) %562~2'(= {| l |} ) %561~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_429:
;; ?; 1'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<4)◂{ 2'(= a12◂ [ a9◂ [ ]{| l |}] ) 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 4'(= a8◂ [ a13◂ [ {| l |}]] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],1
	jnz LB_436
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov r10, QWORD [r14+24]
;; rsp=0 , %568~4'(= a8◂ [ a13◂ [ {| l |}]] ) %567~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %566~2'(= a12◂ [ a9◂ [ ]{| l |}] ) %553~0'(= r ) 
; #78 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] )
;; rsp=0 , %569~1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) %568~4'(= a8◂ [ a13◂ [ {| l |}]] ) %567~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %553~0'(= r ) 
; #97 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 1(<2)◂2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	call ETR_97
	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %570~1'(= {| l |} ) %568~4'(= a8◂ [ a13◂ [ {| l |}]] ) %567~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %553~0'(= r ) 
; #97 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_97
	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %571~2'(= {| l |} ) %570~1'(= {| l |} ) %568~4'(= a8◂ [ a13◂ [ {| l |}]] ) %553~0'(= r ) 
; #99 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 3'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
; .mov_ptn2 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r10
	mov r13,rax
	call ETR_99
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %572~3'(= {| l |} ) %571~2'(= {| l |} ) %570~1'(= {| l |} ) %553~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	add rdi,11
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_437+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_438+5-1]
	mov rcx,5
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_439+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_440+4-1]
	mov rcx,4
	rep movsb
	mov rax,r13
LB_442:
	cmp rax,0
	jz LB_443
	sub rax,1
	lea rsi,[LB_441+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_442
LB_443:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %577~4'(= {| l |} ) %576~3'(= {| l |} ) %575~2'(= {| l |} ) %574~1'(= {| l |} ) %573~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_436:
;; ?; 1'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<4)◂{ 2'(= a11◂ [ a9◂ [ ]] ) 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 4'(= a8◂ [ a13◂ [ {| l |}]] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],2
	jnz LB_444
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov r10, QWORD [r14+24]
;; rsp=0 , %580~4'(= a8◂ [ a13◂ [ {| l |}]] ) %579~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %578~2'(= a11◂ [ a9◂ [ ]] ) %553~0'(= r ) 
; #97 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_97
	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %581~1'(= {| l |} ) %580~4'(= a8◂ [ a13◂ [ {| l |}]] ) %578~2'(= a11◂ [ a9◂ [ ]] ) %553~0'(= r ) 
; #99 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 3'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
; .mov_ptn2 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r10
	mov r13,rax
	call ETR_99
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %582~3'(= {| l |} ) %581~1'(= {| l |} ) %578~2'(= a11◂ [ a9◂ [ ]] ) %553~0'(= r ) 
; #88 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
	mov rax,r8
	mov r13,rax
	call ETR_88
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %583~2'(= {| l |} ) %582~3'(= {| l |} ) %581~1'(= {| l |} ) %553~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	add rdi,10
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_445+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_446+5-1]
	mov rcx,5
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_447+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_448+3-1]
	mov rcx,3
	rep movsb
	mov rax,r13
LB_450:
	cmp rax,0
	jz LB_451
	sub rax,1
	lea rsi,[LB_449+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_450
LB_451:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %588~4'(= {| l |} ) %587~3'(= {| l |} ) %586~1'(= {| l |} ) %585~2'(= {| l |} ) %584~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_444:
;; ?; 1'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 3'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a13◂ [ {| l |}]] ) }
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov r10, QWORD [r14+24]
;; rsp=0 , %591~4'(= a2◂ [ a13◂ [ {| l |}]] ) %590~3'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %589~2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %553~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	add rdi,23
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_452+23-1]
	mov rcx,23
	rep movsb
	mov rax,r13
LB_454:
	cmp rax,0
	jz LB_455
	sub rax,1
	lea rsi,[LB_453+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_454
LB_455:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %593~1'(= {| l |} ) %592~0'(= r ) %591~4'(= a2◂ [ a13◂ [ {| l |}]] ) %590~3'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %589~2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
ETR_134: ;; pnt_lc_mtc { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t7◂{ _lst◂_t21◂_s8◂_t9 _t20◂_s8◂_t9 } }→{ _r64 _s8 })
;; rsp=0 , %595~1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %594~0'(= r ) 
;; ?; 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ { 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 4'(= a20◂ [ a9◂ [ ]{| l |}] ) } 5'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_456
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov r11, QWORD [r14+16]
;; rsp=0 , %598~5'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %597~4'(= a20◂ [ a9◂ [ ]{| l |}] ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %594~0'(= r ) 
; #134 { 0'(= r ) 5'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r9
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 0'(= r ) 5'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 5'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r11
	mov r14,rax
	call ETR_134
	mov r10,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %600~1'(= {| l |} ) %599~0'(= r ) %597~4'(= a20◂ [ a9◂ [ ]{| l |}] ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
;; ? 4'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<3)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r10
	cmp BYTE [rdi+6],0
	jnz LB_457
	mov r8,QWORD [rdi+8]
;; rsp=0 , %604~2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %600~1'(= {| l |} ) %599~0'(= r ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #134 { 0'(= r ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 { 0'(= r ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov r14,rax
	call ETR_134
	mov r9,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %606~2'(= {| l |} ) %605~0'(= r ) %600~1'(= {| l |} ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,9
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_458+9-1]
	mov rcx,9
	rep movsb
	mov rax,r13
LB_460:
	cmp rax,0
	jz LB_461
	sub rax,1
	lea rsi,[LB_459+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_460
LB_461:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %610~4'(= {| l |} ) %609~2'(= {| l |} ) %608~1'(= {| l |} ) %607~0'(= r ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_457:
;; ? 4'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<3)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r10
	cmp BYTE [rdi+6],1
	jnz LB_462
	mov r8, QWORD [r10+8]
	mov r11, QWORD [r10+16]
;; rsp=0 , %603~5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %602~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %600~1'(= {| l |} ) %599~0'(= r ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #97 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= {| l |} )
	sub rsp,32
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r11
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov r13,rax
	call ETR_97
	mov r11,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %611~2'(= {| l |} ) %603~5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %600~1'(= {| l |} ) %599~0'(= r ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #135 { 0'(= r ) 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 4'(= {| l |} ) }
	sub rsp,24
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 { 0'(= r ) 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r11
	mov r14,rax
	call ETR_135
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r10,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %613~4'(= {| l |} ) %612~0'(= r ) %611~2'(= {| l |} ) %600~1'(= {| l |} ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r10]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,14
	push rdi 
	call mlc_s8
	pop rdi
	mov r11,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r10+7+rcx]
	rep movsb
	lea rsi,[LB_463+5-1]
	mov rcx,5
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_464+9-1]
	mov rcx,9
	rep movsb
	mov rax,r13
LB_466:
	cmp rax,0
	jz LB_467
	sub rax,1
	lea rsi,[LB_465+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_466
LB_467:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %618~5'(= {| l |} ) %617~4'(= {| l |} ) %616~1'(= {| l |} ) %615~2'(= {| l |} ) %614~0'(= r ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 5'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 5'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 5'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r11
	mov r14,rax
	ret
LB_462:
;; ?. 4'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %601~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %600~1'(= {| l |} ) %599~0'(= r ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %619~0'(= r ) %601~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %600~1'(= {| l |} ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #132 { 0'(= r ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 { 0'(= r ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 2'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov r14,rax
	call ETR_132
	mov r9,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %621~2'(= {| l |} ) %620~0'(= r ) %600~1'(= {| l |} ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %622~0'(= r ) %621~2'(= {| l |} ) %600~1'(= {| l |} ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,9
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_468+9-1]
	mov rcx,9
	rep movsb
	mov rax,r13
LB_470:
	cmp rax,0
	jz LB_471
	sub rax,1
	lea rsi,[LB_469+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_470
LB_471:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %626~4'(= {| l |} ) %625~2'(= {| l |} ) %624~1'(= {| l |} ) %623~0'(= r ) %596~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_456:
;; ?; 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 3'(= a20◂ [ a9◂ [ ]{| l |}] ) }
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %628~3'(= a20◂ [ a9◂ [ ]{| l |}] ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %594~0'(= r ) 
;; ?; 3'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<3)◂1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_472
	mov r14,QWORD [rdi+8]
;; rsp=0 , %629~1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %594~0'(= r ) 
; #134 { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	call ETR_134
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %631~1'(= {| l |} ) %630~0'(= r ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,10
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_473+10-1]
	mov rcx,10
	rep movsb
	mov rax,r13
LB_475:
	cmp rax,0
	jz LB_476
	sub rax,1
	lea rsi,[LB_474+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_475
LB_476:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %634~3'(= {| l |} ) %633~1'(= {| l |} ) %632~0'(= r ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_472:
;; ?; 3'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<3)◂{ 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 4'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r9
	cmp BYTE [rdi+6],1
	jnz LB_477
	mov r14, QWORD [r9+8]
	mov r10, QWORD [r9+16]
;; rsp=0 , %636~4'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %635~1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %594~0'(= r ) 
; #97 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r14
	mov r13,rax
	call ETR_97
	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %637~1'(= {| l |} ) %636~4'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %594~0'(= r ) 
; #135 { 0'(= r ) 4'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 { 0'(= r ) 4'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 4'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r10
	mov r14,rax
	call ETR_135
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %639~3'(= {| l |} ) %638~0'(= r ) %637~1'(= {| l |} ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	add rdi,14
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_478+5-1]
	mov rcx,5
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_479+9-1]
	mov rcx,9
	rep movsb
	mov rax,r13
LB_481:
	cmp rax,0
	jz LB_482
	sub rax,1
	lea rsi,[LB_480+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_481
LB_482:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %643~4'(= {| l |} ) %642~3'(= {| l |} ) %641~1'(= {| l |} ) %640~0'(= r ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_477:
;; ?; 3'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov r14,QWORD [rdi+8]
;; rsp=0 , %644~1'(= a17◂ [ a9◂ [ ]{| l |}] ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %594~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %645~0'(= r ) %644~1'(= a17◂ [ a9◂ [ ]{| l |}] ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #132 { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	call ETR_132
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %647~1'(= {| l |} ) %646~0'(= r ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %648~0'(= r ) %647~1'(= {| l |} ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,10
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_483+10-1]
	mov rcx,10
	rep movsb
	mov rax,r13
LB_485:
	cmp rax,0
	jz LB_486
	sub rax,1
	lea rsi,[LB_484+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_485
LB_486:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %651~3'(= {| l |} ) %650~1'(= {| l |} ) %649~0'(= r ) %627~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
ETR_135: ;; pnt_lc_id_mtc { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t7◂{ _t8◂_t14◂_s8◂_t9 _lst◂_t21◂_s8◂_t9 _t20◂_s8◂_t9 } }→{ _r64 _s8 })
;; rsp=0 , %653~1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %652~0'(= r ) 
;; ?; 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ { 3'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 5'(= a20◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_487
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov r11, QWORD [r8+24]
	mov rcx, QWORD [r14+16]
;; rsp=0 , %657~6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %656~5'(= a20◂ [ a9◂ [ ]{| l |}] ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %654~3'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %652~0'(= r ) 
; #101 3'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	sub rsp,32
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r10
	mov QWORD [rsp+8*2],r11
	mov QWORD [rsp+8*3],rcx
; .mov_ptn2 3'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_101
	mov rcx,QWORD [rsp-8+8*4]
	mov r11,QWORD [rsp-8+8*3]
	mov r10,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %658~1'(= {| l |} ) %657~6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %656~5'(= a20◂ [ a9◂ [ ]{| l |}] ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %652~0'(= r ) 
; #135 { 0'(= r ) 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	sub rsp,24
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r10
	mov QWORD [rsp+8*2],r11
; .mov_ptn2 { 0'(= r ) 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,rcx
	mov r14,rax
	call ETR_135
	mov r11,QWORD [rsp-8+8*3]
	mov r10,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %660~2'(= {| l |} ) %659~0'(= r ) %658~1'(= {| l |} ) %656~5'(= a20◂ [ a9◂ [ ]{| l |}] ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
;; ? 5'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<3)◂3'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r11
	cmp BYTE [rdi+6],0
	jnz LB_488
	mov r9,QWORD [rdi+8]
;; rsp=0 , %664~3'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %660~2'(= {| l |} ) %659~0'(= r ) %658~1'(= {| l |} ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #134 { 0'(= r ) 3'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	sub rsp,24
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 { 0'(= r ) 3'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 3'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r9
	mov r14,rax
	call ETR_134
	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %666~3'(= {| l |} ) %665~0'(= r ) %660~2'(= {| l |} ) %658~1'(= {| l |} ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,9
	push rdi 
	call mlc_s8
	pop rdi
	mov r11,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_489+5-1]
	mov rcx,5
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_490+4-1]
	mov rcx,4
	rep movsb
	mov rax,r13
LB_492:
	cmp rax,0
	jz LB_493
	sub rax,1
	lea rsi,[LB_491+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_492
LB_493:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %671~5'(= {| l |} ) %670~3'(= {| l |} ) %669~2'(= {| l |} ) %668~1'(= {| l |} ) %667~0'(= r ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 5'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 5'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 5'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r11
	mov r14,rax
	ret
LB_488:
;; ? 5'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<3)◂{ 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r11
	cmp BYTE [rdi+6],1
	jnz LB_494
	mov r9, QWORD [r11+8]
	mov rcx, QWORD [r11+16]
;; rsp=0 , %663~6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %662~3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %660~2'(= {| l |} ) %659~0'(= r ) %658~1'(= {| l |} ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #97 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 3'(= {| l |} )
	sub rsp,40
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r10
	mov QWORD [rsp+8*4],rcx
; .mov_ptn2 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 3'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_97
	mov rcx,QWORD [rsp-8+8*5]
	mov r10,QWORD [rsp-8+8*4]
	mov r8,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,40
;; rsp=0 , %672~3'(= {| l |} ) %663~6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %660~2'(= {| l |} ) %659~0'(= r ) %658~1'(= {| l |} ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #135 { 0'(= r ) 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 5'(= {| l |} ) }
	sub rsp,32
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r10
; .mov_ptn2 { 0'(= r ) 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,rcx
	mov r14,rax
	call ETR_135
	mov r10,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r11,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %674~5'(= {| l |} ) %673~0'(= r ) %672~3'(= {| l |} ) %660~2'(= {| l |} ) %658~1'(= {| l |} ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r11]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,14
	push rdi 
	call mlc_s8
	pop rdi
	mov rcx,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r11+7+rcx]
	rep movsb
	lea rsi,[LB_495+5-1]
	mov rcx,5
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_496+9-1]
	mov rcx,9
	rep movsb
	mov rax,r13
LB_498:
	cmp rax,0
	jz LB_499
	sub rax,1
	lea rsi,[LB_497+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_498
LB_499:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %679~6'(= {| l |} ) %678~5'(= {| l |} ) %677~2'(= {| l |} ) %676~3'(= {| l |} ) %675~0'(= r ) %658~1'(= {| l |} ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 6'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 6'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 6'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,rcx
	mov r14,rax
	ret
LB_494:
;; ?. 5'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂3'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov r9,QWORD [rdi+8]
;; rsp=0 , %661~3'(= a17◂ [ a9◂ [ ]{| l |}] ) %660~2'(= {| l |} ) %659~0'(= r ) %658~1'(= {| l |} ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %680~0'(= r ) %661~3'(= a17◂ [ a9◂ [ ]{| l |}] ) %660~2'(= {| l |} ) %658~1'(= {| l |} ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #132 { 0'(= r ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	sub rsp,24
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 { 0'(= r ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 3'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r9
	mov r14,rax
	call ETR_132
	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %682~3'(= {| l |} ) %681~0'(= r ) %660~2'(= {| l |} ) %658~1'(= {| l |} ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %683~0'(= r ) %682~3'(= {| l |} ) %660~2'(= {| l |} ) %658~1'(= {| l |} ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,9
	push rdi 
	call mlc_s8
	pop rdi
	mov r11,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_500+9-1]
	mov rcx,9
	rep movsb
	mov rax,r13
LB_502:
	cmp rax,0
	jz LB_503
	sub rax,1
	lea rsi,[LB_501+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_502
LB_503:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %687~5'(= {| l |} ) %686~3'(= {| l |} ) %685~2'(= {| l |} ) %684~0'(= r ) %658~1'(= {| l |} ) %655~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 5'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 5'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 5'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r11
	mov r14,rax
	ret
LB_487:
;; ?; 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 4'(= a20◂ [ a9◂ [ ]{| l |}] ) }
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov r10, QWORD [r14+24]
;; rsp=0 , %690~4'(= a20◂ [ a9◂ [ ]{| l |}] ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %688~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %652~0'(= r ) 
;; ?; 4'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<3)◂1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r10
	cmp BYTE [rdi+6],0
	jnz LB_504
	mov r14,QWORD [rdi+8]
;; rsp=0 , %691~1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %688~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %652~0'(= r ) 
; #101 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov r13,rax
	call ETR_101
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %692~2'(= {| l |} ) %691~1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %652~0'(= r ) 
; #134 { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r8
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	call ETR_134
	mov r9,QWORD [rsp-8+8*2]
	mov r8,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %694~1'(= {| l |} ) %693~0'(= r ) %692~2'(= {| l |} ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,10
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_505+10-1]
	mov rcx,10
	rep movsb
	mov rax,r13
LB_507:
	cmp rax,0
	jz LB_508
	sub rax,1
	lea rsi,[LB_506+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_507
LB_508:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %697~4'(= {| l |} ) %696~1'(= {| l |} ) %695~0'(= r ) %692~2'(= {| l |} ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_504:
;; ?; 4'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<3)◂{ 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r10
	cmp BYTE [rdi+6],1
	jnz LB_509
	mov r14, QWORD [r10+8]
	mov r11, QWORD [r10+16]
;; rsp=0 , %699~5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %698~1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %688~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %652~0'(= r ) 
; #97 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= {| l |} )
	sub rsp,32
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r11
; .mov_ptn2 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 1'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r14
	mov r13,rax
	call ETR_97
	mov r11,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %700~1'(= {| l |} ) %699~5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %688~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %652~0'(= r ) 
; #135 { 0'(= r ) 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 4'(= {| l |} ) }
	sub rsp,24
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 { 0'(= r ) 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 5'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r11
	mov r14,rax
	call ETR_135
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r10,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %702~4'(= {| l |} ) %701~0'(= r ) %700~1'(= {| l |} ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %688~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r10]
	add rdi,rax 
	push rax
	add rdi,14
	push rdi 
	call mlc_s8
	pop rdi
	mov r11,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r10+7+rcx]
	rep movsb
	lea rsi,[LB_510+5-1]
	mov rcx,5
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_511+9-1]
	mov rcx,9
	rep movsb
	mov rax,r13
LB_513:
	cmp rax,0
	jz LB_514
	sub rax,1
	lea rsi,[LB_512+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_513
LB_514:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %706~5'(= {| l |} ) %705~4'(= {| l |} ) %704~1'(= {| l |} ) %703~0'(= r ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %688~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 5'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 5'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 5'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r11
	mov r14,rax
	ret
LB_509:
;; ?; 4'(= a20◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov r14,QWORD [rdi+8]
;; rsp=0 , %707~1'(= a17◂ [ a9◂ [ ]{| l |}] ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %688~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %652~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %708~0'(= r ) %707~1'(= a17◂ [ a9◂ [ ]{| l |}] ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %688~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; #132 { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r8
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	call ETR_132
	mov r9,QWORD [rsp-8+8*2]
	mov r8,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %710~1'(= {| l |} ) %709~0'(= r ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %688~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %711~0'(= r ) %710~1'(= {| l |} ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %688~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,10
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_515+10-1]
	mov rcx,10
	rep movsb
	mov rax,r13
LB_517:
	cmp rax,0
	jz LB_518
	sub rax,1
	lea rsi,[LB_516+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_517
LB_518:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %714~4'(= {| l |} ) %713~1'(= {| l |} ) %712~0'(= r ) %689~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %688~2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
ETR_157: ;; pnt { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _lst◂{ _s8 _t24◂_s8◂_t9 } }→{ _r64 _s8 })
;; rsp=0 , %716~1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %715~0'(= r ) 
;; ?; 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ { 3'(= {| l |} ) 4'(= a24◂ [ a9◂ [ ]{| l |}] ) } 5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_519
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov r11, QWORD [r14+16]
;; rsp=0 , %719~5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %718~4'(= a24◂ [ a9◂ [ ]{| l |}] ) %717~3'(= {| l |} ) %715~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %720~0'(= r ) %719~5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %718~4'(= a24◂ [ a9◂ [ ]{| l |}] ) %717~3'(= {| l |} ) 
; #158 { 0'(= r ) 4'(= a24◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r9
	mov QWORD [rsp+8*1],r11
; .mov_ptn2 { 0'(= r ) 4'(= a24◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a24◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a24◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a24◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_158
	mov r11,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %722~1'(= {| l |} ) %721~0'(= r ) %719~5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %717~3'(= {| l |} ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %723~0'(= r ) %722~1'(= {| l |} ) %719~5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %717~3'(= {| l |} ) 
; #157 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 5'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r11
	mov r14,rax
	call ETR_157
	mov r9,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %725~2'(= {| l |} ) %724~0'(= r ) %722~1'(= {| l |} ) %717~3'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,3
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
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_520+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_521+2-1]
	mov rcx,2
	rep movsb
	mov rax,r13
LB_523:
	cmp rax,0
	jz LB_524
	sub rax,1
	lea rsi,[LB_522+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_523
LB_524:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %730~4'(= {| l |} ) %729~2'(= {| l |} ) %728~1'(= {| l |} ) %727~3'(= {| l |} ) %726~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_519:
;; ?; 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %715~0'(= r ) 
	jmp LB_525
LB_525:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %731~%[ "" ] %715~0'(= r ) 
; ∎ { 0'(= r ) %[ "" ] }
; .mov_ptn2 { 0'(= r ) %[ "" ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn %[ "" ] ⊢ 1'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r14,rax
	ret
ETR_158: ;; pnt_etr { 0'(= r ) 1'(= a24◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t24◂_s8◂_t9 }→{ _r64 _s8 })
;; rsp=0 , %733~1'(= a24◂ [ a9◂ [ ]{| l |}] ) %732~0'(= r ) 
;; ?; 1'(= a24◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂2'(= a25◂ [ a9◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_526
	mov r8,QWORD [rdi+8]
;; rsp=0 , %734~2'(= a25◂ [ a9◂ [ ]{| l |}] ) %732~0'(= r ) 
; #159 { 0'(= r ) 2'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a25◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 2'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a25◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov r14,rax
	call ETR_159
;; rsp=0 , %736~1'(= {| l |} ) %735~0'(= r ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
LB_526:
;; ?; 1'(= a24◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂2'(= a26◂ [ a9◂ [ ]{| l |}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %737~2'(= a26◂ [ a9◂ [ ]{| l |}] ) %732~0'(= r ) 
; #160 { 0'(= r ) 2'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a26◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 2'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a26◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov r14,rax
	call ETR_160
;; rsp=0 , %739~1'(= {| l |} ) %738~0'(= r ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
ETR_159: ;; pnt_cnc { 0'(= r ) 1'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t25◂_s8◂_t9 }→{ _r64 _s8 })
;; rsp=0 , %741~1'(= a25◂ [ a9◂ [ ]{| l |}] ) %740~0'(= r ) 
;; ?; 1'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂{ 2'(= a3◂ [ {| l |}] ) 3'(= a27◂ [ ] ) 4'(= a28◂ [ a9◂ [ ]] ) 5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) 6'(= a25◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_527
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov r10, QWORD [r14+24]
	mov r11, QWORD [r14+32]
	mov rcx, QWORD [r14+40]
;; rsp=0 , %746~6'(= a25◂ [ a9◂ [ ]{| l |}] ) %745~5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) %744~4'(= a28◂ [ a9◂ [ ]] ) %743~3'(= a27◂ [ ] ) %742~2'(= a3◂ [ {| l |}] ) %740~0'(= r ) 
; #159 { 0'(= r ) 6'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,32
	mov QWORD [rsp+8*0],r8
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r10
	mov QWORD [rsp+8*3],r11
; .mov_ptn2 { 0'(= r ) 6'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a25◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 6'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a25◂ [ a9◂ [ ]{| l |}] )
	mov rax,rcx
	mov r14,rax
	call ETR_159
	mov r11,QWORD [rsp-8+8*4]
	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov r8,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %748~1'(= {| l |} ) %747~0'(= r ) %745~5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) %744~4'(= a28◂ [ a9◂ [ ]] ) %743~3'(= a27◂ [ ] ) %742~2'(= a3◂ [ {| l |}] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,7
	push rdi 
	call mlc_s8
	pop rdi
	mov rcx,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_528+7-1]
	mov rcx,7
	rep movsb
	mov rax,r13
LB_530:
	cmp rax,0
	jz LB_531
	sub rax,1
	lea rsi,[LB_529+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_530
LB_531:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %751~6'(= {| l |} ) %750~1'(= {| l |} ) %749~0'(= r ) %745~5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) %744~4'(= a28◂ [ a9◂ [ ]] ) %743~3'(= a27◂ [ ] ) %742~2'(= a3◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 6'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 6'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 6'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,rcx
	mov r14,rax
	ret
LB_527:
;; ?; 1'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂{ 2'(= a3◂ [ {| l |}] ) 3'(= a27◂ [ ] ) 4'(= a28◂ [ a9◂ [ ]] ) 5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) }
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov r10, QWORD [r14+24]
	mov r11, QWORD [r14+32]
;; rsp=0 , %755~5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) %754~4'(= a28◂ [ a9◂ [ ]] ) %753~3'(= a27◂ [ ] ) %752~2'(= a3◂ [ {| l |}] ) %740~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	add rdi,9
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_532+9-1]
	mov rcx,9
	rep movsb
	mov rax,r13
LB_534:
	cmp rax,0
	jz LB_535
	sub rax,1
	lea rsi,[LB_533+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_534
LB_535:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %757~1'(= {| l |} ) %756~0'(= r ) %755~5'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) %754~4'(= a28◂ [ a9◂ [ ]] ) %753~3'(= a27◂ [ ] ) %752~2'(= a3◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
ETR_160: ;; pnt_act { 0'(= r ) 1'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t26◂_s8◂_t9 }→{ _r64 _s8 })
;; rsp=0 , %759~1'(= a26◂ [ a9◂ [ ]{| l |}] ) %758~0'(= r ) 
;; ?; 1'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) 5'(= a27◂ [ ] ) 6'(= a28◂ [ a9◂ [ ]] ) 7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) 8'(= a26◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_536
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov r10, QWORD [r14+24]
	mov r11, QWORD [r14+32]
	mov rcx, QWORD [r14+40]
	mov rdx, QWORD [r14+48]
	sub rsp,8
	MOV_RDI QWORD [rsp-8+8*1], QWORD [r14+56]
;; rsp=1 , %766~8'(= a26◂ [ a9◂ [ ]{| l |}] ) %765~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %764~6'(= a28◂ [ a9◂ [ ]] ) %763~5'(= a27◂ [ ] ) %762~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %761~3'(= a8◂ [ a13◂ [ {| l |}]] ) %760~2'(= a2◂ [ a13◂ [ {| l |}]] ) %758~0'(= r ) 
; #99 3'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 1'(= {| l |} )
	sub rsp,48
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
	mov QWORD [rsp+8*3],r11
	mov QWORD [rsp+8*4],rcx
	mov QWORD [rsp+8*5],rdx
; .mov_ptn2 3'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 3'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_99
	mov rdx,QWORD [rsp-8+8*6]
	mov rcx,QWORD [rsp-8+8*5]
	mov r11,QWORD [rsp-8+8*4]
	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,48
;; rsp=1 , %767~1'(= {| l |} ) %766~8'(= a26◂ [ a9◂ [ ]{| l |}] ) %765~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %764~6'(= a28◂ [ a9◂ [ ]] ) %763~5'(= a27◂ [ ] ) %762~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %760~2'(= a2◂ [ a13◂ [ {| l |}]] ) %758~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=1 , %768~0'(= r ) %767~1'(= {| l |} ) %766~8'(= a26◂ [ a9◂ [ ]{| l |}] ) %765~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %764~6'(= a28◂ [ a9◂ [ ]] ) %763~5'(= a27◂ [ ] ) %762~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %760~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; #132 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	sub rsp,40
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r11
	mov QWORD [rsp+8*3],rcx
	mov QWORD [rsp+8*4],rdx
; .mov_ptn2 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_132
	mov rdx,QWORD [rsp-8+8*5]
	mov rcx,QWORD [rsp-8+8*4]
	mov r11,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,40
;; rsp=1 , %770~3'(= {| l |} ) %769~0'(= r ) %767~1'(= {| l |} ) %766~8'(= a26◂ [ a9◂ [ ]{| l |}] ) %765~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %764~6'(= a28◂ [ a9◂ [ ]] ) %763~5'(= a27◂ [ ] ) %760~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=1 , %771~0'(= r ) %770~3'(= {| l |} ) %767~1'(= {| l |} ) %766~8'(= a26◂ [ a9◂ [ ]{| l |}] ) %765~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %764~6'(= a28◂ [ a9◂ [ ]] ) %763~5'(= a27◂ [ ] ) %760~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; #160 { 0'(= r ) 8'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 4'(= {| l |} ) }
	sub rsp,48
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r11
	mov QWORD [rsp+8*4],rcx
	mov QWORD [rsp+8*5],rdx
; .mov_ptn2 { 0'(= r ) 8'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a26◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 8'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a26◂ [ a9◂ [ ]{| l |}] )
	mov rax,QWORD [rsp-8+8*7]
	mov r14,rax
	call ETR_160
	mov rdx,QWORD [rsp-8+8*6]
	mov rcx,QWORD [rsp-8+8*5]
	mov r11,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r10,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,56
;; rsp=0 , %773~4'(= {| l |} ) %772~0'(= r ) %770~3'(= {| l |} ) %767~1'(= {| l |} ) %765~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %764~6'(= a28◂ [ a9◂ [ ]] ) %763~5'(= a27◂ [ ] ) %760~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	sub rsp,8
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r10]
	add rdi,rax 
	push rax
	add rdi,12
	push rdi 
	call mlc_s8
	pop rdi
	mov QWORD [rsp-8+8*4],rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r10+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_537+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_538+11-1]
	mov rcx,11
	rep movsb
	mov rax,r13
LB_540:
	cmp rax,0
	jz LB_541
	sub rax,1
	lea rsi,[LB_539+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_540
LB_541:
	mov rcx,QWORD [tmp] 
;; rsp=1 , %778~8'(= {| l |} ) %777~4'(= {| l |} ) %776~3'(= {| l |} ) %775~1'(= {| l |} ) %774~0'(= r ) %765~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %764~6'(= a28◂ [ a9◂ [ ]] ) %763~5'(= a27◂ [ ] ) %760~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; ∎ { 0'(= r ) 8'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 8'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 8'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,QWORD [rsp-8+8*1]
	mov r14,rax
	add rsp,8
	ret
LB_536:
;; ?; 1'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) 5'(= a27◂ [ ] ) 6'(= a28◂ [ a9◂ [ ]] ) 7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) }
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov r10, QWORD [r14+24]
	mov r11, QWORD [r14+32]
	mov rcx, QWORD [r14+40]
	mov rdx, QWORD [r14+48]
;; rsp=0 , %784~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %783~6'(= a28◂ [ a9◂ [ ]] ) %782~5'(= a27◂ [ ] ) %781~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %780~3'(= a8◂ [ a13◂ [ {| l |}]] ) %779~2'(= a2◂ [ a13◂ [ {| l |}]] ) %758~0'(= r ) 
; #99 3'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 1'(= {| l |} )
	sub rsp,48
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
	mov QWORD [rsp+8*3],r11
	mov QWORD [rsp+8*4],rcx
	mov QWORD [rsp+8*5],rdx
; .mov_ptn2 3'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 3'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r9
	mov r13,rax
	call ETR_99
	mov rdx,QWORD [rsp-8+8*6]
	mov rcx,QWORD [rsp-8+8*5]
	mov r11,QWORD [rsp-8+8*4]
	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,48
;; rsp=0 , %785~1'(= {| l |} ) %784~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %783~6'(= a28◂ [ a9◂ [ ]] ) %782~5'(= a27◂ [ ] ) %781~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %779~2'(= a2◂ [ a13◂ [ {| l |}]] ) %758~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %786~0'(= r ) %785~1'(= {| l |} ) %784~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %783~6'(= a28◂ [ a9◂ [ ]] ) %782~5'(= a27◂ [ ] ) %781~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %779~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; #132 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	sub rsp,40
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r11
	mov QWORD [rsp+8*3],rcx
	mov QWORD [rsp+8*4],rdx
; .mov_ptn2 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_132
	mov rdx,QWORD [rsp-8+8*5]
	mov rcx,QWORD [rsp-8+8*4]
	mov r11,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,40
;; rsp=0 , %788~3'(= {| l |} ) %787~0'(= r ) %785~1'(= {| l |} ) %784~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %783~6'(= a28◂ [ a9◂ [ ]] ) %782~5'(= a27◂ [ ] ) %779~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %789~0'(= r ) %788~3'(= {| l |} ) %785~1'(= {| l |} ) %784~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %783~6'(= a28◂ [ a9◂ [ ]] ) %782~5'(= a27◂ [ ] ) %779~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	add rdi,13
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_542+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_543+12-1]
	mov rcx,12
	rep movsb
	mov rax,r13
LB_545:
	cmp rax,0
	jz LB_546
	sub rax,1
	lea rsi,[LB_544+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_545
LB_546:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %793~4'(= {| l |} ) %792~3'(= {| l |} ) %791~1'(= {| l |} ) %790~0'(= r ) %784~7'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %783~6'(= a28◂ [ a9◂ [ ]] ) %782~5'(= a27◂ [ ] ) %779~2'(= a2◂ [ a13◂ [ {| l |}]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
ETR_163: ;; act_regs { } ⊢ 0'(= a2◂ [ a13◂ [ {| l |}]] ) : ({ }→_lst◂_t13◂_s8)
;; rsp=0 , 
	jmp LB_547
LB_547:
; $ %[ "_r" ] ⊢ %[ "_r" ]
;; rsp=0 , %814~%[ "_r" ] 
	jmp LB_548
LB_548:
; $ %[ "_n" ] ⊢ %[ "_n" ]
;; rsp=0 , %815~%[ "_n" ] %814~%[ "_r" ] 
; #89 %[ "_r" ] ⊢ 1(<2)◂%[ "_r" ]
;; rsp=0 , %816~1(<2)◂%[ "_r" ] %815~%[ "_n" ] 
; #89 %[ "_n" ] ⊢ 1(<2)◂%[ "_n" ]
;; rsp=0 , %817~1(<2)◂%[ "_n" ] %816~1(<2)◂%[ "_r" ] 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %818~1(<2)◂{ } %817~1(<2)◂%[ "_n" ] %816~1(<2)◂%[ "_r" ] 
; #21 { 1(<2)◂%[ "_r" ] 1(<2)◂{ } } ⊢ 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } }
;; rsp=0 , %819~0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } %817~1(<2)◂%[ "_n" ] 
; #21 { 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } } ⊢ 0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } }
;; rsp=0 , %820~0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } } 
; ∎ 0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } }
; .mov_ptn2 0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } } ⊢ 0'(= a2◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂{ 1(<2)◂%[ "_n" ] 0(<2)◂{ 1(<2)◂%[ "_r" ] 1(<2)◂{ } } } ⊢ 0'(= a2◂ [ a13◂ [ {| l |}]] )
	ALC_RCD 2
	mov r14,rax
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],95
	mov BYTE [rax+8+1],110
	mov BYTE [rax+6],1
	mov QWORD [r14+8+8*0],rax
	ALC_RCD 2
	mov r8,rax
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],2
	mov BYTE [rax+8+0],95
	mov BYTE [rax+8+1],114
	mov BYTE [rax+6],1
	mov QWORD [r8+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r8+8+8*1],rax
	mov rax,r8
	mov BYTE [rax+6],0
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov r13,rax
	ret
ETR_177: ;; pnt { 0'(= r ) 1'(= a2◂ [ a31◂ [ ]] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _lst◂_t31 }→{ _r64 _s8 })
;; rsp=0 , %822~1'(= a2◂ [ a31◂ [ ]] ) %821~0'(= r ) 
;; ?; 1'(= a2◂ [ a31◂ [ ]] ) ⊢ 1(<2)◂{ }
	mov rdi,r14
	cmp BYTE [rdi+6],1
	jnz LB_549
;; rsp=0 , %821~0'(= r ) 
	jmp LB_550
LB_550:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %823~%[ "" ] %821~0'(= r ) 
; ∎ { 0'(= r ) %[ "" ] }
; .mov_ptn2 { 0'(= r ) %[ "" ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn %[ "" ] ⊢ 1'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r14,rax
	ret
LB_549:
;; ?; 1'(= a2◂ [ a31◂ [ ]] ) ⊢ 0(<2)◂{ 2'(= a31◂ [ ] ) 3'(= a2◂ [ a31◂ [ ]] ) }
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %825~3'(= a2◂ [ a31◂ [ ]] ) %824~2'(= a31◂ [ ] ) %821~0'(= r ) 
; #178 { 0'(= r ) 2'(= a31◂ [ ] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r9
; .mov_ptn2 { 0'(= r ) 2'(= a31◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a31◂ [ ] ) }
; .mov_ptn 2'(= a31◂ [ ] ) ⊢ 1'(= a31◂ [ ] )
	mov rax,r8
	mov r14,rax
	call ETR_178
	mov r9,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %827~1'(= {| l |} ) %826~0'(= r ) %825~3'(= a2◂ [ a31◂ [ ]] ) 
; #177 { 0'(= r ) 3'(= a2◂ [ a31◂ [ ]] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 { 0'(= r ) 3'(= a2◂ [ a31◂ [ ]] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ a31◂ [ ]] ) }
; .mov_ptn 3'(= a2◂ [ a31◂ [ ]] ) ⊢ 1'(= a2◂ [ a31◂ [ ]] )
	mov rax,r9
	mov r14,rax
	call ETR_177
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %829~2'(= {| l |} ) %828~0'(= r ) %827~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,0
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %832~3'(= {| l |} ) %831~2'(= {| l |} ) %830~1'(= {| l |} ) %828~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
ETR_178: ;; pnt_glb_etr { 0'(= r ) 1'(= a31◂ [ ] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t31 }→{ _r64 _s8 })
;; rsp=0 , %834~1'(= a31◂ [ ] ) %833~0'(= r ) 
;; ?; 1'(= a31◂ [ ] ) ⊢ 0(<6)◂{ 2'(= {| l |} ) 3'(= a32◂ [ ] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_551
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %836~3'(= a32◂ [ ] ) %835~2'(= {| l |} ) %833~0'(= r ) 
;; ?; 3'(= a32◂ [ ] ) ⊢ 0(<2)◂1'(= a2◂ [ a31◂ [ ]] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_552
	mov r14,QWORD [rdi+8]
;; rsp=0 , %837~1'(= a2◂ [ a31◂ [ ]] ) %835~2'(= {| l |} ) %833~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %838~0'(= r ) %837~1'(= a2◂ [ a31◂ [ ]] ) %835~2'(= {| l |} ) 
; #177 { 0'(= r ) 1'(= a2◂ [ a31◂ [ ]] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 1'(= a2◂ [ a31◂ [ ]] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ a31◂ [ ]] ) }
	call ETR_177
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %840~1'(= {| l |} ) %839~0'(= r ) %835~2'(= {| l |} ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %841~0'(= r ) %840~1'(= {| l |} ) %835~2'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	add rdi,14
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_553+8-1]
	mov rcx,8
	rep movsb
	mov rax,r13
LB_555:
	cmp rax,0
	jz LB_556
	sub rax,1
	lea rsi,[LB_554+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_555
LB_556:
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_557+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_558+5-1]
	mov rcx,5
	rep movsb
	mov rax,r13
LB_560:
	cmp rax,0
	jz LB_561
	sub rax,1
	lea rsi,[LB_559+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_560
LB_561:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %845~3'(= {| l |} ) %844~1'(= {| l |} ) %843~2'(= {| l |} ) %842~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_552:
;; ?; 3'(= a32◂ [ ] ) ⊢ 1(<2)◂1'(= a9◂ [ ] )
	mov r14,QWORD [rdi+8]
;; rsp=0 , %846~1'(= a9◂ [ ] ) %835~2'(= {| l |} ) %833~0'(= r ) 
; #82 1'(= a9◂ [ ] ) ⊢ 1'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 1'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
; .mov_ptn 1'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_82
	mov r8,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %847~1'(= {| l |} ) %835~2'(= {| l |} ) %833~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,9
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_562+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_563+3-1]
	mov rcx,3
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_564+5-1]
	mov rcx,5
	rep movsb
	mov rax,r13
LB_566:
	cmp rax,0
	jz LB_567
	sub rax,1
	lea rsi,[LB_565+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_566
LB_567:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %851~3'(= {| l |} ) %850~1'(= {| l |} ) %849~2'(= {| l |} ) %848~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_551:
;; ?; 1'(= a31◂ [ ] ) ⊢ 1(<6)◂2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r14
	cmp BYTE [rdi+6],1
	jnz LB_568
	mov r8,QWORD [rdi+8]
;; rsp=0 , %852~2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %833~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %853~0'(= r ) %852~2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) 
; #157 { 0'(= r ) 2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov r14,rax
	call ETR_157
;; rsp=0 , %855~1'(= {| l |} ) %854~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %856~0'(= r ) %855~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,8
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_569+8-1]
	mov rcx,8
	rep movsb
	mov rax,r13
LB_571:
	cmp rax,0
	jz LB_572
	sub rax,1
	lea rsi,[LB_570+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_571
LB_572:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %859~2'(= {| l |} ) %858~1'(= {| l |} ) %857~0'(= r ) 
; ∎ { 0'(= r ) 2'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
LB_568:
;; ?; 1'(= a31◂ [ ] ) ⊢ 2(<6)◂{ 2'(= {| l |} ) 3'(= a33◂ [ ] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],2
	jnz LB_573
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %861~3'(= a33◂ [ ] ) %860~2'(= {| l |} ) %833~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %862~0'(= r ) %861~3'(= a33◂ [ ] ) %860~2'(= {| l |} ) 
; #184 { 0'(= r ) 3'(= a33◂ [ ] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 3'(= a33◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a33◂ [ ] ) }
; .mov_ptn 3'(= a33◂ [ ] ) ⊢ 1'(= a33◂ [ ] )
	mov rax,r9
	mov r14,rax
	call ETR_184
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %864~1'(= {| l |} ) %863~0'(= r ) %860~2'(= {| l |} ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %865~0'(= r ) %864~1'(= {| l |} ) %860~2'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,3
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_574+3-1]
	mov rcx,3
	rep movsb
	mov rax,r13
LB_576:
	cmp rax,0
	jz LB_577
	sub rax,1
	lea rsi,[LB_575+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_576
LB_577:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %869~3'(= {| l |} ) %868~1'(= {| l |} ) %867~2'(= {| l |} ) %866~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_573:
;; ?; 1'(= a31◂ [ ] ) ⊢ 3(<6)◂2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r14
	cmp BYTE [rdi+6],3
	jnz LB_578
	mov r8,QWORD [rdi+8]
;; rsp=0 , %870~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %833~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %871~0'(= r ) %870~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) 
; #185 { 0'(= r ) 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov r14,rax
	call ETR_185
;; rsp=0 , %873~1'(= {| l |} ) %872~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %874~0'(= r ) %873~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,4
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_579+4-1]
	mov rcx,4
	rep movsb
	mov rax,r13
LB_581:
	cmp rax,0
	jz LB_582
	sub rax,1
	lea rsi,[LB_580+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_581
LB_582:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %877~2'(= {| l |} ) %876~1'(= {| l |} ) %875~0'(= r ) 
; ∎ { 0'(= r ) 2'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
LB_578:
;; ?; 1'(= a31◂ [ ] ) ⊢ 4(<6)◂{ 2'(= {| l |} ) 3'(= a34◂ [ ] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],4
	jnz LB_583
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %879~3'(= a34◂ [ ] ) %878~2'(= {| l |} ) %833~0'(= r ) 
;; ?; 3'(= a34◂ [ ] ) ⊢ 0(<2)◂{ 1'(= a2◂ [ {| l |}] ) 4'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_584
	mov r14, QWORD [r9+8]
	mov r10, QWORD [r9+16]
;; rsp=0 , %881~4'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %880~1'(= a2◂ [ {| l |}] ) %878~2'(= {| l |} ) %833~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %882~0'(= r ) %881~4'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %880~1'(= a2◂ [ {| l |}] ) %878~2'(= {| l |} ) 
; #181 { 0'(= r ) 4'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 { 0'(= r ) 4'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
; .mov_ptn 4'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] )
	mov rax,r10
	mov r14,rax
	call ETR_181
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %884~3'(= {| l |} ) %883~0'(= r ) %880~1'(= a2◂ [ {| l |}] ) %878~2'(= {| l |} ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %885~0'(= r ) %884~3'(= {| l |} ) %880~1'(= a2◂ [ {| l |}] ) %878~2'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	add rdi,4
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_585+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_586+3-1]
	mov rcx,3
	rep movsb
	mov rax,r13
LB_588:
	cmp rax,0
	jz LB_589
	sub rax,1
	lea rsi,[LB_587+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_588
LB_589:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %889~4'(= {| l |} ) %888~3'(= {| l |} ) %887~2'(= {| l |} ) %886~0'(= r ) %880~1'(= a2◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_584:
;; ?; 3'(= a34◂ [ ] ) ⊢ 1(<2)◂{ 1'(= a2◂ [ {| l |}] ) 4'(= a23◂ [ ] ) }
	mov r14, QWORD [r9+8]
	mov r10, QWORD [r9+16]
;; rsp=0 , %891~4'(= a23◂ [ ] ) %890~1'(= a2◂ [ {| l |}] ) %878~2'(= {| l |} ) %833~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,10
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_590+7-1]
	mov rcx,7
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_591+3-1]
	mov rcx,3
	rep movsb
	mov rax,r13
LB_593:
	cmp rax,0
	jz LB_594
	sub rax,1
	lea rsi,[LB_592+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_593
LB_594:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %894~3'(= {| l |} ) %893~2'(= {| l |} ) %892~0'(= r ) %891~4'(= a23◂ [ ] ) %890~1'(= a2◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
LB_583:
;; ?; 1'(= a31◂ [ ] ) ⊢ 5(<6)◂2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %895~2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %833~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %896~0'(= r ) %895~2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) 
; #179 { 0'(= r ) 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
; .mov_ptn 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
	mov rax,r8
	mov r14,rax
	call ETR_179
;; rsp=0 , %898~1'(= {| l |} ) %897~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %899~0'(= r ) %898~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,3
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_595+3-1]
	mov rcx,3
	rep movsb
	mov rax,r13
LB_597:
	cmp rax,0
	jz LB_598
	sub rax,1
	lea rsi,[LB_596+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_597
LB_598:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %902~2'(= {| l |} ) %901~1'(= {| l |} ) %900~0'(= r ) 
; ∎ { 0'(= r ) 2'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
ETR_179: ;; pnt_dt_qlq_etr { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _lst◂{ _s8 _t34 } }→{ _r64 _s8 })
;; rsp=0 , %904~1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %903~0'(= r ) 
;; ?; 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 0(<2)◂{ { 3'(= {| l |} ) 4'(= a34◂ [ ] ) } 5'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_599
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov r11, QWORD [r14+16]
;; rsp=0 , %907~5'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %906~4'(= a34◂ [ ] ) %905~3'(= {| l |} ) %903~0'(= r ) 
; #179 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r9
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
; .mov_ptn 5'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
	mov rax,r11
	mov r14,rax
	call ETR_179
	mov r10,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %909~1'(= {| l |} ) %908~0'(= r ) %906~4'(= a34◂ [ ] ) %905~3'(= {| l |} ) 
;; ?; 4'(= a34◂ [ ] ) ⊢ 0(<2)◂{ 2'(= a2◂ [ {| l |}] ) 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
	mov rdi,r10
	cmp BYTE [rdi+6],0
	jnz LB_600
	mov r8, QWORD [r10+8]
	mov r11, QWORD [r10+16]
;; rsp=0 , %911~5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %910~2'(= a2◂ [ {| l |}] ) %909~1'(= {| l |} ) %908~0'(= r ) %905~3'(= {| l |} ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %912~0'(= r ) %911~5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %910~2'(= a2◂ [ {| l |}] ) %909~1'(= {| l |} ) %905~3'(= {| l |} ) 
; #181 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 4'(= {| l |} ) }
	sub rsp,24
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
; .mov_ptn 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] )
	mov rax,r11
	mov r14,rax
	call ETR_181
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r10,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %914~4'(= {| l |} ) %913~0'(= r ) %910~2'(= a2◂ [ {| l |}] ) %909~1'(= {| l |} ) %905~3'(= {| l |} ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %915~0'(= r ) %914~4'(= {| l |} ) %910~2'(= a2◂ [ {| l |}] ) %909~1'(= {| l |} ) %905~3'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r10]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,3
	push rdi 
	call mlc_s8
	pop rdi
	mov r11,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r10+7+rcx]
	rep movsb
	lea rsi,[LB_601+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_602+2-1]
	mov rcx,2
	rep movsb
	mov rax,r13
LB_604:
	cmp rax,0
	jz LB_605
	sub rax,1
	lea rsi,[LB_603+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_604
LB_605:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %920~5'(= {| l |} ) %919~1'(= {| l |} ) %918~4'(= {| l |} ) %917~3'(= {| l |} ) %916~0'(= r ) %910~2'(= a2◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 5'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 5'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 5'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r11
	mov r14,rax
	ret
LB_600:
;; ?; 4'(= a34◂ [ ] ) ⊢ 1(<2)◂{ 2'(= a2◂ [ {| l |}] ) 5'(= a23◂ [ ] ) }
	mov r8, QWORD [r10+8]
	mov r11, QWORD [r10+16]
;; rsp=0 , %922~5'(= a23◂ [ ] ) %921~2'(= a2◂ [ {| l |}] ) %909~1'(= {| l |} ) %908~0'(= r ) %905~3'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,9
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_606+7-1]
	mov rcx,7
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_607+2-1]
	mov rcx,2
	rep movsb
	mov rax,r13
LB_609:
	cmp rax,0
	jz LB_610
	sub rax,1
	lea rsi,[LB_608+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_609
LB_610:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %926~4'(= {| l |} ) %925~1'(= {| l |} ) %924~3'(= {| l |} ) %923~0'(= r ) %922~5'(= a23◂ [ ] ) %921~2'(= a2◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_599:
;; ?; 1'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %903~0'(= r ) 
	jmp LB_611
LB_611:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %927~%[ "" ] %903~0'(= r ) 
; ∎ { 0'(= r ) %[ "" ] }
; .mov_ptn2 { 0'(= r ) %[ "" ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn %[ "" ] ⊢ 1'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r14,rax
	ret
ETR_180: ;; pnt_dt_etr { 0'(= r ) 1'(= a34◂ [ ] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t34 }→{ _r64 _s8 })
;; rsp=0 , %929~1'(= a34◂ [ ] ) %928~0'(= r ) 
;; ?; 1'(= a34◂ [ ] ) ⊢ 0(<2)◂{ 2'(= a2◂ [ {| l |}] ) 3'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_612
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %931~3'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %930~2'(= a2◂ [ {| l |}] ) %928~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %932~0'(= r ) %931~3'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %930~2'(= a2◂ [ {| l |}] ) 
; #181 { 0'(= r ) 3'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 3'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
; .mov_ptn 3'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] )
	mov rax,r9
	mov r14,rax
	call ETR_181
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %934~1'(= {| l |} ) %933~0'(= r ) %930~2'(= a2◂ [ {| l |}] ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %935~0'(= r ) %934~1'(= {| l |} ) %930~2'(= a2◂ [ {| l |}] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,1
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_613+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %937~3'(= {| l |} ) %936~1'(= {| l |} ) %935~0'(= r ) %930~2'(= a2◂ [ {| l |}] ) 
; ∎ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 1'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	ret
LB_612:
;; ?; 1'(= a34◂ [ ] ) ⊢ 1(<2)◂{ 2'(= a2◂ [ {| l |}] ) 3'(= a23◂ [ ] ) }
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %939~3'(= a23◂ [ ] ) %938~2'(= a2◂ [ {| l |}] ) %928~0'(= r ) 
; #182 3'(= a23◂ [ ] ) ⊢ 1'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 3'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 3'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r9
	mov r13,rax
	call ETR_182
	mov r8,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %940~1'(= {| l |} ) %938~2'(= a2◂ [ {| l |}] ) %928~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,4
	push rdi 
	call mlc_s8
	pop rdi
	mov r9,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_614+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_615+3-1]
	mov rcx,3
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %942~3'(= {| l |} ) %941~1'(= {| l |} ) %938~2'(= a2◂ [ {| l |}] ) %928~0'(= r ) 
; ∎ { 0'(= r ) 3'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 3'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 3'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r9
	mov r14,rax
	ret
ETR_181: ;; pnt_dt_def { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _lst◂{ _s8 _t23 } }→{ _r64 _s8 })
;; rsp=0 , %944~1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %943~0'(= r ) 
;; ?; 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 0(<2)◂{ { 3'(= {| l |} ) 4'(= a23◂ [ ] ) } 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_616
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov r11, QWORD [r14+16]
;; rsp=0 , %947~5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %946~4'(= a23◂ [ ] ) %945~3'(= {| l |} ) %943~0'(= r ) 
; #181 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r9
	mov QWORD [rsp+8*1],r10
; .mov_ptn2 { 0'(= r ) 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
; .mov_ptn 5'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] )
	mov rax,r11
	mov r14,rax
	call ETR_181
	mov r10,QWORD [rsp-8+8*2]
	mov r9,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %949~1'(= {| l |} ) %948~0'(= r ) %946~4'(= a23◂ [ ] ) %945~3'(= {| l |} ) 
; #182 4'(= a23◂ [ ] ) ⊢ 2'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
; .mov_ptn2 4'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 4'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r10
	mov r13,rax
	call ETR_182
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %950~2'(= {| l |} ) %949~1'(= {| l |} ) %948~0'(= r ) %945~3'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,8
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_617+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_618+3-1]
	mov rcx,3
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_619+4-1]
	mov rcx,4
	rep movsb
	mov rax,r13
LB_621:
	cmp rax,0
	jz LB_622
	sub rax,1
	lea rsi,[LB_620+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_621
LB_622:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %955~4'(= {| l |} ) %954~1'(= {| l |} ) %953~2'(= {| l |} ) %952~3'(= {| l |} ) %951~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_616:
;; ?; 1'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %943~0'(= r ) 
	jmp LB_623
LB_623:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %956~%[ "" ] %943~0'(= r ) 
; ∎ { 0'(= r ) %[ "" ] }
; .mov_ptn2 { 0'(= r ) %[ "" ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn %[ "" ] ⊢ 1'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r14,rax
	ret
ETR_182: ;; pnt_type 0'(= a23◂ [ ] ) ⊢ 0'(= {| l |} ) : (_t23→_s8)
;; rsp=0 , %957~0'(= a23◂ [ ] ) 
;; ?; 0'(= a23◂ [ ] ) ⊢ 0(<5)◂1'(= a2◂ [ a23◂ [ ]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_624
	mov r14,QWORD [rdi+8]
;; rsp=0 , %958~1'(= a2◂ [ a23◂ [ ]] ) 
; #183 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	mov rax,r14
	mov r13,rax
	call ETR_183
;; rsp=0 , %959~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	add rdi,3
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_625+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	lea rsi,[LB_626+2-1]
	mov rcx,2
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %961~1'(= {| l |} ) %960~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_624:
;; ?; 0'(= a23◂ [ ] ) ⊢ 1(<5)◂{ 1'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],1
	jnz LB_627
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r13+16]
;; rsp=0 , %963~2'(= a23◂ [ ] ) %962~1'(= a23◂ [ ] ) 
; #182 1'(= a23◂ [ ] ) ⊢ 0'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_182
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %964~0'(= {| l |} ) %963~2'(= a23◂ [ ] ) 
; #182 2'(= a23◂ [ ] ) ⊢ 1'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r8
	mov r13,rax
	call ETR_182
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %965~1'(= {| l |} ) %964~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,5
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_628+5-1]
	mov rcx,5
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %968~2'(= {| l |} ) %967~1'(= {| l |} ) %966~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_627:
;; ?; 0'(= a23◂ [ ] ) ⊢ 2(<5)◂{ 1'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],2
	jnz LB_629
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r13+16]
;; rsp=0 , %970~2'(= a23◂ [ ] ) %969~1'(= a23◂ [ ] ) 
; #182 1'(= a23◂ [ ] ) ⊢ 0'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_182
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %971~0'(= {| l |} ) %970~2'(= a23◂ [ ] ) 
; #182 2'(= a23◂ [ ] ) ⊢ 1'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r8
	mov r13,rax
	call ETR_182
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %972~1'(= {| l |} ) %971~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,3
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_630+3-1]
	mov rcx,3
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %975~2'(= {| l |} ) %974~1'(= {| l |} ) %973~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_629:
;; ?; 0'(= a23◂ [ ] ) ⊢ 3(<5)◂1'(= a9◂ [ ] )
	mov rdi,r13
	cmp BYTE [rdi+6],3
	jnz LB_631
	mov r14,QWORD [rdi+8]
;; rsp=0 , %976~1'(= a9◂ [ ] ) 
; #82 1'(= a9◂ [ ] ) ⊢ 0'(= {| l |} )
; .mov_ptn2 1'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
; .mov_ptn 1'(= a9◂ [ ] ) ⊢ 0'(= a9◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_82
;; rsp=0 , %977~0'(= {| l |} ) 
; ∎ 0'(= {| l |} )
; .mov_ptn2 0'(= {| l |} ) ⊢ 0'(= {| l |} )
	ret
LB_631:
;; ?; 0'(= a23◂ [ ] ) ⊢ 4(<5)◂0'(= {| l |} )
;; rsp=0 , %978~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	add rdi,1
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_632+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %980~1'(= {| l |} ) %979~0'(= {| l |} ) 
; ∎ 1'(= {| l |} )
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
ETR_183: ;; pnt_type_rcd 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= {| l |} ) : (_lst◂_t23→_s8)
;; rsp=0 , %981~0'(= a2◂ [ a23◂ [ ]] ) 
;; ?; 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂{ 1'(= a23◂ [ ] ) 2'(= a2◂ [ a23◂ [ ]] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_633
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r13+16]
;; rsp=0 , %983~2'(= a2◂ [ a23◂ [ ]] ) %982~1'(= a23◂ [ ] ) 
; #182 1'(= a23◂ [ ] ) ⊢ 0'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_182
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %984~0'(= {| l |} ) %983~2'(= a2◂ [ a23◂ [ ]] ) 
; #183 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 1'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	mov rax,r8
	mov r13,rax
	call ETR_183
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %985~1'(= {| l |} ) %984~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r13]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,1
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_634+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r13+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %988~2'(= {| l |} ) %987~1'(= {| l |} ) %986~0'(= {| l |} ) 
; ∎ 2'(= {| l |} )
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	ret
LB_633:
;; ?; 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	jmp LB_635
LB_635:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %989~%[ "" ] 
; ∎ %[ "" ]
; .mov_ptn2 %[ "" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r13,rax
	ret
ETR_184: ;; pnt_lc_etr { 0'(= r ) 1'(= a33◂ [ ] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _t33 }→{ _r64 _s8 })
;; rsp=0 , %991~1'(= a33◂ [ ] ) %990~0'(= r ) 
;; ?; 1'(= a33◂ [ ] ) ⊢ 0(<3)◂{ 2'(= a8◂ [ a13◂ [ {| l |}]] ) 3'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_636
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov r10, QWORD [r14+24]
;; rsp=0 , %994~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %993~3'(= a3◂ [ a23◂ [ ]] ) %992~2'(= a8◂ [ a13◂ [ {| l |}]] ) %990~0'(= r ) 
;; ?; 3'(= a3◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂1'(= a23◂ [ ] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_637
	mov r14,QWORD [rdi+8]
;; rsp=0 , %995~1'(= a23◂ [ ] ) %994~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %992~2'(= a8◂ [ a13◂ [ {| l |}]] ) %990~0'(= r ) 
; #182 1'(= a23◂ [ ] ) ⊢ 1'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_182
	mov r10,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %996~1'(= {| l |} ) %994~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %992~2'(= a8◂ [ a13◂ [ {| l |}]] ) %990~0'(= r ) 
; #99 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 2'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov r13,rax
	call ETR_99
	mov r10,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %997~2'(= {| l |} ) %996~1'(= {| l |} ) %994~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %990~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %998~0'(= r ) %997~2'(= {| l |} ) %996~1'(= {| l |} ) %994~4'(= a17◂ [ a9◂ [ ]{| l |}] ) 
; #132 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 3'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
; .mov_ptn2 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_132
	mov r8,QWORD [rsp-8+8*2]
	mov r9,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %1000~3'(= {| l |} ) %999~0'(= r ) %997~2'(= {| l |} ) %996~1'(= {| l |} ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %1001~0'(= r ) %1000~3'(= {| l |} ) %997~2'(= {| l |} ) %996~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	add rdi,5
	push rdi 
	call mlc_s8
	pop rdi
	mov r10,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_638+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_639+3-1]
	mov rcx,3
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_640+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1005~4'(= {| l |} ) %1004~1'(= {| l |} ) %1003~3'(= {| l |} ) %1002~2'(= {| l |} ) %1001~0'(= r ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_637:
;; rsp=0 , %994~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %993~3'(= a3◂ [ a23◂ [ ]] ) %992~2'(= a8◂ [ a13◂ [ {| l |}]] ) %990~0'(= r ) 
; #99 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 1'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov r13,rax
	call ETR_99
	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %1006~1'(= {| l |} ) %994~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %993~3'(= a3◂ [ a23◂ [ ]] ) %990~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %1007~0'(= r ) %1006~1'(= {| l |} ) %994~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %993~3'(= a3◂ [ a23◂ [ ]] ) 
; #132 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r9
; .mov_ptn2 { 0'(= r ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r10
	mov r14,rax
	call ETR_132
	mov r9,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %1009~2'(= {| l |} ) %1008~0'(= r ) %1006~1'(= {| l |} ) %993~3'(= a3◂ [ a23◂ [ ]] ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %1010~0'(= r ) %1009~2'(= {| l |} ) %1006~1'(= {| l |} ) %993~3'(= a3◂ [ a23◂ [ ]] ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,2
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
	lea rsi,[LB_641+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_642+1-1]
	mov rcx,1
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1013~4'(= {| l |} ) %1012~2'(= {| l |} ) %1011~1'(= {| l |} ) %1010~0'(= r ) %993~3'(= a3◂ [ a23◂ [ ]] ) 
; ∎ { 0'(= r ) 4'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 4'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 4'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r10
	mov r14,rax
	ret
LB_636:
;; ?; 1'(= a33◂ [ ] ) ⊢ 1(<3)◂2'(= a11◂ [ a9◂ [ ]] )
	mov rdi,r14
	cmp BYTE [rdi+6],1
	jnz LB_643
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1014~2'(= a11◂ [ a9◂ [ ]] ) %990~0'(= r ) 
; #88 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 1'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 0'(= a11◂ [ a9◂ [ ]] )
	mov rax,r8
	mov r13,rax
	call ETR_88
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %1015~1'(= {| l |} ) %990~0'(= r ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,4
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_644+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_645+3-1]
	mov rcx,3
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1017~2'(= {| l |} ) %1016~1'(= {| l |} ) %990~0'(= r ) 
; ∎ { 0'(= r ) 2'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
LB_643:
;; ?; 1'(= a33◂ [ ] ) ⊢ 2(<3)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1018~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %990~0'(= r ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %1019~0'(= r ) %1018~2'(= a17◂ [ a9◂ [ ]{| l |}] ) 
; #132 { 0'(= r ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 2'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov r14,rax
	call ETR_132
;; rsp=0 , %1021~1'(= {| l |} ) %1020~0'(= r ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %1022~0'(= r ) %1021~1'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	add rdi,5
	push rdi 
	call mlc_s8
	pop rdi
	mov r8,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_646+5-1]
	mov rcx,5
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1024~2'(= {| l |} ) %1023~1'(= {| l |} ) %1022~0'(= r ) 
; ∎ { 0'(= r ) 2'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 2'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 2'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,r8
	mov r14,rax
	ret
ETR_185: ;; pnt_lc_qlq_etr { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= {| l |} ) } : ({ _r64 _lst◂{ _s8 _t8◂_t13◂_s8 _opn◂_t23 _t17◂_s8◂_t9 } }→{ _r64 _s8 })
;; rsp=0 , %1026~1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1025~0'(= r ) 
;; ?; 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ { 3'(= {| l |} ) 4'(= a8◂ [ a13◂ [ {| l |}]] ) 5'(= a3◂ [ a23◂ [ ]] ) 6'(= a17◂ [ a9◂ [ ]{| l |}] ) } 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_647
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
	mov r11, QWORD [r8+24]
	mov rcx, QWORD [r8+32]
	mov rdx, QWORD [r14+16]
;; rsp=0 , %1031~7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1030~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1029~5'(= a3◂ [ a23◂ [ ]] ) %1028~4'(= a8◂ [ a13◂ [ {| l |}]] ) %1027~3'(= {| l |} ) %1025~0'(= r ) 
;; ?; 5'(= a3◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂1'(= a23◂ [ ] )
	mov rdi,r11
	cmp BYTE [rdi+6],0
	jnz LB_648
	mov r14,QWORD [rdi+8]
;; rsp=0 , %1032~1'(= a23◂ [ ] ) %1031~7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1030~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1028~4'(= a8◂ [ a13◂ [ {| l |}]] ) %1027~3'(= {| l |} ) %1025~0'(= r ) 
; #182 1'(= a23◂ [ ] ) ⊢ 1'(= {| l |} )
	sub rsp,40
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r10
	mov QWORD [rsp+8*3],rcx
	mov QWORD [rsp+8*4],rdx
; .mov_ptn2 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
; .mov_ptn 1'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,r14
	mov r13,rax
	call ETR_182
	mov rdx,QWORD [rsp-8+8*5]
	mov rcx,QWORD [rsp-8+8*4]
	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,40
;; rsp=0 , %1033~1'(= {| l |} ) %1031~7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1030~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1028~4'(= a8◂ [ a13◂ [ {| l |}]] ) %1027~3'(= {| l |} ) %1025~0'(= r ) 
; #99 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 2'(= {| l |} )
	sub rsp,40
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],rcx
	mov QWORD [rsp+8*4],rdx
; .mov_ptn2 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r10
	mov r13,rax
	call ETR_99
	mov rdx,QWORD [rsp-8+8*5]
	mov rcx,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,40
;; rsp=0 , %1034~2'(= {| l |} ) %1033~1'(= {| l |} ) %1031~7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1030~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1027~3'(= {| l |} ) %1025~0'(= r ) 
; #185 { 0'(= r ) 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 4'(= {| l |} ) }
	sub rsp,32
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],rcx
; .mov_ptn2 { 0'(= r ) 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,rdx
	mov r14,rax
	call ETR_185
	mov rcx,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r10,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %1036~4'(= {| l |} ) %1035~0'(= r ) %1034~2'(= {| l |} ) %1033~1'(= {| l |} ) %1030~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1027~3'(= {| l |} ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %1037~0'(= r ) %1036~4'(= {| l |} ) %1034~2'(= {| l |} ) %1033~1'(= {| l |} ) %1030~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1027~3'(= {| l |} ) 
; #132 { 0'(= r ) 6'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 5'(= {| l |} ) }
	sub rsp,32
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r10
; .mov_ptn2 { 0'(= r ) 6'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 6'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,rcx
	mov r14,rax
	call ETR_132
	mov r10,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r11,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %1039~5'(= {| l |} ) %1038~0'(= r ) %1036~4'(= {| l |} ) %1034~2'(= {| l |} ) %1033~1'(= {| l |} ) %1027~3'(= {| l |} ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %1040~0'(= r ) %1039~5'(= {| l |} ) %1036~4'(= {| l |} ) %1034~2'(= {| l |} ) %1033~1'(= {| l |} ) %1027~3'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r11]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r10]
	add rdi,rax 
	push rax
	add rdi,7
	push rdi 
	call mlc_s8
	pop rdi
	mov rcx,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r10+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r11+7+rcx]
	rep movsb
	lea rsi,[LB_649+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_650+3-1]
	mov rcx,3
	rep movsb
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	lea rsi,[LB_651+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_652+2-1]
	mov rcx,2
	rep movsb
	mov rax,r13
LB_654:
	cmp rax,0
	jz LB_655
	sub rax,1
	lea rsi,[LB_653+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_654
LB_655:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1047~6'(= {| l |} ) %1046~1'(= {| l |} ) %1045~4'(= {| l |} ) %1044~5'(= {| l |} ) %1043~2'(= {| l |} ) %1042~3'(= {| l |} ) %1041~0'(= r ) 
; ∎ { 0'(= r ) 6'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 6'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 6'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,rcx
	mov r14,rax
	ret
LB_648:
;; rsp=0 , %1031~7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1030~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1029~5'(= a3◂ [ a23◂ [ ]] ) %1028~4'(= a8◂ [ a13◂ [ {| l |}]] ) %1027~3'(= {| l |} ) %1025~0'(= r ) 
; #99 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 1'(= {| l |} )
	sub rsp,40
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r11
	mov QWORD [rsp+8*3],rcx
	mov QWORD [rsp+8*4],rdx
; .mov_ptn2 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 4'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r10
	mov r13,rax
	call ETR_99
	mov rdx,QWORD [rsp-8+8*5]
	mov rcx,QWORD [rsp-8+8*4]
	mov r11,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,40
;; rsp=0 , %1048~1'(= {| l |} ) %1031~7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1030~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1029~5'(= a3◂ [ a23◂ [ ]] ) %1027~3'(= {| l |} ) %1025~0'(= r ) 
; #185 { 0'(= r ) 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 2'(= {| l |} ) }
	sub rsp,32
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r11
	mov QWORD [rsp+8*3],rcx
; .mov_ptn2 { 0'(= r ) 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 7'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,rdx
	mov r14,rax
	call ETR_185
	mov rcx,QWORD [rsp-8+8*4]
	mov r11,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov r8,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %1050~2'(= {| l |} ) %1049~0'(= r ) %1048~1'(= {| l |} ) %1030~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1029~5'(= a3◂ [ a23◂ [ ]] ) %1027~3'(= {| l |} ) 
; #11 0'(= r ) ⊢ 0'(= r )
	add r13,1
;; rsp=0 , %1051~0'(= r ) %1050~2'(= {| l |} ) %1048~1'(= {| l |} ) %1030~6'(= a17◂ [ a9◂ [ ]{| l |}] ) %1029~5'(= a3◂ [ a23◂ [ ]] ) %1027~3'(= {| l |} ) 
; #132 { 0'(= r ) 6'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 4'(= {| l |} ) }
	sub rsp,32
	mov QWORD [rsp+8*0],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp+8*2],r9
	mov QWORD [rsp+8*3],r11
; .mov_ptn2 { 0'(= r ) 6'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ { 0'(= r ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 6'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 1'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rax,rcx
	mov r14,rax
	call ETR_132
	mov r11,QWORD [rsp-8+8*4]
	mov r9,QWORD [rsp-8+8*3]
	mov r8,QWORD [rsp-8+8*2]
	mov r10,r14
	mov r14,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %1053~4'(= {| l |} ) %1052~0'(= r ) %1050~2'(= {| l |} ) %1048~1'(= {| l |} ) %1029~5'(= a3◂ [ a23◂ [ ]] ) %1027~3'(= {| l |} ) 
; #12 0'(= r ) ⊢ 0'(= r )
	sub r13,1
;; rsp=0 , %1054~0'(= r ) %1053~4'(= {| l |} ) %1050~2'(= {| l |} ) %1048~1'(= {| l |} ) %1029~5'(= a3◂ [ a23◂ [ ]] ) %1027~3'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	mov rsi,r13
	imul rsi,1
	add rdi,rsi 
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r9]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r14]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r10]
	add rdi,rax 
	push rax
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,[r8]
	add rdi,rax 
	push rax
	add rdi,4
	push rdi 
	call mlc_s8
	pop rdi
	mov rcx,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	pop rcx
	lea rsi,[r8+7+rcx]
	rep movsb
	pop rcx
	lea rsi,[r10+7+rcx]
	rep movsb
	lea rsi,[LB_656+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r14+7+rcx]
	rep movsb
	lea rsi,[LB_657+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r9+7+rcx]
	rep movsb
	lea rsi,[LB_658+2-1]
	mov rcx,2
	rep movsb
	mov rax,r13
LB_660:
	cmp rax,0
	jz LB_661
	sub rax,1
	lea rsi,[LB_659+1-1]
	mov rcx,1
	rep movsb 
	jmp LB_660
LB_661:
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1060~6'(= {| l |} ) %1059~2'(= {| l |} ) %1058~4'(= {| l |} ) %1057~1'(= {| l |} ) %1056~3'(= {| l |} ) %1055~0'(= r ) %1029~5'(= a3◂ [ a23◂ [ ]] ) 
; ∎ { 0'(= r ) 6'(= {| l |} ) }
; .mov_ptn2 { 0'(= r ) 6'(= {| l |} ) } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn 6'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rax,rcx
	mov r14,rax
	ret
LB_647:
;; ?; 1'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %1025~0'(= r ) 
	jmp LB_662
LB_662:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %1061~%[ "" ] %1025~0'(= r ) 
; ∎ { 0'(= r ) %[ "" ] }
; .mov_ptn2 { 0'(= r ) %[ "" ] } ⊢ { 0'(= r ) 1'(= {| l |} ) }
; .mov_ptn %[ "" ] ⊢ 1'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r14,rax
	ret
ETR_186: ;; mk_app { 0'(= a23◂ [ ] ) 1'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0'(= a23◂ [ ] ) : ({ _t23 _lst◂_t23 }→_t23)
;; rsp=0 , %1063~1'(= a2◂ [ a23◂ [ ]] ) %1062~0'(= a23◂ [ ] ) 
;; ?; 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂{ 2'(= a23◂ [ ] ) 3'(= a2◂ [ a23◂ [ ]] ) }
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_663
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %1065~3'(= a2◂ [ a23◂ [ ]] ) %1064~2'(= a23◂ [ ] ) %1062~0'(= a23◂ [ ] ) 
; #138 { 0'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) } ⊢ 2(<5)◂{ 0'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) }
;; rsp=0 , %1066~2(<5)◂{ 0'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) } %1065~3'(= a2◂ [ a23◂ [ ]] ) 
; #186 { 2(<5)◂{ 0'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) } 3'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0'(= a23◂ [ ] )
; .mov_ptn2 { 2(<5)◂{ 0'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) } 3'(= a2◂ [ a23◂ [ ]] ) } ⊢ { 0'(= a23◂ [ ] ) 1'(= a2◂ [ a23◂ [ ]] ) }
; .mov_ptn 3'(= a2◂ [ a23◂ [ ]] ) ⊢ 1'(= a2◂ [ a23◂ [ ]] )
	mov rax,r9
	mov r14,rax
	mov r10,r13
; .mov_ptn 2(<5)◂{ 4'(= a23◂ [ ] ) 2'(= a23◂ [ ] ) } ⊢ 0'(= a23◂ [ ] )
	ALC_RCD 2
	mov r9,rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,r8
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],2
	mov r13,rax
	call ETR_186
;; rsp=0 , %1067~0'(= a23◂ [ ] ) 
; ∎ 0'(= a23◂ [ ] )
; .mov_ptn2 0'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	ret
LB_663:
;; ?; 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %1062~0'(= a23◂ [ ] ) 
; ∎ 0'(= a23◂ [ ] )
; .mov_ptn2 0'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	ret
ETR_187:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_187
	ret
GRM_187:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_667
	jmp LB_668
LB_667:
	mov r8,unt_1
	jmp LB_665
LB_668:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_669
	jmp LB_670
LB_669:
	mov r8,unt_1
	jmp LB_665
LB_670:
	add r14,1
	jmp LB_666
LB_665:
	add rsp,0
	jmp LB_664
LB_666:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_675
	jmp LB_676
LB_675:
	mov r8,unt_1
	jmp LB_673
LB_676:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],32
	jnz LB_677
	jmp LB_678
LB_677:
	mov r8,unt_1
	jmp LB_673
LB_678:
	add r14,1
	jmp LB_674
LB_673:
	add rsp,0
	jmp LB_672
LB_674:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_679
LB_679
;; rsp=0 , %1071~1'(= r ) %1070~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1072~0(<2)◂{ } %1071~1'(= r ) %1070~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_680
LB_680:
	cmp BYTE [r8+6],0
	jnz LB_672
	POP_GRM_SCC
	jmp LB_671
LB_672:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_684
	jmp LB_685
LB_684:
	mov r8,unt_1
	jmp LB_682
LB_685:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],9
	jnz LB_686
	jmp LB_687
LB_686:
	mov r8,unt_1
	jmp LB_682
LB_687:
	add r14,1
	jmp LB_683
LB_682:
	add rsp,0
	jmp LB_681
LB_683:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_688
LB_688
;; rsp=0 , %1074~1'(= r ) %1073~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1075~0(<2)◂{ } %1074~1'(= r ) %1073~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_689
LB_689:
	cmp BYTE [r8+6],0
	jnz LB_681
	POP_GRM_SCC
	jmp LB_671
LB_681:
	RB_GRM
	call GRM_188
	cmp BYTE [r8+6],0
	jnz LB_693
	jmp LB_694
LB_693:
	jmp LB_691
LB_694:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_692
LB_691:
	add rsp,0
	jmp LB_690
LB_692:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_695
LB_695
;; rsp=0 , %1078~1'(= r ) %1077~0'(= r ) %1076~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1079~1(<2)◂{ } %1078~1'(= r ) %1077~0'(= r ) %1076~{ } 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_696
LB_696:
	cmp BYTE [r8+6],0
	jnz LB_690
	POP_GRM_SCC
	jmp LB_671
LB_690:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_698
LB_698
;; rsp=0 , %1081~1'(= r ) %1080~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1082~0(<2)◂{ } %1081~1'(= r ) %1080~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_699
LB_699:
	cmp BYTE [r8+6],0
	jnz LB_697
	POP_GRM_SCC
	jmp LB_671
LB_697:
	POP_GRM_FAIL 
	jmp LB_671
LB_671:
	cmp BYTE [r8+6],0
	jnz LB_700
	jmp LB_701
LB_700:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_701:
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_702
LB_702
;; rsp=0 , %1083~{ } %1069~1'(= r ) %1068~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1084~0(<2)◂{ } %1083~{ } %1069~1'(= r ) %1068~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_703
LB_703:
	cmp BYTE [r8+6],0
	jnz LB_664
	POP_GRM_SCC
	ret
LB_664:
	POP_GRM_FAIL 
	ret
ETR_188:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_188
	ret
GRM_188:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_707
	jmp LB_708
LB_707:
	mov r8,unt_1
	jmp LB_705
LB_708:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_709
	jmp LB_710
LB_709:
	mov r8,unt_1
	jmp LB_705
LB_710:
	add r14,1
	jmp LB_706
LB_705:
	add rsp,0
	jmp LB_704
LB_706:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_711
LB_711
;; rsp=0 , %1086~1'(= r ) %1085~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1087~1(<2)◂{ } %1086~1'(= r ) %1085~0'(= r ) 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_712
LB_712:
	cmp BYTE [r8+6],0
	jnz LB_704
	POP_GRM_SCC
	ret
LB_704:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_714
LB_714
;; rsp=0 , %1089~1'(= r ) %1088~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1090~0(<2)◂{ } %1089~1'(= r ) %1088~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_715
LB_715:
	cmp BYTE [r8+6],0
	jnz LB_713
	POP_GRM_SCC
	ret
LB_713:
	POP_GRM_FAIL 
	ret
ETR_189:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_189
	ret
GRM_189:
	PUSH_GRM
	jmp LB_718
LB_717:
	add r14,1 
LB_718:
	cmp r14,r9
	jge LB_719
	JZ_LINE_SPC BYTE [r13+8+r14], LB_717
LB_719
	call GRM_77
	cmp BYTE [r8+6],0
	jnz LB_722
	jmp LB_723
LB_722:
	jmp LB_720
LB_723:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_721
LB_720:
	add rsp,0
	jmp LB_716
LB_721:
	jmp LB_725
LB_724:
	add r14,1 
LB_725:
	cmp r14,r9
	jge LB_726
	JZ_LINE_SPC BYTE [r13+8+r14], LB_724
LB_726
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_729
	jmp LB_730
LB_729:
	mov r8,unt_1
	jmp LB_727
LB_730:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_731
	jmp LB_732
LB_731:
	mov r8,unt_1
	jmp LB_727
LB_732:
	add r14,1
	jmp LB_728
LB_727:
	add rsp,8
	jmp LB_716
LB_728:
	jmp LB_734
LB_733:
	add r14,1 
LB_734:
	cmp r14,r9
	jge LB_735
	JZ_LINE_SPC BYTE [r13+8+r14], LB_733
LB_735
	call GRM_189
	cmp BYTE [r8+6],0
	jnz LB_738
	jmp LB_739
LB_738:
	jmp LB_736
LB_739:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 9'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 9'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_737
LB_736:
	add rsp,8
	jmp LB_716
LB_737:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_740
LB_740
;; rsp=2 , %1094~1'(= r ) %1093~0'(= r ) %1092~9'(= a9◂ [ ] ) %1091~8'(= {| l |} ) 
; #81 { 8'(= {| l |} ) 9'(= a9◂ [ ] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) }
;; rsp=2 , %1095~0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) } %1094~1'(= r ) %1093~0'(= r ) 
; #22 0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) }
;; rsp=2 , %1096~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) } %1094~1'(= r ) %1093~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) } ⊢ 2'(= a3◂ [ a9◂ [ ]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a9◂ [ ] ) } ⊢ 2'(= a3◂ [ a9◂ [ ]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_741
LB_741:
	cmp BYTE [r8+6],0
	jnz LB_716
	POP_GRM_SCC
	ret
LB_716:
	RB_GRM
	jmp LB_744
LB_743:
	add r14,1 
LB_744:
	cmp r14,r9
	jge LB_745
	JZ_LINE_SPC BYTE [r13+8+r14], LB_743
LB_745
	call GRM_77
	cmp BYTE [r8+6],0
	jnz LB_748
	jmp LB_749
LB_748:
	jmp LB_746
LB_749:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_747
LB_746:
	add rsp,0
	jmp LB_742
LB_747:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_750
LB_750
;; rsp=1 , %1099~1'(= r ) %1098~0'(= r ) %1097~8'(= {| l |} ) 
; #80 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1100~1(<2)◂8'(= {| l |} ) %1099~1'(= r ) %1098~0'(= r ) 
; #22 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1101~0(<2)◂1(<2)◂8'(= {| l |} ) %1099~1'(= r ) %1098~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a9◂ [ ]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a9◂ [ ]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_751
LB_751:
	cmp BYTE [r8+6],0
	jnz LB_742
	POP_GRM_SCC
	ret
LB_742:
	POP_GRM_FAIL 
	ret
ETR_190:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_190
	ret
GRM_190:
	PUSH_GRM
	cmp r14,r9
	jge LB_755
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_755
	add r14,rsi
	push rdi
	jmp LB_756
LB_755:
	mov r8,unt_1
	jmp LB_753
LB_756:
	jmp LB_754
LB_753:
	add rsp,0
	jmp LB_752
LB_754:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_759
	jmp LB_760
LB_759:
	mov r8,unt_1
	jmp LB_757
LB_760:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],114
	jnz LB_761
	jmp LB_762
LB_761:
	mov r8,unt_1
	jmp LB_757
LB_762:
	add r14,1
	jmp LB_758
LB_757:
	add rsp,8
	jmp LB_752
LB_758:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_763
LB_763
;; rsp=1 , %1104~1'(= r ) %1103~0'(= r ) %1102~8'(= r ) 
; #84 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %1105~0(<2)◂8'(= r ) %1104~1'(= r ) %1103~0'(= r ) 
; #86 0(<2)◂8'(= r ) ⊢ 0(<2)◂0(<2)◂8'(= r )
;; rsp=1 , %1106~0(<2)◂0(<2)◂8'(= r ) %1104~1'(= r ) %1103~0'(= r ) 
; #22 0(<2)◂0(<2)◂8'(= r ) ⊢ 0(<2)◂0(<2)◂0(<2)◂8'(= r )
;; rsp=1 , %1107~0(<2)◂0(<2)◂0(<2)◂8'(= r ) %1104~1'(= r ) %1103~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_764
LB_764:
	cmp BYTE [r8+6],0
	jnz LB_752
	POP_GRM_SCC
	ret
LB_752:
	RB_GRM
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_768
	jmp LB_769
LB_768:
	mov r8,unt_1
	jmp LB_766
LB_769:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],48
	jnz LB_770
	cmp BYTE [rdi+1],120
	jnz LB_770
	jmp LB_771
LB_770:
	mov r8,unt_1
	jmp LB_766
LB_771:
	add r14,2
	jmp LB_767
LB_766:
	add rsp,0
	jmp LB_765
LB_767:
	cmp r14,r9
	jge LB_774
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_x
	C_POP_REGS
	cmp rax,0 
	jz LB_774
	add r14,rsi
	push rdi
	jmp LB_775
LB_774:
	mov r8,unt_1
	jmp LB_772
LB_775:
	jmp LB_773
LB_772:
	add rsp,0
	jmp LB_765
LB_773:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_778
	jmp LB_779
LB_778:
	mov r8,unt_1
	jmp LB_776
LB_779:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],114
	jnz LB_780
	jmp LB_781
LB_780:
	mov r8,unt_1
	jmp LB_776
LB_781:
	add r14,1
	jmp LB_777
LB_776:
	add rsp,8
	jmp LB_765
LB_777:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_782
LB_782
;; rsp=1 , %1110~1'(= r ) %1109~0'(= r ) %1108~8'(= r ) 
; #84 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %1111~0(<2)◂8'(= r ) %1110~1'(= r ) %1109~0'(= r ) 
; #86 0(<2)◂8'(= r ) ⊢ 0(<2)◂0(<2)◂8'(= r )
;; rsp=1 , %1112~0(<2)◂0(<2)◂8'(= r ) %1110~1'(= r ) %1109~0'(= r ) 
; #22 0(<2)◂0(<2)◂8'(= r ) ⊢ 0(<2)◂0(<2)◂0(<2)◂8'(= r )
;; rsp=1 , %1113~0(<2)◂0(<2)◂0(<2)◂8'(= r ) %1110~1'(= r ) %1109~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_783
LB_783:
	cmp BYTE [r8+6],0
	jnz LB_765
	POP_GRM_SCC
	ret
LB_765:
	RB_GRM
	call GRM_67
	cmp BYTE [r8+6],0
	jnz LB_787
	jmp LB_788
LB_787:
	jmp LB_785
LB_788:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_786
LB_785:
	add rsp,0
	jmp LB_784
LB_786:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_789
LB_789
;; rsp=1 , %1116~1'(= r ) %1115~0'(= r ) %1114~8'(= {| l |} ) 
; #83 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1117~1(<2)◂8'(= {| l |} ) %1116~1'(= r ) %1115~0'(= r ) 
; #86 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1118~0(<2)◂1(<2)◂8'(= {| l |} ) %1116~1'(= r ) %1115~0'(= r ) 
; #22 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1119~0(<2)◂0(<2)◂1(<2)◂8'(= {| l |} ) %1116~1'(= r ) %1115~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_790
LB_790:
	cmp BYTE [r8+6],0
	jnz LB_784
	POP_GRM_SCC
	ret
LB_784:
	RB_GRM
	call GRM_189
	cmp BYTE [r8+6],0
	jnz LB_794
	jmp LB_795
LB_794:
	jmp LB_792
LB_795:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_793
LB_792:
	add rsp,0
	jmp LB_791
LB_793:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_796
LB_796
;; rsp=1 , %1122~1'(= r ) %1121~0'(= r ) %1120~8'(= a9◂ [ ] ) 
; #85 8'(= a9◂ [ ] ) ⊢ 1(<2)◂8'(= a9◂ [ ] )
;; rsp=1 , %1123~1(<2)◂8'(= a9◂ [ ] ) %1122~1'(= r ) %1121~0'(= r ) 
; #22 1(<2)◂8'(= a9◂ [ ] ) ⊢ 0(<2)◂1(<2)◂8'(= a9◂ [ ] )
;; rsp=1 , %1124~0(<2)◂1(<2)◂8'(= a9◂ [ ] ) %1122~1'(= r ) %1121~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a9◂ [ ] )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a11◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_797
LB_797:
	cmp BYTE [r8+6],0
	jnz LB_791
	POP_GRM_SCC
	ret
LB_791:
	POP_GRM_FAIL 
	ret
ETR_191:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_191
	ret
GRM_191:
	PUSH_GRM
	jmp LB_800
LB_799:
	add r14,1 
LB_800:
	cmp r14,r9
	jge LB_801
	JZ_LINE_SPC BYTE [r13+8+r14], LB_799
LB_801
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_804
	jmp LB_805
LB_804:
	mov r8,unt_1
	jmp LB_802
LB_805:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_806
	jmp LB_807
LB_806:
	mov r8,unt_1
	jmp LB_802
LB_807:
	add r14,1
	jmp LB_803
LB_802:
	add rsp,0
	jmp LB_798
LB_803:
	jmp LB_809
LB_808:
	add r14,1 
LB_809:
	cmp r14,r9
	jge LB_810
	JZ_LINE_SPC BYTE [r13+8+r14], LB_808
LB_810
	call GRM_191
	cmp BYTE [r8+6],0
	jnz LB_813
	jmp LB_814
LB_813:
	jmp LB_811
LB_814:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_812
LB_811:
	add rsp,0
	jmp LB_798
LB_812:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_815
LB_815
;; rsp=1 , %1127~1'(= r ) %1126~0'(= r ) %1125~8'(= r ) 
; #11 8'(= r ) ⊢ 8'(= r )
	add QWORD [rsp-8+8*1],1
;; rsp=1 , %1128~8'(= r ) %1127~1'(= r ) %1126~0'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %1129~0(<2)◂8'(= r ) %1127~1'(= r ) %1126~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_816
LB_816:
	cmp BYTE [r8+6],0
	jnz LB_798
	POP_GRM_SCC
	ret
LB_798:
	RB_GRM
	jmp LB_819
LB_818:
	add r14,1 
LB_819:
	cmp r14,r9
	jge LB_820
	JZ_LINE_SPC BYTE [r13+8+r14], LB_818
LB_820
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_823
	jmp LB_824
LB_823:
	mov r8,unt_1
	jmp LB_821
LB_824:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_825
	jmp LB_826
LB_825:
	mov r8,unt_1
	jmp LB_821
LB_826:
	add r14,1
	jmp LB_822
LB_821:
	add rsp,0
	jmp LB_817
LB_822:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_827
LB_827
;; rsp=0 , %1131~1'(= r ) %1130~0'(= r ) 
; #22 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %1132~0(<2)◂%[ 1r ] %1131~1'(= r ) %1130~0'(= r ) 
; ∎ 0(<2)◂%[ 1r ]
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
	mov rax,1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_828
LB_828:
	cmp BYTE [r8+6],0
	jnz LB_817
	POP_GRM_SCC
	ret
LB_817:
	POP_GRM_FAIL 
	ret
ETR_195: ;; mk_prs_err { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } ⊢ 0'(= a35◂ [ q0] ) : ({ _r64 _r64 _s8 }→_t35◂2323'(1))
;; rsp=0 , %1148~2'(= {| l |} ) %1147~1'(= r ) %1146~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1149~1(<2)◂{ } %1148~2'(= {| l |} ) %1147~1'(= r ) %1146~0'(= r ) 
; #21 { { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
;; rsp=0 , %1150~0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
;; rsp=0 , %1151~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } 
; ∎ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } }
; .mov_ptn2 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 0'(= a35◂ [ q0] )
	mov r9,r13
; .mov_ptn 1(<2)◂0(<2)◂{ { 3'(= r ) 1'(= r ) 2'(= {| l |} ) } 1(<2)◂{ } } ⊢ 0'(= a35◂ [ q0] )
	ALC_RCD 2
	mov r10,rax
	ALC_RCD 3
	mov r11,rax
	mov rax,r9
	mov QWORD [r11+8+8*0],rax
	mov rax,r14
	mov QWORD [r11+8+8*1],rax
	mov rax,r8
	mov QWORD [r11+8+8*2],rax
	mov rax,r11
	mov QWORD [r10+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r10+8+8*1],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
ETR_196: ;; pnt_prs_err 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= {| l |} ) : (_lst◂{ _r64 _r64 _s8 }→_s8)
;; rsp=0 , %1152~0'(= a2◂ [ *{ rr{| l |}}] ) 
;; ? 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂{ { 2'(= r ) 3'(= r ) 4'(= {| l |} ) } 5'(= a2◂ [ *{ rr{| l |}}] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_829
	mov r14, QWORD [r13+8]
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
	mov r10, QWORD [r14+24]
	mov r11, QWORD [r13+16]
;; rsp=0 , %1156~5'(= a2◂ [ *{ rr{| l |}}] ) %1155~4'(= {| l |} ) %1154~3'(= r ) %1153~2'(= r ) 
; #196 5'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= {| l |} )
	sub rsp,24
	mov QWORD [rsp+8*0],r8
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 5'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn 5'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r11
	mov r13,rax
	call ETR_196
	mov r10,QWORD [rsp-8+8*3]
	mov r9,QWORD [rsp-8+8*2]
	mov r8,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %1157~0'(= {| l |} ) %1155~4'(= {| l |} ) %1154~3'(= r ) %1153~2'(= r ) 
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
	lea rsi,[LB_830+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[r10+7+rcx]
	rep movsb
	lea rsi,[LB_831+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_832+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_833+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1162~1'(= {| l |} ) %1161~0'(= {| l |} ) %1160~4'(= {| l |} ) %1159~3'(= r ) %1158~2'(= r ) 
; ∎ 1'(= {| l |} )
; .mov_ptn2 1'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
	ret
LB_829:
;; ?. 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , 
	jmp LB_834
LB_834:
; $ %[ "" ] ⊢ %[ "" ]
;; rsp=0 , %1163~%[ "" ] 
; ∎ %[ "" ]
; .mov_ptn2 %[ "" ] ⊢ 0'(= {| l |} )
; .mov_ptn %[ "" ] ⊢ 0'(= {| l |} )
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	C_CALL_SF calloc
	mov QWORD [rax],0
	mov r13,rax
	ret
ETR_197:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_197
	ret
GRM_197:
	PUSH_GRM
	jmp LB_837
LB_836:
	add r14,1 
LB_837:
	cmp r14,r9
	jge LB_838
	JZ_LINE_SPC BYTE [r13+8+r14], LB_836
LB_838
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_841
	jmp LB_842
LB_841:
	mov r8,unt_1
	jmp LB_839
LB_842:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_843
	jmp LB_844
LB_843:
	mov r8,unt_1
	jmp LB_839
LB_844:
	add r14,1
	jmp LB_840
LB_839:
	add rsp,0
	jmp LB_835
LB_840:
	jmp LB_846
LB_845:
	add r14,1 
LB_846:
	cmp r14,r9
	jge LB_847
	JZ_LINE_SPC BYTE [r13+8+r14], LB_845
LB_847
	call GRM_198
	cmp BYTE [r8+6],0
	jnz LB_850
	jmp LB_851
LB_850:
	jmp LB_848
LB_851:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_849
LB_848:
	add rsp,0
	jmp LB_835
LB_849:
	jmp LB_853
LB_852:
	add r14,1 
LB_853:
	cmp r14,r9
	jge LB_854
	JZ_LINE_SPC BYTE [r13+8+r14], LB_852
LB_854
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_857
	jmp LB_858
LB_857:
	mov r8,unt_1
	jmp LB_855
LB_858:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_859
	jmp LB_860
LB_859:
	mov r8,unt_1
	jmp LB_855
LB_860:
	add r14,1
	jmp LB_856
LB_855:
	add rsp,8
	jmp LB_835
LB_856:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_861
LB_861
;; rsp=1 , %1166~1'(= r ) %1165~0'(= r ) %1164~8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) 
; #79 8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
;; rsp=1 , %1167~0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) %1166~1'(= r ) %1165~0'(= r ) 
; #22 0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
;; rsp=1 , %1168~0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) %1166~1'(= r ) %1165~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_862
LB_862:
	cmp BYTE [r8+6],0
	jnz LB_835
	POP_GRM_SCC
	ret
LB_835:
	RB_GRM
	jmp LB_865
LB_864:
	add r14,1 
LB_865:
	cmp r14,r9
	jge LB_866
	JZ_LINE_SPC BYTE [r13+8+r14], LB_864
LB_866
	call GRM_200
	cmp BYTE [r8+6],0
	jnz LB_869
	jmp LB_870
LB_869:
	jmp LB_867
LB_870:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a14◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a14◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_868
LB_867:
	add rsp,0
	jmp LB_863
LB_868:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_871
LB_871
;; rsp=1 , %1171~1'(= r ) %1170~0'(= r ) %1169~8'(= a14◂ [ a9◂ [ ]{| l |}] ) 
; #78 8'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %1172~1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] ) %1171~1'(= r ) %1170~0'(= r ) 
; #22 1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %1173~0(<2)◂1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] ) %1171~1'(= r ) %1170~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_872
LB_872:
	cmp BYTE [r8+6],0
	jnz LB_863
	POP_GRM_SCC
	ret
LB_863:
	POP_GRM_FAIL 
	ret
ETR_198:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_198
	ret
GRM_198:
	PUSH_GRM
	jmp LB_875
LB_874:
	add r14,1 
LB_875:
	cmp r14,r9
	jge LB_876
	JZ_LINE_SPC BYTE [r13+8+r14], LB_874
LB_876
	call GRM_197
	cmp BYTE [r8+6],0
	jnz LB_879
	jmp LB_880
LB_879:
	jmp LB_877
LB_880:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_878
LB_877:
	add rsp,0
	jmp LB_873
LB_878:
	jmp LB_882
LB_881:
	add r14,1 
LB_882:
	cmp r14,r9
	jge LB_883
	JZ_LINE_SPC BYTE [r13+8+r14], LB_881
LB_883
	call GRM_198
	cmp BYTE [r8+6],0
	jnz LB_886
	jmp LB_887
LB_886:
	jmp LB_884
LB_887:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_885
LB_884:
	add rsp,8
	jmp LB_873
LB_885:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_888
LB_888
;; rsp=2 , %1177~1'(= r ) %1176~0'(= r ) %1175~9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) %1174~8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 
; #21 { 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1178~0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) } %1177~1'(= r ) %1176~0'(= r ) 
; #22 0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1179~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) } %1177~1'(= r ) %1176~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_889
LB_889:
	cmp BYTE [r8+6],0
	jnz LB_873
	POP_GRM_SCC
	ret
LB_873:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_891
LB_891
;; rsp=0 , %1181~1'(= r ) %1180~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1182~1(<2)◂{ } %1181~1'(= r ) %1180~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1183~0(<2)◂1(<2)◂{ } %1181~1'(= r ) %1180~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_892
LB_892:
	cmp BYTE [r8+6],0
	jnz LB_890
	POP_GRM_SCC
	ret
LB_890:
	POP_GRM_FAIL 
	ret
ETR_199:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_199
	ret
GRM_199:
	PUSH_GRM
	jmp LB_895
LB_894:
	add r14,1 
LB_895:
	cmp r14,r9
	jge LB_896
	JZ_LINE_SPC BYTE [r13+8+r14], LB_894
LB_896
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_899
	jmp LB_900
LB_899:
	mov r8,unt_1
	jmp LB_897
LB_900:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
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
	jmp LB_893
LB_898:
	jmp LB_904
LB_903:
	add r14,1 
LB_904:
	cmp r14,r9
	jge LB_905
	JZ_LINE_SPC BYTE [r13+8+r14], LB_903
LB_905
	call GRM_200
	cmp BYTE [r8+6],0
	jnz LB_908
	jmp LB_909
LB_908:
	jmp LB_906
LB_909:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a14◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a14◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a14◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_907
LB_906:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_907:
	jmp LB_911
LB_910:
	add r14,1 
LB_911:
	cmp r14,r9
	jge LB_912
	JZ_LINE_SPC BYTE [r13+8+r14], LB_910
LB_912
	call GRM_199
	cmp BYTE [r8+6],0
	jnz LB_915
	jmp LB_916
LB_915:
	jmp LB_913
LB_916:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_914
LB_913:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_914:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_917
LB_917
;; rsp=2 , %1187~1'(= r ) %1186~0'(= r ) %1185~9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %1184~8'(= a14◂ [ a9◂ [ ]{| l |}] ) 
; #21 { 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %1188~0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } %1187~1'(= r ) %1186~0'(= r ) 
; #22 0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %1189~0(<2)◂0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } %1187~1'(= r ) %1186~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a14◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_918
LB_918:
	cmp BYTE [r8+6],0
	jnz LB_893
	POP_GRM_SCC
	ret
LB_893:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_920
LB_920
;; rsp=0 , %1191~1'(= r ) %1190~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1192~1(<2)◂{ } %1191~1'(= r ) %1190~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1193~0(<2)◂1(<2)◂{ } %1191~1'(= r ) %1190~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a14◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_921
LB_921:
	cmp BYTE [r8+6],0
	jnz LB_919
	POP_GRM_SCC
	ret
LB_919:
	POP_GRM_FAIL 
	ret
ETR_200:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_200
	ret
GRM_200:
	PUSH_GRM
	jmp LB_924
LB_923:
	add r14,1 
LB_924:
	cmp r14,r9
	jge LB_925
	JZ_LINE_SPC BYTE [r13+8+r14], LB_923
LB_925
	call GRM_189
	cmp BYTE [r8+6],0
	jnz LB_928
	jmp LB_929
LB_928:
	jmp LB_926
LB_929:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_927
LB_926:
	add rsp,0
	jmp LB_922
LB_927:
	jmp LB_931
LB_930:
	add r14,1 
LB_931:
	cmp r14,r9
	jge LB_932
	JZ_LINE_SPC BYTE [r13+8+r14], LB_930
LB_932
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_935
	jmp LB_936
LB_935:
	mov r8,unt_1
	jmp LB_933
LB_936:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_937
	cmp BYTE [rdi+1],151
	jnz LB_937
	cmp BYTE [rdi+2],130
	jnz LB_937
	jmp LB_938
LB_937:
	mov r8,unt_1
	jmp LB_933
LB_938:
	add r14,3
	jmp LB_934
LB_933:
	add rsp,8
	jmp LB_922
LB_934:
	jmp LB_940
LB_939:
	add r14,1 
LB_940:
	cmp r14,r9
	jge LB_941
	JZ_LINE_SPC BYTE [r13+8+r14], LB_939
LB_941
	call GRM_197
	cmp BYTE [r8+6],0
	jnz LB_944
	jmp LB_945
LB_944:
	jmp LB_942
LB_945:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_943
LB_942:
	add rsp,8
	jmp LB_922
LB_943:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_946
LB_946
;; rsp=2 , %1197~1'(= r ) %1196~0'(= r ) %1195~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %1194~8'(= a9◂ [ ] ) 
; #96 { 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %1198~0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } %1197~1'(= r ) %1196~0'(= r ) 
; #22 0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %1199~0(<2)◂0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } %1197~1'(= r ) %1196~0'(= r ) 
; ∎ 0(<2)◂0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn2 0(<2)◂0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂0(<4)◂{ 8'(= a9◂ [ ] ) 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_947
LB_947:
	cmp BYTE [r8+6],0
	jnz LB_922
	POP_GRM_SCC
	ret
LB_922:
	RB_GRM
	jmp LB_950
LB_949:
	add r14,1 
LB_950:
	cmp r14,r9
	jge LB_951
	JZ_LINE_SPC BYTE [r13+8+r14], LB_949
LB_951
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_954
	jmp LB_955
LB_954:
	mov r8,unt_1
	jmp LB_952
LB_955:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_956
	cmp BYTE [rdi+1],91
	jnz LB_956
	jmp LB_957
LB_956:
	mov r8,unt_1
	jmp LB_952
LB_957:
	add r14,2
	jmp LB_953
LB_952:
	add rsp,0
	jmp LB_948
LB_953:
	jmp LB_959
LB_958:
	add r14,1 
LB_959:
	cmp r14,r9
	jge LB_960
	JZ_LINE_SPC BYTE [r13+8+r14], LB_958
LB_960
	call GRM_190
	cmp BYTE [r8+6],0
	jnz LB_963
	jmp LB_964
LB_963:
	jmp LB_961
LB_964:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_962
LB_961:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_962:
	jmp LB_966
LB_965:
	add r14,1 
LB_966:
	cmp r14,r9
	jge LB_967
	JZ_LINE_SPC BYTE [r13+8+r14], LB_965
LB_967
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_970
	jmp LB_971
LB_970:
	mov r8,unt_1
	jmp LB_968
LB_971:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],93
	jnz LB_972
	jmp LB_973
LB_972:
	mov r8,unt_1
	jmp LB_968
LB_973:
	add r14,1
	jmp LB_969
LB_968:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_969:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_974
LB_974
;; rsp=1 , %1202~1'(= r ) %1201~0'(= r ) %1200~8'(= a11◂ [ a9◂ [ ]] ) 
; #95 8'(= a11◂ [ a9◂ [ ]] ) ⊢ 1(<4)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %1203~1(<4)◂8'(= a11◂ [ a9◂ [ ]] ) %1202~1'(= r ) %1201~0'(= r ) 
; #22 1(<4)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂1(<4)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %1204~0(<2)◂1(<4)◂8'(= a11◂ [ a9◂ [ ]] ) %1202~1'(= r ) %1201~0'(= r ) 
; ∎ 0(<2)◂1(<4)◂8'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn2 0(<2)◂1(<4)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂1(<4)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_975
LB_975:
	cmp BYTE [r8+6],0
	jnz LB_948
	POP_GRM_SCC
	ret
LB_948:
	RB_GRM
	jmp LB_978
LB_977:
	add r14,1 
LB_978:
	cmp r14,r9
	jge LB_979
	JZ_LINE_SPC BYTE [r13+8+r14], LB_977
LB_979
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_982
	jmp LB_983
LB_982:
	mov r8,unt_1
	jmp LB_980
LB_983:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_984
	jmp LB_985
LB_984:
	mov r8,unt_1
	jmp LB_980
LB_985:
	add r14,1
	jmp LB_981
LB_980:
	add rsp,0
	jmp LB_976
LB_981:
	jmp LB_987
LB_986:
	add r14,1 
LB_987:
	cmp r14,r9
	jge LB_988
	JZ_LINE_SPC BYTE [r13+8+r14], LB_986
LB_988
	call GRM_77
	cmp BYTE [r8+6],0
	jnz LB_991
	jmp LB_992
LB_991:
	jmp LB_989
LB_992:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_990
LB_989:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_990:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_993
LB_993
;; rsp=1 , %1207~1'(= r ) %1206~0'(= r ) %1205~8'(= {| l |} ) 
; #93 8'(= {| l |} ) ⊢ 3(<4)◂8'(= {| l |} )
;; rsp=1 , %1208~3(<4)◂8'(= {| l |} ) %1207~1'(= r ) %1206~0'(= r ) 
; #22 3(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂3(<4)◂8'(= {| l |} )
;; rsp=1 , %1209~0(<2)◂3(<4)◂8'(= {| l |} ) %1207~1'(= r ) %1206~0'(= r ) 
; ∎ 0(<2)◂3(<4)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂3(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂3(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],3
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_994
LB_994:
	cmp BYTE [r8+6],0
	jnz LB_976
	POP_GRM_SCC
	ret
LB_976:
	RB_GRM
	jmp LB_997
LB_996:
	add r14,1 
LB_997:
	cmp r14,r9
	jge LB_998
	JZ_LINE_SPC BYTE [r13+8+r14], LB_996
LB_998
	call GRM_77
	cmp BYTE [r8+6],0
	jnz LB_1001
	jmp LB_1002
LB_1001:
	jmp LB_999
LB_1002:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1000
LB_999:
	add rsp,0
	jmp LB_995
LB_1000:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1003
LB_1003
;; rsp=1 , %1212~1'(= r ) %1211~0'(= r ) %1210~8'(= {| l |} ) 
; #93 8'(= {| l |} ) ⊢ 3(<4)◂8'(= {| l |} )
;; rsp=1 , %1213~3(<4)◂8'(= {| l |} ) %1212~1'(= r ) %1211~0'(= r ) 
; #22 3(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂3(<4)◂8'(= {| l |} )
;; rsp=1 , %1214~0(<2)◂3(<4)◂8'(= {| l |} ) %1212~1'(= r ) %1211~0'(= r ) 
; ∎ 0(<2)◂3(<4)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂3(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂3(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],3
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1004
LB_1004:
	cmp BYTE [r8+6],0
	jnz LB_995
	POP_GRM_SCC
	ret
LB_995:
	RB_GRM
	jmp LB_1007
LB_1006:
	add r14,1 
LB_1007:
	cmp r14,r9
	jge LB_1008
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1006
LB_1008
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1011
	jmp LB_1012
LB_1011:
	mov r8,unt_1
	jmp LB_1009
LB_1012:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_1013
	jmp LB_1014
LB_1013:
	mov r8,unt_1
	jmp LB_1009
LB_1014:
	add r14,1
	jmp LB_1010
LB_1009:
	add rsp,0
	jmp LB_1005
LB_1010:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1015
LB_1015
;; rsp=0 , %1216~1'(= r ) %1215~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1217~1(<2)◂{ } %1216~1'(= r ) %1215~0'(= r ) 
; #94 1(<2)◂{ } ⊢ 2(<4)◂1(<2)◂{ }
;; rsp=0 , %1218~2(<4)◂1(<2)◂{ } %1216~1'(= r ) %1215~0'(= r ) 
; #22 2(<4)◂1(<2)◂{ } ⊢ 0(<2)◂2(<4)◂1(<2)◂{ }
;; rsp=0 , %1219~0(<2)◂2(<4)◂1(<2)◂{ } %1216~1'(= r ) %1215~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂2(<4)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂2(<4)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],2
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1016
LB_1016:
	cmp BYTE [r8+6],0
	jnz LB_1005
	POP_GRM_SCC
	ret
LB_1005:
	POP_GRM_FAIL 
	ret
ETR_201:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_201
	ret
GRM_201:
	PUSH_GRM
	jmp LB_1019
LB_1018:
	add r14,1 
LB_1019:
	cmp r14,r9
	jge LB_1020
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1018
LB_1020
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1023
	jmp LB_1024
LB_1023:
	mov r8,unt_1
	jmp LB_1021
LB_1024:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_1025
	jmp LB_1026
LB_1025:
	mov r8,unt_1
	jmp LB_1021
LB_1026:
	add r14,1
	jmp LB_1022
LB_1021:
	add rsp,0
	jmp LB_1017
LB_1022:
	jmp LB_1028
LB_1027:
	add r14,1 
LB_1028:
	cmp r14,r9
	jge LB_1029
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1027
LB_1029
	call GRM_202
	cmp BYTE [r8+6],0
	jnz LB_1032
	jmp LB_1033
LB_1032:
	jmp LB_1030
LB_1033:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1031
LB_1030:
	add rsp,0
	jmp LB_1017
LB_1031:
	jmp LB_1035
LB_1034:
	add r14,1 
LB_1035:
	cmp r14,r9
	jge LB_1036
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1034
LB_1036
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1039
	jmp LB_1040
LB_1039:
	mov r8,unt_1
	jmp LB_1037
LB_1040:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_1041
	jmp LB_1042
LB_1041:
	mov r8,unt_1
	jmp LB_1037
LB_1042:
	add r14,1
	jmp LB_1038
LB_1037:
	add rsp,8
	jmp LB_1017
LB_1038:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1043
LB_1043
;; rsp=1 , %1222~1'(= r ) %1221~0'(= r ) %1220~8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) 
; #79 8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
;; rsp=1 , %1223~0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) %1222~1'(= r ) %1221~0'(= r ) 
; #22 0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
;; rsp=1 , %1224~0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) %1222~1'(= r ) %1221~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1044
LB_1044:
	cmp BYTE [r8+6],0
	jnz LB_1017
	POP_GRM_SCC
	ret
LB_1017:
	RB_GRM
	jmp LB_1047
LB_1046:
	add r14,1 
LB_1047:
	cmp r14,r9
	jge LB_1048
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1046
LB_1048
	call GRM_204
	cmp BYTE [r8+6],0
	jnz LB_1051
	jmp LB_1052
LB_1051:
	jmp LB_1049
LB_1052:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a12◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a12◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1050
LB_1049:
	add rsp,0
	jmp LB_1045
LB_1050:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1053
LB_1053
;; rsp=1 , %1227~1'(= r ) %1226~0'(= r ) %1225~8'(= a12◂ [ a9◂ [ ]{| l |}] ) 
; #78 8'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %1228~1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] ) %1227~1'(= r ) %1226~0'(= r ) 
; #22 1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %1229~0(<2)◂1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] ) %1227~1'(= r ) %1226~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1054
LB_1054:
	cmp BYTE [r8+6],0
	jnz LB_1045
	POP_GRM_SCC
	ret
LB_1045:
	POP_GRM_FAIL 
	ret
ETR_202:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_202
	ret
GRM_202:
	PUSH_GRM
	jmp LB_1057
LB_1056:
	add r14,1 
LB_1057:
	cmp r14,r9
	jge LB_1058
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1056
LB_1058
	call GRM_201
	cmp BYTE [r8+6],0
	jnz LB_1061
	jmp LB_1062
LB_1061:
	jmp LB_1059
LB_1062:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1060
LB_1059:
	add rsp,0
	jmp LB_1055
LB_1060:
	jmp LB_1064
LB_1063:
	add r14,1 
LB_1064:
	cmp r14,r9
	jge LB_1065
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1063
LB_1065
	call GRM_202
	cmp BYTE [r8+6],0
	jnz LB_1068
	jmp LB_1069
LB_1068:
	jmp LB_1066
LB_1069:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1067
LB_1066:
	add rsp,8
	jmp LB_1055
LB_1067:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1070
LB_1070
;; rsp=2 , %1233~1'(= r ) %1232~0'(= r ) %1231~9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) %1230~8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; #21 { 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1234~0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) } %1233~1'(= r ) %1232~0'(= r ) 
; #22 0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) }
;; rsp=2 , %1235~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) } %1233~1'(= r ) %1232~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_1071
LB_1071:
	cmp BYTE [r8+6],0
	jnz LB_1055
	POP_GRM_SCC
	ret
LB_1055:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1073
LB_1073
;; rsp=0 , %1237~1'(= r ) %1236~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1238~1(<2)◂{ } %1237~1'(= r ) %1236~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1239~0(<2)◂1(<2)◂{ } %1237~1'(= r ) %1236~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1074
LB_1074:
	cmp BYTE [r8+6],0
	jnz LB_1072
	POP_GRM_SCC
	ret
LB_1072:
	POP_GRM_FAIL 
	ret
ETR_203:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_203
	ret
GRM_203:
	PUSH_GRM
	jmp LB_1077
LB_1076:
	add r14,1 
LB_1077:
	cmp r14,r9
	jge LB_1078
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1076
LB_1078
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1081
	jmp LB_1082
LB_1081:
	mov r8,unt_1
	jmp LB_1079
LB_1082:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_1083
	jmp LB_1084
LB_1083:
	mov r8,unt_1
	jmp LB_1079
LB_1084:
	add r14,1
	jmp LB_1080
LB_1079:
	add rsp,0
	jmp LB_1075
LB_1080:
	jmp LB_1086
LB_1085:
	add r14,1 
LB_1086:
	cmp r14,r9
	jge LB_1087
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1085
LB_1087
	call GRM_204
	cmp BYTE [r8+6],0
	jnz LB_1090
	jmp LB_1091
LB_1090:
	jmp LB_1088
LB_1091:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a12◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a12◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1089
LB_1088:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1089:
	jmp LB_1093
LB_1092:
	add r14,1 
LB_1093:
	cmp r14,r9
	jge LB_1094
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1092
LB_1094
	call GRM_203
	cmp BYTE [r8+6],0
	jnz LB_1097
	jmp LB_1098
LB_1097:
	jmp LB_1095
LB_1098:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1096
LB_1095:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_1096:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1099
LB_1099
;; rsp=2 , %1243~1'(= r ) %1242~0'(= r ) %1241~9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1240~8'(= a12◂ [ a9◂ [ ]{| l |}] ) 
; #21 { 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %1244~0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1243~1'(= r ) %1242~0'(= r ) 
; #22 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %1245~0(<2)◂0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1243~1'(= r ) %1242~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_1100
LB_1100:
	cmp BYTE [r8+6],0
	jnz LB_1075
	POP_GRM_SCC
	ret
LB_1075:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1102
LB_1102
;; rsp=0 , %1247~1'(= r ) %1246~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1248~1(<2)◂{ } %1247~1'(= r ) %1246~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1249~0(<2)◂1(<2)◂{ } %1247~1'(= r ) %1246~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1103
LB_1103:
	cmp BYTE [r8+6],0
	jnz LB_1101
	POP_GRM_SCC
	ret
LB_1101:
	POP_GRM_FAIL 
	ret
ETR_204:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_204
	ret
GRM_204:
	PUSH_GRM
	jmp LB_1106
LB_1105:
	add r14,1 
LB_1106:
	cmp r14,r9
	jge LB_1107
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1105
LB_1107
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1110
	jmp LB_1111
LB_1110:
	mov r8,unt_1
	jmp LB_1108
LB_1111:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_1112
	cmp BYTE [rdi+1],91
	jnz LB_1112
	jmp LB_1113
LB_1112:
	mov r8,unt_1
	jmp LB_1108
LB_1113:
	add r14,2
	jmp LB_1109
LB_1108:
	add rsp,0
	jmp LB_1104
LB_1109:
	jmp LB_1115
LB_1114:
	add r14,1 
LB_1115:
	cmp r14,r9
	jge LB_1116
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1114
LB_1116
	call GRM_190
	cmp BYTE [r8+6],0
	jnz LB_1119
	jmp LB_1120
LB_1119:
	jmp LB_1117
LB_1120:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1118
LB_1117:
	add rsp,0
	jmp LB_1104
LB_1118:
	jmp LB_1122
LB_1121:
	add r14,1 
LB_1122:
	cmp r14,r9
	jge LB_1123
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1121
LB_1123
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1126
	jmp LB_1127
LB_1126:
	mov r8,unt_1
	jmp LB_1124
LB_1127:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],93
	jnz LB_1128
	jmp LB_1129
LB_1128:
	mov r8,unt_1
	jmp LB_1124
LB_1129:
	add r14,1
	jmp LB_1125
LB_1124:
	add rsp,8
	jmp LB_1104
LB_1125:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1130
LB_1130
;; rsp=1 , %1252~1'(= r ) %1251~0'(= r ) %1250~8'(= a11◂ [ a9◂ [ ]] ) 
; #92 8'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %1253~0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) %1252~1'(= r ) %1251~0'(= r ) 
; #22 0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %1254~0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) %1252~1'(= r ) %1251~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1131
LB_1131:
	cmp BYTE [r8+6],0
	jnz LB_1104
	POP_GRM_SCC
	ret
LB_1104:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1135
	jmp LB_1136
LB_1135:
	mov r8,unt_1
	jmp LB_1133
LB_1136:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_1137
	jmp LB_1138
LB_1137:
	mov r8,unt_1
	jmp LB_1133
LB_1138:
	add r14,1
	jmp LB_1134
LB_1133:
	add rsp,0
	jmp LB_1132
LB_1134:
	call GRM_77
	cmp BYTE [r8+6],0
	jnz LB_1141
	jmp LB_1142
LB_1141:
	jmp LB_1139
LB_1142:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1140
LB_1139:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1140:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1143
LB_1143
;; rsp=1 , %1257~1'(= r ) %1256~0'(= r ) %1255~8'(= {| l |} ) 
; #91 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1258~1(<2)◂8'(= {| l |} ) %1257~1'(= r ) %1256~0'(= r ) 
; #22 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1259~0(<2)◂1(<2)◂8'(= {| l |} ) %1257~1'(= r ) %1256~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1144
LB_1144:
	cmp BYTE [r8+6],0
	jnz LB_1132
	POP_GRM_SCC
	ret
LB_1132:
	RB_GRM
	jmp LB_1147
LB_1146:
	add r14,1 
LB_1147:
	cmp r14,r9
	jge LB_1148
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1146
LB_1148
	call GRM_77
	cmp BYTE [r8+6],0
	jnz LB_1151
	jmp LB_1152
LB_1151:
	jmp LB_1149
LB_1152:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1150
LB_1149:
	add rsp,0
	jmp LB_1145
LB_1150:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1153
LB_1153
;; rsp=1 , %1262~1'(= r ) %1261~0'(= r ) %1260~8'(= {| l |} ) 
; #91 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1263~1(<2)◂8'(= {| l |} ) %1262~1'(= r ) %1261~0'(= r ) 
; #22 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1264~0(<2)◂1(<2)◂8'(= {| l |} ) %1262~1'(= r ) %1261~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1154
LB_1154:
	cmp BYTE [r8+6],0
	jnz LB_1145
	POP_GRM_SCC
	ret
LB_1145:
	POP_GRM_FAIL 
	ret
ETR_205:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_205
	ret
GRM_205:
	PUSH_GRM
	jmp LB_1157
LB_1156:
	add r14,1 
LB_1157:
	cmp r14,r9
	jge LB_1158
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1156
LB_1158
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1161
	jmp LB_1162
LB_1161:
	mov r8,unt_1
	jmp LB_1159
LB_1162:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_1163
	jmp LB_1164
LB_1163:
	mov r8,unt_1
	jmp LB_1159
LB_1164:
	add r14,1
	jmp LB_1160
LB_1159:
	add rsp,0
	jmp LB_1155
LB_1160:
	jmp LB_1166
LB_1165:
	add r14,1 
LB_1166:
	cmp r14,r9
	jge LB_1167
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1165
LB_1167
	call GRM_206
	cmp BYTE [r8+6],0
	jnz LB_1170
	jmp LB_1171
LB_1170:
	jmp LB_1168
LB_1171:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1169
LB_1168:
	add rsp,0
	jmp LB_1155
LB_1169:
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
	jg LB_1177
	jmp LB_1178
LB_1177:
	mov r8,unt_1
	jmp LB_1175
LB_1178:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_1179
	jmp LB_1180
LB_1179:
	mov r8,unt_1
	jmp LB_1175
LB_1180:
	add r14,1
	jmp LB_1176
LB_1175:
	add rsp,8
	jmp LB_1155
LB_1176:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1181
LB_1181
;; rsp=1 , %1267~1'(= r ) %1266~0'(= r ) %1265~8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) 
; #79 8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
;; rsp=1 , %1268~0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1267~1'(= r ) %1266~0'(= r ) 
; #22 0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
;; rsp=1 , %1269~0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1267~1'(= r ) %1266~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1182
LB_1182:
	cmp BYTE [r8+6],0
	jnz LB_1155
	POP_GRM_SCC
	ret
LB_1155:
	RB_GRM
	jmp LB_1185
LB_1184:
	add r14,1 
LB_1185:
	cmp r14,r9
	jge LB_1186
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1184
LB_1186
	call GRM_209
	cmp BYTE [r8+6],0
	jnz LB_1189
	jmp LB_1190
LB_1189:
	jmp LB_1187
LB_1190:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a13◂ [ {| l |}] ) ⊢ 8'(= a13◂ [ {| l |}] )
; .mov_ptn 2'(= a13◂ [ {| l |}] ) ⊢ 8'(= a13◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1188
LB_1187:
	add rsp,0
	jmp LB_1183
LB_1188:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1191
LB_1191
;; rsp=1 , %1272~1'(= r ) %1271~0'(= r ) %1270~8'(= a13◂ [ {| l |}] ) 
; #78 8'(= a13◂ [ {| l |}] ) ⊢ 1(<2)◂8'(= a13◂ [ {| l |}] )
;; rsp=1 , %1273~1(<2)◂8'(= a13◂ [ {| l |}] ) %1272~1'(= r ) %1271~0'(= r ) 
; #22 1(<2)◂8'(= a13◂ [ {| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a13◂ [ {| l |}] )
;; rsp=1 , %1274~0(<2)◂1(<2)◂8'(= a13◂ [ {| l |}] ) %1272~1'(= r ) %1271~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a13◂ [ {| l |}] )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a13◂ [ {| l |}] ) ⊢ 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= a13◂ [ {| l |}] ) ⊢ 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1192
LB_1192:
	cmp BYTE [r8+6],0
	jnz LB_1183
	POP_GRM_SCC
	ret
LB_1183:
	POP_GRM_FAIL 
	ret
ETR_206:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_206
	ret
GRM_206:
	PUSH_GRM
	jmp LB_1195
LB_1194:
	add r14,1 
LB_1195:
	cmp r14,r9
	jge LB_1196
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1194
LB_1196
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_1199
	jmp LB_1200
LB_1199:
	jmp LB_1197
LB_1200:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1198
LB_1197:
	add rsp,0
	jmp LB_1193
LB_1198:
	jmp LB_1202
LB_1201:
	add r14,1 
LB_1202:
	cmp r14,r9
	jge LB_1203
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1201
LB_1203
	call GRM_206
	cmp BYTE [r8+6],0
	jnz LB_1206
	jmp LB_1207
LB_1206:
	jmp LB_1204
LB_1207:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1205
LB_1204:
	add rsp,8
	jmp LB_1193
LB_1205:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1208
LB_1208
;; rsp=2 , %1278~1'(= r ) %1277~0'(= r ) %1276~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1275~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #21 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
;; rsp=2 , %1279~0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } %1278~1'(= r ) %1277~0'(= r ) 
; #22 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
;; rsp=2 , %1280~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } %1278~1'(= r ) %1277~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_1209
LB_1209:
	cmp BYTE [r8+6],0
	jnz LB_1193
	POP_GRM_SCC
	ret
LB_1193:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1211
LB_1211
;; rsp=0 , %1282~1'(= r ) %1281~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1283~1(<2)◂{ } %1282~1'(= r ) %1281~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1284~0(<2)◂1(<2)◂{ } %1282~1'(= r ) %1281~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1212
LB_1212:
	cmp BYTE [r8+6],0
	jnz LB_1210
	POP_GRM_SCC
	ret
LB_1210:
	POP_GRM_FAIL 
	ret
ETR_207:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_207
	ret
GRM_207:
	PUSH_GRM
	jmp LB_1215
LB_1214:
	add r14,1 
LB_1215:
	cmp r14,r9
	jge LB_1216
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1214
LB_1216
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1219
	jmp LB_1220
LB_1219:
	mov r8,unt_1
	jmp LB_1217
LB_1220:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_1221
	jmp LB_1222
LB_1221:
	mov r8,unt_1
	jmp LB_1217
LB_1222:
	add r14,1
	jmp LB_1218
LB_1217:
	add rsp,0
	jmp LB_1213
LB_1218:
	jmp LB_1224
LB_1223:
	add r14,1 
LB_1224:
	cmp r14,r9
	jge LB_1225
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1223
LB_1225
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_1228
	jmp LB_1229
LB_1228:
	jmp LB_1226
LB_1229:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1227
LB_1226:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1227:
	jmp LB_1231
LB_1230:
	add r14,1 
LB_1231:
	cmp r14,r9
	jge LB_1232
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1230
LB_1232
	call GRM_207
	cmp BYTE [r8+6],0
	jnz LB_1235
	jmp LB_1236
LB_1235:
	jmp LB_1233
LB_1236:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1234
LB_1233:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_1234:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1237
LB_1237
;; rsp=2 , %1288~1'(= r ) %1287~0'(= r ) %1286~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1285~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #21 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
;; rsp=2 , %1289~0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } %1288~1'(= r ) %1287~0'(= r ) 
; #22 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
;; rsp=2 , %1290~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } %1288~1'(= r ) %1287~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_1238
LB_1238:
	cmp BYTE [r8+6],0
	jnz LB_1213
	POP_GRM_SCC
	ret
LB_1213:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1240
LB_1240
;; rsp=0 , %1292~1'(= r ) %1291~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1293~1(<2)◂{ } %1292~1'(= r ) %1291~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1294~0(<2)◂1(<2)◂{ } %1292~1'(= r ) %1291~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a8◂ [ a13◂ [ {| l |}]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1241
LB_1241:
	cmp BYTE [r8+6],0
	jnz LB_1239
	POP_GRM_SCC
	ret
LB_1239:
	POP_GRM_FAIL 
	ret
ETR_208:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_208
	ret
GRM_208:
	PUSH_GRM
	jmp LB_1244
LB_1243:
	add r14,1 
LB_1244:
	cmp r14,r9
	jge LB_1245
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1243
LB_1245
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1248
	jmp LB_1249
LB_1248:
	mov r8,unt_1
	jmp LB_1246
LB_1249:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_1250
	jmp LB_1251
LB_1250:
	mov r8,unt_1
	jmp LB_1246
LB_1251:
	add r14,1
	jmp LB_1247
LB_1246:
	add rsp,0
	jmp LB_1242
LB_1247:
	jmp LB_1253
LB_1252:
	add r14,1 
LB_1253:
	cmp r14,r9
	jge LB_1254
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1252
LB_1254
	call GRM_209
	cmp BYTE [r8+6],0
	jnz LB_1257
	jmp LB_1258
LB_1257:
	jmp LB_1255
LB_1258:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a13◂ [ {| l |}] ) ⊢ 8'(= a13◂ [ {| l |}] )
; .mov_ptn 2'(= a13◂ [ {| l |}] ) ⊢ 8'(= a13◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1256
LB_1255:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1256:
	jmp LB_1260
LB_1259:
	add r14,1 
LB_1260:
	cmp r14,r9
	jge LB_1261
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1259
LB_1261
	call GRM_208
	cmp BYTE [r8+6],0
	jnz LB_1264
	jmp LB_1265
LB_1264:
	jmp LB_1262
LB_1265:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a13◂ [ {| l |}]] ) ⊢ 9'(= a2◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a2◂ [ a13◂ [ {| l |}]] ) ⊢ 9'(= a2◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1263
LB_1262:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_1263:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1266
LB_1266
;; rsp=2 , %1298~1'(= r ) %1297~0'(= r ) %1296~9'(= a2◂ [ a13◂ [ {| l |}]] ) %1295~8'(= a13◂ [ {| l |}] ) 
; #21 { 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
;; rsp=2 , %1299~0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } %1298~1'(= r ) %1297~0'(= r ) 
; #22 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
;; rsp=2 , %1300~0(<2)◂0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } %1298~1'(= r ) %1297~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a13◂ [ {| l |}]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_1267
LB_1267:
	cmp BYTE [r8+6],0
	jnz LB_1242
	POP_GRM_SCC
	ret
LB_1242:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1269
LB_1269
;; rsp=0 , %1302~1'(= r ) %1301~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1303~1(<2)◂{ } %1302~1'(= r ) %1301~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1304~0(<2)◂1(<2)◂{ } %1302~1'(= r ) %1301~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a13◂ [ {| l |}]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1270
LB_1270:
	cmp BYTE [r8+6],0
	jnz LB_1268
	POP_GRM_SCC
	ret
LB_1268:
	POP_GRM_FAIL 
	ret
ETR_209:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_209
	ret
GRM_209:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1274
	jmp LB_1275
LB_1274:
	mov r8,unt_1
	jmp LB_1272
LB_1275:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],37
	jnz LB_1276
	jmp LB_1277
LB_1276:
	mov r8,unt_1
	jmp LB_1272
LB_1277:
	add r14,1
	jmp LB_1273
LB_1272:
	add rsp,0
	jmp LB_1271
LB_1273:
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_1280
	jmp LB_1281
LB_1280:
	jmp LB_1278
LB_1281:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1279
LB_1278:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1279:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1282
LB_1282
;; rsp=1 , %1307~1'(= r ) %1306~0'(= r ) %1305~8'(= {| l |} ) 
; #89 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1308~1(<2)◂8'(= {| l |} ) %1307~1'(= r ) %1306~0'(= r ) 
; #22 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1309~0(<2)◂1(<2)◂8'(= {| l |} ) %1307~1'(= r ) %1306~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a13◂ [ {| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1283
LB_1283:
	cmp BYTE [r8+6],0
	jnz LB_1271
	POP_GRM_SCC
	ret
LB_1271:
	RB_GRM
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_1287
	jmp LB_1288
LB_1287:
	jmp LB_1285
LB_1288:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1286
LB_1285:
	add rsp,0
	jmp LB_1284
LB_1286:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1289
LB_1289
;; rsp=1 , %1312~1'(= r ) %1311~0'(= r ) %1310~8'(= {| l |} ) 
; #89 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %1313~1(<2)◂8'(= {| l |} ) %1312~1'(= r ) %1311~0'(= r ) 
; #22 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %1314~0(<2)◂1(<2)◂8'(= {| l |} ) %1312~1'(= r ) %1311~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a13◂ [ {| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1290
LB_1290:
	cmp BYTE [r8+6],0
	jnz LB_1284
	POP_GRM_SCC
	ret
LB_1284:
	RB_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1294
	jmp LB_1295
LB_1294:
	mov r8,unt_1
	jmp LB_1292
LB_1295:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_1296
	jmp LB_1297
LB_1296:
	mov r8,unt_1
	jmp LB_1292
LB_1297:
	add r14,1
	jmp LB_1293
LB_1292:
	add rsp,0
	jmp LB_1291
LB_1293:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1298
LB_1298
;; rsp=0 , %1316~1'(= r ) %1315~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1317~1(<2)◂{ } %1316~1'(= r ) %1315~0'(= r ) 
; #90 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1318~0(<2)◂1(<2)◂{ } %1316~1'(= r ) %1315~0'(= r ) 
; #22 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %1319~0(<2)◂0(<2)◂1(<2)◂{ } %1316~1'(= r ) %1315~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a13◂ [ {| l |}]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1299
LB_1299:
	cmp BYTE [r8+6],0
	jnz LB_1291
	POP_GRM_SCC
	ret
LB_1291:
	POP_GRM_FAIL 
	ret
LB_1425: ;; #51 { 0'(= a2◂ [ a23◂ [ ]] ) 1'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0'(= a2◂ [ a23◂ [ ]] ) : ({ _lst◂2967'(=2968'(=_t23)) _lst◂_t23 }→_lst◂_t23)
;; rsp=0 , %116~1'(= a2◂ [ a23◂ [ ]] ) %115~0'(= a2◂ [ a23◂ [ ]] ) 
;; ?; 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 1(<2)◂{ }
	mov rdi,r14
	cmp BYTE [rdi+6],1
	jnz LB_1426
;; rsp=0 , %115~0'(= a2◂ [ a23◂ [ ]] ) 
; ∎ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn2 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	ret
LB_1426:
;; ?; 1'(= a2◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂{ 2'(= a23◂ [ ] ) 3'(= a2◂ [ a23◂ [ ]] ) }
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %118~3'(= a2◂ [ a23◂ [ ]] ) %117~2'(= a23◂ [ ] ) %115~0'(= a2◂ [ a23◂ [ ]] ) 
; #21 { 2'(= a23◂ [ ] ) 0'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0(<2)◂{ 2'(= a23◂ [ ] ) 0'(= a2◂ [ a23◂ [ ]] ) }
;; rsp=0 , %119~0(<2)◂{ 2'(= a23◂ [ ] ) 0'(= a2◂ [ a23◂ [ ]] ) } %118~3'(= a2◂ [ a23◂ [ ]] ) 
; #51 { 0(<2)◂{ 2'(= a23◂ [ ] ) 0'(= a2◂ [ a23◂ [ ]] ) } 3'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn2 { 0(<2)◂{ 2'(= a23◂ [ ] ) 0'(= a2◂ [ a23◂ [ ]] ) } 3'(= a2◂ [ a23◂ [ ]] ) } ⊢ { 0'(= a2◂ [ a23◂ [ ]] ) 1'(= a2◂ [ a23◂ [ ]] ) }
; .mov_ptn 3'(= a2◂ [ a23◂ [ ]] ) ⊢ 1'(= a2◂ [ a23◂ [ ]] )
	mov rax,r9
	mov r14,rax
	mov r10,r13
; .mov_ptn 0(<2)◂{ 2'(= a23◂ [ ] ) 4'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	ALC_RCD 2
	mov r9,rax
	mov rax,r8
	mov QWORD [r9+8+8*0],rax
	mov rax,r10
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r13,rax
	call LB_1425
;; rsp=0 , %120~0'(= a2◂ [ a23◂ [ ]] ) 
; ∎ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn2 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	ret
LB_1424: ;; #52 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] ) : (_lst◂_t23→_lst◂_t23)
;; rsp=0 , %121~0'(= a2◂ [ a23◂ [ ]] ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %122~1(<2)◂{ } %121~0'(= a2◂ [ a23◂ [ ]] ) 
; #51 { 1(<2)◂{ } 0'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn2 { 1(<2)◂{ } 0'(= a2◂ [ a23◂ [ ]] ) } ⊢ { 0'(= a2◂ [ a23◂ [ ]] ) 1'(= a2◂ [ a23◂ [ ]] ) }
; .mov_ptn 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 1'(= a2◂ [ a23◂ [ ]] )
	mov rax,r13
	mov r14,rax
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	mov rax,unt 
	mov rax,unt_1
	mov r13,rax
	call LB_1425
;; rsp=0 , %123~0'(= a2◂ [ a23◂ [ ]] ) 
; ∎ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn2 0'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	ret
ETR_210:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_210
	ret
GRM_210:
	PUSH_GRM
	jmp LB_1302
LB_1301:
	add r14,1 
LB_1302:
	cmp r14,r9
	jge LB_1303
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1301
LB_1303
	call GRM_214
	cmp BYTE [r8+6],0
	jnz LB_1306
	jmp LB_1307
LB_1306:
	jmp LB_1304
LB_1307:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1305
LB_1304:
	add rsp,0
	jmp LB_1300
LB_1305:
	jmp LB_1309
LB_1308:
	add r14,1 
LB_1309:
	cmp r14,r9
	jge LB_1310
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1308
LB_1310
	call GRM_213
	cmp BYTE [r8+6],0
	jnz LB_1313
	jmp LB_1314
LB_1313:
	jmp LB_1311
LB_1314:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 9'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 9'(= a2◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1312
LB_1311:
	add rsp,8
	jmp LB_1300
LB_1312:
	jmp LB_1316
LB_1315:
	add r14,1 
LB_1316:
	cmp r14,r9
	jge LB_1317
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1315
LB_1317
	call GRM_212
	cmp BYTE [r8+6],0
	jnz LB_1320
	jmp LB_1321
LB_1320:
	jmp LB_1318
LB_1321:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a3◂ [ a23◂ [ ]] ) ⊢ 10'(= a3◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a3◂ [ a23◂ [ ]] ) ⊢ 10'(= a3◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1319
LB_1318:
	add rsp,16
	jmp LB_1300
LB_1319:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_1322
LB_1322
;; rsp=3 , %1324~1'(= r ) %1323~0'(= r ) %1322~10'(= a3◂ [ a23◂ [ ]] ) %1321~9'(= a2◂ [ a23◂ [ ]] ) %1320~8'(= a23◂ [ ] ) 
; #186 { 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 2'(= a23◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ { 0'(= a23◂ [ ] ) 1'(= a2◂ [ a23◂ [ ]] ) }
; .mov_ptn 9'(= a2◂ [ a23◂ [ ]] ) ⊢ 1'(= a2◂ [ a23◂ [ ]] )
	mov rax,QWORD [rsp-8+8*4]
	mov r14,rax
; .mov_ptn 8'(= a23◂ [ ] ) ⊢ 0'(= a23◂ [ ] )
	mov rax,QWORD [rsp-8+8*5]
	mov r13,rax
	call ETR_186
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=3 , %1325~2'(= a23◂ [ ] ) %1324~1'(= r ) %1323~0'(= r ) %1322~10'(= a3◂ [ a23◂ [ ]] ) 
;; ?; 10'(= a3◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂3'(= a23◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_1324
	mov r9,QWORD [rdi+8]
;; rsp=3 , %1326~3'(= a23◂ [ ] ) %1325~2'(= a23◂ [ ] ) %1324~1'(= r ) %1323~0'(= r ) 
; #139 { 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) } ⊢ 1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) }
;; rsp=3 , %1327~1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) } %1324~1'(= r ) %1323~0'(= r ) 
; #22 1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) } ⊢ 0(<2)◂1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) }
;; rsp=3 , %1328~0(<2)◂1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) } %1324~1'(= r ) %1323~0'(= r ) 
; ∎ 0(<2)◂1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) }
; .mov_ptn2 0(<2)◂1(<5)◂{ 2'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) } ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<5)◂{ 0'(= a23◂ [ ] ) 3'(= a23◂ [ ] ) } ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	ALC_RCD 2
	mov r14,rax
	mov rax,r13
	mov QWORD [r14+8+8*0],rax
	mov rax,r9
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_1323
LB_1324:
;; ?; 10'(= a3◂ [ a23◂ [ ]] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %1325~2'(= a23◂ [ ] ) %1324~1'(= r ) %1323~0'(= r ) 
; #22 2'(= a23◂ [ ] ) ⊢ 0(<2)◂2'(= a23◂ [ ] )
;; rsp=3 , %1329~0(<2)◂2'(= a23◂ [ ] ) %1324~1'(= r ) %1323~0'(= r ) 
; ∎ 0(<2)◂2'(= a23◂ [ ] )
; .mov_ptn2 0(<2)◂2'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_1323
LB_1323:
	cmp BYTE [r8+6],0
	jnz LB_1300
	POP_GRM_SCC
	ret
LB_1300:
	POP_GRM_FAIL 
	ret
ETR_211:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_211
	ret
GRM_211:
	PUSH_GRM
	jmp LB_1327
LB_1326:
	add r14,1 
LB_1327:
	cmp r14,r9
	jge LB_1328
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1326
LB_1328
	call GRM_210
	cmp BYTE [r8+6],0
	jnz LB_1331
	jmp LB_1332
LB_1331:
	jmp LB_1329
LB_1332:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1330
LB_1329:
	add rsp,0
	jmp LB_1325
LB_1330:
	jmp LB_1334
LB_1333:
	add r14,1 
LB_1334:
	cmp r14,r9
	jge LB_1335
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1333
LB_1335
	call GRM_211
	cmp BYTE [r8+6],0
	jnz LB_1338
	jmp LB_1339
LB_1338:
	jmp LB_1336
LB_1339:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 9'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 9'(= a2◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1337
LB_1336:
	add rsp,8
	jmp LB_1325
LB_1337:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1340
LB_1340
;; rsp=2 , %1333~1'(= r ) %1332~0'(= r ) %1331~9'(= a2◂ [ a23◂ [ ]] ) %1330~8'(= a23◂ [ ] ) 
; #21 { 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) }
;; rsp=2 , %1334~0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } %1333~1'(= r ) %1332~0'(= r ) 
; #22 0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) }
;; rsp=2 , %1335~0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } %1333~1'(= r ) %1332~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_1341
LB_1341:
	cmp BYTE [r8+6],0
	jnz LB_1325
	POP_GRM_SCC
	ret
LB_1325:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1343
LB_1343
;; rsp=0 , %1337~1'(= r ) %1336~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1338~1(<2)◂{ } %1337~1'(= r ) %1336~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1339~0(<2)◂1(<2)◂{ } %1337~1'(= r ) %1336~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1344
LB_1344:
	cmp BYTE [r8+6],0
	jnz LB_1342
	POP_GRM_SCC
	ret
LB_1342:
	POP_GRM_FAIL 
	ret
ETR_212:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_212
	ret
GRM_212:
	PUSH_GRM
	jmp LB_1347
LB_1346:
	add r14,1 
LB_1347:
	cmp r14,r9
	jge LB_1348
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1346
LB_1348
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1351
	jmp LB_1352
LB_1351:
	mov r8,unt_1
	jmp LB_1349
LB_1352:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1353
	cmp BYTE [rdi+1],134
	jnz LB_1353
	cmp BYTE [rdi+2],146
	jnz LB_1353
	jmp LB_1354
LB_1353:
	mov r8,unt_1
	jmp LB_1349
LB_1354:
	add r14,3
	jmp LB_1350
LB_1349:
	add rsp,0
	jmp LB_1345
LB_1350:
	jmp LB_1356
LB_1355:
	add r14,1 
LB_1356:
	cmp r14,r9
	jge LB_1357
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1355
LB_1357
	call GRM_210
	cmp BYTE [r8+6],0
	jnz LB_1360
	jmp LB_1361
LB_1360:
	jmp LB_1358
LB_1361:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1359
LB_1358:
	add rsp,0
	jmp LB_1345
LB_1359:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1362
LB_1362
;; rsp=1 , %1342~1'(= r ) %1341~0'(= r ) %1340~8'(= a23◂ [ ] ) 
; #22 8'(= a23◂ [ ] ) ⊢ 0(<2)◂8'(= a23◂ [ ] )
;; rsp=1 , %1343~0(<2)◂8'(= a23◂ [ ] ) %1342~1'(= r ) %1341~0'(= r ) 
; #22 0(<2)◂8'(= a23◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a23◂ [ ] )
;; rsp=1 , %1344~0(<2)◂0(<2)◂8'(= a23◂ [ ] ) %1342~1'(= r ) %1341~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a23◂ [ ] )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a3◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a3◂ [ a23◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1363
LB_1363:
	cmp BYTE [r8+6],0
	jnz LB_1345
	POP_GRM_SCC
	ret
LB_1345:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1365
LB_1365
;; rsp=0 , %1346~1'(= r ) %1345~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1347~1(<2)◂{ } %1346~1'(= r ) %1345~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1348~0(<2)◂1(<2)◂{ } %1346~1'(= r ) %1345~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ a23◂ [ ]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1366
LB_1366:
	cmp BYTE [r8+6],0
	jnz LB_1364
	POP_GRM_SCC
	ret
LB_1364:
	POP_GRM_FAIL 
	ret
ETR_213:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_213
	ret
GRM_213:
	PUSH_GRM
	jmp LB_1369
LB_1368:
	add r14,1 
LB_1369:
	cmp r14,r9
	jge LB_1370
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1368
LB_1370
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_1373
	jmp LB_1374
LB_1373:
	mov r8,unt_1
	jmp LB_1371
LB_1374:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1375
	cmp BYTE [rdi+1],151
	jnz LB_1375
	cmp BYTE [rdi+2],130
	jnz LB_1375
	jmp LB_1376
LB_1375:
	mov r8,unt_1
	jmp LB_1371
LB_1376:
	add r14,3
	jmp LB_1372
LB_1371:
	add rsp,0
	jmp LB_1367
LB_1372:
	jmp LB_1378
LB_1377:
	add r14,1 
LB_1378:
	cmp r14,r9
	jge LB_1379
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1377
LB_1379
	call GRM_214
	cmp BYTE [r8+6],0
	jnz LB_1382
	jmp LB_1383
LB_1382:
	jmp LB_1380
LB_1383:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1381
LB_1380:
	add rsp,0
	jmp LB_1367
LB_1381:
	jmp LB_1385
LB_1384:
	add r14,1 
LB_1385:
	cmp r14,r9
	jge LB_1386
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1384
LB_1386
	call GRM_213
	cmp BYTE [r8+6],0
	jnz LB_1389
	jmp LB_1390
LB_1389:
	jmp LB_1387
LB_1390:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 9'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 9'(= a2◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1388
LB_1387:
	add rsp,8
	jmp LB_1367
LB_1388:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1391
LB_1391
;; rsp=2 , %1352~1'(= r ) %1351~0'(= r ) %1350~9'(= a2◂ [ a23◂ [ ]] ) %1349~8'(= a23◂ [ ] ) 
; #21 { 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) }
;; rsp=2 , %1353~0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } %1352~1'(= r ) %1351~0'(= r ) 
; #22 0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) }
;; rsp=2 , %1354~0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } %1352~1'(= r ) %1351~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a23◂ [ ] ) 9'(= a2◂ [ a23◂ [ ]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_1392
LB_1392:
	cmp BYTE [r8+6],0
	jnz LB_1367
	POP_GRM_SCC
	ret
LB_1367:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1394
LB_1394
;; rsp=0 , %1356~1'(= r ) %1355~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1357~1(<2)◂{ } %1356~1'(= r ) %1355~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1358~0(<2)◂1(<2)◂{ } %1356~1'(= r ) %1355~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a23◂ [ ]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1395
LB_1395:
	cmp BYTE [r8+6],0
	jnz LB_1393
	POP_GRM_SCC
	ret
LB_1393:
	POP_GRM_FAIL 
	ret
ETR_214:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_214
	ret
GRM_214:
	PUSH_GRM
	jmp LB_1398
LB_1397:
	add r14,1 
LB_1398:
	cmp r14,r9
	jge LB_1399
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1397
LB_1399
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1402
	jmp LB_1403
LB_1402:
	mov r8,unt_1
	jmp LB_1400
LB_1403:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],123
	jnz LB_1404
	jmp LB_1405
LB_1404:
	mov r8,unt_1
	jmp LB_1400
LB_1405:
	add r14,1
	jmp LB_1401
LB_1400:
	add rsp,0
	jmp LB_1396
LB_1401:
	jmp LB_1407
LB_1406:
	add r14,1 
LB_1407:
	cmp r14,r9
	jge LB_1408
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1406
LB_1408
	call GRM_211
	cmp BYTE [r8+6],0
	jnz LB_1411
	jmp LB_1412
LB_1411:
	jmp LB_1409
LB_1412:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 8'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 8'(= a2◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1410
LB_1409:
	add rsp,0
	jmp LB_1396
LB_1410:
	jmp LB_1414
LB_1413:
	add r14,1 
LB_1414:
	cmp r14,r9
	jge LB_1415
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1413
LB_1415
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1418
	jmp LB_1419
LB_1418:
	mov r8,unt_1
	jmp LB_1416
LB_1419:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],125
	jnz LB_1420
	jmp LB_1421
LB_1420:
	mov r8,unt_1
	jmp LB_1416
LB_1421:
	add r14,1
	jmp LB_1417
LB_1416:
	add rsp,8
	jmp LB_1396
LB_1417:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1422
LB_1422
;; rsp=1 , %1361~1'(= r ) %1360~0'(= r ) %1359~8'(= a2◂ [ a23◂ [ ]] ) 
; #52 8'(= a2◂ [ a23◂ [ ]] ) ⊢ 2'(= a2◂ [ a23◂ [ ]] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 8'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn 8'(= a2◂ [ a23◂ [ ]] ) ⊢ 0'(= a2◂ [ a23◂ [ ]] )
	mov rax,QWORD [rsp-8+8*3]
	mov r13,rax
	call LB_1424
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %1362~2'(= a2◂ [ a23◂ [ ]] ) %1361~1'(= r ) %1360~0'(= r ) 
; #140 2'(= a2◂ [ a23◂ [ ]] ) ⊢ 0(<5)◂2'(= a2◂ [ a23◂ [ ]] )
;; rsp=0 , %1363~0(<5)◂2'(= a2◂ [ a23◂ [ ]] ) %1361~1'(= r ) %1360~0'(= r ) 
; #22 0(<5)◂2'(= a2◂ [ a23◂ [ ]] ) ⊢ 0(<2)◂0(<5)◂2'(= a2◂ [ a23◂ [ ]] )
;; rsp=0 , %1364~0(<2)◂0(<5)◂2'(= a2◂ [ a23◂ [ ]] ) %1361~1'(= r ) %1360~0'(= r ) 
; ∎ 0(<2)◂0(<5)◂2'(= a2◂ [ a23◂ [ ]] )
; .mov_ptn2 0(<2)◂0(<5)◂2'(= a2◂ [ a23◂ [ ]] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<5)◂0'(= a2◂ [ a23◂ [ ]] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1423
LB_1423:
	cmp BYTE [r8+6],0
	jnz LB_1396
	POP_GRM_SCC
	ret
LB_1396:
	RB_GRM
	jmp LB_1429
LB_1428:
	add r14,1 
LB_1429:
	cmp r14,r9
	jge LB_1430
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1428
LB_1430
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1433
	jmp LB_1434
LB_1433:
	mov r8,unt_1
	jmp LB_1431
LB_1434:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],40
	jnz LB_1435
	jmp LB_1436
LB_1435:
	mov r8,unt_1
	jmp LB_1431
LB_1436:
	add r14,1
	jmp LB_1432
LB_1431:
	add rsp,0
	jmp LB_1427
LB_1432:
	jmp LB_1438
LB_1437:
	add r14,1 
LB_1438:
	cmp r14,r9
	jge LB_1439
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1437
LB_1439
	call GRM_210
	cmp BYTE [r8+6],0
	jnz LB_1442
	jmp LB_1443
LB_1442:
	jmp LB_1440
LB_1443:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1441
LB_1440:
	add rsp,0
	jmp LB_1427
LB_1441:
	jmp LB_1445
LB_1444:
	add r14,1 
LB_1445:
	cmp r14,r9
	jge LB_1446
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1444
LB_1446
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1449
	jmp LB_1450
LB_1449:
	mov r8,unt_1
	jmp LB_1447
LB_1450:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],41
	jnz LB_1451
	jmp LB_1452
LB_1451:
	mov r8,unt_1
	jmp LB_1447
LB_1452:
	add r14,1
	jmp LB_1448
LB_1447:
	add rsp,8
	jmp LB_1427
LB_1448:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1453
LB_1453
;; rsp=1 , %1367~1'(= r ) %1366~0'(= r ) %1365~8'(= a23◂ [ ] ) 
; #22 8'(= a23◂ [ ] ) ⊢ 0(<2)◂8'(= a23◂ [ ] )
;; rsp=1 , %1368~0(<2)◂8'(= a23◂ [ ] ) %1367~1'(= r ) %1366~0'(= r ) 
; ∎ 0(<2)◂8'(= a23◂ [ ] )
; .mov_ptn2 0(<2)◂8'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
; .mov_ptn 0(<2)◂8'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1454
LB_1454:
	cmp BYTE [r8+6],0
	jnz LB_1427
	POP_GRM_SCC
	ret
LB_1427:
	RB_GRM
	jmp LB_1457
LB_1456:
	add r14,1 
LB_1457:
	cmp r14,r9
	jge LB_1458
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1456
LB_1458
	call GRM_215
	cmp BYTE [r8+6],0
	jnz LB_1461
	jmp LB_1462
LB_1461:
	jmp LB_1459
LB_1462:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1460
LB_1459:
	add rsp,0
	jmp LB_1455
LB_1460:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1463
LB_1463
;; rsp=1 , %1371~1'(= r ) %1370~0'(= r ) %1369~8'(= {| l |} ) 
; #136 8'(= {| l |} ) ⊢ 4(<5)◂8'(= {| l |} )
;; rsp=1 , %1372~4(<5)◂8'(= {| l |} ) %1371~1'(= r ) %1370~0'(= r ) 
; #22 4(<5)◂8'(= {| l |} ) ⊢ 0(<2)◂4(<5)◂8'(= {| l |} )
;; rsp=1 , %1373~0(<2)◂4(<5)◂8'(= {| l |} ) %1371~1'(= r ) %1370~0'(= r ) 
; ∎ 0(<2)◂4(<5)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂4(<5)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
; .mov_ptn 0(<2)◂4(<5)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],4
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1464
LB_1464:
	cmp BYTE [r8+6],0
	jnz LB_1455
	POP_GRM_SCC
	ret
LB_1455:
	RB_GRM
	jmp LB_1467
LB_1466:
	add r14,1 
LB_1467:
	cmp r14,r9
	jge LB_1468
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1466
LB_1468
	call GRM_189
	cmp BYTE [r8+6],0
	jnz LB_1471
	jmp LB_1472
LB_1471:
	jmp LB_1469
LB_1472:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1470
LB_1469:
	add rsp,0
	jmp LB_1465
LB_1470:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1473
LB_1473
;; rsp=1 , %1376~1'(= r ) %1375~0'(= r ) %1374~8'(= a9◂ [ ] ) 
; #137 8'(= a9◂ [ ] ) ⊢ 3(<5)◂8'(= a9◂ [ ] )
;; rsp=1 , %1377~3(<5)◂8'(= a9◂ [ ] ) %1376~1'(= r ) %1375~0'(= r ) 
; #22 3(<5)◂8'(= a9◂ [ ] ) ⊢ 0(<2)◂3(<5)◂8'(= a9◂ [ ] )
;; rsp=1 , %1378~0(<2)◂3(<5)◂8'(= a9◂ [ ] ) %1376~1'(= r ) %1375~0'(= r ) 
; ∎ 0(<2)◂3(<5)◂8'(= a9◂ [ ] )
; .mov_ptn2 0(<2)◂3(<5)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
; .mov_ptn 0(<2)◂3(<5)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a23◂ [ ]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1474
LB_1474:
	cmp BYTE [r8+6],0
	jnz LB_1465
	POP_GRM_SCC
	ret
LB_1465:
	POP_GRM_FAIL 
	ret
ETR_215:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_215
	ret
GRM_215:
	PUSH_GRM
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_1478
	jmp LB_1479
LB_1478:
	jmp LB_1476
LB_1479:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1477
LB_1476:
	add rsp,0
	jmp LB_1475
LB_1477:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1482
	jmp LB_1483
LB_1482:
	mov r8,unt_1
	jmp LB_1480
LB_1483:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_1484
	jmp LB_1485
LB_1484:
	mov r8,unt_1
	jmp LB_1480
LB_1485:
	add r14,1
	jmp LB_1481
LB_1480:
	add rsp,8
	jmp LB_1475
LB_1481:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1486
LB_1486
;; rsp=1 , %1381~1'(= r ) %1380~0'(= r ) %1379~8'(= {| l |} ) 
; #22 8'(= {| l |} ) ⊢ 0(<2)◂8'(= {| l |} )
;; rsp=1 , %1382~0(<2)◂8'(= {| l |} ) %1381~1'(= r ) %1380~0'(= r ) 
; ∎ 0(<2)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
; .mov_ptn 0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,8
	jmp LB_1487
LB_1487:
	cmp BYTE [r8+6],0
	jnz LB_1475
	POP_GRM_SCC
	ret
LB_1475:
	POP_GRM_FAIL 
	ret
LB_1600: ;; #53 { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] ) : ({ _lst◂{ _r64 _r64 _s8 } _lst◂{ _r64 _r64 _s8 } }→_lst◂{ _r64 _r64 _s8 })
;; rsp=0 , %125~1'(= a2◂ [ *{ rr{| l |}}] ) %124~0'(= a2◂ [ *{ rr{| l |}}] ) 
;; ? 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂{ 2'(= *{ rr{| l |}} ) 3'(= a2◂ [ *{ rr{| l |}}] ) }
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_1601
	mov r8, QWORD [r13+8]
	mov r9, QWORD [r13+16]
;; rsp=0 , %127~3'(= a2◂ [ *{ rr{| l |}}] ) %126~2'(= *{ rr{| l |}} ) %125~1'(= a2◂ [ *{ rr{| l |}}] ) 
; #53 { 3'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 3'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r9
	mov r13,rax
	call LB_1600
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %128~0'(= a2◂ [ *{ rr{| l |}}] ) %126~2'(= *{ rr{| l |}} ) 
; #21 { 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %129~0(<2)◂{ 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) } 
; ∎ 0(<2)◂{ 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn2 0(<2)◂{ 2'(= *{ rr{| l |}} ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov r14,r13
; .mov_ptn 0(<2)◂{ 2'(= *{ rr{| l |}} ) 1'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	ALC_RCD 2
	mov r9,rax
	mov rax,r8
	mov QWORD [r9+8+8*0],rax
	mov rax,r14
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r13,rax
	ret
LB_1601:
;; ?. 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %125~1'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn 1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r14
	mov r13,rax
	ret
LB_1596: ;; #194 { 0'(= a35◂ [ *{ }] ) 1'(= a35◂ [ *{ }] ) } ⊢ 0'(= a35◂ [ *{ *{ }*{ }}] ) : ({ _t35◂{ } _t35◂{ } }→_t35◂{ { } { } })
;; rsp=0 , %1134~1'(= a35◂ [ *{ }] ) %1133~0'(= a35◂ [ *{ }] ) 
;; ? 0'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂0'(= *{ } )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_1597
;; rsp=0 , %1136~0'(= *{ } ) %1134~1'(= a35◂ [ *{ }] ) 
;; ? 1'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂1'(= *{ } )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_1598
;; rsp=0 , %1138~1'(= *{ } ) %1136~0'(= *{ } ) 
; #193 { 0'(= *{ } ) 1'(= *{ } ) } ⊢ 0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) }
;; rsp=0 , %1139~0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) } 
; ∎ 0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) }
; .mov_ptn2 0(<2)◂{ 0'(= *{ } ) 1'(= *{ } ) } ⊢ 0'(= a35◂ [ *{ *{ }*{ }}] )
	mov r8,r13
; .mov_ptn 0(<2)◂{ 2'(= *{ } ) 1'(= *{ } ) } ⊢ 0'(= a35◂ [ *{ *{ }*{ }}] )
	ALC_RCD 2
	mov r9,rax
	mov rax,r8
	mov QWORD [r9+8+8*0],rax
	mov rax,r14
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r13,rax
	ret
LB_1598:
;; ?. 1'(= a35◂ [ *{ }] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1137~2'(= a2◂ [ *{ rr{| l |}}] ) %1136~0'(= *{ } ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1140~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1136~0'(= *{ } ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ }*{ }}] )
; .mov_ptn 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ }*{ }}] )
	mov rax,r8
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_1597:
;; ?. 0'(= a35◂ [ *{ }] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1135~2'(= a2◂ [ *{ rr{| l |}}] ) %1134~1'(= a35◂ [ *{ }] ) 
;; ? 1'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂1'(= *{ } )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_1599
;; rsp=0 , %1142~1'(= *{ } ) %1135~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1143~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1142~1'(= *{ } ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ }*{ }}] )
; .mov_ptn 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ }*{ }}] )
	mov rax,r8
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_1599:
;; ?. 1'(= a35◂ [ *{ }] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1141~0'(= a2◂ [ *{ rr{| l |}}] ) %1135~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #53 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r13
	mov r14,rax
; .mov_ptn 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r8
	mov r13,rax
	call LB_1600
;; rsp=0 , %1144~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #192 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1145~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ }*{ }}] )
	mov r14,r13
; .mov_ptn 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ }*{ }}] )
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
ETR_217:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_217
	ret
GRM_217:
	PUSH_GRM
	jmp LB_1490
LB_1489:
	add r14,1 
LB_1490:
	cmp r14,r9
	jge LB_1491
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1489
LB_1491
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1494
	jmp LB_1495
LB_1494:
	mov r8,unt_1
	jmp LB_1492
LB_1495:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1496
	jmp LB_1497
LB_1496:
	mov r8,unt_1
	jmp LB_1492
LB_1497:
	add r14,1
	jmp LB_1493
LB_1492:
	add rsp,0
	jmp LB_1488
LB_1493:
	jmp LB_1499
LB_1498:
	add r14,1 
LB_1499:
	cmp r14,r9
	jge LB_1500
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1498
LB_1500
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_1503
	jmp LB_1504
LB_1503:
	jmp LB_1501
LB_1504:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1502
LB_1501:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1502:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1505
LB_1505
;; rsp=1 , %1385~1'(= r ) %1384~0'(= r ) %1383~8'(= a35◂ [ *{ }] ) 
; #193 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %1386~0(<2)◂{ } %1385~1'(= r ) %1384~0'(= r ) %1383~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=1 , %1387~0(<2)◂0(<2)◂{ } %1385~1'(= r ) %1384~0'(= r ) %1383~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1506
LB_1506:
	cmp BYTE [r8+6],0
	jnz LB_1488
	POP_GRM_SCC
	ret
LB_1488:
	RB_GRM
	jmp LB_1509
LB_1508:
	add r14,1 
LB_1509:
	cmp r14,r9
	jge LB_1510
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1508
LB_1510
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1513
	jmp LB_1514
LB_1513:
	mov r8,unt_1
	jmp LB_1511
LB_1514:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],35
	jnz LB_1515
	cmp BYTE [rdi+1],35
	jnz LB_1515
	jmp LB_1516
LB_1515:
	mov r8,unt_1
	jmp LB_1511
LB_1516:
	add r14,2
	jmp LB_1512
LB_1511:
	add rsp,0
	jmp LB_1507
LB_1512:
	jmp LB_1518
LB_1517:
	add r14,1 
LB_1518:
	cmp r14,r9
	jge LB_1519
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1517
LB_1519
	call GRM_220
	cmp BYTE [r8+6],0
	jnz LB_1522
	jmp LB_1523
LB_1522:
	jmp LB_1520
LB_1523:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_1521
LB_1520:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1521:
	jmp LB_1525
LB_1524:
	add r14,1 
LB_1525:
	cmp r14,r9
	jge LB_1526
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1524
LB_1526
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_1529
	jmp LB_1530
LB_1529:
	jmp LB_1527
LB_1530:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 10'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 10'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1528
LB_1527:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_1528:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_1531
LB_1531
;; rsp=3 , %1391~1'(= r ) %1390~0'(= r ) %1389~10'(= a35◂ [ *{ }] ) %1388~{ 8'(= r ) 9'(= r ) } 
; #193 { } ⊢ 0(<2)◂{ }
;; rsp=3 , %1392~0(<2)◂{ } %1391~1'(= r ) %1390~0'(= r ) %1389~10'(= a35◂ [ *{ }] ) %1388~{ 8'(= r ) 9'(= r ) } 
; #22 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=3 , %1393~0(<2)◂0(<2)◂{ } %1391~1'(= r ) %1390~0'(= r ) %1389~10'(= a35◂ [ *{ }] ) %1388~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂0(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_1532
LB_1532:
	cmp BYTE [r8+6],0
	jnz LB_1507
	POP_GRM_SCC
	ret
LB_1507:
	RB_GRM
	jmp LB_1535
LB_1534:
	add r14,1 
LB_1535:
	cmp r14,r9
	jge LB_1536
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1534
LB_1536
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1539
	jmp LB_1540
LB_1539:
	mov r8,unt_1
	jmp LB_1537
LB_1540:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1541
	cmp BYTE [rdi+1],92
	jnz LB_1541
	jmp LB_1542
LB_1541:
	mov r8,unt_1
	jmp LB_1537
LB_1542:
	add r14,2
	jmp LB_1538
LB_1537:
	add rsp,0
	jmp LB_1533
LB_1538:
	jmp LB_1544
LB_1543:
	add r14,1 
LB_1544:
	cmp r14,r9
	jge LB_1545
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1543
LB_1545
	call GRM_220
	cmp BYTE [r8+6],0
	jnz LB_1548
	jmp LB_1549
LB_1548:
	jmp LB_1546
LB_1549:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_1547
LB_1546:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1547:
	jmp LB_1551
LB_1550:
	add r14,1 
LB_1551:
	cmp r14,r9
	jge LB_1552
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1550
LB_1552
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_1555
	jmp LB_1556
LB_1555:
	jmp LB_1553
LB_1556:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 10'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 10'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1554
LB_1553:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_1554:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_1557
LB_1557
;; rsp=3 , %1397~1'(= r ) %1396~0'(= r ) %1395~10'(= a35◂ [ *{ }] ) %1394~{ 8'(= r ) 9'(= r ) } 
; #193 { } ⊢ 0(<2)◂{ }
;; rsp=3 , %1398~0(<2)◂{ } %1397~1'(= r ) %1396~0'(= r ) %1395~10'(= a35◂ [ *{ }] ) %1394~{ 8'(= r ) 9'(= r ) } 
; #22 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=3 , %1399~0(<2)◂0(<2)◂{ } %1397~1'(= r ) %1396~0'(= r ) %1395~10'(= a35◂ [ *{ }] ) %1394~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂0(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_1558
LB_1558:
	cmp BYTE [r8+6],0
	jnz LB_1533
	POP_GRM_SCC
	ret
LB_1533:
	RB_GRM
	jmp LB_1561
LB_1560:
	add r14,1 
LB_1561:
	cmp r14,r9
	jge LB_1562
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1560
LB_1562
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1565
	jmp LB_1566
LB_1565:
	mov r8,unt_1
	jmp LB_1563
LB_1566:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1567
	cmp BYTE [rdi+1],91
	jnz LB_1567
	jmp LB_1568
LB_1567:
	mov r8,unt_1
	jmp LB_1563
LB_1568:
	add r14,2
	jmp LB_1564
LB_1563:
	add rsp,0
	jmp LB_1559
LB_1564:
	PUSH_GRM
	jmp LB_1572
LB_1571:
	add r14,1 
LB_1572:
	cmp r14,r9
	jge LB_1573
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1571
LB_1573
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1576
	jmp LB_1577
LB_1576:
	mov r8,unt_1
	jmp LB_1574
LB_1577:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1578
	jmp LB_1579
LB_1578:
	mov r8,unt_1
	jmp LB_1574
LB_1579:
	add r14,1
	jmp LB_1575
LB_1574:
	add rsp,0
	jmp LB_1570
LB_1575:
	jmp LB_1581
LB_1580:
	add r14,1 
LB_1581:
	cmp r14,r9
	jge LB_1582
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1580
LB_1582
	call GRM_218
	cmp BYTE [r8+6],0
	jnz LB_1585
	jmp LB_1586
LB_1585:
	jmp LB_1583
LB_1586:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1584
LB_1583:
	add rsp,0
	jmp LB_1570
LB_1584:
	jmp LB_1588
LB_1587:
	add r14,1 
LB_1588:
	cmp r14,r9
	jge LB_1589
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1587
LB_1589
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_1592
	jmp LB_1593
LB_1592:
	jmp LB_1590
LB_1593:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1591
LB_1590:
	add rsp,8
	jmp LB_1570
LB_1591:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1594
LB_1594
;; rsp=2 , %1405~1'(= r ) %1404~0'(= r ) %1403~9'(= a35◂ [ *{ }] ) %1402~8'(= a35◂ [ *{ }] ) 
; #194 { 8'(= a35◂ [ *{ }] ) 9'(= a35◂ [ *{ }] ) } ⊢ 2'(= a35◂ [ *{ *{ }*{ }}] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= a35◂ [ *{ }] ) 9'(= a35◂ [ *{ }] ) } ⊢ { 0'(= a35◂ [ *{ }] ) 1'(= a35◂ [ *{ }] ) }
; .mov_ptn 9'(= a35◂ [ *{ }] ) ⊢ 1'(= a35◂ [ *{ }] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= a35◂ [ *{ }] ) ⊢ 0'(= a35◂ [ *{ }] )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call LB_1596
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %1406~2'(= a35◂ [ *{ *{ }*{ }}] ) %1405~1'(= r ) %1404~0'(= r ) 
;; ? 2'(= a35◂ [ *{ *{ }*{ }}] ) ⊢ 0(<2)◂{ 3'(= *{ } ) 4'(= *{ } ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_1602
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
;; rsp=0 , %1409~4'(= *{ } ) %1408~3'(= *{ } ) %1405~1'(= r ) %1404~0'(= r ) 
; #193 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1410~0(<2)◂{ } %1409~4'(= *{ } ) %1408~3'(= *{ } ) %1405~1'(= r ) %1404~0'(= r ) 
; #22 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %1411~0(<2)◂0(<2)◂{ } %1409~4'(= *{ } ) %1408~3'(= *{ } ) %1405~1'(= r ) %1404~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1595
LB_1602:
;; ?. 2'(= a35◂ [ *{ *{ }*{ }}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=0 , %1407~3'(= a2◂ [ *{ rr{| l |}}] ) %1405~1'(= r ) %1404~0'(= r ) 
; #196 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r9
	mov r13,rax
	call ETR_196
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %1412~2'(= {| l |} ) %1405~1'(= r ) %1404~0'(= r ) 
; #10 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r8
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_1603
LB_1603:
;; rsp=0 , %1413~2'(= {| l |} ) %1405~1'(= r ) %1404~0'(= r ) 
	mov rdi,LB_1604
	call emt_stg 
	jmp err
LB_1595:
	cmp BYTE [r8+6],0
	jnz LB_1570
	POP_GRM_SCC
	jmp LB_1569
LB_1570:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1606
LB_1606
;; rsp=0 , %1415~1'(= r ) %1414~0'(= r ) 
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
	lea rsi,[LB_1608+2-1]
	mov rcx,2
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1609+1-1]
	mov rcx,1
	rep movsb
	pop rcx
	lea rsi,[rsp+rcx-1]
	rep movsb
	add rsp,128
	lea rsi,[LB_1610+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %1418~2'(= {| l |} ) %1417~1'(= r ) %1416~0'(= r ) 
; #10 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r8
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_1611
LB_1611:
;; rsp=0 , %1419~2'(= {| l |} ) %1417~1'(= r ) %1416~0'(= r ) 
	mov rdi,LB_1612
	call emt_stg 
	jmp err
LB_1607:
	cmp BYTE [r8+6],0
	jnz LB_1605
	POP_GRM_SCC
	jmp LB_1569
LB_1605:
	POP_GRM_FAIL 
	jmp LB_1569
LB_1569:
	cmp BYTE [r8+6],0
	jnz LB_1613
	jmp LB_1614
LB_1613:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1614:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 3'(= a35◂ [ *{ }] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 3'(= a35◂ [ *{ }] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1615
LB_1615
;; rsp=0 , %1420~3'(= a35◂ [ *{ }] ) %1401~1'(= r ) %1400~0'(= r ) 
; #22 3'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂3'(= a35◂ [ *{ }] )
;; rsp=0 , %1421~0(<2)◂3'(= a35◂ [ *{ }] ) %1401~1'(= r ) %1400~0'(= r ) 
; ∎ 0(<2)◂3'(= a35◂ [ *{ }] )
; .mov_ptn2 0(<2)◂3'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂3'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1616
LB_1616:
	cmp BYTE [r8+6],0
	jnz LB_1559
	POP_GRM_SCC
	ret
LB_1559:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1618
LB_1618
;; rsp=0 , %1423~1'(= r ) %1422~0'(= r ) 
; #193 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1424~0(<2)◂{ } %1423~1'(= r ) %1422~0'(= r ) 
; #22 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %1425~0(<2)◂0(<2)◂{ } %1423~1'(= r ) %1422~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1619
LB_1619:
	cmp BYTE [r8+6],0
	jnz LB_1617
	POP_GRM_SCC
	ret
LB_1617:
	POP_GRM_FAIL 
	ret
ETR_218:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_218
	ret
GRM_218:
	PUSH_GRM
	jmp LB_1622
LB_1621:
	add r14,1 
LB_1622:
	cmp r14,r9
	jge LB_1623
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1621
LB_1623
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1626
	jmp LB_1627
LB_1626:
	mov r8,unt_1
	jmp LB_1624
LB_1627:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1628
	cmp BYTE [rdi+1],91
	jnz LB_1628
	jmp LB_1629
LB_1628:
	mov r8,unt_1
	jmp LB_1624
LB_1629:
	add r14,2
	jmp LB_1625
LB_1624:
	add rsp,0
	jmp LB_1620
LB_1625:
	PUSH_GRM
	jmp LB_1633
LB_1632:
	add r14,1 
LB_1633:
	cmp r14,r9
	jge LB_1634
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1632
LB_1634
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1637
	jmp LB_1638
LB_1637:
	mov r8,unt_1
	jmp LB_1635
LB_1638:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1639
	jmp LB_1640
LB_1639:
	mov r8,unt_1
	jmp LB_1635
LB_1640:
	add r14,1
	jmp LB_1636
LB_1635:
	add rsp,0
	jmp LB_1631
LB_1636:
	jmp LB_1642
LB_1641:
	add r14,1 
LB_1642:
	cmp r14,r9
	jge LB_1643
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1641
LB_1643
	call GRM_218
	cmp BYTE [r8+6],0
	jnz LB_1646
	jmp LB_1647
LB_1646:
	jmp LB_1644
LB_1647:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1645
LB_1644:
	add rsp,0
	jmp LB_1631
LB_1645:
	jmp LB_1649
LB_1648:
	add r14,1 
LB_1649:
	cmp r14,r9
	jge LB_1650
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1648
LB_1650
	call GRM_218
	cmp BYTE [r8+6],0
	jnz LB_1653
	jmp LB_1654
LB_1653:
	jmp LB_1651
LB_1654:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1652
LB_1651:
	add rsp,8
	jmp LB_1631
LB_1652:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1655
LB_1655
;; rsp=2 , %1431~1'(= r ) %1430~0'(= r ) %1429~9'(= a35◂ [ *{ }] ) %1428~8'(= a35◂ [ *{ }] ) 
; #194 { 8'(= a35◂ [ *{ }] ) 9'(= a35◂ [ *{ }] ) } ⊢ 2'(= a35◂ [ *{ *{ }*{ }}] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= a35◂ [ *{ }] ) 9'(= a35◂ [ *{ }] ) } ⊢ { 0'(= a35◂ [ *{ }] ) 1'(= a35◂ [ *{ }] ) }
; .mov_ptn 9'(= a35◂ [ *{ }] ) ⊢ 1'(= a35◂ [ *{ }] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= a35◂ [ *{ }] ) ⊢ 0'(= a35◂ [ *{ }] )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call LB_1596
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %1432~2'(= a35◂ [ *{ *{ }*{ }}] ) %1431~1'(= r ) %1430~0'(= r ) 
;; ? 2'(= a35◂ [ *{ *{ }*{ }}] ) ⊢ 0(<2)◂{ 3'(= *{ } ) 4'(= *{ } ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_1657
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
;; rsp=0 , %1435~4'(= *{ } ) %1434~3'(= *{ } ) %1431~1'(= r ) %1430~0'(= r ) 
; #193 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1436~0(<2)◂{ } %1435~4'(= *{ } ) %1434~3'(= *{ } ) %1431~1'(= r ) %1430~0'(= r ) 
; #22 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %1437~0(<2)◂0(<2)◂{ } %1435~4'(= *{ } ) %1434~3'(= *{ } ) %1431~1'(= r ) %1430~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1656
LB_1657:
;; ?. 2'(= a35◂ [ *{ *{ }*{ }}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=0 , %1433~3'(= a2◂ [ *{ rr{| l |}}] ) %1431~1'(= r ) %1430~0'(= r ) 
; #196 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= {| l |} )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r9
	mov r13,rax
	call ETR_196
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %1438~2'(= {| l |} ) %1431~1'(= r ) %1430~0'(= r ) 
; #10 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r8
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_1658
LB_1658:
;; rsp=0 , %1439~2'(= {| l |} ) %1431~1'(= r ) %1430~0'(= r ) 
	mov rdi,LB_1659
	call emt_stg 
	jmp err
LB_1656:
	cmp BYTE [r8+6],0
	jnz LB_1631
	POP_GRM_SCC
	jmp LB_1630
LB_1631:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1661
LB_1661
;; rsp=0 , %1441~1'(= r ) %1440~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1442~1(<2)◂{ } %1441~1'(= r ) %1440~0'(= r ) 
	jmp LB_1663
LB_1663:
; $ %[ "blk_cmt 0" ] ⊢ %[ "blk_cmt 0" ]
;; rsp=0 , %1443~%[ "blk_cmt 0" ] %1442~1(<2)◂{ } %1441~1'(= r ) %1440~0'(= r ) 
; #21 { { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %1444~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %1445~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
;; rsp=0 , %1446~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	ALC_RCD 2
	mov r9,rax
	ALC_RCD 3
	mov r10,rax
	mov rax,r13
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
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
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1662
LB_1662:
	cmp BYTE [r8+6],0
	jnz LB_1660
	POP_GRM_SCC
	jmp LB_1630
LB_1660:
	POP_GRM_FAIL 
	jmp LB_1630
LB_1630:
	cmp BYTE [r8+6],0
	jnz LB_1664
	jmp LB_1665
LB_1664:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1665:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 3'(= a35◂ [ *{ }] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 3'(= a35◂ [ *{ }] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1666
LB_1666
;; rsp=0 , %1447~3'(= a35◂ [ *{ }] ) %1427~1'(= r ) %1426~0'(= r ) 
; #22 3'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂3'(= a35◂ [ *{ }] )
;; rsp=0 , %1448~0(<2)◂3'(= a35◂ [ *{ }] ) %1427~1'(= r ) %1426~0'(= r ) 
; ∎ 0(<2)◂3'(= a35◂ [ *{ }] )
; .mov_ptn2 0(<2)◂3'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂3'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1667
LB_1667:
	cmp BYTE [r8+6],0
	jnz LB_1620
	POP_GRM_SCC
	ret
LB_1620:
	RB_GRM
	jmp LB_1670
LB_1669:
	add r14,1 
LB_1670:
	cmp r14,r9
	jge LB_1671
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1669
LB_1671
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1674
	jmp LB_1675
LB_1674:
	mov r8,unt_1
	jmp LB_1672
LB_1675:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],92
	jnz LB_1676
	cmp BYTE [rdi+1],93
	jnz LB_1676
	jmp LB_1677
LB_1676:
	mov r8,unt_1
	jmp LB_1672
LB_1677:
	add r14,2
	jmp LB_1673
LB_1672:
	add rsp,0
	jmp LB_1668
LB_1673:
	PUSH_GRM
	jmp LB_1681
LB_1680:
	add r14,1 
LB_1681:
	cmp r14,r9
	jge LB_1682
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1680
LB_1682
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1685
	jmp LB_1686
LB_1685:
	mov r8,unt_1
	jmp LB_1683
LB_1686:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1687
	jmp LB_1688
LB_1687:
	mov r8,unt_1
	jmp LB_1683
LB_1688:
	add r14,1
	jmp LB_1684
LB_1683:
	add rsp,0
	jmp LB_1679
LB_1684:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1689
LB_1689
;; rsp=0 , %1452~1'(= r ) %1451~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1453~0(<2)◂{ } %1452~1'(= r ) %1451~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1690
LB_1690:
	cmp BYTE [r8+6],0
	jnz LB_1679
	POP_GRM_SCC
	jmp LB_1678
LB_1679:
	RB_GRM
	jmp LB_1693
LB_1692:
	add r14,1 
LB_1693:
	cmp r14,r9
	jge LB_1694
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1692
LB_1694
	cmp r14,r9
	jge LB_1697
	jmp LB_1698
LB_1697:
	mov r8,unt_1 
	jmp LB_1695
LB_1698:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1696
LB_1695:
	add rsp,0
	POP_GRM_FAIL
	jmp LB_1678
LB_1696:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1699
LB_1699
;; rsp=1 , %1456~1'(= r ) %1455~0'(= r ) %1454~8'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %1457~1(<2)◂{ } %1456~1'(= r ) %1455~0'(= r ) %1454~8'(= r ) 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	add rsp,8
	jmp LB_1700
LB_1700:
	cmp BYTE [r8+6],0
	jnz LB_1691
	POP_GRM_SCC
	jmp LB_1678
LB_1691:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1702
LB_1702
;; rsp=0 , %1459~1'(= r ) %1458~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1460~0(<2)◂{ } %1459~1'(= r ) %1458~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1703
LB_1703:
	cmp BYTE [r8+6],0
	jnz LB_1701
	POP_GRM_SCC
	jmp LB_1678
LB_1701:
	POP_GRM_FAIL 
	jmp LB_1678
LB_1678:
	cmp BYTE [r8+6],0
	jnz LB_1704
	jmp LB_1705
LB_1704:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_1705:
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1706
LB_1706
;; rsp=0 , %1461~{ } %1450~1'(= r ) %1449~0'(= r ) 
; #193 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1462~0(<2)◂{ } %1461~{ } %1450~1'(= r ) %1449~0'(= r ) 
; #22 0(<2)◂{ } ⊢ 0(<2)◂0(<2)◂{ }
;; rsp=0 , %1463~0(<2)◂0(<2)◂{ } %1461~{ } %1450~1'(= r ) %1449~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂0(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1707
LB_1707:
	cmp BYTE [r8+6],0
	jnz LB_1668
	POP_GRM_SCC
	ret
LB_1668:
	RB_GRM
	jmp LB_1710
LB_1709:
	add r14,1 
LB_1710:
	cmp r14,r9
	jge LB_1711
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1709
LB_1711
	call GRM_219
	cmp BYTE [r8+6],0
	jnz LB_1714
	jmp LB_1715
LB_1714:
	jmp LB_1712
LB_1715:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1713
LB_1712:
	add rsp,0
	jmp LB_1708
LB_1713:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1716
LB_1716
;; rsp=1 , %1466~1'(= r ) %1465~0'(= r ) %1464~8'(= a35◂ [ *{ }] ) 
; #22 8'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂8'(= a35◂ [ *{ }] )
;; rsp=1 , %1467~0(<2)◂8'(= a35◂ [ *{ }] ) %1466~1'(= r ) %1465~0'(= r ) 
; ∎ 0(<2)◂8'(= a35◂ [ *{ }] )
; .mov_ptn2 0(<2)◂8'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂8'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1717
LB_1717:
	cmp BYTE [r8+6],0
	jnz LB_1708
	POP_GRM_SCC
	ret
LB_1708:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1719
LB_1719
;; rsp=0 , %1469~1'(= r ) %1468~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1470~1(<2)◂{ } %1469~1'(= r ) %1468~0'(= r ) 
	jmp LB_1721
LB_1721:
; $ %[ "blk_cmt 1" ] ⊢ %[ "blk_cmt 1" ]
;; rsp=0 , %1471~%[ "blk_cmt 1" ] %1470~1(<2)◂{ } %1469~1'(= r ) %1468~0'(= r ) 
; #21 { { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %1472~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %1473~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
;; rsp=0 , %1474~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "blk_cmt 1" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	ALC_RCD 2
	mov r9,rax
	ALC_RCD 3
	mov r10,rax
	mov rax,r13
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
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
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_1720
LB_1720:
	cmp BYTE [r8+6],0
	jnz LB_1718
	POP_GRM_SCC
	ret
LB_1718:
	POP_GRM_FAIL 
	ret
ETR_219:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_219
	ret
GRM_219:
	PUSH_GRM
	jmp LB_1724
LB_1723:
	add r14,1 
LB_1724:
	cmp r14,r9
	jge LB_1725
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1723
LB_1725
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1728
	jmp LB_1729
LB_1728:
	mov r8,unt_1
	jmp LB_1726
LB_1729:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1730
	jmp LB_1731
LB_1730:
	mov r8,unt_1
	jmp LB_1726
LB_1731:
	add r14,1
	jmp LB_1727
LB_1726:
	add rsp,0
	jmp LB_1722
LB_1727:
	jmp LB_1733
LB_1732:
	add r14,1 
LB_1733:
	cmp r14,r9
	jge LB_1734
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1732
LB_1734
	call GRM_218
	cmp BYTE [r8+6],0
	jnz LB_1737
	jmp LB_1738
LB_1737:
	jmp LB_1735
LB_1738:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1736
LB_1735:
	add rsp,0
	jmp LB_1722
LB_1736:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1739
LB_1739
;; rsp=1 , %1477~1'(= r ) %1476~0'(= r ) %1475~8'(= a35◂ [ *{ }] ) 
; #22 8'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂8'(= a35◂ [ *{ }] )
;; rsp=1 , %1478~0(<2)◂8'(= a35◂ [ *{ }] ) %1477~1'(= r ) %1476~0'(= r ) 
; ∎ 0(<2)◂8'(= a35◂ [ *{ }] )
; .mov_ptn2 0(<2)◂8'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂8'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_1740
LB_1740:
	cmp BYTE [r8+6],0
	jnz LB_1722
	POP_GRM_SCC
	ret
LB_1722:
	RB_GRM
	jmp LB_1743
LB_1742:
	add r14,1 
LB_1743:
	cmp r14,r9
	jge LB_1744
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1742
LB_1744
	cmp r14,r9
	jge LB_1747
	jmp LB_1748
LB_1747:
	mov r8,unt_1 
	jmp LB_1745
LB_1748:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1746
LB_1745:
	add rsp,0
	jmp LB_1741
LB_1746:
	jmp LB_1750
LB_1749:
	add r14,1 
LB_1750:
	cmp r14,r9
	jge LB_1751
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1749
LB_1751
	call GRM_219
	cmp BYTE [r8+6],0
	jnz LB_1754
	jmp LB_1755
LB_1754:
	jmp LB_1752
LB_1755:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1753
LB_1752:
	add rsp,8
	jmp LB_1741
LB_1753:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_1756
LB_1756
;; rsp=2 , %1482~1'(= r ) %1481~0'(= r ) %1480~9'(= a35◂ [ *{ }] ) %1479~8'(= r ) 
; #22 9'(= a35◂ [ *{ }] ) ⊢ 0(<2)◂9'(= a35◂ [ *{ }] )
;; rsp=2 , %1483~0(<2)◂9'(= a35◂ [ *{ }] ) %1482~1'(= r ) %1481~0'(= r ) %1479~8'(= r ) 
; ∎ 0(<2)◂9'(= a35◂ [ *{ }] )
; .mov_ptn2 0(<2)◂9'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
; .mov_ptn 0(<2)◂9'(= a35◂ [ *{ }] ) ⊢ 2'(= a3◂ [ a35◂ [ *{ }]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_1757
LB_1757:
	cmp BYTE [r8+6],0
	jnz LB_1741
	POP_GRM_SCC
	ret
LB_1741:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1759
LB_1759
;; rsp=0 , %1485~1'(= r ) %1484~0'(= r ) 
	jmp LB_1761
LB_1761:
; $ %[ "line_res_c 0" ] ⊢ %[ "line_res_c 0" ]
;; rsp=0 , %1486~%[ "line_res_c 0" ] %1485~1'(= r ) %1484~0'(= r ) 
; #10 %[ "line_res_c 0" ] ⊢ %[ "line_res_c 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_1762
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_1763
LB_1763:
;; rsp=0 , %1487~%[ "line_res_c 0" ] %1485~1'(= r ) %1484~0'(= r ) 
	mov rdi,LB_1764
	call emt_stg 
	jmp err
LB_1760:
	cmp BYTE [r8+6],0
	jnz LB_1758
	POP_GRM_SCC
	ret
LB_1758:
	POP_GRM_FAIL 
	ret
ETR_220:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_220
	ret
GRM_220:
	PUSH_GRM
	jmp LB_1767
LB_1766:
	add r14,1 
LB_1767:
	cmp r14,r9
	jge LB_1768
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1766
LB_1768
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1771
	jmp LB_1772
LB_1771:
	mov r8,unt_1
	jmp LB_1769
LB_1772:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1773
	jmp LB_1774
LB_1773:
	mov r8,unt_1
	jmp LB_1769
LB_1774:
	add r14,1
	jmp LB_1770
LB_1769:
	add rsp,0
	jmp LB_1765
LB_1770:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1775
LB_1775
;; rsp=0 , %1489~1'(= r ) %1488~0'(= r ) 
; #22 { 0'(= r ) 1'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 1'(= r ) }
;; rsp=0 , %1490~0(<2)◂{ 0'(= r ) 1'(= r ) } 
; ∎ 0(<2)◂{ 0'(= r ) 1'(= r ) }
; .mov_ptn2 0(<2)◂{ 0'(= r ) 1'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
; .mov_ptn 0(<2)◂{ 0'(= r ) 1'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
	ALC_RCD 2
	mov r9,rax
	mov rax,r13
	mov QWORD [r9+8+8*0],rax
	mov rax,r14
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r8,rax
	jmp LB_1776
LB_1776:
	cmp BYTE [r8+6],0
	jnz LB_1765
	POP_GRM_SCC
	ret
LB_1765:
	RB_GRM
	jmp LB_1779
LB_1778:
	add r14,1 
LB_1779:
	cmp r14,r9
	jge LB_1780
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1778
LB_1780
	cmp r14,r9
	jge LB_1783
	jmp LB_1784
LB_1783:
	mov r8,unt_1 
	jmp LB_1781
LB_1784:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1782
LB_1781:
	add rsp,0
	jmp LB_1777
LB_1782:
	jmp LB_1786
LB_1785:
	add r14,1 
LB_1786:
	cmp r14,r9
	jge LB_1787
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1785
LB_1787
	call GRM_220
	cmp BYTE [r8+6],0
	jnz LB_1790
	jmp LB_1791
LB_1790:
	jmp LB_1788
LB_1791:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 9'(= r ) 10'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 9'(= r ) 10'(= r ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_1789
LB_1788:
	add rsp,8
	jmp LB_1777
LB_1789:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_1792
LB_1792
;; rsp=3 , %1495~1'(= r ) %1494~0'(= r ) %1493~10'(= r ) %1492~9'(= r ) %1491~8'(= r ) 
; #22 { 0'(= r ) 10'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 10'(= r ) }
;; rsp=3 , %1496~0(<2)◂{ 0'(= r ) 10'(= r ) } %1495~1'(= r ) %1492~9'(= r ) %1491~8'(= r ) 
; ∎ 0(<2)◂{ 0'(= r ) 10'(= r ) }
; .mov_ptn2 0(<2)◂{ 0'(= r ) 10'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
; .mov_ptn 0(<2)◂{ 0'(= r ) 10'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
	ALC_RCD 2
	mov r14,rax
	mov rax,r13
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,24
	jmp LB_1793
LB_1793:
	cmp BYTE [r8+6],0
	jnz LB_1777
	POP_GRM_SCC
	ret
LB_1777:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1795
LB_1795
;; rsp=0 , %1498~1'(= r ) %1497~0'(= r ) 
; #22 { 0'(= r ) 1'(= r ) } ⊢ 0(<2)◂{ 0'(= r ) 1'(= r ) }
;; rsp=0 , %1499~0(<2)◂{ 0'(= r ) 1'(= r ) } 
; ∎ 0(<2)◂{ 0'(= r ) 1'(= r ) }
; .mov_ptn2 0(<2)◂{ 0'(= r ) 1'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
; .mov_ptn 0(<2)◂{ 0'(= r ) 1'(= r ) } ⊢ 2'(= a3◂ [ *{ rr}] )
	ALC_RCD 2
	mov r9,rax
	mov rax,r13
	mov QWORD [r9+8+8*0],rax
	mov rax,r14
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r8,rax
	jmp LB_1796
LB_1796:
	cmp BYTE [r8+6],0
	jnz LB_1794
	POP_GRM_SCC
	ret
LB_1794:
	POP_GRM_FAIL 
	ret
ETR_221:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_221
	ret
GRM_221:
	PUSH_GRM
	jmp LB_1799
LB_1798:
	add r14,1 
LB_1799:
	cmp r14,r9
	jge LB_1800
	JZ_SPC BYTE [r13+8+r14], LB_1798
LB_1800
	lea rax,[r14+7]
	cmp rax,r9
	jg LB_1803
	jmp LB_1804
LB_1803:
	mov r8,unt_1
	jmp LB_1801
LB_1804:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1805
	cmp BYTE [rdi+1],167
	jnz LB_1805
	cmp BYTE [rdi+2],194
	jnz LB_1805
	cmp BYTE [rdi+3],167
	jnz LB_1805
	cmp BYTE [rdi+4],43
	jnz LB_1805
	cmp BYTE [rdi+5],115
	jnz LB_1805
	cmp BYTE [rdi+6],56
	jnz LB_1805
	jmp LB_1806
LB_1805:
	mov r8,unt_1
	jmp LB_1801
LB_1806:
	add r14,7
	jmp LB_1802
LB_1801:
	add rsp,0
	jmp LB_1797
LB_1802:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1807
LB_1807
;; rsp=0 , %1501~1'(= r ) %1500~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1502~0(<2)◂{ } %1501~1'(= r ) %1500~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1808
LB_1808:
	cmp BYTE [r8+6],0
	jnz LB_1797
	POP_GRM_SCC
	ret
LB_1797:
	RB_GRM
	jmp LB_1811
LB_1810:
	add r14,1 
LB_1811:
	cmp r14,r9
	jge LB_1812
	JZ_SPC BYTE [r13+8+r14], LB_1810
LB_1812
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_1815
	jmp LB_1816
LB_1815:
	mov r8,unt_1
	jmp LB_1813
LB_1816:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1817
	cmp BYTE [rdi+1],167
	jnz LB_1817
	cmp BYTE [rdi+2],194
	jnz LB_1817
	cmp BYTE [rdi+3],167
	jnz LB_1817
	jmp LB_1818
LB_1817:
	mov r8,unt_1
	jmp LB_1813
LB_1818:
	add r14,4
	jmp LB_1814
LB_1813:
	add rsp,0
	jmp LB_1809
LB_1814:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1819
LB_1819
;; rsp=0 , %1504~1'(= r ) %1503~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1505~0(<2)◂{ } %1504~1'(= r ) %1503~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1820
LB_1820:
	cmp BYTE [r8+6],0
	jnz LB_1809
	POP_GRM_SCC
	ret
LB_1809:
	RB_GRM
	jmp LB_1823
LB_1822:
	add r14,1 
LB_1823:
	cmp r14,r9
	jge LB_1824
	JZ_SPC BYTE [r13+8+r14], LB_1822
LB_1824
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1827
	jmp LB_1828
LB_1827:
	mov r8,unt_1
	jmp LB_1825
LB_1828:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1829
	cmp BYTE [rdi+1],167
	jnz LB_1829
	jmp LB_1830
LB_1829:
	mov r8,unt_1
	jmp LB_1825
LB_1830:
	add r14,2
	jmp LB_1826
LB_1825:
	add rsp,0
	jmp LB_1821
LB_1826:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1831
LB_1831
;; rsp=0 , %1507~1'(= r ) %1506~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1508~0(<2)◂{ } %1507~1'(= r ) %1506~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1832
LB_1832:
	cmp BYTE [r8+6],0
	jnz LB_1821
	POP_GRM_SCC
	ret
LB_1821:
	RB_GRM
	jmp LB_1835
LB_1834:
	add r14,1 
LB_1835:
	cmp r14,r9
	jge LB_1836
	JZ_SPC BYTE [r13+8+r14], LB_1834
LB_1836
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_1839
	jmp LB_1840
LB_1839:
	mov r8,unt_1
	jmp LB_1837
LB_1840:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_1841
	cmp BYTE [rdi+1],182
	jnz LB_1841
	jmp LB_1842
LB_1841:
	mov r8,unt_1
	jmp LB_1837
LB_1842:
	add r14,2
	jmp LB_1838
LB_1837:
	add rsp,0
	jmp LB_1833
LB_1838:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1843
LB_1843
;; rsp=0 , %1510~1'(= r ) %1509~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1511~0(<2)◂{ } %1510~1'(= r ) %1509~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1844
LB_1844:
	cmp BYTE [r8+6],0
	jnz LB_1833
	POP_GRM_SCC
	ret
LB_1833:
	RB_GRM
	jmp LB_1847
LB_1846:
	add r14,1 
LB_1847:
	cmp r14,r9
	jge LB_1848
	JZ_SPC BYTE [r13+8+r14], LB_1846
LB_1848
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_1851
	jmp LB_1852
LB_1851:
	mov r8,unt_1
	jmp LB_1849
LB_1852:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_1853
	cmp BYTE [rdi+1],136
	jnz LB_1853
	cmp BYTE [rdi+2],142
	jnz LB_1853
	cmp BYTE [rdi+3],226
	jnz LB_1853
	cmp BYTE [rdi+4],136
	jnz LB_1853
	cmp BYTE [rdi+5],142
	jnz LB_1853
	jmp LB_1854
LB_1853:
	mov r8,unt_1
	jmp LB_1849
LB_1854:
	add r14,6
	jmp LB_1850
LB_1849:
	add rsp,0
	jmp LB_1845
LB_1850:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1855
LB_1855
;; rsp=0 , %1513~1'(= r ) %1512~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1514~0(<2)◂{ } %1513~1'(= r ) %1512~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1856
LB_1856:
	cmp BYTE [r8+6],0
	jnz LB_1845
	POP_GRM_SCC
	ret
LB_1845:
	POP_GRM_FAIL 
	ret
ETR_222:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_222
	ret
GRM_222:
	PUSH_GRM
	jmp LB_1859
LB_1858:
	add r14,1 
LB_1859:
	cmp r14,r9
	jge LB_1860
	JZ_SPC BYTE [r13+8+r14], LB_1858
LB_1860
	call GRM_221
	cmp BYTE [r8+6],0
	jnz LB_1863
	jmp LB_1864
LB_1863:
	jmp LB_1861
LB_1864:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_1862
LB_1861:
	add rsp,0
	jmp LB_1857
LB_1862:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1865
LB_1865
;; rsp=0 , %1517~1'(= r ) %1516~0'(= r ) %1515~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1518~1(<2)◂{ } %1517~1'(= r ) %1516~0'(= r ) %1515~{ } 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_1866
LB_1866:
	cmp BYTE [r8+6],0
	jnz LB_1857
	POP_GRM_SCC
	ret
LB_1857:
	RB_GRM
	jmp LB_1869
LB_1868:
	add r14,1 
LB_1869:
	cmp r14,r9
	jge LB_1870
	JZ_SPC BYTE [r13+8+r14], LB_1868
LB_1870
	cmp r14,r9
	jge LB_1873
	jmp LB_1874
LB_1873:
	mov r8,unt_1 
	jmp LB_1871
LB_1874:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1872
LB_1871:
	add rsp,0
	jmp LB_1867
LB_1872:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1875
LB_1875
;; rsp=1 , %1521~1'(= r ) %1520~0'(= r ) %1519~8'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %1522~0(<2)◂{ } %1521~1'(= r ) %1520~0'(= r ) %1519~8'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	add rsp,8
	jmp LB_1876
LB_1876:
	cmp BYTE [r8+6],0
	jnz LB_1867
	POP_GRM_SCC
	ret
LB_1867:
	POP_GRM_FAIL 
	ret
ETR_223:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_223
	ret
GRM_223:
	PUSH_GRM
	jmp LB_1879
LB_1878:
	add r14,1 
LB_1879:
	cmp r14,r9
	jge LB_1880
	JZ_SPC BYTE [r13+8+r14], LB_1878
LB_1880
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1883
	jmp LB_1884
LB_1883:
	mov r8,unt_1
	jmp LB_1881
LB_1884:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_1885
	jmp LB_1886
LB_1885:
	mov r8,unt_1
	jmp LB_1881
LB_1886:
	add r14,1
	jmp LB_1882
LB_1881:
	add rsp,0
	jmp LB_1877
LB_1882:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1887
LB_1887
;; rsp=0 , %1525~1'(= r ) %1524~0'(= r ) %1523~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1526~1(<2)◂{ } %1525~1'(= r ) %1524~0'(= r ) %1523~{ } 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_1888
LB_1888:
	cmp BYTE [r8+6],0
	jnz LB_1877
	POP_GRM_SCC
	ret
LB_1877:
	RB_GRM
	jmp LB_1891
LB_1890:
	add r14,1 
LB_1891:
	cmp r14,r9
	jge LB_1892
	JZ_SPC BYTE [r13+8+r14], LB_1890
LB_1892
	call GRM_221
	cmp BYTE [r8+6],0
	jnz LB_1895
	jmp LB_1896
LB_1895:
	jmp LB_1893
LB_1896:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_1894
LB_1893:
	add rsp,0
	jmp LB_1889
LB_1894:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1897
LB_1897
;; rsp=0 , %1529~1'(= r ) %1528~0'(= r ) %1527~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1530~1(<2)◂{ } %1529~1'(= r ) %1528~0'(= r ) %1527~{ } 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_1898
LB_1898:
	cmp BYTE [r8+6],0
	jnz LB_1889
	POP_GRM_SCC
	ret
LB_1889:
	RB_GRM
	jmp LB_1901
LB_1900:
	add r14,1 
LB_1901:
	cmp r14,r9
	jge LB_1902
	JZ_SPC BYTE [r13+8+r14], LB_1900
LB_1902
	cmp r14,r9
	jge LB_1905
	jmp LB_1906
LB_1905:
	mov r8,unt_1 
	jmp LB_1903
LB_1906:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1904
LB_1903:
	add rsp,0
	jmp LB_1899
LB_1904:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1907
LB_1907
;; rsp=1 , %1533~1'(= r ) %1532~0'(= r ) %1531~8'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %1534~0(<2)◂{ } %1533~1'(= r ) %1532~0'(= r ) %1531~8'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	add rsp,8
	jmp LB_1908
LB_1908:
	cmp BYTE [r8+6],0
	jnz LB_1899
	POP_GRM_SCC
	ret
LB_1899:
	POP_GRM_FAIL 
	ret
ETR_224:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_224
	ret
GRM_224:
	PUSH_GRM
	jmp LB_1911
LB_1910:
	add r14,1 
LB_1911:
	cmp r14,r9
	jge LB_1912
	JZ_SPC BYTE [r13+8+r14], LB_1910
LB_1912
	call GRM_223
	cmp BYTE [r8+6],0
	jnz LB_1915
	jmp LB_1916
LB_1915:
	jmp LB_1913
LB_1916:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_1914
LB_1913:
	add rsp,0
	jmp LB_1909
LB_1914:
	jmp LB_1918
LB_1917:
	add r14,1 
LB_1918:
	cmp r14,r9
	jge LB_1919
	JZ_SPC BYTE [r13+8+r14], LB_1917
LB_1919
	call GRM_224
	cmp BYTE [r8+6],0
	jnz LB_1922
	jmp LB_1923
LB_1922:
	jmp LB_1920
LB_1923:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_1921
LB_1920:
	add rsp,0
	jmp LB_1909
LB_1921:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1924
LB_1924
;; rsp=0 , %1538~1'(= r ) %1537~0'(= r ) %1536~{ } %1535~{ } 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1539~0(<2)◂{ } %1538~1'(= r ) %1537~0'(= r ) %1536~{ } %1535~{ } 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1925
LB_1925:
	cmp BYTE [r8+6],0
	jnz LB_1909
	POP_GRM_SCC
	ret
LB_1909:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1927
LB_1927
;; rsp=0 , %1541~1'(= r ) %1540~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1542~0(<2)◂{ } %1541~1'(= r ) %1540~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1928
LB_1928:
	cmp BYTE [r8+6],0
	jnz LB_1926
	POP_GRM_SCC
	ret
LB_1926:
	POP_GRM_FAIL 
	ret
ETR_225:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_225
	ret
GRM_225:
	PUSH_GRM
	jmp LB_1931
LB_1930:
	add r14,1 
LB_1931:
	cmp r14,r9
	jge LB_1932
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1930
LB_1932
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1935
	jmp LB_1936
LB_1935:
	mov r8,unt_1
	jmp LB_1933
LB_1936:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_1937
	jmp LB_1938
LB_1937:
	mov r8,unt_1
	jmp LB_1933
LB_1938:
	add r14,1
	jmp LB_1934
LB_1933:
	add rsp,0
	jmp LB_1929
LB_1934:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1939
LB_1939
;; rsp=0 , %1545~1'(= r ) %1544~0'(= r ) %1543~{ } 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1546~0(<2)◂{ } %1545~1'(= r ) %1544~0'(= r ) %1543~{ } 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1940
LB_1940:
	cmp BYTE [r8+6],0
	jnz LB_1929
	POP_GRM_SCC
	ret
LB_1929:
	RB_GRM
	jmp LB_1943
LB_1942:
	add r14,1 
LB_1943:
	cmp r14,r9
	jge LB_1944
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1942
LB_1944
	call GRM_221
	cmp BYTE [r8+6],0
	jnz LB_1947
	jmp LB_1948
LB_1947:
	jmp LB_1945
LB_1948:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_1946
LB_1945:
	add rsp,0
	jmp LB_1941
LB_1946:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1949
LB_1949
;; rsp=0 , %1549~1'(= r ) %1548~0'(= r ) %1547~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1550~1(<2)◂{ } %1549~1'(= r ) %1548~0'(= r ) %1547~{ } 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_1950
LB_1950:
	cmp BYTE [r8+6],0
	jnz LB_1941
	POP_GRM_SCC
	ret
LB_1941:
	RB_GRM
	jmp LB_1953
LB_1952:
	add r14,1 
LB_1953:
	cmp r14,r9
	jge LB_1954
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1952
LB_1954
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_1957
	jmp LB_1958
LB_1957:
	mov r8,unt_1
	jmp LB_1955
LB_1958:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_1959
	jmp LB_1960
LB_1959:
	mov r8,unt_1
	jmp LB_1955
LB_1960:
	add r14,1
	jmp LB_1956
LB_1955:
	add rsp,0
	jmp LB_1951
LB_1956:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1961
LB_1961
;; rsp=0 , %1553~1'(= r ) %1552~0'(= r ) %1551~{ } 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1554~1(<2)◂{ } %1553~1'(= r ) %1552~0'(= r ) %1551~{ } 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_1962
LB_1962:
	cmp BYTE [r8+6],0
	jnz LB_1951
	POP_GRM_SCC
	ret
LB_1951:
	RB_GRM
	jmp LB_1965
LB_1964:
	add r14,1 
LB_1965:
	cmp r14,r9
	jge LB_1966
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1964
LB_1966
	cmp r14,r9
	jge LB_1969
	jmp LB_1970
LB_1969:
	mov r8,unt_1 
	jmp LB_1967
LB_1970:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1968
LB_1967:
	add rsp,0
	jmp LB_1963
LB_1968:
	jmp LB_1972
LB_1971:
	add r14,1 
LB_1972:
	cmp r14,r9
	jge LB_1973
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1971
LB_1973
	call GRM_225
	cmp BYTE [r8+6],0
	jnz LB_1976
	jmp LB_1977
LB_1976:
	jmp LB_1974
LB_1977:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_1975
LB_1974:
	add rsp,8
	jmp LB_1963
LB_1975:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1978
LB_1978
;; rsp=1 , %1558~1'(= r ) %1557~0'(= r ) %1556~{ } %1555~8'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %1559~0(<2)◂{ } %1558~1'(= r ) %1557~0'(= r ) %1556~{ } %1555~8'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	add rsp,8
	jmp LB_1979
LB_1979:
	cmp BYTE [r8+6],0
	jnz LB_1963
	POP_GRM_SCC
	ret
LB_1963:
	RB_GRM
	jmp LB_1982
LB_1981:
	add r14,1 
LB_1982:
	cmp r14,r9
	jge LB_1983
	JZ_LINE_SPC BYTE [r13+8+r14], LB_1981
LB_1983
	cmp r14,r9
	jge LB_1986
	jmp LB_1987
LB_1986:
	mov r8,unt_1 
	jmp LB_1984
LB_1987:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_1985
LB_1984:
	add rsp,0
	jmp LB_1980
LB_1985:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_1988
LB_1988
;; rsp=1 , %1562~1'(= r ) %1561~0'(= r ) %1560~8'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %1563~0(<2)◂{ } %1562~1'(= r ) %1561~0'(= r ) %1560~8'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	add rsp,8
	jmp LB_1989
LB_1989:
	cmp BYTE [r8+6],0
	jnz LB_1980
	POP_GRM_SCC
	ret
LB_1980:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_1991
LB_1991
;; rsp=0 , %1565~1'(= r ) %1564~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %1566~0(<2)◂{ } %1565~1'(= r ) %1564~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_1992
LB_1992:
	cmp BYTE [r8+6],0
	jnz LB_1990
	POP_GRM_SCC
	ret
LB_1990:
	POP_GRM_FAIL 
	ret
ETR_226:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_226
	ret
GRM_226:
	PUSH_GRM
	jmp LB_1995
LB_1994:
	add r14,1 
LB_1995:
	cmp r14,r9
	jge LB_1996
	JZ_SPC BYTE [r13+8+r14], LB_1994
LB_1996
	call GRM_227
	cmp BYTE [r8+6],0
	jnz LB_1999
	jmp LB_2000
LB_1999:
	jmp LB_1997
LB_2000:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_1998
LB_1997:
	add rsp,0
	jmp LB_1993
LB_1998:
	jmp LB_2002
LB_2001:
	add r14,1 
LB_2002:
	cmp r14,r9
	jge LB_2003
	JZ_SPC BYTE [r13+8+r14], LB_2001
LB_2003
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2006
	jmp LB_2007
LB_2006:
	mov r8,unt_1
	jmp LB_2004
LB_2007:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],42
	jnz LB_2008
	jmp LB_2009
LB_2008:
	mov r8,unt_1
	jmp LB_2004
LB_2009:
	add r14,1
	jmp LB_2005
LB_2004:
	add rsp,8
	jmp LB_1993
LB_2005:
	jmp LB_2011
LB_2010:
	add r14,1 
LB_2011:
	cmp r14,r9
	jge LB_2012
	JZ_SPC BYTE [r13+8+r14], LB_2010
LB_2012
	call GRM_67
	cmp BYTE [r8+6],0
	jnz LB_2015
	jmp LB_2016
LB_2015:
	jmp LB_2013
LB_2016:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 9'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2014
LB_2013:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2014:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2017
LB_2017
;; rsp=2 , %1570~1'(= r ) %1569~0'(= r ) %1568~9'(= {| l |} ) %1567~8'(= r ) 
; #107 { 8'(= r ) 9'(= {| l |} ) } ⊢ 3(<4)◂{ 8'(= r ) 9'(= {| l |} ) }
;; rsp=2 , %1571~3(<4)◂{ 8'(= r ) 9'(= {| l |} ) } %1570~1'(= r ) %1569~0'(= r ) 
; #22 3(<4)◂{ 8'(= r ) 9'(= {| l |} ) } ⊢ 0(<2)◂3(<4)◂{ 8'(= r ) 9'(= {| l |} ) }
;; rsp=2 , %1572~0(<2)◂3(<4)◂{ 8'(= r ) 9'(= {| l |} ) } %1570~1'(= r ) %1569~0'(= r ) 
; ∎ 0(<2)◂3(<4)◂{ 8'(= r ) 9'(= {| l |} ) }
; .mov_ptn2 0(<2)◂3(<4)◂{ 8'(= r ) 9'(= {| l |} ) } ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂3(<4)◂{ 8'(= r ) 9'(= {| l |} ) } ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],3
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_2018
LB_2018:
	cmp BYTE [r8+6],0
	jnz LB_1993
	POP_GRM_SCC
	ret
LB_1993:
	RB_GRM
	jmp LB_2021
LB_2020:
	add r14,1 
LB_2021:
	cmp r14,r9
	jge LB_2022
	JZ_SPC BYTE [r13+8+r14], LB_2020
LB_2022
	call GRM_229
	cmp BYTE [r8+6],0
	jnz LB_2025
	jmp LB_2026
LB_2025:
	jmp LB_2023
LB_2026:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2024
LB_2023:
	add rsp,0
	jmp LB_2019
LB_2024:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2027
LB_2027
;; rsp=1 , %1575~1'(= r ) %1574~0'(= r ) %1573~8'(= {| l |} ) 
; #110 8'(= {| l |} ) ⊢ 0(<4)◂8'(= {| l |} )
;; rsp=1 , %1576~0(<4)◂8'(= {| l |} ) %1575~1'(= r ) %1574~0'(= r ) 
; #22 0(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<4)◂8'(= {| l |} )
;; rsp=1 , %1577~0(<2)◂0(<4)◂8'(= {| l |} ) %1575~1'(= r ) %1574~0'(= r ) 
; ∎ 0(<2)◂0(<4)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂0(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2028
LB_2028:
	cmp BYTE [r8+6],0
	jnz LB_2019
	POP_GRM_SCC
	ret
LB_2019:
	RB_GRM
	jmp LB_2031
LB_2030:
	add r14,1 
LB_2031:
	cmp r14,r9
	jge LB_2032
	JZ_SPC BYTE [r13+8+r14], LB_2030
LB_2032
	call GRM_67
	cmp BYTE [r8+6],0
	jnz LB_2035
	jmp LB_2036
LB_2035:
	jmp LB_2033
LB_2036:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2034
LB_2033:
	add rsp,0
	jmp LB_2029
LB_2034:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2037
LB_2037
;; rsp=1 , %1580~1'(= r ) %1579~0'(= r ) %1578~8'(= {| l |} ) 
; #110 8'(= {| l |} ) ⊢ 0(<4)◂8'(= {| l |} )
;; rsp=1 , %1581~0(<4)◂8'(= {| l |} ) %1580~1'(= r ) %1579~0'(= r ) 
; #22 0(<4)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<4)◂8'(= {| l |} )
;; rsp=1 , %1582~0(<2)◂0(<4)◂8'(= {| l |} ) %1580~1'(= r ) %1579~0'(= r ) 
; ∎ 0(<2)◂0(<4)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂0(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<4)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2038
LB_2038:
	cmp BYTE [r8+6],0
	jnz LB_2029
	POP_GRM_SCC
	ret
LB_2029:
	RB_GRM
	jmp LB_2041
LB_2040:
	add r14,1 
LB_2041:
	cmp r14,r9
	jge LB_2042
	JZ_SPC BYTE [r13+8+r14], LB_2040
LB_2042
	call GRM_189
	cmp BYTE [r8+6],0
	jnz LB_2045
	jmp LB_2046
LB_2045:
	jmp LB_2043
LB_2046:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2044
LB_2043:
	add rsp,0
	jmp LB_2039
LB_2044:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2047
LB_2047
;; rsp=1 , %1585~1'(= r ) %1584~0'(= r ) %1583~8'(= a9◂ [ ] ) 
; #85 8'(= a9◂ [ ] ) ⊢ 1(<2)◂8'(= a9◂ [ ] )
;; rsp=1 , %1586~1(<2)◂8'(= a9◂ [ ] ) %1585~1'(= r ) %1584~0'(= r ) 
; #109 1(<2)◂8'(= a9◂ [ ] ) ⊢ 1(<4)◂1(<2)◂8'(= a9◂ [ ] )
;; rsp=1 , %1587~1(<4)◂1(<2)◂8'(= a9◂ [ ] ) %1585~1'(= r ) %1584~0'(= r ) 
; #22 1(<4)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 0(<2)◂1(<4)◂1(<2)◂8'(= a9◂ [ ] )
;; rsp=1 , %1588~0(<2)◂1(<4)◂1(<2)◂8'(= a9◂ [ ] ) %1585~1'(= r ) %1584~0'(= r ) 
; ∎ 0(<2)◂1(<4)◂1(<2)◂8'(= a9◂ [ ] )
; .mov_ptn2 0(<2)◂1(<4)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<4)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2048
LB_2048:
	cmp BYTE [r8+6],0
	jnz LB_2039
	POP_GRM_SCC
	ret
LB_2039:
	RB_GRM
	jmp LB_2051
LB_2050:
	add r14,1 
LB_2051:
	cmp r14,r9
	jge LB_2052
	JZ_SPC BYTE [r13+8+r14], LB_2050
LB_2052
	call GRM_228
	cmp BYTE [r8+6],0
	jnz LB_2055
	jmp LB_2056
LB_2055:
	jmp LB_2053
LB_2056:
	sub rsp,16
; .mov_ptn2 2'(= *{ a15◂ [ ]r} ) ⊢ { 8'(= a15◂ [ ] ) 9'(= r ) }
; .mov_ptn 2'(= *{ a15◂ [ ]r} ) ⊢ { 8'(= a15◂ [ ] ) 9'(= r ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_2054
LB_2053:
	add rsp,0
	jmp LB_2049
LB_2054:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2057
LB_2057
;; rsp=2 , %1591~1'(= r ) %1590~0'(= r ) %1589~{ 8'(= a15◂ [ ] ) 9'(= r ) } 
; #108 { 8'(= a15◂ [ ] ) 9'(= r ) } ⊢ 2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) }
;; rsp=2 , %1592~2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) } %1591~1'(= r ) %1590~0'(= r ) 
; #22 2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) } ⊢ 0(<2)◂2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) }
;; rsp=2 , %1593~0(<2)◂2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) } %1591~1'(= r ) %1590~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) }
; .mov_ptn2 0(<2)◂2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) } ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂2(<4)◂{ 8'(= a15◂ [ ] ) 9'(= r ) } ⊢ 2'(= a3◂ [ a16◂ [ a9◂ [ ]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_2058
LB_2058:
	cmp BYTE [r8+6],0
	jnz LB_2049
	POP_GRM_SCC
	ret
LB_2049:
	POP_GRM_FAIL 
	ret
ETR_227:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_227
	ret
GRM_227:
	PUSH_GRM
	cmp r14,r9
	jge LB_2062
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_2062
	add r14,rsi
	push rdi
	jmp LB_2063
LB_2062:
	mov r8,unt_1
	jmp LB_2060
LB_2063:
	jmp LB_2061
LB_2060:
	add rsp,0
	jmp LB_2059
LB_2061:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2066
	jmp LB_2067
LB_2066:
	mov r8,unt_1
	jmp LB_2064
LB_2067:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_2068
	jmp LB_2069
LB_2068:
	mov r8,unt_1
	jmp LB_2064
LB_2069:
	add r14,1
	jmp LB_2065
LB_2064:
	add rsp,8
	jmp LB_2059
LB_2065:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2070
LB_2070
;; rsp=1 , %1596~1'(= r ) %1595~0'(= r ) %1594~8'(= r ) 
; #22 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %1597~0(<2)◂8'(= r ) %1596~1'(= r ) %1595~0'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2071
LB_2071:
	cmp BYTE [r8+6],0
	jnz LB_2059
	POP_GRM_SCC
	ret
LB_2059:
	POP_GRM_FAIL 
	ret
ETR_228:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_228
	ret
GRM_228:
	PUSH_GRM
	cmp r14,r9
	jge LB_2075
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_2075
	add r14,rsi
	push rdi
	jmp LB_2076
LB_2075:
	mov r8,unt_1
	jmp LB_2073
LB_2076:
	jmp LB_2074
LB_2073:
	add rsp,0
	jmp LB_2072
LB_2074:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2079
	jmp LB_2080
LB_2079:
	mov r8,unt_1
	jmp LB_2077
LB_2080:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],100
	jnz LB_2081
	cmp BYTE [rdi+1],39
	jnz LB_2081
	jmp LB_2082
LB_2081:
	mov r8,unt_1
	jmp LB_2077
LB_2082:
	add r14,2
	jmp LB_2078
LB_2077:
	add rsp,8
	jmp LB_2072
LB_2078:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2083
LB_2083
;; rsp=1 , %1600~1'(= r ) %1599~0'(= r ) %1598~8'(= r ) 
; #105 { } ⊢ 1(<4)◂{ }
;; rsp=1 , %1601~1(<4)◂{ } %1600~1'(= r ) %1599~0'(= r ) %1598~8'(= r ) 
; #22 { 1(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 1(<4)◂{ } 8'(= r ) }
;; rsp=1 , %1602~0(<2)◂{ 1(<4)◂{ } 8'(= r ) } %1600~1'(= r ) %1599~0'(= r ) 
; ∎ 0(<2)◂{ 1(<4)◂{ } 8'(= r ) }
; .mov_ptn2 0(<2)◂{ 1(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a15◂ [ ]r}] )
; .mov_ptn 0(<2)◂{ 1(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a15◂ [ ]r}] )
	ALC_RCD 2
	mov r13,rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,8
	jmp LB_2084
LB_2084:
	cmp BYTE [r8+6],0
	jnz LB_2072
	POP_GRM_SCC
	ret
LB_2072:
	RB_GRM
	cmp r14,r9
	jge LB_2088
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_2088
	add r14,rsi
	push rdi
	jmp LB_2089
LB_2088:
	mov r8,unt_1
	jmp LB_2086
LB_2089:
	jmp LB_2087
LB_2086:
	add rsp,0
	jmp LB_2085
LB_2087:
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2092
	jmp LB_2093
LB_2092:
	mov r8,unt_1
	jmp LB_2090
LB_2093:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
	jnz LB_2094
	cmp BYTE [rdi+1],39
	jnz LB_2094
	jmp LB_2095
LB_2094:
	mov r8,unt_1
	jmp LB_2090
LB_2095:
	add r14,2
	jmp LB_2091
LB_2090:
	add rsp,8
	jmp LB_2085
LB_2091:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2096
LB_2096
;; rsp=1 , %1605~1'(= r ) %1604~0'(= r ) %1603~8'(= r ) 
; #104 { } ⊢ 2(<4)◂{ }
;; rsp=1 , %1606~2(<4)◂{ } %1605~1'(= r ) %1604~0'(= r ) %1603~8'(= r ) 
; #22 { 2(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 2(<4)◂{ } 8'(= r ) }
;; rsp=1 , %1607~0(<2)◂{ 2(<4)◂{ } 8'(= r ) } %1605~1'(= r ) %1604~0'(= r ) 
; ∎ 0(<2)◂{ 2(<4)◂{ } 8'(= r ) }
; .mov_ptn2 0(<2)◂{ 2(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a15◂ [ ]r}] )
; .mov_ptn 0(<2)◂{ 2(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a15◂ [ ]r}] )
	ALC_RCD 2
	mov r13,rax
	mov rax,unt 
	mov rax,unt_2
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,8
	jmp LB_2097
LB_2097:
	cmp BYTE [r8+6],0
	jnz LB_2085
	POP_GRM_SCC
	ret
LB_2085:
	RB_GRM
	cmp r14,r9
	jge LB_2101
 lea rdi,[r13+8+r14] 
	C_PUSH_REGS
	call scf_d
	C_POP_REGS
	cmp rax,0 
	jz LB_2101
	add r14,rsi
	push rdi
	jmp LB_2102
LB_2101:
	mov r8,unt_1
	jmp LB_2099
LB_2102:
	jmp LB_2100
LB_2099:
	add rsp,0
	jmp LB_2098
LB_2100:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2105
	jmp LB_2106
LB_2105:
	mov r8,unt_1
	jmp LB_2103
LB_2106:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_2107
	jmp LB_2108
LB_2107:
	mov r8,unt_1
	jmp LB_2103
LB_2108:
	add r14,1
	jmp LB_2104
LB_2103:
	add rsp,8
	jmp LB_2098
LB_2104:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2109
LB_2109
;; rsp=1 , %1610~1'(= r ) %1609~0'(= r ) %1608~8'(= r ) 
; #106 { } ⊢ 0(<4)◂{ }
;; rsp=1 , %1611~0(<4)◂{ } %1610~1'(= r ) %1609~0'(= r ) %1608~8'(= r ) 
; #22 { 0(<4)◂{ } 8'(= r ) } ⊢ 0(<2)◂{ 0(<4)◂{ } 8'(= r ) }
;; rsp=1 , %1612~0(<2)◂{ 0(<4)◂{ } 8'(= r ) } %1610~1'(= r ) %1609~0'(= r ) 
; ∎ 0(<2)◂{ 0(<4)◂{ } 8'(= r ) }
; .mov_ptn2 0(<2)◂{ 0(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a15◂ [ ]r}] )
; .mov_ptn 0(<2)◂{ 0(<4)◂{ } 8'(= r ) } ⊢ 2'(= a3◂ [ *{ a15◂ [ ]r}] )
	ALC_RCD 2
	mov r13,rax
	mov rax,unt 
	mov rax,unt_0
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,8
	jmp LB_2110
LB_2110:
	cmp BYTE [r8+6],0
	jnz LB_2098
	POP_GRM_SCC
	ret
LB_2098:
	POP_GRM_FAIL 
	ret
ETR_229:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_229
	ret
GRM_229:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2114
	jmp LB_2115
LB_2114:
	mov r8,unt_1
	jmp LB_2112
LB_2115:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],96
	jnz LB_2116
	jmp LB_2117
LB_2116:
	mov r8,unt_1
	jmp LB_2112
LB_2117:
	add r14,1
	jmp LB_2113
LB_2112:
	add rsp,0
	jmp LB_2111
LB_2113:
	call GRM_230
	cmp BYTE [r8+6],0
	jnz LB_2120
	jmp LB_2121
LB_2120:
	jmp LB_2118
LB_2121:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 8'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2119
LB_2118:
	add rsp,0
	jmp LB_2111
LB_2119:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2122
LB_2122
;; rsp=1 , %1615~1'(= r ) %1614~0'(= r ) %1613~8'(= a5◂ [ ] ) 
; #43 8'(= a5◂ [ ] ) ⊢ { 3'(= a5◂ [ ] ) 2'(= {| l |} ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 8'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
; .mov_ptn 8'(= a5◂ [ ] ) ⊢ 0'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r13,rax
	call ETR_43
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %1617~2'(= {| l |} ) %1616~3'(= a5◂ [ ] ) %1615~1'(= r ) %1614~0'(= r ) 
; #22 2'(= {| l |} ) ⊢ 0(<2)◂2'(= {| l |} )
;; rsp=0 , %1618~0(<2)◂2'(= {| l |} ) %1616~3'(= a5◂ [ ] ) %1615~1'(= r ) %1614~0'(= r ) 
; ∎ 0(<2)◂2'(= {| l |} )
; .mov_ptn2 0(<2)◂2'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= {| l |} ) ⊢ 2'(= a3◂ [ {| l |}] )
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	jmp LB_2123
LB_2123:
	cmp BYTE [r8+6],0
	jnz LB_2111
	POP_GRM_SCC
	ret
LB_2111:
	POP_GRM_FAIL 
	ret
ETR_230:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_230
	ret
GRM_230:
	PUSH_GRM
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2127
	jmp LB_2128
LB_2127:
	mov r8,unt_1
	jmp LB_2125
LB_2128:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2129
	jmp LB_2130
LB_2129:
	mov r8,unt_1
	jmp LB_2125
LB_2130:
	add r14,1
	jmp LB_2126
LB_2125:
	add rsp,0
	jmp LB_2124
LB_2126:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2131
LB_2131
;; rsp=0 , %1620~1'(= r ) %1619~0'(= r ) 
	jmp LB_2133
LB_2133:
; $ %[ 10r ] ⊢ %[ 10r ]
;; rsp=0 , %1621~%[ 10r ] %1620~1'(= r ) %1619~0'(= r ) 
; #32 { } ⊢ 2(<4)◂{ }
;; rsp=0 , %1622~2(<4)◂{ } %1621~%[ 10r ] %1620~1'(= r ) %1619~0'(= r ) 
; #40 { %[ 10r ] 2(<4)◂{ } } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { %[ 10r ] 2(<4)◂{ } } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 2(<4)◂{ } ⊢ 1'(= a5◂ [ ] )
	mov rax,unt 
	mov rax,unt_2
	mov r14,rax
; .mov_ptn %[ 10r ] ⊢ 0'(= r )
	mov rax,10
	mov r13,rax
	call ETR_40
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %1623~2'(= a5◂ [ ] ) %1620~1'(= r ) %1619~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %1624~0(<2)◂2'(= a5◂ [ ] ) %1620~1'(= r ) %1619~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_2132
LB_2132:
	cmp BYTE [r8+6],0
	jnz LB_2124
	POP_GRM_SCC
	ret
LB_2124:
	RB_GRM
	cmp r14,r9
	jge LB_2137
	jmp LB_2138
LB_2137:
	mov r8,unt_1 
	jmp LB_2135
LB_2138:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_2136
LB_2135:
	add rsp,0
	jmp LB_2134
LB_2136:
	call GRM_230
	cmp BYTE [r8+6],0
	jnz LB_2141
	jmp LB_2142
LB_2141:
	jmp LB_2139
LB_2142:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
; .mov_ptn 2'(= a5◂ [ ] ) ⊢ 9'(= a5◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2140
LB_2139:
	add rsp,8
	jmp LB_2134
LB_2140:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2143
LB_2143
;; rsp=2 , %1628~1'(= r ) %1627~0'(= r ) %1626~9'(= a5◂ [ ] ) %1625~8'(= r ) 
; #40 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ 2'(= a5◂ [ ] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 8'(= r ) 9'(= a5◂ [ ] ) } ⊢ { 0'(= r ) 1'(= a5◂ [ ] ) }
; .mov_ptn 9'(= a5◂ [ ] ) ⊢ 1'(= a5◂ [ ] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 8'(= r ) ⊢ 0'(= r )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call ETR_40
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=0 , %1629~2'(= a5◂ [ ] ) %1628~1'(= r ) %1627~0'(= r ) 
; #22 2'(= a5◂ [ ] ) ⊢ 0(<2)◂2'(= a5◂ [ ] )
;; rsp=0 , %1630~0(<2)◂2'(= a5◂ [ ] ) %1628~1'(= r ) %1627~0'(= r ) 
; ∎ 0(<2)◂2'(= a5◂ [ ] )
; .mov_ptn2 0(<2)◂2'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0'(= a5◂ [ ] ) ⊢ 2'(= a3◂ [ a5◂ [ ]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_2144
LB_2144:
	cmp BYTE [r8+6],0
	jnz LB_2134
	POP_GRM_SCC
	ret
LB_2134:
	POP_GRM_FAIL 
	ret
ETR_231:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_231
	ret
GRM_231:
	PUSH_GRM
	jmp LB_2147
LB_2146:
	add r14,1 
LB_2147:
	cmp r14,r9
	jge LB_2148
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2146
LB_2148
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_2151
	jmp LB_2152
LB_2151:
	jmp LB_2149
LB_2152:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2150
LB_2149:
	add rsp,0
	jmp LB_2145
LB_2150:
	jmp LB_2154
LB_2153:
	add r14,1 
LB_2154:
	cmp r14,r9
	jge LB_2155
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2153
LB_2155
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2158
	jmp LB_2159
LB_2158:
	mov r8,unt_1
	jmp LB_2156
LB_2159:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],47
	jnz LB_2160
	cmp BYTE [rdi+1],47
	jnz LB_2160
	jmp LB_2161
LB_2160:
	mov r8,unt_1
	jmp LB_2156
LB_2161:
	add r14,2
	jmp LB_2157
LB_2156:
	add rsp,8
	jmp LB_2145
LB_2157:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2162
LB_2162
;; rsp=1 , %1633~1'(= r ) %1632~0'(= r ) %1631~8'(= a35◂ [ *{ }] ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %1634~1(<2)◂{ } %1633~1'(= r ) %1632~0'(= r ) %1631~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=1 , %1635~0(<2)◂1(<2)◂{ } %1633~1'(= r ) %1632~0'(= r ) %1631~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a16◂ [ a9◂ [ ]]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a16◂ [ a9◂ [ ]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2163
LB_2163:
	cmp BYTE [r8+6],0
	jnz LB_2145
	POP_GRM_SCC
	ret
LB_2145:
	RB_GRM
	jmp LB_2166
LB_2165:
	add r14,1 
LB_2166:
	cmp r14,r9
	jge LB_2167
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2165
LB_2167
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_2170
	jmp LB_2171
LB_2170:
	jmp LB_2168
LB_2171:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2169
LB_2168:
	add rsp,0
	jmp LB_2164
LB_2169:
	jmp LB_2173
LB_2172:
	add r14,1 
LB_2173:
	cmp r14,r9
	jge LB_2174
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2172
LB_2174
	call GRM_226
	cmp BYTE [r8+6],0
	jnz LB_2177
	jmp LB_2178
LB_2177:
	jmp LB_2175
LB_2178:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a16◂ [ a9◂ [ ]] ) ⊢ 9'(= a16◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a16◂ [ a9◂ [ ]] ) ⊢ 9'(= a16◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2176
LB_2175:
	add rsp,8
	jmp LB_2164
LB_2176:
	jmp LB_2180
LB_2179:
	add r14,1 
LB_2180:
	cmp r14,r9
	jge LB_2181
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2179
LB_2181
	call GRM_231
	cmp BYTE [r8+6],0
	jnz LB_2184
	jmp LB_2185
LB_2184:
	jmp LB_2182
LB_2185:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2183
LB_2182:
	add rsp,16
	jmp LB_2164
LB_2183:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2186
LB_2186
;; rsp=3 , %1640~1'(= r ) %1639~0'(= r ) %1638~10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %1637~9'(= a16◂ [ a9◂ [ ]] ) %1636~8'(= a35◂ [ *{ }] ) 
; #21 { 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
;; rsp=3 , %1641~0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } %1640~1'(= r ) %1639~0'(= r ) %1636~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0(<2)◂0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
;; rsp=3 , %1642~0(<2)◂0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } %1640~1'(= r ) %1639~0'(= r ) %1636~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a16◂ [ a9◂ [ ]]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 9'(= a16◂ [ a9◂ [ ]] ) 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a16◂ [ a9◂ [ ]]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2187
LB_2187:
	cmp BYTE [r8+6],0
	jnz LB_2164
	POP_GRM_SCC
	ret
LB_2164:
	POP_GRM_FAIL 
	ret
LB_2427: ;; #51 { 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) : ({ _lst◂4628'(=4629'(=_t16◂_t9)) _lst◂_t16◂_t9 }→_lst◂_t16◂_t9)
;; rsp=0 , %116~1'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %115~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
;; ?; 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 1(<2)◂{ }
	mov rdi,r14
	cmp BYTE [rdi+6],1
	jnz LB_2428
;; rsp=0 , %115~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; ∎ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn2 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	ret
LB_2428:
;; ?; 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0(<2)◂{ 2'(= a16◂ [ a9◂ [ ]] ) 3'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
	mov r8, QWORD [r14+8]
	mov r9, QWORD [r14+16]
;; rsp=0 , %118~3'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %117~2'(= a16◂ [ a9◂ [ ]] ) %115~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; #21 { 2'(= a16◂ [ a9◂ [ ]] ) 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0(<2)◂{ 2'(= a16◂ [ a9◂ [ ]] ) 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
;; rsp=0 , %119~0(<2)◂{ 2'(= a16◂ [ a9◂ [ ]] ) 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } %118~3'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; #51 { 0(<2)◂{ 2'(= a16◂ [ a9◂ [ ]] ) 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } 3'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn2 { 0(<2)◂{ 2'(= a16◂ [ a9◂ [ ]] ) 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } 3'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ { 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
; .mov_ptn 3'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,r9
	mov r14,rax
	mov r10,r13
; .mov_ptn 0(<2)◂{ 2'(= a16◂ [ a9◂ [ ]] ) 4'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	ALC_RCD 2
	mov r9,rax
	mov rax,r8
	mov QWORD [r9+8+8*0],rax
	mov rax,r10
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r13,rax
	call LB_2427
;; rsp=0 , %120~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; ∎ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn2 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	ret
LB_2426: ;; #52 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) : (_lst◂_t16◂_t9→_lst◂_t16◂_t9)
;; rsp=0 , %121~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %122~1(<2)◂{ } %121~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; #51 { 1(<2)◂{ } 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn2 { 1(<2)◂{ } 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) } ⊢ { 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) }
; .mov_ptn 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 1'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,r13
	mov r14,rax
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,unt 
	mov rax,unt_1
	mov r13,rax
	call LB_2427
;; rsp=0 , %123~0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 
; ∎ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn2 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	ret
LB_2905: ;; #194 { 0'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) : ({ _t35◂_lst◂_t21◂_s8◂_t9 _t35◂_t17◂_s8◂_t9 }→_t35◂{ _lst◂_t21◂_s8◂_t9 _t17◂_s8◂_t9 })
;; rsp=0 , %1134~1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1133~0'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 
;; ? 0'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_2906
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1136~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %1134~1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) 
;; ? 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2907
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1138~0'(= a17◂ [ a9◂ [ ]{| l |}] ) %1136~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #193 { 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=0 , %1139~0(<2)◂{ 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } 
; ∎ 0(<2)◂{ 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂{ 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov r14,r13
; .mov_ptn 0(<2)◂{ 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	ALC_RCD 2
	mov r9,rax
	mov rax,r8
	mov QWORD [r9+8+8*0],rax
	mov rax,r14
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r13,rax
	ret
LB_2907:
;; ?. 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1137~0'(= a2◂ [ *{ rr{| l |}}] ) %1136~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; #192 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1140~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) %1136~2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov r14,r13
; .mov_ptn 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_2906:
;; ?. 0'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1135~2'(= a2◂ [ *{ rr{| l |}}] ) %1134~1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) 
;; ? 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2908
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1142~0'(= a17◂ [ a9◂ [ ]{| l |}] ) %1135~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1143~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1142~0'(= a17◂ [ a9◂ [ ]{| l |}] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
; .mov_ptn 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_2908:
;; ?. 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1141~0'(= a2◂ [ *{ rr{| l |}}] ) %1135~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #53 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r13
	mov r14,rax
; .mov_ptn 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r8
	mov r13,rax
	call LB_1600
;; rsp=0 , %1144~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #192 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1145~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov r14,r13
; .mov_ptn 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_2950: ;; #194 { 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) 1'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) } ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] ) : ({ _t35◂{ _lst◂_t21◂_s8◂_t9 _t17◂_s8◂_t9 } _t35◂_t7◂{ _lst◂_t21◂_s8◂_t9 _t20◂_s8◂_t9 } }→_t35◂{ { _lst◂_t21◂_s8◂_t9 _t17◂_s8◂_t9 } _t7◂{ _lst◂_t21◂_s8◂_t9 _t20◂_s8◂_t9 } })
;; rsp=0 , %1134~1'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) %1133~0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) 
;; ? 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_2951
;; rsp=0 , %1136~0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) %1134~1'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) 
;; ? 1'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2952
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1138~2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1136~0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 
; #193 { 0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ 0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=0 , %1139~0(<2)◂{ 0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } 
; ∎ 0(<2)◂{ 0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂{ 0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	mov r14,r13
; .mov_ptn 0(<2)◂{ 1'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	ALC_RCD 2
	mov r9,rax
	mov rax,r14
	mov QWORD [r9+8+8*0],rax
	mov rax,r8
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r13,rax
	ret
LB_2952:
;; ?. 1'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1137~2'(= a2◂ [ *{ rr{| l |}}] ) %1136~0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1140~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1136~0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
; .mov_ptn 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	mov rax,r8
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_2951:
;; ?. 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1135~2'(= a2◂ [ *{ rr{| l |}}] ) %1134~1'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) 
;; ? 1'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂0'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_2953
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1142~0'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1135~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1143~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1142~0'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
; .mov_ptn 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	mov rax,r8
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_2953:
;; ?. 1'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1141~0'(= a2◂ [ *{ rr{| l |}}] ) %1135~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #53 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r13
	mov r14,rax
; .mov_ptn 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r8
	mov r13,rax
	call LB_1600
;; rsp=0 , %1144~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #192 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1145~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	mov r14,r13
; .mov_ptn 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_3043: ;; #194 { 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) 1'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) } ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] ) : ({ _t35◂{ _lst◂_t21◂_s8◂_t9 _t17◂_s8◂_t9 } _t35◂_t7◂{ _t8◂_t14◂_s8◂_t9 _lst◂_t21◂_s8◂_t9 _t20◂_s8◂_t9 } }→_t35◂{ { _lst◂_t21◂_s8◂_t9 _t17◂_s8◂_t9 } _t7◂{ _t8◂_t14◂_s8◂_t9 _lst◂_t21◂_s8◂_t9 _t20◂_s8◂_t9 } })
;; rsp=0 , %1134~1'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) %1133~0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) 
;; ? 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_3044
;; rsp=0 , %1136~0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) %1134~1'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) 
;; ? 1'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_3045
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1138~2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1136~0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 
; #193 { 0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ 0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=0 , %1139~0(<2)◂{ 0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } 
; ∎ 0(<2)◂{ 0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂{ 0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	mov r14,r13
; .mov_ptn 0(<2)◂{ 1'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	ALC_RCD 2
	mov r9,rax
	mov rax,r14
	mov QWORD [r9+8+8*0],rax
	mov rax,r8
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r13,rax
	ret
LB_3045:
;; ?. 1'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1137~2'(= a2◂ [ *{ rr{| l |}}] ) %1136~0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1140~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1136~0'(= *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]} ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
; .mov_ptn 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	mov rax,r8
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_3044:
;; ?. 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1135~2'(= a2◂ [ *{ rr{| l |}}] ) %1134~1'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) 
;; ? 1'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂0'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_3046
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1142~0'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1135~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1143~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1142~0'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
; .mov_ptn 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	mov rax,r8
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_3046:
;; ?. 1'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1141~0'(= a2◂ [ *{ rr{| l |}}] ) %1135~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #53 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r13
	mov r14,rax
; .mov_ptn 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r8
	mov r13,rax
	call LB_1600
;; rsp=0 , %1144~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #192 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1145~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	mov r14,r13
; .mov_ptn 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
ETR_232:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_232
	ret
GRM_232:
	PUSH_GRM
	jmp LB_2190
LB_2189:
	add r14,1 
LB_2190:
	cmp r14,r9
	jge LB_2191
	JZ_SPC BYTE [r13+8+r14], LB_2189
LB_2191
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2194
	jmp LB_2195
LB_2194:
	mov r8,unt_1
	jmp LB_2192
LB_2195:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_2196
	cmp BYTE [rdi+1],94
	jnz LB_2196
	jmp LB_2197
LB_2196:
	mov r8,unt_1
	jmp LB_2192
LB_2197:
	add r14,2
	jmp LB_2193
LB_2192:
	add rsp,0
	jmp LB_2188
LB_2193:
	jmp LB_2199
LB_2198:
	add r14,1 
LB_2199:
	cmp r14,r9
	jge LB_2200
	JZ_SPC BYTE [r13+8+r14], LB_2198
LB_2200
	call GRM_233
	cmp BYTE [r8+6],0
	jnz LB_2203
	jmp LB_2204
LB_2203:
	jmp LB_2201
LB_2204:
	sub rsp,16
; .mov_ptn2 2'(= *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]} ) ⊢ { 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
; .mov_ptn 2'(= *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]} ) ⊢ { 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_2202
LB_2201:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_2202:
	jmp LB_2206
LB_2205:
	add r14,1 
LB_2206:
	cmp r14,r9
	jge LB_2207
	JZ_SPC BYTE [r13+8+r14], LB_2205
LB_2207
	call GRM_231
	cmp BYTE [r8+6],0
	jnz LB_2210
	jmp LB_2211
LB_2210:
	jmp LB_2208
LB_2211:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2209
LB_2208:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_2209:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2212
LB_2212
;; rsp=3 , %1647~1'(= r ) %1646~0'(= r ) %1645~10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %1644~9'(= a2◂ [ a13◂ [ {| l |}]] ) %1643~8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; #119 { 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
;; rsp=3 , %1648~3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } %1647~1'(= r ) %1646~0'(= r ) 
; #22 3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
;; rsp=3 , %1649~0(<2)◂3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } %1647~1'(= r ) %1646~0'(= r ) 
; ∎ 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) }
; .mov_ptn2 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a19◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂3(<4)◂{ 10'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 8'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 9'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a19◂ [ a9◂ [ ]{| l |}]] )
	ALC_RCD 3
	mov r13,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r13+8+8*1],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*2],rax
	mov rax,r13
	mov BYTE [rax+6],3
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2213
LB_2213:
	cmp BYTE [r8+6],0
	jnz LB_2188
	POP_GRM_SCC
	ret
LB_2188:
	RB_GRM
	jmp LB_2216
LB_2215:
	add r14,1 
LB_2216:
	cmp r14,r9
	jge LB_2217
	JZ_SPC BYTE [r13+8+r14], LB_2215
LB_2217
	call GRM_190
	cmp BYTE [r8+6],0
	jnz LB_2220
	jmp LB_2221
LB_2220:
	jmp LB_2218
LB_2221:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2219
LB_2218:
	add rsp,0
	jmp LB_2214
LB_2219:
	jmp LB_2223
LB_2222:
	add r14,1 
LB_2223:
	cmp r14,r9
	jge LB_2224
	JZ_SPC BYTE [r13+8+r14], LB_2222
LB_2224
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2227
	jmp LB_2228
LB_2227:
	mov r8,unt_1
	jmp LB_2225
LB_2228:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],95
	jnz LB_2229
	jmp LB_2230
LB_2229:
	mov r8,unt_1
	jmp LB_2225
LB_2230:
	add r14,1
	jmp LB_2226
LB_2225:
	add rsp,8
	jmp LB_2214
LB_2226:
	jmp LB_2232
LB_2231:
	add r14,1 
LB_2232:
	cmp r14,r9
	jge LB_2233
	JZ_SPC BYTE [r13+8+r14], LB_2231
LB_2233
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2236
	jmp LB_2237
LB_2236:
	mov r8,unt_1
	jmp LB_2234
LB_2237:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2238
	cmp BYTE [rdi+1],138
	jnz LB_2238
	cmp BYTE [rdi+2],162
	jnz LB_2238
	jmp LB_2239
LB_2238:
	mov r8,unt_1
	jmp LB_2234
LB_2239:
	add r14,3
	jmp LB_2235
LB_2234:
	add rsp,8
	jmp LB_2214
LB_2235:
	jmp LB_2241
LB_2240:
	add r14,1 
LB_2241:
	cmp r14,r9
	jge LB_2242
	JZ_SPC BYTE [r13+8+r14], LB_2240
LB_2242
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_2245
	jmp LB_2246
LB_2245:
	jmp LB_2243
LB_2246:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 9'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 9'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2244
LB_2243:
	add rsp,8
	jmp LB_2214
LB_2244:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2247
LB_2247
;; rsp=2 , %1653~1'(= r ) %1652~0'(= r ) %1651~9'(= a8◂ [ a13◂ [ {| l |}]] ) %1650~8'(= a11◂ [ a9◂ [ ]] ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %1654~1(<2)◂{ } %1653~1'(= r ) %1652~0'(= r ) %1651~9'(= a8◂ [ a13◂ [ {| l |}]] ) %1650~8'(= a11◂ [ a9◂ [ ]] ) 
; #79 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=2 , %1655~0(<2)◂1(<2)◂{ } %1653~1'(= r ) %1652~0'(= r ) %1651~9'(= a8◂ [ a13◂ [ {| l |}]] ) %1650~8'(= a11◂ [ a9◂ [ ]] ) 
; #120 { 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) } ⊢ 2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) }
;; rsp=2 , %1656~2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) } %1653~1'(= r ) %1652~0'(= r ) 
; #22 2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) } ⊢ 0(<2)◂2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) }
;; rsp=2 , %1657~0(<2)◂2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) } %1653~1'(= r ) %1652~0'(= r ) 
; ∎ 0(<2)◂2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) }
; .mov_ptn2 0(<2)◂2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a19◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂2(<4)◂{ 8'(= a11◂ [ a9◂ [ ]] ) 0(<2)◂1(<2)◂{ } 9'(= a8◂ [ a13◂ [ {| l |}]] ) } ⊢ 2'(= a3◂ [ a19◂ [ a9◂ [ ]{| l |}]] )
	ALC_RCD 3
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov QWORD [r13+8+8*1],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*2],rax
	mov rax,r13
	mov BYTE [rax+6],2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_2248
LB_2248:
	cmp BYTE [r8+6],0
	jnz LB_2214
	POP_GRM_SCC
	ret
LB_2214:
	POP_GRM_FAIL 
	ret
ETR_233:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_233
	ret
GRM_233:
	PUSH_GRM
	jmp LB_2251
LB_2250:
	add r14,1 
LB_2251:
	cmp r14,r9
	jge LB_2252
	JZ_SPC BYTE [r13+8+r14], LB_2250
LB_2252
	call GRM_187
	cmp BYTE [r8+6],0
	jnz LB_2255
	jmp LB_2256
LB_2255:
	jmp LB_2253
LB_2256:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_2254
LB_2253:
	add rsp,0
	jmp LB_2249
LB_2254:
	jmp LB_2258
LB_2257:
	add r14,1 
LB_2258:
	cmp r14,r9
	jge LB_2259
	JZ_SPC BYTE [r13+8+r14], LB_2257
LB_2259
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2262
	jmp LB_2263
LB_2262:
	mov r8,unt_1
	jmp LB_2260
LB_2263:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2264
	cmp BYTE [rdi+1],138
	jnz LB_2264
	cmp BYTE [rdi+2],162
	jnz LB_2264
	jmp LB_2265
LB_2264:
	mov r8,unt_1
	jmp LB_2260
LB_2265:
	add r14,3
	jmp LB_2261
LB_2260:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_2261:
	jmp LB_2267
LB_2266:
	add r14,1 
LB_2267:
	cmp r14,r9
	jge LB_2268
	JZ_SPC BYTE [r13+8+r14], LB_2266
LB_2268
	call GRM_209
	cmp BYTE [r8+6],0
	jnz LB_2271
	jmp LB_2272
LB_2271:
	jmp LB_2269
LB_2272:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a13◂ [ {| l |}] ) ⊢ 8'(= a13◂ [ {| l |}] )
; .mov_ptn 2'(= a13◂ [ {| l |}] ) ⊢ 8'(= a13◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2270
LB_2269:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_2270:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2273
LB_2273
;; rsp=1 , %1661~1'(= r ) %1660~0'(= r ) %1659~8'(= a13◂ [ {| l |}] ) %1658~{ } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %1662~1(<2)◂{ } %1661~1'(= r ) %1660~0'(= r ) %1659~8'(= a13◂ [ {| l |}] ) %1658~{ } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %1663~1(<2)◂{ } %1662~1(<2)◂{ } %1661~1'(= r ) %1660~0'(= r ) %1659~8'(= a13◂ [ {| l |}] ) %1658~{ } 
; #21 { 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } }
;; rsp=1 , %1664~0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } %1662~1(<2)◂{ } %1661~1'(= r ) %1660~0'(= r ) %1658~{ } 
; #22 { 1(<2)◂{ } 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } } ⊢ 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } }
;; rsp=1 , %1665~0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } } %1661~1'(= r ) %1660~0'(= r ) %1658~{ } 
; ∎ 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } }
; .mov_ptn2 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } } ⊢ 2'(= a3◂ [ *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]}] )
; .mov_ptn 0(<2)◂{ 1(<2)◂{ } 0(<2)◂{ 8'(= a13◂ [ {| l |}] ) 1(<2)◂{ } } } ⊢ 2'(= a3◂ [ *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]}] )
	ALC_RCD 2
	mov r13,rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r13+8+8*0],rax
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r14+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,8
	jmp LB_2274
LB_2274:
	cmp BYTE [r8+6],0
	jnz LB_2249
	POP_GRM_SCC
	ret
LB_2249:
	RB_GRM
	jmp LB_2277
LB_2276:
	add r14,1 
LB_2277:
	cmp r14,r9
	jge LB_2278
	JZ_SPC BYTE [r13+8+r14], LB_2276
LB_2278
	call GRM_204
	cmp BYTE [r8+6],0
	jnz LB_2281
	jmp LB_2282
LB_2281:
	jmp LB_2279
LB_2282:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a12◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a12◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2280
LB_2279:
	add rsp,0
	jmp LB_2275
LB_2280:
	jmp LB_2284
LB_2283:
	add r14,1 
LB_2284:
	cmp r14,r9
	jge LB_2285
	JZ_SPC BYTE [r13+8+r14], LB_2283
LB_2285
	call GRM_203
	cmp BYTE [r8+6],0
	jnz LB_2288
	jmp LB_2289
LB_2288:
	jmp LB_2286
LB_2289:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2287
LB_2286:
	add rsp,8
	jmp LB_2275
LB_2287:
	jmp LB_2291
LB_2290:
	add r14,1 
LB_2291:
	cmp r14,r9
	jge LB_2292
	JZ_SPC BYTE [r13+8+r14], LB_2290
LB_2292
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2295
	jmp LB_2296
LB_2295:
	mov r8,unt_1
	jmp LB_2293
LB_2296:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2297
	cmp BYTE [rdi+1],138
	jnz LB_2297
	cmp BYTE [rdi+2],162
	jnz LB_2297
	jmp LB_2298
LB_2297:
	mov r8,unt_1
	jmp LB_2293
LB_2298:
	add r14,3
	jmp LB_2294
LB_2293:
	add rsp,16
	jmp LB_2275
LB_2294:
	jmp LB_2300
LB_2299:
	add r14,1 
LB_2300:
	cmp r14,r9
	jge LB_2301
	JZ_SPC BYTE [r13+8+r14], LB_2299
LB_2301
	call GRM_209
	cmp BYTE [r8+6],0
	jnz LB_2304
	jmp LB_2305
LB_2304:
	jmp LB_2302
LB_2305:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a13◂ [ {| l |}] ) ⊢ 10'(= a13◂ [ {| l |}] )
; .mov_ptn 2'(= a13◂ [ {| l |}] ) ⊢ 10'(= a13◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2303
LB_2302:
	add rsp,16
	jmp LB_2275
LB_2303:
	jmp LB_2307
LB_2306:
	add r14,1 
LB_2307:
	cmp r14,r9
	jge LB_2308
	JZ_SPC BYTE [r13+8+r14], LB_2306
LB_2308
	call GRM_208
	cmp BYTE [r8+6],0
	jnz LB_2311
	jmp LB_2312
LB_2311:
	jmp LB_2309
LB_2312:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a13◂ [ {| l |}]] ) ⊢ 11'(= a2◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a2◂ [ a13◂ [ {| l |}]] ) ⊢ 11'(= a2◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2310
LB_2309:
	add rsp,24
	jmp LB_2275
LB_2310:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_2313
LB_2313
;; rsp=4 , %1671~1'(= r ) %1670~0'(= r ) %1669~11'(= a2◂ [ a13◂ [ {| l |}]] ) %1668~10'(= a13◂ [ {| l |}] ) %1667~9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1666~8'(= a12◂ [ a9◂ [ ]{| l |}] ) 
; #21 { 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=4 , %1672~0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1671~1'(= r ) %1670~0'(= r ) %1669~11'(= a2◂ [ a13◂ [ {| l |}]] ) %1668~10'(= a13◂ [ {| l |}] ) 
; #21 { 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) }
;; rsp=4 , %1673~0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } %1672~0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1671~1'(= r ) %1670~0'(= r ) 
; #22 { 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } } ⊢ 0(<2)◂{ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } }
;; rsp=4 , %1674~0(<2)◂{ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } } %1671~1'(= r ) %1670~0'(= r ) 
; ∎ 0(<2)◂{ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } }
; .mov_ptn2 0(<2)◂{ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } } ⊢ 2'(= a3◂ [ *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]}] )
; .mov_ptn 0(<2)◂{ 0(<2)◂{ 8'(= a12◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } 0(<2)◂{ 10'(= a13◂ [ {| l |}] ) 11'(= a2◂ [ a13◂ [ {| l |}]] ) } } ⊢ 2'(= a3◂ [ *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]}] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*4]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov QWORD [r13+8+8*0],rax
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,32
	jmp LB_2314
LB_2314:
	cmp BYTE [r8+6],0
	jnz LB_2275
	POP_GRM_SCC
	ret
LB_2275:
	POP_GRM_FAIL 
	ret
ETR_234:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_234
	ret
GRM_234:
	PUSH_GRM
	jmp LB_2317
LB_2316:
	add r14,1 
LB_2317:
	cmp r14,r9
	jge LB_2318
	JZ_SPC BYTE [r13+8+r14], LB_2316
LB_2318
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_2321
	jmp LB_2322
LB_2321:
	jmp LB_2319
LB_2322:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2320
LB_2319:
	add rsp,0
	jmp LB_2315
LB_2320:
	jmp LB_2324
LB_2323:
	add r14,1 
LB_2324:
	cmp r14,r9
	jge LB_2325
	JZ_SPC BYTE [r13+8+r14], LB_2323
LB_2325
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2328
	jmp LB_2329
LB_2328:
	mov r8,unt_1
	jmp LB_2326
LB_2329:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2330
	cmp BYTE [rdi+1],136
	jnz LB_2330
	cmp BYTE [rdi+2],142
	jnz LB_2330
	cmp BYTE [rdi+3],124
	jnz LB_2330
	jmp LB_2331
LB_2330:
	mov r8,unt_1
	jmp LB_2326
LB_2331:
	add r14,4
	jmp LB_2327
LB_2326:
	add rsp,8
	jmp LB_2315
LB_2327:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2332
LB_2332
;; rsp=1 , %1677~1'(= r ) %1676~0'(= r ) %1675~8'(= a35◂ [ *{ }] ) 
; #125 0'(= r ) ⊢ 6(<7)◂0'(= r )
;; rsp=1 , %1678~6(<7)◂0'(= r ) %1677~1'(= r ) %1675~8'(= a35◂ [ *{ }] ) 
; #193 6(<7)◂0'(= r ) ⊢ 0(<2)◂6(<7)◂0'(= r )
;; rsp=1 , %1679~0(<2)◂6(<7)◂0'(= r ) %1677~1'(= r ) %1675~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂6(<7)◂0'(= r ) ⊢ 0(<2)◂0(<2)◂6(<7)◂0'(= r )
;; rsp=1 , %1680~0(<2)◂0(<2)◂6(<7)◂0'(= r ) %1677~1'(= r ) %1675~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂6(<7)◂0'(= r )
; .mov_ptn2 0(<2)◂0(<2)◂6(<7)◂0'(= r ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂6(<7)◂0'(= r ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],6
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2333
LB_2333:
	cmp BYTE [r8+6],0
	jnz LB_2315
	POP_GRM_SCC
	ret
LB_2315:
	RB_GRM
	jmp LB_2336
LB_2335:
	add r14,1 
LB_2336:
	cmp r14,r9
	jge LB_2337
	JZ_SPC BYTE [r13+8+r14], LB_2335
LB_2337
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_2340
	jmp LB_2341
LB_2340:
	jmp LB_2338
LB_2341:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2339
LB_2338:
	add rsp,0
	jmp LB_2334
LB_2339:
	jmp LB_2343
LB_2342:
	add r14,1 
LB_2343:
	cmp r14,r9
	jge LB_2344
	JZ_SPC BYTE [r13+8+r14], LB_2342
LB_2344
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2347
	jmp LB_2348
LB_2347:
	mov r8,unt_1
	jmp LB_2345
LB_2348:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2349
	cmp BYTE [rdi+1],136
	jnz LB_2349
	cmp BYTE [rdi+2],142
	jnz LB_2349
	jmp LB_2350
LB_2349:
	mov r8,unt_1
	jmp LB_2345
LB_2350:
	add r14,3
	jmp LB_2346
LB_2345:
	add rsp,8
	jmp LB_2334
LB_2346:
	PUSH_GRM
	jmp LB_2354
LB_2353:
	add r14,1 
LB_2354:
	cmp r14,r9
	jge LB_2355
	JZ_SPC BYTE [r13+8+r14], LB_2353
LB_2355
	call GRM_201
	cmp BYTE [r8+6],0
	jnz LB_2358
	jmp LB_2359
LB_2358:
	jmp LB_2356
LB_2359:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2357
LB_2356:
	add rsp,0
	jmp LB_2352
LB_2357:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2360
LB_2360
;; rsp=1 , %1686~1'(= r ) %1685~0'(= r ) %1684~8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; #126 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
;; rsp=1 , %1687~5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1686~1'(= r ) %1685~0'(= r ) 
; #193 5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
;; rsp=1 , %1688~0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1686~1'(= r ) %1685~0'(= r ) 
; #22 0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
;; rsp=1 , %1689~0(<2)◂0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1686~1'(= r ) %1685~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn2 0(<2)◂0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂5(<7)◂8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],5
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2361
LB_2361:
	cmp BYTE [r8+6],0
	jnz LB_2352
	POP_GRM_SCC
	jmp LB_2351
LB_2352:
	RB_GRM
	jmp LB_2364
LB_2363:
	add r14,1 
LB_2364:
	cmp r14,r9
	jge LB_2365
	JZ_SPC BYTE [r13+8+r14], LB_2363
LB_2365
	call GRM_220
	cmp BYTE [r8+6],0
	jnz LB_2368
	jmp LB_2369
LB_2368:
	jmp LB_2366
LB_2369:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_2367
LB_2366:
	add rsp,0
	jmp LB_2362
LB_2367:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2370
LB_2370
;; rsp=2 , %1692~1'(= r ) %1691~0'(= r ) %1690~{ 8'(= r ) 9'(= r ) } 
	jmp LB_2372
LB_2372:
; $ %[ "lc_code ∎ .. " ] ⊢ %[ "lc_code ∎ .. " ]
;; rsp=2 , %1693~%[ "lc_code ∎ .. " ] %1692~1'(= r ) %1691~0'(= r ) %1690~{ 8'(= r ) 9'(= r ) } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %1694~1(<2)◂{ } %1693~%[ "lc_code ∎ .. " ] %1692~1'(= r ) %1691~0'(= r ) %1690~{ 8'(= r ) 9'(= r ) } 
; #21 { { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %1695~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %1690~{ 8'(= r ) 9'(= r ) } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %1696~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %1690~{ 8'(= r ) 9'(= r ) } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
;; rsp=2 , %1697~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } %1690~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code ∎ .. " ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r9,rax
	ALC_RCD 3
	mov r10,rax
	mov rax,r13
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
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
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_2371
LB_2371:
	cmp BYTE [r8+6],0
	jnz LB_2362
	POP_GRM_SCC
	jmp LB_2351
LB_2362:
	POP_GRM_FAIL 
	jmp LB_2351
LB_2351:
	cmp BYTE [r8+6],0
	jnz LB_2373
	jmp LB_2374
LB_2373:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2374:
	mov QWORD [rsp+8*1],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2375
LB_2375
;; rsp=1 , %1698~3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1683~1'(= r ) %1682~0'(= r ) %1681~8'(= a35◂ [ *{ }] ) 
; #22 3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
;; rsp=1 , %1699~0(<2)◂3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1683~1'(= r ) %1682~0'(= r ) %1681~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn2 0(<2)◂3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2376
LB_2376:
	cmp BYTE [r8+6],0
	jnz LB_2334
	POP_GRM_SCC
	ret
LB_2334:
	RB_GRM
	jmp LB_2379
LB_2378:
	add r14,1 
LB_2379:
	cmp r14,r9
	jge LB_2380
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2378
LB_2380
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_2383
	jmp LB_2384
LB_2383:
	jmp LB_2381
LB_2384:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2382
LB_2381:
	add rsp,0
	jmp LB_2377
LB_2382:
	jmp LB_2386
LB_2385:
	add r14,1 
LB_2386:
	cmp r14,r9
	jge LB_2387
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2385
LB_2387
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2390
	jmp LB_2391
LB_2390:
	mov r8,unt_1
	jmp LB_2388
LB_2391:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],94
	jnz LB_2392
	jmp LB_2393
LB_2392:
	mov r8,unt_1
	jmp LB_2388
LB_2393:
	add r14,1
	jmp LB_2389
LB_2388:
	add rsp,8
	jmp LB_2377
LB_2389:
	jmp LB_2395
LB_2394:
	add r14,1 
LB_2395:
	cmp r14,r9
	jge LB_2396
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2394
LB_2396
	call GRM_233
	cmp BYTE [r8+6],0
	jnz LB_2399
	jmp LB_2400
LB_2399:
	jmp LB_2397
LB_2400:
	sub rsp,16
; .mov_ptn2 2'(= *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]} ) ⊢ { 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) }
; .mov_ptn 2'(= *{ a2◂ [ a12◂ [ a9◂ [ ]{| l |}]]a2◂ [ a13◂ [ {| l |}]]} ) ⊢ { 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_2398
LB_2397:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2398:
	jmp LB_2402
LB_2401:
	add r14,1 
LB_2402:
	cmp r14,r9
	jge LB_2403
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2401
LB_2403
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2406
	jmp LB_2407
LB_2406:
	mov r8,unt_1
	jmp LB_2404
LB_2407:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2408
	jmp LB_2409
LB_2408:
	mov r8,unt_1
	jmp LB_2404
LB_2409:
	add r14,1
	jmp LB_2405
LB_2404:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_2405:
	jmp LB_2411
LB_2410:
	add r14,1 
LB_2411:
	cmp r14,r9
	jge LB_2412
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2410
LB_2412
	call GRM_231
	cmp BYTE [r8+6],0
	jnz LB_2415
	jmp LB_2416
LB_2415:
	jmp LB_2413
LB_2416:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 11'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 11'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2414
LB_2413:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_2414:
	jmp LB_2418
LB_2417:
	add r14,1 
LB_2418:
	cmp r14,r9
	jge LB_2419
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2417
LB_2419
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_2422
	jmp LB_2423
LB_2422:
	jmp LB_2420
LB_2423:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2421
LB_2420:
	add rsp,32
	POP_GRM_FAIL
	ret
LB_2421:
	mov QWORD [rsp+8*5],r14
	mov r13,QWORD [rsp+16+8*5]
	mov r14,QWORD [rsp+8*5]
	jmp LB_2424
LB_2424
;; rsp=5 , %1706~1'(= r ) %1705~0'(= r ) %1704~12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1703~11'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %1702~10'(= a2◂ [ a13◂ [ {| l |}]] ) %1701~9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1700~8'(= a35◂ [ *{ }] ) 
; #52 11'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 11'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
; .mov_ptn 11'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) ⊢ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call LB_2426
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=5 , %1707~2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) %1706~1'(= r ) %1705~0'(= r ) %1704~12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1702~10'(= a2◂ [ a13◂ [ {| l |}]] ) %1701~9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1700~8'(= a35◂ [ *{ }] ) 
; #119 { 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } ⊢ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) }
;; rsp=5 , %1708~3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } %1706~1'(= r ) %1705~0'(= r ) %1704~12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1700~8'(= a35◂ [ *{ }] ) 
;; ? 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2429
	mov r9,QWORD [rdi+8]
;; rsp=5 , %1710~3'(= a17◂ [ a9◂ [ ]{| l |}] ) %1708~3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } %1706~1'(= r ) %1705~0'(= r ) %1700~8'(= a35◂ [ *{ }] ) 
; #129 { 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=5 , %1711~2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1706~1'(= r ) %1705~0'(= r ) %1700~8'(= a35◂ [ *{ }] ) 
; #193 2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=5 , %1712~0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1706~1'(= r ) %1705~0'(= r ) %1700~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=5 , %1713~0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1706~1'(= r ) %1705~0'(= r ) %1700~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂2(<7)◂{ 3(<4)◂{ 0'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r14,rax
	ALC_RCD 3
	mov r10,rax
	mov rax,r13
	mov QWORD [r10+8+8*0],rax
	mov rax,QWORD [rsp-8+8*4]
	mov QWORD [r10+8+8*1],rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov BYTE [rax+6],3
	mov QWORD [r14+8+8*0],rax
	mov rax,r9
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,40
	jmp LB_2425
LB_2429:
;; ?. 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=5 , %1709~3'(= a2◂ [ *{ rr{| l |}}] ) %1708~3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } %1706~1'(= r ) %1705~0'(= r ) %1700~8'(= a35◂ [ *{ }] ) 
; #192 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %1714~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1708~3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } %1706~1'(= r ) %1705~0'(= r ) %1700~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=5 , %1715~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1708~3(<4)◂{ 2'(= a2◂ [ a16◂ [ a9◂ [ ]]] ) 9'(= a2◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 10'(= a2◂ [ a13◂ [ {| l |}]] ) } %1706~1'(= r ) %1705~0'(= r ) %1700~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,40
	jmp LB_2425
LB_2425:
	cmp BYTE [r8+6],0
	jnz LB_2377
	POP_GRM_SCC
	ret
LB_2377:
	RB_GRM
	jmp LB_2432
LB_2431:
	add r14,1 
LB_2432:
	cmp r14,r9
	jge LB_2433
	JZ_SPC BYTE [r13+8+r14], LB_2431
LB_2433
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_2436
	jmp LB_2437
LB_2436:
	jmp LB_2434
LB_2437:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2435
LB_2434:
	add rsp,0
	jmp LB_2430
LB_2435:
	jmp LB_2439
LB_2438:
	add r14,1 
LB_2439:
	cmp r14,r9
	jge LB_2440
	JZ_SPC BYTE [r13+8+r14], LB_2438
LB_2440
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2443
	jmp LB_2444
LB_2443:
	mov r8,unt_1
	jmp LB_2441
LB_2444:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2445
	cmp BYTE [rdi+1],151
	jnz LB_2445
	cmp BYTE [rdi+2],130
	jnz LB_2445
	jmp LB_2446
LB_2445:
	mov r8,unt_1
	jmp LB_2441
LB_2446:
	add r14,3
	jmp LB_2442
LB_2441:
	add rsp,8
	jmp LB_2430
LB_2442:
	jmp LB_2448
LB_2447:
	add r14,1 
LB_2448:
	cmp r14,r9
	jge LB_2449
	JZ_SPC BYTE [r13+8+r14], LB_2447
LB_2449
	call GRM_204
	cmp BYTE [r8+6],0
	jnz LB_2452
	jmp LB_2453
LB_2452:
	jmp LB_2450
LB_2453:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a12◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a12◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a12◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2451
LB_2450:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2451:
	jmp LB_2455
LB_2454:
	add r14,1 
LB_2455:
	cmp r14,r9
	jge LB_2456
	JZ_SPC BYTE [r13+8+r14], LB_2454
LB_2456
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2459
	jmp LB_2460
LB_2459:
	mov r8,unt_1
	jmp LB_2457
LB_2460:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_2461
	jmp LB_2462
LB_2461:
	mov r8,unt_1
	jmp LB_2457
LB_2462:
	add r14,1
	jmp LB_2458
LB_2457:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_2458:
	jmp LB_2464
LB_2463:
	add r14,1 
LB_2464:
	cmp r14,r9
	jge LB_2465
	JZ_SPC BYTE [r13+8+r14], LB_2463
LB_2465
	call GRM_201
	cmp BYTE [r8+6],0
	jnz LB_2468
	jmp LB_2469
LB_2468:
	jmp LB_2466
LB_2469:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2467
LB_2466:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_2467:
	PUSH_GRM
	jmp LB_2473
LB_2472:
	add r14,1 
LB_2473:
	cmp r14,r9
	jge LB_2474
	JZ_SPC BYTE [r13+8+r14], LB_2472
LB_2474
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2477
	jmp LB_2478
LB_2477:
	mov r8,unt_1
	jmp LB_2475
LB_2478:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2479
	cmp BYTE [rdi+1],138
	jnz LB_2479
	cmp BYTE [rdi+2],162
	jnz LB_2479
	cmp BYTE [rdi+3],124
	jnz LB_2479
	jmp LB_2480
LB_2479:
	mov r8,unt_1
	jmp LB_2475
LB_2480:
	add r14,4
	jmp LB_2476
LB_2475:
	add rsp,0
	jmp LB_2471
LB_2476:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2481
LB_2481
;; rsp=0 , %1722~1'(= r ) %1721~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1723~1(<2)◂{ } %1722~1'(= r ) %1721~0'(= r ) 
; #193 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1724~0(<2)◂1(<2)◂{ } %1722~1'(= r ) %1721~0'(= r ) 
; #22 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %1725~0(<2)◂0(<2)◂1(<2)◂{ } %1722~1'(= r ) %1721~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_2482
LB_2482:
	cmp BYTE [r8+6],0
	jnz LB_2471
	POP_GRM_SCC
	jmp LB_2470
LB_2471:
	RB_GRM
	jmp LB_2485
LB_2484:
	add r14,1 
LB_2485:
	cmp r14,r9
	jge LB_2486
	JZ_SPC BYTE [r13+8+r14], LB_2484
LB_2486
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2489
	jmp LB_2490
LB_2489:
	mov r8,unt_1
	jmp LB_2487
LB_2490:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2491
	cmp BYTE [rdi+1],138
	jnz LB_2491
	cmp BYTE [rdi+2],162
	jnz LB_2491
	jmp LB_2492
LB_2491:
	mov r8,unt_1
	jmp LB_2487
LB_2492:
	add r14,3
	jmp LB_2488
LB_2487:
	add rsp,0
	jmp LB_2483
LB_2488:
	jmp LB_2494
LB_2493:
	add r14,1 
LB_2494:
	cmp r14,r9
	jge LB_2495
	JZ_SPC BYTE [r13+8+r14], LB_2493
LB_2495
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_2498
	jmp LB_2499
LB_2498:
	jmp LB_2496
LB_2499:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2497
LB_2496:
	add rsp,0
	jmp LB_2483
LB_2497:
	jmp LB_2501
LB_2500:
	add r14,1 
LB_2501:
	cmp r14,r9
	jge LB_2502
	JZ_SPC BYTE [r13+8+r14], LB_2500
LB_2502
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_2505
	jmp LB_2506
LB_2505:
	jmp LB_2503
LB_2506:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2504
LB_2503:
	add rsp,8
	jmp LB_2483
LB_2504:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2507
LB_2507
;; rsp=2 , %1729~1'(= r ) %1728~0'(= r ) %1727~9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1726~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
;; ? 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2509
	mov r8,QWORD [rdi+8]
;; rsp=2 , %1731~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1729~1'(= r ) %1728~0'(= r ) %1726~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %1732~0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1729~1'(= r ) %1728~0'(= r ) 
; #193 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %1733~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1729~1'(= r ) %1728~0'(= r ) 
; #22 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %1734~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1729~1'(= r ) %1728~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_2508
LB_2509:
;; ?. 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=2 , %1730~2'(= a2◂ [ *{ rr{| l |}}] ) %1729~1'(= r ) %1728~0'(= r ) %1726~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %1735~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1729~1'(= r ) %1728~0'(= r ) %1726~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %1736~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1729~1'(= r ) %1728~0'(= r ) %1726~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_2508
LB_2508:
	cmp BYTE [r8+6],0
	jnz LB_2483
	POP_GRM_SCC
	jmp LB_2470
LB_2483:
	POP_GRM_FAIL 
	jmp LB_2470
LB_2470:
	cmp BYTE [r8+6],0
	jnz LB_2510
	jmp LB_2511
LB_2510:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_2511:
	mov QWORD [rsp+8*3],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 3'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 3'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2512
LB_2512
;; rsp=3 , %1737~3'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] ) %1720~1'(= r ) %1719~0'(= r ) %1718~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1717~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1716~8'(= a35◂ [ *{ }] ) 
;; ? 3'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2514
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1739~2'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1720~1'(= r ) %1719~0'(= r ) %1718~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1717~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1716~8'(= a35◂ [ *{ }] ) 
;; ? 2'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a8◂ [ a13◂ [ {| l |}]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2515
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
;; rsp=3 , %1741~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %1740~3'(= a8◂ [ a13◂ [ {| l |}]] ) %1720~1'(= r ) %1719~0'(= r ) %1718~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1717~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1716~8'(= a35◂ [ *{ }] ) 
; #121 { 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } ⊢ 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) }
;; rsp=3 , %1742~1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } %1741~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %1720~1'(= r ) %1719~0'(= r ) %1716~8'(= a35◂ [ *{ }] ) 
; #129 { 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1743~2(<7)◂{ 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1720~1'(= r ) %1719~0'(= r ) %1716~8'(= a35◂ [ *{ }] ) 
; #193 2(<7)◂{ 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1744~0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1720~1'(= r ) %1719~0'(= r ) %1716~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1745~0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1720~1'(= r ) %1719~0'(= r ) %1716~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂2(<7)◂{ 1(<4)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 3
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r14+8+8*1],rax
	mov rax,r9
	mov QWORD [r14+8+8*2],rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov QWORD [r13+8+8*0],rax
	mov rax,r10
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2513
LB_2515:
;; ?. 2'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %1720~1'(= r ) %1719~0'(= r ) %1718~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1717~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1716~8'(= a35◂ [ *{ }] ) 
; #130 { 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %1746~1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1720~1'(= r ) %1719~0'(= r ) %1716~8'(= a35◂ [ *{ }] ) 
; #193 1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %1747~0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1720~1'(= r ) %1719~0'(= r ) %1716~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %1748~0(<2)◂0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1720~1'(= r ) %1719~0'(= r ) %1716~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<7)◂{ 9'(= a12◂ [ a9◂ [ ]{| l |}] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2513
LB_2514:
;; ?. 3'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1738~2'(= a2◂ [ *{ rr{| l |}}] ) %1720~1'(= r ) %1719~0'(= r ) %1718~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1717~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1716~8'(= a35◂ [ *{ }] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1749~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1720~1'(= r ) %1719~0'(= r ) %1718~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1717~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1716~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1750~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1720~1'(= r ) %1719~0'(= r ) %1718~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1717~9'(= a12◂ [ a9◂ [ ]{| l |}] ) %1716~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2513
LB_2513:
	cmp BYTE [r8+6],0
	jnz LB_2430
	POP_GRM_SCC
	ret
LB_2430:
	RB_GRM
	jmp LB_2518
LB_2517:
	add r14,1 
LB_2518:
	cmp r14,r9
	jge LB_2519
	JZ_SPC BYTE [r13+8+r14], LB_2517
LB_2519
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_2522
	jmp LB_2523
LB_2522:
	jmp LB_2520
LB_2523:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2521
LB_2520:
	add rsp,0
	jmp LB_2516
LB_2521:
	jmp LB_2525
LB_2524:
	add r14,1 
LB_2525:
	cmp r14,r9
	jge LB_2526
	JZ_SPC BYTE [r13+8+r14], LB_2524
LB_2526
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_2529
	jmp LB_2530
LB_2529:
	mov r8,unt_1
	jmp LB_2527
LB_2530:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_2531
	cmp BYTE [rdi+1],187
	jnz LB_2531
	jmp LB_2532
LB_2531:
	mov r8,unt_1
	jmp LB_2527
LB_2532:
	add r14,2
	jmp LB_2528
LB_2527:
	add rsp,8
	jmp LB_2516
LB_2528:
	jmp LB_2534
LB_2533:
	add r14,1 
LB_2534:
	cmp r14,r9
	jge LB_2535
	JZ_SPC BYTE [r13+8+r14], LB_2533
LB_2535
	call GRM_232
	cmp BYTE [r8+6],0
	jnz LB_2538
	jmp LB_2539
LB_2538:
	jmp LB_2536
LB_2539:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a19◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a19◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2537
LB_2536:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2537:
	jmp LB_2541
LB_2540:
	add r14,1 
LB_2541:
	cmp r14,r9
	jge LB_2542
	JZ_SPC BYTE [r13+8+r14], LB_2540
LB_2542
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_2545
	jmp LB_2546
LB_2545:
	jmp LB_2543
LB_2546:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2544
LB_2543:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_2544:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2547
LB_2547
;; rsp=3 , %1755~1'(= r ) %1754~0'(= r ) %1753~10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1752~9'(= a19◂ [ a9◂ [ ]{| l |}] ) %1751~8'(= a35◂ [ *{ }] ) 
;; ? 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2549
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1757~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1755~1'(= r ) %1754~0'(= r ) %1752~9'(= a19◂ [ a9◂ [ ]{| l |}] ) %1751~8'(= a35◂ [ *{ }] ) 
;; ?; 9'(= a19◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<4)◂{ 3'(= a11◂ [ a9◂ [ ]] ) 4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 5'(= a8◂ [ a13◂ [ {| l |}]] ) }
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],2
	jnz LB_2550
	mov rdi,QWORD [rsp-8+8*2]
	mov r9, QWORD [rdi+8]
	mov rdi,QWORD [rsp-8+8*2]
	mov r10, QWORD [rdi+16]
	mov rdi,QWORD [rsp-8+8*2]
	mov r11, QWORD [rdi+24]
;; rsp=3 , %1760~5'(= a8◂ [ a13◂ [ {| l |}]] ) %1759~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1758~3'(= a11◂ [ a9◂ [ ]] ) %1757~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1755~1'(= r ) %1754~0'(= r ) %1751~8'(= a35◂ [ *{ }] ) 
; #92 3'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂3'(= a11◂ [ a9◂ [ ]] )
;; rsp=3 , %1761~0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) %1760~5'(= a8◂ [ a13◂ [ {| l |}]] ) %1759~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1757~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1755~1'(= r ) %1754~0'(= r ) %1751~8'(= a35◂ [ *{ }] ) 
; #78 0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) ⊢ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] )
;; rsp=3 , %1762~1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) %1760~5'(= a8◂ [ a13◂ [ {| l |}]] ) %1759~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1757~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1755~1'(= r ) %1754~0'(= r ) %1751~8'(= a35◂ [ *{ }] ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %1763~1(<2)◂{ } %1762~1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) %1760~5'(= a8◂ [ a13◂ [ {| l |}]] ) %1759~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1757~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1755~1'(= r ) %1754~0'(= r ) %1751~8'(= a35◂ [ *{ }] ) 
; #21 { 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } }
;; rsp=3 , %1764~0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } %1762~1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) %1759~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1757~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1755~1'(= r ) %1754~0'(= r ) %1751~8'(= a35◂ [ *{ }] ) 
; #123 { 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1765~1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1762~1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) %1759~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1755~1'(= r ) %1754~0'(= r ) %1751~8'(= a35◂ [ *{ }] ) 
; #127 { 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } }
;; rsp=3 , %1766~4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } %1759~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1755~1'(= r ) %1754~0'(= r ) %1751~8'(= a35◂ [ *{ }] ) 
; #193 4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } }
;; rsp=3 , %1767~0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } %1759~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1755~1'(= r ) %1754~0'(= r ) %1751~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } }
;; rsp=3 , %1768~0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } %1759~4'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1755~1'(= r ) %1754~0'(= r ) %1751~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } }
; .mov_ptn2 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂4(<7)◂{ 1(<2)◂0(<2)◂3'(= a11◂ [ a9◂ [ ]] ) 1(<2)◂{ 0(<2)◂{ 5'(= a8◂ [ a13◂ [ {| l |}]] ) 1(<2)◂{ } } 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r14,rax
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov QWORD [r14+8+8*0],rax
	ALC_RCD 2
	mov r10,rax
	ALC_RCD 2
	mov rcx,rax
	mov rax,r11
	mov QWORD [rcx+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [rcx+8+8*1],rax
	mov rax,rcx
	mov BYTE [rax+6],0
	mov QWORD [r10+8+8*0],rax
	mov rax,r13
	mov QWORD [r10+8+8*1],rax
	mov rax,r10
	mov BYTE [rax+6],1
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],4
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2548
LB_2550:
;; rsp=3 , %1757~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1755~1'(= r ) %1754~0'(= r ) %1752~9'(= a19◂ [ a9◂ [ ]{| l |}] ) %1751~8'(= a35◂ [ *{ }] ) 
; #129 { 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1769~2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1755~1'(= r ) %1754~0'(= r ) %1751~8'(= a35◂ [ *{ }] ) 
; #193 2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1770~0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1755~1'(= r ) %1754~0'(= r ) %1751~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1771~0(<2)◂0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1755~1'(= r ) %1754~0'(= r ) %1751~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂2(<7)◂{ 9'(= a19◂ [ a9◂ [ ]{| l |}] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2548
LB_2549:
;; ?. 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1756~2'(= a2◂ [ *{ rr{| l |}}] ) %1755~1'(= r ) %1754~0'(= r ) %1752~9'(= a19◂ [ a9◂ [ ]{| l |}] ) %1751~8'(= a35◂ [ *{ }] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1772~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1755~1'(= r ) %1754~0'(= r ) %1752~9'(= a19◂ [ a9◂ [ ]{| l |}] ) %1751~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1773~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1755~1'(= r ) %1754~0'(= r ) %1752~9'(= a19◂ [ a9◂ [ ]{| l |}] ) %1751~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2548
LB_2548:
	cmp BYTE [r8+6],0
	jnz LB_2516
	POP_GRM_SCC
	ret
LB_2516:
	RB_GRM
	jmp LB_2553
LB_2552:
	add r14,1 
LB_2553:
	cmp r14,r9
	jge LB_2554
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2552
LB_2554
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_2557
	jmp LB_2558
LB_2557:
	jmp LB_2555
LB_2558:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2556
LB_2555:
	add rsp,0
	jmp LB_2551
LB_2556:
	jmp LB_2560
LB_2559:
	add r14,1 
LB_2560:
	cmp r14,r9
	jge LB_2561
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2559
LB_2561
	call GRM_189
	cmp BYTE [r8+6],0
	jnz LB_2564
	jmp LB_2565
LB_2564:
	jmp LB_2562
LB_2565:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 9'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 9'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2563
LB_2562:
	add rsp,8
	jmp LB_2551
LB_2563:
	jmp LB_2567
LB_2566:
	add r14,1 
LB_2567:
	cmp r14,r9
	jge LB_2568
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2566
LB_2568
	call GRM_201
	cmp BYTE [r8+6],0
	jnz LB_2571
	jmp LB_2572
LB_2571:
	jmp LB_2569
LB_2572:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2570
LB_2569:
	add rsp,16
	jmp LB_2551
LB_2570:
	PUSH_GRM
	jmp LB_2576
LB_2575:
	add r14,1 
LB_2576:
	cmp r14,r9
	jge LB_2577
	JZ_SPC BYTE [r13+8+r14], LB_2575
LB_2577
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2580
	jmp LB_2581
LB_2580:
	mov r8,unt_1
	jmp LB_2578
LB_2581:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2582
	cmp BYTE [rdi+1],138
	jnz LB_2582
	cmp BYTE [rdi+2],162
	jnz LB_2582
	cmp BYTE [rdi+3],124
	jnz LB_2582
	jmp LB_2583
LB_2582:
	mov r8,unt_1
	jmp LB_2578
LB_2583:
	add r14,4
	jmp LB_2579
LB_2578:
	add rsp,0
	jmp LB_2574
LB_2579:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2584
LB_2584
;; rsp=0 , %1780~1'(= r ) %1779~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1781~1(<2)◂{ } %1780~1'(= r ) %1779~0'(= r ) 
; #193 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %1782~0(<2)◂1(<2)◂{ } %1780~1'(= r ) %1779~0'(= r ) 
; #22 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %1783~0(<2)◂0(<2)◂1(<2)◂{ } %1780~1'(= r ) %1779~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_2585
LB_2585:
	cmp BYTE [r8+6],0
	jnz LB_2574
	POP_GRM_SCC
	jmp LB_2573
LB_2574:
	RB_GRM
	jmp LB_2588
LB_2587:
	add r14,1 
LB_2588:
	cmp r14,r9
	jge LB_2589
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2587
LB_2589
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2592
	jmp LB_2593
LB_2592:
	mov r8,unt_1
	jmp LB_2590
LB_2593:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2594
	cmp BYTE [rdi+1],138
	jnz LB_2594
	cmp BYTE [rdi+2],162
	jnz LB_2594
	jmp LB_2595
LB_2594:
	mov r8,unt_1
	jmp LB_2590
LB_2595:
	add r14,3
	jmp LB_2591
LB_2590:
	add rsp,0
	jmp LB_2586
LB_2591:
	jmp LB_2597
LB_2596:
	add r14,1 
LB_2597:
	cmp r14,r9
	jge LB_2598
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2596
LB_2598
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_2601
	jmp LB_2602
LB_2601:
	jmp LB_2599
LB_2602:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2600
LB_2599:
	add rsp,0
	POP_GRM_FAIL
	jmp LB_2573
LB_2600:
	jmp LB_2604
LB_2603:
	add r14,1 
LB_2604:
	cmp r14,r9
	jge LB_2605
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2603
LB_2605
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2608
	jmp LB_2609
LB_2608:
	mov r8,unt_1
	jmp LB_2606
LB_2609:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2610
	jmp LB_2611
LB_2610:
	mov r8,unt_1
	jmp LB_2606
LB_2611:
	add r14,1
	jmp LB_2607
LB_2606:
	add rsp,8
	POP_GRM_FAIL
	jmp LB_2573
LB_2607:
	jmp LB_2613
LB_2612:
	add r14,1 
LB_2613:
	cmp r14,r9
	jge LB_2614
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2612
LB_2614
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_2617
	jmp LB_2618
LB_2617:
	jmp LB_2615
LB_2618:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2616
LB_2615:
	add rsp,8
	POP_GRM_FAIL
	jmp LB_2573
LB_2616:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_2619
LB_2619
;; rsp=2 , %1787~1'(= r ) %1786~0'(= r ) %1785~9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1784~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
;; ? 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2621
	mov r8,QWORD [rdi+8]
;; rsp=2 , %1789~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1787~1'(= r ) %1786~0'(= r ) %1784~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %1790~0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1787~1'(= r ) %1786~0'(= r ) 
; #193 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %1791~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1787~1'(= r ) %1786~0'(= r ) 
; #22 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %1792~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1787~1'(= r ) %1786~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_2620
LB_2621:
;; ?. 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=2 , %1788~2'(= a2◂ [ *{ rr{| l |}}] ) %1787~1'(= r ) %1786~0'(= r ) %1784~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %1793~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1787~1'(= r ) %1786~0'(= r ) %1784~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %1794~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1787~1'(= r ) %1786~0'(= r ) %1784~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_2620
LB_2620:
	cmp BYTE [r8+6],0
	jnz LB_2586
	POP_GRM_SCC
	jmp LB_2573
LB_2586:
	RB_GRM
	jmp LB_2624
LB_2623:
	add r14,1 
LB_2624:
	cmp r14,r9
	jge LB_2625
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2623
LB_2625
	call GRM_220
	cmp BYTE [r8+6],0
	jnz LB_2628
	jmp LB_2629
LB_2628:
	jmp LB_2626
LB_2629:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_2627
LB_2626:
	add rsp,0
	jmp LB_2622
LB_2627:
	jmp LB_2631
LB_2630:
	add r14,1 
LB_2631:
	cmp r14,r9
	jge LB_2632
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2630
LB_2632
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_2635
	jmp LB_2636
LB_2635:
	jmp LB_2633
LB_2636:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2634
LB_2633:
	add rsp,16
	jmp LB_2622
LB_2634:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2637
LB_2637
;; rsp=3 , %1799~1'(= r ) %1798~0'(= r ) %1797~10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1796~9'(= r ) %1795~8'(= r ) 
;; ? 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2639
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1801~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1799~1'(= r ) %1798~0'(= r ) %1796~9'(= r ) %1795~8'(= r ) 
	jmp LB_2640
LB_2640:
; $ %[ "lc_code 20" ] ⊢ %[ "lc_code 20" ]
;; rsp=3 , %1802~%[ "lc_code 20" ] %1801~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1799~1'(= r ) %1798~0'(= r ) %1796~9'(= r ) %1795~8'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %1803~1(<2)◂{ } %1802~%[ "lc_code 20" ] %1801~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1799~1'(= r ) %1798~0'(= r ) %1796~9'(= r ) %1795~8'(= r ) 
; #21 { { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %1804~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %1801~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1799~1'(= r ) %1798~0'(= r ) 
; #192 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %1805~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %1801~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1799~1'(= r ) %1798~0'(= r ) 
; #22 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
;; rsp=3 , %1806~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } %1801~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1799~1'(= r ) %1798~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 20" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 3
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*1],rax
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
	mov QWORD [r14+8+8*2],rax
	mov rax,r14
	mov QWORD [r13+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2638
LB_2639:
;; ?. 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1800~2'(= a2◂ [ *{ rr{| l |}}] ) %1799~1'(= r ) %1798~0'(= r ) %1796~9'(= r ) %1795~8'(= r ) 
	jmp LB_2641
LB_2641:
; $ %[ "lc_code 21" ] ⊢ %[ "lc_code 21" ]
;; rsp=3 , %1807~%[ "lc_code 21" ] %1800~2'(= a2◂ [ *{ rr{| l |}}] ) %1799~1'(= r ) %1798~0'(= r ) %1796~9'(= r ) %1795~8'(= r ) 
; #21 { { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %1808~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %1799~1'(= r ) %1798~0'(= r ) 
; #192 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %1809~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %1799~1'(= r ) %1798~0'(= r ) 
; #22 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %1810~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %1799~1'(= r ) %1798~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "lc_code 21" ] } 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	ALC_RCD 2
	mov r14,rax
	ALC_RCD 3
	mov r9,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r9+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r9+8+8*1],rax
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
	mov QWORD [r9+8+8*2],rax
	mov rax,r9
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2638
LB_2638:
	cmp BYTE [r8+6],0
	jnz LB_2622
	POP_GRM_SCC
	jmp LB_2573
LB_2622:
	POP_GRM_FAIL 
	jmp LB_2573
LB_2573:
	cmp BYTE [r8+6],0
	jnz LB_2642
	jmp LB_2643
LB_2642:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_2643:
	mov QWORD [rsp+8*3],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 3'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 3'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2644
LB_2644
;; rsp=3 , %1811~3'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] ) %1778~1'(= r ) %1777~0'(= r ) %1776~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1775~9'(= a9◂ [ ] ) %1774~8'(= a35◂ [ *{ }] ) 
;; ? 3'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2646
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1813~2'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1778~1'(= r ) %1777~0'(= r ) %1776~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1775~9'(= a9◂ [ ] ) %1774~8'(= a35◂ [ *{ }] ) 
;; ? 2'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a8◂ [ a13◂ [ {| l |}]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2647
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
;; rsp=3 , %1815~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %1814~3'(= a8◂ [ a13◂ [ {| l |}]] ) %1778~1'(= r ) %1777~0'(= r ) %1776~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1775~9'(= a9◂ [ ] ) %1774~8'(= a35◂ [ *{ }] ) 
; #122 { 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } ⊢ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) }
;; rsp=3 , %1816~0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } %1815~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %1778~1'(= r ) %1777~0'(= r ) %1774~8'(= a35◂ [ *{ }] ) 
; #129 { 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2(<7)◂{ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1817~2(<7)◂{ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1778~1'(= r ) %1777~0'(= r ) %1774~8'(= a35◂ [ *{ }] ) 
; #193 2(<7)◂{ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1818~0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1778~1'(= r ) %1777~0'(= r ) %1774~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1819~0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1778~1'(= r ) %1777~0'(= r ) %1774~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂2(<7)◂{ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a8◂ [ a13◂ [ {| l |}]] ) } 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 3
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r14+8+8*1],rax
	mov rax,r9
	mov QWORD [r14+8+8*2],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov QWORD [r13+8+8*0],rax
	mov rax,r10
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2645
LB_2647:
;; ?. 2'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂{ }
;; rsp=3 , %1778~1'(= r ) %1777~0'(= r ) %1776~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1775~9'(= a9◂ [ ] ) %1774~8'(= a35◂ [ *{ }] ) 
; #131 { 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %1820~0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1778~1'(= r ) %1777~0'(= r ) %1774~8'(= a35◂ [ *{ }] ) 
; #193 0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %1821~0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1778~1'(= r ) %1777~0'(= r ) %1774~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %1822~0(<2)◂0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } %1778~1'(= r ) %1777~0'(= r ) %1774~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<7)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2645
LB_2646:
;; ?. 3'(= a35◂ [ a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1812~2'(= a2◂ [ *{ rr{| l |}}] ) %1778~1'(= r ) %1777~0'(= r ) %1776~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1775~9'(= a9◂ [ ] ) %1774~8'(= a35◂ [ *{ }] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1823~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1778~1'(= r ) %1777~0'(= r ) %1776~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1775~9'(= a9◂ [ ] ) %1774~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1824~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1778~1'(= r ) %1777~0'(= r ) %1776~10'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1775~9'(= a9◂ [ ] ) %1774~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2645
LB_2645:
	cmp BYTE [r8+6],0
	jnz LB_2551
	POP_GRM_SCC
	ret
LB_2551:
	RB_GRM
	jmp LB_2650
LB_2649:
	add r14,1 
LB_2650:
	cmp r14,r9
	jge LB_2651
	JZ_SPC BYTE [r13+8+r14], LB_2649
LB_2651
	call GRM_236
	cmp BYTE [r8+6],0
	jnz LB_2654
	jmp LB_2655
LB_2654:
	jmp LB_2652
LB_2655:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 8'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
; .mov_ptn 2'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 8'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2653
LB_2652:
	add rsp,0
	jmp LB_2648
LB_2653:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2656
LB_2656
;; rsp=1 , %1827~1'(= r ) %1826~0'(= r ) %1825~8'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) 
;; ? 8'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2658
	mov r8,QWORD [rdi+8]
;; rsp=1 , %1829~2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1827~1'(= r ) %1826~0'(= r ) 
; #128 2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 3(<7)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
;; rsp=1 , %1830~3(<7)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1827~1'(= r ) %1826~0'(= r ) 
; #193 3(<7)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂3(<7)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
;; rsp=1 , %1831~0(<2)◂3(<7)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1827~1'(= r ) %1826~0'(= r ) 
; #22 0(<2)◂3(<7)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂3(<7)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
;; rsp=1 , %1832~0(<2)◂0(<2)◂3(<7)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1827~1'(= r ) %1826~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂3(<7)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
; .mov_ptn2 0(<2)◂0(<2)◂3(<7)◂2'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂3(<7)◂0'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2657
LB_2658:
;; ?. 8'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=1 , %1828~2'(= a2◂ [ *{ rr{| l |}}] ) %1827~1'(= r ) %1826~0'(= r ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1833~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1827~1'(= r ) %1826~0'(= r ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1834~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1827~1'(= r ) %1826~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2657
LB_2657:
	cmp BYTE [r8+6],0
	jnz LB_2648
	POP_GRM_SCC
	ret
LB_2648:
	RB_GRM
	jmp LB_2661
LB_2660:
	add r14,1 
LB_2661:
	cmp r14,r9
	jge LB_2662
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2660
LB_2662
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_2665
	jmp LB_2666
LB_2665:
	jmp LB_2663
LB_2666:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2664
LB_2663:
	add rsp,0
	jmp LB_2659
LB_2664:
	jmp LB_2668
LB_2667:
	add r14,1 
LB_2668:
	cmp r14,r9
	jge LB_2669
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2667
LB_2669
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2672
	jmp LB_2673
LB_2672:
	mov r8,unt_1
	jmp LB_2670
LB_2673:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],36
	jnz LB_2674
	jmp LB_2675
LB_2674:
	mov r8,unt_1
	jmp LB_2670
LB_2675:
	add r14,1
	jmp LB_2671
LB_2670:
	add rsp,8
	jmp LB_2659
LB_2671:
	PUSH_GRM
	jmp LB_2679
LB_2678:
	add r14,1 
LB_2679:
	cmp r14,r9
	jge LB_2680
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2678
LB_2680
	call GRM_201
	cmp BYTE [r8+6],0
	jnz LB_2683
	jmp LB_2684
LB_2683:
	jmp LB_2681
LB_2684:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2682
LB_2681:
	add rsp,0
	jmp LB_2677
LB_2682:
	jmp LB_2686
LB_2685:
	add r14,1 
LB_2686:
	cmp r14,r9
	jge LB_2687
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2685
LB_2687
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2690
	jmp LB_2691
LB_2690:
	mov r8,unt_1
	jmp LB_2688
LB_2691:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2692
	cmp BYTE [rdi+1],138
	jnz LB_2692
	cmp BYTE [rdi+2],162
	jnz LB_2692
	jmp LB_2693
LB_2692:
	mov r8,unt_1
	jmp LB_2688
LB_2693:
	add r14,3
	jmp LB_2689
LB_2688:
	add rsp,8
	jmp LB_2677
LB_2689:
	PUSH_GRM
	jmp LB_2697
LB_2696:
	add r14,1 
LB_2697:
	cmp r14,r9
	jge LB_2698
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2696
LB_2698
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_2701
	jmp LB_2702
LB_2701:
	mov r8,unt_1
	jmp LB_2699
LB_2702:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2703
	jmp LB_2704
LB_2703:
	mov r8,unt_1
	jmp LB_2699
LB_2704:
	add r14,1
	jmp LB_2700
LB_2699:
	add rsp,0
	jmp LB_2695
LB_2700:
	jmp LB_2706
LB_2705:
	add r14,1 
LB_2706:
	cmp r14,r9
	jge LB_2707
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2705
LB_2707
	call GRM_237
	cmp BYTE [r8+6],0
	jnz LB_2710
	jmp LB_2711
LB_2710:
	jmp LB_2708
LB_2711:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 8'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
; .mov_ptn 2'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 8'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2709
LB_2708:
	add rsp,0
	jmp LB_2695
LB_2709:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2712
LB_2712
;; rsp=1 , %1843~1'(= r ) %1842~0'(= r ) %1841~8'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) 
;; ? 8'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2714
	mov r8,QWORD [rdi+8]
;; rsp=1 , %1845~2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1843~1'(= r ) %1842~0'(= r ) 
; #124 2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
;; rsp=1 , %1846~0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1843~1'(= r ) %1842~0'(= r ) 
; #193 0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
;; rsp=1 , %1847~0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1843~1'(= r ) %1842~0'(= r ) 
; #22 0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
;; rsp=1 , %1848~0(<2)◂0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1843~1'(= r ) %1842~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂0'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2713
LB_2714:
;; ?. 8'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=1 , %1844~2'(= a2◂ [ *{ rr{| l |}}] ) %1843~1'(= r ) %1842~0'(= r ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1849~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1843~1'(= r ) %1842~0'(= r ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1850~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1843~1'(= r ) %1842~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2713
LB_2713:
	cmp BYTE [r8+6],0
	jnz LB_2695
	POP_GRM_SCC
	jmp LB_2694
LB_2695:
	RB_GRM
	jmp LB_2717
LB_2716:
	add r14,1 
LB_2717:
	cmp r14,r9
	jge LB_2718
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2716
LB_2718
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_2721
	jmp LB_2722
LB_2721:
	jmp LB_2719
LB_2722:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2720
LB_2719:
	add rsp,0
	jmp LB_2715
LB_2720:
	jmp LB_2724
LB_2723:
	add r14,1 
LB_2724:
	cmp r14,r9
	jge LB_2725
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2723
LB_2725
	call GRM_207
	cmp BYTE [r8+6],0
	jnz LB_2728
	jmp LB_2729
LB_2728:
	jmp LB_2726
LB_2729:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2727
LB_2726:
	add rsp,8
	jmp LB_2715
LB_2727:
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
	jg LB_2735
	jmp LB_2736
LB_2735:
	mov r8,unt_1
	jmp LB_2733
LB_2736:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_2737
	jmp LB_2738
LB_2737:
	mov r8,unt_1
	jmp LB_2733
LB_2738:
	add r14,1
	jmp LB_2734
LB_2733:
	add rsp,16
	jmp LB_2715
LB_2734:
	jmp LB_2740
LB_2739:
	add r14,1 
LB_2740:
	cmp r14,r9
	jge LB_2741
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2739
LB_2741
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_2744
	jmp LB_2745
LB_2744:
	jmp LB_2742
LB_2745:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2743
LB_2742:
	add rsp,16
	jmp LB_2715
LB_2743:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2746
LB_2746
;; rsp=3 , %1855~1'(= r ) %1854~0'(= r ) %1853~10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1852~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1851~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
;; ? 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2748
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1857~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1855~1'(= r ) %1854~0'(= r ) %1852~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1851~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #21 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
;; rsp=3 , %1858~0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } %1857~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1855~1'(= r ) %1854~0'(= r ) 
; #123 { 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1859~1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1855~1'(= r ) %1854~0'(= r ) 
; #193 1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1860~0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1855~1'(= r ) %1854~0'(= r ) 
; #22 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1861~0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1855~1'(= r ) %1854~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r14,rax
	ALC_RCD 2
	mov r9,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r9+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2747
LB_2748:
;; ?. 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1856~2'(= a2◂ [ *{ rr{| l |}}] ) %1855~1'(= r ) %1854~0'(= r ) %1852~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1851~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1862~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1855~1'(= r ) %1854~0'(= r ) %1852~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1851~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1863~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1855~1'(= r ) %1854~0'(= r ) %1852~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1851~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2747
LB_2747:
	cmp BYTE [r8+6],0
	jnz LB_2715
	POP_GRM_SCC
	jmp LB_2694
LB_2715:
	POP_GRM_FAIL 
	jmp LB_2694
LB_2694:
	cmp BYTE [r8+6],0
	jnz LB_2749
	jmp LB_2750
LB_2749:
	add rsp,8
	POP_GRM_FAIL
	jmp LB_2676
LB_2750:
	mov QWORD [rsp+8*1],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) ⊢ 3'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) ⊢ 3'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2751
LB_2751
;; rsp=1 , %1864~3'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) %1840~1'(= r ) %1839~0'(= r ) %1838~8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; #193 { 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=1 , %1865~0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) } %1840~1'(= r ) %1839~0'(= r ) 
; #22 0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=1 , %1866~0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) } %1840~1'(= r ) %1839~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*0],rax
	mov rax,r9
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2752
LB_2752:
	cmp BYTE [r8+6],0
	jnz LB_2677
	POP_GRM_SCC
	jmp LB_2676
LB_2677:
	RB_GRM
	jmp LB_2755
LB_2754:
	add r14,1 
LB_2755:
	cmp r14,r9
	jge LB_2756
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2754
LB_2756
	call GRM_220
	cmp BYTE [r8+6],0
	jnz LB_2759
	jmp LB_2760
LB_2759:
	jmp LB_2757
LB_2760:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_2758
LB_2757:
	add rsp,0
	jmp LB_2753
LB_2758:
	jmp LB_2762
LB_2761:
	add r14,1 
LB_2762:
	cmp r14,r9
	jge LB_2763
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2761
LB_2763
	call GRM_237
	cmp BYTE [r8+6],0
	jnz LB_2766
	jmp LB_2767
LB_2766:
	jmp LB_2764
LB_2767:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 10'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
; .mov_ptn 2'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 10'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2765
LB_2764:
	add rsp,16
	jmp LB_2753
LB_2765:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2768
LB_2768
;; rsp=3 , %1871~1'(= r ) %1870~0'(= r ) %1869~10'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) %1868~9'(= r ) %1867~8'(= r ) 
;; ? 10'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2770
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1873~2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1871~1'(= r ) %1870~0'(= r ) %1868~9'(= r ) %1867~8'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %1874~1(<2)◂{ } %1873~2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1871~1'(= r ) %1870~0'(= r ) %1868~9'(= r ) %1867~8'(= r ) 
	jmp LB_2771
LB_2771:
; $ %[ "glb_etr id_line line_res 0" ] ⊢ %[ "glb_etr id_line line_res 0" ]
;; rsp=3 , %1875~%[ "glb_etr id_line line_res 0" ] %1874~1(<2)◂{ } %1873~2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1871~1'(= r ) %1870~0'(= r ) %1868~9'(= r ) %1867~8'(= r ) 
; #21 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
;; rsp=3 , %1876~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } %1873~2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1871~1'(= r ) %1870~0'(= r ) 
; #192 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
;; rsp=3 , %1877~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } %1873~2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1871~1'(= r ) %1870~0'(= r ) 
; #22 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
;; rsp=3 , %1878~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } %1873~2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1871~1'(= r ) %1870~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 3
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*1],rax
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
	mov QWORD [r14+8+8*2],rax
	mov rax,r14
	mov QWORD [r13+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2769
LB_2770:
;; ?. 10'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1872~2'(= a2◂ [ *{ rr{| l |}}] ) %1871~1'(= r ) %1870~0'(= r ) %1868~9'(= r ) %1867~8'(= r ) 
	jmp LB_2772
LB_2772:
; $ %[ "glb_etr id_line line_res 1" ] ⊢ %[ "glb_etr id_line line_res 1" ]
;; rsp=3 , %1879~%[ "glb_etr id_line line_res 1" ] %1872~2'(= a2◂ [ *{ rr{| l |}}] ) %1871~1'(= r ) %1870~0'(= r ) %1868~9'(= r ) %1867~8'(= r ) 
; #21 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %1880~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %1871~1'(= r ) %1870~0'(= r ) 
; #192 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %1881~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %1871~1'(= r ) %1870~0'(= r ) 
; #22 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %1882~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %1871~1'(= r ) %1870~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 1" ] } 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}]] )
	ALC_RCD 2
	mov r14,rax
	ALC_RCD 3
	mov r9,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r9+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r9+8+8*1],rax
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
	mov QWORD [r9+8+8*2],rax
	mov rax,r9
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2769
LB_2769:
	cmp BYTE [r8+6],0
	jnz LB_2753
	POP_GRM_SCC
	jmp LB_2676
LB_2753:
	RB_GRM
	jmp LB_2775
LB_2774:
	add r14,1 
LB_2775:
	cmp r14,r9
	jge LB_2776
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2774
LB_2776
	call GRM_220
	cmp BYTE [r8+6],0
	jnz LB_2779
	jmp LB_2780
LB_2779:
	jmp LB_2777
LB_2780:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_2778
LB_2777:
	add rsp,0
	jmp LB_2773
LB_2778:
	jmp LB_2782
LB_2781:
	add r14,1 
LB_2782:
	cmp r14,r9
	jge LB_2783
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2781
LB_2783
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_2786
	jmp LB_2787
LB_2786:
	jmp LB_2784
LB_2787:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2785
LB_2784:
	add rsp,16
	jmp LB_2773
LB_2785:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2788
LB_2788
;; rsp=3 , %1887~1'(= r ) %1886~0'(= r ) %1885~10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1884~9'(= r ) %1883~8'(= r ) 
;; ? 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2790
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1889~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1887~1'(= r ) %1886~0'(= r ) %1884~9'(= r ) %1883~8'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=3 , %1890~1(<2)◂{ } %1889~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1887~1'(= r ) %1886~0'(= r ) %1884~9'(= r ) %1883~8'(= r ) 
	jmp LB_2791
LB_2791:
; $ %[ "glb_etr id_line line_res 2" ] ⊢ %[ "glb_etr id_line line_res 2" ]
;; rsp=3 , %1891~%[ "glb_etr id_line line_res 2" ] %1890~1(<2)◂{ } %1889~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1887~1'(= r ) %1886~0'(= r ) %1884~9'(= r ) %1883~8'(= r ) 
; #21 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
;; rsp=3 , %1892~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } %1889~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1887~1'(= r ) %1886~0'(= r ) 
; #192 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
;; rsp=3 , %1893~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } %1889~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1887~1'(= r ) %1886~0'(= r ) 
; #22 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
;; rsp=3 , %1894~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } %1889~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1887~1'(= r ) %1886~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 2" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 3
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*1],rax
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
	mov QWORD [r14+8+8*2],rax
	mov rax,r14
	mov QWORD [r13+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2789
LB_2790:
;; ?. 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1888~2'(= a2◂ [ *{ rr{| l |}}] ) %1887~1'(= r ) %1886~0'(= r ) %1884~9'(= r ) %1883~8'(= r ) 
	jmp LB_2792
LB_2792:
; $ %[ "glb_etr id_line line_res 3" ] ⊢ %[ "glb_etr id_line line_res 3" ]
;; rsp=3 , %1895~%[ "glb_etr id_line line_res 3" ] %1888~2'(= a2◂ [ *{ rr{| l |}}] ) %1887~1'(= r ) %1886~0'(= r ) %1884~9'(= r ) %1883~8'(= r ) 
; #21 { { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %1896~0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %1887~1'(= r ) %1886~0'(= r ) 
; #192 0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %1897~1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %1887~1'(= r ) %1886~0'(= r ) 
; #22 1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=3 , %1898~0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %1887~1'(= r ) %1886~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 8'(= r ) 9'(= r ) %[ "glb_etr id_line line_res 3" ] } 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}]] )
	ALC_RCD 2
	mov r14,rax
	ALC_RCD 3
	mov r9,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r9+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r9+8+8*1],rax
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
	mov QWORD [r9+8+8*2],rax
	mov rax,r9
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2789
LB_2789:
	cmp BYTE [r8+6],0
	jnz LB_2773
	POP_GRM_SCC
	jmp LB_2676
LB_2773:
	POP_GRM_FAIL 
	jmp LB_2676
LB_2676:
	cmp BYTE [r8+6],0
	jnz LB_2793
	jmp LB_2794
LB_2793:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2794:
	mov QWORD [rsp+8*1],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}] ) ⊢ 3'(= a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}] ) ⊢ 3'(= a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2795
LB_2795
;; rsp=1 , %1899~3'(= a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}] ) %1837~1'(= r ) %1836~0'(= r ) %1835~8'(= a35◂ [ *{ }] ) 
;; ? 3'(= a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}] ) ⊢ 0(<2)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 4'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) }
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2797
	mov r8, QWORD [r9+8]
	mov r10, QWORD [r9+16]
;; rsp=1 , %1902~4'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) %1901~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1837~1'(= r ) %1836~0'(= r ) %1835~8'(= a35◂ [ *{ }] ) 
;; ? 4'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a18◂ [ a9◂ [ ]{| l |}] )
	mov rdi,r10
	cmp BYTE [rdi+6],0
	jnz LB_2798
	mov r9,QWORD [rdi+8]
;; rsp=1 , %1904~3'(= a18◂ [ a9◂ [ ]{| l |}] ) %1901~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1837~1'(= r ) %1836~0'(= r ) %1835~8'(= a35◂ [ *{ }] ) 
; #127 { 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) } ⊢ 4(<7)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=1 , %1905~4(<7)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) } %1837~1'(= r ) %1836~0'(= r ) %1835~8'(= a35◂ [ *{ }] ) 
; #193 4(<7)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂4(<7)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=1 , %1906~0(<2)◂4(<7)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) } %1837~1'(= r ) %1836~0'(= r ) %1835~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂4(<7)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂4(<7)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=1 , %1907~0(<2)◂0(<2)◂4(<7)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) } %1837~1'(= r ) %1836~0'(= r ) %1835~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂4(<7)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂4(<7)◂{ 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂4(<7)◂{ 0'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 3'(= a18◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r14,rax
	mov rax,r13
	mov QWORD [r14+8+8*0],rax
	mov rax,r9
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],4
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2796
LB_2798:
;; ?. 4'(= a35◂ [ a18◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=1 , %1903~3'(= a2◂ [ *{ rr{| l |}}] ) %1901~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1837~1'(= r ) %1836~0'(= r ) %1835~8'(= a35◂ [ *{ }] ) 
; #192 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1908~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1901~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1837~1'(= r ) %1836~0'(= r ) %1835~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1909~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1901~2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) %1837~1'(= r ) %1836~0'(= r ) %1835~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2796
LB_2797:
;; ?. 3'(= a35◂ [ *{ a8◂ [ a12◂ [ a9◂ [ ]{| l |}]]a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=1 , %1900~2'(= a2◂ [ *{ rr{| l |}}] ) %1837~1'(= r ) %1836~0'(= r ) %1835~8'(= a35◂ [ *{ }] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1910~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1837~1'(= r ) %1836~0'(= r ) %1835~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1911~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1837~1'(= r ) %1836~0'(= r ) %1835~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2796
LB_2796:
	cmp BYTE [r8+6],0
	jnz LB_2659
	POP_GRM_SCC
	ret
LB_2659:
	RB_GRM
	jmp LB_2801
LB_2800:
	add r14,1 
LB_2801:
	cmp r14,r9
	jge LB_2802
	JZ_SPC BYTE [r13+8+r14], LB_2800
LB_2802
	call GRM_225
	cmp BYTE [r8+6],0
	jnz LB_2805
	jmp LB_2806
LB_2805:
	jmp LB_2803
LB_2806:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_2804
LB_2803:
	add rsp,0
	jmp LB_2799
LB_2804:
	PUSH_GRM
	jmp LB_2810
LB_2809:
	add r14,1 
LB_2810:
	cmp r14,r9
	jge LB_2811
	JZ_SPC BYTE [r13+8+r14], LB_2809
LB_2811
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_2814
	jmp LB_2815
LB_2814:
	jmp LB_2812
LB_2815:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2813
LB_2812:
	add rsp,0
	jmp LB_2808
LB_2813:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2816
LB_2816
;; rsp=1 , %1917~1'(= r ) %1916~0'(= r ) %1915~8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) 
; #22 8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
;; rsp=1 , %1918~0(<2)◂8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1917~1'(= r ) %1916~0'(= r ) 
; ∎ 0(<2)◂8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn2 0(<2)◂8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2817
LB_2817:
	cmp BYTE [r8+6],0
	jnz LB_2808
	POP_GRM_SCC
	jmp LB_2807
LB_2808:
	RB_GRM
	jmp LB_2820
LB_2819:
	add r14,1 
LB_2820:
	cmp r14,r9
	jge LB_2821
	JZ_SPC BYTE [r13+8+r14], LB_2819
LB_2821
	call GRM_224
	cmp BYTE [r8+6],0
	jnz LB_2824
	jmp LB_2825
LB_2824:
	jmp LB_2822
LB_2825:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_2823
LB_2822:
	add rsp,0
	jmp LB_2818
LB_2823:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2826
LB_2826
;; rsp=0 , %1921~1'(= r ) %1920~0'(= r ) %1919~{ } 
	jmp LB_2828
LB_2828:
; $ %[ "lc_code 11" ] ⊢ %[ "lc_code 11" ]
;; rsp=0 , %1922~%[ "lc_code 11" ] %1921~1'(= r ) %1920~0'(= r ) %1919~{ } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %1923~1(<2)◂{ } %1922~%[ "lc_code 11" ] %1921~1'(= r ) %1920~0'(= r ) %1919~{ } 
; #21 { { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
;; rsp=0 , %1924~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } %1919~{ } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
;; rsp=0 , %1925~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } %1919~{ } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
;; rsp=0 , %1926~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } %1919~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 11" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r9,rax
	ALC_RCD 3
	mov r10,rax
	mov rax,r13
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
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
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_2827
LB_2827:
	cmp BYTE [r8+6],0
	jnz LB_2818
	POP_GRM_SCC
	jmp LB_2807
LB_2818:
	POP_GRM_FAIL 
	jmp LB_2807
LB_2807:
	cmp BYTE [r8+6],0
	jnz LB_2829
	jmp LB_2830
LB_2829:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_2830:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_2831
LB_2831
;; rsp=0 , %1927~3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1914~1'(= r ) %1913~0'(= r ) %1912~{ } 
;; ? 3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_2833
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1929~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1914~1'(= r ) %1913~0'(= r ) %1912~{ } 
	jmp LB_2834
LB_2834:
; $ %[ "lc_code 9" ] ⊢ %[ "lc_code 9" ]
;; rsp=0 , %1930~%[ "lc_code 9" ] %1929~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1914~1'(= r ) %1913~0'(= r ) %1912~{ } 
; #195 { 0'(= r ) 1'(= r ) %[ "lc_code 9" ] } ⊢ 0'(= a35◂ [ q0] )
	sub rsp,8
	mov QWORD [rsp+8*0],r8
; .mov_ptn2 { 0'(= r ) 1'(= r ) %[ "lc_code 9" ] } ⊢ { 0'(= r ) 1'(= r ) 2'(= {| l |} ) }
; .mov_ptn %[ "lc_code 9" ] ⊢ 2'(= {| l |} )
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
	call ETR_195
	mov r8,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %1931~0'(= a35◂ [ q0] ) %1929~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1912~{ } 
; #22 0'(= a35◂ [ q0] ) ⊢ 0(<2)◂0'(= a35◂ [ q0] )
;; rsp=0 , %1932~0(<2)◂0'(= a35◂ [ q0] ) %1929~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1912~{ } 
; ∎ 0(<2)◂0'(= a35◂ [ q0] )
; .mov_ptn2 0(<2)◂0'(= a35◂ [ q0] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0'(= a35◂ [ q0] ) ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_2832
LB_2833:
;; ?. 3'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1928~2'(= a2◂ [ *{ rr{| l |}}] ) %1914~1'(= r ) %1913~0'(= r ) %1912~{ } 
	jmp LB_2835
LB_2835:
; $ %[ "lc_code 10" ] ⊢ %[ "lc_code 10" ]
;; rsp=0 , %1933~%[ "lc_code 10" ] %1928~2'(= a2◂ [ *{ rr{| l |}}] ) %1914~1'(= r ) %1913~0'(= r ) %1912~{ } 
; #21 { { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %1934~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %1912~{ } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %1935~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %1912~{ } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
;; rsp=0 , %1936~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } %1912~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 2'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	mov r9,r8
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "lc_code 10" ] } 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r10,rax
	ALC_RCD 3
	mov r11,rax
	mov rax,r13
	mov QWORD [r11+8+8*0],rax
	mov rax,r14
	mov QWORD [r11+8+8*1],rax
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
	mov QWORD [r11+8+8*2],rax
	mov rax,r11
	mov QWORD [r10+8+8*0],rax
	mov rax,r9
	mov QWORD [r10+8+8*1],rax
	mov rax,r10
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_2832
LB_2832:
	cmp BYTE [r8+6],0
	jnz LB_2799
	POP_GRM_SCC
	ret
LB_2799:
	POP_GRM_FAIL 
	ret
ETR_235:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_235
	ret
GRM_235:
	PUSH_GRM
	jmp LB_2838
LB_2837:
	add r14,1 
LB_2838:
	cmp r14,r9
	jge LB_2839
	JZ_SPC BYTE [r13+8+r14], LB_2837
LB_2839
	call GRM_237
	cmp BYTE [r8+6],0
	jnz LB_2842
	jmp LB_2843
LB_2842:
	jmp LB_2840
LB_2843:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 8'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
; .mov_ptn 2'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 8'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2841
LB_2840:
	add rsp,0
	jmp LB_2836
LB_2841:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_2844
LB_2844
;; rsp=1 , %1939~1'(= r ) %1938~0'(= r ) %1937~8'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) 
;; ? 8'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2846
	mov r8,QWORD [rdi+8]
;; rsp=1 , %1941~2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1939~1'(= r ) %1938~0'(= r ) 
; #124 2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
;; rsp=1 , %1942~0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1939~1'(= r ) %1938~0'(= r ) 
; #193 0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
;; rsp=1 , %1943~0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1939~1'(= r ) %1938~0'(= r ) 
; #22 0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
;; rsp=1 , %1944~0(<2)◂0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1939~1'(= r ) %1938~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] )
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂2'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂0'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2845
LB_2846:
;; ?. 8'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=1 , %1940~2'(= a2◂ [ *{ rr{| l |}}] ) %1939~1'(= r ) %1938~0'(= r ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1945~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1939~1'(= r ) %1938~0'(= r ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1946~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1939~1'(= r ) %1938~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2845
LB_2845:
	cmp BYTE [r8+6],0
	jnz LB_2836
	POP_GRM_SCC
	ret
LB_2836:
	RB_GRM
	jmp LB_2849
LB_2848:
	add r14,1 
LB_2849:
	cmp r14,r9
	jge LB_2850
	JZ_SPC BYTE [r13+8+r14], LB_2848
LB_2850
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_2853
	jmp LB_2854
LB_2853:
	jmp LB_2851
LB_2854:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2852
LB_2851:
	add rsp,0
	jmp LB_2847
LB_2852:
	jmp LB_2856
LB_2855:
	add r14,1 
LB_2856:
	cmp r14,r9
	jge LB_2857
	JZ_SPC BYTE [r13+8+r14], LB_2855
LB_2857
	call GRM_207
	cmp BYTE [r8+6],0
	jnz LB_2860
	jmp LB_2861
LB_2860:
	jmp LB_2858
LB_2861:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
; .mov_ptn 2'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2859
LB_2858:
	add rsp,8
	jmp LB_2847
LB_2859:
	jmp LB_2863
LB_2862:
	add r14,1 
LB_2863:
	cmp r14,r9
	jge LB_2864
	JZ_SPC BYTE [r13+8+r14], LB_2862
LB_2864
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_2867
	jmp LB_2868
LB_2867:
	jmp LB_2865
LB_2868:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2866
LB_2865:
	add rsp,16
	jmp LB_2847
LB_2866:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2869
LB_2869
;; rsp=3 , %1951~1'(= r ) %1950~0'(= r ) %1949~10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1948~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1947~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
;; ? 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_2871
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1953~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1951~1'(= r ) %1950~0'(= r ) %1948~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1947~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #21 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } ⊢ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
;; rsp=3 , %1954~0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } %1953~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %1951~1'(= r ) %1950~0'(= r ) 
; #123 { 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1955~1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1951~1'(= r ) %1950~0'(= r ) 
; #193 1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1956~0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1951~1'(= r ) %1950~0'(= r ) 
; #22 0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %1957~0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1951~1'(= r ) %1950~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) } 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r14,rax
	ALC_RCD 2
	mov r9,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r9+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2870
LB_2871:
;; ?. 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=3 , %1952~2'(= a2◂ [ *{ rr{| l |}}] ) %1951~1'(= r ) %1950~0'(= r ) %1948~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1947~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1958~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1951~1'(= r ) %1950~0'(= r ) %1948~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1947~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %1959~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1951~1'(= r ) %1950~0'(= r ) %1948~9'(= a2◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %1947~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a18◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_2870
LB_2870:
	cmp BYTE [r8+6],0
	jnz LB_2847
	POP_GRM_SCC
	ret
LB_2847:
	POP_GRM_FAIL 
	ret
ETR_236:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_236
	ret
GRM_236:
	PUSH_GRM
	jmp LB_2874
LB_2873:
	add r14,1 
LB_2874:
	cmp r14,r9
	jge LB_2875
	JZ_SPC BYTE [r13+8+r14], LB_2873
LB_2875
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_2878
	jmp LB_2879
LB_2878:
	jmp LB_2876
LB_2879:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2877
LB_2876:
	add rsp,0
	jmp LB_2872
LB_2877:
	jmp LB_2881
LB_2880:
	add r14,1 
LB_2881:
	cmp r14,r9
	jge LB_2882
	JZ_SPC BYTE [r13+8+r14], LB_2880
LB_2882
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2885
	jmp LB_2886
LB_2885:
	mov r8,unt_1
	jmp LB_2883
LB_2886:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2887
	cmp BYTE [rdi+1],136
	jnz LB_2887
	cmp BYTE [rdi+2],144
	jnz LB_2887
	cmp BYTE [rdi+3],46
	jnz LB_2887
	jmp LB_2888
LB_2887:
	mov r8,unt_1
	jmp LB_2883
LB_2888:
	add r14,4
	jmp LB_2884
LB_2883:
	add rsp,8
	jmp LB_2872
LB_2884:
	jmp LB_2890
LB_2889:
	add r14,1 
LB_2890:
	cmp r14,r9
	jge LB_2891
	JZ_SPC BYTE [r13+8+r14], LB_2889
LB_2891
	call GRM_238
	cmp BYTE [r8+6],0
	jnz LB_2894
	jmp LB_2895
LB_2894:
	jmp LB_2892
LB_2895:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 9'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 9'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2893
LB_2892:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2893:
	jmp LB_2897
LB_2896:
	add r14,1 
LB_2897:
	cmp r14,r9
	jge LB_2898
	JZ_SPC BYTE [r13+8+r14], LB_2896
LB_2898
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_2901
	jmp LB_2902
LB_2901:
	jmp LB_2899
LB_2902:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2900
LB_2899:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_2900:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_2903
LB_2903
;; rsp=3 , %1964~1'(= r ) %1963~0'(= r ) %1962~10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1961~9'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) %1960~8'(= a35◂ [ *{ }] ) 
; #194 { 9'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 9'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) } ⊢ { 0'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 9'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call LB_2905
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=1 , %1965~2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1964~1'(= r ) %1963~0'(= r ) %1960~8'(= a35◂ [ *{ }] ) 
;; ? 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2909
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
;; rsp=1 , %1968~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %1967~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %1964~1'(= r ) %1963~0'(= r ) %1960~8'(= a35◂ [ *{ }] ) 
; #116 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %1969~2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) %1967~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %1964~1'(= r ) %1963~0'(= r ) %1960~8'(= a35◂ [ *{ }] ) 
; #49 { 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=1 , %1970~1(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1964~1'(= r ) %1963~0'(= r ) %1960~8'(= a35◂ [ *{ }] ) 
; #193 1(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=1 , %1971~0(<2)◂1(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1964~1'(= r ) %1963~0'(= r ) %1960~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂1(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=1 , %1972~0(<2)◂0(<2)◂1(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1964~1'(= r ) %1963~0'(= r ) %1960~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,r9
	mov QWORD [r13+8+8*0],rax
	mov rax,r10
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],2
	mov QWORD [rax+8],rdi
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2904
LB_2909:
;; ?. 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=1 , %1966~3'(= a2◂ [ *{ rr{| l |}}] ) %1964~1'(= r ) %1963~0'(= r ) %1960~8'(= a35◂ [ *{ }] ) 
; #192 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1973~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1964~1'(= r ) %1963~0'(= r ) %1960~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1974~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1964~1'(= r ) %1963~0'(= r ) %1960~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2904
LB_2904:
	cmp BYTE [r8+6],0
	jnz LB_2872
	POP_GRM_SCC
	ret
LB_2872:
	RB_GRM
	jmp LB_2912
LB_2911:
	add r14,1 
LB_2912:
	cmp r14,r9
	jge LB_2913
	JZ_SPC BYTE [r13+8+r14], LB_2911
LB_2913
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_2916
	jmp LB_2917
LB_2916:
	jmp LB_2914
LB_2917:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2915
LB_2914:
	add rsp,0
	jmp LB_2910
LB_2915:
	jmp LB_2919
LB_2918:
	add r14,1 
LB_2919:
	cmp r14,r9
	jge LB_2920
	JZ_SPC BYTE [r13+8+r14], LB_2918
LB_2920
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_2923
	jmp LB_2924
LB_2923:
	mov r8,unt_1
	jmp LB_2921
LB_2924:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2925
	cmp BYTE [rdi+1],136
	jnz LB_2925
	cmp BYTE [rdi+2],144
	jnz LB_2925
	jmp LB_2926
LB_2925:
	mov r8,unt_1
	jmp LB_2921
LB_2926:
	add r14,3
	jmp LB_2922
LB_2921:
	add rsp,8
	jmp LB_2910
LB_2922:
	jmp LB_2928
LB_2927:
	add r14,1 
LB_2928:
	cmp r14,r9
	jge LB_2929
	JZ_SPC BYTE [r13+8+r14], LB_2927
LB_2929
	call GRM_238
	cmp BYTE [r8+6],0
	jnz LB_2932
	jmp LB_2933
LB_2932:
	jmp LB_2930
LB_2933:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 9'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 9'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2931
LB_2930:
	add rsp,8
	jmp LB_2910
LB_2931:
	jmp LB_2935
LB_2934:
	add r14,1 
LB_2935:
	cmp r14,r9
	jge LB_2936
	JZ_SPC BYTE [r13+8+r14], LB_2934
LB_2936
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_2939
	jmp LB_2940
LB_2939:
	jmp LB_2937
LB_2940:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2938
LB_2937:
	add rsp,16
	jmp LB_2910
LB_2938:
	jmp LB_2942
LB_2941:
	add r14,1 
LB_2942:
	cmp r14,r9
	jge LB_2943
	JZ_SPC BYTE [r13+8+r14], LB_2941
LB_2943
	call GRM_236
	cmp BYTE [r8+6],0
	jnz LB_2946
	jmp LB_2947
LB_2946:
	jmp LB_2944
LB_2947:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 11'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
; .mov_ptn 2'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 11'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2945
LB_2944:
	add rsp,24
	jmp LB_2910
LB_2945:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_2948
LB_2948
;; rsp=4 , %1980~1'(= r ) %1979~0'(= r ) %1978~11'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) %1977~10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1976~9'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) %1975~8'(= a35◂ [ *{ }] ) 
; #194 { 9'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 9'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) } ⊢ { 0'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*4]
	mov r14,rax
; .mov_ptn 9'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*5]
	mov r13,rax
	call LB_2905
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=4 , %1981~2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1980~1'(= r ) %1979~0'(= r ) %1978~11'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) %1975~8'(= a35◂ [ *{ }] ) 
; #194 { 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) 11'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) } ⊢ 2'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) 11'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) } ⊢ { 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) 1'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) }
; .mov_ptn 11'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1'(= a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov r13,rax
	call LB_2950
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,40
;; rsp=1 , %1982~2'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] ) %1980~1'(= r ) %1979~0'(= r ) %1975~8'(= a35◂ [ *{ }] ) 
;; ? 2'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] ) ⊢ 0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2954
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r9+8]
	mov r11, QWORD [r9+16]
	mov rcx, QWORD [r8+16]
;; rsp=1 , %1986~6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1985~5'(= a17◂ [ a9◂ [ ]{| l |}] ) %1984~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %1980~1'(= r ) %1979~0'(= r ) %1975~8'(= a35◂ [ *{ }] ) 
; #116 5'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %1987~2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) %1986~6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %1984~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %1980~1'(= r ) %1979~0'(= r ) %1975~8'(= a35◂ [ *{ }] ) 
; #50 { { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=1 , %1988~0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } %1980~1'(= r ) %1979~0'(= r ) %1975~8'(= a35◂ [ *{ }] ) 
; #193 0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=1 , %1989~0(<2)◂0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } %1980~1'(= r ) %1979~0'(= r ) %1975~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=1 , %1990~0(<2)◂0(<2)◂0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } %1980~1'(= r ) %1979~0'(= r ) %1975~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 2
	mov r14,rax
	mov rax,r10
	mov QWORD [r14+8+8*0],rax
	mov rax,r11
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],2
	mov QWORD [rax+8],rdi
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov QWORD [r13+8+8*0],rax
	mov rax,rcx
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2949
LB_2954:
;; ?. 2'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=1 , %1983~3'(= a2◂ [ *{ rr{| l |}}] ) %1980~1'(= r ) %1979~0'(= r ) %1975~8'(= a35◂ [ *{ }] ) 
; #192 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1991~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1980~1'(= r ) %1979~0'(= r ) %1975~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %1992~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1980~1'(= r ) %1979~0'(= r ) %1975~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_2949
LB_2949:
	cmp BYTE [r8+6],0
	jnz LB_2910
	POP_GRM_SCC
	ret
LB_2910:
	POP_GRM_FAIL 
	ret
ETR_237:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_237
	ret
GRM_237:
	PUSH_GRM
	jmp LB_2957
LB_2956:
	add r14,1 
LB_2957:
	cmp r14,r9
	jge LB_2958
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2956
LB_2958
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_2961
	jmp LB_2962
LB_2961:
	jmp LB_2959
LB_2962:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2960
LB_2959:
	add rsp,0
	jmp LB_2955
LB_2960:
	jmp LB_2964
LB_2963:
	add r14,1 
LB_2964:
	cmp r14,r9
	jge LB_2965
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2963
LB_2965
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_2968
	jmp LB_2969
LB_2968:
	mov r8,unt_1
	jmp LB_2966
LB_2969:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_2970
	cmp BYTE [rdi+1],136
	jnz LB_2970
	cmp BYTE [rdi+2],144
	jnz LB_2970
	cmp BYTE [rdi+3],46
	jnz LB_2970
	jmp LB_2971
LB_2970:
	mov r8,unt_1
	jmp LB_2966
LB_2971:
	add r14,4
	jmp LB_2967
LB_2966:
	add rsp,8
	jmp LB_2955
LB_2967:
	jmp LB_2973
LB_2972:
	add r14,1 
LB_2973:
	cmp r14,r9
	jge LB_2974
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2972
LB_2974
	call GRM_197
	cmp BYTE [r8+6],0
	jnz LB_2977
	jmp LB_2978
LB_2977:
	jmp LB_2975
LB_2978:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2976
LB_2975:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_2976:
	jmp LB_2980
LB_2979:
	add r14,1 
LB_2980:
	cmp r14,r9
	jge LB_2981
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2979
LB_2981
	call GRM_241
	cmp BYTE [r8+6],0
	jnz LB_2984
	jmp LB_2985
LB_2984:
	jmp LB_2982
LB_2985:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 10'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 10'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2983
LB_2982:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_2983:
	jmp LB_2987
LB_2986:
	add r14,1 
LB_2987:
	cmp r14,r9
	jge LB_2988
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2986
LB_2988
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_2991
	jmp LB_2992
LB_2991:
	jmp LB_2989
LB_2992:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 11'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 11'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_2990
LB_2989:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_2990:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_2993
LB_2993
;; rsp=4 , %1998~1'(= r ) %1997~0'(= r ) %1996~11'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1995~10'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) %1994~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %1993~8'(= a35◂ [ *{ }] ) 
; #194 { 10'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 11'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 10'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 11'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) } ⊢ { 0'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn 11'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 10'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call LB_2905
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=2 , %1999~2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1998~1'(= r ) %1997~0'(= r ) %1994~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %1993~8'(= a35◂ [ *{ }] ) 
;; ? 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_2995
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
;; rsp=2 , %2002~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %2001~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %1998~1'(= r ) %1997~0'(= r ) %1994~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %1993~8'(= a35◂ [ *{ }] ) 
; #116 4'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] )
;; rsp=2 , %2003~2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) %2001~3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %1998~1'(= r ) %1997~0'(= r ) %1994~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %1993~8'(= a35◂ [ *{ }] ) 
; #49 { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 1(<2)◂{ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %2004~1(<2)◂{ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1998~1'(= r ) %1997~0'(= r ) %1993~8'(= a35◂ [ *{ }] ) 
; #193 1(<2)◂{ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<2)◂{ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %2005~0(<2)◂1(<2)◂{ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1998~1'(= r ) %1997~0'(= r ) %1993~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂1(<2)◂{ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %2006~0(<2)◂0(<2)◂1(<2)◂{ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } %1998~1'(= r ) %1997~0'(= r ) %1993~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 3'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂4'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
	ALC_RCD 3
	mov r13,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*0],rax
	mov rax,r9
	mov QWORD [r13+8+8*1],rax
	mov rax,r10
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],2
	mov QWORD [rax+8],rdi
	mov QWORD [r13+8+8*2],rax
	mov rax,r13
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_2994
LB_2995:
;; ?. 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=2 , %2000~3'(= a2◂ [ *{ rr{| l |}}] ) %1998~1'(= r ) %1997~0'(= r ) %1994~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %1993~8'(= a35◂ [ *{ }] ) 
; #192 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2007~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1998~1'(= r ) %1997~0'(= r ) %1994~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %1993~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2008~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %1998~1'(= r ) %1997~0'(= r ) %1994~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %1993~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_2994
LB_2994:
	cmp BYTE [r8+6],0
	jnz LB_2955
	POP_GRM_SCC
	ret
LB_2955:
	RB_GRM
	jmp LB_2998
LB_2997:
	add r14,1 
LB_2998:
	cmp r14,r9
	jge LB_2999
	JZ_LINE_SPC BYTE [r13+8+r14], LB_2997
LB_2999
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_3002
	jmp LB_3003
LB_3002:
	jmp LB_3000
LB_3003:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3001
LB_3000:
	add rsp,0
	jmp LB_2996
LB_3001:
	jmp LB_3005
LB_3004:
	add r14,1 
LB_3005:
	cmp r14,r9
	jge LB_3006
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3004
LB_3006
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3009
	jmp LB_3010
LB_3009:
	mov r8,unt_1
	jmp LB_3007
LB_3010:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3011
	cmp BYTE [rdi+1],136
	jnz LB_3011
	cmp BYTE [rdi+2],144
	jnz LB_3011
	jmp LB_3012
LB_3011:
	mov r8,unt_1
	jmp LB_3007
LB_3012:
	add r14,3
	jmp LB_3008
LB_3007:
	add rsp,8
	jmp LB_2996
LB_3008:
	jmp LB_3014
LB_3013:
	add r14,1 
LB_3014:
	cmp r14,r9
	jge LB_3015
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3013
LB_3015
	call GRM_197
	cmp BYTE [r8+6],0
	jnz LB_3018
	jmp LB_3019
LB_3018:
	jmp LB_3016
LB_3019:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3017
LB_3016:
	add rsp,8
	jmp LB_2996
LB_3017:
	jmp LB_3021
LB_3020:
	add r14,1 
LB_3021:
	cmp r14,r9
	jge LB_3022
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3020
LB_3022
	call GRM_241
	cmp BYTE [r8+6],0
	jnz LB_3025
	jmp LB_3026
LB_3025:
	jmp LB_3023
LB_3026:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 10'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 2'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 10'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3024
LB_3023:
	add rsp,16
	jmp LB_2996
LB_3024:
	jmp LB_3028
LB_3027:
	add r14,1 
LB_3028:
	cmp r14,r9
	jge LB_3029
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3027
LB_3029
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_3032
	jmp LB_3033
LB_3032:
	jmp LB_3030
LB_3033:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 11'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 11'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3031
LB_3030:
	add rsp,24
	jmp LB_2996
LB_3031:
	jmp LB_3035
LB_3034:
	add r14,1 
LB_3035:
	cmp r14,r9
	jge LB_3036
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3034
LB_3036
	call GRM_237
	cmp BYTE [r8+6],0
	jnz LB_3039
	jmp LB_3040
LB_3039:
	jmp LB_3037
LB_3040:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 12'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
; .mov_ptn 2'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 12'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3038
LB_3037:
	add rsp,32
	jmp LB_2996
LB_3038:
	mov QWORD [rsp+8*5],r14
	mov r13,QWORD [rsp+16+8*5]
	mov r14,QWORD [rsp+8*5]
	jmp LB_3041
LB_3041
;; rsp=5 , %2015~1'(= r ) %2014~0'(= r ) %2013~12'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) %2012~11'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %2011~10'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) %2010~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %2009~8'(= a35◂ [ *{ }] ) 
; #194 { 10'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 11'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 10'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 11'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) } ⊢ { 0'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn 11'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*4]
	mov r14,rax
; .mov_ptn 10'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] ) ⊢ 0'(= a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*5]
	mov r13,rax
	call LB_2905
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=5 , %2016~2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) %2015~1'(= r ) %2014~0'(= r ) %2013~12'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) %2010~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %2009~8'(= a35◂ [ *{ }] ) 
; #194 { 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) 12'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) } ⊢ 2'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) 12'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) } ⊢ { 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) 1'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) }
; .mov_ptn 12'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1'(= a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 2'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov r13,rax
	call LB_3043
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,40
;; rsp=2 , %2017~2'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] ) %2015~1'(= r ) %2014~0'(= r ) %2010~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %2009~8'(= a35◂ [ *{ }] ) 
;; ? 2'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] ) ⊢ 0(<2)◂{ { 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_3047
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r9+8]
	mov r11, QWORD [r9+16]
	mov rcx, QWORD [r8+16]
;; rsp=2 , %2021~6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %2020~5'(= a17◂ [ a9◂ [ ]{| l |}] ) %2019~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %2015~1'(= r ) %2014~0'(= r ) %2010~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %2009~8'(= a35◂ [ *{ }] ) 
; #116 5'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] )
;; rsp=2 , %2022~2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) %2021~6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) %2019~4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %2015~1'(= r ) %2014~0'(= r ) %2010~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %2009~8'(= a35◂ [ *{ }] ) 
; #50 { { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=2 , %2023~0(<2)◂{ { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } %2015~1'(= r ) %2014~0'(= r ) %2009~8'(= a35◂ [ *{ }] ) 
; #193 0(<2)◂{ { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=2 , %2024~0(<2)◂0(<2)◂{ { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } %2015~1'(= r ) %2014~0'(= r ) %2009~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂0(<2)◂{ { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=2 , %2025~0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } %2015~1'(= r ) %2014~0'(= r ) %2009~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) 4'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) 2(<3)◂5'(= a17◂ [ a9◂ [ ]{| l |}] ) } 6'(= a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 3
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r14+8+8*0],rax
	mov rax,r10
	mov QWORD [r14+8+8*1],rax
	mov rax,r11
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],2
	mov QWORD [rax+8],rdi
	mov QWORD [r14+8+8*2],rax
	mov rax,r14
	mov QWORD [r13+8+8*0],rax
	mov rax,rcx
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3042
LB_3047:
;; ?. 2'(= a35◂ [ *{ *{ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a17◂ [ a9◂ [ ]{| l |}]}a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=2 , %2018~3'(= a2◂ [ *{ rr{| l |}}] ) %2015~1'(= r ) %2014~0'(= r ) %2010~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %2009~8'(= a35◂ [ *{ }] ) 
; #192 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2026~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2015~1'(= r ) %2014~0'(= r ) %2010~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %2009~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2027~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2015~1'(= r ) %2014~0'(= r ) %2010~9'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %2009~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a7◂ [ *{ a8◂ [ a14◂ [ a9◂ [ ]{| l |}]]a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]a20◂ [ a9◂ [ ]{| l |}]}]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3042
LB_3042:
	cmp BYTE [r8+6],0
	jnz LB_2996
	POP_GRM_SCC
	ret
LB_2996:
	POP_GRM_FAIL 
	ret
ETR_238:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_238
	ret
GRM_238:
	PUSH_GRM
	jmp LB_3050
LB_3049:
	add r14,1 
LB_3050:
	cmp r14,r9
	jge LB_3051
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3049
LB_3051
	call GRM_239
	cmp BYTE [r8+6],0
	jnz LB_3054
	jmp LB_3055
LB_3054:
	jmp LB_3052
LB_3055:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a21◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a21◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a21◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a21◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3053
LB_3052:
	add rsp,0
	jmp LB_3048
LB_3053:
	jmp LB_3057
LB_3056:
	add r14,1 
LB_3057:
	cmp r14,r9
	jge LB_3058
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3056
LB_3058
	call GRM_240
	cmp BYTE [r8+6],0
	jnz LB_3061
	jmp LB_3062
LB_3061:
	jmp LB_3059
LB_3062:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3060
LB_3059:
	add rsp,8
	jmp LB_3048
LB_3060:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3063
LB_3063
;; rsp=2 , %2031~1'(= r ) %2030~0'(= r ) %2029~9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %2028~8'(= a21◂ [ a9◂ [ ]{| l |}] ) 
; #21 { 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %2032~0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } %2031~1'(= r ) %2030~0'(= r ) 
; #193 0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %2033~0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } %2031~1'(= r ) %2030~0'(= r ) 
; #22 0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %2034~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } %2031~1'(= r ) %2030~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3064
LB_3064:
	cmp BYTE [r8+6],0
	jnz LB_3048
	POP_GRM_SCC
	ret
LB_3048:
	RB_GRM
	jmp LB_3067
LB_3066:
	add r14,1 
LB_3067:
	cmp r14,r9
	jge LB_3068
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3066
LB_3068
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3071
	jmp LB_3072
LB_3071:
	mov r8,unt_1
	jmp LB_3069
LB_3072:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3073
	jmp LB_3074
LB_3073:
	mov r8,unt_1
	jmp LB_3069
LB_3074:
	add r14,1
	jmp LB_3070
LB_3069:
	add rsp,0
	jmp LB_3065
LB_3070:
	jmp LB_3076
LB_3075:
	add r14,1 
LB_3076:
	cmp r14,r9
	jge LB_3077
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3075
LB_3077
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3080
	jmp LB_3081
LB_3080:
	mov r8,unt_1
	jmp LB_3078
LB_3081:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3082
	jmp LB_3083
LB_3082:
	mov r8,unt_1
	jmp LB_3078
LB_3083:
	add r14,1
	jmp LB_3079
LB_3078:
	add rsp,0
	jmp LB_3065
LB_3079:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3084
LB_3084
;; rsp=0 , %2036~1'(= r ) %2035~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2037~1(<2)◂{ } %2036~1'(= r ) %2035~0'(= r ) 
; #193 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2038~0(<2)◂1(<2)◂{ } %2036~1'(= r ) %2035~0'(= r ) 
; #22 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2039~0(<2)◂0(<2)◂1(<2)◂{ } %2036~1'(= r ) %2035~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3085
LB_3085:
	cmp BYTE [r8+6],0
	jnz LB_3065
	POP_GRM_SCC
	ret
LB_3065:
	RB_GRM
	jmp LB_3088
LB_3087:
	add r14,1 
LB_3088:
	cmp r14,r9
	jge LB_3089
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3087
LB_3089
	call GRM_220
	cmp BYTE [r8+6],0
	jnz LB_3092
	jmp LB_3093
LB_3092:
	jmp LB_3090
LB_3093:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_3091
LB_3090:
	add rsp,0
	jmp LB_3086
LB_3091:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3094
LB_3094
;; rsp=2 , %2042~1'(= r ) %2041~0'(= r ) %2040~{ 8'(= r ) 9'(= r ) } 
	jmp LB_3096
LB_3096:
; $ %[ "mtc_line 0" ] ⊢ %[ "mtc_line 0" ]
;; rsp=2 , %2043~%[ "mtc_line 0" ] %2042~1'(= r ) %2041~0'(= r ) %2040~{ 8'(= r ) 9'(= r ) } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2044~1(<2)◂{ } %2043~%[ "mtc_line 0" ] %2042~1'(= r ) %2041~0'(= r ) %2040~{ 8'(= r ) 9'(= r ) } 
; #21 { { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2045~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } %2040~{ 8'(= r ) 9'(= r ) } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2046~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } %2040~{ 8'(= r ) 9'(= r ) } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2047~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } %2040~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]]] )
	ALC_RCD 2
	mov r9,rax
	ALC_RCD 3
	mov r10,rax
	mov rax,r13
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
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
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3095
LB_3095:
	cmp BYTE [r8+6],0
	jnz LB_3086
	POP_GRM_SCC
	ret
LB_3086:
	POP_GRM_FAIL 
	ret
ETR_239:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_239
	ret
GRM_239:
	PUSH_GRM
	jmp LB_3099
LB_3098:
	add r14,1 
LB_3099:
	cmp r14,r9
	jge LB_3100
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3098
LB_3100
	call GRM_201
	cmp BYTE [r8+6],0
	jnz LB_3103
	jmp LB_3104
LB_3103:
	jmp LB_3101
LB_3104:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3102
LB_3101:
	add rsp,0
	jmp LB_3097
LB_3102:
	jmp LB_3106
LB_3105:
	add r14,1 
LB_3106:
	cmp r14,r9
	jge LB_3107
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3105
LB_3107
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3110
	jmp LB_3111
LB_3110:
	mov r8,unt_1
	jmp LB_3108
LB_3111:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3112
	cmp BYTE [rdi+1],138
	jnz LB_3112
	cmp BYTE [rdi+2],162
	jnz LB_3112
	jmp LB_3113
LB_3112:
	mov r8,unt_1
	jmp LB_3108
LB_3113:
	add r14,3
	jmp LB_3109
LB_3108:
	add rsp,8
	jmp LB_3097
LB_3109:
	jmp LB_3115
LB_3114:
	add r14,1 
LB_3115:
	cmp r14,r9
	jge LB_3116
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3114
LB_3116
	call GRM_189
	cmp BYTE [r8+6],0
	jnz LB_3119
	jmp LB_3120
LB_3119:
	jmp LB_3117
LB_3120:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 9'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 9'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3118
LB_3117:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3118:
	jmp LB_3122
LB_3121:
	add r14,1 
LB_3122:
	cmp r14,r9
	jge LB_3123
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3121
LB_3123
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3126
	jmp LB_3127
LB_3126:
	mov r8,unt_1
	jmp LB_3124
LB_3127:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3128
	cmp BYTE [rdi+1],151
	jnz LB_3128
	cmp BYTE [rdi+2],130
	jnz LB_3128
	jmp LB_3129
LB_3128:
	mov r8,unt_1
	jmp LB_3124
LB_3129:
	add r14,3
	jmp LB_3125
LB_3124:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_3125:
	jmp LB_3131
LB_3130:
	add r14,1 
LB_3131:
	cmp r14,r9
	jge LB_3132
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3130
LB_3132
	call GRM_197
	cmp BYTE [r8+6],0
	jnz LB_3135
	jmp LB_3136
LB_3135:
	jmp LB_3133
LB_3136:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3134
LB_3133:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_3134:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_3137
LB_3137
;; rsp=3 , %2052~1'(= r ) %2051~0'(= r ) %2050~10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) %2049~9'(= a9◂ [ ] ) %2048~8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; #96 { 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %2053~0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } %2052~1'(= r ) %2051~0'(= r ) %2048~8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; #78 0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 1(<2)◂0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=3 , %2054~1(<2)◂0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } %2052~1'(= r ) %2051~0'(= r ) %2048~8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 
; #115 { 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } } ⊢ 0(<3)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } }
;; rsp=3 , %2055~0(<3)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } } %2052~1'(= r ) %2051~0'(= r ) 
; #22 0(<3)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } } ⊢ 0(<2)◂0(<3)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } }
;; rsp=3 , %2056~0(<2)◂0(<3)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } } %2052~1'(= r ) %2051~0'(= r ) 
; ∎ 0(<2)◂0(<3)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } }
; .mov_ptn2 0(<2)◂0(<3)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } } ⊢ 2'(= a3◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂0(<3)◂{ 8'(= a8◂ [ a12◂ [ a9◂ [ ]{| l |}]] ) 1(<2)◂0(<4)◂{ 9'(= a9◂ [ ] ) 10'(= a8◂ [ a14◂ [ a9◂ [ ]{| l |}]] ) } } ⊢ 2'(= a3◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r13+8+8*0],rax
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_3138
LB_3138:
	cmp BYTE [r8+6],0
	jnz LB_3097
	POP_GRM_SCC
	ret
LB_3097:
	RB_GRM
	jmp LB_3141
LB_3140:
	add r14,1 
LB_3141:
	cmp r14,r9
	jge LB_3142
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3140
LB_3142
	call GRM_242
	cmp BYTE [r8+6],0
	jnz LB_3145
	jmp LB_3146
LB_3145:
	jmp LB_3143
LB_3146:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a22◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a22◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a22◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a22◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3144
LB_3143:
	add rsp,0
	jmp LB_3139
LB_3144:
	jmp LB_3148
LB_3147:
	add r14,1 
LB_3148:
	cmp r14,r9
	jge LB_3149
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3147
LB_3149
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_3152
	jmp LB_3153
LB_3152:
	mov r8,unt_1
	jmp LB_3150
LB_3153:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3154
	cmp BYTE [rdi+1],60
	jnz LB_3154
	jmp LB_3155
LB_3154:
	mov r8,unt_1
	jmp LB_3150
LB_3155:
	add r14,2
	jmp LB_3151
LB_3150:
	add rsp,8
	jmp LB_3139
LB_3151:
	jmp LB_3157
LB_3156:
	add r14,1 
LB_3157:
	cmp r14,r9
	jge LB_3158
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3156
LB_3158
	call GRM_242
	cmp BYTE [r8+6],0
	jnz LB_3161
	jmp LB_3162
LB_3161:
	jmp LB_3159
LB_3162:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a22◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a22◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a22◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a22◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3160
LB_3159:
	add rsp,8
	jmp LB_3139
LB_3160:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3163
LB_3163
;; rsp=2 , %2060~1'(= r ) %2059~0'(= r ) %2058~9'(= a22◂ [ a9◂ [ ]{| l |}] ) %2057~8'(= a22◂ [ a9◂ [ ]{| l |}] ) 
; #113 { 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %2061~2(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) } %2060~1'(= r ) %2059~0'(= r ) 
; #22 2(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂2(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %2062~0(<2)◂2(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) } %2060~1'(= r ) %2059~0'(= r ) 
; ∎ 0(<2)◂2(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂2(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂2(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3164
LB_3164:
	cmp BYTE [r8+6],0
	jnz LB_3139
	POP_GRM_SCC
	ret
LB_3139:
	RB_GRM
	jmp LB_3167
LB_3166:
	add r14,1 
LB_3167:
	cmp r14,r9
	jge LB_3168
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3166
LB_3168
	call GRM_242
	cmp BYTE [r8+6],0
	jnz LB_3171
	jmp LB_3172
LB_3171:
	jmp LB_3169
LB_3172:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a22◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a22◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a22◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a22◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3170
LB_3169:
	add rsp,0
	jmp LB_3165
LB_3170:
	jmp LB_3174
LB_3173:
	add r14,1 
LB_3174:
	cmp r14,r9
	jge LB_3175
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3173
LB_3175
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3178
	jmp LB_3179
LB_3178:
	mov r8,unt_1
	jmp LB_3176
LB_3179:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3180
	jmp LB_3181
LB_3180:
	mov r8,unt_1
	jmp LB_3176
LB_3181:
	add r14,1
	jmp LB_3177
LB_3176:
	add rsp,8
	jmp LB_3165
LB_3177:
	jmp LB_3183
LB_3182:
	add r14,1 
LB_3183:
	cmp r14,r9
	jge LB_3184
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3182
LB_3184
	call GRM_242
	cmp BYTE [r8+6],0
	jnz LB_3187
	jmp LB_3188
LB_3187:
	jmp LB_3185
LB_3188:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a22◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a22◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a22◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a22◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3186
LB_3185:
	add rsp,8
	jmp LB_3165
LB_3186:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3189
LB_3189
;; rsp=2 , %2066~1'(= r ) %2065~0'(= r ) %2064~9'(= a22◂ [ a9◂ [ ]{| l |}] ) %2063~8'(= a22◂ [ a9◂ [ ]{| l |}] ) 
; #114 { 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) } ⊢ 1(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %2067~1(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) } %2066~1'(= r ) %2065~0'(= r ) 
; #22 1(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂1(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %2068~0(<2)◂1(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) } %2066~1'(= r ) %2065~0'(= r ) 
; ∎ 0(<2)◂1(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂1(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂1(<3)◂{ 8'(= a22◂ [ a9◂ [ ]{| l |}] ) 9'(= a22◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3190
LB_3190:
	cmp BYTE [r8+6],0
	jnz LB_3165
	POP_GRM_SCC
	ret
LB_3165:
	POP_GRM_FAIL 
	ret
ETR_240:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_240
	ret
GRM_240:
	PUSH_GRM
	jmp LB_3193
LB_3192:
	add r14,1 
LB_3193:
	cmp r14,r9
	jge LB_3194
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3192
LB_3194
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3197
	jmp LB_3198
LB_3197:
	mov r8,unt_1
	jmp LB_3195
LB_3198:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_3199
	jmp LB_3200
LB_3199:
	mov r8,unt_1
	jmp LB_3195
LB_3200:
	add r14,1
	jmp LB_3196
LB_3195:
	add rsp,0
	jmp LB_3191
LB_3196:
	jmp LB_3202
LB_3201:
	add r14,1 
LB_3202:
	cmp r14,r9
	jge LB_3203
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3201
LB_3203
	call GRM_239
	cmp BYTE [r8+6],0
	jnz LB_3206
	jmp LB_3207
LB_3206:
	jmp LB_3204
LB_3207:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a21◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a21◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a21◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a21◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3205
LB_3204:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3205:
	jmp LB_3209
LB_3208:
	add r14,1 
LB_3209:
	cmp r14,r9
	jge LB_3210
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3208
LB_3210
	call GRM_240
	cmp BYTE [r8+6],0
	jnz LB_3213
	jmp LB_3214
LB_3213:
	jmp LB_3211
LB_3214:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3212
LB_3211:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3212:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3215
LB_3215
;; rsp=2 , %2072~1'(= r ) %2071~0'(= r ) %2070~9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %2069~8'(= a21◂ [ a9◂ [ ]{| l |}] ) 
; #21 { 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %2073~0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } %2072~1'(= r ) %2071~0'(= r ) 
; #22 0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %2074~0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } %2072~1'(= r ) %2071~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3216
LB_3216:
	cmp BYTE [r8+6],0
	jnz LB_3191
	POP_GRM_SCC
	ret
LB_3191:
	RB_GRM
	jmp LB_3219
LB_3218:
	add r14,1 
LB_3219:
	cmp r14,r9
	jge LB_3220
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3218
LB_3220
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3223
	jmp LB_3224
LB_3223:
	mov r8,unt_1
	jmp LB_3221
LB_3224:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3225
	jmp LB_3226
LB_3225:
	mov r8,unt_1
	jmp LB_3221
LB_3226:
	add r14,1
	jmp LB_3222
LB_3221:
	add rsp,0
	jmp LB_3217
LB_3222:
	jmp LB_3228
LB_3227:
	add r14,1 
LB_3228:
	cmp r14,r9
	jge LB_3229
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3227
LB_3229
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3232
	jmp LB_3233
LB_3232:
	mov r8,unt_1
	jmp LB_3230
LB_3233:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3234
	jmp LB_3235
LB_3234:
	mov r8,unt_1
	jmp LB_3230
LB_3235:
	add r14,1
	jmp LB_3231
LB_3230:
	add rsp,0
	jmp LB_3217
LB_3231:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3236
LB_3236
;; rsp=0 , %2076~1'(= r ) %2075~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2077~1(<2)◂{ } %2076~1'(= r ) %2075~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2078~0(<2)◂1(<2)◂{ } %2076~1'(= r ) %2075~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3237
LB_3237:
	cmp BYTE [r8+6],0
	jnz LB_3217
	POP_GRM_SCC
	ret
LB_3217:
	POP_GRM_FAIL 
	ret
ETR_241:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_241
	ret
GRM_241:
	PUSH_GRM
	jmp LB_3240
LB_3239:
	add r14,1 
LB_3240:
	cmp r14,r9
	jge LB_3241
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3239
LB_3241
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3244
	jmp LB_3245
LB_3244:
	mov r8,unt_1
	jmp LB_3242
LB_3245:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_3246
	jmp LB_3247
LB_3246:
	mov r8,unt_1
	jmp LB_3242
LB_3247:
	add r14,1
	jmp LB_3243
LB_3242:
	add rsp,0
	jmp LB_3238
LB_3243:
	jmp LB_3249
LB_3248:
	add r14,1 
LB_3249:
	cmp r14,r9
	jge LB_3250
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3248
LB_3250
	call GRM_239
	cmp BYTE [r8+6],0
	jnz LB_3253
	jmp LB_3254
LB_3253:
	jmp LB_3251
LB_3254:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a21◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a21◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a21◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a21◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3252
LB_3251:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3252:
	jmp LB_3256
LB_3255:
	add r14,1 
LB_3256:
	cmp r14,r9
	jge LB_3257
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3255
LB_3257
	call GRM_240
	cmp BYTE [r8+6],0
	jnz LB_3260
	jmp LB_3261
LB_3260:
	jmp LB_3258
LB_3261:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3259
LB_3258:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3259:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3262
LB_3262
;; rsp=2 , %2082~1'(= r ) %2081~0'(= r ) %2080~9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) %2079~8'(= a21◂ [ a9◂ [ ]{| l |}] ) 
; #21 { 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %2083~0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } %2082~1'(= r ) %2081~0'(= r ) 
; #193 0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %2084~0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } %2082~1'(= r ) %2081~0'(= r ) 
; #22 0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=2 , %2085~0(<2)◂0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } %2082~1'(= r ) %2081~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂{ 8'(= a21◂ [ a9◂ [ ]{| l |}] ) 9'(= a2◂ [ a21◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3263
LB_3263:
	cmp BYTE [r8+6],0
	jnz LB_3238
	POP_GRM_SCC
	ret
LB_3238:
	RB_GRM
	jmp LB_3266
LB_3265:
	add r14,1 
LB_3266:
	cmp r14,r9
	jge LB_3267
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3265
LB_3267
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3270
	jmp LB_3271
LB_3270:
	mov r8,unt_1
	jmp LB_3268
LB_3271:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3272
	jmp LB_3273
LB_3272:
	mov r8,unt_1
	jmp LB_3268
LB_3273:
	add r14,1
	jmp LB_3269
LB_3268:
	add rsp,0
	jmp LB_3264
LB_3269:
	jmp LB_3275
LB_3274:
	add r14,1 
LB_3275:
	cmp r14,r9
	jge LB_3276
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3274
LB_3276
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3279
	jmp LB_3280
LB_3279:
	mov r8,unt_1
	jmp LB_3277
LB_3280:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_3281
	jmp LB_3282
LB_3281:
	mov r8,unt_1
	jmp LB_3277
LB_3282:
	add r14,1
	jmp LB_3278
LB_3277:
	add rsp,0
	jmp LB_3264
LB_3278:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3283
LB_3283
;; rsp=0 , %2087~1'(= r ) %2086~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2088~1(<2)◂{ } %2087~1'(= r ) %2086~0'(= r ) 
; #193 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2089~0(<2)◂1(<2)◂{ } %2087~1'(= r ) %2086~0'(= r ) 
; #22 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2090~0(<2)◂0(<2)◂1(<2)◂{ } %2087~1'(= r ) %2086~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3284
LB_3284:
	cmp BYTE [r8+6],0
	jnz LB_3264
	POP_GRM_SCC
	ret
LB_3264:
	RB_GRM
	jmp LB_3287
LB_3286:
	add r14,1 
LB_3287:
	cmp r14,r9
	jge LB_3288
	JZ_LINE_SPC BYTE [r13+8+r14], LB_3286
LB_3288
	call GRM_220
	cmp BYTE [r8+6],0
	jnz LB_3291
	jmp LB_3292
LB_3291:
	jmp LB_3289
LB_3292:
	sub rsp,16
; .mov_ptn2 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
; .mov_ptn 2'(= *{ rr} ) ⊢ { 8'(= r ) 9'(= r ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_3290
LB_3289:
	add rsp,0
	jmp LB_3285
LB_3290:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3293
LB_3293
;; rsp=2 , %2093~1'(= r ) %2092~0'(= r ) %2091~{ 8'(= r ) 9'(= r ) } 
	jmp LB_3295
LB_3295:
; $ %[ "mtc_line_tl 0" ] ⊢ %[ "mtc_line_tl 0" ]
;; rsp=2 , %2094~%[ "mtc_line_tl 0" ] %2093~1'(= r ) %2092~0'(= r ) %2091~{ 8'(= r ) 9'(= r ) } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2095~1(<2)◂{ } %2094~%[ "mtc_line_tl 0" ] %2093~1'(= r ) %2092~0'(= r ) %2091~{ 8'(= r ) 9'(= r ) } 
; #21 { { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2096~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } %2091~{ 8'(= r ) 9'(= r ) } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2097~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } %2091~{ 8'(= r ) 9'(= r ) } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
;; rsp=2 , %2098~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } %2091~{ 8'(= r ) 9'(= r ) } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "mtc_line_tl 0" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a21◂ [ a9◂ [ ]{| l |}]]]] )
	ALC_RCD 2
	mov r9,rax
	ALC_RCD 3
	mov r10,rax
	mov rax,r13
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
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
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3294
LB_3294:
	cmp BYTE [r8+6],0
	jnz LB_3285
	POP_GRM_SCC
	ret
LB_3285:
	POP_GRM_FAIL 
	ret
ETR_242:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_242
	ret
GRM_242:
	PUSH_GRM
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_3299
	jmp LB_3300
LB_3299:
	jmp LB_3297
LB_3300:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3298
LB_3297:
	add rsp,0
	jmp LB_3296
LB_3298:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3303
	jmp LB_3304
LB_3303:
	mov r8,unt_1
	jmp LB_3301
LB_3304:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],39
	jnz LB_3305
	jmp LB_3306
LB_3305:
	mov r8,unt_1
	jmp LB_3301
LB_3306:
	add r14,1
	jmp LB_3302
LB_3301:
	add rsp,8
	jmp LB_3296
LB_3302:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3307
LB_3307
;; rsp=1 , %2101~1'(= r ) %2100~0'(= r ) %2099~8'(= {| l |} ) 
; #111 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %2102~1(<2)◂8'(= {| l |} ) %2101~1'(= r ) %2100~0'(= r ) 
; #22 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %2103~0(<2)◂1(<2)◂8'(= {| l |} ) %2101~1'(= r ) %2100~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a22◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a22◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_3308
LB_3308:
	cmp BYTE [r8+6],0
	jnz LB_3296
	POP_GRM_SCC
	ret
LB_3296:
	RB_GRM
	call GRM_190
	cmp BYTE [r8+6],0
	jnz LB_3312
	jmp LB_3313
LB_3312:
	jmp LB_3310
LB_3313:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3311
LB_3310:
	add rsp,0
	jmp LB_3309
LB_3311:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3314
LB_3314
;; rsp=1 , %2106~1'(= r ) %2105~0'(= r ) %2104~8'(= a11◂ [ a9◂ [ ]] ) 
; #112 8'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %2107~0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) %2106~1'(= r ) %2105~0'(= r ) 
; #22 0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %2108~0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) %2106~1'(= r ) %2105~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a22◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a22◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_3315
LB_3315:
	cmp BYTE [r8+6],0
	jnz LB_3309
	POP_GRM_SCC
	ret
LB_3309:
	POP_GRM_FAIL 
	ret
LB_3340: ;; #194 { 0'(= a35◂ [ a31◂ [ ]] ) 1'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) } ⊢ 0'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] ) : ({ _t35◂_t31 _t35◂_lst◂_t31 }→_t35◂{ _t31 _lst◂_t31 })
;; rsp=0 , %1134~1'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) %1133~0'(= a35◂ [ a31◂ [ ]] ) 
;; ? 0'(= a35◂ [ a31◂ [ ]] ) ⊢ 0(<2)◂2'(= a31◂ [ ] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_3341
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1136~2'(= a31◂ [ ] ) %1134~1'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) 
;; ? 1'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 0(<2)◂0'(= a2◂ [ a31◂ [ ]] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_3342
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1138~0'(= a2◂ [ a31◂ [ ]] ) %1136~2'(= a31◂ [ ] ) 
; #193 { 2'(= a31◂ [ ] ) 0'(= a2◂ [ a31◂ [ ]] ) } ⊢ 0(<2)◂{ 2'(= a31◂ [ ] ) 0'(= a2◂ [ a31◂ [ ]] ) }
;; rsp=0 , %1139~0(<2)◂{ 2'(= a31◂ [ ] ) 0'(= a2◂ [ a31◂ [ ]] ) } 
; ∎ 0(<2)◂{ 2'(= a31◂ [ ] ) 0'(= a2◂ [ a31◂ [ ]] ) }
; .mov_ptn2 0(<2)◂{ 2'(= a31◂ [ ] ) 0'(= a2◂ [ a31◂ [ ]] ) } ⊢ 0'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] )
	mov r14,r13
; .mov_ptn 0(<2)◂{ 2'(= a31◂ [ ] ) 1'(= a2◂ [ a31◂ [ ]] ) } ⊢ 0'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] )
	ALC_RCD 2
	mov r9,rax
	mov rax,r8
	mov QWORD [r9+8+8*0],rax
	mov rax,r14
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r13,rax
	ret
LB_3342:
;; ?. 1'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1137~0'(= a2◂ [ *{ rr{| l |}}] ) %1136~2'(= a31◂ [ ] ) 
; #192 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1140~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) %1136~2'(= a31◂ [ ] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] )
	mov r14,r13
; .mov_ptn 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] )
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_3341:
;; ?. 0'(= a35◂ [ a31◂ [ ]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1135~2'(= a2◂ [ *{ rr{| l |}}] ) %1134~1'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) 
;; ? 1'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 0(<2)◂0'(= a2◂ [ a31◂ [ ]] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_3343
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1142~0'(= a2◂ [ a31◂ [ ]] ) %1135~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1143~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1142~0'(= a2◂ [ a31◂ [ ]] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] )
; .mov_ptn 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] )
	mov rax,r8
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_3343:
;; ?. 1'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1141~0'(= a2◂ [ *{ rr{| l |}}] ) %1135~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #53 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r13
	mov r14,rax
; .mov_ptn 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r8
	mov r13,rax
	call LB_1600
;; rsp=0 , %1144~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #192 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1145~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] )
	mov r14,r13
; .mov_ptn 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] )
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_4253: ;; #194 { 0'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] ) : ({ _t35◂_lst◂{ _s8 _t8◂_t13◂_s8 _opn◂_t23 _t17◂_s8◂_t9 } _t35◂_t17◂_s8◂_t9 }→_t35◂{ _lst◂{ _s8 _t8◂_t13◂_s8 _opn◂_t23 _t17◂_s8◂_t9 } _t17◂_s8◂_t9 })
;; rsp=0 , %1134~1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %1133~0'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) 
;; ? 0'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,r13
	cmp BYTE [rdi+6],0
	jnz LB_4254
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1136~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %1134~1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) 
;; ? 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_4255
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1138~0'(= a17◂ [ a9◂ [ ]{| l |}] ) %1136~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) 
; #193 { 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=0 , %1139~0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } 
; ∎ 0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov r14,r13
; .mov_ptn 0(<2)◂{ 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) 1'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] )
	ALC_RCD 2
	mov r9,rax
	mov rax,r8
	mov QWORD [r9+8+8*0],rax
	mov rax,r14
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov r13,rax
	ret
LB_4255:
;; ?. 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1137~0'(= a2◂ [ *{ rr{| l |}}] ) %1136~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) 
; #192 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1140~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) %1136~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov r14,r13
; .mov_ptn 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_4254:
;; ?. 0'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %1135~2'(= a2◂ [ *{ rr{| l |}}] ) %1134~1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) 
;; ? 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂0'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,r14
	cmp BYTE [rdi+6],0
	jnz LB_4256
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1142~0'(= a17◂ [ a9◂ [ ]{| l |}] ) %1135~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1143~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %1142~0'(= a17◂ [ a9◂ [ ]{| l |}] ) 
; ∎ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] )
; .mov_ptn 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_4256:
;; ?. 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
	mov r13,QWORD [rdi+8]
;; rsp=0 , %1141~0'(= a2◂ [ *{ rr{| l |}}] ) %1135~2'(= a2◂ [ *{ rr{| l |}}] ) 
; #53 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 0'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r13
	mov r14,rax
; .mov_ptn 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r8
	mov r13,rax
	call LB_1600
;; rsp=0 , %1144~0'(= a2◂ [ *{ rr{| l |}}] ) 
; #192 0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=0 , %1145~1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) 
; ∎ 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov r14,r13
; .mov_ptn 1(<2)◂1'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
ETR_243:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_243
	ret
GRM_243:
	PUSH_GRM
	jmp LB_3318
LB_3317:
	add r14,1 
LB_3318:
	cmp r14,r9
	jge LB_3319
	JZ_SPC BYTE [r13+8+r14], LB_3317
LB_3319
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_3322
	jmp LB_3323
LB_3322:
	jmp LB_3320
LB_3323:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3321
LB_3320:
	add rsp,0
	jmp LB_3316
LB_3321:
	jmp LB_3325
LB_3324:
	add r14,1 
LB_3325:
	cmp r14,r9
	jge LB_3326
	JZ_SPC BYTE [r13+8+r14], LB_3324
LB_3326
	call GRM_244
	cmp BYTE [r8+6],0
	jnz LB_3329
	jmp LB_3330
LB_3329:
	jmp LB_3327
LB_3330:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 9'(= a35◂ [ a31◂ [ ]] )
; .mov_ptn 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 9'(= a35◂ [ a31◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3328
LB_3327:
	add rsp,8
	jmp LB_3316
LB_3328:
	jmp LB_3332
LB_3331:
	add r14,1 
LB_3332:
	cmp r14,r9
	jge LB_3333
	JZ_SPC BYTE [r13+8+r14], LB_3331
LB_3333
	call GRM_243
	cmp BYTE [r8+6],0
	jnz LB_3336
	jmp LB_3337
LB_3336:
	jmp LB_3334
LB_3337:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 10'(= a35◂ [ a2◂ [ a31◂ [ ]]] )
; .mov_ptn 2'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 10'(= a35◂ [ a2◂ [ a31◂ [ ]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3335
LB_3334:
	add rsp,16
	jmp LB_3316
LB_3335:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_3338
LB_3338
;; rsp=3 , %2113~1'(= r ) %2112~0'(= r ) %2111~10'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) %2110~9'(= a35◂ [ a31◂ [ ]] ) %2109~8'(= a35◂ [ *{ }] ) 
; #194 { 9'(= a35◂ [ a31◂ [ ]] ) 10'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) } ⊢ 2'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 9'(= a35◂ [ a31◂ [ ]] ) 10'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) } ⊢ { 0'(= a35◂ [ a31◂ [ ]] ) 1'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) }
; .mov_ptn 10'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 1'(= a35◂ [ a2◂ [ a31◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 9'(= a35◂ [ a31◂ [ ]] ) ⊢ 0'(= a35◂ [ a31◂ [ ]] )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call LB_3340
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=1 , %2114~2'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] ) %2113~1'(= r ) %2112~0'(= r ) %2109~8'(= a35◂ [ *{ }] ) 
;; ? 2'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] ) ⊢ 0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_3344
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
;; rsp=1 , %2117~4'(= a2◂ [ a31◂ [ ]] ) %2116~3'(= a31◂ [ ] ) %2113~1'(= r ) %2112~0'(= r ) %2109~8'(= a35◂ [ *{ }] ) 
; #21 { 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } ⊢ 0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) }
;; rsp=1 , %2118~0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } %2113~1'(= r ) %2112~0'(= r ) %2109~8'(= a35◂ [ *{ }] ) 
; #193 0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) }
;; rsp=1 , %2119~0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } %2113~1'(= r ) %2112~0'(= r ) %2109~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) }
;; rsp=1 , %2120~0(<2)◂0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } %2113~1'(= r ) %2112~0'(= r ) %2109~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,r9
	mov QWORD [r13+8+8*0],rax
	mov rax,r10
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_3339
LB_3344:
;; ?. 2'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=1 , %2115~3'(= a2◂ [ *{ rr{| l |}}] ) %2113~1'(= r ) %2112~0'(= r ) %2109~8'(= a35◂ [ *{ }] ) 
; #192 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2121~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2113~1'(= r ) %2112~0'(= r ) %2109~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2122~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2113~1'(= r ) %2112~0'(= r ) %2109~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
; .mov_ptn 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_3339
LB_3339:
	cmp BYTE [r8+6],0
	jnz LB_3316
	POP_GRM_SCC
	ret
LB_3316:
	RB_GRM
	jmp LB_3347
LB_3346:
	add r14,1 
LB_3347:
	cmp r14,r9
	jge LB_3348
	JZ_SPC BYTE [r13+8+r14], LB_3346
LB_3348
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_3351
	jmp LB_3352
LB_3351:
	jmp LB_3349
LB_3352:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3350
LB_3349:
	add rsp,0
	jmp LB_3345
LB_3350:
	PUSH_GRM
	jmp LB_3356
LB_3355:
	add r14,1 
LB_3356:
	cmp r14,r9
	jge LB_3357
	JZ_SPC BYTE [r13+8+r14], LB_3355
LB_3357
	cmp r14,r9
	jge LB_3360
	jmp LB_3361
LB_3360:
	mov r8,unt_1 
	jmp LB_3358
LB_3361:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_3359
LB_3358:
	add rsp,0
	jmp LB_3354
LB_3359:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3362
LB_3362
;; rsp=1 , %2128~1'(= r ) %2127~0'(= r ) %2126~8'(= r ) 
	jmp LB_3364
LB_3364:
; $ %[ "file end" ] ⊢ %[ "file end" ]
;; rsp=1 , %2129~%[ "file end" ] %2128~1'(= r ) %2127~0'(= r ) %2126~8'(= r ) 
; #10 %[ "file end" ] ⊢ %[ "file end" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3365
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3366
LB_3366:
;; rsp=1 , %2130~%[ "file end" ] %2128~1'(= r ) %2127~0'(= r ) %2126~8'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2131~1(<2)◂{ } %2130~%[ "file end" ] %2128~1'(= r ) %2127~0'(= r ) %2126~8'(= r ) 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	add rsp,8
	jmp LB_3363
LB_3363:
	cmp BYTE [r8+6],0
	jnz LB_3354
	POP_GRM_SCC
	jmp LB_3353
LB_3354:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3368
LB_3368
;; rsp=0 , %2133~1'(= r ) %2132~0'(= r ) 
	jmp LB_3370
LB_3370:
; $ %[ "file end nl" ] ⊢ %[ "file end nl" ]
;; rsp=0 , %2134~%[ "file end nl" ] %2133~1'(= r ) %2132~0'(= r ) 
; #10 %[ "file end nl" ] ⊢ %[ "file end nl" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3371
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3372
LB_3372:
;; rsp=0 , %2135~%[ "file end nl" ] %2133~1'(= r ) %2132~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2136~0(<2)◂{ } %2135~%[ "file end nl" ] %2133~1'(= r ) %2132~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_3369
LB_3369:
	cmp BYTE [r8+6],0
	jnz LB_3367
	POP_GRM_SCC
	jmp LB_3353
LB_3367:
	POP_GRM_FAIL 
	jmp LB_3353
LB_3353:
	cmp BYTE [r8+6],0
	jnz LB_3373
	jmp LB_3374
LB_3373:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3374:
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3375
LB_3375
;; rsp=1 , %2137~{ } %2125~1'(= r ) %2124~0'(= r ) %2123~8'(= a35◂ [ *{ }] ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=1 , %2138~1(<2)◂{ } %2137~{ } %2125~1'(= r ) %2124~0'(= r ) %2123~8'(= a35◂ [ *{ }] ) 
; #193 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=1 , %2139~0(<2)◂1(<2)◂{ } %2137~{ } %2125~1'(= r ) %2124~0'(= r ) %2123~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=1 , %2140~0(<2)◂0(<2)◂1(<2)◂{ } %2137~{ } %2125~1'(= r ) %2124~0'(= r ) %2123~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_3376
LB_3376:
	cmp BYTE [r8+6],0
	jnz LB_3345
	POP_GRM_SCC
	ret
LB_3345:
	POP_GRM_FAIL 
	ret
ETR_244:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_244
	ret
GRM_244:
	PUSH_GRM
	jmp LB_3379
LB_3378:
	add r14,1 
LB_3379:
	cmp r14,r9
	jge LB_3380
	JZ_SPC BYTE [r13+8+r14], LB_3378
LB_3380
	lea rax,[r14+7]
	cmp rax,r9
	jg LB_3383
	jmp LB_3384
LB_3383:
	mov r8,unt_1
	jmp LB_3381
LB_3384:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3385
	cmp BYTE [rdi+1],167
	jnz LB_3385
	cmp BYTE [rdi+2],194
	jnz LB_3385
	cmp BYTE [rdi+3],167
	jnz LB_3385
	cmp BYTE [rdi+4],43
	jnz LB_3385
	cmp BYTE [rdi+5],115
	jnz LB_3385
	cmp BYTE [rdi+6],56
	jnz LB_3385
	jmp LB_3386
LB_3385:
	mov r8,unt_1
	jmp LB_3381
LB_3386:
	add r14,7
	jmp LB_3382
LB_3381:
	add rsp,0
	jmp LB_3377
LB_3382:
	PUSH_GRM
	jmp LB_3390
LB_3389:
	add r14,1 
LB_3390:
	cmp r14,r9
	jge LB_3391
	JZ_SPC BYTE [r13+8+r14], LB_3389
LB_3391
	call GRM_259
	cmp BYTE [r8+6],0
	jnz LB_3394
	jmp LB_3395
LB_3394:
	jmp LB_3392
LB_3395:
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]} ) ⊢ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 2'(= *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]} ) ⊢ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_3393
LB_3392:
	add rsp,0
	jmp LB_3388
LB_3393:
	jmp LB_3397
LB_3396:
	add r14,1 
LB_3397:
	cmp r14,r9
	jge LB_3398
	JZ_SPC BYTE [r13+8+r14], LB_3396
LB_3398
	call GRM_260
	cmp BYTE [r8+6],0
	jnz LB_3401
	jmp LB_3402
LB_3401:
	jmp LB_3399
LB_3402:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] )
; .mov_ptn 2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3400
LB_3399:
	add rsp,16
	jmp LB_3388
LB_3400:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_3403
LB_3403
;; rsp=3 , %2146~1'(= r ) %2145~0'(= r ) %2144~10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %2143~{ 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 
; #21 { { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2147~0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } %2146~1'(= r ) %2145~0'(= r ) 
; #175 0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2148~1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } %2146~1'(= r ) %2145~0'(= r ) 
; #193 1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2149~0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } %2146~1'(= r ) %2145~0'(= r ) 
; #22 0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2150~0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } %2146~1'(= r ) %2145~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_3404
LB_3404:
	cmp BYTE [r8+6],0
	jnz LB_3388
	POP_GRM_SCC
	jmp LB_3387
LB_3388:
	RB_GRM
	jmp LB_3407
LB_3406:
	add r14,1 
LB_3407:
	cmp r14,r9
	jge LB_3408
	JZ_SPC BYTE [r13+8+r14], LB_3406
LB_3408
	call GRM_245
	cmp BYTE [r8+6],0
	jnz LB_3411
	jmp LB_3412
LB_3411:
	jmp LB_3409
LB_3412:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_3410
LB_3409:
	add rsp,0
	jmp LB_3405
LB_3410:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3413
LB_3413
;; rsp=0 , %2153~1'(= r ) %2152~0'(= r ) %2151~{ } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2154~1(<2)◂{ } %2153~1'(= r ) %2152~0'(= r ) %2151~{ } 
	jmp LB_3415
LB_3415:
; $ %[ "grb_etr 1" ] ⊢ %[ "grb_etr 1" ]
;; rsp=0 , %2155~%[ "grb_etr 1" ] %2154~1(<2)◂{ } %2153~1'(= r ) %2152~0'(= r ) %2151~{ } 
; #21 { { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2156~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } %2151~{ } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2157~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } %2151~{ } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
;; rsp=0 , %2158~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } %2151~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "grb_etr 1" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	ALC_RCD 2
	mov r9,rax
	ALC_RCD 3
	mov r10,rax
	mov rax,r13
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
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
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3414
LB_3414:
	cmp BYTE [r8+6],0
	jnz LB_3405
	POP_GRM_SCC
	jmp LB_3387
LB_3405:
	POP_GRM_FAIL 
	jmp LB_3387
LB_3387:
	cmp BYTE [r8+6],0
	jnz LB_3416
	jmp LB_3417
LB_3416:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3417:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 3'(= a35◂ [ a31◂ [ ]] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 3'(= a35◂ [ a31◂ [ ]] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3418
LB_3418
;; rsp=0 , %2159~3'(= a35◂ [ a31◂ [ ]] ) %2142~1'(= r ) %2141~0'(= r ) 
; #22 3'(= a35◂ [ a31◂ [ ]] ) ⊢ 0(<2)◂3'(= a35◂ [ a31◂ [ ]] )
;; rsp=0 , %2160~0(<2)◂3'(= a35◂ [ a31◂ [ ]] ) %2142~1'(= r ) %2141~0'(= r ) 
; ∎ 0(<2)◂3'(= a35◂ [ a31◂ [ ]] )
; .mov_ptn2 0(<2)◂3'(= a35◂ [ a31◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 0(<2)◂3'(= a35◂ [ a31◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3419
LB_3419:
	cmp BYTE [r8+6],0
	jnz LB_3377
	POP_GRM_SCC
	ret
LB_3377:
	RB_GRM
	jmp LB_3422
LB_3421:
	add r14,1 
LB_3422:
	cmp r14,r9
	jge LB_3423
	JZ_SPC BYTE [r13+8+r14], LB_3421
LB_3423
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_3426
	jmp LB_3427
LB_3426:
	jmp LB_3424
LB_3427:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3425
LB_3424:
	add rsp,0
	jmp LB_3420
LB_3425:
	jmp LB_3429
LB_3428:
	add r14,1 
LB_3429:
	cmp r14,r9
	jge LB_3430
	JZ_SPC BYTE [r13+8+r14], LB_3428
LB_3430
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_3433
	jmp LB_3434
LB_3433:
	mov r8,unt_1
	jmp LB_3431
LB_3434:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3435
	cmp BYTE [rdi+1],167
	jnz LB_3435
	cmp BYTE [rdi+2],194
	jnz LB_3435
	cmp BYTE [rdi+3],167
	jnz LB_3435
	jmp LB_3436
LB_3435:
	mov r8,unt_1
	jmp LB_3431
LB_3436:
	add r14,4
	jmp LB_3432
LB_3431:
	add rsp,8
	jmp LB_3420
LB_3432:
	PUSH_GRM
	jmp LB_3440
LB_3439:
	add r14,1 
LB_3440:
	cmp r14,r9
	jge LB_3441
	JZ_SPC BYTE [r13+8+r14], LB_3439
LB_3441
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_3444
	jmp LB_3445
LB_3444:
	jmp LB_3442
LB_3445:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3443
LB_3442:
	add rsp,0
	jmp LB_3438
LB_3443:
	jmp LB_3447
LB_3446:
	add r14,1 
LB_3447:
	cmp r14,r9
	jge LB_3448
	JZ_SPC BYTE [r13+8+r14], LB_3446
LB_3448
	call GRM_247
	cmp BYTE [r8+6],0
	jnz LB_3451
	jmp LB_3452
LB_3451:
	jmp LB_3449
LB_3452:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a32◂ [ ]] ) ⊢ 9'(= a35◂ [ a32◂ [ ]] )
; .mov_ptn 2'(= a35◂ [ a32◂ [ ]] ) ⊢ 9'(= a35◂ [ a32◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3450
LB_3449:
	add rsp,8
	jmp LB_3438
LB_3450:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3453
LB_3453
;; rsp=2 , %2167~1'(= r ) %2166~0'(= r ) %2165~9'(= a35◂ [ a32◂ [ ]] ) %2164~8'(= {| l |} ) 
;; ? 9'(= a35◂ [ a32◂ [ ]] ) ⊢ 0(<2)◂2'(= a32◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3455
	mov r8,QWORD [rdi+8]
;; rsp=2 , %2169~2'(= a32◂ [ ] ) %2167~1'(= r ) %2166~0'(= r ) %2164~8'(= {| l |} ) 
; #176 { 8'(= {| l |} ) 2'(= a32◂ [ ] ) } ⊢ 0(<6)◂{ 8'(= {| l |} ) 2'(= a32◂ [ ] ) }
;; rsp=2 , %2170~0(<6)◂{ 8'(= {| l |} ) 2'(= a32◂ [ ] ) } %2167~1'(= r ) %2166~0'(= r ) 
; #193 0(<6)◂{ 8'(= {| l |} ) 2'(= a32◂ [ ] ) } ⊢ 0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a32◂ [ ] ) }
;; rsp=2 , %2171~0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a32◂ [ ] ) } %2167~1'(= r ) %2166~0'(= r ) 
; #22 0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a32◂ [ ] ) } ⊢ 0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a32◂ [ ] ) }
;; rsp=2 , %2172~0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a32◂ [ ] ) } %2167~1'(= r ) %2166~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a32◂ [ ] ) }
; .mov_ptn2 0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 2'(= a32◂ [ ] ) } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂0(<6)◂{ 8'(= {| l |} ) 0'(= a32◂ [ ] ) } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3454
LB_3455:
;; ?. 9'(= a35◂ [ a32◂ [ ]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=2 , %2168~2'(= a2◂ [ *{ rr{| l |}}] ) %2167~1'(= r ) %2166~0'(= r ) %2164~8'(= {| l |} ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2173~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2167~1'(= r ) %2166~0'(= r ) %2164~8'(= {| l |} ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2174~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2167~1'(= r ) %2166~0'(= r ) %2164~8'(= {| l |} ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3454
LB_3454:
	cmp BYTE [r8+6],0
	jnz LB_3438
	POP_GRM_SCC
	jmp LB_3437
LB_3438:
	RB_GRM
	jmp LB_3458
LB_3457:
	add r14,1 
LB_3458:
	cmp r14,r9
	jge LB_3459
	JZ_SPC BYTE [r13+8+r14], LB_3457
LB_3459
	call GRM_246
	cmp BYTE [r8+6],0
	jnz LB_3462
	jmp LB_3463
LB_3462:
	jmp LB_3460
LB_3463:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_3461
LB_3460:
	add rsp,0
	jmp LB_3456
LB_3461:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3464
LB_3464
;; rsp=0 , %2177~1'(= r ) %2176~0'(= r ) %2175~{ } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2178~1(<2)◂{ } %2177~1'(= r ) %2176~0'(= r ) %2175~{ } 
	jmp LB_3466
LB_3466:
; $ %[ "glb_etr 0.1" ] ⊢ %[ "glb_etr 0.1" ]
;; rsp=0 , %2179~%[ "glb_etr 0.1" ] %2178~1(<2)◂{ } %2177~1'(= r ) %2176~0'(= r ) %2175~{ } 
; #21 { { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
;; rsp=0 , %2180~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } %2175~{ } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
;; rsp=0 , %2181~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } %2175~{ } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
;; rsp=0 , %2182~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } %2175~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 0.1" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	ALC_RCD 2
	mov r9,rax
	ALC_RCD 3
	mov r10,rax
	mov rax,r13
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
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
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3465
LB_3465:
	cmp BYTE [r8+6],0
	jnz LB_3456
	POP_GRM_SCC
	jmp LB_3437
LB_3456:
	POP_GRM_FAIL 
	jmp LB_3437
LB_3437:
	cmp BYTE [r8+6],0
	jnz LB_3467
	jmp LB_3468
LB_3467:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3468:
	mov QWORD [rsp+8*1],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 3'(= a35◂ [ a31◂ [ ]] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 3'(= a35◂ [ a31◂ [ ]] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3469
LB_3469
;; rsp=1 , %2183~3'(= a35◂ [ a31◂ [ ]] ) %2163~1'(= r ) %2162~0'(= r ) %2161~8'(= a35◂ [ *{ }] ) 
; #22 3'(= a35◂ [ a31◂ [ ]] ) ⊢ 0(<2)◂3'(= a35◂ [ a31◂ [ ]] )
;; rsp=1 , %2184~0(<2)◂3'(= a35◂ [ a31◂ [ ]] ) %2163~1'(= r ) %2162~0'(= r ) %2161~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂3'(= a35◂ [ a31◂ [ ]] )
; .mov_ptn2 0(<2)◂3'(= a35◂ [ a31◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 0(<2)◂3'(= a35◂ [ a31◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_3470
LB_3470:
	cmp BYTE [r8+6],0
	jnz LB_3420
	POP_GRM_SCC
	ret
LB_3420:
	RB_GRM
	jmp LB_3473
LB_3472:
	add r14,1 
LB_3473:
	cmp r14,r9
	jge LB_3474
	JZ_SPC BYTE [r13+8+r14], LB_3472
LB_3474
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_3477
	jmp LB_3478
LB_3477:
	mov r8,unt_1
	jmp LB_3475
LB_3478:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3479
	cmp BYTE [rdi+1],167
	jnz LB_3479
	jmp LB_3480
LB_3479:
	mov r8,unt_1
	jmp LB_3475
LB_3480:
	add r14,2
	jmp LB_3476
LB_3475:
	add rsp,0
	jmp LB_3471
LB_3476:
	PUSH_GRM
	jmp LB_3484
LB_3483:
	add r14,1 
LB_3484:
	cmp r14,r9
	jge LB_3485
	JZ_SPC BYTE [r13+8+r14], LB_3483
LB_3485
	call GRM_255
	cmp BYTE [r8+6],0
	jnz LB_3488
	jmp LB_3489
LB_3488:
	jmp LB_3486
LB_3489:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 8'(= a35◂ [ a31◂ [ ]] )
; .mov_ptn 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 8'(= a35◂ [ a31◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3487
LB_3486:
	add rsp,0
	jmp LB_3482
LB_3487:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3490
LB_3490
;; rsp=1 , %2189~1'(= r ) %2188~0'(= r ) %2187~8'(= a35◂ [ a31◂ [ ]] ) 
; #22 8'(= a35◂ [ a31◂ [ ]] ) ⊢ 0(<2)◂8'(= a35◂ [ a31◂ [ ]] )
;; rsp=1 , %2190~0(<2)◂8'(= a35◂ [ a31◂ [ ]] ) %2189~1'(= r ) %2188~0'(= r ) 
; ∎ 0(<2)◂8'(= a35◂ [ a31◂ [ ]] )
; .mov_ptn2 0(<2)◂8'(= a35◂ [ a31◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 0(<2)◂8'(= a35◂ [ a31◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_3491
LB_3491:
	cmp BYTE [r8+6],0
	jnz LB_3482
	POP_GRM_SCC
	jmp LB_3481
LB_3482:
	RB_GRM
	jmp LB_3494
LB_3493:
	add r14,1 
LB_3494:
	cmp r14,r9
	jge LB_3495
	JZ_SPC BYTE [r13+8+r14], LB_3493
LB_3495
	call GRM_245
	cmp BYTE [r8+6],0
	jnz LB_3498
	jmp LB_3499
LB_3498:
	jmp LB_3496
LB_3499:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_3497
LB_3496:
	add rsp,0
	jmp LB_3492
LB_3497:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3500
LB_3500
;; rsp=0 , %2193~1'(= r ) %2192~0'(= r ) %2191~{ } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2194~1(<2)◂{ } %2193~1'(= r ) %2192~0'(= r ) %2191~{ } 
	jmp LB_3502
LB_3502:
; $ %[ "glb_etr 3" ] ⊢ %[ "glb_etr 3" ]
;; rsp=0 , %2195~%[ "glb_etr 3" ] %2194~1(<2)◂{ } %2193~1'(= r ) %2192~0'(= r ) %2191~{ } 
; #21 { { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
;; rsp=0 , %2196~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } %2191~{ } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
;; rsp=0 , %2197~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } %2191~{ } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
;; rsp=0 , %2198~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } %2191~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 3" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	ALC_RCD 2
	mov r9,rax
	ALC_RCD 3
	mov r10,rax
	mov rax,r13
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
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
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3501
LB_3501:
	cmp BYTE [r8+6],0
	jnz LB_3492
	POP_GRM_SCC
	jmp LB_3481
LB_3492:
	POP_GRM_FAIL 
	jmp LB_3481
LB_3481:
	cmp BYTE [r8+6],0
	jnz LB_3503
	jmp LB_3504
LB_3503:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3504:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 3'(= a35◂ [ a31◂ [ ]] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 3'(= a35◂ [ a31◂ [ ]] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3505
LB_3505
;; rsp=0 , %2199~3'(= a35◂ [ a31◂ [ ]] ) %2186~1'(= r ) %2185~0'(= r ) 
; #22 3'(= a35◂ [ a31◂ [ ]] ) ⊢ 0(<2)◂3'(= a35◂ [ a31◂ [ ]] )
;; rsp=0 , %2200~0(<2)◂3'(= a35◂ [ a31◂ [ ]] ) %2186~1'(= r ) %2185~0'(= r ) 
; ∎ 0(<2)◂3'(= a35◂ [ a31◂ [ ]] )
; .mov_ptn2 0(<2)◂3'(= a35◂ [ a31◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 0(<2)◂3'(= a35◂ [ a31◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3506
LB_3506:
	cmp BYTE [r8+6],0
	jnz LB_3471
	POP_GRM_SCC
	ret
LB_3471:
	RB_GRM
	jmp LB_3509
LB_3508:
	add r14,1 
LB_3509:
	cmp r14,r9
	jge LB_3510
	JZ_SPC BYTE [r13+8+r14], LB_3508
LB_3510
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_3513
	jmp LB_3514
LB_3513:
	mov r8,unt_1
	jmp LB_3511
LB_3514:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3515
	cmp BYTE [rdi+1],182
	jnz LB_3515
	jmp LB_3516
LB_3515:
	mov r8,unt_1
	jmp LB_3511
LB_3516:
	add r14,2
	jmp LB_3512
LB_3511:
	add rsp,0
	jmp LB_3507
LB_3512:
	PUSH_GRM
	jmp LB_3520
LB_3519:
	add r14,1 
LB_3520:
	cmp r14,r9
	jge LB_3521
	JZ_SPC BYTE [r13+8+r14], LB_3519
LB_3521
	call GRM_249
	cmp BYTE [r8+6],0
	jnz LB_3524
	jmp LB_3525
LB_3524:
	jmp LB_3522
LB_3525:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a31◂ [ ] ) ⊢ 8'(= a31◂ [ ] )
; .mov_ptn 2'(= a31◂ [ ] ) ⊢ 8'(= a31◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3523
LB_3522:
	add rsp,0
	jmp LB_3518
LB_3523:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3526
LB_3526
;; rsp=1 , %2205~1'(= r ) %2204~0'(= r ) %2203~8'(= a31◂ [ ] ) 
; #193 8'(= a31◂ [ ] ) ⊢ 0(<2)◂8'(= a31◂ [ ] )
;; rsp=1 , %2206~0(<2)◂8'(= a31◂ [ ] ) %2205~1'(= r ) %2204~0'(= r ) 
; #22 0(<2)◂8'(= a31◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a31◂ [ ] )
;; rsp=1 , %2207~0(<2)◂0(<2)◂8'(= a31◂ [ ] ) %2205~1'(= r ) %2204~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a31◂ [ ] )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a31◂ [ ] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a31◂ [ ] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_3527
LB_3527:
	cmp BYTE [r8+6],0
	jnz LB_3518
	POP_GRM_SCC
	jmp LB_3517
LB_3518:
	RB_GRM
	jmp LB_3530
LB_3529:
	add r14,1 
LB_3530:
	cmp r14,r9
	jge LB_3531
	JZ_SPC BYTE [r13+8+r14], LB_3529
LB_3531
	call GRM_245
	cmp BYTE [r8+6],0
	jnz LB_3534
	jmp LB_3535
LB_3534:
	jmp LB_3532
LB_3535:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_3533
LB_3532:
	add rsp,0
	jmp LB_3528
LB_3533:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3536
LB_3536
;; rsp=0 , %2210~1'(= r ) %2209~0'(= r ) %2208~{ } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2211~1(<2)◂{ } %2210~1'(= r ) %2209~0'(= r ) %2208~{ } 
	jmp LB_3538
LB_3538:
; $ %[ "glb_etr 4" ] ⊢ %[ "glb_etr 4" ]
;; rsp=0 , %2212~%[ "glb_etr 4" ] %2211~1(<2)◂{ } %2210~1'(= r ) %2209~0'(= r ) %2208~{ } 
; #21 { { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
;; rsp=0 , %2213~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } %2208~{ } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
;; rsp=0 , %2214~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } %2208~{ } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
;; rsp=0 , %2215~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } %2208~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 4" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	ALC_RCD 2
	mov r9,rax
	ALC_RCD 3
	mov r10,rax
	mov rax,r13
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
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
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3537
LB_3537:
	cmp BYTE [r8+6],0
	jnz LB_3528
	POP_GRM_SCC
	jmp LB_3517
LB_3528:
	POP_GRM_FAIL 
	jmp LB_3517
LB_3517:
	cmp BYTE [r8+6],0
	jnz LB_3539
	jmp LB_3540
LB_3539:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3540:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 3'(= a35◂ [ a31◂ [ ]] )
	mov r10,r9
; .mov_ptn 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 3'(= a35◂ [ a31◂ [ ]] )
	mov rax,r8
	mov r9,rax
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3541
LB_3541
;; rsp=0 , %2216~3'(= a35◂ [ a31◂ [ ]] ) %2202~1'(= r ) %2201~0'(= r ) 
; #22 3'(= a35◂ [ a31◂ [ ]] ) ⊢ 0(<2)◂3'(= a35◂ [ a31◂ [ ]] )
;; rsp=0 , %2217~0(<2)◂3'(= a35◂ [ a31◂ [ ]] ) %2202~1'(= r ) %2201~0'(= r ) 
; ∎ 0(<2)◂3'(= a35◂ [ a31◂ [ ]] )
; .mov_ptn2 0(<2)◂3'(= a35◂ [ a31◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 0(<2)◂3'(= a35◂ [ a31◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3542
LB_3542:
	cmp BYTE [r8+6],0
	jnz LB_3507
	POP_GRM_SCC
	ret
LB_3507:
	POP_GRM_FAIL 
	ret
ETR_245:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_245
	ret
GRM_245:
	PUSH_GRM
	jmp LB_3545
LB_3544:
	add r14,1 
LB_3545:
	cmp r14,r9
	jge LB_3546
	JZ_SPC BYTE [r13+8+r14], LB_3544
LB_3546
	call GRM_222
	cmp BYTE [r8+6],0
	jnz LB_3549
	jmp LB_3550
LB_3549:
	jmp LB_3547
LB_3550:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_3548
LB_3547:
	add rsp,0
	jmp LB_3543
LB_3548:
	jmp LB_3552
LB_3551:
	add r14,1 
LB_3552:
	cmp r14,r9
	jge LB_3553
	JZ_SPC BYTE [r13+8+r14], LB_3551
LB_3553
	call GRM_245
	cmp BYTE [r8+6],0
	jnz LB_3556
	jmp LB_3557
LB_3556:
	jmp LB_3554
LB_3557:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_3555
LB_3554:
	add rsp,0
	jmp LB_3543
LB_3555:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3558
LB_3558
;; rsp=0 , %2221~1'(= r ) %2220~0'(= r ) %2219~{ } %2218~{ } 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2222~0(<2)◂{ } %2221~1'(= r ) %2220~0'(= r ) %2219~{ } %2218~{ } 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_3559
LB_3559:
	cmp BYTE [r8+6],0
	jnz LB_3543
	POP_GRM_SCC
	ret
LB_3543:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3561
LB_3561
;; rsp=0 , %2224~1'(= r ) %2223~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2225~0(<2)◂{ } %2224~1'(= r ) %2223~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_3562
LB_3562:
	cmp BYTE [r8+6],0
	jnz LB_3560
	POP_GRM_SCC
	ret
LB_3560:
	POP_GRM_FAIL 
	ret
ETR_246:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_246
	ret
GRM_246:
	PUSH_GRM
	jmp LB_3565
LB_3564:
	add r14,1 
LB_3565:
	cmp r14,r9
	jge LB_3566
	JZ_SPC BYTE [r13+8+r14], LB_3564
LB_3566
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_3569
	jmp LB_3570
LB_3569:
	mov r8,unt_1
	jmp LB_3567
LB_3570:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3571
	cmp BYTE [rdi+1],136
	jnz LB_3571
	cmp BYTE [rdi+2],142
	jnz LB_3571
	cmp BYTE [rdi+3],226
	jnz LB_3571
	cmp BYTE [rdi+4],136
	jnz LB_3571
	cmp BYTE [rdi+5],142
	jnz LB_3571
	jmp LB_3572
LB_3571:
	mov r8,unt_1
	jmp LB_3567
LB_3572:
	add r14,6
	jmp LB_3568
LB_3567:
	add rsp,0
	jmp LB_3563
LB_3568:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3573
LB_3573
;; rsp=0 , %2227~1'(= r ) %2226~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2228~0(<2)◂{ } %2227~1'(= r ) %2226~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_3574
LB_3574:
	cmp BYTE [r8+6],0
	jnz LB_3563
	POP_GRM_SCC
	ret
LB_3563:
	RB_GRM
	jmp LB_3577
LB_3576:
	add r14,1 
LB_3577:
	cmp r14,r9
	jge LB_3578
	JZ_SPC BYTE [r13+8+r14], LB_3576
LB_3578
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_3581
	jmp LB_3582
LB_3581:
	mov r8,unt_1
	jmp LB_3579
LB_3582:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_3583
	cmp BYTE [rdi+1],167
	jnz LB_3583
	cmp BYTE [rdi+2],194
	jnz LB_3583
	cmp BYTE [rdi+3],167
	jnz LB_3583
	jmp LB_3584
LB_3583:
	mov r8,unt_1
	jmp LB_3579
LB_3584:
	add r14,4
	jmp LB_3580
LB_3579:
	add rsp,0
	jmp LB_3575
LB_3580:
	PUSH_GRM
	jmp LB_3588
LB_3587:
	add r14,1 
LB_3588:
	cmp r14,r9
	jge LB_3589
	JZ_SPC BYTE [r13+8+r14], LB_3587
LB_3589
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_3592
	jmp LB_3593
LB_3592:
	jmp LB_3590
LB_3593:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3591
LB_3590:
	add rsp,0
	jmp LB_3586
LB_3591:
	jmp LB_3595
LB_3594:
	add r14,1 
LB_3595:
	cmp r14,r9
	jge LB_3596
	JZ_SPC BYTE [r13+8+r14], LB_3594
LB_3596
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3599
	jmp LB_3600
LB_3599:
	mov r8,unt_1
	jmp LB_3597
LB_3600:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3601
	jmp LB_3602
LB_3601:
	mov r8,unt_1
	jmp LB_3597
LB_3602:
	add r14,1
	jmp LB_3598
LB_3597:
	add rsp,8
	jmp LB_3586
LB_3598:
	jmp LB_3604
LB_3603:
	add r14,1 
LB_3604:
	cmp r14,r9
	jge LB_3605
	JZ_SPC BYTE [r13+8+r14], LB_3603
LB_3605
	call GRM_189
	cmp BYTE [r8+6],0
	jnz LB_3608
	jmp LB_3609
LB_3608:
	jmp LB_3606
LB_3609:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 9'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 9'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3607
LB_3606:
	add rsp,8
	jmp LB_3586
LB_3607:
	jmp LB_3611
LB_3610:
	add r14,1 
LB_3611:
	cmp r14,r9
	jge LB_3612
	JZ_SPC BYTE [r13+8+r14], LB_3610
LB_3612
	call GRM_246
	cmp BYTE [r8+6],0
	jnz LB_3615
	jmp LB_3616
LB_3615:
	jmp LB_3613
LB_3616:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_3614
LB_3613:
	add rsp,16
	jmp LB_3586
LB_3614:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3617
LB_3617
;; rsp=2 , %2235~1'(= r ) %2234~0'(= r ) %2233~{ } %2232~9'(= a9◂ [ ] ) %2231~8'(= {| l |} ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=2 , %2236~0(<2)◂{ } %2235~1'(= r ) %2234~0'(= r ) %2233~{ } %2232~9'(= a9◂ [ ] ) %2231~8'(= {| l |} ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	add rsp,16
	jmp LB_3618
LB_3618:
	cmp BYTE [r8+6],0
	jnz LB_3586
	POP_GRM_SCC
	jmp LB_3585
LB_3586:
	RB_GRM
	jmp LB_3621
LB_3620:
	add r14,1 
LB_3621:
	cmp r14,r9
	jge LB_3622
	JZ_SPC BYTE [r13+8+r14], LB_3620
LB_3622
	call GRM_246
	cmp BYTE [r8+6],0
	jnz LB_3625
	jmp LB_3626
LB_3625:
	jmp LB_3623
LB_3626:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_3624
LB_3623:
	add rsp,0
	jmp LB_3619
LB_3624:
	jmp LB_3628
LB_3627:
	add r14,1 
LB_3628:
	cmp r14,r9
	jge LB_3629
	JZ_SPC BYTE [r13+8+r14], LB_3627
LB_3629
	call GRM_246
	cmp BYTE [r8+6],0
	jnz LB_3632
	jmp LB_3633
LB_3632:
	jmp LB_3630
LB_3633:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_3631
LB_3630:
	add rsp,0
	jmp LB_3619
LB_3631:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3634
LB_3634
;; rsp=0 , %2240~1'(= r ) %2239~0'(= r ) %2238~{ } %2237~{ } 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2241~0(<2)◂{ } %2240~1'(= r ) %2239~0'(= r ) %2238~{ } %2237~{ } 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_3635
LB_3635:
	cmp BYTE [r8+6],0
	jnz LB_3619
	POP_GRM_SCC
	jmp LB_3585
LB_3619:
	POP_GRM_FAIL 
	jmp LB_3585
LB_3585:
	cmp BYTE [r8+6],0
	jnz LB_3636
	jmp LB_3637
LB_3636:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3637:
	mov QWORD [rsp+8*0],r14
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3638
LB_3638
;; rsp=0 , %2242~{ } %2230~1'(= r ) %2229~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2243~0(<2)◂{ } %2242~{ } %2230~1'(= r ) %2229~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_3639
LB_3639:
	cmp BYTE [r8+6],0
	jnz LB_3575
	POP_GRM_SCC
	ret
LB_3575:
	RB_GRM
	jmp LB_3642
LB_3641:
	add r14,1 
LB_3642:
	cmp r14,r9
	jge LB_3643
	JZ_SPC BYTE [r13+8+r14], LB_3641
LB_3643
	cmp r14,r9
	jge LB_3646
	jmp LB_3647
LB_3646:
	mov r8,unt_1 
	jmp LB_3644
LB_3647:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_3645
LB_3644:
	add rsp,0
	jmp LB_3640
LB_3645:
	jmp LB_3649
LB_3648:
	add r14,1 
LB_3649:
	cmp r14,r9
	jge LB_3650
	JZ_SPC BYTE [r13+8+r14], LB_3648
LB_3650
	call GRM_246
	cmp BYTE [r8+6],0
	jnz LB_3653
	jmp LB_3654
LB_3653:
	jmp LB_3651
LB_3654:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_3652
LB_3651:
	add rsp,8
	jmp LB_3640
LB_3652:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_3655
LB_3655
;; rsp=1 , %2247~1'(= r ) %2246~0'(= r ) %2245~{ } %2244~8'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=1 , %2248~0(<2)◂{ } %2247~1'(= r ) %2246~0'(= r ) %2245~{ } %2244~8'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	add rsp,8
	jmp LB_3656
LB_3656:
	cmp BYTE [r8+6],0
	jnz LB_3640
	POP_GRM_SCC
	ret
LB_3640:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3658
LB_3658
;; rsp=0 , %2250~1'(= r ) %2249~0'(= r ) 
; #22 { } ⊢ 0(<2)◂{ }
;; rsp=0 , %2251~0(<2)◂{ } %2250~1'(= r ) %2249~0'(= r ) 
; ∎ 0(<2)◂{ }
; .mov_ptn2 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
; .mov_ptn 0(<2)◂{ } ⊢ 2'(= a3◂ [ *{ }] )
	mov rax,unt 
	mov rax,unt_0
	mov r8,rax
	jmp LB_3659
LB_3659:
	cmp BYTE [r8+6],0
	jnz LB_3657
	POP_GRM_SCC
	ret
LB_3657:
	POP_GRM_FAIL 
	ret
ETR_247:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_247
	ret
GRM_247:
	PUSH_GRM
	jmp LB_3662
LB_3661:
	add r14,1 
LB_3662:
	cmp r14,r9
	jge LB_3663
	JZ_SPC BYTE [r13+8+r14], LB_3661
LB_3663
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3666
	jmp LB_3667
LB_3666:
	mov r8,unt_1
	jmp LB_3664
LB_3667:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3668
	jmp LB_3669
LB_3668:
	mov r8,unt_1
	jmp LB_3664
LB_3669:
	add r14,1
	jmp LB_3665
LB_3664:
	add rsp,0
	jmp LB_3660
LB_3665:
	jmp LB_3671
LB_3670:
	add r14,1 
LB_3671:
	cmp r14,r9
	jge LB_3672
	JZ_SPC BYTE [r13+8+r14], LB_3670
LB_3672
	call GRM_189
	cmp BYTE [r8+6],0
	jnz LB_3675
	jmp LB_3676
LB_3675:
	jmp LB_3673
LB_3676:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3674
LB_3673:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3674:
	jmp LB_3678
LB_3677:
	add r14,1 
LB_3678:
	cmp r14,r9
	jge LB_3679
	JZ_SPC BYTE [r13+8+r14], LB_3677
LB_3679
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_3682
	jmp LB_3683
LB_3682:
	jmp LB_3680
LB_3683:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3681
LB_3680:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3681:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3684
LB_3684
;; rsp=2 , %2255~1'(= r ) %2254~0'(= r ) %2253~9'(= a35◂ [ *{ }] ) %2252~8'(= a9◂ [ ] ) 
; #169 8'(= a9◂ [ ] ) ⊢ 1(<2)◂8'(= a9◂ [ ] )
;; rsp=2 , %2256~1(<2)◂8'(= a9◂ [ ] ) %2255~1'(= r ) %2254~0'(= r ) %2253~9'(= a35◂ [ *{ }] ) 
; #193 1(<2)◂8'(= a9◂ [ ] ) ⊢ 0(<2)◂1(<2)◂8'(= a9◂ [ ] )
;; rsp=2 , %2257~0(<2)◂1(<2)◂8'(= a9◂ [ ] ) %2255~1'(= r ) %2254~0'(= r ) %2253~9'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 0(<2)◂0(<2)◂1(<2)◂8'(= a9◂ [ ] )
;; rsp=2 , %2258~0(<2)◂0(<2)◂1(<2)◂8'(= a9◂ [ ] ) %2255~1'(= r ) %2254~0'(= r ) %2253~9'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂8'(= a9◂ [ ] )
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a35◂ [ a32◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a35◂ [ a32◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*2]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3685
LB_3685:
	cmp BYTE [r8+6],0
	jnz LB_3660
	POP_GRM_SCC
	ret
LB_3660:
	RB_GRM
	jmp LB_3688
LB_3687:
	add r14,1 
LB_3688:
	cmp r14,r9
	jge LB_3689
	JZ_SPC BYTE [r13+8+r14], LB_3687
LB_3689
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_3692
	jmp LB_3693
LB_3692:
	jmp LB_3690
LB_3693:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3691
LB_3690:
	add rsp,0
	jmp LB_3686
LB_3691:
	jmp LB_3695
LB_3694:
	add r14,1 
LB_3695:
	cmp r14,r9
	jge LB_3696
	JZ_SPC BYTE [r13+8+r14], LB_3694
LB_3696
	call GRM_248
	cmp BYTE [r8+6],0
	jnz LB_3699
	jmp LB_3700
LB_3699:
	jmp LB_3697
LB_3700:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 9'(= a35◂ [ a2◂ [ a31◂ [ ]]] )
; .mov_ptn 2'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 9'(= a35◂ [ a2◂ [ a31◂ [ ]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3698
LB_3697:
	add rsp,8
	jmp LB_3686
LB_3698:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3701
LB_3701
;; rsp=2 , %2262~1'(= r ) %2261~0'(= r ) %2260~9'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) %2259~8'(= a35◂ [ *{ }] ) 
;; ? 9'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a31◂ [ ]] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_3703
	mov r8,QWORD [rdi+8]
;; rsp=2 , %2264~2'(= a2◂ [ a31◂ [ ]] ) %2262~1'(= r ) %2261~0'(= r ) %2259~8'(= a35◂ [ *{ }] ) 
; #170 2'(= a2◂ [ a31◂ [ ]] ) ⊢ 0(<2)◂2'(= a2◂ [ a31◂ [ ]] )
;; rsp=2 , %2265~0(<2)◂2'(= a2◂ [ a31◂ [ ]] ) %2262~1'(= r ) %2261~0'(= r ) %2259~8'(= a35◂ [ *{ }] ) 
; #193 0(<2)◂2'(= a2◂ [ a31◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂2'(= a2◂ [ a31◂ [ ]] )
;; rsp=2 , %2266~0(<2)◂0(<2)◂2'(= a2◂ [ a31◂ [ ]] ) %2262~1'(= r ) %2261~0'(= r ) %2259~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂0(<2)◂2'(= a2◂ [ a31◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂0(<2)◂2'(= a2◂ [ a31◂ [ ]] )
;; rsp=2 , %2267~0(<2)◂0(<2)◂0(<2)◂2'(= a2◂ [ a31◂ [ ]] ) %2262~1'(= r ) %2261~0'(= r ) %2259~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂2'(= a2◂ [ a31◂ [ ]] )
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂2'(= a2◂ [ a31◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a32◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂0'(= a2◂ [ a31◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a32◂ [ ]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3702
LB_3703:
;; ?. 9'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=2 , %2263~2'(= a2◂ [ *{ rr{| l |}}] ) %2262~1'(= r ) %2261~0'(= r ) %2259~8'(= a35◂ [ *{ }] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2268~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2262~1'(= r ) %2261~0'(= r ) %2259~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2269~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2262~1'(= r ) %2261~0'(= r ) %2259~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a32◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a32◂ [ ]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3702
LB_3702:
	cmp BYTE [r8+6],0
	jnz LB_3686
	POP_GRM_SCC
	ret
LB_3686:
	POP_GRM_FAIL 
	ret
ETR_248:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_248
	ret
GRM_248:
	PUSH_GRM
	jmp LB_3706
LB_3705:
	add r14,1 
LB_3706:
	cmp r14,r9
	jge LB_3707
	JZ_SPC BYTE [r13+8+r14], LB_3705
LB_3707
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_3710
	jmp LB_3711
LB_3710:
	jmp LB_3708
LB_3711:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3709
LB_3708:
	add rsp,0
	jmp LB_3704
LB_3709:
	jmp LB_3713
LB_3712:
	add r14,1 
LB_3713:
	cmp r14,r9
	jge LB_3714
	JZ_SPC BYTE [r13+8+r14], LB_3712
LB_3714
	lea rax,[r14+6]
	cmp rax,r9
	jg LB_3717
	jmp LB_3718
LB_3717:
	mov r8,unt_1
	jmp LB_3715
LB_3718:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3719
	cmp BYTE [rdi+1],136
	jnz LB_3719
	cmp BYTE [rdi+2],142
	jnz LB_3719
	cmp BYTE [rdi+3],226
	jnz LB_3719
	cmp BYTE [rdi+4],136
	jnz LB_3719
	cmp BYTE [rdi+5],142
	jnz LB_3719
	jmp LB_3720
LB_3719:
	mov r8,unt_1
	jmp LB_3715
LB_3720:
	add r14,6
	jmp LB_3716
LB_3715:
	add rsp,8
	jmp LB_3704
LB_3716:
	jmp LB_3722
LB_3721:
	add r14,1 
LB_3722:
	cmp r14,r9
	jge LB_3723
	JZ_SPC BYTE [r13+8+r14], LB_3721
LB_3723
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_3726
	jmp LB_3727
LB_3726:
	jmp LB_3724
LB_3727:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 9'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3725
LB_3724:
	add rsp,8
	jmp LB_3704
LB_3725:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3728
LB_3728
;; rsp=2 , %2273~1'(= r ) %2272~0'(= r ) %2271~9'(= a35◂ [ *{ }] ) %2270~8'(= a35◂ [ *{ }] ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2274~1(<2)◂{ } %2273~1'(= r ) %2272~0'(= r ) %2271~9'(= a35◂ [ *{ }] ) %2270~8'(= a35◂ [ *{ }] ) 
; #193 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=2 , %2275~0(<2)◂1(<2)◂{ } %2273~1'(= r ) %2272~0'(= r ) %2271~9'(= a35◂ [ *{ }] ) %2270~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=2 , %2276~0(<2)◂0(<2)◂1(<2)◂{ } %2273~1'(= r ) %2272~0'(= r ) %2271~9'(= a35◂ [ *{ }] ) %2270~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3729
LB_3729:
	cmp BYTE [r8+6],0
	jnz LB_3704
	POP_GRM_SCC
	ret
LB_3704:
	RB_GRM
	jmp LB_3732
LB_3731:
	add r14,1 
LB_3732:
	cmp r14,r9
	jge LB_3733
	JZ_SPC BYTE [r13+8+r14], LB_3731
LB_3733
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_3736
	jmp LB_3737
LB_3736:
	jmp LB_3734
LB_3737:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3735
LB_3734:
	add rsp,0
	jmp LB_3730
LB_3735:
	jmp LB_3739
LB_3738:
	add r14,1 
LB_3739:
	cmp r14,r9
	jge LB_3740
	JZ_SPC BYTE [r13+8+r14], LB_3738
LB_3740
	call GRM_244
	cmp BYTE [r8+6],0
	jnz LB_3743
	jmp LB_3744
LB_3743:
	jmp LB_3741
LB_3744:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 9'(= a35◂ [ a31◂ [ ]] )
; .mov_ptn 2'(= a35◂ [ a31◂ [ ]] ) ⊢ 9'(= a35◂ [ a31◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3742
LB_3741:
	add rsp,8
	jmp LB_3730
LB_3742:
	jmp LB_3746
LB_3745:
	add r14,1 
LB_3746:
	cmp r14,r9
	jge LB_3747
	JZ_SPC BYTE [r13+8+r14], LB_3745
LB_3747
	call GRM_248
	cmp BYTE [r8+6],0
	jnz LB_3750
	jmp LB_3751
LB_3750:
	jmp LB_3748
LB_3751:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 10'(= a35◂ [ a2◂ [ a31◂ [ ]]] )
; .mov_ptn 2'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 10'(= a35◂ [ a2◂ [ a31◂ [ ]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3749
LB_3748:
	add rsp,16
	jmp LB_3730
LB_3749:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_3752
LB_3752
;; rsp=3 , %2281~1'(= r ) %2280~0'(= r ) %2279~10'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) %2278~9'(= a35◂ [ a31◂ [ ]] ) %2277~8'(= a35◂ [ *{ }] ) 
; #194 { 9'(= a35◂ [ a31◂ [ ]] ) 10'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) } ⊢ 2'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 9'(= a35◂ [ a31◂ [ ]] ) 10'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) } ⊢ { 0'(= a35◂ [ a31◂ [ ]] ) 1'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) }
; .mov_ptn 10'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 1'(= a35◂ [ a2◂ [ a31◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*3]
	mov r14,rax
; .mov_ptn 9'(= a35◂ [ a31◂ [ ]] ) ⊢ 0'(= a35◂ [ a31◂ [ ]] )
	mov rax,QWORD [rsp-8+8*4]
	mov r13,rax
	call LB_3340
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=1 , %2282~2'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] ) %2281~1'(= r ) %2280~0'(= r ) %2277~8'(= a35◂ [ *{ }] ) 
;; ? 2'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] ) ⊢ 0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_3754
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
;; rsp=1 , %2285~4'(= a2◂ [ a31◂ [ ]] ) %2284~3'(= a31◂ [ ] ) %2281~1'(= r ) %2280~0'(= r ) %2277~8'(= a35◂ [ *{ }] ) 
; #21 { 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } ⊢ 0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) }
;; rsp=1 , %2286~0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } %2281~1'(= r ) %2280~0'(= r ) %2277~8'(= a35◂ [ *{ }] ) 
; #193 0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) }
;; rsp=1 , %2287~0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } %2281~1'(= r ) %2280~0'(= r ) %2277~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) }
;; rsp=1 , %2288~0(<2)◂0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } %2281~1'(= r ) %2280~0'(= r ) %2277~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂{ 3'(= a31◂ [ ] ) 4'(= a2◂ [ a31◂ [ ]] ) } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,r9
	mov QWORD [r13+8+8*0],rax
	mov rax,r10
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_3753
LB_3754:
;; ?. 2'(= a35◂ [ *{ a31◂ [ ]a2◂ [ a31◂ [ ]]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=1 , %2283~3'(= a2◂ [ *{ rr{| l |}}] ) %2281~1'(= r ) %2280~0'(= r ) %2277~8'(= a35◂ [ *{ }] ) 
; #192 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2289~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2281~1'(= r ) %2280~0'(= r ) %2277~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2290~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2281~1'(= r ) %2280~0'(= r ) %2277~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
; .mov_ptn 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_3753
LB_3753:
	cmp BYTE [r8+6],0
	jnz LB_3730
	POP_GRM_SCC
	ret
LB_3730:
	RB_GRM
	call GRM_246
	cmp BYTE [r8+6],0
	jnz LB_3758
	jmp LB_3759
LB_3758:
	jmp LB_3756
LB_3759:
; .mov_ptn2 2'(= *{ } ) ⊢ { }
; .mov_ptn 2'(= *{ } ) ⊢ { }
	jmp LB_3757
LB_3756:
	add rsp,0
	jmp LB_3755
LB_3757:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3760
LB_3760
;; rsp=0 , %2293~1'(= r ) %2292~0'(= r ) %2291~{ } 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2294~1(<2)◂{ } %2293~1'(= r ) %2292~0'(= r ) %2291~{ } 
	jmp LB_3762
LB_3762:
; $ %[ "glb_etr 7" ] ⊢ %[ "glb_etr 7" ]
;; rsp=0 , %2295~%[ "glb_etr 7" ] %2294~1(<2)◂{ } %2293~1'(= r ) %2292~0'(= r ) %2291~{ } 
; #21 { { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
;; rsp=0 , %2296~0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } %2291~{ } 
; #192 0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
;; rsp=0 , %2297~1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } %2291~{ } 
; #22 1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
;; rsp=0 , %2298~0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } %2291~{ } 
; ∎ 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
; .mov_ptn 0(<2)◂1(<2)◂0(<2)◂{ { 0'(= r ) 1'(= r ) %[ "glb_etr 7" ] } 1(<2)◂{ } } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
	ALC_RCD 2
	mov r9,rax
	ALC_RCD 3
	mov r10,rax
	mov rax,r13
	mov QWORD [r10+8+8*0],rax
	mov rax,r14
	mov QWORD [r10+8+8*1],rax
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
	mov QWORD [r10+8+8*2],rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3761
LB_3761:
	cmp BYTE [r8+6],0
	jnz LB_3755
	POP_GRM_SCC
	ret
LB_3755:
	POP_GRM_FAIL 
	ret
ETR_249:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_249
	ret
GRM_249:
	PUSH_GRM
	jmp LB_3765
LB_3764:
	add r14,1 
LB_3765:
	cmp r14,r9
	jge LB_3766
	JZ_SPC BYTE [r13+8+r14], LB_3764
LB_3766
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3769
	jmp LB_3770
LB_3769:
	mov r8,unt_1
	jmp LB_3767
LB_3770:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_3771
	jmp LB_3772
LB_3771:
	mov r8,unt_1
	jmp LB_3767
LB_3772:
	add r14,1
	jmp LB_3768
LB_3767:
	add rsp,0
	jmp LB_3763
LB_3768:
	jmp LB_3774
LB_3773:
	add r14,1 
LB_3774:
	cmp r14,r9
	jge LB_3775
	JZ_SPC BYTE [r13+8+r14], LB_3773
LB_3775
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3778
	jmp LB_3779
LB_3778:
	mov r8,unt_1
	jmp LB_3776
LB_3779:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_3780
	jmp LB_3781
LB_3780:
	mov r8,unt_1
	jmp LB_3776
LB_3781:
	add r14,1
	jmp LB_3777
LB_3776:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3777:
	jmp LB_3783
LB_3782:
	add r14,1 
LB_3783:
	cmp r14,r9
	jge LB_3784
	JZ_SPC BYTE [r13+8+r14], LB_3782
LB_3784
	call GRM_250
	cmp BYTE [r8+6],0
	jnz LB_3787
	jmp LB_3788
LB_3787:
	jmp LB_3785
LB_3788:
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a34◂ [ ]} ) ⊢ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) }
; .mov_ptn 2'(= *{ {| l |}a34◂ [ ]} ) ⊢ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_3786
LB_3785:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3786:
	jmp LB_3790
LB_3789:
	add r14,1 
LB_3790:
	cmp r14,r9
	jge LB_3791
	JZ_SPC BYTE [r13+8+r14], LB_3789
LB_3791
	call GRM_253
	cmp BYTE [r8+6],0
	jnz LB_3794
	jmp LB_3795
LB_3794:
	jmp LB_3792
LB_3795:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
; .mov_ptn 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3793
LB_3792:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_3793:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_3796
LB_3796
;; rsp=3 , %2302~1'(= r ) %2301~0'(= r ) %2300~10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %2299~{ 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 
; #21 { { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂{ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=3 , %2303~0(<2)◂{ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %2302~1'(= r ) %2301~0'(= r ) 
; #171 0(<2)◂{ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=3 , %2304~5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %2302~1'(= r ) %2301~0'(= r ) 
; #22 5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=3 , %2305~0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %2302~1'(= r ) %2301~0'(= r ) 
; ∎ 0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
; .mov_ptn2 0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 2'(= a3◂ [ a31◂ [ ]] )
; .mov_ptn 0(<2)◂5(<6)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 10'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 2'(= a3◂ [ a31◂ [ ]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],5
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_3797
LB_3797:
	cmp BYTE [r8+6],0
	jnz LB_3763
	POP_GRM_SCC
	ret
LB_3763:
	RB_GRM
	jmp LB_3800
LB_3799:
	add r14,1 
LB_3800:
	cmp r14,r9
	jge LB_3801
	JZ_SPC BYTE [r13+8+r14], LB_3799
LB_3801
	call GRM_250
	cmp BYTE [r8+6],0
	jnz LB_3804
	jmp LB_3805
LB_3804:
	jmp LB_3802
LB_3805:
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a34◂ [ ]} ) ⊢ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) }
; .mov_ptn 2'(= *{ {| l |}a34◂ [ ]} ) ⊢ { 8'(= {| l |} ) 9'(= a34◂ [ ] ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_3803
LB_3802:
	add rsp,0
	jmp LB_3798
LB_3803:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3806
LB_3806
;; rsp=2 , %2308~1'(= r ) %2307~0'(= r ) %2306~{ 8'(= {| l |} ) 9'(= a34◂ [ ] ) } 
; #172 { 8'(= {| l |} ) 9'(= a34◂ [ ] ) } ⊢ 4(<6)◂{ 8'(= {| l |} ) 9'(= a34◂ [ ] ) }
;; rsp=2 , %2309~4(<6)◂{ 8'(= {| l |} ) 9'(= a34◂ [ ] ) } %2308~1'(= r ) %2307~0'(= r ) 
; #22 4(<6)◂{ 8'(= {| l |} ) 9'(= a34◂ [ ] ) } ⊢ 0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a34◂ [ ] ) }
;; rsp=2 , %2310~0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a34◂ [ ] ) } %2308~1'(= r ) %2307~0'(= r ) 
; ∎ 0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a34◂ [ ] ) }
; .mov_ptn2 0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a34◂ [ ] ) } ⊢ 2'(= a3◂ [ a31◂ [ ]] )
; .mov_ptn 0(<2)◂4(<6)◂{ 8'(= {| l |} ) 9'(= a34◂ [ ] ) } ⊢ 2'(= a3◂ [ a31◂ [ ]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],4
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3807
LB_3807:
	cmp BYTE [r8+6],0
	jnz LB_3798
	POP_GRM_SCC
	ret
LB_3798:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3809
LB_3809
;; rsp=0 , %2312~1'(= r ) %2311~0'(= r ) 
	jmp LB_3811
LB_3811:
; $ %[ "dt_etr 0" ] ⊢ %[ "dt_etr 0" ]
;; rsp=0 , %2313~%[ "dt_etr 0" ] %2312~1'(= r ) %2311~0'(= r ) 
; #10 %[ "dt_etr 0" ] ⊢ %[ "dt_etr 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_3812
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_3813
LB_3813:
;; rsp=0 , %2314~%[ "dt_etr 0" ] %2312~1'(= r ) %2311~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2315~1(<2)◂{ } %2314~%[ "dt_etr 0" ] %2312~1'(= r ) %2311~0'(= r ) 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a31◂ [ ]] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ a31◂ [ ]] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_3810
LB_3810:
	cmp BYTE [r8+6],0
	jnz LB_3808
	POP_GRM_SCC
	ret
LB_3808:
	POP_GRM_FAIL 
	ret
ETR_250:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_250
	ret
GRM_250:
	PUSH_GRM
	jmp LB_3816
LB_3815:
	add r14,1 
LB_3816:
	cmp r14,r9
	jge LB_3817
	JZ_SPC BYTE [r13+8+r14], LB_3815
LB_3817
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_3820
	jmp LB_3821
LB_3820:
	jmp LB_3818
LB_3821:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3819
LB_3818:
	add rsp,0
	jmp LB_3814
LB_3819:
	jmp LB_3823
LB_3822:
	add r14,1 
LB_3823:
	cmp r14,r9
	jge LB_3824
	JZ_SPC BYTE [r13+8+r14], LB_3822
LB_3824
	call GRM_251
	cmp BYTE [r8+6],0
	jnz LB_3827
	jmp LB_3828
LB_3827:
	jmp LB_3825
LB_3828:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; .mov_ptn 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3826
LB_3825:
	add rsp,8
	jmp LB_3814
LB_3826:
	jmp LB_3830
LB_3829:
	add r14,1 
LB_3830:
	cmp r14,r9
	jge LB_3831
	JZ_SPC BYTE [r13+8+r14], LB_3829
LB_3831
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3834
	jmp LB_3835
LB_3834:
	mov r8,unt_1
	jmp LB_3832
LB_3835:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_3836
	jmp LB_3837
LB_3836:
	mov r8,unt_1
	jmp LB_3832
LB_3837:
	add r14,1
	jmp LB_3833
LB_3832:
	add rsp,16
	jmp LB_3814
LB_3833:
	jmp LB_3839
LB_3838:
	add r14,1 
LB_3839:
	cmp r14,r9
	jge LB_3840
	JZ_SPC BYTE [r13+8+r14], LB_3838
LB_3840
	call GRM_210
	cmp BYTE [r8+6],0
	jnz LB_3843
	jmp LB_3844
LB_3843:
	jmp LB_3841
LB_3844:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 10'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 10'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3842
LB_3841:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_3842:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_3845
LB_3845
;; rsp=3 , %2320~1'(= r ) %2319~0'(= r ) %2318~10'(= a23◂ [ ] ) %2317~9'(= a2◂ [ {| l |}] ) %2316~8'(= {| l |} ) 
; #164 { 9'(= a2◂ [ {| l |}] ) 10'(= a23◂ [ ] ) } ⊢ 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a23◂ [ ] ) }
;; rsp=3 , %2321~1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a23◂ [ ] ) } %2320~1'(= r ) %2319~0'(= r ) %2316~8'(= {| l |} ) 
; #22 { 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a23◂ [ ] ) } } ⊢ 0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a23◂ [ ] ) } }
;; rsp=3 , %2322~0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a23◂ [ ] ) } } %2320~1'(= r ) %2319~0'(= r ) 
; ∎ 0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a23◂ [ ] ) } }
; .mov_ptn2 0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a23◂ [ ] ) } } ⊢ 2'(= a3◂ [ *{ {| l |}a34◂ [ ]}] )
; .mov_ptn 0(<2)◂{ 8'(= {| l |} ) 1(<2)◂{ 9'(= a2◂ [ {| l |}] ) 10'(= a23◂ [ ] ) } } ⊢ 2'(= a3◂ [ *{ {| l |}a34◂ [ ]}] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r13+8+8*0],rax
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,24
	jmp LB_3846
LB_3846:
	cmp BYTE [r8+6],0
	jnz LB_3814
	POP_GRM_SCC
	ret
LB_3814:
	RB_GRM
	jmp LB_3849
LB_3848:
	add r14,1 
LB_3849:
	cmp r14,r9
	jge LB_3850
	JZ_SPC BYTE [r13+8+r14], LB_3848
LB_3850
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_3853
	jmp LB_3854
LB_3853:
	jmp LB_3851
LB_3854:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3852
LB_3851:
	add rsp,0
	jmp LB_3847
LB_3852:
	jmp LB_3856
LB_3855:
	add r14,1 
LB_3856:
	cmp r14,r9
	jge LB_3857
	JZ_SPC BYTE [r13+8+r14], LB_3855
LB_3857
	call GRM_251
	cmp BYTE [r8+6],0
	jnz LB_3860
	jmp LB_3861
LB_3860:
	jmp LB_3858
LB_3861:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; .mov_ptn 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3859
LB_3858:
	add rsp,8
	jmp LB_3847
LB_3859:
	jmp LB_3863
LB_3862:
	add r14,1 
LB_3863:
	cmp r14,r9
	jge LB_3864
	JZ_SPC BYTE [r13+8+r14], LB_3862
LB_3864
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_3867
	jmp LB_3868
LB_3867:
	jmp LB_3865
LB_3868:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 10'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 10'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3866
LB_3865:
	add rsp,16
	jmp LB_3847
LB_3866:
	jmp LB_3870
LB_3869:
	add r14,1 
LB_3870:
	cmp r14,r9
	jge LB_3871
	JZ_SPC BYTE [r13+8+r14], LB_3869
LB_3871
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3874
	jmp LB_3875
LB_3874:
	mov r8,unt_1
	jmp LB_3872
LB_3875:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3876
	cmp BYTE [rdi+1],136
	jnz LB_3876
	cmp BYTE [rdi+2],144
	jnz LB_3876
	jmp LB_3877
LB_3876:
	mov r8,unt_1
	jmp LB_3872
LB_3877:
	add r14,3
	jmp LB_3873
LB_3872:
	add rsp,24
	jmp LB_3847
LB_3873:
	jmp LB_3879
LB_3878:
	add r14,1 
LB_3879:
	cmp r14,r9
	jge LB_3880
	JZ_SPC BYTE [r13+8+r14], LB_3878
LB_3880
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_3883
	jmp LB_3884
LB_3883:
	jmp LB_3881
LB_3884:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 11'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 11'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3882
LB_3881:
	add rsp,24
	jmp LB_3847
LB_3882:
	jmp LB_3886
LB_3885:
	add r14,1 
LB_3886:
	cmp r14,r9
	jge LB_3887
	JZ_SPC BYTE [r13+8+r14], LB_3885
LB_3887
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3890
	jmp LB_3891
LB_3890:
	mov r8,unt_1
	jmp LB_3888
LB_3891:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_3892
	jmp LB_3893
LB_3892:
	mov r8,unt_1
	jmp LB_3888
LB_3893:
	add r14,1
	jmp LB_3889
LB_3888:
	add rsp,32
	jmp LB_3847
LB_3889:
	jmp LB_3895
LB_3894:
	add r14,1 
LB_3895:
	cmp r14,r9
	jge LB_3896
	JZ_SPC BYTE [r13+8+r14], LB_3894
LB_3896
	call GRM_210
	cmp BYTE [r8+6],0
	jnz LB_3899
	jmp LB_3900
LB_3899:
	jmp LB_3897
LB_3900:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 12'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 12'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3898
LB_3897:
	add rsp,32
	jmp LB_3847
LB_3898:
	jmp LB_3902
LB_3901:
	add r14,1 
LB_3902:
	cmp r14,r9
	jge LB_3903
	JZ_SPC BYTE [r13+8+r14], LB_3901
LB_3903
	call GRM_254
	cmp BYTE [r8+6],0
	jnz LB_3906
	jmp LB_3907
LB_3906:
	jmp LB_3904
LB_3907:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] )
; .mov_ptn 2'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3905
LB_3904:
	add rsp,40
	jmp LB_3847
LB_3905:
	mov QWORD [rsp+8*6],r14
	mov r13,QWORD [rsp+16+8*6]
	mov r14,QWORD [rsp+8*6]
	jmp LB_3908
LB_3908
;; rsp=6 , %2330~1'(= r ) %2329~0'(= r ) %2328~13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %2327~12'(= a23◂ [ ] ) %2326~11'(= {| l |} ) %2325~10'(= a35◂ [ *{ }] ) %2324~9'(= a2◂ [ {| l |}] ) %2323~8'(= {| l |} ) 
; #21 { { 11'(= {| l |} ) 12'(= a23◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ 0(<2)◂{ { 11'(= {| l |} ) 12'(= a23◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
;; rsp=6 , %2331~0(<2)◂{ { 11'(= {| l |} ) 12'(= a23◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } %2330~1'(= r ) %2329~0'(= r ) %2325~10'(= a35◂ [ *{ }] ) %2324~9'(= a2◂ [ {| l |}] ) %2323~8'(= {| l |} ) 
; #165 { 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a23◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } } ⊢ 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a23◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } }
;; rsp=6 , %2332~0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a23◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } } %2330~1'(= r ) %2329~0'(= r ) %2325~10'(= a35◂ [ *{ }] ) %2323~8'(= {| l |} ) 
; #22 { 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a23◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } } } ⊢ 0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a23◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } } }
;; rsp=6 , %2333~0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a23◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } } } %2330~1'(= r ) %2329~0'(= r ) %2325~10'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a23◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } } }
; .mov_ptn2 0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a23◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } } } ⊢ 2'(= a3◂ [ *{ {| l |}a34◂ [ ]}] )
; .mov_ptn 0(<2)◂{ 8'(= {| l |} ) 0(<2)◂{ 9'(= a2◂ [ {| l |}] ) 0(<2)◂{ { 11'(= {| l |} ) 12'(= a23◂ [ ] ) } 13'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } } } ⊢ 2'(= a3◂ [ *{ {| l |}a34◂ [ ]}] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*6]
	mov QWORD [r13+8+8*0],rax
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*5]
	mov QWORD [r14+8+8*0],rax
	ALC_RCD 2
	mov r9,rax
	ALC_RCD 2
	mov r10,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r10+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r10+8+8*1],rax
	mov rax,r10
	mov QWORD [r9+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,48
	jmp LB_3909
LB_3909:
	cmp BYTE [r8+6],0
	jnz LB_3847
	POP_GRM_SCC
	ret
LB_3847:
	POP_GRM_FAIL 
	ret
ETR_251:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_251
	ret
GRM_251:
	PUSH_GRM
	jmp LB_3912
LB_3911:
	add r14,1 
LB_3912:
	cmp r14,r9
	jge LB_3913
	JZ_SPC BYTE [r13+8+r14], LB_3911
LB_3913
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_3916
	jmp LB_3917
LB_3916:
	mov r8,unt_1
	jmp LB_3914
LB_3917:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_3918
	cmp BYTE [rdi+1],151
	jnz LB_3918
	cmp BYTE [rdi+2],130
	jnz LB_3918
	jmp LB_3919
LB_3918:
	mov r8,unt_1
	jmp LB_3914
LB_3919:
	add r14,3
	jmp LB_3915
LB_3914:
	add rsp,0
	jmp LB_3910
LB_3915:
	jmp LB_3921
LB_3920:
	add r14,1 
LB_3921:
	cmp r14,r9
	jge LB_3922
	JZ_SPC BYTE [r13+8+r14], LB_3920
LB_3922
	call GRM_215
	cmp BYTE [r8+6],0
	jnz LB_3925
	jmp LB_3926
LB_3925:
	jmp LB_3923
LB_3926:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3924
LB_3923:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3924:
	jmp LB_3928
LB_3927:
	add r14,1 
LB_3928:
	cmp r14,r9
	jge LB_3929
	JZ_SPC BYTE [r13+8+r14], LB_3927
LB_3929
	call GRM_252
	cmp BYTE [r8+6],0
	jnz LB_3932
	jmp LB_3933
LB_3932:
	jmp LB_3930
LB_3933:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; .mov_ptn 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3931
LB_3930:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3931:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3934
LB_3934
;; rsp=2 , %2337~1'(= r ) %2336~0'(= r ) %2335~9'(= a2◂ [ {| l |}] ) %2334~8'(= {| l |} ) 
; #21 { 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %2338~0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %2337~1'(= r ) %2336~0'(= r ) 
; #22 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %2339~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %2337~1'(= r ) %2336~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3935
LB_3935:
	cmp BYTE [r8+6],0
	jnz LB_3910
	POP_GRM_SCC
	ret
LB_3910:
	RB_GRM
	jmp LB_3938
LB_3937:
	add r14,1 
LB_3938:
	cmp r14,r9
	jge LB_3939
	JZ_SPC BYTE [r13+8+r14], LB_3937
LB_3939
	call GRM_215
	cmp BYTE [r8+6],0
	jnz LB_3942
	jmp LB_3943
LB_3942:
	jmp LB_3940
LB_3943:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3941
LB_3940:
	add rsp,0
	jmp LB_3936
LB_3941:
	jmp LB_3945
LB_3944:
	add r14,1 
LB_3945:
	cmp r14,r9
	jge LB_3946
	JZ_SPC BYTE [r13+8+r14], LB_3944
LB_3946
	call GRM_252
	cmp BYTE [r8+6],0
	jnz LB_3949
	jmp LB_3950
LB_3949:
	jmp LB_3947
LB_3950:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; .mov_ptn 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3948
LB_3947:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3948:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3951
LB_3951
;; rsp=2 , %2343~1'(= r ) %2342~0'(= r ) %2341~9'(= a2◂ [ {| l |}] ) %2340~8'(= {| l |} ) 
; #21 { 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %2344~0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %2343~1'(= r ) %2342~0'(= r ) 
; #22 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %2345~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %2343~1'(= r ) %2342~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3952
LB_3952:
	cmp BYTE [r8+6],0
	jnz LB_3936
	POP_GRM_SCC
	ret
LB_3936:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3954
LB_3954
;; rsp=0 , %2347~1'(= r ) %2346~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2348~1(<2)◂{ } %2347~1'(= r ) %2346~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2349~0(<2)◂1(<2)◂{ } %2347~1'(= r ) %2346~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3955
LB_3955:
	cmp BYTE [r8+6],0
	jnz LB_3953
	POP_GRM_SCC
	ret
LB_3953:
	POP_GRM_FAIL 
	ret
ETR_252:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_252
	ret
GRM_252:
	PUSH_GRM
	jmp LB_3958
LB_3957:
	add r14,1 
LB_3958:
	cmp r14,r9
	jge LB_3959
	JZ_SPC BYTE [r13+8+r14], LB_3957
LB_3959
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3962
	jmp LB_3963
LB_3962:
	mov r8,unt_1
	jmp LB_3960
LB_3963:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_3964
	jmp LB_3965
LB_3964:
	mov r8,unt_1
	jmp LB_3960
LB_3965:
	add r14,1
	jmp LB_3961
LB_3960:
	add rsp,0
	jmp LB_3956
LB_3961:
	jmp LB_3967
LB_3966:
	add r14,1 
LB_3967:
	cmp r14,r9
	jge LB_3968
	JZ_SPC BYTE [r13+8+r14], LB_3966
LB_3968
	call GRM_215
	cmp BYTE [r8+6],0
	jnz LB_3971
	jmp LB_3972
LB_3971:
	jmp LB_3969
LB_3972:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3970
LB_3969:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_3970:
	jmp LB_3974
LB_3973:
	add r14,1 
LB_3974:
	cmp r14,r9
	jge LB_3975
	JZ_SPC BYTE [r13+8+r14], LB_3973
LB_3975
	call GRM_252
	cmp BYTE [r8+6],0
	jnz LB_3978
	jmp LB_3979
LB_3978:
	jmp LB_3976
LB_3979:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
; .mov_ptn 2'(= a2◂ [ {| l |}] ) ⊢ 9'(= a2◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3977
LB_3976:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_3977:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_3980
LB_3980
;; rsp=2 , %2353~1'(= r ) %2352~0'(= r ) %2351~9'(= a2◂ [ {| l |}] ) %2350~8'(= {| l |} ) 
; #21 { 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %2354~0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %2353~1'(= r ) %2352~0'(= r ) 
; #22 0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
;; rsp=2 , %2355~0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } %2353~1'(= r ) %2352~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= {| l |} ) 9'(= a2◂ [ {| l |}] ) } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_3981
LB_3981:
	cmp BYTE [r8+6],0
	jnz LB_3956
	POP_GRM_SCC
	ret
LB_3956:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_3983
LB_3983
;; rsp=0 , %2357~1'(= r ) %2356~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2358~1(<2)◂{ } %2357~1'(= r ) %2356~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2359~0(<2)◂1(<2)◂{ } %2357~1'(= r ) %2356~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ {| l |}]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_3984
LB_3984:
	cmp BYTE [r8+6],0
	jnz LB_3982
	POP_GRM_SCC
	ret
LB_3982:
	POP_GRM_FAIL 
	ret
ETR_253:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_253
	ret
GRM_253:
	PUSH_GRM
	jmp LB_3987
LB_3986:
	add r14,1 
LB_3987:
	cmp r14,r9
	jge LB_3988
	JZ_SPC BYTE [r13+8+r14], LB_3986
LB_3988
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_3991
	jmp LB_3992
LB_3991:
	jmp LB_3989
LB_3992:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_3990
LB_3989:
	add rsp,0
	jmp LB_3985
LB_3990:
	jmp LB_3994
LB_3993:
	add r14,1 
LB_3994:
	cmp r14,r9
	jge LB_3995
	JZ_SPC BYTE [r13+8+r14], LB_3993
LB_3995
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3998
	jmp LB_3999
LB_3998:
	mov r8,unt_1
	jmp LB_3996
LB_3999:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_4000
	jmp LB_4001
LB_4000:
	mov r8,unt_1
	jmp LB_3996
LB_4001:
	add r14,1
	jmp LB_3997
LB_3996:
	add rsp,8
	jmp LB_3985
LB_3997:
	jmp LB_4003
LB_4002:
	add r14,1 
LB_4003:
	cmp r14,r9
	jge LB_4004
	JZ_SPC BYTE [r13+8+r14], LB_4002
LB_4004
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4007
	jmp LB_4008
LB_4007:
	mov r8,unt_1
	jmp LB_4005
LB_4008:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_4009
	jmp LB_4010
LB_4009:
	mov r8,unt_1
	jmp LB_4005
LB_4010:
	add r14,1
	jmp LB_4006
LB_4005:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4006:
	jmp LB_4012
LB_4011:
	add r14,1 
LB_4012:
	cmp r14,r9
	jge LB_4013
	JZ_SPC BYTE [r13+8+r14], LB_4011
LB_4013
	call GRM_250
	cmp BYTE [r8+6],0
	jnz LB_4016
	jmp LB_4017
LB_4016:
	jmp LB_4014
LB_4017:
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a34◂ [ ]} ) ⊢ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) }
; .mov_ptn 2'(= *{ {| l |}a34◂ [ ]} ) ⊢ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_4015
LB_4014:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4015:
	jmp LB_4019
LB_4018:
	add r14,1 
LB_4019:
	cmp r14,r9
	jge LB_4020
	JZ_SPC BYTE [r13+8+r14], LB_4018
LB_4020
	call GRM_253
	cmp BYTE [r8+6],0
	jnz LB_4023
	jmp LB_4024
LB_4023:
	jmp LB_4021
LB_4024:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
; .mov_ptn 2'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) ⊢ 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4022
LB_4021:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_4022:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_4025
LB_4025
;; rsp=4 , %2364~1'(= r ) %2363~0'(= r ) %2362~11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) %2361~{ 9'(= {| l |} ) 10'(= a34◂ [ ] ) } %2360~8'(= a35◂ [ *{ }] ) 
; #21 { { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=4 , %2365~0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %2364~1'(= r ) %2363~0'(= r ) %2360~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
;; rsp=4 , %2366~0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } %2364~1'(= r ) %2363~0'(= r ) %2360~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a34◂ [ ]}]] )
; .mov_ptn 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a34◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a34◂ [ ]}] ) } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a34◂ [ ]}]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,32
	jmp LB_4026
LB_4026:
	cmp BYTE [r8+6],0
	jnz LB_3985
	POP_GRM_SCC
	ret
LB_3985:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4028
LB_4028
;; rsp=0 , %2368~1'(= r ) %2367~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2369~1(<2)◂{ } %2368~1'(= r ) %2367~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2370~0(<2)◂1(<2)◂{ } %2368~1'(= r ) %2367~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a34◂ [ ]}]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a34◂ [ ]}]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4029
LB_4029:
	cmp BYTE [r8+6],0
	jnz LB_4027
	POP_GRM_SCC
	ret
LB_4027:
	POP_GRM_FAIL 
	ret
ETR_254:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_254
	ret
GRM_254:
	PUSH_GRM
	jmp LB_4032
LB_4031:
	add r14,1 
LB_4032:
	cmp r14,r9
	jge LB_4033
	JZ_SPC BYTE [r13+8+r14], LB_4031
LB_4033
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_4036
	jmp LB_4037
LB_4036:
	jmp LB_4034
LB_4037:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4035
LB_4034:
	add rsp,0
	jmp LB_4030
LB_4035:
	jmp LB_4039
LB_4038:
	add r14,1 
LB_4039:
	cmp r14,r9
	jge LB_4040
	JZ_SPC BYTE [r13+8+r14], LB_4038
LB_4040
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4043
	jmp LB_4044
LB_4043:
	mov r8,unt_1
	jmp LB_4041
LB_4044:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4045
	cmp BYTE [rdi+1],136
	jnz LB_4045
	cmp BYTE [rdi+2],144
	jnz LB_4045
	jmp LB_4046
LB_4045:
	mov r8,unt_1
	jmp LB_4041
LB_4046:
	add r14,3
	jmp LB_4042
LB_4041:
	add rsp,8
	jmp LB_4030
LB_4042:
	jmp LB_4048
LB_4047:
	add r14,1 
LB_4048:
	cmp r14,r9
	jge LB_4049
	JZ_SPC BYTE [r13+8+r14], LB_4047
LB_4049
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_4052
	jmp LB_4053
LB_4052:
	jmp LB_4050
LB_4053:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 9'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4051
LB_4050:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4051:
	jmp LB_4055
LB_4054:
	add r14,1 
LB_4055:
	cmp r14,r9
	jge LB_4056
	JZ_SPC BYTE [r13+8+r14], LB_4054
LB_4056
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4059
	jmp LB_4060
LB_4059:
	mov r8,unt_1
	jmp LB_4057
LB_4060:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_4061
	jmp LB_4062
LB_4061:
	mov r8,unt_1
	jmp LB_4057
LB_4062:
	add r14,1
	jmp LB_4058
LB_4057:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4058:
	jmp LB_4064
LB_4063:
	add r14,1 
LB_4064:
	cmp r14,r9
	jge LB_4065
	JZ_SPC BYTE [r13+8+r14], LB_4063
LB_4065
	call GRM_210
	cmp BYTE [r8+6],0
	jnz LB_4068
	jmp LB_4069
LB_4068:
	jmp LB_4066
LB_4069:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 10'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 10'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4067
LB_4066:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4067:
	jmp LB_4071
LB_4070:
	add r14,1 
LB_4071:
	cmp r14,r9
	jge LB_4072
	JZ_SPC BYTE [r13+8+r14], LB_4070
LB_4072
	call GRM_254
	cmp BYTE [r8+6],0
	jnz LB_4075
	jmp LB_4076
LB_4075:
	jmp LB_4073
LB_4076:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 11'(= a2◂ [ *{ {| l |}a23◂ [ ]}] )
; .mov_ptn 2'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) ⊢ 11'(= a2◂ [ *{ {| l |}a23◂ [ ]}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4074
LB_4073:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_4074:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_4077
LB_4077
;; rsp=4 , %2376~1'(= r ) %2375~0'(= r ) %2374~11'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) %2373~10'(= a23◂ [ ] ) %2372~9'(= {| l |} ) %2371~8'(= a35◂ [ *{ }] ) 
; #21 { { 9'(= {| l |} ) 10'(= a23◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a23◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
;; rsp=4 , %2377~0(<2)◂{ { 9'(= {| l |} ) 10'(= a23◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } %2376~1'(= r ) %2375~0'(= r ) %2371~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂{ { 9'(= {| l |} ) 10'(= a23◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a23◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
;; rsp=4 , %2378~0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a23◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } %2376~1'(= r ) %2375~0'(= r ) %2371~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a23◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a23◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a23◂ [ ]}]] )
; .mov_ptn 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a23◂ [ ] ) } 11'(= a2◂ [ *{ {| l |}a23◂ [ ]}] ) } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a23◂ [ ]}]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,32
	jmp LB_4078
LB_4078:
	cmp BYTE [r8+6],0
	jnz LB_4030
	POP_GRM_SCC
	ret
LB_4030:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4080
LB_4080
;; rsp=0 , %2380~1'(= r ) %2379~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2381~1(<2)◂{ } %2380~1'(= r ) %2379~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2382~0(<2)◂1(<2)◂{ } %2380~1'(= r ) %2379~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a23◂ [ ]}]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a23◂ [ ]}]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4081
LB_4081:
	cmp BYTE [r8+6],0
	jnz LB_4079
	POP_GRM_SCC
	ret
LB_4079:
	POP_GRM_FAIL 
	ret
ETR_255:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_255
	ret
GRM_255:
	PUSH_GRM
	jmp LB_4084
LB_4083:
	add r14,1 
LB_4084:
	cmp r14,r9
	jge LB_4085
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4083
LB_4085
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_4088
	jmp LB_4089
LB_4088:
	jmp LB_4086
LB_4089:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4087
LB_4086:
	add rsp,0
	jmp LB_4082
LB_4087:
	jmp LB_4091
LB_4090:
	add r14,1 
LB_4091:
	cmp r14,r9
	jge LB_4092
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4090
LB_4092
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4095
	jmp LB_4096
LB_4095:
	mov r8,unt_1
	jmp LB_4093
LB_4096:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_4097
	jmp LB_4098
LB_4097:
	mov r8,unt_1
	jmp LB_4093
LB_4098:
	add r14,1
	jmp LB_4094
LB_4093:
	add rsp,8
	jmp LB_4082
LB_4094:
	jmp LB_4100
LB_4099:
	add r14,1 
LB_4100:
	cmp r14,r9
	jge LB_4101
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4099
LB_4101
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4104
	jmp LB_4105
LB_4104:
	mov r8,unt_1
	jmp LB_4102
LB_4105:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_4106
	jmp LB_4107
LB_4106:
	mov r8,unt_1
	jmp LB_4102
LB_4107:
	add r14,1
	jmp LB_4103
LB_4102:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4103:
	jmp LB_4109
LB_4108:
	add r14,1 
LB_4109:
	cmp r14,r9
	jge LB_4110
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4108
LB_4110
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_4113
	jmp LB_4114
LB_4113:
	jmp LB_4111
LB_4114:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 9'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4112
LB_4111:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4112:
	jmp LB_4116
LB_4115:
	add r14,1 
LB_4116:
	cmp r14,r9
	jge LB_4117
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4115
LB_4117
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_4120
	jmp LB_4121
LB_4120:
	jmp LB_4118
LB_4121:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 10'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 10'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4119
LB_4118:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4119:
	jmp LB_4123
LB_4122:
	add r14,1 
LB_4123:
	cmp r14,r9
	jge LB_4124
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4122
LB_4124
	call GRM_257
	cmp BYTE [r8+6],0
	jnz LB_4127
	jmp LB_4128
LB_4127:
	jmp LB_4125
LB_4128:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a3◂ [ a23◂ [ ]] ) ⊢ 11'(= a3◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a3◂ [ a23◂ [ ]] ) ⊢ 11'(= a3◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4126
LB_4125:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_4126:
	jmp LB_4130
LB_4129:
	add r14,1 
LB_4130:
	cmp r14,r9
	jge LB_4131
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4129
LB_4131
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4134
	jmp LB_4135
LB_4134:
	mov r8,unt_1
	jmp LB_4132
LB_4135:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4136
	jmp LB_4137
LB_4136:
	mov r8,unt_1
	jmp LB_4132
LB_4137:
	add r14,1
	jmp LB_4133
LB_4132:
	add rsp,32
	POP_GRM_FAIL
	ret
LB_4133:
	jmp LB_4139
LB_4138:
	add r14,1 
LB_4139:
	cmp r14,r9
	jge LB_4140
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4138
LB_4140
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_4143
	jmp LB_4144
LB_4143:
	jmp LB_4141
LB_4144:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4142
LB_4141:
	add rsp,32
	POP_GRM_FAIL
	ret
LB_4142:
	jmp LB_4146
LB_4145:
	add r14,1 
LB_4146:
	cmp r14,r9
	jge LB_4147
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4145
LB_4147
	call GRM_256
	cmp BYTE [r8+6],0
	jnz LB_4150
	jmp LB_4151
LB_4150:
	jmp LB_4148
LB_4151:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 13'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] )
; .mov_ptn 2'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 13'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4149
LB_4148:
	add rsp,40
	POP_GRM_FAIL
	ret
LB_4149:
	mov QWORD [rsp+8*6],r14
	mov r13,QWORD [rsp+16+8*6]
	mov r14,QWORD [rsp+8*6]
	jmp LB_4152
LB_4152
;; rsp=6 , %2390~1'(= r ) %2389~0'(= r ) %2388~13'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) %2387~12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
;; ? 13'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0(<2)◂2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4154
	mov r8,QWORD [rdi+8]
;; rsp=6 , %2392~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %2390~1'(= r ) %2389~0'(= r ) %2387~12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
;; ? 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_4155
	mov r9,QWORD [rdi+8]
;; rsp=6 , %2394~3'(= a17◂ [ a9◂ [ ]{| l |}] ) %2392~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %2390~1'(= r ) %2389~0'(= r ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
; #21 { { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=6 , %2395~0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } %2390~1'(= r ) %2389~0'(= r ) %2383~8'(= a35◂ [ *{ }] ) 
; #173 0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=6 , %2396~3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } %2390~1'(= r ) %2389~0'(= r ) %2383~8'(= a35◂ [ *{ }] ) 
; #193 3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=6 , %2397~0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } %2390~1'(= r ) %2389~0'(= r ) %2383~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=6 , %2398~0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } %2390~1'(= r ) %2389~0'(= r ) %2383~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂3(<6)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 3'(= a17◂ [ a9◂ [ ]{| l |}] ) } 0'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	ALC_RCD 2
	mov r14,rax
	ALC_RCD 4
	mov r10,rax
	mov rax,QWORD [rsp-8+8*5]
	mov QWORD [r10+8+8*0],rax
	mov rax,QWORD [rsp-8+8*4]
	mov QWORD [r10+8+8*1],rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r10+8+8*2],rax
	mov rax,r9
	mov QWORD [r10+8+8*3],rax
	mov rax,r10
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],3
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,48
	jmp LB_4153
LB_4155:
;; ?. 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=6 , %2393~3'(= a2◂ [ *{ rr{| l |}}] ) %2392~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %2390~1'(= r ) %2389~0'(= r ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
; #192 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=6 , %2399~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2392~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %2390~1'(= r ) %2389~0'(= r ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=6 , %2400~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2392~2'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %2390~1'(= r ) %2389~0'(= r ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,48
	jmp LB_4153
LB_4154:
;; ?. 13'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=6 , %2391~2'(= a2◂ [ *{ rr{| l |}}] ) %2390~1'(= r ) %2389~0'(= r ) %2387~12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
;; ? 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂3'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_4156
	mov r9,QWORD [rdi+8]
;; rsp=6 , %2402~3'(= a17◂ [ a9◂ [ ]{| l |}] ) %2391~2'(= a2◂ [ *{ rr{| l |}}] ) %2390~1'(= r ) %2389~0'(= r ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=6 , %2403~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2402~3'(= a17◂ [ a9◂ [ ]{| l |}] ) %2390~1'(= r ) %2389~0'(= r ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=6 , %2404~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2402~3'(= a17◂ [ a9◂ [ ]{| l |}] ) %2390~1'(= r ) %2389~0'(= r ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,48
	jmp LB_4153
LB_4156:
;; ?. 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=6 , %2401~3'(= a2◂ [ *{ rr{| l |}}] ) %2391~2'(= a2◂ [ *{ rr{| l |}}] ) %2390~1'(= r ) %2389~0'(= r ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
; #53 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ 2'(= a2◂ [ *{ rr{| l |}}] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 2'(= a2◂ [ *{ rr{| l |}}] ) 3'(= a2◂ [ *{ rr{| l |}}] ) } ⊢ { 0'(= a2◂ [ *{ rr{| l |}}] ) 1'(= a2◂ [ *{ rr{| l |}}] ) }
; .mov_ptn 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r9
	mov r14,rax
; .mov_ptn 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0'(= a2◂ [ *{ rr{| l |}}] )
	mov rax,r8
	mov r13,rax
	call LB_1600
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=4 , %2405~2'(= a2◂ [ *{ rr{| l |}}] ) %2390~1'(= r ) %2389~0'(= r ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2406~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2390~1'(= r ) %2389~0'(= r ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2407~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2390~1'(= r ) %2389~0'(= r ) %2386~11'(= a3◂ [ a23◂ [ ]] ) %2385~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2384~9'(= {| l |} ) %2383~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,32
	jmp LB_4153
LB_4153:
	cmp BYTE [r8+6],0
	jnz LB_4082
	POP_GRM_SCC
	ret
LB_4082:
	RB_GRM
	jmp LB_4159
LB_4158:
	add r14,1 
LB_4159:
	cmp r14,r9
	jge LB_4160
	JZ_SPC BYTE [r13+8+r14], LB_4158
LB_4160
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_4163
	jmp LB_4164
LB_4163:
	jmp LB_4161
LB_4164:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4162
LB_4161:
	add rsp,0
	jmp LB_4157
LB_4162:
	jmp LB_4166
LB_4165:
	add r14,1 
LB_4166:
	cmp r14,r9
	jge LB_4167
	JZ_SPC BYTE [r13+8+r14], LB_4165
LB_4167
	call GRM_258
	cmp BYTE [r8+6],0
	jnz LB_4170
	jmp LB_4171
LB_4170:
	jmp LB_4168
LB_4171:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a33◂ [ ]] ) ⊢ 9'(= a35◂ [ a33◂ [ ]] )
; .mov_ptn 2'(= a35◂ [ a33◂ [ ]] ) ⊢ 9'(= a35◂ [ a33◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4169
LB_4168:
	add rsp,8
	jmp LB_4157
LB_4169:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4172
LB_4172
;; rsp=2 , %2411~1'(= r ) %2410~0'(= r ) %2409~9'(= a35◂ [ a33◂ [ ]] ) %2408~8'(= {| l |} ) 
;; ? 9'(= a35◂ [ a33◂ [ ]] ) ⊢ 0(<2)◂2'(= a33◂ [ ] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4174
	mov r8,QWORD [rdi+8]
;; rsp=2 , %2413~2'(= a33◂ [ ] ) %2411~1'(= r ) %2410~0'(= r ) %2408~8'(= {| l |} ) 
; #174 { 8'(= {| l |} ) 2'(= a33◂ [ ] ) } ⊢ 2(<6)◂{ 8'(= {| l |} ) 2'(= a33◂ [ ] ) }
;; rsp=2 , %2414~2(<6)◂{ 8'(= {| l |} ) 2'(= a33◂ [ ] ) } %2411~1'(= r ) %2410~0'(= r ) 
; #193 2(<6)◂{ 8'(= {| l |} ) 2'(= a33◂ [ ] ) } ⊢ 0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a33◂ [ ] ) }
;; rsp=2 , %2415~0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a33◂ [ ] ) } %2411~1'(= r ) %2410~0'(= r ) 
; #22 0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a33◂ [ ] ) } ⊢ 0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a33◂ [ ] ) }
;; rsp=2 , %2416~0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a33◂ [ ] ) } %2411~1'(= r ) %2410~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a33◂ [ ] ) }
; .mov_ptn2 0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 2'(= a33◂ [ ] ) } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂2(<6)◂{ 8'(= {| l |} ) 0'(= a33◂ [ ] ) } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov BYTE [rax+6],2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_4173
LB_4174:
;; ?. 9'(= a35◂ [ a33◂ [ ]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=2 , %2412~2'(= a2◂ [ *{ rr{| l |}}] ) %2411~1'(= r ) %2410~0'(= r ) %2408~8'(= {| l |} ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2417~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2411~1'(= r ) %2410~0'(= r ) %2408~8'(= {| l |} ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=2 , %2418~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2411~1'(= r ) %2410~0'(= r ) %2408~8'(= {| l |} ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_4173
LB_4173:
	cmp BYTE [r8+6],0
	jnz LB_4157
	POP_GRM_SCC
	ret
LB_4157:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4176
LB_4176
;; rsp=0 , %2420~1'(= r ) %2419~0'(= r ) 
	jmp LB_4178
LB_4178:
; $ %[ "lc_etr_body 0" ] ⊢ %[ "lc_etr_body 0" ]
;; rsp=0 , %2421~%[ "lc_etr_body 0" ] %2420~1'(= r ) %2419~0'(= r ) 
; #10 %[ "lc_etr_body 0" ] ⊢ %[ "lc_etr_body 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_4179
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4180
LB_4180:
;; rsp=0 , %2422~%[ "lc_etr_body 0" ] %2420~1'(= r ) %2419~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2423~1(<2)◂{ } %2422~%[ "lc_etr_body 0" ] %2420~1'(= r ) %2419~0'(= r ) 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
; .mov_ptn 1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a31◂ [ ]]] )
	mov rax,unt 
	mov rax,unt_1
	mov r8,rax
	jmp LB_4177
LB_4177:
	cmp BYTE [r8+6],0
	jnz LB_4175
	POP_GRM_SCC
	ret
LB_4175:
	POP_GRM_FAIL 
	ret
ETR_256:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_256
	ret
GRM_256:
	PUSH_GRM
	jmp LB_4183
LB_4182:
	add r14,1 
LB_4183:
	cmp r14,r9
	jge LB_4184
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4182
LB_4184
	call GRM_217
	cmp BYTE [r8+6],0
	jnz LB_4187
	jmp LB_4188
LB_4187:
	jmp LB_4185
LB_4188:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
; .mov_ptn 2'(= a35◂ [ *{ }] ) ⊢ 8'(= a35◂ [ *{ }] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4186
LB_4185:
	add rsp,0
	jmp LB_4181
LB_4186:
	jmp LB_4190
LB_4189:
	add r14,1 
LB_4190:
	cmp r14,r9
	jge LB_4191
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4189
LB_4191
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4194
	jmp LB_4195
LB_4194:
	mov r8,unt_1
	jmp LB_4192
LB_4195:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_4196
	jmp LB_4197
LB_4196:
	mov r8,unt_1
	jmp LB_4192
LB_4197:
	add r14,1
	jmp LB_4193
LB_4192:
	add rsp,8
	jmp LB_4181
LB_4193:
	jmp LB_4199
LB_4198:
	add r14,1 
LB_4199:
	cmp r14,r9
	jge LB_4200
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4198
LB_4200
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4203
	jmp LB_4204
LB_4203:
	mov r8,unt_1
	jmp LB_4201
LB_4204:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_4205
	jmp LB_4206
LB_4205:
	mov r8,unt_1
	jmp LB_4201
LB_4206:
	add r14,1
	jmp LB_4202
LB_4201:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4202:
	jmp LB_4208
LB_4207:
	add r14,1 
LB_4208:
	cmp r14,r9
	jge LB_4209
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4207
LB_4209
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_4212
	jmp LB_4213
LB_4212:
	jmp LB_4210
LB_4213:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 9'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 9'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4211
LB_4210:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4211:
	jmp LB_4215
LB_4214:
	add r14,1 
LB_4215:
	cmp r14,r9
	jge LB_4216
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4214
LB_4216
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_4219
	jmp LB_4220
LB_4219:
	jmp LB_4217
LB_4220:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 10'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 10'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4218
LB_4217:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4218:
	jmp LB_4222
LB_4221:
	add r14,1 
LB_4222:
	cmp r14,r9
	jge LB_4223
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4221
LB_4223
	call GRM_257
	cmp BYTE [r8+6],0
	jnz LB_4226
	jmp LB_4227
LB_4226:
	jmp LB_4224
LB_4227:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a3◂ [ a23◂ [ ]] ) ⊢ 11'(= a3◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a3◂ [ a23◂ [ ]] ) ⊢ 11'(= a3◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4225
LB_4224:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_4225:
	jmp LB_4229
LB_4228:
	add r14,1 
LB_4229:
	cmp r14,r9
	jge LB_4230
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4228
LB_4230
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4233
	jmp LB_4234
LB_4233:
	mov r8,unt_1
	jmp LB_4231
LB_4234:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4235
	jmp LB_4236
LB_4235:
	mov r8,unt_1
	jmp LB_4231
LB_4236:
	add r14,1
	jmp LB_4232
LB_4231:
	add rsp,32
	POP_GRM_FAIL
	ret
LB_4232:
	jmp LB_4238
LB_4237:
	add r14,1 
LB_4238:
	cmp r14,r9
	jge LB_4239
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4237
LB_4239
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_4242
	jmp LB_4243
LB_4242:
	jmp LB_4240
LB_4243:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4241
LB_4240:
	add rsp,32
	POP_GRM_FAIL
	ret
LB_4241:
	jmp LB_4245
LB_4244:
	add r14,1 
LB_4245:
	cmp r14,r9
	jge LB_4246
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4244
LB_4246
	call GRM_256
	cmp BYTE [r8+6],0
	jnz LB_4249
	jmp LB_4250
LB_4249:
	jmp LB_4247
LB_4250:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 13'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] )
; .mov_ptn 2'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 13'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4248
LB_4247:
	add rsp,40
	POP_GRM_FAIL
	ret
LB_4248:
	mov QWORD [rsp+8*6],r14
	mov r13,QWORD [rsp+16+8*6]
	mov r14,QWORD [rsp+8*6]
	jmp LB_4251
LB_4251
;; rsp=6 , %2431~1'(= r ) %2430~0'(= r ) %2429~13'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) %2428~12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %2427~11'(= a3◂ [ a23◂ [ ]] ) %2426~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2425~9'(= {| l |} ) %2424~8'(= a35◂ [ *{ }] ) 
; #194 { 13'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 13'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) } ⊢ { 0'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn 12'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*4]
	mov r14,rax
; .mov_ptn 13'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] ) ⊢ 0'(= a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,QWORD [rsp-8+8*3]
	mov r13,rax
	call LB_4253
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,32
;; rsp=4 , %2432~2'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] ) %2431~1'(= r ) %2430~0'(= r ) %2427~11'(= a3◂ [ a23◂ [ ]] ) %2426~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2425~9'(= {| l |} ) %2424~8'(= a35◂ [ *{ }] ) 
;; ? 2'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 0(<2)◂{ 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) }
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_4257
	mov r9, QWORD [r8+8]
	mov r10, QWORD [r8+16]
;; rsp=4 , %2435~4'(= a17◂ [ a9◂ [ ]{| l |}] ) %2434~3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) %2431~1'(= r ) %2430~0'(= r ) %2427~11'(= a3◂ [ a23◂ [ ]] ) %2426~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2425~9'(= {| l |} ) %2424~8'(= a35◂ [ *{ }] ) 
; #21 { { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=4 , %2436~0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } %2431~1'(= r ) %2430~0'(= r ) %2424~8'(= a35◂ [ *{ }] ) 
; #193 0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=4 , %2437~0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } %2431~1'(= r ) %2430~0'(= r ) %2424~8'(= a35◂ [ *{ }] ) 
; #22 0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=4 , %2438~0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } %2431~1'(= r ) %2430~0'(= r ) %2424~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂0(<2)◂0(<2)◂{ { 9'(= {| l |} ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a3◂ [ a23◂ [ ]] ) 4'(= a17◂ [ a9◂ [ ]{| l |}] ) } 3'(= a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 4
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*1],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r14+8+8*2],rax
	mov rax,r10
	mov QWORD [r14+8+8*3],rax
	mov rax,r14
	mov QWORD [r13+8+8*0],rax
	mov rax,r9
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,32
	jmp LB_4252
LB_4257:
;; ?. 2'(= a35◂ [ *{ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]a17◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
	mov r9,QWORD [rdi+8]
;; rsp=4 , %2433~3'(= a2◂ [ *{ rr{| l |}}] ) %2431~1'(= r ) %2430~0'(= r ) %2427~11'(= a3◂ [ a23◂ [ ]] ) %2426~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2425~9'(= {| l |} ) %2424~8'(= a35◂ [ *{ }] ) 
; #192 3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2439~1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2431~1'(= r ) %2430~0'(= r ) %2427~11'(= a3◂ [ a23◂ [ ]] ) %2426~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2425~9'(= {| l |} ) %2424~8'(= a35◂ [ *{ }] ) 
; #22 1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=4 , %2440~0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) %2431~1'(= r ) %2430~0'(= r ) %2427~11'(= a3◂ [ a23◂ [ ]] ) %2426~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2425~9'(= {| l |} ) %2424~8'(= a35◂ [ *{ }] ) 
; ∎ 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂1(<2)◂3'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	mov rax,r9
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,32
	jmp LB_4252
LB_4252:
	cmp BYTE [r8+6],0
	jnz LB_4181
	POP_GRM_SCC
	ret
LB_4181:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4259
LB_4259
;; rsp=0 , %2442~1'(= r ) %2441~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2443~1(<2)◂{ } %2442~1'(= r ) %2441~0'(= r ) 
; #193 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2444~0(<2)◂1(<2)◂{ } %2442~1'(= r ) %2441~0'(= r ) 
; #22 0(<2)◂1(<2)◂{ } ⊢ 0(<2)◂0(<2)◂1(<2)◂{ }
;; rsp=0 , %2445~0(<2)◂0(<2)◂1(<2)◂{ } %2442~1'(= r ) %2441~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ *{ {| l |}a8◂ [ a13◂ [ {| l |}]]a3◂ [ a23◂ [ ]]a17◂ [ a9◂ [ ]{| l |}]}]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4260
LB_4260:
	cmp BYTE [r8+6],0
	jnz LB_4258
	POP_GRM_SCC
	ret
LB_4258:
	POP_GRM_FAIL 
	ret
ETR_257:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_257
	ret
GRM_257:
	PUSH_GRM
	jmp LB_4263
LB_4262:
	add r14,1 
LB_4263:
	cmp r14,r9
	jge LB_4264
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4262
LB_4264
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4267
	jmp LB_4268
LB_4267:
	mov r8,unt_1
	jmp LB_4265
LB_4268:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_4269
	jmp LB_4270
LB_4269:
	mov r8,unt_1
	jmp LB_4265
LB_4270:
	add r14,1
	jmp LB_4266
LB_4265:
	add rsp,0
	jmp LB_4261
LB_4266:
	jmp LB_4272
LB_4271:
	add r14,1 
LB_4272:
	cmp r14,r9
	jge LB_4273
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4271
LB_4273
	call GRM_210
	cmp BYTE [r8+6],0
	jnz LB_4276
	jmp LB_4277
LB_4276:
	jmp LB_4274
LB_4277:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
; .mov_ptn 2'(= a23◂ [ ] ) ⊢ 8'(= a23◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4275
LB_4274:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4275:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4278
LB_4278
;; rsp=1 , %2448~1'(= r ) %2447~0'(= r ) %2446~8'(= a23◂ [ ] ) 
; #22 8'(= a23◂ [ ] ) ⊢ 0(<2)◂8'(= a23◂ [ ] )
;; rsp=1 , %2449~0(<2)◂8'(= a23◂ [ ] ) %2448~1'(= r ) %2447~0'(= r ) 
; #22 0(<2)◂8'(= a23◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a23◂ [ ] )
;; rsp=1 , %2450~0(<2)◂0(<2)◂8'(= a23◂ [ ] ) %2448~1'(= r ) %2447~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a23◂ [ ] )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a3◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a23◂ [ ] ) ⊢ 2'(= a3◂ [ a3◂ [ a23◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4279
LB_4279:
	cmp BYTE [r8+6],0
	jnz LB_4261
	POP_GRM_SCC
	ret
LB_4261:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4281
LB_4281
;; rsp=0 , %2452~1'(= r ) %2451~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2453~1(<2)◂{ } %2452~1'(= r ) %2451~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2454~0(<2)◂1(<2)◂{ } %2452~1'(= r ) %2451~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ a23◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ a23◂ [ ]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4282
LB_4282:
	cmp BYTE [r8+6],0
	jnz LB_4280
	POP_GRM_SCC
	ret
LB_4280:
	POP_GRM_FAIL 
	ret
ETR_258:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_258
	ret
GRM_258:
	PUSH_GRM
	jmp LB_4285
LB_4284:
	add r14,1 
LB_4285:
	cmp r14,r9
	jge LB_4286
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4284
LB_4286
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4289
	jmp LB_4290
LB_4289:
	mov r8,unt_1
	jmp LB_4287
LB_4290:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],61
	jnz LB_4291
	jmp LB_4292
LB_4291:
	mov r8,unt_1
	jmp LB_4287
LB_4292:
	add r14,1
	jmp LB_4288
LB_4287:
	add rsp,0
	jmp LB_4283
LB_4288:
	jmp LB_4294
LB_4293:
	add r14,1 
LB_4294:
	cmp r14,r9
	jge LB_4295
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4293
LB_4295
	call GRM_190
	cmp BYTE [r8+6],0
	jnz LB_4298
	jmp LB_4299
LB_4298:
	jmp LB_4296
LB_4299:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a11◂ [ a9◂ [ ]] ) ⊢ 8'(= a11◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4297
LB_4296:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4297:
	jmp LB_4301
LB_4300:
	add r14,1 
LB_4301:
	cmp r14,r9
	jge LB_4302
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4300
LB_4302
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4305
	jmp LB_4306
LB_4305:
	mov r8,unt_1
	jmp LB_4303
LB_4306:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4307
	jmp LB_4308
LB_4307:
	mov r8,unt_1
	jmp LB_4303
LB_4308:
	add r14,1
	jmp LB_4304
LB_4303:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4304:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4309
LB_4309
;; rsp=1 , %2457~1'(= r ) %2456~0'(= r ) %2455~8'(= a11◂ [ a9◂ [ ]] ) 
; #167 8'(= a11◂ [ a9◂ [ ]] ) ⊢ 1(<3)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %2458~1(<3)◂8'(= a11◂ [ a9◂ [ ]] ) %2457~1'(= r ) %2456~0'(= r ) 
; #193 1(<3)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂1(<3)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %2459~0(<2)◂1(<3)◂8'(= a11◂ [ a9◂ [ ]] ) %2457~1'(= r ) %2456~0'(= r ) 
; #22 0(<2)◂1(<3)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂1(<3)◂8'(= a11◂ [ a9◂ [ ]] )
;; rsp=1 , %2460~0(<2)◂0(<2)◂1(<3)◂8'(= a11◂ [ a9◂ [ ]] ) %2457~1'(= r ) %2456~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂1(<3)◂8'(= a11◂ [ a9◂ [ ]] )
; .mov_ptn2 0(<2)◂0(<2)◂1(<3)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a33◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂1(<3)◂8'(= a11◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a35◂ [ a33◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4310
LB_4310:
	cmp BYTE [r8+6],0
	jnz LB_4283
	POP_GRM_SCC
	ret
LB_4283:
	RB_GRM
	jmp LB_4313
LB_4312:
	add r14,1 
LB_4313:
	cmp r14,r9
	jge LB_4314
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4312
LB_4314
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_4317
	jmp LB_4318
LB_4317:
	mov r8,unt_1
	jmp LB_4315
LB_4318:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],194
	jnz LB_4319
	cmp BYTE [rdi+1],171
	jnz LB_4319
	jmp LB_4320
LB_4319:
	mov r8,unt_1
	jmp LB_4315
LB_4320:
	add r14,2
	jmp LB_4316
LB_4315:
	add rsp,0
	jmp LB_4311
LB_4316:
	jmp LB_4322
LB_4321:
	add r14,1 
LB_4322:
	cmp r14,r9
	jge LB_4323
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4321
LB_4323
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4326
	jmp LB_4327
LB_4326:
	mov r8,unt_1
	jmp LB_4324
LB_4327:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4328
	jmp LB_4329
LB_4328:
	mov r8,unt_1
	jmp LB_4324
LB_4329:
	add r14,1
	jmp LB_4325
LB_4324:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4325:
	jmp LB_4331
LB_4330:
	add r14,1 
LB_4331:
	cmp r14,r9
	jge LB_4332
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4330
LB_4332
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_4335
	jmp LB_4336
LB_4335:
	jmp LB_4333
LB_4336:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4334
LB_4333:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4334:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4337
LB_4337
;; rsp=1 , %2463~1'(= r ) %2462~0'(= r ) %2461~8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) 
;; ? 8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4339
	mov r8,QWORD [rdi+8]
;; rsp=1 , %2465~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %2463~1'(= r ) %2462~0'(= r ) 
; #166 2'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 2(<3)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %2466~2(<3)◂2'(= a17◂ [ a9◂ [ ]{| l |}] ) %2463~1'(= r ) %2462~0'(= r ) 
; #193 2(<3)◂2'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂2(<3)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %2467~0(<2)◂2(<3)◂2'(= a17◂ [ a9◂ [ ]{| l |}] ) %2463~1'(= r ) %2462~0'(= r ) 
; #22 0(<2)◂2(<3)◂2'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂0(<2)◂2(<3)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %2468~0(<2)◂0(<2)◂2(<3)◂2'(= a17◂ [ a9◂ [ ]{| l |}] ) %2463~1'(= r ) %2462~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂2(<3)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn2 0(<2)◂0(<2)◂2(<3)◂2'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a35◂ [ a33◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂2(<3)◂0'(= a17◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a35◂ [ a33◂ [ ]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],2
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4338
LB_4339:
;; ?. 8'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=1 , %2464~2'(= a2◂ [ *{ rr{| l |}}] ) %2463~1'(= r ) %2462~0'(= r ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2469~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2463~1'(= r ) %2462~0'(= r ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=1 , %2470~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2463~1'(= r ) %2462~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a33◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a33◂ [ ]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4338
LB_4338:
	cmp BYTE [r8+6],0
	jnz LB_4311
	POP_GRM_SCC
	ret
LB_4311:
	RB_GRM
	jmp LB_4342
LB_4341:
	add r14,1 
LB_4342:
	cmp r14,r9
	jge LB_4343
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4341
LB_4343
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_4346
	jmp LB_4347
LB_4346:
	jmp LB_4344
LB_4347:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4345
LB_4344:
	add rsp,0
	jmp LB_4340
LB_4345:
	jmp LB_4349
LB_4348:
	add r14,1 
LB_4349:
	cmp r14,r9
	jge LB_4350
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4348
LB_4350
	call GRM_257
	cmp BYTE [r8+6],0
	jnz LB_4353
	jmp LB_4354
LB_4353:
	jmp LB_4351
LB_4354:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a3◂ [ a23◂ [ ]] ) ⊢ 9'(= a3◂ [ a23◂ [ ]] )
; .mov_ptn 2'(= a3◂ [ a23◂ [ ]] ) ⊢ 9'(= a3◂ [ a23◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4352
LB_4351:
	add rsp,8
	jmp LB_4340
LB_4352:
	jmp LB_4356
LB_4355:
	add r14,1 
LB_4356:
	cmp r14,r9
	jge LB_4357
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4355
LB_4357
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4360
	jmp LB_4361
LB_4360:
	mov r8,unt_1
	jmp LB_4358
LB_4361:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],10
	jnz LB_4362
	jmp LB_4363
LB_4362:
	mov r8,unt_1
	jmp LB_4358
LB_4363:
	add r14,1
	jmp LB_4359
LB_4358:
	add rsp,16
	jmp LB_4340
LB_4359:
	jmp LB_4365
LB_4364:
	add r14,1 
LB_4365:
	cmp r14,r9
	jge LB_4366
	JZ_LINE_SPC BYTE [r13+8+r14], LB_4364
LB_4366
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_4369
	jmp LB_4370
LB_4369:
	jmp LB_4367
LB_4370:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4368
LB_4367:
	add rsp,16
	jmp LB_4340
LB_4368:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_4371
LB_4371
;; rsp=3 , %2475~1'(= r ) %2474~0'(= r ) %2473~10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %2472~9'(= a3◂ [ a23◂ [ ]] ) %2471~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
;; ? 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4373
	mov r8,QWORD [rdi+8]
;; rsp=3 , %2477~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %2475~1'(= r ) %2474~0'(= r ) %2472~9'(= a3◂ [ a23◂ [ ]] ) %2471~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #168 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a3◂ [ a23◂ [ ]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<3)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a3◂ [ a23◂ [ ]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %2478~0(<3)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a3◂ [ a23◂ [ ]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %2475~1'(= r ) %2474~0'(= r ) 
; #193 0(<3)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a3◂ [ a23◂ [ ]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<3)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a3◂ [ a23◂ [ ]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %2479~0(<2)◂0(<3)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a3◂ [ a23◂ [ ]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %2475~1'(= r ) %2474~0'(= r ) 
; #22 0(<2)◂0(<3)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a3◂ [ a23◂ [ ]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂0(<3)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a3◂ [ a23◂ [ ]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=3 , %2480~0(<2)◂0(<2)◂0(<3)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a3◂ [ a23◂ [ ]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } %2475~1'(= r ) %2474~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂0(<3)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a3◂ [ a23◂ [ ]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂0(<3)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a3◂ [ a23◂ [ ]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a33◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂0(<3)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 9'(= a3◂ [ a23◂ [ ]] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a35◂ [ a33◂ [ ]]] )
	ALC_RCD 3
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*1],rax
	mov rax,r13
	mov QWORD [r14+8+8*2],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_4372
LB_4373:
;; ?. 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=3 , %2476~2'(= a2◂ [ *{ rr{| l |}}] ) %2475~1'(= r ) %2474~0'(= r ) %2472~9'(= a3◂ [ a23◂ [ ]] ) %2471~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #192 2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2481~1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2475~1'(= r ) %2474~0'(= r ) %2472~9'(= a3◂ [ a23◂ [ ]] ) %2471~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
;; rsp=3 , %2482~0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) %2475~1'(= r ) %2474~0'(= r ) %2472~9'(= a3◂ [ a23◂ [ ]] ) %2471~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; ∎ 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
; .mov_ptn2 0(<2)◂1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a33◂ [ ]]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂0'(= a2◂ [ *{ rr{| l |}}] ) ⊢ 2'(= a3◂ [ a35◂ [ a33◂ [ ]]] )
	mov rax,r13
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_4372
LB_4372:
	cmp BYTE [r8+6],0
	jnz LB_4340
	POP_GRM_SCC
	ret
LB_4340:
	POP_GRM_FAIL 
	ret
ETR_259:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_259
	ret
GRM_259:
	PUSH_GRM
	jmp LB_4376
LB_4375:
	add r14,1 
LB_4376:
	cmp r14,r9
	jge LB_4377
	JZ_SPC BYTE [r13+8+r14], LB_4375
LB_4377
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4380
	jmp LB_4381
LB_4380:
	mov r8,unt_1
	jmp LB_4378
LB_4381:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],64
	jnz LB_4382
	jmp LB_4383
LB_4382:
	mov r8,unt_1
	jmp LB_4378
LB_4383:
	add r14,1
	jmp LB_4379
LB_4378:
	add rsp,0
	jmp LB_4374
LB_4379:
	jmp LB_4385
LB_4384:
	add r14,1 
LB_4385:
	cmp r14,r9
	jge LB_4386
	JZ_SPC BYTE [r13+8+r14], LB_4384
LB_4386
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4389
	jmp LB_4390
LB_4389:
	mov r8,unt_1
	jmp LB_4387
LB_4390:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],46
	jnz LB_4391
	jmp LB_4392
LB_4391:
	mov r8,unt_1
	jmp LB_4387
LB_4392:
	add r14,1
	jmp LB_4388
LB_4387:
	add rsp,0
	jmp LB_4374
LB_4388:
	jmp LB_4394
LB_4393:
	add r14,1 
LB_4394:
	cmp r14,r9
	jge LB_4395
	JZ_SPC BYTE [r13+8+r14], LB_4393
LB_4395
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_4398
	jmp LB_4399
LB_4398:
	jmp LB_4396
LB_4399:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4397
LB_4396:
	add rsp,0
	jmp LB_4374
LB_4397:
	jmp LB_4401
LB_4400:
	add r14,1 
LB_4401:
	cmp r14,r9
	jge LB_4402
	JZ_SPC BYTE [r13+8+r14], LB_4400
LB_4402
	call GRM_261
	cmp BYTE [r8+6],0
	jnz LB_4405
	jmp LB_4406
LB_4405:
	jmp LB_4403
LB_4406:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a24◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a24◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a24◂ [ a9◂ [ ]{| l |}] ) ⊢ 9'(= a24◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4404
LB_4403:
	add rsp,8
	jmp LB_4374
LB_4404:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4407
LB_4407
;; rsp=2 , %2486~1'(= r ) %2485~0'(= r ) %2484~9'(= a24◂ [ a9◂ [ ]{| l |}] ) %2483~8'(= {| l |} ) 
; #22 { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=2 , %2487~0(<2)◂{ 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } %2486~1'(= r ) %2485~0'(= r ) 
; ∎ 0(<2)◂{ 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂{ 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] )
; .mov_ptn 0(<2)◂{ 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,16
	jmp LB_4408
LB_4408:
	cmp BYTE [r8+6],0
	jnz LB_4374
	POP_GRM_SCC
	ret
LB_4374:
	POP_GRM_FAIL 
	ret
ETR_260:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_260
	ret
GRM_260:
	PUSH_GRM
	jmp LB_4411
LB_4410:
	add r14,1 
LB_4411:
	cmp r14,r9
	jge LB_4412
	JZ_SPC BYTE [r13+8+r14], LB_4410
LB_4412
	call GRM_259
	cmp BYTE [r8+6],0
	jnz LB_4415
	jmp LB_4416
LB_4415:
	jmp LB_4413
LB_4416:
	sub rsp,16
; .mov_ptn2 2'(= *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]} ) ⊢ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn 2'(= *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]} ) ⊢ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*2],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*1],r11
	jmp LB_4414
LB_4413:
	add rsp,0
	jmp LB_4409
LB_4414:
	jmp LB_4418
LB_4417:
	add r14,1 
LB_4418:
	cmp r14,r9
	jge LB_4419
	JZ_SPC BYTE [r13+8+r14], LB_4417
LB_4419
	call GRM_260
	cmp BYTE [r8+6],0
	jnz LB_4422
	jmp LB_4423
LB_4422:
	jmp LB_4420
LB_4423:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] )
; .mov_ptn 2'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) ⊢ 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4421
LB_4420:
	add rsp,16
	jmp LB_4409
LB_4421:
	mov QWORD [rsp+8*3],r14
	mov r13,QWORD [rsp+16+8*3]
	mov r14,QWORD [rsp+8*3]
	jmp LB_4424
LB_4424
;; rsp=3 , %2491~1'(= r ) %2490~0'(= r ) %2489~10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) %2488~{ 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 
; #21 { { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2492~0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } %2491~1'(= r ) %2490~0'(= r ) 
; #22 0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=3 , %2493~0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } %2491~1'(= r ) %2490~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}]] )
; .mov_ptn 0(<2)◂0(<2)◂{ { 8'(= {| l |} ) 9'(= a24◂ [ a9◂ [ ]{| l |}] ) } 10'(= a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}]] )
	ALC_RCD 2
	mov r13,rax
	ALC_RCD 2
	mov r14,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*1],rax
	mov rax,r14
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,24
	jmp LB_4425
LB_4425:
	cmp BYTE [r8+6],0
	jnz LB_4409
	POP_GRM_SCC
	ret
LB_4409:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4427
LB_4427
;; rsp=0 , %2495~1'(= r ) %2494~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2496~1(<2)◂{ } %2495~1'(= r ) %2494~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2497~0(<2)◂1(<2)◂{ } %2495~1'(= r ) %2494~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ *{ {| l |}a24◂ [ a9◂ [ ]{| l |}]}]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4428
LB_4428:
	cmp BYTE [r8+6],0
	jnz LB_4426
	POP_GRM_SCC
	ret
LB_4426:
	POP_GRM_FAIL 
	ret
ETR_261:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_261
	ret
GRM_261:
	PUSH_GRM
	jmp LB_4431
LB_4430:
	add r14,1 
LB_4431:
	cmp r14,r9
	jge LB_4432
	JZ_SPC BYTE [r13+8+r14], LB_4430
LB_4432
	call GRM_262
	cmp BYTE [r8+6],0
	jnz LB_4435
	jmp LB_4436
LB_4435:
	jmp LB_4433
LB_4436:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a26◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a26◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4434
LB_4433:
	add rsp,0
	jmp LB_4429
LB_4434:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4437
LB_4437
;; rsp=1 , %2500~1'(= r ) %2499~0'(= r ) %2498~8'(= a26◂ [ a9◂ [ ]{| l |}] ) 
; #155 8'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 1(<2)◂8'(= a26◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %2501~1(<2)◂8'(= a26◂ [ a9◂ [ ]{| l |}] ) %2500~1'(= r ) %2499~0'(= r ) 
; #22 1(<2)◂8'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂1(<2)◂8'(= a26◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %2502~0(<2)◂1(<2)◂8'(= a26◂ [ a9◂ [ ]{| l |}] ) %2500~1'(= r ) %2499~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a26◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a24◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a24◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4438
LB_4438:
	cmp BYTE [r8+6],0
	jnz LB_4429
	POP_GRM_SCC
	ret
LB_4429:
	RB_GRM
	jmp LB_4441
LB_4440:
	add r14,1 
LB_4441:
	cmp r14,r9
	jge LB_4442
	JZ_SPC BYTE [r13+8+r14], LB_4440
LB_4442
	call GRM_270
	cmp BYTE [r8+6],0
	jnz LB_4445
	jmp LB_4446
LB_4445:
	jmp LB_4443
LB_4446:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a25◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a25◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4444
LB_4443:
	add rsp,0
	jmp LB_4439
LB_4444:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4447
LB_4447
;; rsp=1 , %2505~1'(= r ) %2504~0'(= r ) %2503~8'(= a25◂ [ a9◂ [ ]{| l |}] ) 
; #156 8'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %2506~0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] ) %2505~1'(= r ) %2504~0'(= r ) 
; #22 0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %2507~0(<2)◂0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] ) %2505~1'(= r ) %2504~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a24◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a24◂ [ a9◂ [ ]{| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4448
LB_4448:
	cmp BYTE [r8+6],0
	jnz LB_4439
	POP_GRM_SCC
	ret
LB_4439:
	POP_GRM_FAIL 
	ret
ETR_262:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_262
	ret
GRM_262:
	PUSH_GRM
	jmp LB_4451
LB_4450:
	add r14,1 
LB_4451:
	cmp r14,r9
	jge LB_4452
	JZ_SPC BYTE [r13+8+r14], LB_4450
LB_4452
	call GRM_269
	cmp BYTE [r8+6],0
	jnz LB_4455
	jmp LB_4456
LB_4455:
	jmp LB_4453
LB_4456:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a27◂ [ ] ) ⊢ 8'(= a27◂ [ ] )
; .mov_ptn 2'(= a27◂ [ ] ) ⊢ 8'(= a27◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4454
LB_4453:
	add rsp,0
	jmp LB_4449
LB_4454:
	jmp LB_4458
LB_4457:
	add r14,1 
LB_4458:
	cmp r14,r9
	jge LB_4459
	JZ_SPC BYTE [r13+8+r14], LB_4457
LB_4459
	call GRM_264
	cmp BYTE [r8+6],0
	jnz LB_4462
	jmp LB_4463
LB_4462:
	jmp LB_4460
LB_4463:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a28◂ [ a9◂ [ ]] ) ⊢ 9'(= a28◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a28◂ [ a9◂ [ ]] ) ⊢ 9'(= a28◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4461
LB_4460:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4461:
	jmp LB_4465
LB_4464:
	add r14,1 
LB_4465:
	cmp r14,r9
	jge LB_4466
	JZ_SPC BYTE [r13+8+r14], LB_4464
LB_4466
	call GRM_263
	cmp BYTE [r8+6],0
	jnz LB_4469
	jmp LB_4470
LB_4469:
	jmp LB_4467
LB_4470:
	sub rsp,24
; .mov_ptn2 2'(= *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}]} ) ⊢ { 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 2'(= *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}]} ) ⊢ { 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*3],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*2],r11
	mov rcx, QWORD [r8+24]
	mov QWORD [rsp-8+8*1],rcx
	jmp LB_4468
LB_4467:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4468:
	mov QWORD [rsp+8*5],r14
	mov r13,QWORD [rsp+16+8*5]
	mov r14,QWORD [rsp+8*5]
	jmp LB_4471
LB_4471
;; rsp=5 , %2514~1'(= r ) %2513~0'(= r ) %2512~12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %2511~11'(= a17◂ [ a9◂ [ ]{| l |}] ) %2510~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2509~9'(= a28◂ [ a9◂ [ ]] ) %2508~8'(= a27◂ [ ] ) 
; #163 { } ⊢ 2'(= a2◂ [ a13◂ [ {| l |}]] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { } ⊢ { }
	call ETR_163
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=5 , %2515~2'(= a2◂ [ a13◂ [ {| l |}]] ) %2514~1'(= r ) %2513~0'(= r ) %2512~12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %2511~11'(= a17◂ [ a9◂ [ ]{| l |}] ) %2510~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2509~9'(= a28◂ [ a9◂ [ ]] ) %2508~8'(= a27◂ [ ] ) 
; #151 { 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 1(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=5 , %2516~1(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) } %2514~1'(= r ) %2513~0'(= r ) 
; #22 1(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 0(<2)◂1(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) }
;; rsp=5 , %2517~0(<2)◂1(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) } %2514~1'(= r ) %2513~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn2 0(<2)◂1(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a26◂ [ a9◂ [ ]{| l |}]] )
	mov r13,r8
; .mov_ptn 0(<2)◂1(<2)◂{ 0'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) } ⊢ 2'(= a3◂ [ a26◂ [ a9◂ [ ]{| l |}]] )
	ALC_RCD 6
	mov r14,rax
	mov rax,r13
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*1],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*2],rax
	mov rax,QWORD [rsp-8+8*5]
	mov QWORD [r14+8+8*3],rax
	mov rax,QWORD [rsp-8+8*4]
	mov QWORD [r14+8+8*4],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r14+8+8*5],rax
	mov rax,r14
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,40
	jmp LB_4472
LB_4472:
	cmp BYTE [r8+6],0
	jnz LB_4449
	POP_GRM_SCC
	ret
LB_4449:
	RB_GRM
	jmp LB_4475
LB_4474:
	add r14,1 
LB_4475:
	cmp r14,r9
	jge LB_4476
	JZ_SPC BYTE [r13+8+r14], LB_4474
LB_4476
	call GRM_268
	cmp BYTE [r8+6],0
	jnz LB_4479
	jmp LB_4480
LB_4479:
	jmp LB_4477
LB_4480:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a27◂ [ ] ) ⊢ 8'(= a27◂ [ ] )
; .mov_ptn 2'(= a27◂ [ ] ) ⊢ 8'(= a27◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4478
LB_4477:
	add rsp,0
	jmp LB_4473
LB_4478:
	jmp LB_4482
LB_4481:
	add r14,1 
LB_4482:
	cmp r14,r9
	jge LB_4483
	JZ_SPC BYTE [r13+8+r14], LB_4481
LB_4483
	call GRM_264
	cmp BYTE [r8+6],0
	jnz LB_4486
	jmp LB_4487
LB_4486:
	jmp LB_4484
LB_4487:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a28◂ [ a9◂ [ ]] ) ⊢ 9'(= a28◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a28◂ [ a9◂ [ ]] ) ⊢ 9'(= a28◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4485
LB_4484:
	add rsp,8
	jmp LB_4473
LB_4485:
	jmp LB_4489
LB_4488:
	add r14,1 
LB_4489:
	cmp r14,r9
	jge LB_4490
	JZ_SPC BYTE [r13+8+r14], LB_4488
LB_4490
	call GRM_263
	cmp BYTE [r8+6],0
	jnz LB_4493
	jmp LB_4494
LB_4493:
	jmp LB_4491
LB_4494:
	sub rsp,24
; .mov_ptn2 2'(= *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}]} ) ⊢ { 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) }
; .mov_ptn 2'(= *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}]} ) ⊢ { 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) }
	mov r10, QWORD [r8+8]
	mov QWORD [rsp-8+8*3],r10
	mov r11, QWORD [r8+16]
	mov QWORD [rsp-8+8*2],r11
	mov rcx, QWORD [r8+24]
	mov QWORD [rsp-8+8*1],rcx
	jmp LB_4492
LB_4491:
	add rsp,16
	jmp LB_4473
LB_4492:
	jmp LB_4496
LB_4495:
	add r14,1 
LB_4496:
	cmp r14,r9
	jge LB_4497
	JZ_SPC BYTE [r13+8+r14], LB_4495
LB_4497
	call GRM_262
	cmp BYTE [r8+6],0
	jnz LB_4500
	jmp LB_4501
LB_4500:
	jmp LB_4498
LB_4501:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 13'(= a26◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 13'(= a26◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4499
LB_4498:
	add rsp,40
	jmp LB_4473
LB_4499:
	mov QWORD [rsp+8*6],r14
	mov r13,QWORD [rsp+16+8*6]
	mov r14,QWORD [rsp+8*6]
	jmp LB_4502
LB_4502
;; rsp=6 , %2525~1'(= r ) %2524~0'(= r ) %2523~13'(= a26◂ [ a9◂ [ ]{| l |}] ) %2522~12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %2521~11'(= a17◂ [ a9◂ [ ]{| l |}] ) %2520~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2519~9'(= a28◂ [ a9◂ [ ]] ) %2518~8'(= a27◂ [ ] ) 
; #163 { } ⊢ 2'(= a2◂ [ a13◂ [ {| l |}]] )
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { } ⊢ { }
	call ETR_163
	mov r14,QWORD [rsp-8+8*2]
	mov r8,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=6 , %2526~2'(= a2◂ [ a13◂ [ {| l |}]] ) %2525~1'(= r ) %2524~0'(= r ) %2523~13'(= a26◂ [ a9◂ [ ]{| l |}] ) %2522~12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) %2521~11'(= a17◂ [ a9◂ [ ]{| l |}] ) %2520~10'(= a8◂ [ a13◂ [ {| l |}]] ) %2519~9'(= a28◂ [ a9◂ [ ]] ) %2518~8'(= a27◂ [ ] ) 
; #152 { 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) 13'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) 13'(= a26◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=6 , %2527~0(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) 13'(= a26◂ [ a9◂ [ ]{| l |}] ) } %2525~1'(= r ) %2524~0'(= r ) 
; #22 0(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) 13'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) 13'(= a26◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=6 , %2528~0(<2)◂0(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) 13'(= a26◂ [ a9◂ [ ]{| l |}] ) } %2525~1'(= r ) %2524~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) 13'(= a26◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 2'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) 13'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a26◂ [ a9◂ [ ]{| l |}]] )
	mov r13,r8
; .mov_ptn 0(<2)◂0(<2)◂{ 0'(= a2◂ [ a13◂ [ {| l |}]] ) 10'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a17◂ [ a9◂ [ ]{| l |}] ) 8'(= a27◂ [ ] ) 9'(= a28◂ [ a9◂ [ ]] ) 12'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}] ) 13'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a26◂ [ a9◂ [ ]{| l |}]] )
	ALC_RCD 7
	mov r14,rax
	mov rax,r13
	mov QWORD [r14+8+8*0],rax
	mov rax,QWORD [rsp-8+8*4]
	mov QWORD [r14+8+8*1],rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r14+8+8*2],rax
	mov rax,QWORD [rsp-8+8*6]
	mov QWORD [r14+8+8*3],rax
	mov rax,QWORD [rsp-8+8*5]
	mov QWORD [r14+8+8*4],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*5],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r14+8+8*6],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,48
	jmp LB_4503
LB_4503:
	cmp BYTE [r8+6],0
	jnz LB_4473
	POP_GRM_SCC
	ret
LB_4473:
	POP_GRM_FAIL 
	ret
ETR_263:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_263
	ret
GRM_263:
	PUSH_GRM
	jmp LB_4506
LB_4505:
	add r14,1 
LB_4506:
	cmp r14,r9
	jge LB_4507
	JZ_SPC BYTE [r13+8+r14], LB_4505
LB_4507
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4510
	jmp LB_4511
LB_4510:
	mov r8,unt_1
	jmp LB_4508
LB_4511:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_4512
	jmp LB_4513
LB_4512:
	mov r8,unt_1
	jmp LB_4508
LB_4513:
	add r14,1
	jmp LB_4509
LB_4508:
	add rsp,0
	jmp LB_4504
LB_4509:
	jmp LB_4515
LB_4514:
	add r14,1 
LB_4515:
	cmp r14,r9
	jge LB_4516
	JZ_SPC BYTE [r13+8+r14], LB_4514
LB_4516
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4519
	jmp LB_4520
LB_4519:
	mov r8,unt_1
	jmp LB_4517
LB_4520:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4521
	cmp BYTE [rdi+1],138
	jnz LB_4521
	cmp BYTE [rdi+2],162
	jnz LB_4521
	jmp LB_4522
LB_4521:
	mov r8,unt_1
	jmp LB_4517
LB_4522:
	add r14,3
	jmp LB_4518
LB_4517:
	add rsp,0
	jmp LB_4504
LB_4518:
	jmp LB_4524
LB_4523:
	add r14,1 
LB_4524:
	cmp r14,r9
	jge LB_4525
	JZ_SPC BYTE [r13+8+r14], LB_4523
LB_4525
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_4528
	jmp LB_4529
LB_4528:
	jmp LB_4526
LB_4529:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4527
LB_4526:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4527:
	jmp LB_4531
LB_4530:
	add r14,1 
LB_4531:
	cmp r14,r9
	jge LB_4532
	JZ_SPC BYTE [r13+8+r14], LB_4530
LB_4532
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4535
	jmp LB_4536
LB_4535:
	mov r8,unt_1
	jmp LB_4533
LB_4536:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],44
	jnz LB_4537
	jmp LB_4538
LB_4537:
	mov r8,unt_1
	jmp LB_4533
LB_4538:
	add r14,1
	jmp LB_4534
LB_4533:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4534:
	jmp LB_4540
LB_4539:
	add r14,1 
LB_4540:
	cmp r14,r9
	jge LB_4541
	JZ_SPC BYTE [r13+8+r14], LB_4539
LB_4541
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_4544
	jmp LB_4545
LB_4544:
	jmp LB_4542
LB_4545:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 9'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 9'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4543
LB_4542:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4543:
	jmp LB_4547
LB_4546:
	add r14,1 
LB_4547:
	cmp r14,r9
	jge LB_4548
	JZ_SPC BYTE [r13+8+r14], LB_4546
LB_4548
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_4551
	jmp LB_4552
LB_4551:
	jmp LB_4549
LB_4552:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4550
LB_4549:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4550:
	jmp LB_4554
LB_4553:
	add r14,1 
LB_4554:
	cmp r14,r9
	jge LB_4555
	JZ_SPC BYTE [r13+8+r14], LB_4553
LB_4555
	call GRM_262
	cmp BYTE [r8+6],0
	jnz LB_4558
	jmp LB_4559
LB_4558:
	jmp LB_4556
LB_4559:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 11'(= a26◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a26◂ [ a9◂ [ ]{| l |}] ) ⊢ 11'(= a26◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4557
LB_4556:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_4557:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_4560
LB_4560
;; rsp=4 , %2534~1'(= r ) %2533~0'(= r ) %2532~11'(= a26◂ [ a9◂ [ ]{| l |}] ) %2531~10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %2530~9'(= a8◂ [ a13◂ [ {| l |}]] ) %2529~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
;; ? 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*2]
	cmp BYTE [rdi+6],0
	jnz LB_4562
	mov r8,QWORD [rdi+8]
;; rsp=4 , %2536~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %2534~1'(= r ) %2533~0'(= r ) %2532~11'(= a26◂ [ a9◂ [ ]{| l |}] ) %2530~9'(= a8◂ [ a13◂ [ {| l |}]] ) %2529~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 { 9'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a26◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 9'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a26◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=4 , %2537~0(<2)◂{ 9'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a26◂ [ a9◂ [ ]{| l |}] ) } %2536~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %2534~1'(= r ) %2533~0'(= r ) %2529~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a26◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a26◂ [ a9◂ [ ]{| l |}] ) } }
;; rsp=4 , %2538~0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a26◂ [ a9◂ [ ]{| l |}] ) } } %2534~1'(= r ) %2533~0'(= r ) 
; ∎ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a26◂ [ a9◂ [ ]{| l |}] ) } }
; .mov_ptn2 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a26◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 2'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}]}] )
	mov r13,r8
; .mov_ptn 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) 0(<2)◂{ 9'(= a8◂ [ a13◂ [ {| l |}]] ) 11'(= a26◂ [ a9◂ [ ]{| l |}] ) } } ⊢ 2'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}]}] )
	ALC_RCD 3
	mov r14,rax
	mov rax,QWORD [rsp-8+8*4]
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	ALC_RCD 2
	mov r9,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r9+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r9+8+8*1],rax
	mov rax,r9
	mov BYTE [rax+6],0
	mov QWORD [r14+8+8*2],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,32
	jmp LB_4561
LB_4562:
;; ?. 10'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=4 , %2535~2'(= a2◂ [ *{ rr{| l |}}] ) %2534~1'(= r ) %2533~0'(= r ) %2532~11'(= a26◂ [ a9◂ [ ]{| l |}] ) %2530~9'(= a8◂ [ a13◂ [ {| l |}]] ) %2529~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
	jmp LB_4563
LB_4563:
; $ %[ "grm_etr_act_act 0" ] ⊢ %[ "grm_etr_act_act 0" ]
;; rsp=4 , %2539~%[ "grm_etr_act_act 0" ] %2535~2'(= a2◂ [ *{ rr{| l |}}] ) %2534~1'(= r ) %2533~0'(= r ) %2532~11'(= a26◂ [ a9◂ [ ]{| l |}] ) %2530~9'(= a8◂ [ a13◂ [ {| l |}]] ) %2529~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #10 %[ "grm_etr_act_act 0" ] ⊢ %[ "grm_etr_act_act 0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_4564
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4565
LB_4565:
;; rsp=4 , %2540~%[ "grm_etr_act_act 0" ] %2535~2'(= a2◂ [ *{ rr{| l |}}] ) %2534~1'(= r ) %2533~0'(= r ) %2532~11'(= a26◂ [ a9◂ [ ]{| l |}] ) %2530~9'(= a8◂ [ a13◂ [ {| l |}]] ) %2529~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #10 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r13
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4566
LB_4566:
;; rsp=4 , %2541~{ 0'(= r ) 1'(= r ) } %2540~%[ "grm_etr_act_act 0" ] %2535~2'(= a2◂ [ *{ rr{| l |}}] ) %2532~11'(= a26◂ [ a9◂ [ ]{| l |}] ) %2530~9'(= a8◂ [ a13◂ [ {| l |}]] ) %2529~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
	mov rdi,LB_4567
	call emt_stg 
	jmp err
LB_4561:
	cmp BYTE [r8+6],0
	jnz LB_4504
	POP_GRM_SCC
	ret
LB_4504:
	RB_GRM
	jmp LB_4570
LB_4569:
	add r14,1 
LB_4570:
	cmp r14,r9
	jge LB_4571
	JZ_SPC BYTE [r13+8+r14], LB_4569
LB_4571
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4574
	jmp LB_4575
LB_4574:
	mov r8,unt_1
	jmp LB_4572
LB_4575:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4576
	cmp BYTE [rdi+1],138
	jnz LB_4576
	cmp BYTE [rdi+2],162
	jnz LB_4576
	jmp LB_4577
LB_4576:
	mov r8,unt_1
	jmp LB_4572
LB_4577:
	add r14,3
	jmp LB_4573
LB_4572:
	add rsp,0
	jmp LB_4568
LB_4573:
	jmp LB_4579
LB_4578:
	add r14,1 
LB_4579:
	cmp r14,r9
	jge LB_4580
	JZ_SPC BYTE [r13+8+r14], LB_4578
LB_4580
	call GRM_205
	cmp BYTE [r8+6],0
	jnz LB_4583
	jmp LB_4584
LB_4583:
	jmp LB_4581
LB_4584:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 2'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 8'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4582
LB_4581:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4582:
	jmp LB_4586
LB_4585:
	add r14,1 
LB_4586:
	cmp r14,r9
	jge LB_4587
	JZ_SPC BYTE [r13+8+r14], LB_4585
LB_4587
	call GRM_234
	cmp BYTE [r8+6],0
	jnz LB_4590
	jmp LB_4591
LB_4590:
	jmp LB_4588
LB_4591:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4589
LB_4588:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4589:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4592
LB_4592
;; rsp=2 , %2545~1'(= r ) %2544~0'(= r ) %2543~9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) %2542~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
;; ? 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 0(<2)◂2'(= a17◂ [ a9◂ [ ]{| l |}] )
	mov rdi,QWORD [rsp-8+8*1]
	cmp BYTE [rdi+6],0
	jnz LB_4594
	mov r8,QWORD [rdi+8]
;; rsp=2 , %2547~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %2545~1'(= r ) %2544~0'(= r ) %2542~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=2 , %2548~1(<2)◂{ } %2547~2'(= a17◂ [ a9◂ [ ]{| l |}] ) %2545~1'(= r ) %2544~0'(= r ) %2542~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #22 { 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) 1(<2)◂{ } } ⊢ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) 1(<2)◂{ } }
;; rsp=2 , %2549~0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) 1(<2)◂{ } } %2545~1'(= r ) %2544~0'(= r ) 
; ∎ 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) 1(<2)◂{ } }
; .mov_ptn2 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 2'(= a17◂ [ a9◂ [ ]{| l |}] ) 1(<2)◂{ } } ⊢ 2'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}]}] )
	mov r13,r8
; .mov_ptn 0(<2)◂{ 8'(= a8◂ [ a13◂ [ {| l |}]] ) 0'(= a17◂ [ a9◂ [ ]{| l |}] ) 1(<2)◂{ } } ⊢ 2'(= a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a17◂ [ a9◂ [ ]{| l |}]a3◂ [ *{ a8◂ [ a13◂ [ {| l |}]]a26◂ [ a9◂ [ ]{| l |}]}]}] )
	ALC_RCD 3
	mov r14,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r14+8+8*0],rax
	mov rax,r13
	mov QWORD [r14+8+8*1],rax
	mov rax,unt 
	mov rax,unt_1
	mov QWORD [r14+8+8*2],rax
	mov rax,r14
	mov BYTE [rax+6],0
	mov r8,rax
	add rsp,16
	jmp LB_4593
LB_4594:
;; ?. 9'(= a35◂ [ a17◂ [ a9◂ [ ]{| l |}]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=2 , %2546~2'(= a2◂ [ *{ rr{| l |}}] ) %2545~1'(= r ) %2544~0'(= r ) %2542~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
	jmp LB_4595
LB_4595:
; $ %[ "grm_etr_act_act 1" ] ⊢ %[ "grm_etr_act_act 1" ]
;; rsp=2 , %2550~%[ "grm_etr_act_act 1" ] %2546~2'(= a2◂ [ *{ rr{| l |}}] ) %2545~1'(= r ) %2544~0'(= r ) %2542~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #10 %[ "grm_etr_act_act 1" ] ⊢ %[ "grm_etr_act_act 1" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_4596
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4597
LB_4597:
;; rsp=2 , %2551~%[ "grm_etr_act_act 1" ] %2546~2'(= a2◂ [ *{ rr{| l |}}] ) %2545~1'(= r ) %2544~0'(= r ) %2542~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
; #10 { 0'(= r ) 1'(= r ) } ⊢ { 0'(= r ) 1'(= r ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r13
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4598
LB_4598:
;; rsp=2 , %2552~{ 0'(= r ) 1'(= r ) } %2551~%[ "grm_etr_act_act 1" ] %2546~2'(= a2◂ [ *{ rr{| l |}}] ) %2542~8'(= a8◂ [ a13◂ [ {| l |}]] ) 
	mov rdi,LB_4599
	call emt_stg 
	jmp err
LB_4593:
	cmp BYTE [r8+6],0
	jnz LB_4568
	POP_GRM_SCC
	ret
LB_4568:
	POP_GRM_FAIL 
	ret
ETR_264:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_264
	ret
GRM_264:
	PUSH_GRM
	jmp LB_4602
LB_4601:
	add r14,1 
LB_4602:
	cmp r14,r9
	jge LB_4603
	JZ_SPC BYTE [r13+8+r14], LB_4601
LB_4603
	lea rax,[r14+2]
	cmp rax,r9
	jg LB_4606
	jmp LB_4607
LB_4606:
	mov r8,unt_1
	jmp LB_4604
LB_4607:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],33
	jnz LB_4608
	cmp BYTE [rdi+1],124
	jnz LB_4608
	jmp LB_4609
LB_4608:
	mov r8,unt_1
	jmp LB_4604
LB_4609:
	add r14,2
	jmp LB_4605
LB_4604:
	add rsp,0
	jmp LB_4600
LB_4605:
	jmp LB_4611
LB_4610:
	add r14,1 
LB_4611:
	cmp r14,r9
	jge LB_4612
	JZ_SPC BYTE [r13+8+r14], LB_4610
LB_4612
	call GRM_265
	cmp BYTE [r8+6],0
	jnz LB_4615
	jmp LB_4616
LB_4615:
	jmp LB_4613
LB_4616:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) ⊢ 8'(= a2◂ [ a29◂ [ a9◂ [ ]]] )
; .mov_ptn 2'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) ⊢ 8'(= a2◂ [ a29◂ [ a9◂ [ ]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4614
LB_4613:
	add rsp,0
	POP_GRM_FAIL
	ret
LB_4614:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4617
LB_4617
;; rsp=1 , %2555~1'(= r ) %2554~0'(= r ) %2553~8'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) 
; #147 8'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) ⊢ 0(<3)◂8'(= a2◂ [ a29◂ [ a9◂ [ ]]] )
;; rsp=1 , %2556~0(<3)◂8'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) %2555~1'(= r ) %2554~0'(= r ) 
; #22 0(<3)◂8'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) ⊢ 0(<2)◂0(<3)◂8'(= a2◂ [ a29◂ [ a9◂ [ ]]] )
;; rsp=1 , %2557~0(<2)◂0(<3)◂8'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) %2555~1'(= r ) %2554~0'(= r ) 
; ∎ 0(<2)◂0(<3)◂8'(= a2◂ [ a29◂ [ a9◂ [ ]]] )
; .mov_ptn2 0(<2)◂0(<3)◂8'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) ⊢ 2'(= a3◂ [ a28◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<3)◂8'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) ⊢ 2'(= a3◂ [ a28◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4618
LB_4618:
	cmp BYTE [r8+6],0
	jnz LB_4600
	POP_GRM_SCC
	ret
LB_4600:
	RB_GRM
	jmp LB_4621
LB_4620:
	add r14,1 
LB_4621:
	cmp r14,r9
	jge LB_4622
	JZ_SPC BYTE [r13+8+r14], LB_4620
LB_4622
	call GRM_266
	cmp BYTE [r8+6],0
	jnz LB_4625
	jmp LB_4626
LB_4625:
	jmp LB_4623
LB_4626:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a29◂ [ a9◂ [ ]] ) ⊢ 8'(= a29◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a29◂ [ a9◂ [ ]] ) ⊢ 8'(= a29◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4624
LB_4623:
	add rsp,0
	jmp LB_4619
LB_4624:
	jmp LB_4628
LB_4627:
	add r14,1 
LB_4628:
	cmp r14,r9
	jge LB_4629
	JZ_SPC BYTE [r13+8+r14], LB_4627
LB_4629
	call GRM_264
	cmp BYTE [r8+6],0
	jnz LB_4632
	jmp LB_4633
LB_4632:
	jmp LB_4630
LB_4633:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a28◂ [ a9◂ [ ]] ) ⊢ 9'(= a28◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a28◂ [ a9◂ [ ]] ) ⊢ 9'(= a28◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4631
LB_4630:
	add rsp,8
	jmp LB_4619
LB_4631:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4634
LB_4634
;; rsp=2 , %2561~1'(= r ) %2560~0'(= r ) %2559~9'(= a28◂ [ a9◂ [ ]] ) %2558~8'(= a29◂ [ a9◂ [ ]] ) 
; #146 { 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a28◂ [ a9◂ [ ]] ) } ⊢ 1(<3)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a28◂ [ a9◂ [ ]] ) }
;; rsp=2 , %2562~1(<3)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a28◂ [ a9◂ [ ]] ) } %2561~1'(= r ) %2560~0'(= r ) 
; #22 1(<3)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a28◂ [ a9◂ [ ]] ) } ⊢ 0(<2)◂1(<3)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a28◂ [ a9◂ [ ]] ) }
;; rsp=2 , %2563~0(<2)◂1(<3)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a28◂ [ a9◂ [ ]] ) } %2561~1'(= r ) %2560~0'(= r ) 
; ∎ 0(<2)◂1(<3)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a28◂ [ a9◂ [ ]] ) }
; .mov_ptn2 0(<2)◂1(<3)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a28◂ [ a9◂ [ ]] ) } ⊢ 2'(= a3◂ [ a28◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<3)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a28◂ [ a9◂ [ ]] ) } ⊢ 2'(= a3◂ [ a28◂ [ a9◂ [ ]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_4635
LB_4635:
	cmp BYTE [r8+6],0
	jnz LB_4619
	POP_GRM_SCC
	ret
LB_4619:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4637
LB_4637
;; rsp=0 , %2565~1'(= r ) %2564~0'(= r ) 
; #145 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %2566~2(<3)◂{ } %2565~1'(= r ) %2564~0'(= r ) 
; #22 2(<3)◂{ } ⊢ 0(<2)◂2(<3)◂{ }
;; rsp=0 , %2567~0(<2)◂2(<3)◂{ } %2565~1'(= r ) %2564~0'(= r ) 
; ∎ 0(<2)◂2(<3)◂{ }
; .mov_ptn2 0(<2)◂2(<3)◂{ } ⊢ 2'(= a3◂ [ a28◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂2(<3)◂{ } ⊢ 2'(= a3◂ [ a28◂ [ a9◂ [ ]]] )
	mov rax,unt 
	mov rax,unt_2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4638
LB_4638:
	cmp BYTE [r8+6],0
	jnz LB_4636
	POP_GRM_SCC
	ret
LB_4636:
	POP_GRM_FAIL 
	ret
ETR_265:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_265
	ret
GRM_265:
	PUSH_GRM
	jmp LB_4641
LB_4640:
	add r14,1 
LB_4641:
	cmp r14,r9
	jge LB_4642
	JZ_SPC BYTE [r13+8+r14], LB_4640
LB_4642
	call GRM_266
	cmp BYTE [r8+6],0
	jnz LB_4645
	jmp LB_4646
LB_4645:
	jmp LB_4643
LB_4646:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a29◂ [ a9◂ [ ]] ) ⊢ 8'(= a29◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a29◂ [ a9◂ [ ]] ) ⊢ 8'(= a29◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4644
LB_4643:
	add rsp,0
	jmp LB_4639
LB_4644:
	jmp LB_4648
LB_4647:
	add r14,1 
LB_4648:
	cmp r14,r9
	jge LB_4649
	JZ_SPC BYTE [r13+8+r14], LB_4647
LB_4649
	call GRM_265
	cmp BYTE [r8+6],0
	jnz LB_4652
	jmp LB_4653
LB_4652:
	jmp LB_4650
LB_4653:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) ⊢ 9'(= a2◂ [ a29◂ [ a9◂ [ ]]] )
; .mov_ptn 2'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) ⊢ 9'(= a2◂ [ a29◂ [ a9◂ [ ]]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4651
LB_4650:
	add rsp,8
	jmp LB_4639
LB_4651:
	mov QWORD [rsp+8*2],r14
	mov r13,QWORD [rsp+16+8*2]
	mov r14,QWORD [rsp+8*2]
	jmp LB_4654
LB_4654
;; rsp=2 , %2571~1'(= r ) %2570~0'(= r ) %2569~9'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) %2568~8'(= a29◂ [ a9◂ [ ]] ) 
; #21 { 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) } ⊢ 0(<2)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) }
;; rsp=2 , %2572~0(<2)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) } %2571~1'(= r ) %2570~0'(= r ) 
; #22 0(<2)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) } ⊢ 0(<2)◂0(<2)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) }
;; rsp=2 , %2573~0(<2)◂0(<2)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) } %2571~1'(= r ) %2570~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a29◂ [ a9◂ [ ]]]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 8'(= a29◂ [ a9◂ [ ]] ) 9'(= a2◂ [ a29◂ [ a9◂ [ ]]] ) } ⊢ 2'(= a3◂ [ a2◂ [ a29◂ [ a9◂ [ ]]]] )
	ALC_RCD 2
	mov r13,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*1],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,16
	jmp LB_4655
LB_4655:
	cmp BYTE [r8+6],0
	jnz LB_4639
	POP_GRM_SCC
	ret
LB_4639:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4657
LB_4657
;; rsp=0 , %2575~1'(= r ) %2574~0'(= r ) 
; #20 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2576~1(<2)◂{ } %2575~1'(= r ) %2574~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2577~0(<2)◂1(<2)◂{ } %2575~1'(= r ) %2574~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a29◂ [ a9◂ [ ]]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a2◂ [ a29◂ [ a9◂ [ ]]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4658
LB_4658:
	cmp BYTE [r8+6],0
	jnz LB_4656
	POP_GRM_SCC
	ret
LB_4656:
	POP_GRM_FAIL 
	ret
ETR_266:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_266
	ret
GRM_266:
	PUSH_GRM
	jmp LB_4661
LB_4660:
	add r14,1 
LB_4661:
	cmp r14,r9
	jge LB_4662
	JZ_SPC BYTE [r13+8+r14], LB_4660
LB_4662
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4665
	jmp LB_4666
LB_4665:
	mov r8,unt_1
	jmp LB_4663
LB_4666:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4667
	cmp BYTE [rdi+1],159
	jnz LB_4667
	cmp BYTE [rdi+2],166
	jnz LB_4667
	jmp LB_4668
LB_4667:
	mov r8,unt_1
	jmp LB_4663
LB_4668:
	add r14,3
	jmp LB_4664
LB_4663:
	add rsp,0
	jmp LB_4659
LB_4664:
	jmp LB_4670
LB_4669:
	add r14,1 
LB_4670:
	cmp r14,r9
	jge LB_4671
	JZ_SPC BYTE [r13+8+r14], LB_4669
LB_4671
	call GRM_267
	cmp BYTE [r8+6],0
	jnz LB_4674
	jmp LB_4675
LB_4674:
	jmp LB_4672
LB_4675:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a30◂ [ a9◂ [ ]] ) ⊢ 8'(= a30◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a30◂ [ a9◂ [ ]] ) ⊢ 8'(= a30◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4673
LB_4672:
	add rsp,0
	jmp LB_4659
LB_4673:
	jmp LB_4677
LB_4676:
	add r14,1 
LB_4677:
	cmp r14,r9
	jge LB_4678
	JZ_SPC BYTE [r13+8+r14], LB_4676
LB_4678
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4681
	jmp LB_4682
LB_4681:
	mov r8,unt_1
	jmp LB_4679
LB_4682:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4683
	cmp BYTE [rdi+1],159
	jnz LB_4683
	cmp BYTE [rdi+2],167
	jnz LB_4683
	jmp LB_4684
LB_4683:
	mov r8,unt_1
	jmp LB_4679
LB_4684:
	add r14,3
	jmp LB_4680
LB_4679:
	add rsp,8
	jmp LB_4659
LB_4680:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4685
LB_4685
;; rsp=1 , %2580~1'(= r ) %2579~0'(= r ) %2578~8'(= a30◂ [ a9◂ [ ]] ) 
; #144 8'(= a30◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂8'(= a30◂ [ a9◂ [ ]] )
;; rsp=1 , %2581~0(<2)◂8'(= a30◂ [ a9◂ [ ]] ) %2580~1'(= r ) %2579~0'(= r ) 
; #22 0(<2)◂8'(= a30◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂0(<2)◂8'(= a30◂ [ a9◂ [ ]] )
;; rsp=1 , %2582~0(<2)◂0(<2)◂8'(= a30◂ [ a9◂ [ ]] ) %2580~1'(= r ) %2579~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a30◂ [ a9◂ [ ]] )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a30◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a29◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a30◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a29◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4686
LB_4686:
	cmp BYTE [r8+6],0
	jnz LB_4659
	POP_GRM_SCC
	ret
LB_4659:
	RB_GRM
	jmp LB_4689
LB_4688:
	add r14,1 
LB_4689:
	cmp r14,r9
	jge LB_4690
	JZ_SPC BYTE [r13+8+r14], LB_4688
LB_4690
	call GRM_267
	cmp BYTE [r8+6],0
	jnz LB_4693
	jmp LB_4694
LB_4693:
	jmp LB_4691
LB_4694:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a30◂ [ a9◂ [ ]] ) ⊢ 8'(= a30◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a30◂ [ a9◂ [ ]] ) ⊢ 8'(= a30◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4692
LB_4691:
	add rsp,0
	jmp LB_4687
LB_4692:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4695
LB_4695
;; rsp=1 , %2585~1'(= r ) %2584~0'(= r ) %2583~8'(= a30◂ [ a9◂ [ ]] ) 
; #143 8'(= a30◂ [ a9◂ [ ]] ) ⊢ 1(<2)◂8'(= a30◂ [ a9◂ [ ]] )
;; rsp=1 , %2586~1(<2)◂8'(= a30◂ [ a9◂ [ ]] ) %2585~1'(= r ) %2584~0'(= r ) 
; #22 1(<2)◂8'(= a30◂ [ a9◂ [ ]] ) ⊢ 0(<2)◂1(<2)◂8'(= a30◂ [ a9◂ [ ]] )
;; rsp=1 , %2587~0(<2)◂1(<2)◂8'(= a30◂ [ a9◂ [ ]] ) %2585~1'(= r ) %2584~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= a30◂ [ a9◂ [ ]] )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= a30◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a29◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= a30◂ [ a9◂ [ ]] ) ⊢ 2'(= a3◂ [ a29◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],1
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4696
LB_4696:
	cmp BYTE [r8+6],0
	jnz LB_4687
	POP_GRM_SCC
	ret
LB_4687:
	POP_GRM_FAIL 
	ret
ETR_267:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_267
	ret
GRM_267:
	PUSH_GRM
	jmp LB_4699
LB_4698:
	add r14,1 
LB_4699:
	cmp r14,r9
	jge LB_4700
	JZ_SPC BYTE [r13+8+r14], LB_4698
LB_4700
	call GRM_67
	cmp BYTE [r8+6],0
	jnz LB_4703
	jmp LB_4704
LB_4703:
	jmp LB_4701
LB_4704:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4702
LB_4701:
	add rsp,0
	jmp LB_4697
LB_4702:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4705
LB_4705
;; rsp=1 , %2590~1'(= r ) %2589~0'(= r ) %2588~8'(= {| l |} ) 
; #141 8'(= {| l |} ) ⊢ 1(<2)◂8'(= {| l |} )
;; rsp=1 , %2591~1(<2)◂8'(= {| l |} ) %2590~1'(= r ) %2589~0'(= r ) 
; #22 1(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂1(<2)◂8'(= {| l |} )
;; rsp=1 , %2592~0(<2)◂1(<2)◂8'(= {| l |} ) %2590~1'(= r ) %2589~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a30◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂1(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a30◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4706
LB_4706:
	cmp BYTE [r8+6],0
	jnz LB_4697
	POP_GRM_SCC
	ret
LB_4697:
	RB_GRM
	jmp LB_4709
LB_4708:
	add r14,1 
LB_4709:
	cmp r14,r9
	jge LB_4710
	JZ_SPC BYTE [r13+8+r14], LB_4708
LB_4710
	call GRM_189
	cmp BYTE [r8+6],0
	jnz LB_4713
	jmp LB_4714
LB_4713:
	jmp LB_4711
LB_4714:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
; .mov_ptn 2'(= a9◂ [ ] ) ⊢ 8'(= a9◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4712
LB_4711:
	add rsp,0
	jmp LB_4707
LB_4712:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4715
LB_4715
;; rsp=1 , %2595~1'(= r ) %2594~0'(= r ) %2593~8'(= a9◂ [ ] ) 
; #142 8'(= a9◂ [ ] ) ⊢ 0(<2)◂8'(= a9◂ [ ] )
;; rsp=1 , %2596~0(<2)◂8'(= a9◂ [ ] ) %2595~1'(= r ) %2594~0'(= r ) 
; #22 0(<2)◂8'(= a9◂ [ ] ) ⊢ 0(<2)◂0(<2)◂8'(= a9◂ [ ] )
;; rsp=1 , %2597~0(<2)◂0(<2)◂8'(= a9◂ [ ] ) %2595~1'(= r ) %2594~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a9◂ [ ] )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a30◂ [ a9◂ [ ]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a9◂ [ ] ) ⊢ 2'(= a3◂ [ a30◂ [ a9◂ [ ]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4716
LB_4716:
	cmp BYTE [r8+6],0
	jnz LB_4707
	POP_GRM_SCC
	ret
LB_4707:
	POP_GRM_FAIL 
	ret
ETR_268:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_268
	ret
GRM_268:
	PUSH_GRM
	jmp LB_4719
LB_4718:
	add r14,1 
LB_4719:
	cmp r14,r9
	jge LB_4720
	JZ_SPC BYTE [r13+8+r14], LB_4718
LB_4720
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_4723
	jmp LB_4724
LB_4723:
	mov r8,unt_1
	jmp LB_4721
LB_4724:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4725
	cmp BYTE [rdi+1],136
	jnz LB_4725
	cmp BYTE [rdi+2],144
	jnz LB_4725
	cmp BYTE [rdi+3],42
	jnz LB_4725
	jmp LB_4726
LB_4725:
	mov r8,unt_1
	jmp LB_4721
LB_4726:
	add r14,4
	jmp LB_4722
LB_4721:
	add rsp,0
	jmp LB_4717
LB_4722:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4727
LB_4727
;; rsp=0 , %2599~1'(= r ) %2598~0'(= r ) 
; #149 { } ⊢ 1(<3)◂{ }
;; rsp=0 , %2600~1(<3)◂{ } %2599~1'(= r ) %2598~0'(= r ) 
; #22 1(<3)◂{ } ⊢ 0(<2)◂1(<3)◂{ }
;; rsp=0 , %2601~0(<2)◂1(<3)◂{ } %2599~1'(= r ) %2598~0'(= r ) 
; ∎ 0(<2)◂1(<3)◂{ }
; .mov_ptn2 0(<2)◂1(<3)◂{ } ⊢ 2'(= a3◂ [ a27◂ [ ]] )
; .mov_ptn 0(<2)◂1(<3)◂{ } ⊢ 2'(= a3◂ [ a27◂ [ ]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4728
LB_4728:
	cmp BYTE [r8+6],0
	jnz LB_4717
	POP_GRM_SCC
	ret
LB_4717:
	RB_GRM
	jmp LB_4731
LB_4730:
	add r14,1 
LB_4731:
	cmp r14,r9
	jge LB_4732
	JZ_SPC BYTE [r13+8+r14], LB_4730
LB_4732
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_4735
	jmp LB_4736
LB_4735:
	mov r8,unt_1
	jmp LB_4733
LB_4736:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4737
	cmp BYTE [rdi+1],136
	jnz LB_4737
	cmp BYTE [rdi+2],144
	jnz LB_4737
	cmp BYTE [rdi+3],35
	jnz LB_4737
	jmp LB_4738
LB_4737:
	mov r8,unt_1
	jmp LB_4733
LB_4738:
	add r14,4
	jmp LB_4734
LB_4733:
	add rsp,0
	jmp LB_4729
LB_4734:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4739
LB_4739
;; rsp=0 , %2603~1'(= r ) %2602~0'(= r ) 
; #148 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %2604~2(<3)◂{ } %2603~1'(= r ) %2602~0'(= r ) 
; #22 2(<3)◂{ } ⊢ 0(<2)◂2(<3)◂{ }
;; rsp=0 , %2605~0(<2)◂2(<3)◂{ } %2603~1'(= r ) %2602~0'(= r ) 
; ∎ 0(<2)◂2(<3)◂{ }
; .mov_ptn2 0(<2)◂2(<3)◂{ } ⊢ 2'(= a3◂ [ a27◂ [ ]] )
; .mov_ptn 0(<2)◂2(<3)◂{ } ⊢ 2'(= a3◂ [ a27◂ [ ]] )
	mov rax,unt 
	mov rax,unt_2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4740
LB_4740:
	cmp BYTE [r8+6],0
	jnz LB_4729
	POP_GRM_SCC
	ret
LB_4729:
	RB_GRM
	jmp LB_4743
LB_4742:
	add r14,1 
LB_4743:
	cmp r14,r9
	jge LB_4744
	JZ_SPC BYTE [r13+8+r14], LB_4742
LB_4744
	lea rax,[r14+3]
	cmp rax,r9
	jg LB_4747
	jmp LB_4748
LB_4747:
	mov r8,unt_1
	jmp LB_4745
LB_4748:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4749
	cmp BYTE [rdi+1],136
	jnz LB_4749
	cmp BYTE [rdi+2],144
	jnz LB_4749
	jmp LB_4750
LB_4749:
	mov r8,unt_1
	jmp LB_4745
LB_4750:
	add r14,3
	jmp LB_4746
LB_4745:
	add rsp,0
	jmp LB_4741
LB_4746:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4751
LB_4751
;; rsp=0 , %2607~1'(= r ) %2606~0'(= r ) 
; #150 { } ⊢ 0(<3)◂{ }
;; rsp=0 , %2608~0(<3)◂{ } %2607~1'(= r ) %2606~0'(= r ) 
; #22 0(<3)◂{ } ⊢ 0(<2)◂0(<3)◂{ }
;; rsp=0 , %2609~0(<2)◂0(<3)◂{ } %2607~1'(= r ) %2606~0'(= r ) 
; ∎ 0(<2)◂0(<3)◂{ }
; .mov_ptn2 0(<2)◂0(<3)◂{ } ⊢ 2'(= a3◂ [ a27◂ [ ]] )
; .mov_ptn 0(<2)◂0(<3)◂{ } ⊢ 2'(= a3◂ [ a27◂ [ ]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4752
LB_4752:
	cmp BYTE [r8+6],0
	jnz LB_4741
	POP_GRM_SCC
	ret
LB_4741:
	POP_GRM_FAIL 
	ret
ETR_269:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_269
	ret
GRM_269:
	PUSH_GRM
	jmp LB_4755
LB_4754:
	add r14,1 
LB_4755:
	cmp r14,r9
	jge LB_4756
	JZ_SPC BYTE [r13+8+r14], LB_4754
LB_4756
	lea rax,[r14+5]
	cmp rax,r9
	jg LB_4759
	jmp LB_4760
LB_4759:
	mov r8,unt_1
	jmp LB_4757
LB_4760:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4761
	cmp BYTE [rdi+1],136
	jnz LB_4761
	cmp BYTE [rdi+2],144
	jnz LB_4761
	cmp BYTE [rdi+3],46
	jnz LB_4761
	cmp BYTE [rdi+4],42
	jnz LB_4761
	jmp LB_4762
LB_4761:
	mov r8,unt_1
	jmp LB_4757
LB_4762:
	add r14,5
	jmp LB_4758
LB_4757:
	add rsp,0
	jmp LB_4753
LB_4758:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4763
LB_4763
;; rsp=0 , %2611~1'(= r ) %2610~0'(= r ) 
; #149 { } ⊢ 1(<3)◂{ }
;; rsp=0 , %2612~1(<3)◂{ } %2611~1'(= r ) %2610~0'(= r ) 
; #22 1(<3)◂{ } ⊢ 0(<2)◂1(<3)◂{ }
;; rsp=0 , %2613~0(<2)◂1(<3)◂{ } %2611~1'(= r ) %2610~0'(= r ) 
; ∎ 0(<2)◂1(<3)◂{ }
; .mov_ptn2 0(<2)◂1(<3)◂{ } ⊢ 2'(= a3◂ [ a27◂ [ ]] )
; .mov_ptn 0(<2)◂1(<3)◂{ } ⊢ 2'(= a3◂ [ a27◂ [ ]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4764
LB_4764:
	cmp BYTE [r8+6],0
	jnz LB_4753
	POP_GRM_SCC
	ret
LB_4753:
	RB_GRM
	jmp LB_4767
LB_4766:
	add r14,1 
LB_4767:
	cmp r14,r9
	jge LB_4768
	JZ_SPC BYTE [r13+8+r14], LB_4766
LB_4768
	lea rax,[r14+5]
	cmp rax,r9
	jg LB_4771
	jmp LB_4772
LB_4771:
	mov r8,unt_1
	jmp LB_4769
LB_4772:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4773
	cmp BYTE [rdi+1],136
	jnz LB_4773
	cmp BYTE [rdi+2],144
	jnz LB_4773
	cmp BYTE [rdi+3],46
	jnz LB_4773
	cmp BYTE [rdi+4],35
	jnz LB_4773
	jmp LB_4774
LB_4773:
	mov r8,unt_1
	jmp LB_4769
LB_4774:
	add r14,5
	jmp LB_4770
LB_4769:
	add rsp,0
	jmp LB_4765
LB_4770:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4775
LB_4775
;; rsp=0 , %2615~1'(= r ) %2614~0'(= r ) 
; #148 { } ⊢ 2(<3)◂{ }
;; rsp=0 , %2616~2(<3)◂{ } %2615~1'(= r ) %2614~0'(= r ) 
; #22 2(<3)◂{ } ⊢ 0(<2)◂2(<3)◂{ }
;; rsp=0 , %2617~0(<2)◂2(<3)◂{ } %2615~1'(= r ) %2614~0'(= r ) 
; ∎ 0(<2)◂2(<3)◂{ }
; .mov_ptn2 0(<2)◂2(<3)◂{ } ⊢ 2'(= a3◂ [ a27◂ [ ]] )
; .mov_ptn 0(<2)◂2(<3)◂{ } ⊢ 2'(= a3◂ [ a27◂ [ ]] )
	mov rax,unt 
	mov rax,unt_2
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4776
LB_4776:
	cmp BYTE [r8+6],0
	jnz LB_4765
	POP_GRM_SCC
	ret
LB_4765:
	RB_GRM
	jmp LB_4779
LB_4778:
	add r14,1 
LB_4779:
	cmp r14,r9
	jge LB_4780
	JZ_SPC BYTE [r13+8+r14], LB_4778
LB_4780
	lea rax,[r14+4]
	cmp rax,r9
	jg LB_4783
	jmp LB_4784
LB_4783:
	mov r8,unt_1
	jmp LB_4781
LB_4784:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],226
	jnz LB_4785
	cmp BYTE [rdi+1],136
	jnz LB_4785
	cmp BYTE [rdi+2],144
	jnz LB_4785
	cmp BYTE [rdi+3],46
	jnz LB_4785
	jmp LB_4786
LB_4785:
	mov r8,unt_1
	jmp LB_4781
LB_4786:
	add r14,4
	jmp LB_4782
LB_4781:
	add rsp,0
	jmp LB_4777
LB_4782:
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4787
LB_4787
;; rsp=0 , %2619~1'(= r ) %2618~0'(= r ) 
; #150 { } ⊢ 0(<3)◂{ }
;; rsp=0 , %2620~0(<3)◂{ } %2619~1'(= r ) %2618~0'(= r ) 
; #22 0(<3)◂{ } ⊢ 0(<2)◂0(<3)◂{ }
;; rsp=0 , %2621~0(<2)◂0(<3)◂{ } %2619~1'(= r ) %2618~0'(= r ) 
; ∎ 0(<2)◂0(<3)◂{ }
; .mov_ptn2 0(<2)◂0(<3)◂{ } ⊢ 2'(= a3◂ [ a27◂ [ ]] )
; .mov_ptn 0(<2)◂0(<3)◂{ } ⊢ 2'(= a3◂ [ a27◂ [ ]] )
	mov rax,unt 
	mov rax,unt_0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4788
LB_4788:
	cmp BYTE [r8+6],0
	jnz LB_4777
	POP_GRM_SCC
	ret
LB_4777:
	POP_GRM_FAIL 
	ret
ETR_270:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_270
	ret
GRM_270:
	PUSH_GRM
	jmp LB_4791
LB_4790:
	add r14,1 
LB_4791:
	cmp r14,r9
	jge LB_4792
	JZ_SPC BYTE [r13+8+r14], LB_4790
LB_4792
	call GRM_269
	cmp BYTE [r8+6],0
	jnz LB_4795
	jmp LB_4796
LB_4795:
	jmp LB_4793
LB_4796:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a27◂ [ ] ) ⊢ 8'(= a27◂ [ ] )
; .mov_ptn 2'(= a27◂ [ ] ) ⊢ 8'(= a27◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4794
LB_4793:
	add rsp,0
	jmp LB_4789
LB_4794:
	jmp LB_4798
LB_4797:
	add r14,1 
LB_4798:
	cmp r14,r9
	jge LB_4799
	JZ_SPC BYTE [r13+8+r14], LB_4797
LB_4799
	call GRM_272
	cmp BYTE [r8+6],0
	jnz LB_4802
	jmp LB_4803
LB_4802:
	jmp LB_4800
LB_4803:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a3◂ [ {| l |}] ) ⊢ 9'(= a3◂ [ {| l |}] )
; .mov_ptn 2'(= a3◂ [ {| l |}] ) ⊢ 9'(= a3◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4801
LB_4800:
	add rsp,8
	POP_GRM_FAIL
	ret
LB_4801:
	jmp LB_4805
LB_4804:
	add r14,1 
LB_4805:
	cmp r14,r9
	jge LB_4806
	JZ_SPC BYTE [r13+8+r14], LB_4804
LB_4806
	call GRM_264
	cmp BYTE [r8+6],0
	jnz LB_4809
	jmp LB_4810
LB_4809:
	jmp LB_4807
LB_4810:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a28◂ [ a9◂ [ ]] ) ⊢ 10'(= a28◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a28◂ [ a9◂ [ ]] ) ⊢ 10'(= a28◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4808
LB_4807:
	add rsp,16
	POP_GRM_FAIL
	ret
LB_4808:
	jmp LB_4812
LB_4811:
	add r14,1 
LB_4812:
	cmp r14,r9
	jge LB_4813
	JZ_SPC BYTE [r13+8+r14], LB_4811
LB_4813
	call GRM_271
	cmp BYTE [r8+6],0
	jnz LB_4816
	jmp LB_4817
LB_4816:
	jmp LB_4814
LB_4817:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) ⊢ 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) ⊢ 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4815
LB_4814:
	add rsp,24
	POP_GRM_FAIL
	ret
LB_4815:
	mov QWORD [rsp+8*4],r14
	mov r13,QWORD [rsp+16+8*4]
	mov r14,QWORD [rsp+8*4]
	jmp LB_4818
LB_4818
;; rsp=4 , %2627~1'(= r ) %2626~0'(= r ) %2625~11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) %2624~10'(= a28◂ [ a9◂ [ ]] ) %2623~9'(= a3◂ [ {| l |}] ) %2622~8'(= a27◂ [ ] ) 
; #153 { 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=4 , %2628~1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) } %2627~1'(= r ) %2626~0'(= r ) 
; #22 1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) }
;; rsp=4 , %2629~0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) } %2627~1'(= r ) %2626~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) }
; .mov_ptn2 0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) } ⊢ 2'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] )
	ALC_RCD 4
	mov r13,rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*4]
	mov QWORD [r13+8+8*1],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*2],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*3],rax
	mov rax,r13
	mov BYTE [rax+6],1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,32
	jmp LB_4819
LB_4819:
	cmp BYTE [r8+6],0
	jnz LB_4789
	POP_GRM_SCC
	ret
LB_4789:
	RB_GRM
	jmp LB_4822
LB_4821:
	add r14,1 
LB_4822:
	cmp r14,r9
	jge LB_4823
	JZ_SPC BYTE [r13+8+r14], LB_4821
LB_4823
	call GRM_268
	cmp BYTE [r8+6],0
	jnz LB_4826
	jmp LB_4827
LB_4826:
	jmp LB_4824
LB_4827:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a27◂ [ ] ) ⊢ 8'(= a27◂ [ ] )
; .mov_ptn 2'(= a27◂ [ ] ) ⊢ 8'(= a27◂ [ ] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4825
LB_4824:
	add rsp,0
	jmp LB_4820
LB_4825:
	jmp LB_4829
LB_4828:
	add r14,1 
LB_4829:
	cmp r14,r9
	jge LB_4830
	JZ_SPC BYTE [r13+8+r14], LB_4828
LB_4830
	call GRM_272
	cmp BYTE [r8+6],0
	jnz LB_4833
	jmp LB_4834
LB_4833:
	jmp LB_4831
LB_4834:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a3◂ [ {| l |}] ) ⊢ 9'(= a3◂ [ {| l |}] )
; .mov_ptn 2'(= a3◂ [ {| l |}] ) ⊢ 9'(= a3◂ [ {| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4832
LB_4831:
	add rsp,8
	jmp LB_4820
LB_4832:
	jmp LB_4836
LB_4835:
	add r14,1 
LB_4836:
	cmp r14,r9
	jge LB_4837
	JZ_SPC BYTE [r13+8+r14], LB_4835
LB_4837
	call GRM_264
	cmp BYTE [r8+6],0
	jnz LB_4840
	jmp LB_4841
LB_4840:
	jmp LB_4838
LB_4841:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a28◂ [ a9◂ [ ]] ) ⊢ 10'(= a28◂ [ a9◂ [ ]] )
; .mov_ptn 2'(= a28◂ [ a9◂ [ ]] ) ⊢ 10'(= a28◂ [ a9◂ [ ]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4839
LB_4838:
	add rsp,16
	jmp LB_4820
LB_4839:
	jmp LB_4843
LB_4842:
	add r14,1 
LB_4843:
	cmp r14,r9
	jge LB_4844
	JZ_SPC BYTE [r13+8+r14], LB_4842
LB_4844
	call GRM_271
	cmp BYTE [r8+6],0
	jnz LB_4847
	jmp LB_4848
LB_4847:
	jmp LB_4845
LB_4848:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) ⊢ 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 2'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) ⊢ 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4846
LB_4845:
	add rsp,24
	jmp LB_4820
LB_4846:
	jmp LB_4850
LB_4849:
	add r14,1 
LB_4850:
	cmp r14,r9
	jge LB_4851
	JZ_SPC BYTE [r13+8+r14], LB_4849
LB_4851
	call GRM_270
	cmp BYTE [r8+6],0
	jnz LB_4854
	jmp LB_4855
LB_4854:
	jmp LB_4852
LB_4855:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 12'(= a25◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 12'(= a25◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4853
LB_4852:
	add rsp,32
	jmp LB_4820
LB_4853:
	mov QWORD [rsp+8*5],r14
	mov r13,QWORD [rsp+16+8*5]
	mov r14,QWORD [rsp+8*5]
	jmp LB_4856
LB_4856
;; rsp=5 , %2636~1'(= r ) %2635~0'(= r ) %2634~12'(= a25◂ [ a9◂ [ ]{| l |}] ) %2633~11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) %2632~10'(= a28◂ [ a9◂ [ ]] ) %2631~9'(= a3◂ [ {| l |}] ) %2630~8'(= a27◂ [ ] ) 
; #154 { 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) 12'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) 12'(= a25◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=5 , %2637~0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) 12'(= a25◂ [ a9◂ [ ]{| l |}] ) } %2636~1'(= r ) %2635~0'(= r ) 
; #22 0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) 12'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ 0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) 12'(= a25◂ [ a9◂ [ ]{| l |}] ) }
;; rsp=5 , %2638~0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) 12'(= a25◂ [ a9◂ [ ]{| l |}] ) } %2636~1'(= r ) %2635~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) 12'(= a25◂ [ a9◂ [ ]{| l |}] ) }
; .mov_ptn2 0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) 12'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] )
; .mov_ptn 0(<2)◂0(<2)◂{ 9'(= a3◂ [ {| l |}] ) 8'(= a27◂ [ ] ) 10'(= a28◂ [ a9◂ [ ]] ) 11'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] ) 12'(= a25◂ [ a9◂ [ ]{| l |}] ) } ⊢ 2'(= a3◂ [ a25◂ [ a9◂ [ ]{| l |}]] )
	ALC_RCD 5
	mov r13,rax
	mov rax,QWORD [rsp-8+8*4]
	mov QWORD [r13+8+8*0],rax
	mov rax,QWORD [rsp-8+8*5]
	mov QWORD [r13+8+8*1],rax
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [r13+8+8*2],rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [r13+8+8*3],rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [r13+8+8*4],rax
	mov rax,r13
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,40
	jmp LB_4857
LB_4857:
	cmp BYTE [r8+6],0
	jnz LB_4820
	POP_GRM_SCC
	ret
LB_4820:
	POP_GRM_FAIL 
	ret
ETR_271:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_271
	ret
GRM_271:
	PUSH_GRM
	jmp LB_4860
LB_4859:
	add r14,1 
LB_4860:
	cmp r14,r9
	jge LB_4861
	JZ_SPC BYTE [r13+8+r14], LB_4859
LB_4861
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4864
	jmp LB_4865
LB_4864:
	mov r8,unt_1
	jmp LB_4862
LB_4865:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],59
	jnz LB_4866
	jmp LB_4867
LB_4866:
	mov r8,unt_1
	jmp LB_4862
LB_4867:
	add r14,1
	jmp LB_4863
LB_4862:
	add rsp,0
	jmp LB_4858
LB_4863:
	jmp LB_4869
LB_4868:
	add r14,1 
LB_4869:
	cmp r14,r9
	jge LB_4870
	JZ_SPC BYTE [r13+8+r14], LB_4868
LB_4870
	call GRM_270
	cmp BYTE [r8+6],0
	jnz LB_4873
	jmp LB_4874
LB_4873:
	jmp LB_4871
LB_4874:
	sub rsp,8
	mov r8,[r8+8]
; .mov_ptn2 2'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a25◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn 2'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 8'(= a25◂ [ a9◂ [ ]{| l |}] )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4872
LB_4871:
	add rsp,0
	jmp LB_4858
LB_4872:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4875
LB_4875
;; rsp=1 , %2641~1'(= r ) %2640~0'(= r ) %2639~8'(= a25◂ [ a9◂ [ ]{| l |}] ) 
; #22 8'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %2642~0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] ) %2641~1'(= r ) %2640~0'(= r ) 
; #22 0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 0(<2)◂0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] )
;; rsp=1 , %2643~0(<2)◂0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] ) %2641~1'(= r ) %2640~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a3◂ [ a25◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= a25◂ [ a9◂ [ ]{| l |}] ) ⊢ 2'(= a3◂ [ a3◂ [ a25◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,QWORD [rsp-8+8*1]
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4876
LB_4876:
	cmp BYTE [r8+6],0
	jnz LB_4858
	POP_GRM_SCC
	ret
LB_4858:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4878
LB_4878
;; rsp=0 , %2645~1'(= r ) %2644~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2646~1(<2)◂{ } %2645~1'(= r ) %2644~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2647~0(<2)◂1(<2)◂{ } %2645~1'(= r ) %2644~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ a25◂ [ a9◂ [ ]{| l |}]]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ a25◂ [ a9◂ [ ]{| l |}]]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4879
LB_4879:
	cmp BYTE [r8+6],0
	jnz LB_4877
	POP_GRM_SCC
	ret
LB_4877:
	POP_GRM_FAIL 
	ret
ETR_272:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_272
	ret
GRM_272:
	PUSH_GRM
	jmp LB_4882
LB_4881:
	add r14,1 
LB_4882:
	cmp r14,r9
	jge LB_4883
	JZ_SPC BYTE [r13+8+r14], LB_4881
LB_4883
	call GRM_74
	cmp BYTE [r8+6],0
	jnz LB_4886
	jmp LB_4887
LB_4886:
	jmp LB_4884
LB_4887:
	sub rsp,8
; .mov_ptn2 2'(= {| l |} ) ⊢ 8'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 8'(= {| l |} )
	mov rax,r8
	mov QWORD [rsp-8+8*1],rax
	jmp LB_4885
LB_4884:
	add rsp,0
	jmp LB_4880
LB_4885:
	jmp LB_4889
LB_4888:
	add r14,1 
LB_4889:
	cmp r14,r9
	jge LB_4890
	JZ_SPC BYTE [r13+8+r14], LB_4888
LB_4890
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_4893
	jmp LB_4894
LB_4893:
	mov r8,unt_1
	jmp LB_4891
LB_4894:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],58
	jnz LB_4895
	jmp LB_4896
LB_4895:
	mov r8,unt_1
	jmp LB_4891
LB_4896:
	add r14,1
	jmp LB_4892
LB_4891:
	add rsp,8
	jmp LB_4880
LB_4892:
	mov QWORD [rsp+8*1],r14
	mov r13,QWORD [rsp+16+8*1]
	mov r14,QWORD [rsp+8*1]
	jmp LB_4897
LB_4897
;; rsp=1 , %2650~1'(= r ) %2649~0'(= r ) %2648~8'(= {| l |} ) 
; #22 8'(= {| l |} ) ⊢ 0(<2)◂8'(= {| l |} )
;; rsp=1 , %2651~0(<2)◂8'(= {| l |} ) %2650~1'(= r ) %2649~0'(= r ) 
; #22 0(<2)◂8'(= {| l |} ) ⊢ 0(<2)◂0(<2)◂8'(= {| l |} )
;; rsp=1 , %2652~0(<2)◂0(<2)◂8'(= {| l |} ) %2650~1'(= r ) %2649~0'(= r ) 
; ∎ 0(<2)◂0(<2)◂8'(= {| l |} )
; .mov_ptn2 0(<2)◂0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a3◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂0(<2)◂8'(= {| l |} ) ⊢ 2'(= a3◂ [ a3◂ [ {| l |}]] )
	mov rax,QWORD [rsp-8+8*1]
	mov BYTE [rax+6],0
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	add rsp,8
	jmp LB_4898
LB_4898:
	cmp BYTE [r8+6],0
	jnz LB_4880
	POP_GRM_SCC
	ret
LB_4880:
	RB_GRM
	mov QWORD [rsp+8*0],r14
	mov r13,QWORD [rsp+16+8*0]
	mov r14,QWORD [rsp+8*0]
	jmp LB_4900
LB_4900
;; rsp=0 , %2654~1'(= r ) %2653~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2655~1(<2)◂{ } %2654~1'(= r ) %2653~0'(= r ) 
; #22 1(<2)◂{ } ⊢ 0(<2)◂1(<2)◂{ }
;; rsp=0 , %2656~0(<2)◂1(<2)◂{ } %2654~1'(= r ) %2653~0'(= r ) 
; ∎ 0(<2)◂1(<2)◂{ }
; .mov_ptn2 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ {| l |}]] )
; .mov_ptn 0(<2)◂1(<2)◂{ } ⊢ 2'(= a3◂ [ a3◂ [ {| l |}]] )
	mov rax,unt 
	mov rax,unt_1
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r8,rax
	jmp LB_4901
LB_4901:
	cmp BYTE [r8+6],0
	jnz LB_4899
	POP_GRM_SCC
	ret
LB_4899:
	POP_GRM_FAIL 
	ret
LB_4904:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4908+8*rax]
LB_4908: dq LB_4906,LB_4907
LB_4906:
	mov rdi,LB_4910
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4911
	jmp LB_4909
LB_4907:
	mov rdi,LB_4912
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4909
LB_4909:
	ret
LB_4911:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4915+8*rax]
LB_4915: dq LB_4913,LB_4914
LB_4913:
	mov rdi,LB_4917
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4918
	jmp LB_4916
LB_4914:
	mov rdi,LB_4919
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4920
	jmp LB_4916
LB_4916:
	ret
LB_4920:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4923+8*rax]
LB_4923: dq LB_4921,LB_4922
LB_4921:
	mov rdi,LB_4925
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4926
	jmp LB_4924
LB_4922:
	mov rdi,LB_4927
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4924
LB_4924:
	ret
LB_4926:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4930+8*rax]
LB_4930: dq LB_4928,LB_4929
LB_4928:
	mov rdi,LB_4932
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_4931
LB_4929:
	mov rdi,LB_4933
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4931
LB_4931:
	ret
LB_4918:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4936+8*rax]
LB_4936: dq LB_4934,LB_4935
LB_4934:
	mov rdi,LB_4938
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4911
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4918
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4937
LB_4935:
	mov rdi,LB_4939
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4937
LB_4937:
	ret
ETR_274: ;; E1 { } ⊢ { } : ({ }→{ })
;; rsp=0 , 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	add rdi,3
	push rdi 
	call mlc_s8
	pop rdi
	mov r13,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_4902+3-1]
	mov rcx,3
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %2678~0'(= {| l |} ) 
; #205 { 0'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] ) }
; .mov_ptn2 { 0'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
	call ETR_205
;; rsp=0 , %2681~2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %2680~1'(= r ) %2679~0'(= {| l |} ) 
; #10 1'(= r ) ⊢ 1'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4903
LB_4903:
;; rsp=0 , %2681~2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %2679~0'(= {| l |} ) 
; #10 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r8
	call LB_4904
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4905
LB_4905:
;; rsp=0 , %2683~2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] ) %2679~0'(= {| l |} ) 
;; ? 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 0(<2)◂1'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_4940
	mov r14,QWORD [rdi+8]
;; rsp=0 , %2684~1'(= a8◂ [ a13◂ [ {| l |}]] ) %2679~0'(= {| l |} ) 
; #10 %[ "D0" ] ⊢ %[ "D0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_4941
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4942
LB_4942:
;; rsp=0 , %2684~1'(= a8◂ [ a13◂ [ {| l |}]] ) %2679~0'(= {| l |} ) 
; #99 1'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 1'(= {| l |} )
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 1'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
; .mov_ptn 1'(= a8◂ [ a13◂ [ {| l |}]] ) ⊢ 0'(= a8◂ [ a13◂ [ {| l |}]] )
	mov rax,r14
	mov r13,rax
	call ETR_99
	mov r14,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %2686~1'(= {| l |} ) %2679~0'(= {| l |} ) 
; #10 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4943
LB_4943:
;; rsp=0 , %2679~0'(= {| l |} ) 
; ∎ { }
; .mov_ptn2 { } ⊢ { }
	ret
LB_4940:
;; ?. 2'(= a3◂ [ a8◂ [ a13◂ [ {| l |}]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %2679~0'(= {| l |} ) 
	mov rdi,LB_4944
	call emt_stg 
	jmp err
ETR_275: ;; f0 0'(= r ) ⊢ 0'(= a3◂ [ r] ) : (_r64→_opn◂_r64)
;; rsp=0 , %2688~0'(= r ) 
	mov rdi,97
	cmp r13,rdi
;;97 =< .. 
	jl LB_4945
	mov rdi,122
	cmp r13,rdi
;; .. =< 122
	jg LB_4945
;; rsp=0 , %2688~0'(= r ) 
; #22 0'(= r ) ⊢ 0(<2)◂0'(= r )
;; rsp=0 , %2689~0(<2)◂0'(= r ) 
; ∎ 0(<2)◂0'(= r )
; .mov_ptn2 0(<2)◂0'(= r ) ⊢ 0'(= a3◂ [ r] )
	mov r14,r13
; .mov_ptn 0(<2)◂1'(= r ) ⊢ 0'(= a3◂ [ r] )
	mov rax,r14
	mov rdi,rax
	mov rax,SS_LN_REG
	mov SS_LN_REG,QWORD [SS_LN_REG] 
	mov BYTE [rax+6],0
	mov QWORD [rax+8],rdi
	mov r13,rax
	ret
LB_4945:
;; rsp=0 , %2688~0'(= r ) 
; #23 { } ⊢ 1(<2)◂{ }
;; rsp=0 , %2690~1(<2)◂{ } %2688~0'(= r ) 
; ∎ 1(<2)◂{ }
; .mov_ptn2 1(<2)◂{ } ⊢ 0'(= a3◂ [ r] )
; .mov_ptn 1(<2)◂{ } ⊢ 0'(= a3◂ [ r] )
	mov rax,unt 
	mov rax,unt_1
	mov r13,rax
	ret
RTM_0:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	add rdi,17
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_4946+17-1]
	mov rcx,17
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %2691~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; #10 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4947
LB_4947:
;; rsp=0 , %2692~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; #243 { 1'(= {| l |} ) %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { 1'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
	call ETR_243
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; ∎
	jmp RTM_1
LB_4949:
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
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
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
	mov r8,QWORD [r8+8]
	call LB_4963
	jmp LB_4961
LB_4959:
	mov rdi,LB_4964
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4965
	jmp LB_4961
LB_4961:
	ret
LB_4965:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4968+8*rax]
LB_4968: dq LB_4966,LB_4967
LB_4966:
	mov rdi,LB_4970
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
	call LB_4965
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4969
LB_4967:
	mov rdi,LB_4971
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4969
LB_4969:
	ret
LB_4963:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4979+8*rax]
LB_4979: dq LB_4972,LB_4973,LB_4974,LB_4975,LB_4976,LB_4977,LB_4978
LB_4972:
	mov rdi,LB_4981
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4982
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4983
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4980
LB_4973:
	mov rdi,LB_4984
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
	call LB_4983
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4980
LB_4974:
	mov rdi,LB_4986
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4987
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4963
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4980
LB_4975:
	mov rdi,LB_4988
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4989
	jmp LB_4980
LB_4976:
	mov rdi,LB_4990
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4983
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4991
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4980
LB_4977:
	mov rdi,LB_4992
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4983
	jmp LB_4980
LB_4978:
	mov rdi,LB_4993
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_4980
LB_4980:
	ret
LB_4991:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_4996+8*rax]
LB_4996: dq LB_4994,LB_4995
LB_4994:
	mov rdi,LB_4998
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4999
	jmp LB_4997
LB_4995:
	mov rdi,LB_5000
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4918
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4963
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_4997
LB_4997:
	ret
LB_4999:
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
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5006
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5007
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5008
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
	call LB_4999
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5004
LB_5002:
	mov rdi,LB_5009
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5006
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5007
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5008
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5004
LB_5004:
	ret
LB_5008:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5013+8*rax]
LB_5013: dq LB_5010,LB_5011,LB_5012
LB_5010:
	mov rdi,LB_5015
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4989
	jmp LB_5014
LB_5011:
	mov rdi,LB_5016
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4983
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4999
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5014
LB_5012:
	mov rdi,LB_5017
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4963
	jmp LB_5014
LB_5014:
	ret
LB_5007:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5020+8*rax]
LB_5020: dq LB_5018,LB_5019
LB_5018:
	mov rdi,LB_5022
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5023
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5007
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5021
LB_5019:
	mov rdi,LB_5024
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5021
LB_5021:
	ret
LB_5023:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5028+8*rax]
LB_5028: dq LB_5025,LB_5026,LB_5027
LB_5025:
	mov rdi,LB_5030
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4983
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5006
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5029
LB_5026:
	mov rdi,LB_5031
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5032
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5032
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5029
LB_5027:
	mov rdi,LB_5033
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5032
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5032
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5029
LB_5029:
	ret
LB_5032:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5036+8*rax]
LB_5036: dq LB_5034,LB_5035
LB_5034:
	mov rdi,LB_5038
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5039
	jmp LB_5037
LB_5035:
	mov rdi,LB_5040
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5037
LB_5037:
	ret
LB_5039:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5043+8*rax]
LB_5043: dq LB_5041,LB_5042
LB_5041:
	mov rdi,LB_5045
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5046
	jmp LB_5044
LB_5042:
	mov rdi,LB_5047
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4982
	jmp LB_5044
LB_5044:
	ret
LB_5046:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5050+8*rax]
LB_5050: dq LB_5048,LB_5049
LB_5048:
	mov rdi,LB_5052
	call emt_stg 
	mov r8,QWORD [r8+8]
	mov rdi,r8 
	call emt_r64 
	jmp LB_5051
LB_5049:
	mov rdi,LB_5053
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5051
LB_5051:
	ret
LB_5006:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5056+8*rax]
LB_5056: dq LB_5054,LB_5055
LB_5054:
	mov rdi,LB_5058
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5059
	jmp LB_5057
LB_5055:
	mov rdi,LB_5060
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5061
	jmp LB_5057
LB_5057:
	ret
LB_5061:
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
	call LB_4982
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5006
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5067
LB_5063:
	mov rdi,LB_5069
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5039
	jmp LB_5067
LB_5064:
	mov rdi,LB_5070
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4926
	jmp LB_5067
LB_5065:
	mov rdi,LB_5071
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5067
LB_5067:
	ret
LB_5059:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5074+8*rax]
LB_5074: dq LB_5072,LB_5073
LB_5072:
	mov rdi,LB_5076
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5006
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5059
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5075
LB_5073:
	mov rdi,LB_5077
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5075
LB_5075:
	ret
LB_4989:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5080+8*rax]
LB_5080: dq LB_5078,LB_5079
LB_5078:
	mov rdi,LB_5082
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5007
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5008
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
	call LB_4989
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5081
LB_5079:
	mov rdi,LB_5083
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5007
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5008
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5081
LB_5081:
	ret
LB_4987:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5088+8*rax]
LB_5088: dq LB_5084,LB_5085,LB_5086,LB_5087
LB_5084:
	mov rdi,LB_5090
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4982
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4983
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4911
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5089
LB_5085:
	mov rdi,LB_5091
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
	call LB_4983
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4911
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5089
LB_5086:
	mov rdi,LB_5092
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5039
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4983
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4911
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5089
LB_5087:
	mov rdi,LB_5093
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5094
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5095
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5096
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5089
LB_5089:
	ret
LB_5096:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5099+8*rax]
LB_5099: dq LB_5097,LB_5098
LB_5097:
	mov rdi,LB_5101
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4920
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5096
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5100
LB_5098:
	mov rdi,LB_5102
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5100
LB_5100:
	ret
LB_5095:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5105+8*rax]
LB_5105: dq LB_5103,LB_5104
LB_5103:
	mov rdi,LB_5107
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
	call LB_5095
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5106
LB_5104:
	mov rdi,LB_5108
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5106
LB_5106:
	ret
LB_5094:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5111+8*rax]
LB_5111: dq LB_5109,LB_5110
LB_5109:
	mov rdi,LB_5113
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5114
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5094
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5112
LB_5110:
	mov rdi,LB_5115
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5112
LB_5112:
	ret
LB_5114:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5120+8*rax]
LB_5120: dq LB_5116,LB_5117,LB_5118,LB_5119
LB_5116:
	mov rdi,LB_5122
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5121
LB_5117:
	mov rdi,LB_5123
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5039
	jmp LB_5121
LB_5118:
	mov rdi,LB_5124
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5125
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
	jmp LB_5121
LB_5119:
	mov rdi,LB_5126
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
	call emt_s8
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5121
LB_5121:
	ret
LB_5125:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5131+8*rax]
LB_5131: dq LB_5127,LB_5128,LB_5129,LB_5130
LB_5127:
	mov rdi,LB_5133
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5132
LB_5128:
	mov rdi,LB_5134
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5132
LB_5129:
	mov rdi,LB_5135
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5132
LB_5130:
	mov rdi,LB_5136
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5132
LB_5132:
	ret
LB_4985:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5139+8*rax]
LB_5139: dq LB_5137,LB_5138
LB_5137:
	mov rdi,LB_5141
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5039
	jmp LB_5140
LB_5138:
	mov rdi,LB_5142
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5140
LB_5140:
	ret
LB_4983:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5145+8*rax]
LB_5145: dq LB_5143,LB_5144
LB_5143:
	mov rdi,LB_5147
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5148
	jmp LB_5146
LB_5144:
	mov rdi,LB_5149
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4985
	jmp LB_5146
LB_5146:
	ret
LB_5148:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5152+8*rax]
LB_5152: dq LB_5150,LB_5151
LB_5150:
	mov rdi,LB_5154
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4983
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5148
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5153
LB_5151:
	mov rdi,LB_5155
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5153
LB_5153:
	ret
LB_4982:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5158+8*rax]
LB_5158: dq LB_5156,LB_5157
LB_5156:
	mov rdi,LB_5160
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
	call LB_4982
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5159
LB_5157:
	mov rdi,LB_5161
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5159
LB_5159:
	ret
LB_5170:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5174+8*rax]
LB_5174: dq LB_5172,LB_5173
LB_5172:
	mov rdi,LB_5176
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5177
	jmp LB_5175
LB_5173:
	mov rdi,LB_5178
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5175
LB_5175:
	ret
LB_5177:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5181+8*rax]
LB_5181: dq LB_5179,LB_5180
LB_5179:
	mov rdi,LB_5183
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5184
	jmp LB_5182
LB_5180:
	mov rdi,LB_5185
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4965
	jmp LB_5182
LB_5182:
	ret
LB_5184:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5188+8*rax]
LB_5188: dq LB_5186,LB_5187
LB_5186:
	mov rdi,LB_5190
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5191
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
	jmp LB_5189
LB_5187:
	mov rdi,LB_5192
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5189
LB_5189:
	ret
LB_5191:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5199+8*rax]
LB_5199: dq LB_5193,LB_5194,LB_5195,LB_5196,LB_5197,LB_5198
LB_5193:
	mov rdi,LB_5201
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
	call LB_5202
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5200
LB_5194:
	mov rdi,LB_5203
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5204
	jmp LB_5200
LB_5195:
	mov rdi,LB_5205
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
	call LB_5206
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5200
LB_5196:
	mov rdi,LB_5207
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5208
	jmp LB_5200
LB_5197:
	mov rdi,LB_5209
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
	call LB_5210
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5200
LB_5198:
	mov rdi,LB_5211
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5212
	jmp LB_5200
LB_5200:
	ret
LB_5212:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5215+8*rax]
LB_5215: dq LB_5213,LB_5214
LB_5213:
	mov rdi,LB_5217
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
	call LB_5210
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
	call LB_5212
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5216
LB_5214:
	mov rdi,LB_5218
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5216
LB_5216:
	ret
LB_5210:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5221+8*rax]
LB_5221: dq LB_5219,LB_5220
LB_5219:
	mov rdi,LB_5223
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5224
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5225
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5222
LB_5220:
	mov rdi,LB_5226
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5224
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5227
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5222
LB_5222:
	ret
LB_5227:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5233+8*rax]
LB_5233: dq LB_5228,LB_5229,LB_5230,LB_5231,LB_5232
LB_5228:
	mov rdi,LB_5235
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5236
	jmp LB_5234
LB_5229:
	mov rdi,LB_5237
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5227
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5227
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5234
LB_5230:
	mov rdi,LB_5238
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5227
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5227
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5234
LB_5231:
	mov rdi,LB_5239
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4982
	jmp LB_5234
LB_5232:
	mov rdi,LB_5240
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5234
LB_5234:
	ret
LB_5236:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5243+8*rax]
LB_5243: dq LB_5241,LB_5242
LB_5241:
	mov rdi,LB_5245
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5227
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5236
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5244
LB_5242:
	mov rdi,LB_5246
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5244
LB_5244:
	ret
LB_5225:
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
	call LB_5227
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
	call LB_5225
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5250
LB_5248:
	mov rdi,LB_5252
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5250
LB_5250:
	ret
LB_5224:
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
	mov rdi,r8
	call emt_s8
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5224
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
LB_5208:
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
	call LB_4911
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5264
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_4963
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
	call LB_5208
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5262
LB_5260:
	mov rdi,LB_5265
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5262
LB_5262:
	ret
LB_5264:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5268+8*rax]
LB_5268: dq LB_5266,LB_5267
LB_5266:
	mov rdi,LB_5270
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5227
	jmp LB_5269
LB_5267:
	mov rdi,LB_5271
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5269
LB_5269:
	ret
LB_5206:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5275+8*rax]
LB_5275: dq LB_5272,LB_5273,LB_5274
LB_5272:
	mov rdi,LB_5277
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4911
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5264
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4963
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5276
LB_5273:
	mov rdi,LB_5278
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5039
	jmp LB_5276
LB_5274:
	mov rdi,LB_5279
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4963
	jmp LB_5276
LB_5276:
	ret
LB_5204:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5282+8*rax]
LB_5282: dq LB_5280,LB_5281
LB_5280:
	mov rdi,LB_5284
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
	call LB_5285
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
	call LB_5204
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5283
LB_5281:
	mov rdi,LB_5286
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5283
LB_5283:
	ret
LB_5285:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5289+8*rax]
LB_5289: dq LB_5287,LB_5288
LB_5287:
	mov rdi,LB_5291
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5292
	jmp LB_5290
LB_5288:
	mov rdi,LB_5293
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5294
	jmp LB_5290
LB_5290:
	ret
LB_5294:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5297+8*rax]
LB_5297: dq LB_5295,LB_5296
LB_5295:
	mov rdi,LB_5299
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5096
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4911
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4963
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5300
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_5301
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_5302
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*6]
	call LB_5294
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5298
LB_5296:
	mov rdi,LB_5303
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5096
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_4911
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_4963
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5300
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_5301
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*5]
	call LB_5302
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5298
LB_5298:
	ret
LB_5302:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5306+8*rax]
LB_5306: dq LB_5304,LB_5305
LB_5304:
	mov rdi,LB_5308
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4911
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5294
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5307
LB_5305:
	mov rdi,LB_5309
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5307
LB_5307:
	ret
LB_5301:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5313+8*rax]
LB_5313: dq LB_5310,LB_5311,LB_5312
LB_5310:
	mov rdi,LB_5315
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5316
	jmp LB_5314
LB_5311:
	mov rdi,LB_5317
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5318
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5301
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5314
LB_5312:
	mov rdi,LB_5319
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5314
LB_5314:
	ret
LB_5318:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5322+8*rax]
LB_5322: dq LB_5320,LB_5321
LB_5320:
	mov rdi,LB_5324
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5325
	jmp LB_5323
LB_5321:
	mov rdi,LB_5326
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5325
	jmp LB_5323
LB_5323:
	ret
LB_5325:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5329+8*rax]
LB_5329: dq LB_5327,LB_5328
LB_5327:
	mov rdi,LB_5331
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4982
	jmp LB_5330
LB_5328:
	mov rdi,LB_5332
	call emt_stg 
	mov rdi,r8
	call emt_s8
	jmp LB_5330
LB_5330:
	ret
LB_5316:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5335+8*rax]
LB_5335: dq LB_5333,LB_5334
LB_5333:
	mov rdi,LB_5337
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_5318
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5316
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5336
LB_5334:
	mov rdi,LB_5338
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5336
LB_5336:
	ret
LB_5300:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5342+8*rax]
LB_5342: dq LB_5339,LB_5340,LB_5341
LB_5339:
	mov rdi,LB_5344
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5343
LB_5340:
	mov rdi,LB_5345
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5343
LB_5341:
	mov rdi,LB_5346
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5343
LB_5343:
	ret
LB_5292:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5349+8*rax]
LB_5349: dq LB_5347,LB_5348
LB_5347:
	mov rdi,LB_5351
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4926
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5300
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5301
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5352
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*4]
	call LB_5292
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5350
LB_5348:
	mov rdi,LB_5353
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	push r8
	mov r8,QWORD [r8+8+8*0]
	call LB_4926
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*1]
	call LB_5300
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*2]
	call LB_5301
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	push r8
	mov r8,QWORD [r8+8+8*3]
	call LB_5352
	pop r8 
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5350
LB_5350:
	ret
LB_5352:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5356+8*rax]
LB_5356: dq LB_5354,LB_5355
LB_5354:
	mov rdi,LB_5358
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5292
	jmp LB_5357
LB_5355:
	mov rdi,LB_5359
	call emt_stg 
	mov rdi,fmt_rcd_box_l
	call emt_stg
	mov rdi,fmt_rcd_r
	call emt_stg
	jmp LB_5357
LB_5357:
	ret
LB_5202:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_5362+8*rax]
LB_5362: dq LB_5360,LB_5361
LB_5360:
	mov rdi,LB_5364
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_5184
	jmp LB_5363
LB_5361:
	mov rdi,LB_5365
	call emt_stg 
	mov r8,QWORD [r8+8]
	call LB_4982
	jmp LB_5363
LB_5363:
	ret
LB_5165: ;; #273 0'(= {| l |} ) ⊢ { } : (_s8→{ })
;; rsp=0 , %2657~0'(= {| l |} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	add rdi,17
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_5166+17-1]
	mov rcx,17
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %2658~1'(= {| l |} ) %2657~0'(= {| l |} ) 
; #10 1'(= {| l |} ) ⊢ 1'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5167
LB_5167:
;; rsp=0 , %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
; #24 %[ "cst24.mdls" ] ⊢ { %[ "cst24.mdls" ] 2'(= {| l |} ) }
	C_PUSH_REGS
	mov rdi,LB_5168
	call in_fn 
	C_POP_REGS
	mov r8,rax
;; rsp=0 , %2661~2'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
; #243 { 2'(= {| l |} ) %[ 0r ] } ⊢ { 4'(= {| l |} ) 3'(= r ) 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] ) }
	sub rsp,16
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
; .mov_ptn2 { 2'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	call ETR_243
	mov r9,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r10,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,16
;; rsp=0 , %2664~2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] ) %2663~3'(= r ) %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
; #10 3'(= r ) ⊢ 3'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r9
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5169
LB_5169:
;; rsp=0 , %2664~2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] ) %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
; #10 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] ) ⊢ 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r8
	call LB_5170
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5171
LB_5171:
;; rsp=0 , %2666~2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] ) %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
;; ? 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] ) ⊢ 0(<2)◂3'(= a35◂ [ a2◂ [ a31◂ [ ]]] )
	mov rdi,r8
	cmp BYTE [rdi+6],0
	jnz LB_5366
	mov r9,QWORD [rdi+8]
;; rsp=0 , %2667~3'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
;; ? 3'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 0(<2)◂2'(= a2◂ [ a31◂ [ ]] )
	mov rdi,r9
	cmp BYTE [rdi+6],0
	jnz LB_5367
	mov r8,QWORD [rdi+8]
;; rsp=0 , %2669~2'(= a2◂ [ a31◂ [ ]] ) %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
; #10 %[ "D0" ] ⊢ %[ "D0" ]
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,LB_5368
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5369
LB_5369:
;; rsp=0 , %2669~2'(= a2◂ [ a31◂ [ ]] ) %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
; #177 { %[ 0r ] 2'(= a2◂ [ a31◂ [ ]] ) } ⊢ { 3'(= r ) 2'(= {| l |} ) }
	sub rsp,24
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r10
; .mov_ptn2 { %[ 0r ] 2'(= a2◂ [ a31◂ [ ]] ) } ⊢ { 0'(= r ) 1'(= a2◂ [ a31◂ [ ]] ) }
; .mov_ptn 2'(= a2◂ [ a31◂ [ ]] ) ⊢ 1'(= a2◂ [ a31◂ [ ]] )
	mov rax,r8
	mov r14,rax
; .mov_ptn %[ 0r ] ⊢ 0'(= r )
	mov rax,0
	mov r13,rax
	call ETR_177
	mov r10,QWORD [rsp-8+8*3]
	mov r8,r14
	mov r14,QWORD [rsp-8+8*2]
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,24
;; rsp=0 , %2672~2'(= {| l |} ) %2671~3'(= r ) %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
; #9 2'(= {| l |} ) ⊢ { 2'(= {| l |} ) 5'(= r ) }
	mov rdi,r8
	mov rdi,QWORD [rdi] 
	mov rsi,0x0000_ffff_ffff_ffff
	and rdi,rsi 
	mov r11,rdi
;; rsp=0 , %2674~5'(= r ) %2673~2'(= {| l |} ) %2671~3'(= r ) %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
; #10 5'(= r ) ⊢ 5'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r11
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5370
LB_5370:
;; rsp=0 , %2673~2'(= {| l |} ) %2671~3'(= r ) %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
; #10 3'(= r ) ⊢ 3'(= r )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r9
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5371
LB_5371:
;; rsp=0 , %2673~2'(= {| l |} ) %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
; #10 2'(= {| l |} ) ⊢ 2'(= {| l |} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r8
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5372
LB_5372:
;; rsp=0 , %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
; ∎ { }
; .mov_ptn2 { } ⊢ { }
	ret
LB_5367:
;; ?. 3'(= a35◂ [ a2◂ [ a31◂ [ ]]] ) ⊢ 1(<2)◂2'(= a2◂ [ *{ rr{| l |}}] )
	mov r8,QWORD [rdi+8]
;; rsp=0 , %2668~2'(= a2◂ [ *{ rr{| l |}}] ) %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
	mov rdi,LB_5373
	call emt_stg 
	jmp err
LB_5366:
;; ?. 2'(= a3◂ [ a35◂ [ a2◂ [ a31◂ [ ]]]] ) ⊢ 1(<2)◂{ }
;; rsp=0 , %2662~4'(= {| l |} ) %2659~1'(= {| l |} ) %2657~0'(= {| l |} ) 
	mov rdi,LB_5374
	call emt_stg 
	jmp err
RTM_1:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; » _^ .. ⊢ ..
; .. //
	mov rdi,0
	add rdi,8
	push rdi 
	call mlc_s8
	pop rdi
	mov r14,rax
	lea rdi,[rax+7+rdi]
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_4948+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp] 
;; rsp=0 , %2694~1'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; #234 { 1'(= {| l |} ) %[ 0r ] } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] ) }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { 1'(= {| l |} ) %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn 1'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r14
	mov r13,rax
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov rax,0
	mov r14,rax
	call ETR_234
	mov r9,r13
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %2697~2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] ) %2696~1'(= r ) %2695~3'(= {| l |} ) %0~0'(= {| {| l |}|} ) 
; #10 { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] ) } ⊢ { 3'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ a35◂ [ a17◂ [ a9◂ [ ]{| l |}]]] ) }
	mov rdi,fmt_emt
	call emt_stg
	mov rdi,fmt_rcd_l 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r9
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r14
	mov rdi,r8 
	call emt_r64 
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	C_PUSH_REGS
	mov r8,r8
	call LB_4949
	C_POP_REGS
	mov rdi,fmt_spc 
	call emt_stg 
	mov rdi,fmt_rcd_r 
	call emt_stg 
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_4950
LB_4950:
;; rsp=0 , %0~0'(= {| {| l |}|} ) 
; #10 0'(= {| {| l |}|} ) ⊢ 0'(= {| {| l |}|} )
	mov rdi,fmt_emt
	call emt_stg
	C_PUSH_REGS
	mov r8,r13
	mov rdi,fmt_arr_l 
	call emt_stg 
	mov rsi,[r8]
	mov rax,0 
LB_5162:
	cmp rsi,rax 
	jz LB_5163
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
	jmp LB_5162
LB_5163:
	mov rdi,fmt_arr_r 
	call emt_stg
	C_POP_REGS
	mov rdi,fmt_nl
	call emt_stg
	jmp LB_5164
LB_5164:
;; rsp=0 , %2699~0'(= {| {| l |}|} ) 
; #274 { } ⊢ { }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 { } ⊢ { }
	call ETR_274
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %2699~0'(= {| {| l |}|} ) 
; #4 { 0'(= {| {| l |}|} ) %[ 1r ] } ⊢ { 0'(= {| {| l |}|} ) %[ 1r ] 2'(= {| l |} ) }
	mov rax,1
	mov rdi,r13
	mov rdi,[rdi+8+8*rax]
	C_PUSH_REGS
	call rpc_s8  
	C_POP_REGS
	mov r14,rax
; .mov_ptn2 1'(= {| l |} ) ⊢ 2'(= {| l |} )
	mov r9,r8
; .mov_ptn 1'(= {| l |} ) ⊢ 2'(= {| l |} )
	mov rax,r14
	mov r8,rax
;; rsp=0 , %2703~2'(= {| l |} ) %2701~0'(= {| {| l |}|} ) 
; #273 2'(= {| l |} ) ⊢ { }
	sub rsp,8
	mov QWORD [rsp+8*0],r13
; .mov_ptn2 2'(= {| l |} ) ⊢ 0'(= {| l |} )
; .mov_ptn 2'(= {| l |} ) ⊢ 0'(= {| l |} )
	mov rax,r8
	mov r13,rax
	call LB_5165
	mov r13,QWORD [rsp-8+8*1]
	add rsp,8
;; rsp=0 , %2701~0'(= {| {| l |}|} ) 
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
