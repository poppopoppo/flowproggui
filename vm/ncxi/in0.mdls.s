%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
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
	call emt_q
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
NS_E_70:
NS_E_RDI_70:
NS_E_70_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_71
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_71:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_73:
NS_E_RDI_73:
NS_E_73_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_73_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_73_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_74:
NS_E_RDI_74:
NS_E_74_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_74_LB_0
	cmp r11,57
	ja NS_E_74_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_74_LB_0:
	mov rax,0
	ret
NS_E_76:
NS_E_RDI_76:
NS_E_76_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_76_LB_0
	cmp r11,122
	ja NS_E_76_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_76_LB_0:
	mov rax,0
	ret
NS_E_75:
NS_E_RDI_75:
NS_E_75_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_75_LB_0
	cmp r11,90
	ja NS_E_75_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_75_LB_0:
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
	mov rdi,r8
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
	mov rax,r15
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
	mov rax,r15
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
	mov r15,rax
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
NS_E_72:
NS_E_RDI_72:
NS_E_72_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push r15
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
	pop r15
	pop r14
	cmp rdi,0
	jz NS_E_72_LB_0
	mov r14,rsi
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_72_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_84:
; 	|» 0'
NS_E_RDI_84:
; /0
;Eq_Agl
; /0/1
;Eq_Agl
;Eq_Agl
; mtc x 1;Eq_Agl
; mtc x 1; /0/0
;Eq_Agl
;Eq_Agl
; mtc x 1;Eq_Agl
; mtc x 1MTC_LB_94:
; ∎ {  }
 ; {>  %_80~1':t52'(-1) %_77~0':(_lst)◂(t52'(-1)) %_78~3':t52'(-1) %_81~2':(_lst)◂(t52'(-1)) }
; 	∎ {  }
	bt r12,1
	jc LB_85
	mov rdi,r14
	call dlt
LB_85:
	bt r12,0
	jc LB_86
	mov rdi,r13
	call dlt
LB_86:
	bt r12,3
	jc LB_87
	mov rdi,r8
	call dlt
LB_87:
	bt r12,2
	jc LB_88
	mov rdi,r15
	call dlt
LB_88:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_93:
; ∎ {  }
 ; {>  %_77~0':(_lst)◂(t52'(-1)) %_82~1':t52'(-1) }
; 	∎ {  }
	bt r12,0
	jc LB_89
	mov rdi,r13
	call dlt
LB_89:
	bt r12,1
	jc LB_90
	mov rdi,r14
	call dlt
LB_90:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_92:
; ∎ {  }
 ; {>  %_77~0':(_lst)◂(t52'(-1)) }
; 	∎ {  }
	bt r12,0
	jc LB_91
	mov rdi,r13
	call dlt
LB_91:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_108:
; 	|» { 0' 1' }
NS_E_RDI_108:
;Eq_Agl
;Eq_Agl
; mtc x 1MTC_LB_161:
; _f35 %_95 ⊢ { %_99 %_100 } : { %_99 %_100 }
 ; {>  %_97~3':_r64 %_95~2':_r64 %_95~0':_r64 %_96~1':(_lst)◂(_r64) %_98~4':(_lst)◂(_r64) }
	mov r10,r15
; _f38 %_100 ⊢ %_101 : %_101
 ; {>  %_100~5':_r64 %_97~3':_r64 %_95~0':_r64 %_96~1':(_lst)◂(_r64) %_99~2':_r64 %_98~4':(_lst)◂(_r64) }
	add r10,1
; _f108 { %_101 %_98 } ⊢ %_102 : %_102
 ; {>  %_101~5':_r64 %_97~3':_r64 %_95~0':_r64 %_96~1':(_lst)◂(_r64) %_99~2':_r64 %_98~4':(_lst)◂(_r64) }
; _f108 { 5' 4' } ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 5' 4' } ⊢ { 0' 1' }
	mov r13,r10
	bt r12,5
	jc LB_117
	btr r12,0
	jmp LB_118
LB_117:
	bts r12,0
LB_118:
	mov r14,r9
	bt r12,4
	jc LB_119
	btr r12,1
	jmp LB_120
LB_119:
	bts r12,1
LB_120:
	call NS_E_108
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_121
	btr r12,4
	jmp LB_122
LB_121:
	bts r12,4
LB_122:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_115
	btr r12,3
	jmp LB_116
LB_115:
	bts r12,3
LB_116:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_113
	btr r12,2
	jmp LB_114
LB_113:
	bts r12,2
LB_114:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_111
	btr r12,1
	jmp LB_112
LB_111:
	bts r12,1
LB_112:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_109
	btr r12,0
	jmp LB_110
LB_109:
	bts r12,0
LB_110:
	add rsp,40
; _f16 { %_102 %_99 %_97 } ⊢ { %_103 %_104 %_105 } : { %_103 %_104 %_105 }
 ; {>  %_102~4':_stg %_97~3':_r64 %_95~0':_r64 %_96~1':(_lst)◂(_r64) %_99~2':_r64 }
; _f16 { 4' 2' 3' } ⊢ { 2' 3' 4' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 2' 3' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,4
	jc LB_127
	btr r12,0
	jmp LB_128
LB_127:
	bts r12,0
LB_128:
	mov r14,r15
	bt r12,2
	jc LB_129
	btr r12,1
	jmp LB_130
LB_129:
	bts r12,1
LB_130:
	mov r15,r8
	bt r12,3
	jc LB_131
	btr r12,2
	jmp LB_132
LB_131:
	bts r12,2
LB_132:
	call NS_E_16
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 2' 3' 4' }
	mov r8,r14
	bt r12,1
	jc LB_133
	btr r12,3
	jmp LB_134
LB_133:
	bts r12,3
LB_134:
	mov r9,r15
	bt r12,2
	jc LB_135
	btr r12,4
	jmp LB_136
LB_135:
	bts r12,4
LB_136:
	mov r15,r13
	bt r12,0
	jc LB_137
	btr r12,2
	jmp LB_138
LB_137:
	bts r12,2
LB_138:
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_125
	btr r12,1
	jmp LB_126
LB_125:
	bts r12,1
LB_126:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_123
	btr r12,0
	jmp LB_124
LB_123:
	bts r12,0
LB_124:
	add rsp,24
; ∎ %_103
 ; {>  %_103~2':_stg %_105~4':_r64 %_104~3':_r64 %_95~0':_r64 %_96~1':(_lst)◂(_r64) }
; 	∎ 2'
	bt r12,4
	jc LB_139
	mov rdi,r9
	call dlt
LB_139:
	bt r12,3
	jc LB_140
	mov rdi,r8
	call dlt
LB_140:
	bt r12,0
	jc LB_141
	mov rdi,r13
	call dlt
LB_141:
	bt r12,1
	jc LB_142
	mov rdi,r14
	call dlt
LB_142:
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_143
	btr r12,0
	jmp LB_144
LB_143:
	bts r12,0
LB_144:
	ret
MTC_LB_160:
; _f14 %_95 ⊢ { %_106 %_107 } : { %_106 %_107 }
 ; {>  %_95~2':_r64 %_95~0':_r64 %_96~1':(_lst)◂(_r64) }
; _f14 2' ⊢ { 2' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_149
	btr r12,0
	jmp LB_150
LB_149:
	bts r12,0
LB_150:
	call NS_E_14
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 2' 3' }
	mov r15,r13
	bt r12,0
	jc LB_151
	btr r12,2
	jmp LB_152
LB_151:
	bts r12,2
LB_152:
	mov r8,r14
	bt r12,1
	jc LB_153
	btr r12,3
	jmp LB_154
LB_153:
	bts r12,3
LB_154:
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_147
	btr r12,1
	jmp LB_148
LB_147:
	bts r12,1
LB_148:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_145
	btr r12,0
	jmp LB_146
LB_145:
	bts r12,0
LB_146:
	add rsp,24
; ∎ %_107
 ; {>  %_107~3':_stg %_106~2':_r64 %_95~0':_r64 %_96~1':(_lst)◂(_r64) }
; 	∎ 3'
	bt r12,2
	jc LB_155
	mov rdi,r15
	call dlt
LB_155:
	bt r12,0
	jc LB_156
	mov rdi,r13
	call dlt
LB_156:
	bt r12,1
	jc LB_157
	mov rdi,r14
	call dlt
LB_157:
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_158
	btr r12,0
	jmp LB_159
LB_158:
	bts r12,0
LB_159:
	ret
section .data
	NS_E_DYN_70:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_70
	NS_E_DYN_73:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_73
	NS_E_DYN_74:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_74
	NS_E_DYN_75:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_75
	NS_E_DYN_76:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_76
	NS_E_DYN_84:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_84
	NS_E_DYN_108:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_108
