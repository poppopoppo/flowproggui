%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_943
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
	call emt_q
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
NS_E_780:
NS_E_RDI_780:
NS_E_780_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_781
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_781:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_783:
NS_E_RDI_783:
NS_E_783_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_783_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_783_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_784:
NS_E_RDI_784:
NS_E_784_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_784_LB_0
	cmp r11,57
	ja NS_E_784_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_784_LB_0:
	mov rax,0
	ret
NS_E_786:
NS_E_RDI_786:
NS_E_786_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_786_LB_0
	cmp r11,122
	ja NS_E_786_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_786_LB_0:
	mov rax,0
	ret
NS_E_785:
NS_E_RDI_785:
NS_E_785_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_785_LB_0
	cmp r11,90
	ja NS_E_785_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_785_LB_0:
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
	mov rdi,r8
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
	mov rax,r15
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
	mov rax,r15
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
	mov r15,rax
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
NS_E_782:
NS_E_RDI_782:
NS_E_782_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	push r14
	push r15
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
	pop r15
	pop r14
	cmp rdi,0
	jz NS_E_782_LB_0
	mov r14,rsi
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_782_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_812:
; 	|» { 0' 1' 2' }
NS_E_RDI_812:
; _f32 { %_788 %_787 } ⊢ { %_790 %_791 %_792 } : { %_790 %_791 %_792 }
 ; {>  %_789~2':_r64 %_787~0':_r64 %_788~1':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_937
; /
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_921
	btr r12,4
	jmp LB_922
LB_921:
	bts r12,4
LB_922:
; _emt_mov_ptn_to_ptn 1' ⊢ 5'
	mov r10,r14
	bt r12,1
	jc LB_923
	btr r12,5
	jmp LB_924
LB_923:
	bts r12,5
LB_924:
; _emt_mov_ptn_to_ptn 3' ⊢ 6'
	mov r11,r8
	bt r12,3
	jc LB_925
	btr r12,6
	jmp LB_926
LB_925:
	bts r12,6
LB_926:
; _emt_mov_ptn_to_ptn 2' ⊢ 7'
	mov rcx,r15
	bt r12,2
	jc LB_927
	btr r12,7
	jmp LB_928
LB_927:
	bts r12,7
LB_928:
	jmp MTC_LB_920
LB_937:
; /0/
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_929
	btr r12,4
	jmp LB_930
LB_929:
	bts r12,4
LB_930:
; _emt_mov_ptn_to_ptn 1' ⊢ 5'
	mov r10,r14
	bt r12,1
	jc LB_931
	btr r12,5
	jmp LB_932
LB_931:
	bts r12,5
LB_932:
; _emt_mov_ptn_to_ptn 3' ⊢ 6'
	mov r11,r8
	bt r12,3
	jc LB_933
	btr r12,6
	jmp LB_934
LB_933:
	bts r12,6
LB_934:
; _emt_mov_ptn_to_ptn 2' ⊢ 7'
	mov rcx,r15
	bt r12,2
	jc LB_935
	btr r12,7
	jmp LB_936
LB_935:
	bts r12,7
LB_936:
	jmp MTC_LB_919
MTC_LB_920:
; _f35 %_791 ⊢ { %_793 %_794 } : { %_793 %_794 }
 ; {>  %_789~7':_r64 %_789~2':_r64 %_792~6':_r64 %_792~3':_r64 %_791~4':_r64 %_791~0':_r64 %_790~5':_r64 %_790~1':_r64 }
	mov rdx,r9
; _f35 %_790 ⊢ { %_795 %_796 } : { %_795 %_796 }
 ; {>  %_789~7':_r64 %_789~2':_r64 %_792~6':_r64 %_792~3':_r64 %_791~0':_r64 %_790~5':_r64 %_790~1':_r64 %_793~4':_r64 %_794~8':_r64 }
	mov rdi,r10
	mov QWORD [st_vct+8*9],rdi
; _f35 %_789 ⊢ { %_797 %_798 } : { %_797 %_798 }
 ; {>  %_796~9':_r64 %_789~7':_r64 %_789~2':_r64 %_792~6':_r64 %_792~3':_r64 %_791~0':_r64 %_795~5':_r64 %_790~1':_r64 %_793~4':_r64 %_794~8':_r64 }
	mov rdi,rcx
	mov QWORD [st_vct+8*10],rdi
; _f37 %_794 ⊢ %_799 : %_799
 ; {>  %_798~10':_r64 %_796~9':_r64 %_789~2':_r64 %_797~7':_r64 %_792~6':_r64 %_792~3':_r64 %_791~0':_r64 %_795~5':_r64 %_790~1':_r64 %_793~4':_r64 %_794~8':_r64 }
	sub rdx,1
; _f812 { %_799 %_796 %_798 } ⊢ %_800 : %_800
 ; {>  %_798~10':_r64 %_799~8':_r64 %_796~9':_r64 %_789~2':_r64 %_797~7':_r64 %_792~6':_r64 %_792~3':_r64 %_791~0':_r64 %_795~5':_r64 %_790~1':_r64 %_793~4':_r64 }
; _f812 { 8' 9' 10' } ⊢ 8'
; push_iv 
	sub rsp,72
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r9
	mov QWORD [rsp+8+8*5],r10
	mov QWORD [rsp+8+8*6],r11
	mov QWORD [rsp+8+8*7],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 8' 9' 10' } ⊢ { 0' 1' 2' }
	mov r13,rdx
	bt r12,8
	jc LB_829
	btr r12,0
	jmp LB_830
LB_829:
	bts r12,0
LB_830:
	mov r14,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_831
	btr r12,1
	jmp LB_832
LB_831:
	bts r12,1
LB_832:
	mov r15,QWORD [st_vct+8*10]
	bt r12,10
	jc LB_833
	btr r12,2
	jmp LB_834
LB_833:
	bts r12,2
LB_834:
	call NS_E_812
; _emt_mov_ptn_to_ptn 0' ⊢ 8'
	mov rdx,r13
	bt r12,0
	jc LB_835
	btr r12,8
	jmp LB_836
LB_835:
	bts r12,8
LB_836:
; pop_iv
	mov rcx,QWORD [rsp+8+8*7]
	bt QWORD [rsp],7
	jc LB_827
	btr r12,7
	jmp LB_828
LB_827:
	bts r12,7
LB_828:
	mov r11,QWORD [rsp+8+8*6]
	bt QWORD [rsp],6
	jc LB_825
	btr r12,6
	jmp LB_826
LB_825:
	bts r12,6
LB_826:
	mov r10,QWORD [rsp+8+8*5]
	bt QWORD [rsp],5
	jc LB_823
	btr r12,5
	jmp LB_824
LB_823:
	bts r12,5
LB_824:
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_821
	btr r12,4
	jmp LB_822
LB_821:
	bts r12,4
LB_822:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_819
	btr r12,3
	jmp LB_820
LB_819:
	bts r12,3
LB_820:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_817
	btr r12,2
	jmp LB_818
LB_817:
	bts r12,2
LB_818:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_815
	btr r12,1
	jmp LB_816
LB_815:
	bts r12,1
LB_816:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_813
	btr r12,0
	jmp LB_814
LB_813:
	bts r12,0
LB_814:
	add rsp,72
; _f35 %_793 ⊢ { %_801 %_802 } : { %_801 %_802 }
 ; {>  %_789~2':_r64 %_797~7':_r64 %_792~6':_r64 %_792~3':_r64 %_791~0':_r64 %_795~5':_r64 %_790~1':_r64 %_793~4':_r64 %_800~8':_r64 }
	mov rdi,r9
	mov QWORD [st_vct+8*9],rdi
; _f35 %_795 ⊢ { %_803 %_804 } : { %_803 %_804 }
 ; {>  %_789~2':_r64 %_797~7':_r64 %_792~6':_r64 %_792~3':_r64 %_791~0':_r64 %_795~5':_r64 %_790~1':_r64 %_801~4':_r64 %_800~8':_r64 %_802~9':_r64 }
	mov rdi,r10
	mov QWORD [st_vct+8*10],rdi
; _f35 %_797 ⊢ { %_805 %_806 } : { %_805 %_806 }
 ; {>  %_789~2':_r64 %_804~10':_r64 %_803~5':_r64 %_797~7':_r64 %_792~6':_r64 %_792~3':_r64 %_791~0':_r64 %_790~1':_r64 %_801~4':_r64 %_800~8':_r64 %_802~9':_r64 }
	mov rdi,rcx
	mov QWORD [st_vct+8*11],rdi
; _f37 %_804 ⊢ %_807 : %_807
 ; {>  %_789~2':_r64 %_804~10':_r64 %_803~5':_r64 %_792~6':_r64 %_792~3':_r64 %_806~11':_r64 %_791~0':_r64 %_790~1':_r64 %_801~4':_r64 %_800~8':_r64 %_805~7':_r64 %_802~9':_r64 }
	sub QWORD [st_vct+8*10],1
; _f812 { %_807 %_806 %_802 } ⊢ %_808 : %_808
 ; {>  %_807~10':_r64 %_789~2':_r64 %_803~5':_r64 %_792~6':_r64 %_792~3':_r64 %_806~11':_r64 %_791~0':_r64 %_790~1':_r64 %_801~4':_r64 %_800~8':_r64 %_805~7':_r64 %_802~9':_r64 }
; _f812 { 10' 11' 9' } ⊢ 9'
; push_iv 
	sub rsp,80
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r9
	mov QWORD [rsp+8+8*5],r10
	mov QWORD [rsp+8+8*6],r11
	mov QWORD [rsp+8+8*7],rcx
	mov QWORD [rsp+8+8*8],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 10' 11' 9' } ⊢ { 0' 1' 2' }
	mov r13,QWORD [st_vct+8*10]
	bt r12,10
	jc LB_855
	btr r12,0
	jmp LB_856
LB_855:
	bts r12,0
LB_856:
	mov r14,QWORD [st_vct+8*11]
	bt r12,11
	jc LB_857
	btr r12,1
	jmp LB_858
LB_857:
	bts r12,1
LB_858:
	mov r15,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_859
	btr r12,2
	jmp LB_860
LB_859:
	bts r12,2
LB_860:
	call NS_E_812
; _emt_mov_ptn_to_ptn 0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_861
	btr r12,9
	jmp LB_862
LB_861:
	bts r12,9
LB_862:
; pop_iv
	mov rdx,QWORD [rsp+8+8*8]
	bt QWORD [rsp],8
	jc LB_853
	btr r12,8
	jmp LB_854
LB_853:
	bts r12,8
LB_854:
	mov rcx,QWORD [rsp+8+8*7]
	bt QWORD [rsp],7
	jc LB_851
	btr r12,7
	jmp LB_852
LB_851:
	bts r12,7
LB_852:
	mov r11,QWORD [rsp+8+8*6]
	bt QWORD [rsp],6
	jc LB_849
	btr r12,6
	jmp LB_850
LB_849:
	bts r12,6
LB_850:
	mov r10,QWORD [rsp+8+8*5]
	bt QWORD [rsp],5
	jc LB_847
	btr r12,5
	jmp LB_848
LB_847:
	bts r12,5
LB_848:
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_845
	btr r12,4
	jmp LB_846
LB_845:
	bts r12,4
LB_846:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_843
	btr r12,3
	jmp LB_844
LB_843:
	bts r12,3
LB_844:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_841
	btr r12,2
	jmp LB_842
LB_841:
	bts r12,2
LB_842:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_839
	btr r12,1
	jmp LB_840
LB_839:
	bts r12,1
LB_840:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_837
	btr r12,0
	jmp LB_838
LB_837:
	bts r12,0
LB_838:
	add rsp,80
; _f37 %_805 ⊢ %_809 : %_809
 ; {>  %_808~9':_r64 %_789~2':_r64 %_803~5':_r64 %_792~6':_r64 %_792~3':_r64 %_791~0':_r64 %_790~1':_r64 %_801~4':_r64 %_800~8':_r64 %_805~7':_r64 }
	sub rcx,1
; _f812 { %_809 %_801 %_803 } ⊢ %_810 : %_810
 ; {>  %_808~9':_r64 %_789~2':_r64 %_809~7':_r64 %_803~5':_r64 %_792~6':_r64 %_792~3':_r64 %_791~0':_r64 %_790~1':_r64 %_801~4':_r64 %_800~8':_r64 }
; _f812 { 7' 4' 5' } ⊢ 4'
; push_iv 
	sub rsp,64
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp+8+8*5],rdx
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [rsp+8+8*6],rdi
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 7' 4' 5' } ⊢ { 0' 1' 2' }
	mov r13,rcx
	bt r12,7
	jc LB_877
	btr r12,0
	jmp LB_878
LB_877:
	bts r12,0
LB_878:
	mov r14,r9
	bt r12,4
	jc LB_879
	btr r12,1
	jmp LB_880
LB_879:
	bts r12,1
LB_880:
	mov r15,r10
	bt r12,5
	jc LB_881
	btr r12,2
	jmp LB_882
LB_881:
	bts r12,2
LB_882:
	call NS_E_812
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_883
	btr r12,4
	jmp LB_884
LB_883:
	bts r12,4
LB_884:
; pop_iv
	mov rdi,QWORD [rsp+8+8*6]
	mov QWORD [st_vct+8*9],rdi
	bt QWORD [rsp],9
	jc LB_875
	btr r12,9
	jmp LB_876
LB_875:
	bts r12,9
LB_876:
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD [rsp],8
	jc LB_873
	btr r12,8
	jmp LB_874
LB_873:
	bts r12,8
LB_874:
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD [rsp],6
	jc LB_871
	btr r12,6
	jmp LB_872
LB_871:
	bts r12,6
LB_872:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_869
	btr r12,3
	jmp LB_870
LB_869:
	bts r12,3
LB_870:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_867
	btr r12,2
	jmp LB_868
LB_867:
	bts r12,2
LB_868:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_865
	btr r12,1
	jmp LB_866
LB_865:
	bts r12,1
LB_866:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_863
	btr r12,0
	jmp LB_864
LB_863:
	bts r12,0
LB_864:
	add rsp,64
; _f812 { %_800 %_808 %_810 } ⊢ %_811 : %_811
 ; {>  %_808~9':_r64 %_789~2':_r64 %_810~4':_r64 %_792~6':_r64 %_792~3':_r64 %_791~0':_r64 %_790~1':_r64 %_800~8':_r64 }
; _f812 { 8' 9' 4' } ⊢ 4'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 8' 9' 4' } ⊢ { 0' 1' 2' }
	mov r13,rdx
	bt r12,8
	jc LB_895
	btr r12,0
	jmp LB_896
LB_895:
	bts r12,0
LB_896:
	mov r14,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_897
	btr r12,1
	jmp LB_898
LB_897:
	bts r12,1
LB_898:
	mov r15,r9
	bt r12,4
	jc LB_899
	btr r12,2
	jmp LB_900
LB_899:
	bts r12,2
LB_900:
	call NS_E_812
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_901
	btr r12,4
	jmp LB_902
LB_901:
	bts r12,4
LB_902:
; pop_iv
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD [rsp],6
	jc LB_893
	btr r12,6
	jmp LB_894
LB_893:
	bts r12,6
LB_894:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_891
	btr r12,3
	jmp LB_892
LB_891:
	bts r12,3
LB_892:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_889
	btr r12,2
	jmp LB_890
LB_889:
	bts r12,2
LB_890:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_887
	btr r12,1
	jmp LB_888
LB_887:
	bts r12,1
LB_888:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_885
	btr r12,0
	jmp LB_886
LB_885:
	bts r12,0
LB_886:
	add rsp,48
; ∎ %_811
 ; {>  %_789~2':_r64 %_811~4':_r64 %_792~6':_r64 %_792~3':_r64 %_791~0':_r64 %_790~1':_r64 }
; 	∎ 4'
	bt r12,2
	jc LB_903
	mov rdi,r15
	call dlt
LB_903:
	bt r12,6
	jc LB_904
	mov rdi,r11
	call dlt
LB_904:
	bt r12,3
	jc LB_905
	mov rdi,r8
	call dlt
LB_905:
	bt r12,0
	jc LB_906
	mov rdi,r13
	call dlt
LB_906:
	bt r12,1
	jc LB_907
	mov rdi,r14
	call dlt
LB_907:
; _emt_mov_ptn_to_ptn 4' ⊢ 0'
	mov r13,r9
	bt r12,4
	jc LB_908
	btr r12,0
	jmp LB_909
LB_908:
	bts r12,0
LB_909:
	ret
MTC_LB_919:
; ∎ %_789
 ; {>  %_789~7':_r64 %_789~2':_r64 %_792~6':_r64 %_792~3':_r64 %_791~4':_r64 %_791~0':_r64 %_790~5':_r64 %_790~1':_r64 }
; 	∎ 7'
	bt r12,2
	jc LB_910
	mov rdi,r15
	call dlt
LB_910:
	bt r12,6
	jc LB_911
	mov rdi,r11
	call dlt
LB_911:
	bt r12,3
	jc LB_912
	mov rdi,r8
	call dlt
LB_912:
	bt r12,4
	jc LB_913
	mov rdi,r9
	call dlt
LB_913:
	bt r12,0
	jc LB_914
	mov rdi,r13
	call dlt
LB_914:
	bt r12,5
	jc LB_915
	mov rdi,r10
	call dlt
LB_915:
	bt r12,1
	jc LB_916
	mov rdi,r14
	call dlt
LB_916:
; _emt_mov_ptn_to_ptn 7' ⊢ 0'
	mov r13,rcx
	bt r12,7
	jc LB_917
	btr r12,0
	jmp LB_918
LB_917:
	bts r12,0
LB_918:
	ret
NS_E_943:
NS_E_RDI_943:
; » 0xr14 |~ {  } ⊢ %_938 : %_938
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_938
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_939 : %_939
 ; {>  %_938~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_939
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_940 : %_940
 ; {>  %_938~0':_r64 %_939~1':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_940
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f812 { %_938 %_939 %_940 } ⊢ %_941 : %_941
 ; {>  %_940~2':_r64 %_938~0':_r64 %_939~1':_r64 }
; _f812 { 0' 1' 2' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_812
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; _f20 %_941 ⊢ %_942 : %_942
 ; {>  %_941~0':_r64 }
; _f20 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_942~0':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_944
	mov rdi,r13
	call dlt
LB_944:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_973:
; 	|» { 0' 1' 2' }
NS_E_RDI_973:
; _f32 { %_946 %_945 } ⊢ { %_948 %_949 %_950 } : { %_948 %_949 %_950 }
 ; {>  %_946~1':_r64 %_945~0':_r64 %_947~2':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_1128
; /
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_1112
	btr r12,4
	jmp LB_1113
LB_1112:
	bts r12,4
LB_1113:
; _emt_mov_ptn_to_ptn 1' ⊢ 5'
	mov r10,r14
	bt r12,1
	jc LB_1114
	btr r12,5
	jmp LB_1115
LB_1114:
	bts r12,5
LB_1115:
; _emt_mov_ptn_to_ptn 3' ⊢ 6'
	mov r11,r8
	bt r12,3
	jc LB_1116
	btr r12,6
	jmp LB_1117
LB_1116:
	bts r12,6
LB_1117:
; _emt_mov_ptn_to_ptn 2' ⊢ 7'
	mov rcx,r15
	bt r12,2
	jc LB_1118
	btr r12,7
	jmp LB_1119
LB_1118:
	bts r12,7
LB_1119:
	jmp MTC_LB_1111
LB_1128:
; /0/
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_1120
	btr r12,4
	jmp LB_1121
LB_1120:
	bts r12,4
LB_1121:
; _emt_mov_ptn_to_ptn 1' ⊢ 5'
	mov r10,r14
	bt r12,1
	jc LB_1122
	btr r12,5
	jmp LB_1123
LB_1122:
	bts r12,5
LB_1123:
; _emt_mov_ptn_to_ptn 3' ⊢ 6'
	mov r11,r8
	bt r12,3
	jc LB_1124
	btr r12,6
	jmp LB_1125
LB_1124:
	bts r12,6
LB_1125:
; _emt_mov_ptn_to_ptn 2' ⊢ 7'
	mov rcx,r15
	bt r12,2
	jc LB_1126
	btr r12,7
	jmp LB_1127
LB_1126:
	bts r12,7
LB_1127:
	jmp MTC_LB_1110
MTC_LB_1111:
; _f37 %_949 ⊢ %_951 : %_951
 ; {>  %_950~6':_r64 %_950~3':_r64 %_948~5':_r64 %_948~1':_r64 %_949~4':_r64 %_949~0':_r64 %_947~7':_r64 %_947~2':_r64 }
	sub r9,1
; _f973 { %_951 %_948 %_947 } ⊢ { %_952 %_953 %_954 %_955 } : { %_952 %_953 %_954 %_955 }
 ; {>  %_950~6':_r64 %_950~3':_r64 %_951~4':_r64 %_948~5':_r64 %_948~1':_r64 %_949~0':_r64 %_947~7':_r64 %_947~2':_r64 }
; _f973 { 4' 5' 7' } ⊢ { 4' 5' 7' 8' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 7' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,4
	jc LB_984
	btr r12,0
	jmp LB_985
LB_984:
	bts r12,0
LB_985:
	mov r14,r10
	bt r12,5
	jc LB_986
	btr r12,1
	jmp LB_987
LB_986:
	bts r12,1
LB_987:
	mov r15,rcx
	bt r12,7
	jc LB_988
	btr r12,2
	jmp LB_989
LB_988:
	bts r12,2
LB_989:
	call NS_E_973
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 4' 5' 7' 8' }
	mov r9,r13
	bt r12,0
	jc LB_990
	btr r12,4
	jmp LB_991
LB_990:
	bts r12,4
LB_991:
	mov r10,r14
	bt r12,1
	jc LB_992
	btr r12,5
	jmp LB_993
LB_992:
	bts r12,5
LB_993:
	mov rcx,r15
	bt r12,2
	jc LB_994
	btr r12,7
	jmp LB_995
LB_994:
	bts r12,7
LB_995:
	mov rdx,r8
	bt r12,3
	jc LB_996
	btr r12,8
	jmp LB_997
LB_996:
	bts r12,8
LB_997:
; pop_iv
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD [rsp],6
	jc LB_982
	btr r12,6
	jmp LB_983
LB_982:
	bts r12,6
LB_983:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_980
	btr r12,3
	jmp LB_981
LB_980:
	bts r12,3
LB_981:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_978
	btr r12,2
	jmp LB_979
LB_978:
	bts r12,2
LB_979:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_976
	btr r12,1
	jmp LB_977
LB_976:
	bts r12,1
LB_977:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_974
	btr r12,0
	jmp LB_975
LB_974:
	bts r12,0
LB_975:
	add rsp,48
; _f38 %_952 ⊢ %_956 : %_956
 ; {>  %_953~5':_r64 %_954~7':_r64 %_950~6':_r64 %_950~3':_r64 %_948~1':_r64 %_949~0':_r64 %_955~8':_r64 %_952~4':_r64 %_947~2':_r64 }
	add r9,1
; _f37 %_953 ⊢ %_957 : %_957
 ; {>  %_956~4':_r64 %_953~5':_r64 %_954~7':_r64 %_950~6':_r64 %_950~3':_r64 %_948~1':_r64 %_949~0':_r64 %_955~8':_r64 %_947~2':_r64 }
	sub r10,1
; _f973 { %_956 %_957 %_954 } ⊢ { %_958 %_959 %_960 %_961 } : { %_958 %_959 %_960 %_961 }
 ; {>  %_956~4':_r64 %_954~7':_r64 %_950~6':_r64 %_950~3':_r64 %_948~1':_r64 %_949~0':_r64 %_955~8':_r64 %_947~2':_r64 %_957~5':_r64 }
; _f973 { 4' 5' 7' } ⊢ { 4' 5' 7' 9' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp+8+8*5],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 7' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,4
	jc LB_1010
	btr r12,0
	jmp LB_1011
LB_1010:
	bts r12,0
LB_1011:
	mov r14,r10
	bt r12,5
	jc LB_1012
	btr r12,1
	jmp LB_1013
LB_1012:
	bts r12,1
LB_1013:
	mov r15,rcx
	bt r12,7
	jc LB_1014
	btr r12,2
	jmp LB_1015
LB_1014:
	bts r12,2
LB_1015:
	call NS_E_973
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 4' 5' 7' 9' }
	mov r9,r13
	bt r12,0
	jc LB_1016
	btr r12,4
	jmp LB_1017
LB_1016:
	bts r12,4
LB_1017:
	mov r10,r14
	bt r12,1
	jc LB_1018
	btr r12,5
	jmp LB_1019
LB_1018:
	bts r12,5
LB_1019:
	mov rcx,r15
	bt r12,2
	jc LB_1020
	btr r12,7
	jmp LB_1021
LB_1020:
	bts r12,7
LB_1021:
	mov rdi,r8
	mov QWORD [st_vct+8*9],rdi
	bt r12,3
	jc LB_1022
	btr r12,9
	jmp LB_1023
LB_1022:
	bts r12,9
LB_1023:
; pop_iv
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD [rsp],8
	jc LB_1008
	btr r12,8
	jmp LB_1009
LB_1008:
	bts r12,8
LB_1009:
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD [rsp],6
	jc LB_1006
	btr r12,6
	jmp LB_1007
LB_1006:
	bts r12,6
LB_1007:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1004
	btr r12,3
	jmp LB_1005
LB_1004:
	bts r12,3
LB_1005:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1002
	btr r12,2
	jmp LB_1003
LB_1002:
	bts r12,2
LB_1003:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1000
	btr r12,1
	jmp LB_1001
LB_1000:
	bts r12,1
LB_1001:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_998
	btr r12,0
	jmp LB_999
LB_998:
	bts r12,0
LB_999:
	add rsp,56
; _f38 %_959 ⊢ %_962 : %_962
 ; {>  %_959~5':_r64 %_950~6':_r64 %_950~3':_r64 %_960~7':_r64 %_961~9':_r64 %_948~1':_r64 %_949~0':_r64 %_955~8':_r64 %_947~2':_r64 %_958~4':_r64 }
	add r10,1
; _f37 %_960 ⊢ %_963 : %_963
 ; {>  %_962~5':_r64 %_950~6':_r64 %_950~3':_r64 %_960~7':_r64 %_961~9':_r64 %_948~1':_r64 %_949~0':_r64 %_955~8':_r64 %_947~2':_r64 %_958~4':_r64 }
	sub rcx,1
; _f973 { %_958 %_962 %_963 } ⊢ { %_964 %_965 %_966 %_967 } : { %_964 %_965 %_966 %_967 }
 ; {>  %_962~5':_r64 %_950~6':_r64 %_950~3':_r64 %_963~7':_r64 %_961~9':_r64 %_948~1':_r64 %_949~0':_r64 %_955~8':_r64 %_947~2':_r64 %_958~4':_r64 }
; _f973 { 4' 5' 7' } ⊢ { 4' 5' 7' 10' }
; push_iv 
	sub rsp,64
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp+8+8*5],rdx
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [rsp+8+8*6],rdi
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 7' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,4
	jc LB_1038
	btr r12,0
	jmp LB_1039
LB_1038:
	bts r12,0
LB_1039:
	mov r14,r10
	bt r12,5
	jc LB_1040
	btr r12,1
	jmp LB_1041
LB_1040:
	bts r12,1
LB_1041:
	mov r15,rcx
	bt r12,7
	jc LB_1042
	btr r12,2
	jmp LB_1043
LB_1042:
	bts r12,2
LB_1043:
	call NS_E_973
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 4' 5' 7' 10' }
	mov r9,r13
	bt r12,0
	jc LB_1044
	btr r12,4
	jmp LB_1045
LB_1044:
	bts r12,4
LB_1045:
	mov r10,r14
	bt r12,1
	jc LB_1046
	btr r12,5
	jmp LB_1047
LB_1046:
	bts r12,5
LB_1047:
	mov rcx,r15
	bt r12,2
	jc LB_1048
	btr r12,7
	jmp LB_1049
LB_1048:
	bts r12,7
LB_1049:
	mov rdi,r8
	mov QWORD [st_vct+8*10],rdi
	bt r12,3
	jc LB_1050
	btr r12,10
	jmp LB_1051
LB_1050:
	bts r12,10
LB_1051:
; pop_iv
	mov rdi,QWORD [rsp+8+8*6]
	mov QWORD [st_vct+8*9],rdi
	bt QWORD [rsp],9
	jc LB_1036
	btr r12,9
	jmp LB_1037
LB_1036:
	bts r12,9
LB_1037:
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD [rsp],8
	jc LB_1034
	btr r12,8
	jmp LB_1035
LB_1034:
	bts r12,8
LB_1035:
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD [rsp],6
	jc LB_1032
	btr r12,6
	jmp LB_1033
LB_1032:
	bts r12,6
LB_1033:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1030
	btr r12,3
	jmp LB_1031
LB_1030:
	bts r12,3
LB_1031:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1028
	btr r12,2
	jmp LB_1029
LB_1028:
	bts r12,2
LB_1029:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1026
	btr r12,1
	jmp LB_1027
LB_1026:
	bts r12,1
LB_1027:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1024
	btr r12,0
	jmp LB_1025
LB_1024:
	bts r12,0
LB_1025:
	add rsp,64
; _f38 %_966 ⊢ %_968 : %_968
 ; {>  %_965~5':_r64 %_966~7':_r64 %_950~6':_r64 %_950~3':_r64 %_967~10':_r64 %_961~9':_r64 %_964~4':_r64 %_948~1':_r64 %_949~0':_r64 %_955~8':_r64 %_947~2':_r64 }
	add rcx,1
; _f973 { %_955 %_961 %_967 } ⊢ { %_969 %_970 %_971 %_972 } : { %_969 %_970 %_971 %_972 }
 ; {>  %_968~7':_r64 %_965~5':_r64 %_950~6':_r64 %_950~3':_r64 %_967~10':_r64 %_961~9':_r64 %_964~4':_r64 %_948~1':_r64 %_949~0':_r64 %_955~8':_r64 %_947~2':_r64 }
; _f973 { 8' 9' 10' } ⊢ { 8' 9' 10' 11' }
; push_iv 
	sub rsp,72
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r9
	mov QWORD [rsp+8+8*5],r10
	mov QWORD [rsp+8+8*6],r11
	mov QWORD [rsp+8+8*7],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 8' 9' 10' } ⊢ { 0' 1' 2' }
	mov r13,rdx
	bt r12,8
	jc LB_1068
	btr r12,0
	jmp LB_1069
LB_1068:
	bts r12,0
LB_1069:
	mov r14,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_1070
	btr r12,1
	jmp LB_1071
LB_1070:
	bts r12,1
LB_1071:
	mov r15,QWORD [st_vct+8*10]
	bt r12,10
	jc LB_1072
	btr r12,2
	jmp LB_1073
LB_1072:
	bts r12,2
LB_1073:
	call NS_E_973
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 8' 9' 10' 11' }
	mov rdx,r13
	bt r12,0
	jc LB_1074
	btr r12,8
	jmp LB_1075
LB_1074:
	bts r12,8
LB_1075:
	mov rdi,r14
	mov QWORD [st_vct+8*9],rdi
	bt r12,1
	jc LB_1076
	btr r12,9
	jmp LB_1077
LB_1076:
	bts r12,9
LB_1077:
	mov rdi,r15
	mov QWORD [st_vct+8*10],rdi
	bt r12,2
	jc LB_1078
	btr r12,10
	jmp LB_1079
LB_1078:
	bts r12,10
LB_1079:
	mov rdi,r8
	mov QWORD [st_vct+8*11],rdi
	bt r12,3
	jc LB_1080
	btr r12,11
	jmp LB_1081
LB_1080:
	bts r12,11
LB_1081:
; pop_iv
	mov rcx,QWORD [rsp+8+8*7]
	bt QWORD [rsp],7
	jc LB_1066
	btr r12,7
	jmp LB_1067
LB_1066:
	bts r12,7
LB_1067:
	mov r11,QWORD [rsp+8+8*6]
	bt QWORD [rsp],6
	jc LB_1064
	btr r12,6
	jmp LB_1065
LB_1064:
	bts r12,6
LB_1065:
	mov r10,QWORD [rsp+8+8*5]
	bt QWORD [rsp],5
	jc LB_1062
	btr r12,5
	jmp LB_1063
LB_1062:
	bts r12,5
LB_1063:
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_1060
	btr r12,4
	jmp LB_1061
LB_1060:
	bts r12,4
LB_1061:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1058
	btr r12,3
	jmp LB_1059
LB_1058:
	bts r12,3
LB_1059:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1056
	btr r12,2
	jmp LB_1057
LB_1056:
	bts r12,2
LB_1057:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1054
	btr r12,1
	jmp LB_1055
LB_1054:
	bts r12,1
LB_1055:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1052
	btr r12,0
	jmp LB_1053
LB_1052:
	bts r12,0
LB_1053:
	add rsp,72
; ∎ { %_964 %_965 %_968 %_972 }
 ; {>  %_968~7':_r64 %_965~5':_r64 %_972~11':_r64 %_969~8':_r64 %_950~6':_r64 %_950~3':_r64 %_970~9':_r64 %_964~4':_r64 %_948~1':_r64 %_949~0':_r64 %_971~10':_r64 %_947~2':_r64 }
; 	∎ { 4' 5' 7' 11' }
	bt r12,8
	jc LB_1082
	mov rdi,rdx
	call dlt
LB_1082:
	bt r12,6
	jc LB_1083
	mov rdi,r11
	call dlt
LB_1083:
	bt r12,3
	jc LB_1084
	mov rdi,r8
	call dlt
LB_1084:
	bt r12,9
	jc LB_1085
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_1085:
	bt r12,1
	jc LB_1086
	mov rdi,r14
	call dlt
LB_1086:
	bt r12,0
	jc LB_1087
	mov rdi,r13
	call dlt
LB_1087:
	bt r12,10
	jc LB_1088
	mov rdi,QWORD [st_vct+8*10]
	call dlt
LB_1088:
	bt r12,2
	jc LB_1089
	mov rdi,r15
	call dlt
LB_1089:
; _emt_mov_ptn_to_ptn { 4' 5' 7' 11' } ⊢ { 0' 1' 2' 3' }
	mov r13,r9
	bt r12,4
	jc LB_1090
	btr r12,0
	jmp LB_1091
LB_1090:
	bts r12,0
LB_1091:
	mov r14,r10
	bt r12,5
	jc LB_1092
	btr r12,1
	jmp LB_1093
LB_1092:
	bts r12,1
LB_1093:
	mov r15,rcx
	bt r12,7
	jc LB_1094
	btr r12,2
	jmp LB_1095
LB_1094:
	bts r12,2
LB_1095:
	mov r8,QWORD [st_vct+8*11]
	bt r12,11
	jc LB_1096
	btr r12,3
	jmp LB_1097
LB_1096:
	bts r12,3
LB_1097:
	ret
MTC_LB_1110:
; ∎ { %_949 %_948 %_947 %_947 }
 ; {>  %_950~6':_r64 %_950~3':_r64 %_948~5':_r64 %_948~1':_r64 %_949~4':_r64 %_949~0':_r64 %_947~7':_r64 %_947~2':_r64 }
; 	∎ { 4' 5' 7' 2' }
	bt r12,6
	jc LB_1098
	mov rdi,r11
	call dlt
LB_1098:
	bt r12,3
	jc LB_1099
	mov rdi,r8
	call dlt
LB_1099:
	bt r12,1
	jc LB_1100
	mov rdi,r14
	call dlt
LB_1100:
	bt r12,0
	jc LB_1101
	mov rdi,r13
	call dlt
LB_1101:
; _emt_mov_ptn_to_ptn { 4' 5' 7' 2' } ⊢ { 0' 1' 2' 3' }
	mov r13,r9
	bt r12,4
	jc LB_1102
	btr r12,0
	jmp LB_1103
LB_1102:
	bts r12,0
LB_1103:
	mov r14,r10
	bt r12,5
	jc LB_1104
	btr r12,1
	jmp LB_1105
LB_1104:
	bts r12,1
LB_1105:
	mov r8,r15
	bt r12,2
	jc LB_1106
	btr r12,3
	jmp LB_1107
LB_1106:
	bts r12,3
LB_1107:
	mov r15,rcx
	bt r12,7
	jc LB_1108
	btr r12,2
	jmp LB_1109
LB_1108:
	bts r12,2
LB_1109:
	ret
section .data
	NS_E_DYN_780:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_780
	NS_E_DYN_783:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_783
	NS_E_DYN_784:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_784
	NS_E_DYN_785:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_785
	NS_E_DYN_786:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_786
	NS_E_DYN_812:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_812
	CST_DYN_943:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_973:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_973
