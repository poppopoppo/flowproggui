%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
pop r14 ; number of args
  pop rdi ; program name
  call mk_s8
    mov r13,rbx
    mov rbx,[rbx]
    mov rsi,r13
    or rsi,1
    mov [args],rsi
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
  args_lp:
    cmp r14,1
    jz args_end
    pop rdi
  call mk_s8
    mov r8,rbx
    mov rbx,[rbx]
    mov r9,r8
    or r9,1
    mov [r13+16],r9
    mov r13,r8
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
    sub r14,1
    jmp args_lp
  args_end:
    mov r8,rbx
    mov rbx,[rbx]
    mov rcx,0x0000_0000_0000_ffff
    mov [r8],rcx
    mov rcx,0x0100_0000_0000_0001
    or r8,rcx
    mov [r13+16],r8
	call NS_E_103
	call exec_out
	jmp _end
NS_E_ID_36: dq 0
NS_E_36:
NS_E_RDI_36:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_38: dq 0
NS_E_38:
NS_E_RDI_38:
	mov rdi,fmt_emt
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rdi,r13
	bt r12,0
	call pp0
	mov rdi,fmt_nl
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	ret
NS_E_67:
NS_E_RDI_67:
NS_E_67_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_68
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_68:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_70:
NS_E_RDI_70:
NS_E_70_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_70_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_70_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_71:
NS_E_RDI_71:
NS_E_71_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_71_LB_0
	cmp r11,57
	ja NS_E_71_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_71_LB_0:
	mov rax,0
	ret
NS_E_73:
NS_E_RDI_73:
NS_E_73_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_73_LB_0
	cmp r11,122
	ja NS_E_73_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_73_LB_0:
	mov rax,0
	ret
NS_E_72:
NS_E_RDI_72:
NS_E_72_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_72_LB_0
	cmp r11,90
	ja NS_E_72_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_72_LB_0:
	mov rax,0
	ret
NS_E_45:
	mov rdi,r13
	bt r12,0
NS_E_RDI_45:
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
NS_E_ID_59: dq 0
NS_E_59:
NS_E_RDI_59:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_79
	bt QWORD [rdi],17
	jnc LB_79
	bt QWORD [rdi],0
	jc LB_81
	btr r12,2
	clc
	jmp LB_82
LB_81:
	bts r12,2
	stc
LB_82:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_80
LB_79:
	btr r12,2
	clc
	call dcp
LB_80:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_75
	bt QWORD [rdi],17
	jnc LB_75
	bt QWORD [rdi],0
	jc LB_77
	btr r12,2
	clc
	jmp LB_78
LB_77:
	bts r12,2
	stc
LB_78:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_76
LB_75:
	btr r12,2
	clc
	call dcp
LB_76:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rsi,QWORD [rdi+8+8*rax]
	not rsi
	xor rsi,rsp
	mov rsi,[rsi]
	bt r12,2
	jc LB_74
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_74:
	mov rsi,rbx
	mov rbx,[rsi]
	mov QWORD [rdi+8+8*rax],rsi
	mov rax,r8
	mov QWORD [rsi+8],rax
	mov rax,0x0000_0001_0002_ffff
	mov QWORD [rsi],rax
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call mk_arr
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_35: dq 0
NS_E_35:
NS_E_RDI_35:
	mov eax,[r14+4]
	lea r8,[r8-1+r13]
	cmp r8,rax
	jge err_s8_ge
	mov eax,[r9+4]
	lea r10,[r10-1+r13]
	cmp r10,rax
	jge err_s8_ge
	lea rsi,[r14+8+r8]
	lea rdi,[r9+8+r10]
	mov rcx,r13
	std
	rep movsb
	cld
	add r8,1
	add r10,1
	ret
NS_E_ID_34: dq 0
NS_E_34:
NS_E_RDI_34:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_33: dq 0
NS_E_33:
NS_E_RDI_33:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_32: dq 0
NS_E_32:
NS_E_RDI_32:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_31: dq 0
NS_E_31:
NS_E_RDI_31:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_37: dq 0
NS_E_37:
NS_E_RDI_37:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_69:
NS_E_RDI_69:
NS_E_69_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	call scf_d
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	cmp rdi,0
	jz NS_E_69_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_69_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_103:
NS_E_RDI_103:
; » 0xr2 |~ {  } ⊢ %_83 : %_83
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_83
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_104
	btr r12,1
	jmp LB_105
LB_104:
	bts r12,1
LB_105:
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
	mov rdi,r14
	bt r12,1
	jc LB_108
	btr r12,2
	clc
	jmp LB_109
LB_108:
	bts r12,2
	stc
LB_109:
	call dcp
	mov r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_106
	btr r12,1
	clc
	jmp LB_107
LB_106:
	bts r12,1
	stc
LB_107:
	add rsp,16
; _f38 { %_84 %_85 } ⊢ { %_86 %_87 } : { %_86 %_87 }
 ; {>  %_84~1':_r64 %_85~2':_r64 }
; _f38 { 1' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_112
	btr r12,3
	jmp LB_113
LB_112:
	bts r12,3
LB_113:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_110
	btr QWORD [rdi],0
	jmp LB_111
LB_110:
	bts QWORD [rdi],0
LB_111:
	mov r9,r8
	bt r12,2
	jc LB_116
	btr r12,3
	jmp LB_117
LB_116:
	bts r12,3
LB_117:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_114
	btr QWORD [rdi],1
	jmp LB_115
LB_114:
	bts QWORD [rdi],1
LB_115:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_118
	btr r12,2
	jmp LB_119
LB_118:
	bts r12,2
LB_119:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_122
	btr r12,3
	clc
	jmp LB_123
LB_122:
	bts r12,3
	stc
LB_123:
	mov r13,r9
	bt r12,3
	jc LB_120
	btr r12,0
	jmp LB_121
LB_120:
	bts r12,0
LB_121:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_126
	btr r12,3
	clc
	jmp LB_127
LB_126:
	bts r12,3
	stc
LB_127:
	mov r14,r9
	bt r12,3
	jc LB_124
	btr r12,1
	jmp LB_125
LB_124:
	bts r12,1
LB_125:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 2'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r9,r13
	bt r12,0
	jc LB_130
	btr r12,3
	jmp LB_131
LB_130:
	bts r12,3
LB_131:
	mov rdi,r8
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_128
	btr QWORD [rdi],0
	jmp LB_129
LB_128:
	bts QWORD [rdi],0
LB_129:
	mov r9,r14
	bt r12,1
	jc LB_134
	btr r12,3
	jmp LB_135
LB_134:
	bts r12,3
LB_135:
	mov rdi,r8
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_132
	btr QWORD [rdi],1
	jmp LB_133
LB_132:
	bts QWORD [rdi],1
LB_133:
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
	mov rdi,r8
	bt r12,2
	jc LB_138
	btr r12,3
	clc
	jmp LB_139
LB_138:
	bts r12,3
	stc
LB_139:
	call dcp
	mov r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_136
	btr r12,2
	clc
	jmp LB_137
LB_136:
	bts r12,2
	stc
LB_137:
	add rsp,16
; _f38 { %_88 %_89 } ⊢ { %_90 %_91 } : { %_90 %_91 }
 ; {>  %_89~3':{ _r64 _r64 } %_88~2':{ _r64 _r64 } }
; _f38 { 2' 3' } ⊢ { { 0' 1' } { 2' 3' } }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00110.. |},{ 2' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r8
	bt r12,2
	jc LB_142
	btr r12,1
	jmp LB_143
LB_142:
	bts r12,1
LB_143:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_140
	btr QWORD [rdi],0
	jmp LB_141
LB_140:
	bts QWORD [rdi],0
LB_141:
	mov r14,r9
	bt r12,3
	jc LB_146
	btr r12,1
	jmp LB_147
LB_146:
	bts r12,1
LB_147:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_144
	btr QWORD [rdi],1
	jmp LB_145
LB_144:
	bts QWORD [rdi],1
LB_145:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { { 0' 1' } { 2' 3' } }
	mov r10,r13
	bt r12,0
	jc LB_148
	btr r12,4
	jmp LB_149
LB_148:
	bts r12,4
LB_149:
; 4' ⊢ { { 0' 1' } { 2' 3' } }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_158
	btr r12,5
	clc
	jmp LB_159
LB_158:
	bts r12,5
	stc
LB_159:
; 5' ⊢ { 0' 1' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov r8,rax
	bt QWORD [rdi],0
	jc LB_152
	btr r12,2
	clc
	jmp LB_153
LB_152:
	bts r12,2
	stc
LB_153:
	mov r13,r8
	bt r12,2
	jc LB_150
	btr r12,0
	jmp LB_151
LB_150:
	bts r12,0
LB_151:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov r8,rax
	bt QWORD [rdi],1
	jc LB_156
	btr r12,2
	clc
	jmp LB_157
LB_156:
	bts r12,2
	stc
LB_157:
	mov r14,r8
	bt r12,2
	jc LB_154
	btr r12,1
	jmp LB_155
LB_154:
	bts r12,1
LB_155:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_168
	btr r12,5
	clc
	jmp LB_169
LB_168:
	bts r12,5
	stc
LB_169:
; 5' ⊢ { 2' 3' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_162
	btr r12,6
	clc
	jmp LB_163
LB_162:
	bts r12,6
	stc
LB_163:
	mov r8,rcx
	bt r12,6
	jc LB_160
	btr r12,2
	jmp LB_161
LB_160:
	bts r12,2
LB_161:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_166
	btr r12,6
	clc
	jmp LB_167
LB_166:
	bts r12,6
	stc
LB_167:
	mov r9,rcx
	bt r12,6
	jc LB_164
	btr r12,3
	jmp LB_165
LB_164:
	bts r12,3
LB_165:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } ⊢ 4'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_172
	btr QWORD [rdi],0
	jmp LB_173
LB_172:
	bts QWORD [rdi],0
LB_173:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_174
	btr QWORD [rdi],1
	jmp LB_175
LB_174:
	bts QWORD [rdi],1
LB_175:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_176
	btr QWORD [rdi],2
	jmp LB_177
LB_176:
	bts QWORD [rdi],2
LB_177:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_178
	btr QWORD [rdi],3
	jmp LB_179
LB_178:
	bts QWORD [rdi],3
LB_179:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_170
	btr QWORD [rdi],0
	jmp LB_171
LB_170:
	bts QWORD [rdi],0
LB_171:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov rdx,rax
	btr r12,7
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_184
	btr QWORD [rdi],0
	jmp LB_185
LB_184:
	bts QWORD [rdi],0
LB_185:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rdx,rax
	btr r12,7
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
	mov rdi,rdx
	mov rsi,QWORD [st_vct+8*8]
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,8
	jc LB_188
	btr QWORD [rdi],0
	jmp LB_189
LB_188:
	bts QWORD [rdi],0
LB_189:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
	mov rdi,rdx
	mov rsi,QWORD [st_vct+8*8]
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,8
	jc LB_190
	btr QWORD [rdi],1
	jmp LB_191
LB_190:
	bts QWORD [rdi],1
LB_191:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_186
	btr QWORD [rdi],1
	jmp LB_187
LB_186:
	bts QWORD [rdi],1
LB_187:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_182
	btr QWORD [rdi],0
	jmp LB_183
LB_182:
	bts QWORD [rdi],0
LB_183:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_180
	btr QWORD [rdi],1
	jmp LB_181
LB_180:
	bts QWORD [rdi],1
LB_181:
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
	mov rdi,r10
	bt r12,4
	jc LB_202
	btr r12,5
	clc
	jmp LB_203
LB_202:
	bts r12,5
	stc
LB_203:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_200
	btr r12,4
	clc
	jmp LB_201
LB_200:
	bts r12,4
	stc
LB_201:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_198
	btr r12,3
	clc
	jmp LB_199
LB_198:
	bts r12,3
	stc
LB_199:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_196
	btr r12,2
	clc
	jmp LB_197
LB_196:
	bts r12,2
	stc
LB_197:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_194
	btr r12,1
	clc
	jmp LB_195
LB_194:
	bts r12,1
	stc
LB_195:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_192
	btr r12,0
	clc
	jmp LB_193
LB_192:
	bts r12,0
	stc
LB_193:
	add rsp,48
; _f38 { %_92 %_93 } ⊢ { %_94 %_95 } : { %_94 %_95 }
 ; {>  %_90~{ 0' 1' }:{ _r64 _r64 } %_93~5':{ { { } { } { } { } } { { { } { { } { } } } } } %_92~4':{ { { } { } { } { } } { { { } { { } { } } } } } %_91~{ 2' 3' }:{ _r64 _r64 } }
; _f38 { 4' 5' } ⊢ { { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000110.. |},{ 4' 5' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r10
	bt r12,4
	jc LB_214
	btr r12,1
	jmp LB_215
LB_214:
	bts r12,1
LB_215:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_212
	btr QWORD [rdi],0
	jmp LB_213
LB_212:
	bts QWORD [rdi],0
LB_213:
	mov r14,r11
	bt r12,5
	jc LB_218
	btr r12,1
	jmp LB_219
LB_218:
	bts r12,1
LB_219:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_216
	btr QWORD [rdi],1
	jmp LB_217
LB_216:
	bts QWORD [rdi],1
LB_217:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } }
; 0' ⊢ { { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_242
	btr r12,1
	clc
	jmp LB_243
LB_242:
	bts r12,1
	stc
LB_243:
; 1' ⊢ { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*0]
	mov r8,rax
	bt QWORD [rdi],0
	jc LB_228
	btr r12,2
	clc
	jmp LB_229
LB_228:
	bts r12,2
	stc
LB_229:
; 2' ⊢ { {  } {  } {  } {  } }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_220
	btr r12,3
	clc
	jmp LB_221
LB_220:
	bts r12,3
	stc
LB_221:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_222
	btr r12,3
	clc
	jmp LB_223
LB_222:
	bts r12,3
	stc
LB_223:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*2]
	mov r9,rax
	bt QWORD [rdi],2
	jc LB_224
	btr r12,3
	clc
	jmp LB_225
LB_224:
	bts r12,3
	stc
LB_225:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*3]
	mov r9,rax
	bt QWORD [rdi],3
	jc LB_226
	btr r12,3
	clc
	jmp LB_227
LB_226:
	bts r12,3
	stc
LB_227:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*1]
	mov r8,rax
	bt QWORD [rdi],1
	jc LB_240
	btr r12,2
	clc
	jmp LB_241
LB_240:
	bts r12,2
	stc
LB_241:
; 2' ⊢ { { {  } { {  } {  } } } }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_238
	btr r12,3
	clc
	jmp LB_239
LB_238:
	bts r12,3
	stc
LB_239:
; 3' ⊢ { {  } { {  } {  } } }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_230
	btr r12,4
	clc
	jmp LB_231
LB_230:
	bts r12,4
	stc
LB_231:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_236
	btr r12,4
	clc
	jmp LB_237
LB_236:
	bts r12,4
	stc
LB_237:
; 4' ⊢ { {  } {  } }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_232
	btr r12,5
	clc
	jmp LB_233
LB_232:
	bts r12,5
	stc
LB_233:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_234
	btr r12,5
	clc
	jmp LB_235
LB_234:
	bts r12,5
	stc
LB_235:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_266
	btr r12,1
	clc
	jmp LB_267
LB_266:
	bts r12,1
	stc
LB_267:
; 1' ⊢ { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*0]
	mov r8,rax
	bt QWORD [rdi],0
	jc LB_252
	btr r12,2
	clc
	jmp LB_253
LB_252:
	bts r12,2
	stc
LB_253:
; 2' ⊢ { {  } {  } {  } {  } }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_244
	btr r12,3
	clc
	jmp LB_245
LB_244:
	bts r12,3
	stc
LB_245:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_246
	btr r12,3
	clc
	jmp LB_247
LB_246:
	bts r12,3
	stc
LB_247:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*2]
	mov r9,rax
	bt QWORD [rdi],2
	jc LB_248
	btr r12,3
	clc
	jmp LB_249
LB_248:
	bts r12,3
	stc
LB_249:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*3]
	mov r9,rax
	bt QWORD [rdi],3
	jc LB_250
	btr r12,3
	clc
	jmp LB_251
LB_250:
	bts r12,3
	stc
LB_251:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*1]
	mov r8,rax
	bt QWORD [rdi],1
	jc LB_264
	btr r12,2
	clc
	jmp LB_265
LB_264:
	bts r12,2
	stc
LB_265:
; 2' ⊢ { { {  } { {  } {  } } } }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_262
	btr r12,3
	clc
	jmp LB_263
LB_262:
	bts r12,3
	stc
LB_263:
; 3' ⊢ { {  } { {  } {  } } }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_254
	btr r12,4
	clc
	jmp LB_255
LB_254:
	bts r12,4
	stc
LB_255:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_260
	btr r12,4
	clc
	jmp LB_261
LB_260:
	bts r12,4
	stc
LB_261:
; 4' ⊢ { {  } {  } }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_256
	btr r12,5
	clc
	jmp LB_257
LB_256:
	bts r12,5
	stc
LB_257:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_258
	btr r12,5
	clc
	jmp LB_259
LB_258:
	bts r12,5
	stc
LB_259:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_210
	btr r12,3
	clc
	jmp LB_211
LB_210:
	bts r12,3
	stc
LB_211:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_208
	btr r12,2
	clc
	jmp LB_209
LB_208:
	bts r12,2
	stc
LB_209:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_206
	btr r12,1
	clc
	jmp LB_207
LB_206:
	bts r12,1
	stc
LB_207:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_204
	btr r12,0
	clc
	jmp LB_205
LB_204:
	bts r12,0
	stc
LB_205:
	add rsp,40
; 	» "HHH" _ ⊢ 4' : %_96
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_48_48_48
	mov QWORD [rdi+8*1+8*0],rax
	mov r10,rdi
	btr r12,4
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ 5'
	mov r11,r10
	bt r12,4
	jc LB_268
	btr r12,5
	jmp LB_269
LB_268:
	bts r12,5
LB_269:
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
	mov rdi,r11
	bt r12,5
	jc LB_280
	btr r12,6
	clc
	jmp LB_281
LB_280:
	bts r12,6
	stc
LB_281:
	call dcp
	mov rcx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_278
	btr r12,5
	clc
	jmp LB_279
LB_278:
	bts r12,5
	stc
LB_279:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_276
	btr r12,3
	clc
	jmp LB_277
LB_276:
	bts r12,3
	stc
LB_277:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_274
	btr r12,2
	clc
	jmp LB_275
LB_274:
	bts r12,2
	stc
LB_275:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_272
	btr r12,1
	clc
	jmp LB_273
LB_272:
	bts r12,1
	stc
LB_273:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_270
	btr r12,0
	clc
	jmp LB_271
LB_270:
	bts r12,0
	stc
LB_271:
	add rsp,48
; _f38 %_97 ⊢ %_99 : %_99
 ; {>  %_90~{ 0' 1' }:{ _r64 _r64 } %_94~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_97~5':_stg %_95~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_98~6':_stg %_91~{ 2' 3' }:{ _r64 _r64 } }
; _f38 5' ⊢ 4'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_292
	btr r12,0
	jmp LB_293
LB_292:
	bts r12,0
LB_293:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_294
	btr r12,4
	jmp LB_295
LB_294:
	bts r12,4
LB_295:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_290
	btr r12,6
	clc
	jmp LB_291
LB_290:
	bts r12,6
	stc
LB_291:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_288
	btr r12,3
	clc
	jmp LB_289
LB_288:
	bts r12,3
	stc
LB_289:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_286
	btr r12,2
	clc
	jmp LB_287
LB_286:
	bts r12,2
	stc
LB_287:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_284
	btr r12,1
	clc
	jmp LB_285
LB_284:
	bts r12,1
	stc
LB_285:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_282
	btr r12,0
	clc
	jmp LB_283
LB_282:
	bts r12,0
	stc
LB_283:
	add rsp,48
; _f38 %_98 ⊢ %_100 : %_100
 ; {>  %_90~{ 0' 1' }:{ _r64 _r64 } %_94~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_95~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_99~4':_stg %_98~6':_stg %_91~{ 2' 3' }:{ _r64 _r64 } }
; _f38 6' ⊢ 5'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_306
	btr r12,0
	jmp LB_307
LB_306:
	bts r12,0
LB_307:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 5'
	mov r11,r13
	bt r12,0
	jc LB_308
	btr r12,5
	jmp LB_309
LB_308:
	bts r12,5
LB_309:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_304
	btr r12,4
	clc
	jmp LB_305
LB_304:
	bts r12,4
	stc
LB_305:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_302
	btr r12,3
	clc
	jmp LB_303
LB_302:
	bts r12,3
	stc
LB_303:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_300
	btr r12,2
	clc
	jmp LB_301
LB_300:
	bts r12,2
	stc
LB_301:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_298
	btr r12,1
	clc
	jmp LB_299
LB_298:
	bts r12,1
	stc
LB_299:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_296
	btr r12,0
	clc
	jmp LB_297
LB_296:
	bts r12,0
	stc
LB_297:
	add rsp,48
MTC_LB_310:
	mov r15,0
	mov rdi,r10
	mov rsi,r11
	bt r12,4
	call eq
	jnz MTC_LB_311
LB_312:
	cmp r15,0
	jz LB_313
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_312
LB_313:
; _f38 %_90 ⊢ %_101 : %_101
 ; {>  %_90~{ 0' 1' }:{ _r64 _r64 } %_100~5':_stg %_94~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_95~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_99~4':_stg %_91~{ 2' 3' }:{ _r64 _r64 } }
; _f38 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_322
	btr r12,2
	jmp LB_323
LB_322:
	bts r12,2
LB_323:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_326
	btr r12,3
	jmp LB_327
LB_326:
	bts r12,3
LB_327:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_324
	btr QWORD [rdi],0
	jmp LB_325
LB_324:
	bts QWORD [rdi],0
LB_325:
	mov r9,r14
	bt r12,1
	jc LB_330
	btr r12,3
	jmp LB_331
LB_330:
	bts r12,3
LB_331:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_328
	btr QWORD [rdi],1
	jmp LB_329
LB_328:
	bts QWORD [rdi],1
LB_329:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_332
	btr r12,2
	jmp LB_333
LB_332:
	bts r12,2
LB_333:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_336
	btr r12,3
	clc
	jmp LB_337
LB_336:
	bts r12,3
	stc
LB_337:
	mov r13,r9
	bt r12,3
	jc LB_334
	btr r12,0
	jmp LB_335
LB_334:
	bts r12,0
LB_335:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_340
	btr r12,3
	clc
	jmp LB_341
LB_340:
	bts r12,3
	stc
LB_341:
	mov r14,r9
	bt r12,3
	jc LB_338
	btr r12,1
	jmp LB_339
LB_338:
	bts r12,1
LB_339:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_320
	btr r12,5
	clc
	jmp LB_321
LB_320:
	bts r12,5
	stc
LB_321:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_318
	btr r12,4
	clc
	jmp LB_319
LB_318:
	bts r12,4
	stc
LB_319:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_316
	btr r12,3
	clc
	jmp LB_317
LB_316:
	bts r12,3
	stc
LB_317:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_314
	btr r12,2
	clc
	jmp LB_315
LB_314:
	bts r12,2
	stc
LB_315:
	add rsp,40
; ∎ {  }
 ; {>  %_100~5':_stg %_101~{ 0' 1' }:{ _r64 _r64 } %_94~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_95~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_99~4':_stg %_91~{ 2' 3' }:{ _r64 _r64 } }
; 	∎ {  }
	bt r12,5
	jc LB_342
	mov rdi,r11
	call dlt
LB_342:
	bt r12,0
	jc LB_343
	mov rdi,r13
	call dlt
LB_343:
	bt r12,1
	jc LB_344
	mov rdi,r14
	call dlt
LB_344:
	bt r12,4
	jc LB_345
	mov rdi,r10
	call dlt
LB_345:
	bt r12,2
	jc LB_346
	mov rdi,r8
	call dlt
LB_346:
	bt r12,3
	jc LB_347
	mov rdi,r9
	call dlt
LB_347:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_311:
	mov r15,0
LB_349:
	cmp r15,0
	jz LB_350
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_349
LB_350:
; _f38 %_100 ⊢ %_102 : %_102
 ; {>  %_90~{ 0' 1' }:{ _r64 _r64 } %_100~5':_stg %_94~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_95~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_99~4':_stg %_91~{ 2' 3' }:{ _r64 _r64 } }
; _f38 5' ⊢ 5'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_361
	btr r12,0
	jmp LB_362
LB_361:
	bts r12,0
LB_362:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 5'
	mov r11,r13
	bt r12,0
	jc LB_363
	btr r12,5
	jmp LB_364
LB_363:
	bts r12,5
LB_364:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_359
	btr r12,4
	clc
	jmp LB_360
LB_359:
	bts r12,4
	stc
LB_360:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_357
	btr r12,3
	clc
	jmp LB_358
LB_357:
	bts r12,3
	stc
LB_358:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_355
	btr r12,2
	clc
	jmp LB_356
LB_355:
	bts r12,2
	stc
LB_356:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_353
	btr r12,1
	clc
	jmp LB_354
LB_353:
	bts r12,1
	stc
LB_354:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_351
	btr r12,0
	clc
	jmp LB_352
LB_351:
	bts r12,0
	stc
LB_352:
	add rsp,48
; ∎ {  }
 ; {>  %_90~{ 0' 1' }:{ _r64 _r64 } %_94~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_102~5':_stg %_95~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_99~4':_stg %_91~{ 2' 3' }:{ _r64 _r64 } }
; 	∎ {  }
	bt r12,0
	jc LB_365
	mov rdi,r13
	call dlt
LB_365:
	bt r12,1
	jc LB_366
	mov rdi,r14
	call dlt
LB_366:
	bt r12,5
	jc LB_367
	mov rdi,r11
	call dlt
LB_367:
	bt r12,4
	jc LB_368
	mov rdi,r10
	call dlt
LB_368:
	bt r12,2
	jc LB_369
	mov rdi,r8
	call dlt
LB_369:
	bt r12,3
	jc LB_370
	mov rdi,r9
	call dlt
LB_370:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_348:
section .data
	CST_DYN_103:
		dq 0x0000_0001_00_82_ffff
		dq 1
