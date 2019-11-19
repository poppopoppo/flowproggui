%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_706
	mov QWORD [CST_DYN_706+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_706],rbx
	call NS_E_769
	mov QWORD [CST_DYN_769+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_769],rbx
	call NS_E_826
	mov QWORD [CST_DYN_826+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_826],rbx
	call NS_E_878
	mov QWORD [CST_DYN_878+8*1],rax
	mov rbx,0
	setc bl
	not rbx
	and QWORD [CST_DYN_878],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_749
	call exec_out
	jmp _end
NS_E_702:
NS_E_RDI_702:
NS_E_702_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_702_LB_0
	bt r11,7
	jc LB_703
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
LB_703:
	add rsi,1
	bt r11,6
	jc LB_704
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
LB_704:
	add rsi,1
	bt r11,5
	jc LB_705
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
LB_705:
	add rsi,1
	bt r11,5
	jc LB_705
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
NS_E_702_LB_0:
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
NS_E_706:
NS_E_RDI_706:
; 	» 0xrff |~ 0' : _r64
	mov QWORD r9,0xff
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
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
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_710
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_711
emt_set_ptn_0_LB_710:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_711:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_712
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
emt_dec_ptn_0_LB_712:
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
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_713
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_714
emt_set_ptn_0_LB_713:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_714:
; ; emt_dec_ptn 1'
; unboxed
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_LB_716
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r10,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_724
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_725
emt_set_ptn_0_LB_724:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_725:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_717
call_c_LB_716:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r10,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_720
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_721
emt_set_ptn_0_LB_720:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_721:
call_nc_LB_717:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_726
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_727
emt_get_ptn_0_LB_726:
; unboxed
	stc
emt_get_ptn_1_LB_727:
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
	jc emt_dec_ptn_0_LB_728
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
emt_dec_ptn_0_LB_728:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_729
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_729:
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
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 3'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_730
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r11,rbx
	and r12,~0b1000
	jmp emt_set_ptn_1_LB_731
emt_set_ptn_0_LB_730:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r11,rbx
	or r12,0b1000
emt_set_ptn_1_LB_731:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_732
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
emt_dec_ptn_0_LB_732:
; emt_get_ptn 3'
	bt r12,3
	jc emt_get_ptn_0_LB_733
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_734
emt_get_ptn_0_LB_733:
; unboxed
	stc
emt_get_ptn_1_LB_734:
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
	jc emt_dec_ptn_0_LB_735
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
emt_dec_ptn_0_LB_735:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_736
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_736:
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
	jc ret_LB_737
	push r9
; ; emt_dec_ptn {  }
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_LB_737:
;clear  2'~s0 0'~x0
	bt r12,2
	jc clear_LB_738
;push_reg
	push QWORD r8
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r8
clear_LB_738:
	bt r12,0
	jc clear_LB_739
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_LB_739:
	mov rax,r9
	stc
	ret
NS_E_740:
; 	|» {  }
	jz NS_E_RDI_740
	jc emt_etr_c_LB_741
	push rbx
	push rdi
	mov rbx,rdi
	mov QWORD [set_ptn_vct+8*1],rbx
	mov QWORD [set_ptn_vct],0
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_740
emt_etr_c_LB_741:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
	mov QWORD [set_ptn_vct],1
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_740:
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
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_742
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_743
emt_set_ptn_0_LB_742:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_743:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_744
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_744:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_LB_746
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_747
emt_get_crt_ptn_0_LB_746:
; unboxed
	stc
emt_get_crt_ptn_1_LB_747:
	mov QWORD r8,r9
	jc ret_LB_748
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_745
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_745:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_748:
;clear 
	mov rax,r8
	stc
	ret
NS_E_749:
; 	|» {  }
	jz NS_E_RDI_749
	jc emt_etr_c_LB_750
	push rbx
	push rdi
	mov rbx,rdi
	mov QWORD [set_ptn_vct+8*1],rbx
	mov QWORD [set_ptn_vct],0
; emt_set_ptn {  }
	pop rbx
;push_reg
	mov rdi,rbx
	call dec_r
;pop_reg
	pop rbx
jmp NS_E_RDI_749
emt_etr_c_LB_750:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
	mov QWORD [set_ptn_vct],1
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_749:
; 	f0 {  } ⊢ -2' : _stg
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn {  },{  }
; ; emt_dec_ptn {  }
	call NS_E_740
	mov QWORD [tmp],rax
	jc call_c_LB_751
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; _
	pop rdi
	call dec_r
	jmp call_nc_LB_752
call_c_LB_751:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; _
call_nc_LB_752:
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
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_753
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_754
emt_set_ptn_0_LB_753:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_754:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_755
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_755:
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
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_756
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_757
emt_set_ptn_0_LB_756:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_757:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_758
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
emt_dec_ptn_0_LB_758:
; » _^ ..
;push_reg
	push QWORD r9
	push QWORD r10
	mov rbx,25
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
LB_759:
	mov bl,[r15]
	cmp rbx,0
	jz LB_760
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_759
LB_760:
; "B"
	mov BYTE [r13+8*1+r14],66
	add r14,1
; 1'
	mov r15,r10
	add r15,8
LB_761:
	mov bl,[r15]
	cmp rbx,0
	jz LB_762
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_761
LB_762:
; 1'
	mov r15,r10
	add r15,8
LB_763:
	mov bl,[r15]
	cmp rbx,0
	jz LB_764
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_763
LB_764:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; " mov r0,r1"
	mov BYTE [r13+8*1+r14],32
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
; " add r3,r5 "
	mov BYTE [r13+8*1+r14],32
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
	mov BYTE [r13+8*1+r14],32
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
	jc ret_LB_765
	push r11
; ; emt_dec_ptn {  }
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_LB_765:
;clear  2'~s1 0'~sr 1'~s0
	bt r12,2
	jc clear_LB_766
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
clear_LB_766:
	bt r12,0
	jc clear_LB_767
;push_reg
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
clear_LB_767:
	bt r12,1
	jc clear_LB_768
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_768:
	mov rax,r11
	stc
	ret
NS_E_769:
NS_E_RDI_769:
; 	» 0xrf |~ 0' : _r64
	mov QWORD r9,0xf
	mov QWORD r8,r9
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
; ; emt_dec_ptn 0'
; unboxed
; 	? 1'
; 	∐\ x0 ,,x0=0xr0
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_773
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_774
LB_773:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_774:
; x0=0xr0
	mov r14,QWORD [mtc_vct_0+8*1+16*0]
	mov QWORD rbx,0x0
	cmp r14,rbx
	jnz LB_775
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_776
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_776:
; 	» "A\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],65
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
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_777
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_778
emt_set_ptn_0_LB_777:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_778:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_779
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_779:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_780
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_781
emt_get_ptn_0_LB_780:
; unboxed
	stc
emt_get_ptn_1_LB_781:
	mov QWORD r8,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_782
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_782:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_783
;push_reg
	call exec_out
;pop_reg
LB_783:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_784
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_784:
;clear 
	mov rax,r8
	stc
	ret
LB_775:
; 	∐\ x0 ,,x0=0xr1
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_785
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_786
LB_785:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_786:
; x0=0xr1
	mov r14,QWORD [mtc_vct_0+8*1+16*0]
	mov QWORD rbx,0x1
	cmp r14,rbx
	jnz LB_787
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_788
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_788:
; 	» "B\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],66
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
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_789
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_790
emt_set_ptn_0_LB_789:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_790:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_791
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_791:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_792
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_793
emt_get_ptn_0_LB_792:
; unboxed
	stc
emt_get_ptn_1_LB_793:
	mov QWORD r8,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_794
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_794:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_795
;push_reg
	call exec_out
;pop_reg
LB_795:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_796
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_796:
;clear 
	mov rax,r8
	stc
	ret
LB_787:
; 	∐\ x0 ,
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_797
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_798
LB_797:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_798:
	mov r13,QWORD [mtc_vct_0+8*1+16*0]
	mov r8,r13
	mov rbx,QWORD [mtc_vct_0+16*0]
	bt rbx,0
	jc LB_800
	btr r12,0
	bt r13,0
	jnc LB_802
	mov r14,0x00ff_ffff_ffff_fffc
	and r13,r14
LB_802:
	mov r14,0x0001_0000_0000_0000
	add QWORD [r13],r14
	jmp LB_801
LB_800:
	bts r12,0
LB_801:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_803
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_803:
	mov r8,QWORD [regs_vct+8*0]
; 	_pp_v 0' ⊢ { 0' 1' } : { _r64 _stg }
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	mov r9,r8
	bts r12,1
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_804
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_805
emt_set_ptn_0_LB_804:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_805:
; ; emt_dec_ptn 1'
; unboxed
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_LB_807
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_815
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_816
emt_set_ptn_0_LB_815:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_816:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_808
call_c_LB_807:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r8,rbx
	bts r12,0
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_811
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_812
emt_set_ptn_0_LB_811:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_812:
call_nc_LB_808:
; » _^ ..
;push_reg
	push QWORD r8
	push QWORD r9
	mov rbx,6
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
	pop QWORD r9
	pop QWORD r8
	mov r14,0
; "x0 = "
	mov BYTE [r13+8*1+r14],120
	add r14,1
	mov BYTE [r13+8*1+r14],48
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
	mov BYTE [r13+8*1+r14],61
	add r14,1
	mov BYTE [r13+8*1+r14],32
	add r14,1
; 0'
	mov r15,r9
	add r15,8
LB_817:
	mov bl,[r15]
	cmp rbx,0
	jz LB_818
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_817
LB_818:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r10,r13
	btr r12,2
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_819
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_820
emt_get_ptn_0_LB_819:
; unboxed
	stc
emt_get_ptn_1_LB_820:
	mov QWORD r11,r10
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
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_821
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
emt_dec_ptn_0_LB_821:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_822
;push_reg
	push QWORD r8
	push QWORD r9
	call exec_out
;pop_reg
	pop QWORD r9
	pop QWORD r8
LB_822:
; 	∎ {  }
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
	jc ret_LB_823
	push r10
; ; emt_dec_ptn {  }
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_LB_823:
;clear  0'~x0 1'~s0
	bt r12,0
	jc clear_LB_824
;push_reg
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
clear_LB_824:
	bt r12,1
	jc clear_LB_825
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_825:
	mov rax,r10
	stc
	ret
LB_799:
	jmp err
NS_E_826:
NS_E_RDI_826:
; 	» "ABCDefgefefef" |~ 0' : _stg
;push_reg
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov rbx,`ABCDefge`
	mov QWORD [rdi+8*1+rsi],rbx
	add rsi,8
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov BYTE [rdi+8*1+rsi],101
	add rsi,1
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov BYTE [rdi+8*1+rsi],101
	add rsi,1
	mov BYTE [rdi+8*1+rsi],102
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_stg
; emt_ptn_crt_ptn 0',s0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_827
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_828
emt_set_ptn_0_LB_827:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_828:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_829
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_829:
; 	» 0xrff |~ 0' : _r64
	mov QWORD r10,0xff
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	bts r12,2
; ; emt_dec_ptn 0'
; unboxed
; 	? { 2' 1' }
; 	∐\ { x0 s0 } ,,s0="ABCDefgefefef",x0=0xrf9
; ; emt_mtc_set

; emt_mtc_set
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,2
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_833
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_834
LB_833:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_834:
; emt_mtc_set
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_835
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*1],rbx
	mov QWORD [mtc_vct_0+16*1],0
	jmp LB_836
LB_835:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*1],rbx
	mov QWORD [mtc_vct_0+16*1],1
LB_836:
; s0="ABCDefgefefef"
	mov r14,QWORD [mtc_vct_0+8*1+16*1]
	mov rbx,[r14]
	shr rbx,32
	and rbx,0xffff
	cmp rbx,2
	jnz LB_837
	mov rbx,`ABCDefge`
	mov QWORD r13,[r14+8*1]
	cmp rbx,r13
	jnz LB_837
	mov rbx,`fefef`
	mov QWORD r13,[r14+8*2]
	cmp rbx,r13
	jnz LB_837
; x0=0xrf9
	mov r14,QWORD [mtc_vct_0+8*1+16*0]
	mov QWORD rbx,0xf9
	cmp r14,rbx
	jnz LB_837
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_838
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_838:
	bt r12,2
	jc LB_839
	mov rdi,QWORD [regs_vct+8*2]
	call dec_r
LB_839:
; 	» "X\n" |~ 0' : _stg
;push_reg
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],88
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov rbx,rdi
;pop_reg
	mov r8,rbx
	and r12,~0b1
; 	$ 0' ⊢ ,sr : ,_stg
; emt_ptn_crt_ptn 0',sr
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_840
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_841
emt_set_ptn_0_LB_840:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_841:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_842
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_842:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_843
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_844
emt_get_ptn_0_LB_843:
; unboxed
	stc
emt_get_ptn_1_LB_844:
	mov QWORD r8,r9
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_845
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_LB_845:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_846
;push_reg
	call exec_out
;pop_reg
LB_846:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_LB_847
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_847:
;clear 
	mov rax,r8
	stc
	ret
LB_837:
; 	∐\ p0 ,
; ; emt_mtc_set

; emt_get_crt_ptn { 2' 1' }
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
; emt_get_crt_ptn 2'
	mov QWORD r11,r10
	stc
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
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_LB_849
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_LB_850
emt_get_crt_ptn_0_LB_849:
; unboxed
	stc
emt_get_crt_ptn_1_LB_850:
	mov QWORD r11,r9
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
	and r12,~0b1
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,1
	jc LB_851
	mov rdi,QWORD [regs_vct+8*1]
	call dec_r
LB_851:
	bt r12,2
	jc LB_852
	mov rdi,QWORD [regs_vct+8*2]
	call dec_r
LB_852:
	mov r8,QWORD [regs_vct+8*0]
; 	_pp_v 0' ⊢ { 0' 1' } : { { _r64 _stg } _stg }
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	mov r9,r8
	btr r12,1
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_853
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_854
emt_set_ptn_0_LB_853:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_854:
; ; emt_dec_ptn 1'
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_LB_856
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; boxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_864
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_865
emt_set_ptn_0_LB_864:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_865:
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_857
call_c_LB_856:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 0' 1' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 0'
; boxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_860
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_861
emt_set_ptn_0_LB_860:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_861:
call_nc_LB_857:
; » _^ ..
;push_reg
	push QWORD r8
	push QWORD r9
	mov rbx,4
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
	pop QWORD r9
	pop QWORD r8
	mov r14,0
; "p0="
	mov BYTE [r13+8*1+r14],112
	add r14,1
	mov BYTE [r13+8*1+r14],48
	add r14,1
	mov BYTE [r13+8*1+r14],61
	add r14,1
; 0'
	mov r15,r9
	add r15,8
LB_866:
	mov bl,[r15]
	cmp rbx,0
	jz LB_867
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_866
LB_867:
; "\n"
	mov BYTE [r13+8*1+r14],10
	add r14,1
; //
	mov BYTE [r13+8*1+r14],0
	mov r10,r13
	btr r12,2
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_LB_868
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_869
emt_get_ptn_0_LB_868:
; unboxed
	stc
emt_get_ptn_1_LB_869:
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
	jc emt_dec_ptn_0_LB_870
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
emt_dec_ptn_0_LB_870:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_871
;push_reg
	push QWORD r8
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r8
LB_871:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_872
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_873
emt_get_ptn_0_LB_872:
; unboxed
	stc
emt_get_ptn_1_LB_873:
	mov QWORD r9,r10
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
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_874
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_LB_874:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_875
;push_reg
	push QWORD r8
	call exec_out
;pop_reg
	pop QWORD r8
LB_875:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	jc ret_LB_876
	push r9
; ; emt_dec_ptn {  }
	pop r9
	clc
;clear 
	mov rax,r9
	ret
ret_LB_876:
;clear  0'~p0
	bt r12,0
	jc clear_LB_877
;push_reg
	mov rdi,r8
	call dec_r
;pop_reg
clear_LB_877:
	mov rax,r9
	stc
	ret
LB_848:
	jmp err
NS_E_878:
NS_E_RDI_878:
	btr r12,0
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	mov r13,0x0001_0000_0000_0001
	add r8,r13
; ; emt_dec_ptn {  }
	btr r12,1
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r8
	mov rdi,0
	call mlc
	mov r9,rax
;pop_reg
	pop QWORD r8
	clc
	mov r13,0x0001_0000_0000_0001
	add r9,r13
; ; emt_dec_ptn {  }
	btr r12,1
	mov rbx,r9
	bt r12,1
	jc LB_879
	bt rbx,0
	jc LB_880
	mov r13,0x0000_0000_0000_0001
	add rbx,r13
	mov r9,rbx
	jmp LB_881
LB_879:
	mov QWORD [regs_vct+8*0],r8
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r9,rax
	mov r8,QWORD [regs_vct+8*0]
	jmp LB_881
LB_880:
	mov QWORD [regs_vct+8*0],r8
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	btr QWORD [rax],0
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r9,rax
	mov r8,QWORD [regs_vct+8*0]
LB_881:
	btr r12,1
	mov rbx,r9
	bt r12,1
	jc LB_882
	bt rbx,0
	jc LB_883
	mov r13,0x0000_0000_0000_0001
	add rbx,r13
	mov r9,rbx
	jmp LB_884
LB_882:
	mov QWORD [regs_vct+8*0],r8
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r9,rax
	mov r8,QWORD [regs_vct+8*0]
	jmp LB_884
LB_883:
	mov QWORD [regs_vct+8*0],r8
	mov rdi,1
	call mlc
	mov QWORD [rax+8*1],rbx
	bts QWORD [rax],17
	btr QWORD [rax],0
	mov r13,0x0000_0000_0000_0001
	add rax,r13
	mov r9,rax
	mov r8,QWORD [regs_vct+8*0]
LB_884:
; 	_pp_v 1' ⊢ { 1' 2' } : { (_opn)◂((_opn)◂((_opn)◂(t509'(0)))) _stg }
; push_s_ex  0'~o0
	sub rsp,16
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*1],r8
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn 1',0'
	mov rbx,r9
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,1
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 0'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_885
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r8,rbx
	and r12,~0b1
	jmp emt_set_ptn_1_LB_886
emt_set_ptn_0_LB_885:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r8,rbx
	or r12,0b1
emt_set_ptn_1_LB_886:
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_LB_887
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_LB_887:
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_LB_888
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	push rbx
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,0
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_894
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_895
emt_set_ptn_0_LB_894:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_895:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_896
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_897
emt_set_ptn_0_LB_896:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_897:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	pop rdi
	call dec_r
	mov r10,QWORD [regs_vct+8*2]
	mov r8,QWORD [regs_vct+8*0]
	mov r9,QWORD [regs_vct+8*1]
	jmp call_nc_LB_889
call_c_LB_888:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r8,[rsp+8*1]
	add rsp,16
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
	mov rbx,1
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn { 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 1'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_890
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r9,rbx
	and r12,~0b10
	jmp emt_set_ptn_1_LB_891
emt_set_ptn_0_LB_890:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	or r12,0b10
emt_set_ptn_1_LB_891:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
	mov r13,0
	setc r13b
	mov [set_ptn_vct+16*1],r13
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*1],0
	jc emt_set_ptn_0_LB_892
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_893
emt_set_ptn_0_LB_892:
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_893:
call_nc_LB_889:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_898
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_899
emt_get_ptn_0_LB_898:
; unboxed
	stc
emt_get_ptn_1_LB_899:
	mov QWORD r11,r10
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
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_900
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
emt_dec_ptn_0_LB_900:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_901
;push_reg
	push QWORD r8
	push QWORD r9
	call exec_out
;pop_reg
	pop QWORD r9
	pop QWORD r8
LB_901:
; 	? 0'
; 	∐\ o0 ,,o0=_none◂{  }
; emt_mtc_set
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_902
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_903
LB_902:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_903:
; o0=_none◂{  }
	mov rbx,QWORD [mtc_vct_0+8*1+16*0]
	mov r13,rbx
	shr r13,56
	cmp r13,1
	jnz LB_904
	mov r13,rbx
	mov r14,0x00ff_ffff_ffff_fffc
	and r13,r14
	bt QWORD [r13],16
	jc LB_905
	bt QWORD [r13],17
	jnc LB_905
	mov r13,QWORD [r13+8*1]
LB_905:
	mov QWORD [set_ptn_vct],0
	mov QWORD [set_ptn_vct+8*1],r13
; ; 	? 0'

	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,0
	jc LB_906
	mov rdi,QWORD [regs_vct+8*0]
	call dec_r
LB_906:
	mov r9,QWORD [regs_vct+8*1]
; 	» "t\n" |~ 0' : _stg
;push_reg
	push QWORD r9
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],116
	add rsi,1
	mov BYTE [rdi+8*1+rsi],10
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
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
; emt_set_ptn 2'
; unknown
	bt QWORD [set_ptn_vct+16*0],0
	jc emt_set_ptn_0_LB_907
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r13,0x0001_0000_0000_0000
	add [rbx],r13
	mov r10,rbx
	and r12,~0b100
	jmp emt_set_ptn_1_LB_908
emt_set_ptn_0_LB_907:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	or r12,0b100
emt_set_ptn_1_LB_908:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_LB_909
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
emt_dec_ptn_0_LB_909:
; emt_get_ptn 2'
	bt r12,2
	jc emt_get_ptn_0_LB_910
; boxed
	push rdi
	mov rdi,r10
	call inc_r
	mov r10,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_LB_911
emt_get_ptn_0_LB_910:
; unboxed
	stc
emt_get_ptn_1_LB_911:
	mov QWORD r8,r10
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,r8
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_LB_912
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r9
emt_dec_ptn_0_LB_912:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_913
;push_reg
	push QWORD r9
	call exec_out
;pop_reg
	pop QWORD r9
LB_913:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r9
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r9
	clc
	jc ret_LB_914
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_914:
;clear  1'~o1
	bt r12,1
	jc clear_LB_915
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_915:
	mov rax,r8
	stc
	ret
LB_904:
; 	∐\ o0 ,
; emt_mtc_set
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
	bt r12,0
	mov rbx,0
	setc bl
	mov QWORD [set_ptn_vct],rbx
	bt QWORD [set_ptn_vct+16*0],0
	jc LB_916
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],0
	jmp LB_917
LB_916:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov QWORD [mtc_vct_0+8*1+16*0],rbx
	mov QWORD [mtc_vct_0+16*0],1
LB_917:
	mov r13,QWORD [mtc_vct_0+8*1+16*0]
	mov r10,r13
	mov rbx,QWORD [mtc_vct_0+16*0]
	bt rbx,0
	jc LB_919
	btr r12,2
	bt r13,0
	jnc LB_921
	mov r14,0x00ff_ffff_ffff_fffc
	and r13,r14
LB_921:
	mov r14,0x0001_0000_0000_0000
	add QWORD [r13],r14
	jmp LB_920
LB_919:
	bts r12,2
LB_920:
	mov QWORD [regs_vct+8*2],r10
	mov QWORD [regs_vct+8*0],r8
	mov QWORD [regs_vct+8*1],r9
	bt r12,0
	jc LB_922
	mov rdi,QWORD [regs_vct+8*0]
	call dec_r
LB_922:
	mov r10,QWORD [regs_vct+8*2]
	mov r9,QWORD [regs_vct+8*1]
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	push QWORD r9
	push QWORD r10
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	pop QWORD r10
	pop QWORD r9
	clc
	jc ret_LB_923
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_LB_923:
;clear  2'~o0 1'~o1
	bt r12,2
	jc clear_LB_924
;push_reg
	push QWORD r9
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r9
clear_LB_924:
	bt r12,1
	jc clear_LB_925
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_LB_925:
	mov rax,r8
	stc
	ret
LB_918:
	jmp err
section .data
	NS_E_DYN_702:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_702
	CST_DYN_706:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_740:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_740
	NS_E_DYN_749:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_749
	CST_DYN_769:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_826:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_878:
		dq 0x0001_0001_00_82_ffff
		dq 1
