%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_87
	mov QWORD [CST_DYN_87+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_87],rbx
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
NS_E_71:
NS_E_RDI_71:
NS_E_71_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_71_LB_0
	bt r11,7
	jc LB_72
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
LB_72:
	add rsi,1
	bt r11,6
	jc LB_73
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
LB_73:
	add rsi,1
	bt r11,5
	jc LB_74
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
LB_74:
	add rsi,1
	bt r11,5
	jc LB_74
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
NS_E_71_LB_0:
	mov rax,0
	ret
NS_E_75:
NS_E_RDI_75:
NS_E_75_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_75_LB_0
	cmp r11,57
	ja NS_E_75_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_75_LB_0:
	mov rax,0
	ret
NS_E_77:
NS_E_RDI_77:
NS_E_77_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_77_LB_0
	cmp r11,122
	ja NS_E_77_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_77_LB_0:
	mov rax,0
	ret
NS_E_76:
NS_E_RDI_76:
NS_E_76_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_76_LB_0
	cmp r11,90
	ja NS_E_76_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_76_LB_0:
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
NS_E_87:
NS_E_RDI_87:
; » 0xrff |~ {  } ⊢ %_78 : %_78
 ; {>  }
; 	» 0xrff _ ⊢ 0' : %_78
	mov rdi,0xff
	mov r13,rdi
	bts r12,0
; » 0xraa |~ {  } ⊢ %_79 : %_79
 ; {>  %_78~0':_r64 }
; 	» 0xraa _ ⊢ 1' : %_79
	mov rdi,0xaa
	mov r14,rdi
	bts r12,1
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { %_80 %_81 %_82 } : { %_80 %_81 %_82 }
 ; {>  %_79~1':_r64 %_78~0':_r64 }
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
	jc LB_94
	btr QWORD [rdi],0
	jmp LB_95
LB_94:
	bts QWORD [rdi],0
LB_95:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r15
	bt r12,2
	jc LB_96
	btr QWORD [rdi],1
	jmp LB_97
LB_96:
	bts QWORD [rdi],1
LB_97:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_92
	btr QWORD [rdi],0
	jmp LB_93
LB_92:
	bts QWORD [rdi],0
LB_93:
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
	jc LB_102
	btr QWORD [rdi],0
	jmp LB_103
LB_102:
	bts QWORD [rdi],0
LB_103:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_100
	btr QWORD [rdi],2
	jmp LB_101
LB_100:
	bts QWORD [rdi],2
LB_101:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { { {  } {  } } {  } { {  } } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_108
	btr r12,1
	jmp LB_109
LB_108:
	bts r12,1
LB_109:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_104
	btr r12,2
	jmp LB_105
LB_104:
	bts r12,2
LB_105:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_106
	btr r12,2
	jmp LB_107
LB_106:
	bts r12,2
LB_107:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_110
	btr r12,1
	jmp LB_111
LB_110:
	bts r12,1
LB_111:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_114
	btr r12,1
	jmp LB_115
LB_114:
	bts r12,1
LB_115:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_112
	btr r12,2
	jmp LB_113
LB_112:
	bts r12,2
LB_113:
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
	jc LB_90
	btr r12,1
	jmp LB_91
LB_90:
	bts r12,1
LB_91:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_88
	btr r12,0
	jmp LB_89
LB_88:
	bts r12,0
LB_89:
	add rsp,24
; _f14 %_80 ⊢ %_83 : %_83
 ; {>  %_80~{ {  } {  } }:{ { } { } } %_79~1':_r64 %_78~0':_r64 %_82~{ {  } }:{ { } } %_81~{  }:{ } }
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
	jc LB_120
	btr QWORD [rdi],0
	jmp LB_121
LB_120:
	bts QWORD [rdi],0
LB_121:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_122
	btr QWORD [rdi],1
	jmp LB_123
LB_122:
	bts QWORD [rdi],1
LB_123:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_124
	btr r12,1
	jmp LB_125
LB_124:
	bts r12,1
LB_125:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_126
	btr r12,1
	jmp LB_127
LB_126:
	bts r12,1
LB_127:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_118
	btr r12,1
	jmp LB_119
LB_118:
	bts r12,1
LB_119:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_116
	btr r12,0
	jmp LB_117
LB_116:
	bts r12,0
LB_117:
	add rsp,24
; _f14 %_81 ⊢ %_84 : %_84
 ; {>  %_79~1':_r64 %_83~{ {  } {  } }:{ { } { } } %_78~0':_r64 %_82~{ {  } }:{ { } } %_81~{  }:{ } }
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
	jc LB_130
	btr r12,1
	jmp LB_131
LB_130:
	bts r12,1
LB_131:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_128
	btr r12,0
	jmp LB_129
LB_128:
	bts r12,0
LB_129:
	add rsp,24
; _f14 %_82 ⊢ _(70) : _(70)
 ; {>  %_79~1':_r64 %_84~{  }:{ } %_83~{ {  } {  } }:{ { } { } } %_78~0':_r64 %_82~{ {  } }:{ { } } }
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
	jc LB_136
	btr QWORD [rdi],0
	jmp LB_137
LB_136:
	bts QWORD [rdi],0
LB_137:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_138
	btr r12,1
	jmp LB_139
LB_138:
	bts r12,1
LB_139:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_134
	btr r12,1
	jmp LB_135
LB_134:
	bts r12,1
LB_135:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_132
	btr r12,0
	jmp LB_133
LB_132:
	bts r12,0
LB_133:
	add rsp,24
; _f14 %_78 ⊢ %_85 : %_85
 ; {>  %_79~1':_r64 %_84~{  }:{ } %_83~{ {  } {  } }:{ { } { } } %_78~0':_r64 }
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
	jc LB_140
	btr r12,1
	jmp LB_141
LB_140:
	bts r12,1
LB_141:
	add rsp,16
; _f14 { %_85 %_79 } ⊢ %_86 : %_86
 ; {>  %_79~1':_r64 %_84~{  }:{ } %_83~{ {  } {  } }:{ { } { } } %_85~0':_r64 }
; _f14 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_142
	btr r12,2
	jmp LB_143
LB_142:
	bts r12,2
LB_143:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r15
	bt r12,2
	jc LB_146
	btr r12,3
	jmp LB_147
LB_146:
	bts r12,3
LB_147:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_144
	btr QWORD [rdi],0
	jmp LB_145
LB_144:
	bts QWORD [rdi],0
LB_145:
	mov r8,r14
	bt r12,1
	jc LB_150
	btr r12,3
	jmp LB_151
LB_150:
	bts r12,3
LB_151:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_148
	btr QWORD [rdi],1
	jmp LB_149
LB_148:
	bts QWORD [rdi],1
LB_149:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' }
	mov r15,r13
	bt r12,0
	jc LB_152
	btr r12,2
	jmp LB_153
LB_152:
	bts r12,2
LB_153:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_156
	btr r12,3
	jmp LB_157
LB_156:
	bts r12,3
LB_157:
	mov r13,r8
	bt r12,3
	jc LB_154
	btr r12,0
	jmp LB_155
LB_154:
	bts r12,0
LB_155:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
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
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_84~{  }:{ } %_83~{ {  } {  } }:{ { } { } } %_86~{ 0' 1' }:{ _r64 _r64 } }
; 	∎ {  }
	bt r12,0
	jc LB_162
	mov rdi,r13
	call dlt
LB_162:
	bt r12,1
	jc LB_163
	mov rdi,r14
	call dlt
LB_163:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_71:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_71
	NS_E_DYN_75:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_75
	NS_E_DYN_76:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_76
	NS_E_DYN_77:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_77
	CST_DYN_87:
		dq 0x0001_0001_00_82_ffff
		dq 1
