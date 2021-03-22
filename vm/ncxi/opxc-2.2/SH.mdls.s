%include "HD.s"  
;	v.0
%define RCD_N 64
%define GLV_N 317
 
section .bss
%include "BSS.s"

section .data
%include "DATA.s"
LB_22_H: dq 0x4
LB_22: db 101,109,116,58,0,0,0,0,0,0,0,0,0
LB_28_H: dq 0x7
LB_28: db 32,58,32,95,114,54,52,0,0,0,0,0,0,0,0,0
LB_32_H: dq 0x1
LB_32: db 10,0,0,0,0,0,0,0,0,0
LB_63_H: dq 0x6
LB_63: db 226,128,185,226,128,186,0,0,0,0,0,0,0,0,0
LB_154_H: dq 0x1
LB_154: db 123,0,0,0,0,0,0,0,0,0
LB_157_H: dq 0x1
LB_157: db 32,0,0,0,0,0,0,0,0,0
LB_162_H: dq 0x3
LB_162: db 123,43,32,0,0,0,0,0,0,0,0,0
LB_173_H: dq 0x1
LB_173: db 34,0,0,0,0,0,0,0,0,0
LB_178_H: dq 0x7
LB_178: db 34,32,58,32,95,115,56,0,0,0,0,0,0,0,0,0
LB_189_H: dq 0x7
LB_189: db 95,99,110,115,226,151,130,0,0,0,0,0,0,0,0,0
LB_200_H: dq 0x2
LB_200: db 32,125,0,0,0,0,0,0,0,0,0
LB_203_H: dq 0x7
LB_203: db 95,110,105,108,226,151,130,0,0,0,0,0,0,0,0,0
LB_218_H: dq 0x4
LB_218: db 226,128,185,32,0,0,0,0,0,0,0,0,0
LB_234_H: dq 0x4
LB_234: db 32,226,128,186,0,0,0,0,0,0,0,0,0
LB_247_H: dq 0x1
LB_247: db 125,0,0,0,0,0,0,0,0,0
section .text
global _start
_start:
%include "START.s"
	jmp RTM_0
LB_8: ;; #0x◂◂(_none◂{}) { { { } 132'(=  ) } 133'(=  ) } ⊢ .. : ({ { (.p19◂(_arr◂(_arr◂(_r8◂)◂{  })◂{  })) (_r64◂)  } (_r64◂)  }→{  })
JMP_8:
	MOV_RBX rdi,GLX(0x85)
	cmp rdi,0x0
	jz LB_10
	MOV_RBX rax,GLX(0x84)
	push SRC_REG 
	mov SRC_REG,rax
	add rax,(8*0x1)
	MOV_RBX GLX(0x84),rax
	MOV_RDI GLX(0x86),SX(0x0)
	pop SRC_REG
	MOV_RBX rax,GLX(0x86)
LB_11:
 mov rdi,rax
 call free_opq
LB_12:
	MOV_RBX rax,GLX(0x85)
LB_13:
 sub rax,1 
LB_14:
	MOV_RBX GLX(0x85),rax
	jmp JMP_8
LB_10:
 ret 
LB_9:
LB_1: ;; #0x◂◂(_none◂{}) 129'(=  ) ⊢ .. : ((_arr◂(_arr◂(_r8◂)◂{  })◂{  })→{  })
JMP_1:
	MOV_RBX rax,GLX(0x81)
LB_2:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_3:
	MOV_RBX GLX(0x82),rdi
	MOV_RBX rax,GLX(0x81)
LB_4:
	mov rdi,rax
LB_5:
	MOV_RBX GLX(0x83),rdi
	MOV_RBX rax,GLX(0x83)
LB_6:
	mov rdi,0x8
	add rax,rdi
LB_7:
	MOV_RBX GLX(0x83),rax
	lea rsp,[rsp-(8*0x1)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0x81)
	push EXH_16
	MOV_RBX GLX(0x84),GLX(0x83)
	MOV_RBX GLX(0x85),GLX(0x82)
	call LB_8
	add rsp,8
	MOV_RDI GLX(0x81),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	MOV_RBX rax,GLX(0x81)
LB_17:
 mov rdi,rax
 call free_opq
LB_18:
 ret 
EXH_16:
	add rsp,0x8
	pop rax
	jmp rax
LB_25: ;; #0x◂◂(_none◂{}) 137'(=  ) ⊢ .. : ((_r64◂)→(_r64◂))
JMP_25:
	MOV_RBX rax,GLX(0x89)
LB_26:
 sub rsp,32 
 mov rdi,rsp 
 mov BYTE [rdi],'0'
 mov BYTE [rdi+1],'x' 
 add rdi,2 
 call pf_x 
 mov BYTE [rdi+rax],'r' 
 sub rdi,2  
 add rax,3 
 mov rsi,rax  
 C_CALL fw
 add rsp,32 
LB_27:
	mov GLX(0x8a),LB_28
	MOV_RBX rax,GLX(0x8a)
LB_29:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_30:
	MOV_RBX GLX(0x0),GLX(0x89)
 ret 
LB_58: ;; #0x◂◂(_none◂{}) 150'◂151'' ⊢ .. : ((.p23◂(_opn◂q()))→(.p23◂(_opn◂q())))
JMP_58:
	MOV_RBX rdi,GLX(0x96)
	jmp QWORD [LB_62+8*rdi]
LB_62: dq LB_60,LB_61
LB_60:
	RT_ERR 0xbbff_2e17
LB_61:
	mov GLX(0x98),LB_63
	MOV_RBX rax,GLX(0x98)
LB_64:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_65:
	mov GLX(0x99),0x1
	MOV_RBX GLX(0x0),GLX(0x99)
 ret 
LB_59:
LB_69: ;; #0x◂◂(_none◂{}) 156'◂157'' ⊢ .. : ((.p23◂(_opn◂q()))→{  })
JMP_69:
	MOV_RBX rdi,GLX(0x9c)
	jmp QWORD [LB_73+8*rdi]
LB_73: dq LB_71,LB_72
LB_71:
	RT_ERR 0xbbff_2e17
LB_72:
 ret 
LB_70:
LB_76: ;; #0x◂◂(_some◂5r) 164'(=  ) ⊢ .. : ((_r64◂)→{ (_r64◂) (_r64◂)  })
JMP_76:
	MOV_RBX rax,GLX(0xa4)
LB_77:
	mov rdi,rax
LB_78:
	MOV_RBX GLX(0xa5),rdi
	MOV_RBX rax,GLX(0xa5)
LB_79:
	mov rdi,0x5
	imul rax,rdi
LB_80:
	MOV_RBX GLX(0xa5),rax
	MOV_RBX rax,GLX(0xa4)
	MOV_RBX rdi,GLX(0xa5)
LB_81:
 push rax
 lea rdi,[8+8*rdi]
 mov rsi,1
 xor rax,rax 
 CALLOC_SF
 pop QWORD [rax]
 mov rdi,rax
LB_82:
	MOV_RBX GLX(0xa5),rdi
	MOV_RBX GLX(0x0),GLX(0xa4)
	MOV_RBX GLX(0x1),GLX(0xa5)
 ret 
LB_91: ;; #0x◂◂(_none◂{}) 175'◂176'' ⊢ .. : ((.p23◂(_opn◂{ (_r64◂) {  }  }))→{ (.p23◂(_opn◂{ (_r64◂) {  }  })) (.p23◂(_opn◂{ (_r64◂) {  }  }))  })
JMP_91:
	MOV_RBX rdi,GLX(0xaf)
	jmp QWORD [LB_95+8*rdi]
LB_95: dq LB_93,LB_94
LB_93:
	MOV_RBX rax,GLX(0xb0)
LB_96:
	mov rdi,rax
LB_97:
	MOV_RBX GLX(0xb1),rdi
	mov GLX(0xb2),0x0
	sub rsp,8
	mov DST_REG,rsp
	MOV_RDI DX(0x0),GLX(0xb0)
	pop rax
	MOV_RBX GLX(0xb3),rax
	mov GLX(0xb4),0x0
	sub rsp,8
	mov DST_REG,rsp
	MOV_RDI DX(0x0),GLX(0xb1)
	pop rax
	MOV_RBX GLX(0xb5),rax
	MOV_RBX GLX(0x0),GLX(0xb2)
	MOV_RBX GLX(0x1),GLX(0xb3)
	MOV_RBX GLX(0x2),GLX(0xb4)
	MOV_RBX GLX(0x3),GLX(0xb5)
 ret 
LB_94:
	mov GLX(0xb6),0x1
	mov GLX(0xb7),0x1
	MOV_RBX GLX(0x0),GLX(0xb6)
	MOV_RBX GLX(0x2),GLX(0xb7)
 ret 
LB_92:
LB_99: ;; #0x◂◂(_none◂{}) 184'◂185'' ⊢ .. : ((.p23◂(_lst◂(_r64◂)))→{ (.p23◂(_lst◂(_r64◂))) (.p23◂(_lst◂(_r64◂)))  })
JMP_99:
	MOV_RBX rdi,GLX(0xb8)
	jmp QWORD [LB_103+8*rdi]
LB_103: dq LB_101,LB_102
LB_101:
	MOV_RBX rdi,GLX(0xb9)
	push SRC_REG 
	mov SRC_REG,rdi 
	add SRC_REG,8
	MOV_RDI GLX(0xba),SX(0x0)
	MOV_RDI GLX(0xbb),SX(0x1)
	MOV_RDI GLX(0xbc),SX(0x2)
	sub SRC_REG,8 
	mov rdi,SRC_REG  
	pop SRC_REG 
	FREE_RCD 4,rdi
	MOV_RBX rax,GLX(0xba)
LB_104:
	mov rdi,rax
LB_105:
	MOV_RBX GLX(0xbd),rdi
	lea rsp,[rsp-(8*0x2)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0xbd)
	MOV_RDI QWORD [rsp+8*0x1],GLX(0xba)
	push EXH_106
	MOV_RBX GLX(0xb8),GLX(0xbb)
	MOV_RBX GLX(0xb9),GLX(0xbc)
	call LB_99
	add rsp,8
	MOV_RDI GLX(0xba),QWORD [rsp+8*0x1]
	MOV_RDI GLX(0xbd),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x2)]
	mov GLX(0xbe),0x0
	ALC_RCD 4,rax
	MOV_RBX GLX(0xbf),rax
	lea DST_REG,[rax+8]
	MOV_RDI DX(0x0),GLX(0xba)
	MOV_RDI DX(0x1),GLX(0x0)
	MOV_RDI DX(0x2),GLX(0x1)
	mov GLX(0xc0),0x0
	ALC_RCD 4,rax
	MOV_RBX GLX(0xc1),rax
	lea DST_REG,[rax+8]
	MOV_RDI DX(0x0),GLX(0xbd)
	MOV_RDI DX(0x1),GLX(0x2)
	MOV_RDI DX(0x2),GLX(0x3)
	MOV_RBX GLX(0x0),GLX(0xbe)
	MOV_RBX GLX(0x1),GLX(0xbf)
	MOV_RBX GLX(0x2),GLX(0xc0)
	MOV_RBX GLX(0x3),GLX(0xc1)
 ret 
LB_102:
	mov GLX(0xc2),0x1
	mov GLX(0xc3),0x1
	MOV_RBX GLX(0x0),GLX(0xc2)
	MOV_RBX GLX(0x2),GLX(0xc3)
 ret 
LB_100:
EXH_106:
	add rsp,0x8
	pop rax
	jmp rax
LB_88: ;; #0x◂◂(_none◂{}) { { 167'(=  ) { 168'(=  ) 169'◂170'' 171'◂172'' } 173'(=  ) } 174'(=  ) } ⊢ .. : ({ { (_r64◂) { (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  } (_r64◂)  } (_r64◂)  }→{ (_r64◂) { (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  }  })
JMP_88:
	MOV_RBX rdi,GLX(0xae)
	MOV_RBX rax,GLX(0xa7)
	cmp rax,rdi
	jz LB_90
	push EXH_98
	MOV_RBX GLX(0xaf),GLX(0xab)
	MOV_RBX GLX(0xb0),GLX(0xac)
	call LB_91
	add rsp,8
	lea rsp,[rsp-(8*0x8)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0x0)
	MOV_RDI QWORD [rsp+8*0x1],GLX(0x1)
	MOV_RDI QWORD [rsp+8*0x2],GLX(0x2)
	MOV_RDI QWORD [rsp+8*0x3],GLX(0x3)
	MOV_RDI QWORD [rsp+8*0x4],GLX(0xa8)
	MOV_RDI QWORD [rsp+8*0x5],GLX(0xa7)
	MOV_RDI QWORD [rsp+8*0x6],GLX(0xad)
	MOV_RDI QWORD [rsp+8*0x7],GLX(0xae)
	push EXH_107
	MOV_RBX GLX(0xb8),GLX(0xa9)
	MOV_RBX GLX(0xb9),GLX(0xaa)
	call LB_99
	add rsp,8
	MOV_RDI GLX(0xae),QWORD [rsp+8*0x7]
	MOV_RDI GLX(0xad),QWORD [rsp+8*0x6]
	MOV_RDI GLX(0xa7),QWORD [rsp+8*0x5]
	MOV_RDI GLX(0xa8),QWORD [rsp+8*0x4]
	MOV_RDI GLX(0xc7),QWORD [rsp+8*0x3]
	MOV_RDI GLX(0xc6),QWORD [rsp+8*0x2]
	MOV_RDI GLX(0xc5),QWORD [rsp+8*0x1]
	MOV_RDI GLX(0xc4),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x8)]
	MOV_RBX rax,GLX(0xa8)
LB_108:
 mov rdi,rax 
 call rpc_s8 
 mov rdi,rax 
LB_109:
	MOV_RBX GLX(0xc8),rdi
	MOV_RBX rax,GLX(0xad)
	push DST_REG
	mov DST_REG,rax
	add rax,(8*0x5)
	MOV_RBX GLX(0xad),rax
	MOV_RDI DX(0x0),GLX(0xc8)
	MOV_RDI DX(0x1),GLX(0x2)
	MOV_RDI DX(0x2),GLX(0x3)
	MOV_RDI DX(0x3),GLX(0xc6)
	MOV_RDI DX(0x4),GLX(0xc7)
	pop DST_REG
	MOV_RBX rax,GLX(0xae)
LB_110:
 add rax,1 
LB_111:
	MOV_RBX GLX(0xae),rax
	MOV_RBX GLX(0xa9),GLX(0x0)
	MOV_RBX GLX(0xaa),GLX(0x1)
	MOV_RBX GLX(0xab),GLX(0xc4)
	MOV_RBX GLX(0xac),GLX(0xc5)
	jmp JMP_88
LB_90:
	MOV_RBX GLX(0x0),GLX(0xa7)
	MOV_RBX GLX(0x1),GLX(0xa8)
	MOV_RBX GLX(0x2),GLX(0xa9)
	MOV_RBX GLX(0x3),GLX(0xaa)
	MOV_RBX GLX(0x4),GLX(0xab)
	MOV_RBX GLX(0x5),GLX(0xac)
 ret 
LB_89:
EXH_98:
	add rsp,0x8
	pop rax
	jmp rax
EXH_107:
	add rsp,0x8
	pop rax
	jmp rax
LB_75: ;; #0x◂◂(_some◂.#0x42 ? ) { 158'(=  ) { 159'(=  ) 160'◂161'' 162'◂163'' } } ⊢ .. : ({ (_r64◂) { (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  }  }→{ (_r64◂) { (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  } (_arr◂{ (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  }◂{  })  })
JMP_75:
	push EXH_83
	MOV_RBX GLX(0xa4),GLX(0x9e)
	call LB_76
	add rsp,8
	MOV_RBX rax,GLX(0x1)
LB_84:
	mov rdi,rax
LB_85:
	MOV_RBX GLX(0xa6),rdi
	MOV_RBX rax,GLX(0xa6)
LB_86:
	mov rdi,0x8
	add rax,rdi
LB_87:
	MOV_RBX GLX(0xa6),rax
	lea rsp,[rsp-(8*0x1)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0x1)
	push EXH_113
	mov rax,0x0
	MOV_RBX GLX(0xca),rax
	MOV_RBX GLX(0xa7),GLX(0x0)
	MOV_RBX GLX(0xa8),GLX(0x9f)
	MOV_RBX GLX(0xa9),GLX(0xa0)
	MOV_RBX GLX(0xaa),GLX(0xa1)
	MOV_RBX GLX(0xab),GLX(0xa2)
	MOV_RBX GLX(0xac),GLX(0xa3)
	MOV_RBX GLX(0xad),GLX(0xa6)
	MOV_RBX GLX(0xae),GLX(0xca)
	call LB_88
	add rsp,8
	MOV_RDI GLX(0xc9),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	MOV_RBX GLX(0x6),GLX(0xc9)
 ret 
EXH_83:
	add rsp,0x8
	pop rax
	jmp rax
EXH_113:
	add rsp,0x8
	pop rax
	jmp rax
LB_117: ;; #0x◂◂(_none◂{}) 209'◂210'' ⊢ .. : ((.p23◂(_lst◂(_r64◂)))→{  })
JMP_117:
	MOV_RBX rdi,GLX(0xd1)
	jmp QWORD [LB_121+8*rdi]
LB_121: dq LB_119,LB_120
LB_119:
	MOV_RBX rdi,GLX(0xd2)
	push SRC_REG 
	mov SRC_REG,rdi 
	add SRC_REG,8
	MOV_RDI GLX(0xd3),SX(0x0)
	MOV_RDI GLX(0xd4),SX(0x1)
	MOV_RDI GLX(0xd5),SX(0x2)
	sub SRC_REG,8 
	mov rdi,SRC_REG  
	pop SRC_REG 
	FREE_RCD 4,rdi
	lea rsp,[rsp-(8*0x1)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0xd3)
	push EXH_122
	MOV_RBX GLX(0xd1),GLX(0xd4)
	MOV_RBX GLX(0xd2),GLX(0xd5)
	call LB_117
	add rsp,8
	MOV_RDI GLX(0xd3),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
 ret 
LB_120:
 ret 
LB_118:
EXH_122:
	add rsp,0x8
	pop rax
	jmp rax
LB_124: ;; #0x◂◂(_none◂{}) 217'◂218'' ⊢ .. : ((.p23◂(_opn◂{ (_r64◂) {  }  }))→{  })
JMP_124:
	MOV_RBX rdi,GLX(0xd9)
	jmp QWORD [LB_128+8*rdi]
LB_128: dq LB_126,LB_127
LB_126:
 ret 
LB_127:
 ret 
LB_125:
LB_138: ;; #0x◂◂(_none◂{}) { { 222'(=  ) 223'(=  ) 224'(=  ) } 225'(=  ) } ⊢ .. : ({ { (_arr◂{ (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  }◂{  }) (_r64◂) (_r64◂)  } (_r64◂)  }→{ (_arr◂{ (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  }◂{  }) (_r64◂)  })
JMP_138:
	MOV_RBX rdi,GLX(0xe0)
	MOV_RBX rax,GLX(0xe1)
	cmp rax,rdi
	jz LB_140
	MOV_RBX rax,GLX(0xde)
	MOV_RBX rdi,GLX(0xe1)
	mov rsi,0x0000_ffff_ffff_ffff 
 mov rdx,QWORD [rax] 
	and rsi,rdx 
	cmp rdi,rsi 
	jge err_alc_o				
	lea rdi,[rdi+4*rdi]
	lea SRC_REG,[rax+8+8*rdi]
	MOV_RDI GLX(0xe2),SX(0x0)
	MOV_RDI GLX(0xe3),SX(0x1)
	MOV_RDI GLX(0xe4),SX(0x2)
	MOV_RDI GLX(0xe5),SX(0x3)
	MOV_RDI GLX(0xe6),SX(0x4)
	push EXH_141
	MOV_RBX GLX(0xaf),GLX(0xe5)
	MOV_RBX GLX(0xb0),GLX(0xe6)
	call LB_91
	add rsp,8
	MOV_RBX GLX(0xe7),GLX(0x0)
	MOV_RBX GLX(0xe8),GLX(0x1)
	MOV_RBX GLX(0xe9),GLX(0x2)
	MOV_RBX GLX(0xea),GLX(0x3)
	push EXH_142
	MOV_RBX GLX(0xb8),GLX(0xe3)
	MOV_RBX GLX(0xb9),GLX(0xe4)
	call LB_99
	add rsp,8
	MOV_RBX rax,GLX(0xe2)
LB_143:
 mov rdi,rax 
 call rpc_s8 
 mov rdi,rax 
LB_144:
	MOV_RBX GLX(0xeb),rdi
	MOV_RBX rax,GLX(0xde)
	MOV_RBX rdi,GLX(0xe1)
	lea rdi,[rdi+4*rdi]
	lea DST_REG,[rax+8+8*rdi]
	MOV_RDI DX(0x0),GLX(0xe2)
	MOV_RDI DX(0x1),GLX(0x0)
	MOV_RDI DX(0x2),GLX(0x1)
	MOV_RDI DX(0x3),GLX(0xe7)
	MOV_RDI DX(0x4),GLX(0xe8)
	MOV_RBX rax,GLX(0xdf)
	push DST_REG
	mov DST_REG,rax
	add rax,(8*0x5)
	MOV_RBX GLX(0xdf),rax
	MOV_RDI DX(0x0),GLX(0xeb)
	MOV_RDI DX(0x1),GLX(0x2)
	MOV_RDI DX(0x2),GLX(0x3)
	MOV_RDI DX(0x3),GLX(0xe9)
	MOV_RDI DX(0x4),GLX(0xea)
	pop DST_REG
	MOV_RBX rax,GLX(0xe1)
LB_145:
 add rax,1 
LB_146:
	MOV_RBX GLX(0xe1),rax
	jmp JMP_138
LB_140:
	MOV_RBX GLX(0x0),GLX(0xde)
	MOV_RBX GLX(0x1),GLX(0xdf)
 ret 
LB_139:
EXH_141:
	add rsp,0x8
	pop rax
	jmp rax
EXH_142:
	add rsp,0x8
	pop rax
	jmp rax
LB_130: ;; #0x◂◂(_none◂{}) 219'(=  ) ⊢ .. : ((_arr◂{ (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  }◂{  })→{ (_arr◂{ (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  }◂{  }) (_arr◂{ (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  }◂{  })  })
JMP_130:
	MOV_RBX rax,GLX(0xdb)
LB_131:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_132:
	MOV_RBX GLX(0xdc),rdi
	push EXH_133
	MOV_RBX GLX(0xa4),GLX(0xdc)
	call LB_76
	add rsp,8
	MOV_RBX rax,GLX(0x1)
LB_134:
	mov rdi,rax
LB_135:
	MOV_RBX GLX(0xdd),rdi
	MOV_RBX rax,GLX(0xdd)
LB_136:
	mov rdi,0x8
	add rax,rdi
LB_137:
	MOV_RBX GLX(0xdd),rax
	lea rsp,[rsp-(8*0x1)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0x1)
	push EXH_148
	mov rax,0x0
	MOV_RBX GLX(0xed),rax
	MOV_RBX GLX(0xde),GLX(0xdb)
	MOV_RBX GLX(0xdf),GLX(0xdd)
	MOV_RBX GLX(0xe0),GLX(0x0)
	MOV_RBX GLX(0xe1),GLX(0xed)
	call LB_138
	add rsp,8
	MOV_RDI GLX(0xec),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	MOV_RBX GLX(0x1),GLX(0xec)
 ret 
EXH_133:
	add rsp,0x8
	pop rax
	jmp rax
EXH_148:
	add rsp,0x8
	pop rax
	jmp rax
LB_172: ;; #0x◂◂(_none◂{}) 255'(=  ) ⊢ .. : ((_arr◂(_r8◂)◂{  })→(_arr◂(_r8◂)◂{  }))
JMP_172:
	mov GLX(0x100),LB_173
	MOV_RBX rax,GLX(0x100)
LB_174:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_175:
	MOV_RBX rax,GLX(0xff)
LB_176:
 mov rsi,0x0000_ffff_ffff_ffff 
 and rsi,QWORD [rax]
 lea rdi,[rax+8]
 C_CALL fw 
LB_177:
	mov GLX(0x101),LB_178
	MOV_RBX rax,GLX(0x101)
LB_179:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_180:
	MOV_RBX GLX(0x0),GLX(0xff)
 ret 
LB_184: ;; #0x◂◂(_none◂{}) 259'◂260'' ⊢ .. : ((.p23◂(_lst◂(_r64◂)))→(.p23◂(_lst◂(_r64◂))))
JMP_184:
	MOV_RBX rdi,GLX(0x103)
	jmp QWORD [LB_188+8*rdi]
LB_188: dq LB_186,LB_187
LB_186:
	MOV_RBX rdi,GLX(0x104)
	push SRC_REG 
	mov SRC_REG,rdi 
	add SRC_REG,8
	MOV_RDI GLX(0x105),SX(0x0)
	MOV_RDI GLX(0x106),SX(0x1)
	MOV_RDI GLX(0x107),SX(0x2)
	sub SRC_REG,8 
	mov rdi,SRC_REG  
	pop SRC_REG 
	FREE_RCD 4,rdi
	mov GLX(0x108),LB_189
	MOV_RBX rax,GLX(0x108)
LB_190:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_191:
	mov GLX(0x109),LB_154
	MOV_RBX rax,GLX(0x109)
LB_192:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_193:
	mov GLX(0x10a),LB_157
	MOV_RBX rax,GLX(0x10a)
LB_194:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_195:
	push EXH_196
	MOV_RBX GLX(0x89),GLX(0x105)
	call LB_25
	add rsp,8
	mov GLX(0x10b),LB_157
	MOV_RBX rax,GLX(0x10b)
LB_197:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_198:
	lea rsp,[rsp-(8*0x1)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0x0)
	push EXH_199
	MOV_RBX GLX(0x103),GLX(0x106)
	MOV_RBX GLX(0x104),GLX(0x107)
	call LB_184
	add rsp,8
	MOV_RDI GLX(0x10c),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	mov GLX(0x10d),LB_200
	MOV_RBX rax,GLX(0x10d)
LB_201:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_202:
	mov GLX(0x10e),0x0
	ALC_RCD 4,rax
	MOV_RBX GLX(0x10f),rax
	lea DST_REG,[rax+8]
	MOV_RDI DX(0x0),GLX(0x10c)
	MOV_RDI DX(0x1),GLX(0x0)
	MOV_RDI DX(0x2),GLX(0x1)
	MOV_RBX GLX(0x0),GLX(0x10e)
	MOV_RBX GLX(0x1),GLX(0x10f)
 ret 
LB_187:
	mov GLX(0x110),LB_203
	MOV_RBX rax,GLX(0x110)
LB_204:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_205:
	mov GLX(0x111),LB_154
	MOV_RBX rax,GLX(0x111)
LB_206:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_207:
	mov GLX(0x112),LB_200
	MOV_RBX rax,GLX(0x112)
LB_208:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_209:
	mov GLX(0x113),0x1
	MOV_RBX GLX(0x0),GLX(0x113)
 ret 
LB_185:
EXH_196:
	add rsp,0x8
	pop rax
	jmp rax
EXH_199:
	add rsp,0x8
	pop rax
	jmp rax
LB_213: ;; #0x◂◂(_none◂{}) 278'◂279'' ⊢ .. : ((.p23◂(_opn◂{ (_r64◂) {  }  }))→(.p23◂(_opn◂{ (_r64◂) {  }  })))
JMP_213:
	MOV_RBX rdi,GLX(0x116)
	jmp QWORD [LB_217+8*rdi]
LB_217: dq LB_215,LB_216
LB_215:
	mov GLX(0x118),LB_218
	MOV_RBX rax,GLX(0x118)
LB_219:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_220:
	mov GLX(0x119),LB_154
	MOV_RBX rax,GLX(0x119)
LB_221:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_222:
	mov GLX(0x11a),LB_157
	MOV_RBX rax,GLX(0x11a)
LB_223:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_224:
	push EXH_225
	MOV_RBX GLX(0x89),GLX(0x117)
	call LB_25
	add rsp,8
	mov GLX(0x11b),LB_157
	MOV_RBX rax,GLX(0x11b)
LB_226:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_227:
	mov GLX(0x11c),LB_154
	MOV_RBX rax,GLX(0x11c)
LB_228:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_229:
	mov GLX(0x11d),LB_200
	MOV_RBX rax,GLX(0x11d)
LB_230:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_231:
	mov GLX(0x11e),LB_200
	MOV_RBX rax,GLX(0x11e)
LB_232:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_233:
	mov GLX(0x11f),LB_234
	MOV_RBX rax,GLX(0x11f)
LB_235:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_236:
	mov GLX(0x120),0x0
	sub rsp,8
	mov DST_REG,rsp
	MOV_RDI DX(0x0),GLX(0x0)
	pop rax
	MOV_RBX GLX(0x121),rax
	MOV_RBX GLX(0x0),GLX(0x120)
	MOV_RBX GLX(0x1),GLX(0x121)
 ret 
LB_216:
	mov GLX(0x122),LB_63
	MOV_RBX rax,GLX(0x122)
LB_237:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_238:
	mov GLX(0x123),0x1
	MOV_RBX GLX(0x0),GLX(0x123)
 ret 
LB_214:
EXH_225:
	add rsp,0x8
	pop rax
	jmp rax
LB_165: ;; #0x◂◂(_none◂{}) { { 245'(=  ) 246'(=  ) } 247'(=  ) } ⊢ .. : ({ { (_arr◂{ (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  }◂{  }) (_r64◂)  } (_r64◂)  }→(_arr◂{ (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  }◂{  }))
JMP_165:
	MOV_RBX rdi,GLX(0xf7)
	MOV_RBX rax,GLX(0xf6)
	cmp rax,rdi
	jz LB_167
	MOV_RBX rax,GLX(0xf5)
	MOV_RBX rdi,GLX(0xf7)
	mov rsi,0x0000_ffff_ffff_ffff 
 mov rdx,QWORD [rax] 
	and rsi,rdx 
	cmp rdi,rsi 
	jge err_alc_o				
	lea rdi,[rdi+4*rdi]
	lea SRC_REG,[rax+8+8*rdi]
	MOV_RDI GLX(0xf8),SX(0x0)
	MOV_RDI GLX(0xf9),SX(0x1)
	MOV_RDI GLX(0xfa),SX(0x2)
	MOV_RDI GLX(0xfb),SX(0x3)
	MOV_RDI GLX(0xfc),SX(0x4)
	mov GLX(0xfd),LB_154
	MOV_RBX rax,GLX(0xfd)
LB_168:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_169:
	mov GLX(0xfe),LB_157
	MOV_RBX rax,GLX(0xfe)
LB_170:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_171:
	push EXH_181
	MOV_RBX GLX(0xff),GLX(0xf8)
	call LB_172
	add rsp,8
	mov GLX(0x102),LB_157
	MOV_RBX rax,GLX(0x102)
LB_182:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_183:
	lea rsp,[rsp-(8*0x6)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0xfb)
	MOV_RDI QWORD [rsp+8*0x1],GLX(0xfc)
	MOV_RDI QWORD [rsp+8*0x2],GLX(0x0)
	MOV_RDI QWORD [rsp+8*0x3],GLX(0xf7)
	MOV_RDI QWORD [rsp+8*0x4],GLX(0xf5)
	MOV_RDI QWORD [rsp+8*0x5],GLX(0xf6)
	push EXH_210
	MOV_RBX GLX(0x103),GLX(0xf9)
	MOV_RBX GLX(0x104),GLX(0xfa)
	call LB_184
	add rsp,8
	MOV_RDI GLX(0xf6),QWORD [rsp+8*0x5]
	MOV_RDI GLX(0xf5),QWORD [rsp+8*0x4]
	MOV_RDI GLX(0xf7),QWORD [rsp+8*0x3]
	MOV_RDI GLX(0x114),QWORD [rsp+8*0x2]
	MOV_RDI GLX(0xfc),QWORD [rsp+8*0x1]
	MOV_RDI GLX(0xfb),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x6)]
	mov GLX(0x115),LB_157
	MOV_RBX rax,GLX(0x115)
LB_211:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_212:
	MOV_RBX GLX(0x124),GLX(0x0)
	MOV_RBX GLX(0x125),GLX(0x1)
	push EXH_239
	MOV_RBX GLX(0x116),GLX(0xfb)
	MOV_RBX GLX(0x117),GLX(0xfc)
	call LB_213
	add rsp,8
	mov GLX(0x126),LB_200
	MOV_RBX rax,GLX(0x126)
LB_240:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_241:
	mov GLX(0x127),LB_157
	MOV_RBX rax,GLX(0x127)
LB_242:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_243:
	MOV_RBX rax,GLX(0xf5)
	MOV_RBX rdi,GLX(0xf7)
	lea rdi,[rdi+4*rdi]
	lea DST_REG,[rax+8+8*rdi]
	MOV_RDI DX(0x0),GLX(0x114)
	MOV_RDI DX(0x1),GLX(0x124)
	MOV_RDI DX(0x2),GLX(0x125)
	MOV_RDI DX(0x3),GLX(0x0)
	MOV_RDI DX(0x4),GLX(0x1)
	MOV_RBX rax,GLX(0xf7)
LB_244:
 add rax,1 
LB_245:
	MOV_RBX GLX(0xf7),rax
	jmp JMP_165
LB_167:
	mov GLX(0x128),LB_247
	MOV_RBX rax,GLX(0x128)
LB_248:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_249:
	MOV_RBX GLX(0x0),GLX(0xf5)
 ret 
LB_166:
EXH_181:
	add rsp,0x8
	pop rax
	jmp rax
EXH_210:
	add rsp,0x8
	pop rax
	jmp rax
EXH_239:
	add rsp,0x8
	pop rax
	jmp rax
LB_269: ;; #0x◂◂(_none◂{}) { { { } 309'(=  ) } 310'(=  ) } ⊢ .. : ({ { (.p19◂(_arr◂{ (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  }◂{  })) (_r64◂)  } (_r64◂)  }→{  })
JMP_269:
	MOV_RBX rdi,GLX(0x136)
	cmp rdi,0x0
	jz LB_271
	MOV_RBX rax,GLX(0x135)
	push SRC_REG 
	mov SRC_REG,rax
	add rax,(8*0x5)
	MOV_RBX GLX(0x135),rax
	MOV_RDI GLX(0x137),SX(0x0)
	MOV_RDI GLX(0x138),SX(0x1)
	MOV_RDI GLX(0x139),SX(0x2)
	MOV_RDI GLX(0x13a),SX(0x3)
	MOV_RDI GLX(0x13b),SX(0x4)
	pop SRC_REG
	MOV_RBX rax,GLX(0x137)
LB_272:
 mov rdi,rax
 call free_opq
LB_273:
	push EXH_274
	MOV_RBX GLX(0xd1),GLX(0x138)
	MOV_RBX GLX(0xd2),GLX(0x139)
	call LB_117
	add rsp,8
	push EXH_275
	MOV_RBX GLX(0xd9),GLX(0x13a)
	MOV_RBX GLX(0xda),GLX(0x13b)
	call LB_124
	add rsp,8
	MOV_RBX rax,GLX(0x136)
LB_276:
 sub rax,1 
LB_277:
	MOV_RBX GLX(0x136),rax
	jmp JMP_269
LB_271:
 ret 
LB_270:
EXH_274:
	add rsp,0x8
	pop rax
	jmp rax
EXH_275:
	add rsp,0x8
	pop rax
	jmp rax
LB_262: ;; #0x◂◂(_none◂{}) 306'(=  ) ⊢ .. : ((_arr◂{ (_arr◂(_r8◂)◂{  }) (.p23◂(_lst◂(_r64◂))) (.p23◂(_opn◂{ (_r64◂) {  }  }))  }◂{  })→{  })
JMP_262:
	MOV_RBX rax,GLX(0x132)
LB_263:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_264:
	MOV_RBX GLX(0x133),rdi
	MOV_RBX rax,GLX(0x132)
LB_265:
	mov rdi,rax
LB_266:
	MOV_RBX GLX(0x134),rdi
	MOV_RBX rax,GLX(0x134)
LB_267:
	mov rdi,0x8
	add rax,rdi
LB_268:
	MOV_RBX GLX(0x134),rax
	lea rsp,[rsp-(8*0x1)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0x132)
	push EXH_279
	MOV_RBX GLX(0x135),GLX(0x134)
	MOV_RBX GLX(0x136),GLX(0x133)
	call LB_269
	add rsp,8
	MOV_RDI GLX(0x132),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x1)]
	MOV_RBX rax,GLX(0x132)
LB_280:
 mov rdi,rax
 call free_opq
LB_281:
 ret 
EXH_279:
	add rsp,0x8
	pop rax
	jmp rax
LB_0: ;; #0x◂◂(_none◂{}) 128'(=  ) ⊢ .. : ((_arr◂(_arr◂(_r8◂)◂{  })◂{  })→{  })
JMP_0:
	push EXH_19
	MOV_RBX GLX(0x81),GLX(0x80)
	call LB_1
	add rsp,8
	mov rbx,0x3
	MOV_RBX GLX(0x87),rbx
	MOV_RBX rax,GLX(0x87)
LB_20:
	mov rdi,0x0
	imul rax,rdi
LB_21:
	MOV_RBX GLX(0x87),rax
	mov GLX(0x88),LB_22
	MOV_RBX rax,GLX(0x88)
LB_23:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_24:
	push EXH_31
	MOV_RBX GLX(0x89),GLX(0x87)
	call LB_25
	add rsp,8
	mov GLX(0x8b),LB_32
	MOV_RBX rax,GLX(0x8b)
LB_33:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_34:
	mov rbx,0x3
	MOV_RBX GLX(0x8c),rbx
	MOV_RBX rax,GLX(0x8c)
LB_35:
	mov rdi,0x1
	imul rax,rdi
LB_36:
	MOV_RBX GLX(0x8c),rax
	mov GLX(0x8d),LB_22
	MOV_RBX rax,GLX(0x8d)
LB_37:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_38:
	push EXH_39
	MOV_RBX GLX(0x89),GLX(0x8c)
	call LB_25
	add rsp,8
	mov GLX(0x8e),LB_32
	MOV_RBX rax,GLX(0x8e)
LB_40:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_41:
	mov rbx,0x3
	MOV_RBX GLX(0x8f),rbx
	MOV_RBX rax,GLX(0x8f)
LB_42:
	mov rdi,0x2
	imul rax,rdi
LB_43:
	MOV_RBX GLX(0x8f),rax
	mov GLX(0x90),LB_22
	MOV_RBX rax,GLX(0x90)
LB_44:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_45:
	push EXH_46
	MOV_RBX GLX(0x89),GLX(0x8f)
	call LB_25
	add rsp,8
	mov GLX(0x91),LB_32
	MOV_RBX rax,GLX(0x91)
LB_47:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_48:
	mov rbx,0x3
	MOV_RBX GLX(0x92),rbx
	MOV_RBX rax,GLX(0x92)
LB_49:
	mov rdi,0x3
	imul rax,rdi
LB_50:
	MOV_RBX GLX(0x92),rax
	mov GLX(0x93),LB_22
	MOV_RBX rax,GLX(0x93)
LB_51:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_52:
	push EXH_53
	MOV_RBX GLX(0x89),GLX(0x92)
	call LB_25
	add rsp,8
	mov GLX(0x94),LB_32
	MOV_RBX rax,GLX(0x94)
LB_54:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_55:
	mov GLX(0x95),LB_22
	MOV_RBX rax,GLX(0x95)
LB_56:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_57:
	push EXH_66
	mov GLX(0x9a),0x1
	MOV_RBX GLX(0x96),GLX(0x9a)
	call LB_58
	add rsp,8
	mov GLX(0x9b),LB_32
	MOV_RBX rax,GLX(0x9b)
LB_67:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_68:
	push EXH_74
	MOV_RBX GLX(0x9c),GLX(0x0)
	MOV_RBX GLX(0x9d),GLX(0x1)
	call LB_69
	add rsp,8
	push EXH_114
	mov rax,0xc
	MOV_RBX GLX(0xcb),rax
	mov rsi,1  
	mov rdi,0x10
	xor rax,rax 
	CALLOC_SF
	mov QWORD [rax],0x5
	lea rdi,[rax+8]
	mov BYTE [rdi],0x33
	add rdi,1 
	mov BYTE [rdi],0x33
	add rdi,1 
	mov BYTE [rdi],0x72
	add rdi,1 
	mov BYTE [rdi],0x33
	add rdi,1 
	mov BYTE [rdi],0x72
	add rdi,1 
	MOV_RBX GLX(0xcc),rax
	mov GLX(0xcd),0x0
	ALC_RCD 4,rax
	MOV_RBX GLX(0xce),rax
	lea DST_REG,[rax+8]
	mov rax,0x4
	mov DX(0x0),rax
	mov DX(0x1),0x0
	ALC_RCD 4,rax
	mov DX(0x2),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	mov rax,0x5
	mov DX(0x0),rax
	mov DX(0x1),0x0
	ALC_RCD 4,rax
	mov DX(0x2),rax
	push DST_REG 
	lea DST_REG,[rax+8]
	mov rax,0x6
	mov DX(0x0),rax
	mov DX(0x1),0x1
	pop DST_REG
	pop DST_REG
	mov GLX(0xcf),0x0
	sub rsp,8
	mov DST_REG,rsp
	mov rax,0x3
	mov DX(0x0),rax
	pop rax
	MOV_RBX GLX(0xd0),rax
	MOV_RBX GLX(0x9e),GLX(0xcb)
	MOV_RBX GLX(0x9f),GLX(0xcc)
	MOV_RBX GLX(0xa0),GLX(0xcd)
	MOV_RBX GLX(0xa1),GLX(0xce)
	MOV_RBX GLX(0xa2),GLX(0xcf)
	MOV_RBX GLX(0xa3),GLX(0xd0)
	call LB_75
	add rsp,8
	MOV_RBX rax,GLX(0x1)
LB_115:
 mov rdi,rax
 call free_opq
LB_116:
	lea rsp,[rsp-(8*0x3)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0x4)
	MOV_RDI QWORD [rsp+8*0x1],GLX(0x5)
	MOV_RDI QWORD [rsp+8*0x2],GLX(0x6)
	push EXH_123
	MOV_RBX GLX(0xd1),GLX(0x2)
	MOV_RBX GLX(0xd2),GLX(0x3)
	call LB_117
	add rsp,8
	MOV_RDI GLX(0xd8),QWORD [rsp+8*0x2]
	MOV_RDI GLX(0xd7),QWORD [rsp+8*0x1]
	MOV_RDI GLX(0xd6),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x3)]
	push EXH_129
	MOV_RBX GLX(0xd9),GLX(0xd6)
	MOV_RBX GLX(0xda),GLX(0xd7)
	call LB_124
	add rsp,8
	push EXH_149
	MOV_RBX GLX(0xdb),GLX(0xd8)
	call LB_130
	add rsp,8
	MOV_RBX GLX(0xee),GLX(0x1)
	push EXH_150
	MOV_RBX GLX(0xdb),GLX(0x0)
	call LB_130
	add rsp,8
	MOV_RBX GLX(0xef),GLX(0x1)
	push EXH_151
	MOV_RBX GLX(0xdb),GLX(0x0)
	call LB_130
	add rsp,8
	mov GLX(0xf0),LB_22
	MOV_RBX rax,GLX(0xf0)
LB_152:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_153:
	mov GLX(0xf1),LB_154
	MOV_RBX rax,GLX(0xf1)
LB_155:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_156:
	mov GLX(0xf2),LB_157
	MOV_RBX rax,GLX(0xf2)
LB_158:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_159:
	MOV_RBX rax,GLX(0x0)
LB_160:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_161:
	MOV_RBX GLX(0xf3),rdi
	mov GLX(0xf4),LB_162
	MOV_RBX rax,GLX(0xf4)
LB_163:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_164:
	lea rsp,[rsp-(8*0x3)]
	MOV_RDI QWORD [rsp+8*0x0],GLX(0xee)
	MOV_RDI QWORD [rsp+8*0x1],GLX(0xef)
	MOV_RDI QWORD [rsp+8*0x2],GLX(0x1)
	push EXH_250
	mov rax,0x0
	MOV_RBX GLX(0x12a),rax
	MOV_RBX GLX(0xf5),GLX(0x0)
	MOV_RBX GLX(0xf6),GLX(0xf3)
	MOV_RBX GLX(0xf7),GLX(0x12a)
	call LB_165
	add rsp,8
	MOV_RDI GLX(0x129),QWORD [rsp+8*0x2]
	MOV_RDI GLX(0xef),QWORD [rsp+8*0x1]
	MOV_RDI GLX(0xee),QWORD [rsp+8*0x0]
	lea rsp,[rsp+(8*0x3)]
	mov GLX(0x12b),LB_157
	MOV_RBX rax,GLX(0x12b)
LB_251:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_252:
	MOV_RBX rax,GLX(0xee)
LB_253:
 mov rdi,0x0000_ffff_ffff_ffff 
 and rdi,QWORD [rax]
LB_254:
	MOV_RBX GLX(0x12c),rdi
	mov GLX(0x12d),LB_162
	MOV_RBX rax,GLX(0x12d)
LB_255:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_256:
	MOV_RBX GLX(0x12e),GLX(0x0)
	push EXH_257
	mov rax,0x0
	MOV_RBX GLX(0x12f),rax
	MOV_RBX GLX(0xf5),GLX(0xee)
	MOV_RBX GLX(0xf6),GLX(0x12c)
	MOV_RBX GLX(0xf7),GLX(0x12f)
	call LB_165
	add rsp,8
	mov GLX(0x130),LB_200
	MOV_RBX rax,GLX(0x130)
LB_258:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_259:
	mov GLX(0x131),LB_32
	MOV_RBX rax,GLX(0x131)
LB_260:
 mov rdi,rax 
 mov rsi,QWORD [rax-8]
 C_CALL fw 
LB_261:
	MOV_RBX GLX(0x13c),GLX(0x0)
	push EXH_282
	MOV_RBX GLX(0x132),GLX(0x12e)
	call LB_262
	add rsp,8
	push EXH_283
	MOV_RBX GLX(0x132),GLX(0x13c)
	call LB_262
	add rsp,8
	push EXH_284
	MOV_RBX GLX(0x132),GLX(0xef)
	call LB_262
	add rsp,8
	push EXH_285
	MOV_RBX GLX(0x132),GLX(0x129)
	call LB_262
	add rsp,8
 ret 
EXH_19:
	add rsp,0x8
	pop rax
	jmp rax
EXH_31:
	add rsp,0x8
	pop rax
	jmp rax
EXH_39:
	add rsp,0x8
	pop rax
	jmp rax
EXH_46:
	add rsp,0x8
	pop rax
	jmp rax
EXH_53:
	add rsp,0x8
	pop rax
	jmp rax
EXH_66:
	add rsp,0x8
	pop rax
	jmp rax
EXH_74:
	add rsp,0x8
	pop rax
	jmp rax
EXH_114:
	add rsp,0x8
	pop rax
	jmp rax
EXH_123:
	add rsp,0x8
	pop rax
	jmp rax
EXH_129:
	add rsp,0x8
	pop rax
	jmp rax
EXH_149:
	add rsp,0x8
	pop rax
	jmp rax
EXH_150:
	add rsp,0x8
	pop rax
	jmp rax
EXH_151:
	add rsp,0x8
	pop rax
	jmp rax
EXH_250:
	add rsp,0x8
	pop rax
	jmp rax
EXH_257:
	add rsp,0x8
	pop rax
	jmp rax
EXH_282:
	add rsp,0x8
	pop rax
	jmp rax
EXH_283:
	add rsp,0x8
	pop rax
	jmp rax
EXH_284:
	add rsp,0x8
	pop rax
	jmp rax
EXH_285:
	add rsp,0x8
	pop rax
	jmp rax
RTM_0:
	push EXH_286
	MOV_RBX GLX(0x80),GLX(0x7f)
	call LB_0
	add rsp,8
	mov QWORD [EXIT],1
	C_CALL exit
EXH_286:
	add rsp,0x8
	pop rax
	jmp rax
	sig_alc_rcd_1:
	mov rbx,0x1
	jmp sig_alc_rcd
	sig_alc_rcd_2:
	mov rbx,0x2
	jmp sig_alc_rcd
	sig_alc_rcd_3:
	mov rbx,0x3
	jmp sig_alc_rcd
	sig_alc_rcd_4:
	mov rbx,0x4
	jmp sig_alc_rcd
	sig_alc_rcd_5:
	mov rbx,0x5
	jmp sig_alc_rcd
	sig_alc_rcd_6:
	mov rbx,0x6
	jmp sig_alc_rcd
	sig_alc_rcd_7:
	mov rbx,0x7
	jmp sig_alc_rcd
	sig_alc_rcd_8:
	mov rbx,0x8
	jmp sig_alc_rcd
	sig_alc_rcd_9:
	mov rbx,0x9
	jmp sig_alc_rcd
	sig_alc_rcd_10:
	mov rbx,0xa
	jmp sig_alc_rcd
	sig_alc_rcd_11:
	mov rbx,0xb
	jmp sig_alc_rcd
	sig_alc_rcd_12:
	mov rbx,0xc
	jmp sig_alc_rcd
	sig_alc_rcd_13:
	mov rbx,0xd
	jmp sig_alc_rcd
	sig_alc_rcd_14:
	mov rbx,0xe
	jmp sig_alc_rcd
	sig_alc_rcd_15:
	mov rbx,0xf
	jmp sig_alc_rcd
	sig_alc_rcd_16:
	mov rbx,0x10
	jmp sig_alc_rcd
	sig_alc_rcd_17:
	mov rbx,0x11
	jmp sig_alc_rcd
	sig_alc_rcd_18:
	mov rbx,0x12
	jmp sig_alc_rcd
	sig_alc_rcd_19:
	mov rbx,0x13
	jmp sig_alc_rcd
	sig_alc_rcd_20:
	mov rbx,0x14
	jmp sig_alc_rcd
	sig_alc_rcd_21:
	mov rbx,0x15
	jmp sig_alc_rcd
	sig_alc_rcd_22:
	mov rbx,0x16
	jmp sig_alc_rcd
	sig_alc_rcd_23:
	mov rbx,0x17
	jmp sig_alc_rcd
	sig_alc_rcd_24:
	mov rbx,0x18
	jmp sig_alc_rcd
	sig_alc_rcd_25:
	mov rbx,0x19
	jmp sig_alc_rcd
	sig_alc_rcd_26:
	mov rbx,0x1a
	jmp sig_alc_rcd
	sig_alc_rcd_27:
	mov rbx,0x1b
	jmp sig_alc_rcd
	sig_alc_rcd_28:
	mov rbx,0x1c
	jmp sig_alc_rcd
	sig_alc_rcd_29:
	mov rbx,0x1d
	jmp sig_alc_rcd
	sig_alc_rcd_30:
	mov rbx,0x1e
	jmp sig_alc_rcd
	sig_alc_rcd_31:
	mov rbx,0x1f
	jmp sig_alc_rcd
	sig_alc_rcd_32:
	mov rbx,0x20
	jmp sig_alc_rcd
	sig_alc_rcd_33:
	mov rbx,0x21
	jmp sig_alc_rcd
	sig_alc_rcd_34:
	mov rbx,0x22
	jmp sig_alc_rcd
	sig_alc_rcd_35:
	mov rbx,0x23
	jmp sig_alc_rcd
	sig_alc_rcd_36:
	mov rbx,0x24
	jmp sig_alc_rcd
	sig_alc_rcd_37:
	mov rbx,0x25
	jmp sig_alc_rcd
	sig_alc_rcd_38:
	mov rbx,0x26
	jmp sig_alc_rcd
	sig_alc_rcd_39:
	mov rbx,0x27
	jmp sig_alc_rcd
	sig_alc_rcd_40:
	mov rbx,0x28
	jmp sig_alc_rcd
	sig_alc_rcd_41:
	mov rbx,0x29
	jmp sig_alc_rcd
	sig_alc_rcd_42:
	mov rbx,0x2a
	jmp sig_alc_rcd
	sig_alc_rcd_43:
	mov rbx,0x2b
	jmp sig_alc_rcd
	sig_alc_rcd_44:
	mov rbx,0x2c
	jmp sig_alc_rcd
	sig_alc_rcd_45:
	mov rbx,0x2d
	jmp sig_alc_rcd
	sig_alc_rcd_46:
	mov rbx,0x2e
	jmp sig_alc_rcd
	sig_alc_rcd_47:
	mov rbx,0x2f
	jmp sig_alc_rcd
	sig_alc_rcd_48:
	mov rbx,0x30
	jmp sig_alc_rcd
	sig_alc_rcd_49:
	mov rbx,0x31
	jmp sig_alc_rcd
	sig_alc_rcd_50:
	mov rbx,0x32
	jmp sig_alc_rcd
	sig_alc_rcd_51:
	mov rbx,0x33
	jmp sig_alc_rcd
	sig_alc_rcd_52:
	mov rbx,0x34
	jmp sig_alc_rcd
	sig_alc_rcd_53:
	mov rbx,0x35
	jmp sig_alc_rcd
	sig_alc_rcd_54:
	mov rbx,0x36
	jmp sig_alc_rcd
	sig_alc_rcd_55:
	mov rbx,0x37
	jmp sig_alc_rcd
	sig_alc_rcd_56:
	mov rbx,0x38
	jmp sig_alc_rcd
	sig_alc_rcd_57:
	mov rbx,0x39
	jmp sig_alc_rcd
	sig_alc_rcd_58:
	mov rbx,0x3a
	jmp sig_alc_rcd
	sig_alc_rcd_59:
	mov rbx,0x3b
	jmp sig_alc_rcd
	sig_alc_rcd_60:
	mov rbx,0x3c
	jmp sig_alc_rcd
	sig_alc_rcd_61:
	mov rbx,0x3d
	jmp sig_alc_rcd
	sig_alc_rcd_62:
	mov rbx,0x3e
	jmp sig_alc_rcd
	sig_alc_rcd_63:
	mov rbx,0x3f
	jmp sig_alc_rcd

%include "TEXT.s"
