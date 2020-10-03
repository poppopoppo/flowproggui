%include "HD.s"  
;	v.0
%define RCD_N 32
%define GLV_N 147
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)				
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
					
LB_3: db 44,46,46,0
LB_4: db 49,53,0
LB_5: db 44,0
LB_6: db 51,52,0
LB_7: db 32,58,32,123,32,95,115,56,226,151,130,32,95,114,54,52,226,151,130,125,10,0
LB_8: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_9: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_10: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_11: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_12: db 102,106,105,0
LB_13: db 105,106,106,102,105,0
LB_14: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_15: db 102,106,105,52,50,51,102,114,101,114,0
LB_16: db 105,106,106,102,105,0
LB_17: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_18: db 105,106,106,102,105,48,48,48,0
LB_19: db 105,106,106,102,105,48,48,48,0
LB_20: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_21: db 105,106,106,102,105,48,48,48,48,0
LB_22: db 105,106,106,102,105,48,48,48,48,0
LB_23: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_24: db 105,106,106,102,105,48,48,0
LB_25: db 105,106,106,102,105,48,48,0
LB_26: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_27: db 105,106,106,102,105,48,48,48,57,57,0
LB_28: db 105,106,106,102,105,48,48,48,57,57,0
LB_29: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_30: db 105,106,106,102,105,48,48,48,0
LB_31: db 105,106,106,102,105,48,48,48,0
LB_32: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_33: db 105,106,106,102,105,48,48,48,0
LB_34: db 107,106,106,102,105,48,48,48,0
LB_35: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_36: db 105,106,106,102,105,48,48,48,0
LB_37: db 97,106,106,102,105,48,48,48,0
LB_38: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_39: db 105,106,106,102,105,48,48,48,0
LB_40: db 105,106,106,103,105,48,48,48,0
LB_41: db 32,58,32,95,114,54,52,226,151,130,10,0
LB_42: db 105,106,106,102,105,48,48,48,0
LB_43: db 105,106,106,101,105,48,48,48,0
LB_44: db 32,58,32,95,114,54,52,226,151,130,10,0
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
	mov rdi,0 
ini_ss_rcd:
 mov QWORD [SS_RCD_N+8*rdi],0 
	mov QWORD [SS_RCD_C+8*rdi],0
	mov QWORD [SS_RCD_TOP+8*rdi],~0
	add rdi,1 
	cmp rdi,RCD_N
	jnz ini_ss_rcd  
	
	 

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
	jmp RTM_0
LB_1: ;; #80◂◂(_none◂{}) 129'(= {| l |} ) ⊢ 0'(= {| l |} ) : (_s8◂→_s8◂)
JMP_1:
	MOV_RBX GLX(0),GLX(129)
	ret
LB_0: ;; #81◂◂(_none◂{}) 128'(= {| ? |} ) ⊢ { } : (_arr◂_s8◂→{ })
JMP_0:
	push EXH_2
	mov rsi,1  
	mov rdi,48
	xor rax,rax 
	add QWORD [S8_N],33
	C_CALL_SF calloc
	mov QWORD [rax],33
	lea rdi,[rax+8]
	mov rbx,2965673626787264816
	mov QWORD [rdi],rbx
	add rdi,8 
	mov rbx,4140889872094815590
	mov QWORD [rdi],rbx
	add rdi,8 
	mov rbx,7311145641089856824
	mov QWORD [rdi],rbx
	add rdi,8 
	mov rbx,7739011811004280376
	mov QWORD [rdi],rbx
	add rdi,8 
	mov BYTE [rdi],45
	add rdi,1 
	mov GLX(129),rax
	call LB_1
	add rsp,8
	MOV_RBX GLX(130),GLX(0)
	mov GLX(131),25
	mov rdi,0
	add rdi,8
	mov rax,GLX(130)
	mov rsi,GLX(131)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(131),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_3+3-1]
	mov rcx,3
	rep movsb
	lea rsi,[LB_4+2-1]
	mov rcx,2
	rep movsb
	lea rsi,[LB_5+1-1]
	mov rcx,1
	rep movsb
	lea rsi,[LB_6+2-1]
	mov rcx,2
	rep movsb
	mov rcx,QWORD [tmp]
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(130)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_s8
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(131)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_7,21
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,GLX(130)
	mov rax,0x0000_ffff_ffff_ffff
	and rax,QWORD [rdi]
	cmp rax,0
	BC le,rax 
	movzx rax,BYTE [rdi+8+0]
	mov GLX(132),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(132)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_8,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,GLX(130)
	mov rax,0x0000_ffff_ffff_ffff
	and rax,QWORD [rdi]
	cmp rax,1
	BC le,rax 
	movzx rax,BYTE [rdi+8+1]
	mov GLX(133),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(133)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_9,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,GLX(130)
	mov rax,0x0000_ffff_ffff_ffff
	and rax,QWORD [rdi]
	cmp rax,2
	BC le,rax 
	movzx rax,BYTE [rdi+8+2]
	mov GLX(134),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(134)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_10,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,GLX(130)
	mov rax,0x0000_ffff_ffff_ffff
	and rax,QWORD [rdi]
	sub rax,7
	cmp rax,0
	jle err_bc
	mov rax,QWORD [rdi+8+0]
	mov GLX(135),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(135)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_11,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,3
	lea rsi,[LB_12]
	push rdi
	push rsi
	mov rdi,5
	lea rsi,[LB_13]
	mov rdx,rdi
	pop rdi
	pop rax
	call cmp_stg
	mov GLX(136),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(136)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_14,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,10
	lea rsi,[LB_15]
	push rdi
	push rsi
	mov rdi,5
	lea rsi,[LB_16]
	mov rdx,rdi
	pop rdi
	pop rax
	call cmp_stg
	mov GLX(137),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(137)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_17,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,8
	lea rsi,[LB_18]
	push rdi
	push rsi
	mov rdi,8
	lea rsi,[LB_19]
	mov rdx,rdi
	pop rdi
	pop rax
	call cmp_stg
	mov GLX(138),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(138)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_20,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,9
	lea rsi,[LB_21]
	push rdi
	push rsi
	mov rdi,9
	lea rsi,[LB_22]
	mov rdx,rdi
	pop rdi
	pop rax
	call cmp_stg
	mov GLX(139),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(139)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_23,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,7
	lea rsi,[LB_24]
	push rdi
	push rsi
	mov rdi,7
	lea rsi,[LB_25]
	mov rdx,rdi
	pop rdi
	pop rax
	call cmp_stg
	mov GLX(140),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(140)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_26,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,10
	lea rsi,[LB_27]
	push rdi
	push rsi
	mov rdi,10
	lea rsi,[LB_28]
	mov rdx,rdi
	pop rdi
	pop rax
	call cmp_stg
	mov GLX(141),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(141)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_29,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,8
	lea rsi,[LB_30]
	push rdi
	push rsi
	mov rdi,8
	lea rsi,[LB_31]
	mov rdx,rdi
	pop rdi
	pop rax
	call cmp_stg
	mov GLX(142),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(142)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_32,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,8
	lea rsi,[LB_33]
	push rdi
	push rsi
	mov rdi,8
	lea rsi,[LB_34]
	mov rdx,rdi
	pop rdi
	pop rax
	call cmp_stg
	mov GLX(143),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(143)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_35,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,8
	lea rsi,[LB_36]
	push rdi
	push rsi
	mov rdi,8
	lea rsi,[LB_37]
	mov rdx,rdi
	pop rdi
	pop rax
	call cmp_stg
	mov GLX(144),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(144)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_38,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,8
	lea rsi,[LB_39]
	push rdi
	push rsi
	mov rdi,8
	lea rsi,[LB_40]
	mov rdx,rdi
	pop rdi
	pop rax
	call cmp_stg
	mov GLX(145),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(145)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_41,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rdi,8
	lea rsi,[LB_42]
	push rdi
	push rsi
	mov rdi,8
	lea rsi,[LB_43]
	mov rdx,rdi
	pop rdi
	pop rax
	call cmp_stg
	mov GLX(146),rax
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(146)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_44,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov r8,GLX(130)
	FREE_S8 r8
	mov r8,GLX(128)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_45:
	cmp rsi,0
	jz LB_46
	push rsi 
	mov r8,SX(0)
	FREE_S8 r8
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*1]
	jmp LB_45
LB_46:
	pop rdi
	pop SRC_REG 
	C_CALL_SF free 
	ret
EXH_2:
	add rsp,8
	pop rax
	jmp rax
RTM_0:
	push EXH_47
	MOV_RBX GLX(128),GLX(127)
	call LB_0
	add rsp,8
	C_CALL exit
EXH_47:
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
