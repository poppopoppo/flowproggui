%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_4855
	call NS_E_6871
	call exec_out
	jmp _end
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
	mov rdi,fmt_emt
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rdi,r13
	bt r12,0
	call pp0
	mov rdi,fmt_nl
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	ret
NS_E_3640:
NS_E_RDI_3640:
NS_E_3640_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_3641
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_3641:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3643:
NS_E_RDI_3643:
NS_E_3643_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_3643_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_3643_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3644:
NS_E_RDI_3644:
NS_E_3644_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_3644_LB_0
	cmp r11,57
	ja NS_E_3644_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_3644_LB_0:
	mov rax,0
	ret
NS_E_3646:
NS_E_RDI_3646:
NS_E_3646_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_3646_LB_0
	cmp r11,122
	ja NS_E_3646_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_3646_LB_0:
	mov rax,0
	ret
NS_E_3645:
NS_E_RDI_3645:
NS_E_3645_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_3645_LB_0
	cmp r11,90
	ja NS_E_3645_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_3645_LB_0:
	mov rax,0
	ret
NS_E_28:
	mov rdi,r13
	bt r12,0
NS_E_RDI_28:
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
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rax,[r14]
	lea r8,[r8-1+r13]
	shr rax,32
	cmp r8,rax
	jge err_s8_ge
	mov rax,[r9]
	lea r10,[r10-1+r13]
	shr rax,32
	cmp r10,rax
	jge err_s8_ge
	lea rsi,[r14+8+r8]
	lea rdi,[r9+8+r10]
	mov rcx,r13
	std
	rep movsb
	cld
	add r8,1
	add r10,1
	ret
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_16: dq 0
NS_E_16:
NS_E_RDI_16:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,QWORD [rdi+8+rsi]
	and rax,0xff
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_3642:
NS_E_RDI_3642:
NS_E_3642_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
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
	pop r14
	cmp rdi,0
	jz NS_E_3642_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_3642_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_3660:
; 	|» { 0' 1' }
NS_E_RDI_3660:
MTC_LB_3661:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_3662
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_3663
	bt QWORD [rax],0
	jc LB_3664
	btr r12,4
	jmp LB_3665
LB_3664:
	bts r12,4
LB_3665:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3663:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_3668
	btr r12,5
	jmp LB_3669
LB_3668:
	bts r12,5
LB_3669:
	mov r8,r11
	bt r12,5
	jc LB_3666
	btr r12,2
	jmp LB_3667
LB_3666:
	bts r12,2
LB_3667:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_3672
	btr r12,5
	jmp LB_3673
LB_3672:
	bts r12,5
LB_3673:
	mov r9,r11
	bt r12,5
	jc LB_3670
	btr r12,3
	jmp LB_3671
LB_3670:
	bts r12,3
LB_3671:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3674:
	cmp r15,0
	jz LB_3675
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3674
LB_3675:
; _f39 %_3647 ⊢ %_3651 : %_3651
 ; {>  %_3649~2':_r64 %_3647~0':_r64 %_3650~3':(_lst)◂(_r64) }
	add r13,1
; _f3660 { %_3651 %_3650 } ⊢ { %_3652 %_3653 } : { %_3652 %_3653 }
 ; {>  %_3649~2':_r64 %_3651~0':_r64 %_3650~3':(_lst)◂(_r64) }
; _f3660 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_3678
	btr r12,1
	jmp LB_3679
LB_3678:
	bts r12,1
LB_3679:
	call NS_E_3660
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_3676
	btr r12,2
	jmp LB_3677
LB_3676:
	bts r12,2
LB_3677:
	add rsp,16
; _f38 %_3652 ⊢ %_3654 : %_3654
 ; {>  %_3649~2':_r64 %_3653~1':_stg %_3652~0':_r64 }
	sub r13,1
; _f16 { %_3653 %_3654 %_3649 } ⊢ { %_3655 %_3656 %_3657 } : { %_3655 %_3656 %_3657 }
 ; {>  %_3649~2':_r64 %_3654~0':_r64 %_3653~1':_stg }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_3680
	btr r12,3
	jmp LB_3681
LB_3680:
	bts r12,3
LB_3681:
	mov r14,r13
	bt r12,0
	jc LB_3682
	btr r12,1
	jmp LB_3683
LB_3682:
	bts r12,1
LB_3683:
	mov r13,r9
	bt r12,3
	jc LB_3684
	btr r12,0
	jmp LB_3685
LB_3684:
	bts r12,0
LB_3685:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_3656 %_3655 }
 ; {>  %_3655~0':_stg %_3657~2':_r64 %_3656~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_3686
	mov rdi,r8
	call dlt
LB_3686:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_3687
	btr r12,2
	jmp LB_3688
LB_3687:
	bts r12,2
LB_3688:
	mov r14,r13
	bt r12,0
	jc LB_3689
	btr r12,1
	jmp LB_3690
LB_3689:
	bts r12,1
LB_3690:
	mov r13,r8
	bt r12,2
	jc LB_3691
	btr r12,0
	jmp LB_3692
LB_3691:
	bts r12,0
LB_3692:
	ret
MTC_LB_3662:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_3693
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_3694
	bt QWORD [rax],0
	jc LB_3695
	btr r12,2
	jmp LB_3696
LB_3695:
	bts r12,2
LB_3696:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_3694:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_3697:
	cmp r15,0
	jz LB_3698
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3697
LB_3698:
; _f14 %_3647 ⊢ { %_3658 %_3659 } : { %_3658 %_3659 }
 ; {>  %_3647~0':_r64 }
; _f14 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_3658 %_3659 }
 ; {>  %_3658~0':_r64 %_3659~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_3693:
NS_E_3703:
; 	|» 0'
NS_E_RDI_3703:
; » 0xr0 |~ {  } ⊢ %_3700 : %_3700
 ; {>  %_3699~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_3700
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f3660 { %_3700 %_3699 } ⊢ { %_3701 %_3702 } : { %_3701 %_3702 }
 ; {>  %_3700~1':_r64 %_3699~0':(_lst)◂(_r64) }
; _f3660 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_3704
	btr r12,2
	jmp LB_3705
LB_3704:
	bts r12,2
LB_3705:
	mov r14,r13
	bt r12,0
	jc LB_3706
	btr r12,1
	jmp LB_3707
LB_3706:
	bts r12,1
LB_3707:
	mov r13,r8
	bt r12,2
	jc LB_3708
	btr r12,0
	jmp LB_3709
LB_3708:
	bts r12,0
LB_3709:
	call NS_E_3660
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_3702
 ; {>  %_3702~1':_stg %_3701~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_3710
	mov rdi,r13
	call dlt
LB_3710:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_3711
	btr r12,0
	jmp LB_3712
LB_3711:
	bts r12,0
LB_3712:
	ret
NS_E_3713:
NS_E_RDI_3713:
NS_E_3713_ETR_TBL:
NS_E_3713_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_3753
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_3753
	jmp LB_3754
LB_3753:
	jmp NS_E_3713_MTC_0_failed
LB_3754:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_3714_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3758
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3759
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3759:
	jmp NS_E_3713_MTC_0_failed
LB_3758:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3746
	btr r12,1
	jmp LB_3747
LB_3746:
	bts r12,1
LB_3747:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3744
	btr r12,0
	jmp LB_3745
LB_3744:
	bts r12,0
LB_3745:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3741
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_3761
	btr r12,2
	jmp LB_3762
LB_3761:
	bts r12,2
LB_3762:
	mov r13,r14
	bt r12,1
	jc LB_3763
	btr r12,0
	jmp LB_3764
LB_3763:
	bts r12,0
LB_3764:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f3703 %_3716 ⊢ %_3717 : %_3717
 ; {>  %_3716~0':(_lst)◂(_r64) }
; _f3703 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_3703
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_3717 ⊢ %_3718 : %_3718
 ; {>  %_3717~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_3718
 ; {>  %_3718~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3739
	btr r12,3
	jmp LB_3740
LB_3739:
	bts r12,3
LB_3740:
	mov r8,0
	bts r12,2
	ret
LB_3741:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3743
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3742
LB_3743:
	add rsp,8
	ret
NS_E_3713_MTC_0_failed:
	add rsp,32
	pop r14
LB_3742:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3714:
NS_E_RDI_3714:
NS_E_3714_ETR_TBL:
NS_E_3714_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_3789
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_3789
	jmp LB_3790
LB_3789:
	jmp NS_E_3714_MTC_0_failed
LB_3790:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_3715_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3794
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3795
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3795:
	jmp NS_E_3714_MTC_0_failed
LB_3794:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_3714_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3800
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_3801
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_3801:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3802
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3802:
	jmp NS_E_3714_MTC_0_failed
LB_3800:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_3782
	btr r12,2
	jmp LB_3783
LB_3782:
	bts r12,2
LB_3783:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3780
	btr r12,1
	jmp LB_3781
LB_3780:
	bts r12,1
LB_3781:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3778
	btr r12,0
	jmp LB_3779
LB_3778:
	bts r12,0
LB_3779:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_3775
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_3804
	btr r12,3
	jmp LB_3805
LB_3804:
	bts r12,3
LB_3805:
	mov r14,r8
	bt r12,2
	jc LB_3806
	btr r12,1
	jmp LB_3807
LB_3806:
	bts r12,1
LB_3807:
	mov r8,r13
	bt r12,0
	jc LB_3808
	btr r12,2
	jmp LB_3809
LB_3808:
	bts r12,2
LB_3809:
	mov r13,r9
	bt r12,3
	jc LB_3810
	btr r12,0
	jmp LB_3811
LB_3810:
	bts r12,0
LB_3811:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_3719 %_3720 } ⊢ %_3721 : %_3721
 ; {>  %_3720~1':(_lst)◂(_r64) %_3719~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3721 ⊢ %_3722 : %_3722
 ; {>  %_3721~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3722
 ; {>  %_3722~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_3769
	btr r12,2
	jmp LB_3770
LB_3769:
	bts r12,2
LB_3770:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3767
	btr QWORD [rdi],0
	jmp LB_3768
LB_3767:
	bts QWORD [rdi],0
LB_3768:
	mov r8,r14
	bt r12,1
	jc LB_3773
	btr r12,2
	jmp LB_3774
LB_3773:
	bts r12,2
LB_3774:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3771
	btr QWORD [rdi],1
	jmp LB_3772
LB_3771:
	bts QWORD [rdi],1
LB_3772:
	mov rsi,1
	bt r12,3
	jc LB_3765
	mov rsi,0
	bt r9,0
	jc LB_3765
	jmp LB_3766
LB_3765:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3766:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3775:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3777
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3776
LB_3777:
	add rsp,8
	ret
NS_E_3714_MTC_0_failed:
	add rsp,48
	pop r14
LB_3776:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_3824
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_3824
	jmp LB_3825
LB_3824:
	jmp NS_E_3714_MTC_1_failed
LB_3825:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3817
	btr r12,0
	jmp LB_3818
LB_3817:
	bts r12,0
LB_3818:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3814
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_3723 : %_3723
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_3723 ⊢ %_3724 : %_3724
 ; {>  %_3723~°1◂{  }:(_lst)◂(t744'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_3724
 ; {>  %_3724~°0◂°1◂{  }:(_opn)◂((_lst)◂(t747'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_3812
	mov rsi,0
	bt r9,0
	jc LB_3812
	jmp LB_3813
LB_3812:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3813:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3814:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3816
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3815
LB_3816:
	add rsp,8
	ret
NS_E_3714_MTC_1_failed:
	add rsp,16
	pop r14
LB_3815:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_3640_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3846
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3714_MTC_2_failed
LB_3846:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_3714_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3851
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_3852
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_3852:
	jmp NS_E_3714_MTC_2_failed
LB_3851:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_3841
	btr r12,1
	jmp LB_3842
LB_3841:
	bts r12,1
LB_3842:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3839
	btr r12,0
	jmp LB_3840
LB_3839:
	bts r12,0
LB_3840:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_3836
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_3725 %_3726 } ⊢ %_3727 : %_3727
 ; {>  %_3725~0':_r64 %_3726~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_3727 ⊢ %_3728 : %_3728
 ; {>  %_3727~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_3728
 ; {>  %_3728~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_3830
	btr r12,2
	jmp LB_3831
LB_3830:
	bts r12,2
LB_3831:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_3828
	btr QWORD [rdi],0
	jmp LB_3829
LB_3828:
	bts QWORD [rdi],0
LB_3829:
	mov r8,r14
	bt r12,1
	jc LB_3834
	btr r12,2
	jmp LB_3835
LB_3834:
	bts r12,2
LB_3835:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_3832
	btr QWORD [rdi],1
	jmp LB_3833
LB_3832:
	bts QWORD [rdi],1
LB_3833:
	mov rsi,1
	bt r12,3
	jc LB_3826
	mov rsi,0
	bt r9,0
	jc LB_3826
	jmp LB_3827
LB_3826:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_3827:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_3836:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3838
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3837
LB_3838:
	add rsp,8
	ret
NS_E_3714_MTC_2_failed:
	add rsp,32
	pop r14
LB_3837:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3715:
NS_E_RDI_3715:
NS_E_3715_ETR_TBL:
NS_E_3715_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_3866
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_3866
	jmp LB_3867
LB_3866:
	jmp NS_E_3715_MTC_0_failed
LB_3867:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3859
	btr r12,0
	jmp LB_3860
LB_3859:
	bts r12,0
LB_3860:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3856
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_3729 : %_3729
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_3729
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_3729 ⊢ %_3730 : %_3730
 ; {>  %_3729~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3730
 ; {>  %_3730~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3854
	btr r12,3
	jmp LB_3855
LB_3854:
	bts r12,3
LB_3855:
	mov r8,0
	bts r12,2
	ret
LB_3856:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3858
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3857
LB_3858:
	add rsp,8
	ret
NS_E_3715_MTC_0_failed:
	add rsp,16
	pop r14
LB_3857:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_3880
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_3880
	jmp LB_3881
LB_3880:
	jmp NS_E_3715_MTC_1_failed
LB_3881:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3873
	btr r12,0
	jmp LB_3874
LB_3873:
	bts r12,0
LB_3874:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3870
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_3731 : %_3731
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_3731
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_3731 ⊢ %_3732 : %_3732
 ; {>  %_3731~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3732
 ; {>  %_3732~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3868
	btr r12,3
	jmp LB_3869
LB_3868:
	bts r12,3
LB_3869:
	mov r8,0
	bts r12,2
	ret
LB_3870:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3872
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3871
LB_3872:
	add rsp,8
	ret
NS_E_3715_MTC_1_failed:
	add rsp,16
	pop r14
LB_3871:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_3894
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_3894
	jmp LB_3895
LB_3894:
	jmp NS_E_3715_MTC_2_failed
LB_3895:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3887
	btr r12,0
	jmp LB_3888
LB_3887:
	bts r12,0
LB_3888:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3884
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_3733 : %_3733
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_3733
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_3733 ⊢ %_3734 : %_3734
 ; {>  %_3733~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3734
 ; {>  %_3734~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3882
	btr r12,3
	jmp LB_3883
LB_3882:
	bts r12,3
LB_3883:
	mov r8,0
	bts r12,2
	ret
LB_3884:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3886
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3885
LB_3886:
	add rsp,8
	ret
NS_E_3715_MTC_2_failed:
	add rsp,16
	pop r14
LB_3885:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_3908
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_3908
	jmp LB_3909
LB_3908:
	jmp NS_E_3715_MTC_3_failed
LB_3909:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3901
	btr r12,0
	jmp LB_3902
LB_3901:
	bts r12,0
LB_3902:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3898
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_3735 : %_3735
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_3735
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_3735 ⊢ %_3736 : %_3736
 ; {>  %_3735~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3736
 ; {>  %_3736~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3896
	btr r12,3
	jmp LB_3897
LB_3896:
	bts r12,3
LB_3897:
	mov r8,0
	bts r12,2
	ret
LB_3898:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3900
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3899
LB_3900:
	add rsp,8
	ret
NS_E_3715_MTC_3_failed:
	add rsp,16
	pop r14
LB_3899:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_3922
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_3922
	jmp LB_3923
LB_3922:
	jmp NS_E_3715_MTC_4_failed
LB_3923:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3915
	btr r12,0
	jmp LB_3916
LB_3915:
	bts r12,0
LB_3916:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3912
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_3737 : %_3737
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_3737
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_3737 ⊢ %_3738 : %_3738
 ; {>  %_3737~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3738
 ; {>  %_3738~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3910
	btr r12,3
	jmp LB_3911
LB_3910:
	bts r12,3
LB_3911:
	mov r8,0
	bts r12,2
	ret
LB_3912:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3914
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3913
LB_3914:
	add rsp,8
	ret
NS_E_3715_MTC_4_failed:
	add rsp,16
	pop r14
LB_3913:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3924:
NS_E_RDI_3924:
NS_E_3924_ETR_TBL:
NS_E_3924_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_3640_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3960
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3924_MTC_0_failed
LB_3960:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3955
	btr r12,0
	jmp LB_3956
LB_3955:
	bts r12,0
LB_3956:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3952
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_3926 : %_3926
 ; {>  %_3925~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_3926
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_3927 : %_3927
 ; {>  %_3926~1':_r64 %_3925~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_3927
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f33 { %_3925 %_3926 } ⊢ { %_3928 %_3929 %_3930 } : { %_3928 %_3929 %_3930 }
 ; {>  %_3926~1':_r64 %_3925~0':_r64 %_3927~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_3927 %_3928 } ⊢ { %_3931 %_3932 %_3933 } : { %_3931 %_3932 %_3933 }
 ; {>  %_3930~3':_r64 %_3929~1':_r64 %_3928~0':_r64 %_3927~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_3936:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_3937
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_3937
LB_3938:
	cmp r15,0
	jz LB_3939
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3938
LB_3939:
; _some %_3932 ⊢ %_3934 : %_3934
 ; {>  %_3931~2':_r64 %_3929~1':_r64 %_3932~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3934
 ; {>  %_3931~2':_r64 %_3929~1':_r64 %_3934~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_3940
	mov rdi,r8
	call dlt
LB_3940:
	bt r12,1
	jc LB_3941
	mov rdi,r14
	call dlt
LB_3941:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3942
	btr r12,3
	jmp LB_3943
LB_3942:
	bts r12,3
LB_3943:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3937:
	mov r15,0
LB_3945:
	cmp r15,0
	jz LB_3946
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3945
LB_3946:
; _none {  } ⊢ %_3935 : %_3935
 ; {>  %_3930~3':_r64 %_3933~4':_r64 %_3931~2':_r64 %_3929~1':_r64 %_3932~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_3935
 ; {>  %_3930~3':_r64 %_3933~4':_r64 %_3931~2':_r64 %_3929~1':_r64 %_3932~0':_r64 %_3935~°1◂{  }:(_opn)◂(t822'(0)) }
; 	∎ °1◂{  }
	bt r12,3
	jc LB_3947
	mov rdi,r9
	call dlt
LB_3947:
	bt r12,4
	jc LB_3948
	mov rdi,r10
	call dlt
LB_3948:
	bt r12,2
	jc LB_3949
	mov rdi,r8
	call dlt
LB_3949:
	bt r12,1
	jc LB_3950
	mov rdi,r14
	call dlt
LB_3950:
	bt r12,0
	jc LB_3951
	mov rdi,r13
	call dlt
LB_3951:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_3944:
LB_3952:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3954
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3953
LB_3954:
	add rsp,8
	ret
NS_E_3924_MTC_0_failed:
	add rsp,16
	pop r14
LB_3953:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_3962:
NS_E_RDI_3962:
NS_E_3962_ETR_TBL:
NS_E_3962_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_3640_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_3998
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_3962_MTC_0_failed
LB_3998:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_3993
	btr r12,0
	jmp LB_3994
LB_3993:
	bts r12,0
LB_3994:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_3990
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_3964 : %_3964
 ; {>  %_3963~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_3964
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_3965 : %_3965
 ; {>  %_3963~0':_r64 %_3964~1':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_3965
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f33 { %_3963 %_3964 } ⊢ { %_3966 %_3967 %_3968 } : { %_3966 %_3967 %_3968 }
 ; {>  %_3965~2':_r64 %_3963~0':_r64 %_3964~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_3965 %_3966 } ⊢ { %_3969 %_3970 %_3971 } : { %_3969 %_3970 %_3971 }
 ; {>  %_3966~0':_r64 %_3967~1':_r64 %_3965~2':_r64 %_3968~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_3974:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_3975
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_3975
LB_3976:
	cmp r15,0
	jz LB_3977
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3976
LB_3977:
; _some %_3970 ⊢ %_3972 : %_3972
 ; {>  %_3969~2':_r64 %_3967~1':_r64 %_3970~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_3972
 ; {>  %_3969~2':_r64 %_3967~1':_r64 %_3972~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_3978
	mov rdi,r8
	call dlt
LB_3978:
	bt r12,1
	jc LB_3979
	mov rdi,r14
	call dlt
LB_3979:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_3980
	btr r12,3
	jmp LB_3981
LB_3980:
	bts r12,3
LB_3981:
	mov r8,0
	bts r12,2
	ret
MTC_LB_3975:
	mov r15,0
LB_3983:
	cmp r15,0
	jz LB_3984
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_3983
LB_3984:
; _none {  } ⊢ %_3973 : %_3973
 ; {>  %_3969~2':_r64 %_3967~1':_r64 %_3971~4':_r64 %_3970~0':_r64 %_3968~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_3973
 ; {>  %_3973~°1◂{  }:(_opn)◂(t849'(0)) %_3969~2':_r64 %_3967~1':_r64 %_3971~4':_r64 %_3970~0':_r64 %_3968~3':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_3985
	mov rdi,r8
	call dlt
LB_3985:
	bt r12,1
	jc LB_3986
	mov rdi,r14
	call dlt
LB_3986:
	bt r12,4
	jc LB_3987
	mov rdi,r10
	call dlt
LB_3987:
	bt r12,0
	jc LB_3988
	mov rdi,r13
	call dlt
LB_3988:
	bt r12,3
	jc LB_3989
	mov rdi,r9
	call dlt
LB_3989:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_3982:
LB_3990:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_3992
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_3991
LB_3992:
	add rsp,8
	ret
NS_E_3962_MTC_0_failed:
	add rsp,16
	pop r14
LB_3991:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4000:
NS_E_RDI_4000:
NS_E_4000_ETR_TBL:
NS_E_4000_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_3640_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4036
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4000_MTC_0_failed
LB_4036:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4031
	btr r12,0
	jmp LB_4032
LB_4031:
	bts r12,0
LB_4032:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4028
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_4002 : %_4002
 ; {>  %_4001~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_4002
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_4003 : %_4003
 ; {>  %_4002~1':_r64 %_4001~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_4003
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f33 { %_4001 %_4002 } ⊢ { %_4004 %_4005 %_4006 } : { %_4004 %_4005 %_4006 }
 ; {>  %_4003~2':_r64 %_4002~1':_r64 %_4001~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f33 { %_4003 %_4004 } ⊢ { %_4007 %_4008 %_4009 } : { %_4007 %_4008 %_4009 }
 ; {>  %_4004~0':_r64 %_4005~1':_r64 %_4003~2':_r64 %_4006~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_4012:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_4013
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_4013
LB_4014:
	cmp r15,0
	jz LB_4015
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4014
LB_4015:
; _some %_4008 ⊢ %_4010 : %_4010
 ; {>  %_4008~0':_r64 %_4005~1':_r64 %_4007~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4010
 ; {>  %_4005~1':_r64 %_4007~2':_r64 %_4010~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_4016
	mov rdi,r14
	call dlt
LB_4016:
	bt r12,2
	jc LB_4017
	mov rdi,r8
	call dlt
LB_4017:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4018
	btr r12,3
	jmp LB_4019
LB_4018:
	bts r12,3
LB_4019:
	mov r8,0
	bts r12,2
	ret
MTC_LB_4013:
	mov r15,0
LB_4021:
	cmp r15,0
	jz LB_4022
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4021
LB_4022:
; _none {  } ⊢ %_4011 : %_4011
 ; {>  %_4008~0':_r64 %_4005~1':_r64 %_4007~2':_r64 %_4006~3':_r64 %_4009~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_4011
 ; {>  %_4008~0':_r64 %_4005~1':_r64 %_4007~2':_r64 %_4006~3':_r64 %_4011~°1◂{  }:(_opn)◂(t876'(0)) %_4009~4':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_4023
	mov rdi,r13
	call dlt
LB_4023:
	bt r12,1
	jc LB_4024
	mov rdi,r14
	call dlt
LB_4024:
	bt r12,2
	jc LB_4025
	mov rdi,r8
	call dlt
LB_4025:
	bt r12,3
	jc LB_4026
	mov rdi,r9
	call dlt
LB_4026:
	bt r12,4
	jc LB_4027
	mov rdi,r10
	call dlt
LB_4027:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_4020:
LB_4028:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4030
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4029
LB_4030:
	add rsp,8
	ret
NS_E_4000_MTC_0_failed:
	add rsp,16
	pop r14
LB_4029:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4038:
NS_E_RDI_4038:
NS_E_4038_ETR_TBL:
NS_E_4038_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_4000_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4053
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4038_MTC_0_failed
LB_4053:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4048
	btr r12,0
	jmp LB_4049
LB_4048:
	bts r12,0
LB_4049:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4045
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_4039 ⊢ %_4040 : %_4040
 ; {>  %_4039~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4040
 ; {>  %_4040~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4043
	btr r12,3
	jmp LB_4044
LB_4043:
	bts r12,3
LB_4044:
	mov r8,0
	bts r12,2
	ret
LB_4045:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4047
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4046
LB_4047:
	add rsp,8
	ret
NS_E_4038_MTC_0_failed:
	add rsp,16
	pop r14
LB_4046:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_3962_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4065
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4038_MTC_1_failed
LB_4065:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4060
	btr r12,0
	jmp LB_4061
LB_4060:
	bts r12,0
LB_4061:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4057
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_4041 ⊢ %_4042 : %_4042
 ; {>  %_4041~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4042
 ; {>  %_4042~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4055
	btr r12,3
	jmp LB_4056
LB_4055:
	bts r12,3
LB_4056:
	mov r8,0
	bts r12,2
	ret
LB_4057:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4059
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4058
LB_4059:
	add rsp,8
	ret
NS_E_4038_MTC_1_failed:
	add rsp,16
	pop r14
LB_4058:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4067:
NS_E_RDI_4067:
NS_E_4067_ETR_TBL:
NS_E_4067_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_4038_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4111
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4067_MTC_0_failed
LB_4111:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_4068_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4116
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4117
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4117:
	jmp NS_E_4067_MTC_0_failed
LB_4116:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4106
	btr r12,1
	jmp LB_4107
LB_4106:
	bts r12,1
LB_4107:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4104
	btr r12,0
	jmp LB_4105
LB_4104:
	bts r12,0
LB_4105:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4101
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_4070 %_4071 } ⊢ %_4072 : %_4072
 ; {>  %_4070~0':_r64 %_4071~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f3703 %_4072 ⊢ %_4073 : %_4073
 ; {>  %_4072~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f3703 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_4087
	btr r12,2
	jmp LB_4088
LB_4087:
	bts r12,2
LB_4088:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_4093
	btr r12,3
	jmp LB_4094
LB_4093:
	bts r12,3
LB_4094:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_4091
	btr QWORD [rdi],0
	jmp LB_4092
LB_4091:
	bts QWORD [rdi],0
LB_4092:
	mov r9,r14
	bt r12,1
	jc LB_4097
	btr r12,3
	jmp LB_4098
LB_4097:
	bts r12,3
LB_4098:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_4095
	btr QWORD [rdi],1
	jmp LB_4096
LB_4095:
	bts QWORD [rdi],1
LB_4096:
	mov rsi,1
	bt r12,0
	jc LB_4089
	mov rsi,0
	bt r13,0
	jc LB_4089
	jmp LB_4090
LB_4089:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_4090:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_3703
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_4073 ⊢ %_4074 : %_4074
 ; {>  %_4073~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_4074
 ; {>  %_4074~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4099
	btr r12,3
	jmp LB_4100
LB_4099:
	bts r12,3
LB_4100:
	mov r8,0
	bts r12,2
	ret
LB_4101:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4103
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4102
LB_4103:
	add rsp,8
	ret
NS_E_4067_MTC_0_failed:
	add rsp,32
	pop r14
LB_4102:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4068:
NS_E_RDI_4068:
NS_E_4068_ETR_TBL:
NS_E_4068_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_4069_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4139
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4068_MTC_0_failed
LB_4139:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_4068_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4144
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4145
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4145:
	jmp NS_E_4068_MTC_0_failed
LB_4144:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4134
	btr r12,1
	jmp LB_4135
LB_4134:
	bts r12,1
LB_4135:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4132
	btr r12,0
	jmp LB_4133
LB_4132:
	bts r12,0
LB_4133:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4129
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_4075 %_4076 } ⊢ %_4077 : %_4077
 ; {>  %_4076~1':(_lst)◂(_r64) %_4075~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_4077 ⊢ %_4078 : %_4078
 ; {>  %_4077~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_4078
 ; {>  %_4078~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_4123
	btr r12,2
	jmp LB_4124
LB_4123:
	bts r12,2
LB_4124:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_4121
	btr QWORD [rdi],0
	jmp LB_4122
LB_4121:
	bts QWORD [rdi],0
LB_4122:
	mov r8,r14
	bt r12,1
	jc LB_4127
	btr r12,2
	jmp LB_4128
LB_4127:
	bts r12,2
LB_4128:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_4125
	btr QWORD [rdi],1
	jmp LB_4126
LB_4125:
	bts QWORD [rdi],1
LB_4126:
	mov rsi,1
	bt r12,3
	jc LB_4119
	mov rsi,0
	bt r9,0
	jc LB_4119
	jmp LB_4120
LB_4119:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_4120:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4129:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4131
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4130
LB_4131:
	add rsp,8
	ret
NS_E_4068_MTC_0_failed:
	add rsp,32
	pop r14
LB_4130:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4149
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_4079 : %_4079
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_4079 ⊢ %_4080 : %_4080
 ; {>  %_4079~°1◂{  }:(_lst)◂(t920'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_4080
 ; {>  %_4080~°0◂°1◂{  }:(_opn)◂((_lst)◂(t923'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_4147
	mov rsi,0
	bt r9,0
	jc LB_4147
	jmp LB_4148
LB_4147:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_4148:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_4149:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4151
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4150
LB_4151:
	add rsp,8
	ret
NS_E_4068_MTC_1_failed:
	add rsp,0
	pop r14
LB_4150:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4069:
NS_E_RDI_4069:
NS_E_4069_ETR_TBL:
NS_E_4069_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_4038_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4162
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4069_MTC_0_failed
LB_4162:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4157
	btr r12,0
	jmp LB_4158
LB_4157:
	bts r12,0
LB_4158:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4154
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_4081 ⊢ %_4082 : %_4082
 ; {>  %_4081~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4082
 ; {>  %_4082~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4152
	btr r12,3
	jmp LB_4153
LB_4152:
	bts r12,3
LB_4153:
	mov r8,0
	bts r12,2
	ret
LB_4154:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4156
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4155
LB_4156:
	add rsp,8
	ret
NS_E_4069_MTC_0_failed:
	add rsp,16
	pop r14
LB_4155:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_3924_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4174
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4069_MTC_1_failed
LB_4174:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4169
	btr r12,0
	jmp LB_4170
LB_4169:
	bts r12,0
LB_4170:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4166
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_4083 ⊢ %_4084 : %_4084
 ; {>  %_4083~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4084
 ; {>  %_4084~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4164
	btr r12,3
	jmp LB_4165
LB_4164:
	bts r12,3
LB_4165:
	mov r8,0
	bts r12,2
	ret
LB_4166:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4168
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4167
LB_4168:
	add rsp,8
	ret
NS_E_4069_MTC_1_failed:
	add rsp,16
	pop r14
LB_4167:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_4188
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_4188
	jmp LB_4189
LB_4188:
	jmp NS_E_4069_MTC_2_failed
LB_4189:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4181
	btr r12,0
	jmp LB_4182
LB_4181:
	bts r12,0
LB_4182:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4178
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_4085 : %_4085
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_4085
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_4085 ⊢ %_4086 : %_4086
 ; {>  %_4085~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4086
 ; {>  %_4086~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4176
	btr r12,3
	jmp LB_4177
LB_4176:
	bts r12,3
LB_4177:
	mov r8,0
	bts r12,2
	ret
LB_4178:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4180
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4179
LB_4180:
	add rsp,8
	ret
NS_E_4069_MTC_2_failed:
	add rsp,16
	pop r14
LB_4179:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4190:
NS_E_RDI_4190:
NS_E_4190_ETR_TBL:
NS_E_4190_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_4210
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_4210
	jmp LB_4211
LB_4210:
	jmp NS_E_4190_MTC_0_failed
LB_4211:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_4068_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4215
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4216
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4216:
	jmp NS_E_4190_MTC_0_failed
LB_4215:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4203
	btr r12,1
	jmp LB_4204
LB_4203:
	bts r12,1
LB_4204:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4201
	btr r12,0
	jmp LB_4202
LB_4201:
	bts r12,0
LB_4202:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4198
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_4218
	btr r12,2
	jmp LB_4219
LB_4218:
	bts r12,2
LB_4219:
	mov r13,r14
	bt r12,1
	jc LB_4220
	btr r12,0
	jmp LB_4221
LB_4220:
	bts r12,0
LB_4221:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f3703 %_4191 ⊢ %_4192 : %_4192
 ; {>  %_4191~0':(_lst)◂(_r64) }
; _f3703 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_3703
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_4192 ⊢ %_4193 : %_4193
 ; {>  %_4192~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_4193
 ; {>  %_4193~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4196
	btr r12,3
	jmp LB_4197
LB_4196:
	bts r12,3
LB_4197:
	mov r8,0
	bts r12,2
	ret
LB_4198:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4200
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4199
LB_4200:
	add rsp,8
	ret
NS_E_4190_MTC_0_failed:
	add rsp,32
	pop r14
LB_4199:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4232
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4190_MTC_1_failed
LB_4232:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4227
	btr r12,0
	jmp LB_4228
LB_4227:
	bts r12,0
LB_4228:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4224
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_4194 ⊢ %_4195 : %_4195
 ; {>  %_4194~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_4195
 ; {>  %_4195~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4222
	btr r12,3
	jmp LB_4223
LB_4222:
	bts r12,3
LB_4223:
	mov r8,0
	bts r12,2
	ret
LB_4224:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4226
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4225
LB_4226:
	add rsp,8
	ret
NS_E_4190_MTC_1_failed:
	add rsp,16
	pop r14
LB_4225:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4235:
NS_E_RDI_4235:
NS_E_4235_ETR_TBL:
NS_E_4235_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ word ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_4243:
	jmp LB_4240
LB_4239:
	add r14,1
LB_4240:
	cmp r14,r10
	jge LB_4241
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4239
	cmp al,10
	jz LB_4239
	cmp al,32
	jz LB_4239
LB_4241:
	push r10
	push rsi
	call NS_E_4067_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_4242
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_4244
	bts QWORD [rax],0
LB_4244:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_4243
LB_4242:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4237
	btr QWORD [rdi],0
LB_4237:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4235_MTC_0_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4254:
NS_E_RDI_4254:
NS_E_4254_ETR_TBL:
NS_E_4254_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_4358
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_4358
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_4358
	jmp LB_4359
LB_4358:
	jmp NS_E_4254_MTC_0_failed
LB_4359:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_4255_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4363
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4364
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4364:
	jmp NS_E_4254_MTC_0_failed
LB_4363:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_4254_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4369
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4370
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4370:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4371
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4371:
	jmp NS_E_4254_MTC_0_failed
LB_4369:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4351
	btr r12,2
	jmp LB_4352
LB_4351:
	bts r12,2
LB_4352:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4349
	btr r12,1
	jmp LB_4350
LB_4349:
	bts r12,1
LB_4350:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4347
	btr r12,0
	jmp LB_4348
LB_4347:
	bts r12,0
LB_4348:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4344
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_4373
	btr r12,3
	jmp LB_4374
LB_4373:
	bts r12,3
LB_4374:
	mov r13,r14
	bt r12,1
	jc LB_4375
	btr r12,0
	jmp LB_4376
LB_4375:
	bts r12,0
LB_4376:
	mov r10,r8
	bt r12,2
	jc LB_4377
	btr r12,4
	jmp LB_4378
LB_4377:
	bts r12,4
LB_4378:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4381
	btr r12,5
	jmp LB_4382
LB_4381:
	bts r12,5
LB_4382:
	mov r14,r11
	bt r12,5
	jc LB_4379
	btr r12,1
	jmp LB_4380
LB_4379:
	bts r12,1
LB_4380:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4385
	btr r12,5
	jmp LB_4386
LB_4385:
	bts r12,5
LB_4386:
	mov r8,r11
	bt r12,5
	jc LB_4383
	btr r12,2
	jmp LB_4384
LB_4383:
	bts r12,2
LB_4384:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_4260 : %_4260
 ; {>  %_4257~0':_r64 %_4258~1':_r64 %_4259~2':(_lst)◂(_p4251) }
; 	» 0xr2 _ ⊢ 3' : %_4260
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_4260 %_4257 } ⊢ { %_4261 %_4262 } : { %_4261 %_4262 }
 ; {>  %_4260~3':_r64 %_4257~0':_r64 %_4258~1':_r64 %_4259~2':(_lst)◂(_p4251) }
	add r9,r13
; _f4252 %_4261 ⊢ %_4263 : %_4263
 ; {>  %_4262~0':_r64 %_4261~3':_r64 %_4258~1':_r64 %_4259~2':(_lst)◂(_p4251) }
; _f4252 3' ⊢ °0◂3'
; _cns { %_4263 %_4259 } ⊢ %_4264 : %_4264
 ; {>  %_4262~0':_r64 %_4263~°0◂3':_p4251 %_4258~1':_r64 %_4259~2':(_lst)◂(_p4251) }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_4258 %_4264 } ⊢ %_4265 : %_4265
 ; {>  %_4262~0':_r64 %_4264~°0◂{ °0◂3' 2' }:(_lst)◂(_p4251) %_4258~1':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_4265
 ; {>  %_4262~0':_r64 %_4265~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p4251) }) }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_4323
	mov rdi,r13
	call dlt
LB_4323:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_4324
	btr r12,0
	jmp LB_4325
LB_4324:
	bts r12,0
LB_4325:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_4328
	btr r12,4
	jmp LB_4329
LB_4328:
	bts r12,4
LB_4329:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_4326
	btr QWORD [rdi],0
	jmp LB_4327
LB_4326:
	bts QWORD [rdi],0
LB_4327:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_4338
	btr r12,1
	jmp LB_4339
LB_4338:
	bts r12,1
LB_4339:
	mov rsi,1
	bt r12,1
	jc LB_4336
	mov rsi,0
	bt r14,0
	jc LB_4336
	jmp LB_4337
LB_4336:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_4337:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_4334
	btr QWORD [rdi],0
	jmp LB_4335
LB_4334:
	bts QWORD [rdi],0
LB_4335:
	mov r14,r8
	bt r12,2
	jc LB_4342
	btr r12,1
	jmp LB_4343
LB_4342:
	bts r12,1
LB_4343:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_4340
	btr QWORD [rdi],1
	jmp LB_4341
LB_4340:
	bts QWORD [rdi],1
LB_4341:
	mov rsi,1
	bt r12,4
	jc LB_4332
	mov rsi,0
	bt r10,0
	jc LB_4332
	jmp LB_4333
LB_4332:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_4333:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_4330
	btr QWORD [rdi],1
	jmp LB_4331
LB_4330:
	bts QWORD [rdi],1
LB_4331:
	mov r8,0
	bts r12,2
	ret
LB_4344:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4346
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4345
LB_4346:
	add rsp,8
	ret
NS_E_4254_MTC_0_failed:
	add rsp,48
	pop r14
LB_4345:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "##"
	add r14,2
	cmp r14,r10
	jg LB_4422
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_4422
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_4422
	jmp LB_4423
LB_4422:
	jmp NS_E_4254_MTC_1_failed
LB_4423:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_cmt
	push r10
	call NS_E_4256_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4427
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4428
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4428:
	jmp NS_E_4254_MTC_1_failed
LB_4427:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_4254_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4433
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4434
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4434:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4435
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4435:
	jmp NS_E_4254_MTC_1_failed
LB_4433:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4415
	btr r12,2
	jmp LB_4416
LB_4415:
	bts r12,2
LB_4416:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4413
	btr r12,1
	jmp LB_4414
LB_4413:
	bts r12,1
LB_4414:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4411
	btr r12,0
	jmp LB_4412
LB_4411:
	bts r12,0
LB_4412:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4408
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_4437
	btr r12,3
	jmp LB_4438
LB_4437:
	bts r12,3
LB_4438:
	mov r13,r14
	bt r12,1
	jc LB_4439
	btr r12,0
	jmp LB_4440
LB_4439:
	bts r12,0
LB_4440:
	mov r10,r8
	bt r12,2
	jc LB_4441
	btr r12,4
	jmp LB_4442
LB_4441:
	bts r12,4
LB_4442:
; 4' ⊢ { 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_4445
	btr r12,5
	jmp LB_4446
LB_4445:
	bts r12,5
LB_4446:
	mov r14,r11
	bt r12,5
	jc LB_4443
	btr r12,1
	jmp LB_4444
LB_4443:
	bts r12,1
LB_4444:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_4449
	btr r12,5
	jmp LB_4450
LB_4449:
	bts r12,5
LB_4450:
	mov r8,r11
	bt r12,5
	jc LB_4447
	btr r12,2
	jmp LB_4448
LB_4447:
	bts r12,2
LB_4448:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_4269 : %_4269
 ; {>  %_4267~1':_r64 %_4266~0':_r64 %_4268~2':(_lst)◂(_p4251) }
; 	» 0xr2 _ ⊢ 3' : %_4269
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f34 { %_4269 %_4266 } ⊢ { %_4270 %_4271 } : { %_4270 %_4271 }
 ; {>  %_4269~3':_r64 %_4267~1':_r64 %_4266~0':_r64 %_4268~2':(_lst)◂(_p4251) }
	add r9,r13
; _f4252 %_4270 ⊢ %_4272 : %_4272
 ; {>  %_4267~1':_r64 %_4268~2':(_lst)◂(_p4251) %_4271~0':_r64 %_4270~3':_r64 }
; _f4252 3' ⊢ °0◂3'
; _cns { %_4272 %_4268 } ⊢ %_4273 : %_4273
 ; {>  %_4272~°0◂3':_p4251 %_4267~1':_r64 %_4268~2':(_lst)◂(_p4251) %_4271~0':_r64 }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_4267 %_4273 } ⊢ %_4274 : %_4274
 ; {>  %_4267~1':_r64 %_4271~0':_r64 %_4273~°0◂{ °0◂3' 2' }:(_lst)◂(_p4251) }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_4274
 ; {>  %_4271~0':_r64 %_4274~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p4251) }) }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_4387
	mov rdi,r13
	call dlt
LB_4387:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_4388
	btr r12,0
	jmp LB_4389
LB_4388:
	bts r12,0
LB_4389:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_4392
	btr r12,4
	jmp LB_4393
LB_4392:
	bts r12,4
LB_4393:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_4390
	btr QWORD [rdi],0
	jmp LB_4391
LB_4390:
	bts QWORD [rdi],0
LB_4391:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_4402
	btr r12,1
	jmp LB_4403
LB_4402:
	bts r12,1
LB_4403:
	mov rsi,1
	bt r12,1
	jc LB_4400
	mov rsi,0
	bt r14,0
	jc LB_4400
	jmp LB_4401
LB_4400:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_4401:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_4398
	btr QWORD [rdi],0
	jmp LB_4399
LB_4398:
	bts QWORD [rdi],0
LB_4399:
	mov r14,r8
	bt r12,2
	jc LB_4406
	btr r12,1
	jmp LB_4407
LB_4406:
	bts r12,1
LB_4407:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_4404
	btr QWORD [rdi],1
	jmp LB_4405
LB_4404:
	bts QWORD [rdi],1
LB_4405:
	mov rsi,1
	bt r12,4
	jc LB_4396
	mov rsi,0
	bt r10,0
	jc LB_4396
	jmp LB_4397
LB_4396:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_4397:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_4394
	btr QWORD [rdi],1
	jmp LB_4395
LB_4394:
	bts QWORD [rdi],1
LB_4395:
	mov r8,0
	bts r12,2
	ret
LB_4408:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4410
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4409
LB_4410:
	add rsp,8
	ret
NS_E_4254_MTC_1_failed:
	add rsp,48
	pop r14
LB_4409:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_3640_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4525
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4254_MTC_2_failed
LB_4525:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt
	push r10
	call NS_E_4254_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4530
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4531
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4531:
	jmp NS_E_4254_MTC_2_failed
LB_4530:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4520
	btr r12,1
	jmp LB_4521
LB_4520:
	bts r12,1
LB_4521:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4518
	btr r12,0
	jmp LB_4519
LB_4518:
	bts r12,0
LB_4519:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4515
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_4533
	btr r12,3
	jmp LB_4534
LB_4533:
	bts r12,3
LB_4534:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_4537
	btr r12,4
	jmp LB_4538
LB_4537:
	bts r12,4
LB_4538:
	mov r14,r10
	bt r12,4
	jc LB_4535
	btr r12,1
	jmp LB_4536
LB_4535:
	bts r12,1
LB_4536:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_4541
	btr r12,4
	jmp LB_4542
LB_4541:
	bts r12,4
LB_4542:
	mov r8,r10
	bt r12,4
	jc LB_4539
	btr r12,2
	jmp LB_4540
LB_4539:
	bts r12,2
LB_4540:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
MTC_LB_4451:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4452
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_4453
	bt QWORD [rax],0
	jc LB_4454
	btr r12,5
	jmp LB_4455
LB_4454:
	bts r12,5
LB_4455:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_4453:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_4458
	btr r12,6
	jmp LB_4459
LB_4458:
	bts r12,6
LB_4459:
	mov r9,rcx
	bt r12,6
	jc LB_4456
	btr r12,3
	jmp LB_4457
LB_4456:
	bts r12,3
LB_4457:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_4462
	btr r12,6
	jmp LB_4463
LB_4462:
	bts r12,6
LB_4463:
	mov r10,rcx
	bt r12,6
	jc LB_4460
	btr r12,4
	jmp LB_4461
LB_4460:
	bts r12,4
LB_4461:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4452
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
; 3' ⊢ °1◂5'
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r9
	bt QWORD [rax],17
	jnc LB_4464
	bt QWORD [rax],0
	jc LB_4465
	btr r12,6
	jmp LB_4466
LB_4465:
	bts r12,6
LB_4466:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_4464:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_4467
	btr r12,5
	jmp LB_4468
LB_4467:
	bts r12,5
LB_4468:
LB_4469:
	cmp r15,0
	jz LB_4470
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4469
LB_4470:
; » 0xr1 |~ {  } ⊢ %_4281 : %_4281
 ; {>  %_4279~4':(_lst)◂(_p4251) %_4275~0':_r64 %_4280~5':_r64 %_4276~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_4281
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_4280 %_4281 } ⊢ { %_4282 %_4283 } : { %_4282 %_4283 }
 ; {>  %_4279~4':(_lst)◂(_p4251) %_4275~0':_r64 %_4280~5':_r64 %_4276~1':_r64 %_4281~2':_r64 }
	add r11,r8
; _f34 { %_4276 %_4283 } ⊢ { %_4284 %_4285 } : { %_4284 %_4285 }
 ; {>  %_4279~4':(_lst)◂(_p4251) %_4282~5':_r64 %_4275~0':_r64 %_4276~1':_r64 %_4283~2':_r64 }
	add r14,r8
; _f4253 %_4282 ⊢ %_4286 : %_4286
 ; {>  %_4279~4':(_lst)◂(_p4251) %_4285~2':_r64 %_4282~5':_r64 %_4275~0':_r64 %_4284~1':_r64 }
; _f4253 5' ⊢ °1◂5'
; _cns { %_4286 %_4279 } ⊢ %_4287 : %_4287
 ; {>  %_4279~4':(_lst)◂(_p4251) %_4285~2':_r64 %_4275~0':_r64 %_4284~1':_r64 %_4286~°1◂5':_p4251 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_4284 %_4287 } ⊢ %_4288 : %_4288
 ; {>  %_4285~2':_r64 %_4275~0':_r64 %_4284~1':_r64 %_4287~°0◂{ °1◂5' 4' }:(_lst)◂(_p4251) }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_4288
 ; {>  %_4288~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p4251) }) %_4285~2':_r64 %_4275~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,2
	jc LB_4471
	mov rdi,r8
	call dlt
LB_4471:
	bt r12,0
	jc LB_4472
	mov rdi,r13
	call dlt
LB_4472:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_4475
	btr r12,0
	jmp LB_4476
LB_4475:
	bts r12,0
LB_4476:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_4473
	btr QWORD [rdi],0
	jmp LB_4474
LB_4473:
	bts QWORD [rdi],0
LB_4474:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_4485
	btr r12,1
	jmp LB_4486
LB_4485:
	bts r12,1
LB_4486:
	mov rsi,1
	bt r12,1
	jc LB_4483
	mov rsi,0
	bt r14,0
	jc LB_4483
	jmp LB_4484
LB_4483:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_4484:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_4481
	btr QWORD [rdi],0
	jmp LB_4482
LB_4481:
	bts QWORD [rdi],0
LB_4482:
	mov r14,r10
	bt r12,4
	jc LB_4489
	btr r12,1
	jmp LB_4490
LB_4489:
	bts r12,1
LB_4490:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_4487
	btr QWORD [rdi],1
	jmp LB_4488
LB_4487:
	bts QWORD [rdi],1
LB_4488:
	mov rsi,1
	bt r12,0
	jc LB_4479
	mov rsi,0
	bt r13,0
	jc LB_4479
	jmp LB_4480
LB_4479:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_4480:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_4477
	btr QWORD [rdi],1
	jmp LB_4478
LB_4477:
	bts QWORD [rdi],1
LB_4478:
	mov r8,0
	bts r12,2
	ret
MTC_LB_4452:
	mov r15,0
LB_4492:
	cmp r15,0
	jz LB_4493
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4492
LB_4493:
; » 0xr1 |~ {  } ⊢ %_4289 : %_4289
 ; {>  %_4275~0':_r64 %_4276~1':_r64 %_4277~2':(_lst)◂(_p4251) }
; 	» 0xr1 _ ⊢ 3' : %_4289
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f34 { %_4276 %_4289 } ⊢ { %_4290 %_4291 } : { %_4290 %_4291 }
 ; {>  %_4289~3':_r64 %_4275~0':_r64 %_4276~1':_r64 %_4277~2':(_lst)◂(_p4251) }
	add r14,r9
; _f4253 %_4291 ⊢ %_4292 : %_4292
 ; {>  %_4291~3':_r64 %_4275~0':_r64 %_4290~1':_r64 %_4277~2':(_lst)◂(_p4251) }
; _f4253 3' ⊢ °1◂3'
; _cns { %_4292 %_4277 } ⊢ %_4293 : %_4293
 ; {>  %_4275~0':_r64 %_4290~1':_r64 %_4277~2':(_lst)◂(_p4251) %_4292~°1◂3':_p4251 }
; _cns { °1◂3' 2' } ⊢ °0◂{ °1◂3' 2' }
; _some { %_4290 %_4293 } ⊢ %_4294 : %_4294
 ; {>  %_4275~0':_r64 %_4293~°0◂{ °1◂3' 2' }:(_lst)◂(_p4251) %_4290~1':_r64 }
; _some { 1' °0◂{ °1◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂3' 2' } }
; ∎ %_4294
 ; {>  %_4275~0':_r64 %_4294~°0◂{ 1' °0◂{ °1◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p4251) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂3' 2' } }
	bt r12,0
	jc LB_4494
	mov rdi,r13
	call dlt
LB_4494:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °1◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_4495
	btr r12,0
	jmp LB_4496
LB_4495:
	bts r12,0
LB_4496:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_4499
	btr r12,4
	jmp LB_4500
LB_4499:
	bts r12,4
LB_4500:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_4497
	btr QWORD [rdi],0
	jmp LB_4498
LB_4497:
	bts QWORD [rdi],0
LB_4498:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_4509
	btr r12,1
	jmp LB_4510
LB_4509:
	bts r12,1
LB_4510:
	mov rsi,1
	bt r12,1
	jc LB_4507
	mov rsi,0
	bt r14,0
	jc LB_4507
	jmp LB_4508
LB_4507:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_4508:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_4505
	btr QWORD [rdi],0
	jmp LB_4506
LB_4505:
	bts QWORD [rdi],0
LB_4506:
	mov r14,r8
	bt r12,2
	jc LB_4513
	btr r12,1
	jmp LB_4514
LB_4513:
	bts r12,1
LB_4514:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_4511
	btr QWORD [rdi],1
	jmp LB_4512
LB_4511:
	bts QWORD [rdi],1
LB_4512:
	mov rsi,1
	bt r12,4
	jc LB_4503
	mov rsi,0
	bt r10,0
	jc LB_4503
	jmp LB_4504
LB_4503:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_4504:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_4501
	btr QWORD [rdi],1
	jmp LB_4502
LB_4501:
	bts QWORD [rdi],1
LB_4502:
	mov r8,0
	bts r12,2
	ret
MTC_LB_4491:
LB_4515:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4517
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4516
LB_4517:
	add rsp,8
	ret
NS_E_4254_MTC_2_failed:
	add rsp,32
	pop r14
LB_4516:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_4552
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "cmt {}" _ ⊢ 0' : %_4295
	mov rdi,6
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_7d_7b_20_74_6d_63
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _nil {  } ⊢ %_4296 : %_4296
 ; {>  %_4295~0':_stg }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_4297 : %_4297
 ; {>  %_4295~0':_stg %_4296~°1◂{  }:(_lst)◂(t1039'(0)) }
; 	» 0xr0 _ ⊢ 1' : %_4297
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _some { %_4297 %_4296 } ⊢ %_4298 : %_4298
 ; {>  %_4295~0':_stg %_4297~1':_r64 %_4296~°1◂{  }:(_lst)◂(t1039'(0)) }
; _some { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; ∎ %_4298
 ; {>  %_4295~0':_stg %_4298~°0◂{ 1' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t1043'(0)) }) }
; 	∎ °0◂{ 1' °1◂{  } }
	bt r12,0
	jc LB_4543
	mov rdi,r13
	call dlt
LB_4543:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂{ 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_4546
	btr r12,0
	jmp LB_4547
LB_4546:
	bts r12,0
LB_4547:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_4544
	btr QWORD [rdi],0
	jmp LB_4545
LB_4544:
	bts QWORD [rdi],0
LB_4545:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_4550
	mov rsi,0
	bt r13,0
	jc LB_4550
	jmp LB_4551
LB_4550:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_4551:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_4548
	btr QWORD [rdi],1
	jmp LB_4549
LB_4548:
	bts QWORD [rdi],1
LB_4549:
	mov r8,0
	bts r12,2
	ret
LB_4552:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4554
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4553
LB_4554:
	add rsp,8
	ret
NS_E_4254_MTC_3_failed:
	add rsp,0
	pop r14
LB_4553:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4255:
NS_E_RDI_4255:
NS_E_4255_ETR_TBL:
NS_E_4255_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "#]"
	add r14,2
	cmp r14,r10
	jg LB_4567
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_4567
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_4567
	jmp LB_4568
LB_4567:
	jmp NS_E_4255_MTC_0_failed
LB_4568:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4560
	btr r12,0
	jmp LB_4561
LB_4560:
	bts r12,0
LB_4561:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4557
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_4299 : %_4299
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_4299
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _some %_4299 ⊢ %_4300 : %_4300
 ; {>  %_4299~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4300
 ; {>  %_4300~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4555
	btr r12,3
	jmp LB_4556
LB_4555:
	bts r12,3
LB_4556:
	mov r8,0
	bts r12,2
	ret
LB_4557:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4559
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4558
LB_4559:
	add rsp,8
	ret
NS_E_4255_MTC_0_failed:
	add rsp,16
	pop r14
LB_4558:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_4587
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_4587
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_4587
	jmp LB_4588
LB_4587:
	jmp NS_E_4255_MTC_1_failed
LB_4588:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_4255_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4592
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4593
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4593:
	jmp NS_E_4255_MTC_1_failed
LB_4592:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; blk_cmt
	push r10
	call NS_E_4255_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4598
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4599
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4599:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4600
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4600:
	jmp NS_E_4255_MTC_1_failed
LB_4598:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4580
	btr r12,2
	jmp LB_4581
LB_4580:
	bts r12,2
LB_4581:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4578
	btr r12,1
	jmp LB_4579
LB_4578:
	bts r12,1
LB_4579:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4576
	btr r12,0
	jmp LB_4577
LB_4576:
	bts r12,0
LB_4577:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_4573
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_4602
	btr r12,3
	jmp LB_4603
LB_4602:
	bts r12,3
LB_4603:
	mov r14,r8
	bt r12,2
	jc LB_4604
	btr r12,1
	jmp LB_4605
LB_4604:
	bts r12,1
LB_4605:
	mov r8,r13
	bt r12,0
	jc LB_4606
	btr r12,2
	jmp LB_4607
LB_4606:
	bts r12,2
LB_4607:
	mov r13,r9
	bt r12,3
	jc LB_4608
	btr r12,0
	jmp LB_4609
LB_4608:
	bts r12,0
LB_4609:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_4303 : %_4303
 ; {>  %_4302~1':_r64 %_4301~0':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_4303
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f34 { %_4303 %_4301 } ⊢ { %_4304 %_4305 } : { %_4304 %_4305 }
 ; {>  %_4303~2':_r64 %_4302~1':_r64 %_4301~0':_r64 }
	add r8,r13
; _f34 { %_4304 %_4302 } ⊢ { %_4306 %_4307 } : { %_4306 %_4307 }
 ; {>  %_4302~1':_r64 %_4304~2':_r64 %_4305~0':_r64 }
	add r8,r14
; _some %_4306 ⊢ %_4308 : %_4308
 ; {>  %_4306~2':_r64 %_4307~1':_r64 %_4305~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_4308
 ; {>  %_4307~1':_r64 %_4308~°0◂2':(_opn)◂(_r64) %_4305~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_4569
	mov rdi,r14
	call dlt
LB_4569:
	bt r12,0
	jc LB_4570
	mov rdi,r13
	call dlt
LB_4570:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_4571
	btr r12,3
	jmp LB_4572
LB_4571:
	bts r12,3
LB_4572:
	mov r8,0
	bts r12,2
	ret
LB_4573:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4575
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4574
LB_4575:
	add rsp,8
	ret
NS_E_4255_MTC_1_failed:
	add rsp,48
	pop r14
LB_4574:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_3640_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4624
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4255_MTC_2_failed
LB_4624:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; blk_cmt
	push r10
	call NS_E_4255_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4629
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4630
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4630:
	jmp NS_E_4255_MTC_2_failed
LB_4629:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4619
	btr r12,1
	jmp LB_4620
LB_4619:
	bts r12,1
LB_4620:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4617
	btr r12,0
	jmp LB_4618
LB_4617:
	bts r12,0
LB_4618:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4614
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_4311 : %_4311
 ; {>  %_4310~1':_r64 %_4309~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_4311
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_4311 %_4310 } ⊢ { %_4312 %_4313 } : { %_4312 %_4313 }
 ; {>  %_4310~1':_r64 %_4311~2':_r64 %_4309~0':_r64 }
	add r8,r14
; _some %_4312 ⊢ %_4314 : %_4314
 ; {>  %_4313~1':_r64 %_4312~2':_r64 %_4309~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_4314
 ; {>  %_4313~1':_r64 %_4309~0':_r64 %_4314~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_4610
	mov rdi,r14
	call dlt
LB_4610:
	bt r12,0
	jc LB_4611
	mov rdi,r13
	call dlt
LB_4611:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_4612
	btr r12,3
	jmp LB_4613
LB_4612:
	bts r12,3
LB_4613:
	mov r8,0
	bts r12,2
	ret
LB_4614:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4616
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4615
LB_4616:
	add rsp,8
	ret
NS_E_4255_MTC_2_failed:
	add rsp,32
	pop r14
LB_4615:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4256:
NS_E_RDI_4256:
NS_E_4256_ETR_TBL:
NS_E_4256_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_4644
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4644
	jmp LB_4645
LB_4644:
	jmp NS_E_4256_MTC_0_failed
LB_4645:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4637
	btr r12,0
	jmp LB_4638
LB_4637:
	bts r12,0
LB_4638:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_4634
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_4315 : %_4315
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_4315
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_4315 ⊢ %_4316 : %_4316
 ; {>  %_4315~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_4316
 ; {>  %_4316~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_4632
	btr r12,3
	jmp LB_4633
LB_4632:
	bts r12,3
LB_4633:
	mov r8,0
	bts r12,2
	ret
LB_4634:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4636
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4635
LB_4636:
	add rsp,8
	ret
NS_E_4256_MTC_0_failed:
	add rsp,16
	pop r14
LB_4635:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_3640_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4660
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4256_MTC_1_failed
LB_4660:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_cmt
	push r10
	call NS_E_4256_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4665
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4666
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4666:
	jmp NS_E_4256_MTC_1_failed
LB_4665:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4655
	btr r12,1
	jmp LB_4656
LB_4655:
	bts r12,1
LB_4656:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4653
	btr r12,0
	jmp LB_4654
LB_4653:
	bts r12,0
LB_4654:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_4650
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_4319 : %_4319
 ; {>  %_4317~0':_r64 %_4318~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_4319
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f34 { %_4319 %_4318 } ⊢ { %_4320 %_4321 } : { %_4320 %_4321 }
 ; {>  %_4317~0':_r64 %_4319~2':_r64 %_4318~1':_r64 }
	add r8,r14
; _some %_4320 ⊢ %_4322 : %_4322
 ; {>  %_4321~1':_r64 %_4317~0':_r64 %_4320~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_4322
 ; {>  %_4321~1':_r64 %_4317~0':_r64 %_4322~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_4646
	mov rdi,r14
	call dlt
LB_4646:
	bt r12,0
	jc LB_4647
	mov rdi,r13
	call dlt
LB_4647:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_4648
	btr r12,3
	jmp LB_4649
LB_4648:
	bts r12,3
LB_4649:
	mov r8,0
	bts r12,2
	ret
LB_4650:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_4652
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_4651
LB_4652:
	add rsp,8
	ret
NS_E_4256_MTC_1_failed:
	add rsp,32
	pop r14
LB_4651:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4690:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_4690:
MTC_LB_4691:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4692
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r10
	bt QWORD [rax],17
	jnc LB_4693
	bt QWORD [rax],0
	jc LB_4694
	btr r12,7
	jmp LB_4695
LB_4694:
	bts r12,7
LB_4695:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_4693:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_4698
	btr r12,8
	jmp LB_4699
LB_4698:
	bts r12,8
LB_4699:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4696
	btr r12,5
	jmp LB_4697
LB_4696:
	bts r12,5
LB_4697:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_4702
	btr r12,8
	jmp LB_4703
LB_4702:
	bts r12,8
LB_4703:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_4700
	btr r12,6
	jmp LB_4701
LB_4700:
	bts r12,6
LB_4701:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4704:
	cmp r15,0
	jz LB_4705
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4704
LB_4705:
MTC_LB_4706:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_4707
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °1◂4'
; 5' ⊢ °1◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_4708
	bt QWORD [rax],0
	jc LB_4709
	btr r12,7
	jmp LB_4710
LB_4709:
	bts r12,7
LB_4710:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_4708:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_4711
	btr r12,4
	jmp LB_4712
LB_4711:
	bts r12,4
LB_4712:
LB_4713:
	cmp r15,0
	jz LB_4714
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4713
LB_4714:
; _f36 %_4675 ⊢ { %_4676 %_4677 } : { %_4676 %_4677 }
 ; {>  %_4674~6':(_lst)◂(_p4251) %_4669~1':_r64 %_4668~0':_stg %_4671~3':_r64 %_4675~4':_r64 %_4670~2':_stg }
	mov r11,r10
	bts r12,5
; _f18 { %_4677 %_4668 %_4669 %_4670 %_4671 } ⊢ { %_4678 %_4679 %_4680 %_4681 %_4682 } : { %_4678 %_4679 %_4680 %_4681 %_4682 }
 ; {>  %_4674~6':(_lst)◂(_p4251) %_4669~1':_r64 %_4668~0':_stg %_4677~5':_r64 %_4676~4':_r64 %_4671~3':_r64 %_4670~2':_stg }
; _f18 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_4719
	btr r12,4
	jmp LB_4720
LB_4719:
	bts r12,4
LB_4720:
	mov r9,r8
	bt r12,2
	jc LB_4721
	btr r12,3
	jmp LB_4722
LB_4721:
	bts r12,3
LB_4722:
	mov r8,r14
	bt r12,1
	jc LB_4723
	btr r12,2
	jmp LB_4724
LB_4723:
	bts r12,2
LB_4724:
	mov r14,r13
	bt r12,0
	jc LB_4725
	btr r12,1
	jmp LB_4726
LB_4725:
	bts r12,1
LB_4726:
	mov r13,r11
	bt r12,5
	jc LB_4727
	btr r12,0
	jmp LB_4728
LB_4727:
	bts r12,0
LB_4728:
	call NS_E_18
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_4729
	btr r12,5
	jmp LB_4730
LB_4729:
	bts r12,5
LB_4730:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_4717
	btr r12,6
	jmp LB_4718
LB_4717:
	bts r12,6
LB_4718:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_4715
	btr r12,4
	jmp LB_4716
LB_4715:
	bts r12,4
LB_4716:
	add rsp,24
; _f4690 { %_4679 %_4680 %_4681 %_4682 %_4674 } ⊢ { %_4683 %_4684 } : { %_4683 %_4684 }
 ; {>  %_4674~6':(_lst)◂(_p4251) %_4680~2':_r64 %_4678~0':_r64 %_4682~5':_r64 %_4676~4':_r64 %_4679~1':_stg %_4681~3':_stg }
; _f4690 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_4735
	btr r12,0
	jmp LB_4736
LB_4735:
	bts r12,0
LB_4736:
	mov r14,r8
	bt r12,2
	jc LB_4737
	btr r12,1
	jmp LB_4738
LB_4737:
	bts r12,1
LB_4738:
	mov r8,r9
	bt r12,3
	jc LB_4739
	btr r12,2
	jmp LB_4740
LB_4739:
	bts r12,2
LB_4740:
	mov r9,r11
	bt r12,5
	jc LB_4741
	btr r12,3
	jmp LB_4742
LB_4741:
	bts r12,3
LB_4742:
	mov r10,rcx
	bt r12,6
	jc LB_4743
	btr r12,4
	jmp LB_4744
LB_4743:
	bts r12,4
LB_4744:
	call NS_E_4690
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_4745
	btr r12,2
	jmp LB_4746
LB_4745:
	bts r12,2
LB_4746:
	mov r14,r13
	bt r12,0
	jc LB_4747
	btr r12,1
	jmp LB_4748
LB_4747:
	bts r12,1
LB_4748:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_4733
	btr r12,4
	jmp LB_4734
LB_4733:
	bts r12,4
LB_4734:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4731
	btr r12,0
	jmp LB_4732
LB_4731:
	bts r12,0
LB_4732:
	add rsp,24
; ∎ { %_4683 %_4684 }
 ; {>  %_4678~0':_r64 %_4676~4':_r64 %_4684~2':_stg %_4683~1':_stg }
; 	∎ { 1' 2' }
	bt r12,0
	jc LB_4749
	mov rdi,r13
	call dlt
LB_4749:
	bt r12,4
	jc LB_4750
	mov rdi,r10
	call dlt
LB_4750:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_4751
	btr r12,0
	jmp LB_4752
LB_4751:
	bts r12,0
LB_4752:
	mov r14,r8
	bt r12,2
	jc LB_4753
	btr r12,1
	jmp LB_4754
LB_4753:
	bts r12,1
LB_4754:
	ret
MTC_LB_4707:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4755
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °0◂4'
; 5' ⊢ °0◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_4756
	bt QWORD [rax],0
	jc LB_4757
	btr r12,7
	jmp LB_4758
LB_4757:
	bts r12,7
LB_4758:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_4756:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_4759
	btr r12,4
	jmp LB_4760
LB_4759:
	bts r12,4
LB_4760:
LB_4761:
	cmp r15,0
	jz LB_4762
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4761
LB_4762:
; _f34 { %_4669 %_4685 } ⊢ { %_4686 %_4687 } : { %_4686 %_4687 }
 ; {>  %_4674~6':(_lst)◂(_p4251) %_4685~4':_r64 %_4669~1':_r64 %_4668~0':_stg %_4671~3':_r64 %_4670~2':_stg }
	add r14,r10
; _f4690 { %_4668 %_4686 %_4670 %_4671 %_4674 } ⊢ { %_4688 %_4689 } : { %_4688 %_4689 }
 ; {>  %_4674~6':(_lst)◂(_p4251) %_4687~4':_r64 %_4668~0':_stg %_4671~3':_r64 %_4686~1':_r64 %_4670~2':_stg }
; _f4690 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_4765
	btr r12,4
	jmp LB_4766
LB_4765:
	bts r12,4
LB_4766:
	call NS_E_4690
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_4763
	btr r12,4
	jmp LB_4764
LB_4763:
	bts r12,4
LB_4764:
	add rsp,16
; ∎ { %_4688 %_4689 }
 ; {>  %_4687~4':_r64 %_4689~1':_stg %_4688~0':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_4767
	mov rdi,r10
	call dlt
LB_4767:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_4755:
MTC_LB_4692:
	mov r15,0
LB_4769:
	cmp r15,0
	jz LB_4770
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4769
LB_4770:
; ∎ { %_4668 %_4670 }
 ; {>  %_4669~1':_r64 %_4668~0':_stg %_4671~3':_r64 %_4672~4':(_lst)◂(_p4251) %_4670~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_4771
	mov rdi,r14
	call dlt
LB_4771:
	bt r12,3
	jc LB_4772
	mov rdi,r9
	call dlt
LB_4772:
	bt r12,4
	jc LB_4773
	mov rdi,r10
	call dlt
LB_4773:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_4774
	btr r12,1
	jmp LB_4775
LB_4774:
	bts r12,1
LB_4775:
	ret
MTC_LB_4768:
NS_E_4791:
; 	|» 0'
NS_E_RDI_4791:
; » 0xr0 |~ {  } ⊢ %_4777 : %_4777
 ; {>  %_4776~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_4777
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f4254 { %_4776 %_4777 } ⊢ { %_4778 %_4779 %_4780 } : { %_4778 %_4779 %_4780 }
 ; {>  %_4777~1':_r64 %_4776~0':_stg }
; _f4254 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_4254
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_4792
	btr r12,4
	jmp LB_4793
LB_4792:
	bts r12,4
LB_4793:
	mov r8,r9
	bt r12,3
	jc LB_4796
	btr r12,2
	jmp LB_4797
LB_4796:
	bts r12,2
LB_4797:
	mov rsi,1
	bt r12,2
	jc LB_4794
	mov rsi,0
	bt r8,0
	jc LB_4794
	jmp LB_4795
LB_4794:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_4795:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_4798:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_4799
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_4800
	bt QWORD [rax],0
	jc LB_4801
	btr r12,5
	jmp LB_4802
LB_4801:
	bts r12,5
LB_4802:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_4800:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_4805
	btr r12,6
	jmp LB_4806
LB_4805:
	bts r12,6
LB_4806:
	mov r9,rcx
	bt r12,6
	jc LB_4803
	btr r12,3
	jmp LB_4804
LB_4803:
	bts r12,3
LB_4804:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_4809
	btr r12,6
	jmp LB_4810
LB_4809:
	bts r12,6
LB_4810:
	mov r10,rcx
	bt r12,6
	jc LB_4807
	btr r12,4
	jmp LB_4808
LB_4807:
	bts r12,4
LB_4808:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_4811:
	cmp r15,0
	jz LB_4812
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4811
LB_4812:
; _f14 %_4781 ⊢ { %_4783 %_4784 } : { %_4783 %_4784 }
 ; {>  %_4782~4':(_lst)◂(_p4251) %_4781~3':_r64 %_4778~0':_stg %_4779~1':_r64 }
; _f14 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_4819
	btr r12,0
	jmp LB_4820
LB_4819:
	bts r12,0
LB_4820:
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_4821
	btr r12,2
	jmp LB_4822
LB_4821:
	bts r12,2
LB_4822:
	mov r9,r14
	bt r12,1
	jc LB_4823
	btr r12,3
	jmp LB_4824
LB_4823:
	bts r12,3
LB_4824:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_4817
	btr r12,4
	jmp LB_4818
LB_4817:
	bts r12,4
LB_4818:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_4815
	btr r12,1
	jmp LB_4816
LB_4815:
	bts r12,1
LB_4816:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_4813
	btr r12,0
	jmp LB_4814
LB_4813:
	bts r12,0
LB_4814:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_4785 : %_4785
 ; {>  %_4782~4':(_lst)◂(_p4251) %_4784~3':_stg %_4783~2':_r64 %_4778~0':_stg %_4779~1':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_4785
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_4786 : %_4786
 ; {>  %_4782~4':(_lst)◂(_p4251) %_4785~5':_r64 %_4784~3':_stg %_4783~2':_r64 %_4778~0':_stg %_4779~1':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_4786
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f4690 { %_4778 %_4785 %_4784 %_4786 %_4782 } ⊢ { %_4787 %_4788 } : { %_4787 %_4788 }
 ; {>  %_4782~4':(_lst)◂(_p4251) %_4786~6':_r64 %_4785~5':_r64 %_4784~3':_stg %_4783~2':_r64 %_4778~0':_stg %_4779~1':_r64 }
; _f4690 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_4829
	btr r12,1
	jmp LB_4830
LB_4829:
	bts r12,1
LB_4830:
	mov r8,r9
	bt r12,3
	jc LB_4831
	btr r12,2
	jmp LB_4832
LB_4831:
	bts r12,2
LB_4832:
	mov r9,rcx
	bt r12,6
	jc LB_4833
	btr r12,3
	jmp LB_4834
LB_4833:
	bts r12,3
LB_4834:
	call NS_E_4690
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_4835
	btr r12,3
	jmp LB_4836
LB_4835:
	bts r12,3
LB_4836:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_4827
	btr r12,2
	jmp LB_4828
LB_4827:
	bts r12,2
LB_4828:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_4825
	btr r12,1
	jmp LB_4826
LB_4825:
	bts r12,1
LB_4826:
	add rsp,24
; _some %_4788 ⊢ %_4789 : %_4789
 ; {>  %_4787~0':_stg %_4783~2':_r64 %_4779~1':_r64 %_4788~3':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_4787 %_4789 }
 ; {>  %_4787~0':_stg %_4783~2':_r64 %_4779~1':_r64 %_4789~°0◂3':(_opn)◂(_stg) }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_4837
	mov rdi,r8
	call dlt
LB_4837:
	bt r12,1
	jc LB_4838
	mov rdi,r14
	call dlt
LB_4838:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_4841
	btr r12,1
	jmp LB_4842
LB_4841:
	bts r12,1
LB_4842:
	mov rsi,1
	bt r12,1
	jc LB_4839
	mov rsi,0
	bt r14,0
	jc LB_4839
	jmp LB_4840
LB_4839:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_4840:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_4799:
	mov r15,0
LB_4844:
	cmp r15,0
	jz LB_4845
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_4844
LB_4845:
; _none {  } ⊢ %_4790 : %_4790
 ; {>  %_4778~0':_stg %_4779~1':_r64 %_4780~2':(_opn)◂({ _r64 (_lst)◂(_p4251) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_4778 %_4790 }
 ; {>  %_4790~°1◂{  }:(_opn)◂(t1203'(0)) %_4778~0':_stg %_4779~1':_r64 %_4780~2':(_opn)◂({ _r64 (_lst)◂(_p4251) }) }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_4846
	mov rdi,r14
	call dlt
LB_4846:
	bt r12,2
	jc LB_4847
	mov rdi,r8
	call dlt
LB_4847:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_4848
	mov rsi,0
	bt r14,0
	jc LB_4848
	jmp LB_4849
LB_4848:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_4849:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_4843:
NS_E_4855:
NS_E_RDI_4855:
; » _^ ..
	mov rax,51
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "##\n"
	mov rsi,0x_23
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_23
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; "W"
	mov rsi,0x_57
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "[# fdEF [# F #] jfioe 2 #]"
	mov rsi,0x_20_46_45_64_66_20_23_5b
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20_5d_23_20_46_20_23_5b
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_20_32_20_65_6f_69_66_6a
	mov QWORD [rdi+8*2],rsi
	mov rsi,0x_23
	mov BYTE [rdi+8*3+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*3+1],sil
	add rdi,26
; "FF## huugugugu\t\t\t\t\t\t\n"
	mov rsi,0x_75_75_68_20_23_23_46_46
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09_09_75_67_75_67_75_67
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+2],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+4],sil
	add rdi,21
; //
	mov r13,rax
	btr r12,0
; _f4791 %_4850 ⊢ { %_4851 %_4852 } : { %_4851 %_4852 }
 ; {>  %_4850~0':_stg }
; _f4791 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_4791
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_4851 %_4852 } ⊢ { %_4853 %_4854 } : { %_4853 %_4854 }
 ; {>  %_4851~0':_stg %_4852~1':(_opn)◂(_stg) }
; _f21 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_4856
	btr r12,2
	jmp LB_4857
LB_4856:
	bts r12,2
LB_4857:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_4860
	btr r12,3
	jmp LB_4861
LB_4860:
	bts r12,3
LB_4861:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_4858
	btr QWORD [rdi],0
	jmp LB_4859
LB_4858:
	bts QWORD [rdi],0
LB_4859:
	mov r9,r14
	bt r12,1
	jc LB_4864
	btr r12,3
	jmp LB_4865
LB_4864:
	bts r12,3
LB_4865:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_4862
	btr QWORD [rdi],1
	jmp LB_4863
LB_4862:
	bts QWORD [rdi],1
LB_4863:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_4866
	btr r12,2
	jmp LB_4867
LB_4866:
	bts r12,2
LB_4867:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_4870
	btr r12,3
	jmp LB_4871
LB_4870:
	bts r12,3
LB_4871:
	mov r13,r9
	bt r12,3
	jc LB_4868
	btr r12,0
	jmp LB_4869
LB_4868:
	bts r12,0
LB_4869:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_4874
	btr r12,3
	jmp LB_4875
LB_4874:
	bts r12,3
LB_4875:
	mov r14,r9
	bt r12,3
	jc LB_4872
	btr r12,1
	jmp LB_4873
LB_4872:
	bts r12,1
LB_4873:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_4853~0':_stg %_4854~1':(_opn)◂(_stg) }
; 	∎ {  }
	bt r12,0
	jc LB_4876
	mov rdi,r13
	call dlt
LB_4876:
	bt r12,1
	jc LB_4877
	mov rdi,r14
	call dlt
LB_4877:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_4879:
NS_E_RDI_4879:
NS_E_4879_ETR_TBL:
NS_E_4879_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	jmp LB_4894
LB_4893:
	add r14,1
LB_4894:
	cmp r14,r10
	jge LB_4895
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4893
	cmp al,10
	jz LB_4893
	cmp al,32
	jz LB_4893
LB_4895:
	push r10
	call NS_E_4190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4896
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4879_MTC_0_failed
LB_4896:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_4899
LB_4898:
	add r14,1
LB_4899:
	cmp r14,r10
	jge LB_4900
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4898
	cmp al,10
	jz LB_4898
	cmp al,32
	jz LB_4898
LB_4900:
	add r14,1
	cmp r14,r10
	jg LB_4904
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_4904
	jmp LB_4905
LB_4904:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4902
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4902:
	jmp NS_E_4879_MTC_0_failed
LB_4905:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_4907
LB_4906:
	add r14,1
LB_4907:
	cmp r14,r10
	jge LB_4908
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4906
	cmp al,10
	jz LB_4906
	cmp al,32
	jz LB_4906
LB_4908:
	push r10
	call NS_E_4879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4909
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_4910
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_4910:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4911
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4911:
	jmp NS_E_4879_MTC_0_failed
LB_4909:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_4889
	btr QWORD [rdi],2
LB_4889:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4890
	btr QWORD [rdi],1
LB_4890:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4891
	btr QWORD [rdi],0
LB_4891:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4879_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_4885
LB_4884:
	add r14,1
LB_4885:
	cmp r14,r10
	jge LB_4886
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4884
	cmp al,32
	jz LB_4884
LB_4886:
	push r10
	call NS_E_4190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4887
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4879_MTC_1_failed
LB_4887:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4882
	btr QWORD [rdi],0
LB_4882:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4879_MTC_1_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4914:
NS_E_RDI_4914:
NS_E_4914_ETR_TBL:
NS_E_4914_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_3642_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4938
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4914_MTC_0_failed
LB_4938:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_4946
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_4946
	jmp LB_4947
LB_4946:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_4944
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_4944:
	jmp NS_E_4914_MTC_0_failed
LB_4947:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4932
	btr QWORD [rdi],1
LB_4932:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4933
	btr QWORD [rdi],0
LB_4933:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4914_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_3713_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4930
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4914_MTC_1_failed
LB_4930:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4925
	btr QWORD [rdi],0
LB_4925:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4914_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_4879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_4923
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4914_MTC_2_failed
LB_4923:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4918
	btr QWORD [rdi],0
LB_4918:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4914_MTC_2_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4949:
NS_E_RDI_4949:
NS_E_4949_ETR_TBL:
NS_E_4949_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_4955
LB_4954:
	add r14,1
LB_4955:
	cmp r14,r10
	jge LB_4956
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4954
	cmp al,32
	jz LB_4954
LB_4956:
	add r14,1
	cmp r14,r10
	jg LB_4959
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4959
	jmp LB_4960
LB_4959:
	jmp NS_E_4949_MTC_0_failed
LB_4960:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ "\n" ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_4965:
	jmp LB_4962
LB_4961:
	add r14,1
LB_4962:
	cmp r14,r10
	jge LB_4963
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_4961
	cmp al,32
	jz LB_4961
LB_4963:
	add r14,1
	cmp r14,r10
	jg LB_4964
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_4964
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov [rax+8*1],rsi
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_4965
LB_4964:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_4951
	btr QWORD [rdi],1
LB_4951:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_4952
	btr QWORD [rdi],0
LB_4952:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4949_MTC_0_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4967:
NS_E_RDI_4967:
NS_E_4967_ETR_TBL:
NS_E_4967_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ glb_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_5142:
	jmp LB_5139
LB_5138:
	add r14,1
LB_5139:
	cmp r14,r10
	jge LB_5140
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5138
	cmp al,10
	jz LB_5138
	cmp al,32
	jz LB_5138
LB_5140:
	push r10
	push rsi
	call NS_E_4969_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5141
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5143
	bts QWORD [rax],0
LB_5143:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5142
LB_5141:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5136
	btr QWORD [rdi],0
LB_5136:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4967_MTC_0_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4969:
NS_E_RDI_4969:
NS_E_4969_ETR_TBL:
NS_E_4969_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167+s8"
	jmp LB_5413
LB_5412:
	add r14,1
LB_5413:
	cmp r14,r10
	jge LB_5414
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5412
	cmp al,10
	jz LB_5412
	cmp al,32
	jz LB_5412
LB_5414:
	add r14,7
	cmp r14,r10
	jg LB_5417
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_5417
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_5417
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_5417
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_5417
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_5417
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_5417
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_5417
	jmp LB_5418
LB_5417:
	jmp NS_E_4969_MTC_0_failed
LB_5418:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr
	jmp LB_5420
LB_5419:
	add r14,1
LB_5420:
	cmp r14,r10
	jge LB_5421
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5419
	cmp al,10
	jz LB_5419
	cmp al,32
	jz LB_5419
LB_5421:
	push r10
	call NS_E_5019_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5422
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5423
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5423:
	jmp NS_E_4969_MTC_0_failed
LB_5422:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_5429:
	jmp LB_5426
LB_5425:
	add r14,1
LB_5426:
	cmp r14,r10
	jge LB_5427
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5425
	cmp al,10
	jz LB_5425
	cmp al,32
	jz LB_5425
LB_5427:
	push r10
	push rsi
	call NS_E_5019_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5428
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5430
	bts QWORD [rax],0
LB_5430:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5429
LB_5428:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5408
	btr QWORD [rdi],2
LB_5408:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5409
	btr QWORD [rdi],1
LB_5409:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5410
	btr QWORD [rdi],0
LB_5410:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4969_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167\194\167"
	jmp LB_5396
LB_5395:
	add r14,1
LB_5396:
	cmp r14,r10
	jge LB_5397
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5395
	cmp al,10
	jz LB_5395
	cmp al,32
	jz LB_5395
LB_5397:
	add r14,4
	cmp r14,r10
	jg LB_5400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_5400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_5400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_5400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_5400
	jmp LB_5401
LB_5400:
	jmp NS_E_4969_MTC_1_failed
LB_5401:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_5403
LB_5402:
	add r14,1
LB_5403:
	cmp r14,r10
	jge LB_5404
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5402
	cmp al,10
	jz LB_5402
	cmp al,32
	jz LB_5402
LB_5404:
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5405
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5406
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5406:
	jmp NS_E_4969_MTC_1_failed
LB_5405:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	call LB_5144
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5392
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5392:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5393
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5393:
NS_E_4969_MTC_1_failed:
	add rsp,32
	pop r14
	jmp LB_5145
LB_5144:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_5164
LB_5163:
	add r14,1
LB_5164:
	cmp r14,r10
	jge LB_5165
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5163
	cmp al,10
	jz LB_5163
	cmp al,32
	jz LB_5163
LB_5165:
	add r14,1
	cmp r14,r10
	jg LB_5168
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_5168
	jmp LB_5169
LB_5168:
	jmp NS_E_5146_MTC_0_failed
LB_5169:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_5171
LB_5170:
	add r14,1
LB_5171:
	cmp r14,r10
	jge LB_5172
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5170
	cmp al,10
	jz LB_5170
	cmp al,32
	jz LB_5170
LB_5172:
	push r10
	call NS_E_4879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5173
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5174
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5174:
	jmp NS_E_5146_MTC_0_failed
LB_5173:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5157
	btr QWORD [rdi],1
LB_5157:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5158
	btr QWORD [rdi],0
LB_5158:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5160
	btr QWORD [rdi],1
LB_5160:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5161
	btr QWORD [rdi],0
LB_5161:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5146_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_5153
LB_5152:
	add r14,1
LB_5153:
	cmp r14,r10
	jge LB_5154
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5152
	cmp al,10
	jz LB_5152
	cmp al,32
	jz LB_5152
LB_5154:
	push r10
	call NS_E_4971_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5155
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5146_MTC_1_failed
LB_5155:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5147
	btr QWORD [rdi],0
LB_5147:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5149
	btr QWORD [rdi],1
LB_5149:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5150
	btr QWORD [rdi],0
LB_5150:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5146_MTC_1_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5145:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\167"
	jmp LB_5386
LB_5385:
	add r14,1
LB_5386:
	cmp r14,r10
	jge LB_5387
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5385
	cmp al,10
	jz LB_5385
	cmp al,32
	jz LB_5385
LB_5387:
	add r14,2
	cmp r14,r10
	jg LB_5390
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_5390
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_5390
	jmp LB_5391
LB_5390:
	jmp NS_E_4969_MTC_2_failed
LB_5391:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	call LB_5176
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5383
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5383:
NS_E_4969_MTC_2_failed:
	add rsp,16
	pop r14
	jmp LB_5177
LB_5176:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "@"
	jmp LB_5257
LB_5256:
	add r14,1
LB_5257:
	cmp r14,r10
	jge LB_5258
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5256
	cmp al,10
	jz LB_5256
	cmp al,32
	jz LB_5256
LB_5258:
	add r14,1
	cmp r14,r10
	jg LB_5261
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_5261
	jmp LB_5262
LB_5261:
	jmp NS_E_5178_MTC_0_failed
LB_5262:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_5264
LB_5263:
	add r14,1
LB_5264:
	cmp r14,r10
	jge LB_5265
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5263
	cmp al,10
	jz LB_5263
	cmp al,32
	jz LB_5263
LB_5265:
	add r14,1
	cmp r14,r10
	jg LB_5269
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_5269
	jmp LB_5270
LB_5269:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5267
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5267:
	jmp NS_E_5178_MTC_0_failed
LB_5270:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_5272
LB_5271:
	add r14,1
LB_5272:
	cmp r14,r10
	jge LB_5273
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5271
	cmp al,10
	jz LB_5271
	cmp al,32
	jz LB_5271
LB_5273:
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5274
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5275
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5275:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5276
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5276:
	jmp NS_E_5178_MTC_0_failed
LB_5274:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_5279
LB_5278:
	add r14,1
LB_5279:
	cmp r14,r10
	jge LB_5280
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5278
	cmp al,10
	jz LB_5278
	cmp al,32
	jz LB_5278
LB_5280:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5281
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5282
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5282:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5283
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5283:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5284
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5284:
	jmp NS_E_5178_MTC_0_failed
LB_5281:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_5287
LB_5286:
	add r14,1
LB_5287:
	cmp r14,r10
	jge LB_5288
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5286
	cmp al,10
	jz LB_5286
	cmp al,32
	jz LB_5286
LB_5288:
	push r10
	call NS_E_4977_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5289
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5290
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5290:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5291
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5291:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5292
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5292:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5293
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5293:
	jmp NS_E_5178_MTC_0_failed
LB_5289:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; ⟦ qlq_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_5299:
	jmp LB_5296
LB_5295:
	add r14,1
LB_5296:
	cmp r14,r10
	jge LB_5297
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5295
	cmp al,10
	jz LB_5295
	cmp al,32
	jz LB_5295
LB_5297:
	push r10
	push rsi
	call NS_E_4973_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5298
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5300
	bts QWORD [rax],0
LB_5300:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5299
LB_5298:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0006_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_5247
	btr QWORD [rdi],5
LB_5247:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_5248
	btr QWORD [rdi],4
LB_5248:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5249
	btr QWORD [rdi],3
LB_5249:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5250
	btr QWORD [rdi],2
LB_5250:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5251
	btr QWORD [rdi],1
LB_5251:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5252
	btr QWORD [rdi],0
LB_5252:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,104
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5254
	btr QWORD [rdi],0
LB_5254:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5178_MTC_0_failed:
	add rsp,96
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_5243
LB_5242:
	add r14,1
LB_5243:
	cmp r14,r10
	jge LB_5244
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5242
	cmp al,10
	jz LB_5242
	cmp al,32
	jz LB_5242
LB_5244:
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5245
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5178_MTC_1_failed
LB_5245:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	call LB_5179
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5240
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5240:
NS_E_5178_MTC_1_failed:
	add rsp,16
	pop r14
	jmp LB_5180
LB_5179:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_5228
LB_5227:
	add r14,1
LB_5228:
	cmp r14,r10
	jge LB_5229
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5227
	cmp al,10
	jz LB_5227
	cmp al,32
	jz LB_5227
LB_5229:
	add r14,1
	cmp r14,r10
	jg LB_5232
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_5232
	jmp LB_5233
LB_5232:
	jmp NS_E_5181_MTC_0_failed
LB_5233:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_5235
LB_5234:
	add r14,1
LB_5235:
	cmp r14,r10
	jge LB_5236
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5234
	cmp al,10
	jz LB_5234
	cmp al,32
	jz LB_5234
LB_5236:
	push r10
	call NS_E_4914_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5237
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5238
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5238:
	jmp NS_E_5181_MTC_0_failed
LB_5237:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5220
	btr QWORD [rdi],1
LB_5220:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5221
	btr QWORD [rdi],0
LB_5221:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5225
	btr QWORD [rdi],0
LB_5225:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5223
	btr QWORD [rdi],0
LB_5223:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5181_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_5208
LB_5207:
	add r14,1
LB_5208:
	cmp r14,r10
	jge LB_5209
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5207
	cmp al,10
	jz LB_5207
	cmp al,32
	jz LB_5207
LB_5209:
	add r14,2
	cmp r14,r10
	jg LB_5212
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_5212
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_5212
	jmp LB_5213
LB_5212:
	jmp NS_E_5181_MTC_1_failed
LB_5213:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_5215
LB_5214:
	add r14,1
LB_5215:
	cmp r14,r10
	jge LB_5216
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5214
	cmp al,10
	jz LB_5214
	cmp al,32
	jz LB_5214
LB_5216:
	push r10
	call NS_E_4977_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5217
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5218
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5218:
	jmp NS_E_5181_MTC_1_failed
LB_5217:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5200
	btr QWORD [rdi],1
LB_5200:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5201
	btr QWORD [rdi],0
LB_5201:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5205
	btr QWORD [rdi],0
LB_5205:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5203
	btr QWORD [rdi],0
LB_5203:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5181_MTC_1_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg_ptn
	jmp LB_5190
LB_5189:
	add r14,1
LB_5190:
	cmp r14,r10
	jge LB_5191
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5189
	cmp al,10
	jz LB_5189
	cmp al,32
	jz LB_5189
LB_5191:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5192
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5181_MTC_2_failed
LB_5192:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_5195
LB_5194:
	add r14,1
LB_5195:
	cmp r14,r10
	jge LB_5196
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5194
	cmp al,10
	jz LB_5194
	cmp al,32
	jz LB_5194
LB_5196:
	push r10
	call NS_E_4977_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5197
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5198
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5198:
	jmp NS_E_5181_MTC_2_failed
LB_5197:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5182
	btr QWORD [rdi],1
LB_5182:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5183
	btr QWORD [rdi],0
LB_5183:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5187
	btr QWORD [rdi],0
LB_5187:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5185
	btr QWORD [rdi],0
LB_5185:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5181_MTC_2_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5180:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5177:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\182"
	jmp LB_5377
LB_5376:
	add r14,1
LB_5377:
	cmp r14,r10
	jge LB_5378
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5376
	cmp al,10
	jz LB_5376
	cmp al,32
	jz LB_5376
LB_5378:
	add r14,2
	cmp r14,r10
	jg LB_5381
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_5381
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_5381
	jmp LB_5382
LB_5381:
	jmp NS_E_4969_MTC_3_failed
LB_5382:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	call LB_5301
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5374
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5374:
NS_E_4969_MTC_3_failed:
	add rsp,16
	pop r14
	jmp LB_5302
LB_5301:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_5347
LB_5346:
	add r14,1
LB_5347:
	cmp r14,r10
	jge LB_5348
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5346
	cmp al,10
	jz LB_5346
	cmp al,32
	jz LB_5346
LB_5348:
	add r14,1
	cmp r14,r10
	jg LB_5351
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_5351
	jmp LB_5352
LB_5351:
	jmp NS_E_5303_MTC_0_failed
LB_5352:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_5354
LB_5353:
	add r14,1
LB_5354:
	cmp r14,r10
	jge LB_5355
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5353
	cmp al,10
	jz LB_5353
	cmp al,32
	jz LB_5353
LB_5355:
	add r14,1
	cmp r14,r10
	jg LB_5359
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_5359
	jmp LB_5360
LB_5359:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5357
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5357:
	jmp NS_E_5303_MTC_0_failed
LB_5360:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_5362
LB_5361:
	add r14,1
LB_5362:
	cmp r14,r10
	jge LB_5363
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5361
	cmp al,10
	jz LB_5361
	cmp al,32
	jz LB_5361
LB_5363:
	push r10
	call NS_E_5005_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5364
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5365
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5365:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5366
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5366:
	jmp NS_E_5303_MTC_0_failed
LB_5364:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; ⟦ qlq_dt_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_5372:
	jmp LB_5369
LB_5368:
	add r14,1
LB_5369:
	cmp r14,r10
	jge LB_5370
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5368
	cmp al,10
	jz LB_5368
	cmp al,32
	jz LB_5368
LB_5370:
	push r10
	push rsi
	call NS_E_5007_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5371
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5373
	bts QWORD [rax],0
LB_5373:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5372
LB_5371:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5339
	btr QWORD [rdi],3
LB_5339:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5340
	btr QWORD [rdi],2
LB_5340:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5341
	btr QWORD [rdi],1
LB_5341:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5342
	btr QWORD [rdi],0
LB_5342:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5344
	btr QWORD [rdi],0
LB_5344:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5303_MTC_0_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_5320
LB_5319:
	add r14,1
LB_5320:
	cmp r14,r10
	jge LB_5321
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5319
	cmp al,10
	jz LB_5319
	cmp al,32
	jz LB_5319
LB_5321:
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5322
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5303_MTC_1_failed
LB_5322:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_5325
LB_5324:
	add r14,1
LB_5325:
	cmp r14,r10
	jge LB_5326
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5324
	cmp al,10
	jz LB_5324
	cmp al,32
	jz LB_5324
LB_5326:
	add r14,1
	cmp r14,r10
	jg LB_5330
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_5330
	jmp LB_5331
LB_5330:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5328
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5328:
	jmp NS_E_5303_MTC_1_failed
LB_5331:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_5333
LB_5332:
	add r14,1
LB_5333:
	cmp r14,r10
	jge LB_5334
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5332
	cmp al,10
	jz LB_5332
	cmp al,32
	jz LB_5332
LB_5334:
	push r10
	call NS_E_4879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5335
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5336
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5336:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5337
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5337:
	jmp NS_E_5303_MTC_1_failed
LB_5335:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5313
	btr QWORD [rdi],2
LB_5313:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5314
	btr QWORD [rdi],1
LB_5314:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5315
	btr QWORD [rdi],0
LB_5315:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5317
	btr QWORD [rdi],0
LB_5317:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5303_MTC_1_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_5309
LB_5308:
	add r14,1
LB_5309:
	cmp r14,r10
	jge LB_5310
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5308
	cmp al,10
	jz LB_5308
	cmp al,32
	jz LB_5308
LB_5310:
	push r10
	call NS_E_5005_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5311
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5303_MTC_2_failed
LB_5311:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5304
	btr QWORD [rdi],0
LB_5304:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5306
	btr QWORD [rdi],0
LB_5306:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5303_MTC_2_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5302:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4971:
NS_E_RDI_4971:
NS_E_4971_ETR_TBL:
NS_E_4971_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_5448
LB_5447:
	add r14,1
LB_5448:
	cmp r14,r10
	jge LB_5449
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5447
	cmp al,10
	jz LB_5447
	cmp al,32
	jz LB_5447
LB_5449:
	add r14,6
	cmp r14,r10
	jg LB_5452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_5452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_5452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_5452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_5452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_5452
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_5452
	jmp LB_5453
LB_5452:
	jmp NS_E_4971_MTC_0_failed
LB_5453:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5445
	btr QWORD [rdi],0
LB_5445:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4971_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_5435
LB_5434:
	add r14,1
LB_5435:
	cmp r14,r10
	jge LB_5436
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5434
	cmp al,10
	jz LB_5434
	cmp al,32
	jz LB_5434
LB_5436:
	push r10
	call NS_E_4969_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5437
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4971_MTC_1_failed
LB_5437:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_5440
LB_5439:
	add r14,1
LB_5440:
	cmp r14,r10
	jge LB_5441
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5439
	cmp al,10
	jz LB_5439
	cmp al,32
	jz LB_5439
LB_5441:
	push r10
	call NS_E_4971_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5442
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5443
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5443:
	jmp NS_E_4971_MTC_1_failed
LB_5442:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5431
	btr QWORD [rdi],1
LB_5431:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5432
	btr QWORD [rdi],0
LB_5432:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4971_MTC_1_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4973:
NS_E_RDI_4973:
NS_E_4973_ETR_TBL:
NS_E_4973_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "@"
	jmp LB_5461
LB_5460:
	add r14,1
LB_5461:
	cmp r14,r10
	jge LB_5462
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5460
	cmp al,10
	jz LB_5460
	cmp al,32
	jz LB_5460
LB_5462:
	add r14,1
	cmp r14,r10
	jg LB_5465
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_5465
	jmp LB_5466
LB_5465:
	jmp NS_E_4973_MTC_0_failed
LB_5466:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_5468
LB_5467:
	add r14,1
LB_5468:
	cmp r14,r10
	jge LB_5469
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5467
	cmp al,10
	jz LB_5467
	cmp al,32
	jz LB_5467
LB_5469:
	add r14,1
	cmp r14,r10
	jg LB_5473
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_5473
	jmp LB_5474
LB_5473:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5471
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5471:
	jmp NS_E_4973_MTC_0_failed
LB_5474:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_5476
LB_5475:
	add r14,1
LB_5476:
	cmp r14,r10
	jge LB_5477
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5475
	cmp al,10
	jz LB_5475
	cmp al,32
	jz LB_5475
LB_5477:
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5478
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5479
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5479:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5480
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5480:
	jmp NS_E_4973_MTC_0_failed
LB_5478:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_5483
LB_5482:
	add r14,1
LB_5483:
	cmp r14,r10
	jge LB_5484
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5482
	cmp al,10
	jz LB_5482
	cmp al,32
	jz LB_5482
LB_5484:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5485
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5486
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5486:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5487
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5487:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5488
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5488:
	jmp NS_E_4973_MTC_0_failed
LB_5485:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_5491
LB_5490:
	add r14,1
LB_5491:
	cmp r14,r10
	jge LB_5492
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5490
	cmp al,10
	jz LB_5490
	cmp al,32
	jz LB_5490
LB_5492:
	push r10
	call NS_E_4977_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5493
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5494
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5494:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5495
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5495:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5496
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5496:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5497
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5497:
	jmp NS_E_4973_MTC_0_failed
LB_5493:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_5454
	btr QWORD [rdi],4
LB_5454:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5455
	btr QWORD [rdi],3
LB_5455:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5456
	btr QWORD [rdi],2
LB_5456:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5457
	btr QWORD [rdi],1
LB_5457:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5458
	btr QWORD [rdi],0
LB_5458:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4973_MTC_0_failed:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4975:
NS_E_RDI_4975:
NS_E_4975_ETR_TBL:
NS_E_4975_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_5504
LB_5503:
	add r14,1
LB_5504:
	cmp r14,r10
	jge LB_5505
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5503
	cmp al,10
	jz LB_5503
	cmp al,32
	jz LB_5503
LB_5505:
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5506
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4975_MTC_0_failed
LB_5506:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_5509
LB_5508:
	add r14,1
LB_5509:
	cmp r14,r10
	jge LB_5510
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5508
	cmp al,10
	jz LB_5508
	cmp al,32
	jz LB_5508
LB_5510:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5511
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5512
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5512:
	jmp NS_E_4975_MTC_0_failed
LB_5511:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_5515
LB_5514:
	add r14,1
LB_5515:
	cmp r14,r10
	jge LB_5516
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5514
	cmp al,10
	jz LB_5514
	cmp al,32
	jz LB_5514
LB_5516:
	push r10
	call NS_E_4977_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5517
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5518
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5518:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5519
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5519:
	jmp NS_E_4975_MTC_0_failed
LB_5517:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5499
	btr QWORD [rdi],2
LB_5499:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5500
	btr QWORD [rdi],1
LB_5500:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5501
	btr QWORD [rdi],0
LB_5501:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4975_MTC_0_failed:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4977:
NS_E_RDI_4977:
NS_E_4977_ETR_TBL:
NS_E_4977_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_5546
LB_5545:
	add r14,1
LB_5546:
	cmp r14,r10
	jge LB_5547
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5545
	cmp al,10
	jz LB_5545
	cmp al,32
	jz LB_5545
LB_5547:
	add r14,3
	cmp r14,r10
	jg LB_5550
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5550
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_5550
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_5550
	jmp LB_5551
LB_5550:
	jmp NS_E_4977_MTC_0_failed
LB_5551:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_5553
LB_5552:
	add r14,1
LB_5553:
	cmp r14,r10
	jge LB_5554
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5552
	cmp al,10
	jz LB_5552
	cmp al,32
	jz LB_5552
LB_5554:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5555
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5556
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5556:
	jmp NS_E_4977_MTC_0_failed
LB_5555:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5542
	btr QWORD [rdi],1
LB_5542:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5543
	btr QWORD [rdi],0
LB_5543:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4977_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_5538
LB_5537:
	add r14,1
LB_5538:
	cmp r14,r10
	jge LB_5539
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5537
	cmp al,10
	jz LB_5537
	cmp al,32
	jz LB_5537
LB_5539:
	push r10
	call NS_E_4989_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5540
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4977_MTC_1_failed
LB_5540:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5535
	btr QWORD [rdi],0
LB_5535:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4977_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; lc_line
	jmp LB_5525
LB_5524:
	add r14,1
LB_5525:
	cmp r14,r10
	jge LB_5526
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5524
	cmp al,10
	jz LB_5524
	cmp al,32
	jz LB_5524
LB_5526:
	push r10
	call NS_E_4979_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5527
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4977_MTC_2_failed
LB_5527:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_5530
LB_5529:
	add r14,1
LB_5530:
	cmp r14,r10
	jge LB_5531
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5529
	cmp al,10
	jz LB_5529
	cmp al,32
	jz LB_5529
LB_5531:
	push r10
	call NS_E_4977_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5532
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5533
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5533:
	jmp NS_E_4977_MTC_2_failed
LB_5532:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5521
	btr QWORD [rdi],1
LB_5521:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5522
	btr QWORD [rdi],0
LB_5522:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4977_MTC_2_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4979:
NS_E_RDI_4979:
NS_E_4979_ETR_TBL:
NS_E_4979_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "$"
	jmp LB_5807
LB_5806:
	add r14,1
LB_5807:
	cmp r14,r10
	jge LB_5808
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5806
	cmp al,10
	jz LB_5806
	cmp al,32
	jz LB_5806
LB_5808:
	add r14,1
	cmp r14,r10
	jg LB_5811
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_5811
	jmp LB_5812
LB_5811:
	jmp NS_E_4979_MTC_0_failed
LB_5812:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_5814
LB_5813:
	add r14,1
LB_5814:
	cmp r14,r10
	jge LB_5815
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5813
	cmp al,10
	jz LB_5813
	cmp al,32
	jz LB_5813
LB_5815:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5816
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5817
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5817:
	jmp NS_E_4979_MTC_0_failed
LB_5816:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_5820
LB_5819:
	add r14,1
LB_5820:
	cmp r14,r10
	jge LB_5821
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5819
	cmp al,10
	jz LB_5819
	cmp al,32
	jz LB_5819
LB_5821:
	add r14,3
	cmp r14,r10
	jg LB_5826
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5826
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_5826
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_5826
	jmp LB_5827
LB_5826:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5823
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5823:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5824
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5824:
	jmp NS_E_4979_MTC_0_failed
LB_5827:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_5829
LB_5828:
	add r14,1
LB_5829:
	cmp r14,r10
	jge LB_5830
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5828
	cmp al,10
	jz LB_5828
	cmp al,32
	jz LB_5828
LB_5830:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5831
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5832
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5832:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5833
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5833:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5834
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5834:
	jmp NS_E_4979_MTC_0_failed
LB_5831:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5801
	btr QWORD [rdi],3
LB_5801:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5802
	btr QWORD [rdi],2
LB_5802:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5803
	btr QWORD [rdi],1
LB_5803:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5804
	btr QWORD [rdi],0
LB_5804:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4979_MTC_0_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\151\130"
	jmp LB_5772
LB_5771:
	add r14,1
LB_5772:
	cmp r14,r10
	jge LB_5773
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5771
	cmp al,10
	jz LB_5771
	cmp al,32
	jz LB_5771
LB_5773:
	add r14,3
	cmp r14,r10
	jg LB_5776
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5776
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_5776
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_5776
	jmp LB_5777
LB_5776:
	jmp NS_E_4979_MTC_1_failed
LB_5777:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_5779
LB_5778:
	add r14,1
LB_5779:
	cmp r14,r10
	jge LB_5780
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5778
	cmp al,10
	jz LB_5778
	cmp al,32
	jz LB_5778
LB_5780:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5781
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5782
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5782:
	jmp NS_E_4979_MTC_1_failed
LB_5781:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_5785
LB_5784:
	add r14,1
LB_5785:
	cmp r14,r10
	jge LB_5786
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5784
	cmp al,10
	jz LB_5784
	cmp al,32
	jz LB_5784
LB_5786:
	add r14,3
	cmp r14,r10
	jg LB_5791
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5791
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_5791
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_5791
	jmp LB_5792
LB_5791:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5788
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5788:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5789
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5789:
	jmp NS_E_4979_MTC_1_failed
LB_5792:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_5794
LB_5793:
	add r14,1
LB_5794:
	cmp r14,r10
	jge LB_5795
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5793
	cmp al,10
	jz LB_5793
	cmp al,32
	jz LB_5793
LB_5795:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5796
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5797
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5797:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5798
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5798:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5799
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5799:
	jmp NS_E_4979_MTC_1_failed
LB_5796:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5766
	btr QWORD [rdi],3
LB_5766:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5767
	btr QWORD [rdi],2
LB_5767:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5768
	btr QWORD [rdi],1
LB_5768:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5769
	btr QWORD [rdi],0
LB_5769:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4979_MTC_1_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\187"
	jmp LB_5760
LB_5759:
	add r14,1
LB_5760:
	cmp r14,r10
	jge LB_5761
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5759
	cmp al,10
	jz LB_5759
	cmp al,32
	jz LB_5759
LB_5761:
	add r14,2
	cmp r14,r10
	jg LB_5764
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_5764
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_5764
	jmp LB_5765
LB_5764:
	jmp NS_E_4979_MTC_2_failed
LB_5765:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	call LB_5558
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5757
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5757:
NS_E_4979_MTC_2_failed:
	add rsp,16
	pop r14
	jmp LB_5559
LB_5558:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_^"
	jmp LB_5718
LB_5717:
	add r14,1
LB_5718:
	cmp r14,r10
	jge LB_5719
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5717
	cmp al,10
	jz LB_5717
	cmp al,32
	jz LB_5717
LB_5719:
	add r14,2
	cmp r14,r10
	jg LB_5722
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_5722
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_5722
	jmp LB_5723
LB_5722:
	jmp NS_E_5560_MTC_0_failed
LB_5723:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	call LB_5561
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5715
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5715:
NS_E_5560_MTC_0_failed:
	add rsp,16
	pop r14
	jmp LB_5562
LB_5561:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "_"
	jmp LB_5640
LB_5639:
	add r14,1
LB_5640:
	cmp r14,r10
	jge LB_5641
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5639
	cmp al,10
	jz LB_5639
	cmp al,32
	jz LB_5639
LB_5641:
	add r14,1
	cmp r14,r10
	jg LB_5644
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_5644
	jmp LB_5645
LB_5644:
	jmp NS_E_5563_MTC_0_failed
LB_5645:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_5647
LB_5646:
	add r14,1
LB_5647:
	cmp r14,r10
	jge LB_5648
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5646
	cmp al,10
	jz LB_5646
	cmp al,32
	jz LB_5646
LB_5648:
	add r14,3
	cmp r14,r10
	jg LB_5652
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5652
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_5652
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_5652
	jmp LB_5653
LB_5652:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5650
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5650:
	jmp NS_E_5563_MTC_0_failed
LB_5653:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg
	jmp LB_5655
LB_5654:
	add r14,1
LB_5655:
	cmp r14,r10
	jge LB_5656
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5654
	cmp al,10
	jz LB_5654
	cmp al,32
	jz LB_5654
LB_5656:
	push r10
	call NS_E_5003_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5657
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5658
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5658:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5659
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5659:
	jmp NS_E_5563_MTC_0_failed
LB_5657:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_5665:
	jmp LB_5662
LB_5661:
	add r14,1
LB_5662:
	cmp r14,r10
	jge LB_5663
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5661
	cmp al,10
	jz LB_5661
	cmp al,32
	jz LB_5661
LB_5663:
	push r10
	push rsi
	call NS_E_4981_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5664
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5666
	bts QWORD [rax],0
LB_5666:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5665
LB_5664:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rsi
; "//"
	jmp LB_5668
LB_5667:
	add r14,1
LB_5668:
	cmp r14,r10
	jge LB_5669
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5667
	cmp al,10
	jz LB_5667
	cmp al,32
	jz LB_5667
LB_5669:
	add r14,2
	cmp r14,r10
	jg LB_5676
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_5676
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_5676
	jmp LB_5677
LB_5676:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5671
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5671:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5672
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5672:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5673
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5673:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5674
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5674:
	jmp NS_E_5563_MTC_0_failed
LB_5677:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_5629
	btr QWORD [rdi],4
LB_5629:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5630
	btr QWORD [rdi],3
LB_5630:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5631
	btr QWORD [rdi],2
LB_5631:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5632
	btr QWORD [rdi],1
LB_5632:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5633
	btr QWORD [rdi],0
LB_5633:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5637
	btr QWORD [rdi],0
LB_5637:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5635
	btr QWORD [rdi],0
LB_5635:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5563_MTC_0_failed:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,112
; reg
	jmp LB_5577
LB_5576:
	add r14,1
LB_5577:
	cmp r14,r10
	jge LB_5578
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5576
	cmp al,10
	jz LB_5576
	cmp al,32
	jz LB_5576
LB_5578:
	push r10
	call NS_E_5003_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5579
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5563_MTC_1_failed
LB_5579:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ reg_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_5585:
	jmp LB_5582
LB_5581:
	add r14,1
LB_5582:
	cmp r14,r10
	jge LB_5583
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5581
	cmp al,10
	jz LB_5581
	cmp al,32
	jz LB_5581
LB_5583:
	push r10
	push rsi
	call NS_E_4987_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5584
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5586
	bts QWORD [rax],0
LB_5586:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5585
LB_5584:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "\226\138\162"
	jmp LB_5588
LB_5587:
	add r14,1
LB_5588:
	cmp r14,r10
	jge LB_5589
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5587
	cmp al,10
	jz LB_5587
	cmp al,32
	jz LB_5587
LB_5589:
	add r14,3
	cmp r14,r10
	jg LB_5594
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5594
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_5594
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_5594
	jmp LB_5595
LB_5594:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5591
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5591:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5592
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5592:
	jmp NS_E_5563_MTC_1_failed
LB_5595:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg
	jmp LB_5597
LB_5596:
	add r14,1
LB_5597:
	cmp r14,r10
	jge LB_5598
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5596
	cmp al,10
	jz LB_5596
	cmp al,32
	jz LB_5596
LB_5598:
	push r10
	call NS_E_5003_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5599
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5600
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5600:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5601
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5601:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5602
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5602:
	jmp NS_E_5563_MTC_1_failed
LB_5599:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ⟦ reg_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_5608:
	jmp LB_5605
LB_5604:
	add r14,1
LB_5605:
	cmp r14,r10
	jge LB_5606
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5604
	cmp al,10
	jz LB_5604
	cmp al,32
	jz LB_5604
LB_5606:
	push r10
	push rsi
	call NS_E_4987_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5607
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5609
	bts QWORD [rax],0
LB_5609:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5608
LB_5607:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rsi
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_5614:
	jmp LB_5611
LB_5610:
	add r14,1
LB_5611:
	cmp r14,r10
	jge LB_5612
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5610
	cmp al,10
	jz LB_5610
	cmp al,32
	jz LB_5610
LB_5612:
	push r10
	push rsi
	call NS_E_4981_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_5613
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_5615
	bts QWORD [rax],0
LB_5615:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_5614
LB_5613:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
; "//"
	jmp LB_5617
LB_5616:
	add r14,1
LB_5617:
	cmp r14,r10
	jge LB_5618
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5616
	cmp al,10
	jz LB_5616
	cmp al,32
	jz LB_5616
LB_5618:
	add r14,2
	cmp r14,r10
	jg LB_5627
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_5627
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_5627
	jmp LB_5628
LB_5627:
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_5620
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_5620:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_5621
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_5621:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5622
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5622:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5623
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5623:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5624
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5624:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5625
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5625:
	jmp NS_E_5563_MTC_1_failed
LB_5628:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*6],0
	mov QWORD [rsp+8*1+16*6],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0007_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_5564
	btr QWORD [rdi],6
LB_5564:
	mov rax,QWORD [rsp+16*6+8*1]
	mov [rdi+8*1+8*6],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_5565
	btr QWORD [rdi],5
LB_5565:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_5566
	btr QWORD [rdi],4
LB_5566:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5567
	btr QWORD [rdi],3
LB_5567:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5568
	btr QWORD [rdi],2
LB_5568:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5569
	btr QWORD [rdi],1
LB_5569:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5570
	btr QWORD [rdi],0
LB_5570:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,120
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5574
	btr QWORD [rdi],0
LB_5574:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5572
	btr QWORD [rdi],0
LB_5572:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5563_MTC_1_failed:
	add rsp,112
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5562:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; cst
	jmp LB_5686
LB_5685:
	add r14,1
LB_5686:
	cmp r14,r10
	jge LB_5687
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5685
	cmp al,10
	jz LB_5685
	cmp al,32
	jz LB_5685
LB_5687:
	push r10
	call NS_E_4914_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5688
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5560_MTC_1_failed
LB_5688:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_5691
LB_5690:
	add r14,1
LB_5691:
	cmp r14,r10
	jge LB_5692
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5690
	cmp al,10
	jz LB_5690
	cmp al,32
	jz LB_5690
LB_5692:
	add r14,1
	cmp r14,r10
	jg LB_5696
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_5696
	jmp LB_5697
LB_5696:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5694
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5694:
	jmp NS_E_5560_MTC_1_failed
LB_5697:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_5699
LB_5698:
	add r14,1
LB_5699:
	cmp r14,r10
	jge LB_5700
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5698
	cmp al,10
	jz LB_5698
	cmp al,32
	jz LB_5698
LB_5700:
	add r14,3
	cmp r14,r10
	jg LB_5705
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5705
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_5705
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_5705
	jmp LB_5706
LB_5705:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5702
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5702:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5703
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5703:
	jmp NS_E_5560_MTC_1_failed
LB_5706:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_5708
LB_5707:
	add r14,1
LB_5708:
	cmp r14,r10
	jge LB_5709
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5707
	cmp al,10
	jz LB_5707
	cmp al,32
	jz LB_5707
LB_5709:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5710
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5711
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5711:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5712
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5712:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5713
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5713:
	jmp NS_E_5560_MTC_1_failed
LB_5710:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5678
	btr QWORD [rdi],3
LB_5678:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5679
	btr QWORD [rdi],2
LB_5679:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5680
	btr QWORD [rdi],1
LB_5680:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5681
	btr QWORD [rdi],0
LB_5681:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5683
	btr QWORD [rdi],0
LB_5683:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5560_MTC_1_failed:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_5559:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_5730
LB_5729:
	add r14,1
LB_5730:
	cmp r14,r10
	jge LB_5731
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5729
	cmp al,10
	jz LB_5729
	cmp al,32
	jz LB_5729
LB_5731:
	push r10
	call NS_E_4879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5732
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4979_MTC_3_failed
LB_5732:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_5735
LB_5734:
	add r14,1
LB_5735:
	cmp r14,r10
	jge LB_5736
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5734
	cmp al,10
	jz LB_5734
	cmp al,32
	jz LB_5734
LB_5736:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5737
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5738
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5738:
	jmp NS_E_4979_MTC_3_failed
LB_5737:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_5741
LB_5740:
	add r14,1
LB_5741:
	cmp r14,r10
	jge LB_5742
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5740
	cmp al,10
	jz LB_5740
	cmp al,32
	jz LB_5740
LB_5742:
	add r14,3
	cmp r14,r10
	jg LB_5747
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5747
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_5747
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_5747
	jmp LB_5748
LB_5747:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5744
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5744:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5745
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5745:
	jmp NS_E_4979_MTC_3_failed
LB_5748:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_5750
LB_5749:
	add r14,1
LB_5750:
	cmp r14,r10
	jge LB_5751
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5749
	cmp al,10
	jz LB_5749
	cmp al,32
	jz LB_5749
LB_5751:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5752
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5753
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5753:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5754
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5754:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5755
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5755:
	jmp NS_E_4979_MTC_3_failed
LB_5752:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5724
	btr QWORD [rdi],3
LB_5724:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5725
	btr QWORD [rdi],2
LB_5725:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5726
	btr QWORD [rdi],1
LB_5726:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5727
	btr QWORD [rdi],0
LB_5727:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4979_MTC_3_failed:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4981:
NS_E_RDI_4981:
NS_E_4981_ETR_TBL:
NS_E_4981_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_5869
LB_5868:
	add r14,1
LB_5869:
	cmp r14,r10
	jge LB_5870
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5868
	cmp al,10
	jz LB_5868
	cmp al,32
	jz LB_5868
LB_5870:
	push r10
	call NS_E_4983_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5871
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4981_MTC_0_failed
LB_5871:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5866
	btr QWORD [rdi],0
LB_5866:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4981_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_5862
LB_5861:
	add r14,1
LB_5862:
	cmp r14,r10
	jge LB_5863
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5861
	cmp al,10
	jz LB_5861
	cmp al,32
	jz LB_5861
LB_5863:
	push r10
	call NS_E_3713_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5864
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4981_MTC_1_failed
LB_5864:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5859
	btr QWORD [rdi],0
LB_5859:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4981_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_5855
LB_5854:
	add r14,1
LB_5855:
	cmp r14,r10
	jge LB_5856
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5854
	cmp al,10
	jz LB_5854
	cmp al,32
	jz LB_5854
LB_5856:
	push r10
	call NS_E_4879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5857
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4981_MTC_2_failed
LB_5857:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5852
	btr QWORD [rdi],0
LB_5852:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4981_MTC_2_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	jmp LB_5840
LB_5839:
	add r14,1
LB_5840:
	cmp r14,r10
	jge LB_5841
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5839
	cmp al,10
	jz LB_5839
	cmp al,32
	jz LB_5839
LB_5841:
	push r10
	call NS_E_3642_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5842
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4981_MTC_3_failed
LB_5842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	jmp LB_5845
LB_5844:
	add r14,1
LB_5845:
	cmp r14,r10
	jge LB_5846
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5844
	cmp al,10
	jz LB_5844
	cmp al,32
	jz LB_5844
LB_5846:
	add r14,1
	cmp r14,r10
	jg LB_5850
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_5850
	jmp LB_5851
LB_5850:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5848
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5848:
	jmp NS_E_4981_MTC_3_failed
LB_5851:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5836
	btr QWORD [rdi],1
LB_5836:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5837
	btr QWORD [rdi],0
LB_5837:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4981_MTC_3_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4983:
NS_E_RDI_4983:
NS_E_4983_ETR_TBL:
NS_E_4983_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_5881
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_5881
	jmp LB_5882
LB_5881:
	jmp NS_E_4983_MTC_0_failed
LB_5882:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_4985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5886
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5887
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5887:
	jmp NS_E_4983_MTC_0_failed
LB_5886:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5873
	btr QWORD [rdi],1
LB_5873:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5874
	btr QWORD [rdi],0
LB_5874:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4983_MTC_0_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4985:
NS_E_RDI_4985:
NS_E_4985_ETR_TBL:
NS_E_4985_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_5910
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_5910
	jmp LB_5911
LB_5910:
	jmp NS_E_4985_MTC_0_failed
LB_5911:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5903
	btr QWORD [rdi],0
LB_5903:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4985_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_3640_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5895
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4985_MTC_1_failed
LB_5895:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_4985_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5900
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5901
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5901:
	jmp NS_E_4985_MTC_1_failed
LB_5900:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5889
	btr QWORD [rdi],1
LB_5889:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5890
	btr QWORD [rdi],0
LB_5890:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4985_MTC_1_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4987:
NS_E_RDI_4987:
NS_E_4987_ETR_TBL:
NS_E_4987_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	add r14,1
	cmp r14,r10
	jg LB_5920
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_5920
	jmp LB_5921
LB_5920:
	jmp NS_E_4987_MTC_0_failed
LB_5921:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg
	push r10
	call NS_E_5003_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5925
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5926
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5926:
	jmp NS_E_4987_MTC_0_failed
LB_5925:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5912
	btr QWORD [rdi],1
LB_5912:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5913
	btr QWORD [rdi],0
LB_5913:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4987_MTC_0_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4989:
NS_E_RDI_4989:
NS_E_4989_ETR_TBL:
NS_E_4989_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_5968
LB_5967:
	add r14,1
LB_5968:
	cmp r14,r10
	jge LB_5969
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5967
	cmp al,10
	jz LB_5967
	cmp al,32
	jz LB_5967
LB_5969:
	add r14,3
	cmp r14,r10
	jg LB_5972
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_5972
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_5972
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_5972
	jmp LB_5973
LB_5972:
	jmp NS_E_4989_MTC_0_failed
LB_5973:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_5975
LB_5974:
	add r14,1
LB_5975:
	cmp r14,r10
	jge LB_5976
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5974
	cmp al,10
	jz LB_5974
	cmp al,32
	jz LB_5974
LB_5976:
	push r10
	call NS_E_4993_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5977
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5978
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5978:
	jmp NS_E_4989_MTC_0_failed
LB_5977:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_5981
LB_5980:
	add r14,1
LB_5981:
	cmp r14,r10
	jge LB_5982
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5980
	cmp al,10
	jz LB_5980
	cmp al,32
	jz LB_5980
LB_5982:
	push r10
	call NS_E_4991_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5983
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5984
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5984:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5985
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5985:
	jmp NS_E_4989_MTC_0_failed
LB_5983:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_5988
LB_5987:
	add r14,1
LB_5988:
	cmp r14,r10
	jge LB_5989
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5987
	cmp al,10
	jz LB_5987
	cmp al,32
	jz LB_5987
LB_5989:
	push r10
	call NS_E_4977_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5990
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5991
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5991:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5992
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5992:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5993
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5993:
	jmp NS_E_4989_MTC_0_failed
LB_5990:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_mtc
	jmp LB_5996
LB_5995:
	add r14,1
LB_5996:
	cmp r14,r10
	jge LB_5997
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5995
	cmp al,10
	jz LB_5995
	cmp al,32
	jz LB_5995
LB_5997:
	push r10
	call NS_E_4989_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5998
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_5999
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_5999:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6000
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6000:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6001
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6001:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6002
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6002:
	jmp NS_E_4989_MTC_0_failed
LB_5998:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_5961
	btr QWORD [rdi],4
LB_5961:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5962
	btr QWORD [rdi],3
LB_5962:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5963
	btr QWORD [rdi],2
LB_5963:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5964
	btr QWORD [rdi],1
LB_5964:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5965
	btr QWORD [rdi],0
LB_5965:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4989_MTC_0_failed:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144."
	jmp LB_5934
LB_5933:
	add r14,1
LB_5934:
	cmp r14,r10
	jge LB_5935
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5933
	cmp al,10
	jz LB_5933
	cmp al,32
	jz LB_5933
LB_5935:
	add r14,4
	cmp r14,r10
	jg LB_5938
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_5938
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_5938
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_5938
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_5938
	jmp LB_5939
LB_5938:
	jmp NS_E_4989_MTC_1_failed
LB_5939:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_5941
LB_5940:
	add r14,1
LB_5941:
	cmp r14,r10
	jge LB_5942
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5940
	cmp al,10
	jz LB_5940
	cmp al,32
	jz LB_5940
LB_5942:
	push r10
	call NS_E_4993_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5943
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5944
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5944:
	jmp NS_E_4989_MTC_1_failed
LB_5943:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_5947
LB_5946:
	add r14,1
LB_5947:
	cmp r14,r10
	jge LB_5948
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5946
	cmp al,10
	jz LB_5946
	cmp al,32
	jz LB_5946
LB_5948:
	push r10
	call NS_E_4991_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5949
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5950
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5950:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5951
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5951:
	jmp NS_E_4989_MTC_1_failed
LB_5949:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_5954
LB_5953:
	add r14,1
LB_5954:
	cmp r14,r10
	jge LB_5955
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_5953
	cmp al,10
	jz LB_5953
	cmp al,32
	jz LB_5953
LB_5955:
	push r10
	call NS_E_4977_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_5956
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_5957
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_5957:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_5958
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_5958:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_5959
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_5959:
	jmp NS_E_4989_MTC_1_failed
LB_5956:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_5928
	btr QWORD [rdi],3
LB_5928:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_5929
	btr QWORD [rdi],2
LB_5929:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_5930
	btr QWORD [rdi],1
LB_5930:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_5931
	btr QWORD [rdi],0
LB_5931:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4989_MTC_1_failed:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4991:
NS_E_RDI_4991:
NS_E_4991_ETR_TBL:
NS_E_4991_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_6008
LB_6007:
	add r14,1
LB_6008:
	cmp r14,r10
	jge LB_6009
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6007
	cmp al,32
	jz LB_6007
LB_6009:
	add r14,1
	cmp r14,r10
	jg LB_6012
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6012
	jmp LB_6013
LB_6012:
	jmp NS_E_4991_MTC_0_failed
LB_6013:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_6015
LB_6014:
	add r14,1
LB_6015:
	cmp r14,r10
	jge LB_6016
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6014
	cmp al,32
	jz LB_6014
LB_6016:
	add r14,1
	cmp r14,r10
	jg LB_6020
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_6020
	jmp LB_6021
LB_6020:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6018
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6018:
	jmp NS_E_4991_MTC_0_failed
LB_6021:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6004
	btr QWORD [rdi],1
LB_6004:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6005
	btr QWORD [rdi],0
LB_6005:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4991_MTC_0_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4993:
NS_E_RDI_4993:
NS_E_4993_ETR_TBL:
NS_E_4993_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; mtc_test
	jmp LB_6027
LB_6026:
	add r14,1
LB_6027:
	cmp r14,r10
	jge LB_6028
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6026
	cmp al,10
	jz LB_6026
	cmp al,32
	jz LB_6026
LB_6028:
	push r10
	call NS_E_4995_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6029
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4993_MTC_0_failed
LB_6029:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ mtc_test_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_6035:
	jmp LB_6032
LB_6031:
	add r14,1
LB_6032:
	cmp r14,r10
	jge LB_6033
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6031
	cmp al,10
	jz LB_6031
	cmp al,32
	jz LB_6031
LB_6033:
	push r10
	push rsi
	call NS_E_4997_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6034
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6036
	bts QWORD [rax],0
LB_6036:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6035
LB_6034:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6023
	btr QWORD [rdi],1
LB_6023:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6024
	btr QWORD [rdi],0
LB_6024:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4993_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4993_MTC_1_failed:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4995:
NS_E_RDI_4995:
NS_E_4995_ETR_TBL:
NS_E_4995_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; reg_ptn
	jmp LB_6068
LB_6067:
	add r14,1
LB_6068:
	cmp r14,r10
	jge LB_6069
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6067
	cmp al,10
	jz LB_6067
	cmp al,32
	jz LB_6067
LB_6069:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6070
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4995_MTC_0_failed
LB_6070:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_6073
LB_6072:
	add r14,1
LB_6073:
	cmp r14,r10
	jge LB_6074
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6072
	cmp al,10
	jz LB_6072
	cmp al,32
	jz LB_6072
LB_6074:
	add r14,3
	cmp r14,r10
	jg LB_6078
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6078
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6078
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6078
	jmp LB_6079
LB_6078:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6076
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6076:
	jmp NS_E_4995_MTC_0_failed
LB_6079:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_6081
LB_6080:
	add r14,1
LB_6081:
	cmp r14,r10
	jge LB_6082
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6080
	cmp al,10
	jz LB_6080
	cmp al,32
	jz LB_6080
LB_6082:
	push r10
	call NS_E_4879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6083
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6084
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6084:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6085
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6085:
	jmp NS_E_4995_MTC_0_failed
LB_6083:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_6088
LB_6087:
	add r14,1
LB_6088:
	cmp r14,r10
	jge LB_6089
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6087
	cmp al,10
	jz LB_6087
	cmp al,32
	jz LB_6087
LB_6089:
	add r14,3
	cmp r14,r10
	jg LB_6095
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6095
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_6095
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_6095
	jmp LB_6096
LB_6095:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6091
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6091:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6092
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6092:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6093
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6093:
	jmp NS_E_4995_MTC_0_failed
LB_6096:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; reg_ptn
	jmp LB_6098
LB_6097:
	add r14,1
LB_6098:
	cmp r14,r10
	jge LB_6099
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6097
	cmp al,10
	jz LB_6097
	cmp al,32
	jz LB_6097
LB_6099:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6100
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6101
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6101:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6102
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6102:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6103
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6103:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6104
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6104:
	jmp NS_E_4995_MTC_0_failed
LB_6100:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6061
	btr QWORD [rdi],4
LB_6061:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6062
	btr QWORD [rdi],3
LB_6062:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6063
	btr QWORD [rdi],2
LB_6063:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6064
	btr QWORD [rdi],1
LB_6064:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6065
	btr QWORD [rdi],0
LB_6065:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4995_MTC_0_failed:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; mtc_val
	jmp LB_6042
LB_6041:
	add r14,1
LB_6042:
	cmp r14,r10
	jge LB_6043
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6041
	cmp al,10
	jz LB_6041
	cmp al,32
	jz LB_6041
LB_6043:
	push r10
	call NS_E_4999_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6044
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4995_MTC_1_failed
LB_6044:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_6047
LB_6046:
	add r14,1
LB_6047:
	cmp r14,r10
	jge LB_6048
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6046
	cmp al,10
	jz LB_6046
	cmp al,32
	jz LB_6046
LB_6048:
	add r14,1
	cmp r14,r10
	jg LB_6052
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_6052
	jmp LB_6053
LB_6052:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6050
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6050:
	jmp NS_E_4995_MTC_1_failed
LB_6053:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_6055
LB_6054:
	add r14,1
LB_6055:
	cmp r14,r10
	jge LB_6056
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6054
	cmp al,10
	jz LB_6054
	cmp al,32
	jz LB_6054
LB_6056:
	push r10
	call NS_E_4999_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6057
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6058
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6058:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6059
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6059:
	jmp NS_E_4995_MTC_1_failed
LB_6057:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6037
	btr QWORD [rdi],2
LB_6037:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6038
	btr QWORD [rdi],1
LB_6038:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6039
	btr QWORD [rdi],0
LB_6039:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4995_MTC_1_failed:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4997:
NS_E_RDI_4997:
NS_E_4997_ETR_TBL:
NS_E_4997_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_6110
LB_6109:
	add r14,1
LB_6110:
	cmp r14,r10
	jge LB_6111
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6109
	cmp al,10
	jz LB_6109
	cmp al,32
	jz LB_6109
LB_6111:
	add r14,1
	cmp r14,r10
	jg LB_6114
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_6114
	jmp LB_6115
LB_6114:
	jmp NS_E_4997_MTC_0_failed
LB_6115:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_6117
LB_6116:
	add r14,1
LB_6117:
	cmp r14,r10
	jge LB_6118
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6116
	cmp al,10
	jz LB_6116
	cmp al,32
	jz LB_6116
LB_6118:
	push r10
	call NS_E_4995_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6119
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6120
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6120:
	jmp NS_E_4997_MTC_0_failed
LB_6119:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6106
	btr QWORD [rdi],1
LB_6106:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6107
	btr QWORD [rdi],0
LB_6107:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4997_MTC_0_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_4999:
NS_E_RDI_4999:
NS_E_4999_ETR_TBL:
NS_E_4999_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_6133
LB_6132:
	add r14,1
LB_6133:
	cmp r14,r10
	jge LB_6134
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6132
	cmp al,10
	jz LB_6132
	cmp al,32
	jz LB_6132
LB_6134:
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6135
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4999_MTC_0_failed
LB_6135:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	jmp LB_6138
LB_6137:
	add r14,1
LB_6138:
	cmp r14,r10
	jge LB_6139
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6137
	cmp al,10
	jz LB_6137
	cmp al,32
	jz LB_6137
LB_6139:
	add r14,1
	cmp r14,r10
	jg LB_6143
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_6143
	jmp LB_6144
LB_6143:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6141
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6141:
	jmp NS_E_4999_MTC_0_failed
LB_6144:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6129
	btr QWORD [rdi],1
LB_6129:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6130
	btr QWORD [rdi],0
LB_6130:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4999_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst
	jmp LB_6125
LB_6124:
	add r14,1
LB_6125:
	cmp r14,r10
	jge LB_6126
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6124
	cmp al,10
	jz LB_6124
	cmp al,32
	jz LB_6124
LB_6126:
	push r10
	call NS_E_4914_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6127
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_4999_MTC_1_failed
LB_6127:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6122
	btr QWORD [rdi],0
LB_6122:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_4999_MTC_1_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5001:
NS_E_RDI_5001:
NS_E_5001_ETR_TBL:
NS_E_5001_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_6157
LB_6156:
	add r14,1
LB_6157:
	cmp r14,r10
	jge LB_6158
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6156
	cmp al,10
	jz LB_6156
	cmp al,32
	jz LB_6156
LB_6158:
	add r14,1
	cmp r14,r10
	jg LB_6161
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_6161
	jmp LB_6162
LB_6161:
	jmp NS_E_5001_MTC_0_failed
LB_6162:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ reg_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_6167:
	jmp LB_6164
LB_6163:
	add r14,1
LB_6164:
	cmp r14,r10
	jge LB_6165
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6163
	cmp al,10
	jz LB_6163
	cmp al,32
	jz LB_6163
LB_6165:
	push r10
	push rsi
	call NS_E_5001_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6166
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6168
	bts QWORD [rax],0
LB_6168:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6167
LB_6166:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_6170
LB_6169:
	add r14,1
LB_6170:
	cmp r14,r10
	jge LB_6171
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6169
	cmp al,10
	jz LB_6169
	cmp al,32
	jz LB_6169
LB_6171:
	add r14,1
	cmp r14,r10
	jg LB_6176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_6176
	jmp LB_6177
LB_6176:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6173
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6173:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6174
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6174:
	jmp NS_E_5001_MTC_0_failed
LB_6177:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6152
	btr QWORD [rdi],2
LB_6152:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6153
	btr QWORD [rdi],1
LB_6153:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6154
	btr QWORD [rdi],0
LB_6154:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5001_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_6148
LB_6147:
	add r14,1
LB_6148:
	cmp r14,r10
	jge LB_6149
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6147
	cmp al,10
	jz LB_6147
	cmp al,32
	jz LB_6147
LB_6149:
	push r10
	call NS_E_5003_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6150
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5001_MTC_1_failed
LB_6150:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6145
	btr QWORD [rdi],0
LB_6145:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5001_MTC_1_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5003:
NS_E_RDI_5003:
NS_E_5003_ETR_TBL:
NS_E_5003_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_6202
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_6202
	jmp LB_6203
LB_6202:
	jmp NS_E_5003_MTC_0_failed
LB_6203:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6207
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6208
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6208:
	jmp NS_E_5003_MTC_0_failed
LB_6207:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6194
	btr QWORD [rdi],1
LB_6194:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6195
	btr QWORD [rdi],0
LB_6195:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5003_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6192
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5003_MTC_1_failed
LB_6192:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6187
	btr QWORD [rdi],0
LB_6187:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5003_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_6185
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_6185
	jmp LB_6186
LB_6185:
	jmp NS_E_5003_MTC_2_failed
LB_6186:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6178
	btr QWORD [rdi],0
LB_6178:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5003_MTC_2_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5005:
NS_E_RDI_5005:
NS_E_5005_ETR_TBL:
NS_E_5005_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_6215
LB_6214:
	add r14,1
LB_6215:
	cmp r14,r10
	jge LB_6216
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6214
	cmp al,10
	jz LB_6214
	cmp al,32
	jz LB_6214
LB_6216:
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6217
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5005_MTC_0_failed
LB_6217:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_etr_coprd
	jmp LB_6220
LB_6219:
	add r14,1
LB_6220:
	cmp r14,r10
	jge LB_6221
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6219
	cmp al,10
	jz LB_6219
	cmp al,32
	jz LB_6219
LB_6221:
	push r10
	call NS_E_5009_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6222
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6223
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6223:
	jmp NS_E_5005_MTC_0_failed
LB_6222:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ dt_etr_coprd ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_6229:
	jmp LB_6226
LB_6225:
	add r14,1
LB_6226:
	cmp r14,r10
	jge LB_6227
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6225
	cmp al,10
	jz LB_6225
	cmp al,32
	jz LB_6225
LB_6227:
	push r10
	push rsi
	call NS_E_5009_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6228
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6230
	bts QWORD [rax],0
LB_6230:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6229
LB_6228:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6210
	btr QWORD [rdi],2
LB_6210:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6211
	btr QWORD [rdi],1
LB_6211:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6212
	btr QWORD [rdi],0
LB_6212:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5005_MTC_0_failed:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5007:
NS_E_RDI_5007:
NS_E_5007_ETR_TBL:
NS_E_5007_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_6237
LB_6236:
	add r14,1
LB_6237:
	cmp r14,r10
	jge LB_6238
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6236
	cmp al,10
	jz LB_6236
	cmp al,32
	jz LB_6236
LB_6238:
	add r14,1
	cmp r14,r10
	jg LB_6241
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6241
	jmp LB_6242
LB_6241:
	jmp NS_E_5007_MTC_0_failed
LB_6242:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6244
LB_6243:
	add r14,1
LB_6244:
	cmp r14,r10
	jge LB_6245
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6243
	cmp al,10
	jz LB_6243
	cmp al,32
	jz LB_6243
LB_6245:
	add r14,1
	cmp r14,r10
	jg LB_6249
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6249
	jmp LB_6250
LB_6249:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6247
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6247:
	jmp NS_E_5007_MTC_0_failed
LB_6250:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_6252
LB_6251:
	add r14,1
LB_6252:
	cmp r14,r10
	jge LB_6253
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6251
	cmp al,10
	jz LB_6251
	cmp al,32
	jz LB_6251
LB_6253:
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6254
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6255
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6255:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6256
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6256:
	jmp NS_E_5007_MTC_0_failed
LB_6254:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dt_etr_coprd
	jmp LB_6259
LB_6258:
	add r14,1
LB_6259:
	cmp r14,r10
	jge LB_6260
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6258
	cmp al,10
	jz LB_6258
	cmp al,32
	jz LB_6258
LB_6260:
	push r10
	call NS_E_5009_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6261
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6262
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6262:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6263
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6263:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6264
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6264:
	jmp NS_E_5007_MTC_0_failed
LB_6261:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6231
	btr QWORD [rdi],3
LB_6231:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6232
	btr QWORD [rdi],2
LB_6232:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6233
	btr QWORD [rdi],1
LB_6233:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6234
	btr QWORD [rdi],0
LB_6234:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5007_MTC_0_failed:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5009:
NS_E_RDI_5009:
NS_E_5009_ETR_TBL:
NS_E_5009_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_6272
LB_6271:
	add r14,1
LB_6272:
	cmp r14,r10
	jge LB_6273
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6271
	cmp al,10
	jz LB_6271
	cmp al,32
	jz LB_6271
LB_6273:
	add r14,3
	cmp r14,r10
	jg LB_6276
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6276
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6276
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_6276
	jmp LB_6277
LB_6276:
	jmp NS_E_5009_MTC_0_failed
LB_6277:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_6279
LB_6278:
	add r14,1
LB_6279:
	cmp r14,r10
	jge LB_6280
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6278
	cmp al,10
	jz LB_6278
	cmp al,32
	jz LB_6278
LB_6280:
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6281
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6282
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6282:
	jmp NS_E_5009_MTC_0_failed
LB_6281:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_6285
LB_6284:
	add r14,1
LB_6285:
	cmp r14,r10
	jge LB_6286
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6284
	cmp al,10
	jz LB_6284
	cmp al,32
	jz LB_6284
LB_6286:
	add r14,1
	cmp r14,r10
	jg LB_6291
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_6291
	jmp LB_6292
LB_6291:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6288
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6288:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6289
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6289:
	jmp NS_E_5009_MTC_0_failed
LB_6292:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_6294
LB_6293:
	add r14,1
LB_6294:
	cmp r14,r10
	jge LB_6295
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6293
	cmp al,10
	jz LB_6293
	cmp al,32
	jz LB_6293
LB_6295:
	push r10
	call NS_E_5011_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6296
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6297
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6297:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6298
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6298:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6299
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6299:
	jmp NS_E_5009_MTC_0_failed
LB_6296:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6266
	btr QWORD [rdi],3
LB_6266:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6267
	btr QWORD [rdi],2
LB_6267:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6268
	btr QWORD [rdi],1
LB_6268:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6269
	btr QWORD [rdi],0
LB_6269:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5009_MTC_0_failed:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5011:
NS_E_RDI_5011:
NS_E_5011_ETR_TBL:
NS_E_5011_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_6328
LB_6327:
	add r14,1
LB_6328:
	cmp r14,r10
	jge LB_6329
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6327
	cmp al,10
	jz LB_6327
	cmp al,32
	jz LB_6327
LB_6329:
	push r10
	call NS_E_5013_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6330
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5011_MTC_0_failed
LB_6330:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	call LB_6301
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6325
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6325:
NS_E_5011_MTC_0_failed:
	add rsp,16
	pop r14
	jmp LB_6302
LB_6301:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_6313
LB_6312:
	add r14,1
LB_6313:
	cmp r14,r10
	jge LB_6314
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6312
	cmp al,10
	jz LB_6312
	cmp al,32
	jz LB_6312
LB_6314:
	add r14,3
	cmp r14,r10
	jg LB_6317
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6317
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_6317
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_6317
	jmp LB_6318
LB_6317:
	jmp NS_E_6303_MTC_0_failed
LB_6318:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_6320
LB_6319:
	add r14,1
LB_6320:
	cmp r14,r10
	jge LB_6321
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6319
	cmp al,10
	jz LB_6319
	cmp al,32
	jz LB_6319
LB_6321:
	push r10
	call NS_E_5011_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6322
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6323
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6323:
	jmp NS_E_6303_MTC_0_failed
LB_6322:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6307
	btr QWORD [rdi],1
LB_6307:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6308
	btr QWORD [rdi],0
LB_6308:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6310
	btr QWORD [rdi],0
LB_6310:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6303_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6305
	btr QWORD [rdi],0
LB_6305:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6303_MTC_1_failed:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6302:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5013:
NS_E_RDI_5013:
NS_E_5013_ETR_TBL:
NS_E_5013_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_6359
LB_6358:
	add r14,1
LB_6359:
	cmp r14,r10
	jge LB_6360
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6358
	cmp al,10
	jz LB_6358
	cmp al,32
	jz LB_6358
LB_6360:
	push r10
	call NS_E_5015_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6361
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5013_MTC_0_failed
LB_6361:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	call LB_6332
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6356
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6356:
NS_E_5013_MTC_0_failed:
	add rsp,16
	pop r14
	jmp LB_6333
LB_6332:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_6344
LB_6343:
	add r14,1
LB_6344:
	cmp r14,r10
	jge LB_6345
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6343
	cmp al,10
	jz LB_6343
	cmp al,32
	jz LB_6343
LB_6345:
	add r14,3
	cmp r14,r10
	jg LB_6348
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6348
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_6348
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_6348
	jmp LB_6349
LB_6348:
	jmp NS_E_6334_MTC_0_failed
LB_6349:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_6351
LB_6350:
	add r14,1
LB_6351:
	cmp r14,r10
	jge LB_6352
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6350
	cmp al,10
	jz LB_6350
	cmp al,32
	jz LB_6350
LB_6352:
	push r10
	call NS_E_5015_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6353
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6354
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6354:
	jmp NS_E_6334_MTC_0_failed
LB_6353:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6338
	btr QWORD [rdi],1
LB_6338:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6339
	btr QWORD [rdi],0
LB_6339:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6341
	btr QWORD [rdi],0
LB_6341:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6334_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6336
	btr QWORD [rdi],0
LB_6336:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6334_MTC_1_failed:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6333:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5015:
NS_E_RDI_5015:
NS_E_5015_ETR_TBL:
NS_E_5015_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; var
	jmp LB_6373
LB_6372:
	add r14,1
LB_6373:
	cmp r14,r10
	jge LB_6374
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6372
	cmp al,10
	jz LB_6372
	cmp al,32
	jz LB_6372
LB_6374:
	push r10
	call NS_E_5017_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6375
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5015_MTC_0_failed
LB_6375:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6370
	btr QWORD [rdi],0
LB_6370:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5015_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_6366
LB_6365:
	add r14,1
LB_6366:
	cmp r14,r10
	jge LB_6367
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6365
	cmp al,10
	jz LB_6365
	cmp al,32
	jz LB_6365
LB_6367:
	push r10
	call NS_E_4190_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6368
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5015_MTC_1_failed
LB_6368:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6363
	btr QWORD [rdi],0
LB_6363:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5015_MTC_1_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5017:
NS_E_RDI_5017:
NS_E_5017_ETR_TBL:
NS_E_5017_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6383
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5017_MTC_0_failed
LB_6383:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_6391
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_6391
	jmp LB_6392
LB_6391:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6389
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6389:
	jmp NS_E_5017_MTC_0_failed
LB_6392:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6377
	btr QWORD [rdi],1
LB_6377:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6378
	btr QWORD [rdi],0
LB_6378:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5017_MTC_0_failed:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5019:
NS_E_RDI_5019:
NS_E_5019_ETR_TBL:
NS_E_5019_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "@"
	jmp LB_6423
LB_6422:
	add r14,1
LB_6423:
	cmp r14,r10
	jge LB_6424
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6422
	cmp al,10
	jz LB_6422
	cmp al,32
	jz LB_6422
LB_6424:
	add r14,1
	cmp r14,r10
	jg LB_6427
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_6427
	jmp LB_6428
LB_6427:
	jmp NS_E_5019_MTC_0_failed
LB_6428:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_6430
LB_6429:
	add r14,1
LB_6430:
	cmp r14,r10
	jge LB_6431
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6429
	cmp al,10
	jz LB_6429
	cmp al,32
	jz LB_6429
LB_6431:
	add r14,1
	cmp r14,r10
	jg LB_6435
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_6435
	jmp LB_6436
LB_6435:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6433
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6433:
	jmp NS_E_5019_MTC_0_failed
LB_6436:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_6438
LB_6437:
	add r14,1
LB_6438:
	cmp r14,r10
	jge LB_6439
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6437
	cmp al,10
	jz LB_6437
	cmp al,32
	jz LB_6437
LB_6439:
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6440
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6441
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6441:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6442
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6442:
	jmp NS_E_5019_MTC_0_failed
LB_6440:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	call LB_6393
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6418
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6418:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6419
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6419:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6420
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6420:
NS_E_5019_MTC_0_failed:
	add rsp,48
	pop r14
	jmp LB_6394
LB_6393:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_6414
LB_6413:
	add r14,1
LB_6414:
	cmp r14,r10
	jge LB_6415
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6413
	cmp al,10
	jz LB_6413
	cmp al,32
	jz LB_6413
LB_6415:
	push r10
	call NS_E_5021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6416
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6395_MTC_0_failed
LB_6416:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6407
	btr QWORD [rdi],0
LB_6407:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6409
	btr QWORD [rdi],2
LB_6409:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6410
	btr QWORD [rdi],1
LB_6410:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6411
	btr QWORD [rdi],0
LB_6411:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6395_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_6403
LB_6402:
	add r14,1
LB_6403:
	cmp r14,r10
	jge LB_6404
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6402
	cmp al,10
	jz LB_6402
	cmp al,32
	jz LB_6402
LB_6404:
	push r10
	call NS_E_5029_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6405
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6395_MTC_1_failed
LB_6405:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6396
	btr QWORD [rdi],0
LB_6396:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6398
	btr QWORD [rdi],2
LB_6398:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6399
	btr QWORD [rdi],1
LB_6399:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6400
	btr QWORD [rdi],0
LB_6400:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6395_MTC_1_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6394:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5021:
NS_E_RDI_5021:
NS_E_5021_ETR_TBL:
NS_E_5021_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord_end
	jmp LB_6617
LB_6616:
	add r14,1
LB_6617:
	cmp r14,r10
	jge LB_6618
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6616
	cmp al,10
	jz LB_6616
	cmp al,32
	jz LB_6616
LB_6618:
	push r10
	call NS_E_5027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6619
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5021_MTC_0_failed
LB_6619:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_6625:
	jmp LB_6622
LB_6621:
	add r14,1
LB_6622:
	cmp r14,r10
	jge LB_6623
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6621
	cmp al,10
	jz LB_6621
	cmp al,32
	jz LB_6621
LB_6623:
	push r10
	push rsi
	call NS_E_5023_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6624
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6626
	bts QWORD [rax],0
LB_6626:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6625
LB_6624:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	call LB_6444
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6613
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6613:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6614
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6614:
NS_E_5021_MTC_0_failed:
	add rsp,32
	pop r14
	jmp LB_6445
LB_6444:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; ";"
	jmp LB_6483
LB_6482:
	add r14,1
LB_6483:
	cmp r14,r10
	jge LB_6484
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6482
	cmp al,10
	jz LB_6482
	cmp al,32
	jz LB_6482
LB_6484:
	add r14,1
	cmp r14,r10
	jg LB_6487
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_6487
	jmp LB_6488
LB_6487:
	jmp NS_E_6446_MTC_0_failed
LB_6488:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_6490
LB_6489:
	add r14,1
LB_6490:
	cmp r14,r10
	jge LB_6491
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6489
	cmp al,10
	jz LB_6489
	cmp al,32
	jz LB_6489
LB_6491:
	add r14,3
	cmp r14,r10
	jg LB_6495
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6495
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6495
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6495
	jmp LB_6496
LB_6495:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6493
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6493:
	jmp NS_E_6446_MTC_0_failed
LB_6496:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_6498
LB_6497:
	add r14,1
LB_6498:
	cmp r14,r10
	jge LB_6499
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6497
	cmp al,10
	jz LB_6497
	cmp al,32
	jz LB_6497
LB_6499:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6500
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6501
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6501:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6502
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6502:
	jmp NS_E_6446_MTC_0_failed
LB_6500:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_6505
LB_6504:
	add r14,1
LB_6505:
	cmp r14,r10
	jge LB_6506
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6504
	cmp al,10
	jz LB_6504
	cmp al,32
	jz LB_6504
LB_6506:
	push r10
	call NS_E_5021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6507
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6508
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6508:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6509
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6509:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6510
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6510:
	jmp NS_E_6446_MTC_0_failed
LB_6507:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6474
	btr QWORD [rdi],3
LB_6474:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6475
	btr QWORD [rdi],2
LB_6475:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6476
	btr QWORD [rdi],1
LB_6476:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6477
	btr QWORD [rdi],0
LB_6477:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6479
	btr QWORD [rdi],1
LB_6479:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6480
	btr QWORD [rdi],0
LB_6480:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6446_MTC_0_failed:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_6455
LB_6454:
	add r14,1
LB_6455:
	cmp r14,r10
	jge LB_6456
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6454
	cmp al,10
	jz LB_6454
	cmp al,32
	jz LB_6454
LB_6456:
	add r14,3
	cmp r14,r10
	jg LB_6459
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6459
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6459
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6459
	jmp LB_6460
LB_6459:
	jmp NS_E_6446_MTC_1_failed
LB_6460:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_6462
LB_6461:
	add r14,1
LB_6462:
	cmp r14,r10
	jge LB_6463
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6461
	cmp al,10
	jz LB_6461
	cmp al,32
	jz LB_6461
LB_6463:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6464
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6465
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6465:
	jmp NS_E_6446_MTC_1_failed
LB_6464:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_6468
LB_6467:
	add r14,1
LB_6468:
	cmp r14,r10
	jge LB_6469
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6467
	cmp al,10
	jz LB_6467
	cmp al,32
	jz LB_6467
LB_6469:
	push r10
	call NS_E_4977_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6470
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6471
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6471:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6472
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6472:
	jmp NS_E_6446_MTC_1_failed
LB_6470:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6447
	btr QWORD [rdi],2
LB_6447:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6448
	btr QWORD [rdi],1
LB_6448:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6449
	btr QWORD [rdi],0
LB_6449:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6451
	btr QWORD [rdi],1
LB_6451:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6452
	btr QWORD [rdi],0
LB_6452:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6446_MTC_1_failed:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6445:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord
	jmp LB_6603
LB_6602:
	add r14,1
LB_6603:
	cmp r14,r10
	jge LB_6604
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6602
	cmp al,10
	jz LB_6602
	cmp al,32
	jz LB_6602
LB_6604:
	push r10
	call NS_E_5025_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6605
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5021_MTC_1_failed
LB_6605:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_6611:
	jmp LB_6608
LB_6607:
	add r14,1
LB_6608:
	cmp r14,r10
	jge LB_6609
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6607
	cmp al,10
	jz LB_6607
	cmp al,32
	jz LB_6607
LB_6609:
	push r10
	push rsi
	call NS_E_5023_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6610
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6612
	bts QWORD [rax],0
LB_6612:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6611
LB_6610:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	call LB_6512
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6599
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6599:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6600
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6600:
NS_E_5021_MTC_1_failed:
	add rsp,32
	pop r14
	jmp LB_6513
LB_6512:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; ";"
	jmp LB_6561
LB_6560:
	add r14,1
LB_6561:
	cmp r14,r10
	jge LB_6562
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6560
	cmp al,10
	jz LB_6560
	cmp al,32
	jz LB_6560
LB_6562:
	add r14,1
	cmp r14,r10
	jg LB_6565
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_6565
	jmp LB_6566
LB_6565:
	jmp NS_E_6514_MTC_0_failed
LB_6566:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_6568
LB_6567:
	add r14,1
LB_6568:
	cmp r14,r10
	jge LB_6569
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6567
	cmp al,10
	jz LB_6567
	cmp al,32
	jz LB_6567
LB_6569:
	add r14,3
	cmp r14,r10
	jg LB_6573
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6573
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6573
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6573
	jmp LB_6574
LB_6573:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6571
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6571:
	jmp NS_E_6514_MTC_0_failed
LB_6574:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_6576
LB_6575:
	add r14,1
LB_6576:
	cmp r14,r10
	jge LB_6577
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6575
	cmp al,10
	jz LB_6575
	cmp al,32
	jz LB_6575
LB_6577:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6578
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6579
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6579:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6580
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6580:
	jmp NS_E_6514_MTC_0_failed
LB_6578:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_6583
LB_6582:
	add r14,1
LB_6583:
	cmp r14,r10
	jge LB_6584
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6582
	cmp al,10
	jz LB_6582
	cmp al,32
	jz LB_6582
LB_6584:
	push r10
	call NS_E_5021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6585
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6586
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6586:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6587
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6587:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6588
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6588:
	jmp NS_E_6514_MTC_0_failed
LB_6585:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_6591
LB_6590:
	add r14,1
LB_6591:
	cmp r14,r10
	jge LB_6592
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6590
	cmp al,10
	jz LB_6590
	cmp al,32
	jz LB_6590
LB_6592:
	push r10
	call NS_E_5021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6593
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_6594
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_6594:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6595
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6595:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6596
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6596:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6597
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6597:
	jmp NS_E_6514_MTC_0_failed
LB_6593:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_6551
	btr QWORD [rdi],4
LB_6551:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6552
	btr QWORD [rdi],3
LB_6552:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6553
	btr QWORD [rdi],2
LB_6553:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6554
	btr QWORD [rdi],1
LB_6554:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6555
	btr QWORD [rdi],0
LB_6555:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6557
	btr QWORD [rdi],1
LB_6557:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6558
	btr QWORD [rdi],0
LB_6558:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6514_MTC_0_failed:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\138\162"
	jmp LB_6524
LB_6523:
	add r14,1
LB_6524:
	cmp r14,r10
	jge LB_6525
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6523
	cmp al,10
	jz LB_6523
	cmp al,32
	jz LB_6523
LB_6525:
	add r14,3
	cmp r14,r10
	jg LB_6528
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6528
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_6528
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_6528
	jmp LB_6529
LB_6528:
	jmp NS_E_6514_MTC_1_failed
LB_6529:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_6531
LB_6530:
	add r14,1
LB_6531:
	cmp r14,r10
	jge LB_6532
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6530
	cmp al,10
	jz LB_6530
	cmp al,32
	jz LB_6530
LB_6532:
	push r10
	call NS_E_5001_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6533
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6534
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6534:
	jmp NS_E_6514_MTC_1_failed
LB_6533:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_6537
LB_6536:
	add r14,1
LB_6537:
	cmp r14,r10
	jge LB_6538
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6536
	cmp al,10
	jz LB_6536
	cmp al,32
	jz LB_6536
LB_6538:
	push r10
	call NS_E_4977_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6539
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6540
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6540:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6541
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6541:
	jmp NS_E_6514_MTC_1_failed
LB_6539:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_6544
LB_6543:
	add r14,1
LB_6544:
	cmp r14,r10
	jge LB_6545
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6543
	cmp al,10
	jz LB_6543
	cmp al,32
	jz LB_6543
LB_6545:
	push r10
	call NS_E_5021_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6546
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6547
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6547:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6548
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6548:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6549
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6549:
	jmp NS_E_6514_MTC_1_failed
LB_6546:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_6515
	btr QWORD [rdi],3
LB_6515:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6516
	btr QWORD [rdi],2
LB_6516:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6517
	btr QWORD [rdi],1
LB_6517:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6518
	btr QWORD [rdi],0
LB_6518:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6520
	btr QWORD [rdi],1
LB_6520:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6521
	btr QWORD [rdi],0
LB_6521:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6514_MTC_1_failed:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6513:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5023:
NS_E_RDI_5023:
NS_E_5023_ETR_TBL:
NS_E_5023_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_6646
LB_6645:
	add r14,1
LB_6646:
	cmp r14,r10
	jge LB_6647
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6645
	cmp al,10
	jz LB_6645
	cmp al,32
	jz LB_6645
LB_6647:
	add r14,3
	cmp r14,r10
	jg LB_6650
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6650
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_6650
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_6650
	jmp LB_6651
LB_6650:
	jmp NS_E_5023_MTC_0_failed
LB_6651:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn
	jmp LB_6653
LB_6652:
	add r14,1
LB_6653:
	cmp r14,r10
	jge LB_6654
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6652
	cmp al,10
	jz LB_6652
	cmp al,32
	jz LB_6652
LB_6654:
	push r10
	call NS_E_5023_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6655
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6656
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6656:
	jmp NS_E_5023_MTC_0_failed
LB_6655:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_6659
LB_6658:
	add r14,1
LB_6659:
	cmp r14,r10
	jge LB_6660
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6658
	cmp al,10
	jz LB_6658
	cmp al,32
	jz LB_6658
LB_6660:
	add r14,3
	cmp r14,r10
	jg LB_6665
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6665
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_6665
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_6665
	jmp LB_6666
LB_6665:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6662
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6662:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6663
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6663:
	jmp NS_E_5023_MTC_0_failed
LB_6666:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6641
	btr QWORD [rdi],2
LB_6641:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6642
	btr QWORD [rdi],1
LB_6642:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6643
	btr QWORD [rdi],0
LB_6643:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5023_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_6637
LB_6636:
	add r14,1
LB_6637:
	cmp r14,r10
	jge LB_6638
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6636
	cmp al,10
	jz LB_6636
	cmp al,32
	jz LB_6636
LB_6638:
	push r10
	call NS_E_3713_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6639
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5023_MTC_1_failed
LB_6639:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6634
	btr QWORD [rdi],0
LB_6634:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5023_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_6630
LB_6629:
	add r14,1
LB_6630:
	cmp r14,r10
	jge LB_6631
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6629
	cmp al,10
	jz LB_6629
	cmp al,32
	jz LB_6629
LB_6631:
	push r10
	call NS_E_4879_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6632
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5023_MTC_2_failed
LB_6632:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6627
	btr QWORD [rdi],0
LB_6627:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5023_MTC_2_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5025:
NS_E_RDI_5025:
NS_E_5025_ETR_TBL:
NS_E_5025_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_6688
LB_6687:
	add r14,1
LB_6688:
	cmp r14,r10
	jge LB_6689
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6687
	cmp al,10
	jz LB_6687
	cmp al,32
	jz LB_6687
LB_6689:
	add r14,4
	cmp r14,r10
	jg LB_6692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_6692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_6692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_6692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_6692
	jmp LB_6693
LB_6692:
	jmp NS_E_5025_MTC_0_failed
LB_6693:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6685
	btr QWORD [rdi],0
LB_6685:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5025_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_6679
LB_6678:
	add r14,1
LB_6679:
	cmp r14,r10
	jge LB_6680
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6678
	cmp al,10
	jz LB_6678
	cmp al,32
	jz LB_6678
LB_6680:
	add r14,4
	cmp r14,r10
	jg LB_6683
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_6683
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_6683
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_6683
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_6683
	jmp LB_6684
LB_6683:
	jmp NS_E_5025_MTC_1_failed
LB_6684:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6676
	btr QWORD [rdi],0
LB_6676:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5025_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_6670
LB_6669:
	add r14,1
LB_6670:
	cmp r14,r10
	jge LB_6671
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6669
	cmp al,10
	jz LB_6669
	cmp al,32
	jz LB_6669
LB_6671:
	add r14,3
	cmp r14,r10
	jg LB_6674
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_6674
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_6674
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_6674
	jmp LB_6675
LB_6674:
	jmp NS_E_5025_MTC_2_failed
LB_6675:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6667
	btr QWORD [rdi],0
LB_6667:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5025_MTC_2_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5027:
NS_E_RDI_5027:
NS_E_5027_ETR_TBL:
NS_E_5027_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_6715
LB_6714:
	add r14,1
LB_6715:
	cmp r14,r10
	jge LB_6716
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6714
	cmp al,10
	jz LB_6714
	cmp al,32
	jz LB_6714
LB_6716:
	add r14,5
	cmp r14,r10
	jg LB_6719
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_6719
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_6719
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_6719
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_6719
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_6719
	jmp LB_6720
LB_6719:
	jmp NS_E_5027_MTC_0_failed
LB_6720:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6712
	btr QWORD [rdi],0
LB_6712:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5027_MTC_0_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_6706
LB_6705:
	add r14,1
LB_6706:
	cmp r14,r10
	jge LB_6707
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6705
	cmp al,10
	jz LB_6705
	cmp al,32
	jz LB_6705
LB_6707:
	add r14,5
	cmp r14,r10
	jg LB_6710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_6710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_6710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_6710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_6710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_6710
	jmp LB_6711
LB_6710:
	jmp NS_E_5027_MTC_1_failed
LB_6711:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6703
	btr QWORD [rdi],0
LB_6703:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5027_MTC_1_failed:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_6697
LB_6696:
	add r14,1
LB_6697:
	cmp r14,r10
	jge LB_6698
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6696
	cmp al,10
	jz LB_6696
	cmp al,32
	jz LB_6696
LB_6698:
	add r14,4
	cmp r14,r10
	jg LB_6701
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_6701
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_6701
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_6701
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_6701
	jmp LB_6702
LB_6701:
	jmp NS_E_5027_MTC_2_failed
LB_6702:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6694
	btr QWORD [rdi],0
LB_6694:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5027_MTC_2_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5029:
NS_E_RDI_5029:
NS_E_5029_ETR_TBL:
NS_E_5029_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_6817
LB_6816:
	add r14,1
LB_6817:
	cmp r14,r10
	jge LB_6818
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6816
	cmp al,10
	jz LB_6816
	cmp al,32
	jz LB_6816
LB_6818:
	push r10
	call NS_E_5027_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6819
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5029_MTC_0_failed
LB_6819:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_6822
LB_6821:
	add r14,1
LB_6822:
	cmp r14,r10
	jge LB_6823
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6821
	cmp al,10
	jz LB_6821
	cmp al,32
	jz LB_6821
LB_6823:
	push r10
	call NS_E_5031_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6824
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6825
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6825:
	jmp NS_E_5029_MTC_0_failed
LB_6824:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_6831:
	jmp LB_6828
LB_6827:
	add r14,1
LB_6828:
	cmp r14,r10
	jge LB_6829
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6827
	cmp al,10
	jz LB_6827
	cmp al,32
	jz LB_6827
LB_6829:
	push r10
	push rsi
	call NS_E_5023_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6830
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6832
	bts QWORD [rax],0
LB_6832:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6831
LB_6830:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	call LB_6721
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6812
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6812:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6813
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6813:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6814
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6814:
NS_E_5029_MTC_0_failed:
	add rsp,48
	pop r14
	jmp LB_6722
LB_6721:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_6737
LB_6736:
	add r14,1
LB_6737:
	cmp r14,r10
	jge LB_6738
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6736
	cmp al,10
	jz LB_6736
	cmp al,32
	jz LB_6736
LB_6738:
	add r14,1
	cmp r14,r10
	jg LB_6741
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_6741
	jmp LB_6742
LB_6741:
	jmp NS_E_6723_MTC_0_failed
LB_6742:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_6744
LB_6743:
	add r14,1
LB_6744:
	cmp r14,r10
	jge LB_6745
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6743
	cmp al,10
	jz LB_6743
	cmp al,32
	jz LB_6743
LB_6745:
	push r10
	call NS_E_5029_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6746
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6747
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6747:
	jmp NS_E_6723_MTC_0_failed
LB_6746:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6729
	btr QWORD [rdi],1
LB_6729:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6730
	btr QWORD [rdi],0
LB_6730:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6732
	btr QWORD [rdi],2
LB_6732:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6733
	btr QWORD [rdi],1
LB_6733:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6734
	btr QWORD [rdi],0
LB_6734:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6723_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6725
	btr QWORD [rdi],2
LB_6725:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6726
	btr QWORD [rdi],1
LB_6726:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6727
	btr QWORD [rdi],0
LB_6727:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6723_MTC_1_failed:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6722:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord
	jmp LB_6796
LB_6795:
	add r14,1
LB_6796:
	cmp r14,r10
	jge LB_6797
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6795
	cmp al,10
	jz LB_6795
	cmp al,32
	jz LB_6795
LB_6797:
	push r10
	call NS_E_5025_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6798
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5029_MTC_1_failed
LB_6798:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_6801
LB_6800:
	add r14,1
LB_6801:
	cmp r14,r10
	jge LB_6802
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6800
	cmp al,10
	jz LB_6800
	cmp al,32
	jz LB_6800
LB_6802:
	push r10
	call NS_E_5031_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6803
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6804
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6804:
	jmp NS_E_5029_MTC_1_failed
LB_6803:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_6810:
	jmp LB_6807
LB_6806:
	add r14,1
LB_6807:
	cmp r14,r10
	jge LB_6808
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6806
	cmp al,10
	jz LB_6806
	cmp al,32
	jz LB_6806
LB_6808:
	push r10
	push rsi
	call NS_E_5023_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_6809
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_6811
	bts QWORD [rax],0
LB_6811:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_6810
LB_6809:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	call LB_6749
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_6791
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_6791:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6792
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6792:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6793
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6793:
NS_E_5029_MTC_1_failed:
	add rsp,48
	pop r14
	jmp LB_6750
LB_6749:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ";"
	jmp LB_6772
LB_6771:
	add r14,1
LB_6772:
	cmp r14,r10
	jge LB_6773
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6771
	cmp al,10
	jz LB_6771
	cmp al,32
	jz LB_6771
LB_6773:
	add r14,1
	cmp r14,r10
	jg LB_6776
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_6776
	jmp LB_6777
LB_6776:
	jmp NS_E_6751_MTC_0_failed
LB_6777:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_6779
LB_6778:
	add r14,1
LB_6779:
	cmp r14,r10
	jge LB_6780
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6778
	cmp al,10
	jz LB_6778
	cmp al,32
	jz LB_6778
LB_6780:
	push r10
	call NS_E_5029_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6781
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6782
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6782:
	jmp NS_E_6751_MTC_0_failed
LB_6781:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_cnc
	jmp LB_6785
LB_6784:
	add r14,1
LB_6785:
	cmp r14,r10
	jge LB_6786
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6784
	cmp al,10
	jz LB_6784
	cmp al,32
	jz LB_6784
LB_6786:
	push r10
	call NS_E_5029_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6787
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_6788
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_6788:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6789
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6789:
	jmp NS_E_6751_MTC_0_failed
LB_6787:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6763
	btr QWORD [rdi],2
LB_6763:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6764
	btr QWORD [rdi],1
LB_6764:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6765
	btr QWORD [rdi],0
LB_6765:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6767
	btr QWORD [rdi],2
LB_6767:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6768
	btr QWORD [rdi],1
LB_6768:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6769
	btr QWORD [rdi],0
LB_6769:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6751_MTC_0_failed:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_6759
LB_6758:
	add r14,1
LB_6759:
	cmp r14,r10
	jge LB_6760
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6758
	cmp al,10
	jz LB_6758
	cmp al,32
	jz LB_6758
LB_6760:
	push r10
	call NS_E_5029_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6761
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_6751_MTC_1_failed
LB_6761:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6752
	btr QWORD [rdi],0
LB_6752:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	add rsp,8
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_6754
	btr QWORD [rdi],2
LB_6754:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6755
	btr QWORD [rdi],1
LB_6755:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6756
	btr QWORD [rdi],0
LB_6756:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_6751_MTC_1_failed:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_6750:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_5031:
NS_E_RDI_5031:
NS_E_5031_ETR_TBL:
NS_E_5031_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_6838
LB_6837:
	add r14,1
LB_6838:
	cmp r14,r10
	jge LB_6839
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6837
	cmp al,10
	jz LB_6837
	cmp al,32
	jz LB_6837
LB_6839:
	push r10
	call NS_E_4067_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_6840
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_5031_MTC_0_failed
LB_6840:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_6843
LB_6842:
	add r14,1
LB_6843:
	cmp r14,r10
	jge LB_6844
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_6842
	cmp al,10
	jz LB_6842
	cmp al,32
	jz LB_6842
LB_6844:
	add r14,1
	cmp r14,r10
	jg LB_6848
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_6848
	jmp LB_6849
LB_6848:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_6846
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_6846:
	jmp NS_E_5031_MTC_0_failed
LB_6849:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_6834
	btr QWORD [rdi],1
LB_6834:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_6835
	btr QWORD [rdi],0
LB_6835:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5031_MTC_0_failed:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_5031_MTC_1_failed:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_6871:
NS_E_RDI_6871:
; » _^ ..
	mov rax,102
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 m0 \n"
	mov rsi,0x_20_30_6d_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; " \194\167\194\167 m1 = m2 \n"
	mov rsi,0x_31_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_6d
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_32
	mov BYTE [rdi+8*1+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+6],sil
	add rdi,15
; " \194\167 f0 = f1 \n"
	mov rsi,0x_3d_20_30_66_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_31
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+4],sil
	add rdi,13
; " \194\167\194\167 m3 \n"
	mov rsi,0x_33_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \226\136\142\226\136\142 \n"
	mov rsi,0x_20_8e_88_e2_8e_88_e2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; "\226\136\142\226\136\142\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\194\167\194\167 In0 \n"
	mov rsi,0x_30_6e_49_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \194\167 C1 \194\171 \n"
	mov rsi,0x_c2_20_31_43_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_ab
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; "\t\t\226\136\142 {} \n"
	mov rsi,0x_7d_7b_20_8e_88_e2_09_09
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "\226\136\142\226\136\142 \n"
	mov rsi,0x_0a_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_6851 : %_6851
 ; {>  %_6850~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_6851
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f4967 { %_6850 %_6851 } ⊢ { %_6852 %_6853 %_6854 } : { %_6852 %_6853 %_6854 }
 ; {>  %_6850~0':_stg %_6851~1':_r64 }
; _f4967 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_4967
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_6872
	btr r12,4
	jmp LB_6873
LB_6872:
	bts r12,4
LB_6873:
	mov r8,r9
	bt r12,3
	jc LB_6876
	btr r12,2
	jmp LB_6877
LB_6876:
	bts r12,2
LB_6877:
	mov rsi,1
	bt r12,2
	jc LB_6874
	mov rsi,0
	bt r8,0
	jc LB_6874
	jmp LB_6875
LB_6874:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_6875:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f21 { %_6852 %_6853 %_6854 } ⊢ { %_6855 %_6856 %_6857 } : { %_6855 %_6856 %_6857 }
 ; {>  %_6853~1':_r64 %_6854~2':(_opn)◂(_p4966) %_6852~0':_stg }
; _f21 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_6878
	btr r12,3
	jmp LB_6879
LB_6878:
	bts r12,3
LB_6879:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_6882
	btr r12,4
	jmp LB_6883
LB_6882:
	bts r12,4
LB_6883:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_6880
	btr QWORD [rdi],0
	jmp LB_6881
LB_6880:
	bts QWORD [rdi],0
LB_6881:
	mov r10,r14
	bt r12,1
	jc LB_6886
	btr r12,4
	jmp LB_6887
LB_6886:
	bts r12,4
LB_6887:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_6884
	btr QWORD [rdi],1
	jmp LB_6885
LB_6884:
	bts QWORD [rdi],1
LB_6885:
	mov r10,r8
	bt r12,2
	jc LB_6890
	btr r12,4
	jmp LB_6891
LB_6890:
	bts r12,4
LB_6891:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_6888
	btr QWORD [rdi],2
	jmp LB_6889
LB_6888:
	bts QWORD [rdi],2
LB_6889:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_6892
	btr r12,3
	jmp LB_6893
LB_6892:
	bts r12,3
LB_6893:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_6896
	btr r12,4
	jmp LB_6897
LB_6896:
	bts r12,4
LB_6897:
	mov r13,r10
	bt r12,4
	jc LB_6894
	btr r12,0
	jmp LB_6895
LB_6894:
	bts r12,0
LB_6895:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_6900
	btr r12,4
	jmp LB_6901
LB_6900:
	bts r12,4
LB_6901:
	mov r14,r10
	bt r12,4
	jc LB_6898
	btr r12,1
	jmp LB_6899
LB_6898:
	bts r12,1
LB_6899:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_6904
	btr r12,4
	jmp LB_6905
LB_6904:
	bts r12,4
LB_6905:
	mov r8,r10
	bt r12,4
	jc LB_6902
	btr r12,2
	jmp LB_6903
LB_6902:
	bts r12,2
LB_6903:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; 	» "OpADL.mdls" _ ⊢ 3' : %_6858
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r9,rdi
	btr r12,3
; _f20 %_6858 ⊢ { %_6859 %_6860 } : { %_6859 %_6860 }
 ; {>  %_6858~3':_stg %_6857~2':(_opn)◂(_p4966) %_6856~1':_r64 %_6855~0':_stg }
; _f20 3' ⊢ { 3' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_6912
	btr r12,0
	jmp LB_6913
LB_6912:
	bts r12,0
LB_6913:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 3' 4' }
	mov r9,r13
	bt r12,0
	jc LB_6914
	btr r12,3
	jmp LB_6915
LB_6914:
	bts r12,3
LB_6915:
	mov r10,r14
	bt r12,1
	jc LB_6916
	btr r12,4
	jmp LB_6917
LB_6916:
	bts r12,4
LB_6917:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_6910
	btr r12,2
	jmp LB_6911
LB_6910:
	bts r12,2
LB_6911:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_6908
	btr r12,1
	jmp LB_6909
LB_6908:
	bts r12,1
LB_6909:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_6906
	btr r12,0
	jmp LB_6907
LB_6906:
	bts r12,0
LB_6907:
	add rsp,32
; _f4791 %_6860 ⊢ { %_6861 %_6862 } : { %_6861 %_6862 }
 ; {>  %_6859~3':_stg %_6857~2':(_opn)◂(_p4966) %_6860~4':_stg %_6856~1':_r64 %_6855~0':_stg }
; _f4791 4' ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_6926
	btr r12,0
	jmp LB_6927
LB_6926:
	bts r12,0
LB_6927:
	call NS_E_4791
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_6928
	btr r12,4
	jmp LB_6929
LB_6928:
	bts r12,4
LB_6929:
	mov r11,r14
	bt r12,1
	jc LB_6930
	btr r12,5
	jmp LB_6931
LB_6930:
	bts r12,5
LB_6931:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_6924
	btr r12,3
	jmp LB_6925
LB_6924:
	bts r12,3
LB_6925:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_6922
	btr r12,2
	jmp LB_6923
LB_6922:
	bts r12,2
LB_6923:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_6920
	btr r12,1
	jmp LB_6921
LB_6920:
	bts r12,1
LB_6921:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_6918
	btr r12,0
	jmp LB_6919
LB_6918:
	bts r12,0
LB_6919:
	add rsp,40
MTC_LB_6932:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_6933
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °0◂6'
; 5' ⊢ °0◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_6934
	bt QWORD [rax],0
	jc LB_6935
	btr r12,7
	jmp LB_6936
LB_6935:
	bts r12,7
LB_6936:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_6934:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_6937
	btr r12,6
	jmp LB_6938
LB_6937:
	bts r12,6
LB_6938:
LB_6939:
	cmp r15,0
	jz LB_6940
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_6939
LB_6940:
; » 0xr0 |~ {  } ⊢ %_6864 : %_6864
 ; {>  %_6859~3':_stg %_6863~6':_stg %_6857~2':(_opn)◂(_p4966) %_6861~4':_stg %_6856~1':_r64 %_6855~0':_stg }
; 	» 0xr0 _ ⊢ 5' : %_6864
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f4967 { %_6863 %_6864 } ⊢ { %_6865 %_6866 %_6867 } : { %_6865 %_6866 %_6867 }
 ; {>  %_6859~3':_stg %_6863~6':_stg %_6857~2':(_opn)◂(_p4966) %_6861~4':_stg %_6864~5':_r64 %_6856~1':_r64 %_6855~0':_stg }
; _f4967 { 6' 5' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000110.. |},{ 6' 5' } ⊢ { 0' 1' }
	mov r13,rcx
	bt r12,6
	jc LB_6951
	btr r12,0
	jmp LB_6952
LB_6951:
	bts r12,0
LB_6952:
	mov r14,r11
	bt r12,5
	jc LB_6953
	btr r12,1
	jmp LB_6954
LB_6953:
	bts r12,1
LB_6954:
	call NS_E_4967
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_6955
	btr r12,5
	jmp LB_6956
LB_6955:
	bts r12,5
LB_6956:
	mov rcx,r14
	bt r12,1
	jc LB_6957
	btr r12,6
	jmp LB_6958
LB_6957:
	bts r12,6
LB_6958:
	mov rdx,r9
	bt r12,3
	jc LB_6961
	btr r12,7
	jmp LB_6962
LB_6961:
	bts r12,7
LB_6962:
	mov rsi,1
	bt r12,7
	jc LB_6959
	mov rsi,0
	bt rdx,0
	jc LB_6959
	jmp LB_6960
LB_6959:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],rdx
	mov rdx,rax
	btr r12,7
LB_6960:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_6949
	btr r12,4
	jmp LB_6950
LB_6949:
	bts r12,4
LB_6950:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_6947
	btr r12,3
	jmp LB_6948
LB_6947:
	bts r12,3
LB_6948:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_6945
	btr r12,2
	jmp LB_6946
LB_6945:
	bts r12,2
LB_6946:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_6943
	btr r12,1
	jmp LB_6944
LB_6943:
	bts r12,1
LB_6944:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_6941
	btr r12,0
	jmp LB_6942
LB_6941:
	bts r12,0
LB_6942:
	add rsp,48
; _f21 { %_6865 %_6866 %_6867 } ⊢ { %_6868 %_6869 %_6870 } : { %_6868 %_6869 %_6870 }
 ; {>  %_6859~3':_stg %_6865~5':_stg %_6867~7':(_opn)◂(_p4966) %_6857~2':(_opn)◂(_p4966) %_6861~4':_stg %_6866~6':_r64 %_6856~1':_r64 %_6855~0':_stg }
; _f21 { 5' 6' 7' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000001110.. |},{ 5' 6' 7' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_6975
	btr r12,1
	jmp LB_6976
LB_6975:
	bts r12,1
LB_6976:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_6973
	btr QWORD [rdi],0
	jmp LB_6974
LB_6973:
	bts QWORD [rdi],0
LB_6974:
	mov r14,rcx
	bt r12,6
	jc LB_6979
	btr r12,1
	jmp LB_6980
LB_6979:
	bts r12,1
LB_6980:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_6977
	btr QWORD [rdi],1
	jmp LB_6978
LB_6977:
	bts QWORD [rdi],1
LB_6978:
	mov r14,rdx
	bt r12,7
	jc LB_6983
	btr r12,1
	jmp LB_6984
LB_6983:
	bts r12,1
LB_6984:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_6981
	btr QWORD [rdi],2
	jmp LB_6982
LB_6981:
	bts QWORD [rdi],2
LB_6982:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 5' 6' 7' }
; 0' ⊢ { 5' 6' 7' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_6987
	btr r12,1
	jmp LB_6988
LB_6987:
	bts r12,1
LB_6988:
	mov r11,r14
	bt r12,1
	jc LB_6985
	btr r12,5
	jmp LB_6986
LB_6985:
	bts r12,5
LB_6986:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_6991
	btr r12,1
	jmp LB_6992
LB_6991:
	bts r12,1
LB_6992:
	mov rcx,r14
	bt r12,1
	jc LB_6989
	btr r12,6
	jmp LB_6990
LB_6989:
	bts r12,6
LB_6990:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_6995
	btr r12,1
	jmp LB_6996
LB_6995:
	bts r12,1
LB_6996:
	mov rdx,r14
	bt r12,1
	jc LB_6993
	btr r12,7
	jmp LB_6994
LB_6993:
	bts r12,7
LB_6994:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_6971
	btr r12,4
	jmp LB_6972
LB_6971:
	bts r12,4
LB_6972:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_6969
	btr r12,3
	jmp LB_6970
LB_6969:
	bts r12,3
LB_6970:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_6967
	btr r12,2
	jmp LB_6968
LB_6967:
	bts r12,2
LB_6968:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_6965
	btr r12,1
	jmp LB_6966
LB_6965:
	bts r12,1
LB_6966:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_6963
	btr r12,0
	jmp LB_6964
LB_6963:
	bts r12,0
LB_6964:
	add rsp,48
; ∎ {  }
 ; {>  %_6859~3':_stg %_6868~5':_stg %_6857~2':(_opn)◂(_p4966) %_6861~4':_stg %_6870~7':(_opn)◂(_p4966) %_6869~6':_r64 %_6856~1':_r64 %_6855~0':_stg }
; 	∎ {  }
	bt r12,3
	jc LB_6997
	mov rdi,r9
	call dlt
LB_6997:
	bt r12,5
	jc LB_6998
	mov rdi,r11
	call dlt
LB_6998:
	bt r12,2
	jc LB_6999
	mov rdi,r8
	call dlt
LB_6999:
	bt r12,4
	jc LB_7000
	mov rdi,r10
	call dlt
LB_7000:
	bt r12,7
	jc LB_7001
	mov rdi,rdx
	call dlt
LB_7001:
	bt r12,6
	jc LB_7002
	mov rdi,rcx
	call dlt
LB_7002:
	bt r12,1
	jc LB_7003
	mov rdi,r14
	call dlt
LB_7003:
	bt r12,0
	jc LB_7004
	mov rdi,r13
	call dlt
LB_7004:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_6933:
	mov r15,0
LB_7006:
	cmp r15,0
	jz LB_7007
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_7006
LB_7007:
; ∎ {  }
 ; {>  %_6859~3':_stg %_6857~2':(_opn)◂(_p4966) %_6861~4':_stg %_6862~5':(_opn)◂(_stg) %_6856~1':_r64 %_6855~0':_stg }
; 	∎ {  }
	bt r12,3
	jc LB_7008
	mov rdi,r9
	call dlt
LB_7008:
	bt r12,2
	jc LB_7009
	mov rdi,r8
	call dlt
LB_7009:
	bt r12,4
	jc LB_7010
	mov rdi,r10
	call dlt
LB_7010:
	bt r12,5
	jc LB_7011
	mov rdi,r11
	call dlt
LB_7011:
	bt r12,1
	jc LB_7012
	mov rdi,r14
	call dlt
LB_7012:
	bt r12,0
	jc LB_7013
	mov rdi,r13
	call dlt
LB_7013:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_7005:
section .data
	NS_E_DYN_3640:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3640
	NS_E_DYN_3643:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3643
	NS_E_DYN_3644:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3644
	NS_E_DYN_3645:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3645
	NS_E_DYN_3646:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3646
	NS_E_DYN_3660:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3660
	NS_E_DYN_3703:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3703
	NS_E_DYN_3713:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3713
	NS_E_DYN_3714:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3714
	NS_E_DYN_3715:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3715
	NS_E_DYN_3924:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3924
	NS_E_DYN_3962:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_3962
	NS_E_DYN_4000:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4000
	NS_E_DYN_4038:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4038
	NS_E_DYN_4067:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4067
	NS_E_DYN_4068:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4068
	NS_E_DYN_4069:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4069
	NS_E_DYN_4190:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4190
	NS_E_DYN_4246:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4247:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4249:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4250:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4252:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_4253:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_4254:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4254
	NS_E_DYN_4255:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4255
	NS_E_DYN_4256:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4256
	NS_E_DYN_4690:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4690
	NS_E_DYN_4791:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_4791
	CST_DYN_4855:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_6871:
		dq 0x0000_0001_00_82_ffff
		dq 1
