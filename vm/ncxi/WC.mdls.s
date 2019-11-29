%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_1178
	call NS_E_1230
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
NS_E_1062:
NS_E_RDI_1062:
NS_E_1062_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_1062_LB_0
	bt r11,7
	jc LB_1063
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
LB_1063:
	add rsi,1
	bt r11,6
	jc LB_1064
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
LB_1064:
	add rsi,1
	bt r11,5
	jc LB_1065
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
LB_1065:
	add rsi,1
	bt r11,5
	jc LB_1065
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
NS_E_1062_LB_0:
	mov rax,0
	ret
NS_E_1066:
NS_E_RDI_1066:
NS_E_1066_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_1066_LB_0
	cmp r11,57
	ja NS_E_1066_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1066_LB_0:
	mov rax,0
	ret
NS_E_1068:
NS_E_RDI_1068:
NS_E_1068_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_1068_LB_0
	cmp r11,122
	ja NS_E_1068_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1068_LB_0:
	mov rax,0
	ret
NS_E_1067:
NS_E_RDI_1067:
NS_E_1067_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_1067_LB_0
	cmp r11,90
	ja NS_E_1067_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1067_LB_0:
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
NS_E_1096:
; 	|» { 0' 1' 2' }
NS_E_RDI_1096:
; _f26 { %_1070 %_1069 } ⊢ { %_1072 %_1073 %_1074 } : { %_1072 %_1073 %_1074 }
 ; {>  %_1071~2':_r64 %_1070~1':_r64 %_1069~0':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_1163
	bt r12,3
	jc LB_1162
	mov rdi,r8
	call dlt
LB_1162:
	jmp MTC_LB_1161
LB_1163:
; _emt_mov_ptn_to_ptn 3' ⊢ 4'
	mov r9,r8
	bt r12,3
	jc LB_1164
	btr r12,4
	jmp LB_1165
LB_1164:
	bts r12,4
LB_1165:
; /0/
	jmp MTC_LB_1160
MTC_LB_1161:
; _f29 %_1073 ⊢ { %_1076 %_1077 } : { %_1076 %_1077 }
 ; {>  %_1074~3':_r64 %_1071~2':_r64 %_1073~0':_r64 %_1072~1':_r64 }
	mov r9,r13
; _f29 %_1072 ⊢ { %_1078 %_1079 } : { %_1078 %_1079 }
 ; {>  %_1074~3':_r64 %_1071~2':_r64 %_1076~0':_r64 %_1072~1':_r64 %_1077~4':_r64 }
	mov r10,r14
; _f29 %_1071 ⊢ { %_1080 %_1081 } : { %_1080 %_1081 }
 ; {>  %_1074~3':_r64 %_1071~2':_r64 %_1078~1':_r64 %_1076~0':_r64 %_1077~4':_r64 %_1079~5':_r64 }
	mov r11,r15
; _f31 %_1077 ⊢ %_1082 : %_1082
 ; {>  %_1081~6':_r64 %_1074~3':_r64 %_1080~2':_r64 %_1078~1':_r64 %_1076~0':_r64 %_1077~4':_r64 %_1079~5':_r64 }
	sub r9,1
; _f1096 { %_1082 %_1079 %_1081 } ⊢ %_1083 : %_1083
 ; {>  %_1081~6':_r64 %_1074~3':_r64 %_1080~2':_r64 %_1078~1':_r64 %_1076~0':_r64 %_1082~4':_r64 %_1079~5':_r64 }
; _f1096 { 4' 5' 6' } ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 6' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,4
	jc LB_1105
	btr r12,0
	jmp LB_1106
LB_1105:
	bts r12,0
LB_1106:
	mov r14,r10
	bt r12,5
	jc LB_1107
	btr r12,1
	jmp LB_1108
LB_1107:
	bts r12,1
LB_1108:
	mov r15,r11
	bt r12,6
	jc LB_1109
	btr r12,2
	jmp LB_1110
LB_1109:
	bts r12,2
LB_1110:
	call NS_E_1096
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_1111
	btr r12,4
	jmp LB_1112
LB_1111:
	bts r12,4
LB_1112:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1103
	btr r12,3
	jmp LB_1104
LB_1103:
	bts r12,3
LB_1104:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1101
	btr r12,2
	jmp LB_1102
LB_1101:
	bts r12,2
LB_1102:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1099
	btr r12,1
	jmp LB_1100
LB_1099:
	bts r12,1
LB_1100:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1097
	btr r12,0
	jmp LB_1098
LB_1097:
	bts r12,0
LB_1098:
	add rsp,40
; _f29 %_1076 ⊢ { %_1084 %_1085 } : { %_1084 %_1085 }
 ; {>  %_1074~3':_r64 %_1080~2':_r64 %_1078~1':_r64 %_1076~0':_r64 %_1083~4':_r64 }
	mov r10,r13
; _f29 %_1078 ⊢ { %_1086 %_1087 } : { %_1086 %_1087 }
 ; {>  %_1074~3':_r64 %_1085~5':_r64 %_1080~2':_r64 %_1078~1':_r64 %_1083~4':_r64 %_1084~0':_r64 }
	mov r11,r14
; _f29 %_1080 ⊢ { %_1088 %_1089 } : { %_1088 %_1089 }
 ; {>  %_1087~6':_r64 %_1074~3':_r64 %_1085~5':_r64 %_1080~2':_r64 %_1083~4':_r64 %_1084~0':_r64 %_1086~1':_r64 }
	mov rcx,r15
; _f31 %_1087 ⊢ %_1090 : %_1090
 ; {>  %_1087~6':_r64 %_1074~3':_r64 %_1085~5':_r64 %_1083~4':_r64 %_1084~0':_r64 %_1088~2':_r64 %_1086~1':_r64 %_1089~7':_r64 }
	sub r11,1
; _f1096 { %_1090 %_1089 %_1085 } ⊢ %_1091 : %_1091
 ; {>  %_1074~3':_r64 %_1090~6':_r64 %_1085~5':_r64 %_1083~4':_r64 %_1084~0':_r64 %_1088~2':_r64 %_1086~1':_r64 %_1089~7':_r64 }
; _f1096 { 6' 7' 5' } ⊢ 5'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 6' 7' 5' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,6
	jc LB_1123
	btr r12,0
	jmp LB_1124
LB_1123:
	bts r12,0
LB_1124:
	mov r14,rcx
	bt r12,7
	jc LB_1125
	btr r12,1
	jmp LB_1126
LB_1125:
	bts r12,1
LB_1126:
	mov r15,r10
	bt r12,5
	jc LB_1127
	btr r12,2
	jmp LB_1128
LB_1127:
	bts r12,2
LB_1128:
	call NS_E_1096
; _emt_mov_ptn_to_ptn 0' ⊢ 5'
	mov r10,r13
	bt r12,0
	jc LB_1129
	btr r12,5
	jmp LB_1130
LB_1129:
	bts r12,5
LB_1130:
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_1121
	btr r12,4
	jmp LB_1122
LB_1121:
	bts r12,4
LB_1122:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1119
	btr r12,3
	jmp LB_1120
LB_1119:
	bts r12,3
LB_1120:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1117
	btr r12,2
	jmp LB_1118
LB_1117:
	bts r12,2
LB_1118:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1115
	btr r12,1
	jmp LB_1116
LB_1115:
	bts r12,1
LB_1116:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1113
	btr r12,0
	jmp LB_1114
LB_1113:
	bts r12,0
LB_1114:
	add rsp,48
; _f31 %_1088 ⊢ %_1092 : %_1092
 ; {>  %_1074~3':_r64 %_1083~4':_r64 %_1084~0':_r64 %_1088~2':_r64 %_1086~1':_r64 %_1091~5':_r64 }
	sub r15,1
; _f1096 { %_1092 %_1084 %_1086 } ⊢ %_1093 : %_1093
 ; {>  %_1074~3':_r64 %_1083~4':_r64 %_1092~2':_r64 %_1084~0':_r64 %_1086~1':_r64 %_1091~5':_r64 }
; _f1096 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_1137
	btr r12,3
	jmp LB_1138
LB_1137:
	bts r12,3
LB_1138:
	mov r15,r14
	bt r12,1
	jc LB_1139
	btr r12,2
	jmp LB_1140
LB_1139:
	bts r12,2
LB_1140:
	mov r14,r13
	bt r12,0
	jc LB_1141
	btr r12,1
	jmp LB_1142
LB_1141:
	bts r12,1
LB_1142:
	mov r13,r8
	bt r12,3
	jc LB_1143
	btr r12,0
	jmp LB_1144
LB_1143:
	bts r12,0
LB_1144:
	call NS_E_1096
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_1135
	btr r12,5
	jmp LB_1136
LB_1135:
	bts r12,5
LB_1136:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_1133
	btr r12,4
	jmp LB_1134
LB_1133:
	bts r12,4
LB_1134:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_1131
	btr r12,3
	jmp LB_1132
LB_1131:
	bts r12,3
LB_1132:
	add rsp,32
; _f1096 { %_1083 %_1091 %_1093 } ⊢ %_1094 : %_1094
 ; {>  %_1074~3':_r64 %_1093~0':_r64 %_1083~4':_r64 %_1091~5':_r64 }
; _f1096 { 4' 5' 0' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,5
	jc LB_1147
	btr r12,1
	jmp LB_1148
LB_1147:
	bts r12,1
LB_1148:
	mov r15,r13
	bt r12,0
	jc LB_1149
	btr r12,2
	jmp LB_1150
LB_1149:
	bts r12,2
LB_1150:
	mov r13,r9
	bt r12,4
	jc LB_1151
	btr r12,0
	jmp LB_1152
LB_1151:
	bts r12,0
LB_1152:
	call NS_E_1096
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_1145
	btr r12,3
	jmp LB_1146
LB_1145:
	bts r12,3
LB_1146:
	add rsp,16
; ∎ %_1094
 ; {>  %_1074~3':_r64 %_1094~0':_r64 }
; 	∎ 0'
	bt r12,3
	jc LB_1153
	mov rdi,r8
	call dlt
LB_1153:
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
MTC_LB_1160:
; ∎ %_1071
 ; {>  %_1074~3':_r64 %_1071~2':_r64 %_1095~4':_r64 %_1073~0':_r64 %_1072~1':_r64 }
; 	∎ 2'
	bt r12,3
	jc LB_1154
	mov rdi,r8
	call dlt
LB_1154:
	bt r12,4
	jc LB_1155
	mov rdi,r9
	call dlt
LB_1155:
	bt r12,0
	jc LB_1156
	mov rdi,r13
	call dlt
LB_1156:
	bt r12,1
	jc LB_1157
	mov rdi,r14
	call dlt
LB_1157:
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_1158
	btr r12,0
	jmp LB_1159
LB_1158:
	bts r12,0
LB_1159:
	ret
NS_E_1178:
NS_E_RDI_1178:
; » 0xraa |~ {  } ⊢ %_1166 : %_1166
 ; {>  }
; 	» 0xraa _ ⊢ 0' : %_1166
	mov rdi,0xaa
	mov r13,rdi
	bts r12,0
; » 0xr87 |~ {  } ⊢ %_1167 : %_1167
 ; {>  %_1166~0':_r64 }
; 	» 0xr87 _ ⊢ 1' : %_1167
	mov rdi,0x87
	mov r14,rdi
	bts r12,1
; _f26 { %_1166 %_1167 } ⊢ { %_1168 %_1169 %_1170 } : { %_1168 %_1169 %_1170 }
 ; {>  %_1166~0':_r64 %_1167~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r15,rsi
	bts r12,2
; /0
	mov QWORD rax,0x0
	cmp rax,r13
	jnz LB_1218
	bt r12,0
	jc LB_1217
	mov rdi,r13
	call dlt
LB_1217:
	jmp MTC_LB_1216
LB_1218:
; /0/0
	mov QWORD rax,0xab
	cmp rax,r13
	jnz LB_1220
	bt r12,0
	jc LB_1219
	mov rdi,r13
	call dlt
LB_1219:
	jmp MTC_LB_1215
LB_1220:
; /0/0/0
	mov QWORD rax,0xaa
	cmp rax,r13
	jnz LB_1222
	bt r12,0
	jc LB_1221
	mov rdi,r13
	call dlt
LB_1221:
	jmp MTC_LB_1214
LB_1222:
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_1223
	btr r12,3
	jmp LB_1224
LB_1223:
	bts r12,3
LB_1224:
; /0/0/0/
	jmp MTC_LB_1213
MTC_LB_1216:
; ∎ {  }
 ; {>  %_1170~2':_r64 %_1169~1':_r64 %_1168~0':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_1179
	mov rdi,r15
	call dlt
LB_1179:
	bt r12,1
	jc LB_1180
	mov rdi,r14
	call dlt
LB_1180:
	bt r12,0
	jc LB_1181
	mov rdi,r13
	call dlt
LB_1181:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_1215:
; ∎ {  }
 ; {>  %_1170~2':_r64 %_1169~1':_r64 %_1168~0':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_1182
	mov rdi,r15
	call dlt
LB_1182:
	bt r12,1
	jc LB_1183
	mov rdi,r14
	call dlt
LB_1183:
	bt r12,0
	jc LB_1184
	mov rdi,r13
	call dlt
LB_1184:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_1214:
; 	» "AA" _ ⊢ 3' : %_1174
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_41_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r8,rdi
	btr r12,3
; _f14 %_1174 ⊢ %_1175 : %_1175
 ; {>  %_1174~3':_stg %_1170~2':_r64 %_1169~1':_r64 %_1168~0':_r64 }
; _f14 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_1191
	btr r12,0
	jmp LB_1192
LB_1191:
	bts r12,0
LB_1192:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_1193
	btr r12,3
	jmp LB_1194
LB_1193:
	bts r12,3
LB_1194:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1189
	btr r12,2
	jmp LB_1190
LB_1189:
	bts r12,2
LB_1190:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1187
	btr r12,1
	jmp LB_1188
LB_1187:
	bts r12,1
LB_1188:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1185
	btr r12,0
	jmp LB_1186
LB_1185:
	bts r12,0
LB_1186:
	add rsp,32
; ∎ {  }
 ; {>  %_1175~3':_stg %_1170~2':_r64 %_1169~1':_r64 %_1168~0':_r64 }
; 	∎ {  }
	bt r12,3
	jc LB_1195
	mov rdi,r8
	call dlt
LB_1195:
	bt r12,2
	jc LB_1196
	mov rdi,r15
	call dlt
LB_1196:
	bt r12,1
	jc LB_1197
	mov rdi,r14
	call dlt
LB_1197:
	bt r12,0
	jc LB_1198
	mov rdi,r13
	call dlt
LB_1198:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_1213:
; _f14 %_1176 ⊢ %_1177 : %_1177
 ; {>  %_1176~3':_r64 %_1170~2':_r64 %_1169~1':_r64 %_1168~0':_r64 }
; _f14 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_1205
	btr r12,0
	jmp LB_1206
LB_1205:
	bts r12,0
LB_1206:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_1207
	btr r12,3
	jmp LB_1208
LB_1207:
	bts r12,3
LB_1208:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1203
	btr r12,2
	jmp LB_1204
LB_1203:
	bts r12,2
LB_1204:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1201
	btr r12,1
	jmp LB_1202
LB_1201:
	bts r12,1
LB_1202:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1199
	btr r12,0
	jmp LB_1200
LB_1199:
	bts r12,0
LB_1200:
	add rsp,32
; ∎ {  }
 ; {>  %_1177~3':_r64 %_1170~2':_r64 %_1169~1':_r64 %_1168~0':_r64 }
; 	∎ {  }
	bt r12,3
	jc LB_1209
	mov rdi,r8
	call dlt
LB_1209:
	bt r12,2
	jc LB_1210
	mov rdi,r15
	call dlt
LB_1210:
	bt r12,1
	jc LB_1211
	mov rdi,r14
	call dlt
LB_1211:
	bt r12,0
	jc LB_1212
	mov rdi,r13
	call dlt
LB_1212:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_1230:
NS_E_RDI_1230:
; » 0xr14 |~ {  } ⊢ %_1225 : %_1225
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_1225
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_1226 : %_1226
 ; {>  %_1225~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_1226
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_1227 : %_1227
 ; {>  %_1226~1':_r64 %_1225~0':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_1227
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f1096 { %_1225 %_1226 %_1227 } ⊢ %_1228 : %_1228
 ; {>  %_1227~2':_r64 %_1226~1':_r64 %_1225~0':_r64 }
; _f1096 { 0' 1' 2' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_1096
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; _f14 %_1228 ⊢ %_1229 : %_1229
 ; {>  %_1228~0':_r64 }
; _f14 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_1229~0':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_1231
	mov rdi,r13
	call dlt
LB_1231:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_1062:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1062
	NS_E_DYN_1066:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1066
	NS_E_DYN_1067:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1067
	NS_E_DYN_1068:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1068
	NS_E_DYN_1096:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1096
	CST_DYN_1178:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_1230:
		dq 0x0001_0001_00_82_ffff
		dq 1
