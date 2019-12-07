%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_27052
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
NS_E_27032:
NS_E_RDI_27032:
NS_E_27032_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_27033
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_27033:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_27035:
NS_E_RDI_27035:
NS_E_27035_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_27035_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_27035_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_27036:
NS_E_RDI_27036:
NS_E_27036_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_27036_LB_0
	cmp r11,57
	ja NS_E_27036_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_27036_LB_0:
	mov rax,0
	ret
NS_E_27038:
NS_E_RDI_27038:
NS_E_27038_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_27038_LB_0
	cmp r11,122
	ja NS_E_27038_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_27038_LB_0:
	mov rax,0
	ret
NS_E_27037:
NS_E_RDI_27037:
NS_E_27037_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_27037_LB_0
	cmp r11,90
	ja NS_E_27037_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_27037_LB_0:
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
	mov rdi,r13
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
NS_E_27034:
NS_E_RDI_27034:
NS_E_27034_ETR_TBL:
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
	jz NS_E_27034_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_27034_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_27052:
NS_E_RDI_27052:
; 	» "-27686gg" _ ⊢ 0' : %_27039
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr6 |~ {  } ⊢ %_27040 : %_27040
 ; {>  %_27039~0':_stg }
; 	» 0xr6 _ ⊢ 1' : %_27040
	mov rdi,0x6
	mov r14,rdi
	bts r12,1
; » 0xr2 |~ {  } ⊢ %_27041 : %_27041
 ; {>  %_27039~0':_stg %_27040~1':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_27041
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f14 %_27040 ⊢ { %_27042 %_27043 } : { %_27042 %_27043 }
 ; {>  %_27041~2':_r64 %_27039~0':_stg %_27040~1':_r64 }
; _f14 1' ⊢ { 1' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_27057
	btr r12,0
	jmp LB_27058
LB_27057:
	bts r12,0
LB_27058:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 3' }
	mov r9,r14
	bt r12,1
	jc LB_27059
	btr r12,3
	jmp LB_27060
LB_27059:
	bts r12,3
LB_27060:
	mov r14,r13
	bt r12,0
	jc LB_27061
	btr r12,1
	jmp LB_27062
LB_27061:
	bts r12,1
LB_27062:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_27055
	btr r12,2
	jmp LB_27056
LB_27055:
	bts r12,2
LB_27056:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_27053
	btr r12,0
	jmp LB_27054
LB_27053:
	bts r12,0
LB_27054:
	add rsp,24
; _f15 { %_27039 %_27041 } ⊢ { %_27044 %_27045 %_27046 } : { %_27044 %_27045 %_27046 }
 ; {>  %_27041~2':_r64 %_27042~1':_r64 %_27043~3':_stg %_27039~0':_stg }
; _f15 { 0' 2' } ⊢ { 0' 2' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_27067
	btr r12,1
	jmp LB_27068
LB_27067:
	bts r12,1
LB_27068:
	call NS_E_15
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 2' 4' }
	mov r10,r8
	bt r12,2
	jc LB_27069
	btr r12,4
	jmp LB_27070
LB_27069:
	bts r12,4
LB_27070:
	mov r8,r14
	bt r12,1
	jc LB_27071
	btr r12,2
	jmp LB_27072
LB_27071:
	bts r12,2
LB_27072:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_27065
	btr r12,3
	jmp LB_27066
LB_27065:
	bts r12,3
LB_27066:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_27063
	btr r12,1
	jmp LB_27064
LB_27063:
	bts r12,1
LB_27064:
	add rsp,24
; _f16 { %_27043 %_27045 %_27046 } ⊢ { %_27047 %_27048 %_27049 } : { %_27047 %_27048 %_27049 }
 ; {>  %_27042~1':_r64 %_27043~3':_stg %_27046~4':_r64 %_27044~0':_stg %_27045~2':_r64 }
; _f16 { 3' 2' 4' } ⊢ { 2' 3' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 001110.. |},{ 3' 2' 4' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,3
	jc LB_27077
	btr r12,0
	jmp LB_27078
LB_27077:
	bts r12,0
LB_27078:
	mov r14,r8
	bt r12,2
	jc LB_27079
	btr r12,1
	jmp LB_27080
LB_27079:
	bts r12,1
LB_27080:
	mov r8,r10
	bt r12,4
	jc LB_27081
	btr r12,2
	jmp LB_27082
LB_27081:
	bts r12,2
LB_27082:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 2' 3' 4' }
	mov r9,r14
	bt r12,1
	jc LB_27083
	btr r12,3
	jmp LB_27084
LB_27083:
	bts r12,3
LB_27084:
	mov r10,r8
	bt r12,2
	jc LB_27085
	btr r12,4
	jmp LB_27086
LB_27085:
	bts r12,4
LB_27086:
	mov r8,r13
	bt r12,0
	jc LB_27087
	btr r12,2
	jmp LB_27088
LB_27087:
	bts r12,2
LB_27088:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_27075
	btr r12,1
	jmp LB_27076
LB_27075:
	bts r12,1
LB_27076:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_27073
	btr r12,0
	jmp LB_27074
LB_27073:
	bts r12,0
LB_27074:
	add rsp,24
; _f20 %_27044 ⊢ %_27050 : %_27050
 ; {>  %_27042~1':_r64 %_27048~3':_r64 %_27044~0':_stg %_27049~4':_r64 %_27047~2':_stg }
; _f20 0' ⊢ 0'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_27095
	btr r12,4
	jmp LB_27096
LB_27095:
	bts r12,4
LB_27096:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_27093
	btr r12,3
	jmp LB_27094
LB_27093:
	bts r12,3
LB_27094:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_27091
	btr r12,2
	jmp LB_27092
LB_27091:
	bts r12,2
LB_27092:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_27089
	btr r12,1
	jmp LB_27090
LB_27089:
	bts r12,1
LB_27090:
	add rsp,40
; _f20 %_27049 ⊢ %_27051 : %_27051
 ; {>  %_27042~1':_r64 %_27050~0':_stg %_27048~3':_r64 %_27049~4':_r64 %_27047~2':_stg }
; _f20 4' ⊢ 4'
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
	jc LB_27105
	btr r12,0
	jmp LB_27106
LB_27105:
	bts r12,0
LB_27106:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_27107
	btr r12,4
	jmp LB_27108
LB_27107:
	bts r12,4
LB_27108:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_27103
	btr r12,3
	jmp LB_27104
LB_27103:
	bts r12,3
LB_27104:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_27101
	btr r12,2
	jmp LB_27102
LB_27101:
	bts r12,2
LB_27102:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_27099
	btr r12,1
	jmp LB_27100
LB_27099:
	bts r12,1
LB_27100:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_27097
	btr r12,0
	jmp LB_27098
LB_27097:
	bts r12,0
LB_27098:
	add rsp,40
; ∎ {  }
 ; {>  %_27051~4':_r64 %_27042~1':_r64 %_27050~0':_stg %_27048~3':_r64 %_27047~2':_stg }
; 	∎ {  }
	bt r12,4
	jc LB_27109
	mov rdi,r10
	call dlt
LB_27109:
	bt r12,1
	jc LB_27110
	mov rdi,r14
	call dlt
LB_27110:
	bt r12,0
	jc LB_27111
	mov rdi,r13
	call dlt
LB_27111:
	bt r12,3
	jc LB_27112
	mov rdi,r9
	call dlt
LB_27112:
	bt r12,2
	jc LB_27113
	mov rdi,r8
	call dlt
LB_27113:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_27121:
; 	|» 0'
NS_E_RDI_27121:
MTC_LB_27122:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_27123
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_27124
	bt QWORD [rax],0
	jc LB_27125
	btr r12,0
	jmp LB_27126
LB_27125:
	bts r12,0
LB_27126:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_27124:
	push r13
	mov r13,rax
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_27129
	btr r12,3
	jmp LB_27130
LB_27129:
	bts r12,3
LB_27130:
	mov r14,r9
	bt r12,3
	jc LB_27127
	btr r12,1
	jmp LB_27128
LB_27127:
	bts r12,1
LB_27128:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_27133
	btr r12,3
	jmp LB_27134
LB_27133:
	bts r12,3
LB_27134:
	mov r8,r9
	bt r12,3
	jc LB_27131
	btr r12,2
	jmp LB_27132
LB_27131:
	bts r12,2
LB_27132:
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_27123
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_27135
	bt QWORD [rax],0
	jc LB_27136
	btr r12,2
	jmp LB_27137
LB_27136:
	bts r12,2
LB_27137:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_27135:
	push r8
	mov r8,rax
	mov rdi,r8
	mov r11,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_27140
	btr r12,5
	jmp LB_27141
LB_27140:
	bts r12,5
LB_27141:
	mov r9,r11
	bt r12,5
	jc LB_27138
	btr r12,3
	jmp LB_27139
LB_27138:
	bts r12,3
LB_27139:
	mov rdi,r8
	mov r11,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_27144
	btr r12,5
	jmp LB_27145
LB_27144:
	bts r12,5
LB_27145:
	mov r10,r11
	bt r12,5
	jc LB_27142
	btr r12,4
	jmp LB_27143
LB_27142:
	bts r12,4
LB_27143:
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r8
LB_27146:
	cmp r15,0
	jz LB_27147
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_27146
LB_27147:
; ∎ {  }
 ; {>  %_27115~1':t7205'(-1) %_27118~4':(_lst)◂(t7205'(-1)) %_27117~3':t7205'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_27148
	mov rdi,r14
	call dlt
LB_27148:
	bt r12,4
	jc LB_27149
	mov rdi,r10
	call dlt
LB_27149:
	bt r12,3
	jc LB_27150
	mov rdi,r9
	call dlt
LB_27150:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_27123:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_27151
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_27152
	bt QWORD [rax],0
	jc LB_27153
	btr r12,0
	jmp LB_27154
LB_27153:
	bts r12,0
LB_27154:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_27152:
	push r13
	mov r13,rax
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_27157
	btr r12,3
	jmp LB_27158
LB_27157:
	bts r12,3
LB_27158:
	mov r14,r9
	bt r12,3
	jc LB_27155
	btr r12,1
	jmp LB_27156
LB_27155:
	bts r12,1
LB_27156:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_27161
	btr r12,3
	jmp LB_27162
LB_27161:
	bts r12,3
LB_27162:
	mov r8,r9
	bt r12,3
	jc LB_27159
	btr r12,2
	jmp LB_27160
LB_27159:
	bts r12,2
LB_27160:
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_27151
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂{  }
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_27163
	bt QWORD [rax],0
	jc LB_27164
	btr r12,2
	jmp LB_27165
LB_27164:
	bts r12,2
LB_27165:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_27163:
	push r8
	mov r8,rax
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r8
LB_27166:
	cmp r15,0
	jz LB_27167
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_27166
LB_27167:
; ∎ {  }
 ; {>  %_27119~1':t7205'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_27168
	mov rdi,r14
	call dlt
LB_27168:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_27151:
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_27169
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_27170
	bt QWORD [rax],0
	jc LB_27171
	btr r12,0
	jmp LB_27172
LB_27171:
	bts r12,0
LB_27172:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_27170:
	push r13
	mov r13,rax
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
LB_27173:
	cmp r15,0
	jz LB_27174
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_27173
LB_27174:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_27169:
section .data
	NS_E_DYN_27032:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_27032
	NS_E_DYN_27035:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_27035
	NS_E_DYN_27036:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_27036
	NS_E_DYN_27037:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_27037
	NS_E_DYN_27038:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_27038
	CST_DYN_27052:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_27121:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_27121
