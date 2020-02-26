bits 64 
%define SS_MAX 4000
%define SS_NULL 0xffff_ffff_ffff_0000
extern exit 
extern printf 
extern malloc 
extern calloc
extern free 
section .bss 
	ret_vct: resq 64
 rsp_tmp: resq 1
	SS_TOP: resq 1
	SS_VCT: resq 16*SS_MAX
	SS_BTM: resq 1 
section .data
	err_n: dq 0
	fmt_err_line: db "err:%d",10,0
	fmt_r64: db "%dr",0
	fmt_s8: db 34,"%s",34,0
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

section .text
global _start
rpc_s8: ; rdi ⊢ rax
	mov rsi,0x0000_ffff_ffff_ffff
	and rsi,QWORD [rdi]  
	push rdi 
	push rsi 
	and rsi,~111b
	lea rdi,[rsi+16] 
	xor rax,rax 
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call calloc 
	mov rsp,QWORD [rsp_tmp]
	pop rcx 
	mov QWORD [rax],rcx
	pop rsi 
	add rsi,8
	lea rdi,[rax+8]
	cld 
	rep movsb
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
	jmp RTM_0
ETR_26:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_26
	ret
GRM_26:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_3
	jmp LB_4
LB_3:
	mov r8,unt_1
	jmp LB_1
LB_4:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_5
	jmp LB_6
LB_5:
	mov r8,unt_1
	jmp LB_1
LB_6:
	add r14,1
	jmp LB_2
LB_1:
	lea rsp,[rsp+8*0]
	jmp LB_0
LB_2:
	call GRM_26
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_9
	jmp LB_10
LB_9:
	jmp LB_7
LB_10:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_8
LB_7:
	lea rsp,[rsp+8*0]
	jmp LB_0
LB_8:
	mov QWORD [rsp+8*1],r14
;; rsp=1 , %0~8'(= r ) 
; #20 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=1 , %1~0(<2)◂%[ 0r ] %0~8'(= r ) 
; ∎ 0(<2)◂%[ 0r ]
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,0
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
	lea rsp,[rsp+8*1]
;; ret 0
	jmp LB_11
LB_11:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_0
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_0:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_15
	jmp LB_16
LB_15:
	mov r8,unt_1
	jmp LB_13
LB_16:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_17
	jmp LB_18
LB_17:
	mov r8,unt_1
	jmp LB_13
LB_18:
	add r14,1
	jmp LB_14
LB_13:
	lea rsp,[rsp+8*0]
	jmp LB_12
LB_14:
	mov QWORD [rsp+8*0],r14
;; rsp=0 , 
; #20 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %2~0(<2)◂%[ 1r ] 
; ∎ 0(<2)◂%[ 1r ]
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,1
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_19
LB_19:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_12
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_12:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_27:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_27
	ret
GRM_27:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_23
	jmp LB_24
LB_23:
	mov r8,unt_1
	jmp LB_21
LB_24:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_25
	jmp LB_26
LB_25:
	mov r8,unt_1
	jmp LB_21
LB_26:
	add r14,1
	jmp LB_22
LB_21:
	lea rsp,[rsp+8*0]
	jmp LB_20
LB_22:
	call GRM_26
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_29
	jmp LB_30
LB_29:
	jmp LB_27
LB_30:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_28
LB_27:
	lea rsp,[rsp+8*0]
	jmp LB_20
LB_28:
	mov QWORD [rsp+8*1],r14
;; rsp=1 , %3~8'(= r ) 
; #20 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %4~0(<2)◂8'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov r8,QWORD [rsp-8+8*1]
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
	lea rsp,[rsp+8*1]
;; ret 0
	jmp LB_31
LB_31:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_20
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_20:
	call GRM_26
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_35
	jmp LB_36
LB_35:
	jmp LB_33
LB_36:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_34
LB_33:
	lea rsp,[rsp+8*0]
	jmp LB_32
LB_34:
	call GRM_26
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_39
	jmp LB_40
LB_39:
	jmp LB_37
LB_40:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_38
LB_37:
	lea rsp,[rsp+8*1]
	jmp LB_32
LB_38:
	mov QWORD [rsp+8*2],r14
;; rsp=2 , %6~9'(= r ) %5~8'(= r ) 
; _add { 8'(= r ) 9'(= r ) } ⊢ { 8'(= r ) 9'(= r ) }
	mov rdi,QWORD [rsp-8+8*1]
	add QWORD [rsp-8+8*2],rdi
;; rsp=2 , %8~9'(= r ) %7~8'(= r ) 
; #20 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=2 , %9~0(<2)◂8'(= r ) %8~9'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .dlt.ptn 9'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov r8,QWORD [rsp-8+8*2]
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
	lea rsp,[rsp+8*2]
;; ret 0
	jmp LB_41
LB_41:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_32
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_32:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_28:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_28
	ret
GRM_28:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_45
	jmp LB_46
LB_45:
	mov r8,unt_1
	jmp LB_43
LB_46:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],115
	jnz LB_47
	jmp LB_48
LB_47:
	mov r8,unt_1
	jmp LB_43
LB_48:
	add r14,1
	jmp LB_44
LB_43:
	lea rsp,[rsp+8*0]
	jmp LB_42
LB_44:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_51
	jmp LB_52
LB_51:
	mov r8,unt_1
	jmp LB_49
LB_52:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],88
	jnz LB_53
	jmp LB_54
LB_53:
	mov r8,unt_1
	jmp LB_49
LB_54:
	add r14,1
	jmp LB_50
LB_49:
	lea rsp,[rsp+8*0]
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
LB_50:
	mov QWORD [rsp+8*0],r14
;; rsp=0 , 
; #20 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %10~0(<2)◂%[ 0r ] 
; ∎ 0(<2)◂%[ 0r ]
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,0
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_55
LB_55:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_42
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_42:
	cmp r14,r9
	jge LB_59
	jmp LB_60
LB_59:
	mov r8,unt_1 
	jmp LB_57
LB_60:
	movzx rdi,BYTE [r13+8+r14]
	push rdi 
	add r14,1 
	jmp LB_58
LB_57:
	lea rsp,[rsp+8*0]
	jmp LB_56
LB_58:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_63
	jmp LB_64
LB_63:
	mov r8,unt_1
	jmp LB_61
LB_64:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],89
	jnz LB_65
	jmp LB_66
LB_65:
	mov r8,unt_1
	jmp LB_61
LB_66:
	add r14,1
	jmp LB_62
LB_61:
	lea rsp,[rsp+8*1]
	jmp LB_56
LB_62:
	mov QWORD [rsp+8*1],r14
;; rsp=1 , %11~8'(= r ) 
; #20 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %12~0(<2)◂8'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov r8,QWORD [rsp-8+8*1]
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
	lea rsp,[rsp+8*1]
;; ret 0
	jmp LB_67
LB_67:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_56
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_56:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_29:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_29
	ret
GRM_29:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_71
	jmp LB_72
LB_71:
	mov r8,unt_1
	jmp LB_69
LB_72:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],65
	jnz LB_73
	jmp LB_74
LB_73:
	mov r8,unt_1
	jmp LB_69
LB_74:
	add r14,1
	jmp LB_70
LB_69:
	lea rsp,[rsp+8*0]
	jmp LB_68
LB_70:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_79
	jmp LB_80
LB_79:
	mov r8,unt_1
	jmp LB_77
LB_80:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],66
	jnz LB_81
	jmp LB_82
LB_81:
	mov r8,unt_1
	jmp LB_77
LB_82:
	add r14,1
	jmp LB_78
LB_77:
	lea rsp,[rsp+8*0]
	jmp LB_76
LB_78:
	mov QWORD [rsp+8*0],r14
;; rsp=0 , 
; #20 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %13~0(<2)◂%[ 0r ] 
; ∎ 0(<2)◂%[ 0r ]
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,0
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_83
LB_83:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_76
	pop r14
	pop r9
	pop rdi
	pop r13
	jmp LB_75
LB_76:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_87
	jmp LB_88
LB_87:
	mov r8,unt_1
	jmp LB_85
LB_88:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],67
	jnz LB_89
	jmp LB_90
LB_89:
	mov r8,unt_1
	jmp LB_85
LB_90:
	add r14,1
	jmp LB_86
LB_85:
	lea rsp,[rsp+8*0]
	jmp LB_84
LB_86:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_95
	jmp LB_96
LB_95:
	mov r8,unt_1
	jmp LB_93
LB_96:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],101
	jnz LB_97
	jmp LB_98
LB_97:
	mov r8,unt_1
	jmp LB_93
LB_98:
	add r14,1
	jmp LB_94
LB_93:
	lea rsp,[rsp+8*0]
	jmp LB_92
LB_94:
	mov QWORD [rsp+8*0],r14
;; rsp=0 , 
; #20 %[ 3r ] ⊢ 0(<2)◂%[ 3r ]
;; rsp=0 , %14~0(<2)◂%[ 3r ] 
; ∎ 0(<2)◂%[ 3r ]
; .mov_ptn2 0(<2)◂%[ 3r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 3r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,3
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_99
LB_99:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_92
	pop r14
	pop r9
	pop rdi
	pop r13
	jmp LB_91
LB_92:
	call GRM_29
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_103
	jmp LB_104
LB_103:
	jmp LB_101
LB_104:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_102
LB_101:
	lea rsp,[rsp+8*0]
	jmp LB_100
LB_102:
	mov QWORD [rsp+8*1],r14
;; rsp=1 , %15~8'(= r ) 
; #20 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %16~0(<2)◂8'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov r8,QWORD [rsp-8+8*1]
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
	lea rsp,[rsp+8*1]
;; ret 0
	jmp LB_105
LB_105:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_100
	pop r14
	pop r9
	pop rdi
	pop r13
	jmp LB_91
LB_100:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_91
LB_91:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_106
	jmp LB_107
LB_106:
	lea rsp,[rsp+8*0]
	pop rdi 
	pop r9 
	pop r14 
	pop r13
	jmp LB_75
LB_107:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 0'(= r )
	mov r14,r13
; .mov_ptn 2'(= r ) ⊢ 0'(= r )
	mov r13,r8
;; rsp=0 , %17~0'(= r ) 
; #20 %[ 1r ] ⊢ 0(<2)◂%[ 1r ]
;; rsp=0 , %18~0(<2)◂%[ 1r ] %17~0'(= r ) 
; ∎ 0(<2)◂%[ 1r ]
; .dlt.ptn 0'(= r )
; .mov_ptn2 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 1r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,1
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_108
LB_108:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_84
	pop r14
	pop r9
	pop rdi
	pop r13
	jmp LB_75
LB_84:
	pop rdi
	pop r9 
	pop r14
	pop r13
	jmp LB_75
LB_75:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_109
	jmp LB_110
LB_109:
	lea rsp,[rsp+8*0]
	pop rdi 
	pop r9 
	pop r14 
	pop r13
	ret
LB_110:
	mov QWORD [rsp+8*0],r14
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 0'(= r )
	mov r14,r13
; .mov_ptn 2'(= r ) ⊢ 0'(= r )
	mov r13,r8
;; rsp=0 , %19~0'(= r ) 
; #20 0'(= r ) ⊢ 0(<2)◂0'(= r )
;; rsp=0 , %20~0(<2)◂0'(= r ) 
; ∎ 0(<2)◂0'(= r )
; .mov_ptn2 0(<2)◂0'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂0'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov r8,r13
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_111
LB_111:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_68
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_68:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_115
	jmp LB_116
LB_115:
	mov r8,unt_1
	jmp LB_113
LB_116:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],68
	jnz LB_117
	jmp LB_118
LB_117:
	mov r8,unt_1
	jmp LB_113
LB_118:
	add r14,1
	jmp LB_114
LB_113:
	lea rsp,[rsp+8*0]
	jmp LB_112
LB_114:
	mov QWORD [rsp+8*0],r14
;; rsp=0 , 
; #20 %[ 2r ] ⊢ 0(<2)◂%[ 2r ]
;; rsp=0 , %21~0(<2)◂%[ 2r ] 
; ∎ 0(<2)◂%[ 2r ]
; .mov_ptn2 0(<2)◂%[ 2r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 2r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,2
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_119
LB_119:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_112
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_112:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
ETR_30:
	mov r9,0x0000_ffff_ffff_ffff
	and r9,[r13]
	call GRM_30
	ret
GRM_30:
	sub rsp,32
	mov QWORD [rsp+24],r13
	mov QWORD [rsp+16],r14 
	mov QWORD [rsp+8],r9
	jmp LB_122
LB_121:
	add r14,1 
LB_122:
	cmp r14,r9
	jge LB_123
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_121
	cmp rax,32 
	jz LB_121
LB_123
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_126
	jmp LB_127
LB_126:
	mov r8,unt_1
	jmp LB_124
LB_127:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],97
	jnz LB_128
	jmp LB_129
LB_128:
	mov r8,unt_1
	jmp LB_124
LB_129:
	add r14,1
	jmp LB_125
LB_124:
	lea rsp,[rsp+8*0]
	jmp LB_120
LB_125:
	jmp LB_131
LB_130:
	add r14,1 
LB_131:
	cmp r14,r9
	jge LB_132
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_130
	cmp rax,32 
	jz LB_130
LB_132
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_135
	jmp LB_136
LB_135:
	mov r8,unt_1
	jmp LB_133
LB_136:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],98
	jnz LB_137
	jmp LB_138
LB_137:
	mov r8,unt_1
	jmp LB_133
LB_138:
	add r14,1
	jmp LB_134
LB_133:
	lea rsp,[rsp+8*0]
	jmp LB_120
LB_134:
	jmp LB_140
LB_139:
	add r14,1 
LB_140:
	cmp r14,r9
	jge LB_141
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_139
	cmp rax,32 
	jz LB_139
LB_141
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_144
	jmp LB_145
LB_144:
	mov r8,unt_1
	jmp LB_142
LB_145:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],99
	jnz LB_146
	jmp LB_147
LB_146:
	mov r8,unt_1
	jmp LB_142
LB_147:
	add r14,1
	jmp LB_143
LB_142:
	lea rsp,[rsp+8*0]
	jmp LB_120
LB_143:
	mov QWORD [rsp+8*0],r14
;; rsp=0 , 
; #20 %[ 0r ] ⊢ 0(<2)◂%[ 0r ]
;; rsp=0 , %22~0(<2)◂%[ 0r ] 
; ∎ 0(<2)◂%[ 0r ]
; .mov_ptn2 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂%[ 0r ] ⊢ 2'(= a3◂ [ r] )
	mov r8,0
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
;; ret 0
	jmp LB_148
LB_148:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_120
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_120:
	jmp LB_151
LB_150:
	add r14,1 
LB_151:
	cmp r14,r9
	jge LB_152
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_150
	cmp rax,10 
	jz LB_150
	cmp rax,32 
	jz LB_150
LB_152
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_155
	jmp LB_156
LB_155:
	mov r8,unt_1
	jmp LB_153
LB_156:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],120
	jnz LB_157
	jmp LB_158
LB_157:
	mov r8,unt_1
	jmp LB_153
LB_158:
	add r14,1
	jmp LB_154
LB_153:
	lea rsp,[rsp+8*0]
	jmp LB_149
LB_154:
	jmp LB_160
LB_159:
	add r14,1 
LB_160:
	cmp r14,r9
	jge LB_161
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_159
	cmp rax,10 
	jz LB_159
	cmp rax,32 
	jz LB_159
LB_161
	call GRM_30
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_164
	jmp LB_165
LB_164:
	jmp LB_162
LB_165:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_163
LB_162:
	lea rsp,[rsp+8*0]
	jmp LB_149
LB_163:
	jmp LB_167
LB_166:
	add r14,1 
LB_167:
	cmp r14,r9
	jge LB_168
	movzx rax,BYTE [r13+8+r14]
	cmp rax,9 
	jz LB_166
	cmp rax,10 
	jz LB_166
	cmp rax,32 
	jz LB_166
LB_168
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_171
	jmp LB_172
LB_171:
	mov r8,unt_1
	jmp LB_169
LB_172:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],122
	jnz LB_173
	jmp LB_174
LB_173:
	mov r8,unt_1
	jmp LB_169
LB_174:
	add r14,1
	jmp LB_170
LB_169:
	lea rsp,[rsp+8*1]
	jmp LB_149
LB_170:
	mov QWORD [rsp+8*1],r14
;; rsp=1 , %23~8'(= r ) 
; #20 8'(= r ) ⊢ 0(<2)◂8'(= r )
;; rsp=1 , %24~0(<2)◂8'(= r ) 
; ∎ 0(<2)◂8'(= r )
; .mov_ptn2 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂8'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov r8,QWORD [rsp-8+8*1]
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
	lea rsp,[rsp+8*1]
;; ret 0
	jmp LB_175
LB_175:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_149
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_149:
	call GRM_30
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_179
	jmp LB_180
LB_179:
	jmp LB_177
LB_180:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 8'(= r )
; .mov_ptn 2'(= r ) ⊢ 8'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_178
LB_177:
	lea rsp,[rsp+8*0]
	jmp LB_176
LB_178:
	lea rax,[r14+1]
	cmp rax,r9
	jg LB_183
	jmp LB_184
LB_183:
	mov r8,unt_1
	jmp LB_181
LB_184:
	lea rdi,[r13+8+r14]
	cmp BYTE [rdi+0],84
	jnz LB_185
	jmp LB_186
LB_185:
	mov r8,unt_1
	jmp LB_181
LB_186:
	add r14,1
	jmp LB_182
LB_181:
	lea rsp,[rsp+8*1]
	jmp LB_176
LB_182:
	call GRM_29
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_189
	jmp LB_190
LB_189:
	jmp LB_187
LB_190:
	lea rsp,[rsp-8*1]
	mov r8,[r8+8]
; .mov_ptn2 2'(= r ) ⊢ 9'(= r )
; .mov_ptn 2'(= r ) ⊢ 9'(= r )
	mov QWORD [rsp-8+8*1],r8
	jmp LB_188
LB_187:
	lea rsp,[rsp+8*1]
	jmp LB_176
LB_188:
	mov QWORD [rsp+8*2],r14
;; rsp=2 , %26~9'(= r ) %25~8'(= r ) 
; #20 9'(= r ) ⊢ 0(<2)◂9'(= r )
;; rsp=2 , %27~0(<2)◂9'(= r ) %25~8'(= r ) 
; ∎ 0(<2)◂9'(= r )
; .dlt.ptn 8'(= r )
; .mov_ptn2 0(<2)◂9'(= r ) ⊢ 2'(= a3◂ [ r] )
; .mov_ptn 0(<2)◂9'(= r ) ⊢ 2'(= a3◂ [ r] )
	mov r8,QWORD [rsp-8+8*1]
	mov rdi,r8
	mov rsi,[SS_TOP]
	mov rax,[rsi]
	mov QWORD [SS_TOP],rax 
	mov QWORD [rsi],0
	mov QWORD [rsi+8],rdi
	mov BYTE [rsi+6],0
	mov r8,rsi
	lea rsp,[rsp+8*2]
;; ret 0
	jmp LB_191
LB_191:
	movzx rax,BYTE [r8+6]
	cmp rax,0
	jnz LB_176
	pop r14
	pop r9
	pop rdi
	pop r13
	ret
LB_176:
	pop rdi
	pop r9 
	pop r14
	pop r13
	ret
RTM_0:
	push RTM_1
;; rsp=0 , 
; rsp_d=0, #27 { %[ "ABAB" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
; .mov_ptn2 { %[ "ABAB" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov r14,0
; .mov_ptn %[ "ABAB" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call malloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,4
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],66
	mov BYTE [rax+8+2],65
	mov BYTE [rax+8+3],66
	mov r13,rax
	call ETR_27
;; rsp=0 , %30~2'(= a3◂ [ r] ) %29~1'(= r ) %28~0'(= {| l |} ) 
; _emt { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) } ⊢ { 0'(= {| l |} ) 1'(= r ) 2'(= a3◂ [ r] ) }
	jmp LB_193
LB_192: db 95,101,109,116,58,0
LB_193:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_192
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_195
LB_194: db 123,32,0
LB_195:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_194
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_197
LB_196: db 32,0
LB_197:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_196
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_199
LB_198: db 32,0
LB_199:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_198
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,r8
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_200
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_202
LB_201: db 32,0
LB_202:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_201
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_204
LB_203: db 125,32,0
LB_204:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_203
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_206
LB_205: db 10,0
LB_206:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_205
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_207
LB_200:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_210+8*rax]
LB_210: dq LB_208,LB_209
LB_208:
	jmp LB_213
LB_212: db 39,48,226,151,130,0
LB_213:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_212
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,QWORD [r8+8]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_211
LB_209:
	jmp LB_215
LB_214: db 39,49,226,151,130,0
LB_215:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_214
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_217
LB_216: db 42,123,32,0
LB_217:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_216
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_219
LB_218: db 125,32,0
LB_219:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_218
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_211
LB_211:
	ret
LB_207:
;; rsp=0 , %33~2'(= a3◂ [ r] ) %32~1'(= r ) %31~0'(= {| l |} ) 
; rsp_d=0, #28 { %[ "sY" ] %[ 0r ] } ⊢ { 5'(= {| l |} ) 4'(= r ) 3'(= a3◂ [ r] ) }
	lea rsp,[rsp-8*3]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
; .mov_ptn2 { %[ "sY" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov r14,0
; .mov_ptn %[ "sY" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call malloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,2
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],115
	mov BYTE [rax+8+1],89
	mov r13,rax
	call ETR_28
	mov rax,QWORD [rsp-8+8*3]
	mov r9,r8
	mov r8,rax
	mov rax,QWORD [rsp-8+8*2]
	mov r10,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov r11,r13
	mov r13,rax
	lea rsp,[rsp+8*3]
;; rsp=0 , %36~3'(= a3◂ [ r] ) %35~4'(= r ) %34~5'(= {| l |} ) %33~2'(= a3◂ [ r] ) %32~1'(= r ) %31~0'(= {| l |} ) 
; _emt { 5'(= {| l |} ) 4'(= r ) 3'(= a3◂ [ r] ) } ⊢ { 5'(= {| l |} ) 4'(= r ) 3'(= a3◂ [ r] ) }
	jmp LB_221
LB_220: db 95,101,109,116,58,0
LB_221:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_220
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_223
LB_222: db 123,32,0
LB_223:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_222
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,r11
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_225
LB_224: db 32,0
LB_225:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_224
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,r10
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_227
LB_226: db 32,0
LB_227:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_226
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,r9
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_228
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_230
LB_229: db 32,0
LB_230:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_229
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_232
LB_231: db 125,32,0
LB_232:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_231
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_234
LB_233: db 10,0
LB_234:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_233
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_235
LB_228:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_238+8*rax]
LB_238: dq LB_236,LB_237
LB_236:
	jmp LB_241
LB_240: db 39,48,226,151,130,0
LB_241:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_240
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,QWORD [r8+8]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_239
LB_237:
	jmp LB_243
LB_242: db 39,49,226,151,130,0
LB_243:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_242
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_245
LB_244: db 42,123,32,0
LB_245:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_244
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_247
LB_246: db 125,32,0
LB_247:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_246
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_239
LB_239:
	ret
LB_235:
;; rsp=0 , %39~3'(= a3◂ [ r] ) %38~4'(= r ) %37~5'(= {| l |} ) %33~2'(= a3◂ [ r] ) %32~1'(= r ) %31~0'(= {| l |} ) 
; rsp_d=0, #29 { %[ "AB" ] %[ 0r ] } ⊢ { 8'(= {| l |} ) 7'(= r ) 6'(= a3◂ [ r] ) }
	lea rsp,[rsp-8*6]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
; .mov_ptn2 { %[ "AB" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov r14,0
; .mov_ptn %[ "AB" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call malloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,2
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],66
	mov r13,rax
	call ETR_29
	mov r11,QWORD [rsp-8+8*6]
	mov r10,QWORD [rsp-8+8*5]
	mov r9,QWORD [rsp-8+8*4]
	mov rax,QWORD [rsp-8+8*3]
	mov rcx,r8
	mov r8,rax
	mov rax,QWORD [rsp-8+8*2]
	mov rdx,r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [rsp-8+8*6],r13
	mov r13,rax
	lea rsp,[rsp+8*5]
;; rsp=1 , %42~6'(= a3◂ [ r] ) %41~7'(= r ) %40~8'(= {| l |} ) %39~3'(= a3◂ [ r] ) %38~4'(= r ) %37~5'(= {| l |} ) %33~2'(= a3◂ [ r] ) %32~1'(= r ) %31~0'(= {| l |} ) 
; _emt { 8'(= {| l |} ) 7'(= r ) 6'(= a3◂ [ r] ) } ⊢ { 8'(= {| l |} ) 7'(= r ) 6'(= a3◂ [ r] ) }
	jmp LB_249
LB_248: db 95,101,109,116,58,0
LB_249:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_248
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_251
LB_250: db 123,32,0
LB_251:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_250
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,QWORD [rsp-8+8*1]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_253
LB_252: db 32,0
LB_253:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_252
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,rdx
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_255
LB_254: db 32,0
LB_255:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_254
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,rcx
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_256
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_258
LB_257: db 32,0
LB_258:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_257
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_260
LB_259: db 125,32,0
LB_260:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_259
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_262
LB_261: db 10,0
LB_262:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_261
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_263
LB_256:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_266+8*rax]
LB_266: dq LB_264,LB_265
LB_264:
	jmp LB_269
LB_268: db 39,48,226,151,130,0
LB_269:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_268
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,QWORD [r8+8]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_267
LB_265:
	jmp LB_271
LB_270: db 39,49,226,151,130,0
LB_271:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_270
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_273
LB_272: db 42,123,32,0
LB_273:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_272
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_275
LB_274: db 125,32,0
LB_275:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_274
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_267
LB_267:
	ret
LB_263:
;; rsp=1 , %45~6'(= a3◂ [ r] ) %44~7'(= r ) %43~8'(= {| l |} ) %39~3'(= a3◂ [ r] ) %38~4'(= r ) %37~5'(= {| l |} ) %33~2'(= a3◂ [ r] ) %32~1'(= r ) %31~0'(= {| l |} ) 
; rsp_d=0, #29 { %[ "ACACe" ] %[ 0r ] } ⊢ { 11'(= {| l |} ) 10'(= r ) 9'(= a3◂ [ r] ) }
	lea rsp,[rsp-8*8]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
	mov QWORD [rsp+8*7],rdx
; .mov_ptn2 { %[ "ACACe" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov r14,0
; .mov_ptn %[ "ACACe" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call malloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,5
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],65
	mov BYTE [rax+8+1],67
	mov BYTE [rax+8+2],65
	mov BYTE [rax+8+3],67
	mov BYTE [rax+8+4],101
	mov r13,rax
	call ETR_29
	mov rdx,QWORD [rsp-8+8*8]
	mov rcx,QWORD [rsp-8+8*7]
	mov r11,QWORD [rsp-8+8*6]
	mov r10,QWORD [rsp-8+8*5]
	mov r9,QWORD [rsp-8+8*4]
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [rsp-8+8*8],r8
	mov r8,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [rsp-8+8*7],r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [rsp-8+8*6],r13
	mov r13,rax
	lea rsp,[rsp+8*5]
;; rsp=4 , %48~9'(= a3◂ [ r] ) %47~10'(= r ) %46~11'(= {| l |} ) %45~6'(= a3◂ [ r] ) %44~7'(= r ) %43~8'(= {| l |} ) %39~3'(= a3◂ [ r] ) %38~4'(= r ) %37~5'(= {| l |} ) %33~2'(= a3◂ [ r] ) %32~1'(= r ) %31~0'(= {| l |} ) 
; _emt { 11'(= {| l |} ) 10'(= r ) 9'(= a3◂ [ r] ) } ⊢ { 11'(= {| l |} ) 10'(= r ) 9'(= a3◂ [ r] ) }
	jmp LB_277
LB_276: db 95,101,109,116,58,0
LB_277:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_276
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_279
LB_278: db 123,32,0
LB_279:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_278
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,QWORD [rsp-8+8*1]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_281
LB_280: db 32,0
LB_281:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_280
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,QWORD [rsp-8+8*2]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_283
LB_282: db 32,0
LB_283:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_282
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,QWORD [rsp-8+8*3]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_284
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_286
LB_285: db 32,0
LB_286:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_285
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_288
LB_287: db 125,32,0
LB_288:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_287
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_290
LB_289: db 10,0
LB_290:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_289
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_291
LB_284:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_294+8*rax]
LB_294: dq LB_292,LB_293
LB_292:
	jmp LB_297
LB_296: db 39,48,226,151,130,0
LB_297:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_296
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,QWORD [r8+8]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_295
LB_293:
	jmp LB_299
LB_298: db 39,49,226,151,130,0
LB_299:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_298
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_301
LB_300: db 42,123,32,0
LB_301:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_300
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_303
LB_302: db 125,32,0
LB_303:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_302
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_295
LB_295:
	ret
LB_291:
;; rsp=4 , %51~9'(= a3◂ [ r] ) %50~10'(= r ) %49~11'(= {| l |} ) %45~6'(= a3◂ [ r] ) %44~7'(= r ) %43~8'(= {| l |} ) %39~3'(= a3◂ [ r] ) %38~4'(= r ) %37~5'(= {| l |} ) %33~2'(= a3◂ [ r] ) %32~1'(= r ) %31~0'(= {| l |} ) 
; rsp_d=0, #30 { %[ " a bc d" ] %[ 0r ] } ⊢ { 14'(= {| l |} ) 13'(= r ) 12'(= a3◂ [ r] ) }
	lea rsp,[rsp-8*8]
	mov QWORD [rsp+8*0],r13
	mov QWORD [rsp+8*1],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*3],r9
	mov QWORD [rsp+8*4],r10
	mov QWORD [rsp+8*5],r11
	mov QWORD [rsp+8*6],rcx
	mov QWORD [rsp+8*7],rdx
; .mov_ptn2 { %[ " a bc d" ] %[ 0r ] } ⊢ { 0'(= {| l |} ) 1'(= r ) }
; .mov_ptn %[ 0r ] ⊢ 1'(= r )
	mov r14,0
; .mov_ptn %[ " a bc d" ] ⊢ 0'(= {| l |} )
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov rdi,16
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call malloc
	mov rsp,QWORD [rsp_tmp]  
	mov rdi,7
	mov rsi,0x_40_00_0000_0000_0000
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],0
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov BYTE [rax+8+0],32
	mov BYTE [rax+8+1],97
	mov BYTE [rax+8+2],32
	mov BYTE [rax+8+3],98
	mov BYTE [rax+8+4],99
	mov BYTE [rax+8+5],32
	mov BYTE [rax+8+6],100
	mov r13,rax
	call ETR_30
	mov rdx,QWORD [rsp-8+8*8]
	mov rcx,QWORD [rsp-8+8*7]
	mov r11,QWORD [rsp-8+8*6]
	mov r10,QWORD [rsp-8+8*5]
	mov r9,QWORD [rsp-8+8*4]
	mov rax,QWORD [rsp-8+8*3]
	mov QWORD [rsp-8+8*8],r8
	mov r8,rax
	mov rax,QWORD [rsp-8+8*2]
	mov QWORD [rsp-8+8*7],r14
	mov r14,rax
	mov rax,QWORD [rsp-8+8*1]
	mov QWORD [rsp-8+8*6],r13
	mov r13,rax
	lea rsp,[rsp+8*5]
;; rsp=7 , %54~12'(= a3◂ [ r] ) %53~13'(= r ) %52~14'(= {| l |} ) %51~9'(= a3◂ [ r] ) %50~10'(= r ) %49~11'(= {| l |} ) %45~6'(= a3◂ [ r] ) %44~7'(= r ) %43~8'(= {| l |} ) %39~3'(= a3◂ [ r] ) %38~4'(= r ) %37~5'(= {| l |} ) %33~2'(= a3◂ [ r] ) %32~1'(= r ) %31~0'(= {| l |} ) 
; _emt { 14'(= {| l |} ) 13'(= r ) 12'(= a3◂ [ r] ) } ⊢ { 14'(= {| l |} ) 13'(= r ) 12'(= a3◂ [ r] ) }
	jmp LB_305
LB_304: db 95,101,109,116,58,0
LB_305:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_304
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_307
LB_306: db 123,32,0
LB_307:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_306
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,QWORD [rsp-8+8*1]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	add rsi,8
	xor rax,rax  
	mov rdi,fmt_s8
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_309
LB_308: db 32,0
LB_309:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_308
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,QWORD [rsp-8+8*2]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_311
LB_310: db 32,0
LB_311:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_310
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov rax,QWORD [rsp-8+8*3]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	mov r8,rax
	call LB_312
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_314
LB_313: db 32,0
LB_314:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_313
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_316
LB_315: db 125,32,0
LB_316:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_315
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_318
LB_317: db 10,0
LB_318:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_317
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_319
LB_312:
	movzx rax,BYTE [r8+6]
	jmp QWORD [LB_322+8*rax]
LB_322: dq LB_320,LB_321
LB_320:
	jmp LB_325
LB_324: db 39,48,226,151,130,0
LB_325:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_324
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	mov r8,QWORD [r8+8]
	mov rsi,r8
	xor rax,rax  
	mov rdi,fmt_r64
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	jmp LB_323
LB_321:
	jmp LB_327
LB_326: db 39,49,226,151,130,0
LB_327:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_326
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_329
LB_328: db 42,123,32,0
LB_329:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_328
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_331
LB_330: db 125,32,0
LB_331:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_330
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_323
LB_323:
	ret
LB_319:
;; rsp=7 , %57~12'(= a3◂ [ r] ) %56~13'(= r ) %55~14'(= {| l |} ) %51~9'(= a3◂ [ r] ) %50~10'(= r ) %49~11'(= {| l |} ) %45~6'(= a3◂ [ r] ) %44~7'(= r ) %43~8'(= {| l |} ) %39~3'(= a3◂ [ r] ) %38~4'(= r ) %37~5'(= {| l |} ) %33~2'(= a3◂ [ r] ) %32~1'(= r ) %31~0'(= {| l |} ) 
; _emt %[ "dd\t\n\"J  " ] ⊢ %[ "dd\t\n\"J  " ]
	jmp LB_333
LB_332: db 95,101,109,116,58,0
LB_333:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_332
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_335
LB_334: db 34,100,100,92,116,92,110,92,34,74,32,32,34,0
LB_335:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_334
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_337
LB_336: db 10,0
LB_337:
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax  
	mov rdi,LB_336
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call printf 
	mov rsp,QWORD [rsp_tmp]
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	jmp LB_338
LB_338:
;; rsp=7 , %58~%[ "dd\t\n\"J  " ] %57~12'(= a3◂ [ r] ) %56~13'(= r ) %55~14'(= {| l |} ) %51~9'(= a3◂ [ r] ) %50~10'(= r ) %49~11'(= {| l |} ) %45~6'(= a3◂ [ r] ) %44~7'(= r ) %43~8'(= {| l |} ) %39~3'(= a3◂ [ r] ) %38~4'(= r ) %37~5'(= {| l |} ) %33~2'(= a3◂ [ r] ) %32~1'(= r ) %31~0'(= {| l |} ) 
; ∎ { }
; .dlt.ptn %[ "dd\t\n\"J  " ]
; .dlt.ptn 12'(= a3◂ [ r] )
;	.dlt adt ⊢ _  
; .dlt.ptn 13'(= r )
; .dlt.ptn 14'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*1]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 9'(= a3◂ [ r] )
;	.dlt adt ⊢ _  
; .dlt.ptn 10'(= r )
; .dlt.ptn 11'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*4]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 6'(= a3◂ [ r] )
;	.dlt adt ⊢ _  
; .dlt.ptn 7'(= r )
; .dlt.ptn 8'(= {| l |} )
	mov rdi,QWORD [rsp-8+8*7]
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 3'(= a3◂ [ r] )
;	.dlt adt ⊢ _  
; .dlt.ptn 4'(= r )
; .dlt.ptn 5'(= {| l |} )
	mov rdi,r11
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .dlt.ptn 2'(= a3◂ [ r] )
;	.dlt adt ⊢ _  
; .dlt.ptn 1'(= r )
; .dlt.ptn 0'(= {| l |} )
	mov rdi,r13
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	xor rax,rax
	mov QWORD [rsp_tmp],rsp 
	and rsp,~0xf 
	call free 
	mov rsp,QWORD [rsp_tmp] 
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
; .mov_ptn2 { } ⊢ { }
	lea rsp,[rsp+8*7]
;; ret 0
	ret
RTM_1:
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
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rax,1
	mov rbx,0
	int 0x80
