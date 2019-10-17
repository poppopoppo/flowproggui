%include "cmu.s"
main:
	mov r15,0
	mov r14,0
	mov r13,0
	mov r12,0
	not r12
	xor rax,rax
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call f3
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
f3:
; 	|» {  }
	jz _f3
	jc emt_etr_c_lb_0
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp _f3
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f3:
; 	» some _ ⊢ 0' : t91'(0)→(opn)◂(t91'(0))
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_some],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r9,_dyn_some
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p0 : ,t92'(0)→(opn)◂(t92'(0))
; emt_ptn_crt_ptn 0',p0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_98
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_99
emt_set_ptn_0_lb_98:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_99:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_100
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_100:
; 	» f1 _ ⊢ 0' : { }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t93'(0)) }) }) })
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_f1],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r10,_dyn_f1
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,p1 : ,{ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t94'(0)) }) }) })
; emt_ptn_crt_ptn 0',p1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_101
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_102
emt_set_ptn_0_lb_101:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_102:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_103
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_103:
	mov QWORD [dyn_call_vct],rbx
	mov rbx,QWORD r9
	bt QWORD [rbx],30
	jc ir_dyn_call_0_lb_121
; 	◂ 1',2' ⊢ 0' : (opn)◂({ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t96'(0)) }) }) }))
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_110
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_111
emt_set_ptn_0_lb_110:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_111:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_112
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_112:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_113
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_113:
	mov rdi,QWORD r8
	mov rax,QWORD [rbx+8*1]
	stc
	mov rbx,QWORD [dyn_call_vct]
	call rax
	mov QWORD [tmp],rax
	jc call_c_lb_114
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_119
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_120
emt_set_ptn_0_lb_119:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_120:
; ; emt_dec 
; unknown
	jc lb_118
;push_reg
	push QWORD r8
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD r8
lb_118:
	jmp call_nc_lb_115
call_c_lb_114:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_116
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_117
emt_set_ptn_0_lb_116:
	mov r8,[tmp]
	or r12,0b1
emt_set_ptn_1_lb_117:
call_nc_lb_115:
	jmp ir_dyn_call_1_lb_122
ir_dyn_call_0_lb_121:
	mov QWORD r8,QWORD [rbx+8*1]
	bts r12,0
; emt_ptn_set_ptn { 0' 2' },0'
	push r12
; emt_get_ptn { 0' 2' }
	push rbx
	push r14
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,2
	call mlc
	mov rbx,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push rbx
; emt_get_ptn 0'
	bt r12,0
	jc emt_get_ptn_0_lb_104
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_105
emt_get_ptn_0_lb_104:
; unboxed
	stc
emt_get_ptn_1_lb_105:
	mov QWORD r8,r8
;push_reg
	mov rdx,r8
	pop rdi
	mov rbx,rdi
	mov rsi,0
	call exc
;pop_reg
	push rbx
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_lb_106
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_107
emt_get_ptn_0_lb_106:
; unboxed
	stc
emt_get_ptn_1_lb_107:
	mov QWORD r8,r10
;push_reg
	mov rdx,r8
	pop rdi
	mov rbx,rdi
	mov rsi,1
	call exc
;pop_reg
	mov r8,rbx
	pop r14
	pop rbx
	clc
	pop r12
	and r12,~0b1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_108
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_108:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_109
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_109:
	mov rbx,QWORD [dyn_call_vct]
ir_dyn_call_1_lb_122:
; 	» f1 _ ⊢ 1' : { }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t97'(0)) }) }) })
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_f1],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r10,_dyn_f1
	mov QWORD r9,r10
	and r12,~0b10
; 	$ 1' ⊢ ,p1 : ,{ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t98'(0)) }) }) })
; emt_ptn_crt_ptn 1',p1
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_125
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_126
emt_set_ptn_0_lb_125:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_126:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_127
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_127:
	mov QWORD [dyn_call_vct],rbx
	mov rbx,QWORD r10
	bt QWORD [rbx],30
	jc ir_dyn_call_0_lb_139
; 	◂ 2',{  } ⊢ 1' : (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t99'(0)) }) }) })
; push_s_ex  0'~a0
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_set_ptn {  },0'
	push r12
; emt_get_ptn {  }
	push rbx
	push r14
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,0
	call mlc
	mov rbx,rax
;pop_reg
	pop QWORD r10
	pop QWORD r8
	mov r8,rbx
	pop r14
	pop rbx
	clc
	pop r12
	and r12,~0b1
; ; emt_dec_ptn {  }
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_131
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_131:
	mov rdi,QWORD r8
	mov rax,QWORD [rbx+8*1]
	stc
	mov rbx,QWORD [dyn_call_vct]
	call rax
	mov QWORD [tmp],rax
	jc call_c_lb_132
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	clc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_137
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_138
emt_set_ptn_0_lb_137:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_138:
; ; emt_dec 
; unknown
	jc lb_136
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,[tmp]
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
lb_136:
	jmp call_nc_lb_133
call_c_lb_132:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	stc
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_134
	push rdi
	mov rdi,[tmp]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_135
emt_set_ptn_0_lb_134:
	mov r9,[tmp]
	or r12,0b10
emt_set_ptn_1_lb_135:
call_nc_lb_133:
	jmp ir_dyn_call_1_lb_140
ir_dyn_call_0_lb_139:
	mov QWORD r9,QWORD [rbx+8*1]
	bts r12,1
; emt_ptn_set_ptn { 1' {  } },1'
	push r12
; emt_get_ptn { 1' {  } }
	push rbx
	push r14
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,2
	call mlc
	mov rbx,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	push rbx
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_lb_128
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_129
emt_get_ptn_0_lb_128:
; unboxed
	stc
emt_get_ptn_1_lb_129:
	mov QWORD r9,r9
;push_reg
	mov rdx,r9
	pop rdi
	mov rbx,rdi
	mov rsi,0
	call exc
;pop_reg
	push rbx
; emt_get_ptn {  }
	push rbx
	push r14
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,0
	call mlc
	mov rbx,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	mov r9,rbx
	pop r14
	pop rbx
	clc
;push_reg
	mov rdx,r9
	pop rdi
	mov rbx,rdi
	mov rsi,1
	call exc
;pop_reg
	mov r9,rbx
	pop r14
	pop rbx
	clc
	pop r12
	and r12,~0b10
; ; emt_dec_ptn {  }
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_130
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_130:
	mov rbx,QWORD [dyn_call_vct]
ir_dyn_call_1_lb_140:
; 	∎ { 0' 1' }
; emt_get_crt_ptn { 0' 1' }
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,2
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_145
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_146
emt_get_crt_ptn_0_lb_145:
; unboxed
	stc
emt_get_crt_ptn_1_lb_146:
	mov QWORD r11,r8
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,0
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_147
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_148
emt_get_crt_ptn_0_lb_147:
; unboxed
	stc
emt_get_crt_ptn_1_lb_148:
	mov QWORD r11,r9
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,1
	call exc
	mov r10,rdi
;pop_reg
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_lb_149
	push r10
; ; emt_dec_ptn { 0' 1' }
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_143
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_143:
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_144
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_144:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_149:
;clear 
	mov rax,r10
	stc
	ret
f2:
; 	|» {  }
	jz _f2
	jc emt_etr_c_lb_1
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp _f2
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f2:
; 	» some _ ⊢ 0' : t82'(0)→(opn)◂(t82'(0))
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_some],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r9,_dyn_some
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p0 : ,t83'(0)→(opn)◂(t83'(0))
; emt_ptn_crt_ptn 0',p0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_85
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_86
emt_set_ptn_0_lb_85:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_86:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_87
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_87:
; 	» f1 _ ⊢ 0' : { }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t84'(0)) }) }) })
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [_dyn_f1],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r10,_dyn_f1
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,p1 : ,{ }→(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t85'(0)) }) }) })
; emt_ptn_crt_ptn 0',p1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_88
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_89
emt_set_ptn_0_lb_88:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_89:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_90
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_90:
; 	∎ { 1' 2' }
; emt_get_crt_ptn { 1' 2' }
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,2
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
; test x1
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r8
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_93
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_94
emt_get_crt_ptn_0_lb_93:
; unboxed
	stc
emt_get_crt_ptn_1_lb_94:
	mov QWORD r11,r9
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,0
	call exc
	mov r8,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
; test x1
;push_reg
	push QWORD r9
	push QWORD r10
	push QWORD r8
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_95
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_96
emt_get_crt_ptn_0_lb_95:
; unboxed
	stc
emt_get_crt_ptn_1_lb_96:
	mov QWORD r11,r10
; test x0
	mov rdx,r11
	pop rdi
	mov rsi,1
	call exc
	mov r8,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	clc
	jc ret_lb_97
	push r8
; ; emt_dec_ptn { 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_91
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_91:
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_92
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_lb_92:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_97:
;clear 
	mov rax,r8
	stc
	ret
f1:
; 	|» {  }
	jz _f1
	jc emt_etr_c_lb_2
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp _f1
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f1:
; 	$ {  } ⊢ ,_r59,_r60 : ,{ },{ }
; emt_ptn_crt_ptn {  },_r59
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	and r12,~0b1
; emt_ptn_crt_ptn {  },_r60
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	» 0xr7adfd |~ 2' : r64
	mov QWORD r11,0x7adfd
	mov QWORD r10,r11
	or r12,0b100
; 	$ 1' ⊢ ,_r63,_r64 : ,{ },{ }
; emt_ptn_crt_ptn 1',_r63
; emt_set_ptn 3'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov r11,rdi
	pop rdi
	and r12,~0b1000
; emt_ptn_crt_ptn 1',_r64
; emt_set_ptn 4'
; boxed
	push rdi
	mov rdi,r9
	call inc_r
; test 1
	mov rcx,rdi
	pop rdi
	and r12,~0b10000
; ; emt_dec_ptn 1'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xra7632 |~ 1' : r64
	mov QWORD rdx,0xa7632
	mov QWORD r9,rdx
	or r12,0b10
; 	$ 4' ⊢ ,_r67,_r68 : ,{ },{ }
; emt_ptn_crt_ptn 4',_r67
; emt_set_ptn 5'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rdx,rdi
	pop rdi
	and r12,~0b100000
; emt_ptn_crt_ptn 4',_r68
; emt_set_ptn 6'
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
; test 1
	mov rsi,rdi
	pop rdi
	and r12,~0b1000000
; ; emt_dec_ptn 4'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; 	» 0xr4867 |~ 4' : r64
	mov QWORD rdi,0x4867
	mov QWORD rcx,rdi
	or r12,0b10000
	mov QWORD rdi,1
	bts r12,7
; emt_ptn_crt_ptn { 7' {  } },_r70
; emt_get_crt_ptn { 7' {  } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_54
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_55
emt_get_crt_ptn_0_lb_54:
; unboxed
	stc
emt_get_crt_ptn_1_lb_55:
	mov QWORD [st_vct+8*0],rdi
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,0
	call mlc
	mov [st_vct+8*0],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b100000000
; ; emt_dec_ptn {  }
	mov QWORD rdi,0
	bts r12,7
; emt_ptn_crt_ptn { 7' { 4' 8' } },_r66
; emt_get_crt_ptn { 7' { 4' 8' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*0],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*0]
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_56
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_57
emt_get_crt_ptn_0_lb_56:
; unboxed
	stc
emt_get_crt_ptn_1_lb_57:
	mov QWORD [st_vct+8*1],rdi
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*0],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*0]
; emt_get_crt_ptn { 4' 8' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	mov rdi,2
	call mlc
	mov [st_vct+8*1],rax
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn 4'
	mov QWORD [st_vct+8*2],rcx
	stc
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,0
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
	push QWORD [st_vct+8*1]
; emt_get_crt_ptn 8'
	bt r12,8
	jc emt_get_crt_ptn_0_lb_58
; boxed
	push rdi
	mov rdi,rax
	call inc_r
	mov rax,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_59
emt_get_crt_ptn_0_lb_58:
; unboxed
	stc
emt_get_crt_ptn_1_lb_59:
	mov QWORD [st_vct+8*2],rax
; test x0
	mov rdx,[st_vct+8*2]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*1],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,1
	call exc
	mov [st_vct+8*0],rdi
;pop_reg
	pop QWORD rax
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b1000000000
; ; emt_dec_ptn { 4' 8' }
; unknown
	bt r12,8
	jc emt_dec_ptn_0_lb_60
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rax
	mov rdi,rax
	call dec_r
;pop_reg
	pop QWORD rax
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_60:
; unboxed
	mov QWORD rcx,0
	bts r12,4
; emt_ptn_crt_ptn { 4' { 1' 9' } },_r62
; emt_get_crt_ptn { 4' { 1' 9' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,2
	call mlc
	mov rdi,rax
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_62
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_63
emt_get_crt_ptn_0_lb_62:
; unboxed
	stc
emt_get_crt_ptn_1_lb_63:
	mov QWORD rax,rcx
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rdi,rdi
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
; emt_get_crt_ptn { 1' 9' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 1'
	mov QWORD [st_vct+8*1],r9
	stc
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 9'
	bt r12,9
	jc emt_get_crt_ptn_0_lb_64
; boxed
	push rdi
	mov rdi,[st_vct+8*0]
	call inc_r
	mov [st_vct+8*0],rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_65
emt_get_crt_ptn_0_lb_64:
; unboxed
	stc
emt_get_crt_ptn_1_lb_65:
	push r14
	mov QWORD r14,[st_vct+8*0]
	mov QWORD [st_vct+8*1],r14
	pop r14
; test x0
	mov rdx,[st_vct+8*1]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rdi,rdi
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000000
; ; emt_dec_ptn { 1' 9' }
; unknown
	bt r12,9
	jc emt_dec_ptn_0_lb_66
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,[st_vct+8*0]
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_66:
; unboxed
	mov QWORD r9,0
	bts r12,1
; emt_ptn_crt_ptn { 1' { 2' 7' } },_r58
; emt_get_crt_ptn { 1' { 2' 7' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_68
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_69
emt_get_crt_ptn_0_lb_68:
; unboxed
	stc
emt_get_crt_ptn_1_lb_69:
	mov QWORD rax,r9
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rcx
; emt_get_crt_ptn { 2' 7' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,2
	call mlc
	mov rax,rax
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 2'
	mov QWORD [st_vct+8*0],r10
	stc
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,0
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	push QWORD rax
; emt_get_crt_ptn 7'
	bt r12,7
	jc emt_get_crt_ptn_0_lb_70
; boxed
	call inc_r
	clc
	jmp emt_get_crt_ptn_1_lb_71
emt_get_crt_ptn_0_lb_70:
; unboxed
	stc
emt_get_crt_ptn_1_lb_71:
	mov QWORD [st_vct+8*0],rdi
; test x0
	mov rdx,[st_vct+8*0]
	pop rdi
	mov rsi,1
	call exc
	mov rax,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rax
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn { 2' 7' }
; unknown
	bt r12,7
	jc emt_dec_ptn_0_lb_72
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	push QWORD rdi
	mov rdi,rdi
	call dec_r
;pop_reg
	pop QWORD rdi
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_72:
; unboxed
; 	$ 4' ⊢ ,l0 : ,(lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂({ r64 (lstA)◂(t78'(0)) }) }) })
; emt_ptn_crt_ptn 4',l0
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_74
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_75
emt_set_ptn_0_lb_74:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_75:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_76
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
	push QWORD rsi
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_76:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_78
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_79
emt_get_crt_ptn_0_lb_78:
; unboxed
	stc
emt_get_crt_ptn_1_lb_79:
	mov QWORD r10,r9
	jc ret_lb_80
	push r10
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_77
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rdx
	push QWORD rsi
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rsi
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_77:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_80:
;clear  6'~_r68 3'~_r63 5'~_r67 0'~_r59
	bt r12,6
	jc clear_lb_81
;push_reg
	push QWORD r8
	push QWORD r11
	push QWORD rdx
	mov rdi,rsi
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r11
	pop QWORD r8
clear_lb_81:
	bt r12,3
	jc clear_lb_82
;push_reg
	push QWORD r8
	push QWORD rdx
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD rdx
	pop QWORD r8
clear_lb_82:
	bt r12,5
	jc clear_lb_83
;push_reg
	push QWORD r8
	mov rdi,rdx
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_83:
	bt r12,0
	jc clear_lb_84
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_84:
	mov rax,r10
	stc
	ret
f0:
; 	|» {  }
	jz _f0
	jc emt_etr_c_lb_3
	push rbx
	mov rbx,rdi
	push rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp _f0
emt_etr_c_lb_3:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f0:
	mov QWORD r8,1
	bts r12,0
; emt_ptn_crt_ptn { 0' {  } },l0
; emt_get_crt_ptn { 0' {  } }
;push_reg
	push QWORD r8
	mov rdi,2
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_4
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_5
emt_get_crt_ptn_0_lb_4:
; unboxed
	stc
emt_get_crt_ptn_1_lb_5:
	mov QWORD r10,r8
; test x0
	mov rdx,r10
	pop rdi
	mov rsi,0
	call exc
	mov r9,rdi
;pop_reg
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,0
	call mlc
	mov r10,rax
;pop_reg
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,r10
	pop rdi
	mov rsi,1
	call exc
	mov r9,rdi
;pop_reg
	pop QWORD r8
	clc
	and r12,~0b10
; ; emt_dec_ptn {  }
; 	$ 1' ⊢ ,l0,l1 : ,(b_tree)◂(t53'(0)),(b_tree)◂(t53'(0))
; emt_ptn_crt_ptn 1',l0
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_6
	push rdi
	mov rdi,r9
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_7
emt_set_ptn_0_lb_6:
	mov r8,r9
	or r12,0b1
emt_set_ptn_1_lb_7:
; emt_ptn_crt_ptn 1',l1
; emt_set_ptn 2'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_8
	push rdi
	mov rdi,r9
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_9
emt_set_ptn_0_lb_8:
	mov r10,r9
	or r12,0b100
emt_set_ptn_1_lb_9:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_10
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_10:
; 	» 0xrfabc |~ 1' : r64
	mov QWORD r11,0xfabc
	mov QWORD r9,r11
	or r12,0b10
; 	$ 1' ⊢ ,x0 : ,r64
; emt_ptn_crt_ptn 1',x0
; emt_set_ptn 3'
; unboxed
	mov r11,r9
; ; emt_dec_ptn 1'
; unboxed
	mov QWORD r9,0
	bts r12,1
; emt_ptn_crt_ptn { 1' { 0' 3' 2' } },t0
; emt_get_crt_ptn { 1' { 0' 3' 2' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_14
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_15
emt_get_crt_ptn_0_lb_14:
; unboxed
	stc
emt_get_crt_ptn_1_lb_15:
	mov QWORD rdx,r9
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
; emt_get_crt_ptn { 0' 3' 2' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,3
	call mlc
	mov rdx,rax
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_16
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_17
emt_get_crt_ptn_0_lb_16:
; unboxed
	stc
emt_get_crt_ptn_1_lb_17:
	mov QWORD rsi,r8
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,0
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_crt_ptn 3'
	mov QWORD rsi,r11
	stc
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,1
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_18
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_19
emt_get_crt_ptn_0_lb_18:
; unboxed
	stc
emt_get_crt_ptn_1_lb_19:
	mov QWORD rsi,r10
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,2
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn { 0' 3' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_20
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_20:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_22
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_22:
; 	$ 4' ⊢ ,t0,t1 : ,(b_tree)◂(r64),(b_tree)◂(r64)
; emt_ptn_crt_ptn 4',t0
; emt_set_ptn 0'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_23
	push rdi
	mov rdi,rcx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_24
emt_set_ptn_0_lb_23:
	mov r8,rcx
	or r12,0b1
emt_set_ptn_1_lb_24:
; emt_ptn_crt_ptn 4',t1
; emt_set_ptn 1'
; unknown
	bt r12,4
	jc emt_set_ptn_0_lb_25
	push rdi
	mov rdi,rcx
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_26
emt_set_ptn_0_lb_25:
	mov r9,rcx
	or r12,0b10
emt_set_ptn_1_lb_26:
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_27
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD rcx
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_27:
; 	» 0xrfacac |~ 2' : r64
	mov QWORD r11,0xfacac
	mov QWORD r10,r11
	or r12,0b100
; 	$ 2' ⊢ ,x1 : ,r64
; emt_ptn_crt_ptn 2',x1
; emt_set_ptn 3'
; unboxed
	mov r11,r10
; ; emt_dec_ptn 2'
; unboxed
	mov QWORD r10,0
	bts r12,2
; emt_ptn_crt_ptn { 2' { 0' 3' 1' } },t2
; emt_get_crt_ptn { 2' { 0' 3' 1' } }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,2
	call mlc
	mov rcx,rax
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_31
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_32
emt_get_crt_ptn_0_lb_31:
; unboxed
	stc
emt_get_crt_ptn_1_lb_32:
	mov QWORD rdx,r10
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,0
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
; emt_get_crt_ptn { 0' 3' 1' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	mov rdi,3
	call mlc
	mov rdx,rax
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_33
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_34
emt_get_crt_ptn_0_lb_33:
; unboxed
	stc
emt_get_crt_ptn_1_lb_34:
	mov QWORD rsi,r8
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,0
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_crt_ptn 3'
	mov QWORD rsi,r11
	stc
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,1
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	push QWORD rcx
	push QWORD rdx
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_35
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_36
emt_get_crt_ptn_0_lb_35:
; unboxed
	stc
emt_get_crt_ptn_1_lb_36:
	mov QWORD rsi,r9
; test x0
	mov rdx,rsi
	pop rdi
	mov rsi,2
	call exc
	mov rdx,rdi
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
; test x0
	mov rdx,rdx
	pop rdi
	mov rsi,1
	call exc
	mov rcx,rdi
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	and r12,~0b10000
; ; emt_dec_ptn { 0' 3' 1' }
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_37
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_37:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_39
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r11
	push QWORD rcx
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD rcx
	pop QWORD r11
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_39:
; 	∎ 4'
; emt_get_crt_ptn 4'
	bt r12,4
	jc emt_get_crt_ptn_0_lb_41
; boxed
	push rdi
	mov rdi,rcx
	call inc_r
	mov rcx,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_42
emt_get_crt_ptn_0_lb_41:
; unboxed
	stc
emt_get_crt_ptn_1_lb_42:
	mov QWORD r8,rcx
	jc ret_lb_43
	push r8
; ; emt_dec_ptn 4'
; unknown
	bt r12,4
	jc emt_dec_ptn_0_lb_40
;push_reg
	push QWORD rcx
	mov rdi,rcx
	call dec_r
;pop_reg
	pop QWORD rcx
emt_dec_ptn_0_lb_40:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_43:
;clear 
	mov rax,r8
	stc
	ret
section .data
	_dyn_f0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f0
	_dyn_f1:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f1
	_dyn_f2:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f2
	_dyn_f3:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f3
	_dyn_lf:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	_dyn_brc:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	_dyn_nilA:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	_dyn_cnsA:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	_dyn_none:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	_dyn_some:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	_dyn_p1:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_e1:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_e0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_cmp:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_mul:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_sub:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_add:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_pnt:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_read:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_scc:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_cns:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	_dyn_nil:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
