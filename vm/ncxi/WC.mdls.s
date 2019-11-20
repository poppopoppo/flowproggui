%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_56
	call NS_E_147
	call exec_out
	jmp _end
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
NS_E_40:
NS_E_RDI_40:
NS_E_40_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_40_LB_0
	bt r11,7
	jc LB_41
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,1
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_41:
	add rsi,1
	bt r11,6
	jc LB_42
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,2
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_42:
	add rsi,1
	bt r11,5
	jc LB_43
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,3
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11b,[rdi+rsi+8*1+2]
	mov BYTE [r10+8*1+2],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
LB_43:
	add rsi,1
	bt r11,5
	jc LB_43
	push rdi
	push rsi
	push rdx
	push r11
	mov rdi,4
	call mlc_s8
	mov r10,rax
	pop r11
	pop rdx
	pop rsi
	pop rdi
	mov QWORD [r10+8*1],0
	mov BYTE [r10+8*1],r11b
	mov r11b,[rdi+rsi+8*1+1]
	mov BYTE [r10+8*1+1],r11b
	mov r11b,[rdi+rsi+8*1+2]
	mov BYTE [r10+8*1+2],r11b
	mov r11b,[rdi+rsi+8*1+3]
	mov BYTE [r10+8*1+3],r11b
	mov r11,0
	add rsi,1
	mov rax,1
	ret
	add rsi,1
	mov rax,1
	ret
NS_E_40_LB_0:
	mov rax,0
	ret
NS_E_44:
NS_E_RDI_44:
NS_E_44_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_44_LB_0
	cmp r11,57
	ja NS_E_44_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_44_LB_0:
	mov rax,0
	ret
NS_E_46:
NS_E_RDI_46:
NS_E_46_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_46_LB_0
	cmp r11,122
	ja NS_E_46_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_46_LB_0:
	mov rax,0
	ret
NS_E_45:
NS_E_RDI_45:
NS_E_45_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_45_LB_0
	cmp r11,90
	ja NS_E_45_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_45_LB_0:
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
NS_E_56:
NS_E_RDI_56:
; » 0xrff |~ {  } ⊢ %_47 : %_47
 ; {>  }
; 	» 0xrff _ ⊢ 0' : %_47
	mov rdi,0xff
	mov r13,rdi
	bts r12,0
; » 0xraa |~ {  } ⊢ %_48 : %_48
 ; {>  %_47~0':_r64 }
; 	» 0xraa _ ⊢ 1' : %_48
	mov rdi,0xaa
	mov r14,rdi
	bts r12,1
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { %_49 %_50 %_51 } : { %_49 %_50 %_51 }
 ; {>  %_47~0':_r64 %_48~1':_r64 }
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { { {  } {  } } {  } { {  } } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { { {  } {  } } {  } { {  } } } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r15
	bt r12,2
	jc LB_63
	btr QWORD [rdi],0
	jmp LB_64
LB_63:
	bts QWORD [rdi],0
LB_64:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r15
	bt r12,2
	jc LB_65
	btr QWORD [rdi],1
	jmp LB_66
LB_65:
	bts QWORD [rdi],1
LB_66:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_61
	btr QWORD [rdi],0
	jmp LB_62
LB_61:
	bts QWORD [rdi],0
LB_62:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_67
	btr QWORD [rdi],1
	jmp LB_68
LB_67:
	bts QWORD [rdi],1
LB_68:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r15
	bt r12,2
	jc LB_71
	btr QWORD [rdi],0
	jmp LB_72
LB_71:
	bts QWORD [rdi],0
LB_72:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_69
	btr QWORD [rdi],2
	jmp LB_70
LB_69:
	bts QWORD [rdi],2
LB_70:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { { {  } {  } } {  } { {  } } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_77
	btr r12,1
	jmp LB_78
LB_77:
	bts r12,1
LB_78:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_73
	btr r12,2
	jmp LB_74
LB_73:
	bts r12,2
LB_74:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_75
	btr r12,2
	jmp LB_76
LB_75:
	bts r12,2
LB_76:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_79
	btr r12,1
	jmp LB_80
LB_79:
	bts r12,1
LB_80:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_83
	btr r12,1
	jmp LB_84
LB_83:
	bts r12,1
LB_84:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_81
	btr r12,2
	jmp LB_82
LB_81:
	bts r12,2
LB_82:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_59
	btr r12,1
	jmp LB_60
LB_59:
	bts r12,1
LB_60:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_57
	btr r12,0
	jmp LB_58
LB_57:
	bts r12,0
LB_58:
	add rsp,24
; _f14 %_49 ⊢ %_52 : %_52
 ; {>  %_51~{ {  } }:{ { } } %_47~0':_r64 %_49~{ {  } {  } }:{ { } { } } %_48~1':_r64 %_50~{  }:{ } }
; _f14 { {  } {  } } ⊢ { {  } {  } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { {  } {  } } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_89
	btr QWORD [rdi],0
	jmp LB_90
LB_89:
	bts QWORD [rdi],0
LB_90:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_91
	btr QWORD [rdi],1
	jmp LB_92
LB_91:
	bts QWORD [rdi],1
LB_92:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_93
	btr r12,1
	jmp LB_94
LB_93:
	bts r12,1
LB_94:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_95
	btr r12,1
	jmp LB_96
LB_95:
	bts r12,1
LB_96:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_87
	btr r12,1
	jmp LB_88
LB_87:
	bts r12,1
LB_88:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_85
	btr r12,0
	jmp LB_86
LB_85:
	bts r12,0
LB_86:
	add rsp,24
; _f14 %_50 ⊢ %_53 : %_53
 ; {>  %_51~{ {  } }:{ { } } %_47~0':_r64 %_48~1':_r64 %_52~{ {  } {  } }:{ { } { } } %_50~{  }:{ } }
; _f14 {  } ⊢ {  }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn {  } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_99
	btr r12,1
	jmp LB_100
LB_99:
	bts r12,1
LB_100:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_97
	btr r12,0
	jmp LB_98
LB_97:
	bts r12,0
LB_98:
	add rsp,24
; _f14 %_51 ⊢ _(39) : _(39)
 ; {>  %_51~{ {  } }:{ { } } %_47~0':_r64 %_53~{  }:{ } %_48~1':_r64 %_52~{ {  } {  } }:{ { } { } } }
; _f14 { {  } } ⊢ { {  } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { {  } } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_105
	btr QWORD [rdi],0
	jmp LB_106
LB_105:
	bts QWORD [rdi],0
LB_106:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_107
	btr r12,1
	jmp LB_108
LB_107:
	bts r12,1
LB_108:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_103
	btr r12,1
	jmp LB_104
LB_103:
	bts r12,1
LB_104:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_101
	btr r12,0
	jmp LB_102
LB_101:
	bts r12,0
LB_102:
	add rsp,24
; _f14 %_47 ⊢ %_54 : %_54
 ; {>  %_47~0':_r64 %_53~{  }:{ } %_48~1':_r64 %_52~{ {  } {  } }:{ { } { } } }
; _f14 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_109
	btr r12,1
	jmp LB_110
LB_109:
	bts r12,1
LB_110:
	add rsp,16
; _f14 { %_54 %_48 } ⊢ %_55 : %_55
 ; {>  %_54~0':_r64 %_53~{  }:{ } %_48~1':_r64 %_52~{ {  } {  } }:{ { } { } } }
; _f14 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_111
	btr r12,2
	jmp LB_112
LB_111:
	bts r12,2
LB_112:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r15
	bt r12,2
	jc LB_115
	btr r12,3
	jmp LB_116
LB_115:
	bts r12,3
LB_116:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_113
	btr QWORD [rdi],0
	jmp LB_114
LB_113:
	bts QWORD [rdi],0
LB_114:
	mov r8,r14
	bt r12,1
	jc LB_119
	btr r12,3
	jmp LB_120
LB_119:
	bts r12,3
LB_120:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_117
	btr QWORD [rdi],1
	jmp LB_118
LB_117:
	bts QWORD [rdi],1
LB_118:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' }
	mov r15,r13
	bt r12,0
	jc LB_121
	btr r12,2
	jmp LB_122
LB_121:
	bts r12,2
LB_122:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_125
	btr r12,3
	jmp LB_126
LB_125:
	bts r12,3
LB_126:
	mov r13,r8
	bt r12,3
	jc LB_123
	btr r12,0
	jmp LB_124
LB_123:
	bts r12,0
LB_124:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_129
	btr r12,3
	jmp LB_130
LB_129:
	bts r12,3
LB_130:
	mov r14,r8
	bt r12,3
	jc LB_127
	btr r12,1
	jmp LB_128
LB_127:
	bts r12,1
LB_128:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_55~{ 0' 1' }:{ _r64 _r64 } %_53~{  }:{ } %_52~{ {  } {  } }:{ { } { } } }
; 	∎ {  }
	bt r12,0
	jc LB_131
	mov rdi,r13
	call dlt
LB_131:
	bt r12,1
	jc LB_132
	mov rdi,r14
	call dlt
LB_132:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_147:
NS_E_RDI_147:
; » 0xr89873 |~ {  } ⊢ %_133 : %_133
 ; {>  }
; 	» 0xr89873 _ ⊢ 0' : %_133
	mov rdi,0x89873
	mov r13,rdi
	bts r12,0
; » 0xrfff |~ {  } ⊢ %_134 : %_134
 ; {>  %_133~0':_r64 }
; 	» 0xrfff _ ⊢ 1' : %_134
	mov rdi,0xfff
	mov r14,rdi
	bts r12,1
; » 0xrafa |~ {  } ⊢ %_135 : %_135
 ; {>  %_133~0':_r64 %_134~1':_r64 }
; 	» 0xrafa _ ⊢ 2' : %_135
	mov rdi,0xafa
	mov r15,rdi
	bts r12,2
; _f26 { %_134 %_135 } ⊢ { %_136 %_137 } : { %_136 %_137 }
 ; {>  %_133~0':_r64 %_134~1':_r64 %_135~2':_r64 }
	add r14,r15
; _f14 { %_136 %_137 } ⊢ { %_138 %_139 } : { %_138 %_139 }
 ; {>  %_133~0':_r64 %_137~2':_r64 %_136~1':_r64 }
; _f14 { 1' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r14
	bt r12,1
	jc LB_152
	btr r12,3
	jmp LB_153
LB_152:
	bts r12,3
LB_153:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_150
	btr QWORD [rdi],0
	jmp LB_151
LB_150:
	bts QWORD [rdi],0
LB_151:
	mov r8,r15
	bt r12,2
	jc LB_156
	btr r12,3
	jmp LB_157
LB_156:
	bts r12,3
LB_157:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_154
	btr QWORD [rdi],1
	jmp LB_155
LB_154:
	bts QWORD [rdi],1
LB_155:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_160
	btr r12,3
	jmp LB_161
LB_160:
	bts r12,3
LB_161:
	mov r14,r8
	bt r12,3
	jc LB_158
	btr r12,1
	jmp LB_159
LB_158:
	bts r12,1
LB_159:
	mov rdi,r13
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_164
	btr r12,3
	jmp LB_165
LB_164:
	bts r12,3
LB_165:
	mov r15,r8
	bt r12,3
	jc LB_162
	btr r12,2
	jmp LB_163
LB_162:
	bts r12,2
LB_163:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_148
	btr r12,0
	jmp LB_149
LB_148:
	bts r12,0
LB_149:
	add rsp,16
; _f27 { %_133 %_138 } ⊢ { %_140 %_141 } : { %_140 %_141 }
 ; {>  %_133~0':_r64 %_138~1':_r64 %_139~2':_r64 }
	mov r13,r14
; _f28 %_140 ⊢ { %_142 %_143 } : { %_142 %_143 }
 ; {>  %_140~0':_r64 %_141~1':_r64 %_139~2':_r64 }
	mov r8,r13
; _f14 { %_142 %_141 %_143 } ⊢ { %_144 %_145 %_146 } : { %_144 %_145 %_146 }
 ; {>  %_142~0':_r64 %_143~3':_r64 %_141~1':_r64 %_139~2':_r64 }
; _f14 { 0' 1' 3' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 3' } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_168
	btr r12,2
	jmp LB_169
LB_168:
	bts r12,2
LB_169:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r15
	bt r12,2
	jc LB_172
	btr r12,4
	jmp LB_173
LB_172:
	bts r12,4
LB_173:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_170
	btr QWORD [rdi],0
	jmp LB_171
LB_170:
	bts QWORD [rdi],0
LB_171:
	mov r9,r14
	bt r12,1
	jc LB_176
	btr r12,4
	jmp LB_177
LB_176:
	bts r12,4
LB_177:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_174
	btr QWORD [rdi],1
	jmp LB_175
LB_174:
	bts QWORD [rdi],1
LB_175:
	mov r9,r8
	bt r12,3
	jc LB_180
	btr r12,4
	jmp LB_181
LB_180:
	bts r12,4
LB_181:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_178
	btr QWORD [rdi],2
	jmp LB_179
LB_178:
	bts QWORD [rdi],2
LB_179:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' 3' }
	mov r15,r13
	bt r12,0
	jc LB_182
	btr r12,2
	jmp LB_183
LB_182:
	bts r12,2
LB_183:
	mov rdi,r15
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_186
	btr r12,4
	jmp LB_187
LB_186:
	bts r12,4
LB_187:
	mov r13,r9
	bt r12,4
	jc LB_184
	btr r12,0
	jmp LB_185
LB_184:
	bts r12,0
LB_185:
	mov rdi,r15
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_190
	btr r12,4
	jmp LB_191
LB_190:
	bts r12,4
LB_191:
	mov r14,r9
	bt r12,4
	jc LB_188
	btr r12,1
	jmp LB_189
LB_188:
	bts r12,1
LB_189:
	mov rdi,r15
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_194
	btr r12,4
	jmp LB_195
LB_194:
	bts r12,4
LB_195:
	mov r8,r9
	bt r12,4
	jc LB_192
	btr r12,3
	jmp LB_193
LB_192:
	bts r12,3
LB_193:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r15,QWORD [rsp+8+8*0]
	bt QWORD [rsp],2
	jc LB_166
	btr r12,2
	jmp LB_167
LB_166:
	bts r12,2
LB_167:
	add rsp,16
; ∎ {  }
 ; {>  %_144~0':_r64 %_145~1':_r64 %_139~2':_r64 %_146~3':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_196
	mov rdi,r13
	call dlt
LB_196:
	bt r12,1
	jc LB_197
	mov rdi,r14
	call dlt
LB_197:
	bt r12,2
	jc LB_198
	mov rdi,r15
	call dlt
LB_198:
	bt r12,3
	jc LB_199
	mov rdi,r8
	call dlt
LB_199:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_40:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_40
	NS_E_DYN_44:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44
	NS_E_DYN_45:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45
	NS_E_DYN_46:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_46
	CST_DYN_56:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_147:
		dq 0x0001_0001_00_82_ffff
		dq 1
