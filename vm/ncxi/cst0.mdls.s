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
	call NS_E_314
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
NS_E_99:
NS_E_RDI_99:
NS_E_99_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_100
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_100:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_102:
NS_E_RDI_102:
NS_E_102_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_102_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_102_LB_0:
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
NS_E_103_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_103_LB_0
	cmp r11,57
	ja NS_E_103_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_103_LB_0:
	mov rax,0
	ret
NS_E_105:
NS_E_RDI_105:
NS_E_105_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_105_LB_0
	cmp r11,122
	ja NS_E_105_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_105_LB_0:
	mov rax,0
	ret
NS_E_104:
NS_E_RDI_104:
NS_E_104_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_104_LB_0
	cmp r11,90
	ja NS_E_104_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_104_LB_0:
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
	jc LB_111
	bt QWORD [rdi],17
	jnc LB_111
	bt QWORD [rdi],0
	jc LB_113
	btr r12,2
	clc
	jmp LB_114
LB_113:
	bts r12,2
	stc
LB_114:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_112
LB_111:
	btr r12,2
	clc
	call dcp
LB_112:
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
	jc LB_107
	bt QWORD [rdi],17
	jnc LB_107
	bt QWORD [rdi],0
	jc LB_109
	btr r12,2
	clc
	jmp LB_110
LB_109:
	bts r12,2
	stc
LB_110:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_108
LB_107:
	btr r12,2
	clc
	call dcp
LB_108:
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
	jc LB_106
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_106:
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
NS_E_101:
NS_E_RDI_101:
NS_E_101_ETR_TBL:
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
	jz NS_E_101_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_101_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_117:
; 	|» { 0' 1' }
NS_E_RDI_117:
; _f51 %_115 ⊢ %_116 : %_116
 ; {>  %_115~{ 0' 1' }:{ _r64 _r64 } }
	add r13,r14
	jmp err
NS_E_118:
NS_E_RDI_118:
NS_E_118_ETR_TBL:
NS_E_118_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_161
LB_160:
	add r14,1
LB_161:
	cmp r14,r10
	jge LB_162
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_160
	cmp al,10
	jz LB_160
	cmp al,32
	jz LB_160
LB_162:
	add r14,1
	cmp r14,r10
	jg LB_165
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_165
	jmp LB_166
LB_165:
	jmp LB_153
LB_166:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; rcd_lst
	jmp LB_168
LB_167:
	add r14,1
LB_168:
	cmp r14,r10
	jge LB_169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_167
	cmp al,10
	jz LB_167
	cmp al,32
	jz LB_167
LB_169:
	push r10
	call NS_E_119_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_170
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_171
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_171:
	jmp LB_153
LB_170:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_174
LB_173:
	add r14,1
LB_174:
	cmp r14,r10
	jge LB_175
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_173
	cmp al,10
	jz LB_173
	cmp al,32
	jz LB_173
LB_175:
	add r14,1
	cmp r14,r10
	jg LB_180
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_180
	jmp LB_181
LB_180:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_177
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_177:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_178
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_178:
	jmp LB_153
LB_181:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_158
	btr r12,2
	clc
	jmp LB_159
LB_158:
	bts r12,2
	stc
LB_159:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_156
	btr r12,1
	clc
	jmp LB_157
LB_156:
	bts r12,1
	stc
LB_157:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_154
	btr r12,0
	clc
	jmp LB_155
LB_154:
	bts r12,0
	stc
LB_155:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_150
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_182
	btr r12,3
	jmp LB_183
LB_182:
	bts r12,3
LB_183:
	mov r13,r14
	bt r12,1
	jc LB_184
	btr r12,0
	jmp LB_185
LB_184:
	bts r12,0
LB_185:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
; _f38 { %_70 %_69 } ⊢ { %_121 %_122 } : { %_121 %_122 }
 ; {>  %_120~0':_r64 %_69~2':_r64 %_70~1':_r64 }
; _f38 { 1' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
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
	jc LB_132
	btr r12,3
	jmp LB_133
LB_132:
	bts r12,3
LB_133:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_130
	btr QWORD [rdi],0
	jmp LB_131
LB_130:
	bts QWORD [rdi],0
LB_131:
	mov r9,r8
	bt r12,2
	jc LB_136
	btr r12,3
	jmp LB_137
LB_136:
	bts r12,3
LB_137:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_134
	btr QWORD [rdi],1
	jmp LB_135
LB_134:
	bts QWORD [rdi],1
LB_135:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_140
	btr r12,3
	clc
	jmp LB_141
LB_140:
	bts r12,3
	stc
LB_141:
	mov r14,r9
	bt r12,3
	jc LB_138
	btr r12,1
	jmp LB_139
LB_138:
	bts r12,1
LB_139:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_144
	btr r12,3
	clc
	jmp LB_145
LB_144:
	bts r12,3
	stc
LB_145:
	mov r8,r9
	bt r12,3
	jc LB_142
	btr r12,2
	jmp LB_143
LB_142:
	bts r12,2
LB_143:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_128
	btr r12,0
	clc
	jmp LB_129
LB_128:
	bts r12,0
	stc
LB_129:
	add rsp,16
; _some %_121 ⊢ %_123 : %_123
 ; {>  %_120~0':_r64 %_122~2':_r64 %_121~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_123
 ; {>  %_120~0':_r64 %_122~2':_r64 %_123~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_146
	mov rdi,r13
	call dlt
LB_146:
	bt r12,2
	jc LB_147
	mov rdi,r8
	call dlt
LB_147:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_148
	btr r12,3
	jmp LB_149
LB_148:
	bts r12,3
LB_149:
	mov r8,0
	bts r12,2
	ret
LB_150:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_152
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_151
LB_152:
	add rsp,8
	ret
LB_153:
	add rsp,48
	pop r14
LB_151:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_119:
NS_E_RDI_119:
NS_E_119_ETR_TBL:
NS_E_119_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; rcd
	jmp LB_200
LB_199:
	add r14,1
LB_200:
	cmp r14,r10
	jge LB_201
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_199
	cmp al,10
	jz LB_199
	cmp al,32
	jz LB_199
LB_201:
	push r10
	call NS_E_118_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_202
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_194
LB_202:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; rcd_lst
	jmp LB_205
LB_204:
	add r14,1
LB_205:
	cmp r14,r10
	jge LB_206
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_204
	cmp al,10
	jz LB_204
	cmp al,32
	jz LB_204
LB_206:
	push r10
	call NS_E_119_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_207
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_208
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_208:
	jmp LB_194
LB_207:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_197
	btr r12,1
	clc
	jmp LB_198
LB_197:
	bts r12,1
	stc
LB_198:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_195
	btr r12,0
	clc
	jmp LB_196
LB_195:
	bts r12,0
	stc
LB_196:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_191
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
; _some %_74 ⊢ %_126 : %_126
 ; {>  %_125~1':_r64 %_74~2':_r64 %_73~3':_r64 %_124~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_126
 ; {>  %_125~1':_r64 %_126~°0◂2':(_opn)◂(_r64) %_73~3':_r64 %_124~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_186
	mov rdi,r14
	call dlt
LB_186:
	bt r12,3
	jc LB_187
	mov rdi,r9
	call dlt
LB_187:
	bt r12,0
	jc LB_188
	mov rdi,r13
	call dlt
LB_188:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_189
	btr r12,3
	jmp LB_190
LB_189:
	bts r12,3
LB_190:
	mov r8,0
	bts r12,2
	ret
LB_191:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_193
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_192
LB_193:
	add rsp,8
	ret
LB_194:
	add rsp,32
	pop r14
LB_192:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_213
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
; _some %_78 ⊢ %_127 : %_127
 ; {>  %_77~1':_r64 %_78~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_127
 ; {>  %_77~1':_r64 %_127~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_210
	mov rdi,r14
	call dlt
LB_210:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_211
	btr r12,3
	jmp LB_212
LB_211:
	bts r12,3
LB_212:
	mov r8,0
	bts r12,2
	ret
LB_213:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_215
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_214
LB_215:
	add rsp,8
	ret
LB_216:
	add rsp,0
	pop r14
LB_214:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_217:
NS_E_RDI_217:
NS_E_217_ETR_TBL:
NS_E_217_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "A"
	jmp LB_275
LB_274:
	add r14,1
LB_275:
	cmp r14,r10
	jge LB_276
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_274
	cmp al,10
	jz LB_274
	cmp al,32
	jz LB_274
LB_276:
	add r14,1
	cmp r14,r10
	jg LB_279
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,65
	jnz LB_279
	jmp LB_280
LB_279:
	jmp LB_264
LB_280:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; gx
	jmp LB_282
LB_281:
	add r14,1
LB_282:
	cmp r14,r10
	jge LB_283
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_281
	cmp al,10
	jz LB_281
	cmp al,32
	jz LB_281
LB_283:
	push r10
	call NS_E_217_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_284
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_285
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_285:
	jmp LB_264
LB_284:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	push r10
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "B"
	jmp LB_232
LB_231:
	add r14,1
LB_232:
	cmp r14,r10
	jge LB_233
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_231
	cmp al,10
	jz LB_231
	cmp al,32
	jz LB_231
LB_233:
	add r14,1
	cmp r14,r10
	jg LB_236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,66
	jnz LB_236
	jmp LB_237
LB_236:
	jmp LB_226
LB_237:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; gx
	jmp LB_239
LB_238:
	add r14,1
LB_239:
	cmp r14,r10
	jge LB_240
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_238
	cmp al,10
	jz LB_238
	cmp al,32
	jz LB_238
LB_240:
	push r10
	call NS_E_217_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_241
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_242
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_242:
	jmp LB_226
LB_241:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_229
	btr r12,1
	clc
	jmp LB_230
LB_229:
	bts r12,1
	stc
LB_230:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_227
	btr r12,0
	clc
	jmp LB_228
LB_227:
	bts r12,0
	stc
LB_228:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_223
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_244
	btr r12,2
	jmp LB_245
LB_244:
	bts r12,2
LB_245:
	mov r13,r14
	bt r12,1
	jc LB_246
	btr r12,0
	jmp LB_247
LB_246:
	bts r12,0
LB_247:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r8,rax
	mov rax,QWORD [rsp+8*3]
	mov r14,rax
	bts r12,1
	bts r12,2
	jmp err
LB_223:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_225
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_224
LB_225:
	add rsp,8
	jmp LB_221
LB_226:
	add rsp,32
	pop r14
LB_224:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "C"
	jmp LB_255
LB_254:
	add r14,1
LB_255:
	cmp r14,r10
	jge LB_256
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_254
	cmp al,10
	jz LB_254
	cmp al,32
	jz LB_254
LB_256:
	add r14,1
	cmp r14,r10
	jg LB_259
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,67
	jnz LB_259
	jmp LB_260
LB_259:
	jmp LB_251
LB_260:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_252
	btr r12,0
	clc
	jmp LB_253
LB_252:
	bts r12,0
	stc
LB_253:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_248
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
	jmp err
LB_248:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_250
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_249
LB_250:
	add rsp,8
	jmp LB_221
LB_251:
	add rsp,16
	pop r14
LB_249:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	jmp LB_221
LB_221:
	pop r10
	cmp r8,0
	jz LB_222
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_271
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_271:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_272
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_272:
	jmp LB_264
LB_222:
	mov r8,r9
	bt r12,3
	jc LB_269
	btr r12,2
	clc
	jmp LB_270
LB_269:
	bts r12,2
	stc
LB_270:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_267
	btr r12,1
	clc
	jmp LB_268
LB_267:
	bts r12,1
	stc
LB_268:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_265
	btr r12,0
	clc
	jmp LB_266
LB_265:
	bts r12,0
	stc
LB_266:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_261
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ { 0' 1' } 2' } ⊢ { { {  } 0' } 1' }
	mov r9,r14
	bt r12,1
	jc LB_287
	btr r12,3
	jmp LB_288
LB_287:
	bts r12,3
LB_288:
	mov r14,r8
	bt r12,2
	jc LB_289
	btr r12,1
	jmp LB_290
LB_289:
	bts r12,1
LB_290:
	mov r8,r13
	bt r12,0
	jc LB_291
	btr r12,2
	jmp LB_292
LB_291:
	bts r12,2
LB_292:
	mov r13,r9
	bt r12,3
	jc LB_293
	btr r12,0
	jmp LB_294
LB_293:
	bts r12,0
LB_294:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rax,QWORD [rsp+8]
	mov r9,rax
	mov rax,QWORD [rsp+8*3]
	mov r8,rax
	bts r12,2
	bts r12,3
	jmp err
LB_261:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_263
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_262
LB_263:
	add rsp,8
	ret
LB_264:
	add rsp,32
	pop r14
LB_262:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_295
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	mov rax,QWORD [rsp+8]
	mov r14,rax
	mov rax,QWORD [rsp+8*3]
	mov r13,rax
	bts r12,0
	bts r12,1
	jmp err
LB_295:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_297
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_296
LB_297:
	add rsp,8
	ret
LB_298:
	add rsp,0
	pop r14
LB_296:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_314:
NS_E_RDI_314:
; 	» "{ {} {} }" _ ⊢ 0' : %_299
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_7d_7b_20_7d_7b_20_7b
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_7d
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_300 : %_300
 ; {>  %_299~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_300
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f118 { %_299 %_300 } ⊢ { %_301 %_302 %_303 } : { %_301 %_302 %_303 }
 ; {>  %_299~0':_stg %_300~1':_r64 }
; _f118 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_118
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_315
	btr r12,4
	jmp LB_316
LB_315:
	bts r12,4
LB_316:
	mov r8,r9
	bt r12,3
	jc LB_319
	btr r12,2
	jmp LB_320
LB_319:
	bts r12,2
LB_320:
	mov rsi,1
	bt r12,2
	jc LB_317
	mov rsi,0
	bt r8,0
	jc LB_317
	jmp LB_318
LB_317:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_318:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f38 { %_302 %_303 } ⊢ { %_304 %_305 } : { %_304 %_305 }
 ; {>  %_301~0':_stg %_303~2':(_opn)◂(_r64) %_302~1':_r64 }
; _f38 { 1' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
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
	jc LB_325
	btr r12,3
	jmp LB_326
LB_325:
	bts r12,3
LB_326:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_323
	btr QWORD [rdi],0
	jmp LB_324
LB_323:
	bts QWORD [rdi],0
LB_324:
	mov r9,r8
	bt r12,2
	jc LB_329
	btr r12,3
	jmp LB_330
LB_329:
	bts r12,3
LB_330:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_327
	btr QWORD [rdi],1
	jmp LB_328
LB_327:
	bts QWORD [rdi],1
LB_328:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 1' 2' }
; 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_333
	btr r12,3
	clc
	jmp LB_334
LB_333:
	bts r12,3
	stc
LB_334:
	mov r14,r9
	bt r12,3
	jc LB_331
	btr r12,1
	jmp LB_332
LB_331:
	bts r12,1
LB_332:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_337
	btr r12,3
	clc
	jmp LB_338
LB_337:
	bts r12,3
	stc
LB_338:
	mov r8,r9
	bt r12,3
	jc LB_335
	btr r12,2
	jmp LB_336
LB_335:
	bts r12,2
LB_336:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_321
	btr r12,0
	clc
	jmp LB_322
LB_321:
	bts r12,0
	stc
LB_322:
	add rsp,16
; 	» "x" _ ⊢ 3' : %_306
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_78
	mov QWORD [rdi+8*1+8*0],rax
	mov r9,rdi
	btr r12,3
; 	» "y" _ ⊢ 4' : %_307
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_79
	mov QWORD [rdi+8*1+8*0],rax
	mov r10,rdi
	btr r12,4
; » 0xra |~ {  } ⊢ %_308 : %_308
 ; {>  %_307~4':_stg %_304~1':_r64 %_301~0':_stg %_305~2':(_opn)◂(_r64) %_306~3':_stg }
; 	» 0xra _ ⊢ 5' : %_308
	mov rdi,0xa
	mov r11,rdi
	bts r12,5
; » _^ ..
	xor rax,rax
	sub rsp,124
	push rax
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,rsp
	mov rdx,r11
	xor rax,rax
	mov rsi,fmt_d
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call sprintf
	mov rsp,QWORD [rsp_tmp]
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	pop rsi
	mov rdx,rsp
	mov QWORD [st_vct+8*8],rax
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov rcx,rax
	btr r12,6
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,rdx
	mov rcx,QWORD [st_vct+8*8]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	add rsp,124
; _f38 %_310 ⊢ %_311 : %_311
 ; {>  %_309~5':_r64 %_307~4':_stg %_304~1':_r64 %_301~0':_stg %_305~2':(_opn)◂(_r64) %_310~6':_stg %_306~3':_stg }
; _f38 6' ⊢ 6'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_351
	btr r12,0
	jmp LB_352
LB_351:
	bts r12,0
LB_352:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_353
	btr r12,6
	jmp LB_354
LB_353:
	bts r12,6
LB_354:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_349
	btr r12,5
	clc
	jmp LB_350
LB_349:
	bts r12,5
	stc
LB_350:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_347
	btr r12,4
	clc
	jmp LB_348
LB_347:
	bts r12,4
	stc
LB_348:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_345
	btr r12,3
	clc
	jmp LB_346
LB_345:
	bts r12,3
	stc
LB_346:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_343
	btr r12,2
	clc
	jmp LB_344
LB_343:
	bts r12,2
	stc
LB_344:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_341
	btr r12,1
	clc
	jmp LB_342
LB_341:
	bts r12,1
	stc
LB_342:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_339
	btr r12,0
	clc
	jmp LB_340
LB_339:
	bts r12,0
	stc
LB_340:
	add rsp,56
MTC_LB_355:
	mov r15,0
	mov rdi,r9
	mov rsi,r10
	bt r12,3
	call eq
	jnz MTC_LB_356
LB_357:
	cmp r15,0
	jz LB_358
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_357
LB_358:
; _f38 %_306 ⊢ %_312 : %_312
 ; {>  %_311~6':_stg %_309~5':_r64 %_307~4':_stg %_304~1':_r64 %_301~0':_stg %_305~2':(_opn)◂(_r64) %_306~3':_stg }
; _f38 3' ⊢ 3'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp+8+8*5],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_371
	btr r12,0
	jmp LB_372
LB_371:
	bts r12,0
LB_372:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_373
	btr r12,3
	jmp LB_374
LB_373:
	bts r12,3
LB_374:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*5]
	bt QWORD rax,6
	jc LB_369
	btr r12,6
	clc
	jmp LB_370
LB_369:
	bts r12,6
	stc
LB_370:
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_367
	btr r12,5
	clc
	jmp LB_368
LB_367:
	bts r12,5
	stc
LB_368:
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_365
	btr r12,4
	clc
	jmp LB_366
LB_365:
	bts r12,4
	stc
LB_366:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_363
	btr r12,2
	clc
	jmp LB_364
LB_363:
	bts r12,2
	stc
LB_364:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_361
	btr r12,1
	clc
	jmp LB_362
LB_361:
	bts r12,1
	stc
LB_362:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_359
	btr r12,0
	clc
	jmp LB_360
LB_359:
	bts r12,0
	stc
LB_360:
	add rsp,56
; ∎ {  }
 ; {>  %_311~6':_stg %_309~5':_r64 %_307~4':_stg %_304~1':_r64 %_301~0':_stg %_312~3':_stg %_305~2':(_opn)◂(_r64) }
; 	∎ {  }
	bt r12,6
	jc LB_375
	mov rdi,rcx
	call dlt
LB_375:
	bt r12,5
	jc LB_376
	mov rdi,r11
	call dlt
LB_376:
	bt r12,4
	jc LB_377
	mov rdi,r10
	call dlt
LB_377:
	bt r12,1
	jc LB_378
	mov rdi,r14
	call dlt
LB_378:
	bt r12,0
	jc LB_379
	mov rdi,r13
	call dlt
LB_379:
	bt r12,3
	jc LB_380
	mov rdi,r9
	call dlt
LB_380:
	bt r12,2
	jc LB_381
	mov rdi,r8
	call dlt
LB_381:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_356:
	mov r15,0
LB_383:
	cmp r15,0
	jz LB_384
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_383
LB_384:
; _f38 %_307 ⊢ %_313 : %_313
 ; {>  %_311~6':_stg %_309~5':_r64 %_307~4':_stg %_304~1':_r64 %_301~0':_stg %_305~2':(_opn)◂(_r64) %_306~3':_stg }
; _f38 4' ⊢ 4'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp+8+8*5],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_397
	btr r12,0
	jmp LB_398
LB_397:
	bts r12,0
LB_398:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_399
	btr r12,4
	jmp LB_400
LB_399:
	bts r12,4
LB_400:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*5]
	bt QWORD rax,6
	jc LB_395
	btr r12,6
	clc
	jmp LB_396
LB_395:
	bts r12,6
	stc
LB_396:
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_393
	btr r12,5
	clc
	jmp LB_394
LB_393:
	bts r12,5
	stc
LB_394:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_391
	btr r12,3
	clc
	jmp LB_392
LB_391:
	bts r12,3
	stc
LB_392:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_389
	btr r12,2
	clc
	jmp LB_390
LB_389:
	bts r12,2
	stc
LB_390:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_387
	btr r12,1
	clc
	jmp LB_388
LB_387:
	bts r12,1
	stc
LB_388:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_385
	btr r12,0
	clc
	jmp LB_386
LB_385:
	bts r12,0
	stc
LB_386:
	add rsp,56
; ∎ {  }
 ; {>  %_311~6':_stg %_309~5':_r64 %_304~1':_r64 %_301~0':_stg %_305~2':(_opn)◂(_r64) %_313~4':_stg %_306~3':_stg }
; 	∎ {  }
	bt r12,6
	jc LB_401
	mov rdi,rcx
	call dlt
LB_401:
	bt r12,5
	jc LB_402
	mov rdi,r11
	call dlt
LB_402:
	bt r12,1
	jc LB_403
	mov rdi,r14
	call dlt
LB_403:
	bt r12,0
	jc LB_404
	mov rdi,r13
	call dlt
LB_404:
	bt r12,2
	jc LB_405
	mov rdi,r8
	call dlt
LB_405:
	bt r12,4
	jc LB_406
	mov rdi,r10
	call dlt
LB_406:
	bt r12,3
	jc LB_407
	mov rdi,r9
	call dlt
LB_407:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_382:
section .data
	CST_DYN_314:
		dq 0x0000_0001_00_82_ffff
		dq 1
