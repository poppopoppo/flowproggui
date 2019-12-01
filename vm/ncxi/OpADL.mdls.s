%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call in0_init
	call NS_E_83
	call NS_E_921
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_16: dq 0
NS_E_16:
NS_E_RDI_16:
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
NS_E_45:
NS_E_RDI_45:
NS_E_45_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_46
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_46:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_47:
NS_E_RDI_47:
NS_E_47_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_47_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_47_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_48:
NS_E_RDI_48:
NS_E_48_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_48_LB_0
	cmp r11,57
	ja NS_E_48_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_48_LB_0:
	mov rax,0
	ret
NS_E_50:
NS_E_RDI_50:
NS_E_50_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_50_LB_0
	cmp r11,122
	ja NS_E_50_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_50_LB_0:
	mov rax,0
	ret
NS_E_49:
NS_E_RDI_49:
NS_E_49_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_49_LB_0
	cmp r11,90
	ja NS_E_49_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_49_LB_0:
	mov rax,0
	ret
NS_E_19:
NS_E_RDI_19:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_23:
	mov rdi,r8
	bt r12,0
NS_E_RDI_23:
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
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_51:
NS_E_RDI_51:
NS_E_51_ETR_TBL:
NS_E_51_TBL:
	push r14
; "J"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,74
	jz LB_66
	jmp NS_E_51_MTC_0_failed
LB_66:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	push r13
	push r14
	push LB_57
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_61
	btr r12,0
	jmp LB_62
LB_61:
	bts r12,0
LB_62:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov r13,rax
; _emt_mov_ptn_to_ptn { 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_53 : %_53
 ; {>  %_52~{  }:{ } }
; _none {  } ⊢ 0'◂{  }
	mov r13,1
	bts r12,0
; ∎ %_53
 ; {>  %_53~0'◂{  }:(_opn)◂(t8'(0)) %_52~{  }:{ } }
; 	∎ 0'◂{  }
; _emt_mov_ptn_to_ptn 0'◂{  } ⊢ 2'◂3'
	mov r15,r13
	bt r12,0
	jc LB_55
	btr r12,2
	jmp LB_56
LB_55:
	bts r12,2
LB_56:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,3
	ret
LB_57:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r15,0
	jz LB_59
	pop r14
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp LB_58
LB_59:
	add rsp,8
	ret
NS_E_51_MTC_0_failed:
	pop r14
LB_58:
	push r14
	push r13
	push r14
	push LB_71
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
; _none {  } ⊢ %_54 : %_54
 ; {>  }
; _none {  } ⊢ 0'◂{  }
	mov r13,1
	bts r12,0
; ∎ %_54
 ; {>  %_54~0'◂{  }:(_opn)◂(t11'(0)) }
; 	∎ 0'◂{  }
; _emt_mov_ptn_to_ptn 0'◂{  } ⊢ 2'◂3'
	mov r15,r13
	bt r12,0
	jc LB_69
	btr r12,2
	jmp LB_70
LB_69:
	bts r12,2
LB_70:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,3
	ret
LB_71:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r15,0
	jz LB_73
	pop r14
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp LB_72
LB_73:
	add rsp,8
	ret
NS_E_51_MTC_1_failed:
	pop r14
LB_72:
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_83:
NS_E_RDI_83:
; » _^ ..
	mov rax,2
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "JJ"
	mov rsi,0x_00_00_00_00_00_00_4a_4a
	mov QWORD [rdi+8*0],rsi
	add rdi,2
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_76 : %_76
 ; {>  %_75~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_76
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f51 { %_75 %_76 } ⊢ { %_77 %_78 %_79 } : { %_77 %_78 %_79 }
 ; {>  %_76~1':_r64 %_75~0':_stg }
; _f51 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 0' 1' }
	call NS_E_51
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r9,r15
	bt r12,2
	jc LB_84
	btr r12,4
	jmp LB_85
LB_84:
	bts r12,4
LB_85:
	mov r15,r8
	bt r12,3
	jc LB_88
	btr r12,2
	jmp LB_89
LB_88:
	bts r12,2
LB_89:
	mov rsi,0
	bt r12,2
	jc LB_86
	bts rsi,17
	bt r15,0
	jc LB_86
	jmp LB_87
LB_86:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r15
	mov r15,rax
	btr r12,2
LB_87:
	mov rax,r9
	shl rax,56
	or rax,1
	mov rdi,rax
	or r15,rdi
; pop_iv
	add rsp,8
; _f16 { %_77 %_78 %_79 } ⊢ { %_80 %_81 %_82 } : { %_80 %_81 %_82 }
 ; {>  %_79~2':(_opn)◂(t22'(0)) %_77~0':_stg %_78~1':_r64 }
; _f16 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_90
	btr r12,3
	jmp LB_91
LB_90:
	bts r12,3
LB_91:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,3
	jc LB_94
	btr r12,4
	jmp LB_95
LB_94:
	bts r12,4
LB_95:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_92
	btr QWORD [rdi],0
	jmp LB_93
LB_92:
	bts QWORD [rdi],0
LB_93:
	mov r9,r14
	bt r12,1
	jc LB_98
	btr r12,4
	jmp LB_99
LB_98:
	bts r12,4
LB_99:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_96
	btr QWORD [rdi],1
	jmp LB_97
LB_96:
	bts QWORD [rdi],1
LB_97:
	mov r9,r15
	bt r12,2
	jc LB_102
	btr r12,4
	jmp LB_103
LB_102:
	bts r12,4
LB_103:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_100
	btr QWORD [rdi],2
	jmp LB_101
LB_100:
	bts QWORD [rdi],2
LB_101:
	call NS_E_16
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' 2' }
	mov r8,r13
	bt r12,0
	jc LB_104
	btr r12,3
	jmp LB_105
LB_104:
	bts r12,3
LB_105:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_108
	btr r12,4
	jmp LB_109
LB_108:
	bts r12,4
LB_109:
	mov r13,r9
	bt r12,4
	jc LB_106
	btr r12,0
	jmp LB_107
LB_106:
	bts r12,0
LB_107:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_112
	btr r12,4
	jmp LB_113
LB_112:
	bts r12,4
LB_113:
	mov r14,r9
	bt r12,4
	jc LB_110
	btr r12,1
	jmp LB_111
LB_110:
	bts r12,1
LB_111:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_116
	btr r12,4
	jmp LB_117
LB_116:
	bts r12,4
LB_117:
	mov r15,r9
	bt r12,4
	jc LB_114
	btr r12,2
	jmp LB_115
LB_114:
	bts r12,2
LB_115:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_80~0':_stg %_82~2':(_opn)◂(t27'(0)) %_81~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_118
	mov rdi,r13
	call dlt
LB_118:
	bt r12,2
	jc LB_119
	mov rdi,r15
	call dlt
LB_119:
	bt r12,1
	jc LB_120
	mov rdi,r14
	call dlt
LB_120:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_122:
NS_E_RDI_122:
NS_E_122_ETR_TBL:
NS_E_122_TBL:
; c0
	push r14
; glb_etr
	call NS_E_124_ETR_TBL
	cmp r15,0
	jz LB_211
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_122_MTC_0_failed
LB_211:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; glb_etr_lst
	call NS_E_122_ETR_TBL
	cmp r15,0
	jz LB_215
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_216
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_216:
	jmp NS_E_122_MTC_0_failed
LB_215:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_206
	btr QWORD [rdi],1
LB_206:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_207
	btr QWORD [rdi],0
LB_207:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_122_MTC_0_failed:
	pop r14
; c1
	push r14
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_122_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_124:
NS_E_RDI_124:
NS_E_124_ETR_TBL:
NS_E_124_TBL:
; c0
	push r14
; mdl_etr
	call NS_E_126_ETR_TBL
	cmp r15,0
	jz LB_240
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_124_MTC_0_failed
LB_240:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_236
	btr QWORD [rdi],0
LB_236:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_124_MTC_0_failed:
	pop r14
; c1
	push r14
; cst_etr
	call NS_E_128_ETR_TBL
	cmp r15,0
	jz LB_234
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_124_MTC_1_failed
LB_234:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_230
	btr QWORD [rdi],0
LB_230:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_124_MTC_1_failed:
	pop r14
; c2
	push r14
; op_etr
	call NS_E_130_ETR_TBL
	cmp r15,0
	jz LB_228
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_124_MTC_2_failed
LB_228:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_224
	btr QWORD [rdi],0
LB_224:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_124_MTC_2_failed:
	pop r14
; c3
	push r14
; dta_etr
	call NS_E_132_ETR_TBL
	cmp r15,0
	jz LB_222
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_124_MTC_3_failed
LB_222:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_218
	btr QWORD [rdi],0
LB_218:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_124_MTC_3_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_126:
NS_E_RDI_126:
NS_E_126_ETR_TBL:
NS_E_126_TBL:
; c0
	push r14
; "\194\167\194\167"
	jmp LB_285
LB_284:
	add r14,1
LB_285:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_284
	cmp rax,10
	jz LB_284
	cmp rax,32
	jz LB_284
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_287
	jmp NS_E_126_MTC_0_failed
LB_287:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_288
	jmp NS_E_126_MTC_0_failed
LB_288:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_289
	jmp NS_E_126_MTC_0_failed
LB_289:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_290
	jmp NS_E_126_MTC_0_failed
LB_290:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_297
LB_296:
	add r14,1
LB_297:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_296
	cmp rax,10
	jz LB_296
	cmp rax,32
	jz LB_296
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_298
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_299
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_299:
	jmp NS_E_126_MTC_0_failed
LB_298:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; glb_etr_lst
	jmp LB_302
LB_301:
	add r14,1
LB_302:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_301
	cmp rax,10
	jz LB_301
	cmp rax,32
	jz LB_301
	call NS_E_122_ETR_TBL
	cmp r15,0
	jz LB_303
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_304
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_304:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_305
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_305:
	jmp NS_E_126_MTC_0_failed
LB_303:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; "\226\136\142\226\136\142"
	jmp LB_308
LB_307:
	add r14,1
LB_308:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_307
	cmp rax,10
	jz LB_307
	cmp rax,32
	jz LB_307
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_310
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_337
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_337:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_338
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_338:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_339
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_339:
	jmp NS_E_126_MTC_0_failed
LB_310:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_311
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_333
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_333:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_334
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_334:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_335
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_335:
	jmp NS_E_126_MTC_0_failed
LB_311:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_312
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_329
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_329:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_330
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_330:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_331
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_331:
	jmp NS_E_126_MTC_0_failed
LB_312:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,226
	jz LB_313
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_325
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_325:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_326
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_326:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_327
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_327:
	jmp NS_E_126_MTC_0_failed
LB_313:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+4]
	cmp al,136
	jz LB_314
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_321
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_321:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_322
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_322:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_323
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_323:
	jmp NS_E_126_MTC_0_failed
LB_314:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+5]
	cmp al,142
	jz LB_315
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_317
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_317:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_318
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_318:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_319
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_319:
	jmp NS_E_126_MTC_0_failed
LB_315:
	add r14,6
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*3],0
	mov QWORD [prs_vct+8*1+16*3],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_279
	btr QWORD [rdi],3
LB_279:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_280
	btr QWORD [rdi],2
LB_280:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_281
	btr QWORD [rdi],1
LB_281:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_282
	btr QWORD [rdi],0
LB_282:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_126_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\167\194\167"
	jmp LB_248
LB_247:
	add r14,1
LB_248:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_247
	cmp rax,10
	jz LB_247
	cmp rax,32
	jz LB_247
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_250
	jmp NS_E_126_MTC_1_failed
LB_250:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_251
	jmp NS_E_126_MTC_1_failed
LB_251:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_252
	jmp NS_E_126_MTC_1_failed
LB_252:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_253
	jmp NS_E_126_MTC_1_failed
LB_253:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_260
LB_259:
	add r14,1
LB_260:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_259
	cmp rax,10
	jz LB_259
	cmp rax,32
	jz LB_259
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_261
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_262
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_262:
	jmp NS_E_126_MTC_1_failed
LB_261:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_265
LB_264:
	add r14,1
LB_265:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_264
	cmp rax,10
	jz LB_264
	cmp rax,32
	jz LB_264
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_267
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_269
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_269:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_270
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_270:
	jmp NS_E_126_MTC_1_failed
LB_267:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_273
LB_272:
	add r14,1
LB_273:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_272
	cmp rax,10
	jz LB_272
	cmp rax,32
	jz LB_272
	call NS_E_140_ETR_TBL
	cmp r15,0
	jz LB_274
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_275
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_275:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_276
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_276:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_277
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_277:
	jmp NS_E_126_MTC_1_failed
LB_274:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_242
	btr QWORD [rdi],3
LB_242:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_243
	btr QWORD [rdi],2
LB_243:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_244
	btr QWORD [rdi],1
LB_244:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_245
	btr QWORD [rdi],0
LB_245:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_126_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_128:
NS_E_RDI_128:
NS_E_128_ETR_TBL:
NS_E_128_TBL:
; c0
	push r14
; "\194\167"
	jmp LB_380
LB_379:
	add r14,1
LB_380:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_379
	cmp rax,10
	jz LB_379
	cmp rax,32
	jz LB_379
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_382
	jmp NS_E_128_MTC_0_failed
LB_382:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_383
	jmp NS_E_128_MTC_0_failed
LB_383:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_388
LB_387:
	add r14,1
LB_388:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_387
	cmp rax,10
	jz LB_387
	cmp rax,32
	jz LB_387
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_389
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_390
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_390:
	jmp NS_E_128_MTC_0_failed
LB_389:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\194\171"
	jmp LB_393
LB_392:
	add r14,1
LB_393:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_392
	cmp rax,10
	jz LB_392
	cmp rax,32
	jz LB_392
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_395
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_401
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_401:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_402
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_402:
	jmp NS_E_128_MTC_0_failed
LB_395:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,171
	jz LB_396
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_398
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_398:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_399
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_399:
	jmp NS_E_128_MTC_0_failed
LB_396:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; op_lines
	jmp LB_405
LB_404:
	add r14,1
LB_405:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_404
	cmp rax,10
	jz LB_404
	cmp rax,32
	jz LB_404
	call NS_E_146_ETR_TBL
	cmp r15,0
	jz LB_406
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_407
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_407:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_408
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_408:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_409
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_409:
	jmp NS_E_128_MTC_0_failed
LB_406:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_374
	btr QWORD [rdi],3
LB_374:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_375
	btr QWORD [rdi],2
LB_375:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_376
	btr QWORD [rdi],1
LB_376:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_377
	btr QWORD [rdi],0
LB_377:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_128_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\167"
	jmp LB_347
LB_346:
	add r14,1
LB_347:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_346
	cmp rax,10
	jz LB_346
	cmp rax,32
	jz LB_346
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_349
	jmp NS_E_128_MTC_1_failed
LB_349:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_350
	jmp NS_E_128_MTC_1_failed
LB_350:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_355
LB_354:
	add r14,1
LB_355:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_354
	cmp rax,10
	jz LB_354
	cmp rax,32
	jz LB_354
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_356
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_357
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_357:
	jmp NS_E_128_MTC_1_failed
LB_356:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_360
LB_359:
	add r14,1
LB_360:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_359
	cmp rax,10
	jz LB_359
	cmp rax,32
	jz LB_359
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_362
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_364
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_364:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_365
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_365:
	jmp NS_E_128_MTC_1_failed
LB_362:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; cst
	jmp LB_368
LB_367:
	add r14,1
LB_368:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_367
	cmp rax,10
	jz LB_367
	cmp rax,32
	jz LB_367
	call NS_E_134_ETR_TBL
	cmp r15,0
	jz LB_369
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_370
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_370:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_371
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_371:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_372
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_372:
	jmp NS_E_128_MTC_1_failed
LB_369:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_341
	btr QWORD [rdi],3
LB_341:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_342
	btr QWORD [rdi],2
LB_342:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_343
	btr QWORD [rdi],1
LB_343:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_344
	btr QWORD [rdi],0
LB_344:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_128_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_130:
NS_E_RDI_130:
NS_E_130_ETR_TBL:
NS_E_130_TBL:
; c0
	push r14
; "\194\167"
	jmp LB_450
LB_449:
	add r14,1
LB_450:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_449
	cmp rax,10
	jz LB_449
	cmp rax,32
	jz LB_449
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_452
	jmp NS_E_130_MTC_0_failed
LB_452:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_453
	jmp NS_E_130_MTC_0_failed
LB_453:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_458
LB_457:
	add r14,1
LB_458:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_457
	cmp rax,10
	jz LB_457
	cmp rax,32
	jz LB_457
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_459
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_460
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_460:
	jmp NS_E_130_MTC_0_failed
LB_459:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; reg_ptn
	jmp LB_463
LB_462:
	add r14,1
LB_463:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_462
	cmp rax,10
	jz LB_462
	cmp rax,32
	jz LB_462
	call NS_E_158_ETR_TBL
	cmp r15,0
	jz LB_464
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_465
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_465:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_466
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_466:
	jmp NS_E_130_MTC_0_failed
LB_464:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; op_lines
	jmp LB_469
LB_468:
	add r14,1
LB_469:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_468
	cmp rax,10
	jz LB_468
	cmp rax,32
	jz LB_468
	call NS_E_146_ETR_TBL
	cmp r15,0
	jz LB_470
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_471
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_471:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_472
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_472:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_473
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_473:
	jmp NS_E_130_MTC_0_failed
LB_470:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_444
	btr QWORD [rdi],3
LB_444:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_445
	btr QWORD [rdi],2
LB_445:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_446
	btr QWORD [rdi],1
LB_446:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_447
	btr QWORD [rdi],0
LB_447:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_130_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\167"
	jmp LB_417
LB_416:
	add r14,1
LB_417:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_416
	cmp rax,10
	jz LB_416
	cmp rax,32
	jz LB_416
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_419
	jmp NS_E_130_MTC_1_failed
LB_419:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_420
	jmp NS_E_130_MTC_1_failed
LB_420:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_425
LB_424:
	add r14,1
LB_425:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_424
	cmp rax,10
	jz LB_424
	cmp rax,32
	jz LB_424
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_426
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_427
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_427:
	jmp NS_E_130_MTC_1_failed
LB_426:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_430
LB_429:
	add r14,1
LB_430:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_429
	cmp rax,10
	jz LB_429
	cmp rax,32
	jz LB_429
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_432
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_434
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_434:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_435
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_435:
	jmp NS_E_130_MTC_1_failed
LB_432:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_438
LB_437:
	add r14,1
LB_438:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_437
	cmp rax,10
	jz LB_437
	cmp rax,32
	jz LB_437
	call NS_E_140_ETR_TBL
	cmp r15,0
	jz LB_439
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_440
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_440:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_441
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_441:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_442
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_442:
	jmp NS_E_130_MTC_1_failed
LB_439:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_411
	btr QWORD [rdi],3
LB_411:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_412
	btr QWORD [rdi],2
LB_412:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_413
	btr QWORD [rdi],1
LB_413:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_414
	btr QWORD [rdi],0
LB_414:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_130_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_132:
NS_E_RDI_132:
NS_E_132_ETR_TBL:
NS_E_132_TBL:
; c0
	push r14
; "\194\182"
	jmp LB_513
LB_512:
	add r14,1
LB_513:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_512
	cmp rax,10
	jz LB_512
	cmp rax,32
	jz LB_512
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_515
	jmp NS_E_132_MTC_0_failed
LB_515:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_516
	jmp NS_E_132_MTC_0_failed
LB_516:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_521
LB_520:
	add r14,1
LB_521:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_520
	cmp rax,10
	jz LB_520
	cmp rax,32
	jz LB_520
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_522
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_523
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_523:
	jmp NS_E_132_MTC_0_failed
LB_522:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; dta_def
	jmp LB_526
LB_525:
	add r14,1
LB_526:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_525
	cmp rax,10
	jz LB_525
	cmp rax,32
	jz LB_525
	call NS_E_142_ETR_TBL
	cmp r15,0
	jz LB_527
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_528
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_528:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_529
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_529:
	jmp NS_E_132_MTC_0_failed
LB_527:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_508
	btr QWORD [rdi],2
LB_508:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_509
	btr QWORD [rdi],1
LB_509:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_510
	btr QWORD [rdi],0
LB_510:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_132_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\182"
	jmp LB_481
LB_480:
	add r14,1
LB_481:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_480
	cmp rax,10
	jz LB_480
	cmp rax,32
	jz LB_480
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_483
	jmp NS_E_132_MTC_1_failed
LB_483:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_484
	jmp NS_E_132_MTC_1_failed
LB_484:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_489
LB_488:
	add r14,1
LB_489:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_488
	cmp rax,10
	jz LB_488
	cmp rax,32
	jz LB_488
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_490
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_491
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_491:
	jmp NS_E_132_MTC_1_failed
LB_490:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_494
LB_493:
	add r14,1
LB_494:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_493
	cmp rax,10
	jz LB_493
	cmp rax,32
	jz LB_493
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_496
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_498
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_498:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_499
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_499:
	jmp NS_E_132_MTC_1_failed
LB_496:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_502
LB_501:
	add r14,1
LB_502:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_501
	cmp rax,10
	jz LB_501
	cmp rax,32
	jz LB_501
	call NS_E_140_ETR_TBL
	cmp r15,0
	jz LB_503
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_504
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_504:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_505
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_505:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_506
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_506:
	jmp NS_E_132_MTC_1_failed
LB_503:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_475
	btr QWORD [rdi],3
LB_475:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_476
	btr QWORD [rdi],2
LB_476:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_477
	btr QWORD [rdi],1
LB_477:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_478
	btr QWORD [rdi],0
LB_478:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_132_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_134:
NS_E_RDI_134:
NS_E_134_ETR_TBL:
NS_E_134_TBL:
; c0
	push r14
; "0xr0"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,48
	jz LB_536
	jmp NS_E_134_MTC_0_failed
LB_536:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,120
	jz LB_537
	jmp NS_E_134_MTC_0_failed
LB_537:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,114
	jz LB_538
	jmp NS_E_134_MTC_0_failed
LB_538:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,48
	jz LB_539
	jmp NS_E_134_MTC_0_failed
LB_539:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_531
	btr QWORD [rdi],0
LB_531:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_134_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_136:
NS_E_RDI_136:
NS_E_136_ETR_TBL:
NS_E_136_TBL:
; c0
	push r14
; cha
	call NS_E_138_ETR_TBL
	cmp r15,0
	jz LB_551
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_136_MTC_0_failed
LB_551:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; word
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_555
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_556
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_556:
	jmp NS_E_136_MTC_0_failed
LB_555:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_546
	btr QWORD [rdi],1
LB_546:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_547
	btr QWORD [rdi],0
LB_547:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_136_MTC_0_failed:
	pop r14
; c1
	push r14
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_136_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_138:
NS_E_RDI_138:
NS_E_138_ETR_TBL:
NS_E_138_TBL:
; c0
	push r14
; "a"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,97
	jz LB_579
	jmp NS_E_138_MTC_0_failed
LB_579:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_574
	btr QWORD [rdi],0
LB_574:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_138_MTC_0_failed:
	pop r14
; c1
	push r14
; "b"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,98
	jz LB_571
	jmp NS_E_138_MTC_1_failed
LB_571:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_566
	btr QWORD [rdi],0
LB_566:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_138_MTC_1_failed:
	pop r14
; c2
	push r14
; "c"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,99
	jz LB_563
	jmp NS_E_138_MTC_2_failed
LB_563:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_558
	btr QWORD [rdi],0
LB_558:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_138_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_140:
NS_E_RDI_140:
NS_E_140_ETR_TBL:
NS_E_140_TBL:
; c0
	push r14
; word
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_594
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_140_MTC_0_failed
LB_594:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "."
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,46
	jz LB_599
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_601
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_601:
	jmp NS_E_140_MTC_0_failed
LB_599:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; name
	call NS_E_140_ETR_TBL
	cmp r15,0
	jz LB_605
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_606
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_606:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_607
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_607:
	jmp NS_E_140_MTC_0_failed
LB_605:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_588
	btr QWORD [rdi],2
LB_588:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_589
	btr QWORD [rdi],1
LB_589:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_590
	btr QWORD [rdi],0
LB_590:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_140_MTC_0_failed:
	pop r14
; c1
	push r14
; word
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_586
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_140_MTC_1_failed
LB_586:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_582
	btr QWORD [rdi],0
LB_582:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_140_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_142:
NS_E_RDI_142:
NS_E_142_ETR_TBL:
NS_E_142_TBL:
; c0
	push r14
; dta_def_coprd
	call NS_E_144_ETR_TBL
	cmp r15,0
	jz LB_613
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_142_MTC_0_failed
LB_613:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_609
	btr QWORD [rdi],0
LB_609:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_142_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_144:
NS_E_RDI_144:
NS_E_144_ETR_TBL:
NS_E_144_TBL:
; c0
	push r14
; "\226\136\144"
	jmp LB_656
LB_655:
	add r14,1
LB_656:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_655
	cmp rax,10
	jz LB_655
	cmp rax,32
	jz LB_655
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_658
	jmp NS_E_144_MTC_0_failed
LB_658:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_659
	jmp NS_E_144_MTC_0_failed
LB_659:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_660
	jmp NS_E_144_MTC_0_failed
LB_660:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_666
LB_665:
	add r14,1
LB_666:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_665
	cmp rax,10
	jz LB_665
	cmp rax,32
	jz LB_665
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_667
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_668
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_668:
	jmp NS_E_144_MTC_0_failed
LB_667:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_671
LB_670:
	add r14,1
LB_671:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_670
	cmp rax,10
	jz LB_670
	cmp rax,32
	jz LB_670
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_673
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_675
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_675:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_676
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_676:
	jmp NS_E_144_MTC_0_failed
LB_673:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_679
LB_678:
	add r14,1
LB_679:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_678
	cmp rax,10
	jz LB_678
	cmp rax,32
	jz LB_678
	call NS_E_150_ETR_TBL
	cmp r15,0
	jz LB_680
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_681
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_681:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_682
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_682:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_683
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_683:
	jmp NS_E_144_MTC_0_failed
LB_680:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_650
	btr QWORD [rdi],3
LB_650:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_651
	btr QWORD [rdi],2
LB_651:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_652
	btr QWORD [rdi],1
LB_652:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_653
	btr QWORD [rdi],0
LB_653:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_144_MTC_0_failed:
	pop r14
; c1
	push r14
; "\226\136\144"
	jmp LB_621
LB_620:
	add r14,1
LB_621:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_620
	cmp rax,10
	jz LB_620
	cmp rax,32
	jz LB_620
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_623
	jmp NS_E_144_MTC_1_failed
LB_623:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_624
	jmp NS_E_144_MTC_1_failed
LB_624:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_625
	jmp NS_E_144_MTC_1_failed
LB_625:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_631
LB_630:
	add r14,1
LB_631:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_630
	cmp rax,10
	jz LB_630
	cmp rax,32
	jz LB_630
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_632
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_633
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_633:
	jmp NS_E_144_MTC_1_failed
LB_632:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_636
LB_635:
	add r14,1
LB_636:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_635
	cmp rax,10
	jz LB_635
	cmp rax,32
	jz LB_635
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_638
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_640
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_640:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_641
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_641:
	jmp NS_E_144_MTC_1_failed
LB_638:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_644
LB_643:
	add r14,1
LB_644:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_643
	cmp rax,10
	jz LB_643
	cmp rax,32
	jz LB_643
	call NS_E_150_ETR_TBL
	cmp r15,0
	jz LB_645
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_646
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_646:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_647
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_647:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_648
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_648:
	jmp NS_E_144_MTC_1_failed
LB_645:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_615
	btr QWORD [rdi],3
LB_615:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_616
	btr QWORD [rdi],2
LB_616:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_617
	btr QWORD [rdi],1
LB_617:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_618
	btr QWORD [rdi],0
LB_618:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_144_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_146:
NS_E_RDI_146:
NS_E_146_ETR_TBL:
NS_E_146_TBL:
; c0
	push r14
; op
	jmp LB_709
LB_708:
	add r14,1
LB_709:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_708
	cmp rax,10
	jz LB_708
	cmp rax,32
	jz LB_708
	call NS_E_148_ETR_TBL
	cmp r15,0
	jz LB_710
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_146_MTC_0_failed
LB_710:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn
	jmp LB_713
LB_712:
	add r14,1
LB_713:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_712
	cmp rax,10
	jz LB_712
	cmp rax,32
	jz LB_712
	call NS_E_158_ETR_TBL
	cmp r15,0
	jz LB_714
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_715
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_715:
	jmp NS_E_146_MTC_0_failed
LB_714:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\226\138\162"
	jmp LB_718
LB_717:
	add r14,1
LB_718:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_717
	cmp rax,10
	jz LB_717
	cmp rax,32
	jz LB_717
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_720
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_730
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_730:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_731
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_731:
	jmp NS_E_146_MTC_0_failed
LB_720:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,138
	jz LB_721
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_727
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_727:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_728
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_728:
	jmp NS_E_146_MTC_0_failed
LB_721:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,162
	jz LB_722
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_724
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_724:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_725
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_725:
	jmp NS_E_146_MTC_0_failed
LB_722:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; reg_ptn
	jmp LB_734
LB_733:
	add r14,1
LB_734:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_733
	cmp rax,10
	jz LB_733
	cmp rax,32
	jz LB_733
	call NS_E_158_ETR_TBL
	cmp r15,0
	jz LB_735
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_736
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_736:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_737
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_737:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_738
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_738:
	jmp NS_E_146_MTC_0_failed
LB_735:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_703
	btr QWORD [rdi],3
LB_703:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_704
	btr QWORD [rdi],2
LB_704:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_705
	btr QWORD [rdi],1
LB_705:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_706
	btr QWORD [rdi],0
LB_706:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_146_MTC_0_failed:
	pop r14
; c1
	push r14
; "\226\136\142"
	jmp LB_689
LB_688:
	add r14,1
LB_689:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_688
	cmp rax,10
	jz LB_688
	cmp rax,32
	jz LB_688
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_691
	jmp NS_E_146_MTC_1_failed
LB_691:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_692
	jmp NS_E_146_MTC_1_failed
LB_692:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_693
	jmp NS_E_146_MTC_1_failed
LB_693:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn
	jmp LB_699
LB_698:
	add r14,1
LB_699:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_698
	cmp rax,10
	jz LB_698
	cmp rax,32
	jz LB_698
	call NS_E_158_ETR_TBL
	cmp r15,0
	jz LB_700
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_701
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_701:
	jmp NS_E_146_MTC_1_failed
LB_700:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_685
	btr QWORD [rdi],1
LB_685:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_686
	btr QWORD [rdi],0
LB_686:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_146_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_148:
NS_E_RDI_148:
NS_E_148_ETR_TBL:
NS_E_148_TBL:
; c0
	push r14
; name
	jmp LB_759
LB_758:
	add r14,1
LB_759:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_758
	cmp rax,10
	jz LB_758
	cmp rax,32
	jz LB_758
	call NS_E_140_ETR_TBL
	cmp r15,0
	jz LB_760
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_148_MTC_0_failed
LB_760:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_756
	btr QWORD [rdi],0
LB_756:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_148_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\187"
	jmp LB_744
LB_743:
	add r14,1
LB_744:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_743
	cmp rax,10
	jz LB_743
	cmp rax,32
	jz LB_743
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_746
	jmp NS_E_148_MTC_1_failed
LB_746:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,187
	jz LB_747
	jmp NS_E_148_MTC_1_failed
LB_747:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; cst
	jmp LB_752
LB_751:
	add r14,1
LB_752:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_751
	cmp rax,10
	jz LB_751
	cmp rax,32
	jz LB_751
	call NS_E_134_ETR_TBL
	cmp r15,0
	jz LB_753
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_754
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_754:
	jmp NS_E_148_MTC_1_failed
LB_753:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_740
	btr QWORD [rdi],1
LB_740:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_741
	btr QWORD [rdi],0
LB_741:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_148_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_150:
NS_E_RDI_150:
NS_E_150_ETR_TBL:
NS_E_150_TBL:
; c0
	push r14
; type_imp
	call NS_E_152_ETR_TBL
	cmp r15,0
	jz LB_766
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_150_MTC_0_failed
LB_766:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_762
	btr QWORD [rdi],0
LB_762:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_150_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_152:
NS_E_RDI_152:
NS_E_152_ETR_TBL:
NS_E_152_TBL:
; c0
	push r14
; type_app
	jmp LB_779
LB_778:
	add r14,1
LB_779:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_778
	cmp rax,10
	jz LB_778
	cmp rax,32
	jz LB_778
	call NS_E_154_ETR_TBL
	cmp r15,0
	jz LB_780
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_152_MTC_0_failed
LB_780:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\134\146"
	jmp LB_783
LB_782:
	add r14,1
LB_783:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_782
	cmp rax,10
	jz LB_782
	cmp rax,32
	jz LB_782
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_785
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_793
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_793:
	jmp NS_E_152_MTC_0_failed
LB_785:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,134
	jz LB_786
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_791
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_791:
	jmp NS_E_152_MTC_0_failed
LB_786:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,146
	jz LB_787
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_789
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_789:
	jmp NS_E_152_MTC_0_failed
LB_787:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_imp
	jmp LB_796
LB_795:
	add r14,1
LB_796:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_795
	cmp rax,10
	jz LB_795
	cmp rax,32
	jz LB_795
	call NS_E_152_ETR_TBL
	cmp r15,0
	jz LB_797
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_798
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_798:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_799
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_799:
	jmp NS_E_152_MTC_0_failed
LB_797:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_774
	btr QWORD [rdi],2
LB_774:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_775
	btr QWORD [rdi],1
LB_775:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_776
	btr QWORD [rdi],0
LB_776:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_152_MTC_0_failed:
	pop r14
; c1
	push r14
; type_app
	jmp LB_771
LB_770:
	add r14,1
LB_771:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_770
	cmp rax,10
	jz LB_770
	cmp rax,32
	jz LB_770
	call NS_E_154_ETR_TBL
	cmp r15,0
	jz LB_772
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_152_MTC_1_failed
LB_772:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_768
	btr QWORD [rdi],0
LB_768:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_152_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_154:
NS_E_RDI_154:
NS_E_154_ETR_TBL:
NS_E_154_TBL:
; c0
	push r14
; type_atm
	jmp LB_812
LB_811:
	add r14,1
LB_812:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_811
	cmp rax,10
	jz LB_811
	cmp rax,32
	jz LB_811
	call NS_E_156_ETR_TBL
	cmp r15,0
	jz LB_813
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_154_MTC_0_failed
LB_813:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\151\130"
	jmp LB_816
LB_815:
	add r14,1
LB_816:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_815
	cmp rax,10
	jz LB_815
	cmp rax,32
	jz LB_815
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_818
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_826
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_826:
	jmp NS_E_154_MTC_0_failed
LB_818:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,151
	jz LB_819
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_824
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_824:
	jmp NS_E_154_MTC_0_failed
LB_819:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,130
	jz LB_820
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_822
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_822:
	jmp NS_E_154_MTC_0_failed
LB_820:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_atm
	jmp LB_829
LB_828:
	add r14,1
LB_829:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_828
	cmp rax,10
	jz LB_828
	cmp rax,32
	jz LB_828
	call NS_E_156_ETR_TBL
	cmp r15,0
	jz LB_830
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_831
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_831:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_832
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_832:
	jmp NS_E_154_MTC_0_failed
LB_830:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_807
	btr QWORD [rdi],2
LB_807:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_808
	btr QWORD [rdi],1
LB_808:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_809
	btr QWORD [rdi],0
LB_809:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_154_MTC_0_failed:
	pop r14
; c1
	push r14
; type_atm
	jmp LB_804
LB_803:
	add r14,1
LB_804:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_803
	cmp rax,10
	jz LB_803
	cmp rax,32
	jz LB_803
	call NS_E_156_ETR_TBL
	cmp r15,0
	jz LB_805
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_154_MTC_1_failed
LB_805:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_801
	btr QWORD [rdi],0
LB_801:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_154_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_156:
NS_E_RDI_156:
NS_E_156_ETR_TBL:
NS_E_156_TBL:
; c0
	push r14
; word
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_838
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_156_MTC_0_failed
LB_838:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_834
	btr QWORD [rdi],0
LB_834:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_156_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_158:
NS_E_RDI_158:
NS_E_158_ETR_TBL:
NS_E_158_TBL:
; c0
	push r14
; "{"
	jmp LB_851
LB_850:
	add r14,1
LB_851:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_850
	cmp rax,10
	jz LB_850
	cmp rax,32
	jz LB_850
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,123
	jz LB_853
	jmp NS_E_158_MTC_0_failed
LB_853:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_857
LB_856:
	add r14,1
LB_857:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_856
	cmp rax,10
	jz LB_856
	cmp rax,32
	jz LB_856
	call NS_E_160_ETR_TBL
	cmp r15,0
	jz LB_858
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_859
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_859:
	jmp NS_E_158_MTC_0_failed
LB_858:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "}"
	jmp LB_862
LB_861:
	add r14,1
LB_862:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_861
	cmp rax,10
	jz LB_861
	cmp rax,32
	jz LB_861
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,125
	jz LB_864
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_866
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_866:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_867
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_867:
	jmp NS_E_158_MTC_0_failed
LB_864:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_846
	btr QWORD [rdi],2
LB_846:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_847
	btr QWORD [rdi],1
LB_847:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_848
	btr QWORD [rdi],0
LB_848:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_158_MTC_0_failed:
	pop r14
; c1
	push r14
; reg
	jmp LB_843
LB_842:
	add r14,1
LB_843:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_842
	cmp rax,10
	jz LB_842
	cmp rax,32
	jz LB_842
	call NS_E_162_ETR_TBL
	cmp r15,0
	jz LB_844
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_158_MTC_1_failed
LB_844:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_840
	btr QWORD [rdi],0
LB_840:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_158_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_160:
NS_E_RDI_160:
NS_E_160_ETR_TBL:
NS_E_160_TBL:
; c0
	push r14
; reg
	jmp LB_874
LB_873:
	add r14,1
LB_874:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_873
	cmp rax,10
	jz LB_873
	cmp rax,32
	jz LB_873
	call NS_E_162_ETR_TBL
	cmp r15,0
	jz LB_875
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_160_MTC_0_failed
LB_875:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn_lst
	jmp LB_878
LB_877:
	add r14,1
LB_878:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_877
	cmp rax,10
	jz LB_877
	cmp rax,32
	jz LB_877
	call NS_E_160_ETR_TBL
	cmp r15,0
	jz LB_879
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_880
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_880:
	jmp NS_E_160_MTC_0_failed
LB_879:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_870
	btr QWORD [rdi],1
LB_870:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_871
	btr QWORD [rdi],0
LB_871:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_160_MTC_0_failed:
	pop r14
; c1
	push r14
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_160_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_162:
NS_E_RDI_162:
NS_E_162_ETR_TBL:
NS_E_162_TBL:
; c0
	push r14
; "%"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,37
	jz LB_902
	jmp NS_E_162_MTC_0_failed
LB_902:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_907
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_908
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_908:
	jmp NS_E_162_MTC_0_failed
LB_907:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_896
	btr QWORD [rdi],1
LB_896:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_897
	btr QWORD [rdi],0
LB_897:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_162_MTC_0_failed:
	pop r14
; c1
	push r14
; word
	jmp LB_893
LB_892:
	add r14,1
LB_893:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_892
	cmp rax,10
	jz LB_892
	cmp rax,32
	jz LB_892
	call NS_E_136_ETR_TBL
	cmp r15,0
	jz LB_894
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_162_MTC_1_failed
LB_894:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_890
	btr QWORD [rdi],0
LB_890:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_162_MTC_1_failed:
	pop r14
; c2
	push r14
; "_"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,95
	jz LB_887
	jmp NS_E_162_MTC_2_failed
LB_887:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_882
	btr QWORD [rdi],0
LB_882:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_162_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_921:
NS_E_RDI_921:
; » _^ ..
	mov rax,16
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 a \n"
	mov rsi,0x_0a_20_61_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1],rsi
	add rdi,8
; "\226\136\142\226\136\142 \n"
	mov rsi,0x_0a_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1],rsi
	add rdi,8
; //
	mov r13,rax
	btr r12,0
; 	» "a" _ ⊢ 1' : %_911
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; » 0xr0 |~ {  } ⊢ %_912 : %_912
 ; {>  %_910~0':_stg %_911~1':_stg }
; 	» 0xr0 _ ⊢ 2' : %_912
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f126 { %_910 %_912 } ⊢ { %_913 %_914 %_915 } : { %_913 %_914 %_915 }
 ; {>  %_910~0':_stg %_912~2':_r64 %_911~1':_stg }
; _f126 { 0' 2' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' } ⊢ { 0' 1' }
	mov r14,r15
	bt r12,2
	jc LB_924
	btr r12,1
	jmp LB_925
LB_924:
	bts r12,1
LB_925:
	call NS_E_126
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 2' 3' }
	mov r9,r8
	bt r12,3
	jc LB_926
	btr r12,4
	jmp LB_927
LB_926:
	bts r12,4
LB_927:
	mov r8,r9
	bt r12,4
	jc LB_930
	btr r12,3
	jmp LB_931
LB_930:
	bts r12,3
LB_931:
	mov rsi,0
	bt r12,3
	jc LB_928
	bts rsi,17
	bt r8,0
	jc LB_928
	jmp LB_929
LB_928:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,3
LB_929:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
	mov r15,r14
	bt r12,1
	jc LB_932
	btr r12,2
	jmp LB_933
LB_932:
	bts r12,2
LB_933:
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_922
	btr r12,1
	jmp LB_923
LB_922:
	bts r12,1
LB_923:
	add rsp,16
; _f16 { %_913 %_914 %_915 } ⊢ { %_916 %_917 %_918 } : { %_916 %_917 %_918 }
 ; {>  %_915~3':(_opn)◂(_p125) %_914~2':_r64 %_911~1':_stg %_913~0':_stg }
; _f16 { 0' 2' 3' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' 3' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_936
	btr r12,1
	jmp LB_937
LB_936:
	bts r12,1
LB_937:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_940
	btr r12,4
	jmp LB_941
LB_940:
	bts r12,4
LB_941:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_938
	btr QWORD [rdi],0
	jmp LB_939
LB_938:
	bts QWORD [rdi],0
LB_939:
	mov r9,r15
	bt r12,2
	jc LB_944
	btr r12,4
	jmp LB_945
LB_944:
	bts r12,4
LB_945:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_942
	btr QWORD [rdi],1
	jmp LB_943
LB_942:
	bts QWORD [rdi],1
LB_943:
	mov r9,r8
	bt r12,3
	jc LB_948
	btr r12,4
	jmp LB_949
LB_948:
	bts r12,4
LB_949:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_946
	btr QWORD [rdi],2
	jmp LB_947
LB_946:
	bts QWORD [rdi],2
LB_947:
	call NS_E_16
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 2' 3' }
	mov r14,r13
	bt r12,0
	jc LB_950
	btr r12,1
	jmp LB_951
LB_950:
	bts r12,1
LB_951:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_954
	btr r12,4
	jmp LB_955
LB_954:
	bts r12,4
LB_955:
	mov r13,r9
	bt r12,4
	jc LB_952
	btr r12,0
	jmp LB_953
LB_952:
	bts r12,0
LB_953:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_958
	btr r12,4
	jmp LB_959
LB_958:
	bts r12,4
LB_959:
	mov r15,r9
	bt r12,4
	jc LB_956
	btr r12,2
	jmp LB_957
LB_956:
	bts r12,2
LB_957:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_962
	btr r12,4
	jmp LB_963
LB_962:
	bts r12,4
LB_963:
	mov r8,r9
	bt r12,4
	jc LB_960
	btr r12,3
	jmp LB_961
LB_960:
	bts r12,3
LB_961:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_934
	btr r12,1
	jmp LB_935
LB_934:
	bts r12,1
LB_935:
	add rsp,16
; _f14 {  } ⊢ %_919 : %_919
 ; {>  %_917~2':_r64 %_916~0':_stg %_911~1':_stg %_918~3':(_opn)◂(_p125) }
; _f14 {  } ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_972
	btr r12,4
	jmp LB_973
LB_972:
	bts r12,4
LB_973:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_970
	btr r12,3
	jmp LB_971
LB_970:
	bts r12,3
LB_971:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_968
	btr r12,2
	jmp LB_969
LB_968:
	bts r12,2
LB_969:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_966
	btr r12,1
	jmp LB_967
LB_966:
	bts r12,1
LB_967:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_964
	btr r12,0
	jmp LB_965
LB_964:
	bts r12,0
LB_965:
	add rsp,40
; _f16 %_919 ⊢ %_920 : %_920
 ; {>  %_917~2':_r64 %_919~4':_stg %_916~0':_stg %_911~1':_stg %_918~3':(_opn)◂(_p125) }
; _f16 4' ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 4' ⊢ 0'
	mov r13,r9
	bt r12,4
	jc LB_982
	btr r12,0
	jmp LB_983
LB_982:
	bts r12,0
LB_983:
	call NS_E_16
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_984
	btr r12,4
	jmp LB_985
LB_984:
	bts r12,4
LB_985:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_980
	btr r12,3
	jmp LB_981
LB_980:
	bts r12,3
LB_981:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_978
	btr r12,2
	jmp LB_979
LB_978:
	bts r12,2
LB_979:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_976
	btr r12,1
	jmp LB_977
LB_976:
	bts r12,1
LB_977:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_974
	btr r12,0
	jmp LB_975
LB_974:
	bts r12,0
LB_975:
	add rsp,40
; ∎ {  }
 ; {>  %_917~2':_r64 %_920~4':_stg %_916~0':_stg %_911~1':_stg %_918~3':(_opn)◂(_p125) }
; 	∎ {  }
	bt r12,2
	jc LB_986
	mov rdi,r15
	call dlt
LB_986:
	bt r12,4
	jc LB_987
	mov rdi,r9
	call dlt
LB_987:
	bt r12,0
	jc LB_988
	mov rdi,r13
	call dlt
LB_988:
	bt r12,1
	jc LB_989
	mov rdi,r14
	call dlt
LB_989:
	bt r12,3
	jc LB_990
	mov rdi,r8
	call dlt
LB_990:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_45:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_45
	NS_E_DYN_47:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_47
	NS_E_DYN_48:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_48
	NS_E_DYN_49:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_49
	NS_E_DYN_50:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_50
	NS_E_DYN_51:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_51
	CST_DYN_83:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_163:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_164:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_122:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_122
	NS_E_DYN_165:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_166:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_167:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_168:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_124:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_124
	NS_E_DYN_169:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_170:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_126:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_126
	NS_E_DYN_171:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_172:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_128:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_128
	NS_E_DYN_173:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_174:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_130:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_130
	NS_E_DYN_175:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_176:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_132:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_132
	NS_E_DYN_177:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_134:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_134
	NS_E_DYN_178:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_179:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_136:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_136
	NS_E_DYN_180:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_181:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_182:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_138:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_138
	NS_E_DYN_183:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_184:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_140:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_140
	NS_E_DYN_185:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_142:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_142
	NS_E_DYN_186:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_187:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_144:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_144
	NS_E_DYN_188:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_189:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_146:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_146
	NS_E_DYN_190:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_191:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_148:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_148
	NS_E_DYN_192:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_150:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_150
	NS_E_DYN_193:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_194:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_152:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_152
	NS_E_DYN_195:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_196:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_154:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_154
	NS_E_DYN_197:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_156:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_156
	NS_E_DYN_198:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_199:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_158:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_158
	NS_E_DYN_200:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_201:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_160:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_160
	NS_E_DYN_202:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_203:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_204:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_162:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_162
	CST_DYN_921:
		dq 0x0001_0001_00_82_ffff
		dq 1
