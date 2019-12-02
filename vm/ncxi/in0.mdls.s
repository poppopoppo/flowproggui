%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_122
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
NS_E_109:
NS_E_RDI_109:
NS_E_109_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_110
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_110:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_112:
NS_E_RDI_112:
NS_E_112_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_112_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_112_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_113:
NS_E_RDI_113:
NS_E_113_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_113_LB_0
	cmp r11,57
	ja NS_E_113_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_113_LB_0:
	mov rax,0
	ret
NS_E_115:
NS_E_RDI_115:
NS_E_115_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_115_LB_0
	cmp r11,122
	ja NS_E_115_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_115_LB_0:
	mov rax,0
	ret
NS_E_114:
NS_E_RDI_114:
NS_E_114_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_114_LB_0
	cmp r11,90
	ja NS_E_114_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_114_LB_0:
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
NS_E_111:
NS_E_RDI_111:
NS_E_111_ETR_TBL:
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
	cmp rsi,r14
	jz NS_E_111_LB_0
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_111_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_122:
NS_E_RDI_122:
; 	» "2" _ ⊢ 0' : %_116
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_117 : %_117
 ; {>  %_116~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_117
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f111 { %_116 %_117 } ⊢ { %_118 %_119 %_120 } : { %_118 %_119 %_120 }
 ; {>  %_117~1':_r64 %_116~0':_stg }
; _f111 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 0' 1' }
	call NS_E_111
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r9,r15
	bt r12,2
	jc LB_123
	btr r12,4
	jmp LB_124
LB_123:
	bts r12,4
LB_124:
	mov r15,r8
	bt r12,3
	jc LB_127
	btr r12,2
	jmp LB_128
LB_127:
	bts r12,2
LB_128:
	mov rsi,1
	bt r12,2
	jc LB_125
	mov rsi,0
	bt r15,0
	jc LB_125
	jmp LB_126
LB_125:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r15
	mov r15,rax
	btr r12,2
LB_126:
	mov rax,r9
	shl rax,56
	or rax,1
	mov rdi,rax
	or r15,rdi
; pop_iv
	add rsp,8
; _f16 %_120 ⊢ %_121 : %_121
 ; {>  %_120~2':(_opn)◂(_r64) %_118~0':_stg %_119~1':_r64 }
; _f16 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_133
	btr r12,0
	jmp LB_134
LB_133:
	bts r12,0
LB_134:
	call NS_E_16
; _emt_mov_ptn_to_ptn 0' ⊢ 2'
	mov r15,r13
	bt r12,0
	jc LB_135
	btr r12,2
	jmp LB_136
LB_135:
	bts r12,2
LB_136:
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_131
	btr r12,1
	jmp LB_132
LB_131:
	bts r12,1
LB_132:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_129
	btr r12,0
	jmp LB_130
LB_129:
	bts r12,0
LB_130:
	add rsp,24
; ∎ {  }
 ; {>  %_118~0':_stg %_121~2':(_opn)◂(_r64) %_119~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_137
	mov rdi,r13
	call dlt
LB_137:
	bt r12,2
	jc LB_138
	mov rdi,r15
	call dlt
LB_138:
	bt r12,1
	jc LB_139
	mov rdi,r14
	call dlt
LB_139:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_109:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_109
	NS_E_DYN_112:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_112
	NS_E_DYN_113:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_113
	NS_E_DYN_114:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_114
	NS_E_DYN_115:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_115
	CST_DYN_122:
		dq 0x0001_0001_00_82_ffff
		dq 1
