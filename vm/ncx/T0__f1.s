%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_1033
	mov QWORD [CST_DYN_1033+8*1],rax
	mov rbx,0
	setc bl
	mov QWORD [CST_DYN_1033],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_1077
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	call exec_out
	jmp _end
NS_E_1029:
NS_E_RDI_1029:
NS_E_1029_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_1029_LB_0
	bt r11,7
	jc LB_1030
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
LB_1030:
	add rsi,1
	bt r11,6
	jc LB_1031
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
LB_1031:
	add rsi,1
	bt r11,5
	jc LB_1032
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
LB_1032:
	add rsi,1
	bt r11,5
	jc LB_1032
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
NS_E_1029_LB_0:
	mov rax,0
	ret
NS_E_13:
NS_E_RDI_13:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_14:
	mov rdi,r8
	bt r12,0
NS_E_RDI_14:
	mov rsi,0
	setc sil
	push rsi
	call pnt_v
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
NS_E_1033:
NS_E_RDI_1033:
; 	» 0xrff |~ 0' : _r64
	mov QWORD r9,0xff
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
; ; emt_dec_ptn 0'
; unboxed
; 	» "ABCDfokfkfkf\t" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`ABCDfokf`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],107
	add rsi,1
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov BYTE [rdi+8*1+rsi],107
	add rsi,1
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov BYTE [rdi+8*1+rsi],9
	add rsi,1
	mov rbx,rdi
;pop_reg
	pop QWORD r9
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_1037
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_1038
emt_set_ptn_0_lb_1037:
	mov r10,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b100
emt_set_ptn_1_lb_1038:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_1039
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
emt_dec_ptn_0_lb_1039:
; 	_pp_v 1' ⊢ { 0' 1' } : { _r64 _stg }
; push_s_ex  2'~s0
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r10
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 0'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_1040
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_1041
emt_set_ptn_0_lb_1040:
	mov r8,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b1
emt_set_ptn_1_lb_1041:
; ; emt_dec_ptn 1'
; unboxed
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_lb_1043
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r10,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_1052
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_1053
emt_set_ptn_0_lb_1052:
	mov r9,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b10
emt_set_ptn_1_lb_1053:
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
	jmp call_nc_lb_1044
call_c_lb_1043:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r10,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 1'
; unknown
	jc emt_set_ptn_0_lb_1047
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_1048
emt_set_ptn_0_lb_1047:
	mov r9,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b10
emt_set_ptn_1_lb_1048:
call_nc_lb_1044:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_lb_1054
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_1055
emt_get_ptn_0_lb_1054:
; unboxed
	stc
emt_get_ptn_1_lb_1055:
	mov QWORD r11,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r11
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_1056
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
emt_dec_ptn_0_lb_1056:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_1057
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_1057:
; 	» "\nHOO\n" |~ 1' : _stg
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,5
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov BYTE [rdi+8*1+rsi],72
	add rsi,1
	mov BYTE [rdi+8*1+rsi],79
	add rsi,1
	mov BYTE [rdi+8*1+rsi],79
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	pop QWORD r10
	pop QWORD r8
	mov r9,rbx
	and r12,~0b10
; 	$ 1' ⊢ ,s1 : ,_stg
; emt_ptn_crt_ptn 1',s1
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 3'
; unknown
	bt r12,1
	jc emt_set_ptn_0_lb_1058
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_1059
emt_set_ptn_0_lb_1058:
	mov r11,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b1000
emt_set_ptn_1_lb_1059:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_1060
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_1060:
; emt_get_ptn 3'
	bt r12,3
	jc emt_get_ptn_0_lb_1061
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_1062
emt_get_ptn_0_lb_1061:
; unboxed
	stc
emt_get_ptn_1_lb_1062:
	mov QWORD r9,r11
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r9
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_1063
;push_reg
	push QWORD r8
	push QWORD r10
	push QWORD r11
	mov rdi,r11
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_1063:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_1064
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_1064:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r10
	pop QWORD r8
	clc
	jc ret_lb_1065
	push r9
; ; emt_dec_ptn {  }
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_lb_1065:
;clear  2'~s0 0'~x0
	bt r12,2
	jc clear_lb_1066
;push_reg
	push QWORD r8
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r8
clear_lb_1066:
	bt r12,0
	jc clear_lb_1067
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_lb_1067:
	mov rax,r9
	stc
	ret
NS_E_1068:
; 	|» {  }
	jz NS_E_RDI_1068
	jc emt_etr_c_lb_1069
	push rbx
	mov rbx,rdi
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_1068
emt_etr_c_lb_1069:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_1068:
; 	» "xyz" |~ 0' : _stg
;push_reg
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],120
	add rsi,1
	mov BYTE [rdi+8*1+rsi],121
	add rsi,1
	mov BYTE [rdi+8*1+rsi],122
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_1070
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_1071
emt_set_ptn_0_lb_1070:
	mov r9,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b10
emt_set_ptn_1_lb_1071:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_1072
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_1072:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_1074
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_1075
emt_get_crt_ptn_0_lb_1074:
; unboxed
	stc
emt_get_crt_ptn_1_lb_1075:
	mov QWORD r8,r9
	jc ret_lb_1076
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_1073
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_1073:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_1076:
;clear 
	mov rax,r8
	stc
	ret
NS_E_1077:
; 	|» {  }
	jz NS_E_RDI_1077
	jc emt_etr_c_lb_1078
	push rbx
	mov rbx,rdi
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_1077
emt_etr_c_lb_1078:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_1077:
; 	f0 {  } ⊢ -2' : _stg
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn {  },{  }
; ; emt_dec_ptn {  }
	call NS_E_1068
	mov QWORD [tmp],rax
	jc call_c_lb_1079
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn -2'
; ; emt_dec 
; unknown
	jc lb_1081
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
lb_1081:
	jmp call_nc_lb_1080
call_c_lb_1079:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn -2'
call_nc_lb_1080:
; 	» "Hello World!!\n" |~ 0' : _stg
;push_reg
	mov rdi,14
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`Hello Wo`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],114
	add rsi,1
	mov BYTE [rdi+8*1+rsi],108
	add rsi,1
	mov BYTE [rdi+8*1+rsi],100
	add rsi,1
	mov BYTE [rdi+8*1+rsi],33
	add rsi,1
	mov BYTE [rdi+8*1+rsi],33
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_1082
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_1083
emt_set_ptn_0_lb_1082:
	mov r9,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b10
emt_set_ptn_1_lb_1083:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_1084
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_1084:
; 	» "Foo Baoo" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`Foo Baoo`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov rbx,rdi
;pop_reg
	pop QWORD r9
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s1 : ,_stg
; emt_ptn_crt_ptn 0',s1
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_1085
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_1086
emt_set_ptn_0_lb_1085:
	mov r10,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b100
emt_set_ptn_1_lb_1086:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_1087
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
emt_dec_ptn_0_lb_1087:
; » _^ ..
;push_reg
	push QWORD r9
	push QWORD r10
	mov rbx,26
	mov r15,0
	mov r13,0
	mov r14,r9
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,1
	add rbx,r14
	mov r14,r10
	mov r14,[r14]
	mov r15,r14
	shl r14,16
	shr r14,48
	shl r14,3
	and r15,0b111
	sub r14,r15
	imul r14,2
	add rbx,r14
	mov r14,rbx
	and r14,0b111
	mov r15,0b1000
	sub r15,r14
	mov rdi,rbx
	shr rdi,3
	add rdi,1
	call mlc
	mov r13,[rax]
	and r13,~0xffff
	add r13,r15
	bts r13,16
	mov [rax],r13
	mov r13,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	mov r14,0
; "Ab"
	mov BYTE [r13+8*1+r14],65
	add r14,1
	mov BYTE [r13+8*1+r14],98
	add r14,1
; 0'
	mov r15,r9
	add r15,8
LB_1088:
	mov bl,[r15]
	cmp rbx,0
	jz LB_1089
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_1088
LB_1089:
; "B"
	mov BYTE [r13+8*1+r14],66
	add r14,1
; 1'
	mov r15,r10
	add r15,8
LB_1090:
	mov bl,[r15]
	cmp rbx,0
	jz LB_1091
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_1090
LB_1091:
; 1'
	mov r15,r10
	add r15,8
LB_1092:
	mov bl,[r15]
	cmp rbx,0
	jz LB_1093
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_1092
LB_1093:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; "\tmov r0,r1\n"
	mov BYTE [r13+8*1+r14],9
	add r14,1
	mov BYTE [r13+8*1+r14],109
	add r14,1
	mov BYTE [r13+8*1+r14],111
	add r14,1
	mov BYTE [r13+8*1+r14],118
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],48
	add r14,1
	mov BYTE [r13+8*1+r14],44
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],49
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
; "\tadd r3,r5\n"
	mov BYTE [r13+8*1+r14],9
	add r14,1
	mov BYTE [r13+8*1+r14],97
	add r14,1
	mov BYTE [r13+8*1+r14],100
	add r14,1
	mov BYTE [r13+8*1+r14],100
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],51
	add r14,1
	mov BYTE [r13+8*1+r14],44
	add r14,1
	mov BYTE [r13+8*1+r14],114
	add r14,1
	mov BYTE [r13+8*1+r14],53
	add r14,1
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r8,r13
	btr r12,0
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	mov rdi,0
	call mlc
	mov r11,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	clc
	jc ret_lb_1094
	push r11
; ; emt_dec_ptn {  }
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_lb_1094:
;clear  2'~s1 0'~sr 1'~s0
	bt r12,2
	jc clear_lb_1095
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
clear_lb_1095:
	bt r12,0
	jc clear_lb_1096
;push_reg
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
clear_lb_1096:
	bt r12,1
	jc clear_lb_1097
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_lb_1097:
	mov rax,r11
	stc
	ret
section .data
	NS_E_DYN_1029:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1029
	CST_DYN_1033:
		dq 1
		dq 1
	NS_E_DYN_1068:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1068
	NS_E_DYN_1077:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1077
