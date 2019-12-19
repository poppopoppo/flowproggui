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
	call NS_E_3620
	call NS_E_8492
	call exec_out
	jmp _end
NS_E_ID_36: dq 0
NS_E_36:
NS_E_RDI_36:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_38: dq 0
NS_E_38:
NS_E_RDI_38:
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
NS_E_67:
NS_E_RDI_67:
NS_E_67_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_68
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_68:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_70:
NS_E_RDI_70:
NS_E_70_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_70_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_70_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_71:
NS_E_RDI_71:
NS_E_71_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_71_LB_0
	cmp r11,57
	ja NS_E_71_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_71_LB_0:
	mov rax,0
	ret
NS_E_73:
NS_E_RDI_73:
NS_E_73_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_73_LB_0
	cmp r11,122
	ja NS_E_73_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_73_LB_0:
	mov rax,0
	ret
NS_E_72:
NS_E_RDI_72:
NS_E_72_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_72_LB_0
	cmp r11,90
	ja NS_E_72_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_72_LB_0:
	mov rax,0
	ret
NS_E_45:
	mov rdi,r13
	bt r12,0
NS_E_RDI_45:
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
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_75
	bt QWORD [rdi],17
	mov rdi,QWORD [rdi+8]
	bt QWORD [rdi],0
LB_75:
	push r13
	push r14
	call dcp
	pop r14
	pop r13
	bt QWORD [rsi],17
	not rsi
	xor rsi,rsp
	mov rsi,[rsi]
	bt r12,2
	jc LB_75
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
	mov rsi,rbx
	mov rbx,[rsi]
	mov QWORD [rdi+8+8*rax],rsi
	mov rax,r8
	mov QWORD [rsi+8],rax
	mov rax,0x0000_0001_0002_ffff
	mov QWORD [rsi],rax
	ret
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rsi,QWORD [rdi+8+8*rax]
	not rsi
	xor rsi,rsp
	mov rsi,[rsi]
	bt r12,2
	jc LB_74
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_74:
	mov rsi,rbx
	mov rbx,[rsi]
	mov QWORD [rdi+8+8*rax],rsi
	mov rax,r8
	mov QWORD [rsi+8],rax
	mov rax,0x0000_0001_0002_ffff
	mov QWORD [rsi],rax
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call mk_arr
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_35: dq 0
NS_E_35:
NS_E_RDI_35:
	mov eax,[r14+4]
	lea r8,[r8-1+r13]
	cmp r8,rax
	jge err_s8_ge
	mov eax,[r9+4]
	lea r10,[r10-1+r13]
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
NS_E_ID_34: dq 0
NS_E_34:
NS_E_RDI_34:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_33: dq 0
NS_E_33:
NS_E_RDI_33:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_32: dq 0
NS_E_32:
NS_E_RDI_32:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_31: dq 0
NS_E_31:
NS_E_RDI_31:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_37: dq 0
NS_E_37:
NS_E_RDI_37:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_69:
NS_E_RDI_69:
NS_E_69_ETR_TBL:
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
	jz NS_E_69_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_69_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_82:
; 	|» { 0' 1' }
NS_E_RDI_82:
MTC_LB_83:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_84
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_85
	bt QWORD [rdi],0
	jc LB_86
	btr r12,2
	jmp LB_87
LB_86:
	bts r12,2
LB_87:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_85:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_88:
	cmp r15,0
	jz LB_89
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_88
LB_89:
; ∎ %_76
 ; {>  %_76~0':(_lst)◂(t81'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_84:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_90
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_91
	bt QWORD [rdi],0
	jc LB_92
	btr r12,4
	jmp LB_93
LB_92:
	bts r12,4
LB_93:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_91:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_96
	btr r12,5
	jmp LB_97
LB_96:
	bts r12,5
LB_97:
	mov r8,r11
	bt r12,5
	jc LB_94
	btr r12,2
	jmp LB_95
LB_94:
	bts r12,2
LB_95:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_100
	btr r12,5
	jmp LB_101
LB_100:
	bts r12,5
LB_101:
	mov r9,r11
	bt r12,5
	jc LB_98
	btr r12,3
	jmp LB_99
LB_98:
	bts r12,3
LB_99:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_102:
	cmp r15,0
	jz LB_103
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_102
LB_103:
; _cns { %_78 %_76 } ⊢ %_80 : %_80
 ; {>  %_76~0':(_lst)◂(t81'(-1)) %_79~3':(_lst)◂(t81'(-1)) %_78~2':t81'(-1) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f82 { %_80 %_79 } ⊢ %_81 : %_81
 ; {>  %_80~°0◂{ 2' 0' }:(_lst)◂(t81'(-1)) %_79~3':(_lst)◂(t81'(-1)) }
; _f82 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_104
	btr r12,1
	jmp LB_105
LB_104:
	bts r12,1
LB_105:
	mov r9,r13
	bt r12,0
	jc LB_106
	btr r12,3
	jmp LB_107
LB_106:
	bts r12,3
LB_107:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_112
	btr r12,4
	jmp LB_113
LB_112:
	bts r12,4
LB_113:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_110
	btr QWORD [rdi],0
	jmp LB_111
LB_110:
	bts QWORD [rdi],0
LB_111:
	mov r10,r9
	bt r12,3
	jc LB_116
	btr r12,4
	jmp LB_117
LB_116:
	bts r12,4
LB_117:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_114
	btr QWORD [rdi],1
	jmp LB_115
LB_114:
	bts QWORD [rdi],1
LB_115:
	mov rsi,1
	bt r12,0
	jc LB_108
	mov rsi,0
	bt r13,0
	jc LB_108
	jmp LB_109
LB_108:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_109:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_82
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_81
 ; {>  %_81~0':(_lst)◂(t81'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_90:
NS_E_121:
; 	|» 0'
NS_E_RDI_121:
; _nil {  } ⊢ %_119 : %_119
 ; {>  %_118~0':(_lst)◂(t102'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f82 { %_119 %_118 } ⊢ %_120 : %_120
 ; {>  %_118~0':(_lst)◂(t102'(-1)) %_119~°1◂{  }:(_lst)◂(t99'(0)) }
; _f82 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_122
	btr r12,1
	jmp LB_123
LB_122:
	bts r12,1
LB_123:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_124
	mov rsi,0
	bt r13,0
	jc LB_124
	jmp LB_125
LB_124:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_125:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_82
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_120
 ; {>  %_120~0':(_lst)◂(t102'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_139:
; 	|» { 0' 1' }
NS_E_RDI_139:
MTC_LB_140:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_141
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_142
	bt QWORD [rdi],0
	jc LB_143
	btr r12,4
	jmp LB_144
LB_143:
	bts r12,4
LB_144:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_142:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_147
	btr r12,5
	jmp LB_148
LB_147:
	bts r12,5
LB_148:
	mov r8,r11
	bt r12,5
	jc LB_145
	btr r12,2
	jmp LB_146
LB_145:
	bts r12,2
LB_146:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_151
	btr r12,5
	jmp LB_152
LB_151:
	bts r12,5
LB_152:
	mov r9,r11
	bt r12,5
	jc LB_149
	btr r12,3
	jmp LB_150
LB_149:
	bts r12,3
LB_150:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_153:
	cmp r15,0
	jz LB_154
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_153
LB_154:
; _f56 %_126 ⊢ %_130 : %_130
 ; {>  %_128~2':_r64 %_129~3':(_lst)◂(_r64) %_126~0':_r64 }
	add r13,1
; _f139 { %_130 %_129 } ⊢ { %_131 %_132 } : { %_131 %_132 }
 ; {>  %_128~2':_r64 %_129~3':(_lst)◂(_r64) %_130~0':_r64 }
; _f139 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_157
	btr r12,1
	jmp LB_158
LB_157:
	bts r12,1
LB_158:
	call NS_E_139
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_155
	btr r12,2
	jmp LB_156
LB_155:
	bts r12,2
LB_156:
	add rsp,16
; _f55 %_131 ⊢ %_133 : %_133
 ; {>  %_131~0':_r64 %_132~1':_stg %_128~2':_r64 }
	sub r13,1
; _f33 { %_132 %_133 %_128 } ⊢ { %_134 %_135 %_136 } : { %_134 %_135 %_136 }
 ; {>  %_132~1':_stg %_133~0':_r64 %_128~2':_r64 }
; _f33 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_159
	btr r12,3
	jmp LB_160
LB_159:
	bts r12,3
LB_160:
	mov r14,r13
	bt r12,0
	jc LB_161
	btr r12,1
	jmp LB_162
LB_161:
	bts r12,1
LB_162:
	mov r13,r9
	bt r12,3
	jc LB_163
	btr r12,0
	jmp LB_164
LB_163:
	bts r12,0
LB_164:
	call NS_E_33
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_135 %_134 }
 ; {>  %_134~0':_stg %_136~2':_r64 %_135~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_165
	mov rdi,r8
	call dlt
LB_165:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_166
	btr r12,2
	jmp LB_167
LB_166:
	bts r12,2
LB_167:
	mov r14,r13
	bt r12,0
	jc LB_168
	btr r12,1
	jmp LB_169
LB_168:
	bts r12,1
LB_169:
	mov r13,r8
	bt r12,2
	jc LB_170
	btr r12,0
	jmp LB_171
LB_170:
	bts r12,0
LB_171:
	ret
MTC_LB_141:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_172
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_173
	bt QWORD [rdi],0
	jc LB_174
	btr r12,2
	jmp LB_175
LB_174:
	bts r12,2
LB_175:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_173:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_176:
	cmp r15,0
	jz LB_177
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_176
LB_177:
; _f31 %_126 ⊢ { %_137 %_138 } : { %_137 %_138 }
 ; {>  %_126~0':_r64 }
; _f31 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_31
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_137 %_138 }
 ; {>  %_137~0':_r64 %_138~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_172:
NS_E_182:
; 	|» 0'
NS_E_RDI_182:
; » 0xr0 |~ {  } ⊢ %_179 : %_179
 ; {>  %_178~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_179
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f139 { %_179 %_178 } ⊢ { %_180 %_181 } : { %_180 %_181 }
 ; {>  %_178~0':(_lst)◂(_r64) %_179~1':_r64 }
; _f139 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_183
	btr r12,2
	jmp LB_184
LB_183:
	bts r12,2
LB_184:
	mov r14,r13
	bt r12,0
	jc LB_185
	btr r12,1
	jmp LB_186
LB_185:
	bts r12,1
LB_186:
	mov r13,r8
	bt r12,2
	jc LB_187
	btr r12,0
	jmp LB_188
LB_187:
	bts r12,0
LB_188:
	call NS_E_139
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_181
 ; {>  %_181~1':_stg %_180~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_189
	mov rdi,r13
	call dlt
LB_189:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_190
	btr r12,0
	jmp LB_191
LB_190:
	bts r12,0
LB_191:
	ret
NS_E_192:
NS_E_RDI_192:
NS_E_192_ETR_TBL:
NS_E_192_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_233
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_233
	jmp LB_234
LB_233:
	jmp LB_223
LB_234:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_193_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_238
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_239
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_239:
	jmp LB_223
LB_238:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_226
	btr r12,1
	jmp LB_227
LB_226:
	bts r12,1
LB_227:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_224
	btr r12,0
	jmp LB_225
LB_224:
	bts r12,0
LB_225:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_220
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_241
	btr r12,2
	jmp LB_242
LB_241:
	bts r12,2
LB_242:
	mov r13,r14
	bt r12,1
	jc LB_243
	btr r12,0
	jmp LB_244
LB_243:
	bts r12,0
LB_244:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f182 %_195 ⊢ %_196 : %_196
 ; {>  %_195~0':(_lst)◂(_r64) }
; _f182 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_182
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_196 ⊢ %_197 : %_197
 ; {>  %_196~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_197
 ; {>  %_197~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_218
	btr r12,3
	jmp LB_219
LB_218:
	bts r12,3
LB_219:
	mov r8,0
	bts r12,2
	ret
LB_220:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_222
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_221
LB_222:
	add rsp,8
	ret
LB_223:
	add rsp,32
	pop r14
LB_221:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_193:
NS_E_RDI_193:
NS_E_193_ETR_TBL:
NS_E_193_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_270
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_270
	jmp LB_271
LB_270:
	jmp LB_258
LB_271:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_194_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_275
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_276
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_276:
	jmp LB_258
LB_275:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_193_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_281
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_282
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_282:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_283
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_283:
	jmp LB_258
LB_281:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_263
	btr r12,2
	jmp LB_264
LB_263:
	bts r12,2
LB_264:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_261
	btr r12,1
	jmp LB_262
LB_261:
	bts r12,1
LB_262:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_259
	btr r12,0
	jmp LB_260
LB_259:
	bts r12,0
LB_260:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_255
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_285
	btr r12,3
	jmp LB_286
LB_285:
	bts r12,3
LB_286:
	mov r14,r8
	bt r12,2
	jc LB_287
	btr r12,1
	jmp LB_288
LB_287:
	bts r12,1
LB_288:
	mov r8,r13
	bt r12,0
	jc LB_289
	btr r12,2
	jmp LB_290
LB_289:
	bts r12,2
LB_290:
	mov r13,r9
	bt r12,3
	jc LB_291
	btr r12,0
	jmp LB_292
LB_291:
	bts r12,0
LB_292:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_198 %_199 } ⊢ %_200 : %_200
 ; {>  %_198~0':_r64 %_199~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_200 ⊢ %_201 : %_201
 ; {>  %_200~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_201
 ; {>  %_201~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_249
	btr r12,2
	jmp LB_250
LB_249:
	bts r12,2
LB_250:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_247
	btr QWORD [rdi],0
	jmp LB_248
LB_247:
	bts QWORD [rdi],0
LB_248:
	mov r8,r14
	bt r12,1
	jc LB_253
	btr r12,2
	jmp LB_254
LB_253:
	bts r12,2
LB_254:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_251
	btr QWORD [rdi],1
	jmp LB_252
LB_251:
	bts QWORD [rdi],1
LB_252:
	mov rsi,1
	bt r12,3
	jc LB_245
	mov rsi,0
	bt r9,0
	jc LB_245
	jmp LB_246
LB_245:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_246:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_255:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_257
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_256
LB_257:
	add rsp,8
	ret
LB_258:
	add rsp,48
	pop r14
LB_256:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_306
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_306
	jmp LB_307
LB_306:
	jmp LB_298
LB_307:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_299
	btr r12,0
	jmp LB_300
LB_299:
	bts r12,0
LB_300:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_295
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_202 : %_202
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_202 ⊢ %_203 : %_203
 ; {>  %_202~°1◂{  }:(_lst)◂(t160'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_203
 ; {>  %_203~°0◂°1◂{  }:(_opn)◂((_lst)◂(t163'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_293
	mov rsi,0
	bt r9,0
	jc LB_293
	jmp LB_294
LB_293:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_294:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_295:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_297
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_296
LB_297:
	add rsp,8
	ret
LB_298:
	add rsp,16
	pop r14
LB_296:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_67_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_329
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_321
LB_329:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_193_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_334
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_335
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_335:
	jmp LB_321
LB_334:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_324
	btr r12,1
	jmp LB_325
LB_324:
	bts r12,1
LB_325:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_322
	btr r12,0
	jmp LB_323
LB_322:
	bts r12,0
LB_323:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_318
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_204 %_205 } ⊢ %_206 : %_206
 ; {>  %_204~0':_r64 %_205~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_206 ⊢ %_207 : %_207
 ; {>  %_206~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_207
 ; {>  %_207~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_312
	btr r12,2
	jmp LB_313
LB_312:
	bts r12,2
LB_313:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_310
	btr QWORD [rdi],0
	jmp LB_311
LB_310:
	bts QWORD [rdi],0
LB_311:
	mov r8,r14
	bt r12,1
	jc LB_316
	btr r12,2
	jmp LB_317
LB_316:
	bts r12,2
LB_317:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_314
	btr QWORD [rdi],1
	jmp LB_315
LB_314:
	bts QWORD [rdi],1
LB_315:
	mov rsi,1
	bt r12,3
	jc LB_308
	mov rsi,0
	bt r9,0
	jc LB_308
	jmp LB_309
LB_308:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_309:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_318:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_320
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_319
LB_320:
	add rsp,8
	ret
LB_321:
	add rsp,32
	pop r14
LB_319:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_194:
NS_E_RDI_194:
NS_E_194_ETR_TBL:
NS_E_194_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_350
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_350
	jmp LB_351
LB_350:
	jmp LB_342
LB_351:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_343
	btr r12,0
	jmp LB_344
LB_343:
	bts r12,0
LB_344:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_339
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_208 : %_208
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_208
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_208 ⊢ %_209 : %_209
 ; {>  %_208~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_209
 ; {>  %_209~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_337
	btr r12,3
	jmp LB_338
LB_337:
	bts r12,3
LB_338:
	mov r8,0
	bts r12,2
	ret
LB_339:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_341
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_340
LB_341:
	add rsp,8
	ret
LB_342:
	add rsp,16
	pop r14
LB_340:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_365
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_365
	jmp LB_366
LB_365:
	jmp LB_357
LB_366:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_358
	btr r12,0
	jmp LB_359
LB_358:
	bts r12,0
LB_359:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_354
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_210 : %_210
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_210
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_210 ⊢ %_211 : %_211
 ; {>  %_210~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_211
 ; {>  %_211~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_352
	btr r12,3
	jmp LB_353
LB_352:
	bts r12,3
LB_353:
	mov r8,0
	bts r12,2
	ret
LB_354:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_356
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_355
LB_356:
	add rsp,8
	ret
LB_357:
	add rsp,16
	pop r14
LB_355:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_380
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_380
	jmp LB_381
LB_380:
	jmp LB_372
LB_381:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_373
	btr r12,0
	jmp LB_374
LB_373:
	bts r12,0
LB_374:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_369
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_212 : %_212
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_212
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_212 ⊢ %_213 : %_213
 ; {>  %_212~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_213
 ; {>  %_213~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_367
	btr r12,3
	jmp LB_368
LB_367:
	bts r12,3
LB_368:
	mov r8,0
	bts r12,2
	ret
LB_369:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_371
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_370
LB_371:
	add rsp,8
	ret
LB_372:
	add rsp,16
	pop r14
LB_370:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_395
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_395
	jmp LB_396
LB_395:
	jmp LB_387
LB_396:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_388
	btr r12,0
	jmp LB_389
LB_388:
	bts r12,0
LB_389:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_384
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_214 : %_214
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_214
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_214 ⊢ %_215 : %_215
 ; {>  %_214~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_215
 ; {>  %_215~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_382
	btr r12,3
	jmp LB_383
LB_382:
	bts r12,3
LB_383:
	mov r8,0
	bts r12,2
	ret
LB_384:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_386
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_385
LB_386:
	add rsp,8
	ret
LB_387:
	add rsp,16
	pop r14
LB_385:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_410
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_410
	jmp LB_411
LB_410:
	jmp LB_402
LB_411:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_403
	btr r12,0
	jmp LB_404
LB_403:
	bts r12,0
LB_404:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_399
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_216 : %_216
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_216
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_216 ⊢ %_217 : %_217
 ; {>  %_216~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_217
 ; {>  %_217~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_397
	btr r12,3
	jmp LB_398
LB_397:
	bts r12,3
LB_398:
	mov r8,0
	bts r12,2
	ret
LB_399:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_401
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_400
LB_401:
	add rsp,8
	ret
LB_402:
	add rsp,16
	pop r14
LB_400:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_412:
NS_E_RDI_412:
NS_E_412_ETR_TBL:
NS_E_412_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_67_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_449
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_443
LB_449:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_444
	btr r12,0
	jmp LB_445
LB_444:
	bts r12,0
LB_445:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_440
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_414 : %_414
 ; {>  %_413~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_414
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_415 : %_415
 ; {>  %_414~1':_r64 %_413~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_415
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f50 { %_413 %_414 } ⊢ { %_416 %_417 %_418 } : { %_416 %_417 %_418 }
 ; {>  %_414~1':_r64 %_413~0':_r64 %_415~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_415 %_416 } ⊢ { %_419 %_420 %_421 } : { %_419 %_420 %_421 }
 ; {>  %_416~0':_r64 %_415~2':_r64 %_417~1':_r64 %_418~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_424:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_425
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_425
LB_426:
	cmp r15,0
	jz LB_427
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_426
LB_427:
; _some %_420 ⊢ %_422 : %_422
 ; {>  %_419~2':_r64 %_420~0':_r64 %_417~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_422
 ; {>  %_419~2':_r64 %_417~1':_r64 %_422~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_428
	mov rdi,r8
	call dlt
LB_428:
	bt r12,1
	jc LB_429
	mov rdi,r14
	call dlt
LB_429:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_430
	btr r12,3
	jmp LB_431
LB_430:
	bts r12,3
LB_431:
	mov r8,0
	bts r12,2
	ret
MTC_LB_425:
	mov r15,0
LB_433:
	cmp r15,0
	jz LB_434
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_433
LB_434:
; _none {  } ⊢ %_423 : %_423
 ; {>  %_419~2':_r64 %_420~0':_r64 %_421~4':_r64 %_417~1':_r64 %_418~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_423
 ; {>  %_419~2':_r64 %_420~0':_r64 %_421~4':_r64 %_423~°1◂{  }:(_opn)◂(t239'(0)) %_417~1':_r64 %_418~3':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_435
	mov rdi,r8
	call dlt
LB_435:
	bt r12,0
	jc LB_436
	mov rdi,r13
	call dlt
LB_436:
	bt r12,4
	jc LB_437
	mov rdi,r10
	call dlt
LB_437:
	bt r12,1
	jc LB_438
	mov rdi,r14
	call dlt
LB_438:
	bt r12,3
	jc LB_439
	mov rdi,r9
	call dlt
LB_439:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_432:
LB_440:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_442
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_441
LB_442:
	add rsp,8
	ret
LB_443:
	add rsp,16
	pop r14
LB_441:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_451:
NS_E_RDI_451:
NS_E_451_ETR_TBL:
NS_E_451_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_67_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_488
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_482
LB_488:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_483
	btr r12,0
	jmp LB_484
LB_483:
	bts r12,0
LB_484:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_479
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_453 : %_453
 ; {>  %_452~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_453
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_454 : %_454
 ; {>  %_452~0':_r64 %_453~1':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_454
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f50 { %_452 %_453 } ⊢ { %_455 %_456 %_457 } : { %_455 %_456 %_457 }
 ; {>  %_454~2':_r64 %_452~0':_r64 %_453~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_454 %_455 } ⊢ { %_458 %_459 %_460 } : { %_458 %_459 %_460 }
 ; {>  %_454~2':_r64 %_455~0':_r64 %_456~1':_r64 %_457~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_463:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_464
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_464
LB_465:
	cmp r15,0
	jz LB_466
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_465
LB_466:
; _some %_459 ⊢ %_461 : %_461
 ; {>  %_458~2':_r64 %_456~1':_r64 %_459~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_461
 ; {>  %_458~2':_r64 %_461~°0◂0':(_opn)◂(_r64) %_456~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_467
	mov rdi,r8
	call dlt
LB_467:
	bt r12,1
	jc LB_468
	mov rdi,r14
	call dlt
LB_468:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_469
	btr r12,3
	jmp LB_470
LB_469:
	bts r12,3
LB_470:
	mov r8,0
	bts r12,2
	ret
MTC_LB_464:
	mov r15,0
LB_472:
	cmp r15,0
	jz LB_473
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_472
LB_473:
; _none {  } ⊢ %_462 : %_462
 ; {>  %_458~2':_r64 %_460~4':_r64 %_456~1':_r64 %_459~0':_r64 %_457~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_462
 ; {>  %_462~°1◂{  }:(_opn)◂(t266'(0)) %_458~2':_r64 %_460~4':_r64 %_456~1':_r64 %_459~0':_r64 %_457~3':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_474
	mov rdi,r8
	call dlt
LB_474:
	bt r12,4
	jc LB_475
	mov rdi,r10
	call dlt
LB_475:
	bt r12,1
	jc LB_476
	mov rdi,r14
	call dlt
LB_476:
	bt r12,0
	jc LB_477
	mov rdi,r13
	call dlt
LB_477:
	bt r12,3
	jc LB_478
	mov rdi,r9
	call dlt
LB_478:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_471:
LB_479:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_481
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_480
LB_481:
	add rsp,8
	ret
LB_482:
	add rsp,16
	pop r14
LB_480:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_490:
NS_E_RDI_490:
NS_E_490_ETR_TBL:
NS_E_490_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_67_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_527
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_521
LB_527:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_522
	btr r12,0
	jmp LB_523
LB_522:
	bts r12,0
LB_523:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_518
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_492 : %_492
 ; {>  %_491~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_492
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_493 : %_493
 ; {>  %_491~0':_r64 %_492~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_493
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f50 { %_491 %_492 } ⊢ { %_494 %_495 %_496 } : { %_494 %_495 %_496 }
 ; {>  %_491~0':_r64 %_492~1':_r64 %_493~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f50 { %_493 %_494 } ⊢ { %_497 %_498 %_499 } : { %_497 %_498 %_499 }
 ; {>  %_496~3':_r64 %_494~0':_r64 %_495~1':_r64 %_493~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_502:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_503
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_503
LB_504:
	cmp r15,0
	jz LB_505
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_504
LB_505:
; _some %_498 ⊢ %_500 : %_500
 ; {>  %_497~2':_r64 %_495~1':_r64 %_498~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_500
 ; {>  %_497~2':_r64 %_495~1':_r64 %_500~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_506
	mov rdi,r8
	call dlt
LB_506:
	bt r12,1
	jc LB_507
	mov rdi,r14
	call dlt
LB_507:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_508
	btr r12,3
	jmp LB_509
LB_508:
	bts r12,3
LB_509:
	mov r8,0
	bts r12,2
	ret
MTC_LB_503:
	mov r15,0
LB_511:
	cmp r15,0
	jz LB_512
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_511
LB_512:
; _none {  } ⊢ %_501 : %_501
 ; {>  %_496~3':_r64 %_497~2':_r64 %_495~1':_r64 %_499~4':_r64 %_498~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_501
 ; {>  %_496~3':_r64 %_501~°1◂{  }:(_opn)◂(t293'(0)) %_497~2':_r64 %_495~1':_r64 %_499~4':_r64 %_498~0':_r64 }
; 	∎ °1◂{  }
	bt r12,3
	jc LB_513
	mov rdi,r9
	call dlt
LB_513:
	bt r12,2
	jc LB_514
	mov rdi,r8
	call dlt
LB_514:
	bt r12,1
	jc LB_515
	mov rdi,r14
	call dlt
LB_515:
	bt r12,4
	jc LB_516
	mov rdi,r10
	call dlt
LB_516:
	bt r12,0
	jc LB_517
	mov rdi,r13
	call dlt
LB_517:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_510:
LB_518:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_520
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_519
LB_520:
	add rsp,8
	ret
LB_521:
	add rsp,16
	pop r14
LB_519:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_529:
NS_E_RDI_529:
NS_E_529_ETR_TBL:
NS_E_529_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_490_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_545
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_539
LB_545:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_540
	btr r12,0
	jmp LB_541
LB_540:
	bts r12,0
LB_541:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_536
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_530 ⊢ %_531 : %_531
 ; {>  %_530~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_531
 ; {>  %_531~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_534
	btr r12,3
	jmp LB_535
LB_534:
	bts r12,3
LB_535:
	mov r8,0
	bts r12,2
	ret
LB_536:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_538
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_537
LB_538:
	add rsp,8
	ret
LB_539:
	add rsp,16
	pop r14
LB_537:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_451_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_558
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_552
LB_558:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_553
	btr r12,0
	jmp LB_554
LB_553:
	bts r12,0
LB_554:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_549
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_532 ⊢ %_533 : %_533
 ; {>  %_532~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_533
 ; {>  %_533~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_547
	btr r12,3
	jmp LB_548
LB_547:
	bts r12,3
LB_548:
	mov r8,0
	bts r12,2
	ret
LB_549:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_551
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_550
LB_551:
	add rsp,8
	ret
LB_552:
	add rsp,16
	pop r14
LB_550:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_560:
NS_E_RDI_560:
NS_E_560_ETR_TBL:
NS_E_560_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_529_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_605
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_597
LB_605:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_610
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_611
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_611:
	jmp LB_597
LB_610:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_600
	btr r12,1
	jmp LB_601
LB_600:
	bts r12,1
LB_601:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_598
	btr r12,0
	jmp LB_599
LB_598:
	bts r12,0
LB_599:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_594
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_563 %_564 } ⊢ %_565 : %_565
 ; {>  %_563~0':_r64 %_564~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f182 %_565 ⊢ %_566 : %_566
 ; {>  %_565~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f182 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_580
	btr r12,2
	jmp LB_581
LB_580:
	bts r12,2
LB_581:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_586
	btr r12,3
	jmp LB_587
LB_586:
	bts r12,3
LB_587:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_584
	btr QWORD [rdi],0
	jmp LB_585
LB_584:
	bts QWORD [rdi],0
LB_585:
	mov r9,r14
	bt r12,1
	jc LB_590
	btr r12,3
	jmp LB_591
LB_590:
	bts r12,3
LB_591:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_588
	btr QWORD [rdi],1
	jmp LB_589
LB_588:
	bts QWORD [rdi],1
LB_589:
	mov rsi,1
	bt r12,0
	jc LB_582
	mov rsi,0
	bt r13,0
	jc LB_582
	jmp LB_583
LB_582:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_583:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_182
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_566 ⊢ %_567 : %_567
 ; {>  %_566~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_567
 ; {>  %_567~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_592
	btr r12,3
	jmp LB_593
LB_592:
	bts r12,3
LB_593:
	mov r8,0
	bts r12,2
	ret
LB_594:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_596
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_595
LB_596:
	add rsp,8
	ret
LB_597:
	add rsp,32
	pop r14
LB_595:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_561:
NS_E_RDI_561:
NS_E_561_ETR_TBL:
NS_E_561_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_562_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_634
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_626
LB_634:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_639
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_640
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_640:
	jmp LB_626
LB_639:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_629
	btr r12,1
	jmp LB_630
LB_629:
	bts r12,1
LB_630:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_627
	btr r12,0
	jmp LB_628
LB_627:
	bts r12,0
LB_628:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_623
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_568 %_569 } ⊢ %_570 : %_570
 ; {>  %_569~1':(_lst)◂(_r64) %_568~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_570 ⊢ %_571 : %_571
 ; {>  %_570~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_571
 ; {>  %_571~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_617
	btr r12,2
	jmp LB_618
LB_617:
	bts r12,2
LB_618:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_615
	btr QWORD [rdi],0
	jmp LB_616
LB_615:
	bts QWORD [rdi],0
LB_616:
	mov r8,r14
	bt r12,1
	jc LB_621
	btr r12,2
	jmp LB_622
LB_621:
	bts r12,2
LB_622:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_619
	btr QWORD [rdi],1
	jmp LB_620
LB_619:
	bts QWORD [rdi],1
LB_620:
	mov rsi,1
	bt r12,3
	jc LB_613
	mov rsi,0
	bt r9,0
	jc LB_613
	jmp LB_614
LB_613:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_614:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_623:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_625
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_624
LB_625:
	add rsp,8
	ret
LB_626:
	add rsp,32
	pop r14
LB_624:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_644
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_572 : %_572
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_572 ⊢ %_573 : %_573
 ; {>  %_572~°1◂{  }:(_lst)◂(t337'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_573
 ; {>  %_573~°0◂°1◂{  }:(_opn)◂((_lst)◂(t340'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_642
	mov rsi,0
	bt r9,0
	jc LB_642
	jmp LB_643
LB_642:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_643:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_644:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_646
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_645
LB_646:
	add rsp,8
	ret
LB_647:
	add rsp,0
	pop r14
LB_645:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_562:
NS_E_RDI_562:
NS_E_562_ETR_TBL:
NS_E_562_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_529_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_659
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_653
LB_659:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_654
	btr r12,0
	jmp LB_655
LB_654:
	bts r12,0
LB_655:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_650
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_574 ⊢ %_575 : %_575
 ; {>  %_574~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_575
 ; {>  %_575~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_648
	btr r12,3
	jmp LB_649
LB_648:
	bts r12,3
LB_649:
	mov r8,0
	bts r12,2
	ret
LB_650:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_652
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_651
LB_652:
	add rsp,8
	ret
LB_653:
	add rsp,16
	pop r14
LB_651:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_412_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_672
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_666
LB_672:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_667
	btr r12,0
	jmp LB_668
LB_667:
	bts r12,0
LB_668:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_663
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_576 ⊢ %_577 : %_577
 ; {>  %_576~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_577
 ; {>  %_577~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_661
	btr r12,3
	jmp LB_662
LB_661:
	bts r12,3
LB_662:
	mov r8,0
	bts r12,2
	ret
LB_663:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_665
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_664
LB_665:
	add rsp,8
	ret
LB_666:
	add rsp,16
	pop r14
LB_664:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_687
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_687
	jmp LB_688
LB_687:
	jmp LB_679
LB_688:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_680
	btr r12,0
	jmp LB_681
LB_680:
	bts r12,0
LB_681:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_676
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_578 : %_578
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_578
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_578 ⊢ %_579 : %_579
 ; {>  %_578~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_579
 ; {>  %_579~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_674
	btr r12,3
	jmp LB_675
LB_674:
	bts r12,3
LB_675:
	mov r8,0
	bts r12,2
	ret
LB_676:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_678
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_677
LB_678:
	add rsp,8
	ret
LB_679:
	add rsp,16
	pop r14
LB_677:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_689:
NS_E_RDI_689:
NS_E_689_ETR_TBL:
NS_E_689_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_710
	jmp LB_711
LB_710:
	jmp LB_700
LB_711:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_715
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_716
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_716:
	jmp LB_700
LB_715:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_703
	btr r12,1
	jmp LB_704
LB_703:
	bts r12,1
LB_704:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_701
	btr r12,0
	jmp LB_702
LB_701:
	bts r12,0
LB_702:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_697
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_718
	btr r12,2
	jmp LB_719
LB_718:
	bts r12,2
LB_719:
	mov r13,r14
	bt r12,1
	jc LB_720
	btr r12,0
	jmp LB_721
LB_720:
	bts r12,0
LB_721:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f182 %_690 ⊢ %_691 : %_691
 ; {>  %_690~0':(_lst)◂(_r64) }
; _f182 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_182
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_691 ⊢ %_692 : %_692
 ; {>  %_691~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_692
 ; {>  %_692~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_695
	btr r12,3
	jmp LB_696
LB_695:
	bts r12,3
LB_696:
	mov r8,0
	bts r12,2
	ret
LB_697:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_699
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_698
LB_699:
	add rsp,8
	ret
LB_700:
	add rsp,32
	pop r14
LB_698:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_733
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_727
LB_733:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_728
	btr r12,0
	jmp LB_729
LB_728:
	bts r12,0
LB_729:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_724
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_693 ⊢ %_694 : %_694
 ; {>  %_693~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_694
 ; {>  %_694~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_722
	btr r12,3
	jmp LB_723
LB_722:
	bts r12,3
LB_723:
	mov r8,0
	bts r12,2
	ret
LB_724:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_726
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_725
LB_726:
	add rsp,8
	ret
LB_727:
	add rsp,16
	pop r14
LB_725:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_746:
; 	|» 0'
NS_E_RDI_746:
MTC_LB_747:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_748
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_749
	bt QWORD [rdi],0
	jc LB_750
	btr r12,3
	jmp LB_751
LB_750:
	bts r12,3
LB_751:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_749:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_754
	btr r12,4
	jmp LB_755
LB_754:
	bts r12,4
LB_755:
	mov r14,r10
	bt r12,4
	jc LB_752
	btr r12,1
	jmp LB_753
LB_752:
	bts r12,1
LB_753:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_758
	btr r12,4
	jmp LB_759
LB_758:
	bts r12,4
LB_759:
	mov r8,r10
	bt r12,4
	jc LB_756
	btr r12,2
	jmp LB_757
LB_756:
	bts r12,2
LB_757:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_760:
	cmp r15,0
	jz LB_761
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_760
LB_761:
; _f746 %_740 ⊢ %_741 : %_741
 ; {>  %_739~1':_stg %_740~2':_p735 }
; _f746 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_764
	btr r12,0
	jmp LB_765
LB_764:
	bts r12,0
LB_765:
	call NS_E_746
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_762
	btr r12,1
	jmp LB_763
LB_762:
	bts r12,1
LB_763:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "."
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_744
 ; {>  %_743~0':_stg %_742~1':_stg %_744~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_766
	mov rdi,r13
	call dlt
LB_766:
	bt r12,1
	jc LB_767
	mov rdi,r14
	call dlt
LB_767:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_768
	btr r12,0
	jmp LB_769
LB_768:
	bts r12,0
LB_769:
	ret
MTC_LB_748:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_770
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_771
	bt QWORD [rdi],0
	jc LB_772
	btr r12,2
	jmp LB_773
LB_772:
	bts r12,2
LB_773:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_771:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_774
	btr r12,1
	jmp LB_775
LB_774:
	bts r12,1
LB_775:
LB_776:
	cmp r15,0
	jz LB_777
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_776
LB_777:
; ∎ %_745
 ; {>  %_745~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_778
	btr r12,0
	jmp LB_779
LB_778:
	bts r12,0
LB_779:
	ret
MTC_LB_770:
NS_E_890:
; 	|» 0'
NS_E_RDI_890:
MTC_LB_891:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_892
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_893
	bt QWORD [rdi],0
	jc LB_894
	btr r12,2
	jmp LB_895
LB_894:
	bts r12,2
LB_895:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_893:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_896
	btr r12,1
	jmp LB_897
LB_896:
	bts r12,1
LB_897:
LB_898:
	cmp r15,0
	jz LB_899
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_898
LB_899:
; 	» "??r" _ ⊢ 0' : %_885
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_885
 ; {>  %_884~1':_r64 %_885~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_900
	mov rdi,r14
	call dlt
LB_900:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_892:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_901
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_902
	bt QWORD [rdi],0
	jc LB_903
	btr r12,2
	jmp LB_904
LB_903:
	bts r12,2
LB_904:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_902:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_905
	btr r12,1
	jmp LB_906
LB_905:
	bts r12,1
LB_906:
LB_907:
	cmp r15,0
	jz LB_908
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_907
LB_908:
; 	» ".." _ ⊢ 0' : %_887
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_887
 ; {>  %_887~0':_stg %_886~1':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_909
	mov rdi,r14
	call dlt
LB_909:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_901:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_910
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂1'
; 0' ⊢ °2◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_911
	bt QWORD [rdi],0
	jc LB_912
	btr r12,2
	jmp LB_913
LB_912:
	bts r12,2
LB_913:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_911:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_914
	btr r12,1
	jmp LB_915
LB_914:
	bts r12,1
LB_915:
LB_916:
	cmp r15,0
	jz LB_917
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_916
LB_917:
; _f746 %_888 ⊢ %_889 : %_889
 ; {>  %_888~1':_p735 }
; _f746 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_918
	btr r12,0
	jmp LB_919
LB_918:
	bts r12,0
LB_919:
	call NS_E_746
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_889
 ; {>  %_889~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_910:
NS_E_960:
; 	|» 0'
NS_E_RDI_960:
MTC_LB_961:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_962
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_963
	bt QWORD [rdi],0
	jc LB_964
	btr r12,3
	jmp LB_965
LB_964:
	bts r12,3
LB_965:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_963:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_968
	btr r12,4
	jmp LB_969
LB_968:
	bts r12,4
LB_969:
	mov r14,r10
	bt r12,4
	jc LB_966
	btr r12,1
	jmp LB_967
LB_966:
	bts r12,1
LB_967:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_972
	btr r12,4
	jmp LB_973
LB_972:
	bts r12,4
LB_973:
	mov r8,r10
	bt r12,4
	jc LB_970
	btr r12,2
	jmp LB_971
LB_970:
	bts r12,2
LB_971:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_974:
	cmp r15,0
	jz LB_975
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_974
LB_975:
; _f950 %_952 ⊢ %_954 : %_954
 ; {>  %_953~2':(_lst)◂(_p799) %_952~1':_p799 }
; _f950 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_978
	btr r12,0
	jmp LB_979
LB_978:
	bts r12,0
LB_979:
	call NS_E_950
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_976
	btr r12,2
	jmp LB_977
LB_976:
	bts r12,2
LB_977:
	add rsp,16
; _f960 %_953 ⊢ %_955 : %_955
 ; {>  %_953~2':(_lst)◂(_p799) %_954~0':_stg }
; _f960 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_982
	btr r12,0
	jmp LB_983
LB_982:
	bts r12,0
LB_983:
	call NS_E_960
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_984
	btr r12,1
	jmp LB_985
LB_984:
	bts r12,1
LB_985:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_980
	btr r12,0
	jmp LB_981
LB_980:
	bts r12,0
LB_981:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_958
 ; {>  %_956~0':_stg %_958~2':_stg %_957~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_986
	mov rdi,r13
	call dlt
LB_986:
	bt r12,1
	jc LB_987
	mov rdi,r14
	call dlt
LB_987:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_988
	btr r12,0
	jmp LB_989
LB_988:
	bts r12,0
LB_989:
	ret
MTC_LB_962:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_990
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_991
	bt QWORD [rdi],0
	jc LB_992
	btr r12,1
	jmp LB_993
LB_992:
	bts r12,1
LB_993:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_991:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_994:
	cmp r15,0
	jz LB_995
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_994
LB_995:
; 	» "" _ ⊢ 0' : %_959
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_959
 ; {>  %_959~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_990:
NS_E_950:
; 	|» 0'
NS_E_RDI_950:
MTC_LB_996:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_997
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_998
	bt QWORD [rdi],0
	jc LB_999
	btr r12,2
	jmp LB_1000
LB_999:
	bts r12,2
LB_1000:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_998:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1001
	btr r12,1
	jmp LB_1002
LB_1001:
	bts r12,1
LB_1002:
LB_1003:
	cmp r15,0
	jz LB_1004
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1003
LB_1004:
; _f960 %_943 ⊢ %_944 : %_944
 ; {>  %_943~1':(_lst)◂(_p799) }
; _f960 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1005
	btr r12,0
	jmp LB_1006
LB_1005:
	bts r12,0
LB_1006:
	call NS_E_960
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_946
 ; {>  %_946~1':_stg %_945~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1007
	mov rdi,r13
	call dlt
LB_1007:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1008
	btr r12,0
	jmp LB_1009
LB_1008:
	bts r12,0
LB_1009:
	ret
MTC_LB_997:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1010
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_1011
	bt QWORD [rdi],0
	jc LB_1012
	btr r12,2
	jmp LB_1013
LB_1012:
	bts r12,2
LB_1013:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1011:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1014
	btr r12,1
	jmp LB_1015
LB_1014:
	bts r12,1
LB_1015:
LB_1016:
	cmp r15,0
	jz LB_1017
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1016
LB_1017:
MTC_LB_1018:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1019
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1020
	bt QWORD [rdi],0
	jc LB_1021
	btr r12,0
	jmp LB_1022
LB_1021:
	bts r12,0
LB_1022:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1020:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1023:
	cmp r15,0
	jz LB_1024
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1023
LB_1024:
; 	» "_ " _ ⊢ 0' : %_948
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_20_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_948
 ; {>  %_948~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1019:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1025
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1026
	bt QWORD [rdi],0
	jc LB_1027
	btr r12,2
	jmp LB_1028
LB_1027:
	bts r12,2
LB_1028:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1026:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1029
	btr r12,0
	jmp LB_1030
LB_1029:
	bts r12,0
LB_1030:
LB_1031:
	cmp r15,0
	jz LB_1032
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1031
LB_1032:
; ∎ %_949
 ; {>  %_949~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1025:
MTC_LB_1010:
NS_E_941:
; 	|» 0'
NS_E_RDI_941:
MTC_LB_1033:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1034
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_1035
	bt QWORD [rdi],0
	jc LB_1036
	btr r12,3
	jmp LB_1037
LB_1036:
	bts r12,3
LB_1037:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1035:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1040
	btr r12,4
	jmp LB_1041
LB_1040:
	bts r12,4
LB_1041:
	mov r14,r10
	bt r12,4
	jc LB_1038
	btr r12,1
	jmp LB_1039
LB_1038:
	bts r12,1
LB_1039:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1044
	btr r12,4
	jmp LB_1045
LB_1044:
	bts r12,4
LB_1045:
	mov r8,r10
	bt r12,4
	jc LB_1042
	btr r12,2
	jmp LB_1043
LB_1042:
	bts r12,2
LB_1043:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1046:
	cmp r15,0
	jz LB_1047
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1046
LB_1047:
; _f931 %_933 ⊢ %_935 : %_935
 ; {>  %_934~2':(_lst)◂(_p798) %_933~1':_p798 }
; _f931 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1050
	btr r12,0
	jmp LB_1051
LB_1050:
	bts r12,0
LB_1051:
	call NS_E_931
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1048
	btr r12,2
	jmp LB_1049
LB_1048:
	bts r12,2
LB_1049:
	add rsp,16
; _f941 %_934 ⊢ %_936 : %_936
 ; {>  %_934~2':(_lst)◂(_p798) %_935~0':_stg }
; _f941 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1054
	btr r12,0
	jmp LB_1055
LB_1054:
	bts r12,0
LB_1055:
	call NS_E_941
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1056
	btr r12,1
	jmp LB_1057
LB_1056:
	bts r12,1
LB_1057:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1052
	btr r12,0
	jmp LB_1053
LB_1052:
	bts r12,0
LB_1053:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_939
 ; {>  %_937~0':_stg %_938~1':_stg %_939~2':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1058
	mov rdi,r13
	call dlt
LB_1058:
	bt r12,1
	jc LB_1059
	mov rdi,r14
	call dlt
LB_1059:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1060
	btr r12,0
	jmp LB_1061
LB_1060:
	bts r12,0
LB_1061:
	ret
MTC_LB_1034:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1062
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_1063
	bt QWORD [rdi],0
	jc LB_1064
	btr r12,1
	jmp LB_1065
LB_1064:
	bts r12,1
LB_1065:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1063:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1066:
	cmp r15,0
	jz LB_1067
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1066
LB_1067:
; 	» "" _ ⊢ 0' : %_940
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_940
 ; {>  %_940~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1062:
NS_E_931:
; 	|» 0'
NS_E_RDI_931:
MTC_LB_1068:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1069
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_1070
	bt QWORD [rdi],0
	jc LB_1071
	btr r12,2
	jmp LB_1072
LB_1071:
	bts r12,2
LB_1072:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1070:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1073
	btr r12,1
	jmp LB_1074
LB_1073:
	bts r12,1
LB_1074:
LB_1075:
	cmp r15,0
	jz LB_1076
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1075
LB_1076:
; _f941 %_921 ⊢ %_922 : %_922
 ; {>  %_921~1':(_lst)◂(_p798) }
; _f941 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1077
	btr r12,0
	jmp LB_1078
LB_1077:
	bts r12,0
LB_1078:
	call NS_E_941
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_924
 ; {>  %_924~1':_stg %_923~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1079
	mov rdi,r13
	call dlt
LB_1079:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1080
	btr r12,0
	jmp LB_1081
LB_1080:
	bts r12,0
LB_1081:
	ret
MTC_LB_1069:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1082
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_1083
	bt QWORD [rdi],0
	jc LB_1084
	btr r12,2
	jmp LB_1085
LB_1084:
	bts r12,2
LB_1085:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1083:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1086
	btr r12,1
	jmp LB_1087
LB_1086:
	bts r12,1
LB_1087:
LB_1088:
	cmp r15,0
	jz LB_1089
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1088
LB_1089:
MTC_LB_1090:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1091
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂0'
; 1' ⊢ °0◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1092
	bt QWORD [rdi],0
	jc LB_1093
	btr r12,2
	jmp LB_1094
LB_1093:
	bts r12,2
LB_1094:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1092:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1095
	btr r12,0
	jmp LB_1096
LB_1095:
	bts r12,0
LB_1096:
LB_1097:
	cmp r15,0
	jz LB_1098
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1097
LB_1098:
; _f890 %_926 ⊢ %_927 : %_927
 ; {>  %_926~0':_p801 }
; _f890 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_890
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "%[ "
	mov rsi,0x_25
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " ] "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; ∎ %_929
 ; {>  %_929~1':_stg %_928~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_1099
	mov rdi,r13
	call dlt
LB_1099:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1100
	btr r12,0
	jmp LB_1101
LB_1100:
	bts r12,0
LB_1101:
	ret
MTC_LB_1091:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1102
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1103
	bt QWORD [rdi],0
	jc LB_1104
	btr r12,2
	jmp LB_1105
LB_1104:
	bts r12,2
LB_1105:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1103:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_1106
	btr r12,0
	jmp LB_1107
LB_1106:
	bts r12,0
LB_1107:
LB_1108:
	cmp r15,0
	jz LB_1109
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1108
LB_1109:
; ∎ %_930
 ; {>  %_930~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1102:
MTC_LB_1082:
NS_E_1522:
; 	|» { 0' 1' }
NS_E_RDI_1522:
MTC_LB_1523:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1524
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' }
; 1' ⊢ °0◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1525
	bt QWORD [rdi],0
	jc LB_1526
	btr r12,5
	jmp LB_1527
LB_1526:
	bts r12,5
LB_1527:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1525:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1530
	btr r12,6
	jmp LB_1531
LB_1530:
	bts r12,6
LB_1531:
	mov r8,rcx
	bt r12,6
	jc LB_1528
	btr r12,2
	jmp LB_1529
LB_1528:
	bts r12,2
LB_1529:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1534
	btr r12,6
	jmp LB_1535
LB_1534:
	bts r12,6
LB_1535:
	mov r9,rcx
	bt r12,6
	jc LB_1532
	btr r12,3
	jmp LB_1533
LB_1532:
	bts r12,3
LB_1533:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_1538
	btr r12,6
	jmp LB_1539
LB_1538:
	bts r12,6
LB_1539:
	mov r10,rcx
	bt r12,6
	jc LB_1536
	btr r12,4
	jmp LB_1537
LB_1536:
	bts r12,4
LB_1537:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1540:
	cmp r15,0
	jz LB_1541
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1540
LB_1541:
; _f1522 { %_1483 %_1487 } ⊢ { %_1488 %_1489 } : { %_1488 %_1489 }
 ; {>  %_1485~2':(_lst)◂(_p805) %_1486~3':_p804 %_1487~4':_p803 %_1483~0':_r64 }
; _f1522 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1546
	btr r12,1
	jmp LB_1547
LB_1546:
	bts r12,1
LB_1547:
	call NS_E_1522
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_1544
	btr r12,3
	jmp LB_1545
LB_1544:
	bts r12,3
LB_1545:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1542
	btr r12,2
	jmp LB_1543
LB_1542:
	bts r12,2
LB_1543:
	add rsp,24
MTC_LB_1548:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1549
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °0◂4'
; 3' ⊢ °0◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_1550
	bt QWORD [rdi],0
	jc LB_1551
	btr r12,5
	jmp LB_1552
LB_1551:
	bts r12,5
LB_1552:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1550:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_1553
	btr r12,4
	jmp LB_1554
LB_1553:
	bts r12,4
LB_1554:
LB_1555:
	cmp r15,0
	jz LB_1556
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1555
LB_1556:
; _f1522 { %_1488 %_1490 } ⊢ { %_1491 %_1492 } : { %_1491 %_1492 }
 ; {>  %_1485~2':(_lst)◂(_p805) %_1488~0':_r64 %_1489~1':_stg %_1490~4':_p803 }
; _f1522 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1561
	btr r12,1
	jmp LB_1562
LB_1561:
	bts r12,1
LB_1562:
	call NS_E_1522
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_1563
	btr r12,3
	jmp LB_1564
LB_1563:
	bts r12,3
LB_1564:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1559
	btr r12,2
	jmp LB_1560
LB_1559:
	bts r12,2
LB_1560:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1557
	btr r12,1
	jmp LB_1558
LB_1557:
	bts r12,1
LB_1558:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_1565:
	cmp rax,0
	jz LB_1566
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1565
LB_1566:
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1493 %_1496 }
 ; {>  %_1485~2':(_lst)◂(_p805) %_1494~1':_stg %_1496~4':_stg %_1495~3':_stg %_1493~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_1567
	mov rdi,r8
	call dlt
LB_1567:
	bt r12,1
	jc LB_1568
	mov rdi,r14
	call dlt
LB_1568:
	bt r12,3
	jc LB_1569
	mov rdi,r9
	call dlt
LB_1569:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1570
	btr r12,1
	jmp LB_1571
LB_1570:
	bts r12,1
LB_1571:
	ret
MTC_LB_1549:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1572
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂4'
; 3' ⊢ °1◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_1573
	bt QWORD [rdi],0
	jc LB_1574
	btr r12,5
	jmp LB_1575
LB_1574:
	bts r12,5
LB_1575:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1573:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_1576
	btr r12,4
	jmp LB_1577
LB_1576:
	bts r12,4
LB_1577:
LB_1578:
	cmp r15,0
	jz LB_1579
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1578
LB_1579:
; _f56 %_1488 ⊢ %_1498 : %_1498
 ; {>  %_1497~4':_p802 %_1485~2':(_lst)◂(_p805) %_1488~0':_r64 %_1489~1':_stg }
	add r13,1
; _f1446 { %_1498 %_1497 } ⊢ { %_1499 %_1500 } : { %_1499 %_1500 }
 ; {>  %_1497~4':_p802 %_1498~0':_r64 %_1485~2':(_lst)◂(_p805) %_1489~1':_stg }
; _f1446 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1584
	btr r12,1
	jmp LB_1585
LB_1584:
	bts r12,1
LB_1585:
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_1586
	btr r12,3
	jmp LB_1587
LB_1586:
	bts r12,3
LB_1587:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1582
	btr r12,2
	jmp LB_1583
LB_1582:
	bts r12,2
LB_1583:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1580
	btr r12,1
	jmp LB_1581
LB_1580:
	bts r12,1
LB_1581:
	add rsp,24
; _f55 %_1499 ⊢ %_1501 : %_1501
 ; {>  %_1485~2':(_lst)◂(_p805) %_1499~0':_r64 %_1489~1':_stg %_1500~3':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_1588:
	cmp rax,0
	jz LB_1589
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1588
LB_1589:
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1502 %_1505 }
 ; {>  %_1485~2':(_lst)◂(_p805) %_1505~4':_stg %_1503~1':_stg %_1504~3':_stg %_1502~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_1590
	mov rdi,r8
	call dlt
LB_1590:
	bt r12,1
	jc LB_1591
	mov rdi,r14
	call dlt
LB_1591:
	bt r12,3
	jc LB_1592
	mov rdi,r9
	call dlt
LB_1592:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1593
	btr r12,1
	jmp LB_1594
LB_1593:
	bts r12,1
LB_1594:
	ret
MTC_LB_1572:
MTC_LB_1524:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1595
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' }
; 1' ⊢ °1◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1596
	bt QWORD [rdi],0
	jc LB_1597
	btr r12,4
	jmp LB_1598
LB_1597:
	bts r12,4
LB_1598:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1596:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1601
	btr r12,5
	jmp LB_1602
LB_1601:
	bts r12,5
LB_1602:
	mov r8,r11
	bt r12,5
	jc LB_1599
	btr r12,2
	jmp LB_1600
LB_1599:
	bts r12,2
LB_1600:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1605
	btr r12,5
	jmp LB_1606
LB_1605:
	bts r12,5
LB_1606:
	mov r9,r11
	bt r12,5
	jc LB_1603
	btr r12,3
	jmp LB_1604
LB_1603:
	bts r12,3
LB_1604:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1607:
	cmp r15,0
	jz LB_1608
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1607
LB_1608:
MTC_LB_1609:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1610
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_1611
	bt QWORD [rdi],0
	jc LB_1612
	btr r12,4
	jmp LB_1613
LB_1612:
	bts r12,4
LB_1613:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1611:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_1614
	btr r12,1
	jmp LB_1615
LB_1614:
	bts r12,1
LB_1615:
LB_1616:
	cmp r15,0
	jz LB_1617
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1616
LB_1617:
; _f1522 { %_1483 %_1508 } ⊢ { %_1509 %_1510 } : { %_1509 %_1510 }
 ; {>  %_1508~1':_p803 %_1483~0':_r64 %_1506~2':(_lst)◂(_p805) }
; _f1522 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1522
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1618
	btr r12,2
	jmp LB_1619
LB_1618:
	bts r12,2
LB_1619:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_1620:
	cmp rax,0
	jz LB_1621
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1620
LB_1621:
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1511 %_1513 }
 ; {>  %_1512~1':_stg %_1513~3':_stg %_1511~0':_r64 %_1506~2':(_lst)◂(_p805) }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_1622
	mov rdi,r14
	call dlt
LB_1622:
	bt r12,2
	jc LB_1623
	mov rdi,r8
	call dlt
LB_1623:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1624
	btr r12,1
	jmp LB_1625
LB_1624:
	bts r12,1
LB_1625:
	ret
MTC_LB_1610:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1626
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_1627
	bt QWORD [rdi],0
	jc LB_1628
	btr r12,4
	jmp LB_1629
LB_1628:
	bts r12,4
LB_1629:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1627:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_1630
	btr r12,1
	jmp LB_1631
LB_1630:
	bts r12,1
LB_1631:
LB_1632:
	cmp r15,0
	jz LB_1633
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1632
LB_1633:
; _f56 %_1483 ⊢ %_1515 : %_1515
 ; {>  %_1514~1':_p802 %_1483~0':_r64 %_1506~2':(_lst)◂(_p805) }
	add r13,1
; _f1446 { %_1515 %_1514 } ⊢ { %_1516 %_1517 } : { %_1516 %_1517 }
 ; {>  %_1514~1':_p802 %_1515~0':_r64 %_1506~2':(_lst)◂(_p805) }
; _f1446 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1634
	btr r12,2
	jmp LB_1635
LB_1634:
	bts r12,2
LB_1635:
	add rsp,16
; _f55 %_1516 ⊢ %_1518 : %_1518
 ; {>  %_1517~1':_stg %_1516~0':_r64 %_1506~2':(_lst)◂(_p805) }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_1636:
	cmp rax,0
	jz LB_1637
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1636
LB_1637:
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1519 %_1521 }
 ; {>  %_1519~0':_r64 %_1521~3':_stg %_1520~1':_stg %_1506~2':(_lst)◂(_p805) }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_1638
	mov rdi,r14
	call dlt
LB_1638:
	bt r12,2
	jc LB_1639
	mov rdi,r8
	call dlt
LB_1639:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1640
	btr r12,1
	jmp LB_1641
LB_1640:
	bts r12,1
LB_1641:
	ret
MTC_LB_1626:
MTC_LB_1595:
NS_E_1482:
; 	|» { 0' { 1' 2' 3' } }
NS_E_RDI_1482:
; _f931 %_1449 ⊢ %_1451 : %_1451
 ; {>  %_1450~3':_p799 %_1449~2':_p798 %_1448~1':_p807 %_1447~0':_r64 }
; _f931 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1648
	btr r12,0
	jmp LB_1649
LB_1648:
	bts r12,0
LB_1649:
	call NS_E_931
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_1650
	btr r12,2
	jmp LB_1651
LB_1650:
	bts r12,2
LB_1651:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1646
	btr r12,3
	jmp LB_1647
LB_1646:
	bts r12,3
LB_1647:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1644
	btr r12,1
	jmp LB_1645
LB_1644:
	bts r12,1
LB_1645:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1642
	btr r12,0
	jmp LB_1643
LB_1642:
	bts r12,0
LB_1643:
	add rsp,32
; _f950 %_1450 ⊢ %_1452 : %_1452
 ; {>  %_1450~3':_p799 %_1451~2':_stg %_1448~1':_p807 %_1447~0':_r64 }
; _f950 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1658
	btr r12,0
	jmp LB_1659
LB_1658:
	bts r12,0
LB_1659:
	call NS_E_950
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_1660
	btr r12,3
	jmp LB_1661
LB_1660:
	bts r12,3
LB_1661:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1656
	btr r12,2
	jmp LB_1657
LB_1656:
	bts r12,2
LB_1657:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1654
	btr r12,1
	jmp LB_1655
LB_1654:
	bts r12,1
LB_1655:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1652
	btr r12,0
	jmp LB_1653
LB_1652:
	bts r12,0
LB_1653:
	add rsp,32
MTC_LB_1662:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1663
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °0◂4'
; 1' ⊢ °0◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1664
	bt QWORD [rdi],0
	jc LB_1665
	btr r12,5
	jmp LB_1666
LB_1665:
	bts r12,5
LB_1666:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1664:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_1667
	btr r12,4
	jmp LB_1668
LB_1667:
	bts r12,4
LB_1668:
LB_1669:
	cmp r15,0
	jz LB_1670
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1669
LB_1670:
; _f746 %_1453 ⊢ %_1454 : %_1454
 ; {>  %_1452~3':_stg %_1453~4':_p735 %_1451~2':_stg %_1447~0':_r64 }
; _f746 4' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_1677
	btr r12,0
	jmp LB_1678
LB_1677:
	bts r12,0
LB_1678:
	call NS_E_746
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1679
	btr r12,1
	jmp LB_1680
LB_1679:
	bts r12,1
LB_1680:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1675
	btr r12,3
	jmp LB_1676
LB_1675:
	bts r12,3
LB_1676:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1673
	btr r12,2
	jmp LB_1674
LB_1673:
	bts r12,2
LB_1674:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1671
	btr r12,0
	jmp LB_1672
LB_1671:
	bts r12,0
LB_1672:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_1681:
	cmp rax,0
	jz LB_1682
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1681
LB_1682:
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_1455 %_1459 }
 ; {>  %_1455~0':_r64 %_1459~4':_stg %_1458~3':_stg %_1457~2':_stg %_1456~1':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_1683
	mov rdi,r9
	call dlt
LB_1683:
	bt r12,2
	jc LB_1684
	mov rdi,r8
	call dlt
LB_1684:
	bt r12,1
	jc LB_1685
	mov rdi,r14
	call dlt
LB_1685:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1686
	btr r12,1
	jmp LB_1687
LB_1686:
	bts r12,1
LB_1687:
	ret
MTC_LB_1663:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1688
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °1◂4'
; 1' ⊢ °1◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1689
	bt QWORD [rdi],0
	jc LB_1690
	btr r12,5
	jmp LB_1691
LB_1690:
	bts r12,5
LB_1691:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1689:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_1692
	btr r12,4
	jmp LB_1693
LB_1692:
	bts r12,4
LB_1693:
LB_1694:
	cmp r15,0
	jz LB_1695
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1694
LB_1695:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_1696:
	cmp rax,0
	jz LB_1697
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1696
LB_1697:
; "$ "
	mov rsi,0x_24
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_1461 %_1464 }
 ; {>  %_1462~2':_stg %_1461~0':_r64 %_1464~1':_stg %_1463~3':_stg %_1460~4':_r64 }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_1698
	mov rdi,r8
	call dlt
LB_1698:
	bt r12,3
	jc LB_1699
	mov rdi,r9
	call dlt
LB_1699:
	bt r12,4
	jc LB_1700
	mov rdi,r10
	call dlt
LB_1700:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_1688:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_1701
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1702
	bt QWORD [rdi],0
	jc LB_1703
	btr r12,4
	jmp LB_1704
LB_1703:
	bts r12,4
LB_1704:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1702:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1705:
	cmp r15,0
	jz LB_1706
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1705
LB_1706:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_1707:
	cmp rax,0
	jz LB_1708
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1707
LB_1708:
; "\226\151\130 "
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_97
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_82
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_1465 %_1468 }
 ; {>  %_1466~2':_stg %_1467~3':_stg %_1468~1':_stg %_1465~0':_r64 }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_1709
	mov rdi,r8
	call dlt
LB_1709:
	bt r12,3
	jc LB_1710
	mov rdi,r9
	call dlt
LB_1710:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_1701:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_1711
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °3◂4'
; 1' ⊢ °3◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1712
	bt QWORD [rdi],0
	jc LB_1713
	btr r12,5
	jmp LB_1714
LB_1713:
	bts r12,5
LB_1714:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1712:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_1715
	btr r12,4
	jmp LB_1716
LB_1715:
	bts r12,4
LB_1716:
LB_1717:
	cmp r15,0
	jz LB_1718
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1717
LB_1718:
; _f890 %_1469 ⊢ %_1470 : %_1470
 ; {>  %_1452~3':_stg %_1451~2':_stg %_1469~4':_p801 %_1447~0':_r64 }
; _f890 4' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_1725
	btr r12,0
	jmp LB_1726
LB_1725:
	bts r12,0
LB_1726:
	call NS_E_890
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1727
	btr r12,1
	jmp LB_1728
LB_1727:
	bts r12,1
LB_1728:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1723
	btr r12,3
	jmp LB_1724
LB_1723:
	bts r12,3
LB_1724:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1721
	btr r12,2
	jmp LB_1722
LB_1721:
	bts r12,2
LB_1722:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1719
	btr r12,0
	jmp LB_1720
LB_1719:
	bts r12,0
LB_1720:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_1729:
	cmp rax,0
	jz LB_1730
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1729
LB_1730:
; "\194\187 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_1471 %_1475 }
 ; {>  %_1474~3':_stg %_1472~1':_stg %_1475~4':_stg %_1473~2':_stg %_1471~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_1731
	mov rdi,r9
	call dlt
LB_1731:
	bt r12,1
	jc LB_1732
	mov rdi,r14
	call dlt
LB_1732:
	bt r12,2
	jc LB_1733
	mov rdi,r8
	call dlt
LB_1733:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1734
	btr r12,1
	jmp LB_1735
LB_1734:
	bts r12,1
LB_1735:
	ret
MTC_LB_1711:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_1736
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °4◂{ 4' 5' }
; 1' ⊢ °4◂{ 4' 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1737
	bt QWORD [rdi],0
	jc LB_1738
	btr r12,6
	jmp LB_1739
LB_1738:
	bts r12,6
LB_1739:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1737:
	mov rcx,rdi
; 6' ⊢ { 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_1742
	btr r12,7
	jmp LB_1743
LB_1742:
	bts r12,7
LB_1743:
	mov r10,rdx
	bt r12,7
	jc LB_1740
	btr r12,4
	jmp LB_1741
LB_1740:
	bts r12,4
LB_1741:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_1746
	btr r12,7
	jmp LB_1747
LB_1746:
	bts r12,7
LB_1747:
	mov r11,rdx
	bt r12,7
	jc LB_1744
	btr r12,5
	jmp LB_1745
LB_1744:
	bts r12,5
LB_1745:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1748:
	cmp r15,0
	jz LB_1749
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1748
LB_1749:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,6
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_1750:
	cmp rax,0
	jz LB_1751
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1750
LB_1751:
; "\194\187 _^ "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_5f
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_5e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; " .. //\n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_1478 %_1481 }
 ; {>  %_1480~3':_stg %_1478~0':_r64 %_1479~2':_stg %_1477~5':(_lst)◂(_p808) %_1476~4':_r64 %_1481~1':_stg }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_1752
	mov rdi,r9
	call dlt
LB_1752:
	bt r12,2
	jc LB_1753
	mov rdi,r8
	call dlt
LB_1753:
	bt r12,5
	jc LB_1754
	mov rdi,r11
	call dlt
LB_1754:
	bt r12,4
	jc LB_1755
	mov rdi,r10
	call dlt
LB_1755:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_1736:
NS_E_1446:
; 	|» { 0' 1' }
NS_E_RDI_1446:
MTC_LB_1756:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1757
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' 4' } 5' }
; 1' ⊢ °0◂{ { 2' 3' 4' } 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1758
	bt QWORD [rdi],0
	jc LB_1759
	btr r12,6
	jmp LB_1760
LB_1759:
	bts r12,6
LB_1760:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1758:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_1773
	btr r12,7
	jmp LB_1774
LB_1773:
	bts r12,7
LB_1774:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1763
	btr r12,5
	jmp LB_1764
LB_1763:
	bts r12,5
LB_1764:
	mov r8,r11
	bt r12,5
	jc LB_1761
	btr r12,2
	jmp LB_1762
LB_1761:
	bts r12,2
LB_1762:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1767
	btr r12,5
	jmp LB_1768
LB_1767:
	bts r12,5
LB_1768:
	mov r9,r11
	bt r12,5
	jc LB_1765
	btr r12,3
	jmp LB_1766
LB_1765:
	bts r12,3
LB_1766:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_1771
	btr r12,5
	jmp LB_1772
LB_1771:
	bts r12,5
LB_1772:
	mov r10,r11
	bt r12,5
	jc LB_1769
	btr r12,4
	jmp LB_1770
LB_1769:
	bts r12,4
LB_1770:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_1777
	btr r12,7
	jmp LB_1778
LB_1777:
	bts r12,7
LB_1778:
	mov r11,rdx
	bt r12,7
	jc LB_1775
	btr r12,5
	jmp LB_1776
LB_1775:
	bts r12,5
LB_1776:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1779:
	cmp r15,0
	jz LB_1780
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1779
LB_1780:
; _f1482 { %_1429 %_1431 } ⊢ { %_1433 %_1434 } : { %_1433 %_1434 }
 ; {>  %_1432~5':_p802 %_1429~0':_r64 %_1431~{ 2' 3' 4' }:{ _p807 _p798 _p799 } }
; _f1482 { 0' { 2' 3' 4' } } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 101110.. |},{ 0' { 2' 3' 4' } } ⊢ { 0' { 1' 2' 3' } }
	mov r14,r8
	bt r12,2
	jc LB_1783
	btr r12,1
	jmp LB_1784
LB_1783:
	bts r12,1
LB_1784:
	mov r8,r9
	bt r12,3
	jc LB_1785
	btr r12,2
	jmp LB_1786
LB_1785:
	bts r12,2
LB_1786:
	mov r9,r10
	bt r12,4
	jc LB_1787
	btr r12,3
	jmp LB_1788
LB_1787:
	bts r12,3
LB_1788:
	call NS_E_1482
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*0]
	bt QWORD rax,5
	jc LB_1781
	btr r12,5
	jmp LB_1782
LB_1781:
	bts r12,5
LB_1782:
	add rsp,16
; _f1446 { %_1433 %_1432 } ⊢ { %_1435 %_1436 } : { %_1435 %_1436 }
 ; {>  %_1432~5':_p802 %_1434~1':_stg %_1433~0':_r64 }
; _f1446 { 0' 5' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_1791
	btr r12,1
	jmp LB_1792
LB_1791:
	bts r12,1
LB_1792:
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_1793
	btr r12,2
	jmp LB_1794
LB_1793:
	bts r12,2
LB_1794:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1789
	btr r12,1
	jmp LB_1790
LB_1789:
	bts r12,1
LB_1790:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1435 %_1439 }
 ; {>  %_1439~3':_stg %_1437~1':_stg %_1438~2':_stg %_1435~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_1795
	mov rdi,r14
	call dlt
LB_1795:
	bt r12,2
	jc LB_1796
	mov rdi,r8
	call dlt
LB_1796:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1797
	btr r12,1
	jmp LB_1798
LB_1797:
	bts r12,1
LB_1798:
	ret
MTC_LB_1757:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1799
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1800
	bt QWORD [rdi],0
	jc LB_1801
	btr r12,3
	jmp LB_1802
LB_1801:
	bts r12,3
LB_1802:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1800:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_1803
	btr r12,2
	jmp LB_1804
LB_1803:
	bts r12,2
LB_1804:
LB_1805:
	cmp r15,0
	jz LB_1806
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1805
LB_1806:
; _f1522 { %_1429 %_1440 } ⊢ { %_1441 %_1442 } : { %_1441 %_1442 }
 ; {>  %_1440~2':_p803 %_1429~0':_r64 }
; _f1522 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_1807
	btr r12,1
	jmp LB_1808
LB_1807:
	bts r12,1
LB_1808:
	call NS_E_1522
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_1441 %_1442 }
 ; {>  %_1442~1':_stg %_1441~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_1799:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_1809
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂2'
; 1' ⊢ °2◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1810
	bt QWORD [rdi],0
	jc LB_1811
	btr r12,3
	jmp LB_1812
LB_1811:
	bts r12,3
LB_1812:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1810:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_1813
	btr r12,2
	jmp LB_1814
LB_1813:
	bts r12,2
LB_1814:
LB_1815:
	cmp r15,0
	jz LB_1816
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1815
LB_1816:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_1817:
	cmp rax,0
	jz LB_1818
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1817
LB_1818:
; "\226\136\142 ..\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_1444 %_1445 }
 ; {>  %_1443~2':_p798 %_1444~0':_r64 %_1445~1':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_1819
	mov rdi,r8
	call dlt
LB_1819:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_1809:
NS_E_1428:
; 	|» { 0' 1' }
NS_E_RDI_1428:
MTC_LB_1820:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1821
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' 4' } 5' }
; 1' ⊢ °0◂{ { 2' 3' 4' } 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1822
	bt QWORD [rdi],0
	jc LB_1823
	btr r12,6
	jmp LB_1824
LB_1823:
	bts r12,6
LB_1824:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1822:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_1837
	btr r12,7
	jmp LB_1838
LB_1837:
	bts r12,7
LB_1838:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1827
	btr r12,5
	jmp LB_1828
LB_1827:
	bts r12,5
LB_1828:
	mov r8,r11
	bt r12,5
	jc LB_1825
	btr r12,2
	jmp LB_1826
LB_1825:
	bts r12,2
LB_1826:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1831
	btr r12,5
	jmp LB_1832
LB_1831:
	bts r12,5
LB_1832:
	mov r9,r11
	bt r12,5
	jc LB_1829
	btr r12,3
	jmp LB_1830
LB_1829:
	bts r12,3
LB_1830:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_1835
	btr r12,5
	jmp LB_1836
LB_1835:
	bts r12,5
LB_1836:
	mov r10,r11
	bt r12,5
	jc LB_1833
	btr r12,4
	jmp LB_1834
LB_1833:
	bts r12,4
LB_1834:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_1841
	btr r12,7
	jmp LB_1842
LB_1841:
	bts r12,7
LB_1842:
	mov r11,rdx
	bt r12,7
	jc LB_1839
	btr r12,5
	jmp LB_1840
LB_1839:
	bts r12,5
LB_1840:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1843:
	cmp r15,0
	jz LB_1844
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1843
LB_1844:
; _f950 %_1411 ⊢ %_1414 : %_1414
 ; {>  %_1410~2':_stg %_1408~0':_r64 %_1413~5':(_lst)◂({ _stg _p799 _p802 }) %_1412~4':_p802 %_1411~3':_p799 }
; _f950 3' ⊢ 1'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_1853
	btr r12,0
	jmp LB_1854
LB_1853:
	bts r12,0
LB_1854:
	call NS_E_950
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1855
	btr r12,1
	jmp LB_1856
LB_1855:
	bts r12,1
LB_1856:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_1851
	btr r12,5
	jmp LB_1852
LB_1851:
	bts r12,5
LB_1852:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_1849
	btr r12,4
	jmp LB_1850
LB_1849:
	bts r12,4
LB_1850:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1847
	btr r12,2
	jmp LB_1848
LB_1847:
	bts r12,2
LB_1848:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1845
	btr r12,0
	jmp LB_1846
LB_1845:
	bts r12,0
LB_1846:
	add rsp,40
; _f1428 { %_1408 %_1413 } ⊢ { %_1415 %_1416 } : { %_1415 %_1416 }
 ; {>  %_1410~2':_stg %_1414~1':_stg %_1408~0':_r64 %_1413~5':(_lst)◂({ _stg _p799 _p802 }) %_1412~4':_p802 }
; _f1428 { 0' 5' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_1863
	btr r12,1
	jmp LB_1864
LB_1863:
	bts r12,1
LB_1864:
	call NS_E_1428
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_1865
	btr r12,3
	jmp LB_1866
LB_1865:
	bts r12,3
LB_1866:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_1861
	btr r12,4
	jmp LB_1862
LB_1861:
	bts r12,4
LB_1862:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1859
	btr r12,2
	jmp LB_1860
LB_1859:
	bts r12,2
LB_1860:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1857
	btr r12,1
	jmp LB_1858
LB_1857:
	bts r12,1
LB_1858:
	add rsp,32
; _f56 %_1415 ⊢ %_1417 : %_1417
 ; {>  %_1410~2':_stg %_1416~3':_stg %_1414~1':_stg %_1415~0':_r64 %_1412~4':_p802 }
	add r13,1
; _f1446 { %_1417 %_1412 } ⊢ { %_1418 %_1419 } : { %_1418 %_1419 }
 ; {>  %_1410~2':_stg %_1416~3':_stg %_1414~1':_stg %_1417~0':_r64 %_1412~4':_p802 }
; _f1446 { 0' 4' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_1873
	btr r12,1
	jmp LB_1874
LB_1873:
	bts r12,1
LB_1874:
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_1875
	btr r12,4
	jmp LB_1876
LB_1875:
	bts r12,4
LB_1876:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_1871
	btr r12,3
	jmp LB_1872
LB_1871:
	bts r12,3
LB_1872:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_1869
	btr r12,2
	jmp LB_1870
LB_1869:
	bts r12,2
LB_1870:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1867
	btr r12,1
	jmp LB_1868
LB_1867:
	bts r12,1
LB_1868:
	add rsp,32
; _f55 %_1418 ⊢ %_1420 : %_1420
 ; {>  %_1410~2':_stg %_1416~3':_stg %_1414~1':_stg %_1418~0':_r64 %_1419~4':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r11,rax
	btr r12,5
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_1877:
	cmp rax,0
	jz LB_1878
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_1877
LB_1878:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 4'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1421 %_1426 }
 ; {>  %_1421~0':_r64 %_1426~5':_stg %_1425~3':_stg %_1424~4':_stg %_1422~2':_stg %_1423~1':_stg }
; 	∎ { 0' 5' }
	bt r12,3
	jc LB_1879
	mov rdi,r9
	call dlt
LB_1879:
	bt r12,4
	jc LB_1880
	mov rdi,r10
	call dlt
LB_1880:
	bt r12,2
	jc LB_1881
	mov rdi,r8
	call dlt
LB_1881:
	bt r12,1
	jc LB_1882
	mov rdi,r14
	call dlt
LB_1882:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_1883
	btr r12,1
	jmp LB_1884
LB_1883:
	bts r12,1
LB_1884:
	ret
MTC_LB_1821:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1885
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1886
	bt QWORD [rdi],0
	jc LB_1887
	btr r12,2
	jmp LB_1888
LB_1887:
	bts r12,2
LB_1888:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1886:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1889:
	cmp r15,0
	jz LB_1890
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1889
LB_1890:
; 	» "" _ ⊢ 1' : %_1427
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_1408 %_1427 }
 ; {>  %_1408~0':_r64 %_1427~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_1885:
NS_E_1407:
; 	|» { 0' 1' }
NS_E_RDI_1407:
MTC_LB_1891:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1892
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1893
	bt QWORD [rdi],0
	jc LB_1894
	btr r12,4
	jmp LB_1895
LB_1894:
	bts r12,4
LB_1895:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1893:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1898
	btr r12,5
	jmp LB_1899
LB_1898:
	bts r12,5
LB_1899:
	mov r8,r11
	bt r12,5
	jc LB_1896
	btr r12,2
	jmp LB_1897
LB_1896:
	bts r12,2
LB_1897:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1902
	btr r12,5
	jmp LB_1903
LB_1902:
	bts r12,5
LB_1903:
	mov r9,r11
	bt r12,5
	jc LB_1900
	btr r12,3
	jmp LB_1901
LB_1900:
	bts r12,3
LB_1901:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1904:
	cmp r15,0
	jz LB_1905
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1904
LB_1905:
; _f950 %_1386 ⊢ %_1388 : %_1388
 ; {>  %_1384~0':_r64 %_1386~2':_p799 %_1387~3':_p802 }
; _f950 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1910
	btr r12,0
	jmp LB_1911
LB_1910:
	bts r12,0
LB_1911:
	call NS_E_950
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1912
	btr r12,1
	jmp LB_1913
LB_1912:
	bts r12,1
LB_1913:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_1908
	btr r12,3
	jmp LB_1909
LB_1908:
	bts r12,3
LB_1909:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1906
	btr r12,0
	jmp LB_1907
LB_1906:
	bts r12,0
LB_1907:
	add rsp,24
; _f56 %_1384 ⊢ %_1389 : %_1389
 ; {>  %_1384~0':_r64 %_1388~1':_stg %_1387~3':_p802 }
	add r13,1
; _f1446 { %_1389 %_1387 } ⊢ { %_1390 %_1391 } : { %_1390 %_1391 }
 ; {>  %_1388~1':_stg %_1387~3':_p802 %_1389~0':_r64 }
; _f1446 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1916
	btr r12,1
	jmp LB_1917
LB_1916:
	bts r12,1
LB_1917:
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_1918
	btr r12,2
	jmp LB_1919
LB_1918:
	bts r12,2
LB_1919:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1914
	btr r12,1
	jmp LB_1915
LB_1914:
	bts r12,1
LB_1915:
	add rsp,16
; _f55 %_1390 ⊢ %_1392 : %_1392
 ; {>  %_1390~0':_r64 %_1391~2':_stg %_1388~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1392 %_1395 }
 ; {>  %_1392~0':_r64 %_1395~3':_stg %_1394~2':_stg %_1393~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_1920
	mov rdi,r8
	call dlt
LB_1920:
	bt r12,1
	jc LB_1921
	mov rdi,r14
	call dlt
LB_1921:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_1922
	btr r12,1
	jmp LB_1923
LB_1922:
	bts r12,1
LB_1923:
	ret
MTC_LB_1892:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1924
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1925
	bt QWORD [rdi],0
	jc LB_1926
	btr r12,3
	jmp LB_1927
LB_1926:
	bts r12,3
LB_1927:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1925:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_1928
	btr r12,2
	jmp LB_1929
LB_1928:
	bts r12,2
LB_1929:
LB_1930:
	cmp r15,0
	jz LB_1931
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1930
LB_1931:
; _f890 %_1396 ⊢ %_1397 : %_1397
 ; {>  %_1384~0':_r64 %_1396~2':_p801 }
; _f890 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1934
	btr r12,0
	jmp LB_1935
LB_1934:
	bts r12,0
LB_1935:
	call NS_E_890
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1936
	btr r12,1
	jmp LB_1937
LB_1936:
	bts r12,1
LB_1937:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1932
	btr r12,0
	jmp LB_1933
LB_1932:
	bts r12,0
LB_1933:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_1384 %_1399 }
 ; {>  %_1399~2':_stg %_1384~0':_r64 %_1398~1':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_1938
	mov rdi,r14
	call dlt
LB_1938:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_1939
	btr r12,1
	jmp LB_1940
LB_1939:
	bts r12,1
LB_1940:
	ret
MTC_LB_1924:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_1941
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂2'
; 1' ⊢ °2◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_1942
	bt QWORD [rdi],0
	jc LB_1943
	btr r12,3
	jmp LB_1944
LB_1943:
	bts r12,3
LB_1944:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1942:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_1945
	btr r12,2
	jmp LB_1946
LB_1945:
	bts r12,2
LB_1946:
LB_1947:
	cmp r15,0
	jz LB_1948
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1947
LB_1948:
; _f56 %_1384 ⊢ %_1401 : %_1401
 ; {>  %_1384~0':_r64 %_1400~2':_p802 }
	add r13,1
; _f1446 { %_1401 %_1400 } ⊢ { %_1402 %_1403 } : { %_1402 %_1403 }
 ; {>  %_1401~0':_r64 %_1400~2':_p802 }
; _f1446 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_1949
	btr r12,1
	jmp LB_1950
LB_1949:
	bts r12,1
LB_1950:
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_1402 ⊢ %_1404 : %_1404
 ; {>  %_1403~1':_stg %_1402~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,5
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " \194\171 \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_ab
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1404 %_1406 }
 ; {>  %_1404~0':_r64 %_1405~1':_stg %_1406~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_1951
	mov rdi,r14
	call dlt
LB_1951:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_1952
	btr r12,1
	jmp LB_1953
LB_1952:
	bts r12,1
LB_1953:
	ret
MTC_LB_1941:
NS_E_1383:
; 	|» 0'
NS_E_RDI_1383:
MTC_LB_1954:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1955
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_1956
	bt QWORD [rdi],0
	jc LB_1957
	btr r12,3
	jmp LB_1958
LB_1957:
	bts r12,3
LB_1958:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1956:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1961
	btr r12,4
	jmp LB_1962
LB_1961:
	bts r12,4
LB_1962:
	mov r14,r10
	bt r12,4
	jc LB_1959
	btr r12,1
	jmp LB_1960
LB_1959:
	bts r12,1
LB_1960:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1965
	btr r12,4
	jmp LB_1966
LB_1965:
	bts r12,4
LB_1966:
	mov r8,r10
	bt r12,4
	jc LB_1963
	btr r12,2
	jmp LB_1964
LB_1963:
	bts r12,2
LB_1964:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1967:
	cmp r15,0
	jz LB_1968
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1967
LB_1968:
; _f1373 %_1375 ⊢ %_1377 : %_1377
 ; {>  %_1376~2':(_lst)◂(_p800) %_1375~1':_p800 }
; _f1373 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1971
	btr r12,0
	jmp LB_1972
LB_1971:
	bts r12,0
LB_1972:
	call NS_E_1373
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1969
	btr r12,2
	jmp LB_1970
LB_1969:
	bts r12,2
LB_1970:
	add rsp,16
; _f1383 %_1376 ⊢ %_1378 : %_1378
 ; {>  %_1376~2':(_lst)◂(_p800) %_1377~0':_stg }
; _f1383 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1975
	btr r12,0
	jmp LB_1976
LB_1975:
	bts r12,0
LB_1976:
	call NS_E_1383
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1977
	btr r12,1
	jmp LB_1978
LB_1977:
	bts r12,1
LB_1978:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1973
	btr r12,0
	jmp LB_1974
LB_1973:
	bts r12,0
LB_1974:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_1381
 ; {>  %_1379~0':_stg %_1381~2':_stg %_1380~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_1979
	mov rdi,r13
	call dlt
LB_1979:
	bt r12,1
	jc LB_1980
	mov rdi,r14
	call dlt
LB_1980:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_1981
	btr r12,0
	jmp LB_1982
LB_1981:
	bts r12,0
LB_1982:
	ret
MTC_LB_1955:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_1983
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_1984
	bt QWORD [rdi],0
	jc LB_1985
	btr r12,1
	jmp LB_1986
LB_1985:
	bts r12,1
LB_1986:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1984:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_1987:
	cmp r15,0
	jz LB_1988
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1987
LB_1988:
; 	» "" _ ⊢ 0' : %_1382
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1382
 ; {>  %_1382~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_1983:
NS_E_1373:
; 	|» 0'
NS_E_RDI_1373:
MTC_LB_1989:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_1990
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_1991
	bt QWORD [rdi],0
	jc LB_1992
	btr r12,2
	jmp LB_1993
LB_1992:
	bts r12,2
LB_1993:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_1991:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_1994
	btr r12,1
	jmp LB_1995
LB_1994:
	bts r12,1
LB_1995:
LB_1996:
	cmp r15,0
	jz LB_1997
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1996
LB_1997:
; _f1383 %_1350 ⊢ %_1351 : %_1351
 ; {>  %_1350~1':(_lst)◂(_p800) }
; _f1383 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_1998
	btr r12,0
	jmp LB_1999
LB_1998:
	bts r12,0
LB_1999:
	call NS_E_1383
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_1353
 ; {>  %_1352~0':_stg %_1353~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_2000
	mov rdi,r13
	call dlt
LB_2000:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2001
	btr r12,0
	jmp LB_2002
LB_2001:
	bts r12,0
LB_2002:
	ret
MTC_LB_1990:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2003
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{ 1' 2' }
; 0' ⊢ °1◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2004
	bt QWORD [rdi],0
	jc LB_2005
	btr r12,3
	jmp LB_2006
LB_2005:
	bts r12,3
LB_2006:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2004:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2009
	btr r12,4
	jmp LB_2010
LB_2009:
	bts r12,4
LB_2010:
	mov r14,r10
	bt r12,4
	jc LB_2007
	btr r12,1
	jmp LB_2008
LB_2007:
	bts r12,1
LB_2008:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2013
	btr r12,4
	jmp LB_2014
LB_2013:
	bts r12,4
LB_2014:
	mov r8,r10
	bt r12,4
	jc LB_2011
	btr r12,2
	jmp LB_2012
LB_2011:
	bts r12,2
LB_2012:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2015:
	cmp r15,0
	jz LB_2016
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2015
LB_2016:
; _f1373 %_1354 ⊢ %_1356 : %_1356
 ; {>  %_1354~1':_p800 %_1355~2':_p800 }
; _f1373 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2019
	btr r12,0
	jmp LB_2020
LB_2019:
	bts r12,0
LB_2020:
	call NS_E_1373
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2017
	btr r12,2
	jmp LB_2018
LB_2017:
	bts r12,2
LB_2018:
	add rsp,16
; _f1373 %_1355 ⊢ %_1357 : %_1357
 ; {>  %_1356~0':_stg %_1355~2':_p800 }
; _f1373 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2023
	btr r12,0
	jmp LB_2024
LB_2023:
	bts r12,0
LB_2024:
	call NS_E_1373
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2025
	btr r12,1
	jmp LB_2026
LB_2025:
	bts r12,1
LB_2026:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2021
	btr r12,0
	jmp LB_2022
LB_2021:
	bts r12,0
LB_2022:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\134\146 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_86
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_92
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_1360
 ; {>  %_1360~2':_stg %_1359~1':_stg %_1358~0':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_2027
	mov rdi,r14
	call dlt
LB_2027:
	bt r12,0
	jc LB_2028
	mov rdi,r13
	call dlt
LB_2028:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2029
	btr r12,0
	jmp LB_2030
LB_2029:
	bts r12,0
LB_2030:
	ret
MTC_LB_2003:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2031
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂{ 1' 2' }
; 0' ⊢ °2◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2032
	bt QWORD [rdi],0
	jc LB_2033
	btr r12,3
	jmp LB_2034
LB_2033:
	bts r12,3
LB_2034:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2032:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2037
	btr r12,4
	jmp LB_2038
LB_2037:
	bts r12,4
LB_2038:
	mov r14,r10
	bt r12,4
	jc LB_2035
	btr r12,1
	jmp LB_2036
LB_2035:
	bts r12,1
LB_2036:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2041
	btr r12,4
	jmp LB_2042
LB_2041:
	bts r12,4
LB_2042:
	mov r8,r10
	bt r12,4
	jc LB_2039
	btr r12,2
	jmp LB_2040
LB_2039:
	bts r12,2
LB_2040:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2043:
	cmp r15,0
	jz LB_2044
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2043
LB_2044:
; _f1373 %_1361 ⊢ %_1363 : %_1363
 ; {>  %_1361~1':_p800 %_1362~2':_p800 }
; _f1373 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2047
	btr r12,0
	jmp LB_2048
LB_2047:
	bts r12,0
LB_2048:
	call NS_E_1373
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2045
	btr r12,2
	jmp LB_2046
LB_2045:
	bts r12,2
LB_2046:
	add rsp,16
; _f1373 %_1362 ⊢ %_1364 : %_1364
 ; {>  %_1363~0':_stg %_1362~2':_p800 }
; _f1373 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2051
	btr r12,0
	jmp LB_2052
LB_2051:
	bts r12,0
LB_2052:
	call NS_E_1373
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2053
	btr r12,1
	jmp LB_2054
LB_2053:
	bts r12,1
LB_2054:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2049
	btr r12,0
	jmp LB_2050
LB_2049:
	bts r12,0
LB_2050:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\226\151\130"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_97
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_82
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_1367
 ; {>  %_1365~0':_stg %_1367~2':_stg %_1366~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_2055
	mov rdi,r13
	call dlt
LB_2055:
	bt r12,1
	jc LB_2056
	mov rdi,r14
	call dlt
LB_2056:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2057
	btr r12,0
	jmp LB_2058
LB_2057:
	bts r12,0
LB_2058:
	ret
MTC_LB_2031:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2059
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °3◂1'
; 0' ⊢ °3◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2060
	bt QWORD [rdi],0
	jc LB_2061
	btr r12,2
	jmp LB_2062
LB_2061:
	bts r12,2
LB_2062:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2060:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2063
	btr r12,1
	jmp LB_2064
LB_2063:
	bts r12,1
LB_2064:
LB_2065:
	cmp r15,0
	jz LB_2066
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2065
LB_2066:
; _f746 %_1368 ⊢ %_1369 : %_1369
 ; {>  %_1368~1':_p735 }
; _f746 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2067
	btr r12,0
	jmp LB_2068
LB_2067:
	bts r12,0
LB_2068:
	call NS_E_746
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_1369
 ; {>  %_1369~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2059:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_2069
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °4◂1'
; 0' ⊢ °4◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2070
	bt QWORD [rdi],0
	jc LB_2071
	btr r12,2
	jmp LB_2072
LB_2071:
	bts r12,2
LB_2072:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2070:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_2073
	btr r12,1
	jmp LB_2074
LB_2073:
	bts r12,1
LB_2074:
LB_2075:
	cmp r15,0
	jz LB_2076
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2075
LB_2076:
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "'"
	mov rsi,0x_27
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_1372
 ; {>  %_1371~1':_stg %_1372~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_2077
	mov rdi,r14
	call dlt
LB_2077:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2069:
NS_E_1348:
; 	|» { 0' 1' }
NS_E_RDI_1348:
MTC_LB_2078:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2079
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2080
	bt QWORD [rdi],0
	jc LB_2081
	btr r12,5
	jmp LB_2082
LB_2081:
	bts r12,5
LB_2082:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2080:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2091
	btr r12,6
	jmp LB_2092
LB_2091:
	bts r12,6
LB_2092:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2085
	btr r12,4
	jmp LB_2086
LB_2085:
	bts r12,4
LB_2086:
	mov r8,r10
	bt r12,4
	jc LB_2083
	btr r12,2
	jmp LB_2084
LB_2083:
	bts r12,2
LB_2084:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2089
	btr r12,4
	jmp LB_2090
LB_2089:
	bts r12,4
LB_2090:
	mov r9,r10
	bt r12,4
	jc LB_2087
	btr r12,3
	jmp LB_2088
LB_2087:
	bts r12,3
LB_2088:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2095
	btr r12,6
	jmp LB_2096
LB_2095:
	bts r12,6
LB_2096:
	mov r10,rcx
	bt r12,6
	jc LB_2093
	btr r12,4
	jmp LB_2094
LB_2093:
	bts r12,4
LB_2094:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2097:
	cmp r15,0
	jz LB_2098
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2097
LB_2098:
; _f1348 { %_1334 %_1338 } ⊢ { %_1339 %_1340 } : { %_1339 %_1340 }
 ; {>  %_1338~4':(_lst)◂({ _stg _p800 }) %_1337~3':_p800 %_1336~2':_stg %_1334~0':_r64 }
; _f1348 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2103
	btr r12,1
	jmp LB_2104
LB_2103:
	bts r12,1
LB_2104:
	call NS_E_1348
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2101
	btr r12,3
	jmp LB_2102
LB_2101:
	bts r12,3
LB_2102:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2099
	btr r12,2
	jmp LB_2100
LB_2099:
	bts r12,2
LB_2100:
	add rsp,24
; _f1373 %_1337 ⊢ %_1341 : %_1341
 ; {>  %_1337~3':_p800 %_1339~0':_r64 %_1336~2':_stg %_1340~1':_stg }
; _f1373 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_2111
	btr r12,0
	jmp LB_2112
LB_2111:
	bts r12,0
LB_2112:
	call NS_E_1373
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_2113
	btr r12,3
	jmp LB_2114
LB_2113:
	bts r12,3
LB_2114:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_2109
	btr r12,2
	jmp LB_2110
LB_2109:
	bts r12,2
LB_2110:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_2107
	btr r12,1
	jmp LB_2108
LB_2107:
	bts r12,1
LB_2108:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2105
	btr r12,0
	jmp LB_2106
LB_2105:
	bts r12,0
LB_2106:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2115:
	cmp rax,0
	jz LB_2116
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2115
LB_2116:
; "\226\136\144 "
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " : "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3a
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 3'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1342 %_1346 }
 ; {>  %_1344~3':_stg %_1346~4':_stg %_1342~0':_r64 %_1345~1':_stg %_1343~2':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_2117
	mov rdi,r9
	call dlt
LB_2117:
	bt r12,1
	jc LB_2118
	mov rdi,r14
	call dlt
LB_2118:
	bt r12,2
	jc LB_2119
	mov rdi,r8
	call dlt
LB_2119:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2120
	btr r12,1
	jmp LB_2121
LB_2120:
	bts r12,1
LB_2121:
	ret
MTC_LB_2079:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2122
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2123
	bt QWORD [rdi],0
	jc LB_2124
	btr r12,2
	jmp LB_2125
LB_2124:
	bts r12,2
LB_2125:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2123:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2126:
	cmp r15,0
	jz LB_2127
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2126
LB_2127:
; 	» "" _ ⊢ 1' : %_1347
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_1334 %_1347 }
 ; {>  %_1347~1':_stg %_1334~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2122:
NS_E_1333:
; 	|» { 0' 1' }
NS_E_RDI_1333:
MTC_LB_2128:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2129
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2130
	bt QWORD [rdi],0
	jc LB_2131
	btr r12,3
	jmp LB_2132
LB_2131:
	bts r12,3
LB_2132:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2130:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2133
	btr r12,2
	jmp LB_2134
LB_2133:
	bts r12,2
LB_2134:
LB_2135:
	cmp r15,0
	jz LB_2136
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2135
LB_2136:
; _f56 %_1320 ⊢ %_1323 : %_1323
 ; {>  %_1320~0':_r64 %_1322~2':(_lst)◂({ _stg _p800 }) }
	add r13,1
; _f1348 { %_1323 %_1322 } ⊢ { %_1324 %_1325 } : { %_1324 %_1325 }
 ; {>  %_1323~0':_r64 %_1322~2':(_lst)◂({ _stg _p800 }) }
; _f1348 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2137
	btr r12,1
	jmp LB_2138
LB_2137:
	bts r12,1
LB_2138:
	call NS_E_1348
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_1324 ⊢ %_1326 : %_1326
 ; {>  %_1324~0':_r64 %_1325~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1326 %_1327 }
 ; {>  %_1327~1':_stg %_1328~2':_stg %_1326~0':_r64 }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_2139
	mov rdi,r8
	call dlt
LB_2139:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2129:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2140
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2141
	bt QWORD [rdi],0
	jc LB_2142
	btr r12,3
	jmp LB_2143
LB_2142:
	bts r12,3
LB_2143:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2141:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2144
	btr r12,2
	jmp LB_2145
LB_2144:
	bts r12,2
LB_2145:
LB_2146:
	cmp r15,0
	jz LB_2147
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2146
LB_2147:
; _f1373 %_1329 ⊢ %_1330 : %_1330
 ; {>  %_1320~0':_r64 %_1329~2':_p800 }
; _f1373 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2150
	btr r12,0
	jmp LB_2151
LB_2150:
	bts r12,0
LB_2151:
	call NS_E_1373
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2152
	btr r12,1
	jmp LB_2153
LB_2152:
	bts r12,1
LB_2153:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2148
	btr r12,0
	jmp LB_2149
LB_2148:
	bts r12,0
LB_2149:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_1320 %_1332 }
 ; {>  %_1331~1':_stg %_1332~2':_stg %_1320~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2154
	mov rdi,r14
	call dlt
LB_2154:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2155
	btr r12,1
	jmp LB_2156
LB_2155:
	bts r12,1
LB_2156:
	ret
MTC_LB_2140:
NS_E_1319:
; 	|» 0'
NS_E_RDI_1319:
MTC_LB_2157:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2158
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2159
	bt QWORD [rdi],0
	jc LB_2160
	btr r12,3
	jmp LB_2161
LB_2160:
	bts r12,3
LB_2161:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2159:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2164
	btr r12,4
	jmp LB_2165
LB_2164:
	bts r12,4
LB_2165:
	mov r14,r10
	bt r12,4
	jc LB_2162
	btr r12,1
	jmp LB_2163
LB_2162:
	bts r12,1
LB_2163:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2168
	btr r12,4
	jmp LB_2169
LB_2168:
	bts r12,4
LB_2169:
	mov r8,r10
	bt r12,4
	jc LB_2166
	btr r12,2
	jmp LB_2167
LB_2166:
	bts r12,2
LB_2167:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2170:
	cmp r15,0
	jz LB_2171
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2170
LB_2171:
; _f1319 %_1314 ⊢ %_1315 : %_1315
 ; {>  %_1314~2':_p792 %_1313~1':_p793 }
; _f1319 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2174
	btr r12,0
	jmp LB_2175
LB_2174:
	bts r12,0
LB_2175:
	call NS_E_1319
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2172
	btr r12,1
	jmp LB_2173
LB_2172:
	bts r12,1
LB_2173:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " .. "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_1317
 ; {>  %_1316~0':_stg %_1317~2':_stg %_1313~1':_p793 }
; 	∎ 2'
	bt r12,0
	jc LB_2176
	mov rdi,r13
	call dlt
LB_2176:
	bt r12,1
	jc LB_2177
	mov rdi,r14
	call dlt
LB_2177:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2178
	btr r12,0
	jmp LB_2179
LB_2178:
	bts r12,0
LB_2179:
	ret
MTC_LB_2158:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2180
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_2181
	bt QWORD [rdi],0
	jc LB_2182
	btr r12,1
	jmp LB_2183
LB_2182:
	bts r12,1
LB_2183:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2181:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2184:
	cmp r15,0
	jz LB_2185
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2184
LB_2185:
; 	» "" _ ⊢ 0' : %_1318
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_1318
 ; {>  %_1318~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2180:
NS_E_1311:
; 	|» { 0' 1' }
NS_E_RDI_1311:
MTC_LB_2186:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2187
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2188
	bt QWORD [rdi],0
	jc LB_2189
	btr r12,3
	jmp LB_2190
LB_2189:
	bts r12,3
LB_2190:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2188:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2191
	btr r12,2
	jmp LB_2192
LB_2191:
	bts r12,2
LB_2192:
LB_2193:
	cmp r15,0
	jz LB_2194
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2193
LB_2194:
; _f1319 %_1300 ⊢ %_1301 : %_1301
 ; {>  %_1300~2':_p792 %_1298~0':t853'(-1) }
; _f1319 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2197
	btr r12,0
	jmp LB_2198
LB_2197:
	bts r12,0
LB_2198:
	call NS_E_1319
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2199
	btr r12,1
	jmp LB_2200
LB_2199:
	bts r12,1
LB_2200:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2195
	btr r12,0
	jmp LB_2196
LB_2195:
	bts r12,0
LB_2196:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " !| "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_21
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_7c
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1298 %_1303 }
 ; {>  %_1302~1':_stg %_1303~2':_stg %_1298~0':t853'(-1) }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2201
	mov rdi,r14
	call dlt
LB_2201:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2202
	btr r12,1
	jmp LB_2203
LB_2202:
	bts r12,1
LB_2203:
	ret
MTC_LB_2187:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2204
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' }
; 1' ⊢ °1◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2205
	bt QWORD [rdi],0
	jc LB_2206
	btr r12,4
	jmp LB_2207
LB_2206:
	bts r12,4
LB_2207:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2205:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2210
	btr r12,5
	jmp LB_2211
LB_2210:
	bts r12,5
LB_2211:
	mov r8,r11
	bt r12,5
	jc LB_2208
	btr r12,2
	jmp LB_2209
LB_2208:
	bts r12,2
LB_2209:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2214
	btr r12,5
	jmp LB_2215
LB_2214:
	bts r12,5
LB_2215:
	mov r9,r11
	bt r12,5
	jc LB_2212
	btr r12,3
	jmp LB_2213
LB_2212:
	bts r12,3
LB_2213:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2216:
	cmp r15,0
	jz LB_2217
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2216
LB_2217:
; _f1311 { %_1298 %_1305 } ⊢ { %_1306 %_1307 } : { %_1306 %_1307 }
 ; {>  %_1304~2':_p793 %_1305~3':_p791 %_1298~0':t853'(-1) }
; _f1311 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2220
	btr r12,1
	jmp LB_2221
LB_2220:
	bts r12,1
LB_2221:
	call NS_E_1311
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2218
	btr r12,2
	jmp LB_2219
LB_2218:
	bts r12,2
LB_2219:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; " .. "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1306 %_1309 }
 ; {>  %_1304~2':_p793 %_1308~1':_stg %_1309~3':_stg %_1306~0':t853'(-1) }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2222
	mov rdi,r8
	call dlt
LB_2222:
	bt r12,1
	jc LB_2223
	mov rdi,r14
	call dlt
LB_2223:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2224
	btr r12,1
	jmp LB_2225
LB_2224:
	bts r12,1
LB_2225:
	ret
MTC_LB_2204:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2226
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2227
	bt QWORD [rdi],0
	jc LB_2228
	btr r12,2
	jmp LB_2229
LB_2228:
	bts r12,2
LB_2229:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2227:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2230:
	cmp r15,0
	jz LB_2231
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2230
LB_2231:
; 	» "" _ ⊢ 1' : %_1310
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_1298 %_1310 }
 ; {>  %_1298~0':t853'(-1) %_1310~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2226:
NS_E_1297:
; 	|» { 0' 1' }
NS_E_RDI_1297:
MTC_LB_2232:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2233
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' 5' 6' 7' }
; 1' ⊢ °0◂{ 2' 3' 4' 5' 6' 7' }
	btr r12,8
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2234
	bt QWORD [rdi],0
	jc LB_2235
	btr r12,8
	jmp LB_2236
LB_2235:
	bts r12,8
LB_2236:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2234:
	mov QWORD [st_vct+8*8],rdi
; 8' ⊢ { 2' 3' 4' 5' 6' 7' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],0
	jc LB_2239
	btr r12,9
	jmp LB_2240
LB_2239:
	bts r12,9
LB_2240:
	mov r8,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2237
	btr r12,2
	jmp LB_2238
LB_2237:
	bts r12,2
LB_2238:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],1
	jc LB_2243
	btr r12,9
	jmp LB_2244
LB_2243:
	bts r12,9
LB_2244:
	mov r9,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2241
	btr r12,3
	jmp LB_2242
LB_2241:
	bts r12,3
LB_2242:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],2
	jc LB_2247
	btr r12,9
	jmp LB_2248
LB_2247:
	bts r12,9
LB_2248:
	mov r10,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2245
	btr r12,4
	jmp LB_2246
LB_2245:
	bts r12,4
LB_2246:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],3
	jc LB_2251
	btr r12,9
	jmp LB_2252
LB_2251:
	bts r12,9
LB_2252:
	mov r11,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2249
	btr r12,5
	jmp LB_2250
LB_2249:
	bts r12,5
LB_2250:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],4
	jc LB_2255
	btr r12,9
	jmp LB_2256
LB_2255:
	bts r12,9
LB_2256:
	mov rcx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2253
	btr r12,6
	jmp LB_2254
LB_2253:
	bts r12,6
LB_2254:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],5
	jc LB_2259
	btr r12,9
	jmp LB_2260
LB_2259:
	bts r12,9
LB_2260:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_2257
	btr r12,7
	jmp LB_2258
LB_2257:
	bts r12,7
LB_2258:
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2261:
	cmp r15,0
	jz LB_2262
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2261
LB_2262:
; _f950 %_1265 ⊢ %_1271 : %_1271
 ; {>  %_1268~5':_p791 %_1265~2':_p799 %_1267~4':_p790 %_1263~0':_r64 %_1270~7':_p789 %_1269~6':(_opn)◂(_p789) %_1266~3':_p802 }
; _f950 2' ⊢ 1'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp+8+8*5],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2275
	btr r12,0
	jmp LB_2276
LB_2275:
	bts r12,0
LB_2276:
	call NS_E_950
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2277
	btr r12,1
	jmp LB_2278
LB_2277:
	bts r12,1
LB_2278:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD rax,7
	jc LB_2273
	btr r12,7
	jmp LB_2274
LB_2273:
	bts r12,7
LB_2274:
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_2271
	btr r12,6
	jmp LB_2272
LB_2271:
	bts r12,6
LB_2272:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2269
	btr r12,5
	jmp LB_2270
LB_2269:
	bts r12,5
LB_2270:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2267
	btr r12,4
	jmp LB_2268
LB_2267:
	bts r12,4
LB_2268:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2265
	btr r12,3
	jmp LB_2266
LB_2265:
	bts r12,3
LB_2266:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2263
	btr r12,0
	jmp LB_2264
LB_2263:
	bts r12,0
LB_2264:
	add rsp,56
; _f56 %_1263 ⊢ %_1272 : %_1272
 ; {>  %_1268~5':_p791 %_1271~1':_stg %_1267~4':_p790 %_1263~0':_r64 %_1270~7':_p789 %_1269~6':(_opn)◂(_p789) %_1266~3':_p802 }
	add r13,1
; _f1446 { %_1272 %_1266 } ⊢ { %_1273 %_1274 } : { %_1273 %_1274 }
 ; {>  %_1268~5':_p791 %_1271~1':_stg %_1267~4':_p790 %_1270~7':_p789 %_1272~0':_r64 %_1269~6':(_opn)◂(_p789) %_1266~3':_p802 }
; _f1446 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp+8+8*4],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2289
	btr r12,1
	jmp LB_2290
LB_2289:
	bts r12,1
LB_2290:
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2291
	btr r12,2
	jmp LB_2292
LB_2291:
	bts r12,2
LB_2292:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*4]
	bt QWORD rax,7
	jc LB_2287
	btr r12,7
	jmp LB_2288
LB_2287:
	bts r12,7
LB_2288:
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_2285
	btr r12,6
	jmp LB_2286
LB_2285:
	bts r12,6
LB_2286:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_2283
	btr r12,5
	jmp LB_2284
LB_2283:
	bts r12,5
LB_2284:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_2281
	btr r12,4
	jmp LB_2282
LB_2281:
	bts r12,4
LB_2282:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2279
	btr r12,1
	jmp LB_2280
LB_2279:
	bts r12,1
LB_2280:
	add rsp,48
; _f55 %_1273 ⊢ %_1275 : %_1275
 ; {>  %_1268~5':_p791 %_1274~2':_stg %_1271~1':_stg %_1267~4':_p790 %_1270~7':_p789 %_1269~6':(_opn)◂(_p789) %_1273~0':_r64 }
	sub r13,1
; _f1297 { %_1275 %_1270 } ⊢ { %_1276 %_1277 } : { %_1276 %_1277 }
 ; {>  %_1275~0':_r64 %_1268~5':_p791 %_1274~2':_stg %_1271~1':_stg %_1267~4':_p790 %_1270~7':_p789 %_1269~6':(_opn)◂(_p789) }
; _f1297 { 0' 7' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_2303
	btr r12,1
	jmp LB_2304
LB_2303:
	bts r12,1
LB_2304:
	call NS_E_1297
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2305
	btr r12,3
	jmp LB_2306
LB_2305:
	bts r12,3
LB_2306:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_2301
	btr r12,6
	jmp LB_2302
LB_2301:
	bts r12,6
LB_2302:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2299
	btr r12,5
	jmp LB_2300
LB_2299:
	bts r12,5
LB_2300:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2297
	btr r12,4
	jmp LB_2298
LB_2297:
	bts r12,4
LB_2298:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2295
	btr r12,2
	jmp LB_2296
LB_2295:
	bts r12,2
LB_2296:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2293
	btr r12,1
	jmp LB_2294
LB_2293:
	bts r12,1
LB_2294:
	add rsp,48
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,11
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rdx,rax
	btr r12,7
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2307:
	cmp rax,0
	jz LB_2308
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2307
LB_2308:
; "\226\136\144 .. \226\138\162 "
	mov rsi,0x_e2_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1278 %_1282 }
 ; {>  %_1281~3':_stg %_1268~5':_p791 %_1278~0':_r64 %_1282~7':_stg %_1280~2':_stg %_1279~1':_stg %_1267~4':_p790 %_1269~6':(_opn)◂(_p789) }
; 	∎ { 0' 7' }
	bt r12,3
	jc LB_2309
	mov rdi,r9
	call dlt
LB_2309:
	bt r12,5
	jc LB_2310
	mov rdi,r11
	call dlt
LB_2310:
	bt r12,2
	jc LB_2311
	mov rdi,r8
	call dlt
LB_2311:
	bt r12,1
	jc LB_2312
	mov rdi,r14
	call dlt
LB_2312:
	bt r12,4
	jc LB_2313
	mov rdi,r10
	call dlt
LB_2313:
	bt r12,6
	jc LB_2314
	mov rdi,rcx
	call dlt
LB_2314:
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_2315
	btr r12,1
	jmp LB_2316
LB_2315:
	bts r12,1
LB_2316:
	ret
MTC_LB_2233:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2317
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' 5' 6' }
; 1' ⊢ °1◂{ 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2318
	bt QWORD [rdi],0
	jc LB_2319
	btr r12,7
	jmp LB_2320
LB_2319:
	bts r12,7
LB_2320:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2318:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_2323
	btr r12,8
	jmp LB_2324
LB_2323:
	bts r12,8
LB_2324:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2321
	btr r12,2
	jmp LB_2322
LB_2321:
	bts r12,2
LB_2322:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_2327
	btr r12,8
	jmp LB_2328
LB_2327:
	bts r12,8
LB_2328:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2325
	btr r12,3
	jmp LB_2326
LB_2325:
	bts r12,3
LB_2326:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_2331
	btr r12,8
	jmp LB_2332
LB_2331:
	bts r12,8
LB_2332:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2329
	btr r12,4
	jmp LB_2330
LB_2329:
	bts r12,4
LB_2330:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_2335
	btr r12,8
	jmp LB_2336
LB_2335:
	bts r12,8
LB_2336:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2333
	btr r12,5
	jmp LB_2334
LB_2333:
	bts r12,5
LB_2334:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_2339
	btr r12,8
	jmp LB_2340
LB_2339:
	bts r12,8
LB_2340:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2337
	btr r12,6
	jmp LB_2338
LB_2337:
	bts r12,6
LB_2338:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2341:
	cmp r15,0
	jz LB_2342
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2341
LB_2342:
; _f950 %_1283 ⊢ %_1288 : %_1288
 ; {>  %_1287~6':(_opn)◂(_p789) %_1283~2':_p799 %_1286~5':_p791 %_1263~0':_r64 %_1285~4':_p790 %_1284~3':_p802 }
; _f950 2' ⊢ 1'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_2353
	btr r12,0
	jmp LB_2354
LB_2353:
	bts r12,0
LB_2354:
	call NS_E_950
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2355
	btr r12,1
	jmp LB_2356
LB_2355:
	bts r12,1
LB_2356:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_2351
	btr r12,6
	jmp LB_2352
LB_2351:
	bts r12,6
LB_2352:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2349
	btr r12,5
	jmp LB_2350
LB_2349:
	bts r12,5
LB_2350:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2347
	btr r12,4
	jmp LB_2348
LB_2347:
	bts r12,4
LB_2348:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2345
	btr r12,3
	jmp LB_2346
LB_2345:
	bts r12,3
LB_2346:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2343
	btr r12,0
	jmp LB_2344
LB_2343:
	bts r12,0
LB_2344:
	add rsp,48
; _f56 %_1263 ⊢ %_1289 : %_1289
 ; {>  %_1287~6':(_opn)◂(_p789) %_1288~1':_stg %_1286~5':_p791 %_1263~0':_r64 %_1285~4':_p790 %_1284~3':_p802 }
	add r13,1
; _f1446 { %_1289 %_1284 } ⊢ { %_1290 %_1291 } : { %_1290 %_1291 }
 ; {>  %_1287~6':(_opn)◂(_p789) %_1288~1':_stg %_1286~5':_p791 %_1285~4':_p790 %_1284~3':_p802 %_1289~0':_r64 }
; _f1446 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2365
	btr r12,1
	jmp LB_2366
LB_2365:
	bts r12,1
LB_2366:
	call NS_E_1446
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2367
	btr r12,2
	jmp LB_2368
LB_2367:
	bts r12,2
LB_2368:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_2363
	btr r12,6
	jmp LB_2364
LB_2363:
	bts r12,6
LB_2364:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_2361
	btr r12,5
	jmp LB_2362
LB_2361:
	bts r12,5
LB_2362:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_2359
	btr r12,4
	jmp LB_2360
LB_2359:
	bts r12,4
LB_2360:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2357
	btr r12,1
	jmp LB_2358
LB_2357:
	bts r12,1
LB_2358:
	add rsp,40
; _f55 %_1290 ⊢ %_1292 : %_1292
 ; {>  %_1287~6':(_opn)◂(_p789) %_1291~2':_stg %_1288~1':_stg %_1286~5':_p791 %_1290~0':_r64 %_1285~4':_p790 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,12
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2369:
	cmp rax,0
	jz LB_2370
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2369
LB_2370:
; "\226\136\144. .. \226\138\162 "
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_e2
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	add rdi,12
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1293 %_1296 }
 ; {>  %_1294~1':_stg %_1287~6':(_opn)◂(_p789) %_1296~3':_stg %_1286~5':_p791 %_1295~2':_stg %_1285~4':_p790 %_1293~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_2371
	mov rdi,r14
	call dlt
LB_2371:
	bt r12,6
	jc LB_2372
	mov rdi,rcx
	call dlt
LB_2372:
	bt r12,5
	jc LB_2373
	mov rdi,r11
	call dlt
LB_2373:
	bt r12,2
	jc LB_2374
	mov rdi,r8
	call dlt
LB_2374:
	bt r12,4
	jc LB_2375
	mov rdi,r10
	call dlt
LB_2375:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2376
	btr r12,1
	jmp LB_2377
LB_2376:
	bts r12,1
LB_2377:
	ret
MTC_LB_2317:
NS_E_1262:
; 	|» { 0' 1' }
NS_E_RDI_1262:
MTC_LB_2378:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2379
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' 5' 6' }
; 1' ⊢ °0◂{ 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2380
	bt QWORD [rdi],0
	jc LB_2381
	btr r12,7
	jmp LB_2382
LB_2381:
	bts r12,7
LB_2382:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2380:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_2385
	btr r12,8
	jmp LB_2386
LB_2385:
	bts r12,8
LB_2386:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2383
	btr r12,2
	jmp LB_2384
LB_2383:
	bts r12,2
LB_2384:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_2389
	btr r12,8
	jmp LB_2390
LB_2389:
	bts r12,8
LB_2390:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2387
	btr r12,3
	jmp LB_2388
LB_2387:
	bts r12,3
LB_2388:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_2393
	btr r12,8
	jmp LB_2394
LB_2393:
	bts r12,8
LB_2394:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2391
	btr r12,4
	jmp LB_2392
LB_2391:
	bts r12,4
LB_2392:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_2397
	btr r12,8
	jmp LB_2398
LB_2397:
	bts r12,8
LB_2398:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2395
	btr r12,5
	jmp LB_2396
LB_2395:
	bts r12,5
LB_2396:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_2401
	btr r12,8
	jmp LB_2402
LB_2401:
	bts r12,8
LB_2402:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_2399
	btr r12,6
	jmp LB_2400
LB_2399:
	bts r12,6
LB_2400:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2403:
	cmp r15,0
	jz LB_2404
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2403
LB_2404:
; _f1262 { %_1244 %_1250 } ⊢ { %_1251 %_1252 } : { %_1251 %_1252 }
 ; {>  %_1248~4':_p791 %_1250~6':_p788 %_1244~0':_r64 %_1249~5':(_opn)◂(_p788) %_1246~2':(_opn)◂(_stg) %_1247~3':_p790 }
; _f1262 { 0' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_2413
	btr r12,1
	jmp LB_2414
LB_2413:
	bts r12,1
LB_2414:
	call NS_E_1262
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_2411
	btr r12,5
	jmp LB_2412
LB_2411:
	bts r12,5
LB_2412:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2409
	btr r12,4
	jmp LB_2410
LB_2409:
	bts r12,4
LB_2410:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2407
	btr r12,3
	jmp LB_2408
LB_2407:
	bts r12,3
LB_2408:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2405
	btr r12,2
	jmp LB_2406
LB_2405:
	bts r12,2
LB_2406:
	add rsp,40
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,7
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rcx,rax
	btr r12,6
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2415:
	cmp rax,0
	jz LB_2416
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2415
LB_2416:
; "\226\136\144 ..\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1253 %_1255 }
 ; {>  %_1253~0':_r64 %_1254~1':_stg %_1248~4':_p791 %_1249~5':(_opn)◂(_p788) %_1246~2':(_opn)◂(_stg) %_1255~6':_stg %_1247~3':_p790 }
; 	∎ { 0' 6' }
	bt r12,1
	jc LB_2417
	mov rdi,r14
	call dlt
LB_2417:
	bt r12,4
	jc LB_2418
	mov rdi,r10
	call dlt
LB_2418:
	bt r12,5
	jc LB_2419
	mov rdi,r11
	call dlt
LB_2419:
	bt r12,2
	jc LB_2420
	mov rdi,r8
	call dlt
LB_2420:
	bt r12,3
	jc LB_2421
	mov rdi,r9
	call dlt
LB_2421:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_2422
	btr r12,1
	jmp LB_2423
LB_2422:
	bts r12,1
LB_2423:
	ret
MTC_LB_2379:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2424
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' 5' }
; 1' ⊢ °1◂{ 2' 3' 4' 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2425
	bt QWORD [rdi],0
	jc LB_2426
	btr r12,6
	jmp LB_2427
LB_2426:
	bts r12,6
LB_2427:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2425:
	mov rcx,rdi
; 6' ⊢ { 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_2430
	btr r12,7
	jmp LB_2431
LB_2430:
	bts r12,7
LB_2431:
	mov r8,rdx
	bt r12,7
	jc LB_2428
	btr r12,2
	jmp LB_2429
LB_2428:
	bts r12,2
LB_2429:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_2434
	btr r12,7
	jmp LB_2435
LB_2434:
	bts r12,7
LB_2435:
	mov r9,rdx
	bt r12,7
	jc LB_2432
	btr r12,3
	jmp LB_2433
LB_2432:
	bts r12,3
LB_2433:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_2438
	btr r12,7
	jmp LB_2439
LB_2438:
	bts r12,7
LB_2439:
	mov r10,rdx
	bt r12,7
	jc LB_2436
	btr r12,4
	jmp LB_2437
LB_2436:
	bts r12,4
LB_2437:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_2442
	btr r12,7
	jmp LB_2443
LB_2442:
	bts r12,7
LB_2443:
	mov r11,rdx
	bt r12,7
	jc LB_2440
	btr r12,5
	jmp LB_2441
LB_2440:
	bts r12,5
LB_2441:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2444:
	cmp r15,0
	jz LB_2445
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2444
LB_2445:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,9
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2446:
	cmp rax,0
	jz LB_2447
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2446
LB_2447:
; "\226\136\144. .. \n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; ∎ { %_1260 %_1261 }
 ; {>  %_1259~5':(_opn)◂(_p788) %_1257~3':_p790 %_1256~2':(_opn)◂(_stg) %_1261~1':_stg %_1260~0':_r64 %_1258~4':_p791 }
; 	∎ { 0' 1' }
	bt r12,5
	jc LB_2448
	mov rdi,r11
	call dlt
LB_2448:
	bt r12,3
	jc LB_2449
	mov rdi,r9
	call dlt
LB_2449:
	bt r12,2
	jc LB_2450
	mov rdi,r8
	call dlt
LB_2450:
	bt r12,4
	jc LB_2451
	mov rdi,r10
	call dlt
LB_2451:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2424:
NS_E_1243:
; 	|» { 0' 1' }
NS_E_RDI_1243:
MTC_LB_2452:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2453
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2454
	bt QWORD [rdi],0
	jc LB_2455
	btr r12,3
	jmp LB_2456
LB_2455:
	bts r12,3
LB_2456:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2454:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2457
	btr r12,2
	jmp LB_2458
LB_2457:
	bts r12,2
LB_2458:
LB_2459:
	cmp r15,0
	jz LB_2460
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2459
LB_2460:
; _f1262 { %_1235 %_1237 } ⊢ { %_1238 %_1239 } : { %_1238 %_1239 }
 ; {>  %_1237~2':_p788 %_1235~0':_r64 }
; _f1262 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2461
	btr r12,1
	jmp LB_2462
LB_2461:
	bts r12,1
LB_2462:
	call NS_E_1262
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_1238 %_1239 }
 ; {>  %_1239~1':_stg %_1238~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2453:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2463
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2464
	bt QWORD [rdi],0
	jc LB_2465
	btr r12,3
	jmp LB_2466
LB_2465:
	bts r12,3
LB_2466:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2464:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2467
	btr r12,2
	jmp LB_2468
LB_2467:
	bts r12,2
LB_2468:
LB_2469:
	cmp r15,0
	jz LB_2470
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2469
LB_2470:
; _f1297 { %_1235 %_1240 } ⊢ { %_1241 %_1242 } : { %_1241 %_1242 }
 ; {>  %_1240~2':_p789 %_1235~0':_r64 }
; _f1297 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2471
	btr r12,1
	jmp LB_2472
LB_2471:
	bts r12,1
LB_2472:
	call NS_E_1297
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_1241 %_1242 }
 ; {>  %_1242~1':_stg %_1241~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2463:
NS_E_1234:
; 	|» { 0' 1' }
NS_E_RDI_1234:
MTC_LB_2473:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2474
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2475
	bt QWORD [rdi],0
	jc LB_2476
	btr r12,5
	jmp LB_2477
LB_2476:
	bts r12,5
LB_2477:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2475:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2486
	btr r12,6
	jmp LB_2487
LB_2486:
	bts r12,6
LB_2487:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2480
	btr r12,4
	jmp LB_2481
LB_2480:
	bts r12,4
LB_2481:
	mov r8,r10
	bt r12,4
	jc LB_2478
	btr r12,2
	jmp LB_2479
LB_2478:
	bts r12,2
LB_2479:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2484
	btr r12,4
	jmp LB_2485
LB_2484:
	bts r12,4
LB_2485:
	mov r9,r10
	bt r12,4
	jc LB_2482
	btr r12,3
	jmp LB_2483
LB_2482:
	bts r12,3
LB_2483:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2490
	btr r12,6
	jmp LB_2491
LB_2490:
	bts r12,6
LB_2491:
	mov r10,rcx
	bt r12,6
	jc LB_2488
	btr r12,4
	jmp LB_2489
LB_2488:
	bts r12,4
LB_2489:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2492:
	cmp r15,0
	jz LB_2493
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2492
LB_2493:
; _f56 %_1217 ⊢ %_1222 : %_1222
 ; {>  %_1219~2':_stg %_1221~4':(_lst)◂({ _stg _p787 }) %_1220~3':_p787 %_1217~0':_r64 }
	add r13,1
; _f1243 { %_1222 %_1220 } ⊢ { %_1223 %_1224 } : { %_1223 %_1224 }
 ; {>  %_1219~2':_stg %_1221~4':(_lst)◂({ _stg _p787 }) %_1222~0':_r64 %_1220~3':_p787 }
; _f1243 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2498
	btr r12,1
	jmp LB_2499
LB_2498:
	bts r12,1
LB_2499:
	call NS_E_1243
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_2496
	btr r12,4
	jmp LB_2497
LB_2496:
	bts r12,4
LB_2497:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2494
	btr r12,2
	jmp LB_2495
LB_2494:
	bts r12,2
LB_2495:
	add rsp,24
; _f55 %_1223 ⊢ %_1225 : %_1225
 ; {>  %_1219~2':_stg %_1221~4':(_lst)◂({ _stg _p787 }) %_1223~0':_r64 %_1224~1':_stg }
	sub r13,1
; _f1234 { %_1225 %_1221 } ⊢ { %_1226 %_1227 } : { %_1226 %_1227 }
 ; {>  %_1219~2':_stg %_1221~4':(_lst)◂({ _stg _p787 }) %_1225~0':_r64 %_1224~1':_stg }
; _f1234 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2504
	btr r12,1
	jmp LB_2505
LB_2504:
	bts r12,1
LB_2505:
	call NS_E_1234
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2506
	btr r12,3
	jmp LB_2507
LB_2506:
	bts r12,3
LB_2507:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2502
	btr r12,2
	jmp LB_2503
LB_2502:
	bts r12,2
LB_2503:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2500
	btr r12,1
	jmp LB_2501
LB_2500:
	bts r12,1
LB_2501:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2508:
	cmp rax,0
	jz LB_2509
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2508
LB_2509:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1228 %_1232 }
 ; {>  %_1229~2':_stg %_1230~1':_stg %_1232~4':_stg %_1231~3':_stg %_1228~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_2510
	mov rdi,r8
	call dlt
LB_2510:
	bt r12,1
	jc LB_2511
	mov rdi,r14
	call dlt
LB_2511:
	bt r12,3
	jc LB_2512
	mov rdi,r9
	call dlt
LB_2512:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2513
	btr r12,1
	jmp LB_2514
LB_2513:
	bts r12,1
LB_2514:
	ret
MTC_LB_2474:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2515
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2516
	bt QWORD [rdi],0
	jc LB_2517
	btr r12,2
	jmp LB_2518
LB_2517:
	bts r12,2
LB_2518:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2516:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2519:
	cmp r15,0
	jz LB_2520
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2519
LB_2520:
; 	» "" _ ⊢ 1' : %_1233
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_1217 %_1233 }
 ; {>  %_1233~1':_stg %_1217~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2515:
NS_E_1216:
; 	|» { 0' 1' }
NS_E_RDI_1216:
MTC_LB_2521:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2522
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2523
	bt QWORD [rdi],0
	jc LB_2524
	btr r12,5
	jmp LB_2525
LB_2524:
	bts r12,5
LB_2525:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2523:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_2534
	btr r12,6
	jmp LB_2535
LB_2534:
	bts r12,6
LB_2535:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_2528
	btr r12,4
	jmp LB_2529
LB_2528:
	bts r12,4
LB_2529:
	mov r8,r10
	bt r12,4
	jc LB_2526
	btr r12,2
	jmp LB_2527
LB_2526:
	bts r12,2
LB_2527:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_2532
	btr r12,4
	jmp LB_2533
LB_2532:
	bts r12,4
LB_2533:
	mov r9,r10
	bt r12,4
	jc LB_2530
	btr r12,3
	jmp LB_2531
LB_2530:
	bts r12,3
LB_2531:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_2538
	btr r12,6
	jmp LB_2539
LB_2538:
	bts r12,6
LB_2539:
	mov r10,rcx
	bt r12,6
	jc LB_2536
	btr r12,4
	jmp LB_2537
LB_2536:
	bts r12,4
LB_2537:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2540:
	cmp r15,0
	jz LB_2541
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2540
LB_2541:
; _f38 %_1192 ⊢ %_1197 : %_1197
 ; {>  %_1196~4':(_lst)◂({ _stg _p786 }) %_1192~0':_r64 %_1194~2':_stg %_1195~3':_p786 }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_2546
	btr r12,4
	jmp LB_2547
LB_2546:
	bts r12,4
LB_2547:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2544
	btr r12,3
	jmp LB_2545
LB_2544:
	bts r12,3
LB_2545:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2542
	btr r12,2
	jmp LB_2543
LB_2542:
	bts r12,2
LB_2543:
	add rsp,32
; _f1216 { %_1197 %_1196 } ⊢ { %_1198 %_1199 } : { %_1198 %_1199 }
 ; {>  %_1196~4':(_lst)◂({ _stg _p786 }) %_1194~2':_stg %_1197~0':_r64 %_1195~3':_p786 }
; _f1216 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2552
	btr r12,1
	jmp LB_2553
LB_2552:
	bts r12,1
LB_2553:
	call NS_E_1216
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_2550
	btr r12,3
	jmp LB_2551
LB_2550:
	bts r12,3
LB_2551:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2548
	btr r12,2
	jmp LB_2549
LB_2548:
	bts r12,2
LB_2549:
	add rsp,24
MTC_LB_2554:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2555
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °0◂4'
; 3' ⊢ °0◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2556
	bt QWORD [rdi],0
	jc LB_2557
	btr r12,5
	jmp LB_2558
LB_2557:
	bts r12,5
LB_2558:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2556:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_2559
	btr r12,4
	jmp LB_2560
LB_2559:
	bts r12,4
LB_2560:
LB_2561:
	cmp r15,0
	jz LB_2562
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2561
LB_2562:
; _f56 %_1198 ⊢ %_1201 : %_1201
 ; {>  %_1199~1':_stg %_1194~2':_stg %_1198~0':_r64 %_1200~4':(_lst)◂({ _stg _p800 }) }
	add r13,1
; _f1348 { %_1201 %_1200 } ⊢ { %_1202 %_1203 } : { %_1202 %_1203 }
 ; {>  %_1199~1':_stg %_1194~2':_stg %_1201~0':_r64 %_1200~4':(_lst)◂({ _stg _p800 }) }
; _f1348 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2567
	btr r12,1
	jmp LB_2568
LB_2567:
	bts r12,1
LB_2568:
	call NS_E_1348
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_2569
	btr r12,3
	jmp LB_2570
LB_2569:
	bts r12,3
LB_2570:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2565
	btr r12,2
	jmp LB_2566
LB_2565:
	bts r12,2
LB_2566:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2563
	btr r12,1
	jmp LB_2564
LB_2563:
	bts r12,1
LB_2564:
	add rsp,24
; _f55 %_1202 ⊢ %_1204 : %_1204
 ; {>  %_1199~1':_stg %_1194~2':_stg %_1203~3':_stg %_1202~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2571:
	cmp rax,0
	jz LB_2572
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2571
LB_2572:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1205 %_1209 }
 ; {>  %_1209~4':_stg %_1207~3':_stg %_1206~2':_stg %_1208~1':_stg %_1205~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_2573
	mov rdi,r9
	call dlt
LB_2573:
	bt r12,2
	jc LB_2574
	mov rdi,r8
	call dlt
LB_2574:
	bt r12,1
	jc LB_2575
	mov rdi,r14
	call dlt
LB_2575:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_2576
	btr r12,1
	jmp LB_2577
LB_2576:
	bts r12,1
LB_2577:
	ret
MTC_LB_2555:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2578
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂4'
; 3' ⊢ °1◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2579
	bt QWORD [rdi],0
	jc LB_2580
	btr r12,5
	jmp LB_2581
LB_2580:
	bts r12,5
LB_2581:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2579:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_2582
	btr r12,4
	jmp LB_2583
LB_2582:
	bts r12,4
LB_2583:
LB_2584:
	cmp r15,0
	jz LB_2585
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2584
LB_2585:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,7
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2586:
	cmp rax,0
	jz LB_2587
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2586
LB_2587:
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = .. \n"
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
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1211 %_1214 }
 ; {>  %_1212~2':_stg %_1211~0':_r64 %_1213~1':_stg %_1210~4':_p800 %_1214~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2588
	mov rdi,r8
	call dlt
LB_2588:
	bt r12,1
	jc LB_2589
	mov rdi,r14
	call dlt
LB_2589:
	bt r12,4
	jc LB_2590
	mov rdi,r10
	call dlt
LB_2590:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2591
	btr r12,1
	jmp LB_2592
LB_2591:
	bts r12,1
LB_2592:
	ret
MTC_LB_2578:
MTC_LB_2522:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2593
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2594
	bt QWORD [rdi],0
	jc LB_2595
	btr r12,2
	jmp LB_2596
LB_2595:
	bts r12,2
LB_2596:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2594:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2597:
	cmp r15,0
	jz LB_2598
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2597
LB_2598:
; 	» "" _ ⊢ 1' : %_1215
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_1192 %_1215 }
 ; {>  %_1192~0':_r64 %_1215~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2593:
NS_E_1191:
; 	|» { 0' 1' }
NS_E_RDI_1191:
MTC_LB_2599:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2600
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2601
	bt QWORD [rdi],0
	jc LB_2602
	btr r12,4
	jmp LB_2603
LB_2602:
	bts r12,4
LB_2603:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2601:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2606
	btr r12,5
	jmp LB_2607
LB_2606:
	bts r12,5
LB_2607:
	mov r8,r11
	bt r12,5
	jc LB_2604
	btr r12,2
	jmp LB_2605
LB_2604:
	bts r12,2
LB_2605:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2610
	btr r12,5
	jmp LB_2611
LB_2610:
	bts r12,5
LB_2611:
	mov r9,r11
	bt r12,5
	jc LB_2608
	btr r12,3
	jmp LB_2609
LB_2608:
	bts r12,3
LB_2609:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2612:
	cmp r15,0
	jz LB_2613
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2612
LB_2613:
MTC_LB_2614:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2615
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2616
	bt QWORD [rdi],0
	jc LB_2617
	btr r12,4
	jmp LB_2618
LB_2617:
	bts r12,4
LB_2618:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2616:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_2619
	btr r12,1
	jmp LB_2620
LB_2619:
	bts r12,1
LB_2620:
LB_2621:
	cmp r15,0
	jz LB_2622
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2621
LB_2622:
; _f56 %_1123 ⊢ %_1128 : %_1128
 ; {>  %_1123~0':_r64 %_1127~1':(_lst)◂(_p783) %_1125~2':_stg }
	add r13,1
; _f1122 { %_1128 %_1127 } ⊢ { %_1129 %_1130 } : { %_1129 %_1130 }
 ; {>  %_1127~1':(_lst)◂(_p783) %_1128~0':_r64 %_1125~2':_stg }
; _f1122 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1122
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2623
	btr r12,2
	jmp LB_2624
LB_2623:
	bts r12,2
LB_2624:
	add rsp,16
; _f55 %_1129 ⊢ %_1131 : %_1131
 ; {>  %_1129~0':_r64 %_1130~1':_stg %_1125~2':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,1
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2625:
	cmp rax,0
	jz LB_2626
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2625
LB_2626:
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
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 0*"\t"
	mov rax,r13
LB_2627:
	cmp rax,0
	jz LB_2628
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2627
LB_2628:
; "\t"
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
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
; ∎ { %_1132 %_1135 }
 ; {>  %_1135~3':_stg %_1133~2':_stg %_1132~0':_r64 %_1134~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2629
	mov rdi,r8
	call dlt
LB_2629:
	bt r12,1
	jc LB_2630
	mov rdi,r14
	call dlt
LB_2630:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2631
	btr r12,1
	jmp LB_2632
LB_2631:
	bts r12,1
LB_2632:
	ret
MTC_LB_2615:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2633
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2634
	bt QWORD [rdi],0
	jc LB_2635
	btr r12,4
	jmp LB_2636
LB_2635:
	bts r12,4
LB_2636:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2634:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_2637
	btr r12,1
	jmp LB_2638
LB_2637:
	bts r12,1
LB_2638:
LB_2639:
	cmp r15,0
	jz LB_2640
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2639
LB_2640:
; _f746 %_1136 ⊢ %_1137 : %_1137
 ; {>  %_1123~0':_r64 %_1136~1':_p735 %_1125~2':_stg }
; _f746 1' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2645
	btr r12,0
	jmp LB_2646
LB_2645:
	bts r12,0
LB_2646:
	call NS_E_746
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2647
	btr r12,1
	jmp LB_2648
LB_2647:
	bts r12,1
LB_2648:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2643
	btr r12,2
	jmp LB_2644
LB_2643:
	bts r12,2
LB_2644:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2641
	btr r12,0
	jmp LB_2642
LB_2641:
	bts r12,0
LB_2642:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2649:
	cmp rax,0
	jz LB_2650
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2649
LB_2650:
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
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_1138 %_1141 }
 ; {>  %_1139~2':_stg %_1138~0':_r64 %_1141~3':_stg %_1140~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2651
	mov rdi,r8
	call dlt
LB_2651:
	bt r12,1
	jc LB_2652
	mov rdi,r14
	call dlt
LB_2652:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2653
	btr r12,1
	jmp LB_2654
LB_2653:
	bts r12,1
LB_2654:
	ret
MTC_LB_2633:
MTC_LB_2600:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2655
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2656
	bt QWORD [rdi],0
	jc LB_2657
	btr r12,3
	jmp LB_2658
LB_2657:
	bts r12,3
LB_2658:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2656:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2659
	btr r12,2
	jmp LB_2660
LB_2659:
	bts r12,2
LB_2660:
LB_2661:
	cmp r15,0
	jz LB_2662
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2661
LB_2662:
; _f56 %_1123 ⊢ %_1143 : %_1143
 ; {>  %_1123~0':_r64 %_1142~2':(_lst)◂({ _stg _p787 }) }
	add r13,1
; _f1234 { %_1143 %_1142 } ⊢ { %_1144 %_1145 } : { %_1144 %_1145 }
 ; {>  %_1143~0':_r64 %_1142~2':(_lst)◂({ _stg _p787 }) }
; _f1234 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2663
	btr r12,1
	jmp LB_2664
LB_2663:
	bts r12,1
LB_2664:
	call NS_E_1234
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_1144 ⊢ %_1146 : %_1146
 ; {>  %_1145~1':_stg %_1144~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,8
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2665:
	cmp rax,0
	jz LB_2666
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2665
LB_2666:
; "\194\167\194\167+s8\n"
	mov rsi,0x_0a_38_73_2b_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1147 %_1149 }
 ; {>  %_1147~0':_r64 %_1148~1':_stg %_1149~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2667
	mov rdi,r14
	call dlt
LB_2667:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2668
	btr r12,1
	jmp LB_2669
LB_2668:
	bts r12,1
LB_2669:
	ret
MTC_LB_2655:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_2670
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{ 2' 3' }
; 1' ⊢ °2◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2671
	bt QWORD [rdi],0
	jc LB_2672
	btr r12,4
	jmp LB_2673
LB_2672:
	bts r12,4
LB_2673:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2671:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2676
	btr r12,5
	jmp LB_2677
LB_2676:
	bts r12,5
LB_2677:
	mov r8,r11
	bt r12,5
	jc LB_2674
	btr r12,2
	jmp LB_2675
LB_2674:
	bts r12,2
LB_2675:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2680
	btr r12,5
	jmp LB_2681
LB_2680:
	bts r12,5
LB_2681:
	mov r9,r11
	bt r12,5
	jc LB_2678
	btr r12,3
	jmp LB_2679
LB_2678:
	bts r12,3
LB_2679:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2682:
	cmp r15,0
	jz LB_2683
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2682
LB_2683:
; _f56 %_1123 ⊢ %_1152 : %_1152
 ; {>  %_1123~0':_r64 %_1150~2':_stg %_1151~3':_p785 }
	add r13,1
; _f1407 { %_1152 %_1151 } ⊢ { %_1153 %_1154 } : { %_1153 %_1154 }
 ; {>  %_1152~0':_r64 %_1150~2':_stg %_1151~3':_p785 }
; _f1407 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2686
	btr r12,1
	jmp LB_2687
LB_2686:
	bts r12,1
LB_2687:
	call NS_E_1407
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2684
	btr r12,2
	jmp LB_2685
LB_2684:
	bts r12,2
LB_2685:
	add rsp,16
; _f55 %_1153 ⊢ %_1155 : %_1155
 ; {>  %_1154~1':_stg %_1153~0':_r64 %_1150~2':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2688:
	cmp rax,0
	jz LB_2689
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2688
LB_2689:
; "\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1156 %_1159 }
 ; {>  %_1158~1':_stg %_1156~0':_r64 %_1159~3':_stg %_1157~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_2690
	mov rdi,r14
	call dlt
LB_2690:
	bt r12,2
	jc LB_2691
	mov rdi,r8
	call dlt
LB_2691:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2692
	btr r12,1
	jmp LB_2693
LB_2692:
	bts r12,1
LB_2693:
	ret
MTC_LB_2670:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_2694
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °3◂2'
; 1' ⊢ °3◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2695
	bt QWORD [rdi],0
	jc LB_2696
	btr r12,3
	jmp LB_2697
LB_2696:
	bts r12,3
LB_2697:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2695:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2698
	btr r12,2
	jmp LB_2699
LB_2698:
	bts r12,2
LB_2699:
LB_2700:
	cmp r15,0
	jz LB_2701
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2700
LB_2701:
; _f56 %_1123 ⊢ %_1161 : %_1161
 ; {>  %_1123~0':_r64 %_1160~2':(_lst)◂({ _stg _p799 _p802 }) }
	add r13,1
; _f1428 { %_1161 %_1160 } ⊢ { %_1162 %_1163 } : { %_1162 %_1163 }
 ; {>  %_1160~2':(_lst)◂({ _stg _p799 _p802 }) %_1161~0':_r64 }
; _f1428 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2702
	btr r12,1
	jmp LB_2703
LB_2702:
	bts r12,1
LB_2703:
	call NS_E_1428
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_1162 ⊢ %_1164 : %_1164
 ; {>  %_1163~1':_stg %_1162~0':_r64 }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2704:
	cmp rax,0
	jz LB_2705
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2704
LB_2705:
; "\194\167 \n"
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1165 %_1167 }
 ; {>  %_1165~0':_r64 %_1166~1':_stg %_1167~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2706
	mov rdi,r14
	call dlt
LB_2706:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2707
	btr r12,1
	jmp LB_2708
LB_2707:
	bts r12,1
LB_2708:
	ret
MTC_LB_2694:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_2709
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °4◂{ 2' 3' }
; 1' ⊢ °4◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2710
	bt QWORD [rdi],0
	jc LB_2711
	btr r12,4
	jmp LB_2712
LB_2711:
	bts r12,4
LB_2712:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2710:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2715
	btr r12,5
	jmp LB_2716
LB_2715:
	bts r12,5
LB_2716:
	mov r8,r11
	bt r12,5
	jc LB_2713
	btr r12,2
	jmp LB_2714
LB_2713:
	bts r12,2
LB_2714:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2719
	btr r12,5
	jmp LB_2720
LB_2719:
	bts r12,5
LB_2720:
	mov r9,r11
	bt r12,5
	jc LB_2717
	btr r12,3
	jmp LB_2718
LB_2717:
	bts r12,3
LB_2718:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2721:
	cmp r15,0
	jz LB_2722
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2721
LB_2722:
MTC_LB_2723:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2724
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2725
	bt QWORD [rdi],0
	jc LB_2726
	btr r12,4
	jmp LB_2727
LB_2726:
	bts r12,4
LB_2727:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2725:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_2728
	btr r12,1
	jmp LB_2729
LB_2728:
	bts r12,1
LB_2729:
LB_2730:
	cmp r15,0
	jz LB_2731
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2730
LB_2731:
; _f56 %_1123 ⊢ %_1171 : %_1171
 ; {>  %_1123~0':_r64 %_1170~1':(_lst)◂({ _stg _p800 }) %_1168~2':_stg }
	add r13,1
; _f1348 { %_1171 %_1170 } ⊢ { %_1172 %_1173 } : { %_1172 %_1173 }
 ; {>  %_1171~0':_r64 %_1170~1':(_lst)◂({ _stg _p800 }) %_1168~2':_stg }
; _f1348 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_1348
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2732
	btr r12,2
	jmp LB_2733
LB_2732:
	bts r12,2
LB_2733:
	add rsp,16
; _f55 %_1172 ⊢ %_1174 : %_1174
 ; {>  %_1172~0':_r64 %_1173~1':_stg %_1168~2':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2734:
	cmp rax,0
	jz LB_2735
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2734
LB_2735:
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1175 %_1178 }
 ; {>  %_1176~2':_stg %_1175~0':_r64 %_1177~1':_stg %_1178~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2736
	mov rdi,r8
	call dlt
LB_2736:
	bt r12,1
	jc LB_2737
	mov rdi,r14
	call dlt
LB_2737:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2738
	btr r12,1
	jmp LB_2739
LB_2738:
	bts r12,1
LB_2739:
	ret
MTC_LB_2724:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2740
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_2741
	bt QWORD [rdi],0
	jc LB_2742
	btr r12,4
	jmp LB_2743
LB_2742:
	bts r12,4
LB_2743:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2741:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_2744
	btr r12,1
	jmp LB_2745
LB_2744:
	bts r12,1
LB_2745:
LB_2746:
	cmp r15,0
	jz LB_2747
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2746
LB_2747:
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2748:
	cmp rax,0
	jz LB_2749
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2748
LB_2749:
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = .. \n"
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
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; ∎ { %_1180 %_1182 }
 ; {>  %_1181~2':_stg %_1180~0':_r64 %_1179~1':_p800 %_1182~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_2750
	mov rdi,r8
	call dlt
LB_2750:
	bt r12,1
	jc LB_2751
	mov rdi,r14
	call dlt
LB_2751:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2752
	btr r12,1
	jmp LB_2753
LB_2752:
	bts r12,1
LB_2753:
	ret
MTC_LB_2740:
MTC_LB_2709:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz MTC_LB_2754
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °5◂2'
; 1' ⊢ °5◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2755
	bt QWORD [rdi],0
	jc LB_2756
	btr r12,3
	jmp LB_2757
LB_2756:
	bts r12,3
LB_2757:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2755:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_2758
	btr r12,2
	jmp LB_2759
LB_2758:
	bts r12,2
LB_2759:
LB_2760:
	cmp r15,0
	jz LB_2761
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2760
LB_2761:
; _f56 %_1123 ⊢ %_1184 : %_1184
 ; {>  %_1123~0':_r64 %_1183~2':(_lst)◂({ _stg _p786 }) }
	add r13,1
; _f1216 { %_1184 %_1183 } ⊢ { %_1185 %_1186 } : { %_1185 %_1186 }
 ; {>  %_1183~2':(_lst)◂({ _stg _p786 }) %_1184~0':_r64 }
; _f1216 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2762
	btr r12,1
	jmp LB_2763
LB_2762:
	bts r12,1
LB_2763:
	call NS_E_1216
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f55 %_1185 ⊢ %_1187 : %_1187
 ; {>  %_1185~0':_r64 %_1186~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_2764:
	cmp rax,0
	jz LB_2765
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_2764
LB_2765:
; "\194\182\n"
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1188 %_1190 }
 ; {>  %_1189~1':_stg %_1190~2':_stg %_1188~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_2766
	mov rdi,r14
	call dlt
LB_2766:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2767
	btr r12,1
	jmp LB_2768
LB_2767:
	bts r12,1
LB_2768:
	ret
MTC_LB_2754:
NS_E_1122:
; 	|» { 0' 1' }
NS_E_RDI_1122:
MTC_LB_2769:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2770
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2771
	bt QWORD [rdi],0
	jc LB_2772
	btr r12,2
	jmp LB_2773
LB_2772:
	bts r12,2
LB_2773:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2771:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2774:
	cmp r15,0
	jz LB_2775
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2774
LB_2775:
; 	» "" _ ⊢ 1' : %_1112
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_1110 %_1112 }
 ; {>  %_1110~0':_r64 %_1112~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2770:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2776
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_2777
	bt QWORD [rdi],0
	jc LB_2778
	btr r12,4
	jmp LB_2779
LB_2778:
	bts r12,4
LB_2779:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_2777:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_2782
	btr r12,5
	jmp LB_2783
LB_2782:
	bts r12,5
LB_2783:
	mov r8,r11
	bt r12,5
	jc LB_2780
	btr r12,2
	jmp LB_2781
LB_2780:
	bts r12,2
LB_2781:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_2786
	btr r12,5
	jmp LB_2787
LB_2786:
	bts r12,5
LB_2787:
	mov r9,r11
	bt r12,5
	jc LB_2784
	btr r12,3
	jmp LB_2785
LB_2784:
	bts r12,3
LB_2785:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_2788:
	cmp r15,0
	jz LB_2789
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2788
LB_2789:
; _f1191 { %_1110 %_1113 } ⊢ { %_1115 %_1116 } : { %_1115 %_1116 }
 ; {>  %_1110~0':_r64 %_1114~3':(_lst)◂(_p783) %_1113~2':_p783 }
; _f1191 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_2792
	btr r12,1
	jmp LB_2793
LB_2792:
	bts r12,1
LB_2793:
	call NS_E_1191
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_2790
	btr r12,3
	jmp LB_2791
LB_2790:
	bts r12,3
LB_2791:
	add rsp,16
; _f1122 { %_1115 %_1114 } ⊢ { %_1117 %_1118 } : { %_1117 %_1118 }
 ; {>  %_1116~1':_stg %_1115~0':_r64 %_1114~3':(_lst)◂(_p783) }
; _f1122 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2796
	btr r12,1
	jmp LB_2797
LB_2796:
	bts r12,1
LB_2797:
	call NS_E_1122
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_2798
	btr r12,2
	jmp LB_2799
LB_2798:
	bts r12,2
LB_2799:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_2794
	btr r12,1
	jmp LB_2795
LB_2794:
	bts r12,1
LB_2795:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_1117 %_1121 }
 ; {>  %_1119~1':_stg %_1120~2':_stg %_1117~0':_r64 %_1121~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_2800
	mov rdi,r14
	call dlt
LB_2800:
	bt r12,2
	jc LB_2801
	mov rdi,r8
	call dlt
LB_2801:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2802
	btr r12,1
	jmp LB_2803
LB_2802:
	bts r12,1
LB_2803:
	ret
MTC_LB_2776:
NS_E_2807:
NS_E_RDI_2807:
NS_E_2807_ETR_TBL:
NS_E_2807_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_2911
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_2911
	jmp LB_2912
LB_2911:
	jmp LB_2903
LB_2912:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2904
	btr r12,0
	jmp LB_2905
LB_2904:
	bts r12,0
LB_2905:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2900
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_2811 : %_2811
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_2811
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_2811 ⊢ %_2812 : %_2812
 ; {>  %_2811~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2812
 ; {>  %_2812~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2898
	btr r12,3
	jmp LB_2899
LB_2898:
	bts r12,3
LB_2899:
	mov r8,0
	bts r12,2
	ret
LB_2900:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2902
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_2901
LB_2902:
	add rsp,8
	ret
LB_2903:
	add rsp,16
	pop r14
LB_2901:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_67_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2927
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_2919
LB_2927:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_2807_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2932
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2933
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2933:
	jmp LB_2919
LB_2932:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2922
	btr r12,1
	jmp LB_2923
LB_2922:
	bts r12,1
LB_2923:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2920
	btr r12,0
	jmp LB_2921
LB_2920:
	bts r12,0
LB_2921:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2916
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f56 %_2814 ⊢ %_2815 : %_2815
 ; {>  %_2813~0':_r64 %_2814~1':_r64 }
	add r14,1
; _some %_2815 ⊢ %_2816 : %_2816
 ; {>  %_2815~1':_r64 %_2813~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_2816
 ; {>  %_2813~0':_r64 %_2816~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_2913
	mov rdi,r13
	call dlt
LB_2913:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_2914
	btr r12,3
	jmp LB_2915
LB_2914:
	bts r12,3
LB_2915:
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
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_2917
LB_2918:
	add rsp,8
	ret
LB_2919:
	add rsp,32
	pop r14
LB_2917:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2808:
NS_E_RDI_2808:
NS_E_2808_ETR_TBL:
NS_E_2808_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_2950
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_2950
	jmp LB_2951
LB_2950:
	jmp LB_2940
LB_2951:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_2808_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2955
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2956
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2956:
	jmp LB_2940
LB_2955:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2943
	btr r12,1
	jmp LB_2944
LB_2943:
	bts r12,1
LB_2944:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2941
	btr r12,0
	jmp LB_2942
LB_2941:
	bts r12,0
LB_2942:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2937
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_2958
	btr r12,2
	jmp LB_2959
LB_2958:
	bts r12,2
LB_2959:
	mov r13,r14
	bt r12,1
	jc LB_2960
	btr r12,0
	jmp LB_2961
LB_2960:
	bts r12,0
LB_2961:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f56 %_2817 ⊢ %_2818 : %_2818
 ; {>  %_2817~0':_r64 }
	add r13,1
; _some %_2818 ⊢ %_2819 : %_2819
 ; {>  %_2818~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2819
 ; {>  %_2819~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2935
	btr r12,3
	jmp LB_2936
LB_2935:
	bts r12,3
LB_2936:
	mov r8,0
	bts r12,2
	ret
LB_2937:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2939
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_2938
LB_2939:
	add rsp,8
	ret
LB_2940:
	add rsp,32
	pop r14
LB_2938:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_2977
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_2977
	jmp LB_2978
LB_2977:
	jmp LB_2967
LB_2978:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_2808_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_2982
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2983
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2983:
	jmp LB_2967
LB_2982:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2970
	btr r12,1
	jmp LB_2971
LB_2970:
	bts r12,1
LB_2971:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2968
	btr r12,0
	jmp LB_2969
LB_2968:
	bts r12,0
LB_2969:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2964
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_2985
	btr r12,2
	jmp LB_2986
LB_2985:
	bts r12,2
LB_2986:
	mov r13,r14
	bt r12,1
	jc LB_2987
	btr r12,0
	jmp LB_2988
LB_2987:
	bts r12,0
LB_2988:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f56 %_2820 ⊢ %_2821 : %_2821
 ; {>  %_2820~0':_r64 }
	add r13,1
; _some %_2821 ⊢ %_2822 : %_2822
 ; {>  %_2821~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2822
 ; {>  %_2822~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2962
	btr r12,3
	jmp LB_2963
LB_2962:
	bts r12,3
LB_2963:
	mov r8,0
	bts r12,2
	ret
LB_2964:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2966
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_2965
LB_2966:
	add rsp,8
	ret
LB_2967:
	add rsp,32
	pop r14
LB_2965:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_2991
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_2823 : %_2823
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_2823
	mov rdi,0x0
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
	jc LB_2989
	btr r12,3
	jmp LB_2990
LB_2989:
	bts r12,3
LB_2990:
	mov r8,0
	bts r12,2
	ret
LB_2991:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2993
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_2992
LB_2993:
	add rsp,8
	ret
LB_2994:
	add rsp,0
	pop r14
LB_2992:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2809:
NS_E_RDI_2809:
NS_E_2809_ETR_TBL:
NS_E_2809_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_2808_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3074
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3021
LB_3074:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_3082
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_3082
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_3082
	jmp LB_3083
LB_3082:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3080
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3080:
	jmp LB_3021
LB_3083:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_2808_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3038
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3039
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3039:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3040
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3040:
	jmp LB_3022
LB_3038:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_3050
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_3050
	jmp LB_3051
LB_3050:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3046
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3046:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3047
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3047:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3048
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3048:
	jmp LB_3022
LB_3051:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_2810_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3055
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3056
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3056:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3057
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3057:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3058
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3058:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3059
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3059:
	jmp LB_3022
LB_3055:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_2809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3064
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_3065
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_3065:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3066
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3066:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3067
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3067:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3068
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3068:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3069
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3069:
	jmp LB_3022
LB_3064:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_3033
	btr r12,5
	jmp LB_3034
LB_3033:
	bts r12,5
LB_3034:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_3031
	btr r12,4
	jmp LB_3032
LB_3031:
	bts r12,4
LB_3032:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3029
	btr r12,3
	jmp LB_3030
LB_3029:
	bts r12,3
LB_3030:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3027
	btr r12,2
	jmp LB_3028
LB_3027:
	bts r12,2
LB_3028:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3025
	btr r12,1
	jmp LB_3026
LB_3025:
	bts r12,1
LB_3026:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3023
	btr r12,0
	jmp LB_3024
LB_3023:
	bts r12,0
LB_3024:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_3018
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_3084
	btr r12,6
	jmp LB_3085
LB_3084:
	bts r12,6
LB_3085:
	mov r8,r10
	bt r12,4
	jc LB_3086
	btr r12,2
	jmp LB_3087
LB_3086:
	bts r12,2
LB_3087:
	mov rdx,r14
	bt r12,1
	jc LB_3088
	btr r12,7
	jmp LB_3089
LB_3088:
	bts r12,7
LB_3089:
	mov r14,rcx
	bt r12,6
	jc LB_3090
	btr r12,1
	jmp LB_3091
LB_3090:
	bts r12,1
LB_3091:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3094
	btr r12,6
	jmp LB_3095
LB_3094:
	bts r12,6
LB_3095:
	mov r9,rcx
	bt r12,6
	jc LB_3092
	btr r12,3
	jmp LB_3093
LB_3092:
	bts r12,3
LB_3093:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3098
	btr r12,6
	jmp LB_3099
LB_3098:
	bts r12,6
LB_3099:
	mov r10,rcx
	bt r12,6
	jc LB_3096
	btr r12,4
	jmp LB_3097
LB_3096:
	bts r12,4
LB_3097:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_2830 : %_2830
 ; {>  %_2829~4':(_lst)◂(_p2804) %_2827~2':_r64 %_2825~0':_r64 %_2826~1':_r64 %_2828~3':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_2830
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f51 { %_2830 %_2825 } ⊢ { %_2831 %_2832 } : { %_2831 %_2832 }
 ; {>  %_2830~5':_r64 %_2829~4':(_lst)◂(_p2804) %_2827~2':_r64 %_2825~0':_r64 %_2826~1':_r64 %_2828~3':_r64 }
	add r11,r13
; _f51 { %_2831 %_2826 } ⊢ { %_2833 %_2834 } : { %_2833 %_2834 }
 ; {>  %_2832~0':_r64 %_2829~4':(_lst)◂(_p2804) %_2827~2':_r64 %_2831~5':_r64 %_2826~1':_r64 %_2828~3':_r64 }
	add r11,r14
; _f51 { %_2833 %_2827 } ⊢ { %_2835 %_2836 } : { %_2835 %_2836 }
 ; {>  %_2832~0':_r64 %_2829~4':(_lst)◂(_p2804) %_2827~2':_r64 %_2828~3':_r64 %_2833~5':_r64 %_2834~1':_r64 }
	add r11,r8
; _f2805 %_2835 ⊢ %_2837 : %_2837
 ; {>  %_2832~0':_r64 %_2829~4':(_lst)◂(_p2804) %_2835~5':_r64 %_2836~2':_r64 %_2828~3':_r64 %_2834~1':_r64 }
; _f2805 5' ⊢ °0◂5'
; _cns { %_2837 %_2829 } ⊢ %_2838 : %_2838
 ; {>  %_2832~0':_r64 %_2829~4':(_lst)◂(_p2804) %_2836~2':_r64 %_2828~3':_r64 %_2837~°0◂5':_p2804 %_2834~1':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_2828 %_2838 } ⊢ %_2839 : %_2839
 ; {>  %_2838~°0◂{ °0◂5' 4' }:(_lst)◂(_p2804) %_2832~0':_r64 %_2836~2':_r64 %_2828~3':_r64 %_2834~1':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_2839
 ; {>  %_2832~0':_r64 %_2836~2':_r64 %_2839~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p2804) }) %_2834~1':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,0
	jc LB_2995
	mov rdi,r13
	call dlt
LB_2995:
	bt r12,2
	jc LB_2996
	mov rdi,r8
	call dlt
LB_2996:
	bt r12,1
	jc LB_2997
	mov rdi,r14
	call dlt
LB_2997:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_2998
	btr r12,0
	jmp LB_2999
LB_2998:
	bts r12,0
LB_2999:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_3002
	btr r12,1
	jmp LB_3003
LB_3002:
	bts r12,1
LB_3003:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3000
	btr QWORD [rdi],0
	jmp LB_3001
LB_3000:
	bts QWORD [rdi],0
LB_3001:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_3012
	btr r12,0
	jmp LB_3013
LB_3012:
	bts r12,0
LB_3013:
	mov rsi,1
	bt r12,0
	jc LB_3010
	mov rsi,0
	bt r13,0
	jc LB_3010
	jmp LB_3011
LB_3010:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_3011:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_3008
	btr QWORD [rdi],0
	jmp LB_3009
LB_3008:
	bts QWORD [rdi],0
LB_3009:
	mov r13,r10
	bt r12,4
	jc LB_3016
	btr r12,0
	jmp LB_3017
LB_3016:
	bts r12,0
LB_3017:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_3014
	btr QWORD [rdi],1
	jmp LB_3015
LB_3014:
	bts QWORD [rdi],1
LB_3015:
	mov rsi,1
	bt r12,1
	jc LB_3006
	mov rsi,0
	bt r14,0
	jc LB_3006
	jmp LB_3007
LB_3006:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3007:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3004
	btr QWORD [rdi],1
	jmp LB_3005
LB_3004:
	bts QWORD [rdi],1
LB_3005:
	mov r8,0
	bts r12,2
	ret
LB_3018:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3020
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3019
LB_3020:
	add rsp,8
	ret
LB_3022:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_3021:
	add rsp,96
	pop r14
LB_3019:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_2808_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3153
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3125
LB_3153:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_3161
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_3161
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_3161
	jmp LB_3162
LB_3161:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3159
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3159:
	jmp LB_3125
LB_3162:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_2807_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3138
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3139
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3139:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3140
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3140:
	jmp LB_3126
LB_3138:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_2809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3145
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3146
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3146:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3147
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3147:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3148
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3148:
	jmp LB_3126
LB_3145:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3133
	btr r12,3
	jmp LB_3134
LB_3133:
	bts r12,3
LB_3134:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3131
	btr r12,2
	jmp LB_3132
LB_3131:
	bts r12,2
LB_3132:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3129
	btr r12,1
	jmp LB_3130
LB_3129:
	bts r12,1
LB_3130:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3127
	btr r12,0
	jmp LB_3128
LB_3127:
	bts r12,0
LB_3128:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_3122
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_3163
	btr r12,4
	jmp LB_3164
LB_3163:
	bts r12,4
LB_3164:
	mov r14,r8
	bt r12,2
	jc LB_3165
	btr r12,1
	jmp LB_3166
LB_3165:
	bts r12,1
LB_3166:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_3167
	btr r12,4
	jmp LB_3168
LB_3167:
	bts r12,4
LB_3168:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3171
	btr r12,5
	jmp LB_3172
LB_3171:
	bts r12,5
LB_3172:
	mov r8,r11
	bt r12,5
	jc LB_3169
	btr r12,2
	jmp LB_3170
LB_3169:
	bts r12,2
LB_3170:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3175
	btr r12,5
	jmp LB_3176
LB_3175:
	bts r12,5
LB_3176:
	mov r9,r11
	bt r12,5
	jc LB_3173
	btr r12,3
	jmp LB_3174
LB_3173:
	bts r12,3
LB_3174:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_2844 : %_2844
 ; {>  %_2841~1':_r64 %_2843~3':(_lst)◂(_p2804) %_2840~0':_r64 %_2842~2':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_2844
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f51 { %_2844 %_2840 } ⊢ { %_2845 %_2846 } : { %_2845 %_2846 }
 ; {>  %_2841~1':_r64 %_2844~4':_r64 %_2843~3':(_lst)◂(_p2804) %_2840~0':_r64 %_2842~2':_r64 }
	add r10,r13
; _f51 { %_2845 %_2841 } ⊢ { %_2847 %_2848 } : { %_2847 %_2848 }
 ; {>  %_2846~0':_r64 %_2845~4':_r64 %_2841~1':_r64 %_2843~3':(_lst)◂(_p2804) %_2842~2':_r64 }
	add r10,r14
; _f2805 %_2847 ⊢ %_2849 : %_2849
 ; {>  %_2846~0':_r64 %_2848~1':_r64 %_2847~4':_r64 %_2843~3':(_lst)◂(_p2804) %_2842~2':_r64 }
; _f2805 4' ⊢ °0◂4'
; _cns { %_2849 %_2843 } ⊢ %_2850 : %_2850
 ; {>  %_2846~0':_r64 %_2848~1':_r64 %_2843~3':(_lst)◂(_p2804) %_2849~°0◂4':_p2804 %_2842~2':_r64 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_2842 %_2850 } ⊢ %_2851 : %_2851
 ; {>  %_2846~0':_r64 %_2848~1':_r64 %_2850~°0◂{ °0◂4' 3' }:(_lst)◂(_p2804) %_2842~2':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_2851
 ; {>  %_2846~0':_r64 %_2848~1':_r64 %_2851~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p2804) }) }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,0
	jc LB_3100
	mov rdi,r13
	call dlt
LB_3100:
	bt r12,1
	jc LB_3101
	mov rdi,r14
	call dlt
LB_3101:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_3102
	btr r12,0
	jmp LB_3103
LB_3102:
	bts r12,0
LB_3103:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_3106
	btr r12,1
	jmp LB_3107
LB_3106:
	bts r12,1
LB_3107:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3104
	btr QWORD [rdi],0
	jmp LB_3105
LB_3104:
	bts QWORD [rdi],0
LB_3105:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_3116
	btr r12,2
	jmp LB_3117
LB_3116:
	bts r12,2
LB_3117:
	mov rsi,1
	bt r12,2
	jc LB_3114
	mov rsi,0
	bt r8,0
	jc LB_3114
	jmp LB_3115
LB_3114:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_3115:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3112
	btr QWORD [rdi],0
	jmp LB_3113
LB_3112:
	bts QWORD [rdi],0
LB_3113:
	mov r8,r13
	bt r12,0
	jc LB_3120
	btr r12,2
	jmp LB_3121
LB_3120:
	bts r12,2
LB_3121:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3118
	btr QWORD [rdi],1
	jmp LB_3119
LB_3118:
	bts QWORD [rdi],1
LB_3119:
	mov rsi,1
	bt r12,1
	jc LB_3110
	mov rsi,0
	bt r14,0
	jc LB_3110
	jmp LB_3111
LB_3110:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3111:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3108
	btr QWORD [rdi],1
	jmp LB_3109
LB_3108:
	bts QWORD [rdi],1
LB_3109:
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
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3123
LB_3124:
	add rsp,8
	ret
LB_3126:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_3125:
	add rsp,64
	pop r14
LB_3123:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_2807_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3248
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3240
LB_3248:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_2809_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3253
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3254
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3254:
	jmp LB_3240
LB_3253:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3243
	btr r12,1
	jmp LB_3244
LB_3243:
	bts r12,1
LB_3244:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3241
	btr r12,0
	jmp LB_3242
LB_3241:
	bts r12,0
LB_3242:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3237
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_3256
	btr r12,3
	jmp LB_3257
LB_3256:
	bts r12,3
LB_3257:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_3260
	btr r12,4
	jmp LB_3261
LB_3260:
	bts r12,4
LB_3261:
	mov r14,r10
	bt r12,4
	jc LB_3258
	btr r12,1
	jmp LB_3259
LB_3258:
	bts r12,1
LB_3259:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_3264
	btr r12,4
	jmp LB_3265
LB_3264:
	bts r12,4
LB_3265:
	mov r8,r10
	bt r12,4
	jc LB_3262
	btr r12,2
	jmp LB_3263
LB_3262:
	bts r12,2
LB_3263:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f51 { %_2853 %_2852 } ⊢ { %_2855 %_2856 } : { %_2855 %_2856 }
 ; {>  %_2853~1':_r64 %_2854~2':(_lst)◂(_p2804) %_2852~0':_r64 }
	add r14,r13
MTC_LB_3177:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3178
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_3179
	bt QWORD [rdi],0
	jc LB_3180
	btr r12,5
	jmp LB_3181
LB_3180:
	bts r12,5
LB_3181:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3179:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3184
	btr r12,6
	jmp LB_3185
LB_3184:
	bts r12,6
LB_3185:
	mov r9,rcx
	bt r12,6
	jc LB_3182
	btr r12,3
	jmp LB_3183
LB_3182:
	bts r12,3
LB_3183:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3188
	btr r12,6
	jmp LB_3189
LB_3188:
	bts r12,6
LB_3189:
	mov r10,rcx
	bt r12,6
	jc LB_3186
	btr r12,4
	jmp LB_3187
LB_3186:
	bts r12,4
LB_3187:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3178
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
; 3' ⊢ °1◂5'
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_3190
	bt QWORD [rdi],0
	jc LB_3191
	btr r12,6
	jmp LB_3192
LB_3191:
	bts r12,6
LB_3192:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3190:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_3193
	btr r12,5
	jmp LB_3194
LB_3193:
	bts r12,5
LB_3194:
LB_3195:
	cmp r15,0
	jz LB_3196
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3195
LB_3196:
; _f51 { %_2859 %_2856 } ⊢ { %_2860 %_2861 } : { %_2860 %_2861 }
 ; {>  %_2859~5':_r64 %_2858~4':(_lst)◂(_p2804) %_2856~0':_r64 %_2855~1':_r64 }
	add r11,r13
; _f2806 %_2860 ⊢ %_2862 : %_2862
 ; {>  %_2858~4':(_lst)◂(_p2804) %_2861~0':_r64 %_2860~5':_r64 %_2855~1':_r64 }
; _f2806 5' ⊢ °1◂5'
; _cns { %_2862 %_2858 } ⊢ %_2863 : %_2863
 ; {>  %_2858~4':(_lst)◂(_p2804) %_2861~0':_r64 %_2862~°1◂5':_p2804 %_2855~1':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_2855 %_2863 } ⊢ %_2864 : %_2864
 ; {>  %_2863~°0◂{ °1◂5' 4' }:(_lst)◂(_p2804) %_2861~0':_r64 %_2855~1':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_2864
 ; {>  %_2861~0':_r64 %_2864~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p2804) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_3197
	mov rdi,r13
	call dlt
LB_3197:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_3200
	btr r12,0
	jmp LB_3201
LB_3200:
	bts r12,0
LB_3201:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_3198
	btr QWORD [rdi],0
	jmp LB_3199
LB_3198:
	bts QWORD [rdi],0
LB_3199:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_3210
	btr r12,1
	jmp LB_3211
LB_3210:
	bts r12,1
LB_3211:
	mov rsi,1
	bt r12,1
	jc LB_3208
	mov rsi,0
	bt r14,0
	jc LB_3208
	jmp LB_3209
LB_3208:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3209:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3206
	btr QWORD [rdi],0
	jmp LB_3207
LB_3206:
	bts QWORD [rdi],0
LB_3207:
	mov r14,r10
	bt r12,4
	jc LB_3214
	btr r12,1
	jmp LB_3215
LB_3214:
	bts r12,1
LB_3215:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3212
	btr QWORD [rdi],1
	jmp LB_3213
LB_3212:
	bts QWORD [rdi],1
LB_3213:
	mov rsi,1
	bt r12,0
	jc LB_3204
	mov rsi,0
	bt r13,0
	jc LB_3204
	jmp LB_3205
LB_3204:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_3205:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_3202
	btr QWORD [rdi],1
	jmp LB_3203
LB_3202:
	bts QWORD [rdi],1
LB_3203:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3178:
	mov r15,0
LB_3217:
	cmp r15,0
	jz LB_3218
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3217
LB_3218:
; _f2806 %_2856 ⊢ %_2865 : %_2865
 ; {>  %_2856~0':_r64 %_2855~1':_r64 %_2854~2':(_lst)◂(_p2804) }
; _f2806 0' ⊢ °1◂0'
; _cns { %_2865 %_2854 } ⊢ %_2866 : %_2866
 ; {>  %_2865~°1◂0':_p2804 %_2855~1':_r64 %_2854~2':(_lst)◂(_p2804) }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_2855 %_2866 } ⊢ %_2867 : %_2867
 ; {>  %_2866~°0◂{ °1◂0' 2' }:(_lst)◂(_p2804) %_2855~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_2867
 ; {>  %_2867~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p2804) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂0' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 1' °0◂{ °1◂0' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_3221
	btr r12,4
	jmp LB_3222
LB_3221:
	bts r12,4
LB_3222:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_3219
	btr QWORD [rdi],0
	jmp LB_3220
LB_3219:
	bts QWORD [rdi],0
LB_3220:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_3231
	btr r12,1
	jmp LB_3232
LB_3231:
	bts r12,1
LB_3232:
	mov rsi,1
	bt r12,1
	jc LB_3229
	mov rsi,0
	bt r14,0
	jc LB_3229
	jmp LB_3230
LB_3229:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3230:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3227
	btr QWORD [rdi],0
	jmp LB_3228
LB_3227:
	bts QWORD [rdi],0
LB_3228:
	mov r14,r8
	bt r12,2
	jc LB_3235
	btr r12,1
	jmp LB_3236
LB_3235:
	bts r12,1
LB_3236:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3233
	btr QWORD [rdi],1
	jmp LB_3234
LB_3233:
	bts QWORD [rdi],1
LB_3234:
	mov rsi,1
	bt r12,4
	jc LB_3225
	mov rsi,0
	bt r10,0
	jc LB_3225
	jmp LB_3226
LB_3225:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_3226:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_3223
	btr QWORD [rdi],1
	jmp LB_3224
LB_3223:
	bts QWORD [rdi],1
LB_3224:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3216:
LB_3237:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3239
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3238
LB_3239:
	add rsp,8
	ret
LB_3240:
	add rsp,32
	pop r14
LB_3238:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_3274
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_2868 : %_2868
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_2869 : %_2869
 ; {>  %_2868~°1◂{  }:(_lst)◂(t1324'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_2869
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_2869 %_2868 } ⊢ %_2870 : %_2870
 ; {>  %_2869~0':_r64 %_2868~°1◂{  }:(_lst)◂(t1324'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_2870
 ; {>  %_2870~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t1328'(0)) }) }
; 	∎ °0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_3268
	btr r12,1
	jmp LB_3269
LB_3268:
	bts r12,1
LB_3269:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_3266
	btr QWORD [rdi],0
	jmp LB_3267
LB_3266:
	bts QWORD [rdi],0
LB_3267:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_3272
	mov rsi,0
	bt r14,0
	jc LB_3272
	jmp LB_3273
LB_3272:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3273:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_3270
	btr QWORD [rdi],1
	jmp LB_3271
LB_3270:
	bts QWORD [rdi],1
LB_3271:
	mov r8,0
	bts r12,2
	ret
LB_3274:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3276
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3275
LB_3276:
	add rsp,8
	ret
LB_3277:
	add rsp,0
	pop r14
LB_3275:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2810:
NS_E_RDI_2810:
NS_E_2810_ETR_TBL:
NS_E_2810_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_2808_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3315
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3285
LB_3315:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_3323
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_3323
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_3323
	jmp LB_3324
LB_3323:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3321
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3321:
	jmp LB_3285
LB_3324:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_2808_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3298
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3299
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3299:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3300
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3300:
	jmp LB_3286
LB_3298:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_3310
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_3310
	jmp LB_3311
LB_3310:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3306
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3306:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3307
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3307:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3308
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3308:
	jmp LB_3286
LB_3311:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3293
	btr r12,3
	jmp LB_3294
LB_3293:
	bts r12,3
LB_3294:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3291
	btr r12,2
	jmp LB_3292
LB_3291:
	bts r12,2
LB_3292:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3289
	btr r12,1
	jmp LB_3290
LB_3289:
	bts r12,1
LB_3290:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3287
	btr r12,0
	jmp LB_3288
LB_3287:
	bts r12,0
LB_3288:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_3282
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_3325
	btr r12,4
	jmp LB_3326
LB_3325:
	bts r12,4
LB_3326:
	mov r14,r8
	bt r12,2
	jc LB_3327
	btr r12,1
	jmp LB_3328
LB_3327:
	bts r12,1
LB_3328:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_2873 : %_2873
 ; {>  %_2871~0':_r64 %_2872~1':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_2873
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f51 { %_2873 %_2871 } ⊢ { %_2874 %_2875 } : { %_2874 %_2875 }
 ; {>  %_2871~0':_r64 %_2873~2':_r64 %_2872~1':_r64 }
	add r8,r13
; _f51 { %_2874 %_2872 } ⊢ { %_2876 %_2877 } : { %_2876 %_2877 }
 ; {>  %_2874~2':_r64 %_2875~0':_r64 %_2872~1':_r64 }
	add r8,r14
; _some %_2876 ⊢ %_2878 : %_2878
 ; {>  %_2877~1':_r64 %_2876~2':_r64 %_2875~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_2878
 ; {>  %_2877~1':_r64 %_2878~°0◂2':(_opn)◂(_r64) %_2875~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_3278
	mov rdi,r14
	call dlt
LB_3278:
	bt r12,0
	jc LB_3279
	mov rdi,r13
	call dlt
LB_3279:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_3280
	btr r12,3
	jmp LB_3281
LB_3280:
	bts r12,3
LB_3281:
	mov r8,0
	bts r12,2
	ret
LB_3282:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3284
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3283
LB_3284:
	add rsp,8
	ret
LB_3286:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_3285:
	add rsp,64
	pop r14
LB_3283:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_2808_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3391
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3338
LB_3391:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_3399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_3399
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_3399
	jmp LB_3400
LB_3399:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3397
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3397:
	jmp LB_3338
LB_3400:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_2808_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3355
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3356
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3356:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3357
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3357:
	jmp LB_3339
LB_3355:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_3367
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_3367
	jmp LB_3368
LB_3367:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3363
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3363:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3364
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3364:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3365
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3365:
	jmp LB_3339
LB_3368:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_2810_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3372
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3373
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3373:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3374
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3374:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3375
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3375:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3376
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3376:
	jmp LB_3339
LB_3372:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_2810_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3381
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_3382
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_3382:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_3383
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_3383:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_3384
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_3384:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3385
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3385:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3386
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3386:
	jmp LB_3339
LB_3381:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_3350
	btr r12,5
	jmp LB_3351
LB_3350:
	bts r12,5
LB_3351:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_3348
	btr r12,4
	jmp LB_3349
LB_3348:
	bts r12,4
LB_3349:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_3346
	btr r12,3
	jmp LB_3347
LB_3346:
	bts r12,3
LB_3347:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3344
	btr r12,2
	jmp LB_3345
LB_3344:
	bts r12,2
LB_3345:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3342
	btr r12,1
	jmp LB_3343
LB_3342:
	bts r12,1
LB_3343:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3340
	btr r12,0
	jmp LB_3341
LB_3340:
	bts r12,0
LB_3341:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_3335
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_3401
	btr r12,6
	jmp LB_3402
LB_3401:
	bts r12,6
LB_3402:
	mov r9,r11
	bt r12,5
	jc LB_3403
	btr r12,3
	jmp LB_3404
LB_3403:
	bts r12,3
LB_3404:
	mov r11,r8
	bt r12,2
	jc LB_3405
	btr r12,5
	jmp LB_3406
LB_3405:
	bts r12,5
LB_3406:
	mov r8,r10
	bt r12,4
	jc LB_3407
	btr r12,2
	jmp LB_3408
LB_3407:
	bts r12,2
LB_3408:
	mov r10,r14
	bt r12,1
	jc LB_3409
	btr r12,4
	jmp LB_3410
LB_3409:
	bts r12,4
LB_3410:
	mov r14,r11
	bt r12,5
	jc LB_3411
	btr r12,1
	jmp LB_3412
LB_3411:
	bts r12,1
LB_3412:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_2883 : %_2883
 ; {>  %_2882~3':_r64 %_2880~1':_r64 %_2881~2':_r64 %_2879~0':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_2883
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f51 { %_2883 %_2879 } ⊢ { %_2884 %_2885 } : { %_2884 %_2885 }
 ; {>  %_2882~3':_r64 %_2880~1':_r64 %_2881~2':_r64 %_2883~4':_r64 %_2879~0':_r64 }
	add r10,r13
; _f51 { %_2884 %_2880 } ⊢ { %_2886 %_2887 } : { %_2886 %_2887 }
 ; {>  %_2884~4':_r64 %_2882~3':_r64 %_2880~1':_r64 %_2881~2':_r64 %_2885~0':_r64 }
	add r10,r14
; _f51 { %_2886 %_2881 } ⊢ { %_2888 %_2889 } : { %_2888 %_2889 }
 ; {>  %_2882~3':_r64 %_2881~2':_r64 %_2887~1':_r64 %_2885~0':_r64 %_2886~4':_r64 }
	add r10,r8
; _f51 { %_2888 %_2882 } ⊢ { %_2890 %_2891 } : { %_2890 %_2891 }
 ; {>  %_2882~3':_r64 %_2888~4':_r64 %_2889~2':_r64 %_2887~1':_r64 %_2885~0':_r64 }
	add r10,r9
; _some %_2890 ⊢ %_2892 : %_2892
 ; {>  %_2891~3':_r64 %_2890~4':_r64 %_2889~2':_r64 %_2887~1':_r64 %_2885~0':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_2892
 ; {>  %_2891~3':_r64 %_2889~2':_r64 %_2892~°0◂4':(_opn)◂(_r64) %_2887~1':_r64 %_2885~0':_r64 }
; 	∎ °0◂4'
	bt r12,3
	jc LB_3329
	mov rdi,r9
	call dlt
LB_3329:
	bt r12,2
	jc LB_3330
	mov rdi,r8
	call dlt
LB_3330:
	bt r12,1
	jc LB_3331
	mov rdi,r14
	call dlt
LB_3331:
	bt r12,0
	jc LB_3332
	mov rdi,r13
	call dlt
LB_3332:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_3333
	btr r12,3
	jmp LB_3334
LB_3333:
	bts r12,3
LB_3334:
	mov r8,0
	bts r12,2
	ret
LB_3335:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3337
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3336
LB_3337:
	add rsp,8
	ret
LB_3339:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_3338:
	add rsp,96
	pop r14
LB_3336:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_2807_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3427
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3419
LB_3427:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_2810_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3432
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3433
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3433:
	jmp LB_3419
LB_3432:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3422
	btr r12,1
	jmp LB_3423
LB_3422:
	bts r12,1
LB_3423:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3420
	btr r12,0
	jmp LB_3421
LB_3420:
	bts r12,0
LB_3421:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3416
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f51 { %_2893 %_2894 } ⊢ { %_2895 %_2896 } : { %_2895 %_2896 }
 ; {>  %_2893~0':_r64 %_2894~1':_r64 }
	add r13,r14
; _some %_2895 ⊢ %_2897 : %_2897
 ; {>  %_2896~1':_r64 %_2895~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2897
 ; {>  %_2897~°0◂0':(_opn)◂(_r64) %_2896~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_3413
	mov rdi,r14
	call dlt
LB_3413:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3414
	btr r12,3
	jmp LB_3415
LB_3414:
	bts r12,3
LB_3415:
	mov r8,0
	bts r12,2
	ret
LB_3416:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3418
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3417
LB_3418:
	add rsp,8
	ret
LB_3419:
	add rsp,32
	pop r14
LB_3417:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3457:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_3457:
MTC_LB_3458:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3459
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_3460
	bt QWORD [rdi],0
	jc LB_3461
	btr r12,7
	jmp LB_3462
LB_3461:
	bts r12,7
LB_3462:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3460:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_3465
	btr r12,8
	jmp LB_3466
LB_3465:
	bts r12,8
LB_3466:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3463
	btr r12,5
	jmp LB_3464
LB_3463:
	bts r12,5
LB_3464:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_3469
	btr r12,8
	jmp LB_3470
LB_3469:
	bts r12,8
LB_3470:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_3467
	btr r12,6
	jmp LB_3468
LB_3467:
	bts r12,6
LB_3468:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3471:
	cmp r15,0
	jz LB_3472
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3471
LB_3472:
MTC_LB_3473:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3474
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °1◂4'
; 5' ⊢ °1◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_3475
	bt QWORD [rdi],0
	jc LB_3476
	btr r12,7
	jmp LB_3477
LB_3476:
	bts r12,7
LB_3477:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3475:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_3478
	btr r12,4
	jmp LB_3479
LB_3478:
	bts r12,4
LB_3479:
LB_3480:
	cmp r15,0
	jz LB_3481
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3480
LB_3481:
; _f53 %_3442 ⊢ { %_3443 %_3444 } : { %_3443 %_3444 }
 ; {>  %_3438~3':_r64 %_3441~6':(_lst)◂(_p2804) %_3437~2':_stg %_3436~1':_r64 %_3435~0':_stg %_3442~4':_r64 }
	mov r11,r10
	bts r12,5
; _f35 { %_3444 %_3435 %_3436 %_3437 %_3438 } ⊢ { %_3445 %_3446 %_3447 %_3448 %_3449 } : { %_3445 %_3446 %_3447 %_3448 %_3449 }
 ; {>  %_3438~3':_r64 %_3443~4':_r64 %_3441~6':(_lst)◂(_p2804) %_3444~5':_r64 %_3437~2':_stg %_3436~1':_r64 %_3435~0':_stg }
; _f35 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_3486
	btr r12,4
	jmp LB_3487
LB_3486:
	bts r12,4
LB_3487:
	mov r9,r8
	bt r12,2
	jc LB_3488
	btr r12,3
	jmp LB_3489
LB_3488:
	bts r12,3
LB_3489:
	mov r8,r14
	bt r12,1
	jc LB_3490
	btr r12,2
	jmp LB_3491
LB_3490:
	bts r12,2
LB_3491:
	mov r14,r13
	bt r12,0
	jc LB_3492
	btr r12,1
	jmp LB_3493
LB_3492:
	bts r12,1
LB_3493:
	mov r13,r11
	bt r12,5
	jc LB_3494
	btr r12,0
	jmp LB_3495
LB_3494:
	bts r12,0
LB_3495:
	call NS_E_35
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_3496
	btr r12,5
	jmp LB_3497
LB_3496:
	bts r12,5
LB_3497:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_3484
	btr r12,6
	jmp LB_3485
LB_3484:
	bts r12,6
LB_3485:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_3482
	btr r12,4
	jmp LB_3483
LB_3482:
	bts r12,4
LB_3483:
	add rsp,24
; _f3457 { %_3446 %_3447 %_3448 %_3449 %_3441 } ⊢ { %_3450 %_3451 } : { %_3450 %_3451 }
 ; {>  %_3446~1':_stg %_3443~4':_r64 %_3441~6':(_lst)◂(_p2804) %_3449~5':_r64 %_3447~2':_r64 %_3448~3':_stg %_3445~0':_r64 }
; _f3457 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_3502
	btr r12,0
	jmp LB_3503
LB_3502:
	bts r12,0
LB_3503:
	mov r14,r8
	bt r12,2
	jc LB_3504
	btr r12,1
	jmp LB_3505
LB_3504:
	bts r12,1
LB_3505:
	mov r8,r9
	bt r12,3
	jc LB_3506
	btr r12,2
	jmp LB_3507
LB_3506:
	bts r12,2
LB_3507:
	mov r9,r11
	bt r12,5
	jc LB_3508
	btr r12,3
	jmp LB_3509
LB_3508:
	bts r12,3
LB_3509:
	mov r10,rcx
	bt r12,6
	jc LB_3510
	btr r12,4
	jmp LB_3511
LB_3510:
	bts r12,4
LB_3511:
	call NS_E_3457
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_3512
	btr r12,2
	jmp LB_3513
LB_3512:
	bts r12,2
LB_3513:
	mov r14,r13
	bt r12,0
	jc LB_3514
	btr r12,1
	jmp LB_3515
LB_3514:
	bts r12,1
LB_3515:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_3500
	btr r12,4
	jmp LB_3501
LB_3500:
	bts r12,4
LB_3501:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3498
	btr r12,0
	jmp LB_3499
LB_3498:
	bts r12,0
LB_3499:
	add rsp,24
; ∎ { %_3450 %_3451 }
 ; {>  %_3443~4':_r64 %_3451~2':_stg %_3450~1':_stg %_3445~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_3516
	mov rdi,r10
	call dlt
LB_3516:
	bt r12,0
	jc LB_3517
	mov rdi,r13
	call dlt
LB_3517:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_3518
	btr r12,0
	jmp LB_3519
LB_3518:
	bts r12,0
LB_3519:
	mov r14,r8
	bt r12,2
	jc LB_3520
	btr r12,1
	jmp LB_3521
LB_3520:
	bts r12,1
LB_3521:
	ret
MTC_LB_3474:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3522
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °0◂4'
; 5' ⊢ °0◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_3523
	bt QWORD [rdi],0
	jc LB_3524
	btr r12,7
	jmp LB_3525
LB_3524:
	bts r12,7
LB_3525:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3523:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_3526
	btr r12,4
	jmp LB_3527
LB_3526:
	bts r12,4
LB_3527:
LB_3528:
	cmp r15,0
	jz LB_3529
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3528
LB_3529:
; _f51 { %_3436 %_3452 } ⊢ { %_3453 %_3454 } : { %_3453 %_3454 }
 ; {>  %_3438~3':_r64 %_3441~6':(_lst)◂(_p2804) %_3452~4':_r64 %_3437~2':_stg %_3436~1':_r64 %_3435~0':_stg }
	add r14,r10
; _f3457 { %_3435 %_3453 %_3437 %_3438 %_3441 } ⊢ { %_3455 %_3456 } : { %_3455 %_3456 }
 ; {>  %_3438~3':_r64 %_3441~6':(_lst)◂(_p2804) %_3454~4':_r64 %_3437~2':_stg %_3435~0':_stg %_3453~1':_r64 }
; _f3457 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_3532
	btr r12,4
	jmp LB_3533
LB_3532:
	bts r12,4
LB_3533:
	call NS_E_3457
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_3530
	btr r12,4
	jmp LB_3531
LB_3530:
	bts r12,4
LB_3531:
	add rsp,16
; ∎ { %_3455 %_3456 }
 ; {>  %_3455~0':_stg %_3454~4':_r64 %_3456~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_3534
	mov rdi,r10
	call dlt
LB_3534:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3522:
MTC_LB_3459:
	mov r15,0
LB_3536:
	cmp r15,0
	jz LB_3537
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3536
LB_3537:
; ∎ { %_3435 %_3437 }
 ; {>  %_3438~3':_r64 %_3439~4':(_lst)◂(_p2804) %_3437~2':_stg %_3436~1':_r64 %_3435~0':_stg }
; 	∎ { 0' 2' }
	bt r12,3
	jc LB_3538
	mov rdi,r9
	call dlt
LB_3538:
	bt r12,4
	jc LB_3539
	mov rdi,r10
	call dlt
LB_3539:
	bt r12,1
	jc LB_3540
	mov rdi,r14
	call dlt
LB_3540:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_3541
	btr r12,1
	jmp LB_3542
LB_3541:
	bts r12,1
LB_3542:
	ret
MTC_LB_3535:
NS_E_3558:
; 	|» 0'
NS_E_RDI_3558:
; » 0xr0 |~ {  } ⊢ %_3544 : %_3544
 ; {>  %_3543~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_3544
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f2809 { %_3543 %_3544 } ⊢ { %_3545 %_3546 %_3547 } : { %_3545 %_3546 %_3547 }
 ; {>  %_3543~0':_stg %_3544~1':_r64 }
; _f2809 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2809
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_3559
	btr r12,4
	jmp LB_3560
LB_3559:
	bts r12,4
LB_3560:
	mov r8,r9
	bt r12,3
	jc LB_3563
	btr r12,2
	jmp LB_3564
LB_3563:
	bts r12,2
LB_3564:
	mov rsi,1
	bt r12,2
	jc LB_3561
	mov rsi,0
	bt r8,0
	jc LB_3561
	jmp LB_3562
LB_3561:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_3562:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_3565:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3566
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_3567
	bt QWORD [rdi],0
	jc LB_3568
	btr r12,5
	jmp LB_3569
LB_3568:
	bts r12,5
LB_3569:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3567:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_3572
	btr r12,6
	jmp LB_3573
LB_3572:
	bts r12,6
LB_3573:
	mov r9,rcx
	bt r12,6
	jc LB_3570
	btr r12,3
	jmp LB_3571
LB_3570:
	bts r12,3
LB_3571:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_3576
	btr r12,6
	jmp LB_3577
LB_3576:
	bts r12,6
LB_3577:
	mov r10,rcx
	bt r12,6
	jc LB_3574
	btr r12,4
	jmp LB_3575
LB_3574:
	bts r12,4
LB_3575:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3578:
	cmp r15,0
	jz LB_3579
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3578
LB_3579:
; _f31 %_3548 ⊢ { %_3550 %_3551 } : { %_3550 %_3551 }
 ; {>  %_3549~4':(_lst)◂(_p2804) %_3545~0':_stg %_3548~3':_r64 %_3546~1':_r64 }
; _f31 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_3586
	btr r12,0
	jmp LB_3587
LB_3586:
	bts r12,0
LB_3587:
	call NS_E_31
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_3588
	btr r12,2
	jmp LB_3589
LB_3588:
	bts r12,2
LB_3589:
	mov r9,r14
	bt r12,1
	jc LB_3590
	btr r12,3
	jmp LB_3591
LB_3590:
	bts r12,3
LB_3591:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_3584
	btr r12,4
	jmp LB_3585
LB_3584:
	bts r12,4
LB_3585:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_3582
	btr r12,1
	jmp LB_3583
LB_3582:
	bts r12,1
LB_3583:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_3580
	btr r12,0
	jmp LB_3581
LB_3580:
	bts r12,0
LB_3581:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_3552 : %_3552
 ; {>  %_3549~4':(_lst)◂(_p2804) %_3545~0':_stg %_3550~2':_r64 %_3551~3':_stg %_3546~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_3552
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_3553 : %_3553
 ; {>  %_3549~4':(_lst)◂(_p2804) %_3545~0':_stg %_3550~2':_r64 %_3552~5':_r64 %_3551~3':_stg %_3546~1':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_3553
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f3457 { %_3545 %_3552 %_3551 %_3553 %_3549 } ⊢ { %_3554 %_3555 } : { %_3554 %_3555 }
 ; {>  %_3549~4':(_lst)◂(_p2804) %_3545~0':_stg %_3550~2':_r64 %_3553~6':_r64 %_3552~5':_r64 %_3551~3':_stg %_3546~1':_r64 }
; _f3457 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_3596
	btr r12,1
	jmp LB_3597
LB_3596:
	bts r12,1
LB_3597:
	mov r8,r9
	bt r12,3
	jc LB_3598
	btr r12,2
	jmp LB_3599
LB_3598:
	bts r12,2
LB_3599:
	mov r9,rcx
	bt r12,6
	jc LB_3600
	btr r12,3
	jmp LB_3601
LB_3600:
	bts r12,3
LB_3601:
	call NS_E_3457
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_3602
	btr r12,3
	jmp LB_3603
LB_3602:
	bts r12,3
LB_3603:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_3594
	btr r12,2
	jmp LB_3595
LB_3594:
	bts r12,2
LB_3595:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_3592
	btr r12,1
	jmp LB_3593
LB_3592:
	bts r12,1
LB_3593:
	add rsp,24
; _some %_3555 ⊢ %_3556 : %_3556
 ; {>  %_3555~3':_stg %_3554~0':_stg %_3550~2':_r64 %_3546~1':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_3554 %_3556 }
 ; {>  %_3554~0':_stg %_3550~2':_r64 %_3556~°0◂3':(_opn)◂(_stg) %_3546~1':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_3604
	mov rdi,r8
	call dlt
LB_3604:
	bt r12,1
	jc LB_3605
	mov rdi,r14
	call dlt
LB_3605:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3608
	btr r12,1
	jmp LB_3609
LB_3608:
	bts r12,1
LB_3609:
	mov rsi,1
	bt r12,1
	jc LB_3606
	mov rsi,0
	bt r14,0
	jc LB_3606
	jmp LB_3607
LB_3606:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3607:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_3566:
	mov r15,0
LB_3611:
	cmp r15,0
	jz LB_3612
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3611
LB_3612:
; _none {  } ⊢ %_3557 : %_3557
 ; {>  %_3545~0':_stg %_3547~2':(_opn)◂({ _r64 (_lst)◂(_p2804) }) %_3546~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ { %_3545 %_3557 }
 ; {>  %_3545~0':_stg %_3557~°1◂{  }:(_opn)◂(t1515'(0)) %_3547~2':(_opn)◂({ _r64 (_lst)◂(_p2804) }) %_3546~1':_r64 }
; 	∎ { 0' °1◂{  } }
	bt r12,2
	jc LB_3613
	mov rdi,r8
	call dlt
LB_3613:
	bt r12,1
	jc LB_3614
	mov rdi,r14
	call dlt
LB_3614:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_3615
	mov rsi,0
	bt r14,0
	jc LB_3615
	jmp LB_3616
LB_3615:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_3616:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_3610:
NS_E_3620:
NS_E_RDI_3620:
; » _^ ..
	xor rax,rax
	add rax,10
	add rax,7
	add rax,4
	add rax,6
	add rax,4
	add rax,6
	add rax,4
	add rax,3
	add rax,7
	add rax,19
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
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
; _f3558 %_3617 ⊢ { %_3618 %_3619 } : { %_3618 %_3619 }
 ; {>  %_3617~0':_stg }
; _f3558 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_3558
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_3619~1':(_opn)◂(_stg) %_3618~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_3621
	mov rdi,r14
	call dlt
LB_3621:
	bt r12,0
	jc LB_3622
	mov rdi,r13
	call dlt
LB_3622:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_3623:
NS_E_RDI_3623:
NS_E_3623_ETR_TBL:
NS_E_3623_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; prm_word
	jmp LB_3652
LB_3651:
	add r14,1
LB_3652:
	cmp r14,r10
	jge LB_3653
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3651
	cmp al,10
	jz LB_3651
	cmp al,32
	jz LB_3651
LB_3653:
	push r10
	call NS_E_689_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3654
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3644
LB_3654:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_3657
LB_3656:
	add r14,1
LB_3657:
	cmp r14,r10
	jge LB_3658
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3656
	cmp al,10
	jz LB_3656
	cmp al,32
	jz LB_3656
LB_3658:
	add r14,1
	cmp r14,r10
	jg LB_3662
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_3662
	jmp LB_3663
LB_3662:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3660
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3660:
	jmp LB_3644
LB_3663:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_3665
LB_3664:
	add r14,1
LB_3665:
	cmp r14,r10
	jge LB_3666
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3664
	cmp al,10
	jz LB_3664
	cmp al,32
	jz LB_3664
LB_3666:
	push r10
	call NS_E_3623_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3667
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3668
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3668:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3669
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3669:
	jmp LB_3644
LB_3667:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3649
	btr r12,2
	jmp LB_3650
LB_3649:
	bts r12,2
LB_3650:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3647
	btr r12,1
	jmp LB_3648
LB_3647:
	bts r12,1
LB_3648:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3645
	btr r12,0
	jmp LB_3646
LB_3645:
	bts r12,0
LB_3646:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3641
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_3671
	btr r12,3
	jmp LB_3672
LB_3671:
	bts r12,3
LB_3672:
	mov r14,r8
	bt r12,2
	jc LB_3673
	btr r12,1
	jmp LB_3674
LB_3673:
	bts r12,1
LB_3674:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f736 { %_3624 %_3625 } ⊢ %_3626 : %_3626
 ; {>  %_3624~0':_stg %_3625~1':_p735 }
; _f736 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3626 ⊢ %_3627 : %_3627
 ; {>  %_3626~°0◂{ 0' 1' }:_p735 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3627
 ; {>  %_3627~°0◂°0◂{ 0' 1' }:(_opn)◂(_p735) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_3635
	btr r12,2
	jmp LB_3636
LB_3635:
	bts r12,2
LB_3636:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3633
	btr QWORD [rdi],0
	jmp LB_3634
LB_3633:
	bts QWORD [rdi],0
LB_3634:
	mov r8,r14
	bt r12,1
	jc LB_3639
	btr r12,2
	jmp LB_3640
LB_3639:
	bts r12,2
LB_3640:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3637
	btr QWORD [rdi],1
	jmp LB_3638
LB_3637:
	bts QWORD [rdi],1
LB_3638:
	mov rsi,1
	bt r12,3
	jc LB_3631
	mov rsi,0
	bt r9,0
	jc LB_3631
	jmp LB_3632
LB_3631:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3632:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3641:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3643
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3642
LB_3643:
	add rsp,8
	ret
LB_3644:
	add rsp,48
	pop r14
LB_3642:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_3686
LB_3685:
	add r14,1
LB_3686:
	cmp r14,r10
	jge LB_3687
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3685
	cmp al,32
	jz LB_3685
LB_3687:
	push r10
	call NS_E_689_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3688
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3682
LB_3688:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3683
	btr r12,0
	jmp LB_3684
LB_3683:
	bts r12,0
LB_3684:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3679
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f737 %_3628 ⊢ %_3629 : %_3629
 ; {>  %_3628~0':_stg }
; _f737 0' ⊢ °1◂0'
; _some %_3629 ⊢ %_3630 : %_3630
 ; {>  %_3629~°1◂0':_p735 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3630
 ; {>  %_3630~°0◂°1◂0':(_opn)◂(_p735) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3677
	btr r12,3
	jmp LB_3678
LB_3677:
	bts r12,3
LB_3678:
	mov rsi,1
	bt r12,3
	jc LB_3675
	mov rsi,0
	bt r9,0
	jc LB_3675
	jmp LB_3676
LB_3675:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3676:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3679:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3681
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3680
LB_3681:
	add rsp,8
	ret
LB_3682:
	add rsp,16
	pop r14
LB_3680:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3690:
NS_E_RDI_3690:
NS_E_3690_ETR_TBL:
NS_E_3690_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_69_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3715
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3707
LB_3715:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_3723
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_3723
	jmp LB_3724
LB_3723:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3721
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3721:
	jmp LB_3707
LB_3724:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3710
	btr r12,1
	jmp LB_3711
LB_3710:
	bts r12,1
LB_3711:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3708
	btr r12,0
	jmp LB_3709
LB_3708:
	bts r12,0
LB_3709:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3704
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f856 %_3691 ⊢ %_3692 : %_3692
 ; {>  %_3691~0':_r64 }
; _f856 0' ⊢ °0◂0'
; _some %_3692 ⊢ %_3693 : %_3693
 ; {>  %_3692~°0◂0':_p801 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3693
 ; {>  %_3693~°0◂°0◂0':(_opn)◂(_p801) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3702
	btr r12,3
	jmp LB_3703
LB_3702:
	bts r12,3
LB_3703:
	mov rsi,1
	bt r12,3
	jc LB_3700
	mov rsi,0
	bt r9,0
	jc LB_3700
	jmp LB_3701
LB_3700:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3701:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3704:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3706
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3705
LB_3706:
	add rsp,8
	ret
LB_3707:
	add rsp,32
	pop r14
LB_3705:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3738
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3732
LB_3738:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3733
	btr r12,0
	jmp LB_3734
LB_3733:
	bts r12,0
LB_3734:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3729
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f857 %_3694 ⊢ %_3695 : %_3695
 ; {>  %_3694~0':_stg }
; _f857 0' ⊢ °1◂0'
; _some %_3695 ⊢ %_3696 : %_3696
 ; {>  %_3695~°1◂0':_p801 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3696
 ; {>  %_3696~°0◂°1◂0':(_opn)◂(_p801) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3727
	btr r12,3
	jmp LB_3728
LB_3727:
	bts r12,3
LB_3728:
	mov rsi,1
	bt r12,3
	jc LB_3725
	mov rsi,0
	bt r9,0
	jc LB_3725
	jmp LB_3726
LB_3725:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3726:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3729:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3731
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3730
LB_3731:
	add rsp,8
	ret
LB_3732:
	add rsp,16
	pop r14
LB_3730:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_3623_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3753
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3747
LB_3753:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3748
	btr r12,0
	jmp LB_3749
LB_3748:
	bts r12,0
LB_3749:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3744
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f858 %_3697 ⊢ %_3698 : %_3698
 ; {>  %_3697~0':_p735 }
; _f858 0' ⊢ °2◂0'
; _some %_3698 ⊢ %_3699 : %_3699
 ; {>  %_3698~°2◂0':_p801 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_3699
 ; {>  %_3699~°0◂°2◂0':(_opn)◂(_p801) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3742
	btr r12,3
	jmp LB_3743
LB_3742:
	bts r12,3
LB_3743:
	mov rsi,1
	bt r12,3
	jc LB_3740
	mov rsi,0
	bt r9,0
	jc LB_3740
	jmp LB_3741
LB_3740:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3741:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3744:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3746
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3745
LB_3746:
	add rsp,8
	ret
LB_3747:
	add rsp,16
	pop r14
LB_3745:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3756:
NS_E_RDI_3756:
NS_E_3756_ETR_TBL:
NS_E_3756_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_3763
LB_3762:
	add r14,1
LB_3763:
	cmp r14,r10
	jge LB_3764
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3762
	cmp al,32
	jz LB_3762
LB_3764:
	add r14,1
	cmp r14,r10
	jg LB_3767
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_3767
	jmp LB_3768
LB_3767:
	jmp LB_3758
LB_3768:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ "\n" ⟧
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov rsi,0x01_00_0000_0000_0001
	or rdi,rsi
LB_3773:
	jmp LB_3770
LB_3769:
	add r14,1
LB_3770:
	cmp r14,r10
	jge LB_3771
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3769
	cmp al,32
	jz LB_3769
LB_3771:
	add r14,1
	cmp r14,r10
	jg LB_3772
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_3772
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov [rax+8*1],rsi
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_3773
LB_3772:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3759
	btr QWORD [rdi],1
LB_3759:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3760
	btr QWORD [rdi],0
LB_3760:
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
LB_3758:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3783:
; 	|» { 0' 1' }
NS_E_RDI_3783:
MTC_LB_3784:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3785
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3786
	bt QWORD [rdi],0
	jc LB_3787
	btr r12,4
	jmp LB_3788
LB_3787:
	bts r12,4
LB_3788:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3786:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3791
	btr r12,5
	jmp LB_3792
LB_3791:
	bts r12,5
LB_3792:
	mov r8,r11
	bt r12,5
	jc LB_3789
	btr r12,2
	jmp LB_3790
LB_3789:
	bts r12,2
LB_3790:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3795
	btr r12,5
	jmp LB_3796
LB_3795:
	bts r12,5
LB_3796:
	mov r9,r11
	bt r12,5
	jc LB_3793
	btr r12,3
	jmp LB_3794
LB_3793:
	bts r12,3
LB_3794:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3797:
	cmp r15,0
	jz LB_3798
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3797
LB_3798:
; _f853 { %_3777 %_3779 } ⊢ %_3781 : %_3781
 ; {>  %_3777~0':_p800 %_3780~3':(_lst)◂(_p800) %_3779~2':_p800 }
; _f853 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f3783 { %_3781 %_3780 } ⊢ %_3782 : %_3782
 ; {>  %_3780~3':(_lst)◂(_p800) %_3781~°2◂{ 0' 2' }:_p800 }
; _f3783 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3799
	btr r12,1
	jmp LB_3800
LB_3799:
	bts r12,1
LB_3800:
	mov r9,r13
	bt r12,0
	jc LB_3801
	btr r12,3
	jmp LB_3802
LB_3801:
	bts r12,3
LB_3802:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_3807
	btr r12,4
	jmp LB_3808
LB_3807:
	bts r12,4
LB_3808:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_3805
	btr QWORD [rdi],0
	jmp LB_3806
LB_3805:
	bts QWORD [rdi],0
LB_3806:
	mov r10,r8
	bt r12,2
	jc LB_3811
	btr r12,4
	jmp LB_3812
LB_3811:
	bts r12,4
LB_3812:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_3809
	btr QWORD [rdi],1
	jmp LB_3810
LB_3809:
	bts QWORD [rdi],1
LB_3810:
	mov rsi,1
	bt r12,0
	jc LB_3803
	mov rsi,0
	bt r13,0
	jc LB_3803
	jmp LB_3804
LB_3803:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_3804:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	call NS_E_3783
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_3782
 ; {>  %_3782~0':_p800 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_3785:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3813
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_3814
	bt QWORD [rdi],0
	jc LB_3815
	btr r12,2
	jmp LB_3816
LB_3815:
	bts r12,2
LB_3816:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_3814:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3817:
	cmp r15,0
	jz LB_3818
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3817
LB_3818:
; ∎ %_3777
 ; {>  %_3777~0':_p800 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_3813:
NS_E_3819:
NS_E_RDI_3819:
NS_E_3819_ETR_TBL:
NS_E_3819_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_3866
LB_3865:
	add r14,1
LB_3866:
	cmp r14,r10
	jge LB_3867
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3865
	cmp al,10
	jz LB_3865
	cmp al,32
	jz LB_3865
LB_3867:
	add r14,1
	cmp r14,r10
	jg LB_3870
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_3870
	jmp LB_3871
LB_3870:
	jmp LB_3858
LB_3871:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_3873
LB_3872:
	add r14,1
LB_3873:
	cmp r14,r10
	jge LB_3874
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3872
	cmp al,10
	jz LB_3872
	cmp al,32
	jz LB_3872
LB_3874:
	push r10
	call NS_E_3820_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3875
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3876
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3876:
	jmp LB_3858
LB_3875:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_3879
LB_3878:
	add r14,1
LB_3879:
	cmp r14,r10
	jge LB_3880
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3878
	cmp al,10
	jz LB_3878
	cmp al,32
	jz LB_3878
LB_3880:
	add r14,1
	cmp r14,r10
	jg LB_3885
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_3885
	jmp LB_3886
LB_3885:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3882
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3882:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3883
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3883:
	jmp LB_3858
LB_3886:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3863
	btr r12,2
	jmp LB_3864
LB_3863:
	bts r12,2
LB_3864:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3861
	btr r12,1
	jmp LB_3862
LB_3861:
	bts r12,1
LB_3862:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3859
	btr r12,0
	jmp LB_3860
LB_3859:
	bts r12,0
LB_3860:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3855
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_3887
	btr r12,3
	jmp LB_3888
LB_3887:
	bts r12,3
LB_3888:
	mov r13,r14
	bt r12,1
	jc LB_3889
	btr r12,0
	jmp LB_3890
LB_3889:
	bts r12,0
LB_3890:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f847 %_3823 ⊢ %_3824 : %_3824
 ; {>  %_3823~0':(_lst)◂(_p798) }
; _f847 0' ⊢ °0◂0'
; _some %_3824 ⊢ %_3825 : %_3825
 ; {>  %_3824~°0◂0':_p798 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3825
 ; {>  %_3825~°0◂°0◂0':(_opn)◂(_p798) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3853
	btr r12,3
	jmp LB_3854
LB_3853:
	bts r12,3
LB_3854:
	mov rsi,1
	bt r12,3
	jc LB_3851
	mov rsi,0
	bt r9,0
	jc LB_3851
	jmp LB_3852
LB_3851:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3852:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3855:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3857
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3856
LB_3857:
	add rsp,8
	ret
LB_3858:
	add rsp,48
	pop r14
LB_3856:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; src
	jmp LB_3902
LB_3901:
	add r14,1
LB_3902:
	cmp r14,r10
	jge LB_3903
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3901
	cmp al,10
	jz LB_3901
	cmp al,32
	jz LB_3901
LB_3903:
	push r10
	call NS_E_3822_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3904
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3898
LB_3904:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3899
	btr r12,0
	jmp LB_3900
LB_3899:
	bts r12,0
LB_3900:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3895
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f848 %_3826 ⊢ %_3827 : %_3827
 ; {>  %_3826~0':_p796 }
; _f848 0' ⊢ °1◂0'
; _some %_3827 ⊢ %_3828 : %_3828
 ; {>  %_3827~°1◂0':_p798 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3828
 ; {>  %_3828~°0◂°1◂0':(_opn)◂(_p798) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3893
	btr r12,3
	jmp LB_3894
LB_3893:
	bts r12,3
LB_3894:
	mov rsi,1
	bt r12,3
	jc LB_3891
	mov rsi,0
	bt r9,0
	jc LB_3891
	jmp LB_3892
LB_3891:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3892:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3895:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3897
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3896
LB_3897:
	add rsp,8
	ret
LB_3898:
	add rsp,16
	pop r14
LB_3896:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3820:
NS_E_RDI_3820:
NS_E_3820_ETR_TBL:
NS_E_3820_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; src_ptn
	jmp LB_3925
LB_3924:
	add r14,1
LB_3925:
	cmp r14,r10
	jge LB_3926
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3924
	cmp al,10
	jz LB_3924
	cmp al,32
	jz LB_3924
LB_3926:
	push r10
	call NS_E_3819_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3927
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3919
LB_3927:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_3930
LB_3929:
	add r14,1
LB_3930:
	cmp r14,r10
	jge LB_3931
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3929
	cmp al,10
	jz LB_3929
	cmp al,32
	jz LB_3929
LB_3931:
	push r10
	call NS_E_3820_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3932
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3933
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3933:
	jmp LB_3919
LB_3932:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3922
	btr r12,1
	jmp LB_3923
LB_3922:
	bts r12,1
LB_3923:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3920
	btr r12,0
	jmp LB_3921
LB_3920:
	bts r12,0
LB_3921:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3916
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3829 %_3830 } ⊢ %_3831 : %_3831
 ; {>  %_3829~0':_p798 %_3830~1':(_lst)◂(_p798) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3831 ⊢ %_3832 : %_3832
 ; {>  %_3831~°0◂{ 0' 1' }:(_lst)◂(_p798) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3832
 ; {>  %_3832~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p798)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_3910
	btr r12,2
	jmp LB_3911
LB_3910:
	bts r12,2
LB_3911:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3908
	btr QWORD [rdi],0
	jmp LB_3909
LB_3908:
	bts QWORD [rdi],0
LB_3909:
	mov r8,r14
	bt r12,1
	jc LB_3914
	btr r12,2
	jmp LB_3915
LB_3914:
	bts r12,2
LB_3915:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3912
	btr QWORD [rdi],1
	jmp LB_3913
LB_3912:
	bts QWORD [rdi],1
LB_3913:
	mov rsi,1
	bt r12,3
	jc LB_3906
	mov rsi,0
	bt r9,0
	jc LB_3906
	jmp LB_3907
LB_3906:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3907:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3916:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3918
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3917
LB_3918:
	add rsp,8
	ret
LB_3919:
	add rsp,32
	pop r14
LB_3917:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_3937
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_3833 : %_3833
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3833 ⊢ %_3834 : %_3834
 ; {>  %_3833~°1◂{  }:(_lst)◂(t1621'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3834
 ; {>  %_3834~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1624'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_3935
	mov rsi,0
	bt r9,0
	jc LB_3935
	jmp LB_3936
LB_3935:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3936:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3937:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3939
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3938
LB_3939:
	add rsp,8
	ret
LB_3940:
	add rsp,0
	pop r14
LB_3938:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3821:
NS_E_RDI_3821:
NS_E_3821_ETR_TBL:
NS_E_3821_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_3978
LB_3977:
	add r14,1
LB_3978:
	cmp r14,r10
	jge LB_3979
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_3977
	cmp al,10
	jz LB_3977
	cmp al,32
	jz LB_3977
LB_3979:
	add r14,1
	cmp r14,r10
	jg LB_3982
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_3982
	jmp LB_3983
LB_3982:
	jmp LB_3956
LB_3983:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
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
	call NS_E_3822_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3967
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3968
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3968:
	jmp LB_3957
LB_3967:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
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
	push r10
	call NS_E_3821_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3973
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
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
	jmp LB_3957
LB_3973:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3962
	btr r12,2
	jmp LB_3963
LB_3962:
	bts r12,2
LB_3963:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3960
	btr r12,1
	jmp LB_3961
LB_3960:
	bts r12,1
LB_3961:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3958
	btr r12,0
	jmp LB_3959
LB_3958:
	bts r12,0
LB_3959:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3953
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_3984
	btr r12,3
	jmp LB_3985
LB_3984:
	bts r12,3
LB_3985:
	mov r14,r8
	bt r12,2
	jc LB_3986
	btr r12,1
	jmp LB_3987
LB_3986:
	bts r12,1
LB_3987:
	mov r8,r13
	bt r12,0
	jc LB_3988
	btr r12,2
	jmp LB_3989
LB_3988:
	bts r12,2
LB_3989:
	mov r13,r9
	bt r12,3
	jc LB_3990
	btr r12,0
	jmp LB_3991
LB_3990:
	bts r12,0
LB_3991:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f848 %_3835 ⊢ %_3837 : %_3837
 ; {>  %_3836~1':(_lst)◂(_p798) %_3835~0':_p796 }
; _f848 0' ⊢ °1◂0'
; _cns { %_3837 %_3836 } ⊢ %_3838 : %_3838
 ; {>  %_3837~°1◂0':_p798 %_3836~1':(_lst)◂(_p798) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_3838 ⊢ %_3839 : %_3839
 ; {>  %_3838~°0◂{ °1◂0' 1' }:(_lst)◂(_p798) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_3839
 ; {>  %_3839~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p798)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_3947
	btr r12,2
	jmp LB_3948
LB_3947:
	bts r12,2
LB_3948:
	mov rsi,1
	bt r12,2
	jc LB_3945
	mov rsi,0
	bt r8,0
	jc LB_3945
	jmp LB_3946
LB_3945:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_3946:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3943
	btr QWORD [rdi],0
	jmp LB_3944
LB_3943:
	bts QWORD [rdi],0
LB_3944:
	mov r8,r14
	bt r12,1
	jc LB_3951
	btr r12,2
	jmp LB_3952
LB_3951:
	bts r12,2
LB_3952:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3949
	btr QWORD [rdi],1
	jmp LB_3950
LB_3949:
	bts QWORD [rdi],1
LB_3950:
	mov rsi,1
	bt r12,3
	jc LB_3941
	mov rsi,0
	bt r9,0
	jc LB_3941
	jmp LB_3942
LB_3941:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3942:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3953:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3955
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3954
LB_3955:
	add rsp,8
	ret
LB_3957:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_3956:
	add rsp,48
	pop r14
LB_3954:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_3994
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_3840 : %_3840
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3840 ⊢ %_3841 : %_3841
 ; {>  %_3840~°1◂{  }:(_lst)◂(t1635'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3841
 ; {>  %_3841~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1638'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_3992
	mov rsi,0
	bt r9,0
	jc LB_3992
	jmp LB_3993
LB_3992:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3993:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3994:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3996
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_3995
LB_3996:
	add rsp,8
	ret
LB_3997:
	add rsp,0
	pop r14
LB_3995:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3822:
NS_E_RDI_3822:
NS_E_3822_ETR_TBL:
NS_E_3822_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
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
	add r14,2
	cmp r14,r10
	jg LB_4017
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_4017
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_4017
	jmp LB_4018
LB_4017:
	jmp LB_4005
LB_4018:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_4020
LB_4019:
	add r14,1
LB_4020:
	cmp r14,r10
	jge LB_4021
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4019
	cmp al,10
	jz LB_4019
	cmp al,32
	jz LB_4019
LB_4021:
	push r10
	call NS_E_3690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4022
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4023
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4023:
	jmp LB_4005
LB_4022:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_4026
LB_4025:
	add r14,1
LB_4026:
	cmp r14,r10
	jge LB_4027
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4025
	cmp al,10
	jz LB_4025
	cmp al,32
	jz LB_4025
LB_4027:
	add r14,1
	cmp r14,r10
	jg LB_4032
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_4032
	jmp LB_4033
LB_4032:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4029
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4029:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4030
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4030:
	jmp LB_4005
LB_4033:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4010
	btr r12,2
	jmp LB_4011
LB_4010:
	bts r12,2
LB_4011:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4008
	btr r12,1
	jmp LB_4009
LB_4008:
	bts r12,1
LB_4009:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4006
	btr r12,0
	jmp LB_4007
LB_4006:
	bts r12,0
LB_4007:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4002
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_4034
	btr r12,3
	jmp LB_4035
LB_4034:
	bts r12,3
LB_4035:
	mov r13,r14
	bt r12,1
	jc LB_4036
	btr r12,0
	jmp LB_4037
LB_4036:
	bts r12,0
LB_4037:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f843 %_3842 ⊢ %_3843 : %_3843
 ; {>  %_3842~0':_p801 }
; _f843 0' ⊢ °0◂0'
; _some %_3843 ⊢ %_3844 : %_3844
 ; {>  %_3843~°0◂0':_p796 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_3844
 ; {>  %_3844~°0◂°0◂0':(_opn)◂(_p796) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4000
	btr r12,3
	jmp LB_4001
LB_4000:
	bts r12,3
LB_4001:
	mov rsi,1
	bt r12,3
	jc LB_3998
	mov rsi,0
	bt r9,0
	jc LB_3998
	jmp LB_3999
LB_3998:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_3999:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4002:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4004
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4003
LB_4004:
	add rsp,8
	ret
LB_4005:
	add rsp,48
	pop r14
LB_4003:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_4062
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_4062
	jmp LB_4063
LB_4062:
	jmp LB_4045
LB_4063:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_689_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4054
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4055
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4055:
	jmp LB_4046
LB_4054:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4049
	btr r12,1
	jmp LB_4050
LB_4049:
	bts r12,1
LB_4050:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4047
	btr r12,0
	jmp LB_4048
LB_4047:
	bts r12,0
LB_4048:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4042
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_4064
	btr r12,2
	jmp LB_4065
LB_4064:
	bts r12,2
LB_4065:
	mov r13,r14
	bt r12,1
	jc LB_4066
	btr r12,0
	jmp LB_4067
LB_4066:
	bts r12,0
LB_4067:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f844 %_3845 ⊢ %_3846 : %_3846
 ; {>  %_3845~0':_stg }
; _f844 0' ⊢ °1◂0'
; _some %_3846 ⊢ %_3847 : %_3847
 ; {>  %_3846~°1◂0':_p796 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3847
 ; {>  %_3847~°0◂°1◂0':(_opn)◂(_p796) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4040
	btr r12,3
	jmp LB_4041
LB_4040:
	bts r12,3
LB_4041:
	mov rsi,1
	bt r12,3
	jc LB_4038
	mov rsi,0
	bt r9,0
	jc LB_4038
	jmp LB_4039
LB_4038:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4039:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4042:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4044
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4043
LB_4044:
	add rsp,8
	ret
LB_4046:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_4045:
	add rsp,32
	pop r14
LB_4043:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_4079
LB_4078:
	add r14,1
LB_4079:
	cmp r14,r10
	jge LB_4080
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4078
	cmp al,10
	jz LB_4078
	cmp al,32
	jz LB_4078
LB_4080:
	push r10
	call NS_E_689_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4081
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4075
LB_4081:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4076
	btr r12,0
	jmp LB_4077
LB_4076:
	bts r12,0
LB_4077:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4072
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f844 %_3848 ⊢ %_3849 : %_3849
 ; {>  %_3848~0':_stg }
; _f844 0' ⊢ °1◂0'
; _some %_3849 ⊢ %_3850 : %_3850
 ; {>  %_3849~°1◂0':_p796 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_3850
 ; {>  %_3850~°0◂°1◂0':(_opn)◂(_p796) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4070
	btr r12,3
	jmp LB_4071
LB_4070:
	bts r12,3
LB_4071:
	mov rsi,1
	bt r12,3
	jc LB_4068
	mov rsi,0
	bt r9,0
	jc LB_4068
	jmp LB_4069
LB_4068:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4069:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4072:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4074
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4073
LB_4074:
	add rsp,8
	ret
LB_4075:
	add rsp,16
	pop r14
LB_4073:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4083:
NS_E_RDI_4083:
NS_E_4083_ETR_TBL:
NS_E_4083_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_4133
LB_4132:
	add r14,1
LB_4133:
	cmp r14,r10
	jge LB_4134
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4132
	cmp al,10
	jz LB_4132
	cmp al,32
	jz LB_4132
LB_4134:
	add r14,1
	cmp r14,r10
	jg LB_4137
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_4137
	jmp LB_4138
LB_4137:
	jmp LB_4125
LB_4138:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_4140
LB_4139:
	add r14,1
LB_4140:
	cmp r14,r10
	jge LB_4141
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4139
	cmp al,10
	jz LB_4139
	cmp al,32
	jz LB_4139
LB_4141:
	push r10
	call NS_E_4084_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4142
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4143
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4143:
	jmp LB_4125
LB_4142:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_4146
LB_4145:
	add r14,1
LB_4146:
	cmp r14,r10
	jge LB_4147
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4145
	cmp al,10
	jz LB_4145
	cmp al,32
	jz LB_4145
LB_4147:
	add r14,1
	cmp r14,r10
	jg LB_4152
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_4152
	jmp LB_4153
LB_4152:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4149
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4149:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4150
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4150:
	jmp LB_4125
LB_4153:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4130
	btr r12,2
	jmp LB_4131
LB_4130:
	bts r12,2
LB_4131:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4128
	btr r12,1
	jmp LB_4129
LB_4128:
	bts r12,1
LB_4129:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4126
	btr r12,0
	jmp LB_4127
LB_4126:
	bts r12,0
LB_4127:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4122
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_4154
	btr r12,3
	jmp LB_4155
LB_4154:
	bts r12,3
LB_4155:
	mov r13,r14
	bt r12,1
	jc LB_4156
	btr r12,0
	jmp LB_4157
LB_4156:
	bts r12,0
LB_4157:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f849 %_4089 ⊢ %_4090 : %_4090
 ; {>  %_4089~0':(_lst)◂(_p799) }
; _f849 0' ⊢ °0◂0'
; _some %_4090 ⊢ %_4091 : %_4091
 ; {>  %_4090~°0◂0':_p799 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4091
 ; {>  %_4091~°0◂°0◂0':(_opn)◂(_p799) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4120
	btr r12,3
	jmp LB_4121
LB_4120:
	bts r12,3
LB_4121:
	mov rsi,1
	bt r12,3
	jc LB_4118
	mov rsi,0
	bt r9,0
	jc LB_4118
	jmp LB_4119
LB_4118:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4119:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4122:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4124
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4123
LB_4124:
	add rsp,8
	ret
LB_4125:
	add rsp,48
	pop r14
LB_4123:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dst
	jmp LB_4169
LB_4168:
	add r14,1
LB_4169:
	cmp r14,r10
	jge LB_4170
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4168
	cmp al,10
	jz LB_4168
	cmp al,32
	jz LB_4168
LB_4170:
	push r10
	call NS_E_4088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4171
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4165
LB_4171:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4166
	btr r12,0
	jmp LB_4167
LB_4166:
	bts r12,0
LB_4167:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4162
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f850 %_4092 ⊢ %_4093 : %_4093
 ; {>  %_4092~0':_p797 }
; _f850 0' ⊢ °1◂0'
; _some %_4093 ⊢ %_4094 : %_4094
 ; {>  %_4093~°1◂0':_p799 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4094
 ; {>  %_4094~°0◂°1◂0':(_opn)◂(_p799) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4160
	btr r12,3
	jmp LB_4161
LB_4160:
	bts r12,3
LB_4161:
	mov rsi,1
	bt r12,3
	jc LB_4158
	mov rsi,0
	bt r9,0
	jc LB_4158
	jmp LB_4159
LB_4158:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4159:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4162:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4164
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4163
LB_4164:
	add rsp,8
	ret
LB_4165:
	add rsp,16
	pop r14
LB_4163:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4084:
NS_E_RDI_4084:
NS_E_4084_ETR_TBL:
NS_E_4084_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_4192
LB_4191:
	add r14,1
LB_4192:
	cmp r14,r10
	jge LB_4193
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4191
	cmp al,10
	jz LB_4191
	cmp al,32
	jz LB_4191
LB_4193:
	push r10
	call NS_E_4083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4194
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4186
LB_4194:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_4197
LB_4196:
	add r14,1
LB_4197:
	cmp r14,r10
	jge LB_4198
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4196
	cmp al,10
	jz LB_4196
	cmp al,32
	jz LB_4196
LB_4198:
	push r10
	call NS_E_4084_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4199
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4200
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4200:
	jmp LB_4186
LB_4199:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4189
	btr r12,1
	jmp LB_4190
LB_4189:
	bts r12,1
LB_4190:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4187
	btr r12,0
	jmp LB_4188
LB_4187:
	bts r12,0
LB_4188:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4183
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_4095 %_4096 } ⊢ %_4097 : %_4097
 ; {>  %_4096~1':(_lst)◂(_p799) %_4095~0':_p799 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4097 ⊢ %_4098 : %_4098
 ; {>  %_4097~°0◂{ 0' 1' }:(_lst)◂(_p799) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4098
 ; {>  %_4098~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p799)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_4177
	btr r12,2
	jmp LB_4178
LB_4177:
	bts r12,2
LB_4178:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4175
	btr QWORD [rdi],0
	jmp LB_4176
LB_4175:
	bts QWORD [rdi],0
LB_4176:
	mov r8,r14
	bt r12,1
	jc LB_4181
	btr r12,2
	jmp LB_4182
LB_4181:
	bts r12,2
LB_4182:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4179
	btr QWORD [rdi],1
	jmp LB_4180
LB_4179:
	bts QWORD [rdi],1
LB_4180:
	mov rsi,1
	bt r12,3
	jc LB_4173
	mov rsi,0
	bt r9,0
	jc LB_4173
	jmp LB_4174
LB_4173:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4174:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4183:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4185
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4184
LB_4185:
	add rsp,8
	ret
LB_4186:
	add rsp,32
	pop r14
LB_4184:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4204
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_4099 : %_4099
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4099 ⊢ %_4100 : %_4100
 ; {>  %_4099~°1◂{  }:(_lst)◂(t1723'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4100
 ; {>  %_4100~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1726'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_4202
	mov rsi,0
	bt r9,0
	jc LB_4202
	jmp LB_4203
LB_4202:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4203:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4204:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4206
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4205
LB_4206:
	add rsp,8
	ret
LB_4207:
	add rsp,0
	pop r14
LB_4205:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4086:
NS_E_RDI_4086:
NS_E_4086_ETR_TBL:
NS_E_4086_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_4230
LB_4229:
	add r14,1
LB_4230:
	cmp r14,r10
	jge LB_4231
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4229
	cmp al,10
	jz LB_4229
	cmp al,32
	jz LB_4229
LB_4231:
	add r14,1
	cmp r14,r10
	jg LB_4234
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_4234
	jmp LB_4235
LB_4234:
	jmp LB_4208
LB_4235:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_4217
LB_4216:
	add r14,1
LB_4217:
	cmp r14,r10
	jge LB_4218
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4216
	cmp al,10
	jz LB_4216
	cmp al,32
	jz LB_4216
LB_4218:
	push r10
	call NS_E_4083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4219
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4220
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4220:
	jmp LB_4209
LB_4219:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_4223
LB_4222:
	add r14,1
LB_4223:
	cmp r14,r10
	jge LB_4224
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4222
	cmp al,10
	jz LB_4222
	cmp al,32
	jz LB_4222
LB_4224:
	push r10
	call NS_E_4086_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4225
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4226
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4226:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4227
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4227:
	jmp LB_4209
LB_4225:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4212
	btr QWORD [rdi],2
LB_4212:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4213
	btr QWORD [rdi],1
LB_4213:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4214
	btr QWORD [rdi],0
LB_4214:
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
LB_4209:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_4208:
	add rsp,48
	pop r14
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,[rdi]
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
LB_4210:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4087:
NS_E_RDI_4087:
NS_E_4087_ETR_TBL:
NS_E_4087_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_4273
LB_4272:
	add r14,1
LB_4273:
	cmp r14,r10
	jge LB_4274
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4272
	cmp al,10
	jz LB_4272
	cmp al,32
	jz LB_4272
LB_4274:
	add r14,1
	cmp r14,r10
	jg LB_4277
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_4277
	jmp LB_4278
LB_4277:
	jmp LB_4251
LB_4278:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_4260
LB_4259:
	add r14,1
LB_4260:
	cmp r14,r10
	jge LB_4261
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4259
	cmp al,10
	jz LB_4259
	cmp al,32
	jz LB_4259
LB_4261:
	push r10
	call NS_E_4088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4262
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4263
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4263:
	jmp LB_4252
LB_4262:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_4266
LB_4265:
	add r14,1
LB_4266:
	cmp r14,r10
	jge LB_4267
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4265
	cmp al,10
	jz LB_4265
	cmp al,32
	jz LB_4265
LB_4267:
	push r10
	call NS_E_4087_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4268
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4269
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4269:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4270
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4270:
	jmp LB_4252
LB_4268:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4257
	btr r12,2
	jmp LB_4258
LB_4257:
	bts r12,2
LB_4258:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4255
	btr r12,1
	jmp LB_4256
LB_4255:
	bts r12,1
LB_4256:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4253
	btr r12,0
	jmp LB_4254
LB_4253:
	bts r12,0
LB_4254:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4248
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_4279
	btr r12,3
	jmp LB_4280
LB_4279:
	bts r12,3
LB_4280:
	mov r14,r8
	bt r12,2
	jc LB_4281
	btr r12,1
	jmp LB_4282
LB_4281:
	bts r12,1
LB_4282:
	mov r8,r13
	bt r12,0
	jc LB_4283
	btr r12,2
	jmp LB_4284
LB_4283:
	bts r12,2
LB_4284:
	mov r13,r9
	bt r12,3
	jc LB_4285
	btr r12,0
	jmp LB_4286
LB_4285:
	bts r12,0
LB_4286:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f850 %_4103 ⊢ %_4105 : %_4105
 ; {>  %_4104~1':(_lst)◂(_p799) %_4103~0':_p797 }
; _f850 0' ⊢ °1◂0'
; _cns { %_4105 %_4104 } ⊢ %_4106 : %_4106
 ; {>  %_4105~°1◂0':_p799 %_4104~1':(_lst)◂(_p799) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_4106 ⊢ %_4107 : %_4107
 ; {>  %_4106~°0◂{ °1◂0' 1' }:(_lst)◂(_p799) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_4107
 ; {>  %_4107~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p799)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_4242
	btr r12,2
	jmp LB_4243
LB_4242:
	bts r12,2
LB_4243:
	mov rsi,1
	bt r12,2
	jc LB_4240
	mov rsi,0
	bt r8,0
	jc LB_4240
	jmp LB_4241
LB_4240:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_4241:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4238
	btr QWORD [rdi],0
	jmp LB_4239
LB_4238:
	bts QWORD [rdi],0
LB_4239:
	mov r8,r14
	bt r12,1
	jc LB_4246
	btr r12,2
	jmp LB_4247
LB_4246:
	bts r12,2
LB_4247:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4244
	btr QWORD [rdi],1
	jmp LB_4245
LB_4244:
	bts QWORD [rdi],1
LB_4245:
	mov rsi,1
	bt r12,3
	jc LB_4236
	mov rsi,0
	bt r9,0
	jc LB_4236
	jmp LB_4237
LB_4236:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4237:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4248:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4250
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4249
LB_4250:
	add rsp,8
	ret
LB_4252:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_4251:
	add rsp,48
	pop r14
LB_4249:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4289
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_4108 : %_4108
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4108 ⊢ %_4109 : %_4109
 ; {>  %_4108~°1◂{  }:(_lst)◂(t1737'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4109
 ; {>  %_4109~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1740'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_4287
	mov rsi,0
	bt r9,0
	jc LB_4287
	jmp LB_4288
LB_4287:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4288:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4289:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4291
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4290
LB_4291:
	add rsp,8
	ret
LB_4292:
	add rsp,0
	pop r14
LB_4290:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4088:
NS_E_RDI_4088:
NS_E_4088_ETR_TBL:
NS_E_4088_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_4317
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_4317
	jmp LB_4318
LB_4317:
	jmp LB_4300
LB_4318:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4309
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4310
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4310:
	jmp LB_4301
LB_4309:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4304
	btr r12,1
	jmp LB_4305
LB_4304:
	bts r12,1
LB_4305:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4302
	btr r12,0
	jmp LB_4303
LB_4302:
	bts r12,0
LB_4303:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4297
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_4319
	btr r12,2
	jmp LB_4320
LB_4319:
	bts r12,2
LB_4320:
	mov r13,r14
	bt r12,1
	jc LB_4321
	btr r12,0
	jmp LB_4322
LB_4321:
	bts r12,0
LB_4322:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f846 %_4110 ⊢ %_4111 : %_4111
 ; {>  %_4110~0':_stg }
; _f846 0' ⊢ °1◂0'
; _some %_4111 ⊢ %_4112 : %_4112
 ; {>  %_4111~°1◂0':_p797 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4112
 ; {>  %_4112~°0◂°1◂0':(_opn)◂(_p797) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4295
	btr r12,3
	jmp LB_4296
LB_4295:
	bts r12,3
LB_4296:
	mov rsi,1
	bt r12,3
	jc LB_4293
	mov rsi,0
	bt r9,0
	jc LB_4293
	jmp LB_4294
LB_4293:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4294:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4297:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4299
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4298
LB_4299:
	add rsp,8
	ret
LB_4301:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_4300:
	add rsp,32
	pop r14
LB_4298:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4336
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4330
LB_4336:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4331
	btr r12,0
	jmp LB_4332
LB_4331:
	bts r12,0
LB_4332:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4327
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f846 %_4113 ⊢ %_4114 : %_4114
 ; {>  %_4113~0':_stg }
; _f846 0' ⊢ °1◂0'
; _some %_4114 ⊢ %_4115 : %_4115
 ; {>  %_4114~°1◂0':_p797 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4115
 ; {>  %_4115~°0◂°1◂0':(_opn)◂(_p797) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4325
	btr r12,3
	jmp LB_4326
LB_4325:
	bts r12,3
LB_4326:
	mov rsi,1
	bt r12,3
	jc LB_4323
	mov rsi,0
	bt r9,0
	jc LB_4323
	jmp LB_4324
LB_4323:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4324:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4327:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4329
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4328
LB_4329:
	add rsp,8
	ret
LB_4330:
	add rsp,16
	pop r14
LB_4328:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_4351
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_4351
	jmp LB_4352
LB_4351:
	jmp LB_4343
LB_4352:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4344
	btr r12,0
	jmp LB_4345
LB_4344:
	bts r12,0
LB_4345:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4340
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f845 {  } ⊢ %_4116 : %_4116
 ; {>  }
; _f845 {  } ⊢ °0◂{  }
; _some %_4116 ⊢ %_4117 : %_4117
 ; {>  %_4116~°0◂{  }:_p797 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_4117
 ; {>  %_4117~°0◂°0◂{  }:(_opn)◂(_p797) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_4338
	mov rsi,0
	bt r9,0
	jc LB_4338
	jmp LB_4339
LB_4338:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4339:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4340:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4342
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4341
LB_4342:
	add rsp,8
	ret
LB_4343:
	add rsp,16
	pop r14
LB_4341:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4353:
NS_E_RDI_4353:
NS_E_4353_ETR_TBL:
NS_E_4353_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; type_atm
	jmp LB_4431
LB_4430:
	add r14,1
LB_4431:
	cmp r14,r10
	jge LB_4432
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4430
	cmp al,10
	jz LB_4430
	cmp al,32
	jz LB_4430
LB_4432:
	push r10
	call NS_E_4356_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4433
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4423
LB_4433:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_4436
LB_4435:
	add r14,1
LB_4436:
	cmp r14,r10
	jge LB_4437
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4435
	cmp al,10
	jz LB_4435
	cmp al,32
	jz LB_4435
LB_4437:
	push r10
	call NS_E_4355_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4438
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4439
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4439:
	jmp LB_4423
LB_4438:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_4442
LB_4441:
	add r14,1
LB_4442:
	cmp r14,r10
	jge LB_4443
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4441
	cmp al,10
	jz LB_4441
	cmp al,32
	jz LB_4441
LB_4443:
	push r10
	call NS_E_4354_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4444
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4445
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4445:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4446
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4446:
	jmp LB_4423
LB_4444:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4428
	btr r12,2
	jmp LB_4429
LB_4428:
	bts r12,2
LB_4429:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4426
	btr r12,1
	jmp LB_4427
LB_4426:
	bts r12,1
LB_4427:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4424
	btr r12,0
	jmp LB_4425
LB_4424:
	bts r12,0
LB_4425:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4420
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; _f3783 { %_4358 %_4359 } ⊢ %_4361 : %_4361
 ; {>  %_4360~2':(_opn)◂(_p800) %_4358~0':_p800 %_4359~1':(_lst)◂(_p800) }
; _f3783 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_3783
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_4391
	btr r12,2
	jmp LB_4392
LB_4391:
	bts r12,2
LB_4392:
	add rsp,16
MTC_LB_4393:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4394
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °0◂1'
; 2' ⊢ °0◂1'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_4395
	bt QWORD [rdi],0
	jc LB_4396
	btr r12,3
	jmp LB_4397
LB_4396:
	bts r12,3
LB_4397:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4395:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_4398
	btr r12,1
	jmp LB_4399
LB_4398:
	bts r12,1
LB_4399:
LB_4400:
	cmp r15,0
	jz LB_4401
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4400
LB_4401:
; _f852 { %_4361 %_4362 } ⊢ %_4363 : %_4363
 ; {>  %_4362~1':_p800 %_4361~0':_p800 }
; _f852 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_4363 ⊢ %_4364 : %_4364
 ; {>  %_4363~°1◂{ 0' 1' }:_p800 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_4364
 ; {>  %_4364~°0◂°1◂{ 0' 1' }:(_opn)◂(_p800) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_4406
	btr r12,2
	jmp LB_4407
LB_4406:
	bts r12,2
LB_4407:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4404
	btr QWORD [rdi],0
	jmp LB_4405
LB_4404:
	bts QWORD [rdi],0
LB_4405:
	mov r8,r14
	bt r12,1
	jc LB_4410
	btr r12,2
	jmp LB_4411
LB_4410:
	bts r12,2
LB_4411:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4408
	btr QWORD [rdi],1
	jmp LB_4409
LB_4408:
	bts QWORD [rdi],1
LB_4409:
	mov rsi,1
	bt r12,3
	jc LB_4402
	mov rsi,0
	bt r9,0
	jc LB_4402
	jmp LB_4403
LB_4402:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4403:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_4394:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4412
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_4413
	bt QWORD [rdi],0
	jc LB_4414
	btr r12,1
	jmp LB_4415
LB_4414:
	bts r12,1
LB_4415:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_4413:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4416:
	cmp r15,0
	jz LB_4417
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4416
LB_4417:
; _some %_4361 ⊢ %_4365 : %_4365
 ; {>  %_4361~0':_p800 }
; _some 0' ⊢ °0◂0'
; ∎ %_4365
 ; {>  %_4365~°0◂0':(_opn)◂(_p800) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4418
	btr r12,3
	jmp LB_4419
LB_4418:
	bts r12,3
LB_4419:
	mov r8,0
	bts r12,2
	ret
MTC_LB_4412:
LB_4420:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4422
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4421
LB_4422:
	add rsp,8
	ret
LB_4423:
	add rsp,48
	pop r14
LB_4421:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4354:
NS_E_RDI_4354:
NS_E_4354_ETR_TBL:
NS_E_4354_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_4461
LB_4460:
	add r14,1
LB_4461:
	cmp r14,r10
	jge LB_4462
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4460
	cmp al,10
	jz LB_4460
	cmp al,32
	jz LB_4460
LB_4462:
	add r14,3
	cmp r14,r10
	jg LB_4465
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_4465
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_4465
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_4465
	jmp LB_4466
LB_4465:
	jmp LB_4455
LB_4466:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_4468
LB_4467:
	add r14,1
LB_4468:
	cmp r14,r10
	jge LB_4469
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4467
	cmp al,10
	jz LB_4467
	cmp al,32
	jz LB_4467
LB_4469:
	push r10
	call NS_E_4353_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4470
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4471
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4471:
	jmp LB_4455
LB_4470:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4458
	btr r12,1
	jmp LB_4459
LB_4458:
	bts r12,1
LB_4459:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4456
	btr r12,0
	jmp LB_4457
LB_4456:
	bts r12,0
LB_4457:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4452
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_4473
	btr r12,2
	jmp LB_4474
LB_4473:
	bts r12,2
LB_4474:
	mov r13,r14
	bt r12,1
	jc LB_4475
	btr r12,0
	jmp LB_4476
LB_4475:
	bts r12,0
LB_4476:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_4366 ⊢ %_4367 : %_4367
 ; {>  %_4366~0':_p800 }
; _some 0' ⊢ °0◂0'
; _some %_4367 ⊢ %_4368 : %_4368
 ; {>  %_4367~°0◂0':(_opn)◂(_p800) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4368
 ; {>  %_4368~°0◂°0◂0':(_opn)◂((_opn)◂(_p800)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4450
	btr r12,3
	jmp LB_4451
LB_4450:
	bts r12,3
LB_4451:
	mov rsi,1
	bt r12,3
	jc LB_4448
	mov rsi,0
	bt r9,0
	jc LB_4448
	jmp LB_4449
LB_4448:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4449:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4452:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4454
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4453
LB_4454:
	add rsp,8
	ret
LB_4455:
	add rsp,32
	pop r14
LB_4453:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4479
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_4369 : %_4369
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_4369 ⊢ %_4370 : %_4370
 ; {>  %_4369~°1◂{  }:(_opn)◂(t1831'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4370
 ; {>  %_4370~°0◂°1◂{  }:(_opn)◂((_opn)◂(t1834'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_4477
	mov rsi,0
	bt r9,0
	jc LB_4477
	jmp LB_4478
LB_4477:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4478:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4479:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4481
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4480
LB_4481:
	add rsp,8
	ret
LB_4482:
	add rsp,0
	pop r14
LB_4480:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4355:
NS_E_RDI_4355:
NS_E_4355_ETR_TBL:
NS_E_4355_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_4504
LB_4503:
	add r14,1
LB_4504:
	cmp r14,r10
	jge LB_4505
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4503
	cmp al,10
	jz LB_4503
	cmp al,32
	jz LB_4503
LB_4505:
	add r14,3
	cmp r14,r10
	jg LB_4508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_4508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_4508
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_4508
	jmp LB_4509
LB_4508:
	jmp LB_4496
LB_4509:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_4511
LB_4510:
	add r14,1
LB_4511:
	cmp r14,r10
	jge LB_4512
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4510
	cmp al,10
	jz LB_4510
	cmp al,32
	jz LB_4510
LB_4512:
	push r10
	call NS_E_4356_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4513
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4514
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4514:
	jmp LB_4496
LB_4513:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_4517
LB_4516:
	add r14,1
LB_4517:
	cmp r14,r10
	jge LB_4518
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4516
	cmp al,10
	jz LB_4516
	cmp al,32
	jz LB_4516
LB_4518:
	push r10
	call NS_E_4355_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4519
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4520
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4520:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4521
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4521:
	jmp LB_4496
LB_4519:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4501
	btr r12,2
	jmp LB_4502
LB_4501:
	bts r12,2
LB_4502:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4499
	btr r12,1
	jmp LB_4500
LB_4499:
	bts r12,1
LB_4500:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4497
	btr r12,0
	jmp LB_4498
LB_4497:
	bts r12,0
LB_4498:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4493
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_4523
	btr r12,3
	jmp LB_4524
LB_4523:
	bts r12,3
LB_4524:
	mov r14,r8
	bt r12,2
	jc LB_4525
	btr r12,1
	jmp LB_4526
LB_4525:
	bts r12,1
LB_4526:
	mov r8,r13
	bt r12,0
	jc LB_4527
	btr r12,2
	jmp LB_4528
LB_4527:
	bts r12,2
LB_4528:
	mov r13,r9
	bt r12,3
	jc LB_4529
	btr r12,0
	jmp LB_4530
LB_4529:
	bts r12,0
LB_4530:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_4371 %_4372 } ⊢ %_4373 : %_4373
 ; {>  %_4372~1':(_lst)◂(_p800) %_4371~0':_p800 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4373 ⊢ %_4374 : %_4374
 ; {>  %_4373~°0◂{ 0' 1' }:(_lst)◂(_p800) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4374
 ; {>  %_4374~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p800)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_4487
	btr r12,2
	jmp LB_4488
LB_4487:
	bts r12,2
LB_4488:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4485
	btr QWORD [rdi],0
	jmp LB_4486
LB_4485:
	bts QWORD [rdi],0
LB_4486:
	mov r8,r14
	bt r12,1
	jc LB_4491
	btr r12,2
	jmp LB_4492
LB_4491:
	bts r12,2
LB_4492:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4489
	btr QWORD [rdi],1
	jmp LB_4490
LB_4489:
	bts QWORD [rdi],1
LB_4490:
	mov rsi,1
	bt r12,3
	jc LB_4483
	mov rsi,0
	bt r9,0
	jc LB_4483
	jmp LB_4484
LB_4483:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4484:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4493:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4495
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4494
LB_4495:
	add rsp,8
	ret
LB_4496:
	add rsp,48
	pop r14
LB_4494:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4533
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_4375 : %_4375
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4375 ⊢ %_4376 : %_4376
 ; {>  %_4375~°1◂{  }:(_lst)◂(t1844'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4376
 ; {>  %_4376~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1847'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_4531
	mov rsi,0
	bt r9,0
	jc LB_4531
	jmp LB_4532
LB_4531:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4532:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4533:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4535
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4534
LB_4535:
	add rsp,8
	ret
LB_4536:
	add rsp,0
	pop r14
LB_4534:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4356:
NS_E_RDI_4356:
NS_E_4356_ETR_TBL:
NS_E_4356_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_4552
LB_4551:
	add r14,1
LB_4552:
	cmp r14,r10
	jge LB_4553
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4551
	cmp al,10
	jz LB_4551
	cmp al,32
	jz LB_4551
LB_4553:
	add r14,1
	cmp r14,r10
	jg LB_4556
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_4556
	jmp LB_4557
LB_4556:
	jmp LB_4544
LB_4557:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ type ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_4562:
	jmp LB_4559
LB_4558:
	add r14,1
LB_4559:
	cmp r14,r10
	jge LB_4560
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4558
	cmp al,10
	jz LB_4558
	cmp al,32
	jz LB_4558
LB_4560:
	push r10
	push rsi
	call NS_E_4353_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_4561
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_4563
	bts QWORD [rax],0
LB_4563:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_4562
LB_4561:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_4565
LB_4564:
	add r14,1
LB_4565:
	cmp r14,r10
	jge LB_4566
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4564
	cmp al,10
	jz LB_4564
	cmp al,32
	jz LB_4564
LB_4566:
	add r14,1
	cmp r14,r10
	jg LB_4571
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_4571
	jmp LB_4572
LB_4571:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4568
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4568:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4569
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4569:
	jmp LB_4544
LB_4572:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4549
	btr r12,2
	jmp LB_4550
LB_4549:
	bts r12,2
LB_4550:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4547
	btr r12,1
	jmp LB_4548
LB_4547:
	bts r12,1
LB_4548:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4545
	btr r12,0
	jmp LB_4546
LB_4545:
	bts r12,0
LB_4546:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4541
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_4573
	btr r12,3
	jmp LB_4574
LB_4573:
	bts r12,3
LB_4574:
	mov r13,r14
	bt r12,1
	jc LB_4575
	btr r12,0
	jmp LB_4576
LB_4575:
	bts r12,0
LB_4576:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f121 %_4377 ⊢ %_4378 : %_4378
 ; {>  %_4377~0':(_lst)◂(_p800) }
; _f121 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_121
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f851 %_4378 ⊢ %_4379 : %_4379
 ; {>  %_4378~0':(_lst)◂(_p800) }
; _f851 0' ⊢ °0◂0'
; _some %_4379 ⊢ %_4380 : %_4380
 ; {>  %_4379~°0◂0':_p800 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4380
 ; {>  %_4380~°0◂°0◂0':(_opn)◂(_p800) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4539
	btr r12,3
	jmp LB_4540
LB_4539:
	bts r12,3
LB_4540:
	mov rsi,1
	bt r12,3
	jc LB_4537
	mov rsi,0
	bt r9,0
	jc LB_4537
	jmp LB_4538
LB_4537:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4538:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4541:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4543
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4542
LB_4543:
	add rsp,8
	ret
LB_4544:
	add rsp,48
	pop r14
LB_4542:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "("
	jmp LB_4590
LB_4589:
	add r14,1
LB_4590:
	cmp r14,r10
	jge LB_4591
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4589
	cmp al,10
	jz LB_4589
	cmp al,32
	jz LB_4589
LB_4591:
	add r14,1
	cmp r14,r10
	jg LB_4594
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_4594
	jmp LB_4595
LB_4594:
	jmp LB_4582
LB_4595:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_4597
LB_4596:
	add r14,1
LB_4597:
	cmp r14,r10
	jge LB_4598
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4596
	cmp al,10
	jz LB_4596
	cmp al,32
	jz LB_4596
LB_4598:
	push r10
	call NS_E_4353_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4599
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4600
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4600:
	jmp LB_4582
LB_4599:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_4603
LB_4602:
	add r14,1
LB_4603:
	cmp r14,r10
	jge LB_4604
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4602
	cmp al,10
	jz LB_4602
	cmp al,32
	jz LB_4602
LB_4604:
	add r14,1
	cmp r14,r10
	jg LB_4609
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_4609
	jmp LB_4610
LB_4609:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4606
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4606:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4607
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4607:
	jmp LB_4582
LB_4610:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4587
	btr r12,2
	jmp LB_4588
LB_4587:
	bts r12,2
LB_4588:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4585
	btr r12,1
	jmp LB_4586
LB_4585:
	bts r12,1
LB_4586:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4583
	btr r12,0
	jmp LB_4584
LB_4583:
	bts r12,0
LB_4584:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4579
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_4611
	btr r12,3
	jmp LB_4612
LB_4611:
	bts r12,3
LB_4612:
	mov r13,r14
	bt r12,1
	jc LB_4613
	btr r12,0
	jmp LB_4614
LB_4613:
	bts r12,0
LB_4614:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_4381 ⊢ %_4382 : %_4382
 ; {>  %_4381~0':_p800 }
; _some 0' ⊢ °0◂0'
; ∎ %_4382
 ; {>  %_4382~°0◂0':(_opn)◂(_p800) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4577
	btr r12,3
	jmp LB_4578
LB_4577:
	bts r12,3
LB_4578:
	mov r8,0
	bts r12,2
	ret
LB_4579:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4581
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4580
LB_4581:
	add rsp,8
	ret
LB_4582:
	add rsp,48
	pop r14
LB_4580:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; var
	jmp LB_4626
LB_4625:
	add r14,1
LB_4626:
	cmp r14,r10
	jge LB_4627
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4625
	cmp al,10
	jz LB_4625
	cmp al,32
	jz LB_4625
LB_4627:
	push r10
	call NS_E_4357_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4628
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4622
LB_4628:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4623
	btr r12,0
	jmp LB_4624
LB_4623:
	bts r12,0
LB_4624:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4619
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f855 %_4383 ⊢ %_4384 : %_4384
 ; {>  %_4383~0':_stg }
; _f855 0' ⊢ °4◂0'
; _some %_4384 ⊢ %_4385 : %_4385
 ; {>  %_4384~°4◂0':_p800 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_4385
 ; {>  %_4385~°0◂°4◂0':(_opn)◂(_p800) }
; 	∎ °0◂°4◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4617
	btr r12,3
	jmp LB_4618
LB_4617:
	bts r12,3
LB_4618:
	mov rsi,1
	bt r12,3
	jc LB_4615
	mov rsi,0
	bt r9,0
	jc LB_4615
	jmp LB_4616
LB_4615:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4616:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4619:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4621
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4620
LB_4621:
	add rsp,8
	ret
LB_4622:
	add rsp,16
	pop r14
LB_4620:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_4641
LB_4640:
	add r14,1
LB_4641:
	cmp r14,r10
	jge LB_4642
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4640
	cmp al,10
	jz LB_4640
	cmp al,32
	jz LB_4640
LB_4642:
	push r10
	call NS_E_3623_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4643
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4637
LB_4643:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4638
	btr r12,0
	jmp LB_4639
LB_4638:
	bts r12,0
LB_4639:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4634
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f854 %_4386 ⊢ %_4387 : %_4387
 ; {>  %_4386~0':_p735 }
; _f854 0' ⊢ °3◂0'
; _some %_4387 ⊢ %_4388 : %_4388
 ; {>  %_4387~°3◂0':_p800 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_4388
 ; {>  %_4388~°0◂°3◂0':(_opn)◂(_p800) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4632
	btr r12,3
	jmp LB_4633
LB_4632:
	bts r12,3
LB_4633:
	mov rsi,1
	bt r12,3
	jc LB_4630
	mov rsi,0
	bt r9,0
	jc LB_4630
	jmp LB_4631
LB_4630:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_4631:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4634:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4636
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4635
LB_4636:
	add rsp,8
	ret
LB_4637:
	add rsp,16
	pop r14
LB_4635:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4357:
NS_E_RDI_4357:
NS_E_4357_ETR_TBL:
NS_E_4357_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4658
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4650
LB_4658:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_4666
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_4666
	jmp LB_4667
LB_4666:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4664
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4664:
	jmp LB_4650
LB_4667:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4653
	btr r12,1
	jmp LB_4654
LB_4653:
	bts r12,1
LB_4654:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4651
	btr r12,0
	jmp LB_4652
LB_4651:
	bts r12,0
LB_4652:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4647
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_4389 ⊢ %_4390 : %_4390
 ; {>  %_4389~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_4390
 ; {>  %_4390~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4645
	btr r12,3
	jmp LB_4646
LB_4645:
	bts r12,3
LB_4646:
	mov r8,0
	bts r12,2
	ret
LB_4647:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4649
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_4648
LB_4649:
	add rsp,8
	ret
LB_4650:
	add rsp,32
	pop r14
LB_4648:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4668:
NS_E_RDI_4668:
NS_E_4668_ETR_TBL:
NS_E_4668_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_5083
LB_5082:
	add r14,1
LB_5083:
	cmp r14,r10
	jge LB_5084
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5082
	cmp al,10
	jz LB_5082
	cmp al,32
	jz LB_5082
LB_5084:
	push r10
	call NS_E_4669_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5085
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5077
LB_5085:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; file
	jmp LB_5088
LB_5087:
	add r14,1
LB_5088:
	cmp r14,r10
	jge LB_5089
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5087
	cmp al,10
	jz LB_5087
	cmp al,32
	jz LB_5087
LB_5089:
	push r10
	call NS_E_4668_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5090
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5091
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5091:
	jmp LB_5077
LB_5090:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5080
	btr r12,1
	jmp LB_5081
LB_5080:
	bts r12,1
LB_5081:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5078
	btr r12,0
	jmp LB_5079
LB_5078:
	bts r12,0
LB_5079:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5074
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_4709 %_4710 } ⊢ %_4711 : %_4711
 ; {>  %_4710~1':(_lst)◂(_p783) %_4709~0':_p783 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4711 ⊢ %_4712 : %_4712
 ; {>  %_4711~°0◂{ 0' 1' }:(_lst)◂(_p783) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4712
 ; {>  %_4712~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p783)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5068
	btr r12,2
	jmp LB_5069
LB_5068:
	bts r12,2
LB_5069:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5066
	btr QWORD [rdi],0
	jmp LB_5067
LB_5066:
	bts QWORD [rdi],0
LB_5067:
	mov r8,r14
	bt r12,1
	jc LB_5072
	btr r12,2
	jmp LB_5073
LB_5072:
	bts r12,2
LB_5073:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5070
	btr QWORD [rdi],1
	jmp LB_5071
LB_5070:
	bts QWORD [rdi],1
LB_5071:
	mov rsi,1
	bt r12,3
	jc LB_5064
	mov rsi,0
	bt r9,0
	jc LB_5064
	jmp LB_5065
LB_5064:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5065:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5074:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5076
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5075
LB_5076:
	add rsp,8
	ret
LB_5077:
	add rsp,32
	pop r14
LB_5075:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5095
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_4713 : %_4713
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4713 ⊢ %_4714 : %_4714
 ; {>  %_4713~°1◂{  }:(_lst)◂(t1974'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4714
 ; {>  %_4714~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1977'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5093
	mov rsi,0
	bt r9,0
	jc LB_5093
	jmp LB_5094
LB_5093:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5094:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5095:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5097
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5096
LB_5097:
	add rsp,8
	ret
LB_5098:
	add rsp,0
	pop r14
LB_5096:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4669:
NS_E_RDI_4669:
NS_E_4669_ETR_TBL:
NS_E_4669_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_5117
LB_5116:
	add r14,1
LB_5117:
	cmp r14,r10
	jge LB_5118
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5116
	cmp al,10
	jz LB_5116
	cmp al,32
	jz LB_5116
LB_5118:
	add r14,7
	cmp r14,r10
	jg LB_5121
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_5121
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_5121
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_5121
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_5121
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_5121
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_5121
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_5121
	jmp LB_5122
LB_5121:
	jmp LB_5104
LB_5122:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_body
	jmp LB_5111
LB_5110:
	add r14,1
LB_5111:
	cmp r14,r10
	jge LB_5112
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5110
	cmp al,10
	jz LB_5110
	cmp al,32
	jz LB_5110
LB_5112:
	push r10
	call NS_E_4670_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5113
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5114
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5114:
	jmp LB_5105
LB_5113:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5108
	btr r12,1
	jmp LB_5109
LB_5108:
	bts r12,1
LB_5109:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5106
	btr r12,0
	jmp LB_5107
LB_5106:
	bts r12,0
LB_5107:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5101
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5123
	btr r12,2
	jmp LB_5124
LB_5123:
	bts r12,2
LB_5124:
	mov r13,r14
	bt r12,1
	jc LB_5125
	btr r12,0
	jmp LB_5126
LB_5125:
	bts r12,0
LB_5126:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_4715 ⊢ %_4716 : %_4716
 ; {>  %_4715~0':_p783 }
; _some 0' ⊢ °0◂0'
; ∎ %_4716
 ; {>  %_4716~°0◂0':(_opn)◂(_p783) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5099
	btr r12,3
	jmp LB_5100
LB_5099:
	bts r12,3
LB_5100:
	mov r8,0
	bts r12,2
	ret
LB_5101:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5103
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5102
LB_5103:
	add rsp,8
	ret
LB_5105:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5104:
	add rsp,32
	pop r14
LB_5102:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5128
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_4717
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_4717 ⊢ %_4718 : %_4718
 ; {>  %_4717~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_4719 : %_4719
 ; {>  %_4718~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_4719
 ; {>  %_4718~0':_stg %_4719~°1◂{  }:(_opn)◂(t1987'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5127
	mov rdi,r13
	call dlt
LB_5127:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_5128:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5130
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5129
LB_5130:
	add rsp,8
	ret
LB_5131:
	add rsp,0
	pop r14
LB_5129:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_5167
LB_5166:
	add r14,1
LB_5167:
	cmp r14,r10
	jge LB_5168
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5166
	cmp al,10
	jz LB_5166
	cmp al,32
	jz LB_5166
LB_5168:
	add r14,4
	cmp r14,r10
	jg LB_5171
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_5171
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_5171
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_5171
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_5171
	jmp LB_5172
LB_5171:
	jmp LB_5145
LB_5172:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_5154
LB_5153:
	add r14,1
LB_5154:
	cmp r14,r10
	jge LB_5155
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5153
	cmp al,10
	jz LB_5153
	cmp al,32
	jz LB_5153
LB_5155:
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5156
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5157
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5157:
	jmp LB_5146
LB_5156:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_5160
LB_5159:
	add r14,1
LB_5160:
	cmp r14,r10
	jge LB_5161
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5159
	cmp al,10
	jz LB_5159
	cmp al,32
	jz LB_5159
LB_5161:
	push r10
	call NS_E_4671_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5162
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5163
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5163:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5164
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5164:
	jmp LB_5146
LB_5162:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5151
	btr r12,2
	jmp LB_5152
LB_5151:
	bts r12,2
LB_5152:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5149
	btr r12,1
	jmp LB_5150
LB_5149:
	bts r12,1
LB_5150:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5147
	btr r12,0
	jmp LB_5148
LB_5147:
	bts r12,0
LB_5148:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_5142
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_5173
	btr r12,3
	jmp LB_5174
LB_5173:
	bts r12,3
LB_5174:
	mov r14,r8
	bt r12,2
	jc LB_5175
	btr r12,1
	jmp LB_5176
LB_5175:
	bts r12,1
LB_5176:
	mov r8,r13
	bt r12,0
	jc LB_5177
	btr r12,2
	jmp LB_5178
LB_5177:
	bts r12,2
LB_5178:
	mov r13,r9
	bt r12,3
	jc LB_5179
	btr r12,0
	jmp LB_5180
LB_5179:
	bts r12,0
LB_5180:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f810 { %_4720 %_4721 } ⊢ %_4722 : %_4722
 ; {>  %_4721~1':_p784 %_4720~0':_stg }
; _f810 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4722 ⊢ %_4723 : %_4723
 ; {>  %_4722~°0◂{ 0' 1' }:_p783 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4723
 ; {>  %_4723~°0◂°0◂{ 0' 1' }:(_opn)◂(_p783) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5136
	btr r12,2
	jmp LB_5137
LB_5136:
	bts r12,2
LB_5137:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5134
	btr QWORD [rdi],0
	jmp LB_5135
LB_5134:
	bts QWORD [rdi],0
LB_5135:
	mov r8,r14
	bt r12,1
	jc LB_5140
	btr r12,2
	jmp LB_5141
LB_5140:
	bts r12,2
LB_5141:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5138
	btr QWORD [rdi],1
	jmp LB_5139
LB_5138:
	bts QWORD [rdi],1
LB_5139:
	mov rsi,1
	bt r12,3
	jc LB_5132
	mov rsi,0
	bt r9,0
	jc LB_5132
	jmp LB_5133
LB_5132:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5133:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5142:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5144
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5143
LB_5144:
	add rsp,8
	ret
LB_5146:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5145:
	add rsp,48
	pop r14
LB_5143:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5182
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 1" _ ⊢ 0' : %_4724
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_4724 ⊢ %_4725 : %_4725
 ; {>  %_4724~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_4726 : %_4726
 ; {>  %_4725~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_4726
 ; {>  %_4726~°1◂{  }:(_opn)◂(t1999'(0)) %_4725~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5181
	mov rdi,r13
	call dlt
LB_5181:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_5182:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5184
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5183
LB_5184:
	add rsp,8
	ret
LB_5185:
	add rsp,0
	pop r14
LB_5183:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_5204
LB_5203:
	add r14,1
LB_5204:
	cmp r14,r10
	jge LB_5205
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5203
	cmp al,10
	jz LB_5203
	cmp al,32
	jz LB_5203
LB_5205:
	add r14,2
	cmp r14,r10
	jg LB_5208
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_5208
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_5208
	jmp LB_5209
LB_5208:
	jmp LB_5191
LB_5209:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_5198
LB_5197:
	add r14,1
LB_5198:
	cmp r14,r10
	jge LB_5199
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5197
	cmp al,10
	jz LB_5197
	cmp al,32
	jz LB_5197
LB_5199:
	push r10
	call NS_E_4679_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5200
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5201
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5201:
	jmp LB_5192
LB_5200:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5195
	btr r12,1
	jmp LB_5196
LB_5195:
	bts r12,1
LB_5196:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5193
	btr r12,0
	jmp LB_5194
LB_5193:
	bts r12,0
LB_5194:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5188
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5210
	btr r12,2
	jmp LB_5211
LB_5210:
	bts r12,2
LB_5211:
	mov r13,r14
	bt r12,1
	jc LB_5212
	btr r12,0
	jmp LB_5213
LB_5212:
	bts r12,0
LB_5213:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_4727 ⊢ %_4728 : %_4728
 ; {>  %_4727~0':_p783 }
; _some 0' ⊢ °0◂0'
; ∎ %_4728
 ; {>  %_4728~°0◂0':(_opn)◂(_p783) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5186
	btr r12,3
	jmp LB_5187
LB_5186:
	bts r12,3
LB_5187:
	mov r8,0
	bts r12,2
	ret
LB_5188:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5190
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5189
LB_5190:
	add rsp,8
	ret
LB_5192:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5191:
	add rsp,32
	pop r14
LB_5189:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5215
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 2" _ ⊢ 0' : %_4729
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_4729 ⊢ %_4730 : %_4730
 ; {>  %_4729~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_4731 : %_4731
 ; {>  %_4730~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_4731
 ; {>  %_4731~°1◂{  }:(_opn)◂(t2009'(0)) %_4730~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5214
	mov rdi,r13
	call dlt
LB_5214:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_5215:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5217
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5216
LB_5217:
	add rsp,8
	ret
LB_5218:
	add rsp,0
	pop r14
LB_5216:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_5237
LB_5236:
	add r14,1
LB_5237:
	cmp r14,r10
	jge LB_5238
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5236
	cmp al,10
	jz LB_5236
	cmp al,32
	jz LB_5236
LB_5238:
	add r14,2
	cmp r14,r10
	jg LB_5241
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_5241
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_5241
	jmp LB_5242
LB_5241:
	jmp LB_5224
LB_5242:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_5231
LB_5230:
	add r14,1
LB_5231:
	cmp r14,r10
	jge LB_5232
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5230
	cmp al,10
	jz LB_5230
	cmp al,32
	jz LB_5230
LB_5232:
	push r10
	call NS_E_4673_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5233
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5234
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5234:
	jmp LB_5225
LB_5233:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5228
	btr r12,1
	jmp LB_5229
LB_5228:
	bts r12,1
LB_5229:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5226
	btr r12,0
	jmp LB_5227
LB_5226:
	bts r12,0
LB_5227:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5221
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5243
	btr r12,2
	jmp LB_5244
LB_5243:
	bts r12,2
LB_5244:
	mov r13,r14
	bt r12,1
	jc LB_5245
	btr r12,0
	jmp LB_5246
LB_5245:
	bts r12,0
LB_5246:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_4732 ⊢ %_4733 : %_4733
 ; {>  %_4732~0':_p783 }
; _some 0' ⊢ °0◂0'
; ∎ %_4733
 ; {>  %_4733~°0◂0':(_opn)◂(_p783) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5219
	btr r12,3
	jmp LB_5220
LB_5219:
	bts r12,3
LB_5220:
	mov r8,0
	bts r12,2
	ret
LB_5221:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5223
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5222
LB_5223:
	add rsp,8
	ret
LB_5225:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5224:
	add rsp,32
	pop r14
LB_5222:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4670:
NS_E_RDI_4670:
NS_E_4670_ETR_TBL:
NS_E_4670_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_etr
	jmp LB_5282
LB_5281:
	add r14,1
LB_5282:
	cmp r14,r10
	jge LB_5283
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5281
	cmp al,10
	jz LB_5281
	cmp al,32
	jz LB_5281
LB_5283:
	push r10
	call NS_E_4696_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5284
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5276
LB_5284:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_5290:
	jmp LB_5287
LB_5286:
	add r14,1
LB_5287:
	cmp r14,r10
	jge LB_5288
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5286
	cmp al,10
	jz LB_5286
	cmp al,32
	jz LB_5286
LB_5288:
	push r10
	push rsi
	call NS_E_4696_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5289
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5291
	bts QWORD [rax],0
LB_5291:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5290
LB_5289:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5279
	btr r12,1
	jmp LB_5280
LB_5279:
	bts r12,1
LB_5280:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5277
	btr r12,0
	jmp LB_5278
LB_5277:
	bts r12,0
LB_5278:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5273
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r8,r14
	bt r12,1
	jc LB_5292
	btr r12,2
	jmp LB_5293
LB_5292:
	bts r12,2
LB_5293:
	mov r9,r13
	bt r12,0
	jc LB_5294
	btr r12,3
	jmp LB_5295
LB_5294:
	bts r12,3
LB_5295:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_5298
	btr r12,4
	jmp LB_5299
LB_5298:
	bts r12,4
LB_5299:
	mov r13,r10
	bt r12,4
	jc LB_5296
	btr r12,0
	jmp LB_5297
LB_5296:
	bts r12,0
LB_5297:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_5302
	btr r12,4
	jmp LB_5303
LB_5302:
	bts r12,4
LB_5303:
	mov r14,r10
	bt r12,4
	jc LB_5300
	btr r12,1
	jmp LB_5301
LB_5300:
	bts r12,1
LB_5301:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f121 %_4735 ⊢ %_4736 : %_4736
 ; {>  %_4735~2':(_lst)◂({ _stg _p787 }) %_4734~{ 0' 1' }:{ _stg _p787 } }
; _f121 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_5251
	btr r12,0
	jmp LB_5252
LB_5251:
	bts r12,0
LB_5252:
	call NS_E_121
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_5253
	btr r12,2
	jmp LB_5254
LB_5253:
	bts r12,2
LB_5254:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_5249
	btr r12,1
	jmp LB_5250
LB_5249:
	bts r12,1
LB_5250:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_5247
	btr r12,0
	jmp LB_5248
LB_5247:
	bts r12,0
LB_5248:
	add rsp,24
; _cns { %_4734 %_4736 } ⊢ %_4737 : %_4737
 ; {>  %_4734~{ 0' 1' }:{ _stg _p787 } %_4736~2':(_lst)◂({ _stg _p787 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f811 %_4737 ⊢ %_4738 : %_4738
 ; {>  %_4737~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p787 }) }
; _f811 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _some %_4738 ⊢ %_4739 : %_4739
 ; {>  %_4738~°1◂°0◂{ { 0' 1' } 2' }:_p783 }
; _some °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_4739
 ; {>  %_4739~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p783) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_5263
	btr r12,5
	jmp LB_5264
LB_5263:
	bts r12,5
LB_5264:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_5261
	btr QWORD [rdi],0
	jmp LB_5262
LB_5261:
	bts QWORD [rdi],0
LB_5262:
	mov r11,r14
	bt r12,1
	jc LB_5267
	btr r12,5
	jmp LB_5268
LB_5267:
	bts r12,5
LB_5268:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_5265
	btr QWORD [rdi],1
	jmp LB_5266
LB_5265:
	bts QWORD [rdi],1
LB_5266:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_5259
	btr QWORD [rdi],0
	jmp LB_5260
LB_5259:
	bts QWORD [rdi],0
LB_5260:
	mov r10,r8
	bt r12,2
	jc LB_5271
	btr r12,4
	jmp LB_5272
LB_5271:
	bts r12,4
LB_5272:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_5269
	btr QWORD [rdi],1
	jmp LB_5270
LB_5269:
	bts QWORD [rdi],1
LB_5270:
	mov rsi,1
	bt r12,3
	jc LB_5257
	mov rsi,0
	bt r9,0
	jc LB_5257
	jmp LB_5258
LB_5257:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5258:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_5255
	mov rsi,0
	bt r9,0
	jc LB_5255
	jmp LB_5256
LB_5255:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5256:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5273:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5275
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5274
LB_5275:
	add rsp,8
	ret
LB_5276:
	add rsp,32
	pop r14
LB_5274:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5305
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_4740
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_4740 ⊢ %_4741 : %_4741
 ; {>  %_4740~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_4742 : %_4742
 ; {>  %_4741~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_4742
 ; {>  %_4742~°1◂{  }:(_opn)◂(t2028'(0)) %_4741~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5304
	mov rdi,r13
	call dlt
LB_5304:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_5305:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5307
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5306
LB_5307:
	add rsp,8
	ret
LB_5308:
	add rsp,0
	pop r14
LB_5306:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4671:
NS_E_RDI_4671:
NS_E_4671_ETR_TBL:
NS_E_4671_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_5329
LB_5328:
	add r14,1
LB_5329:
	cmp r14,r10
	jge LB_5330
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5328
	cmp al,10
	jz LB_5328
	cmp al,32
	jz LB_5328
LB_5330:
	add r14,1
	cmp r14,r10
	jg LB_5333
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_5333
	jmp LB_5334
LB_5333:
	jmp LB_5316
LB_5334:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_5323
LB_5322:
	add r14,1
LB_5323:
	cmp r14,r10
	jge LB_5324
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5322
	cmp al,10
	jz LB_5322
	cmp al,32
	jz LB_5322
LB_5324:
	push r10
	call NS_E_3623_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5325
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5326
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5326:
	jmp LB_5317
LB_5325:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5320
	btr r12,1
	jmp LB_5321
LB_5320:
	bts r12,1
LB_5321:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5318
	btr r12,0
	jmp LB_5319
LB_5318:
	bts r12,0
LB_5319:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5313
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_5335
	btr r12,2
	jmp LB_5336
LB_5335:
	bts r12,2
LB_5336:
	mov r13,r14
	bt r12,1
	jc LB_5337
	btr r12,0
	jmp LB_5338
LB_5337:
	bts r12,0
LB_5338:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f817 %_4743 ⊢ %_4744 : %_4744
 ; {>  %_4743~0':_p735 }
; _f817 0' ⊢ °1◂0'
; _some %_4744 ⊢ %_4745 : %_4745
 ; {>  %_4744~°1◂0':_p784 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4745
 ; {>  %_4745~°0◂°1◂0':(_opn)◂(_p784) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5311
	btr r12,3
	jmp LB_5312
LB_5311:
	bts r12,3
LB_5312:
	mov rsi,1
	bt r12,3
	jc LB_5309
	mov rsi,0
	bt r9,0
	jc LB_5309
	jmp LB_5310
LB_5309:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5310:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5313:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5315
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5314
LB_5315:
	add rsp,8
	ret
LB_5317:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5316:
	add rsp,32
	pop r14
LB_5314:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_5350
LB_5349:
	add r14,1
LB_5350:
	cmp r14,r10
	jge LB_5351
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5349
	cmp al,10
	jz LB_5349
	cmp al,32
	jz LB_5349
LB_5351:
	push r10
	call NS_E_4672_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5352
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5346
LB_5352:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5347
	btr r12,0
	jmp LB_5348
LB_5347:
	bts r12,0
LB_5348:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5343
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f816 %_4746 ⊢ %_4747 : %_4747
 ; {>  %_4746~0':(_lst)◂(_p783) }
; _f816 0' ⊢ °0◂0'
; _some %_4747 ⊢ %_4748 : %_4748
 ; {>  %_4747~°0◂0':_p784 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4748
 ; {>  %_4748~°0◂°0◂0':(_opn)◂(_p784) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_5341
	btr r12,3
	jmp LB_5342
LB_5341:
	bts r12,3
LB_5342:
	mov rsi,1
	bt r12,3
	jc LB_5339
	mov rsi,0
	bt r9,0
	jc LB_5339
	jmp LB_5340
LB_5339:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5340:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5343:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5345
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5344
LB_5345:
	add rsp,8
	ret
LB_5346:
	add rsp,16
	pop r14
LB_5344:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5355
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "mdl_etr_def 0" _ ⊢ 0' : %_4749
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_5f_72_74_65_5f_6c_64_6d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_66_65_64
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_4749 ⊢ %_4750 : %_4750
 ; {>  %_4749~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_4751 : %_4751
 ; {>  %_4750~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_4751
 ; {>  %_4751~°1◂{  }:(_opn)◂(t2043'(0)) %_4750~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5354
	mov rdi,r13
	call dlt
LB_5354:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_5355:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5357
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5356
LB_5357:
	add rsp,8
	ret
LB_5358:
	add rsp,0
	pop r14
LB_5356:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4672:
NS_E_RDI_4672:
NS_E_4672_ETR_TBL:
NS_E_4672_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_5368
LB_5367:
	add r14,1
LB_5368:
	cmp r14,r10
	jge LB_5369
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5367
	cmp al,10
	jz LB_5367
	cmp al,32
	jz LB_5367
LB_5369:
	add r14,6
	cmp r14,r10
	jg LB_5372
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_5372
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_5372
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_5372
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_5372
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_5372
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_5372
	jmp LB_5373
LB_5372:
	jmp LB_5364
LB_5373:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5365
	btr r12,0
	jmp LB_5366
LB_5365:
	bts r12,0
LB_5366:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5361
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_4752 : %_4752
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4752 ⊢ %_4753 : %_4753
 ; {>  %_4752~°1◂{  }:(_lst)◂(t2047'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4753
 ; {>  %_4753~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2050'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5359
	mov rsi,0
	bt r9,0
	jc LB_5359
	jmp LB_5360
LB_5359:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5360:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5361:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5363
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5362
LB_5363:
	add rsp,8
	ret
LB_5364:
	add rsp,16
	pop r14
LB_5362:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_5393
LB_5392:
	add r14,1
LB_5393:
	cmp r14,r10
	jge LB_5394
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5392
	cmp al,10
	jz LB_5392
	cmp al,32
	jz LB_5392
LB_5394:
	push r10
	call NS_E_4669_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5395
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5387
LB_5395:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_5398
LB_5397:
	add r14,1
LB_5398:
	cmp r14,r10
	jge LB_5399
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5397
	cmp al,10
	jz LB_5397
	cmp al,32
	jz LB_5397
LB_5399:
	push r10
	call NS_E_4672_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5400
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5401
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5401:
	jmp LB_5387
LB_5400:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5390
	btr r12,1
	jmp LB_5391
LB_5390:
	bts r12,1
LB_5391:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5388
	btr r12,0
	jmp LB_5389
LB_5388:
	bts r12,0
LB_5389:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5384
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_4754 %_4755 } ⊢ %_4756 : %_4756
 ; {>  %_4755~1':(_lst)◂(_p783) %_4754~0':_p783 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4756 ⊢ %_4757 : %_4757
 ; {>  %_4756~°0◂{ 0' 1' }:(_lst)◂(_p783) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4757
 ; {>  %_4757~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p783)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5378
	btr r12,2
	jmp LB_5379
LB_5378:
	bts r12,2
LB_5379:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5376
	btr QWORD [rdi],0
	jmp LB_5377
LB_5376:
	bts QWORD [rdi],0
LB_5377:
	mov r8,r14
	bt r12,1
	jc LB_5382
	btr r12,2
	jmp LB_5383
LB_5382:
	bts r12,2
LB_5383:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5380
	btr QWORD [rdi],1
	jmp LB_5381
LB_5380:
	bts QWORD [rdi],1
LB_5381:
	mov rsi,1
	bt r12,3
	jc LB_5374
	mov rsi,0
	bt r9,0
	jc LB_5374
	jmp LB_5375
LB_5374:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5375:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5384:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5386
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5385
LB_5386:
	add rsp,8
	ret
LB_5387:
	add rsp,32
	pop r14
LB_5385:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4673:
NS_E_RDI_4673:
NS_E_4673_ETR_TBL:
NS_E_4673_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_5458
LB_5457:
	add r14,1
LB_5458:
	cmp r14,r10
	jge LB_5459
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5457
	cmp al,10
	jz LB_5457
	cmp al,32
	jz LB_5457
LB_5459:
	add r14,1
	cmp r14,r10
	jg LB_5462
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_5462
	jmp LB_5463
LB_5462:
	jmp LB_5424
LB_5463:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_5435
LB_5434:
	add r14,1
LB_5435:
	cmp r14,r10
	jge LB_5436
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5434
	cmp al,10
	jz LB_5434
	cmp al,32
	jz LB_5434
LB_5436:
	add r14,1
	cmp r14,r10
	jg LB_5440
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_5440
	jmp LB_5441
LB_5440:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5438
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5438:
	jmp LB_5425
LB_5441:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_5443
LB_5442:
	add r14,1
LB_5443:
	cmp r14,r10
	jge LB_5444
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5442
	cmp al,10
	jz LB_5442
	cmp al,32
	jz LB_5442
LB_5444:
	push r10
	call NS_E_4674_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5445
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5446
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5446:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5447
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5447:
	jmp LB_5425
LB_5445:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_5450
LB_5449:
	add r14,1
LB_5450:
	cmp r14,r10
	jge LB_5451
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5449
	cmp al,10
	jz LB_5449
	cmp al,32
	jz LB_5449
LB_5451:
	push r10
	call NS_E_4677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5452
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5453
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5453:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5454
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5454:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5455
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5455:
	jmp LB_5425
LB_5452:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5432
	btr r12,3
	jmp LB_5433
LB_5432:
	bts r12,3
LB_5433:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5430
	btr r12,2
	jmp LB_5431
LB_5430:
	bts r12,2
LB_5431:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5428
	btr r12,1
	jmp LB_5429
LB_5428:
	bts r12,1
LB_5429:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5426
	btr r12,0
	jmp LB_5427
LB_5426:
	bts r12,0
LB_5427:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_5421
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_5464
	btr r12,4
	jmp LB_5465
LB_5464:
	bts r12,4
LB_5465:
	mov r8,r9
	bt r12,3
	jc LB_5466
	btr r12,2
	jmp LB_5467
LB_5466:
	bts r12,2
LB_5467:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_5470
	btr r12,3
	jmp LB_5471
LB_5470:
	bts r12,3
LB_5471:
	mov r13,r9
	bt r12,3
	jc LB_5468
	btr r12,0
	jmp LB_5469
LB_5468:
	bts r12,0
LB_5469:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_5474
	btr r12,3
	jmp LB_5475
LB_5474:
	bts r12,3
LB_5475:
	mov r14,r9
	bt r12,3
	jc LB_5472
	btr r12,1
	jmp LB_5473
LB_5472:
	bts r12,1
LB_5473:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_4758 %_4759 } ⊢ %_4760 : %_4760
 ; {>  %_4758~{ 0' 1' }:{ _stg _p786 } %_4759~2':(_lst)◂({ _stg _p786 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f815 %_4760 ⊢ %_4761 : %_4761
 ; {>  %_4760~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p786 }) }
; _f815 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_4761 ⊢ %_4762 : %_4762
 ; {>  %_4761~°5◂°0◂{ { 0' 1' } 2' }:_p783 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_4762
 ; {>  %_4762~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p783) }
; 	∎ °0◂°5◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°5◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_5411
	btr r12,5
	jmp LB_5412
LB_5411:
	bts r12,5
LB_5412:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_5409
	btr QWORD [rdi],0
	jmp LB_5410
LB_5409:
	bts QWORD [rdi],0
LB_5410:
	mov r11,r14
	bt r12,1
	jc LB_5415
	btr r12,5
	jmp LB_5416
LB_5415:
	bts r12,5
LB_5416:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_5413
	btr QWORD [rdi],1
	jmp LB_5414
LB_5413:
	bts QWORD [rdi],1
LB_5414:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_5407
	btr QWORD [rdi],0
	jmp LB_5408
LB_5407:
	bts QWORD [rdi],0
LB_5408:
	mov r10,r8
	bt r12,2
	jc LB_5419
	btr r12,4
	jmp LB_5420
LB_5419:
	bts r12,4
LB_5420:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_5417
	btr QWORD [rdi],1
	jmp LB_5418
LB_5417:
	bts QWORD [rdi],1
LB_5418:
	mov rsi,1
	bt r12,3
	jc LB_5405
	mov rsi,0
	bt r9,0
	jc LB_5405
	jmp LB_5406
LB_5405:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5406:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_5403
	mov rsi,0
	bt r9,0
	jc LB_5403
	jmp LB_5404
LB_5403:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5404:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5421:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5423
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5422
LB_5423:
	add rsp,8
	ret
LB_5425:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5424:
	add rsp,64
	pop r14
LB_5422:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_5493
LB_5492:
	add r14,1
LB_5493:
	cmp r14,r10
	jge LB_5494
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5492
	cmp al,10
	jz LB_5492
	cmp al,32
	jz LB_5492
LB_5494:
	push r10
	call NS_E_4674_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5495
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5489
LB_5495:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5490
	btr r12,0
	jmp LB_5491
LB_5490:
	bts r12,0
LB_5491:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_5486
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_5497
	btr r12,2
	jmp LB_5498
LB_5497:
	bts r12,2
LB_5498:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_5501
	btr r12,3
	jmp LB_5502
LB_5501:
	bts r12,3
LB_5502:
	mov r13,r9
	bt r12,3
	jc LB_5499
	btr r12,0
	jmp LB_5500
LB_5499:
	bts r12,0
LB_5500:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_5505
	btr r12,3
	jmp LB_5506
LB_5505:
	bts r12,3
LB_5506:
	mov r14,r9
	bt r12,3
	jc LB_5503
	btr r12,1
	jmp LB_5504
LB_5503:
	bts r12,1
LB_5504:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f814 %_4763 ⊢ %_4764 : %_4764
 ; {>  %_4763~{ 0' 1' }:{ _stg _p786 } }
; _f814 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_4764 ⊢ %_4765 : %_4765
 ; {>  %_4764~°4◂{ 0' 1' }:_p783 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_4765
 ; {>  %_4765~°0◂°4◂{ 0' 1' }:(_opn)◂(_p783) }
; 	∎ °0◂°4◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°4◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5480
	btr r12,2
	jmp LB_5481
LB_5480:
	bts r12,2
LB_5481:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5478
	btr QWORD [rdi],0
	jmp LB_5479
LB_5478:
	bts QWORD [rdi],0
LB_5479:
	mov r8,r14
	bt r12,1
	jc LB_5484
	btr r12,2
	jmp LB_5485
LB_5484:
	bts r12,2
LB_5485:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5482
	btr QWORD [rdi],1
	jmp LB_5483
LB_5482:
	bts QWORD [rdi],1
LB_5483:
	mov rsi,1
	bt r12,3
	jc LB_5476
	mov rsi,0
	bt r9,0
	jc LB_5476
	jmp LB_5477
LB_5476:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5477:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5486:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5488
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5487
LB_5488:
	add rsp,8
	ret
LB_5489:
	add rsp,16
	pop r14
LB_5487:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5508
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "dt_etr 0" _ ⊢ 0' : %_4766
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_4766 ⊢ %_4767 : %_4767
 ; {>  %_4766~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_4768 : %_4768
 ; {>  %_4767~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_4768
 ; {>  %_4767~0':_stg %_4768~°1◂{  }:(_opn)◂(t2074'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_5507
	mov rdi,r13
	call dlt
LB_5507:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_5508:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5510
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5509
LB_5510:
	add rsp,8
	ret
LB_5511:
	add rsp,0
	pop r14
LB_5509:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4674:
NS_E_RDI_4674:
NS_E_4674_ETR_TBL:
NS_E_4674_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; word
	jmp LB_5545
LB_5544:
	add r14,1
LB_5545:
	cmp r14,r10
	jge LB_5546
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5544
	cmp al,10
	jz LB_5544
	cmp al,32
	jz LB_5544
LB_5546:
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5547
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5526
LB_5547:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_5550
LB_5549:
	add r14,1
LB_5550:
	cmp r14,r10
	jge LB_5551
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5549
	cmp al,10
	jz LB_5549
	cmp al,32
	jz LB_5549
LB_5551:
	push r10
	call NS_E_4676_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5552
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5553
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5553:
	jmp LB_5526
LB_5552:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_5556
LB_5555:
	add r14,1
LB_5556:
	cmp r14,r10
	jge LB_5557
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5555
	cmp al,10
	jz LB_5555
	cmp al,32
	jz LB_5555
LB_5557:
	add r14,1
	cmp r14,r10
	jg LB_5562
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_5562
	jmp LB_5563
LB_5562:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5559
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5559:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5560
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5560:
	jmp LB_5526
LB_5563:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_5537
LB_5536:
	add r14,1
LB_5537:
	cmp r14,r10
	jge LB_5538
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5536
	cmp al,10
	jz LB_5536
	cmp al,32
	jz LB_5536
LB_5538:
	push r10
	call NS_E_4353_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5539
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5540
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5540:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5541
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5541:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5542
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5542:
	jmp LB_5527
LB_5539:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5534
	btr r12,3
	jmp LB_5535
LB_5534:
	bts r12,3
LB_5535:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5532
	btr r12,2
	jmp LB_5533
LB_5532:
	bts r12,2
LB_5533:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5530
	btr r12,1
	jmp LB_5531
LB_5530:
	bts r12,1
LB_5531:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5528
	btr r12,0
	jmp LB_5529
LB_5528:
	bts r12,0
LB_5529:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_5523
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_5564
	btr r12,4
	jmp LB_5565
LB_5564:
	bts r12,4
LB_5565:
	mov r8,r9
	bt r12,3
	jc LB_5566
	btr r12,2
	jmp LB_5567
LB_5566:
	bts r12,2
LB_5567:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f822 %_4771 ⊢ %_4772 : %_4772
 ; {>  %_4769~0':_stg %_4770~1':_p4675 %_4771~2':_p800 }
; _f822 2' ⊢ °1◂2'
; _some { %_4769 %_4772 } ⊢ %_4773 : %_4773
 ; {>  %_4769~0':_stg %_4770~1':_p4675 %_4772~°1◂2':_p786 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_4773
 ; {>  %_4773~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p786 }) %_4770~1':_p4675 }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_5512
	mov rdi,r14
	call dlt
LB_5512:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_5515
	btr r12,1
	jmp LB_5516
LB_5515:
	bts r12,1
LB_5516:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_5513
	btr QWORD [rdi],0
	jmp LB_5514
LB_5513:
	bts QWORD [rdi],0
LB_5514:
	mov r14,r8
	bt r12,2
	jc LB_5521
	btr r12,1
	jmp LB_5522
LB_5521:
	bts r12,1
LB_5522:
	mov rsi,1
	bt r12,1
	jc LB_5519
	mov rsi,0
	bt r14,0
	jc LB_5519
	jmp LB_5520
LB_5519:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_5520:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_5517
	btr QWORD [rdi],1
	jmp LB_5518
LB_5517:
	bts QWORD [rdi],1
LB_5518:
	mov r8,0
	bts r12,2
	ret
LB_5523:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5525
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5524
LB_5525:
	add rsp,8
	ret
LB_5527:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5526:
	add rsp,64
	pop r14
LB_5524:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,112
; word
	jmp LB_5614
LB_5613:
	add r14,1
LB_5614:
	cmp r14,r10
	jge LB_5615
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5613
	cmp al,10
	jz LB_5613
	cmp al,32
	jz LB_5613
LB_5615:
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5616
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5598
LB_5616:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_5619
LB_5618:
	add r14,1
LB_5619:
	cmp r14,r10
	jge LB_5620
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5618
	cmp al,10
	jz LB_5618
	cmp al,32
	jz LB_5618
LB_5620:
	push r10
	call NS_E_4676_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5621
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5622
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5622:
	jmp LB_5598
LB_5621:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_5625
LB_5624:
	add r14,1
LB_5625:
	cmp r14,r10
	jge LB_5626
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5624
	cmp al,10
	jz LB_5624
	cmp al,32
	jz LB_5624
LB_5626:
	add r14,3
	cmp r14,r10
	jg LB_5631
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5631
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_5631
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_5631
	jmp LB_5632
LB_5631:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5628
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5628:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5629
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5629:
	jmp LB_5598
LB_5632:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_5634
LB_5633:
	add r14,1
LB_5634:
	cmp r14,r10
	jge LB_5635
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5633
	cmp al,10
	jz LB_5633
	cmp al,32
	jz LB_5633
LB_5635:
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5636
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5637
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5637:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5638
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5638:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5639
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5639:
	jmp LB_5598
LB_5636:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_5642
LB_5641:
	add r14,1
LB_5642:
	cmp r14,r10
	jge LB_5643
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5641
	cmp al,10
	jz LB_5641
	cmp al,32
	jz LB_5641
LB_5643:
	add r14,1
	cmp r14,r10
	jg LB_5650
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_5650
	jmp LB_5651
LB_5650:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5645
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5645:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5646
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5646:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5647
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5647:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5648
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5648:
	jmp LB_5598
LB_5651:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_5653
LB_5652:
	add r14,1
LB_5653:
	cmp r14,r10
	jge LB_5654
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5652
	cmp al,10
	jz LB_5652
	cmp al,32
	jz LB_5652
LB_5654:
	push r10
	call NS_E_4353_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5655
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_5656
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_5656:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5657
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5657:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5658
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5658:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5659
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5659:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5660
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5660:
	jmp LB_5598
LB_5655:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_5663
LB_5662:
	add r14,1
LB_5663:
	cmp r14,r10
	jge LB_5664
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5662
	cmp al,10
	jz LB_5662
	cmp al,32
	jz LB_5662
LB_5664:
	push r10
	call NS_E_4678_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5665
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_5666
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_5666:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_5667
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_5667:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5668
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5668:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5669
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5669:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5670
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5670:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5671
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5671:
	jmp LB_5598
LB_5665:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_5611
	btr r12,6
	jmp LB_5612
LB_5611:
	bts r12,6
LB_5612:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_5609
	btr r12,5
	jmp LB_5610
LB_5609:
	bts r12,5
LB_5610:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_5607
	btr r12,4
	jmp LB_5608
LB_5607:
	bts r12,4
LB_5608:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5605
	btr r12,3
	jmp LB_5606
LB_5605:
	bts r12,3
LB_5606:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5603
	btr r12,2
	jmp LB_5604
LB_5603:
	bts r12,2
LB_5604:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5601
	btr r12,1
	jmp LB_5602
LB_5601:
	bts r12,1
LB_5602:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5599
	btr r12,0
	jmp LB_5600
LB_5599:
	bts r12,0
LB_5600:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_5595
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_5673
	btr r12,7
	jmp LB_5674
LB_5673:
	bts r12,7
LB_5674:
	mov r10,rcx
	bt r12,6
	jc LB_5675
	btr r12,4
	jmp LB_5676
LB_5675:
	bts r12,4
LB_5676:
	mov rcx,r9
	bt r12,3
	jc LB_5677
	btr r12,6
	jmp LB_5678
LB_5677:
	bts r12,6
LB_5678:
	mov r9,r11
	bt r12,5
	jc LB_5679
	btr r12,3
	jmp LB_5680
LB_5679:
	bts r12,3
LB_5680:
	mov r11,r8
	bt r12,2
	jc LB_5681
	btr r12,5
	jmp LB_5682
LB_5681:
	bts r12,5
LB_5682:
	mov r8,rcx
	bt r12,6
	jc LB_5683
	btr r12,2
	jmp LB_5684
LB_5683:
	bts r12,2
LB_5684:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_4776 %_4777 } %_4778 } ⊢ %_4779 : %_4779
 ; {>  %_4777~3':_p800 %_4778~4':(_lst)◂({ _stg _p800 }) %_4774~0':_stg %_4775~1':_p4675 %_4776~2':_stg }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f821 %_4779 ⊢ %_4780 : %_4780
 ; {>  %_4774~0':_stg %_4779~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p800 }) %_4775~1':_p4675 }
; _f821 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_4774 %_4780 } ⊢ %_4781 : %_4781
 ; {>  %_4774~0':_stg %_4775~1':_p4675 %_4780~°0◂°0◂{ { 2' 3' } 4' }:_p786 }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_4781
 ; {>  %_4781~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p786 }) %_4775~1':_p4675 }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_5568
	mov rdi,r14
	call dlt
LB_5568:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_5569
	btr r12,1
	jmp LB_5570
LB_5569:
	bts r12,1
LB_5570:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_5573
	btr r12,5
	jmp LB_5574
LB_5573:
	bts r12,5
LB_5574:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_5571
	btr QWORD [rdi],0
	jmp LB_5572
LB_5571:
	bts QWORD [rdi],0
LB_5572:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rcx,r8
	bt r12,2
	jc LB_5585
	btr r12,6
	jmp LB_5586
LB_5585:
	bts r12,6
LB_5586:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_5583
	btr QWORD [rdi],0
	jmp LB_5584
LB_5583:
	bts QWORD [rdi],0
LB_5584:
	mov rcx,r14
	bt r12,1
	jc LB_5589
	btr r12,6
	jmp LB_5590
LB_5589:
	bts r12,6
LB_5590:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_5587
	btr QWORD [rdi],1
	jmp LB_5588
LB_5587:
	bts QWORD [rdi],1
LB_5588:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_5581
	btr QWORD [rdi],0
	jmp LB_5582
LB_5581:
	bts QWORD [rdi],0
LB_5582:
	mov r13,r10
	bt r12,4
	jc LB_5593
	btr r12,0
	jmp LB_5594
LB_5593:
	bts r12,0
LB_5594:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_5591
	btr QWORD [rdi],1
	jmp LB_5592
LB_5591:
	bts QWORD [rdi],1
LB_5592:
	mov rsi,1
	bt r12,5
	jc LB_5579
	mov rsi,0
	bt r11,0
	jc LB_5579
	jmp LB_5580
LB_5579:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_5580:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_5577
	mov rsi,0
	bt r11,0
	jc LB_5577
	jmp LB_5578
LB_5577:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_5578:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_5575
	btr QWORD [rdi],1
	jmp LB_5576
LB_5575:
	bts QWORD [rdi],1
LB_5576:
	mov r8,0
	bts r12,2
	ret
LB_5595:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5597
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5596
LB_5597:
	add rsp,8
	ret
LB_5598:
	add rsp,112
	pop r14
LB_5596:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4676:
NS_E_RDI_4676:
NS_E_4676_ETR_TBL:
NS_E_4676_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_5699
LB_5698:
	add r14,1
LB_5699:
	cmp r14,r10
	jge LB_5700
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5698
	cmp al,10
	jz LB_5698
	cmp al,32
	jz LB_5698
LB_5700:
	add r14,3
	cmp r14,r10
	jg LB_5703
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5703
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_5703
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_5703
	jmp LB_5704
LB_5703:
	jmp LB_5685
LB_5704:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_5693
LB_5692:
	add r14,1
LB_5693:
	cmp r14,r10
	jge LB_5694
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5692
	cmp al,10
	jz LB_5692
	cmp al,32
	jz LB_5692
LB_5694:
	push r10
	call NS_E_4357_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5695
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5696
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5696:
	jmp LB_5686
LB_5695:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5689
	btr QWORD [rdi],1
LB_5689:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5690
	btr QWORD [rdi],0
LB_5690:
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
LB_5686:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5685:
	add rsp,32
	pop r14
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,[rdi]
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
LB_5687:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4677:
NS_E_RDI_4677:
NS_E_4677_ETR_TBL:
NS_E_4677_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_5758
LB_5757:
	add r14,1
LB_5758:
	cmp r14,r10
	jge LB_5759
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5757
	cmp al,10
	jz LB_5757
	cmp al,32
	jz LB_5757
LB_5759:
	add r14,1
	cmp r14,r10
	jg LB_5762
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_5762
	jmp LB_5763
LB_5762:
	jmp LB_5724
LB_5763:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_5735
LB_5734:
	add r14,1
LB_5735:
	cmp r14,r10
	jge LB_5736
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5734
	cmp al,10
	jz LB_5734
	cmp al,32
	jz LB_5734
LB_5736:
	add r14,1
	cmp r14,r10
	jg LB_5740
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_5740
	jmp LB_5741
LB_5740:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5738
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5738:
	jmp LB_5725
LB_5741:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_5743
LB_5742:
	add r14,1
LB_5743:
	cmp r14,r10
	jge LB_5744
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5742
	cmp al,10
	jz LB_5742
	cmp al,32
	jz LB_5742
LB_5744:
	push r10
	call NS_E_4674_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5745
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5746
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5746:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5747
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5747:
	jmp LB_5725
LB_5745:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_5750
LB_5749:
	add r14,1
LB_5750:
	cmp r14,r10
	jge LB_5751
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5749
	cmp al,10
	jz LB_5749
	cmp al,32
	jz LB_5749
LB_5751:
	push r10
	call NS_E_4677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5752
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5753
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5753:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5754
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5754:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5755
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5755:
	jmp LB_5725
LB_5752:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5732
	btr r12,3
	jmp LB_5733
LB_5732:
	bts r12,3
LB_5733:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5730
	btr r12,2
	jmp LB_5731
LB_5730:
	bts r12,2
LB_5731:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5728
	btr r12,1
	jmp LB_5729
LB_5728:
	bts r12,1
LB_5729:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5726
	btr r12,0
	jmp LB_5727
LB_5726:
	bts r12,0
LB_5727:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_5721
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_5764
	btr r12,4
	jmp LB_5765
LB_5764:
	bts r12,4
LB_5765:
	mov r8,r9
	bt r12,3
	jc LB_5766
	btr r12,2
	jmp LB_5767
LB_5766:
	bts r12,2
LB_5767:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_5770
	btr r12,3
	jmp LB_5771
LB_5770:
	bts r12,3
LB_5771:
	mov r13,r9
	bt r12,3
	jc LB_5768
	btr r12,0
	jmp LB_5769
LB_5768:
	bts r12,0
LB_5769:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_5774
	btr r12,3
	jmp LB_5775
LB_5774:
	bts r12,3
LB_5775:
	mov r14,r9
	bt r12,3
	jc LB_5772
	btr r12,1
	jmp LB_5773
LB_5772:
	bts r12,1
LB_5773:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_4784 %_4785 } ⊢ %_4786 : %_4786
 ; {>  %_4785~2':(_lst)◂({ _stg _p786 }) %_4784~{ 0' 1' }:{ _stg _p786 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_4786 ⊢ %_4787 : %_4787
 ; {>  %_4786~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p786 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_4787
 ; {>  %_4787~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p786 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_5711
	btr r12,5
	jmp LB_5712
LB_5711:
	bts r12,5
LB_5712:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_5709
	btr QWORD [rdi],0
	jmp LB_5710
LB_5709:
	bts QWORD [rdi],0
LB_5710:
	mov r11,r14
	bt r12,1
	jc LB_5715
	btr r12,5
	jmp LB_5716
LB_5715:
	bts r12,5
LB_5716:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_5713
	btr QWORD [rdi],1
	jmp LB_5714
LB_5713:
	bts QWORD [rdi],1
LB_5714:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_5707
	btr QWORD [rdi],0
	jmp LB_5708
LB_5707:
	bts QWORD [rdi],0
LB_5708:
	mov r10,r8
	bt r12,2
	jc LB_5719
	btr r12,4
	jmp LB_5720
LB_5719:
	bts r12,4
LB_5720:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_5717
	btr QWORD [rdi],1
	jmp LB_5718
LB_5717:
	bts QWORD [rdi],1
LB_5718:
	mov rsi,1
	bt r12,3
	jc LB_5705
	mov rsi,0
	bt r9,0
	jc LB_5705
	jmp LB_5706
LB_5705:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5706:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5721:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5723
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5722
LB_5723:
	add rsp,8
	ret
LB_5725:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5724:
	add rsp,64
	pop r14
LB_5722:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5778
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_4788 : %_4788
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4788 ⊢ %_4789 : %_4789
 ; {>  %_4788~°1◂{  }:(_lst)◂(t2101'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4789
 ; {>  %_4789~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2104'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5776
	mov rsi,0
	bt r9,0
	jc LB_5776
	jmp LB_5777
LB_5776:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5777:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5778:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5780
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5779
LB_5780:
	add rsp,8
	ret
LB_5781:
	add rsp,0
	pop r14
LB_5779:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4678:
NS_E_RDI_4678:
NS_E_4678_ETR_TBL:
NS_E_4678_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_5846
LB_5845:
	add r14,1
LB_5846:
	cmp r14,r10
	jge LB_5847
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5845
	cmp al,10
	jz LB_5845
	cmp al,32
	jz LB_5845
LB_5847:
	add r14,3
	cmp r14,r10
	jg LB_5850
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5850
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_5850
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_5850
	jmp LB_5851
LB_5850:
	jmp LB_5801
LB_5851:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_5814
LB_5813:
	add r14,1
LB_5814:
	cmp r14,r10
	jge LB_5815
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5813
	cmp al,10
	jz LB_5813
	cmp al,32
	jz LB_5813
LB_5815:
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5816
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5817
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5817:
	jmp LB_5802
LB_5816:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_5820
LB_5819:
	add r14,1
LB_5820:
	cmp r14,r10
	jge LB_5821
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5819
	cmp al,10
	jz LB_5819
	cmp al,32
	jz LB_5819
LB_5821:
	add r14,1
	cmp r14,r10
	jg LB_5826
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_5826
	jmp LB_5827
LB_5826:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5823
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5823:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5824
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5824:
	jmp LB_5802
LB_5827:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_5829
LB_5828:
	add r14,1
LB_5829:
	cmp r14,r10
	jge LB_5830
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5828
	cmp al,10
	jz LB_5828
	cmp al,32
	jz LB_5828
LB_5830:
	push r10
	call NS_E_4353_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5831
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5832
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5832:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5833
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5833:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5834
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5834:
	jmp LB_5802
LB_5831:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_5837
LB_5836:
	add r14,1
LB_5837:
	cmp r14,r10
	jge LB_5838
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5836
	cmp al,10
	jz LB_5836
	cmp al,32
	jz LB_5836
LB_5838:
	push r10
	call NS_E_4678_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5839
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5840
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5840:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5841
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5841:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5842
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5842:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5843
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5843:
	jmp LB_5802
LB_5839:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_5811
	btr r12,4
	jmp LB_5812
LB_5811:
	bts r12,4
LB_5812:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5809
	btr r12,3
	jmp LB_5810
LB_5809:
	bts r12,3
LB_5810:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5807
	btr r12,2
	jmp LB_5808
LB_5807:
	bts r12,2
LB_5808:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5805
	btr r12,1
	jmp LB_5806
LB_5805:
	bts r12,1
LB_5806:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5803
	btr r12,0
	jmp LB_5804
LB_5803:
	bts r12,0
LB_5804:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_5798
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_5852
	btr r12,5
	jmp LB_5853
LB_5852:
	bts r12,5
LB_5853:
	mov r8,r10
	bt r12,4
	jc LB_5854
	btr r12,2
	jmp LB_5855
LB_5854:
	bts r12,2
LB_5855:
	mov r10,r14
	bt r12,1
	jc LB_5856
	btr r12,4
	jmp LB_5857
LB_5856:
	bts r12,4
LB_5857:
	mov r14,r9
	bt r12,3
	jc LB_5858
	btr r12,1
	jmp LB_5859
LB_5858:
	bts r12,1
LB_5859:
	mov r9,r13
	bt r12,0
	jc LB_5860
	btr r12,3
	jmp LB_5861
LB_5860:
	bts r12,3
LB_5861:
	mov r13,r10
	bt r12,4
	jc LB_5862
	btr r12,0
	jmp LB_5863
LB_5862:
	bts r12,0
LB_5863:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_4790 %_4791 } %_4792 } ⊢ %_4793 : %_4793
 ; {>  %_4790~0':_stg %_4792~2':(_lst)◂({ _stg _p800 }) %_4791~1':_p800 }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_4793 ⊢ %_4794 : %_4794
 ; {>  %_4793~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p800 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_4794
 ; {>  %_4794~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p800 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_5788
	btr r12,5
	jmp LB_5789
LB_5788:
	bts r12,5
LB_5789:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_5786
	btr QWORD [rdi],0
	jmp LB_5787
LB_5786:
	bts QWORD [rdi],0
LB_5787:
	mov r11,r14
	bt r12,1
	jc LB_5792
	btr r12,5
	jmp LB_5793
LB_5792:
	bts r12,5
LB_5793:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_5790
	btr QWORD [rdi],1
	jmp LB_5791
LB_5790:
	bts QWORD [rdi],1
LB_5791:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_5784
	btr QWORD [rdi],0
	jmp LB_5785
LB_5784:
	bts QWORD [rdi],0
LB_5785:
	mov r10,r8
	bt r12,2
	jc LB_5796
	btr r12,4
	jmp LB_5797
LB_5796:
	bts r12,4
LB_5797:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_5794
	btr QWORD [rdi],1
	jmp LB_5795
LB_5794:
	bts QWORD [rdi],1
LB_5795:
	mov rsi,1
	bt r12,3
	jc LB_5782
	mov rsi,0
	bt r9,0
	jc LB_5782
	jmp LB_5783
LB_5782:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5783:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5798:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5800
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5799
LB_5800:
	add rsp,8
	ret
LB_5802:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5801:
	add rsp,80
	pop r14
LB_5799:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_5866
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_4795 : %_4795
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4795 ⊢ %_4796 : %_4796
 ; {>  %_4795~°1◂{  }:(_lst)◂(t2115'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4796
 ; {>  %_4796~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2118'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_5864
	mov rsi,0
	bt r9,0
	jc LB_5864
	jmp LB_5865
LB_5864:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5865:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5866:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5868
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5867
LB_5868:
	add rsp,8
	ret
LB_5869:
	add rsp,0
	pop r14
LB_5867:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4679:
NS_E_RDI_4679:
NS_E_4679_ETR_TBL:
NS_E_4679_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "@"
	jmp LB_5960
LB_5959:
	add r14,1
LB_5960:
	cmp r14,r10
	jge LB_5961
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5959
	cmp al,10
	jz LB_5959
	cmp al,32
	jz LB_5959
LB_5961:
	add r14,1
	cmp r14,r10
	jg LB_5964
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_5964
	jmp LB_5965
LB_5964:
	jmp LB_5907
LB_5965:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_5922
LB_5921:
	add r14,1
LB_5922:
	cmp r14,r10
	jge LB_5923
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5921
	cmp al,10
	jz LB_5921
	cmp al,32
	jz LB_5921
LB_5923:
	add r14,1
	cmp r14,r10
	jg LB_5927
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_5927
	jmp LB_5928
LB_5927:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5925
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5925:
	jmp LB_5908
LB_5928:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_5930
LB_5929:
	add r14,1
LB_5930:
	cmp r14,r10
	jge LB_5931
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5929
	cmp al,10
	jz LB_5929
	cmp al,32
	jz LB_5929
LB_5931:
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5932
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5933
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5933:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5934
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5934:
	jmp LB_5908
LB_5932:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_5937
LB_5936:
	add r14,1
LB_5937:
	cmp r14,r10
	jge LB_5938
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5936
	cmp al,10
	jz LB_5936
	cmp al,32
	jz LB_5936
LB_5938:
	push r10
	call NS_E_4083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5939
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5940
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5940:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5941
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5941:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5942
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5942:
	jmp LB_5908
LB_5939:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_5945
LB_5944:
	add r14,1
LB_5945:
	cmp r14,r10
	jge LB_5946
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5944
	cmp al,10
	jz LB_5944
	cmp al,32
	jz LB_5944
LB_5946:
	push r10
	call NS_E_4682_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5947
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5948
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5948:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5949
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5949:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5950
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5950:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5951
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5951:
	jmp LB_5908
LB_5947:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; ⟦ qlq_etr ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_5957:
	jmp LB_5954
LB_5953:
	add r14,1
LB_5954:
	cmp r14,r10
	jge LB_5955
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5953
	cmp al,10
	jz LB_5953
	cmp al,32
	jz LB_5953
LB_5955:
	push r10
	push rsi
	call NS_E_4680_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5956
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5958
	bts QWORD [rax],0
LB_5958:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5957
LB_5956:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_5919
	btr r12,5
	jmp LB_5920
LB_5919:
	bts r12,5
LB_5920:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_5917
	btr r12,4
	jmp LB_5918
LB_5917:
	bts r12,4
LB_5918:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5915
	btr r12,3
	jmp LB_5916
LB_5915:
	bts r12,3
LB_5916:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5913
	btr r12,2
	jmp LB_5914
LB_5913:
	bts r12,2
LB_5914:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5911
	btr r12,1
	jmp LB_5912
LB_5911:
	bts r12,1
LB_5912:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5909
	btr r12,0
	jmp LB_5910
LB_5909:
	bts r12,0
LB_5910:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_5904
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_5966
	btr r12,6
	jmp LB_5967
LB_5966:
	bts r12,6
LB_5967:
	mov r9,r11
	bt r12,5
	jc LB_5968
	btr r12,3
	jmp LB_5969
LB_5968:
	bts r12,3
LB_5969:
	mov r11,r8
	bt r12,2
	jc LB_5970
	btr r12,5
	jmp LB_5971
LB_5970:
	bts r12,5
LB_5971:
	mov r8,r10
	bt r12,4
	jc LB_5972
	btr r12,2
	jmp LB_5973
LB_5972:
	bts r12,2
LB_5973:
	mov r10,r14
	bt r12,1
	jc LB_5974
	btr r12,4
	jmp LB_5975
LB_5974:
	bts r12,4
LB_5975:
	mov r14,rcx
	bt r12,6
	jc LB_5976
	btr r12,1
	jmp LB_5977
LB_5976:
	bts r12,1
LB_5977:
	mov rcx,r13
	bt r12,0
	jc LB_5978
	btr r12,6
	jmp LB_5979
LB_5978:
	bts r12,6
LB_5979:
	mov r13,r11
	bt r12,5
	jc LB_5980
	btr r12,0
	jmp LB_5981
LB_5980:
	bts r12,0
LB_5981:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f121 %_4800 ⊢ %_4801 : %_4801
 ; {>  %_4800~3':(_lst)◂({ _stg _p799 _p802 }) %_4798~1':_p799 %_4799~2':_p802 %_4797~0':_stg }
; _f121 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_5876
	btr r12,0
	jmp LB_5877
LB_5876:
	bts r12,0
LB_5877:
	call NS_E_121
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_5878
	btr r12,3
	jmp LB_5879
LB_5878:
	bts r12,3
LB_5879:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_5874
	btr r12,2
	jmp LB_5875
LB_5874:
	bts r12,2
LB_5875:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_5872
	btr r12,1
	jmp LB_5873
LB_5872:
	bts r12,1
LB_5873:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_5870
	btr r12,0
	jmp LB_5871
LB_5870:
	bts r12,0
LB_5871:
	add rsp,32
; _cns { { %_4797 %_4798 %_4799 } %_4801 } ⊢ %_4802 : %_4802
 ; {>  %_4798~1':_p799 %_4799~2':_p802 %_4797~0':_stg %_4801~3':(_lst)◂({ _stg _p799 _p802 }) }
; _cns { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _f813 %_4802 ⊢ %_4803 : %_4803
 ; {>  %_4802~°0◂{ { 0' 1' 2' } 3' }:(_lst)◂({ _stg _p799 _p802 }) }
; _f813 °0◂{ { 0' 1' 2' } 3' } ⊢ °3◂°0◂{ { 0' 1' 2' } 3' }
; _some %_4803 ⊢ %_4804 : %_4804
 ; {>  %_4803~°3◂°0◂{ { 0' 1' 2' } 3' }:_p783 }
; _some °3◂°0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_4804
 ; {>  %_4804~°0◂°3◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p783) }
; 	∎ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°3◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_5880
	btr r12,4
	jmp LB_5881
LB_5880:
	bts r12,4
LB_5881:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_5890
	btr r12,6
	jmp LB_5891
LB_5890:
	bts r12,6
LB_5891:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_5888
	btr QWORD [rdi],0
	jmp LB_5889
LB_5888:
	bts QWORD [rdi],0
LB_5889:
	mov rcx,r14
	bt r12,1
	jc LB_5894
	btr r12,6
	jmp LB_5895
LB_5894:
	bts r12,6
LB_5895:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_5892
	btr QWORD [rdi],1
	jmp LB_5893
LB_5892:
	bts QWORD [rdi],1
LB_5893:
	mov rcx,r8
	bt r12,2
	jc LB_5898
	btr r12,6
	jmp LB_5899
LB_5898:
	bts r12,6
LB_5899:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_5896
	btr QWORD [rdi],2
	jmp LB_5897
LB_5896:
	bts QWORD [rdi],2
LB_5897:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_5886
	btr QWORD [rdi],0
	jmp LB_5887
LB_5886:
	bts QWORD [rdi],0
LB_5887:
	mov r11,r10
	bt r12,4
	jc LB_5902
	btr r12,5
	jmp LB_5903
LB_5902:
	bts r12,5
LB_5903:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_5900
	btr QWORD [rdi],1
	jmp LB_5901
LB_5900:
	bts QWORD [rdi],1
LB_5901:
	mov rsi,1
	bt r12,3
	jc LB_5884
	mov rsi,0
	bt r9,0
	jc LB_5884
	jmp LB_5885
LB_5884:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5885:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_5882
	mov rsi,0
	bt r9,0
	jc LB_5882
	jmp LB_5883
LB_5882:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5883:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5904:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5906
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5905
LB_5906:
	add rsp,8
	ret
LB_5908:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5907:
	add rsp,96
	pop r14
LB_5905:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_6001
LB_6000:
	add r14,1
LB_6001:
	cmp r14,r10
	jge LB_6002
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6000
	cmp al,10
	jz LB_6000
	cmp al,32
	jz LB_6000
LB_6002:
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6003
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5995
LB_6003:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_6006
LB_6005:
	add r14,1
LB_6006:
	cmp r14,r10
	jge LB_6007
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6005
	cmp al,10
	jz LB_6005
	cmp al,32
	jz LB_6005
LB_6007:
	push r10
	call NS_E_4681_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6008
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6009
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6009:
	jmp LB_5995
LB_6008:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5998
	btr r12,1
	jmp LB_5999
LB_5998:
	bts r12,1
LB_5999:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5996
	btr r12,0
	jmp LB_5997
LB_5996:
	bts r12,0
LB_5997:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_5992
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f812 { %_4805 %_4806 } ⊢ %_4807 : %_4807
 ; {>  %_4805~0':_stg %_4806~1':_p785 }
; _f812 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_4807 ⊢ %_4808 : %_4808
 ; {>  %_4807~°2◂{ 0' 1' }:_p783 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_4808
 ; {>  %_4808~°0◂°2◂{ 0' 1' }:(_opn)◂(_p783) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_5986
	btr r12,2
	jmp LB_5987
LB_5986:
	bts r12,2
LB_5987:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_5984
	btr QWORD [rdi],0
	jmp LB_5985
LB_5984:
	bts QWORD [rdi],0
LB_5985:
	mov r8,r14
	bt r12,1
	jc LB_5990
	btr r12,2
	jmp LB_5991
LB_5990:
	bts r12,2
LB_5991:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_5988
	btr QWORD [rdi],1
	jmp LB_5989
LB_5988:
	bts QWORD [rdi],1
LB_5989:
	mov rsi,1
	bt r12,3
	jc LB_5982
	mov rsi,0
	bt r9,0
	jc LB_5982
	jmp LB_5983
LB_5982:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_5983:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_5992:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_5994
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_5993
LB_5994:
	add rsp,8
	ret
LB_5995:
	add rsp,32
	pop r14
LB_5993:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_6012
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "lc_etr_body 0" _ ⊢ 0' : %_4809
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f38 %_4809 ⊢ %_4810 : %_4810
 ; {>  %_4809~0':_stg }
; _f38 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_4811 : %_4811
 ; {>  %_4810~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_4811
 ; {>  %_4811~°1◂{  }:(_opn)◂(t2141'(0)) %_4810~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_6011
	mov rdi,r13
	call dlt
LB_6011:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_6012:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6014
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6013
LB_6014:
	add rsp,8
	ret
LB_6015:
	add rsp,0
	pop r14
LB_6013:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4680:
NS_E_RDI_4680:
NS_E_4680_ETR_TBL:
NS_E_4680_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "@"
	jmp LB_6043
LB_6042:
	add r14,1
LB_6043:
	cmp r14,r10
	jge LB_6044
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6042
	cmp al,10
	jz LB_6042
	cmp al,32
	jz LB_6042
LB_6044:
	add r14,1
	cmp r14,r10
	jg LB_6047
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6047
	jmp LB_6048
LB_6047:
	jmp LB_6031
LB_6048:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6050
LB_6049:
	add r14,1
LB_6050:
	cmp r14,r10
	jge LB_6051
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6049
	cmp al,10
	jz LB_6049
	cmp al,32
	jz LB_6049
LB_6051:
	add r14,1
	cmp r14,r10
	jg LB_6055
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6055
	jmp LB_6056
LB_6055:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6053
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6053:
	jmp LB_6031
LB_6056:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_6058
LB_6057:
	add r14,1
LB_6058:
	cmp r14,r10
	jge LB_6059
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6057
	cmp al,10
	jz LB_6057
	cmp al,32
	jz LB_6057
LB_6059:
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6060
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6061
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6061:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6062
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6062:
	jmp LB_6031
LB_6060:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_6065
LB_6064:
	add r14,1
LB_6065:
	cmp r14,r10
	jge LB_6066
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6064
	cmp al,10
	jz LB_6064
	cmp al,32
	jz LB_6064
LB_6066:
	push r10
	call NS_E_4083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6067
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6068
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6068:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6069
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6069:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6070
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6070:
	jmp LB_6031
LB_6067:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_6073
LB_6072:
	add r14,1
LB_6073:
	cmp r14,r10
	jge LB_6074
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6072
	cmp al,10
	jz LB_6072
	cmp al,32
	jz LB_6072
LB_6074:
	push r10
	call NS_E_4682_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6075
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6076
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6076:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6077
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6077:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6078
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6078:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6079
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6079:
	jmp LB_6031
LB_6075:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6040
	btr r12,4
	jmp LB_6041
LB_6040:
	bts r12,4
LB_6041:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6038
	btr r12,3
	jmp LB_6039
LB_6038:
	bts r12,3
LB_6039:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6036
	btr r12,2
	jmp LB_6037
LB_6036:
	bts r12,2
LB_6037:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6034
	btr r12,1
	jmp LB_6035
LB_6034:
	bts r12,1
LB_6035:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6032
	btr r12,0
	jmp LB_6033
LB_6032:
	bts r12,0
LB_6033:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_6028
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_6081
	btr r12,5
	jmp LB_6082
LB_6081:
	bts r12,5
LB_6082:
	mov r8,r10
	bt r12,4
	jc LB_6083
	btr r12,2
	jmp LB_6084
LB_6083:
	bts r12,2
LB_6084:
	mov r10,r14
	bt r12,1
	jc LB_6085
	btr r12,4
	jmp LB_6086
LB_6085:
	bts r12,4
LB_6086:
	mov r14,r9
	bt r12,3
	jc LB_6087
	btr r12,1
	jmp LB_6088
LB_6087:
	bts r12,1
LB_6088:
	mov r9,r13
	bt r12,0
	jc LB_6089
	btr r12,3
	jmp LB_6090
LB_6089:
	bts r12,3
LB_6090:
	mov r13,r11
	bt r12,5
	jc LB_6091
	btr r12,0
	jmp LB_6092
LB_6091:
	bts r12,0
LB_6092:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_4812 %_4813 %_4814 } ⊢ %_4815 : %_4815
 ; {>  %_4814~2':_p802 %_4812~0':_stg %_4813~1':_p799 }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_4815
 ; {>  %_4815~°0◂{ 0' 1' 2' }:(_opn)◂({ _stg _p799 _p802 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_6018
	btr r12,4
	jmp LB_6019
LB_6018:
	bts r12,4
LB_6019:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6016
	btr QWORD [rdi],0
	jmp LB_6017
LB_6016:
	bts QWORD [rdi],0
LB_6017:
	mov r10,r14
	bt r12,1
	jc LB_6022
	btr r12,4
	jmp LB_6023
LB_6022:
	bts r12,4
LB_6023:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6020
	btr QWORD [rdi],1
	jmp LB_6021
LB_6020:
	bts QWORD [rdi],1
LB_6021:
	mov r10,r8
	bt r12,2
	jc LB_6026
	btr r12,4
	jmp LB_6027
LB_6026:
	bts r12,4
LB_6027:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_6024
	btr QWORD [rdi],2
	jmp LB_6025
LB_6024:
	bts QWORD [rdi],2
LB_6025:
	mov r8,0
	bts r12,2
	ret
LB_6028:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6030
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6029
LB_6030:
	add rsp,8
	ret
LB_6031:
	add rsp,80
	pop r14
LB_6029:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4681:
NS_E_RDI_4681:
NS_E_4681_ETR_TBL:
NS_E_4681_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_6113
LB_6112:
	add r14,1
LB_6113:
	cmp r14,r10
	jge LB_6114
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6112
	cmp al,10
	jz LB_6112
	cmp al,32
	jz LB_6112
LB_6114:
	add r14,1
	cmp r14,r10
	jg LB_6117
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6117
	jmp LB_6118
LB_6117:
	jmp LB_6100
LB_6118:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_6107
LB_6106:
	add r14,1
LB_6107:
	cmp r14,r10
	jge LB_6108
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6106
	cmp al,10
	jz LB_6106
	cmp al,32
	jz LB_6106
LB_6108:
	push r10
	call NS_E_3690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6109
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6110
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6110:
	jmp LB_6101
LB_6109:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6104
	btr r12,1
	jmp LB_6105
LB_6104:
	bts r12,1
LB_6105:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6102
	btr r12,0
	jmp LB_6103
LB_6102:
	bts r12,0
LB_6103:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6097
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6119
	btr r12,2
	jmp LB_6120
LB_6119:
	bts r12,2
LB_6120:
	mov r13,r14
	bt r12,1
	jc LB_6121
	btr r12,0
	jmp LB_6122
LB_6121:
	bts r12,0
LB_6122:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f819 %_4816 ⊢ %_4817 : %_4817
 ; {>  %_4816~0':_p801 }
; _f819 0' ⊢ °1◂0'
; _some %_4817 ⊢ %_4818 : %_4818
 ; {>  %_4817~°1◂0':_p785 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4818
 ; {>  %_4818~°0◂°1◂0':(_opn)◂(_p785) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6095
	btr r12,3
	jmp LB_6096
LB_6095:
	bts r12,3
LB_6096:
	mov rsi,1
	bt r12,3
	jc LB_6093
	mov rsi,0
	bt r9,0
	jc LB_6093
	jmp LB_6094
LB_6093:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6094:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6097:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6099
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6098
LB_6099:
	add rsp,8
	ret
LB_6101:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6100:
	add rsp,32
	pop r14
LB_6098:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_6143
LB_6142:
	add r14,1
LB_6143:
	cmp r14,r10
	jge LB_6144
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6142
	cmp al,10
	jz LB_6142
	cmp al,32
	jz LB_6142
LB_6144:
	add r14,2
	cmp r14,r10
	jg LB_6147
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6147
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_6147
	jmp LB_6148
LB_6147:
	jmp LB_6130
LB_6148:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_6137
LB_6136:
	add r14,1
LB_6137:
	cmp r14,r10
	jge LB_6138
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6136
	cmp al,10
	jz LB_6136
	cmp al,32
	jz LB_6136
LB_6138:
	push r10
	call NS_E_4682_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6139
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6140
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6140:
	jmp LB_6131
LB_6139:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6134
	btr r12,1
	jmp LB_6135
LB_6134:
	bts r12,1
LB_6135:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6132
	btr r12,0
	jmp LB_6133
LB_6132:
	bts r12,0
LB_6133:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6127
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6149
	btr r12,2
	jmp LB_6150
LB_6149:
	bts r12,2
LB_6150:
	mov r13,r14
	bt r12,1
	jc LB_6151
	btr r12,0
	jmp LB_6152
LB_6151:
	bts r12,0
LB_6152:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f820 %_4819 ⊢ %_4820 : %_4820
 ; {>  %_4819~0':_p802 }
; _f820 0' ⊢ °2◂0'
; _some %_4820 ⊢ %_4821 : %_4821
 ; {>  %_4820~°2◂0':_p785 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_4821
 ; {>  %_4821~°0◂°2◂0':(_opn)◂(_p785) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6125
	btr r12,3
	jmp LB_6126
LB_6125:
	bts r12,3
LB_6126:
	mov rsi,1
	bt r12,3
	jc LB_6123
	mov rsi,0
	bt r9,0
	jc LB_6123
	jmp LB_6124
LB_6123:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6124:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6127:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6129
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6128
LB_6129:
	add rsp,8
	ret
LB_6131:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6130:
	add rsp,32
	pop r14
LB_6128:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_6172
LB_6171:
	add r14,1
LB_6172:
	cmp r14,r10
	jge LB_6173
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6171
	cmp al,10
	jz LB_6171
	cmp al,32
	jz LB_6171
LB_6173:
	push r10
	call NS_E_4083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6174
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6166
LB_6174:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_6177
LB_6176:
	add r14,1
LB_6177:
	cmp r14,r10
	jge LB_6178
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6176
	cmp al,10
	jz LB_6176
	cmp al,32
	jz LB_6176
LB_6178:
	push r10
	call NS_E_4682_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6179
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6180
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6180:
	jmp LB_6166
LB_6179:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6169
	btr r12,1
	jmp LB_6170
LB_6169:
	bts r12,1
LB_6170:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6167
	btr r12,0
	jmp LB_6168
LB_6167:
	bts r12,0
LB_6168:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6163
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f818 { %_4822 %_4823 } ⊢ %_4824 : %_4824
 ; {>  %_4822~0':_p799 %_4823~1':_p802 }
; _f818 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4824 ⊢ %_4825 : %_4825
 ; {>  %_4824~°0◂{ 0' 1' }:_p785 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4825
 ; {>  %_4825~°0◂°0◂{ 0' 1' }:(_opn)◂(_p785) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_6157
	btr r12,2
	jmp LB_6158
LB_6157:
	bts r12,2
LB_6158:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6155
	btr QWORD [rdi],0
	jmp LB_6156
LB_6155:
	bts QWORD [rdi],0
LB_6156:
	mov r8,r14
	bt r12,1
	jc LB_6161
	btr r12,2
	jmp LB_6162
LB_6161:
	bts r12,2
LB_6162:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6159
	btr QWORD [rdi],1
	jmp LB_6160
LB_6159:
	bts QWORD [rdi],1
LB_6160:
	mov rsi,1
	bt r12,3
	jc LB_6153
	mov rsi,0
	bt r9,0
	jc LB_6153
	jmp LB_6154
LB_6153:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6154:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6163:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6165
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6164
LB_6165:
	add rsp,8
	ret
LB_6166:
	add rsp,32
	pop r14
LB_6164:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4682:
NS_E_RDI_4682:
NS_E_4682_ETR_TBL:
NS_E_4682_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_6202
LB_6201:
	add r14,1
LB_6202:
	cmp r14,r10
	jge LB_6203
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6201
	cmp al,10
	jz LB_6201
	cmp al,32
	jz LB_6201
LB_6203:
	add r14,3
	cmp r14,r10
	jg LB_6206
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6206
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6206
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_6206
	jmp LB_6207
LB_6206:
	jmp LB_6189
LB_6207:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_6196
LB_6195:
	add r14,1
LB_6196:
	cmp r14,r10
	jge LB_6197
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6195
	cmp al,10
	jz LB_6195
	cmp al,32
	jz LB_6195
LB_6197:
	push r10
	call NS_E_3819_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6198
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6199
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6199:
	jmp LB_6190
LB_6198:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6193
	btr r12,1
	jmp LB_6194
LB_6193:
	bts r12,1
LB_6194:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6191
	btr r12,0
	jmp LB_6192
LB_6191:
	bts r12,0
LB_6192:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6186
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_6208
	btr r12,2
	jmp LB_6209
LB_6208:
	bts r12,2
LB_6209:
	mov r13,r14
	bt r12,1
	jc LB_6210
	btr r12,0
	jmp LB_6211
LB_6210:
	bts r12,0
LB_6211:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f861 %_4826 ⊢ %_4827 : %_4827
 ; {>  %_4826~0':_p798 }
; _f861 0' ⊢ °2◂0'
; _some %_4827 ⊢ %_4828 : %_4828
 ; {>  %_4827~°2◂0':_p802 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_4828
 ; {>  %_4828~°0◂°2◂0':(_opn)◂(_p802) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6184
	btr r12,3
	jmp LB_6185
LB_6184:
	bts r12,3
LB_6185:
	mov rsi,1
	bt r12,3
	jc LB_6182
	mov rsi,0
	bt r9,0
	jc LB_6182
	jmp LB_6183
LB_6182:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6183:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6186:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6188
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6187
LB_6188:
	add rsp,8
	ret
LB_6190:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6189:
	add rsp,32
	pop r14
LB_6187:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_6223
LB_6222:
	add r14,1
LB_6223:
	cmp r14,r10
	jge LB_6224
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6222
	cmp al,10
	jz LB_6222
	cmp al,32
	jz LB_6222
LB_6224:
	push r10
	call NS_E_4691_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6225
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6219
LB_6225:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6220
	btr r12,0
	jmp LB_6221
LB_6220:
	bts r12,0
LB_6221:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6216
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f860 %_4829 ⊢ %_4830 : %_4830
 ; {>  %_4829~0':_p803 }
; _f860 0' ⊢ °1◂0'
; _some %_4830 ⊢ %_4831 : %_4831
 ; {>  %_4830~°1◂0':_p802 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4831
 ; {>  %_4831~°0◂°1◂0':(_opn)◂(_p802) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6214
	btr r12,3
	jmp LB_6215
LB_6214:
	bts r12,3
LB_6215:
	mov rsi,1
	bt r12,3
	jc LB_6212
	mov rsi,0
	bt r9,0
	jc LB_6212
	jmp LB_6213
LB_6212:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6213:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6216:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6218
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6217
LB_6218:
	add rsp,8
	ret
LB_6219:
	add rsp,16
	pop r14
LB_6217:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; lc_line
	jmp LB_6258
LB_6257:
	add r14,1
LB_6258:
	cmp r14,r10
	jge LB_6259
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6257
	cmp al,10
	jz LB_6257
	cmp al,32
	jz LB_6257
LB_6259:
	push r10
	call NS_E_4683_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6260
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6252
LB_6260:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_6263
LB_6262:
	add r14,1
LB_6263:
	cmp r14,r10
	jge LB_6264
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6262
	cmp al,10
	jz LB_6262
	cmp al,32
	jz LB_6262
LB_6264:
	push r10
	call NS_E_4682_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6265
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6266
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6266:
	jmp LB_6252
LB_6265:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6255
	btr r12,1
	jmp LB_6256
LB_6255:
	bts r12,1
LB_6256:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6253
	btr r12,0
	jmp LB_6254
LB_6253:
	bts r12,0
LB_6254:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6249
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' 2' } 3' }
	mov r9,r14
	bt r12,1
	jc LB_6268
	btr r12,3
	jmp LB_6269
LB_6268:
	bts r12,3
LB_6269:
	mov r10,r13
	bt r12,0
	jc LB_6270
	btr r12,4
	jmp LB_6271
LB_6270:
	bts r12,4
LB_6271:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_6274
	btr r12,5
	jmp LB_6275
LB_6274:
	bts r12,5
LB_6275:
	mov r13,r11
	bt r12,5
	jc LB_6272
	btr r12,0
	jmp LB_6273
LB_6272:
	bts r12,0
LB_6273:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_6278
	btr r12,5
	jmp LB_6279
LB_6278:
	bts r12,5
LB_6279:
	mov r14,r11
	bt r12,5
	jc LB_6276
	btr r12,1
	jmp LB_6277
LB_6276:
	bts r12,1
LB_6277:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_6282
	btr r12,5
	jmp LB_6283
LB_6282:
	bts r12,5
LB_6283:
	mov r8,r11
	bt r12,5
	jc LB_6280
	btr r12,2
	jmp LB_6281
LB_6280:
	bts r12,2
LB_6281:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f859 { %_4832 %_4833 } ⊢ %_4834 : %_4834
 ; {>  %_4832~{ 0' 1' 2' }:{ _p807 _p798 _p799 } %_4833~3':_p802 }
; _f859 { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _some %_4834 ⊢ %_4835 : %_4835
 ; {>  %_4834~°0◂{ { 0' 1' 2' } 3' }:_p802 }
; _some °0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_4835
 ; {>  %_4835~°0◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p802) }
; 	∎ °0◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_6227
	btr r12,4
	jmp LB_6228
LB_6227:
	bts r12,4
LB_6228:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_6235
	btr r12,6
	jmp LB_6236
LB_6235:
	bts r12,6
LB_6236:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_6233
	btr QWORD [rdi],0
	jmp LB_6234
LB_6233:
	bts QWORD [rdi],0
LB_6234:
	mov rcx,r14
	bt r12,1
	jc LB_6239
	btr r12,6
	jmp LB_6240
LB_6239:
	bts r12,6
LB_6240:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_6237
	btr QWORD [rdi],1
	jmp LB_6238
LB_6237:
	bts QWORD [rdi],1
LB_6238:
	mov rcx,r8
	bt r12,2
	jc LB_6243
	btr r12,6
	jmp LB_6244
LB_6243:
	bts r12,6
LB_6244:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_6241
	btr QWORD [rdi],2
	jmp LB_6242
LB_6241:
	bts QWORD [rdi],2
LB_6242:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_6231
	btr QWORD [rdi],0
	jmp LB_6232
LB_6231:
	bts QWORD [rdi],0
LB_6232:
	mov r11,r10
	bt r12,4
	jc LB_6247
	btr r12,5
	jmp LB_6248
LB_6247:
	bts r12,5
LB_6248:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_6245
	btr QWORD [rdi],1
	jmp LB_6246
LB_6245:
	bts QWORD [rdi],1
LB_6246:
	mov rsi,1
	bt r12,3
	jc LB_6229
	mov rsi,0
	bt r9,0
	jc LB_6229
	jmp LB_6230
LB_6229:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6230:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6249:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6251
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6250
LB_6251:
	add rsp,8
	ret
LB_6252:
	add rsp,32
	pop r14
LB_6250:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4683:
NS_E_RDI_4683:
NS_E_4683_ETR_TBL:
NS_E_4683_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "$"
	jmp LB_6349
LB_6348:
	add r14,1
LB_6349:
	cmp r14,r10
	jge LB_6350
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6348
	cmp al,10
	jz LB_6348
	cmp al,32
	jz LB_6348
LB_6350:
	add r14,1
	cmp r14,r10
	jg LB_6353
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_6353
	jmp LB_6354
LB_6353:
	jmp LB_6304
LB_6354:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_6317
LB_6316:
	add r14,1
LB_6317:
	cmp r14,r10
	jge LB_6318
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6316
	cmp al,10
	jz LB_6316
	cmp al,32
	jz LB_6316
LB_6318:
	push r10
	call NS_E_3819_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6319
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6320
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6320:
	jmp LB_6305
LB_6319:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_6323
LB_6322:
	add r14,1
LB_6323:
	cmp r14,r10
	jge LB_6324
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6322
	cmp al,10
	jz LB_6322
	cmp al,32
	jz LB_6322
LB_6324:
	add r14,3
	cmp r14,r10
	jg LB_6329
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6329
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6329
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6329
	jmp LB_6330
LB_6329:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6326
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6326:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6327
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6327:
	jmp LB_6305
LB_6330:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_6332
LB_6331:
	add r14,1
LB_6332:
	cmp r14,r10
	jge LB_6333
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6331
	cmp al,10
	jz LB_6331
	cmp al,32
	jz LB_6331
LB_6333:
	push r10
	call NS_E_4083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6334
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6335
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6335:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6336
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6336:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6337
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6337:
	jmp LB_6305
LB_6334:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_6340
LB_6339:
	add r14,1
LB_6340:
	cmp r14,r10
	jge LB_6341
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6339
	cmp al,10
	jz LB_6339
	cmp al,32
	jz LB_6339
LB_6341:
	push r10
	call NS_E_4086_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6342
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6343
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6343:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6344
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6344:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6345
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6345:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6346
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6346:
	jmp LB_6305
LB_6342:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6314
	btr r12,4
	jmp LB_6315
LB_6314:
	bts r12,4
LB_6315:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6312
	btr r12,3
	jmp LB_6313
LB_6312:
	bts r12,3
LB_6313:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6310
	btr r12,2
	jmp LB_6311
LB_6310:
	bts r12,2
LB_6311:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6308
	btr r12,1
	jmp LB_6309
LB_6308:
	bts r12,1
LB_6309:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6306
	btr r12,0
	jmp LB_6307
LB_6306:
	bts r12,0
LB_6307:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_6301
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_6355
	btr r12,5
	jmp LB_6356
LB_6355:
	bts r12,5
LB_6356:
	mov r8,r10
	bt r12,4
	jc LB_6357
	btr r12,2
	jmp LB_6358
LB_6357:
	bts r12,2
LB_6358:
	mov r10,r14
	bt r12,1
	jc LB_6359
	btr r12,4
	jmp LB_6360
LB_6359:
	bts r12,4
LB_6360:
	mov r14,r9
	bt r12,3
	jc LB_6361
	btr r12,1
	jmp LB_6362
LB_6361:
	bts r12,1
LB_6362:
	mov r9,r13
	bt r12,0
	jc LB_6363
	btr r12,3
	jmp LB_6364
LB_6363:
	bts r12,3
LB_6364:
	mov r13,r10
	bt r12,4
	jc LB_6365
	btr r12,0
	jmp LB_6366
LB_6365:
	bts r12,0
LB_6366:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_4839 : %_4839
 ; {>  %_4838~2':_p4085 %_4837~1':_p799 %_4836~0':_p798 }
; 	» 0xr1 _ ⊢ 3' : %_4839
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f871 %_4839 ⊢ %_4840 : %_4840
 ; {>  %_4839~3':_r64 %_4838~2':_p4085 %_4837~1':_p799 %_4836~0':_p798 }
; _f871 3' ⊢ °1◂3'
; _some { %_4840 %_4836 %_4837 } ⊢ %_4841 : %_4841
 ; {>  %_4838~2':_p4085 %_4837~1':_p799 %_4840~°1◂3':_p807 %_4836~0':_p798 }
; _some { °1◂3' 0' 1' } ⊢ °0◂{ °1◂3' 0' 1' }
; ∎ %_4841
 ; {>  %_4841~°0◂{ °1◂3' 0' 1' }:(_opn)◂({ _p807 _p798 _p799 }) %_4838~2':_p4085 }
; 	∎ °0◂{ °1◂3' 0' 1' }
	bt r12,2
	jc LB_6284
	mov rdi,r8
	call dlt
LB_6284:
; _emt_mov_ptn_to_ptn:{| 11010.. |},°0◂{ °1◂3' 0' 1' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_6285
	btr r12,4
	jmp LB_6286
LB_6285:
	bts r12,4
LB_6286:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r10
	bt r12,4
	jc LB_6291
	btr r12,2
	jmp LB_6292
LB_6291:
	bts r12,2
LB_6292:
	mov rsi,1
	bt r12,2
	jc LB_6289
	mov rsi,0
	bt r8,0
	jc LB_6289
	jmp LB_6290
LB_6289:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_6290:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6287
	btr QWORD [rdi],0
	jmp LB_6288
LB_6287:
	bts QWORD [rdi],0
LB_6288:
	mov r8,r13
	bt r12,0
	jc LB_6295
	btr r12,2
	jmp LB_6296
LB_6295:
	bts r12,2
LB_6296:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6293
	btr QWORD [rdi],1
	jmp LB_6294
LB_6293:
	bts QWORD [rdi],1
LB_6294:
	mov r8,r14
	bt r12,1
	jc LB_6299
	btr r12,2
	jmp LB_6300
LB_6299:
	bts r12,2
LB_6300:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_6297
	btr QWORD [rdi],2
	jmp LB_6298
LB_6297:
	bts QWORD [rdi],2
LB_6298:
	mov r8,0
	bts r12,2
	ret
LB_6301:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6303
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6302
LB_6303:
	add rsp,8
	ret
LB_6305:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6304:
	add rsp,80
	pop r14
LB_6302:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_6459
LB_6458:
	add r14,1
LB_6459:
	cmp r14,r10
	jge LB_6460
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6458
	cmp al,10
	jz LB_6458
	cmp al,32
	jz LB_6458
LB_6460:
	add r14,3
	cmp r14,r10
	jg LB_6463
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6463
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_6463
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_6463
	jmp LB_6464
LB_6463:
	jmp LB_6400
LB_6464:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_6415
LB_6414:
	add r14,1
LB_6415:
	cmp r14,r10
	jge LB_6416
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6414
	cmp al,10
	jz LB_6414
	cmp al,32
	jz LB_6414
LB_6416:
	push r10
	call NS_E_3819_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6417
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6418
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6418:
	jmp LB_6401
LB_6417:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_6421
LB_6420:
	add r14,1
LB_6421:
	cmp r14,r10
	jge LB_6422
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6420
	cmp al,10
	jz LB_6420
	cmp al,32
	jz LB_6420
LB_6422:
	add r14,1
	cmp r14,r10
	jg LB_6427
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_6427
	jmp LB_6428
LB_6427:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6424
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6424:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6425
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6425:
	jmp LB_6401
LB_6428:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_6430
LB_6429:
	add r14,1
LB_6430:
	cmp r14,r10
	jge LB_6431
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6429
	cmp al,10
	jz LB_6429
	cmp al,32
	jz LB_6429
LB_6431:
	push r10
	call NS_E_3819_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6432
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6433
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6433:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6434
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6434:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6435
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6435:
	jmp LB_6401
LB_6432:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_6438
LB_6437:
	add r14,1
LB_6438:
	cmp r14,r10
	jge LB_6439
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6437
	cmp al,10
	jz LB_6437
	cmp al,32
	jz LB_6437
LB_6439:
	add r14,3
	cmp r14,r10
	jg LB_6446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6446
	jmp LB_6447
LB_6446:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6441
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6441:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6442
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6442:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6443
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6443:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6444
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6444:
	jmp LB_6401
LB_6447:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_6449
LB_6448:
	add r14,1
LB_6449:
	cmp r14,r10
	jge LB_6450
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6448
	cmp al,10
	jz LB_6448
	cmp al,32
	jz LB_6448
LB_6450:
	push r10
	call NS_E_4083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6451
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_6452
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_6452:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6453
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6453:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6454
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6454:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6455
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6455:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6456
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6456:
	jmp LB_6401
LB_6451:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_6412
	btr r12,5
	jmp LB_6413
LB_6412:
	bts r12,5
LB_6413:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6410
	btr r12,4
	jmp LB_6411
LB_6410:
	bts r12,4
LB_6411:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6408
	btr r12,3
	jmp LB_6409
LB_6408:
	bts r12,3
LB_6409:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6406
	btr r12,2
	jmp LB_6407
LB_6406:
	bts r12,2
LB_6407:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6404
	btr r12,1
	jmp LB_6405
LB_6404:
	bts r12,1
LB_6405:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6402
	btr r12,0
	jmp LB_6403
LB_6402:
	bts r12,0
LB_6403:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_6397
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_6465
	btr r12,6
	jmp LB_6466
LB_6465:
	bts r12,6
LB_6466:
	mov r8,r11
	bt r12,5
	jc LB_6467
	btr r12,2
	jmp LB_6468
LB_6467:
	bts r12,2
LB_6468:
	mov r11,r14
	bt r12,1
	jc LB_6469
	btr r12,5
	jmp LB_6470
LB_6469:
	bts r12,5
LB_6470:
	mov r14,r9
	bt r12,3
	jc LB_6471
	btr r12,1
	jmp LB_6472
LB_6471:
	bts r12,1
LB_6472:
	mov r9,r13
	bt r12,0
	jc LB_6473
	btr r12,3
	jmp LB_6474
LB_6473:
	bts r12,3
LB_6474:
	mov r13,r11
	bt r12,5
	jc LB_6475
	btr r12,0
	jmp LB_6476
LB_6475:
	bts r12,0
LB_6476:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f872 {  } ⊢ %_4845 : %_4845
 ; {>  %_4844~2':_p799 %_4842~0':_p798 %_4843~1':_p798 }
; _f872 {  } ⊢ °2◂{  }
; _nil {  } ⊢ %_4846 : %_4846
 ; {>  %_4845~°2◂{  }:_p807 %_4844~2':_p799 %_4842~0':_p798 %_4843~1':_p798 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_4843 %_4846 } ⊢ %_4847 : %_4847
 ; {>  %_4845~°2◂{  }:_p807 %_4846~°1◂{  }:(_lst)◂(t2188'(0)) %_4844~2':_p799 %_4842~0':_p798 %_4843~1':_p798 }
; _cns { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; _cns { %_4842 %_4847 } ⊢ %_4848 : %_4848
 ; {>  %_4845~°2◂{  }:_p807 %_4844~2':_p799 %_4842~0':_p798 %_4847~°0◂{ 1' °1◂{  } }:(_lst)◂(_p798) }
; _cns { 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂{ 0' °0◂{ 1' °1◂{  } } }
; _f847 %_4848 ⊢ %_4849 : %_4849
 ; {>  %_4845~°2◂{  }:_p807 %_4844~2':_p799 %_4848~°0◂{ 0' °0◂{ 1' °1◂{  } } }:(_lst)◂(_p798) }
; _f847 °0◂{ 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }
; _some { %_4845 %_4849 %_4844 } ⊢ %_4850 : %_4850
 ; {>  %_4849~°0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }:_p798 %_4845~°2◂{  }:_p807 %_4844~2':_p799 }
; _some { °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; ∎ %_4850
 ; {>  %_4850~°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }:(_opn)◂({ _p807 _p798 _p799 }) }
; 	∎ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_6369
	mov rsi,0
	bt r10,0
	jc LB_6369
	jmp LB_6370
LB_6369:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_6370:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6367
	btr QWORD [rdi],0
	jmp LB_6368
LB_6367:
	bts QWORD [rdi],0
LB_6368:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_6379
	btr r12,5
	jmp LB_6380
LB_6379:
	bts r12,5
LB_6380:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_6377
	btr QWORD [rdi],0
	jmp LB_6378
LB_6377:
	bts QWORD [rdi],0
LB_6378:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r14
	bt r12,1
	jc LB_6387
	btr r12,0
	jmp LB_6388
LB_6387:
	bts r12,0
LB_6388:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_6385
	btr QWORD [rdi],0
	jmp LB_6386
LB_6385:
	bts QWORD [rdi],0
LB_6386:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_6391
	mov rsi,0
	bt r13,0
	jc LB_6391
	jmp LB_6392
LB_6391:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_6392:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_6389
	btr QWORD [rdi],1
	jmp LB_6390
LB_6389:
	bts QWORD [rdi],1
LB_6390:
	mov rsi,1
	bt r12,5
	jc LB_6383
	mov rsi,0
	bt r11,0
	jc LB_6383
	jmp LB_6384
LB_6383:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_6384:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_6381
	btr QWORD [rdi],1
	jmp LB_6382
LB_6381:
	bts QWORD [rdi],1
LB_6382:
	mov rsi,1
	bt r12,4
	jc LB_6375
	mov rsi,0
	bt r10,0
	jc LB_6375
	jmp LB_6376
LB_6375:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_6376:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_6373
	mov rsi,0
	bt r10,0
	jc LB_6373
	jmp LB_6374
LB_6373:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_6374:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6371
	btr QWORD [rdi],1
	jmp LB_6372
LB_6371:
	bts QWORD [rdi],1
LB_6372:
	mov r10,r8
	bt r12,2
	jc LB_6395
	btr r12,4
	jmp LB_6396
LB_6395:
	bts r12,4
LB_6396:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_6393
	btr QWORD [rdi],2
	jmp LB_6394
LB_6393:
	bts QWORD [rdi],2
LB_6394:
	mov r8,0
	bts r12,2
	ret
LB_6397:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6399
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6398
LB_6399:
	add rsp,8
	ret
LB_6401:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6400:
	add rsp,96
	pop r14
LB_6398:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_6505
LB_6504:
	add r14,1
LB_6505:
	cmp r14,r10
	jge LB_6506
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6504
	cmp al,10
	jz LB_6504
	cmp al,32
	jz LB_6504
LB_6506:
	add r14,2
	cmp r14,r10
	jg LB_6509
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_6509
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_6509
	jmp LB_6510
LB_6509:
	jmp LB_6492
LB_6510:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_6499
LB_6498:
	add r14,1
LB_6499:
	cmp r14,r10
	jge LB_6500
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6498
	cmp al,10
	jz LB_6498
	cmp al,32
	jz LB_6498
LB_6500:
	push r10
	call NS_E_4684_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6501
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6502
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6502:
	jmp LB_6493
LB_6501:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6496
	btr r12,1
	jmp LB_6497
LB_6496:
	bts r12,1
LB_6497:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6494
	btr r12,0
	jmp LB_6495
LB_6494:
	bts r12,0
LB_6495:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_6489
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } { 0' 1' 2' } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_6511
	btr r12,3
	jmp LB_6512
LB_6511:
	bts r12,3
LB_6512:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_6515
	btr r12,4
	jmp LB_6516
LB_6515:
	bts r12,4
LB_6516:
	mov r13,r10
	bt r12,4
	jc LB_6513
	btr r12,0
	jmp LB_6514
LB_6513:
	bts r12,0
LB_6514:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_6519
	btr r12,4
	jmp LB_6520
LB_6519:
	bts r12,4
LB_6520:
	mov r14,r10
	bt r12,4
	jc LB_6517
	btr r12,1
	jmp LB_6518
LB_6517:
	bts r12,1
LB_6518:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_6523
	btr r12,4
	jmp LB_6524
LB_6523:
	bts r12,4
LB_6524:
	mov r8,r10
	bt r12,4
	jc LB_6521
	btr r12,2
	jmp LB_6522
LB_6521:
	bts r12,2
LB_6522:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _some %_4851 ⊢ %_4852 : %_4852
 ; {>  %_4851~{ 0' 1' 2' }:{ _p807 _p798 _p799 } }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_4852
 ; {>  %_4852~°0◂{ 0' 1' 2' }:(_opn)◂({ _p807 _p798 _p799 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_6479
	btr r12,4
	jmp LB_6480
LB_6479:
	bts r12,4
LB_6480:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6477
	btr QWORD [rdi],0
	jmp LB_6478
LB_6477:
	bts QWORD [rdi],0
LB_6478:
	mov r10,r14
	bt r12,1
	jc LB_6483
	btr r12,4
	jmp LB_6484
LB_6483:
	bts r12,4
LB_6484:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6481
	btr QWORD [rdi],1
	jmp LB_6482
LB_6481:
	bts QWORD [rdi],1
LB_6482:
	mov r10,r8
	bt r12,2
	jc LB_6487
	btr r12,4
	jmp LB_6488
LB_6487:
	bts r12,4
LB_6488:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_6485
	btr QWORD [rdi],2
	jmp LB_6486
LB_6485:
	bts QWORD [rdi],2
LB_6486:
	mov r8,0
	bts r12,2
	ret
LB_6489:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6491
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6490
LB_6491:
	add rsp,8
	ret
LB_6493:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6492:
	add rsp,32
	pop r14
LB_6490:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; name
	jmp LB_6552
LB_6551:
	add r14,1
LB_6552:
	cmp r14,r10
	jge LB_6553
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6551
	cmp al,10
	jz LB_6551
	cmp al,32
	jz LB_6551
LB_6553:
	push r10
	call NS_E_3623_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6554
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6542
LB_6554:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_6557
LB_6556:
	add r14,1
LB_6557:
	cmp r14,r10
	jge LB_6558
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6556
	cmp al,10
	jz LB_6556
	cmp al,32
	jz LB_6556
LB_6558:
	push r10
	call NS_E_3819_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6559
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6560
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6560:
	jmp LB_6542
LB_6559:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_6563
LB_6562:
	add r14,1
LB_6563:
	cmp r14,r10
	jge LB_6564
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6562
	cmp al,10
	jz LB_6562
	cmp al,32
	jz LB_6562
LB_6564:
	add r14,3
	cmp r14,r10
	jg LB_6569
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6569
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6569
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6569
	jmp LB_6570
LB_6569:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6566
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6566:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6567
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6567:
	jmp LB_6542
LB_6570:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_6572
LB_6571:
	add r14,1
LB_6572:
	cmp r14,r10
	jge LB_6573
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6571
	cmp al,10
	jz LB_6571
	cmp al,32
	jz LB_6571
LB_6573:
	push r10
	call NS_E_4083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6574
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6575
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6575:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6576
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6576:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6577
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6577:
	jmp LB_6542
LB_6574:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6549
	btr r12,3
	jmp LB_6550
LB_6549:
	bts r12,3
LB_6550:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6547
	btr r12,2
	jmp LB_6548
LB_6547:
	bts r12,2
LB_6548:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6545
	btr r12,1
	jmp LB_6546
LB_6545:
	bts r12,1
LB_6546:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6543
	btr r12,0
	jmp LB_6544
LB_6543:
	bts r12,0
LB_6544:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6539
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_6579
	btr r12,4
	jmp LB_6580
LB_6579:
	bts r12,4
LB_6580:
	mov r8,r9
	bt r12,3
	jc LB_6581
	btr r12,2
	jmp LB_6582
LB_6581:
	bts r12,2
LB_6582:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f870 %_4853 ⊢ %_4856 : %_4856
 ; {>  %_4853~0':_p735 %_4855~2':_p799 %_4854~1':_p798 }
; _f870 0' ⊢ °0◂0'
; _some { %_4856 %_4854 %_4855 } ⊢ %_4857 : %_4857
 ; {>  %_4856~°0◂0':_p807 %_4855~2':_p799 %_4854~1':_p798 }
; _some { °0◂0' 1' 2' } ⊢ °0◂{ °0◂0' 1' 2' }
; ∎ %_4857
 ; {>  %_4857~°0◂{ °0◂0' 1' 2' }:(_opn)◂({ _p807 _p798 _p799 }) }
; 	∎ °0◂{ °0◂0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °0◂0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_6529
	btr r12,4
	jmp LB_6530
LB_6529:
	bts r12,4
LB_6530:
	mov rsi,1
	bt r12,4
	jc LB_6527
	mov rsi,0
	bt r10,0
	jc LB_6527
	jmp LB_6528
LB_6527:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_6528:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6525
	btr QWORD [rdi],0
	jmp LB_6526
LB_6525:
	bts QWORD [rdi],0
LB_6526:
	mov r10,r14
	bt r12,1
	jc LB_6533
	btr r12,4
	jmp LB_6534
LB_6533:
	bts r12,4
LB_6534:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6531
	btr QWORD [rdi],1
	jmp LB_6532
LB_6531:
	bts QWORD [rdi],1
LB_6532:
	mov r10,r8
	bt r12,2
	jc LB_6537
	btr r12,4
	jmp LB_6538
LB_6537:
	bts r12,4
LB_6538:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_6535
	btr QWORD [rdi],2
	jmp LB_6536
LB_6535:
	bts QWORD [rdi],2
LB_6536:
	mov r8,0
	bts r12,2
	ret
LB_6539:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6541
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6540
LB_6541:
	add rsp,8
	ret
LB_6542:
	add rsp,64
	pop r14
LB_6540:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4684:
NS_E_RDI_4684:
NS_E_4684_ETR_TBL:
NS_E_4684_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "_^"
	jmp LB_6641
LB_6640:
	add r14,1
LB_6641:
	cmp r14,r10
	jge LB_6642
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6640
	cmp al,10
	jz LB_6640
	cmp al,32
	jz LB_6640
LB_6642:
	add r14,2
	cmp r14,r10
	jg LB_6645
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_6645
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_6645
	jmp LB_6646
LB_6645:
	jmp LB_6608
LB_6646:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_6619
LB_6618:
	add r14,1
LB_6619:
	cmp r14,r10
	jge LB_6620
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6618
	cmp al,10
	jz LB_6618
	cmp al,32
	jz LB_6618
LB_6620:
	push r10
	call NS_E_4685_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6621
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6622
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6622:
	jmp LB_6609
LB_6621:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_6628:
	jmp LB_6625
LB_6624:
	add r14,1
LB_6625:
	cmp r14,r10
	jge LB_6626
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6624
	cmp al,10
	jz LB_6624
	cmp al,32
	jz LB_6624
LB_6626:
	push r10
	push rsi
	call NS_E_4686_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6627
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6629
	bts QWORD [rax],0
LB_6629:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6628
LB_6627:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_6631
LB_6630:
	add r14,1
LB_6631:
	cmp r14,r10
	jge LB_6632
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6630
	cmp al,10
	jz LB_6630
	cmp al,32
	jz LB_6630
LB_6632:
	add r14,2
	cmp r14,r10
	jg LB_6638
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_6638
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_6638
	jmp LB_6639
LB_6638:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6634
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6634:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6635
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6635:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6636
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6636:
	jmp LB_6609
LB_6639:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6616
	btr r12,3
	jmp LB_6617
LB_6616:
	bts r12,3
LB_6617:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6614
	btr r12,2
	jmp LB_6615
LB_6614:
	bts r12,2
LB_6615:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6612
	btr r12,1
	jmp LB_6613
LB_6612:
	bts r12,1
LB_6613:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6610
	btr r12,0
	jmp LB_6611
LB_6610:
	bts r12,0
LB_6611:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6605
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' 2' } 3' {  } }
	mov r10,r9
	bt r12,3
	jc LB_6647
	btr r12,4
	jmp LB_6648
LB_6647:
	bts r12,4
LB_6648:
	mov r9,r8
	bt r12,2
	jc LB_6649
	btr r12,3
	jmp LB_6650
LB_6649:
	bts r12,3
LB_6650:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r14
	bt r12,1
	jc LB_6651
	btr r12,4
	jmp LB_6652
LB_6651:
	bts r12,4
LB_6652:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_6655
	btr r12,5
	jmp LB_6656
LB_6655:
	bts r12,5
LB_6656:
	mov r13,r11
	bt r12,5
	jc LB_6653
	btr r12,0
	jmp LB_6654
LB_6653:
	bts r12,0
LB_6654:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_6659
	btr r12,5
	jmp LB_6660
LB_6659:
	bts r12,5
LB_6660:
	mov r14,r11
	bt r12,5
	jc LB_6657
	btr r12,1
	jmp LB_6658
LB_6657:
	bts r12,1
LB_6658:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_6663
	btr r12,5
	jmp LB_6664
LB_6663:
	bts r12,5
LB_6664:
	mov r8,r11
	bt r12,5
	jc LB_6661
	btr r12,2
	jmp LB_6662
LB_6661:
	bts r12,2
LB_6662:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f874 { %_4858 %_4861 } ⊢ %_4862 : %_4862
 ; {>  %_4861~3':(_lst)◂(_p808) %_4858~0':_r64 %_4860~2':_p799 %_4859~1':_p798 }
; _f874 { 0' 3' } ⊢ °4◂{ 0' 3' }
; _some { %_4862 %_4859 %_4860 } ⊢ %_4863 : %_4863
 ; {>  %_4862~°4◂{ 0' 3' }:_p807 %_4860~2':_p799 %_4859~1':_p798 }
; _some { °4◂{ 0' 3' } 1' 2' } ⊢ °0◂{ °4◂{ 0' 3' } 1' 2' }
; ∎ %_4863
 ; {>  %_4863~°0◂{ °4◂{ 0' 3' } 1' 2' }:(_opn)◂({ _p807 _p798 _p799 }) }
; 	∎ °0◂{ °4◂{ 0' 3' } 1' 2' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °4◂{ 0' 3' } 1' 2' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_6583
	btr r12,4
	jmp LB_6584
LB_6583:
	bts r12,4
LB_6584:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_6591
	btr r12,6
	jmp LB_6592
LB_6591:
	bts r12,6
LB_6592:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_6589
	btr QWORD [rdi],0
	jmp LB_6590
LB_6589:
	bts QWORD [rdi],0
LB_6590:
	mov rcx,r10
	bt r12,4
	jc LB_6595
	btr r12,6
	jmp LB_6596
LB_6595:
	bts r12,6
LB_6596:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_6593
	btr QWORD [rdi],1
	jmp LB_6594
LB_6593:
	bts QWORD [rdi],1
LB_6594:
	mov rsi,1
	bt r12,5
	jc LB_6587
	mov rsi,0
	bt r11,0
	jc LB_6587
	jmp LB_6588
LB_6587:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_6588:
	mov rax,0x0400_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_6585
	btr QWORD [rdi],0
	jmp LB_6586
LB_6585:
	bts QWORD [rdi],0
LB_6586:
	mov r11,r14
	bt r12,1
	jc LB_6599
	btr r12,5
	jmp LB_6600
LB_6599:
	bts r12,5
LB_6600:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_6597
	btr QWORD [rdi],1
	jmp LB_6598
LB_6597:
	bts QWORD [rdi],1
LB_6598:
	mov r11,r8
	bt r12,2
	jc LB_6603
	btr r12,5
	jmp LB_6604
LB_6603:
	bts r12,5
LB_6604:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_6601
	btr QWORD [rdi],2
	jmp LB_6602
LB_6601:
	bts QWORD [rdi],2
LB_6602:
	mov r8,0
	bts r12,2
	ret
LB_6605:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6607
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6606
LB_6607:
	add rsp,8
	ret
LB_6609:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6608:
	add rsp,64
	pop r14
LB_6606:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; cst
	jmp LB_6694
LB_6693:
	add r14,1
LB_6694:
	cmp r14,r10
	jge LB_6695
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6693
	cmp al,10
	jz LB_6693
	cmp al,32
	jz LB_6693
LB_6695:
	push r10
	call NS_E_3690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6696
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6684
LB_6696:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_6699
LB_6698:
	add r14,1
LB_6699:
	cmp r14,r10
	jge LB_6700
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6698
	cmp al,10
	jz LB_6698
	cmp al,32
	jz LB_6698
LB_6700:
	add r14,1
	cmp r14,r10
	jg LB_6704
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_6704
	jmp LB_6705
LB_6704:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6702
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6702:
	jmp LB_6684
LB_6705:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_6707
LB_6706:
	add r14,1
LB_6707:
	cmp r14,r10
	jge LB_6708
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6706
	cmp al,10
	jz LB_6706
	cmp al,32
	jz LB_6706
LB_6708:
	add r14,3
	cmp r14,r10
	jg LB_6713
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6713
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6713
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6713
	jmp LB_6714
LB_6713:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6710
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6710:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6711
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6711:
	jmp LB_6684
LB_6714:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_6716
LB_6715:
	add r14,1
LB_6716:
	cmp r14,r10
	jge LB_6717
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6715
	cmp al,10
	jz LB_6715
	cmp al,32
	jz LB_6715
LB_6717:
	push r10
	call NS_E_4083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6718
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6719
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6719:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6720
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6720:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6721
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6721:
	jmp LB_6684
LB_6718:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6691
	btr r12,3
	jmp LB_6692
LB_6691:
	bts r12,3
LB_6692:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6689
	btr r12,2
	jmp LB_6690
LB_6689:
	bts r12,2
LB_6690:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6687
	btr r12,1
	jmp LB_6688
LB_6687:
	bts r12,1
LB_6688:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6685
	btr r12,0
	jmp LB_6686
LB_6685:
	bts r12,0
LB_6686:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_6681
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_6723
	btr r12,4
	jmp LB_6724
LB_6723:
	bts r12,4
LB_6724:
	mov r14,r9
	bt r12,3
	jc LB_6725
	btr r12,1
	jmp LB_6726
LB_6725:
	bts r12,1
LB_6726:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f873 %_4864 ⊢ %_4866 : %_4866
 ; {>  %_4865~1':_p799 %_4864~0':_p801 }
; _f873 0' ⊢ °3◂0'
; _nil {  } ⊢ %_4867 : %_4867
 ; {>  %_4865~1':_p799 %_4866~°3◂0':_p807 }
; _nil {  } ⊢ °1◂{  }
; _f847 %_4867 ⊢ %_4868 : %_4868
 ; {>  %_4867~°1◂{  }:(_lst)◂(t2217'(0)) %_4865~1':_p799 %_4866~°3◂0':_p807 }
; _f847 °1◂{  } ⊢ °0◂°1◂{  }
; _some { %_4866 %_4868 %_4865 } ⊢ %_4869 : %_4869
 ; {>  %_4868~°0◂°1◂{  }:_p798 %_4865~1':_p799 %_4866~°3◂0':_p807 }
; _some { °3◂0' °0◂°1◂{  } 1' } ⊢ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; ∎ %_4869
 ; {>  %_4869~°0◂{ °3◂0' °0◂°1◂{  } 1' }:(_opn)◂({ _p807 _p798 _p799 }) }
; 	∎ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ °3◂0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_6669
	btr r12,2
	jmp LB_6670
LB_6669:
	bts r12,2
LB_6670:
	mov rsi,1
	bt r12,2
	jc LB_6667
	mov rsi,0
	bt r8,0
	jc LB_6667
	jmp LB_6668
LB_6667:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_6668:
	mov rax,0x0300_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6665
	btr QWORD [rdi],0
	jmp LB_6666
LB_6665:
	bts QWORD [rdi],0
LB_6666:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_6675
	mov rsi,0
	bt r8,0
	jc LB_6675
	jmp LB_6676
LB_6675:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_6676:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_6673
	mov rsi,0
	bt r8,0
	jc LB_6673
	jmp LB_6674
LB_6673:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_6674:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6671
	btr QWORD [rdi],1
	jmp LB_6672
LB_6671:
	bts QWORD [rdi],1
LB_6672:
	mov r8,r14
	bt r12,1
	jc LB_6679
	btr r12,2
	jmp LB_6680
LB_6679:
	bts r12,2
LB_6680:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_6677
	btr QWORD [rdi],2
	jmp LB_6678
LB_6677:
	bts QWORD [rdi],2
LB_6678:
	mov r8,0
	bts r12,2
	ret
LB_6681:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6683
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6682
LB_6683:
	add rsp,8
	ret
LB_6684:
	add rsp,64
	pop r14
LB_6682:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4685:
NS_E_RDI_4685:
NS_E_4685_ETR_TBL:
NS_E_4685_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "_"
	jmp LB_6780
LB_6779:
	add r14,1
LB_6780:
	cmp r14,r10
	jge LB_6781
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6779
	cmp al,10
	jz LB_6779
	cmp al,32
	jz LB_6779
LB_6781:
	add r14,1
	cmp r14,r10
	jg LB_6784
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_6784
	jmp LB_6785
LB_6784:
	jmp LB_6756
LB_6785:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_6765
LB_6764:
	add r14,1
LB_6765:
	cmp r14,r10
	jge LB_6766
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6764
	cmp al,10
	jz LB_6764
	cmp al,32
	jz LB_6764
LB_6766:
	add r14,3
	cmp r14,r10
	jg LB_6770
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6770
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6770
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6770
	jmp LB_6771
LB_6770:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6768
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6768:
	jmp LB_6757
LB_6771:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_6773
LB_6772:
	add r14,1
LB_6773:
	cmp r14,r10
	jge LB_6774
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6772
	cmp al,10
	jz LB_6772
	cmp al,32
	jz LB_6772
LB_6774:
	push r10
	call NS_E_4088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6775
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6776
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6776:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6777
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6777:
	jmp LB_6757
LB_6775:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6762
	btr r12,2
	jmp LB_6763
LB_6762:
	bts r12,2
LB_6763:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6760
	btr r12,1
	jmp LB_6761
LB_6760:
	bts r12,1
LB_6761:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6758
	btr r12,0
	jmp LB_6759
LB_6758:
	bts r12,0
LB_6759:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6753
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_6786
	btr r12,3
	jmp LB_6787
LB_6786:
	bts r12,3
LB_6787:
	mov r13,r8
	bt r12,2
	jc LB_6788
	btr r12,0
	jmp LB_6789
LB_6788:
	bts r12,0
LB_6789:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_4871 : %_4871
 ; {>  %_4870~0':_p797 }
; 	» 0xr0 _ ⊢ 1' : %_4871
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_4872 : %_4872
 ; {>  %_4870~0':_p797 %_4871~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f847 %_4872 ⊢ %_4873 : %_4873
 ; {>  %_4870~0':_p797 %_4872~°1◂{  }:(_lst)◂(t2225'(0)) %_4871~1':_r64 }
; _f847 °1◂{  } ⊢ °0◂°1◂{  }
; _nil {  } ⊢ %_4874 : %_4874
 ; {>  %_4873~°0◂°1◂{  }:_p798 %_4870~0':_p797 %_4871~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f850 %_4870 ⊢ %_4875 : %_4875
 ; {>  %_4873~°0◂°1◂{  }:_p798 %_4870~0':_p797 %_4871~1':_r64 %_4874~°1◂{  }:(_lst)◂(t2229'(0)) }
; _f850 0' ⊢ °1◂0'
; _cns { %_4875 %_4874 } ⊢ %_4876 : %_4876
 ; {>  %_4875~°1◂0':_p799 %_4873~°0◂°1◂{  }:_p798 %_4871~1':_r64 %_4874~°1◂{  }:(_lst)◂(t2229'(0)) }
; _cns { °1◂0' °1◂{  } } ⊢ °0◂{ °1◂0' °1◂{  } }
; _f849 %_4876 ⊢ %_4877 : %_4877
 ; {>  %_4873~°0◂°1◂{  }:_p798 %_4876~°0◂{ °1◂0' °1◂{  } }:(_lst)◂(_p799) %_4871~1':_r64 }
; _f849 °0◂{ °1◂0' °1◂{  } } ⊢ °0◂°0◂{ °1◂0' °1◂{  } }
; _some { %_4871 %_4873 %_4877 } ⊢ %_4878 : %_4878
 ; {>  %_4873~°0◂°1◂{  }:_p798 %_4877~°0◂°0◂{ °1◂0' °1◂{  } }:_p799 %_4871~1':_r64 }
; _some { 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; ∎ %_4878
 ; {>  %_4878~°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }:(_opn)◂({ _r64 _p798 _p799 }) }
; 	∎ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r14
	bt r12,1
	jc LB_6729
	btr r12,2
	jmp LB_6730
LB_6729:
	bts r12,2
LB_6730:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6727
	btr QWORD [rdi],0
	jmp LB_6728
LB_6727:
	bts QWORD [rdi],0
LB_6728:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_6735
	mov rsi,0
	bt r8,0
	jc LB_6735
	jmp LB_6736
LB_6735:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_6736:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_6733
	mov rsi,0
	bt r8,0
	jc LB_6733
	jmp LB_6734
LB_6733:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_6734:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6731
	btr QWORD [rdi],1
	jmp LB_6732
LB_6731:
	bts QWORD [rdi],1
LB_6732:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r14,r13
	bt r12,0
	jc LB_6747
	btr r12,1
	jmp LB_6748
LB_6747:
	bts r12,1
LB_6748:
	mov rsi,1
	bt r12,1
	jc LB_6745
	mov rsi,0
	bt r14,0
	jc LB_6745
	jmp LB_6746
LB_6745:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_6746:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_6743
	btr QWORD [rdi],0
	jmp LB_6744
LB_6743:
	bts QWORD [rdi],0
LB_6744:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_6751
	mov rsi,0
	bt r14,0
	jc LB_6751
	jmp LB_6752
LB_6751:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_6752:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_6749
	btr QWORD [rdi],1
	jmp LB_6750
LB_6749:
	bts QWORD [rdi],1
LB_6750:
	mov rsi,1
	bt r12,2
	jc LB_6741
	mov rsi,0
	bt r8,0
	jc LB_6741
	jmp LB_6742
LB_6741:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_6742:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_6739
	mov rsi,0
	bt r8,0
	jc LB_6739
	jmp LB_6740
LB_6739:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_6740:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_6737
	btr QWORD [rdi],2
	jmp LB_6738
LB_6737:
	bts QWORD [rdi],2
LB_6738:
	mov r8,0
	bts r12,2
	ret
LB_6753:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6755
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6754
LB_6755:
	add rsp,8
	ret
LB_6757:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6756:
	add rsp,48
	pop r14
LB_6754:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src
	jmp LB_6843
LB_6842:
	add r14,1
LB_6843:
	cmp r14,r10
	jge LB_6844
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6842
	cmp al,10
	jz LB_6842
	cmp al,32
	jz LB_6842
LB_6844:
	push r10
	call NS_E_3822_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6845
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6831
LB_6845:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_6848
LB_6847:
	add r14,1
LB_6848:
	cmp r14,r10
	jge LB_6849
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6847
	cmp al,10
	jz LB_6847
	cmp al,32
	jz LB_6847
LB_6849:
	push r10
	call NS_E_3821_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6850
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6851
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6851:
	jmp LB_6831
LB_6850:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_6854
LB_6853:
	add r14,1
LB_6854:
	cmp r14,r10
	jge LB_6855
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6853
	cmp al,10
	jz LB_6853
	cmp al,32
	jz LB_6853
LB_6855:
	add r14,3
	cmp r14,r10
	jg LB_6860
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6860
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6860
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6860
	jmp LB_6861
LB_6860:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6857
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6857:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6858
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6858:
	jmp LB_6831
LB_6861:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_6863
LB_6862:
	add r14,1
LB_6863:
	cmp r14,r10
	jge LB_6864
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6862
	cmp al,10
	jz LB_6862
	cmp al,32
	jz LB_6862
LB_6864:
	push r10
	call NS_E_4088_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6865
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6866
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6866:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6867
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6867:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6868
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6868:
	jmp LB_6831
LB_6865:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_6871
LB_6870:
	add r14,1
LB_6871:
	cmp r14,r10
	jge LB_6872
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6870
	cmp al,10
	jz LB_6870
	cmp al,32
	jz LB_6870
LB_6872:
	push r10
	call NS_E_4087_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6873
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6874
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6874:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6875
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6875:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6876
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6876:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6877
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6877:
	jmp LB_6831
LB_6873:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6840
	btr r12,4
	jmp LB_6841
LB_6840:
	bts r12,4
LB_6841:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6838
	btr r12,3
	jmp LB_6839
LB_6838:
	bts r12,3
LB_6839:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6836
	btr r12,2
	jmp LB_6837
LB_6836:
	bts r12,2
LB_6837:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6834
	btr r12,1
	jmp LB_6835
LB_6834:
	bts r12,1
LB_6835:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6832
	btr r12,0
	jmp LB_6833
LB_6832:
	bts r12,0
LB_6833:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_6828
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_6879
	btr r12,5
	jmp LB_6880
LB_6879:
	bts r12,5
LB_6880:
	mov r9,r10
	bt r12,4
	jc LB_6881
	btr r12,3
	jmp LB_6882
LB_6881:
	bts r12,3
LB_6882:
	mov r10,r8
	bt r12,2
	jc LB_6883
	btr r12,4
	jmp LB_6884
LB_6883:
	bts r12,4
LB_6884:
	mov r8,r11
	bt r12,5
	jc LB_6885
	btr r12,2
	jmp LB_6886
LB_6885:
	bts r12,2
LB_6886:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f848 %_4879 ⊢ %_4883 : %_4883
 ; {>  %_4880~1':(_lst)◂(_p798) %_4879~0':_p796 %_4881~2':_p797 %_4882~3':(_lst)◂(_p799) }
; _f848 0' ⊢ °1◂0'
; _f850 %_4881 ⊢ %_4884 : %_4884
 ; {>  %_4880~1':(_lst)◂(_p798) %_4883~°1◂0':_p798 %_4881~2':_p797 %_4882~3':(_lst)◂(_p799) }
; _f850 2' ⊢ °1◂2'
; _cns { %_4883 %_4880 } ⊢ %_4885 : %_4885
 ; {>  %_4884~°1◂2':_p799 %_4880~1':(_lst)◂(_p798) %_4883~°1◂0':_p798 %_4882~3':(_lst)◂(_p799) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _cns { %_4884 %_4882 } ⊢ %_4886 : %_4886
 ; {>  %_4884~°1◂2':_p799 %_4885~°0◂{ °1◂0' 1' }:(_lst)◂(_p798) %_4882~3':(_lst)◂(_p799) }
; _cns { °1◂2' 3' } ⊢ °0◂{ °1◂2' 3' }
; _f847 %_4885 ⊢ %_4887 : %_4887
 ; {>  %_4886~°0◂{ °1◂2' 3' }:(_lst)◂(_p799) %_4885~°0◂{ °1◂0' 1' }:(_lst)◂(_p798) }
; _f847 °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; _f849 %_4886 ⊢ %_4888 : %_4888
 ; {>  %_4887~°0◂°0◂{ °1◂0' 1' }:_p798 %_4886~°0◂{ °1◂2' 3' }:(_lst)◂(_p799) }
; _f849 °0◂{ °1◂2' 3' } ⊢ °0◂°0◂{ °1◂2' 3' }
; » 0xr1 |~ {  } ⊢ %_4889 : %_4889
 ; {>  %_4888~°0◂°0◂{ °1◂2' 3' }:_p799 %_4887~°0◂°0◂{ °1◂0' 1' }:_p798 }
; 	» 0xr1 _ ⊢ 4' : %_4889
	mov rdi,0x1
	mov r10,rdi
	bts r12,4
; _some { %_4889 %_4887 %_4888 } ⊢ %_4890 : %_4890
 ; {>  %_4889~4':_r64 %_4888~°0◂°0◂{ °1◂2' 3' }:_p799 %_4887~°0◂°0◂{ °1◂0' 1' }:_p798 }
; _some { 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; ∎ %_4890
 ; {>  %_4890~°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }:(_opn)◂({ _r64 _p798 _p799 }) }
; 	∎ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_6790
	btr r12,5
	jmp LB_6791
LB_6790:
	bts r12,5
LB_6791:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r10
	bt r12,4
	jc LB_6794
	btr r12,6
	jmp LB_6795
LB_6794:
	bts r12,6
LB_6795:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_6792
	btr QWORD [rdi],0
	jmp LB_6793
LB_6792:
	bts QWORD [rdi],0
LB_6793:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r10,r13
	bt r12,0
	jc LB_6806
	btr r12,4
	jmp LB_6807
LB_6806:
	bts r12,4
LB_6807:
	mov rsi,1
	bt r12,4
	jc LB_6804
	mov rsi,0
	bt r10,0
	jc LB_6804
	jmp LB_6805
LB_6804:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_6805:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6802
	btr QWORD [rdi],0
	jmp LB_6803
LB_6802:
	bts QWORD [rdi],0
LB_6803:
	mov r10,r14
	bt r12,1
	jc LB_6810
	btr r12,4
	jmp LB_6811
LB_6810:
	bts r12,4
LB_6811:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6808
	btr QWORD [rdi],1
	jmp LB_6809
LB_6808:
	bts QWORD [rdi],1
LB_6809:
	mov rsi,1
	bt r12,6
	jc LB_6800
	mov rsi,0
	bt rcx,0
	jc LB_6800
	jmp LB_6801
LB_6800:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_6801:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_6798
	mov rsi,0
	bt rcx,0
	jc LB_6798
	jmp LB_6799
LB_6798:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_6799:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_6796
	btr QWORD [rdi],1
	jmp LB_6797
LB_6796:
	bts QWORD [rdi],1
LB_6797:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r13,r8
	bt r12,2
	jc LB_6822
	btr r12,0
	jmp LB_6823
LB_6822:
	bts r12,0
LB_6823:
	mov rsi,1
	bt r12,0
	jc LB_6820
	mov rsi,0
	bt r13,0
	jc LB_6820
	jmp LB_6821
LB_6820:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_6821:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_6818
	btr QWORD [rdi],0
	jmp LB_6819
LB_6818:
	bts QWORD [rdi],0
LB_6819:
	mov r13,r11
	bt r12,5
	jc LB_6826
	btr r12,0
	jmp LB_6827
LB_6826:
	bts r12,0
LB_6827:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_6824
	btr QWORD [rdi],1
	jmp LB_6825
LB_6824:
	bts QWORD [rdi],1
LB_6825:
	mov rsi,1
	bt r12,6
	jc LB_6816
	mov rsi,0
	bt rcx,0
	jc LB_6816
	jmp LB_6817
LB_6816:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_6817:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_6814
	mov rsi,0
	bt rcx,0
	jc LB_6814
	jmp LB_6815
LB_6814:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_6815:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_6812
	btr QWORD [rdi],2
	jmp LB_6813
LB_6812:
	bts QWORD [rdi],2
LB_6813:
	mov r8,0
	bts r12,2
	ret
LB_6828:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6830
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6829
LB_6830:
	add rsp,8
	ret
LB_6831:
	add rsp,80
	pop r14
LB_6829:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4686:
NS_E_RDI_4686:
NS_E_4686_ETR_TBL:
NS_E_4686_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; var_idx
	jmp LB_6916
LB_6915:
	add r14,1
LB_6916:
	cmp r14,r10
	jge LB_6917
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6915
	cmp al,10
	jz LB_6915
	cmp al,32
	jz LB_6915
LB_6917:
	push r10
	call NS_E_4687_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6918
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6900
LB_6918:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "*"
	jmp LB_6921
LB_6920:
	add r14,1
LB_6921:
	cmp r14,r10
	jge LB_6922
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6920
	cmp al,10
	jz LB_6920
	cmp al,32
	jz LB_6920
LB_6922:
	add r14,1
	cmp r14,r10
	jg LB_6926
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,42
	jnz LB_6926
	jmp LB_6927
LB_6926:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6924
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6924:
	jmp LB_6900
LB_6927:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; stg_ltr
	jmp LB_6909
LB_6908:
	add r14,1
LB_6909:
	cmp r14,r10
	jge LB_6910
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6908
	cmp al,10
	jz LB_6908
	cmp al,32
	jz LB_6908
LB_6910:
	push r10
	call NS_E_192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6911
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6912
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6912:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6913
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6913:
	jmp LB_6901
LB_6911:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6906
	btr r12,2
	jmp LB_6907
LB_6906:
	bts r12,2
LB_6907:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6904
	btr r12,1
	jmp LB_6905
LB_6904:
	bts r12,1
LB_6905:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6902
	btr r12,0
	jmp LB_6903
LB_6902:
	bts r12,0
LB_6903:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_6897
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_6928
	btr r12,3
	jmp LB_6929
LB_6928:
	bts r12,3
LB_6929:
	mov r14,r8
	bt r12,2
	jc LB_6930
	btr r12,1
	jmp LB_6931
LB_6930:
	bts r12,1
LB_6931:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f878 { %_4891 %_4892 } ⊢ %_4893 : %_4893
 ; {>  %_4892~1':_stg %_4891~0':_r64 }
; _f878 { 0' 1' } ⊢ °3◂{ 0' 1' }
; _some %_4893 ⊢ %_4894 : %_4894
 ; {>  %_4893~°3◂{ 0' 1' }:_p808 }
; _some °3◂{ 0' 1' } ⊢ °0◂°3◂{ 0' 1' }
; ∎ %_4894
 ; {>  %_4894~°0◂°3◂{ 0' 1' }:(_opn)◂(_p808) }
; 	∎ °0◂°3◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°3◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_6891
	btr r12,2
	jmp LB_6892
LB_6891:
	bts r12,2
LB_6892:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6889
	btr QWORD [rdi],0
	jmp LB_6890
LB_6889:
	bts QWORD [rdi],0
LB_6890:
	mov r8,r14
	bt r12,1
	jc LB_6895
	btr r12,2
	jmp LB_6896
LB_6895:
	bts r12,2
LB_6896:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6893
	btr QWORD [rdi],1
	jmp LB_6894
LB_6893:
	bts QWORD [rdi],1
LB_6894:
	mov rsi,1
	bt r12,3
	jc LB_6887
	mov rsi,0
	bt r9,0
	jc LB_6887
	jmp LB_6888
LB_6887:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6888:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6897:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6899
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6898
LB_6899:
	add rsp,8
	ret
LB_6901:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6900:
	add rsp,48
	pop r14
LB_6898:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_6943
LB_6942:
	add r14,1
LB_6943:
	cmp r14,r10
	jge LB_6944
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6942
	cmp al,10
	jz LB_6942
	cmp al,32
	jz LB_6942
LB_6944:
	push r10
	call NS_E_4689_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6945
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6939
LB_6945:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6940
	btr r12,0
	jmp LB_6941
LB_6940:
	bts r12,0
LB_6941:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6936
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f875 %_4895 ⊢ %_4896 : %_4896
 ; {>  %_4895~0':_stg }
; _f875 0' ⊢ °0◂0'
; _some %_4896 ⊢ %_4897 : %_4897
 ; {>  %_4896~°0◂0':_p808 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4897
 ; {>  %_4897~°0◂°0◂0':(_opn)◂(_p808) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6934
	btr r12,3
	jmp LB_6935
LB_6934:
	bts r12,3
LB_6935:
	mov rsi,1
	bt r12,3
	jc LB_6932
	mov rsi,0
	bt r9,0
	jc LB_6932
	jmp LB_6933
LB_6932:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6933:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6936:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6938
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6937
LB_6938:
	add rsp,8
	ret
LB_6939:
	add rsp,16
	pop r14
LB_6937:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_6958
LB_6957:
	add r14,1
LB_6958:
	cmp r14,r10
	jge LB_6959
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6957
	cmp al,10
	jz LB_6957
	cmp al,32
	jz LB_6957
LB_6959:
	push r10
	call NS_E_192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6960
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6954
LB_6960:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6955
	btr r12,0
	jmp LB_6956
LB_6955:
	bts r12,0
LB_6956:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6951
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f875 %_4898 ⊢ %_4899 : %_4899
 ; {>  %_4898~0':_stg }
; _f875 0' ⊢ °0◂0'
; _some %_4899 ⊢ %_4900 : %_4900
 ; {>  %_4899~°0◂0':_p808 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4900
 ; {>  %_4900~°0◂°0◂0':(_opn)◂(_p808) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6949
	btr r12,3
	jmp LB_6950
LB_6949:
	bts r12,3
LB_6950:
	mov rsi,1
	bt r12,3
	jc LB_6947
	mov rsi,0
	bt r9,0
	jc LB_6947
	jmp LB_6948
LB_6947:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6948:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6951:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6953
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6952
LB_6953:
	add rsp,8
	ret
LB_6954:
	add rsp,16
	pop r14
LB_6952:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_6973
LB_6972:
	add r14,1
LB_6973:
	cmp r14,r10
	jge LB_6974
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6972
	cmp al,10
	jz LB_6972
	cmp al,32
	jz LB_6972
LB_6974:
	push r10
	call NS_E_3623_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6975
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6969
LB_6975:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6970
	btr r12,0
	jmp LB_6971
LB_6970:
	bts r12,0
LB_6971:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6966
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f876 %_4901 ⊢ %_4902 : %_4902
 ; {>  %_4901~0':_p735 }
; _f876 0' ⊢ °1◂0'
; _some %_4902 ⊢ %_4903 : %_4903
 ; {>  %_4902~°1◂0':_p808 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4903
 ; {>  %_4903~°0◂°1◂0':(_opn)◂(_p808) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_6964
	btr r12,3
	jmp LB_6965
LB_6964:
	bts r12,3
LB_6965:
	mov rsi,1
	bt r12,3
	jc LB_6962
	mov rsi,0
	bt r9,0
	jc LB_6962
	jmp LB_6963
LB_6962:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6963:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6966:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6968
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6967
LB_6968:
	add rsp,8
	ret
LB_6969:
	add rsp,16
	pop r14
LB_6967:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_6994
LB_6993:
	add r14,1
LB_6994:
	cmp r14,r10
	jge LB_6995
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6993
	cmp al,10
	jz LB_6993
	cmp al,32
	jz LB_6993
LB_6995:
	push r10
	call NS_E_4688_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6996
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6990
LB_6996:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6991
	btr r12,0
	jmp LB_6992
LB_6991:
	bts r12,0
LB_6992:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_6987
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_6998
	btr r12,2
	jmp LB_6999
LB_6998:
	bts r12,2
LB_6999:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_7002
	btr r12,3
	jmp LB_7003
LB_7002:
	bts r12,3
LB_7003:
	mov r13,r9
	bt r12,3
	jc LB_7000
	btr r12,0
	jmp LB_7001
LB_7000:
	bts r12,0
LB_7001:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_7006
	btr r12,3
	jmp LB_7007
LB_7006:
	bts r12,3
LB_7007:
	mov r14,r9
	bt r12,3
	jc LB_7004
	btr r12,1
	jmp LB_7005
LB_7004:
	bts r12,1
LB_7005:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f877 %_4904 ⊢ %_4905 : %_4905
 ; {>  %_4904~{ 0' 1' }:{ _p809 _r64 } }
; _f877 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_4905 ⊢ %_4906 : %_4906
 ; {>  %_4905~°2◂{ 0' 1' }:_p808 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_4906
 ; {>  %_4906~°0◂°2◂{ 0' 1' }:(_opn)◂(_p808) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_6981
	btr r12,2
	jmp LB_6982
LB_6981:
	bts r12,2
LB_6982:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_6979
	btr QWORD [rdi],0
	jmp LB_6980
LB_6979:
	bts QWORD [rdi],0
LB_6980:
	mov r8,r14
	bt r12,1
	jc LB_6985
	btr r12,2
	jmp LB_6986
LB_6985:
	bts r12,2
LB_6986:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_6983
	btr QWORD [rdi],1
	jmp LB_6984
LB_6983:
	bts QWORD [rdi],1
LB_6984:
	mov rsi,1
	bt r12,3
	jc LB_6977
	mov rsi,0
	bt r9,0
	jc LB_6977
	jmp LB_6978
LB_6977:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_6978:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_6987:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_6989
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_6988
LB_6989:
	add rsp,8
	ret
LB_6990:
	add rsp,16
	pop r14
LB_6988:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4687:
NS_E_RDI_4687:
NS_E_4687_ETR_TBL:
NS_E_4687_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_69_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7021
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7013
LB_7021:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_7029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_7029
	jmp LB_7030
LB_7029:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7027
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7027:
	jmp LB_7013
LB_7030:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7016
	btr r12,1
	jmp LB_7017
LB_7016:
	bts r12,1
LB_7017:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7014
	btr r12,0
	jmp LB_7015
LB_7014:
	bts r12,0
LB_7015:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7010
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_4907 ⊢ %_4908 : %_4908
 ; {>  %_4907~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4908
 ; {>  %_4908~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7008
	btr r12,3
	jmp LB_7009
LB_7008:
	bts r12,3
LB_7009:
	mov r8,0
	bts r12,2
	ret
LB_7010:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7012
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7011
LB_7012:
	add rsp,8
	ret
LB_7013:
	add rsp,32
	pop r14
LB_7011:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4688:
NS_E_RDI_4688:
NS_E_4688_ETR_TBL:
NS_E_4688_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_69_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7050
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7042
LB_7050:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_7058
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_7058
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_7058
	jmp LB_7059
LB_7058:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7056
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7056:
	jmp LB_7042
LB_7059:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7045
	btr r12,1
	jmp LB_7046
LB_7045:
	bts r12,1
LB_7046:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7043
	btr r12,0
	jmp LB_7044
LB_7043:
	bts r12,0
LB_7044:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7039
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f880 {  } ⊢ %_4910 : %_4910
 ; {>  %_4909~0':_r64 }
; _f880 {  } ⊢ °1◂{  }
; _some { %_4910 %_4909 } ⊢ %_4911 : %_4911
 ; {>  %_4910~°1◂{  }:_p809 %_4909~0':_r64 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_4911
 ; {>  %_4911~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p809 _r64 }) }
; 	∎ °0◂{ °1◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °1◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_7033
	mov rsi,0
	bt r14,0
	jc LB_7033
	jmp LB_7034
LB_7033:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7034:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_7031
	btr QWORD [rdi],0
	jmp LB_7032
LB_7031:
	bts QWORD [rdi],0
LB_7032:
	mov r14,r13
	bt r12,0
	jc LB_7037
	btr r12,1
	jmp LB_7038
LB_7037:
	bts r12,1
LB_7038:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_7035
	btr QWORD [rdi],1
	jmp LB_7036
LB_7035:
	bts QWORD [rdi],1
LB_7036:
	mov r8,0
	bts r12,2
	ret
LB_7039:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7041
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7040
LB_7041:
	add rsp,8
	ret
LB_7042:
	add rsp,32
	pop r14
LB_7040:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_69_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7079
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7071
LB_7079:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_7087
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_7087
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_7087
	jmp LB_7088
LB_7087:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7085
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7085:
	jmp LB_7071
LB_7088:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7074
	btr r12,1
	jmp LB_7075
LB_7074:
	bts r12,1
LB_7075:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7072
	btr r12,0
	jmp LB_7073
LB_7072:
	bts r12,0
LB_7073:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7068
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f881 {  } ⊢ %_4913 : %_4913
 ; {>  %_4912~0':_r64 }
; _f881 {  } ⊢ °2◂{  }
; _some { %_4913 %_4912 } ⊢ %_4914 : %_4914
 ; {>  %_4912~0':_r64 %_4913~°2◂{  }:_p809 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_4914
 ; {>  %_4914~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p809 _r64 }) }
; 	∎ °0◂{ °2◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °2◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_7062
	mov rsi,0
	bt r14,0
	jc LB_7062
	jmp LB_7063
LB_7062:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7063:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_7060
	btr QWORD [rdi],0
	jmp LB_7061
LB_7060:
	bts QWORD [rdi],0
LB_7061:
	mov r14,r13
	bt r12,0
	jc LB_7066
	btr r12,1
	jmp LB_7067
LB_7066:
	bts r12,1
LB_7067:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_7064
	btr QWORD [rdi],1
	jmp LB_7065
LB_7064:
	bts QWORD [rdi],1
LB_7065:
	mov r8,0
	bts r12,2
	ret
LB_7068:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7070
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7069
LB_7070:
	add rsp,8
	ret
LB_7071:
	add rsp,32
	pop r14
LB_7069:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_69_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7108
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7100
LB_7108:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_7116
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_7116
	jmp LB_7117
LB_7116:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7114
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7114:
	jmp LB_7100
LB_7117:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7103
	btr r12,1
	jmp LB_7104
LB_7103:
	bts r12,1
LB_7104:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7101
	btr r12,0
	jmp LB_7102
LB_7101:
	bts r12,0
LB_7102:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7097
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f879 {  } ⊢ %_4916 : %_4916
 ; {>  %_4915~0':_r64 }
; _f879 {  } ⊢ °0◂{  }
; _some { %_4916 %_4915 } ⊢ %_4917 : %_4917
 ; {>  %_4915~0':_r64 %_4916~°0◂{  }:_p809 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_4917
 ; {>  %_4917~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p809 _r64 }) }
; 	∎ °0◂{ °0◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °0◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_7091
	mov rsi,0
	bt r14,0
	jc LB_7091
	jmp LB_7092
LB_7091:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7092:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_7089
	btr QWORD [rdi],0
	jmp LB_7090
LB_7089:
	bts QWORD [rdi],0
LB_7090:
	mov r14,r13
	bt r12,0
	jc LB_7095
	btr r12,1
	jmp LB_7096
LB_7095:
	bts r12,1
LB_7096:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_7093
	btr QWORD [rdi],1
	jmp LB_7094
LB_7093:
	bts QWORD [rdi],1
LB_7094:
	mov r8,0
	bts r12,2
	ret
LB_7097:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7099
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7098
LB_7099:
	add rsp,8
	ret
LB_7100:
	add rsp,32
	pop r14
LB_7098:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4689:
NS_E_RDI_4689:
NS_E_4689_ETR_TBL:
NS_E_4689_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_7133
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_7133
	jmp LB_7134
LB_7133:
	jmp LB_7123
LB_7134:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_4690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7138
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7139
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7139:
	jmp LB_7123
LB_7138:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7126
	btr r12,1
	jmp LB_7127
LB_7126:
	bts r12,1
LB_7127:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7124
	btr r12,0
	jmp LB_7125
LB_7124:
	bts r12,0
LB_7125:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7120
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_7141
	btr r12,2
	jmp LB_7142
LB_7141:
	bts r12,2
LB_7142:
	mov r13,r14
	bt r12,1
	jc LB_7143
	btr r12,0
	jmp LB_7144
LB_7143:
	bts r12,0
LB_7144:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f182 %_4918 ⊢ %_4919 : %_4919
 ; {>  %_4918~0':(_lst)◂(_r64) }
; _f182 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_182
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_4919 ⊢ %_4920 : %_4920
 ; {>  %_4919~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_4920
 ; {>  %_4920~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7118
	btr r12,3
	jmp LB_7119
LB_7118:
	bts r12,3
LB_7119:
	mov r8,0
	bts r12,2
	ret
LB_7120:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7122
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7121
LB_7122:
	add rsp,8
	ret
LB_7123:
	add rsp,32
	pop r14
LB_7121:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4690:
NS_E_RDI_4690:
NS_E_4690_ETR_TBL:
NS_E_4690_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_7166
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_7166
	jmp LB_7167
LB_7166:
	jmp LB_7158
LB_7167:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7159
	btr r12,0
	jmp LB_7160
LB_7159:
	bts r12,0
LB_7160:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7155
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_4921 : %_4921
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_4921
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_4922 : %_4922
 ; {>  %_4921~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_4921 %_4922 } ⊢ %_4923 : %_4923
 ; {>  %_4922~°1◂{  }:(_lst)◂(t2294'(0)) %_4921~0':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_4923 ⊢ %_4924 : %_4924
 ; {>  %_4923~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_4924
 ; {>  %_4924~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_7149
	btr r12,1
	jmp LB_7150
LB_7149:
	bts r12,1
LB_7150:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_7147
	btr QWORD [rdi],0
	jmp LB_7148
LB_7147:
	bts QWORD [rdi],0
LB_7148:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_7153
	mov rsi,0
	bt r14,0
	jc LB_7153
	jmp LB_7154
LB_7153:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_7154:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_7151
	btr QWORD [rdi],1
	jmp LB_7152
LB_7151:
	bts QWORD [rdi],1
LB_7152:
	mov rsi,1
	bt r12,3
	jc LB_7145
	mov rsi,0
	bt r9,0
	jc LB_7145
	jmp LB_7146
LB_7145:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7146:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7155:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7157
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7156
LB_7157:
	add rsp,8
	ret
LB_7158:
	add rsp,16
	pop r14
LB_7156:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_67_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7189
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7181
LB_7189:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_4690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7194
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7195
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7195:
	jmp LB_7181
LB_7194:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7184
	btr r12,1
	jmp LB_7185
LB_7184:
	bts r12,1
LB_7185:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7182
	btr r12,0
	jmp LB_7183
LB_7182:
	bts r12,0
LB_7183:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7178
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_4925 %_4926 } ⊢ %_4927 : %_4927
 ; {>  %_4925~0':_r64 %_4926~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4927 ⊢ %_4928 : %_4928
 ; {>  %_4927~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4928
 ; {>  %_4928~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_7172
	btr r12,2
	jmp LB_7173
LB_7172:
	bts r12,2
LB_7173:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_7170
	btr QWORD [rdi],0
	jmp LB_7171
LB_7170:
	bts QWORD [rdi],0
LB_7171:
	mov r8,r14
	bt r12,1
	jc LB_7176
	btr r12,2
	jmp LB_7177
LB_7176:
	bts r12,2
LB_7177:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_7174
	btr QWORD [rdi],1
	jmp LB_7175
LB_7174:
	bts QWORD [rdi],1
LB_7175:
	mov rsi,1
	bt r12,3
	jc LB_7168
	mov rsi,0
	bt r9,0
	jc LB_7168
	jmp LB_7169
LB_7168:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7169:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7178:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7180
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7179
LB_7180:
	add rsp,8
	ret
LB_7181:
	add rsp,32
	pop r14
LB_7179:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4691:
NS_E_RDI_4691:
NS_E_4691_ETR_TBL:
NS_E_4691_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_7235
LB_7234:
	add r14,1
LB_7235:
	cmp r14,r10
	jge LB_7236
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7234
	cmp al,10
	jz LB_7234
	cmp al,32
	jz LB_7234
LB_7236:
	add r14,4
	cmp r14,r10
	jg LB_7239
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_7239
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_7239
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_7239
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_7239
	jmp LB_7240
LB_7239:
	jmp LB_7213
LB_7240:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_7222
LB_7221:
	add r14,1
LB_7222:
	cmp r14,r10
	jge LB_7223
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7221
	cmp al,10
	jz LB_7221
	cmp al,32
	jz LB_7221
LB_7223:
	push r10
	call NS_E_4692_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7224
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7225
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7225:
	jmp LB_7214
LB_7224:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_7228
LB_7227:
	add r14,1
LB_7228:
	cmp r14,r10
	jge LB_7229
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7227
	cmp al,10
	jz LB_7227
	cmp al,32
	jz LB_7227
LB_7229:
	push r10
	call NS_E_4682_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7230
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7231
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7231:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7232
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7232:
	jmp LB_7214
LB_7230:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7219
	btr r12,2
	jmp LB_7220
LB_7219:
	bts r12,2
LB_7220:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7217
	btr r12,1
	jmp LB_7218
LB_7217:
	bts r12,1
LB_7218:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7215
	btr r12,0
	jmp LB_7216
LB_7215:
	bts r12,0
LB_7216:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7210
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_7241
	btr r12,3
	jmp LB_7242
LB_7241:
	bts r12,3
LB_7242:
	mov r14,r8
	bt r12,2
	jc LB_7243
	btr r12,1
	jmp LB_7244
LB_7243:
	bts r12,1
LB_7244:
	mov r8,r13
	bt r12,0
	jc LB_7245
	btr r12,2
	jmp LB_7246
LB_7245:
	bts r12,2
LB_7246:
	mov r13,r9
	bt r12,3
	jc LB_7247
	btr r12,0
	jmp LB_7248
LB_7247:
	bts r12,0
LB_7248:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_4931 : %_4931
 ; {>  %_4929~0':(_lst)◂(_p805) %_4930~1':_p802 }
; _nil {  } ⊢ °1◂{  }
; _f865 %_4930 ⊢ %_4932 : %_4932
 ; {>  %_4931~°1◂{  }:(_lst)◂(t2309'(0)) %_4929~0':(_lst)◂(_p805) %_4930~1':_p802 }
; _f865 1' ⊢ °1◂1'
; _f863 { %_4931 %_4932 } ⊢ %_4933 : %_4933
 ; {>  %_4932~°1◂1':_p804 %_4931~°1◂{  }:(_lst)◂(t2309'(0)) %_4929~0':(_lst)◂(_p805) }
; _f863 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_4933 ⊢ %_4934 : %_4934
 ; {>  %_4929~0':(_lst)◂(_p805) %_4933~°1◂{ °1◂{  } °1◂1' }:_p803 }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_4934
 ; {>  %_4934~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂(_p803) %_4929~0':(_lst)◂(_p805) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_7197
	mov rdi,r13
	call dlt
LB_7197:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂°1◂{ °1◂{  } °1◂1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_7202
	mov rsi,0
	bt r13,0
	jc LB_7202
	jmp LB_7203
LB_7202:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7203:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_7200
	btr QWORD [rdi],0
	jmp LB_7201
LB_7200:
	bts QWORD [rdi],0
LB_7201:
	mov r13,r14
	bt r12,1
	jc LB_7208
	btr r12,0
	jmp LB_7209
LB_7208:
	bts r12,0
LB_7209:
	mov rsi,1
	bt r12,0
	jc LB_7206
	mov rsi,0
	bt r13,0
	jc LB_7206
	jmp LB_7207
LB_7206:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7207:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_7204
	btr QWORD [rdi],1
	jmp LB_7205
LB_7204:
	bts QWORD [rdi],1
LB_7205:
	mov rsi,1
	bt r12,3
	jc LB_7198
	mov rsi,0
	bt r9,0
	jc LB_7198
	jmp LB_7199
LB_7198:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7199:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7210:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7212
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7211
LB_7212:
	add rsp,8
	ret
LB_7214:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_7213:
	add rsp,48
	pop r14
LB_7211:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_7279
LB_7278:
	add r14,1
LB_7279:
	cmp r14,r10
	jge LB_7280
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7278
	cmp al,10
	jz LB_7278
	cmp al,32
	jz LB_7278
LB_7280:
	add r14,3
	cmp r14,r10
	jg LB_7283
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7283
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_7283
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_7283
	jmp LB_7284
LB_7283:
	jmp LB_7269
LB_7284:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_7286
LB_7285:
	add r14,1
LB_7286:
	cmp r14,r10
	jge LB_7287
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7285
	cmp al,10
	jz LB_7285
	cmp al,32
	jz LB_7285
LB_7287:
	push r10
	call NS_E_4692_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7288
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7289
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7289:
	jmp LB_7269
LB_7288:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_7292
LB_7291:
	add r14,1
LB_7292:
	cmp r14,r10
	jge LB_7293
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7291
	cmp al,10
	jz LB_7291
	cmp al,32
	jz LB_7291
LB_7293:
	push r10
	call NS_E_4682_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7294
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7295
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7295:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7296
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7296:
	jmp LB_7269
LB_7294:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_7299
LB_7298:
	add r14,1
LB_7299:
	cmp r14,r10
	jge LB_7300
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7298
	cmp al,10
	jz LB_7298
	cmp al,32
	jz LB_7298
LB_7300:
	push r10
	call NS_E_4691_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7301
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7302
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7302:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7303
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7303:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7304
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7304:
	jmp LB_7269
LB_7301:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7276
	btr r12,3
	jmp LB_7277
LB_7276:
	bts r12,3
LB_7277:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7274
	btr r12,2
	jmp LB_7275
LB_7274:
	bts r12,2
LB_7275:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7272
	btr r12,1
	jmp LB_7273
LB_7272:
	bts r12,1
LB_7273:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7270
	btr r12,0
	jmp LB_7271
LB_7270:
	bts r12,0
LB_7271:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7266
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_7306
	btr r12,4
	jmp LB_7307
LB_7306:
	bts r12,4
LB_7307:
	mov r8,r9
	bt r12,3
	jc LB_7308
	btr r12,2
	jmp LB_7309
LB_7308:
	bts r12,2
LB_7309:
	mov r9,r14
	bt r12,1
	jc LB_7310
	btr r12,3
	jmp LB_7311
LB_7310:
	bts r12,3
LB_7311:
	mov r14,r10
	bt r12,4
	jc LB_7312
	btr r12,1
	jmp LB_7313
LB_7312:
	bts r12,1
LB_7313:
	mov r10,r13
	bt r12,0
	jc LB_7314
	btr r12,4
	jmp LB_7315
LB_7314:
	bts r12,4
LB_7315:
	mov r13,r9
	bt r12,3
	jc LB_7316
	btr r12,0
	jmp LB_7317
LB_7316:
	bts r12,0
LB_7317:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_4938 : %_4938
 ; {>  %_4936~1':_p802 %_4935~0':(_lst)◂(_p805) %_4937~2':_p803 }
; _nil {  } ⊢ °1◂{  }
; _f865 %_4936 ⊢ %_4939 : %_4939
 ; {>  %_4938~°1◂{  }:(_lst)◂(t2319'(0)) %_4936~1':_p802 %_4935~0':(_lst)◂(_p805) %_4937~2':_p803 }
; _f865 1' ⊢ °1◂1'
; _f862 { %_4938 %_4939 %_4937 } ⊢ %_4940 : %_4940
 ; {>  %_4939~°1◂1':_p804 %_4938~°1◂{  }:(_lst)◂(t2319'(0)) %_4935~0':(_lst)◂(_p805) %_4937~2':_p803 }
; _f862 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_4940 ⊢ %_4941 : %_4941
 ; {>  %_4940~°0◂{ °1◂{  } °1◂1' 2' }:_p803 %_4935~0':(_lst)◂(_p805) }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_4941
 ; {>  %_4941~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂(_p803) %_4935~0':(_lst)◂(_p805) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_7249
	mov rdi,r13
	call dlt
LB_7249:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °1◂{  } °1◂1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_7254
	mov rsi,0
	bt r13,0
	jc LB_7254
	jmp LB_7255
LB_7254:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7255:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_7252
	btr QWORD [rdi],0
	jmp LB_7253
LB_7252:
	bts QWORD [rdi],0
LB_7253:
	mov r13,r14
	bt r12,1
	jc LB_7260
	btr r12,0
	jmp LB_7261
LB_7260:
	bts r12,0
LB_7261:
	mov rsi,1
	bt r12,0
	jc LB_7258
	mov rsi,0
	bt r13,0
	jc LB_7258
	jmp LB_7259
LB_7258:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_7259:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_7256
	btr QWORD [rdi],1
	jmp LB_7257
LB_7256:
	bts QWORD [rdi],1
LB_7257:
	mov r13,r8
	bt r12,2
	jc LB_7264
	btr r12,0
	jmp LB_7265
LB_7264:
	bts r12,0
LB_7265:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r13
	bt r12,0
	jc LB_7262
	btr QWORD [rdi],2
	jmp LB_7263
LB_7262:
	bts QWORD [rdi],2
LB_7263:
	mov rsi,1
	bt r12,3
	jc LB_7250
	mov rsi,0
	bt r9,0
	jc LB_7250
	jmp LB_7251
LB_7250:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7251:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7266:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7268
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7267
LB_7268:
	add rsp,8
	ret
LB_7269:
	add rsp,64
	pop r14
LB_7267:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4692:
NS_E_RDI_4692:
NS_E_4692_ETR_TBL:
NS_E_4692_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mtc_test
	jmp LB_7337
LB_7336:
	add r14,1
LB_7337:
	cmp r14,r10
	jge LB_7338
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7336
	cmp al,10
	jz LB_7336
	cmp al,32
	jz LB_7336
LB_7338:
	push r10
	call NS_E_4693_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7339
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7331
LB_7339:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_7342
LB_7341:
	add r14,1
LB_7342:
	cmp r14,r10
	jge LB_7343
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7341
	cmp al,10
	jz LB_7341
	cmp al,32
	jz LB_7341
LB_7343:
	push r10
	call NS_E_4694_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7344
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7345
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7345:
	jmp LB_7331
LB_7344:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7334
	btr r12,1
	jmp LB_7335
LB_7334:
	bts r12,1
LB_7335:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7332
	btr r12,0
	jmp LB_7333
LB_7332:
	bts r12,0
LB_7333:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7328
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_4942 %_4943 } ⊢ %_4944 : %_4944
 ; {>  %_4943~1':(_lst)◂(_p805) %_4942~0':_p805 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4944 ⊢ %_4945 : %_4945
 ; {>  %_4944~°0◂{ 0' 1' }:(_lst)◂(_p805) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4945
 ; {>  %_4945~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p805)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_7322
	btr r12,2
	jmp LB_7323
LB_7322:
	bts r12,2
LB_7323:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_7320
	btr QWORD [rdi],0
	jmp LB_7321
LB_7320:
	bts QWORD [rdi],0
LB_7321:
	mov r8,r14
	bt r12,1
	jc LB_7326
	btr r12,2
	jmp LB_7327
LB_7326:
	bts r12,2
LB_7327:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_7324
	btr QWORD [rdi],1
	jmp LB_7325
LB_7324:
	bts QWORD [rdi],1
LB_7325:
	mov rsi,1
	bt r12,3
	jc LB_7318
	mov rsi,0
	bt r9,0
	jc LB_7318
	jmp LB_7319
LB_7318:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7319:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7328:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7330
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7329
LB_7330:
	add rsp,8
	ret
LB_7331:
	add rsp,32
	pop r14
LB_7329:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_7358
LB_7357:
	add r14,1
LB_7358:
	cmp r14,r10
	jge LB_7359
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7357
	cmp al,32
	jz LB_7357
LB_7359:
	add r14,1
	cmp r14,r10
	jg LB_7362
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_7362
	jmp LB_7363
LB_7362:
	jmp LB_7352
LB_7363:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_7365
LB_7364:
	add r14,1
LB_7365:
	cmp r14,r10
	jge LB_7366
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7364
	cmp al,32
	jz LB_7364
LB_7366:
	add r14,1
	cmp r14,r10
	jg LB_7370
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_7370
	jmp LB_7371
LB_7370:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7368
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7368:
	jmp LB_7352
LB_7371:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7355
	btr r12,1
	jmp LB_7356
LB_7355:
	bts r12,1
LB_7356:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7353
	btr r12,0
	jmp LB_7354
LB_7353:
	bts r12,0
LB_7354:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7349
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_4946 : %_4946
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4946 ⊢ %_4947 : %_4947
 ; {>  %_4946~°1◂{  }:(_lst)◂(t2332'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4947
 ; {>  %_4947~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2335'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_7347
	mov rsi,0
	bt r9,0
	jc LB_7347
	jmp LB_7348
LB_7347:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7348:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7349:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7351
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7350
LB_7351:
	add rsp,8
	ret
LB_7352:
	add rsp,32
	pop r14
LB_7350:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4693:
NS_E_RDI_4693:
NS_E_4693_ETR_TBL:
NS_E_4693_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src_ptn
	jmp LB_7428
LB_7427:
	add r14,1
LB_7428:
	cmp r14,r10
	jge LB_7429
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7427
	cmp al,10
	jz LB_7427
	cmp al,32
	jz LB_7427
LB_7429:
	push r10
	call NS_E_3819_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7430
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7389
LB_7430:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_7433
LB_7432:
	add r14,1
LB_7433:
	cmp r14,r10
	jge LB_7434
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7432
	cmp al,10
	jz LB_7432
	cmp al,32
	jz LB_7432
LB_7434:
	add r14,3
	cmp r14,r10
	jg LB_7438
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7438
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7438
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7438
	jmp LB_7439
LB_7438:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7436
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7436:
	jmp LB_7389
LB_7439:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_7402
LB_7401:
	add r14,1
LB_7402:
	cmp r14,r10
	jge LB_7403
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7401
	cmp al,10
	jz LB_7401
	cmp al,32
	jz LB_7401
LB_7403:
	push r10
	call NS_E_3623_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7404
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7405
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7405:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7406
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7406:
	jmp LB_7390
LB_7404:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_7409
LB_7408:
	add r14,1
LB_7409:
	cmp r14,r10
	jge LB_7410
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7408
	cmp al,10
	jz LB_7408
	cmp al,32
	jz LB_7408
LB_7410:
	add r14,3
	cmp r14,r10
	jg LB_7416
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7416
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_7416
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_7416
	jmp LB_7417
LB_7416:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7412
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7412:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7413
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7413:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7414
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7414:
	jmp LB_7390
LB_7417:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_7419
LB_7418:
	add r14,1
LB_7419:
	cmp r14,r10
	jge LB_7420
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7418
	cmp al,10
	jz LB_7418
	cmp al,32
	jz LB_7418
LB_7420:
	push r10
	call NS_E_4083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7421
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7422
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7422:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7423
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7423:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7424
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7424:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7425
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7425:
	jmp LB_7390
LB_7421:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7399
	btr r12,4
	jmp LB_7400
LB_7399:
	bts r12,4
LB_7400:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7397
	btr r12,3
	jmp LB_7398
LB_7397:
	bts r12,3
LB_7398:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7395
	btr r12,2
	jmp LB_7396
LB_7395:
	bts r12,2
LB_7396:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7393
	btr r12,1
	jmp LB_7394
LB_7393:
	bts r12,1
LB_7394:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7391
	btr r12,0
	jmp LB_7392
LB_7391:
	bts r12,0
LB_7392:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_7386
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_7440
	btr r12,5
	jmp LB_7441
LB_7440:
	bts r12,5
LB_7441:
	mov r8,r10
	bt r12,4
	jc LB_7442
	btr r12,2
	jmp LB_7443
LB_7442:
	bts r12,2
LB_7443:
	mov r10,r14
	bt r12,1
	jc LB_7444
	btr r12,4
	jmp LB_7445
LB_7444:
	bts r12,4
LB_7445:
	mov r14,r11
	bt r12,5
	jc LB_7446
	btr r12,1
	jmp LB_7447
LB_7446:
	bts r12,1
LB_7447:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f866 { %_4948 %_4949 %_4950 } ⊢ %_4951 : %_4951
 ; {>  %_4948~0':_p798 %_4949~1':_p735 %_4950~2':_p799 }
; _f866 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_4951 ⊢ %_4952 : %_4952
 ; {>  %_4951~°0◂{ 0' 1' 2' }:_p805 }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_4952
 ; {>  %_4952~°0◂°0◂{ 0' 1' 2' }:(_opn)◂(_p805) }
; 	∎ °0◂°0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_7376
	btr r12,4
	jmp LB_7377
LB_7376:
	bts r12,4
LB_7377:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_7374
	btr QWORD [rdi],0
	jmp LB_7375
LB_7374:
	bts QWORD [rdi],0
LB_7375:
	mov r10,r14
	bt r12,1
	jc LB_7380
	btr r12,4
	jmp LB_7381
LB_7380:
	bts r12,4
LB_7381:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_7378
	btr QWORD [rdi],1
	jmp LB_7379
LB_7378:
	bts QWORD [rdi],1
LB_7379:
	mov r10,r8
	bt r12,2
	jc LB_7384
	btr r12,4
	jmp LB_7385
LB_7384:
	bts r12,4
LB_7385:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_7382
	btr QWORD [rdi],2
	jmp LB_7383
LB_7382:
	bts QWORD [rdi],2
LB_7383:
	mov rsi,1
	bt r12,3
	jc LB_7372
	mov rsi,0
	bt r9,0
	jc LB_7372
	jmp LB_7373
LB_7372:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7373:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7386:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7388
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7387
LB_7388:
	add rsp,8
	ret
LB_7390:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_7389:
	add rsp,80
	pop r14
LB_7387:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; mtc_val
	jmp LB_7469
LB_7468:
	add r14,1
LB_7469:
	cmp r14,r10
	jge LB_7470
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7468
	cmp al,32
	jz LB_7468
LB_7470:
	push r10
	call NS_E_4695_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7471
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7461
LB_7471:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_7474
LB_7473:
	add r14,1
LB_7474:
	cmp r14,r10
	jge LB_7475
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7473
	cmp al,32
	jz LB_7473
LB_7475:
	add r14,1
	cmp r14,r10
	jg LB_7479
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_7479
	jmp LB_7480
LB_7479:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7477
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7477:
	jmp LB_7461
LB_7480:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_7482
LB_7481:
	add r14,1
LB_7482:
	cmp r14,r10
	jge LB_7483
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7481
	cmp al,32
	jz LB_7481
LB_7483:
	push r10
	call NS_E_4695_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7484
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7485
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7485:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7486
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7486:
	jmp LB_7461
LB_7484:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7466
	btr r12,2
	jmp LB_7467
LB_7466:
	bts r12,2
LB_7467:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7464
	btr r12,1
	jmp LB_7465
LB_7464:
	bts r12,1
LB_7465:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7462
	btr r12,0
	jmp LB_7463
LB_7462:
	bts r12,0
LB_7463:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7458
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_7488
	btr r12,3
	jmp LB_7489
LB_7488:
	bts r12,3
LB_7489:
	mov r14,r8
	bt r12,2
	jc LB_7490
	btr r12,1
	jmp LB_7491
LB_7490:
	bts r12,1
LB_7491:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f867 { %_4953 %_4954 } ⊢ %_4955 : %_4955
 ; {>  %_4954~1':_p806 %_4953~0':_p806 }
; _f867 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_4955 ⊢ %_4956 : %_4956
 ; {>  %_4955~°1◂{ 0' 1' }:_p805 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_4956
 ; {>  %_4956~°0◂°1◂{ 0' 1' }:(_opn)◂(_p805) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_7452
	btr r12,2
	jmp LB_7453
LB_7452:
	bts r12,2
LB_7453:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_7450
	btr QWORD [rdi],0
	jmp LB_7451
LB_7450:
	bts QWORD [rdi],0
LB_7451:
	mov r8,r14
	bt r12,1
	jc LB_7456
	btr r12,2
	jmp LB_7457
LB_7456:
	bts r12,2
LB_7457:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_7454
	btr QWORD [rdi],1
	jmp LB_7455
LB_7454:
	bts QWORD [rdi],1
LB_7455:
	mov rsi,1
	bt r12,3
	jc LB_7448
	mov rsi,0
	bt r9,0
	jc LB_7448
	jmp LB_7449
LB_7448:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7449:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7458:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7460
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7459
LB_7460:
	add rsp,8
	ret
LB_7461:
	add rsp,48
	pop r14
LB_7459:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4694:
NS_E_RDI_4694:
NS_E_4694_ETR_TBL:
NS_E_4694_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ";"
	jmp LB_7527
LB_7526:
	add r14,1
LB_7527:
	cmp r14,r10
	jge LB_7528
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7526
	cmp al,10
	jz LB_7526
	cmp al,32
	jz LB_7526
LB_7528:
	add r14,1
	cmp r14,r10
	jg LB_7531
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_7531
	jmp LB_7532
LB_7531:
	jmp LB_7505
LB_7532:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_7514
LB_7513:
	add r14,1
LB_7514:
	cmp r14,r10
	jge LB_7515
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7513
	cmp al,10
	jz LB_7513
	cmp al,32
	jz LB_7513
LB_7515:
	push r10
	call NS_E_4693_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7516
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7517
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7517:
	jmp LB_7506
LB_7516:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_7520
LB_7519:
	add r14,1
LB_7520:
	cmp r14,r10
	jge LB_7521
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7519
	cmp al,10
	jz LB_7519
	cmp al,32
	jz LB_7519
LB_7521:
	push r10
	call NS_E_4694_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7522
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7523
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7523:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7524
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7524:
	jmp LB_7506
LB_7522:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7511
	btr r12,2
	jmp LB_7512
LB_7511:
	bts r12,2
LB_7512:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7509
	btr r12,1
	jmp LB_7510
LB_7509:
	bts r12,1
LB_7510:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7507
	btr r12,0
	jmp LB_7508
LB_7507:
	bts r12,0
LB_7508:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7502
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_7533
	btr r12,3
	jmp LB_7534
LB_7533:
	bts r12,3
LB_7534:
	mov r14,r8
	bt r12,2
	jc LB_7535
	btr r12,1
	jmp LB_7536
LB_7535:
	bts r12,1
LB_7536:
	mov r8,r13
	bt r12,0
	jc LB_7537
	btr r12,2
	jmp LB_7538
LB_7537:
	bts r12,2
LB_7538:
	mov r13,r9
	bt r12,3
	jc LB_7539
	btr r12,0
	jmp LB_7540
LB_7539:
	bts r12,0
LB_7540:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_4957 %_4958 } ⊢ %_4959 : %_4959
 ; {>  %_4957~0':_p805 %_4958~1':(_lst)◂(_p805) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4959 ⊢ %_4960 : %_4960
 ; {>  %_4959~°0◂{ 0' 1' }:(_lst)◂(_p805) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4960
 ; {>  %_4960~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p805)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_7496
	btr r12,2
	jmp LB_7497
LB_7496:
	bts r12,2
LB_7497:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_7494
	btr QWORD [rdi],0
	jmp LB_7495
LB_7494:
	bts QWORD [rdi],0
LB_7495:
	mov r8,r14
	bt r12,1
	jc LB_7500
	btr r12,2
	jmp LB_7501
LB_7500:
	bts r12,2
LB_7501:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_7498
	btr QWORD [rdi],1
	jmp LB_7499
LB_7498:
	bts QWORD [rdi],1
LB_7499:
	mov rsi,1
	bt r12,3
	jc LB_7492
	mov rsi,0
	bt r9,0
	jc LB_7492
	jmp LB_7493
LB_7492:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7493:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7502:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7504
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7503
LB_7504:
	add rsp,8
	ret
LB_7506:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_7505:
	add rsp,48
	pop r14
LB_7503:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_7552
LB_7551:
	add r14,1
LB_7552:
	cmp r14,r10
	jge LB_7553
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7551
	cmp al,32
	jz LB_7551
LB_7553:
	add r14,1
	cmp r14,r10
	jg LB_7556
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_7556
	jmp LB_7557
LB_7556:
	jmp LB_7546
LB_7557:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_7559
LB_7558:
	add r14,1
LB_7559:
	cmp r14,r10
	jge LB_7560
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7558
	cmp al,32
	jz LB_7558
LB_7560:
	add r14,1
	cmp r14,r10
	jg LB_7564
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_7564
	jmp LB_7565
LB_7564:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7562
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7562:
	jmp LB_7546
LB_7565:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7549
	btr r12,1
	jmp LB_7550
LB_7549:
	bts r12,1
LB_7550:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7547
	btr r12,0
	jmp LB_7548
LB_7547:
	bts r12,0
LB_7548:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7543
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_4961 : %_4961
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4961 ⊢ %_4962 : %_4962
 ; {>  %_4961~°1◂{  }:(_lst)◂(t2356'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4962
 ; {>  %_4962~°0◂°1◂{  }:(_opn)◂((_lst)◂(t2359'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_7541
	mov rsi,0
	bt r9,0
	jc LB_7541
	jmp LB_7542
LB_7541:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7542:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7543:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7545
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7544
LB_7545:
	add rsp,8
	ret
LB_7546:
	add rsp,32
	pop r14
LB_7544:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4695:
NS_E_RDI_4695:
NS_E_4695_ETR_TBL:
NS_E_4695_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7581
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7573
LB_7581:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_7589
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_7589
	jmp LB_7590
LB_7589:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7587
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7587:
	jmp LB_7573
LB_7590:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7576
	btr r12,1
	jmp LB_7577
LB_7576:
	bts r12,1
LB_7577:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7574
	btr r12,0
	jmp LB_7575
LB_7574:
	bts r12,0
LB_7575:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7570
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f869 %_4963 ⊢ %_4964 : %_4964
 ; {>  %_4963~0':_stg }
; _f869 0' ⊢ °1◂0'
; _some %_4964 ⊢ %_4965 : %_4965
 ; {>  %_4964~°1◂0':_p806 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4965
 ; {>  %_4965~°0◂°1◂0':(_opn)◂(_p806) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7568
	btr r12,3
	jmp LB_7569
LB_7568:
	bts r12,3
LB_7569:
	mov rsi,1
	bt r12,3
	jc LB_7566
	mov rsi,0
	bt r9,0
	jc LB_7566
	jmp LB_7567
LB_7566:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7567:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7570:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7572
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7571
LB_7572:
	add rsp,8
	ret
LB_7573:
	add rsp,32
	pop r14
LB_7571:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_3690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7604
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7598
LB_7604:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7599
	btr r12,0
	jmp LB_7600
LB_7599:
	bts r12,0
LB_7600:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7595
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f868 %_4966 ⊢ %_4967 : %_4967
 ; {>  %_4966~0':_p801 }
; _f868 0' ⊢ °0◂0'
; _some %_4967 ⊢ %_4968 : %_4968
 ; {>  %_4967~°0◂0':_p806 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4968
 ; {>  %_4968~°0◂°0◂0':(_opn)◂(_p806) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7593
	btr r12,3
	jmp LB_7594
LB_7593:
	bts r12,3
LB_7594:
	mov rsi,1
	bt r12,3
	jc LB_7591
	mov rsi,0
	bt r9,0
	jc LB_7591
	jmp LB_7592
LB_7591:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7592:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7595:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7597
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7596
LB_7597:
	add rsp,8
	ret
LB_7598:
	add rsp,16
	pop r14
LB_7596:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4696:
NS_E_RDI_4696:
NS_E_4696_ETR_TBL:
NS_E_4696_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_7627
LB_7626:
	add r14,1
LB_7627:
	cmp r14,r10
	jge LB_7628
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7626
	cmp al,10
	jz LB_7626
	cmp al,32
	jz LB_7626
LB_7628:
	add r14,1
	cmp r14,r10
	jg LB_7631
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_7631
	jmp LB_7632
LB_7631:
	jmp LB_7617
LB_7632:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_7634
LB_7633:
	add r14,1
LB_7634:
	cmp r14,r10
	jge LB_7635
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7633
	cmp al,10
	jz LB_7633
	cmp al,32
	jz LB_7633
LB_7635:
	add r14,1
	cmp r14,r10
	jg LB_7639
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_7639
	jmp LB_7640
LB_7639:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7637
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7637:
	jmp LB_7617
LB_7640:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_7642
LB_7641:
	add r14,1
LB_7642:
	cmp r14,r10
	jge LB_7643
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7641
	cmp al,10
	jz LB_7641
	cmp al,32
	jz LB_7641
LB_7643:
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7644
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7645
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7645:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7646
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7646:
	jmp LB_7617
LB_7644:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_7649
LB_7648:
	add r14,1
LB_7649:
	cmp r14,r10
	jge LB_7650
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7648
	cmp al,10
	jz LB_7648
	cmp al,32
	jz LB_7648
LB_7650:
	push r10
	call NS_E_4697_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7651
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7652
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7652:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7653
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7653:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7654
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7654:
	jmp LB_7617
LB_7651:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7624
	btr r12,3
	jmp LB_7625
LB_7624:
	bts r12,3
LB_7625:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7622
	btr r12,2
	jmp LB_7623
LB_7622:
	bts r12,2
LB_7623:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7620
	btr r12,1
	jmp LB_7621
LB_7620:
	bts r12,1
LB_7621:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7618
	btr r12,0
	jmp LB_7619
LB_7618:
	bts r12,0
LB_7619:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7614
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov r10,r14
	bt r12,1
	jc LB_7656
	btr r12,4
	jmp LB_7657
LB_7656:
	bts r12,4
LB_7657:
	mov r14,r9
	bt r12,3
	jc LB_7658
	btr r12,1
	jmp LB_7659
LB_7658:
	bts r12,1
LB_7659:
	mov r9,r13
	bt r12,0
	jc LB_7660
	btr r12,3
	jmp LB_7661
LB_7660:
	bts r12,3
LB_7661:
	mov r13,r8
	bt r12,2
	jc LB_7662
	btr r12,0
	jmp LB_7663
LB_7662:
	bts r12,0
LB_7663:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_4969 %_4970 } ⊢ %_4971 : %_4971
 ; {>  %_4969~0':_stg %_4970~1':_p787 }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_4971
 ; {>  %_4971~°0◂{ 0' 1' }:(_opn)◂({ _stg _p787 }) }
; 	∎ °0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_7608
	btr r12,2
	jmp LB_7609
LB_7608:
	bts r12,2
LB_7609:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_7606
	btr QWORD [rdi],0
	jmp LB_7607
LB_7606:
	bts QWORD [rdi],0
LB_7607:
	mov r8,r14
	bt r12,1
	jc LB_7612
	btr r12,2
	jmp LB_7613
LB_7612:
	bts r12,2
LB_7613:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_7610
	btr QWORD [rdi],1
	jmp LB_7611
LB_7610:
	bts QWORD [rdi],1
LB_7611:
	mov r8,0
	bts r12,2
	ret
LB_7614:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7616
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7615
LB_7616:
	add rsp,8
	ret
LB_7617:
	add rsp,64
	pop r14
LB_7615:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4697:
NS_E_RDI_4697:
NS_E_4697_ETR_TBL:
NS_E_4697_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_7675
LB_7674:
	add r14,1
LB_7675:
	cmp r14,r10
	jge LB_7676
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7674
	cmp al,10
	jz LB_7674
	cmp al,32
	jz LB_7674
LB_7676:
	push r10
	call NS_E_4698_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7677
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7671
LB_7677:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7672
	btr r12,0
	jmp LB_7673
LB_7672:
	bts r12,0
LB_7673:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7668
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f824 %_4972 ⊢ %_4973 : %_4973
 ; {>  %_4972~0':_p789 }
; _f824 0' ⊢ °1◂0'
; _some %_4973 ⊢ %_4974 : %_4974
 ; {>  %_4973~°1◂0':_p787 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_4974
 ; {>  %_4974~°0◂°1◂0':(_opn)◂(_p787) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7666
	btr r12,3
	jmp LB_7667
LB_7666:
	bts r12,3
LB_7667:
	mov rsi,1
	bt r12,3
	jc LB_7664
	mov rsi,0
	bt r9,0
	jc LB_7664
	jmp LB_7665
LB_7664:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7665:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7668:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7670
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7669
LB_7670:
	add rsp,8
	ret
LB_7671:
	add rsp,16
	pop r14
LB_7669:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_7690
LB_7689:
	add r14,1
LB_7690:
	cmp r14,r10
	jge LB_7691
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7689
	cmp al,10
	jz LB_7689
	cmp al,32
	jz LB_7689
LB_7691:
	push r10
	call NS_E_4706_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7692
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7686
LB_7692:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7687
	btr r12,0
	jmp LB_7688
LB_7687:
	bts r12,0
LB_7688:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_7683
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f823 %_4975 ⊢ %_4976 : %_4976
 ; {>  %_4975~0':_p788 }
; _f823 0' ⊢ °0◂0'
; _some %_4976 ⊢ %_4977 : %_4977
 ; {>  %_4976~°0◂0':_p787 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_4977
 ; {>  %_4977~°0◂°0◂0':(_opn)◂(_p787) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7681
	btr r12,3
	jmp LB_7682
LB_7681:
	bts r12,3
LB_7682:
	mov rsi,1
	bt r12,3
	jc LB_7679
	mov rsi,0
	bt r9,0
	jc LB_7679
	jmp LB_7680
LB_7679:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7680:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7683:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7685
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7684
LB_7685:
	add rsp,8
	ret
LB_7686:
	add rsp,16
	pop r14
LB_7684:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4698:
NS_E_RDI_4698:
NS_E_4698_ETR_TBL:
NS_E_4698_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_7743
LB_7742:
	add r14,1
LB_7743:
	cmp r14,r10
	jge LB_7744
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7742
	cmp al,10
	jz LB_7742
	cmp al,32
	jz LB_7742
LB_7744:
	push r10
	call NS_E_4705_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7745
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7721
LB_7745:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_7730
LB_7729:
	add r14,1
LB_7730:
	cmp r14,r10
	jge LB_7731
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7729
	cmp al,10
	jz LB_7729
	cmp al,32
	jz LB_7729
LB_7731:
	push r10
	call NS_E_4700_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7732
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7733
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7733:
	jmp LB_7722
LB_7732:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_7736
LB_7735:
	add r14,1
LB_7736:
	cmp r14,r10
	jge LB_7737
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7735
	cmp al,10
	jz LB_7735
	cmp al,32
	jz LB_7735
LB_7737:
	push r10
	call NS_E_4699_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7738
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7739
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7739:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7740
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7740:
	jmp LB_7722
LB_7738:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7727
	btr r12,2
	jmp LB_7728
LB_7727:
	bts r12,2
LB_7728:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7725
	btr r12,1
	jmp LB_7726
LB_7725:
	bts r12,1
LB_7726:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7723
	btr r12,0
	jmp LB_7724
LB_7723:
	bts r12,0
LB_7724:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7718
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_7747
	btr r12,5
	jmp LB_7748
LB_7747:
	bts r12,5
LB_7748:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_7751
	btr r12,6
	jmp LB_7752
LB_7751:
	bts r12,6
LB_7752:
	mov r8,rcx
	bt r12,6
	jc LB_7749
	btr r12,2
	jmp LB_7750
LB_7749:
	bts r12,2
LB_7750:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_7755
	btr r12,6
	jmp LB_7756
LB_7755:
	bts r12,6
LB_7756:
	mov r9,rcx
	bt r12,6
	jc LB_7753
	btr r12,3
	jmp LB_7754
LB_7753:
	bts r12,3
LB_7754:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_7759
	btr r12,6
	jmp LB_7760
LB_7759:
	bts r12,6
LB_7760:
	mov r10,rcx
	bt r12,6
	jc LB_7757
	btr r12,4
	jmp LB_7758
LB_7757:
	bts r12,4
LB_7758:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _f828 { %_4980 %_4981 %_4978 %_4979 %_4982 } ⊢ %_4983 : %_4983
 ; {>  %_4979~1':_p791 %_4980~2':_p799 %_4978~0':_p790 %_4981~3':_p802 %_4982~4':(_opn)◂(_p789) }
; _f828 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_4983 ⊢ %_4984 : %_4984
 ; {>  %_4983~°1◂{ 2' 3' 0' 1' 4' }:_p789 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_4984
 ; {>  %_4984~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p789) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_7694
	btr r12,5
	jmp LB_7695
LB_7694:
	bts r12,5
LB_7695:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_7700
	btr r12,6
	jmp LB_7701
LB_7700:
	bts r12,6
LB_7701:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_7698
	btr QWORD [rdi],0
	jmp LB_7699
LB_7698:
	bts QWORD [rdi],0
LB_7699:
	mov rcx,r11
	bt r12,5
	jc LB_7704
	btr r12,6
	jmp LB_7705
LB_7704:
	bts r12,6
LB_7705:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_7702
	btr QWORD [rdi],1
	jmp LB_7703
LB_7702:
	bts QWORD [rdi],1
LB_7703:
	mov rcx,r13
	bt r12,0
	jc LB_7708
	btr r12,6
	jmp LB_7709
LB_7708:
	bts r12,6
LB_7709:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_7706
	btr QWORD [rdi],2
	jmp LB_7707
LB_7706:
	bts QWORD [rdi],2
LB_7707:
	mov rcx,r14
	bt r12,1
	jc LB_7712
	btr r12,6
	jmp LB_7713
LB_7712:
	bts r12,6
LB_7713:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_7710
	btr QWORD [rdi],3
	jmp LB_7711
LB_7710:
	bts QWORD [rdi],3
LB_7711:
	mov rcx,r10
	bt r12,4
	jc LB_7716
	btr r12,6
	jmp LB_7717
LB_7716:
	bts r12,6
LB_7717:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_7714
	btr QWORD [rdi],4
	jmp LB_7715
LB_7714:
	bts QWORD [rdi],4
LB_7715:
	mov rsi,1
	bt r12,3
	jc LB_7696
	mov rsi,0
	bt r9,0
	jc LB_7696
	jmp LB_7697
LB_7696:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7697:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7718:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7720
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7719
LB_7720:
	add rsp,8
	ret
LB_7722:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_7721:
	add rsp,48
	pop r14
LB_7719:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord
	jmp LB_7802
LB_7801:
	add r14,1
LB_7802:
	cmp r14,r10
	jge LB_7803
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7801
	cmp al,10
	jz LB_7801
	cmp al,32
	jz LB_7801
LB_7803:
	push r10
	call NS_E_4704_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7804
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7792
LB_7804:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_7807
LB_7806:
	add r14,1
LB_7807:
	cmp r14,r10
	jge LB_7808
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7806
	cmp al,10
	jz LB_7806
	cmp al,32
	jz LB_7806
LB_7808:
	push r10
	call NS_E_4700_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7809
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7810
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7810:
	jmp LB_7792
LB_7809:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_7813
LB_7812:
	add r14,1
LB_7813:
	cmp r14,r10
	jge LB_7814
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7812
	cmp al,10
	jz LB_7812
	cmp al,32
	jz LB_7812
LB_7814:
	push r10
	call NS_E_4699_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7815
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7816
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7816:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7817
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7817:
	jmp LB_7792
LB_7815:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_7820
LB_7819:
	add r14,1
LB_7820:
	cmp r14,r10
	jge LB_7821
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7819
	cmp al,10
	jz LB_7819
	cmp al,32
	jz LB_7819
LB_7821:
	push r10
	call NS_E_4698_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7822
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7823
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7823:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7824
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7824:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7825
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7825:
	jmp LB_7792
LB_7822:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7799
	btr r12,3
	jmp LB_7800
LB_7799:
	bts r12,3
LB_7800:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7797
	btr r12,2
	jmp LB_7798
LB_7797:
	bts r12,2
LB_7798:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7795
	btr r12,1
	jmp LB_7796
LB_7795:
	bts r12,1
LB_7796:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7793
	btr r12,0
	jmp LB_7794
LB_7793:
	bts r12,0
LB_7794:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_7789
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_7827
	btr r12,5
	jmp LB_7828
LB_7827:
	bts r12,5
LB_7828:
	mov rcx,r8
	bt r12,2
	jc LB_7829
	btr r12,6
	jmp LB_7830
LB_7829:
	bts r12,6
LB_7830:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_7833
	btr r12,7
	jmp LB_7834
LB_7833:
	bts r12,7
LB_7834:
	mov r8,rdx
	bt r12,7
	jc LB_7831
	btr r12,2
	jmp LB_7832
LB_7831:
	bts r12,2
LB_7832:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_7837
	btr r12,7
	jmp LB_7838
LB_7837:
	bts r12,7
LB_7838:
	mov r9,rdx
	bt r12,7
	jc LB_7835
	btr r12,3
	jmp LB_7836
LB_7835:
	bts r12,3
LB_7836:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_7841
	btr r12,7
	jmp LB_7842
LB_7841:
	bts r12,7
LB_7842:
	mov r10,rdx
	bt r12,7
	jc LB_7839
	btr r12,4
	jmp LB_7840
LB_7839:
	bts r12,4
LB_7840:
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; _f827 { %_4987 %_4988 %_4985 %_4986 %_4989 %_4990 } ⊢ %_4991 : %_4991
 ; {>  %_4989~4':(_opn)◂(_p789) %_4990~5':_p789 %_4988~3':_p802 %_4985~0':_p790 %_4987~2':_p799 %_4986~1':_p791 }
; _f827 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_4991 ⊢ %_4992 : %_4992
 ; {>  %_4991~°0◂{ 2' 3' 0' 1' 4' 5' }:_p789 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_4992
 ; {>  %_4992~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p789) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_7761
	btr r12,6
	jmp LB_7762
LB_7761:
	bts r12,6
LB_7762:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_7767
	btr r12,7
	jmp LB_7768
LB_7767:
	bts r12,7
LB_7768:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rdx
	bt r12,7
	jc LB_7765
	btr QWORD [rdi],0
	jmp LB_7766
LB_7765:
	bts QWORD [rdi],0
LB_7766:
	mov rdx,rcx
	bt r12,6
	jc LB_7771
	btr r12,7
	jmp LB_7772
LB_7771:
	bts r12,7
LB_7772:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rdx
	bt r12,7
	jc LB_7769
	btr QWORD [rdi],1
	jmp LB_7770
LB_7769:
	bts QWORD [rdi],1
LB_7770:
	mov rdx,r13
	bt r12,0
	jc LB_7775
	btr r12,7
	jmp LB_7776
LB_7775:
	bts r12,7
LB_7776:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rdx
	bt r12,7
	jc LB_7773
	btr QWORD [rdi],2
	jmp LB_7774
LB_7773:
	bts QWORD [rdi],2
LB_7774:
	mov rdx,r14
	bt r12,1
	jc LB_7779
	btr r12,7
	jmp LB_7780
LB_7779:
	bts r12,7
LB_7780:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rdx
	bt r12,7
	jc LB_7777
	btr QWORD [rdi],3
	jmp LB_7778
LB_7777:
	bts QWORD [rdi],3
LB_7778:
	mov rdx,r10
	bt r12,4
	jc LB_7783
	btr r12,7
	jmp LB_7784
LB_7783:
	bts r12,7
LB_7784:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rdx
	bt r12,7
	jc LB_7781
	btr QWORD [rdi],4
	jmp LB_7782
LB_7781:
	bts QWORD [rdi],4
LB_7782:
	mov rdx,r11
	bt r12,5
	jc LB_7787
	btr r12,7
	jmp LB_7788
LB_7787:
	bts r12,7
LB_7788:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*5],rdx
	bt r12,7
	jc LB_7785
	btr QWORD [rdi],5
	jmp LB_7786
LB_7785:
	bts QWORD [rdi],5
LB_7786:
	mov rsi,1
	bt r12,3
	jc LB_7763
	mov rsi,0
	bt r9,0
	jc LB_7763
	jmp LB_7764
LB_7763:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7764:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7789:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7791
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7790
LB_7791:
	add rsp,8
	ret
LB_7792:
	add rsp,64
	pop r14
LB_7790:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4699:
NS_E_RDI_4699:
NS_E_4699_ETR_TBL:
NS_E_4699_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; ";"
	jmp LB_7897
LB_7896:
	add r14,1
LB_7897:
	cmp r14,r10
	jge LB_7898
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7896
	cmp al,10
	jz LB_7896
	cmp al,32
	jz LB_7896
LB_7898:
	add r14,1
	cmp r14,r10
	jg LB_7901
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_7901
	jmp LB_7902
LB_7901:
	jmp LB_7860
LB_7902:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_7904
LB_7903:
	add r14,1
LB_7904:
	cmp r14,r10
	jge LB_7905
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7903
	cmp al,10
	jz LB_7903
	cmp al,32
	jz LB_7903
LB_7905:
	add r14,3
	cmp r14,r10
	jg LB_7909
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7909
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7909
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7909
	jmp LB_7910
LB_7909:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7907
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7907:
	jmp LB_7860
LB_7910:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_7873
LB_7872:
	add r14,1
LB_7873:
	cmp r14,r10
	jge LB_7874
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7872
	cmp al,10
	jz LB_7872
	cmp al,32
	jz LB_7872
LB_7874:
	push r10
	call NS_E_4083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7875
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7876
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7876:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7877
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7877:
	jmp LB_7861
LB_7875:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_7880
LB_7879:
	add r14,1
LB_7880:
	cmp r14,r10
	jge LB_7881
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7879
	cmp al,10
	jz LB_7879
	cmp al,32
	jz LB_7879
LB_7881:
	push r10
	call NS_E_4682_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7882
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7883
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7883:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7884
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7884:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7885
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7885:
	jmp LB_7861
LB_7882:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_7888
LB_7887:
	add r14,1
LB_7888:
	cmp r14,r10
	jge LB_7889
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7887
	cmp al,10
	jz LB_7887
	cmp al,32
	jz LB_7887
LB_7889:
	push r10
	call NS_E_4698_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7890
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_7891
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_7891:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_7892
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_7892:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7893
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7893:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7894
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7894:
	jmp LB_7861
LB_7890:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_7870
	btr r12,4
	jmp LB_7871
LB_7870:
	bts r12,4
LB_7871:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_7868
	btr r12,3
	jmp LB_7869
LB_7868:
	bts r12,3
LB_7869:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7866
	btr r12,2
	jmp LB_7867
LB_7866:
	bts r12,2
LB_7867:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7864
	btr r12,1
	jmp LB_7865
LB_7864:
	bts r12,1
LB_7865:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7862
	btr r12,0
	jmp LB_7863
LB_7862:
	bts r12,0
LB_7863:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_7857
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_7911
	btr r12,5
	jmp LB_7912
LB_7911:
	bts r12,5
LB_7912:
	mov r8,r10
	bt r12,4
	jc LB_7913
	btr r12,2
	jmp LB_7914
LB_7913:
	bts r12,2
LB_7914:
	mov r10,r14
	bt r12,1
	jc LB_7915
	btr r12,4
	jmp LB_7916
LB_7915:
	bts r12,4
LB_7916:
	mov r14,r9
	bt r12,3
	jc LB_7917
	btr r12,1
	jmp LB_7918
LB_7917:
	bts r12,1
LB_7918:
	mov r9,r13
	bt r12,0
	jc LB_7919
	btr r12,3
	jmp LB_7920
LB_7919:
	bts r12,3
LB_7920:
	mov r13,r11
	bt r12,5
	jc LB_7921
	btr r12,0
	jmp LB_7922
LB_7921:
	bts r12,0
LB_7922:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some %_4995 ⊢ %_4996 : %_4996
 ; {>  %_4994~1':_p802 %_4995~2':_p789 %_4993~0':_p799 }
; _some 2' ⊢ °0◂2'
; _some { %_4993 %_4994 %_4996 } ⊢ %_4997 : %_4997
 ; {>  %_4996~°0◂2':(_opn)◂(_p789) %_4994~1':_p802 %_4993~0':_p799 }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_4997
 ; {>  %_4997~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ _p799 _p802 (_opn)◂(_p789) }) }
; 	∎ °0◂{ 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' °0◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_7845
	btr r12,4
	jmp LB_7846
LB_7845:
	bts r12,4
LB_7846:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_7843
	btr QWORD [rdi],0
	jmp LB_7844
LB_7843:
	bts QWORD [rdi],0
LB_7844:
	mov r10,r14
	bt r12,1
	jc LB_7849
	btr r12,4
	jmp LB_7850
LB_7849:
	bts r12,4
LB_7850:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_7847
	btr QWORD [rdi],1
	jmp LB_7848
LB_7847:
	bts QWORD [rdi],1
LB_7848:
	mov r10,r8
	bt r12,2
	jc LB_7855
	btr r12,4
	jmp LB_7856
LB_7855:
	bts r12,4
LB_7856:
	mov rsi,1
	bt r12,4
	jc LB_7853
	mov rsi,0
	bt r10,0
	jc LB_7853
	jmp LB_7854
LB_7853:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_7854:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_7851
	btr QWORD [rdi],2
	jmp LB_7852
LB_7851:
	bts QWORD [rdi],2
LB_7852:
	mov r8,0
	bts r12,2
	ret
LB_7857:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7859
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7858
LB_7859:
	add rsp,8
	ret
LB_7861:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_7860:
	add rsp,80
	pop r14
LB_7858:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_7960
LB_7959:
	add r14,1
LB_7960:
	cmp r14,r10
	jge LB_7961
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7959
	cmp al,10
	jz LB_7959
	cmp al,32
	jz LB_7959
LB_7961:
	add r14,3
	cmp r14,r10
	jg LB_7964
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_7964
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_7964
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_7964
	jmp LB_7965
LB_7964:
	jmp LB_7938
LB_7965:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_7947
LB_7946:
	add r14,1
LB_7947:
	cmp r14,r10
	jge LB_7948
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7946
	cmp al,10
	jz LB_7946
	cmp al,32
	jz LB_7946
LB_7948:
	push r10
	call NS_E_4083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7949
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7950
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7950:
	jmp LB_7939
LB_7949:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_7953
LB_7952:
	add r14,1
LB_7953:
	cmp r14,r10
	jge LB_7954
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7952
	cmp al,10
	jz LB_7952
	cmp al,32
	jz LB_7952
LB_7954:
	push r10
	call NS_E_4682_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7955
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_7956
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_7956:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7957
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7957:
	jmp LB_7939
LB_7955:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_7944
	btr r12,2
	jmp LB_7945
LB_7944:
	bts r12,2
LB_7945:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7942
	btr r12,1
	jmp LB_7943
LB_7942:
	bts r12,1
LB_7943:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7940
	btr r12,0
	jmp LB_7941
LB_7940:
	bts r12,0
LB_7941:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_7935
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_7966
	btr r12,3
	jmp LB_7967
LB_7966:
	bts r12,3
LB_7967:
	mov r14,r8
	bt r12,2
	jc LB_7968
	btr r12,1
	jmp LB_7969
LB_7968:
	bts r12,1
LB_7969:
	mov r8,r13
	bt r12,0
	jc LB_7970
	btr r12,2
	jmp LB_7971
LB_7970:
	bts r12,2
LB_7971:
	mov r13,r9
	bt r12,3
	jc LB_7972
	btr r12,0
	jmp LB_7973
LB_7972:
	bts r12,0
LB_7973:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_5000 : %_5000
 ; {>  %_4998~0':_p799 %_4999~1':_p802 }
; _none {  } ⊢ °1◂{  }
; _some { %_4998 %_4999 %_5000 } ⊢ %_5001 : %_5001
 ; {>  %_5000~°1◂{  }:(_opn)◂(t2409'(0)) %_4998~0':_p799 %_4999~1':_p802 }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_5001
 ; {>  %_5001~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ _p799 _p802 (_opn)◂(t2412'(0)) }) }
; 	∎ °0◂{ 0' 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_7925
	btr r12,2
	jmp LB_7926
LB_7925:
	bts r12,2
LB_7926:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_7923
	btr QWORD [rdi],0
	jmp LB_7924
LB_7923:
	bts QWORD [rdi],0
LB_7924:
	mov r8,r14
	bt r12,1
	jc LB_7929
	btr r12,2
	jmp LB_7930
LB_7929:
	bts r12,2
LB_7930:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_7927
	btr QWORD [rdi],1
	jmp LB_7928
LB_7927:
	bts QWORD [rdi],1
LB_7928:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_7933
	mov rsi,0
	bt r8,0
	jc LB_7933
	jmp LB_7934
LB_7933:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_7934:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_7931
	btr QWORD [rdi],2
	jmp LB_7932
LB_7931:
	bts QWORD [rdi],2
LB_7932:
	mov r8,0
	bts r12,2
	ret
LB_7935:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7937
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7936
LB_7937:
	add rsp,8
	ret
LB_7939:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_7938:
	add rsp,48
	pop r14
LB_7936:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4700:
NS_E_RDI_4700:
NS_E_4700_ETR_TBL:
NS_E_4700_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "!|"
	jmp LB_7994
LB_7993:
	add r14,1
LB_7994:
	cmp r14,r10
	jge LB_7995
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7993
	cmp al,10
	jz LB_7993
	cmp al,32
	jz LB_7993
LB_7995:
	add r14,2
	cmp r14,r10
	jg LB_7998
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_7998
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_7998
	jmp LB_7999
LB_7998:
	jmp LB_7981
LB_7999:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_7988
LB_7987:
	add r14,1
LB_7988:
	cmp r14,r10
	jge LB_7989
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_7987
	cmp al,10
	jz LB_7987
	cmp al,32
	jz LB_7987
LB_7989:
	push r10
	call NS_E_4701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_7990
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_7991
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_7991:
	jmp LB_7982
LB_7990:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_7985
	btr r12,1
	jmp LB_7986
LB_7985:
	bts r12,1
LB_7986:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_7983
	btr r12,0
	jmp LB_7984
LB_7983:
	bts r12,0
LB_7984:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_7978
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_8000
	btr r12,2
	jmp LB_8001
LB_8000:
	bts r12,2
LB_8001:
	mov r13,r14
	bt r12,1
	jc LB_8002
	btr r12,0
	jmp LB_8003
LB_8002:
	bts r12,0
LB_8003:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f832 %_5002 ⊢ %_5003 : %_5003
 ; {>  %_5002~0':_p792 }
; _f832 0' ⊢ °0◂0'
; _some %_5003 ⊢ %_5004 : %_5004
 ; {>  %_5003~°0◂0':_p791 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5004
 ; {>  %_5004~°0◂°0◂0':(_opn)◂(_p791) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_7976
	btr r12,3
	jmp LB_7977
LB_7976:
	bts r12,3
LB_7977:
	mov rsi,1
	bt r12,3
	jc LB_7974
	mov rsi,0
	bt r9,0
	jc LB_7974
	jmp LB_7975
LB_7974:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_7975:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_7978:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_7980
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_7979
LB_7980:
	add rsp,8
	ret
LB_7982:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_7981:
	add rsp,32
	pop r14
LB_7979:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_8023
LB_8022:
	add r14,1
LB_8023:
	cmp r14,r10
	jge LB_8024
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8022
	cmp al,10
	jz LB_8022
	cmp al,32
	jz LB_8022
LB_8024:
	push r10
	call NS_E_4702_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8025
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8017
LB_8025:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_8028
LB_8027:
	add r14,1
LB_8028:
	cmp r14,r10
	jge LB_8029
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8027
	cmp al,10
	jz LB_8027
	cmp al,32
	jz LB_8027
LB_8029:
	push r10
	call NS_E_4700_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8030
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8031
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8031:
	jmp LB_8017
LB_8030:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8020
	btr r12,1
	jmp LB_8021
LB_8020:
	bts r12,1
LB_8021:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8018
	btr r12,0
	jmp LB_8019
LB_8018:
	bts r12,0
LB_8019:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8014
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f833 { %_5005 %_5006 } ⊢ %_5007 : %_5007
 ; {>  %_5005~0':_p793 %_5006~1':_p791 }
; _f833 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_5007 ⊢ %_5008 : %_5008
 ; {>  %_5007~°1◂{ 0' 1' }:_p791 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_5008
 ; {>  %_5008~°0◂°1◂{ 0' 1' }:(_opn)◂(_p791) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_8008
	btr r12,2
	jmp LB_8009
LB_8008:
	bts r12,2
LB_8009:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_8006
	btr QWORD [rdi],0
	jmp LB_8007
LB_8006:
	bts QWORD [rdi],0
LB_8007:
	mov r8,r14
	bt r12,1
	jc LB_8012
	btr r12,2
	jmp LB_8013
LB_8012:
	bts r12,2
LB_8013:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_8010
	btr QWORD [rdi],1
	jmp LB_8011
LB_8010:
	bts QWORD [rdi],1
LB_8011:
	mov rsi,1
	bt r12,3
	jc LB_8004
	mov rsi,0
	bt r9,0
	jc LB_8004
	jmp LB_8005
LB_8004:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8005:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8014:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8016
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8015
LB_8016:
	add rsp,8
	ret
LB_8017:
	add rsp,32
	pop r14
LB_8015:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_8035
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f834 {  } ⊢ %_5009 : %_5009
 ; {>  }
; _f834 {  } ⊢ °2◂{  }
; _some %_5009 ⊢ %_5010 : %_5010
 ; {>  %_5009~°2◂{  }:_p791 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5010
 ; {>  %_5010~°0◂°2◂{  }:(_opn)◂(_p791) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8033
	mov rsi,0
	bt r9,0
	jc LB_8033
	jmp LB_8034
LB_8033:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8034:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8035:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8037
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8036
LB_8037:
	add rsp,8
	ret
LB_8038:
	add rsp,0
	pop r14
LB_8036:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4701:
NS_E_RDI_4701:
NS_E_4701_ETR_TBL:
NS_E_4701_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_8058
LB_8057:
	add r14,1
LB_8058:
	cmp r14,r10
	jge LB_8059
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8057
	cmp al,10
	jz LB_8057
	cmp al,32
	jz LB_8057
LB_8059:
	push r10
	call NS_E_4702_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8060
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8052
LB_8060:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_8063
LB_8062:
	add r14,1
LB_8063:
	cmp r14,r10
	jge LB_8064
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8062
	cmp al,10
	jz LB_8062
	cmp al,32
	jz LB_8062
LB_8064:
	push r10
	call NS_E_4701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8065
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8066
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8066:
	jmp LB_8052
LB_8065:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8055
	btr r12,1
	jmp LB_8056
LB_8055:
	bts r12,1
LB_8056:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8053
	btr r12,0
	jmp LB_8054
LB_8053:
	bts r12,0
LB_8054:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8049
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f835 { %_5011 %_5012 } ⊢ %_5013 : %_5013
 ; {>  %_5011~0':_p793 %_5012~1':_p792 }
; _f835 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_5013 ⊢ %_5014 : %_5014
 ; {>  %_5013~°0◂{ 0' 1' }:_p792 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_5014
 ; {>  %_5014~°0◂°0◂{ 0' 1' }:(_opn)◂(_p792) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_8043
	btr r12,2
	jmp LB_8044
LB_8043:
	bts r12,2
LB_8044:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_8041
	btr QWORD [rdi],0
	jmp LB_8042
LB_8041:
	bts QWORD [rdi],0
LB_8042:
	mov r8,r14
	bt r12,1
	jc LB_8047
	btr r12,2
	jmp LB_8048
LB_8047:
	bts r12,2
LB_8048:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_8045
	btr QWORD [rdi],1
	jmp LB_8046
LB_8045:
	bts QWORD [rdi],1
LB_8046:
	mov rsi,1
	bt r12,3
	jc LB_8039
	mov rsi,0
	bt r9,0
	jc LB_8039
	jmp LB_8040
LB_8039:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8040:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8049:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8051
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8050
LB_8051:
	add rsp,8
	ret
LB_8052:
	add rsp,32
	pop r14
LB_8050:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_8070
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f836 {  } ⊢ %_5015 : %_5015
 ; {>  }
; _f836 {  } ⊢ °1◂{  }
; _some %_5015 ⊢ %_5016 : %_5016
 ; {>  %_5015~°1◂{  }:_p792 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5016
 ; {>  %_5016~°0◂°1◂{  }:(_opn)◂(_p792) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8068
	mov rsi,0
	bt r9,0
	jc LB_8068
	jmp LB_8069
LB_8068:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8069:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8070:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8072
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8071
LB_8072:
	add rsp,8
	ret
LB_8073:
	add rsp,0
	pop r14
LB_8071:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4702:
NS_E_RDI_4702:
NS_E_4702_ETR_TBL:
NS_E_4702_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_8089
LB_8088:
	add r14,1
LB_8089:
	cmp r14,r10
	jge LB_8090
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8088
	cmp al,10
	jz LB_8088
	cmp al,32
	jz LB_8088
LB_8090:
	add r14,3
	cmp r14,r10
	jg LB_8093
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8093
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_8093
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_8093
	jmp LB_8094
LB_8093:
	jmp LB_8081
LB_8094:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_8096
LB_8095:
	add r14,1
LB_8096:
	cmp r14,r10
	jge LB_8097
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8095
	cmp al,10
	jz LB_8095
	cmp al,32
	jz LB_8095
LB_8097:
	push r10
	call NS_E_4703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8098
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8099
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8099:
	jmp LB_8081
LB_8098:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_8102
LB_8101:
	add r14,1
LB_8102:
	cmp r14,r10
	jge LB_8103
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8101
	cmp al,10
	jz LB_8101
	cmp al,32
	jz LB_8101
LB_8103:
	add r14,3
	cmp r14,r10
	jg LB_8108
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8108
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_8108
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_8108
	jmp LB_8109
LB_8108:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8105
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8105:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8106
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8106:
	jmp LB_8081
LB_8109:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8086
	btr r12,2
	jmp LB_8087
LB_8086:
	bts r12,2
LB_8087:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8084
	btr r12,1
	jmp LB_8085
LB_8084:
	bts r12,1
LB_8085:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8082
	btr r12,0
	jmp LB_8083
LB_8082:
	bts r12,0
LB_8083:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8078
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_8110
	btr r12,3
	jmp LB_8111
LB_8110:
	bts r12,3
LB_8111:
	mov r13,r14
	bt r12,1
	jc LB_8112
	btr r12,0
	jmp LB_8113
LB_8112:
	bts r12,0
LB_8113:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f837 %_5017 ⊢ %_5018 : %_5018
 ; {>  %_5017~0':_p794 }
; _f837 0' ⊢ °0◂0'
; _some %_5018 ⊢ %_5019 : %_5019
 ; {>  %_5018~°0◂0':_p793 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5019
 ; {>  %_5019~°0◂°0◂0':(_opn)◂(_p793) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8076
	btr r12,3
	jmp LB_8077
LB_8076:
	bts r12,3
LB_8077:
	mov rsi,1
	bt r12,3
	jc LB_8074
	mov rsi,0
	bt r9,0
	jc LB_8074
	jmp LB_8075
LB_8074:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8075:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8078:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8080
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8079
LB_8080:
	add rsp,8
	ret
LB_8081:
	add rsp,48
	pop r14
LB_8079:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_8125
LB_8124:
	add r14,1
LB_8125:
	cmp r14,r10
	jge LB_8126
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8124
	cmp al,10
	jz LB_8124
	cmp al,32
	jz LB_8124
LB_8126:
	push r10
	call NS_E_4703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8127
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8121
LB_8127:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8122
	btr r12,0
	jmp LB_8123
LB_8122:
	bts r12,0
LB_8123:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8118
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f838 %_5020 ⊢ %_5021 : %_5021
 ; {>  %_5020~0':_p794 }
; _f838 0' ⊢ °1◂0'
; _some %_5021 ⊢ %_5022 : %_5022
 ; {>  %_5021~°1◂0':_p793 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5022
 ; {>  %_5022~°0◂°1◂0':(_opn)◂(_p793) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8116
	btr r12,3
	jmp LB_8117
LB_8116:
	bts r12,3
LB_8117:
	mov rsi,1
	bt r12,3
	jc LB_8114
	mov rsi,0
	bt r9,0
	jc LB_8114
	jmp LB_8115
LB_8114:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8115:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8118:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8120
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8119
LB_8120:
	add rsp,8
	ret
LB_8121:
	add rsp,16
	pop r14
LB_8119:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4703:
NS_E_RDI_4703:
NS_E_4703_ETR_TBL:
NS_E_4703_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_8140
LB_8139:
	add r14,1
LB_8140:
	cmp r14,r10
	jge LB_8141
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8139
	cmp al,10
	jz LB_8139
	cmp al,32
	jz LB_8139
LB_8141:
	push r10
	call NS_E_192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8142
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8136
LB_8142:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8137
	btr r12,0
	jmp LB_8138
LB_8137:
	bts r12,0
LB_8138:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8133
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f840 %_5023 ⊢ %_5024 : %_5024
 ; {>  %_5023~0':_stg }
; _f840 0' ⊢ °1◂0'
; _some %_5024 ⊢ %_5025 : %_5025
 ; {>  %_5024~°1◂0':_p794 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_5025
 ; {>  %_5025~°0◂°1◂0':(_opn)◂(_p794) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8131
	btr r12,3
	jmp LB_8132
LB_8131:
	bts r12,3
LB_8132:
	mov rsi,1
	bt r12,3
	jc LB_8129
	mov rsi,0
	bt r9,0
	jc LB_8129
	jmp LB_8130
LB_8129:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8130:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8133:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8135
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8134
LB_8135:
	add rsp,8
	ret
LB_8136:
	add rsp,16
	pop r14
LB_8134:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_8155
LB_8154:
	add r14,1
LB_8155:
	cmp r14,r10
	jge LB_8156
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8154
	cmp al,10
	jz LB_8154
	cmp al,32
	jz LB_8154
LB_8156:
	push r10
	call NS_E_3623_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8157
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8151
LB_8157:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8152
	btr r12,0
	jmp LB_8153
LB_8152:
	bts r12,0
LB_8153:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8148
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f839 %_5026 ⊢ %_5027 : %_5027
 ; {>  %_5026~0':_p735 }
; _f839 0' ⊢ °0◂0'
; _some %_5027 ⊢ %_5028 : %_5028
 ; {>  %_5027~°0◂0':_p794 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5028
 ; {>  %_5028~°0◂°0◂0':(_opn)◂(_p794) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8146
	btr r12,3
	jmp LB_8147
LB_8146:
	bts r12,3
LB_8147:
	mov rsi,1
	bt r12,3
	jc LB_8144
	mov rsi,0
	bt r9,0
	jc LB_8144
	jmp LB_8145
LB_8144:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8145:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8148:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8150
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8149
LB_8150:
	add rsp,8
	ret
LB_8151:
	add rsp,16
	pop r14
LB_8149:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4704:
NS_E_RDI_4704:
NS_E_4704_ETR_TBL:
NS_E_4704_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_8168
LB_8167:
	add r14,1
LB_8168:
	cmp r14,r10
	jge LB_8169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8167
	cmp al,10
	jz LB_8167
	cmp al,32
	jz LB_8167
LB_8169:
	add r14,4
	cmp r14,r10
	jg LB_8172
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8172
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8172
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_8172
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_8172
	jmp LB_8173
LB_8172:
	jmp LB_8164
LB_8173:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8165
	btr r12,0
	jmp LB_8166
LB_8165:
	bts r12,0
LB_8166:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8161
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f830 {  } ⊢ %_5029 : %_5029
 ; {>  }
; _f830 {  } ⊢ °1◂{  }
; _some %_5029 ⊢ %_5030 : %_5030
 ; {>  %_5029~°1◂{  }:_p790 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5030
 ; {>  %_5030~°0◂°1◂{  }:(_opn)◂(_p790) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8159
	mov rsi,0
	bt r9,0
	jc LB_8159
	jmp LB_8160
LB_8159:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8160:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8161:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8163
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8162
LB_8163:
	add rsp,8
	ret
LB_8164:
	add rsp,16
	pop r14
LB_8162:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_8183
LB_8182:
	add r14,1
LB_8183:
	cmp r14,r10
	jge LB_8184
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8182
	cmp al,10
	jz LB_8182
	cmp al,32
	jz LB_8182
LB_8184:
	add r14,4
	cmp r14,r10
	jg LB_8187
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8187
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8187
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_8187
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_8187
	jmp LB_8188
LB_8187:
	jmp LB_8179
LB_8188:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8180
	btr r12,0
	jmp LB_8181
LB_8180:
	bts r12,0
LB_8181:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8176
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f831 {  } ⊢ %_5031 : %_5031
 ; {>  }
; _f831 {  } ⊢ °2◂{  }
; _some %_5031 ⊢ %_5032 : %_5032
 ; {>  %_5031~°2◂{  }:_p790 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5032
 ; {>  %_5032~°0◂°2◂{  }:(_opn)◂(_p790) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8174
	mov rsi,0
	bt r9,0
	jc LB_8174
	jmp LB_8175
LB_8174:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8175:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8176:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8178
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8177
LB_8178:
	add rsp,8
	ret
LB_8179:
	add rsp,16
	pop r14
LB_8177:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_8198
LB_8197:
	add r14,1
LB_8198:
	cmp r14,r10
	jge LB_8199
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8197
	cmp al,10
	jz LB_8197
	cmp al,32
	jz LB_8197
LB_8199:
	add r14,3
	cmp r14,r10
	jg LB_8202
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_8202
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_8202
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_8202
	jmp LB_8203
LB_8202:
	jmp LB_8194
LB_8203:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8195
	btr r12,0
	jmp LB_8196
LB_8195:
	bts r12,0
LB_8196:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8191
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f829 {  } ⊢ %_5033 : %_5033
 ; {>  }
; _f829 {  } ⊢ °0◂{  }
; _some %_5033 ⊢ %_5034 : %_5034
 ; {>  %_5033~°0◂{  }:_p790 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_5034
 ; {>  %_5034~°0◂°0◂{  }:(_opn)◂(_p790) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8189
	mov rsi,0
	bt r9,0
	jc LB_8189
	jmp LB_8190
LB_8189:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8190:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8191:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8193
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8192
LB_8193:
	add rsp,8
	ret
LB_8194:
	add rsp,16
	pop r14
LB_8192:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4705:
NS_E_RDI_4705:
NS_E_4705_ETR_TBL:
NS_E_4705_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_8213
LB_8212:
	add r14,1
LB_8213:
	cmp r14,r10
	jge LB_8214
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8212
	cmp al,10
	jz LB_8212
	cmp al,32
	jz LB_8212
LB_8214:
	add r14,5
	cmp r14,r10
	jg LB_8217
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_8217
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_8217
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_8217
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_8217
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_8217
	jmp LB_8218
LB_8217:
	jmp LB_8209
LB_8218:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8210
	btr r12,0
	jmp LB_8211
LB_8210:
	bts r12,0
LB_8211:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8206
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f830 {  } ⊢ %_5035 : %_5035
 ; {>  }
; _f830 {  } ⊢ °1◂{  }
; _some %_5035 ⊢ %_5036 : %_5036
 ; {>  %_5035~°1◂{  }:_p790 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5036
 ; {>  %_5036~°0◂°1◂{  }:(_opn)◂(_p790) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8204
	mov rsi,0
	bt r9,0
	jc LB_8204
	jmp LB_8205
LB_8204:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8205:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8206:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8208
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8207
LB_8208:
	add rsp,8
	ret
LB_8209:
	add rsp,16
	pop r14
LB_8207:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_8228
LB_8227:
	add r14,1
LB_8228:
	cmp r14,r10
	jge LB_8229
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8227
	cmp al,10
	jz LB_8227
	cmp al,32
	jz LB_8227
LB_8229:
	add r14,5
	cmp r14,r10
	jg LB_8232
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_8232
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_8232
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_8232
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_8232
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_8232
	jmp LB_8233
LB_8232:
	jmp LB_8224
LB_8233:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8225
	btr r12,0
	jmp LB_8226
LB_8225:
	bts r12,0
LB_8226:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8221
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f831 {  } ⊢ %_5037 : %_5037
 ; {>  }
; _f831 {  } ⊢ °2◂{  }
; _some %_5037 ⊢ %_5038 : %_5038
 ; {>  %_5037~°2◂{  }:_p790 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_5038
 ; {>  %_5038~°0◂°2◂{  }:(_opn)◂(_p790) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8219
	mov rsi,0
	bt r9,0
	jc LB_8219
	jmp LB_8220
LB_8219:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8220:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8221:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8223
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8222
LB_8223:
	add rsp,8
	ret
LB_8224:
	add rsp,16
	pop r14
LB_8222:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_8243
LB_8242:
	add r14,1
LB_8243:
	cmp r14,r10
	jge LB_8244
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8242
	cmp al,10
	jz LB_8242
	cmp al,32
	jz LB_8242
LB_8244:
	add r14,4
	cmp r14,r10
	jg LB_8247
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_8247
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_8247
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_8247
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_8247
	jmp LB_8248
LB_8247:
	jmp LB_8239
LB_8248:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8240
	btr r12,0
	jmp LB_8241
LB_8240:
	bts r12,0
LB_8241:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8236
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f829 {  } ⊢ %_5039 : %_5039
 ; {>  }
; _f829 {  } ⊢ °0◂{  }
; _some %_5039 ⊢ %_5040 : %_5040
 ; {>  %_5039~°0◂{  }:_p790 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_5040
 ; {>  %_5040~°0◂°0◂{  }:(_opn)◂(_p790) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8234
	mov rsi,0
	bt r9,0
	jc LB_8234
	jmp LB_8235
LB_8234:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8235:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8236:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8238
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8237
LB_8238:
	add rsp,8
	ret
LB_8239:
	add rsp,16
	pop r14
LB_8237:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4706:
NS_E_RDI_4706:
NS_E_4706_ETR_TBL:
NS_E_4706_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_8304
LB_8303:
	add r14,1
LB_8304:
	cmp r14,r10
	jge LB_8305
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8303
	cmp al,10
	jz LB_8303
	cmp al,32
	jz LB_8303
LB_8305:
	push r10
	call NS_E_4705_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8306
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8272
LB_8306:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_8283
LB_8282:
	add r14,1
LB_8283:
	cmp r14,r10
	jge LB_8284
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8282
	cmp al,10
	jz LB_8282
	cmp al,32
	jz LB_8282
LB_8284:
	push r10
	call NS_E_4708_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8285
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8286
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8286:
	jmp LB_8273
LB_8285:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_8289
LB_8288:
	add r14,1
LB_8289:
	cmp r14,r10
	jge LB_8290
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8288
	cmp al,10
	jz LB_8288
	cmp al,32
	jz LB_8288
LB_8290:
	push r10
	call NS_E_4700_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8291
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8292
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8292:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8293
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8293:
	jmp LB_8273
LB_8291:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_8296
LB_8295:
	add r14,1
LB_8296:
	cmp r14,r10
	jge LB_8297
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8295
	cmp al,10
	jz LB_8295
	cmp al,32
	jz LB_8295
LB_8297:
	push r10
	call NS_E_4707_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8298
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8299
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8299:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8300
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8300:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8301
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8301:
	jmp LB_8273
LB_8298:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8280
	btr r12,3
	jmp LB_8281
LB_8280:
	bts r12,3
LB_8281:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8278
	btr r12,2
	jmp LB_8279
LB_8278:
	bts r12,2
LB_8279:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8276
	btr r12,1
	jmp LB_8277
LB_8276:
	bts r12,1
LB_8277:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8274
	btr r12,0
	jmp LB_8275
LB_8274:
	bts r12,0
LB_8275:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_8269
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f826 { %_5042 %_5041 %_5043 %_5044 } ⊢ %_5045 : %_5045
 ; {>  %_5042~1':(_opn)◂(_stg) %_5044~3':(_opn)◂(_p788) %_5043~2':_p791 %_5041~0':_p790 }
; _f826 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_5045 ⊢ %_5046 : %_5046
 ; {>  %_5045~°1◂{ 1' 0' 2' 3' }:_p788 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_5046
 ; {>  %_5046~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p788) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_8249
	btr r12,4
	jmp LB_8250
LB_8249:
	bts r12,4
LB_8250:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_8255
	btr r12,5
	jmp LB_8256
LB_8255:
	bts r12,5
LB_8256:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_8253
	btr QWORD [rdi],0
	jmp LB_8254
LB_8253:
	bts QWORD [rdi],0
LB_8254:
	mov r11,r13
	bt r12,0
	jc LB_8259
	btr r12,5
	jmp LB_8260
LB_8259:
	bts r12,5
LB_8260:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_8257
	btr QWORD [rdi],1
	jmp LB_8258
LB_8257:
	bts QWORD [rdi],1
LB_8258:
	mov r11,r8
	bt r12,2
	jc LB_8263
	btr r12,5
	jmp LB_8264
LB_8263:
	bts r12,5
LB_8264:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_8261
	btr QWORD [rdi],2
	jmp LB_8262
LB_8261:
	bts QWORD [rdi],2
LB_8262:
	mov r11,r10
	bt r12,4
	jc LB_8267
	btr r12,5
	jmp LB_8268
LB_8267:
	bts r12,5
LB_8268:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],r11
	bt r12,5
	jc LB_8265
	btr QWORD [rdi],3
	jmp LB_8266
LB_8265:
	bts QWORD [rdi],3
LB_8266:
	mov rsi,1
	bt r12,3
	jc LB_8251
	mov rsi,0
	bt r9,0
	jc LB_8251
	jmp LB_8252
LB_8251:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8252:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8269:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8271
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8270
LB_8271:
	add rsp,8
	ret
LB_8273:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_8272:
	add rsp,64
	pop r14
LB_8270:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; grm_ord
	jmp LB_8347
LB_8346:
	add r14,1
LB_8347:
	cmp r14,r10
	jge LB_8348
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8346
	cmp al,10
	jz LB_8346
	cmp al,32
	jz LB_8346
LB_8348:
	push r10
	call NS_E_4704_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8349
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8335
LB_8349:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_8352
LB_8351:
	add r14,1
LB_8352:
	cmp r14,r10
	jge LB_8353
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8351
	cmp al,10
	jz LB_8351
	cmp al,32
	jz LB_8351
LB_8353:
	push r10
	call NS_E_4708_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8354
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8355
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8355:
	jmp LB_8335
LB_8354:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_8358
LB_8357:
	add r14,1
LB_8358:
	cmp r14,r10
	jge LB_8359
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8357
	cmp al,10
	jz LB_8357
	cmp al,32
	jz LB_8357
LB_8359:
	push r10
	call NS_E_4700_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8360
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8361
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8361:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8362
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8362:
	jmp LB_8335
LB_8360:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_8365
LB_8364:
	add r14,1
LB_8365:
	cmp r14,r10
	jge LB_8366
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8364
	cmp al,10
	jz LB_8364
	cmp al,32
	jz LB_8364
LB_8366:
	push r10
	call NS_E_4707_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8367
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8368
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8368:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8369
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8369:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8370
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8370:
	jmp LB_8335
LB_8367:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_8373
LB_8372:
	add r14,1
LB_8373:
	cmp r14,r10
	jge LB_8374
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8372
	cmp al,10
	jz LB_8372
	cmp al,32
	jz LB_8372
LB_8374:
	push r10
	call NS_E_4706_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8375
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_8376
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_8376:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_8377
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_8377:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8378
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8378:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8379
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8379:
	jmp LB_8335
LB_8375:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_8344
	btr r12,4
	jmp LB_8345
LB_8344:
	bts r12,4
LB_8345:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_8342
	btr r12,3
	jmp LB_8343
LB_8342:
	bts r12,3
LB_8343:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8340
	btr r12,2
	jmp LB_8341
LB_8340:
	bts r12,2
LB_8341:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8338
	btr r12,1
	jmp LB_8339
LB_8338:
	bts r12,1
LB_8339:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8336
	btr r12,0
	jmp LB_8337
LB_8336:
	bts r12,0
LB_8337:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_8332
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
; _f825 { %_5048 %_5047 %_5049 %_5050 %_5051 } ⊢ %_5052 : %_5052
 ; {>  %_5047~0':_p790 %_5051~4':_p788 %_5049~2':_p791 %_5050~3':(_opn)◂(_p788) %_5048~1':(_opn)◂(_stg) }
; _f825 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_5052 ⊢ %_5053 : %_5053
 ; {>  %_5052~°0◂{ 1' 0' 2' 3' 4' }:_p788 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_5053
 ; {>  %_5053~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p788) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_8308
	btr r12,5
	jmp LB_8309
LB_8308:
	bts r12,5
LB_8309:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_8314
	btr r12,6
	jmp LB_8315
LB_8314:
	bts r12,6
LB_8315:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_8312
	btr QWORD [rdi],0
	jmp LB_8313
LB_8312:
	bts QWORD [rdi],0
LB_8313:
	mov rcx,r13
	bt r12,0
	jc LB_8318
	btr r12,6
	jmp LB_8319
LB_8318:
	bts r12,6
LB_8319:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_8316
	btr QWORD [rdi],1
	jmp LB_8317
LB_8316:
	bts QWORD [rdi],1
LB_8317:
	mov rcx,r8
	bt r12,2
	jc LB_8322
	btr r12,6
	jmp LB_8323
LB_8322:
	bts r12,6
LB_8323:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_8320
	btr QWORD [rdi],2
	jmp LB_8321
LB_8320:
	bts QWORD [rdi],2
LB_8321:
	mov rcx,r11
	bt r12,5
	jc LB_8326
	btr r12,6
	jmp LB_8327
LB_8326:
	bts r12,6
LB_8327:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_8324
	btr QWORD [rdi],3
	jmp LB_8325
LB_8324:
	bts QWORD [rdi],3
LB_8325:
	mov rcx,r10
	bt r12,4
	jc LB_8330
	btr r12,6
	jmp LB_8331
LB_8330:
	bts r12,6
LB_8331:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_8328
	btr QWORD [rdi],4
	jmp LB_8329
LB_8328:
	bts QWORD [rdi],4
LB_8329:
	mov rsi,1
	bt r12,3
	jc LB_8310
	mov rsi,0
	bt r9,0
	jc LB_8310
	jmp LB_8311
LB_8310:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8311:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8332:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8334
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8333
LB_8334:
	add rsp,8
	ret
LB_8335:
	add rsp,80
	pop r14
LB_8333:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4707:
NS_E_RDI_4707:
NS_E_4707_ETR_TBL:
NS_E_4707_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ";"
	jmp LB_8394
LB_8393:
	add r14,1
LB_8394:
	cmp r14,r10
	jge LB_8395
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8393
	cmp al,10
	jz LB_8393
	cmp al,32
	jz LB_8393
LB_8395:
	add r14,1
	cmp r14,r10
	jg LB_8398
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_8398
	jmp LB_8399
LB_8398:
	jmp LB_8388
LB_8399:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_8401
LB_8400:
	add r14,1
LB_8401:
	cmp r14,r10
	jge LB_8402
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8400
	cmp al,10
	jz LB_8400
	cmp al,32
	jz LB_8400
LB_8402:
	push r10
	call NS_E_4706_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8403
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8404
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8404:
	jmp LB_8388
LB_8403:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8391
	btr r12,1
	jmp LB_8392
LB_8391:
	bts r12,1
LB_8392:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8389
	btr r12,0
	jmp LB_8390
LB_8389:
	bts r12,0
LB_8390:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8385
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_8406
	btr r12,2
	jmp LB_8407
LB_8406:
	bts r12,2
LB_8407:
	mov r13,r14
	bt r12,1
	jc LB_8408
	btr r12,0
	jmp LB_8409
LB_8408:
	bts r12,0
LB_8409:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5054 ⊢ %_5055 : %_5055
 ; {>  %_5054~0':_p788 }
; _some 0' ⊢ °0◂0'
; _some %_5055 ⊢ %_5056 : %_5056
 ; {>  %_5055~°0◂0':(_opn)◂(_p788) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5056
 ; {>  %_5056~°0◂°0◂0':(_opn)◂((_opn)◂(_p788)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8383
	btr r12,3
	jmp LB_8384
LB_8383:
	bts r12,3
LB_8384:
	mov rsi,1
	bt r12,3
	jc LB_8381
	mov rsi,0
	bt r9,0
	jc LB_8381
	jmp LB_8382
LB_8381:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8382:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8385:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8387
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8386
LB_8387:
	add rsp,8
	ret
LB_8388:
	add rsp,32
	pop r14
LB_8386:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_8412
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_5057 : %_5057
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_5057 ⊢ %_5058 : %_5058
 ; {>  %_5057~°1◂{  }:(_opn)◂(t2490'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5058
 ; {>  %_5058~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2493'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8410
	mov rsi,0
	bt r9,0
	jc LB_8410
	jmp LB_8411
LB_8410:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8411:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8412:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8414
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8413
LB_8414:
	add rsp,8
	ret
LB_8415:
	add rsp,0
	pop r14
LB_8413:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4708:
NS_E_RDI_4708:
NS_E_4708_ETR_TBL:
NS_E_4708_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_8429
LB_8428:
	add r14,1
LB_8429:
	cmp r14,r10
	jge LB_8430
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8428
	cmp al,10
	jz LB_8428
	cmp al,32
	jz LB_8428
LB_8430:
	push r10
	call NS_E_560_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8431
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8423
LB_8431:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_8434
LB_8433:
	add r14,1
LB_8434:
	cmp r14,r10
	jge LB_8435
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_8433
	cmp al,10
	jz LB_8433
	cmp al,32
	jz LB_8433
LB_8435:
	add r14,1
	cmp r14,r10
	jg LB_8439
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_8439
	jmp LB_8440
LB_8439:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8437
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8437:
	jmp LB_8423
LB_8440:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8426
	btr r12,1
	jmp LB_8427
LB_8426:
	bts r12,1
LB_8427:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8424
	btr r12,0
	jmp LB_8425
LB_8424:
	bts r12,0
LB_8425:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8420
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_5059 ⊢ %_5060 : %_5060
 ; {>  %_5059~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_5060 ⊢ %_5061 : %_5061
 ; {>  %_5060~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_5061
 ; {>  %_5061~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8418
	btr r12,3
	jmp LB_8419
LB_8418:
	bts r12,3
LB_8419:
	mov rsi,1
	bt r12,3
	jc LB_8416
	mov rsi,0
	bt r9,0
	jc LB_8416
	jmp LB_8417
LB_8416:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8417:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8420:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8422
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8421
LB_8422:
	add rsp,8
	ret
LB_8423:
	add rsp,32
	pop r14
LB_8421:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_8443
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_5062 : %_5062
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_5062 ⊢ %_5063 : %_5063
 ; {>  %_5062~°1◂{  }:(_opn)◂(t2502'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_5063
 ; {>  %_5063~°0◂°1◂{  }:(_opn)◂((_opn)◂(t2505'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8441
	mov rsi,0
	bt r9,0
	jc LB_8441
	jmp LB_8442
LB_8441:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8442:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8443:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8445
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8444
LB_8445:
	add rsp,8
	ret
LB_8446:
	add rsp,0
	pop r14
LB_8444:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_8492:
NS_E_RDI_8492:
; » _^ ..
	xor rax,rax
	add rax,9
	add rax,15
	add rax,13
	add rax,10
	add rax,9
	add rax,7
	add rax,10
	add rax,11
	add rax,10
	add rax,10
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
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
; » 0xr0 |~ {  } ⊢ %_8448 : %_8448
 ; {>  %_8447~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_8448
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f27 |~ {  } ⊢ %_8449 : %_8449
 ; {>  %_8447~0':_stg %_8448~1':_r64 }
; 	» _args _ ⊢ 2' : %_8449
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
MTC_LB_8493:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_8494
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_8495
	bt QWORD [rdi],0
	jc LB_8496
	btr r12,5
	jmp LB_8497
LB_8496:
	bts r12,5
LB_8497:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8495:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_8500
	btr r12,6
	jmp LB_8501
LB_8500:
	bts r12,6
LB_8501:
	mov r9,rcx
	bt r12,6
	jc LB_8498
	btr r12,3
	jmp LB_8499
LB_8498:
	bts r12,3
LB_8499:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_8504
	btr r12,6
	jmp LB_8505
LB_8504:
	bts r12,6
LB_8505:
	mov r10,rcx
	bt r12,6
	jc LB_8502
	btr r12,4
	jmp LB_8503
LB_8502:
	bts r12,4
LB_8503:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_8494
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_8506
	bt QWORD [rdi],0
	jc LB_8507
	btr r12,7
	jmp LB_8508
LB_8507:
	bts r12,7
LB_8508:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8506:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_8511
	btr r12,8
	jmp LB_8512
LB_8511:
	bts r12,8
LB_8512:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_8509
	btr r12,5
	jmp LB_8510
LB_8509:
	bts r12,5
LB_8510:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_8515
	btr r12,8
	jmp LB_8516
LB_8515:
	bts r12,8
LB_8516:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_8513
	btr r12,6
	jmp LB_8514
LB_8513:
	bts r12,6
LB_8514:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_8494
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °1◂{  }
; 6' ⊢ °1◂{  }
	btr r12,7
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rcx
	bt QWORD [rdi],17
	jnc LB_8517
	bt QWORD [rdi],0
	jc LB_8518
	btr r12,7
	jmp LB_8519
LB_8518:
	bts r12,7
LB_8519:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8517:
	mov rdx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_8520:
	cmp r15,0
	jz LB_8521
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8520
LB_8521:
; _f37 %_8452 ⊢ { %_8454 %_8455 } : { %_8454 %_8455 }
 ; {>  %_8452~5':_stg %_8450~3':_stg %_8447~0':_stg %_8448~1':_r64 }
; _f37 5' ⊢ { 2' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_8528
	btr r12,0
	jmp LB_8529
LB_8528:
	bts r12,0
LB_8529:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_8530
	btr r12,2
	jmp LB_8531
LB_8530:
	bts r12,2
LB_8531:
	mov r10,r14
	bt r12,1
	jc LB_8532
	btr r12,4
	jmp LB_8533
LB_8532:
	bts r12,4
LB_8533:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_8526
	btr r12,3
	jmp LB_8527
LB_8526:
	bts r12,3
LB_8527:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8524
	btr r12,1
	jmp LB_8525
LB_8524:
	bts r12,1
LB_8525:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8522
	btr r12,0
	jmp LB_8523
LB_8522:
	bts r12,0
LB_8523:
	add rsp,32
; _f3558 %_8455 ⊢ { %_8456 %_8457 } : { %_8456 %_8457 }
 ; {>  %_8454~2':_stg %_8450~3':_stg %_8447~0':_stg %_8455~4':_stg %_8448~1':_r64 }
; _f3558 4' ⊢ { 4' 5' }
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
	jc LB_8542
	btr r12,0
	jmp LB_8543
LB_8542:
	bts r12,0
LB_8543:
	call NS_E_3558
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_8544
	btr r12,4
	jmp LB_8545
LB_8544:
	bts r12,4
LB_8545:
	mov r11,r14
	bt r12,1
	jc LB_8546
	btr r12,5
	jmp LB_8547
LB_8546:
	bts r12,5
LB_8547:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_8540
	btr r12,3
	jmp LB_8541
LB_8540:
	bts r12,3
LB_8541:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_8538
	btr r12,2
	jmp LB_8539
LB_8538:
	bts r12,2
LB_8539:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8536
	btr r12,1
	jmp LB_8537
LB_8536:
	bts r12,1
LB_8537:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8534
	btr r12,0
	jmp LB_8535
LB_8534:
	bts r12,0
LB_8535:
	add rsp,40
MTC_LB_8548:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_8549
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °0◂6'
; 5' ⊢ °0◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_8550
	bt QWORD [rdi],0
	jc LB_8551
	btr r12,7
	jmp LB_8552
LB_8551:
	bts r12,7
LB_8552:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8550:
	mov rdx,rdi
	mov rcx,rdx
	bt r12,7
	jc LB_8553
	btr r12,6
	jmp LB_8554
LB_8553:
	bts r12,6
LB_8554:
LB_8555:
	cmp r15,0
	jz LB_8556
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8555
LB_8556:
; » 0xr0 |~ {  } ⊢ %_8459 : %_8459
 ; {>  %_8454~2':_stg %_8450~3':_stg %_8458~6':_stg %_8447~0':_stg %_8456~4':_stg %_8448~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_8459
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f4668 { %_8458 %_8459 } ⊢ { %_8460 %_8461 %_8462 } : { %_8460 %_8461 %_8462 }
 ; {>  %_8454~2':_stg %_8459~5':_r64 %_8450~3':_stg %_8458~6':_stg %_8447~0':_stg %_8456~4':_stg %_8448~1':_r64 }
; _f4668 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_8567
	btr r12,0
	jmp LB_8568
LB_8567:
	bts r12,0
LB_8568:
	mov r14,r11
	bt r12,5
	jc LB_8569
	btr r12,1
	jmp LB_8570
LB_8569:
	bts r12,1
LB_8570:
	call NS_E_4668
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_8571
	btr r12,5
	jmp LB_8572
LB_8571:
	bts r12,5
LB_8572:
	mov rcx,r14
	bt r12,1
	jc LB_8573
	btr r12,6
	jmp LB_8574
LB_8573:
	bts r12,6
LB_8574:
	mov rdx,r9
	bt r12,3
	jc LB_8577
	btr r12,7
	jmp LB_8578
LB_8577:
	bts r12,7
LB_8578:
	mov rsi,1
	bt r12,7
	jc LB_8575
	mov rsi,0
	bt rdx,0
	jc LB_8575
	jmp LB_8576
LB_8575:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_8576:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_8565
	btr r12,4
	jmp LB_8566
LB_8565:
	bts r12,4
LB_8566:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_8563
	btr r12,3
	jmp LB_8564
LB_8563:
	bts r12,3
LB_8564:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_8561
	btr r12,2
	jmp LB_8562
LB_8561:
	bts r12,2
LB_8562:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8559
	btr r12,1
	jmp LB_8560
LB_8559:
	bts r12,1
LB_8560:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8557
	btr r12,0
	jmp LB_8558
LB_8557:
	bts r12,0
LB_8558:
	add rsp,48
MTC_LB_8579:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_8580
; _emt_mov_ptn_to_ptn:{| 111111110.. |},7' ⊢ °0◂8'
; 7' ⊢ °0◂8'
	btr r12,9
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rdx
	bt QWORD [rdi],17
	jnc LB_8581
	bt QWORD [rdi],0
	jc LB_8582
	btr r12,9
	jmp LB_8583
LB_8582:
	bts r12,9
LB_8583:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8581:
	mov QWORD [st_vct+8*9],rdi
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_8584
	btr r12,8
	jmp LB_8585
LB_8584:
	bts r12,8
LB_8585:
LB_8586:
	cmp r15,0
	jz LB_8587
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8586
LB_8587:
; » 0xr0 |~ {  } ⊢ %_8464 : %_8464
 ; {>  %_8460~5':_stg %_8454~2':_stg %_8461~6':_r64 %_8450~3':_stg %_8463~8':(_lst)◂(_p783) %_8447~0':_stg %_8456~4':_stg %_8448~1':_r64 }
; 	» 0xr0 _ ⊢ 7' : %_8464
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; _f1122 { %_8464 %_8463 } ⊢ { %_8465 %_8466 } : { %_8465 %_8466 }
 ; {>  %_8464~7':_r64 %_8460~5':_stg %_8454~2':_stg %_8461~6':_r64 %_8450~3':_stg %_8463~8':(_lst)◂(_p783) %_8447~0':_stg %_8456~4':_stg %_8448~1':_r64 }
; _f1122 { 7' 8' } ⊢ { 7' 8' }
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
; _emt_mov_ptn_to_ptn:{| 0000000110.. |},{ 7' 8' } ⊢ { 0' 1' }
	mov r13,rdx
	bt r12,7
	jc LB_8602
	btr r12,0
	jmp LB_8603
LB_8602:
	bts r12,0
LB_8603:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_8604
	btr r12,1
	jmp LB_8605
LB_8604:
	bts r12,1
LB_8605:
	call NS_E_1122
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 7' 8' }
	mov rdx,r13
	bt r12,0
	jc LB_8606
	btr r12,7
	jmp LB_8607
LB_8606:
	bts r12,7
LB_8607:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_8608
	btr r12,8
	jmp LB_8609
LB_8608:
	bts r12,8
LB_8609:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_8600
	btr r12,6
	jmp LB_8601
LB_8600:
	bts r12,6
LB_8601:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_8598
	btr r12,5
	jmp LB_8599
LB_8598:
	bts r12,5
LB_8599:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_8596
	btr r12,4
	jmp LB_8597
LB_8596:
	bts r12,4
LB_8597:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_8594
	btr r12,3
	jmp LB_8595
LB_8594:
	bts r12,3
LB_8595:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_8592
	btr r12,2
	jmp LB_8593
LB_8592:
	bts r12,2
LB_8593:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8590
	btr r12,1
	jmp LB_8591
LB_8590:
	bts r12,1
LB_8591:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8588
	btr r12,0
	jmp LB_8589
LB_8588:
	bts r12,0
LB_8589:
	add rsp,64
; » _^ ..
	xor rax,rax
	add rax,6
	mov rsi,QWORD [st_vct+8*8]
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,4
	mov rdi,rax
	call mlc_s8
	mov QWORD [st_vct+8*9],rax
	btr r12,9
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
	mov rsi,QWORD [st_vct+8*8]
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
; _f38 %_8468 ⊢ %_8469 : %_8469
 ; {>  %_8468~9':_stg %_8460~5':_stg %_8454~2':_stg %_8461~6':_r64 %_8450~3':_stg %_8465~7':_r64 %_8467~8':_stg %_8447~0':_stg %_8456~4':_stg %_8448~1':_r64 }
; _f38 9' ⊢ 9'
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
	jc LB_8628
	btr r12,0
	jmp LB_8629
LB_8628:
	bts r12,0
LB_8629:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_8630
	btr r12,9
	jmp LB_8631
LB_8630:
	bts r12,9
LB_8631:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdi,QWORD [rsp+8+8*8]
	mov QWORD [st_vct+8*8],rdi
	bt rax,8
	jc LB_8626
	btr r12,8
	jmp LB_8627
LB_8626:
	bts r12,8
LB_8627:
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_8624
	btr r12,7
	jmp LB_8625
LB_8624:
	bts r12,7
LB_8625:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_8622
	btr r12,6
	jmp LB_8623
LB_8622:
	bts r12,6
LB_8623:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_8620
	btr r12,5
	jmp LB_8621
LB_8620:
	bts r12,5
LB_8621:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_8618
	btr r12,4
	jmp LB_8619
LB_8618:
	bts r12,4
LB_8619:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_8616
	btr r12,3
	jmp LB_8617
LB_8616:
	bts r12,3
LB_8617:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_8614
	btr r12,2
	jmp LB_8615
LB_8614:
	bts r12,2
LB_8615:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8612
	btr r12,1
	jmp LB_8613
LB_8612:
	bts r12,1
LB_8613:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8610
	btr r12,0
	jmp LB_8611
LB_8610:
	bts r12,0
LB_8611:
	add rsp,80
; ∎ {  }
 ; {>  %_8460~5':_stg %_8454~2':_stg %_8461~6':_r64 %_8450~3':_stg %_8465~7':_r64 %_8467~8':_stg %_8447~0':_stg %_8456~4':_stg %_8469~9':_stg %_8448~1':_r64 }
; 	∎ {  }
	bt r12,5
	jc LB_8632
	mov rdi,r11
	call dlt
LB_8632:
	bt r12,2
	jc LB_8633
	mov rdi,r8
	call dlt
LB_8633:
	bt r12,6
	jc LB_8634
	mov rdi,rcx
	call dlt
LB_8634:
	bt r12,3
	jc LB_8635
	mov rdi,r9
	call dlt
LB_8635:
	bt r12,7
	jc LB_8636
	mov rdi,rdx
	call dlt
LB_8636:
	bt r12,8
	jc LB_8637
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_8637:
	bt r12,0
	jc LB_8638
	mov rdi,r13
	call dlt
LB_8638:
	bt r12,4
	jc LB_8639
	mov rdi,r10
	call dlt
LB_8639:
	bt r12,9
	jc LB_8640
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_8640:
	bt r12,1
	jc LB_8641
	mov rdi,r14
	call dlt
LB_8641:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_8580:
	mov r15,0
LB_8643:
	cmp r15,0
	jz LB_8644
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8643
LB_8644:
; 	» "H0\n" _ ⊢ 8' : %_8470
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f38 %_8470 ⊢ %_8471 : %_8471
 ; {>  %_8470~8':_stg %_8462~7':(_opn)◂((_lst)◂(_p783)) %_8460~5':_stg %_8454~2':_stg %_8461~6':_r64 %_8450~3':_stg %_8447~0':_stg %_8456~4':_stg %_8448~1':_r64 }
; _f38 8' ⊢ 8'
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
	jc LB_8661
	btr r12,0
	jmp LB_8662
LB_8661:
	bts r12,0
LB_8662:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_8663
	btr r12,8
	jmp LB_8664
LB_8663:
	bts r12,8
LB_8664:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_8659
	btr r12,7
	jmp LB_8660
LB_8659:
	bts r12,7
LB_8660:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_8657
	btr r12,6
	jmp LB_8658
LB_8657:
	bts r12,6
LB_8658:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_8655
	btr r12,5
	jmp LB_8656
LB_8655:
	bts r12,5
LB_8656:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_8653
	btr r12,4
	jmp LB_8654
LB_8653:
	bts r12,4
LB_8654:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_8651
	btr r12,3
	jmp LB_8652
LB_8651:
	bts r12,3
LB_8652:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_8649
	btr r12,2
	jmp LB_8650
LB_8649:
	bts r12,2
LB_8650:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8647
	btr r12,1
	jmp LB_8648
LB_8647:
	bts r12,1
LB_8648:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8645
	btr r12,0
	jmp LB_8646
LB_8645:
	bts r12,0
LB_8646:
	add rsp,72
; ∎ {  }
 ; {>  %_8462~7':(_opn)◂((_lst)◂(_p783)) %_8471~8':_stg %_8460~5':_stg %_8454~2':_stg %_8461~6':_r64 %_8450~3':_stg %_8447~0':_stg %_8456~4':_stg %_8448~1':_r64 }
; 	∎ {  }
	bt r12,7
	jc LB_8665
	mov rdi,rdx
	call dlt
LB_8665:
	bt r12,8
	jc LB_8666
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_8666:
	bt r12,5
	jc LB_8667
	mov rdi,r11
	call dlt
LB_8667:
	bt r12,2
	jc LB_8668
	mov rdi,r8
	call dlt
LB_8668:
	bt r12,6
	jc LB_8669
	mov rdi,rcx
	call dlt
LB_8669:
	bt r12,3
	jc LB_8670
	mov rdi,r9
	call dlt
LB_8670:
	bt r12,0
	jc LB_8671
	mov rdi,r13
	call dlt
LB_8671:
	bt r12,4
	jc LB_8672
	mov rdi,r10
	call dlt
LB_8672:
	bt r12,1
	jc LB_8673
	mov rdi,r14
	call dlt
LB_8673:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_8642:
MTC_LB_8549:
	mov r15,0
LB_8675:
	cmp r15,0
	jz LB_8676
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8675
LB_8676:
; 	» "H1\n" _ ⊢ 6' : %_8472
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f38 %_8472 ⊢ %_8473 : %_8473
 ; {>  %_8454~2':_stg %_8450~3':_stg %_8457~5':(_opn)◂(_stg) %_8447~0':_stg %_8456~4':_stg %_8448~1':_r64 %_8472~6':_stg }
; _f38 6' ⊢ 6'
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
	jc LB_8689
	btr r12,0
	jmp LB_8690
LB_8689:
	bts r12,0
LB_8690:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_8691
	btr r12,6
	jmp LB_8692
LB_8691:
	bts r12,6
LB_8692:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_8687
	btr r12,5
	jmp LB_8688
LB_8687:
	bts r12,5
LB_8688:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_8685
	btr r12,4
	jmp LB_8686
LB_8685:
	bts r12,4
LB_8686:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_8683
	btr r12,3
	jmp LB_8684
LB_8683:
	bts r12,3
LB_8684:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_8681
	btr r12,2
	jmp LB_8682
LB_8681:
	bts r12,2
LB_8682:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8679
	btr r12,1
	jmp LB_8680
LB_8679:
	bts r12,1
LB_8680:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8677
	btr r12,0
	jmp LB_8678
LB_8677:
	bts r12,0
LB_8678:
	add rsp,56
; ∎ {  }
 ; {>  %_8454~2':_stg %_8450~3':_stg %_8473~6':_stg %_8457~5':(_opn)◂(_stg) %_8447~0':_stg %_8456~4':_stg %_8448~1':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_8693
	mov rdi,r8
	call dlt
LB_8693:
	bt r12,3
	jc LB_8694
	mov rdi,r9
	call dlt
LB_8694:
	bt r12,6
	jc LB_8695
	mov rdi,rcx
	call dlt
LB_8695:
	bt r12,5
	jc LB_8696
	mov rdi,r11
	call dlt
LB_8696:
	bt r12,0
	jc LB_8697
	mov rdi,r13
	call dlt
LB_8697:
	bt r12,4
	jc LB_8698
	mov rdi,r10
	call dlt
LB_8698:
	bt r12,1
	jc LB_8699
	mov rdi,r14
	call dlt
LB_8699:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_8674:
MTC_LB_8494:
	mov r15,0
LB_8701:
	cmp r15,0
	jz LB_8702
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8701
LB_8702:
; _f4668 { %_8447 %_8448 } ⊢ { %_8474 %_8475 %_8476 } : { %_8474 %_8475 %_8476 }
 ; {>  %_8449~2':(_lst)◂(_stg) %_8447~0':_stg %_8448~1':_r64 }
; _f4668 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_4668
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_8705
	btr r12,4
	jmp LB_8706
LB_8705:
	bts r12,4
LB_8706:
	mov r9,r10
	bt r12,4
	jc LB_8709
	btr r12,3
	jmp LB_8710
LB_8709:
	bts r12,3
LB_8710:
	mov rsi,1
	bt r12,3
	jc LB_8707
	mov rsi,0
	bt r9,0
	jc LB_8707
	jmp LB_8708
LB_8707:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8708:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_8703
	btr r12,2
	jmp LB_8704
LB_8703:
	bts r12,2
LB_8704:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_8477
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f37 %_8477 ⊢ { %_8478 %_8479 } : { %_8478 %_8479 }
 ; {>  %_8449~2':(_lst)◂(_stg) %_8475~1':_r64 %_8477~4':_stg %_8474~0':_stg %_8476~3':(_opn)◂((_lst)◂(_p783)) }
; _f37 4' ⊢ { 4' 5' }
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
	jc LB_8719
	btr r12,0
	jmp LB_8720
LB_8719:
	bts r12,0
LB_8720:
	call NS_E_37
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_8721
	btr r12,4
	jmp LB_8722
LB_8721:
	bts r12,4
LB_8722:
	mov r11,r14
	bt r12,1
	jc LB_8723
	btr r12,5
	jmp LB_8724
LB_8723:
	bts r12,5
LB_8724:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_8717
	btr r12,3
	jmp LB_8718
LB_8717:
	bts r12,3
LB_8718:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_8715
	btr r12,2
	jmp LB_8716
LB_8715:
	bts r12,2
LB_8716:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8713
	btr r12,1
	jmp LB_8714
LB_8713:
	bts r12,1
LB_8714:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8711
	btr r12,0
	jmp LB_8712
LB_8711:
	bts r12,0
LB_8712:
	add rsp,40
; _f38 { %_8478 %_8479 } ⊢ { %_8480 %_8481 } : { %_8480 %_8481 }
 ; {>  %_8449~2':(_lst)◂(_stg) %_8475~1':_r64 %_8479~5':_stg %_8474~0':_stg %_8476~3':(_opn)◂((_lst)◂(_p783)) %_8478~4':_stg }
; _f38 { 4' 5' } ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000110.. |},{ 4' 5' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r10
	bt r12,4
	jc LB_8735
	btr r12,1
	jmp LB_8736
LB_8735:
	bts r12,1
LB_8736:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_8733
	btr QWORD [rdi],0
	jmp LB_8734
LB_8733:
	bts QWORD [rdi],0
LB_8734:
	mov r14,r11
	bt r12,5
	jc LB_8739
	btr r12,1
	jmp LB_8740
LB_8739:
	bts r12,1
LB_8740:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_8737
	btr QWORD [rdi],1
	jmp LB_8738
LB_8737:
	bts QWORD [rdi],1
LB_8738:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_8743
	btr r12,1
	jmp LB_8744
LB_8743:
	bts r12,1
LB_8744:
	mov r10,r14
	bt r12,1
	jc LB_8741
	btr r12,4
	jmp LB_8742
LB_8741:
	bts r12,4
LB_8742:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_8747
	btr r12,1
	jmp LB_8748
LB_8747:
	bts r12,1
LB_8748:
	mov r11,r14
	bt r12,1
	jc LB_8745
	btr r12,5
	jmp LB_8746
LB_8745:
	bts r12,5
LB_8746:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_8731
	btr r12,3
	jmp LB_8732
LB_8731:
	bts r12,3
LB_8732:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_8729
	btr r12,2
	jmp LB_8730
LB_8729:
	bts r12,2
LB_8730:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8727
	btr r12,1
	jmp LB_8728
LB_8727:
	bts r12,1
LB_8728:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8725
	btr r12,0
	jmp LB_8726
LB_8725:
	bts r12,0
LB_8726:
	add rsp,40
; _f3558 %_8481 ⊢ { %_8482 %_8483 } : { %_8482 %_8483 }
 ; {>  %_8480~4':_stg %_8449~2':(_lst)◂(_stg) %_8475~1':_r64 %_8474~0':_stg %_8476~3':(_opn)◂((_lst)◂(_p783)) %_8481~5':_stg }
; _f3558 5' ⊢ { 5' 6' }
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
	jc LB_8759
	btr r12,0
	jmp LB_8760
LB_8759:
	bts r12,0
LB_8760:
	call NS_E_3558
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_8761
	btr r12,5
	jmp LB_8762
LB_8761:
	bts r12,5
LB_8762:
	mov rcx,r14
	bt r12,1
	jc LB_8763
	btr r12,6
	jmp LB_8764
LB_8763:
	bts r12,6
LB_8764:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_8757
	btr r12,4
	jmp LB_8758
LB_8757:
	bts r12,4
LB_8758:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_8755
	btr r12,3
	jmp LB_8756
LB_8755:
	bts r12,3
LB_8756:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_8753
	btr r12,2
	jmp LB_8754
LB_8753:
	bts r12,2
LB_8754:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8751
	btr r12,1
	jmp LB_8752
LB_8751:
	bts r12,1
LB_8752:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8749
	btr r12,0
	jmp LB_8750
LB_8749:
	bts r12,0
LB_8750:
	add rsp,48
MTC_LB_8765:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_8766
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °0◂7'
; 6' ⊢ °0◂7'
	btr r12,8
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rcx
	bt QWORD [rdi],17
	jnc LB_8767
	bt QWORD [rdi],0
	jc LB_8768
	btr r12,8
	jmp LB_8769
LB_8768:
	bts r12,8
LB_8769:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8767:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_8770
	btr r12,7
	jmp LB_8771
LB_8770:
	bts r12,7
LB_8771:
LB_8772:
	cmp r15,0
	jz LB_8773
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8772
LB_8773:
; » 0xr0 |~ {  } ⊢ %_8485 : %_8485
 ; {>  %_8480~4':_stg %_8449~2':(_lst)◂(_stg) %_8475~1':_r64 %_8484~7':_stg %_8482~5':_stg %_8474~0':_stg %_8476~3':(_opn)◂((_lst)◂(_p783)) }
; 	» 0xr0 _ ⊢ 6' : %_8485
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f4668 { %_8484 %_8485 } ⊢ { %_8486 %_8487 %_8488 } : { %_8486 %_8487 %_8488 }
 ; {>  %_8480~4':_stg %_8449~2':(_lst)◂(_stg) %_8475~1':_r64 %_8484~7':_stg %_8485~6':_r64 %_8482~5':_stg %_8474~0':_stg %_8476~3':(_opn)◂((_lst)◂(_p783)) }
; _f4668 { 7' 6' } ⊢ { 6' 7' 8' }
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
	jc LB_8786
	btr r12,0
	jmp LB_8787
LB_8786:
	bts r12,0
LB_8787:
	mov r14,rcx
	bt r12,6
	jc LB_8788
	btr r12,1
	jmp LB_8789
LB_8788:
	bts r12,1
LB_8789:
	call NS_E_4668
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_8790
	btr r12,6
	jmp LB_8791
LB_8790:
	bts r12,6
LB_8791:
	mov rdx,r14
	bt r12,1
	jc LB_8792
	btr r12,7
	jmp LB_8793
LB_8792:
	bts r12,7
LB_8793:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_8796
	btr r12,8
	jmp LB_8797
LB_8796:
	bts r12,8
LB_8797:
	mov rsi,1
	bt r12,8
	jc LB_8794
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_8794
	jmp LB_8795
LB_8794:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_8795:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_8784
	btr r12,5
	jmp LB_8785
LB_8784:
	bts r12,5
LB_8785:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_8782
	btr r12,4
	jmp LB_8783
LB_8782:
	bts r12,4
LB_8783:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_8780
	btr r12,3
	jmp LB_8781
LB_8780:
	bts r12,3
LB_8781:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_8778
	btr r12,2
	jmp LB_8779
LB_8778:
	bts r12,2
LB_8779:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8776
	btr r12,1
	jmp LB_8777
LB_8776:
	bts r12,1
LB_8777:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8774
	btr r12,0
	jmp LB_8775
LB_8774:
	bts r12,0
LB_8775:
	add rsp,56
; _f38 { %_8486 %_8487 %_8488 } ⊢ { %_8489 %_8490 %_8491 } : { %_8489 %_8490 %_8491 }
 ; {>  %_8487~7':_r64 %_8480~4':_stg %_8449~2':(_lst)◂(_stg) %_8475~1':_r64 %_8486~6':_stg %_8488~8':(_opn)◂((_lst)◂(_p783)) %_8482~5':_stg %_8474~0':_stg %_8476~3':(_opn)◂((_lst)◂(_p783)) }
; _f38 { 6' 7' 8' } ⊢ { 6' 7' 8' }
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
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,rcx
	bt r12,6
	jc LB_8812
	btr r12,1
	jmp LB_8813
LB_8812:
	bts r12,1
LB_8813:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_8810
	btr QWORD [rdi],0
	jmp LB_8811
LB_8810:
	bts QWORD [rdi],0
LB_8811:
	mov r14,rdx
	bt r12,7
	jc LB_8816
	btr r12,1
	jmp LB_8817
LB_8816:
	bts r12,1
LB_8817:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_8814
	btr QWORD [rdi],1
	jmp LB_8815
LB_8814:
	bts QWORD [rdi],1
LB_8815:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_8820
	btr r12,1
	jmp LB_8821
LB_8820:
	bts r12,1
LB_8821:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_8818
	btr QWORD [rdi],2
	jmp LB_8819
LB_8818:
	bts QWORD [rdi],2
LB_8819:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_8824
	btr r12,1
	jmp LB_8825
LB_8824:
	bts r12,1
LB_8825:
	mov rcx,r14
	bt r12,1
	jc LB_8822
	btr r12,6
	jmp LB_8823
LB_8822:
	bts r12,6
LB_8823:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_8828
	btr r12,1
	jmp LB_8829
LB_8828:
	bts r12,1
LB_8829:
	mov rdx,r14
	bt r12,1
	jc LB_8826
	btr r12,7
	jmp LB_8827
LB_8826:
	bts r12,7
LB_8827:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_8832
	btr r12,1
	jmp LB_8833
LB_8832:
	bts r12,1
LB_8833:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_8830
	btr r12,8
	jmp LB_8831
LB_8830:
	bts r12,8
LB_8831:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_8808
	btr r12,5
	jmp LB_8809
LB_8808:
	bts r12,5
LB_8809:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_8806
	btr r12,4
	jmp LB_8807
LB_8806:
	bts r12,4
LB_8807:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_8804
	btr r12,3
	jmp LB_8805
LB_8804:
	bts r12,3
LB_8805:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_8802
	btr r12,2
	jmp LB_8803
LB_8802:
	bts r12,2
LB_8803:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_8800
	btr r12,1
	jmp LB_8801
LB_8800:
	bts r12,1
LB_8801:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_8798
	btr r12,0
	jmp LB_8799
LB_8798:
	bts r12,0
LB_8799:
	add rsp,56
; ∎ {  }
 ; {>  %_8491~8':(_opn)◂((_lst)◂(_p783)) %_8480~4':_stg %_8449~2':(_lst)◂(_stg) %_8475~1':_r64 %_8489~6':_stg %_8482~5':_stg %_8474~0':_stg %_8476~3':(_opn)◂((_lst)◂(_p783)) %_8490~7':_r64 }
; 	∎ {  }
	bt r12,8
	jc LB_8834
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_8834:
	bt r12,4
	jc LB_8835
	mov rdi,r10
	call dlt
LB_8835:
	bt r12,2
	jc LB_8836
	mov rdi,r8
	call dlt
LB_8836:
	bt r12,1
	jc LB_8837
	mov rdi,r14
	call dlt
LB_8837:
	bt r12,6
	jc LB_8838
	mov rdi,rcx
	call dlt
LB_8838:
	bt r12,5
	jc LB_8839
	mov rdi,r11
	call dlt
LB_8839:
	bt r12,0
	jc LB_8840
	mov rdi,r13
	call dlt
LB_8840:
	bt r12,3
	jc LB_8841
	mov rdi,r9
	call dlt
LB_8841:
	bt r12,7
	jc LB_8842
	mov rdi,rdx
	call dlt
LB_8842:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_8766:
	mov r15,0
LB_8844:
	cmp r15,0
	jz LB_8845
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8844
LB_8845:
; ∎ {  }
 ; {>  %_8480~4':_stg %_8449~2':(_lst)◂(_stg) %_8475~1':_r64 %_8483~6':(_opn)◂(_stg) %_8482~5':_stg %_8474~0':_stg %_8476~3':(_opn)◂((_lst)◂(_p783)) }
; 	∎ {  }
	bt r12,4
	jc LB_8846
	mov rdi,r10
	call dlt
LB_8846:
	bt r12,2
	jc LB_8847
	mov rdi,r8
	call dlt
LB_8847:
	bt r12,1
	jc LB_8848
	mov rdi,r14
	call dlt
LB_8848:
	bt r12,6
	jc LB_8849
	mov rdi,rcx
	call dlt
LB_8849:
	bt r12,5
	jc LB_8850
	mov rdi,r11
	call dlt
LB_8850:
	bt r12,0
	jc LB_8851
	mov rdi,r13
	call dlt
LB_8851:
	bt r12,3
	jc LB_8852
	mov rdi,r9
	call dlt
LB_8852:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_8843:
MTC_LB_8700:
section .data
	CST_DYN_3620:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_8492:
		dq 0x0000_0001_00_82_ffff
		dq 1
