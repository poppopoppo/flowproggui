%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_933
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
NS_E_893:
NS_E_RDI_893:
NS_E_893_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_893_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_893_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_894:
NS_E_RDI_894:
NS_E_894_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_894_LB_0
	cmp r11,57
	ja NS_E_894_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_894_LB_0:
	mov rax,0
	ret
NS_E_896:
NS_E_RDI_896:
NS_E_896_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_896_LB_0
	cmp r11,122
	ja NS_E_896_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_896_LB_0:
	mov rax,0
	ret
NS_E_895:
NS_E_RDI_895:
NS_E_895_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_895_LB_0
	cmp r11,90
	ja NS_E_895_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_895_LB_0:
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
NS_E_898:
NS_E_RDI_898:
NS_E_898_ETR_TBL:
NS_E_898_TBL:
	push r14
; "A"
	jmp LB_907
LB_906:
	add r14,1
LB_907:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_906
	cmp rax,10
	jz LB_906
	cmp rax,32
	jz LB_906
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,65
	jz LB_909
	jmp NS_E_898_MTC_0_failed
LB_909:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; g0
	jmp LB_913
LB_912:
	add r14,1
LB_913:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_912
	cmp rax,10
	jz LB_912
	cmp rax,32
	jz LB_912
	call NS_E_898_ETR_TBL
	cmp r15,0
	jz LB_914
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_915
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_915:
	jmp NS_E_898_MTC_0_failed
LB_914:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "B"
	jmp LB_918
LB_917:
	add r14,1
LB_918:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_917
	cmp rax,10
	jz LB_917
	cmp rax,32
	jz LB_917
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,66
	jz LB_920
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_922
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_922:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_923
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_923:
	jmp NS_E_898_MTC_0_failed
LB_920:
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
	jc LB_902
	btr QWORD [rdi],2
LB_902:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_903
	btr QWORD [rdi],1
LB_903:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_904
	btr QWORD [rdi],0
LB_904:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_898_MTC_0_failed:
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
NS_E_898_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_933:
NS_E_RDI_933:
; 	» "A B" _ ⊢ 0' : %_925
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_42_20_41
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_926 : %_926
 ; {>  %_925~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_926
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f898 { %_925 %_926 } ⊢ { %_927 %_928 %_929 } : { %_927 %_928 %_929 }
 ; {>  %_926~1':_r64 %_925~0':_stg }
; _f898 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 0' 1' }
	call NS_E_898
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r9,r15
	bt r12,2
	jc LB_934
	btr r12,4
	jmp LB_935
LB_934:
	bts r12,4
LB_935:
	mov r15,r8
	bt r12,3
	jc LB_938
	btr r12,2
	jmp LB_939
LB_938:
	bts r12,2
LB_939:
	mov rsi,0
	bt r12,2
	jc LB_936
	bts rsi,17
	bt r15,0
	jc LB_936
	jmp LB_937
LB_936:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r15
	mov r15,rax
	btr r12,2
LB_937:
	mov rax,r9
	shl rax,56
	or rax,1
	mov rdi,rax
	or r15,rdi
; pop_iv
	add rsp,8
; _f14 { %_927 %_928 %_929 } ⊢ { %_930 %_931 %_932 } : { %_930 %_931 %_932 }
 ; {>  %_927~0':_stg %_929~2':(_opn)◂(_p897) %_928~1':_r64 }
; _f14 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_940
	btr r12,3
	jmp LB_941
LB_940:
	bts r12,3
LB_941:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,3
	jc LB_944
	btr r12,4
	jmp LB_945
LB_944:
	bts r12,4
LB_945:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_942
	btr QWORD [rdi],0
	jmp LB_943
LB_942:
	bts QWORD [rdi],0
LB_943:
	mov r9,r14
	bt r12,1
	jc LB_948
	btr r12,4
	jmp LB_949
LB_948:
	bts r12,4
LB_949:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_946
	btr QWORD [rdi],1
	jmp LB_947
LB_946:
	bts QWORD [rdi],1
LB_947:
	mov r9,r15
	bt r12,2
	jc LB_952
	btr r12,4
	jmp LB_953
LB_952:
	bts r12,4
LB_953:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_950
	btr QWORD [rdi],2
	jmp LB_951
LB_950:
	bts QWORD [rdi],2
LB_951:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' 2' }
	mov r8,r13
	bt r12,0
	jc LB_954
	btr r12,3
	jmp LB_955
LB_954:
	bts r12,3
LB_955:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_958
	btr r12,4
	jmp LB_959
LB_958:
	bts r12,4
LB_959:
	mov r13,r9
	bt r12,4
	jc LB_956
	btr r12,0
	jmp LB_957
LB_956:
	bts r12,0
LB_957:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_962
	btr r12,4
	jmp LB_963
LB_962:
	bts r12,4
LB_963:
	mov r14,r9
	bt r12,4
	jc LB_960
	btr r12,1
	jmp LB_961
LB_960:
	bts r12,1
LB_961:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_966
	btr r12,4
	jmp LB_967
LB_966:
	bts r12,4
LB_967:
	mov r15,r9
	bt r12,4
	jc LB_964
	btr r12,2
	jmp LB_965
LB_964:
	bts r12,2
LB_965:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_930~0':_stg %_932~2':(_opn)◂(_p897) %_931~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_968
	mov rdi,r13
	call dlt
LB_968:
	bt r12,2
	jc LB_969
	mov rdi,r15
	call dlt
LB_969:
	bt r12,1
	jc LB_970
	mov rdi,r14
	call dlt
LB_970:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_893:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_893
	NS_E_DYN_894:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_894
	NS_E_DYN_895:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_895
	NS_E_DYN_896:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_896
	NS_E_DYN_899:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_900:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_898:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_898
	CST_DYN_933:
		dq 0x0001_0001_00_82_ffff
		dq 1
