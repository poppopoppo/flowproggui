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
	call f2
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
f2:
; 	|» {  }
	jz _f2
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
jmp _f2
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f2:
; 	» 0xr0 |~ 0' : r64
	mov QWORD r9,0x0
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,r0 : ,r64
; emt_ptn_crt_ptn 0',r0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» "AA\194\167\194\167\194\167" |~ 0' : ℙ
;push_reg
	push QWORD r9
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_78+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_78+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,8
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD r9
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,ℙ
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_79
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_80
emt_set_ptn_0_lb_79:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_80:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_81
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
emt_dec_ptn_0_lb_81:
; 	g6 { 2' 1' } ⊢ { 0' 1' 2' } : { ℙ r64 g6 }
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
mov rsi,2

           mov rdi,str_dbg
           mov rax,0
           call printf
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
mov rsi,1

           mov rdi,str_dbg
           mov rax,0
           call printf
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	mov r11,r9
	bts r12,3
; emt_ptn_set_ptn { 2' 3' },{ 0' 1' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_82
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_83
emt_set_ptn_0_lb_82:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_83:
; emt_ptn_set_ptn 3',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r11
; ; emt_dec_ptn { 2' 3' }
; unboxed
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_87
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_87:
	call _g6
	mov QWORD [tmp],rax
	jc call_c_lb_88
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov r11,[rbx]
	bt r11,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_97
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_98
emt_set_ptn_0_lb_97:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_98:
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_101
	push rdi
	mov rdi,rbx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_102
emt_set_ptn_0_lb_101:
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_lb_102:
	pop rbx
; ; emt_dec 
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	jmp call_nc_lb_89
call_c_lb_88:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov r11,[rbx]
	bt r11,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_90
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_91
emt_set_ptn_0_lb_90:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_91:
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_94
	push rdi
	mov rdi,rbx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_95
emt_set_ptn_0_lb_94:
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_lb_95:
	pop rbx
call_nc_lb_89:
; 	∎ { 0' 1' 2' }
; emt_get_crt_ptn { 0' 1' 2' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,3
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_106
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_107
emt_get_crt_ptn_0_lb_106:
; unboxed
	stc
emt_get_crt_ptn_1_lb_107:
	mov QWORD rcx,r8
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,0
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 1'
	mov QWORD rcx,r9
	stc
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,1
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_108
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_109
emt_get_crt_ptn_0_lb_108:
; unboxed
	stc
emt_get_crt_ptn_1_lb_109:
	mov QWORD rcx,r10
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,2
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_lb_110
	push r11
; ; emt_dec_ptn { 0' 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_103
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
emt_dec_ptn_0_lb_103:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_105
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
emt_dec_ptn_0_lb_105:
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_lb_110:
;clear 
	mov rax,r11
	stc
	ret
f1:
; 	|» {  }
	jz _f1
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
jmp _f1
emt_etr_c_lb_1:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f1:
; 	» 0xr0 |~ 0' : r64
	mov QWORD r9,0x0
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,r0 : ,r64
; emt_ptn_crt_ptn 0',r0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» "\n" |~ 0' : ℙ
;push_reg
	push QWORD r9
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_42+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,7
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD r9
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,ℙ
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_43
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_44
emt_set_ptn_0_lb_43:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_44:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_45
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
emt_dec_ptn_0_lb_45:
; 	g4 { 2' 1' } ⊢ { 0' 1' 2' } : { ℙ r64 g4 }
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
mov rsi,2

           mov rdi,str_dbg
           mov rax,0
           call printf
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
mov rsi,1

           mov rdi,str_dbg
           mov rax,0
           call printf
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	mov r11,r9
	bts r12,3
; emt_ptn_set_ptn { 2' 3' },{ 0' 1' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_46
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_47
emt_set_ptn_0_lb_46:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_47:
; emt_ptn_set_ptn 3',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r11
; ; emt_dec_ptn { 2' 3' }
; unboxed
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_51
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_51:
	call _g4
	mov QWORD [tmp],rax
	jc call_c_lb_52
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov r11,[rbx]
	bt r11,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_61
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_62
emt_set_ptn_0_lb_61:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_62:
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_65
	push rdi
	mov rdi,rbx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_66
emt_set_ptn_0_lb_65:
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_lb_66:
	pop rbx
; ; emt_dec 
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	jmp call_nc_lb_53
call_c_lb_52:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov r11,[rbx]
	bt r11,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_54
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_55
emt_set_ptn_0_lb_54:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_55:
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_58
	push rdi
	mov rdi,rbx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_59
emt_set_ptn_0_lb_58:
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_lb_59:
	pop rbx
call_nc_lb_53:
; 	∎ { 0' 1' 2' }
; emt_get_crt_ptn { 0' 1' 2' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,3
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_70
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_71
emt_get_crt_ptn_0_lb_70:
; unboxed
	stc
emt_get_crt_ptn_1_lb_71:
	mov QWORD rcx,r8
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,0
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 1'
	mov QWORD rcx,r9
	stc
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,1
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_72
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_73
emt_get_crt_ptn_0_lb_72:
; unboxed
	stc
emt_get_crt_ptn_1_lb_73:
	mov QWORD rcx,r10
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,2
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_lb_74
	push r11
; ; emt_dec_ptn { 0' 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_67
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
emt_dec_ptn_0_lb_67:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_69
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
emt_dec_ptn_0_lb_69:
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_lb_74:
;clear 
	mov rax,r11
	stc
	ret
f0:
; 	|» {  }
	jz _f0
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
jmp _f0
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f0:
; 	» 0xr0 |~ 0' : r64
	mov QWORD r9,0x0
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,r0 : ,r64
; emt_ptn_crt_ptn 0',r0
; emt_set_ptn 1'
; unboxed
	mov r9,r8
; ; emt_dec_ptn 0'
; unboxed
; 	» "\194\167" |~ 0' : ℙ
;push_reg
	push QWORD r9
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_6+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,6
	mov [rdi],rdx
	mov QWORD r10,rdi
;pop_reg
	pop QWORD r9
	mov QWORD r8,r10
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,ℙ
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_7
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_8
emt_set_ptn_0_lb_7:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_8:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_9
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
emt_dec_ptn_0_lb_9:
; 	g5 { 2' 1' } ⊢ { 0' 1' 2' } : { ℙ r64 g5 }
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
	mov rdi,r10
	mov rsi,str_ret
	bt r12,2
	call pnt
	call pnt_str_ret
mov rsi,2

           mov rdi,str_dbg
           mov rax,0
           call printf
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
	pushf
 push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11
	mov rdi,r9
	mov rsi,str_ret
	bt r12,1
	call pnt
	call pnt_str_ret
mov rsi,1

           mov rdi,str_dbg
           mov rax,0
           call printf
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
 pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
	popf
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	mov r11,r9
	bts r12,3
; emt_ptn_set_ptn { 2' 3' },{ 0' 1' }
; emt_ptn_set_ptn 2',0'
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_10
	push rdi
	mov rdi,r10
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_11
emt_set_ptn_0_lb_10:
	mov r8,r10
	or r12,0b1
emt_set_ptn_1_lb_11:
; emt_ptn_set_ptn 3',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r11
; ; emt_dec_ptn { 2' 3' }
; unboxed
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_15
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_15:
	call _g5
	mov QWORD [tmp],rax
	jc call_c_lb_16
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov r11,[rbx]
	bt r11,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_25
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_26
emt_set_ptn_0_lb_25:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_26:
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_29
	push rdi
	mov rdi,rbx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_30
emt_set_ptn_0_lb_29:
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_lb_30:
	pop rbx
; ; emt_dec 
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	jmp call_nc_lb_17
call_c_lb_16:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn { 0' 1' 2' }
	push rbx
	mov r11,[rbx]
	bt r11,0
	mov rbx,[rbx+8*1]
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_18
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_19
emt_set_ptn_0_lb_18:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_19:
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,1
	mov rbx,[rbx+8*2]
; emt_set_ptn 1'
; unboxed
	mov r9,rbx
	pop rbx
	push rbx
	mov r11,[rbx]
	bt r11,2
	mov rbx,[rbx+8*3]
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_22
	push rdi
	mov rdi,rbx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_23
emt_set_ptn_0_lb_22:
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_lb_23:
	pop rbx
call_nc_lb_17:
; 	∎ { 0' 1' 2' }
; emt_get_crt_ptn { 0' 1' 2' }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,3
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_34
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_35
emt_get_crt_ptn_0_lb_34:
; unboxed
	stc
emt_get_crt_ptn_1_lb_35:
	mov QWORD rcx,r8
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,0
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 1'
	mov QWORD rcx,r9
	stc
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,1
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
; test x1
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
; emt_get_crt_ptn 2'
	bt r12,2
	jc emt_get_crt_ptn_0_lb_36
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_37
emt_get_crt_ptn_0_lb_36:
; unboxed
	stc
emt_get_crt_ptn_1_lb_37:
	mov QWORD rcx,r10
; test x0
	mov rdx,rcx
	pop rdi
	mov rsi,2
	call exc
	mov r11,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_lb_38
	push r11
; ; emt_dec_ptn { 0' 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_31
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
emt_dec_ptn_0_lb_31:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_33
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
emt_dec_ptn_0_lb_33:
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_lb_38:
;clear 
	mov rax,r11
	stc
	ret
_grm_init_tbl:
	mov rbx,rdi
	mov r14,rsi
	mov rdx,[rdi]
	mov rcx,rdx
	shl rcx,16
	shr rcx,48
	shl rcx,3
	and rdx,0xf
	sub rcx,rdx
	shl rcx,1
	imul rcx,8
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	ret
_g6_etr_tbl:
	push QWORD 1
	jmp _g6_tbl
g6:
_g6:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_g6_tbl:
_g6_r6:
	push rsi
_grm_lst_111:
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,65
	jnz _grm_lst_112
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,65
	jnz _grm_lst_112
	add rsi,2
_grm_lst_112:
_grm_lst_113:
	call _g5_etr_tbl
	cmp rax,0
	jz _grm_lst_114
	jmp _grm_lst_113
_grm_lst_114:
_g6_r6_succeed:
	pop r8
	jmp _g6_succeed
_g6_r6_failed:
	pop rsi
	jmp _g6_failed
_g6_succeed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g6_succeed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g6_succeed_tbl:
	pop rdi
	pop rsi
	mov rax,1
	ret
_g6_failed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g6_failed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g6_failed_tbl:
	pop rdi
	pop rsi
	mov rax,0
	ret
_g5_etr_tbl:
	push QWORD 1
	jmp _g5_tbl
g5:
_g5:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_g5_tbl:
_g5_u0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,194
	jnz _g5_u0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,167
	jnz _g5_u0_failed
	add rsi,2
_g5_u0_succeed:
	pop r8
	jmp _g5_succeed
_g5_u0_failed:
	pop rsi
	jmp _g5_failed
_g5_succeed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g5_succeed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g5_succeed_tbl:
	pop rdi
	pop rsi
	mov rax,1
	ret
_g5_failed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g5_failed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g5_failed_tbl:
	pop rdi
	pop rsi
	mov rax,0
	ret
_g4_etr_tbl:
	push QWORD 1
	jmp _g4_tbl
g4:
_g4:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_g4_tbl:
_g4_nl:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,10
	jnz _g4_nl_failed
	add rsi,1
_g4_nl_succeed:
	pop r8
	jmp _g4_succeed
_g4_nl_failed:
	pop rsi
	jmp _g4_failed
_g4_succeed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g4_succeed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g4_succeed_tbl:
	pop rdi
	pop rsi
	mov rax,1
	ret
_g4_failed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g4_failed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g4_failed_tbl:
	pop rdi
	pop rsi
	mov rax,0
	ret
_g3_etr_tbl:
	push QWORD 1
	jmp _g3_tbl
g3:
_g3:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_g3_tbl:
_g3_r4:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,74
	jnz _g3_r4_failed
	add rsi,1
	call _g3_etr_tbl
_g3_r4_succeed:
	pop r8
	jmp _g3_succeed
_g3_r4_failed:
	pop rsi
_g3_r5:
	push rsi
_g3_r5_succeed:
	pop r8
	jmp _g3_succeed
_g3_r5_failed:
	pop rsi
	jmp _g3_failed
_g3_succeed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g3_succeed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g3_succeed_tbl:
	pop rdi
	pop rsi
	mov rax,1
	ret
_g3_failed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g3_failed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g3_failed_tbl:
	pop rdi
	pop rsi
	mov rax,0
	ret
_g1_etr_tbl:
	push QWORD 1
	jmp _g1_tbl
g1:
_g1:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_g1_tbl:
_g1_r3:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,88
	jnz _g1_r3_failed
	add rsi,1
	call _g0_etr_tbl
_g1_r3_succeed:
	pop r8
	jmp _g1_succeed
_g1_r3_failed:
	pop rsi
	jmp _g1_failed
_g1_succeed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g1_succeed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g1_succeed_tbl:
	pop rdi
	pop rsi
	mov rax,1
	ret
_g1_failed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g1_failed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g1_failed_tbl:
	pop rdi
	pop rsi
	mov rax,0
	ret
_g0_etr_tbl:
	push QWORD 1
	jmp _g0_tbl
g0:
_g0:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_g0_tbl:
_g0_r0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,72
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,101
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,108
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,108
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+4]
	cmp r11,111
	jnz _g0_r0_failed
	add rsi,5
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,87
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,111
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,114
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,108
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+4]
	cmp r11,100
	jnz _g0_r0_failed
	add rsi,5
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,33
	jnz _g0_r0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,33
	jnz _g0_r0_failed
	add rsi,2
_g0_r0_succeed:
	pop r8
	jmp _g0_succeed
_g0_r0_failed:
	pop rsi
_g0_r1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,72
	jnz _g0_r1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,111
	jnz _g0_r1_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,111
	jnz _g0_r1_failed
	add rsi,3
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,32
	jnz _g0_r1_failed
	add rsi,1
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,66
	jnz _g0_r1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,97
	jnz _g0_r1_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,97
	jnz _g0_r1_failed
	add rsi,3
_g0_r1_succeed:
	pop r8
	jmp _g0_succeed
_g0_r1_failed:
	pop rsi
_g0_r2:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,82
	jnz _g0_r2_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,114
	jnz _g0_r2_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,114
	jnz _g0_r2_failed
	add rsi,3
	call _g0_etr_tbl
_g0_r2_succeed:
	pop r8
	jmp _g0_succeed
_g0_r2_failed:
	pop rsi
	jmp _g0_failed
_g0_succeed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g0_succeed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g0_succeed_tbl:
	pop rdi
	pop rsi
	mov rax,1
	ret
_g0_failed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _g0_failed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_g0_failed_tbl:
	pop rdi
	pop rsi
	mov rax,0
	ret
_dgt_etr_tbl:
	push QWORD 1
	jmp _dgt_tbl
dgt:
_dgt:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_dgt_tbl:
	jmp _dgt_failed
_dgt_succeed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _dgt_succeed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_dgt_succeed_tbl:
	pop rdi
	pop rsi
	mov rax,1
	ret
_dgt_failed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _dgt_failed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_dgt_failed_tbl:
	pop rdi
	pop rsi
	mov rax,0
	ret
_chr_etr_tbl:
	push QWORD 1
	jmp _chr_tbl
chr:
_chr:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_chr_tbl:
	jmp _chr_failed
_chr_succeed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _chr_succeed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],1
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_chr_succeed_tbl:
	pop rdi
	pop rsi
	mov rax,1
	ret
_chr_failed:
	pop rbx
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
	cmp rbx,0
	jnz _chr_failed_tbl
	mov rdi,3
	call mlc
	mov rsi,[rax]
	btr rsi,0
	mov [rax],rsi
	mov QWORD [rax+8*3],0
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
_chr_failed_tbl:
	pop rdi
	pop rsi
	mov rax,0
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
	_dyn_g6:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_g5:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_g4:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_g3:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_g1:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_g0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_chr:
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
	cst_stg_78: db 65,65,194,167,194,167,194,167,0,0,0,0,0,0,0,0
	cst_stg_42: db 10,0,0,0,0,0,0,0
	cst_stg_6: db 194,167,0,0,0,0,0,0
