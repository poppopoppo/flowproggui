%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call in0_init
	call NS_E_2643
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
NS_E_ID_16: dq 0
NS_E_16:
NS_E_RDI_16:
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
NS_E_1833:
NS_E_RDI_1833:
NS_E_1833_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_1834
	add r14,1
	mov r15,0
	mov r8,rax
	bts r12,3
	bts r12,2
	ret
LB_1834:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1835:
NS_E_RDI_1835:
NS_E_1835_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_1835_LB_0
	mov r15,0
	mov r8,rax
	btr r12,3
	bts r12,2
	ret
NS_E_1835_LB_0:
	mov r15,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0001_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1836:
NS_E_RDI_1836:
NS_E_1836_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_1836_LB_0
	cmp r11,57
	ja NS_E_1836_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1836_LB_0:
	mov rax,0
	ret
NS_E_1838:
NS_E_RDI_1838:
NS_E_1838_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_1838_LB_0
	cmp r11,122
	ja NS_E_1838_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1838_LB_0:
	mov rax,0
	ret
NS_E_1837:
NS_E_RDI_1837:
NS_E_1837_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_1837_LB_0
	cmp r11,90
	ja NS_E_1837_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1837_LB_0:
	mov rax,0
	ret
NS_E_19:
NS_E_RDI_19:
	mov rbx,rdi
	call emt
	mov rdi,rbx
	call dec_r
	ret
NS_E_23:
	mov rdi,r8
	bt r12,0
NS_E_RDI_23:
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
	push r14
	push r15
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	call in_fn
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r15
	pop r14
	mov r14,rax
	btr r12,1
	ret
NS_E_1840:
NS_E_RDI_1840:
NS_E_1840_ETR_TBL:
NS_E_1840_TBL:
	push r14
; glb_etr
	call NS_E_1842_ETR_TBL
	cmp r15,0
	jz LB_1929
	jmp NS_E_1840_MTC_0_failed
LB_1929:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; glb_etr_lst
	call NS_E_1840_ETR_TBL
	cmp r15,0
	jz LB_1933
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1934
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1934:
	jmp NS_E_1840_MTC_0_failed
LB_1933:
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
	jc LB_1924
	btr QWORD [rdi],1
LB_1924:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1925
	btr QWORD [rdi],0
LB_1925:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1840_MTC_0_failed:
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
NS_E_1840_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1842:
NS_E_RDI_1842:
NS_E_1842_ETR_TBL:
NS_E_1842_TBL:
	push r14
; mdl_etr
	call NS_E_1844_ETR_TBL
	cmp r15,0
	jz LB_1958
	jmp NS_E_1842_MTC_0_failed
LB_1958:
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
	jc LB_1954
	btr QWORD [rdi],0
LB_1954:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1842_MTC_0_failed:
	pop r14
	push r14
; cst_etr
	call NS_E_1846_ETR_TBL
	cmp r15,0
	jz LB_1952
	jmp NS_E_1842_MTC_1_failed
LB_1952:
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
	jc LB_1948
	btr QWORD [rdi],0
LB_1948:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1842_MTC_1_failed:
	pop r14
	push r14
; op_etr
	call NS_E_1848_ETR_TBL
	cmp r15,0
	jz LB_1946
	jmp NS_E_1842_MTC_2_failed
LB_1946:
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
	jc LB_1942
	btr QWORD [rdi],0
LB_1942:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1842_MTC_2_failed:
	pop r14
	push r14
; dta_etr
	call NS_E_1850_ETR_TBL
	cmp r15,0
	jz LB_1940
	jmp NS_E_1842_MTC_3_failed
LB_1940:
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
	jc LB_1936
	btr QWORD [rdi],0
LB_1936:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1842_MTC_3_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1844:
NS_E_RDI_1844:
NS_E_1844_ETR_TBL:
NS_E_1844_TBL:
	push r14
; "\194\167\194\167"
	jmp LB_2003
LB_2002:
	add r14,1
LB_2003:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2002
	cmp rax,10
	jz LB_2002
	cmp rax,32
	jz LB_2002
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2005
	jmp NS_E_1844_MTC_0_failed
LB_2005:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2006
	jmp NS_E_1844_MTC_0_failed
LB_2006:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_2007
	jmp NS_E_1844_MTC_0_failed
LB_2007:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_2008
	jmp NS_E_1844_MTC_0_failed
LB_2008:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2015
LB_2014:
	add r14,1
LB_2015:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2014
	cmp rax,10
	jz LB_2014
	cmp rax,32
	jz LB_2014
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2016
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2017
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2017:
	jmp NS_E_1844_MTC_0_failed
LB_2016:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; glb_etr_lst
	jmp LB_2020
LB_2019:
	add r14,1
LB_2020:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2019
	cmp rax,10
	jz LB_2019
	cmp rax,32
	jz LB_2019
	call NS_E_1840_ETR_TBL
	cmp r15,0
	jz LB_2021
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2022
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2022:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2023
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2023:
	jmp NS_E_1844_MTC_0_failed
LB_2021:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; "\226\136\142\226\136\142"
	jmp LB_2026
LB_2025:
	add r14,1
LB_2026:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2025
	cmp rax,10
	jz LB_2025
	cmp rax,32
	jz LB_2025
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2028
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2055
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2055:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2056
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2056:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2057
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2057:
	jmp NS_E_1844_MTC_0_failed
LB_2028:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_2029
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2051
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2051:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2052
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2052:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2053
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2053:
	jmp NS_E_1844_MTC_0_failed
LB_2029:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_2030
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2047
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2047:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2048
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2048:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2049
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2049:
	jmp NS_E_1844_MTC_0_failed
LB_2030:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,226
	jz LB_2031
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2043
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2043:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2044
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2044:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2045
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2045:
	jmp NS_E_1844_MTC_0_failed
LB_2031:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+4]
	cmp al,136
	jz LB_2032
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2039
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2039:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2040
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2040:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2041
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2041:
	jmp NS_E_1844_MTC_0_failed
LB_2032:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+5]
	cmp al,142
	jz LB_2033
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2035
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2035:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2036
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2036:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2037
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2037:
	jmp NS_E_1844_MTC_0_failed
LB_2033:
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
	jc LB_1997
	btr QWORD [rdi],3
LB_1997:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1998
	btr QWORD [rdi],2
LB_1998:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1999
	btr QWORD [rdi],1
LB_1999:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2000
	btr QWORD [rdi],0
LB_2000:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1844_MTC_0_failed:
	pop r14
	push r14
; "\194\167\194\167"
	jmp LB_1966
LB_1965:
	add r14,1
LB_1966:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1965
	cmp rax,10
	jz LB_1965
	cmp rax,32
	jz LB_1965
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_1968
	jmp NS_E_1844_MTC_1_failed
LB_1968:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_1969
	jmp NS_E_1844_MTC_1_failed
LB_1969:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,194
	jz LB_1970
	jmp NS_E_1844_MTC_1_failed
LB_1970:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,167
	jz LB_1971
	jmp NS_E_1844_MTC_1_failed
LB_1971:
	add r14,4
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_1978
LB_1977:
	add r14,1
LB_1978:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1977
	cmp rax,10
	jz LB_1977
	cmp rax,32
	jz LB_1977
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_1979
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1980
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1980:
	jmp NS_E_1844_MTC_1_failed
LB_1979:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_1983
LB_1982:
	add r14,1
LB_1983:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1982
	cmp rax,10
	jz LB_1982
	cmp rax,32
	jz LB_1982
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_1985
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1987
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1987:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1988
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1988:
	jmp NS_E_1844_MTC_1_failed
LB_1985:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_1991
LB_1990:
	add r14,1
LB_1991:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_1990
	cmp rax,10
	jz LB_1990
	cmp rax,32
	jz LB_1990
	call NS_E_1858_ETR_TBL
	cmp r15,0
	jz LB_1992
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_1993
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_1993:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_1994
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_1994:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_1995
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_1995:
	jmp NS_E_1844_MTC_1_failed
LB_1992:
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
	jc LB_1960
	btr QWORD [rdi],3
LB_1960:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_1961
	btr QWORD [rdi],2
LB_1961:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_1962
	btr QWORD [rdi],1
LB_1962:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_1963
	btr QWORD [rdi],0
LB_1963:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1844_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1846:
NS_E_RDI_1846:
NS_E_1846_ETR_TBL:
NS_E_1846_TBL:
	push r14
; "\194\167"
	jmp LB_2098
LB_2097:
	add r14,1
LB_2098:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2097
	cmp rax,10
	jz LB_2097
	cmp rax,32
	jz LB_2097
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2100
	jmp NS_E_1846_MTC_0_failed
LB_2100:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2101
	jmp NS_E_1846_MTC_0_failed
LB_2101:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2106
LB_2105:
	add r14,1
LB_2106:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2105
	cmp rax,10
	jz LB_2105
	cmp rax,32
	jz LB_2105
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2107
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2108
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2108:
	jmp NS_E_1846_MTC_0_failed
LB_2107:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\194\171"
	jmp LB_2111
LB_2110:
	add r14,1
LB_2111:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2110
	cmp rax,10
	jz LB_2110
	cmp rax,32
	jz LB_2110
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2113
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2119
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2119:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2120
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2120:
	jmp NS_E_1846_MTC_0_failed
LB_2113:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,171
	jz LB_2114
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2116
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2116:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2117
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2117:
	jmp NS_E_1846_MTC_0_failed
LB_2114:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; op_lines
	jmp LB_2123
LB_2122:
	add r14,1
LB_2123:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2122
	cmp rax,10
	jz LB_2122
	cmp rax,32
	jz LB_2122
	call NS_E_1864_ETR_TBL
	cmp r15,0
	jz LB_2124
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2125
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2125:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2126
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2126:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2127
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2127:
	jmp NS_E_1846_MTC_0_failed
LB_2124:
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
	jc LB_2092
	btr QWORD [rdi],3
LB_2092:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2093
	btr QWORD [rdi],2
LB_2093:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2094
	btr QWORD [rdi],1
LB_2094:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2095
	btr QWORD [rdi],0
LB_2095:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1846_MTC_0_failed:
	pop r14
	push r14
; "\194\167"
	jmp LB_2065
LB_2064:
	add r14,1
LB_2065:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2064
	cmp rax,10
	jz LB_2064
	cmp rax,32
	jz LB_2064
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2067
	jmp NS_E_1846_MTC_1_failed
LB_2067:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2068
	jmp NS_E_1846_MTC_1_failed
LB_2068:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2073
LB_2072:
	add r14,1
LB_2073:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2072
	cmp rax,10
	jz LB_2072
	cmp rax,32
	jz LB_2072
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2074
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2075
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2075:
	jmp NS_E_1846_MTC_1_failed
LB_2074:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_2078
LB_2077:
	add r14,1
LB_2078:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2077
	cmp rax,10
	jz LB_2077
	cmp rax,32
	jz LB_2077
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_2080
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2082
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2082:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2083
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2083:
	jmp NS_E_1846_MTC_1_failed
LB_2080:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; cst
	jmp LB_2086
LB_2085:
	add r14,1
LB_2086:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2085
	cmp rax,10
	jz LB_2085
	cmp rax,32
	jz LB_2085
	call NS_E_1852_ETR_TBL
	cmp r15,0
	jz LB_2087
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2088
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2088:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2089
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2089:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2090
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2090:
	jmp NS_E_1846_MTC_1_failed
LB_2087:
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
	jc LB_2059
	btr QWORD [rdi],3
LB_2059:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2060
	btr QWORD [rdi],2
LB_2060:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2061
	btr QWORD [rdi],1
LB_2061:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2062
	btr QWORD [rdi],0
LB_2062:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1846_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1848:
NS_E_RDI_1848:
NS_E_1848_ETR_TBL:
NS_E_1848_TBL:
	push r14
; "\194\167"
	jmp LB_2168
LB_2167:
	add r14,1
LB_2168:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2167
	cmp rax,10
	jz LB_2167
	cmp rax,32
	jz LB_2167
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2170
	jmp NS_E_1848_MTC_0_failed
LB_2170:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2171
	jmp NS_E_1848_MTC_0_failed
LB_2171:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2176
LB_2175:
	add r14,1
LB_2176:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2175
	cmp rax,10
	jz LB_2175
	cmp rax,32
	jz LB_2175
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2177
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2178
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2178:
	jmp NS_E_1848_MTC_0_failed
LB_2177:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; reg_ptn
	jmp LB_2181
LB_2180:
	add r14,1
LB_2181:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2180
	cmp rax,10
	jz LB_2180
	cmp rax,32
	jz LB_2180
	call NS_E_1876_ETR_TBL
	cmp r15,0
	jz LB_2182
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2183
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2183:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2184
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2184:
	jmp NS_E_1848_MTC_0_failed
LB_2182:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*2],rax
	mov QWORD [prs_vct+8*1+16*2],r8
; op_lines
	jmp LB_2187
LB_2186:
	add r14,1
LB_2187:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2186
	cmp rax,10
	jz LB_2186
	cmp rax,32
	jz LB_2186
	call NS_E_1864_ETR_TBL
	cmp r15,0
	jz LB_2188
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2189
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2189:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2190
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2190:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2191
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2191:
	jmp NS_E_1848_MTC_0_failed
LB_2188:
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
	jc LB_2162
	btr QWORD [rdi],3
LB_2162:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2163
	btr QWORD [rdi],2
LB_2163:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2164
	btr QWORD [rdi],1
LB_2164:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2165
	btr QWORD [rdi],0
LB_2165:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1848_MTC_0_failed:
	pop r14
	push r14
; "\194\167"
	jmp LB_2135
LB_2134:
	add r14,1
LB_2135:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2134
	cmp rax,10
	jz LB_2134
	cmp rax,32
	jz LB_2134
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2137
	jmp NS_E_1848_MTC_1_failed
LB_2137:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,167
	jz LB_2138
	jmp NS_E_1848_MTC_1_failed
LB_2138:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2143
LB_2142:
	add r14,1
LB_2143:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2142
	cmp rax,10
	jz LB_2142
	cmp rax,32
	jz LB_2142
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2144
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2145
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2145:
	jmp NS_E_1848_MTC_1_failed
LB_2144:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_2148
LB_2147:
	add r14,1
LB_2148:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2147
	cmp rax,10
	jz LB_2147
	cmp rax,32
	jz LB_2147
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_2150
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2152
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2152:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2153
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2153:
	jmp NS_E_1848_MTC_1_failed
LB_2150:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_2156
LB_2155:
	add r14,1
LB_2156:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2155
	cmp rax,10
	jz LB_2155
	cmp rax,32
	jz LB_2155
	call NS_E_1858_ETR_TBL
	cmp r15,0
	jz LB_2157
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2158
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2158:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2159
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2159:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2160
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2160:
	jmp NS_E_1848_MTC_1_failed
LB_2157:
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
	jc LB_2129
	btr QWORD [rdi],3
LB_2129:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2130
	btr QWORD [rdi],2
LB_2130:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2131
	btr QWORD [rdi],1
LB_2131:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2132
	btr QWORD [rdi],0
LB_2132:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1848_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1850:
NS_E_RDI_1850:
NS_E_1850_ETR_TBL:
NS_E_1850_TBL:
	push r14
; "\194\182"
	jmp LB_2231
LB_2230:
	add r14,1
LB_2231:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2230
	cmp rax,10
	jz LB_2230
	cmp rax,32
	jz LB_2230
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2233
	jmp NS_E_1850_MTC_0_failed
LB_2233:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_2234
	jmp NS_E_1850_MTC_0_failed
LB_2234:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2239
LB_2238:
	add r14,1
LB_2239:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2238
	cmp rax,10
	jz LB_2238
	cmp rax,32
	jz LB_2238
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2240
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2241
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2241:
	jmp NS_E_1850_MTC_0_failed
LB_2240:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; dta_def
	jmp LB_2244
LB_2243:
	add r14,1
LB_2244:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2243
	cmp rax,10
	jz LB_2243
	cmp rax,32
	jz LB_2243
	call NS_E_1860_ETR_TBL
	cmp r15,0
	jz LB_2245
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2246
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2246:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2247
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2247:
	jmp NS_E_1850_MTC_0_failed
LB_2245:
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
	jc LB_2226
	btr QWORD [rdi],2
LB_2226:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2227
	btr QWORD [rdi],1
LB_2227:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2228
	btr QWORD [rdi],0
LB_2228:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1850_MTC_0_failed:
	pop r14
	push r14
; "\194\182"
	jmp LB_2199
LB_2198:
	add r14,1
LB_2199:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2198
	cmp rax,10
	jz LB_2198
	cmp rax,32
	jz LB_2198
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2201
	jmp NS_E_1850_MTC_1_failed
LB_2201:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,182
	jz LB_2202
	jmp NS_E_1850_MTC_1_failed
LB_2202:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2207
LB_2206:
	add r14,1
LB_2207:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2206
	cmp rax,10
	jz LB_2206
	cmp rax,32
	jz LB_2206
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2208
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2209
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2209:
	jmp NS_E_1850_MTC_1_failed
LB_2208:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "="
	jmp LB_2212
LB_2211:
	add r14,1
LB_2212:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2211
	cmp rax,10
	jz LB_2211
	cmp rax,32
	jz LB_2211
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,61
	jz LB_2214
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2216
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2216:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2217
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2217:
	jmp NS_E_1850_MTC_1_failed
LB_2214:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; name
	jmp LB_2220
LB_2219:
	add r14,1
LB_2220:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2219
	cmp rax,10
	jz LB_2219
	cmp rax,32
	jz LB_2219
	call NS_E_1858_ETR_TBL
	cmp r15,0
	jz LB_2221
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
	jmp NS_E_1850_MTC_1_failed
LB_2221:
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
	jc LB_2193
	btr QWORD [rdi],3
LB_2193:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2194
	btr QWORD [rdi],2
LB_2194:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2195
	btr QWORD [rdi],1
LB_2195:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2196
	btr QWORD [rdi],0
LB_2196:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1850_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1852:
NS_E_RDI_1852:
NS_E_1852_ETR_TBL:
NS_E_1852_TBL:
	push r14
; "0xr0"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,48
	jz LB_2254
	jmp NS_E_1852_MTC_0_failed
LB_2254:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,120
	jz LB_2255
	jmp NS_E_1852_MTC_0_failed
LB_2255:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,114
	jz LB_2256
	jmp NS_E_1852_MTC_0_failed
LB_2256:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+3]
	cmp al,48
	jz LB_2257
	jmp NS_E_1852_MTC_0_failed
LB_2257:
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
	jc LB_2249
	btr QWORD [rdi],0
LB_2249:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1852_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1854:
NS_E_RDI_1854:
NS_E_1854_ETR_TBL:
NS_E_1854_TBL:
	push r14
; cha
	call NS_E_1856_ETR_TBL
	cmp r15,0
	jz LB_2269
	jmp NS_E_1854_MTC_0_failed
LB_2269:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; word
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2273
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2274
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2274:
	jmp NS_E_1854_MTC_0_failed
LB_2273:
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
	jc LB_2264
	btr QWORD [rdi],1
LB_2264:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2265
	btr QWORD [rdi],0
LB_2265:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1854_MTC_0_failed:
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
NS_E_1854_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1856:
NS_E_RDI_1856:
NS_E_1856_ETR_TBL:
NS_E_1856_TBL:
	push r14
; "a"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,97
	jz LB_2297
	jmp NS_E_1856_MTC_0_failed
LB_2297:
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
	jc LB_2292
	btr QWORD [rdi],0
LB_2292:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1856_MTC_0_failed:
	pop r14
	push r14
; "b"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,98
	jz LB_2289
	jmp NS_E_1856_MTC_1_failed
LB_2289:
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
	jc LB_2284
	btr QWORD [rdi],0
LB_2284:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1856_MTC_1_failed:
	pop r14
	push r14
; "c"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,99
	jz LB_2281
	jmp NS_E_1856_MTC_2_failed
LB_2281:
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
	jc LB_2276
	btr QWORD [rdi],0
LB_2276:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1856_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1858:
NS_E_RDI_1858:
NS_E_1858_ETR_TBL:
NS_E_1858_TBL:
	push r14
; word
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2312
	jmp NS_E_1858_MTC_0_failed
LB_2312:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "."
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,46
	jz LB_2317
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2319
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2319:
	jmp NS_E_1858_MTC_0_failed
LB_2317:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; name
	call NS_E_1858_ETR_TBL
	cmp r15,0
	jz LB_2323
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2324
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2324:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2325
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2325:
	jmp NS_E_1858_MTC_0_failed
LB_2323:
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
	jc LB_2306
	btr QWORD [rdi],2
LB_2306:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2307
	btr QWORD [rdi],1
LB_2307:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2308
	btr QWORD [rdi],0
LB_2308:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1858_MTC_0_failed:
	pop r14
	push r14
; word
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2304
	jmp NS_E_1858_MTC_1_failed
LB_2304:
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
	jc LB_2300
	btr QWORD [rdi],0
LB_2300:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1858_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1860:
NS_E_RDI_1860:
NS_E_1860_ETR_TBL:
NS_E_1860_TBL:
	push r14
; dta_def_coprd
	call NS_E_1862_ETR_TBL
	cmp r15,0
	jz LB_2331
	jmp NS_E_1860_MTC_0_failed
LB_2331:
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
	jc LB_2327
	btr QWORD [rdi],0
LB_2327:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1860_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1862:
NS_E_RDI_1862:
NS_E_1862_ETR_TBL:
NS_E_1862_TBL:
	push r14
; "\226\136\144"
	jmp LB_2374
LB_2373:
	add r14,1
LB_2374:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2373
	cmp rax,10
	jz LB_2373
	cmp rax,32
	jz LB_2373
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2376
	jmp NS_E_1862_MTC_0_failed
LB_2376:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_2377
	jmp NS_E_1862_MTC_0_failed
LB_2377:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_2378
	jmp NS_E_1862_MTC_0_failed
LB_2378:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2384
LB_2383:
	add r14,1
LB_2384:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2383
	cmp rax,10
	jz LB_2383
	cmp rax,32
	jz LB_2383
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2385
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2386
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2386:
	jmp NS_E_1862_MTC_0_failed
LB_2385:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_2389
LB_2388:
	add r14,1
LB_2389:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2388
	cmp rax,10
	jz LB_2388
	cmp rax,32
	jz LB_2388
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_2391
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2393
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2393:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2394
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2394:
	jmp NS_E_1862_MTC_0_failed
LB_2391:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_2397
LB_2396:
	add r14,1
LB_2397:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2396
	cmp rax,10
	jz LB_2396
	cmp rax,32
	jz LB_2396
	call NS_E_1868_ETR_TBL
	cmp r15,0
	jz LB_2398
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2399
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2399:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2400
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2400:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2401
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2401:
	jmp NS_E_1862_MTC_0_failed
LB_2398:
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
	jc LB_2368
	btr QWORD [rdi],3
LB_2368:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2369
	btr QWORD [rdi],2
LB_2369:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2370
	btr QWORD [rdi],1
LB_2370:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2371
	btr QWORD [rdi],0
LB_2371:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1862_MTC_0_failed:
	pop r14
	push r14
; "\226\136\144"
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
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2341
	jmp NS_E_1862_MTC_1_failed
LB_2341:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_2342
	jmp NS_E_1862_MTC_1_failed
LB_2342:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,144
	jz LB_2343
	jmp NS_E_1862_MTC_1_failed
LB_2343:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	jmp LB_2349
LB_2348:
	add r14,1
LB_2349:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2348
	cmp rax,10
	jz LB_2348
	cmp rax,32
	jz LB_2348
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2350
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2351
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2351:
	jmp NS_E_1862_MTC_1_failed
LB_2350:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; ":"
	jmp LB_2354
LB_2353:
	add r14,1
LB_2354:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2353
	cmp rax,10
	jz LB_2353
	cmp rax,32
	jz LB_2353
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,58
	jz LB_2356
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2358
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2358:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2359
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2359:
	jmp NS_E_1862_MTC_1_failed
LB_2356:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; type
	jmp LB_2362
LB_2361:
	add r14,1
LB_2362:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2361
	cmp rax,10
	jz LB_2361
	cmp rax,32
	jz LB_2361
	call NS_E_1868_ETR_TBL
	cmp r15,0
	jz LB_2363
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2364
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2364:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2365
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2365:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2366
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2366:
	jmp NS_E_1862_MTC_1_failed
LB_2363:
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
	jc LB_2333
	btr QWORD [rdi],3
LB_2333:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2334
	btr QWORD [rdi],2
LB_2334:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2335
	btr QWORD [rdi],1
LB_2335:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2336
	btr QWORD [rdi],0
LB_2336:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1862_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1864:
NS_E_RDI_1864:
NS_E_1864_ETR_TBL:
NS_E_1864_TBL:
	push r14
; op
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
	call NS_E_1866_ETR_TBL
	cmp r15,0
	jz LB_2428
	jmp NS_E_1864_MTC_0_failed
LB_2428:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn
	jmp LB_2431
LB_2430:
	add r14,1
LB_2431:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2430
	cmp rax,10
	jz LB_2430
	cmp rax,32
	jz LB_2430
	call NS_E_1876_ETR_TBL
	cmp r15,0
	jz LB_2432
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2433
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2433:
	jmp NS_E_1864_MTC_0_failed
LB_2432:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "\226\138\162"
	jmp LB_2436
LB_2435:
	add r14,1
LB_2436:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2435
	cmp rax,10
	jz LB_2435
	cmp rax,32
	jz LB_2435
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2438
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2448
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2448:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2449
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2449:
	jmp NS_E_1864_MTC_0_failed
LB_2438:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,138
	jz LB_2439
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2445
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2445:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2446
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2446:
	jmp NS_E_1864_MTC_0_failed
LB_2439:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,162
	jz LB_2440
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2442
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2442:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2443
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2443:
	jmp NS_E_1864_MTC_0_failed
LB_2440:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*2],0
	mov QWORD [prs_vct+8*1+16*2],rax
; reg_ptn
	jmp LB_2452
LB_2451:
	add r14,1
LB_2452:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2451
	cmp rax,10
	jz LB_2451
	cmp rax,32
	jz LB_2451
	call NS_E_1876_ETR_TBL
	cmp r15,0
	jz LB_2453
	mov rsi,QWORD [prs_vct+16*2]
	bt rsi,0
	jc LB_2454
	mov rdi,QWORD [prs_vct+16*2+8*1]
	call dlt
LB_2454:
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2455
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2455:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2456
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2456:
	jmp NS_E_1864_MTC_0_failed
LB_2453:
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
	jc LB_2421
	btr QWORD [rdi],3
LB_2421:
	mov rax,QWORD [prs_vct+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [prs_vct+16*2]
	bt rax,0
	jc LB_2422
	btr QWORD [rdi],2
LB_2422:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2423
	btr QWORD [rdi],1
LB_2423:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2424
	btr QWORD [rdi],0
LB_2424:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1864_MTC_0_failed:
	pop r14
	push r14
; "\226\136\142"
	jmp LB_2407
LB_2406:
	add r14,1
LB_2407:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2406
	cmp rax,10
	jz LB_2406
	cmp rax,32
	jz LB_2406
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2409
	jmp NS_E_1864_MTC_1_failed
LB_2409:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,136
	jz LB_2410
	jmp NS_E_1864_MTC_1_failed
LB_2410:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,142
	jz LB_2411
	jmp NS_E_1864_MTC_1_failed
LB_2411:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn
	jmp LB_2417
LB_2416:
	add r14,1
LB_2417:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2416
	cmp rax,10
	jz LB_2416
	cmp rax,32
	jz LB_2416
	call NS_E_1876_ETR_TBL
	cmp r15,0
	jz LB_2418
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2419
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2419:
	jmp NS_E_1864_MTC_1_failed
LB_2418:
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
	jc LB_2403
	btr QWORD [rdi],1
LB_2403:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2404
	btr QWORD [rdi],0
LB_2404:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1864_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1866:
NS_E_RDI_1866:
NS_E_1866_ETR_TBL:
NS_E_1866_TBL:
	push r14
; name
	jmp LB_2477
LB_2476:
	add r14,1
LB_2477:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2476
	cmp rax,10
	jz LB_2476
	cmp rax,32
	jz LB_2476
	call NS_E_1858_ETR_TBL
	cmp r15,0
	jz LB_2478
	jmp NS_E_1866_MTC_0_failed
LB_2478:
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
	jc LB_2474
	btr QWORD [rdi],0
LB_2474:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1866_MTC_0_failed:
	pop r14
	push r14
; "\194\187"
	jmp LB_2462
LB_2461:
	add r14,1
LB_2462:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2461
	cmp rax,10
	jz LB_2461
	cmp rax,32
	jz LB_2461
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,194
	jz LB_2464
	jmp NS_E_1866_MTC_1_failed
LB_2464:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,187
	jz LB_2465
	jmp NS_E_1866_MTC_1_failed
LB_2465:
	add r14,2
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; cst
	jmp LB_2470
LB_2469:
	add r14,1
LB_2470:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2469
	cmp rax,10
	jz LB_2469
	cmp rax,32
	jz LB_2469
	call NS_E_1852_ETR_TBL
	cmp r15,0
	jz LB_2471
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2472
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2472:
	jmp NS_E_1866_MTC_1_failed
LB_2471:
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
	jc LB_2458
	btr QWORD [rdi],1
LB_2458:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2459
	btr QWORD [rdi],0
LB_2459:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1866_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1868:
NS_E_RDI_1868:
NS_E_1868_ETR_TBL:
NS_E_1868_TBL:
	push r14
; type_imp
	call NS_E_1870_ETR_TBL
	cmp r15,0
	jz LB_2484
	jmp NS_E_1868_MTC_0_failed
LB_2484:
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
	jc LB_2480
	btr QWORD [rdi],0
LB_2480:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1868_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1870:
NS_E_RDI_1870:
NS_E_1870_ETR_TBL:
NS_E_1870_TBL:
	push r14
; type_app
	jmp LB_2497
LB_2496:
	add r14,1
LB_2497:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2496
	cmp rax,10
	jz LB_2496
	cmp rax,32
	jz LB_2496
	call NS_E_1872_ETR_TBL
	cmp r15,0
	jz LB_2498
	jmp NS_E_1870_MTC_0_failed
LB_2498:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\134\146"
	jmp LB_2501
LB_2500:
	add r14,1
LB_2501:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2500
	cmp rax,10
	jz LB_2500
	cmp rax,32
	jz LB_2500
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2503
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2511
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2511:
	jmp NS_E_1870_MTC_0_failed
LB_2503:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,134
	jz LB_2504
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2509
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2509:
	jmp NS_E_1870_MTC_0_failed
LB_2504:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,146
	jz LB_2505
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2507
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2507:
	jmp NS_E_1870_MTC_0_failed
LB_2505:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_imp
	jmp LB_2514
LB_2513:
	add r14,1
LB_2514:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2513
	cmp rax,10
	jz LB_2513
	cmp rax,32
	jz LB_2513
	call NS_E_1870_ETR_TBL
	cmp r15,0
	jz LB_2515
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2516
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2516:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2517
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2517:
	jmp NS_E_1870_MTC_0_failed
LB_2515:
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
	jc LB_2492
	btr QWORD [rdi],2
LB_2492:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2493
	btr QWORD [rdi],1
LB_2493:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2494
	btr QWORD [rdi],0
LB_2494:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1870_MTC_0_failed:
	pop r14
	push r14
; type_app
	jmp LB_2489
LB_2488:
	add r14,1
LB_2489:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2488
	cmp rax,10
	jz LB_2488
	cmp rax,32
	jz LB_2488
	call NS_E_1872_ETR_TBL
	cmp r15,0
	jz LB_2490
	jmp NS_E_1870_MTC_1_failed
LB_2490:
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
	jc LB_2486
	btr QWORD [rdi],0
LB_2486:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1870_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1872:
NS_E_RDI_1872:
NS_E_1872_ETR_TBL:
NS_E_1872_TBL:
	push r14
; type_atm
	jmp LB_2530
LB_2529:
	add r14,1
LB_2530:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2529
	cmp rax,10
	jz LB_2529
	cmp rax,32
	jz LB_2529
	call NS_E_1874_ETR_TBL
	cmp r15,0
	jz LB_2531
	jmp NS_E_1872_MTC_0_failed
LB_2531:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; "\226\151\130"
	jmp LB_2534
LB_2533:
	add r14,1
LB_2534:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2533
	cmp rax,10
	jz LB_2533
	cmp rax,32
	jz LB_2533
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,226
	jz LB_2536
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2544
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2544:
	jmp NS_E_1872_MTC_0_failed
LB_2536:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+1]
	cmp al,151
	jz LB_2537
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2542
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2542:
	jmp NS_E_1872_MTC_0_failed
LB_2537:
	mov rax,0
	mov al,BYTE [r13+r14+8*1+2]
	cmp al,130
	jz LB_2538
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2540
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2540:
	jmp NS_E_1872_MTC_0_failed
LB_2538:
	add r14,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*1],0
	mov QWORD [prs_vct+8*1+16*1],rax
; type_atm
	jmp LB_2547
LB_2546:
	add r14,1
LB_2547:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2546
	cmp rax,10
	jz LB_2546
	cmp rax,32
	jz LB_2546
	call NS_E_1874_ETR_TBL
	cmp r15,0
	jz LB_2548
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2549
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2549:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2550
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2550:
	jmp NS_E_1872_MTC_0_failed
LB_2548:
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
	jc LB_2525
	btr QWORD [rdi],2
LB_2525:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2526
	btr QWORD [rdi],1
LB_2526:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2527
	btr QWORD [rdi],0
LB_2527:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1872_MTC_0_failed:
	pop r14
	push r14
; type_atm
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
	call NS_E_1874_ETR_TBL
	cmp r15,0
	jz LB_2523
	jmp NS_E_1872_MTC_1_failed
LB_2523:
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
NS_E_1872_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1874:
NS_E_RDI_1874:
NS_E_1874_ETR_TBL:
NS_E_1874_TBL:
	push r14
; word
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2556
	jmp NS_E_1874_MTC_0_failed
LB_2556:
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
	jc LB_2552
	btr QWORD [rdi],0
LB_2552:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1874_MTC_0_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1876:
NS_E_RDI_1876:
NS_E_1876_ETR_TBL:
NS_E_1876_TBL:
	push r14
; "{"
	jmp LB_2569
LB_2568:
	add r14,1
LB_2569:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2568
	cmp rax,10
	jz LB_2568
	cmp rax,32
	jz LB_2568
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,123
	jz LB_2571
	jmp NS_E_1876_MTC_0_failed
LB_2571:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_2575
LB_2574:
	add r14,1
LB_2575:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2574
	cmp rax,10
	jz LB_2574
	cmp rax,32
	jz LB_2574
	call NS_E_1878_ETR_TBL
	cmp r15,0
	jz LB_2576
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2577
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2577:
	jmp NS_E_1876_MTC_0_failed
LB_2576:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*1],rax
	mov QWORD [prs_vct+8*1+16*1],r8
; "}"
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
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,125
	jz LB_2582
	mov rsi,QWORD [prs_vct+16*1]
	bt rsi,0
	jc LB_2584
	mov rdi,QWORD [prs_vct+16*1+8*1]
	call dlt
LB_2584:
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2585
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2585:
	jmp NS_E_1876_MTC_0_failed
LB_2582:
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
	jc LB_2564
	btr QWORD [rdi],2
LB_2564:
	mov rax,QWORD [prs_vct+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [prs_vct+16*1]
	bt rax,0
	jc LB_2565
	btr QWORD [rdi],1
LB_2565:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2566
	btr QWORD [rdi],0
LB_2566:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1876_MTC_0_failed:
	pop r14
	push r14
; reg
	jmp LB_2561
LB_2560:
	add r14,1
LB_2561:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2560
	cmp rax,10
	jz LB_2560
	cmp rax,32
	jz LB_2560
	call NS_E_1880_ETR_TBL
	cmp r15,0
	jz LB_2562
	jmp NS_E_1876_MTC_1_failed
LB_2562:
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
	jc LB_2558
	btr QWORD [rdi],0
LB_2558:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1876_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1878:
NS_E_RDI_1878:
NS_E_1878_ETR_TBL:
NS_E_1878_TBL:
	push r14
; reg
	jmp LB_2592
LB_2591:
	add r14,1
LB_2592:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2591
	cmp rax,10
	jz LB_2591
	cmp rax,32
	jz LB_2591
	call NS_E_1880_ETR_TBL
	cmp r15,0
	jz LB_2593
	jmp NS_E_1878_MTC_0_failed
LB_2593:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [prs_vct+16*0],rax
	mov QWORD [prs_vct+8*1+16*0],r8
; reg_ptn_lst
	jmp LB_2596
LB_2595:
	add r14,1
LB_2596:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2595
	cmp rax,10
	jz LB_2595
	cmp rax,32
	jz LB_2595
	call NS_E_1878_ETR_TBL
	cmp r15,0
	jz LB_2597
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2598
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2598:
	jmp NS_E_1878_MTC_0_failed
LB_2597:
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
	jc LB_2588
	btr QWORD [rdi],1
LB_2588:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2589
	btr QWORD [rdi],0
LB_2589:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1878_MTC_0_failed:
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
NS_E_1878_MTC_1_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_1880:
NS_E_RDI_1880:
NS_E_1880_ETR_TBL:
NS_E_1880_TBL:
	push r14
; "%"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,37
	jz LB_2620
	jmp NS_E_1880_MTC_0_failed
LB_2620:
	add r14,1
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0001_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [prs_vct+16*0],0
	mov QWORD [prs_vct+8*1+16*0],rax
; word
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2625
	mov rsi,QWORD [prs_vct+16*0]
	bt rsi,0
	jc LB_2626
	mov rdi,QWORD [prs_vct+16*0+8*1]
	call dlt
LB_2626:
	jmp NS_E_1880_MTC_0_failed
LB_2625:
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
	jc LB_2614
	btr QWORD [rdi],1
LB_2614:
	mov rax,QWORD [prs_vct+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [prs_vct+16*0]
	bt rax,0
	jc LB_2615
	btr QWORD [rdi],0
LB_2615:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1880_MTC_0_failed:
	pop r14
	push r14
; word
	jmp LB_2611
LB_2610:
	add r14,1
LB_2611:
	mov rax,0
	mov al,[r13+r14+8*1]
	cmp rax,9
	jz LB_2610
	cmp rax,10
	jz LB_2610
	cmp rax,32
	jz LB_2610
	call NS_E_1854_ETR_TBL
	cmp r15,0
	jz LB_2612
	jmp NS_E_1880_MTC_1_failed
LB_2612:
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
	jc LB_2608
	btr QWORD [rdi],0
LB_2608:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1880_MTC_1_failed:
	pop r14
	push r14
; "_"
	mov rax,0
	mov al,BYTE [r13+r14+8*1+0]
	cmp al,95
	jz LB_2605
	jmp NS_E_1880_MTC_2_failed
LB_2605:
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
	jc LB_2600
	btr QWORD [rdi],0
LB_2600:
	mov rax,QWORD [prs_vct+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r15,0
	mov r8,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1880_MTC_2_failed:
	pop r14
	mov rax,0x0001_0000_0000_ffff
	mov r8,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [r8],rax
	mov r15,1
	btr r12,3
	bts r12,2
	ret
NS_E_2643:
NS_E_RDI_2643:
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
; 	» "a" _ ⊢ 1' : %_2629
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; » 0xr0 |~ {  } ⊢ %_2630 : %_2630
 ; {>  %_2628~0':_stg %_2629~1':_stg }
; 	» 0xr0 _ ⊢ 2' : %_2630
	mov rdi,0x0
	mov r15,rdi
	bts r12,2
; _f1844 { %_2628 %_2630 } ⊢ { %_2631 %_2632 %_2633 } : { %_2631 %_2632 %_2633 }
 ; {>  %_2628~0':_stg %_2629~1':_stg %_2630~2':_r64 }
; _f1844 { 0' 2' } ⊢ { 0' 2' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn { 0' 2' } ⊢ { 0' 1' }
	mov r14,r15
	bt r12,2
	jc LB_2646
	btr r12,1
	jmp LB_2647
LB_2646:
	bts r12,1
LB_2647:
	call NS_E_1844
; _emt_mov_ptn_to_ptn { 0' 1' 2'◂3' } ⊢ { 0' 2' 3' }
	mov r9,r8
	bt r12,3
	jc LB_2648
	btr r12,4
	jmp LB_2649
LB_2648:
	bts r12,4
LB_2649:
	mov r8,r9
	bt r12,4
	jc LB_2652
	btr r12,3
	jmp LB_2653
LB_2652:
	bts r12,3
LB_2653:
	mov rsi,0
	bt r12,3
	jc LB_2650
	bts rsi,17
	bt r8,0
	jc LB_2650
	jmp LB_2651
LB_2650:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0000_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,3
LB_2651:
	mov rax,r15
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
	mov r15,r14
	bt r12,1
	jc LB_2654
	btr r12,2
	jmp LB_2655
LB_2654:
	bts r12,2
LB_2655:
; pop_iv
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD [rsp],1
	jc LB_2644
	btr r12,1
	jmp LB_2645
LB_2644:
	bts r12,1
LB_2645:
	add rsp,16
; _f16 { %_2629 %_2632 %_2633 } ⊢ { %_2634 %_2635 %_2636 } : { %_2634 %_2635 %_2636 }
 ; {>  %_2629~1':_stg %_2631~0':_stg %_2633~3':(_opn)◂(_p1843) %_2632~2':_r64 }
; _f16 { 1' 2' 3' } ⊢ { 1' 2' 3' }
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
	jc LB_2660
	btr r12,4
	jmp LB_2661
LB_2660:
	bts r12,4
LB_2661:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,4
	jc LB_2658
	btr QWORD [rdi],0
	jmp LB_2659
LB_2658:
	bts QWORD [rdi],0
LB_2659:
	mov r9,r15
	bt r12,2
	jc LB_2664
	btr r12,4
	jmp LB_2665
LB_2664:
	bts r12,4
LB_2665:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,4
	jc LB_2662
	btr QWORD [rdi],1
	jmp LB_2663
LB_2662:
	bts QWORD [rdi],1
LB_2663:
	mov r9,r8
	bt r12,3
	jc LB_2668
	btr r12,4
	jmp LB_2669
LB_2668:
	bts r12,4
LB_2669:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r9
	bt r12,4
	jc LB_2666
	btr QWORD [rdi],2
	jmp LB_2667
LB_2666:
	bts QWORD [rdi],2
LB_2667:
	call NS_E_16
; _emt_mov_ptn_to_ptn 0' ⊢ { 1' 2' 3' }
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_2672
	btr r12,4
	jmp LB_2673
LB_2672:
	bts r12,4
LB_2673:
	mov r14,r9
	bt r12,4
	jc LB_2670
	btr r12,1
	jmp LB_2671
LB_2670:
	bts r12,1
LB_2671:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_2676
	btr r12,4
	jmp LB_2677
LB_2676:
	bts r12,4
LB_2677:
	mov r15,r9
	bt r12,4
	jc LB_2674
	btr r12,2
	jmp LB_2675
LB_2674:
	bts r12,2
LB_2675:
	mov rdi,r13
	mov r9,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_2680
	btr r12,4
	jmp LB_2681
LB_2680:
	bts r12,4
LB_2681:
	mov r8,r9
	bt r12,4
	jc LB_2678
	btr r12,3
	jmp LB_2679
LB_2678:
	bts r12,3
LB_2679:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_2656
	btr r12,0
	jmp LB_2657
LB_2656:
	bts r12,0
LB_2657:
	add rsp,16
; _f14 {  } ⊢ %_2637 : %_2637
 ; {>  %_2635~2':_r64 %_2634~1':_stg %_2636~3':(_opn)◂(_p1843) %_2631~0':_stg }
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
	jc LB_2690
	btr r12,4
	jmp LB_2691
LB_2690:
	bts r12,4
LB_2691:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_2688
	btr r12,3
	jmp LB_2689
LB_2688:
	bts r12,3
LB_2689:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_2686
	btr r12,2
	jmp LB_2687
LB_2686:
	bts r12,2
LB_2687:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_2684
	btr r12,1
	jmp LB_2685
LB_2684:
	bts r12,1
LB_2685:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_2682
	btr r12,0
	jmp LB_2683
LB_2682:
	bts r12,0
LB_2683:
	add rsp,40
; _f16 %_2637 ⊢ %_2638 : %_2638
 ; {>  %_2635~2':_r64 %_2634~1':_stg %_2636~3':(_opn)◂(_p1843) %_2631~0':_stg %_2637~4':_stg }
; _f16 4' ⊢ 4'
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
	jc LB_2700
	btr r12,0
	jmp LB_2701
LB_2700:
	bts r12,0
LB_2701:
	call NS_E_16
; _emt_mov_ptn_to_ptn 0' ⊢ 4'
	mov r9,r13
	bt r12,0
	jc LB_2702
	btr r12,4
	jmp LB_2703
LB_2702:
	bts r12,4
LB_2703:
; pop_iv
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_2698
	btr r12,3
	jmp LB_2699
LB_2698:
	bts r12,3
LB_2699:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_2696
	btr r12,2
	jmp LB_2697
LB_2696:
	bts r12,2
LB_2697:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_2694
	btr r12,1
	jmp LB_2695
LB_2694:
	bts r12,1
LB_2695:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_2692
	btr r12,0
	jmp LB_2693
LB_2692:
	bts r12,0
LB_2693:
	add rsp,40
; 	» "OpADL.mdls" _ ⊢ 5' : %_2639
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,5
; _f15 %_2639 ⊢ { %_2640 %_2641 } : { %_2640 %_2641 }
 ; {>  %_2635~2':_r64 %_2639~5':_stg %_2634~1':_stg %_2636~3':(_opn)◂(_p1843) %_2631~0':_stg %_2638~4':_stg }
; _f15 5' ⊢ { 5' 6' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 5' ⊢ 0'
	mov r13,r10
	bt r12,5
	jc LB_2714
	btr r12,0
	jmp LB_2715
LB_2714:
	bts r12,0
LB_2715:
	call NS_E_15
; _emt_mov_ptn_to_ptn { 0' 1' } ⊢ { 5' 6' }
	mov r10,r13
	bt r12,0
	jc LB_2716
	btr r12,5
	jmp LB_2717
LB_2716:
	bts r12,5
LB_2717:
	mov r11,r14
	bt r12,1
	jc LB_2718
	btr r12,6
	jmp LB_2719
LB_2718:
	bts r12,6
LB_2719:
; pop_iv
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_2712
	btr r12,4
	jmp LB_2713
LB_2712:
	bts r12,4
LB_2713:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_2710
	btr r12,3
	jmp LB_2711
LB_2710:
	bts r12,3
LB_2711:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_2708
	btr r12,2
	jmp LB_2709
LB_2708:
	bts r12,2
LB_2709:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_2706
	btr r12,1
	jmp LB_2707
LB_2706:
	bts r12,1
LB_2707:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_2704
	btr r12,0
	jmp LB_2705
LB_2704:
	bts r12,0
LB_2705:
	add rsp,48
; _f16 %_2641 ⊢ %_2642 : %_2642
 ; {>  %_2635~2':_r64 %_2641~6':_stg %_2634~1':_stg %_2636~3':(_opn)◂(_p1843) %_2631~0':_stg %_2638~4':_stg %_2640~5':_stg }
; _f16 6' ⊢ 6'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r15
	mov QWORD [rsp+8+8*3],r8
	mov QWORD [rsp+8+8*4],r9
	mov QWORD [rsp+8+8*5],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn 6' ⊢ 0'
	mov r13,r11
	bt r12,6
	jc LB_2732
	btr r12,0
	jmp LB_2733
LB_2732:
	bts r12,0
LB_2733:
	call NS_E_16
; _emt_mov_ptn_to_ptn 0' ⊢ 6'
	mov r11,r13
	bt r12,0
	jc LB_2734
	btr r12,6
	jmp LB_2735
LB_2734:
	bts r12,6
LB_2735:
; pop_iv
	mov r10,QWORD [rsp+8+8*5]
	bt QWORD [rsp],5
	jc LB_2730
	btr r12,5
	jmp LB_2731
LB_2730:
	bts r12,5
LB_2731:
	mov r9,QWORD [rsp+8+8*4]
	bt QWORD [rsp],4
	jc LB_2728
	btr r12,4
	jmp LB_2729
LB_2728:
	bts r12,4
LB_2729:
	mov r8,QWORD [rsp+8+8*3]
	bt QWORD [rsp],3
	jc LB_2726
	btr r12,3
	jmp LB_2727
LB_2726:
	bts r12,3
LB_2727:
	mov r15,QWORD [rsp+8+8*2]
	bt QWORD [rsp],2
	jc LB_2724
	btr r12,2
	jmp LB_2725
LB_2724:
	bts r12,2
LB_2725:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD [rsp],1
	jc LB_2722
	btr r12,1
	jmp LB_2723
LB_2722:
	bts r12,1
LB_2723:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD [rsp],0
	jc LB_2720
	btr r12,0
	jmp LB_2721
LB_2720:
	bts r12,0
LB_2721:
	add rsp,56
; ∎ {  }
 ; {>  %_2635~2':_r64 %_2634~1':_stg %_2636~3':(_opn)◂(_p1843) %_2631~0':_stg %_2638~4':_stg %_2642~6':_stg %_2640~5':_stg }
; 	∎ {  }
	bt r12,2
	jc LB_2736
	mov rdi,r15
	call dlt
LB_2736:
	bt r12,1
	jc LB_2737
	mov rdi,r14
	call dlt
LB_2737:
	bt r12,3
	jc LB_2738
	mov rdi,r8
	call dlt
LB_2738:
	bt r12,0
	jc LB_2739
	mov rdi,r13
	call dlt
LB_2739:
	bt r12,4
	jc LB_2740
	mov rdi,r9
	call dlt
LB_2740:
	bt r12,6
	jc LB_2741
	mov rdi,r11
	call dlt
LB_2741:
	bt r12,5
	jc LB_2742
	mov rdi,r10
	call dlt
LB_2742:
; _emt_mov_ptn_to_ptn {  } ⊢ {  }
	ret
section .data
	NS_E_DYN_1833:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1833
	NS_E_DYN_1835:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1835
	NS_E_DYN_1836:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1836
	NS_E_DYN_1837:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1837
	NS_E_DYN_1838:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1838
	NS_E_DYN_1881:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1882:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1840:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1840
	NS_E_DYN_1883:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1884:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1885:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1886:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_1842:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1842
	NS_E_DYN_1887:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1888:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1844:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1844
	NS_E_DYN_1889:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1890:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1846:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1846
	NS_E_DYN_1891:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1892:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1848:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1848
	NS_E_DYN_1893:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1894:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1850:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1850
	NS_E_DYN_1895:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1852:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1852
	NS_E_DYN_1896:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1897:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1854:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1854
	NS_E_DYN_1898:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1899:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1900:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1856:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1856
	NS_E_DYN_1901:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1902:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1858:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1858
	NS_E_DYN_1903:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1860:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1860
	NS_E_DYN_1904:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1905:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1862:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1862
	NS_E_DYN_1906:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1907:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1864:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1864
	NS_E_DYN_1908:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1909:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1866:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1866
	NS_E_DYN_1910:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1868:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1868
	NS_E_DYN_1911:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1912:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1870:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1870
	NS_E_DYN_1913:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1914:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1872:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1872
	NS_E_DYN_1915:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1874:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1874
	NS_E_DYN_1916:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1917:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1876:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1876
	NS_E_DYN_1918:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1919:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1878:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1878
	NS_E_DYN_1920:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_1921:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_1922:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_1880:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_1880
	CST_DYN_2643:
		dq 0x0001_0001_00_82_ffff
		dq 1
