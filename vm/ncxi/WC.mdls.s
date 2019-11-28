%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_1001
	call NS_E_1053
	call exec_out
	jmp _end
NS_E_ID_14: dq 0
NS_E_14:
NS_E_RDI_14:
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
NS_E_885:
NS_E_RDI_885:
NS_E_885_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_885_LB_0
	bt r11,7
	jc LB_886
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
LB_886:
	add rsi,1
	bt r11,6
	jc LB_887
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
LB_887:
	add rsi,1
	bt r11,5
	jc LB_888
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
LB_888:
	add rsi,1
	bt r11,5
	jc LB_888
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
NS_E_885_LB_0:
	mov rax,0
	ret
NS_E_889:
NS_E_RDI_889:
NS_E_889_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_889_LB_0
	cmp r11,57
	ja NS_E_889_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_889_LB_0:
	mov rax,0
	ret
NS_E_891:
NS_E_RDI_891:
NS_E_891_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_891_LB_0
	cmp r11,122
	ja NS_E_891_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_891_LB_0:
	mov rax,0
	ret
NS_E_890:
NS_E_RDI_890:
NS_E_890_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_890_LB_0
	cmp r11,90
	ja NS_E_890_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_890_LB_0:
	mov rax,0
	ret
NS_E_17:
NS_E_RDI_17:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_21:
	mov rdi,r8
	bt r12,0
NS_E_RDI_21:
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
NS_E_919:
; 	|» { 0' 1' 2' }
NS_E_RDI_919:
; _f26 { %_893 %_892 } ⊢ { %_895 %_896 %_897 } : { %_895 %_896 %_897 }
 ; {>  %_893~1':_r64 %_892~0':_r64 %_894~2':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_986
	bt r12,3
	jc LB_985
	mov rdi,r8
	call dlt
LB_985:
	jmp MTC_LB_984
LB_986:
; _emt_mov_ptn_to_ptn 3' ⊢ 4'
	mov r9,r8
	bt r12,3
	jc LB_987
	btr r12,4
	jmp LB_988
LB_987:
	bts r12,4
LB_988:
; /0/
	jmp MTC_LB_983
MTC_LB_984:
; _f29 %_896 ⊢ { %_899 %_900 } : { %_899 %_900 }
 ; {>  %_894~2':_r64 %_896~0':_r64 %_897~3':_r64 %_895~1':_r64 }
	mov r9,r13
; _f29 %_895 ⊢ { %_901 %_902 } : { %_901 %_902 }
 ; {>  %_894~2':_r64 %_899~0':_r64 %_900~4':_r64 %_897~3':_r64 %_895~1':_r64 }
	mov r10,r14
; _f29 %_894 ⊢ { %_903 %_904 } : { %_903 %_904 }
 ; {>  %_894~2':_r64 %_899~0':_r64 %_902~5':_r64 %_900~4':_r64 %_897~3':_r64 %_901~1':_r64 }
	mov r11,r15
; _f31 %_900 ⊢ %_905 : %_905
 ; {>  %_899~0':_r64 %_904~6':_r64 %_902~5':_r64 %_900~4':_r64 %_897~3':_r64 %_903~2':_r64 %_901~1':_r64 }
	sub r9,1
; _f919 { %_905 %_902 %_904 } ⊢ %_906 : %_906
 ; {>  %_899~0':_r64 %_905~4':_r64 %_904~6':_r64 %_902~5':_r64 %_897~3':_r64 %_903~2':_r64 %_901~1':_r64 }
; _f919 { 4' 5' 6' } ⊢ 4'
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
	jc LB_928
	btr r12,0
	jmp LB_929
LB_928:
	bts r12,0
LB_929:
	mov r14,r10
	bt r12,5
	jc LB_930
	btr r12,1
	jmp LB_931
LB_930:
	bts r12,1
LB_931:
	mov r15,r11
	bt r12,6
	jc LB_932
	btr r12,2
	jmp LB_933
LB_932:
	bts r12,2
LB_933:
	call NS_E_919
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_934
	btr r12,4
	jmp LB_935
LB_934:
	bts r12,4
LB_935:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_926
	btr r12,3
	jmp LB_927
LB_926:
	bts r12,3
LB_927:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_924
	btr r12,2
	jmp LB_925
LB_924:
	bts r12,2
LB_925:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_922
	btr r12,1
	jmp LB_923
LB_922:
	bts r12,1
LB_923:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_920
	btr r12,0
	jmp LB_921
LB_920:
	bts r12,0
LB_921:
	add rsp,40
; _f29 %_899 ⊢ { %_907 %_908 } : { %_907 %_908 }
 ; {>  %_899~0':_r64 %_897~3':_r64 %_906~4':_r64 %_903~2':_r64 %_901~1':_r64 }
	mov r10,r13
; _f29 %_901 ⊢ { %_909 %_910 } : { %_909 %_910 }
 ; {>  %_907~0':_r64 %_897~3':_r64 %_906~4':_r64 %_903~2':_r64 %_908~5':_r64 %_901~1':_r64 }
	mov r11,r14
; _f29 %_903 ⊢ { %_911 %_912 } : { %_911 %_912 }
 ; {>  %_910~6':_r64 %_907~0':_r64 %_909~1':_r64 %_897~3':_r64 %_906~4':_r64 %_903~2':_r64 %_908~5':_r64 }
	mov rcx,r15
; _f31 %_910 ⊢ %_913 : %_913
 ; {>  %_910~6':_r64 %_907~0':_r64 %_909~1':_r64 %_897~3':_r64 %_912~7':_r64 %_911~2':_r64 %_906~4':_r64 %_908~5':_r64 }
	sub r11,1
; _f919 { %_913 %_912 %_908 } ⊢ %_914 : %_914
 ; {>  %_907~0':_r64 %_909~1':_r64 %_897~3':_r64 %_912~7':_r64 %_911~2':_r64 %_906~4':_r64 %_908~5':_r64 %_913~6':_r64 }
; _f919 { 6' 7' 5' } ⊢ 5'
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
	jc LB_946
	btr r12,0
	jmp LB_947
LB_946:
	bts r12,0
LB_947:
	mov r14,rcx
	bt r12,7
	jc LB_948
	btr r12,1
	jmp LB_949
LB_948:
	bts r12,1
LB_949:
	mov r15,r10
	bt r12,5
	jc LB_950
	btr r12,2
	jmp LB_951
LB_950:
	bts r12,2
LB_951:
	call NS_E_919
; _emt_mov_ptn_to_ptn 0' ⊢ 5'
	mov r10,r13
	bt r12,0
	jc LB_952
	btr r12,5
	jmp LB_953
LB_952:
	bts r12,5
LB_953:
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_944
	btr r12,4
	jmp LB_945
LB_944:
	bts r12,4
LB_945:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_942
	btr r12,3
	jmp LB_943
LB_942:
	bts r12,3
LB_943:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_940
	btr r12,2
	jmp LB_941
LB_940:
	bts r12,2
LB_941:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_938
	btr r12,1
	jmp LB_939
LB_938:
	bts r12,1
LB_939:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_936
	btr r12,0
	jmp LB_937
LB_936:
	bts r12,0
LB_937:
	add rsp,48
; _f31 %_911 ⊢ %_915 : %_915
 ; {>  %_914~5':_r64 %_907~0':_r64 %_909~1':_r64 %_897~3':_r64 %_911~2':_r64 %_906~4':_r64 }
	sub r15,1
; _f919 { %_915 %_907 %_909 } ⊢ %_916 : %_916
 ; {>  %_915~2':_r64 %_914~5':_r64 %_907~0':_r64 %_909~1':_r64 %_897~3':_r64 %_906~4':_r64 }
; _f919 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_960
	btr r12,3
	jmp LB_961
LB_960:
	bts r12,3
LB_961:
	mov r15,r14
	bt r12,1
	jc LB_962
	btr r12,2
	jmp LB_963
LB_962:
	bts r12,2
LB_963:
	mov r14,r13
	bt r12,0
	jc LB_964
	btr r12,1
	jmp LB_965
LB_964:
	bts r12,1
LB_965:
	mov r13,r8
	bt r12,3
	jc LB_966
	btr r12,0
	jmp LB_967
LB_966:
	bts r12,0
LB_967:
	call NS_E_919
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_958
	btr r12,5
	jmp LB_959
LB_958:
	bts r12,5
LB_959:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_956
	btr r12,4
	jmp LB_957
LB_956:
	bts r12,4
LB_957:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_954
	btr r12,3
	jmp LB_955
LB_954:
	bts r12,3
LB_955:
	add rsp,32
; _f919 { %_906 %_914 %_916 } ⊢ %_917 : %_917
 ; {>  %_914~5':_r64 %_916~0':_r64 %_897~3':_r64 %_906~4':_r64 }
; _f919 { 4' 5' 0' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,5
	jc LB_970
	btr r12,1
	jmp LB_971
LB_970:
	bts r12,1
LB_971:
	mov r15,r13
	bt r12,0
	jc LB_972
	btr r12,2
	jmp LB_973
LB_972:
	bts r12,2
LB_973:
	mov r13,r9
	bt r12,4
	jc LB_974
	btr r12,0
	jmp LB_975
LB_974:
	bts r12,0
LB_975:
	call NS_E_919
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_968
	btr r12,3
	jmp LB_969
LB_968:
	bts r12,3
LB_969:
	add rsp,16
; ∎ %_917
 ; {>  %_917~0':_r64 %_897~3':_r64 }
; 	∎ 0'
	bt r12,3
	jc LB_976
	mov rdi,r8
	call dlt
LB_976:
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
MTC_LB_983:
; ∎ %_894
 ; {>  %_894~2':_r64 %_896~0':_r64 %_897~3':_r64 %_895~1':_r64 %_918~4':_r64 }
; 	∎ 2'
	bt r12,0
	jc LB_977
	mov rdi,r13
	call dlt
LB_977:
	bt r12,3
	jc LB_978
	mov rdi,r8
	call dlt
LB_978:
	bt r12,1
	jc LB_979
	mov rdi,r14
	call dlt
LB_979:
	bt r12,4
	jc LB_980
	mov rdi,r9
	call dlt
LB_980:
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_981
	btr r12,0
	jmp LB_982
LB_981:
	bts r12,0
LB_982:
	ret
NS_E_1001:
NS_E_RDI_1001:
; » 0xraa |~ {  } ⊢ %_989 : %_989
 ; {>  }
; 	» 0xraa _ ⊢ 0' : %_989
	mov rdi,0xaa
	mov r13,rdi
	bts r12,0
; » 0xr87 |~ {  } ⊢ %_990 : %_990
 ; {>  %_989~0':_r64 }
; 	» 0xr87 _ ⊢ 1' : %_990
	mov rdi,0x87
	mov r14,rdi
	bts r12,1
; _f26 { %_989 %_990 } ⊢ { %_991 %_992 %_993 } : { %_991 %_992 %_993 }
 ; {>  %_990~1':_r64 %_989~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r15,rsi
	bts r12,2
; /0
	mov QWORD rax,0x0
	cmp rax,r13
	jnz LB_1041
	bt r12,0
	jc LB_1040
	mov rdi,r13
	call dlt
LB_1040:
	jmp MTC_LB_1039
LB_1041:
; /0/0
	mov QWORD rax,0xab
	cmp rax,r13
	jnz LB_1043
	bt r12,0
	jc LB_1042
	mov rdi,r13
	call dlt
LB_1042:
	jmp MTC_LB_1038
LB_1043:
; /0/0/0
	mov QWORD rax,0xaa
	cmp rax,r13
	jnz LB_1045
	bt r12,0
	jc LB_1044
	mov rdi,r13
	call dlt
LB_1044:
	jmp MTC_LB_1037
LB_1045:
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_1046
	btr r12,3
	jmp LB_1047
LB_1046:
	bts r12,3
LB_1047:
; /0/0/0/
	jmp MTC_LB_1036
MTC_LB_1039:
; ∎ {  }
 ; {>  %_993~2':_r64 %_992~1':_r64 %_991~0':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_1002
	mov rdi,r15
	call dlt
LB_1002:
	bt r12,1
	jc LB_1003
	mov rdi,r14
	call dlt
LB_1003:
	bt r12,0
	jc LB_1004
	mov rdi,r13
	call dlt
LB_1004:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_1038:
; ∎ {  }
 ; {>  %_993~2':_r64 %_992~1':_r64 %_991~0':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_1005
	mov rdi,r15
	call dlt
LB_1005:
	bt r12,1
	jc LB_1006
	mov rdi,r14
	call dlt
LB_1006:
	bt r12,0
	jc LB_1007
	mov rdi,r13
	call dlt
LB_1007:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_1037:
; 	» "AA" _ ⊢ 3' : %_997
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,2
	call mlc_s8
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_41_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r8,rdi
	btr r12,3
; _f14 %_997 ⊢ %_998 : %_998
 ; {>  %_993~2':_r64 %_997~3':_stg %_992~1':_r64 %_991~0':_r64 }
; _f14 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_1014
	btr r12,0
	jmp LB_1015
LB_1014:
	bts r12,0
LB_1015:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_1016
	btr r12,3
	jmp LB_1017
LB_1016:
	bts r12,3
LB_1017:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1012
	btr r12,2
	jmp LB_1013
LB_1012:
	bts r12,2
LB_1013:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1010
	btr r12,1
	jmp LB_1011
LB_1010:
	bts r12,1
LB_1011:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1008
	btr r12,0
	jmp LB_1009
LB_1008:
	bts r12,0
LB_1009:
	add rsp,32
; ∎ {  }
 ; {>  %_993~2':_r64 %_998~3':_stg %_992~1':_r64 %_991~0':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_1018
	mov rdi,r15
	call dlt
LB_1018:
	bt r12,3
	jc LB_1019
	mov rdi,r8
	call dlt
LB_1019:
	bt r12,1
	jc LB_1020
	mov rdi,r14
	call dlt
LB_1020:
	bt r12,0
	jc LB_1021
	mov rdi,r13
	call dlt
LB_1021:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_1036:
; _f14 %_999 ⊢ %_1000 : %_1000
 ; {>  %_993~2':_r64 %_999~3':_r64 %_992~1':_r64 %_991~0':_r64 }
; _f14 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_1028
	btr r12,0
	jmp LB_1029
LB_1028:
	bts r12,0
LB_1029:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_1030
	btr r12,3
	jmp LB_1031
LB_1030:
	bts r12,3
LB_1031:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1026
	btr r12,2
	jmp LB_1027
LB_1026:
	bts r12,2
LB_1027:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1024
	btr r12,1
	jmp LB_1025
LB_1024:
	bts r12,1
LB_1025:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1022
	btr r12,0
	jmp LB_1023
LB_1022:
	bts r12,0
LB_1023:
	add rsp,32
; ∎ {  }
 ; {>  %_993~2':_r64 %_1000~3':_r64 %_992~1':_r64 %_991~0':_r64 }
; 	∎ {  }
	bt r12,2
	jc LB_1032
	mov rdi,r15
	call dlt
LB_1032:
	bt r12,3
	jc LB_1033
	mov rdi,r8
	call dlt
LB_1033:
	bt r12,1
	jc LB_1034
	mov rdi,r14
	call dlt
LB_1034:
	bt r12,0
	jc LB_1035
	mov rdi,r13
	call dlt
LB_1035:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_1053:
NS_E_RDI_1053:
; » 0xr14 |~ {  } ⊢ %_1048 : %_1048
 ; {>  }
; 	» 0xr14 _ ⊢ 0' : %_1048
	mov rdi,0x14
	mov r13,rdi
	bts r12,0
; » 0xra |~ {  } ⊢ %_1049 : %_1049
 ; {>  %_1048~0':_r64 }
; 	» 0xra _ ⊢ 1' : %_1049
	mov rdi,0xa
	mov r14,rdi
	bts r12,1
; » 0xr0 |~ {  } ⊢ %_1050 : %_1050
 ; {>  %_1049~1':_r64 %_1048~0':_r64 }
; 	» 0xr0 _ ⊢ 2' : %_1050
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f919 { %_1048 %_1049 %_1050 } ⊢ %_1051 : %_1051
 ; {>  %_1050~2':_r64 %_1049~1':_r64 %_1048~0':_r64 }
; _f919 { 0' 1' 2' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ { 0' 1' 2' }
	call NS_E_919
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; _f14 %_1051 ⊢ %_1052 : %_1052
 ; {>  %_1051~0':_r64 }
; _f14 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_1052~0':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_1054
	mov rdi,r13
	call dlt
LB_1054:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_885:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_885
	NS_E_DYN_889:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_889
	NS_E_DYN_890:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_890
	NS_E_DYN_891:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_891
	NS_E_DYN_919:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_919
	CST_DYN_1001:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_1053:
		dq 0x0001_0001_00_82_ffff
		dq 1
