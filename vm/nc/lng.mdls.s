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
	call f0
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
f0:
; 	|» {  }
	jz _f0
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
jmp _f0
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_f0:
; 	» "\194\167\194\167 test \194\167\194\167." |~ 0' : ℙ
;push_reg
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_1+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_1+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,1
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,i0 : ,ℙ
; emt_ptn_crt_ptn 0',i0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_2
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_3
emt_set_ptn_0_lb_2:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_3:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_4
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_4:
; 	» 0xr0 |~ 0' : r64
	mov QWORD r10,0x0
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,r0 : ,r64
; emt_ptn_crt_ptn 0',r0
; emt_set_ptn 2'
; unboxed
	mov r10,r8
; ; emt_dec_ptn 0'
; unboxed
; 	def_mdl { 1' 2' } ⊢ { 0' 1' 2' } : { ℙ r64 def_mdl }
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
	bts r12,3
	mov r11,r9
	bt r9,1
	jc lb_8
	and r12,~0b1000
lb_8:
; emt_ptn_set_ptn { 3' 2' },{ 0' 1' }
; emt_ptn_set_ptn 3',0'
; emt_set_ptn 0'
; unknown
	bt r12,3
	jc emt_set_ptn_0_lb_9
	push rdi
	mov rdi,r11
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_10
emt_set_ptn_0_lb_9:
	mov r8,r11
	or r12,0b1
emt_set_ptn_1_lb_10:
; emt_ptn_set_ptn 2',1'
; emt_set_ptn 1'
; unboxed
	mov r9,r10
; ; emt_dec_ptn { 3' 2' }
; unboxed
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_14
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_14:
	call _def_mdl
	mov QWORD [tmp],rax
	jc call_c_lb_15
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
	jc emt_set_ptn_0_lb_24
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_25
emt_set_ptn_0_lb_24:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_25:
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
	jc emt_set_ptn_0_lb_28
	push rdi
	mov rdi,rbx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_29
emt_set_ptn_0_lb_28:
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_lb_29:
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
	jmp call_nc_lb_16
call_c_lb_15:
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
	jc emt_set_ptn_0_lb_17
	push rdi
	mov rdi,rbx
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_18
emt_set_ptn_0_lb_17:
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_lb_18:
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
	jc emt_set_ptn_0_lb_21
	push rdi
	mov rdi,rbx
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_22
emt_set_ptn_0_lb_21:
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_lb_22:
	pop rbx
call_nc_lb_16:
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
	jc emt_get_crt_ptn_0_lb_35
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_36
emt_get_crt_ptn_0_lb_35:
; unboxed
	stc
emt_get_crt_ptn_1_lb_36:
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
	jc ret_lb_37
	push r11
; ; emt_dec_ptn { 0' 1' 2' }
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_30
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
emt_dec_ptn_0_lb_30:
; unboxed
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_32
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
emt_dec_ptn_0_lb_32:
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_lb_37:
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
	imul rcx,47
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	ret
_exp_etr_tbl:
	push QWORD 1
	jmp _exp_tbl
exp:
_exp:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_exp_tbl:
_exp_exp_0:
	push rsi
	call _cst_etr_tbl
	cmp rax,0
	jz _exp_exp_0_failed
_exp_exp_0_succeed:
	pop r8
	jmp _exp_succeed
_exp_exp_0_failed:
	pop rsi
_exp_exp_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _exp_exp_1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,159
	jnz _exp_exp_1_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,166
	jnz _exp_exp_1_failed
	add rsi,3
_grm_lst_51:
	call _exp_etr_tbl
	cmp rax,0
	jz _grm_lst_52
	jmp _grm_lst_51
_grm_lst_52:
	mov rax,1
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _exp_exp_1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,159
	jnz _exp_exp_1_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,167
	jnz _exp_exp_1_failed
	add rsi,3
_exp_exp_1_succeed:
	pop r8
	jmp _exp_succeed
_exp_exp_1_failed:
	pop rsi
_exp_exp_2:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _exp_exp_2_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,128
	jnz _exp_exp_2_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,185
	jnz _exp_exp_2_failed
	add rsi,3
_grm_lst_43:
	call _exp_etr_tbl
_grm_lst_44:
	mov rax,1
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _exp_exp_2_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,128
	jnz _exp_exp_2_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,186
	jnz _exp_exp_2_failed
	add rsi,3
_exp_exp_2_succeed:
	pop r8
	jmp _exp_succeed
_exp_exp_2_failed:
	pop rsi
	jmp _exp_failed
_exp_succeed:
	pop rbx
	cmp rbx,0
	jnz _exp_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_exp_succeed_tbl:
	mov rax,1
	ret
_exp_failed:
	pop rbx
	cmp rbx,0
	jnz _exp_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_exp_failed_tbl:
	mov rax,0
	ret
_reg_etr_tbl:
	push QWORD 1
	jmp _reg_tbl
reg:
_reg:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_reg_tbl:
_reg_reg_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,37
	jnz _reg_reg_0_failed
	add rsi,1
	call _name_etr_tbl
	cmp rax,0
	jz _reg_reg_0_failed
_reg_reg_0_succeed:
	pop r8
	jmp _reg_succeed
_reg_reg_0_failed:
	pop rsi
_reg_reg_1:
	push rsi
	call _name_etr_tbl
	cmp rax,0
	jz _reg_reg_1_failed
_reg_reg_1_succeed:
	pop r8
	jmp _reg_succeed
_reg_reg_1_failed:
	pop rsi
	jmp _reg_failed
_reg_succeed:
	pop rbx
	cmp rbx,0
	jnz _reg_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_reg_succeed_tbl:
	mov rax,1
	ret
_reg_failed:
	pop rbx
	cmp rbx,0
	jnz _reg_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_reg_failed_tbl:
	mov rax,0
	ret
_reg_ptn_etr_tbl:
	push QWORD 1
	jmp _reg_ptn_tbl
reg_ptn:
_reg_ptn:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_reg_ptn_tbl:
_reg_ptn_reg_ptn_0:
	push rsi
	call _reg_etr_tbl
	cmp rax,0
	jz _reg_ptn_reg_ptn_0_failed
_reg_ptn_reg_ptn_0_succeed:
	pop r8
	jmp _reg_ptn_succeed
_reg_ptn_reg_ptn_0_failed:
	pop rsi
_reg_ptn_reg_ptn_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz _reg_ptn_reg_ptn_1_failed
	add rsi,1
_reg_ptn_reg_ptn_1_succeed:
	pop r8
	jmp _reg_ptn_succeed
_reg_ptn_reg_ptn_1_failed:
	pop rsi
_reg_ptn_reg_ptn_2:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,123
	jnz _reg_ptn_reg_ptn_2_failed
	add rsi,1
_grm_lst_81:
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _grm_lst_82
	jmp _grm_lst_81
_grm_lst_82:
	mov rax,1
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,125
	jnz _reg_ptn_reg_ptn_2_failed
	add rsi,1
_reg_ptn_reg_ptn_2_succeed:
	pop r8
	jmp _reg_ptn_succeed
_reg_ptn_reg_ptn_2_failed:
	pop rsi
_reg_ptn_reg_ptn_3:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,123
	jnz _reg_ptn_reg_ptn_3_failed
	add rsi,1
_grm_lst_69:
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _grm_lst_70
	jmp _grm_lst_69
_grm_lst_70:
	mov rax,1
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,60
	jnz _reg_ptn_reg_ptn_3_failed
	add rsi,1
	call _reg_etr_tbl
	cmp rax,0
	jz _reg_ptn_reg_ptn_3_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,125
	jnz _reg_ptn_reg_ptn_3_failed
	add rsi,1
_reg_ptn_reg_ptn_3_succeed:
	pop r8
	jmp _reg_ptn_succeed
_reg_ptn_reg_ptn_3_failed:
	pop rsi
	jmp _reg_ptn_failed
_reg_ptn_succeed:
	pop rbx
	cmp rbx,0
	jnz _reg_ptn_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_reg_ptn_succeed_tbl:
	mov rax,1
	ret
_reg_ptn_failed:
	pop rbx
	cmp rbx,0
	jnz _reg_ptn_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_reg_ptn_failed_tbl:
	mov rax,0
	ret
_reg_ptn_tl_etr_tbl:
	push QWORD 1
	jmp _reg_ptn_tl_tbl
reg_ptn_tl:
_reg_ptn_tl:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_reg_ptn_tl_tbl:
_reg_ptn_tl_reg_ptn_tl_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,44
	jnz _reg_ptn_tl_reg_ptn_tl_0_failed
	add rsi,1
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _reg_ptn_tl_reg_ptn_tl_0_failed
	call _reg_ptn_tl_etr_tbl
	cmp rax,0
	jz _reg_ptn_tl_reg_ptn_tl_0_failed
_reg_ptn_tl_reg_ptn_tl_0_succeed:
	pop r8
	jmp _reg_ptn_tl_succeed
_reg_ptn_tl_reg_ptn_tl_0_failed:
	pop rsi
	jmp _reg_ptn_tl_failed
_reg_ptn_tl_succeed:
	pop rbx
	cmp rbx,0
	jnz _reg_ptn_tl_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_reg_ptn_tl_succeed_tbl:
	mov rax,1
	ret
_reg_ptn_tl_failed:
	pop rbx
	cmp rbx,0
	jnz _reg_ptn_tl_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_reg_ptn_tl_failed_tbl:
	mov rax,0
	ret
_ir_line_etr_tbl:
	push QWORD 1
	jmp _ir_line_tbl
ir_line:
_ir_line:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_ir_line_tbl:
_ir_line_ir_line_0:
	push rsi
	call _name_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_0_failed
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_0_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ir_line_ir_line_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,138
	jnz _ir_line_ir_line_0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,162
	jnz _ir_line_ir_line_0_failed
	add rsi,3
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_0_failed
_ir_line_ir_line_0_succeed:
	pop r8
	jmp _ir_line_succeed
_ir_line_ir_line_0_failed:
	pop rsi
_ir_line_ir_line_1:
	push rsi
	call _name_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_1_failed
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_1_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,124
	jnz _ir_line_ir_line_1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,226
	jnz _ir_line_ir_line_1_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,138
	jnz _ir_line_ir_line_1_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,162
	jnz _ir_line_ir_line_1_failed
	add rsi,4
_ir_line_ir_line_1_succeed:
	pop r8
	jmp _ir_line_succeed
_ir_line_ir_line_1_failed:
	pop rsi
_ir_line_ir_line_2:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,194
	jnz _ir_line_ir_line_2_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,187
	jnz _ir_line_ir_line_2_failed
	add rsi,2
	call _exp_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_2_failed
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_2_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ir_line_ir_line_2_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,138
	jnz _ir_line_ir_line_2_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,162
	jnz _ir_line_ir_line_2_failed
	add rsi,3
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_2_failed
_ir_line_ir_line_2_succeed:
	pop r8
	jmp _ir_line_succeed
_ir_line_ir_line_2_failed:
	pop rsi
_ir_line_ir_line_3:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ir_line_ir_line_3_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,151
	jnz _ir_line_ir_line_3_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,130
	jnz _ir_line_ir_line_3_failed
	add rsi,3
	call _reg_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_3_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,44
	jnz _ir_line_ir_line_3_failed
	add rsi,1
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_3_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ir_line_ir_line_3_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,138
	jnz _ir_line_ir_line_3_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,162
	jnz _ir_line_ir_line_3_failed
	add rsi,3
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_3_failed
_ir_line_ir_line_3_succeed:
	pop r8
	jmp _ir_line_succeed
_ir_line_ir_line_3_failed:
	pop rsi
_ir_line_ir_line_4:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,124
	jnz _ir_line_ir_line_4_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,226
	jnz _ir_line_ir_line_4_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,151
	jnz _ir_line_ir_line_4_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,130
	jnz _ir_line_ir_line_4_failed
	add rsi,4
	call _reg_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_4_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,44
	jnz _ir_line_ir_line_4_failed
	add rsi,1
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_4_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,124
	jnz _ir_line_ir_line_4_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,226
	jnz _ir_line_ir_line_4_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,138
	jnz _ir_line_ir_line_4_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,162
	jnz _ir_line_ir_line_4_failed
	add rsi,4
_ir_line_ir_line_4_succeed:
	pop r8
	jmp _ir_line_succeed
_ir_line_ir_line_4_failed:
	pop rsi
_ir_line_ir_line_5:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,36
	jnz _ir_line_ir_line_5_failed
	add rsi,1
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_5_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ir_line_ir_line_5_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,138
	jnz _ir_line_ir_line_5_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,162
	jnz _ir_line_ir_line_5_failed
	add rsi,3
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_line_ir_line_5_failed
_grm_lst_107:
	call _reg_ptn_tl_etr_tbl
	cmp rax,0
	jz _grm_lst_108
	jmp _grm_lst_107
_grm_lst_108:
	mov rax,1
_ir_line_ir_line_5_succeed:
	pop r8
	jmp _ir_line_succeed
_ir_line_ir_line_5_failed:
	pop rsi
	jmp _ir_line_failed
_ir_line_succeed:
	pop rbx
	cmp rbx,0
	jnz _ir_line_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_ir_line_succeed_tbl:
	mov rax,1
	ret
_ir_line_failed:
	pop rbx
	cmp rbx,0
	jnz _ir_line_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_ir_line_failed_tbl:
	mov rax,0
	ret
_cst_etr_tbl:
	push QWORD 1
	jmp _cst_tbl
cst:
_cst:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_cst_tbl:
_cst_cst_0:
	push rsi
	call _str_etr_tbl
	cmp rax,0
	jz _cst_cst_0_failed
_cst_cst_0_succeed:
	pop r8
	jmp _cst_succeed
_cst_cst_0_failed:
	pop rsi
_cst_cst_1:
	push rsi
	call _name_etr_tbl
	cmp rax,0
	jz _cst_cst_1_failed
_cst_cst_1_succeed:
	pop r8
	jmp _cst_succeed
_cst_cst_1_failed:
	pop rsi
	jmp _cst_failed
_cst_succeed:
	pop rbx
	cmp rbx,0
	jnz _cst_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_cst_succeed_tbl:
	mov rax,1
	ret
_cst_failed:
	pop rbx
	cmp rbx,0
	jnz _cst_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_cst_failed_tbl:
	mov rax,0
	ret
_mtc_ptn_etr_tbl:
	push QWORD 1
	jmp _mtc_ptn_tbl
mtc_ptn:
_mtc_ptn:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_mtc_ptn_tbl:
_mtc_ptn_mtc_ptn_0:
	push rsi
	call _var_etr_tbl
	cmp rax,0
	jz _mtc_ptn_mtc_ptn_0_failed
_mtc_ptn_mtc_ptn_0_succeed:
	pop r8
	jmp _mtc_ptn_succeed
_mtc_ptn_mtc_ptn_0_failed:
	pop rsi
_mtc_ptn_mtc_ptn_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz _mtc_ptn_mtc_ptn_1_failed
	add rsi,1
_mtc_ptn_mtc_ptn_1_succeed:
	pop r8
	jmp _mtc_ptn_succeed
_mtc_ptn_mtc_ptn_1_failed:
	pop rsi
_mtc_ptn_mtc_ptn_2:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,123
	jnz _mtc_ptn_mtc_ptn_2_failed
	add rsi,1
_grm_lst_165:
	call _mtc_ptn_etr_tbl
	cmp rax,0
	jz _grm_lst_166
	jmp _grm_lst_165
_grm_lst_166:
	mov rax,1
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,125
	jnz _mtc_ptn_mtc_ptn_2_failed
	add rsi,1
_mtc_ptn_mtc_ptn_2_succeed:
	pop r8
	jmp _mtc_ptn_succeed
_mtc_ptn_mtc_ptn_2_failed:
	pop rsi
	jmp _mtc_ptn_failed
_mtc_ptn_succeed:
	pop rbx
	cmp rbx,0
	jnz _mtc_ptn_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_mtc_ptn_succeed_tbl:
	mov rax,1
	ret
_mtc_ptn_failed:
	pop rbx
	cmp rbx,0
	jnz _mtc_ptn_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_mtc_ptn_failed_tbl:
	mov rax,0
	ret
_mtc_eq_etr_tbl:
	push QWORD 1
	jmp _mtc_eq_tbl
mtc_eq:
_mtc_eq:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_mtc_eq_tbl:
_mtc_eq_mtc_eq_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,44
	jnz _mtc_eq_mtc_eq_0_failed
	add rsi,1
	call _var_etr_tbl
	cmp rax,0
	jz _mtc_eq_mtc_eq_0_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,61
	jnz _mtc_eq_mtc_eq_0_failed
	add rsi,1
	call _name_etr_tbl
	cmp rax,0
	jz _mtc_eq_mtc_eq_0_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _mtc_eq_mtc_eq_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,151
	jnz _mtc_eq_mtc_eq_0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,130
	jnz _mtc_eq_mtc_eq_0_failed
	add rsi,3
	call _mtc_ptn_etr_tbl
	cmp rax,0
	jz _mtc_eq_mtc_eq_0_failed
_mtc_eq_mtc_eq_0_succeed:
	pop r8
	jmp _mtc_eq_succeed
_mtc_eq_mtc_eq_0_failed:
	pop rsi
_mtc_eq_mtc_eq_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,44
	jnz _mtc_eq_mtc_eq_1_failed
	add rsi,1
	call _var_etr_tbl
	cmp rax,0
	jz _mtc_eq_mtc_eq_1_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,61
	jnz _mtc_eq_mtc_eq_1_failed
	add rsi,1
	call _cst_etr_tbl
	cmp rax,0
	jz _mtc_eq_mtc_eq_1_failed
_mtc_eq_mtc_eq_1_succeed:
	pop r8
	jmp _mtc_eq_succeed
_mtc_eq_mtc_eq_1_failed:
	pop rsi
	jmp _mtc_eq_failed
_mtc_eq_succeed:
	pop rbx
	cmp rbx,0
	jnz _mtc_eq_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_mtc_eq_succeed_tbl:
	mov rax,1
	ret
_mtc_eq_failed:
	pop rbx
	cmp rbx,0
	jnz _mtc_eq_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_mtc_eq_failed_tbl:
	mov rax,0
	ret
_ir_mtcs_etr_tbl:
	push QWORD 1
	jmp _ir_mtcs_tbl
ir_mtcs:
_ir_mtcs:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_ir_mtcs_tbl:
_ir_mtcs_ir_mtcs_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ir_mtcs_ir_mtcs_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,136
	jnz _ir_mtcs_ir_mtcs_0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,144
	jnz _ir_mtcs_ir_mtcs_0_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,46
	jnz _ir_mtcs_ir_mtcs_0_failed
	mov r11b,[rdi+rsi+8*1+4]
	cmp r11,92
	jnz _ir_mtcs_ir_mtcs_0_failed
	add rsi,5
	call _mtc_ptn_etr_tbl
	cmp rax,0
	jz _ir_mtcs_ir_mtcs_0_failed
_grm_lst_213:
	call _mtc_eq_etr_tbl
	cmp rax,0
	jz _grm_lst_214
	jmp _grm_lst_213
_grm_lst_214:
	mov rax,1
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ir_mtcs_ir_mtcs_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,138
	jnz _ir_mtcs_ir_mtcs_0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,162
	jnz _ir_mtcs_ir_mtcs_0_failed
	add rsi,3
	call _ir_lines_etr_tbl
	cmp rax,0
	jz _ir_mtcs_ir_mtcs_0_failed
_ir_mtcs_ir_mtcs_0_succeed:
	pop r8
	jmp _ir_mtcs_succeed
_ir_mtcs_ir_mtcs_0_failed:
	pop rsi
_ir_mtcs_ir_mtcs_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ir_mtcs_ir_mtcs_1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,136
	jnz _ir_mtcs_ir_mtcs_1_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,144
	jnz _ir_mtcs_ir_mtcs_1_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,92
	jnz _ir_mtcs_ir_mtcs_1_failed
	add rsi,4
	call _mtc_ptn_etr_tbl
	cmp rax,0
	jz _ir_mtcs_ir_mtcs_1_failed
_grm_lst_201:
	call _mtc_eq_etr_tbl
	cmp rax,0
	jz _grm_lst_202
	jmp _grm_lst_201
_grm_lst_202:
	mov rax,1
	call _ir_lines_etr_tbl
	cmp rax,0
	jz _ir_mtcs_ir_mtcs_1_failed
	call _ir_mtcs_etr_tbl
	cmp rax,0
	jz _ir_mtcs_ir_mtcs_1_failed
_ir_mtcs_ir_mtcs_1_succeed:
	pop r8
	jmp _ir_mtcs_succeed
_ir_mtcs_ir_mtcs_1_failed:
	pop rsi
	jmp _ir_mtcs_failed
_ir_mtcs_succeed:
	pop rbx
	cmp rbx,0
	jnz _ir_mtcs_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_ir_mtcs_succeed_tbl:
	mov rax,1
	ret
_ir_mtcs_failed:
	pop rbx
	cmp rbx,0
	jnz _ir_mtcs_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_ir_mtcs_failed_tbl:
	mov rax,0
	ret
_ir_lines_etr_tbl:
	push QWORD 1
	jmp _ir_lines_tbl
ir_lines:
_ir_lines:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_ir_lines_tbl:
_ir_lines_ir_lines_0:
	push rsi
	call _ir_line_etr_tbl
	cmp rax,0
	jz _ir_lines_ir_lines_0_failed
	call _ir_lines_etr_tbl
	cmp rax,0
	jz _ir_lines_ir_lines_0_failed
_ir_lines_ir_lines_0_succeed:
	pop r8
	jmp _ir_lines_succeed
_ir_lines_ir_lines_0_failed:
	pop rsi
_ir_lines_ir_lines_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,63
	jnz _ir_lines_ir_lines_1_failed
	add rsi,1
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_lines_ir_lines_1_failed
	call _ir_mtcs_etr_tbl
	cmp rax,0
	jz _ir_lines_ir_lines_1_failed
_ir_lines_ir_lines_1_succeed:
	pop r8
	jmp _ir_lines_succeed
_ir_lines_ir_lines_1_failed:
	pop rsi
_ir_lines_ir_lines_2:
	push rsi
	call _name_etr_tbl
	cmp rax,0
	jz _ir_lines_ir_lines_2_failed
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_lines_ir_lines_2_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ir_lines_ir_lines_2_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,138
	jnz _ir_lines_ir_lines_2_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,162
	jnz _ir_lines_ir_lines_2_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,124
	jnz _ir_lines_ir_lines_2_failed
	add rsi,4
_ir_lines_ir_lines_2_succeed:
	pop r8
	jmp _ir_lines_succeed
_ir_lines_ir_lines_2_failed:
	pop rsi
_ir_lines_ir_lines_3:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ir_lines_ir_lines_3_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,151
	jnz _ir_lines_ir_lines_3_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,130
	jnz _ir_lines_ir_lines_3_failed
	add rsi,3
	call _reg_etr_tbl
	cmp rax,0
	jz _ir_lines_ir_lines_3_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,44
	jnz _ir_lines_ir_lines_3_failed
	add rsi,1
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_lines_ir_lines_3_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ir_lines_ir_lines_3_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,138
	jnz _ir_lines_ir_lines_3_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,162
	jnz _ir_lines_ir_lines_3_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,124
	jnz _ir_lines_ir_lines_3_failed
	add rsi,4
_ir_lines_ir_lines_3_succeed:
	pop r8
	jmp _ir_lines_succeed
_ir_lines_ir_lines_3_failed:
	pop rsi
_ir_lines_ir_lines_4:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ir_lines_ir_lines_4_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,136
	jnz _ir_lines_ir_lines_4_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,142
	jnz _ir_lines_ir_lines_4_failed
	add rsi,3
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _ir_lines_ir_lines_4_failed
_ir_lines_ir_lines_4_succeed:
	pop r8
	jmp _ir_lines_succeed
_ir_lines_ir_lines_4_failed:
	pop rsi
	jmp _ir_lines_failed
_ir_lines_succeed:
	pop rbx
	cmp rbx,0
	jnz _ir_lines_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_ir_lines_succeed_tbl:
	mov rax,1
	ret
_ir_lines_failed:
	pop rbx
	cmp rbx,0
	jnz _ir_lines_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_ir_lines_failed_tbl:
	mov rax,0
	ret
_glb_etr_clq_etr_tbl:
	push QWORD 1
	jmp _glb_etr_clq_tbl
glb_etr_clq:
_glb_etr_clq:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_glb_etr_clq_tbl:
_glb_etr_clq_glb_etr_clq_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,64
	jnz _glb_etr_clq_glb_etr_clq_0_failed
	add rsi,1
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,46
	jnz _glb_etr_clq_glb_etr_clq_0_failed
	add rsi,1
	call _name_etr_tbl
	cmp rax,0
	jz _glb_etr_clq_glb_etr_clq_0_failed
	call _ir_lines_etr_tbl
	cmp rax,0
	jz _glb_etr_clq_glb_etr_clq_0_failed
_glb_etr_clq_glb_etr_clq_0_succeed:
	pop r8
	jmp _glb_etr_clq_succeed
_glb_etr_clq_glb_etr_clq_0_failed:
	pop rsi
	jmp _glb_etr_clq_failed
_glb_etr_clq_succeed:
	pop rbx
	cmp rbx,0
	jnz _glb_etr_clq_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_glb_etr_clq_succeed_tbl:
	mov rax,1
	ret
_glb_etr_clq_failed:
	pop rbx
	cmp rbx,0
	jnz _glb_etr_clq_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_glb_etr_clq_failed_tbl:
	mov rax,0
	ret
_glb_etr_etr_tbl:
	push QWORD 1
	jmp _glb_etr_tbl
glb_etr:
_glb_etr:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_glb_etr_tbl:
_glb_etr_glb_etr_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,194
	jnz _glb_etr_glb_etr_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,167
	jnz _glb_etr_glb_etr_0_failed
	add rsi,2
	call _name_etr_tbl
	cmp rax,0
	jz _glb_etr_glb_etr_0_failed
	call _reg_ptn_etr_tbl
	cmp rax,0
	jz _glb_etr_glb_etr_0_failed
	call _ir_lines_etr_tbl
	cmp rax,0
	jz _glb_etr_glb_etr_0_failed
_glb_etr_glb_etr_0_succeed:
	pop r8
	jmp _glb_etr_succeed
_glb_etr_glb_etr_0_failed:
	pop rsi
_glb_etr_glb_etr_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,194
	jnz _glb_etr_glb_etr_1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,167
	jnz _glb_etr_glb_etr_1_failed
	add rsi,2
	call _glb_etr_clq_etr_tbl
	cmp rax,0
	jz _glb_etr_glb_etr_1_failed
_grm_lst_266:
	call _glb_etr_clq_etr_tbl
	cmp rax,0
	jz _grm_lst_267
	jmp _grm_lst_266
_grm_lst_267:
	mov rax,1
_glb_etr_glb_etr_1_succeed:
	pop r8
	jmp _glb_etr_succeed
_glb_etr_glb_etr_1_failed:
	pop rsi
	jmp _glb_etr_failed
_glb_etr_succeed:
	pop rbx
	cmp rbx,0
	jnz _glb_etr_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_glb_etr_succeed_tbl:
	mov rax,1
	ret
_glb_etr_failed:
	pop rbx
	cmp rbx,0
	jnz _glb_etr_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_glb_etr_failed_tbl:
	mov rax,0
	ret
_typ_atm_etr_tbl:
	push QWORD 1
	jmp _typ_atm_tbl
typ_atm:
_typ_atm:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_typ_atm_tbl:
_typ_atm_typ_atm_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,40
	jnz _typ_atm_typ_atm_0_failed
	add rsi,1
	call _typ_etr_tbl
	cmp rax,0
	jz _typ_atm_typ_atm_0_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,41
	jnz _typ_atm_typ_atm_0_failed
	add rsi,1
_typ_atm_typ_atm_0_succeed:
	pop r8
	jmp _typ_atm_succeed
_typ_atm_typ_atm_0_failed:
	pop rsi
_typ_atm_typ_atm_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,123
	jnz _typ_atm_typ_atm_1_failed
	add rsi,1
_grm_lst_299:
	call _typ_etr_tbl
	cmp rax,0
	jz _grm_lst_300
	jmp _grm_lst_299
_grm_lst_300:
	mov rax,1
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,125
	jnz _typ_atm_typ_atm_1_failed
	add rsi,1
_typ_atm_typ_atm_1_succeed:
	pop r8
	jmp _typ_atm_succeed
_typ_atm_typ_atm_1_failed:
	pop rsi
_typ_atm_typ_atm_2:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _typ_atm_typ_atm_2_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,128
	jnz _typ_atm_typ_atm_2_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,185
	jnz _typ_atm_typ_atm_2_failed
	add rsi,3
	call _typ_etr_tbl
	cmp rax,0
	jz _typ_atm_typ_atm_2_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _typ_atm_typ_atm_2_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,128
	jnz _typ_atm_typ_atm_2_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,186
	jnz _typ_atm_typ_atm_2_failed
	add rsi,3
_typ_atm_typ_atm_2_succeed:
	pop r8
	jmp _typ_atm_succeed
_typ_atm_typ_atm_2_failed:
	pop rsi
_typ_atm_typ_atm_3:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _typ_atm_typ_atm_3_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,159
	jnz _typ_atm_typ_atm_3_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,166
	jnz _typ_atm_typ_atm_3_failed
	add rsi,3
	call _typ_etr_tbl
	cmp rax,0
	jz _typ_atm_typ_atm_3_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _typ_atm_typ_atm_3_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,159
	jnz _typ_atm_typ_atm_3_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,167
	jnz _typ_atm_typ_atm_3_failed
	add rsi,3
_typ_atm_typ_atm_3_succeed:
	pop r8
	jmp _typ_atm_succeed
_typ_atm_typ_atm_3_failed:
	pop rsi
_typ_atm_typ_atm_4:
	push rsi
	call _var_etr_tbl
	cmp rax,0
	jz _typ_atm_typ_atm_4_failed
_typ_atm_typ_atm_4_succeed:
	pop r8
	jmp _typ_atm_succeed
_typ_atm_typ_atm_4_failed:
	pop rsi
_typ_atm_typ_atm_5:
	push rsi
	call _name_etr_tbl
	cmp rax,0
	jz _typ_atm_typ_atm_5_failed
_typ_atm_typ_atm_5_succeed:
	pop r8
	jmp _typ_atm_succeed
_typ_atm_typ_atm_5_failed:
	pop rsi
_typ_atm_typ_atm_6:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz _typ_atm_typ_atm_6_failed
	add rsi,1
_typ_atm_typ_atm_6_succeed:
	pop r8
	jmp _typ_atm_succeed
_typ_atm_typ_atm_6_failed:
	pop rsi
	jmp _typ_atm_failed
_typ_atm_succeed:
	pop rbx
	cmp rbx,0
	jnz _typ_atm_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_atm_succeed_tbl:
	mov rax,1
	ret
_typ_atm_failed:
	pop rbx
	cmp rbx,0
	jnz _typ_atm_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_atm_failed_tbl:
	mov rax,0
	ret
_typ_app_tl_etr_tbl:
	push QWORD 1
	jmp _typ_app_tl_tbl
typ_app_tl:
_typ_app_tl:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_typ_app_tl_tbl:
_typ_app_tl_typ_app_tl_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _typ_app_tl_typ_app_tl_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,151
	jnz _typ_app_tl_typ_app_tl_0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,130
	jnz _typ_app_tl_typ_app_tl_0_failed
	add rsi,3
	call _typ_atm_etr_tbl
	cmp rax,0
	jz _typ_app_tl_typ_app_tl_0_failed
_typ_app_tl_typ_app_tl_0_succeed:
	pop r8
	jmp _typ_app_tl_succeed
_typ_app_tl_typ_app_tl_0_failed:
	pop rsi
	jmp _typ_app_tl_failed
_typ_app_tl_succeed:
	pop rbx
	cmp rbx,0
	jnz _typ_app_tl_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_app_tl_succeed_tbl:
	mov rax,1
	ret
_typ_app_tl_failed:
	pop rbx
	cmp rbx,0
	jnz _typ_app_tl_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_app_tl_failed_tbl:
	mov rax,0
	ret
_typ_app_etr_tbl:
	push QWORD 1
	jmp _typ_app_tbl
typ_app:
_typ_app:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_typ_app_tbl:
_typ_app_typ_app_0:
	push rsi
	call _typ_atm_etr_tbl
	cmp rax,0
	jz _typ_app_typ_app_0_failed
_grm_lst_319:
	call _typ_app_tl_etr_tbl
	cmp rax,0
	jz _grm_lst_320
	jmp _grm_lst_319
_grm_lst_320:
	mov rax,1
_typ_app_typ_app_0_succeed:
	pop r8
	jmp _typ_app_succeed
_typ_app_typ_app_0_failed:
	pop rsi
	jmp _typ_app_failed
_typ_app_succeed:
	pop rbx
	cmp rbx,0
	jnz _typ_app_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_app_succeed_tbl:
	mov rax,1
	ret
_typ_app_failed:
	pop rbx
	cmp rbx,0
	jnz _typ_app_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_app_failed_tbl:
	mov rax,0
	ret
_typ_vct_tl_etr_tbl:
	push QWORD 1
	jmp _typ_vct_tl_tbl
typ_vct_tl:
_typ_vct_tl:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_typ_vct_tl_tbl:
_typ_vct_tl_typ_vct_tl_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _typ_vct_tl_typ_vct_tl_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,151
	jnz _typ_vct_tl_typ_vct_tl_0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,131
	jnz _typ_vct_tl_typ_vct_tl_0_failed
	add rsi,3
	call _typ_app_etr_tbl
	cmp rax,0
	jz _typ_vct_tl_typ_vct_tl_0_failed
_typ_vct_tl_typ_vct_tl_0_succeed:
	pop r8
	jmp _typ_vct_tl_succeed
_typ_vct_tl_typ_vct_tl_0_failed:
	pop rsi
	jmp _typ_vct_tl_failed
_typ_vct_tl_succeed:
	pop rbx
	cmp rbx,0
	jnz _typ_vct_tl_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_vct_tl_succeed_tbl:
	mov rax,1
	ret
_typ_vct_tl_failed:
	pop rbx
	cmp rbx,0
	jnz _typ_vct_tl_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_vct_tl_failed_tbl:
	mov rax,0
	ret
_typ_vct_etr_tbl:
	push QWORD 1
	jmp _typ_vct_tbl
typ_vct:
_typ_vct:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_typ_vct_tbl:
_typ_vct_typ_vct_0:
	push rsi
	call _typ_app_etr_tbl
	cmp rax,0
	jz _typ_vct_typ_vct_0_failed
_grm_lst_331:
	call _typ_vct_tl_etr_tbl
	cmp rax,0
	jz _grm_lst_332
	jmp _grm_lst_331
_grm_lst_332:
	mov rax,1
_typ_vct_typ_vct_0_succeed:
	pop r8
	jmp _typ_vct_succeed
_typ_vct_typ_vct_0_failed:
	pop rsi
	jmp _typ_vct_failed
_typ_vct_succeed:
	pop rbx
	cmp rbx,0
	jnz _typ_vct_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_vct_succeed_tbl:
	mov rax,1
	ret
_typ_vct_failed:
	pop rbx
	cmp rbx,0
	jnz _typ_vct_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_vct_failed_tbl:
	mov rax,0
	ret
_typ_imp_tl_etr_tbl:
	push QWORD 1
	jmp _typ_imp_tl_tbl
typ_imp_tl:
_typ_imp_tl:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_typ_imp_tl_tbl:
_typ_imp_tl_typ_imp_tl_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _typ_imp_tl_typ_imp_tl_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,134
	jnz _typ_imp_tl_typ_imp_tl_0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,146
	jnz _typ_imp_tl_typ_imp_tl_0_failed
	add rsi,3
	call _typ_vct_etr_tbl
	cmp rax,0
	jz _typ_imp_tl_typ_imp_tl_0_failed
_typ_imp_tl_typ_imp_tl_0_succeed:
	pop r8
	jmp _typ_imp_tl_succeed
_typ_imp_tl_typ_imp_tl_0_failed:
	pop rsi
	jmp _typ_imp_tl_failed
_typ_imp_tl_succeed:
	pop rbx
	cmp rbx,0
	jnz _typ_imp_tl_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_imp_tl_succeed_tbl:
	mov rax,1
	ret
_typ_imp_tl_failed:
	pop rbx
	cmp rbx,0
	jnz _typ_imp_tl_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_imp_tl_failed_tbl:
	mov rax,0
	ret
_typ_imp_etr_tbl:
	push QWORD 1
	jmp _typ_imp_tbl
typ_imp:
_typ_imp:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_typ_imp_tbl:
_typ_imp_typ_imp_0:
	push rsi
	call _typ_vct_etr_tbl
	cmp rax,0
	jz _typ_imp_typ_imp_0_failed
_grm_lst_343:
	call _typ_imp_tl_etr_tbl
	cmp rax,0
	jz _grm_lst_344
	jmp _grm_lst_343
_grm_lst_344:
	mov rax,1
_typ_imp_typ_imp_0_succeed:
	pop r8
	jmp _typ_imp_succeed
_typ_imp_typ_imp_0_failed:
	pop rsi
	jmp _typ_imp_failed
_typ_imp_succeed:
	pop rbx
	cmp rbx,0
	jnz _typ_imp_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_imp_succeed_tbl:
	mov rax,1
	ret
_typ_imp_failed:
	pop rbx
	cmp rbx,0
	jnz _typ_imp_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_imp_failed_tbl:
	mov rax,0
	ret
_typ_etr_tbl:
	push QWORD 1
	jmp _typ_tbl
typ:
_typ:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_typ_tbl:
_typ_typ_0:
	push rsi
	call _typ_imp_etr_tbl
	cmp rax,0
	jz _typ_typ_0_failed
_typ_typ_0_succeed:
	pop r8
	jmp _typ_succeed
_typ_typ_0_failed:
	pop rsi
	jmp _typ_failed
_typ_succeed:
	pop rbx
	cmp rbx,0
	jnz _typ_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_succeed_tbl:
	mov rax,1
	ret
_typ_failed:
	pop rbx
	cmp rbx,0
	jnz _typ_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_typ_failed_tbl:
	mov rax,0
	ret
_grm_atom_etr_tbl:
	push QWORD 1
	jmp _grm_atom_tbl
grm_atom:
_grm_atom:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_grm_atom_tbl:
_grm_atom_grm_atom_0:
	push rsi
	call _str_etr_tbl
	cmp rax,0
	jz _grm_atom_grm_atom_0_failed
_grm_atom_grm_atom_0_succeed:
	pop r8
	jmp _grm_atom_succeed
_grm_atom_grm_atom_0_failed:
	pop rsi
_grm_atom_grm_atom_1:
	push rsi
	call _name_etr_tbl
	cmp rax,0
	jz _grm_atom_grm_atom_1_failed
_grm_atom_grm_atom_1_succeed:
	pop r8
	jmp _grm_atom_succeed
_grm_atom_grm_atom_1_failed:
	pop rsi
	jmp _grm_atom_failed
_grm_atom_succeed:
	pop rbx
	cmp rbx,0
	jnz _grm_atom_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_grm_atom_succeed_tbl:
	mov rax,1
	ret
_grm_atom_failed:
	pop rbx
	cmp rbx,0
	jnz _grm_atom_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_grm_atom_failed_tbl:
	mov rax,0
	ret
_grm_ptn_etr_tbl:
	push QWORD 1
	jmp _grm_ptn_tbl
grm_ptn:
_grm_ptn:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_grm_ptn_tbl:
_grm_ptn_grm_ptn_0:
	push rsi
	call _grm_atom_etr_tbl
	cmp rax,0
	jz _grm_ptn_grm_ptn_0_failed
_grm_ptn_grm_ptn_0_succeed:
	pop r8
	jmp _grm_ptn_succeed
_grm_ptn_grm_ptn_0_failed:
	pop rsi
_grm_ptn_grm_ptn_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _grm_ptn_grm_ptn_1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,159
	jnz _grm_ptn_grm_ptn_1_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,166
	jnz _grm_ptn_grm_ptn_1_failed
	add rsi,3
	call _grm_atom_etr_tbl
	cmp rax,0
	jz _grm_ptn_grm_ptn_1_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _grm_ptn_grm_ptn_1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,159
	jnz _grm_ptn_grm_ptn_1_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,167
	jnz _grm_ptn_grm_ptn_1_failed
	add rsi,3
_grm_ptn_grm_ptn_1_succeed:
	pop r8
	jmp _grm_ptn_succeed
_grm_ptn_grm_ptn_1_failed:
	pop rsi
_grm_ptn_grm_ptn_2:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _grm_ptn_grm_ptn_2_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,128
	jnz _grm_ptn_grm_ptn_2_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,185
	jnz _grm_ptn_grm_ptn_2_failed
	add rsi,3
	call _grm_atom_etr_tbl
	cmp rax,0
	jz _grm_ptn_grm_ptn_2_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _grm_ptn_grm_ptn_2_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,128
	jnz _grm_ptn_grm_ptn_2_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,186
	jnz _grm_ptn_grm_ptn_2_failed
	add rsi,3
_grm_ptn_grm_ptn_2_succeed:
	pop r8
	jmp _grm_ptn_succeed
_grm_ptn_grm_ptn_2_failed:
	pop rsi
	jmp _grm_ptn_failed
_grm_ptn_succeed:
	pop rbx
	cmp rbx,0
	jnz _grm_ptn_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_grm_ptn_succeed_tbl:
	mov rax,1
	ret
_grm_ptn_failed:
	pop rbx
	cmp rbx,0
	jnz _grm_ptn_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_grm_ptn_failed_tbl:
	mov rax,0
	ret
_ord_etr_tbl:
	push QWORD 1
	jmp _ord_tbl
ord:
_ord:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_ord_tbl:
_ord_ord_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ord_ord_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,136
	jnz _ord_ord_0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,144
	jnz _ord_ord_0_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,42
	jnz _ord_ord_0_failed
	add rsi,4
_ord_ord_0_succeed:
	pop r8
	jmp _ord_succeed
_ord_ord_0_failed:
	pop rsi
_ord_ord_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _ord_ord_1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,136
	jnz _ord_ord_1_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,144
	jnz _ord_ord_1_failed
	add rsi,3
_ord_ord_1_succeed:
	pop r8
	jmp _ord_succeed
_ord_ord_1_failed:
	pop rsi
	jmp _ord_failed
_ord_succeed:
	pop rbx
	cmp rbx,0
	jnz _ord_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_ord_succeed_tbl:
	mov rax,1
	ret
_ord_failed:
	pop rbx
	cmp rbx,0
	jnz _ord_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_ord_failed_tbl:
	mov rax,0
	ret
_grm_rule_etr_tbl:
	push QWORD 1
	jmp _grm_rule_tbl
grm_rule:
_grm_rule:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_grm_rule_tbl:
_grm_rule_grm_rule_0:
	push rsi
	call _ord_etr_tbl
	cmp rax,0
	jz _grm_rule_grm_rule_0_failed
_grm_lst_378:
	call _grm_ptn_etr_tbl
	cmp rax,0
	jz _grm_lst_379
	jmp _grm_lst_378
_grm_lst_379:
	mov rax,1
_grm_rule_grm_rule_0_succeed:
	pop r8
	jmp _grm_rule_succeed
_grm_rule_grm_rule_0_failed:
	pop rsi
	jmp _grm_rule_failed
_grm_rule_succeed:
	pop rbx
	cmp rbx,0
	jnz _grm_rule_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_grm_rule_succeed_tbl:
	mov rax,1
	ret
_grm_rule_failed:
	pop rbx
	cmp rbx,0
	jnz _grm_rule_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_grm_rule_failed_tbl:
	mov rax,0
	ret
_grm_ord_etr_tbl:
	push QWORD 1
	jmp _grm_ord_tbl
grm_ord:
_grm_ord:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_grm_ord_tbl:
_grm_ord_grm_ord_0:
	push rsi
	call _grm_rule_etr_tbl
	cmp rax,0
	jz _grm_ord_grm_ord_0_failed
_grm_lst_385:
	call _grm_rule_etr_tbl
	cmp rax,0
	jz _grm_lst_386
	jmp _grm_lst_385
_grm_lst_386:
	mov rax,1
_grm_ord_grm_ord_0_succeed:
	pop r8
	jmp _grm_ord_succeed
_grm_ord_grm_ord_0_failed:
	pop rsi
	jmp _grm_ord_failed
_grm_ord_succeed:
	pop rbx
	cmp rbx,0
	jnz _grm_ord_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_grm_ord_succeed_tbl:
	mov rax,1
	ret
_grm_ord_failed:
	pop rbx
	cmp rbx,0
	jnz _grm_ord_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_grm_ord_failed_tbl:
	mov rax,0
	ret
_grm_body_etr_tbl:
	push QWORD 1
	jmp _grm_body_tbl
grm_body:
_grm_body:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_grm_body_tbl:
_grm_body_grm_body_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,64
	jnz _grm_body_grm_body_0_failed
	add rsi,1
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,46
	jnz _grm_body_grm_body_0_failed
	add rsi,1
	call _name_etr_tbl
	cmp rax,0
	jz _grm_body_grm_body_0_failed
	call _grm_ord_etr_tbl
	cmp rax,0
	jz _grm_body_grm_body_0_failed
_grm_body_grm_body_0_succeed:
	pop r8
	jmp _grm_body_succeed
_grm_body_grm_body_0_failed:
	pop rsi
	jmp _grm_body_failed
_grm_body_succeed:
	pop rbx
	cmp rbx,0
	jnz _grm_body_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_grm_body_succeed_tbl:
	mov rax,1
	ret
_grm_body_failed:
	pop rbx
	cmp rbx,0
	jnz _grm_body_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_grm_body_failed_tbl:
	mov rax,0
	ret
_def_coprd_etr_tbl:
	push QWORD 1
	jmp _def_coprd_tbl
def_coprd:
_def_coprd:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_def_coprd_tbl:
_def_coprd_def_coprd_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _def_coprd_def_coprd_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,136
	jnz _def_coprd_def_coprd_0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,144
	jnz _def_coprd_def_coprd_0_failed
	add rsi,3
	call _name_etr_tbl
	cmp rax,0
	jz _def_coprd_def_coprd_0_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,58
	jnz _def_coprd_def_coprd_0_failed
	add rsi,1
	call _typ_etr_tbl
	cmp rax,0
	jz _def_coprd_def_coprd_0_failed
_def_coprd_def_coprd_0_succeed:
	pop r8
	jmp _def_coprd_succeed
_def_coprd_def_coprd_0_failed:
	pop rsi
	jmp _def_coprd_failed
_def_coprd_succeed:
	pop rbx
	cmp rbx,0
	jnz _def_coprd_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_def_coprd_succeed_tbl:
	mov rax,1
	ret
_def_coprd_failed:
	pop rbx
	cmp rbx,0
	jnz _def_coprd_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_def_coprd_failed_tbl:
	mov rax,0
	ret
_def_typ_body_etr_tbl:
	push QWORD 1
	jmp _def_typ_body_tbl
def_typ_body:
_def_typ_body:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_def_typ_body_tbl:
_def_typ_body_def_typ_body_0:
	push rsi
	call _name_etr_tbl
	cmp rax,0
	jz _def_typ_body_def_typ_body_0_failed
_grm_lst_416:
	call _def_arg_etr_tbl
_grm_lst_417:
	mov rax,1
	call _def_coprd_etr_tbl
	cmp rax,0
	jz _def_typ_body_def_typ_body_0_failed
_grm_lst_422:
	call _def_coprd_etr_tbl
	cmp rax,0
	jz _grm_lst_423
	jmp _grm_lst_422
_grm_lst_423:
	mov rax,1
_def_typ_body_def_typ_body_0_succeed:
	pop r8
	jmp _def_typ_body_succeed
_def_typ_body_def_typ_body_0_failed:
	pop rsi
_def_typ_body_def_typ_body_1:
	push rsi
	call _name_etr_tbl
	cmp rax,0
	jz _def_typ_body_def_typ_body_1_failed
_grm_lst_410:
	call _def_arg_etr_tbl
_grm_lst_411:
	mov rax,1
_def_typ_body_def_typ_body_1_succeed:
	pop r8
	jmp _def_typ_body_succeed
_def_typ_body_def_typ_body_1_failed:
	pop rsi
	jmp _def_typ_body_failed
_def_typ_body_succeed:
	pop rbx
	cmp rbx,0
	jnz _def_typ_body_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_def_typ_body_succeed_tbl:
	mov rax,1
	ret
_def_typ_body_failed:
	pop rbx
	cmp rbx,0
	jnz _def_typ_body_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_def_typ_body_failed_tbl:
	mov rax,0
	ret
_def_typ_body_clq_etr_tbl:
	push QWORD 1
	jmp _def_typ_body_clq_tbl
def_typ_body_clq:
_def_typ_body_clq:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_def_typ_body_clq_tbl:
_def_typ_body_clq_def_typ_body_clq_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,64
	jnz _def_typ_body_clq_def_typ_body_clq_0_failed
	add rsi,1
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,46
	jnz _def_typ_body_clq_def_typ_body_clq_0_failed
	add rsi,1
	call _def_typ_body_etr_tbl
	cmp rax,0
	jz _def_typ_body_clq_def_typ_body_clq_0_failed
_def_typ_body_clq_def_typ_body_clq_0_succeed:
	pop r8
	jmp _def_typ_body_clq_succeed
_def_typ_body_clq_def_typ_body_clq_0_failed:
	pop rsi
	jmp _def_typ_body_clq_failed
_def_typ_body_clq_succeed:
	pop rbx
	cmp rbx,0
	jnz _def_typ_body_clq_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_def_typ_body_clq_succeed_tbl:
	mov rax,1
	ret
_def_typ_body_clq_failed:
	pop rbx
	cmp rbx,0
	jnz _def_typ_body_clq_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_def_typ_body_clq_failed_tbl:
	mov rax,0
	ret
_def_typ_etr_tbl:
	push QWORD 1
	jmp _def_typ_tbl
def_typ:
_def_typ:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_def_typ_tbl:
_def_typ_def_typ_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,194
	jnz _def_typ_def_typ_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,182
	jnz _def_typ_def_typ_0_failed
	add rsi,2
	call _def_typ_body_clq_etr_tbl
	cmp rax,0
	jz _def_typ_def_typ_0_failed
_grm_lst_450:
	call _def_typ_body_clq_etr_tbl
	cmp rax,0
	jz _grm_lst_451
	jmp _grm_lst_450
_grm_lst_451:
	mov rax,1
_def_typ_def_typ_0_succeed:
	pop r8
	jmp _def_typ_succeed
_def_typ_def_typ_0_failed:
	pop rsi
_def_typ_def_typ_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,194
	jnz _def_typ_def_typ_1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,182
	jnz _def_typ_def_typ_1_failed
	add rsi,2
	call _def_typ_body_etr_tbl
	cmp rax,0
	jz _def_typ_def_typ_1_failed
_def_typ_def_typ_1_succeed:
	pop r8
	jmp _def_typ_succeed
_def_typ_def_typ_1_failed:
	pop rsi
_def_typ_def_typ_2:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,194
	jnz _def_typ_def_typ_2_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,182
	jnz _def_typ_def_typ_2_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,43
	jnz _def_typ_def_typ_2_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,226
	jnz _def_typ_def_typ_2_failed
	mov r11b,[rdi+rsi+8*1+4]
	cmp r11,132
	jnz _def_typ_def_typ_2_failed
	mov r11b,[rdi+rsi+8*1+5]
	cmp r11,153
	jnz _def_typ_def_typ_2_failed
	add rsi,6
	call _grm_body_etr_tbl
	cmp rax,0
	jz _def_typ_def_typ_2_failed
_grm_lst_438:
	call _grm_body_etr_tbl
	cmp rax,0
	jz _grm_lst_439
	jmp _grm_lst_438
_grm_lst_439:
	mov rax,1
_def_typ_def_typ_2_succeed:
	pop r8
	jmp _def_typ_succeed
_def_typ_def_typ_2_failed:
	pop rsi
	jmp _def_typ_failed
_def_typ_succeed:
	pop rbx
	cmp rbx,0
	jnz _def_typ_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_def_typ_succeed_tbl:
	mov rax,1
	ret
_def_typ_failed:
	pop rbx
	cmp rbx,0
	jnz _def_typ_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_def_typ_failed_tbl:
	mov rax,0
	ret
_mdl_etr_etr_tbl:
	push QWORD 1
	jmp _mdl_etr_tbl
mdl_etr:
_mdl_etr:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_mdl_etr_tbl:
_mdl_etr_mdl_etr_0:
	push rsi
	call _glb_etr_etr_tbl
	cmp rax,0
	jz _mdl_etr_mdl_etr_0_failed
_mdl_etr_mdl_etr_0_succeed:
	pop r8
	jmp _mdl_etr_succeed
_mdl_etr_mdl_etr_0_failed:
	pop rsi
_mdl_etr_mdl_etr_1:
	push rsi
	call _def_typ_etr_tbl
	cmp rax,0
	jz _mdl_etr_mdl_etr_1_failed
_mdl_etr_mdl_etr_1_succeed:
	pop r8
	jmp _mdl_etr_succeed
_mdl_etr_mdl_etr_1_failed:
	pop rsi
	jmp _mdl_etr_failed
_mdl_etr_succeed:
	pop rbx
	cmp rbx,0
	jnz _mdl_etr_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_mdl_etr_succeed_tbl:
	mov rax,1
	ret
_mdl_etr_failed:
	pop rbx
	cmp rbx,0
	jnz _mdl_etr_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_mdl_etr_failed_tbl:
	mov rax,0
	ret
_var_etr_tbl:
	push QWORD 1
	jmp _var_tbl
var:
_var:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_var_tbl:
_var_var_0:
	push rsi
	call _name_etr_tbl
	cmp rax,0
	jz _var_var_0_failed
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,39
	jnz _var_var_0_failed
	add rsi,1
_var_var_0_succeed:
	pop r8
	jmp _var_succeed
_var_var_0_failed:
	pop rsi
	jmp _var_failed
_var_succeed:
	pop rbx
	cmp rbx,0
	jnz _var_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_var_succeed_tbl:
	mov rax,1
	ret
_var_failed:
	pop rbx
	cmp rbx,0
	jnz _var_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_var_failed_tbl:
	mov rax,0
	ret
_args_etr_tbl:
	push QWORD 1
	jmp _args_tbl
args:
_args:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_args_tbl:
_args_args_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,44
	jnz _args_args_0_failed
	add rsi,1
	call _var_etr_tbl
	cmp rax,0
	jz _args_args_0_failed
_args_args_0_succeed:
	pop r8
	jmp _args_succeed
_args_args_0_failed:
	pop rsi
	jmp _args_failed
_args_succeed:
	pop rbx
	cmp rbx,0
	jnz _args_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_args_succeed_tbl:
	mov rax,1
	ret
_args_failed:
	pop rbx
	cmp rbx,0
	jnz _args_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_args_failed_tbl:
	mov rax,0
	ret
_def_arg_etr_tbl:
	push QWORD 1
	jmp _def_arg_tbl
def_arg:
_def_arg:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_def_arg_tbl:
_def_arg_def_arg_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _def_arg_def_arg_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,151
	jnz _def_arg_def_arg_0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,130
	jnz _def_arg_def_arg_0_failed
	add rsi,3
	call _var_etr_tbl
	cmp rax,0
	jz _def_arg_def_arg_0_failed
_grm_lst_482:
	call _args_etr_tbl
	cmp rax,0
	jz _grm_lst_483
	jmp _grm_lst_482
_grm_lst_483:
	mov rax,1
_def_arg_def_arg_0_succeed:
	pop r8
	jmp _def_arg_succeed
_def_arg_def_arg_0_failed:
	pop rsi
_def_arg_def_arg_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,226
	jnz _def_arg_def_arg_1_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,151
	jnz _def_arg_def_arg_1_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,130
	jnz _def_arg_def_arg_1_failed
	add rsi,3
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,39
	jnz _def_arg_def_arg_1_failed
	add rsi,1
_grm_lst_474:
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,39
	jnz _grm_lst_475
	add rsi,1
	jmp _grm_lst_474
_grm_lst_475:
_def_arg_def_arg_1_succeed:
	pop r8
	jmp _def_arg_succeed
_def_arg_def_arg_1_failed:
	pop rsi
	jmp _def_arg_failed
_def_arg_succeed:
	pop rbx
	cmp rbx,0
	jnz _def_arg_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_def_arg_succeed_tbl:
	mov rax,1
	ret
_def_arg_failed:
	pop rbx
	cmp rbx,0
	jnz _def_arg_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_def_arg_failed_tbl:
	mov rax,0
	ret
_def_mdl_etr_tbl:
	push QWORD 1
	jmp _def_mdl_tbl
def_mdl:
_def_mdl:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_def_mdl_tbl:
_def_mdl_def_mdl_0:
	push rsi
	jmp _grm_ptn_486
_grm_ptn_485:
	add rsi,1
_grm_ptn_486:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,9
	jz _grm_ptn_485
	cmp r11,10
	jz _grm_ptn_485
	cmp r11,32
	jz _grm_ptn_485
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,194
	jnz _def_mdl_def_mdl_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,167
	jnz _def_mdl_def_mdl_0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,194
	jnz _def_mdl_def_mdl_0_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,167
	jnz _def_mdl_def_mdl_0_failed
	add rsi,4
	jmp _grm_ptn_488
_grm_ptn_487:
	add rsi,1
_grm_ptn_488:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,9
	jz _grm_ptn_487
	cmp r11,10
	jz _grm_ptn_487
	cmp r11,32
	jz _grm_ptn_487
	call _name_etr_tbl
	cmp rax,0
	jz _def_mdl_def_mdl_0_failed
_grm_lst_491:
	jmp _grm_ptn_490
_grm_ptn_489:
	add rsi,1
_grm_ptn_490:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,9
	jz _grm_ptn_489
	cmp r11,10
	jz _grm_ptn_489
	cmp r11,32
	jz _grm_ptn_489
	call _mdl_etr_etr_tbl
	cmp rax,0
	jz _grm_lst_492
	jmp _grm_lst_491
_grm_lst_492:
	mov rax,1
	jmp _grm_ptn_494
_grm_ptn_493:
	add rsi,1
_grm_ptn_494:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,9
	jz _grm_ptn_493
	cmp r11,10
	jz _grm_ptn_493
	cmp r11,32
	jz _grm_ptn_493
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,194
	jnz _def_mdl_def_mdl_0_failed
	mov r11b,[rdi+rsi+8*1+1]
	cmp r11,167
	jnz _def_mdl_def_mdl_0_failed
	mov r11b,[rdi+rsi+8*1+2]
	cmp r11,194
	jnz _def_mdl_def_mdl_0_failed
	mov r11b,[rdi+rsi+8*1+3]
	cmp r11,167
	jnz _def_mdl_def_mdl_0_failed
	mov r11b,[rdi+rsi+8*1+4]
	cmp r11,46
	jnz _def_mdl_def_mdl_0_failed
	add rsi,5
_def_mdl_def_mdl_0_succeed:
	pop r8
	jmp _def_mdl_succeed
_def_mdl_def_mdl_0_failed:
	pop rsi
	jmp _def_mdl_failed
_def_mdl_succeed:
	pop rbx
	cmp rbx,0
	jnz _def_mdl_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_def_mdl_succeed_tbl:
	mov rax,1
	ret
_def_mdl_failed:
	pop rbx
	cmp rbx,0
	jnz _def_mdl_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_def_mdl_failed_tbl:
	mov rax,0
	ret
_nl_etr_tbl:
	push QWORD 1
	jmp _nl_tbl
nl:
_nl:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_nl_tbl:
_nl_nl_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,10
	jnz _nl_nl_0_failed
	add rsi,1
_nl_nl_0_succeed:
	pop r8
	jmp _nl_succeed
_nl_nl_0_failed:
	pop rsi
	jmp _nl_failed
_nl_succeed:
	pop rbx
	cmp rbx,0
	jnz _nl_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_nl_succeed_tbl:
	mov rax,1
	ret
_nl_failed:
	pop rbx
	cmp rbx,0
	jnz _nl_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_nl_failed_tbl:
	mov rax,0
	ret
_c_al_etr_tbl:
	push QWORD 1
	jmp _c_al_tbl
c_al:
_c_al:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_c_al_tbl:
_c_al_c_al_0:
	push rsi
	call _l_al_etr_tbl
	cmp rax,0
	jz _c_al_c_al_0_failed
_c_al_c_al_0_succeed:
	pop r8
	jmp _c_al_succeed
_c_al_c_al_0_failed:
	pop rsi
_c_al_c_al_1:
	push rsi
	call _u_al_etr_tbl
	cmp rax,0
	jz _c_al_c_al_1_failed
_c_al_c_al_1_succeed:
	pop r8
	jmp _c_al_succeed
_c_al_c_al_1_failed:
	pop rsi
	jmp _c_al_failed
_c_al_succeed:
	pop rbx
	cmp rbx,0
	jnz _c_al_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_c_al_succeed_tbl:
	mov rax,1
	ret
_c_al_failed:
	pop rbx
	cmp rbx,0
	jnz _c_al_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_c_al_failed_tbl:
	mov rax,0
	ret
_al_us_etr_tbl:
	push QWORD 1
	jmp _al_us_tbl
al_us:
_al_us:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_al_us_tbl:
_al_us_al_us_0:
	push rsi
	call _c_al_etr_tbl
	cmp rax,0
	jz _al_us_al_us_0_failed
_al_us_al_us_0_succeed:
	pop r8
	jmp _al_us_succeed
_al_us_al_us_0_failed:
	pop rsi
_al_us_al_us_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz _al_us_al_us_1_failed
	add rsi,1
_al_us_al_us_1_succeed:
	pop r8
	jmp _al_us_succeed
_al_us_al_us_1_failed:
	pop rsi
	jmp _al_us_failed
_al_us_succeed:
	pop rbx
	cmp rbx,0
	jnz _al_us_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_al_us_succeed_tbl:
	mov rax,1
	ret
_al_us_failed:
	pop rbx
	cmp rbx,0
	jnz _al_us_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_al_us_failed_tbl:
	mov rax,0
	ret
_num_etr_tbl:
	push QWORD 1
	jmp _num_tbl
num:
_num:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_num_tbl:
_num_num_0:
	push rsi
	call _dgt_etr_tbl
	cmp rax,0
	jz _num_num_0_failed
_grm_lst_513:
	call _dgt_etr_tbl
	cmp rax,0
	jz _grm_lst_514
	jmp _grm_lst_513
_grm_lst_514:
	mov rax,1
_num_num_0_succeed:
	pop r8
	jmp _num_succeed
_num_num_0_failed:
	pop rsi
	jmp _num_failed
_num_succeed:
	pop rbx
	cmp rbx,0
	jnz _num_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_num_succeed_tbl:
	mov rax,1
	ret
_num_failed:
	pop rbx
	cmp rbx,0
	jnz _num_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_num_failed_tbl:
	mov rax,0
	ret
_name_etr_tbl:
	push QWORD 1
	jmp _name_tbl
name:
_name:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_name_tbl:
_name_name_0:
	push rsi
	call _c_al_etr_tbl
	cmp rax,0
	jz _name_name_0_failed
_grm_lst_520:
	call _al_us_etr_tbl
	cmp rax,0
	jz _grm_lst_521
	jmp _grm_lst_520
_grm_lst_521:
	mov rax,1
_grm_lst_524:
	call _dgt_etr_tbl
	cmp rax,0
	jz _grm_lst_525
	jmp _grm_lst_524
_grm_lst_525:
	mov rax,1
_name_name_0_succeed:
	pop r8
	jmp _name_succeed
_name_name_0_failed:
	pop rsi
	jmp _name_failed
_name_succeed:
	pop rbx
	cmp rbx,0
	jnz _name_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_name_succeed_tbl:
	mov rax,1
	ret
_name_failed:
	pop rbx
	cmp rbx,0
	jnz _name_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_name_failed_tbl:
	mov rax,0
	ret
_str_sp_etr_tbl:
	push QWORD 1
	jmp _str_sp_tbl
str_sp:
_str_sp:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_str_sp_tbl:
_str_sp_str_sp_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,92
	jnz _str_sp_str_sp_0_failed
	add rsi,1
_str_sp_str_sp_0_succeed:
	pop r8
	jmp _str_sp_succeed
_str_sp_str_sp_0_failed:
	pop rsi
_str_sp_str_sp_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,34
	jnz _str_sp_str_sp_1_failed
	add rsi,1
_str_sp_str_sp_1_succeed:
	pop r8
	jmp _str_sp_succeed
_str_sp_str_sp_1_failed:
	pop rsi
_str_sp_str_sp_2:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,116
	jnz _str_sp_str_sp_2_failed
	add rsi,1
_str_sp_str_sp_2_succeed:
	pop r8
	jmp _str_sp_succeed
_str_sp_str_sp_2_failed:
	pop rsi
_str_sp_str_sp_3:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,110
	jnz _str_sp_str_sp_3_failed
	add rsi,1
_str_sp_str_sp_3_succeed:
	pop r8
	jmp _str_sp_succeed
_str_sp_str_sp_3_failed:
	pop rsi
	jmp _str_sp_failed
_str_sp_succeed:
	pop rbx
	cmp rbx,0
	jnz _str_sp_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_str_sp_succeed_tbl:
	mov rax,1
	ret
_str_sp_failed:
	pop rbx
	cmp rbx,0
	jnz _str_sp_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_str_sp_failed_tbl:
	mov rax,0
	ret
_str_in_etr_tbl:
	push QWORD 1
	jmp _str_in_tbl
str_in:
_str_in:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_str_in_tbl:
_str_in_str_in_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,92
	jnz _str_in_str_in_0_failed
	add rsi,1
	call _str_sp_etr_tbl
	cmp rax,0
	jz _str_in_str_in_0_failed
	call _str_in_etr_tbl
	cmp rax,0
	jz _str_in_str_in_0_failed
_str_in_str_in_0_succeed:
	pop r8
	jmp _str_in_succeed
_str_in_str_in_0_failed:
	pop rsi
_str_in_str_in_1:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,34
	jnz _str_in_str_in_1_failed
	add rsi,1
_str_in_str_in_1_succeed:
	pop r8
	jmp _str_in_succeed
_str_in_str_in_1_failed:
	pop rsi
_str_in_str_in_2:
	push rsi
	call _chr_etr_tbl
	cmp rax,0
	jz _str_in_str_in_2_failed
	call _str_in_etr_tbl
	cmp rax,0
	jz _str_in_str_in_2_failed
_str_in_str_in_2_succeed:
	pop r8
	jmp _str_in_succeed
_str_in_str_in_2_failed:
	pop rsi
	jmp _str_in_failed
_str_in_succeed:
	pop rbx
	cmp rbx,0
	jnz _str_in_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_str_in_succeed_tbl:
	mov rax,1
	ret
_str_in_failed:
	pop rbx
	cmp rbx,0
	jnz _str_in_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_str_in_failed_tbl:
	mov rax,0
	ret
_str_etr_tbl:
	push QWORD 1
	jmp _str_tbl
str:
_str:
	mov rdi,r8
	mov rsi,r9
	call _grm_init_tbl
	push QWORD 0
_str_tbl:
_str_str_0:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,34
	jnz _str_str_0_failed
	add rsi,1
	call _str_in_etr_tbl
	cmp rax,0
	jz _str_str_0_failed
_str_str_0_succeed:
	pop r8
	jmp _str_succeed
_str_str_0_failed:
	pop rsi
	jmp _str_failed
_str_succeed:
	pop rbx
	cmp rbx,0
	jnz _str_succeed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_str_succeed_tbl:
	mov rax,1
	ret
_str_failed:
	pop rbx
	cmp rbx,0
	jnz _str_failed_tbl
	push rsi
	push rdi
	mov rdi,rdx
	mov rax,0
	call free
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
_str_failed_tbl:
	mov rax,0
	ret
_l_al_etr_tbl:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb _grm_lb_l_al_553
	cmp r11,122
	ja _grm_lb_l_al_553
	add rsi,1
	mov rax,1
	ret
_grm_lb_l_al_553:
	mov rax,0
	ret
_u_al_etr_tbl:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb _grm_lb_u_al_554
	cmp r11,90
	ja _grm_lb_u_al_554
	add rsi,1
	mov rax,1
	ret
_grm_lb_u_al_554:
	mov rax,0
	ret
_dgt_etr_tbl:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb _grm_lb_dgt_555
	cmp r11,57
	ja _grm_lb_dgt_555
	add rsi,1
	mov rax,1
	ret
_grm_lb_dgt_555:
	mov rax,0
	ret
_chr_etr_tbl:
	mov r11b,[rdi+rsi+8*1]
	add rsi,1
	bt r11,7
	jnc _grm_lb_chr_556
	add rsi,1
	bt r11,6
	jnc _grm_lb_chr_556
	add rsi,1
	bt r11,5
	jnc _grm_lb_chr_556
	add rsi,1
	mov rax,1
	ret
_grm_lb_chr_556:
	mov rax,0
	ret
section .data
	_dyn_f0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq f0
	_dyn_open_in:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_exp:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_reg:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_reg_ptn:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_reg_ptn_tl:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_ir_line:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_cst:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_mtc_ptn:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_mtc_eq:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_ir_mtcs:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_ir_lines:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_glb_etr_clq:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_glb_etr:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_typ_atm:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_typ_app_tl:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_typ_app:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_typ_vct_tl:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_typ_vct:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_typ_imp_tl:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_typ_imp:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_typ:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_grm_atom:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_grm_ptn:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_ord:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_grm_rule:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_grm_ord:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_grm_body:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_def_coprd:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_def_typ_body:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_def_typ_body_clq:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_def_typ:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_mdl_etr:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_var:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_args:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_def_arg:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_def_mdl:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_nl:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_c_al:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_al_us:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_num:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_name:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_str_sp:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_str_in:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq 0
	_dyn_str:
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
	cst_stg_1: db 194,167,194,167,32,116,101,115,116,32,194,167,194,167,46,0
