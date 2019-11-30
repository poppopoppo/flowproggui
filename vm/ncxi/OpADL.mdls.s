%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call in0_init
	call NS_E_3465
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
	push r14
	push r15
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
	call pp_v
	push rax
	mov rdi,rax
	mov rax,0
	add rdi,8
	mov rsi,rdi
	mov rdi,fmt_emt_q
	call printf
	pop rdi
	mov rax,0
	call free
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	ret
NS_E_2659:
NS_E_RDI_2659:
NS_E_2659_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_2660
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_2660:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2661:
NS_E_RDI_2661:
NS_E_2661_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_2661_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_2661_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2662:
NS_E_RDI_2662:
NS_E_2662_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_2662_LB_0
	cmp r11,57
	ja NS_E_2662_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2662_LB_0:
	mov rax,0
	ret
NS_E_2664:
NS_E_RDI_2664:
NS_E_2664_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_2664_LB_0
	cmp r11,122
	ja NS_E_2664_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2664_LB_0:
	mov rax,0
	ret
NS_E_2663:
NS_E_RDI_2663:
NS_E_2663_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_2663_LB_0
	cmp r11,90
	ja NS_E_2663_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_2663_LB_0:
	mov rax,0
	ret
NS_E_18:
NS_E_RDI_18:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_22:
	mov rdi,r8
	bt r12,0
NS_E_RDI_22:
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
NS_E_2666:
NS_E_RDI_2666:
NS_E_2666_ETR_TBL:
NS_E_2666_TBL:
	push r14
; glb_etr
	call NS_E_2668_ETR_TBL
	cmp r15,0
	jz LB_2755
	jmp NS_E_2666_MTC_0_failed
LB_2755:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; glb_etr_lst
	call NS_E_2666_ETR_TBL
	cmp r15,0
	jz LB_2759
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2760
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2760:
	jmp NS_E_2666_MTC_0_failed
LB_2759:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2750
	btr QWORD [rdi],1
LB_2750:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2751
	btr QWORD [rdi],0
LB_2751:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2666_MTC_0_failed:
	pop r14
	push r14
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2666_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2668:
NS_E_RDI_2668:
NS_E_2668_ETR_TBL:
NS_E_2668_TBL:
	push r14
; mdl_etr
	call NS_E_2670_ETR_TBL
	cmp r15,0
	jz LB_2784
	jmp NS_E_2668_MTC_0_failed
LB_2784:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2780
	btr QWORD [rdi],0
LB_2780:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2668_MTC_0_failed:
	pop r14
	push r14
; cst_etr
	call NS_E_2672_ETR_TBL
	cmp r15,0
	jz LB_2778
	jmp NS_E_2668_MTC_1_failed
LB_2778:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2774
	btr QWORD [rdi],0
LB_2774:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2668_MTC_1_failed:
	pop r14
	push r14
; op_etr
	call NS_E_2674_ETR_TBL
	cmp r15,0
	jz LB_2772
	jmp NS_E_2668_MTC_2_failed
LB_2772:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2768
	btr QWORD [rdi],0
LB_2768:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2668_MTC_2_failed:
	pop r14
	push r14
; dta_etr
	call NS_E_2676_ETR_TBL
	cmp r15,0
	jz LB_2766
	jmp NS_E_2668_MTC_3_failed
LB_2766:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2762
	btr QWORD [rdi],0
LB_2762:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2668_MTC_3_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2670:
NS_E_RDI_2670:
NS_E_2670_ETR_TBL:
NS_E_2670_TBL:
	push r14
; "\194\167\194\167"
	jmp LB_2829
LB_2828:
	add r14,1
LB_2829:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2828
	cmp rax,10
	jz LB_2828
	cmp rax,32
	jz LB_2828
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2831
	jmp NS_E_2670_MTC_0_failed
LB_2831:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2832
	jmp NS_E_2670_MTC_0_failed
LB_2832:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_2833
	jmp NS_E_2670_MTC_0_failed
LB_2833:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_2834
	jmp NS_E_2670_MTC_0_failed
LB_2834:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2841
LB_2840:
	add r14,1
LB_2841:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2840
	cmp rax,10
	jz LB_2840
	cmp rax,32
	jz LB_2840
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_2842
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2843
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2843:
	jmp NS_E_2670_MTC_0_failed
LB_2842:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; glb_etr_lst
	jmp LB_2846
LB_2845:
	add r14,1
LB_2846:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2845
	cmp rax,10
	jz LB_2845
	cmp rax,32
	jz LB_2845
	call NS_E_2666_ETR_TBL
	cmp r15,0
	jz LB_2847
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2848
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2848:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2849
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2849:
	jmp NS_E_2670_MTC_0_failed
LB_2847:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; "\226\136\142\226\136\142"
	jmp LB_2852
LB_2851:
	add r14,1
LB_2852:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2851
	cmp rax,10
	jz LB_2851
	cmp rax,32
	jz LB_2851
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2854
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2881
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2881:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2882
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2882:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2883
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2883:
	jmp NS_E_2670_MTC_0_failed
LB_2854:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_2855
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2877
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2877:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2878
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2878:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2879
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2879:
	jmp NS_E_2670_MTC_0_failed
LB_2855:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_2856
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2873
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2873:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2874
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2874:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2875
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2875:
	jmp NS_E_2670_MTC_0_failed
LB_2856:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,226
	jz LB_2857
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2869
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2869:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2870
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2870:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2871
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2871:
	jmp NS_E_2670_MTC_0_failed
LB_2857:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+4]
	cmp al,136
	jz LB_2858
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2865
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2865:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2866
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2866:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2867
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2867:
	jmp NS_E_2670_MTC_0_failed
LB_2858:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+5]
	cmp al,142
	jz LB_2859
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2861
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2861:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2862
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2862:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2863
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2863:
	jmp NS_E_2670_MTC_0_failed
LB_2859:
	add r14,6
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*3],0
	mov QWORD [prs_vct+8*1+16*3],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2823
	btr QWORD [rdi],3
LB_2823:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2824
	btr QWORD [rdi],2
LB_2824:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2825
	btr QWORD [rdi],1
LB_2825:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2826
	btr QWORD [rdi],0
LB_2826:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2670_MTC_0_failed:
	pop r14
	push r14
; "\194\167\194\167"
	jmp LB_2792
LB_2791:
	add r14,1
LB_2792:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2791
	cmp rax,10
	jz LB_2791
	cmp rax,32
	jz LB_2791
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2794
	jmp NS_E_2670_MTC_1_failed
LB_2794:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2795
	jmp NS_E_2670_MTC_1_failed
LB_2795:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_2796
	jmp NS_E_2670_MTC_1_failed
LB_2796:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_2797
	jmp NS_E_2670_MTC_1_failed
LB_2797:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2804
LB_2803:
	add r14,1
LB_2804:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2803
	cmp rax,10
	jz LB_2803
	cmp rax,32
	jz LB_2803
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_2805
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2806
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2806:
	jmp NS_E_2670_MTC_1_failed
LB_2805:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_2809
LB_2808:
	add r14,1
LB_2809:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2808
	cmp rax,10
	jz LB_2808
	cmp rax,32
	jz LB_2808
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_2811
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2813
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2813:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2814
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2814:
	jmp NS_E_2670_MTC_1_failed
LB_2811:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_2817
LB_2816:
	add r14,1
LB_2817:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2816
	cmp rax,10
	jz LB_2816
	cmp rax,32
	jz LB_2816
	call NS_E_2684_ETR_TBL
	cmp r15,0
	jz LB_2818
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2819
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2819:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2820
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2820:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2821
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2821:
	jmp NS_E_2670_MTC_1_failed
LB_2818:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2786
	btr QWORD [rdi],3
LB_2786:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2787
	btr QWORD [rdi],2
LB_2787:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2788
	btr QWORD [rdi],1
LB_2788:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2789
	btr QWORD [rdi],0
LB_2789:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2670_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2672:
NS_E_RDI_2672:
NS_E_2672_ETR_TBL:
NS_E_2672_TBL:
	push r14
; "\194\167"
	jmp LB_2924
LB_2923:
	add r14,1
LB_2924:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2923
	cmp rax,10
	jz LB_2923
	cmp rax,32
	jz LB_2923
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2926
	jmp NS_E_2672_MTC_0_failed
LB_2926:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2927
	jmp NS_E_2672_MTC_0_failed
LB_2927:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2932
LB_2931:
	add r14,1
LB_2932:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2931
	cmp rax,10
	jz LB_2931
	cmp rax,32
	jz LB_2931
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_2933
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2934
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2934:
	jmp NS_E_2672_MTC_0_failed
LB_2933:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\194\171"
	jmp LB_2937
LB_2936:
	add r14,1
LB_2937:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2936
	cmp rax,10
	jz LB_2936
	cmp rax,32
	jz LB_2936
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2939
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2945
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2945:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2946
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2946:
	jmp NS_E_2672_MTC_0_failed
LB_2939:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,171
	jz LB_2940
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2942
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2942:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2943
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2943:
	jmp NS_E_2672_MTC_0_failed
LB_2940:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; op_lines
	jmp LB_2949
LB_2948:
	add r14,1
LB_2949:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2948
	cmp rax,10
	jz LB_2948
	cmp rax,32
	jz LB_2948
	call NS_E_2690_ETR_TBL
	cmp r15,0
	jz LB_2950
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2951
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2951:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2952
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2952:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2953
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2953:
	jmp NS_E_2672_MTC_0_failed
LB_2950:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2918
	btr QWORD [rdi],3
LB_2918:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2919
	btr QWORD [rdi],2
LB_2919:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2920
	btr QWORD [rdi],1
LB_2920:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2921
	btr QWORD [rdi],0
LB_2921:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2672_MTC_0_failed:
	pop r14
	push r14
; "\194\167"
	jmp LB_2891
LB_2890:
	add r14,1
LB_2891:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2890
	cmp rax,10
	jz LB_2890
	cmp rax,32
	jz LB_2890
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2893
	jmp NS_E_2672_MTC_1_failed
LB_2893:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2894
	jmp NS_E_2672_MTC_1_failed
LB_2894:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2899
LB_2898:
	add r14,1
LB_2899:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2898
	cmp rax,10
	jz LB_2898
	cmp rax,32
	jz LB_2898
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_2900
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2901
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2901:
	jmp NS_E_2672_MTC_1_failed
LB_2900:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_2904
LB_2903:
	add r14,1
LB_2904:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2903
	cmp rax,10
	jz LB_2903
	cmp rax,32
	jz LB_2903
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_2906
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2908
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2908:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2909
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2909:
	jmp NS_E_2672_MTC_1_failed
LB_2906:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; cst
	jmp LB_2912
LB_2911:
	add r14,1
LB_2912:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2911
	cmp rax,10
	jz LB_2911
	cmp rax,32
	jz LB_2911
	call NS_E_2678_ETR_TBL
	cmp r15,0
	jz LB_2913
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2914
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2914:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2915
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2915:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2916
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2916:
	jmp NS_E_2672_MTC_1_failed
LB_2913:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2885
	btr QWORD [rdi],3
LB_2885:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2886
	btr QWORD [rdi],2
LB_2886:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2887
	btr QWORD [rdi],1
LB_2887:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2888
	btr QWORD [rdi],0
LB_2888:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2672_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2674:
NS_E_RDI_2674:
NS_E_2674_ETR_TBL:
NS_E_2674_TBL:
	push r14
; "\194\167"
	jmp LB_2994
LB_2993:
	add r14,1
LB_2994:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2993
	cmp rax,10
	jz LB_2993
	cmp rax,32
	jz LB_2993
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2996
	jmp NS_E_2674_MTC_0_failed
LB_2996:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2997
	jmp NS_E_2674_MTC_0_failed
LB_2997:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_3002
LB_3001:
	add r14,1
LB_3002:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3001
	cmp rax,10
	jz LB_3001
	cmp rax,32
	jz LB_3001
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_3003
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3004
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3004:
	jmp NS_E_2674_MTC_0_failed
LB_3003:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; reg_ptn
	jmp LB_3007
LB_3006:
	add r14,1
LB_3007:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3006
	cmp rax,10
	jz LB_3006
	cmp rax,32
	jz LB_3006
	call NS_E_2702_ETR_TBL
	cmp r15,0
	jz LB_3008
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3009
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3009:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3010
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3010:
	jmp NS_E_2674_MTC_0_failed
LB_3008:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; op_lines
	jmp LB_3013
LB_3012:
	add r14,1
LB_3013:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3012
	cmp rax,10
	jz LB_3012
	cmp rax,32
	jz LB_3012
	call NS_E_2690_ETR_TBL
	cmp r15,0
	jz LB_3014
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_3015
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_3015:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3016
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3016:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3017
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3017:
	jmp NS_E_2674_MTC_0_failed
LB_3014:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2988
	btr QWORD [rdi],3
LB_2988:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2989
	btr QWORD [rdi],2
LB_2989:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2990
	btr QWORD [rdi],1
LB_2990:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2991
	btr QWORD [rdi],0
LB_2991:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2674_MTC_0_failed:
	pop r14
	push r14
; "\194\167"
	jmp LB_2961
LB_2960:
	add r14,1
LB_2961:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2960
	cmp rax,10
	jz LB_2960
	cmp rax,32
	jz LB_2960
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2963
	jmp NS_E_2674_MTC_1_failed
LB_2963:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2964
	jmp NS_E_2674_MTC_1_failed
LB_2964:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2969
LB_2968:
	add r14,1
LB_2969:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2968
	cmp rax,10
	jz LB_2968
	cmp rax,32
	jz LB_2968
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_2970
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2971
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2971:
	jmp NS_E_2674_MTC_1_failed
LB_2970:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_2974
LB_2973:
	add r14,1
LB_2974:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2973
	cmp rax,10
	jz LB_2973
	cmp rax,32
	jz LB_2973
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_2976
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2978
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2978:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2979
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2979:
	jmp NS_E_2674_MTC_1_failed
LB_2976:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_2982
LB_2981:
	add r14,1
LB_2982:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2981
	cmp rax,10
	jz LB_2981
	cmp rax,32
	jz LB_2981
	call NS_E_2684_ETR_TBL
	cmp r15,0
	jz LB_2983
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2984
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2984:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2985
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2985:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2986
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2986:
	jmp NS_E_2674_MTC_1_failed
LB_2983:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2955
	btr QWORD [rdi],3
LB_2955:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2956
	btr QWORD [rdi],2
LB_2956:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2957
	btr QWORD [rdi],1
LB_2957:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2958
	btr QWORD [rdi],0
LB_2958:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2674_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2676:
NS_E_RDI_2676:
NS_E_2676_ETR_TBL:
NS_E_2676_TBL:
	push r14
; "\194\182"
	jmp LB_3057
LB_3056:
	add r14,1
LB_3057:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3056
	cmp rax,10
	jz LB_3056
	cmp rax,32
	jz LB_3056
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_3059
	jmp NS_E_2676_MTC_0_failed
LB_3059:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_3060
	jmp NS_E_2676_MTC_0_failed
LB_3060:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_3065
LB_3064:
	add r14,1
LB_3065:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3064
	cmp rax,10
	jz LB_3064
	cmp rax,32
	jz LB_3064
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_3066
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3067
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3067:
	jmp NS_E_2676_MTC_0_failed
LB_3066:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; dta_def
	jmp LB_3070
LB_3069:
	add r14,1
LB_3070:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3069
	cmp rax,10
	jz LB_3069
	cmp rax,32
	jz LB_3069
	call NS_E_2686_ETR_TBL
	cmp r15,0
	jz LB_3071
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3072
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3072:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3073
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3073:
	jmp NS_E_2676_MTC_0_failed
LB_3071:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_3052
	btr QWORD [rdi],2
LB_3052:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3053
	btr QWORD [rdi],1
LB_3053:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3054
	btr QWORD [rdi],0
LB_3054:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2676_MTC_0_failed:
	pop r14
	push r14
; "\194\182"
	jmp LB_3025
LB_3024:
	add r14,1
LB_3025:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3024
	cmp rax,10
	jz LB_3024
	cmp rax,32
	jz LB_3024
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_3027
	jmp NS_E_2676_MTC_1_failed
LB_3027:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_3028
	jmp NS_E_2676_MTC_1_failed
LB_3028:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_3033
LB_3032:
	add r14,1
LB_3033:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3032
	cmp rax,10
	jz LB_3032
	cmp rax,32
	jz LB_3032
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_3034
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3035
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3035:
	jmp NS_E_2676_MTC_1_failed
LB_3034:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_3038
LB_3037:
	add r14,1
LB_3038:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3037
	cmp rax,10
	jz LB_3037
	cmp rax,32
	jz LB_3037
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_3040
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3042
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3042:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3043
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3043:
	jmp NS_E_2676_MTC_1_failed
LB_3040:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_3046
LB_3045:
	add r14,1
LB_3046:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3045
	cmp rax,10
	jz LB_3045
	cmp rax,32
	jz LB_3045
	call NS_E_2684_ETR_TBL
	cmp r15,0
	jz LB_3047
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_3048
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_3048:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3049
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3049:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3050
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3050:
	jmp NS_E_2676_MTC_1_failed
LB_3047:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_3019
	btr QWORD [rdi],3
LB_3019:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_3020
	btr QWORD [rdi],2
LB_3020:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3021
	btr QWORD [rdi],1
LB_3021:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3022
	btr QWORD [rdi],0
LB_3022:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2676_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2678:
NS_E_RDI_2678:
NS_E_2678_ETR_TBL:
NS_E_2678_TBL:
	push r14
; "0xr0"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,48
	jz LB_3080
	jmp NS_E_2678_MTC_0_failed
LB_3080:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,120
	jz LB_3081
	jmp NS_E_2678_MTC_0_failed
LB_3081:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,114
	jz LB_3082
	jmp NS_E_2678_MTC_0_failed
LB_3082:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,48
	jz LB_3083
	jmp NS_E_2678_MTC_0_failed
LB_3083:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3075
	btr QWORD [rdi],0
LB_3075:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2678_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2680:
NS_E_RDI_2680:
NS_E_2680_ETR_TBL:
NS_E_2680_TBL:
	push r14
; cha
	call NS_E_2682_ETR_TBL
	cmp r15,0
	jz LB_3095
	jmp NS_E_2680_MTC_0_failed
LB_3095:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; word
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_3099
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3100
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3100:
	jmp NS_E_2680_MTC_0_failed
LB_3099:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3090
	btr QWORD [rdi],1
LB_3090:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3091
	btr QWORD [rdi],0
LB_3091:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2680_MTC_0_failed:
	pop r14
	push r14
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2680_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2682:
NS_E_RDI_2682:
NS_E_2682_ETR_TBL:
NS_E_2682_TBL:
	push r14
; "a"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,97
	jz LB_3123
	jmp NS_E_2682_MTC_0_failed
LB_3123:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3118
	btr QWORD [rdi],0
LB_3118:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2682_MTC_0_failed:
	pop r14
	push r14
; "b"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,98
	jz LB_3115
	jmp NS_E_2682_MTC_1_failed
LB_3115:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3110
	btr QWORD [rdi],0
LB_3110:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2682_MTC_1_failed:
	pop r14
	push r14
; "c"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,99
	jz LB_3107
	jmp NS_E_2682_MTC_2_failed
LB_3107:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3102
	btr QWORD [rdi],0
LB_3102:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2682_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2684:
NS_E_RDI_2684:
NS_E_2684_ETR_TBL:
NS_E_2684_TBL:
	push r14
; word
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_3138
	jmp NS_E_2684_MTC_0_failed
LB_3138:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "."
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,46
	jz LB_3143
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3145
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3145:
	jmp NS_E_2684_MTC_0_failed
LB_3143:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; name
	call NS_E_2684_ETR_TBL
	cmp r15,0
	jz LB_3149
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3150
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3150:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3151
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3151:
	jmp NS_E_2684_MTC_0_failed
LB_3149:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_3132
	btr QWORD [rdi],2
LB_3132:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3133
	btr QWORD [rdi],1
LB_3133:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3134
	btr QWORD [rdi],0
LB_3134:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2684_MTC_0_failed:
	pop r14
	push r14
; word
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_3130
	jmp NS_E_2684_MTC_1_failed
LB_3130:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3126
	btr QWORD [rdi],0
LB_3126:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2684_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2686:
NS_E_RDI_2686:
NS_E_2686_ETR_TBL:
NS_E_2686_TBL:
	push r14
; dta_def_coprd
	call NS_E_2688_ETR_TBL
	cmp r15,0
	jz LB_3157
	jmp NS_E_2686_MTC_0_failed
LB_3157:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3153
	btr QWORD [rdi],0
LB_3153:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2686_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2688:
NS_E_RDI_2688:
NS_E_2688_ETR_TBL:
NS_E_2688_TBL:
	push r14
; "\226\136\144"
	jmp LB_3200
LB_3199:
	add r14,1
LB_3200:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3199
	cmp rax,10
	jz LB_3199
	cmp rax,32
	jz LB_3199
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_3202
	jmp NS_E_2688_MTC_0_failed
LB_3202:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_3203
	jmp NS_E_2688_MTC_0_failed
LB_3203:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_3204
	jmp NS_E_2688_MTC_0_failed
LB_3204:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_3210
LB_3209:
	add r14,1
LB_3210:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3209
	cmp rax,10
	jz LB_3209
	cmp rax,32
	jz LB_3209
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_3211
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3212
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3212:
	jmp NS_E_2688_MTC_0_failed
LB_3211:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_3215
LB_3214:
	add r14,1
LB_3215:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3214
	cmp rax,10
	jz LB_3214
	cmp rax,32
	jz LB_3214
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_3217
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3219
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3219:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3220
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3220:
	jmp NS_E_2688_MTC_0_failed
LB_3217:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_3223
LB_3222:
	add r14,1
LB_3223:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3222
	cmp rax,10
	jz LB_3222
	cmp rax,32
	jz LB_3222
	call NS_E_2694_ETR_TBL
	cmp r15,0
	jz LB_3224
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_3225
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_3225:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3226
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3226:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3227
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3227:
	jmp NS_E_2688_MTC_0_failed
LB_3224:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_3194
	btr QWORD [rdi],3
LB_3194:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_3195
	btr QWORD [rdi],2
LB_3195:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3196
	btr QWORD [rdi],1
LB_3196:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3197
	btr QWORD [rdi],0
LB_3197:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2688_MTC_0_failed:
	pop r14
	push r14
; "\226\136\144"
	jmp LB_3165
LB_3164:
	add r14,1
LB_3165:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3164
	cmp rax,10
	jz LB_3164
	cmp rax,32
	jz LB_3164
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_3167
	jmp NS_E_2688_MTC_1_failed
LB_3167:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_3168
	jmp NS_E_2688_MTC_1_failed
LB_3168:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_3169
	jmp NS_E_2688_MTC_1_failed
LB_3169:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_3175
LB_3174:
	add r14,1
LB_3175:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3174
	cmp rax,10
	jz LB_3174
	cmp rax,32
	jz LB_3174
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_3176
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3177
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3177:
	jmp NS_E_2688_MTC_1_failed
LB_3176:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_3180
LB_3179:
	add r14,1
LB_3180:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3179
	cmp rax,10
	jz LB_3179
	cmp rax,32
	jz LB_3179
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_3182
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3184
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3184:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3185
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3185:
	jmp NS_E_2688_MTC_1_failed
LB_3182:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_3188
LB_3187:
	add r14,1
LB_3188:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3187
	cmp rax,10
	jz LB_3187
	cmp rax,32
	jz LB_3187
	call NS_E_2694_ETR_TBL
	cmp r15,0
	jz LB_3189
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_3190
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_3190:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3191
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3191:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3192
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3192:
	jmp NS_E_2688_MTC_1_failed
LB_3189:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_3159
	btr QWORD [rdi],3
LB_3159:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_3160
	btr QWORD [rdi],2
LB_3160:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3161
	btr QWORD [rdi],1
LB_3161:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3162
	btr QWORD [rdi],0
LB_3162:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2688_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2690:
NS_E_RDI_2690:
NS_E_2690_ETR_TBL:
NS_E_2690_TBL:
	push r14
; op
	jmp LB_3253
LB_3252:
	add r14,1
LB_3253:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3252
	cmp rax,10
	jz LB_3252
	cmp rax,32
	jz LB_3252
	call NS_E_2692_ETR_TBL
	cmp r15,0
	jz LB_3254
	jmp NS_E_2690_MTC_0_failed
LB_3254:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn
	jmp LB_3257
LB_3256:
	add r14,1
LB_3257:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3256
	cmp rax,10
	jz LB_3256
	cmp rax,32
	jz LB_3256
	call NS_E_2702_ETR_TBL
	cmp r15,0
	jz LB_3258
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3259
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3259:
	jmp NS_E_2690_MTC_0_failed
LB_3258:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\226\138\162"
	jmp LB_3262
LB_3261:
	add r14,1
LB_3262:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3261
	cmp rax,10
	jz LB_3261
	cmp rax,32
	jz LB_3261
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_3264
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3274
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3274:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3275
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3275:
	jmp NS_E_2690_MTC_0_failed
LB_3264:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,138
	jz LB_3265
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3271
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3271:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3272
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3272:
	jmp NS_E_2690_MTC_0_failed
LB_3265:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,162
	jz LB_3266
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3268
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3268:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3269
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3269:
	jmp NS_E_2690_MTC_0_failed
LB_3266:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; reg_ptn
	jmp LB_3278
LB_3277:
	add r14,1
LB_3278:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3277
	cmp rax,10
	jz LB_3277
	cmp rax,32
	jz LB_3277
	call NS_E_2702_ETR_TBL
	cmp r15,0
	jz LB_3279
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_3280
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_3280:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3281
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3281:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3282
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3282:
	jmp NS_E_2690_MTC_0_failed
LB_3279:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_3247
	btr QWORD [rdi],3
LB_3247:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_3248
	btr QWORD [rdi],2
LB_3248:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3249
	btr QWORD [rdi],1
LB_3249:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3250
	btr QWORD [rdi],0
LB_3250:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2690_MTC_0_failed:
	pop r14
	push r14
; "\226\136\142"
	jmp LB_3233
LB_3232:
	add r14,1
LB_3233:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3232
	cmp rax,10
	jz LB_3232
	cmp rax,32
	jz LB_3232
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_3235
	jmp NS_E_2690_MTC_1_failed
LB_3235:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_3236
	jmp NS_E_2690_MTC_1_failed
LB_3236:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_3237
	jmp NS_E_2690_MTC_1_failed
LB_3237:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn
	jmp LB_3243
LB_3242:
	add r14,1
LB_3243:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3242
	cmp rax,10
	jz LB_3242
	cmp rax,32
	jz LB_3242
	call NS_E_2702_ETR_TBL
	cmp r15,0
	jz LB_3244
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3245
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3245:
	jmp NS_E_2690_MTC_1_failed
LB_3244:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3229
	btr QWORD [rdi],1
LB_3229:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3230
	btr QWORD [rdi],0
LB_3230:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2690_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2692:
NS_E_RDI_2692:
NS_E_2692_ETR_TBL:
NS_E_2692_TBL:
	push r14
; name
	jmp LB_3303
LB_3302:
	add r14,1
LB_3303:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3302
	cmp rax,10
	jz LB_3302
	cmp rax,32
	jz LB_3302
	call NS_E_2684_ETR_TBL
	cmp r15,0
	jz LB_3304
	jmp NS_E_2692_MTC_0_failed
LB_3304:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3300
	btr QWORD [rdi],0
LB_3300:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2692_MTC_0_failed:
	pop r14
	push r14
; "\194\187"
	jmp LB_3288
LB_3287:
	add r14,1
LB_3288:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3287
	cmp rax,10
	jz LB_3287
	cmp rax,32
	jz LB_3287
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_3290
	jmp NS_E_2692_MTC_1_failed
LB_3290:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,187
	jz LB_3291
	jmp NS_E_2692_MTC_1_failed
LB_3291:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; cst
	jmp LB_3296
LB_3295:
	add r14,1
LB_3296:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3295
	cmp rax,10
	jz LB_3295
	cmp rax,32
	jz LB_3295
	call NS_E_2678_ETR_TBL
	cmp r15,0
	jz LB_3297
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3298
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3298:
	jmp NS_E_2692_MTC_1_failed
LB_3297:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3284
	btr QWORD [rdi],1
LB_3284:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3285
	btr QWORD [rdi],0
LB_3285:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2692_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2694:
NS_E_RDI_2694:
NS_E_2694_ETR_TBL:
NS_E_2694_TBL:
	push r14
; type_imp
	call NS_E_2696_ETR_TBL
	cmp r15,0
	jz LB_3310
	jmp NS_E_2694_MTC_0_failed
LB_3310:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3306
	btr QWORD [rdi],0
LB_3306:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2694_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2696:
NS_E_RDI_2696:
NS_E_2696_ETR_TBL:
NS_E_2696_TBL:
	push r14
; type_app
	jmp LB_3323
LB_3322:
	add r14,1
LB_3323:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3322
	cmp rax,10
	jz LB_3322
	cmp rax,32
	jz LB_3322
	call NS_E_2698_ETR_TBL
	cmp r15,0
	jz LB_3324
	jmp NS_E_2696_MTC_0_failed
LB_3324:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\134\146"
	jmp LB_3327
LB_3326:
	add r14,1
LB_3327:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3326
	cmp rax,10
	jz LB_3326
	cmp rax,32
	jz LB_3326
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_3329
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3337
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3337:
	jmp NS_E_2696_MTC_0_failed
LB_3329:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,134
	jz LB_3330
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3335
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3335:
	jmp NS_E_2696_MTC_0_failed
LB_3330:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,146
	jz LB_3331
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3333
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3333:
	jmp NS_E_2696_MTC_0_failed
LB_3331:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_imp
	jmp LB_3340
LB_3339:
	add r14,1
LB_3340:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3339
	cmp rax,10
	jz LB_3339
	cmp rax,32
	jz LB_3339
	call NS_E_2696_ETR_TBL
	cmp r15,0
	jz LB_3341
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3342
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3342:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3343
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3343:
	jmp NS_E_2696_MTC_0_failed
LB_3341:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_3318
	btr QWORD [rdi],2
LB_3318:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3319
	btr QWORD [rdi],1
LB_3319:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3320
	btr QWORD [rdi],0
LB_3320:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2696_MTC_0_failed:
	pop r14
	push r14
; type_app
	jmp LB_3315
LB_3314:
	add r14,1
LB_3315:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3314
	cmp rax,10
	jz LB_3314
	cmp rax,32
	jz LB_3314
	call NS_E_2698_ETR_TBL
	cmp r15,0
	jz LB_3316
	jmp NS_E_2696_MTC_1_failed
LB_3316:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3312
	btr QWORD [rdi],0
LB_3312:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2696_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2698:
NS_E_RDI_2698:
NS_E_2698_ETR_TBL:
NS_E_2698_TBL:
	push r14
; type_atm
	jmp LB_3356
LB_3355:
	add r14,1
LB_3356:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3355
	cmp rax,10
	jz LB_3355
	cmp rax,32
	jz LB_3355
	call NS_E_2700_ETR_TBL
	cmp r15,0
	jz LB_3357
	jmp NS_E_2698_MTC_0_failed
LB_3357:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\151\130"
	jmp LB_3360
LB_3359:
	add r14,1
LB_3360:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3359
	cmp rax,10
	jz LB_3359
	cmp rax,32
	jz LB_3359
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_3362
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3370
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3370:
	jmp NS_E_2698_MTC_0_failed
LB_3362:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,151
	jz LB_3363
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3368
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3368:
	jmp NS_E_2698_MTC_0_failed
LB_3363:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,130
	jz LB_3364
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3366
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3366:
	jmp NS_E_2698_MTC_0_failed
LB_3364:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_atm
	jmp LB_3373
LB_3372:
	add r14,1
LB_3373:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3372
	cmp rax,10
	jz LB_3372
	cmp rax,32
	jz LB_3372
	call NS_E_2700_ETR_TBL
	cmp r15,0
	jz LB_3374
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3375
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3375:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3376
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3376:
	jmp NS_E_2698_MTC_0_failed
LB_3374:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_3351
	btr QWORD [rdi],2
LB_3351:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3352
	btr QWORD [rdi],1
LB_3352:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3353
	btr QWORD [rdi],0
LB_3353:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2698_MTC_0_failed:
	pop r14
	push r14
; type_atm
	jmp LB_3348
LB_3347:
	add r14,1
LB_3348:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3347
	cmp rax,10
	jz LB_3347
	cmp rax,32
	jz LB_3347
	call NS_E_2700_ETR_TBL
	cmp r15,0
	jz LB_3349
	jmp NS_E_2698_MTC_1_failed
LB_3349:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3345
	btr QWORD [rdi],0
LB_3345:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2698_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2700:
NS_E_RDI_2700:
NS_E_2700_ETR_TBL:
NS_E_2700_TBL:
	push r14
; word
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_3382
	jmp NS_E_2700_MTC_0_failed
LB_3382:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3378
	btr QWORD [rdi],0
LB_3378:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2700_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2702:
NS_E_RDI_2702:
NS_E_2702_ETR_TBL:
NS_E_2702_TBL:
	push r14
; "{"
	jmp LB_3395
LB_3394:
	add r14,1
LB_3395:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3394
	cmp rax,10
	jz LB_3394
	cmp rax,32
	jz LB_3394
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,123
	jz LB_3397
	jmp NS_E_2702_MTC_0_failed
LB_3397:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_3401
LB_3400:
	add r14,1
LB_3401:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3400
	cmp rax,10
	jz LB_3400
	cmp rax,32
	jz LB_3400
	call NS_E_2704_ETR_TBL
	cmp r15,0
	jz LB_3402
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3403
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3403:
	jmp NS_E_2702_MTC_0_failed
LB_3402:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "}"
	jmp LB_3406
LB_3405:
	add r14,1
LB_3406:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3405
	cmp rax,10
	jz LB_3405
	cmp rax,32
	jz LB_3405
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,125
	jz LB_3408
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_3410
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_3410:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3411
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3411:
	jmp NS_E_2702_MTC_0_failed
LB_3408:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_3390
	btr QWORD [rdi],2
LB_3390:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3391
	btr QWORD [rdi],1
LB_3391:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3392
	btr QWORD [rdi],0
LB_3392:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2702_MTC_0_failed:
	pop r14
	push r14
; reg
	jmp LB_3387
LB_3386:
	add r14,1
LB_3387:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3386
	cmp rax,10
	jz LB_3386
	cmp rax,32
	jz LB_3386
	call NS_E_2706_ETR_TBL
	cmp r15,0
	jz LB_3388
	jmp NS_E_2702_MTC_1_failed
LB_3388:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3384
	btr QWORD [rdi],0
LB_3384:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2702_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2704:
NS_E_RDI_2704:
NS_E_2704_ETR_TBL:
NS_E_2704_TBL:
	push r14
; reg
	jmp LB_3418
LB_3417:
	add r14,1
LB_3418:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3417
	cmp rax,10
	jz LB_3417
	cmp rax,32
	jz LB_3417
	call NS_E_2706_ETR_TBL
	cmp r15,0
	jz LB_3419
	jmp NS_E_2704_MTC_0_failed
LB_3419:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn_lst
	jmp LB_3422
LB_3421:
	add r14,1
LB_3422:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3421
	cmp rax,10
	jz LB_3421
	cmp rax,32
	jz LB_3421
	call NS_E_2704_ETR_TBL
	cmp r15,0
	jz LB_3423
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3424
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3424:
	jmp NS_E_2704_MTC_0_failed
LB_3423:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3414
	btr QWORD [rdi],1
LB_3414:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3415
	btr QWORD [rdi],0
LB_3415:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2704_MTC_0_failed:
	pop r14
	push r14
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2704_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2706:
NS_E_RDI_2706:
NS_E_2706_ETR_TBL:
NS_E_2706_TBL:
	push r14
; "%"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,37
	jz LB_3446
	jmp NS_E_2706_MTC_0_failed
LB_3446:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_3451
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_3452
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_3452:
	jmp NS_E_2706_MTC_0_failed
LB_3451:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_3440
	btr QWORD [rdi],1
LB_3440:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3441
	btr QWORD [rdi],0
LB_3441:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2706_MTC_0_failed:
	pop r14
	push r14
; word
	jmp LB_3437
LB_3436:
	add r14,1
LB_3437:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_3436
	cmp rax,10
	jz LB_3436
	cmp rax,32
	jz LB_3436
	call NS_E_2680_ETR_TBL
	cmp r15,0
	jz LB_3438
	jmp NS_E_2706_MTC_1_failed
LB_3438:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3434
	btr QWORD [rdi],0
LB_3434:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2706_MTC_1_failed:
	pop r14
	push r14
; "_"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,95
	jz LB_3431
	jmp NS_E_2706_MTC_2_failed
LB_3431:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	pop rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_3426
	btr QWORD [rdi],0
LB_3426:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2706_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_3465:
NS_E_RDI_3465:
; » _^ ..
	mov rax,16
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 a \n"
	mov rsi,0x_0a_20_61_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1],rsi
	add rdi,8
; "\226\136\142\226\136\142 \n"
	mov rsi,0x_0a_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1],rsi
	add rdi,8
; //
	mov r13,rax
	btr r12,0
; 	» "a" _ ⊢ 1' : %_3455
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; » 0xr0 |~ {  } ⊢ %_3456 : %_3456
 ; {>  %_3455~1':_stg %_3454~0':_stg }
; 	» 0xr0 _ ⊢ 2' : %_3456
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f2670 { %_3454 %_3456 } ⊢ { %_3457 %_3458 %_3459 } : { %_3457 %_3458 %_3459 }
 ; {>  %_3455~1':_stg %_3454~0':_stg %_3456~2':_r64 }
; _f2670 { 0' 2' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' } ⊢ { 0' 1' }
	mov r14,r15
	bt r12,2
	jc LB_3468
	btr r12,1
	jmp LB_3469
LB_3468:
	bts r12,1
LB_3469:
	call NS_E_2670
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 2' 3' }
	mov r9,r8
	bt r12,3
	jc LB_3470
	btr r12,4
	jmp LB_3471
LB_3470:
	bts r12,4
LB_3471:
	mov r8,r9
	bt r12,4
	jc LB_3474
	btr r12,3
	jmp LB_3475
LB_3474:
	bts r12,3
LB_3475:
	mov rsi,0
	bt r12,3
	jc LB_3472
	bts rsi,17
	bt r8,0
	jc LB_3472
	jmp LB_3473
LB_3472:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,3
LB_3473:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
	mov r15,r14
	bt r12,1
	jc LB_3476
	btr r12,2
	jmp LB_3477
LB_3476:
	bts r12,2
LB_3477:
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_3466
	btr r12,1
	jmp LB_3467
LB_3466:
	bts r12,1
LB_3467:
	add rsp,16
; _f15 { %_3455 %_3458 %_3459 } ⊢ { %_3460 %_3461 %_3462 } : { %_3460 %_3461 %_3462 }
 ; {>  %_3457~0':_stg %_3455~1':_stg %_3459~3':(_opn)◂(_p2669) %_3458~2':_r64 }
; _f15 { 1' 2' 3' } ⊢ { 1' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_3482
	btr r12,4
	jmp LB_3483
LB_3482:
	bts r12,4
LB_3483:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_3480
	btr QWORD [rdi],0
	jmp LB_3481
LB_3480:
	bts QWORD [rdi],0
LB_3481:
	mov r9,r15
	bt r12,2
	jc LB_3486
	btr r12,4
	jmp LB_3487
LB_3486:
	bts r12,4
LB_3487:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_3484
	btr QWORD [rdi],1
	jmp LB_3485
LB_3484:
	bts QWORD [rdi],1
LB_3485:
	mov r9,r8
	bt r12,3
	jc LB_3490
	btr r12,4
	jmp LB_3491
LB_3490:
	bts r12,4
LB_3491:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_3488
	btr QWORD [rdi],2
	jmp LB_3489
LB_3488:
	bts QWORD [rdi],2
LB_3489:
	call NS_E_15
; _emt_mov_ptn_to_ptn 0' ⊢ { 1' 2' 3' }
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_3494
	btr r12,4
	jmp LB_3495
LB_3494:
	bts r12,4
LB_3495:
	mov r14,r9
	bt r12,4
	jc LB_3492
	btr r12,1
	jmp LB_3493
LB_3492:
	bts r12,1
LB_3493:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_3498
	btr r12,4
	jmp LB_3499
LB_3498:
	bts r12,4
LB_3499:
	mov r15,r9
	bt r12,4
	jc LB_3496
	btr r12,2
	jmp LB_3497
LB_3496:
	bts r12,2
LB_3497:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_3502
	btr r12,4
	jmp LB_3503
LB_3502:
	bts r12,4
LB_3503:
	mov r8,r9
	bt r12,4
	jc LB_3500
	btr r12,3
	jmp LB_3501
LB_3500:
	bts r12,3
LB_3501:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_3478
	btr r12,0
	jmp LB_3479
LB_3478:
	bts r12,0
LB_3479:
	add rsp,16
; _f14 {  } ⊢ %_3463 : %_3463
 ; {>  %_3457~0':_stg %_3462~3':(_opn)◂(_p2669) %_3461~2':_r64 %_3460~1':_stg }
; _f14 {  } ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_3512
	btr r12,4
	jmp LB_3513
LB_3512:
	bts r12,4
LB_3513:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_3510
	btr r12,3
	jmp LB_3511
LB_3510:
	bts r12,3
LB_3511:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_3508
	btr r12,2
	jmp LB_3509
LB_3508:
	bts r12,2
LB_3509:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_3506
	btr r12,1
	jmp LB_3507
LB_3506:
	bts r12,1
LB_3507:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_3504
	btr r12,0
	jmp LB_3505
LB_3504:
	bts r12,0
LB_3505:
	add rsp,40
; _f15 %_3463 ⊢ %_3464 : %_3464
 ; {>  %_3457~0':_stg %_3463~4':_stg %_3462~3':(_opn)◂(_p2669) %_3461~2':_r64 %_3460~1':_stg }
; _f15 4' ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 4' ⊢ 0'
	mov r13,r9
	bt r12,4
	jc LB_3522
	btr r12,0
	jmp LB_3523
LB_3522:
	bts r12,0
LB_3523:
	call NS_E_15
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_3524
	btr r12,4
	jmp LB_3525
LB_3524:
	bts r12,4
LB_3525:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_3520
	btr r12,3
	jmp LB_3521
LB_3520:
	bts r12,3
LB_3521:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_3518
	btr r12,2
	jmp LB_3519
LB_3518:
	bts r12,2
LB_3519:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_3516
	btr r12,1
	jmp LB_3517
LB_3516:
	bts r12,1
LB_3517:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_3514
	btr r12,0
	jmp LB_3515
LB_3514:
	bts r12,0
LB_3515:
	add rsp,40
; ∎ {  }
 ; {>  %_3457~0':_stg %_3462~3':(_opn)◂(_p2669) %_3464~4':_stg %_3461~2':_r64 %_3460~1':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_3526
	mov rdi,r13
	call dlt
LB_3526:
	bt r12,3
	jc LB_3527
	mov rdi,r8
	call dlt
LB_3527:
	bt r12,4
	jc LB_3528
	mov rdi,r9
	call dlt
LB_3528:
	bt r12,2
	jc LB_3529
	mov rdi,r15
	call dlt
LB_3529:
	bt r12,1
	jc LB_3530
	mov rdi,r14
	call dlt
LB_3530:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_2659:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2659
	NS_E_DYN_2661:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2661
	NS_E_DYN_2662:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2662
	NS_E_DYN_2663:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2663
	NS_E_DYN_2664:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2664
	NS_E_DYN_2707:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2708:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2666:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2666
	NS_E_DYN_2709:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2710:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2711:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_2712:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_2668:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2668
	NS_E_DYN_2713:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2714:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2670:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2670
	NS_E_DYN_2715:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2716:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2672:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2672
	NS_E_DYN_2717:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2718:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2674:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2674
	NS_E_DYN_2719:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2720:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2676:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2676
	NS_E_DYN_2721:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2678:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2678
	NS_E_DYN_2722:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2723:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2680:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2680
	NS_E_DYN_2724:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2725:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2726:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_2682:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2682
	NS_E_DYN_2727:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2728:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2684:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2684
	NS_E_DYN_2729:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2686:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2686
	NS_E_DYN_2730:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2731:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2688:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2688
	NS_E_DYN_2732:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2733:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2690:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2690
	NS_E_DYN_2734:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2735:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2692:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2692
	NS_E_DYN_2736:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2694:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2694
	NS_E_DYN_2737:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2738:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2696:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2696
	NS_E_DYN_2739:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2740:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2698:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2698
	NS_E_DYN_2741:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2700:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2700
	NS_E_DYN_2742:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2743:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2702:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2702
	NS_E_DYN_2744:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2745:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2704:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2704
	NS_E_DYN_2746:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2747:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2748:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_2706:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2706
	CST_DYN_3465:
		dq 0x0001_0001_00_82_ffff
		dq 1
