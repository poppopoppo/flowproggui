%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_846
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
NS_E_42:
NS_E_RDI_42:
NS_E_42_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_43
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_43:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_44:
NS_E_RDI_44:
NS_E_44_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_44_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_44_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_45:
NS_E_RDI_45:
NS_E_45_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_45_LB_0
	cmp r11,57
	ja NS_E_45_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_45_LB_0:
	mov rax,0
	ret
NS_E_47:
NS_E_RDI_47:
NS_E_47_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_47_LB_0
	cmp r11,122
	ja NS_E_47_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_47_LB_0:
	mov rax,0
	ret
NS_E_46:
NS_E_RDI_46:
NS_E_46_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_46_LB_0
	cmp r11,90
	ja NS_E_46_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_46_LB_0:
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
NS_E_49:
NS_E_RDI_49:
NS_E_49_ETR_TBL:
NS_E_49_TBL:
	push r14
; glb_etr
	call NS_E_51_ETR_TBL
	cmp r15,0
	jz LB_138
	jmp NS_E_49_MTC_0_failed
LB_138:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; glb_etr_lst
	call NS_E_49_ETR_TBL
	cmp r15,0
	jz LB_142
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_143
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_143:
	jmp NS_E_49_MTC_0_failed
LB_142:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_133
	btr QWORD [rdi],1
LB_133:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_134
	btr QWORD [rdi],0
LB_134:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_49_MTC_0_failed:
	pop r14
	push r14
	pop rdi
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
NS_E_49_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_51:
NS_E_RDI_51:
NS_E_51_ETR_TBL:
NS_E_51_TBL:
	push r14
; mdl_etr
	call NS_E_53_ETR_TBL
	cmp r15,0
	jz LB_167
	jmp NS_E_51_MTC_0_failed
LB_167:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_163
	btr QWORD [rdi],0
LB_163:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_51_MTC_0_failed:
	pop r14
	push r14
; cst_etr
	call NS_E_55_ETR_TBL
	cmp r15,0
	jz LB_161
	jmp NS_E_51_MTC_1_failed
LB_161:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_157
	btr QWORD [rdi],0
LB_157:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_51_MTC_1_failed:
	pop r14
	push r14
; op_etr
	call NS_E_57_ETR_TBL
	cmp r15,0
	jz LB_155
	jmp NS_E_51_MTC_2_failed
LB_155:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_151
	btr QWORD [rdi],0
LB_151:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_51_MTC_2_failed:
	pop r14
	push r14
; dta_etr
	call NS_E_59_ETR_TBL
	cmp r15,0
	jz LB_149
	jmp NS_E_51_MTC_3_failed
LB_149:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_145
	btr QWORD [rdi],0
LB_145:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_51_MTC_3_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_53:
NS_E_RDI_53:
NS_E_53_ETR_TBL:
NS_E_53_TBL:
	push r14
; "\194\167\194\167"
	jmp LB_212
LB_211:
	add r14,1
LB_212:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_211
	cmp rax,10
	jz LB_211
	cmp rax,32
	jz LB_211
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_214
	jmp NS_E_53_MTC_0_failed
LB_214:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_215
	jmp NS_E_53_MTC_0_failed
LB_215:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_216
	jmp NS_E_53_MTC_0_failed
LB_216:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_217
	jmp NS_E_53_MTC_0_failed
LB_217:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_224
LB_223:
	add r14,1
LB_224:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_223
	cmp rax,10
	jz LB_223
	cmp rax,32
	jz LB_223
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_225
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_226
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_226:
	jmp NS_E_53_MTC_0_failed
LB_225:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; glb_etr_lst
	jmp LB_229
LB_228:
	add r14,1
LB_229:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_228
	cmp rax,10
	jz LB_228
	cmp rax,32
	jz LB_228
	call NS_E_49_ETR_TBL
	cmp r15,0
	jz LB_230
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_231
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_231:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_232
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_232:
	jmp NS_E_53_MTC_0_failed
LB_230:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; "\226\136\142\226\136\142"
	jmp LB_235
LB_234:
	add r14,1
LB_235:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_234
	cmp rax,10
	jz LB_234
	cmp rax,32
	jz LB_234
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_237
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_264
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_264:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_265
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_265:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_266
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_266:
	jmp NS_E_53_MTC_0_failed
LB_237:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_238
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_260
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_260:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_261
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_261:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_262
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_262:
	jmp NS_E_53_MTC_0_failed
LB_238:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_239
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_256
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_256:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_257
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_257:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_258
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_258:
	jmp NS_E_53_MTC_0_failed
LB_239:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,226
	jz LB_240
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_252
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_252:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_253
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_253:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_254
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_254:
	jmp NS_E_53_MTC_0_failed
LB_240:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+4]
	cmp al,136
	jz LB_241
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_248
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_248:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_249
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_249:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_250
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_250:
	jmp NS_E_53_MTC_0_failed
LB_241:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+5]
	cmp al,142
	jz LB_242
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_244
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_244:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_245
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_245:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_246
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_246:
	jmp NS_E_53_MTC_0_failed
LB_242:
	add r14,6
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*3],0
	mov QWORD [prs_vct+8*1+16*3],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_206
	btr QWORD [rdi],3
LB_206:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_207
	btr QWORD [rdi],2
LB_207:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_208
	btr QWORD [rdi],1
LB_208:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_209
	btr QWORD [rdi],0
LB_209:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_53_MTC_0_failed:
	pop r14
	push r14
; "\194\167\194\167"
	jmp LB_175
LB_174:
	add r14,1
LB_175:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_174
	cmp rax,10
	jz LB_174
	cmp rax,32
	jz LB_174
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_177
	jmp NS_E_53_MTC_1_failed
LB_177:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_178
	jmp NS_E_53_MTC_1_failed
LB_178:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_179
	jmp NS_E_53_MTC_1_failed
LB_179:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_180
	jmp NS_E_53_MTC_1_failed
LB_180:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_187
LB_186:
	add r14,1
LB_187:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_186
	cmp rax,10
	jz LB_186
	cmp rax,32
	jz LB_186
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_188
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_189
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_189:
	jmp NS_E_53_MTC_1_failed
LB_188:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_192
LB_191:
	add r14,1
LB_192:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_191
	cmp rax,10
	jz LB_191
	cmp rax,32
	jz LB_191
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_194
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_196
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_196:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_197
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_197:
	jmp NS_E_53_MTC_1_failed
LB_194:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_200
LB_199:
	add r14,1
LB_200:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_199
	cmp rax,10
	jz LB_199
	cmp rax,32
	jz LB_199
	call NS_E_67_ETR_TBL
	cmp r15,0
	jz LB_201
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_202
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_202:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_203
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_203:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_204
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_204:
	jmp NS_E_53_MTC_1_failed
LB_201:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_169
	btr QWORD [rdi],3
LB_169:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_170
	btr QWORD [rdi],2
LB_170:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_171
	btr QWORD [rdi],1
LB_171:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_172
	btr QWORD [rdi],0
LB_172:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_53_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_55:
NS_E_RDI_55:
NS_E_55_ETR_TBL:
NS_E_55_TBL:
	push r14
; "\194\167"
	jmp LB_307
LB_306:
	add r14,1
LB_307:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_306
	cmp rax,10
	jz LB_306
	cmp rax,32
	jz LB_306
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_309
	jmp NS_E_55_MTC_0_failed
LB_309:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_310
	jmp NS_E_55_MTC_0_failed
LB_310:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_315
LB_314:
	add r14,1
LB_315:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_314
	cmp rax,10
	jz LB_314
	cmp rax,32
	jz LB_314
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_316
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_317
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_317:
	jmp NS_E_55_MTC_0_failed
LB_316:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\194\171"
	jmp LB_320
LB_319:
	add r14,1
LB_320:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_319
	cmp rax,10
	jz LB_319
	cmp rax,32
	jz LB_319
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_322
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_328
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_328:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_329
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_329:
	jmp NS_E_55_MTC_0_failed
LB_322:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,171
	jz LB_323
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_325
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_325:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_326
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_326:
	jmp NS_E_55_MTC_0_failed
LB_323:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; op_lines
	jmp LB_332
LB_331:
	add r14,1
LB_332:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_331
	cmp rax,10
	jz LB_331
	cmp rax,32
	jz LB_331
	call NS_E_73_ETR_TBL
	cmp r15,0
	jz LB_333
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_334
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_334:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_335
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_335:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_336
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_336:
	jmp NS_E_55_MTC_0_failed
LB_333:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_301
	btr QWORD [rdi],3
LB_301:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_302
	btr QWORD [rdi],2
LB_302:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_303
	btr QWORD [rdi],1
LB_303:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_304
	btr QWORD [rdi],0
LB_304:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_55_MTC_0_failed:
	pop r14
	push r14
; "\194\167"
	jmp LB_274
LB_273:
	add r14,1
LB_274:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_273
	cmp rax,10
	jz LB_273
	cmp rax,32
	jz LB_273
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_276
	jmp NS_E_55_MTC_1_failed
LB_276:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_277
	jmp NS_E_55_MTC_1_failed
LB_277:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_282
LB_281:
	add r14,1
LB_282:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_281
	cmp rax,10
	jz LB_281
	cmp rax,32
	jz LB_281
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_283
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_284
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_284:
	jmp NS_E_55_MTC_1_failed
LB_283:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_287
LB_286:
	add r14,1
LB_287:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_286
	cmp rax,10
	jz LB_286
	cmp rax,32
	jz LB_286
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_289
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_291
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_291:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_292
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_292:
	jmp NS_E_55_MTC_1_failed
LB_289:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; cst
	jmp LB_295
LB_294:
	add r14,1
LB_295:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_294
	cmp rax,10
	jz LB_294
	cmp rax,32
	jz LB_294
	call NS_E_61_ETR_TBL
	cmp r15,0
	jz LB_296
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_297
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_297:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_298
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_298:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_299
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_299:
	jmp NS_E_55_MTC_1_failed
LB_296:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_268
	btr QWORD [rdi],3
LB_268:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_269
	btr QWORD [rdi],2
LB_269:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_270
	btr QWORD [rdi],1
LB_270:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_271
	btr QWORD [rdi],0
LB_271:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_55_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_57:
NS_E_RDI_57:
NS_E_57_ETR_TBL:
NS_E_57_TBL:
	push r14
; "\194\167"
	jmp LB_377
LB_376:
	add r14,1
LB_377:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_376
	cmp rax,10
	jz LB_376
	cmp rax,32
	jz LB_376
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_379
	jmp NS_E_57_MTC_0_failed
LB_379:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_380
	jmp NS_E_57_MTC_0_failed
LB_380:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_385
LB_384:
	add r14,1
LB_385:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_384
	cmp rax,10
	jz LB_384
	cmp rax,32
	jz LB_384
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_386
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_387
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_387:
	jmp NS_E_57_MTC_0_failed
LB_386:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; reg_ptn
	jmp LB_390
LB_389:
	add r14,1
LB_390:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_389
	cmp rax,10
	jz LB_389
	cmp rax,32
	jz LB_389
	call NS_E_85_ETR_TBL
	cmp r15,0
	jz LB_391
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_392
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_392:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_393
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_393:
	jmp NS_E_57_MTC_0_failed
LB_391:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; op_lines
	jmp LB_396
LB_395:
	add r14,1
LB_396:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_395
	cmp rax,10
	jz LB_395
	cmp rax,32
	jz LB_395
	call NS_E_73_ETR_TBL
	cmp r15,0
	jz LB_397
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_398
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_398:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_399
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_399:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_400
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_400:
	jmp NS_E_57_MTC_0_failed
LB_397:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_371
	btr QWORD [rdi],3
LB_371:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_372
	btr QWORD [rdi],2
LB_372:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_373
	btr QWORD [rdi],1
LB_373:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_374
	btr QWORD [rdi],0
LB_374:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_57_MTC_0_failed:
	pop r14
	push r14
; "\194\167"
	jmp LB_344
LB_343:
	add r14,1
LB_344:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_343
	cmp rax,10
	jz LB_343
	cmp rax,32
	jz LB_343
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_346
	jmp NS_E_57_MTC_1_failed
LB_346:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_347
	jmp NS_E_57_MTC_1_failed
LB_347:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_352
LB_351:
	add r14,1
LB_352:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_351
	cmp rax,10
	jz LB_351
	cmp rax,32
	jz LB_351
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_353
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_354
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_354:
	jmp NS_E_57_MTC_1_failed
LB_353:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_357
LB_356:
	add r14,1
LB_357:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_356
	cmp rax,10
	jz LB_356
	cmp rax,32
	jz LB_356
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_359
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_361
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_361:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_362
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_362:
	jmp NS_E_57_MTC_1_failed
LB_359:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_365
LB_364:
	add r14,1
LB_365:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_364
	cmp rax,10
	jz LB_364
	cmp rax,32
	jz LB_364
	call NS_E_67_ETR_TBL
	cmp r15,0
	jz LB_366
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_367
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_367:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_368
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_368:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_369
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_369:
	jmp NS_E_57_MTC_1_failed
LB_366:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_338
	btr QWORD [rdi],3
LB_338:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_339
	btr QWORD [rdi],2
LB_339:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_340
	btr QWORD [rdi],1
LB_340:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_341
	btr QWORD [rdi],0
LB_341:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_57_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_59:
NS_E_RDI_59:
NS_E_59_ETR_TBL:
NS_E_59_TBL:
	push r14
; "\194\182"
	jmp LB_440
LB_439:
	add r14,1
LB_440:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_439
	cmp rax,10
	jz LB_439
	cmp rax,32
	jz LB_439
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_442
	jmp NS_E_59_MTC_0_failed
LB_442:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_443
	jmp NS_E_59_MTC_0_failed
LB_443:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_448
LB_447:
	add r14,1
LB_448:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_447
	cmp rax,10
	jz LB_447
	cmp rax,32
	jz LB_447
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_449
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_450
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_450:
	jmp NS_E_59_MTC_0_failed
LB_449:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; dta_def
	jmp LB_453
LB_452:
	add r14,1
LB_453:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_452
	cmp rax,10
	jz LB_452
	cmp rax,32
	jz LB_452
	call NS_E_69_ETR_TBL
	cmp r15,0
	jz LB_454
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_455
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_455:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_456
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_456:
	jmp NS_E_59_MTC_0_failed
LB_454:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_435
	btr QWORD [rdi],2
LB_435:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_436
	btr QWORD [rdi],1
LB_436:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_437
	btr QWORD [rdi],0
LB_437:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_59_MTC_0_failed:
	pop r14
	push r14
; "\194\182"
	jmp LB_408
LB_407:
	add r14,1
LB_408:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_407
	cmp rax,10
	jz LB_407
	cmp rax,32
	jz LB_407
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_410
	jmp NS_E_59_MTC_1_failed
LB_410:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_411
	jmp NS_E_59_MTC_1_failed
LB_411:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_416
LB_415:
	add r14,1
LB_416:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_415
	cmp rax,10
	jz LB_415
	cmp rax,32
	jz LB_415
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_417
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_418
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_418:
	jmp NS_E_59_MTC_1_failed
LB_417:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_421
LB_420:
	add r14,1
LB_421:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_420
	cmp rax,10
	jz LB_420
	cmp rax,32
	jz LB_420
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_423
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_425
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_425:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_426
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_426:
	jmp NS_E_59_MTC_1_failed
LB_423:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_429
LB_428:
	add r14,1
LB_429:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_428
	cmp rax,10
	jz LB_428
	cmp rax,32
	jz LB_428
	call NS_E_67_ETR_TBL
	cmp r15,0
	jz LB_430
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_431
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_431:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_432
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_432:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_433
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_433:
	jmp NS_E_59_MTC_1_failed
LB_430:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_402
	btr QWORD [rdi],3
LB_402:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_403
	btr QWORD [rdi],2
LB_403:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_404
	btr QWORD [rdi],1
LB_404:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_405
	btr QWORD [rdi],0
LB_405:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_59_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_61:
NS_E_RDI_61:
NS_E_61_ETR_TBL:
NS_E_61_TBL:
	push r14
; "0xr0"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,48
	jz LB_463
	jmp NS_E_61_MTC_0_failed
LB_463:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,120
	jz LB_464
	jmp NS_E_61_MTC_0_failed
LB_464:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,114
	jz LB_465
	jmp NS_E_61_MTC_0_failed
LB_465:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,48
	jz LB_466
	jmp NS_E_61_MTC_0_failed
LB_466:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_458
	btr QWORD [rdi],0
LB_458:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_61_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_63:
NS_E_RDI_63:
NS_E_63_ETR_TBL:
NS_E_63_TBL:
	push r14
; cha
	call NS_E_65_ETR_TBL
	cmp r15,0
	jz LB_478
	jmp NS_E_63_MTC_0_failed
LB_478:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; word
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_482
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_483
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_483:
	jmp NS_E_63_MTC_0_failed
LB_482:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_473
	btr QWORD [rdi],1
LB_473:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_474
	btr QWORD [rdi],0
LB_474:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_63_MTC_0_failed:
	pop r14
	push r14
	pop rdi
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
NS_E_63_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_65:
NS_E_RDI_65:
NS_E_65_ETR_TBL:
NS_E_65_TBL:
	push r14
; "a"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,97
	jz LB_506
	jmp NS_E_65_MTC_0_failed
LB_506:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_501
	btr QWORD [rdi],0
LB_501:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_65_MTC_0_failed:
	pop r14
	push r14
; "b"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,98
	jz LB_498
	jmp NS_E_65_MTC_1_failed
LB_498:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_493
	btr QWORD [rdi],0
LB_493:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_65_MTC_1_failed:
	pop r14
	push r14
; "c"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,99
	jz LB_490
	jmp NS_E_65_MTC_2_failed
LB_490:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_485
	btr QWORD [rdi],0
LB_485:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_65_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_67:
NS_E_RDI_67:
NS_E_67_ETR_TBL:
NS_E_67_TBL:
	push r14
; word
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_521
	jmp NS_E_67_MTC_0_failed
LB_521:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "."
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,46
	jz LB_526
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_528
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_528:
	jmp NS_E_67_MTC_0_failed
LB_526:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; name
	call NS_E_67_ETR_TBL
	cmp r15,0
	jz LB_532
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_533
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_533:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_534
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_534:
	jmp NS_E_67_MTC_0_failed
LB_532:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_515
	btr QWORD [rdi],2
LB_515:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_516
	btr QWORD [rdi],1
LB_516:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_517
	btr QWORD [rdi],0
LB_517:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_67_MTC_0_failed:
	pop r14
	push r14
; word
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_513
	jmp NS_E_67_MTC_1_failed
LB_513:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_509
	btr QWORD [rdi],0
LB_509:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_67_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_69:
NS_E_RDI_69:
NS_E_69_ETR_TBL:
NS_E_69_TBL:
	push r14
; dta_def_coprd
	call NS_E_71_ETR_TBL
	cmp r15,0
	jz LB_540
	jmp NS_E_69_MTC_0_failed
LB_540:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_536
	btr QWORD [rdi],0
LB_536:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_69_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_71:
NS_E_RDI_71:
NS_E_71_ETR_TBL:
NS_E_71_TBL:
	push r14
; "\226\136\144"
	jmp LB_583
LB_582:
	add r14,1
LB_583:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_582
	cmp rax,10
	jz LB_582
	cmp rax,32
	jz LB_582
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_585
	jmp NS_E_71_MTC_0_failed
LB_585:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_586
	jmp NS_E_71_MTC_0_failed
LB_586:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_587
	jmp NS_E_71_MTC_0_failed
LB_587:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_593
LB_592:
	add r14,1
LB_593:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_592
	cmp rax,10
	jz LB_592
	cmp rax,32
	jz LB_592
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_594
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_595
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_595:
	jmp NS_E_71_MTC_0_failed
LB_594:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_598
LB_597:
	add r14,1
LB_598:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_597
	cmp rax,10
	jz LB_597
	cmp rax,32
	jz LB_597
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_600
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_602
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_602:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_603
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_603:
	jmp NS_E_71_MTC_0_failed
LB_600:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_606
LB_605:
	add r14,1
LB_606:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_605
	cmp rax,10
	jz LB_605
	cmp rax,32
	jz LB_605
	call NS_E_77_ETR_TBL
	cmp r15,0
	jz LB_607
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_608
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_608:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_609
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_609:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_610
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_610:
	jmp NS_E_71_MTC_0_failed
LB_607:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_577
	btr QWORD [rdi],3
LB_577:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_578
	btr QWORD [rdi],2
LB_578:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_579
	btr QWORD [rdi],1
LB_579:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_580
	btr QWORD [rdi],0
LB_580:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_71_MTC_0_failed:
	pop r14
	push r14
; "\226\136\144"
	jmp LB_548
LB_547:
	add r14,1
LB_548:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_547
	cmp rax,10
	jz LB_547
	cmp rax,32
	jz LB_547
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_550
	jmp NS_E_71_MTC_1_failed
LB_550:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_551
	jmp NS_E_71_MTC_1_failed
LB_551:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_552
	jmp NS_E_71_MTC_1_failed
LB_552:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_558
LB_557:
	add r14,1
LB_558:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_557
	cmp rax,10
	jz LB_557
	cmp rax,32
	jz LB_557
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_559
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_560
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_560:
	jmp NS_E_71_MTC_1_failed
LB_559:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_563
LB_562:
	add r14,1
LB_563:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_562
	cmp rax,10
	jz LB_562
	cmp rax,32
	jz LB_562
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_565
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_567
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_567:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_568
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_568:
	jmp NS_E_71_MTC_1_failed
LB_565:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_571
LB_570:
	add r14,1
LB_571:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_570
	cmp rax,10
	jz LB_570
	cmp rax,32
	jz LB_570
	call NS_E_77_ETR_TBL
	cmp r15,0
	jz LB_572
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_573
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_573:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_574
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_574:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_575
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_575:
	jmp NS_E_71_MTC_1_failed
LB_572:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_542
	btr QWORD [rdi],3
LB_542:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_543
	btr QWORD [rdi],2
LB_543:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_544
	btr QWORD [rdi],1
LB_544:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_545
	btr QWORD [rdi],0
LB_545:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_71_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_73:
NS_E_RDI_73:
NS_E_73_ETR_TBL:
NS_E_73_TBL:
	push r14
; op
	jmp LB_636
LB_635:
	add r14,1
LB_636:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_635
	cmp rax,10
	jz LB_635
	cmp rax,32
	jz LB_635
	call NS_E_75_ETR_TBL
	cmp r15,0
	jz LB_637
	jmp NS_E_73_MTC_0_failed
LB_637:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn
	jmp LB_640
LB_639:
	add r14,1
LB_640:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_639
	cmp rax,10
	jz LB_639
	cmp rax,32
	jz LB_639
	call NS_E_85_ETR_TBL
	cmp r15,0
	jz LB_641
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_642
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_642:
	jmp NS_E_73_MTC_0_failed
LB_641:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\226\138\162"
	jmp LB_645
LB_644:
	add r14,1
LB_645:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_644
	cmp rax,10
	jz LB_644
	cmp rax,32
	jz LB_644
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_647
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_657
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_657:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_658
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_658:
	jmp NS_E_73_MTC_0_failed
LB_647:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,138
	jz LB_648
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_654
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_654:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_655
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_655:
	jmp NS_E_73_MTC_0_failed
LB_648:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,162
	jz LB_649
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_651
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_651:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_652
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_652:
	jmp NS_E_73_MTC_0_failed
LB_649:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; reg_ptn
	jmp LB_661
LB_660:
	add r14,1
LB_661:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_660
	cmp rax,10
	jz LB_660
	cmp rax,32
	jz LB_660
	call NS_E_85_ETR_TBL
	cmp r15,0
	jz LB_662
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_663
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_663:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_664
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_664:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_665
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_665:
	jmp NS_E_73_MTC_0_failed
LB_662:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_630
	btr QWORD [rdi],3
LB_630:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_631
	btr QWORD [rdi],2
LB_631:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_632
	btr QWORD [rdi],1
LB_632:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_633
	btr QWORD [rdi],0
LB_633:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_73_MTC_0_failed:
	pop r14
	push r14
; "\226\136\142"
	jmp LB_616
LB_615:
	add r14,1
LB_616:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_615
	cmp rax,10
	jz LB_615
	cmp rax,32
	jz LB_615
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_618
	jmp NS_E_73_MTC_1_failed
LB_618:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_619
	jmp NS_E_73_MTC_1_failed
LB_619:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_620
	jmp NS_E_73_MTC_1_failed
LB_620:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn
	jmp LB_626
LB_625:
	add r14,1
LB_626:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_625
	cmp rax,10
	jz LB_625
	cmp rax,32
	jz LB_625
	call NS_E_85_ETR_TBL
	cmp r15,0
	jz LB_627
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_628
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_628:
	jmp NS_E_73_MTC_1_failed
LB_627:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_612
	btr QWORD [rdi],1
LB_612:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_613
	btr QWORD [rdi],0
LB_613:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_73_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_75:
NS_E_RDI_75:
NS_E_75_ETR_TBL:
NS_E_75_TBL:
	push r14
; name
	jmp LB_686
LB_685:
	add r14,1
LB_686:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_685
	cmp rax,10
	jz LB_685
	cmp rax,32
	jz LB_685
	call NS_E_67_ETR_TBL
	cmp r15,0
	jz LB_687
	jmp NS_E_75_MTC_0_failed
LB_687:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_683
	btr QWORD [rdi],0
LB_683:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_75_MTC_0_failed:
	pop r14
	push r14
; "\194\187"
	jmp LB_671
LB_670:
	add r14,1
LB_671:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_670
	cmp rax,10
	jz LB_670
	cmp rax,32
	jz LB_670
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_673
	jmp NS_E_75_MTC_1_failed
LB_673:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,187
	jz LB_674
	jmp NS_E_75_MTC_1_failed
LB_674:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; cst
	jmp LB_679
LB_678:
	add r14,1
LB_679:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_678
	cmp rax,10
	jz LB_678
	cmp rax,32
	jz LB_678
	call NS_E_61_ETR_TBL
	cmp r15,0
	jz LB_680
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_681
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_681:
	jmp NS_E_75_MTC_1_failed
LB_680:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_667
	btr QWORD [rdi],1
LB_667:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_668
	btr QWORD [rdi],0
LB_668:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_75_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_77:
NS_E_RDI_77:
NS_E_77_ETR_TBL:
NS_E_77_TBL:
	push r14
; type_imp
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_693
	jmp NS_E_77_MTC_0_failed
LB_693:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_689
	btr QWORD [rdi],0
LB_689:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_77_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_79:
NS_E_RDI_79:
NS_E_79_ETR_TBL:
NS_E_79_TBL:
	push r14
; type_app
	jmp LB_706
LB_705:
	add r14,1
LB_706:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_705
	cmp rax,10
	jz LB_705
	cmp rax,32
	jz LB_705
	call NS_E_81_ETR_TBL
	cmp r15,0
	jz LB_707
	jmp NS_E_79_MTC_0_failed
LB_707:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\134\146"
	jmp LB_710
LB_709:
	add r14,1
LB_710:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_709
	cmp rax,10
	jz LB_709
	cmp rax,32
	jz LB_709
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_712
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_720
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_720:
	jmp NS_E_79_MTC_0_failed
LB_712:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,134
	jz LB_713
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_718
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_718:
	jmp NS_E_79_MTC_0_failed
LB_713:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,146
	jz LB_714
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_716
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_716:
	jmp NS_E_79_MTC_0_failed
LB_714:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_imp
	jmp LB_723
LB_722:
	add r14,1
LB_723:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_722
	cmp rax,10
	jz LB_722
	cmp rax,32
	jz LB_722
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_724
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_725
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_725:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_726
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_726:
	jmp NS_E_79_MTC_0_failed
LB_724:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_701
	btr QWORD [rdi],2
LB_701:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_702
	btr QWORD [rdi],1
LB_702:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_703
	btr QWORD [rdi],0
LB_703:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_79_MTC_0_failed:
	pop r14
	push r14
; type_app
	jmp LB_698
LB_697:
	add r14,1
LB_698:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_697
	cmp rax,10
	jz LB_697
	cmp rax,32
	jz LB_697
	call NS_E_81_ETR_TBL
	cmp r15,0
	jz LB_699
	jmp NS_E_79_MTC_1_failed
LB_699:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_695
	btr QWORD [rdi],0
LB_695:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_79_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_81:
NS_E_RDI_81:
NS_E_81_ETR_TBL:
NS_E_81_TBL:
	push r14
; type_atm
	jmp LB_739
LB_738:
	add r14,1
LB_739:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_738
	cmp rax,10
	jz LB_738
	cmp rax,32
	jz LB_738
	call NS_E_83_ETR_TBL
	cmp r15,0
	jz LB_740
	jmp NS_E_81_MTC_0_failed
LB_740:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\151\130"
	jmp LB_743
LB_742:
	add r14,1
LB_743:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_742
	cmp rax,10
	jz LB_742
	cmp rax,32
	jz LB_742
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_745
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_753
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_753:
	jmp NS_E_81_MTC_0_failed
LB_745:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,151
	jz LB_746
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_751
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_751:
	jmp NS_E_81_MTC_0_failed
LB_746:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,130
	jz LB_747
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_749
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_749:
	jmp NS_E_81_MTC_0_failed
LB_747:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_atm
	jmp LB_756
LB_755:
	add r14,1
LB_756:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_755
	cmp rax,10
	jz LB_755
	cmp rax,32
	jz LB_755
	call NS_E_83_ETR_TBL
	cmp r15,0
	jz LB_757
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_758
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_758:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_759
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_759:
	jmp NS_E_81_MTC_0_failed
LB_757:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_734
	btr QWORD [rdi],2
LB_734:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_735
	btr QWORD [rdi],1
LB_735:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_736
	btr QWORD [rdi],0
LB_736:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_81_MTC_0_failed:
	pop r14
	push r14
; type_atm
	jmp LB_731
LB_730:
	add r14,1
LB_731:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_730
	cmp rax,10
	jz LB_730
	cmp rax,32
	jz LB_730
	call NS_E_83_ETR_TBL
	cmp r15,0
	jz LB_732
	jmp NS_E_81_MTC_1_failed
LB_732:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_728
	btr QWORD [rdi],0
LB_728:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_81_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_83:
NS_E_RDI_83:
NS_E_83_ETR_TBL:
NS_E_83_TBL:
	push r14
; word
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_765
	jmp NS_E_83_MTC_0_failed
LB_765:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_761
	btr QWORD [rdi],0
LB_761:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_83_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_85:
NS_E_RDI_85:
NS_E_85_ETR_TBL:
NS_E_85_TBL:
	push r14
; "{"
	jmp LB_778
LB_777:
	add r14,1
LB_778:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_777
	cmp rax,10
	jz LB_777
	cmp rax,32
	jz LB_777
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,123
	jz LB_780
	jmp NS_E_85_MTC_0_failed
LB_780:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_784
LB_783:
	add r14,1
LB_784:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_783
	cmp rax,10
	jz LB_783
	cmp rax,32
	jz LB_783
	call NS_E_87_ETR_TBL
	cmp r15,0
	jz LB_785
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_786
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_786:
	jmp NS_E_85_MTC_0_failed
LB_785:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "}"
	jmp LB_789
LB_788:
	add r14,1
LB_789:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_788
	cmp rax,10
	jz LB_788
	cmp rax,32
	jz LB_788
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,125
	jz LB_791
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_793
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_793:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_794
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_794:
	jmp NS_E_85_MTC_0_failed
LB_791:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_773
	btr QWORD [rdi],2
LB_773:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_774
	btr QWORD [rdi],1
LB_774:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_775
	btr QWORD [rdi],0
LB_775:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_85_MTC_0_failed:
	pop r14
	push r14
; reg
	jmp LB_770
LB_769:
	add r14,1
LB_770:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_769
	cmp rax,10
	jz LB_769
	cmp rax,32
	jz LB_769
	call NS_E_89_ETR_TBL
	cmp r15,0
	jz LB_771
	jmp NS_E_85_MTC_1_failed
LB_771:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_767
	btr QWORD [rdi],0
LB_767:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_85_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_87:
NS_E_RDI_87:
NS_E_87_ETR_TBL:
NS_E_87_TBL:
	push r14
; reg
	jmp LB_801
LB_800:
	add r14,1
LB_801:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_800
	cmp rax,10
	jz LB_800
	cmp rax,32
	jz LB_800
	call NS_E_89_ETR_TBL
	cmp r15,0
	jz LB_802
	jmp NS_E_87_MTC_0_failed
LB_802:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn_lst
	jmp LB_805
LB_804:
	add r14,1
LB_805:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_804
	cmp rax,10
	jz LB_804
	cmp rax,32
	jz LB_804
	call NS_E_87_ETR_TBL
	cmp r15,0
	jz LB_806
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_807
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_807:
	jmp NS_E_87_MTC_0_failed
LB_806:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_797
	btr QWORD [rdi],1
LB_797:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_798
	btr QWORD [rdi],0
LB_798:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_87_MTC_0_failed:
	pop r14
	push r14
	pop rdi
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
NS_E_87_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_89:
NS_E_RDI_89:
NS_E_89_ETR_TBL:
NS_E_89_TBL:
	push r14
; "%"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,37
	jz LB_829
	jmp NS_E_89_MTC_0_failed
LB_829:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_834
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_835
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_835:
	jmp NS_E_89_MTC_0_failed
LB_834:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_823
	btr QWORD [rdi],1
LB_823:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_824
	btr QWORD [rdi],0
LB_824:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_89_MTC_0_failed:
	pop r14
	push r14
; word
	jmp LB_820
LB_819:
	add r14,1
LB_820:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_819
	cmp rax,10
	jz LB_819
	cmp rax,32
	jz LB_819
	call NS_E_63_ETR_TBL
	cmp r15,0
	jz LB_821
	jmp NS_E_89_MTC_1_failed
LB_821:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_817
	btr QWORD [rdi],0
LB_817:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_89_MTC_1_failed:
	pop r14
	push r14
; "_"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,95
	jz LB_814
	jmp NS_E_89_MTC_2_failed
LB_814:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_809
	btr QWORD [rdi],0
LB_809:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_89_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_846:
NS_E_RDI_846:
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
; 	» "a" _ ⊢ 1' : %_838
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; » 0xr0 |~ {  } ⊢ %_839 : %_839
 ; {>  %_838~1':_stg %_837~0':_stg }
; 	» 0xr0 _ ⊢ 2' : %_839
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f53 { %_837 %_839 } ⊢ { %_840 %_841 %_842 } : { %_840 %_841 %_842 }
 ; {>  %_839~2':_r64 %_838~1':_stg %_837~0':_stg }
; _f53 { 0' 2' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' } ⊢ { 0' 1' }
	mov r14,r15
	bt r12,2
	jc LB_849
	btr r12,1
	jmp LB_850
LB_849:
	bts r12,1
LB_850:
	call NS_E_53
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 2' 3' }
	mov r9,r8
	bt r12,3
	jc LB_851
	btr r12,4
	jmp LB_852
LB_851:
	bts r12,4
LB_852:
	mov r8,r9
	bt r12,4
	jc LB_855
	btr r12,3
	jmp LB_856
LB_855:
	bts r12,3
LB_856:
	mov rsi,0
	bt r12,3
	jc LB_853
	bts rsi,17
	bt r8,0
	jc LB_853
	jmp LB_854
LB_853:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,3
LB_854:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
	mov r15,r14
	bt r12,1
	jc LB_857
	btr r12,2
	jmp LB_858
LB_857:
	bts r12,2
LB_858:
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_847
	btr r12,1
	jmp LB_848
LB_847:
	bts r12,1
LB_848:
	add rsp,16
; _f14 { %_838 %_841 %_842 } ⊢ { %_843 %_844 %_845 } : { %_843 %_844 %_845 }
 ; {>  %_838~1':_stg %_841~2':_r64 %_842~3':(_opn)◂(_p52) %_840~0':_stg }
; _f14 { 1' 2' 3' } ⊢ { 1' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_863
	btr r12,4
	jmp LB_864
LB_863:
	bts r12,4
LB_864:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_861
	btr QWORD [rdi],0
	jmp LB_862
LB_861:
	bts QWORD [rdi],0
LB_862:
	mov r9,r15
	bt r12,2
	jc LB_867
	btr r12,4
	jmp LB_868
LB_867:
	bts r12,4
LB_868:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_865
	btr QWORD [rdi],1
	jmp LB_866
LB_865:
	bts QWORD [rdi],1
LB_866:
	mov r9,r8
	bt r12,3
	jc LB_871
	btr r12,4
	jmp LB_872
LB_871:
	bts r12,4
LB_872:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_869
	btr QWORD [rdi],2
	jmp LB_870
LB_869:
	bts QWORD [rdi],2
LB_870:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 1' 2' 3' }
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_875
	btr r12,4
	jmp LB_876
LB_875:
	bts r12,4
LB_876:
	mov r14,r9
	bt r12,4
	jc LB_873
	btr r12,1
	jmp LB_874
LB_873:
	bts r12,1
LB_874:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_879
	btr r12,4
	jmp LB_880
LB_879:
	bts r12,4
LB_880:
	mov r15,r9
	bt r12,4
	jc LB_877
	btr r12,2
	jmp LB_878
LB_877:
	bts r12,2
LB_878:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_883
	btr r12,4
	jmp LB_884
LB_883:
	bts r12,4
LB_884:
	mov r8,r9
	bt r12,4
	jc LB_881
	btr r12,3
	jmp LB_882
LB_881:
	bts r12,3
LB_882:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_859
	btr r12,0
	jmp LB_860
LB_859:
	bts r12,0
LB_860:
	add rsp,16
; ∎ {  }
 ; {>  %_843~1':_stg %_844~2':_r64 %_845~3':(_opn)◂(_p52) %_840~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_885
	mov rdi,r14
	call dlt
LB_885:
	bt r12,2
	jc LB_886
	mov rdi,r15
	call dlt
LB_886:
	bt r12,3
	jc LB_887
	mov rdi,r8
	call dlt
LB_887:
	bt r12,0
	jc LB_888
	mov rdi,r13
	call dlt
LB_888:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_42:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_42
	NS_E_DYN_44:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44
	NS_E_DYN_45:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45
	NS_E_DYN_46:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_46
	NS_E_DYN_47:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47
	NS_E_DYN_90:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_91:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_49:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49
	NS_E_DYN_92:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_93:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_94:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_95:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_51:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_51
	NS_E_DYN_96:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_97:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_53:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_53
	NS_E_DYN_98:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_99:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_55:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55
	NS_E_DYN_100:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_101:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_57:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57
	NS_E_DYN_102:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_103:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_59:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_59
	NS_E_DYN_104:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_61:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_61
	NS_E_DYN_105:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_106:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_63:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_63
	NS_E_DYN_107:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_108:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_109:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_65:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_65
	NS_E_DYN_110:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_111:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_67:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_67
	NS_E_DYN_112:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_69:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_69
	NS_E_DYN_113:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_114:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_71:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_71
	NS_E_DYN_115:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_116:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_73:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_73
	NS_E_DYN_117:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_118:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_75:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_75
	NS_E_DYN_119:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_77:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_77
	NS_E_DYN_120:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_121:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_79:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_79
	NS_E_DYN_122:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_123:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_81:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_81
	NS_E_DYN_124:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_83:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_83
	NS_E_DYN_125:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_126:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_85:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_85
	NS_E_DYN_127:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_128:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_87:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_87
	NS_E_DYN_129:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_130:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_131:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_89:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_89
	CST_DYN_846:
		dq 0x0001_0001_00_82_ffff
		dq 1
