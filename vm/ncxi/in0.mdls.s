%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_3071
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
	push r14
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
	pop r14
	ret
NS_E_3055:
NS_E_RDI_3055:
NS_E_3055_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_3056
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_3056:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3058:
NS_E_RDI_3058:
NS_E_3058_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_3058_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_3058_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3059:
NS_E_RDI_3059:
NS_E_3059_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_3059_LB_0
	cmp r11,57
	ja NS_E_3059_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_3059_LB_0:
	mov rax,0
	ret
NS_E_3061:
NS_E_RDI_3061:
NS_E_3061_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_3061_LB_0
	cmp r11,122
	ja NS_E_3061_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_3061_LB_0:
	mov rax,0
	ret
NS_E_3060:
NS_E_RDI_3060:
NS_E_3060_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_3060_LB_0
	cmp r11,90
	ja NS_E_3060_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_3060_LB_0:
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
	jge err
	mov rax,[r9]
	lea r10,[r10-1+r13]
	shr rax,32
	cmp r10,rax
	jge err
	lea rsi,[r14+8+r8]
	lea rdi,[r9+8+r10]
	mov rcx,r13
	std
	rep movsb
	cld
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
	jge err
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
	jge err
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
NS_E_3057:
NS_E_RDI_3057:
NS_E_3057_ETR_TBL:
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
	jz NS_E_3057_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_3057_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3071:
NS_E_RDI_3071:
; 	» "-27686gg" _ ⊢ 0' : %_3062
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr6 |~ {  } ⊢ %_3063 : %_3063
 ; {>  %_3062~0':_stg }
; 	» 0xr6 _ ⊢ 1' : %_3063
	mov rdi,0x6
	mov r14,rdi
	bts r12,1
; » 0xr4 |~ {  } ⊢ %_3064 : %_3064
 ; {>  %_3062~0':_stg %_3063~1':_r64 }
; 	» 0xr4 _ ⊢ 2' : %_3064
	mov rdi,0x4
	mov r8,rdi
	bts r12,2
; » 0xr0 |~ {  } ⊢ %_3065 : %_3065
 ; {>  %_3064~2':_r64 %_3062~0':_stg %_3063~1':_r64 }
; 	» 0xr0 _ ⊢ 3' : %_3065
	mov rdi,0x0
	mov r9,rdi
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_3066 : %_3066
 ; {>  %_3065~3':_r64 %_3064~2':_r64 %_3062~0':_stg %_3063~1':_r64 }
; 	» 0xr0 _ ⊢ 4' : %_3066
	mov rdi,0x0
	mov r10,rdi
	bts r12,4
; _some { %_3064 %_3065 } ⊢ %_3067 : %_3067
 ; {>  %_3065~3':_r64 %_3066~4':_r64 %_3064~2':_r64 %_3062~0':_stg %_3063~1':_r64 }
; _some { 2' 3' } ⊢ °0◂{ 2' 3' }
; _f21 %_3067 ⊢ %_3068 : %_3068
 ; {>  %_3066~4':_r64 %_3062~0':_stg %_3063~1':_r64 %_3067~°0◂{ 2' 3' }:(_opn)◂({ _r64 _r64 }) }
; _f21 °0◂{ 2' 3' } ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00110.. |},°0◂{ 2' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r8
	bt r12,2
	jc LB_3082
	btr r12,1
	jmp LB_3083
LB_3082:
	bts r12,1
LB_3083:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3080
	btr QWORD [rdi],0
	jmp LB_3081
LB_3080:
	bts QWORD [rdi],0
LB_3081:
	mov r14,r9
	bt r12,3
	jc LB_3086
	btr r12,1
	jmp LB_3087
LB_3086:
	bts r12,1
LB_3087:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3084
	btr QWORD [rdi],1
	jmp LB_3085
LB_3084:
	bts QWORD [rdi],1
LB_3085:
	mov rsi,1
	bt r12,0
	jc LB_3078
	mov rsi,0
	bt r13,0
	jc LB_3078
	jmp LB_3079
LB_3078:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_3079:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_3088
	btr r12,2
	jmp LB_3089
LB_3088:
	bts r12,2
LB_3089:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3076
	btr r12,4
	jmp LB_3077
LB_3076:
	bts r12,4
LB_3077:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3074
	btr r12,1
	jmp LB_3075
LB_3074:
	bts r12,1
LB_3075:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3072
	btr r12,0
	jmp LB_3073
LB_3072:
	bts r12,0
LB_3073:
	add rsp,32
; _some %_3068 ⊢ %_3069 : %_3069
 ; {>  %_3068~2':(_opn)◂({ _r64 _r64 }) %_3066~4':_r64 %_3062~0':_stg %_3063~1':_r64 }
; _some 2' ⊢ °0◂2'
; _f21 %_3069 ⊢ %_3070 : %_3070
 ; {>  %_3069~°0◂2':(_opn)◂((_opn)◂({ _r64 _r64 })) %_3066~4':_r64 %_3062~0':_stg %_3063~1':_r64 }
; _f21 °0◂2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3098
	btr r12,0
	jmp LB_3099
LB_3098:
	bts r12,0
LB_3099:
	mov rsi,1
	bt r12,0
	jc LB_3096
	mov rsi,0
	bt r13,0
	jc LB_3096
	jmp LB_3097
LB_3096:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_3097:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_3100
	btr r12,2
	jmp LB_3101
LB_3100:
	bts r12,2
LB_3101:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3094
	btr r12,4
	jmp LB_3095
LB_3094:
	bts r12,4
LB_3095:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3092
	btr r12,1
	jmp LB_3093
LB_3092:
	bts r12,1
LB_3093:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3090
	btr r12,0
	jmp LB_3091
LB_3090:
	bts r12,0
LB_3091:
	add rsp,32
; ∎ {  }
 ; {>  %_3066~4':_r64 %_3062~0':_stg %_3063~1':_r64 %_3070~2':(_opn)◂((_opn)◂({ _r64 _r64 })) }
; 	∎ {  }
	bt r12,4
	jc LB_3102
	mov rdi,r10
	call dlt
LB_3102:
	bt r12,0
	jc LB_3103
	mov rdi,r13
	call dlt
LB_3103:
	bt r12,1
	jc LB_3104
	mov rdi,r14
	call dlt
LB_3104:
	bt r12,2
	jc LB_3105
	mov rdi,r8
	call dlt
LB_3105:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_3113:
; 	|» 0'
NS_E_RDI_3113:
MTC_LB_3114:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3115
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_3116
	bt QWORD [rax],0
	jc LB_3117
	btr r12,3
	jmp LB_3118
LB_3117:
	bts r12,3
LB_3118:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3116:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3121
	btr r12,4
	jmp LB_3122
LB_3121:
	bts r12,4
LB_3122:
	mov r14,r10
	bt r12,4
	jc LB_3119
	btr r12,1
	jmp LB_3120
LB_3119:
	bts r12,1
LB_3120:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3125
	btr r12,4
	jmp LB_3126
LB_3125:
	bts r12,4
LB_3126:
	mov r8,r10
	bt r12,4
	jc LB_3123
	btr r12,2
	jmp LB_3124
LB_3123:
	bts r12,2
LB_3124:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3115
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_3127
	bt QWORD [rax],0
	jc LB_3128
	btr r12,5
	jmp LB_3129
LB_3128:
	bts r12,5
LB_3129:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3127:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3132
	btr r12,6
	jmp LB_3133
LB_3132:
	bts r12,6
LB_3133:
	mov r9,rcx
	bt r12,6
	jc LB_3130
	btr r12,3
	jmp LB_3131
LB_3130:
	bts r12,3
LB_3131:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3136
	btr r12,6
	jmp LB_3137
LB_3136:
	bts r12,6
LB_3137:
	mov r10,rcx
	bt r12,6
	jc LB_3134
	btr r12,4
	jmp LB_3135
LB_3134:
	bts r12,4
LB_3135:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3138:
	cmp r15,0
	jz LB_3139
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3138
LB_3139:
; ∎ {  }
 ; {>  %_3110~4':(_lst)◂(t1060'(-1)) %_3107~1':t1060'(-1) %_3109~3':t1060'(-1) }
; 	∎ {  }
	bt r12,4
	jc LB_3140
	mov rdi,r10
	call dlt
LB_3140:
	bt r12,1
	jc LB_3141
	mov rdi,r14
	call dlt
LB_3141:
	bt r12,3
	jc LB_3142
	mov rdi,r9
	call dlt
LB_3142:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_3115:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3143
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_3144
	bt QWORD [rax],0
	jc LB_3145
	btr r12,3
	jmp LB_3146
LB_3145:
	bts r12,3
LB_3146:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3144:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3149
	btr r12,4
	jmp LB_3150
LB_3149:
	bts r12,4
LB_3150:
	mov r14,r10
	bt r12,4
	jc LB_3147
	btr r12,1
	jmp LB_3148
LB_3147:
	bts r12,1
LB_3148:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3153
	btr r12,4
	jmp LB_3154
LB_3153:
	bts r12,4
LB_3154:
	mov r8,r10
	bt r12,4
	jc LB_3151
	btr r12,2
	jmp LB_3152
LB_3151:
	bts r12,2
LB_3152:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3143
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_3155
	bt QWORD [rax],0
	jc LB_3156
	btr r12,3
	jmp LB_3157
LB_3156:
	bts r12,3
LB_3157:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3155:
	mov r9,rax
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3158:
	cmp r15,0
	jz LB_3159
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3158
LB_3159:
; ∎ {  }
 ; {>  %_3111~1':t1060'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_3160
	mov rdi,r14
	call dlt
LB_3160:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_3143:
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3161
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_3162
	bt QWORD [rax],0
	jc LB_3163
	btr r12,1
	jmp LB_3164
LB_3163:
	bts r12,1
LB_3164:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3162:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3165:
	cmp r15,0
	jz LB_3166
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3165
LB_3166:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_3161:
section .data
	NS_E_DYN_3055:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3055
	NS_E_DYN_3058:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3058
	NS_E_DYN_3059:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3059
	NS_E_DYN_3060:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3060
	NS_E_DYN_3061:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3061
	CST_DYN_3071:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_3113:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3113
