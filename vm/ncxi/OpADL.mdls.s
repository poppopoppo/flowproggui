%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_3363
	call NS_E_4171
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
	push r13
	mov rdi,r13
	mov rsi,str_ret
	bt r12,0
	call pp
	mov rdi,fmt_emt_q
	mov rsi,str_ret
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	pop r13
	ret
NS_E_2142:
NS_E_RDI_2142:
NS_E_2142_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_2143
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_2143:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2145:
NS_E_RDI_2145:
NS_E_2145_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_2145_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_2145_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2146:
NS_E_RDI_2146:
NS_E_2146_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_2146_LB_0
	cmp r11,57
	ja NS_E_2146_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2146_LB_0:
	mov rax,0
	ret
NS_E_2148:
NS_E_RDI_2148:
NS_E_2148_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_2148_LB_0
	cmp r11,122
	ja NS_E_2148_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2148_LB_0:
	mov rax,0
	ret
NS_E_2147:
NS_E_RDI_2147:
NS_E_2147_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_2147_LB_0
	cmp r11,90
	ja NS_E_2147_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2147_LB_0:
	mov rax,0
	ret
NS_E_24:
NS_E_RDI_24:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
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
NS_E_2144:
NS_E_RDI_2144:
NS_E_2144_ETR_TBL:
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
	jz NS_E_2144_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_2144_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2162:
; 	|» { 0' 1' }
NS_E_RDI_2162:
MTC_LB_2163:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2164
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_2165
	bt QWORD [rax],0
	jc LB_2166
	btr r12,4
	jmp LB_2167
LB_2166:
	bts r12,4
LB_2167:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2165:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2170
	btr r12,5
	jmp LB_2171
LB_2170:
	bts r12,5
LB_2171:
	mov r8,r11
	bt r12,5
	jc LB_2168
	btr r12,2
	jmp LB_2169
LB_2168:
	bts r12,2
LB_2169:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2174
	btr r12,5
	jmp LB_2175
LB_2174:
	bts r12,5
LB_2175:
	mov r9,r11
	bt r12,5
	jc LB_2172
	btr r12,3
	jmp LB_2173
LB_2172:
	bts r12,3
LB_2173:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2176:
	cmp r15,0
	jz LB_2177
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2176
LB_2177:
; _f39 %_2149 ⊢ %_2153 : %_2153
 ; {>  %_2149~0':_r64 %_2151~2':_r64 %_2152~3':(_lst)◂(_r64) }
	add r13,1
; _f2162 { %_2153 %_2152 } ⊢ { %_2154 %_2155 } : { %_2154 %_2155 }
 ; {>  %_2153~0':_r64 %_2151~2':_r64 %_2152~3':(_lst)◂(_r64) }
; _f2162 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2180
	btr r12,1
	jmp LB_2181
LB_2180:
	bts r12,1
LB_2181:
	call NS_E_2162
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2178
	btr r12,2
	jmp LB_2179
LB_2178:
	bts r12,2
LB_2179:
	add rsp,16
; _f38 %_2154 ⊢ %_2156 : %_2156
 ; {>  %_2155~1':_stg %_2151~2':_r64 %_2154~0':_r64 }
	sub r13,1
; _f16 { %_2155 %_2156 %_2151 } ⊢ { %_2157 %_2158 %_2159 } : { %_2157 %_2158 %_2159 }
 ; {>  %_2156~0':_r64 %_2155~1':_stg %_2151~2':_r64 }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_2182
	btr r12,3
	jmp LB_2183
LB_2182:
	bts r12,3
LB_2183:
	mov r14,r13
	bt r12,0
	jc LB_2184
	btr r12,1
	jmp LB_2185
LB_2184:
	bts r12,1
LB_2185:
	mov r13,r9
	bt r12,3
	jc LB_2186
	btr r12,0
	jmp LB_2187
LB_2186:
	bts r12,0
LB_2187:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_2158 %_2157 }
 ; {>  %_2159~2':_r64 %_2158~1':_r64 %_2157~0':_stg }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_2188
	mov rdi,r8
	call dlt
LB_2188:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_2189
	btr r12,2
	jmp LB_2190
LB_2189:
	bts r12,2
LB_2190:
	mov r14,r13
	bt r12,0
	jc LB_2191
	btr r12,1
	jmp LB_2192
LB_2191:
	bts r12,1
LB_2192:
	mov r13,r8
	bt r12,2
	jc LB_2193
	btr r12,0
	jmp LB_2194
LB_2193:
	bts r12,0
LB_2194:
	ret
MTC_LB_2164:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2195
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_2196
	bt QWORD [rax],0
	jc LB_2197
	btr r12,2
	jmp LB_2198
LB_2197:
	bts r12,2
LB_2198:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2196:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2199:
	cmp r15,0
	jz LB_2200
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2199
LB_2200:
; _f14 %_2149 ⊢ { %_2160 %_2161 } : { %_2160 %_2161 }
 ; {>  %_2149~0':_r64 }
; _f14 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_2160 %_2161 }
 ; {>  %_2160~0':_r64 %_2161~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2195:
NS_E_2205:
; 	|» 0'
NS_E_RDI_2205:
; » 0xr0 |~ {  } ⊢ %_2202 : %_2202
 ; {>  %_2201~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_2202
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f2162 { %_2202 %_2201 } ⊢ { %_2203 %_2204 } : { %_2203 %_2204 }
 ; {>  %_2201~0':(_lst)◂(_r64) %_2202~1':_r64 }
; _f2162 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_2206
	btr r12,2
	jmp LB_2207
LB_2206:
	bts r12,2
LB_2207:
	mov r14,r13
	bt r12,0
	jc LB_2208
	btr r12,1
	jmp LB_2209
LB_2208:
	bts r12,1
LB_2209:
	mov r13,r8
	bt r12,2
	jc LB_2210
	btr r12,0
	jmp LB_2211
LB_2210:
	bts r12,0
LB_2211:
	call NS_E_2162
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_2204
 ; {>  %_2204~1':_stg %_2203~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_2212
	mov rdi,r13
	call dlt
LB_2212:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2213
	btr r12,0
	jmp LB_2214
LB_2213:
	bts r12,0
LB_2214:
	ret
NS_E_2215:
NS_E_RDI_2215:
NS_E_2215_ETR_TBL:
NS_E_2215_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_2255
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_2255
	jmp LB_2256
LB_2255:
	jmp NS_E_2215_MTC_0_failed
LB_2256:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_2216_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2260
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2261
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2261:
	jmp NS_E_2215_MTC_0_failed
LB_2260:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2248
	btr r12,1
	jmp LB_2249
LB_2248:
	bts r12,1
LB_2249:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2246
	btr r12,0
	jmp LB_2247
LB_2246:
	bts r12,0
LB_2247:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2243
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_2263
	btr r12,2
	jmp LB_2264
LB_2263:
	bts r12,2
LB_2264:
	mov r13,r14
	bt r12,1
	jc LB_2265
	btr r12,0
	jmp LB_2266
LB_2265:
	bts r12,0
LB_2266:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f2205 %_2218 ⊢ %_2219 : %_2219
 ; {>  %_2218~0':(_lst)◂(_r64) }
; _f2205 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_2205
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_2219 ⊢ %_2220 : %_2220
 ; {>  %_2219~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_2220
 ; {>  %_2220~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2241
	btr r12,3
	jmp LB_2242
LB_2241:
	bts r12,3
LB_2242:
	mov r8,0
	bts r12,2
	ret
LB_2243:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2245
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2244
LB_2245:
	add rsp,8
	ret
NS_E_2215_MTC_0_failed:
	add rsp,32
	pop r14
LB_2244:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2216:
NS_E_RDI_2216:
NS_E_2216_ETR_TBL:
NS_E_2216_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_2291
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_2291
	jmp LB_2292
LB_2291:
	jmp NS_E_2216_MTC_0_failed
LB_2292:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_2217_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2296
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2297
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2297:
	jmp NS_E_2216_MTC_0_failed
LB_2296:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_2216_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2302
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2303
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2303:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2304
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2304:
	jmp NS_E_2216_MTC_0_failed
LB_2302:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2284
	btr r12,2
	jmp LB_2285
LB_2284:
	bts r12,2
LB_2285:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2282
	btr r12,1
	jmp LB_2283
LB_2282:
	bts r12,1
LB_2283:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2280
	btr r12,0
	jmp LB_2281
LB_2280:
	bts r12,0
LB_2281:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_2277
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_2306
	btr r12,3
	jmp LB_2307
LB_2306:
	bts r12,3
LB_2307:
	mov r14,r8
	bt r12,2
	jc LB_2308
	btr r12,1
	jmp LB_2309
LB_2308:
	bts r12,1
LB_2309:
	mov r8,r13
	bt r12,0
	jc LB_2310
	btr r12,2
	jmp LB_2311
LB_2310:
	bts r12,2
LB_2311:
	mov r13,r9
	bt r12,3
	jc LB_2312
	btr r12,0
	jmp LB_2313
LB_2312:
	bts r12,0
LB_2313:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_2221 %_2222 } ⊢ %_2223 : %_2223
 ; {>  %_2221~0':_r64 %_2222~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_2223 ⊢ %_2224 : %_2224
 ; {>  %_2223~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_2224
 ; {>  %_2224~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_2271
	btr r12,2
	jmp LB_2272
LB_2271:
	bts r12,2
LB_2272:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_2269
	btr QWORD [rdi],0
	jmp LB_2270
LB_2269:
	bts QWORD [rdi],0
LB_2270:
	mov r8,r14
	bt r12,1
	jc LB_2275
	btr r12,2
	jmp LB_2276
LB_2275:
	bts r12,2
LB_2276:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_2273
	btr QWORD [rdi],1
	jmp LB_2274
LB_2273:
	bts QWORD [rdi],1
LB_2274:
	mov rsi,1
	bt r12,3
	jc LB_2267
	mov rsi,0
	bt r9,0
	jc LB_2267
	jmp LB_2268
LB_2267:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_2268:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2277:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2279
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2278
LB_2279:
	add rsp,8
	ret
NS_E_2216_MTC_0_failed:
	add rsp,48
	pop r14
LB_2278:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_2326
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_2326
	jmp LB_2327
LB_2326:
	jmp NS_E_2216_MTC_1_failed
LB_2327:
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
	jc LB_2319
	btr r12,0
	jmp LB_2320
LB_2319:
	bts r12,0
LB_2320:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2316
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_2225 : %_2225
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_2225 ⊢ %_2226 : %_2226
 ; {>  %_2225~°1◂{  }:(_lst)◂(t651'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_2226
 ; {>  %_2226~°0◂°1◂{  }:(_opn)◂((_lst)◂(t654'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_2314
	mov rsi,0
	bt r9,0
	jc LB_2314
	jmp LB_2315
LB_2314:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_2315:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2316:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2318
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2317
LB_2318:
	add rsp,8
	ret
NS_E_2216_MTC_1_failed:
	add rsp,16
	pop r14
LB_2317:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_2142_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2348
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2216_MTC_2_failed
LB_2348:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_2216_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2353
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2354
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2354:
	jmp NS_E_2216_MTC_2_failed
LB_2353:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2343
	btr r12,1
	jmp LB_2344
LB_2343:
	bts r12,1
LB_2344:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2341
	btr r12,0
	jmp LB_2342
LB_2341:
	bts r12,0
LB_2342:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2338
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_2227 %_2228 } ⊢ %_2229 : %_2229
 ; {>  %_2227~0':_r64 %_2228~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_2229 ⊢ %_2230 : %_2230
 ; {>  %_2229~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_2230
 ; {>  %_2230~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_2332
	btr r12,2
	jmp LB_2333
LB_2332:
	bts r12,2
LB_2333:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_2330
	btr QWORD [rdi],0
	jmp LB_2331
LB_2330:
	bts QWORD [rdi],0
LB_2331:
	mov r8,r14
	bt r12,1
	jc LB_2336
	btr r12,2
	jmp LB_2337
LB_2336:
	bts r12,2
LB_2337:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_2334
	btr QWORD [rdi],1
	jmp LB_2335
LB_2334:
	bts QWORD [rdi],1
LB_2335:
	mov rsi,1
	bt r12,3
	jc LB_2328
	mov rsi,0
	bt r9,0
	jc LB_2328
	jmp LB_2329
LB_2328:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_2329:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2338:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2340
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2339
LB_2340:
	add rsp,8
	ret
NS_E_2216_MTC_2_failed:
	add rsp,32
	pop r14
LB_2339:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2217:
NS_E_RDI_2217:
NS_E_2217_ETR_TBL:
NS_E_2217_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_2368
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_2368
	jmp LB_2369
LB_2368:
	jmp NS_E_2217_MTC_0_failed
LB_2369:
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
	jc LB_2361
	btr r12,0
	jmp LB_2362
LB_2361:
	bts r12,0
LB_2362:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2358
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_2231 : %_2231
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_2231
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_2231 ⊢ %_2232 : %_2232
 ; {>  %_2231~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2232
 ; {>  %_2232~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2356
	btr r12,3
	jmp LB_2357
LB_2356:
	bts r12,3
LB_2357:
	mov r8,0
	bts r12,2
	ret
LB_2358:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2360
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2359
LB_2360:
	add rsp,8
	ret
NS_E_2217_MTC_0_failed:
	add rsp,16
	pop r14
LB_2359:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_2382
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_2382
	jmp LB_2383
LB_2382:
	jmp NS_E_2217_MTC_1_failed
LB_2383:
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
	jc LB_2375
	btr r12,0
	jmp LB_2376
LB_2375:
	bts r12,0
LB_2376:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2372
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_2233 : %_2233
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_2233
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_2233 ⊢ %_2234 : %_2234
 ; {>  %_2233~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2234
 ; {>  %_2234~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2370
	btr r12,3
	jmp LB_2371
LB_2370:
	bts r12,3
LB_2371:
	mov r8,0
	bts r12,2
	ret
LB_2372:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2374
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2373
LB_2374:
	add rsp,8
	ret
NS_E_2217_MTC_1_failed:
	add rsp,16
	pop r14
LB_2373:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_2396
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_2396
	jmp LB_2397
LB_2396:
	jmp NS_E_2217_MTC_2_failed
LB_2397:
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
	jc LB_2389
	btr r12,0
	jmp LB_2390
LB_2389:
	bts r12,0
LB_2390:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2386
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_2235 : %_2235
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_2235
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_2235 ⊢ %_2236 : %_2236
 ; {>  %_2235~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2236
 ; {>  %_2236~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2384
	btr r12,3
	jmp LB_2385
LB_2384:
	bts r12,3
LB_2385:
	mov r8,0
	bts r12,2
	ret
LB_2386:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2388
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2387
LB_2388:
	add rsp,8
	ret
NS_E_2217_MTC_2_failed:
	add rsp,16
	pop r14
LB_2387:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_2410
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_2410
	jmp LB_2411
LB_2410:
	jmp NS_E_2217_MTC_3_failed
LB_2411:
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
	jc LB_2403
	btr r12,0
	jmp LB_2404
LB_2403:
	bts r12,0
LB_2404:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2400
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_2237 : %_2237
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_2237
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_2237 ⊢ %_2238 : %_2238
 ; {>  %_2237~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2238
 ; {>  %_2238~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2398
	btr r12,3
	jmp LB_2399
LB_2398:
	bts r12,3
LB_2399:
	mov r8,0
	bts r12,2
	ret
LB_2400:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2402
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2401
LB_2402:
	add rsp,8
	ret
NS_E_2217_MTC_3_failed:
	add rsp,16
	pop r14
LB_2401:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_2424
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_2424
	jmp LB_2425
LB_2424:
	jmp NS_E_2217_MTC_4_failed
LB_2425:
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
	jc LB_2417
	btr r12,0
	jmp LB_2418
LB_2417:
	bts r12,0
LB_2418:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2414
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_2239 : %_2239
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_2239
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_2239 ⊢ %_2240 : %_2240
 ; {>  %_2239~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2240
 ; {>  %_2240~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2412
	btr r12,3
	jmp LB_2413
LB_2412:
	bts r12,3
LB_2413:
	mov r8,0
	bts r12,2
	ret
LB_2414:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2416
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2415
LB_2416:
	add rsp,8
	ret
NS_E_2217_MTC_4_failed:
	add rsp,16
	pop r14
LB_2415:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2426:
NS_E_RDI_2426:
NS_E_2426_ETR_TBL:
NS_E_2426_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_2142_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2462
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2426_MTC_0_failed
LB_2462:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2457
	btr r12,0
	jmp LB_2458
LB_2457:
	bts r12,0
LB_2458:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2454
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_2428 : %_2428
 ; {>  %_2427~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_2428
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_2429 : %_2429
 ; {>  %_2428~1':_r64 %_2427~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_2429
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f33 { %_2427 %_2428 } ⊢ { %_2430 %_2431 %_2432 } : { %_2430 %_2431 %_2432 }
 ; {>  %_2429~2':_r64 %_2428~1':_r64 %_2427~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_2429 %_2430 } ⊢ { %_2433 %_2434 %_2435 } : { %_2433 %_2434 %_2435 }
 ; {>  %_2432~3':_r64 %_2429~2':_r64 %_2430~0':_r64 %_2431~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_2438:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_2439
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_2439
LB_2440:
	cmp r15,0
	jz LB_2441
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2440
LB_2441:
; _some %_2434 ⊢ %_2436 : %_2436
 ; {>  %_2433~2':_r64 %_2431~1':_r64 %_2434~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2436
 ; {>  %_2436~°0◂0':(_opn)◂(_r64) %_2433~2':_r64 %_2431~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_2442
	mov rdi,r8
	call dlt
LB_2442:
	bt r12,1
	jc LB_2443
	mov rdi,r14
	call dlt
LB_2443:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2444
	btr r12,3
	jmp LB_2445
LB_2444:
	bts r12,3
LB_2445:
	mov r8,0
	bts r12,2
	ret
MTC_LB_2439:
	mov r15,0
LB_2447:
	cmp r15,0
	jz LB_2448
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2447
LB_2448:
; _none {  } ⊢ %_2437 : %_2437
 ; {>  %_2435~4':_r64 %_2432~3':_r64 %_2433~2':_r64 %_2431~1':_r64 %_2434~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_2437
 ; {>  %_2437~°1◂{  }:(_opn)◂(t729'(0)) %_2435~4':_r64 %_2432~3':_r64 %_2433~2':_r64 %_2431~1':_r64 %_2434~0':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_2449
	mov rdi,r10
	call dlt
LB_2449:
	bt r12,3
	jc LB_2450
	mov rdi,r9
	call dlt
LB_2450:
	bt r12,2
	jc LB_2451
	mov rdi,r8
	call dlt
LB_2451:
	bt r12,1
	jc LB_2452
	mov rdi,r14
	call dlt
LB_2452:
	bt r12,0
	jc LB_2453
	mov rdi,r13
	call dlt
LB_2453:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_2446:
LB_2454:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2456
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2455
LB_2456:
	add rsp,8
	ret
NS_E_2426_MTC_0_failed:
	add rsp,16
	pop r14
LB_2455:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2464:
NS_E_RDI_2464:
NS_E_2464_ETR_TBL:
NS_E_2464_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_2142_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2500
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2464_MTC_0_failed
LB_2500:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2495
	btr r12,0
	jmp LB_2496
LB_2495:
	bts r12,0
LB_2496:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2492
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_2466 : %_2466
 ; {>  %_2465~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_2466
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_2467 : %_2467
 ; {>  %_2466~1':_r64 %_2465~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_2467
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f33 { %_2465 %_2466 } ⊢ { %_2468 %_2469 %_2470 } : { %_2468 %_2469 %_2470 }
 ; {>  %_2467~2':_r64 %_2466~1':_r64 %_2465~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_2467 %_2468 } ⊢ { %_2471 %_2472 %_2473 } : { %_2471 %_2472 %_2473 }
 ; {>  %_2470~3':_r64 %_2469~1':_r64 %_2467~2':_r64 %_2468~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_2476:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_2477
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_2477
LB_2478:
	cmp r15,0
	jz LB_2479
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2478
LB_2479:
; _some %_2472 ⊢ %_2474 : %_2474
 ; {>  %_2469~1':_r64 %_2471~2':_r64 %_2472~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2474
 ; {>  %_2469~1':_r64 %_2474~°0◂0':(_opn)◂(_r64) %_2471~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_2480
	mov rdi,r14
	call dlt
LB_2480:
	bt r12,2
	jc LB_2481
	mov rdi,r8
	call dlt
LB_2481:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2482
	btr r12,3
	jmp LB_2483
LB_2482:
	bts r12,3
LB_2483:
	mov r8,0
	bts r12,2
	ret
MTC_LB_2477:
	mov r15,0
LB_2485:
	cmp r15,0
	jz LB_2486
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2485
LB_2486:
; _none {  } ⊢ %_2475 : %_2475
 ; {>  %_2473~4':_r64 %_2470~3':_r64 %_2469~1':_r64 %_2471~2':_r64 %_2472~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_2475
 ; {>  %_2473~4':_r64 %_2470~3':_r64 %_2469~1':_r64 %_2475~°1◂{  }:(_opn)◂(t756'(0)) %_2471~2':_r64 %_2472~0':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_2487
	mov rdi,r10
	call dlt
LB_2487:
	bt r12,3
	jc LB_2488
	mov rdi,r9
	call dlt
LB_2488:
	bt r12,1
	jc LB_2489
	mov rdi,r14
	call dlt
LB_2489:
	bt r12,2
	jc LB_2490
	mov rdi,r8
	call dlt
LB_2490:
	bt r12,0
	jc LB_2491
	mov rdi,r13
	call dlt
LB_2491:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_2484:
LB_2492:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2494
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2493
LB_2494:
	add rsp,8
	ret
NS_E_2464_MTC_0_failed:
	add rsp,16
	pop r14
LB_2493:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2502:
NS_E_RDI_2502:
NS_E_2502_ETR_TBL:
NS_E_2502_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_2142_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2538
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2502_MTC_0_failed
LB_2538:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2533
	btr r12,0
	jmp LB_2534
LB_2533:
	bts r12,0
LB_2534:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2530
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_2504 : %_2504
 ; {>  %_2503~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_2504
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_2505 : %_2505
 ; {>  %_2503~0':_r64 %_2504~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_2505
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f33 { %_2503 %_2504 } ⊢ { %_2506 %_2507 %_2508 } : { %_2506 %_2507 %_2508 }
 ; {>  %_2503~0':_r64 %_2504~1':_r64 %_2505~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_2505 %_2506 } ⊢ { %_2509 %_2510 %_2511 } : { %_2509 %_2510 %_2511 }
 ; {>  %_2507~1':_r64 %_2508~3':_r64 %_2506~0':_r64 %_2505~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_2514:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_2515
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_2515
LB_2516:
	cmp r15,0
	jz LB_2517
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2516
LB_2517:
; _some %_2510 ⊢ %_2512 : %_2512
 ; {>  %_2507~1':_r64 %_2509~2':_r64 %_2510~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2512
 ; {>  %_2507~1':_r64 %_2512~°0◂0':(_opn)◂(_r64) %_2509~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_2518
	mov rdi,r14
	call dlt
LB_2518:
	bt r12,2
	jc LB_2519
	mov rdi,r8
	call dlt
LB_2519:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2520
	btr r12,3
	jmp LB_2521
LB_2520:
	bts r12,3
LB_2521:
	mov r8,0
	bts r12,2
	ret
MTC_LB_2515:
	mov r15,0
LB_2523:
	cmp r15,0
	jz LB_2524
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2523
LB_2524:
; _none {  } ⊢ %_2513 : %_2513
 ; {>  %_2511~4':_r64 %_2507~1':_r64 %_2508~3':_r64 %_2509~2':_r64 %_2510~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_2513
 ; {>  %_2511~4':_r64 %_2507~1':_r64 %_2508~3':_r64 %_2509~2':_r64 %_2510~0':_r64 %_2513~°1◂{  }:(_opn)◂(t783'(0)) }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_2525
	mov rdi,r10
	call dlt
LB_2525:
	bt r12,1
	jc LB_2526
	mov rdi,r14
	call dlt
LB_2526:
	bt r12,3
	jc LB_2527
	mov rdi,r9
	call dlt
LB_2527:
	bt r12,2
	jc LB_2528
	mov rdi,r8
	call dlt
LB_2528:
	bt r12,0
	jc LB_2529
	mov rdi,r13
	call dlt
LB_2529:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_2522:
LB_2530:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2532
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2531
LB_2532:
	add rsp,8
	ret
NS_E_2502_MTC_0_failed:
	add rsp,16
	pop r14
LB_2531:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2540:
NS_E_RDI_2540:
NS_E_2540_ETR_TBL:
NS_E_2540_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_2502_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2555
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2540_MTC_0_failed
LB_2555:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2550
	btr r12,0
	jmp LB_2551
LB_2550:
	bts r12,0
LB_2551:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2547
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_2541 ⊢ %_2542 : %_2542
 ; {>  %_2541~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2542
 ; {>  %_2542~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2545
	btr r12,3
	jmp LB_2546
LB_2545:
	bts r12,3
LB_2546:
	mov r8,0
	bts r12,2
	ret
LB_2547:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2549
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2548
LB_2549:
	add rsp,8
	ret
NS_E_2540_MTC_0_failed:
	add rsp,16
	pop r14
LB_2548:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_2464_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2567
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2540_MTC_1_failed
LB_2567:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2562
	btr r12,0
	jmp LB_2563
LB_2562:
	bts r12,0
LB_2563:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2559
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_2543 ⊢ %_2544 : %_2544
 ; {>  %_2543~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2544
 ; {>  %_2544~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2557
	btr r12,3
	jmp LB_2558
LB_2557:
	bts r12,3
LB_2558:
	mov r8,0
	bts r12,2
	ret
LB_2559:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2561
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2560
LB_2561:
	add rsp,8
	ret
NS_E_2540_MTC_1_failed:
	add rsp,16
	pop r14
LB_2560:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2569:
NS_E_RDI_2569:
NS_E_2569_ETR_TBL:
NS_E_2569_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_2540_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2617
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2569_MTC_0_failed
LB_2617:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_2570_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2622
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2623
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2623:
	jmp NS_E_2569_MTC_0_failed
LB_2622:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2612
	btr r12,1
	jmp LB_2613
LB_2612:
	bts r12,1
LB_2613:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2610
	btr r12,0
	jmp LB_2611
LB_2610:
	bts r12,0
LB_2611:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2607
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_2572 %_2573 } ⊢ %_2574 : %_2574
 ; {>  %_2572~0':_r64 %_2573~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f2205 %_2574 ⊢ %_2575 : %_2575
 ; {>  %_2574~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f2205 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_2593
	btr r12,2
	jmp LB_2594
LB_2593:
	bts r12,2
LB_2594:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_2599
	btr r12,3
	jmp LB_2600
LB_2599:
	bts r12,3
LB_2600:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_2597
	btr QWORD [rdi],0
	jmp LB_2598
LB_2597:
	bts QWORD [rdi],0
LB_2598:
	mov r9,r14
	bt r12,1
	jc LB_2603
	btr r12,3
	jmp LB_2604
LB_2603:
	bts r12,3
LB_2604:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_2601
	btr QWORD [rdi],1
	jmp LB_2602
LB_2601:
	bts QWORD [rdi],1
LB_2602:
	mov rsi,1
	bt r12,0
	jc LB_2595
	mov rsi,0
	bt r13,0
	jc LB_2595
	jmp LB_2596
LB_2595:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_2596:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_2205
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_2575 ⊢ %_2576 : %_2576
 ; {>  %_2575~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_2576
 ; {>  %_2576~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2605
	btr r12,3
	jmp LB_2606
LB_2605:
	bts r12,3
LB_2606:
	mov r8,0
	bts r12,2
	ret
LB_2607:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2609
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2608
LB_2609:
	add rsp,8
	ret
NS_E_2569_MTC_0_failed:
	add rsp,32
	pop r14
LB_2608:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2570:
NS_E_RDI_2570:
NS_E_2570_ETR_TBL:
NS_E_2570_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_2571_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2645
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2570_MTC_0_failed
LB_2645:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_2570_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2650
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2651
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2651:
	jmp NS_E_2570_MTC_0_failed
LB_2650:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2640
	btr r12,1
	jmp LB_2641
LB_2640:
	bts r12,1
LB_2641:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2638
	btr r12,0
	jmp LB_2639
LB_2638:
	bts r12,0
LB_2639:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2635
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_2577 %_2578 } ⊢ %_2579 : %_2579
 ; {>  %_2577~0':_r64 %_2578~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_2579 ⊢ %_2580 : %_2580
 ; {>  %_2579~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_2580
 ; {>  %_2580~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_2629
	btr r12,2
	jmp LB_2630
LB_2629:
	bts r12,2
LB_2630:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_2627
	btr QWORD [rdi],0
	jmp LB_2628
LB_2627:
	bts QWORD [rdi],0
LB_2628:
	mov r8,r14
	bt r12,1
	jc LB_2633
	btr r12,2
	jmp LB_2634
LB_2633:
	bts r12,2
LB_2634:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_2631
	btr QWORD [rdi],1
	jmp LB_2632
LB_2631:
	bts QWORD [rdi],1
LB_2632:
	mov rsi,1
	bt r12,3
	jc LB_2625
	mov rsi,0
	bt r9,0
	jc LB_2625
	jmp LB_2626
LB_2625:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_2626:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2635:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2637
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2636
LB_2637:
	add rsp,8
	ret
NS_E_2570_MTC_0_failed:
	add rsp,32
	pop r14
LB_2636:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_2655
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_2581 : %_2581
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_2581 ⊢ %_2582 : %_2582
 ; {>  %_2581~°1◂{  }:(_lst)◂(t827'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_2582
 ; {>  %_2582~°0◂°1◂{  }:(_opn)◂((_lst)◂(t830'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_2653
	mov rsi,0
	bt r9,0
	jc LB_2653
	jmp LB_2654
LB_2653:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_2654:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2655:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2657
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2656
LB_2657:
	add rsp,8
	ret
NS_E_2570_MTC_1_failed:
	add rsp,0
	pop r14
LB_2656:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2571:
NS_E_RDI_2571:
NS_E_2571_ETR_TBL:
NS_E_2571_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_2540_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2668
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2571_MTC_0_failed
LB_2668:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2663
	btr r12,0
	jmp LB_2664
LB_2663:
	bts r12,0
LB_2664:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2660
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_2583 ⊢ %_2584 : %_2584
 ; {>  %_2583~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2584
 ; {>  %_2584~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2658
	btr r12,3
	jmp LB_2659
LB_2658:
	bts r12,3
LB_2659:
	mov r8,0
	bts r12,2
	ret
LB_2660:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2662
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2661
LB_2662:
	add rsp,8
	ret
NS_E_2571_MTC_0_failed:
	add rsp,16
	pop r14
LB_2661:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_2426_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2687
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2571_MTC_1_failed
LB_2687:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2682
	btr r12,0
	jmp LB_2683
LB_2682:
	bts r12,0
LB_2683:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2679
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; 	» "P0" _ ⊢ 1' : %_2586
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_30_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f21 %_2586 ⊢ %_2587 : %_2587
 ; {>  %_2586~1':_stg %_2585~0':_r64 }
; _f21 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2672
	btr r12,0
	jmp LB_2673
LB_2672:
	bts r12,0
LB_2673:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2674
	btr r12,1
	jmp LB_2675
LB_2674:
	bts r12,1
LB_2675:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2670
	btr r12,0
	jmp LB_2671
LB_2670:
	bts r12,0
LB_2671:
	add rsp,16
; _some %_2585 ⊢ %_2588 : %_2588
 ; {>  %_2587~1':_stg %_2585~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2588
 ; {>  %_2588~°0◂0':(_opn)◂(_r64) %_2587~1':_stg }
; 	∎ °0◂0'
	bt r12,1
	jc LB_2676
	mov rdi,r14
	call dlt
LB_2676:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2677
	btr r12,3
	jmp LB_2678
LB_2677:
	bts r12,3
LB_2678:
	mov r8,0
	bts r12,2
	ret
LB_2679:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2681
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2680
LB_2681:
	add rsp,8
	ret
NS_E_2571_MTC_1_failed:
	add rsp,16
	pop r14
LB_2680:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_2702
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_2702
	jmp LB_2703
LB_2702:
	jmp NS_E_2571_MTC_2_failed
LB_2703:
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
	jc LB_2695
	btr r12,0
	jmp LB_2696
LB_2695:
	bts r12,0
LB_2696:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2692
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 	» "P1" _ ⊢ 0' : %_2589
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_31_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f21 %_2589 ⊢ %_2590 : %_2590
 ; {>  %_2589~0':_stg }
; _f21 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » 0xr5f |~ {  } ⊢ %_2591 : %_2591
 ; {>  %_2590~0':_stg }
; 	» 0xr5f _ ⊢ 1' : %_2591
	mov rdi,0x5f
	mov r14,rdi
	bts r12,1
; _some %_2591 ⊢ %_2592 : %_2592
 ; {>  %_2591~1':_r64 %_2590~0':_stg }
; _some 1' ⊢ °0◂1'
; ∎ %_2592
 ; {>  %_2590~0':_stg %_2592~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_2689
	mov rdi,r13
	call dlt
LB_2689:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_2690
	btr r12,3
	jmp LB_2691
LB_2690:
	bts r12,3
LB_2691:
	mov r8,0
	bts r12,2
	ret
LB_2692:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2694
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2693
LB_2694:
	add rsp,8
	ret
NS_E_2571_MTC_2_failed:
	add rsp,16
	pop r14
LB_2693:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2704:
NS_E_RDI_2704:
NS_E_2704_ETR_TBL:
NS_E_2704_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_2724
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_2724
	jmp LB_2725
LB_2724:
	jmp NS_E_2704_MTC_0_failed
LB_2725:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_2570_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2729
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2730
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2730:
	jmp NS_E_2704_MTC_0_failed
LB_2729:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2717
	btr r12,1
	jmp LB_2718
LB_2717:
	bts r12,1
LB_2718:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2715
	btr r12,0
	jmp LB_2716
LB_2715:
	bts r12,0
LB_2716:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2712
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_2732
	btr r12,2
	jmp LB_2733
LB_2732:
	bts r12,2
LB_2733:
	mov r13,r14
	bt r12,1
	jc LB_2734
	btr r12,0
	jmp LB_2735
LB_2734:
	bts r12,0
LB_2735:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f2205 %_2705 ⊢ %_2706 : %_2706
 ; {>  %_2705~0':(_lst)◂(_r64) }
; _f2205 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_2205
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_2706 ⊢ %_2707 : %_2707
 ; {>  %_2706~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_2707
 ; {>  %_2707~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2710
	btr r12,3
	jmp LB_2711
LB_2710:
	bts r12,3
LB_2711:
	mov r8,0
	bts r12,2
	ret
LB_2712:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2714
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2713
LB_2714:
	add rsp,8
	ret
NS_E_2704_MTC_0_failed:
	add rsp,32
	pop r14
LB_2713:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2746
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2704_MTC_1_failed
LB_2746:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2741
	btr r12,0
	jmp LB_2742
LB_2741:
	bts r12,0
LB_2742:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2738
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_2708 ⊢ %_2709 : %_2709
 ; {>  %_2708~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_2709
 ; {>  %_2709~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2736
	btr r12,3
	jmp LB_2737
LB_2736:
	bts r12,3
LB_2737:
	mov r8,0
	bts r12,2
	ret
LB_2738:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2740
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2739
LB_2740:
	add rsp,8
	ret
NS_E_2704_MTC_1_failed:
	add rsp,16
	pop r14
LB_2739:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2749:
NS_E_RDI_2749:
NS_E_2749_ETR_TBL:
NS_E_2749_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ word ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_2757:
	jmp LB_2754
LB_2753:
	add r14,1
LB_2754:
	cmp r14,r10
	jge LB_2755
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_2753
	cmp al,10
	jz LB_2753
	cmp al,32
	jz LB_2753
LB_2755:
	push r10
	push rsi
	call NS_E_2569_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_2756
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_2758
	bts QWORD [rax],0
LB_2758:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_2757
LB_2756:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2751
	btr QWORD [rdi],0
LB_2751:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2749_MTC_0_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2762:
NS_E_RDI_2762:
NS_E_2762_ETR_TBL:
NS_E_2762_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_2866
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_2866
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_2866
	jmp LB_2867
LB_2866:
	jmp NS_E_2762_MTC_0_failed
LB_2867:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_2763_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2871
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2872
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2872:
	jmp NS_E_2762_MTC_0_failed
LB_2871:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_2762_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2877
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2878
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2878:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2879
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2879:
	jmp NS_E_2762_MTC_0_failed
LB_2877:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2859
	btr r12,2
	jmp LB_2860
LB_2859:
	bts r12,2
LB_2860:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2857
	btr r12,1
	jmp LB_2858
LB_2857:
	bts r12,1
LB_2858:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2855
	btr r12,0
	jmp LB_2856
LB_2855:
	bts r12,0
LB_2856:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_2852
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_2881
	btr r12,3
	jmp LB_2882
LB_2881:
	bts r12,3
LB_2882:
	mov r13,r14
	bt r12,1
	jc LB_2883
	btr r12,0
	jmp LB_2884
LB_2883:
	bts r12,0
LB_2884:
	mov r10,r8
	bt r12,2
	jc LB_2885
	btr r12,4
	jmp LB_2886
LB_2885:
	bts r12,4
LB_2886:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2889
	btr r12,5
	jmp LB_2890
LB_2889:
	bts r12,5
LB_2890:
	mov r14,r11
	bt r12,5
	jc LB_2887
	btr r12,1
	jmp LB_2888
LB_2887:
	bts r12,1
LB_2888:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2893
	btr r12,5
	jmp LB_2894
LB_2893:
	bts r12,5
LB_2894:
	mov r8,r11
	bt r12,5
	jc LB_2891
	btr r12,2
	jmp LB_2892
LB_2891:
	bts r12,2
LB_2892:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_2768 : %_2768
 ; {>  %_2767~2':(_lst)◂(_p2759) %_2766~1':_r64 %_2765~0':_r64 }
; 	» 0xr2 _ ⊢ 3' : %_2768
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_2768 %_2765 } ⊢ { %_2769 %_2770 } : { %_2769 %_2770 }
 ; {>  %_2767~2':(_lst)◂(_p2759) %_2768~3':_r64 %_2766~1':_r64 %_2765~0':_r64 }
	add r9,r13
; _f2760 %_2769 ⊢ %_2771 : %_2771
 ; {>  %_2767~2':(_lst)◂(_p2759) %_2766~1':_r64 %_2770~0':_r64 %_2769~3':_r64 }
; _f2760 3' ⊢ °0◂3'
; _cns { %_2771 %_2767 } ⊢ %_2772 : %_2772
 ; {>  %_2767~2':(_lst)◂(_p2759) %_2766~1':_r64 %_2771~°0◂3':_p2759 %_2770~0':_r64 }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_2766 %_2772 } ⊢ %_2773 : %_2773
 ; {>  %_2772~°0◂{ °0◂3' 2' }:(_lst)◂(_p2759) %_2766~1':_r64 %_2770~0':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_2773
 ; {>  %_2770~0':_r64 %_2773~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p2759) }) }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_2831
	mov rdi,r13
	call dlt
LB_2831:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_2832
	btr r12,0
	jmp LB_2833
LB_2832:
	bts r12,0
LB_2833:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_2836
	btr r12,4
	jmp LB_2837
LB_2836:
	bts r12,4
LB_2837:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_2834
	btr QWORD [rdi],0
	jmp LB_2835
LB_2834:
	bts QWORD [rdi],0
LB_2835:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_2846
	btr r12,1
	jmp LB_2847
LB_2846:
	bts r12,1
LB_2847:
	mov rsi,1
	bt r12,1
	jc LB_2844
	mov rsi,0
	bt r14,0
	jc LB_2844
	jmp LB_2845
LB_2844:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_2845:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_2842
	btr QWORD [rdi],0
	jmp LB_2843
LB_2842:
	bts QWORD [rdi],0
LB_2843:
	mov r14,r8
	bt r12,2
	jc LB_2850
	btr r12,1
	jmp LB_2851
LB_2850:
	bts r12,1
LB_2851:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_2848
	btr QWORD [rdi],1
	jmp LB_2849
LB_2848:
	bts QWORD [rdi],1
LB_2849:
	mov rsi,1
	bt r12,4
	jc LB_2840
	mov rsi,0
	bt r10,0
	jc LB_2840
	jmp LB_2841
LB_2840:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_2841:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_2838
	btr QWORD [rdi],1
	jmp LB_2839
LB_2838:
	bts QWORD [rdi],1
LB_2839:
	mov r8,0
	bts r12,2
	ret
LB_2852:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2854
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2853
LB_2854:
	add rsp,8
	ret
NS_E_2762_MTC_0_failed:
	add rsp,48
	pop r14
LB_2853:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "##"
	add r14,2
	cmp r14,r10
	jg LB_2930
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_2930
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_2930
	jmp LB_2931
LB_2930:
	jmp NS_E_2762_MTC_1_failed
LB_2931:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_cmt
	push r10
	call NS_E_2764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2935
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2936
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2936:
	jmp NS_E_2762_MTC_1_failed
LB_2935:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_2762_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2941
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2942
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2942:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2943
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2943:
	jmp NS_E_2762_MTC_1_failed
LB_2941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2923
	btr r12,2
	jmp LB_2924
LB_2923:
	bts r12,2
LB_2924:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2921
	btr r12,1
	jmp LB_2922
LB_2921:
	bts r12,1
LB_2922:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2919
	btr r12,0
	jmp LB_2920
LB_2919:
	bts r12,0
LB_2920:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_2916
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_2945
	btr r12,3
	jmp LB_2946
LB_2945:
	bts r12,3
LB_2946:
	mov r13,r14
	bt r12,1
	jc LB_2947
	btr r12,0
	jmp LB_2948
LB_2947:
	bts r12,0
LB_2948:
	mov r10,r8
	bt r12,2
	jc LB_2949
	btr r12,4
	jmp LB_2950
LB_2949:
	bts r12,4
LB_2950:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2953
	btr r12,5
	jmp LB_2954
LB_2953:
	bts r12,5
LB_2954:
	mov r14,r11
	bt r12,5
	jc LB_2951
	btr r12,1
	jmp LB_2952
LB_2951:
	bts r12,1
LB_2952:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2957
	btr r12,5
	jmp LB_2958
LB_2957:
	bts r12,5
LB_2958:
	mov r8,r11
	bt r12,5
	jc LB_2955
	btr r12,2
	jmp LB_2956
LB_2955:
	bts r12,2
LB_2956:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_2777 : %_2777
 ; {>  %_2774~0':_r64 %_2775~1':_r64 %_2776~2':(_lst)◂(_p2759) }
; 	» 0xr2 _ ⊢ 3' : %_2777
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_2777 %_2774 } ⊢ { %_2778 %_2779 } : { %_2778 %_2779 }
 ; {>  %_2774~0':_r64 %_2775~1':_r64 %_2777~3':_r64 %_2776~2':(_lst)◂(_p2759) }
	add r9,r13
; _f2760 %_2778 ⊢ %_2780 : %_2780
 ; {>  %_2775~1':_r64 %_2778~3':_r64 %_2776~2':(_lst)◂(_p2759) %_2779~0':_r64 }
; _f2760 3' ⊢ °0◂3'
; _cns { %_2780 %_2776 } ⊢ %_2781 : %_2781
 ; {>  %_2775~1':_r64 %_2780~°0◂3':_p2759 %_2776~2':(_lst)◂(_p2759) %_2779~0':_r64 }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_2775 %_2781 } ⊢ %_2782 : %_2782
 ; {>  %_2775~1':_r64 %_2781~°0◂{ °0◂3' 2' }:(_lst)◂(_p2759) %_2779~0':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_2782
 ; {>  %_2782~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p2759) }) %_2779~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_2895
	mov rdi,r13
	call dlt
LB_2895:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_2896
	btr r12,0
	jmp LB_2897
LB_2896:
	bts r12,0
LB_2897:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_2900
	btr r12,4
	jmp LB_2901
LB_2900:
	bts r12,4
LB_2901:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_2898
	btr QWORD [rdi],0
	jmp LB_2899
LB_2898:
	bts QWORD [rdi],0
LB_2899:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_2910
	btr r12,1
	jmp LB_2911
LB_2910:
	bts r12,1
LB_2911:
	mov rsi,1
	bt r12,1
	jc LB_2908
	mov rsi,0
	bt r14,0
	jc LB_2908
	jmp LB_2909
LB_2908:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_2909:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_2906
	btr QWORD [rdi],0
	jmp LB_2907
LB_2906:
	bts QWORD [rdi],0
LB_2907:
	mov r14,r8
	bt r12,2
	jc LB_2914
	btr r12,1
	jmp LB_2915
LB_2914:
	bts r12,1
LB_2915:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_2912
	btr QWORD [rdi],1
	jmp LB_2913
LB_2912:
	bts QWORD [rdi],1
LB_2913:
	mov rsi,1
	bt r12,4
	jc LB_2904
	mov rsi,0
	bt r10,0
	jc LB_2904
	jmp LB_2905
LB_2904:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_2905:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_2902
	btr QWORD [rdi],1
	jmp LB_2903
LB_2902:
	bts QWORD [rdi],1
LB_2903:
	mov r8,0
	bts r12,2
	ret
LB_2916:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2918
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2917
LB_2918:
	add rsp,8
	ret
NS_E_2762_MTC_1_failed:
	add rsp,48
	pop r14
LB_2917:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_2142_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3033
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2762_MTC_2_failed
LB_3033:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt
	push r10
	call NS_E_2762_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3038
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3039
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3039:
	jmp NS_E_2762_MTC_2_failed
LB_3038:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3028
	btr r12,1
	jmp LB_3029
LB_3028:
	bts r12,1
LB_3029:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3026
	btr r12,0
	jmp LB_3027
LB_3026:
	bts r12,0
LB_3027:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3023
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_3041
	btr r12,3
	jmp LB_3042
LB_3041:
	bts r12,3
LB_3042:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3045
	btr r12,4
	jmp LB_3046
LB_3045:
	bts r12,4
LB_3046:
	mov r14,r10
	bt r12,4
	jc LB_3043
	btr r12,1
	jmp LB_3044
LB_3043:
	bts r12,1
LB_3044:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3049
	btr r12,4
	jmp LB_3050
LB_3049:
	bts r12,4
LB_3050:
	mov r8,r10
	bt r12,4
	jc LB_3047
	btr r12,2
	jmp LB_3048
LB_3047:
	bts r12,2
LB_3048:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
MTC_LB_2959:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2960
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_2961
	bt QWORD [rax],0
	jc LB_2962
	btr r12,5
	jmp LB_2963
LB_2962:
	bts r12,5
LB_2963:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2961:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2966
	btr r12,6
	jmp LB_2967
LB_2966:
	bts r12,6
LB_2967:
	mov r9,rcx
	bt r12,6
	jc LB_2964
	btr r12,3
	jmp LB_2965
LB_2964:
	bts r12,3
LB_2965:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2970
	btr r12,6
	jmp LB_2971
LB_2970:
	bts r12,6
LB_2971:
	mov r10,rcx
	bt r12,6
	jc LB_2968
	btr r12,4
	jmp LB_2969
LB_2968:
	bts r12,4
LB_2969:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2960
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
; 3' ⊢ °1◂5'
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r9
	bt QWORD [rax],17
	jnc LB_2972
	bt QWORD [rax],0
	jc LB_2973
	btr r12,6
	jmp LB_2974
LB_2973:
	bts r12,6
LB_2974:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2972:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_2975
	btr r12,5
	jmp LB_2976
LB_2975:
	bts r12,5
LB_2976:
LB_2977:
	cmp r15,0
	jz LB_2978
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2977
LB_2978:
; » 0xr1 |~ {  } ⊢ %_2789 : %_2789
 ; {>  %_2783~0':_r64 %_2788~5':_r64 %_2787~4':(_lst)◂(_p2759) %_2784~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_2789
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_2788 %_2789 } ⊢ { %_2790 %_2791 } : { %_2790 %_2791 }
 ; {>  %_2783~0':_r64 %_2789~2':_r64 %_2788~5':_r64 %_2787~4':(_lst)◂(_p2759) %_2784~1':_r64 }
	add r11,r8
; _f34 { %_2784 %_2791 } ⊢ { %_2792 %_2793 } : { %_2792 %_2793 }
 ; {>  %_2790~5':_r64 %_2791~2':_r64 %_2783~0':_r64 %_2787~4':(_lst)◂(_p2759) %_2784~1':_r64 }
	add r14,r8
; _f2761 %_2790 ⊢ %_2794 : %_2794
 ; {>  %_2790~5':_r64 %_2792~1':_r64 %_2783~0':_r64 %_2787~4':(_lst)◂(_p2759) %_2793~2':_r64 }
; _f2761 5' ⊢ °1◂5'
; _cns { %_2794 %_2787 } ⊢ %_2795 : %_2795
 ; {>  %_2792~1':_r64 %_2783~0':_r64 %_2794~°1◂5':_p2759 %_2787~4':(_lst)◂(_p2759) %_2793~2':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_2792 %_2795 } ⊢ %_2796 : %_2796
 ; {>  %_2795~°0◂{ °1◂5' 4' }:(_lst)◂(_p2759) %_2792~1':_r64 %_2783~0':_r64 %_2793~2':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_2796
 ; {>  %_2783~0':_r64 %_2793~2':_r64 %_2796~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p2759) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_2979
	mov rdi,r13
	call dlt
LB_2979:
	bt r12,2
	jc LB_2980
	mov rdi,r8
	call dlt
LB_2980:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_2983
	btr r12,0
	jmp LB_2984
LB_2983:
	bts r12,0
LB_2984:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_2981
	btr QWORD [rdi],0
	jmp LB_2982
LB_2981:
	bts QWORD [rdi],0
LB_2982:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_2993
	btr r12,1
	jmp LB_2994
LB_2993:
	bts r12,1
LB_2994:
	mov rsi,1
	bt r12,1
	jc LB_2991
	mov rsi,0
	bt r14,0
	jc LB_2991
	jmp LB_2992
LB_2991:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_2992:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_2989
	btr QWORD [rdi],0
	jmp LB_2990
LB_2989:
	bts QWORD [rdi],0
LB_2990:
	mov r14,r10
	bt r12,4
	jc LB_2997
	btr r12,1
	jmp LB_2998
LB_2997:
	bts r12,1
LB_2998:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_2995
	btr QWORD [rdi],1
	jmp LB_2996
LB_2995:
	bts QWORD [rdi],1
LB_2996:
	mov rsi,1
	bt r12,0
	jc LB_2987
	mov rsi,0
	bt r13,0
	jc LB_2987
	jmp LB_2988
LB_2987:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_2988:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_2985
	btr QWORD [rdi],1
	jmp LB_2986
LB_2985:
	bts QWORD [rdi],1
LB_2986:
	mov r8,0
	bts r12,2
	ret
MTC_LB_2960:
	mov r15,0
LB_3000:
	cmp r15,0
	jz LB_3001
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3000
LB_3001:
; » 0xr1 |~ {  } ⊢ %_2797 : %_2797
 ; {>  %_2783~0':_r64 %_2785~2':(_lst)◂(_p2759) %_2784~1':_r64 }
; 	» 0xr1 _ ⊢ 3' : %_2797
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f34 { %_2784 %_2797 } ⊢ { %_2798 %_2799 } : { %_2798 %_2799 }
 ; {>  %_2797~3':_r64 %_2783~0':_r64 %_2785~2':(_lst)◂(_p2759) %_2784~1':_r64 }
	add r14,r9
; _f2761 %_2799 ⊢ %_2800 : %_2800
 ; {>  %_2799~3':_r64 %_2783~0':_r64 %_2785~2':(_lst)◂(_p2759) %_2798~1':_r64 }
; _f2761 3' ⊢ °1◂3'
; _cns { %_2800 %_2785 } ⊢ %_2801 : %_2801
 ; {>  %_2800~°1◂3':_p2759 %_2783~0':_r64 %_2785~2':(_lst)◂(_p2759) %_2798~1':_r64 }
; _cns { °1◂3' 2' } ⊢ °0◂{ °1◂3' 2' }
; _some { %_2798 %_2801 } ⊢ %_2802 : %_2802
 ; {>  %_2783~0':_r64 %_2798~1':_r64 %_2801~°0◂{ °1◂3' 2' }:(_lst)◂(_p2759) }
; _some { 1' °0◂{ °1◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂3' 2' } }
; ∎ %_2802
 ; {>  %_2783~0':_r64 %_2802~°0◂{ 1' °0◂{ °1◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p2759) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂3' 2' } }
	bt r12,0
	jc LB_3002
	mov rdi,r13
	call dlt
LB_3002:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °1◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_3003
	btr r12,0
	jmp LB_3004
LB_3003:
	bts r12,0
LB_3004:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_3007
	btr r12,4
	jmp LB_3008
LB_3007:
	bts r12,4
LB_3008:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_3005
	btr QWORD [rdi],0
	jmp LB_3006
LB_3005:
	bts QWORD [rdi],0
LB_3006:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_3017
	btr r12,1
	jmp LB_3018
LB_3017:
	bts r12,1
LB_3018:
	mov rsi,1
	bt r12,1
	jc LB_3015
	mov rsi,0
	bt r14,0
	jc LB_3015
	jmp LB_3016
LB_3015:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_3016:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3013
	btr QWORD [rdi],0
	jmp LB_3014
LB_3013:
	bts QWORD [rdi],0
LB_3014:
	mov r14,r8
	bt r12,2
	jc LB_3021
	btr r12,1
	jmp LB_3022
LB_3021:
	bts r12,1
LB_3022:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3019
	btr QWORD [rdi],1
	jmp LB_3020
LB_3019:
	bts QWORD [rdi],1
LB_3020:
	mov rsi,1
	bt r12,4
	jc LB_3011
	mov rsi,0
	bt r10,0
	jc LB_3011
	jmp LB_3012
LB_3011:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_3012:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_3009
	btr QWORD [rdi],1
	jmp LB_3010
LB_3009:
	bts QWORD [rdi],1
LB_3010:
	mov r8,0
	bts r12,2
	ret
MTC_LB_2999:
LB_3023:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3025
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3024
LB_3025:
	add rsp,8
	ret
NS_E_2762_MTC_2_failed:
	add rsp,32
	pop r14
LB_3024:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_3060
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "cmt {}" _ ⊢ 0' : %_2803
	mov rdi,6
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_7d_7b_20_74_6d_63
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _nil {  } ⊢ %_2804 : %_2804
 ; {>  %_2803~0':_stg }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_2805 : %_2805
 ; {>  %_2804~°1◂{  }:(_lst)◂(t954'(0)) %_2803~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_2805
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _some { %_2805 %_2804 } ⊢ %_2806 : %_2806
 ; {>  %_2804~°1◂{  }:(_lst)◂(t954'(0)) %_2805~1':_r64 %_2803~0':_stg }
; _some { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; ∎ %_2806
 ; {>  %_2806~°0◂{ 1' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t958'(0)) }) %_2803~0':_stg }
; 	∎ °0◂{ 1' °1◂{  } }
	bt r12,0
	jc LB_3051
	mov rdi,r13
	call dlt
LB_3051:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂{ 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_3054
	btr r12,0
	jmp LB_3055
LB_3054:
	bts r12,0
LB_3055:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_3052
	btr QWORD [rdi],0
	jmp LB_3053
LB_3052:
	bts QWORD [rdi],0
LB_3053:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_3058
	mov rsi,0
	bt r13,0
	jc LB_3058
	jmp LB_3059
LB_3058:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_3059:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_3056
	btr QWORD [rdi],1
	jmp LB_3057
LB_3056:
	bts QWORD [rdi],1
LB_3057:
	mov r8,0
	bts r12,2
	ret
LB_3060:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3062
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3061
LB_3062:
	add rsp,8
	ret
NS_E_2762_MTC_3_failed:
	add rsp,0
	pop r14
LB_3061:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2763:
NS_E_RDI_2763:
NS_E_2763_ETR_TBL:
NS_E_2763_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "#]"
	add r14,2
	cmp r14,r10
	jg LB_3075
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_3075
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_3075
	jmp LB_3076
LB_3075:
	jmp NS_E_2763_MTC_0_failed
LB_3076:
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
	jc LB_3068
	btr r12,0
	jmp LB_3069
LB_3068:
	bts r12,0
LB_3069:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3065
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_2807 : %_2807
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_2807
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _some %_2807 ⊢ %_2808 : %_2808
 ; {>  %_2807~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2808
 ; {>  %_2808~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3063
	btr r12,3
	jmp LB_3064
LB_3063:
	bts r12,3
LB_3064:
	mov r8,0
	bts r12,2
	ret
LB_3065:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3067
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3066
LB_3067:
	add rsp,8
	ret
NS_E_2763_MTC_0_failed:
	add rsp,16
	pop r14
LB_3066:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_3095
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_3095
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_3095
	jmp LB_3096
LB_3095:
	jmp NS_E_2763_MTC_1_failed
LB_3096:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_2763_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3100
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3101
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3101:
	jmp NS_E_2763_MTC_1_failed
LB_3100:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; blk_cmt
	push r10
	call NS_E_2763_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3106
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3107
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3107:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3108
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3108:
	jmp NS_E_2763_MTC_1_failed
LB_3106:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3088
	btr r12,2
	jmp LB_3089
LB_3088:
	bts r12,2
LB_3089:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3086
	btr r12,1
	jmp LB_3087
LB_3086:
	bts r12,1
LB_3087:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3084
	btr r12,0
	jmp LB_3085
LB_3084:
	bts r12,0
LB_3085:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3081
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_3110
	btr r12,3
	jmp LB_3111
LB_3110:
	bts r12,3
LB_3111:
	mov r14,r8
	bt r12,2
	jc LB_3112
	btr r12,1
	jmp LB_3113
LB_3112:
	bts r12,1
LB_3113:
	mov r8,r13
	bt r12,0
	jc LB_3114
	btr r12,2
	jmp LB_3115
LB_3114:
	bts r12,2
LB_3115:
	mov r13,r9
	bt r12,3
	jc LB_3116
	btr r12,0
	jmp LB_3117
LB_3116:
	bts r12,0
LB_3117:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_2811 : %_2811
 ; {>  %_2809~0':_r64 %_2810~1':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_2811
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f34 { %_2811 %_2809 } ⊢ { %_2812 %_2813 } : { %_2812 %_2813 }
 ; {>  %_2809~0':_r64 %_2811~2':_r64 %_2810~1':_r64 }
	add r8,r13
; _f34 { %_2812 %_2810 } ⊢ { %_2814 %_2815 } : { %_2814 %_2815 }
 ; {>  %_2813~0':_r64 %_2812~2':_r64 %_2810~1':_r64 }
	add r8,r14
; _some %_2814 ⊢ %_2816 : %_2816
 ; {>  %_2815~1':_r64 %_2813~0':_r64 %_2814~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_2816
 ; {>  %_2815~1':_r64 %_2813~0':_r64 %_2816~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_3077
	mov rdi,r14
	call dlt
LB_3077:
	bt r12,0
	jc LB_3078
	mov rdi,r13
	call dlt
LB_3078:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_3079
	btr r12,3
	jmp LB_3080
LB_3079:
	bts r12,3
LB_3080:
	mov r8,0
	bts r12,2
	ret
LB_3081:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3083
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3082
LB_3083:
	add rsp,8
	ret
NS_E_2763_MTC_1_failed:
	add rsp,48
	pop r14
LB_3082:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_2142_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3132
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2763_MTC_2_failed
LB_3132:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; blk_cmt
	push r10
	call NS_E_2763_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3137
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3138
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3138:
	jmp NS_E_2763_MTC_2_failed
LB_3137:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3127
	btr r12,1
	jmp LB_3128
LB_3127:
	bts r12,1
LB_3128:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3125
	btr r12,0
	jmp LB_3126
LB_3125:
	bts r12,0
LB_3126:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3122
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_2819 : %_2819
 ; {>  %_2818~1':_r64 %_2817~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_2819
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_2819 %_2818 } ⊢ { %_2820 %_2821 } : { %_2820 %_2821 }
 ; {>  %_2818~1':_r64 %_2819~2':_r64 %_2817~0':_r64 }
	add r8,r14
; _some %_2820 ⊢ %_2822 : %_2822
 ; {>  %_2821~1':_r64 %_2817~0':_r64 %_2820~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_2822
 ; {>  %_2821~1':_r64 %_2817~0':_r64 %_2822~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_3118
	mov rdi,r14
	call dlt
LB_3118:
	bt r12,0
	jc LB_3119
	mov rdi,r13
	call dlt
LB_3119:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_3120
	btr r12,3
	jmp LB_3121
LB_3120:
	bts r12,3
LB_3121:
	mov r8,0
	bts r12,2
	ret
LB_3122:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3124
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3123
LB_3124:
	add rsp,8
	ret
NS_E_2763_MTC_2_failed:
	add rsp,32
	pop r14
LB_3123:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2764:
NS_E_RDI_2764:
NS_E_2764_ETR_TBL:
NS_E_2764_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_3152
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_3152
	jmp LB_3153
LB_3152:
	jmp NS_E_2764_MTC_0_failed
LB_3153:
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
	jc LB_3145
	btr r12,0
	jmp LB_3146
LB_3145:
	bts r12,0
LB_3146:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3142
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_2823 : %_2823
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_2823
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_2823 ⊢ %_2824 : %_2824
 ; {>  %_2823~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2824
 ; {>  %_2824~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3140
	btr r12,3
	jmp LB_3141
LB_3140:
	bts r12,3
LB_3141:
	mov r8,0
	bts r12,2
	ret
LB_3142:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3144
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3143
LB_3144:
	add rsp,8
	ret
NS_E_2764_MTC_0_failed:
	add rsp,16
	pop r14
LB_3143:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_2142_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3168
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2764_MTC_1_failed
LB_3168:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_cmt
	push r10
	call NS_E_2764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3173
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3174
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3174:
	jmp NS_E_2764_MTC_1_failed
LB_3173:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3163
	btr r12,1
	jmp LB_3164
LB_3163:
	bts r12,1
LB_3164:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3161
	btr r12,0
	jmp LB_3162
LB_3161:
	bts r12,0
LB_3162:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3158
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_2827 : %_2827
 ; {>  %_2825~0':_r64 %_2826~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_2827
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_2827 %_2826 } ⊢ { %_2828 %_2829 } : { %_2828 %_2829 }
 ; {>  %_2827~2':_r64 %_2825~0':_r64 %_2826~1':_r64 }
	add r8,r14
; _some %_2828 ⊢ %_2830 : %_2830
 ; {>  %_2829~1':_r64 %_2825~0':_r64 %_2828~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_2830
 ; {>  %_2830~°0◂2':(_opn)◂(_r64) %_2829~1':_r64 %_2825~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_3154
	mov rdi,r14
	call dlt
LB_3154:
	bt r12,0
	jc LB_3155
	mov rdi,r13
	call dlt
LB_3155:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_3156
	btr r12,3
	jmp LB_3157
LB_3156:
	bts r12,3
LB_3157:
	mov r8,0
	bts r12,2
	ret
LB_3158:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3160
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3159
LB_3160:
	add rsp,8
	ret
NS_E_2764_MTC_1_failed:
	add rsp,32
	pop r14
LB_3159:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3198:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_3198:
MTC_LB_3199:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3200
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r10
	bt QWORD [rax],17
	jnc LB_3201
	bt QWORD [rax],0
	jc LB_3202
	btr r12,7
	jmp LB_3203
LB_3202:
	bts r12,7
LB_3203:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3201:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_3206
	btr r12,8
	jmp LB_3207
LB_3206:
	bts r12,8
LB_3207:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3204
	btr r12,5
	jmp LB_3205
LB_3204:
	bts r12,5
LB_3205:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_3210
	btr r12,8
	jmp LB_3211
LB_3210:
	bts r12,8
LB_3211:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3208
	btr r12,6
	jmp LB_3209
LB_3208:
	bts r12,6
LB_3209:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3212:
	cmp r15,0
	jz LB_3213
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3212
LB_3213:
MTC_LB_3214:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3215
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °1◂4'
; 5' ⊢ °1◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_3216
	bt QWORD [rax],0
	jc LB_3217
	btr r12,7
	jmp LB_3218
LB_3217:
	bts r12,7
LB_3218:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3216:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_3219
	btr r12,4
	jmp LB_3220
LB_3219:
	bts r12,4
LB_3220:
LB_3221:
	cmp r15,0
	jz LB_3222
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3221
LB_3222:
; _f36 %_3183 ⊢ { %_3184 %_3185 } : { %_3184 %_3185 }
 ; {>  %_3183~4':_r64 %_3182~6':(_lst)◂(_p2759) %_3176~0':_stg %_3179~3':_r64 %_3178~2':_stg %_3177~1':_r64 }
	mov r11,r10
	bts r12,5
; _f18 { %_3185 %_3176 %_3177 %_3178 %_3179 } ⊢ { %_3186 %_3187 %_3188 %_3189 %_3190 } : { %_3186 %_3187 %_3188 %_3189 %_3190 }
 ; {>  %_3182~6':(_lst)◂(_p2759) %_3176~0':_stg %_3179~3':_r64 %_3184~4':_r64 %_3178~2':_stg %_3177~1':_r64 %_3185~5':_r64 }
; _f18 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_3227
	btr r12,4
	jmp LB_3228
LB_3227:
	bts r12,4
LB_3228:
	mov r9,r8
	bt r12,2
	jc LB_3229
	btr r12,3
	jmp LB_3230
LB_3229:
	bts r12,3
LB_3230:
	mov r8,r14
	bt r12,1
	jc LB_3231
	btr r12,2
	jmp LB_3232
LB_3231:
	bts r12,2
LB_3232:
	mov r14,r13
	bt r12,0
	jc LB_3233
	btr r12,1
	jmp LB_3234
LB_3233:
	bts r12,1
LB_3234:
	mov r13,r11
	bt r12,5
	jc LB_3235
	btr r12,0
	jmp LB_3236
LB_3235:
	bts r12,0
LB_3236:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_3237
	btr r12,5
	jmp LB_3238
LB_3237:
	bts r12,5
LB_3238:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_3225
	btr r12,6
	jmp LB_3226
LB_3225:
	bts r12,6
LB_3226:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_3223
	btr r12,4
	jmp LB_3224
LB_3223:
	bts r12,4
LB_3224:
	add rsp,24
; _f3198 { %_3187 %_3188 %_3189 %_3190 %_3182 } ⊢ { %_3191 %_3192 } : { %_3191 %_3192 }
 ; {>  %_3182~6':(_lst)◂(_p2759) %_3188~2':_r64 %_3184~4':_r64 %_3190~5':_r64 %_3189~3':_stg %_3186~0':_r64 %_3187~1':_stg }
; _f3198 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_3243
	btr r12,0
	jmp LB_3244
LB_3243:
	bts r12,0
LB_3244:
	mov r14,r8
	bt r12,2
	jc LB_3245
	btr r12,1
	jmp LB_3246
LB_3245:
	bts r12,1
LB_3246:
	mov r8,r9
	bt r12,3
	jc LB_3247
	btr r12,2
	jmp LB_3248
LB_3247:
	bts r12,2
LB_3248:
	mov r9,r11
	bt r12,5
	jc LB_3249
	btr r12,3
	jmp LB_3250
LB_3249:
	bts r12,3
LB_3250:
	mov r10,rcx
	bt r12,6
	jc LB_3251
	btr r12,4
	jmp LB_3252
LB_3251:
	bts r12,4
LB_3252:
	call NS_E_3198
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3253
	btr r12,2
	jmp LB_3254
LB_3253:
	bts r12,2
LB_3254:
	mov r14,r13
	bt r12,0
	jc LB_3255
	btr r12,1
	jmp LB_3256
LB_3255:
	bts r12,1
LB_3256:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3241
	btr r12,4
	jmp LB_3242
LB_3241:
	bts r12,4
LB_3242:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3239
	btr r12,0
	jmp LB_3240
LB_3239:
	bts r12,0
LB_3240:
	add rsp,24
; ∎ { %_3191 %_3192 }
 ; {>  %_3191~1':_stg %_3192~2':_stg %_3184~4':_r64 %_3186~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_3257
	mov rdi,r10
	call dlt
LB_3257:
	bt r12,0
	jc LB_3258
	mov rdi,r13
	call dlt
LB_3258:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_3259
	btr r12,0
	jmp LB_3260
LB_3259:
	bts r12,0
LB_3260:
	mov r14,r8
	bt r12,2
	jc LB_3261
	btr r12,1
	jmp LB_3262
LB_3261:
	bts r12,1
LB_3262:
	ret
MTC_LB_3215:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3263
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °0◂4'
; 5' ⊢ °0◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_3264
	bt QWORD [rax],0
	jc LB_3265
	btr r12,7
	jmp LB_3266
LB_3265:
	bts r12,7
LB_3266:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3264:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_3267
	btr r12,4
	jmp LB_3268
LB_3267:
	bts r12,4
LB_3268:
LB_3269:
	cmp r15,0
	jz LB_3270
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3269
LB_3270:
; _f34 { %_3177 %_3193 } ⊢ { %_3194 %_3195 } : { %_3194 %_3195 }
 ; {>  %_3182~6':(_lst)◂(_p2759) %_3176~0':_stg %_3179~3':_r64 %_3178~2':_stg %_3177~1':_r64 %_3193~4':_r64 }
	add r14,r10
; _f3198 { %_3176 %_3194 %_3178 %_3179 %_3182 } ⊢ { %_3196 %_3197 } : { %_3196 %_3197 }
 ; {>  %_3182~6':(_lst)◂(_p2759) %_3195~4':_r64 %_3176~0':_stg %_3179~3':_r64 %_3194~1':_r64 %_3178~2':_stg }
; _f3198 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_3273
	btr r12,4
	jmp LB_3274
LB_3273:
	bts r12,4
LB_3274:
	call NS_E_3198
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_3271
	btr r12,4
	jmp LB_3272
LB_3271:
	bts r12,4
LB_3272:
	add rsp,16
; ∎ { %_3196 %_3197 }
 ; {>  %_3195~4':_r64 %_3197~1':_stg %_3196~0':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_3275
	mov rdi,r10
	call dlt
LB_3275:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3263:
MTC_LB_3200:
	mov r15,0
LB_3277:
	cmp r15,0
	jz LB_3278
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3277
LB_3278:
; ∎ { %_3176 %_3178 }
 ; {>  %_3176~0':_stg %_3179~3':_r64 %_3180~4':(_lst)◂(_p2759) %_3178~2':_stg %_3177~1':_r64 }
; 	∎ { 0' 2' }
	bt r12,3
	jc LB_3279
	mov rdi,r9
	call dlt
LB_3279:
	bt r12,4
	jc LB_3280
	mov rdi,r10
	call dlt
LB_3280:
	bt r12,1
	jc LB_3281
	mov rdi,r14
	call dlt
LB_3281:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3282
	btr r12,1
	jmp LB_3283
LB_3282:
	bts r12,1
LB_3283:
	ret
MTC_LB_3276:
NS_E_3299:
; 	|» 0'
NS_E_RDI_3299:
; » 0xr0 |~ {  } ⊢ %_3285 : %_3285
 ; {>  %_3284~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_3285
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f2762 { %_3284 %_3285 } ⊢ { %_3286 %_3287 %_3288 } : { %_3286 %_3287 %_3288 }
 ; {>  %_3284~0':_stg %_3285~1':_r64 }
; _f2762 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2762
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_3300
	btr r12,4
	jmp LB_3301
LB_3300:
	bts r12,4
LB_3301:
	mov r8,r9
	bt r12,3
	jc LB_3304
	btr r12,2
	jmp LB_3305
LB_3304:
	bts r12,2
LB_3305:
	mov rsi,1
	bt r12,2
	jc LB_3302
	mov rsi,0
	bt r8,0
	jc LB_3302
	jmp LB_3303
LB_3302:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_3303:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_3306:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3307
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_3308
	bt QWORD [rax],0
	jc LB_3309
	btr r12,5
	jmp LB_3310
LB_3309:
	bts r12,5
LB_3310:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3308:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3313
	btr r12,6
	jmp LB_3314
LB_3313:
	bts r12,6
LB_3314:
	mov r9,rcx
	bt r12,6
	jc LB_3311
	btr r12,3
	jmp LB_3312
LB_3311:
	bts r12,3
LB_3312:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3317
	btr r12,6
	jmp LB_3318
LB_3317:
	bts r12,6
LB_3318:
	mov r10,rcx
	bt r12,6
	jc LB_3315
	btr r12,4
	jmp LB_3316
LB_3315:
	bts r12,4
LB_3316:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3319:
	cmp r15,0
	jz LB_3320
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3319
LB_3320:
; _f14 %_3289 ⊢ { %_3291 %_3292 } : { %_3291 %_3292 }
 ; {>  %_3289~3':_r64 %_3290~4':(_lst)◂(_p2759) %_3287~1':_r64 %_3286~0':_stg }
; _f14 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_3327
	btr r12,0
	jmp LB_3328
LB_3327:
	bts r12,0
LB_3328:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_3329
	btr r12,2
	jmp LB_3330
LB_3329:
	bts r12,2
LB_3330:
	mov r9,r14
	bt r12,1
	jc LB_3331
	btr r12,3
	jmp LB_3332
LB_3331:
	bts r12,3
LB_3332:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3325
	btr r12,4
	jmp LB_3326
LB_3325:
	bts r12,4
LB_3326:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3323
	btr r12,1
	jmp LB_3324
LB_3323:
	bts r12,1
LB_3324:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3321
	btr r12,0
	jmp LB_3322
LB_3321:
	bts r12,0
LB_3322:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_3293 : %_3293
 ; {>  %_3290~4':(_lst)◂(_p2759) %_3287~1':_r64 %_3286~0':_stg %_3292~3':_stg %_3291~2':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_3293
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_3294 : %_3294
 ; {>  %_3293~5':_r64 %_3290~4':(_lst)◂(_p2759) %_3287~1':_r64 %_3286~0':_stg %_3292~3':_stg %_3291~2':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_3294
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f3198 { %_3286 %_3293 %_3292 %_3294 %_3290 } ⊢ { %_3295 %_3296 } : { %_3295 %_3296 }
 ; {>  %_3294~6':_r64 %_3293~5':_r64 %_3290~4':(_lst)◂(_p2759) %_3287~1':_r64 %_3286~0':_stg %_3292~3':_stg %_3291~2':_r64 }
; _f3198 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_3337
	btr r12,1
	jmp LB_3338
LB_3337:
	bts r12,1
LB_3338:
	mov r8,r9
	bt r12,3
	jc LB_3339
	btr r12,2
	jmp LB_3340
LB_3339:
	bts r12,2
LB_3340:
	mov r9,rcx
	bt r12,6
	jc LB_3341
	btr r12,3
	jmp LB_3342
LB_3341:
	bts r12,3
LB_3342:
	call NS_E_3198
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3343
	btr r12,3
	jmp LB_3344
LB_3343:
	bts r12,3
LB_3344:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3335
	btr r12,2
	jmp LB_3336
LB_3335:
	bts r12,2
LB_3336:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3333
	btr r12,1
	jmp LB_3334
LB_3333:
	bts r12,1
LB_3334:
	add rsp,24
; _some %_3296 ⊢ %_3297 : %_3297
 ; {>  %_3295~0':_stg %_3287~1':_r64 %_3296~3':_stg %_3291~2':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_3295 %_3297 }
 ; {>  %_3295~0':_stg %_3297~°0◂3':(_opn)◂(_stg) %_3287~1':_r64 %_3291~2':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,1
	jc LB_3345
	mov rdi,r14
	call dlt
LB_3345:
	bt r12,2
	jc LB_3346
	mov rdi,r8
	call dlt
LB_3346:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3349
	btr r12,1
	jmp LB_3350
LB_3349:
	bts r12,1
LB_3350:
	mov rsi,1
	bt r12,1
	jc LB_3347
	mov rsi,0
	bt r14,0
	jc LB_3347
	jmp LB_3348
LB_3347:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_3348:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_3307:
	mov r15,0
LB_3352:
	cmp r15,0
	jz LB_3353
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3352
LB_3353:
; _none {  } ⊢ %_3298 : %_3298
 ; {>  %_3288~2':(_opn)◂({ _r64 (_lst)◂(_p2759) }) %_3287~1':_r64 %_3286~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ { %_3286 %_3298 }
 ; {>  %_3288~2':(_opn)◂({ _r64 (_lst)◂(_p2759) }) %_3287~1':_r64 %_3286~0':_stg %_3298~°1◂{  }:(_opn)◂(t1118'(0)) }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_3354
	mov rdi,r8
	call dlt
LB_3354:
	bt r12,1
	jc LB_3355
	mov rdi,r14
	call dlt
LB_3355:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_3356
	mov rsi,0
	bt r14,0
	jc LB_3356
	jmp LB_3357
LB_3356:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_3357:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_3351:
NS_E_3363:
NS_E_RDI_3363:
; » _^ ..
	mov rax,45
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "##\n"
	mov rsi,0x_23
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_23
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; "W"
	mov rsi,0x_57
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "[# fdEF [# F #] jfioe 2 #]"
	mov rsi,0x_20_46_45_64_66_20_23_5b
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20_5d_23_20_46_20_23_5b
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_20_32_20_65_6f_69_66_6a
	mov QWORD [rdi+8*2],rsi
	mov rsi,0x_23
	mov BYTE [rdi+8*3+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*3+1],sil
	add rdi,26
; "FF## huugugugu\n"
	mov rsi,0x_75_75_68_20_23_23_46_46
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_67
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_75
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_67
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_75
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_67
	mov BYTE [rdi+8*1+4],sil
	mov rsi,0x_75
	mov BYTE [rdi+8*1+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+6],sil
	add rdi,15
; //
	mov r13,rax
	btr r12,0
; _f3299 %_3358 ⊢ { %_3359 %_3360 } : { %_3359 %_3360 }
 ; {>  %_3358~0':_stg }
; _f3299 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_3299
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_3359 %_3360 } ⊢ { %_3361 %_3362 } : { %_3361 %_3362 }
 ; {>  %_3360~1':(_opn)◂(_stg) %_3359~0':_stg }
; _f21 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_3364
	btr r12,2
	jmp LB_3365
LB_3364:
	bts r12,2
LB_3365:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_3368
	btr r12,3
	jmp LB_3369
LB_3368:
	bts r12,3
LB_3369:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_3366
	btr QWORD [rdi],0
	jmp LB_3367
LB_3366:
	bts QWORD [rdi],0
LB_3367:
	mov r9,r14
	bt r12,1
	jc LB_3372
	btr r12,3
	jmp LB_3373
LB_3372:
	bts r12,3
LB_3373:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_3370
	btr QWORD [rdi],1
	jmp LB_3371
LB_3370:
	bts QWORD [rdi],1
LB_3371:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_3374
	btr r12,2
	jmp LB_3375
LB_3374:
	bts r12,2
LB_3375:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_3378
	btr r12,3
	jmp LB_3379
LB_3378:
	bts r12,3
LB_3379:
	mov r13,r9
	bt r12,3
	jc LB_3376
	btr r12,0
	jmp LB_3377
LB_3376:
	bts r12,0
LB_3377:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_3382
	btr r12,3
	jmp LB_3383
LB_3382:
	bts r12,3
LB_3383:
	mov r14,r9
	bt r12,3
	jc LB_3380
	btr r12,1
	jmp LB_3381
LB_3380:
	bts r12,1
LB_3381:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_3361~0':_stg %_3362~1':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_3384
	mov rdi,r13
	call dlt
LB_3384:
	bt r12,1
	jc LB_3385
	mov rdi,r14
	call dlt
LB_3385:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_3387:
NS_E_RDI_3387:
NS_E_3387_ETR_TBL:
NS_E_3387_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	push r10
	call NS_E_3389_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3459
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3387_MTC_0_failed
LB_3459:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_lst
	push r10
	call NS_E_3387_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3464
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3465
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3465:
	jmp NS_E_3387_MTC_0_failed
LB_3464:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3453
	btr QWORD [rdi],1
LB_3453:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3454
	btr QWORD [rdi],0
LB_3454:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3387_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3387_MTC_1_failed:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3389:
NS_E_RDI_3389:
NS_E_3389_ETR_TBL:
NS_E_3389_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_3670
LB_3669:
	add r14,1
LB_3670:
	cmp r14,r10
	jge LB_3671
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3669
	cmp al,10
	jz LB_3669
	cmp al,32
	jz LB_3669
LB_3671:
	add r14,4
	cmp r14,r10
	jg LB_3674
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_3674
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_3674
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_3674
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_3674
	jmp LB_3675
LB_3674:
	jmp NS_E_3389_MTC_0_failed
LB_3675:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_3677
LB_3676:
	add r14,1
LB_3677:
	cmp r14,r10
	jge LB_3678
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3676
	cmp al,10
	jz LB_3676
	cmp al,32
	jz LB_3676
LB_3678:
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3679
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3680
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3680:
	jmp NS_E_3389_MTC_0_failed
LB_3679:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_3683
LB_3682:
	add r14,1
LB_3683:
	cmp r14,r10
	jge LB_3684
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3682
	cmp al,10
	jz LB_3682
	cmp al,32
	jz LB_3682
LB_3684:
	add r14,1
	cmp r14,r10
	jg LB_3689
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_3689
	jmp LB_3690
LB_3689:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3686
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3686:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3687
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3687:
	jmp NS_E_3389_MTC_0_failed
LB_3690:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_3692
LB_3691:
	add r14,1
LB_3692:
	cmp r14,r10
	jge LB_3693
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3691
	cmp al,10
	jz LB_3691
	cmp al,32
	jz LB_3691
LB_3693:
	push r10
	call NS_E_3393_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3694
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3695
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3695:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3696
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3696:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3697
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3697:
	jmp NS_E_3389_MTC_0_failed
LB_3694:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3664
	btr QWORD [rdi],3
LB_3664:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3665
	btr QWORD [rdi],2
LB_3665:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3666
	btr QWORD [rdi],1
LB_3666:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3667
	btr QWORD [rdi],0
LB_3667:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3389_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_3635
LB_3634:
	add r14,1
LB_3635:
	cmp r14,r10
	jge LB_3636
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3634
	cmp al,10
	jz LB_3634
	cmp al,32
	jz LB_3634
LB_3636:
	add r14,4
	cmp r14,r10
	jg LB_3639
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_3639
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_3639
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_3639
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_3639
	jmp LB_3640
LB_3639:
	jmp NS_E_3389_MTC_1_failed
LB_3640:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_3642
LB_3641:
	add r14,1
LB_3642:
	cmp r14,r10
	jge LB_3643
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3641
	cmp al,10
	jz LB_3641
	cmp al,32
	jz LB_3641
LB_3643:
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3644
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3645
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3645:
	jmp NS_E_3389_MTC_1_failed
LB_3644:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; glb_etr_lst
	jmp LB_3648
LB_3647:
	add r14,1
LB_3648:
	cmp r14,r10
	jge LB_3649
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3647
	cmp al,10
	jz LB_3647
	cmp al,32
	jz LB_3647
LB_3649:
	push r10
	call NS_E_3387_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3650
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3651
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3651:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3652
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3652:
	jmp NS_E_3389_MTC_1_failed
LB_3650:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\136\142\226\136\142"
	jmp LB_3655
LB_3654:
	add r14,1
LB_3655:
	cmp r14,r10
	jge LB_3656
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3654
	cmp al,10
	jz LB_3654
	cmp al,32
	jz LB_3654
LB_3656:
	add r14,6
	cmp r14,r10
	jg LB_3662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_3662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_3662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_3662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_3662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_3662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_3662
	jmp LB_3663
LB_3662:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3658
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3658:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3659
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3659:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3660
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3660:
	jmp NS_E_3389_MTC_1_failed
LB_3663:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3629
	btr QWORD [rdi],3
LB_3629:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3630
	btr QWORD [rdi],2
LB_3630:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3631
	btr QWORD [rdi],1
LB_3631:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3632
	btr QWORD [rdi],0
LB_3632:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3389_MTC_1_failed:
	add rsp,64
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_3600
LB_3599:
	add r14,1
LB_3600:
	cmp r14,r10
	jge LB_3601
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3599
	cmp al,10
	jz LB_3599
	cmp al,32
	jz LB_3599
LB_3601:
	add r14,2
	cmp r14,r10
	jg LB_3604
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_3604
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_3604
	jmp LB_3605
LB_3604:
	jmp NS_E_3389_MTC_2_failed
LB_3605:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_3607
LB_3606:
	add r14,1
LB_3607:
	cmp r14,r10
	jge LB_3608
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3606
	cmp al,10
	jz LB_3606
	cmp al,32
	jz LB_3606
LB_3608:
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3609
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3610
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3610:
	jmp NS_E_3389_MTC_2_failed
LB_3609:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_3613
LB_3612:
	add r14,1
LB_3613:
	cmp r14,r10
	jge LB_3614
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3612
	cmp al,10
	jz LB_3612
	cmp al,32
	jz LB_3612
LB_3614:
	add r14,1
	cmp r14,r10
	jg LB_3619
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_3619
	jmp LB_3620
LB_3619:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3616
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3616:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3617
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3617:
	jmp NS_E_3389_MTC_2_failed
LB_3620:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; cst
	jmp LB_3622
LB_3621:
	add r14,1
LB_3622:
	cmp r14,r10
	jge LB_3623
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3621
	cmp al,10
	jz LB_3621
	cmp al,32
	jz LB_3621
LB_3623:
	push r10
	call NS_E_3391_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3624
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3625
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3625:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3626
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3626:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3627
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3627:
	jmp NS_E_3389_MTC_2_failed
LB_3624:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3594
	btr QWORD [rdi],3
LB_3594:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3595
	btr QWORD [rdi],2
LB_3595:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3596
	btr QWORD [rdi],1
LB_3596:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3597
	btr QWORD [rdi],0
LB_3597:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3389_MTC_2_failed:
	add rsp,64
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_3565
LB_3564:
	add r14,1
LB_3565:
	cmp r14,r10
	jge LB_3566
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3564
	cmp al,10
	jz LB_3564
	cmp al,32
	jz LB_3564
LB_3566:
	add r14,2
	cmp r14,r10
	jg LB_3569
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_3569
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_3569
	jmp LB_3570
LB_3569:
	jmp NS_E_3389_MTC_3_failed
LB_3570:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_3572
LB_3571:
	add r14,1
LB_3572:
	cmp r14,r10
	jge LB_3573
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3571
	cmp al,10
	jz LB_3571
	cmp al,32
	jz LB_3571
LB_3573:
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3574
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3575
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3575:
	jmp NS_E_3389_MTC_3_failed
LB_3574:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\194\171"
	jmp LB_3578
LB_3577:
	add r14,1
LB_3578:
	cmp r14,r10
	jge LB_3579
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3577
	cmp al,10
	jz LB_3577
	cmp al,32
	jz LB_3577
LB_3579:
	add r14,2
	cmp r14,r10
	jg LB_3584
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_3584
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_3584
	jmp LB_3585
LB_3584:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3581
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3581:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3582
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3582:
	jmp NS_E_3389_MTC_3_failed
LB_3585:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; op_lines
	jmp LB_3587
LB_3586:
	add r14,1
LB_3587:
	cmp r14,r10
	jge LB_3588
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3586
	cmp al,10
	jz LB_3586
	cmp al,32
	jz LB_3586
LB_3588:
	push r10
	call NS_E_3399_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3589
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3590
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3590:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3591
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3591:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3592
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3592:
	jmp NS_E_3389_MTC_3_failed
LB_3589:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3559
	btr QWORD [rdi],3
LB_3559:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3560
	btr QWORD [rdi],2
LB_3560:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3561
	btr QWORD [rdi],1
LB_3561:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3562
	btr QWORD [rdi],0
LB_3562:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3389_MTC_3_failed:
	add rsp,64
	pop r14
; c4
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_3532
LB_3531:
	add r14,1
LB_3532:
	cmp r14,r10
	jge LB_3533
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3531
	cmp al,10
	jz LB_3531
	cmp al,32
	jz LB_3531
LB_3533:
	add r14,2
	cmp r14,r10
	jg LB_3536
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_3536
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_3536
	jmp LB_3537
LB_3536:
	jmp NS_E_3389_MTC_4_failed
LB_3537:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_3539
LB_3538:
	add r14,1
LB_3539:
	cmp r14,r10
	jge LB_3540
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3538
	cmp al,10
	jz LB_3538
	cmp al,32
	jz LB_3538
LB_3540:
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3541
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3542
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3542:
	jmp NS_E_3389_MTC_4_failed
LB_3541:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; reg_ptn
	jmp LB_3545
LB_3544:
	add r14,1
LB_3545:
	cmp r14,r10
	jge LB_3546
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3544
	cmp al,10
	jz LB_3544
	cmp al,32
	jz LB_3544
LB_3546:
	push r10
	call NS_E_3411_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3547
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3548
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3548:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3549
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3549:
	jmp NS_E_3389_MTC_4_failed
LB_3547:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; op_lines
	jmp LB_3552
LB_3551:
	add r14,1
LB_3552:
	cmp r14,r10
	jge LB_3553
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3551
	cmp al,10
	jz LB_3551
	cmp al,32
	jz LB_3551
LB_3553:
	push r10
	call NS_E_3399_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3554
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3555
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3555:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3556
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3556:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3557
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3557:
	jmp NS_E_3389_MTC_4_failed
LB_3554:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3526
	btr QWORD [rdi],3
LB_3526:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3527
	btr QWORD [rdi],2
LB_3527:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3528
	btr QWORD [rdi],1
LB_3528:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3529
	btr QWORD [rdi],0
LB_3529:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0400_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3389_MTC_4_failed:
	add rsp,64
	pop r14
; c5
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\182"
	jmp LB_3497
LB_3496:
	add r14,1
LB_3497:
	cmp r14,r10
	jge LB_3498
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3496
	cmp al,10
	jz LB_3496
	cmp al,32
	jz LB_3496
LB_3498:
	add r14,2
	cmp r14,r10
	jg LB_3501
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_3501
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_3501
	jmp LB_3502
LB_3501:
	jmp NS_E_3389_MTC_5_failed
LB_3502:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_3504
LB_3503:
	add r14,1
LB_3504:
	cmp r14,r10
	jge LB_3505
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3503
	cmp al,10
	jz LB_3503
	cmp al,32
	jz LB_3503
LB_3505:
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3506
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3507
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3507:
	jmp NS_E_3389_MTC_5_failed
LB_3506:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_3510
LB_3509:
	add r14,1
LB_3510:
	cmp r14,r10
	jge LB_3511
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3509
	cmp al,10
	jz LB_3509
	cmp al,32
	jz LB_3509
LB_3511:
	add r14,1
	cmp r14,r10
	jg LB_3516
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_3516
	jmp LB_3517
LB_3516:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3513
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3513:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3514
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3514:
	jmp NS_E_3389_MTC_5_failed
LB_3517:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_3519
LB_3518:
	add r14,1
LB_3519:
	cmp r14,r10
	jge LB_3520
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3518
	cmp al,10
	jz LB_3518
	cmp al,32
	jz LB_3518
LB_3520:
	push r10
	call NS_E_3393_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3521
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3522
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3522:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3523
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3523:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3524
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3524:
	jmp NS_E_3389_MTC_5_failed
LB_3521:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3491
	btr QWORD [rdi],3
LB_3491:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3492
	btr QWORD [rdi],2
LB_3492:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3493
	btr QWORD [rdi],1
LB_3493:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3494
	btr QWORD [rdi],0
LB_3494:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0500_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3389_MTC_5_failed:
	add rsp,64
	pop r14
; c6
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\182"
	jmp LB_3472
LB_3471:
	add r14,1
LB_3472:
	cmp r14,r10
	jge LB_3473
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3471
	cmp al,10
	jz LB_3471
	cmp al,32
	jz LB_3471
LB_3473:
	add r14,2
	cmp r14,r10
	jg LB_3476
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_3476
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_3476
	jmp LB_3477
LB_3476:
	jmp NS_E_3389_MTC_6_failed
LB_3477:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_3479
LB_3478:
	add r14,1
LB_3479:
	cmp r14,r10
	jge LB_3480
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3478
	cmp al,10
	jz LB_3478
	cmp al,32
	jz LB_3478
LB_3480:
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3481
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3482
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3482:
	jmp NS_E_3389_MTC_6_failed
LB_3481:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dta_def
	jmp LB_3485
LB_3484:
	add r14,1
LB_3485:
	cmp r14,r10
	jge LB_3486
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3484
	cmp al,10
	jz LB_3484
	cmp al,32
	jz LB_3484
LB_3486:
	push r10
	call NS_E_3395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3487
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3488
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3488:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3489
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3489:
	jmp NS_E_3389_MTC_6_failed
LB_3487:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3467
	btr QWORD [rdi],2
LB_3467:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3468
	btr QWORD [rdi],1
LB_3468:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3469
	btr QWORD [rdi],0
LB_3469:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0600_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3389_MTC_6_failed:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3391:
NS_E_RDI_3391:
NS_E_3391_ETR_TBL:
NS_E_3391_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_2144_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3719
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3391_MTC_0_failed
LB_3719:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_3727
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_3727
	jmp LB_3728
LB_3727:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3725
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3725:
	jmp NS_E_3391_MTC_0_failed
LB_3728:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3713
	btr QWORD [rdi],1
LB_3713:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3714
	btr QWORD [rdi],0
LB_3714:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3391_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_2215_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3711
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3391_MTC_1_failed
LB_3711:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3706
	btr QWORD [rdi],0
LB_3706:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3391_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_3393_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3704
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3391_MTC_2_failed
LB_3704:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3699
	btr QWORD [rdi],0
LB_3699:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3391_MTC_2_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3393:
NS_E_RDI_3393:
NS_E_3393_ETR_TBL:
NS_E_3393_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	push r10
	call NS_E_2704_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3774
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3393_MTC_0_failed
LB_3774:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_3782
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_3782
	jmp LB_3783
LB_3782:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3780
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3780:
	jmp NS_E_3393_MTC_0_failed
LB_3783:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_3393_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3787
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3788
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3788:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3789
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3789:
	jmp NS_E_3393_MTC_0_failed
LB_3787:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3767
	btr QWORD [rdi],2
LB_3767:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3768
	btr QWORD [rdi],1
LB_3768:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3769
	btr QWORD [rdi],0
LB_3769:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3393_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3750
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3393_MTC_1_failed
LB_3750:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_3758
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_3758
	jmp LB_3759
LB_3758:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3756
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3756:
	jmp NS_E_3393_MTC_1_failed
LB_3759:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_3393_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3763
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3764
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3764:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3765
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3765:
	jmp NS_E_3393_MTC_1_failed
LB_3763:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3743
	btr QWORD [rdi],2
LB_3743:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3744
	btr QWORD [rdi],1
LB_3744:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3745
	btr QWORD [rdi],0
LB_3745:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3393_MTC_1_failed:
	add rsp,48
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3741
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3393_MTC_2_failed
LB_3741:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3736
	btr QWORD [rdi],0
LB_3736:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3393_MTC_2_failed:
	add rsp,16
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	push r10
	call NS_E_2704_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3734
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3393_MTC_3_failed
LB_3734:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3729
	btr QWORD [rdi],0
LB_3729:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3393_MTC_3_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3395:
NS_E_RDI_3395:
NS_E_3395_ETR_TBL:
NS_E_3395_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\136\144"
	add r14,3
	cmp r14,r10
	jg LB_3803
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3803
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_3803
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_3803
	jmp LB_3804
LB_3803:
	jmp NS_E_3395_MTC_0_failed
LB_3804:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3808
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3809
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3809:
	jmp NS_E_3395_MTC_0_failed
LB_3808:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	add r14,1
	cmp r14,r10
	jg LB_3818
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_3818
	jmp LB_3819
LB_3818:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3815
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3815:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3816
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3816:
	jmp NS_E_3395_MTC_0_failed
LB_3819:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	push r10
	call NS_E_3403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3823
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3824
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3824:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3825
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3825:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3826
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3826:
	jmp NS_E_3395_MTC_0_failed
LB_3823:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	push r10
	call NS_E_3397_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3831
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3832
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3832:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3833
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3833:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3834
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3834:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3835
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3835:
	jmp NS_E_3395_MTC_0_failed
LB_3831:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; dta_def_coprd
	push r10
	call NS_E_3397_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3840
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_3841
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_3841:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3842
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3842:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3843
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3843:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3844
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3844:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3845
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3845:
	jmp NS_E_3395_MTC_0_failed
LB_3840:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0006_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_3791
	btr QWORD [rdi],5
LB_3791:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_3792
	btr QWORD [rdi],4
LB_3792:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3793
	btr QWORD [rdi],3
LB_3793:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3794
	btr QWORD [rdi],2
LB_3794:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3795
	btr QWORD [rdi],1
LB_3795:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3796
	btr QWORD [rdi],0
LB_3796:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,96
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3395_MTC_0_failed:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3397:
NS_E_RDI_3397:
NS_E_3397_ETR_TBL:
NS_E_3397_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_3855
LB_3854:
	add r14,1
LB_3855:
	cmp r14,r10
	jge LB_3856
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3854
	cmp al,10
	jz LB_3854
	cmp al,32
	jz LB_3854
LB_3856:
	add r14,3
	cmp r14,r10
	jg LB_3859
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3859
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_3859
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_3859
	jmp LB_3860
LB_3859:
	jmp NS_E_3397_MTC_0_failed
LB_3860:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_3862
LB_3861:
	add r14,1
LB_3862:
	cmp r14,r10
	jge LB_3863
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3861
	cmp al,10
	jz LB_3861
	cmp al,32
	jz LB_3861
LB_3863:
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3864
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3865
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3865:
	jmp NS_E_3397_MTC_0_failed
LB_3864:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_3868
LB_3867:
	add r14,1
LB_3868:
	cmp r14,r10
	jge LB_3869
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3867
	cmp al,10
	jz LB_3867
	cmp al,32
	jz LB_3867
LB_3869:
	add r14,1
	cmp r14,r10
	jg LB_3874
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_3874
	jmp LB_3875
LB_3874:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3871
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3871:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3872
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3872:
	jmp NS_E_3397_MTC_0_failed
LB_3875:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_3877
LB_3876:
	add r14,1
LB_3877:
	cmp r14,r10
	jge LB_3878
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3876
	cmp al,10
	jz LB_3876
	cmp al,32
	jz LB_3876
LB_3878:
	push r10
	call NS_E_3403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3879
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3880
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3880:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3881
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3881:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3882
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3882:
	jmp NS_E_3397_MTC_0_failed
LB_3879:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	jmp LB_3885
LB_3884:
	add r14,1
LB_3885:
	cmp r14,r10
	jge LB_3886
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3884
	cmp al,10
	jz LB_3884
	cmp al,32
	jz LB_3884
LB_3886:
	push r10
	call NS_E_3397_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3887
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3888
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3888:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3889
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3889:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3890
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3890:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3891
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3891:
	jmp NS_E_3397_MTC_0_failed
LB_3887:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_3848
	btr QWORD [rdi],4
LB_3848:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3849
	btr QWORD [rdi],3
LB_3849:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3850
	btr QWORD [rdi],2
LB_3850:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3851
	btr QWORD [rdi],1
LB_3851:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3852
	btr QWORD [rdi],0
LB_3852:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,80
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3397_MTC_0_failed:
	add rsp,80
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3397_MTC_1_failed:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3399:
NS_E_RDI_3399:
NS_E_3399_ETR_TBL:
NS_E_3399_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_3960
LB_3959:
	add r14,1
LB_3960:
	cmp r14,r10
	jge LB_3961
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3959
	cmp al,10
	jz LB_3959
	cmp al,32
	jz LB_3959
LB_3961:
	push r10
	call NS_E_3393_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3962
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3399_MTC_0_failed
LB_3962:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_3965
LB_3964:
	add r14,1
LB_3965:
	cmp r14,r10
	jge LB_3966
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3964
	cmp al,10
	jz LB_3964
	cmp al,32
	jz LB_3964
LB_3966:
	push r10
	call NS_E_3411_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3967
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3968
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3968:
	jmp NS_E_3399_MTC_0_failed
LB_3967:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_3971
LB_3970:
	add r14,1
LB_3971:
	cmp r14,r10
	jge LB_3972
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3970
	cmp al,10
	jz LB_3970
	cmp al,32
	jz LB_3970
LB_3972:
	add r14,3
	cmp r14,r10
	jg LB_3977
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3977
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_3977
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_3977
	jmp LB_3978
LB_3977:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3974
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3974:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3975
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3975:
	jmp NS_E_3399_MTC_0_failed
LB_3978:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_3980
LB_3979:
	add r14,1
LB_3980:
	cmp r14,r10
	jge LB_3981
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3979
	cmp al,10
	jz LB_3979
	cmp al,32
	jz LB_3979
LB_3981:
	push r10
	call NS_E_3411_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3982
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3983
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3983:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3984
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3984:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3985
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3985:
	jmp NS_E_3399_MTC_0_failed
LB_3982:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3954
	btr QWORD [rdi],3
LB_3954:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3955
	btr QWORD [rdi],2
LB_3955:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3956
	btr QWORD [rdi],1
LB_3956:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3957
	btr QWORD [rdi],0
LB_3957:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3399_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_3916
LB_3915:
	add r14,1
LB_3916:
	cmp r14,r10
	jge LB_3917
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3915
	cmp al,10
	jz LB_3915
	cmp al,32
	jz LB_3915
LB_3917:
	add r14,1
	cmp r14,r10
	jg LB_3920
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_3920
	jmp LB_3921
LB_3920:
	jmp NS_E_3399_MTC_1_failed
LB_3921:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_3923
LB_3922:
	add r14,1
LB_3923:
	cmp r14,r10
	jge LB_3924
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3922
	cmp al,10
	jz LB_3922
	cmp al,32
	jz LB_3922
LB_3924:
	push r10
	call NS_E_3411_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3925
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3926
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3926:
	jmp NS_E_3399_MTC_1_failed
LB_3925:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_3929
LB_3928:
	add r14,1
LB_3929:
	cmp r14,r10
	jge LB_3930
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3928
	cmp al,10
	jz LB_3928
	cmp al,32
	jz LB_3928
LB_3930:
	add r14,3
	cmp r14,r10
	jg LB_3935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_3935
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_3935
	jmp LB_3936
LB_3935:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3932
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3932:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3933
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3933:
	jmp NS_E_3399_MTC_1_failed
LB_3936:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_3938
LB_3937:
	add r14,1
LB_3938:
	cmp r14,r10
	jge LB_3939
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3937
	cmp al,10
	jz LB_3937
	cmp al,32
	jz LB_3937
LB_3939:
	push r10
	call NS_E_3411_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3940
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3941
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3941:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3942
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3942:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3943
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3943:
	jmp NS_E_3399_MTC_1_failed
LB_3940:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; cmm_reg_ptn
	jmp LB_3946
LB_3945:
	add r14,1
LB_3946:
	cmp r14,r10
	jge LB_3947
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3945
	cmp al,10
	jz LB_3945
	cmp al,32
	jz LB_3945
LB_3947:
	push r10
	call NS_E_3401_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3948
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3949
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3949:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3950
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3950:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3951
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3951:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3952
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3952:
	jmp NS_E_3399_MTC_1_failed
LB_3948:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_3909
	btr QWORD [rdi],4
LB_3909:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3910
	btr QWORD [rdi],3
LB_3910:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3911
	btr QWORD [rdi],2
LB_3911:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3912
	btr QWORD [rdi],1
LB_3912:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3913
	btr QWORD [rdi],0
LB_3913:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,80
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3399_MTC_1_failed:
	add rsp,80
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_3897
LB_3896:
	add r14,1
LB_3897:
	cmp r14,r10
	jge LB_3898
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3896
	cmp al,10
	jz LB_3896
	cmp al,32
	jz LB_3896
LB_3898:
	add r14,3
	cmp r14,r10
	jg LB_3901
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_3901
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_3901
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_3901
	jmp LB_3902
LB_3901:
	jmp NS_E_3399_MTC_2_failed
LB_3902:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_3904
LB_3903:
	add r14,1
LB_3904:
	cmp r14,r10
	jge LB_3905
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3903
	cmp al,10
	jz LB_3903
	cmp al,32
	jz LB_3903
LB_3905:
	push r10
	call NS_E_3411_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3906
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3907
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3907:
	jmp NS_E_3399_MTC_2_failed
LB_3906:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3893
	btr QWORD [rdi],1
LB_3893:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3894
	btr QWORD [rdi],0
LB_3894:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3399_MTC_2_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3401:
NS_E_RDI_3401:
NS_E_3401_ETR_TBL:
NS_E_3401_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	jmp LB_3991
LB_3990:
	add r14,1
LB_3991:
	cmp r14,r10
	jge LB_3992
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3990
	cmp al,10
	jz LB_3990
	cmp al,32
	jz LB_3990
LB_3992:
	add r14,1
	cmp r14,r10
	jg LB_3995
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_3995
	jmp LB_3996
LB_3995:
	jmp NS_E_3401_MTC_0_failed
LB_3996:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_3998
LB_3997:
	add r14,1
LB_3998:
	cmp r14,r10
	jge LB_3999
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3997
	cmp al,10
	jz LB_3997
	cmp al,32
	jz LB_3997
LB_3999:
	push r10
	call NS_E_3411_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4000
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4001
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4001:
	jmp NS_E_3401_MTC_0_failed
LB_4000:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3987
	btr QWORD [rdi],1
LB_3987:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3988
	btr QWORD [rdi],0
LB_3988:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3401_MTC_0_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3403:
NS_E_RDI_3403:
NS_E_3403_ETR_TBL:
NS_E_3403_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_imp
	push r10
	call NS_E_3405_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4008
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3403_MTC_0_failed
LB_4008:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4003
	btr QWORD [rdi],0
LB_4003:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3403_MTC_0_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3405:
NS_E_RDI_3405:
NS_E_3405_ETR_TBL:
NS_E_3405_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_app
	jmp LB_4022
LB_4021:
	add r14,1
LB_4022:
	cmp r14,r10
	jge LB_4023
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4021
	cmp al,10
	jz LB_4021
	cmp al,32
	jz LB_4021
LB_4023:
	push r10
	call NS_E_3407_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4024
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3405_MTC_0_failed
LB_4024:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\134\146"
	jmp LB_4027
LB_4026:
	add r14,1
LB_4027:
	cmp r14,r10
	jge LB_4028
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4026
	cmp al,10
	jz LB_4026
	cmp al,32
	jz LB_4026
LB_4028:
	add r14,3
	cmp r14,r10
	jg LB_4032
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_4032
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_4032
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_4032
	jmp LB_4033
LB_4032:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4030
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4030:
	jmp NS_E_3405_MTC_0_failed
LB_4033:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_imp
	jmp LB_4035
LB_4034:
	add r14,1
LB_4035:
	cmp r14,r10
	jge LB_4036
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4034
	cmp al,10
	jz LB_4034
	cmp al,32
	jz LB_4034
LB_4036:
	push r10
	call NS_E_3405_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4037
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4038
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4038:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4039
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4039:
	jmp NS_E_3405_MTC_0_failed
LB_4037:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4017
	btr QWORD [rdi],2
LB_4017:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4018
	btr QWORD [rdi],1
LB_4018:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4019
	btr QWORD [rdi],0
LB_4019:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3405_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_4013
LB_4012:
	add r14,1
LB_4013:
	cmp r14,r10
	jge LB_4014
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4012
	cmp al,10
	jz LB_4012
	cmp al,32
	jz LB_4012
LB_4014:
	push r10
	call NS_E_3407_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4015
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3405_MTC_1_failed
LB_4015:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4010
	btr QWORD [rdi],0
LB_4010:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3405_MTC_1_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3407:
NS_E_RDI_3407:
NS_E_3407_ETR_TBL:
NS_E_3407_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_4053
LB_4052:
	add r14,1
LB_4053:
	cmp r14,r10
	jge LB_4054
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4052
	cmp al,10
	jz LB_4052
	cmp al,32
	jz LB_4052
LB_4054:
	push r10
	call NS_E_3409_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4055
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3407_MTC_0_failed
LB_4055:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\151\130"
	jmp LB_4058
LB_4057:
	add r14,1
LB_4058:
	cmp r14,r10
	jge LB_4059
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4057
	cmp al,10
	jz LB_4057
	cmp al,32
	jz LB_4057
LB_4059:
	add r14,3
	cmp r14,r10
	jg LB_4063
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_4063
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_4063
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_4063
	jmp LB_4064
LB_4063:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4061
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4061:
	jmp NS_E_3407_MTC_0_failed
LB_4064:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_atm
	jmp LB_4066
LB_4065:
	add r14,1
LB_4066:
	cmp r14,r10
	jge LB_4067
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4065
	cmp al,10
	jz LB_4065
	cmp al,32
	jz LB_4065
LB_4067:
	push r10
	call NS_E_3409_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4068
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4069
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4069:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4070
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4070:
	jmp NS_E_3407_MTC_0_failed
LB_4068:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4048
	btr QWORD [rdi],2
LB_4048:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4049
	btr QWORD [rdi],1
LB_4049:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4050
	btr QWORD [rdi],0
LB_4050:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3407_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_4044
LB_4043:
	add r14,1
LB_4044:
	cmp r14,r10
	jge LB_4045
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4043
	cmp al,10
	jz LB_4043
	cmp al,32
	jz LB_4043
LB_4045:
	push r10
	call NS_E_3409_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4046
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3407_MTC_1_failed
LB_4046:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4041
	btr QWORD [rdi],0
LB_4041:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3407_MTC_1_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3409:
NS_E_RDI_3409:
NS_E_3409_ETR_TBL:
NS_E_3409_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4077
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3409_MTC_0_failed
LB_4077:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4072
	btr QWORD [rdi],0
LB_4072:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3409_MTC_0_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3411:
NS_E_RDI_3411:
NS_E_3411_ETR_TBL:
NS_E_3411_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_4091
LB_4090:
	add r14,1
LB_4091:
	cmp r14,r10
	jge LB_4092
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4090
	cmp al,10
	jz LB_4090
	cmp al,32
	jz LB_4090
LB_4092:
	add r14,1
	cmp r14,r10
	jg LB_4095
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_4095
	jmp LB_4096
LB_4095:
	jmp NS_E_3411_MTC_0_failed
LB_4096:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_4098
LB_4097:
	add r14,1
LB_4098:
	cmp r14,r10
	jge LB_4099
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4097
	cmp al,10
	jz LB_4097
	cmp al,32
	jz LB_4097
LB_4099:
	push r10
	call NS_E_3413_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4100
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4101
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4101:
	jmp NS_E_3411_MTC_0_failed
LB_4100:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_4104
LB_4103:
	add r14,1
LB_4104:
	cmp r14,r10
	jge LB_4105
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4103
	cmp al,10
	jz LB_4103
	cmp al,32
	jz LB_4103
LB_4105:
	add r14,1
	cmp r14,r10
	jg LB_4110
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_4110
	jmp LB_4111
LB_4110:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4107
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4107:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4108
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4108:
	jmp NS_E_3411_MTC_0_failed
LB_4111:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4086
	btr QWORD [rdi],2
LB_4086:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4087
	btr QWORD [rdi],1
LB_4087:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4088
	btr QWORD [rdi],0
LB_4088:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3411_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_4082
LB_4081:
	add r14,1
LB_4082:
	cmp r14,r10
	jge LB_4083
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4081
	cmp al,10
	jz LB_4081
	cmp al,32
	jz LB_4081
LB_4083:
	push r10
	call NS_E_3415_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4084
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3411_MTC_1_failed
LB_4084:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4079
	btr QWORD [rdi],0
LB_4079:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3411_MTC_1_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3413:
NS_E_RDI_3413:
NS_E_3413_ETR_TBL:
NS_E_3413_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg
	jmp LB_4117
LB_4116:
	add r14,1
LB_4117:
	cmp r14,r10
	jge LB_4118
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4116
	cmp al,10
	jz LB_4116
	cmp al,32
	jz LB_4116
LB_4118:
	push r10
	call NS_E_3415_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4119
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3413_MTC_0_failed
LB_4119:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn_lst
	jmp LB_4122
LB_4121:
	add r14,1
LB_4122:
	cmp r14,r10
	jge LB_4123
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4121
	cmp al,10
	jz LB_4121
	cmp al,32
	jz LB_4121
LB_4123:
	push r10
	call NS_E_3413_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4124
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4125
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4125:
	jmp NS_E_3413_MTC_0_failed
LB_4124:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4113
	btr QWORD [rdi],1
LB_4113:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4114
	btr QWORD [rdi],0
LB_4114:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3413_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3413_MTC_1_failed:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3415:
NS_E_RDI_3415:
NS_E_3415_ETR_TBL:
NS_E_3415_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_4151
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_4151
	jmp LB_4152
LB_4151:
	jmp NS_E_3415_MTC_0_failed
LB_4152:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4156
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4157
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4157:
	jmp NS_E_3415_MTC_0_failed
LB_4156:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4143
	btr QWORD [rdi],1
LB_4143:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4144
	btr QWORD [rdi],0
LB_4144:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3415_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_4139
LB_4138:
	add r14,1
LB_4139:
	cmp r14,r10
	jge LB_4140
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4138
	cmp al,10
	jz LB_4138
	cmp al,32
	jz LB_4138
LB_4140:
	push r10
	call NS_E_2569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4141
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3415_MTC_1_failed
LB_4141:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4136
	btr QWORD [rdi],0
LB_4136:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3415_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_4134
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_4134
	jmp LB_4135
LB_4134:
	jmp NS_E_3415_MTC_2_failed
LB_4135:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4127
	btr QWORD [rdi],0
LB_4127:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3415_MTC_2_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4171:
NS_E_RDI_4171:
; 	» "OpADL.mdls" _ ⊢ 0' : %_4159
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f20 %_4159 ⊢ { %_4160 %_4161 } : { %_4160 %_4161 }
 ; {>  %_4159~0':_stg }
; _f20 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 %_4161 ⊢ %_4162 : %_4162
 ; {>  %_4160~0':_stg %_4161~1':_stg }
; _f21 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_4174
	btr r12,0
	jmp LB_4175
LB_4174:
	bts r12,0
LB_4175:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4176
	btr r12,1
	jmp LB_4177
LB_4176:
	bts r12,1
LB_4177:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4172
	btr r12,0
	jmp LB_4173
LB_4172:
	bts r12,0
LB_4173:
	add rsp,16
; » 0xr0 |~ {  } ⊢ %_4163 : %_4163
 ; {>  %_4160~0':_stg %_4162~1':_stg }
; 	» 0xr0 _ ⊢ 2' : %_4163
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _f2762 { %_4162 %_4163 } ⊢ { %_4164 %_4165 %_4166 } : { %_4164 %_4165 %_4166 }
 ; {>  %_4160~0':_stg %_4162~1':_stg %_4163~2':_r64 }
; _f2762 { 1' 2' } ⊢ { 1' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_4180
	btr r12,0
	jmp LB_4181
LB_4180:
	bts r12,0
LB_4181:
	mov r14,r8
	bt r12,2
	jc LB_4182
	btr r12,1
	jmp LB_4183
LB_4182:
	bts r12,1
LB_4183:
	call NS_E_2762
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 1' 2' 3' }
	mov r10,r9
	bt r12,3
	jc LB_4184
	btr r12,4
	jmp LB_4185
LB_4184:
	bts r12,4
LB_4185:
	mov r9,r10
	bt r12,4
	jc LB_4188
	btr r12,3
	jmp LB_4189
LB_4188:
	bts r12,3
LB_4189:
	mov rsi,1
	bt r12,3
	jc LB_4186
	mov rsi,0
	bt r9,0
	jc LB_4186
	jmp LB_4187
LB_4186:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_4187:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
	mov r8,r14
	bt r12,1
	jc LB_4190
	btr r12,2
	jmp LB_4191
LB_4190:
	bts r12,2
LB_4191:
	mov r14,r13
	bt r12,0
	jc LB_4192
	btr r12,1
	jmp LB_4193
LB_4192:
	bts r12,1
LB_4193:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4178
	btr r12,0
	jmp LB_4179
LB_4178:
	bts r12,0
LB_4179:
	add rsp,16
; _f21 %_4166 ⊢ %_4167 : %_4167
 ; {>  %_4160~0':_stg %_4165~2':_r64 %_4166~3':(_opn)◂({ _r64 (_lst)◂(_p2759) }) %_4164~1':_stg }
; _f21 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_4200
	btr r12,0
	jmp LB_4201
LB_4200:
	bts r12,0
LB_4201:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_4202
	btr r12,3
	jmp LB_4203
LB_4202:
	bts r12,3
LB_4203:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_4198
	btr r12,2
	jmp LB_4199
LB_4198:
	bts r12,2
LB_4199:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4196
	btr r12,1
	jmp LB_4197
LB_4196:
	bts r12,1
LB_4197:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4194
	btr r12,0
	jmp LB_4195
LB_4194:
	bts r12,0
LB_4195:
	add rsp,32
; _f3299 %_4164 ⊢ { %_4168 %_4169 } : { %_4168 %_4169 }
 ; {>  %_4167~3':(_opn)◂({ _r64 (_lst)◂(_p2759) }) %_4160~0':_stg %_4165~2':_r64 %_4164~1':_stg }
; _f3299 1' ⊢ { 1' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_4210
	btr r12,0
	jmp LB_4211
LB_4210:
	bts r12,0
LB_4211:
	call NS_E_3299
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 4' }
	mov r10,r14
	bt r12,1
	jc LB_4212
	btr r12,4
	jmp LB_4213
LB_4212:
	bts r12,4
LB_4213:
	mov r14,r13
	bt r12,0
	jc LB_4214
	btr r12,1
	jmp LB_4215
LB_4214:
	bts r12,1
LB_4215:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_4208
	btr r12,3
	jmp LB_4209
LB_4208:
	bts r12,3
LB_4209:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_4206
	btr r12,2
	jmp LB_4207
LB_4206:
	bts r12,2
LB_4207:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4204
	btr r12,0
	jmp LB_4205
LB_4204:
	bts r12,0
LB_4205:
	add rsp,32
; _f21 %_4169 ⊢ %_4170 : %_4170
 ; {>  %_4167~3':(_opn)◂({ _r64 (_lst)◂(_p2759) }) %_4160~0':_stg %_4165~2':_r64 %_4169~4':(_opn)◂(_stg) %_4168~1':_stg }
; _f21 4' ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_4224
	btr r12,0
	jmp LB_4225
LB_4224:
	bts r12,0
LB_4225:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_4226
	btr r12,4
	jmp LB_4227
LB_4226:
	bts r12,4
LB_4227:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_4222
	btr r12,3
	jmp LB_4223
LB_4222:
	bts r12,3
LB_4223:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_4220
	btr r12,2
	jmp LB_4221
LB_4220:
	bts r12,2
LB_4221:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4218
	btr r12,1
	jmp LB_4219
LB_4218:
	bts r12,1
LB_4219:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4216
	btr r12,0
	jmp LB_4217
LB_4216:
	bts r12,0
LB_4217:
	add rsp,40
; ∎ {  }
 ; {>  %_4167~3':(_opn)◂({ _r64 (_lst)◂(_p2759) }) %_4160~0':_stg %_4165~2':_r64 %_4170~4':(_opn)◂(_stg) %_4168~1':_stg }
; 	∎ {  }
	bt r12,3
	jc LB_4228
	mov rdi,r9
	call dlt
LB_4228:
	bt r12,0
	jc LB_4229
	mov rdi,r13
	call dlt
LB_4229:
	bt r12,2
	jc LB_4230
	mov rdi,r8
	call dlt
LB_4230:
	bt r12,4
	jc LB_4231
	mov rdi,r10
	call dlt
LB_4231:
	bt r12,1
	jc LB_4232
	mov rdi,r14
	call dlt
LB_4232:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_2142:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2142
	NS_E_DYN_2145:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2145
	NS_E_DYN_2146:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2146
	NS_E_DYN_2147:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2147
	NS_E_DYN_2148:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2148
	NS_E_DYN_2162:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2162
	NS_E_DYN_2205:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2205
	NS_E_DYN_2215:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2215
	NS_E_DYN_2216:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2216
	NS_E_DYN_2217:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2217
	NS_E_DYN_2426:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2426
	NS_E_DYN_2464:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2464
	NS_E_DYN_2502:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2502
	NS_E_DYN_2540:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2540
	NS_E_DYN_2569:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2569
	NS_E_DYN_2570:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2570
	NS_E_DYN_2571:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2571
	NS_E_DYN_2704:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2704
	NS_E_DYN_2750:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2749:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2749
	NS_E_DYN_2760:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2761:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2762:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2762
	NS_E_DYN_2763:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2763
	NS_E_DYN_2764:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2764
	NS_E_DYN_3198:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3198
	NS_E_DYN_3299:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3299
	CST_DYN_3363:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_3416:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3417:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_3387:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3387
	NS_E_DYN_3418:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3419:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_3420:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_3421:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_3422:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_3423:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 5
	NS_E_DYN_3424:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 6
	NS_E_DYN_3389:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3389
	NS_E_DYN_3425:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3426:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_3427:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_3391:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3391
	NS_E_DYN_3428:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3429:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_3430:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_3431:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_3393:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3393
	NS_E_DYN_3432:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3395:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3395
	NS_E_DYN_3433:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3434:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_3397:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3397
	NS_E_DYN_3435:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3436:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_3437:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_3399:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3399
	NS_E_DYN_3438:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3401:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3401
	NS_E_DYN_3439:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3403:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3403
	NS_E_DYN_3440:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3441:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_3405:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3405
	NS_E_DYN_3442:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3443:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_3407:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3407
	NS_E_DYN_3444:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3409:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3409
	NS_E_DYN_3445:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3446:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_3411:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3411
	NS_E_DYN_3447:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3448:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_3413:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3413
	NS_E_DYN_3449:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3450:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_3451:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_3415:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3415
	CST_DYN_4171:
		dq 0x0000_0001_00_82_ffff
		dq 1
