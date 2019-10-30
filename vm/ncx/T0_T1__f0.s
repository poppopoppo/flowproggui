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
	call NS_E_RDI_811
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	jmp _end
NS_E_746:
NS_E_RDI_746:
NS_E_746_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_746_LB_0
	cmp r11,122
	ja NS_E_746_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_746_LB_0:
	mov rax,0
	ret
NS_E_748:
NS_E_RDI_748:
NS_E_748_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_748_LB_0
	cmp r11,90
	ja NS_E_748_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_748_LB_0:
	mov rax,0
	ret
NS_E_750:
NS_E_RDI_750:
NS_E_750_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_750_LB_0
	cmp r11,57
	ja NS_E_750_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_750_LB_0:
	mov rax,0
	ret
NS_E_752:
NS_E_RDI_752:
NS_E_752_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	add rsi,1
	bt r11,7
	jnc NS_E_752_LB_0
	add rsi,1
	bt r11,6
	jnc NS_E_752_LB_0
	add rsi,1
	bt r11,5
	jnc NS_E_752_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_752_LB_0:
	mov rax,0
	ret
NS_E_765:
NS_E_RDI_765:
	mov rdi,r8
	mov rsi,r9
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
	imul rcx,2
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_765_TBL
NS_E_765_ETR_TBL:
	push QWORD 1
NS_E_765_TBL:
	push rsi
	call NS_E_746_ETR_TBL
	cmp rax,0
	jz NS_E_765_MTC_c_al_0_failed
NS_E_765_MTC_c_al_0_succeed:
	pop r8
	jmp NS_E_765_succeed
NS_E_765_MTC_c_al_0_failed:
	pop rsi
	push rsi
	call NS_E_748_ETR_TBL
	cmp rax,0
	jz NS_E_765_MTC_c_al_1_failed
NS_E_765_MTC_c_al_1_succeed:
	pop r8
	jmp NS_E_765_succeed
NS_E_765_MTC_c_al_1_failed:
	pop rsi
	jmp NS_E_765_failed
NS_E_765_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_765_succeed_tbl
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
NS_E_765_succeed_tbl:
	mov rax,1
	ret
NS_E_765_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_765_failed_tbl
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
NS_E_765_failed_tbl:
	mov rax,0
	ret
NS_E_773:
NS_E_RDI_773:
	mov rdi,r8
	mov rsi,r9
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
	imul rcx,2
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_773_TBL
NS_E_773_ETR_TBL:
	push QWORD 1
NS_E_773_TBL:
	push rsi
	call NS_E_765_ETR_TBL
	cmp rax,0
	jz NS_E_773_MTC_name_0_failed
_grm_lst_781:
	call NS_E_775_ETR_TBL
	cmp rax,0
	jz _grm_lst_782
	jmp _grm_lst_781
_grm_lst_782:
	mov rax,1
NS_E_773_MTC_name_0_succeed:
	pop r8
	jmp NS_E_773_succeed
NS_E_773_MTC_name_0_failed:
	pop rsi
	jmp NS_E_773_failed
NS_E_773_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_773_succeed_tbl
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
NS_E_773_succeed_tbl:
	mov rax,1
	ret
NS_E_773_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_773_failed_tbl
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
NS_E_773_failed_tbl:
	mov rax,0
	ret
NS_E_775:
NS_E_RDI_775:
	mov rdi,r8
	mov rsi,r9
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
	imul rcx,2
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_775_TBL
NS_E_775_ETR_TBL:
	push QWORD 1
NS_E_775_TBL:
	push rsi
	call NS_E_765_ETR_TBL
	cmp rax,0
	jz NS_E_775_MTC_name_tl_0_failed
NS_E_775_MTC_name_tl_0_succeed:
	pop r8
	jmp NS_E_775_succeed
NS_E_775_MTC_name_tl_0_failed:
	pop rsi
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz NS_E_775_MTC_name_tl_1_failed
	add rsi,1
NS_E_775_MTC_name_tl_1_succeed:
	pop r8
	jmp NS_E_775_succeed
NS_E_775_MTC_name_tl_1_failed:
	pop rsi
	push rsi
	call NS_E_750_ETR_TBL
	cmp rax,0
	jz NS_E_775_MTC_name_tl_2_failed
NS_E_775_MTC_name_tl_2_succeed:
	pop r8
	jmp NS_E_775_succeed
NS_E_775_MTC_name_tl_2_failed:
	pop rsi
	jmp NS_E_775_failed
NS_E_775_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_775_succeed_tbl
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
NS_E_775_succeed_tbl:
	mov rax,1
	ret
NS_E_775_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_775_failed_tbl
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
NS_E_775_failed_tbl:
	mov rax,0
	ret
NS_E_793:
NS_E_RDI_793:
	mov rdi,r8
	mov rsi,r9
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
	imul rcx,1
	mov rdi,rcx
	mov rax,0
	call malloc
	mov rdi,rbx
	mov rsi,r14
	mov rdx,rax
	mov rcx,rsi
	push QWORD 0
	jmp NS_E_793_TBL
NS_E_793_ETR_TBL:
	push QWORD 1
NS_E_793_TBL:
	push rsi
	mov r11b,[rdi+rsi+8*1+0]
	cmp r11,95
	jnz NS_E_793_MTC_prm_name_0_failed
	add rsi,1
	call NS_E_773_ETR_TBL
	cmp rax,0
	jz NS_E_793_MTC_prm_name_0_failed
NS_E_793_MTC_prm_name_0_succeed:
	pop r8
	jmp NS_E_793_succeed
NS_E_793_MTC_prm_name_0_failed:
	pop rsi
	jmp NS_E_793_failed
NS_E_793_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_793_succeed_tbl
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
NS_E_793_succeed_tbl:
	mov rax,1
	ret
NS_E_793_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_793_failed_tbl
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
NS_E_793_failed_tbl:
	mov rax,0
	ret
NS_E_808:
; 	|» {  }
	jz NS_E_RDI_808
	jc emt_etr_c_lb_809
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
jmp NS_E_RDI_808
emt_etr_c_lb_809:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_808:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_810
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_810:
;clear 
	mov rax,r8
	stc
	ret
NS_E_811:
; 	|» {  }
	jz NS_E_RDI_811
	jc emt_etr_c_lb_812
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
jmp NS_E_RDI_811
emt_etr_c_lb_812:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_811:
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
	call NS_E_808
	mov QWORD [tmp],rax
	jc call_c_lb_813
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
	jmp call_nc_lb_814
call_c_lb_813:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn -2'
call_nc_lb_814:
; 	» "Hello World!!\n" |~ 0' : _p10
;push_reg
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_816+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_816+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,2
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_p10
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_817
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_818
emt_set_ptn_0_lb_817:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_818:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_819
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_819:
; 	» "Foo Baoo" |~ 0' : _p10
;push_reg
	push QWORD r9
	mov rdi,2
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_820+8*1]
	mov [rdi+8*2],rsi
	mov rsi,[cst_stg_820+8*0]
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
; 	$ 0' ⊢ ,s1 : ,_p10
; emt_ptn_crt_ptn 0',s1
; emt_set_ptn 2'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_821
	push rdi
	mov rdi,r8
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_822
emt_set_ptn_0_lb_821:
	mov r10,r8
	or r12,0b100
emt_set_ptn_1_lb_822:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_823
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
emt_dec_ptn_0_lb_823:
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
LB_824:
	mov bl,[r15]
	cmp rbx,0
	jz LB_825
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_824
LB_825:
; "B"
	mov BYTE [r13+8*1+r14],66
	add r14,1
; 1'
	mov r15,r10
	add r15,8
LB_826:
	mov bl,[r15]
	cmp rbx,0
	jz LB_827
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_826
LB_827:
; 1'
	mov r15,r10
	add r15,8
LB_828:
	mov bl,[r15]
	cmp rbx,0
	jz LB_829
	mov BYTE [r13+8*1+r14],bl
	add r14,1
	add r15,1
	jmp LB_828
LB_829:
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
;push_reg
	push QWORD r8
	push QWORD r10
	mov rbx,r9
	mov rdi,rbx
	call emt
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
;push_reg
	push QWORD r8
	mov rbx,r10
	mov rdi,rbx
	call emt
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r8
;push_reg
	mov rbx,r8
	mov rdi,rbx
	call emt
	mov rdi,rbx
	call dec_r
;pop_reg
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_830
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_830:
;clear 
	mov rax,r8
	stc
	ret
NS_E_831:
; 	|» {  }
	jz NS_E_RDI_831
	jc emt_etr_c_lb_832
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
jmp NS_E_RDI_831
emt_etr_c_lb_832:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_831:
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
	call NS_E_811
	mov QWORD [tmp],rax
	jc call_c_lb_833
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
	jmp call_nc_lb_834
call_c_lb_833:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
; emt_set_ptn {  }
call_nc_lb_834:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_836
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_836:
;clear 
	mov rax,r8
	stc
	ret
NS_E_837:
; 	|» {  }
	jz NS_E_RDI_837
	jc emt_etr_c_lb_838
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
jmp NS_E_RDI_837
emt_etr_c_lb_838:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_837:
; 	» prm.name.prs _ ⊢ 0' : { _p10 _p4 }→{ _p10 _p4 _p772 }
	mov QWORD [tmp],rbx
	mov rbx,0x0001000000000000
	add QWORD [NS_E_DYN_773],rbx
	mov rbx,QWORD [tmp]
	mov QWORD r9,NS_E_DYN_773
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,p : ,{ _p10 _p4 }→{ _p10 _p4 _p772 }
; emt_ptn_crt_ptn 0',p
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_839
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_840
emt_set_ptn_0_lb_839:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_840:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_841
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_841:
; 	∎ 1'
; emt_get_crt_ptn 1'
	bt r12,1
	jc emt_get_crt_ptn_0_lb_843
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_844
emt_get_crt_ptn_0_lb_843:
; unboxed
	stc
emt_get_crt_ptn_1_lb_844:
	mov QWORD r8,r9
	jc ret_lb_845
	push r8
; ; emt_dec_ptn 1'
; unknown
	bt r12,1
	jc emt_dec_ptn_0_lb_842
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_842:
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_845:
;clear 
	mov rax,r8
	stc
	ret
NS_E_846:
; 	|» {  }
	jz NS_E_RDI_846
	jc emt_etr_c_lb_847
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
jmp NS_E_RDI_846
emt_etr_c_lb_847:
	push rbx
	mov rbx,rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_846:
; 	» "FOO" |~ 0' : _p10
;push_reg
	mov rdi,1
	call mlc
	mov rdi,rax
	mov rsi,[cst_stg_848+8*0]
	mov [rdi+8*1],rsi
	mov rdx,[rdi]
	and rdx,~0xFFFF
	or rdx,0x10000
	add rdx,5
	mov [rdi],rdx
	mov QWORD r9,rdi
;pop_reg
	mov QWORD r8,r9
	and r12,~0b1
; 	$ 0' ⊢ ,s0 : ,_p10
; emt_ptn_crt_ptn 0',s0
; emt_set_ptn 1'
; unknown
	bt r12,0
	jc emt_set_ptn_0_lb_849
	push rdi
	mov rdi,r8
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_850
emt_set_ptn_0_lb_849:
	mov r9,r8
	or r12,0b10
emt_set_ptn_1_lb_850:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_851
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_851:
; » _^ ..
;push_reg
	push QWORD r9
	mov rbx,0
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
	imul r14,0
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
	mov r14,0
; //
	mov BYTE [r13+8*1+r14],0
	mov r8,r13
	btr r12,0
; 	∎ 0'
; emt_get_crt_ptn 0'
	bt r12,0
	jc emt_get_crt_ptn_0_lb_853
; boxed
	push rdi
	mov rdi,r8
	call inc_r
	mov r8,rdi
	pop rdi
	clc
	jmp emt_get_crt_ptn_1_lb_854
emt_get_crt_ptn_0_lb_853:
; unboxed
	stc
emt_get_crt_ptn_1_lb_854:
	mov QWORD r10,r8
	jc ret_lb_855
	push r10
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_852
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_852:
	pop r10
	clc
;clear 
	mov rax,r10
	ret
ret_lb_855:
;clear  1'~s0
	bt r12,1
	jc clear_lb_856
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_lb_856:
	mov rax,r10
	stc
	ret
section .data
	NS_E_DYN_746:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_746
	NS_E_DYN_748:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_748
	NS_E_DYN_750:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_750
	NS_E_DYN_752:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_752
	NS_E_DYN_756:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_757:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_759:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_760:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_762:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_763:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_766:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_767:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_765:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_765
	NS_E_DYN_776:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_773:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_773
	NS_E_DYN_783:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_784:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_785:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_775:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_775
	NS_E_DYN_794:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_793:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_793
	NS_E_DYN_808:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_808
	NS_E_DYN_811:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_811
	NS_E_DYN_831:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_831
	NS_E_DYN_837:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_837
	NS_E_DYN_846:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_846
	cst_stg_848: db 70,79,79,0,0,0,0,0
	cst_stg_820: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_816: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_721: db 70,79,79,0,0,0,0,0
	cst_stg_693: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_689: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_594: db 70,79,79,0,0,0,0,0
	cst_stg_566: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_562: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_467: db 70,79,79,0,0,0,0,0
	cst_stg_441: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_437: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_261: db 70,79,79,0,0,0,0,0
	cst_stg_235: db 70,111,111,32,66,97,111,111,0,0,0,0,0,0,0,0
	cst_stg_231: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
	cst_stg_136: db 70,79,79,0,0,0,0,0
	cst_stg_112: db 72,101,108,108,111,32,87,111,114,108,100,33,33,10,0,0
