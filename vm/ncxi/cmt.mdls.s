%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call exec_out
	jmp _end
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
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
NS_E_105:
NS_E_RDI_105:
NS_E_105_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_106
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_106:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_108:
NS_E_RDI_108:
NS_E_108_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_108_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_108_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_109:
NS_E_RDI_109:
NS_E_109_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_109_LB_0
	cmp r11,57
	ja NS_E_109_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_109_LB_0:
	mov rax,0
	ret
NS_E_111:
NS_E_RDI_111:
NS_E_111_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_111_LB_0
	cmp r11,122
	ja NS_E_111_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_111_LB_0:
	mov rax,0
	ret
NS_E_110:
NS_E_RDI_110:
NS_E_110_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_110_LB_0
	cmp r11,90
	ja NS_E_110_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_110_LB_0:
	mov rax,0
	ret
NS_E_28:
	mov rdi,r13
	bt r12,0
NS_E_RDI_28:
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
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rax,[r14]
	lea r8,[r8-1+r13]
	shr rax,32
	cmp r8,rax
	jge err_s8_ge
	mov rax,[r9]
	lea r10,[r10-1+r13]
	shr rax,32
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
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
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
	jge err_s8_ge
	mov rax,r8
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
	jge err_s8_ge
	mov rax,QWORD [rdi+8+rsi]
	and rax,0xff
	mov r8,rax
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
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_107:
NS_E_RDI_107:
NS_E_107_ETR_TBL:
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
	jz NS_E_107_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_107_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_115:
NS_E_RDI_115:
NS_E_115_ETR_TBL:
NS_E_115_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_142
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_142
	jmp LB_143
LB_142:
	jmp LB_134
LB_143:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_135
	btr r12,0
	jmp LB_136
LB_135:
	bts r12,0
LB_136:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_131
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_117 : %_117
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_117
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_117 ⊢ %_118 : %_118
 ; {>  %_117~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_118
 ; {>  %_118~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_129
	btr r12,3
	jmp LB_130
LB_129:
	bts r12,3
LB_130:
	mov r8,0
	bts r12,2
	ret
LB_131:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_133
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_132
LB_133:
	add rsp,8
	ret
LB_134:
	add rsp,16
	pop r14
LB_132:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_105_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_158
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_150
LB_158:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_115_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_163
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_164
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_164:
	jmp LB_150
LB_163:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_153
	btr r12,1
	jmp LB_154
LB_153:
	bts r12,1
LB_154:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_151
	btr r12,0
	jmp LB_152
LB_151:
	bts r12,0
LB_152:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_147
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f39 %_120 ⊢ %_121 : %_121
 ; {>  %_120~1':_r64 %_119~0':_r64 }
	add r14,1
; _some %_121 ⊢ %_122 : %_122
 ; {>  %_121~1':_r64 %_119~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_122
 ; {>  %_122~°0◂1':(_opn)◂(_r64) %_119~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_144
	mov rdi,r13
	call dlt
LB_144:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_145
	btr r12,3
	jmp LB_146
LB_145:
	bts r12,3
LB_146:
	mov r8,0
	bts r12,2
	ret
LB_147:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_149
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_148
LB_149:
	add rsp,8
	ret
LB_150:
	add rsp,32
	pop r14
LB_148:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_116:
NS_E_RDI_116:
NS_E_116_ETR_TBL:
NS_E_116_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; " "
	add r14,1
	cmp r14,r10
	jg LB_179
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_179
	jmp LB_180
LB_179:
	jmp LB_171
LB_180:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_172
	btr r12,0
	jmp LB_173
LB_172:
	bts r12,0
LB_173:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_168
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_123 : %_123
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_123
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_123 ⊢ %_124 : %_124
 ; {>  %_123~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_124
 ; {>  %_124~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_166
	btr r12,3
	jmp LB_167
LB_166:
	bts r12,3
LB_167:
	mov r8,0
	bts r12,2
	ret
LB_168:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_170
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_169
LB_170:
	add rsp,8
	ret
LB_171:
	add rsp,16
	pop r14
LB_169:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_194
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_194
	jmp LB_195
LB_194:
	jmp LB_186
LB_195:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_187
	btr r12,0
	jmp LB_188
LB_187:
	bts r12,0
LB_188:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_183
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_125 : %_125
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_125
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_125 ⊢ %_126 : %_126
 ; {>  %_125~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_126
 ; {>  %_126~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_181
	btr r12,3
	jmp LB_182
LB_181:
	bts r12,3
LB_182:
	mov r8,0
	bts r12,2
	ret
LB_183:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_185
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_184
LB_185:
	add rsp,8
	ret
LB_186:
	add rsp,16
	pop r14
LB_184:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_198
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_127 : %_127
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_127
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_127 ⊢ %_128 : %_128
 ; {>  %_127~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_128
 ; {>  %_128~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_196
	btr r12,3
	jmp LB_197
LB_196:
	bts r12,3
LB_197:
	mov r8,0
	bts r12,2
	ret
LB_198:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_200
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_199
LB_200:
	add rsp,8
	ret
LB_201:
	add rsp,0
	pop r14
LB_199:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
section .data
	NS_E_DYN_105:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_105
	NS_E_DYN_108:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_108
	NS_E_DYN_109:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_109
	NS_E_DYN_110:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_110
	NS_E_DYN_111:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_111
	NS_E_DYN_113:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_114:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_115:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_115
	NS_E_DYN_116:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_116
