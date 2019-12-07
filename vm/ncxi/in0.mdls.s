%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_1015
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
NS_E_995:
NS_E_RDI_995:
NS_E_995_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_996
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_996:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_998:
NS_E_RDI_998:
NS_E_998_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_998_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_998_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_999:
NS_E_RDI_999:
NS_E_999_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_999_LB_0
	cmp r11,57
	ja NS_E_999_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_999_LB_0:
	mov rax,0
	ret
NS_E_1001:
NS_E_RDI_1001:
NS_E_1001_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_1001_LB_0
	cmp r11,122
	ja NS_E_1001_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1001_LB_0:
	mov rax,0
	ret
NS_E_1000:
NS_E_RDI_1000:
NS_E_1000_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_1000_LB_0
	cmp r11,90
	ja NS_E_1000_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1000_LB_0:
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
NS_E_997:
NS_E_RDI_997:
NS_E_997_ETR_TBL:
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
	jz NS_E_997_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_997_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1015:
NS_E_RDI_1015:
; 	» "-27686gg" _ ⊢ 0' : %_1002
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_67_67_36_38_36_37_32_2d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; » 0xr6 |~ {  } ⊢ %_1003 : %_1003
 ; {>  %_1002~0':_stg }
; 	» 0xr6 _ ⊢ 1' : %_1003
	mov rdi,0x6
	mov r14,rdi
	bts r12,1
; » 0xr4 |~ {  } ⊢ %_1004 : %_1004
 ; {>  %_1003~1':_r64 %_1002~0':_stg }
; 	» 0xr4 _ ⊢ 2' : %_1004
	mov rdi,0x4
	mov r8,rdi
	bts r12,2
; » 0xr5 |~ {  } ⊢ %_1005 : %_1005
 ; {>  %_1003~1':_r64 %_1004~2':_r64 %_1002~0':_stg }
; 	» 0xr5 _ ⊢ 3' : %_1005
	mov rdi,0x5
	mov r9,rdi
	bts r12,3
; » 0xr2 |~ {  } ⊢ %_1006 : %_1006
 ; {>  %_1003~1':_r64 %_1004~2':_r64 %_1005~3':_r64 %_1002~0':_stg }
; 	» 0xr2 _ ⊢ 4' : %_1006
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f14 %_1003 ⊢ { %_1007 %_1008 } : { %_1007 %_1008 }
 ; {>  %_1006~4':_r64 %_1003~1':_r64 %_1004~2':_r64 %_1005~3':_r64 %_1002~0':_stg }
; _f14 1' ⊢ { 1' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp+8+8*3],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1024
	btr r12,0
	jmp LB_1025
LB_1024:
	bts r12,0
LB_1025:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 5' }
	mov r11,r14
	bt r12,1
	jc LB_1026
	btr r12,5
	jmp LB_1027
LB_1026:
	bts r12,5
LB_1027:
	mov r14,r13
	bt r12,0
	jc LB_1028
	btr r12,1
	jmp LB_1029
LB_1028:
	bts r12,1
LB_1029:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*3]
	bt QWORD rax,4
	jc LB_1022
	btr r12,4
	jmp LB_1023
LB_1022:
	bts r12,4
LB_1023:
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1020
	btr r12,3
	jmp LB_1021
LB_1020:
	bts r12,3
LB_1021:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1018
	btr r12,2
	jmp LB_1019
LB_1018:
	bts r12,2
LB_1019:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1016
	btr r12,0
	jmp LB_1017
LB_1016:
	bts r12,0
LB_1017:
	add rsp,40
; _f18 { %_1004 %_1002 %_1005 %_1008 %_1006 } ⊢ { %_1009 %_1010 %_1011 %_1012 %_1013 } : { %_1009 %_1010 %_1011 %_1012 %_1013 }
 ; {>  %_1006~4':_r64 %_1007~1':_r64 %_1008~5':_stg %_1004~2':_r64 %_1005~3':_r64 %_1002~0':_stg }
; _f18 { 2' 0' 3' 5' 4' } ⊢ { 0' 2' 3' 4' 5' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1011110.. |},{ 2' 0' 3' 5' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r13
	bt r12,0
	jc LB_1032
	btr r12,1
	jmp LB_1033
LB_1032:
	bts r12,1
LB_1033:
	mov r13,r8
	bt r12,2
	jc LB_1034
	btr r12,0
	jmp LB_1035
LB_1034:
	bts r12,0
LB_1035:
	mov r8,r9
	bt r12,3
	jc LB_1036
	btr r12,2
	jmp LB_1037
LB_1036:
	bts r12,2
LB_1037:
	mov r9,r11
	bt r12,5
	jc LB_1038
	btr r12,3
	jmp LB_1039
LB_1038:
	bts r12,3
LB_1039:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 2' 3' 4' 5' }
	mov r11,r10
	bt r12,4
	jc LB_1040
	btr r12,5
	jmp LB_1041
LB_1040:
	bts r12,5
LB_1041:
	mov r10,r9
	bt r12,3
	jc LB_1042
	btr r12,4
	jmp LB_1043
LB_1042:
	bts r12,4
LB_1043:
	mov r9,r8
	bt r12,2
	jc LB_1044
	btr r12,3
	jmp LB_1045
LB_1044:
	bts r12,3
LB_1045:
	mov r8,r14
	bt r12,1
	jc LB_1046
	btr r12,2
	jmp LB_1047
LB_1046:
	bts r12,2
LB_1047:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1030
	btr r12,1
	jmp LB_1031
LB_1030:
	bts r12,1
LB_1031:
	add rsp,16
; _f21 %_1012 ⊢ %_1014 : %_1014
 ; {>  %_1009~0':_r64 %_1010~2':_stg %_1007~1':_r64 %_1011~3':_r64 %_1012~4':_stg %_1013~5':_r64 }
; _f21 4' ⊢ 4'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_1058
	btr r12,0
	jmp LB_1059
LB_1058:
	bts r12,0
LB_1059:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_1060
	btr r12,4
	jmp LB_1061
LB_1060:
	bts r12,4
LB_1061:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_1056
	btr r12,5
	jmp LB_1057
LB_1056:
	bts r12,5
LB_1057:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_1054
	btr r12,3
	jmp LB_1055
LB_1054:
	bts r12,3
LB_1055:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1052
	btr r12,2
	jmp LB_1053
LB_1052:
	bts r12,2
LB_1053:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1050
	btr r12,1
	jmp LB_1051
LB_1050:
	bts r12,1
LB_1051:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1048
	btr r12,0
	jmp LB_1049
LB_1048:
	bts r12,0
LB_1049:
	add rsp,48
; ∎ {  }
 ; {>  %_1009~0':_r64 %_1014~4':_stg %_1010~2':_stg %_1007~1':_r64 %_1011~3':_r64 %_1013~5':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_1062
	mov rdi,r13
	call dlt
LB_1062:
	bt r12,4
	jc LB_1063
	mov rdi,r10
	call dlt
LB_1063:
	bt r12,2
	jc LB_1064
	mov rdi,r8
	call dlt
LB_1064:
	bt r12,1
	jc LB_1065
	mov rdi,r14
	call dlt
LB_1065:
	bt r12,3
	jc LB_1066
	mov rdi,r9
	call dlt
LB_1066:
	bt r12,5
	jc LB_1067
	mov rdi,r11
	call dlt
LB_1067:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_1075:
; 	|» 0'
NS_E_RDI_1075:
MTC_LB_1076:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1077
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1078
	bt QWORD [rax],0
	jc LB_1079
	btr r12,0
	jmp LB_1080
LB_1079:
	bts r12,0
LB_1080:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1078:
	push r13
	mov r13,rax
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_1083
	btr r12,3
	jmp LB_1084
LB_1083:
	bts r12,3
LB_1084:
	mov r14,r9
	bt r12,3
	jc LB_1081
	btr r12,1
	jmp LB_1082
LB_1081:
	bts r12,1
LB_1082:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_1087
	btr r12,3
	jmp LB_1088
LB_1087:
	bts r12,3
LB_1088:
	mov r8,r9
	bt r12,3
	jc LB_1085
	btr r12,2
	jmp LB_1086
LB_1085:
	bts r12,2
LB_1086:
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1077
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_1089
	bt QWORD [rax],0
	jc LB_1090
	btr r12,2
	jmp LB_1091
LB_1090:
	bts r12,2
LB_1091:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1089:
	push r8
	mov r8,rax
	mov rdi,r8
	mov r11,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_1094
	btr r12,5
	jmp LB_1095
LB_1094:
	bts r12,5
LB_1095:
	mov r9,r11
	bt r12,5
	jc LB_1092
	btr r12,3
	jmp LB_1093
LB_1092:
	bts r12,3
LB_1093:
	mov rdi,r8
	mov r11,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_1098
	btr r12,5
	jmp LB_1099
LB_1098:
	bts r12,5
LB_1099:
	mov r10,r11
	bt r12,5
	jc LB_1096
	btr r12,4
	jmp LB_1097
LB_1096:
	bts r12,4
LB_1097:
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r8
LB_1100:
	cmp r15,0
	jz LB_1101
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1100
LB_1101:
; ∎ {  }
 ; {>  %_1071~3':t415'(-1) %_1072~4':(_lst)◂(t415'(-1)) %_1069~1':t415'(-1) }
; 	∎ {  }
	bt r12,3
	jc LB_1102
	mov rdi,r9
	call dlt
LB_1102:
	bt r12,4
	jc LB_1103
	mov rdi,r10
	call dlt
LB_1103:
	bt r12,1
	jc LB_1104
	mov rdi,r14
	call dlt
LB_1104:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_1077:
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1105
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1106
	bt QWORD [rax],0
	jc LB_1107
	btr r12,0
	jmp LB_1108
LB_1107:
	bts r12,0
LB_1108:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1106:
	push r13
	mov r13,rax
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_1111
	btr r12,3
	jmp LB_1112
LB_1111:
	bts r12,3
LB_1112:
	mov r14,r9
	bt r12,3
	jc LB_1109
	btr r12,1
	jmp LB_1110
LB_1109:
	bts r12,1
LB_1110:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_1115
	btr r12,3
	jmp LB_1116
LB_1115:
	bts r12,3
LB_1116:
	mov r8,r9
	bt r12,3
	jc LB_1113
	btr r12,2
	jmp LB_1114
LB_1113:
	bts r12,2
LB_1114:
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1105
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °1◂{  }
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_1117
	bt QWORD [rax],0
	jc LB_1118
	btr r12,2
	jmp LB_1119
LB_1118:
	bts r12,2
LB_1119:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1117:
	push r8
	mov r8,rax
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r8
LB_1120:
	cmp r15,0
	jz LB_1121
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1120
LB_1121:
; ∎ {  }
 ; {>  %_1073~1':t415'(-1) }
; 	∎ {  }
	bt r12,1
	jc LB_1122
	mov rdi,r14
	call dlt
LB_1122:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_1105:
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1123
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_1124
	bt QWORD [rax],0
	jc LB_1125
	btr r12,0
	jmp LB_1126
LB_1125:
	bts r12,0
LB_1126:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_1124:
	push r13
	mov r13,rax
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r13
LB_1127:
	cmp r15,0
	jz LB_1128
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1127
LB_1128:
; ∎ {  }
 ; {>  }
; 	∎ {  }
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_1123:
section .data
	NS_E_DYN_995:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_995
	NS_E_DYN_998:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_998
	NS_E_DYN_999:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_999
	NS_E_DYN_1000:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1000
	NS_E_DYN_1001:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1001
	CST_DYN_1015:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_1075:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1075
