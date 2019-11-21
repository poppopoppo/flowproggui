%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_936
	call NS_E_1031
	call NS_E_1120
	call exec_out
	jmp _end
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
NS_E_915:
NS_E_RDI_915:
NS_E_915_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,0
	jz NS_E_915_LB_0
	bt r11,7
	jc LB_916
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
LB_916:
	add rsi,1
	bt r11,6
	jc LB_917
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
LB_917:
	add rsi,1
	bt r11,5
	jc LB_918
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
LB_918:
	add rsi,1
	bt r11,5
	jc LB_918
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
NS_E_915_LB_0:
	mov rax,0
	ret
NS_E_919:
NS_E_RDI_919:
NS_E_919_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_919_LB_0
	cmp r11,57
	ja NS_E_919_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_919_LB_0:
	mov rax,0
	ret
NS_E_921:
NS_E_RDI_921:
NS_E_921_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_921_LB_0
	cmp r11,122
	ja NS_E_921_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_921_LB_0:
	mov rax,0
	ret
NS_E_920:
NS_E_RDI_920:
NS_E_920_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_920_LB_0
	cmp r11,90
	ja NS_E_920_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_920_LB_0:
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
NS_E_926:
; 	|» 0'
NS_E_RDI_926:
; _f28 %_922 ⊢ { %_923 %_924 } : { %_923 %_924 }
 ; {>  %_922~0':_r64 }
	mov r14,r13
; _f26 { %_923 %_924 } ⊢ { %_925 _(912) } : { %_925 _(912) }
 ; {>  %_924~1':_r64 %_923~0':_r64 }
	add r13,r14
; ∎ %_925
 ; {>  %_925~0':_r64 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
NS_E_936:
NS_E_RDI_936:
; » 0xrff |~ {  } ⊢ %_927 : %_927
 ; {>  }
; 	» 0xrff _ ⊢ 0' : %_927
	mov rdi,0xff
	mov r13,rdi
	bts r12,0
; » 0xraa |~ {  } ⊢ %_928 : %_928
 ; {>  %_927~0':_r64 }
; 	» 0xraa _ ⊢ 1' : %_928
	mov rdi,0xaa
	mov r14,rdi
	bts r12,1
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { %_929 %_930 %_931 } : { %_929 %_930 %_931 }
 ; {>  %_927~0':_r64 %_928~1':_r64 }
; _f14 { { {  } {  } } {  } { {  } } } ⊢ { { {  } {  } } {  } { {  } } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { { {  } {  } } {  } { {  } } } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r15
	bt r12,2
	jc LB_943
	btr QWORD [rdi],0
	jmp LB_944
LB_943:
	bts QWORD [rdi],0
LB_944:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r15
	bt r12,2
	jc LB_945
	btr QWORD [rdi],1
	jmp LB_946
LB_945:
	bts QWORD [rdi],1
LB_946:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_941
	btr QWORD [rdi],0
	jmp LB_942
LB_941:
	bts QWORD [rdi],0
LB_942:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_947
	btr QWORD [rdi],1
	jmp LB_948
LB_947:
	bts QWORD [rdi],1
LB_948:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r15,rax
	btr r12,2
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r15
	bt r12,2
	jc LB_951
	btr QWORD [rdi],0
	jmp LB_952
LB_951:
	bts QWORD [rdi],0
LB_952:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_949
	btr QWORD [rdi],2
	jmp LB_950
LB_949:
	bts QWORD [rdi],2
LB_950:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { { {  } {  } } {  } { {  } } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_957
	btr r12,1
	jmp LB_958
LB_957:
	bts r12,1
LB_958:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_953
	btr r12,2
	jmp LB_954
LB_953:
	bts r12,2
LB_954:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_955
	btr r12,2
	jmp LB_956
LB_955:
	bts r12,2
LB_956:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_959
	btr r12,1
	jmp LB_960
LB_959:
	bts r12,1
LB_960:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_963
	btr r12,1
	jmp LB_964
LB_963:
	bts r12,1
LB_964:
	mov rdi,r14
	mov r15,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_961
	btr r12,2
	jmp LB_962
LB_961:
	bts r12,2
LB_962:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_939
	btr r12,1
	jmp LB_940
LB_939:
	bts r12,1
LB_940:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_937
	btr r12,0
	jmp LB_938
LB_937:
	bts r12,0
LB_938:
	add rsp,24
; _f14 %_929 ⊢ %_932 : %_932
 ; {>  %_927~0':_r64 %_929~{ {  } {  } }:{ { } { } } %_930~{  }:{ } %_928~1':_r64 %_931~{ {  } }:{ { } } }
; _f14 { {  } {  } } ⊢ { {  } {  } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { {  } {  } } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_969
	btr QWORD [rdi],0
	jmp LB_970
LB_969:
	bts QWORD [rdi],0
LB_970:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_971
	btr QWORD [rdi],1
	jmp LB_972
LB_971:
	bts QWORD [rdi],1
LB_972:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_973
	btr r12,1
	jmp LB_974
LB_973:
	bts r12,1
LB_974:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_975
	btr r12,1
	jmp LB_976
LB_975:
	bts r12,1
LB_976:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_967
	btr r12,1
	jmp LB_968
LB_967:
	bts r12,1
LB_968:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_965
	btr r12,0
	jmp LB_966
LB_965:
	bts r12,0
LB_966:
	add rsp,24
; _f14 %_930 ⊢ %_933 : %_933
 ; {>  %_927~0':_r64 %_930~{  }:{ } %_932~{ {  } {  } }:{ { } { } } %_928~1':_r64 %_931~{ {  } }:{ { } } }
; _f14 {  } ⊢ {  }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn {  } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_979
	btr r12,1
	jmp LB_980
LB_979:
	bts r12,1
LB_980:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_977
	btr r12,0
	jmp LB_978
LB_977:
	bts r12,0
LB_978:
	add rsp,24
; _f14 %_931 ⊢ _(913) : _(913)
 ; {>  %_927~0':_r64 %_933~{  }:{ } %_932~{ {  } {  } }:{ { } { } } %_928~1':_r64 %_931~{ {  } }:{ { } } }
; _f14 { {  } } ⊢ { {  } }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { {  } } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_985
	btr QWORD [rdi],0
	jmp LB_986
LB_985:
	bts QWORD [rdi],0
LB_986:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { {  } }
	mov rdi,r13
	mov r14,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_987
	btr r12,1
	jmp LB_988
LB_987:
	bts r12,1
LB_988:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_983
	btr r12,1
	jmp LB_984
LB_983:
	bts r12,1
LB_984:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_981
	btr r12,0
	jmp LB_982
LB_981:
	bts r12,0
LB_982:
	add rsp,24
; _f14 %_927 ⊢ %_934 : %_934
 ; {>  %_927~0':_r64 %_933~{  }:{ } %_932~{ {  } {  } }:{ { } { } } %_928~1':_r64 }
; _f14 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_989
	btr r12,1
	jmp LB_990
LB_989:
	bts r12,1
LB_990:
	add rsp,16
; _f14 { %_934 %_928 } ⊢ %_935 : %_935
 ; {>  %_934~0':_r64 %_933~{  }:{ } %_932~{ {  } {  } }:{ { } { } } %_928~1':_r64 }
; _f14 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_991
	btr r12,2
	jmp LB_992
LB_991:
	bts r12,2
LB_992:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r15
	bt r12,2
	jc LB_995
	btr r12,3
	jmp LB_996
LB_995:
	bts r12,3
LB_996:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_993
	btr QWORD [rdi],0
	jmp LB_994
LB_993:
	bts QWORD [rdi],0
LB_994:
	mov r8,r14
	bt r12,1
	jc LB_999
	btr r12,3
	jmp LB_1000
LB_999:
	bts r12,3
LB_1000:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_997
	btr QWORD [rdi],1
	jmp LB_998
LB_997:
	bts QWORD [rdi],1
LB_998:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' }
	mov r15,r13
	bt r12,0
	jc LB_1001
	btr r12,2
	jmp LB_1002
LB_1001:
	bts r12,2
LB_1002:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_1005
	btr r12,3
	jmp LB_1006
LB_1005:
	bts r12,3
LB_1006:
	mov r13,r8
	bt r12,3
	jc LB_1003
	btr r12,0
	jmp LB_1004
LB_1003:
	bts r12,0
LB_1004:
	mov rdi,r15
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_1009
	btr r12,3
	jmp LB_1010
LB_1009:
	bts r12,3
LB_1010:
	mov r14,r8
	bt r12,3
	jc LB_1007
	btr r12,1
	jmp LB_1008
LB_1007:
	bts r12,1
LB_1008:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_935~{ 0' 1' }:{ _r64 _r64 } %_933~{  }:{ } %_932~{ {  } {  } }:{ { } { } } }
; 	∎ {  }
	bt r12,0
	jc LB_1011
	mov rdi,r13
	call dlt
LB_1011:
	bt r12,1
	jc LB_1012
	mov rdi,r14
	call dlt
LB_1012:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_1031:
NS_E_RDI_1031:
; » 0xr89873 |~ {  } ⊢ %_1013 : %_1013
 ; {>  }
; 	» 0xr89873 _ ⊢ 0' : %_1013
	mov rdi,0x89873
	mov r13,rdi
	bts r12,0
; » 0xrfff |~ {  } ⊢ %_1014 : %_1014
 ; {>  %_1013~0':_r64 }
; 	» 0xrfff _ ⊢ 1' : %_1014
	mov rdi,0xfff
	mov r14,rdi
	bts r12,1
; » 0xrafa |~ {  } ⊢ %_1015 : %_1015
 ; {>  %_1014~1':_r64 %_1013~0':_r64 }
; 	» 0xrafa _ ⊢ 2' : %_1015
	mov rdi,0xafa
	mov r15,rdi
	bts r12,2
; _f26 { %_1014 %_1015 } ⊢ { %_1016 %_1017 } : { %_1016 %_1017 }
 ; {>  %_1014~1':_r64 %_1015~2':_r64 %_1013~0':_r64 }
	add r14,r15
; _f14 { %_1016 %_1017 } ⊢ { %_1018 %_1019 } : { %_1018 %_1019 }
 ; {>  %_1016~1':_r64 %_1017~2':_r64 %_1013~0':_r64 }
; _f14 { 1' 2' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 1' 2' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r8,r14
	bt r12,1
	jc LB_1036
	btr r12,3
	jmp LB_1037
LB_1036:
	bts r12,3
LB_1037:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,3
	jc LB_1034
	btr QWORD [rdi],0
	jmp LB_1035
LB_1034:
	bts QWORD [rdi],0
LB_1035:
	mov r8,r15
	bt r12,2
	jc LB_1040
	btr r12,3
	jmp LB_1041
LB_1040:
	bts r12,3
LB_1041:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,3
	jc LB_1038
	btr QWORD [rdi],1
	jmp LB_1039
LB_1038:
	bts QWORD [rdi],1
LB_1039:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 1' 2' }
	mov rdi,r13
	mov r8,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_1044
	btr r12,3
	jmp LB_1045
LB_1044:
	bts r12,3
LB_1045:
	mov r14,r8
	bt r12,3
	jc LB_1042
	btr r12,1
	jmp LB_1043
LB_1042:
	bts r12,1
LB_1043:
	mov rdi,r13
	mov r8,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_1048
	btr r12,3
	jmp LB_1049
LB_1048:
	bts r12,3
LB_1049:
	mov r15,r8
	bt r12,3
	jc LB_1046
	btr r12,2
	jmp LB_1047
LB_1046:
	bts r12,2
LB_1047:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1032
	btr r12,0
	jmp LB_1033
LB_1032:
	bts r12,0
LB_1033:
	add rsp,16
; _f27 { %_1013 %_1018 } ⊢ { %_1020 %_1021 } : { %_1020 %_1021 }
 ; {>  %_1019~2':_r64 %_1018~1':_r64 %_1013~0':_r64 }
	mov r13,r14
; _f28 %_1020 ⊢ { %_1022 _(914) } : { %_1022 _(914) }
 ; {>  %_1019~2':_r64 %_1021~1':_r64 %_1020~0':_r64 }
	mov r8,r13
; » 0xr1 |~ {  } ⊢ %_1023 : %_1023
 ; {>  %_1022~0':_r64 %_1019~2':_r64 %_1021~1':_r64 }
; 	» 0xr1 _ ⊢ 3' : %_1023
	mov rdi,0x1
	mov r8,rdi
	bts r12,3
; _f926 %_1023 ⊢ %_1024 : %_1024
 ; {>  %_1023~3':_r64 %_1022~0':_r64 %_1019~2':_r64 %_1021~1':_r64 }
; _f926 3' ⊢ 3'
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
	call NS_E_926
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
; _f926 %_1024 ⊢ %_1025 : %_1025
 ; {>  %_1022~0':_r64 %_1019~2':_r64 %_1021~1':_r64 %_1024~3':_r64 }
; _f926 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_1066
	btr r12,0
	jmp LB_1067
LB_1066:
	bts r12,0
LB_1067:
	call NS_E_926
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_1068
	btr r12,3
	jmp LB_1069
LB_1068:
	bts r12,3
LB_1069:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1064
	btr r12,2
	jmp LB_1065
LB_1064:
	bts r12,2
LB_1065:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1062
	btr r12,1
	jmp LB_1063
LB_1062:
	bts r12,1
LB_1063:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1060
	btr r12,0
	jmp LB_1061
LB_1060:
	bts r12,0
LB_1061:
	add rsp,32
; _f14 { %_1022 %_1021 %_1025 } ⊢ { %_1026 %_1027 %_1028 } : { %_1026 %_1027 %_1028 }
 ; {>  %_1022~0':_r64 %_1019~2':_r64 %_1025~3':_r64 %_1021~1':_r64 }
; _f14 { 0' 1' 3' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r15
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 3' } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_1072
	btr r12,2
	jmp LB_1073
LB_1072:
	bts r12,2
LB_1073:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r15
	bt r12,2
	jc LB_1076
	btr r12,4
	jmp LB_1077
LB_1076:
	bts r12,4
LB_1077:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_1074
	btr QWORD [rdi],0
	jmp LB_1075
LB_1074:
	bts QWORD [rdi],0
LB_1075:
	mov r9,r14
	bt r12,1
	jc LB_1080
	btr r12,4
	jmp LB_1081
LB_1080:
	bts r12,4
LB_1081:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_1078
	btr QWORD [rdi],1
	jmp LB_1079
LB_1078:
	bts QWORD [rdi],1
LB_1079:
	mov r9,r8
	bt r12,3
	jc LB_1084
	btr r12,4
	jmp LB_1085
LB_1084:
	bts r12,4
LB_1085:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_1082
	btr QWORD [rdi],2
	jmp LB_1083
LB_1082:
	bts QWORD [rdi],2
LB_1083:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' 3' }
	mov r15,r13
	bt r12,0
	jc LB_1086
	btr r12,2
	jmp LB_1087
LB_1086:
	bts r12,2
LB_1087:
	mov rdi,r15
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_1090
	btr r12,4
	jmp LB_1091
LB_1090:
	bts r12,4
LB_1091:
	mov r13,r9
	bt r12,4
	jc LB_1088
	btr r12,0
	jmp LB_1089
LB_1088:
	bts r12,0
LB_1089:
	mov rdi,r15
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_1094
	btr r12,4
	jmp LB_1095
LB_1094:
	bts r12,4
LB_1095:
	mov r14,r9
	bt r12,4
	jc LB_1092
	btr r12,1
	jmp LB_1093
LB_1092:
	bts r12,1
LB_1093:
	mov rdi,r15
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_1098
	btr r12,4
	jmp LB_1099
LB_1098:
	bts r12,4
LB_1099:
	mov r8,r9
	bt r12,4
	jc LB_1096
	btr r12,3
	jmp LB_1097
LB_1096:
	bts r12,3
LB_1097:
	mov rdi,r15
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r15,QWORD [rsp+8+8*0]
	bt QWORD [rsp],2
	jc LB_1070
	btr r12,2
	jmp LB_1071
LB_1070:
	bts r12,2
LB_1071:
	add rsp,16
; 	» "Hello World !!" _ ⊢ 4' : %_1029
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,14
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
	mov rax,0x_6f_57_20_6f_6c_6c_65_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_21_21_20_64_6c_72
	mov QWORD [rdi+8*1+8*1],rax
	mov r9,rdi
	btr r12,4
; _f14 %_1029 ⊢ %_1030 : %_1030
 ; {>  %_1026~0':_r64 %_1019~2':_r64 %_1028~3':_r64 %_1027~1':_r64 %_1029~4':_stg }
; _f14 4' ⊢ 4'
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
	jc LB_1108
	btr r12,0
	jmp LB_1109
LB_1108:
	bts r12,0
LB_1109:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_1110
	btr r12,4
	jmp LB_1111
LB_1110:
	bts r12,4
LB_1111:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_1106
	btr r12,3
	jmp LB_1107
LB_1106:
	bts r12,3
LB_1107:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_1104
	btr r12,2
	jmp LB_1105
LB_1104:
	bts r12,2
LB_1105:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_1102
	btr r12,1
	jmp LB_1103
LB_1102:
	bts r12,1
LB_1103:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_1100
	btr r12,0
	jmp LB_1101
LB_1100:
	bts r12,0
LB_1101:
	add rsp,40
; ∎ {  }
 ; {>  %_1026~0':_r64 %_1019~2':_r64 %_1030~4':_stg %_1028~3':_r64 %_1027~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_1112
	mov rdi,r13
	call dlt
LB_1112:
	bt r12,2
	jc LB_1113
	mov rdi,r15
	call dlt
LB_1113:
	bt r12,4
	jc LB_1114
	mov rdi,r9
	call dlt
LB_1114:
	bt r12,3
	jc LB_1115
	mov rdi,r8
	call dlt
LB_1115:
	bt r12,1
	jc LB_1116
	mov rdi,r14
	call dlt
LB_1116:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_1120:
NS_E_RDI_1120:
; _none {  } ⊢ %_1117 : %_1117
 ; {>  }
; _none {  } ⊢ 0◂{  }
	mov r13,1
	bts r12,0
; _some %_1117 ⊢ %_1118 : %_1118
 ; {>  %_1117~0◂{  }:(_opn)◂(t528'(0)) }
; _some 0◂{  } ⊢ 1◂0◂{  }
	mov r14,0
	bts r12,1
; _f14 %_1118 ⊢ %_1119 : %_1119
 ; {>  %_1118~1◂0◂{  }:(_opn)◂((_opn)◂(t531'(0))) }
; _f14 1◂0◂{  } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 1◂0◂{  } ⊢ 0'
	mov r15,r13
	bt r12,0
	jc LB_1121
	btr r12,2
	jmp LB_1122
LB_1121:
	bts r12,2
LB_1122:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,0
	bt r12,0
	jc LB_1125
	bts rsi,17
	bt r13,0
	jc LB_1125
	jmp LB_1126
LB_1125:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_1126:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r13,rdi
	mov rsi,0
	bt r12,0
	jc LB_1123
	bts rsi,17
	bt r13,0
	jc LB_1123
	jmp LB_1124
LB_1123:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_1124:
	mov rax,r14
	shl rax,56
	or rax,1
	mov rdi,rax
	or r13,rdi
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_1119~0':(_opn)◂((_opn)◂(t534'(0))) }
; 	∎ {  }
	bt r12,0
	jc LB_1127
	mov rdi,r13
	call dlt
LB_1127:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_915:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_915
	NS_E_DYN_919:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_919
	NS_E_DYN_920:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_920
	NS_E_DYN_921:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_921
	NS_E_DYN_926:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_926
	CST_DYN_936:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_1031:
		dq 0x0001_0001_00_82_ffff
		dq 1
	CST_DYN_1120:
		dq 0x0001_0001_00_82_ffff
		dq 1
