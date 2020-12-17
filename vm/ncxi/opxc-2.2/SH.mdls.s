%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 140
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)				
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
LB_5_H: dq 0x3
LB_5: db 32,58,32,0,0,0,0,0,0,0,0,0
LB_6_H: dq 0x7
LB_6: db 226,151,130,95,114,54,52,0,0,0,0,0,0,0,0,0
LB_7_H: dq 0x1
LB_7: db 10,0,0,0,0,0,0,0,0,0
LB_13_H: dq 0x2b
LB_13: db 123,32,125,226,151,130,123,32,226,151,130,95,114,54,52,32,123,32,125,226,151,130,226,151,130,95,114,56,226,151,130,95,97,114,114,125,226,151,130,95,97,114,114,0,0,0,0,0,0,0,0,0
section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_10: ;; #0x2e◂◂(_none◂{}) { { 131'(= r ) { 132'(= r ) 133'(= {| r8 |} ) } 134'(= {| ? |} ) } 135'(= r ) } ⊢ 0'(= r ) : ({ { ◂_r64 { ◂_r64 { }◂◂_r8◂_arr}{ }◂{ ◂_r64 { }◂◂_r8◂_arr}◂_arr} ◂_r64}→◂_r64)
JMP_10:
	mov rsi,GLX(0x87)
	add rsi,1
	mov GLX(0x87),rsi
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,5
	mov r8,GLX(0x86)
	EMT_CST fmt_arr_l,8
	mov rsi,0x0000_ffff_ffff_ffff 
	and rsi,QWORD [r8]
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_11:
	cmp rsi,rax 
	jz LB_12
	push rsi 
	push rax 
	EMT_CST fmt_rcd_l,2
	MOV_RBX r8,SX(0x0)
	mov rdi,r8
	call emt_r64
	EMT_CST fmt_spc,1
	MOV_RBX r8,SX(0x1)
	mov rdi,r8
	call emt_s8
	EMT_CST fmt_spc,1
	EMT_CST fmt_rcd_r,2
	lea SRC_REG,[SRC_REG+8*0x2]
	EMT_CST fmt_spc,1
	pop rax 
	pop rsi 
	add rax,1 
	jmp LB_11
LB_12:
	pop r8 
	pop SRC_REG
	EMT_CST fmt_arr_r,1
	EMT_CST fmt_nl,1
	EMT_CST LB_5,3
	EMT_CST LB_13,43
	EMT_CST LB_7,1
	call flsh
	pop QWORD [SIG_ETR]
	mov r8,GLX(0x86)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_14:
	cmp rsi,0
	jz LB_15
	push rsi 
	MOV_RBX rdi,SX(0x1)
	FREE_OPQ 16
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*0x2]
	jmp LB_14
LB_15:
	pop rdi
	pop SRC_REG 
	FREE_OPQ 17
	mov rdi,GLX(0x85)
	FREE_OPQ 18
	MOV_RBX GLX(0x0),GLX(0x87)
 ret 
LB_0: ;; #0x2f◂◂(_none◂{}) 128'(= {| ? |} ) ⊢ { } : ({ }◂{ }◂◂_r8◂_arr◂_arr→{ })
JMP_0:
	mov r8,GLX(0x80)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_1:
	cmp rsi,0
	jz LB_2
	push rsi 
	MOV_RBX rdi,SX(0x0)
	FREE_OPQ 3
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*0x1]
	jmp LB_1
LB_2:
	pop rdi
	pop SRC_REG 
	FREE_OPQ 4
	mov GLX(0x81),0x2c
	mov rdi,GLX(0x81)
	bsr rdi,rdi
	mov GLX(0x81),rdi
	push QWORD [SIG_ETR]
	mov QWORD [SIG_ETR],emt_bof_hdl
	EMT_CST fmt_emt,5
	mov r8,GLX(0x81)
	mov rdi,r8
	call emt_r64
	EMT_CST fmt_nl,1
	EMT_CST LB_5,3
	EMT_CST LB_6,7
	EMT_CST LB_7,1
	call flsh
	pop QWORD [SIG_ETR]
	mov rax,0x4
	mov rdi,rax
	add rdi,rdi
	lea rdi,[8*rdi+8]
	sub rsp,rdi
	mov rsi,rax 
	bts rsi,63 
	mov QWORD [rsp],rsi
	lea DST_REG,[rsp+8]
	mov rsi,rsp 
	push rdi 
	mov GLX(0x82),rsi
LB_8:
	cmp rax,0
	jz LB_9
	push rax
	mov rax,0x3
	mov DX(0x0),rax
	mov rsi,1  
	mov rdi,0x10
	xor rax,rax 
	CALLOC_SF
	mov QWORD [rax],0x3
	lea rdi,[rax+8]
	mov BYTE [rdi],0x66
	add rdi,1 
	mov BYTE [rdi],0x66
	add rdi,1 
	mov BYTE [rdi],0x66
	add rdi,1 
	mov DX(0x1),rax
	pop rax 
	lea DST_REG,[DST_REG+8*0x2]
	sub rax,1 
	jmp LB_8
LB_9:
	push EXH_19
	mov rax,0x4
	mov GLX(0x88),rax
	mov rax,0x3
	mov GLX(0x89),rax
	mov rsi,1  
	mov rdi,0x10
	xor rax,rax 
	CALLOC_SF
	mov QWORD [rax],0x3
	lea rdi,[rax+8]
	mov BYTE [rdi],0x66
	add rdi,1 
	mov BYTE [rdi],0x66
	add rdi,1 
	mov BYTE [rdi],0x66
	add rdi,1 
	mov GLX(0x8a),rax
	mov rax,0x3
	mov GLX(0x8b),rax
	MOV_RBX GLX(0x83),GLX(0x88)
	MOV_RBX GLX(0x84),GLX(0x89)
	MOV_RBX GLX(0x85),GLX(0x8a)
	MOV_RBX GLX(0x86),GLX(0x82)
	MOV_RBX GLX(0x87),GLX(0x8b)
	call LB_10
	add rsp,8
	pop rdi 
	mov rsi,QWORD [rsp]
	mov rsi,QWORD [rsi]
	add rsp,rdi 
 ret 
EXH_19:
	add rsp,0x8
	pop rax
	jmp rax
RTM_0:
	push EXH_20
	MOV_RBX GLX(0x80),GLX(0x7f)
	call LB_0
	add rsp,8
	mov QWORD [EXIT],1
	C_CALL exit
EXH_20:
	add rsp,0x8
	pop rax
	jmp rax
	sig_alc_rcd_1:
	mov rbx,0x1
	jmp sig_alc_rcd
	sig_alc_rcd_2:
	mov rbx,0x2
	jmp sig_alc_rcd
	sig_alc_rcd_3:
	mov rbx,0x3
	jmp sig_alc_rcd
	sig_alc_rcd_4:
	mov rbx,0x4
	jmp sig_alc_rcd
	sig_alc_rcd_5:
	mov rbx,0x5
	jmp sig_alc_rcd
	sig_alc_rcd_6:
	mov rbx,0x6
	jmp sig_alc_rcd
	sig_alc_rcd_7:
	mov rbx,0x7
	jmp sig_alc_rcd
	sig_alc_rcd_8:
	mov rbx,0x8
	jmp sig_alc_rcd
	sig_alc_rcd_9:
	mov rbx,0x9
	jmp sig_alc_rcd
	sig_alc_rcd_10:
	mov rbx,0xa
	jmp sig_alc_rcd
	sig_alc_rcd_11:
	mov rbx,0xb
	jmp sig_alc_rcd
	sig_alc_rcd_12:
	mov rbx,0xc
	jmp sig_alc_rcd
	sig_alc_rcd_13:
	mov rbx,0xd
	jmp sig_alc_rcd
	sig_alc_rcd_14:
	mov rbx,0xe
	jmp sig_alc_rcd
	sig_alc_rcd_15:
	mov rbx,0xf
	jmp sig_alc_rcd
	sig_alc_rcd_16:
	mov rbx,0x10
	jmp sig_alc_rcd
	sig_alc_rcd_17:
	mov rbx,0x11
	jmp sig_alc_rcd
	sig_alc_rcd_18:
	mov rbx,0x12
	jmp sig_alc_rcd
	sig_alc_rcd_19:
	mov rbx,0x13
	jmp sig_alc_rcd
	sig_alc_rcd_20:
	mov rbx,0x14
	jmp sig_alc_rcd
	sig_alc_rcd_21:
	mov rbx,0x15
	jmp sig_alc_rcd
	sig_alc_rcd_22:
	mov rbx,0x16
	jmp sig_alc_rcd
	sig_alc_rcd_23:
	mov rbx,0x17
	jmp sig_alc_rcd
	sig_alc_rcd_24:
	mov rbx,0x18
	jmp sig_alc_rcd
	sig_alc_rcd_25:
	mov rbx,0x19
	jmp sig_alc_rcd
	sig_alc_rcd_26:
	mov rbx,0x1a
	jmp sig_alc_rcd
	sig_alc_rcd_27:
	mov rbx,0x1b
	jmp sig_alc_rcd
	sig_alc_rcd_28:
	mov rbx,0x1c
	jmp sig_alc_rcd
	sig_alc_rcd_29:
	mov rbx,0x1d
	jmp sig_alc_rcd
	sig_alc_rcd_30:
	mov rbx,0x1e
	jmp sig_alc_rcd
	sig_alc_rcd_31:
	mov rbx,0x1f
	jmp sig_alc_rcd
	sig_alc_rcd_32:
	mov rbx,0x20
	jmp sig_alc_rcd
	sig_alc_rcd_33:
	mov rbx,0x21
	jmp sig_alc_rcd
	sig_alc_rcd_34:
	mov rbx,0x22
	jmp sig_alc_rcd
	sig_alc_rcd_35:
	mov rbx,0x23
	jmp sig_alc_rcd
	sig_alc_rcd_36:
	mov rbx,0x24
	jmp sig_alc_rcd
	sig_alc_rcd_37:
	mov rbx,0x25
	jmp sig_alc_rcd
	sig_alc_rcd_38:
	mov rbx,0x26
	jmp sig_alc_rcd
	sig_alc_rcd_39:
	mov rbx,0x27
	jmp sig_alc_rcd
	sig_alc_rcd_40:
	mov rbx,0x28
	jmp sig_alc_rcd
	sig_alc_rcd_41:
	mov rbx,0x29
	jmp sig_alc_rcd
	sig_alc_rcd_42:
	mov rbx,0x2a
	jmp sig_alc_rcd
	sig_alc_rcd_43:
	mov rbx,0x2b
	jmp sig_alc_rcd
	sig_alc_rcd_44:
	mov rbx,0x2c
	jmp sig_alc_rcd
	sig_alc_rcd_45:
	mov rbx,0x2d
	jmp sig_alc_rcd
	sig_alc_rcd_46:
	mov rbx,0x2e
	jmp sig_alc_rcd
	sig_alc_rcd_47:
	mov rbx,0x2f
	jmp sig_alc_rcd
	sig_alc_rcd_48:
	mov rbx,0x30
	jmp sig_alc_rcd
	sig_alc_rcd_49:
	mov rbx,0x31
	jmp sig_alc_rcd
	sig_alc_rcd_50:
	mov rbx,0x32
	jmp sig_alc_rcd
	sig_alc_rcd_51:
	mov rbx,0x33
	jmp sig_alc_rcd
	sig_alc_rcd_52:
	mov rbx,0x34
	jmp sig_alc_rcd
	sig_alc_rcd_53:
	mov rbx,0x35
	jmp sig_alc_rcd
	sig_alc_rcd_54:
	mov rbx,0x36
	jmp sig_alc_rcd
	sig_alc_rcd_55:
	mov rbx,0x37
	jmp sig_alc_rcd
	sig_alc_rcd_56:
	mov rbx,0x38
	jmp sig_alc_rcd
	sig_alc_rcd_57:
	mov rbx,0x39
	jmp sig_alc_rcd
	sig_alc_rcd_58:
	mov rbx,0x3a
	jmp sig_alc_rcd
	sig_alc_rcd_59:
	mov rbx,0x3b
	jmp sig_alc_rcd
	sig_alc_rcd_60:
	mov rbx,0x3c
	jmp sig_alc_rcd
	sig_alc_rcd_61:
	mov rbx,0x3d
	jmp sig_alc_rcd
	sig_alc_rcd_62:
	mov rbx,0x3e
	jmp sig_alc_rcd
	sig_alc_rcd_63:
	mov rbx,0x3f
	jmp sig_alc_rcd

%include "TEXT.s"
