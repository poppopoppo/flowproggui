%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_203
	mov QWORD [CST_DYN_203+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_203],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_252
	call exec_out
	jmp _end
NS_E_148:
NS_E_RDI_148:
NS_E_148_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_148_LB_0
	bt r11,7
	jc LB_149
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
LB_149:
	add rsi,1
	bt r11,6
	jc LB_150
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
LB_150:
	add rsi,1
	bt r11,5
	jc LB_151
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
LB_151:
	add rsi,1
	bt r11,5
	jc LB_151
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
NS_E_148_LB_0:
	mov rax,0
	ret
NS_E_14:
NS_E_RDI_14:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_18:
	mov rdi,r8
	bt r12,0
NS_E_RDI_18:
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
NS_E_153:
NS_E_RDI_153:
	mov rdi,r8
	mov rsi,r9
	mov rbx,rdi
	mov r14,rsi
	mov rdx,[rdi]
	mov rcx,rdx
	shl rcx,16
	shr rcx,48
	shl rcx,3
	and rdx,0xf
	sub rcx,rdx
	shl rcx,1
	imul rcx,1
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_153_TBL
NS_E_153_ETR_TBL:
	push QWORD 1
NS_E_153_TBL:
	push rsi
; _chr
	call NS_E_148_ETR_TBL
	cmp rax,0
	jnz LB_190
	push rdi
	push rdx
	pop rdx
	pop rdi
	jmp NS_E_153_MTC_0_failed
LB_190:
	mov QWORD [prs_vct+16*0],r11
	mov QWORD [prs_vct+8*1+16*0],r10
; "A"
	mov r11,0
	mov r11b,BYTE [rdi+rsi+8*1+0]
	cmp r11b,65
	jz LB_194
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_195
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_195:
	pop rdx
	pop rdi
	jmp NS_E_153_MTC_0_failed
LB_194:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],unt
; _chr
	call NS_E_148_ETR_TBL
	cmp rax,0
	jnz LB_199
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_200
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dec_r
LB_200:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_201
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_201:
	pop rdx
	pop rdi
	jmp NS_E_153_MTC_0_failed
LB_199:
	mov QWORD [prs_vct+16*2],r11
	mov QWORD [prs_vct+8*1+16*2],r10
NS_E_153_MTC_0_succeed:
	pop r8
	push rdi
	push rdx
	mov rdi,3
	call mlc
	mov rdi,rax
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_184
	btr QWORD [rdi],2
LB_184:
	mov rbx,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rbx
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_185
	btr QWORD [rdi],1
LB_185:
	mov rbx,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rbx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_186
	btr QWORD [rdi],0
LB_186:
	mov rbx,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rbx
	push rdi
	mov rdi,2
	call mlc
	btr QWORD [rax],1
	mov r10,rax
	pop rax
	mov QWORD [r10+8*1],0
	mov QWORD [r10+8*2],rax
	mov r11,0
	pop rdx
	pop rdi
	jmp NS_E_153_succeed
NS_E_153_MTC_0_failed:
	pop rsi
	push rsi
; "H"
	mov r11,0
	mov r11b,BYTE [rdi+rsi+8*1+0]
	cmp r11b,72
	jz LB_164
	push rdi
	push rdx
	pop rdx
	pop rdi
	jmp NS_E_153_MTC_1_failed
LB_164:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],unt
; _chr
	call NS_E_148_ETR_TBL
	cmp rax,0
	jnz LB_168
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_169
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_169:
	pop rdx
	pop rdi
	jmp NS_E_153_MTC_1_failed
LB_168:
	mov QWORD [prs_vct+16*1],r11
	mov QWORD [prs_vct+8*1+16*1],r10
; "O"
	mov r11,0
	mov r11b,BYTE [rdi+rsi+8*1+0]
	cmp r11b,79
	jz LB_173
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_174
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dec_r
LB_174:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_175
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_175:
	pop rdx
	pop rdi
	jmp NS_E_153_MTC_1_failed
LB_173:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],unt
; _chr
	call NS_E_148_ETR_TBL
	cmp rax,0
	jnz LB_179
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_180
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dec_r
LB_180:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_181
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dec_r
LB_181:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_182
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_182:
	pop rdx
	pop rdi
	jmp NS_E_153_MTC_1_failed
LB_179:
	mov QWORD [prs_vct+16*3],r11
	mov QWORD [prs_vct+8*1+16*3],r10
NS_E_153_MTC_1_succeed:
	pop r8
	push rdi
	push rdx
	mov rdi,4
	call mlc
	mov rdi,rax
	mov rsi,QWORD [prs_vct+16*3]
	bt rsi,0
	jc LB_157
	btr QWORD [rdi],3
LB_157:
	mov rbx,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rbx
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_158
	btr QWORD [rdi],2
LB_158:
	mov rbx,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rbx
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_159
	btr QWORD [rdi],1
LB_159:
	mov rbx,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rbx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_160
	btr QWORD [rdi],0
LB_160:
	mov rbx,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rbx
	push rdi
	mov rdi,2
	call mlc
	btr QWORD [rax],1
	mov r10,rax
	pop rax
	mov QWORD [r10+8*1],1
	mov QWORD [r10+8*2],rax
	mov r11,0
	pop rdx
	pop rdi
	jmp NS_E_153_succeed
NS_E_153_MTC_1_failed:
	pop rsi
	jmp NS_E_153_failed
NS_E_153_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_153_succeed_tbl
	push rsi
	push rdi
	push r10
	push r11
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	pop r11
	pop r8
	mov rsi,[rax]
	btr rsi,0
	bt r11,0
	jc LB_156
	btr rsi,2
LB_156:
	mov [rax],rsi
	mov QWORD [rax+8*3],r8
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_153_succeed_tbl:
	ret
NS_E_153_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_153_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_153_failed_tbl:
	mov rax,0
	ret
NS_E_203:
NS_E_RDI_203:
; 	» "HxOi" |~ 0' : _stg
;push_reg
	mov rdi,4
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],72
	add rsi,1
	mov BYTE [rdi+8*1+rsi],120
	add rsi,1
	mov BYTE [rdi+8*1+rsi],79
	add rsi,1
	mov BYTE [rdi+8*1+rsi],105
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_204
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_205
emt_set_ptn_0_LB_204:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_205:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_206
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_206:
; 	» 0xr0 |~ 0' : _r64
	mov QWORD r10,0x0
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	bts r12,2
; ; emt_dec_ptn 0'
; unboxed
; 	g0.prs { 1' 2' } ⊢ { 0' 1' 2' } : { _stg _r64 _p152 }
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	bts r12,3
	mov r11,r9
	bt r12,1
	jc LB_210
	and r12,~0b1000
LB_210:
; emt_ptn_set_ptn { 3' 2' },{ 0' 1' }
; emt_ptn_set_ptn 3',0'
	mov rbx,r11
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,3
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_211
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_212
emt_set_ptn_0_LB_211:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_212:
; emt_ptn_set_ptn 2',1'
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,2
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
; ; emt_dec_ptn { 3' 2' }
; unboxed
; unknown
	bt r12,3
	jc emt_dec_ptn_0_LB_216
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_216:
	call NS_E_153
	mov QWORD [tmp],rax
	jc call_c_LB_217
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_225
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_226
emt_set_ptn_0_LB_225:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_226:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	bts r12,1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_229
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_230
emt_set_ptn_0_LB_229:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_230:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_218
call_c_LB_217:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_219
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_220
emt_set_ptn_0_LB_219:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_220:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	bts r12,1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_223
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_224
emt_set_ptn_0_LB_223:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_224:
call_nc_LB_218:
; 	_pp_v 2' ⊢ { 2' 3' } : { _p152 _stg }
; push_s_ex  0'~s0 1'~x0
	sub rsp,24
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn 2',0'
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,2
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_231
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_232
emt_set_ptn_0_LB_231:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_232:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_233
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_LB_233:
	call NS_E_18
	mov QWORD [tmp],rax
	jc call_c_LB_234
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 2' 3' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_240
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_241
emt_set_ptn_0_LB_240:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_241:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 3'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_242
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r11,rbx
	and r12,~0b1000
	jmp emt_set_ptn_1_LB_243
emt_set_ptn_0_LB_242:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r11,rbx
	or r12,0b1000
emt_set_ptn_1_LB_243:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_235
call_c_LB_234:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 2' 3' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_236
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_237
emt_set_ptn_0_LB_236:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_237:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 3'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_238
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*3],r11
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r10,QWORD [regs_vct+8*2]
	mov r11,QWORD [regs_vct+8*3]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r11,rbx
	and r12,~0b1000
	jmp emt_set_ptn_1_LB_239
emt_set_ptn_0_LB_238:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r11,rbx
	or r12,0b1000
emt_set_ptn_1_LB_239:
call_nc_LB_235:
; emt_get_ptn 3'
	bt r12,3
	jc emt_get_ptn_0_LB_244
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_245
emt_get_ptn_0_LB_244:
; unboxed
	stc
emt_get_ptn_1_LB_245:
	mov QWORD rcx,r11
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,rcx
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_LB_246
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_246:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_247
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
LB_247:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,0
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_LB_248
	push r11
; ; emt_dec_ptn {  }
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_LB_248:
;clear  2'~a0 0'~s0 1'~x0
	bt r12,2
	jc clear_LB_249
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
clear_LB_249:
	bt r12,0
	jc clear_LB_250
;push_reg
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
clear_LB_250:
	bt r12,1
	jc clear_LB_251
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_251:
	mov rax,r11
	stc
	ret
NS_E_252:
; 	|» {  }
	jz NS_E_RDI_252
	jc emt_etr_c_LB_253
	push rbx
	push rdi
	mov rbx,rdi
	mov QWORD [set_ptn_vct+8*1],rbx
	mov QWORD [set_ptn_vct],0
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_252
emt_etr_c_LB_253:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
	mov QWORD [set_ptn_vct],1
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_252:
; 	» "\n~~~\n" |~ 0' : _stg
;push_reg
	mov rdi,5
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov BYTE [rdi+8*1+rsi],126
	add rsi,1
	mov BYTE [rdi+8*1+rsi],126
	add rsi,1
	mov BYTE [rdi+8*1+rsi],126
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_254
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	mov rdi,rbx
	call inc_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_255
emt_set_ptn_0_LB_254:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_255:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_256
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_256:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_257
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_258
emt_get_ptn_0_LB_257:
; unboxed
	stc
emt_get_ptn_1_LB_258:
	mov QWORD r8,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_14
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_259
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_259:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_260
;push_reg
	call exec_out
;pop_reg
LB_260:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_261
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_261:
;clear 
	mov rax,r8
	stc
	ret
section .data
	NS_E_DYN_148:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_148
	NS_E_DYN_154:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_155:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_153:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_153
	CST_DYN_203:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_252:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_252
