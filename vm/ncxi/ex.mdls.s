%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_3411
	call NS_E_3668
	call NS_E_3719
	call NS_E_3857
	call NS_E_3990
	call NS_E_4013
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
NS_E_3025:
NS_E_RDI_3025:
NS_E_3025_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_3026
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_3026:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3028:
NS_E_RDI_3028:
NS_E_3028_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_3028_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_3028_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3029:
NS_E_RDI_3029:
NS_E_3029_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_3029_LB_0
	cmp r11,57
	ja NS_E_3029_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_3029_LB_0:
	mov rax,0
	ret
NS_E_3031:
NS_E_RDI_3031:
NS_E_3031_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_3031_LB_0
	cmp r11,122
	ja NS_E_3031_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_3031_LB_0:
	mov rax,0
	ret
NS_E_3030:
NS_E_RDI_3030:
NS_E_3030_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_3030_LB_0
	cmp r11,90
	ja NS_E_3030_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_3030_LB_0:
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
NS_E_3027:
NS_E_RDI_3027:
NS_E_3027_ETR_TBL:
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
	jz NS_E_3027_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_3027_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3045:
; 	|» { 0' 1' }
NS_E_RDI_3045:
MTC_LB_3046:
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3047
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_3048
	bt QWORD [rax],0
	jc LB_3049
	btr r12,4
	jmp LB_3050
LB_3049:
	bts r12,4
LB_3050:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3048:
	mov r10,rax
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3053
	btr r12,5
	jmp LB_3054
LB_3053:
	bts r12,5
LB_3054:
	mov r8,r11
	bt r12,5
	jc LB_3051
	btr r12,2
	jmp LB_3052
LB_3051:
	bts r12,2
LB_3052:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3057
	btr r12,5
	jmp LB_3058
LB_3057:
	bts r12,5
LB_3058:
	mov r9,r11
	bt r12,5
	jc LB_3055
	btr r12,3
	jmp LB_3056
LB_3055:
	bts r12,3
LB_3056:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3059:
	cmp r15,0
	jz LB_3060
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3059
LB_3060:
; _f39 %_3032 ⊢ %_3036 : %_3036
 ; {>  %_3035~3':(_lst)◂(_r64) %_3034~2':_r64 %_3032~0':_r64 }
	add r13,1
; _f3045 { %_3036 %_3035 } ⊢ { %_3037 %_3038 } : { %_3037 %_3038 }
 ; {>  %_3035~3':(_lst)◂(_r64) %_3036~0':_r64 %_3034~2':_r64 }
; _f3045 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3063
	btr r12,1
	jmp LB_3064
LB_3063:
	bts r12,1
LB_3064:
	call NS_E_3045
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3061
	btr r12,2
	jmp LB_3062
LB_3061:
	bts r12,2
LB_3062:
	add rsp,16
; _f38 %_3037 ⊢ %_3039 : %_3039
 ; {>  %_3037~0':_r64 %_3038~1':_stg %_3034~2':_r64 }
	sub r13,1
; _f16 { %_3038 %_3039 %_3034 } ⊢ { %_3040 %_3041 %_3042 } : { %_3040 %_3041 %_3042 }
 ; {>  %_3039~0':_r64 %_3038~1':_stg %_3034~2':_r64 }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_3065
	btr r12,3
	jmp LB_3066
LB_3065:
	bts r12,3
LB_3066:
	mov r14,r13
	bt r12,0
	jc LB_3067
	btr r12,1
	jmp LB_3068
LB_3067:
	bts r12,1
LB_3068:
	mov r13,r9
	bt r12,3
	jc LB_3069
	btr r12,0
	jmp LB_3070
LB_3069:
	bts r12,0
LB_3070:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_3041 %_3040 }
 ; {>  %_3042~2':_r64 %_3040~0':_stg %_3041~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_3071
	mov rdi,r8
	call dlt
LB_3071:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_3072
	btr r12,2
	jmp LB_3073
LB_3072:
	bts r12,2
LB_3073:
	mov r14,r13
	bt r12,0
	jc LB_3074
	btr r12,1
	jmp LB_3075
LB_3074:
	bts r12,1
LB_3075:
	mov r13,r8
	bt r12,2
	jc LB_3076
	btr r12,0
	jmp LB_3077
LB_3076:
	bts r12,0
LB_3077:
	ret
MTC_LB_3047:
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3078
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_3079
	bt QWORD [rax],0
	jc LB_3080
	btr r12,2
	jmp LB_3081
LB_3080:
	bts r12,2
LB_3081:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3079:
	mov r8,rax
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3082:
	cmp r15,0
	jz LB_3083
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3082
LB_3083:
; _f14 %_3032 ⊢ { %_3043 %_3044 } : { %_3043 %_3044 }
 ; {>  %_3032~0':_r64 }
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
; ∎ { %_3043 %_3044 }
 ; {>  %_3043~0':_r64 %_3044~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3078:
NS_E_3088:
; 	|» 0'
NS_E_RDI_3088:
; » 0xr0 |~ {  } ⊢ %_3085 : %_3085
 ; {>  %_3084~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_3085
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f3045 { %_3085 %_3084 } ⊢ { %_3086 %_3087 } : { %_3086 %_3087 }
 ; {>  %_3084~0':(_lst)◂(_r64) %_3085~1':_r64 }
; _f3045 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_3089
	btr r12,2
	jmp LB_3090
LB_3089:
	bts r12,2
LB_3090:
	mov r14,r13
	bt r12,0
	jc LB_3091
	btr r12,1
	jmp LB_3092
LB_3091:
	bts r12,1
LB_3092:
	mov r13,r8
	bt r12,2
	jc LB_3093
	btr r12,0
	jmp LB_3094
LB_3093:
	bts r12,0
LB_3094:
	call NS_E_3045
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_3087
 ; {>  %_3086~0':_r64 %_3087~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_3095
	mov rdi,r13
	call dlt
LB_3095:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3096
	btr r12,0
	jmp LB_3097
LB_3096:
	bts r12,0
LB_3097:
	ret
NS_E_3098:
NS_E_RDI_3098:
NS_E_3098_ETR_TBL:
NS_E_3098_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_3025_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3134
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3098_MTC_0_failed
LB_3134:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3129
	btr r12,0
	jmp LB_3130
LB_3129:
	bts r12,0
LB_3130:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3126
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_3100 : %_3100
 ; {>  %_3099~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_3100
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_3101 : %_3101
 ; {>  %_3099~0':_r64 %_3100~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_3101
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f33 { %_3099 %_3100 } ⊢ { %_3102 %_3103 %_3104 } : { %_3102 %_3103 %_3104 }
 ; {>  %_3101~2':_r64 %_3099~0':_r64 %_3100~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_3101 %_3102 } ⊢ { %_3105 %_3106 %_3107 } : { %_3105 %_3106 %_3107 }
 ; {>  %_3103~1':_r64 %_3104~3':_r64 %_3102~0':_r64 %_3101~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_3110:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_3111
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_3111
LB_3112:
	cmp r15,0
	jz LB_3113
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3112
LB_3113:
; _some %_3106 ⊢ %_3108 : %_3108
 ; {>  %_3103~1':_r64 %_3105~2':_r64 %_3106~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3108
 ; {>  %_3108~°0◂0':(_opn)◂(_r64) %_3103~1':_r64 %_3105~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_3114
	mov rdi,r14
	call dlt
LB_3114:
	bt r12,2
	jc LB_3115
	mov rdi,r8
	call dlt
LB_3115:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3116
	btr r12,3
	jmp LB_3117
LB_3116:
	bts r12,3
LB_3117:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3111:
LB_3119:
	cmp r15,0
	jz LB_3120
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3119
LB_3120:
; _none {  } ⊢ %_3109 : %_3109
 ; {>  %_3103~1':_r64 %_3105~2':_r64 %_3104~3':_r64 %_3107~4':_r64 %_3106~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_3109
 ; {>  %_3103~1':_r64 %_3105~2':_r64 %_3104~3':_r64 %_3107~4':_r64 %_3109~°1◂{  }:(_opn)◂(t1064'(0)) %_3106~0':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_3121
	mov rdi,r14
	call dlt
LB_3121:
	bt r12,2
	jc LB_3122
	mov rdi,r8
	call dlt
LB_3122:
	bt r12,3
	jc LB_3123
	mov rdi,r9
	call dlt
LB_3123:
	bt r12,4
	jc LB_3124
	mov rdi,r10
	call dlt
LB_3124:
	bt r12,0
	jc LB_3125
	mov rdi,r13
	call dlt
LB_3125:
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
MTC_LB_3118:
LB_3126:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3128
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3127
LB_3128:
	add rsp,8
	ret
NS_E_3098_MTC_0_failed:
	add rsp,16
	pop r14
LB_3127:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3136:
NS_E_RDI_3136:
NS_E_3136_ETR_TBL:
NS_E_3136_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_3025_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3172
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3136_MTC_0_failed
LB_3172:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3167
	btr r12,0
	jmp LB_3168
LB_3167:
	bts r12,0
LB_3168:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3164
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_3138 : %_3138
 ; {>  %_3137~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_3138
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_3139 : %_3139
 ; {>  %_3138~1':_r64 %_3137~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_3139
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f33 { %_3137 %_3138 } ⊢ { %_3140 %_3141 %_3142 } : { %_3140 %_3141 %_3142 }
 ; {>  %_3139~2':_r64 %_3138~1':_r64 %_3137~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_3139 %_3140 } ⊢ { %_3143 %_3144 %_3145 } : { %_3143 %_3144 %_3145 }
 ; {>  %_3140~0':_r64 %_3139~2':_r64 %_3142~3':_r64 %_3141~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_3148:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_3149
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_3149
LB_3150:
	cmp r15,0
	jz LB_3151
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3150
LB_3151:
; _some %_3144 ⊢ %_3146 : %_3146
 ; {>  %_3143~2':_r64 %_3144~0':_r64 %_3141~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3146
 ; {>  %_3143~2':_r64 %_3146~°0◂0':(_opn)◂(_r64) %_3141~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_3152
	mov rdi,r8
	call dlt
LB_3152:
	bt r12,1
	jc LB_3153
	mov rdi,r14
	call dlt
LB_3153:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3154
	btr r12,3
	jmp LB_3155
LB_3154:
	bts r12,3
LB_3155:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3149:
LB_3157:
	cmp r15,0
	jz LB_3158
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3157
LB_3158:
; _none {  } ⊢ %_3147 : %_3147
 ; {>  %_3143~2':_r64 %_3142~3':_r64 %_3145~4':_r64 %_3144~0':_r64 %_3141~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_3147
 ; {>  %_3147~°1◂{  }:(_opn)◂(t1091'(0)) %_3143~2':_r64 %_3142~3':_r64 %_3145~4':_r64 %_3144~0':_r64 %_3141~1':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_3159
	mov rdi,r8
	call dlt
LB_3159:
	bt r12,3
	jc LB_3160
	mov rdi,r9
	call dlt
LB_3160:
	bt r12,4
	jc LB_3161
	mov rdi,r10
	call dlt
LB_3161:
	bt r12,0
	jc LB_3162
	mov rdi,r13
	call dlt
LB_3162:
	bt r12,1
	jc LB_3163
	mov rdi,r14
	call dlt
LB_3163:
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
MTC_LB_3156:
LB_3164:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3166
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3165
LB_3166:
	add rsp,8
	ret
NS_E_3136_MTC_0_failed:
	add rsp,16
	pop r14
LB_3165:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3174:
NS_E_RDI_3174:
NS_E_3174_ETR_TBL:
NS_E_3174_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_3025_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3210
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3174_MTC_0_failed
LB_3210:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3205
	btr r12,0
	jmp LB_3206
LB_3205:
	bts r12,0
LB_3206:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3202
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_3176 : %_3176
 ; {>  %_3175~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_3176
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_3177 : %_3177
 ; {>  %_3176~1':_r64 %_3175~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_3177
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f33 { %_3175 %_3176 } ⊢ { %_3178 %_3179 %_3180 } : { %_3178 %_3179 %_3180 }
 ; {>  %_3176~1':_r64 %_3175~0':_r64 %_3177~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_3177 %_3178 } ⊢ { %_3181 %_3182 %_3183 } : { %_3181 %_3182 %_3183 }
 ; {>  %_3179~1':_r64 %_3180~3':_r64 %_3178~0':_r64 %_3177~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_3186:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_3187
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_3187
LB_3188:
	cmp r15,0
	jz LB_3189
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3188
LB_3189:
; _some %_3182 ⊢ %_3184 : %_3184
 ; {>  %_3182~0':_r64 %_3179~1':_r64 %_3181~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3184
 ; {>  %_3179~1':_r64 %_3184~°0◂0':(_opn)◂(_r64) %_3181~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_3190
	mov rdi,r14
	call dlt
LB_3190:
	bt r12,2
	jc LB_3191
	mov rdi,r8
	call dlt
LB_3191:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3192
	btr r12,3
	jmp LB_3193
LB_3192:
	bts r12,3
LB_3193:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3187:
LB_3195:
	cmp r15,0
	jz LB_3196
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3195
LB_3196:
; _none {  } ⊢ %_3185 : %_3185
 ; {>  %_3183~4':_r64 %_3182~0':_r64 %_3179~1':_r64 %_3180~3':_r64 %_3181~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_3185
 ; {>  %_3183~4':_r64 %_3182~0':_r64 %_3179~1':_r64 %_3180~3':_r64 %_3181~2':_r64 %_3185~°1◂{  }:(_opn)◂(t1118'(0)) }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_3197
	mov rdi,r10
	call dlt
LB_3197:
	bt r12,0
	jc LB_3198
	mov rdi,r13
	call dlt
LB_3198:
	bt r12,1
	jc LB_3199
	mov rdi,r14
	call dlt
LB_3199:
	bt r12,3
	jc LB_3200
	mov rdi,r9
	call dlt
LB_3200:
	bt r12,2
	jc LB_3201
	mov rdi,r8
	call dlt
LB_3201:
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
MTC_LB_3194:
LB_3202:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3204
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3203
LB_3204:
	add rsp,8
	ret
NS_E_3174_MTC_0_failed:
	add rsp,16
	pop r14
LB_3203:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3212:
NS_E_RDI_3212:
NS_E_3212_ETR_TBL:
NS_E_3212_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_3174_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3227
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3212_MTC_0_failed
LB_3227:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3222
	btr r12,0
	jmp LB_3223
LB_3222:
	bts r12,0
LB_3223:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3219
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_3213 ⊢ %_3214 : %_3214
 ; {>  %_3213~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3214
 ; {>  %_3214~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3217
	btr r12,3
	jmp LB_3218
LB_3217:
	bts r12,3
LB_3218:
	mov r8,0
	bts r12,2
	ret
LB_3219:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3221
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3220
LB_3221:
	add rsp,8
	ret
NS_E_3212_MTC_0_failed:
	add rsp,16
	pop r14
LB_3220:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_3136_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3239
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3212_MTC_1_failed
LB_3239:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3234
	btr r12,0
	jmp LB_3235
LB_3234:
	bts r12,0
LB_3235:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3231
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_3215 ⊢ %_3216 : %_3216
 ; {>  %_3215~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3216
 ; {>  %_3216~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3229
	btr r12,3
	jmp LB_3230
LB_3229:
	bts r12,3
LB_3230:
	mov r8,0
	bts r12,2
	ret
LB_3231:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3233
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3232
LB_3233:
	add rsp,8
	ret
NS_E_3212_MTC_1_failed:
	add rsp,16
	pop r14
LB_3232:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3241:
NS_E_RDI_3241:
NS_E_3241_ETR_TBL:
NS_E_3241_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_3212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3289
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3241_MTC_0_failed
LB_3289:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_3242_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3294
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3295
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3295:
	jmp NS_E_3241_MTC_0_failed
LB_3294:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3284
	btr r12,1
	jmp LB_3285
LB_3284:
	bts r12,1
LB_3285:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3282
	btr r12,0
	jmp LB_3283
LB_3282:
	bts r12,0
LB_3283:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3279
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3244 %_3245 } ⊢ %_3246 : %_3246
 ; {>  %_3245~1':(_lst)◂(_r64) %_3244~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f3088 %_3246 ⊢ %_3247 : %_3247
 ; {>  %_3246~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f3088 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_3265
	btr r12,2
	jmp LB_3266
LB_3265:
	bts r12,2
LB_3266:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_3271
	btr r12,3
	jmp LB_3272
LB_3271:
	bts r12,3
LB_3272:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_3269
	btr QWORD [rdi],0
	jmp LB_3270
LB_3269:
	bts QWORD [rdi],0
LB_3270:
	mov r9,r14
	bt r12,1
	jc LB_3275
	btr r12,3
	jmp LB_3276
LB_3275:
	bts r12,3
LB_3276:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_3273
	btr QWORD [rdi],1
	jmp LB_3274
LB_3273:
	bts QWORD [rdi],1
LB_3274:
	mov rsi,1
	bt r12,0
	jc LB_3267
	mov rsi,0
	bt r13,0
	jc LB_3267
	jmp LB_3268
LB_3267:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_3268:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_3088
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_3247 ⊢ %_3248 : %_3248
 ; {>  %_3247~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_3248
 ; {>  %_3248~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3277
	btr r12,3
	jmp LB_3278
LB_3277:
	bts r12,3
LB_3278:
	mov r8,0
	bts r12,2
	ret
LB_3279:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3281
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3280
LB_3281:
	add rsp,8
	ret
NS_E_3241_MTC_0_failed:
	add rsp,32
	pop r14
LB_3280:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3242:
NS_E_RDI_3242:
NS_E_3242_ETR_TBL:
NS_E_3242_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_3243_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3317
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3242_MTC_0_failed
LB_3317:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_3242_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3322
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3323
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3323:
	jmp NS_E_3242_MTC_0_failed
LB_3322:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3312
	btr r12,1
	jmp LB_3313
LB_3312:
	bts r12,1
LB_3313:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3310
	btr r12,0
	jmp LB_3311
LB_3310:
	bts r12,0
LB_3311:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3307
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3249 %_3250 } ⊢ %_3251 : %_3251
 ; {>  %_3249~0':_r64 %_3250~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3251 ⊢ %_3252 : %_3252
 ; {>  %_3251~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3252
 ; {>  %_3252~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_3301
	btr r12,2
	jmp LB_3302
LB_3301:
	bts r12,2
LB_3302:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3299
	btr QWORD [rdi],0
	jmp LB_3300
LB_3299:
	bts QWORD [rdi],0
LB_3300:
	mov r8,r14
	bt r12,1
	jc LB_3305
	btr r12,2
	jmp LB_3306
LB_3305:
	bts r12,2
LB_3306:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3303
	btr QWORD [rdi],1
	jmp LB_3304
LB_3303:
	bts QWORD [rdi],1
LB_3304:
	mov rsi,1
	bt r12,3
	jc LB_3297
	mov rsi,0
	bt r9,0
	jc LB_3297
	jmp LB_3298
LB_3297:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3298:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3307:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3309
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3308
LB_3309:
	add rsp,8
	ret
NS_E_3242_MTC_0_failed:
	add rsp,32
	pop r14
LB_3308:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_3327
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_3253 : %_3253
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3253 ⊢ %_3254 : %_3254
 ; {>  %_3253~°1◂{  }:(_lst)◂(t1162'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3254
 ; {>  %_3254~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1165'(0))) }
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
	jc LB_3325
	mov rsi,0
	bt r9,0
	jc LB_3325
	jmp LB_3326
LB_3325:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3326:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3327:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3329
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3328
LB_3329:
	add rsp,8
	ret
NS_E_3242_MTC_1_failed:
	add rsp,0
	pop r14
LB_3328:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3243:
NS_E_RDI_3243:
NS_E_3243_ETR_TBL:
NS_E_3243_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_3212_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3340
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3243_MTC_0_failed
LB_3340:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3335
	btr r12,0
	jmp LB_3336
LB_3335:
	bts r12,0
LB_3336:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3332
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_3255 ⊢ %_3256 : %_3256
 ; {>  %_3255~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3256
 ; {>  %_3256~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3330
	btr r12,3
	jmp LB_3331
LB_3330:
	bts r12,3
LB_3331:
	mov r8,0
	bts r12,2
	ret
LB_3332:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3334
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3333
LB_3334:
	add rsp,8
	ret
NS_E_3243_MTC_0_failed:
	add rsp,16
	pop r14
LB_3333:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_3098_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3359
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3243_MTC_1_failed
LB_3359:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3354
	btr r12,0
	jmp LB_3355
LB_3354:
	bts r12,0
LB_3355:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3351
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; 	» "P0" _ ⊢ 1' : %_3258
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_30_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f21 %_3258 ⊢ %_3259 : %_3259
 ; {>  %_3258~1':_stg %_3257~0':_r64 }
; _f21 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3344
	btr r12,0
	jmp LB_3345
LB_3344:
	bts r12,0
LB_3345:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3346
	btr r12,1
	jmp LB_3347
LB_3346:
	bts r12,1
LB_3347:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3342
	btr r12,0
	jmp LB_3343
LB_3342:
	bts r12,0
LB_3343:
	add rsp,16
; _some %_3257 ⊢ %_3260 : %_3260
 ; {>  %_3259~1':_stg %_3257~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3260
 ; {>  %_3260~°0◂0':(_opn)◂(_r64) %_3259~1':_stg }
; 	∎ °0◂0'
	bt r12,1
	jc LB_3348
	mov rdi,r14
	call dlt
LB_3348:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3349
	btr r12,3
	jmp LB_3350
LB_3349:
	bts r12,3
LB_3350:
	mov r8,0
	bts r12,2
	ret
LB_3351:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3353
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3352
LB_3353:
	add rsp,8
	ret
NS_E_3243_MTC_1_failed:
	add rsp,16
	pop r14
LB_3352:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_3374
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_3374
	jmp LB_3375
LB_3374:
	jmp NS_E_3243_MTC_2_failed
LB_3375:
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
	jc LB_3367
	btr r12,0
	jmp LB_3368
LB_3367:
	bts r12,0
LB_3368:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3364
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 	» "P1" _ ⊢ 0' : %_3261
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_31_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f21 %_3261 ⊢ %_3262 : %_3262
 ; {>  %_3261~0':_stg }
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
; » 0xr5f |~ {  } ⊢ %_3263 : %_3263
 ; {>  %_3262~0':_stg }
; 	» 0xr5f _ ⊢ 1' : %_3263
	mov rdi,0x5f
	mov r14,rdi
	bts r12,1
; _some %_3263 ⊢ %_3264 : %_3264
 ; {>  %_3262~0':_stg %_3263~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_3264
 ; {>  %_3264~°0◂1':(_opn)◂(_r64) %_3262~0':_stg }
; 	∎ °0◂1'
	bt r12,0
	jc LB_3361
	mov rdi,r13
	call dlt
LB_3361:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_3362
	btr r12,3
	jmp LB_3363
LB_3362:
	bts r12,3
LB_3363:
	mov r8,0
	bts r12,2
	ret
LB_3364:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3366
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3365
LB_3366:
	add rsp,8
	ret
NS_E_3243_MTC_2_failed:
	add rsp,16
	pop r14
LB_3365:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3377:
NS_E_RDI_3377:
NS_E_3377_ETR_TBL:
NS_E_3377_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_3395
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_3395
	jmp LB_3396
LB_3395:
	jmp NS_E_3377_MTC_0_failed
LB_3396:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_3241_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3400
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3401
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3401:
	jmp NS_E_3377_MTC_0_failed
LB_3400:
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
	jc LB_3387
	btr QWORD [rdi],1
LB_3387:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3388
	btr QWORD [rdi],0
LB_3388:
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
NS_E_3377_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_3241_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3385
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3377_MTC_1_failed
LB_3385:
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
	jc LB_3380
	btr QWORD [rdi],0
LB_3380:
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
NS_E_3377_MTC_1_failed:
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
; 	» "aSk7_dD0_4$ jj " _ ⊢ 0' : %_3403
	mov rdi,15
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_44_64_5f_37_6b_53_61
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_20_6a_6a_20_24_34_5f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_3404 : %_3404
 ; {>  %_3403~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_3404
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f3241 { %_3403 %_3404 } ⊢ { %_3405 %_3406 %_3407 } : { %_3405 %_3406 %_3407 }
 ; {>  %_3403~0':_stg %_3404~1':_r64 }
; _f3241 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_3241
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_3412
	btr r12,4
	jmp LB_3413
LB_3412:
	bts r12,4
LB_3413:
	mov r8,r9
	bt r12,3
	jc LB_3416
	btr r12,2
	jmp LB_3417
LB_3416:
	bts r12,2
LB_3417:
	mov rsi,1
	bt r12,2
	jc LB_3414
	mov rsi,0
	bt r8,0
	jc LB_3414
	jmp LB_3415
LB_3414:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_3415:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_3405 %_3406 %_3407 } ⊢ { %_3408 %_3409 %_3410 } : { %_3408 %_3409 %_3410 }
 ; {>  %_3406~1':_r64 %_3405~0':_stg %_3407~2':(_opn)◂(_stg) }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_3418
	btr r12,3
	jmp LB_3419
LB_3418:
	bts r12,3
LB_3419:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_3422
	btr r12,4
	jmp LB_3423
LB_3422:
	bts r12,4
LB_3423:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_3420
	btr QWORD [rdi],0
	jmp LB_3421
LB_3420:
	bts QWORD [rdi],0
LB_3421:
	mov r10,r14
	bt r12,1
	jc LB_3426
	btr r12,4
	jmp LB_3427
LB_3426:
	bts r12,4
LB_3427:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_3424
	btr QWORD [rdi],1
	jmp LB_3425
LB_3424:
	bts QWORD [rdi],1
LB_3425:
	mov r10,r8
	bt r12,2
	jc LB_3430
	btr r12,4
	jmp LB_3431
LB_3430:
	bts r12,4
LB_3431:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_3428
	btr QWORD [rdi],2
	jmp LB_3429
LB_3428:
	bts QWORD [rdi],2
LB_3429:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_3432
	btr r12,3
	jmp LB_3433
LB_3432:
	bts r12,3
LB_3433:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3436
	btr r12,4
	jmp LB_3437
LB_3436:
	bts r12,4
LB_3437:
	mov r13,r10
	bt r12,4
	jc LB_3434
	btr r12,0
	jmp LB_3435
LB_3434:
	bts r12,0
LB_3435:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3440
	btr r12,4
	jmp LB_3441
LB_3440:
	bts r12,4
LB_3441:
	mov r14,r10
	bt r12,4
	jc LB_3438
	btr r12,1
	jmp LB_3439
LB_3438:
	bts r12,1
LB_3439:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_3444
	btr r12,4
	jmp LB_3445
LB_3444:
	bts r12,4
LB_3445:
	mov r8,r10
	bt r12,4
	jc LB_3442
	btr r12,2
	jmp LB_3443
LB_3442:
	bts r12,2
LB_3443:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_3408~0':_stg %_3409~1':_r64 %_3410~2':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_3446
	mov rdi,r13
	call dlt
LB_3446:
	bt r12,1
	jc LB_3447
	mov rdi,r14
	call dlt
LB_3447:
	bt r12,2
	jc LB_3448
	mov rdi,r8
	call dlt
LB_3448:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_3449:
NS_E_RDI_3449:
NS_E_3449_ETR_TBL:
NS_E_3449_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_3489
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_3489
	jmp LB_3490
LB_3489:
	jmp NS_E_3449_MTC_0_failed
LB_3490:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_3450_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3494
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3495
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3495:
	jmp NS_E_3449_MTC_0_failed
LB_3494:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3482
	btr r12,1
	jmp LB_3483
LB_3482:
	bts r12,1
LB_3483:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3480
	btr r12,0
	jmp LB_3481
LB_3480:
	bts r12,0
LB_3481:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3477
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_3497
	btr r12,2
	jmp LB_3498
LB_3497:
	bts r12,2
LB_3498:
	mov r13,r14
	bt r12,1
	jc LB_3499
	btr r12,0
	jmp LB_3500
LB_3499:
	bts r12,0
LB_3500:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f3088 %_3452 ⊢ %_3453 : %_3453
 ; {>  %_3452~0':(_lst)◂(_r64) }
; _f3088 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_3088
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_3453 ⊢ %_3454 : %_3454
 ; {>  %_3453~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_3454
 ; {>  %_3454~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3475
	btr r12,3
	jmp LB_3476
LB_3475:
	bts r12,3
LB_3476:
	mov r8,0
	bts r12,2
	ret
LB_3477:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3479
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3478
LB_3479:
	add rsp,8
	ret
NS_E_3449_MTC_0_failed:
	add rsp,32
	pop r14
LB_3478:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3450:
NS_E_RDI_3450:
NS_E_3450_ETR_TBL:
NS_E_3450_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_3525
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_3525
	jmp LB_3526
LB_3525:
	jmp NS_E_3450_MTC_0_failed
LB_3526:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_3451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3530
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3531
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3531:
	jmp NS_E_3450_MTC_0_failed
LB_3530:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_3450_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3536
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3537
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3537:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3538
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3538:
	jmp NS_E_3450_MTC_0_failed
LB_3536:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3518
	btr r12,2
	jmp LB_3519
LB_3518:
	bts r12,2
LB_3519:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3516
	btr r12,1
	jmp LB_3517
LB_3516:
	bts r12,1
LB_3517:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3514
	btr r12,0
	jmp LB_3515
LB_3514:
	bts r12,0
LB_3515:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3511
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_3540
	btr r12,3
	jmp LB_3541
LB_3540:
	bts r12,3
LB_3541:
	mov r14,r8
	bt r12,2
	jc LB_3542
	btr r12,1
	jmp LB_3543
LB_3542:
	bts r12,1
LB_3543:
	mov r8,r13
	bt r12,0
	jc LB_3544
	btr r12,2
	jmp LB_3545
LB_3544:
	bts r12,2
LB_3545:
	mov r13,r9
	bt r12,3
	jc LB_3546
	btr r12,0
	jmp LB_3547
LB_3546:
	bts r12,0
LB_3547:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_3455 %_3456 } ⊢ %_3457 : %_3457
 ; {>  %_3455~0':_r64 %_3456~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3457 ⊢ %_3458 : %_3458
 ; {>  %_3457~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3458
 ; {>  %_3458~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_3505
	btr r12,2
	jmp LB_3506
LB_3505:
	bts r12,2
LB_3506:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3503
	btr QWORD [rdi],0
	jmp LB_3504
LB_3503:
	bts QWORD [rdi],0
LB_3504:
	mov r8,r14
	bt r12,1
	jc LB_3509
	btr r12,2
	jmp LB_3510
LB_3509:
	bts r12,2
LB_3510:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3507
	btr QWORD [rdi],1
	jmp LB_3508
LB_3507:
	bts QWORD [rdi],1
LB_3508:
	mov rsi,1
	bt r12,3
	jc LB_3501
	mov rsi,0
	bt r9,0
	jc LB_3501
	jmp LB_3502
LB_3501:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3502:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3511:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3513
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3512
LB_3513:
	add rsp,8
	ret
NS_E_3450_MTC_0_failed:
	add rsp,48
	pop r14
LB_3512:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_3560
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_3560
	jmp LB_3561
LB_3560:
	jmp NS_E_3450_MTC_1_failed
LB_3561:
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
	jc LB_3553
	btr r12,0
	jmp LB_3554
LB_3553:
	bts r12,0
LB_3554:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3550
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_3459 : %_3459
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3459 ⊢ %_3460 : %_3460
 ; {>  %_3459~°1◂{  }:(_lst)◂(t1245'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3460
 ; {>  %_3460~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1248'(0))) }
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
	jc LB_3548
	mov rsi,0
	bt r9,0
	jc LB_3548
	jmp LB_3549
LB_3548:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3549:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3550:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3552
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3551
LB_3552:
	add rsp,8
	ret
NS_E_3450_MTC_1_failed:
	add rsp,16
	pop r14
LB_3551:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_3025_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3582
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3450_MTC_2_failed
LB_3582:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_3450_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3587
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3588
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3588:
	jmp NS_E_3450_MTC_2_failed
LB_3587:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3577
	btr r12,1
	jmp LB_3578
LB_3577:
	bts r12,1
LB_3578:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3575
	btr r12,0
	jmp LB_3576
LB_3575:
	bts r12,0
LB_3576:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3572
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3461 %_3462 } ⊢ %_3463 : %_3463
 ; {>  %_3462~1':(_lst)◂(_r64) %_3461~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3463 ⊢ %_3464 : %_3464
 ; {>  %_3463~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3464
 ; {>  %_3464~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_3566
	btr r12,2
	jmp LB_3567
LB_3566:
	bts r12,2
LB_3567:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3564
	btr QWORD [rdi],0
	jmp LB_3565
LB_3564:
	bts QWORD [rdi],0
LB_3565:
	mov r8,r14
	bt r12,1
	jc LB_3570
	btr r12,2
	jmp LB_3571
LB_3570:
	bts r12,2
LB_3571:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3568
	btr QWORD [rdi],1
	jmp LB_3569
LB_3568:
	bts QWORD [rdi],1
LB_3569:
	mov rsi,1
	bt r12,3
	jc LB_3562
	mov rsi,0
	bt r9,0
	jc LB_3562
	jmp LB_3563
LB_3562:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3563:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3572:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3574
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3573
LB_3574:
	add rsp,8
	ret
NS_E_3450_MTC_2_failed:
	add rsp,32
	pop r14
LB_3573:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3451:
NS_E_RDI_3451:
NS_E_3451_ETR_TBL:
NS_E_3451_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_3602
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_3602
	jmp LB_3603
LB_3602:
	jmp NS_E_3451_MTC_0_failed
LB_3603:
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
	jc LB_3595
	btr r12,0
	jmp LB_3596
LB_3595:
	bts r12,0
LB_3596:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3592
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_3465 : %_3465
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_3465
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_3465 ⊢ %_3466 : %_3466
 ; {>  %_3465~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3466
 ; {>  %_3466~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3590
	btr r12,3
	jmp LB_3591
LB_3590:
	bts r12,3
LB_3591:
	mov r8,0
	bts r12,2
	ret
LB_3592:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3594
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3593
LB_3594:
	add rsp,8
	ret
NS_E_3451_MTC_0_failed:
	add rsp,16
	pop r14
LB_3593:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_3616
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_3616
	jmp LB_3617
LB_3616:
	jmp NS_E_3451_MTC_1_failed
LB_3617:
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
	jc LB_3609
	btr r12,0
	jmp LB_3610
LB_3609:
	bts r12,0
LB_3610:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3606
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_3467 : %_3467
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_3467
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_3467 ⊢ %_3468 : %_3468
 ; {>  %_3467~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3468
 ; {>  %_3468~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3604
	btr r12,3
	jmp LB_3605
LB_3604:
	bts r12,3
LB_3605:
	mov r8,0
	bts r12,2
	ret
LB_3606:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3608
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3607
LB_3608:
	add rsp,8
	ret
NS_E_3451_MTC_1_failed:
	add rsp,16
	pop r14
LB_3607:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_3630
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_3630
	jmp LB_3631
LB_3630:
	jmp NS_E_3451_MTC_2_failed
LB_3631:
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
	jc LB_3623
	btr r12,0
	jmp LB_3624
LB_3623:
	bts r12,0
LB_3624:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3620
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_3469 : %_3469
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_3469
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_3469 ⊢ %_3470 : %_3470
 ; {>  %_3469~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3470
 ; {>  %_3470~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3618
	btr r12,3
	jmp LB_3619
LB_3618:
	bts r12,3
LB_3619:
	mov r8,0
	bts r12,2
	ret
LB_3620:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3622
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3621
LB_3622:
	add rsp,8
	ret
NS_E_3451_MTC_2_failed:
	add rsp,16
	pop r14
LB_3621:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_3644
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_3644
	jmp LB_3645
LB_3644:
	jmp NS_E_3451_MTC_3_failed
LB_3645:
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
	jc LB_3637
	btr r12,0
	jmp LB_3638
LB_3637:
	bts r12,0
LB_3638:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3634
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_3471 : %_3471
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_3471
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_3471 ⊢ %_3472 : %_3472
 ; {>  %_3471~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3472
 ; {>  %_3472~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3632
	btr r12,3
	jmp LB_3633
LB_3632:
	bts r12,3
LB_3633:
	mov r8,0
	bts r12,2
	ret
LB_3634:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3636
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3635
LB_3636:
	add rsp,8
	ret
NS_E_3451_MTC_3_failed:
	add rsp,16
	pop r14
LB_3635:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_3658
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_3658
	jmp LB_3659
LB_3658:
	jmp NS_E_3451_MTC_4_failed
LB_3659:
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
	jc LB_3651
	btr r12,0
	jmp LB_3652
LB_3651:
	bts r12,0
LB_3652:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3648
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_3473 : %_3473
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_3473
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_3473 ⊢ %_3474 : %_3474
 ; {>  %_3473~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3474
 ; {>  %_3474~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3646
	btr r12,3
	jmp LB_3647
LB_3646:
	bts r12,3
LB_3647:
	mov r8,0
	bts r12,2
	ret
LB_3648:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3650
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3649
LB_3650:
	add rsp,8
	ret
NS_E_3451_MTC_4_failed:
	add rsp,16
	pop r14
LB_3649:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3668:
NS_E_RDI_3668:
; » _^ ..
	mov rax,19
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\"Hello\\tWorld !!\" \n"
	mov rsi,0x_74_5c_6f_6c_6c_65_48_22
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_21_21_20_64_6c_72_6f_57
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_22
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+2],sil
	add rdi,19
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_3661 : %_3661
 ; {>  %_3660~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_3661
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f3449 { %_3660 %_3661 } ⊢ { %_3662 %_3663 %_3664 } : { %_3662 %_3663 %_3664 }
 ; {>  %_3660~0':_stg %_3661~1':_r64 }
; _f3449 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_3449
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_3669
	btr r12,4
	jmp LB_3670
LB_3669:
	bts r12,4
LB_3670:
	mov r8,r9
	bt r12,3
	jc LB_3673
	btr r12,2
	jmp LB_3674
LB_3673:
	bts r12,2
LB_3674:
	mov rsi,1
	bt r12,2
	jc LB_3671
	mov rsi,0
	bt r8,0
	jc LB_3671
	jmp LB_3672
LB_3671:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_3672:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_3662 %_3663 %_3664 } ⊢ { %_3665 %_3666 %_3667 } : { %_3665 %_3666 %_3667 }
 ; {>  %_3663~1':_r64 %_3662~0':_stg %_3664~2':(_opn)◂(_stg) }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_3675
	btr r12,3
	jmp LB_3676
LB_3675:
	bts r12,3
LB_3676:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_3679
	btr r12,4
	jmp LB_3680
LB_3679:
	bts r12,4
LB_3680:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_3677
	btr QWORD [rdi],0
	jmp LB_3678
LB_3677:
	bts QWORD [rdi],0
LB_3678:
	mov r10,r14
	bt r12,1
	jc LB_3683
	btr r12,4
	jmp LB_3684
LB_3683:
	bts r12,4
LB_3684:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_3681
	btr QWORD [rdi],1
	jmp LB_3682
LB_3681:
	bts QWORD [rdi],1
LB_3682:
	mov r10,r8
	bt r12,2
	jc LB_3687
	btr r12,4
	jmp LB_3688
LB_3687:
	bts r12,4
LB_3688:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_3685
	btr QWORD [rdi],2
	jmp LB_3686
LB_3685:
	bts QWORD [rdi],2
LB_3686:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_3689
	btr r12,3
	jmp LB_3690
LB_3689:
	bts r12,3
LB_3690:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3693
	btr r12,4
	jmp LB_3694
LB_3693:
	bts r12,4
LB_3694:
	mov r13,r10
	bt r12,4
	jc LB_3691
	btr r12,0
	jmp LB_3692
LB_3691:
	bts r12,0
LB_3692:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3697
	btr r12,4
	jmp LB_3698
LB_3697:
	bts r12,4
LB_3698:
	mov r14,r10
	bt r12,4
	jc LB_3695
	btr r12,1
	jmp LB_3696
LB_3695:
	bts r12,1
LB_3696:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_3701
	btr r12,4
	jmp LB_3702
LB_3701:
	bts r12,4
LB_3702:
	mov r8,r10
	bt r12,4
	jc LB_3699
	btr r12,2
	jmp LB_3700
LB_3699:
	bts r12,2
LB_3700:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_3665~0':_stg %_3666~1':_r64 %_3667~2':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_3703
	mov rdi,r13
	call dlt
LB_3703:
	bt r12,1
	jc LB_3704
	mov rdi,r14
	call dlt
LB_3704:
	bt r12,2
	jc LB_3705
	mov rdi,r8
	call dlt
LB_3705:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_3719:
NS_E_RDI_3719:
; » 0xr41 |~ {  } ⊢ %_3706 : %_3706
 ; {>  }
; 	» 0xr41 _ ⊢ 0' : %_3706
	mov rdi,0x41
	mov r13,rdi
	bts r12,0
; » 0xr42 |~ {  } ⊢ %_3707 : %_3707
 ; {>  %_3706~0':_r64 }
; 	» 0xr42 _ ⊢ 1' : %_3707
	mov rdi,0x42
	mov r14,rdi
	bts r12,1
; » 0xr43 |~ {  } ⊢ %_3708 : %_3708
 ; {>  %_3707~1':_r64 %_3706~0':_r64 }
; 	» 0xr43 _ ⊢ 2' : %_3708
	mov rdi,0x43
	mov r8,rdi
	bts r12,2
; » 0xr44 |~ {  } ⊢ %_3709 : %_3709
 ; {>  %_3708~2':_r64 %_3707~1':_r64 %_3706~0':_r64 }
; 	» 0xr44 _ ⊢ 3' : %_3709
	mov rdi,0x44
	mov r9,rdi
	bts r12,3
; » 0xr0 |~ {  } ⊢ %_3710 : %_3710
 ; {>  %_3708~2':_r64 %_3709~3':_r64 %_3707~1':_r64 %_3706~0':_r64 }
; 	» 0xr0 _ ⊢ 4' : %_3710
	mov rdi,0x0
	mov r10,rdi
	bts r12,4
; _nil {  } ⊢ %_3711 : %_3711
 ; {>  %_3708~2':_r64 %_3709~3':_r64 %_3707~1':_r64 %_3706~0':_r64 %_3710~4':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_3706 %_3711 } ⊢ %_3712 : %_3712
 ; {>  %_3711~°1◂{  }:(_lst)◂(t1329'(0)) %_3708~2':_r64 %_3709~3':_r64 %_3707~1':_r64 %_3706~0':_r64 %_3710~4':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _cns { %_3707 %_3712 } ⊢ %_3713 : %_3713
 ; {>  %_3708~2':_r64 %_3709~3':_r64 %_3707~1':_r64 %_3712~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) %_3710~4':_r64 }
; _cns { 1' °0◂{ 0' °1◂{  } } } ⊢ °0◂{ 1' °0◂{ 0' °1◂{  } } }
; _cns { %_3708 %_3713 } ⊢ %_3714 : %_3714
 ; {>  %_3708~2':_r64 %_3709~3':_r64 %_3713~°0◂{ 1' °0◂{ 0' °1◂{  } } }:(_lst)◂(_r64) %_3710~4':_r64 }
; _cns { 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } ⊢ °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } }
; _cns { %_3709 %_3714 } ⊢ %_3715 : %_3715
 ; {>  %_3709~3':_r64 %_3714~°0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } }:(_lst)◂(_r64) %_3710~4':_r64 }
; _cns { 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } ⊢ °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } }
; _f3045 { %_3710 %_3715 } ⊢ { %_3716 %_3717 } : { %_3716 %_3717 }
 ; {>  %_3715~°0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } }:(_lst)◂(_r64) %_3710~4':_r64 }
; _f3045 { 4' °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 4' °0◂{ 3' °0◂{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } } } ⊢ { 0' 1' }
	mov r11,r14
	bt r12,1
	jc LB_3720
	btr r12,5
	jmp LB_3721
LB_3720:
	bts r12,5
LB_3721:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rcx,r9
	bt r12,3
	jc LB_3726
	btr r12,6
	jmp LB_3727
LB_3726:
	bts r12,6
LB_3727:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_3724
	btr QWORD [rdi],0
	jmp LB_3725
LB_3724:
	bts QWORD [rdi],0
LB_3725:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r9,r8
	bt r12,2
	jc LB_3734
	btr r12,3
	jmp LB_3735
LB_3734:
	bts r12,3
LB_3735:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_3732
	btr QWORD [rdi],0
	jmp LB_3733
LB_3732:
	bts QWORD [rdi],0
LB_3733:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r11
	bt r12,5
	jc LB_3742
	btr r12,2
	jmp LB_3743
LB_3742:
	bts r12,2
LB_3743:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3740
	btr QWORD [rdi],0
	jmp LB_3741
LB_3740:
	bts QWORD [rdi],0
LB_3741:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r11,r13
	bt r12,0
	jc LB_3750
	btr r12,5
	jmp LB_3751
LB_3750:
	bts r12,5
LB_3751:
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_3748
	btr QWORD [rdi],0
	jmp LB_3749
LB_3748:
	bts QWORD [rdi],0
LB_3749:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rsi,1
	bt r12,5
	jc LB_3754
	mov rsi,0
	bt r11,0
	jc LB_3754
	jmp LB_3755
LB_3754:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r11
	mov r11,rax
	btr r12,5
LB_3755:
	mov rax,0x0100_0000_0000_0001
	or r11,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_3752
	btr QWORD [rdi],1
	jmp LB_3753
LB_3752:
	bts QWORD [rdi],1
LB_3753:
	mov rsi,1
	bt r12,2
	jc LB_3746
	mov rsi,0
	bt r8,0
	jc LB_3746
	jmp LB_3747
LB_3746:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_3747:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3744
	btr QWORD [rdi],1
	jmp LB_3745
LB_3744:
	bts QWORD [rdi],1
LB_3745:
	mov rsi,1
	bt r12,3
	jc LB_3738
	mov rsi,0
	bt r9,0
	jc LB_3738
	jmp LB_3739
LB_3738:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3739:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_3736
	btr QWORD [rdi],1
	jmp LB_3737
LB_3736:
	bts QWORD [rdi],1
LB_3737:
	mov rsi,1
	bt r12,6
	jc LB_3730
	mov rsi,0
	bt rcx,0
	jc LB_3730
	jmp LB_3731
LB_3730:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],rcx
	mov rcx,rax
	btr r12,6
LB_3731:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_3728
	btr QWORD [rdi],1
	jmp LB_3729
LB_3728:
	bts QWORD [rdi],1
LB_3729:
	mov rsi,1
	bt r12,1
	jc LB_3722
	mov rsi,0
	bt r14,0
	jc LB_3722
	jmp LB_3723
LB_3722:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_3723:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov r13,r10
	bt r12,4
	jc LB_3756
	btr r12,0
	jmp LB_3757
LB_3756:
	bts r12,0
LB_3757:
	call NS_E_3045
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 %_3717 ⊢ %_3718 : %_3718
 ; {>  %_3717~1':_stg %_3716~0':_r64 }
; _f21 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3760
	btr r12,0
	jmp LB_3761
LB_3760:
	bts r12,0
LB_3761:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3762
	btr r12,1
	jmp LB_3763
LB_3762:
	bts r12,1
LB_3763:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3758
	btr r12,0
	jmp LB_3759
LB_3758:
	bts r12,0
LB_3759:
	add rsp,16
; ∎ {  }
 ; {>  %_3718~1':_stg %_3716~0':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_3764
	mov rdi,r14
	call dlt
LB_3764:
	bt r12,0
	jc LB_3765
	mov rdi,r13
	call dlt
LB_3765:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_3791:
; 	|» { 0' 1' 2' }
NS_E_RDI_3791:
; _f33 { %_3767 %_3766 } ⊢ { %_3769 %_3770 %_3771 } : { %_3769 %_3770 %_3771 }
 ; {>  %_3768~2':_r64 %_3767~1':_r64 %_3766~0':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
MTC_LB_3792:
	mov QWORD rax,0x0
	cmp rax,r9
	jnz MTC_LB_3793
LB_3794:
	cmp r15,0
	jz LB_3795
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3794
LB_3795:
; _f36 %_3770 ⊢ { %_3772 %_3773 } : { %_3772 %_3773 }
 ; {>  %_3769~1':_r64 %_3768~2':_r64 %_3770~0':_r64 }
	mov r9,r13
	bts r12,3
; _f36 %_3769 ⊢ { %_3774 %_3775 } : { %_3774 %_3775 }
 ; {>  %_3769~1':_r64 %_3768~2':_r64 %_3773~3':_r64 %_3772~0':_r64 }
	mov r10,r14
	bts r12,4
; _f36 %_3768 ⊢ { %_3776 %_3777 } : { %_3776 %_3777 }
 ; {>  %_3768~2':_r64 %_3773~3':_r64 %_3775~4':_r64 %_3774~1':_r64 %_3772~0':_r64 }
	mov r11,r8
	bts r12,5
; _f38 %_3773 ⊢ %_3778 : %_3778
 ; {>  %_3777~5':_r64 %_3773~3':_r64 %_3775~4':_r64 %_3776~2':_r64 %_3774~1':_r64 %_3772~0':_r64 }
	sub r9,1
; _f3791 { %_3778 %_3775 %_3777 } ⊢ %_3779 : %_3779
 ; {>  %_3777~5':_r64 %_3778~3':_r64 %_3775~4':_r64 %_3776~2':_r64 %_3774~1':_r64 %_3772~0':_r64 }
; _f3791 { 3' 4' 5' } ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0001110.. |},{ 3' 4' 5' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,3
	jc LB_3802
	btr r12,0
	jmp LB_3803
LB_3802:
	bts r12,0
LB_3803:
	mov r14,r10
	bt r12,4
	jc LB_3804
	btr r12,1
	jmp LB_3805
LB_3804:
	bts r12,1
LB_3805:
	mov r8,r11
	bt r12,5
	jc LB_3806
	btr r12,2
	jmp LB_3807
LB_3806:
	bts r12,2
LB_3807:
	call NS_E_3791
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_3808
	btr r12,3
	jmp LB_3809
LB_3808:
	bts r12,3
LB_3809:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_3800
	btr r12,2
	jmp LB_3801
LB_3800:
	bts r12,2
LB_3801:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3798
	btr r12,1
	jmp LB_3799
LB_3798:
	bts r12,1
LB_3799:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3796
	btr r12,0
	jmp LB_3797
LB_3796:
	bts r12,0
LB_3797:
	add rsp,32
; _f36 %_3772 ⊢ { %_3780 %_3781 } : { %_3780 %_3781 }
 ; {>  %_3779~3':_r64 %_3776~2':_r64 %_3774~1':_r64 %_3772~0':_r64 }
	mov r10,r13
	bts r12,4
; _f36 %_3774 ⊢ { %_3782 %_3783 } : { %_3782 %_3783 }
 ; {>  %_3780~0':_r64 %_3779~3':_r64 %_3781~4':_r64 %_3776~2':_r64 %_3774~1':_r64 }
	mov r11,r14
	bts r12,5
; _f36 %_3776 ⊢ { %_3784 %_3785 } : { %_3784 %_3785 }
 ; {>  %_3780~0':_r64 %_3783~5':_r64 %_3782~1':_r64 %_3779~3':_r64 %_3781~4':_r64 %_3776~2':_r64 }
	mov rcx,r8
	bts r12,6
; _f38 %_3783 ⊢ %_3786 : %_3786
 ; {>  %_3785~6':_r64 %_3784~2':_r64 %_3780~0':_r64 %_3783~5':_r64 %_3782~1':_r64 %_3779~3':_r64 %_3781~4':_r64 }
	sub r11,1
; _f3791 { %_3786 %_3785 %_3781 } ⊢ %_3787 : %_3787
 ; {>  %_3785~6':_r64 %_3784~2':_r64 %_3780~0':_r64 %_3782~1':_r64 %_3779~3':_r64 %_3786~5':_r64 %_3781~4':_r64 }
; _f3791 { 5' 6' 4' } ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00001110.. |},{ 5' 6' 4' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,5
	jc LB_3818
	btr r12,0
	jmp LB_3819
LB_3818:
	bts r12,0
LB_3819:
	mov r14,rcx
	bt r12,6
	jc LB_3820
	btr r12,1
	jmp LB_3821
LB_3820:
	bts r12,1
LB_3821:
	mov r8,r10
	bt r12,4
	jc LB_3822
	btr r12,2
	jmp LB_3823
LB_3822:
	bts r12,2
LB_3823:
	call NS_E_3791
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_3824
	btr r12,4
	jmp LB_3825
LB_3824:
	bts r12,4
LB_3825:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_3816
	btr r12,3
	jmp LB_3817
LB_3816:
	bts r12,3
LB_3817:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_3814
	btr r12,2
	jmp LB_3815
LB_3814:
	bts r12,2
LB_3815:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3812
	btr r12,1
	jmp LB_3813
LB_3812:
	bts r12,1
LB_3813:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3810
	btr r12,0
	jmp LB_3811
LB_3810:
	bts r12,0
LB_3811:
	add rsp,40
; _f38 %_3784 ⊢ %_3788 : %_3788
 ; {>  %_3784~2':_r64 %_3780~0':_r64 %_3787~4':_r64 %_3782~1':_r64 %_3779~3':_r64 }
	sub r8,1
; _f3791 { %_3788 %_3780 %_3782 } ⊢ %_3789 : %_3789
 ; {>  %_3780~0':_r64 %_3788~2':_r64 %_3787~4':_r64 %_3782~1':_r64 %_3779~3':_r64 }
; _f3791 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_3830
	btr r12,3
	jmp LB_3831
LB_3830:
	bts r12,3
LB_3831:
	mov r8,r14
	bt r12,1
	jc LB_3832
	btr r12,2
	jmp LB_3833
LB_3832:
	bts r12,2
LB_3833:
	mov r14,r13
	bt r12,0
	jc LB_3834
	btr r12,1
	jmp LB_3835
LB_3834:
	bts r12,1
LB_3835:
	mov r13,r9
	bt r12,3
	jc LB_3836
	btr r12,0
	jmp LB_3837
LB_3836:
	bts r12,0
LB_3837:
	call NS_E_3791
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3828
	btr r12,4
	jmp LB_3829
LB_3828:
	bts r12,4
LB_3829:
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_3826
	btr r12,3
	jmp LB_3827
LB_3826:
	bts r12,3
LB_3827:
	add rsp,24
; _f3791 { %_3779 %_3787 %_3789 } ⊢ %_3790 : %_3790
 ; {>  %_3787~4':_r64 %_3789~0':_r64 %_3779~3':_r64 }
; _f3791 { 3' 4' 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100110.. |},{ 3' 4' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,4
	jc LB_3838
	btr r12,1
	jmp LB_3839
LB_3838:
	bts r12,1
LB_3839:
	mov r8,r13
	bt r12,0
	jc LB_3840
	btr r12,2
	jmp LB_3841
LB_3840:
	bts r12,2
LB_3841:
	mov r13,r9
	bt r12,3
	jc LB_3842
	btr r12,0
	jmp LB_3843
LB_3842:
	bts r12,0
LB_3843:
	call NS_E_3791
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_3790
 ; {>  %_3790~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_3793:
LB_3845:
	cmp r15,0
	jz LB_3846
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3845
LB_3846:
; ∎ %_3768
 ; {>  %_3769~1':_r64 %_3768~2':_r64 %_3771~3':_r64 %_3770~0':_r64 }
; 	∎ 2'
	bt r12,1
	jc LB_3847
	mov rdi,r14
	call dlt
LB_3847:
	bt r12,3
	jc LB_3848
	mov rdi,r9
	call dlt
LB_3848:
	bt r12,0
	jc LB_3849
	mov rdi,r13
	call dlt
LB_3849:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_3850
	btr r12,0
	jmp LB_3851
LB_3850:
	bts r12,0
LB_3851:
	ret
MTC_LB_3844:
NS_E_3857:
NS_E_RDI_3857:
; » 0xr14 |~ {  } ⊢ %_3852 : %_3852
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_3852
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_3853 : %_3853
 ; {>  %_3852~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_3853
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_3854 : %_3854
 ; {>  %_3853~1':_r64 %_3852~0':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_3854
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _f3791 { %_3852 %_3853 %_3854 } ⊢ %_3855 : %_3855
 ; {>  %_3853~1':_r64 %_3852~0':_r64 %_3854~2':_r64 }
; _f3791 { 0' 1' 2' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_3791
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 %_3855 ⊢ %_3856 : %_3856
 ; {>  %_3855~0':_r64 }
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
; ∎ {  }
 ; {>  %_3856~0':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_3858
	mov rdi,r13
	call dlt
LB_3858:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_3889:
; 	|» { 0' 1' 2' }
NS_E_RDI_3889:
; _f33 { %_3860 %_3859 } ⊢ { %_3862 %_3863 %_3864 } : { %_3862 %_3863 %_3864 }
 ; {>  %_3861~2':_r64 %_3859~0':_r64 %_3860~1':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
MTC_LB_3890:
	mov QWORD rax,0x0
	cmp rax,r9
	jnz MTC_LB_3891
LB_3892:
	cmp r15,0
	jz LB_3893
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3892
LB_3893:
; _f38 %_3863 ⊢ %_3865 : %_3865
 ; {>  %_3861~2':_r64 %_3862~1':_r64 %_3863~0':_r64 }
	sub r13,1
; _f3889 { %_3865 %_3862 %_3861 } ⊢ { %_3866 %_3867 %_3868 %_3869 } : { %_3866 %_3867 %_3868 %_3869 }
 ; {>  %_3861~2':_r64 %_3862~1':_r64 %_3865~0':_r64 }
; _f3889 { 0' 1' 2' } ⊢ { 0' 1' 2' 3' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_3889
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f39 %_3866 ⊢ %_3870 : %_3870
 ; {>  %_3868~2':_r64 %_3866~0':_r64 %_3867~1':_r64 %_3869~3':_r64 }
	add r13,1
; _f38 %_3867 ⊢ %_3871 : %_3871
 ; {>  %_3868~2':_r64 %_3870~0':_r64 %_3867~1':_r64 %_3869~3':_r64 }
	sub r14,1
; _f3889 { %_3871 %_3868 %_3870 } ⊢ { %_3872 %_3873 %_3874 %_3875 } : { %_3872 %_3873 %_3874 %_3875 }
 ; {>  %_3871~1':_r64 %_3868~2':_r64 %_3870~0':_r64 %_3869~3':_r64 }
; _f3889 { 1' 2' 0' } ⊢ { 0' 1' 2' 4' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 2' 0' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_3896
	btr r12,3
	jmp LB_3897
LB_3896:
	bts r12,3
LB_3897:
	mov r8,r13
	bt r12,0
	jc LB_3898
	btr r12,2
	jmp LB_3899
LB_3898:
	bts r12,2
LB_3899:
	mov r13,r14
	bt r12,1
	jc LB_3900
	btr r12,0
	jmp LB_3901
LB_3900:
	bts r12,0
LB_3901:
	mov r14,r9
	bt r12,3
	jc LB_3902
	btr r12,1
	jmp LB_3903
LB_3902:
	bts r12,1
LB_3903:
	call NS_E_3889
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 4' }
	mov r10,r9
	bt r12,3
	jc LB_3904
	btr r12,4
	jmp LB_3905
LB_3904:
	bts r12,4
LB_3905:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_3894
	btr r12,3
	jmp LB_3895
LB_3894:
	bts r12,3
LB_3895:
	add rsp,16
; _f39 %_3872 ⊢ %_3876 : %_3876
 ; {>  %_3875~4':_r64 %_3872~0':_r64 %_3873~1':_r64 %_3874~2':_r64 %_3869~3':_r64 }
	add r13,1
; _f38 %_3873 ⊢ %_3877 : %_3877
 ; {>  %_3875~4':_r64 %_3873~1':_r64 %_3874~2':_r64 %_3869~3':_r64 %_3876~0':_r64 }
	sub r14,1
; _f3889 { %_3877 %_3874 %_3876 } ⊢ { %_3878 %_3879 %_3880 %_3881 } : { %_3878 %_3879 %_3880 %_3881 }
 ; {>  %_3875~4':_r64 %_3877~1':_r64 %_3874~2':_r64 %_3869~3':_r64 %_3876~0':_r64 }
; _f3889 { 1' 2' 0' } ⊢ { 0' 1' 2' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 2' 0' } ⊢ { 0' 1' 2' }
	mov r9,r8
	bt r12,2
	jc LB_3910
	btr r12,3
	jmp LB_3911
LB_3910:
	bts r12,3
LB_3911:
	mov r8,r13
	bt r12,0
	jc LB_3912
	btr r12,2
	jmp LB_3913
LB_3912:
	bts r12,2
LB_3913:
	mov r13,r14
	bt r12,1
	jc LB_3914
	btr r12,0
	jmp LB_3915
LB_3914:
	bts r12,0
LB_3915:
	mov r14,r9
	bt r12,3
	jc LB_3916
	btr r12,1
	jmp LB_3917
LB_3916:
	bts r12,1
LB_3917:
	call NS_E_3889
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 5' }
	mov r11,r9
	bt r12,3
	jc LB_3918
	btr r12,5
	jmp LB_3919
LB_3918:
	bts r12,5
LB_3919:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3908
	btr r12,4
	jmp LB_3909
LB_3908:
	bts r12,4
LB_3909:
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_3906
	btr r12,3
	jmp LB_3907
LB_3906:
	bts r12,3
LB_3907:
	add rsp,24
; _f39 %_3878 ⊢ %_3882 : %_3882
 ; {>  %_3880~2':_r64 %_3875~4':_r64 %_3881~5':_r64 %_3878~0':_r64 %_3879~1':_r64 %_3869~3':_r64 }
	add r13,1
; _f3889 { %_3869 %_3875 %_3881 } ⊢ { %_3883 %_3884 %_3885 %_3886 } : { %_3883 %_3884 %_3885 %_3886 }
 ; {>  %_3880~2':_r64 %_3882~0':_r64 %_3875~4':_r64 %_3881~5':_r64 %_3879~1':_r64 %_3869~3':_r64 }
; _f3889 { 3' 4' 5' } ⊢ { 3' 4' 5' 6' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0001110.. |},{ 3' 4' 5' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,3
	jc LB_3926
	btr r12,0
	jmp LB_3927
LB_3926:
	bts r12,0
LB_3927:
	mov r14,r10
	bt r12,4
	jc LB_3928
	btr r12,1
	jmp LB_3929
LB_3928:
	bts r12,1
LB_3929:
	mov r8,r11
	bt r12,5
	jc LB_3930
	btr r12,2
	jmp LB_3931
LB_3930:
	bts r12,2
LB_3931:
	call NS_E_3889
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 3' 4' 5' 6' }
	mov r10,r14
	bt r12,1
	jc LB_3932
	btr r12,4
	jmp LB_3933
LB_3932:
	bts r12,4
LB_3933:
	mov r11,r8
	bt r12,2
	jc LB_3934
	btr r12,5
	jmp LB_3935
LB_3934:
	bts r12,5
LB_3935:
	mov rcx,r9
	bt r12,3
	jc LB_3936
	btr r12,6
	jmp LB_3937
LB_3936:
	bts r12,6
LB_3937:
	mov r9,r13
	bt r12,0
	jc LB_3938
	btr r12,3
	jmp LB_3939
LB_3938:
	bts r12,3
LB_3939:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_3924
	btr r12,2
	jmp LB_3925
LB_3924:
	bts r12,2
LB_3925:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3922
	btr r12,1
	jmp LB_3923
LB_3922:
	bts r12,1
LB_3923:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3920
	btr r12,0
	jmp LB_3921
LB_3920:
	bts r12,0
LB_3921:
	add rsp,32
; ∎ { %_3879 %_3880 %_3882 %_3886 }
 ; {>  %_3883~3':_r64 %_3880~2':_r64 %_3882~0':_r64 %_3885~5':_r64 %_3879~1':_r64 %_3886~6':_r64 %_3884~4':_r64 }
; 	∎ { 1' 2' 0' 6' }
	bt r12,3
	jc LB_3940
	mov rdi,r9
	call dlt
LB_3940:
	bt r12,5
	jc LB_3941
	mov rdi,r11
	call dlt
LB_3941:
	bt r12,4
	jc LB_3942
	mov rdi,r10
	call dlt
LB_3942:
; _emt_mov_ptn_to_ptn:{| 11100010.. |},{ 1' 2' 0' 6' } ⊢ { 0' 1' 2' 3' }
	mov r9,rcx
	bt r12,6
	jc LB_3943
	btr r12,3
	jmp LB_3944
LB_3943:
	bts r12,3
LB_3944:
	mov r10,r8
	bt r12,2
	jc LB_3945
	btr r12,4
	jmp LB_3946
LB_3945:
	bts r12,4
LB_3946:
	mov r8,r13
	bt r12,0
	jc LB_3947
	btr r12,2
	jmp LB_3948
LB_3947:
	bts r12,2
LB_3948:
	mov r13,r14
	bt r12,1
	jc LB_3949
	btr r12,0
	jmp LB_3950
LB_3949:
	bts r12,0
LB_3950:
	mov r14,r10
	bt r12,4
	jc LB_3951
	btr r12,1
	jmp LB_3952
LB_3951:
	bts r12,1
LB_3952:
	ret
MTC_LB_3891:
LB_3954:
	cmp r15,0
	jz LB_3955
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3954
LB_3955:
; _f36 %_3861 ⊢ { %_3887 %_3888 } : { %_3887 %_3888 }
 ; {>  %_3861~2':_r64 %_3864~3':_r64 %_3862~1':_r64 %_3863~0':_r64 }
	mov r10,r8
	bts r12,4
; ∎ { %_3863 %_3862 %_3887 %_3888 }
 ; {>  %_3887~2':_r64 %_3864~3':_r64 %_3862~1':_r64 %_3863~0':_r64 %_3888~4':_r64 }
; 	∎ { 0' 1' 2' 4' }
	bt r12,3
	jc LB_3956
	mov rdi,r9
	call dlt
LB_3956:
; _emt_mov_ptn_to_ptn:{| 111010.. |},{ 0' 1' 2' 4' } ⊢ { 0' 1' 2' 3' }
	mov r9,r10
	bt r12,4
	jc LB_3957
	btr r12,3
	jmp LB_3958
LB_3957:
	bts r12,3
LB_3958:
	ret
MTC_LB_3953:
NS_E_3968:
; 	|» 0'
NS_E_RDI_3968:
MTC_LB_3969:
	mov QWORD rax,0x0
	cmp rax,r13
	jnz MTC_LB_3970
LB_3971:
	cmp r15,0
	jz LB_3972
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3971
LB_3972:
; » 0xr1 |~ {  } ⊢ %_3960 : %_3960
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_3960
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; ∎ %_3960
 ; {>  %_3960~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_3970:
	mov QWORD rax,0x1
	cmp rax,r13
	jnz MTC_LB_3973
LB_3974:
	cmp r15,0
	jz LB_3975
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3974
LB_3975:
; » 0xr1 |~ {  } ⊢ %_3961 : %_3961
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_3961
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; ∎ %_3961
 ; {>  %_3961~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_3973:
LB_3977:
	cmp r15,0
	jz LB_3978
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3977
LB_3978:
; _f36 %_3959 ⊢ { %_3962 %_3963 } : { %_3962 %_3963 }
 ; {>  %_3959~0':_r64 }
	mov r14,r13
	bts r12,1
; _f38 %_3963 ⊢ %_3964 : %_3964
 ; {>  %_3962~0':_r64 %_3963~1':_r64 }
	sub r14,1
; _f3968 %_3964 ⊢ %_3965 : %_3965
 ; {>  %_3962~0':_r64 %_3964~1':_r64 }
; _f3968 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3981
	btr r12,0
	jmp LB_3982
LB_3981:
	bts r12,0
LB_3982:
	call NS_E_3968
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3983
	btr r12,1
	jmp LB_3984
LB_3983:
	bts r12,1
LB_3984:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3979
	btr r12,0
	jmp LB_3980
LB_3979:
	bts r12,0
LB_3980:
	add rsp,16
; _f40 { %_3962 %_3965 } ⊢ { %_3966 %_3967 } : { %_3966 %_3967 }
 ; {>  %_3965~1':_r64 %_3962~0':_r64 }
	imul r13,r14
; ∎ %_3966
 ; {>  %_3966~0':_r64 %_3967~1':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_3985
	mov rdi,r14
	call dlt
LB_3985:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_3976:
NS_E_3990:
NS_E_RDI_3990:
; » 0xr0 |~ {  } ⊢ %_3986 : %_3986
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_3986
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; » 0xr4 |~ {  } ⊢ %_3987 : %_3987
 ; {>  %_3986~0':_r64 }
; 	» 0xr4 _ ⊢ 1' : %_3987
	mov rdi,0x4
	mov r14,rdi
	bts r12,1
; _f3968 %_3987 ⊢ %_3988 : %_3988
 ; {>  %_3987~1':_r64 %_3986~0':_r64 }
; _f3968 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3993
	btr r12,0
	jmp LB_3994
LB_3993:
	bts r12,0
LB_3994:
	call NS_E_3968
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_3995
	btr r12,1
	jmp LB_3996
LB_3995:
	bts r12,1
LB_3996:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3991
	btr r12,0
	jmp LB_3992
LB_3991:
	bts r12,0
LB_3992:
	add rsp,16
; _f21 %_3988 ⊢ %_3989 : %_3989
 ; {>  %_3988~1':_r64 %_3986~0':_r64 }
; _f21 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3999
	btr r12,0
	jmp LB_4000
LB_3999:
	bts r12,0
LB_4000:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_4001
	btr r12,1
	jmp LB_4002
LB_4001:
	bts r12,1
LB_4002:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3997
	btr r12,0
	jmp LB_3998
LB_3997:
	bts r12,0
LB_3998:
	add rsp,16
; ∎ {  }
 ; {>  %_3989~1':_r64 %_3986~0':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_4003
	mov rdi,r14
	call dlt
LB_4003:
	bt r12,0
	jc LB_4004
	mov rdi,r13
	call dlt
LB_4004:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_4013:
NS_E_RDI_4013:
; » 0xr14 |~ {  } ⊢ %_4005 : %_4005
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_4005
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_4006 : %_4006
 ; {>  %_4005~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_4006
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_4007 : %_4007
 ; {>  %_4005~0':_r64 %_4006~1':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_4007
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _f3889 { %_4005 %_4006 %_4007 } ⊢ { %_4008 %_4009 %_4010 %_4011 } : { %_4008 %_4009 %_4010 %_4011 }
 ; {>  %_4005~0':_r64 %_4007~2':_r64 %_4006~1':_r64 }
; _f3889 { 0' 1' 2' } ⊢ { 0' 1' 2' 3' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_3889
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 %_4011 ⊢ %_4012 : %_4012
 ; {>  %_4008~0':_r64 %_4010~2':_r64 %_4011~3':_r64 %_4009~1':_r64 }
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
	jc LB_4020
	btr r12,0
	jmp LB_4021
LB_4020:
	bts r12,0
LB_4021:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_4022
	btr r12,3
	jmp LB_4023
LB_4022:
	bts r12,3
LB_4023:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_4018
	btr r12,2
	jmp LB_4019
LB_4018:
	bts r12,2
LB_4019:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4016
	btr r12,1
	jmp LB_4017
LB_4016:
	bts r12,1
LB_4017:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4014
	btr r12,0
	jmp LB_4015
LB_4014:
	bts r12,0
LB_4015:
	add rsp,32
; ∎ {  }
 ; {>  %_4008~0':_r64 %_4010~2':_r64 %_4012~3':_r64 %_4009~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_4024
	mov rdi,r13
	call dlt
LB_4024:
	bt r12,2
	jc LB_4025
	mov rdi,r8
	call dlt
LB_4025:
	bt r12,3
	jc LB_4026
	mov rdi,r9
	call dlt
LB_4026:
	bt r12,1
	jc LB_4027
	mov rdi,r14
	call dlt
LB_4027:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_3025:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3025
	NS_E_DYN_3028:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3028
	NS_E_DYN_3029:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3029
	NS_E_DYN_3030:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3030
	NS_E_DYN_3031:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3031
	NS_E_DYN_3045:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3045
	NS_E_DYN_3088:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3088
	NS_E_DYN_3098:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3098
	NS_E_DYN_3136:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3136
	NS_E_DYN_3174:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3174
	NS_E_DYN_3212:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3212
	NS_E_DYN_3241:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3241
	NS_E_DYN_3242:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3242
	NS_E_DYN_3243:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3243
	NS_E_DYN_3378:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_3379:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_3377:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3377
	CST_DYN_3411:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_3449:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3449
	NS_E_DYN_3450:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3450
	NS_E_DYN_3451:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3451
	CST_DYN_3668:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_3719:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_3791:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3791
	CST_DYN_3857:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_3889:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3889
	NS_E_DYN_3968:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3968
	CST_DYN_3990:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_4013:
		dq 0x0000_0001_00_82_ffff
		dq 1
