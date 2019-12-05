%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_1049
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
NS_E_836:
NS_E_RDI_836:
NS_E_836_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_837
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_837:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_839:
NS_E_RDI_839:
NS_E_839_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_839_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_839_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_840:
NS_E_RDI_840:
NS_E_840_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_840_LB_0
	cmp r11,57
	ja NS_E_840_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_840_LB_0:
	mov rax,0
	ret
NS_E_842:
NS_E_RDI_842:
NS_E_842_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_842_LB_0
	cmp r11,122
	ja NS_E_842_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_842_LB_0:
	mov rax,0
	ret
NS_E_841:
NS_E_RDI_841:
NS_E_841_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_841_LB_0
	cmp r11,90
	ja NS_E_841_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_841_LB_0:
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
NS_E_838:
NS_E_RDI_838:
NS_E_838_ETR_TBL:
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
	jz NS_E_838_LB_0
	mov r14,rsi
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_838_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_868:
; 	|» { 0' 1' 2' }
NS_E_RDI_868:
; _f32 { %_844 %_843 } ⊢ { %_846 %_847 %_848 } : { %_846 %_847 %_848 }
 ; {>  %_843~0':_r64 %_844~1':_r64 %_845~2':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_933
; /
	jmp MTC_LB_932
LB_933:
; /0/
	jmp MTC_LB_931
MTC_LB_932:
; _f35 %_847 ⊢ { %_849 %_850 } : { %_849 %_850 }
 ; {>  %_846~1':_r64 %_848~3':_r64 %_845~2':_r64 %_847~0':_r64 }
	mov r9,r13
; _f35 %_846 ⊢ { %_851 %_852 } : { %_851 %_852 }
 ; {>  %_850~4':_r64 %_846~1':_r64 %_848~3':_r64 %_845~2':_r64 %_849~0':_r64 }
	mov r10,r14
; _f35 %_845 ⊢ { %_853 %_854 } : { %_853 %_854 }
 ; {>  %_850~4':_r64 %_848~3':_r64 %_852~5':_r64 %_845~2':_r64 %_849~0':_r64 %_851~1':_r64 }
	mov r11,r15
; _f37 %_850 ⊢ %_855 : %_855
 ; {>  %_850~4':_r64 %_853~2':_r64 %_848~3':_r64 %_854~6':_r64 %_852~5':_r64 %_849~0':_r64 %_851~1':_r64 }
	sub r9,1
; _f868 { %_855 %_852 %_854 } ⊢ %_856 : %_856
 ; {>  %_855~4':_r64 %_853~2':_r64 %_848~3':_r64 %_854~6':_r64 %_852~5':_r64 %_849~0':_r64 %_851~1':_r64 }
; _f868 { 4' 5' 6' } ⊢ 4'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 6' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,4
	jc LB_877
	btr r12,0
	jmp LB_878
LB_877:
	bts r12,0
LB_878:
	mov r14,r10
	bt r12,5
	jc LB_879
	btr r12,1
	jmp LB_880
LB_879:
	bts r12,1
LB_880:
	mov r15,r11
	bt r12,6
	jc LB_881
	btr r12,2
	jmp LB_882
LB_881:
	bts r12,2
LB_882:
	call NS_E_868
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
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_875
	btr r12,3
	jmp LB_876
LB_875:
	bts r12,3
LB_876:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_873
	btr r12,2
	jmp LB_874
LB_873:
	bts r12,2
LB_874:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_871
	btr r12,1
	jmp LB_872
LB_871:
	bts r12,1
LB_872:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_869
	btr r12,0
	jmp LB_870
LB_869:
	bts r12,0
LB_870:
	add rsp,40
; _f35 %_849 ⊢ { %_857 %_858 } : { %_857 %_858 }
 ; {>  %_856~4':_r64 %_853~2':_r64 %_848~3':_r64 %_849~0':_r64 %_851~1':_r64 }
	mov r10,r13
; _f35 %_851 ⊢ { %_859 %_860 } : { %_859 %_860 }
 ; {>  %_856~4':_r64 %_858~5':_r64 %_857~0':_r64 %_853~2':_r64 %_848~3':_r64 %_851~1':_r64 }
	mov r11,r14
; _f35 %_853 ⊢ { %_861 %_862 } : { %_861 %_862 }
 ; {>  %_856~4':_r64 %_859~1':_r64 %_858~5':_r64 %_857~0':_r64 %_860~6':_r64 %_853~2':_r64 %_848~3':_r64 }
	mov rcx,r15
; _f37 %_860 ⊢ %_863 : %_863
 ; {>  %_856~4':_r64 %_859~1':_r64 %_858~5':_r64 %_857~0':_r64 %_860~6':_r64 %_848~3':_r64 %_861~2':_r64 %_862~7':_r64 }
	sub r11,1
; _f868 { %_863 %_862 %_858 } ⊢ %_864 : %_864
 ; {>  %_856~4':_r64 %_859~1':_r64 %_858~5':_r64 %_857~0':_r64 %_848~3':_r64 %_861~2':_r64 %_863~6':_r64 %_862~7':_r64 }
; _f868 { 6' 7' 5' } ⊢ 5'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 6' 7' 5' } ⊢ { 0' 1' 2' }
	mov r13,r11
	bt r12,6
	jc LB_895
	btr r12,0
	jmp LB_896
LB_895:
	bts r12,0
LB_896:
	mov r14,rcx
	bt r12,7
	jc LB_897
	btr r12,1
	jmp LB_898
LB_897:
	bts r12,1
LB_898:
	mov r15,r10
	bt r12,5
	jc LB_899
	btr r12,2
	jmp LB_900
LB_899:
	bts r12,2
LB_900:
	call NS_E_868
; _emt_mov_ptn_to_ptn 0' ⊢ 5'
	mov r10,r13
	bt r12,0
	jc LB_901
	btr r12,5
	jmp LB_902
LB_901:
	bts r12,5
LB_902:
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_893
	btr r12,4
	jmp LB_894
LB_893:
	bts r12,4
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
; _f37 %_861 ⊢ %_865 : %_865
 ; {>  %_856~4':_r64 %_859~1':_r64 %_857~0':_r64 %_848~3':_r64 %_864~5':_r64 %_861~2':_r64 }
	sub r15,1
; _f868 { %_865 %_857 %_859 } ⊢ %_866 : %_866
 ; {>  %_856~4':_r64 %_859~1':_r64 %_857~0':_r64 %_848~3':_r64 %_864~5':_r64 %_865~2':_r64 }
; _f868 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_909
	btr r12,3
	jmp LB_910
LB_909:
	bts r12,3
LB_910:
	mov r15,r14
	bt r12,1
	jc LB_911
	btr r12,2
	jmp LB_912
LB_911:
	bts r12,2
LB_912:
	mov r14,r13
	bt r12,0
	jc LB_913
	btr r12,1
	jmp LB_914
LB_913:
	bts r12,1
LB_914:
	mov r13,r8
	bt r12,3
	jc LB_915
	btr r12,0
	jmp LB_916
LB_915:
	bts r12,0
LB_916:
	call NS_E_868
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_907
	btr r12,5
	jmp LB_908
LB_907:
	bts r12,5
LB_908:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_905
	btr r12,4
	jmp LB_906
LB_905:
	bts r12,4
LB_906:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_903
	btr r12,3
	jmp LB_904
LB_903:
	bts r12,3
LB_904:
	add rsp,32
; _f868 { %_856 %_864 %_866 } ⊢ %_867 : %_867
 ; {>  %_856~4':_r64 %_848~3':_r64 %_866~0':_r64 %_864~5':_r64 }
; _f868 { 4' 5' 0' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,5
	jc LB_919
	btr r12,1
	jmp LB_920
LB_919:
	bts r12,1
LB_920:
	mov r15,r13
	bt r12,0
	jc LB_921
	btr r12,2
	jmp LB_922
LB_921:
	bts r12,2
LB_922:
	mov r13,r9
	bt r12,4
	jc LB_923
	btr r12,0
	jmp LB_924
LB_923:
	bts r12,0
LB_924:
	call NS_E_868
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_917
	btr r12,3
	jmp LB_918
LB_917:
	bts r12,3
LB_918:
	add rsp,16
; ∎ %_867
 ; {>  %_848~3':_r64 %_867~0':_r64 }
; 	∎ 0'
	bt r12,3
	jc LB_925
	mov rdi,r8
	call dlt
LB_925:
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
MTC_LB_931:
; ∎ %_845
 ; {>  %_846~1':_r64 %_848~3':_r64 %_845~2':_r64 %_847~0':_r64 }
; 	∎ 2'
	bt r12,1
	jc LB_926
	mov rdi,r14
	call dlt
LB_926:
	bt r12,3
	jc LB_927
	mov rdi,r8
	call dlt
LB_927:
	bt r12,0
	jc LB_928
	mov rdi,r13
	call dlt
LB_928:
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_929
	btr r12,0
	jmp LB_930
LB_929:
	bts r12,0
LB_930:
	ret
NS_E_964:
; 	|» { 0' 1' 2' }
NS_E_RDI_964:
; _f32 { %_935 %_934 } ⊢ { %_937 %_938 %_939 } : { %_937 %_938 %_939 }
 ; {>  %_934~0':_r64 %_935~1':_r64 %_936~2':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_1040
; /
	jmp MTC_LB_1039
LB_1040:
; /0/
	jmp MTC_LB_1038
MTC_LB_1039:
; _f37 %_938 ⊢ %_940 : %_940
 ; {>  %_937~1':_r64 %_938~0':_r64 %_939~3':_r64 %_936~2':_r64 }
	sub r13,1
; _f964 { %_940 %_937 %_936 } ⊢ { %_941 %_942 %_943 %_944 } : { %_941 %_942 %_943 %_944 }
 ; {>  %_940~0':_r64 %_937~1':_r64 %_939~3':_r64 %_936~2':_r64 }
; _f964 { 0' 1' 2' } ⊢ { 0' 1' 2' 4' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_964
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 0' 1' 2' 4' }
	mov r9,r8
	bt r12,3
	jc LB_967
	btr r12,4
	jmp LB_968
LB_967:
	bts r12,4
LB_968:
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_965
	btr r12,3
	jmp LB_966
LB_965:
	bts r12,3
LB_966:
	add rsp,16
; _f38 %_941 ⊢ %_945 : %_945
 ; {>  %_941~0':_r64 %_939~3':_r64 %_942~1':_r64 %_944~4':_r64 %_943~2':_r64 }
	add r13,1
; _f37 %_942 ⊢ %_946 : %_946
 ; {>  %_945~0':_r64 %_939~3':_r64 %_942~1':_r64 %_944~4':_r64 %_943~2':_r64 }
	sub r14,1
; _f964 { %_946 %_943 %_945 } ⊢ { %_947 %_948 %_949 %_950 } : { %_947 %_948 %_949 %_950 }
 ; {>  %_946~1':_r64 %_945~0':_r64 %_939~3':_r64 %_944~4':_r64 %_943~2':_r64 }
; _f964 { 1' 2' 0' } ⊢ { 0' 1' 2' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' 0' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_973
	btr r12,3
	jmp LB_974
LB_973:
	bts r12,3
LB_974:
	mov r15,r13
	bt r12,0
	jc LB_975
	btr r12,2
	jmp LB_976
LB_975:
	bts r12,2
LB_976:
	mov r13,r14
	bt r12,1
	jc LB_977
	btr r12,0
	jmp LB_978
LB_977:
	bts r12,0
LB_978:
	mov r14,r8
	bt r12,3
	jc LB_979
	btr r12,1
	jmp LB_980
LB_979:
	bts r12,1
LB_980:
	call NS_E_964
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 0' 1' 2' 5' }
	mov r10,r8
	bt r12,3
	jc LB_981
	btr r12,5
	jmp LB_982
LB_981:
	bts r12,5
LB_982:
; pop_iv
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_971
	btr r12,4
	jmp LB_972
LB_971:
	bts r12,4
LB_972:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_969
	btr r12,3
	jmp LB_970
LB_969:
	bts r12,3
LB_970:
	add rsp,24
; _f38 %_947 ⊢ %_951 : %_951
 ; {>  %_950~5':_r64 %_948~1':_r64 %_949~2':_r64 %_939~3':_r64 %_947~0':_r64 %_944~4':_r64 }
	add r13,1
; _f37 %_948 ⊢ %_952 : %_952
 ; {>  %_950~5':_r64 %_951~0':_r64 %_948~1':_r64 %_949~2':_r64 %_939~3':_r64 %_944~4':_r64 }
	sub r14,1
; _f964 { %_952 %_949 %_951 } ⊢ { %_953 %_954 %_955 %_956 } : { %_953 %_954 %_955 %_956 }
 ; {>  %_950~5':_r64 %_951~0':_r64 %_949~2':_r64 %_939~3':_r64 %_952~1':_r64 %_944~4':_r64 }
; _f964 { 1' 2' 0' } ⊢ { 0' 1' 2' 6' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' 0' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_989
	btr r12,3
	jmp LB_990
LB_989:
	bts r12,3
LB_990:
	mov r15,r13
	bt r12,0
	jc LB_991
	btr r12,2
	jmp LB_992
LB_991:
	bts r12,2
LB_992:
	mov r13,r14
	bt r12,1
	jc LB_993
	btr r12,0
	jmp LB_994
LB_993:
	bts r12,0
LB_994:
	mov r14,r8
	bt r12,3
	jc LB_995
	btr r12,1
	jmp LB_996
LB_995:
	bts r12,1
LB_996:
	call NS_E_964
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 0' 1' 2' 6' }
	mov r11,r8
	bt r12,3
	jc LB_997
	btr r12,6
	jmp LB_998
LB_997:
	bts r12,6
LB_998:
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_987
	btr r12,5
	jmp LB_988
LB_987:
	bts r12,5
LB_988:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_985
	btr r12,4
	jmp LB_986
LB_985:
	bts r12,4
LB_986:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_983
	btr r12,3
	jmp LB_984
LB_983:
	bts r12,3
LB_984:
	add rsp,32
; _f38 %_953 ⊢ %_957 : %_957
 ; {>  %_956~6':_r64 %_953~0':_r64 %_954~1':_r64 %_950~5':_r64 %_939~3':_r64 %_955~2':_r64 %_944~4':_r64 }
	add r13,1
; _f964 { %_944 %_950 %_956 } ⊢ { %_958 %_959 %_960 %_961 } : { %_958 %_959 %_960 %_961 }
 ; {>  %_956~6':_r64 %_954~1':_r64 %_950~5':_r64 %_939~3':_r64 %_955~2':_r64 %_957~0':_r64 %_944~4':_r64 }
; _f964 { 4' 5' 6' } ⊢ { 4' 5' 6' 7' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 6' } ⊢ { 0' 1' 2' }
	mov r13,r9
	bt r12,4
	jc LB_1007
	btr r12,0
	jmp LB_1008
LB_1007:
	bts r12,0
LB_1008:
	mov r14,r10
	bt r12,5
	jc LB_1009
	btr r12,1
	jmp LB_1010
LB_1009:
	bts r12,1
LB_1010:
	mov r15,r11
	bt r12,6
	jc LB_1011
	btr r12,2
	jmp LB_1012
LB_1011:
	bts r12,2
LB_1012:
	call NS_E_964
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 4' 5' 6' 7' }
	mov r9,r13
	bt r12,0
	jc LB_1013
	btr r12,4
	jmp LB_1014
LB_1013:
	bts r12,4
LB_1014:
	mov r10,r14
	bt r12,1
	jc LB_1015
	btr r12,5
	jmp LB_1016
LB_1015:
	bts r12,5
LB_1016:
	mov r11,r15
	bt r12,2
	jc LB_1017
	btr r12,6
	jmp LB_1018
LB_1017:
	bts r12,6
LB_1018:
	mov rcx,r8
	bt r12,3
	jc LB_1019
	btr r12,7
	jmp LB_1020
LB_1019:
	bts r12,7
LB_1020:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1005
	btr r12,3
	jmp LB_1006
LB_1005:
	bts r12,3
LB_1006:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1003
	btr r12,2
	jmp LB_1004
LB_1003:
	bts r12,2
LB_1004:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1001
	btr r12,1
	jmp LB_1002
LB_1001:
	bts r12,1
LB_1002:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_999
	btr r12,0
	jmp LB_1000
LB_999:
	bts r12,0
LB_1000:
	add rsp,40
; ∎ { %_954 %_955 %_957 %_961 }
 ; {>  %_959~5':_r64 %_954~1':_r64 %_960~6':_r64 %_961~7':_r64 %_939~3':_r64 %_955~2':_r64 %_958~4':_r64 %_957~0':_r64 }
; 	∎ { 1' 2' 0' 7' }
	bt r12,5
	jc LB_1021
	mov rdi,r10
	call dlt
LB_1021:
	bt r12,6
	jc LB_1022
	mov rdi,r11
	call dlt
LB_1022:
	bt r12,3
	jc LB_1023
	mov rdi,r8
	call dlt
LB_1023:
	bt r12,4
	jc LB_1024
	mov rdi,r9
	call dlt
LB_1024:
; _emt_mov_ptn_to_ptn { 1' 2' 0' 7' } ⊢ { 0' 1' 2' 3' }
	mov r8,rcx
	bt r12,7
	jc LB_1025
	btr r12,3
	jmp LB_1026
LB_1025:
	bts r12,3
LB_1026:
	mov r9,r15
	bt r12,2
	jc LB_1027
	btr r12,4
	jmp LB_1028
LB_1027:
	bts r12,4
LB_1028:
	mov r15,r13
	bt r12,0
	jc LB_1029
	btr r12,2
	jmp LB_1030
LB_1029:
	bts r12,2
LB_1030:
	mov r13,r14
	bt r12,1
	jc LB_1031
	btr r12,0
	jmp LB_1032
LB_1031:
	bts r12,0
LB_1032:
	mov r14,r9
	bt r12,4
	jc LB_1033
	btr r12,1
	jmp LB_1034
LB_1033:
	bts r12,1
LB_1034:
	ret
MTC_LB_1038:
; _f35 %_936 ⊢ { %_962 %_963 } : { %_962 %_963 }
 ; {>  %_937~1':_r64 %_938~0':_r64 %_939~3':_r64 %_936~2':_r64 }
	mov r9,r15
; ∎ { %_938 %_937 %_962 %_963 }
 ; {>  %_962~2':_r64 %_963~4':_r64 %_937~1':_r64 %_938~0':_r64 %_939~3':_r64 }
; 	∎ { 0' 1' 2' 4' }
	bt r12,3
	jc LB_1035
	mov rdi,r8
	call dlt
LB_1035:
; _emt_mov_ptn_to_ptn { 0' 1' 2' 4' } ⊢ { 0' 1' 2' 3' }
	mov r8,r9
	bt r12,4
	jc LB_1036
	btr r12,3
	jmp LB_1037
LB_1036:
	bts r12,3
LB_1037:
	ret
NS_E_1049:
NS_E_RDI_1049:
; » 0xr14 |~ {  } ⊢ %_1041 : %_1041
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_1041
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_1042 : %_1042
 ; {>  %_1041~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_1042
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_1043 : %_1043
 ; {>  %_1041~0':_r64 %_1042~1':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_1043
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f964 { %_1041 %_1042 %_1043 } ⊢ { %_1044 %_1045 %_1046 %_1047 } : { %_1044 %_1045 %_1046 %_1047 }
 ; {>  %_1043~2':_r64 %_1041~0':_r64 %_1042~1':_r64 }
; _f964 { 0' 1' 2' } ⊢ { 0' 1' 2' 3' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_964
; _emt_mov_ptn_to_ptn { 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; pop_iv
	add rsp,8
; _f20 %_1047 ⊢ %_1048 : %_1048
 ; {>  %_1046~2':_r64 %_1045~1':_r64 %_1047~3':_r64 %_1044~0':_r64 }
; _f20 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_1056
	btr r12,0
	jmp LB_1057
LB_1056:
	bts r12,0
LB_1057:
	call NS_E_20
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_1058
	btr r12,3
	jmp LB_1059
LB_1058:
	bts r12,3
LB_1059:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1054
	btr r12,2
	jmp LB_1055
LB_1054:
	bts r12,2
LB_1055:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1052
	btr r12,1
	jmp LB_1053
LB_1052:
	bts r12,1
LB_1053:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1050
	btr r12,0
	jmp LB_1051
LB_1050:
	bts r12,0
LB_1051:
	add rsp,32
; ∎ {  }
 ; {>  %_1046~2':_r64 %_1045~1':_r64 %_1044~0':_r64 %_1048~3':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_1060
	mov rdi,r15
	call dlt
LB_1060:
	bt r12,1
	jc LB_1061
	mov rdi,r14
	call dlt
LB_1061:
	bt r12,0
	jc LB_1062
	mov rdi,r13
	call dlt
LB_1062:
	bt r12,3
	jc LB_1063
	mov rdi,r8
	call dlt
LB_1063:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_836:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_836
	NS_E_DYN_839:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_839
	NS_E_DYN_840:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_840
	NS_E_DYN_841:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_841
	NS_E_DYN_842:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_842
	NS_E_DYN_868:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_868
	NS_E_DYN_964:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_964
	CST_DYN_1049:
		dq 0x0001_0001_00_82_ffff
		dq 1
