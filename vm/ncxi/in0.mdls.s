%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_138
	call exec_out
	jmp _end
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
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
	call emt_q
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
NS_E_117:
NS_E_RDI_117:
NS_E_117_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_118
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_118:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_120:
NS_E_RDI_120:
NS_E_120_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_120_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_120_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_121:
NS_E_RDI_121:
NS_E_121_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_121_LB_0
	cmp r11,57
	ja NS_E_121_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_121_LB_0:
	mov rax,0
	ret
NS_E_123:
NS_E_RDI_123:
NS_E_123_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_123_LB_0
	cmp r11,122
	ja NS_E_123_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_123_LB_0:
	mov rax,0
	ret
NS_E_122:
NS_E_RDI_122:
NS_E_122_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_122_LB_0
	cmp r11,90
	ja NS_E_122_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_122_LB_0:
	mov rax,0
	ret
NS_E_23:
NS_E_RDI_23:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_27:
	mov rdi,r8
	bt r12,0
NS_E_RDI_27:
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
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err
	mov rax,r15
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_16: dq 0
NS_E_16:
NS_E_RDI_16:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err
	mov rax,r15
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err
	mov rax,QWORD [rdi+8+rsi]
	and rax,0xff
	mov r15,rax
	bts r12,2
	ret
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_119:
NS_E_RDI_119:
NS_E_119_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push r15
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
	pop r15
	pop r14
	cmp rdi,0
	jz NS_E_119_LB_0
	mov r14,rsi
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_119_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_138:
NS_E_RDI_138:
; 	» "-27686gg" _ ⊢ 0' : %_124
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr6 |~ {  } ⊢ %_125 : %_125
 ; {>  %_124~0':_stg }
; 	» 0xr6 _ ⊢ 1' : %_125
	mov rdi,0x6
	mov r14,rdi
	bts r12,1
; » 0xr2 |~ {  } ⊢ %_126 : %_126
 ; {>  %_125~1':_r64 %_124~0':_stg }
; 	» 0xr2 _ ⊢ 2' : %_126
	mov rdi,0x2
	mov r15,rdi
	bts r12,2
; _f14 %_125 ⊢ { %_127 %_128 } : { %_127 %_128 }
 ; {>  %_125~1':_r64 %_126~2':_r64 %_124~0':_stg }
; _f14 1' ⊢ { 1' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_143
	btr r12,0
	jmp LB_144
LB_143:
	bts r12,0
LB_144:
	call NS_E_14
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 1' 3' }
	mov r8,r14
	bt r12,1
	jc LB_145
	btr r12,3
	jmp LB_146
LB_145:
	bts r12,3
LB_146:
	mov r14,r13
	bt r12,0
	jc LB_147
	btr r12,1
	jmp LB_148
LB_147:
	bts r12,1
LB_148:
; pop_iv
	mov r15,QWORD [rsp+8+8*1]
	bt QWORD [rsp],2
	jc LB_141
	btr r12,2
	jmp LB_142
LB_141:
	bts r12,2
LB_142:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_139
	btr r12,0
	jmp LB_140
LB_139:
	bts r12,0
LB_140:
	add rsp,24
; _f15 { %_124 %_126 } ⊢ { %_129 %_130 %_131 } : { %_129 %_130 %_131 }
 ; {>  %_128~3':_stg %_126~2':_r64 %_127~1':_r64 %_124~0':_stg }
; _f15 { 0' 2' } ⊢ { 0' 2' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' } ⊢ { 0' 1' }
	mov r14,r15
	bt r12,2
	jc LB_153
	btr r12,1
	jmp LB_154
LB_153:
	bts r12,1
LB_154:
	call NS_E_15
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 0' 2' 4' }
	mov r9,r15
	bt r12,2
	jc LB_155
	btr r12,4
	jmp LB_156
LB_155:
	bts r12,4
LB_156:
	mov r15,r14
	bt r12,1
	jc LB_157
	btr r12,2
	jmp LB_158
LB_157:
	bts r12,2
LB_158:
; pop_iv
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD [rsp],3
	jc LB_151
	btr r12,3
	jmp LB_152
LB_151:
	bts r12,3
LB_152:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_149
	btr r12,1
	jmp LB_150
LB_149:
	bts r12,1
LB_150:
	add rsp,24
; _f16 { %_128 %_130 %_131 } ⊢ { %_132 %_133 %_134 } : { %_132 %_133 %_134 }
 ; {>  %_131~4':_r64 %_128~3':_stg %_129~0':_stg %_130~2':_r64 %_127~1':_r64 }
; _f16 { 3' 2' 4' } ⊢ { 2' 3' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 3' 2' 4' } ⊢ { 0' 1' 2' }
	mov r13,r8
	bt r12,3
	jc LB_163
	btr r12,0
	jmp LB_164
LB_163:
	bts r12,0
LB_164:
	mov r14,r15
	bt r12,2
	jc LB_165
	btr r12,1
	jmp LB_166
LB_165:
	bts r12,1
LB_166:
	mov r15,r9
	bt r12,4
	jc LB_167
	btr r12,2
	jmp LB_168
LB_167:
	bts r12,2
LB_168:
	call NS_E_16
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 2' 3' 4' }
	mov r8,r14
	bt r12,1
	jc LB_169
	btr r12,3
	jmp LB_170
LB_169:
	bts r12,3
LB_170:
	mov r9,r15
	bt r12,2
	jc LB_171
	btr r12,4
	jmp LB_172
LB_171:
	bts r12,4
LB_172:
	mov r15,r13
	bt r12,0
	jc LB_173
	btr r12,2
	jmp LB_174
LB_173:
	bts r12,2
LB_174:
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_161
	btr r12,1
	jmp LB_162
LB_161:
	bts r12,1
LB_162:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_159
	btr r12,0
	jmp LB_160
LB_159:
	bts r12,0
LB_160:
	add rsp,24
; _f20 { %_129 %_132 } ⊢ { %_135 %_136 } : { %_135 %_136 }
 ; {>  %_132~2':_stg %_133~3':_r64 %_134~4':_r64 %_129~0':_stg %_127~1':_r64 }
; _f20 { 0' 2' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_181
	btr r12,1
	jmp LB_182
LB_181:
	bts r12,1
LB_182:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r14
	bt r12,1
	jc LB_185
	btr r12,3
	jmp LB_186
LB_185:
	bts r12,3
LB_186:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_183
	btr QWORD [rdi],0
	jmp LB_184
LB_183:
	bts QWORD [rdi],0
LB_184:
	mov r8,r15
	bt r12,2
	jc LB_189
	btr r12,3
	jmp LB_190
LB_189:
	bts r12,3
LB_190:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_187
	btr QWORD [rdi],1
	jmp LB_188
LB_187:
	bts QWORD [rdi],1
LB_188:
	call NS_E_20
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 2' }
	mov r14,r13
	bt r12,0
	jc LB_191
	btr r12,1
	jmp LB_192
LB_191:
	bts r12,1
LB_192:
	mov rdi,r14
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_195
	btr r12,3
	jmp LB_196
LB_195:
	bts r12,3
LB_196:
	mov r13,r8
	bt r12,3
	jc LB_193
	btr r12,0
	jmp LB_194
LB_193:
	bts r12,0
LB_194:
	mov rdi,r14
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_199
	btr r12,3
	jmp LB_200
LB_199:
	bts r12,3
LB_200:
	mov r15,r8
	bt r12,3
	jc LB_197
	btr r12,2
	jmp LB_198
LB_197:
	bts r12,2
LB_198:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD [rsp],4
	jc LB_179
	btr r12,4
	jmp LB_180
LB_179:
	bts r12,4
LB_180:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD [rsp],3
	jc LB_177
	btr r12,3
	jmp LB_178
LB_177:
	bts r12,3
LB_178:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_175
	btr r12,1
	jmp LB_176
LB_175:
	bts r12,1
LB_176:
	add rsp,32
; _f20 %_134 ⊢ %_137 : %_137
 ; {>  %_133~3':_r64 %_134~4':_r64 %_136~2':_stg %_127~1':_r64 %_135~0':_stg }
; _f20 4' ⊢ 4'
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
	jc LB_209
	btr r12,0
	jmp LB_210
LB_209:
	bts r12,0
LB_210:
	call NS_E_20
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_211
	btr r12,4
	jmp LB_212
LB_211:
	bts r12,4
LB_212:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_207
	btr r12,3
	jmp LB_208
LB_207:
	bts r12,3
LB_208:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_205
	btr r12,2
	jmp LB_206
LB_205:
	bts r12,2
LB_206:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_203
	btr r12,1
	jmp LB_204
LB_203:
	bts r12,1
LB_204:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_201
	btr r12,0
	jmp LB_202
LB_201:
	bts r12,0
LB_202:
	add rsp,40
; ∎ {  }
 ; {>  %_133~3':_r64 %_137~4':_r64 %_136~2':_stg %_127~1':_r64 %_135~0':_stg }
; 	∎ {  }
	bt r12,3
	jc LB_213
	mov rdi,r8
	call dlt
LB_213:
	bt r12,4
	jc LB_214
	mov rdi,r9
	call dlt
LB_214:
	bt r12,2
	jc LB_215
	mov rdi,r15
	call dlt
LB_215:
	bt r12,1
	jc LB_216
	mov rdi,r14
	call dlt
LB_216:
	bt r12,0
	jc LB_217
	mov rdi,r13
	call dlt
LB_217:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_117:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_117
	NS_E_DYN_120:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_120
	NS_E_DYN_121:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_121
	NS_E_DYN_122:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_122
	NS_E_DYN_123:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_123
	CST_DYN_138:
		dq 0x0001_0001_00_82_ffff
		dq 1
