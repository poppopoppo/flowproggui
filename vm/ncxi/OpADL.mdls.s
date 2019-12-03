%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_1984
	call NS_E_2820
	call exec_out
	jmp _end
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
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
NS_E_1928:
NS_E_RDI_1928:
NS_E_1928_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_1929
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_1929:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1931:
NS_E_RDI_1931:
NS_E_1931_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_1931_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_1931_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1932:
NS_E_RDI_1932:
NS_E_1932_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_1932_LB_0
	cmp r11,57
	ja NS_E_1932_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1932_LB_0:
	mov rax,0
	ret
NS_E_1934:
NS_E_RDI_1934:
NS_E_1934_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_1934_LB_0
	cmp r11,122
	ja NS_E_1934_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1934_LB_0:
	mov rax,0
	ret
NS_E_1933:
NS_E_RDI_1933:
NS_E_1933_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_1933_LB_0
	cmp r11,90
	ja NS_E_1933_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1933_LB_0:
	mov rax,0
	ret
NS_E_22:
NS_E_RDI_22:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_26:
	mov rdi,r8
	bt r12,0
NS_E_RDI_26:
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
NS_E_ID_15: dq 0
NS_E_15:
NS_E_RDI_15:
	mov rdi,r13
	mov rsi,r14
	mov rax,[rdi]
	shr rax,32
	cmp rsi,rax
	jge err
	mov rax,QWORD [rdi+8+rsi]
	and rax,0xff
	mov r15
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
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_1930:
NS_E_RDI_1930:
NS_E_1930_ETR_TBL:
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
	jz NS_E_1930_LB_0
	mov r14,rsi
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
NS_E_1930_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1935:
NS_E_RDI_1935:
NS_E_1935_ETR_TBL:
NS_E_1935_TBL:
	push r14
; _byt
	call NS_E_1928_ETR_TBL
	cmp r15,0
	jz LB_1954
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_1935_MTC_0_failed
LB_1954:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	push r13
	push r14
	push LB_1946
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1950
	btr r12,0
	jmp LB_1951
LB_1950:
	bts r12,0
LB_1951:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov r13,rax
; _emt_mov_ptn_to_ptn { 0' } ⊢ { 0' }
; _some %_1937 ⊢ %_1938 : %_1938
 ; {>  %_1937~0':_r64 }
; _some 0' ⊢ 1'◂0'
	mov r14,0
	bts r12,1
; ∎ %_1938
 ; {>  %_1938~1'◂0':(_opn)◂(_r64) }
; 	∎ 1'◂0'
; _emt_mov_ptn_to_ptn 1'◂0' ⊢ 2'◂3'
	mov r15,r14
	bt r12,1
	jc LB_1942
	btr r12,2
	jmp LB_1943
LB_1942:
	bts r12,2
LB_1943:
	mov r8,r13
	bt r12,0
	jc LB_1944
	btr r12,3
	jmp LB_1945
LB_1944:
	bts r12,3
LB_1945:
	ret
LB_1946:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r15,0
	jz LB_1948
	pop r14
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp LB_1947
LB_1948:
	add rsp,8
	ret
NS_E_1935_MTC_0_failed:
	pop r14
LB_1947:
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1936:
NS_E_RDI_1936:
NS_E_1936_ETR_TBL:
NS_E_1936_TBL:
	push r14
; "J"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,74
	jz LB_1967
	jmp NS_E_1936_MTC_0_failed
LB_1967:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	push r13
	push r14
	push LB_1958
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1962
	btr r12,0
	jmp LB_1963
LB_1962:
	bts r12,0
LB_1963:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov r13,rax
; _emt_mov_ptn_to_ptn { 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_1940 : %_1940
 ; {>  %_1939~{  }:{ } }
; _none {  } ⊢ 0'◂{  }
	mov r13,1
	bts r12,0
; ∎ %_1940
 ; {>  %_1940~0'◂{  }:(_opn)◂(t137'(0)) %_1939~{  }:{ } }
; 	∎ 0'◂{  }
; _emt_mov_ptn_to_ptn 0'◂{  } ⊢ 2'◂3'
	mov r15,r13
	bt r12,0
	jc LB_1956
	btr r12,2
	jmp LB_1957
LB_1956:
	bts r12,2
LB_1957:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,3
	ret
LB_1958:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r15,0
	jz LB_1960
	pop r14
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp LB_1959
LB_1960:
	add rsp,8
	ret
NS_E_1936_MTC_0_failed:
	pop r14
LB_1959:
	push r14
	push r13
	push r14
	push LB_1972
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
; _none {  } ⊢ %_1941 : %_1941
 ; {>  }
; _none {  } ⊢ 0'◂{  }
	mov r13,1
	bts r12,0
; ∎ %_1941
 ; {>  %_1941~0'◂{  }:(_opn)◂(t140'(0)) }
; 	∎ 0'◂{  }
; _emt_mov_ptn_to_ptn 0'◂{  } ⊢ 2'◂3'
	mov r15,r13
	bt r12,0
	jc LB_1970
	btr r12,2
	jmp LB_1971
LB_1970:
	bts r12,2
LB_1971:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,3
	ret
LB_1972:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r15,0
	jz LB_1974
	pop r14
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp LB_1973
LB_1974:
	add rsp,8
	ret
NS_E_1936_MTC_1_failed:
	pop r14
LB_1973:
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1984:
NS_E_RDI_1984:
; » _^ ..
	mov rax,2
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "JJ"
	mov rsi,0x_00_00_00_00_00_00_4a_4a
	mov QWORD [rdi+8*0],rsi
	add rdi,2
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_1977 : %_1977
 ; {>  %_1976~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_1977
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f1936 { %_1976 %_1977 } ⊢ { %_1978 %_1979 %_1980 } : { %_1978 %_1979 %_1980 }
 ; {>  %_1976~0':_stg %_1977~1':_r64 }
; _f1936 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 0' 1' }
	call NS_E_1936
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r9,r15
	bt r12,2
	jc LB_1985
	btr r12,4
	jmp LB_1986
LB_1985:
	bts r12,4
LB_1986:
	mov r15,r8
	bt r12,3
	jc LB_1989
	btr r12,2
	jmp LB_1990
LB_1989:
	bts r12,2
LB_1990:
	mov rsi,1
	bt r12,2
	jc LB_1987
	mov rsi,0
	bt r15,0
	jc LB_1987
	jmp LB_1988
LB_1987:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r15
	mov r15,rax
	btr r12,2
LB_1988:
	mov rax,r9
	shl rax,56
	or rax,1
	mov rdi,rax
	or r15,rdi
; pop_iv
	add rsp,8
; _f19 { %_1978 %_1979 %_1980 } ⊢ { %_1981 %_1982 %_1983 } : { %_1981 %_1982 %_1983 }
 ; {>  %_1979~1':_r64 %_1978~0':_stg %_1980~2':(_opn)◂(t154'(0)) }
; _f19 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 1' 2' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1991
	btr r12,3
	jmp LB_1992
LB_1991:
	bts r12,3
LB_1992:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,3
	jc LB_1995
	btr r12,4
	jmp LB_1996
LB_1995:
	bts r12,4
LB_1996:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_1993
	btr QWORD [rdi],0
	jmp LB_1994
LB_1993:
	bts QWORD [rdi],0
LB_1994:
	mov r9,r14
	bt r12,1
	jc LB_1999
	btr r12,4
	jmp LB_2000
LB_1999:
	bts r12,4
LB_2000:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_1997
	btr QWORD [rdi],1
	jmp LB_1998
LB_1997:
	bts QWORD [rdi],1
LB_1998:
	mov r9,r15
	bt r12,2
	jc LB_2003
	btr r12,4
	jmp LB_2004
LB_2003:
	bts r12,4
LB_2004:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_2001
	btr QWORD [rdi],2
	jmp LB_2002
LB_2001:
	bts QWORD [rdi],2
LB_2002:
	call NS_E_19
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 1' 2' }
	mov r8,r13
	bt r12,0
	jc LB_2005
	btr r12,3
	jmp LB_2006
LB_2005:
	bts r12,3
LB_2006:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_2009
	btr r12,4
	jmp LB_2010
LB_2009:
	bts r12,4
LB_2010:
	mov r13,r9
	bt r12,4
	jc LB_2007
	btr r12,0
	jmp LB_2008
LB_2007:
	bts r12,0
LB_2008:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_2013
	btr r12,4
	jmp LB_2014
LB_2013:
	bts r12,4
LB_2014:
	mov r14,r9
	bt r12,4
	jc LB_2011
	btr r12,1
	jmp LB_2012
LB_2011:
	bts r12,1
LB_2012:
	mov rdi,r8
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_2017
	btr r12,4
	jmp LB_2018
LB_2017:
	bts r12,4
LB_2018:
	mov r15,r9
	bt r12,4
	jc LB_2015
	btr r12,2
	jmp LB_2016
LB_2015:
	bts r12,2
LB_2016:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	add rsp,8
; ∎ {  }
 ; {>  %_1981~0':_stg %_1982~1':_r64 %_1983~2':(_opn)◂(t159'(0)) }
; 	∎ {  }
	bt r12,0
	jc LB_2019
	mov rdi,r13
	call dlt
LB_2019:
	bt r12,1
	jc LB_2020
	mov rdi,r14
	call dlt
LB_2020:
	bt r12,2
	jc LB_2021
	mov rdi,r15
	call dlt
LB_2021:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
NS_E_2023:
NS_E_RDI_2023:
NS_E_2023_ETR_TBL:
NS_E_2023_TBL:
; c0
	push r14
; glb_etr
	call NS_E_2025_ETR_TBL
	cmp r15,0
	jz LB_2112
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2023_MTC_0_failed
LB_2112:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; glb_etr_lst
	call NS_E_2023_ETR_TBL
	cmp r15,0
	jz LB_2116
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2117
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2117:
	jmp NS_E_2023_MTC_0_failed
LB_2116:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2107
	btr QWORD [rdi],1
LB_2107:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2108
	btr QWORD [rdi],0
LB_2108:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2023_MTC_0_failed:
	pop r14
; c1
	push r14
	add rsp,8
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
NS_E_2023_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2025:
NS_E_RDI_2025:
NS_E_2025_ETR_TBL:
NS_E_2025_TBL:
; c0
	push r14
; mdl_etr
	call NS_E_2027_ETR_TBL
	cmp r15,0
	jz LB_2141
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2025_MTC_0_failed
LB_2141:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2137
	btr QWORD [rdi],0
LB_2137:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2025_MTC_0_failed:
	pop r14
; c1
	push r14
; cst_etr
	call NS_E_2029_ETR_TBL
	cmp r15,0
	jz LB_2135
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2025_MTC_1_failed
LB_2135:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2131
	btr QWORD [rdi],0
LB_2131:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2025_MTC_1_failed:
	pop r14
; c2
	push r14
; op_etr
	call NS_E_2031_ETR_TBL
	cmp r15,0
	jz LB_2129
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2025_MTC_2_failed
LB_2129:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2125
	btr QWORD [rdi],0
LB_2125:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2025_MTC_2_failed:
	pop r14
; c3
	push r14
; dta_etr
	call NS_E_2033_ETR_TBL
	cmp r15,0
	jz LB_2123
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2025_MTC_3_failed
LB_2123:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2119
	btr QWORD [rdi],0
LB_2119:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2025_MTC_3_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2027:
NS_E_RDI_2027:
NS_E_2027_ETR_TBL:
NS_E_2027_TBL:
; c0
	push r14
; "\194\167\194\167"
	jmp LB_2186
LB_2185:
	add r14,1
LB_2186:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2185
	cmp rax,10
	jz LB_2185
	cmp rax,32
	jz LB_2185
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2188
	jmp NS_E_2027_MTC_0_failed
LB_2188:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2189
	jmp NS_E_2027_MTC_0_failed
LB_2189:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_2190
	jmp NS_E_2027_MTC_0_failed
LB_2190:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_2191
	jmp NS_E_2027_MTC_0_failed
LB_2191:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2198
LB_2197:
	add r14,1
LB_2198:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2197
	cmp rax,10
	jz LB_2197
	cmp rax,32
	jz LB_2197
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2199
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2200
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2200:
	jmp NS_E_2027_MTC_0_failed
LB_2199:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; glb_etr_lst
	jmp LB_2203
LB_2202:
	add r14,1
LB_2203:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2202
	cmp rax,10
	jz LB_2202
	cmp rax,32
	jz LB_2202
	call NS_E_2023_ETR_TBL
	cmp r15,0
	jz LB_2204
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2205
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2205:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2206
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2206:
	jmp NS_E_2027_MTC_0_failed
LB_2204:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; "\226\136\142\226\136\142"
	jmp LB_2209
LB_2208:
	add r14,1
LB_2209:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2208
	cmp rax,10
	jz LB_2208
	cmp rax,32
	jz LB_2208
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2211
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2238
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2238:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2239
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2239:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2240
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2240:
	jmp NS_E_2027_MTC_0_failed
LB_2211:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_2212
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2234
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2234:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2235
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2235:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2236
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2236:
	jmp NS_E_2027_MTC_0_failed
LB_2212:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_2213
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2230
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2230:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2231
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2231:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2232
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2232:
	jmp NS_E_2027_MTC_0_failed
LB_2213:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,226
	jz LB_2214
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2226
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2226:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2227
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2227:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2228
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2228:
	jmp NS_E_2027_MTC_0_failed
LB_2214:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+4]
	cmp al,136
	jz LB_2215
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2222
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2222:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2223
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2223:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2224
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2224:
	jmp NS_E_2027_MTC_0_failed
LB_2215:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+5]
	cmp al,142
	jz LB_2216
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2218
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2218:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2219
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2219:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2220
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2220:
	jmp NS_E_2027_MTC_0_failed
LB_2216:
	add r14,6
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*3],0
	mov QWORD [prs_vct+8*1+16*3],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2180
	btr QWORD [rdi],3
LB_2180:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2181
	btr QWORD [rdi],2
LB_2181:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2182
	btr QWORD [rdi],1
LB_2182:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2183
	btr QWORD [rdi],0
LB_2183:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2027_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\167\194\167"
	jmp LB_2149
LB_2148:
	add r14,1
LB_2149:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2148
	cmp rax,10
	jz LB_2148
	cmp rax,32
	jz LB_2148
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2151
	jmp NS_E_2027_MTC_1_failed
LB_2151:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2152
	jmp NS_E_2027_MTC_1_failed
LB_2152:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_2153
	jmp NS_E_2027_MTC_1_failed
LB_2153:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_2154
	jmp NS_E_2027_MTC_1_failed
LB_2154:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2161
LB_2160:
	add r14,1
LB_2161:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2160
	cmp rax,10
	jz LB_2160
	cmp rax,32
	jz LB_2160
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2162
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2163
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2163:
	jmp NS_E_2027_MTC_1_failed
LB_2162:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_2166
LB_2165:
	add r14,1
LB_2166:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2165
	cmp rax,10
	jz LB_2165
	cmp rax,32
	jz LB_2165
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_2168
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2170
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2170:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2171
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2171:
	jmp NS_E_2027_MTC_1_failed
LB_2168:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_2174
LB_2173:
	add r14,1
LB_2174:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2173
	cmp rax,10
	jz LB_2173
	cmp rax,32
	jz LB_2173
	call NS_E_2041_ETR_TBL
	cmp r15,0
	jz LB_2175
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2176
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2176:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2177
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2177:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2178
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2178:
	jmp NS_E_2027_MTC_1_failed
LB_2175:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2143
	btr QWORD [rdi],3
LB_2143:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2144
	btr QWORD [rdi],2
LB_2144:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2145
	btr QWORD [rdi],1
LB_2145:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2146
	btr QWORD [rdi],0
LB_2146:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2027_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2029:
NS_E_RDI_2029:
NS_E_2029_ETR_TBL:
NS_E_2029_TBL:
; c0
	push r14
; "\194\167"
	jmp LB_2281
LB_2280:
	add r14,1
LB_2281:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2280
	cmp rax,10
	jz LB_2280
	cmp rax,32
	jz LB_2280
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2283
	jmp NS_E_2029_MTC_0_failed
LB_2283:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2284
	jmp NS_E_2029_MTC_0_failed
LB_2284:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2289
LB_2288:
	add r14,1
LB_2289:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2288
	cmp rax,10
	jz LB_2288
	cmp rax,32
	jz LB_2288
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2290
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2291
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2291:
	jmp NS_E_2029_MTC_0_failed
LB_2290:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\194\171"
	jmp LB_2294
LB_2293:
	add r14,1
LB_2294:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2293
	cmp rax,10
	jz LB_2293
	cmp rax,32
	jz LB_2293
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2296
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2302
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2302:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2303
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2303:
	jmp NS_E_2029_MTC_0_failed
LB_2296:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,171
	jz LB_2297
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2299
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2299:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2300
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2300:
	jmp NS_E_2029_MTC_0_failed
LB_2297:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; op_lines
	jmp LB_2306
LB_2305:
	add r14,1
LB_2306:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2305
	cmp rax,10
	jz LB_2305
	cmp rax,32
	jz LB_2305
	call NS_E_2047_ETR_TBL
	cmp r15,0
	jz LB_2307
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2308
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2308:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2309
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2309:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2310
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2310:
	jmp NS_E_2029_MTC_0_failed
LB_2307:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2275
	btr QWORD [rdi],3
LB_2275:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2276
	btr QWORD [rdi],2
LB_2276:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2277
	btr QWORD [rdi],1
LB_2277:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2278
	btr QWORD [rdi],0
LB_2278:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2029_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\167"
	jmp LB_2248
LB_2247:
	add r14,1
LB_2248:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2247
	cmp rax,10
	jz LB_2247
	cmp rax,32
	jz LB_2247
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2250
	jmp NS_E_2029_MTC_1_failed
LB_2250:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2251
	jmp NS_E_2029_MTC_1_failed
LB_2251:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2256
LB_2255:
	add r14,1
LB_2256:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2255
	cmp rax,10
	jz LB_2255
	cmp rax,32
	jz LB_2255
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2257
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2258
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2258:
	jmp NS_E_2029_MTC_1_failed
LB_2257:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_2261
LB_2260:
	add r14,1
LB_2261:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2260
	cmp rax,10
	jz LB_2260
	cmp rax,32
	jz LB_2260
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_2263
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2265
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2265:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2266
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2266:
	jmp NS_E_2029_MTC_1_failed
LB_2263:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; cst
	jmp LB_2269
LB_2268:
	add r14,1
LB_2269:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2268
	cmp rax,10
	jz LB_2268
	cmp rax,32
	jz LB_2268
	call NS_E_2035_ETR_TBL
	cmp r15,0
	jz LB_2270
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2271
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2271:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2272
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2272:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2273
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2273:
	jmp NS_E_2029_MTC_1_failed
LB_2270:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2242
	btr QWORD [rdi],3
LB_2242:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2243
	btr QWORD [rdi],2
LB_2243:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2244
	btr QWORD [rdi],1
LB_2244:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2245
	btr QWORD [rdi],0
LB_2245:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2029_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2031:
NS_E_RDI_2031:
NS_E_2031_ETR_TBL:
NS_E_2031_TBL:
; c0
	push r14
; "\194\167"
	jmp LB_2351
LB_2350:
	add r14,1
LB_2351:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2350
	cmp rax,10
	jz LB_2350
	cmp rax,32
	jz LB_2350
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2353
	jmp NS_E_2031_MTC_0_failed
LB_2353:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2354
	jmp NS_E_2031_MTC_0_failed
LB_2354:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2359
LB_2358:
	add r14,1
LB_2359:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2358
	cmp rax,10
	jz LB_2358
	cmp rax,32
	jz LB_2358
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2360
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2361
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2361:
	jmp NS_E_2031_MTC_0_failed
LB_2360:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; reg_ptn
	jmp LB_2364
LB_2363:
	add r14,1
LB_2364:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2363
	cmp rax,10
	jz LB_2363
	cmp rax,32
	jz LB_2363
	call NS_E_2059_ETR_TBL
	cmp r15,0
	jz LB_2365
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2366
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2366:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2367
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2367:
	jmp NS_E_2031_MTC_0_failed
LB_2365:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; op_lines
	jmp LB_2370
LB_2369:
	add r14,1
LB_2370:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2369
	cmp rax,10
	jz LB_2369
	cmp rax,32
	jz LB_2369
	call NS_E_2047_ETR_TBL
	cmp r15,0
	jz LB_2371
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2372
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2372:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2373
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2373:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2374
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2374:
	jmp NS_E_2031_MTC_0_failed
LB_2371:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2345
	btr QWORD [rdi],3
LB_2345:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2346
	btr QWORD [rdi],2
LB_2346:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2347
	btr QWORD [rdi],1
LB_2347:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2348
	btr QWORD [rdi],0
LB_2348:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2031_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\167"
	jmp LB_2318
LB_2317:
	add r14,1
LB_2318:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2317
	cmp rax,10
	jz LB_2317
	cmp rax,32
	jz LB_2317
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2320
	jmp NS_E_2031_MTC_1_failed
LB_2320:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2321
	jmp NS_E_2031_MTC_1_failed
LB_2321:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2326
LB_2325:
	add r14,1
LB_2326:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2325
	cmp rax,10
	jz LB_2325
	cmp rax,32
	jz LB_2325
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2327
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2328
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2328:
	jmp NS_E_2031_MTC_1_failed
LB_2327:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_2331
LB_2330:
	add r14,1
LB_2331:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2330
	cmp rax,10
	jz LB_2330
	cmp rax,32
	jz LB_2330
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_2333
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2335
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2335:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2336
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2336:
	jmp NS_E_2031_MTC_1_failed
LB_2333:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_2339
LB_2338:
	add r14,1
LB_2339:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2338
	cmp rax,10
	jz LB_2338
	cmp rax,32
	jz LB_2338
	call NS_E_2041_ETR_TBL
	cmp r15,0
	jz LB_2340
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2341
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2341:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2342
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2342:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2343
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2343:
	jmp NS_E_2031_MTC_1_failed
LB_2340:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2312
	btr QWORD [rdi],3
LB_2312:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2313
	btr QWORD [rdi],2
LB_2313:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2314
	btr QWORD [rdi],1
LB_2314:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2315
	btr QWORD [rdi],0
LB_2315:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2031_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2033:
NS_E_RDI_2033:
NS_E_2033_ETR_TBL:
NS_E_2033_TBL:
; c0
	push r14
; "\194\182"
	jmp LB_2414
LB_2413:
	add r14,1
LB_2414:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2413
	cmp rax,10
	jz LB_2413
	cmp rax,32
	jz LB_2413
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2416
	jmp NS_E_2033_MTC_0_failed
LB_2416:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_2417
	jmp NS_E_2033_MTC_0_failed
LB_2417:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2422
LB_2421:
	add r14,1
LB_2422:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2421
	cmp rax,10
	jz LB_2421
	cmp rax,32
	jz LB_2421
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2423
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2424
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2424:
	jmp NS_E_2033_MTC_0_failed
LB_2423:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; dta_def
	jmp LB_2427
LB_2426:
	add r14,1
LB_2427:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2426
	cmp rax,10
	jz LB_2426
	cmp rax,32
	jz LB_2426
	call NS_E_2043_ETR_TBL
	cmp r15,0
	jz LB_2428
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2429
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2429:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2430
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2430:
	jmp NS_E_2033_MTC_0_failed
LB_2428:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2409
	btr QWORD [rdi],2
LB_2409:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2410
	btr QWORD [rdi],1
LB_2410:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2411
	btr QWORD [rdi],0
LB_2411:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2033_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\182"
	jmp LB_2382
LB_2381:
	add r14,1
LB_2382:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2381
	cmp rax,10
	jz LB_2381
	cmp rax,32
	jz LB_2381
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2384
	jmp NS_E_2033_MTC_1_failed
LB_2384:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_2385
	jmp NS_E_2033_MTC_1_failed
LB_2385:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2390
LB_2389:
	add r14,1
LB_2390:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2389
	cmp rax,10
	jz LB_2389
	cmp rax,32
	jz LB_2389
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2391
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2392
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2392:
	jmp NS_E_2033_MTC_1_failed
LB_2391:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_2395
LB_2394:
	add r14,1
LB_2395:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2394
	cmp rax,10
	jz LB_2394
	cmp rax,32
	jz LB_2394
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_2397
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2399
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2399:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2400
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2400:
	jmp NS_E_2033_MTC_1_failed
LB_2397:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_2403
LB_2402:
	add r14,1
LB_2403:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2402
	cmp rax,10
	jz LB_2402
	cmp rax,32
	jz LB_2402
	call NS_E_2041_ETR_TBL
	cmp r15,0
	jz LB_2404
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2405
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2405:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2406
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2406:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2407
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2407:
	jmp NS_E_2033_MTC_1_failed
LB_2404:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2376
	btr QWORD [rdi],3
LB_2376:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2377
	btr QWORD [rdi],2
LB_2377:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2378
	btr QWORD [rdi],1
LB_2378:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2379
	btr QWORD [rdi],0
LB_2379:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2033_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2035:
NS_E_RDI_2035:
NS_E_2035_ETR_TBL:
NS_E_2035_TBL:
; c0
	push r14
; "0xr0"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,48
	jz LB_2437
	jmp NS_E_2035_MTC_0_failed
LB_2437:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,120
	jz LB_2438
	jmp NS_E_2035_MTC_0_failed
LB_2438:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,114
	jz LB_2439
	jmp NS_E_2035_MTC_0_failed
LB_2439:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,48
	jz LB_2440
	jmp NS_E_2035_MTC_0_failed
LB_2440:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2432
	btr QWORD [rdi],0
LB_2432:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2035_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2037:
NS_E_RDI_2037:
NS_E_2037_ETR_TBL:
NS_E_2037_TBL:
; c0
	push r14
; cha
	call NS_E_2039_ETR_TBL
	cmp r15,0
	jz LB_2452
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2037_MTC_0_failed
LB_2452:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; word
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2456
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2457
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2457:
	jmp NS_E_2037_MTC_0_failed
LB_2456:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2447
	btr QWORD [rdi],1
LB_2447:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2448
	btr QWORD [rdi],0
LB_2448:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2037_MTC_0_failed:
	pop r14
; c1
	push r14
	add rsp,8
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
NS_E_2037_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2039:
NS_E_RDI_2039:
NS_E_2039_ETR_TBL:
NS_E_2039_TBL:
; c0
	push r14
; "a"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,97
	jz LB_2480
	jmp NS_E_2039_MTC_0_failed
LB_2480:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2475
	btr QWORD [rdi],0
LB_2475:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2039_MTC_0_failed:
	pop r14
; c1
	push r14
; "b"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,98
	jz LB_2472
	jmp NS_E_2039_MTC_1_failed
LB_2472:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2467
	btr QWORD [rdi],0
LB_2467:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2039_MTC_1_failed:
	pop r14
; c2
	push r14
; "c"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,99
	jz LB_2464
	jmp NS_E_2039_MTC_2_failed
LB_2464:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2459
	btr QWORD [rdi],0
LB_2459:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2039_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2041:
NS_E_RDI_2041:
NS_E_2041_ETR_TBL:
NS_E_2041_TBL:
; c0
	push r14
; word
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2495
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2041_MTC_0_failed
LB_2495:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "."
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,46
	jz LB_2500
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2502
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2502:
	jmp NS_E_2041_MTC_0_failed
LB_2500:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; name
	call NS_E_2041_ETR_TBL
	cmp r15,0
	jz LB_2506
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2507
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2507:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2508
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2508:
	jmp NS_E_2041_MTC_0_failed
LB_2506:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2489
	btr QWORD [rdi],2
LB_2489:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2490
	btr QWORD [rdi],1
LB_2490:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2491
	btr QWORD [rdi],0
LB_2491:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2041_MTC_0_failed:
	pop r14
; c1
	push r14
; word
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2487
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2041_MTC_1_failed
LB_2487:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2483
	btr QWORD [rdi],0
LB_2483:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2041_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2043:
NS_E_RDI_2043:
NS_E_2043_ETR_TBL:
NS_E_2043_TBL:
; c0
	push r14
; dta_def_coprd
	call NS_E_2045_ETR_TBL
	cmp r15,0
	jz LB_2514
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2043_MTC_0_failed
LB_2514:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2510
	btr QWORD [rdi],0
LB_2510:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2043_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2045:
NS_E_RDI_2045:
NS_E_2045_ETR_TBL:
NS_E_2045_TBL:
; c0
	push r14
; "\226\136\144"
	jmp LB_2557
LB_2556:
	add r14,1
LB_2557:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2556
	cmp rax,10
	jz LB_2556
	cmp rax,32
	jz LB_2556
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2559
	jmp NS_E_2045_MTC_0_failed
LB_2559:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_2560
	jmp NS_E_2045_MTC_0_failed
LB_2560:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_2561
	jmp NS_E_2045_MTC_0_failed
LB_2561:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2567
LB_2566:
	add r14,1
LB_2567:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2566
	cmp rax,10
	jz LB_2566
	cmp rax,32
	jz LB_2566
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2568
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2569
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2569:
	jmp NS_E_2045_MTC_0_failed
LB_2568:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_2572
LB_2571:
	add r14,1
LB_2572:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2571
	cmp rax,10
	jz LB_2571
	cmp rax,32
	jz LB_2571
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_2574
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2576
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2576:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2577
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2577:
	jmp NS_E_2045_MTC_0_failed
LB_2574:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_2580
LB_2579:
	add r14,1
LB_2580:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2579
	cmp rax,10
	jz LB_2579
	cmp rax,32
	jz LB_2579
	call NS_E_2051_ETR_TBL
	cmp r15,0
	jz LB_2581
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2582
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2582:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2583
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2583:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2584
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2584:
	jmp NS_E_2045_MTC_0_failed
LB_2581:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2551
	btr QWORD [rdi],3
LB_2551:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2552
	btr QWORD [rdi],2
LB_2552:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2553
	btr QWORD [rdi],1
LB_2553:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2554
	btr QWORD [rdi],0
LB_2554:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2045_MTC_0_failed:
	pop r14
; c1
	push r14
; "\226\136\144"
	jmp LB_2522
LB_2521:
	add r14,1
LB_2522:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2521
	cmp rax,10
	jz LB_2521
	cmp rax,32
	jz LB_2521
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2524
	jmp NS_E_2045_MTC_1_failed
LB_2524:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_2525
	jmp NS_E_2045_MTC_1_failed
LB_2525:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_2526
	jmp NS_E_2045_MTC_1_failed
LB_2526:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2532
LB_2531:
	add r14,1
LB_2532:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2531
	cmp rax,10
	jz LB_2531
	cmp rax,32
	jz LB_2531
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2533
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2534
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2534:
	jmp NS_E_2045_MTC_1_failed
LB_2533:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_2537
LB_2536:
	add r14,1
LB_2537:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2536
	cmp rax,10
	jz LB_2536
	cmp rax,32
	jz LB_2536
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_2539
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2541
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2541:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2542
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2542:
	jmp NS_E_2045_MTC_1_failed
LB_2539:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_2545
LB_2544:
	add r14,1
LB_2545:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2544
	cmp rax,10
	jz LB_2544
	cmp rax,32
	jz LB_2544
	call NS_E_2051_ETR_TBL
	cmp r15,0
	jz LB_2546
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2547
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2547:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2548
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2548:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2549
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2549:
	jmp NS_E_2045_MTC_1_failed
LB_2546:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2516
	btr QWORD [rdi],3
LB_2516:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2517
	btr QWORD [rdi],2
LB_2517:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2518
	btr QWORD [rdi],1
LB_2518:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2519
	btr QWORD [rdi],0
LB_2519:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2045_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2047:
NS_E_RDI_2047:
NS_E_2047_ETR_TBL:
NS_E_2047_TBL:
; c0
	push r14
; op
	jmp LB_2610
LB_2609:
	add r14,1
LB_2610:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2609
	cmp rax,10
	jz LB_2609
	cmp rax,32
	jz LB_2609
	call NS_E_2049_ETR_TBL
	cmp r15,0
	jz LB_2611
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2047_MTC_0_failed
LB_2611:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn
	jmp LB_2614
LB_2613:
	add r14,1
LB_2614:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2613
	cmp rax,10
	jz LB_2613
	cmp rax,32
	jz LB_2613
	call NS_E_2059_ETR_TBL
	cmp r15,0
	jz LB_2615
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2616
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2616:
	jmp NS_E_2047_MTC_0_failed
LB_2615:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\226\138\162"
	jmp LB_2619
LB_2618:
	add r14,1
LB_2619:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2618
	cmp rax,10
	jz LB_2618
	cmp rax,32
	jz LB_2618
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2621
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2631
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2631:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2632
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2632:
	jmp NS_E_2047_MTC_0_failed
LB_2621:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,138
	jz LB_2622
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2628
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2628:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2629
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2629:
	jmp NS_E_2047_MTC_0_failed
LB_2622:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,162
	jz LB_2623
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2625
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2625:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2626
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2626:
	jmp NS_E_2047_MTC_0_failed
LB_2623:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; reg_ptn
	jmp LB_2635
LB_2634:
	add r14,1
LB_2635:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2634
	cmp rax,10
	jz LB_2634
	cmp rax,32
	jz LB_2634
	call NS_E_2059_ETR_TBL
	cmp r15,0
	jz LB_2636
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2637
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2637:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2638
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2638:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2639
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2639:
	jmp NS_E_2047_MTC_0_failed
LB_2636:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*3],rax
	mov QWORD [prs_vct+8*1+16*3],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*3]
	bt rax,0
	jc LB_2604
	btr QWORD [rdi],3
LB_2604:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2605
	btr QWORD [rdi],2
LB_2605:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2606
	btr QWORD [rdi],1
LB_2606:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2607
	btr QWORD [rdi],0
LB_2607:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2047_MTC_0_failed:
	pop r14
; c1
	push r14
; "\226\136\142"
	jmp LB_2590
LB_2589:
	add r14,1
LB_2590:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2589
	cmp rax,10
	jz LB_2589
	cmp rax,32
	jz LB_2589
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2592
	jmp NS_E_2047_MTC_1_failed
LB_2592:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_2593
	jmp NS_E_2047_MTC_1_failed
LB_2593:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_2594
	jmp NS_E_2047_MTC_1_failed
LB_2594:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn
	jmp LB_2600
LB_2599:
	add r14,1
LB_2600:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2599
	cmp rax,10
	jz LB_2599
	cmp rax,32
	jz LB_2599
	call NS_E_2059_ETR_TBL
	cmp r15,0
	jz LB_2601
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2602
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2602:
	jmp NS_E_2047_MTC_1_failed
LB_2601:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2586
	btr QWORD [rdi],1
LB_2586:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2587
	btr QWORD [rdi],0
LB_2587:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2047_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2049:
NS_E_RDI_2049:
NS_E_2049_ETR_TBL:
NS_E_2049_TBL:
; c0
	push r14
; name
	jmp LB_2660
LB_2659:
	add r14,1
LB_2660:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2659
	cmp rax,10
	jz LB_2659
	cmp rax,32
	jz LB_2659
	call NS_E_2041_ETR_TBL
	cmp r15,0
	jz LB_2661
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2049_MTC_0_failed
LB_2661:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2657
	btr QWORD [rdi],0
LB_2657:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2049_MTC_0_failed:
	pop r14
; c1
	push r14
; "\194\187"
	jmp LB_2645
LB_2644:
	add r14,1
LB_2645:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2644
	cmp rax,10
	jz LB_2644
	cmp rax,32
	jz LB_2644
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2647
	jmp NS_E_2049_MTC_1_failed
LB_2647:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,187
	jz LB_2648
	jmp NS_E_2049_MTC_1_failed
LB_2648:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; cst
	jmp LB_2653
LB_2652:
	add r14,1
LB_2653:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2652
	cmp rax,10
	jz LB_2652
	cmp rax,32
	jz LB_2652
	call NS_E_2035_ETR_TBL
	cmp r15,0
	jz LB_2654
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2655
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2655:
	jmp NS_E_2049_MTC_1_failed
LB_2654:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2641
	btr QWORD [rdi],1
LB_2641:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2642
	btr QWORD [rdi],0
LB_2642:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2049_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2051:
NS_E_RDI_2051:
NS_E_2051_ETR_TBL:
NS_E_2051_TBL:
; c0
	push r14
; type_imp
	call NS_E_2053_ETR_TBL
	cmp r15,0
	jz LB_2667
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2051_MTC_0_failed
LB_2667:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2663
	btr QWORD [rdi],0
LB_2663:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2051_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2053:
NS_E_RDI_2053:
NS_E_2053_ETR_TBL:
NS_E_2053_TBL:
; c0
	push r14
; type_app
	jmp LB_2680
LB_2679:
	add r14,1
LB_2680:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2679
	cmp rax,10
	jz LB_2679
	cmp rax,32
	jz LB_2679
	call NS_E_2055_ETR_TBL
	cmp r15,0
	jz LB_2681
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2053_MTC_0_failed
LB_2681:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\134\146"
	jmp LB_2684
LB_2683:
	add r14,1
LB_2684:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2683
	cmp rax,10
	jz LB_2683
	cmp rax,32
	jz LB_2683
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2686
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2694
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2694:
	jmp NS_E_2053_MTC_0_failed
LB_2686:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,134
	jz LB_2687
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2692
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2692:
	jmp NS_E_2053_MTC_0_failed
LB_2687:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,146
	jz LB_2688
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2690
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2690:
	jmp NS_E_2053_MTC_0_failed
LB_2688:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_imp
	jmp LB_2697
LB_2696:
	add r14,1
LB_2697:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2696
	cmp rax,10
	jz LB_2696
	cmp rax,32
	jz LB_2696
	call NS_E_2053_ETR_TBL
	cmp r15,0
	jz LB_2698
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2699
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2699:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2700
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2700:
	jmp NS_E_2053_MTC_0_failed
LB_2698:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2675
	btr QWORD [rdi],2
LB_2675:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2676
	btr QWORD [rdi],1
LB_2676:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2677
	btr QWORD [rdi],0
LB_2677:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2053_MTC_0_failed:
	pop r14
; c1
	push r14
; type_app
	jmp LB_2672
LB_2671:
	add r14,1
LB_2672:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2671
	cmp rax,10
	jz LB_2671
	cmp rax,32
	jz LB_2671
	call NS_E_2055_ETR_TBL
	cmp r15,0
	jz LB_2673
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2053_MTC_1_failed
LB_2673:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2669
	btr QWORD [rdi],0
LB_2669:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2053_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2055:
NS_E_RDI_2055:
NS_E_2055_ETR_TBL:
NS_E_2055_TBL:
; c0
	push r14
; type_atm
	jmp LB_2713
LB_2712:
	add r14,1
LB_2713:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2712
	cmp rax,10
	jz LB_2712
	cmp rax,32
	jz LB_2712
	call NS_E_2057_ETR_TBL
	cmp r15,0
	jz LB_2714
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2055_MTC_0_failed
LB_2714:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\151\130"
	jmp LB_2717
LB_2716:
	add r14,1
LB_2717:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2716
	cmp rax,10
	jz LB_2716
	cmp rax,32
	jz LB_2716
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2719
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2727
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2727:
	jmp NS_E_2055_MTC_0_failed
LB_2719:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,151
	jz LB_2720
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2725
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2725:
	jmp NS_E_2055_MTC_0_failed
LB_2720:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,130
	jz LB_2721
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2723
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2723:
	jmp NS_E_2055_MTC_0_failed
LB_2721:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_atm
	jmp LB_2730
LB_2729:
	add r14,1
LB_2730:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2729
	cmp rax,10
	jz LB_2729
	cmp rax,32
	jz LB_2729
	call NS_E_2057_ETR_TBL
	cmp r15,0
	jz LB_2731
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2732
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2732:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2733
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2733:
	jmp NS_E_2055_MTC_0_failed
LB_2731:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2708
	btr QWORD [rdi],2
LB_2708:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2709
	btr QWORD [rdi],1
LB_2709:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2710
	btr QWORD [rdi],0
LB_2710:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2055_MTC_0_failed:
	pop r14
; c1
	push r14
; type_atm
	jmp LB_2705
LB_2704:
	add r14,1
LB_2705:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2704
	cmp rax,10
	jz LB_2704
	cmp rax,32
	jz LB_2704
	call NS_E_2057_ETR_TBL
	cmp r15,0
	jz LB_2706
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2055_MTC_1_failed
LB_2706:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2702
	btr QWORD [rdi],0
LB_2702:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2055_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2057:
NS_E_RDI_2057:
NS_E_2057_ETR_TBL:
NS_E_2057_TBL:
; c0
	push r14
; word
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2739
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2057_MTC_0_failed
LB_2739:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2735
	btr QWORD [rdi],0
LB_2735:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2057_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2059:
NS_E_RDI_2059:
NS_E_2059_ETR_TBL:
NS_E_2059_TBL:
; c0
	push r14
; "{"
	jmp LB_2752
LB_2751:
	add r14,1
LB_2752:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2751
	cmp rax,10
	jz LB_2751
	cmp rax,32
	jz LB_2751
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,123
	jz LB_2754
	jmp NS_E_2059_MTC_0_failed
LB_2754:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_2758
LB_2757:
	add r14,1
LB_2758:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2757
	cmp rax,10
	jz LB_2757
	cmp rax,32
	jz LB_2757
	call NS_E_2061_ETR_TBL
	cmp r15,0
	jz LB_2759
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2760
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2760:
	jmp NS_E_2059_MTC_0_failed
LB_2759:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "}"
	jmp LB_2763
LB_2762:
	add r14,1
LB_2763:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2762
	cmp rax,10
	jz LB_2762
	cmp rax,32
	jz LB_2762
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,125
	jz LB_2765
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2767
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2767:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2768
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2768:
	jmp NS_E_2059_MTC_0_failed
LB_2765:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2747
	btr QWORD [rdi],2
LB_2747:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2748
	btr QWORD [rdi],1
LB_2748:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2749
	btr QWORD [rdi],0
LB_2749:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2059_MTC_0_failed:
	pop r14
; c1
	push r14
; reg
	jmp LB_2744
LB_2743:
	add r14,1
LB_2744:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2743
	cmp rax,10
	jz LB_2743
	cmp rax,32
	jz LB_2743
	call NS_E_2063_ETR_TBL
	cmp r15,0
	jz LB_2745
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2059_MTC_1_failed
LB_2745:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2741
	btr QWORD [rdi],0
LB_2741:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2059_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2061:
NS_E_RDI_2061:
NS_E_2061_ETR_TBL:
NS_E_2061_TBL:
; c0
	push r14
; reg
	jmp LB_2775
LB_2774:
	add r14,1
LB_2775:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2774
	cmp rax,10
	jz LB_2774
	cmp rax,32
	jz LB_2774
	call NS_E_2063_ETR_TBL
	cmp r15,0
	jz LB_2776
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2061_MTC_0_failed
LB_2776:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn_lst
	jmp LB_2779
LB_2778:
	add r14,1
LB_2779:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2778
	cmp rax,10
	jz LB_2778
	cmp rax,32
	jz LB_2778
	call NS_E_2061_ETR_TBL
	cmp r15,0
	jz LB_2780
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2781
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2781:
	jmp NS_E_2061_MTC_0_failed
LB_2780:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2771
	btr QWORD [rdi],1
LB_2771:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2772
	btr QWORD [rdi],0
LB_2772:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2061_MTC_0_failed:
	pop r14
; c1
	push r14
	add rsp,8
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
NS_E_2061_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2063:
NS_E_RDI_2063:
NS_E_2063_ETR_TBL:
NS_E_2063_TBL:
; c0
	push r14
; "%"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,37
	jz LB_2803
	jmp NS_E_2063_MTC_0_failed
LB_2803:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2808
	mov QWORD [r8],rbx
	mov rbx,r8
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2809
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2809:
	jmp NS_E_2063_MTC_0_failed
LB_2808:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2797
	btr QWORD [rdi],1
LB_2797:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2798
	btr QWORD [rdi],0
LB_2798:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2063_MTC_0_failed:
	pop r14
; c1
	push r14
; word
	jmp LB_2794
LB_2793:
	add r14,1
LB_2794:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2793
	cmp rax,10
	jz LB_2793
	cmp rax,32
	jz LB_2793
	call NS_E_2037_ETR_TBL
	cmp r15,0
	jz LB_2795
	mov QWORD [r8],rbx
	mov rbx,r8
	jmp NS_E_2063_MTC_1_failed
LB_2795:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2791
	btr QWORD [rdi],0
LB_2791:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2063_MTC_1_failed:
	pop r14
; c2
	push r14
; "_"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,95
	jz LB_2788
	jmp NS_E_2063_MTC_2_failed
LB_2788:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
	add rsp,8
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0001_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2783
	btr QWORD [rdi],0
LB_2783:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_2063_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2820:
NS_E_RDI_2820:
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
; 	» "a" _ ⊢ 1' : %_2812
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; » 0xr0 |~ {  } ⊢ %_2813 : %_2813
 ; {>  %_2812~1':_stg %_2811~0':_stg }
; 	» 0xr0 _ ⊢ 2' : %_2813
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f2027 { %_2811 %_2813 } ⊢ { %_2814 %_2815 %_2816 } : { %_2814 %_2815 %_2816 }
 ; {>  %_2813~2':_r64 %_2812~1':_stg %_2811~0':_stg }
; _f2027 { 0' 2' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' } ⊢ { 0' 1' }
	mov r14,r15
	bt r12,2
	jc LB_2823
	btr r12,1
	jmp LB_2824
LB_2823:
	bts r12,1
LB_2824:
	call NS_E_2027
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 2' 3' }
	mov r9,r8
	bt r12,3
	jc LB_2825
	btr r12,4
	jmp LB_2826
LB_2825:
	bts r12,4
LB_2826:
	mov r8,r9
	bt r12,4
	jc LB_2829
	btr r12,3
	jmp LB_2830
LB_2829:
	bts r12,3
LB_2830:
	mov rsi,1
	bt r12,3
	jc LB_2827
	mov rsi,0
	bt r8,0
	jc LB_2827
	jmp LB_2828
LB_2827:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,3
LB_2828:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
	mov r15,r14
	bt r12,1
	jc LB_2831
	btr r12,2
	jmp LB_2832
LB_2831:
	bts r12,2
LB_2832:
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_2821
	btr r12,1
	jmp LB_2822
LB_2821:
	bts r12,1
LB_2822:
	add rsp,16
; _f19 { %_2814 %_2815 %_2816 } ⊢ { %_2817 %_2818 %_2819 } : { %_2817 %_2818 %_2819 }
 ; {>  %_2815~2':_r64 %_2814~0':_stg %_2812~1':_stg %_2816~3':(_opn)◂(_p2026) }
; _f19 { 0' 2' 3' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' 3' } ⊢ 0'
	mov r14,r13
	bt r12,0
	jc LB_2835
	btr r12,1
	jmp LB_2836
LB_2835:
	bts r12,1
LB_2836:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_2839
	btr r12,4
	jmp LB_2840
LB_2839:
	bts r12,4
LB_2840:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_2837
	btr QWORD [rdi],0
	jmp LB_2838
LB_2837:
	bts QWORD [rdi],0
LB_2838:
	mov r9,r15
	bt r12,2
	jc LB_2843
	btr r12,4
	jmp LB_2844
LB_2843:
	bts r12,4
LB_2844:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_2841
	btr QWORD [rdi],1
	jmp LB_2842
LB_2841:
	bts QWORD [rdi],1
LB_2842:
	mov r9,r8
	bt r12,3
	jc LB_2847
	btr r12,4
	jmp LB_2848
LB_2847:
	bts r12,4
LB_2848:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_2845
	btr QWORD [rdi],2
	jmp LB_2846
LB_2845:
	bts QWORD [rdi],2
LB_2846:
	call NS_E_19
; _emt_mov_ptn_to_ptn 0' ⊢ { 0' 2' 3' }
	mov r14,r13
	bt r12,0
	jc LB_2849
	btr r12,1
	jmp LB_2850
LB_2849:
	bts r12,1
LB_2850:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_2853
	btr r12,4
	jmp LB_2854
LB_2853:
	bts r12,4
LB_2854:
	mov r13,r9
	bt r12,4
	jc LB_2851
	btr r12,0
	jmp LB_2852
LB_2851:
	bts r12,0
LB_2852:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_2857
	btr r12,4
	jmp LB_2858
LB_2857:
	bts r12,4
LB_2858:
	mov r15,r9
	bt r12,4
	jc LB_2855
	btr r12,2
	jmp LB_2856
LB_2855:
	bts r12,2
LB_2856:
	mov rdi,r14
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_2861
	btr r12,4
	jmp LB_2862
LB_2861:
	bts r12,4
LB_2862:
	mov r8,r9
	bt r12,4
	jc LB_2859
	btr r12,3
	jmp LB_2860
LB_2859:
	bts r12,3
LB_2860:
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_2833
	btr r12,1
	jmp LB_2834
LB_2833:
	bts r12,1
LB_2834:
	add rsp,16
; ∎ {  }
 ; {>  %_2818~2':_r64 %_2819~3':(_opn)◂(_p2026) %_2812~1':_stg %_2817~0':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_2863
	mov rdi,r15
	call dlt
LB_2863:
	bt r12,3
	jc LB_2864
	mov rdi,r8
	call dlt
LB_2864:
	bt r12,1
	jc LB_2865
	mov rdi,r14
	call dlt
LB_2865:
	bt r12,0
	jc LB_2866
	mov rdi,r13
	call dlt
LB_2866:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_1928:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1928
	NS_E_DYN_1931:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1931
	NS_E_DYN_1932:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1932
	NS_E_DYN_1933:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1933
	NS_E_DYN_1934:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1934
	NS_E_DYN_1935:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1935
	NS_E_DYN_1936:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1936
	CST_DYN_1984:
		dq 0x0001_0001_00_82_ffff
		dq 1
	NS_E_DYN_2064:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2065:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2023:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2023
	NS_E_DYN_2066:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2067:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2068:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_2069:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_2025:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2025
	NS_E_DYN_2070:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2071:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2027:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2027
	NS_E_DYN_2072:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2073:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2029:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2029
	NS_E_DYN_2074:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2075:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2031:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2031
	NS_E_DYN_2076:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2077:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2033:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2033
	NS_E_DYN_2078:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2035:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2035
	NS_E_DYN_2079:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2080:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2037:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2037
	NS_E_DYN_2081:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2082:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2083:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_2039:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2039
	NS_E_DYN_2084:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2085:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2041:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2041
	NS_E_DYN_2086:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2043:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2043
	NS_E_DYN_2087:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2088:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2045:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2045
	NS_E_DYN_2089:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2090:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2047:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2047
	NS_E_DYN_2091:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2092:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2049:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2049
	NS_E_DYN_2093:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2051:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2051
	NS_E_DYN_2094:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2095:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2053:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2053
	NS_E_DYN_2096:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2097:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2055:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2055
	NS_E_DYN_2098:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2057:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2057
	NS_E_DYN_2099:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2100:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2059:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2059
	NS_E_DYN_2101:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2102:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2061:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2061
	NS_E_DYN_2103:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_2104:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_2105:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_2063:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2063
	CST_DYN_2820:
		dq 0x0001_0001_00_82_ffff
		dq 1
