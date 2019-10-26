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
	call T0_T1__f0
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
T0__g0:
; 	|» {  }
	jz _T0__g0
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
jmp _T0__g0
emt_etr_c_lb_0:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_T0__g0:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_1
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_1:
;clear 
	mov rax,r8
	stc
	ret
T0_T1__f0:
; 	|» {  }
	jz _T0_T1__f0
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
jmp _T0_T1__f0
emt_etr_c_lb_2:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_T0_T1__f0:
; 	g0 {  } ⊢ -2' : { }
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
; emt_ptn_set_ptn {  },{  }
; ; emt_dec_ptn {  }
	call _T0__g0
	mov QWORD [tmp],rax
	jc call_c_lb_3
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
; emt_set_ptn -2'
; ; emt_dec 
; boxed
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	jmp call_nc_lb_4
call_c_lb_3:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn -2'
call_nc_lb_4:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_6
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_6:
;clear 
	mov rax,r8
	stc
	ret
T0__h0:
; 	|» {  }
	jz _T0__h0
	jc emt_etr_c_lb_7
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
jmp _T0__h0
emt_etr_c_lb_7:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
_T0__h0:
; 	T1.f0 {  } ⊢ {  } : {  }
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
; emt_ptn_set_ptn {  },{  }
; ; emt_dec_ptn {  }
	call _T0_T1__f0
	mov QWORD [tmp],rax
	jc call_c_lb_8
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
; emt_set_ptn {  }
; ; emt_dec 
; boxed
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	jmp call_nc_lb_9
call_c_lb_8:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn {  }
call_nc_lb_9:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_11
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_11:
;clear 
	mov rax,r8
	stc
	ret
section .data
	_dyn_T0__g0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq T0__g0
	_dyn_T0_T1__f0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq T0_T1__f0
	_dyn_T0__h0:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq T0__h0
