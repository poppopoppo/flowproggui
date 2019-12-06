%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_2989
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
NS_E_2710:
NS_E_RDI_2710:
NS_E_2710_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_2711
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_2711:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2713:
NS_E_RDI_2713:
NS_E_2713_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_2713_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_2713_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2714:
NS_E_RDI_2714:
NS_E_2714_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_2714_LB_0
	cmp r11,57
	ja NS_E_2714_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2714_LB_0:
	mov rax,0
	ret
NS_E_2716:
NS_E_RDI_2716:
NS_E_2716_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_2716_LB_0
	cmp r11,122
	ja NS_E_2716_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2716_LB_0:
	mov rax,0
	ret
NS_E_2715:
NS_E_RDI_2715:
NS_E_2715_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_2715_LB_0
	cmp r11,90
	ja NS_E_2715_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2715_LB_0:
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
NS_E_2712:
NS_E_RDI_2712:
NS_E_2712_ETR_TBL:
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
	jz NS_E_2712_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_2712_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2730:
; 	|» { 0' 1' }
NS_E_RDI_2730:
MTC_LB_2731:
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_2732
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_2733
	bt QWORD [rax],0
	jc LB_2734
	btr r12,1
	jmp LB_2735
LB_2734:
	bts r12,1
LB_2735:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2733:
	push r14
	mov r14,rax
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_2738
	btr r12,4
	jmp LB_2739
LB_2738:
	bts r12,4
LB_2739:
	mov r8,r10
	bt r12,4
	jc LB_2736
	btr r12,2
	jmp LB_2737
LB_2736:
	bts r12,2
LB_2737:
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_2742
	btr r12,4
	jmp LB_2743
LB_2742:
	bts r12,4
LB_2743:
	mov r9,r10
	bt r12,4
	jc LB_2740
	btr r12,3
	jmp LB_2741
LB_2740:
	bts r12,3
LB_2741:
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_2744:
	cmp r15,0
	jz LB_2745
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2744
LB_2745:
; _f38 %_2717 ⊢ %_2721 : %_2721
 ; {>  %_2719~2':_r64 %_2720~3':(_lst)◂(_r64) %_2717~0':_r64 }
	add r13,1
; _f2730 { %_2721 %_2720 } ⊢ { %_2722 %_2723 } : { %_2722 %_2723 }
 ; {>  %_2721~0':_r64 %_2719~2':_r64 %_2720~3':(_lst)◂(_r64) }
; _f2730 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_2748
	btr r12,1
	jmp LB_2749
LB_2748:
	bts r12,1
LB_2749:
	call NS_E_2730
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_2746
	btr r12,2
	jmp LB_2747
LB_2746:
	bts r12,2
LB_2747:
	add rsp,16
; _f37 %_2722 ⊢ %_2724 : %_2724
 ; {>  %_2722~0':_r64 %_2723~1':_stg %_2719~2':_r64 }
	sub r13,1
; _f16 { %_2723 %_2724 %_2719 } ⊢ { %_2725 %_2726 %_2727 } : { %_2725 %_2726 %_2727 }
 ; {>  %_2723~1':_stg %_2719~2':_r64 %_2724~0':_r64 }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_2750
	btr r12,3
	jmp LB_2751
LB_2750:
	bts r12,3
LB_2751:
	mov r14,r13
	bt r12,0
	jc LB_2752
	btr r12,1
	jmp LB_2753
LB_2752:
	bts r12,1
LB_2753:
	mov r13,r9
	bt r12,3
	jc LB_2754
	btr r12,0
	jmp LB_2755
LB_2754:
	bts r12,0
LB_2755:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_2726 %_2725 }
 ; {>  %_2726~1':_r64 %_2727~2':_r64 %_2725~0':_stg }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_2756
	mov rdi,r8
	call dlt
LB_2756:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_2757
	btr r12,2
	jmp LB_2758
LB_2757:
	bts r12,2
LB_2758:
	mov r14,r13
	bt r12,0
	jc LB_2759
	btr r12,1
	jmp LB_2760
LB_2759:
	bts r12,1
LB_2760:
	mov r13,r8
	bt r12,2
	jc LB_2761
	btr r12,0
	jmp LB_2762
LB_2761:
	bts r12,0
LB_2762:
	ret
MTC_LB_2732:
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_2763
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_2764
	bt QWORD [rax],0
	jc LB_2765
	btr r12,1
	jmp LB_2766
LB_2765:
	bts r12,1
LB_2766:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_2764:
	push r14
	mov r14,rax
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_2767:
	cmp r15,0
	jz LB_2768
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_2767
LB_2768:
; _f14 %_2717 ⊢ { %_2728 %_2729 } : { %_2728 %_2729 }
 ; {>  %_2717~0':_r64 }
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
; ∎ { %_2728 %_2729 }
 ; {>  %_2728~0':_r64 %_2729~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_2763:
NS_E_2773:
; 	|» 0'
NS_E_RDI_2773:
; » 0xr0 |~ {  } ⊢ %_2770 : %_2770
 ; {>  %_2769~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_2770
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f2730 { %_2770 %_2769 } ⊢ { %_2771 %_2772 } : { %_2771 %_2772 }
 ; {>  %_2770~1':_r64 %_2769~0':(_lst)◂(_r64) }
; _f2730 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_2774
	btr r12,2
	jmp LB_2775
LB_2774:
	bts r12,2
LB_2775:
	mov r14,r13
	bt r12,0
	jc LB_2776
	btr r12,1
	jmp LB_2777
LB_2776:
	bts r12,1
LB_2777:
	mov r13,r8
	bt r12,2
	jc LB_2778
	btr r12,0
	jmp LB_2779
LB_2778:
	bts r12,0
LB_2779:
	call NS_E_2730
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_2772
 ; {>  %_2772~1':_stg %_2771~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_2780
	mov rdi,r13
	call dlt
LB_2780:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_2781
	btr r12,0
	jmp LB_2782
LB_2781:
	bts r12,0
LB_2782:
	ret
NS_E_2783:
NS_E_RDI_2783:
NS_E_2783_ETR_TBL:
NS_E_2783_TBL:
	push r14
	sub rsp,32
; "\""
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,34
	jz LB_2821
	jmp NS_E_2783_MTC_0_failed
LB_2821:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	call NS_E_2784_ETR_TBL
	cmp r8,0
	jz LB_2826
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2827
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2827:
	jmp NS_E_2783_MTC_0_failed
LB_2826:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2816
	btr r12,1
	jmp LB_2817
LB_2816:
	bts r12,1
LB_2817:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2814
	btr r12,0
	jmp LB_2815
LB_2814:
	bts r12,0
LB_2815:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2811
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_2829
	btr r12,2
	jmp LB_2830
LB_2829:
	bts r12,2
LB_2830:
	mov r13,r14
	bt r12,1
	jc LB_2831
	btr r12,0
	jmp LB_2832
LB_2831:
	bts r12,0
LB_2832:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f2773 %_2786 ⊢ %_2787 : %_2787
 ; {>  %_2786~0':(_lst)◂(_r64) }
; _f2773 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_2773
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_2787 ⊢ %_2788 : %_2788
 ; {>  %_2787~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_2788
 ; {>  %_2788~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2809
	btr r12,3
	jmp LB_2810
LB_2809:
	bts r12,3
LB_2810:
	mov r8,0
	bts r12,2
	ret
LB_2811:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2813
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2812
LB_2813:
	add rsp,8
	ret
NS_E_2783_MTC_0_failed:
	add rsp,32
	pop r14
LB_2812:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2784:
NS_E_RDI_2784:
NS_E_2784_ETR_TBL:
NS_E_2784_TBL:
	push r14
	sub rsp,48
; "\\"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,92
	jz LB_2855
	jmp NS_E_2784_MTC_0_failed
LB_2855:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	call NS_E_2785_ETR_TBL
	cmp r8,0
	jz LB_2860
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2861
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2861:
	jmp NS_E_2784_MTC_0_failed
LB_2860:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	call NS_E_2784_ETR_TBL
	cmp r8,0
	jz LB_2865
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_2866
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_2866:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2867
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2867:
	jmp NS_E_2784_MTC_0_failed
LB_2865:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_2850
	btr r12,2
	jmp LB_2851
LB_2850:
	bts r12,2
LB_2851:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2848
	btr r12,1
	jmp LB_2849
LB_2848:
	bts r12,1
LB_2849:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2846
	btr r12,0
	jmp LB_2847
LB_2846:
	bts r12,0
LB_2847:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_2843
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_2869
	btr r12,3
	jmp LB_2870
LB_2869:
	bts r12,3
LB_2870:
	mov r14,r8
	bt r12,2
	jc LB_2871
	btr r12,1
	jmp LB_2872
LB_2871:
	bts r12,1
LB_2872:
	mov r8,r13
	bt r12,0
	jc LB_2873
	btr r12,2
	jmp LB_2874
LB_2873:
	bts r12,2
LB_2874:
	mov r13,r9
	bt r12,3
	jc LB_2875
	btr r12,0
	jmp LB_2876
LB_2875:
	bts r12,0
LB_2876:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_2789 %_2790 } ⊢ %_2791 : %_2791
 ; {>  %_2790~1':(_lst)◂(_r64) %_2789~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_2791 ⊢ %_2792 : %_2792
 ; {>  %_2791~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_2792
 ; {>  %_2792~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_2837
	btr r12,2
	jmp LB_2838
LB_2837:
	bts r12,2
LB_2838:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_2835
	btr QWORD [rdi],0
	jmp LB_2836
LB_2835:
	bts QWORD [rdi],0
LB_2836:
	mov r8,r14
	bt r12,1
	jc LB_2841
	btr r12,2
	jmp LB_2842
LB_2841:
	bts r12,2
LB_2842:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_2839
	btr QWORD [rdi],1
	jmp LB_2840
LB_2839:
	bts QWORD [rdi],1
LB_2840:
	mov rsi,1
	bt r12,3
	jc LB_2833
	mov rsi,0
	bt r9,0
	jc LB_2833
	jmp LB_2834
LB_2833:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_2834:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2843:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2845
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2844
LB_2845:
	add rsp,8
	ret
NS_E_2784_MTC_0_failed:
	add rsp,48
	pop r14
LB_2844:
	push r14
	sub rsp,16
; "\""
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,34
	jz LB_2887
	jmp NS_E_2784_MTC_1_failed
LB_2887:
	add r14,1
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
	jc LB_2882
	btr r12,0
	jmp LB_2883
LB_2882:
	bts r12,0
LB_2883:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2879
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_2793 : %_2793
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_2793 ⊢ %_2794 : %_2794
 ; {>  %_2793~°1◂{  }:(_lst)◂(t1035'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_2794
 ; {>  %_2794~°0◂°1◂{  }:(_opn)◂((_lst)◂(t1038'(0))) }
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
	jc LB_2877
	mov rsi,0
	bt r9,0
	jc LB_2877
	jmp LB_2878
LB_2877:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_2878:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2879:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2881
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2880
LB_2881:
	add rsp,8
	ret
NS_E_2784_MTC_1_failed:
	add rsp,16
	pop r14
LB_2880:
	push r14
	sub rsp,32
; _byt
	call NS_E_2710_ETR_TBL
	cmp r8,0
	jz LB_2909
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_2784_MTC_2_failed
LB_2909:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	call NS_E_2784_ETR_TBL
	cmp r8,0
	jz LB_2913
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_2914
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_2914:
	jmp NS_E_2784_MTC_2_failed
LB_2913:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_2905
	btr r12,1
	jmp LB_2906
LB_2905:
	bts r12,1
LB_2906:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_2903
	btr r12,0
	jmp LB_2904
LB_2903:
	bts r12,0
LB_2904:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_2900
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_2795 %_2796 } ⊢ %_2797 : %_2797
 ; {>  %_2795~0':_r64 %_2796~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_2797 ⊢ %_2798 : %_2798
 ; {>  %_2797~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_2798
 ; {>  %_2798~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_2894
	btr r12,2
	jmp LB_2895
LB_2894:
	bts r12,2
LB_2895:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_2892
	btr QWORD [rdi],0
	jmp LB_2893
LB_2892:
	bts QWORD [rdi],0
LB_2893:
	mov r8,r14
	bt r12,1
	jc LB_2898
	btr r12,2
	jmp LB_2899
LB_2898:
	bts r12,2
LB_2899:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_2896
	btr QWORD [rdi],1
	jmp LB_2897
LB_2896:
	bts QWORD [rdi],1
LB_2897:
	mov rsi,1
	bt r12,3
	jc LB_2890
	mov rsi,0
	bt r9,0
	jc LB_2890
	jmp LB_2891
LB_2890:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_2891:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_2900:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2902
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2901
LB_2902:
	add rsp,8
	ret
NS_E_2784_MTC_2_failed:
	add rsp,32
	pop r14
LB_2901:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2785:
NS_E_RDI_2785:
NS_E_2785_ETR_TBL:
NS_E_2785_TBL:
	push r14
	sub rsp,16
; "\\"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,92
	jz LB_2926
	jmp NS_E_2785_MTC_0_failed
LB_2926:
	add r14,1
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
	jc LB_2921
	btr r12,0
	jmp LB_2922
LB_2921:
	bts r12,0
LB_2922:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2918
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_2799 : %_2799
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_2799
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_2799 ⊢ %_2800 : %_2800
 ; {>  %_2799~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2800
 ; {>  %_2800~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2916
	btr r12,3
	jmp LB_2917
LB_2916:
	bts r12,3
LB_2917:
	mov r8,0
	bts r12,2
	ret
LB_2918:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2920
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2919
LB_2920:
	add rsp,8
	ret
NS_E_2785_MTC_0_failed:
	add rsp,16
	pop r14
LB_2919:
	push r14
	sub rsp,16
; "\""
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,34
	jz LB_2939
	jmp NS_E_2785_MTC_1_failed
LB_2939:
	add r14,1
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
	jc LB_2934
	btr r12,0
	jmp LB_2935
LB_2934:
	bts r12,0
LB_2935:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2931
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_2801 : %_2801
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_2801
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_2801 ⊢ %_2802 : %_2802
 ; {>  %_2801~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2802
 ; {>  %_2802~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2929
	btr r12,3
	jmp LB_2930
LB_2929:
	bts r12,3
LB_2930:
	mov r8,0
	bts r12,2
	ret
LB_2931:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2933
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2932
LB_2933:
	add rsp,8
	ret
NS_E_2785_MTC_1_failed:
	add rsp,16
	pop r14
LB_2932:
	push r14
	sub rsp,16
; "n"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,110
	jz LB_2952
	jmp NS_E_2785_MTC_2_failed
LB_2952:
	add r14,1
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
	jc LB_2947
	btr r12,0
	jmp LB_2948
LB_2947:
	bts r12,0
LB_2948:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2944
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_2803 : %_2803
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_2803
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_2803 ⊢ %_2804 : %_2804
 ; {>  %_2803~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2804
 ; {>  %_2804~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2942
	btr r12,3
	jmp LB_2943
LB_2942:
	bts r12,3
LB_2943:
	mov r8,0
	bts r12,2
	ret
LB_2944:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2946
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2945
LB_2946:
	add rsp,8
	ret
NS_E_2785_MTC_2_failed:
	add rsp,16
	pop r14
LB_2945:
	push r14
	sub rsp,16
; "t"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,116
	jz LB_2965
	jmp NS_E_2785_MTC_3_failed
LB_2965:
	add r14,1
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
	jc LB_2960
	btr r12,0
	jmp LB_2961
LB_2960:
	bts r12,0
LB_2961:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2957
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_2805 : %_2805
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_2805
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_2805 ⊢ %_2806 : %_2806
 ; {>  %_2805~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2806
 ; {>  %_2806~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2955
	btr r12,3
	jmp LB_2956
LB_2955:
	bts r12,3
LB_2956:
	mov r8,0
	bts r12,2
	ret
LB_2957:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2959
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2958
LB_2959:
	add rsp,8
	ret
NS_E_2785_MTC_3_failed:
	add rsp,16
	pop r14
LB_2958:
	push r14
	sub rsp,16
; "0"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,48
	jz LB_2978
	jmp NS_E_2785_MTC_4_failed
LB_2978:
	add r14,1
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
	jc LB_2973
	btr r12,0
	jmp LB_2974
LB_2973:
	bts r12,0
LB_2974:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_2970
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_2807 : %_2807
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_2807
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_2807 ⊢ %_2808 : %_2808
 ; {>  %_2807~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_2808
 ; {>  %_2808~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_2968
	btr r12,3
	jmp LB_2969
LB_2968:
	bts r12,3
LB_2969:
	mov r8,0
	bts r12,2
	ret
LB_2970:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_2972
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_2971
LB_2972:
	add rsp,8
	ret
NS_E_2785_MTC_4_failed:
	add rsp,16
	pop r14
LB_2971:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_2989:
NS_E_RDI_2989:
; » _^ ..
	mov rax,19
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\"Hello\\tWorld !!\" \n"
	mov rsi,0x_74_5c_6f_6c_6c_65_48_22
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_21_21_20_64_6c_72_6f_57
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_00_00_00_00_00_0a_20_22
	mov QWORD [rdi+8*2],rsi
	add rdi,19
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_2982 : %_2982
 ; {>  %_2981~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_2982
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f2783 { %_2981 %_2982 } ⊢ { %_2983 %_2984 %_2985 } : { %_2983 %_2984 %_2985 }
 ; {>  %_2981~0':_stg %_2982~1':_r64 }
; _f2783 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_2783
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_2990
	btr r12,4
	jmp LB_2991
LB_2990:
	bts r12,4
LB_2991:
	mov r8,r9
	bt r12,3
	jc LB_2994
	btr r12,2
	jmp LB_2995
LB_2994:
	bts r12,2
LB_2995:
	mov rsi,1
	bt r12,2
	jc LB_2992
	mov rsi,0
	bt r8,0
	jc LB_2992
	jmp LB_2993
LB_2992:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_2993:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f20 { %_2983 %_2984 %_2985 } ⊢ { %_2986 %_2987 %_2988 } : { %_2986 %_2987 %_2988 }
 ; {>  %_2985~2':(_opn)◂(_stg) %_2984~1':_r64 %_2983~0':_stg }
; _f20 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_2996
	btr r12,3
	jmp LB_2997
LB_2996:
	bts r12,3
LB_2997:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_3000
	btr r12,4
	jmp LB_3001
LB_3000:
	bts r12,4
LB_3001:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_2998
	btr QWORD [rdi],0
	jmp LB_2999
LB_2998:
	bts QWORD [rdi],0
LB_2999:
	mov r10,r14
	bt r12,1
	jc LB_3004
	btr r12,4
	jmp LB_3005
LB_3004:
	bts r12,4
LB_3005:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_3002
	btr QWORD [rdi],1
	jmp LB_3003
LB_3002:
	bts QWORD [rdi],1
LB_3003:
	mov r10,r8
	bt r12,2
	jc LB_3008
	btr r12,4
	jmp LB_3009
LB_3008:
	bts r12,4
LB_3009:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_3006
	btr QWORD [rdi],2
	jmp LB_3007
LB_3006:
	bts QWORD [rdi],2
LB_3007:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_3010
	btr r12,3
	jmp LB_3011
LB_3010:
	bts r12,3
LB_3011:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_3014
	btr r12,4
	jmp LB_3015
LB_3014:
	bts r12,4
LB_3015:
	mov r13,r10
	bt r12,4
	jc LB_3012
	btr r12,0
	jmp LB_3013
LB_3012:
	bts r12,0
LB_3013:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_3018
	btr r12,4
	jmp LB_3019
LB_3018:
	bts r12,4
LB_3019:
	mov r14,r10
	bt r12,4
	jc LB_3016
	btr r12,1
	jmp LB_3017
LB_3016:
	bts r12,1
LB_3017:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_3022
	btr r12,4
	jmp LB_3023
LB_3022:
	bts r12,4
LB_3023:
	mov r8,r10
	bt r12,4
	jc LB_3020
	btr r12,2
	jmp LB_3021
LB_3020:
	bts r12,2
LB_3021:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_2988~2':(_opn)◂(_stg) %_2986~0':_stg %_2987~1':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_3024
	mov rdi,r8
	call dlt
LB_3024:
	bt r12,0
	jc LB_3025
	mov rdi,r13
	call dlt
LB_3025:
	bt r12,1
	jc LB_3026
	mov rdi,r14
	call dlt
LB_3026:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_2710:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2710
	NS_E_DYN_2713:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2713
	NS_E_DYN_2714:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2714
	NS_E_DYN_2715:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2715
	NS_E_DYN_2716:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2716
	NS_E_DYN_2730:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2730
	NS_E_DYN_2773:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2773
	NS_E_DYN_2783:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2783
	NS_E_DYN_2784:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2784
	NS_E_DYN_2785:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2785
	CST_DYN_2989:
		dq 0x0000_0001_00_82_ffff
		dq 1
