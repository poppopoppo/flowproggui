%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_2799
	call exec_out
	jmp _end
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	push r14
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
	pop r14
	ret
NS_E_2728:
NS_E_RDI_2728:
NS_E_2728_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_2729
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_2729:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2731:
NS_E_RDI_2731:
NS_E_2731_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_2731_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_2731_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2732:
NS_E_RDI_2732:
NS_E_2732_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_2732_LB_0
	cmp r11,57
	ja NS_E_2732_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2732_LB_0:
	mov rax,0
	ret
NS_E_2734:
NS_E_RDI_2734:
NS_E_2734_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_2734_LB_0
	cmp r11,122
	ja NS_E_2734_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2734_LB_0:
	mov rax,0
	ret
NS_E_2733:
NS_E_RDI_2733:
NS_E_2733_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_2733_LB_0
	cmp r11,90
	ja NS_E_2733_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2733_LB_0:
	mov rax,0
	ret
NS_E_23:
NS_E_RDI_23:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_27:
	mov rdi,r13
	bt r12,0
NS_E_RDI_27:
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
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err
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
	jge err
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
	jge err
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
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_2730:
NS_E_RDI_2730:
NS_E_2730_ETR_TBL:
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
	jz NS_E_2730_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_2730_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2748:
; 	|» { 0' 1' }
NS_E_RDI_2748:
MTC_LB_2749:
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2750
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_2751
	bt QWORD [rax],0
	jc LB_2752
	btr r12,1
	jmp LB_2753
LB_2752:
	bts r12,1
LB_2753:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2751:
	push r14
	mov r14,rax
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_2756
	btr r12,4
	jmp LB_2757
LB_2756:
	bts r12,4
LB_2757:
	mov r8,r10
	bt r12,4
	jc LB_2754
	btr r12,2
	jmp LB_2755
LB_2754:
	bts r12,2
LB_2755:
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_2760
	btr r12,4
	jmp LB_2761
LB_2760:
	bts r12,4
LB_2761:
	mov r9,r10
	bt r12,4
	jc LB_2758
	btr r12,3
	jmp LB_2759
LB_2758:
	bts r12,3
LB_2759:
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_2762:
	cmp r15,0
	jz LB_2763
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt
	sub r15,1
	jmp LB_2762
LB_2763:
; _f35 %_2735 ⊢ { %_2739 %_2740 } : { %_2739 %_2740 }
 ; {>  %_2738~3':(_lst)◂(_r64) %_2735~0':_r64 %_2737~2':_r64 }
	mov r14,r13
	bts r12,1
; _f38 %_2740 ⊢ %_2741 : %_2741
 ; {>  %_2739~0':_r64 %_2738~3':(_lst)◂(_r64) %_2740~1':_r64 %_2737~2':_r64 }
	add r14,1
; _f2748 { %_2741 %_2738 } ⊢ %_2742 : %_2742
 ; {>  %_2739~0':_r64 %_2738~3':(_lst)◂(_r64) %_2737~2':_r64 %_2741~1':_r64 }
; _f2748 { 1' 3' } ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01010.. |},{ 1' 3' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_2768
	btr r12,0
	jmp LB_2769
LB_2768:
	bts r12,0
LB_2769:
	mov r14,r9
	bt r12,3
	jc LB_2770
	btr r12,1
	jmp LB_2771
LB_2770:
	bts r12,1
LB_2771:
	call NS_E_2748
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_2772
	btr r12,1
	jmp LB_2773
LB_2772:
	bts r12,1
LB_2773:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_2766
	btr r12,2
	jmp LB_2767
LB_2766:
	bts r12,2
LB_2767:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_2764
	btr r12,0
	jmp LB_2765
LB_2764:
	bts r12,0
LB_2765:
	add rsp,24
; _f16 { %_2742 %_2739 %_2737 } ⊢ { %_2743 %_2744 %_2745 } : { %_2743 %_2744 %_2745 }
 ; {>  %_2739~0':_r64 %_2742~1':_stg %_2737~2':_r64 }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_2774
	btr r12,3
	jmp LB_2775
LB_2774:
	bts r12,3
LB_2775:
	mov r14,r13
	bt r12,0
	jc LB_2776
	btr r12,1
	jmp LB_2777
LB_2776:
	bts r12,1
LB_2777:
	mov r13,r9
	bt r12,3
	jc LB_2778
	btr r12,0
	jmp LB_2779
LB_2778:
	bts r12,0
LB_2779:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_2743
 ; {>  %_2744~1':_r64 %_2743~0':_stg %_2745~2':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_2780
	mov rdi,r14
	call dlt
LB_2780:
	bt r12,2
	jc LB_2781
	mov rdi,r8
	call dlt
LB_2781:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_2750:
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2782
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_2783
	bt QWORD [rax],0
	jc LB_2784
	btr r12,1
	jmp LB_2785
LB_2784:
	bts r12,1
LB_2785:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2783:
	push r14
	mov r14,rax
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_2786:
	cmp r15,0
	jz LB_2787
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt
	sub r15,1
	jmp LB_2786
LB_2787:
; _f14 %_2735 ⊢ { %_2746 %_2747 } : { %_2746 %_2747 }
 ; {>  %_2735~0':_r64 }
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
; ∎ %_2747
 ; {>  %_2746~0':_r64 %_2747~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_2788
	mov rdi,r13
	call dlt
LB_2788:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2789
	btr r12,0
	jmp LB_2790
LB_2789:
	bts r12,0
LB_2790:
	ret
MTC_LB_2782:
NS_E_2799:
NS_E_RDI_2799:
; » 0xr0 |~ {  } ⊢ %_2791 : %_2791
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_2791
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; » 0xr1 |~ {  } ⊢ %_2792 : %_2792
 ; {>  %_2791~0':_r64 }
; 	» 0xr1 _ ⊢ 1' : %_2792
	mov rdi,0x1
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_2793 : %_2793
 ; {>  %_2792~1':_r64 %_2791~0':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_2793
	mov rdi,0x0
	mov r8,rdi
	bts r12,2
; _nil {  } ⊢ %_2794 : %_2794
 ; {>  %_2792~1':_r64 %_2791~0':_r64 %_2793~2':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_2791 %_2794 } ⊢ %_2795 : %_2795
 ; {>  %_2792~1':_r64 %_2791~0':_r64 %_2794~°1◂{  }:(_lst)◂(t1376'(0)) %_2793~2':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _cns { %_2792 %_2795 } ⊢ %_2796 : %_2796
 ; {>  %_2795~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) %_2792~1':_r64 %_2793~2':_r64 }
; _cns { 1' °0◂{ 0' °1◂{  } } } ⊢ °0◂{ 1' °0◂{ 0' °1◂{  } } }
; _f2748 { %_2793 %_2796 } ⊢ %_2797 : %_2797
 ; {>  %_2793~2':_r64 %_2796~°0◂{ 1' °0◂{ 0' °1◂{  } } }:(_lst)◂(_r64) }
; _f2748 { 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 2' °0◂{ 1' °0◂{ 0' °1◂{  } } } } ⊢ { 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_2800
	btr r12,3
	jmp LB_2801
LB_2800:
	bts r12,3
LB_2801:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r10,r9
	bt r12,3
	jc LB_2806
	btr r12,4
	jmp LB_2807
LB_2806:
	bts r12,4
LB_2807:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_2804
	btr QWORD [rdi],0
	jmp LB_2805
LB_2804:
	bts QWORD [rdi],0
LB_2805:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r9,r13
	bt r12,0
	jc LB_2814
	btr r12,3
	jmp LB_2815
LB_2814:
	bts r12,3
LB_2815:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_2812
	btr QWORD [rdi],0
	jmp LB_2813
LB_2812:
	bts QWORD [rdi],0
LB_2813:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_2818
	mov rsi,0
	bt r9,0
	jc LB_2818
	jmp LB_2819
LB_2818:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_2819:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_2816
	btr QWORD [rdi],1
	jmp LB_2817
LB_2816:
	bts QWORD [rdi],1
LB_2817:
	mov rsi,1
	bt r12,4
	jc LB_2810
	mov rsi,0
	bt r10,0
	jc LB_2810
	jmp LB_2811
LB_2810:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_2811:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_2808
	btr QWORD [rdi],1
	jmp LB_2809
LB_2808:
	bts QWORD [rdi],1
LB_2809:
	mov rsi,1
	bt r12,1
	jc LB_2802
	mov rsi,0
	bt r14,0
	jc LB_2802
	jmp LB_2803
LB_2802:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_2803:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov r13,r8
	bt r12,2
	jc LB_2820
	btr r12,0
	jmp LB_2821
LB_2820:
	bts r12,0
LB_2821:
	call NS_E_2748
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f20 %_2797 ⊢ %_2798 : %_2798
 ; {>  %_2797~0':_stg }
; _f20 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_2798~0':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_2822
	mov rdi,r13
	call dlt
LB_2822:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_2728:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2728
	NS_E_DYN_2731:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2731
	NS_E_DYN_2732:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2732
	NS_E_DYN_2733:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2733
	NS_E_DYN_2734:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2734
	NS_E_DYN_2748:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2748
	CST_DYN_2799:
		dq 0x0000_0001_00_82_ffff
		dq 1
