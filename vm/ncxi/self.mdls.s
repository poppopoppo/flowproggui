%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_82
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,r13
	mov rsi,0
	bt r12,0
	setc sil
	call pp_v
	push rax
	mov rdi,rax
	mov rax,0
	add rdi,8
	mov rsi,rdi
	mov rdi,fmt_emt_q
	call printf
	pop rdi
	mov rax,0
	call free
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	ret
NS_E_42:
NS_E_RDI_42:
NS_E_42_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_42_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_42_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_43:
NS_E_RDI_43:
NS_E_43_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_43_LB_0
	cmp r11,57
	ja NS_E_43_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_43_LB_0:
	mov rax,0
	ret
NS_E_45:
NS_E_RDI_45:
NS_E_45_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_45_LB_0
	cmp r11,122
	ja NS_E_45_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_45_LB_0:
	mov rax,0
	ret
NS_E_44:
NS_E_RDI_44:
NS_E_44_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_44_LB_0
	cmp r11,90
	ja NS_E_44_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_44_LB_0:
	mov rax,0
	ret
NS_E_17:
NS_E_RDI_17:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_21:
	mov rdi,r8
	bt r12,0
NS_E_RDI_21:
	mov rsi,0
	setc sil
	push rsi
	call pp_v
	push rax
	push rdi
	mov rdi,2
	call mlc
	pop QWORD [rax+8*1]
	pop QWORD [rax+8*2]
	pop rsi
	btr QWORD [rax],0
	btr QWORD [rax],1
	or QWORD [rax],rsi
	clc
	ret
NS_E_47:
NS_E_RDI_47:
NS_E_47_ETR_TBL:
NS_E_47_TBL:
	push r14
; "A"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,65
	jz LB_58
	jmp NS_E_47_MTC_0_failed
LB_58:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; g0
	call NS_E_47_ETR_TBL
	cmp r15,0
	jz LB_63
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_64
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_64:
	jmp NS_E_47_MTC_0_failed
LB_63:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "B"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,66
	jz LB_69
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_71
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_71:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_72
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_72:
	jmp NS_E_47_MTC_0_failed
LB_69:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_51
	btr QWORD [rdi],2
LB_51:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_52
	btr QWORD [rdi],1
LB_52:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_53
	btr QWORD [rdi],0
LB_53:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_47_MTC_0_failed:
	pop r14
	push r14
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_47_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_82:
NS_E_RDI_82:
; 	» "AB" _ ⊢ 0' : %_74
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_42_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_75 : %_75
 ; {>  %_74~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_75
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f47 { %_74 %_75 } ⊢ { %_76 %_77 %_78 } : { %_76 %_77 %_78 }
 ; {>  %_75~1':_r64 %_74~0':_stg }
; _f47 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 0' 1' }
	call NS_E_47
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r9,r15
	bt r12,2
	jc LB_83
	btr r12,4
	jmp LB_84
LB_83:
	bts r12,4
LB_84:
	mov r15,r8
	bt r12,3
	jc LB_87
	btr r12,2
	jmp LB_88
LB_87:
	bts r12,2
LB_88:
	mov rsi,0
	bt r12,2
	jc LB_85
	bts rsi,17
	bt r15,0
	jc LB_85
	jmp LB_86
LB_85:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r15
	mov r15,rax
	btr r12,2
LB_86:
	mov rax,r9
	shl rax,56
	or rax,1
	mov rdi,rax
	or r15,rdi
; pop_iv
	add rsp,8
; _f14 { %_76 %_77 %_78 } ⊢ { %_79 %_80 %_81 } : { %_79 %_80 %_81 }
 ; {>  %_76~0':_stg %_77~1':_r64 %_78~2':(_opn)◂(_p46) }
; _f14 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_89
	btr r12,3
	jmp LB_90
LB_89:
	bts r12,3
LB_90:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,3
	jc LB_93
	btr r12,4
	jmp LB_94
LB_93:
	bts r12,4
LB_94:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_91
	btr QWORD [rdi],0
	jmp LB_92
LB_91:
	bts QWORD [rdi],0
LB_92:
	mov r9,r14
	bt r12,1
	jc LB_97
	btr r12,4
	jmp LB_98
LB_97:
	bts r12,4
LB_98:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_95
	btr QWORD [rdi],1
	jmp LB_96
LB_95:
	bts QWORD [rdi],1
LB_96:
	mov r9,r15
	bt r12,2
	jc LB_101
	btr r12,4
	jmp LB_102
LB_101:
	bts r12,4
LB_102:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_99
	btr QWORD [rdi],2
	jmp LB_100
LB_99:
	bts QWORD [rdi],2
LB_100:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' 2' }
	mov r8,r13
	bt r12,0
	jc LB_103
	btr r12,3
	jmp LB_104
LB_103:
	bts r12,3
LB_104:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_107
	btr r12,4
	jmp LB_108
LB_107:
	bts r12,4
LB_108:
	mov r13,r9
	bt r12,4
	jc LB_105
	btr r12,0
	jmp LB_106
LB_105:
	bts r12,0
LB_106:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_111
	btr r12,4
	jmp LB_112
LB_111:
	bts r12,4
LB_112:
	mov r14,r9
	bt r12,4
	jc LB_109
	btr r12,1
	jmp LB_110
LB_109:
	bts r12,1
LB_110:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_115
	btr r12,4
	jmp LB_116
LB_115:
	bts r12,4
LB_116:
	mov r15,r9
	bt r12,4
	jc LB_113
	btr r12,2
	jmp LB_114
LB_113:
	bts r12,2
LB_114:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_80~1':_r64 %_79~0':_stg %_81~2':(_opn)◂(_p46) }
; 	∎ {  }
	bt r12,1
	jc LB_117
	mov rdi,r14
	call dlt
LB_117:
	bt r12,0
	jc LB_118
	mov rdi,r13
	call dlt
LB_118:
	bt r12,2
	jc LB_119
	mov rdi,r15
	call dlt
LB_119:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_42:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_42
	NS_E_DYN_43:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43
	NS_E_DYN_44:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44
	NS_E_DYN_45:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45
	NS_E_DYN_48:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_49:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_47:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47
	CST_DYN_82:
		dq 0x0001_0001_00_82_ffff
		dq 1
