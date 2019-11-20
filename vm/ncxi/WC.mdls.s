%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_63
	call NS_E_158
	call NS_E_248
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
NS_E_42:
NS_E_RDI_42:
NS_E_42_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_42_LB_0
	bt r11,7
	jc LB_43
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
LB_43:
	add rsi,1
	bt r11,6
	jc LB_44
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
LB_44:
	add rsi,1
	bt r11,5
	jc LB_45
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
LB_45:
	add rsi,1
	bt r11,5
	jc LB_45
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
NS_E_42_LB_0:
	mov rax,0
	ret
NS_E_46:
NS_E_RDI_46:
NS_E_46_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_46_LB_0
	cmp r11,57
	ja NS_E_46_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_46_LB_0:
	mov rax,0
	ret
NS_E_48:
NS_E_RDI_48:
NS_E_48_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_48_LB_0
	cmp r11,122
	ja NS_E_48_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_48_LB_0:
	mov rax,0
	ret
NS_E_47:
NS_E_RDI_47:
NS_E_47_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_47_LB_0
	cmp r11,90
	ja NS_E_47_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_47_LB_0:
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
NS_E_53:
; 	|» 0'
NS_E_RDI_53:
; _f28 %_49 ⊢ { %_50 %_51 } : { %_50 %_51 }
 ; {>  %_49~0':_r64 }
	mov r14,r13
; _f26 { %_50 %_51 } ⊢ { %_52 _(39) } : { %_52 _(39) }
 ; {>  %_51~1':_r64 %_50~0':_r64 }
	add r13,r14
; ∎ %_52
 ; {>  %_52~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
NS_E_63:
NS_E_RDI_63:
; » 0xrff |~ {  } ⊢ %_54 : %_54
 ; {>  }
; 	» 0xrff _ ⊢ 0' : %_54
	mov rdi,0xff
	mov r13,rdi
	bts r12,0
; » 0xraa |~ {  } ⊢ %_55 : %_55
 ; {>  %_54~0':_r64 }
; 	» 0xraa _ ⊢ 1' : %_55
	mov rdi,0xaa
	mov r14,rdi
	bts r12,1
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { %_56 %_57 %_58 } : { %_56 %_57 %_58 }
 ; {>  %_55~1':_r64 %_54~0':_r64 }
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
	jc LB_70
	btr QWORD [rdi],0
	jmp LB_71
LB_70:
	bts QWORD [rdi],0
LB_71:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r15
	bt r12,2
	jc LB_72
	btr QWORD [rdi],1
	jmp LB_73
LB_72:
	bts QWORD [rdi],1
LB_73:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_68
	btr QWORD [rdi],0
	jmp LB_69
LB_68:
	bts QWORD [rdi],0
LB_69:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_74
	btr QWORD [rdi],1
	jmp LB_75
LB_74:
	bts QWORD [rdi],1
LB_75:
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
	jc LB_78
	btr QWORD [rdi],0
	jmp LB_79
LB_78:
	bts QWORD [rdi],0
LB_79:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_76
	btr QWORD [rdi],2
	jmp LB_77
LB_76:
	bts QWORD [rdi],2
LB_77:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { { {  } {  } } {  } { {  } } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_84
	btr r12,1
	jmp LB_85
LB_84:
	bts r12,1
LB_85:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_80
	btr r12,2
	jmp LB_81
LB_80:
	bts r12,2
LB_81:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_82
	btr r12,2
	jmp LB_83
LB_82:
	bts r12,2
LB_83:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_86
	btr r12,1
	jmp LB_87
LB_86:
	bts r12,1
LB_87:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_90
	btr r12,1
	jmp LB_91
LB_90:
	bts r12,1
LB_91:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_88
	btr r12,2
	jmp LB_89
LB_88:
	bts r12,2
LB_89:
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
	jc LB_66
	btr r12,1
	jmp LB_67
LB_66:
	bts r12,1
LB_67:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_64
	btr r12,0
	jmp LB_65
LB_64:
	bts r12,0
LB_65:
	add rsp,24
; _f14 %_56 ⊢ %_59 : %_59
 ; {>  %_55~1':_r64 %_54~0':_r64 %_58~{ {  } }:{ { } } %_57~{  }:{ } %_56~{ {  } {  } }:{ { } { } } }
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
	jc LB_96
	btr QWORD [rdi],0
	jmp LB_97
LB_96:
	bts QWORD [rdi],0
LB_97:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_98
	btr QWORD [rdi],1
	jmp LB_99
LB_98:
	bts QWORD [rdi],1
LB_99:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_100
	btr r12,1
	jmp LB_101
LB_100:
	bts r12,1
LB_101:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_102
	btr r12,1
	jmp LB_103
LB_102:
	bts r12,1
LB_103:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_94
	btr r12,1
	jmp LB_95
LB_94:
	bts r12,1
LB_95:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_92
	btr r12,0
	jmp LB_93
LB_92:
	bts r12,0
LB_93:
	add rsp,24
; _f14 %_57 ⊢ %_60 : %_60
 ; {>  %_55~1':_r64 %_54~0':_r64 %_59~{ {  } {  } }:{ { } { } } %_58~{ {  } }:{ { } } %_57~{  }:{ } }
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
	jc LB_106
	btr r12,1
	jmp LB_107
LB_106:
	bts r12,1
LB_107:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_104
	btr r12,0
	jmp LB_105
LB_104:
	bts r12,0
LB_105:
	add rsp,24
; _f14 %_58 ⊢ _(40) : _(40)
 ; {>  %_55~1':_r64 %_60~{  }:{ } %_54~0':_r64 %_59~{ {  } {  } }:{ { } { } } %_58~{ {  } }:{ { } } }
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
	jc LB_112
	btr QWORD [rdi],0
	jmp LB_113
LB_112:
	bts QWORD [rdi],0
LB_113:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_114
	btr r12,1
	jmp LB_115
LB_114:
	bts r12,1
LB_115:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_110
	btr r12,1
	jmp LB_111
LB_110:
	bts r12,1
LB_111:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_108
	btr r12,0
	jmp LB_109
LB_108:
	bts r12,0
LB_109:
	add rsp,24
; _f14 %_54 ⊢ %_61 : %_61
 ; {>  %_55~1':_r64 %_60~{  }:{ } %_54~0':_r64 %_59~{ {  } {  } }:{ { } { } } }
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
	jc LB_116
	btr r12,1
	jmp LB_117
LB_116:
	bts r12,1
LB_117:
	add rsp,16
; _f14 { %_61 %_55 } ⊢ %_62 : %_62
 ; {>  %_55~1':_r64 %_60~{  }:{ } %_59~{ {  } {  } }:{ { } { } } %_61~0':_r64 }
; _f14 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_118
	btr r12,2
	jmp LB_119
LB_118:
	bts r12,2
LB_119:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r15
	bt r12,2
	jc LB_122
	btr r12,3
	jmp LB_123
LB_122:
	bts r12,3
LB_123:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_120
	btr QWORD [rdi],0
	jmp LB_121
LB_120:
	bts QWORD [rdi],0
LB_121:
	mov r8,r14
	bt r12,1
	jc LB_126
	btr r12,3
	jmp LB_127
LB_126:
	bts r12,3
LB_127:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_124
	btr QWORD [rdi],1
	jmp LB_125
LB_124:
	bts QWORD [rdi],1
LB_125:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' }
	mov r15,r13
	bt r12,0
	jc LB_128
	btr r12,2
	jmp LB_129
LB_128:
	bts r12,2
LB_129:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_132
	btr r12,3
	jmp LB_133
LB_132:
	bts r12,3
LB_133:
	mov r13,r8
	bt r12,3
	jc LB_130
	btr r12,0
	jmp LB_131
LB_130:
	bts r12,0
LB_131:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_136
	btr r12,3
	jmp LB_137
LB_136:
	bts r12,3
LB_137:
	mov r14,r8
	bt r12,3
	jc LB_134
	btr r12,1
	jmp LB_135
LB_134:
	bts r12,1
LB_135:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_62~{ 0' 1' }:{ _r64 _r64 } %_60~{  }:{ } %_59~{ {  } {  } }:{ { } { } } }
; 	∎ {  }
	bt r12,0
	jc LB_138
	mov rdi,r13
	call dlt
LB_138:
	bt r12,1
	jc LB_139
	mov rdi,r14
	call dlt
LB_139:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_158:
NS_E_RDI_158:
; » 0xr89873 |~ {  } ⊢ %_140 : %_140
 ; {>  }
; 	» 0xr89873 _ ⊢ 0' : %_140
	mov rdi,0x89873
	mov r13,rdi
	bts r12,0
; » 0xrfff |~ {  } ⊢ %_141 : %_141
 ; {>  %_140~0':_r64 }
; 	» 0xrfff _ ⊢ 1' : %_141
	mov rdi,0xfff
	mov r14,rdi
	bts r12,1
; » 0xrafa |~ {  } ⊢ %_142 : %_142
 ; {>  %_140~0':_r64 %_141~1':_r64 }
; 	» 0xrafa _ ⊢ 2' : %_142
	mov rdi,0xafa
	mov r15,rdi
	bts r12,2
; _f26 { %_141 %_142 } ⊢ { %_143 %_144 } : { %_143 %_144 }
 ; {>  %_142~2':_r64 %_140~0':_r64 %_141~1':_r64 }
	add r14,r15
; _f14 { %_143 %_144 } ⊢ { %_145 %_146 } : { %_145 %_146 }
 ; {>  %_144~2':_r64 %_140~0':_r64 %_143~1':_r64 }
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
; _f27 { %_140 %_145 } ⊢ { %_147 %_148 } : { %_147 %_148 }
 ; {>  %_140~0':_r64 %_145~1':_r64 %_146~2':_r64 }
	mov r13,r14
; _f28 %_147 ⊢ { %_149 _(41) } : { %_149 _(41) }
 ; {>  %_148~1':_r64 %_147~0':_r64 %_146~2':_r64 }
	mov r8,r13
; » 0xr1 |~ {  } ⊢ %_150 : %_150
 ; {>  %_149~0':_r64 %_148~1':_r64 %_146~2':_r64 }
; 	» 0xr1 _ ⊢ 3' : %_150
	mov rdi,0x1
	mov r8,rdi
	bts r12,3
; _f53 %_150 ⊢ %_151 : %_151
 ; {>  %_149~0':_r64 %_148~1':_r64 %_150~3':_r64 %_146~2':_r64 }
; _f53 3' ⊢ 3'
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
	call NS_E_53
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
; _f53 %_151 ⊢ %_152 : %_152
 ; {>  %_151~3':_r64 %_149~0':_r64 %_148~1':_r64 %_146~2':_r64 }
; _f53 3' ⊢ 3'
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
	call NS_E_53
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
; _f14 { %_149 %_148 %_152 } ⊢ { %_153 %_154 %_155 } : { %_153 %_154 %_155 }
 ; {>  %_152~3':_r64 %_149~0':_r64 %_148~1':_r64 %_146~2':_r64 }
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
; 	» "Hello World !!" _ ⊢ 4' : %_156
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
; _f14 %_156 ⊢ %_157 : %_157
 ; {>  %_156~4':_stg %_154~1':_r64 %_155~3':_r64 %_153~0':_r64 %_146~2':_r64 }
; _f14 4' ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 4' ⊢ 0'
	mov r13,r9
	bt r12,4
	jc LB_235
	btr r12,0
	jmp LB_236
LB_235:
	bts r12,0
LB_236:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_237
	btr r12,4
	jmp LB_238
LB_237:
	bts r12,4
LB_238:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_233
	btr r12,3
	jmp LB_234
LB_233:
	bts r12,3
LB_234:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_231
	btr r12,2
	jmp LB_232
LB_231:
	bts r12,2
LB_232:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_229
	btr r12,1
	jmp LB_230
LB_229:
	bts r12,1
LB_230:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_227
	btr r12,0
	jmp LB_228
LB_227:
	bts r12,0
LB_228:
	add rsp,40
; ∎ {  }
 ; {>  %_157~4':_stg %_154~1':_r64 %_155~3':_r64 %_153~0':_r64 %_146~2':_r64 }
; 	∎ {  }
	bt r12,4
	jc LB_239
	mov rdi,r9
	call dlt
LB_239:
	bt r12,1
	jc LB_240
	mov rdi,r14
	call dlt
LB_240:
	bt r12,3
	jc LB_241
	mov rdi,r8
	call dlt
LB_241:
	bt r12,0
	jc LB_242
	mov rdi,r13
	call dlt
LB_242:
	bt r12,2
	jc LB_243
	mov rdi,r15
	call dlt
LB_243:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_248:
NS_E_RDI_248:
; _none {  } ⊢ %_244 : %_244
 ; {>  }
; _none {  } ⊢ 0◂{  }
	mov r13,1
	bts r12,0
; _f14 %_244 ⊢ %_245 : %_245
 ; {>  %_244~0◂{  }:(_opn)◂(t90'(0)) }
; _f14 0◂{  } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0◂{  } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_249
	btr r12,1
	jmp LB_250
LB_249:
	bts r12,1
LB_250:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	bt r12,0
	jnc LB_251
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_0001
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_251:
	mov rdi,0x0100_0000_0000_0001
	add r13,rdi
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; 	» "Hoo Baa" _ ⊢ 1' : %_246
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,7
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
	mov rax,0x_00_61_61_42_20_6f_6f_48
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f14 %_246 ⊢ %_247 : %_247
 ; {>  %_246~1':_stg %_245~0':(_opn)◂(t93'(0)) }
; _f14 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_254
	btr r12,0
	jmp LB_255
LB_254:
	bts r12,0
LB_255:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_256
	btr r12,1
	jmp LB_257
LB_256:
	bts r12,1
LB_257:
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_252
	btr r12,0
	jmp LB_253
LB_252:
	bts r12,0
LB_253:
	add rsp,16
; ∎ {  }
 ; {>  %_245~0':(_opn)◂(t93'(0)) %_247~1':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_258
	mov rdi,r13
	call dlt
LB_258:
	bt r12,1
	jc LB_259
	mov rdi,r14
	call dlt
LB_259:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_42:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_42
	NS_E_DYN_46:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_46
	NS_E_DYN_47:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47
	NS_E_DYN_48:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48
	NS_E_DYN_53:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_53
	CST_DYN_63:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_158:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_248:
		dq 0x0001_0001_00_82_ffff
		dq 1
