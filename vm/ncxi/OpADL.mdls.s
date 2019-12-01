%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call in0_init
	call NS_E_864
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_16: dq 0
NS_E_16:
NS_E_RDI_16:
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
NS_E_45:
NS_E_RDI_45:
NS_E_45_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_46
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_46:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_47:
NS_E_RDI_47:
NS_E_47_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_47_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_47_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_48:
NS_E_RDI_48:
NS_E_48_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_48_LB_0
	cmp r11,57
	ja NS_E_48_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_48_LB_0:
	mov rax,0
	ret
NS_E_50:
NS_E_RDI_50:
NS_E_50_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_50_LB_0
	cmp r11,122
	ja NS_E_50_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_50_LB_0:
	mov rax,0
	ret
NS_E_49:
NS_E_RDI_49:
NS_E_49_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_49_LB_0
	cmp r11,90
	ja NS_E_49_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_49_LB_0:
	mov rax,0
	ret
NS_E_19:
NS_E_RDI_19:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_23:
	mov rdi,r8
	bt r12,0
NS_E_RDI_23:
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
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_52:
NS_E_RDI_52:
NS_E_52_ETR_TBL:
NS_E_52_TBL:
; c0
	push r14
; "J"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,74
	jz LB_61
	jmp NS_E_52_MTC_0_failed
LB_61:
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
	jc LB_56
	btr QWORD [rdi],0
LB_56:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_52_MTC_0_failed:
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
NS_E_52_MTC_1_failed:
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
; c0
	push r14
; glb_etr
	call NS_E_67_ETR_TBL
	cmp r15,0
	jz LB_154
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_65_MTC_0_failed
LB_154:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; glb_etr_lst
	call NS_E_65_ETR_TBL
	cmp r15,0
	jz LB_158
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_159
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_159:
	jmp NS_E_65_MTC_0_failed
LB_158:
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
	jc LB_149
	btr QWORD [rdi],1
LB_149:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_150
	btr QWORD [rdi],0
LB_150:
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
NS_E_65_MTC_1_failed:
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
; c0
	push r14
; mdl_etr
	call NS_E_69_ETR_TBL
	cmp r15,0
	jz LB_183
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_67_MTC_0_failed
LB_183:
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
	jc LB_179
	btr QWORD [rdi],0
LB_179:
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
; c1
	push r14
; cst_etr
	call NS_E_71_ETR_TBL
	cmp r15,0
	jz LB_177
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_67_MTC_1_failed
LB_177:
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
	jc LB_173
	btr QWORD [rdi],0
LB_173:
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
; c2
	push r14
; op_etr
	call NS_E_73_ETR_TBL
	cmp r15,0
	jz LB_171
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_67_MTC_2_failed
LB_171:
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
	jc LB_167
	btr QWORD [rdi],0
LB_167:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_67_MTC_2_failed:
	pop r14
; c3
	push r14
; dta_etr
	call NS_E_75_ETR_TBL
	cmp r15,0
	jz LB_165
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_67_MTC_3_failed
LB_165:
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
	jc LB_161
	btr QWORD [rdi],0
LB_161:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_67_MTC_3_failed:
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
; c0
	push r14
; "\194\167\194\167"
	jmp LB_228
LB_227:
	add r14,1
LB_228:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_227
	cmp rax,10
	jz LB_227
	cmp rax,32
	jz LB_227
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_230
	jmp NS_E_69_MTC_0_failed
LB_230:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_231
	jmp NS_E_69_MTC_0_failed
LB_231:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_232
	jmp NS_E_69_MTC_0_failed
LB_232:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_233
	jmp NS_E_69_MTC_0_failed
LB_233:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_240
LB_239:
	add r14,1
LB_240:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_239
	cmp rax,10
	jz LB_239
	cmp rax,32
	jz LB_239
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_241
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_242
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_242:
	jmp NS_E_69_MTC_0_failed
LB_241:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; glb_etr_lst
	jmp LB_245
LB_244:
	add r14,1
LB_245:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_244
	cmp rax,10
	jz LB_244
	cmp rax,32
	jz LB_244
	call NS_E_65_ETR_TBL
	cmp r15,0
	jz LB_246
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_247
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_247:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_248
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_248:
	jmp NS_E_69_MTC_0_failed
LB_246:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; "\226\136\142\226\136\142"
	jmp LB_251
LB_250:
	add r14,1
LB_251:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_250
	cmp rax,10
	jz LB_250
	cmp rax,32
	jz LB_250
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_253
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_280
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_280:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_281
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_281:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_282
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_282:
	jmp NS_E_69_MTC_0_failed
LB_253:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_254
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_276
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_276:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_277
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_277:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_278
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_278:
	jmp NS_E_69_MTC_0_failed
LB_254:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_255
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_272
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_272:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_273
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_273:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_274
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_274:
	jmp NS_E_69_MTC_0_failed
LB_255:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,226
	jz LB_256
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_268
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_268:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_269
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_269:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_270
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_270:
	jmp NS_E_69_MTC_0_failed
LB_256:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+4]
	cmp al,136
	jz LB_257
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
	jmp NS_E_69_MTC_0_failed
LB_257:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+5]
	cmp al,142
	jz LB_258
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
	jmp NS_E_69_MTC_0_failed
LB_258:
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
	jc LB_222
	btr QWORD [rdi],3
LB_222:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_223
	btr QWORD [rdi],2
LB_223:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_224
	btr QWORD [rdi],1
LB_224:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_225
	btr QWORD [rdi],0
LB_225:
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
; c1
	push r14
; "\194\167\194\167"
	jmp LB_191
LB_190:
	add r14,1
LB_191:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_190
	cmp rax,10
	jz LB_190
	cmp rax,32
	jz LB_190
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_193
	jmp NS_E_69_MTC_1_failed
LB_193:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_194
	jmp NS_E_69_MTC_1_failed
LB_194:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_195
	jmp NS_E_69_MTC_1_failed
LB_195:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_196
	jmp NS_E_69_MTC_1_failed
LB_196:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_203
LB_202:
	add r14,1
LB_203:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_202
	cmp rax,10
	jz LB_202
	cmp rax,32
	jz LB_202
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_204
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_205
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_205:
	jmp NS_E_69_MTC_1_failed
LB_204:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_208
LB_207:
	add r14,1
LB_208:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_207
	cmp rax,10
	jz LB_207
	cmp rax,32
	jz LB_207
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_210
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_212
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_212:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_213
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_213:
	jmp NS_E_69_MTC_1_failed
LB_210:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_216
LB_215:
	add r14,1
LB_216:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_215
	cmp rax,10
	jz LB_215
	cmp rax,32
	jz LB_215
	call NS_E_83_ETR_TBL
	cmp r15,0
	jz LB_217
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_218
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_218:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_219
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_219:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_220
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_220:
	jmp NS_E_69_MTC_1_failed
LB_217:
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
	jc LB_185
	btr QWORD [rdi],3
LB_185:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_186
	btr QWORD [rdi],2
LB_186:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_187
	btr QWORD [rdi],1
LB_187:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_188
	btr QWORD [rdi],0
LB_188:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_69_MTC_1_failed:
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
; c0
	push r14
; "\194\167"
	jmp LB_323
LB_322:
	add r14,1
LB_323:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_322
	cmp rax,10
	jz LB_322
	cmp rax,32
	jz LB_322
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_325
	jmp NS_E_71_MTC_0_failed
LB_325:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_326
	jmp NS_E_71_MTC_0_failed
LB_326:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_331
LB_330:
	add r14,1
LB_331:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_330
	cmp rax,10
	jz LB_330
	cmp rax,32
	jz LB_330
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_332
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_333
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_333:
	jmp NS_E_71_MTC_0_failed
LB_332:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\194\171"
	jmp LB_336
LB_335:
	add r14,1
LB_336:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_335
	cmp rax,10
	jz LB_335
	cmp rax,32
	jz LB_335
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_338
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_344
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_344:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_345
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_345:
	jmp NS_E_71_MTC_0_failed
LB_338:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,171
	jz LB_339
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_341
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_341:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_342
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_342:
	jmp NS_E_71_MTC_0_failed
LB_339:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; op_lines
	jmp LB_348
LB_347:
	add r14,1
LB_348:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_347
	cmp rax,10
	jz LB_347
	cmp rax,32
	jz LB_347
	call NS_E_89_ETR_TBL
	cmp r15,0
	jz LB_349
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_350
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_350:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_351
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_351:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_352
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_352:
	jmp NS_E_71_MTC_0_failed
LB_349:
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
	jc LB_317
	btr QWORD [rdi],3
LB_317:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_318
	btr QWORD [rdi],2
LB_318:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_319
	btr QWORD [rdi],1
LB_319:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_320
	btr QWORD [rdi],0
LB_320:
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
; c1
	push r14
; "\194\167"
	jmp LB_290
LB_289:
	add r14,1
LB_290:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_289
	cmp rax,10
	jz LB_289
	cmp rax,32
	jz LB_289
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_292
	jmp NS_E_71_MTC_1_failed
LB_292:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_293
	jmp NS_E_71_MTC_1_failed
LB_293:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_298
LB_297:
	add r14,1
LB_298:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_297
	cmp rax,10
	jz LB_297
	cmp rax,32
	jz LB_297
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_299
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_300
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_300:
	jmp NS_E_71_MTC_1_failed
LB_299:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_303
LB_302:
	add r14,1
LB_303:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_302
	cmp rax,10
	jz LB_302
	cmp rax,32
	jz LB_302
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_305
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_307
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_307:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_308
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_308:
	jmp NS_E_71_MTC_1_failed
LB_305:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; cst
	jmp LB_311
LB_310:
	add r14,1
LB_311:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_310
	cmp rax,10
	jz LB_310
	cmp rax,32
	jz LB_310
	call NS_E_77_ETR_TBL
	cmp r15,0
	jz LB_312
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_313
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_313:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_314
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_314:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_315
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_315:
	jmp NS_E_71_MTC_1_failed
LB_312:
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
	jc LB_284
	btr QWORD [rdi],3
LB_284:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_285
	btr QWORD [rdi],2
LB_285:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_286
	btr QWORD [rdi],1
LB_286:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_287
	btr QWORD [rdi],0
LB_287:
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
; c0
	push r14
; "\194\167"
	jmp LB_393
LB_392:
	add r14,1
LB_393:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_392
	cmp rax,10
	jz LB_392
	cmp rax,32
	jz LB_392
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_395
	jmp NS_E_73_MTC_0_failed
LB_395:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_396
	jmp NS_E_73_MTC_0_failed
LB_396:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_401
LB_400:
	add r14,1
LB_401:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_400
	cmp rax,10
	jz LB_400
	cmp rax,32
	jz LB_400
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_402
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_403
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_403:
	jmp NS_E_73_MTC_0_failed
LB_402:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; reg_ptn
	jmp LB_406
LB_405:
	add r14,1
LB_406:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_405
	cmp rax,10
	jz LB_405
	cmp rax,32
	jz LB_405
	call NS_E_101_ETR_TBL
	cmp r15,0
	jz LB_407
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_408
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_408:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_409
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_409:
	jmp NS_E_73_MTC_0_failed
LB_407:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; op_lines
	jmp LB_412
LB_411:
	add r14,1
LB_412:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_411
	cmp rax,10
	jz LB_411
	cmp rax,32
	jz LB_411
	call NS_E_89_ETR_TBL
	cmp r15,0
	jz LB_413
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_414
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_414:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_415
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_415:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_416
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_416:
	jmp NS_E_73_MTC_0_failed
LB_413:
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
	jc LB_387
	btr QWORD [rdi],3
LB_387:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_388
	btr QWORD [rdi],2
LB_388:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_389
	btr QWORD [rdi],1
LB_389:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_390
	btr QWORD [rdi],0
LB_390:
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
; c1
	push r14
; "\194\167"
	jmp LB_360
LB_359:
	add r14,1
LB_360:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_359
	cmp rax,10
	jz LB_359
	cmp rax,32
	jz LB_359
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_362
	jmp NS_E_73_MTC_1_failed
LB_362:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_363
	jmp NS_E_73_MTC_1_failed
LB_363:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_368
LB_367:
	add r14,1
LB_368:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_367
	cmp rax,10
	jz LB_367
	cmp rax,32
	jz LB_367
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_369
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_370
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_370:
	jmp NS_E_73_MTC_1_failed
LB_369:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_373
LB_372:
	add r14,1
LB_373:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_372
	cmp rax,10
	jz LB_372
	cmp rax,32
	jz LB_372
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_375
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_377
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_377:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_378
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_378:
	jmp NS_E_73_MTC_1_failed
LB_375:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_381
LB_380:
	add r14,1
LB_381:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_380
	cmp rax,10
	jz LB_380
	cmp rax,32
	jz LB_380
	call NS_E_83_ETR_TBL
	cmp r15,0
	jz LB_382
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_383
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_383:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_384
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_384:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_385
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_385:
	jmp NS_E_73_MTC_1_failed
LB_382:
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
	jc LB_354
	btr QWORD [rdi],3
LB_354:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_355
	btr QWORD [rdi],2
LB_355:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_356
	btr QWORD [rdi],1
LB_356:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_357
	btr QWORD [rdi],0
LB_357:
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
; c0
	push r14
; "\194\182"
	jmp LB_456
LB_455:
	add r14,1
LB_456:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_455
	cmp rax,10
	jz LB_455
	cmp rax,32
	jz LB_455
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_458
	jmp NS_E_75_MTC_0_failed
LB_458:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_459
	jmp NS_E_75_MTC_0_failed
LB_459:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_464
LB_463:
	add r14,1
LB_464:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_463
	cmp rax,10
	jz LB_463
	cmp rax,32
	jz LB_463
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_465
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_466
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_466:
	jmp NS_E_75_MTC_0_failed
LB_465:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; dta_def
	jmp LB_469
LB_468:
	add r14,1
LB_469:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_468
	cmp rax,10
	jz LB_468
	cmp rax,32
	jz LB_468
	call NS_E_85_ETR_TBL
	cmp r15,0
	jz LB_470
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_471
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_471:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_472
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_472:
	jmp NS_E_75_MTC_0_failed
LB_470:
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
	jc LB_451
	btr QWORD [rdi],2
LB_451:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_452
	btr QWORD [rdi],1
LB_452:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_453
	btr QWORD [rdi],0
LB_453:
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
; c1
	push r14
; "\194\182"
	jmp LB_424
LB_423:
	add r14,1
LB_424:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_423
	cmp rax,10
	jz LB_423
	cmp rax,32
	jz LB_423
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_426
	jmp NS_E_75_MTC_1_failed
LB_426:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_427
	jmp NS_E_75_MTC_1_failed
LB_427:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_432
LB_431:
	add r14,1
LB_432:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_431
	cmp rax,10
	jz LB_431
	cmp rax,32
	jz LB_431
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_433
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_434
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_434:
	jmp NS_E_75_MTC_1_failed
LB_433:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_437
LB_436:
	add r14,1
LB_437:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_436
	cmp rax,10
	jz LB_436
	cmp rax,32
	jz LB_436
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_439
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_441
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_441:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_442
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_442:
	jmp NS_E_75_MTC_1_failed
LB_439:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_445
LB_444:
	add r14,1
LB_445:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_444
	cmp rax,10
	jz LB_444
	cmp rax,32
	jz LB_444
	call NS_E_83_ETR_TBL
	cmp r15,0
	jz LB_446
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_447
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_447:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_448
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_448:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_449
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_449:
	jmp NS_E_75_MTC_1_failed
LB_446:
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
	jc LB_418
	btr QWORD [rdi],3
LB_418:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_419
	btr QWORD [rdi],2
LB_419:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_420
	btr QWORD [rdi],1
LB_420:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_421
	btr QWORD [rdi],0
LB_421:
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
; c0
	push r14
; "0xr0"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,48
	jz LB_479
	jmp NS_E_77_MTC_0_failed
LB_479:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,120
	jz LB_480
	jmp NS_E_77_MTC_0_failed
LB_480:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,114
	jz LB_481
	jmp NS_E_77_MTC_0_failed
LB_481:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,48
	jz LB_482
	jmp NS_E_77_MTC_0_failed
LB_482:
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
; c0
	push r14
; cha
	call NS_E_81_ETR_TBL
	cmp r15,0
	jz LB_494
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_79_MTC_0_failed
LB_494:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; word
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_498
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_499
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_499:
	jmp NS_E_79_MTC_0_failed
LB_498:
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
	jc LB_489
	btr QWORD [rdi],1
LB_489:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_490
	btr QWORD [rdi],0
LB_490:
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
; c0
	push r14
; "a"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,97
	jz LB_522
	jmp NS_E_81_MTC_0_failed
LB_522:
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
NS_E_81_MTC_0_failed:
	pop r14
; c1
	push r14
; "b"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,98
	jz LB_514
	jmp NS_E_81_MTC_1_failed
LB_514:
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
NS_E_81_MTC_1_failed:
	pop r14
; c2
	push r14
; "c"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,99
	jz LB_506
	jmp NS_E_81_MTC_2_failed
LB_506:
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
	jc LB_501
	btr QWORD [rdi],0
LB_501:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_81_MTC_2_failed:
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
; c0
	push r14
; word
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_537
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_83_MTC_0_failed
LB_537:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "."
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,46
	jz LB_542
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_544
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_544:
	jmp NS_E_83_MTC_0_failed
LB_542:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; name
	call NS_E_83_ETR_TBL
	cmp r15,0
	jz LB_548
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_549
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_549:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_550
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_550:
	jmp NS_E_83_MTC_0_failed
LB_548:
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
	jc LB_531
	btr QWORD [rdi],2
LB_531:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_532
	btr QWORD [rdi],1
LB_532:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_533
	btr QWORD [rdi],0
LB_533:
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
; c1
	push r14
; word
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_529
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_83_MTC_1_failed
LB_529:
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
	jc LB_525
	btr QWORD [rdi],0
LB_525:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_83_MTC_1_failed:
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
; c0
	push r14
; dta_def_coprd
	call NS_E_87_ETR_TBL
	cmp r15,0
	jz LB_556
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_85_MTC_0_failed
LB_556:
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
	jc LB_552
	btr QWORD [rdi],0
LB_552:
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
; c0
	push r14
; "\226\136\144"
	jmp LB_599
LB_598:
	add r14,1
LB_599:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_598
	cmp rax,10
	jz LB_598
	cmp rax,32
	jz LB_598
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_601
	jmp NS_E_87_MTC_0_failed
LB_601:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_602
	jmp NS_E_87_MTC_0_failed
LB_602:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_603
	jmp NS_E_87_MTC_0_failed
LB_603:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_609
LB_608:
	add r14,1
LB_609:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_608
	cmp rax,10
	jz LB_608
	cmp rax,32
	jz LB_608
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_610
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_611
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_611:
	jmp NS_E_87_MTC_0_failed
LB_610:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_614
LB_613:
	add r14,1
LB_614:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_613
	cmp rax,10
	jz LB_613
	cmp rax,32
	jz LB_613
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_616
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_618
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_618:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_619
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_619:
	jmp NS_E_87_MTC_0_failed
LB_616:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_622
LB_621:
	add r14,1
LB_622:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_621
	cmp rax,10
	jz LB_621
	cmp rax,32
	jz LB_621
	call NS_E_93_ETR_TBL
	cmp r15,0
	jz LB_623
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_624
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_624:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_625
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_625:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_626
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_626:
	jmp NS_E_87_MTC_0_failed
LB_623:
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
	jc LB_593
	btr QWORD [rdi],3
LB_593:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_594
	btr QWORD [rdi],2
LB_594:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_595
	btr QWORD [rdi],1
LB_595:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_596
	btr QWORD [rdi],0
LB_596:
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
; c1
	push r14
; "\226\136\144"
	jmp LB_564
LB_563:
	add r14,1
LB_564:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_563
	cmp rax,10
	jz LB_563
	cmp rax,32
	jz LB_563
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_566
	jmp NS_E_87_MTC_1_failed
LB_566:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_567
	jmp NS_E_87_MTC_1_failed
LB_567:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_568
	jmp NS_E_87_MTC_1_failed
LB_568:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_574
LB_573:
	add r14,1
LB_574:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_573
	cmp rax,10
	jz LB_573
	cmp rax,32
	jz LB_573
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_575
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_576
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_576:
	jmp NS_E_87_MTC_1_failed
LB_575:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_579
LB_578:
	add r14,1
LB_579:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_578
	cmp rax,10
	jz LB_578
	cmp rax,32
	jz LB_578
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_581
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_583
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_583:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_584
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_584:
	jmp NS_E_87_MTC_1_failed
LB_581:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_587
LB_586:
	add r14,1
LB_587:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_586
	cmp rax,10
	jz LB_586
	cmp rax,32
	jz LB_586
	call NS_E_93_ETR_TBL
	cmp r15,0
	jz LB_588
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_589
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_589:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_590
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_590:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_591
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_591:
	jmp NS_E_87_MTC_1_failed
LB_588:
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
	jc LB_558
	btr QWORD [rdi],3
LB_558:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_559
	btr QWORD [rdi],2
LB_559:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_560
	btr QWORD [rdi],1
LB_560:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_561
	btr QWORD [rdi],0
LB_561:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
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
; c0
	push r14
; op
	jmp LB_652
LB_651:
	add r14,1
LB_652:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_651
	cmp rax,10
	jz LB_651
	cmp rax,32
	jz LB_651
	call NS_E_91_ETR_TBL
	cmp r15,0
	jz LB_653
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_89_MTC_0_failed
LB_653:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn
	jmp LB_656
LB_655:
	add r14,1
LB_656:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_655
	cmp rax,10
	jz LB_655
	cmp rax,32
	jz LB_655
	call NS_E_101_ETR_TBL
	cmp r15,0
	jz LB_657
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_658
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_658:
	jmp NS_E_89_MTC_0_failed
LB_657:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\226\138\162"
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
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_663
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_673
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_673:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_674
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_674:
	jmp NS_E_89_MTC_0_failed
LB_663:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,138
	jz LB_664
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_670
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_670:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_671
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_671:
	jmp NS_E_89_MTC_0_failed
LB_664:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,162
	jz LB_665
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_667
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_667:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_668
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_668:
	jmp NS_E_89_MTC_0_failed
LB_665:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; reg_ptn
	jmp LB_677
LB_676:
	add r14,1
LB_677:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_676
	cmp rax,10
	jz LB_676
	cmp rax,32
	jz LB_676
	call NS_E_101_ETR_TBL
	cmp r15,0
	jz LB_678
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_679
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_679:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_680
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_680:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_681
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_681:
	jmp NS_E_89_MTC_0_failed
LB_678:
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
	jc LB_646
	btr QWORD [rdi],3
LB_646:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_647
	btr QWORD [rdi],2
LB_647:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_648
	btr QWORD [rdi],1
LB_648:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_649
	btr QWORD [rdi],0
LB_649:
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
; c1
	push r14
; "\226\136\142"
	jmp LB_632
LB_631:
	add r14,1
LB_632:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_631
	cmp rax,10
	jz LB_631
	cmp rax,32
	jz LB_631
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_634
	jmp NS_E_89_MTC_1_failed
LB_634:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_635
	jmp NS_E_89_MTC_1_failed
LB_635:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_636
	jmp NS_E_89_MTC_1_failed
LB_636:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn
	jmp LB_642
LB_641:
	add r14,1
LB_642:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_641
	cmp rax,10
	jz LB_641
	cmp rax,32
	jz LB_641
	call NS_E_101_ETR_TBL
	cmp r15,0
	jz LB_643
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_644
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_644:
	jmp NS_E_89_MTC_1_failed
LB_643:
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
	jc LB_628
	btr QWORD [rdi],1
LB_628:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_629
	btr QWORD [rdi],0
LB_629:
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
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_91:
NS_E_RDI_91:
NS_E_91_ETR_TBL:
NS_E_91_TBL:
; c0
	push r14
; name
	jmp LB_702
LB_701:
	add r14,1
LB_702:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_701
	cmp rax,10
	jz LB_701
	cmp rax,32
	jz LB_701
	call NS_E_83_ETR_TBL
	cmp r15,0
	jz LB_703
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_91_MTC_0_failed
LB_703:
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
	jc LB_699
	btr QWORD [rdi],0
LB_699:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_91_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\187"
	jmp LB_687
LB_686:
	add r14,1
LB_687:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_686
	cmp rax,10
	jz LB_686
	cmp rax,32
	jz LB_686
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_689
	jmp NS_E_91_MTC_1_failed
LB_689:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,187
	jz LB_690
	jmp NS_E_91_MTC_1_failed
LB_690:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; cst
	jmp LB_695
LB_694:
	add r14,1
LB_695:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_694
	cmp rax,10
	jz LB_694
	cmp rax,32
	jz LB_694
	call NS_E_77_ETR_TBL
	cmp r15,0
	jz LB_696
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_697
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_697:
	jmp NS_E_91_MTC_1_failed
LB_696:
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
	jc LB_683
	btr QWORD [rdi],1
LB_683:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_684
	btr QWORD [rdi],0
LB_684:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_91_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_93:
NS_E_RDI_93:
NS_E_93_ETR_TBL:
NS_E_93_TBL:
; c0
	push r14
; type_imp
	call NS_E_95_ETR_TBL
	cmp r15,0
	jz LB_709
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_93_MTC_0_failed
LB_709:
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
	jc LB_705
	btr QWORD [rdi],0
LB_705:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_93_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_95:
NS_E_RDI_95:
NS_E_95_ETR_TBL:
NS_E_95_TBL:
; c0
	push r14
; type_app
	jmp LB_722
LB_721:
	add r14,1
LB_722:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_721
	cmp rax,10
	jz LB_721
	cmp rax,32
	jz LB_721
	call NS_E_97_ETR_TBL
	cmp r15,0
	jz LB_723
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_95_MTC_0_failed
LB_723:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\134\146"
	jmp LB_726
LB_725:
	add r14,1
LB_726:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_725
	cmp rax,10
	jz LB_725
	cmp rax,32
	jz LB_725
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_728
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_736
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_736:
	jmp NS_E_95_MTC_0_failed
LB_728:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,134
	jz LB_729
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_734
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_734:
	jmp NS_E_95_MTC_0_failed
LB_729:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,146
	jz LB_730
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_732
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_732:
	jmp NS_E_95_MTC_0_failed
LB_730:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_imp
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
	call NS_E_95_ETR_TBL
	cmp r15,0
	jz LB_740
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_741
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_741:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_742
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_742:
	jmp NS_E_95_MTC_0_failed
LB_740:
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
	jc LB_717
	btr QWORD [rdi],2
LB_717:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_718
	btr QWORD [rdi],1
LB_718:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_719
	btr QWORD [rdi],0
LB_719:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_95_MTC_0_failed:
	pop r14
; c1
	push r14
; type_app
	jmp LB_714
LB_713:
	add r14,1
LB_714:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_713
	cmp rax,10
	jz LB_713
	cmp rax,32
	jz LB_713
	call NS_E_97_ETR_TBL
	cmp r15,0
	jz LB_715
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_95_MTC_1_failed
LB_715:
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
	jc LB_711
	btr QWORD [rdi],0
LB_711:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_95_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_97:
NS_E_RDI_97:
NS_E_97_ETR_TBL:
NS_E_97_TBL:
; c0
	push r14
; type_atm
	jmp LB_755
LB_754:
	add r14,1
LB_755:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_754
	cmp rax,10
	jz LB_754
	cmp rax,32
	jz LB_754
	call NS_E_99_ETR_TBL
	cmp r15,0
	jz LB_756
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_97_MTC_0_failed
LB_756:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\151\130"
	jmp LB_759
LB_758:
	add r14,1
LB_759:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_758
	cmp rax,10
	jz LB_758
	cmp rax,32
	jz LB_758
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_761
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_769
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_769:
	jmp NS_E_97_MTC_0_failed
LB_761:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,151
	jz LB_762
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_767
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_767:
	jmp NS_E_97_MTC_0_failed
LB_762:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,130
	jz LB_763
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_765
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_765:
	jmp NS_E_97_MTC_0_failed
LB_763:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_atm
	jmp LB_772
LB_771:
	add r14,1
LB_772:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_771
	cmp rax,10
	jz LB_771
	cmp rax,32
	jz LB_771
	call NS_E_99_ETR_TBL
	cmp r15,0
	jz LB_773
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_774
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_774:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_775
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_775:
	jmp NS_E_97_MTC_0_failed
LB_773:
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
	jc LB_750
	btr QWORD [rdi],2
LB_750:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_751
	btr QWORD [rdi],1
LB_751:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_752
	btr QWORD [rdi],0
LB_752:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_97_MTC_0_failed:
	pop r14
; c1
	push r14
; type_atm
	jmp LB_747
LB_746:
	add r14,1
LB_747:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_746
	cmp rax,10
	jz LB_746
	cmp rax,32
	jz LB_746
	call NS_E_99_ETR_TBL
	cmp r15,0
	jz LB_748
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_97_MTC_1_failed
LB_748:
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
	jc LB_744
	btr QWORD [rdi],0
LB_744:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_97_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_99:
NS_E_RDI_99:
NS_E_99_ETR_TBL:
NS_E_99_TBL:
; c0
	push r14
; word
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_781
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_99_MTC_0_failed
LB_781:
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
	jc LB_777
	btr QWORD [rdi],0
LB_777:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_99_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_101:
NS_E_RDI_101:
NS_E_101_ETR_TBL:
NS_E_101_TBL:
; c0
	push r14
; "{"
	jmp LB_794
LB_793:
	add r14,1
LB_794:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_793
	cmp rax,10
	jz LB_793
	cmp rax,32
	jz LB_793
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,123
	jz LB_796
	jmp NS_E_101_MTC_0_failed
LB_796:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_800
LB_799:
	add r14,1
LB_800:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_799
	cmp rax,10
	jz LB_799
	cmp rax,32
	jz LB_799
	call NS_E_103_ETR_TBL
	cmp r15,0
	jz LB_801
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_802
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_802:
	jmp NS_E_101_MTC_0_failed
LB_801:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "}"
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
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,125
	jz LB_807
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_809
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_809:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_810
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_810:
	jmp NS_E_101_MTC_0_failed
LB_807:
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
	jc LB_789
	btr QWORD [rdi],2
LB_789:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_790
	btr QWORD [rdi],1
LB_790:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_791
	btr QWORD [rdi],0
LB_791:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_101_MTC_0_failed:
	pop r14
; c1
	push r14
; reg
	jmp LB_786
LB_785:
	add r14,1
LB_786:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_785
	cmp rax,10
	jz LB_785
	cmp rax,32
	jz LB_785
	call NS_E_105_ETR_TBL
	cmp r15,0
	jz LB_787
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_101_MTC_1_failed
LB_787:
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
	jc LB_783
	btr QWORD [rdi],0
LB_783:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_101_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_103:
NS_E_RDI_103:
NS_E_103_ETR_TBL:
NS_E_103_TBL:
; c0
	push r14
; reg
	jmp LB_817
LB_816:
	add r14,1
LB_817:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_816
	cmp rax,10
	jz LB_816
	cmp rax,32
	jz LB_816
	call NS_E_105_ETR_TBL
	cmp r15,0
	jz LB_818
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_103_MTC_0_failed
LB_818:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn_lst
	jmp LB_821
LB_820:
	add r14,1
LB_821:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_820
	cmp rax,10
	jz LB_820
	cmp rax,32
	jz LB_820
	call NS_E_103_ETR_TBL
	cmp r15,0
	jz LB_822
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_823
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_823:
	jmp NS_E_103_MTC_0_failed
LB_822:
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
	jc LB_813
	btr QWORD [rdi],1
LB_813:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_814
	btr QWORD [rdi],0
LB_814:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_103_MTC_0_failed:
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
NS_E_103_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_105:
NS_E_RDI_105:
NS_E_105_ETR_TBL:
NS_E_105_TBL:
; c0
	push r14
; "%"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,37
	jz LB_845
	jmp NS_E_105_MTC_0_failed
LB_845:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_850
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_851
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_851:
	jmp NS_E_105_MTC_0_failed
LB_850:
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
	jc LB_839
	btr QWORD [rdi],1
LB_839:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_840
	btr QWORD [rdi],0
LB_840:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_105_MTC_0_failed:
	pop r14
; c1
	push r14
; word
	jmp LB_836
LB_835:
	add r14,1
LB_836:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_835
	cmp rax,10
	jz LB_835
	cmp rax,32
	jz LB_835
	call NS_E_79_ETR_TBL
	cmp r15,0
	jz LB_837
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_105_MTC_1_failed
LB_837:
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
	jc LB_833
	btr QWORD [rdi],0
LB_833:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_105_MTC_1_failed:
	pop r14
; c2
	push r14
; "_"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,95
	jz LB_830
	jmp NS_E_105_MTC_2_failed
LB_830:
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
	jc LB_825
	btr QWORD [rdi],0
LB_825:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_105_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_864:
NS_E_RDI_864:
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
; 	» "a" _ ⊢ 1' : %_854
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; » 0xr0 |~ {  } ⊢ %_855 : %_855
 ; {>  %_853~0':_stg %_854~1':_stg }
; 	» 0xr0 _ ⊢ 2' : %_855
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f69 { %_853 %_855 } ⊢ { %_856 %_857 %_858 } : { %_856 %_857 %_858 }
 ; {>  %_855~2':_r64 %_853~0':_stg %_854~1':_stg }
; _f69 { 0' 2' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' } ⊢ { 0' 1' }
	mov r14,r15
	bt r12,2
	jc LB_867
	btr r12,1
	jmp LB_868
LB_867:
	bts r12,1
LB_868:
	call NS_E_69
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 2' 3' }
	mov r9,r8
	bt r12,3
	jc LB_869
	btr r12,4
	jmp LB_870
LB_869:
	bts r12,4
LB_870:
	mov r8,r9
	bt r12,4
	jc LB_873
	btr r12,3
	jmp LB_874
LB_873:
	bts r12,3
LB_874:
	mov rsi,0
	bt r12,3
	jc LB_871
	bts rsi,17
	bt r8,0
	jc LB_871
	jmp LB_872
LB_871:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,3
LB_872:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
	mov r15,r14
	bt r12,1
	jc LB_875
	btr r12,2
	jmp LB_876
LB_875:
	bts r12,2
LB_876:
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_865
	btr r12,1
	jmp LB_866
LB_865:
	bts r12,1
LB_866:
	add rsp,16
; _f16 { %_854 %_857 %_858 } ⊢ { %_859 %_860 %_861 } : { %_859 %_860 %_861 }
 ; {>  %_856~0':_stg %_858~3':(_opn)◂(_p68) %_857~2':_r64 %_854~1':_stg }
; _f16 { 1' 2' 3' } ⊢ { 1' 2' 3' }
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
	jc LB_881
	btr r12,4
	jmp LB_882
LB_881:
	bts r12,4
LB_882:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_879
	btr QWORD [rdi],0
	jmp LB_880
LB_879:
	bts QWORD [rdi],0
LB_880:
	mov r9,r15
	bt r12,2
	jc LB_885
	btr r12,4
	jmp LB_886
LB_885:
	bts r12,4
LB_886:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_883
	btr QWORD [rdi],1
	jmp LB_884
LB_883:
	bts QWORD [rdi],1
LB_884:
	mov r9,r8
	bt r12,3
	jc LB_889
	btr r12,4
	jmp LB_890
LB_889:
	bts r12,4
LB_890:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_887
	btr QWORD [rdi],2
	jmp LB_888
LB_887:
	bts QWORD [rdi],2
LB_888:
	call NS_E_16
; _emt_mov_ptn_to_ptn 0' ⊢ { 1' 2' 3' }
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_893
	btr r12,4
	jmp LB_894
LB_893:
	bts r12,4
LB_894:
	mov r14,r9
	bt r12,4
	jc LB_891
	btr r12,1
	jmp LB_892
LB_891:
	bts r12,1
LB_892:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_897
	btr r12,4
	jmp LB_898
LB_897:
	bts r12,4
LB_898:
	mov r15,r9
	bt r12,4
	jc LB_895
	btr r12,2
	jmp LB_896
LB_895:
	bts r12,2
LB_896:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_901
	btr r12,4
	jmp LB_902
LB_901:
	bts r12,4
LB_902:
	mov r8,r9
	bt r12,4
	jc LB_899
	btr r12,3
	jmp LB_900
LB_899:
	bts r12,3
LB_900:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_877
	btr r12,0
	jmp LB_878
LB_877:
	bts r12,0
LB_878:
	add rsp,16
; _f14 {  } ⊢ %_862 : %_862
 ; {>  %_856~0':_stg %_859~1':_stg %_860~2':_r64 %_861~3':(_opn)◂(_p68) }
; _f14 {  } ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_911
	btr r12,4
	jmp LB_912
LB_911:
	bts r12,4
LB_912:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_909
	btr r12,3
	jmp LB_910
LB_909:
	bts r12,3
LB_910:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_907
	btr r12,2
	jmp LB_908
LB_907:
	bts r12,2
LB_908:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_905
	btr r12,1
	jmp LB_906
LB_905:
	bts r12,1
LB_906:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_903
	btr r12,0
	jmp LB_904
LB_903:
	bts r12,0
LB_904:
	add rsp,40
; _f16 %_862 ⊢ %_863 : %_863
 ; {>  %_856~0':_stg %_859~1':_stg %_860~2':_r64 %_861~3':(_opn)◂(_p68) %_862~4':_stg }
; _f16 4' ⊢ 4'
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
	jc LB_921
	btr r12,0
	jmp LB_922
LB_921:
	bts r12,0
LB_922:
	call NS_E_16
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_923
	btr r12,4
	jmp LB_924
LB_923:
	bts r12,4
LB_924:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_919
	btr r12,3
	jmp LB_920
LB_919:
	bts r12,3
LB_920:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_917
	btr r12,2
	jmp LB_918
LB_917:
	bts r12,2
LB_918:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_915
	btr r12,1
	jmp LB_916
LB_915:
	bts r12,1
LB_916:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_913
	btr r12,0
	jmp LB_914
LB_913:
	bts r12,0
LB_914:
	add rsp,40
; ∎ {  }
 ; {>  %_856~0':_stg %_859~1':_stg %_860~2':_r64 %_861~3':(_opn)◂(_p68) %_863~4':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_925
	mov rdi,r13
	call dlt
LB_925:
	bt r12,1
	jc LB_926
	mov rdi,r14
	call dlt
LB_926:
	bt r12,2
	jc LB_927
	mov rdi,r15
	call dlt
LB_927:
	bt r12,3
	jc LB_928
	mov rdi,r8
	call dlt
LB_928:
	bt r12,4
	jc LB_929
	mov rdi,r9
	call dlt
LB_929:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_45:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45
	NS_E_DYN_47:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47
	NS_E_DYN_48:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48
	NS_E_DYN_49:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49
	NS_E_DYN_50:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_50
	NS_E_DYN_53:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_54:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_52:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_52
	NS_E_DYN_106:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_107:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_65:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_65
	NS_E_DYN_108:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_109:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_110:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_111:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_67:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_67
	NS_E_DYN_112:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_113:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_69:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_69
	NS_E_DYN_114:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_115:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_71:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_71
	NS_E_DYN_116:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_117:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_73:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_73
	NS_E_DYN_118:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_119:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_75:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_75
	NS_E_DYN_120:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_77:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_77
	NS_E_DYN_121:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_122:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_79:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_79
	NS_E_DYN_123:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_124:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_125:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_81:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_81
	NS_E_DYN_126:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_127:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_83:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_83
	NS_E_DYN_128:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_85:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_85
	NS_E_DYN_129:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_130:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_87:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_87
	NS_E_DYN_131:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_132:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_89:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_89
	NS_E_DYN_133:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_134:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_91:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_91
	NS_E_DYN_135:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_93:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_93
	NS_E_DYN_136:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_137:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_95:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_95
	NS_E_DYN_138:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_139:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_97:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_97
	NS_E_DYN_140:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_99:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_99
	NS_E_DYN_141:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_142:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_101:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_101
	NS_E_DYN_143:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_144:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_103:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_103
	NS_E_DYN_145:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_146:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_147:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_105:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_105
	CST_DYN_864:
		dq 0x0001_0001_00_82_ffff
		dq 1
