%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_54
	call NS_E_138
	call exec_out
	jmp _end
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
NS_E_38:
NS_E_RDI_38:
NS_E_38_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_38_LB_0
	bt r11,7
	jc LB_39
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
LB_39:
	add rsi,1
	bt r11,6
	jc LB_40
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
LB_40:
	add rsi,1
	bt r11,5
	jc LB_41
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
LB_41:
	add rsi,1
	bt r11,5
	jc LB_41
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
NS_E_38_LB_0:
	mov rax,0
	ret
NS_E_42:
NS_E_RDI_42:
NS_E_42_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_42_LB_0
	cmp r11,57
	ja NS_E_42_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_42_LB_0:
	mov rax,0
	ret
NS_E_44:
NS_E_RDI_44:
NS_E_44_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_44_LB_0
	cmp r11,122
	ja NS_E_44_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_44_LB_0:
	mov rax,0
	ret
NS_E_43:
NS_E_RDI_43:
NS_E_43_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_43_LB_0
	cmp r11,90
	ja NS_E_43_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_43_LB_0:
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
NS_E_54:
NS_E_RDI_54:
; » 0xrff |~ {  } ⊢ %_45 : %_45
 ; {>  }
; 	» 0xrff _ ⊢ 0' : %_45
	mov rdi,0xff
	mov r13,rdi
	bts r12,0
; » 0xraa |~ {  } ⊢ %_46 : %_46
 ; {>  %_45~0':_r64 }
; 	» 0xraa _ ⊢ 1' : %_46
	mov rdi,0xaa
	mov r14,rdi
	bts r12,1
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { %_47 %_48 %_49 } : { %_47 %_48 %_49 }
 ; {>  %_45~0':_r64 %_46~1':_r64 }
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { { {  } {  } } {  } { {  } } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { { {  } {  } } {  } { {  } } } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r15
	bt r12,2
	jc LB_61
	btr QWORD [rdi],0
	jmp LB_62
LB_61:
	bts QWORD [rdi],0
LB_62:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r15
	bt r12,2
	jc LB_63
	btr QWORD [rdi],1
	jmp LB_64
LB_63:
	bts QWORD [rdi],1
LB_64:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_59
	btr QWORD [rdi],0
	jmp LB_60
LB_59:
	bts QWORD [rdi],0
LB_60:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_65
	btr QWORD [rdi],1
	jmp LB_66
LB_65:
	bts QWORD [rdi],1
LB_66:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r15
	bt r12,2
	jc LB_69
	btr QWORD [rdi],0
	jmp LB_70
LB_69:
	bts QWORD [rdi],0
LB_70:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_67
	btr QWORD [rdi],2
	jmp LB_68
LB_67:
	bts QWORD [rdi],2
LB_68:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { { {  } {  } } {  } { {  } } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_75
	btr r12,1
	jmp LB_76
LB_75:
	bts r12,1
LB_76:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_71
	btr r12,2
	jmp LB_72
LB_71:
	bts r12,2
LB_72:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_73
	btr r12,2
	jmp LB_74
LB_73:
	bts r12,2
LB_74:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_77
	btr r12,1
	jmp LB_78
LB_77:
	bts r12,1
LB_78:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_81
	btr r12,1
	jmp LB_82
LB_81:
	bts r12,1
LB_82:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_79
	btr r12,2
	jmp LB_80
LB_79:
	bts r12,2
LB_80:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_57
	btr r12,1
	jmp LB_58
LB_57:
	bts r12,1
LB_58:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_55
	btr r12,0
	jmp LB_56
LB_55:
	bts r12,0
LB_56:
	add rsp,24
; _f14 %_47 ⊢ %_50 : %_50
 ; {>  %_47~{ {  } {  } }:{ { } { } } %_45~0':_r64 %_49~{ {  } }:{ { } } %_48~{  }:{ } %_46~1':_r64 }
; _f14 { {  } {  } } ⊢ { {  } {  } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { {  } {  } } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_87
	btr QWORD [rdi],0
	jmp LB_88
LB_87:
	bts QWORD [rdi],0
LB_88:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_89
	btr QWORD [rdi],1
	jmp LB_90
LB_89:
	bts QWORD [rdi],1
LB_90:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_91
	btr r12,1
	jmp LB_92
LB_91:
	bts r12,1
LB_92:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_93
	btr r12,1
	jmp LB_94
LB_93:
	bts r12,1
LB_94:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_85
	btr r12,1
	jmp LB_86
LB_85:
	bts r12,1
LB_86:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_83
	btr r12,0
	jmp LB_84
LB_83:
	bts r12,0
LB_84:
	add rsp,24
; _f14 %_48 ⊢ %_51 : %_51
 ; {>  %_45~0':_r64 %_49~{ {  } }:{ { } } %_48~{  }:{ } %_50~{ {  } {  } }:{ { } { } } %_46~1':_r64 }
; _f14 {  } ⊢ {  }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn {  } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_97
	btr r12,1
	jmp LB_98
LB_97:
	bts r12,1
LB_98:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_95
	btr r12,0
	jmp LB_96
LB_95:
	bts r12,0
LB_96:
	add rsp,24
; _f14 %_49 ⊢ _(37) : _(37)
 ; {>  %_51~{  }:{ } %_45~0':_r64 %_49~{ {  } }:{ { } } %_50~{ {  } {  } }:{ { } { } } %_46~1':_r64 }
; _f14 { {  } } ⊢ { {  } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { {  } } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_103
	btr QWORD [rdi],0
	jmp LB_104
LB_103:
	bts QWORD [rdi],0
LB_104:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_105
	btr r12,1
	jmp LB_106
LB_105:
	bts r12,1
LB_106:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_101
	btr r12,1
	jmp LB_102
LB_101:
	bts r12,1
LB_102:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_99
	btr r12,0
	jmp LB_100
LB_99:
	bts r12,0
LB_100:
	add rsp,24
; _f14 %_45 ⊢ %_52 : %_52
 ; {>  %_51~{  }:{ } %_45~0':_r64 %_50~{ {  } {  } }:{ { } { } } %_46~1':_r64 }
; _f14 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_107
	btr r12,1
	jmp LB_108
LB_107:
	bts r12,1
LB_108:
	add rsp,16
; _f14 { %_52 %_46 } ⊢ %_53 : %_53
 ; {>  %_51~{  }:{ } %_52~0':_r64 %_50~{ {  } {  } }:{ { } { } } %_46~1':_r64 }
; _f14 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_109
	btr r12,2
	jmp LB_110
LB_109:
	bts r12,2
LB_110:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r15
	bt r12,2
	jc LB_113
	btr r12,3
	jmp LB_114
LB_113:
	bts r12,3
LB_114:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_111
	btr QWORD [rdi],0
	jmp LB_112
LB_111:
	bts QWORD [rdi],0
LB_112:
	mov r8,r14
	bt r12,1
	jc LB_117
	btr r12,3
	jmp LB_118
LB_117:
	bts r12,3
LB_118:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_115
	btr QWORD [rdi],1
	jmp LB_116
LB_115:
	bts QWORD [rdi],1
LB_116:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' }
	mov r15,r13
	bt r12,0
	jc LB_119
	btr r12,2
	jmp LB_120
LB_119:
	bts r12,2
LB_120:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_123
	btr r12,3
	jmp LB_124
LB_123:
	bts r12,3
LB_124:
	mov r13,r8
	bt r12,3
	jc LB_121
	btr r12,0
	jmp LB_122
LB_121:
	bts r12,0
LB_122:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_127
	btr r12,3
	jmp LB_128
LB_127:
	bts r12,3
LB_128:
	mov r14,r8
	bt r12,3
	jc LB_125
	btr r12,1
	jmp LB_126
LB_125:
	bts r12,1
LB_126:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_51~{  }:{ } %_53~{ 0' 1' }:{ _r64 _r64 } %_50~{ {  } {  } }:{ { } { } } }
; 	∎ {  }
	bt r12,0
	jc LB_129
	mov rdi,r13
	call dlt
LB_129:
	bt r12,1
	jc LB_130
	mov rdi,r14
	call dlt
LB_130:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_138:
NS_E_RDI_138:
; » 0xr89873 |~ {  } ⊢ %_131 : %_131
 ; {>  }
; 	» 0xr89873 _ ⊢ 0' : %_131
	mov rdi,0x89873
	mov r13,rdi
	bts r12,0
; » 0xrfff |~ {  } ⊢ %_132 : %_132
 ; {>  %_131~0':_r64 }
; 	» 0xrfff _ ⊢ 1' : %_132
	mov rdi,0xfff
	mov r14,rdi
	bts r12,1
; » 0xrafa |~ {  } ⊢ %_133 : %_133
 ; {>  %_131~0':_r64 %_132~1':_r64 }
; 	» 0xrafa _ ⊢ 2' : %_133
	mov rdi,0xafa
	mov r15,rdi
	bts r12,2
; _f26 { %_132 %_133 } ⊢ { %_134 %_135 } : { %_134 %_135 }
 ; {>  %_131~0':_r64 %_132~1':_r64 %_133~2':_r64 }
	add r14,r15
; _f14 { %_134 %_135 } ⊢ { %_136 %_137 } : { %_136 %_137 }
 ; {>  %_131~0':_r64 %_134~1':_r64 %_135~2':_r64 }
; _f14 { 1' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r14
	bt r12,1
	jc LB_143
	btr r12,3
	jmp LB_144
LB_143:
	bts r12,3
LB_144:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_141
	btr QWORD [rdi],0
	jmp LB_142
LB_141:
	bts QWORD [rdi],0
LB_142:
	mov r8,r15
	bt r12,2
	jc LB_147
	btr r12,3
	jmp LB_148
LB_147:
	bts r12,3
LB_148:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_145
	btr QWORD [rdi],1
	jmp LB_146
LB_145:
	bts QWORD [rdi],1
LB_146:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_151
	btr r12,3
	jmp LB_152
LB_151:
	bts r12,3
LB_152:
	mov r14,r8
	bt r12,3
	jc LB_149
	btr r12,1
	jmp LB_150
LB_149:
	bts r12,1
LB_150:
	mov rdi,r13
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_155
	btr r12,3
	jmp LB_156
LB_155:
	bts r12,3
LB_156:
	mov r15,r8
	bt r12,3
	jc LB_153
	btr r12,2
	jmp LB_154
LB_153:
	bts r12,2
LB_154:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_139
	btr r12,0
	jmp LB_140
LB_139:
	bts r12,0
LB_140:
	add rsp,16
; ∎ {  }
 ; {>  %_131~0':_r64 %_137~2':_r64 %_136~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_157
	mov rdi,r13
	call dlt
LB_157:
	bt r12,2
	jc LB_158
	mov rdi,r15
	call dlt
LB_158:
	bt r12,1
	jc LB_159
	mov rdi,r14
	call dlt
LB_159:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_38:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_38
	NS_E_DYN_42:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_42
	NS_E_DYN_43:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_43
	NS_E_DYN_44:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_44
	CST_DYN_54:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_138:
		dq 0x0001_0001_00_82_ffff
		dq 1
