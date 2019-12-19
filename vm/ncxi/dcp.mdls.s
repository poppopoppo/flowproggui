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
	call NS_E_1123
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
NS_E_1098:
NS_E_RDI_1098:
NS_E_1098_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_1099
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_1099:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1101:
NS_E_RDI_1101:
NS_E_1101_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_1101_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_1101_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1102:
NS_E_RDI_1102:
NS_E_1102_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_1102_LB_0
	cmp r11,57
	ja NS_E_1102_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1102_LB_0:
	mov rax,0
	ret
NS_E_1104:
NS_E_RDI_1104:
NS_E_1104_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_1104_LB_0
	cmp r11,122
	ja NS_E_1104_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1104_LB_0:
	mov rax,0
	ret
NS_E_1103:
NS_E_RDI_1103:
NS_E_1103_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_1103_LB_0
	cmp r11,90
	ja NS_E_1103_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1103_LB_0:
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
	jc LB_1106
	bt QWORD [rdi],17
	jnc LB_1106
	bt QWORD [rdi],0
	jc LB_1108
	btr r12,2
	clc
	jmp LB_1109
LB_1108:
	bts r12,2
	stc
LB_1109:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_1107
LB_1106:
	btr r12,2
	clc
	call dcp
LB_1107:
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
	jc LB_1105
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_1105:
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
NS_E_1100:
NS_E_RDI_1100:
NS_E_1100_ETR_TBL:
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
	jz NS_E_1100_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_1100_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1123:
NS_E_RDI_1123:
; » 0xr2 |~ {  } ⊢ %_1110 : %_1110
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_1110
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1124
	btr r12,1
	jmp LB_1125
LB_1124:
	bts r12,1
LB_1125:
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
	mov rdi,r14
	bt r12,1
	jc LB_1128
	btr r12,2
	clc
	jmp LB_1129
LB_1128:
	bts r12,2
	stc
LB_1129:
	call dcp
	mov r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1126
	btr r12,1
	clc
	jmp LB_1127
LB_1126:
	bts r12,1
	stc
LB_1127:
	add rsp,16
; _f38 { %_1111 %_1112 } ⊢ { %_1113 %_1114 } : { %_1113 %_1114 }
 ; {>  %_1111~1':_r64 %_1112~2':_r64 }
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
	jc LB_1132
	btr r12,3
	jmp LB_1133
LB_1132:
	bts r12,3
LB_1133:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_1130
	btr QWORD [rdi],0
	jmp LB_1131
LB_1130:
	bts QWORD [rdi],0
LB_1131:
	mov r9,r8
	bt r12,2
	jc LB_1136
	btr r12,3
	jmp LB_1137
LB_1136:
	bts r12,3
LB_1137:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_1134
	btr QWORD [rdi],1
	jmp LB_1135
LB_1134:
	bts QWORD [rdi],1
LB_1135:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_1138
	btr r12,2
	jmp LB_1139
LB_1138:
	bts r12,2
LB_1139:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1142
	btr r12,3
	clc
	jmp LB_1143
LB_1142:
	bts r12,3
	stc
LB_1143:
	mov r13,r9
	bt r12,3
	jc LB_1140
	btr r12,0
	jmp LB_1141
LB_1140:
	bts r12,0
LB_1141:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1146
	btr r12,3
	clc
	jmp LB_1147
LB_1146:
	bts r12,3
	stc
LB_1147:
	mov r14,r9
	bt r12,3
	jc LB_1144
	btr r12,1
	jmp LB_1145
LB_1144:
	bts r12,1
LB_1145:
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
	jc LB_1150
	btr r12,3
	jmp LB_1151
LB_1150:
	bts r12,3
LB_1151:
	mov rdi,r8
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_1148
	btr QWORD [rdi],0
	jmp LB_1149
LB_1148:
	bts QWORD [rdi],0
LB_1149:
	mov r9,r14
	bt r12,1
	jc LB_1154
	btr r12,3
	jmp LB_1155
LB_1154:
	bts r12,3
LB_1155:
	mov rdi,r8
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_1152
	btr QWORD [rdi],1
	jmp LB_1153
LB_1152:
	bts QWORD [rdi],1
LB_1153:
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
	mov rdi,r8
	bt r12,2
	jc LB_1158
	btr r12,3
	clc
	jmp LB_1159
LB_1158:
	bts r12,3
	stc
LB_1159:
	call dcp
	mov r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1156
	btr r12,2
	clc
	jmp LB_1157
LB_1156:
	bts r12,2
	stc
LB_1157:
	add rsp,16
; _f38 { %_1115 %_1116 } ⊢ { %_1117 %_1118 } : { %_1117 %_1118 }
 ; {>  %_1116~3':{ _r64 _r64 } %_1115~2':{ _r64 _r64 } }
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
	jc LB_1162
	btr r12,1
	jmp LB_1163
LB_1162:
	bts r12,1
LB_1163:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_1160
	btr QWORD [rdi],0
	jmp LB_1161
LB_1160:
	bts QWORD [rdi],0
LB_1161:
	mov r14,r9
	bt r12,3
	jc LB_1166
	btr r12,1
	jmp LB_1167
LB_1166:
	bts r12,1
LB_1167:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_1164
	btr QWORD [rdi],1
	jmp LB_1165
LB_1164:
	bts QWORD [rdi],1
LB_1165:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { { 0' 1' } { 2' 3' } }
	mov r10,r13
	bt r12,0
	jc LB_1168
	btr r12,4
	jmp LB_1169
LB_1168:
	bts r12,4
LB_1169:
; 4' ⊢ { { 0' 1' } { 2' 3' } }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1178
	btr r12,5
	clc
	jmp LB_1179
LB_1178:
	bts r12,5
	stc
LB_1179:
; 5' ⊢ { 0' 1' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov r8,rax
	bt QWORD [rdi],0
	jc LB_1172
	btr r12,2
	clc
	jmp LB_1173
LB_1172:
	bts r12,2
	stc
LB_1173:
	mov r13,r8
	bt r12,2
	jc LB_1170
	btr r12,0
	jmp LB_1171
LB_1170:
	bts r12,0
LB_1171:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov r8,rax
	bt QWORD [rdi],1
	jc LB_1176
	btr r12,2
	clc
	jmp LB_1177
LB_1176:
	bts r12,2
	stc
LB_1177:
	mov r14,r8
	bt r12,2
	jc LB_1174
	btr r12,1
	jmp LB_1175
LB_1174:
	bts r12,1
LB_1175:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1188
	btr r12,5
	clc
	jmp LB_1189
LB_1188:
	bts r12,5
	stc
LB_1189:
; 5' ⊢ { 2' 3' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1182
	btr r12,6
	clc
	jmp LB_1183
LB_1182:
	bts r12,6
	stc
LB_1183:
	mov r8,rcx
	bt r12,6
	jc LB_1180
	btr r12,2
	jmp LB_1181
LB_1180:
	bts r12,2
LB_1181:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1186
	btr r12,6
	clc
	jmp LB_1187
LB_1186:
	bts r12,6
	stc
LB_1187:
	mov r9,rcx
	bt r12,6
	jc LB_1184
	btr r12,3
	jmp LB_1185
LB_1184:
	bts r12,3
LB_1185:
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
	jc LB_1192
	btr QWORD [rdi],0
	jmp LB_1193
LB_1192:
	bts QWORD [rdi],0
LB_1193:
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
	jc LB_1194
	btr QWORD [rdi],1
	jmp LB_1195
LB_1194:
	bts QWORD [rdi],1
LB_1195:
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
	jc LB_1196
	btr QWORD [rdi],2
	jmp LB_1197
LB_1196:
	bts QWORD [rdi],2
LB_1197:
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
	jc LB_1198
	btr QWORD [rdi],3
	jmp LB_1199
LB_1198:
	bts QWORD [rdi],3
LB_1199:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_1190
	btr QWORD [rdi],0
	jmp LB_1191
LB_1190:
	bts QWORD [rdi],0
LB_1191:
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
	jc LB_1204
	btr QWORD [rdi],0
	jmp LB_1205
LB_1204:
	bts QWORD [rdi],0
LB_1205:
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
	jc LB_1208
	btr QWORD [rdi],0
	jmp LB_1209
LB_1208:
	bts QWORD [rdi],0
LB_1209:
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
	jc LB_1210
	btr QWORD [rdi],1
	jmp LB_1211
LB_1210:
	bts QWORD [rdi],1
LB_1211:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_1206
	btr QWORD [rdi],1
	jmp LB_1207
LB_1206:
	bts QWORD [rdi],1
LB_1207:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_1202
	btr QWORD [rdi],0
	jmp LB_1203
LB_1202:
	bts QWORD [rdi],0
LB_1203:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_1200
	btr QWORD [rdi],1
	jmp LB_1201
LB_1200:
	bts QWORD [rdi],1
LB_1201:
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
	jc LB_1222
	btr r12,5
	clc
	jmp LB_1223
LB_1222:
	bts r12,5
	stc
LB_1223:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_1220
	btr r12,4
	clc
	jmp LB_1221
LB_1220:
	bts r12,4
	stc
LB_1221:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_1218
	btr r12,3
	clc
	jmp LB_1219
LB_1218:
	bts r12,3
	stc
LB_1219:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1216
	btr r12,2
	clc
	jmp LB_1217
LB_1216:
	bts r12,2
	stc
LB_1217:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1214
	btr r12,1
	clc
	jmp LB_1215
LB_1214:
	bts r12,1
	stc
LB_1215:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1212
	btr r12,0
	clc
	jmp LB_1213
LB_1212:
	bts r12,0
	stc
LB_1213:
	add rsp,48
; _f38 { %_1119 %_1120 } ⊢ { %_1121 %_1122 } : { %_1121 %_1122 }
 ; {>  %_1119~4':{ { { } { } { } { } } { { { } { { } { } } } } } %_1118~{ 2' 3' }:{ _r64 _r64 } %_1120~5':{ { { } { } { } { } } { { { } { { } { } } } } } %_1117~{ 0' 1' }:{ _r64 _r64 } }
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
	jc LB_1234
	btr r12,1
	jmp LB_1235
LB_1234:
	bts r12,1
LB_1235:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_1232
	btr QWORD [rdi],0
	jmp LB_1233
LB_1232:
	bts QWORD [rdi],0
LB_1233:
	mov r14,r11
	bt r12,5
	jc LB_1238
	btr r12,1
	jmp LB_1239
LB_1238:
	bts r12,1
LB_1239:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_1236
	btr QWORD [rdi],1
	jmp LB_1237
LB_1236:
	bts QWORD [rdi],1
LB_1237:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } }
; 0' ⊢ { { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_1262
	btr r12,1
	clc
	jmp LB_1263
LB_1262:
	bts r12,1
	stc
LB_1263:
; 1' ⊢ { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*0]
	mov r8,rax
	bt QWORD [rdi],0
	jc LB_1248
	btr r12,2
	clc
	jmp LB_1249
LB_1248:
	bts r12,2
	stc
LB_1249:
; 2' ⊢ { {  } {  } {  } {  } }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1240
	btr r12,3
	clc
	jmp LB_1241
LB_1240:
	bts r12,3
	stc
LB_1241:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1242
	btr r12,3
	clc
	jmp LB_1243
LB_1242:
	bts r12,3
	stc
LB_1243:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*2]
	mov r9,rax
	bt QWORD [rdi],2
	jc LB_1244
	btr r12,3
	clc
	jmp LB_1245
LB_1244:
	bts r12,3
	stc
LB_1245:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*3]
	mov r9,rax
	bt QWORD [rdi],3
	jc LB_1246
	btr r12,3
	clc
	jmp LB_1247
LB_1246:
	bts r12,3
	stc
LB_1247:
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
	jc LB_1260
	btr r12,2
	clc
	jmp LB_1261
LB_1260:
	bts r12,2
	stc
LB_1261:
; 2' ⊢ { { {  } { {  } {  } } } }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1258
	btr r12,3
	clc
	jmp LB_1259
LB_1258:
	bts r12,3
	stc
LB_1259:
; 3' ⊢ { {  } { {  } {  } } }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1250
	btr r12,4
	clc
	jmp LB_1251
LB_1250:
	bts r12,4
	stc
LB_1251:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1256
	btr r12,4
	clc
	jmp LB_1257
LB_1256:
	bts r12,4
	stc
LB_1257:
; 4' ⊢ { {  } {  } }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1252
	btr r12,5
	clc
	jmp LB_1253
LB_1252:
	bts r12,5
	stc
LB_1253:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1254
	btr r12,5
	clc
	jmp LB_1255
LB_1254:
	bts r12,5
	stc
LB_1255:
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
	jc LB_1286
	btr r12,1
	clc
	jmp LB_1287
LB_1286:
	bts r12,1
	stc
LB_1287:
; 1' ⊢ { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*0]
	mov r8,rax
	bt QWORD [rdi],0
	jc LB_1272
	btr r12,2
	clc
	jmp LB_1273
LB_1272:
	bts r12,2
	stc
LB_1273:
; 2' ⊢ { {  } {  } {  } {  } }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1264
	btr r12,3
	clc
	jmp LB_1265
LB_1264:
	bts r12,3
	stc
LB_1265:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1266
	btr r12,3
	clc
	jmp LB_1267
LB_1266:
	bts r12,3
	stc
LB_1267:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*2]
	mov r9,rax
	bt QWORD [rdi],2
	jc LB_1268
	btr r12,3
	clc
	jmp LB_1269
LB_1268:
	bts r12,3
	stc
LB_1269:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*3]
	mov r9,rax
	bt QWORD [rdi],3
	jc LB_1270
	btr r12,3
	clc
	jmp LB_1271
LB_1270:
	bts r12,3
	stc
LB_1271:
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
	jc LB_1284
	btr r12,2
	clc
	jmp LB_1285
LB_1284:
	bts r12,2
	stc
LB_1285:
; 2' ⊢ { { {  } { {  } {  } } } }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1282
	btr r12,3
	clc
	jmp LB_1283
LB_1282:
	bts r12,3
	stc
LB_1283:
; 3' ⊢ { {  } { {  } {  } } }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1274
	btr r12,4
	clc
	jmp LB_1275
LB_1274:
	bts r12,4
	stc
LB_1275:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1280
	btr r12,4
	clc
	jmp LB_1281
LB_1280:
	bts r12,4
	stc
LB_1281:
; 4' ⊢ { {  } {  } }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1276
	btr r12,5
	clc
	jmp LB_1277
LB_1276:
	bts r12,5
	stc
LB_1277:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1278
	btr r12,5
	clc
	jmp LB_1279
LB_1278:
	bts r12,5
	stc
LB_1279:
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
	jc LB_1230
	btr r12,3
	clc
	jmp LB_1231
LB_1230:
	bts r12,3
	stc
LB_1231:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1228
	btr r12,2
	clc
	jmp LB_1229
LB_1228:
	bts r12,2
	stc
LB_1229:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1226
	btr r12,1
	clc
	jmp LB_1227
LB_1226:
	bts r12,1
	stc
LB_1227:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1224
	btr r12,0
	clc
	jmp LB_1225
LB_1224:
	bts r12,0
	stc
LB_1225:
	add rsp,40
; ∎ {  }
 ; {>  %_1118~{ 2' 3' }:{ _r64 _r64 } %_1117~{ 0' 1' }:{ _r64 _r64 } %_1121~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_1122~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } }
; 	∎ {  }
	bt r12,2
	jc LB_1288
	mov rdi,r8
	call dlt
LB_1288:
	bt r12,3
	jc LB_1289
	mov rdi,r9
	call dlt
LB_1289:
	bt r12,0
	jc LB_1290
	mov rdi,r13
	call dlt
LB_1290:
	bt r12,1
	jc LB_1291
	mov rdi,r14
	call dlt
LB_1291:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	CST_DYN_1123:
		dq 0x0000_0001_00_82_ffff
		dq 1
