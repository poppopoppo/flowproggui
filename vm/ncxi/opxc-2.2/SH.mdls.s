%include "HD.s"  
;	v.0
%define RCD_N 32
%define GLV_N 131
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)				
 
section .bss
%include "BSS.s"

	SS_RCD_1_VCT: resq (1+1)*((1<<6)+4)
	SS_RCD_2_VCT: resq (2+1)*((1<<6)+4)
	SS_RCD_3_VCT: resq (3+1)*((1<<6)+4)
	SS_RCD_4_VCT: resq (4+1)*((1<<6)+4)
	SS_RCD_5_VCT: resq (5+1)*((1<<6)+4)
	SS_RCD_6_VCT: resq (6+1)*((1<<6)+4)
	SS_RCD_7_VCT: resq (7+1)*((1<<6)+4)
	SS_RCD_8_VCT: resq (8+1)*((1<<6)+4)
	SS_RCD_9_VCT: resq (9+1)*((1<<6)+4)
	SS_RCD_10_VCT: resq (10+1)*((1<<6)+4)
	SS_RCD_11_VCT: resq (11+1)*((1<<6)+4)
	SS_RCD_12_VCT: resq (12+1)*((1<<6)+4)
	SS_RCD_13_VCT: resq (13+1)*((1<<6)+4)
	SS_RCD_14_VCT: resq (14+1)*((1<<6)+4)
	SS_RCD_15_VCT: resq (15+1)*((1<<6)+4)
	SS_RCD_16_VCT: resq (16+1)*((1<<6)+4)
	SS_RCD_17_VCT: resq (17+1)*((1<<6)+4)
	SS_RCD_18_VCT: resq (18+1)*((1<<6)+4)
	SS_RCD_19_VCT: resq (19+1)*((1<<6)+4)
	SS_RCD_20_VCT: resq (20+1)*((1<<6)+4)
	SS_RCD_21_VCT: resq (21+1)*((1<<6)+4)
	SS_RCD_22_VCT: resq (22+1)*((1<<6)+4)
	SS_RCD_23_VCT: resq (23+1)*((1<<6)+4)
	SS_RCD_24_VCT: resq (24+1)*((1<<6)+4)
	SS_RCD_25_VCT: resq (25+1)*((1<<6)+4)
	SS_RCD_26_VCT: resq (26+1)*((1<<6)+4)
	SS_RCD_27_VCT: resq (27+1)*((1<<6)+4)
	SS_RCD_28_VCT: resq (28+1)*((1<<6)+4)
	SS_RCD_29_VCT: resq (29+1)*((1<<6)+4)
	SS_RCD_30_VCT: resq (30+1)*((1<<6)+4)
	SS_RCD_31_VCT: resq (31+1)*((1<<6)+4)
section .data
%include "DATA.s"
					
LB_1: db 44,46,46,0
LB_2: db 49,53,0
LB_3: db 44,0
LB_4: db 51,52,0
LB_5: db 32,58,32,123,32,95,115,56,226,151,130,32,95,114,54,52,226,151,130,125,10,0
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
; ini_prc 
	C_CALL ini_prc 
; set signal handler 
	mov rdi,SIG_SEGV 
	mov rsi,sig_hdl 
	C_CALL set_handler 
	mov QWORD [SIG_ETR],sig_dft 
	mov QWORD [SIG_FLG],0 

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
	mov QWORD [SS_RCD_TOP+8*1],SS_RCD_1_VCT
	mov rax,SS_RCD_1_VCT
	mov rdi,(1<<6)
	mov rdx,1
	call ss_lp

init_ss_rcd_2:
	mov QWORD [SS_RCD_N+8*2],0
	mov QWORD [SS_RCD_C+8*2],0
	mov QWORD [SS_RCD_TOP+8*2],SS_RCD_2_VCT
	mov rax,SS_RCD_2_VCT
	mov rdi,(1<<6)
	mov rdx,2
	call ss_lp

init_ss_rcd_3:
	mov QWORD [SS_RCD_N+8*3],0
	mov QWORD [SS_RCD_C+8*3],0
	mov QWORD [SS_RCD_TOP+8*3],SS_RCD_3_VCT
	mov rax,SS_RCD_3_VCT
	mov rdi,(1<<6)
	mov rdx,3
	call ss_lp

init_ss_rcd_4:
	mov QWORD [SS_RCD_N+8*4],0
	mov QWORD [SS_RCD_C+8*4],0
	mov QWORD [SS_RCD_TOP+8*4],SS_RCD_4_VCT
	mov rax,SS_RCD_4_VCT
	mov rdi,(1<<6)
	mov rdx,4
	call ss_lp

init_ss_rcd_5:
	mov QWORD [SS_RCD_N+8*5],0
	mov QWORD [SS_RCD_C+8*5],0
	mov QWORD [SS_RCD_TOP+8*5],SS_RCD_5_VCT
	mov rax,SS_RCD_5_VCT
	mov rdi,(1<<6)
	mov rdx,5
	call ss_lp

init_ss_rcd_6:
	mov QWORD [SS_RCD_N+8*6],0
	mov QWORD [SS_RCD_C+8*6],0
	mov QWORD [SS_RCD_TOP+8*6],SS_RCD_6_VCT
	mov rax,SS_RCD_6_VCT
	mov rdi,(1<<6)
	mov rdx,6
	call ss_lp

init_ss_rcd_7:
	mov QWORD [SS_RCD_N+8*7],0
	mov QWORD [SS_RCD_C+8*7],0
	mov QWORD [SS_RCD_TOP+8*7],SS_RCD_7_VCT
	mov rax,SS_RCD_7_VCT
	mov rdi,(1<<6)
	mov rdx,7
	call ss_lp

init_ss_rcd_8:
	mov QWORD [SS_RCD_N+8*8],0
	mov QWORD [SS_RCD_C+8*8],0
	mov QWORD [SS_RCD_TOP+8*8],SS_RCD_8_VCT
	mov rax,SS_RCD_8_VCT
	mov rdi,(1<<6)
	mov rdx,8
	call ss_lp

init_ss_rcd_9:
	mov QWORD [SS_RCD_N+8*9],0
	mov QWORD [SS_RCD_C+8*9],0
	mov QWORD [SS_RCD_TOP+8*9],SS_RCD_9_VCT
	mov rax,SS_RCD_9_VCT
	mov rdi,(1<<6)
	mov rdx,9
	call ss_lp

init_ss_rcd_10:
	mov QWORD [SS_RCD_N+8*10],0
	mov QWORD [SS_RCD_C+8*10],0
	mov QWORD [SS_RCD_TOP+8*10],SS_RCD_10_VCT
	mov rax,SS_RCD_10_VCT
	mov rdi,(1<<6)
	mov rdx,10
	call ss_lp

init_ss_rcd_11:
	mov QWORD [SS_RCD_N+8*11],0
	mov QWORD [SS_RCD_C+8*11],0
	mov QWORD [SS_RCD_TOP+8*11],SS_RCD_11_VCT
	mov rax,SS_RCD_11_VCT
	mov rdi,(1<<6)
	mov rdx,11
	call ss_lp

init_ss_rcd_12:
	mov QWORD [SS_RCD_N+8*12],0
	mov QWORD [SS_RCD_C+8*12],0
	mov QWORD [SS_RCD_TOP+8*12],SS_RCD_12_VCT
	mov rax,SS_RCD_12_VCT
	mov rdi,(1<<6)
	mov rdx,12
	call ss_lp

init_ss_rcd_13:
	mov QWORD [SS_RCD_N+8*13],0
	mov QWORD [SS_RCD_C+8*13],0
	mov QWORD [SS_RCD_TOP+8*13],SS_RCD_13_VCT
	mov rax,SS_RCD_13_VCT
	mov rdi,(1<<6)
	mov rdx,13
	call ss_lp

init_ss_rcd_14:
	mov QWORD [SS_RCD_N+8*14],0
	mov QWORD [SS_RCD_C+8*14],0
	mov QWORD [SS_RCD_TOP+8*14],SS_RCD_14_VCT
	mov rax,SS_RCD_14_VCT
	mov rdi,(1<<6)
	mov rdx,14
	call ss_lp

init_ss_rcd_15:
	mov QWORD [SS_RCD_N+8*15],0
	mov QWORD [SS_RCD_C+8*15],0
	mov QWORD [SS_RCD_TOP+8*15],SS_RCD_15_VCT
	mov rax,SS_RCD_15_VCT
	mov rdi,(1<<6)
	mov rdx,15
	call ss_lp

init_ss_rcd_16:
	mov QWORD [SS_RCD_N+8*16],0
	mov QWORD [SS_RCD_C+8*16],0
	mov QWORD [SS_RCD_TOP+8*16],SS_RCD_16_VCT
	mov rax,SS_RCD_16_VCT
	mov rdi,(1<<6)
	mov rdx,16
	call ss_lp

init_ss_rcd_17:
	mov QWORD [SS_RCD_N+8*17],0
	mov QWORD [SS_RCD_C+8*17],0
	mov QWORD [SS_RCD_TOP+8*17],SS_RCD_17_VCT
	mov rax,SS_RCD_17_VCT
	mov rdi,(1<<6)
	mov rdx,17
	call ss_lp

init_ss_rcd_18:
	mov QWORD [SS_RCD_N+8*18],0
	mov QWORD [SS_RCD_C+8*18],0
	mov QWORD [SS_RCD_TOP+8*18],SS_RCD_18_VCT
	mov rax,SS_RCD_18_VCT
	mov rdi,(1<<6)
	mov rdx,18
	call ss_lp

init_ss_rcd_19:
	mov QWORD [SS_RCD_N+8*19],0
	mov QWORD [SS_RCD_C+8*19],0
	mov QWORD [SS_RCD_TOP+8*19],SS_RCD_19_VCT
	mov rax,SS_RCD_19_VCT
	mov rdi,(1<<6)
	mov rdx,19
	call ss_lp

init_ss_rcd_20:
	mov QWORD [SS_RCD_N+8*20],0
	mov QWORD [SS_RCD_C+8*20],0
	mov QWORD [SS_RCD_TOP+8*20],SS_RCD_20_VCT
	mov rax,SS_RCD_20_VCT
	mov rdi,(1<<6)
	mov rdx,20
	call ss_lp

init_ss_rcd_21:
	mov QWORD [SS_RCD_N+8*21],0
	mov QWORD [SS_RCD_C+8*21],0
	mov QWORD [SS_RCD_TOP+8*21],SS_RCD_21_VCT
	mov rax,SS_RCD_21_VCT
	mov rdi,(1<<6)
	mov rdx,21
	call ss_lp

init_ss_rcd_22:
	mov QWORD [SS_RCD_N+8*22],0
	mov QWORD [SS_RCD_C+8*22],0
	mov QWORD [SS_RCD_TOP+8*22],SS_RCD_22_VCT
	mov rax,SS_RCD_22_VCT
	mov rdi,(1<<6)
	mov rdx,22
	call ss_lp

init_ss_rcd_23:
	mov QWORD [SS_RCD_N+8*23],0
	mov QWORD [SS_RCD_C+8*23],0
	mov QWORD [SS_RCD_TOP+8*23],SS_RCD_23_VCT
	mov rax,SS_RCD_23_VCT
	mov rdi,(1<<6)
	mov rdx,23
	call ss_lp

init_ss_rcd_24:
	mov QWORD [SS_RCD_N+8*24],0
	mov QWORD [SS_RCD_C+8*24],0
	mov QWORD [SS_RCD_TOP+8*24],SS_RCD_24_VCT
	mov rax,SS_RCD_24_VCT
	mov rdi,(1<<6)
	mov rdx,24
	call ss_lp

init_ss_rcd_25:
	mov QWORD [SS_RCD_N+8*25],0
	mov QWORD [SS_RCD_C+8*25],0
	mov QWORD [SS_RCD_TOP+8*25],SS_RCD_25_VCT
	mov rax,SS_RCD_25_VCT
	mov rdi,(1<<6)
	mov rdx,25
	call ss_lp

init_ss_rcd_26:
	mov QWORD [SS_RCD_N+8*26],0
	mov QWORD [SS_RCD_C+8*26],0
	mov QWORD [SS_RCD_TOP+8*26],SS_RCD_26_VCT
	mov rax,SS_RCD_26_VCT
	mov rdi,(1<<6)
	mov rdx,26
	call ss_lp

init_ss_rcd_27:
	mov QWORD [SS_RCD_N+8*27],0
	mov QWORD [SS_RCD_C+8*27],0
	mov QWORD [SS_RCD_TOP+8*27],SS_RCD_27_VCT
	mov rax,SS_RCD_27_VCT
	mov rdi,(1<<6)
	mov rdx,27
	call ss_lp

init_ss_rcd_28:
	mov QWORD [SS_RCD_N+8*28],0
	mov QWORD [SS_RCD_C+8*28],0
	mov QWORD [SS_RCD_TOP+8*28],SS_RCD_28_VCT
	mov rax,SS_RCD_28_VCT
	mov rdi,(1<<6)
	mov rdx,28
	call ss_lp

init_ss_rcd_29:
	mov QWORD [SS_RCD_N+8*29],0
	mov QWORD [SS_RCD_C+8*29],0
	mov QWORD [SS_RCD_TOP+8*29],SS_RCD_29_VCT
	mov rax,SS_RCD_29_VCT
	mov rdi,(1<<6)
	mov rdx,29
	call ss_lp

init_ss_rcd_30:
	mov QWORD [SS_RCD_N+8*30],0
	mov QWORD [SS_RCD_C+8*30],0
	mov QWORD [SS_RCD_TOP+8*30],SS_RCD_30_VCT
	mov rax,SS_RCD_30_VCT
	mov rdi,(1<<6)
	mov rdx,30
	call ss_lp

init_ss_rcd_31:
	mov QWORD [SS_RCD_N+8*31],0
	mov QWORD [SS_RCD_C+8*31],0
	mov QWORD [SS_RCD_TOP+8*31],SS_RCD_31_VCT
	mov rax,SS_RCD_31_VCT
	mov rdi,(1<<6)
	mov rdx,31
	call ss_lp
	jmp RTM_0
LB_0: ;; #80◂◂(_none◂{}) 128'(= {| ? |} ) ⊢ { } : (_arr◂_s8◂→{ })
JMP_0:
;; %0~128'(= {| ? |} )
	mov rsi,1  
	mov rdi,48
	xor rax,rax 
	add QWORD [S8_N],33
	C_CALL_SF calloc
	mov QWORD [rax],33
	mov BYTE [rax+8+0],48
	mov BYTE [rax+8+1],57
	mov BYTE [rax+8+2],102
	mov BYTE [rax+8+3],100
	mov BYTE [rax+8+4],115
	mov BYTE [rax+8+5],48
	mov BYTE [rax+8+6],40
	mov BYTE [rax+8+7],41
	mov BYTE [rax+8+8],102
	mov BYTE [rax+8+9],101
	mov BYTE [rax+8+10],57
	mov BYTE [rax+8+11],56
	mov BYTE [rax+8+12],102
	mov BYTE [rax+8+13],101
	mov BYTE [rax+8+14],119
	mov BYTE [rax+8+15],57
	mov BYTE [rax+8+16],56
	mov BYTE [rax+8+17],117
	mov BYTE [rax+8+18],78
	mov BYTE [rax+8+19],118
	mov BYTE [rax+8+20],57
	mov BYTE [rax+8+21],104
	mov BYTE [rax+8+22],118
	mov BYTE [rax+8+23],101
	mov BYTE [rax+8+24],56
	mov BYTE [rax+8+25],110
	mov BYTE [rax+8+26],118
	mov BYTE [rax+8+27],51
	mov BYTE [rax+8+28],61
	mov BYTE [rax+8+29],126
	mov BYTE [rax+8+30],102
	mov BYTE [rax+8+31],107
	mov BYTE [rax+8+32],45
	mov GLX(129),rax
	mov GLX(130),25
	mov rdi,0
; 0'
; ","
; 1'
; ",.."
	add rdi,8
	mov rax,GLX(129)
	mov rsi,GLX(130)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(130),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_1+3-1]
	mov rcx,3
	rep movsb
	lea rsi,[LB_2+2-1]
	mov rcx,2
	rep movsb
	lea rsi,[LB_3+1-1]
	mov rcx,1
	rep movsb
	lea rsi,[LB_4+2-1]
	mov rcx,2
	rep movsb
	mov rcx,QWORD [tmp]
;; %0~128'(= {| ? |} )%1~129'(= {| l |} )%2~130'(= r )
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(129)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(130)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_5,21
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov r8,GLX(129)
	FREE_S8 r8
;; %0~128'(= {| ? |} )
	mov r8,GLX(128)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_6:
	cmp rsi,0
	jz LB_7
	push rsi 
	mov r8,SX(0)
	FREE_S8 r8
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*1]
	jmp LB_6
LB_7:
	pop rdi
	pop SRC_REG 
	C_CALL_SF free 
	ret
RTM_0:
	push EXH_8
	MOV_RBX GLX(128),GLX(127)
	call LB_0
	add rsp,8
	C_CALL exit
EXH_8:
	add rsp,8
	pop rax
	jmp rax
	sig_alc_rcd_1:
	mov rbx,1
	jmp sig_alc_rcd
	sig_alc_rcd_2:
	mov rbx,2
	jmp sig_alc_rcd
	sig_alc_rcd_3:
	mov rbx,3
	jmp sig_alc_rcd
	sig_alc_rcd_4:
	mov rbx,4
	jmp sig_alc_rcd
	sig_alc_rcd_5:
	mov rbx,5
	jmp sig_alc_rcd
	sig_alc_rcd_6:
	mov rbx,6
	jmp sig_alc_rcd
	sig_alc_rcd_7:
	mov rbx,7
	jmp sig_alc_rcd
	sig_alc_rcd_8:
	mov rbx,8
	jmp sig_alc_rcd
	sig_alc_rcd_9:
	mov rbx,9
	jmp sig_alc_rcd
	sig_alc_rcd_10:
	mov rbx,10
	jmp sig_alc_rcd
	sig_alc_rcd_11:
	mov rbx,11
	jmp sig_alc_rcd
	sig_alc_rcd_12:
	mov rbx,12
	jmp sig_alc_rcd
	sig_alc_rcd_13:
	mov rbx,13
	jmp sig_alc_rcd
	sig_alc_rcd_14:
	mov rbx,14
	jmp sig_alc_rcd
	sig_alc_rcd_15:
	mov rbx,15
	jmp sig_alc_rcd
	sig_alc_rcd_16:
	mov rbx,16
	jmp sig_alc_rcd
	sig_alc_rcd_17:
	mov rbx,17
	jmp sig_alc_rcd
	sig_alc_rcd_18:
	mov rbx,18
	jmp sig_alc_rcd
	sig_alc_rcd_19:
	mov rbx,19
	jmp sig_alc_rcd
	sig_alc_rcd_20:
	mov rbx,20
	jmp sig_alc_rcd
	sig_alc_rcd_21:
	mov rbx,21
	jmp sig_alc_rcd
	sig_alc_rcd_22:
	mov rbx,22
	jmp sig_alc_rcd
	sig_alc_rcd_23:
	mov rbx,23
	jmp sig_alc_rcd
	sig_alc_rcd_24:
	mov rbx,24
	jmp sig_alc_rcd
	sig_alc_rcd_25:
	mov rbx,25
	jmp sig_alc_rcd
	sig_alc_rcd_26:
	mov rbx,26
	jmp sig_alc_rcd
	sig_alc_rcd_27:
	mov rbx,27
	jmp sig_alc_rcd
	sig_alc_rcd_28:
	mov rbx,28
	jmp sig_alc_rcd
	sig_alc_rcd_29:
	mov rbx,29
	jmp sig_alc_rcd
	sig_alc_rcd_30:
	mov rbx,30
	jmp sig_alc_rcd
	sig_alc_rcd_31:
	mov rbx,31
	jmp sig_alc_rcd

%include "TEXT.s"
