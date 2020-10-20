%include "HD.s"  
;	v.0
%define RCD_N 32
%define GLV_N 154
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)				
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
					
LB_4: db 32,58,32,95,114,54,52,226,151,130,10,0,0,0,0,0,0,0,0,0
LB_6: db 32,58,32,95,114,54,52,226,151,130,10,0,0,0,0,0,0,0,0,0
LB_8: db 32,58,32,95,114,54,52,226,151,130,10,0,0,0,0,0,0,0,0,0
LB_12: db 32,58,32,95,114,54,52,226,151,130,10,0,0,0,0,0,0,0,0,0
LB_20: db 32,58,32,95,114,54,52,226,151,130,10,0,0,0,0,0,0,0,0,0
LB_27: db 32,58,32,123,32,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,32,95,114,54,52,226,151,130,125,10,0,0,0,0,0,0,0,0,0
LB_33: db 32,58,32,123,32,123,32,95,114,54,52,226,151,130,32,95,114,54,52,226,151,130,125,32,95,114,54,52,226,151,130,125,10,0,0,0,0,0,0,0,0,0
LB_37: db 32,58,32,123,32,125,10,0,0,0,0,0,0,0,0,0
section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_10: ;; #19◂◂(_none◂{}) { } ⊢ 0'(= r ) : ({ }→_r64◂)
JMP_10:
	mov rax,4
	mov GLX(0),rax
 ret 
LB_13: ;; #20◂◂(_none◂{}) 130'(1)◂131' ⊢ 0'(= r ) : (_opn◂(=_r64◂)→_r64◂)
JMP_13:
	mov rdi,GLX(130)
	jmp QWORD [LB_17+8*rdi]
LB_17: dq LB_15,LB_16
LB_15
	add GLX(131),1
	MOV_RBX GLX(0),GLX(131)
	jmp LB_14
LB_16
	push EXH_18
	call LB_10
	add rsp,8
	MOV_RBX GLX(132),GLX(0)
	MOV_RBX GLX(0),GLX(132)
	jmp LB_14
LB_14
 ret 
EXH_18:
	add rsp,8
	pop rax
	jmp rax
LB_23: ;; #21◂◂(_none◂{}) { { 134'(= r ) 135'(= r ) } 136'(= r ) } ⊢ { { 0'(= r ) 1'(= r ) } 2'(= r ) } : ({ { _r64◂ _r64◂} _r64◂}→{ { _r64◂ _r64◂} _r64◂})
JMP_23:
	add GLX(136),1
	MOV_RBX GLX(0),GLX(134)
	MOV_RBX GLX(1),GLX(135)
	MOV_RBX GLX(2),GLX(136)
 ret 
LB_25: ;; #22◂◂(_none◂{}) { { 140'(= r ) 141'(= r ) } 142'(= r ) } ⊢ { { 0'(= r ) 1'(= r ) } 2'(= r ) } : ({ { _r64◂ _r64◂} _r64◂}→{ { _r64◂ _r64◂} _r64◂})
JMP_25:
	sub GLX(142),1
	MOV_RBX GLX(0),GLX(140)
	MOV_RBX GLX(1),GLX(141)
	MOV_RBX GLX(2),GLX(142)
 ret 
LB_28: ;; #23◂◂(_none◂{}) { 146'(= r ) 147'(= r ) } ⊢ { } : ({ _r64◂ _r64◂}→{ })
JMP_28:
	mov rdi,GLX(147)
	cmp GLX(146),rdi
	jg LB_30
	push EXH_31
	MOV_RBX GLX(134),GLX(146)
	MOV_RBX GLX(135),GLX(147)
	mov rax,2
	mov GLX(136),rax
	call LB_23
	add rsp,8
	MOV_RBX GLX(148),GLX(0)
	MOV_RBX GLX(149),GLX(1)
	MOV_RBX GLX(150),GLX(2)
	MOV_RBX GLX(0),GLX(148)
	MOV_RBX GLX(1),GLX(149)
	MOV_RBX GLX(2),GLX(150)
	jmp LB_29
LB_30
	push EXH_32
	MOV_RBX GLX(140),GLX(146)
	MOV_RBX GLX(141),GLX(147)
	mov rax,2
	mov GLX(142),rax
	call LB_25
	add rsp,8
	MOV_RBX GLX(151),GLX(0)
	MOV_RBX GLX(152),GLX(1)
	MOV_RBX GLX(153),GLX(2)
	MOV_RBX GLX(0),GLX(151)
	MOV_RBX GLX(1),GLX(152)
	MOV_RBX GLX(2),GLX(153)
	jmp LB_29
LB_29
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(1)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_spc,4
	mov rdi,GLX(2)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_33,33
	EMT_FLSH
	pop QWORD [SIG_ETR]
 ret 
EXH_31:
	add rsp,8
	pop rax
	jmp rax
EXH_32:
	add rsp,8
	pop rax
	jmp rax
LB_0: ;; #24◂◂(_none◂{}) 128'(= {| ? |} ) ⊢ { } : (_arr◂{ }◂_arr◂{ }◂_r8◂→{ })
JMP_0:
	mov r8,GLX(128)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_1:
	cmp rsi,0
	jz LB_2
	push rsi 
	mov r8,SX(0)
	FREE_S8 r8
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*1]
	jmp LB_1
LB_2:
	pop rdi
	pop SRC_REG 
	C_CALL_SF free 
	mov rax,46
	mov GLX(0),rax
	jmp LB_3
LB_3
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_4,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rax,67
	mov GLX(0),rax
	jmp LB_5
LB_5
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_6,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	mov rax,665
	mov GLX(0),rax
	jmp LB_7
LB_7
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_8,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	push EXH_11
	call LB_10
	add rsp,8
	MOV_RBX GLX(129),GLX(0)
	MOV_RBX GLX(0),GLX(129)
	jmp LB_9
LB_9
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	mov rdi,GLX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_nl,4
	EMT_CST LB_12,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	push EXH_19
	mov GLX(130),1
	mov GLX(131),unt
	call LB_13
	add rsp,8
	MOV_RBX GLX(133),GLX(0)
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
	EMT_CST LB_20,11
	EMT_FLSH
	pop QWORD [SIG_ETR]
	push EXH_24
	mov rax,5
	mov GLX(134),rax
	mov rax,5
	mov GLX(135),rax
	mov rax,2
	mov GLX(136),rax
	call LB_23
	add rsp,8
	MOV_RBX GLX(137),GLX(0)
	MOV_RBX GLX(138),GLX(1)
	MOV_RBX GLX(139),GLX(2)
	MOV_RBX GLX(0),GLX(137)
	MOV_RBX GLX(1),GLX(138)
	MOV_RBX GLX(2),GLX(139)
	jmp LB_21
LB_22
	push EXH_26
	mov rax,5
	mov GLX(140),rax
	mov rax,5
	mov GLX(141),rax
	mov rax,2
	mov GLX(142),rax
	call LB_25
	add rsp,8
	MOV_RBX GLX(143),GLX(0)
	MOV_RBX GLX(144),GLX(1)
	MOV_RBX GLX(145),GLX(2)
	MOV_RBX GLX(0),GLX(143)
	MOV_RBX GLX(1),GLX(144)
	MOV_RBX GLX(2),GLX(145)
	jmp LB_21
LB_21
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	EMT_CST fmt_rcd_l,4
	mov rdi,GLX(0)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	mov rdi,GLX(1)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_spc,4
	mov rdi,GLX(2)
	C_PUSH_REGS
	mov r8,rdi 
	mov rdi,r8
	call emt_r64
	C_POP_REGS
	EMT_CST fmt_spc,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_27,33
	EMT_FLSH
	pop QWORD [SIG_ETR]
	push EXH_34
	mov rax,6
	mov GLX(146),rax
	mov rax,5
	mov GLX(147),rax
	call LB_28
	add rsp,8
	jmp LB_36
LB_35
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,64
	EMT_CST fmt_rcd_l,4
	EMT_CST fmt_rcd_r,4
	EMT_CST fmt_nl,4
	EMT_CST LB_37,7
	EMT_FLSH
	pop QWORD [SIG_ETR]
 ret 
LB_36
 ret 
EXH_11:
	add rsp,8
	pop rax
	jmp rax
EXH_19:
	add rsp,8
	pop rax
	jmp rax
EXH_24:
	add rsp,8
	pop rax
	jmp rax
EXH_26:
	add rsp,8
	pop rax
	jmp rax
EXH_34:
	add rsp,8
	pop rax
	jmp rax
RTM_0:
	push EXH_38
	MOV_RBX GLX(128),GLX(127)
	call LB_0
	add rsp,8
	C_CALL exit
EXH_38:
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
