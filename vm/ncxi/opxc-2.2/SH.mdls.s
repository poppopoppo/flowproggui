%include "HD.s"  
;	v.0
%define RCD_N 32
%define GLV_N 183
%define SS_NULL 0xffff_ffff_ffff_0000
%define EMT_BUF_MAX (KB<<1)				
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
					
LB_33: db 32,114,101,116,32,10,0,0,0,0,0,0,0,0,0
LB_34: db 10,0,0,0,0,0,0,0,0,0
LB_35: db 9,99,97,108,108,32,76,66,95,0,0,0,0,0,0,0,0,0
LB_36: db 10,0,0,0,0,0,0,0,0,0
LB_37: db 76,66,95,0,0,0,0,0,0,0,0,0
LB_38: db 10,0,0,0,0,0,0,0,0,0
LB_39: db 9,106,109,112,32,76,66,95,0,0,0,0,0,0,0,0,0
LB_40: db 10,0,0,0,0,0,0,0,0,0
LB_41: db 9,106,122,32,76,66,95,0,0,0,0,0,0,0,0,0
LB_42: db 10,0,0,0,0,0,0,0,0,0
LB_43: db 9,106,110,122,32,76,66,95,0,0,0,0,0,0,0,0,0
LB_48: db 10,0,0,0,0,0,0,0,0,0
LB_49: db 9,106,122,32,76,66,95,0,0,0,0,0,0,0,0,0
LB_50: db 10,0,0,0,0,0,0,0,0,0
LB_51: db 9,106,110,122,32,76,66,95,0,0,0,0,0,0,0,0,0
LB_52: db 10,0,0,0,0,0,0,0,0,0
LB_53: db 9,106,108,32,76,66,95,0,0,0,0,0,0,0,0,0
LB_54: db 10,0,0,0,0,0,0,0,0,0
LB_55: db 9,106,108,101,32,76,66,95,0,0,0,0,0,0,0,0,0
LB_56: db 10,0,0,0,0,0,0,0,0,0
LB_57: db 9,106,103,32,76,66,95,0,0,0,0,0,0,0,0,0
LB_58: db 10,0,0,0,0,0,0,0,0,0
LB_59: db 44,0,0,0,0,0,0,0,0,0
LB_60: db 9,65,76,67,95,82,67,68,32,0,0,0,0,0,0,0,0,0
LB_61: db 10,0,0,0,0,0,0,0,0,0
LB_62: db 44,0,0,0,0,0,0,0,0,0
LB_63: db 9,70,82,69,69,95,82,67,68,32,0,0,0,0,0,0,0,0,0
section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_2: ;; #1149◂◂(_none◂{}) { 132'(56)◂133' 134'(= {| l |} ) } ⊢ 0'(56)◂1' : ({ .a56◂ _arr◂{ }◂_r8◂}→.a56◂)
JMP_2:
	mov GLX(0),0
	ALC_RCD 4,rax
	mov GLX(1),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	MOV_RDI DX(0),GLX(132)
	MOV_RDI DX(1),GLX(133)
	mov DX(2),2
	ALC_RCD 2,rax
	mov DX(3),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	mov DX(0),0
	push DST_REG 
	lea DST_REG,DX(1)
	MOV_RDI DX(0),GLX(134)
	pop DST_REG
	pop DST_REG
	pop DST_REG
 ret 
LB_4: ;; #1148◂◂(_none◂{}) { 137'(56)◂138' 139'(56)◂140' } ⊢ 0'(56)◂1' : ({ .a56◂ .a56◂}→.a56◂)
JMP_4:
	mov GLX(0),0
	ALC_RCD 4,rax
	mov GLX(1),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	MOV_RDI DX(0),GLX(137)
	MOV_RDI DX(1),GLX(138)
	MOV_RDI DX(2),GLX(139)
	MOV_RDI DX(3),GLX(140)
	pop DST_REG
 ret 
LB_8: ;; #1153◂◂(_none◂{}) 147'(= r ) ⊢ 0'(= {| l |} ) : (_r64◂→_arr◂{ }◂_r8◂)
JMP_8:
	mov rdi,GLX(147)
	call mlc_s8
	mov GLX(148),rax
	MOV_RBX GLX(0),GLX(148)
 ret 
LB_17: ;; #1151◂◂(_none◂{}) { 170'(55)◂171' 172'(= {| l |} ) 173'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) } : ({ .a55◂ _arr◂{ }◂_r8◂_r64◂}→{ _arr◂{ }◂_r8◂ _r64◂})
JMP_17:
	mov rdi,GLX(170)
	jmp QWORD [LB_32+8*rdi]
LB_32: dq LB_19,LB_20,LB_21,LB_22,LB_23,LB_24,LB_25,LB_26,LB_27,LB_28,LB_29,LB_30,LB_31
LB_19
	mov rdi,0
	mov rsi,GLX(171)
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rsi] 
	add rdi,rax 
	push rax 
	add rdi,0
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	mov rsi,GLX(171)
	pop rcx 
	lea rsi,[rsi+7+rcx]
	rep movsb
	mov rcx,QWORD [tmp]
	mov r8,GLX(171)
	FREE_S8 r8
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_20
	mov rdi,0
	add rdi,6
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_33+6-1]
	mov rcx,6
	rep movsb
	mov rcx,QWORD [tmp]
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_21
	mov rdi,0
	mov rax,GLX(171)
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	mov rdx,rax 
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,10
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_34+1-1]
	mov rcx,1
	rep movsb
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	lea rsi,[LB_35+9-1]
	mov rcx,9
	rep movsb
	mov rcx,QWORD [tmp]
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_22
	mov rdi,0
	mov rax,GLX(171)
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	mov rdx,rax 
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,4
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_36+1-1]
	mov rcx,1
	rep movsb
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	lea rsi,[LB_37+3-1]
	mov rcx,3
	rep movsb
	mov rcx,QWORD [tmp]
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_23
	mov rdi,0
	mov rax,GLX(171)
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	mov rdx,rax 
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,9
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_38+1-1]
	mov rcx,1
	rep movsb
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	lea rsi,[LB_39+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp]
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_24
	mov rdi,0
	mov rax,GLX(171)
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	mov rdx,rax 
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,8
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_40+1-1]
	mov rcx,1
	rep movsb
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	lea rsi,[LB_41+7-1]
	mov rcx,7
	rep movsb
	mov rcx,QWORD [tmp]
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_25
	mov rdi,0
	mov rax,GLX(171)
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	mov rdx,rax 
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,9
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_42+1-1]
	mov rcx,1
	rep movsb
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	lea rsi,[LB_43+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp]
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_26
	push SRC_REG 
	mov SRC_REG,GLX(171)
	add SRC_REG,8
	MOV_RDI GLX(174),SX(0)
	MOV_RDI GLX(175),SX(1)
	MOV_RDI GLX(176),SX(2)
	sub SRC_REG,8 
	mov rdi,SRC_REG  
	FREE_RCD 3,rdi
	pop SRC_REG 
	mov rdi,GLX(174)
	jmp QWORD [LB_47+8*rdi]
LB_47: dq LB_45,LB_46
LB_45
	mov rdi,0
	mov rax,GLX(176)
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	mov rdx,rax 
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,8
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_48+1-1]
	mov rcx,1
	rep movsb
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	lea rsi,[LB_49+7-1]
	mov rcx,7
	rep movsb
	mov rcx,QWORD [tmp]
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_46
	mov rdi,0
	mov rax,GLX(176)
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	mov rdx,rax 
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,9
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_50+1-1]
	mov rcx,1
	rep movsb
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	lea rsi,[LB_51+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp]
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_44
LB_27
	mov rdi,0
	mov rax,GLX(171)
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	mov rdx,rax 
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,8
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_52+1-1]
	mov rcx,1
	rep movsb
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	lea rsi,[LB_53+7-1]
	mov rcx,7
	rep movsb
	mov rcx,QWORD [tmp]
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_28
	mov rdi,0
	mov rax,GLX(171)
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	mov rdx,rax 
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,9
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_54+1-1]
	mov rcx,1
	rep movsb
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	lea rsi,[LB_55+8-1]
	mov rcx,8
	rep movsb
	mov rcx,QWORD [tmp]
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_29
	mov rdi,0
	mov rax,GLX(171)
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	mov rdx,rax 
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	add rdi,8
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_56+1-1]
	mov rcx,1
	rep movsb
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	lea rsi,[LB_57+7-1]
	mov rcx,7
	rep movsb
	mov rcx,QWORD [tmp]
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_30
	push SRC_REG 
	mov SRC_REG,GLX(171)
	add SRC_REG,8
	MOV_RDI GLX(177),SX(0)
	MOV_RDI GLX(178),SX(1)
	sub SRC_REG,8 
	mov rdi,SRC_REG  
	FREE_RCD 2,rdi
	pop SRC_REG 
	mov rdi,0
	mov rax,GLX(177)
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	mov rdx,rax 
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	mov rsi,GLX(178)
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rsi] 
	add rdi,rax 
	push rax 
	add rdi,11
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_58+1-1]
	mov rcx,1
	rep movsb
	mov rsi,GLX(178)
	pop rcx 
	lea rsi,[rsi+7+rcx]
	rep movsb
	lea rsi,[LB_59+1-1]
	mov rcx,1
	rep movsb
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	lea rsi,[LB_60+9-1]
	mov rcx,9
	rep movsb
	mov rcx,QWORD [tmp]
	mov r8,GLX(178)
	FREE_S8 r8
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_31
	push SRC_REG 
	mov SRC_REG,GLX(171)
	add SRC_REG,8
	MOV_RDI GLX(179),SX(0)
	MOV_RDI GLX(180),SX(1)
	sub SRC_REG,8 
	mov rdi,SRC_REG  
	FREE_RCD 2,rdi
	pop SRC_REG 
	mov rdi,0
	mov rax,GLX(179)
	mov rsi,rdi  
	sub rsp,128 
	mov rdi,rsp 
	push rsi 
	mov rdx,rax 
	mov rsi,fmt_d
 xor rax,rax
	C_CALL_SF sprintf
	pop rdi
	add rdi,rax 
	push rax 
	mov rsi,GLX(180)
	mov rax,0x0000_ffff_ffff_ffff 
	and rax,QWORD [rsi] 
	add rdi,rax 
	push rax 
	add rdi,12
	mov rax,GLX(172)
	mov rsi,GLX(173)
	mov rbx,0x0000_ffff_ffff_ffff
	and rbx,QWORD [rax] 
	sub rbx,rdi 
	jl err_bc
	sub rbx,rsi 
	jl err_bc 
	add rsi,rdi  
	mov GLX(173),rsi
	lea rdi,[rax+7+rsi] 
	std 
	mov QWORD [tmp],rcx 
	lea rsi,[LB_61+1-1]
	mov rcx,1
	rep movsb
	mov rsi,GLX(180)
	pop rcx 
	lea rsi,[rsi+7+rcx]
	rep movsb
	lea rsi,[LB_62+1-1]
	mov rcx,1
	rep movsb
	pop rcx 
	lea rsi,[rsp+rcx-1] 
	rep movsb
	add rsp,128
	lea rsi,[LB_63+10-1]
	mov rcx,10
	rep movsb
	mov rcx,QWORD [tmp]
	mov r8,GLX(180)
	FREE_S8 r8
	MOV_RBX GLX(0),GLX(172)
	MOV_RBX GLX(1),GLX(173)
 ret 
LB_18
LB_10: ;; #1152◂◂(_none◂{}) { 150'(56)◂151' 152'(= {| l |} ) 153'(= r ) } ⊢ { 0'(= {| l |} ) 1'(= r ) } : ({ .a56◂ _arr◂{ }◂_r8◂_r64◂}→{ _arr◂{ }◂_r8◂ _r64◂})
JMP_10:
	mov rdi,GLX(150)
	jmp QWORD [LB_15+8*rdi]
LB_15: dq LB_12,LB_13,LB_14
LB_12
	push SRC_REG 
	mov SRC_REG,GLX(151)
	add SRC_REG,8
	MOV_RDI GLX(154),SX(0)
	MOV_RDI GLX(155),SX(1)
	MOV_RDI GLX(156),SX(2)
	MOV_RDI GLX(157),SX(3)
	sub SRC_REG,8 
	mov rdi,SRC_REG  
	FREE_RCD 4,rdi
	pop SRC_REG 
	lea rsp,[rsp-8*2]
	MOV_RDI QWORD [rsp+8*1],GLX(157)
	MOV_RDI QWORD [rsp+8*0],GLX(156)
	push EXH_16
	MOV_RBX GLX(158),GLX(154)
	MOV_RBX GLX(159),GLX(155)
	MOV_RBX GLX(160),GLX(152)
	MOV_RBX GLX(161),GLX(153)
	MOV_RBX GLX(150),GLX(158)
	MOV_RBX GLX(151),GLX(159)
	MOV_RBX GLX(152),GLX(160)
	MOV_RBX GLX(153),GLX(161)
	call LB_10
	add rsp,8
	MOV_RBX GLX(162),GLX(0)
	MOV_RBX GLX(163),GLX(1)
	pop GLX(156)
	pop GLX(157)
	MOV_RBX GLX(164),GLX(156)
	MOV_RBX GLX(165),GLX(157)
	MOV_RBX GLX(166),GLX(162)
	MOV_RBX GLX(167),GLX(163)
	MOV_RBX GLX(150),GLX(164)
	MOV_RBX GLX(151),GLX(165)
	MOV_RBX GLX(152),GLX(166)
	MOV_RBX GLX(153),GLX(167)
	jmp JMP_10
LB_13
	MOV_RBX GLX(0),GLX(152)
	MOV_RBX GLX(1),GLX(153)
 ret 
LB_14
	push SRC_REG 
	mov SRC_REG,GLX(151)
	add SRC_REG,8
	MOV_RDI GLX(168),SX(0)
	MOV_RDI GLX(169),SX(1)
	sub SRC_REG,8 
	mov rdi,SRC_REG  
	FREE_RCD 2,rdi
	pop SRC_REG 
	MOV_RBX GLX(170),GLX(168)
	MOV_RBX GLX(171),GLX(169)
	MOV_RBX GLX(172),GLX(152)
	MOV_RBX GLX(173),GLX(153)
	jmp JMP_17
LB_11
EXH_16:
	add rsp,8
	pop rax
	jmp rax
LB_1: ;; #1155◂◂(_none◂{}) { } ⊢ { } : ({ }→{ })
JMP_1:
	push EXH_3
	mov GLX(132),1
	mov GLX(133),unt
	mov rsi,1  
	mov rdi,16
	xor rax,rax 
	add QWORD [S8_N],5
	C_CALL_SF calloc_sf
	mov QWORD [rax],5
	lea rdi,[rax+8]
	mov BYTE [rdi],74
	add rdi,1 
	mov BYTE [rdi],73
	add rdi,1 
	mov BYTE [rdi],79
	add rdi,1 
	mov BYTE [rdi],74
	add rdi,1 
	mov BYTE [rdi],10
	add rdi,1 
	mov GLX(134),rax
	call LB_2
	add rsp,8
	MOV_RBX GLX(135),GLX(0)
	MOV_RBX GLX(136),GLX(1)
	push EXH_5
	MOV_RBX GLX(137),GLX(135)
	MOV_RBX GLX(138),GLX(136)
	mov GLX(139),2
	ALC_RCD 2,rax
	mov GLX(140),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	mov DX(0),4
	push DST_REG 
	lea DST_REG,DX(1)
	mov rax,45
	mov DX(0),rax
	pop DST_REG
	pop DST_REG
	call LB_4
	add rsp,8
	MOV_RBX GLX(141),GLX(0)
	MOV_RBX GLX(142),GLX(1)
	push EXH_6
	MOV_RBX GLX(137),GLX(141)
	MOV_RBX GLX(138),GLX(142)
	mov GLX(139),2
	ALC_RCD 2,rax
	mov GLX(140),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	mov DX(0),1
	mov DX(1),unt
	pop DST_REG
	call LB_4
	add rsp,8
	MOV_RBX GLX(143),GLX(0)
	MOV_RBX GLX(144),GLX(1)
	push EXH_7
	MOV_RBX GLX(137),GLX(143)
	MOV_RBX GLX(138),GLX(144)
	mov GLX(139),2
	ALC_RCD 2,rax
	mov GLX(140),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	mov DX(0),0
	push DST_REG 
	lea DST_REG,DX(1)
	mov rsi,1  
	mov rdi,24
	xor rax,rax 
	add QWORD [S8_N],9
	C_CALL_SF calloc_sf
	mov QWORD [rax],9
	lea rdi,[rax+8]
	mov rbx,8674621315919867913
	mov QWORD [rdi],rbx
	add rdi,8 
	mov BYTE [rdi],10
	add rdi,1 
	mov DX(0),rax
	pop DST_REG
	pop DST_REG
	call LB_4
	add rsp,8
	MOV_RBX GLX(145),GLX(0)
	MOV_RBX GLX(146),GLX(1)
	push EXH_9
	mov rax,40000000
	mov GLX(147),rax
	call LB_8
	add rsp,8
	MOV_RBX GLX(149),GLX(0)
	lea rsp,[rsp-8*0]
	push EXH_64
	MOV_RBX GLX(150),GLX(145)
	MOV_RBX GLX(151),GLX(146)
	MOV_RBX GLX(152),GLX(149)
	mov rax,0
	mov GLX(153),rax
	call LB_10
	add rsp,8
	MOV_RBX GLX(181),GLX(0)
	MOV_RBX GLX(182),GLX(1)
	mov r8,GLX(181)
	FREE_S8 r8
 ret 
EXH_3:
	add rsp,8
	pop rax
	jmp rax
EXH_5:
	add rsp,8
	pop rax
	jmp rax
EXH_6:
	add rsp,8
	pop rax
	jmp rax
EXH_7:
	add rsp,8
	pop rax
	jmp rax
EXH_9:
	add rsp,8
	pop rax
	jmp rax
EXH_64:
	add rsp,8
	pop rax
	jmp rax
LB_0: ;; #1378◂◂(_none◂{}) 128'(= {| ? |} ) ⊢ { } : (_arr◂{ }◂_arr◂{ }◂_r8◂→{ })
JMP_0:
	mov rax,0
	mov rdi,GLX(128)
	mov rsi,0x0000_ffff_ffff_ffff 
 mov rbx,QWORD [rdi] 
	and rsi,rbx
	cmp rax,rsi 
	jge err_lod_q 
	BC ge,rsi
	mov rbx,1
 imul rax,rbx
	lea rdi,[rdi+8+8*rax]
	mov SRC_REG,rdi
	MOV_RDI GLX(129),SX(0)
	mov r8,GLX(129)
	mov rdi,r8
	CALL_SF rpc_s8
	mov GLX(130),rax
	mov rdi,GLX(130)
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,QWORD [rdi] 
	mov GLX(131),rsi
	mov r8,GLX(130)
	FREE_S8 r8
	push EXH_65
	call LB_1
	add rsp,8
	mov r8,GLX(128)
	GET_LEN rsi,r8
	mov rax,0 
	push SRC_REG 
	lea SRC_REG,[r8+8]
	push r8 
LB_66:
	cmp rsi,0
	jz LB_67
	push rsi 
	mov r8,SX(0)
	FREE_S8 r8
	pop rsi 
	sub rsi,1 
	lea SRC_REG,[SRC_REG+8*1]
	jmp LB_66
LB_67:
	pop rdi
	pop SRC_REG 
	C_CALL_SF free 
 ret 
EXH_65:
	add rsp,8
	pop rax
	jmp rax
RTM_0:
	push EXH_68
	MOV_RBX GLX(128),GLX(127)
	call LB_0
	add rsp,8
	C_CALL exit
EXH_68:
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
