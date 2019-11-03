%include "cmu.s"
main:
	mov r12,0
	not r12
	call NS_E_85
	mov QWORD [CST_DYN_85+8*1],rax
	mov rbx,0
	setc bl
	mov QWORD [CST_DYN_85],rbx
	mov rdi,0
	call mlc
	mov rdi,rax
	clc
	cmp rdi,0
	call NS_E_RDI_136
	mov rdi,rax
	mov rsi,str_ret
	call pnt
	call pnt_str_ret
	call exec_out
	jmp _end
NS_E_30:
NS_E_RDI_30:
NS_E_30_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_30_LB_0
	bt r11,7
	jc LB_31
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
LB_31:
	add rsi,1
	bt r11,6
	jc LB_32
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
LB_32:
	add rsi,1
	bt r11,5
	jc LB_33
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
LB_33:
	add rsi,1
	bt r11,5
	jc LB_33
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
NS_E_30_LB_0:
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
NS_E_35:
NS_E_RDI_35:
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
	jmp NS_E_35_TBL
NS_E_35_ETR_TBL:
	push QWORD 1
NS_E_35_TBL:
	push rsi
; _chr
	call NS_E_30_ETR_TBL
	cmp rax,0
	jnz LB_72
	push rdi
	push rdx
	pop rdx
	pop rdi
	jmp NS_E_35_MTC_0_failed
LB_72:
	mov QWORD [prs_vct+16*0],r11
	mov QWORD [prs_vct+8*1+16*0],r10
; "A"
	mov r11,0
	mov r11b,BYTE [rdi+rsi+8*1+0]
	cmp r11b,65
	jz LB_76
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_77
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_77:
	pop rdx
	pop rdi
	jmp NS_E_35_MTC_0_failed
LB_76:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],unt
; _chr
	call NS_E_30_ETR_TBL
	cmp rax,0
	jnz LB_81
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_82
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dec_r
LB_82:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_83
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_83:
	pop rdx
	pop rdi
	jmp NS_E_35_MTC_0_failed
LB_81:
	mov QWORD [prs_vct+16*2],r11
	mov QWORD [prs_vct+8*1+16*2],r10
NS_E_35_MTC_0_succeed:
	pop r8
	push rdi
	push rdx
	mov rdi,3
	call mlc
	mov rdi,rax
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_66
	btr QWORD [rdi],2
LB_66:
	mov rbx,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rbx
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_67
	btr QWORD [rdi],1
LB_67:
	mov rbx,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rbx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_68
	btr QWORD [rdi],0
LB_68:
	mov rbx,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rbx
	push rdi
	mov rdi,2
	call mlc
	btr QWORD [rax],1
	mov r10,rax
	pop rax
	mov QWORD [r10+8*1],0
	mov QWORD [r10+8*2],rax
	mov r11,0
	pop rdx
	pop rdi
	jmp NS_E_35_succeed
NS_E_35_MTC_0_failed:
	pop rsi
	push rsi
; "H"
	mov r11,0
	mov r11b,BYTE [rdi+rsi+8*1+0]
	cmp r11b,72
	jz LB_46
	push rdi
	push rdx
	pop rdx
	pop rdi
	jmp NS_E_35_MTC_1_failed
LB_46:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],unt
; _chr
	call NS_E_30_ETR_TBL
	cmp rax,0
	jnz LB_50
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_51
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_51:
	pop rdx
	pop rdi
	jmp NS_E_35_MTC_1_failed
LB_50:
	mov QWORD [prs_vct+16*1],r11
	mov QWORD [prs_vct+8*1+16*1],r10
; "O"
	mov r11,0
	mov r11b,BYTE [rdi+rsi+8*1+0]
	cmp r11b,79
	jz LB_55
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_56
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dec_r
LB_56:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_57
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_57:
	pop rdx
	pop rdi
	jmp NS_E_35_MTC_1_failed
LB_55:
	add rsi,1
	mov rbx,0x0001_0000_0000_0000
	add QWORD [unt],rbx
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],unt
; _chr
	call NS_E_30_ETR_TBL
	cmp rax,0
	jnz LB_61
	push rdi
	push rdx
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_62
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dec_r
LB_62:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_63
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dec_r
LB_63:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_64
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dec_r
LB_64:
	pop rdx
	pop rdi
	jmp NS_E_35_MTC_1_failed
LB_61:
	mov QWORD [prs_vct+16*3],r11
	mov QWORD [prs_vct+8*1+16*3],r10
NS_E_35_MTC_1_succeed:
	pop r8
	push rdi
	push rdx
	mov rdi,4
	call mlc
	mov rdi,rax
	mov rsi,QWORD [prs_vct+16*3]
	bt rsi,0
	jc LB_39
	btr QWORD [rdi],3
LB_39:
	mov rbx,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rbx
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_40
	btr QWORD [rdi],2
LB_40:
	mov rbx,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rbx
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_41
	btr QWORD [rdi],1
LB_41:
	mov rbx,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rbx
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_42
	btr QWORD [rdi],0
LB_42:
	mov rbx,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rbx
	push rdi
	mov rdi,2
	call mlc
	btr QWORD [rax],1
	mov r10,rax
	pop rax
	mov QWORD [r10+8*1],1
	mov QWORD [r10+8*2],rax
	mov r11,0
	pop rdx
	pop rdi
	jmp NS_E_35_succeed
NS_E_35_MTC_1_failed:
	pop rsi
	jmp NS_E_35_failed
NS_E_35_succeed:
	pop rbx
	cmp rbx,0
	jnz NS_E_35_succeed_tbl
	push rsi
	push rdi
	push r10
	push r11
	mov rdi,rdx
	mov rax,0
	call free
	mov rdi,3
	call mlc
	pop r11
	pop r8
	mov rsi,[rax]
	btr rsi,0
	bt r11,0
	jc LB_38
	btr rsi,2
LB_38:
	mov [rax],rsi
	mov QWORD [rax+8*3],r8
	pop rdi
	pop rsi
	mov QWORD [rax+8*1],rdi
	mov QWORD [rax+8*2],rsi
	clc
	ret
NS_E_35_succeed_tbl:
	ret
NS_E_35_failed:
	pop rbx
	cmp rbx,0
	jnz NS_E_35_failed_tbl
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
NS_E_35_failed_tbl:
	mov rax,0
	ret
NS_E_85:
NS_E_RDI_85:
; 	» "HxOi" |~ 0' : _stg
;push_reg
	mov rdi,4
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],72
	add rsi,1
	mov BYTE [rdi+8*1+rsi],120
	add rsi,1
	mov BYTE [rdi+8*1+rsi],79
	add rsi,1
	mov BYTE [rdi+8*1+rsi],105
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
	jc emt_set_ptn_0_lb_86
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_87
emt_set_ptn_0_lb_86:
	mov r9,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b10
emt_set_ptn_1_lb_87:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_88
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_88:
; 	» 0xr0 |~ 0' : _r64
	mov QWORD r10,0x0
	mov QWORD r8,r10
	or r12,0b1
; 	$ 0' ⊢ ,x0 : ,_r64
; emt_ptn_crt_ptn 0',x0
	mov rbx,r8
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 2'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r10,rbx
	bts r12,2
; ; emt_dec_ptn 0'
; unboxed
; 	g0.prs { 1' 2' } ⊢ { 0' 1' 2' } : { _stg _r64 _p34 }
; push_s_ex 
	sub rsp,8
	mov QWORD [tmp_push],r14
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
	bts r12,3
	mov r11,r9
	bt r9,1
	jc lb_92
	and r12,~0b1000
lb_92:
; emt_ptn_set_ptn { 3' 2' },{ 0' 1' }
; emt_ptn_set_ptn 3',0'
	mov rbx,r11
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 0'
; unknown
	bt r12,3
	jc emt_set_ptn_0_lb_93
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_94
emt_set_ptn_0_lb_93:
	mov r8,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b1
emt_set_ptn_1_lb_94:
; emt_ptn_set_ptn 2',1'
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	mov r9,rbx
	bts r12,1
; ; emt_dec_ptn { 3' 2' }
; unboxed
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_98
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
emt_dec_ptn_0_lb_98:
	call NS_E_35
	mov QWORD [tmp],rax
	jc call_c_lb_99
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 0' 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_108
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_109
emt_set_ptn_0_lb_108:
	mov r8,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b1
emt_set_ptn_1_lb_109:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	bts r12,1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_112
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_113
emt_set_ptn_0_lb_112:
	mov r10,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b100
emt_set_ptn_1_lb_113:
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
	jmp call_nc_lb_100
call_c_lb_99:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	add rsp,8
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 0' 1' 2' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 0'
; unknown
	jc emt_set_ptn_0_lb_101
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_102
emt_set_ptn_0_lb_101:
	mov r8,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b1
emt_set_ptn_1_lb_102:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 1'
; unboxed
	mov rbx,QWORD [set_ptn_vct+8*1+16*1]
	mov r9,rbx
	bts r12,1
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],2
	mov r13,[rbx+8*3]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_105
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_106
emt_set_ptn_0_lb_105:
	mov r10,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b100
emt_set_ptn_1_lb_106:
call_nc_lb_100:
; 	_pp_v 2' ⊢ { 2' 3' } : { _p34 _stg }
; push_s_ex  0'~s0 1'~x0
	sub rsp,24
	mov QWORD [tmp_push],r14
	mov QWORD [rsp+8*2],r8
	mov QWORD [rsp+8*1],r9
	mov QWORD [rsp],r12
	mov QWORD r14,[tmp_push]
; emt_ptn_mov
; emt_ptn_set_ptn 2',0'
	mov rbx,r10
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn 0'
; unknown
	bt r12,2
	jc emt_set_ptn_0_lb_114
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r8,rdi
	pop rdi
	and r12,~0b1
	jmp emt_set_ptn_1_lb_115
emt_set_ptn_0_lb_114:
	mov r8,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b1
emt_set_ptn_1_lb_115:
; ; emt_dec_ptn 2'
; unknown
	bt r12,2
	jc emt_dec_ptn_0_lb_116
;push_reg
	push QWORD r8
	push QWORD r10
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r10
	pop QWORD r8
emt_dec_ptn_0_lb_116:
	call NS_E_14
	mov QWORD [tmp],rax
	jc call_c_lb_117
	clc
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 2' 3' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_124
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_125
emt_set_ptn_0_lb_124:
	mov r10,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b100
emt_set_ptn_1_lb_125:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_126
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_127
emt_set_ptn_0_lb_126:
	mov r11,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b1000
emt_set_ptn_1_lb_127:
; ; emt_dec 
; boxed
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	push QWORD r11
	mov rdi,rbx
	call dec_r
;pop_reg
	pop QWORD r11
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
	jmp call_nc_lb_118
call_c_lb_117:
; pop_ex
	mov QWORD r12,[rsp]
	mov QWORD [tmp_pop],r14
	mov QWORD r9,[rsp+8*1]
	mov QWORD r8,[rsp+8*2]
	add rsp,24
	mov QWORD r14,[tmp_pop]
	mov rbx,[tmp]
	stc
	mov QWORD [set_ptn_vct+8*1],rbx
; emt_set_ptn { 2' 3' }
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],0
	mov r13,[rbx+8*1]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 2'
; unknown
	jc emt_set_ptn_0_lb_119
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r10,rdi
	pop rdi
	and r12,~0b100
	jmp emt_set_ptn_1_lb_120
emt_set_ptn_0_lb_119:
	mov r10,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b100
emt_set_ptn_1_lb_120:
	mov rbx,QWORD [set_ptn_vct+8*1+16*0]
	bt QWORD [rbx],1
	mov r13,[rbx+8*2]
	mov [set_ptn_vct+8*1+16*1],r13
; emt_set_ptn 3'
; unknown
	jc emt_set_ptn_0_lb_121
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*1]
	call inc_r
	mov r11,rdi
	pop rdi
	and r12,~0b1000
	jmp emt_set_ptn_1_lb_122
emt_set_ptn_0_lb_121:
	mov r11,QWORD [set_ptn_vct+8*1+16*1]
	or r12,0b1000
emt_set_ptn_1_lb_122:
call_nc_lb_118:
; emt_get_ptn 3'
	bt r12,3
	jc emt_get_ptn_0_lb_128
; boxed
	push rdi
	mov rdi,r11
	call inc_r
	mov r11,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_129
emt_get_ptn_0_lb_128:
; unboxed
	stc
emt_get_ptn_1_lb_129:
	mov QWORD rcx,r11
	mov rbx,0
	setc bl
	mov r14,QWORD [out_tp_p]
	shl r14,3
	mov QWORD [out_vct+r14+2*r14],rbx
	mov rbx,rcx
	mov QWORD [out_vct+r14+2*r14+8*1],rbx
	mov rbx,QWORD NS_E_RDI_13
	mov QWORD [out_vct+r14+2*r14+8*2],rbx
	add QWORD [out_tp_p],1
	and QWORD [out_tp_p],0xff
	add QWORD [out_n],1
; ; emt_dec_ptn 3'
; unknown
	bt r12,3
	jc emt_dec_ptn_0_lb_130
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
emt_dec_ptn_0_lb_130:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_131
;push_reg
	push QWORD r8
	push QWORD r9
	push QWORD r10
	call exec_out
;pop_reg
	pop QWORD r10
	pop QWORD r9
	pop QWORD r8
LB_131:
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
	jc ret_lb_132
	push r11
; ; emt_dec_ptn {  }
	pop r11
	clc
;clear 
	mov rax,r11
	ret
ret_lb_132:
;clear  2'~a0 0'~s0 1'~x0
	bt r12,2
	jc clear_lb_133
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r10
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
clear_lb_133:
	bt r12,0
	jc clear_lb_134
;push_reg
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
clear_lb_134:
	bt r12,1
	jc clear_lb_135
;push_reg
	mov rdi,r9
	call dec_r
;pop_reg
clear_lb_135:
	mov rax,r11
	stc
	ret
NS_E_136:
; 	|» {  }
	jz NS_E_RDI_136
	jc emt_etr_c_lb_137
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
jmp NS_E_RDI_136
emt_etr_c_lb_137:
	push rbx
	mov QWORD [set_ptn_vct+8*1],rdi
; emt_set_ptn {  }
	pop rbx
NS_E_RDI_136:
; 	» "\n~~~\n" |~ 0' : _stg
;push_reg
	mov rdi,5
	call mlc_s8
	mov rdi,rax
	mov rsi,0
	mov QWORD [rdi+8*1+rsi],0
	mov BYTE [rdi+8*1+rsi],10
	add rsi,1
	mov BYTE [rdi+8*1+rsi],126
	add rsi,1
	mov BYTE [rdi+8*1+rsi],126
	add rsi,1
	mov BYTE [rdi+8*1+rsi],126
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
	jc emt_set_ptn_0_lb_138
	push rdi
	mov rdi,QWORD [set_ptn_vct+8*1+16*0]
	call inc_r
	mov r9,rdi
	pop rdi
	and r12,~0b10
	jmp emt_set_ptn_1_lb_139
emt_set_ptn_0_lb_138:
	mov r9,QWORD [set_ptn_vct+8*1+16*0]
	or r12,0b10
emt_set_ptn_1_lb_139:
; ; emt_dec_ptn 0'
; unknown
	bt r12,0
	jc emt_dec_ptn_0_lb_140
;push_reg
	push QWORD r8
	push QWORD r9
	mov rdi,r8
	call dec_r
;pop_reg
	pop QWORD r9
	pop QWORD r8
emt_dec_ptn_0_lb_140:
; emt_get_ptn 1'
	bt r12,1
	jc emt_get_ptn_0_lb_141
; boxed
	push rdi
	mov rdi,r9
	call inc_r
	mov r9,rdi
	pop rdi
	clc
	jmp emt_get_ptn_1_lb_142
emt_get_ptn_0_lb_141:
; unboxed
	stc
emt_get_ptn_1_lb_142:
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
	jc emt_dec_ptn_0_lb_143
;push_reg
	push QWORD r9
	mov rdi,r9
	call dec_r
;pop_reg
	pop QWORD r9
emt_dec_ptn_0_lb_143:
	mov rbx,QWORD [out_n]
	cmp rbx,128
	jnz LB_144
;push_reg
	call exec_out
;pop_reg
LB_144:
; 	∎ {  }
; emt_get_crt_ptn {  }
;push_reg
	mov rdi,0
	call mlc
	mov r8,rax
;pop_reg
	clc
	jc ret_lb_145
	push r8
; ; emt_dec_ptn {  }
	pop r8
	clc
;clear 
	mov rax,r8
	ret
ret_lb_145:
;clear 
	mov rax,r8
	stc
	ret
section .data
	NS_E_DYN_30:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30
	NS_E_DYN_36:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_37:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_35:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_35
	CST_DYN_85:
		dq 1
		dq 1
	NS_E_DYN_136:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_136
