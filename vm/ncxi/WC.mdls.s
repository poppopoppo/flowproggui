%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_64
	call NS_E_158
	call NS_E_270
	call NS_E_289
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
NS_E_43:
NS_E_RDI_43:
NS_E_43_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_43_LB_0
	bt r11,7
	jc LB_44
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
LB_44:
	add rsi,1
	bt r11,6
	jc LB_45
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
LB_45:
	add rsi,1
	bt r11,5
	jc LB_46
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
LB_46:
	add rsi,1
	bt r11,5
	jc LB_46
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
NS_E_43_LB_0:
	mov rax,0
	ret
NS_E_47:
NS_E_RDI_47:
NS_E_47_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_47_LB_0
	cmp r11,57
	ja NS_E_47_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_47_LB_0:
	mov rax,0
	ret
NS_E_49:
NS_E_RDI_49:
NS_E_49_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_49_LB_0
	cmp r11,122
	ja NS_E_49_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_49_LB_0:
	mov rax,0
	ret
NS_E_48:
NS_E_RDI_48:
NS_E_48_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_48_LB_0
	cmp r11,90
	ja NS_E_48_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_48_LB_0:
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
NS_E_54:
; 	|» 0'
NS_E_RDI_54:
; _f28 %_50 ⊢ { %_51 %_52 } : { %_51 %_52 }
 ; {>  %_50~0':_r64 }
	mov r14,r13
; _f26 { %_51 %_52 } ⊢ { %_53 _(39) } : { %_53 _(39) }
 ; {>  %_51~0':_r64 %_52~1':_r64 }
	add r13,r14
; ∎ %_53
 ; {>  %_53~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
NS_E_64:
NS_E_RDI_64:
; » 0xrff |~ {  } ⊢ %_55 : %_55
 ; {>  }
; 	» 0xrff _ ⊢ 0' : %_55
	mov rdi,0xff
	mov r13,rdi
	bts r12,0
; » 0xraa |~ {  } ⊢ %_56 : %_56
 ; {>  %_55~0':_r64 }
; 	» 0xraa _ ⊢ 1' : %_56
	mov rdi,0xaa
	mov r14,rdi
	bts r12,1
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { %_57 %_58 %_59 } : { %_57 %_58 %_59 }
 ; {>  %_55~0':_r64 %_56~1':_r64 }
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
	jc LB_71
	btr QWORD [rdi],0
	jmp LB_72
LB_71:
	bts QWORD [rdi],0
LB_72:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r15
	bt r12,2
	jc LB_73
	btr QWORD [rdi],1
	jmp LB_74
LB_73:
	bts QWORD [rdi],1
LB_74:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_69
	btr QWORD [rdi],0
	jmp LB_70
LB_69:
	bts QWORD [rdi],0
LB_70:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_75
	btr QWORD [rdi],1
	jmp LB_76
LB_75:
	bts QWORD [rdi],1
LB_76:
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
	jc LB_79
	btr QWORD [rdi],0
	jmp LB_80
LB_79:
	bts QWORD [rdi],0
LB_80:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_77
	btr QWORD [rdi],2
	jmp LB_78
LB_77:
	bts QWORD [rdi],2
LB_78:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { { {  } {  } } {  } { {  } } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_85
	btr r12,1
	jmp LB_86
LB_85:
	bts r12,1
LB_86:
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
	mov r15,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_83
	btr r12,2
	jmp LB_84
LB_83:
	bts r12,2
LB_84:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_87
	btr r12,1
	jmp LB_88
LB_87:
	bts r12,1
LB_88:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_91
	btr r12,1
	jmp LB_92
LB_91:
	bts r12,1
LB_92:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_89
	btr r12,2
	jmp LB_90
LB_89:
	bts r12,2
LB_90:
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
	jc LB_67
	btr r12,1
	jmp LB_68
LB_67:
	bts r12,1
LB_68:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_65
	btr r12,0
	jmp LB_66
LB_65:
	bts r12,0
LB_66:
	add rsp,24
; _f14 %_57 ⊢ %_60 : %_60
 ; {>  %_55~0':_r64 %_59~{ {  } }:{ { } } %_58~{  }:{ } %_57~{ {  } {  } }:{ { } { } } %_56~1':_r64 }
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
	jc LB_97
	btr QWORD [rdi],0
	jmp LB_98
LB_97:
	bts QWORD [rdi],0
LB_98:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_99
	btr QWORD [rdi],1
	jmp LB_100
LB_99:
	bts QWORD [rdi],1
LB_100:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_101
	btr r12,1
	jmp LB_102
LB_101:
	bts r12,1
LB_102:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_103
	btr r12,1
	jmp LB_104
LB_103:
	bts r12,1
LB_104:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_95
	btr r12,1
	jmp LB_96
LB_95:
	bts r12,1
LB_96:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_93
	btr r12,0
	jmp LB_94
LB_93:
	bts r12,0
LB_94:
	add rsp,24
; _f14 %_58 ⊢ %_61 : %_61
 ; {>  %_55~0':_r64 %_60~{ {  } {  } }:{ { } { } } %_59~{ {  } }:{ { } } %_58~{  }:{ } %_56~1':_r64 }
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
	jc LB_107
	btr r12,1
	jmp LB_108
LB_107:
	bts r12,1
LB_108:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_105
	btr r12,0
	jmp LB_106
LB_105:
	bts r12,0
LB_106:
	add rsp,24
; _f14 %_59 ⊢ _(40) : _(40)
 ; {>  %_55~0':_r64 %_60~{ {  } {  } }:{ { } { } } %_59~{ {  } }:{ { } } %_61~{  }:{ } %_56~1':_r64 }
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
	jc LB_113
	btr QWORD [rdi],0
	jmp LB_114
LB_113:
	bts QWORD [rdi],0
LB_114:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_115
	btr r12,1
	jmp LB_116
LB_115:
	bts r12,1
LB_116:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_111
	btr r12,1
	jmp LB_112
LB_111:
	bts r12,1
LB_112:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_109
	btr r12,0
	jmp LB_110
LB_109:
	bts r12,0
LB_110:
	add rsp,24
; _f14 %_55 ⊢ %_62 : %_62
 ; {>  %_55~0':_r64 %_60~{ {  } {  } }:{ { } { } } %_61~{  }:{ } %_56~1':_r64 }
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
	jc LB_117
	btr r12,1
	jmp LB_118
LB_117:
	bts r12,1
LB_118:
	add rsp,16
; _f14 { %_62 %_56 } ⊢ %_63 : %_63
 ; {>  %_62~0':_r64 %_60~{ {  } {  } }:{ { } { } } %_61~{  }:{ } %_56~1':_r64 }
; _f14 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_119
	btr r12,2
	jmp LB_120
LB_119:
	bts r12,2
LB_120:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r15
	bt r12,2
	jc LB_123
	btr r12,3
	jmp LB_124
LB_123:
	bts r12,3
LB_124:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_121
	btr QWORD [rdi],0
	jmp LB_122
LB_121:
	bts QWORD [rdi],0
LB_122:
	mov r8,r14
	bt r12,1
	jc LB_127
	btr r12,3
	jmp LB_128
LB_127:
	bts r12,3
LB_128:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_125
	btr QWORD [rdi],1
	jmp LB_126
LB_125:
	bts QWORD [rdi],1
LB_126:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' }
	mov r15,r13
	bt r12,0
	jc LB_129
	btr r12,2
	jmp LB_130
LB_129:
	bts r12,2
LB_130:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_133
	btr r12,3
	jmp LB_134
LB_133:
	bts r12,3
LB_134:
	mov r13,r8
	bt r12,3
	jc LB_131
	btr r12,0
	jmp LB_132
LB_131:
	bts r12,0
LB_132:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_137
	btr r12,3
	jmp LB_138
LB_137:
	bts r12,3
LB_138:
	mov r14,r8
	bt r12,3
	jc LB_135
	btr r12,1
	jmp LB_136
LB_135:
	bts r12,1
LB_136:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_60~{ {  } {  } }:{ { } { } } %_61~{  }:{ } %_63~{ 0' 1' }:{ _r64 _r64 } }
; 	∎ {  }
	bt r12,0
	jc LB_139
	mov rdi,r13
	call dlt
LB_139:
	bt r12,1
	jc LB_140
	mov rdi,r14
	call dlt
LB_140:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_158:
NS_E_RDI_158:
; » 0xr89873 |~ {  } ⊢ %_141 : %_141
 ; {>  }
; 	» 0xr89873 _ ⊢ 0' : %_141
	mov rdi,0x89873
	mov r13,rdi
	bts r12,0
; » 0xrfff |~ {  } ⊢ %_142 : %_142
 ; {>  %_141~0':_r64 }
; 	» 0xrfff _ ⊢ 1' : %_142
	mov rdi,0xfff
	mov r14,rdi
	bts r12,1
; » 0xrafa |~ {  } ⊢ %_143 : %_143
 ; {>  %_142~1':_r64 %_141~0':_r64 }
; 	» 0xrafa _ ⊢ 2' : %_143
	mov rdi,0xafa
	mov r15,rdi
	bts r12,2
; _f26 { %_142 %_143 } ⊢ { %_144 %_145 } : { %_144 %_145 }
 ; {>  %_142~1':_r64 %_143~2':_r64 %_141~0':_r64 }
	add r14,r15
; _f14 { %_144 %_145 } ⊢ { %_146 %_147 } : { %_146 %_147 }
 ; {>  %_144~1':_r64 %_145~2':_r64 %_141~0':_r64 }
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
	jc LB_163
	btr r12,3
	jmp LB_164
LB_163:
	bts r12,3
LB_164:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_161
	btr QWORD [rdi],0
	jmp LB_162
LB_161:
	bts QWORD [rdi],0
LB_162:
	mov r8,r15
	bt r12,2
	jc LB_167
	btr r12,3
	jmp LB_168
LB_167:
	bts r12,3
LB_168:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_165
	btr QWORD [rdi],1
	jmp LB_166
LB_165:
	bts QWORD [rdi],1
LB_166:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_171
	btr r12,3
	jmp LB_172
LB_171:
	bts r12,3
LB_172:
	mov r14,r8
	bt r12,3
	jc LB_169
	btr r12,1
	jmp LB_170
LB_169:
	bts r12,1
LB_170:
	mov rdi,r13
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_175
	btr r12,3
	jmp LB_176
LB_175:
	bts r12,3
LB_176:
	mov r15,r8
	bt r12,3
	jc LB_173
	btr r12,2
	jmp LB_174
LB_173:
	bts r12,2
LB_174:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_159
	btr r12,0
	jmp LB_160
LB_159:
	bts r12,0
LB_160:
	add rsp,16
; _f27 { %_141 %_146 } ⊢ { %_148 %_149 } : { %_148 %_149 }
 ; {>  %_141~0':_r64 %_147~2':_r64 %_146~1':_r64 }
	mov r13,r14
; _f28 %_148 ⊢ { %_150 _(41) } : { %_150 _(41) }
 ; {>  %_149~1':_r64 %_148~0':_r64 %_147~2':_r64 }
	mov r8,r13
; » 0xr1 |~ {  } ⊢ %_151 : %_151
 ; {>  %_149~1':_r64 %_150~0':_r64 %_147~2':_r64 }
; 	» 0xr1 _ ⊢ 3' : %_151
	mov rdi,0x1
	mov r8,rdi
	bts r12,3
; _f54 %_151 ⊢ %_152 : %_152
 ; {>  %_151~3':_r64 %_149~1':_r64 %_150~0':_r64 %_147~2':_r64 }
; _f54 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_183
	btr r12,0
	jmp LB_184
LB_183:
	bts r12,0
LB_184:
	call NS_E_54
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_185
	btr r12,3
	jmp LB_186
LB_185:
	bts r12,3
LB_186:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_181
	btr r12,2
	jmp LB_182
LB_181:
	bts r12,2
LB_182:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_179
	btr r12,1
	jmp LB_180
LB_179:
	bts r12,1
LB_180:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_177
	btr r12,0
	jmp LB_178
LB_177:
	bts r12,0
LB_178:
	add rsp,32
; _f54 %_152 ⊢ %_153 : %_153
 ; {>  %_152~3':_r64 %_149~1':_r64 %_150~0':_r64 %_147~2':_r64 }
; _f54 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_193
	btr r12,0
	jmp LB_194
LB_193:
	bts r12,0
LB_194:
	call NS_E_54
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_195
	btr r12,3
	jmp LB_196
LB_195:
	bts r12,3
LB_196:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_191
	btr r12,2
	jmp LB_192
LB_191:
	bts r12,2
LB_192:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_189
	btr r12,1
	jmp LB_190
LB_189:
	bts r12,1
LB_190:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_187
	btr r12,0
	jmp LB_188
LB_187:
	bts r12,0
LB_188:
	add rsp,32
; _f14 { %_150 %_149 %_153 } ⊢ { %_154 %_155 %_156 } : { %_154 %_155 %_156 }
 ; {>  %_149~1':_r64 %_150~0':_r64 %_147~2':_r64 %_153~3':_r64 }
; _f14 { 0' 1' 3' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 3' } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_199
	btr r12,2
	jmp LB_200
LB_199:
	bts r12,2
LB_200:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r15
	bt r12,2
	jc LB_203
	btr r12,4
	jmp LB_204
LB_203:
	bts r12,4
LB_204:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_201
	btr QWORD [rdi],0
	jmp LB_202
LB_201:
	bts QWORD [rdi],0
LB_202:
	mov r9,r14
	bt r12,1
	jc LB_207
	btr r12,4
	jmp LB_208
LB_207:
	bts r12,4
LB_208:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_205
	btr QWORD [rdi],1
	jmp LB_206
LB_205:
	bts QWORD [rdi],1
LB_206:
	mov r9,r8
	bt r12,3
	jc LB_211
	btr r12,4
	jmp LB_212
LB_211:
	bts r12,4
LB_212:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_209
	btr QWORD [rdi],2
	jmp LB_210
LB_209:
	bts QWORD [rdi],2
LB_210:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' 3' }
	mov r15,r13
	bt r12,0
	jc LB_213
	btr r12,2
	jmp LB_214
LB_213:
	bts r12,2
LB_214:
	mov rdi,r15
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_217
	btr r12,4
	jmp LB_218
LB_217:
	bts r12,4
LB_218:
	mov r13,r9
	bt r12,4
	jc LB_215
	btr r12,0
	jmp LB_216
LB_215:
	bts r12,0
LB_216:
	mov rdi,r15
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_221
	btr r12,4
	jmp LB_222
LB_221:
	bts r12,4
LB_222:
	mov r14,r9
	bt r12,4
	jc LB_219
	btr r12,1
	jmp LB_220
LB_219:
	bts r12,1
LB_220:
	mov rdi,r15
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_225
	btr r12,4
	jmp LB_226
LB_225:
	bts r12,4
LB_226:
	mov r8,r9
	bt r12,4
	jc LB_223
	btr r12,3
	jmp LB_224
LB_223:
	bts r12,3
LB_224:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r15,QWORD [rsp+8+8*0]
	bt QWORD [rsp],2
	jc LB_197
	btr r12,2
	jmp LB_198
LB_197:
	bts r12,2
LB_198:
	add rsp,16
; 	» "Hello World !!" _ ⊢ 4' : %_157
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,14
	call mlc_s8
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	mov rdi,rax
	mov rax,0x_6f_57_20_6f_6c_6c_65_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_21_21_20_64_6c_72
	mov QWORD [rdi+8*1+8*1],rax
	mov r9,rdi
	btr r12,4
; _f14 { %_157 %_154 { %_155 } } ⊢ _(42) : _(42)
 ; {>  %_157~4':_stg %_156~3':_r64 %_154~0':_r64 %_155~1':_r64 %_147~2':_r64 }
; _f14 { 4' 0' { 1' } } ⊢ { 0' 1' { 4' } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r15
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 0' { 1' } } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_231
	btr r12,2
	jmp LB_232
LB_231:
	bts r12,2
LB_232:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r9
	bt r12,4
	jc LB_235
	btr r12,3
	jmp LB_236
LB_235:
	bts r12,3
LB_236:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_233
	btr QWORD [rdi],0
	jmp LB_234
LB_233:
	bts QWORD [rdi],0
LB_234:
	mov r8,r15
	bt r12,2
	jc LB_239
	btr r12,3
	jmp LB_240
LB_239:
	bts r12,3
LB_240:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_237
	btr QWORD [rdi],1
	jmp LB_238
LB_237:
	bts QWORD [rdi],1
LB_238:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,3
	mov r15,r14
	bt r12,1
	jc LB_245
	btr r12,2
	jmp LB_246
LB_245:
	bts r12,2
LB_246:
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r15
	bt r12,2
	jc LB_243
	btr QWORD [rdi],0
	jmp LB_244
LB_243:
	bts QWORD [rdi],0
LB_244:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,3
	jc LB_241
	btr QWORD [rdi],2
	jmp LB_242
LB_241:
	bts QWORD [rdi],2
LB_242:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' { 4' } }
	mov r15,r13
	bt r12,0
	jc LB_247
	btr r12,2
	jmp LB_248
LB_247:
	bts r12,2
LB_248:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_251
	btr r12,3
	jmp LB_252
LB_251:
	bts r12,3
LB_252:
	mov r13,r8
	bt r12,3
	jc LB_249
	btr r12,0
	jmp LB_250
LB_249:
	bts r12,0
LB_250:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_255
	btr r12,3
	jmp LB_256
LB_255:
	bts r12,3
LB_256:
	mov r14,r8
	bt r12,3
	jc LB_253
	btr r12,1
	jmp LB_254
LB_253:
	bts r12,1
LB_254:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_261
	btr r12,3
	jmp LB_262
LB_261:
	bts r12,3
LB_262:
	mov rdi,r8
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_259
	btr r12,5
	jmp LB_260
LB_259:
	bts r12,5
LB_260:
	mov r9,r10
	bt r12,5
	jc LB_257
	btr r12,4
	jmp LB_258
LB_257:
	bts r12,4
LB_258:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD [rsp],3
	jc LB_229
	btr r12,3
	jmp LB_230
LB_229:
	bts r12,3
LB_230:
	mov r15,QWORD [rsp+8+8*0]
	bt QWORD [rsp],2
	jc LB_227
	btr r12,2
	jmp LB_228
LB_227:
	bts r12,2
LB_228:
	add rsp,24
; ∎ {  }
 ; {>  %_156~3':_r64 %_147~2':_r64 }
; 	∎ {  }
	bt r12,3
	jc LB_263
	mov rdi,r8
	call dlt
LB_263:
	bt r12,2
	jc LB_264
	mov rdi,r15
	call dlt
LB_264:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_270:
NS_E_RDI_270:
; _none {  } ⊢ %_265 : %_265
 ; {>  }
; _none {  } ⊢ 0◂{  }
	mov r13,1
	bts r12,0
; _some %_265 ⊢ %_266 : %_266
 ; {>  %_265~0◂{  }:(_opn)◂(t92'(0)) }
; _some 0◂{  } ⊢ 1◂0◂{  }
	mov r14,0
	bts r12,1
; _nil {  } ⊢ %_267 : %_267
 ; {>  %_266~1◂0◂{  }:(_opn)◂((_opn)◂(t95'(0))) }
; _nil {  } ⊢ 2◂{  }
	mov r15,1
	bts r12,2
; _cns { %_266 %_267 } ⊢ %_268 : %_268
 ; {>  %_267~2◂{  }:(_lst)◂(t97'(0)) %_266~1◂0◂{  }:(_opn)◂((_opn)◂(t95'(0))) }
; _cns { 1◂0◂{  } 2◂{  } } ⊢ 3◂{ 1◂0◂{  } 2◂{  } }
	mov r8,0
	bts r12,3
; _f14 %_268 ⊢ %_269 : %_269
 ; {>  %_268~3◂{ 1◂0◂{  } 2◂{  } }:(_lst)◂((_opn)◂((_opn)◂(t100'(0)))) }
; _f14 3◂{ 1◂0◂{  } 2◂{  } } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3◂{ 1◂0◂{  } 2◂{  } } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_271
	btr r12,4
	jmp LB_272
LB_271:
	bts r12,4
LB_272:
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
	mov r10,rax
	btr r12,5
	mov rsi,0
	bt r12,5
	jc LB_279
	bts rsi,17
	bt r10,0
	jc LB_279
	jmp LB_280
LB_279:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,5
LB_280:
	mov rax,r9
	shl rax,56
	or rax,1
	mov rdi,rax
	or r10,rdi
	mov rsi,0
	bt r12,5
	jc LB_277
	bts rsi,17
	bt r10,0
	jc LB_277
	jmp LB_278
LB_277:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,5
LB_278:
	mov rax,r14
	shl rax,56
	or rax,1
	mov rdi,rax
	or r10,rdi
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,5
	jc LB_275
	btr QWORD [rdi],0
	jmp LB_276
LB_275:
	bts QWORD [rdi],0
LB_276:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,5
	mov rsi,0
	bt r12,5
	jc LB_283
	bts rsi,17
	bt r10,0
	jc LB_283
	jmp LB_284
LB_283:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,5
LB_284:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r10,rdi
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,5
	jc LB_281
	btr QWORD [rdi],1
	jmp LB_282
LB_281:
	bts QWORD [rdi],1
LB_282:
	mov rsi,0
	bt r12,0
	jc LB_273
	bts rsi,17
	bt r13,0
	jc LB_273
	jmp LB_274
LB_273:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_274:
	mov rax,r8
	shl rax,56
	or rax,1
	mov rdi,rax
	or r13,rdi
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_269~0':(_lst)◂((_opn)◂((_opn)◂(t104'(0)))) }
; 	∎ {  }
	bt r12,0
	jc LB_285
	mov rdi,r13
	call dlt
LB_285:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_289:
NS_E_RDI_289:
; » 0xraa |~ {  } ⊢ %_286 : %_286
 ; {>  }
; 	» 0xraa _ ⊢ 0' : %_286
	mov rdi,0xaa
	mov r13,rdi
	bts r12,0
; /0
; mtc x 0section .data
	NS_E_DYN_43:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43
	NS_E_DYN_47:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47
	NS_E_DYN_48:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48
	NS_E_DYN_49:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49
	NS_E_DYN_54:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54
	CST_DYN_64:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_158:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_270:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_289:
		dq 0x0001_0001_00_82_ffff
		dq 1
