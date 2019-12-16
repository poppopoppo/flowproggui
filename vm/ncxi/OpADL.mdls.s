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
	call NS_E_48835
	call NS_E_53344
	call exec_out
	jmp _end
NS_E_ID_24: dq 0
NS_E_24:
NS_E_RDI_24:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_26: dq 0
NS_E_26:
NS_E_RDI_26:
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
NS_E_47088:
NS_E_RDI_47088:
NS_E_47088_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_47089
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_47089:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_47091:
NS_E_RDI_47091:
NS_E_47091_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_47091_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_47091_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_47092:
NS_E_RDI_47092:
NS_E_47092_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_47092_LB_0
	cmp r11,57
	ja NS_E_47092_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_47092_LB_0:
	mov rax,0
	ret
NS_E_47094:
NS_E_RDI_47094:
NS_E_47094_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_47094_LB_0
	cmp r11,122
	ja NS_E_47094_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_47094_LB_0:
	mov rax,0
	ret
NS_E_47093:
NS_E_RDI_47093:
NS_E_47093_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_47093_LB_0
	cmp r11,90
	ja NS_E_47093_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_47093_LB_0:
	mov rax,0
	ret
NS_E_33:
	mov rdi,r13
	bt r12,0
NS_E_RDI_33:
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
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
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
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
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
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_25: dq 0
NS_E_25:
NS_E_RDI_25:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_47090:
NS_E_RDI_47090:
NS_E_47090_ETR_TBL:
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
	jz NS_E_47090_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_47090_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_47101:
; 	|» { 0' 1' }
NS_E_RDI_47101:
MTC_LB_47102:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_47103
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
	jnc LB_47104
	bt QWORD [rax],0
	jc LB_47105
	btr r12,2
	jmp LB_47106
LB_47105:
	bts r12,2
LB_47106:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_47104:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_47107:
	cmp r15,0
	jz LB_47108
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47107
LB_47108:
; ∎ %_47095
 ; {>  %_47095~0':(_lst)◂(t15459'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_47103:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_47109
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
	jnc LB_47110
	bt QWORD [rax],0
	jc LB_47111
	btr r12,4
	jmp LB_47112
LB_47111:
	bts r12,4
LB_47112:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_47110:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_47115
	btr r12,5
	jmp LB_47116
LB_47115:
	bts r12,5
LB_47116:
	mov r8,r11
	bt r12,5
	jc LB_47113
	btr r12,2
	jmp LB_47114
LB_47113:
	bts r12,2
LB_47114:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_47119
	btr r12,5
	jmp LB_47120
LB_47119:
	bts r12,5
LB_47120:
	mov r9,r11
	bt r12,5
	jc LB_47117
	btr r12,3
	jmp LB_47118
LB_47117:
	bts r12,3
LB_47118:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_47121:
	cmp r15,0
	jz LB_47122
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47121
LB_47122:
; _cns { %_47097 %_47095 } ⊢ %_47099 : %_47099
 ; {>  %_47097~2':t15459'(-1) %_47095~0':(_lst)◂(t15459'(-1)) %_47098~3':(_lst)◂(t15459'(-1)) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f47101 { %_47099 %_47098 } ⊢ %_47100 : %_47100
 ; {>  %_47099~°0◂{ 2' 0' }:(_lst)◂(t15459'(-1)) %_47098~3':(_lst)◂(t15459'(-1)) }
; _f47101 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_47123
	btr r12,1
	jmp LB_47124
LB_47123:
	bts r12,1
LB_47124:
	mov r9,r13
	bt r12,0
	jc LB_47125
	btr r12,3
	jmp LB_47126
LB_47125:
	bts r12,3
LB_47126:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_47131
	btr r12,4
	jmp LB_47132
LB_47131:
	bts r12,4
LB_47132:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_47129
	btr QWORD [rdi],0
	jmp LB_47130
LB_47129:
	bts QWORD [rdi],0
LB_47130:
	mov r10,r9
	bt r12,3
	jc LB_47135
	btr r12,4
	jmp LB_47136
LB_47135:
	bts r12,4
LB_47136:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_47133
	btr QWORD [rdi],1
	jmp LB_47134
LB_47133:
	bts QWORD [rdi],1
LB_47134:
	mov rsi,1
	bt r12,0
	jc LB_47127
	mov rsi,0
	bt r13,0
	jc LB_47127
	jmp LB_47128
LB_47127:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_47128:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_47101
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_47100
 ; {>  %_47100~0':(_lst)◂(t15459'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_47109:
NS_E_47140:
; 	|» 0'
NS_E_RDI_47140:
; _nil {  } ⊢ %_47138 : %_47138
 ; {>  %_47137~0':(_lst)◂(t15480'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f47101 { %_47138 %_47137 } ⊢ %_47139 : %_47139
 ; {>  %_47138~°1◂{  }:(_lst)◂(t15477'(0)) %_47137~0':(_lst)◂(t15480'(-1)) }
; _f47101 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_47141
	btr r12,1
	jmp LB_47142
LB_47141:
	bts r12,1
LB_47142:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_47143
	mov rsi,0
	bt r13,0
	jc LB_47143
	jmp LB_47144
LB_47143:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_47144:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_47101
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_47139
 ; {>  %_47139~0':(_lst)◂(t15480'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_47158:
; 	|» { 0' 1' }
NS_E_RDI_47158:
MTC_LB_47159:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_47160
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
	jnc LB_47161
	bt QWORD [rax],0
	jc LB_47162
	btr r12,4
	jmp LB_47163
LB_47162:
	bts r12,4
LB_47163:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_47161:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_47166
	btr r12,5
	jmp LB_47167
LB_47166:
	bts r12,5
LB_47167:
	mov r8,r11
	bt r12,5
	jc LB_47164
	btr r12,2
	jmp LB_47165
LB_47164:
	bts r12,2
LB_47165:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_47170
	btr r12,5
	jmp LB_47171
LB_47170:
	bts r12,5
LB_47171:
	mov r9,r11
	bt r12,5
	jc LB_47168
	btr r12,3
	jmp LB_47169
LB_47168:
	bts r12,3
LB_47169:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_47172:
	cmp r15,0
	jz LB_47173
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47172
LB_47173:
; _f44 %_47145 ⊢ %_47149 : %_47149
 ; {>  %_47147~2':_r64 %_47148~3':(_lst)◂(_r64) %_47145~0':_r64 }
	add r13,1
; _f47158 { %_47149 %_47148 } ⊢ { %_47150 %_47151 } : { %_47150 %_47151 }
 ; {>  %_47149~0':_r64 %_47147~2':_r64 %_47148~3':(_lst)◂(_r64) }
; _f47158 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_47176
	btr r12,1
	jmp LB_47177
LB_47176:
	bts r12,1
LB_47177:
	call NS_E_47158
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_47174
	btr r12,2
	jmp LB_47175
LB_47174:
	bts r12,2
LB_47175:
	add rsp,16
; _f43 %_47150 ⊢ %_47152 : %_47152
 ; {>  %_47150~0':_r64 %_47147~2':_r64 %_47151~1':_stg }
	sub r13,1
; _f21 { %_47151 %_47152 %_47147 } ⊢ { %_47153 %_47154 %_47155 } : { %_47153 %_47154 %_47155 }
 ; {>  %_47147~2':_r64 %_47151~1':_stg %_47152~0':_r64 }
; _f21 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_47178
	btr r12,3
	jmp LB_47179
LB_47178:
	bts r12,3
LB_47179:
	mov r14,r13
	bt r12,0
	jc LB_47180
	btr r12,1
	jmp LB_47181
LB_47180:
	bts r12,1
LB_47181:
	mov r13,r9
	bt r12,3
	jc LB_47182
	btr r12,0
	jmp LB_47183
LB_47182:
	bts r12,0
LB_47183:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_47154 %_47153 }
 ; {>  %_47155~2':_r64 %_47153~0':_stg %_47154~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_47184
	mov rdi,r8
	call dlt
LB_47184:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_47185
	btr r12,2
	jmp LB_47186
LB_47185:
	bts r12,2
LB_47186:
	mov r14,r13
	bt r12,0
	jc LB_47187
	btr r12,1
	jmp LB_47188
LB_47187:
	bts r12,1
LB_47188:
	mov r13,r8
	bt r12,2
	jc LB_47189
	btr r12,0
	jmp LB_47190
LB_47189:
	bts r12,0
LB_47190:
	ret
MTC_LB_47160:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_47191
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
	jnc LB_47192
	bt QWORD [rax],0
	jc LB_47193
	btr r12,2
	jmp LB_47194
LB_47193:
	bts r12,2
LB_47194:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_47192:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_47195:
	cmp r15,0
	jz LB_47196
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47195
LB_47196:
; _f19 %_47145 ⊢ { %_47156 %_47157 } : { %_47156 %_47157 }
 ; {>  %_47145~0':_r64 }
; _f19 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_47156 %_47157 }
 ; {>  %_47157~1':_stg %_47156~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_47191:
NS_E_47201:
; 	|» 0'
NS_E_RDI_47201:
; » 0xr0 |~ {  } ⊢ %_47198 : %_47198
 ; {>  %_47197~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_47198
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f47158 { %_47198 %_47197 } ⊢ { %_47199 %_47200 } : { %_47199 %_47200 }
 ; {>  %_47198~1':_r64 %_47197~0':(_lst)◂(_r64) }
; _f47158 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_47202
	btr r12,2
	jmp LB_47203
LB_47202:
	bts r12,2
LB_47203:
	mov r14,r13
	bt r12,0
	jc LB_47204
	btr r12,1
	jmp LB_47205
LB_47204:
	bts r12,1
LB_47205:
	mov r13,r8
	bt r12,2
	jc LB_47206
	btr r12,0
	jmp LB_47207
LB_47206:
	bts r12,0
LB_47207:
	call NS_E_47158
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_47200
 ; {>  %_47200~1':_stg %_47199~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_47208
	mov rdi,r13
	call dlt
LB_47208:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_47209
	btr r12,0
	jmp LB_47210
LB_47209:
	bts r12,0
LB_47210:
	ret
NS_E_47211:
NS_E_RDI_47211:
NS_E_47211_ETR_TBL:
NS_E_47211_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_47252
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_47252
	jmp LB_47253
LB_47252:
	jmp LB_47242
LB_47253:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_47212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47257
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47258
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47258:
	jmp LB_47242
LB_47257:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47245
	btr r12,1
	jmp LB_47246
LB_47245:
	bts r12,1
LB_47246:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47243
	btr r12,0
	jmp LB_47244
LB_47243:
	bts r12,0
LB_47244:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47239
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_47260
	btr r12,2
	jmp LB_47261
LB_47260:
	bts r12,2
LB_47261:
	mov r13,r14
	bt r12,1
	jc LB_47262
	btr r12,0
	jmp LB_47263
LB_47262:
	bts r12,0
LB_47263:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47201 %_47214 ⊢ %_47215 : %_47215
 ; {>  %_47214~0':(_lst)◂(_r64) }
; _f47201 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_47201
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_47215 ⊢ %_47216 : %_47216
 ; {>  %_47215~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_47216
 ; {>  %_47216~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47237
	btr r12,3
	jmp LB_47238
LB_47237:
	bts r12,3
LB_47238:
	mov r8,0
	bts r12,2
	ret
LB_47239:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47241
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47240
LB_47241:
	add rsp,8
	ret
LB_47242:
	add rsp,32
	pop r14
LB_47240:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_47212:
NS_E_RDI_47212:
NS_E_47212_ETR_TBL:
NS_E_47212_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_47289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_47289
	jmp LB_47290
LB_47289:
	jmp LB_47277
LB_47290:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_47213_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47294
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47295
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47295:
	jmp LB_47277
LB_47294:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_47212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47300
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_47301
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_47301:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47302
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47302:
	jmp LB_47277
LB_47300:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_47282
	btr r12,2
	jmp LB_47283
LB_47282:
	bts r12,2
LB_47283:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47280
	btr r12,1
	jmp LB_47281
LB_47280:
	bts r12,1
LB_47281:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47278
	btr r12,0
	jmp LB_47279
LB_47278:
	bts r12,0
LB_47279:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_47274
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_47304
	btr r12,3
	jmp LB_47305
LB_47304:
	bts r12,3
LB_47305:
	mov r14,r8
	bt r12,2
	jc LB_47306
	btr r12,1
	jmp LB_47307
LB_47306:
	bts r12,1
LB_47307:
	mov r8,r13
	bt r12,0
	jc LB_47308
	btr r12,2
	jmp LB_47309
LB_47308:
	bts r12,2
LB_47309:
	mov r13,r9
	bt r12,3
	jc LB_47310
	btr r12,0
	jmp LB_47311
LB_47310:
	bts r12,0
LB_47311:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_47217 %_47218 } ⊢ %_47219 : %_47219
 ; {>  %_47217~0':_r64 %_47218~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_47219 ⊢ %_47220 : %_47220
 ; {>  %_47219~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_47220
 ; {>  %_47220~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_47268
	btr r12,2
	jmp LB_47269
LB_47268:
	bts r12,2
LB_47269:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_47266
	btr QWORD [rdi],0
	jmp LB_47267
LB_47266:
	bts QWORD [rdi],0
LB_47267:
	mov r8,r14
	bt r12,1
	jc LB_47272
	btr r12,2
	jmp LB_47273
LB_47272:
	bts r12,2
LB_47273:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_47270
	btr QWORD [rdi],1
	jmp LB_47271
LB_47270:
	bts QWORD [rdi],1
LB_47271:
	mov rsi,1
	bt r12,3
	jc LB_47264
	mov rsi,0
	bt r9,0
	jc LB_47264
	jmp LB_47265
LB_47264:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47265:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47274:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47276
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47275
LB_47276:
	add rsp,8
	ret
LB_47277:
	add rsp,48
	pop r14
LB_47275:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_47325
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_47325
	jmp LB_47326
LB_47325:
	jmp LB_47317
LB_47326:
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
	jc LB_47318
	btr r12,0
	jmp LB_47319
LB_47318:
	bts r12,0
LB_47319:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47314
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_47221 : %_47221
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_47221 ⊢ %_47222 : %_47222
 ; {>  %_47221~°1◂{  }:(_lst)◂(t15538'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_47222
 ; {>  %_47222~°0◂°1◂{  }:(_opn)◂((_lst)◂(t15541'(0))) }
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
	jc LB_47312
	mov rsi,0
	bt r9,0
	jc LB_47312
	jmp LB_47313
LB_47312:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47313:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47314:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47316
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47315
LB_47316:
	add rsp,8
	ret
LB_47317:
	add rsp,16
	pop r14
LB_47315:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_47088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47348
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47340
LB_47348:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_47212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47353
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47354
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47354:
	jmp LB_47340
LB_47353:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47343
	btr r12,1
	jmp LB_47344
LB_47343:
	bts r12,1
LB_47344:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47341
	btr r12,0
	jmp LB_47342
LB_47341:
	bts r12,0
LB_47342:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47337
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_47223 %_47224 } ⊢ %_47225 : %_47225
 ; {>  %_47224~1':(_lst)◂(_r64) %_47223~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_47225 ⊢ %_47226 : %_47226
 ; {>  %_47225~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_47226
 ; {>  %_47226~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_47331
	btr r12,2
	jmp LB_47332
LB_47331:
	bts r12,2
LB_47332:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_47329
	btr QWORD [rdi],0
	jmp LB_47330
LB_47329:
	bts QWORD [rdi],0
LB_47330:
	mov r8,r14
	bt r12,1
	jc LB_47335
	btr r12,2
	jmp LB_47336
LB_47335:
	bts r12,2
LB_47336:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_47333
	btr QWORD [rdi],1
	jmp LB_47334
LB_47333:
	bts QWORD [rdi],1
LB_47334:
	mov rsi,1
	bt r12,3
	jc LB_47327
	mov rsi,0
	bt r9,0
	jc LB_47327
	jmp LB_47328
LB_47327:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47328:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47337:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47339
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47338
LB_47339:
	add rsp,8
	ret
LB_47340:
	add rsp,32
	pop r14
LB_47338:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_47213:
NS_E_RDI_47213:
NS_E_47213_ETR_TBL:
NS_E_47213_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_47369
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_47369
	jmp LB_47370
LB_47369:
	jmp LB_47361
LB_47370:
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
	jc LB_47362
	btr r12,0
	jmp LB_47363
LB_47362:
	bts r12,0
LB_47363:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47358
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_47227 : %_47227
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_47227
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_47227 ⊢ %_47228 : %_47228
 ; {>  %_47227~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47228
 ; {>  %_47228~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47356
	btr r12,3
	jmp LB_47357
LB_47356:
	bts r12,3
LB_47357:
	mov r8,0
	bts r12,2
	ret
LB_47358:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47360
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47359
LB_47360:
	add rsp,8
	ret
LB_47361:
	add rsp,16
	pop r14
LB_47359:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_47384
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_47384
	jmp LB_47385
LB_47384:
	jmp LB_47376
LB_47385:
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
	jc LB_47377
	btr r12,0
	jmp LB_47378
LB_47377:
	bts r12,0
LB_47378:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47373
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_47229 : %_47229
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_47229
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_47229 ⊢ %_47230 : %_47230
 ; {>  %_47229~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47230
 ; {>  %_47230~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47371
	btr r12,3
	jmp LB_47372
LB_47371:
	bts r12,3
LB_47372:
	mov r8,0
	bts r12,2
	ret
LB_47373:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47375
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47374
LB_47375:
	add rsp,8
	ret
LB_47376:
	add rsp,16
	pop r14
LB_47374:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_47399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_47399
	jmp LB_47400
LB_47399:
	jmp LB_47391
LB_47400:
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
	jc LB_47392
	btr r12,0
	jmp LB_47393
LB_47392:
	bts r12,0
LB_47393:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47388
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_47231 : %_47231
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_47231
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_47231 ⊢ %_47232 : %_47232
 ; {>  %_47231~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47232
 ; {>  %_47232~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47386
	btr r12,3
	jmp LB_47387
LB_47386:
	bts r12,3
LB_47387:
	mov r8,0
	bts r12,2
	ret
LB_47388:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47390
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47389
LB_47390:
	add rsp,8
	ret
LB_47391:
	add rsp,16
	pop r14
LB_47389:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_47414
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_47414
	jmp LB_47415
LB_47414:
	jmp LB_47406
LB_47415:
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
	jc LB_47407
	btr r12,0
	jmp LB_47408
LB_47407:
	bts r12,0
LB_47408:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47403
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_47233 : %_47233
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_47233
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_47233 ⊢ %_47234 : %_47234
 ; {>  %_47233~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47234
 ; {>  %_47234~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47401
	btr r12,3
	jmp LB_47402
LB_47401:
	bts r12,3
LB_47402:
	mov r8,0
	bts r12,2
	ret
LB_47403:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47405
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47404
LB_47405:
	add rsp,8
	ret
LB_47406:
	add rsp,16
	pop r14
LB_47404:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_47429
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_47429
	jmp LB_47430
LB_47429:
	jmp LB_47421
LB_47430:
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
	jc LB_47422
	btr r12,0
	jmp LB_47423
LB_47422:
	bts r12,0
LB_47423:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47418
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_47235 : %_47235
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_47235
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_47235 ⊢ %_47236 : %_47236
 ; {>  %_47235~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47236
 ; {>  %_47236~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47416
	btr r12,3
	jmp LB_47417
LB_47416:
	bts r12,3
LB_47417:
	mov r8,0
	bts r12,2
	ret
LB_47418:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47420
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47419
LB_47420:
	add rsp,8
	ret
LB_47421:
	add rsp,16
	pop r14
LB_47419:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_47431:
NS_E_RDI_47431:
NS_E_47431_ETR_TBL:
NS_E_47431_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_47088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47468
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47462
LB_47468:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47463
	btr r12,0
	jmp LB_47464
LB_47463:
	bts r12,0
LB_47464:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47459
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_47433 : %_47433
 ; {>  %_47432~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_47433
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_47434 : %_47434
 ; {>  %_47433~1':_r64 %_47432~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_47434
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f38 { %_47432 %_47433 } ⊢ { %_47435 %_47436 %_47437 } : { %_47435 %_47436 %_47437 }
 ; {>  %_47433~1':_r64 %_47432~0':_r64 %_47434~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_47434 %_47435 } ⊢ { %_47438 %_47439 %_47440 } : { %_47438 %_47439 %_47440 }
 ; {>  %_47437~3':_r64 %_47436~1':_r64 %_47435~0':_r64 %_47434~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_47443:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_47444
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_47444
LB_47445:
	cmp r15,0
	jz LB_47446
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47445
LB_47446:
; _some %_47439 ⊢ %_47441 : %_47441
 ; {>  %_47436~1':_r64 %_47438~2':_r64 %_47439~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47441
 ; {>  %_47441~°0◂0':(_opn)◂(_r64) %_47436~1':_r64 %_47438~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_47447
	mov rdi,r14
	call dlt
LB_47447:
	bt r12,2
	jc LB_47448
	mov rdi,r8
	call dlt
LB_47448:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47449
	btr r12,3
	jmp LB_47450
LB_47449:
	bts r12,3
LB_47450:
	mov r8,0
	bts r12,2
	ret
MTC_LB_47444:
	mov r15,0
LB_47452:
	cmp r15,0
	jz LB_47453
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47452
LB_47453:
; _none {  } ⊢ %_47442 : %_47442
 ; {>  %_47437~3':_r64 %_47440~4':_r64 %_47436~1':_r64 %_47438~2':_r64 %_47439~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_47442
 ; {>  %_47437~3':_r64 %_47442~°1◂{  }:(_opn)◂(t15617'(0)) %_47440~4':_r64 %_47436~1':_r64 %_47438~2':_r64 %_47439~0':_r64 }
; 	∎ °1◂{  }
	bt r12,3
	jc LB_47454
	mov rdi,r9
	call dlt
LB_47454:
	bt r12,4
	jc LB_47455
	mov rdi,r10
	call dlt
LB_47455:
	bt r12,1
	jc LB_47456
	mov rdi,r14
	call dlt
LB_47456:
	bt r12,2
	jc LB_47457
	mov rdi,r8
	call dlt
LB_47457:
	bt r12,0
	jc LB_47458
	mov rdi,r13
	call dlt
LB_47458:
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
MTC_LB_47451:
LB_47459:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47461
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47460
LB_47461:
	add rsp,8
	ret
LB_47462:
	add rsp,16
	pop r14
LB_47460:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_47470:
NS_E_RDI_47470:
NS_E_47470_ETR_TBL:
NS_E_47470_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_47088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47507
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47501
LB_47507:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47502
	btr r12,0
	jmp LB_47503
LB_47502:
	bts r12,0
LB_47503:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47498
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_47472 : %_47472
 ; {>  %_47471~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_47472
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_47473 : %_47473
 ; {>  %_47471~0':_r64 %_47472~1':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_47473
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f38 { %_47471 %_47472 } ⊢ { %_47474 %_47475 %_47476 } : { %_47474 %_47475 %_47476 }
 ; {>  %_47471~0':_r64 %_47472~1':_r64 %_47473~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_47473 %_47474 } ⊢ { %_47477 %_47478 %_47479 } : { %_47477 %_47478 %_47479 }
 ; {>  %_47475~1':_r64 %_47474~0':_r64 %_47473~2':_r64 %_47476~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_47482:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_47483
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_47483
LB_47484:
	cmp r15,0
	jz LB_47485
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47484
LB_47485:
; _some %_47478 ⊢ %_47480 : %_47480
 ; {>  %_47475~1':_r64 %_47478~0':_r64 %_47477~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47480
 ; {>  %_47475~1':_r64 %_47480~°0◂0':(_opn)◂(_r64) %_47477~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_47486
	mov rdi,r14
	call dlt
LB_47486:
	bt r12,2
	jc LB_47487
	mov rdi,r8
	call dlt
LB_47487:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47488
	btr r12,3
	jmp LB_47489
LB_47488:
	bts r12,3
LB_47489:
	mov r8,0
	bts r12,2
	ret
MTC_LB_47483:
	mov r15,0
LB_47491:
	cmp r15,0
	jz LB_47492
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47491
LB_47492:
; _none {  } ⊢ %_47481 : %_47481
 ; {>  %_47479~4':_r64 %_47475~1':_r64 %_47478~0':_r64 %_47477~2':_r64 %_47476~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_47481
 ; {>  %_47479~4':_r64 %_47475~1':_r64 %_47478~0':_r64 %_47477~2':_r64 %_47481~°1◂{  }:(_opn)◂(t15644'(0)) %_47476~3':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_47493
	mov rdi,r10
	call dlt
LB_47493:
	bt r12,1
	jc LB_47494
	mov rdi,r14
	call dlt
LB_47494:
	bt r12,0
	jc LB_47495
	mov rdi,r13
	call dlt
LB_47495:
	bt r12,2
	jc LB_47496
	mov rdi,r8
	call dlt
LB_47496:
	bt r12,3
	jc LB_47497
	mov rdi,r9
	call dlt
LB_47497:
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
MTC_LB_47490:
LB_47498:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47500
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47499
LB_47500:
	add rsp,8
	ret
LB_47501:
	add rsp,16
	pop r14
LB_47499:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_47509:
NS_E_RDI_47509:
NS_E_47509_ETR_TBL:
NS_E_47509_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_47088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47546
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47540
LB_47546:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47541
	btr r12,0
	jmp LB_47542
LB_47541:
	bts r12,0
LB_47542:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47537
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_47511 : %_47511
 ; {>  %_47510~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_47511
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_47512 : %_47512
 ; {>  %_47510~0':_r64 %_47511~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_47512
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f38 { %_47510 %_47511 } ⊢ { %_47513 %_47514 %_47515 } : { %_47513 %_47514 %_47515 }
 ; {>  %_47512~2':_r64 %_47510~0':_r64 %_47511~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_47512 %_47513 } ⊢ { %_47516 %_47517 %_47518 } : { %_47516 %_47517 %_47518 }
 ; {>  %_47512~2':_r64 %_47515~3':_r64 %_47514~1':_r64 %_47513~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_47521:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_47522
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_47522
LB_47523:
	cmp r15,0
	jz LB_47524
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47523
LB_47524:
; _some %_47517 ⊢ %_47519 : %_47519
 ; {>  %_47517~0':_r64 %_47514~1':_r64 %_47516~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47519
 ; {>  %_47514~1':_r64 %_47519~°0◂0':(_opn)◂(_r64) %_47516~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_47525
	mov rdi,r14
	call dlt
LB_47525:
	bt r12,2
	jc LB_47526
	mov rdi,r8
	call dlt
LB_47526:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47527
	btr r12,3
	jmp LB_47528
LB_47527:
	bts r12,3
LB_47528:
	mov r8,0
	bts r12,2
	ret
MTC_LB_47522:
	mov r15,0
LB_47530:
	cmp r15,0
	jz LB_47531
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47530
LB_47531:
; _none {  } ⊢ %_47520 : %_47520
 ; {>  %_47517~0':_r64 %_47515~3':_r64 %_47514~1':_r64 %_47518~4':_r64 %_47516~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_47520
 ; {>  %_47517~0':_r64 %_47515~3':_r64 %_47514~1':_r64 %_47520~°1◂{  }:(_opn)◂(t15671'(0)) %_47518~4':_r64 %_47516~2':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_47532
	mov rdi,r13
	call dlt
LB_47532:
	bt r12,3
	jc LB_47533
	mov rdi,r9
	call dlt
LB_47533:
	bt r12,1
	jc LB_47534
	mov rdi,r14
	call dlt
LB_47534:
	bt r12,4
	jc LB_47535
	mov rdi,r10
	call dlt
LB_47535:
	bt r12,2
	jc LB_47536
	mov rdi,r8
	call dlt
LB_47536:
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
MTC_LB_47529:
LB_47537:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47539
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47538
LB_47539:
	add rsp,8
	ret
LB_47540:
	add rsp,16
	pop r14
LB_47538:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_47548:
NS_E_RDI_47548:
NS_E_47548_ETR_TBL:
NS_E_47548_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_47509_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47564
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47558
LB_47564:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47559
	btr r12,0
	jmp LB_47560
LB_47559:
	bts r12,0
LB_47560:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47555
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_47549 ⊢ %_47550 : %_47550
 ; {>  %_47549~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47550
 ; {>  %_47550~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47553
	btr r12,3
	jmp LB_47554
LB_47553:
	bts r12,3
LB_47554:
	mov r8,0
	bts r12,2
	ret
LB_47555:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47557
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47556
LB_47557:
	add rsp,8
	ret
LB_47558:
	add rsp,16
	pop r14
LB_47556:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_47470_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47577
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47571
LB_47577:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47572
	btr r12,0
	jmp LB_47573
LB_47572:
	bts r12,0
LB_47573:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47568
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_47551 ⊢ %_47552 : %_47552
 ; {>  %_47551~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47552
 ; {>  %_47552~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47566
	btr r12,3
	jmp LB_47567
LB_47566:
	bts r12,3
LB_47567:
	mov r8,0
	bts r12,2
	ret
LB_47568:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47570
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47569
LB_47570:
	add rsp,8
	ret
LB_47571:
	add rsp,16
	pop r14
LB_47569:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_47579:
NS_E_RDI_47579:
NS_E_47579_ETR_TBL:
NS_E_47579_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_47548_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47624
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47616
LB_47624:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_47580_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47629
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47630
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47630:
	jmp LB_47616
LB_47629:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47619
	btr r12,1
	jmp LB_47620
LB_47619:
	bts r12,1
LB_47620:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47617
	btr r12,0
	jmp LB_47618
LB_47617:
	bts r12,0
LB_47618:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47613
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_47582 %_47583 } ⊢ %_47584 : %_47584
 ; {>  %_47582~0':_r64 %_47583~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f47201 %_47584 ⊢ %_47585 : %_47585
 ; {>  %_47584~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f47201 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_47599
	btr r12,2
	jmp LB_47600
LB_47599:
	bts r12,2
LB_47600:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_47605
	btr r12,3
	jmp LB_47606
LB_47605:
	bts r12,3
LB_47606:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_47603
	btr QWORD [rdi],0
	jmp LB_47604
LB_47603:
	bts QWORD [rdi],0
LB_47604:
	mov r9,r14
	bt r12,1
	jc LB_47609
	btr r12,3
	jmp LB_47610
LB_47609:
	bts r12,3
LB_47610:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_47607
	btr QWORD [rdi],1
	jmp LB_47608
LB_47607:
	bts QWORD [rdi],1
LB_47608:
	mov rsi,1
	bt r12,0
	jc LB_47601
	mov rsi,0
	bt r13,0
	jc LB_47601
	jmp LB_47602
LB_47601:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_47602:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_47201
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_47585 ⊢ %_47586 : %_47586
 ; {>  %_47585~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_47586
 ; {>  %_47586~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47611
	btr r12,3
	jmp LB_47612
LB_47611:
	bts r12,3
LB_47612:
	mov r8,0
	bts r12,2
	ret
LB_47613:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47615
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47614
LB_47615:
	add rsp,8
	ret
LB_47616:
	add rsp,32
	pop r14
LB_47614:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_47580:
NS_E_RDI_47580:
NS_E_47580_ETR_TBL:
NS_E_47580_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_47581_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47653
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47645
LB_47653:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_47580_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47658
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47659
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47659:
	jmp LB_47645
LB_47658:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47648
	btr r12,1
	jmp LB_47649
LB_47648:
	bts r12,1
LB_47649:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47646
	btr r12,0
	jmp LB_47647
LB_47646:
	bts r12,0
LB_47647:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47642
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_47587 %_47588 } ⊢ %_47589 : %_47589
 ; {>  %_47587~0':_r64 %_47588~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_47589 ⊢ %_47590 : %_47590
 ; {>  %_47589~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_47590
 ; {>  %_47590~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_47636
	btr r12,2
	jmp LB_47637
LB_47636:
	bts r12,2
LB_47637:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_47634
	btr QWORD [rdi],0
	jmp LB_47635
LB_47634:
	bts QWORD [rdi],0
LB_47635:
	mov r8,r14
	bt r12,1
	jc LB_47640
	btr r12,2
	jmp LB_47641
LB_47640:
	bts r12,2
LB_47641:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_47638
	btr QWORD [rdi],1
	jmp LB_47639
LB_47638:
	bts QWORD [rdi],1
LB_47639:
	mov rsi,1
	bt r12,3
	jc LB_47632
	mov rsi,0
	bt r9,0
	jc LB_47632
	jmp LB_47633
LB_47632:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47633:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47642:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47644
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47643
LB_47644:
	add rsp,8
	ret
LB_47645:
	add rsp,32
	pop r14
LB_47643:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_47663
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_47591 : %_47591
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_47591 ⊢ %_47592 : %_47592
 ; {>  %_47591~°1◂{  }:(_lst)◂(t15715'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_47592
 ; {>  %_47592~°0◂°1◂{  }:(_opn)◂((_lst)◂(t15718'(0))) }
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
	jc LB_47661
	mov rsi,0
	bt r9,0
	jc LB_47661
	jmp LB_47662
LB_47661:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_47662:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_47663:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47665
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47664
LB_47665:
	add rsp,8
	ret
LB_47666:
	add rsp,0
	pop r14
LB_47664:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_47581:
NS_E_RDI_47581:
NS_E_47581_ETR_TBL:
NS_E_47581_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_47548_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47678
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47672
LB_47678:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47673
	btr r12,0
	jmp LB_47674
LB_47673:
	bts r12,0
LB_47674:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47669
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_47593 ⊢ %_47594 : %_47594
 ; {>  %_47593~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47594
 ; {>  %_47594~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47667
	btr r12,3
	jmp LB_47668
LB_47667:
	bts r12,3
LB_47668:
	mov r8,0
	bts r12,2
	ret
LB_47669:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47671
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47670
LB_47671:
	add rsp,8
	ret
LB_47672:
	add rsp,16
	pop r14
LB_47670:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_47431_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47691
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47685
LB_47691:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47686
	btr r12,0
	jmp LB_47687
LB_47686:
	bts r12,0
LB_47687:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47682
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_47595 ⊢ %_47596 : %_47596
 ; {>  %_47595~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47596
 ; {>  %_47596~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47680
	btr r12,3
	jmp LB_47681
LB_47680:
	bts r12,3
LB_47681:
	mov r8,0
	bts r12,2
	ret
LB_47682:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47684
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47683
LB_47684:
	add rsp,8
	ret
LB_47685:
	add rsp,16
	pop r14
LB_47683:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_47706
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_47706
	jmp LB_47707
LB_47706:
	jmp LB_47698
LB_47707:
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
	jc LB_47699
	btr r12,0
	jmp LB_47700
LB_47699:
	bts r12,0
LB_47700:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47695
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_47597 : %_47597
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_47597
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_47597 ⊢ %_47598 : %_47598
 ; {>  %_47597~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_47598
 ; {>  %_47598~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47693
	btr r12,3
	jmp LB_47694
LB_47693:
	bts r12,3
LB_47694:
	mov r8,0
	bts r12,2
	ret
LB_47695:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47697
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47696
LB_47697:
	add rsp,8
	ret
LB_47698:
	add rsp,16
	pop r14
LB_47696:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_47708:
NS_E_RDI_47708:
NS_E_47708_ETR_TBL:
NS_E_47708_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_47729
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_47729
	jmp LB_47730
LB_47729:
	jmp LB_47719
LB_47730:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_47580_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47734
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_47735
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_47735:
	jmp LB_47719
LB_47734:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_47722
	btr r12,1
	jmp LB_47723
LB_47722:
	bts r12,1
LB_47723:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47720
	btr r12,0
	jmp LB_47721
LB_47720:
	bts r12,0
LB_47721:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_47716
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_47737
	btr r12,2
	jmp LB_47738
LB_47737:
	bts r12,2
LB_47738:
	mov r13,r14
	bt r12,1
	jc LB_47739
	btr r12,0
	jmp LB_47740
LB_47739:
	bts r12,0
LB_47740:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47201 %_47709 ⊢ %_47710 : %_47710
 ; {>  %_47709~0':(_lst)◂(_r64) }
; _f47201 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_47201
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_47710 ⊢ %_47711 : %_47711
 ; {>  %_47710~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_47711
 ; {>  %_47711~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47714
	btr r12,3
	jmp LB_47715
LB_47714:
	bts r12,3
LB_47715:
	mov r8,0
	bts r12,2
	ret
LB_47716:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47718
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47717
LB_47718:
	add rsp,8
	ret
LB_47719:
	add rsp,32
	pop r14
LB_47717:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_47752
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47746
LB_47752:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_47747
	btr r12,0
	jmp LB_47748
LB_47747:
	bts r12,0
LB_47748:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_47743
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_47712 ⊢ %_47713 : %_47713
 ; {>  %_47712~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_47713
 ; {>  %_47713~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_47741
	btr r12,3
	jmp LB_47742
LB_47741:
	bts r12,3
LB_47742:
	mov r8,0
	bts r12,2
	ret
LB_47743:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_47745
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_47744
LB_47745:
	add rsp,8
	ret
LB_47746:
	add rsp,16
	pop r14
LB_47744:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_47755:
NS_E_RDI_47755:
NS_E_47755_ETR_TBL:
NS_E_47755_TBL:
; _
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
LB_47764:
	jmp LB_47761
LB_47760:
	add r14,1
LB_47761:
	cmp r14,r10
	jge LB_47762
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_47760
	cmp al,10
	jz LB_47760
	cmp al,32
	jz LB_47760
LB_47762:
	push r10
	push rsi
	call NS_E_47579_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_47763
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_47765
	bts QWORD [rax],0
LB_47765:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_47764
LB_47763:
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
	jc LB_47758
	btr QWORD [rdi],0
LB_47758:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_47757:
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
NS_E_47907:
; 	|» 0'
NS_E_RDI_47907:
MTC_LB_47908:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_47909
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_47910
	bt QWORD [rax],0
	jc LB_47911
	btr r12,3
	jmp LB_47912
LB_47911:
	bts r12,3
LB_47912:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_47910:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_47915
	btr r12,4
	jmp LB_47916
LB_47915:
	bts r12,4
LB_47916:
	mov r14,r10
	bt r12,4
	jc LB_47913
	btr r12,1
	jmp LB_47914
LB_47913:
	bts r12,1
LB_47914:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_47919
	btr r12,4
	jmp LB_47920
LB_47919:
	bts r12,4
LB_47920:
	mov r8,r10
	bt r12,4
	jc LB_47917
	btr r12,2
	jmp LB_47918
LB_47917:
	bts r12,2
LB_47918:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_47921:
	cmp r15,0
	jz LB_47922
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47921
LB_47922:
MTC_LB_47923:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_47924
; _emt_mov_ptn_to_ptn:{| 0110.. |},2' ⊢ °0◂0'
; 2' ⊢ °0◂0'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_47925
	bt QWORD [rax],0
	jc LB_47926
	btr r12,3
	jmp LB_47927
LB_47926:
	bts r12,3
LB_47927:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_47925:
	mov r9,rax
	mov r13,r9
	bt r12,3
	jc LB_47928
	btr r12,0
	jmp LB_47929
LB_47928:
	bts r12,0
LB_47929:
LB_47930:
	cmp r15,0
	jz LB_47931
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47930
LB_47931:
; _f47879 %_47883 ⊢ %_47884 : %_47884
 ; {>  %_47881~1':_stg %_47883~0':(_lst)◂(_p47772) }
; _f47879 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_47879
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_47932
	btr r12,1
	jmp LB_47933
LB_47932:
	bts r12,1
LB_47933:
	add rsp,16
; 	» "JJ\n" _ ⊢ 2' : %_47885
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_4a_4a
	mov QWORD [rdi+8*1+8*0],rax
	mov r8,rdi
	btr r12,2
; » _^ ..
	mov rax,13
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*2],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*2]
	cld
	rep movsb
	pop rcx
; "\226\136\142\226\136\142\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; //
	mov r9,rax
	btr r12,3
; ∎ %_47889
 ; {>  %_47888~2':_stg %_47887~0':_stg %_47886~1':_stg %_47889~3':_stg }
; 	∎ 3'
	bt r12,2
	jc LB_47934
	mov rdi,r8
	call dlt
LB_47934:
	bt r12,0
	jc LB_47935
	mov rdi,r13
	call dlt
LB_47935:
	bt r12,1
	jc LB_47936
	mov rdi,r14
	call dlt
LB_47936:
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_47937
	btr r12,0
	jmp LB_47938
LB_47937:
	bts r12,0
LB_47938:
	ret
MTC_LB_47924:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_47939
; _emt_mov_ptn_to_ptn:{| 0110.. |},2' ⊢ °1◂0'
; 2' ⊢ °1◂0'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_47940
	bt QWORD [rax],0
	jc LB_47941
	btr r12,3
	jmp LB_47942
LB_47941:
	bts r12,3
LB_47942:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_47940:
	mov r9,rax
	mov r13,r9
	bt r12,3
	jc LB_47943
	btr r12,0
	jmp LB_47944
LB_47943:
	bts r12,0
LB_47944:
LB_47945:
	cmp r15,0
	jz LB_47946
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47945
LB_47946:
; » _^ ..
	mov rax,11
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " = .."
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r8,rax
	btr r12,2
; ∎ %_47892
 ; {>  %_47892~2':_stg %_47891~1':_stg %_47890~0':_p47766 }
; 	∎ 2'
	bt r12,1
	jc LB_47947
	mov rdi,r14
	call dlt
LB_47947:
	bt r12,0
	jc LB_47948
	mov rdi,r13
	call dlt
LB_47948:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_47949
	btr r12,0
	jmp LB_47950
LB_47949:
	bts r12,0
LB_47950:
	ret
MTC_LB_47939:
MTC_LB_47909:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_47951
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_47952
	bt QWORD [rax],0
	jc LB_47953
	btr r12,2
	jmp LB_47954
LB_47953:
	bts r12,2
LB_47954:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_47952:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_47955
	btr r12,1
	jmp LB_47956
LB_47955:
	bts r12,1
LB_47956:
LB_47957:
	cmp r15,0
	jz LB_47958
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47957
LB_47958:
; » _^ ..
	mov rax,16
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167+s8 @..."
	mov rsi,0x_20_38_73_2b_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_40
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+3],sil
	add rdi,12
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_47894
 ; {>  %_47893~1':(_lst)◂({ _stg _p47776 }) %_47894~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_47959
	mov rdi,r14
	call dlt
LB_47959:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_47951:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_47960
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂{ 1' 2' }
; 0' ⊢ °2◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_47961
	bt QWORD [rax],0
	jc LB_47962
	btr r12,3
	jmp LB_47963
LB_47962:
	bts r12,3
LB_47963:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_47961:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_47966
	btr r12,4
	jmp LB_47967
LB_47966:
	bts r12,4
LB_47967:
	mov r14,r10
	bt r12,4
	jc LB_47964
	btr r12,1
	jmp LB_47965
LB_47964:
	bts r12,1
LB_47965:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_47970
	btr r12,4
	jmp LB_47971
LB_47970:
	bts r12,4
LB_47971:
	mov r8,r10
	bt r12,4
	jc LB_47968
	btr r12,2
	jmp LB_47969
LB_47968:
	bts r12,2
LB_47969:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_47972:
	cmp r15,0
	jz LB_47973
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47972
LB_47973:
; » _^ ..
	mov rax,7
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_47898
 ; {>  %_47898~0':_stg %_47897~1':_stg %_47896~2':_p47774 }
; 	∎ 0'
	bt r12,1
	jc LB_47974
	mov rdi,r14
	call dlt
LB_47974:
	bt r12,2
	jc LB_47975
	mov rdi,r8
	call dlt
LB_47975:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_47960:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_47976
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °3◂1'
; 0' ⊢ °3◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_47977
	bt QWORD [rax],0
	jc LB_47978
	btr r12,2
	jmp LB_47979
LB_47978:
	bts r12,2
LB_47979:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_47977:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_47980
	btr r12,1
	jmp LB_47981
LB_47980:
	bts r12,1
LB_47981:
LB_47982:
	cmp r15,0
	jz LB_47983
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47982
LB_47983:
; » _^ ..
	mov rax,11
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167 @..."
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_40
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_47900
 ; {>  %_47899~1':(_lst)◂({ _stg _p47788 _p47791 }) %_47900~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_47984
	mov rdi,r14
	call dlt
LB_47984:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_47976:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_47985
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °4◂{ 1' 2' }
; 0' ⊢ °4◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_47986
	bt QWORD [rax],0
	jc LB_47987
	btr r12,3
	jmp LB_47988
LB_47987:
	bts r12,3
LB_47988:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_47986:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_47991
	btr r12,4
	jmp LB_47992
LB_47991:
	bts r12,4
LB_47992:
	mov r14,r10
	bt r12,4
	jc LB_47989
	btr r12,1
	jmp LB_47990
LB_47989:
	bts r12,1
LB_47990:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_47995
	btr r12,4
	jmp LB_47996
LB_47995:
	bts r12,4
LB_47996:
	mov r8,r10
	bt r12,4
	jc LB_47993
	btr r12,2
	jmp LB_47994
LB_47993:
	bts r12,2
LB_47994:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_47997:
	cmp r15,0
	jz LB_47998
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_47997
LB_47998:
; » _^ ..
	mov rax,7
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_47904
 ; {>  %_47903~1':_stg %_47902~2':_p47775 %_47904~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_47999
	mov rdi,r14
	call dlt
LB_47999:
	bt r12,2
	jc LB_48000
	mov rdi,r8
	call dlt
LB_48000:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_47985:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,5
	jnz MTC_LB_48001
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °5◂1'
; 0' ⊢ °5◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,5
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_48002
	bt QWORD [rax],0
	jc LB_48003
	btr r12,2
	jmp LB_48004
LB_48003:
	bts r12,2
LB_48004:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_48002:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_48005
	btr r12,1
	jmp LB_48006
LB_48005:
	bts r12,1
LB_48006:
LB_48007:
	cmp r15,0
	jz LB_48008
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48007
LB_48008:
; » _^ ..
	mov rax,11
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\182 @..."
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_40
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_47906
 ; {>  %_47906~0':_stg %_47905~1':(_lst)◂({ _stg _p47775 }) }
; 	∎ 0'
	bt r12,1
	jc LB_48009
	mov rdi,r14
	call dlt
LB_48009:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_48001:
NS_E_47879:
; 	|» 0'
NS_E_RDI_47879:
MTC_LB_48010:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_48011
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_48012
	bt QWORD [rax],0
	jc LB_48013
	btr r12,1
	jmp LB_48014
LB_48013:
	bts r12,1
LB_48014:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_48012:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_48015:
	cmp r15,0
	jz LB_48016
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48015
LB_48016:
; 	» "" _ ⊢ 0' : %_47871
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_47871
 ; {>  %_47871~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_48011:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_48017
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_48018
	bt QWORD [rax],0
	jc LB_48019
	btr r12,3
	jmp LB_48020
LB_48019:
	bts r12,3
LB_48020:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_48018:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_48023
	btr r12,4
	jmp LB_48024
LB_48023:
	bts r12,4
LB_48024:
	mov r14,r10
	bt r12,4
	jc LB_48021
	btr r12,1
	jmp LB_48022
LB_48021:
	bts r12,1
LB_48022:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_48027
	btr r12,4
	jmp LB_48028
LB_48027:
	bts r12,4
LB_48028:
	mov r8,r10
	bt r12,4
	jc LB_48025
	btr r12,2
	jmp LB_48026
LB_48025:
	bts r12,2
LB_48026:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_48029:
	cmp r15,0
	jz LB_48030
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48029
LB_48030:
; _f47907 %_47872 ⊢ %_47874 : %_47874
 ; {>  %_47873~2':(_lst)◂(_p47772) %_47872~1':_p47772 }
; _f47907 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_48033
	btr r12,0
	jmp LB_48034
LB_48033:
	bts r12,0
LB_48034:
	call NS_E_47907
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_48031
	btr r12,2
	jmp LB_48032
LB_48031:
	bts r12,2
LB_48032:
	add rsp,16
; _f47879 %_47873 ⊢ %_47875 : %_47875
 ; {>  %_47873~2':(_lst)◂(_p47772) %_47874~0':_stg }
; _f47879 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_48037
	btr r12,0
	jmp LB_48038
LB_48037:
	bts r12,0
LB_48038:
	call NS_E_47879
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_48039
	btr r12,1
	jmp LB_48040
LB_48039:
	bts r12,1
LB_48040:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_48035
	btr r12,0
	jmp LB_48036
LB_48035:
	bts r12,0
LB_48036:
	add rsp,16
; » _^ ..
	mov rax,0
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_47878
 ; {>  %_47876~0':_stg %_47878~2':_stg %_47877~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_48041
	mov rdi,r13
	call dlt
LB_48041:
	bt r12,1
	jc LB_48042
	mov rdi,r14
	call dlt
LB_48042:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_48043
	btr r12,0
	jmp LB_48044
LB_48043:
	bts r12,0
LB_48044:
	ret
MTC_LB_48017:
NS_E_48048:
NS_E_RDI_48048:
NS_E_48048_ETR_TBL:
NS_E_48048_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_48150
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_48150
	jmp LB_48151
LB_48150:
	jmp LB_48142
LB_48151:
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
	jc LB_48143
	btr r12,0
	jmp LB_48144
LB_48143:
	bts r12,0
LB_48144:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48139
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_48052 : %_48052
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_48052
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_48052 ⊢ %_48053 : %_48053
 ; {>  %_48052~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_48053
 ; {>  %_48053~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48137
	btr r12,3
	jmp LB_48138
LB_48137:
	bts r12,3
LB_48138:
	mov r8,0
	bts r12,2
	ret
LB_48139:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48141
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48140
LB_48141:
	add rsp,8
	ret
LB_48142:
	add rsp,16
	pop r14
LB_48140:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_47088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48166
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48158
LB_48166:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_48048_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48171
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48172
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48172:
	jmp LB_48158
LB_48171:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48161
	btr r12,1
	jmp LB_48162
LB_48161:
	bts r12,1
LB_48162:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48159
	btr r12,0
	jmp LB_48160
LB_48159:
	bts r12,0
LB_48160:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_48155
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f44 %_48055 ⊢ %_48056 : %_48056
 ; {>  %_48055~1':_r64 %_48054~0':_r64 }
	add r14,1
; _some %_48056 ⊢ %_48057 : %_48057
 ; {>  %_48056~1':_r64 %_48054~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_48057
 ; {>  %_48057~°0◂1':(_opn)◂(_r64) %_48054~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_48152
	mov rdi,r13
	call dlt
LB_48152:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_48153
	btr r12,3
	jmp LB_48154
LB_48153:
	bts r12,3
LB_48154:
	mov r8,0
	bts r12,2
	ret
LB_48155:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48157
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48156
LB_48157:
	add rsp,8
	ret
LB_48158:
	add rsp,32
	pop r14
LB_48156:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_48049:
NS_E_RDI_48049:
NS_E_48049_ETR_TBL:
NS_E_48049_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; " "
	add r14,1
	cmp r14,r10
	jg LB_48187
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_48187
	jmp LB_48188
LB_48187:
	jmp LB_48179
LB_48188:
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
	jc LB_48180
	btr r12,0
	jmp LB_48181
LB_48180:
	bts r12,0
LB_48181:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48176
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_48058 : %_48058
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_48058
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_48058 ⊢ %_48059 : %_48059
 ; {>  %_48058~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_48059
 ; {>  %_48059~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48174
	btr r12,3
	jmp LB_48175
LB_48174:
	bts r12,3
LB_48175:
	mov r8,0
	bts r12,2
	ret
LB_48176:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48178
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48177
LB_48178:
	add rsp,8
	ret
LB_48179:
	add rsp,16
	pop r14
LB_48177:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_48202
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_48202
	jmp LB_48203
LB_48202:
	jmp LB_48194
LB_48203:
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
	jc LB_48195
	btr r12,0
	jmp LB_48196
LB_48195:
	bts r12,0
LB_48196:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48191
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_48060 : %_48060
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_48060
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_48060 ⊢ %_48061 : %_48061
 ; {>  %_48060~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_48061
 ; {>  %_48061~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48189
	btr r12,3
	jmp LB_48190
LB_48189:
	bts r12,3
LB_48190:
	mov r8,0
	bts r12,2
	ret
LB_48191:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48193
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48192
LB_48193:
	add rsp,8
	ret
LB_48194:
	add rsp,16
	pop r14
LB_48192:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_48206
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_48062 : %_48062
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_48062
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_48062 ⊢ %_48063 : %_48063
 ; {>  %_48062~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_48063
 ; {>  %_48063~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48204
	btr r12,3
	jmp LB_48205
LB_48204:
	bts r12,3
LB_48205:
	mov r8,0
	bts r12,2
	ret
LB_48206:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48208
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48207
LB_48208:
	add rsp,8
	ret
LB_48209:
	add rsp,0
	pop r14
LB_48207:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_48050:
NS_E_RDI_48050:
NS_E_48050_ETR_TBL:
NS_E_48050_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_48049_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48289
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48236
LB_48289:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_48297
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_48297
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_48297
	jmp LB_48298
LB_48297:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48295
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48295:
	jmp LB_48236
LB_48298:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_48049_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48253
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48254
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48254:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48255
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48255:
	jmp LB_48237
LB_48253:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_48265
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_48265
	jmp LB_48266
LB_48265:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48261
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48261:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48262
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48262:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48263
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48263:
	jmp LB_48237
LB_48266:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_48051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48270
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_48271
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_48271:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48272
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48272:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48273
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48273:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48274
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48274:
	jmp LB_48237
LB_48270:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_48050_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48279
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_48280
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_48280:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_48281
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_48281:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48282
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48282:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48283
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48283:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48284
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48284:
	jmp LB_48237
LB_48279:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_48248
	btr r12,5
	jmp LB_48249
LB_48248:
	bts r12,5
LB_48249:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_48246
	btr r12,4
	jmp LB_48247
LB_48246:
	bts r12,4
LB_48247:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_48244
	btr r12,3
	jmp LB_48245
LB_48244:
	bts r12,3
LB_48245:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48242
	btr r12,2
	jmp LB_48243
LB_48242:
	bts r12,2
LB_48243:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48240
	btr r12,1
	jmp LB_48241
LB_48240:
	bts r12,1
LB_48241:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48238
	btr r12,0
	jmp LB_48239
LB_48238:
	bts r12,0
LB_48239:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_48233
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_48299
	btr r12,6
	jmp LB_48300
LB_48299:
	bts r12,6
LB_48300:
	mov r8,r10
	bt r12,4
	jc LB_48301
	btr r12,2
	jmp LB_48302
LB_48301:
	bts r12,2
LB_48302:
	mov rdx,r14
	bt r12,1
	jc LB_48303
	btr r12,7
	jmp LB_48304
LB_48303:
	bts r12,7
LB_48304:
	mov r14,rcx
	bt r12,6
	jc LB_48305
	btr r12,1
	jmp LB_48306
LB_48305:
	bts r12,1
LB_48306:
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_48309
	btr r12,6
	jmp LB_48310
LB_48309:
	bts r12,6
LB_48310:
	mov r9,rcx
	bt r12,6
	jc LB_48307
	btr r12,3
	jmp LB_48308
LB_48307:
	bts r12,3
LB_48308:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_48313
	btr r12,6
	jmp LB_48314
LB_48313:
	bts r12,6
LB_48314:
	mov r10,rcx
	bt r12,6
	jc LB_48311
	btr r12,4
	jmp LB_48312
LB_48311:
	bts r12,4
LB_48312:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_48069 : %_48069
 ; {>  %_48064~0':_r64 %_48068~4':(_lst)◂(_p48045) %_48067~3':_r64 %_48065~1':_r64 %_48066~2':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_48069
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f39 { %_48069 %_48064 } ⊢ { %_48070 %_48071 } : { %_48070 %_48071 }
 ; {>  %_48069~5':_r64 %_48064~0':_r64 %_48068~4':(_lst)◂(_p48045) %_48067~3':_r64 %_48065~1':_r64 %_48066~2':_r64 }
	add r11,r13
; _f39 { %_48070 %_48065 } ⊢ { %_48072 %_48073 } : { %_48072 %_48073 }
 ; {>  %_48068~4':(_lst)◂(_p48045) %_48067~3':_r64 %_48071~0':_r64 %_48065~1':_r64 %_48070~5':_r64 %_48066~2':_r64 }
	add r11,r14
; _f39 { %_48072 %_48066 } ⊢ { %_48074 %_48075 } : { %_48074 %_48075 }
 ; {>  %_48072~5':_r64 %_48068~4':(_lst)◂(_p48045) %_48073~1':_r64 %_48067~3':_r64 %_48071~0':_r64 %_48066~2':_r64 }
	add r11,r8
; _f48046 %_48074 ⊢ %_48076 : %_48076
 ; {>  %_48068~4':(_lst)◂(_p48045) %_48073~1':_r64 %_48067~3':_r64 %_48071~0':_r64 %_48075~2':_r64 %_48074~5':_r64 }
; _f48046 5' ⊢ °0◂5'
; _cns { %_48076 %_48068 } ⊢ %_48077 : %_48077
 ; {>  %_48068~4':(_lst)◂(_p48045) %_48073~1':_r64 %_48076~°0◂5':_p48045 %_48067~3':_r64 %_48071~0':_r64 %_48075~2':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_48067 %_48077 } ⊢ %_48078 : %_48078
 ; {>  %_48073~1':_r64 %_48067~3':_r64 %_48071~0':_r64 %_48077~°0◂{ °0◂5' 4' }:(_lst)◂(_p48045) %_48075~2':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_48078
 ; {>  %_48078~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p48045) }) %_48073~1':_r64 %_48071~0':_r64 %_48075~2':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,1
	jc LB_48210
	mov rdi,r14
	call dlt
LB_48210:
	bt r12,0
	jc LB_48211
	mov rdi,r13
	call dlt
LB_48211:
	bt r12,2
	jc LB_48212
	mov rdi,r8
	call dlt
LB_48212:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_48213
	btr r12,0
	jmp LB_48214
LB_48213:
	bts r12,0
LB_48214:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_48217
	btr r12,1
	jmp LB_48218
LB_48217:
	bts r12,1
LB_48218:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_48215
	btr QWORD [rdi],0
	jmp LB_48216
LB_48215:
	bts QWORD [rdi],0
LB_48216:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_48227
	btr r12,0
	jmp LB_48228
LB_48227:
	bts r12,0
LB_48228:
	mov rsi,1
	bt r12,0
	jc LB_48225
	mov rsi,0
	bt r13,0
	jc LB_48225
	jmp LB_48226
LB_48225:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_48226:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_48223
	btr QWORD [rdi],0
	jmp LB_48224
LB_48223:
	bts QWORD [rdi],0
LB_48224:
	mov r13,r10
	bt r12,4
	jc LB_48231
	btr r12,0
	jmp LB_48232
LB_48231:
	bts r12,0
LB_48232:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_48229
	btr QWORD [rdi],1
	jmp LB_48230
LB_48229:
	bts QWORD [rdi],1
LB_48230:
	mov rsi,1
	bt r12,1
	jc LB_48221
	mov rsi,0
	bt r14,0
	jc LB_48221
	jmp LB_48222
LB_48221:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_48222:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_48219
	btr QWORD [rdi],1
	jmp LB_48220
LB_48219:
	bts QWORD [rdi],1
LB_48220:
	mov r8,0
	bts r12,2
	ret
LB_48233:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48235
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48234
LB_48235:
	add rsp,8
	ret
LB_48237:
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
LB_48236:
	add rsp,96
	pop r14
LB_48234:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_48049_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48368
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48340
LB_48368:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_48376
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_48376
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_48376
	jmp LB_48377
LB_48376:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48374
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48374:
	jmp LB_48340
LB_48377:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_48048_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48353
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48354
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48354:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48355
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48355:
	jmp LB_48341
LB_48353:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_48050_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48360
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48361
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48361:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48362
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48362:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48363
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48363:
	jmp LB_48341
LB_48360:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_48348
	btr r12,3
	jmp LB_48349
LB_48348:
	bts r12,3
LB_48349:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48346
	btr r12,2
	jmp LB_48347
LB_48346:
	bts r12,2
LB_48347:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48344
	btr r12,1
	jmp LB_48345
LB_48344:
	bts r12,1
LB_48345:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48342
	btr r12,0
	jmp LB_48343
LB_48342:
	bts r12,0
LB_48343:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_48337
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_48378
	btr r12,4
	jmp LB_48379
LB_48378:
	bts r12,4
LB_48379:
	mov r14,r8
	bt r12,2
	jc LB_48380
	btr r12,1
	jmp LB_48381
LB_48380:
	bts r12,1
LB_48381:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_48382
	btr r12,4
	jmp LB_48383
LB_48382:
	bts r12,4
LB_48383:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_48386
	btr r12,5
	jmp LB_48387
LB_48386:
	bts r12,5
LB_48387:
	mov r8,r11
	bt r12,5
	jc LB_48384
	btr r12,2
	jmp LB_48385
LB_48384:
	bts r12,2
LB_48385:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_48390
	btr r12,5
	jmp LB_48391
LB_48390:
	bts r12,5
LB_48391:
	mov r9,r11
	bt r12,5
	jc LB_48388
	btr r12,3
	jmp LB_48389
LB_48388:
	bts r12,3
LB_48389:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_48083 : %_48083
 ; {>  %_48082~3':(_lst)◂(_p48045) %_48079~0':_r64 %_48080~1':_r64 %_48081~2':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_48083
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f39 { %_48083 %_48079 } ⊢ { %_48084 %_48085 } : { %_48084 %_48085 }
 ; {>  %_48082~3':(_lst)◂(_p48045) %_48079~0':_r64 %_48080~1':_r64 %_48083~4':_r64 %_48081~2':_r64 }
	add r10,r13
; _f39 { %_48084 %_48080 } ⊢ { %_48086 %_48087 } : { %_48086 %_48087 }
 ; {>  %_48085~0':_r64 %_48082~3':(_lst)◂(_p48045) %_48084~4':_r64 %_48080~1':_r64 %_48081~2':_r64 }
	add r10,r14
; _f48046 %_48086 ⊢ %_48088 : %_48088
 ; {>  %_48085~0':_r64 %_48082~3':(_lst)◂(_p48045) %_48087~1':_r64 %_48081~2':_r64 %_48086~4':_r64 }
; _f48046 4' ⊢ °0◂4'
; _cns { %_48088 %_48082 } ⊢ %_48089 : %_48089
 ; {>  %_48085~0':_r64 %_48082~3':(_lst)◂(_p48045) %_48088~°0◂4':_p48045 %_48087~1':_r64 %_48081~2':_r64 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_48081 %_48089 } ⊢ %_48090 : %_48090
 ; {>  %_48085~0':_r64 %_48089~°0◂{ °0◂4' 3' }:(_lst)◂(_p48045) %_48087~1':_r64 %_48081~2':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_48090
 ; {>  %_48085~0':_r64 %_48090~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p48045) }) %_48087~1':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,0
	jc LB_48315
	mov rdi,r13
	call dlt
LB_48315:
	bt r12,1
	jc LB_48316
	mov rdi,r14
	call dlt
LB_48316:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_48317
	btr r12,0
	jmp LB_48318
LB_48317:
	bts r12,0
LB_48318:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_48321
	btr r12,1
	jmp LB_48322
LB_48321:
	bts r12,1
LB_48322:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_48319
	btr QWORD [rdi],0
	jmp LB_48320
LB_48319:
	bts QWORD [rdi],0
LB_48320:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_48331
	btr r12,2
	jmp LB_48332
LB_48331:
	bts r12,2
LB_48332:
	mov rsi,1
	bt r12,2
	jc LB_48329
	mov rsi,0
	bt r8,0
	jc LB_48329
	jmp LB_48330
LB_48329:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_48330:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_48327
	btr QWORD [rdi],0
	jmp LB_48328
LB_48327:
	bts QWORD [rdi],0
LB_48328:
	mov r8,r13
	bt r12,0
	jc LB_48335
	btr r12,2
	jmp LB_48336
LB_48335:
	bts r12,2
LB_48336:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_48333
	btr QWORD [rdi],1
	jmp LB_48334
LB_48333:
	bts QWORD [rdi],1
LB_48334:
	mov rsi,1
	bt r12,1
	jc LB_48325
	mov rsi,0
	bt r14,0
	jc LB_48325
	jmp LB_48326
LB_48325:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_48326:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_48323
	btr QWORD [rdi],1
	jmp LB_48324
LB_48323:
	bts QWORD [rdi],1
LB_48324:
	mov r8,0
	bts r12,2
	ret
LB_48337:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48339
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48338
LB_48339:
	add rsp,8
	ret
LB_48341:
	add rsp,64
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
LB_48340:
	add rsp,64
	pop r14
LB_48338:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_48048_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48463
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48455
LB_48463:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_48050_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48468
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48469
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48469:
	jmp LB_48455
LB_48468:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48458
	btr r12,1
	jmp LB_48459
LB_48458:
	bts r12,1
LB_48459:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48456
	btr r12,0
	jmp LB_48457
LB_48456:
	bts r12,0
LB_48457:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_48452
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_48471
	btr r12,3
	jmp LB_48472
LB_48471:
	bts r12,3
LB_48472:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_48475
	btr r12,4
	jmp LB_48476
LB_48475:
	bts r12,4
LB_48476:
	mov r14,r10
	bt r12,4
	jc LB_48473
	btr r12,1
	jmp LB_48474
LB_48473:
	bts r12,1
LB_48474:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_48479
	btr r12,4
	jmp LB_48480
LB_48479:
	bts r12,4
LB_48480:
	mov r8,r10
	bt r12,4
	jc LB_48477
	btr r12,2
	jmp LB_48478
LB_48477:
	bts r12,2
LB_48478:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f39 { %_48092 %_48091 } ⊢ { %_48094 %_48095 } : { %_48094 %_48095 }
 ; {>  %_48093~2':(_lst)◂(_p48045) %_48091~0':_r64 %_48092~1':_r64 }
	add r14,r13
MTC_LB_48392:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_48393
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
	jnc LB_48394
	bt QWORD [rax],0
	jc LB_48395
	btr r12,5
	jmp LB_48396
LB_48395:
	bts r12,5
LB_48396:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_48394:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_48399
	btr r12,6
	jmp LB_48400
LB_48399:
	bts r12,6
LB_48400:
	mov r9,rcx
	bt r12,6
	jc LB_48397
	btr r12,3
	jmp LB_48398
LB_48397:
	bts r12,3
LB_48398:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_48403
	btr r12,6
	jmp LB_48404
LB_48403:
	bts r12,6
LB_48404:
	mov r10,rcx
	bt r12,6
	jc LB_48401
	btr r12,4
	jmp LB_48402
LB_48401:
	bts r12,4
LB_48402:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_48393
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
	jnc LB_48405
	bt QWORD [rax],0
	jc LB_48406
	btr r12,6
	jmp LB_48407
LB_48406:
	bts r12,6
LB_48407:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_48405:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_48408
	btr r12,5
	jmp LB_48409
LB_48408:
	bts r12,5
LB_48409:
LB_48410:
	cmp r15,0
	jz LB_48411
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48410
LB_48411:
; _f39 { %_48098 %_48095 } ⊢ { %_48099 %_48100 } : { %_48099 %_48100 }
 ; {>  %_48097~4':(_lst)◂(_p48045) %_48094~1':_r64 %_48095~0':_r64 %_48098~5':_r64 }
	add r11,r13
; _f48047 %_48099 ⊢ %_48101 : %_48101
 ; {>  %_48099~5':_r64 %_48097~4':(_lst)◂(_p48045) %_48094~1':_r64 %_48100~0':_r64 }
; _f48047 5' ⊢ °1◂5'
; _cns { %_48101 %_48097 } ⊢ %_48102 : %_48102
 ; {>  %_48101~°1◂5':_p48045 %_48097~4':(_lst)◂(_p48045) %_48094~1':_r64 %_48100~0':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_48094 %_48102 } ⊢ %_48103 : %_48103
 ; {>  %_48094~1':_r64 %_48100~0':_r64 %_48102~°0◂{ °1◂5' 4' }:(_lst)◂(_p48045) }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_48103
 ; {>  %_48100~0':_r64 %_48103~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p48045) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_48412
	mov rdi,r13
	call dlt
LB_48412:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_48415
	btr r12,0
	jmp LB_48416
LB_48415:
	bts r12,0
LB_48416:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_48413
	btr QWORD [rdi],0
	jmp LB_48414
LB_48413:
	bts QWORD [rdi],0
LB_48414:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_48425
	btr r12,1
	jmp LB_48426
LB_48425:
	bts r12,1
LB_48426:
	mov rsi,1
	bt r12,1
	jc LB_48423
	mov rsi,0
	bt r14,0
	jc LB_48423
	jmp LB_48424
LB_48423:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_48424:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_48421
	btr QWORD [rdi],0
	jmp LB_48422
LB_48421:
	bts QWORD [rdi],0
LB_48422:
	mov r14,r10
	bt r12,4
	jc LB_48429
	btr r12,1
	jmp LB_48430
LB_48429:
	bts r12,1
LB_48430:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_48427
	btr QWORD [rdi],1
	jmp LB_48428
LB_48427:
	bts QWORD [rdi],1
LB_48428:
	mov rsi,1
	bt r12,0
	jc LB_48419
	mov rsi,0
	bt r13,0
	jc LB_48419
	jmp LB_48420
LB_48419:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_48420:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_48417
	btr QWORD [rdi],1
	jmp LB_48418
LB_48417:
	bts QWORD [rdi],1
LB_48418:
	mov r8,0
	bts r12,2
	ret
MTC_LB_48393:
	mov r15,0
LB_48432:
	cmp r15,0
	jz LB_48433
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48432
LB_48433:
; _f48047 %_48095 ⊢ %_48104 : %_48104
 ; {>  %_48093~2':(_lst)◂(_p48045) %_48094~1':_r64 %_48095~0':_r64 }
; _f48047 0' ⊢ °1◂0'
; _cns { %_48104 %_48093 } ⊢ %_48105 : %_48105
 ; {>  %_48093~2':(_lst)◂(_p48045) %_48094~1':_r64 %_48104~°1◂0':_p48045 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_48094 %_48105 } ⊢ %_48106 : %_48106
 ; {>  %_48094~1':_r64 %_48105~°0◂{ °1◂0' 2' }:(_lst)◂(_p48045) }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_48106
 ; {>  %_48106~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p48045) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂0' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 1' °0◂{ °1◂0' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_48436
	btr r12,4
	jmp LB_48437
LB_48436:
	bts r12,4
LB_48437:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_48434
	btr QWORD [rdi],0
	jmp LB_48435
LB_48434:
	bts QWORD [rdi],0
LB_48435:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_48446
	btr r12,1
	jmp LB_48447
LB_48446:
	bts r12,1
LB_48447:
	mov rsi,1
	bt r12,1
	jc LB_48444
	mov rsi,0
	bt r14,0
	jc LB_48444
	jmp LB_48445
LB_48444:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_48445:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_48442
	btr QWORD [rdi],0
	jmp LB_48443
LB_48442:
	bts QWORD [rdi],0
LB_48443:
	mov r14,r8
	bt r12,2
	jc LB_48450
	btr r12,1
	jmp LB_48451
LB_48450:
	bts r12,1
LB_48451:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_48448
	btr QWORD [rdi],1
	jmp LB_48449
LB_48448:
	bts QWORD [rdi],1
LB_48449:
	mov rsi,1
	bt r12,4
	jc LB_48440
	mov rsi,0
	bt r10,0
	jc LB_48440
	jmp LB_48441
LB_48440:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_48441:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_48438
	btr QWORD [rdi],1
	jmp LB_48439
LB_48438:
	bts QWORD [rdi],1
LB_48439:
	mov r8,0
	bts r12,2
	ret
MTC_LB_48431:
LB_48452:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48454
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48453
LB_48454:
	add rsp,8
	ret
LB_48455:
	add rsp,32
	pop r14
LB_48453:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_48489
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_48107 : %_48107
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_48108 : %_48108
 ; {>  %_48107~°1◂{  }:(_lst)◂(t15947'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_48108
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_48108 %_48107 } ⊢ %_48109 : %_48109
 ; {>  %_48107~°1◂{  }:(_lst)◂(t15947'(0)) %_48108~0':_r64 }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_48109
 ; {>  %_48109~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t15951'(0)) }) }
; 	∎ °0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_48483
	btr r12,1
	jmp LB_48484
LB_48483:
	bts r12,1
LB_48484:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_48481
	btr QWORD [rdi],0
	jmp LB_48482
LB_48481:
	bts QWORD [rdi],0
LB_48482:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_48487
	mov rsi,0
	bt r14,0
	jc LB_48487
	jmp LB_48488
LB_48487:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_48488:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_48485
	btr QWORD [rdi],1
	jmp LB_48486
LB_48485:
	bts QWORD [rdi],1
LB_48486:
	mov r8,0
	bts r12,2
	ret
LB_48489:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48491
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48490
LB_48491:
	add rsp,8
	ret
LB_48492:
	add rsp,0
	pop r14
LB_48490:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_48051:
NS_E_RDI_48051:
NS_E_48051_ETR_TBL:
NS_E_48051_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_48049_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48530
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48500
LB_48530:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_48538
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_48538
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_48538
	jmp LB_48539
LB_48538:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48536
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48536:
	jmp LB_48500
LB_48539:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_48049_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48513
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48514
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48514:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48515
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48515:
	jmp LB_48501
LB_48513:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_48525
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_48525
	jmp LB_48526
LB_48525:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48521
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48521:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48522
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48522:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48523
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48523:
	jmp LB_48501
LB_48526:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_48508
	btr r12,3
	jmp LB_48509
LB_48508:
	bts r12,3
LB_48509:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48506
	btr r12,2
	jmp LB_48507
LB_48506:
	bts r12,2
LB_48507:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48504
	btr r12,1
	jmp LB_48505
LB_48504:
	bts r12,1
LB_48505:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48502
	btr r12,0
	jmp LB_48503
LB_48502:
	bts r12,0
LB_48503:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_48497
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_48540
	btr r12,4
	jmp LB_48541
LB_48540:
	bts r12,4
LB_48541:
	mov r14,r8
	bt r12,2
	jc LB_48542
	btr r12,1
	jmp LB_48543
LB_48542:
	bts r12,1
LB_48543:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_48112 : %_48112
 ; {>  %_48110~0':_r64 %_48111~1':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_48112
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f39 { %_48112 %_48110 } ⊢ { %_48113 %_48114 } : { %_48113 %_48114 }
 ; {>  %_48110~0':_r64 %_48112~2':_r64 %_48111~1':_r64 }
	add r8,r13
; _f39 { %_48113 %_48111 } ⊢ { %_48115 %_48116 } : { %_48115 %_48116 }
 ; {>  %_48114~0':_r64 %_48111~1':_r64 %_48113~2':_r64 }
	add r8,r14
; _some %_48115 ⊢ %_48117 : %_48117
 ; {>  %_48115~2':_r64 %_48116~1':_r64 %_48114~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_48117
 ; {>  %_48117~°0◂2':(_opn)◂(_r64) %_48116~1':_r64 %_48114~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_48493
	mov rdi,r14
	call dlt
LB_48493:
	bt r12,0
	jc LB_48494
	mov rdi,r13
	call dlt
LB_48494:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_48495
	btr r12,3
	jmp LB_48496
LB_48495:
	bts r12,3
LB_48496:
	mov r8,0
	bts r12,2
	ret
LB_48497:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48499
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48498
LB_48499:
	add rsp,8
	ret
LB_48501:
	add rsp,64
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
LB_48500:
	add rsp,64
	pop r14
LB_48498:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_48049_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48606
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48553
LB_48606:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_48614
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_48614
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_48614
	jmp LB_48615
LB_48614:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48612
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48612:
	jmp LB_48553
LB_48615:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_48049_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48570
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48571
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48571:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48572
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48572:
	jmp LB_48554
LB_48570:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_48582
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_48582
	jmp LB_48583
LB_48582:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48578
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48578:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48579
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48579:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48580
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48580:
	jmp LB_48554
LB_48583:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_48051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48587
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_48588
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_48588:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48589
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48589:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48590
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48590:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48591
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48591:
	jmp LB_48554
LB_48587:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_48051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48596
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_48597
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_48597:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_48598
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_48598:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_48599
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_48599:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48600
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48600:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48601
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48601:
	jmp LB_48554
LB_48596:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_48565
	btr r12,5
	jmp LB_48566
LB_48565:
	bts r12,5
LB_48566:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_48563
	btr r12,4
	jmp LB_48564
LB_48563:
	bts r12,4
LB_48564:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_48561
	btr r12,3
	jmp LB_48562
LB_48561:
	bts r12,3
LB_48562:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48559
	btr r12,2
	jmp LB_48560
LB_48559:
	bts r12,2
LB_48560:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48557
	btr r12,1
	jmp LB_48558
LB_48557:
	bts r12,1
LB_48558:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48555
	btr r12,0
	jmp LB_48556
LB_48555:
	bts r12,0
LB_48556:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_48550
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_48616
	btr r12,6
	jmp LB_48617
LB_48616:
	bts r12,6
LB_48617:
	mov r9,r11
	bt r12,5
	jc LB_48618
	btr r12,3
	jmp LB_48619
LB_48618:
	bts r12,3
LB_48619:
	mov r11,r8
	bt r12,2
	jc LB_48620
	btr r12,5
	jmp LB_48621
LB_48620:
	bts r12,5
LB_48621:
	mov r8,r10
	bt r12,4
	jc LB_48622
	btr r12,2
	jmp LB_48623
LB_48622:
	bts r12,2
LB_48623:
	mov r10,r14
	bt r12,1
	jc LB_48624
	btr r12,4
	jmp LB_48625
LB_48624:
	bts r12,4
LB_48625:
	mov r14,r11
	bt r12,5
	jc LB_48626
	btr r12,1
	jmp LB_48627
LB_48626:
	bts r12,1
LB_48627:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_48122 : %_48122
 ; {>  %_48121~3':_r64 %_48120~2':_r64 %_48119~1':_r64 %_48118~0':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_48122
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f39 { %_48122 %_48118 } ⊢ { %_48123 %_48124 } : { %_48123 %_48124 }
 ; {>  %_48121~3':_r64 %_48122~4':_r64 %_48120~2':_r64 %_48119~1':_r64 %_48118~0':_r64 }
	add r10,r13
; _f39 { %_48123 %_48119 } ⊢ { %_48125 %_48126 } : { %_48125 %_48126 }
 ; {>  %_48121~3':_r64 %_48120~2':_r64 %_48119~1':_r64 %_48124~0':_r64 %_48123~4':_r64 }
	add r10,r14
; _f39 { %_48125 %_48120 } ⊢ { %_48127 %_48128 } : { %_48127 %_48128 }
 ; {>  %_48121~3':_r64 %_48120~2':_r64 %_48126~1':_r64 %_48124~0':_r64 %_48125~4':_r64 }
	add r10,r8
; _f39 { %_48127 %_48121 } ⊢ { %_48129 %_48130 } : { %_48129 %_48130 }
 ; {>  %_48121~3':_r64 %_48126~1':_r64 %_48124~0':_r64 %_48128~2':_r64 %_48127~4':_r64 }
	add r10,r9
; _some %_48129 ⊢ %_48131 : %_48131
 ; {>  %_48130~3':_r64 %_48126~1':_r64 %_48124~0':_r64 %_48129~4':_r64 %_48128~2':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_48131
 ; {>  %_48130~3':_r64 %_48131~°0◂4':(_opn)◂(_r64) %_48126~1':_r64 %_48124~0':_r64 %_48128~2':_r64 }
; 	∎ °0◂4'
	bt r12,3
	jc LB_48544
	mov rdi,r9
	call dlt
LB_48544:
	bt r12,1
	jc LB_48545
	mov rdi,r14
	call dlt
LB_48545:
	bt r12,0
	jc LB_48546
	mov rdi,r13
	call dlt
LB_48546:
	bt r12,2
	jc LB_48547
	mov rdi,r8
	call dlt
LB_48547:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_48548
	btr r12,3
	jmp LB_48549
LB_48548:
	bts r12,3
LB_48549:
	mov r8,0
	bts r12,2
	ret
LB_48550:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48552
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48551
LB_48552:
	add rsp,8
	ret
LB_48554:
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
LB_48553:
	add rsp,96
	pop r14
LB_48551:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_48048_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48642
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48634
LB_48642:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_48051_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48647
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48648
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48648:
	jmp LB_48634
LB_48647:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48637
	btr r12,1
	jmp LB_48638
LB_48637:
	bts r12,1
LB_48638:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48635
	btr r12,0
	jmp LB_48636
LB_48635:
	bts r12,0
LB_48636:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_48631
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f39 { %_48132 %_48133 } ⊢ { %_48134 %_48135 } : { %_48134 %_48135 }
 ; {>  %_48133~1':_r64 %_48132~0':_r64 }
	add r13,r14
; _some %_48134 ⊢ %_48136 : %_48136
 ; {>  %_48135~1':_r64 %_48134~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_48136
 ; {>  %_48136~°0◂0':(_opn)◂(_r64) %_48135~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_48628
	mov rdi,r14
	call dlt
LB_48628:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48629
	btr r12,3
	jmp LB_48630
LB_48629:
	bts r12,3
LB_48630:
	mov r8,0
	bts r12,2
	ret
LB_48631:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48633
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48632
LB_48633:
	add rsp,8
	ret
LB_48634:
	add rsp,32
	pop r14
LB_48632:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_48672:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_48672:
MTC_LB_48673:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_48674
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
	jnc LB_48675
	bt QWORD [rax],0
	jc LB_48676
	btr r12,7
	jmp LB_48677
LB_48676:
	bts r12,7
LB_48677:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_48675:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_48680
	btr r12,8
	jmp LB_48681
LB_48680:
	bts r12,8
LB_48681:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_48678
	btr r12,5
	jmp LB_48679
LB_48678:
	bts r12,5
LB_48679:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_48684
	btr r12,8
	jmp LB_48685
LB_48684:
	bts r12,8
LB_48685:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_48682
	btr r12,6
	jmp LB_48683
LB_48682:
	bts r12,6
LB_48683:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_48686:
	cmp r15,0
	jz LB_48687
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48686
LB_48687:
MTC_LB_48688:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_48689
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
	jnc LB_48690
	bt QWORD [rax],0
	jc LB_48691
	btr r12,7
	jmp LB_48692
LB_48691:
	bts r12,7
LB_48692:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_48690:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_48693
	btr r12,4
	jmp LB_48694
LB_48693:
	bts r12,4
LB_48694:
LB_48695:
	cmp r15,0
	jz LB_48696
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48695
LB_48696:
; _f41 %_48657 ⊢ { %_48658 %_48659 } : { %_48658 %_48659 }
 ; {>  %_48657~4':_r64 %_48656~6':(_lst)◂(_p48045) %_48650~0':_stg %_48651~1':_r64 %_48653~3':_r64 %_48652~2':_stg }
	mov r11,r10
	bts r12,5
; _f23 { %_48659 %_48650 %_48651 %_48652 %_48653 } ⊢ { %_48660 %_48661 %_48662 %_48663 %_48664 } : { %_48660 %_48661 %_48662 %_48663 %_48664 }
 ; {>  %_48659~5':_r64 %_48656~6':(_lst)◂(_p48045) %_48650~0':_stg %_48651~1':_r64 %_48653~3':_r64 %_48658~4':_r64 %_48652~2':_stg }
; _f23 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_48701
	btr r12,4
	jmp LB_48702
LB_48701:
	bts r12,4
LB_48702:
	mov r9,r8
	bt r12,2
	jc LB_48703
	btr r12,3
	jmp LB_48704
LB_48703:
	bts r12,3
LB_48704:
	mov r8,r14
	bt r12,1
	jc LB_48705
	btr r12,2
	jmp LB_48706
LB_48705:
	bts r12,2
LB_48706:
	mov r14,r13
	bt r12,0
	jc LB_48707
	btr r12,1
	jmp LB_48708
LB_48707:
	bts r12,1
LB_48708:
	mov r13,r11
	bt r12,5
	jc LB_48709
	btr r12,0
	jmp LB_48710
LB_48709:
	bts r12,0
LB_48710:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_48711
	btr r12,5
	jmp LB_48712
LB_48711:
	bts r12,5
LB_48712:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_48699
	btr r12,6
	jmp LB_48700
LB_48699:
	bts r12,6
LB_48700:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_48697
	btr r12,4
	jmp LB_48698
LB_48697:
	bts r12,4
LB_48698:
	add rsp,24
; _f48672 { %_48661 %_48662 %_48663 %_48664 %_48656 } ⊢ { %_48665 %_48666 } : { %_48665 %_48666 }
 ; {>  %_48662~2':_r64 %_48663~3':_stg %_48661~1':_stg %_48656~6':(_lst)◂(_p48045) %_48660~0':_r64 %_48658~4':_r64 %_48664~5':_r64 }
; _f48672 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_48717
	btr r12,0
	jmp LB_48718
LB_48717:
	bts r12,0
LB_48718:
	mov r14,r8
	bt r12,2
	jc LB_48719
	btr r12,1
	jmp LB_48720
LB_48719:
	bts r12,1
LB_48720:
	mov r8,r9
	bt r12,3
	jc LB_48721
	btr r12,2
	jmp LB_48722
LB_48721:
	bts r12,2
LB_48722:
	mov r9,r11
	bt r12,5
	jc LB_48723
	btr r12,3
	jmp LB_48724
LB_48723:
	bts r12,3
LB_48724:
	mov r10,rcx
	bt r12,6
	jc LB_48725
	btr r12,4
	jmp LB_48726
LB_48725:
	bts r12,4
LB_48726:
	call NS_E_48672
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_48727
	btr r12,2
	jmp LB_48728
LB_48727:
	bts r12,2
LB_48728:
	mov r14,r13
	bt r12,0
	jc LB_48729
	btr r12,1
	jmp LB_48730
LB_48729:
	bts r12,1
LB_48730:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_48715
	btr r12,4
	jmp LB_48716
LB_48715:
	bts r12,4
LB_48716:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_48713
	btr r12,0
	jmp LB_48714
LB_48713:
	bts r12,0
LB_48714:
	add rsp,24
; ∎ { %_48665 %_48666 }
 ; {>  %_48665~1':_stg %_48660~0':_r64 %_48658~4':_r64 %_48666~2':_stg }
; 	∎ { 1' 2' }
	bt r12,0
	jc LB_48731
	mov rdi,r13
	call dlt
LB_48731:
	bt r12,4
	jc LB_48732
	mov rdi,r10
	call dlt
LB_48732:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_48733
	btr r12,0
	jmp LB_48734
LB_48733:
	bts r12,0
LB_48734:
	mov r14,r8
	bt r12,2
	jc LB_48735
	btr r12,1
	jmp LB_48736
LB_48735:
	bts r12,1
LB_48736:
	ret
MTC_LB_48689:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_48737
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
	jnc LB_48738
	bt QWORD [rax],0
	jc LB_48739
	btr r12,7
	jmp LB_48740
LB_48739:
	bts r12,7
LB_48740:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_48738:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_48741
	btr r12,4
	jmp LB_48742
LB_48741:
	bts r12,4
LB_48742:
LB_48743:
	cmp r15,0
	jz LB_48744
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48743
LB_48744:
; _f39 { %_48651 %_48667 } ⊢ { %_48668 %_48669 } : { %_48668 %_48669 }
 ; {>  %_48656~6':(_lst)◂(_p48045) %_48650~0':_stg %_48651~1':_r64 %_48653~3':_r64 %_48652~2':_stg %_48667~4':_r64 }
	add r14,r10
; _f48672 { %_48650 %_48668 %_48652 %_48653 %_48656 } ⊢ { %_48670 %_48671 } : { %_48670 %_48671 }
 ; {>  %_48669~4':_r64 %_48656~6':(_lst)◂(_p48045) %_48650~0':_stg %_48653~3':_r64 %_48652~2':_stg %_48668~1':_r64 }
; _f48672 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_48747
	btr r12,4
	jmp LB_48748
LB_48747:
	bts r12,4
LB_48748:
	call NS_E_48672
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_48745
	btr r12,4
	jmp LB_48746
LB_48745:
	bts r12,4
LB_48746:
	add rsp,16
; ∎ { %_48670 %_48671 }
 ; {>  %_48669~4':_r64 %_48671~1':_stg %_48670~0':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_48749
	mov rdi,r10
	call dlt
LB_48749:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_48737:
MTC_LB_48674:
	mov r15,0
LB_48751:
	cmp r15,0
	jz LB_48752
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48751
LB_48752:
; ∎ { %_48650 %_48652 }
 ; {>  %_48650~0':_stg %_48651~1':_r64 %_48653~3':_r64 %_48654~4':(_lst)◂(_p48045) %_48652~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_48753
	mov rdi,r14
	call dlt
LB_48753:
	bt r12,3
	jc LB_48754
	mov rdi,r9
	call dlt
LB_48754:
	bt r12,4
	jc LB_48755
	mov rdi,r10
	call dlt
LB_48755:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_48756
	btr r12,1
	jmp LB_48757
LB_48756:
	bts r12,1
LB_48757:
	ret
MTC_LB_48750:
NS_E_48773:
; 	|» 0'
NS_E_RDI_48773:
; » 0xr0 |~ {  } ⊢ %_48759 : %_48759
 ; {>  %_48758~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_48759
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f48050 { %_48758 %_48759 } ⊢ { %_48760 %_48761 %_48762 } : { %_48760 %_48761 %_48762 }
 ; {>  %_48758~0':_stg %_48759~1':_r64 }
; _f48050 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_48050
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_48774
	btr r12,4
	jmp LB_48775
LB_48774:
	bts r12,4
LB_48775:
	mov r8,r9
	bt r12,3
	jc LB_48778
	btr r12,2
	jmp LB_48779
LB_48778:
	bts r12,2
LB_48779:
	mov rsi,1
	bt r12,2
	jc LB_48776
	mov rsi,0
	bt r8,0
	jc LB_48776
	jmp LB_48777
LB_48776:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_48777:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_48780:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_48781
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
	jnc LB_48782
	bt QWORD [rax],0
	jc LB_48783
	btr r12,5
	jmp LB_48784
LB_48783:
	bts r12,5
LB_48784:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_48782:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_48787
	btr r12,6
	jmp LB_48788
LB_48787:
	bts r12,6
LB_48788:
	mov r9,rcx
	bt r12,6
	jc LB_48785
	btr r12,3
	jmp LB_48786
LB_48785:
	bts r12,3
LB_48786:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_48791
	btr r12,6
	jmp LB_48792
LB_48791:
	bts r12,6
LB_48792:
	mov r10,rcx
	bt r12,6
	jc LB_48789
	btr r12,4
	jmp LB_48790
LB_48789:
	bts r12,4
LB_48790:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_48793:
	cmp r15,0
	jz LB_48794
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48793
LB_48794:
; _f19 %_48763 ⊢ { %_48765 %_48766 } : { %_48765 %_48766 }
 ; {>  %_48763~3':_r64 %_48764~4':(_lst)◂(_p48045) %_48761~1':_r64 %_48760~0':_stg }
; _f19 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_48801
	btr r12,0
	jmp LB_48802
LB_48801:
	bts r12,0
LB_48802:
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_48803
	btr r12,2
	jmp LB_48804
LB_48803:
	bts r12,2
LB_48804:
	mov r9,r14
	bt r12,1
	jc LB_48805
	btr r12,3
	jmp LB_48806
LB_48805:
	bts r12,3
LB_48806:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_48799
	btr r12,4
	jmp LB_48800
LB_48799:
	bts r12,4
LB_48800:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_48797
	btr r12,1
	jmp LB_48798
LB_48797:
	bts r12,1
LB_48798:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_48795
	btr r12,0
	jmp LB_48796
LB_48795:
	bts r12,0
LB_48796:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_48767 : %_48767
 ; {>  %_48765~2':_r64 %_48764~4':(_lst)◂(_p48045) %_48766~3':_stg %_48761~1':_r64 %_48760~0':_stg }
; 	» 0xr0 _ ⊢ 5' : %_48767
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_48768 : %_48768
 ; {>  %_48765~2':_r64 %_48764~4':(_lst)◂(_p48045) %_48766~3':_stg %_48761~1':_r64 %_48760~0':_stg %_48767~5':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_48768
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f48672 { %_48760 %_48767 %_48766 %_48768 %_48764 } ⊢ { %_48769 %_48770 } : { %_48769 %_48770 }
 ; {>  %_48765~2':_r64 %_48764~4':(_lst)◂(_p48045) %_48768~6':_r64 %_48766~3':_stg %_48761~1':_r64 %_48760~0':_stg %_48767~5':_r64 }
; _f48672 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_48811
	btr r12,1
	jmp LB_48812
LB_48811:
	bts r12,1
LB_48812:
	mov r8,r9
	bt r12,3
	jc LB_48813
	btr r12,2
	jmp LB_48814
LB_48813:
	bts r12,2
LB_48814:
	mov r9,rcx
	bt r12,6
	jc LB_48815
	btr r12,3
	jmp LB_48816
LB_48815:
	bts r12,3
LB_48816:
	call NS_E_48672
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_48817
	btr r12,3
	jmp LB_48818
LB_48817:
	bts r12,3
LB_48818:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_48809
	btr r12,2
	jmp LB_48810
LB_48809:
	bts r12,2
LB_48810:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_48807
	btr r12,1
	jmp LB_48808
LB_48807:
	bts r12,1
LB_48808:
	add rsp,24
; _some %_48770 ⊢ %_48771 : %_48771
 ; {>  %_48765~2':_r64 %_48770~3':_stg %_48761~1':_r64 %_48769~0':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_48769 %_48771 }
 ; {>  %_48771~°0◂3':(_opn)◂(_stg) %_48765~2':_r64 %_48761~1':_r64 %_48769~0':_stg }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_48819
	mov rdi,r8
	call dlt
LB_48819:
	bt r12,1
	jc LB_48820
	mov rdi,r14
	call dlt
LB_48820:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_48823
	btr r12,1
	jmp LB_48824
LB_48823:
	bts r12,1
LB_48824:
	mov rsi,1
	bt r12,1
	jc LB_48821
	mov rsi,0
	bt r14,0
	jc LB_48821
	jmp LB_48822
LB_48821:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_48822:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_48781:
	mov r15,0
LB_48826:
	cmp r15,0
	jz LB_48827
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_48826
LB_48827:
; _none {  } ⊢ %_48772 : %_48772
 ; {>  %_48762~2':(_opn)◂({ _r64 (_lst)◂(_p48045) }) %_48761~1':_r64 %_48760~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ { %_48760 %_48772 }
 ; {>  %_48762~2':(_opn)◂({ _r64 (_lst)◂(_p48045) }) %_48772~°1◂{  }:(_opn)◂(t16134'(0)) %_48761~1':_r64 %_48760~0':_stg }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_48828
	mov rdi,r8
	call dlt
LB_48828:
	bt r12,1
	jc LB_48829
	mov rdi,r14
	call dlt
LB_48829:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_48830
	mov rsi,0
	bt r14,0
	jc LB_48830
	jmp LB_48831
LB_48830:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_48831:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_48825:
NS_E_48835:
NS_E_RDI_48835:
; » _^ ..
	mov rax,70
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "## FEFEF \n"
	mov rsi,0x_46_45_46_45_46_20_23_23
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "HELLO \n"
	mov rsi,0x_48
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_45
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_4c
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_4c
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_4f
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\\[ \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "fdEF \n"
	mov rsi,0x_66
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_64
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_45
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_46
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; "\\[ \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "F fe \n"
	mov rsi,0x_46
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_65
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; "\\] \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "\\]\n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; "WORlD \n"
	mov rsi,0x_57
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_4f
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_52
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_6c
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_44
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "## huugugugu\t\t\t\t\t\t\n"
	mov rsi,0x_75_67_75_75_68_20_23_23
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09_09_09_09_75_67_75_67
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+2],sil
	add rdi,19
; //
	mov r13,rax
	btr r12,0
; _f48773 %_48832 ⊢ { %_48833 %_48834 } : { %_48833 %_48834 }
 ; {>  %_48832~0':_stg }
; _f48773 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_48773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_48834~1':(_opn)◂(_stg) %_48833~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_48836
	mov rdi,r14
	call dlt
LB_48836:
	bt r12,0
	jc LB_48837
	mov rdi,r13
	call dlt
LB_48837:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_48838:
NS_E_RDI_48838:
NS_E_48838_ETR_TBL:
NS_E_48838_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	jmp LB_48867
LB_48866:
	add r14,1
LB_48867:
	cmp r14,r10
	jge LB_48868
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48866
	cmp al,10
	jz LB_48866
	cmp al,32
	jz LB_48866
LB_48868:
	push r10
	call NS_E_47708_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48869
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48859
LB_48869:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_48872
LB_48871:
	add r14,1
LB_48872:
	cmp r14,r10
	jge LB_48873
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48871
	cmp al,10
	jz LB_48871
	cmp al,32
	jz LB_48871
LB_48873:
	add r14,1
	cmp r14,r10
	jg LB_48877
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_48877
	jmp LB_48878
LB_48877:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48875
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48875:
	jmp LB_48859
LB_48878:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_48880
LB_48879:
	add r14,1
LB_48880:
	cmp r14,r10
	jge LB_48881
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48879
	cmp al,10
	jz LB_48879
	cmp al,32
	jz LB_48879
LB_48881:
	push r10
	call NS_E_48838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48882
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_48883
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_48883:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48884
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48884:
	jmp LB_48859
LB_48882:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_48864
	btr r12,2
	jmp LB_48865
LB_48864:
	bts r12,2
LB_48865:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48862
	btr r12,1
	jmp LB_48863
LB_48862:
	bts r12,1
LB_48863:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48860
	btr r12,0
	jmp LB_48861
LB_48860:
	bts r12,0
LB_48861:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_48856
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_48886
	btr r12,3
	jmp LB_48887
LB_48886:
	bts r12,3
LB_48887:
	mov r14,r8
	bt r12,2
	jc LB_48888
	btr r12,1
	jmp LB_48889
LB_48888:
	bts r12,1
LB_48889:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47767 { %_48839 %_48840 } ⊢ %_48841 : %_48841
 ; {>  %_48839~0':_stg %_48840~1':_p47766 }
; _f47767 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_48841 ⊢ %_48842 : %_48842
 ; {>  %_48841~°0◂{ 0' 1' }:_p47766 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_48842
 ; {>  %_48842~°0◂°0◂{ 0' 1' }:(_opn)◂(_p47766) }
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
	jc LB_48850
	btr r12,2
	jmp LB_48851
LB_48850:
	bts r12,2
LB_48851:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_48848
	btr QWORD [rdi],0
	jmp LB_48849
LB_48848:
	bts QWORD [rdi],0
LB_48849:
	mov r8,r14
	bt r12,1
	jc LB_48854
	btr r12,2
	jmp LB_48855
LB_48854:
	bts r12,2
LB_48855:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_48852
	btr QWORD [rdi],1
	jmp LB_48853
LB_48852:
	bts QWORD [rdi],1
LB_48853:
	mov rsi,1
	bt r12,3
	jc LB_48846
	mov rsi,0
	bt r9,0
	jc LB_48846
	jmp LB_48847
LB_48846:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48847:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48856:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48858
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48857
LB_48858:
	add rsp,8
	ret
LB_48859:
	add rsp,48
	pop r14
LB_48857:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_48901
LB_48900:
	add r14,1
LB_48901:
	cmp r14,r10
	jge LB_48902
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48900
	cmp al,32
	jz LB_48900
LB_48902:
	push r10
	call NS_E_47708_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48903
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48897
LB_48903:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48898
	btr r12,0
	jmp LB_48899
LB_48898:
	bts r12,0
LB_48899:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48894
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47768 %_48843 ⊢ %_48844 : %_48844
 ; {>  %_48843~0':_stg }
; _f47768 0' ⊢ °1◂0'
; _some %_48844 ⊢ %_48845 : %_48845
 ; {>  %_48844~°1◂0':_p47766 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_48845
 ; {>  %_48845~°0◂°1◂0':(_opn)◂(_p47766) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48892
	btr r12,3
	jmp LB_48893
LB_48892:
	bts r12,3
LB_48893:
	mov rsi,1
	bt r12,3
	jc LB_48890
	mov rsi,0
	bt r9,0
	jc LB_48890
	jmp LB_48891
LB_48890:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48891:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48894:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48896
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48895
LB_48896:
	add rsp,8
	ret
LB_48897:
	add rsp,16
	pop r14
LB_48895:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_48905:
NS_E_RDI_48905:
NS_E_48905_ETR_TBL:
NS_E_48905_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_47090_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48930
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48922
LB_48930:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_48938
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_48938
	jmp LB_48939
LB_48938:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_48936
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_48936:
	jmp LB_48922
LB_48939:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48925
	btr r12,1
	jmp LB_48926
LB_48925:
	bts r12,1
LB_48926:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48923
	btr r12,0
	jmp LB_48924
LB_48923:
	bts r12,0
LB_48924:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_48919
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47844 %_48906 ⊢ %_48907 : %_48907
 ; {>  %_48906~0':_r64 }
; _f47844 0' ⊢ °0◂0'
; _some %_48907 ⊢ %_48908 : %_48908
 ; {>  %_48907~°0◂0':_p47790 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_48908
 ; {>  %_48908~°0◂°0◂0':(_opn)◂(_p47790) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48917
	btr r12,3
	jmp LB_48918
LB_48917:
	bts r12,3
LB_48918:
	mov rsi,1
	bt r12,3
	jc LB_48915
	mov rsi,0
	bt r9,0
	jc LB_48915
	jmp LB_48916
LB_48915:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48916:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48919:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48921
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48920
LB_48921:
	add rsp,8
	ret
LB_48922:
	add rsp,32
	pop r14
LB_48920:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_47211_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48953
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48947
LB_48953:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48948
	btr r12,0
	jmp LB_48949
LB_48948:
	bts r12,0
LB_48949:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48944
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47845 %_48909 ⊢ %_48910 : %_48910
 ; {>  %_48909~0':_stg }
; _f47845 0' ⊢ °1◂0'
; _some %_48910 ⊢ %_48911 : %_48911
 ; {>  %_48910~°1◂0':_p47790 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_48911
 ; {>  %_48911~°0◂°1◂0':(_opn)◂(_p47790) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48942
	btr r12,3
	jmp LB_48943
LB_48942:
	bts r12,3
LB_48943:
	mov rsi,1
	bt r12,3
	jc LB_48940
	mov rsi,0
	bt r9,0
	jc LB_48940
	jmp LB_48941
LB_48940:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48941:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48944:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48946
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48945
LB_48946:
	add rsp,8
	ret
LB_48947:
	add rsp,16
	pop r14
LB_48945:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_48838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_48968
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48962
LB_48968:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48963
	btr r12,0
	jmp LB_48964
LB_48963:
	bts r12,0
LB_48964:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_48959
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47846 %_48912 ⊢ %_48913 : %_48913
 ; {>  %_48912~0':_p47766 }
; _f47846 0' ⊢ °2◂0'
; _some %_48913 ⊢ %_48914 : %_48914
 ; {>  %_48913~°2◂0':_p47790 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_48914
 ; {>  %_48914~°0◂°2◂0':(_opn)◂(_p47790) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_48957
	btr r12,3
	jmp LB_48958
LB_48957:
	bts r12,3
LB_48958:
	mov rsi,1
	bt r12,3
	jc LB_48955
	mov rsi,0
	bt r9,0
	jc LB_48955
	jmp LB_48956
LB_48955:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_48956:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_48959:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_48961
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_48960
LB_48961:
	add rsp,8
	ret
LB_48962:
	add rsp,16
	pop r14
LB_48960:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_48971:
NS_E_RDI_48971:
NS_E_48971_ETR_TBL:
NS_E_48971_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_48978
LB_48977:
	add r14,1
LB_48978:
	cmp r14,r10
	jge LB_48979
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48977
	cmp al,32
	jz LB_48977
LB_48979:
	add r14,1
	cmp r14,r10
	jg LB_48982
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_48982
	jmp LB_48983
LB_48982:
	jmp LB_48973
LB_48983:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ "\n" ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_48988:
	jmp LB_48985
LB_48984:
	add r14,1
LB_48985:
	cmp r14,r10
	jge LB_48986
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_48984
	cmp al,32
	jz LB_48984
LB_48986:
	add r14,1
	cmp r14,r10
	jg LB_48987
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_48987
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov [rax+8*1],rsi
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_48988
LB_48987:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_48974
	btr QWORD [rdi],1
LB_48974:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_48975
	btr QWORD [rdi],0
LB_48975:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_48973:
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
NS_E_48998:
; 	|» { 0' 1' }
NS_E_RDI_48998:
MTC_LB_48999:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_49000
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
	jnc LB_49001
	bt QWORD [rax],0
	jc LB_49002
	btr r12,4
	jmp LB_49003
LB_49002:
	bts r12,4
LB_49003:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_49001:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_49006
	btr r12,5
	jmp LB_49007
LB_49006:
	bts r12,5
LB_49007:
	mov r8,r11
	bt r12,5
	jc LB_49004
	btr r12,2
	jmp LB_49005
LB_49004:
	bts r12,2
LB_49005:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_49010
	btr r12,5
	jmp LB_49011
LB_49010:
	bts r12,5
LB_49011:
	mov r9,r11
	bt r12,5
	jc LB_49008
	btr r12,3
	jmp LB_49009
LB_49008:
	bts r12,3
LB_49009:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_49012:
	cmp r15,0
	jz LB_49013
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_49012
LB_49013:
; _f47841 { %_48992 %_48994 } ⊢ %_48996 : %_48996
 ; {>  %_48992~0':_p47789 %_48994~2':_p47789 %_48995~3':(_lst)◂(_p47789) }
; _f47841 { 0' 2' } ⊢ °1◂{ 0' 2' }
; _f48998 { %_48996 %_48995 } ⊢ %_48997 : %_48997
 ; {>  %_48996~°1◂{ 0' 2' }:_p47789 %_48995~3':(_lst)◂(_p47789) }
; _f48998 { °1◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °1◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_49014
	btr r12,1
	jmp LB_49015
LB_49014:
	bts r12,1
LB_49015:
	mov r9,r13
	bt r12,0
	jc LB_49016
	btr r12,3
	jmp LB_49017
LB_49016:
	bts r12,3
LB_49017:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_49022
	btr r12,4
	jmp LB_49023
LB_49022:
	bts r12,4
LB_49023:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_49020
	btr QWORD [rdi],0
	jmp LB_49021
LB_49020:
	bts QWORD [rdi],0
LB_49021:
	mov r10,r8
	bt r12,2
	jc LB_49026
	btr r12,4
	jmp LB_49027
LB_49026:
	bts r12,4
LB_49027:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_49024
	btr QWORD [rdi],1
	jmp LB_49025
LB_49024:
	bts QWORD [rdi],1
LB_49025:
	mov rsi,1
	bt r12,0
	jc LB_49018
	mov rsi,0
	bt r13,0
	jc LB_49018
	jmp LB_49019
LB_49018:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_49019:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_48998
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_48997
 ; {>  %_48997~0':_p47789 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_49000:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_49028
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
	jnc LB_49029
	bt QWORD [rax],0
	jc LB_49030
	btr r12,2
	jmp LB_49031
LB_49030:
	bts r12,2
LB_49031:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_49029:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_49032:
	cmp r15,0
	jz LB_49033
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_49032
LB_49033:
; ∎ %_48992
 ; {>  %_48992~0':_p47789 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_49028:
NS_E_49034:
NS_E_RDI_49034:
NS_E_49034_ETR_TBL:
NS_E_49034_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_49081
LB_49080:
	add r14,1
LB_49081:
	cmp r14,r10
	jge LB_49082
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49080
	cmp al,10
	jz LB_49080
	cmp al,32
	jz LB_49080
LB_49082:
	add r14,1
	cmp r14,r10
	jg LB_49085
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_49085
	jmp LB_49086
LB_49085:
	jmp LB_49073
LB_49086:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_49088
LB_49087:
	add r14,1
LB_49088:
	cmp r14,r10
	jge LB_49089
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49087
	cmp al,10
	jz LB_49087
	cmp al,32
	jz LB_49087
LB_49089:
	push r10
	call NS_E_49035_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49090
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49091
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49091:
	jmp LB_49073
LB_49090:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_49094
LB_49093:
	add r14,1
LB_49094:
	cmp r14,r10
	jge LB_49095
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49093
	cmp al,10
	jz LB_49093
	cmp al,32
	jz LB_49093
LB_49095:
	add r14,1
	cmp r14,r10
	jg LB_49100
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_49100
	jmp LB_49101
LB_49100:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_49097
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_49097:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49098
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49098:
	jmp LB_49073
LB_49101:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_49078
	btr r12,2
	jmp LB_49079
LB_49078:
	bts r12,2
LB_49079:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49076
	btr r12,1
	jmp LB_49077
LB_49076:
	bts r12,1
LB_49077:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49074
	btr r12,0
	jmp LB_49075
LB_49074:
	bts r12,0
LB_49075:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_49070
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_49102
	btr r12,3
	jmp LB_49103
LB_49102:
	bts r12,3
LB_49103:
	mov r13,r14
	bt r12,1
	jc LB_49104
	btr r12,0
	jmp LB_49105
LB_49104:
	bts r12,0
LB_49105:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47836 %_49038 ⊢ %_49039 : %_49039
 ; {>  %_49038~0':(_lst)◂(_p47787) }
; _f47836 0' ⊢ °0◂0'
; _some %_49039 ⊢ %_49040 : %_49040
 ; {>  %_49039~°0◂0':_p47787 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_49040
 ; {>  %_49040~°0◂°0◂0':(_opn)◂(_p47787) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49068
	btr r12,3
	jmp LB_49069
LB_49068:
	bts r12,3
LB_49069:
	mov rsi,1
	bt r12,3
	jc LB_49066
	mov rsi,0
	bt r9,0
	jc LB_49066
	jmp LB_49067
LB_49066:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49067:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49070:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49072
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49071
LB_49072:
	add rsp,8
	ret
LB_49073:
	add rsp,48
	pop r14
LB_49071:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; src
	jmp LB_49117
LB_49116:
	add r14,1
LB_49117:
	cmp r14,r10
	jge LB_49118
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49116
	cmp al,10
	jz LB_49116
	cmp al,32
	jz LB_49116
LB_49118:
	push r10
	call NS_E_49037_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49119
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49113
LB_49119:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49114
	btr r12,0
	jmp LB_49115
LB_49114:
	bts r12,0
LB_49115:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_49110
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47837 %_49041 ⊢ %_49042 : %_49042
 ; {>  %_49041~0':_p47785 }
; _f47837 0' ⊢ °1◂0'
; _some %_49042 ⊢ %_49043 : %_49043
 ; {>  %_49042~°1◂0':_p47787 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_49043
 ; {>  %_49043~°0◂°1◂0':(_opn)◂(_p47787) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49108
	btr r12,3
	jmp LB_49109
LB_49108:
	bts r12,3
LB_49109:
	mov rsi,1
	bt r12,3
	jc LB_49106
	mov rsi,0
	bt r9,0
	jc LB_49106
	jmp LB_49107
LB_49106:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49107:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49110:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49112
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49111
LB_49112:
	add rsp,8
	ret
LB_49113:
	add rsp,16
	pop r14
LB_49111:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49035:
NS_E_RDI_49035:
NS_E_49035_ETR_TBL:
NS_E_49035_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; src_ptn
	jmp LB_49140
LB_49139:
	add r14,1
LB_49140:
	cmp r14,r10
	jge LB_49141
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49139
	cmp al,10
	jz LB_49139
	cmp al,32
	jz LB_49139
LB_49141:
	push r10
	call NS_E_49034_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49142
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49134
LB_49142:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_49145
LB_49144:
	add r14,1
LB_49145:
	cmp r14,r10
	jge LB_49146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49144
	cmp al,10
	jz LB_49144
	cmp al,32
	jz LB_49144
LB_49146:
	push r10
	call NS_E_49035_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49147
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49148
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49148:
	jmp LB_49134
LB_49147:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49137
	btr r12,1
	jmp LB_49138
LB_49137:
	bts r12,1
LB_49138:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49135
	btr r12,0
	jmp LB_49136
LB_49135:
	bts r12,0
LB_49136:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_49131
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_49044 %_49045 } ⊢ %_49046 : %_49046
 ; {>  %_49045~1':(_lst)◂(_p47787) %_49044~0':_p47787 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_49046 ⊢ %_49047 : %_49047
 ; {>  %_49046~°0◂{ 0' 1' }:(_lst)◂(_p47787) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_49047
 ; {>  %_49047~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p47787)) }
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
	jc LB_49125
	btr r12,2
	jmp LB_49126
LB_49125:
	bts r12,2
LB_49126:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_49123
	btr QWORD [rdi],0
	jmp LB_49124
LB_49123:
	bts QWORD [rdi],0
LB_49124:
	mov r8,r14
	bt r12,1
	jc LB_49129
	btr r12,2
	jmp LB_49130
LB_49129:
	bts r12,2
LB_49130:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_49127
	btr QWORD [rdi],1
	jmp LB_49128
LB_49127:
	bts QWORD [rdi],1
LB_49128:
	mov rsi,1
	bt r12,3
	jc LB_49121
	mov rsi,0
	bt r9,0
	jc LB_49121
	jmp LB_49122
LB_49121:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49122:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49131:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49133
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49132
LB_49133:
	add rsp,8
	ret
LB_49134:
	add rsp,32
	pop r14
LB_49132:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_49152
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_49048 : %_49048
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_49048 ⊢ %_49049 : %_49049
 ; {>  %_49048~°1◂{  }:(_lst)◂(t16240'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_49049
 ; {>  %_49049~°0◂°1◂{  }:(_opn)◂((_lst)◂(t16243'(0))) }
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
	jc LB_49150
	mov rsi,0
	bt r9,0
	jc LB_49150
	jmp LB_49151
LB_49150:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49151:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49152:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49154
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49153
LB_49154:
	add rsp,8
	ret
LB_49155:
	add rsp,0
	pop r14
LB_49153:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49036:
NS_E_RDI_49036:
NS_E_49036_ETR_TBL:
NS_E_49036_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_49193
LB_49192:
	add r14,1
LB_49193:
	cmp r14,r10
	jge LB_49194
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49192
	cmp al,10
	jz LB_49192
	cmp al,32
	jz LB_49192
LB_49194:
	add r14,1
	cmp r14,r10
	jg LB_49197
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_49197
	jmp LB_49198
LB_49197:
	jmp LB_49171
LB_49198:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_49180
LB_49179:
	add r14,1
LB_49180:
	cmp r14,r10
	jge LB_49181
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49179
	cmp al,10
	jz LB_49179
	cmp al,32
	jz LB_49179
LB_49181:
	push r10
	call NS_E_49037_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49182
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49183
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49183:
	jmp LB_49172
LB_49182:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_49186
LB_49185:
	add r14,1
LB_49186:
	cmp r14,r10
	jge LB_49187
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49185
	cmp al,10
	jz LB_49185
	cmp al,32
	jz LB_49185
LB_49187:
	push r10
	call NS_E_49036_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49188
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_49189
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_49189:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49190
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49190:
	jmp LB_49172
LB_49188:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_49177
	btr r12,2
	jmp LB_49178
LB_49177:
	bts r12,2
LB_49178:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49175
	btr r12,1
	jmp LB_49176
LB_49175:
	bts r12,1
LB_49176:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49173
	btr r12,0
	jmp LB_49174
LB_49173:
	bts r12,0
LB_49174:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_49168
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_49199
	btr r12,3
	jmp LB_49200
LB_49199:
	bts r12,3
LB_49200:
	mov r14,r8
	bt r12,2
	jc LB_49201
	btr r12,1
	jmp LB_49202
LB_49201:
	bts r12,1
LB_49202:
	mov r8,r13
	bt r12,0
	jc LB_49203
	btr r12,2
	jmp LB_49204
LB_49203:
	bts r12,2
LB_49204:
	mov r13,r9
	bt r12,3
	jc LB_49205
	btr r12,0
	jmp LB_49206
LB_49205:
	bts r12,0
LB_49206:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47837 %_49050 ⊢ %_49052 : %_49052
 ; {>  %_49050~0':_p47785 %_49051~1':(_lst)◂(_p47787) }
; _f47837 0' ⊢ °1◂0'
; _cns { %_49052 %_49051 } ⊢ %_49053 : %_49053
 ; {>  %_49052~°1◂0':_p47787 %_49051~1':(_lst)◂(_p47787) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_49053 ⊢ %_49054 : %_49054
 ; {>  %_49053~°0◂{ °1◂0' 1' }:(_lst)◂(_p47787) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_49054
 ; {>  %_49054~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p47787)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_49162
	btr r12,2
	jmp LB_49163
LB_49162:
	bts r12,2
LB_49163:
	mov rsi,1
	bt r12,2
	jc LB_49160
	mov rsi,0
	bt r8,0
	jc LB_49160
	jmp LB_49161
LB_49160:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_49161:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_49158
	btr QWORD [rdi],0
	jmp LB_49159
LB_49158:
	bts QWORD [rdi],0
LB_49159:
	mov r8,r14
	bt r12,1
	jc LB_49166
	btr r12,2
	jmp LB_49167
LB_49166:
	bts r12,2
LB_49167:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_49164
	btr QWORD [rdi],1
	jmp LB_49165
LB_49164:
	bts QWORD [rdi],1
LB_49165:
	mov rsi,1
	bt r12,3
	jc LB_49156
	mov rsi,0
	bt r9,0
	jc LB_49156
	jmp LB_49157
LB_49156:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49157:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49168:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49170
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49169
LB_49170:
	add rsp,8
	ret
LB_49172:
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
LB_49171:
	add rsp,48
	pop r14
LB_49169:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_49209
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_49055 : %_49055
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_49055 ⊢ %_49056 : %_49056
 ; {>  %_49055~°1◂{  }:(_lst)◂(t16254'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_49056
 ; {>  %_49056~°0◂°1◂{  }:(_opn)◂((_lst)◂(t16257'(0))) }
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
	jc LB_49207
	mov rsi,0
	bt r9,0
	jc LB_49207
	jmp LB_49208
LB_49207:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49208:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49209:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49211
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49210
LB_49211:
	add rsp,8
	ret
LB_49212:
	add rsp,0
	pop r14
LB_49210:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49037:
NS_E_RDI_49037:
NS_E_49037_ETR_TBL:
NS_E_49037_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "%["
	jmp LB_49228
LB_49227:
	add r14,1
LB_49228:
	cmp r14,r10
	jge LB_49229
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49227
	cmp al,10
	jz LB_49227
	cmp al,32
	jz LB_49227
LB_49229:
	add r14,2
	cmp r14,r10
	jg LB_49232
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_49232
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_49232
	jmp LB_49233
LB_49232:
	jmp LB_49220
LB_49233:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_49235
LB_49234:
	add r14,1
LB_49235:
	cmp r14,r10
	jge LB_49236
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49234
	cmp al,10
	jz LB_49234
	cmp al,32
	jz LB_49234
LB_49236:
	push r10
	call NS_E_48905_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49237
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49238
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49238:
	jmp LB_49220
LB_49237:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_49241
LB_49240:
	add r14,1
LB_49241:
	cmp r14,r10
	jge LB_49242
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49240
	cmp al,10
	jz LB_49240
	cmp al,32
	jz LB_49240
LB_49242:
	add r14,1
	cmp r14,r10
	jg LB_49247
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_49247
	jmp LB_49248
LB_49247:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_49244
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_49244:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49245
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49245:
	jmp LB_49220
LB_49248:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_49225
	btr r12,2
	jmp LB_49226
LB_49225:
	bts r12,2
LB_49226:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49223
	btr r12,1
	jmp LB_49224
LB_49223:
	bts r12,1
LB_49224:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49221
	btr r12,0
	jmp LB_49222
LB_49221:
	bts r12,0
LB_49222:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_49217
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_49249
	btr r12,3
	jmp LB_49250
LB_49249:
	bts r12,3
LB_49250:
	mov r13,r14
	bt r12,1
	jc LB_49251
	btr r12,0
	jmp LB_49252
LB_49251:
	bts r12,0
LB_49252:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47832 %_49057 ⊢ %_49058 : %_49058
 ; {>  %_49057~0':_p47790 }
; _f47832 0' ⊢ °0◂0'
; _some %_49058 ⊢ %_49059 : %_49059
 ; {>  %_49058~°0◂0':_p47785 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_49059
 ; {>  %_49059~°0◂°0◂0':(_opn)◂(_p47785) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49215
	btr r12,3
	jmp LB_49216
LB_49215:
	bts r12,3
LB_49216:
	mov rsi,1
	bt r12,3
	jc LB_49213
	mov rsi,0
	bt r9,0
	jc LB_49213
	jmp LB_49214
LB_49213:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49214:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49217:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49219
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49218
LB_49219:
	add rsp,8
	ret
LB_49220:
	add rsp,48
	pop r14
LB_49218:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_49277
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_49277
	jmp LB_49278
LB_49277:
	jmp LB_49260
LB_49278:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_47708_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49269
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49270
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49270:
	jmp LB_49261
LB_49269:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49264
	btr r12,1
	jmp LB_49265
LB_49264:
	bts r12,1
LB_49265:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49262
	btr r12,0
	jmp LB_49263
LB_49262:
	bts r12,0
LB_49263:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_49257
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_49279
	btr r12,2
	jmp LB_49280
LB_49279:
	bts r12,2
LB_49280:
	mov r13,r14
	bt r12,1
	jc LB_49281
	btr r12,0
	jmp LB_49282
LB_49281:
	bts r12,0
LB_49282:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47833 %_49060 ⊢ %_49061 : %_49061
 ; {>  %_49060~0':_stg }
; _f47833 0' ⊢ °1◂0'
; _some %_49061 ⊢ %_49062 : %_49062
 ; {>  %_49061~°1◂0':_p47785 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_49062
 ; {>  %_49062~°0◂°1◂0':(_opn)◂(_p47785) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49255
	btr r12,3
	jmp LB_49256
LB_49255:
	bts r12,3
LB_49256:
	mov rsi,1
	bt r12,3
	jc LB_49253
	mov rsi,0
	bt r9,0
	jc LB_49253
	jmp LB_49254
LB_49253:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49254:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49257:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49259
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49258
LB_49259:
	add rsp,8
	ret
LB_49261:
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
LB_49260:
	add rsp,32
	pop r14
LB_49258:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_49294
LB_49293:
	add r14,1
LB_49294:
	cmp r14,r10
	jge LB_49295
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49293
	cmp al,10
	jz LB_49293
	cmp al,32
	jz LB_49293
LB_49295:
	push r10
	call NS_E_47708_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49296
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49290
LB_49296:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49291
	btr r12,0
	jmp LB_49292
LB_49291:
	bts r12,0
LB_49292:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_49287
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47833 %_49063 ⊢ %_49064 : %_49064
 ; {>  %_49063~0':_stg }
; _f47833 0' ⊢ °1◂0'
; _some %_49064 ⊢ %_49065 : %_49065
 ; {>  %_49064~°1◂0':_p47785 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_49065
 ; {>  %_49065~°0◂°1◂0':(_opn)◂(_p47785) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49285
	btr r12,3
	jmp LB_49286
LB_49285:
	bts r12,3
LB_49286:
	mov rsi,1
	bt r12,3
	jc LB_49283
	mov rsi,0
	bt r9,0
	jc LB_49283
	jmp LB_49284
LB_49283:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49284:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49287:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49289
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49288
LB_49289:
	add rsp,8
	ret
LB_49290:
	add rsp,16
	pop r14
LB_49288:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49298:
NS_E_RDI_49298:
NS_E_49298_ETR_TBL:
NS_E_49298_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_49348
LB_49347:
	add r14,1
LB_49348:
	cmp r14,r10
	jge LB_49349
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49347
	cmp al,10
	jz LB_49347
	cmp al,32
	jz LB_49347
LB_49349:
	add r14,1
	cmp r14,r10
	jg LB_49352
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_49352
	jmp LB_49353
LB_49352:
	jmp LB_49340
LB_49353:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_49355
LB_49354:
	add r14,1
LB_49355:
	cmp r14,r10
	jge LB_49356
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49354
	cmp al,10
	jz LB_49354
	cmp al,32
	jz LB_49354
LB_49356:
	push r10
	call NS_E_49299_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49357
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49358
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49358:
	jmp LB_49340
LB_49357:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_49361
LB_49360:
	add r14,1
LB_49361:
	cmp r14,r10
	jge LB_49362
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49360
	cmp al,10
	jz LB_49360
	cmp al,32
	jz LB_49360
LB_49362:
	add r14,1
	cmp r14,r10
	jg LB_49367
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_49367
	jmp LB_49368
LB_49367:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_49364
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_49364:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49365
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49365:
	jmp LB_49340
LB_49368:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_49345
	btr r12,2
	jmp LB_49346
LB_49345:
	bts r12,2
LB_49346:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49343
	btr r12,1
	jmp LB_49344
LB_49343:
	bts r12,1
LB_49344:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49341
	btr r12,0
	jmp LB_49342
LB_49341:
	bts r12,0
LB_49342:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_49337
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_49369
	btr r12,3
	jmp LB_49370
LB_49369:
	bts r12,3
LB_49370:
	mov r13,r14
	bt r12,1
	jc LB_49371
	btr r12,0
	jmp LB_49372
LB_49371:
	bts r12,0
LB_49372:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47838 %_49304 ⊢ %_49305 : %_49305
 ; {>  %_49304~0':(_lst)◂(_p47788) }
; _f47838 0' ⊢ °0◂0'
; _some %_49305 ⊢ %_49306 : %_49306
 ; {>  %_49305~°0◂0':_p47788 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_49306
 ; {>  %_49306~°0◂°0◂0':(_opn)◂(_p47788) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49335
	btr r12,3
	jmp LB_49336
LB_49335:
	bts r12,3
LB_49336:
	mov rsi,1
	bt r12,3
	jc LB_49333
	mov rsi,0
	bt r9,0
	jc LB_49333
	jmp LB_49334
LB_49333:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49334:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49337:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49339
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49338
LB_49339:
	add rsp,8
	ret
LB_49340:
	add rsp,48
	pop r14
LB_49338:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dst
	jmp LB_49384
LB_49383:
	add r14,1
LB_49384:
	cmp r14,r10
	jge LB_49385
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49383
	cmp al,10
	jz LB_49383
	cmp al,32
	jz LB_49383
LB_49385:
	push r10
	call NS_E_49303_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49386
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49380
LB_49386:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49381
	btr r12,0
	jmp LB_49382
LB_49381:
	bts r12,0
LB_49382:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_49377
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47839 %_49307 ⊢ %_49308 : %_49308
 ; {>  %_49307~0':_p47786 }
; _f47839 0' ⊢ °1◂0'
; _some %_49308 ⊢ %_49309 : %_49309
 ; {>  %_49308~°1◂0':_p47788 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_49309
 ; {>  %_49309~°0◂°1◂0':(_opn)◂(_p47788) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49375
	btr r12,3
	jmp LB_49376
LB_49375:
	bts r12,3
LB_49376:
	mov rsi,1
	bt r12,3
	jc LB_49373
	mov rsi,0
	bt r9,0
	jc LB_49373
	jmp LB_49374
LB_49373:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49374:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49377:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49379
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49378
LB_49379:
	add rsp,8
	ret
LB_49380:
	add rsp,16
	pop r14
LB_49378:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49299:
NS_E_RDI_49299:
NS_E_49299_ETR_TBL:
NS_E_49299_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_49407
LB_49406:
	add r14,1
LB_49407:
	cmp r14,r10
	jge LB_49408
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49406
	cmp al,10
	jz LB_49406
	cmp al,32
	jz LB_49406
LB_49408:
	push r10
	call NS_E_49298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49409
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49401
LB_49409:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_49412
LB_49411:
	add r14,1
LB_49412:
	cmp r14,r10
	jge LB_49413
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49411
	cmp al,10
	jz LB_49411
	cmp al,32
	jz LB_49411
LB_49413:
	push r10
	call NS_E_49299_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49414
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49415
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49415:
	jmp LB_49401
LB_49414:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49404
	btr r12,1
	jmp LB_49405
LB_49404:
	bts r12,1
LB_49405:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49402
	btr r12,0
	jmp LB_49403
LB_49402:
	bts r12,0
LB_49403:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_49398
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_49310 %_49311 } ⊢ %_49312 : %_49312
 ; {>  %_49311~1':(_lst)◂(_p47788) %_49310~0':_p47788 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_49312 ⊢ %_49313 : %_49313
 ; {>  %_49312~°0◂{ 0' 1' }:(_lst)◂(_p47788) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_49313
 ; {>  %_49313~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p47788)) }
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
	jc LB_49392
	btr r12,2
	jmp LB_49393
LB_49392:
	bts r12,2
LB_49393:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_49390
	btr QWORD [rdi],0
	jmp LB_49391
LB_49390:
	bts QWORD [rdi],0
LB_49391:
	mov r8,r14
	bt r12,1
	jc LB_49396
	btr r12,2
	jmp LB_49397
LB_49396:
	bts r12,2
LB_49397:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_49394
	btr QWORD [rdi],1
	jmp LB_49395
LB_49394:
	bts QWORD [rdi],1
LB_49395:
	mov rsi,1
	bt r12,3
	jc LB_49388
	mov rsi,0
	bt r9,0
	jc LB_49388
	jmp LB_49389
LB_49388:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49389:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49398:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49400
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49399
LB_49400:
	add rsp,8
	ret
LB_49401:
	add rsp,32
	pop r14
LB_49399:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_49419
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_49314 : %_49314
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_49314 ⊢ %_49315 : %_49315
 ; {>  %_49314~°1◂{  }:(_lst)◂(t16342'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_49315
 ; {>  %_49315~°0◂°1◂{  }:(_opn)◂((_lst)◂(t16345'(0))) }
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
	jc LB_49417
	mov rsi,0
	bt r9,0
	jc LB_49417
	jmp LB_49418
LB_49417:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49418:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49419:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49421
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49420
LB_49421:
	add rsp,8
	ret
LB_49422:
	add rsp,0
	pop r14
LB_49420:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49301:
NS_E_RDI_49301:
NS_E_49301_ETR_TBL:
NS_E_49301_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_49445
LB_49444:
	add r14,1
LB_49445:
	cmp r14,r10
	jge LB_49446
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49444
	cmp al,10
	jz LB_49444
	cmp al,32
	jz LB_49444
LB_49446:
	add r14,1
	cmp r14,r10
	jg LB_49449
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_49449
	jmp LB_49450
LB_49449:
	jmp LB_49423
LB_49450:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_49432
LB_49431:
	add r14,1
LB_49432:
	cmp r14,r10
	jge LB_49433
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49431
	cmp al,10
	jz LB_49431
	cmp al,32
	jz LB_49431
LB_49433:
	push r10
	call NS_E_49298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49434
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49435
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49435:
	jmp LB_49424
LB_49434:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_49438
LB_49437:
	add r14,1
LB_49438:
	cmp r14,r10
	jge LB_49439
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49437
	cmp al,10
	jz LB_49437
	cmp al,32
	jz LB_49437
LB_49439:
	push r10
	call NS_E_49301_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49440
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_49441
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_49441:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49442
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49442:
	jmp LB_49424
LB_49440:
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
	jc LB_49427
	btr QWORD [rdi],2
LB_49427:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49428
	btr QWORD [rdi],1
LB_49428:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49429
	btr QWORD [rdi],0
LB_49429:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_49424:
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
LB_49423:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_49425:
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
NS_E_49302:
NS_E_RDI_49302:
NS_E_49302_ETR_TBL:
NS_E_49302_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_49488
LB_49487:
	add r14,1
LB_49488:
	cmp r14,r10
	jge LB_49489
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49487
	cmp al,10
	jz LB_49487
	cmp al,32
	jz LB_49487
LB_49489:
	add r14,1
	cmp r14,r10
	jg LB_49492
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_49492
	jmp LB_49493
LB_49492:
	jmp LB_49466
LB_49493:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_49475
LB_49474:
	add r14,1
LB_49475:
	cmp r14,r10
	jge LB_49476
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49474
	cmp al,10
	jz LB_49474
	cmp al,32
	jz LB_49474
LB_49476:
	push r10
	call NS_E_49303_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49477
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49478
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49478:
	jmp LB_49467
LB_49477:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_49481
LB_49480:
	add r14,1
LB_49481:
	cmp r14,r10
	jge LB_49482
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49480
	cmp al,10
	jz LB_49480
	cmp al,32
	jz LB_49480
LB_49482:
	push r10
	call NS_E_49302_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49483
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_49484
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_49484:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49485
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49485:
	jmp LB_49467
LB_49483:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_49472
	btr r12,2
	jmp LB_49473
LB_49472:
	bts r12,2
LB_49473:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49470
	btr r12,1
	jmp LB_49471
LB_49470:
	bts r12,1
LB_49471:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49468
	btr r12,0
	jmp LB_49469
LB_49468:
	bts r12,0
LB_49469:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_49463
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_49494
	btr r12,3
	jmp LB_49495
LB_49494:
	bts r12,3
LB_49495:
	mov r14,r8
	bt r12,2
	jc LB_49496
	btr r12,1
	jmp LB_49497
LB_49496:
	bts r12,1
LB_49497:
	mov r8,r13
	bt r12,0
	jc LB_49498
	btr r12,2
	jmp LB_49499
LB_49498:
	bts r12,2
LB_49499:
	mov r13,r9
	bt r12,3
	jc LB_49500
	btr r12,0
	jmp LB_49501
LB_49500:
	bts r12,0
LB_49501:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47839 %_49318 ⊢ %_49320 : %_49320
 ; {>  %_49318~0':_p47786 %_49319~1':(_lst)◂(_p47788) }
; _f47839 0' ⊢ °1◂0'
; _cns { %_49320 %_49319 } ⊢ %_49321 : %_49321
 ; {>  %_49320~°1◂0':_p47788 %_49319~1':(_lst)◂(_p47788) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_49321 ⊢ %_49322 : %_49322
 ; {>  %_49321~°0◂{ °1◂0' 1' }:(_lst)◂(_p47788) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_49322
 ; {>  %_49322~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p47788)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_49457
	btr r12,2
	jmp LB_49458
LB_49457:
	bts r12,2
LB_49458:
	mov rsi,1
	bt r12,2
	jc LB_49455
	mov rsi,0
	bt r8,0
	jc LB_49455
	jmp LB_49456
LB_49455:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_49456:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_49453
	btr QWORD [rdi],0
	jmp LB_49454
LB_49453:
	bts QWORD [rdi],0
LB_49454:
	mov r8,r14
	bt r12,1
	jc LB_49461
	btr r12,2
	jmp LB_49462
LB_49461:
	bts r12,2
LB_49462:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_49459
	btr QWORD [rdi],1
	jmp LB_49460
LB_49459:
	bts QWORD [rdi],1
LB_49460:
	mov rsi,1
	bt r12,3
	jc LB_49451
	mov rsi,0
	bt r9,0
	jc LB_49451
	jmp LB_49452
LB_49451:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49452:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49463:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49465
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49464
LB_49465:
	add rsp,8
	ret
LB_49467:
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
LB_49466:
	add rsp,48
	pop r14
LB_49464:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_49504
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_49323 : %_49323
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_49323 ⊢ %_49324 : %_49324
 ; {>  %_49323~°1◂{  }:(_lst)◂(t16356'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_49324
 ; {>  %_49324~°0◂°1◂{  }:(_opn)◂((_lst)◂(t16359'(0))) }
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
	jc LB_49502
	mov rsi,0
	bt r9,0
	jc LB_49502
	jmp LB_49503
LB_49502:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49503:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49504:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49506
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49505
LB_49506:
	add rsp,8
	ret
LB_49507:
	add rsp,0
	pop r14
LB_49505:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49303:
NS_E_RDI_49303:
NS_E_49303_ETR_TBL:
NS_E_49303_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_49532
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_49532
	jmp LB_49533
LB_49532:
	jmp LB_49515
LB_49533:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49524
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49525
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49525:
	jmp LB_49516
LB_49524:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49519
	btr r12,1
	jmp LB_49520
LB_49519:
	bts r12,1
LB_49520:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49517
	btr r12,0
	jmp LB_49518
LB_49517:
	bts r12,0
LB_49518:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_49512
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_49534
	btr r12,2
	jmp LB_49535
LB_49534:
	bts r12,2
LB_49535:
	mov r13,r14
	bt r12,1
	jc LB_49536
	btr r12,0
	jmp LB_49537
LB_49536:
	bts r12,0
LB_49537:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47835 %_49325 ⊢ %_49326 : %_49326
 ; {>  %_49325~0':_stg }
; _f47835 0' ⊢ °1◂0'
; _some %_49326 ⊢ %_49327 : %_49327
 ; {>  %_49326~°1◂0':_p47786 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_49327
 ; {>  %_49327~°0◂°1◂0':(_opn)◂(_p47786) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49510
	btr r12,3
	jmp LB_49511
LB_49510:
	bts r12,3
LB_49511:
	mov rsi,1
	bt r12,3
	jc LB_49508
	mov rsi,0
	bt r9,0
	jc LB_49508
	jmp LB_49509
LB_49508:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49509:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49512:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49514
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49513
LB_49514:
	add rsp,8
	ret
LB_49516:
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
LB_49515:
	add rsp,32
	pop r14
LB_49513:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49551
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49545
LB_49551:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49546
	btr r12,0
	jmp LB_49547
LB_49546:
	bts r12,0
LB_49547:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_49542
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47835 %_49328 ⊢ %_49329 : %_49329
 ; {>  %_49328~0':_stg }
; _f47835 0' ⊢ °1◂0'
; _some %_49329 ⊢ %_49330 : %_49330
 ; {>  %_49329~°1◂0':_p47786 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_49330
 ; {>  %_49330~°0◂°1◂0':(_opn)◂(_p47786) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49540
	btr r12,3
	jmp LB_49541
LB_49540:
	bts r12,3
LB_49541:
	mov rsi,1
	bt r12,3
	jc LB_49538
	mov rsi,0
	bt r9,0
	jc LB_49538
	jmp LB_49539
LB_49538:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49539:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49542:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49544
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49543
LB_49544:
	add rsp,8
	ret
LB_49545:
	add rsp,16
	pop r14
LB_49543:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_49566
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_49566
	jmp LB_49567
LB_49566:
	jmp LB_49558
LB_49567:
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
	jc LB_49559
	btr r12,0
	jmp LB_49560
LB_49559:
	bts r12,0
LB_49560:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_49555
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47834 {  } ⊢ %_49331 : %_49331
 ; {>  }
; _f47834 {  } ⊢ °0◂{  }
; _some %_49331 ⊢ %_49332 : %_49332
 ; {>  %_49331~°0◂{  }:_p47786 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_49332
 ; {>  %_49332~°0◂°0◂{  }:(_opn)◂(_p47786) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_49553
	mov rsi,0
	bt r9,0
	jc LB_49553
	jmp LB_49554
LB_49553:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49554:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49555:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49557
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49556
LB_49557:
	add rsp,8
	ret
LB_49558:
	add rsp,16
	pop r14
LB_49556:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49568:
NS_E_RDI_49568:
NS_E_49568_ETR_TBL:
NS_E_49568_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_49642
LB_49641:
	add r14,1
LB_49642:
	cmp r14,r10
	jge LB_49643
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49641
	cmp al,10
	jz LB_49641
	cmp al,32
	jz LB_49641
LB_49643:
	push r10
	call NS_E_49571_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49644
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49634
LB_49644:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_49647
LB_49646:
	add r14,1
LB_49647:
	cmp r14,r10
	jge LB_49648
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49646
	cmp al,10
	jz LB_49646
	cmp al,32
	jz LB_49646
LB_49648:
	push r10
	call NS_E_49570_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49649
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49650
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49650:
	jmp LB_49634
LB_49649:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_49653
LB_49652:
	add r14,1
LB_49653:
	cmp r14,r10
	jge LB_49654
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49652
	cmp al,10
	jz LB_49652
	cmp al,32
	jz LB_49652
LB_49654:
	push r10
	call NS_E_49569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49655
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_49656
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_49656:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49657
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49657:
	jmp LB_49634
LB_49655:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_49639
	btr r12,2
	jmp LB_49640
LB_49639:
	bts r12,2
LB_49640:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49637
	btr r12,1
	jmp LB_49638
LB_49637:
	bts r12,1
LB_49638:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49635
	btr r12,0
	jmp LB_49636
LB_49635:
	bts r12,0
LB_49636:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_49631
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; _f48998 { %_49573 %_49574 } ⊢ %_49576 : %_49576
 ; {>  %_49575~2':(_opn)◂(_p47789) %_49574~1':(_lst)◂(_p47789) %_49573~0':_p47789 }
; _f48998 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_48998
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_49602
	btr r12,2
	jmp LB_49603
LB_49602:
	bts r12,2
LB_49603:
	add rsp,16
MTC_LB_49604:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_49605
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °0◂1'
; 2' ⊢ °0◂1'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_49606
	bt QWORD [rax],0
	jc LB_49607
	btr r12,3
	jmp LB_49608
LB_49607:
	bts r12,3
LB_49608:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_49606:
	mov r9,rax
	mov r14,r9
	bt r12,3
	jc LB_49609
	btr r12,1
	jmp LB_49610
LB_49609:
	bts r12,1
LB_49610:
LB_49611:
	cmp r15,0
	jz LB_49612
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_49611
LB_49612:
; _f47840 { %_49576 %_49577 } ⊢ %_49578 : %_49578
 ; {>  %_49576~0':_p47789 %_49577~1':_p47789 }
; _f47840 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_49578 ⊢ %_49579 : %_49579
 ; {>  %_49578~°0◂{ 0' 1' }:_p47789 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_49579
 ; {>  %_49579~°0◂°0◂{ 0' 1' }:(_opn)◂(_p47789) }
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
	jc LB_49617
	btr r12,2
	jmp LB_49618
LB_49617:
	bts r12,2
LB_49618:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_49615
	btr QWORD [rdi],0
	jmp LB_49616
LB_49615:
	bts QWORD [rdi],0
LB_49616:
	mov r8,r14
	bt r12,1
	jc LB_49621
	btr r12,2
	jmp LB_49622
LB_49621:
	bts r12,2
LB_49622:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_49619
	btr QWORD [rdi],1
	jmp LB_49620
LB_49619:
	bts QWORD [rdi],1
LB_49620:
	mov rsi,1
	bt r12,3
	jc LB_49613
	mov rsi,0
	bt r9,0
	jc LB_49613
	jmp LB_49614
LB_49613:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49614:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_49605:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_49623
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_49624
	bt QWORD [rax],0
	jc LB_49625
	btr r12,1
	jmp LB_49626
LB_49625:
	bts r12,1
LB_49626:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_49624:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_49627:
	cmp r15,0
	jz LB_49628
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_49627
LB_49628:
; _some %_49576 ⊢ %_49580 : %_49580
 ; {>  %_49576~0':_p47789 }
; _some 0' ⊢ °0◂0'
; ∎ %_49580
 ; {>  %_49580~°0◂0':(_opn)◂(_p47789) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49629
	btr r12,3
	jmp LB_49630
LB_49629:
	bts r12,3
LB_49630:
	mov r8,0
	bts r12,2
	ret
MTC_LB_49623:
LB_49631:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49633
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49632
LB_49633:
	add rsp,8
	ret
LB_49634:
	add rsp,48
	pop r14
LB_49632:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49569:
NS_E_RDI_49569:
NS_E_49569_ETR_TBL:
NS_E_49569_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_49672
LB_49671:
	add r14,1
LB_49672:
	cmp r14,r10
	jge LB_49673
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49671
	cmp al,10
	jz LB_49671
	cmp al,32
	jz LB_49671
LB_49673:
	add r14,3
	cmp r14,r10
	jg LB_49676
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_49676
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_49676
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_49676
	jmp LB_49677
LB_49676:
	jmp LB_49666
LB_49677:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_49679
LB_49678:
	add r14,1
LB_49679:
	cmp r14,r10
	jge LB_49680
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49678
	cmp al,10
	jz LB_49678
	cmp al,32
	jz LB_49678
LB_49680:
	push r10
	call NS_E_49568_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49681
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49682
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49682:
	jmp LB_49666
LB_49681:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49669
	btr r12,1
	jmp LB_49670
LB_49669:
	bts r12,1
LB_49670:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49667
	btr r12,0
	jmp LB_49668
LB_49667:
	bts r12,0
LB_49668:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_49663
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_49684
	btr r12,2
	jmp LB_49685
LB_49684:
	bts r12,2
LB_49685:
	mov r13,r14
	bt r12,1
	jc LB_49686
	btr r12,0
	jmp LB_49687
LB_49686:
	bts r12,0
LB_49687:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_49581 ⊢ %_49582 : %_49582
 ; {>  %_49581~0':_p47789 }
; _some 0' ⊢ °0◂0'
; _some %_49582 ⊢ %_49583 : %_49583
 ; {>  %_49582~°0◂0':(_opn)◂(_p47789) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_49583
 ; {>  %_49583~°0◂°0◂0':(_opn)◂((_opn)◂(_p47789)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49661
	btr r12,3
	jmp LB_49662
LB_49661:
	bts r12,3
LB_49662:
	mov rsi,1
	bt r12,3
	jc LB_49659
	mov rsi,0
	bt r9,0
	jc LB_49659
	jmp LB_49660
LB_49659:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49660:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49663:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49665
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49664
LB_49665:
	add rsp,8
	ret
LB_49666:
	add rsp,32
	pop r14
LB_49664:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_49690
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_49584 : %_49584
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_49584 ⊢ %_49585 : %_49585
 ; {>  %_49584~°1◂{  }:(_opn)◂(t16450'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_49585
 ; {>  %_49585~°0◂°1◂{  }:(_opn)◂((_opn)◂(t16453'(0))) }
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
	jc LB_49688
	mov rsi,0
	bt r9,0
	jc LB_49688
	jmp LB_49689
LB_49688:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49689:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49690:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49692
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49691
LB_49692:
	add rsp,8
	ret
LB_49693:
	add rsp,0
	pop r14
LB_49691:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49570:
NS_E_RDI_49570:
NS_E_49570_ETR_TBL:
NS_E_49570_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_49715
LB_49714:
	add r14,1
LB_49715:
	cmp r14,r10
	jge LB_49716
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49714
	cmp al,10
	jz LB_49714
	cmp al,32
	jz LB_49714
LB_49716:
	add r14,3
	cmp r14,r10
	jg LB_49719
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_49719
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_49719
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_49719
	jmp LB_49720
LB_49719:
	jmp LB_49707
LB_49720:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_49722
LB_49721:
	add r14,1
LB_49722:
	cmp r14,r10
	jge LB_49723
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49721
	cmp al,10
	jz LB_49721
	cmp al,32
	jz LB_49721
LB_49723:
	push r10
	call NS_E_49571_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49724
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49725
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49725:
	jmp LB_49707
LB_49724:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_49728
LB_49727:
	add r14,1
LB_49728:
	cmp r14,r10
	jge LB_49729
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49727
	cmp al,10
	jz LB_49727
	cmp al,32
	jz LB_49727
LB_49729:
	push r10
	call NS_E_49570_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49730
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_49731
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_49731:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49732
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49732:
	jmp LB_49707
LB_49730:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_49712
	btr r12,2
	jmp LB_49713
LB_49712:
	bts r12,2
LB_49713:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49710
	btr r12,1
	jmp LB_49711
LB_49710:
	bts r12,1
LB_49711:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49708
	btr r12,0
	jmp LB_49709
LB_49708:
	bts r12,0
LB_49709:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_49704
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_49734
	btr r12,3
	jmp LB_49735
LB_49734:
	bts r12,3
LB_49735:
	mov r14,r8
	bt r12,2
	jc LB_49736
	btr r12,1
	jmp LB_49737
LB_49736:
	bts r12,1
LB_49737:
	mov r8,r13
	bt r12,0
	jc LB_49738
	btr r12,2
	jmp LB_49739
LB_49738:
	bts r12,2
LB_49739:
	mov r13,r9
	bt r12,3
	jc LB_49740
	btr r12,0
	jmp LB_49741
LB_49740:
	bts r12,0
LB_49741:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_49586 %_49587 } ⊢ %_49588 : %_49588
 ; {>  %_49587~1':(_lst)◂(_p47789) %_49586~0':_p47789 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_49588 ⊢ %_49589 : %_49589
 ; {>  %_49588~°0◂{ 0' 1' }:(_lst)◂(_p47789) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_49589
 ; {>  %_49589~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p47789)) }
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
	jc LB_49698
	btr r12,2
	jmp LB_49699
LB_49698:
	bts r12,2
LB_49699:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_49696
	btr QWORD [rdi],0
	jmp LB_49697
LB_49696:
	bts QWORD [rdi],0
LB_49697:
	mov r8,r14
	bt r12,1
	jc LB_49702
	btr r12,2
	jmp LB_49703
LB_49702:
	bts r12,2
LB_49703:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_49700
	btr QWORD [rdi],1
	jmp LB_49701
LB_49700:
	bts QWORD [rdi],1
LB_49701:
	mov rsi,1
	bt r12,3
	jc LB_49694
	mov rsi,0
	bt r9,0
	jc LB_49694
	jmp LB_49695
LB_49694:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49695:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49704:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49706
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49705
LB_49706:
	add rsp,8
	ret
LB_49707:
	add rsp,48
	pop r14
LB_49705:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_49744
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_49590 : %_49590
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_49590 ⊢ %_49591 : %_49591
 ; {>  %_49590~°1◂{  }:(_lst)◂(t16463'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_49591
 ; {>  %_49591~°0◂°1◂{  }:(_opn)◂((_lst)◂(t16466'(0))) }
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
	jc LB_49742
	mov rsi,0
	bt r9,0
	jc LB_49742
	jmp LB_49743
LB_49742:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49743:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49744:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49746
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49745
LB_49746:
	add rsp,8
	ret
LB_49747:
	add rsp,0
	pop r14
LB_49745:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49571:
NS_E_RDI_49571:
NS_E_49571_ETR_TBL:
NS_E_49571_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "("
	jmp LB_49761
LB_49760:
	add r14,1
LB_49761:
	cmp r14,r10
	jge LB_49762
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49760
	cmp al,10
	jz LB_49760
	cmp al,32
	jz LB_49760
LB_49762:
	add r14,1
	cmp r14,r10
	jg LB_49765
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_49765
	jmp LB_49766
LB_49765:
	jmp LB_49753
LB_49766:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_49768
LB_49767:
	add r14,1
LB_49768:
	cmp r14,r10
	jge LB_49769
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49767
	cmp al,10
	jz LB_49767
	cmp al,32
	jz LB_49767
LB_49769:
	push r10
	call NS_E_49568_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49770
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49771
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49771:
	jmp LB_49753
LB_49770:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_49774
LB_49773:
	add r14,1
LB_49774:
	cmp r14,r10
	jge LB_49775
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49773
	cmp al,10
	jz LB_49773
	cmp al,32
	jz LB_49773
LB_49775:
	add r14,1
	cmp r14,r10
	jg LB_49780
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_49780
	jmp LB_49781
LB_49780:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_49777
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_49777:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49778
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49778:
	jmp LB_49753
LB_49781:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_49758
	btr r12,2
	jmp LB_49759
LB_49758:
	bts r12,2
LB_49759:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49756
	btr r12,1
	jmp LB_49757
LB_49756:
	bts r12,1
LB_49757:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49754
	btr r12,0
	jmp LB_49755
LB_49754:
	bts r12,0
LB_49755:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_49750
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_49782
	btr r12,3
	jmp LB_49783
LB_49782:
	bts r12,3
LB_49783:
	mov r13,r14
	bt r12,1
	jc LB_49784
	btr r12,0
	jmp LB_49785
LB_49784:
	bts r12,0
LB_49785:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_49592 ⊢ %_49593 : %_49593
 ; {>  %_49592~0':_p47789 }
; _some 0' ⊢ °0◂0'
; ∎ %_49593
 ; {>  %_49593~°0◂0':(_opn)◂(_p47789) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49748
	btr r12,3
	jmp LB_49749
LB_49748:
	bts r12,3
LB_49749:
	mov r8,0
	bts r12,2
	ret
LB_49750:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49752
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49751
LB_49752:
	add rsp,8
	ret
LB_49753:
	add rsp,48
	pop r14
LB_49751:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; var
	jmp LB_49797
LB_49796:
	add r14,1
LB_49797:
	cmp r14,r10
	jge LB_49798
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49796
	cmp al,10
	jz LB_49796
	cmp al,32
	jz LB_49796
LB_49798:
	push r10
	call NS_E_49572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49799
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49793
LB_49799:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49794
	btr r12,0
	jmp LB_49795
LB_49794:
	bts r12,0
LB_49795:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_49790
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47843 %_49594 ⊢ %_49595 : %_49595
 ; {>  %_49594~0':_stg }
; _f47843 0' ⊢ °3◂0'
; _some %_49595 ⊢ %_49596 : %_49596
 ; {>  %_49595~°3◂0':_p47789 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_49596
 ; {>  %_49596~°0◂°3◂0':(_opn)◂(_p47789) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49788
	btr r12,3
	jmp LB_49789
LB_49788:
	bts r12,3
LB_49789:
	mov rsi,1
	bt r12,3
	jc LB_49786
	mov rsi,0
	bt r9,0
	jc LB_49786
	jmp LB_49787
LB_49786:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49787:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49790:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49792
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49791
LB_49792:
	add rsp,8
	ret
LB_49793:
	add rsp,16
	pop r14
LB_49791:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_49812
LB_49811:
	add r14,1
LB_49812:
	cmp r14,r10
	jge LB_49813
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_49811
	cmp al,10
	jz LB_49811
	cmp al,32
	jz LB_49811
LB_49813:
	push r10
	call NS_E_48838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49814
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49808
LB_49814:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49809
	btr r12,0
	jmp LB_49810
LB_49809:
	bts r12,0
LB_49810:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_49805
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47842 %_49597 ⊢ %_49598 : %_49598
 ; {>  %_49597~0':_p47766 }
; _f47842 0' ⊢ °2◂0'
; _some %_49598 ⊢ %_49599 : %_49599
 ; {>  %_49598~°2◂0':_p47789 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_49599
 ; {>  %_49599~°0◂°2◂0':(_opn)◂(_p47789) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49803
	btr r12,3
	jmp LB_49804
LB_49803:
	bts r12,3
LB_49804:
	mov rsi,1
	bt r12,3
	jc LB_49801
	mov rsi,0
	bt r9,0
	jc LB_49801
	jmp LB_49802
LB_49801:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_49802:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_49805:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49807
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49806
LB_49807:
	add rsp,8
	ret
LB_49808:
	add rsp,16
	pop r14
LB_49806:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49572:
NS_E_RDI_49572:
NS_E_49572_ETR_TBL:
NS_E_49572_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_49829
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49821
LB_49829:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_49837
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_49837
	jmp LB_49838
LB_49837:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_49835
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_49835:
	jmp LB_49821
LB_49838:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_49824
	btr r12,1
	jmp LB_49825
LB_49824:
	bts r12,1
LB_49825:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_49822
	btr r12,0
	jmp LB_49823
LB_49822:
	bts r12,0
LB_49823:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_49818
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_49600 ⊢ %_49601 : %_49601
 ; {>  %_49600~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_49601
 ; {>  %_49601~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_49816
	btr r12,3
	jmp LB_49817
LB_49816:
	bts r12,3
LB_49817:
	mov r8,0
	bts r12,2
	ret
LB_49818:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_49820
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_49819
LB_49820:
	add rsp,8
	ret
LB_49821:
	add rsp,32
	pop r14
LB_49819:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49839:
NS_E_RDI_49839:
NS_E_49839_ETR_TBL:
NS_E_49839_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ glb_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_50204:
	jmp LB_50201
LB_50200:
	add r14,1
LB_50201:
	cmp r14,r10
	jge LB_50202
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50200
	cmp al,10
	jz LB_50200
	cmp al,32
	jz LB_50200
LB_50202:
	push r10
	push rsi
	call NS_E_49840_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_50203
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_50205
	bts QWORD [rax],0
LB_50205:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_50204
LB_50203:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50198
	btr r12,0
	jmp LB_50199
LB_50198:
	bts r12,0
LB_50199:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_50194
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47140 %_49881 ⊢ %_49882 : %_49882
 ; {>  %_49881~0':(_lst)◂(_p47772) }
; _f47140 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_47140
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_49882 ⊢ %_49883 : %_49883
 ; {>  %_49882~0':(_lst)◂(_p47772) }
; _some 0' ⊢ °0◂0'
; ∎ %_49883
 ; {>  %_49883~°0◂0':(_opn)◂((_lst)◂(_p47772)) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_50192
	btr r12,3
	jmp LB_50193
LB_50192:
	bts r12,3
LB_50193:
	mov r8,0
	bts r12,2
	ret
LB_50194:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50196
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50195
LB_50196:
	add rsp,8
	ret
LB_50197:
	add rsp,16
	pop r14
LB_50195:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49840:
NS_E_RDI_49840:
NS_E_49840_ETR_TBL:
NS_E_49840_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167+s8"
	jmp LB_50236
LB_50235:
	add r14,1
LB_50236:
	cmp r14,r10
	jge LB_50237
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50235
	cmp al,10
	jz LB_50235
	cmp al,32
	jz LB_50235
LB_50237:
	add r14,7
	cmp r14,r10
	jg LB_50240
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_50240
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_50240
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_50240
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_50240
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_50240
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_50240
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_50240
	jmp LB_50241
LB_50240:
	jmp LB_50215
LB_50241:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr
	jmp LB_50224
LB_50223:
	add r14,1
LB_50224:
	cmp r14,r10
	jge LB_50225
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50223
	cmp al,10
	jz LB_50223
	cmp al,32
	jz LB_50223
LB_50225:
	push r10
	call NS_E_49867_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50226
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50227
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50227:
	jmp LB_50216
LB_50226:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_50233:
	jmp LB_50230
LB_50229:
	add r14,1
LB_50230:
	cmp r14,r10
	jge LB_50231
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50229
	cmp al,10
	jz LB_50229
	cmp al,32
	jz LB_50229
LB_50231:
	push r10
	push rsi
	call NS_E_49867_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_50232
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_50234
	bts QWORD [rax],0
LB_50234:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_50233
LB_50232:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_50221
	btr r12,2
	jmp LB_50222
LB_50221:
	bts r12,2
LB_50222:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_50219
	btr r12,1
	jmp LB_50220
LB_50219:
	bts r12,1
LB_50220:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50217
	btr r12,0
	jmp LB_50218
LB_50217:
	bts r12,0
LB_50218:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_50212
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_50242
	btr r12,3
	jmp LB_50243
LB_50242:
	bts r12,3
LB_50243:
	mov r14,r8
	bt r12,2
	jc LB_50244
	btr r12,1
	jmp LB_50245
LB_50244:
	bts r12,1
LB_50245:
	mov r8,r13
	bt r12,0
	jc LB_50246
	btr r12,2
	jmp LB_50247
LB_50246:
	bts r12,2
LB_50247:
	mov r13,r9
	bt r12,3
	jc LB_50248
	btr r12,0
	jmp LB_50249
LB_50248:
	bts r12,0
LB_50249:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_49886 : %_49886
 ; {>  %_49885~1':(_lst)◂(_p49866) %_49884~0':_p49866 }
; _nil {  } ⊢ °1◂{  }
; _f47800 %_49886 ⊢ %_49887 : %_49887
 ; {>  %_49886~°1◂{  }:(_lst)◂(t16576'(0)) %_49885~1':(_lst)◂(_p49866) %_49884~0':_p49866 }
; _f47800 °1◂{  } ⊢ °1◂°1◂{  }
; _some %_49887 ⊢ %_49888 : %_49888
 ; {>  %_49887~°1◂°1◂{  }:_p47772 %_49885~1':(_lst)◂(_p49866) %_49884~0':_p49866 }
; _some °1◂°1◂{  } ⊢ °0◂°1◂°1◂{  }
; ∎ %_49888
 ; {>  %_49888~°0◂°1◂°1◂{  }:(_opn)◂(_p47772) %_49885~1':(_lst)◂(_p49866) %_49884~0':_p49866 }
; 	∎ °0◂°1◂°1◂{  }
	bt r12,1
	jc LB_50206
	mov rdi,r14
	call dlt
LB_50206:
	bt r12,0
	jc LB_50207
	mov rdi,r13
	call dlt
LB_50207:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_50210
	mov rsi,0
	bt r9,0
	jc LB_50210
	jmp LB_50211
LB_50210:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50211:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_50208
	mov rsi,0
	bt r9,0
	jc LB_50208
	jmp LB_50209
LB_50208:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50209:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50212:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50214
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50213
LB_50214:
	add rsp,8
	ret
LB_50216:
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
LB_50215:
	add rsp,48
	pop r14
LB_50213:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_50285
LB_50284:
	add r14,1
LB_50285:
	cmp r14,r10
	jge LB_50286
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50284
	cmp al,10
	jz LB_50284
	cmp al,32
	jz LB_50284
LB_50286:
	add r14,4
	cmp r14,r10
	jg LB_50289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_50289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_50289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_50289
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_50289
	jmp LB_50290
LB_50289:
	jmp LB_50263
LB_50290:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_50272
LB_50271:
	add r14,1
LB_50272:
	cmp r14,r10
	jge LB_50273
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50271
	cmp al,10
	jz LB_50271
	cmp al,32
	jz LB_50271
LB_50273:
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50274
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50275
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50275:
	jmp LB_50264
LB_50274:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_50278
LB_50277:
	add r14,1
LB_50278:
	cmp r14,r10
	jge LB_50279
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50277
	cmp al,10
	jz LB_50277
	cmp al,32
	jz LB_50277
LB_50279:
	push r10
	call NS_E_49841_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50280
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50281
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50281:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50282
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50282:
	jmp LB_50264
LB_50280:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_50269
	btr r12,2
	jmp LB_50270
LB_50269:
	bts r12,2
LB_50270:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_50267
	btr r12,1
	jmp LB_50268
LB_50267:
	bts r12,1
LB_50268:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50265
	btr r12,0
	jmp LB_50266
LB_50265:
	bts r12,0
LB_50266:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_50260
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_50291
	btr r12,3
	jmp LB_50292
LB_50291:
	bts r12,3
LB_50292:
	mov r14,r8
	bt r12,2
	jc LB_50293
	btr r12,1
	jmp LB_50294
LB_50293:
	bts r12,1
LB_50294:
	mov r8,r13
	bt r12,0
	jc LB_50295
	btr r12,2
	jmp LB_50296
LB_50295:
	bts r12,2
LB_50296:
	mov r13,r9
	bt r12,3
	jc LB_50297
	btr r12,0
	jmp LB_50298
LB_50297:
	bts r12,0
LB_50298:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47799 { %_49889 %_49890 } ⊢ %_49891 : %_49891
 ; {>  %_49890~1':_p47773 %_49889~0':_stg }
; _f47799 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_49891 ⊢ %_49892 : %_49892
 ; {>  %_49891~°0◂{ 0' 1' }:_p47772 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_49892
 ; {>  %_49892~°0◂°0◂{ 0' 1' }:(_opn)◂(_p47772) }
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
	jc LB_50254
	btr r12,2
	jmp LB_50255
LB_50254:
	bts r12,2
LB_50255:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_50252
	btr QWORD [rdi],0
	jmp LB_50253
LB_50252:
	bts QWORD [rdi],0
LB_50253:
	mov r8,r14
	bt r12,1
	jc LB_50258
	btr r12,2
	jmp LB_50259
LB_50258:
	bts r12,2
LB_50259:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_50256
	btr QWORD [rdi],1
	jmp LB_50257
LB_50256:
	bts QWORD [rdi],1
LB_50257:
	mov rsi,1
	bt r12,3
	jc LB_50250
	mov rsi,0
	bt r9,0
	jc LB_50250
	jmp LB_50251
LB_50250:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50251:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50260:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50262
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50261
LB_50262:
	add rsp,8
	ret
LB_50264:
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
LB_50263:
	add rsp,48
	pop r14
LB_50261:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_50317
LB_50316:
	add r14,1
LB_50317:
	cmp r14,r10
	jge LB_50318
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50316
	cmp al,10
	jz LB_50316
	cmp al,32
	jz LB_50316
LB_50318:
	add r14,2
	cmp r14,r10
	jg LB_50321
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_50321
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_50321
	jmp LB_50322
LB_50321:
	jmp LB_50304
LB_50322:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_50311
LB_50310:
	add r14,1
LB_50311:
	cmp r14,r10
	jge LB_50312
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50310
	cmp al,10
	jz LB_50310
	cmp al,32
	jz LB_50310
LB_50312:
	push r10
	call NS_E_49849_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50313
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50314
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50314:
	jmp LB_50305
LB_50313:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_50308
	btr r12,1
	jmp LB_50309
LB_50308:
	bts r12,1
LB_50309:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50306
	btr r12,0
	jmp LB_50307
LB_50306:
	bts r12,0
LB_50307:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_50301
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_50323
	btr r12,2
	jmp LB_50324
LB_50323:
	bts r12,2
LB_50324:
	mov r13,r14
	bt r12,1
	jc LB_50325
	btr r12,0
	jmp LB_50326
LB_50325:
	bts r12,0
LB_50326:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_49893 ⊢ %_49894 : %_49894
 ; {>  %_49893~0':_p47772 }
; _some 0' ⊢ °0◂0'
; ∎ %_49894
 ; {>  %_49894~°0◂0':(_opn)◂(_p47772) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_50299
	btr r12,3
	jmp LB_50300
LB_50299:
	bts r12,3
LB_50300:
	mov r8,0
	bts r12,2
	ret
LB_50301:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50303
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50302
LB_50303:
	add rsp,8
	ret
LB_50305:
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
LB_50304:
	add rsp,32
	pop r14
LB_50302:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_50338
LB_50337:
	add r14,1
LB_50338:
	cmp r14,r10
	jge LB_50339
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50337
	cmp al,10
	jz LB_50337
	cmp al,32
	jz LB_50337
LB_50339:
	add r14,2
	cmp r14,r10
	jg LB_50342
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_50342
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_50342
	jmp LB_50343
LB_50342:
	jmp LB_50332
LB_50343:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_50345
LB_50344:
	add r14,1
LB_50345:
	cmp r14,r10
	jge LB_50346
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50344
	cmp al,10
	jz LB_50344
	cmp al,32
	jz LB_50344
LB_50346:
	push r10
	call NS_E_49843_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50347
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50348
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50348:
	jmp LB_50332
LB_50347:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_50335
	btr r12,1
	jmp LB_50336
LB_50335:
	bts r12,1
LB_50336:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50333
	btr r12,0
	jmp LB_50334
LB_50333:
	bts r12,0
LB_50334:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_50329
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_50350
	btr r12,2
	jmp LB_50351
LB_50350:
	bts r12,2
LB_50351:
	mov r13,r14
	bt r12,1
	jc LB_50352
	btr r12,0
	jmp LB_50353
LB_50352:
	bts r12,0
LB_50353:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_49895 ⊢ %_49896 : %_49896
 ; {>  %_49895~0':_p47772 }
; _some 0' ⊢ °0◂0'
; ∎ %_49896
 ; {>  %_49896~°0◂0':(_opn)◂(_p47772) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_50327
	btr r12,3
	jmp LB_50328
LB_50327:
	bts r12,3
LB_50328:
	mov r8,0
	bts r12,2
	ret
LB_50329:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50331
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50330
LB_50331:
	add rsp,8
	ret
LB_50332:
	add rsp,32
	pop r14
LB_50330:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49841:
NS_E_RDI_49841:
NS_E_49841_ETR_TBL:
NS_E_49841_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_50374
LB_50373:
	add r14,1
LB_50374:
	cmp r14,r10
	jge LB_50375
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50373
	cmp al,10
	jz LB_50373
	cmp al,32
	jz LB_50373
LB_50375:
	add r14,1
	cmp r14,r10
	jg LB_50378
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_50378
	jmp LB_50379
LB_50378:
	jmp LB_50361
LB_50379:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_50368
LB_50367:
	add r14,1
LB_50368:
	cmp r14,r10
	jge LB_50369
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50367
	cmp al,10
	jz LB_50367
	cmp al,32
	jz LB_50367
LB_50369:
	push r10
	call NS_E_48838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50370
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50371
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50371:
	jmp LB_50362
LB_50370:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_50365
	btr r12,1
	jmp LB_50366
LB_50365:
	bts r12,1
LB_50366:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50363
	btr r12,0
	jmp LB_50364
LB_50363:
	bts r12,0
LB_50364:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_50358
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_50380
	btr r12,2
	jmp LB_50381
LB_50380:
	bts r12,2
LB_50381:
	mov r13,r14
	bt r12,1
	jc LB_50382
	btr r12,0
	jmp LB_50383
LB_50382:
	bts r12,0
LB_50383:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47806 %_49897 ⊢ %_49898 : %_49898
 ; {>  %_49897~0':_p47766 }
; _f47806 0' ⊢ °1◂0'
; _some %_49898 ⊢ %_49899 : %_49899
 ; {>  %_49898~°1◂0':_p47773 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_49899
 ; {>  %_49899~°0◂°1◂0':(_opn)◂(_p47773) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_50356
	btr r12,3
	jmp LB_50357
LB_50356:
	bts r12,3
LB_50357:
	mov rsi,1
	bt r12,3
	jc LB_50354
	mov rsi,0
	bt r9,0
	jc LB_50354
	jmp LB_50355
LB_50354:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50355:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50358:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50360
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50359
LB_50360:
	add rsp,8
	ret
LB_50362:
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
LB_50361:
	add rsp,32
	pop r14
LB_50359:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_50395
LB_50394:
	add r14,1
LB_50395:
	cmp r14,r10
	jge LB_50396
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50394
	cmp al,10
	jz LB_50394
	cmp al,32
	jz LB_50394
LB_50396:
	push r10
	call NS_E_49842_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50397
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50391
LB_50397:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50392
	btr r12,0
	jmp LB_50393
LB_50392:
	bts r12,0
LB_50393:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_50388
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47805 %_49900 ⊢ %_49901 : %_49901
 ; {>  %_49900~0':(_lst)◂(_p47772) }
; _f47805 0' ⊢ °0◂0'
; _some %_49901 ⊢ %_49902 : %_49902
 ; {>  %_49901~°0◂0':_p47773 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_49902
 ; {>  %_49902~°0◂°0◂0':(_opn)◂(_p47773) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_50386
	btr r12,3
	jmp LB_50387
LB_50386:
	bts r12,3
LB_50387:
	mov rsi,1
	bt r12,3
	jc LB_50384
	mov rsi,0
	bt r9,0
	jc LB_50384
	jmp LB_50385
LB_50384:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50385:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50388:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50390
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50389
LB_50390:
	add rsp,8
	ret
LB_50391:
	add rsp,16
	pop r14
LB_50389:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49842:
NS_E_RDI_49842:
NS_E_49842_ETR_TBL:
NS_E_49842_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_50408
LB_50407:
	add r14,1
LB_50408:
	cmp r14,r10
	jge LB_50409
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50407
	cmp al,10
	jz LB_50407
	cmp al,32
	jz LB_50407
LB_50409:
	add r14,6
	cmp r14,r10
	jg LB_50412
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_50412
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_50412
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_50412
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_50412
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_50412
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_50412
	jmp LB_50413
LB_50412:
	jmp LB_50404
LB_50413:
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
	jc LB_50405
	btr r12,0
	jmp LB_50406
LB_50405:
	bts r12,0
LB_50406:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_50401
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_49903 : %_49903
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_49903 ⊢ %_49904 : %_49904
 ; {>  %_49903~°1◂{  }:(_lst)◂(t16601'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_49904
 ; {>  %_49904~°0◂°1◂{  }:(_opn)◂((_lst)◂(t16604'(0))) }
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
	jc LB_50399
	mov rsi,0
	bt r9,0
	jc LB_50399
	jmp LB_50400
LB_50399:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50400:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50401:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50403
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50402
LB_50403:
	add rsp,8
	ret
LB_50404:
	add rsp,16
	pop r14
LB_50402:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_50433
LB_50432:
	add r14,1
LB_50433:
	cmp r14,r10
	jge LB_50434
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50432
	cmp al,10
	jz LB_50432
	cmp al,32
	jz LB_50432
LB_50434:
	push r10
	call NS_E_49840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50435
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50427
LB_50435:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_50438
LB_50437:
	add r14,1
LB_50438:
	cmp r14,r10
	jge LB_50439
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50437
	cmp al,10
	jz LB_50437
	cmp al,32
	jz LB_50437
LB_50439:
	push r10
	call NS_E_49842_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50440
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50441
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50441:
	jmp LB_50427
LB_50440:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_50430
	btr r12,1
	jmp LB_50431
LB_50430:
	bts r12,1
LB_50431:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50428
	btr r12,0
	jmp LB_50429
LB_50428:
	bts r12,0
LB_50429:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_50424
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_49905 %_49906 } ⊢ %_49907 : %_49907
 ; {>  %_49906~1':(_lst)◂(_p47772) %_49905~0':_p47772 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_49907 ⊢ %_49908 : %_49908
 ; {>  %_49907~°0◂{ 0' 1' }:(_lst)◂(_p47772) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_49908
 ; {>  %_49908~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p47772)) }
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
	jc LB_50418
	btr r12,2
	jmp LB_50419
LB_50418:
	bts r12,2
LB_50419:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_50416
	btr QWORD [rdi],0
	jmp LB_50417
LB_50416:
	bts QWORD [rdi],0
LB_50417:
	mov r8,r14
	bt r12,1
	jc LB_50422
	btr r12,2
	jmp LB_50423
LB_50422:
	bts r12,2
LB_50423:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_50420
	btr QWORD [rdi],1
	jmp LB_50421
LB_50420:
	bts QWORD [rdi],1
LB_50421:
	mov rsi,1
	bt r12,3
	jc LB_50414
	mov rsi,0
	bt r9,0
	jc LB_50414
	jmp LB_50415
LB_50414:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50415:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50424:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50426
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50425
LB_50426:
	add rsp,8
	ret
LB_50427:
	add rsp,32
	pop r14
LB_50425:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49843:
NS_E_RDI_49843:
NS_E_49843_ETR_TBL:
NS_E_49843_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_50498
LB_50497:
	add r14,1
LB_50498:
	cmp r14,r10
	jge LB_50499
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50497
	cmp al,10
	jz LB_50497
	cmp al,32
	jz LB_50497
LB_50499:
	add r14,1
	cmp r14,r10
	jg LB_50502
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_50502
	jmp LB_50503
LB_50502:
	jmp LB_50464
LB_50503:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_50475
LB_50474:
	add r14,1
LB_50475:
	cmp r14,r10
	jge LB_50476
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50474
	cmp al,10
	jz LB_50474
	cmp al,32
	jz LB_50474
LB_50476:
	add r14,1
	cmp r14,r10
	jg LB_50480
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_50480
	jmp LB_50481
LB_50480:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50478
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50478:
	jmp LB_50465
LB_50481:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_50483
LB_50482:
	add r14,1
LB_50483:
	cmp r14,r10
	jge LB_50484
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50482
	cmp al,10
	jz LB_50482
	cmp al,32
	jz LB_50482
LB_50484:
	push r10
	call NS_E_49844_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50485
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50486
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50486:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50487
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50487:
	jmp LB_50465
LB_50485:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_50490
LB_50489:
	add r14,1
LB_50490:
	cmp r14,r10
	jge LB_50491
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50489
	cmp al,10
	jz LB_50489
	cmp al,32
	jz LB_50489
LB_50491:
	push r10
	call NS_E_49847_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50492
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_50493
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_50493:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50494
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50494:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50495
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50495:
	jmp LB_50465
LB_50492:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_50472
	btr r12,3
	jmp LB_50473
LB_50472:
	bts r12,3
LB_50473:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_50470
	btr r12,2
	jmp LB_50471
LB_50470:
	bts r12,2
LB_50471:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_50468
	btr r12,1
	jmp LB_50469
LB_50468:
	bts r12,1
LB_50469:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50466
	btr r12,0
	jmp LB_50467
LB_50466:
	bts r12,0
LB_50467:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_50461
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_50504
	btr r12,4
	jmp LB_50505
LB_50504:
	bts r12,4
LB_50505:
	mov r8,r9
	bt r12,3
	jc LB_50506
	btr r12,2
	jmp LB_50507
LB_50506:
	bts r12,2
LB_50507:
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_50510
	btr r12,3
	jmp LB_50511
LB_50510:
	bts r12,3
LB_50511:
	mov r13,r9
	bt r12,3
	jc LB_50508
	btr r12,0
	jmp LB_50509
LB_50508:
	bts r12,0
LB_50509:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_50514
	btr r12,3
	jmp LB_50515
LB_50514:
	bts r12,3
LB_50515:
	mov r14,r9
	bt r12,3
	jc LB_50512
	btr r12,1
	jmp LB_50513
LB_50512:
	bts r12,1
LB_50513:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_49909 %_49910 } ⊢ %_49911 : %_49911
 ; {>  %_49910~2':(_lst)◂({ _stg _p47775 }) %_49909~{ 0' 1' }:{ _stg _p47775 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f47804 %_49911 ⊢ %_49912 : %_49912
 ; {>  %_49911~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p47775 }) }
; _f47804 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_49912 ⊢ %_49913 : %_49913
 ; {>  %_49912~°5◂°0◂{ { 0' 1' } 2' }:_p47772 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_49913
 ; {>  %_49913~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p47772) }
; 	∎ °0◂°5◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°5◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_50451
	btr r12,5
	jmp LB_50452
LB_50451:
	bts r12,5
LB_50452:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_50449
	btr QWORD [rdi],0
	jmp LB_50450
LB_50449:
	bts QWORD [rdi],0
LB_50450:
	mov r11,r14
	bt r12,1
	jc LB_50455
	btr r12,5
	jmp LB_50456
LB_50455:
	bts r12,5
LB_50456:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_50453
	btr QWORD [rdi],1
	jmp LB_50454
LB_50453:
	bts QWORD [rdi],1
LB_50454:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_50447
	btr QWORD [rdi],0
	jmp LB_50448
LB_50447:
	bts QWORD [rdi],0
LB_50448:
	mov r10,r8
	bt r12,2
	jc LB_50459
	btr r12,4
	jmp LB_50460
LB_50459:
	bts r12,4
LB_50460:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_50457
	btr QWORD [rdi],1
	jmp LB_50458
LB_50457:
	bts QWORD [rdi],1
LB_50458:
	mov rsi,1
	bt r12,3
	jc LB_50445
	mov rsi,0
	bt r9,0
	jc LB_50445
	jmp LB_50446
LB_50445:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50446:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_50443
	mov rsi,0
	bt r9,0
	jc LB_50443
	jmp LB_50444
LB_50443:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50444:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50461:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50463
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50462
LB_50463:
	add rsp,8
	ret
LB_50465:
	add rsp,64
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
LB_50464:
	add rsp,64
	pop r14
LB_50462:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_50533
LB_50532:
	add r14,1
LB_50533:
	cmp r14,r10
	jge LB_50534
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50532
	cmp al,10
	jz LB_50532
	cmp al,32
	jz LB_50532
LB_50534:
	push r10
	call NS_E_49844_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50535
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50529
LB_50535:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50530
	btr r12,0
	jmp LB_50531
LB_50530:
	bts r12,0
LB_50531:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_50526
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_50537
	btr r12,2
	jmp LB_50538
LB_50537:
	bts r12,2
LB_50538:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_50541
	btr r12,3
	jmp LB_50542
LB_50541:
	bts r12,3
LB_50542:
	mov r13,r9
	bt r12,3
	jc LB_50539
	btr r12,0
	jmp LB_50540
LB_50539:
	bts r12,0
LB_50540:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_50545
	btr r12,3
	jmp LB_50546
LB_50545:
	bts r12,3
LB_50546:
	mov r14,r9
	bt r12,3
	jc LB_50543
	btr r12,1
	jmp LB_50544
LB_50543:
	bts r12,1
LB_50544:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47803 %_49914 ⊢ %_49915 : %_49915
 ; {>  %_49914~{ 0' 1' }:{ _stg _p47775 } }
; _f47803 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_49915 ⊢ %_49916 : %_49916
 ; {>  %_49915~°4◂{ 0' 1' }:_p47772 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_49916
 ; {>  %_49916~°0◂°4◂{ 0' 1' }:(_opn)◂(_p47772) }
; 	∎ °0◂°4◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°4◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_50520
	btr r12,2
	jmp LB_50521
LB_50520:
	bts r12,2
LB_50521:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_50518
	btr QWORD [rdi],0
	jmp LB_50519
LB_50518:
	bts QWORD [rdi],0
LB_50519:
	mov r8,r14
	bt r12,1
	jc LB_50524
	btr r12,2
	jmp LB_50525
LB_50524:
	bts r12,2
LB_50525:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_50522
	btr QWORD [rdi],1
	jmp LB_50523
LB_50522:
	bts QWORD [rdi],1
LB_50523:
	mov rsi,1
	bt r12,3
	jc LB_50516
	mov rsi,0
	bt r9,0
	jc LB_50516
	jmp LB_50517
LB_50516:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50517:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50526:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50528
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50527
LB_50528:
	add rsp,8
	ret
LB_50529:
	add rsp,16
	pop r14
LB_50527:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49844:
NS_E_RDI_49844:
NS_E_49844_ETR_TBL:
NS_E_49844_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; word
	jmp LB_50580
LB_50579:
	add r14,1
LB_50580:
	cmp r14,r10
	jge LB_50581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50579
	cmp al,10
	jz LB_50579
	cmp al,32
	jz LB_50579
LB_50581:
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50582
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50561
LB_50582:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_50585
LB_50584:
	add r14,1
LB_50585:
	cmp r14,r10
	jge LB_50586
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50584
	cmp al,10
	jz LB_50584
	cmp al,32
	jz LB_50584
LB_50586:
	push r10
	call NS_E_49846_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50587
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50588
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50588:
	jmp LB_50561
LB_50587:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_50591
LB_50590:
	add r14,1
LB_50591:
	cmp r14,r10
	jge LB_50592
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50590
	cmp al,10
	jz LB_50590
	cmp al,32
	jz LB_50590
LB_50592:
	add r14,1
	cmp r14,r10
	jg LB_50597
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_50597
	jmp LB_50598
LB_50597:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50594
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50594:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50595
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50595:
	jmp LB_50561
LB_50598:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_50572
LB_50571:
	add r14,1
LB_50572:
	cmp r14,r10
	jge LB_50573
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50571
	cmp al,10
	jz LB_50571
	cmp al,32
	jz LB_50571
LB_50573:
	push r10
	call NS_E_49568_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50574
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_50575
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_50575:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50576
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50576:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50577
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50577:
	jmp LB_50562
LB_50574:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_50569
	btr r12,3
	jmp LB_50570
LB_50569:
	bts r12,3
LB_50570:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_50567
	btr r12,2
	jmp LB_50568
LB_50567:
	bts r12,2
LB_50568:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_50565
	btr r12,1
	jmp LB_50566
LB_50565:
	bts r12,1
LB_50566:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50563
	btr r12,0
	jmp LB_50564
LB_50563:
	bts r12,0
LB_50564:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_50558
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_50599
	btr r12,4
	jmp LB_50600
LB_50599:
	bts r12,4
LB_50600:
	mov r8,r9
	bt r12,3
	jc LB_50601
	btr r12,2
	jmp LB_50602
LB_50601:
	bts r12,2
LB_50602:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47811 %_49919 ⊢ %_49920 : %_49920
 ; {>  %_49917~0':_stg %_49918~1':_p49845 %_49919~2':_p47789 }
; _f47811 2' ⊢ °1◂2'
; _some { %_49917 %_49920 } ⊢ %_49921 : %_49921
 ; {>  %_49920~°1◂2':_p47775 %_49917~0':_stg %_49918~1':_p49845 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_49921
 ; {>  %_49921~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p47775 }) %_49918~1':_p49845 }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_50547
	mov rdi,r14
	call dlt
LB_50547:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_50550
	btr r12,1
	jmp LB_50551
LB_50550:
	bts r12,1
LB_50551:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_50548
	btr QWORD [rdi],0
	jmp LB_50549
LB_50548:
	bts QWORD [rdi],0
LB_50549:
	mov r14,r8
	bt r12,2
	jc LB_50556
	btr r12,1
	jmp LB_50557
LB_50556:
	bts r12,1
LB_50557:
	mov rsi,1
	bt r12,1
	jc LB_50554
	mov rsi,0
	bt r14,0
	jc LB_50554
	jmp LB_50555
LB_50554:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_50555:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_50552
	btr QWORD [rdi],1
	jmp LB_50553
LB_50552:
	bts QWORD [rdi],1
LB_50553:
	mov r8,0
	bts r12,2
	ret
LB_50558:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50560
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50559
LB_50560:
	add rsp,8
	ret
LB_50562:
	add rsp,64
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
LB_50561:
	add rsp,64
	pop r14
LB_50559:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,112
; word
	jmp LB_50649
LB_50648:
	add r14,1
LB_50649:
	cmp r14,r10
	jge LB_50650
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50648
	cmp al,10
	jz LB_50648
	cmp al,32
	jz LB_50648
LB_50650:
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50651
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50633
LB_50651:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_50654
LB_50653:
	add r14,1
LB_50654:
	cmp r14,r10
	jge LB_50655
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50653
	cmp al,10
	jz LB_50653
	cmp al,32
	jz LB_50653
LB_50655:
	push r10
	call NS_E_49846_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50656
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50657
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50657:
	jmp LB_50633
LB_50656:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_50660
LB_50659:
	add r14,1
LB_50660:
	cmp r14,r10
	jge LB_50661
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50659
	cmp al,10
	jz LB_50659
	cmp al,32
	jz LB_50659
LB_50661:
	add r14,3
	cmp r14,r10
	jg LB_50666
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_50666
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_50666
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_50666
	jmp LB_50667
LB_50666:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50663
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50663:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50664
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50664:
	jmp LB_50633
LB_50667:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_50669
LB_50668:
	add r14,1
LB_50669:
	cmp r14,r10
	jge LB_50670
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50668
	cmp al,10
	jz LB_50668
	cmp al,32
	jz LB_50668
LB_50670:
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50671
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_50672
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_50672:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50673
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50673:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50674
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50674:
	jmp LB_50633
LB_50671:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_50677
LB_50676:
	add r14,1
LB_50677:
	cmp r14,r10
	jge LB_50678
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50676
	cmp al,10
	jz LB_50676
	cmp al,32
	jz LB_50676
LB_50678:
	add r14,1
	cmp r14,r10
	jg LB_50685
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_50685
	jmp LB_50686
LB_50685:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_50680
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_50680:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_50681
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_50681:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50682
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50682:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50683
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50683:
	jmp LB_50633
LB_50686:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_50688
LB_50687:
	add r14,1
LB_50688:
	cmp r14,r10
	jge LB_50689
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50687
	cmp al,10
	jz LB_50687
	cmp al,32
	jz LB_50687
LB_50689:
	push r10
	call NS_E_49568_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50690
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_50691
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_50691:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_50692
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_50692:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_50693
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_50693:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50694
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50694:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50695
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50695:
	jmp LB_50633
LB_50690:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_50698
LB_50697:
	add r14,1
LB_50698:
	cmp r14,r10
	jge LB_50699
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50697
	cmp al,10
	jz LB_50697
	cmp al,32
	jz LB_50697
LB_50699:
	push r10
	call NS_E_49848_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50700
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_50701
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_50701:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_50702
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_50702:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_50703
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_50703:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_50704
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_50704:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50705
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50705:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50706
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50706:
	jmp LB_50633
LB_50700:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_50646
	btr r12,6
	jmp LB_50647
LB_50646:
	bts r12,6
LB_50647:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_50644
	btr r12,5
	jmp LB_50645
LB_50644:
	bts r12,5
LB_50645:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_50642
	btr r12,4
	jmp LB_50643
LB_50642:
	bts r12,4
LB_50643:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_50640
	btr r12,3
	jmp LB_50641
LB_50640:
	bts r12,3
LB_50641:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_50638
	btr r12,2
	jmp LB_50639
LB_50638:
	bts r12,2
LB_50639:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_50636
	btr r12,1
	jmp LB_50637
LB_50636:
	bts r12,1
LB_50637:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50634
	btr r12,0
	jmp LB_50635
LB_50634:
	bts r12,0
LB_50635:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_50630
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_50708
	btr r12,7
	jmp LB_50709
LB_50708:
	bts r12,7
LB_50709:
	mov r10,rcx
	bt r12,6
	jc LB_50710
	btr r12,4
	jmp LB_50711
LB_50710:
	bts r12,4
LB_50711:
	mov rcx,r9
	bt r12,3
	jc LB_50712
	btr r12,6
	jmp LB_50713
LB_50712:
	bts r12,6
LB_50713:
	mov r9,r11
	bt r12,5
	jc LB_50714
	btr r12,3
	jmp LB_50715
LB_50714:
	bts r12,3
LB_50715:
	mov r11,r8
	bt r12,2
	jc LB_50716
	btr r12,5
	jmp LB_50717
LB_50716:
	bts r12,5
LB_50717:
	mov r8,rcx
	bt r12,6
	jc LB_50718
	btr r12,2
	jmp LB_50719
LB_50718:
	bts r12,2
LB_50719:
; 5' ⊢ {  }
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { { %_49924 %_49925 } %_49926 } ⊢ %_49927 : %_49927
 ; {>  %_49924~2':_stg %_49923~1':_p49845 %_49922~0':_stg %_49926~4':(_lst)◂({ _stg _p47789 }) %_49925~3':_p47789 }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f47810 %_49927 ⊢ %_49928 : %_49928
 ; {>  %_49927~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p47789 }) %_49923~1':_p49845 %_49922~0':_stg }
; _f47810 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_49922 %_49928 } ⊢ %_49929 : %_49929
 ; {>  %_49928~°0◂°0◂{ { 2' 3' } 4' }:_p47775 %_49923~1':_p49845 %_49922~0':_stg }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_49929
 ; {>  %_49929~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p47775 }) %_49923~1':_p49845 }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_50603
	mov rdi,r14
	call dlt
LB_50603:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_50604
	btr r12,1
	jmp LB_50605
LB_50604:
	bts r12,1
LB_50605:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_50608
	btr r12,5
	jmp LB_50609
LB_50608:
	bts r12,5
LB_50609:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_50606
	btr QWORD [rdi],0
	jmp LB_50607
LB_50606:
	bts QWORD [rdi],0
LB_50607:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rcx,r8
	bt r12,2
	jc LB_50620
	btr r12,6
	jmp LB_50621
LB_50620:
	bts r12,6
LB_50621:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_50618
	btr QWORD [rdi],0
	jmp LB_50619
LB_50618:
	bts QWORD [rdi],0
LB_50619:
	mov rcx,r14
	bt r12,1
	jc LB_50624
	btr r12,6
	jmp LB_50625
LB_50624:
	bts r12,6
LB_50625:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_50622
	btr QWORD [rdi],1
	jmp LB_50623
LB_50622:
	bts QWORD [rdi],1
LB_50623:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_50616
	btr QWORD [rdi],0
	jmp LB_50617
LB_50616:
	bts QWORD [rdi],0
LB_50617:
	mov r13,r10
	bt r12,4
	jc LB_50628
	btr r12,0
	jmp LB_50629
LB_50628:
	bts r12,0
LB_50629:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_50626
	btr QWORD [rdi],1
	jmp LB_50627
LB_50626:
	bts QWORD [rdi],1
LB_50627:
	mov rsi,1
	bt r12,5
	jc LB_50614
	mov rsi,0
	bt r11,0
	jc LB_50614
	jmp LB_50615
LB_50614:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_50615:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_50612
	mov rsi,0
	bt r11,0
	jc LB_50612
	jmp LB_50613
LB_50612:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_50613:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_50610
	btr QWORD [rdi],1
	jmp LB_50611
LB_50610:
	bts QWORD [rdi],1
LB_50611:
	mov r8,0
	bts r12,2
	ret
LB_50630:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50632
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50631
LB_50632:
	add rsp,8
	ret
LB_50633:
	add rsp,112
	pop r14
LB_50631:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49846:
NS_E_RDI_49846:
NS_E_49846_ETR_TBL:
NS_E_49846_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_50734
LB_50733:
	add r14,1
LB_50734:
	cmp r14,r10
	jge LB_50735
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50733
	cmp al,10
	jz LB_50733
	cmp al,32
	jz LB_50733
LB_50735:
	add r14,3
	cmp r14,r10
	jg LB_50738
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_50738
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_50738
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_50738
	jmp LB_50739
LB_50738:
	jmp LB_50720
LB_50739:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_50728
LB_50727:
	add r14,1
LB_50728:
	cmp r14,r10
	jge LB_50729
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50727
	cmp al,10
	jz LB_50727
	cmp al,32
	jz LB_50727
LB_50729:
	push r10
	call NS_E_49572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50730
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50731
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50731:
	jmp LB_50721
LB_50730:
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
	jc LB_50724
	btr QWORD [rdi],1
LB_50724:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50725
	btr QWORD [rdi],0
LB_50725:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_50721:
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
LB_50720:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_50722:
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
NS_E_49847:
NS_E_RDI_49847:
NS_E_49847_ETR_TBL:
NS_E_49847_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_50793
LB_50792:
	add r14,1
LB_50793:
	cmp r14,r10
	jge LB_50794
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50792
	cmp al,10
	jz LB_50792
	cmp al,32
	jz LB_50792
LB_50794:
	add r14,1
	cmp r14,r10
	jg LB_50797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_50797
	jmp LB_50798
LB_50797:
	jmp LB_50759
LB_50798:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_50770
LB_50769:
	add r14,1
LB_50770:
	cmp r14,r10
	jge LB_50771
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50769
	cmp al,10
	jz LB_50769
	cmp al,32
	jz LB_50769
LB_50771:
	add r14,1
	cmp r14,r10
	jg LB_50775
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_50775
	jmp LB_50776
LB_50775:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50773
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50773:
	jmp LB_50760
LB_50776:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_50778
LB_50777:
	add r14,1
LB_50778:
	cmp r14,r10
	jge LB_50779
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50777
	cmp al,10
	jz LB_50777
	cmp al,32
	jz LB_50777
LB_50779:
	push r10
	call NS_E_49844_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50780
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50781
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50781:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50782
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50782:
	jmp LB_50760
LB_50780:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_50785
LB_50784:
	add r14,1
LB_50785:
	cmp r14,r10
	jge LB_50786
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50784
	cmp al,10
	jz LB_50784
	cmp al,32
	jz LB_50784
LB_50786:
	push r10
	call NS_E_49847_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50787
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_50788
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_50788:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50789
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50789:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50790
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50790:
	jmp LB_50760
LB_50787:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_50767
	btr r12,3
	jmp LB_50768
LB_50767:
	bts r12,3
LB_50768:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_50765
	btr r12,2
	jmp LB_50766
LB_50765:
	bts r12,2
LB_50766:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_50763
	btr r12,1
	jmp LB_50764
LB_50763:
	bts r12,1
LB_50764:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50761
	btr r12,0
	jmp LB_50762
LB_50761:
	bts r12,0
LB_50762:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_50756
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_50799
	btr r12,4
	jmp LB_50800
LB_50799:
	bts r12,4
LB_50800:
	mov r8,r9
	bt r12,3
	jc LB_50801
	btr r12,2
	jmp LB_50802
LB_50801:
	bts r12,2
LB_50802:
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_50805
	btr r12,3
	jmp LB_50806
LB_50805:
	bts r12,3
LB_50806:
	mov r13,r9
	bt r12,3
	jc LB_50803
	btr r12,0
	jmp LB_50804
LB_50803:
	bts r12,0
LB_50804:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_50809
	btr r12,3
	jmp LB_50810
LB_50809:
	bts r12,3
LB_50810:
	mov r14,r9
	bt r12,3
	jc LB_50807
	btr r12,1
	jmp LB_50808
LB_50807:
	bts r12,1
LB_50808:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_49932 %_49933 } ⊢ %_49934 : %_49934
 ; {>  %_49933~2':(_lst)◂({ _stg _p47775 }) %_49932~{ 0' 1' }:{ _stg _p47775 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_49934 ⊢ %_49935 : %_49935
 ; {>  %_49934~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p47775 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_49935
 ; {>  %_49935~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p47775 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_50746
	btr r12,5
	jmp LB_50747
LB_50746:
	bts r12,5
LB_50747:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_50744
	btr QWORD [rdi],0
	jmp LB_50745
LB_50744:
	bts QWORD [rdi],0
LB_50745:
	mov r11,r14
	bt r12,1
	jc LB_50750
	btr r12,5
	jmp LB_50751
LB_50750:
	bts r12,5
LB_50751:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_50748
	btr QWORD [rdi],1
	jmp LB_50749
LB_50748:
	bts QWORD [rdi],1
LB_50749:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_50742
	btr QWORD [rdi],0
	jmp LB_50743
LB_50742:
	bts QWORD [rdi],0
LB_50743:
	mov r10,r8
	bt r12,2
	jc LB_50754
	btr r12,4
	jmp LB_50755
LB_50754:
	bts r12,4
LB_50755:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_50752
	btr QWORD [rdi],1
	jmp LB_50753
LB_50752:
	bts QWORD [rdi],1
LB_50753:
	mov rsi,1
	bt r12,3
	jc LB_50740
	mov rsi,0
	bt r9,0
	jc LB_50740
	jmp LB_50741
LB_50740:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50741:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50756:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50758
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50757
LB_50758:
	add rsp,8
	ret
LB_50760:
	add rsp,64
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
LB_50759:
	add rsp,64
	pop r14
LB_50757:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_50813
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_49936 : %_49936
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_49936 ⊢ %_49937 : %_49937
 ; {>  %_49936~°1◂{  }:(_lst)◂(t16648'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_49937
 ; {>  %_49937~°0◂°1◂{  }:(_opn)◂((_lst)◂(t16651'(0))) }
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
	jc LB_50811
	mov rsi,0
	bt r9,0
	jc LB_50811
	jmp LB_50812
LB_50811:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50812:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50813:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50815
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50814
LB_50815:
	add rsp,8
	ret
LB_50816:
	add rsp,0
	pop r14
LB_50814:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49848:
NS_E_RDI_49848:
NS_E_49848_ETR_TBL:
NS_E_49848_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_50881
LB_50880:
	add r14,1
LB_50881:
	cmp r14,r10
	jge LB_50882
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50880
	cmp al,10
	jz LB_50880
	cmp al,32
	jz LB_50880
LB_50882:
	add r14,3
	cmp r14,r10
	jg LB_50885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_50885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_50885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_50885
	jmp LB_50886
LB_50885:
	jmp LB_50836
LB_50886:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_50849
LB_50848:
	add r14,1
LB_50849:
	cmp r14,r10
	jge LB_50850
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50848
	cmp al,10
	jz LB_50848
	cmp al,32
	jz LB_50848
LB_50850:
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50851
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50852
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50852:
	jmp LB_50837
LB_50851:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_50855
LB_50854:
	add r14,1
LB_50855:
	cmp r14,r10
	jge LB_50856
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50854
	cmp al,10
	jz LB_50854
	cmp al,32
	jz LB_50854
LB_50856:
	add r14,1
	cmp r14,r10
	jg LB_50861
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_50861
	jmp LB_50862
LB_50861:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50858
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50858:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50859
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50859:
	jmp LB_50837
LB_50862:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_50864
LB_50863:
	add r14,1
LB_50864:
	cmp r14,r10
	jge LB_50865
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50863
	cmp al,10
	jz LB_50863
	cmp al,32
	jz LB_50863
LB_50865:
	push r10
	call NS_E_49568_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50866
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_50867
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_50867:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50868
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50868:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50869
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50869:
	jmp LB_50837
LB_50866:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_50872
LB_50871:
	add r14,1
LB_50872:
	cmp r14,r10
	jge LB_50873
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50871
	cmp al,10
	jz LB_50871
	cmp al,32
	jz LB_50871
LB_50873:
	push r10
	call NS_E_49848_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50874
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_50875
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_50875:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_50876
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_50876:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50877
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50877:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50878
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50878:
	jmp LB_50837
LB_50874:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_50846
	btr r12,4
	jmp LB_50847
LB_50846:
	bts r12,4
LB_50847:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_50844
	btr r12,3
	jmp LB_50845
LB_50844:
	bts r12,3
LB_50845:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_50842
	btr r12,2
	jmp LB_50843
LB_50842:
	bts r12,2
LB_50843:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_50840
	btr r12,1
	jmp LB_50841
LB_50840:
	bts r12,1
LB_50841:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50838
	btr r12,0
	jmp LB_50839
LB_50838:
	bts r12,0
LB_50839:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_50833
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_50887
	btr r12,5
	jmp LB_50888
LB_50887:
	bts r12,5
LB_50888:
	mov r8,r10
	bt r12,4
	jc LB_50889
	btr r12,2
	jmp LB_50890
LB_50889:
	bts r12,2
LB_50890:
	mov r10,r14
	bt r12,1
	jc LB_50891
	btr r12,4
	jmp LB_50892
LB_50891:
	bts r12,4
LB_50892:
	mov r14,r9
	bt r12,3
	jc LB_50893
	btr r12,1
	jmp LB_50894
LB_50893:
	bts r12,1
LB_50894:
	mov r9,r13
	bt r12,0
	jc LB_50895
	btr r12,3
	jmp LB_50896
LB_50895:
	bts r12,3
LB_50896:
	mov r13,r10
	bt r12,4
	jc LB_50897
	btr r12,0
	jmp LB_50898
LB_50897:
	bts r12,0
LB_50898:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { { %_49938 %_49939 } %_49940 } ⊢ %_49941 : %_49941
 ; {>  %_49939~1':_p47789 %_49938~0':_stg %_49940~2':(_lst)◂({ _stg _p47789 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_49941 ⊢ %_49942 : %_49942
 ; {>  %_49941~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p47789 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_49942
 ; {>  %_49942~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p47789 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_50823
	btr r12,5
	jmp LB_50824
LB_50823:
	bts r12,5
LB_50824:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_50821
	btr QWORD [rdi],0
	jmp LB_50822
LB_50821:
	bts QWORD [rdi],0
LB_50822:
	mov r11,r14
	bt r12,1
	jc LB_50827
	btr r12,5
	jmp LB_50828
LB_50827:
	bts r12,5
LB_50828:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_50825
	btr QWORD [rdi],1
	jmp LB_50826
LB_50825:
	bts QWORD [rdi],1
LB_50826:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_50819
	btr QWORD [rdi],0
	jmp LB_50820
LB_50819:
	bts QWORD [rdi],0
LB_50820:
	mov r10,r8
	bt r12,2
	jc LB_50831
	btr r12,4
	jmp LB_50832
LB_50831:
	bts r12,4
LB_50832:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_50829
	btr QWORD [rdi],1
	jmp LB_50830
LB_50829:
	bts QWORD [rdi],1
LB_50830:
	mov rsi,1
	bt r12,3
	jc LB_50817
	mov rsi,0
	bt r9,0
	jc LB_50817
	jmp LB_50818
LB_50817:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50818:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50833:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50835
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50834
LB_50835:
	add rsp,8
	ret
LB_50837:
	add rsp,80
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
LB_50836:
	add rsp,80
	pop r14
LB_50834:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_50901
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_49943 : %_49943
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_49943 ⊢ %_49944 : %_49944
 ; {>  %_49943~°1◂{  }:(_lst)◂(t16662'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_49944
 ; {>  %_49944~°0◂°1◂{  }:(_opn)◂((_lst)◂(t16665'(0))) }
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
	jc LB_50899
	mov rsi,0
	bt r9,0
	jc LB_50899
	jmp LB_50900
LB_50899:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50900:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50901:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50903
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50902
LB_50903:
	add rsp,8
	ret
LB_50904:
	add rsp,0
	pop r14
LB_50902:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49849:
NS_E_RDI_49849:
NS_E_49849_ETR_TBL:
NS_E_49849_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "@"
	jmp LB_50969
LB_50968:
	add r14,1
LB_50969:
	cmp r14,r10
	jge LB_50970
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50968
	cmp al,10
	jz LB_50968
	cmp al,32
	jz LB_50968
LB_50970:
	add r14,1
	cmp r14,r10
	jg LB_50973
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_50973
	jmp LB_50974
LB_50973:
	jmp LB_50916
LB_50974:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_50931
LB_50930:
	add r14,1
LB_50931:
	cmp r14,r10
	jge LB_50932
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50930
	cmp al,10
	jz LB_50930
	cmp al,32
	jz LB_50930
LB_50932:
	add r14,1
	cmp r14,r10
	jg LB_50936
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_50936
	jmp LB_50937
LB_50936:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50934
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50934:
	jmp LB_50917
LB_50937:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_50939
LB_50938:
	add r14,1
LB_50939:
	cmp r14,r10
	jge LB_50940
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50938
	cmp al,10
	jz LB_50938
	cmp al,32
	jz LB_50938
LB_50940:
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50941
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50942
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50942:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50943
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50943:
	jmp LB_50917
LB_50941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_50946
LB_50945:
	add r14,1
LB_50946:
	cmp r14,r10
	jge LB_50947
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50945
	cmp al,10
	jz LB_50945
	cmp al,32
	jz LB_50945
LB_50947:
	push r10
	call NS_E_49298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50948
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_50949
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_50949:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50950
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50950:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50951
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50951:
	jmp LB_50917
LB_50948:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_50954
LB_50953:
	add r14,1
LB_50954:
	cmp r14,r10
	jge LB_50955
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50953
	cmp al,10
	jz LB_50953
	cmp al,32
	jz LB_50953
LB_50955:
	push r10
	call NS_E_49853_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_50956
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_50957
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_50957:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_50958
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_50958:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_50959
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_50959:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_50960
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_50960:
	jmp LB_50917
LB_50956:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; ⟦ qlq_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_50966:
	jmp LB_50963
LB_50962:
	add r14,1
LB_50963:
	cmp r14,r10
	jge LB_50964
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_50962
	cmp al,10
	jz LB_50962
	cmp al,32
	jz LB_50962
LB_50964:
	push r10
	push rsi
	call NS_E_49851_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_50965
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_50967
	bts QWORD [rax],0
LB_50967:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_50966
LB_50965:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_50928
	btr r12,5
	jmp LB_50929
LB_50928:
	bts r12,5
LB_50929:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_50926
	btr r12,4
	jmp LB_50927
LB_50926:
	bts r12,4
LB_50927:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_50924
	btr r12,3
	jmp LB_50925
LB_50924:
	bts r12,3
LB_50925:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_50922
	btr r12,2
	jmp LB_50923
LB_50922:
	bts r12,2
LB_50923:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_50920
	btr r12,1
	jmp LB_50921
LB_50920:
	bts r12,1
LB_50921:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_50918
	btr r12,0
	jmp LB_50919
LB_50918:
	bts r12,0
LB_50919:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_50913
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_50975
	btr r12,6
	jmp LB_50976
LB_50975:
	bts r12,6
LB_50976:
	mov r9,r11
	bt r12,5
	jc LB_50977
	btr r12,3
	jmp LB_50978
LB_50977:
	bts r12,3
LB_50978:
	mov r11,r8
	bt r12,2
	jc LB_50979
	btr r12,5
	jmp LB_50980
LB_50979:
	bts r12,5
LB_50980:
	mov r8,r10
	bt r12,4
	jc LB_50981
	btr r12,2
	jmp LB_50982
LB_50981:
	bts r12,2
LB_50982:
	mov r10,r14
	bt r12,1
	jc LB_50983
	btr r12,4
	jmp LB_50984
LB_50983:
	bts r12,4
LB_50984:
	mov r14,rcx
	bt r12,6
	jc LB_50985
	btr r12,1
	jmp LB_50986
LB_50985:
	bts r12,1
LB_50986:
	mov rcx,r13
	bt r12,0
	jc LB_50987
	btr r12,6
	jmp LB_50988
LB_50987:
	bts r12,6
LB_50988:
	mov r13,r11
	bt r12,5
	jc LB_50989
	btr r12,0
	jmp LB_50990
LB_50989:
	bts r12,0
LB_50990:
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_49949 : %_49949
 ; {>  %_49948~3':(_lst)◂(_p49850) %_49945~0':_stg %_49947~2':_p47791 %_49946~1':_p47788 }
; _nil {  } ⊢ °1◂{  }
; _f47802 %_49949 ⊢ %_49950 : %_49950
 ; {>  %_49948~3':(_lst)◂(_p49850) %_49949~°1◂{  }:(_lst)◂(t16674'(0)) %_49945~0':_stg %_49947~2':_p47791 %_49946~1':_p47788 }
; _f47802 °1◂{  } ⊢ °3◂°1◂{  }
; _some %_49950 ⊢ %_49951 : %_49951
 ; {>  %_49948~3':(_lst)◂(_p49850) %_49950~°3◂°1◂{  }:_p47772 %_49945~0':_stg %_49947~2':_p47791 %_49946~1':_p47788 }
; _some °3◂°1◂{  } ⊢ °0◂°3◂°1◂{  }
; ∎ %_49951
 ; {>  %_49948~3':(_lst)◂(_p49850) %_49951~°0◂°3◂°1◂{  }:(_opn)◂(_p47772) %_49945~0':_stg %_49947~2':_p47791 %_49946~1':_p47788 }
; 	∎ °0◂°3◂°1◂{  }
	bt r12,3
	jc LB_50905
	mov rdi,r9
	call dlt
LB_50905:
	bt r12,0
	jc LB_50906
	mov rdi,r13
	call dlt
LB_50906:
	bt r12,2
	jc LB_50907
	mov rdi,r8
	call dlt
LB_50907:
	bt r12,1
	jc LB_50908
	mov rdi,r14
	call dlt
LB_50908:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°3◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_50911
	mov rsi,0
	bt r9,0
	jc LB_50911
	jmp LB_50912
LB_50911:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50912:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_50909
	mov rsi,0
	bt r9,0
	jc LB_50909
	jmp LB_50910
LB_50909:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50910:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_50913:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_50915
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_50914
LB_50915:
	add rsp,8
	ret
LB_50917:
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
LB_50916:
	add rsp,96
	pop r14
LB_50914:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_51010
LB_51009:
	add r14,1
LB_51010:
	cmp r14,r10
	jge LB_51011
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51009
	cmp al,10
	jz LB_51009
	cmp al,32
	jz LB_51009
LB_51011:
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51012
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51004
LB_51012:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_51015
LB_51014:
	add r14,1
LB_51015:
	cmp r14,r10
	jge LB_51016
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51014
	cmp al,10
	jz LB_51014
	cmp al,32
	jz LB_51014
LB_51016:
	push r10
	call NS_E_49852_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51017
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51018
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51018:
	jmp LB_51004
LB_51017:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51007
	btr r12,1
	jmp LB_51008
LB_51007:
	bts r12,1
LB_51008:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51005
	btr r12,0
	jmp LB_51006
LB_51005:
	bts r12,0
LB_51006:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_51001
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f47801 { %_49952 %_49953 } ⊢ %_49954 : %_49954
 ; {>  %_49952~0':_stg %_49953~1':_p47774 }
; _f47801 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_49954 ⊢ %_49955 : %_49955
 ; {>  %_49954~°2◂{ 0' 1' }:_p47772 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_49955
 ; {>  %_49955~°0◂°2◂{ 0' 1' }:(_opn)◂(_p47772) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_50995
	btr r12,2
	jmp LB_50996
LB_50995:
	bts r12,2
LB_50996:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_50993
	btr QWORD [rdi],0
	jmp LB_50994
LB_50993:
	bts QWORD [rdi],0
LB_50994:
	mov r8,r14
	bt r12,1
	jc LB_50999
	btr r12,2
	jmp LB_51000
LB_50999:
	bts r12,2
LB_51000:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_50997
	btr QWORD [rdi],1
	jmp LB_50998
LB_50997:
	bts QWORD [rdi],1
LB_50998:
	mov rsi,1
	bt r12,3
	jc LB_50991
	mov rsi,0
	bt r9,0
	jc LB_50991
	jmp LB_50992
LB_50991:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_50992:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_51001:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51003
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51002
LB_51003:
	add rsp,8
	ret
LB_51004:
	add rsp,32
	pop r14
LB_51002:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49851:
NS_E_RDI_49851:
NS_E_49851_ETR_TBL:
NS_E_49851_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "@"
	jmp LB_51028
LB_51027:
	add r14,1
LB_51028:
	cmp r14,r10
	jge LB_51029
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51027
	cmp al,10
	jz LB_51027
	cmp al,32
	jz LB_51027
LB_51029:
	add r14,1
	cmp r14,r10
	jg LB_51032
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_51032
	jmp LB_51033
LB_51032:
	jmp LB_51020
LB_51033:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_51035
LB_51034:
	add r14,1
LB_51035:
	cmp r14,r10
	jge LB_51036
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51034
	cmp al,10
	jz LB_51034
	cmp al,32
	jz LB_51034
LB_51036:
	add r14,1
	cmp r14,r10
	jg LB_51040
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_51040
	jmp LB_51041
LB_51040:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51038
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51038:
	jmp LB_51020
LB_51041:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_51043
LB_51042:
	add r14,1
LB_51043:
	cmp r14,r10
	jge LB_51044
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51042
	cmp al,10
	jz LB_51042
	cmp al,32
	jz LB_51042
LB_51044:
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51045
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51046
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51046:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51047
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51047:
	jmp LB_51020
LB_51045:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_51050
LB_51049:
	add r14,1
LB_51050:
	cmp r14,r10
	jge LB_51051
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51049
	cmp al,10
	jz LB_51049
	cmp al,32
	jz LB_51049
LB_51051:
	push r10
	call NS_E_49298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51052
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_51053
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_51053:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51054
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51054:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51055
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51055:
	jmp LB_51020
LB_51052:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_51058
LB_51057:
	add r14,1
LB_51058:
	cmp r14,r10
	jge LB_51059
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51057
	cmp al,10
	jz LB_51057
	cmp al,32
	jz LB_51057
LB_51059:
	push r10
	call NS_E_49853_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51060
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_51061
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_51061:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_51062
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_51062:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51063
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51063:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51064
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51064:
	jmp LB_51020
LB_51060:
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
	jc LB_51021
	btr QWORD [rdi],4
LB_51021:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_51022
	btr QWORD [rdi],3
LB_51022:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_51023
	btr QWORD [rdi],2
LB_51023:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51024
	btr QWORD [rdi],1
LB_51024:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51025
	btr QWORD [rdi],0
LB_51025:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_51020:
	add rsp,80
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
NS_E_49852:
NS_E_RDI_49852:
NS_E_49852_ETR_TBL:
NS_E_49852_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_51086
LB_51085:
	add r14,1
LB_51086:
	cmp r14,r10
	jge LB_51087
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51085
	cmp al,10
	jz LB_51085
	cmp al,32
	jz LB_51085
LB_51087:
	add r14,1
	cmp r14,r10
	jg LB_51090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_51090
	jmp LB_51091
LB_51090:
	jmp LB_51073
LB_51091:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_51080
LB_51079:
	add r14,1
LB_51080:
	cmp r14,r10
	jge LB_51081
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51079
	cmp al,10
	jz LB_51079
	cmp al,32
	jz LB_51079
LB_51081:
	push r10
	call NS_E_48905_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51082
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51083
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51083:
	jmp LB_51074
LB_51082:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51077
	btr r12,1
	jmp LB_51078
LB_51077:
	bts r12,1
LB_51078:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51075
	btr r12,0
	jmp LB_51076
LB_51075:
	bts r12,0
LB_51076:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_51070
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_51092
	btr r12,2
	jmp LB_51093
LB_51092:
	bts r12,2
LB_51093:
	mov r13,r14
	bt r12,1
	jc LB_51094
	btr r12,0
	jmp LB_51095
LB_51094:
	bts r12,0
LB_51095:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47808 %_49957 ⊢ %_49958 : %_49958
 ; {>  %_49957~0':_p47790 }
; _f47808 0' ⊢ °1◂0'
; _some %_49958 ⊢ %_49959 : %_49959
 ; {>  %_49958~°1◂0':_p47774 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_49959
 ; {>  %_49959~°0◂°1◂0':(_opn)◂(_p47774) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_51068
	btr r12,3
	jmp LB_51069
LB_51068:
	bts r12,3
LB_51069:
	mov rsi,1
	bt r12,3
	jc LB_51066
	mov rsi,0
	bt r9,0
	jc LB_51066
	jmp LB_51067
LB_51066:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_51067:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_51070:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51072
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51071
LB_51072:
	add rsp,8
	ret
LB_51074:
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
LB_51073:
	add rsp,32
	pop r14
LB_51071:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_51116
LB_51115:
	add r14,1
LB_51116:
	cmp r14,r10
	jge LB_51117
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51115
	cmp al,10
	jz LB_51115
	cmp al,32
	jz LB_51115
LB_51117:
	add r14,2
	cmp r14,r10
	jg LB_51120
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_51120
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_51120
	jmp LB_51121
LB_51120:
	jmp LB_51103
LB_51121:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_51110
LB_51109:
	add r14,1
LB_51110:
	cmp r14,r10
	jge LB_51111
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51109
	cmp al,10
	jz LB_51109
	cmp al,32
	jz LB_51109
LB_51111:
	push r10
	call NS_E_49853_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51112
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51113
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51113:
	jmp LB_51104
LB_51112:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51107
	btr r12,1
	jmp LB_51108
LB_51107:
	bts r12,1
LB_51108:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51105
	btr r12,0
	jmp LB_51106
LB_51105:
	bts r12,0
LB_51106:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_51100
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_51122
	btr r12,2
	jmp LB_51123
LB_51122:
	bts r12,2
LB_51123:
	mov r13,r14
	bt r12,1
	jc LB_51124
	btr r12,0
	jmp LB_51125
LB_51124:
	bts r12,0
LB_51125:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47809 %_49960 ⊢ %_49961 : %_49961
 ; {>  %_49960~0':_p47791 }
; _f47809 0' ⊢ °2◂0'
; _some %_49961 ⊢ %_49962 : %_49962
 ; {>  %_49961~°2◂0':_p47774 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_49962
 ; {>  %_49962~°0◂°2◂0':(_opn)◂(_p47774) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_51098
	btr r12,3
	jmp LB_51099
LB_51098:
	bts r12,3
LB_51099:
	mov rsi,1
	bt r12,3
	jc LB_51096
	mov rsi,0
	bt r9,0
	jc LB_51096
	jmp LB_51097
LB_51096:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_51097:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_51100:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51102
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51101
LB_51102:
	add rsp,8
	ret
LB_51104:
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
LB_51103:
	add rsp,32
	pop r14
LB_51101:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_51145
LB_51144:
	add r14,1
LB_51145:
	cmp r14,r10
	jge LB_51146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51144
	cmp al,10
	jz LB_51144
	cmp al,32
	jz LB_51144
LB_51146:
	push r10
	call NS_E_49298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51147
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51139
LB_51147:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_51150
LB_51149:
	add r14,1
LB_51150:
	cmp r14,r10
	jge LB_51151
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51149
	cmp al,10
	jz LB_51149
	cmp al,32
	jz LB_51149
LB_51151:
	push r10
	call NS_E_49853_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51152
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51153
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51153:
	jmp LB_51139
LB_51152:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51142
	btr r12,1
	jmp LB_51143
LB_51142:
	bts r12,1
LB_51143:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51140
	btr r12,0
	jmp LB_51141
LB_51140:
	bts r12,0
LB_51141:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_51136
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f47807 { %_49963 %_49964 } ⊢ %_49965 : %_49965
 ; {>  %_49964~1':_p47791 %_49963~0':_p47788 }
; _f47807 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_49965 ⊢ %_49966 : %_49966
 ; {>  %_49965~°0◂{ 0' 1' }:_p47774 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_49966
 ; {>  %_49966~°0◂°0◂{ 0' 1' }:(_opn)◂(_p47774) }
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
	jc LB_51130
	btr r12,2
	jmp LB_51131
LB_51130:
	bts r12,2
LB_51131:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_51128
	btr QWORD [rdi],0
	jmp LB_51129
LB_51128:
	bts QWORD [rdi],0
LB_51129:
	mov r8,r14
	bt r12,1
	jc LB_51134
	btr r12,2
	jmp LB_51135
LB_51134:
	bts r12,2
LB_51135:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_51132
	btr QWORD [rdi],1
	jmp LB_51133
LB_51132:
	bts QWORD [rdi],1
LB_51133:
	mov rsi,1
	bt r12,3
	jc LB_51126
	mov rsi,0
	bt r9,0
	jc LB_51126
	jmp LB_51127
LB_51126:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_51127:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_51136:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51138
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51137
LB_51138:
	add rsp,8
	ret
LB_51139:
	add rsp,32
	pop r14
LB_51137:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49853:
NS_E_RDI_49853:
NS_E_49853_ETR_TBL:
NS_E_49853_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_51168
LB_51167:
	add r14,1
LB_51168:
	cmp r14,r10
	jge LB_51169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51167
	cmp al,10
	jz LB_51167
	cmp al,32
	jz LB_51167
LB_51169:
	add r14,3
	cmp r14,r10
	jg LB_51172
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_51172
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_51172
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_51172
	jmp LB_51173
LB_51172:
	jmp LB_51162
LB_51173:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_51175
LB_51174:
	add r14,1
LB_51175:
	cmp r14,r10
	jge LB_51176
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51174
	cmp al,10
	jz LB_51174
	cmp al,32
	jz LB_51174
LB_51176:
	push r10
	call NS_E_49034_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51177
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51178
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51178:
	jmp LB_51162
LB_51177:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51165
	btr r12,1
	jmp LB_51166
LB_51165:
	bts r12,1
LB_51166:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51163
	btr r12,0
	jmp LB_51164
LB_51163:
	bts r12,0
LB_51164:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_51159
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_51180
	btr r12,2
	jmp LB_51181
LB_51180:
	bts r12,2
LB_51181:
	mov r13,r14
	bt r12,1
	jc LB_51182
	btr r12,0
	jmp LB_51183
LB_51182:
	bts r12,0
LB_51183:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47849 %_49967 ⊢ %_49968 : %_49968
 ; {>  %_49967~0':_p47787 }
; _f47849 0' ⊢ °2◂0'
; _some %_49968 ⊢ %_49969 : %_49969
 ; {>  %_49968~°2◂0':_p47791 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_49969
 ; {>  %_49969~°0◂°2◂0':(_opn)◂(_p47791) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_51157
	btr r12,3
	jmp LB_51158
LB_51157:
	bts r12,3
LB_51158:
	mov rsi,1
	bt r12,3
	jc LB_51155
	mov rsi,0
	bt r9,0
	jc LB_51155
	jmp LB_51156
LB_51155:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_51156:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_51159:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51161
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51160
LB_51161:
	add rsp,8
	ret
LB_51162:
	add rsp,32
	pop r14
LB_51160:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_51195
LB_51194:
	add r14,1
LB_51195:
	cmp r14,r10
	jge LB_51196
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51194
	cmp al,10
	jz LB_51194
	cmp al,32
	jz LB_51194
LB_51196:
	push r10
	call NS_E_49861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51197
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51191
LB_51197:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51192
	btr r12,0
	jmp LB_51193
LB_51192:
	bts r12,0
LB_51193:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_51188
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47848 %_49970 ⊢ %_49971 : %_49971
 ; {>  %_49970~0':_p47792 }
; _f47848 0' ⊢ °1◂0'
; _some %_49971 ⊢ %_49972 : %_49972
 ; {>  %_49971~°1◂0':_p47791 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_49972
 ; {>  %_49972~°0◂°1◂0':(_opn)◂(_p47791) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_51186
	btr r12,3
	jmp LB_51187
LB_51186:
	bts r12,3
LB_51187:
	mov rsi,1
	bt r12,3
	jc LB_51184
	mov rsi,0
	bt r9,0
	jc LB_51184
	jmp LB_51185
LB_51184:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_51185:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_51188:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51190
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51189
LB_51190:
	add rsp,8
	ret
LB_51191:
	add rsp,16
	pop r14
LB_51189:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; lc_line
	jmp LB_51211
LB_51210:
	add r14,1
LB_51211:
	cmp r14,r10
	jge LB_51212
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51210
	cmp al,10
	jz LB_51210
	cmp al,32
	jz LB_51210
LB_51212:
	push r10
	call NS_E_49854_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51213
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51205
LB_51213:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_51216
LB_51215:
	add r14,1
LB_51216:
	cmp r14,r10
	jge LB_51217
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51215
	cmp al,10
	jz LB_51215
	cmp al,32
	jz LB_51215
LB_51217:
	push r10
	call NS_E_49853_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51218
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51219
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51219:
	jmp LB_51205
LB_51218:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51208
	btr r12,1
	jmp LB_51209
LB_51208:
	bts r12,1
LB_51209:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51206
	btr r12,0
	jmp LB_51207
LB_51206:
	bts r12,0
LB_51207:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_51202
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' 2' } 3' }
	mov r9,r14
	bt r12,1
	jc LB_51221
	btr r12,3
	jmp LB_51222
LB_51221:
	bts r12,3
LB_51222:
	mov r10,r13
	bt r12,0
	jc LB_51223
	btr r12,4
	jmp LB_51224
LB_51223:
	bts r12,4
LB_51224:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_51227
	btr r12,5
	jmp LB_51228
LB_51227:
	bts r12,5
LB_51228:
	mov r13,r11
	bt r12,5
	jc LB_51225
	btr r12,0
	jmp LB_51226
LB_51225:
	bts r12,0
LB_51226:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_51231
	btr r12,5
	jmp LB_51232
LB_51231:
	bts r12,5
LB_51232:
	mov r14,r11
	bt r12,5
	jc LB_51229
	btr r12,1
	jmp LB_51230
LB_51229:
	bts r12,1
LB_51230:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_51235
	btr r12,5
	jmp LB_51236
LB_51235:
	bts r12,5
LB_51236:
	mov r8,r11
	bt r12,5
	jc LB_51233
	btr r12,2
	jmp LB_51234
LB_51233:
	bts r12,2
LB_51234:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_49974 ⊢ %_49975 : %_49975
 ; {>  %_49973~{ 0' 1' 2' }:{ _p47796 _p47787 _p47788 } %_49974~3':_p47791 }
; _some 3' ⊢ °0◂3'
; ∎ %_49975
 ; {>  %_49975~°0◂3':(_opn)◂(_p47791) %_49973~{ 0' 1' 2' }:{ _p47796 _p47787 _p47788 } }
; 	∎ °0◂3'
	bt r12,0
	jc LB_51199
	mov rdi,r13
	call dlt
LB_51199:
	bt r12,1
	jc LB_51200
	mov rdi,r14
	call dlt
LB_51200:
	bt r12,2
	jc LB_51201
	mov rdi,r8
	call dlt
LB_51201:
; _emt_mov_ptn_to_ptn:{| 00010.. |},°0◂3' ⊢ 2'◂3'
	mov r8,0
	bts r12,2
	ret
LB_51202:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51204
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51203
LB_51204:
	add rsp,8
	ret
LB_51205:
	add rsp,32
	pop r14
LB_51203:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49854:
NS_E_RDI_49854:
NS_E_49854_ETR_TBL:
NS_E_49854_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_51302
LB_51301:
	add r14,1
LB_51302:
	cmp r14,r10
	jge LB_51303
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51301
	cmp al,10
	jz LB_51301
	cmp al,32
	jz LB_51301
LB_51303:
	add r14,1
	cmp r14,r10
	jg LB_51306
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_51306
	jmp LB_51307
LB_51306:
	jmp LB_51257
LB_51307:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_51270
LB_51269:
	add r14,1
LB_51270:
	cmp r14,r10
	jge LB_51271
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51269
	cmp al,10
	jz LB_51269
	cmp al,32
	jz LB_51269
LB_51271:
	push r10
	call NS_E_49034_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51272
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51273
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51273:
	jmp LB_51258
LB_51272:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_51276
LB_51275:
	add r14,1
LB_51276:
	cmp r14,r10
	jge LB_51277
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51275
	cmp al,10
	jz LB_51275
	cmp al,32
	jz LB_51275
LB_51277:
	add r14,3
	cmp r14,r10
	jg LB_51282
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_51282
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_51282
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_51282
	jmp LB_51283
LB_51282:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51279
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51279:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51280
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51280:
	jmp LB_51258
LB_51283:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_51285
LB_51284:
	add r14,1
LB_51285:
	cmp r14,r10
	jge LB_51286
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51284
	cmp al,10
	jz LB_51284
	cmp al,32
	jz LB_51284
LB_51286:
	push r10
	call NS_E_49298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51287
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_51288
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_51288:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51289
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51289:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51290
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51290:
	jmp LB_51258
LB_51287:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_51293
LB_51292:
	add r14,1
LB_51293:
	cmp r14,r10
	jge LB_51294
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51292
	cmp al,10
	jz LB_51292
	cmp al,32
	jz LB_51292
LB_51294:
	push r10
	call NS_E_49301_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51295
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_51296
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_51296:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_51297
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_51297:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51298
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51298:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51299
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51299:
	jmp LB_51258
LB_51295:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_51267
	btr r12,4
	jmp LB_51268
LB_51267:
	bts r12,4
LB_51268:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_51265
	btr r12,3
	jmp LB_51266
LB_51265:
	bts r12,3
LB_51266:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_51263
	btr r12,2
	jmp LB_51264
LB_51263:
	bts r12,2
LB_51264:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51261
	btr r12,1
	jmp LB_51262
LB_51261:
	bts r12,1
LB_51262:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51259
	btr r12,0
	jmp LB_51260
LB_51259:
	bts r12,0
LB_51260:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_51254
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_51308
	btr r12,5
	jmp LB_51309
LB_51308:
	bts r12,5
LB_51309:
	mov r8,r10
	bt r12,4
	jc LB_51310
	btr r12,2
	jmp LB_51311
LB_51310:
	bts r12,2
LB_51311:
	mov r10,r14
	bt r12,1
	jc LB_51312
	btr r12,4
	jmp LB_51313
LB_51312:
	bts r12,4
LB_51313:
	mov r14,r9
	bt r12,3
	jc LB_51314
	btr r12,1
	jmp LB_51315
LB_51314:
	bts r12,1
LB_51315:
	mov r9,r13
	bt r12,0
	jc LB_51316
	btr r12,3
	jmp LB_51317
LB_51316:
	bts r12,3
LB_51317:
	mov r13,r10
	bt r12,4
	jc LB_51318
	btr r12,0
	jmp LB_51319
LB_51318:
	bts r12,0
LB_51319:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_49979 : %_49979
 ; {>  %_49978~2':_p49300 %_49976~0':_p47787 %_49977~1':_p47788 }
; 	» 0xr1 _ ⊢ 3' : %_49979
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f47859 %_49979 ⊢ %_49980 : %_49980
 ; {>  %_49978~2':_p49300 %_49976~0':_p47787 %_49977~1':_p47788 %_49979~3':_r64 }
; _f47859 3' ⊢ °1◂3'
; _some { %_49980 %_49976 %_49977 } ⊢ %_49981 : %_49981
 ; {>  %_49980~°1◂3':_p47796 %_49978~2':_p49300 %_49976~0':_p47787 %_49977~1':_p47788 }
; _some { °1◂3' 0' 1' } ⊢ °0◂{ °1◂3' 0' 1' }
; ∎ %_49981
 ; {>  %_49978~2':_p49300 %_49981~°0◂{ °1◂3' 0' 1' }:(_opn)◂({ _p47796 _p47787 _p47788 }) }
; 	∎ °0◂{ °1◂3' 0' 1' }
	bt r12,2
	jc LB_51237
	mov rdi,r8
	call dlt
LB_51237:
; _emt_mov_ptn_to_ptn:{| 11010.. |},°0◂{ °1◂3' 0' 1' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_51238
	btr r12,4
	jmp LB_51239
LB_51238:
	bts r12,4
LB_51239:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r10
	bt r12,4
	jc LB_51244
	btr r12,2
	jmp LB_51245
LB_51244:
	bts r12,2
LB_51245:
	mov rsi,1
	bt r12,2
	jc LB_51242
	mov rsi,0
	bt r8,0
	jc LB_51242
	jmp LB_51243
LB_51242:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_51243:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_51240
	btr QWORD [rdi],0
	jmp LB_51241
LB_51240:
	bts QWORD [rdi],0
LB_51241:
	mov r8,r13
	bt r12,0
	jc LB_51248
	btr r12,2
	jmp LB_51249
LB_51248:
	bts r12,2
LB_51249:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_51246
	btr QWORD [rdi],1
	jmp LB_51247
LB_51246:
	bts QWORD [rdi],1
LB_51247:
	mov r8,r14
	bt r12,1
	jc LB_51252
	btr r12,2
	jmp LB_51253
LB_51252:
	bts r12,2
LB_51253:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_51250
	btr QWORD [rdi],2
	jmp LB_51251
LB_51250:
	bts QWORD [rdi],2
LB_51251:
	mov r8,0
	bts r12,2
	ret
LB_51254:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51256
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51255
LB_51256:
	add rsp,8
	ret
LB_51258:
	add rsp,80
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
LB_51257:
	add rsp,80
	pop r14
LB_51255:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_51412
LB_51411:
	add r14,1
LB_51412:
	cmp r14,r10
	jge LB_51413
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51411
	cmp al,10
	jz LB_51411
	cmp al,32
	jz LB_51411
LB_51413:
	add r14,3
	cmp r14,r10
	jg LB_51416
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_51416
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_51416
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_51416
	jmp LB_51417
LB_51416:
	jmp LB_51353
LB_51417:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_51368
LB_51367:
	add r14,1
LB_51368:
	cmp r14,r10
	jge LB_51369
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51367
	cmp al,10
	jz LB_51367
	cmp al,32
	jz LB_51367
LB_51369:
	push r10
	call NS_E_49034_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51370
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51371
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51371:
	jmp LB_51354
LB_51370:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_51374
LB_51373:
	add r14,1
LB_51374:
	cmp r14,r10
	jge LB_51375
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51373
	cmp al,10
	jz LB_51373
	cmp al,32
	jz LB_51373
LB_51375:
	add r14,1
	cmp r14,r10
	jg LB_51380
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_51380
	jmp LB_51381
LB_51380:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51377
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51377:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51378
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51378:
	jmp LB_51354
LB_51381:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_51383
LB_51382:
	add r14,1
LB_51383:
	cmp r14,r10
	jge LB_51384
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51382
	cmp al,10
	jz LB_51382
	cmp al,32
	jz LB_51382
LB_51384:
	push r10
	call NS_E_49034_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51385
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_51386
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_51386:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51387
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51387:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51388
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51388:
	jmp LB_51354
LB_51385:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_51391
LB_51390:
	add r14,1
LB_51391:
	cmp r14,r10
	jge LB_51392
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51390
	cmp al,10
	jz LB_51390
	cmp al,32
	jz LB_51390
LB_51392:
	add r14,3
	cmp r14,r10
	jg LB_51399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_51399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_51399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_51399
	jmp LB_51400
LB_51399:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_51394
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_51394:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_51395
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_51395:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51396
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51396:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51397
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51397:
	jmp LB_51354
LB_51400:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_51402
LB_51401:
	add r14,1
LB_51402:
	cmp r14,r10
	jge LB_51403
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51401
	cmp al,10
	jz LB_51401
	cmp al,32
	jz LB_51401
LB_51403:
	push r10
	call NS_E_49298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51404
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_51405
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_51405:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_51406
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_51406:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_51407
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_51407:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51408
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51408:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51409
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51409:
	jmp LB_51354
LB_51404:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_51365
	btr r12,5
	jmp LB_51366
LB_51365:
	bts r12,5
LB_51366:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_51363
	btr r12,4
	jmp LB_51364
LB_51363:
	bts r12,4
LB_51364:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_51361
	btr r12,3
	jmp LB_51362
LB_51361:
	bts r12,3
LB_51362:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_51359
	btr r12,2
	jmp LB_51360
LB_51359:
	bts r12,2
LB_51360:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51357
	btr r12,1
	jmp LB_51358
LB_51357:
	bts r12,1
LB_51358:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51355
	btr r12,0
	jmp LB_51356
LB_51355:
	bts r12,0
LB_51356:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_51350
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_51418
	btr r12,6
	jmp LB_51419
LB_51418:
	bts r12,6
LB_51419:
	mov r8,r11
	bt r12,5
	jc LB_51420
	btr r12,2
	jmp LB_51421
LB_51420:
	bts r12,2
LB_51421:
	mov r11,r14
	bt r12,1
	jc LB_51422
	btr r12,5
	jmp LB_51423
LB_51422:
	bts r12,5
LB_51423:
	mov r14,r9
	bt r12,3
	jc LB_51424
	btr r12,1
	jmp LB_51425
LB_51424:
	bts r12,1
LB_51425:
	mov r9,r13
	bt r12,0
	jc LB_51426
	btr r12,3
	jmp LB_51427
LB_51426:
	bts r12,3
LB_51427:
	mov r13,r11
	bt r12,5
	jc LB_51428
	btr r12,0
	jmp LB_51429
LB_51428:
	bts r12,0
LB_51429:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47860 {  } ⊢ %_49985 : %_49985
 ; {>  %_49984~2':_p47788 %_49983~1':_p47787 %_49982~0':_p47787 }
; _f47860 {  } ⊢ °2◂{  }
; _nil {  } ⊢ %_49986 : %_49986
 ; {>  %_49984~2':_p47788 %_49985~°2◂{  }:_p47796 %_49983~1':_p47787 %_49982~0':_p47787 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_49983 %_49986 } ⊢ %_49987 : %_49987
 ; {>  %_49986~°1◂{  }:(_lst)◂(t16722'(0)) %_49984~2':_p47788 %_49985~°2◂{  }:_p47796 %_49983~1':_p47787 %_49982~0':_p47787 }
; _cns { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; _cns { %_49982 %_49987 } ⊢ %_49988 : %_49988
 ; {>  %_49984~2':_p47788 %_49987~°0◂{ 1' °1◂{  } }:(_lst)◂(_p47787) %_49985~°2◂{  }:_p47796 %_49982~0':_p47787 }
; _cns { 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂{ 0' °0◂{ 1' °1◂{  } } }
; _f47836 %_49988 ⊢ %_49989 : %_49989
 ; {>  %_49984~2':_p47788 %_49985~°2◂{  }:_p47796 %_49988~°0◂{ 0' °0◂{ 1' °1◂{  } } }:(_lst)◂(_p47787) }
; _f47836 °0◂{ 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }
; _some { %_49985 %_49989 %_49984 } ⊢ %_49990 : %_49990
 ; {>  %_49984~2':_p47788 %_49985~°2◂{  }:_p47796 %_49989~°0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }:_p47787 }
; _some { °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; ∎ %_49990
 ; {>  %_49990~°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }:(_opn)◂({ _p47796 _p47787 _p47788 }) }
; 	∎ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_51322
	mov rsi,0
	bt r10,0
	jc LB_51322
	jmp LB_51323
LB_51322:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_51323:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_51320
	btr QWORD [rdi],0
	jmp LB_51321
LB_51320:
	bts QWORD [rdi],0
LB_51321:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_51332
	btr r12,5
	jmp LB_51333
LB_51332:
	bts r12,5
LB_51333:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_51330
	btr QWORD [rdi],0
	jmp LB_51331
LB_51330:
	bts QWORD [rdi],0
LB_51331:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r14
	bt r12,1
	jc LB_51340
	btr r12,0
	jmp LB_51341
LB_51340:
	bts r12,0
LB_51341:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_51338
	btr QWORD [rdi],0
	jmp LB_51339
LB_51338:
	bts QWORD [rdi],0
LB_51339:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_51344
	mov rsi,0
	bt r13,0
	jc LB_51344
	jmp LB_51345
LB_51344:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_51345:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_51342
	btr QWORD [rdi],1
	jmp LB_51343
LB_51342:
	bts QWORD [rdi],1
LB_51343:
	mov rsi,1
	bt r12,5
	jc LB_51336
	mov rsi,0
	bt r11,0
	jc LB_51336
	jmp LB_51337
LB_51336:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_51337:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_51334
	btr QWORD [rdi],1
	jmp LB_51335
LB_51334:
	bts QWORD [rdi],1
LB_51335:
	mov rsi,1
	bt r12,4
	jc LB_51328
	mov rsi,0
	bt r10,0
	jc LB_51328
	jmp LB_51329
LB_51328:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_51329:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_51326
	mov rsi,0
	bt r10,0
	jc LB_51326
	jmp LB_51327
LB_51326:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_51327:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_51324
	btr QWORD [rdi],1
	jmp LB_51325
LB_51324:
	bts QWORD [rdi],1
LB_51325:
	mov r10,r8
	bt r12,2
	jc LB_51348
	btr r12,4
	jmp LB_51349
LB_51348:
	bts r12,4
LB_51349:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_51346
	btr QWORD [rdi],2
	jmp LB_51347
LB_51346:
	bts QWORD [rdi],2
LB_51347:
	mov r8,0
	bts r12,2
	ret
LB_51350:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51352
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51351
LB_51352:
	add rsp,8
	ret
LB_51354:
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
LB_51353:
	add rsp,96
	pop r14
LB_51351:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_51458
LB_51457:
	add r14,1
LB_51458:
	cmp r14,r10
	jge LB_51459
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51457
	cmp al,10
	jz LB_51457
	cmp al,32
	jz LB_51457
LB_51459:
	add r14,2
	cmp r14,r10
	jg LB_51462
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_51462
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_51462
	jmp LB_51463
LB_51462:
	jmp LB_51445
LB_51463:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_51452
LB_51451:
	add r14,1
LB_51452:
	cmp r14,r10
	jge LB_51453
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51451
	cmp al,10
	jz LB_51451
	cmp al,32
	jz LB_51451
LB_51453:
	push r10
	call NS_E_49855_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51454
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51455
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51455:
	jmp LB_51446
LB_51454:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51449
	btr r12,1
	jmp LB_51450
LB_51449:
	bts r12,1
LB_51450:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51447
	btr r12,0
	jmp LB_51448
LB_51447:
	bts r12,0
LB_51448:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_51442
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } { 0' 1' 2' } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_51464
	btr r12,3
	jmp LB_51465
LB_51464:
	bts r12,3
LB_51465:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_51468
	btr r12,4
	jmp LB_51469
LB_51468:
	bts r12,4
LB_51469:
	mov r13,r10
	bt r12,4
	jc LB_51466
	btr r12,0
	jmp LB_51467
LB_51466:
	bts r12,0
LB_51467:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_51472
	btr r12,4
	jmp LB_51473
LB_51472:
	bts r12,4
LB_51473:
	mov r14,r10
	bt r12,4
	jc LB_51470
	btr r12,1
	jmp LB_51471
LB_51470:
	bts r12,1
LB_51471:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_51476
	btr r12,4
	jmp LB_51477
LB_51476:
	bts r12,4
LB_51477:
	mov r8,r10
	bt r12,4
	jc LB_51474
	btr r12,2
	jmp LB_51475
LB_51474:
	bts r12,2
LB_51475:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_49991 ⊢ %_49992 : %_49992
 ; {>  %_49991~{ 0' 1' 2' }:{ _p47796 _p47787 _p47788 } }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_49992
 ; {>  %_49992~°0◂{ 0' 1' 2' }:(_opn)◂({ _p47796 _p47787 _p47788 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_51432
	btr r12,4
	jmp LB_51433
LB_51432:
	bts r12,4
LB_51433:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_51430
	btr QWORD [rdi],0
	jmp LB_51431
LB_51430:
	bts QWORD [rdi],0
LB_51431:
	mov r10,r14
	bt r12,1
	jc LB_51436
	btr r12,4
	jmp LB_51437
LB_51436:
	bts r12,4
LB_51437:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_51434
	btr QWORD [rdi],1
	jmp LB_51435
LB_51434:
	bts QWORD [rdi],1
LB_51435:
	mov r10,r8
	bt r12,2
	jc LB_51440
	btr r12,4
	jmp LB_51441
LB_51440:
	bts r12,4
LB_51441:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_51438
	btr QWORD [rdi],2
	jmp LB_51439
LB_51438:
	bts QWORD [rdi],2
LB_51439:
	mov r8,0
	bts r12,2
	ret
LB_51442:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51444
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51443
LB_51444:
	add rsp,8
	ret
LB_51446:
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
LB_51445:
	add rsp,32
	pop r14
LB_51443:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_51505
LB_51504:
	add r14,1
LB_51505:
	cmp r14,r10
	jge LB_51506
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51504
	cmp al,10
	jz LB_51504
	cmp al,32
	jz LB_51504
LB_51506:
	push r10
	call NS_E_48838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51507
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51495
LB_51507:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_51510
LB_51509:
	add r14,1
LB_51510:
	cmp r14,r10
	jge LB_51511
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51509
	cmp al,10
	jz LB_51509
	cmp al,32
	jz LB_51509
LB_51511:
	push r10
	call NS_E_49034_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51512
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51513
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51513:
	jmp LB_51495
LB_51512:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_51516
LB_51515:
	add r14,1
LB_51516:
	cmp r14,r10
	jge LB_51517
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51515
	cmp al,10
	jz LB_51515
	cmp al,32
	jz LB_51515
LB_51517:
	add r14,3
	cmp r14,r10
	jg LB_51522
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_51522
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_51522
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_51522
	jmp LB_51523
LB_51522:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51519
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51519:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51520
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51520:
	jmp LB_51495
LB_51523:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_51525
LB_51524:
	add r14,1
LB_51525:
	cmp r14,r10
	jge LB_51526
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51524
	cmp al,10
	jz LB_51524
	cmp al,32
	jz LB_51524
LB_51526:
	push r10
	call NS_E_49298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51527
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_51528
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_51528:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51529
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51529:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51530
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51530:
	jmp LB_51495
LB_51527:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_51502
	btr r12,3
	jmp LB_51503
LB_51502:
	bts r12,3
LB_51503:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_51500
	btr r12,2
	jmp LB_51501
LB_51500:
	bts r12,2
LB_51501:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51498
	btr r12,1
	jmp LB_51499
LB_51498:
	bts r12,1
LB_51499:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51496
	btr r12,0
	jmp LB_51497
LB_51496:
	bts r12,0
LB_51497:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_51492
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_51532
	btr r12,4
	jmp LB_51533
LB_51532:
	bts r12,4
LB_51533:
	mov r8,r9
	bt r12,3
	jc LB_51534
	btr r12,2
	jmp LB_51535
LB_51534:
	bts r12,2
LB_51535:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47858 %_49993 ⊢ %_49996 : %_49996
 ; {>  %_49994~1':_p47787 %_49993~0':_p47766 %_49995~2':_p47788 }
; _f47858 0' ⊢ °0◂0'
; _some { %_49996 %_49994 %_49995 } ⊢ %_49997 : %_49997
 ; {>  %_49996~°0◂0':_p47796 %_49994~1':_p47787 %_49995~2':_p47788 }
; _some { °0◂0' 1' 2' } ⊢ °0◂{ °0◂0' 1' 2' }
; ∎ %_49997
 ; {>  %_49997~°0◂{ °0◂0' 1' 2' }:(_opn)◂({ _p47796 _p47787 _p47788 }) }
; 	∎ °0◂{ °0◂0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °0◂0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_51482
	btr r12,4
	jmp LB_51483
LB_51482:
	bts r12,4
LB_51483:
	mov rsi,1
	bt r12,4
	jc LB_51480
	mov rsi,0
	bt r10,0
	jc LB_51480
	jmp LB_51481
LB_51480:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_51481:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_51478
	btr QWORD [rdi],0
	jmp LB_51479
LB_51478:
	bts QWORD [rdi],0
LB_51479:
	mov r10,r14
	bt r12,1
	jc LB_51486
	btr r12,4
	jmp LB_51487
LB_51486:
	bts r12,4
LB_51487:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_51484
	btr QWORD [rdi],1
	jmp LB_51485
LB_51484:
	bts QWORD [rdi],1
LB_51485:
	mov r10,r8
	bt r12,2
	jc LB_51490
	btr r12,4
	jmp LB_51491
LB_51490:
	bts r12,4
LB_51491:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_51488
	btr QWORD [rdi],2
	jmp LB_51489
LB_51488:
	bts QWORD [rdi],2
LB_51489:
	mov r8,0
	bts r12,2
	ret
LB_51492:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51494
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51493
LB_51494:
	add rsp,8
	ret
LB_51495:
	add rsp,64
	pop r14
LB_51493:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49855:
NS_E_RDI_49855:
NS_E_49855_ETR_TBL:
NS_E_49855_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "_^"
	jmp LB_51594
LB_51593:
	add r14,1
LB_51594:
	cmp r14,r10
	jge LB_51595
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51593
	cmp al,10
	jz LB_51593
	cmp al,32
	jz LB_51593
LB_51595:
	add r14,2
	cmp r14,r10
	jg LB_51598
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_51598
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_51598
	jmp LB_51599
LB_51598:
	jmp LB_51561
LB_51599:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_51572
LB_51571:
	add r14,1
LB_51572:
	cmp r14,r10
	jge LB_51573
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51571
	cmp al,10
	jz LB_51571
	cmp al,32
	jz LB_51571
LB_51573:
	push r10
	call NS_E_49856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51574
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51575
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51575:
	jmp LB_51562
LB_51574:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_51581:
	jmp LB_51578
LB_51577:
	add r14,1
LB_51578:
	cmp r14,r10
	jge LB_51579
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51577
	cmp al,10
	jz LB_51577
	cmp al,32
	jz LB_51577
LB_51579:
	push r10
	push rsi
	call NS_E_49857_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_51580
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_51582
	bts QWORD [rax],0
LB_51582:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_51581
LB_51580:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_51584
LB_51583:
	add r14,1
LB_51584:
	cmp r14,r10
	jge LB_51585
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51583
	cmp al,10
	jz LB_51583
	cmp al,32
	jz LB_51583
LB_51585:
	add r14,2
	cmp r14,r10
	jg LB_51591
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_51591
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_51591
	jmp LB_51592
LB_51591:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_51587
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_51587:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51588
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51588:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51589
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51589:
	jmp LB_51562
LB_51592:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_51569
	btr r12,3
	jmp LB_51570
LB_51569:
	bts r12,3
LB_51570:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_51567
	btr r12,2
	jmp LB_51568
LB_51567:
	bts r12,2
LB_51568:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51565
	btr r12,1
	jmp LB_51566
LB_51565:
	bts r12,1
LB_51566:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51563
	btr r12,0
	jmp LB_51564
LB_51563:
	bts r12,0
LB_51564:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_51558
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' 2' } 3' {  } }
	mov r10,r9
	bt r12,3
	jc LB_51600
	btr r12,4
	jmp LB_51601
LB_51600:
	bts r12,4
LB_51601:
	mov r9,r8
	bt r12,2
	jc LB_51602
	btr r12,3
	jmp LB_51603
LB_51602:
	bts r12,3
LB_51603:
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r10,r14
	bt r12,1
	jc LB_51604
	btr r12,4
	jmp LB_51605
LB_51604:
	bts r12,4
LB_51605:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_51608
	btr r12,5
	jmp LB_51609
LB_51608:
	bts r12,5
LB_51609:
	mov r13,r11
	bt r12,5
	jc LB_51606
	btr r12,0
	jmp LB_51607
LB_51606:
	bts r12,0
LB_51607:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_51612
	btr r12,5
	jmp LB_51613
LB_51612:
	bts r12,5
LB_51613:
	mov r14,r11
	bt r12,5
	jc LB_51610
	btr r12,1
	jmp LB_51611
LB_51610:
	bts r12,1
LB_51611:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_51616
	btr r12,5
	jmp LB_51617
LB_51616:
	bts r12,5
LB_51617:
	mov r8,r11
	bt r12,5
	jc LB_51614
	btr r12,2
	jmp LB_51615
LB_51614:
	bts r12,2
LB_51615:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47862 { %_49998 %_50001 } ⊢ %_50002 : %_50002
 ; {>  %_49999~1':_p47787 %_50001~3':(_lst)◂(_p47797) %_49998~0':_r64 %_50000~2':_p47788 }
; _f47862 { 0' 3' } ⊢ °4◂{ 0' 3' }
; _some { %_50002 %_49999 %_50000 } ⊢ %_50003 : %_50003
 ; {>  %_49999~1':_p47787 %_50000~2':_p47788 %_50002~°4◂{ 0' 3' }:_p47796 }
; _some { °4◂{ 0' 3' } 1' 2' } ⊢ °0◂{ °4◂{ 0' 3' } 1' 2' }
; ∎ %_50003
 ; {>  %_50003~°0◂{ °4◂{ 0' 3' } 1' 2' }:(_opn)◂({ _p47796 _p47787 _p47788 }) }
; 	∎ °0◂{ °4◂{ 0' 3' } 1' 2' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °4◂{ 0' 3' } 1' 2' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_51536
	btr r12,4
	jmp LB_51537
LB_51536:
	bts r12,4
LB_51537:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_51544
	btr r12,6
	jmp LB_51545
LB_51544:
	bts r12,6
LB_51545:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_51542
	btr QWORD [rdi],0
	jmp LB_51543
LB_51542:
	bts QWORD [rdi],0
LB_51543:
	mov rcx,r10
	bt r12,4
	jc LB_51548
	btr r12,6
	jmp LB_51549
LB_51548:
	bts r12,6
LB_51549:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_51546
	btr QWORD [rdi],1
	jmp LB_51547
LB_51546:
	bts QWORD [rdi],1
LB_51547:
	mov rsi,1
	bt r12,5
	jc LB_51540
	mov rsi,0
	bt r11,0
	jc LB_51540
	jmp LB_51541
LB_51540:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_51541:
	mov rax,0x0400_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_51538
	btr QWORD [rdi],0
	jmp LB_51539
LB_51538:
	bts QWORD [rdi],0
LB_51539:
	mov r11,r14
	bt r12,1
	jc LB_51552
	btr r12,5
	jmp LB_51553
LB_51552:
	bts r12,5
LB_51553:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_51550
	btr QWORD [rdi],1
	jmp LB_51551
LB_51550:
	bts QWORD [rdi],1
LB_51551:
	mov r11,r8
	bt r12,2
	jc LB_51556
	btr r12,5
	jmp LB_51557
LB_51556:
	bts r12,5
LB_51557:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_51554
	btr QWORD [rdi],2
	jmp LB_51555
LB_51554:
	bts QWORD [rdi],2
LB_51555:
	mov r8,0
	bts r12,2
	ret
LB_51558:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51560
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51559
LB_51560:
	add rsp,8
	ret
LB_51562:
	add rsp,64
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
LB_51561:
	add rsp,64
	pop r14
LB_51559:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; cst
	jmp LB_51647
LB_51646:
	add r14,1
LB_51647:
	cmp r14,r10
	jge LB_51648
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51646
	cmp al,10
	jz LB_51646
	cmp al,32
	jz LB_51646
LB_51648:
	push r10
	call NS_E_48905_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51649
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51637
LB_51649:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_51652
LB_51651:
	add r14,1
LB_51652:
	cmp r14,r10
	jge LB_51653
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51651
	cmp al,10
	jz LB_51651
	cmp al,32
	jz LB_51651
LB_51653:
	add r14,1
	cmp r14,r10
	jg LB_51657
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_51657
	jmp LB_51658
LB_51657:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51655
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51655:
	jmp LB_51637
LB_51658:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_51660
LB_51659:
	add r14,1
LB_51660:
	cmp r14,r10
	jge LB_51661
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51659
	cmp al,10
	jz LB_51659
	cmp al,32
	jz LB_51659
LB_51661:
	add r14,3
	cmp r14,r10
	jg LB_51666
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_51666
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_51666
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_51666
	jmp LB_51667
LB_51666:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51663
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51663:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51664
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51664:
	jmp LB_51637
LB_51667:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_51669
LB_51668:
	add r14,1
LB_51669:
	cmp r14,r10
	jge LB_51670
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51668
	cmp al,10
	jz LB_51668
	cmp al,32
	jz LB_51668
LB_51670:
	push r10
	call NS_E_49298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51671
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_51672
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_51672:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51673
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51673:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51674
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51674:
	jmp LB_51637
LB_51671:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_51644
	btr r12,3
	jmp LB_51645
LB_51644:
	bts r12,3
LB_51645:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_51642
	btr r12,2
	jmp LB_51643
LB_51642:
	bts r12,2
LB_51643:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51640
	btr r12,1
	jmp LB_51641
LB_51640:
	bts r12,1
LB_51641:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51638
	btr r12,0
	jmp LB_51639
LB_51638:
	bts r12,0
LB_51639:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_51634
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_51676
	btr r12,4
	jmp LB_51677
LB_51676:
	bts r12,4
LB_51677:
	mov r14,r9
	bt r12,3
	jc LB_51678
	btr r12,1
	jmp LB_51679
LB_51678:
	bts r12,1
LB_51679:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47861 %_50004 ⊢ %_50006 : %_50006
 ; {>  %_50004~0':_p47790 %_50005~1':_p47788 }
; _f47861 0' ⊢ °3◂0'
; _nil {  } ⊢ %_50007 : %_50007
 ; {>  %_50006~°3◂0':_p47796 %_50005~1':_p47788 }
; _nil {  } ⊢ °1◂{  }
; _f47836 %_50007 ⊢ %_50008 : %_50008
 ; {>  %_50007~°1◂{  }:(_lst)◂(t16751'(0)) %_50006~°3◂0':_p47796 %_50005~1':_p47788 }
; _f47836 °1◂{  } ⊢ °0◂°1◂{  }
; _some { %_50006 %_50008 %_50005 } ⊢ %_50009 : %_50009
 ; {>  %_50008~°0◂°1◂{  }:_p47787 %_50006~°3◂0':_p47796 %_50005~1':_p47788 }
; _some { °3◂0' °0◂°1◂{  } 1' } ⊢ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; ∎ %_50009
 ; {>  %_50009~°0◂{ °3◂0' °0◂°1◂{  } 1' }:(_opn)◂({ _p47796 _p47787 _p47788 }) }
; 	∎ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ °3◂0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_51622
	btr r12,2
	jmp LB_51623
LB_51622:
	bts r12,2
LB_51623:
	mov rsi,1
	bt r12,2
	jc LB_51620
	mov rsi,0
	bt r8,0
	jc LB_51620
	jmp LB_51621
LB_51620:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_51621:
	mov rax,0x0300_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_51618
	btr QWORD [rdi],0
	jmp LB_51619
LB_51618:
	bts QWORD [rdi],0
LB_51619:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_51628
	mov rsi,0
	bt r8,0
	jc LB_51628
	jmp LB_51629
LB_51628:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_51629:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_51626
	mov rsi,0
	bt r8,0
	jc LB_51626
	jmp LB_51627
LB_51626:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_51627:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_51624
	btr QWORD [rdi],1
	jmp LB_51625
LB_51624:
	bts QWORD [rdi],1
LB_51625:
	mov r8,r14
	bt r12,1
	jc LB_51632
	btr r12,2
	jmp LB_51633
LB_51632:
	bts r12,2
LB_51633:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_51630
	btr QWORD [rdi],2
	jmp LB_51631
LB_51630:
	bts QWORD [rdi],2
LB_51631:
	mov r8,0
	bts r12,2
	ret
LB_51634:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51636
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51635
LB_51636:
	add rsp,8
	ret
LB_51637:
	add rsp,64
	pop r14
LB_51635:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49856:
NS_E_RDI_49856:
NS_E_49856_ETR_TBL:
NS_E_49856_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "_"
	jmp LB_51733
LB_51732:
	add r14,1
LB_51733:
	cmp r14,r10
	jge LB_51734
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51732
	cmp al,10
	jz LB_51732
	cmp al,32
	jz LB_51732
LB_51734:
	add r14,1
	cmp r14,r10
	jg LB_51737
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_51737
	jmp LB_51738
LB_51737:
	jmp LB_51709
LB_51738:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_51718
LB_51717:
	add r14,1
LB_51718:
	cmp r14,r10
	jge LB_51719
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51717
	cmp al,10
	jz LB_51717
	cmp al,32
	jz LB_51717
LB_51719:
	add r14,3
	cmp r14,r10
	jg LB_51723
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_51723
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_51723
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_51723
	jmp LB_51724
LB_51723:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51721
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51721:
	jmp LB_51710
LB_51724:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_51726
LB_51725:
	add r14,1
LB_51726:
	cmp r14,r10
	jge LB_51727
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51725
	cmp al,10
	jz LB_51725
	cmp al,32
	jz LB_51725
LB_51727:
	push r10
	call NS_E_49303_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51728
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51729
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51729:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51730
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51730:
	jmp LB_51710
LB_51728:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_51715
	btr r12,2
	jmp LB_51716
LB_51715:
	bts r12,2
LB_51716:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51713
	btr r12,1
	jmp LB_51714
LB_51713:
	bts r12,1
LB_51714:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51711
	btr r12,0
	jmp LB_51712
LB_51711:
	bts r12,0
LB_51712:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_51706
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_51739
	btr r12,3
	jmp LB_51740
LB_51739:
	bts r12,3
LB_51740:
	mov r13,r8
	bt r12,2
	jc LB_51741
	btr r12,0
	jmp LB_51742
LB_51741:
	bts r12,0
LB_51742:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_50011 : %_50011
 ; {>  %_50010~0':_p47786 }
; 	» 0xr0 _ ⊢ 1' : %_50011
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_50012 : %_50012
 ; {>  %_50011~1':_r64 %_50010~0':_p47786 }
; _nil {  } ⊢ °1◂{  }
; _f47836 %_50012 ⊢ %_50013 : %_50013
 ; {>  %_50012~°1◂{  }:(_lst)◂(t16759'(0)) %_50011~1':_r64 %_50010~0':_p47786 }
; _f47836 °1◂{  } ⊢ °0◂°1◂{  }
; _nil {  } ⊢ %_50014 : %_50014
 ; {>  %_50011~1':_r64 %_50010~0':_p47786 %_50013~°0◂°1◂{  }:_p47787 }
; _nil {  } ⊢ °1◂{  }
; _f47839 %_50010 ⊢ %_50015 : %_50015
 ; {>  %_50014~°1◂{  }:(_lst)◂(t16763'(0)) %_50011~1':_r64 %_50010~0':_p47786 %_50013~°0◂°1◂{  }:_p47787 }
; _f47839 0' ⊢ °1◂0'
; _cns { %_50015 %_50014 } ⊢ %_50016 : %_50016
 ; {>  %_50014~°1◂{  }:(_lst)◂(t16763'(0)) %_50015~°1◂0':_p47788 %_50011~1':_r64 %_50013~°0◂°1◂{  }:_p47787 }
; _cns { °1◂0' °1◂{  } } ⊢ °0◂{ °1◂0' °1◂{  } }
; _f47838 %_50016 ⊢ %_50017 : %_50017
 ; {>  %_50016~°0◂{ °1◂0' °1◂{  } }:(_lst)◂(_p47788) %_50011~1':_r64 %_50013~°0◂°1◂{  }:_p47787 }
; _f47838 °0◂{ °1◂0' °1◂{  } } ⊢ °0◂°0◂{ °1◂0' °1◂{  } }
; _some { %_50011 %_50013 %_50017 } ⊢ %_50018 : %_50018
 ; {>  %_50017~°0◂°0◂{ °1◂0' °1◂{  } }:_p47788 %_50011~1':_r64 %_50013~°0◂°1◂{  }:_p47787 }
; _some { 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; ∎ %_50018
 ; {>  %_50018~°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }:(_opn)◂({ _r64 _p47787 _p47788 }) }
; 	∎ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r14
	bt r12,1
	jc LB_51682
	btr r12,2
	jmp LB_51683
LB_51682:
	bts r12,2
LB_51683:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_51680
	btr QWORD [rdi],0
	jmp LB_51681
LB_51680:
	bts QWORD [rdi],0
LB_51681:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_51688
	mov rsi,0
	bt r8,0
	jc LB_51688
	jmp LB_51689
LB_51688:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_51689:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_51686
	mov rsi,0
	bt r8,0
	jc LB_51686
	jmp LB_51687
LB_51686:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_51687:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_51684
	btr QWORD [rdi],1
	jmp LB_51685
LB_51684:
	bts QWORD [rdi],1
LB_51685:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r14,r13
	bt r12,0
	jc LB_51700
	btr r12,1
	jmp LB_51701
LB_51700:
	bts r12,1
LB_51701:
	mov rsi,1
	bt r12,1
	jc LB_51698
	mov rsi,0
	bt r14,0
	jc LB_51698
	jmp LB_51699
LB_51698:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_51699:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_51696
	btr QWORD [rdi],0
	jmp LB_51697
LB_51696:
	bts QWORD [rdi],0
LB_51697:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_51704
	mov rsi,0
	bt r14,0
	jc LB_51704
	jmp LB_51705
LB_51704:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_51705:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_51702
	btr QWORD [rdi],1
	jmp LB_51703
LB_51702:
	bts QWORD [rdi],1
LB_51703:
	mov rsi,1
	bt r12,2
	jc LB_51694
	mov rsi,0
	bt r8,0
	jc LB_51694
	jmp LB_51695
LB_51694:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_51695:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_51692
	mov rsi,0
	bt r8,0
	jc LB_51692
	jmp LB_51693
LB_51692:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_51693:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_51690
	btr QWORD [rdi],2
	jmp LB_51691
LB_51690:
	bts QWORD [rdi],2
LB_51691:
	mov r8,0
	bts r12,2
	ret
LB_51706:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51708
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51707
LB_51708:
	add rsp,8
	ret
LB_51710:
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
LB_51709:
	add rsp,48
	pop r14
LB_51707:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; src
	jmp LB_51796
LB_51795:
	add r14,1
LB_51796:
	cmp r14,r10
	jge LB_51797
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51795
	cmp al,10
	jz LB_51795
	cmp al,32
	jz LB_51795
LB_51797:
	push r10
	call NS_E_49037_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51798
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51784
LB_51798:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_51801
LB_51800:
	add r14,1
LB_51801:
	cmp r14,r10
	jge LB_51802
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51800
	cmp al,10
	jz LB_51800
	cmp al,32
	jz LB_51800
LB_51802:
	push r10
	call NS_E_49036_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51803
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51804
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51804:
	jmp LB_51784
LB_51803:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_51807
LB_51806:
	add r14,1
LB_51807:
	cmp r14,r10
	jge LB_51808
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51806
	cmp al,10
	jz LB_51806
	cmp al,32
	jz LB_51806
LB_51808:
	add r14,3
	cmp r14,r10
	jg LB_51813
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_51813
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_51813
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_51813
	jmp LB_51814
LB_51813:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51810
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51810:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51811
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51811:
	jmp LB_51784
LB_51814:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_51816
LB_51815:
	add r14,1
LB_51816:
	cmp r14,r10
	jge LB_51817
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51815
	cmp al,10
	jz LB_51815
	cmp al,32
	jz LB_51815
LB_51817:
	push r10
	call NS_E_49303_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51818
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_51819
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_51819:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51820
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51820:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51821
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51821:
	jmp LB_51784
LB_51818:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_51824
LB_51823:
	add r14,1
LB_51824:
	cmp r14,r10
	jge LB_51825
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51823
	cmp al,10
	jz LB_51823
	cmp al,32
	jz LB_51823
LB_51825:
	push r10
	call NS_E_49302_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51826
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_51827
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_51827:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_51828
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_51828:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_51829
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_51829:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51830
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51830:
	jmp LB_51784
LB_51826:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_51793
	btr r12,4
	jmp LB_51794
LB_51793:
	bts r12,4
LB_51794:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_51791
	btr r12,3
	jmp LB_51792
LB_51791:
	bts r12,3
LB_51792:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_51789
	btr r12,2
	jmp LB_51790
LB_51789:
	bts r12,2
LB_51790:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51787
	btr r12,1
	jmp LB_51788
LB_51787:
	bts r12,1
LB_51788:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51785
	btr r12,0
	jmp LB_51786
LB_51785:
	bts r12,0
LB_51786:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_51781
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_51832
	btr r12,5
	jmp LB_51833
LB_51832:
	bts r12,5
LB_51833:
	mov r9,r10
	bt r12,4
	jc LB_51834
	btr r12,3
	jmp LB_51835
LB_51834:
	bts r12,3
LB_51835:
	mov r10,r8
	bt r12,2
	jc LB_51836
	btr r12,4
	jmp LB_51837
LB_51836:
	bts r12,4
LB_51837:
	mov r8,r11
	bt r12,5
	jc LB_51838
	btr r12,2
	jmp LB_51839
LB_51838:
	bts r12,2
LB_51839:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47837 %_50019 ⊢ %_50023 : %_50023
 ; {>  %_50022~3':(_lst)◂(_p47788) %_50020~1':(_lst)◂(_p47787) %_50019~0':_p47785 %_50021~2':_p47786 }
; _f47837 0' ⊢ °1◂0'
; _f47839 %_50021 ⊢ %_50024 : %_50024
 ; {>  %_50023~°1◂0':_p47787 %_50022~3':(_lst)◂(_p47788) %_50020~1':(_lst)◂(_p47787) %_50021~2':_p47786 }
; _f47839 2' ⊢ °1◂2'
; _cns { %_50023 %_50020 } ⊢ %_50025 : %_50025
 ; {>  %_50024~°1◂2':_p47788 %_50023~°1◂0':_p47787 %_50022~3':(_lst)◂(_p47788) %_50020~1':(_lst)◂(_p47787) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _cns { %_50024 %_50022 } ⊢ %_50026 : %_50026
 ; {>  %_50024~°1◂2':_p47788 %_50022~3':(_lst)◂(_p47788) %_50025~°0◂{ °1◂0' 1' }:(_lst)◂(_p47787) }
; _cns { °1◂2' 3' } ⊢ °0◂{ °1◂2' 3' }
; _f47836 %_50025 ⊢ %_50027 : %_50027
 ; {>  %_50025~°0◂{ °1◂0' 1' }:(_lst)◂(_p47787) %_50026~°0◂{ °1◂2' 3' }:(_lst)◂(_p47788) }
; _f47836 °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; _f47838 %_50026 ⊢ %_50028 : %_50028
 ; {>  %_50027~°0◂°0◂{ °1◂0' 1' }:_p47787 %_50026~°0◂{ °1◂2' 3' }:(_lst)◂(_p47788) }
; _f47838 °0◂{ °1◂2' 3' } ⊢ °0◂°0◂{ °1◂2' 3' }
; » 0xr1 |~ {  } ⊢ %_50029 : %_50029
 ; {>  %_50027~°0◂°0◂{ °1◂0' 1' }:_p47787 %_50028~°0◂°0◂{ °1◂2' 3' }:_p47788 }
; 	» 0xr1 _ ⊢ 4' : %_50029
	mov rdi,0x1
	mov r10,rdi
	bts r12,4
; _some { %_50029 %_50027 %_50028 } ⊢ %_50030 : %_50030
 ; {>  %_50027~°0◂°0◂{ °1◂0' 1' }:_p47787 %_50028~°0◂°0◂{ °1◂2' 3' }:_p47788 %_50029~4':_r64 }
; _some { 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; ∎ %_50030
 ; {>  %_50030~°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }:(_opn)◂({ _r64 _p47787 _p47788 }) }
; 	∎ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_51743
	btr r12,5
	jmp LB_51744
LB_51743:
	bts r12,5
LB_51744:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r10
	bt r12,4
	jc LB_51747
	btr r12,6
	jmp LB_51748
LB_51747:
	bts r12,6
LB_51748:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_51745
	btr QWORD [rdi],0
	jmp LB_51746
LB_51745:
	bts QWORD [rdi],0
LB_51746:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r10,r13
	bt r12,0
	jc LB_51759
	btr r12,4
	jmp LB_51760
LB_51759:
	bts r12,4
LB_51760:
	mov rsi,1
	bt r12,4
	jc LB_51757
	mov rsi,0
	bt r10,0
	jc LB_51757
	jmp LB_51758
LB_51757:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_51758:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_51755
	btr QWORD [rdi],0
	jmp LB_51756
LB_51755:
	bts QWORD [rdi],0
LB_51756:
	mov r10,r14
	bt r12,1
	jc LB_51763
	btr r12,4
	jmp LB_51764
LB_51763:
	bts r12,4
LB_51764:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_51761
	btr QWORD [rdi],1
	jmp LB_51762
LB_51761:
	bts QWORD [rdi],1
LB_51762:
	mov rsi,1
	bt r12,6
	jc LB_51753
	mov rsi,0
	bt rcx,0
	jc LB_51753
	jmp LB_51754
LB_51753:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_51754:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_51751
	mov rsi,0
	bt rcx,0
	jc LB_51751
	jmp LB_51752
LB_51751:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_51752:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_51749
	btr QWORD [rdi],1
	jmp LB_51750
LB_51749:
	bts QWORD [rdi],1
LB_51750:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r13,r8
	bt r12,2
	jc LB_51775
	btr r12,0
	jmp LB_51776
LB_51775:
	bts r12,0
LB_51776:
	mov rsi,1
	bt r12,0
	jc LB_51773
	mov rsi,0
	bt r13,0
	jc LB_51773
	jmp LB_51774
LB_51773:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_51774:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_51771
	btr QWORD [rdi],0
	jmp LB_51772
LB_51771:
	bts QWORD [rdi],0
LB_51772:
	mov r13,r11
	bt r12,5
	jc LB_51779
	btr r12,0
	jmp LB_51780
LB_51779:
	bts r12,0
LB_51780:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_51777
	btr QWORD [rdi],1
	jmp LB_51778
LB_51777:
	bts QWORD [rdi],1
LB_51778:
	mov rsi,1
	bt r12,6
	jc LB_51769
	mov rsi,0
	bt rcx,0
	jc LB_51769
	jmp LB_51770
LB_51769:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_51770:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_51767
	mov rsi,0
	bt rcx,0
	jc LB_51767
	jmp LB_51768
LB_51767:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_51768:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_51765
	btr QWORD [rdi],2
	jmp LB_51766
LB_51765:
	bts QWORD [rdi],2
LB_51766:
	mov r8,0
	bts r12,2
	ret
LB_51781:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51783
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51782
LB_51783:
	add rsp,8
	ret
LB_51784:
	add rsp,80
	pop r14
LB_51782:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49857:
NS_E_RDI_49857:
NS_E_49857_ETR_TBL:
NS_E_49857_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_51851
LB_51850:
	add r14,1
LB_51851:
	cmp r14,r10
	jge LB_51852
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51850
	cmp al,10
	jz LB_51850
	cmp al,32
	jz LB_51850
LB_51852:
	push r10
	call NS_E_49859_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51853
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51847
LB_51853:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51848
	btr r12,0
	jmp LB_51849
LB_51848:
	bts r12,0
LB_51849:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_51844
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47863 %_50031 ⊢ %_50032 : %_50032
 ; {>  %_50031~0':_stg }
; _f47863 0' ⊢ °0◂0'
; _some %_50032 ⊢ %_50033 : %_50033
 ; {>  %_50032~°0◂0':_p47797 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_50033
 ; {>  %_50033~°0◂°0◂0':(_opn)◂(_p47797) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_51842
	btr r12,3
	jmp LB_51843
LB_51842:
	bts r12,3
LB_51843:
	mov rsi,1
	bt r12,3
	jc LB_51840
	mov rsi,0
	bt r9,0
	jc LB_51840
	jmp LB_51841
LB_51840:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_51841:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_51844:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51846
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51845
LB_51846:
	add rsp,8
	ret
LB_51847:
	add rsp,16
	pop r14
LB_51845:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_51866
LB_51865:
	add r14,1
LB_51866:
	cmp r14,r10
	jge LB_51867
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51865
	cmp al,10
	jz LB_51865
	cmp al,32
	jz LB_51865
LB_51867:
	push r10
	call NS_E_47211_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51868
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51862
LB_51868:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51863
	btr r12,0
	jmp LB_51864
LB_51863:
	bts r12,0
LB_51864:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_51859
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47863 %_50034 ⊢ %_50035 : %_50035
 ; {>  %_50034~0':_stg }
; _f47863 0' ⊢ °0◂0'
; _some %_50035 ⊢ %_50036 : %_50036
 ; {>  %_50035~°0◂0':_p47797 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_50036
 ; {>  %_50036~°0◂°0◂0':(_opn)◂(_p47797) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_51857
	btr r12,3
	jmp LB_51858
LB_51857:
	bts r12,3
LB_51858:
	mov rsi,1
	bt r12,3
	jc LB_51855
	mov rsi,0
	bt r9,0
	jc LB_51855
	jmp LB_51856
LB_51855:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_51856:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_51859:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51861
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51860
LB_51861:
	add rsp,8
	ret
LB_51862:
	add rsp,16
	pop r14
LB_51860:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_51881
LB_51880:
	add r14,1
LB_51881:
	cmp r14,r10
	jge LB_51882
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51880
	cmp al,10
	jz LB_51880
	cmp al,32
	jz LB_51880
LB_51882:
	push r10
	call NS_E_48838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51883
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51877
LB_51883:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51878
	btr r12,0
	jmp LB_51879
LB_51878:
	bts r12,0
LB_51879:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_51874
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47864 %_50037 ⊢ %_50038 : %_50038
 ; {>  %_50037~0':_p47766 }
; _f47864 0' ⊢ °1◂0'
; _some %_50038 ⊢ %_50039 : %_50039
 ; {>  %_50038~°1◂0':_p47797 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_50039
 ; {>  %_50039~°0◂°1◂0':(_opn)◂(_p47797) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_51872
	btr r12,3
	jmp LB_51873
LB_51872:
	bts r12,3
LB_51873:
	mov rsi,1
	bt r12,3
	jc LB_51870
	mov rsi,0
	bt r9,0
	jc LB_51870
	jmp LB_51871
LB_51870:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_51871:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_51874:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51876
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51875
LB_51876:
	add rsp,8
	ret
LB_51877:
	add rsp,16
	pop r14
LB_51875:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_51902
LB_51901:
	add r14,1
LB_51902:
	cmp r14,r10
	jge LB_51903
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_51901
	cmp al,10
	jz LB_51901
	cmp al,32
	jz LB_51901
LB_51903:
	push r10
	call NS_E_49858_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51904
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51898
LB_51904:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51899
	btr r12,0
	jmp LB_51900
LB_51899:
	bts r12,0
LB_51900:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_51895
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_51906
	btr r12,2
	jmp LB_51907
LB_51906:
	bts r12,2
LB_51907:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_51910
	btr r12,3
	jmp LB_51911
LB_51910:
	bts r12,3
LB_51911:
	mov r13,r9
	bt r12,3
	jc LB_51908
	btr r12,0
	jmp LB_51909
LB_51908:
	bts r12,0
LB_51909:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_51914
	btr r12,3
	jmp LB_51915
LB_51914:
	bts r12,3
LB_51915:
	mov r14,r9
	bt r12,3
	jc LB_51912
	btr r12,1
	jmp LB_51913
LB_51912:
	bts r12,1
LB_51913:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47865 %_50040 ⊢ %_50041 : %_50041
 ; {>  %_50040~{ 0' 1' }:{ _p47798 _r64 } }
; _f47865 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_50041 ⊢ %_50042 : %_50042
 ; {>  %_50041~°2◂{ 0' 1' }:_p47797 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_50042
 ; {>  %_50042~°0◂°2◂{ 0' 1' }:(_opn)◂(_p47797) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_51889
	btr r12,2
	jmp LB_51890
LB_51889:
	bts r12,2
LB_51890:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_51887
	btr QWORD [rdi],0
	jmp LB_51888
LB_51887:
	bts QWORD [rdi],0
LB_51888:
	mov r8,r14
	bt r12,1
	jc LB_51893
	btr r12,2
	jmp LB_51894
LB_51893:
	bts r12,2
LB_51894:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_51891
	btr QWORD [rdi],1
	jmp LB_51892
LB_51891:
	bts QWORD [rdi],1
LB_51892:
	mov rsi,1
	bt r12,3
	jc LB_51885
	mov rsi,0
	bt r9,0
	jc LB_51885
	jmp LB_51886
LB_51885:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_51886:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_51895:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51897
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51896
LB_51897:
	add rsp,8
	ret
LB_51898:
	add rsp,16
	pop r14
LB_51896:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49858:
NS_E_RDI_49858:
NS_E_49858_ETR_TBL:
NS_E_49858_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_47090_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51935
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51927
LB_51935:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_51943
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_51943
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_51943
	jmp LB_51944
LB_51943:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51941
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51941:
	jmp LB_51927
LB_51944:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51930
	btr r12,1
	jmp LB_51931
LB_51930:
	bts r12,1
LB_51931:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51928
	btr r12,0
	jmp LB_51929
LB_51928:
	bts r12,0
LB_51929:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_51924
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47867 {  } ⊢ %_50044 : %_50044
 ; {>  %_50043~0':_r64 }
; _f47867 {  } ⊢ °1◂{  }
; _some { %_50044 %_50043 } ⊢ %_50045 : %_50045
 ; {>  %_50043~0':_r64 %_50044~°1◂{  }:_p47798 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_50045
 ; {>  %_50045~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p47798 _r64 }) }
; 	∎ °0◂{ °1◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °1◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_51918
	mov rsi,0
	bt r14,0
	jc LB_51918
	jmp LB_51919
LB_51918:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_51919:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_51916
	btr QWORD [rdi],0
	jmp LB_51917
LB_51916:
	bts QWORD [rdi],0
LB_51917:
	mov r14,r13
	bt r12,0
	jc LB_51922
	btr r12,1
	jmp LB_51923
LB_51922:
	bts r12,1
LB_51923:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_51920
	btr QWORD [rdi],1
	jmp LB_51921
LB_51920:
	bts QWORD [rdi],1
LB_51921:
	mov r8,0
	bts r12,2
	ret
LB_51924:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51926
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51925
LB_51926:
	add rsp,8
	ret
LB_51927:
	add rsp,32
	pop r14
LB_51925:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_47090_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51964
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51956
LB_51964:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_51972
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_51972
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_51972
	jmp LB_51973
LB_51972:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51970
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51970:
	jmp LB_51956
LB_51973:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51959
	btr r12,1
	jmp LB_51960
LB_51959:
	bts r12,1
LB_51960:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51957
	btr r12,0
	jmp LB_51958
LB_51957:
	bts r12,0
LB_51958:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_51953
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47868 {  } ⊢ %_50047 : %_50047
 ; {>  %_50046~0':_r64 }
; _f47868 {  } ⊢ °2◂{  }
; _some { %_50047 %_50046 } ⊢ %_50048 : %_50048
 ; {>  %_50046~0':_r64 %_50047~°2◂{  }:_p47798 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_50048
 ; {>  %_50048~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p47798 _r64 }) }
; 	∎ °0◂{ °2◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °2◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_51947
	mov rsi,0
	bt r14,0
	jc LB_51947
	jmp LB_51948
LB_51947:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_51948:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_51945
	btr QWORD [rdi],0
	jmp LB_51946
LB_51945:
	bts QWORD [rdi],0
LB_51946:
	mov r14,r13
	bt r12,0
	jc LB_51951
	btr r12,1
	jmp LB_51952
LB_51951:
	bts r12,1
LB_51952:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_51949
	btr QWORD [rdi],1
	jmp LB_51950
LB_51949:
	bts QWORD [rdi],1
LB_51950:
	mov r8,0
	bts r12,2
	ret
LB_51953:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51955
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51954
LB_51955:
	add rsp,8
	ret
LB_51956:
	add rsp,32
	pop r14
LB_51954:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_47090_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_51993
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51985
LB_51993:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_52001
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_52001
	jmp LB_52002
LB_52001:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_51999
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_51999:
	jmp LB_51985
LB_52002:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_51988
	btr r12,1
	jmp LB_51989
LB_51988:
	bts r12,1
LB_51989:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_51986
	btr r12,0
	jmp LB_51987
LB_51986:
	bts r12,0
LB_51987:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_51982
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47866 {  } ⊢ %_50050 : %_50050
 ; {>  %_50049~0':_r64 }
; _f47866 {  } ⊢ °0◂{  }
; _some { %_50050 %_50049 } ⊢ %_50051 : %_50051
 ; {>  %_50050~°0◂{  }:_p47798 %_50049~0':_r64 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_50051
 ; {>  %_50051~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p47798 _r64 }) }
; 	∎ °0◂{ °0◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °0◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_51976
	mov rsi,0
	bt r14,0
	jc LB_51976
	jmp LB_51977
LB_51976:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_51977:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_51974
	btr QWORD [rdi],0
	jmp LB_51975
LB_51974:
	bts QWORD [rdi],0
LB_51975:
	mov r14,r13
	bt r12,0
	jc LB_51980
	btr r12,1
	jmp LB_51981
LB_51980:
	bts r12,1
LB_51981:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_51978
	btr QWORD [rdi],1
	jmp LB_51979
LB_51978:
	bts QWORD [rdi],1
LB_51979:
	mov r8,0
	bts r12,2
	ret
LB_51982:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_51984
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_51983
LB_51984:
	add rsp,8
	ret
LB_51985:
	add rsp,32
	pop r14
LB_51983:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49859:
NS_E_RDI_49859:
NS_E_49859_ETR_TBL:
NS_E_49859_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_52018
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_52018
	jmp LB_52019
LB_52018:
	jmp LB_52008
LB_52019:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_49860_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52023
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52024
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52024:
	jmp LB_52008
LB_52023:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52011
	btr r12,1
	jmp LB_52012
LB_52011:
	bts r12,1
LB_52012:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52009
	btr r12,0
	jmp LB_52010
LB_52009:
	bts r12,0
LB_52010:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_52005
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_52026
	btr r12,2
	jmp LB_52027
LB_52026:
	bts r12,2
LB_52027:
	mov r13,r14
	bt r12,1
	jc LB_52028
	btr r12,0
	jmp LB_52029
LB_52028:
	bts r12,0
LB_52029:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47201 %_50052 ⊢ %_50053 : %_50053
 ; {>  %_50052~0':(_lst)◂(_r64) }
; _f47201 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_47201
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_50053 ⊢ %_50054 : %_50054
 ; {>  %_50053~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_50054
 ; {>  %_50054~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_52003
	btr r12,3
	jmp LB_52004
LB_52003:
	bts r12,3
LB_52004:
	mov r8,0
	bts r12,2
	ret
LB_52005:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52007
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52006
LB_52007:
	add rsp,8
	ret
LB_52008:
	add rsp,32
	pop r14
LB_52006:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49860:
NS_E_RDI_49860:
NS_E_49860_ETR_TBL:
NS_E_49860_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_52051
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_52051
	jmp LB_52052
LB_52051:
	jmp LB_52043
LB_52052:
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
	jc LB_52044
	btr r12,0
	jmp LB_52045
LB_52044:
	bts r12,0
LB_52045:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_52040
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_50055 : %_50055
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_50055
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_50056 : %_50056
 ; {>  %_50055~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_50055 %_50056 } ⊢ %_50057 : %_50057
 ; {>  %_50056~°1◂{  }:(_lst)◂(t16820'(0)) %_50055~0':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_50057 ⊢ %_50058 : %_50058
 ; {>  %_50057~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_50058
 ; {>  %_50058~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_52034
	btr r12,1
	jmp LB_52035
LB_52034:
	bts r12,1
LB_52035:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_52032
	btr QWORD [rdi],0
	jmp LB_52033
LB_52032:
	bts QWORD [rdi],0
LB_52033:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_52038
	mov rsi,0
	bt r14,0
	jc LB_52038
	jmp LB_52039
LB_52038:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_52039:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_52036
	btr QWORD [rdi],1
	jmp LB_52037
LB_52036:
	bts QWORD [rdi],1
LB_52037:
	mov rsi,1
	bt r12,3
	jc LB_52030
	mov rsi,0
	bt r9,0
	jc LB_52030
	jmp LB_52031
LB_52030:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52031:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52040:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52042
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52041
LB_52042:
	add rsp,8
	ret
LB_52043:
	add rsp,16
	pop r14
LB_52041:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_47088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52074
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52066
LB_52074:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_49860_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52079
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52080
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52080:
	jmp LB_52066
LB_52079:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52069
	btr r12,1
	jmp LB_52070
LB_52069:
	bts r12,1
LB_52070:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52067
	btr r12,0
	jmp LB_52068
LB_52067:
	bts r12,0
LB_52068:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_52063
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_50059 %_50060 } ⊢ %_50061 : %_50061
 ; {>  %_50060~1':(_lst)◂(_r64) %_50059~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_50061 ⊢ %_50062 : %_50062
 ; {>  %_50061~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_50062
 ; {>  %_50062~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_52057
	btr r12,2
	jmp LB_52058
LB_52057:
	bts r12,2
LB_52058:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_52055
	btr QWORD [rdi],0
	jmp LB_52056
LB_52055:
	bts QWORD [rdi],0
LB_52056:
	mov r8,r14
	bt r12,1
	jc LB_52061
	btr r12,2
	jmp LB_52062
LB_52061:
	bts r12,2
LB_52062:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_52059
	btr QWORD [rdi],1
	jmp LB_52060
LB_52059:
	bts QWORD [rdi],1
LB_52060:
	mov rsi,1
	bt r12,3
	jc LB_52053
	mov rsi,0
	bt r9,0
	jc LB_52053
	jmp LB_52054
LB_52053:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52054:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52063:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52065
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52064
LB_52065:
	add rsp,8
	ret
LB_52066:
	add rsp,32
	pop r14
LB_52064:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49861:
NS_E_RDI_49861:
NS_E_49861_ETR_TBL:
NS_E_49861_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_52120
LB_52119:
	add r14,1
LB_52120:
	cmp r14,r10
	jge LB_52121
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52119
	cmp al,10
	jz LB_52119
	cmp al,32
	jz LB_52119
LB_52121:
	add r14,4
	cmp r14,r10
	jg LB_52124
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_52124
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_52124
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_52124
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_52124
	jmp LB_52125
LB_52124:
	jmp LB_52098
LB_52125:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_52107
LB_52106:
	add r14,1
LB_52107:
	cmp r14,r10
	jge LB_52108
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52106
	cmp al,10
	jz LB_52106
	cmp al,32
	jz LB_52106
LB_52108:
	push r10
	call NS_E_49862_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52109
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52110
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52110:
	jmp LB_52099
LB_52109:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_52113
LB_52112:
	add r14,1
LB_52113:
	cmp r14,r10
	jge LB_52114
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52112
	cmp al,10
	jz LB_52112
	cmp al,32
	jz LB_52112
LB_52114:
	push r10
	call NS_E_49853_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52115
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52116
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52116:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52117
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52117:
	jmp LB_52099
LB_52115:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_52104
	btr r12,2
	jmp LB_52105
LB_52104:
	bts r12,2
LB_52105:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52102
	btr r12,1
	jmp LB_52103
LB_52102:
	bts r12,1
LB_52103:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52100
	btr r12,0
	jmp LB_52101
LB_52100:
	bts r12,0
LB_52101:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_52095
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_52126
	btr r12,3
	jmp LB_52127
LB_52126:
	bts r12,3
LB_52127:
	mov r14,r8
	bt r12,2
	jc LB_52128
	btr r12,1
	jmp LB_52129
LB_52128:
	bts r12,1
LB_52129:
	mov r8,r13
	bt r12,0
	jc LB_52130
	btr r12,2
	jmp LB_52131
LB_52130:
	bts r12,2
LB_52131:
	mov r13,r9
	bt r12,3
	jc LB_52132
	btr r12,0
	jmp LB_52133
LB_52132:
	bts r12,0
LB_52133:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_50065 : %_50065
 ; {>  %_50063~0':(_lst)◂(_p47794) %_50064~1':_p47791 }
; _nil {  } ⊢ °1◂{  }
; _f47853 %_50064 ⊢ %_50066 : %_50066
 ; {>  %_50065~°1◂{  }:(_lst)◂(t16835'(0)) %_50063~0':(_lst)◂(_p47794) %_50064~1':_p47791 }
; _f47853 1' ⊢ °1◂1'
; _f47851 { %_50065 %_50066 } ⊢ %_50067 : %_50067
 ; {>  %_50065~°1◂{  }:(_lst)◂(t16835'(0)) %_50063~0':(_lst)◂(_p47794) %_50066~°1◂1':_p47793 }
; _f47851 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_50067 ⊢ %_50068 : %_50068
 ; {>  %_50063~0':(_lst)◂(_p47794) %_50067~°1◂{ °1◂{  } °1◂1' }:_p47792 }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_50068
 ; {>  %_50068~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂(_p47792) %_50063~0':(_lst)◂(_p47794) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_52082
	mov rdi,r13
	call dlt
LB_52082:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂°1◂{ °1◂{  } °1◂1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_52087
	mov rsi,0
	bt r13,0
	jc LB_52087
	jmp LB_52088
LB_52087:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_52088:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_52085
	btr QWORD [rdi],0
	jmp LB_52086
LB_52085:
	bts QWORD [rdi],0
LB_52086:
	mov r13,r14
	bt r12,1
	jc LB_52093
	btr r12,0
	jmp LB_52094
LB_52093:
	bts r12,0
LB_52094:
	mov rsi,1
	bt r12,0
	jc LB_52091
	mov rsi,0
	bt r13,0
	jc LB_52091
	jmp LB_52092
LB_52091:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_52092:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_52089
	btr QWORD [rdi],1
	jmp LB_52090
LB_52089:
	bts QWORD [rdi],1
LB_52090:
	mov rsi,1
	bt r12,3
	jc LB_52083
	mov rsi,0
	bt r9,0
	jc LB_52083
	jmp LB_52084
LB_52083:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52084:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52095:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52097
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52096
LB_52097:
	add rsp,8
	ret
LB_52099:
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
LB_52098:
	add rsp,48
	pop r14
LB_52096:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_52164
LB_52163:
	add r14,1
LB_52164:
	cmp r14,r10
	jge LB_52165
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52163
	cmp al,10
	jz LB_52163
	cmp al,32
	jz LB_52163
LB_52165:
	add r14,3
	cmp r14,r10
	jg LB_52168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_52168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_52168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_52168
	jmp LB_52169
LB_52168:
	jmp LB_52154
LB_52169:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_52171
LB_52170:
	add r14,1
LB_52171:
	cmp r14,r10
	jge LB_52172
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52170
	cmp al,10
	jz LB_52170
	cmp al,32
	jz LB_52170
LB_52172:
	push r10
	call NS_E_49862_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52173
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52174
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52174:
	jmp LB_52154
LB_52173:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_52177
LB_52176:
	add r14,1
LB_52177:
	cmp r14,r10
	jge LB_52178
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52176
	cmp al,10
	jz LB_52176
	cmp al,32
	jz LB_52176
LB_52178:
	push r10
	call NS_E_49853_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52179
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52180
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52180:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52181
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52181:
	jmp LB_52154
LB_52179:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_52184
LB_52183:
	add r14,1
LB_52184:
	cmp r14,r10
	jge LB_52185
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52183
	cmp al,10
	jz LB_52183
	cmp al,32
	jz LB_52183
LB_52185:
	push r10
	call NS_E_49861_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52186
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_52187
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_52187:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52188
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52188:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52189
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52189:
	jmp LB_52154
LB_52186:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_52161
	btr r12,3
	jmp LB_52162
LB_52161:
	bts r12,3
LB_52162:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_52159
	btr r12,2
	jmp LB_52160
LB_52159:
	bts r12,2
LB_52160:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52157
	btr r12,1
	jmp LB_52158
LB_52157:
	bts r12,1
LB_52158:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52155
	btr r12,0
	jmp LB_52156
LB_52155:
	bts r12,0
LB_52156:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_52151
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_52191
	btr r12,4
	jmp LB_52192
LB_52191:
	bts r12,4
LB_52192:
	mov r8,r9
	bt r12,3
	jc LB_52193
	btr r12,2
	jmp LB_52194
LB_52193:
	bts r12,2
LB_52194:
	mov r9,r14
	bt r12,1
	jc LB_52195
	btr r12,3
	jmp LB_52196
LB_52195:
	bts r12,3
LB_52196:
	mov r14,r10
	bt r12,4
	jc LB_52197
	btr r12,1
	jmp LB_52198
LB_52197:
	bts r12,1
LB_52198:
	mov r10,r13
	bt r12,0
	jc LB_52199
	btr r12,4
	jmp LB_52200
LB_52199:
	bts r12,4
LB_52200:
	mov r13,r9
	bt r12,3
	jc LB_52201
	btr r12,0
	jmp LB_52202
LB_52201:
	bts r12,0
LB_52202:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_50072 : %_50072
 ; {>  %_50070~1':_p47791 %_50071~2':_p47792 %_50069~0':(_lst)◂(_p47794) }
; _nil {  } ⊢ °1◂{  }
; _f47853 %_50070 ⊢ %_50073 : %_50073
 ; {>  %_50072~°1◂{  }:(_lst)◂(t16845'(0)) %_50070~1':_p47791 %_50071~2':_p47792 %_50069~0':(_lst)◂(_p47794) }
; _f47853 1' ⊢ °1◂1'
; _f47850 { %_50072 %_50073 %_50071 } ⊢ %_50074 : %_50074
 ; {>  %_50072~°1◂{  }:(_lst)◂(t16845'(0)) %_50071~2':_p47792 %_50073~°1◂1':_p47793 %_50069~0':(_lst)◂(_p47794) }
; _f47850 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_50074 ⊢ %_50075 : %_50075
 ; {>  %_50074~°0◂{ °1◂{  } °1◂1' 2' }:_p47792 %_50069~0':(_lst)◂(_p47794) }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_50075
 ; {>  %_50075~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂(_p47792) %_50069~0':(_lst)◂(_p47794) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_52134
	mov rdi,r13
	call dlt
LB_52134:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °1◂{  } °1◂1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_52139
	mov rsi,0
	bt r13,0
	jc LB_52139
	jmp LB_52140
LB_52139:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_52140:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_52137
	btr QWORD [rdi],0
	jmp LB_52138
LB_52137:
	bts QWORD [rdi],0
LB_52138:
	mov r13,r14
	bt r12,1
	jc LB_52145
	btr r12,0
	jmp LB_52146
LB_52145:
	bts r12,0
LB_52146:
	mov rsi,1
	bt r12,0
	jc LB_52143
	mov rsi,0
	bt r13,0
	jc LB_52143
	jmp LB_52144
LB_52143:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_52144:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_52141
	btr QWORD [rdi],1
	jmp LB_52142
LB_52141:
	bts QWORD [rdi],1
LB_52142:
	mov r13,r8
	bt r12,2
	jc LB_52149
	btr r12,0
	jmp LB_52150
LB_52149:
	bts r12,0
LB_52150:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r13
	bt r12,0
	jc LB_52147
	btr QWORD [rdi],2
	jmp LB_52148
LB_52147:
	bts QWORD [rdi],2
LB_52148:
	mov rsi,1
	bt r12,3
	jc LB_52135
	mov rsi,0
	bt r9,0
	jc LB_52135
	jmp LB_52136
LB_52135:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52136:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52151:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52153
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52152
LB_52153:
	add rsp,8
	ret
LB_52154:
	add rsp,64
	pop r14
LB_52152:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49862:
NS_E_RDI_49862:
NS_E_49862_ETR_TBL:
NS_E_49862_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; mtc_test
	jmp LB_52222
LB_52221:
	add r14,1
LB_52222:
	cmp r14,r10
	jge LB_52223
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52221
	cmp al,10
	jz LB_52221
	cmp al,32
	jz LB_52221
LB_52223:
	push r10
	call NS_E_49863_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52224
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52216
LB_52224:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_52227
LB_52226:
	add r14,1
LB_52227:
	cmp r14,r10
	jge LB_52228
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52226
	cmp al,10
	jz LB_52226
	cmp al,32
	jz LB_52226
LB_52228:
	push r10
	call NS_E_49864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52229
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52230
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52230:
	jmp LB_52216
LB_52229:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52219
	btr r12,1
	jmp LB_52220
LB_52219:
	bts r12,1
LB_52220:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52217
	btr r12,0
	jmp LB_52218
LB_52217:
	bts r12,0
LB_52218:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_52213
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_50076 %_50077 } ⊢ %_50078 : %_50078
 ; {>  %_50077~1':(_lst)◂(_p47794) %_50076~0':_p47794 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_50078 ⊢ %_50079 : %_50079
 ; {>  %_50078~°0◂{ 0' 1' }:(_lst)◂(_p47794) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_50079
 ; {>  %_50079~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p47794)) }
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
	jc LB_52207
	btr r12,2
	jmp LB_52208
LB_52207:
	bts r12,2
LB_52208:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_52205
	btr QWORD [rdi],0
	jmp LB_52206
LB_52205:
	bts QWORD [rdi],0
LB_52206:
	mov r8,r14
	bt r12,1
	jc LB_52211
	btr r12,2
	jmp LB_52212
LB_52211:
	bts r12,2
LB_52212:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_52209
	btr QWORD [rdi],1
	jmp LB_52210
LB_52209:
	bts QWORD [rdi],1
LB_52210:
	mov rsi,1
	bt r12,3
	jc LB_52203
	mov rsi,0
	bt r9,0
	jc LB_52203
	jmp LB_52204
LB_52203:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52204:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52213:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52215
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52214
LB_52215:
	add rsp,8
	ret
LB_52216:
	add rsp,32
	pop r14
LB_52214:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_52243
LB_52242:
	add r14,1
LB_52243:
	cmp r14,r10
	jge LB_52244
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52242
	cmp al,32
	jz LB_52242
LB_52244:
	add r14,1
	cmp r14,r10
	jg LB_52247
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_52247
	jmp LB_52248
LB_52247:
	jmp LB_52237
LB_52248:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_52250
LB_52249:
	add r14,1
LB_52250:
	cmp r14,r10
	jge LB_52251
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52249
	cmp al,32
	jz LB_52249
LB_52251:
	add r14,1
	cmp r14,r10
	jg LB_52255
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_52255
	jmp LB_52256
LB_52255:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52253
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52253:
	jmp LB_52237
LB_52256:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52240
	btr r12,1
	jmp LB_52241
LB_52240:
	bts r12,1
LB_52241:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52238
	btr r12,0
	jmp LB_52239
LB_52238:
	bts r12,0
LB_52239:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_52234
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_50080 : %_50080
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_50080 ⊢ %_50081 : %_50081
 ; {>  %_50080~°1◂{  }:(_lst)◂(t16858'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_50081
 ; {>  %_50081~°0◂°1◂{  }:(_opn)◂((_lst)◂(t16861'(0))) }
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
	jc LB_52232
	mov rsi,0
	bt r9,0
	jc LB_52232
	jmp LB_52233
LB_52232:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52233:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52234:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52236
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52235
LB_52236:
	add rsp,8
	ret
LB_52237:
	add rsp,32
	pop r14
LB_52235:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49863:
NS_E_RDI_49863:
NS_E_49863_ETR_TBL:
NS_E_49863_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; src_ptn
	jmp LB_52313
LB_52312:
	add r14,1
LB_52313:
	cmp r14,r10
	jge LB_52314
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52312
	cmp al,10
	jz LB_52312
	cmp al,32
	jz LB_52312
LB_52314:
	push r10
	call NS_E_49034_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52315
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52274
LB_52315:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_52318
LB_52317:
	add r14,1
LB_52318:
	cmp r14,r10
	jge LB_52319
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52317
	cmp al,10
	jz LB_52317
	cmp al,32
	jz LB_52317
LB_52319:
	add r14,3
	cmp r14,r10
	jg LB_52323
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_52323
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_52323
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_52323
	jmp LB_52324
LB_52323:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52321
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52321:
	jmp LB_52274
LB_52324:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_52287
LB_52286:
	add r14,1
LB_52287:
	cmp r14,r10
	jge LB_52288
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52286
	cmp al,10
	jz LB_52286
	cmp al,32
	jz LB_52286
LB_52288:
	push r10
	call NS_E_48838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52289
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52290
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52290:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52291
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52291:
	jmp LB_52275
LB_52289:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_52294
LB_52293:
	add r14,1
LB_52294:
	cmp r14,r10
	jge LB_52295
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52293
	cmp al,10
	jz LB_52293
	cmp al,32
	jz LB_52293
LB_52295:
	add r14,3
	cmp r14,r10
	jg LB_52301
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_52301
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_52301
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_52301
	jmp LB_52302
LB_52301:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_52297
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_52297:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52298
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52298:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52299
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52299:
	jmp LB_52275
LB_52302:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_52304
LB_52303:
	add r14,1
LB_52304:
	cmp r14,r10
	jge LB_52305
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52303
	cmp al,10
	jz LB_52303
	cmp al,32
	jz LB_52303
LB_52305:
	push r10
	call NS_E_49298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52306
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_52307
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_52307:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_52308
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_52308:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52309
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52309:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52310
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52310:
	jmp LB_52275
LB_52306:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_52284
	btr r12,4
	jmp LB_52285
LB_52284:
	bts r12,4
LB_52285:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_52282
	btr r12,3
	jmp LB_52283
LB_52282:
	bts r12,3
LB_52283:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_52280
	btr r12,2
	jmp LB_52281
LB_52280:
	bts r12,2
LB_52281:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52278
	btr r12,1
	jmp LB_52279
LB_52278:
	bts r12,1
LB_52279:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52276
	btr r12,0
	jmp LB_52277
LB_52276:
	bts r12,0
LB_52277:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_52271
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_52325
	btr r12,5
	jmp LB_52326
LB_52325:
	bts r12,5
LB_52326:
	mov r8,r10
	bt r12,4
	jc LB_52327
	btr r12,2
	jmp LB_52328
LB_52327:
	bts r12,2
LB_52328:
	mov r10,r14
	bt r12,1
	jc LB_52329
	btr r12,4
	jmp LB_52330
LB_52329:
	bts r12,4
LB_52330:
	mov r14,r11
	bt r12,5
	jc LB_52331
	btr r12,1
	jmp LB_52332
LB_52331:
	bts r12,1
LB_52332:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47854 { %_50082 %_50083 %_50084 } ⊢ %_50085 : %_50085
 ; {>  %_50082~0':_p47787 %_50084~2':_p47788 %_50083~1':_p47766 }
; _f47854 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_50085 ⊢ %_50086 : %_50086
 ; {>  %_50085~°0◂{ 0' 1' 2' }:_p47794 }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_50086
 ; {>  %_50086~°0◂°0◂{ 0' 1' 2' }:(_opn)◂(_p47794) }
; 	∎ °0◂°0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_52261
	btr r12,4
	jmp LB_52262
LB_52261:
	bts r12,4
LB_52262:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_52259
	btr QWORD [rdi],0
	jmp LB_52260
LB_52259:
	bts QWORD [rdi],0
LB_52260:
	mov r10,r14
	bt r12,1
	jc LB_52265
	btr r12,4
	jmp LB_52266
LB_52265:
	bts r12,4
LB_52266:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_52263
	btr QWORD [rdi],1
	jmp LB_52264
LB_52263:
	bts QWORD [rdi],1
LB_52264:
	mov r10,r8
	bt r12,2
	jc LB_52269
	btr r12,4
	jmp LB_52270
LB_52269:
	bts r12,4
LB_52270:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_52267
	btr QWORD [rdi],2
	jmp LB_52268
LB_52267:
	bts QWORD [rdi],2
LB_52268:
	mov rsi,1
	bt r12,3
	jc LB_52257
	mov rsi,0
	bt r9,0
	jc LB_52257
	jmp LB_52258
LB_52257:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52258:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52271:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52273
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52272
LB_52273:
	add rsp,8
	ret
LB_52275:
	add rsp,80
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
LB_52274:
	add rsp,80
	pop r14
LB_52272:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; mtc_val
	jmp LB_52354
LB_52353:
	add r14,1
LB_52354:
	cmp r14,r10
	jge LB_52355
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52353
	cmp al,32
	jz LB_52353
LB_52355:
	push r10
	call NS_E_49865_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52356
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52346
LB_52356:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_52359
LB_52358:
	add r14,1
LB_52359:
	cmp r14,r10
	jge LB_52360
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52358
	cmp al,32
	jz LB_52358
LB_52360:
	add r14,1
	cmp r14,r10
	jg LB_52364
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_52364
	jmp LB_52365
LB_52364:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52362
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52362:
	jmp LB_52346
LB_52365:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_52367
LB_52366:
	add r14,1
LB_52367:
	cmp r14,r10
	jge LB_52368
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52366
	cmp al,32
	jz LB_52366
LB_52368:
	push r10
	call NS_E_49865_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52369
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52370
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52370:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52371
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52371:
	jmp LB_52346
LB_52369:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_52351
	btr r12,2
	jmp LB_52352
LB_52351:
	bts r12,2
LB_52352:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52349
	btr r12,1
	jmp LB_52350
LB_52349:
	bts r12,1
LB_52350:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52347
	btr r12,0
	jmp LB_52348
LB_52347:
	bts r12,0
LB_52348:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_52343
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_52373
	btr r12,3
	jmp LB_52374
LB_52373:
	bts r12,3
LB_52374:
	mov r14,r8
	bt r12,2
	jc LB_52375
	btr r12,1
	jmp LB_52376
LB_52375:
	bts r12,1
LB_52376:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47855 { %_50087 %_50088 } ⊢ %_50089 : %_50089
 ; {>  %_50087~0':_p47795 %_50088~1':_p47795 }
; _f47855 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_50089 ⊢ %_50090 : %_50090
 ; {>  %_50089~°1◂{ 0' 1' }:_p47794 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_50090
 ; {>  %_50090~°0◂°1◂{ 0' 1' }:(_opn)◂(_p47794) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_52337
	btr r12,2
	jmp LB_52338
LB_52337:
	bts r12,2
LB_52338:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_52335
	btr QWORD [rdi],0
	jmp LB_52336
LB_52335:
	bts QWORD [rdi],0
LB_52336:
	mov r8,r14
	bt r12,1
	jc LB_52341
	btr r12,2
	jmp LB_52342
LB_52341:
	bts r12,2
LB_52342:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_52339
	btr QWORD [rdi],1
	jmp LB_52340
LB_52339:
	bts QWORD [rdi],1
LB_52340:
	mov rsi,1
	bt r12,3
	jc LB_52333
	mov rsi,0
	bt r9,0
	jc LB_52333
	jmp LB_52334
LB_52333:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52334:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52343:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52345
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52344
LB_52345:
	add rsp,8
	ret
LB_52346:
	add rsp,48
	pop r14
LB_52344:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49864:
NS_E_RDI_49864:
NS_E_49864_ETR_TBL:
NS_E_49864_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ";"
	jmp LB_52412
LB_52411:
	add r14,1
LB_52412:
	cmp r14,r10
	jge LB_52413
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52411
	cmp al,10
	jz LB_52411
	cmp al,32
	jz LB_52411
LB_52413:
	add r14,1
	cmp r14,r10
	jg LB_52416
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_52416
	jmp LB_52417
LB_52416:
	jmp LB_52390
LB_52417:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_52399
LB_52398:
	add r14,1
LB_52399:
	cmp r14,r10
	jge LB_52400
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52398
	cmp al,10
	jz LB_52398
	cmp al,32
	jz LB_52398
LB_52400:
	push r10
	call NS_E_49863_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52401
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52402
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52402:
	jmp LB_52391
LB_52401:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_52405
LB_52404:
	add r14,1
LB_52405:
	cmp r14,r10
	jge LB_52406
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52404
	cmp al,10
	jz LB_52404
	cmp al,32
	jz LB_52404
LB_52406:
	push r10
	call NS_E_49864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52407
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52408
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52408:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52409
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52409:
	jmp LB_52391
LB_52407:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_52396
	btr r12,2
	jmp LB_52397
LB_52396:
	bts r12,2
LB_52397:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52394
	btr r12,1
	jmp LB_52395
LB_52394:
	bts r12,1
LB_52395:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52392
	btr r12,0
	jmp LB_52393
LB_52392:
	bts r12,0
LB_52393:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_52387
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_52418
	btr r12,3
	jmp LB_52419
LB_52418:
	bts r12,3
LB_52419:
	mov r14,r8
	bt r12,2
	jc LB_52420
	btr r12,1
	jmp LB_52421
LB_52420:
	bts r12,1
LB_52421:
	mov r8,r13
	bt r12,0
	jc LB_52422
	btr r12,2
	jmp LB_52423
LB_52422:
	bts r12,2
LB_52423:
	mov r13,r9
	bt r12,3
	jc LB_52424
	btr r12,0
	jmp LB_52425
LB_52424:
	bts r12,0
LB_52425:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_50091 %_50092 } ⊢ %_50093 : %_50093
 ; {>  %_50091~0':_p47794 %_50092~1':(_lst)◂(_p47794) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_50093 ⊢ %_50094 : %_50094
 ; {>  %_50093~°0◂{ 0' 1' }:(_lst)◂(_p47794) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_50094
 ; {>  %_50094~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p47794)) }
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
	jc LB_52381
	btr r12,2
	jmp LB_52382
LB_52381:
	bts r12,2
LB_52382:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_52379
	btr QWORD [rdi],0
	jmp LB_52380
LB_52379:
	bts QWORD [rdi],0
LB_52380:
	mov r8,r14
	bt r12,1
	jc LB_52385
	btr r12,2
	jmp LB_52386
LB_52385:
	bts r12,2
LB_52386:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_52383
	btr QWORD [rdi],1
	jmp LB_52384
LB_52383:
	bts QWORD [rdi],1
LB_52384:
	mov rsi,1
	bt r12,3
	jc LB_52377
	mov rsi,0
	bt r9,0
	jc LB_52377
	jmp LB_52378
LB_52377:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52378:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52387:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52389
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52388
LB_52389:
	add rsp,8
	ret
LB_52391:
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
LB_52390:
	add rsp,48
	pop r14
LB_52388:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_52437
LB_52436:
	add r14,1
LB_52437:
	cmp r14,r10
	jge LB_52438
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52436
	cmp al,32
	jz LB_52436
LB_52438:
	add r14,1
	cmp r14,r10
	jg LB_52441
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_52441
	jmp LB_52442
LB_52441:
	jmp LB_52431
LB_52442:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_52444
LB_52443:
	add r14,1
LB_52444:
	cmp r14,r10
	jge LB_52445
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52443
	cmp al,32
	jz LB_52443
LB_52445:
	add r14,1
	cmp r14,r10
	jg LB_52449
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_52449
	jmp LB_52450
LB_52449:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52447
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52447:
	jmp LB_52431
LB_52450:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52434
	btr r12,1
	jmp LB_52435
LB_52434:
	bts r12,1
LB_52435:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52432
	btr r12,0
	jmp LB_52433
LB_52432:
	bts r12,0
LB_52433:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_52428
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_50095 : %_50095
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_50095 ⊢ %_50096 : %_50096
 ; {>  %_50095~°1◂{  }:(_lst)◂(t16882'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_50096
 ; {>  %_50096~°0◂°1◂{  }:(_opn)◂((_lst)◂(t16885'(0))) }
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
	jc LB_52426
	mov rsi,0
	bt r9,0
	jc LB_52426
	jmp LB_52427
LB_52426:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52427:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52428:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52430
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52429
LB_52430:
	add rsp,8
	ret
LB_52431:
	add rsp,32
	pop r14
LB_52429:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49865:
NS_E_RDI_49865:
NS_E_49865_ETR_TBL:
NS_E_49865_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52466
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52458
LB_52466:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_52474
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_52474
	jmp LB_52475
LB_52474:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52472
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52472:
	jmp LB_52458
LB_52475:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52461
	btr r12,1
	jmp LB_52462
LB_52461:
	bts r12,1
LB_52462:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52459
	btr r12,0
	jmp LB_52460
LB_52459:
	bts r12,0
LB_52460:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_52455
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47857 %_50097 ⊢ %_50098 : %_50098
 ; {>  %_50097~0':_stg }
; _f47857 0' ⊢ °1◂0'
; _some %_50098 ⊢ %_50099 : %_50099
 ; {>  %_50098~°1◂0':_p47795 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_50099
 ; {>  %_50099~°0◂°1◂0':(_opn)◂(_p47795) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_52453
	btr r12,3
	jmp LB_52454
LB_52453:
	bts r12,3
LB_52454:
	mov rsi,1
	bt r12,3
	jc LB_52451
	mov rsi,0
	bt r9,0
	jc LB_52451
	jmp LB_52452
LB_52451:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52452:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52455:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52457
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52456
LB_52457:
	add rsp,8
	ret
LB_52458:
	add rsp,32
	pop r14
LB_52456:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_48905_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52489
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52483
LB_52489:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52484
	btr r12,0
	jmp LB_52485
LB_52484:
	bts r12,0
LB_52485:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_52480
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47856 %_50100 ⊢ %_50101 : %_50101
 ; {>  %_50100~0':_p47790 }
; _f47856 0' ⊢ °0◂0'
; _some %_50101 ⊢ %_50102 : %_50102
 ; {>  %_50101~°0◂0':_p47795 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_50102
 ; {>  %_50102~°0◂°0◂0':(_opn)◂(_p47795) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_52478
	btr r12,3
	jmp LB_52479
LB_52478:
	bts r12,3
LB_52479:
	mov rsi,1
	bt r12,3
	jc LB_52476
	mov rsi,0
	bt r9,0
	jc LB_52476
	jmp LB_52477
LB_52476:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52477:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52480:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52482
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52481
LB_52482:
	add rsp,8
	ret
LB_52483:
	add rsp,16
	pop r14
LB_52481:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49867:
NS_E_RDI_49867:
NS_E_49867_ETR_TBL:
NS_E_49867_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_52498
LB_52497:
	add r14,1
LB_52498:
	cmp r14,r10
	jge LB_52499
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52497
	cmp al,10
	jz LB_52497
	cmp al,32
	jz LB_52497
LB_52499:
	add r14,1
	cmp r14,r10
	jg LB_52502
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_52502
	jmp LB_52503
LB_52502:
	jmp LB_52491
LB_52503:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_52505
LB_52504:
	add r14,1
LB_52505:
	cmp r14,r10
	jge LB_52506
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52504
	cmp al,10
	jz LB_52504
	cmp al,32
	jz LB_52504
LB_52506:
	add r14,1
	cmp r14,r10
	jg LB_52510
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_52510
	jmp LB_52511
LB_52510:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52508
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52508:
	jmp LB_52491
LB_52511:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_52513
LB_52512:
	add r14,1
LB_52513:
	cmp r14,r10
	jge LB_52514
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52512
	cmp al,10
	jz LB_52512
	cmp al,32
	jz LB_52512
LB_52514:
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52515
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52516
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52516:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52517
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52517:
	jmp LB_52491
LB_52515:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_52520
LB_52519:
	add r14,1
LB_52520:
	cmp r14,r10
	jge LB_52521
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52519
	cmp al,10
	jz LB_52519
	cmp al,32
	jz LB_52519
LB_52521:
	push r10
	call NS_E_49869_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52522
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_52523
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_52523:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52524
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52524:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52525
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52525:
	jmp LB_52491
LB_52522:
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
	jc LB_52492
	btr QWORD [rdi],3
LB_52492:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_52493
	btr QWORD [rdi],2
LB_52493:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52494
	btr QWORD [rdi],1
LB_52494:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52495
	btr QWORD [rdi],0
LB_52495:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_52491:
	add rsp,64
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
NS_E_49869:
NS_E_RDI_49869:
NS_E_49869_ETR_TBL:
NS_E_49869_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_52539
LB_52538:
	add r14,1
LB_52539:
	cmp r14,r10
	jge LB_52540
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52538
	cmp al,10
	jz LB_52538
	cmp al,32
	jz LB_52538
LB_52540:
	push r10
	call NS_E_49870_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52541
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52527
LB_52541:
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
	jc LB_52536
	btr QWORD [rdi],0
LB_52536:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_52527:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_52532
LB_52531:
	add r14,1
LB_52532:
	cmp r14,r10
	jge LB_52533
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52531
	cmp al,10
	jz LB_52531
	cmp al,32
	jz LB_52531
LB_52533:
	push r10
	call NS_E_49878_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52534
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52528
LB_52534:
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
	jc LB_52529
	btr QWORD [rdi],0
LB_52529:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_52528:
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
NS_E_49870:
NS_E_RDI_49870:
NS_E_49870_ETR_TBL:
NS_E_49870_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_52592
LB_52591:
	add r14,1
LB_52592:
	cmp r14,r10
	jge LB_52593
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52591
	cmp al,10
	jz LB_52591
	cmp al,32
	jz LB_52591
LB_52593:
	push r10
	call NS_E_49877_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52594
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52570
LB_52594:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_52579
LB_52578:
	add r14,1
LB_52579:
	cmp r14,r10
	jge LB_52580
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52578
	cmp al,10
	jz LB_52578
	cmp al,32
	jz LB_52578
LB_52580:
	push r10
	call NS_E_49872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52581
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52582
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52582:
	jmp LB_52571
LB_52581:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_52585
LB_52584:
	add r14,1
LB_52585:
	cmp r14,r10
	jge LB_52586
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52584
	cmp al,10
	jz LB_52584
	cmp al,32
	jz LB_52584
LB_52586:
	push r10
	call NS_E_49871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52587
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52588
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52588:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52589
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52589:
	jmp LB_52571
LB_52587:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_52576
	btr r12,2
	jmp LB_52577
LB_52576:
	bts r12,2
LB_52577:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52574
	btr r12,1
	jmp LB_52575
LB_52574:
	bts r12,1
LB_52575:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52572
	btr r12,0
	jmp LB_52573
LB_52572:
	bts r12,0
LB_52573:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_52567
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_52596
	btr r12,5
	jmp LB_52597
LB_52596:
	bts r12,5
LB_52597:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_52600
	btr r12,6
	jmp LB_52601
LB_52600:
	bts r12,6
LB_52601:
	mov r8,rcx
	bt r12,6
	jc LB_52598
	btr r12,2
	jmp LB_52599
LB_52598:
	bts r12,2
LB_52599:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_52604
	btr r12,6
	jmp LB_52605
LB_52604:
	bts r12,6
LB_52605:
	mov r9,rcx
	bt r12,6
	jc LB_52602
	btr r12,3
	jmp LB_52603
LB_52602:
	bts r12,3
LB_52603:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_52608
	btr r12,6
	jmp LB_52609
LB_52608:
	bts r12,6
LB_52609:
	mov r10,rcx
	bt r12,6
	jc LB_52606
	btr r12,4
	jmp LB_52607
LB_52606:
	bts r12,4
LB_52607:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47817 { %_50108 %_50109 %_50106 %_50107 %_50110 } ⊢ %_50111 : %_50111
 ; {>  %_50108~2':_p47788 %_50110~4':(_opn)◂(_p47778) %_50109~3':_p47791 %_50107~1':_p47780 %_50106~0':_p47779 }
; _f47817 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_50111 ⊢ %_50112 : %_50112
 ; {>  %_50111~°1◂{ 2' 3' 0' 1' 4' }:_p47778 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_50112
 ; {>  %_50112~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p47778) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_52543
	btr r12,5
	jmp LB_52544
LB_52543:
	bts r12,5
LB_52544:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_52549
	btr r12,6
	jmp LB_52550
LB_52549:
	bts r12,6
LB_52550:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_52547
	btr QWORD [rdi],0
	jmp LB_52548
LB_52547:
	bts QWORD [rdi],0
LB_52548:
	mov rcx,r11
	bt r12,5
	jc LB_52553
	btr r12,6
	jmp LB_52554
LB_52553:
	bts r12,6
LB_52554:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_52551
	btr QWORD [rdi],1
	jmp LB_52552
LB_52551:
	bts QWORD [rdi],1
LB_52552:
	mov rcx,r13
	bt r12,0
	jc LB_52557
	btr r12,6
	jmp LB_52558
LB_52557:
	bts r12,6
LB_52558:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_52555
	btr QWORD [rdi],2
	jmp LB_52556
LB_52555:
	bts QWORD [rdi],2
LB_52556:
	mov rcx,r14
	bt r12,1
	jc LB_52561
	btr r12,6
	jmp LB_52562
LB_52561:
	bts r12,6
LB_52562:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_52559
	btr QWORD [rdi],3
	jmp LB_52560
LB_52559:
	bts QWORD [rdi],3
LB_52560:
	mov rcx,r10
	bt r12,4
	jc LB_52565
	btr r12,6
	jmp LB_52566
LB_52565:
	bts r12,6
LB_52566:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_52563
	btr QWORD [rdi],4
	jmp LB_52564
LB_52563:
	bts QWORD [rdi],4
LB_52564:
	mov rsi,1
	bt r12,3
	jc LB_52545
	mov rsi,0
	bt r9,0
	jc LB_52545
	jmp LB_52546
LB_52545:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52546:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52567:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52569
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52568
LB_52569:
	add rsp,8
	ret
LB_52571:
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
LB_52570:
	add rsp,48
	pop r14
LB_52568:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; grm_ord
	jmp LB_52651
LB_52650:
	add r14,1
LB_52651:
	cmp r14,r10
	jge LB_52652
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52650
	cmp al,10
	jz LB_52650
	cmp al,32
	jz LB_52650
LB_52652:
	push r10
	call NS_E_49876_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52653
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52641
LB_52653:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_52656
LB_52655:
	add r14,1
LB_52656:
	cmp r14,r10
	jge LB_52657
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52655
	cmp al,10
	jz LB_52655
	cmp al,32
	jz LB_52655
LB_52657:
	push r10
	call NS_E_49872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52658
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52659
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52659:
	jmp LB_52641
LB_52658:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_52662
LB_52661:
	add r14,1
LB_52662:
	cmp r14,r10
	jge LB_52663
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52661
	cmp al,10
	jz LB_52661
	cmp al,32
	jz LB_52661
LB_52663:
	push r10
	call NS_E_49871_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52664
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52665
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52665:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52666
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52666:
	jmp LB_52641
LB_52664:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_52669
LB_52668:
	add r14,1
LB_52669:
	cmp r14,r10
	jge LB_52670
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52668
	cmp al,10
	jz LB_52668
	cmp al,32
	jz LB_52668
LB_52670:
	push r10
	call NS_E_49870_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52671
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_52672
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_52672:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52673
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52673:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52674
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52674:
	jmp LB_52641
LB_52671:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_52648
	btr r12,3
	jmp LB_52649
LB_52648:
	bts r12,3
LB_52649:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_52646
	btr r12,2
	jmp LB_52647
LB_52646:
	bts r12,2
LB_52647:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52644
	btr r12,1
	jmp LB_52645
LB_52644:
	bts r12,1
LB_52645:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52642
	btr r12,0
	jmp LB_52643
LB_52642:
	bts r12,0
LB_52643:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_52638
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_52676
	btr r12,5
	jmp LB_52677
LB_52676:
	bts r12,5
LB_52677:
	mov rcx,r8
	bt r12,2
	jc LB_52678
	btr r12,6
	jmp LB_52679
LB_52678:
	bts r12,6
LB_52679:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_52682
	btr r12,7
	jmp LB_52683
LB_52682:
	bts r12,7
LB_52683:
	mov r8,rdx
	bt r12,7
	jc LB_52680
	btr r12,2
	jmp LB_52681
LB_52680:
	bts r12,2
LB_52681:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_52686
	btr r12,7
	jmp LB_52687
LB_52686:
	bts r12,7
LB_52687:
	mov r9,rdx
	bt r12,7
	jc LB_52684
	btr r12,3
	jmp LB_52685
LB_52684:
	bts r12,3
LB_52685:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_52690
	btr r12,7
	jmp LB_52691
LB_52690:
	bts r12,7
LB_52691:
	mov r10,rdx
	bt r12,7
	jc LB_52688
	btr r12,4
	jmp LB_52689
LB_52688:
	bts r12,4
LB_52689:
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47816 { %_50115 %_50116 %_50113 %_50114 %_50117 %_50118 } ⊢ %_50119 : %_50119
 ; {>  %_50116~3':_p47791 %_50113~0':_p47779 %_50118~5':_p47778 %_50114~1':_p47780 %_50115~2':_p47788 %_50117~4':(_opn)◂(_p47778) }
; _f47816 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_50119 ⊢ %_50120 : %_50120
 ; {>  %_50119~°0◂{ 2' 3' 0' 1' 4' 5' }:_p47778 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_50120
 ; {>  %_50120~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p47778) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_52610
	btr r12,6
	jmp LB_52611
LB_52610:
	bts r12,6
LB_52611:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_52616
	btr r12,7
	jmp LB_52617
LB_52616:
	bts r12,7
LB_52617:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rdx
	bt r12,7
	jc LB_52614
	btr QWORD [rdi],0
	jmp LB_52615
LB_52614:
	bts QWORD [rdi],0
LB_52615:
	mov rdx,rcx
	bt r12,6
	jc LB_52620
	btr r12,7
	jmp LB_52621
LB_52620:
	bts r12,7
LB_52621:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rdx
	bt r12,7
	jc LB_52618
	btr QWORD [rdi],1
	jmp LB_52619
LB_52618:
	bts QWORD [rdi],1
LB_52619:
	mov rdx,r13
	bt r12,0
	jc LB_52624
	btr r12,7
	jmp LB_52625
LB_52624:
	bts r12,7
LB_52625:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rdx
	bt r12,7
	jc LB_52622
	btr QWORD [rdi],2
	jmp LB_52623
LB_52622:
	bts QWORD [rdi],2
LB_52623:
	mov rdx,r14
	bt r12,1
	jc LB_52628
	btr r12,7
	jmp LB_52629
LB_52628:
	bts r12,7
LB_52629:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rdx
	bt r12,7
	jc LB_52626
	btr QWORD [rdi],3
	jmp LB_52627
LB_52626:
	bts QWORD [rdi],3
LB_52627:
	mov rdx,r10
	bt r12,4
	jc LB_52632
	btr r12,7
	jmp LB_52633
LB_52632:
	bts r12,7
LB_52633:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rdx
	bt r12,7
	jc LB_52630
	btr QWORD [rdi],4
	jmp LB_52631
LB_52630:
	bts QWORD [rdi],4
LB_52631:
	mov rdx,r11
	bt r12,5
	jc LB_52636
	btr r12,7
	jmp LB_52637
LB_52636:
	bts r12,7
LB_52637:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*5],rdx
	bt r12,7
	jc LB_52634
	btr QWORD [rdi],5
	jmp LB_52635
LB_52634:
	bts QWORD [rdi],5
LB_52635:
	mov rsi,1
	bt r12,3
	jc LB_52612
	mov rsi,0
	bt r9,0
	jc LB_52612
	jmp LB_52613
LB_52612:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52613:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52638:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52640
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52639
LB_52640:
	add rsp,8
	ret
LB_52641:
	add rsp,64
	pop r14
LB_52639:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49871:
NS_E_RDI_49871:
NS_E_49871_ETR_TBL:
NS_E_49871_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; ";"
	jmp LB_52746
LB_52745:
	add r14,1
LB_52746:
	cmp r14,r10
	jge LB_52747
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52745
	cmp al,10
	jz LB_52745
	cmp al,32
	jz LB_52745
LB_52747:
	add r14,1
	cmp r14,r10
	jg LB_52750
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_52750
	jmp LB_52751
LB_52750:
	jmp LB_52709
LB_52751:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_52753
LB_52752:
	add r14,1
LB_52753:
	cmp r14,r10
	jge LB_52754
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52752
	cmp al,10
	jz LB_52752
	cmp al,32
	jz LB_52752
LB_52754:
	add r14,3
	cmp r14,r10
	jg LB_52758
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_52758
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_52758
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_52758
	jmp LB_52759
LB_52758:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52756
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52756:
	jmp LB_52709
LB_52759:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_52722
LB_52721:
	add r14,1
LB_52722:
	cmp r14,r10
	jge LB_52723
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52721
	cmp al,10
	jz LB_52721
	cmp al,32
	jz LB_52721
LB_52723:
	push r10
	call NS_E_49298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52724
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52725
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52725:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52726
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52726:
	jmp LB_52710
LB_52724:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_52729
LB_52728:
	add r14,1
LB_52729:
	cmp r14,r10
	jge LB_52730
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52728
	cmp al,10
	jz LB_52728
	cmp al,32
	jz LB_52728
LB_52730:
	push r10
	call NS_E_49853_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52731
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_52732
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_52732:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52733
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52733:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52734
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52734:
	jmp LB_52710
LB_52731:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_52737
LB_52736:
	add r14,1
LB_52737:
	cmp r14,r10
	jge LB_52738
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52736
	cmp al,10
	jz LB_52736
	cmp al,32
	jz LB_52736
LB_52738:
	push r10
	call NS_E_49870_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52739
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_52740
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_52740:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_52741
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_52741:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52742
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52742:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52743
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52743:
	jmp LB_52710
LB_52739:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_52719
	btr r12,4
	jmp LB_52720
LB_52719:
	bts r12,4
LB_52720:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_52717
	btr r12,3
	jmp LB_52718
LB_52717:
	bts r12,3
LB_52718:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_52715
	btr r12,2
	jmp LB_52716
LB_52715:
	bts r12,2
LB_52716:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52713
	btr r12,1
	jmp LB_52714
LB_52713:
	bts r12,1
LB_52714:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52711
	btr r12,0
	jmp LB_52712
LB_52711:
	bts r12,0
LB_52712:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_52706
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_52760
	btr r12,5
	jmp LB_52761
LB_52760:
	bts r12,5
LB_52761:
	mov r8,r10
	bt r12,4
	jc LB_52762
	btr r12,2
	jmp LB_52763
LB_52762:
	bts r12,2
LB_52763:
	mov r10,r14
	bt r12,1
	jc LB_52764
	btr r12,4
	jmp LB_52765
LB_52764:
	bts r12,4
LB_52765:
	mov r14,r9
	bt r12,3
	jc LB_52766
	btr r12,1
	jmp LB_52767
LB_52766:
	bts r12,1
LB_52767:
	mov r9,r13
	bt r12,0
	jc LB_52768
	btr r12,3
	jmp LB_52769
LB_52768:
	bts r12,3
LB_52769:
	mov r13,r11
	bt r12,5
	jc LB_52770
	btr r12,0
	jmp LB_52771
LB_52770:
	bts r12,0
LB_52771:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_50123 ⊢ %_50124 : %_50124
 ; {>  %_50121~0':_p47788 %_50123~2':_p47778 %_50122~1':_p47791 }
; _some 2' ⊢ °0◂2'
; _some { %_50121 %_50122 %_50124 } ⊢ %_50125 : %_50125
 ; {>  %_50121~0':_p47788 %_50124~°0◂2':(_opn)◂(_p47778) %_50122~1':_p47791 }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_50125
 ; {>  %_50125~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ _p47788 _p47791 (_opn)◂(_p47778) }) }
; 	∎ °0◂{ 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' °0◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_52694
	btr r12,4
	jmp LB_52695
LB_52694:
	bts r12,4
LB_52695:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_52692
	btr QWORD [rdi],0
	jmp LB_52693
LB_52692:
	bts QWORD [rdi],0
LB_52693:
	mov r10,r14
	bt r12,1
	jc LB_52698
	btr r12,4
	jmp LB_52699
LB_52698:
	bts r12,4
LB_52699:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_52696
	btr QWORD [rdi],1
	jmp LB_52697
LB_52696:
	bts QWORD [rdi],1
LB_52697:
	mov r10,r8
	bt r12,2
	jc LB_52704
	btr r12,4
	jmp LB_52705
LB_52704:
	bts r12,4
LB_52705:
	mov rsi,1
	bt r12,4
	jc LB_52702
	mov rsi,0
	bt r10,0
	jc LB_52702
	jmp LB_52703
LB_52702:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_52703:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_52700
	btr QWORD [rdi],2
	jmp LB_52701
LB_52700:
	bts QWORD [rdi],2
LB_52701:
	mov r8,0
	bts r12,2
	ret
LB_52706:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52708
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52707
LB_52708:
	add rsp,8
	ret
LB_52710:
	add rsp,80
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
LB_52709:
	add rsp,80
	pop r14
LB_52707:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_52809
LB_52808:
	add r14,1
LB_52809:
	cmp r14,r10
	jge LB_52810
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52808
	cmp al,10
	jz LB_52808
	cmp al,32
	jz LB_52808
LB_52810:
	add r14,3
	cmp r14,r10
	jg LB_52813
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_52813
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_52813
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_52813
	jmp LB_52814
LB_52813:
	jmp LB_52787
LB_52814:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_52796
LB_52795:
	add r14,1
LB_52796:
	cmp r14,r10
	jge LB_52797
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52795
	cmp al,10
	jz LB_52795
	cmp al,32
	jz LB_52795
LB_52797:
	push r10
	call NS_E_49298_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52798
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52799
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52799:
	jmp LB_52788
LB_52798:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_52802
LB_52801:
	add r14,1
LB_52802:
	cmp r14,r10
	jge LB_52803
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52801
	cmp al,10
	jz LB_52801
	cmp al,32
	jz LB_52801
LB_52803:
	push r10
	call NS_E_49853_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52804
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52805
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52805:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52806
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52806:
	jmp LB_52788
LB_52804:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_52793
	btr r12,2
	jmp LB_52794
LB_52793:
	bts r12,2
LB_52794:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52791
	btr r12,1
	jmp LB_52792
LB_52791:
	bts r12,1
LB_52792:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52789
	btr r12,0
	jmp LB_52790
LB_52789:
	bts r12,0
LB_52790:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_52784
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_52815
	btr r12,3
	jmp LB_52816
LB_52815:
	bts r12,3
LB_52816:
	mov r14,r8
	bt r12,2
	jc LB_52817
	btr r12,1
	jmp LB_52818
LB_52817:
	bts r12,1
LB_52818:
	mov r8,r13
	bt r12,0
	jc LB_52819
	btr r12,2
	jmp LB_52820
LB_52819:
	bts r12,2
LB_52820:
	mov r13,r9
	bt r12,3
	jc LB_52821
	btr r12,0
	jmp LB_52822
LB_52821:
	bts r12,0
LB_52822:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_50128 : %_50128
 ; {>  %_50126~0':_p47788 %_50127~1':_p47791 }
; _none {  } ⊢ °1◂{  }
; _some { %_50126 %_50127 %_50128 } ⊢ %_50129 : %_50129
 ; {>  %_50126~0':_p47788 %_50128~°1◂{  }:(_opn)◂(t16923'(0)) %_50127~1':_p47791 }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_50129
 ; {>  %_50129~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ _p47788 _p47791 (_opn)◂(t16926'(0)) }) }
; 	∎ °0◂{ 0' 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_52774
	btr r12,2
	jmp LB_52775
LB_52774:
	bts r12,2
LB_52775:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_52772
	btr QWORD [rdi],0
	jmp LB_52773
LB_52772:
	bts QWORD [rdi],0
LB_52773:
	mov r8,r14
	bt r12,1
	jc LB_52778
	btr r12,2
	jmp LB_52779
LB_52778:
	bts r12,2
LB_52779:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_52776
	btr QWORD [rdi],1
	jmp LB_52777
LB_52776:
	bts QWORD [rdi],1
LB_52777:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_52782
	mov rsi,0
	bt r8,0
	jc LB_52782
	jmp LB_52783
LB_52782:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_52783:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_52780
	btr QWORD [rdi],2
	jmp LB_52781
LB_52780:
	bts QWORD [rdi],2
LB_52781:
	mov r8,0
	bts r12,2
	ret
LB_52784:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52786
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52785
LB_52786:
	add rsp,8
	ret
LB_52788:
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
LB_52787:
	add rsp,48
	pop r14
LB_52785:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49872:
NS_E_RDI_49872:
NS_E_49872_ETR_TBL:
NS_E_49872_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "!|"
	jmp LB_52843
LB_52842:
	add r14,1
LB_52843:
	cmp r14,r10
	jge LB_52844
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52842
	cmp al,10
	jz LB_52842
	cmp al,32
	jz LB_52842
LB_52844:
	add r14,2
	cmp r14,r10
	jg LB_52847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_52847
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_52847
	jmp LB_52848
LB_52847:
	jmp LB_52830
LB_52848:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_52837
LB_52836:
	add r14,1
LB_52837:
	cmp r14,r10
	jge LB_52838
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52836
	cmp al,10
	jz LB_52836
	cmp al,32
	jz LB_52836
LB_52838:
	push r10
	call NS_E_49873_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52839
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52840
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52840:
	jmp LB_52831
LB_52839:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52834
	btr r12,1
	jmp LB_52835
LB_52834:
	bts r12,1
LB_52835:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52832
	btr r12,0
	jmp LB_52833
LB_52832:
	bts r12,0
LB_52833:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_52827
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_52849
	btr r12,2
	jmp LB_52850
LB_52849:
	bts r12,2
LB_52850:
	mov r13,r14
	bt r12,1
	jc LB_52851
	btr r12,0
	jmp LB_52852
LB_52851:
	bts r12,0
LB_52852:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47821 %_50130 ⊢ %_50131 : %_50131
 ; {>  %_50130~0':_p47781 }
; _f47821 0' ⊢ °0◂0'
; _some %_50131 ⊢ %_50132 : %_50132
 ; {>  %_50131~°0◂0':_p47780 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_50132
 ; {>  %_50132~°0◂°0◂0':(_opn)◂(_p47780) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_52825
	btr r12,3
	jmp LB_52826
LB_52825:
	bts r12,3
LB_52826:
	mov rsi,1
	bt r12,3
	jc LB_52823
	mov rsi,0
	bt r9,0
	jc LB_52823
	jmp LB_52824
LB_52823:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52824:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52827:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52829
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52828
LB_52829:
	add rsp,8
	ret
LB_52831:
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
LB_52830:
	add rsp,32
	pop r14
LB_52828:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_52872
LB_52871:
	add r14,1
LB_52872:
	cmp r14,r10
	jge LB_52873
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52871
	cmp al,10
	jz LB_52871
	cmp al,32
	jz LB_52871
LB_52873:
	push r10
	call NS_E_49874_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52874
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52866
LB_52874:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_52877
LB_52876:
	add r14,1
LB_52877:
	cmp r14,r10
	jge LB_52878
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52876
	cmp al,10
	jz LB_52876
	cmp al,32
	jz LB_52876
LB_52878:
	push r10
	call NS_E_49872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52879
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52880
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52880:
	jmp LB_52866
LB_52879:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52869
	btr r12,1
	jmp LB_52870
LB_52869:
	bts r12,1
LB_52870:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52867
	btr r12,0
	jmp LB_52868
LB_52867:
	bts r12,0
LB_52868:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_52863
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f47822 { %_50133 %_50134 } ⊢ %_50135 : %_50135
 ; {>  %_50133~0':_p47782 %_50134~1':_p47780 }
; _f47822 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_50135 ⊢ %_50136 : %_50136
 ; {>  %_50135~°1◂{ 0' 1' }:_p47780 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_50136
 ; {>  %_50136~°0◂°1◂{ 0' 1' }:(_opn)◂(_p47780) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_52857
	btr r12,2
	jmp LB_52858
LB_52857:
	bts r12,2
LB_52858:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_52855
	btr QWORD [rdi],0
	jmp LB_52856
LB_52855:
	bts QWORD [rdi],0
LB_52856:
	mov r8,r14
	bt r12,1
	jc LB_52861
	btr r12,2
	jmp LB_52862
LB_52861:
	bts r12,2
LB_52862:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_52859
	btr QWORD [rdi],1
	jmp LB_52860
LB_52859:
	bts QWORD [rdi],1
LB_52860:
	mov rsi,1
	bt r12,3
	jc LB_52853
	mov rsi,0
	bt r9,0
	jc LB_52853
	jmp LB_52854
LB_52853:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52854:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52863:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52865
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52864
LB_52865:
	add rsp,8
	ret
LB_52866:
	add rsp,32
	pop r14
LB_52864:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_52884
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f47823 {  } ⊢ %_50137 : %_50137
 ; {>  }
; _f47823 {  } ⊢ °2◂{  }
; _some %_50137 ⊢ %_50138 : %_50138
 ; {>  %_50137~°2◂{  }:_p47780 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_50138
 ; {>  %_50138~°0◂°2◂{  }:(_opn)◂(_p47780) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_52882
	mov rsi,0
	bt r9,0
	jc LB_52882
	jmp LB_52883
LB_52882:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52883:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52884:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52886
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52885
LB_52886:
	add rsp,8
	ret
LB_52887:
	add rsp,0
	pop r14
LB_52885:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49873:
NS_E_RDI_49873:
NS_E_49873_ETR_TBL:
NS_E_49873_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_52907
LB_52906:
	add r14,1
LB_52907:
	cmp r14,r10
	jge LB_52908
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52906
	cmp al,10
	jz LB_52906
	cmp al,32
	jz LB_52906
LB_52908:
	push r10
	call NS_E_49874_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52909
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52901
LB_52909:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_52912
LB_52911:
	add r14,1
LB_52912:
	cmp r14,r10
	jge LB_52913
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52911
	cmp al,10
	jz LB_52911
	cmp al,32
	jz LB_52911
LB_52913:
	push r10
	call NS_E_49873_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52914
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52915
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52915:
	jmp LB_52901
LB_52914:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52904
	btr r12,1
	jmp LB_52905
LB_52904:
	bts r12,1
LB_52905:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52902
	btr r12,0
	jmp LB_52903
LB_52902:
	bts r12,0
LB_52903:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_52898
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f47824 { %_50139 %_50140 } ⊢ %_50141 : %_50141
 ; {>  %_50139~0':_p47782 %_50140~1':_p47781 }
; _f47824 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_50141 ⊢ %_50142 : %_50142
 ; {>  %_50141~°0◂{ 0' 1' }:_p47781 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_50142
 ; {>  %_50142~°0◂°0◂{ 0' 1' }:(_opn)◂(_p47781) }
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
	jc LB_52892
	btr r12,2
	jmp LB_52893
LB_52892:
	bts r12,2
LB_52893:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_52890
	btr QWORD [rdi],0
	jmp LB_52891
LB_52890:
	bts QWORD [rdi],0
LB_52891:
	mov r8,r14
	bt r12,1
	jc LB_52896
	btr r12,2
	jmp LB_52897
LB_52896:
	bts r12,2
LB_52897:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_52894
	btr QWORD [rdi],1
	jmp LB_52895
LB_52894:
	bts QWORD [rdi],1
LB_52895:
	mov rsi,1
	bt r12,3
	jc LB_52888
	mov rsi,0
	bt r9,0
	jc LB_52888
	jmp LB_52889
LB_52888:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52889:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52898:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52900
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52899
LB_52900:
	add rsp,8
	ret
LB_52901:
	add rsp,32
	pop r14
LB_52899:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_52919
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f47825 {  } ⊢ %_50143 : %_50143
 ; {>  }
; _f47825 {  } ⊢ °1◂{  }
; _some %_50143 ⊢ %_50144 : %_50144
 ; {>  %_50143~°1◂{  }:_p47781 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_50144
 ; {>  %_50144~°0◂°1◂{  }:(_opn)◂(_p47781) }
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
	jc LB_52917
	mov rsi,0
	bt r9,0
	jc LB_52917
	jmp LB_52918
LB_52917:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52918:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52919:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52921
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52920
LB_52921:
	add rsp,8
	ret
LB_52922:
	add rsp,0
	pop r14
LB_52920:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49874:
NS_E_RDI_49874:
NS_E_49874_ETR_TBL:
NS_E_49874_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_52938
LB_52937:
	add r14,1
LB_52938:
	cmp r14,r10
	jge LB_52939
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52937
	cmp al,10
	jz LB_52937
	cmp al,32
	jz LB_52937
LB_52939:
	add r14,3
	cmp r14,r10
	jg LB_52942
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_52942
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_52942
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_52942
	jmp LB_52943
LB_52942:
	jmp LB_52930
LB_52943:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_52945
LB_52944:
	add r14,1
LB_52945:
	cmp r14,r10
	jge LB_52946
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52944
	cmp al,10
	jz LB_52944
	cmp al,32
	jz LB_52944
LB_52946:
	push r10
	call NS_E_49875_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52947
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52948
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52948:
	jmp LB_52930
LB_52947:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_52951
LB_52950:
	add r14,1
LB_52951:
	cmp r14,r10
	jge LB_52952
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52950
	cmp al,10
	jz LB_52950
	cmp al,32
	jz LB_52950
LB_52952:
	add r14,3
	cmp r14,r10
	jg LB_52957
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_52957
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_52957
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_52957
	jmp LB_52958
LB_52957:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_52954
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_52954:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_52955
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_52955:
	jmp LB_52930
LB_52958:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_52935
	btr r12,2
	jmp LB_52936
LB_52935:
	bts r12,2
LB_52936:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_52933
	btr r12,1
	jmp LB_52934
LB_52933:
	bts r12,1
LB_52934:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52931
	btr r12,0
	jmp LB_52932
LB_52931:
	bts r12,0
LB_52932:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_52927
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_52959
	btr r12,3
	jmp LB_52960
LB_52959:
	bts r12,3
LB_52960:
	mov r13,r14
	bt r12,1
	jc LB_52961
	btr r12,0
	jmp LB_52962
LB_52961:
	bts r12,0
LB_52962:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47826 %_50145 ⊢ %_50146 : %_50146
 ; {>  %_50145~0':_p47783 }
; _f47826 0' ⊢ °0◂0'
; _some %_50146 ⊢ %_50147 : %_50147
 ; {>  %_50146~°0◂0':_p47782 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_50147
 ; {>  %_50147~°0◂°0◂0':(_opn)◂(_p47782) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_52925
	btr r12,3
	jmp LB_52926
LB_52925:
	bts r12,3
LB_52926:
	mov rsi,1
	bt r12,3
	jc LB_52923
	mov rsi,0
	bt r9,0
	jc LB_52923
	jmp LB_52924
LB_52923:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52924:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52927:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52929
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52928
LB_52929:
	add rsp,8
	ret
LB_52930:
	add rsp,48
	pop r14
LB_52928:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_52974
LB_52973:
	add r14,1
LB_52974:
	cmp r14,r10
	jge LB_52975
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52973
	cmp al,10
	jz LB_52973
	cmp al,32
	jz LB_52973
LB_52975:
	push r10
	call NS_E_49875_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52976
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52970
LB_52976:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52971
	btr r12,0
	jmp LB_52972
LB_52971:
	bts r12,0
LB_52972:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_52967
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47827 %_50148 ⊢ %_50149 : %_50149
 ; {>  %_50148~0':_p47783 }
; _f47827 0' ⊢ °1◂0'
; _some %_50149 ⊢ %_50150 : %_50150
 ; {>  %_50149~°1◂0':_p47782 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_50150
 ; {>  %_50150~°0◂°1◂0':(_opn)◂(_p47782) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_52965
	btr r12,3
	jmp LB_52966
LB_52965:
	bts r12,3
LB_52966:
	mov rsi,1
	bt r12,3
	jc LB_52963
	mov rsi,0
	bt r9,0
	jc LB_52963
	jmp LB_52964
LB_52963:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52964:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52967:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52969
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52968
LB_52969:
	add rsp,8
	ret
LB_52970:
	add rsp,16
	pop r14
LB_52968:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49875:
NS_E_RDI_49875:
NS_E_49875_ETR_TBL:
NS_E_49875_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_52989
LB_52988:
	add r14,1
LB_52989:
	cmp r14,r10
	jge LB_52990
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_52988
	cmp al,10
	jz LB_52988
	cmp al,32
	jz LB_52988
LB_52990:
	push r10
	call NS_E_47211_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_52991
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52985
LB_52991:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_52986
	btr r12,0
	jmp LB_52987
LB_52986:
	bts r12,0
LB_52987:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_52982
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47829 %_50151 ⊢ %_50152 : %_50152
 ; {>  %_50151~0':_stg }
; _f47829 0' ⊢ °1◂0'
; _some %_50152 ⊢ %_50153 : %_50153
 ; {>  %_50152~°1◂0':_p47783 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_50153
 ; {>  %_50153~°0◂°1◂0':(_opn)◂(_p47783) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_52980
	btr r12,3
	jmp LB_52981
LB_52980:
	bts r12,3
LB_52981:
	mov rsi,1
	bt r12,3
	jc LB_52978
	mov rsi,0
	bt r9,0
	jc LB_52978
	jmp LB_52979
LB_52978:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52979:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52982:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52984
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52983
LB_52984:
	add rsp,8
	ret
LB_52985:
	add rsp,16
	pop r14
LB_52983:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_53004
LB_53003:
	add r14,1
LB_53004:
	cmp r14,r10
	jge LB_53005
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53003
	cmp al,10
	jz LB_53003
	cmp al,32
	jz LB_53003
LB_53005:
	push r10
	call NS_E_48838_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_53006
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53000
LB_53006:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_53001
	btr r12,0
	jmp LB_53002
LB_53001:
	bts r12,0
LB_53002:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_52997
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f47828 %_50154 ⊢ %_50155 : %_50155
 ; {>  %_50154~0':_p47766 }
; _f47828 0' ⊢ °0◂0'
; _some %_50155 ⊢ %_50156 : %_50156
 ; {>  %_50155~°0◂0':_p47783 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_50156
 ; {>  %_50156~°0◂°0◂0':(_opn)◂(_p47783) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_52995
	btr r12,3
	jmp LB_52996
LB_52995:
	bts r12,3
LB_52996:
	mov rsi,1
	bt r12,3
	jc LB_52993
	mov rsi,0
	bt r9,0
	jc LB_52993
	jmp LB_52994
LB_52993:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_52994:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_52997:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_52999
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_52998
LB_52999:
	add rsp,8
	ret
LB_53000:
	add rsp,16
	pop r14
LB_52998:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49876:
NS_E_RDI_49876:
NS_E_49876_ETR_TBL:
NS_E_49876_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_53017
LB_53016:
	add r14,1
LB_53017:
	cmp r14,r10
	jge LB_53018
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53016
	cmp al,10
	jz LB_53016
	cmp al,32
	jz LB_53016
LB_53018:
	add r14,4
	cmp r14,r10
	jg LB_53021
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_53021
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_53021
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_53021
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_53021
	jmp LB_53022
LB_53021:
	jmp LB_53013
LB_53022:
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
	jc LB_53014
	btr r12,0
	jmp LB_53015
LB_53014:
	bts r12,0
LB_53015:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_53010
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47819 {  } ⊢ %_50157 : %_50157
 ; {>  }
; _f47819 {  } ⊢ °1◂{  }
; _some %_50157 ⊢ %_50158 : %_50158
 ; {>  %_50157~°1◂{  }:_p47779 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_50158
 ; {>  %_50158~°0◂°1◂{  }:(_opn)◂(_p47779) }
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
	jc LB_53008
	mov rsi,0
	bt r9,0
	jc LB_53008
	jmp LB_53009
LB_53008:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53009:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_53010:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_53012
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53011
LB_53012:
	add rsp,8
	ret
LB_53013:
	add rsp,16
	pop r14
LB_53011:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_53032
LB_53031:
	add r14,1
LB_53032:
	cmp r14,r10
	jge LB_53033
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53031
	cmp al,10
	jz LB_53031
	cmp al,32
	jz LB_53031
LB_53033:
	add r14,4
	cmp r14,r10
	jg LB_53036
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_53036
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_53036
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_53036
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_53036
	jmp LB_53037
LB_53036:
	jmp LB_53028
LB_53037:
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
	jc LB_53029
	btr r12,0
	jmp LB_53030
LB_53029:
	bts r12,0
LB_53030:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_53025
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47820 {  } ⊢ %_50159 : %_50159
 ; {>  }
; _f47820 {  } ⊢ °2◂{  }
; _some %_50159 ⊢ %_50160 : %_50160
 ; {>  %_50159~°2◂{  }:_p47779 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_50160
 ; {>  %_50160~°0◂°2◂{  }:(_opn)◂(_p47779) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_53023
	mov rsi,0
	bt r9,0
	jc LB_53023
	jmp LB_53024
LB_53023:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53024:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_53025:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_53027
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53026
LB_53027:
	add rsp,8
	ret
LB_53028:
	add rsp,16
	pop r14
LB_53026:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_53047
LB_53046:
	add r14,1
LB_53047:
	cmp r14,r10
	jge LB_53048
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53046
	cmp al,10
	jz LB_53046
	cmp al,32
	jz LB_53046
LB_53048:
	add r14,3
	cmp r14,r10
	jg LB_53051
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_53051
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_53051
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_53051
	jmp LB_53052
LB_53051:
	jmp LB_53043
LB_53052:
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
	jc LB_53044
	btr r12,0
	jmp LB_53045
LB_53044:
	bts r12,0
LB_53045:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_53040
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47818 {  } ⊢ %_50161 : %_50161
 ; {>  }
; _f47818 {  } ⊢ °0◂{  }
; _some %_50161 ⊢ %_50162 : %_50162
 ; {>  %_50161~°0◂{  }:_p47779 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_50162
 ; {>  %_50162~°0◂°0◂{  }:(_opn)◂(_p47779) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_53038
	mov rsi,0
	bt r9,0
	jc LB_53038
	jmp LB_53039
LB_53038:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53039:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_53040:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_53042
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53041
LB_53042:
	add rsp,8
	ret
LB_53043:
	add rsp,16
	pop r14
LB_53041:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49877:
NS_E_RDI_49877:
NS_E_49877_ETR_TBL:
NS_E_49877_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_53062
LB_53061:
	add r14,1
LB_53062:
	cmp r14,r10
	jge LB_53063
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53061
	cmp al,10
	jz LB_53061
	cmp al,32
	jz LB_53061
LB_53063:
	add r14,5
	cmp r14,r10
	jg LB_53066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_53066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_53066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_53066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_53066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_53066
	jmp LB_53067
LB_53066:
	jmp LB_53058
LB_53067:
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
	jc LB_53059
	btr r12,0
	jmp LB_53060
LB_53059:
	bts r12,0
LB_53060:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_53055
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47819 {  } ⊢ %_50163 : %_50163
 ; {>  }
; _f47819 {  } ⊢ °1◂{  }
; _some %_50163 ⊢ %_50164 : %_50164
 ; {>  %_50163~°1◂{  }:_p47779 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_50164
 ; {>  %_50164~°0◂°1◂{  }:(_opn)◂(_p47779) }
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
	jc LB_53053
	mov rsi,0
	bt r9,0
	jc LB_53053
	jmp LB_53054
LB_53053:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53054:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_53055:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_53057
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53056
LB_53057:
	add rsp,8
	ret
LB_53058:
	add rsp,16
	pop r14
LB_53056:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_53077
LB_53076:
	add r14,1
LB_53077:
	cmp r14,r10
	jge LB_53078
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53076
	cmp al,10
	jz LB_53076
	cmp al,32
	jz LB_53076
LB_53078:
	add r14,5
	cmp r14,r10
	jg LB_53081
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_53081
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_53081
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_53081
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_53081
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_53081
	jmp LB_53082
LB_53081:
	jmp LB_53073
LB_53082:
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
	jc LB_53074
	btr r12,0
	jmp LB_53075
LB_53074:
	bts r12,0
LB_53075:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_53070
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47820 {  } ⊢ %_50165 : %_50165
 ; {>  }
; _f47820 {  } ⊢ °2◂{  }
; _some %_50165 ⊢ %_50166 : %_50166
 ; {>  %_50165~°2◂{  }:_p47779 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_50166
 ; {>  %_50166~°0◂°2◂{  }:(_opn)◂(_p47779) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_53068
	mov rsi,0
	bt r9,0
	jc LB_53068
	jmp LB_53069
LB_53068:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53069:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_53070:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_53072
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53071
LB_53072:
	add rsp,8
	ret
LB_53073:
	add rsp,16
	pop r14
LB_53071:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_53092
LB_53091:
	add r14,1
LB_53092:
	cmp r14,r10
	jge LB_53093
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53091
	cmp al,10
	jz LB_53091
	cmp al,32
	jz LB_53091
LB_53093:
	add r14,4
	cmp r14,r10
	jg LB_53096
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_53096
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_53096
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_53096
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_53096
	jmp LB_53097
LB_53096:
	jmp LB_53088
LB_53097:
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
	jc LB_53089
	btr r12,0
	jmp LB_53090
LB_53089:
	bts r12,0
LB_53090:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_53085
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f47818 {  } ⊢ %_50167 : %_50167
 ; {>  }
; _f47818 {  } ⊢ °0◂{  }
; _some %_50167 ⊢ %_50168 : %_50168
 ; {>  %_50167~°0◂{  }:_p47779 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_50168
 ; {>  %_50168~°0◂°0◂{  }:(_opn)◂(_p47779) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_53083
	mov rsi,0
	bt r9,0
	jc LB_53083
	jmp LB_53084
LB_53083:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53084:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_53085:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_53087
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53086
LB_53087:
	add rsp,8
	ret
LB_53088:
	add rsp,16
	pop r14
LB_53086:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49878:
NS_E_RDI_49878:
NS_E_49878_ETR_TBL:
NS_E_49878_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_53153
LB_53152:
	add r14,1
LB_53153:
	cmp r14,r10
	jge LB_53154
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53152
	cmp al,10
	jz LB_53152
	cmp al,32
	jz LB_53152
LB_53154:
	push r10
	call NS_E_49877_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_53155
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53121
LB_53155:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_53132
LB_53131:
	add r14,1
LB_53132:
	cmp r14,r10
	jge LB_53133
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53131
	cmp al,10
	jz LB_53131
	cmp al,32
	jz LB_53131
LB_53133:
	push r10
	call NS_E_49880_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_53134
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_53135
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_53135:
	jmp LB_53122
LB_53134:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_53138
LB_53137:
	add r14,1
LB_53138:
	cmp r14,r10
	jge LB_53139
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53137
	cmp al,10
	jz LB_53137
	cmp al,32
	jz LB_53137
LB_53139:
	push r10
	call NS_E_49872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_53140
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_53141
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_53141:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_53142
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_53142:
	jmp LB_53122
LB_53140:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_53145
LB_53144:
	add r14,1
LB_53145:
	cmp r14,r10
	jge LB_53146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53144
	cmp al,10
	jz LB_53144
	cmp al,32
	jz LB_53144
LB_53146:
	push r10
	call NS_E_49879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_53147
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_53148
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_53148:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_53149
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_53149:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_53150
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_53150:
	jmp LB_53122
LB_53147:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_53129
	btr r12,3
	jmp LB_53130
LB_53129:
	bts r12,3
LB_53130:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_53127
	btr r12,2
	jmp LB_53128
LB_53127:
	bts r12,2
LB_53128:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_53125
	btr r12,1
	jmp LB_53126
LB_53125:
	bts r12,1
LB_53126:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_53123
	btr r12,0
	jmp LB_53124
LB_53123:
	bts r12,0
LB_53124:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_53118
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f47815 { %_50170 %_50169 %_50171 %_50172 } ⊢ %_50173 : %_50173
 ; {>  %_50169~0':_p47779 %_50172~3':(_opn)◂(_p47777) %_50171~2':_p47780 %_50170~1':(_opn)◂(_stg) }
; _f47815 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_50173 ⊢ %_50174 : %_50174
 ; {>  %_50173~°1◂{ 1' 0' 2' 3' }:_p47777 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_50174
 ; {>  %_50174~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p47777) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_53098
	btr r12,4
	jmp LB_53099
LB_53098:
	bts r12,4
LB_53099:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_53104
	btr r12,5
	jmp LB_53105
LB_53104:
	bts r12,5
LB_53105:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_53102
	btr QWORD [rdi],0
	jmp LB_53103
LB_53102:
	bts QWORD [rdi],0
LB_53103:
	mov r11,r13
	bt r12,0
	jc LB_53108
	btr r12,5
	jmp LB_53109
LB_53108:
	bts r12,5
LB_53109:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_53106
	btr QWORD [rdi],1
	jmp LB_53107
LB_53106:
	bts QWORD [rdi],1
LB_53107:
	mov r11,r8
	bt r12,2
	jc LB_53112
	btr r12,5
	jmp LB_53113
LB_53112:
	bts r12,5
LB_53113:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_53110
	btr QWORD [rdi],2
	jmp LB_53111
LB_53110:
	bts QWORD [rdi],2
LB_53111:
	mov r11,r10
	bt r12,4
	jc LB_53116
	btr r12,5
	jmp LB_53117
LB_53116:
	bts r12,5
LB_53117:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],r11
	bt r12,5
	jc LB_53114
	btr QWORD [rdi],3
	jmp LB_53115
LB_53114:
	bts QWORD [rdi],3
LB_53115:
	mov rsi,1
	bt r12,3
	jc LB_53100
	mov rsi,0
	bt r9,0
	jc LB_53100
	jmp LB_53101
LB_53100:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53101:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_53118:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_53120
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53119
LB_53120:
	add rsp,8
	ret
LB_53122:
	add rsp,64
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
LB_53121:
	add rsp,64
	pop r14
LB_53119:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; grm_ord
	jmp LB_53196
LB_53195:
	add r14,1
LB_53196:
	cmp r14,r10
	jge LB_53197
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53195
	cmp al,10
	jz LB_53195
	cmp al,32
	jz LB_53195
LB_53197:
	push r10
	call NS_E_49876_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_53198
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53184
LB_53198:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_53201
LB_53200:
	add r14,1
LB_53201:
	cmp r14,r10
	jge LB_53202
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53200
	cmp al,10
	jz LB_53200
	cmp al,32
	jz LB_53200
LB_53202:
	push r10
	call NS_E_49880_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_53203
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_53204
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_53204:
	jmp LB_53184
LB_53203:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_53207
LB_53206:
	add r14,1
LB_53207:
	cmp r14,r10
	jge LB_53208
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53206
	cmp al,10
	jz LB_53206
	cmp al,32
	jz LB_53206
LB_53208:
	push r10
	call NS_E_49872_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_53209
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_53210
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_53210:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_53211
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_53211:
	jmp LB_53184
LB_53209:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_53214
LB_53213:
	add r14,1
LB_53214:
	cmp r14,r10
	jge LB_53215
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53213
	cmp al,10
	jz LB_53213
	cmp al,32
	jz LB_53213
LB_53215:
	push r10
	call NS_E_49879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_53216
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_53217
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_53217:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_53218
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_53218:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_53219
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_53219:
	jmp LB_53184
LB_53216:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_53222
LB_53221:
	add r14,1
LB_53222:
	cmp r14,r10
	jge LB_53223
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53221
	cmp al,10
	jz LB_53221
	cmp al,32
	jz LB_53221
LB_53223:
	push r10
	call NS_E_49878_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_53224
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_53225
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_53225:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_53226
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_53226:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_53227
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_53227:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_53228
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_53228:
	jmp LB_53184
LB_53224:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_53193
	btr r12,4
	jmp LB_53194
LB_53193:
	bts r12,4
LB_53194:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_53191
	btr r12,3
	jmp LB_53192
LB_53191:
	bts r12,3
LB_53192:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_53189
	btr r12,2
	jmp LB_53190
LB_53189:
	bts r12,2
LB_53190:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_53187
	btr r12,1
	jmp LB_53188
LB_53187:
	bts r12,1
LB_53188:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_53185
	btr r12,0
	jmp LB_53186
LB_53185:
	bts r12,0
LB_53186:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_53181
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
; _f47814 { %_50176 %_50175 %_50177 %_50178 %_50179 } ⊢ %_50180 : %_50180
 ; {>  %_50176~1':(_opn)◂(_stg) %_50179~4':_p47777 %_50178~3':(_opn)◂(_p47777) %_50175~0':_p47779 %_50177~2':_p47780 }
; _f47814 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_50180 ⊢ %_50181 : %_50181
 ; {>  %_50180~°0◂{ 1' 0' 2' 3' 4' }:_p47777 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_50181
 ; {>  %_50181~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p47777) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_53157
	btr r12,5
	jmp LB_53158
LB_53157:
	bts r12,5
LB_53158:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_53163
	btr r12,6
	jmp LB_53164
LB_53163:
	bts r12,6
LB_53164:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_53161
	btr QWORD [rdi],0
	jmp LB_53162
LB_53161:
	bts QWORD [rdi],0
LB_53162:
	mov rcx,r13
	bt r12,0
	jc LB_53167
	btr r12,6
	jmp LB_53168
LB_53167:
	bts r12,6
LB_53168:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_53165
	btr QWORD [rdi],1
	jmp LB_53166
LB_53165:
	bts QWORD [rdi],1
LB_53166:
	mov rcx,r8
	bt r12,2
	jc LB_53171
	btr r12,6
	jmp LB_53172
LB_53171:
	bts r12,6
LB_53172:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_53169
	btr QWORD [rdi],2
	jmp LB_53170
LB_53169:
	bts QWORD [rdi],2
LB_53170:
	mov rcx,r11
	bt r12,5
	jc LB_53175
	btr r12,6
	jmp LB_53176
LB_53175:
	bts r12,6
LB_53176:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_53173
	btr QWORD [rdi],3
	jmp LB_53174
LB_53173:
	bts QWORD [rdi],3
LB_53174:
	mov rcx,r10
	bt r12,4
	jc LB_53179
	btr r12,6
	jmp LB_53180
LB_53179:
	bts r12,6
LB_53180:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_53177
	btr QWORD [rdi],4
	jmp LB_53178
LB_53177:
	bts QWORD [rdi],4
LB_53178:
	mov rsi,1
	bt r12,3
	jc LB_53159
	mov rsi,0
	bt r9,0
	jc LB_53159
	jmp LB_53160
LB_53159:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53160:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_53181:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_53183
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53182
LB_53183:
	add rsp,8
	ret
LB_53184:
	add rsp,80
	pop r14
LB_53182:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49879:
NS_E_RDI_49879:
NS_E_49879_ETR_TBL:
NS_E_49879_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_53243
LB_53242:
	add r14,1
LB_53243:
	cmp r14,r10
	jge LB_53244
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53242
	cmp al,10
	jz LB_53242
	cmp al,32
	jz LB_53242
LB_53244:
	add r14,1
	cmp r14,r10
	jg LB_53247
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_53247
	jmp LB_53248
LB_53247:
	jmp LB_53237
LB_53248:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_53250
LB_53249:
	add r14,1
LB_53250:
	cmp r14,r10
	jge LB_53251
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53249
	cmp al,10
	jz LB_53249
	cmp al,32
	jz LB_53249
LB_53251:
	push r10
	call NS_E_49878_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_53252
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_53253
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_53253:
	jmp LB_53237
LB_53252:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_53240
	btr r12,1
	jmp LB_53241
LB_53240:
	bts r12,1
LB_53241:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_53238
	btr r12,0
	jmp LB_53239
LB_53238:
	bts r12,0
LB_53239:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_53234
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_53255
	btr r12,2
	jmp LB_53256
LB_53255:
	bts r12,2
LB_53256:
	mov r13,r14
	bt r12,1
	jc LB_53257
	btr r12,0
	jmp LB_53258
LB_53257:
	bts r12,0
LB_53258:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_50182 ⊢ %_50183 : %_50183
 ; {>  %_50182~0':_p47777 }
; _some 0' ⊢ °0◂0'
; _some %_50183 ⊢ %_50184 : %_50184
 ; {>  %_50183~°0◂0':(_opn)◂(_p47777) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_50184
 ; {>  %_50184~°0◂°0◂0':(_opn)◂((_opn)◂(_p47777)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_53232
	btr r12,3
	jmp LB_53233
LB_53232:
	bts r12,3
LB_53233:
	mov rsi,1
	bt r12,3
	jc LB_53230
	mov rsi,0
	bt r9,0
	jc LB_53230
	jmp LB_53231
LB_53230:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53231:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_53234:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_53236
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53235
LB_53236:
	add rsp,8
	ret
LB_53237:
	add rsp,32
	pop r14
LB_53235:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_53261
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_50185 : %_50185
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_50185 ⊢ %_50186 : %_50186
 ; {>  %_50185~°1◂{  }:(_opn)◂(t17004'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_50186
 ; {>  %_50186~°0◂°1◂{  }:(_opn)◂((_opn)◂(t17007'(0))) }
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
	jc LB_53259
	mov rsi,0
	bt r9,0
	jc LB_53259
	jmp LB_53260
LB_53259:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53260:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_53261:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_53263
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53262
LB_53263:
	add rsp,8
	ret
LB_53264:
	add rsp,0
	pop r14
LB_53262:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_49880:
NS_E_RDI_49880:
NS_E_49880_ETR_TBL:
NS_E_49880_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_53278
LB_53277:
	add r14,1
LB_53278:
	cmp r14,r10
	jge LB_53279
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53277
	cmp al,10
	jz LB_53277
	cmp al,32
	jz LB_53277
LB_53279:
	push r10
	call NS_E_47579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_53280
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53272
LB_53280:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_53283
LB_53282:
	add r14,1
LB_53283:
	cmp r14,r10
	jge LB_53284
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_53282
	cmp al,10
	jz LB_53282
	cmp al,32
	jz LB_53282
LB_53284:
	add r14,1
	cmp r14,r10
	jg LB_53288
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_53288
	jmp LB_53289
LB_53288:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_53286
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_53286:
	jmp LB_53272
LB_53289:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_53275
	btr r12,1
	jmp LB_53276
LB_53275:
	bts r12,1
LB_53276:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_53273
	btr r12,0
	jmp LB_53274
LB_53273:
	bts r12,0
LB_53274:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_53269
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_50187 ⊢ %_50188 : %_50188
 ; {>  %_50187~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_50188 ⊢ %_50189 : %_50189
 ; {>  %_50188~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_50189
 ; {>  %_50189~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_53267
	btr r12,3
	jmp LB_53268
LB_53267:
	bts r12,3
LB_53268:
	mov rsi,1
	bt r12,3
	jc LB_53265
	mov rsi,0
	bt r9,0
	jc LB_53265
	jmp LB_53266
LB_53265:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53266:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_53269:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_53271
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53270
LB_53271:
	add rsp,8
	ret
LB_53272:
	add rsp,32
	pop r14
LB_53270:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_53292
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_50190 : %_50190
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_50190 ⊢ %_50191 : %_50191
 ; {>  %_50190~°1◂{  }:(_opn)◂(t17016'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_50191
 ; {>  %_50191~°0◂°1◂{  }:(_opn)◂((_opn)◂(t17019'(0))) }
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
	jc LB_53290
	mov rsi,0
	bt r9,0
	jc LB_53290
	jmp LB_53291
LB_53290:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53291:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_53292:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_53294
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_53293
LB_53294:
	add rsp,8
	ret
LB_53295:
	add rsp,0
	pop r14
LB_53293:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_53344:
NS_E_RDI_53344:
; » _^ ..
	mov rax,104
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 m0 \n"
	mov rsi,0x_20_30_6d_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; " \194\167\194\167 m1 = m2 \n"
	mov rsi,0x_31_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_6d
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_32
	mov BYTE [rdi+8*1+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+6],sil
	add rdi,15
; " \194\167 f0 = f1 \n"
	mov rsi,0x_3d_20_30_66_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_31
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+4],sil
	add rdi,13
; " \194\167\194\167 m3 \n"
	mov rsi,0x_33_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \226\136\142\226\136\142 \n"
	mov rsi,0x_20_8e_88_e2_8e_88_e2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; "\226\136\142\226\136\142\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\194\167\194\167 In0 \n"
	mov rsi,0x_30_6e_49_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \194\167 C1 \194\171 \n"
	mov rsi,0x_c2_20_31_43_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_ab
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; "\t\t\226\136\142 {} \n"
	mov rsi,0x_7d_7b_20_8e_88_e2_09_09
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "\226\136\142\226\136\142 \t\t\n"
	mov rsi,0x_09_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_53297 : %_53297
 ; {>  %_53296~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_53297
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f15 |~ {  } ⊢ %_53298 : %_53298
 ; {>  %_53297~1':_r64 %_53296~0':_stg }
; 	» _args _ ⊢ 2' : %_53298
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,[args]
	clc
	call dcp
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	mov r8,rax
	btr r12,2
MTC_LB_53345:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_53346
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
	jnc LB_53347
	bt QWORD [rax],0
	jc LB_53348
	btr r12,5
	jmp LB_53349
LB_53348:
	bts r12,5
LB_53349:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_53347:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_53352
	btr r12,6
	jmp LB_53353
LB_53352:
	bts r12,6
LB_53353:
	mov r9,rcx
	bt r12,6
	jc LB_53350
	btr r12,3
	jmp LB_53351
LB_53350:
	bts r12,3
LB_53351:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_53356
	btr r12,6
	jmp LB_53357
LB_53356:
	bts r12,6
LB_53357:
	mov r10,rcx
	bt r12,6
	jc LB_53354
	btr r12,4
	jmp LB_53355
LB_53354:
	bts r12,4
LB_53355:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_53346
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
	jnc LB_53358
	bt QWORD [rax],0
	jc LB_53359
	btr r12,7
	jmp LB_53360
LB_53359:
	bts r12,7
LB_53360:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_53358:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_53363
	btr r12,8
	jmp LB_53364
LB_53363:
	bts r12,8
LB_53364:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_53361
	btr r12,5
	jmp LB_53362
LB_53361:
	bts r12,5
LB_53362:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_53367
	btr r12,8
	jmp LB_53368
LB_53367:
	bts r12,8
LB_53368:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_53365
	btr r12,6
	jmp LB_53366
LB_53365:
	bts r12,6
LB_53366:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_53346
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °1◂{  }
; 6' ⊢ °1◂{  }
	btr r12,7
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,rcx
	bt QWORD [rax],17
	jnc LB_53369
	bt QWORD [rax],0
	jc LB_53370
	btr r12,7
	jmp LB_53371
LB_53370:
	bts r12,7
LB_53371:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_53369:
	mov rdx,rax
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_53372:
	cmp r15,0
	jz LB_53373
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_53372
LB_53373:
; _f25 %_53301 ⊢ { %_53303 %_53304 } : { %_53303 %_53304 }
 ; {>  %_53301~5':_stg %_53297~1':_r64 %_53299~3':_stg %_53296~0':_stg }
; _f25 5' ⊢ { 2' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_53380
	btr r12,0
	jmp LB_53381
LB_53380:
	bts r12,0
LB_53381:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_53382
	btr r12,2
	jmp LB_53383
LB_53382:
	bts r12,2
LB_53383:
	mov r10,r14
	bt r12,1
	jc LB_53384
	btr r12,4
	jmp LB_53385
LB_53384:
	bts r12,4
LB_53385:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_53378
	btr r12,3
	jmp LB_53379
LB_53378:
	bts r12,3
LB_53379:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53376
	btr r12,1
	jmp LB_53377
LB_53376:
	bts r12,1
LB_53377:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53374
	btr r12,0
	jmp LB_53375
LB_53374:
	bts r12,0
LB_53375:
	add rsp,32
; _f48773 %_53304 ⊢ { %_53305 %_53306 } : { %_53305 %_53306 }
 ; {>  %_53303~2':_stg %_53297~1':_r64 %_53304~4':_stg %_53299~3':_stg %_53296~0':_stg }
; _f48773 4' ⊢ { 4' 5' }
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
	jc LB_53394
	btr r12,0
	jmp LB_53395
LB_53394:
	bts r12,0
LB_53395:
	call NS_E_48773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_53396
	btr r12,4
	jmp LB_53397
LB_53396:
	bts r12,4
LB_53397:
	mov r11,r14
	bt r12,1
	jc LB_53398
	btr r12,5
	jmp LB_53399
LB_53398:
	bts r12,5
LB_53399:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53392
	btr r12,3
	jmp LB_53393
LB_53392:
	bts r12,3
LB_53393:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53390
	btr r12,2
	jmp LB_53391
LB_53390:
	bts r12,2
LB_53391:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53388
	btr r12,1
	jmp LB_53389
LB_53388:
	bts r12,1
LB_53389:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53386
	btr r12,0
	jmp LB_53387
LB_53386:
	bts r12,0
LB_53387:
	add rsp,40
MTC_LB_53400:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_53401
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °0◂6'
; 5' ⊢ °0◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_53402
	bt QWORD [rax],0
	jc LB_53403
	btr r12,7
	jmp LB_53404
LB_53403:
	bts r12,7
LB_53404:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_53402:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_53405
	btr r12,6
	jmp LB_53406
LB_53405:
	bts r12,6
LB_53406:
LB_53407:
	cmp r15,0
	jz LB_53408
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_53407
LB_53408:
; » 0xr0 |~ {  } ⊢ %_53308 : %_53308
 ; {>  %_53305~4':_stg %_53303~2':_stg %_53307~6':_stg %_53297~1':_r64 %_53299~3':_stg %_53296~0':_stg }
; 	» 0xr0 _ ⊢ 5' : %_53308
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f49839 { %_53307 %_53308 } ⊢ { %_53309 %_53310 %_53311 } : { %_53309 %_53310 %_53311 }
 ; {>  %_53305~4':_stg %_53308~5':_r64 %_53303~2':_stg %_53307~6':_stg %_53297~1':_r64 %_53299~3':_stg %_53296~0':_stg }
; _f49839 { 6' 5' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000110.. |},{ 6' 5' } ⊢ { 0' 1' }
	mov r13,rcx
	bt r12,6
	jc LB_53419
	btr r12,0
	jmp LB_53420
LB_53419:
	bts r12,0
LB_53420:
	mov r14,r11
	bt r12,5
	jc LB_53421
	btr r12,1
	jmp LB_53422
LB_53421:
	bts r12,1
LB_53422:
	call NS_E_49839
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_53423
	btr r12,5
	jmp LB_53424
LB_53423:
	bts r12,5
LB_53424:
	mov rcx,r14
	bt r12,1
	jc LB_53425
	btr r12,6
	jmp LB_53426
LB_53425:
	bts r12,6
LB_53426:
	mov rdx,r9
	bt r12,3
	jc LB_53429
	btr r12,7
	jmp LB_53430
LB_53429:
	bts r12,7
LB_53430:
	mov rsi,1
	bt r12,7
	jc LB_53427
	mov rsi,0
	bt rdx,0
	jc LB_53427
	jmp LB_53428
LB_53427:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_53428:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_53417
	btr r12,4
	jmp LB_53418
LB_53417:
	bts r12,4
LB_53418:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53415
	btr r12,3
	jmp LB_53416
LB_53415:
	bts r12,3
LB_53416:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53413
	btr r12,2
	jmp LB_53414
LB_53413:
	bts r12,2
LB_53414:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53411
	btr r12,1
	jmp LB_53412
LB_53411:
	bts r12,1
LB_53412:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53409
	btr r12,0
	jmp LB_53410
LB_53409:
	bts r12,0
LB_53410:
	add rsp,48
; _f26 { %_53309 %_53310 %_53311 } ⊢ { %_53312 %_53313 %_53314 } : { %_53312 %_53313 %_53314 }
 ; {>  %_53305~4':_stg %_53309~5':_stg %_53303~2':_stg %_53310~6':_r64 %_53297~1':_r64 %_53311~7':(_opn)◂((_lst)◂(_p47772)) %_53299~3':_stg %_53296~0':_stg }
; _f26 { 5' 6' 7' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000001110.. |},{ 5' 6' 7' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_53443
	btr r12,1
	jmp LB_53444
LB_53443:
	bts r12,1
LB_53444:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_53441
	btr QWORD [rdi],0
	jmp LB_53442
LB_53441:
	bts QWORD [rdi],0
LB_53442:
	mov r14,rcx
	bt r12,6
	jc LB_53447
	btr r12,1
	jmp LB_53448
LB_53447:
	bts r12,1
LB_53448:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_53445
	btr QWORD [rdi],1
	jmp LB_53446
LB_53445:
	bts QWORD [rdi],1
LB_53446:
	mov r14,rdx
	bt r12,7
	jc LB_53451
	btr r12,1
	jmp LB_53452
LB_53451:
	bts r12,1
LB_53452:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_53449
	btr QWORD [rdi],2
	jmp LB_53450
LB_53449:
	bts QWORD [rdi],2
LB_53450:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 5' 6' 7' }
; 0' ⊢ { 5' 6' 7' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_53455
	btr r12,1
	jmp LB_53456
LB_53455:
	bts r12,1
LB_53456:
	mov r11,r14
	bt r12,1
	jc LB_53453
	btr r12,5
	jmp LB_53454
LB_53453:
	bts r12,5
LB_53454:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_53459
	btr r12,1
	jmp LB_53460
LB_53459:
	bts r12,1
LB_53460:
	mov rcx,r14
	bt r12,1
	jc LB_53457
	btr r12,6
	jmp LB_53458
LB_53457:
	bts r12,6
LB_53458:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_53463
	btr r12,1
	jmp LB_53464
LB_53463:
	bts r12,1
LB_53464:
	mov rdx,r14
	bt r12,1
	jc LB_53461
	btr r12,7
	jmp LB_53462
LB_53461:
	bts r12,7
LB_53462:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_53439
	btr r12,4
	jmp LB_53440
LB_53439:
	bts r12,4
LB_53440:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53437
	btr r12,3
	jmp LB_53438
LB_53437:
	bts r12,3
LB_53438:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53435
	btr r12,2
	jmp LB_53436
LB_53435:
	bts r12,2
LB_53436:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53433
	btr r12,1
	jmp LB_53434
LB_53433:
	bts r12,1
LB_53434:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53431
	btr r12,0
	jmp LB_53432
LB_53431:
	bts r12,0
LB_53432:
	add rsp,48
MTC_LB_53465:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_53466
; _emt_mov_ptn_to_ptn:{| 111111110.. |},7' ⊢ °0◂8'
; 7' ⊢ °0◂8'
	btr r12,9
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,rdx
	bt QWORD [rax],17
	jnc LB_53467
	bt QWORD [rax],0
	jc LB_53468
	btr r12,9
	jmp LB_53469
LB_53468:
	bts r12,9
LB_53469:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_53467:
	mov QWORD [st_vct+8*9],rax
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_53470
	btr r12,8
	jmp LB_53471
LB_53470:
	bts r12,8
LB_53471:
LB_53472:
	cmp r15,0
	jz LB_53473
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_53472
LB_53473:
; _f47879 %_53315 ⊢ %_53316 : %_53316
 ; {>  %_53305~4':_stg %_53315~8':(_lst)◂(_p47772) %_53313~6':_r64 %_53303~2':_stg %_53297~1':_r64 %_53312~5':_stg %_53299~3':_stg %_53296~0':_stg }
; _f47879 8' ⊢ 7'
; push_iv 
	sub rsp,64
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_53488
	btr r12,0
	jmp LB_53489
LB_53488:
	bts r12,0
LB_53489:
	call NS_E_47879
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 7'
	mov rdx,r13
	bt r12,0
	jc LB_53490
	btr r12,7
	jmp LB_53491
LB_53490:
	bts r12,7
LB_53491:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_53486
	btr r12,6
	jmp LB_53487
LB_53486:
	bts r12,6
LB_53487:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_53484
	btr r12,5
	jmp LB_53485
LB_53484:
	bts r12,5
LB_53485:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_53482
	btr r12,4
	jmp LB_53483
LB_53482:
	bts r12,4
LB_53483:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53480
	btr r12,3
	jmp LB_53481
LB_53480:
	bts r12,3
LB_53481:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53478
	btr r12,2
	jmp LB_53479
LB_53478:
	bts r12,2
LB_53479:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53476
	btr r12,1
	jmp LB_53477
LB_53476:
	bts r12,1
LB_53477:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53474
	btr r12,0
	jmp LB_53475
LB_53474:
	bts r12,0
LB_53475:
	add rsp,64
; » _^ ..
	mov rax,10
	mov rdi,0
	mov rsi,0
	mov rdi,rdx
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "START\n"
	mov rsi,0x_53
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_41
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_52
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; 0'
	push rcx
	mov rsi,rdx
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "END\n"
	mov rsi,0x_45
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_4e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_44
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; //
	mov QWORD [st_vct+8*8],rax
	btr r12,8
; _f26 %_53318 ⊢ %_53319 : %_53319
 ; {>  %_53305~4':_stg %_53313~6':_r64 %_53318~8':_stg %_53303~2':_stg %_53297~1':_r64 %_53312~5':_stg %_53299~3':_stg %_53317~7':_stg %_53296~0':_stg }
; _f26 8' ⊢ 8'
; push_iv 
	sub rsp,72
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_53508
	btr r12,0
	jmp LB_53509
LB_53508:
	bts r12,0
LB_53509:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_53510
	btr r12,8
	jmp LB_53511
LB_53510:
	bts r12,8
LB_53511:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_53506
	btr r12,7
	jmp LB_53507
LB_53506:
	bts r12,7
LB_53507:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_53504
	btr r12,6
	jmp LB_53505
LB_53504:
	bts r12,6
LB_53505:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_53502
	btr r12,5
	jmp LB_53503
LB_53502:
	bts r12,5
LB_53503:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_53500
	btr r12,4
	jmp LB_53501
LB_53500:
	bts r12,4
LB_53501:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53498
	btr r12,3
	jmp LB_53499
LB_53498:
	bts r12,3
LB_53499:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53496
	btr r12,2
	jmp LB_53497
LB_53496:
	bts r12,2
LB_53497:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53494
	btr r12,1
	jmp LB_53495
LB_53494:
	bts r12,1
LB_53495:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53492
	btr r12,0
	jmp LB_53493
LB_53492:
	bts r12,0
LB_53493:
	add rsp,72
; 	» "H2\n" _ ⊢ 9' : %_53320
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_32_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*9],rdi
	btr r12,9
; _f26 %_53320 ⊢ %_53321 : %_53321
 ; {>  %_53305~4':_stg %_53319~8':_stg %_53313~6':_r64 %_53320~9':_stg %_53303~2':_stg %_53297~1':_r64 %_53312~5':_stg %_53299~3':_stg %_53317~7':_stg %_53296~0':_stg }
; _f26 9' ⊢ 9'
; push_iv 
	sub rsp,80
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rsp+8+8*8],rdi
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000000010.. |},9' ⊢ 0'
	mov r13,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_53530
	btr r12,0
	jmp LB_53531
LB_53530:
	bts r12,0
LB_53531:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_53532
	btr r12,9
	jmp LB_53533
LB_53532:
	bts r12,9
LB_53533:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdi,QWORD [rsp+8+8*8]
	mov QWORD [st_vct+8*8],rdi
	bt rax,8
	jc LB_53528
	btr r12,8
	jmp LB_53529
LB_53528:
	bts r12,8
LB_53529:
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_53526
	btr r12,7
	jmp LB_53527
LB_53526:
	bts r12,7
LB_53527:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_53524
	btr r12,6
	jmp LB_53525
LB_53524:
	bts r12,6
LB_53525:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_53522
	btr r12,5
	jmp LB_53523
LB_53522:
	bts r12,5
LB_53523:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_53520
	btr r12,4
	jmp LB_53521
LB_53520:
	bts r12,4
LB_53521:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53518
	btr r12,3
	jmp LB_53519
LB_53518:
	bts r12,3
LB_53519:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53516
	btr r12,2
	jmp LB_53517
LB_53516:
	bts r12,2
LB_53517:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53514
	btr r12,1
	jmp LB_53515
LB_53514:
	bts r12,1
LB_53515:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53512
	btr r12,0
	jmp LB_53513
LB_53512:
	bts r12,0
LB_53513:
	add rsp,80
; ∎ {  }
 ; {>  %_53305~4':_stg %_53319~8':_stg %_53313~6':_r64 %_53321~9':_stg %_53303~2':_stg %_53297~1':_r64 %_53312~5':_stg %_53299~3':_stg %_53317~7':_stg %_53296~0':_stg }
; 	∎ {  }
	bt r12,4
	jc LB_53534
	mov rdi,r10
	call dlt
LB_53534:
	bt r12,8
	jc LB_53535
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_53535:
	bt r12,6
	jc LB_53536
	mov rdi,rcx
	call dlt
LB_53536:
	bt r12,9
	jc LB_53537
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_53537:
	bt r12,2
	jc LB_53538
	mov rdi,r8
	call dlt
LB_53538:
	bt r12,1
	jc LB_53539
	mov rdi,r14
	call dlt
LB_53539:
	bt r12,5
	jc LB_53540
	mov rdi,r11
	call dlt
LB_53540:
	bt r12,3
	jc LB_53541
	mov rdi,r9
	call dlt
LB_53541:
	bt r12,7
	jc LB_53542
	mov rdi,rdx
	call dlt
LB_53542:
	bt r12,0
	jc LB_53543
	mov rdi,r13
	call dlt
LB_53543:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_53466:
	mov r15,0
LB_53545:
	cmp r15,0
	jz LB_53546
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_53545
LB_53546:
; 	» "H0\n" _ ⊢ 8' : %_53322
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f26 %_53322 ⊢ %_53323 : %_53323
 ; {>  %_53305~4':_stg %_53314~7':(_opn)◂((_lst)◂(_p47772)) %_53322~8':_stg %_53313~6':_r64 %_53303~2':_stg %_53297~1':_r64 %_53312~5':_stg %_53299~3':_stg %_53296~0':_stg }
; _f26 8' ⊢ 8'
; push_iv 
	sub rsp,72
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_53563
	btr r12,0
	jmp LB_53564
LB_53563:
	bts r12,0
LB_53564:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_53565
	btr r12,8
	jmp LB_53566
LB_53565:
	bts r12,8
LB_53566:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_53561
	btr r12,7
	jmp LB_53562
LB_53561:
	bts r12,7
LB_53562:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_53559
	btr r12,6
	jmp LB_53560
LB_53559:
	bts r12,6
LB_53560:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_53557
	btr r12,5
	jmp LB_53558
LB_53557:
	bts r12,5
LB_53558:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_53555
	btr r12,4
	jmp LB_53556
LB_53555:
	bts r12,4
LB_53556:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53553
	btr r12,3
	jmp LB_53554
LB_53553:
	bts r12,3
LB_53554:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53551
	btr r12,2
	jmp LB_53552
LB_53551:
	bts r12,2
LB_53552:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53549
	btr r12,1
	jmp LB_53550
LB_53549:
	bts r12,1
LB_53550:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53547
	btr r12,0
	jmp LB_53548
LB_53547:
	bts r12,0
LB_53548:
	add rsp,72
; ∎ {  }
 ; {>  %_53305~4':_stg %_53314~7':(_opn)◂((_lst)◂(_p47772)) %_53313~6':_r64 %_53303~2':_stg %_53297~1':_r64 %_53312~5':_stg %_53299~3':_stg %_53323~8':_stg %_53296~0':_stg }
; 	∎ {  }
	bt r12,4
	jc LB_53567
	mov rdi,r10
	call dlt
LB_53567:
	bt r12,7
	jc LB_53568
	mov rdi,rdx
	call dlt
LB_53568:
	bt r12,6
	jc LB_53569
	mov rdi,rcx
	call dlt
LB_53569:
	bt r12,2
	jc LB_53570
	mov rdi,r8
	call dlt
LB_53570:
	bt r12,1
	jc LB_53571
	mov rdi,r14
	call dlt
LB_53571:
	bt r12,5
	jc LB_53572
	mov rdi,r11
	call dlt
LB_53572:
	bt r12,3
	jc LB_53573
	mov rdi,r9
	call dlt
LB_53573:
	bt r12,8
	jc LB_53574
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_53574:
	bt r12,0
	jc LB_53575
	mov rdi,r13
	call dlt
LB_53575:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_53544:
MTC_LB_53401:
	mov r15,0
LB_53577:
	cmp r15,0
	jz LB_53578
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_53577
LB_53578:
; 	» "H1\n" _ ⊢ 6' : %_53324
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f26 %_53324 ⊢ %_53325 : %_53325
 ; {>  %_53305~4':_stg %_53324~6':_stg %_53306~5':(_opn)◂(_stg) %_53303~2':_stg %_53297~1':_r64 %_53299~3':_stg %_53296~0':_stg }
; _f26 6' ⊢ 6'
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
	jc LB_53591
	btr r12,0
	jmp LB_53592
LB_53591:
	bts r12,0
LB_53592:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_53593
	btr r12,6
	jmp LB_53594
LB_53593:
	bts r12,6
LB_53594:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_53589
	btr r12,5
	jmp LB_53590
LB_53589:
	bts r12,5
LB_53590:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_53587
	btr r12,4
	jmp LB_53588
LB_53587:
	bts r12,4
LB_53588:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53585
	btr r12,3
	jmp LB_53586
LB_53585:
	bts r12,3
LB_53586:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53583
	btr r12,2
	jmp LB_53584
LB_53583:
	bts r12,2
LB_53584:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53581
	btr r12,1
	jmp LB_53582
LB_53581:
	bts r12,1
LB_53582:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53579
	btr r12,0
	jmp LB_53580
LB_53579:
	bts r12,0
LB_53580:
	add rsp,56
; ∎ {  }
 ; {>  %_53305~4':_stg %_53325~6':_stg %_53306~5':(_opn)◂(_stg) %_53303~2':_stg %_53297~1':_r64 %_53299~3':_stg %_53296~0':_stg }
; 	∎ {  }
	bt r12,4
	jc LB_53595
	mov rdi,r10
	call dlt
LB_53595:
	bt r12,6
	jc LB_53596
	mov rdi,rcx
	call dlt
LB_53596:
	bt r12,5
	jc LB_53597
	mov rdi,r11
	call dlt
LB_53597:
	bt r12,2
	jc LB_53598
	mov rdi,r8
	call dlt
LB_53598:
	bt r12,1
	jc LB_53599
	mov rdi,r14
	call dlt
LB_53599:
	bt r12,3
	jc LB_53600
	mov rdi,r9
	call dlt
LB_53600:
	bt r12,0
	jc LB_53601
	mov rdi,r13
	call dlt
LB_53601:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_53576:
MTC_LB_53346:
	mov r15,0
LB_53603:
	cmp r15,0
	jz LB_53604
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_53603
LB_53604:
; _f49839 { %_53296 %_53297 } ⊢ { %_53326 %_53327 %_53328 } : { %_53326 %_53327 %_53328 }
 ; {>  %_53298~2':(_lst)◂(_stg) %_53297~1':_r64 %_53296~0':_stg }
; _f49839 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_49839
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_53607
	btr r12,4
	jmp LB_53608
LB_53607:
	bts r12,4
LB_53608:
	mov r9,r10
	bt r12,4
	jc LB_53611
	btr r12,3
	jmp LB_53612
LB_53611:
	bts r12,3
LB_53612:
	mov rsi,1
	bt r12,3
	jc LB_53609
	mov rsi,0
	bt r9,0
	jc LB_53609
	jmp LB_53610
LB_53609:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_53610:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_53605
	btr r12,2
	jmp LB_53606
LB_53605:
	bts r12,2
LB_53606:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_53329
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f25 %_53329 ⊢ { %_53330 %_53331 } : { %_53330 %_53331 }
 ; {>  %_53329~4':_stg %_53327~1':_r64 %_53326~0':_stg %_53298~2':(_lst)◂(_stg) %_53328~3':(_opn)◂((_lst)◂(_p47772)) }
; _f25 4' ⊢ { 4' 5' }
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
	jc LB_53621
	btr r12,0
	jmp LB_53622
LB_53621:
	bts r12,0
LB_53622:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_53623
	btr r12,4
	jmp LB_53624
LB_53623:
	bts r12,4
LB_53624:
	mov r11,r14
	bt r12,1
	jc LB_53625
	btr r12,5
	jmp LB_53626
LB_53625:
	bts r12,5
LB_53626:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53619
	btr r12,3
	jmp LB_53620
LB_53619:
	bts r12,3
LB_53620:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53617
	btr r12,2
	jmp LB_53618
LB_53617:
	bts r12,2
LB_53618:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53615
	btr r12,1
	jmp LB_53616
LB_53615:
	bts r12,1
LB_53616:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53613
	btr r12,0
	jmp LB_53614
LB_53613:
	bts r12,0
LB_53614:
	add rsp,40
; _f26 { %_53330 %_53331 } ⊢ { %_53332 %_53333 } : { %_53332 %_53333 }
 ; {>  %_53327~1':_r64 %_53326~0':_stg %_53298~2':(_lst)◂(_stg) %_53331~5':_stg %_53330~4':_stg %_53328~3':(_opn)◂((_lst)◂(_p47772)) }
; _f26 { 4' 5' } ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000110.. |},{ 4' 5' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r10
	bt r12,4
	jc LB_53637
	btr r12,1
	jmp LB_53638
LB_53637:
	bts r12,1
LB_53638:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_53635
	btr QWORD [rdi],0
	jmp LB_53636
LB_53635:
	bts QWORD [rdi],0
LB_53636:
	mov r14,r11
	bt r12,5
	jc LB_53641
	btr r12,1
	jmp LB_53642
LB_53641:
	bts r12,1
LB_53642:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_53639
	btr QWORD [rdi],1
	jmp LB_53640
LB_53639:
	bts QWORD [rdi],1
LB_53640:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_53645
	btr r12,1
	jmp LB_53646
LB_53645:
	bts r12,1
LB_53646:
	mov r10,r14
	bt r12,1
	jc LB_53643
	btr r12,4
	jmp LB_53644
LB_53643:
	bts r12,4
LB_53644:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_53649
	btr r12,1
	jmp LB_53650
LB_53649:
	bts r12,1
LB_53650:
	mov r11,r14
	bt r12,1
	jc LB_53647
	btr r12,5
	jmp LB_53648
LB_53647:
	bts r12,5
LB_53648:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53633
	btr r12,3
	jmp LB_53634
LB_53633:
	bts r12,3
LB_53634:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53631
	btr r12,2
	jmp LB_53632
LB_53631:
	bts r12,2
LB_53632:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53629
	btr r12,1
	jmp LB_53630
LB_53629:
	bts r12,1
LB_53630:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53627
	btr r12,0
	jmp LB_53628
LB_53627:
	bts r12,0
LB_53628:
	add rsp,40
; _f48773 %_53333 ⊢ { %_53334 %_53335 } : { %_53334 %_53335 }
 ; {>  %_53332~4':_stg %_53333~5':_stg %_53327~1':_r64 %_53326~0':_stg %_53298~2':(_lst)◂(_stg) %_53328~3':(_opn)◂((_lst)◂(_p47772)) }
; _f48773 5' ⊢ { 5' 6' }
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
	jc LB_53661
	btr r12,0
	jmp LB_53662
LB_53661:
	bts r12,0
LB_53662:
	call NS_E_48773
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_53663
	btr r12,5
	jmp LB_53664
LB_53663:
	bts r12,5
LB_53664:
	mov rcx,r14
	bt r12,1
	jc LB_53665
	btr r12,6
	jmp LB_53666
LB_53665:
	bts r12,6
LB_53666:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_53659
	btr r12,4
	jmp LB_53660
LB_53659:
	bts r12,4
LB_53660:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53657
	btr r12,3
	jmp LB_53658
LB_53657:
	bts r12,3
LB_53658:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53655
	btr r12,2
	jmp LB_53656
LB_53655:
	bts r12,2
LB_53656:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53653
	btr r12,1
	jmp LB_53654
LB_53653:
	bts r12,1
LB_53654:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53651
	btr r12,0
	jmp LB_53652
LB_53651:
	bts r12,0
LB_53652:
	add rsp,48
MTC_LB_53667:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_53668
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °0◂7'
; 6' ⊢ °0◂7'
	btr r12,8
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,rcx
	bt QWORD [rax],17
	jnc LB_53669
	bt QWORD [rax],0
	jc LB_53670
	btr r12,8
	jmp LB_53671
LB_53670:
	bts r12,8
LB_53671:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_53669:
	mov QWORD [st_vct+8*8],rax
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_53672
	btr r12,7
	jmp LB_53673
LB_53672:
	bts r12,7
LB_53673:
LB_53674:
	cmp r15,0
	jz LB_53675
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_53674
LB_53675:
; » 0xr0 |~ {  } ⊢ %_53337 : %_53337
 ; {>  %_53332~4':_stg %_53327~1':_r64 %_53326~0':_stg %_53336~7':_stg %_53334~5':_stg %_53298~2':(_lst)◂(_stg) %_53328~3':(_opn)◂((_lst)◂(_p47772)) }
; 	» 0xr0 _ ⊢ 6' : %_53337
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f49839 { %_53336 %_53337 } ⊢ { %_53338 %_53339 %_53340 } : { %_53338 %_53339 %_53340 }
 ; {>  %_53332~4':_stg %_53337~6':_r64 %_53327~1':_r64 %_53326~0':_stg %_53336~7':_stg %_53334~5':_stg %_53298~2':(_lst)◂(_stg) %_53328~3':(_opn)◂((_lst)◂(_p47772)) }
; _f49839 { 7' 6' } ⊢ { 6' 7' 8' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000000110.. |},{ 7' 6' } ⊢ { 0' 1' }
	mov r13,rdx
	bt r12,7
	jc LB_53688
	btr r12,0
	jmp LB_53689
LB_53688:
	bts r12,0
LB_53689:
	mov r14,rcx
	bt r12,6
	jc LB_53690
	btr r12,1
	jmp LB_53691
LB_53690:
	bts r12,1
LB_53691:
	call NS_E_49839
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_53692
	btr r12,6
	jmp LB_53693
LB_53692:
	bts r12,6
LB_53693:
	mov rdx,r14
	bt r12,1
	jc LB_53694
	btr r12,7
	jmp LB_53695
LB_53694:
	bts r12,7
LB_53695:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_53698
	btr r12,8
	jmp LB_53699
LB_53698:
	bts r12,8
LB_53699:
	mov rsi,1
	bt r12,8
	jc LB_53696
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_53696
	jmp LB_53697
LB_53696:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_53697:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_53686
	btr r12,5
	jmp LB_53687
LB_53686:
	bts r12,5
LB_53687:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_53684
	btr r12,4
	jmp LB_53685
LB_53684:
	bts r12,4
LB_53685:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53682
	btr r12,3
	jmp LB_53683
LB_53682:
	bts r12,3
LB_53683:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53680
	btr r12,2
	jmp LB_53681
LB_53680:
	bts r12,2
LB_53681:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53678
	btr r12,1
	jmp LB_53679
LB_53678:
	bts r12,1
LB_53679:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53676
	btr r12,0
	jmp LB_53677
LB_53676:
	bts r12,0
LB_53677:
	add rsp,56
; _f26 { %_53338 %_53339 %_53340 } ⊢ { %_53341 %_53342 %_53343 } : { %_53341 %_53342 %_53343 }
 ; {>  %_53332~4':_stg %_53339~7':_r64 %_53338~6':_stg %_53327~1':_r64 %_53326~0':_stg %_53334~5':_stg %_53298~2':(_lst)◂(_stg) %_53340~8':(_opn)◂((_lst)◂(_p47772)) %_53328~3':(_opn)◂((_lst)◂(_p47772)) }
; _f26 { 6' 7' 8' } ⊢ { 6' 7' 8' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000001110.. |},{ 6' 7' 8' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,rcx
	bt r12,6
	jc LB_53714
	btr r12,1
	jmp LB_53715
LB_53714:
	bts r12,1
LB_53715:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_53712
	btr QWORD [rdi],0
	jmp LB_53713
LB_53712:
	bts QWORD [rdi],0
LB_53713:
	mov r14,rdx
	bt r12,7
	jc LB_53718
	btr r12,1
	jmp LB_53719
LB_53718:
	bts r12,1
LB_53719:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_53716
	btr QWORD [rdi],1
	jmp LB_53717
LB_53716:
	bts QWORD [rdi],1
LB_53717:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_53722
	btr r12,1
	jmp LB_53723
LB_53722:
	bts r12,1
LB_53723:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_53720
	btr QWORD [rdi],2
	jmp LB_53721
LB_53720:
	bts QWORD [rdi],2
LB_53721:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_53726
	btr r12,1
	jmp LB_53727
LB_53726:
	bts r12,1
LB_53727:
	mov rcx,r14
	bt r12,1
	jc LB_53724
	btr r12,6
	jmp LB_53725
LB_53724:
	bts r12,6
LB_53725:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_53730
	btr r12,1
	jmp LB_53731
LB_53730:
	bts r12,1
LB_53731:
	mov rdx,r14
	bt r12,1
	jc LB_53728
	btr r12,7
	jmp LB_53729
LB_53728:
	bts r12,7
LB_53729:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_53734
	btr r12,1
	jmp LB_53735
LB_53734:
	bts r12,1
LB_53735:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_53732
	btr r12,8
	jmp LB_53733
LB_53732:
	bts r12,8
LB_53733:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_53710
	btr r12,5
	jmp LB_53711
LB_53710:
	bts r12,5
LB_53711:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_53708
	btr r12,4
	jmp LB_53709
LB_53708:
	bts r12,4
LB_53709:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_53706
	btr r12,3
	jmp LB_53707
LB_53706:
	bts r12,3
LB_53707:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_53704
	btr r12,2
	jmp LB_53705
LB_53704:
	bts r12,2
LB_53705:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_53702
	btr r12,1
	jmp LB_53703
LB_53702:
	bts r12,1
LB_53703:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_53700
	btr r12,0
	jmp LB_53701
LB_53700:
	bts r12,0
LB_53701:
	add rsp,56
; ∎ {  }
 ; {>  %_53332~4':_stg %_53341~6':_stg %_53327~1':_r64 %_53326~0':_stg %_53334~5':_stg %_53342~7':_r64 %_53343~8':(_opn)◂((_lst)◂(_p47772)) %_53298~2':(_lst)◂(_stg) %_53328~3':(_opn)◂((_lst)◂(_p47772)) }
; 	∎ {  }
	bt r12,4
	jc LB_53736
	mov rdi,r10
	call dlt
LB_53736:
	bt r12,6
	jc LB_53737
	mov rdi,rcx
	call dlt
LB_53737:
	bt r12,1
	jc LB_53738
	mov rdi,r14
	call dlt
LB_53738:
	bt r12,0
	jc LB_53739
	mov rdi,r13
	call dlt
LB_53739:
	bt r12,5
	jc LB_53740
	mov rdi,r11
	call dlt
LB_53740:
	bt r12,7
	jc LB_53741
	mov rdi,rdx
	call dlt
LB_53741:
	bt r12,8
	jc LB_53742
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_53742:
	bt r12,2
	jc LB_53743
	mov rdi,r8
	call dlt
LB_53743:
	bt r12,3
	jc LB_53744
	mov rdi,r9
	call dlt
LB_53744:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_53668:
	mov r15,0
LB_53746:
	cmp r15,0
	jz LB_53747
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_53746
LB_53747:
; ∎ {  }
 ; {>  %_53332~4':_stg %_53327~1':_r64 %_53326~0':_stg %_53335~6':(_opn)◂(_stg) %_53334~5':_stg %_53298~2':(_lst)◂(_stg) %_53328~3':(_opn)◂((_lst)◂(_p47772)) }
; 	∎ {  }
	bt r12,4
	jc LB_53748
	mov rdi,r10
	call dlt
LB_53748:
	bt r12,1
	jc LB_53749
	mov rdi,r14
	call dlt
LB_53749:
	bt r12,0
	jc LB_53750
	mov rdi,r13
	call dlt
LB_53750:
	bt r12,6
	jc LB_53751
	mov rdi,rcx
	call dlt
LB_53751:
	bt r12,5
	jc LB_53752
	mov rdi,r11
	call dlt
LB_53752:
	bt r12,2
	jc LB_53753
	mov rdi,r8
	call dlt
LB_53753:
	bt r12,3
	jc LB_53754
	mov rdi,r9
	call dlt
LB_53754:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_53745:
MTC_LB_53602:
section .data
	NS_E_DYN_47088:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47088
	NS_E_DYN_47091:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47091
	NS_E_DYN_47092:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47092
	NS_E_DYN_47093:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47093
	NS_E_DYN_47094:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47094
	NS_E_DYN_47101:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47101
	NS_E_DYN_47140:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47140
	NS_E_DYN_47158:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47158
	NS_E_DYN_47201:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47201
	NS_E_DYN_47211:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47211
	NS_E_DYN_47212:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47212
	NS_E_DYN_47213:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47213
	NS_E_DYN_47431:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47431
	NS_E_DYN_47470:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47470
	NS_E_DYN_47509:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47509
	NS_E_DYN_47548:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47548
	NS_E_DYN_47579:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47579
	NS_E_DYN_47580:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47580
	NS_E_DYN_47581:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47581
	NS_E_DYN_47708:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47708
	NS_E_DYN_47767:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_47768:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_47770:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_47771:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_47850:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_47851:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_47852:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_47853:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_47854:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_47855:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_47856:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_47857:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_47858:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_47859:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_47860:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_47861:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_47862:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_47863:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_47864:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_47865:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_47866:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_47867:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_47868:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_47869:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_47907:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47907
	NS_E_DYN_47879:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47879
	NS_E_DYN_48046:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_48047:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_48048:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48048
	NS_E_DYN_48049:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48049
	NS_E_DYN_48050:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48050
	NS_E_DYN_48051:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48051
	NS_E_DYN_48672:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48672
	NS_E_DYN_48773:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48773
	CST_DYN_48835:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_48838:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48838
	NS_E_DYN_48905:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48905
	NS_E_DYN_48990:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_48991:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_48998:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48998
	NS_E_DYN_49034:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49034
	NS_E_DYN_49035:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49035
	NS_E_DYN_49036:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49036
	NS_E_DYN_49037:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49037
	NS_E_DYN_49298:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49298
	NS_E_DYN_49299:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49299
	NS_E_DYN_49302:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49302
	NS_E_DYN_49303:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49303
	NS_E_DYN_49568:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49568
	NS_E_DYN_49569:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49569
	NS_E_DYN_49570:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49570
	NS_E_DYN_49571:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49571
	NS_E_DYN_49572:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49572
	NS_E_DYN_49839:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49839
	NS_E_DYN_49840:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49840
	NS_E_DYN_49841:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49841
	NS_E_DYN_49842:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49842
	NS_E_DYN_49843:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49843
	NS_E_DYN_49844:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49844
	NS_E_DYN_49847:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49847
	NS_E_DYN_49848:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49848
	NS_E_DYN_49849:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49849
	NS_E_DYN_49852:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49852
	NS_E_DYN_49853:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49853
	NS_E_DYN_49854:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49854
	NS_E_DYN_49855:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49855
	NS_E_DYN_49856:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49856
	NS_E_DYN_49857:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49857
	NS_E_DYN_49858:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49858
	NS_E_DYN_49859:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49859
	NS_E_DYN_49860:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49860
	NS_E_DYN_49861:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49861
	NS_E_DYN_49862:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49862
	NS_E_DYN_49863:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49863
	NS_E_DYN_49864:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49864
	NS_E_DYN_49865:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49865
	NS_E_DYN_49870:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49870
	NS_E_DYN_49871:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49871
	NS_E_DYN_49872:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49872
	NS_E_DYN_49873:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49873
	NS_E_DYN_49874:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49874
	NS_E_DYN_49875:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49875
	NS_E_DYN_49876:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49876
	NS_E_DYN_49877:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49877
	NS_E_DYN_49878:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49878
	NS_E_DYN_49879:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49879
	NS_E_DYN_49880:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49880
	CST_DYN_53344:
		dq 0x0000_0001_00_82_ffff
		dq 1
