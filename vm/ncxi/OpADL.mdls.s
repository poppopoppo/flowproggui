%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_1201
	call NS_E_2037
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
NS_E_1145:
NS_E_RDI_1145:
NS_E_1145_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_1146
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_1146:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1148:
NS_E_RDI_1148:
NS_E_1148_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_1148_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_1148_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1149:
NS_E_RDI_1149:
NS_E_1149_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_1149_LB_0
	cmp r11,57
	ja NS_E_1149_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1149_LB_0:
	mov rax,0
	ret
NS_E_1151:
NS_E_RDI_1151:
NS_E_1151_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_1151_LB_0
	cmp r11,122
	ja NS_E_1151_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1151_LB_0:
	mov rax,0
	ret
NS_E_1150:
NS_E_RDI_1150:
NS_E_1150_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_1150_LB_0
	cmp r11,90
	ja NS_E_1150_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1150_LB_0:
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
NS_E_1147:
NS_E_RDI_1147:
NS_E_1147_ETR_TBL:
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
	jz NS_E_1147_LB_0
	mov r14,rsi
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_1147_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1152:
NS_E_RDI_1152:
NS_E_1152_ETR_TBL:
NS_E_1152_TBL:
	push r14
; _byt
	call NS_E_1145_ETR_TBL
	cmp r15,0
	jz LB_1171
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1152_MTC_0_failed
LB_1171:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	push r13
	push r14
	push LB_1163
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1167
	btr r12,0
	jmp LB_1168
LB_1167:
	bts r12,0
LB_1168:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov r13,rax
; _emt_mov_ptn_to_ptn { 0' } ⊢ { 0' }
; _some %_1154 ⊢ %_1155 : %_1155
 ; {>  %_1154~0':_r64 }
; _some 0' ⊢ 1'◂0'
	mov r14,0
	bts r12,1
; ∎ %_1155
 ; {>  %_1155~1'◂0':(_opn)◂(_r64) }
; 	∎ 1'◂0'
; _emt_mov_ptn_to_ptn 1'◂0' ⊢ 2'◂3'
	mov r15,r14
	bt r12,1
	jc LB_1159
	btr r12,2
	jmp LB_1160
LB_1159:
	bts r12,2
LB_1160:
	mov r8,r13
	bt r12,0
	jc LB_1161
	btr r12,3
	jmp LB_1162
LB_1161:
	bts r12,3
LB_1162:
	ret
LB_1163:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r15,0
	jz LB_1165
	pop r14
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp LB_1164
LB_1165:
	add rsp,8
	ret
NS_E_1152_MTC_0_failed:
	pop r14
LB_1164:
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1153:
NS_E_RDI_1153:
NS_E_1153_ETR_TBL:
NS_E_1153_TBL:
	push r14
; "J"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,74
	jz LB_1184
	jmp NS_E_1153_MTC_0_failed
LB_1184:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	push r13
	push r14
	push LB_1175
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1179
	btr r12,0
	jmp LB_1180
LB_1179:
	bts r12,0
LB_1180:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov r13,rax
; _emt_mov_ptn_to_ptn { 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_1157 : %_1157
 ; {>  %_1156~{  }:{ } }
; _none {  } ⊢ 0'◂{  }
	mov r13,1
	bts r12,0
; ∎ %_1157
 ; {>  %_1156~{  }:{ } %_1157~0'◂{  }:(_opn)◂(t151'(0)) }
; 	∎ 0'◂{  }
; _emt_mov_ptn_to_ptn 0'◂{  } ⊢ 2'◂3'
	mov r15,r13
	bt r12,0
	jc LB_1173
	btr r12,2
	jmp LB_1174
LB_1173:
	bts r12,2
LB_1174:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,3
	ret
LB_1175:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r15,0
	jz LB_1177
	pop r14
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp LB_1176
LB_1177:
	add rsp,8
	ret
NS_E_1153_MTC_0_failed:
	pop r14
LB_1176:
	push r14
	push r13
	push r14
	push LB_1189
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
; _none {  } ⊢ %_1158 : %_1158
 ; {>  }
; _none {  } ⊢ 0'◂{  }
	mov r13,1
	bts r12,0
; ∎ %_1158
 ; {>  %_1158~0'◂{  }:(_opn)◂(t154'(0)) }
; 	∎ 0'◂{  }
; _emt_mov_ptn_to_ptn 0'◂{  } ⊢ 2'◂3'
	mov r15,r13
	bt r12,0
	jc LB_1187
	btr r12,2
	jmp LB_1188
LB_1187:
	bts r12,2
LB_1188:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,3
	ret
LB_1189:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r15,0
	jz LB_1191
	pop r14
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp LB_1190
LB_1191:
	add rsp,8
	ret
NS_E_1153_MTC_1_failed:
	pop r14
LB_1190:
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1201:
NS_E_RDI_1201:
; » _^ ..
	mov rax,2
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "JJ"
	mov rsi,0x_00_00_00_00_00_00_4a_4a
	mov QWORD [rdi+8*0],rsi
	add rdi,2
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_1194 : %_1194
 ; {>  %_1193~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_1194
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f1153 { %_1193 %_1194 } ⊢ { %_1195 %_1196 %_1197 } : { %_1195 %_1196 %_1197 }
 ; {>  %_1194~1':_r64 %_1193~0':_stg }
; _f1153 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 0' 1' }
	call NS_E_1153
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r9,r15
	bt r12,2
	jc LB_1202
	btr r12,4
	jmp LB_1203
LB_1202:
	bts r12,4
LB_1203:
	mov r15,r8
	bt r12,3
	jc LB_1206
	btr r12,2
	jmp LB_1207
LB_1206:
	bts r12,2
LB_1207:
	mov rsi,1
	bt r12,2
	jc LB_1204
	mov rsi,0
	bt r15,0
	jc LB_1204
	jmp LB_1205
LB_1204:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r15
	mov r15,rax
	btr r12,2
LB_1205:
	mov rax,r9
	shl rax,56
	or rax,1
	mov rdi,rax
	or r15,rdi
; pop_iv
	add rsp,8
; _f20 { %_1195 %_1196 %_1197 } ⊢ { %_1198 %_1199 %_1200 } : { %_1198 %_1199 %_1200 }
 ; {>  %_1196~1':_r64 %_1197~2':(_opn)◂(t168'(0)) %_1195~0':_stg }
; _f20 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1208
	btr r12,3
	jmp LB_1209
LB_1208:
	bts r12,3
LB_1209:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,3
	jc LB_1212
	btr r12,4
	jmp LB_1213
LB_1212:
	bts r12,4
LB_1213:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_1210
	btr QWORD [rdi],0
	jmp LB_1211
LB_1210:
	bts QWORD [rdi],0
LB_1211:
	mov r9,r14
	bt r12,1
	jc LB_1216
	btr r12,4
	jmp LB_1217
LB_1216:
	bts r12,4
LB_1217:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_1214
	btr QWORD [rdi],1
	jmp LB_1215
LB_1214:
	bts QWORD [rdi],1
LB_1215:
	mov r9,r15
	bt r12,2
	jc LB_1220
	btr r12,4
	jmp LB_1221
LB_1220:
	bts r12,4
LB_1221:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_1218
	btr QWORD [rdi],2
	jmp LB_1219
LB_1218:
	bts QWORD [rdi],2
LB_1219:
	call NS_E_20
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' 2' }
	mov r8,r13
	bt r12,0
	jc LB_1222
	btr r12,3
	jmp LB_1223
LB_1222:
	bts r12,3
LB_1223:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_1226
	btr r12,4
	jmp LB_1227
LB_1226:
	bts r12,4
LB_1227:
	mov r13,r9
	bt r12,4
	jc LB_1224
	btr r12,0
	jmp LB_1225
LB_1224:
	bts r12,0
LB_1225:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_1230
	btr r12,4
	jmp LB_1231
LB_1230:
	bts r12,4
LB_1231:
	mov r14,r9
	bt r12,4
	jc LB_1228
	btr r12,1
	jmp LB_1229
LB_1228:
	bts r12,1
LB_1229:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_1234
	btr r12,4
	jmp LB_1235
LB_1234:
	bts r12,4
LB_1235:
	mov r15,r9
	bt r12,4
	jc LB_1232
	btr r12,2
	jmp LB_1233
LB_1232:
	bts r12,2
LB_1233:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_1199~1':_r64 %_1198~0':_stg %_1200~2':(_opn)◂(t173'(0)) }
; 	∎ {  }
	bt r12,1
	jc LB_1236
	mov rdi,r14
	call dlt
LB_1236:
	bt r12,0
	jc LB_1237
	mov rdi,r13
	call dlt
LB_1237:
	bt r12,2
	jc LB_1238
	mov rdi,r15
	call dlt
LB_1238:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_1240:
NS_E_RDI_1240:
NS_E_1240_ETR_TBL:
NS_E_1240_TBL:
; c0
	push r14
; glb_etr
	call NS_E_1242_ETR_TBL
	cmp r15,0
	jz LB_1329
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1240_MTC_0_failed
LB_1329:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; glb_etr_lst
	call NS_E_1240_ETR_TBL
	cmp r15,0
	jz LB_1333
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1334
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1334:
	jmp NS_E_1240_MTC_0_failed
LB_1333:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1324
	btr QWORD [rdi],1
LB_1324:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1325
	btr QWORD [rdi],0
LB_1325:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1240_MTC_0_failed:
	pop r14
; c1
	push r14
	add rsp,8
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
NS_E_1240_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1242:
NS_E_RDI_1242:
NS_E_1242_ETR_TBL:
NS_E_1242_TBL:
; c0
	push r14
; mdl_etr
	call NS_E_1244_ETR_TBL
	cmp r15,0
	jz LB_1358
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1242_MTC_0_failed
LB_1358:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1354
	btr QWORD [rdi],0
LB_1354:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1242_MTC_0_failed:
	pop r14
; c1
	push r14
; cst_etr
	call NS_E_1246_ETR_TBL
	cmp r15,0
	jz LB_1352
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1242_MTC_1_failed
LB_1352:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1348
	btr QWORD [rdi],0
LB_1348:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1242_MTC_1_failed:
	pop r14
; c2
	push r14
; op_etr
	call NS_E_1248_ETR_TBL
	cmp r15,0
	jz LB_1346
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1242_MTC_2_failed
LB_1346:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1342
	btr QWORD [rdi],0
LB_1342:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1242_MTC_2_failed:
	pop r14
; c3
	push r14
; dta_etr
	call NS_E_1250_ETR_TBL
	cmp r15,0
	jz LB_1340
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1242_MTC_3_failed
LB_1340:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1336
	btr QWORD [rdi],0
LB_1336:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1242_MTC_3_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1244:
NS_E_RDI_1244:
NS_E_1244_ETR_TBL:
NS_E_1244_TBL:
; c0
	push r14
; "\194\167\194\167"
	jmp LB_1403
LB_1402:
	add r14,1
LB_1403:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1402
	cmp rax,10
	jz LB_1402
	cmp rax,32
	jz LB_1402
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_1405
	jmp NS_E_1244_MTC_0_failed
LB_1405:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_1406
	jmp NS_E_1244_MTC_0_failed
LB_1406:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_1407
	jmp NS_E_1244_MTC_0_failed
LB_1407:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_1408
	jmp NS_E_1244_MTC_0_failed
LB_1408:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_1415
LB_1414:
	add r14,1
LB_1415:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1414
	cmp rax,10
	jz LB_1414
	cmp rax,32
	jz LB_1414
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1416
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1417
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1417:
	jmp NS_E_1244_MTC_0_failed
LB_1416:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; glb_etr_lst
	jmp LB_1420
LB_1419:
	add r14,1
LB_1420:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1419
	cmp rax,10
	jz LB_1419
	cmp rax,32
	jz LB_1419
	call NS_E_1240_ETR_TBL
	cmp r15,0
	jz LB_1421
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1422
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1422:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1423
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1423:
	jmp NS_E_1244_MTC_0_failed
LB_1421:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; "\226\136\142\226\136\142"
	jmp LB_1426
LB_1425:
	add r14,1
LB_1426:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1425
	cmp rax,10
	jz LB_1425
	cmp rax,32
	jz LB_1425
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_1428
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1455
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1455:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1456
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1456:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1457
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1457:
	jmp NS_E_1244_MTC_0_failed
LB_1428:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_1429
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1451
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1451:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1452
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1452:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1453
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1453:
	jmp NS_E_1244_MTC_0_failed
LB_1429:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_1430
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1447
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1447:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1448
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1448:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1449
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1449:
	jmp NS_E_1244_MTC_0_failed
LB_1430:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,226
	jz LB_1431
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1443
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1443:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1444
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1444:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1445
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1445:
	jmp NS_E_1244_MTC_0_failed
LB_1431:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+4]
	cmp al,136
	jz LB_1432
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1439
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1439:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1440
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1440:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1441
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1441:
	jmp NS_E_1244_MTC_0_failed
LB_1432:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+5]
	cmp al,142
	jz LB_1433
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1435
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1435:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1436
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1436:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1437
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1437:
	jmp NS_E_1244_MTC_0_failed
LB_1433:
	add r14,6
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*3],0
	mov QWORD [prs_vct+8*1+16*3],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_1397
	btr QWORD [rdi],3
LB_1397:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1398
	btr QWORD [rdi],2
LB_1398:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1399
	btr QWORD [rdi],1
LB_1399:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1400
	btr QWORD [rdi],0
LB_1400:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1244_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\167\194\167"
	jmp LB_1366
LB_1365:
	add r14,1
LB_1366:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1365
	cmp rax,10
	jz LB_1365
	cmp rax,32
	jz LB_1365
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_1368
	jmp NS_E_1244_MTC_1_failed
LB_1368:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_1369
	jmp NS_E_1244_MTC_1_failed
LB_1369:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_1370
	jmp NS_E_1244_MTC_1_failed
LB_1370:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_1371
	jmp NS_E_1244_MTC_1_failed
LB_1371:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_1378
LB_1377:
	add r14,1
LB_1378:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1377
	cmp rax,10
	jz LB_1377
	cmp rax,32
	jz LB_1377
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1379
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1380
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1380:
	jmp NS_E_1244_MTC_1_failed
LB_1379:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_1383
LB_1382:
	add r14,1
LB_1383:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1382
	cmp rax,10
	jz LB_1382
	cmp rax,32
	jz LB_1382
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_1385
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1387
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1387:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1388
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1388:
	jmp NS_E_1244_MTC_1_failed
LB_1385:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_1391
LB_1390:
	add r14,1
LB_1391:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1390
	cmp rax,10
	jz LB_1390
	cmp rax,32
	jz LB_1390
	call NS_E_1258_ETR_TBL
	cmp r15,0
	jz LB_1392
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1393
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1393:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1394
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1394:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1395
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1395:
	jmp NS_E_1244_MTC_1_failed
LB_1392:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_1360
	btr QWORD [rdi],3
LB_1360:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1361
	btr QWORD [rdi],2
LB_1361:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1362
	btr QWORD [rdi],1
LB_1362:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1363
	btr QWORD [rdi],0
LB_1363:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1244_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1246:
NS_E_RDI_1246:
NS_E_1246_ETR_TBL:
NS_E_1246_TBL:
; c0
	push r14
; "\194\167"
	jmp LB_1498
LB_1497:
	add r14,1
LB_1498:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1497
	cmp rax,10
	jz LB_1497
	cmp rax,32
	jz LB_1497
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_1500
	jmp NS_E_1246_MTC_0_failed
LB_1500:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_1501
	jmp NS_E_1246_MTC_0_failed
LB_1501:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_1506
LB_1505:
	add r14,1
LB_1506:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1505
	cmp rax,10
	jz LB_1505
	cmp rax,32
	jz LB_1505
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1507
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1508
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1508:
	jmp NS_E_1246_MTC_0_failed
LB_1507:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\194\171"
	jmp LB_1511
LB_1510:
	add r14,1
LB_1511:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1510
	cmp rax,10
	jz LB_1510
	cmp rax,32
	jz LB_1510
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_1513
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1519
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1519:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1520
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1520:
	jmp NS_E_1246_MTC_0_failed
LB_1513:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,171
	jz LB_1514
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1516
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1516:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1517
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1517:
	jmp NS_E_1246_MTC_0_failed
LB_1514:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; op_lines
	jmp LB_1523
LB_1522:
	add r14,1
LB_1523:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1522
	cmp rax,10
	jz LB_1522
	cmp rax,32
	jz LB_1522
	call NS_E_1264_ETR_TBL
	cmp r15,0
	jz LB_1524
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1525
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1525:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1526
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1526:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1527
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1527:
	jmp NS_E_1246_MTC_0_failed
LB_1524:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_1492
	btr QWORD [rdi],3
LB_1492:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1493
	btr QWORD [rdi],2
LB_1493:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1494
	btr QWORD [rdi],1
LB_1494:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1495
	btr QWORD [rdi],0
LB_1495:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1246_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\167"
	jmp LB_1465
LB_1464:
	add r14,1
LB_1465:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1464
	cmp rax,10
	jz LB_1464
	cmp rax,32
	jz LB_1464
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_1467
	jmp NS_E_1246_MTC_1_failed
LB_1467:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_1468
	jmp NS_E_1246_MTC_1_failed
LB_1468:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_1473
LB_1472:
	add r14,1
LB_1473:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1472
	cmp rax,10
	jz LB_1472
	cmp rax,32
	jz LB_1472
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1474
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1475
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1475:
	jmp NS_E_1246_MTC_1_failed
LB_1474:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_1478
LB_1477:
	add r14,1
LB_1478:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1477
	cmp rax,10
	jz LB_1477
	cmp rax,32
	jz LB_1477
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_1480
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1482
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1482:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1483
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1483:
	jmp NS_E_1246_MTC_1_failed
LB_1480:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; cst
	jmp LB_1486
LB_1485:
	add r14,1
LB_1486:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1485
	cmp rax,10
	jz LB_1485
	cmp rax,32
	jz LB_1485
	call NS_E_1252_ETR_TBL
	cmp r15,0
	jz LB_1487
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1488
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1488:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1489
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1489:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1490
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1490:
	jmp NS_E_1246_MTC_1_failed
LB_1487:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_1459
	btr QWORD [rdi],3
LB_1459:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1460
	btr QWORD [rdi],2
LB_1460:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1461
	btr QWORD [rdi],1
LB_1461:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1462
	btr QWORD [rdi],0
LB_1462:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1246_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1248:
NS_E_RDI_1248:
NS_E_1248_ETR_TBL:
NS_E_1248_TBL:
; c0
	push r14
; "\194\167"
	jmp LB_1568
LB_1567:
	add r14,1
LB_1568:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1567
	cmp rax,10
	jz LB_1567
	cmp rax,32
	jz LB_1567
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_1570
	jmp NS_E_1248_MTC_0_failed
LB_1570:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_1571
	jmp NS_E_1248_MTC_0_failed
LB_1571:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_1576
LB_1575:
	add r14,1
LB_1576:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1575
	cmp rax,10
	jz LB_1575
	cmp rax,32
	jz LB_1575
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1577
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1578
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1578:
	jmp NS_E_1248_MTC_0_failed
LB_1577:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; reg_ptn
	jmp LB_1581
LB_1580:
	add r14,1
LB_1581:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1580
	cmp rax,10
	jz LB_1580
	cmp rax,32
	jz LB_1580
	call NS_E_1276_ETR_TBL
	cmp r15,0
	jz LB_1582
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1583
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1583:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1584
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1584:
	jmp NS_E_1248_MTC_0_failed
LB_1582:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; op_lines
	jmp LB_1587
LB_1586:
	add r14,1
LB_1587:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1586
	cmp rax,10
	jz LB_1586
	cmp rax,32
	jz LB_1586
	call NS_E_1264_ETR_TBL
	cmp r15,0
	jz LB_1588
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1589
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1589:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1590
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1590:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1591
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1591:
	jmp NS_E_1248_MTC_0_failed
LB_1588:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_1562
	btr QWORD [rdi],3
LB_1562:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1563
	btr QWORD [rdi],2
LB_1563:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1564
	btr QWORD [rdi],1
LB_1564:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1565
	btr QWORD [rdi],0
LB_1565:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1248_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\167"
	jmp LB_1535
LB_1534:
	add r14,1
LB_1535:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1534
	cmp rax,10
	jz LB_1534
	cmp rax,32
	jz LB_1534
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_1537
	jmp NS_E_1248_MTC_1_failed
LB_1537:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_1538
	jmp NS_E_1248_MTC_1_failed
LB_1538:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_1543
LB_1542:
	add r14,1
LB_1543:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1542
	cmp rax,10
	jz LB_1542
	cmp rax,32
	jz LB_1542
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1544
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1545
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1545:
	jmp NS_E_1248_MTC_1_failed
LB_1544:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_1548
LB_1547:
	add r14,1
LB_1548:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1547
	cmp rax,10
	jz LB_1547
	cmp rax,32
	jz LB_1547
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_1550
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1552
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1552:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1553
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1553:
	jmp NS_E_1248_MTC_1_failed
LB_1550:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_1556
LB_1555:
	add r14,1
LB_1556:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1555
	cmp rax,10
	jz LB_1555
	cmp rax,32
	jz LB_1555
	call NS_E_1258_ETR_TBL
	cmp r15,0
	jz LB_1557
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1558
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1558:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1559
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1559:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1560
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1560:
	jmp NS_E_1248_MTC_1_failed
LB_1557:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_1529
	btr QWORD [rdi],3
LB_1529:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1530
	btr QWORD [rdi],2
LB_1530:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1531
	btr QWORD [rdi],1
LB_1531:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1532
	btr QWORD [rdi],0
LB_1532:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1248_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1250:
NS_E_RDI_1250:
NS_E_1250_ETR_TBL:
NS_E_1250_TBL:
; c0
	push r14
; "\194\182"
	jmp LB_1631
LB_1630:
	add r14,1
LB_1631:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1630
	cmp rax,10
	jz LB_1630
	cmp rax,32
	jz LB_1630
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_1633
	jmp NS_E_1250_MTC_0_failed
LB_1633:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_1634
	jmp NS_E_1250_MTC_0_failed
LB_1634:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_1639
LB_1638:
	add r14,1
LB_1639:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1638
	cmp rax,10
	jz LB_1638
	cmp rax,32
	jz LB_1638
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1640
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1641
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1641:
	jmp NS_E_1250_MTC_0_failed
LB_1640:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; dta_def
	jmp LB_1644
LB_1643:
	add r14,1
LB_1644:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1643
	cmp rax,10
	jz LB_1643
	cmp rax,32
	jz LB_1643
	call NS_E_1260_ETR_TBL
	cmp r15,0
	jz LB_1645
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1646
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1646:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1647
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1647:
	jmp NS_E_1250_MTC_0_failed
LB_1645:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1626
	btr QWORD [rdi],2
LB_1626:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1627
	btr QWORD [rdi],1
LB_1627:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1628
	btr QWORD [rdi],0
LB_1628:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1250_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\182"
	jmp LB_1599
LB_1598:
	add r14,1
LB_1599:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1598
	cmp rax,10
	jz LB_1598
	cmp rax,32
	jz LB_1598
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_1601
	jmp NS_E_1250_MTC_1_failed
LB_1601:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_1602
	jmp NS_E_1250_MTC_1_failed
LB_1602:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_1607
LB_1606:
	add r14,1
LB_1607:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1606
	cmp rax,10
	jz LB_1606
	cmp rax,32
	jz LB_1606
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1608
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1609
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1609:
	jmp NS_E_1250_MTC_1_failed
LB_1608:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_1612
LB_1611:
	add r14,1
LB_1612:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1611
	cmp rax,10
	jz LB_1611
	cmp rax,32
	jz LB_1611
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_1614
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1616
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1616:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1617
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1617:
	jmp NS_E_1250_MTC_1_failed
LB_1614:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_1620
LB_1619:
	add r14,1
LB_1620:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1619
	cmp rax,10
	jz LB_1619
	cmp rax,32
	jz LB_1619
	call NS_E_1258_ETR_TBL
	cmp r15,0
	jz LB_1621
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1622
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1622:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1623
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1623:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1624
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1624:
	jmp NS_E_1250_MTC_1_failed
LB_1621:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_1593
	btr QWORD [rdi],3
LB_1593:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1594
	btr QWORD [rdi],2
LB_1594:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1595
	btr QWORD [rdi],1
LB_1595:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1596
	btr QWORD [rdi],0
LB_1596:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1250_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1252:
NS_E_RDI_1252:
NS_E_1252_ETR_TBL:
NS_E_1252_TBL:
; c0
	push r14
; "0xr0"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,48
	jz LB_1654
	jmp NS_E_1252_MTC_0_failed
LB_1654:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,120
	jz LB_1655
	jmp NS_E_1252_MTC_0_failed
LB_1655:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,114
	jz LB_1656
	jmp NS_E_1252_MTC_0_failed
LB_1656:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,48
	jz LB_1657
	jmp NS_E_1252_MTC_0_failed
LB_1657:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1649
	btr QWORD [rdi],0
LB_1649:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1252_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1254:
NS_E_RDI_1254:
NS_E_1254_ETR_TBL:
NS_E_1254_TBL:
; c0
	push r14
; cha
	call NS_E_1256_ETR_TBL
	cmp r15,0
	jz LB_1669
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1254_MTC_0_failed
LB_1669:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; word
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1673
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1674
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1674:
	jmp NS_E_1254_MTC_0_failed
LB_1673:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1664
	btr QWORD [rdi],1
LB_1664:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1665
	btr QWORD [rdi],0
LB_1665:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1254_MTC_0_failed:
	pop r14
; c1
	push r14
	add rsp,8
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
NS_E_1254_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1256:
NS_E_RDI_1256:
NS_E_1256_ETR_TBL:
NS_E_1256_TBL:
; c0
	push r14
; "a"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,97
	jz LB_1697
	jmp NS_E_1256_MTC_0_failed
LB_1697:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1692
	btr QWORD [rdi],0
LB_1692:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1256_MTC_0_failed:
	pop r14
; c1
	push r14
; "b"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,98
	jz LB_1689
	jmp NS_E_1256_MTC_1_failed
LB_1689:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1684
	btr QWORD [rdi],0
LB_1684:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1256_MTC_1_failed:
	pop r14
; c2
	push r14
; "c"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,99
	jz LB_1681
	jmp NS_E_1256_MTC_2_failed
LB_1681:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1676
	btr QWORD [rdi],0
LB_1676:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1256_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1258:
NS_E_RDI_1258:
NS_E_1258_ETR_TBL:
NS_E_1258_TBL:
; c0
	push r14
; word
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1712
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1258_MTC_0_failed
LB_1712:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "."
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,46
	jz LB_1717
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1719
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1719:
	jmp NS_E_1258_MTC_0_failed
LB_1717:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; name
	call NS_E_1258_ETR_TBL
	cmp r15,0
	jz LB_1723
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1724
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1724:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1725
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1725:
	jmp NS_E_1258_MTC_0_failed
LB_1723:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1706
	btr QWORD [rdi],2
LB_1706:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1707
	btr QWORD [rdi],1
LB_1707:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1708
	btr QWORD [rdi],0
LB_1708:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1258_MTC_0_failed:
	pop r14
; c1
	push r14
; word
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1704
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1258_MTC_1_failed
LB_1704:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1700
	btr QWORD [rdi],0
LB_1700:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1258_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1260:
NS_E_RDI_1260:
NS_E_1260_ETR_TBL:
NS_E_1260_TBL:
; c0
	push r14
; dta_def_coprd
	call NS_E_1262_ETR_TBL
	cmp r15,0
	jz LB_1731
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1260_MTC_0_failed
LB_1731:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1727
	btr QWORD [rdi],0
LB_1727:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1260_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1262:
NS_E_RDI_1262:
NS_E_1262_ETR_TBL:
NS_E_1262_TBL:
; c0
	push r14
; "\226\136\144"
	jmp LB_1774
LB_1773:
	add r14,1
LB_1774:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1773
	cmp rax,10
	jz LB_1773
	cmp rax,32
	jz LB_1773
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_1776
	jmp NS_E_1262_MTC_0_failed
LB_1776:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_1777
	jmp NS_E_1262_MTC_0_failed
LB_1777:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_1778
	jmp NS_E_1262_MTC_0_failed
LB_1778:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_1784
LB_1783:
	add r14,1
LB_1784:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1783
	cmp rax,10
	jz LB_1783
	cmp rax,32
	jz LB_1783
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1785
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1786
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1786:
	jmp NS_E_1262_MTC_0_failed
LB_1785:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_1789
LB_1788:
	add r14,1
LB_1789:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1788
	cmp rax,10
	jz LB_1788
	cmp rax,32
	jz LB_1788
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_1791
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1793
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1793:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1794
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1794:
	jmp NS_E_1262_MTC_0_failed
LB_1791:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_1797
LB_1796:
	add r14,1
LB_1797:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1796
	cmp rax,10
	jz LB_1796
	cmp rax,32
	jz LB_1796
	call NS_E_1268_ETR_TBL
	cmp r15,0
	jz LB_1798
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1799
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1799:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1800
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1800:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1801
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1801:
	jmp NS_E_1262_MTC_0_failed
LB_1798:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_1768
	btr QWORD [rdi],3
LB_1768:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1769
	btr QWORD [rdi],2
LB_1769:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1770
	btr QWORD [rdi],1
LB_1770:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1771
	btr QWORD [rdi],0
LB_1771:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1262_MTC_0_failed:
	pop r14
; c1
	push r14
; "\226\136\144"
	jmp LB_1739
LB_1738:
	add r14,1
LB_1739:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1738
	cmp rax,10
	jz LB_1738
	cmp rax,32
	jz LB_1738
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_1741
	jmp NS_E_1262_MTC_1_failed
LB_1741:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_1742
	jmp NS_E_1262_MTC_1_failed
LB_1742:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_1743
	jmp NS_E_1262_MTC_1_failed
LB_1743:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_1749
LB_1748:
	add r14,1
LB_1749:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1748
	cmp rax,10
	jz LB_1748
	cmp rax,32
	jz LB_1748
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1750
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1751
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1751:
	jmp NS_E_1262_MTC_1_failed
LB_1750:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_1754
LB_1753:
	add r14,1
LB_1754:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1753
	cmp rax,10
	jz LB_1753
	cmp rax,32
	jz LB_1753
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_1756
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1758
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1758:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1759
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1759:
	jmp NS_E_1262_MTC_1_failed
LB_1756:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_1762
LB_1761:
	add r14,1
LB_1762:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1761
	cmp rax,10
	jz LB_1761
	cmp rax,32
	jz LB_1761
	call NS_E_1268_ETR_TBL
	cmp r15,0
	jz LB_1763
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1764
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1764:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1765
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1765:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1766
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1766:
	jmp NS_E_1262_MTC_1_failed
LB_1763:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_1733
	btr QWORD [rdi],3
LB_1733:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1734
	btr QWORD [rdi],2
LB_1734:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1735
	btr QWORD [rdi],1
LB_1735:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1736
	btr QWORD [rdi],0
LB_1736:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1262_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1264:
NS_E_RDI_1264:
NS_E_1264_ETR_TBL:
NS_E_1264_TBL:
; c0
	push r14
; op
	jmp LB_1827
LB_1826:
	add r14,1
LB_1827:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1826
	cmp rax,10
	jz LB_1826
	cmp rax,32
	jz LB_1826
	call NS_E_1266_ETR_TBL
	cmp r15,0
	jz LB_1828
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1264_MTC_0_failed
LB_1828:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn
	jmp LB_1831
LB_1830:
	add r14,1
LB_1831:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1830
	cmp rax,10
	jz LB_1830
	cmp rax,32
	jz LB_1830
	call NS_E_1276_ETR_TBL
	cmp r15,0
	jz LB_1832
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1833
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1833:
	jmp NS_E_1264_MTC_0_failed
LB_1832:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\226\138\162"
	jmp LB_1836
LB_1835:
	add r14,1
LB_1836:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1835
	cmp rax,10
	jz LB_1835
	cmp rax,32
	jz LB_1835
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_1838
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1848
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1848:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1849
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1849:
	jmp NS_E_1264_MTC_0_failed
LB_1838:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,138
	jz LB_1839
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1845
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1845:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1846
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1846:
	jmp NS_E_1264_MTC_0_failed
LB_1839:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,162
	jz LB_1840
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1842
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1842:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1843
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1843:
	jmp NS_E_1264_MTC_0_failed
LB_1840:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; reg_ptn
	jmp LB_1852
LB_1851:
	add r14,1
LB_1852:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1851
	cmp rax,10
	jz LB_1851
	cmp rax,32
	jz LB_1851
	call NS_E_1276_ETR_TBL
	cmp r15,0
	jz LB_1853
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1854
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1854:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1855
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1855:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1856
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1856:
	jmp NS_E_1264_MTC_0_failed
LB_1853:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_1821
	btr QWORD [rdi],3
LB_1821:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1822
	btr QWORD [rdi],2
LB_1822:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1823
	btr QWORD [rdi],1
LB_1823:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1824
	btr QWORD [rdi],0
LB_1824:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1264_MTC_0_failed:
	pop r14
; c1
	push r14
; "\226\136\142"
	jmp LB_1807
LB_1806:
	add r14,1
LB_1807:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1806
	cmp rax,10
	jz LB_1806
	cmp rax,32
	jz LB_1806
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_1809
	jmp NS_E_1264_MTC_1_failed
LB_1809:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_1810
	jmp NS_E_1264_MTC_1_failed
LB_1810:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_1811
	jmp NS_E_1264_MTC_1_failed
LB_1811:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn
	jmp LB_1817
LB_1816:
	add r14,1
LB_1817:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1816
	cmp rax,10
	jz LB_1816
	cmp rax,32
	jz LB_1816
	call NS_E_1276_ETR_TBL
	cmp r15,0
	jz LB_1818
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1819
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1819:
	jmp NS_E_1264_MTC_1_failed
LB_1818:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1803
	btr QWORD [rdi],1
LB_1803:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1804
	btr QWORD [rdi],0
LB_1804:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1264_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1266:
NS_E_RDI_1266:
NS_E_1266_ETR_TBL:
NS_E_1266_TBL:
; c0
	push r14
; name
	jmp LB_1877
LB_1876:
	add r14,1
LB_1877:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1876
	cmp rax,10
	jz LB_1876
	cmp rax,32
	jz LB_1876
	call NS_E_1258_ETR_TBL
	cmp r15,0
	jz LB_1878
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1266_MTC_0_failed
LB_1878:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1874
	btr QWORD [rdi],0
LB_1874:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1266_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\187"
	jmp LB_1862
LB_1861:
	add r14,1
LB_1862:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1861
	cmp rax,10
	jz LB_1861
	cmp rax,32
	jz LB_1861
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_1864
	jmp NS_E_1266_MTC_1_failed
LB_1864:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,187
	jz LB_1865
	jmp NS_E_1266_MTC_1_failed
LB_1865:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; cst
	jmp LB_1870
LB_1869:
	add r14,1
LB_1870:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1869
	cmp rax,10
	jz LB_1869
	cmp rax,32
	jz LB_1869
	call NS_E_1252_ETR_TBL
	cmp r15,0
	jz LB_1871
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1872
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1872:
	jmp NS_E_1266_MTC_1_failed
LB_1871:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1858
	btr QWORD [rdi],1
LB_1858:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1859
	btr QWORD [rdi],0
LB_1859:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1266_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1268:
NS_E_RDI_1268:
NS_E_1268_ETR_TBL:
NS_E_1268_TBL:
; c0
	push r14
; type_imp
	call NS_E_1270_ETR_TBL
	cmp r15,0
	jz LB_1884
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1268_MTC_0_failed
LB_1884:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1880
	btr QWORD [rdi],0
LB_1880:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1268_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1270:
NS_E_RDI_1270:
NS_E_1270_ETR_TBL:
NS_E_1270_TBL:
; c0
	push r14
; type_app
	jmp LB_1897
LB_1896:
	add r14,1
LB_1897:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1896
	cmp rax,10
	jz LB_1896
	cmp rax,32
	jz LB_1896
	call NS_E_1272_ETR_TBL
	cmp r15,0
	jz LB_1898
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1270_MTC_0_failed
LB_1898:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\134\146"
	jmp LB_1901
LB_1900:
	add r14,1
LB_1901:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1900
	cmp rax,10
	jz LB_1900
	cmp rax,32
	jz LB_1900
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_1903
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1911
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1911:
	jmp NS_E_1270_MTC_0_failed
LB_1903:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,134
	jz LB_1904
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1909
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1909:
	jmp NS_E_1270_MTC_0_failed
LB_1904:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,146
	jz LB_1905
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1907
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1907:
	jmp NS_E_1270_MTC_0_failed
LB_1905:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_imp
	jmp LB_1914
LB_1913:
	add r14,1
LB_1914:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1913
	cmp rax,10
	jz LB_1913
	cmp rax,32
	jz LB_1913
	call NS_E_1270_ETR_TBL
	cmp r15,0
	jz LB_1915
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1916
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1916:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1917
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1917:
	jmp NS_E_1270_MTC_0_failed
LB_1915:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1892
	btr QWORD [rdi],2
LB_1892:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1893
	btr QWORD [rdi],1
LB_1893:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1894
	btr QWORD [rdi],0
LB_1894:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1270_MTC_0_failed:
	pop r14
; c1
	push r14
; type_app
	jmp LB_1889
LB_1888:
	add r14,1
LB_1889:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1888
	cmp rax,10
	jz LB_1888
	cmp rax,32
	jz LB_1888
	call NS_E_1272_ETR_TBL
	cmp r15,0
	jz LB_1890
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1270_MTC_1_failed
LB_1890:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1886
	btr QWORD [rdi],0
LB_1886:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1270_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1272:
NS_E_RDI_1272:
NS_E_1272_ETR_TBL:
NS_E_1272_TBL:
; c0
	push r14
; type_atm
	jmp LB_1930
LB_1929:
	add r14,1
LB_1930:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1929
	cmp rax,10
	jz LB_1929
	cmp rax,32
	jz LB_1929
	call NS_E_1274_ETR_TBL
	cmp r15,0
	jz LB_1931
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1272_MTC_0_failed
LB_1931:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\151\130"
	jmp LB_1934
LB_1933:
	add r14,1
LB_1934:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1933
	cmp rax,10
	jz LB_1933
	cmp rax,32
	jz LB_1933
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_1936
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1944
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1944:
	jmp NS_E_1272_MTC_0_failed
LB_1936:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,151
	jz LB_1937
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1942
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1942:
	jmp NS_E_1272_MTC_0_failed
LB_1937:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,130
	jz LB_1938
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1940
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1940:
	jmp NS_E_1272_MTC_0_failed
LB_1938:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_atm
	jmp LB_1947
LB_1946:
	add r14,1
LB_1947:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1946
	cmp rax,10
	jz LB_1946
	cmp rax,32
	jz LB_1946
	call NS_E_1274_ETR_TBL
	cmp r15,0
	jz LB_1948
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1949
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1949:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1950
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1950:
	jmp NS_E_1272_MTC_0_failed
LB_1948:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1925
	btr QWORD [rdi],2
LB_1925:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1926
	btr QWORD [rdi],1
LB_1926:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1927
	btr QWORD [rdi],0
LB_1927:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1272_MTC_0_failed:
	pop r14
; c1
	push r14
; type_atm
	jmp LB_1922
LB_1921:
	add r14,1
LB_1922:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1921
	cmp rax,10
	jz LB_1921
	cmp rax,32
	jz LB_1921
	call NS_E_1274_ETR_TBL
	cmp r15,0
	jz LB_1923
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1272_MTC_1_failed
LB_1923:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1919
	btr QWORD [rdi],0
LB_1919:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1272_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1274:
NS_E_RDI_1274:
NS_E_1274_ETR_TBL:
NS_E_1274_TBL:
; c0
	push r14
; word
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_1956
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1274_MTC_0_failed
LB_1956:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1952
	btr QWORD [rdi],0
LB_1952:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1274_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1276:
NS_E_RDI_1276:
NS_E_1276_ETR_TBL:
NS_E_1276_TBL:
; c0
	push r14
; "{"
	jmp LB_1969
LB_1968:
	add r14,1
LB_1969:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1968
	cmp rax,10
	jz LB_1968
	cmp rax,32
	jz LB_1968
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,123
	jz LB_1971
	jmp NS_E_1276_MTC_0_failed
LB_1971:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_1975
LB_1974:
	add r14,1
LB_1975:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1974
	cmp rax,10
	jz LB_1974
	cmp rax,32
	jz LB_1974
	call NS_E_1278_ETR_TBL
	cmp r15,0
	jz LB_1976
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1977
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1977:
	jmp NS_E_1276_MTC_0_failed
LB_1976:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "}"
	jmp LB_1980
LB_1979:
	add r14,1
LB_1980:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1979
	cmp rax,10
	jz LB_1979
	cmp rax,32
	jz LB_1979
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,125
	jz LB_1982
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1984
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1984:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1985
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1985:
	jmp NS_E_1276_MTC_0_failed
LB_1982:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1964
	btr QWORD [rdi],2
LB_1964:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1965
	btr QWORD [rdi],1
LB_1965:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1966
	btr QWORD [rdi],0
LB_1966:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1276_MTC_0_failed:
	pop r14
; c1
	push r14
; reg
	jmp LB_1961
LB_1960:
	add r14,1
LB_1961:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1960
	cmp rax,10
	jz LB_1960
	cmp rax,32
	jz LB_1960
	call NS_E_1280_ETR_TBL
	cmp r15,0
	jz LB_1962
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1276_MTC_1_failed
LB_1962:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1958
	btr QWORD [rdi],0
LB_1958:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1276_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1278:
NS_E_RDI_1278:
NS_E_1278_ETR_TBL:
NS_E_1278_TBL:
; c0
	push r14
; reg
	jmp LB_1992
LB_1991:
	add r14,1
LB_1992:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1991
	cmp rax,10
	jz LB_1991
	cmp rax,32
	jz LB_1991
	call NS_E_1280_ETR_TBL
	cmp r15,0
	jz LB_1993
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1278_MTC_0_failed
LB_1993:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn_lst
	jmp LB_1996
LB_1995:
	add r14,1
LB_1996:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1995
	cmp rax,10
	jz LB_1995
	cmp rax,32
	jz LB_1995
	call NS_E_1278_ETR_TBL
	cmp r15,0
	jz LB_1997
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1998
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1998:
	jmp NS_E_1278_MTC_0_failed
LB_1997:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1988
	btr QWORD [rdi],1
LB_1988:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1989
	btr QWORD [rdi],0
LB_1989:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1278_MTC_0_failed:
	pop r14
; c1
	push r14
	add rsp,8
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
NS_E_1278_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1280:
NS_E_RDI_1280:
NS_E_1280_ETR_TBL:
NS_E_1280_TBL:
; c0
	push r14
; "%"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,37
	jz LB_2020
	jmp NS_E_1280_MTC_0_failed
LB_2020:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_2025
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2026
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2026:
	jmp NS_E_1280_MTC_0_failed
LB_2025:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2014
	btr QWORD [rdi],1
LB_2014:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2015
	btr QWORD [rdi],0
LB_2015:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1280_MTC_0_failed:
	pop r14
; c1
	push r14
; word
	jmp LB_2011
LB_2010:
	add r14,1
LB_2011:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2010
	cmp rax,10
	jz LB_2010
	cmp rax,32
	jz LB_2010
	call NS_E_1254_ETR_TBL
	cmp r15,0
	jz LB_2012
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1280_MTC_1_failed
LB_2012:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2008
	btr QWORD [rdi],0
LB_2008:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1280_MTC_1_failed:
	pop r14
; c2
	push r14
; "_"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,95
	jz LB_2005
	jmp NS_E_1280_MTC_2_failed
LB_2005:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2000
	btr QWORD [rdi],0
LB_2000:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1280_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2037:
NS_E_RDI_2037:
; » _^ ..
	mov rax,16
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 a \n"
	mov rsi,0x_0a_20_61_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1],rsi
	add rdi,8
; "\226\136\142\226\136\142 \n"
	mov rsi,0x_0a_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1],rsi
	add rdi,8
; //
	mov r13,rax
	btr r12,0
; 	» "a" _ ⊢ 1' : %_2029
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; » 0xr0 |~ {  } ⊢ %_2030 : %_2030
 ; {>  %_2028~0':_stg %_2029~1':_stg }
; 	» 0xr0 _ ⊢ 2' : %_2030
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f1244 { %_2028 %_2030 } ⊢ { %_2031 %_2032 %_2033 } : { %_2031 %_2032 %_2033 }
 ; {>  %_2028~0':_stg %_2029~1':_stg %_2030~2':_r64 }
; _f1244 { 0' 2' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' } ⊢ { 0' 1' }
	mov r14,r15
	bt r12,2
	jc LB_2040
	btr r12,1
	jmp LB_2041
LB_2040:
	bts r12,1
LB_2041:
	call NS_E_1244
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 2' 3' }
	mov r9,r8
	bt r12,3
	jc LB_2042
	btr r12,4
	jmp LB_2043
LB_2042:
	bts r12,4
LB_2043:
	mov r8,r9
	bt r12,4
	jc LB_2046
	btr r12,3
	jmp LB_2047
LB_2046:
	bts r12,3
LB_2047:
	mov rsi,1
	bt r12,3
	jc LB_2044
	mov rsi,0
	bt r8,0
	jc LB_2044
	jmp LB_2045
LB_2044:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,3
LB_2045:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
	mov r15,r14
	bt r12,1
	jc LB_2048
	btr r12,2
	jmp LB_2049
LB_2048:
	bts r12,2
LB_2049:
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_2038
	btr r12,1
	jmp LB_2039
LB_2038:
	bts r12,1
LB_2039:
	add rsp,16
; _f20 { %_2031 %_2032 %_2033 } ⊢ { %_2034 %_2035 %_2036 } : { %_2034 %_2035 %_2036 }
 ; {>  %_2029~1':_stg %_2033~3':(_opn)◂(_p1243) %_2032~2':_r64 %_2031~0':_stg }
; _f20 { 0' 2' 3' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' 3' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_2052
	btr r12,1
	jmp LB_2053
LB_2052:
	bts r12,1
LB_2053:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_2056
	btr r12,4
	jmp LB_2057
LB_2056:
	bts r12,4
LB_2057:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_2054
	btr QWORD [rdi],0
	jmp LB_2055
LB_2054:
	bts QWORD [rdi],0
LB_2055:
	mov r9,r15
	bt r12,2
	jc LB_2060
	btr r12,4
	jmp LB_2061
LB_2060:
	bts r12,4
LB_2061:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_2058
	btr QWORD [rdi],1
	jmp LB_2059
LB_2058:
	bts QWORD [rdi],1
LB_2059:
	mov r9,r8
	bt r12,3
	jc LB_2064
	btr r12,4
	jmp LB_2065
LB_2064:
	bts r12,4
LB_2065:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_2062
	btr QWORD [rdi],2
	jmp LB_2063
LB_2062:
	bts QWORD [rdi],2
LB_2063:
	call NS_E_20
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 2' 3' }
	mov r14,r13
	bt r12,0
	jc LB_2066
	btr r12,1
	jmp LB_2067
LB_2066:
	bts r12,1
LB_2067:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_2070
	btr r12,4
	jmp LB_2071
LB_2070:
	bts r12,4
LB_2071:
	mov r13,r9
	bt r12,4
	jc LB_2068
	btr r12,0
	jmp LB_2069
LB_2068:
	bts r12,0
LB_2069:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_2074
	btr r12,4
	jmp LB_2075
LB_2074:
	bts r12,4
LB_2075:
	mov r15,r9
	bt r12,4
	jc LB_2072
	btr r12,2
	jmp LB_2073
LB_2072:
	bts r12,2
LB_2073:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_2078
	btr r12,4
	jmp LB_2079
LB_2078:
	bts r12,4
LB_2079:
	mov r8,r9
	bt r12,4
	jc LB_2076
	btr r12,3
	jmp LB_2077
LB_2076:
	bts r12,3
LB_2077:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_2050
	btr r12,1
	jmp LB_2051
LB_2050:
	bts r12,1
LB_2051:
	add rsp,16
; ∎ {  }
 ; {>  %_2029~1':_stg %_2036~3':(_opn)◂(_p1243) %_2035~2':_r64 %_2034~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_2080
	mov rdi,r14
	call dlt
LB_2080:
	bt r12,3
	jc LB_2081
	mov rdi,r8
	call dlt
LB_2081:
	bt r12,2
	jc LB_2082
	mov rdi,r15
	call dlt
LB_2082:
	bt r12,0
	jc LB_2083
	mov rdi,r13
	call dlt
LB_2083:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_1145:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1145
	NS_E_DYN_1148:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1148
	NS_E_DYN_1149:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1149
	NS_E_DYN_1150:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1150
	NS_E_DYN_1151:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1151
	NS_E_DYN_1152:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1152
	NS_E_DYN_1153:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1153
	CST_DYN_1201:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_1281:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1282:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1240:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1240
	NS_E_DYN_1283:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1284:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1285:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1286:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_1242:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1242
	NS_E_DYN_1287:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1288:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1244:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1244
	NS_E_DYN_1289:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1290:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1246:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1246
	NS_E_DYN_1291:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1292:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1248:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1248
	NS_E_DYN_1293:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1294:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1250:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1250
	NS_E_DYN_1295:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1252:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1252
	NS_E_DYN_1296:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1297:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1254:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1254
	NS_E_DYN_1298:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1299:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1300:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1256:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1256
	NS_E_DYN_1301:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1302:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1258:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1258
	NS_E_DYN_1303:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1260:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1260
	NS_E_DYN_1304:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1305:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1262:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1262
	NS_E_DYN_1306:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1307:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1264:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1264
	NS_E_DYN_1308:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1309:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1266:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1266
	NS_E_DYN_1310:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1268:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1268
	NS_E_DYN_1311:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1312:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1270:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1270
	NS_E_DYN_1313:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1314:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1272:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1272
	NS_E_DYN_1315:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1274:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1274
	NS_E_DYN_1316:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1317:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1276:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1276
	NS_E_DYN_1318:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1319:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1278:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1278
	NS_E_DYN_1320:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1321:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1322:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1280:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1280
	CST_DYN_2037:
		dq 0x0001_0001_00_82_ffff
		dq 1
