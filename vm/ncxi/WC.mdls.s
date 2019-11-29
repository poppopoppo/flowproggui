%include "cmu.s"
main:
	mov r12,0
	not r12
	call SFLS_init
	call NS_E_2103
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
NS_E_1987:
NS_E_RDI_1987:
NS_E_1987_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_1987_LB_0
	mov r15,0
	mov r8,rax
	ret
NS_E_1987_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	ret
NS_E_1988:
NS_E_RDI_1988:
NS_E_1988_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_1988_LB_0
	cmp r11,57
	ja NS_E_1988_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1988_LB_0:
	mov rax,0
	ret
NS_E_1990:
NS_E_RDI_1990:
NS_E_1990_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_1990_LB_0
	cmp r11,122
	ja NS_E_1990_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1990_LB_0:
	mov rax,0
	ret
NS_E_1989:
NS_E_RDI_1989:
NS_E_1989_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_1989_LB_0
	cmp r11,90
	ja NS_E_1989_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1989_LB_0:
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
NS_E_2018:
; 	|» { 0' 1' 2' }
NS_E_RDI_2018:
; _f26 { %_1992 %_1991 } ⊢ { %_1994 %_1995 %_1996 } : { %_1994 %_1995 %_1996 }
 ; {>  %_1991~0':_r64 %_1992~1':_r64 %_1993~2':_r64 }
	cmp r14,r13
	mov rsi,0
	setge sil
	mov r8,rsi
	bts r12,3
; /0
	mov QWORD rax,0x0
	cmp rax,r8
	jnz LB_2085
	bt r12,3
	jc LB_2084
	mov rdi,r8
	call dlt
LB_2084:
	jmp MTC_LB_2083
LB_2085:
; _emt_mov_ptn_to_ptn 3' ⊢ 4'
	mov r9,r8
	bt r12,3
	jc LB_2086
	btr r12,4
	jmp LB_2087
LB_2086:
	bts r12,4
LB_2087:
; /0/
	jmp MTC_LB_2082
MTC_LB_2083:
; _f29 %_1995 ⊢ { %_1998 %_1999 } : { %_1998 %_1999 }
 ; {>  %_1993~2':_r64 %_1994~1':_r64 %_1995~0':_r64 %_1996~3':_r64 }
	mov r9,r13
; _f29 %_1994 ⊢ { %_2000 %_2001 } : { %_2000 %_2001 }
 ; {>  %_1993~2':_r64 %_1999~4':_r64 %_1994~1':_r64 %_1998~0':_r64 %_1996~3':_r64 }
	mov r10,r14
; _f29 %_1993 ⊢ { %_2002 %_2003 } : { %_2002 %_2003 }
 ; {>  %_2000~1':_r64 %_1993~2':_r64 %_1999~4':_r64 %_1998~0':_r64 %_1996~3':_r64 %_2001~5':_r64 }
	mov r11,r15
; _f31 %_1999 ⊢ %_2004 : %_2004
 ; {>  %_2000~1':_r64 %_2003~6':_r64 %_1999~4':_r64 %_1998~0':_r64 %_2002~2':_r64 %_1996~3':_r64 %_2001~5':_r64 }
	sub r9,1
; _f2018 { %_2004 %_2001 %_2003 } ⊢ %_2005 : %_2005
 ; {>  %_2000~1':_r64 %_2003~6':_r64 %_2004~4':_r64 %_1998~0':_r64 %_2002~2':_r64 %_1996~3':_r64 %_2001~5':_r64 }
; _f2018 { 4' 5' 6' } ⊢ 4'
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
	jc LB_2027
	btr r12,0
	jmp LB_2028
LB_2027:
	bts r12,0
LB_2028:
	mov r14,r10
	bt r12,5
	jc LB_2029
	btr r12,1
	jmp LB_2030
LB_2029:
	bts r12,1
LB_2030:
	mov r15,r11
	bt r12,6
	jc LB_2031
	btr r12,2
	jmp LB_2032
LB_2031:
	bts r12,2
LB_2032:
	call NS_E_2018
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_2033
	btr r12,4
	jmp LB_2034
LB_2033:
	bts r12,4
LB_2034:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_2025
	btr r12,3
	jmp LB_2026
LB_2025:
	bts r12,3
LB_2026:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_2023
	btr r12,2
	jmp LB_2024
LB_2023:
	bts r12,2
LB_2024:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_2021
	btr r12,1
	jmp LB_2022
LB_2021:
	bts r12,1
LB_2022:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_2019
	btr r12,0
	jmp LB_2020
LB_2019:
	bts r12,0
LB_2020:
	add rsp,40
; _f29 %_1998 ⊢ { %_2006 %_2007 } : { %_2006 %_2007 }
 ; {>  %_2000~1':_r64 %_2005~4':_r64 %_1998~0':_r64 %_2002~2':_r64 %_1996~3':_r64 }
	mov r10,r13
; _f29 %_2000 ⊢ { %_2008 %_2009 } : { %_2008 %_2009 }
 ; {>  %_2007~5':_r64 %_2000~1':_r64 %_2005~4':_r64 %_2002~2':_r64 %_1996~3':_r64 %_2006~0':_r64 }
	mov r11,r14
; _f29 %_2002 ⊢ { %_2010 %_2011 } : { %_2010 %_2011 }
 ; {>  %_2009~6':_r64 %_2007~5':_r64 %_2005~4':_r64 %_2008~1':_r64 %_2002~2':_r64 %_1996~3':_r64 %_2006~0':_r64 }
	mov rcx,r15
; _f31 %_2009 ⊢ %_2012 : %_2012
 ; {>  %_2009~6':_r64 %_2007~5':_r64 %_2010~2':_r64 %_2005~4':_r64 %_2011~7':_r64 %_2008~1':_r64 %_1996~3':_r64 %_2006~0':_r64 }
	sub r11,1
; _f2018 { %_2012 %_2011 %_2007 } ⊢ %_2013 : %_2013
 ; {>  %_2007~5':_r64 %_2010~2':_r64 %_2005~4':_r64 %_2011~7':_r64 %_2008~1':_r64 %_2012~6':_r64 %_1996~3':_r64 %_2006~0':_r64 }
; _f2018 { 6' 7' 5' } ⊢ 5'
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
	jc LB_2045
	btr r12,0
	jmp LB_2046
LB_2045:
	bts r12,0
LB_2046:
	mov r14,rcx
	bt r12,7
	jc LB_2047
	btr r12,1
	jmp LB_2048
LB_2047:
	bts r12,1
LB_2048:
	mov r15,r10
	bt r12,5
	jc LB_2049
	btr r12,2
	jmp LB_2050
LB_2049:
	bts r12,2
LB_2050:
	call NS_E_2018
; _emt_mov_ptn_to_ptn 0' ⊢ 5'
	mov r10,r13
	bt r12,0
	jc LB_2051
	btr r12,5
	jmp LB_2052
LB_2051:
	bts r12,5
LB_2052:
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_2043
	btr r12,4
	jmp LB_2044
LB_2043:
	bts r12,4
LB_2044:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_2041
	btr r12,3
	jmp LB_2042
LB_2041:
	bts r12,3
LB_2042:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_2039
	btr r12,2
	jmp LB_2040
LB_2039:
	bts r12,2
LB_2040:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_2037
	btr r12,1
	jmp LB_2038
LB_2037:
	bts r12,1
LB_2038:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_2035
	btr r12,0
	jmp LB_2036
LB_2035:
	bts r12,0
LB_2036:
	add rsp,48
; _f31 %_2010 ⊢ %_2014 : %_2014
 ; {>  %_2010~2':_r64 %_2005~4':_r64 %_2008~1':_r64 %_1996~3':_r64 %_2006~0':_r64 %_2013~5':_r64 }
	sub r15,1
; _f2018 { %_2014 %_2006 %_2008 } ⊢ %_2015 : %_2015
 ; {>  %_2014~2':_r64 %_2005~4':_r64 %_2008~1':_r64 %_1996~3':_r64 %_2006~0':_r64 %_2013~5':_r64 }
; _f2018 { 2' 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 2' 0' 1' } ⊢ { 0' 1' 2' }
	mov r8,r15
	bt r12,2
	jc LB_2059
	btr r12,3
	jmp LB_2060
LB_2059:
	bts r12,3
LB_2060:
	mov r15,r14
	bt r12,1
	jc LB_2061
	btr r12,2
	jmp LB_2062
LB_2061:
	bts r12,2
LB_2062:
	mov r14,r13
	bt r12,0
	jc LB_2063
	btr r12,1
	jmp LB_2064
LB_2063:
	bts r12,1
LB_2064:
	mov r13,r8
	bt r12,3
	jc LB_2065
	btr r12,0
	jmp LB_2066
LB_2065:
	bts r12,0
LB_2066:
	call NS_E_2018
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD [rsp],5
	jc LB_2057
	btr r12,5
	jmp LB_2058
LB_2057:
	bts r12,5
LB_2058:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD [rsp],4
	jc LB_2055
	btr r12,4
	jmp LB_2056
LB_2055:
	bts r12,4
LB_2056:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_2053
	btr r12,3
	jmp LB_2054
LB_2053:
	bts r12,3
LB_2054:
	add rsp,32
; _f2018 { %_2005 %_2013 %_2015 } ⊢ %_2016 : %_2016
 ; {>  %_2015~0':_r64 %_2005~4':_r64 %_1996~3':_r64 %_2013~5':_r64 }
; _f2018 { 4' 5' 0' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 4' 5' 0' } ⊢ { 0' 1' 2' }
	mov r14,r10
	bt r12,5
	jc LB_2069
	btr r12,1
	jmp LB_2070
LB_2069:
	bts r12,1
LB_2070:
	mov r15,r13
	bt r12,0
	jc LB_2071
	btr r12,2
	jmp LB_2072
LB_2071:
	bts r12,2
LB_2072:
	mov r13,r9
	bt r12,4
	jc LB_2073
	btr r12,0
	jmp LB_2074
LB_2073:
	bts r12,0
LB_2074:
	call NS_E_2018
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
; pop_iv
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD [rsp],3
	jc LB_2067
	btr r12,3
	jmp LB_2068
LB_2067:
	bts r12,3
LB_2068:
	add rsp,16
; ∎ %_2016
 ; {>  %_2016~0':_r64 %_1996~3':_r64 }
; 	∎ 0'
	bt r12,3
	jc LB_2075
	mov rdi,r8
	call dlt
LB_2075:
; _emt_mov_ptn_to_ptn 0' ⊢ 0'
	ret
MTC_LB_2082:
; ∎ %_1993
 ; {>  %_1993~2':_r64 %_1994~1':_r64 %_1995~0':_r64 %_1996~3':_r64 %_2017~4':_r64 }
; 	∎ 2'
	bt r12,1
	jc LB_2076
	mov rdi,r14
	call dlt
LB_2076:
	bt r12,0
	jc LB_2077
	mov rdi,r13
	call dlt
LB_2077:
	bt r12,3
	jc LB_2078
	mov rdi,r8
	call dlt
LB_2078:
	bt r12,4
	jc LB_2079
	mov rdi,r9
	call dlt
LB_2079:
; _emt_mov_ptn_to_ptn 2' ⊢ 0'
	mov r13,r15
	bt r12,2
	jc LB_2080
	btr r12,0
	jmp LB_2081
LB_2080:
	bts r12,0
LB_2081:
	ret
NS_E_2103:
NS_E_RDI_2103:
; » 0xraa |~ {  } ⊢ %_2088 : %_2088
 ; {>  }
; 	» 0xraa _ ⊢ 0' : %_2088
	mov rdi,0xaa
	mov r13,rdi
	bts r12,0
; » 0xr87 |~ {  } ⊢ %_2089 : %_2089
 ; {>  %_2088~0':_r64 }
; 	» 0xr87 _ ⊢ 1' : %_2089
	mov rdi,0x87
	mov r14,rdi
	bts r12,1
; _f26 { %_2088 %_2089 } ⊢ { %_2090 %_2091 %_2092 } : { %_2090 %_2091 %_2092 }
 ; {>  %_2089~1':_r64 %_2088~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r15,rsi
	bts r12,2
; /0
	mov QWORD rax,0x0
	cmp rax,r13
	jnz LB_2158
	bt r12,0
	jc LB_2157
	mov rdi,r13
	call dlt
LB_2157:
	jmp MTC_LB_2156
LB_2158:
; /0/0
	mov QWORD rax,0xab
	cmp rax,r13
	jnz LB_2160
	bt r12,0
	jc LB_2159
	mov rdi,r13
	call dlt
LB_2159:
	jmp MTC_LB_2155
LB_2160:
; /0/0/0
	mov QWORD rax,0xaa
	cmp rax,r13
	jnz LB_2162
	bt r12,0
	jc LB_2161
	mov rdi,r13
	call dlt
LB_2161:
	jmp MTC_LB_2154
LB_2162:
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_2163
	btr r12,3
	jmp LB_2164
LB_2163:
	bts r12,3
LB_2164:
; /0/0/0/
	jmp MTC_LB_2153
MTC_LB_2156:
; ∎ {  }
 ; {>  %_2091~1':_r64 %_2090~0':_r64 %_2092~2':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_2104
	mov rdi,r14
	call dlt
LB_2104:
	bt r12,0
	jc LB_2105
	mov rdi,r13
	call dlt
LB_2105:
	bt r12,2
	jc LB_2106
	mov rdi,r15
	call dlt
LB_2106:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_2155:
; ∎ {  }
 ; {>  %_2091~1':_r64 %_2090~0':_r64 %_2092~2':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_2107
	mov rdi,r14
	call dlt
LB_2107:
	bt r12,0
	jc LB_2108
	mov rdi,r13
	call dlt
LB_2108:
	bt r12,2
	jc LB_2109
	mov rdi,r15
	call dlt
LB_2109:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_2154:
; » _^ ..
	mov rax,2
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "AA"
	mov rsi,0x_00_00_00_00_00_00_41_41
	mov QWORD [rdi+8*0],rsi
	add rdi,2
; //
	mov r8,rax
	btr r12,3
; » _^ ..
	mov rax,6
	mov rdi,0
	mov rsi,0
	mov rdi,r8
	mov rdi,QWORD [rdi]
	mov rsi,rdi
	shr rdi,32
	and rdi,0xffff
	sub rdi,1
	shl rdi,3
	and rsi,0b0111
	add rdi,rsi
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,3
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	rep movsb
	pop rcx
; 0'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	rep movsb
	pop rcx
; "Qjjjjj"
	mov rsi,0x_00_00_6a_6a_6a_6a_6a_51
	mov QWORD [rdi+8*0],rsi
	add rdi,6
; 0'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	rep movsb
	pop rcx
; //
	mov r9,rax
	btr r12,4
; _f14 %_2097 ⊢ %_2099 : %_2099
 ; {>  %_2091~1':_r64 %_2090~0':_r64 %_2098~4':_stg %_2092~2':_r64 %_2097~3':_stg }
; _f14 3' ⊢ 3'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 3' ⊢ 0'
	mov r13,r8
	bt r12,3
	jc LB_2118
	btr r12,0
	jmp LB_2119
LB_2118:
	bts r12,0
LB_2119:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_2120
	btr r12,3
	jmp LB_2121
LB_2120:
	bts r12,3
LB_2121:
; pop_iv
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD [rsp],4
	jc LB_2116
	btr r12,4
	jmp LB_2117
LB_2116:
	bts r12,4
LB_2117:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_2114
	btr r12,2
	jmp LB_2115
LB_2114:
	bts r12,2
LB_2115:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_2112
	btr r12,1
	jmp LB_2113
LB_2112:
	bts r12,1
LB_2113:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_2110
	btr r12,0
	jmp LB_2111
LB_2110:
	bts r12,0
LB_2111:
	add rsp,40
; _f14 %_2098 ⊢ %_2100 : %_2100
 ; {>  %_2091~1':_r64 %_2090~0':_r64 %_2098~4':_stg %_2099~3':_stg %_2092~2':_r64 }
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
	jc LB_2130
	btr r12,0
	jmp LB_2131
LB_2130:
	bts r12,0
LB_2131:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_2132
	btr r12,4
	jmp LB_2133
LB_2132:
	bts r12,4
LB_2133:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_2128
	btr r12,3
	jmp LB_2129
LB_2128:
	bts r12,3
LB_2129:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_2126
	btr r12,2
	jmp LB_2127
LB_2126:
	bts r12,2
LB_2127:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_2124
	btr r12,1
	jmp LB_2125
LB_2124:
	bts r12,1
LB_2125:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_2122
	btr r12,0
	jmp LB_2123
LB_2122:
	bts r12,0
LB_2123:
	add rsp,40
; ∎ {  }
 ; {>  %_2091~1':_r64 %_2090~0':_r64 %_2099~3':_stg %_2092~2':_r64 %_2100~4':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_2134
	mov rdi,r14
	call dlt
LB_2134:
	bt r12,0
	jc LB_2135
	mov rdi,r13
	call dlt
LB_2135:
	bt r12,3
	jc LB_2136
	mov rdi,r8
	call dlt
LB_2136:
	bt r12,2
	jc LB_2137
	mov rdi,r15
	call dlt
LB_2137:
	bt r12,4
	jc LB_2138
	mov rdi,r9
	call dlt
LB_2138:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
MTC_LB_2153:
; _f14 %_2101 ⊢ %_2102 : %_2102
 ; {>  %_2091~1':_r64 %_2090~0':_r64 %_2092~2':_r64 %_2101~3':_r64 }
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
	jc LB_2145
	btr r12,0
	jmp LB_2146
LB_2145:
	bts r12,0
LB_2146:
	call NS_E_14
; _emt_mov_ptn_to_ptn 0' ⊢ 3'
	mov r8,r13
	bt r12,0
	jc LB_2147
	btr r12,3
	jmp LB_2148
LB_2147:
	bts r12,3
LB_2148:
; pop_iv
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_2143
	btr r12,2
	jmp LB_2144
LB_2143:
	bts r12,2
LB_2144:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_2141
	btr r12,1
	jmp LB_2142
LB_2141:
	bts r12,1
LB_2142:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_2139
	btr r12,0
	jmp LB_2140
LB_2139:
	bts r12,0
LB_2140:
	add rsp,32
; ∎ {  }
 ; {>  %_2091~1':_r64 %_2090~0':_r64 %_2102~3':_r64 %_2092~2':_r64 }
; 	∎ {  }
	bt r12,1
	jc LB_2149
	mov rdi,r14
	call dlt
LB_2149:
	bt r12,0
	jc LB_2150
	mov rdi,r13
	call dlt
LB_2150:
	bt r12,3
	jc LB_2151
	mov rdi,r8
	call dlt
LB_2151:
	bt r12,2
	jc LB_2152
	mov rdi,r15
	call dlt
LB_2152:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_1987:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1987
	NS_E_DYN_1988:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1988
	NS_E_DYN_1989:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1989
	NS_E_DYN_1990:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1990
	NS_E_DYN_2018:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_2018
	CST_DYN_2103:
		dq 0x0001_0001_00_82_ffff
		dq 1
