%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
pop r14 ; number of args
  pop rdi ; program name
  call mk_s8
    mov r13,rbx
    mov rbx,[rbx]
    mov rsi,r13
    or rsi,1
    mov [args],rsi
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
  args_lp:
    cmp r14,1
    jz args_end
    pop rdi
  call mk_s8
    mov r8,rbx
    mov rbx,[rbx]
    mov r9,r8
    or r9,1
    mov [r13+16],r9
    mov r13,r8
    mov rcx,0x0000_0002_0000_fffc
    mov [r13],rcx
    mov [r13+8],rax
    sub r14,1
    jmp args_lp
  args_end:
    mov r8,rbx
    mov rbx,[rbx]
    mov rcx,0x0000_0000_0000_ffff
    mov [r8],rcx
    mov rcx,0x0100_0000_0000_0001
    or r8,rcx
    mov [r13+16],r8
	call NS_E_21461
	call NS_E_23720
	call exec_out
	jmp _end
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_24: dq 0
NS_E_24:
NS_E_RDI_24:
	mov rdi,fmt_emt
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	mov rdi,r13
	bt r12,0
	call pp0
	mov rdi,fmt_nl
	xor rax,rax
	mov QWORD [rsp_tmp],rsp
	and rsp,~0xf
	call printf
	mov rsp,QWORD [rsp_tmp]
	ret
NS_E_19962:
NS_E_RDI_19962:
NS_E_19962_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_19963
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_19963:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_19965:
NS_E_RDI_19965:
NS_E_19965_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_19965_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_19965_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_19966:
NS_E_RDI_19966:
NS_E_19966_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_19966_LB_0
	cmp r11,57
	ja NS_E_19966_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_19966_LB_0:
	mov rax,0
	ret
NS_E_19968:
NS_E_RDI_19968:
NS_E_19968_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_19968_LB_0
	cmp r11,122
	ja NS_E_19968_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_19968_LB_0:
	mov rax,0
	ret
NS_E_19967:
NS_E_RDI_19967:
NS_E_19967_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_19967_LB_0
	cmp r11,90
	ja NS_E_19967_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_19967_LB_0:
	mov rax,0
	ret
NS_E_31:
	mov rdi,r13
	bt r12,0
NS_E_RDI_31:
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
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
	mov rax,[r14]
	lea r8,[r8-1+r13]
	shr rax,32
	cmp r8,rax
	jge err_s8_ge
	mov rax,[r9]
	lea r10,[r10-1+r13]
	shr rax,32
	cmp r10,rax
	jge err_s8_ge
	lea rsi,[r14+8+r8]
	lea rdi,[r9+8+r10]
	mov rcx,r13
	std
	rep movsb
	cld
	add r8,1
	add r10,1
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_18: dq 0
NS_E_18:
NS_E_RDI_18:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,QWORD [rdi+8+rsi]
	and rax,0xff
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_17: dq 0
NS_E_17:
NS_E_RDI_17:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_19964:
NS_E_RDI_19964:
NS_E_19964_ETR_TBL:
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
	jz NS_E_19964_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_19964_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_19982:
; 	|» { 0' 1' }
NS_E_RDI_19982:
MTC_LB_19983:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_19984
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_19985
	bt QWORD [rax],0
	jc LB_19986
	btr r12,4
	jmp LB_19987
LB_19986:
	bts r12,4
LB_19987:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_19985:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_19990
	btr r12,5
	jmp LB_19991
LB_19990:
	bts r12,5
LB_19991:
	mov r8,r11
	bt r12,5
	jc LB_19988
	btr r12,2
	jmp LB_19989
LB_19988:
	bts r12,2
LB_19989:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_19994
	btr r12,5
	jmp LB_19995
LB_19994:
	bts r12,5
LB_19995:
	mov r9,r11
	bt r12,5
	jc LB_19992
	btr r12,3
	jmp LB_19993
LB_19992:
	bts r12,3
LB_19993:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_19996:
	cmp r15,0
	jz LB_19997
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_19996
LB_19997:
; _f42 %_19969 ⊢ %_19973 : %_19973
 ; {>  %_19969~0':_r64 %_19972~3':(_lst)◂(_r64) %_19971~2':_r64 }
	add r13,1
; _f19982 { %_19973 %_19972 } ⊢ { %_19974 %_19975 } : { %_19974 %_19975 }
 ; {>  %_19973~0':_r64 %_19972~3':(_lst)◂(_r64) %_19971~2':_r64 }
; _f19982 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_20000
	btr r12,1
	jmp LB_20001
LB_20000:
	bts r12,1
LB_20001:
	call NS_E_19982
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_19998
	btr r12,2
	jmp LB_19999
LB_19998:
	bts r12,2
LB_19999:
	add rsp,16
; _f41 %_19974 ⊢ %_19976 : %_19976
 ; {>  %_19975~1':_stg %_19974~0':_r64 %_19971~2':_r64 }
	sub r13,1
; _f19 { %_19975 %_19976 %_19971 } ⊢ { %_19977 %_19978 %_19979 } : { %_19977 %_19978 %_19979 }
 ; {>  %_19975~1':_stg %_19976~0':_r64 %_19971~2':_r64 }
; _f19 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_20002
	btr r12,3
	jmp LB_20003
LB_20002:
	bts r12,3
LB_20003:
	mov r14,r13
	bt r12,0
	jc LB_20004
	btr r12,1
	jmp LB_20005
LB_20004:
	bts r12,1
LB_20005:
	mov r13,r9
	bt r12,3
	jc LB_20006
	btr r12,0
	jmp LB_20007
LB_20006:
	bts r12,0
LB_20007:
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_19978 %_19977 }
 ; {>  %_19978~1':_r64 %_19977~0':_stg %_19979~2':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_20008
	mov rdi,r8
	call dlt
LB_20008:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_20009
	btr r12,2
	jmp LB_20010
LB_20009:
	bts r12,2
LB_20010:
	mov r14,r13
	bt r12,0
	jc LB_20011
	btr r12,1
	jmp LB_20012
LB_20011:
	bts r12,1
LB_20012:
	mov r13,r8
	bt r12,2
	jc LB_20013
	btr r12,0
	jmp LB_20014
LB_20013:
	bts r12,0
LB_20014:
	ret
MTC_LB_19984:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_20015
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_20016
	bt QWORD [rax],0
	jc LB_20017
	btr r12,2
	jmp LB_20018
LB_20017:
	bts r12,2
LB_20018:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_20016:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_20019:
	cmp r15,0
	jz LB_20020
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20019
LB_20020:
; _f17 %_19969 ⊢ { %_19980 %_19981 } : { %_19980 %_19981 }
 ; {>  %_19969~0':_r64 }
; _f17 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_17
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_19980 %_19981 }
 ; {>  %_19980~0':_r64 %_19981~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_20015:
NS_E_20025:
; 	|» 0'
NS_E_RDI_20025:
; » 0xr0 |~ {  } ⊢ %_20022 : %_20022
 ; {>  %_20021~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_20022
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f19982 { %_20022 %_20021 } ⊢ { %_20023 %_20024 } : { %_20023 %_20024 }
 ; {>  %_20021~0':(_lst)◂(_r64) %_20022~1':_r64 }
; _f19982 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_20026
	btr r12,2
	jmp LB_20027
LB_20026:
	bts r12,2
LB_20027:
	mov r14,r13
	bt r12,0
	jc LB_20028
	btr r12,1
	jmp LB_20029
LB_20028:
	bts r12,1
LB_20029:
	mov r13,r8
	bt r12,2
	jc LB_20030
	btr r12,0
	jmp LB_20031
LB_20030:
	bts r12,0
LB_20031:
	call NS_E_19982
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_20024
 ; {>  %_20023~0':_r64 %_20024~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_20032
	mov rdi,r13
	call dlt
LB_20032:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_20033
	btr r12,0
	jmp LB_20034
LB_20033:
	bts r12,0
LB_20034:
	ret
NS_E_20035:
NS_E_RDI_20035:
NS_E_20035_ETR_TBL:
NS_E_20035_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_20076
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_20076
	jmp LB_20077
LB_20076:
	jmp LB_20066
LB_20077:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_20036_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20081
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20082
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20082:
	jmp LB_20066
LB_20081:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_20069
	btr r12,1
	jmp LB_20070
LB_20069:
	bts r12,1
LB_20070:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20067
	btr r12,0
	jmp LB_20068
LB_20067:
	bts r12,0
LB_20068:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_20063
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_20084
	btr r12,2
	jmp LB_20085
LB_20084:
	bts r12,2
LB_20085:
	mov r13,r14
	bt r12,1
	jc LB_20086
	btr r12,0
	jmp LB_20087
LB_20086:
	bts r12,0
LB_20087:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f20025 %_20038 ⊢ %_20039 : %_20039
 ; {>  %_20038~0':(_lst)◂(_r64) }
; _f20025 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20025
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_20039 ⊢ %_20040 : %_20040
 ; {>  %_20039~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_20040
 ; {>  %_20040~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20061
	btr r12,3
	jmp LB_20062
LB_20061:
	bts r12,3
LB_20062:
	mov r8,0
	bts r12,2
	ret
LB_20063:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20065
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20064
LB_20065:
	add rsp,8
	ret
LB_20066:
	add rsp,32
	pop r14
LB_20064:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20036:
NS_E_RDI_20036:
NS_E_20036_ETR_TBL:
NS_E_20036_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_20113
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_20113
	jmp LB_20114
LB_20113:
	jmp LB_20101
LB_20114:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_20037_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20118
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20119
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20119:
	jmp LB_20101
LB_20118:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_20036_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20124
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_20125
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_20125:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20126
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20126:
	jmp LB_20101
LB_20124:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_20106
	btr r12,2
	jmp LB_20107
LB_20106:
	bts r12,2
LB_20107:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_20104
	btr r12,1
	jmp LB_20105
LB_20104:
	bts r12,1
LB_20105:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20102
	btr r12,0
	jmp LB_20103
LB_20102:
	bts r12,0
LB_20103:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_20098
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_20128
	btr r12,3
	jmp LB_20129
LB_20128:
	bts r12,3
LB_20129:
	mov r14,r8
	bt r12,2
	jc LB_20130
	btr r12,1
	jmp LB_20131
LB_20130:
	bts r12,1
LB_20131:
	mov r8,r13
	bt r12,0
	jc LB_20132
	btr r12,2
	jmp LB_20133
LB_20132:
	bts r12,2
LB_20133:
	mov r13,r9
	bt r12,3
	jc LB_20134
	btr r12,0
	jmp LB_20135
LB_20134:
	bts r12,0
LB_20135:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_20041 %_20042 } ⊢ %_20043 : %_20043
 ; {>  %_20042~1':(_lst)◂(_r64) %_20041~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_20043 ⊢ %_20044 : %_20044
 ; {>  %_20043~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_20044
 ; {>  %_20044~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_20092
	btr r12,2
	jmp LB_20093
LB_20092:
	bts r12,2
LB_20093:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_20090
	btr QWORD [rdi],0
	jmp LB_20091
LB_20090:
	bts QWORD [rdi],0
LB_20091:
	mov r8,r14
	bt r12,1
	jc LB_20096
	btr r12,2
	jmp LB_20097
LB_20096:
	bts r12,2
LB_20097:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_20094
	btr QWORD [rdi],1
	jmp LB_20095
LB_20094:
	bts QWORD [rdi],1
LB_20095:
	mov rsi,1
	bt r12,3
	jc LB_20088
	mov rsi,0
	bt r9,0
	jc LB_20088
	jmp LB_20089
LB_20088:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_20089:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_20098:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20100
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20099
LB_20100:
	add rsp,8
	ret
LB_20101:
	add rsp,48
	pop r14
LB_20099:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_20149
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_20149
	jmp LB_20150
LB_20149:
	jmp LB_20141
LB_20150:
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
	jc LB_20142
	btr r12,0
	jmp LB_20143
LB_20142:
	bts r12,0
LB_20143:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20138
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_20045 : %_20045
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_20045 ⊢ %_20046 : %_20046
 ; {>  %_20045~°1◂{  }:(_lst)◂(t3418'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_20046
 ; {>  %_20046~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3421'(0))) }
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
	jc LB_20136
	mov rsi,0
	bt r9,0
	jc LB_20136
	jmp LB_20137
LB_20136:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_20137:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_20138:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20140
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20139
LB_20140:
	add rsp,8
	ret
LB_20141:
	add rsp,16
	pop r14
LB_20139:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_19962_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20172
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20164
LB_20172:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_20036_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20177
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20178
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20178:
	jmp LB_20164
LB_20177:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_20167
	btr r12,1
	jmp LB_20168
LB_20167:
	bts r12,1
LB_20168:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20165
	btr r12,0
	jmp LB_20166
LB_20165:
	bts r12,0
LB_20166:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_20161
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_20047 %_20048 } ⊢ %_20049 : %_20049
 ; {>  %_20047~0':_r64 %_20048~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_20049 ⊢ %_20050 : %_20050
 ; {>  %_20049~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_20050
 ; {>  %_20050~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_20155
	btr r12,2
	jmp LB_20156
LB_20155:
	bts r12,2
LB_20156:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_20153
	btr QWORD [rdi],0
	jmp LB_20154
LB_20153:
	bts QWORD [rdi],0
LB_20154:
	mov r8,r14
	bt r12,1
	jc LB_20159
	btr r12,2
	jmp LB_20160
LB_20159:
	bts r12,2
LB_20160:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_20157
	btr QWORD [rdi],1
	jmp LB_20158
LB_20157:
	bts QWORD [rdi],1
LB_20158:
	mov rsi,1
	bt r12,3
	jc LB_20151
	mov rsi,0
	bt r9,0
	jc LB_20151
	jmp LB_20152
LB_20151:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_20152:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_20161:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20163
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20162
LB_20163:
	add rsp,8
	ret
LB_20164:
	add rsp,32
	pop r14
LB_20162:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20037:
NS_E_RDI_20037:
NS_E_20037_ETR_TBL:
NS_E_20037_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_20193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_20193
	jmp LB_20194
LB_20193:
	jmp LB_20185
LB_20194:
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
	jc LB_20186
	btr r12,0
	jmp LB_20187
LB_20186:
	bts r12,0
LB_20187:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20182
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_20051 : %_20051
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_20051
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_20051 ⊢ %_20052 : %_20052
 ; {>  %_20051~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20052
 ; {>  %_20052~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20180
	btr r12,3
	jmp LB_20181
LB_20180:
	bts r12,3
LB_20181:
	mov r8,0
	bts r12,2
	ret
LB_20182:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20184
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20183
LB_20184:
	add rsp,8
	ret
LB_20185:
	add rsp,16
	pop r14
LB_20183:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_20208
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_20208
	jmp LB_20209
LB_20208:
	jmp LB_20200
LB_20209:
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
	jc LB_20201
	btr r12,0
	jmp LB_20202
LB_20201:
	bts r12,0
LB_20202:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20197
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_20053 : %_20053
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_20053
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_20053 ⊢ %_20054 : %_20054
 ; {>  %_20053~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20054
 ; {>  %_20054~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20195
	btr r12,3
	jmp LB_20196
LB_20195:
	bts r12,3
LB_20196:
	mov r8,0
	bts r12,2
	ret
LB_20197:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20199
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20198
LB_20199:
	add rsp,8
	ret
LB_20200:
	add rsp,16
	pop r14
LB_20198:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_20223
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_20223
	jmp LB_20224
LB_20223:
	jmp LB_20215
LB_20224:
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
	jc LB_20216
	btr r12,0
	jmp LB_20217
LB_20216:
	bts r12,0
LB_20217:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20212
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_20055 : %_20055
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_20055
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_20055 ⊢ %_20056 : %_20056
 ; {>  %_20055~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20056
 ; {>  %_20056~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20210
	btr r12,3
	jmp LB_20211
LB_20210:
	bts r12,3
LB_20211:
	mov r8,0
	bts r12,2
	ret
LB_20212:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20214
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20213
LB_20214:
	add rsp,8
	ret
LB_20215:
	add rsp,16
	pop r14
LB_20213:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_20238
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_20238
	jmp LB_20239
LB_20238:
	jmp LB_20230
LB_20239:
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
	jc LB_20231
	btr r12,0
	jmp LB_20232
LB_20231:
	bts r12,0
LB_20232:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20227
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_20057 : %_20057
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_20057
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_20057 ⊢ %_20058 : %_20058
 ; {>  %_20057~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20058
 ; {>  %_20058~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20225
	btr r12,3
	jmp LB_20226
LB_20225:
	bts r12,3
LB_20226:
	mov r8,0
	bts r12,2
	ret
LB_20227:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20229
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20228
LB_20229:
	add rsp,8
	ret
LB_20230:
	add rsp,16
	pop r14
LB_20228:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_20253
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_20253
	jmp LB_20254
LB_20253:
	jmp LB_20245
LB_20254:
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
	jc LB_20246
	btr r12,0
	jmp LB_20247
LB_20246:
	bts r12,0
LB_20247:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20242
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_20059 : %_20059
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_20059
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_20059 ⊢ %_20060 : %_20060
 ; {>  %_20059~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20060
 ; {>  %_20060~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20240
	btr r12,3
	jmp LB_20241
LB_20240:
	bts r12,3
LB_20241:
	mov r8,0
	bts r12,2
	ret
LB_20242:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20244
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20243
LB_20244:
	add rsp,8
	ret
LB_20245:
	add rsp,16
	pop r14
LB_20243:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20255:
NS_E_RDI_20255:
NS_E_20255_ETR_TBL:
NS_E_20255_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_19962_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20292
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20286
LB_20292:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20287
	btr r12,0
	jmp LB_20288
LB_20287:
	bts r12,0
LB_20288:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20283
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_20257 : %_20257
 ; {>  %_20256~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_20257
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_20258 : %_20258
 ; {>  %_20257~1':_r64 %_20256~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_20258
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f36 { %_20256 %_20257 } ⊢ { %_20259 %_20260 %_20261 } : { %_20259 %_20260 %_20261 }
 ; {>  %_20257~1':_r64 %_20258~2':_r64 %_20256~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f36 { %_20258 %_20259 } ⊢ { %_20262 %_20263 %_20264 } : { %_20262 %_20263 %_20264 }
 ; {>  %_20259~0':_r64 %_20258~2':_r64 %_20261~3':_r64 %_20260~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_20267:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_20268
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_20268
LB_20269:
	cmp r15,0
	jz LB_20270
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20269
LB_20270:
; _some %_20263 ⊢ %_20265 : %_20265
 ; {>  %_20262~2':_r64 %_20263~0':_r64 %_20260~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20265
 ; {>  %_20262~2':_r64 %_20265~°0◂0':(_opn)◂(_r64) %_20260~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_20271
	mov rdi,r8
	call dlt
LB_20271:
	bt r12,1
	jc LB_20272
	mov rdi,r14
	call dlt
LB_20272:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20273
	btr r12,3
	jmp LB_20274
LB_20273:
	bts r12,3
LB_20274:
	mov r8,0
	bts r12,2
	ret
MTC_LB_20268:
	mov r15,0
LB_20276:
	cmp r15,0
	jz LB_20277
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20276
LB_20277:
; _none {  } ⊢ %_20266 : %_20266
 ; {>  %_20262~2':_r64 %_20261~3':_r64 %_20263~0':_r64 %_20264~4':_r64 %_20260~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_20266
 ; {>  %_20262~2':_r64 %_20261~3':_r64 %_20263~0':_r64 %_20264~4':_r64 %_20260~1':_r64 %_20266~°1◂{  }:(_opn)◂(t3496'(0)) }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_20278
	mov rdi,r8
	call dlt
LB_20278:
	bt r12,3
	jc LB_20279
	mov rdi,r9
	call dlt
LB_20279:
	bt r12,0
	jc LB_20280
	mov rdi,r13
	call dlt
LB_20280:
	bt r12,4
	jc LB_20281
	mov rdi,r10
	call dlt
LB_20281:
	bt r12,1
	jc LB_20282
	mov rdi,r14
	call dlt
LB_20282:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_20275:
LB_20283:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20285
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20284
LB_20285:
	add rsp,8
	ret
LB_20286:
	add rsp,16
	pop r14
LB_20284:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20294:
NS_E_RDI_20294:
NS_E_20294_ETR_TBL:
NS_E_20294_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_19962_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20331
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20325
LB_20331:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20326
	btr r12,0
	jmp LB_20327
LB_20326:
	bts r12,0
LB_20327:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20322
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_20296 : %_20296
 ; {>  %_20295~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_20296
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_20297 : %_20297
 ; {>  %_20296~1':_r64 %_20295~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_20297
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f36 { %_20295 %_20296 } ⊢ { %_20298 %_20299 %_20300 } : { %_20298 %_20299 %_20300 }
 ; {>  %_20296~1':_r64 %_20297~2':_r64 %_20295~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f36 { %_20297 %_20298 } ⊢ { %_20301 %_20302 %_20303 } : { %_20301 %_20302 %_20303 }
 ; {>  %_20299~1':_r64 %_20300~3':_r64 %_20298~0':_r64 %_20297~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_20306:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_20307
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_20307
LB_20308:
	cmp r15,0
	jz LB_20309
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20308
LB_20309:
; _some %_20302 ⊢ %_20304 : %_20304
 ; {>  %_20299~1':_r64 %_20302~0':_r64 %_20301~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20304
 ; {>  %_20299~1':_r64 %_20301~2':_r64 %_20304~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_20310
	mov rdi,r14
	call dlt
LB_20310:
	bt r12,2
	jc LB_20311
	mov rdi,r8
	call dlt
LB_20311:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20312
	btr r12,3
	jmp LB_20313
LB_20312:
	bts r12,3
LB_20313:
	mov r8,0
	bts r12,2
	ret
MTC_LB_20307:
	mov r15,0
LB_20315:
	cmp r15,0
	jz LB_20316
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20315
LB_20316:
; _none {  } ⊢ %_20305 : %_20305
 ; {>  %_20303~4':_r64 %_20299~1':_r64 %_20302~0':_r64 %_20301~2':_r64 %_20300~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_20305
 ; {>  %_20303~4':_r64 %_20299~1':_r64 %_20302~0':_r64 %_20301~2':_r64 %_20305~°1◂{  }:(_opn)◂(t3523'(0)) %_20300~3':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_20317
	mov rdi,r10
	call dlt
LB_20317:
	bt r12,1
	jc LB_20318
	mov rdi,r14
	call dlt
LB_20318:
	bt r12,0
	jc LB_20319
	mov rdi,r13
	call dlt
LB_20319:
	bt r12,2
	jc LB_20320
	mov rdi,r8
	call dlt
LB_20320:
	bt r12,3
	jc LB_20321
	mov rdi,r9
	call dlt
LB_20321:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_20314:
LB_20322:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20324
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20323
LB_20324:
	add rsp,8
	ret
LB_20325:
	add rsp,16
	pop r14
LB_20323:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20333:
NS_E_RDI_20333:
NS_E_20333_ETR_TBL:
NS_E_20333_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_19962_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20370
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20364
LB_20370:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20365
	btr r12,0
	jmp LB_20366
LB_20365:
	bts r12,0
LB_20366:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20361
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_20335 : %_20335
 ; {>  %_20334~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_20335
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_20336 : %_20336
 ; {>  %_20335~1':_r64 %_20334~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_20336
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f36 { %_20334 %_20335 } ⊢ { %_20337 %_20338 %_20339 } : { %_20337 %_20338 %_20339 }
 ; {>  %_20336~2':_r64 %_20335~1':_r64 %_20334~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f36 { %_20336 %_20337 } ⊢ { %_20340 %_20341 %_20342 } : { %_20340 %_20341 %_20342 }
 ; {>  %_20336~2':_r64 %_20338~1':_r64 %_20337~0':_r64 %_20339~3':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_20345:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_20346
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_20346
LB_20347:
	cmp r15,0
	jz LB_20348
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20347
LB_20348:
; _some %_20341 ⊢ %_20343 : %_20343
 ; {>  %_20340~2':_r64 %_20338~1':_r64 %_20341~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20343
 ; {>  %_20340~2':_r64 %_20338~1':_r64 %_20343~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_20349
	mov rdi,r8
	call dlt
LB_20349:
	bt r12,1
	jc LB_20350
	mov rdi,r14
	call dlt
LB_20350:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20351
	btr r12,3
	jmp LB_20352
LB_20351:
	bts r12,3
LB_20352:
	mov r8,0
	bts r12,2
	ret
MTC_LB_20346:
	mov r15,0
LB_20354:
	cmp r15,0
	jz LB_20355
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_20354
LB_20355:
; _none {  } ⊢ %_20344 : %_20344
 ; {>  %_20340~2':_r64 %_20338~1':_r64 %_20341~0':_r64 %_20342~4':_r64 %_20339~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_20344
 ; {>  %_20340~2':_r64 %_20338~1':_r64 %_20341~0':_r64 %_20344~°1◂{  }:(_opn)◂(t3550'(0)) %_20342~4':_r64 %_20339~3':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_20356
	mov rdi,r8
	call dlt
LB_20356:
	bt r12,1
	jc LB_20357
	mov rdi,r14
	call dlt
LB_20357:
	bt r12,0
	jc LB_20358
	mov rdi,r13
	call dlt
LB_20358:
	bt r12,4
	jc LB_20359
	mov rdi,r10
	call dlt
LB_20359:
	bt r12,3
	jc LB_20360
	mov rdi,r9
	call dlt
LB_20360:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_20353:
LB_20361:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20363
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20362
LB_20363:
	add rsp,8
	ret
LB_20364:
	add rsp,16
	pop r14
LB_20362:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20372:
NS_E_RDI_20372:
NS_E_20372_ETR_TBL:
NS_E_20372_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_20333_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20388
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20382
LB_20388:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20383
	btr r12,0
	jmp LB_20384
LB_20383:
	bts r12,0
LB_20384:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20379
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_20373 ⊢ %_20374 : %_20374
 ; {>  %_20373~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20374
 ; {>  %_20374~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20377
	btr r12,3
	jmp LB_20378
LB_20377:
	bts r12,3
LB_20378:
	mov r8,0
	bts r12,2
	ret
LB_20379:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20381
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20380
LB_20381:
	add rsp,8
	ret
LB_20382:
	add rsp,16
	pop r14
LB_20380:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_20294_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20401
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20395
LB_20401:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20396
	btr r12,0
	jmp LB_20397
LB_20396:
	bts r12,0
LB_20397:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20392
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_20375 ⊢ %_20376 : %_20376
 ; {>  %_20375~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20376
 ; {>  %_20376~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20390
	btr r12,3
	jmp LB_20391
LB_20390:
	bts r12,3
LB_20391:
	mov r8,0
	bts r12,2
	ret
LB_20392:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20394
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20393
LB_20394:
	add rsp,8
	ret
LB_20395:
	add rsp,16
	pop r14
LB_20393:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20403:
NS_E_RDI_20403:
NS_E_20403_ETR_TBL:
NS_E_20403_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_20372_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20448
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20440
LB_20448:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_20404_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20453
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20454
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20454:
	jmp LB_20440
LB_20453:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_20443
	btr r12,1
	jmp LB_20444
LB_20443:
	bts r12,1
LB_20444:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20441
	btr r12,0
	jmp LB_20442
LB_20441:
	bts r12,0
LB_20442:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_20437
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_20406 %_20407 } ⊢ %_20408 : %_20408
 ; {>  %_20406~0':_r64 %_20407~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f20025 %_20408 ⊢ %_20409 : %_20409
 ; {>  %_20408~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f20025 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_20423
	btr r12,2
	jmp LB_20424
LB_20423:
	bts r12,2
LB_20424:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_20429
	btr r12,3
	jmp LB_20430
LB_20429:
	bts r12,3
LB_20430:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_20427
	btr QWORD [rdi],0
	jmp LB_20428
LB_20427:
	bts QWORD [rdi],0
LB_20428:
	mov r9,r14
	bt r12,1
	jc LB_20433
	btr r12,3
	jmp LB_20434
LB_20433:
	bts r12,3
LB_20434:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_20431
	btr QWORD [rdi],1
	jmp LB_20432
LB_20431:
	bts QWORD [rdi],1
LB_20432:
	mov rsi,1
	bt r12,0
	jc LB_20425
	mov rsi,0
	bt r13,0
	jc LB_20425
	jmp LB_20426
LB_20425:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_20426:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_20025
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_20409 ⊢ %_20410 : %_20410
 ; {>  %_20409~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_20410
 ; {>  %_20410~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20435
	btr r12,3
	jmp LB_20436
LB_20435:
	bts r12,3
LB_20436:
	mov r8,0
	bts r12,2
	ret
LB_20437:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20439
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20438
LB_20439:
	add rsp,8
	ret
LB_20440:
	add rsp,32
	pop r14
LB_20438:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20404:
NS_E_RDI_20404:
NS_E_20404_ETR_TBL:
NS_E_20404_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_20405_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20477
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20469
LB_20477:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_20404_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20482
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20483
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20483:
	jmp LB_20469
LB_20482:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_20472
	btr r12,1
	jmp LB_20473
LB_20472:
	bts r12,1
LB_20473:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20470
	btr r12,0
	jmp LB_20471
LB_20470:
	bts r12,0
LB_20471:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_20466
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_20411 %_20412 } ⊢ %_20413 : %_20413
 ; {>  %_20411~0':_r64 %_20412~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_20413 ⊢ %_20414 : %_20414
 ; {>  %_20413~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_20414
 ; {>  %_20414~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_20460
	btr r12,2
	jmp LB_20461
LB_20460:
	bts r12,2
LB_20461:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_20458
	btr QWORD [rdi],0
	jmp LB_20459
LB_20458:
	bts QWORD [rdi],0
LB_20459:
	mov r8,r14
	bt r12,1
	jc LB_20464
	btr r12,2
	jmp LB_20465
LB_20464:
	bts r12,2
LB_20465:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_20462
	btr QWORD [rdi],1
	jmp LB_20463
LB_20462:
	bts QWORD [rdi],1
LB_20463:
	mov rsi,1
	bt r12,3
	jc LB_20456
	mov rsi,0
	bt r9,0
	jc LB_20456
	jmp LB_20457
LB_20456:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_20457:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_20466:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20468
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20467
LB_20468:
	add rsp,8
	ret
LB_20469:
	add rsp,32
	pop r14
LB_20467:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_20487
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_20415 : %_20415
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_20415 ⊢ %_20416 : %_20416
 ; {>  %_20415~°1◂{  }:(_lst)◂(t3594'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_20416
 ; {>  %_20416~°0◂°1◂{  }:(_opn)◂((_lst)◂(t3597'(0))) }
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
	jc LB_20485
	mov rsi,0
	bt r9,0
	jc LB_20485
	jmp LB_20486
LB_20485:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_20486:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_20487:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20489
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20488
LB_20489:
	add rsp,8
	ret
LB_20490:
	add rsp,0
	pop r14
LB_20488:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20405:
NS_E_RDI_20405:
NS_E_20405_ETR_TBL:
NS_E_20405_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_20372_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20502
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20496
LB_20502:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20497
	btr r12,0
	jmp LB_20498
LB_20497:
	bts r12,0
LB_20498:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20493
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_20417 ⊢ %_20418 : %_20418
 ; {>  %_20417~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20418
 ; {>  %_20418~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20491
	btr r12,3
	jmp LB_20492
LB_20491:
	bts r12,3
LB_20492:
	mov r8,0
	bts r12,2
	ret
LB_20493:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20495
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20494
LB_20495:
	add rsp,8
	ret
LB_20496:
	add rsp,16
	pop r14
LB_20494:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_20255_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20515
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20509
LB_20515:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20510
	btr r12,0
	jmp LB_20511
LB_20510:
	bts r12,0
LB_20511:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20506
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_20419 ⊢ %_20420 : %_20420
 ; {>  %_20419~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20420
 ; {>  %_20420~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20504
	btr r12,3
	jmp LB_20505
LB_20504:
	bts r12,3
LB_20505:
	mov r8,0
	bts r12,2
	ret
LB_20506:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20508
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20507
LB_20508:
	add rsp,8
	ret
LB_20509:
	add rsp,16
	pop r14
LB_20507:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_20530
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_20530
	jmp LB_20531
LB_20530:
	jmp LB_20522
LB_20531:
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
	jc LB_20523
	btr r12,0
	jmp LB_20524
LB_20523:
	bts r12,0
LB_20524:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20519
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_20421 : %_20421
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_20421
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_20421 ⊢ %_20422 : %_20422
 ; {>  %_20421~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20422
 ; {>  %_20422~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20517
	btr r12,3
	jmp LB_20518
LB_20517:
	bts r12,3
LB_20518:
	mov r8,0
	bts r12,2
	ret
LB_20519:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20521
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20520
LB_20521:
	add rsp,8
	ret
LB_20522:
	add rsp,16
	pop r14
LB_20520:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20532:
NS_E_RDI_20532:
NS_E_20532_ETR_TBL:
NS_E_20532_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_20553
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_20553
	jmp LB_20554
LB_20553:
	jmp LB_20543
LB_20554:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_20404_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20558
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20559
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20559:
	jmp LB_20543
LB_20558:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_20546
	btr r12,1
	jmp LB_20547
LB_20546:
	bts r12,1
LB_20547:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20544
	btr r12,0
	jmp LB_20545
LB_20544:
	bts r12,0
LB_20545:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_20540
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_20561
	btr r12,2
	jmp LB_20562
LB_20561:
	bts r12,2
LB_20562:
	mov r13,r14
	bt r12,1
	jc LB_20563
	btr r12,0
	jmp LB_20564
LB_20563:
	bts r12,0
LB_20564:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f20025 %_20533 ⊢ %_20534 : %_20534
 ; {>  %_20533~0':(_lst)◂(_r64) }
; _f20025 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20025
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_20534 ⊢ %_20535 : %_20535
 ; {>  %_20534~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_20535
 ; {>  %_20535~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20538
	btr r12,3
	jmp LB_20539
LB_20538:
	bts r12,3
LB_20539:
	mov r8,0
	bts r12,2
	ret
LB_20540:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20542
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20541
LB_20542:
	add rsp,8
	ret
LB_20543:
	add rsp,32
	pop r14
LB_20541:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20576
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20570
LB_20576:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20571
	btr r12,0
	jmp LB_20572
LB_20571:
	bts r12,0
LB_20572:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20567
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_20536 ⊢ %_20537 : %_20537
 ; {>  %_20536~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_20537
 ; {>  %_20537~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20565
	btr r12,3
	jmp LB_20566
LB_20565:
	bts r12,3
LB_20566:
	mov r8,0
	bts r12,2
	ret
LB_20567:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20569
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20568
LB_20569:
	add rsp,8
	ret
LB_20570:
	add rsp,16
	pop r14
LB_20568:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20579:
NS_E_RDI_20579:
NS_E_20579_ETR_TBL:
NS_E_20579_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ word ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_20588:
	jmp LB_20585
LB_20584:
	add r14,1
LB_20585:
	cmp r14,r10
	jge LB_20586
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_20584
	cmp al,10
	jz LB_20584
	cmp al,32
	jz LB_20584
LB_20586:
	push r10
	push rsi
	call NS_E_20403_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_20587
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_20589
	bts QWORD [rax],0
LB_20589:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_20588
LB_20587:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20582
	btr QWORD [rdi],0
LB_20582:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_20581:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20676:
NS_E_RDI_20676:
NS_E_20676_ETR_TBL:
NS_E_20676_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_20778
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_20778
	jmp LB_20779
LB_20778:
	jmp LB_20770
LB_20779:
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
	jc LB_20771
	btr r12,0
	jmp LB_20772
LB_20771:
	bts r12,0
LB_20772:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20767
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_20680 : %_20680
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_20680
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_20680 ⊢ %_20681 : %_20681
 ; {>  %_20680~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20681
 ; {>  %_20681~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20765
	btr r12,3
	jmp LB_20766
LB_20765:
	bts r12,3
LB_20766:
	mov r8,0
	bts r12,2
	ret
LB_20767:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20769
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20768
LB_20769:
	add rsp,8
	ret
LB_20770:
	add rsp,16
	pop r14
LB_20768:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_19962_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20794
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20786
LB_20794:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_20676_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20799
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20800
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20800:
	jmp LB_20786
LB_20799:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_20789
	btr r12,1
	jmp LB_20790
LB_20789:
	bts r12,1
LB_20790:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20787
	btr r12,0
	jmp LB_20788
LB_20787:
	bts r12,0
LB_20788:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_20783
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f42 %_20683 ⊢ %_20684 : %_20684
 ; {>  %_20683~1':_r64 %_20682~0':_r64 }
	add r14,1
; _some %_20684 ⊢ %_20685 : %_20685
 ; {>  %_20684~1':_r64 %_20682~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_20685
 ; {>  %_20682~0':_r64 %_20685~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_20780
	mov rdi,r13
	call dlt
LB_20780:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_20781
	btr r12,3
	jmp LB_20782
LB_20781:
	bts r12,3
LB_20782:
	mov r8,0
	bts r12,2
	ret
LB_20783:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20785
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20784
LB_20785:
	add rsp,8
	ret
LB_20786:
	add rsp,32
	pop r14
LB_20784:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20677:
NS_E_RDI_20677:
NS_E_20677_ETR_TBL:
NS_E_20677_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; " "
	add r14,1
	cmp r14,r10
	jg LB_20815
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_20815
	jmp LB_20816
LB_20815:
	jmp LB_20807
LB_20816:
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
	jc LB_20808
	btr r12,0
	jmp LB_20809
LB_20808:
	bts r12,0
LB_20809:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20804
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_20686 : %_20686
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_20686
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_20686 ⊢ %_20687 : %_20687
 ; {>  %_20686~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20687
 ; {>  %_20687~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20802
	btr r12,3
	jmp LB_20803
LB_20802:
	bts r12,3
LB_20803:
	mov r8,0
	bts r12,2
	ret
LB_20804:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20806
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20805
LB_20806:
	add rsp,8
	ret
LB_20807:
	add rsp,16
	pop r14
LB_20805:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_20830
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_20830
	jmp LB_20831
LB_20830:
	jmp LB_20822
LB_20831:
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
	jc LB_20823
	btr r12,0
	jmp LB_20824
LB_20823:
	bts r12,0
LB_20824:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_20819
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_20688 : %_20688
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_20688
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_20688 ⊢ %_20689 : %_20689
 ; {>  %_20688~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20689
 ; {>  %_20689~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20817
	btr r12,3
	jmp LB_20818
LB_20817:
	bts r12,3
LB_20818:
	mov r8,0
	bts r12,2
	ret
LB_20819:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20821
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20820
LB_20821:
	add rsp,8
	ret
LB_20822:
	add rsp,16
	pop r14
LB_20820:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_20834
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_20690 : %_20690
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_20690
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_20690 ⊢ %_20691 : %_20691
 ; {>  %_20690~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20691
 ; {>  %_20691~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_20832
	btr r12,3
	jmp LB_20833
LB_20832:
	bts r12,3
LB_20833:
	mov r8,0
	bts r12,2
	ret
LB_20834:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20836
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20835
LB_20836:
	add rsp,8
	ret
LB_20837:
	add rsp,0
	pop r14
LB_20835:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20678:
NS_E_RDI_20678:
NS_E_20678_ETR_TBL:
NS_E_20678_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_20677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20880
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20864
LB_20880:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_20888
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_20888
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_20888
	jmp LB_20889
LB_20888:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20886
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20886:
	jmp LB_20864
LB_20889:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_20677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20893
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_20894
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_20894:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20895
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20895:
	jmp LB_20864
LB_20893:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_20905
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_20905
	jmp LB_20906
LB_20905:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_20901
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_20901:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_20902
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_20902:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20903
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20903:
	jmp LB_20864
LB_20906:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_20679_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20910
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_20911
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_20911:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_20912
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_20912:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_20913
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_20913:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20914
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20914:
	jmp LB_20864
LB_20910:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_20678_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20919
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_20920
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_20920:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_20921
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_20921:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_20922
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_20922:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_20923
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_20923:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20924
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20924:
	jmp LB_20864
LB_20919:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_20875
	btr r12,5
	jmp LB_20876
LB_20875:
	bts r12,5
LB_20876:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_20873
	btr r12,4
	jmp LB_20874
LB_20873:
	bts r12,4
LB_20874:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_20871
	btr r12,3
	jmp LB_20872
LB_20871:
	bts r12,3
LB_20872:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_20869
	btr r12,2
	jmp LB_20870
LB_20869:
	bts r12,2
LB_20870:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_20867
	btr r12,1
	jmp LB_20868
LB_20867:
	bts r12,1
LB_20868:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20865
	btr r12,0
	jmp LB_20866
LB_20865:
	bts r12,0
LB_20866:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_20861
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_20926
	btr r12,6
	jmp LB_20927
LB_20926:
	bts r12,6
LB_20927:
	mov r8,r10
	bt r12,4
	jc LB_20928
	btr r12,2
	jmp LB_20929
LB_20928:
	bts r12,2
LB_20929:
	mov rdx,r14
	bt r12,1
	jc LB_20930
	btr r12,7
	jmp LB_20931
LB_20930:
	bts r12,7
LB_20931:
	mov r14,rcx
	bt r12,6
	jc LB_20932
	btr r12,1
	jmp LB_20933
LB_20932:
	bts r12,1
LB_20933:
	mov rcx,r9
	bt r12,3
	jc LB_20934
	btr r12,6
	jmp LB_20935
LB_20934:
	bts r12,6
LB_20935:
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_20938
	btr r12,8
	jmp LB_20939
LB_20938:
	bts r12,8
LB_20939:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_20936
	btr r12,3
	jmp LB_20937
LB_20936:
	bts r12,3
LB_20937:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_20942
	btr r12,8
	jmp LB_20943
LB_20942:
	bts r12,8
LB_20943:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_20940
	btr r12,4
	jmp LB_20941
LB_20940:
	bts r12,4
LB_20941:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_20697 : %_20697
 ; {>  %_20696~4':(_lst)◂(_p20673) %_20695~3':_r64 %_20694~2':_r64 %_20692~0':_r64 %_20693~1':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_20697
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f37 { %_20697 %_20692 } ⊢ { %_20698 %_20699 } : { %_20698 %_20699 }
 ; {>  %_20696~4':(_lst)◂(_p20673) %_20697~5':_r64 %_20695~3':_r64 %_20694~2':_r64 %_20692~0':_r64 %_20693~1':_r64 }
	add r11,r13
; _f37 { %_20698 %_20693 } ⊢ { %_20700 %_20701 } : { %_20700 %_20701 }
 ; {>  %_20699~0':_r64 %_20696~4':(_lst)◂(_p20673) %_20698~5':_r64 %_20695~3':_r64 %_20694~2':_r64 %_20693~1':_r64 }
	add r11,r14
; _f37 { %_20700 %_20694 } ⊢ { %_20702 %_20703 } : { %_20702 %_20703 }
 ; {>  %_20699~0':_r64 %_20696~4':(_lst)◂(_p20673) %_20701~1':_r64 %_20695~3':_r64 %_20694~2':_r64 %_20700~5':_r64 }
	add r11,r8
; _f20674 %_20702 ⊢ %_20704 : %_20704
 ; {>  %_20699~0':_r64 %_20696~4':(_lst)◂(_p20673) %_20703~2':_r64 %_20702~5':_r64 %_20701~1':_r64 %_20695~3':_r64 }
; _f20674 5' ⊢ °0◂5'
; _cns { %_20704 %_20696 } ⊢ %_20705 : %_20705
 ; {>  %_20699~0':_r64 %_20704~°0◂5':_p20673 %_20696~4':(_lst)◂(_p20673) %_20703~2':_r64 %_20701~1':_r64 %_20695~3':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_20695 %_20705 } ⊢ %_20706 : %_20706
 ; {>  %_20699~0':_r64 %_20705~°0◂{ °0◂5' 4' }:(_lst)◂(_p20673) %_20703~2':_r64 %_20701~1':_r64 %_20695~3':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_20706
 ; {>  %_20699~0':_r64 %_20703~2':_r64 %_20701~1':_r64 %_20706~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p20673) }) }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,0
	jc LB_20838
	mov rdi,r13
	call dlt
LB_20838:
	bt r12,2
	jc LB_20839
	mov rdi,r8
	call dlt
LB_20839:
	bt r12,1
	jc LB_20840
	mov rdi,r14
	call dlt
LB_20840:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_20841
	btr r12,0
	jmp LB_20842
LB_20841:
	bts r12,0
LB_20842:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_20845
	btr r12,1
	jmp LB_20846
LB_20845:
	bts r12,1
LB_20846:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_20843
	btr QWORD [rdi],0
	jmp LB_20844
LB_20843:
	bts QWORD [rdi],0
LB_20844:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_20855
	btr r12,0
	jmp LB_20856
LB_20855:
	bts r12,0
LB_20856:
	mov rsi,1
	bt r12,0
	jc LB_20853
	mov rsi,0
	bt r13,0
	jc LB_20853
	jmp LB_20854
LB_20853:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_20854:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_20851
	btr QWORD [rdi],0
	jmp LB_20852
LB_20851:
	bts QWORD [rdi],0
LB_20852:
	mov r13,r10
	bt r12,4
	jc LB_20859
	btr r12,0
	jmp LB_20860
LB_20859:
	bts r12,0
LB_20860:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_20857
	btr QWORD [rdi],1
	jmp LB_20858
LB_20857:
	bts QWORD [rdi],1
LB_20858:
	mov rsi,1
	bt r12,1
	jc LB_20849
	mov rsi,0
	bt r14,0
	jc LB_20849
	jmp LB_20850
LB_20849:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_20850:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_20847
	btr QWORD [rdi],1
	jmp LB_20848
LB_20847:
	bts QWORD [rdi],1
LB_20848:
	mov r8,0
	bts r12,2
	ret
LB_20861:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20863
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20862
LB_20863:
	add rsp,8
	ret
LB_20864:
	add rsp,96
	pop r14
LB_20862:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_20677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20981
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20969
LB_20981:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_20989
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_20989
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_20989
	jmp LB_20990
LB_20989:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20987
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20987:
	jmp LB_20969
LB_20990:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_20676_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_20994
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_20995
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_20995:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_20996
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_20996:
	jmp LB_20969
LB_20994:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_20678_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21001
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_21002
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_21002:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21003
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21003:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21004
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21004:
	jmp LB_20969
LB_21001:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_20976
	btr r12,3
	jmp LB_20977
LB_20976:
	bts r12,3
LB_20977:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_20974
	btr r12,2
	jmp LB_20975
LB_20974:
	bts r12,2
LB_20975:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_20972
	btr r12,1
	jmp LB_20973
LB_20972:
	bts r12,1
LB_20973:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_20970
	btr r12,0
	jmp LB_20971
LB_20970:
	bts r12,0
LB_20971:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_20966
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_21006
	btr r12,4
	jmp LB_21007
LB_21006:
	bts r12,4
LB_21007:
	mov r14,r8
	bt r12,2
	jc LB_21008
	btr r12,1
	jmp LB_21009
LB_21008:
	bts r12,1
LB_21009:
	mov r11,r9
	bt r12,3
	jc LB_21010
	btr r12,5
	jmp LB_21011
LB_21010:
	bts r12,5
LB_21011:
; 5' ⊢ { 2' 3' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_21014
	btr r12,6
	jmp LB_21015
LB_21014:
	bts r12,6
LB_21015:
	mov r8,rcx
	bt r12,6
	jc LB_21012
	btr r12,2
	jmp LB_21013
LB_21012:
	bts r12,2
LB_21013:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_21018
	btr r12,6
	jmp LB_21019
LB_21018:
	bts r12,6
LB_21019:
	mov r9,rcx
	bt r12,6
	jc LB_21016
	btr r12,3
	jmp LB_21017
LB_21016:
	bts r12,3
LB_21017:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_20711 : %_20711
 ; {>  %_20707~0':_r64 %_20710~3':(_lst)◂(_p20673) %_20709~2':_r64 %_20708~1':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_20711
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f37 { %_20711 %_20707 } ⊢ { %_20712 %_20713 } : { %_20712 %_20713 }
 ; {>  %_20707~0':_r64 %_20711~4':_r64 %_20710~3':(_lst)◂(_p20673) %_20709~2':_r64 %_20708~1':_r64 }
	add r10,r13
; _f37 { %_20712 %_20708 } ⊢ { %_20714 %_20715 } : { %_20714 %_20715 }
 ; {>  %_20713~0':_r64 %_20712~4':_r64 %_20710~3':(_lst)◂(_p20673) %_20709~2':_r64 %_20708~1':_r64 }
	add r10,r14
; _f20674 %_20714 ⊢ %_20716 : %_20716
 ; {>  %_20713~0':_r64 %_20710~3':(_lst)◂(_p20673) %_20714~4':_r64 %_20709~2':_r64 %_20715~1':_r64 }
; _f20674 4' ⊢ °0◂4'
; _cns { %_20716 %_20710 } ⊢ %_20717 : %_20717
 ; {>  %_20713~0':_r64 %_20710~3':(_lst)◂(_p20673) %_20709~2':_r64 %_20716~°0◂4':_p20673 %_20715~1':_r64 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_20709 %_20717 } ⊢ %_20718 : %_20718
 ; {>  %_20713~0':_r64 %_20717~°0◂{ °0◂4' 3' }:(_lst)◂(_p20673) %_20709~2':_r64 %_20715~1':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_20718
 ; {>  %_20713~0':_r64 %_20718~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p20673) }) %_20715~1':_r64 }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,0
	jc LB_20944
	mov rdi,r13
	call dlt
LB_20944:
	bt r12,1
	jc LB_20945
	mov rdi,r14
	call dlt
LB_20945:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_20946
	btr r12,0
	jmp LB_20947
LB_20946:
	bts r12,0
LB_20947:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_20950
	btr r12,1
	jmp LB_20951
LB_20950:
	bts r12,1
LB_20951:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_20948
	btr QWORD [rdi],0
	jmp LB_20949
LB_20948:
	bts QWORD [rdi],0
LB_20949:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_20960
	btr r12,2
	jmp LB_20961
LB_20960:
	bts r12,2
LB_20961:
	mov rsi,1
	bt r12,2
	jc LB_20958
	mov rsi,0
	bt r8,0
	jc LB_20958
	jmp LB_20959
LB_20958:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_20959:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_20956
	btr QWORD [rdi],0
	jmp LB_20957
LB_20956:
	bts QWORD [rdi],0
LB_20957:
	mov r8,r13
	bt r12,0
	jc LB_20964
	btr r12,2
	jmp LB_20965
LB_20964:
	bts r12,2
LB_20965:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_20962
	btr QWORD [rdi],1
	jmp LB_20963
LB_20962:
	bts QWORD [rdi],1
LB_20963:
	mov rsi,1
	bt r12,1
	jc LB_20954
	mov rsi,0
	bt r14,0
	jc LB_20954
	jmp LB_20955
LB_20954:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_20955:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_20952
	btr QWORD [rdi],1
	jmp LB_20953
LB_20952:
	bts QWORD [rdi],1
LB_20953:
	mov r8,0
	bts r12,2
	ret
LB_20966:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_20968
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_20967
LB_20968:
	add rsp,8
	ret
LB_20969:
	add rsp,64
	pop r14
LB_20967:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_20676_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21091
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21083
LB_21091:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_20678_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21096
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21097
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21097:
	jmp LB_21083
LB_21096:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21086
	btr r12,1
	jmp LB_21087
LB_21086:
	bts r12,1
LB_21087:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21084
	btr r12,0
	jmp LB_21085
LB_21084:
	bts r12,0
LB_21085:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_21080
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_21099
	btr r12,3
	jmp LB_21100
LB_21099:
	bts r12,3
LB_21100:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_21103
	btr r12,4
	jmp LB_21104
LB_21103:
	bts r12,4
LB_21104:
	mov r14,r10
	bt r12,4
	jc LB_21101
	btr r12,1
	jmp LB_21102
LB_21101:
	bts r12,1
LB_21102:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_21107
	btr r12,4
	jmp LB_21108
LB_21107:
	bts r12,4
LB_21108:
	mov r8,r10
	bt r12,4
	jc LB_21105
	btr r12,2
	jmp LB_21106
LB_21105:
	bts r12,2
LB_21106:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f37 { %_20720 %_20719 } ⊢ { %_20722 %_20723 } : { %_20722 %_20723 }
 ; {>  %_20720~1':_r64 %_20719~0':_r64 %_20721~2':(_lst)◂(_p20673) }
	add r14,r13
MTC_LB_21020:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21021
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_21022
	bt QWORD [rax],0
	jc LB_21023
	btr r12,5
	jmp LB_21024
LB_21023:
	bts r12,5
LB_21024:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_21022:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_21027
	btr r12,6
	jmp LB_21028
LB_21027:
	bts r12,6
LB_21028:
	mov r9,rcx
	bt r12,6
	jc LB_21025
	btr r12,3
	jmp LB_21026
LB_21025:
	bts r12,3
LB_21026:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_21031
	btr r12,6
	jmp LB_21032
LB_21031:
	bts r12,6
LB_21032:
	mov r10,rcx
	bt r12,6
	jc LB_21029
	btr r12,4
	jmp LB_21030
LB_21029:
	bts r12,4
LB_21030:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21021
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
; 3' ⊢ °1◂5'
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r9
	bt QWORD [rax],17
	jnc LB_21033
	bt QWORD [rax],0
	jc LB_21034
	btr r12,6
	jmp LB_21035
LB_21034:
	bts r12,6
LB_21035:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_21033:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_21036
	btr r12,5
	jmp LB_21037
LB_21036:
	bts r12,5
LB_21037:
LB_21038:
	cmp r15,0
	jz LB_21039
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21038
LB_21039:
; _f37 { %_20726 %_20723 } ⊢ { %_20727 %_20728 } : { %_20727 %_20728 }
 ; {>  %_20726~5':_r64 %_20725~4':(_lst)◂(_p20673) %_20723~0':_r64 %_20722~1':_r64 }
	add r11,r13
; _f20675 %_20727 ⊢ %_20729 : %_20729
 ; {>  %_20725~4':(_lst)◂(_p20673) %_20727~5':_r64 %_20728~0':_r64 %_20722~1':_r64 }
; _f20675 5' ⊢ °1◂5'
; _cns { %_20729 %_20725 } ⊢ %_20730 : %_20730
 ; {>  %_20725~4':(_lst)◂(_p20673) %_20728~0':_r64 %_20729~°1◂5':_p20673 %_20722~1':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_20722 %_20730 } ⊢ %_20731 : %_20731
 ; {>  %_20730~°0◂{ °1◂5' 4' }:(_lst)◂(_p20673) %_20728~0':_r64 %_20722~1':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_20731
 ; {>  %_20728~0':_r64 %_20731~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p20673) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_21040
	mov rdi,r13
	call dlt
LB_21040:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_21043
	btr r12,0
	jmp LB_21044
LB_21043:
	bts r12,0
LB_21044:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_21041
	btr QWORD [rdi],0
	jmp LB_21042
LB_21041:
	bts QWORD [rdi],0
LB_21042:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_21053
	btr r12,1
	jmp LB_21054
LB_21053:
	bts r12,1
LB_21054:
	mov rsi,1
	bt r12,1
	jc LB_21051
	mov rsi,0
	bt r14,0
	jc LB_21051
	jmp LB_21052
LB_21051:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_21052:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_21049
	btr QWORD [rdi],0
	jmp LB_21050
LB_21049:
	bts QWORD [rdi],0
LB_21050:
	mov r14,r10
	bt r12,4
	jc LB_21057
	btr r12,1
	jmp LB_21058
LB_21057:
	bts r12,1
LB_21058:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_21055
	btr QWORD [rdi],1
	jmp LB_21056
LB_21055:
	bts QWORD [rdi],1
LB_21056:
	mov rsi,1
	bt r12,0
	jc LB_21047
	mov rsi,0
	bt r13,0
	jc LB_21047
	jmp LB_21048
LB_21047:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_21048:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_21045
	btr QWORD [rdi],1
	jmp LB_21046
LB_21045:
	bts QWORD [rdi],1
LB_21046:
	mov r8,0
	bts r12,2
	ret
MTC_LB_21021:
	mov r15,0
LB_21060:
	cmp r15,0
	jz LB_21061
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21060
LB_21061:
; _f20675 %_20723 ⊢ %_20732 : %_20732
 ; {>  %_20723~0':_r64 %_20721~2':(_lst)◂(_p20673) %_20722~1':_r64 }
; _f20675 0' ⊢ °1◂0'
; _cns { %_20732 %_20721 } ⊢ %_20733 : %_20733
 ; {>  %_20732~°1◂0':_p20673 %_20721~2':(_lst)◂(_p20673) %_20722~1':_r64 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_20722 %_20733 } ⊢ %_20734 : %_20734
 ; {>  %_20733~°0◂{ °1◂0' 2' }:(_lst)◂(_p20673) %_20722~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_20734
 ; {>  %_20734~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p20673) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂0' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 1' °0◂{ °1◂0' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_21064
	btr r12,4
	jmp LB_21065
LB_21064:
	bts r12,4
LB_21065:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_21062
	btr QWORD [rdi],0
	jmp LB_21063
LB_21062:
	bts QWORD [rdi],0
LB_21063:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_21074
	btr r12,1
	jmp LB_21075
LB_21074:
	bts r12,1
LB_21075:
	mov rsi,1
	bt r12,1
	jc LB_21072
	mov rsi,0
	bt r14,0
	jc LB_21072
	jmp LB_21073
LB_21072:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_21073:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_21070
	btr QWORD [rdi],0
	jmp LB_21071
LB_21070:
	bts QWORD [rdi],0
LB_21071:
	mov r14,r8
	bt r12,2
	jc LB_21078
	btr r12,1
	jmp LB_21079
LB_21078:
	bts r12,1
LB_21079:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_21076
	btr QWORD [rdi],1
	jmp LB_21077
LB_21076:
	bts QWORD [rdi],1
LB_21077:
	mov rsi,1
	bt r12,4
	jc LB_21068
	mov rsi,0
	bt r10,0
	jc LB_21068
	jmp LB_21069
LB_21068:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_21069:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_21066
	btr QWORD [rdi],1
	jmp LB_21067
LB_21066:
	bts QWORD [rdi],1
LB_21067:
	mov r8,0
	bts r12,2
	ret
MTC_LB_21059:
LB_21080:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21082
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21081
LB_21082:
	add rsp,8
	ret
LB_21083:
	add rsp,32
	pop r14
LB_21081:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_21117
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_20735 : %_20735
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_20736 : %_20736
 ; {>  %_20735~°1◂{  }:(_lst)◂(t3755'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_20736
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_20736 %_20735 } ⊢ %_20737 : %_20737
 ; {>  %_20735~°1◂{  }:(_lst)◂(t3755'(0)) %_20736~0':_r64 }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_20737
 ; {>  %_20737~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t3759'(0)) }) }
; 	∎ °0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_21111
	btr r12,1
	jmp LB_21112
LB_21111:
	bts r12,1
LB_21112:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_21109
	btr QWORD [rdi],0
	jmp LB_21110
LB_21109:
	bts QWORD [rdi],0
LB_21110:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_21115
	mov rsi,0
	bt r14,0
	jc LB_21115
	jmp LB_21116
LB_21115:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_21116:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_21113
	btr QWORD [rdi],1
	jmp LB_21114
LB_21113:
	bts QWORD [rdi],1
LB_21114:
	mov r8,0
	bts r12,2
	ret
LB_21117:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21119
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21118
LB_21119:
	add rsp,8
	ret
LB_21120:
	add rsp,0
	pop r14
LB_21118:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_20679:
NS_E_RDI_20679:
NS_E_20679_ETR_TBL:
NS_E_20679_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_20677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21140
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21128
LB_21140:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_21148
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_21148
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_21148
	jmp LB_21149
LB_21148:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21146
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21146:
	jmp LB_21128
LB_21149:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_20677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21153
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21154
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21154:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21155
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21155:
	jmp LB_21128
LB_21153:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_21165
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_21165
	jmp LB_21166
LB_21165:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_21161
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_21161:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21162
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21162:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21163
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21163:
	jmp LB_21128
LB_21166:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_21135
	btr r12,3
	jmp LB_21136
LB_21135:
	bts r12,3
LB_21136:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_21133
	btr r12,2
	jmp LB_21134
LB_21133:
	bts r12,2
LB_21134:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21131
	btr r12,1
	jmp LB_21132
LB_21131:
	bts r12,1
LB_21132:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21129
	btr r12,0
	jmp LB_21130
LB_21129:
	bts r12,0
LB_21130:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_21125
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_21167
	btr r12,4
	jmp LB_21168
LB_21167:
	bts r12,4
LB_21168:
	mov r14,r8
	bt r12,2
	jc LB_21169
	btr r12,1
	jmp LB_21170
LB_21169:
	bts r12,1
LB_21170:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_20740 : %_20740
 ; {>  %_20739~1':_r64 %_20738~0':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_20740
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f37 { %_20740 %_20738 } ⊢ { %_20741 %_20742 } : { %_20741 %_20742 }
 ; {>  %_20740~2':_r64 %_20739~1':_r64 %_20738~0':_r64 }
	add r8,r13
; _f37 { %_20741 %_20739 } ⊢ { %_20743 %_20744 } : { %_20743 %_20744 }
 ; {>  %_20742~0':_r64 %_20739~1':_r64 %_20741~2':_r64 }
	add r8,r14
; _some %_20743 ⊢ %_20745 : %_20745
 ; {>  %_20742~0':_r64 %_20744~1':_r64 %_20743~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_20745
 ; {>  %_20745~°0◂2':(_opn)◂(_r64) %_20742~0':_r64 %_20744~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_21121
	mov rdi,r13
	call dlt
LB_21121:
	bt r12,1
	jc LB_21122
	mov rdi,r14
	call dlt
LB_21122:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_21123
	btr r12,3
	jmp LB_21124
LB_21123:
	bts r12,3
LB_21124:
	mov r8,0
	bts r12,2
	ret
LB_21125:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21127
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21126
LB_21127:
	add rsp,8
	ret
LB_21128:
	add rsp,64
	pop r14
LB_21126:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_20677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21196
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21180
LB_21196:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_21204
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_21204
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_21204
	jmp LB_21205
LB_21204:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21202
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21202:
	jmp LB_21180
LB_21205:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_20677_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21209
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21210
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21210:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21211
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21211:
	jmp LB_21180
LB_21209:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_21221
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_21221
	jmp LB_21222
LB_21221:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_21217
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_21217:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21218
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21218:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21219
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21219:
	jmp LB_21180
LB_21222:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_20679_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21226
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_21227
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_21227:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_21228
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_21228:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21229
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21229:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21230
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21230:
	jmp LB_21180
LB_21226:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_20679_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21235
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_21236
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_21236:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_21237
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_21237:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_21238
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_21238:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21239
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21239:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21240
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21240:
	jmp LB_21180
LB_21235:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_21191
	btr r12,5
	jmp LB_21192
LB_21191:
	bts r12,5
LB_21192:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_21189
	btr r12,4
	jmp LB_21190
LB_21189:
	bts r12,4
LB_21190:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_21187
	btr r12,3
	jmp LB_21188
LB_21187:
	bts r12,3
LB_21188:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_21185
	btr r12,2
	jmp LB_21186
LB_21185:
	bts r12,2
LB_21186:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21183
	btr r12,1
	jmp LB_21184
LB_21183:
	bts r12,1
LB_21184:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21181
	btr r12,0
	jmp LB_21182
LB_21181:
	bts r12,0
LB_21182:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_21177
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_21242
	btr r12,6
	jmp LB_21243
LB_21242:
	bts r12,6
LB_21243:
	mov r9,r11
	bt r12,5
	jc LB_21244
	btr r12,3
	jmp LB_21245
LB_21244:
	bts r12,3
LB_21245:
	mov r11,r8
	bt r12,2
	jc LB_21246
	btr r12,5
	jmp LB_21247
LB_21246:
	bts r12,5
LB_21247:
	mov r8,r10
	bt r12,4
	jc LB_21248
	btr r12,2
	jmp LB_21249
LB_21248:
	bts r12,2
LB_21249:
	mov r10,r14
	bt r12,1
	jc LB_21250
	btr r12,4
	jmp LB_21251
LB_21250:
	bts r12,4
LB_21251:
	mov r14,r11
	bt r12,5
	jc LB_21252
	btr r12,1
	jmp LB_21253
LB_21252:
	bts r12,1
LB_21253:
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_20750 : %_20750
 ; {>  %_20748~2':_r64 %_20747~1':_r64 %_20746~0':_r64 %_20749~3':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_20750
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f37 { %_20750 %_20746 } ⊢ { %_20751 %_20752 } : { %_20751 %_20752 }
 ; {>  %_20748~2':_r64 %_20750~4':_r64 %_20747~1':_r64 %_20746~0':_r64 %_20749~3':_r64 }
	add r10,r13
; _f37 { %_20751 %_20747 } ⊢ { %_20753 %_20754 } : { %_20753 %_20754 }
 ; {>  %_20752~0':_r64 %_20748~2':_r64 %_20751~4':_r64 %_20747~1':_r64 %_20749~3':_r64 }
	add r10,r14
; _f37 { %_20753 %_20748 } ⊢ { %_20755 %_20756 } : { %_20755 %_20756 }
 ; {>  %_20752~0':_r64 %_20748~2':_r64 %_20753~4':_r64 %_20749~3':_r64 %_20754~1':_r64 }
	add r10,r8
; _f37 { %_20755 %_20749 } ⊢ { %_20757 %_20758 } : { %_20757 %_20758 }
 ; {>  %_20752~0':_r64 %_20749~3':_r64 %_20755~4':_r64 %_20756~2':_r64 %_20754~1':_r64 }
	add r10,r9
; _some %_20757 ⊢ %_20759 : %_20759
 ; {>  %_20757~4':_r64 %_20752~0':_r64 %_20758~3':_r64 %_20756~2':_r64 %_20754~1':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_20759
 ; {>  %_20752~0':_r64 %_20758~3':_r64 %_20759~°0◂4':(_opn)◂(_r64) %_20756~2':_r64 %_20754~1':_r64 }
; 	∎ °0◂4'
	bt r12,0
	jc LB_21171
	mov rdi,r13
	call dlt
LB_21171:
	bt r12,3
	jc LB_21172
	mov rdi,r9
	call dlt
LB_21172:
	bt r12,2
	jc LB_21173
	mov rdi,r8
	call dlt
LB_21173:
	bt r12,1
	jc LB_21174
	mov rdi,r14
	call dlt
LB_21174:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_21175
	btr r12,3
	jmp LB_21176
LB_21175:
	bts r12,3
LB_21176:
	mov r8,0
	bts r12,2
	ret
LB_21177:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21179
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21178
LB_21179:
	add rsp,8
	ret
LB_21180:
	add rsp,96
	pop r14
LB_21178:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_20676_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21268
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21260
LB_21268:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_20679_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21273
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21274
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21274:
	jmp LB_21260
LB_21273:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21263
	btr r12,1
	jmp LB_21264
LB_21263:
	bts r12,1
LB_21264:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21261
	btr r12,0
	jmp LB_21262
LB_21261:
	bts r12,0
LB_21262:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_21257
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f37 { %_20760 %_20761 } ⊢ { %_20762 %_20763 } : { %_20762 %_20763 }
 ; {>  %_20760~0':_r64 %_20761~1':_r64 }
	add r13,r14
; _some %_20762 ⊢ %_20764 : %_20764
 ; {>  %_20762~0':_r64 %_20763~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_20764
 ; {>  %_20764~°0◂0':(_opn)◂(_r64) %_20763~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_21254
	mov rdi,r14
	call dlt
LB_21254:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_21255
	btr r12,3
	jmp LB_21256
LB_21255:
	bts r12,3
LB_21256:
	mov r8,0
	bts r12,2
	ret
LB_21257:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_21259
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21258
LB_21259:
	add rsp,8
	ret
LB_21260:
	add rsp,32
	pop r14
LB_21258:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21298:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_21298:
MTC_LB_21299:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21300
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r10
	bt QWORD [rax],17
	jnc LB_21301
	bt QWORD [rax],0
	jc LB_21302
	btr r12,7
	jmp LB_21303
LB_21302:
	bts r12,7
LB_21303:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_21301:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_21306
	btr r12,8
	jmp LB_21307
LB_21306:
	bts r12,8
LB_21307:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_21304
	btr r12,5
	jmp LB_21305
LB_21304:
	bts r12,5
LB_21305:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_21310
	btr r12,8
	jmp LB_21311
LB_21310:
	bts r12,8
LB_21311:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_21308
	btr r12,6
	jmp LB_21309
LB_21308:
	bts r12,6
LB_21309:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21312:
	cmp r15,0
	jz LB_21313
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21312
LB_21313:
MTC_LB_21314:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_21315
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °1◂4'
; 5' ⊢ °1◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_21316
	bt QWORD [rax],0
	jc LB_21317
	btr r12,7
	jmp LB_21318
LB_21317:
	bts r12,7
LB_21318:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_21316:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_21319
	btr r12,4
	jmp LB_21320
LB_21319:
	bts r12,4
LB_21320:
LB_21321:
	cmp r15,0
	jz LB_21322
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21321
LB_21322:
; _f39 %_21283 ⊢ { %_21284 %_21285 } : { %_21284 %_21285 }
 ; {>  %_21282~6':(_lst)◂(_p20673) %_21278~2':_stg %_21276~0':_stg %_21283~4':_r64 %_21277~1':_r64 %_21279~3':_r64 }
	mov r11,r10
	bts r12,5
; _f21 { %_21285 %_21276 %_21277 %_21278 %_21279 } ⊢ { %_21286 %_21287 %_21288 %_21289 %_21290 } : { %_21286 %_21287 %_21288 %_21289 %_21290 }
 ; {>  %_21282~6':(_lst)◂(_p20673) %_21284~4':_r64 %_21285~5':_r64 %_21278~2':_stg %_21276~0':_stg %_21277~1':_r64 %_21279~3':_r64 }
; _f21 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_21327
	btr r12,4
	jmp LB_21328
LB_21327:
	bts r12,4
LB_21328:
	mov r9,r8
	bt r12,2
	jc LB_21329
	btr r12,3
	jmp LB_21330
LB_21329:
	bts r12,3
LB_21330:
	mov r8,r14
	bt r12,1
	jc LB_21331
	btr r12,2
	jmp LB_21332
LB_21331:
	bts r12,2
LB_21332:
	mov r14,r13
	bt r12,0
	jc LB_21333
	btr r12,1
	jmp LB_21334
LB_21333:
	bts r12,1
LB_21334:
	mov r13,r11
	bt r12,5
	jc LB_21335
	btr r12,0
	jmp LB_21336
LB_21335:
	bts r12,0
LB_21336:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_21337
	btr r12,5
	jmp LB_21338
LB_21337:
	bts r12,5
LB_21338:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_21325
	btr r12,6
	jmp LB_21326
LB_21325:
	bts r12,6
LB_21326:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_21323
	btr r12,4
	jmp LB_21324
LB_21323:
	bts r12,4
LB_21324:
	add rsp,24
; _f21298 { %_21287 %_21288 %_21289 %_21290 %_21282 } ⊢ { %_21291 %_21292 } : { %_21291 %_21292 }
 ; {>  %_21282~6':(_lst)◂(_p20673) %_21284~4':_r64 %_21288~2':_r64 %_21289~3':_stg %_21287~1':_stg %_21286~0':_r64 %_21290~5':_r64 }
; _f21298 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_21343
	btr r12,0
	jmp LB_21344
LB_21343:
	bts r12,0
LB_21344:
	mov r14,r8
	bt r12,2
	jc LB_21345
	btr r12,1
	jmp LB_21346
LB_21345:
	bts r12,1
LB_21346:
	mov r8,r9
	bt r12,3
	jc LB_21347
	btr r12,2
	jmp LB_21348
LB_21347:
	bts r12,2
LB_21348:
	mov r9,r11
	bt r12,5
	jc LB_21349
	btr r12,3
	jmp LB_21350
LB_21349:
	bts r12,3
LB_21350:
	mov r10,rcx
	bt r12,6
	jc LB_21351
	btr r12,4
	jmp LB_21352
LB_21351:
	bts r12,4
LB_21352:
	call NS_E_21298
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_21353
	btr r12,2
	jmp LB_21354
LB_21353:
	bts r12,2
LB_21354:
	mov r14,r13
	bt r12,0
	jc LB_21355
	btr r12,1
	jmp LB_21356
LB_21355:
	bts r12,1
LB_21356:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_21341
	btr r12,4
	jmp LB_21342
LB_21341:
	bts r12,4
LB_21342:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21339
	btr r12,0
	jmp LB_21340
LB_21339:
	bts r12,0
LB_21340:
	add rsp,24
; ∎ { %_21291 %_21292 }
 ; {>  %_21284~4':_r64 %_21292~2':_stg %_21286~0':_r64 %_21291~1':_stg }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_21357
	mov rdi,r10
	call dlt
LB_21357:
	bt r12,0
	jc LB_21358
	mov rdi,r13
	call dlt
LB_21358:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_21359
	btr r12,0
	jmp LB_21360
LB_21359:
	bts r12,0
LB_21360:
	mov r14,r8
	bt r12,2
	jc LB_21361
	btr r12,1
	jmp LB_21362
LB_21361:
	bts r12,1
LB_21362:
	ret
MTC_LB_21315:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21363
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °0◂4'
; 5' ⊢ °0◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_21364
	bt QWORD [rax],0
	jc LB_21365
	btr r12,7
	jmp LB_21366
LB_21365:
	bts r12,7
LB_21366:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_21364:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_21367
	btr r12,4
	jmp LB_21368
LB_21367:
	bts r12,4
LB_21368:
LB_21369:
	cmp r15,0
	jz LB_21370
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21369
LB_21370:
; _f37 { %_21277 %_21293 } ⊢ { %_21294 %_21295 } : { %_21294 %_21295 }
 ; {>  %_21282~6':(_lst)◂(_p20673) %_21293~4':_r64 %_21278~2':_stg %_21276~0':_stg %_21277~1':_r64 %_21279~3':_r64 }
	add r14,r10
; _f21298 { %_21276 %_21294 %_21278 %_21279 %_21282 } ⊢ { %_21296 %_21297 } : { %_21296 %_21297 }
 ; {>  %_21282~6':(_lst)◂(_p20673) %_21294~1':_r64 %_21278~2':_stg %_21295~4':_r64 %_21276~0':_stg %_21279~3':_r64 }
; _f21298 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_21373
	btr r12,4
	jmp LB_21374
LB_21373:
	bts r12,4
LB_21374:
	call NS_E_21298
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_21371
	btr r12,4
	jmp LB_21372
LB_21371:
	bts r12,4
LB_21372:
	add rsp,16
; ∎ { %_21296 %_21297 }
 ; {>  %_21297~1':_stg %_21295~4':_r64 %_21296~0':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_21375
	mov rdi,r10
	call dlt
LB_21375:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_21363:
MTC_LB_21300:
	mov r15,0
LB_21377:
	cmp r15,0
	jz LB_21378
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21377
LB_21378:
; ∎ { %_21276 %_21278 }
 ; {>  %_21280~4':(_lst)◂(_p20673) %_21278~2':_stg %_21276~0':_stg %_21277~1':_r64 %_21279~3':_r64 }
; 	∎ { 0' 2' }
	bt r12,4
	jc LB_21379
	mov rdi,r10
	call dlt
LB_21379:
	bt r12,1
	jc LB_21380
	mov rdi,r14
	call dlt
LB_21380:
	bt r12,3
	jc LB_21381
	mov rdi,r9
	call dlt
LB_21381:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_21382
	btr r12,1
	jmp LB_21383
LB_21382:
	bts r12,1
LB_21383:
	ret
MTC_LB_21376:
NS_E_21399:
; 	|» 0'
NS_E_RDI_21399:
; » 0xr0 |~ {  } ⊢ %_21385 : %_21385
 ; {>  %_21384~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_21385
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f20678 { %_21384 %_21385 } ⊢ { %_21386 %_21387 %_21388 } : { %_21386 %_21387 %_21388 }
 ; {>  %_21384~0':_stg %_21385~1':_r64 }
; _f20678 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_20678
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_21400
	btr r12,4
	jmp LB_21401
LB_21400:
	bts r12,4
LB_21401:
	mov r8,r9
	bt r12,3
	jc LB_21404
	btr r12,2
	jmp LB_21405
LB_21404:
	bts r12,2
LB_21405:
	mov rsi,1
	bt r12,2
	jc LB_21402
	mov rsi,0
	bt r8,0
	jc LB_21402
	jmp LB_21403
LB_21402:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_21403:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_21406:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_21407
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_21408
	bt QWORD [rax],0
	jc LB_21409
	btr r12,5
	jmp LB_21410
LB_21409:
	bts r12,5
LB_21410:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_21408:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_21413
	btr r12,6
	jmp LB_21414
LB_21413:
	bts r12,6
LB_21414:
	mov r9,rcx
	bt r12,6
	jc LB_21411
	btr r12,3
	jmp LB_21412
LB_21411:
	bts r12,3
LB_21412:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_21417
	btr r12,6
	jmp LB_21418
LB_21417:
	bts r12,6
LB_21418:
	mov r10,rcx
	bt r12,6
	jc LB_21415
	btr r12,4
	jmp LB_21416
LB_21415:
	bts r12,4
LB_21416:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_21419:
	cmp r15,0
	jz LB_21420
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21419
LB_21420:
; _f17 %_21389 ⊢ { %_21391 %_21392 } : { %_21391 %_21392 }
 ; {>  %_21390~4':(_lst)◂(_p20673) %_21387~1':_r64 %_21389~3':_r64 %_21386~0':_stg }
; _f17 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_21427
	btr r12,0
	jmp LB_21428
LB_21427:
	bts r12,0
LB_21428:
	call NS_E_17
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_21429
	btr r12,2
	jmp LB_21430
LB_21429:
	bts r12,2
LB_21430:
	mov r9,r14
	bt r12,1
	jc LB_21431
	btr r12,3
	jmp LB_21432
LB_21431:
	bts r12,3
LB_21432:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_21425
	btr r12,4
	jmp LB_21426
LB_21425:
	bts r12,4
LB_21426:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_21423
	btr r12,1
	jmp LB_21424
LB_21423:
	bts r12,1
LB_21424:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_21421
	btr r12,0
	jmp LB_21422
LB_21421:
	bts r12,0
LB_21422:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_21393 : %_21393
 ; {>  %_21390~4':(_lst)◂(_p20673) %_21387~1':_r64 %_21386~0':_stg %_21392~3':_stg %_21391~2':_r64 }
; 	» 0xr0 _ ⊢ 5' : %_21393
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_21394 : %_21394
 ; {>  %_21390~4':(_lst)◂(_p20673) %_21387~1':_r64 %_21386~0':_stg %_21393~5':_r64 %_21392~3':_stg %_21391~2':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_21394
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f21298 { %_21386 %_21393 %_21392 %_21394 %_21390 } ⊢ { %_21395 %_21396 } : { %_21395 %_21396 }
 ; {>  %_21390~4':(_lst)◂(_p20673) %_21394~6':_r64 %_21387~1':_r64 %_21386~0':_stg %_21393~5':_r64 %_21392~3':_stg %_21391~2':_r64 }
; _f21298 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_21437
	btr r12,1
	jmp LB_21438
LB_21437:
	bts r12,1
LB_21438:
	mov r8,r9
	bt r12,3
	jc LB_21439
	btr r12,2
	jmp LB_21440
LB_21439:
	bts r12,2
LB_21440:
	mov r9,rcx
	bt r12,6
	jc LB_21441
	btr r12,3
	jmp LB_21442
LB_21441:
	bts r12,3
LB_21442:
	call NS_E_21298
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_21443
	btr r12,3
	jmp LB_21444
LB_21443:
	bts r12,3
LB_21444:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_21435
	btr r12,2
	jmp LB_21436
LB_21435:
	bts r12,2
LB_21436:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_21433
	btr r12,1
	jmp LB_21434
LB_21433:
	bts r12,1
LB_21434:
	add rsp,24
; _some %_21396 ⊢ %_21397 : %_21397
 ; {>  %_21395~0':_stg %_21387~1':_r64 %_21396~3':_stg %_21391~2':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_21395 %_21397 }
 ; {>  %_21395~0':_stg %_21387~1':_r64 %_21397~°0◂3':(_opn)◂(_stg) %_21391~2':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,1
	jc LB_21445
	mov rdi,r14
	call dlt
LB_21445:
	bt r12,2
	jc LB_21446
	mov rdi,r8
	call dlt
LB_21446:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_21449
	btr r12,1
	jmp LB_21450
LB_21449:
	bts r12,1
LB_21450:
	mov rsi,1
	bt r12,1
	jc LB_21447
	mov rsi,0
	bt r14,0
	jc LB_21447
	jmp LB_21448
LB_21447:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_21448:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_21407:
	mov r15,0
LB_21452:
	cmp r15,0
	jz LB_21453
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_21452
LB_21453:
; _none {  } ⊢ %_21398 : %_21398
 ; {>  %_21387~1':_r64 %_21386~0':_stg %_21388~2':(_opn)◂({ _r64 (_lst)◂(_p20673) }) }
; _none {  } ⊢ °1◂{  }
; ∎ { %_21386 %_21398 }
 ; {>  %_21398~°1◂{  }:(_opn)◂(t3941'(0)) %_21387~1':_r64 %_21386~0':_stg %_21388~2':(_opn)◂({ _r64 (_lst)◂(_p20673) }) }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_21454
	mov rdi,r14
	call dlt
LB_21454:
	bt r12,2
	jc LB_21455
	mov rdi,r8
	call dlt
LB_21455:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_21456
	mov rsi,0
	bt r14,0
	jc LB_21456
	jmp LB_21457
LB_21456:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_21457:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_21451:
NS_E_21461:
NS_E_RDI_21461:
; » _^ ..
	mov rax,70
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "## FEFEF \n"
	mov rsi,0x_46_45_46_45_46_20_23_23
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "HELLO \n"
	mov rsi,0x_48
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_45
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_4c
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_4c
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_4f
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\\[ \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "fdEF \n"
	mov rsi,0x_66
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_64
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_45
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_46
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; "\\[ \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "F fe \n"
	mov rsi,0x_46
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_65
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; "\\] \n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "\\]\n"
	mov rsi,0x_5c
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; "WORlD \n"
	mov rsi,0x_57
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_4f
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_52
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_6c
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_44
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "## huugugugu\t\t\t\t\t\t\n"
	mov rsi,0x_75_67_75_75_68_20_23_23
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09_09_09_09_75_67_75_67
	mov QWORD [rdi+8*1],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*2+0],sil
	mov rsi,0x_09
	mov BYTE [rdi+8*2+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*2+2],sil
	add rdi,19
; //
	mov r13,rax
	btr r12,0
; _f21399 %_21458 ⊢ { %_21459 %_21460 } : { %_21459 %_21460 }
 ; {>  %_21458~0':_stg }
; _f21399 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_21399
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_21460~1':(_opn)◂(_stg) %_21459~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_21462
	mov rdi,r14
	call dlt
LB_21462:
	bt r12,0
	jc LB_21463
	mov rdi,r13
	call dlt
LB_21463:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_21465:
NS_E_RDI_21465:
NS_E_21465_ETR_TBL:
NS_E_21465_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	jmp LB_21482
LB_21481:
	add r14,1
LB_21482:
	cmp r14,r10
	jge LB_21483
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21481
	cmp al,10
	jz LB_21481
	cmp al,32
	jz LB_21481
LB_21483:
	push r10
	call NS_E_20532_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21484
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21468
LB_21484:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_21487
LB_21486:
	add r14,1
LB_21487:
	cmp r14,r10
	jge LB_21488
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21486
	cmp al,10
	jz LB_21486
	cmp al,32
	jz LB_21486
LB_21488:
	add r14,1
	cmp r14,r10
	jg LB_21492
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_21492
	jmp LB_21493
LB_21492:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21490
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21490:
	jmp LB_21468
LB_21493:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_21495
LB_21494:
	add r14,1
LB_21495:
	cmp r14,r10
	jge LB_21496
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21494
	cmp al,10
	jz LB_21494
	cmp al,32
	jz LB_21494
LB_21496:
	push r10
	call NS_E_21465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21497
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21498
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21498:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21499
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21499:
	jmp LB_21468
LB_21497:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_21477
	btr QWORD [rdi],2
LB_21477:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21478
	btr QWORD [rdi],1
LB_21478:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21479
	btr QWORD [rdi],0
LB_21479:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21468:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_21473
LB_21472:
	add r14,1
LB_21473:
	cmp r14,r10
	jge LB_21474
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21472
	cmp al,32
	jz LB_21472
LB_21474:
	push r10
	call NS_E_20532_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21475
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21469
LB_21475:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21470
	btr QWORD [rdi],0
LB_21470:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21469:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21502:
NS_E_RDI_21502:
NS_E_21502_ETR_TBL:
NS_E_21502_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_19964_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21529
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21506
LB_21529:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_21537
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_21537
	jmp LB_21538
LB_21537:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21535
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21535:
	jmp LB_21506
LB_21538:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21523
	btr QWORD [rdi],1
LB_21523:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21524
	btr QWORD [rdi],0
LB_21524:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21506:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_20035_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21521
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21507
LB_21521:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21516
	btr QWORD [rdi],0
LB_21516:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21507:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_21465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21514
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21508
LB_21514:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21509
	btr QWORD [rdi],0
LB_21509:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21508:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21540:
NS_E_RDI_21540:
NS_E_21540_ETR_TBL:
NS_E_21540_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_21547
LB_21546:
	add r14,1
LB_21547:
	cmp r14,r10
	jge LB_21548
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21546
	cmp al,32
	jz LB_21546
LB_21548:
	add r14,1
	cmp r14,r10
	jg LB_21551
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_21551
	jmp LB_21552
LB_21551:
	jmp LB_21542
LB_21552:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ "\n" ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_21557:
	jmp LB_21554
LB_21553:
	add r14,1
LB_21554:
	cmp r14,r10
	jge LB_21555
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21553
	cmp al,32
	jz LB_21553
LB_21555:
	add r14,1
	cmp r14,r10
	jg LB_21556
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_21556
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov [rax+8*1],rsi
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_21557
LB_21556:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21543
	btr QWORD [rdi],1
LB_21543:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21544
	btr QWORD [rdi],0
LB_21544:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21542:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21559:
NS_E_RDI_21559:
NS_E_21559_ETR_TBL:
NS_E_21559_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ⟦ glb_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_21750:
	jmp LB_21747
LB_21746:
	add r14,1
LB_21747:
	cmp r14,r10
	jge LB_21748
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21746
	cmp al,10
	jz LB_21746
	cmp al,32
	jz LB_21746
LB_21748:
	push r10
	push rsi
	call NS_E_21561_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_21749
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_21751
	bts QWORD [rax],0
LB_21751:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_21750
LB_21749:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21744
	btr QWORD [rdi],0
LB_21744:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21743:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21561:
NS_E_RDI_21561:
NS_E_21561_ETR_TBL:
NS_E_21561_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167+s8"
	jmp LB_22061
LB_22060:
	add r14,1
LB_22061:
	cmp r14,r10
	jge LB_22062
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22060
	cmp al,10
	jz LB_22060
	cmp al,32
	jz LB_22060
LB_22062:
	add r14,7
	cmp r14,r10
	jg LB_22065
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_22065
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_22065
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_22065
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_22065
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_22065
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_22065
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_22065
	jmp LB_22066
LB_22065:
	jmp LB_21752
LB_22066:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr
	jmp LB_22049
LB_22048:
	add r14,1
LB_22049:
	cmp r14,r10
	jge LB_22050
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22048
	cmp al,10
	jz LB_22048
	cmp al,32
	jz LB_22048
LB_22050:
	push r10
	call NS_E_21613_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22051
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22052
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22052:
	jmp LB_21753
LB_22051:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_22058:
	jmp LB_22055
LB_22054:
	add r14,1
LB_22055:
	cmp r14,r10
	jge LB_22056
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22054
	cmp al,10
	jz LB_22054
	cmp al,32
	jz LB_22054
LB_22056:
	push r10
	push rsi
	call NS_E_21613_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_22057
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_22059
	bts QWORD [rax],0
LB_22059:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_22058
LB_22057:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22044
	btr QWORD [rdi],2
LB_22044:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22045
	btr QWORD [rdi],1
LB_22045:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22046
	btr QWORD [rdi],0
LB_22046:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21753:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_21752:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167\194\167"
	jmp LB_22038
LB_22037:
	add r14,1
LB_22038:
	cmp r14,r10
	jge LB_22039
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22037
	cmp al,10
	jz LB_22037
	cmp al,32
	jz LB_22037
LB_22039:
	add r14,4
	cmp r14,r10
	jg LB_22042
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_22042
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_22042
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_22042
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_22042
	jmp LB_22043
LB_22042:
	jmp LB_21754
LB_22043:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_22032
LB_22031:
	add r14,1
LB_22032:
	cmp r14,r10
	jge LB_22033
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22031
	cmp al,10
	jz LB_22031
	cmp al,32
	jz LB_22031
LB_22033:
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22034
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22035
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22035:
	jmp LB_21755
LB_22034:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_21785
LB_21784:
	add r14,1
LB_21785:
	cmp r14,r10
	jge LB_21786
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21784
	cmp al,10
	jz LB_21784
	cmp al,32
	jz LB_21784
LB_21786:
	add r14,1
	cmp r14,r10
	jg LB_21789
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_21789
	jmp LB_21790
LB_21789:
	jmp LB_21756
LB_21790:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_21779
LB_21778:
	add r14,1
LB_21779:
	cmp r14,r10
	jge LB_21780
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21778
	cmp al,10
	jz LB_21778
	cmp al,32
	jz LB_21778
LB_21780:
	push r10
	call NS_E_21465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21781
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21782
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21782:
	jmp LB_21757
LB_21781:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21772
	btr QWORD [rdi],1
LB_21772:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21773
	btr QWORD [rdi],0
LB_21773:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21775
	btr QWORD [rdi],1
LB_21775:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21776
	btr QWORD [rdi],0
LB_21776:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21757:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21769
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21769:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21770
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21770:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_21756:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_21765
LB_21764:
	add r14,1
LB_21765:
	cmp r14,r10
	jge LB_21766
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21764
	cmp al,10
	jz LB_21764
	cmp al,32
	jz LB_21764
LB_21766:
	push r10
	call NS_E_21563_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21767
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21758
LB_21767:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21759
	btr QWORD [rdi],0
LB_21759:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21761
	btr QWORD [rdi],1
LB_21761:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21762
	btr QWORD [rdi],0
LB_21762:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21758:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22028
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22028:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22029
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22029:
LB_21755:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_21754:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\167"
	jmp LB_22022
LB_22021:
	add r14,1
LB_22022:
	cmp r14,r10
	jge LB_22023
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22021
	cmp al,10
	jz LB_22021
	cmp al,32
	jz LB_22021
LB_22023:
	add r14,2
	cmp r14,r10
	jg LB_22026
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_22026
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_22026
	jmp LB_22027
LB_22026:
	jmp LB_21791
LB_22027:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "@"
	jmp LB_21924
LB_21923:
	add r14,1
LB_21924:
	cmp r14,r10
	jge LB_21925
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21923
	cmp al,10
	jz LB_21923
	cmp al,32
	jz LB_21923
LB_21925:
	add r14,1
	cmp r14,r10
	jg LB_21928
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_21928
	jmp LB_21929
LB_21928:
	jmp LB_21793
LB_21929:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_21886
LB_21885:
	add r14,1
LB_21886:
	cmp r14,r10
	jge LB_21887
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21885
	cmp al,10
	jz LB_21885
	cmp al,32
	jz LB_21885
LB_21887:
	add r14,1
	cmp r14,r10
	jg LB_21891
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_21891
	jmp LB_21892
LB_21891:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21889
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21889:
	jmp LB_21794
LB_21892:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_21894
LB_21893:
	add r14,1
LB_21894:
	cmp r14,r10
	jge LB_21895
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21893
	cmp al,10
	jz LB_21893
	cmp al,32
	jz LB_21893
LB_21895:
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21896
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21897
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21897:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21898
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21898:
	jmp LB_21794
LB_21896:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_21901
LB_21900:
	add r14,1
LB_21901:
	cmp r14,r10
	jge LB_21902
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21900
	cmp al,10
	jz LB_21900
	cmp al,32
	jz LB_21900
LB_21902:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21903
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_21904
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_21904:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21905
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21905:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21906
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21906:
	jmp LB_21794
LB_21903:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_21909
LB_21908:
	add r14,1
LB_21909:
	cmp r14,r10
	jge LB_21910
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21908
	cmp al,10
	jz LB_21908
	cmp al,32
	jz LB_21908
LB_21910:
	push r10
	call NS_E_21569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21911
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_21912
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_21912:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_21913
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_21913:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21914
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21914:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21915
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21915:
	jmp LB_21794
LB_21911:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; ⟦ qlq_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_21921:
	jmp LB_21918
LB_21917:
	add r14,1
LB_21918:
	cmp r14,r10
	jge LB_21919
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21917
	cmp al,10
	jz LB_21917
	cmp al,32
	jz LB_21917
LB_21919:
	push r10
	push rsi
	call NS_E_21565_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_21920
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_21922
	bts QWORD [rax],0
LB_21922:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_21921
LB_21920:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0006_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_21876
	btr QWORD [rdi],5
LB_21876:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_21877
	btr QWORD [rdi],4
LB_21877:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_21878
	btr QWORD [rdi],3
LB_21878:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_21879
	btr QWORD [rdi],2
LB_21879:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21880
	btr QWORD [rdi],1
LB_21880:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21881
	btr QWORD [rdi],0
LB_21881:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,104
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21883
	btr QWORD [rdi],0
LB_21883:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21794:
	add rsp,96
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21874
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21874:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_21793:
	add rsp,96
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_21870
LB_21869:
	add r14,1
LB_21870:
	cmp r14,r10
	jge LB_21871
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21869
	cmp al,10
	jz LB_21869
	cmp al,32
	jz LB_21869
LB_21871:
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21872
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21795
LB_21872:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_21861
LB_21860:
	add r14,1
LB_21861:
	cmp r14,r10
	jge LB_21862
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21860
	cmp al,10
	jz LB_21860
	cmp al,32
	jz LB_21860
LB_21862:
	add r14,1
	cmp r14,r10
	jg LB_21865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_21865
	jmp LB_21866
LB_21865:
	jmp LB_21796
LB_21866:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_21855
LB_21854:
	add r14,1
LB_21855:
	cmp r14,r10
	jge LB_21856
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21854
	cmp al,10
	jz LB_21854
	cmp al,32
	jz LB_21854
LB_21856:
	push r10
	call NS_E_21502_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21857
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21858
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21858:
	jmp LB_21797
LB_21857:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21847
	btr QWORD [rdi],1
LB_21847:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21848
	btr QWORD [rdi],0
LB_21848:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21852
	btr QWORD [rdi],0
LB_21852:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21850
	btr QWORD [rdi],0
LB_21850:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21797:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21845
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21845:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21843
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21843:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_21796:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_21837
LB_21836:
	add r14,1
LB_21837:
	cmp r14,r10
	jge LB_21838
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21836
	cmp al,10
	jz LB_21836
	cmp al,32
	jz LB_21836
LB_21838:
	add r14,2
	cmp r14,r10
	jg LB_21841
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_21841
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_21841
	jmp LB_21842
LB_21841:
	jmp LB_21798
LB_21842:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_21831
LB_21830:
	add r14,1
LB_21831:
	cmp r14,r10
	jge LB_21832
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21830
	cmp al,10
	jz LB_21830
	cmp al,32
	jz LB_21830
LB_21832:
	push r10
	call NS_E_21569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21833
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21834
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21834:
	jmp LB_21799
LB_21833:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21823
	btr QWORD [rdi],1
LB_21823:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21824
	btr QWORD [rdi],0
LB_21824:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21828
	btr QWORD [rdi],0
LB_21828:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21826
	btr QWORD [rdi],0
LB_21826:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21799:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21821
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21821:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21819
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21819:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_21798:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg_ptn
	jmp LB_21809
LB_21808:
	add r14,1
LB_21809:
	cmp r14,r10
	jge LB_21810
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21808
	cmp al,10
	jz LB_21808
	cmp al,32
	jz LB_21808
LB_21810:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21811
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21800
LB_21811:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_21814
LB_21813:
	add r14,1
LB_21814:
	cmp r14,r10
	jge LB_21815
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21813
	cmp al,10
	jz LB_21813
	cmp al,32
	jz LB_21813
LB_21815:
	push r10
	call NS_E_21569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21816
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21817
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21817:
	jmp LB_21800
LB_21816:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21801
	btr QWORD [rdi],1
LB_21801:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21802
	btr QWORD [rdi],0
LB_21802:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21806
	btr QWORD [rdi],0
LB_21806:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21804
	btr QWORD [rdi],0
LB_21804:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21800:
	add rsp,32
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21867
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21867:
LB_21795:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22019
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22019:
LB_21792:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_21791:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\182"
	jmp LB_22013
LB_22012:
	add r14,1
LB_22013:
	cmp r14,r10
	jge LB_22014
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22012
	cmp al,10
	jz LB_22012
	cmp al,32
	jz LB_22012
LB_22014:
	add r14,2
	cmp r14,r10
	jg LB_22017
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_22017
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_22017
	jmp LB_22018
LB_22017:
	jmp LB_21930
LB_22018:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_22004
LB_22003:
	add r14,1
LB_22004:
	cmp r14,r10
	jge LB_22005
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22003
	cmp al,10
	jz LB_22003
	cmp al,32
	jz LB_22003
LB_22005:
	add r14,1
	cmp r14,r10
	jg LB_22008
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_22008
	jmp LB_22009
LB_22008:
	jmp LB_21931
LB_22009:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_21983
LB_21982:
	add r14,1
LB_21983:
	cmp r14,r10
	jge LB_21984
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21982
	cmp al,10
	jz LB_21982
	cmp al,32
	jz LB_21982
LB_21984:
	add r14,1
	cmp r14,r10
	jg LB_21988
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_21988
	jmp LB_21989
LB_21988:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21986
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21986:
	jmp LB_21932
LB_21989:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_21991
LB_21990:
	add r14,1
LB_21991:
	cmp r14,r10
	jge LB_21992
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21990
	cmp al,10
	jz LB_21990
	cmp al,32
	jz LB_21990
LB_21992:
	push r10
	call NS_E_21599_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21993
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21994
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21994:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21995
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21995:
	jmp LB_21932
LB_21993:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; ⟦ qlq_dt_etr ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_22001:
	jmp LB_21998
LB_21997:
	add r14,1
LB_21998:
	cmp r14,r10
	jge LB_21999
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21997
	cmp al,10
	jz LB_21997
	cmp al,32
	jz LB_21997
LB_21999:
	push r10
	push rsi
	call NS_E_21601_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_22000
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_22002
	bts QWORD [rax],0
LB_22002:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_22001
LB_22000:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_21975
	btr QWORD [rdi],3
LB_21975:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_21976
	btr QWORD [rdi],2
LB_21976:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21977
	btr QWORD [rdi],1
LB_21977:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21978
	btr QWORD [rdi],0
LB_21978:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21980
	btr QWORD [rdi],0
LB_21980:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21932:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21973
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21973:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_21931:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_21961
LB_21960:
	add r14,1
LB_21961:
	cmp r14,r10
	jge LB_21962
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21960
	cmp al,10
	jz LB_21960
	cmp al,32
	jz LB_21960
LB_21962:
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21963
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21933
LB_21963:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_21966
LB_21965:
	add r14,1
LB_21966:
	cmp r14,r10
	jge LB_21967
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21965
	cmp al,10
	jz LB_21965
	cmp al,32
	jz LB_21965
LB_21967:
	add r14,1
	cmp r14,r10
	jg LB_21971
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_21971
	jmp LB_21972
LB_21971:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21969
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21969:
	jmp LB_21933
LB_21972:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_21954
LB_21953:
	add r14,1
LB_21954:
	cmp r14,r10
	jge LB_21955
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21953
	cmp al,10
	jz LB_21953
	cmp al,32
	jz LB_21953
LB_21955:
	push r10
	call NS_E_21465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21956
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_21957
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_21957:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21958
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21958:
	jmp LB_21934
LB_21956:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_21947
	btr QWORD [rdi],2
LB_21947:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_21948
	btr QWORD [rdi],1
LB_21948:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21949
	btr QWORD [rdi],0
LB_21949:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21951
	btr QWORD [rdi],0
LB_21951:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21934:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_21945
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_21945:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_21933:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_21941
LB_21940:
	add r14,1
LB_21941:
	cmp r14,r10
	jge LB_21942
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_21940
	cmp al,10
	jz LB_21940
	cmp al,32
	jz LB_21940
LB_21942:
	push r10
	call NS_E_21599_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_21943
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_21935
LB_21943:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21936
	btr QWORD [rdi],0
LB_21936:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_21938
	btr QWORD [rdi],0
LB_21938:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_21935:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22010
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22010:
LB_21930:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21563:
NS_E_RDI_21563:
NS_E_21563_ETR_TBL:
NS_E_21563_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_22086
LB_22085:
	add r14,1
LB_22086:
	cmp r14,r10
	jge LB_22087
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22085
	cmp al,10
	jz LB_22085
	cmp al,32
	jz LB_22085
LB_22087:
	add r14,6
	cmp r14,r10
	jg LB_22090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_22090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_22090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_22090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_22090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_22090
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_22090
	jmp LB_22091
LB_22090:
	jmp LB_22067
LB_22091:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22083
	btr QWORD [rdi],0
LB_22083:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22067:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_22073
LB_22072:
	add r14,1
LB_22073:
	cmp r14,r10
	jge LB_22074
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22072
	cmp al,10
	jz LB_22072
	cmp al,32
	jz LB_22072
LB_22074:
	push r10
	call NS_E_21561_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22075
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22068
LB_22075:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_22078
LB_22077:
	add r14,1
LB_22078:
	cmp r14,r10
	jge LB_22079
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22077
	cmp al,10
	jz LB_22077
	cmp al,32
	jz LB_22077
LB_22079:
	push r10
	call NS_E_21563_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22080
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22081
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22081:
	jmp LB_22068
LB_22080:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22069
	btr QWORD [rdi],1
LB_22069:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22070
	btr QWORD [rdi],0
LB_22070:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22068:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21565:
NS_E_RDI_21565:
NS_E_21565_ETR_TBL:
NS_E_21565_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "@"
	jmp LB_22100
LB_22099:
	add r14,1
LB_22100:
	cmp r14,r10
	jge LB_22101
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22099
	cmp al,10
	jz LB_22099
	cmp al,32
	jz LB_22099
LB_22101:
	add r14,1
	cmp r14,r10
	jg LB_22104
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_22104
	jmp LB_22105
LB_22104:
	jmp LB_22092
LB_22105:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_22107
LB_22106:
	add r14,1
LB_22107:
	cmp r14,r10
	jge LB_22108
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22106
	cmp al,10
	jz LB_22106
	cmp al,32
	jz LB_22106
LB_22108:
	add r14,1
	cmp r14,r10
	jg LB_22112
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_22112
	jmp LB_22113
LB_22112:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22110
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22110:
	jmp LB_22092
LB_22113:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_22115
LB_22114:
	add r14,1
LB_22115:
	cmp r14,r10
	jge LB_22116
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22114
	cmp al,10
	jz LB_22114
	cmp al,32
	jz LB_22114
LB_22116:
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22117
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22118
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22118:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22119
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22119:
	jmp LB_22092
LB_22117:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; reg_ptn
	jmp LB_22122
LB_22121:
	add r14,1
LB_22122:
	cmp r14,r10
	jge LB_22123
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22121
	cmp al,10
	jz LB_22121
	cmp al,32
	jz LB_22121
LB_22123:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22124
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22125
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22125:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22126
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22126:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22127
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22127:
	jmp LB_22092
LB_22124:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_22130
LB_22129:
	add r14,1
LB_22130:
	cmp r14,r10
	jge LB_22131
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22129
	cmp al,10
	jz LB_22129
	cmp al,32
	jz LB_22129
LB_22131:
	push r10
	call NS_E_21569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22132
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_22133
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_22133:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22134
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22134:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22135
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22135:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22136
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22136:
	jmp LB_22092
LB_22132:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_22093
	btr QWORD [rdi],4
LB_22093:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_22094
	btr QWORD [rdi],3
LB_22094:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22095
	btr QWORD [rdi],2
LB_22095:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22096
	btr QWORD [rdi],1
LB_22096:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22097
	btr QWORD [rdi],0
LB_22097:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22092:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21567:
NS_E_RDI_21567:
NS_E_21567_ETR_TBL:
NS_E_21567_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_22144
LB_22143:
	add r14,1
LB_22144:
	cmp r14,r10
	jge LB_22145
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22143
	cmp al,10
	jz LB_22143
	cmp al,32
	jz LB_22143
LB_22145:
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22146
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22138
LB_22146:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_22149
LB_22148:
	add r14,1
LB_22149:
	cmp r14,r10
	jge LB_22150
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22148
	cmp al,10
	jz LB_22148
	cmp al,32
	jz LB_22148
LB_22150:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22151
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22152
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22152:
	jmp LB_22138
LB_22151:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_22155
LB_22154:
	add r14,1
LB_22155:
	cmp r14,r10
	jge LB_22156
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22154
	cmp al,10
	jz LB_22154
	cmp al,32
	jz LB_22154
LB_22156:
	push r10
	call NS_E_21569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22157
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22158
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22158:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22159
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22159:
	jmp LB_22138
LB_22157:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22139
	btr QWORD [rdi],2
LB_22139:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22140
	btr QWORD [rdi],1
LB_22140:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22141
	btr QWORD [rdi],0
LB_22141:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22138:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21569:
NS_E_RDI_21569:
NS_E_21569_ETR_TBL:
NS_E_21569_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_22189
LB_22188:
	add r14,1
LB_22189:
	cmp r14,r10
	jge LB_22190
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22188
	cmp al,10
	jz LB_22188
	cmp al,32
	jz LB_22188
LB_22190:
	add r14,3
	cmp r14,r10
	jg LB_22193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_22193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_22193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_22193
	jmp LB_22194
LB_22193:
	jmp LB_22161
LB_22194:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_22196
LB_22195:
	add r14,1
LB_22196:
	cmp r14,r10
	jge LB_22197
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22195
	cmp al,10
	jz LB_22195
	cmp al,32
	jz LB_22195
LB_22197:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22198
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22199
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22199:
	jmp LB_22161
LB_22198:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22185
	btr QWORD [rdi],1
LB_22185:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22186
	btr QWORD [rdi],0
LB_22186:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22161:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_22181
LB_22180:
	add r14,1
LB_22181:
	cmp r14,r10
	jge LB_22182
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22180
	cmp al,10
	jz LB_22180
	cmp al,32
	jz LB_22180
LB_22182:
	push r10
	call NS_E_21583_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22183
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22162
LB_22183:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22178
	btr QWORD [rdi],0
LB_22178:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22162:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; lc_line
	jmp LB_22168
LB_22167:
	add r14,1
LB_22168:
	cmp r14,r10
	jge LB_22169
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22167
	cmp al,10
	jz LB_22167
	cmp al,32
	jz LB_22167
LB_22169:
	push r10
	call NS_E_21571_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22170
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22163
LB_22170:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_22173
LB_22172:
	add r14,1
LB_22173:
	cmp r14,r10
	jge LB_22174
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22172
	cmp al,10
	jz LB_22172
	cmp al,32
	jz LB_22172
LB_22174:
	push r10
	call NS_E_21569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22175
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22176
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22176:
	jmp LB_22163
LB_22175:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22164
	btr QWORD [rdi],1
LB_22164:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22165
	btr QWORD [rdi],0
LB_22165:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22163:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21571:
NS_E_RDI_21571:
NS_E_21571_ETR_TBL:
NS_E_21571_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "$"
	jmp LB_22486
LB_22485:
	add r14,1
LB_22486:
	cmp r14,r10
	jge LB_22487
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22485
	cmp al,10
	jz LB_22485
	cmp al,32
	jz LB_22485
LB_22487:
	add r14,1
	cmp r14,r10
	jg LB_22490
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_22490
	jmp LB_22491
LB_22490:
	jmp LB_22201
LB_22491:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_22463
LB_22462:
	add r14,1
LB_22463:
	cmp r14,r10
	jge LB_22464
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22462
	cmp al,10
	jz LB_22462
	cmp al,32
	jz LB_22462
LB_22464:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22465
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22466
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22466:
	jmp LB_22202
LB_22465:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_22469
LB_22468:
	add r14,1
LB_22469:
	cmp r14,r10
	jge LB_22470
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22468
	cmp al,10
	jz LB_22468
	cmp al,32
	jz LB_22468
LB_22470:
	add r14,3
	cmp r14,r10
	jg LB_22475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_22475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_22475
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_22475
	jmp LB_22476
LB_22475:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22472
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22472:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22473
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22473:
	jmp LB_22202
LB_22476:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_22478
LB_22477:
	add r14,1
LB_22478:
	cmp r14,r10
	jge LB_22479
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22477
	cmp al,10
	jz LB_22477
	cmp al,32
	jz LB_22477
LB_22479:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22480
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22481
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22481:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22482
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22482:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22483
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22483:
	jmp LB_22202
LB_22480:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_22457
	btr QWORD [rdi],3
LB_22457:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22458
	btr QWORD [rdi],2
LB_22458:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22459
	btr QWORD [rdi],1
LB_22459:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22460
	btr QWORD [rdi],0
LB_22460:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22202:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_22201:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\151\130"
	jmp LB_22451
LB_22450:
	add r14,1
LB_22451:
	cmp r14,r10
	jge LB_22452
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22450
	cmp al,10
	jz LB_22450
	cmp al,32
	jz LB_22450
LB_22452:
	add r14,3
	cmp r14,r10
	jg LB_22455
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_22455
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_22455
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_22455
	jmp LB_22456
LB_22455:
	jmp LB_22203
LB_22456:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_22428
LB_22427:
	add r14,1
LB_22428:
	cmp r14,r10
	jge LB_22429
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22427
	cmp al,10
	jz LB_22427
	cmp al,32
	jz LB_22427
LB_22429:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22430
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22431
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22431:
	jmp LB_22204
LB_22430:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_22434
LB_22433:
	add r14,1
LB_22434:
	cmp r14,r10
	jge LB_22435
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22433
	cmp al,10
	jz LB_22433
	cmp al,32
	jz LB_22433
LB_22435:
	add r14,3
	cmp r14,r10
	jg LB_22440
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_22440
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_22440
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_22440
	jmp LB_22441
LB_22440:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22437
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22437:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22438
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22438:
	jmp LB_22204
LB_22441:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_22443
LB_22442:
	add r14,1
LB_22443:
	cmp r14,r10
	jge LB_22444
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22442
	cmp al,10
	jz LB_22442
	cmp al,32
	jz LB_22442
LB_22444:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22445
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22446
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22446:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22447
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22447:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22448
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22448:
	jmp LB_22204
LB_22445:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_22422
	btr QWORD [rdi],3
LB_22422:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22423
	btr QWORD [rdi],2
LB_22423:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22424
	btr QWORD [rdi],1
LB_22424:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22425
	btr QWORD [rdi],0
LB_22425:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22204:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_22203:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\194\187"
	jmp LB_22416
LB_22415:
	add r14,1
LB_22416:
	cmp r14,r10
	jge LB_22417
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22415
	cmp al,10
	jz LB_22415
	cmp al,32
	jz LB_22415
LB_22417:
	add r14,2
	cmp r14,r10
	jg LB_22420
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_22420
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_22420
	jmp LB_22421
LB_22420:
	jmp LB_22205
LB_22421:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_^"
	jmp LB_22373
LB_22372:
	add r14,1
LB_22373:
	cmp r14,r10
	jge LB_22374
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22372
	cmp al,10
	jz LB_22372
	cmp al,32
	jz LB_22372
LB_22374:
	add r14,2
	cmp r14,r10
	jg LB_22377
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_22377
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_22377
	jmp LB_22378
LB_22377:
	jmp LB_22207
LB_22378:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "_"
	jmp LB_22324
LB_22323:
	add r14,1
LB_22324:
	cmp r14,r10
	jge LB_22325
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22323
	cmp al,10
	jz LB_22323
	cmp al,32
	jz LB_22323
LB_22325:
	add r14,1
	cmp r14,r10
	jg LB_22328
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_22328
	jmp LB_22329
LB_22328:
	jmp LB_22209
LB_22329:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_22292
LB_22291:
	add r14,1
LB_22292:
	cmp r14,r10
	jge LB_22293
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22291
	cmp al,10
	jz LB_22291
	cmp al,32
	jz LB_22291
LB_22293:
	add r14,3
	cmp r14,r10
	jg LB_22297
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_22297
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_22297
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_22297
	jmp LB_22298
LB_22297:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22295
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22295:
	jmp LB_22210
LB_22298:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg
	jmp LB_22300
LB_22299:
	add r14,1
LB_22300:
	cmp r14,r10
	jge LB_22301
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22299
	cmp al,10
	jz LB_22299
	cmp al,32
	jz LB_22299
LB_22301:
	push r10
	call NS_E_21597_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22302
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22303
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22303:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22304
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22304:
	jmp LB_22210
LB_22302:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_22310:
	jmp LB_22307
LB_22306:
	add r14,1
LB_22307:
	cmp r14,r10
	jge LB_22308
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22306
	cmp al,10
	jz LB_22306
	cmp al,32
	jz LB_22306
LB_22308:
	push r10
	push rsi
	call NS_E_21573_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_22309
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_22311
	bts QWORD [rax],0
LB_22311:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_22310
LB_22309:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rsi
; "//"
	jmp LB_22313
LB_22312:
	add r14,1
LB_22313:
	cmp r14,r10
	jge LB_22314
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22312
	cmp al,10
	jz LB_22312
	cmp al,32
	jz LB_22312
LB_22314:
	add r14,2
	cmp r14,r10
	jg LB_22321
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_22321
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_22321
	jmp LB_22322
LB_22321:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_22316
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_22316:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22317
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22317:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22318
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22318:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22319
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22319:
	jmp LB_22210
LB_22322:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_22281
	btr QWORD [rdi],4
LB_22281:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_22282
	btr QWORD [rdi],3
LB_22282:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22283
	btr QWORD [rdi],2
LB_22283:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22284
	btr QWORD [rdi],1
LB_22284:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22285
	btr QWORD [rdi],0
LB_22285:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22289
	btr QWORD [rdi],0
LB_22289:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22287
	btr QWORD [rdi],0
LB_22287:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22210:
	add rsp,80
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22279
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22279:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22277
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22277:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_22209:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,112
; reg
	jmp LB_22225
LB_22224:
	add r14,1
LB_22225:
	cmp r14,r10
	jge LB_22226
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22224
	cmp al,10
	jz LB_22224
	cmp al,32
	jz LB_22224
LB_22226:
	push r10
	call NS_E_21597_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22227
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22211
LB_22227:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ reg_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_22233:
	jmp LB_22230
LB_22229:
	add r14,1
LB_22230:
	cmp r14,r10
	jge LB_22231
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22229
	cmp al,10
	jz LB_22229
	cmp al,32
	jz LB_22229
LB_22231:
	push r10
	push rsi
	call NS_E_21581_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_22232
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_22234
	bts QWORD [rax],0
LB_22234:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_22233
LB_22232:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "\226\138\162"
	jmp LB_22236
LB_22235:
	add r14,1
LB_22236:
	cmp r14,r10
	jge LB_22237
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22235
	cmp al,10
	jz LB_22235
	cmp al,32
	jz LB_22235
LB_22237:
	add r14,3
	cmp r14,r10
	jg LB_22242
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_22242
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_22242
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_22242
	jmp LB_22243
LB_22242:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22239
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22239:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22240
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22240:
	jmp LB_22211
LB_22243:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg
	jmp LB_22245
LB_22244:
	add r14,1
LB_22245:
	cmp r14,r10
	jge LB_22246
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22244
	cmp al,10
	jz LB_22244
	cmp al,32
	jz LB_22244
LB_22246:
	push r10
	call NS_E_21597_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22247
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22248
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22248:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22249
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22249:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22250
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22250:
	jmp LB_22211
LB_22247:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ⟦ reg_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_22256:
	jmp LB_22253
LB_22252:
	add r14,1
LB_22253:
	cmp r14,r10
	jge LB_22254
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22252
	cmp al,10
	jz LB_22252
	cmp al,32
	jz LB_22252
LB_22254:
	push r10
	push rsi
	call NS_E_21581_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_22255
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_22257
	bts QWORD [rax],0
LB_22257:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_22256
LB_22255:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rsi
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_22262:
	jmp LB_22259
LB_22258:
	add r14,1
LB_22259:
	cmp r14,r10
	jge LB_22260
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22258
	cmp al,10
	jz LB_22258
	cmp al,32
	jz LB_22258
LB_22260:
	push r10
	push rsi
	call NS_E_21573_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_22261
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_22263
	bts QWORD [rax],0
LB_22263:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_22262
LB_22261:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
; "//"
	jmp LB_22265
LB_22264:
	add r14,1
LB_22265:
	cmp r14,r10
	jge LB_22266
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22264
	cmp al,10
	jz LB_22264
	cmp al,32
	jz LB_22264
LB_22266:
	add r14,2
	cmp r14,r10
	jg LB_22275
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_22275
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_22275
	jmp LB_22276
LB_22275:
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_22268
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_22268:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_22269
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_22269:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_22270
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_22270:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22271
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22271:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22272
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22272:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22273
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22273:
	jmp LB_22211
LB_22276:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*6],0
	mov QWORD [rsp+8*1+16*6],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0007_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_22212
	btr QWORD [rdi],6
LB_22212:
	mov rax,QWORD [rsp+16*6+8*1]
	mov [rdi+8*1+8*6],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_22213
	btr QWORD [rdi],5
LB_22213:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_22214
	btr QWORD [rdi],4
LB_22214:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_22215
	btr QWORD [rdi],3
LB_22215:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22216
	btr QWORD [rdi],2
LB_22216:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22217
	btr QWORD [rdi],1
LB_22217:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22218
	btr QWORD [rdi],0
LB_22218:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,120
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22222
	btr QWORD [rdi],0
LB_22222:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22220
	btr QWORD [rdi],0
LB_22220:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22211:
	add rsp,112
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22370
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22370:
LB_22208:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22368
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22368:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_22207:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; cst
	jmp LB_22339
LB_22338:
	add r14,1
LB_22339:
	cmp r14,r10
	jge LB_22340
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22338
	cmp al,10
	jz LB_22338
	cmp al,32
	jz LB_22338
LB_22340:
	push r10
	call NS_E_21502_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22341
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22330
LB_22341:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_22344
LB_22343:
	add r14,1
LB_22344:
	cmp r14,r10
	jge LB_22345
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22343
	cmp al,10
	jz LB_22343
	cmp al,32
	jz LB_22343
LB_22345:
	add r14,1
	cmp r14,r10
	jg LB_22349
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_22349
	jmp LB_22350
LB_22349:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22347
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22347:
	jmp LB_22330
LB_22350:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_22352
LB_22351:
	add r14,1
LB_22352:
	cmp r14,r10
	jge LB_22353
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22351
	cmp al,10
	jz LB_22351
	cmp al,32
	jz LB_22351
LB_22353:
	add r14,3
	cmp r14,r10
	jg LB_22358
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_22358
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_22358
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_22358
	jmp LB_22359
LB_22358:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22355
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22355:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22356
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22356:
	jmp LB_22330
LB_22359:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_22361
LB_22360:
	add r14,1
LB_22361:
	cmp r14,r10
	jge LB_22362
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22360
	cmp al,10
	jz LB_22360
	cmp al,32
	jz LB_22360
LB_22362:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22363
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22364
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22364:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22365
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22365:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22366
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22366:
	jmp LB_22330
LB_22363:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_22331
	btr QWORD [rdi],3
LB_22331:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22332
	btr QWORD [rdi],2
LB_22332:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22333
	btr QWORD [rdi],1
LB_22333:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22334
	btr QWORD [rdi],0
LB_22334:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22336
	btr QWORD [rdi],0
LB_22336:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22330:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22413
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22413:
LB_22206:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_22205:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_22386
LB_22385:
	add r14,1
LB_22386:
	cmp r14,r10
	jge LB_22387
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22385
	cmp al,10
	jz LB_22385
	cmp al,32
	jz LB_22385
LB_22387:
	push r10
	call NS_E_21465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22388
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22379
LB_22388:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_22391
LB_22390:
	add r14,1
LB_22391:
	cmp r14,r10
	jge LB_22392
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22390
	cmp al,10
	jz LB_22390
	cmp al,32
	jz LB_22390
LB_22392:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22393
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22394
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22394:
	jmp LB_22379
LB_22393:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_22397
LB_22396:
	add r14,1
LB_22397:
	cmp r14,r10
	jge LB_22398
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22396
	cmp al,10
	jz LB_22396
	cmp al,32
	jz LB_22396
LB_22398:
	add r14,3
	cmp r14,r10
	jg LB_22403
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_22403
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_22403
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_22403
	jmp LB_22404
LB_22403:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22400
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22400:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22401
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22401:
	jmp LB_22379
LB_22404:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_22406
LB_22405:
	add r14,1
LB_22406:
	cmp r14,r10
	jge LB_22407
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22405
	cmp al,10
	jz LB_22405
	cmp al,32
	jz LB_22405
LB_22407:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22408
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22409
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22409:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22410
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22410:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22411
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22411:
	jmp LB_22379
LB_22408:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_22380
	btr QWORD [rdi],3
LB_22380:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22381
	btr QWORD [rdi],2
LB_22381:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22382
	btr QWORD [rdi],1
LB_22382:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22383
	btr QWORD [rdi],0
LB_22383:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22379:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21573:
NS_E_RDI_21573:
NS_E_21573_ETR_TBL:
NS_E_21573_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_22520
LB_22519:
	add r14,1
LB_22520:
	cmp r14,r10
	jge LB_22521
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22519
	cmp al,10
	jz LB_22519
	cmp al,32
	jz LB_22519
LB_22521:
	push r10
	call NS_E_21577_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22522
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22492
LB_22522:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22517
	btr QWORD [rdi],0
LB_22517:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22492:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_22513
LB_22512:
	add r14,1
LB_22513:
	cmp r14,r10
	jge LB_22514
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22512
	cmp al,10
	jz LB_22512
	cmp al,32
	jz LB_22512
LB_22514:
	push r10
	call NS_E_20035_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22515
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22493
LB_22515:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22510
	btr QWORD [rdi],0
LB_22510:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22493:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_22506
LB_22505:
	add r14,1
LB_22506:
	cmp r14,r10
	jge LB_22507
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22505
	cmp al,10
	jz LB_22505
	cmp al,32
	jz LB_22505
LB_22507:
	push r10
	call NS_E_21465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22508
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22494
LB_22508:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22503
	btr QWORD [rdi],0
LB_22503:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22494:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_22499
LB_22498:
	add r14,1
LB_22499:
	cmp r14,r10
	jge LB_22500
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22498
	cmp al,10
	jz LB_22498
	cmp al,32
	jz LB_22498
LB_22500:
	push r10
	call NS_E_21575_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22501
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22495
LB_22501:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22496
	btr QWORD [rdi],0
LB_22496:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22495:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21575:
NS_E_RDI_21575:
NS_E_21575_ETR_TBL:
NS_E_21575_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_19964_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22565
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22524
LB_22565:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_22573
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_22573
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_22573
	jmp LB_22574
LB_22573:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22571
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22571:
	jmp LB_22524
LB_22574:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22559
	btr QWORD [rdi],1
LB_22559:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22560
	btr QWORD [rdi],0
LB_22560:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22524:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_19964_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22549
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22525
LB_22549:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_22557
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_22557
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_22557
	jmp LB_22558
LB_22557:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22555
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22555:
	jmp LB_22525
LB_22558:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22543
	btr QWORD [rdi],1
LB_22543:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22544
	btr QWORD [rdi],0
LB_22544:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22525:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_19964_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22533
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22526
LB_22533:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_22541
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_22541
	jmp LB_22542
LB_22541:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22539
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22539:
	jmp LB_22526
LB_22542:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22527
	btr QWORD [rdi],1
LB_22527:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22528
	btr QWORD [rdi],0
LB_22528:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22526:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21577:
NS_E_RDI_21577:
NS_E_21577_ETR_TBL:
NS_E_21577_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_22584
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_22584
	jmp LB_22585
LB_22584:
	jmp LB_22575
LB_22585:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_21579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22589
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22590
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22590:
	jmp LB_22575
LB_22589:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22576
	btr QWORD [rdi],1
LB_22576:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22577
	btr QWORD [rdi],0
LB_22577:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22575:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21579:
NS_E_RDI_21579:
NS_E_21579_ETR_TBL:
NS_E_21579_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_22615
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_22615
	jmp LB_22616
LB_22615:
	jmp LB_22592
LB_22616:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22608
	btr QWORD [rdi],0
LB_22608:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22592:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_19962_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22600
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22593
LB_22600:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_21579_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22605
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22606
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22606:
	jmp LB_22593
LB_22605:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22594
	btr QWORD [rdi],1
LB_22594:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22595
	btr QWORD [rdi],0
LB_22595:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22593:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21581:
NS_E_RDI_21581:
NS_E_21581_ETR_TBL:
NS_E_21581_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	add r14,1
	cmp r14,r10
	jg LB_22626
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_22626
	jmp LB_22627
LB_22626:
	jmp LB_22617
LB_22627:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg
	push r10
	call NS_E_21597_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22631
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22632
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22632:
	jmp LB_22617
LB_22631:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22618
	btr QWORD [rdi],1
LB_22618:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22619
	btr QWORD [rdi],0
LB_22619:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22617:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21583:
NS_E_RDI_21583:
NS_E_21583_ETR_TBL:
NS_E_21583_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144."
	jmp LB_22707
LB_22706:
	add r14,1
LB_22707:
	cmp r14,r10
	jge LB_22708
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22706
	cmp al,10
	jz LB_22706
	cmp al,32
	jz LB_22706
LB_22708:
	add r14,4
	cmp r14,r10
	jg LB_22711
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_22711
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_22711
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_22711
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_22711
	jmp LB_22712
LB_22711:
	jmp LB_22634
LB_22712:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_22686
LB_22685:
	add r14,1
LB_22686:
	cmp r14,r10
	jge LB_22687
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22685
	cmp al,10
	jz LB_22685
	cmp al,32
	jz LB_22685
LB_22687:
	push r10
	call NS_E_21587_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22688
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22689
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22689:
	jmp LB_22635
LB_22688:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_22692
LB_22691:
	add r14,1
LB_22692:
	cmp r14,r10
	jge LB_22693
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22691
	cmp al,10
	jz LB_22691
	cmp al,32
	jz LB_22691
LB_22693:
	push r10
	call NS_E_21585_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22694
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22695
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22695:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22696
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22696:
	jmp LB_22635
LB_22694:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_22699
LB_22698:
	add r14,1
LB_22699:
	cmp r14,r10
	jge LB_22700
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22698
	cmp al,10
	jz LB_22698
	cmp al,32
	jz LB_22698
LB_22700:
	push r10
	call NS_E_21569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22701
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22702
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22702:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22703
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22703:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22704
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22704:
	jmp LB_22635
LB_22701:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_22680
	btr QWORD [rdi],3
LB_22680:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22681
	btr QWORD [rdi],2
LB_22681:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22682
	btr QWORD [rdi],1
LB_22682:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22683
	btr QWORD [rdi],0
LB_22683:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22635:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_22634:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_22644
LB_22643:
	add r14,1
LB_22644:
	cmp r14,r10
	jge LB_22645
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22643
	cmp al,10
	jz LB_22643
	cmp al,32
	jz LB_22643
LB_22645:
	add r14,3
	cmp r14,r10
	jg LB_22648
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_22648
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_22648
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_22648
	jmp LB_22649
LB_22648:
	jmp LB_22636
LB_22649:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_22651
LB_22650:
	add r14,1
LB_22651:
	cmp r14,r10
	jge LB_22652
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22650
	cmp al,10
	jz LB_22650
	cmp al,32
	jz LB_22650
LB_22652:
	push r10
	call NS_E_21587_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22653
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22654
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22654:
	jmp LB_22636
LB_22653:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dot_nl
	jmp LB_22657
LB_22656:
	add r14,1
LB_22657:
	cmp r14,r10
	jge LB_22658
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22656
	cmp al,10
	jz LB_22656
	cmp al,32
	jz LB_22656
LB_22658:
	push r10
	call NS_E_21585_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22659
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22660
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22660:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22661
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22661:
	jmp LB_22636
LB_22659:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_22664
LB_22663:
	add r14,1
LB_22664:
	cmp r14,r10
	jge LB_22665
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22663
	cmp al,10
	jz LB_22663
	cmp al,32
	jz LB_22663
LB_22665:
	push r10
	call NS_E_21569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22666
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22667
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22667:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22668
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22668:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22669
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22669:
	jmp LB_22636
LB_22666:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_mtc
	jmp LB_22672
LB_22671:
	add r14,1
LB_22672:
	cmp r14,r10
	jge LB_22673
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22671
	cmp al,10
	jz LB_22671
	cmp al,32
	jz LB_22671
LB_22673:
	push r10
	call NS_E_21583_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22674
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_22675
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_22675:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22676
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22676:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22677
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22677:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22678
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22678:
	jmp LB_22636
LB_22674:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_22637
	btr QWORD [rdi],4
LB_22637:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_22638
	btr QWORD [rdi],3
LB_22638:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22639
	btr QWORD [rdi],2
LB_22639:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22640
	btr QWORD [rdi],1
LB_22640:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22641
	btr QWORD [rdi],0
LB_22641:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22636:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21585:
NS_E_RDI_21585:
NS_E_21585_ETR_TBL:
NS_E_21585_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_22718
LB_22717:
	add r14,1
LB_22718:
	cmp r14,r10
	jge LB_22719
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22717
	cmp al,32
	jz LB_22717
LB_22719:
	add r14,1
	cmp r14,r10
	jg LB_22722
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_22722
	jmp LB_22723
LB_22722:
	jmp LB_22713
LB_22723:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_22725
LB_22724:
	add r14,1
LB_22725:
	cmp r14,r10
	jge LB_22726
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22724
	cmp al,32
	jz LB_22724
LB_22726:
	add r14,1
	cmp r14,r10
	jg LB_22730
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_22730
	jmp LB_22731
LB_22730:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22728
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22728:
	jmp LB_22713
LB_22731:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22714
	btr QWORD [rdi],1
LB_22714:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22715
	btr QWORD [rdi],0
LB_22715:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22713:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21587:
NS_E_RDI_21587:
NS_E_21587_ETR_TBL:
NS_E_21587_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; mtc_test
	jmp LB_22739
LB_22738:
	add r14,1
LB_22739:
	cmp r14,r10
	jge LB_22740
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22738
	cmp al,10
	jz LB_22738
	cmp al,32
	jz LB_22738
LB_22740:
	push r10
	call NS_E_21589_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22741
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22732
LB_22741:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ mtc_test_tl ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_22747:
	jmp LB_22744
LB_22743:
	add r14,1
LB_22744:
	cmp r14,r10
	jge LB_22745
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22743
	cmp al,10
	jz LB_22743
	cmp al,32
	jz LB_22743
LB_22745:
	push r10
	push rsi
	call NS_E_21591_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_22746
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_22748
	bts QWORD [rax],0
LB_22748:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_22747
LB_22746:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22735
	btr QWORD [rdi],1
LB_22735:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22736
	btr QWORD [rdi],0
LB_22736:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22732:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22733:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21589:
NS_E_RDI_21589:
NS_E_21589_ETR_TBL:
NS_E_21589_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; reg_ptn
	jmp LB_22809
LB_22808:
	add r14,1
LB_22809:
	cmp r14,r10
	jge LB_22810
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22808
	cmp al,10
	jz LB_22808
	cmp al,32
	jz LB_22808
LB_22810:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22811
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22749
LB_22811:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_22814
LB_22813:
	add r14,1
LB_22814:
	cmp r14,r10
	jge LB_22815
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22813
	cmp al,10
	jz LB_22813
	cmp al,32
	jz LB_22813
LB_22815:
	add r14,3
	cmp r14,r10
	jg LB_22819
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_22819
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_22819
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_22819
	jmp LB_22820
LB_22819:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22817
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22817:
	jmp LB_22749
LB_22820:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_22783
LB_22782:
	add r14,1
LB_22783:
	cmp r14,r10
	jge LB_22784
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22782
	cmp al,10
	jz LB_22782
	cmp al,32
	jz LB_22782
LB_22784:
	push r10
	call NS_E_21465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22785
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22786
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22786:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22787
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22787:
	jmp LB_22750
LB_22785:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_22790
LB_22789:
	add r14,1
LB_22790:
	cmp r14,r10
	jge LB_22791
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22789
	cmp al,10
	jz LB_22789
	cmp al,32
	jz LB_22789
LB_22791:
	add r14,3
	cmp r14,r10
	jg LB_22797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_22797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_22797
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_22797
	jmp LB_22798
LB_22797:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22793
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22793:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22794
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22794:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22795
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22795:
	jmp LB_22750
LB_22798:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; reg_ptn
	jmp LB_22800
LB_22799:
	add r14,1
LB_22800:
	cmp r14,r10
	jge LB_22801
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22799
	cmp al,10
	jz LB_22799
	cmp al,32
	jz LB_22799
LB_22801:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22802
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_22803
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_22803:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22804
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22804:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22805
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22805:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22806
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22806:
	jmp LB_22750
LB_22802:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_22776
	btr QWORD [rdi],4
LB_22776:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_22777
	btr QWORD [rdi],3
LB_22777:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22778
	btr QWORD [rdi],2
LB_22778:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22779
	btr QWORD [rdi],1
LB_22779:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22780
	btr QWORD [rdi],0
LB_22780:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22750:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_22749:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; mtc_val
	jmp LB_22757
LB_22756:
	add r14,1
LB_22757:
	cmp r14,r10
	jge LB_22758
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22756
	cmp al,10
	jz LB_22756
	cmp al,32
	jz LB_22756
LB_22758:
	push r10
	call NS_E_21593_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22759
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22751
LB_22759:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_22762
LB_22761:
	add r14,1
LB_22762:
	cmp r14,r10
	jge LB_22763
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22761
	cmp al,10
	jz LB_22761
	cmp al,32
	jz LB_22761
LB_22763:
	add r14,1
	cmp r14,r10
	jg LB_22767
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_22767
	jmp LB_22768
LB_22767:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22765
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22765:
	jmp LB_22751
LB_22768:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_22770
LB_22769:
	add r14,1
LB_22770:
	cmp r14,r10
	jge LB_22771
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22769
	cmp al,10
	jz LB_22769
	cmp al,32
	jz LB_22769
LB_22771:
	push r10
	call NS_E_21593_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22772
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22773
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22773:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22774
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22774:
	jmp LB_22751
LB_22772:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22752
	btr QWORD [rdi],2
LB_22752:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22753
	btr QWORD [rdi],1
LB_22753:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22754
	btr QWORD [rdi],0
LB_22754:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22751:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21591:
NS_E_RDI_21591:
NS_E_21591_ETR_TBL:
NS_E_21591_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_22826
LB_22825:
	add r14,1
LB_22826:
	cmp r14,r10
	jge LB_22827
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22825
	cmp al,10
	jz LB_22825
	cmp al,32
	jz LB_22825
LB_22827:
	add r14,1
	cmp r14,r10
	jg LB_22830
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_22830
	jmp LB_22831
LB_22830:
	jmp LB_22821
LB_22831:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_22833
LB_22832:
	add r14,1
LB_22833:
	cmp r14,r10
	jge LB_22834
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22832
	cmp al,10
	jz LB_22832
	cmp al,32
	jz LB_22832
LB_22834:
	push r10
	call NS_E_21589_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22835
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22836
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22836:
	jmp LB_22821
LB_22835:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22822
	btr QWORD [rdi],1
LB_22822:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22823
	btr QWORD [rdi],0
LB_22823:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22821:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21593:
NS_E_RDI_21593:
NS_E_21593_ETR_TBL:
NS_E_21593_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_22851
LB_22850:
	add r14,1
LB_22851:
	cmp r14,r10
	jge LB_22852
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22850
	cmp al,10
	jz LB_22850
	cmp al,32
	jz LB_22850
LB_22852:
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22853
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22838
LB_22853:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	jmp LB_22856
LB_22855:
	add r14,1
LB_22856:
	cmp r14,r10
	jge LB_22857
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22855
	cmp al,10
	jz LB_22855
	cmp al,32
	jz LB_22855
LB_22857:
	add r14,1
	cmp r14,r10
	jg LB_22861
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_22861
	jmp LB_22862
LB_22861:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22859
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22859:
	jmp LB_22838
LB_22862:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22847
	btr QWORD [rdi],1
LB_22847:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22848
	btr QWORD [rdi],0
LB_22848:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22838:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst
	jmp LB_22843
LB_22842:
	add r14,1
LB_22843:
	cmp r14,r10
	jge LB_22844
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22842
	cmp al,10
	jz LB_22842
	cmp al,32
	jz LB_22842
LB_22844:
	push r10
	call NS_E_21502_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22845
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22839
LB_22845:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22840
	btr QWORD [rdi],0
LB_22840:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22839:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21595:
NS_E_RDI_21595:
NS_E_21595_ETR_TBL:
NS_E_21595_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_22877
LB_22876:
	add r14,1
LB_22877:
	cmp r14,r10
	jge LB_22878
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22876
	cmp al,10
	jz LB_22876
	cmp al,32
	jz LB_22876
LB_22878:
	add r14,1
	cmp r14,r10
	jg LB_22881
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_22881
	jmp LB_22882
LB_22881:
	jmp LB_22863
LB_22882:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ reg_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_22887:
	jmp LB_22884
LB_22883:
	add r14,1
LB_22884:
	cmp r14,r10
	jge LB_22885
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22883
	cmp al,10
	jz LB_22883
	cmp al,32
	jz LB_22883
LB_22885:
	push r10
	push rsi
	call NS_E_21595_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_22886
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_22888
	bts QWORD [rax],0
LB_22888:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_22887
LB_22886:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_22890
LB_22889:
	add r14,1
LB_22890:
	cmp r14,r10
	jge LB_22891
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22889
	cmp al,10
	jz LB_22889
	cmp al,32
	jz LB_22889
LB_22891:
	add r14,1
	cmp r14,r10
	jg LB_22896
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_22896
	jmp LB_22897
LB_22896:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22893
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22893:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22894
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22894:
	jmp LB_22863
LB_22897:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22872
	btr QWORD [rdi],2
LB_22872:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22873
	btr QWORD [rdi],1
LB_22873:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22874
	btr QWORD [rdi],0
LB_22874:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22863:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_22868
LB_22867:
	add r14,1
LB_22868:
	cmp r14,r10
	jge LB_22869
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22867
	cmp al,10
	jz LB_22867
	cmp al,32
	jz LB_22867
LB_22869:
	push r10
	call NS_E_21597_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22870
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22864
LB_22870:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22865
	btr QWORD [rdi],0
LB_22865:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22864:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21597:
NS_E_RDI_21597:
NS_E_21597_ETR_TBL:
NS_E_21597_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_22925
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_22925
	jmp LB_22926
LB_22925:
	jmp LB_22898
LB_22926:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22930
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22931
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22931:
	jmp LB_22898
LB_22930:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22917
	btr QWORD [rdi],1
LB_22917:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22918
	btr QWORD [rdi],0
LB_22918:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22898:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22915
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22899
LB_22915:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22910
	btr QWORD [rdi],0
LB_22910:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22899:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_22908
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_22908
	jmp LB_22909
LB_22908:
	jmp LB_22900
LB_22909:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22901
	btr QWORD [rdi],0
LB_22901:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22900:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21599:
NS_E_RDI_21599:
NS_E_21599_ETR_TBL:
NS_E_21599_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	jmp LB_22939
LB_22938:
	add r14,1
LB_22939:
	cmp r14,r10
	jge LB_22940
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22938
	cmp al,10
	jz LB_22938
	cmp al,32
	jz LB_22938
LB_22940:
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22941
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_22933
LB_22941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_etr_coprd
	jmp LB_22944
LB_22943:
	add r14,1
LB_22944:
	cmp r14,r10
	jge LB_22945
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22943
	cmp al,10
	jz LB_22943
	cmp al,32
	jz LB_22943
LB_22945:
	push r10
	call NS_E_21603_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22946
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22947
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22947:
	jmp LB_22933
LB_22946:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ dt_etr_coprd ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_22953:
	jmp LB_22950
LB_22949:
	add r14,1
LB_22950:
	cmp r14,r10
	jge LB_22951
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22949
	cmp al,10
	jz LB_22949
	cmp al,32
	jz LB_22949
LB_22951:
	push r10
	push rsi
	call NS_E_21603_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_22952
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_22954
	bts QWORD [rax],0
LB_22954:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_22953
LB_22952:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22934
	btr QWORD [rdi],2
LB_22934:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22935
	btr QWORD [rdi],1
LB_22935:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22936
	btr QWORD [rdi],0
LB_22936:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22933:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21601:
NS_E_RDI_21601:
NS_E_21601_ETR_TBL:
NS_E_21601_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_22962
LB_22961:
	add r14,1
LB_22962:
	cmp r14,r10
	jge LB_22963
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22961
	cmp al,10
	jz LB_22961
	cmp al,32
	jz LB_22961
LB_22963:
	add r14,1
	cmp r14,r10
	jg LB_22966
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_22966
	jmp LB_22967
LB_22966:
	jmp LB_22955
LB_22967:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_22969
LB_22968:
	add r14,1
LB_22969:
	cmp r14,r10
	jge LB_22970
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22968
	cmp al,10
	jz LB_22968
	cmp al,32
	jz LB_22968
LB_22970:
	add r14,1
	cmp r14,r10
	jg LB_22974
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_22974
	jmp LB_22975
LB_22974:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22972
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22972:
	jmp LB_22955
LB_22975:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_22977
LB_22976:
	add r14,1
LB_22977:
	cmp r14,r10
	jge LB_22978
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22976
	cmp al,10
	jz LB_22976
	cmp al,32
	jz LB_22976
LB_22978:
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22979
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22980
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22980:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22981
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22981:
	jmp LB_22955
LB_22979:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dt_etr_coprd
	jmp LB_22984
LB_22983:
	add r14,1
LB_22984:
	cmp r14,r10
	jge LB_22985
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22983
	cmp al,10
	jz LB_22983
	cmp al,32
	jz LB_22983
LB_22985:
	push r10
	call NS_E_21603_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_22986
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_22987
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_22987:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_22988
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_22988:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_22989
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_22989:
	jmp LB_22955
LB_22986:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_22956
	btr QWORD [rdi],3
LB_22956:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22957
	btr QWORD [rdi],2
LB_22957:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22958
	btr QWORD [rdi],1
LB_22958:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22959
	btr QWORD [rdi],0
LB_22959:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22955:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21603:
NS_E_RDI_21603:
NS_E_21603_ETR_TBL:
NS_E_21603_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_22998
LB_22997:
	add r14,1
LB_22998:
	cmp r14,r10
	jge LB_22999
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_22997
	cmp al,10
	jz LB_22997
	cmp al,32
	jz LB_22997
LB_22999:
	add r14,3
	cmp r14,r10
	jg LB_23002
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_23002
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_23002
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_23002
	jmp LB_23003
LB_23002:
	jmp LB_22991
LB_23003:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_23005
LB_23004:
	add r14,1
LB_23005:
	cmp r14,r10
	jge LB_23006
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23004
	cmp al,10
	jz LB_23004
	cmp al,32
	jz LB_23004
LB_23006:
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23007
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23008
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23008:
	jmp LB_22991
LB_23007:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_23011
LB_23010:
	add r14,1
LB_23011:
	cmp r14,r10
	jge LB_23012
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23010
	cmp al,10
	jz LB_23010
	cmp al,32
	jz LB_23010
LB_23012:
	add r14,1
	cmp r14,r10
	jg LB_23017
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_23017
	jmp LB_23018
LB_23017:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23014
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23014:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23015
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23015:
	jmp LB_22991
LB_23018:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_23020
LB_23019:
	add r14,1
LB_23020:
	cmp r14,r10
	jge LB_23021
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23019
	cmp al,10
	jz LB_23019
	cmp al,32
	jz LB_23019
LB_23021:
	push r10
	call NS_E_21605_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23022
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23023
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23023:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23024
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23024:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23025
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23025:
	jmp LB_22991
LB_23022:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_22992
	btr QWORD [rdi],3
LB_22992:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_22993
	btr QWORD [rdi],2
LB_22993:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_22994
	btr QWORD [rdi],1
LB_22994:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_22995
	btr QWORD [rdi],0
LB_22995:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_22991:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21605:
NS_E_RDI_21605:
NS_E_21605_ETR_TBL:
NS_E_21605_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "("
	jmp LB_23064
LB_23063:
	add r14,1
LB_23064:
	cmp r14,r10
	jge LB_23065
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23063
	cmp al,10
	jz LB_23063
	cmp al,32
	jz LB_23063
LB_23065:
	add r14,1
	cmp r14,r10
	jg LB_23068
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_23068
	jmp LB_23069
LB_23068:
	jmp LB_23027
LB_23069:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_23071
LB_23070:
	add r14,1
LB_23071:
	cmp r14,r10
	jge LB_23072
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23070
	cmp al,10
	jz LB_23070
	cmp al,32
	jz LB_23070
LB_23072:
	push r10
	call NS_E_21605_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23073
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23074
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23074:
	jmp LB_23027
LB_23073:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_23077
LB_23076:
	add r14,1
LB_23077:
	cmp r14,r10
	jge LB_23078
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23076
	cmp al,10
	jz LB_23076
	cmp al,32
	jz LB_23076
LB_23078:
	add r14,1
	cmp r14,r10
	jg LB_23083
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_23083
	jmp LB_23084
LB_23083:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23080
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23080:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23081
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23081:
	jmp LB_23027
LB_23084:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23059
	btr QWORD [rdi],2
LB_23059:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23060
	btr QWORD [rdi],1
LB_23060:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23061
	btr QWORD [rdi],0
LB_23061:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23027:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_23055
LB_23054:
	add r14,1
LB_23055:
	cmp r14,r10
	jge LB_23056
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23054
	cmp al,10
	jz LB_23054
	cmp al,32
	jz LB_23054
LB_23056:
	push r10
	call NS_E_21607_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23057
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23028
LB_23057:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_23040
LB_23039:
	add r14,1
LB_23040:
	cmp r14,r10
	jge LB_23041
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23039
	cmp al,10
	jz LB_23039
	cmp al,32
	jz LB_23039
LB_23041:
	add r14,3
	cmp r14,r10
	jg LB_23044
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_23044
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_23044
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_23044
	jmp LB_23045
LB_23044:
	jmp LB_23029
LB_23045:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_23047
LB_23046:
	add r14,1
LB_23047:
	cmp r14,r10
	jge LB_23048
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23046
	cmp al,10
	jz LB_23046
	cmp al,32
	jz LB_23046
LB_23048:
	push r10
	call NS_E_21605_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23049
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23050
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23050:
	jmp LB_23029
LB_23049:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23034
	btr QWORD [rdi],1
LB_23034:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23035
	btr QWORD [rdi],0
LB_23035:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23037
	btr QWORD [rdi],0
LB_23037:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23029:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23032
	btr QWORD [rdi],0
LB_23032:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23030:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23052
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23052:
LB_23028:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21607:
NS_E_RDI_21607:
NS_E_21607_ETR_TBL:
NS_E_21607_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_23112
LB_23111:
	add r14,1
LB_23112:
	cmp r14,r10
	jge LB_23113
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23111
	cmp al,10
	jz LB_23111
	cmp al,32
	jz LB_23111
LB_23113:
	push r10
	call NS_E_21609_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23114
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23085
LB_23114:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_23097
LB_23096:
	add r14,1
LB_23097:
	cmp r14,r10
	jge LB_23098
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23096
	cmp al,10
	jz LB_23096
	cmp al,32
	jz LB_23096
LB_23098:
	add r14,3
	cmp r14,r10
	jg LB_23101
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_23101
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_23101
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_23101
	jmp LB_23102
LB_23101:
	jmp LB_23086
LB_23102:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_23104
LB_23103:
	add r14,1
LB_23104:
	cmp r14,r10
	jge LB_23105
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23103
	cmp al,10
	jz LB_23103
	cmp al,32
	jz LB_23103
LB_23105:
	push r10
	call NS_E_21609_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23106
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23107
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23107:
	jmp LB_23086
LB_23106:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23091
	btr QWORD [rdi],1
LB_23091:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23092
	btr QWORD [rdi],0
LB_23092:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23094
	btr QWORD [rdi],0
LB_23094:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23086:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*1],rsi
	mov rax,0x0000_0002_0000_fffd
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23089
	btr QWORD [rdi],0
LB_23089:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23087:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23109
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23109:
LB_23085:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21609:
NS_E_RDI_21609:
NS_E_21609_ETR_TBL:
NS_E_21609_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; var
	jmp LB_23128
LB_23127:
	add r14,1
LB_23128:
	cmp r14,r10
	jge LB_23129
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23127
	cmp al,10
	jz LB_23127
	cmp al,32
	jz LB_23127
LB_23129:
	push r10
	call NS_E_21611_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23130
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23116
LB_23130:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23125
	btr QWORD [rdi],0
LB_23125:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23116:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_23121
LB_23120:
	add r14,1
LB_23121:
	cmp r14,r10
	jge LB_23122
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23120
	cmp al,10
	jz LB_23120
	cmp al,32
	jz LB_23120
LB_23122:
	push r10
	call NS_E_20532_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23123
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23117
LB_23123:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23118
	btr QWORD [rdi],0
LB_23118:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23117:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21611:
NS_E_RDI_21611:
NS_E_21611_ETR_TBL:
NS_E_21611_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23139
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23132
LB_23139:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_23147
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_23147
	jmp LB_23148
LB_23147:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23145
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23145:
	jmp LB_23132
LB_23148:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23133
	btr QWORD [rdi],1
LB_23133:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23134
	btr QWORD [rdi],0
LB_23134:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23132:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21613:
NS_E_RDI_21613:
NS_E_21613_ETR_TBL:
NS_E_21613_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "@"
	jmp LB_23179
LB_23178:
	add r14,1
LB_23179:
	cmp r14,r10
	jge LB_23180
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23178
	cmp al,10
	jz LB_23178
	cmp al,32
	jz LB_23178
LB_23180:
	add r14,1
	cmp r14,r10
	jg LB_23183
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_23183
	jmp LB_23184
LB_23183:
	jmp LB_23149
LB_23184:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_23186
LB_23185:
	add r14,1
LB_23186:
	cmp r14,r10
	jge LB_23187
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23185
	cmp al,10
	jz LB_23185
	cmp al,32
	jz LB_23185
LB_23187:
	add r14,1
	cmp r14,r10
	jg LB_23191
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_23191
	jmp LB_23192
LB_23191:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23189
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23189:
	jmp LB_23149
LB_23192:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_23194
LB_23193:
	add r14,1
LB_23194:
	cmp r14,r10
	jge LB_23195
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23193
	cmp al,10
	jz LB_23193
	cmp al,32
	jz LB_23193
LB_23195:
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23196
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23197
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23197:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23198
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23198:
	jmp LB_23149
LB_23196:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_23170
LB_23169:
	add r14,1
LB_23170:
	cmp r14,r10
	jge LB_23171
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23169
	cmp al,10
	jz LB_23169
	cmp al,32
	jz LB_23169
LB_23171:
	push r10
	call NS_E_21615_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23172
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23150
LB_23172:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23163
	btr QWORD [rdi],0
LB_23163:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23165
	btr QWORD [rdi],2
LB_23165:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23166
	btr QWORD [rdi],1
LB_23166:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23167
	btr QWORD [rdi],0
LB_23167:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23150:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_23159
LB_23158:
	add r14,1
LB_23159:
	cmp r14,r10
	jge LB_23160
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23158
	cmp al,10
	jz LB_23158
	cmp al,32
	jz LB_23158
LB_23160:
	push r10
	call NS_E_21627_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23161
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23151
LB_23161:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23152
	btr QWORD [rdi],0
LB_23152:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23154
	btr QWORD [rdi],2
LB_23154:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23155
	btr QWORD [rdi],1
LB_23155:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23156
	btr QWORD [rdi],0
LB_23156:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23151:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23174
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23174:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23175
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23175:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23176
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23176:
LB_23149:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21615:
NS_E_RDI_21615:
NS_E_21615_ETR_TBL:
NS_E_21615_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord_end
	jmp LB_23389
LB_23388:
	add r14,1
LB_23389:
	cmp r14,r10
	jge LB_23390
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23388
	cmp al,10
	jz LB_23388
	cmp al,32
	jz LB_23388
LB_23390:
	push r10
	call NS_E_21625_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23391
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23200
LB_23391:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_23394
LB_23393:
	add r14,1
LB_23394:
	cmp r14,r10
	jge LB_23395
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23393
	cmp al,10
	jz LB_23393
	cmp al,32
	jz LB_23393
LB_23395:
	push r10
	call NS_E_21617_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23396
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23397
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23397:
	jmp LB_23200
LB_23396:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; ";"
	jmp LB_23262
LB_23261:
	add r14,1
LB_23262:
	cmp r14,r10
	jge LB_23263
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23261
	cmp al,10
	jz LB_23261
	cmp al,32
	jz LB_23261
LB_23263:
	add r14,1
	cmp r14,r10
	jg LB_23266
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_23266
	jmp LB_23267
LB_23266:
	jmp LB_23201
LB_23267:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_23269
LB_23268:
	add r14,1
LB_23269:
	cmp r14,r10
	jge LB_23270
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23268
	cmp al,10
	jz LB_23268
	cmp al,32
	jz LB_23268
LB_23270:
	add r14,3
	cmp r14,r10
	jg LB_23274
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_23274
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_23274
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_23274
	jmp LB_23275
LB_23274:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23272
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23272:
	jmp LB_23201
LB_23275:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_23247
LB_23246:
	add r14,1
LB_23247:
	cmp r14,r10
	jge LB_23248
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23246
	cmp al,10
	jz LB_23246
	cmp al,32
	jz LB_23246
LB_23248:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23249
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23250
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23250:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23251
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23251:
	jmp LB_23202
LB_23249:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_23254
LB_23253:
	add r14,1
LB_23254:
	cmp r14,r10
	jge LB_23255
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23253
	cmp al,10
	jz LB_23253
	cmp al,32
	jz LB_23253
LB_23255:
	push r10
	call NS_E_21615_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23256
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23257
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23257:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23258
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23258:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23259
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23259:
	jmp LB_23202
LB_23256:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_23238
	btr QWORD [rdi],3
LB_23238:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23239
	btr QWORD [rdi],2
LB_23239:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23240
	btr QWORD [rdi],1
LB_23240:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23241
	btr QWORD [rdi],0
LB_23241:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23243
	btr QWORD [rdi],1
LB_23243:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23244
	btr QWORD [rdi],0
LB_23244:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23202:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23235
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23235:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23236
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23236:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_23201:
	add rsp,64
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_23229
LB_23228:
	add r14,1
LB_23229:
	cmp r14,r10
	jge LB_23230
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23228
	cmp al,10
	jz LB_23228
	cmp al,32
	jz LB_23228
LB_23230:
	add r14,3
	cmp r14,r10
	jg LB_23233
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_23233
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_23233
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_23233
	jmp LB_23234
LB_23233:
	jmp LB_23203
LB_23234:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_23216
LB_23215:
	add r14,1
LB_23216:
	cmp r14,r10
	jge LB_23217
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23215
	cmp al,10
	jz LB_23215
	cmp al,32
	jz LB_23215
LB_23217:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23218
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23219
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23219:
	jmp LB_23204
LB_23218:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_23222
LB_23221:
	add r14,1
LB_23222:
	cmp r14,r10
	jge LB_23223
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23221
	cmp al,10
	jz LB_23221
	cmp al,32
	jz LB_23221
LB_23223:
	push r10
	call NS_E_21569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23224
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23225
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23225:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23226
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23226:
	jmp LB_23204
LB_23224:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23208
	btr QWORD [rdi],2
LB_23208:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23209
	btr QWORD [rdi],1
LB_23209:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23210
	btr QWORD [rdi],0
LB_23210:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23212
	btr QWORD [rdi],1
LB_23212:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23213
	btr QWORD [rdi],0
LB_23213:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23204:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23205
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23205:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23206
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23206:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_23203:
	add rsp,48
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23385
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23385:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23386
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23386:
LB_23200:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ord
	jmp LB_23375
LB_23374:
	add r14,1
LB_23375:
	cmp r14,r10
	jge LB_23376
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23374
	cmp al,10
	jz LB_23374
	cmp al,32
	jz LB_23374
LB_23376:
	push r10
	call NS_E_21623_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23377
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23276
LB_23377:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_23383:
	jmp LB_23380
LB_23379:
	add r14,1
LB_23380:
	cmp r14,r10
	jge LB_23381
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23379
	cmp al,10
	jz LB_23379
	cmp al,32
	jz LB_23379
LB_23381:
	push r10
	push rsi
	call NS_E_21621_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_23382
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_23384
	bts QWORD [rax],0
LB_23384:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_23383
LB_23382:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; ";"
	jmp LB_23357
LB_23356:
	add r14,1
LB_23357:
	cmp r14,r10
	jge LB_23358
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23356
	cmp al,10
	jz LB_23356
	cmp al,32
	jz LB_23356
LB_23358:
	add r14,1
	cmp r14,r10
	jg LB_23361
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_23361
	jmp LB_23362
LB_23361:
	jmp LB_23277
LB_23362:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_23364
LB_23363:
	add r14,1
LB_23364:
	cmp r14,r10
	jge LB_23365
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23363
	cmp al,10
	jz LB_23363
	cmp al,32
	jz LB_23363
LB_23365:
	add r14,3
	cmp r14,r10
	jg LB_23369
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_23369
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_23369
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_23369
	jmp LB_23370
LB_23369:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23367
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23367:
	jmp LB_23277
LB_23370:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; reg_ptn
	jmp LB_23333
LB_23332:
	add r14,1
LB_23333:
	cmp r14,r10
	jge LB_23334
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23332
	cmp al,10
	jz LB_23332
	cmp al,32
	jz LB_23332
LB_23334:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23335
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23336
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23336:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23337
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23337:
	jmp LB_23278
LB_23335:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_23340
LB_23339:
	add r14,1
LB_23340:
	cmp r14,r10
	jge LB_23341
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23339
	cmp al,10
	jz LB_23339
	cmp al,32
	jz LB_23339
LB_23341:
	push r10
	call NS_E_21615_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23342
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23343
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23343:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23344
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23344:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23345
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23345:
	jmp LB_23278
LB_23342:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_23348
LB_23347:
	add r14,1
LB_23348:
	cmp r14,r10
	jge LB_23349
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23347
	cmp al,10
	jz LB_23347
	cmp al,32
	jz LB_23347
LB_23349:
	push r10
	call NS_E_21615_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23350
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_23351
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_23351:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23352
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23352:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23353
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23353:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23354
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23354:
	jmp LB_23278
LB_23350:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0005_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_23323
	btr QWORD [rdi],4
LB_23323:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_23324
	btr QWORD [rdi],3
LB_23324:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23325
	btr QWORD [rdi],2
LB_23325:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23326
	btr QWORD [rdi],1
LB_23326:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23327
	btr QWORD [rdi],0
LB_23327:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,88
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23329
	btr QWORD [rdi],1
LB_23329:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23330
	btr QWORD [rdi],0
LB_23330:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23278:
	add rsp,80
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23320
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23320:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23321
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23321:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_23277:
	add rsp,80
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\138\162"
	jmp LB_23314
LB_23313:
	add r14,1
LB_23314:
	cmp r14,r10
	jge LB_23315
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23313
	cmp al,10
	jz LB_23313
	cmp al,32
	jz LB_23313
LB_23315:
	add r14,3
	cmp r14,r10
	jg LB_23318
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_23318
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_23318
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_23318
	jmp LB_23319
LB_23318:
	jmp LB_23279
LB_23319:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_23293
LB_23292:
	add r14,1
LB_23293:
	cmp r14,r10
	jge LB_23294
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23292
	cmp al,10
	jz LB_23292
	cmp al,32
	jz LB_23292
LB_23294:
	push r10
	call NS_E_21595_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23295
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23296
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23296:
	jmp LB_23280
LB_23295:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_23299
LB_23298:
	add r14,1
LB_23299:
	cmp r14,r10
	jge LB_23300
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23298
	cmp al,10
	jz LB_23298
	cmp al,32
	jz LB_23298
LB_23300:
	push r10
	call NS_E_21569_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23301
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23302
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23302:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23303
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23303:
	jmp LB_23280
LB_23301:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_23306
LB_23305:
	add r14,1
LB_23306:
	cmp r14,r10
	jge LB_23307
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23305
	cmp al,10
	jz LB_23305
	cmp al,32
	jz LB_23305
LB_23307:
	push r10
	call NS_E_21615_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23308
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23309
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23309:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23310
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23310:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23311
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23311:
	jmp LB_23280
LB_23308:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_23284
	btr QWORD [rdi],3
LB_23284:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23285
	btr QWORD [rdi],2
LB_23285:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23286
	btr QWORD [rdi],1
LB_23286:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23287
	btr QWORD [rdi],0
LB_23287:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,72
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*2],rsi
	mov rax,0x0000_0003_0000_fffb
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23289
	btr QWORD [rdi],1
LB_23289:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23290
	btr QWORD [rdi],0
LB_23290:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23280:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23281
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23281:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23282
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23282:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_23279:
	add rsp,64
	pop r14
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23371
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23371:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23372
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23372:
LB_23276:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21617:
NS_E_RDI_21617:
NS_E_21617_ETR_TBL:
NS_E_21617_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "!|"
	jmp LB_23428
LB_23427:
	add r14,1
LB_23428:
	cmp r14,r10
	jge LB_23429
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23427
	cmp al,10
	jz LB_23427
	cmp al,32
	jz LB_23427
LB_23429:
	add r14,2
	cmp r14,r10
	jg LB_23432
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_23432
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_23432
	jmp LB_23433
LB_23432:
	jmp LB_23399
LB_23433:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_23422
LB_23421:
	add r14,1
LB_23422:
	cmp r14,r10
	jge LB_23423
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23421
	cmp al,10
	jz LB_23421
	cmp al,32
	jz LB_23421
LB_23423:
	push r10
	call NS_E_21619_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23424
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23425
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23425:
	jmp LB_23400
LB_23424:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23418
	btr QWORD [rdi],1
LB_23418:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23419
	btr QWORD [rdi],0
LB_23419:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23400:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_23399:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_23408
LB_23407:
	add r14,1
LB_23408:
	cmp r14,r10
	jge LB_23409
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23407
	cmp al,10
	jz LB_23407
	cmp al,32
	jz LB_23407
LB_23409:
	push r10
	call NS_E_21621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23410
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23401
LB_23410:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_23413
LB_23412:
	add r14,1
LB_23413:
	cmp r14,r10
	jge LB_23414
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23412
	cmp al,10
	jz LB_23412
	cmp al,32
	jz LB_23412
LB_23414:
	push r10
	call NS_E_21617_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23415
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23416
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23416:
	jmp LB_23401
LB_23415:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23404
	btr QWORD [rdi],1
LB_23404:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23405
	btr QWORD [rdi],0
LB_23405:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23401:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23402:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21619:
NS_E_RDI_21619:
NS_E_21619_ETR_TBL:
NS_E_21619_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_23441
LB_23440:
	add r14,1
LB_23441:
	cmp r14,r10
	jge LB_23442
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23440
	cmp al,10
	jz LB_23440
	cmp al,32
	jz LB_23440
LB_23442:
	push r10
	call NS_E_21621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23443
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23434
LB_23443:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_23446
LB_23445:
	add r14,1
LB_23446:
	cmp r14,r10
	jge LB_23447
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23445
	cmp al,10
	jz LB_23445
	cmp al,32
	jz LB_23445
LB_23447:
	push r10
	call NS_E_21619_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23448
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23449
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23449:
	jmp LB_23434
LB_23448:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23437
	btr QWORD [rdi],1
LB_23437:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23438
	btr QWORD [rdi],0
LB_23438:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23434:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23435:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21621:
NS_E_RDI_21621:
NS_E_21621_ETR_TBL:
NS_E_21621_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_23473
LB_23472:
	add r14,1
LB_23473:
	cmp r14,r10
	jge LB_23474
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23472
	cmp al,10
	jz LB_23472
	cmp al,32
	jz LB_23472
LB_23474:
	add r14,3
	cmp r14,r10
	jg LB_23477
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_23477
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_23477
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_23477
	jmp LB_23478
LB_23477:
	jmp LB_23451
LB_23478:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn
	jmp LB_23480
LB_23479:
	add r14,1
LB_23480:
	cmp r14,r10
	jge LB_23481
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23479
	cmp al,10
	jz LB_23479
	cmp al,32
	jz LB_23479
LB_23481:
	push r10
	call NS_E_21621_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23482
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23483
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23483:
	jmp LB_23451
LB_23482:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_23486
LB_23485:
	add r14,1
LB_23486:
	cmp r14,r10
	jge LB_23487
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23485
	cmp al,10
	jz LB_23485
	cmp al,32
	jz LB_23485
LB_23487:
	add r14,3
	cmp r14,r10
	jg LB_23492
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_23492
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_23492
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_23492
	jmp LB_23493
LB_23492:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23489
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23489:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23490
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23490:
	jmp LB_23451
LB_23493:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23468
	btr QWORD [rdi],2
LB_23468:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23469
	btr QWORD [rdi],1
LB_23469:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23470
	btr QWORD [rdi],0
LB_23470:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23451:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_23464
LB_23463:
	add r14,1
LB_23464:
	cmp r14,r10
	jge LB_23465
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23463
	cmp al,10
	jz LB_23463
	cmp al,32
	jz LB_23463
LB_23465:
	push r10
	call NS_E_20035_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23466
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23452
LB_23466:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23461
	btr QWORD [rdi],0
LB_23461:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23452:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_23457
LB_23456:
	add r14,1
LB_23457:
	cmp r14,r10
	jge LB_23458
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23456
	cmp al,10
	jz LB_23456
	cmp al,32
	jz LB_23456
LB_23458:
	push r10
	call NS_E_21465_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23459
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23453
LB_23459:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23454
	btr QWORD [rdi],0
LB_23454:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23453:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21623:
NS_E_RDI_21623:
NS_E_21623_ETR_TBL:
NS_E_21623_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_23518
LB_23517:
	add r14,1
LB_23518:
	cmp r14,r10
	jge LB_23519
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23517
	cmp al,10
	jz LB_23517
	cmp al,32
	jz LB_23517
LB_23519:
	add r14,4
	cmp r14,r10
	jg LB_23522
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_23522
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_23522
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_23522
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_23522
	jmp LB_23523
LB_23522:
	jmp LB_23494
LB_23523:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23515
	btr QWORD [rdi],0
LB_23515:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23494:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_23509
LB_23508:
	add r14,1
LB_23509:
	cmp r14,r10
	jge LB_23510
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23508
	cmp al,10
	jz LB_23508
	cmp al,32
	jz LB_23508
LB_23510:
	add r14,4
	cmp r14,r10
	jg LB_23513
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_23513
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_23513
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_23513
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_23513
	jmp LB_23514
LB_23513:
	jmp LB_23495
LB_23514:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23506
	btr QWORD [rdi],0
LB_23506:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23495:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_23500
LB_23499:
	add r14,1
LB_23500:
	cmp r14,r10
	jge LB_23501
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23499
	cmp al,10
	jz LB_23499
	cmp al,32
	jz LB_23499
LB_23501:
	add r14,3
	cmp r14,r10
	jg LB_23504
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_23504
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_23504
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_23504
	jmp LB_23505
LB_23504:
	jmp LB_23496
LB_23505:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23497
	btr QWORD [rdi],0
LB_23497:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23496:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21625:
NS_E_RDI_21625:
NS_E_21625_ETR_TBL:
NS_E_21625_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_23548
LB_23547:
	add r14,1
LB_23548:
	cmp r14,r10
	jge LB_23549
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23547
	cmp al,10
	jz LB_23547
	cmp al,32
	jz LB_23547
LB_23549:
	add r14,5
	cmp r14,r10
	jg LB_23552
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_23552
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_23552
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_23552
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_23552
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_23552
	jmp LB_23553
LB_23552:
	jmp LB_23524
LB_23553:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23545
	btr QWORD [rdi],0
LB_23545:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23524:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_23539
LB_23538:
	add r14,1
LB_23539:
	cmp r14,r10
	jge LB_23540
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23538
	cmp al,10
	jz LB_23538
	cmp al,32
	jz LB_23538
LB_23540:
	add r14,5
	cmp r14,r10
	jg LB_23543
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_23543
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_23543
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_23543
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_23543
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_23543
	jmp LB_23544
LB_23543:
	jmp LB_23525
LB_23544:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23536
	btr QWORD [rdi],0
LB_23536:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23525:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_23530
LB_23529:
	add r14,1
LB_23530:
	cmp r14,r10
	jge LB_23531
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23529
	cmp al,10
	jz LB_23529
	cmp al,32
	jz LB_23529
LB_23531:
	add r14,4
	cmp r14,r10
	jg LB_23534
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_23534
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_23534
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_23534
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_23534
	jmp LB_23535
LB_23534:
	jmp LB_23526
LB_23535:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23527
	btr QWORD [rdi],0
LB_23527:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23526:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21627:
NS_E_RDI_21627:
NS_E_21627_ETR_TBL:
NS_E_21627_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_23650
LB_23649:
	add r14,1
LB_23650:
	cmp r14,r10
	jge LB_23651
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23649
	cmp al,10
	jz LB_23649
	cmp al,32
	jz LB_23649
LB_23651:
	push r10
	call NS_E_21625_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23652
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23554
LB_23652:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_23655
LB_23654:
	add r14,1
LB_23655:
	cmp r14,r10
	jge LB_23656
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23654
	cmp al,10
	jz LB_23654
	cmp al,32
	jz LB_23654
LB_23656:
	push r10
	call NS_E_21629_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23657
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23658
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23658:
	jmp LB_23554
LB_23657:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_23664:
	jmp LB_23661
LB_23660:
	add r14,1
LB_23661:
	cmp r14,r10
	jge LB_23662
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23660
	cmp al,10
	jz LB_23660
	cmp al,32
	jz LB_23660
LB_23662:
	push r10
	push rsi
	call NS_E_21621_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_23663
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_23665
	bts QWORD [rax],0
LB_23665:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_23664
LB_23663:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_23570
LB_23569:
	add r14,1
LB_23570:
	cmp r14,r10
	jge LB_23571
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23569
	cmp al,10
	jz LB_23569
	cmp al,32
	jz LB_23569
LB_23571:
	add r14,1
	cmp r14,r10
	jg LB_23574
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_23574
	jmp LB_23575
LB_23574:
	jmp LB_23555
LB_23575:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_23577
LB_23576:
	add r14,1
LB_23577:
	cmp r14,r10
	jge LB_23578
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23576
	cmp al,10
	jz LB_23576
	cmp al,32
	jz LB_23576
LB_23578:
	push r10
	call NS_E_21627_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23579
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23580
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23580:
	jmp LB_23555
LB_23579:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23562
	btr QWORD [rdi],1
LB_23562:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23563
	btr QWORD [rdi],0
LB_23563:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23565
	btr QWORD [rdi],2
LB_23565:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23566
	btr QWORD [rdi],1
LB_23566:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23567
	btr QWORD [rdi],0
LB_23567:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23555:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23558
	btr QWORD [rdi],2
LB_23558:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23559
	btr QWORD [rdi],1
LB_23559:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23560
	btr QWORD [rdi],0
LB_23560:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23556:
	add rsp,0
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23645
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23645:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23646
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23646:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23647
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23647:
LB_23554:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord
	jmp LB_23629
LB_23628:
	add r14,1
LB_23629:
	cmp r14,r10
	jge LB_23630
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23628
	cmp al,10
	jz LB_23628
	cmp al,32
	jz LB_23628
LB_23630:
	push r10
	call NS_E_21623_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23631
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23582
LB_23631:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_23634
LB_23633:
	add r14,1
LB_23634:
	cmp r14,r10
	jge LB_23635
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23633
	cmp al,10
	jz LB_23633
	cmp al,32
	jz LB_23633
LB_23635:
	push r10
	call NS_E_21629_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23636
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23637
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23637:
	jmp LB_23582
LB_23636:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ grm_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_23643:
	jmp LB_23640
LB_23639:
	add r14,1
LB_23640:
	cmp r14,r10
	jge LB_23641
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23639
	cmp al,10
	jz LB_23639
	cmp al,32
	jz LB_23639
LB_23641:
	push r10
	push rsi
	call NS_E_21621_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_23642
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_23644
	bts QWORD [rax],0
LB_23644:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_23643
LB_23642:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ";"
	jmp LB_23605
LB_23604:
	add r14,1
LB_23605:
	cmp r14,r10
	jge LB_23606
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23604
	cmp al,10
	jz LB_23604
	cmp al,32
	jz LB_23604
LB_23606:
	add r14,1
	cmp r14,r10
	jg LB_23609
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_23609
	jmp LB_23610
LB_23609:
	jmp LB_23583
LB_23610:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_23612
LB_23611:
	add r14,1
LB_23612:
	cmp r14,r10
	jge LB_23613
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23611
	cmp al,10
	jz LB_23611
	cmp al,32
	jz LB_23611
LB_23613:
	push r10
	call NS_E_21627_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23614
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23615
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23615:
	jmp LB_23583
LB_23614:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_cnc
	jmp LB_23618
LB_23617:
	add r14,1
LB_23618:
	cmp r14,r10
	jge LB_23619
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23617
	cmp al,10
	jz LB_23617
	cmp al,32
	jz LB_23617
LB_23619:
	push r10
	call NS_E_21627_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23620
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23621
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23621:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23622
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23622:
	jmp LB_23583
LB_23620:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23596
	btr QWORD [rdi],2
LB_23596:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23597
	btr QWORD [rdi],1
LB_23597:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23598
	btr QWORD [rdi],0
LB_23598:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23600
	btr QWORD [rdi],2
LB_23600:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23601
	btr QWORD [rdi],1
LB_23601:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23602
	btr QWORD [rdi],0
LB_23602:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23583:
	add rsp,48
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_23592
LB_23591:
	add r14,1
LB_23592:
	cmp r14,r10
	jge LB_23593
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23591
	cmp al,10
	jz LB_23591
	cmp al,32
	jz LB_23591
LB_23593:
	push r10
	call NS_E_21627_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23594
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23584
LB_23594:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23585
	btr QWORD [rdi],0
LB_23585:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,24
	mov rsi,rdi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi+8+8*3],rsi
	mov rax,0x0000_0004_0000_fff7
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_23587
	btr QWORD [rdi],2
LB_23587:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23588
	btr QWORD [rdi],1
LB_23588:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23589
	btr QWORD [rdi],0
LB_23589:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,56
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23584:
	add rsp,16
	pop r14
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_23624
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_23624:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_23625
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_23625:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23626
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23626:
LB_23582:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_21629:
NS_E_RDI_21629:
NS_E_21629_ETR_TBL:
NS_E_21629_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_23673
LB_23672:
	add r14,1
LB_23673:
	cmp r14,r10
	jge LB_23674
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23672
	cmp al,10
	jz LB_23672
	cmp al,32
	jz LB_23672
LB_23674:
	push r10
	call NS_E_20403_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_23675
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_23666
LB_23675:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_23678
LB_23677:
	add r14,1
LB_23678:
	cmp r14,r10
	jge LB_23679
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_23677
	cmp al,10
	jz LB_23677
	cmp al,32
	jz LB_23677
LB_23679:
	add r14,1
	cmp r14,r10
	jg LB_23683
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_23683
	jmp LB_23684
LB_23683:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_23681
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_23681:
	jmp LB_23666
LB_23684:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_23669
	btr QWORD [rdi],1
LB_23669:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_23670
	btr QWORD [rdi],0
LB_23670:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	add rsp,40
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23666:
	add rsp,32
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	add rsp,8
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
LB_23667:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_23720:
NS_E_RDI_23720:
; » _^ ..
	mov rax,104
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 m0 \n"
	mov rsi,0x_20_30_6d_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; " \194\167\194\167 m1 = m2 \n"
	mov rsi,0x_31_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_6d
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_32
	mov BYTE [rdi+8*1+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+6],sil
	add rdi,15
; " \194\167 f0 = f1 \n"
	mov rsi,0x_3d_20_30_66_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_66
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_31
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+4],sil
	add rdi,13
; " \194\167\194\167 m3 \n"
	mov rsi,0x_33_6d_20_a7_c2_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \226\136\142\226\136\142 \n"
	mov rsi,0x_20_8e_88_e2_8e_88_e2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; "\226\136\142\226\136\142\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_8e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\194\167\194\167 In0 \n"
	mov rsi,0x_30_6e_49_20_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; " \194\167 C1 \194\171 \n"
	mov rsi,0x_c2_20_31_43_20_a7_c2_20
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_ab
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; "\t\t\226\136\142 {} \n"
	mov rsi,0x_7d_7b_20_8e_88_e2_09_09
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_20
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; "\226\136\142\226\136\142 \t\t\n"
	mov rsi,0x_09_20_8e_88_e2_8e_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_09
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; //
	mov r13,rax
	btr r12,0
; » 0xr0 |~ {  } ⊢ %_23686 : %_23686
 ; {>  %_23685~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_23686
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f14 |~ {  } ⊢ %_23687 : %_23687
 ; {>  %_23685~0':_stg %_23686~1':_r64 }
; 	» _args _ ⊢ 2' : %_23687
	push r14
	push rdx
	push rcx
	push r8
	push r9
	push r10
	push r11
	push r13
	mov rdi,[args]
	clc
	call dcp
	pop r13
	pop r11
	pop r10
	pop r9
	pop r8
	pop rcx
	pop rdx
	pop r14
	mov r8,rax
	btr r12,2
MTC_LB_23721:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23722
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_23723
	bt QWORD [rax],0
	jc LB_23724
	btr r12,5
	jmp LB_23725
LB_23724:
	bts r12,5
LB_23725:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_23723:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_23728
	btr r12,6
	jmp LB_23729
LB_23728:
	bts r12,6
LB_23729:
	mov r9,rcx
	bt r12,6
	jc LB_23726
	btr r12,3
	jmp LB_23727
LB_23726:
	bts r12,3
LB_23727:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_23732
	btr r12,6
	jmp LB_23733
LB_23732:
	bts r12,6
LB_23733:
	mov r10,rcx
	bt r12,6
	jc LB_23730
	btr r12,4
	jmp LB_23731
LB_23730:
	bts r12,4
LB_23731:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23722
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r10
	bt QWORD [rax],17
	jnc LB_23734
	bt QWORD [rax],0
	jc LB_23735
	btr r12,7
	jmp LB_23736
LB_23735:
	bts r12,7
LB_23736:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_23734:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_23739
	btr r12,8
	jmp LB_23740
LB_23739:
	bts r12,8
LB_23740:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_23737
	btr r12,5
	jmp LB_23738
LB_23737:
	bts r12,5
LB_23738:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_23743
	btr r12,8
	jmp LB_23744
LB_23743:
	bts r12,8
LB_23744:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_23741
	btr r12,6
	jmp LB_23742
LB_23741:
	bts r12,6
LB_23742:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_23722
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °1◂{  }
; 6' ⊢ °1◂{  }
	btr r12,7
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,rcx
	bt QWORD [rax],17
	jnc LB_23745
	bt QWORD [rax],0
	jc LB_23746
	btr r12,7
	jmp LB_23747
LB_23746:
	bts r12,7
LB_23747:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_23745:
	mov rdx,rax
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_23748:
	cmp r15,0
	jz LB_23749
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23748
LB_23749:
; _f23 %_23690 ⊢ { %_23692 %_23693 } : { %_23692 %_23693 }
 ; {>  %_23688~3':_stg %_23690~5':_stg %_23685~0':_stg %_23686~1':_r64 }
; _f23 5' ⊢ { 2' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_23756
	btr r12,0
	jmp LB_23757
LB_23756:
	bts r12,0
LB_23757:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_23758
	btr r12,2
	jmp LB_23759
LB_23758:
	bts r12,2
LB_23759:
	mov r10,r14
	bt r12,1
	jc LB_23760
	btr r12,4
	jmp LB_23761
LB_23760:
	bts r12,4
LB_23761:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_23754
	btr r12,3
	jmp LB_23755
LB_23754:
	bts r12,3
LB_23755:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_23752
	btr r12,1
	jmp LB_23753
LB_23752:
	bts r12,1
LB_23753:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23750
	btr r12,0
	jmp LB_23751
LB_23750:
	bts r12,0
LB_23751:
	add rsp,32
; _f21399 %_23693 ⊢ { %_23694 %_23695 } : { %_23694 %_23695 }
 ; {>  %_23688~3':_stg %_23685~0':_stg %_23686~1':_r64 %_23693~4':_stg %_23692~2':_stg }
; _f21399 4' ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_23770
	btr r12,0
	jmp LB_23771
LB_23770:
	bts r12,0
LB_23771:
	call NS_E_21399
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_23772
	btr r12,4
	jmp LB_23773
LB_23772:
	bts r12,4
LB_23773:
	mov r11,r14
	bt r12,1
	jc LB_23774
	btr r12,5
	jmp LB_23775
LB_23774:
	bts r12,5
LB_23775:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_23768
	btr r12,3
	jmp LB_23769
LB_23768:
	bts r12,3
LB_23769:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_23766
	btr r12,2
	jmp LB_23767
LB_23766:
	bts r12,2
LB_23767:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_23764
	btr r12,1
	jmp LB_23765
LB_23764:
	bts r12,1
LB_23765:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23762
	btr r12,0
	jmp LB_23763
LB_23762:
	bts r12,0
LB_23763:
	add rsp,40
MTC_LB_23776:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23777
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °0◂6'
; 5' ⊢ °0◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r11
	bt QWORD [rax],17
	jnc LB_23778
	bt QWORD [rax],0
	jc LB_23779
	btr r12,7
	jmp LB_23780
LB_23779:
	bts r12,7
LB_23780:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_23778:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_23781
	btr r12,6
	jmp LB_23782
LB_23781:
	bts r12,6
LB_23782:
LB_23783:
	cmp r15,0
	jz LB_23784
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23783
LB_23784:
; » 0xr0 |~ {  } ⊢ %_23697 : %_23697
 ; {>  %_23688~3':_stg %_23696~6':_stg %_23685~0':_stg %_23694~4':_stg %_23686~1':_r64 %_23692~2':_stg }
; 	» 0xr0 _ ⊢ 5' : %_23697
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f21559 { %_23696 %_23697 } ⊢ { %_23698 %_23699 %_23700 } : { %_23698 %_23699 %_23700 }
 ; {>  %_23688~3':_stg %_23696~6':_stg %_23697~5':_r64 %_23685~0':_stg %_23694~4':_stg %_23686~1':_r64 %_23692~2':_stg }
; _f21559 { 6' 5' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000110.. |},{ 6' 5' } ⊢ { 0' 1' }
	mov r13,rcx
	bt r12,6
	jc LB_23795
	btr r12,0
	jmp LB_23796
LB_23795:
	bts r12,0
LB_23796:
	mov r14,r11
	bt r12,5
	jc LB_23797
	btr r12,1
	jmp LB_23798
LB_23797:
	bts r12,1
LB_23798:
	call NS_E_21559
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_23799
	btr r12,5
	jmp LB_23800
LB_23799:
	bts r12,5
LB_23800:
	mov rcx,r14
	bt r12,1
	jc LB_23801
	btr r12,6
	jmp LB_23802
LB_23801:
	bts r12,6
LB_23802:
	mov rdx,r9
	bt r12,3
	jc LB_23805
	btr r12,7
	jmp LB_23806
LB_23805:
	bts r12,7
LB_23806:
	mov rsi,1
	bt r12,7
	jc LB_23803
	mov rsi,0
	bt rdx,0
	jc LB_23803
	jmp LB_23804
LB_23803:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_23804:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_23793
	btr r12,4
	jmp LB_23794
LB_23793:
	bts r12,4
LB_23794:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_23791
	btr r12,3
	jmp LB_23792
LB_23791:
	bts r12,3
LB_23792:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_23789
	btr r12,2
	jmp LB_23790
LB_23789:
	bts r12,2
LB_23790:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_23787
	btr r12,1
	jmp LB_23788
LB_23787:
	bts r12,1
LB_23788:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23785
	btr r12,0
	jmp LB_23786
LB_23785:
	bts r12,0
LB_23786:
	add rsp,48
; _f24 %_23698 ⊢ %_23701 : %_23701
 ; {>  %_23688~3':_stg %_23700~7':(_opn)◂(_p21558) %_23699~6':_r64 %_23698~5':_stg %_23685~0':_stg %_23694~4':_stg %_23686~1':_r64 %_23692~2':_stg }
; _f24 5' ⊢ 5'
; push_iv 
	sub rsp,64
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],rcx
	mov QWORD [rsp+8+8*6],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_23821
	btr r12,0
	jmp LB_23822
LB_23821:
	bts r12,0
LB_23822:
	call NS_E_24
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 5'
	mov r11,r13
	bt r12,0
	jc LB_23823
	btr r12,5
	jmp LB_23824
LB_23823:
	bts r12,5
LB_23824:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*6]
	bt QWORD rax,7
	jc LB_23819
	btr r12,7
	jmp LB_23820
LB_23819:
	bts r12,7
LB_23820:
	mov rcx,QWORD [rsp+8+8*5]
	bt QWORD rax,6
	jc LB_23817
	btr r12,6
	jmp LB_23818
LB_23817:
	bts r12,6
LB_23818:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_23815
	btr r12,4
	jmp LB_23816
LB_23815:
	bts r12,4
LB_23816:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_23813
	btr r12,3
	jmp LB_23814
LB_23813:
	bts r12,3
LB_23814:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_23811
	btr r12,2
	jmp LB_23812
LB_23811:
	bts r12,2
LB_23812:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_23809
	btr r12,1
	jmp LB_23810
LB_23809:
	bts r12,1
LB_23810:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23807
	btr r12,0
	jmp LB_23808
LB_23807:
	bts r12,0
LB_23808:
	add rsp,64
; ∎ {  }
 ; {>  %_23688~3':_stg %_23700~7':(_opn)◂(_p21558) %_23701~5':_stg %_23699~6':_r64 %_23685~0':_stg %_23694~4':_stg %_23686~1':_r64 %_23692~2':_stg }
; 	∎ {  }
	bt r12,3
	jc LB_23825
	mov rdi,r9
	call dlt
LB_23825:
	bt r12,7
	jc LB_23826
	mov rdi,rdx
	call dlt
LB_23826:
	bt r12,5
	jc LB_23827
	mov rdi,r11
	call dlt
LB_23827:
	bt r12,6
	jc LB_23828
	mov rdi,rcx
	call dlt
LB_23828:
	bt r12,0
	jc LB_23829
	mov rdi,r13
	call dlt
LB_23829:
	bt r12,4
	jc LB_23830
	mov rdi,r10
	call dlt
LB_23830:
	bt r12,1
	jc LB_23831
	mov rdi,r14
	call dlt
LB_23831:
	bt r12,2
	jc LB_23832
	mov rdi,r8
	call dlt
LB_23832:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_23777:
	mov r15,0
LB_23834:
	cmp r15,0
	jz LB_23835
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23834
LB_23835:
; ∎ {  }
 ; {>  %_23688~3':_stg %_23685~0':_stg %_23695~5':(_opn)◂(_stg) %_23694~4':_stg %_23686~1':_r64 %_23692~2':_stg }
; 	∎ {  }
	bt r12,3
	jc LB_23836
	mov rdi,r9
	call dlt
LB_23836:
	bt r12,0
	jc LB_23837
	mov rdi,r13
	call dlt
LB_23837:
	bt r12,5
	jc LB_23838
	mov rdi,r11
	call dlt
LB_23838:
	bt r12,4
	jc LB_23839
	mov rdi,r10
	call dlt
LB_23839:
	bt r12,1
	jc LB_23840
	mov rdi,r14
	call dlt
LB_23840:
	bt r12,2
	jc LB_23841
	mov rdi,r8
	call dlt
LB_23841:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_23833:
MTC_LB_23722:
	mov r15,0
LB_23843:
	cmp r15,0
	jz LB_23844
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23843
LB_23844:
; _f21559 { %_23685 %_23686 } ⊢ { %_23702 %_23703 %_23704 } : { %_23702 %_23703 %_23704 }
 ; {>  %_23685~0':_stg %_23686~1':_r64 %_23687~2':(_lst)◂(_stg) }
; _f21559 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_21559
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_23847
	btr r12,4
	jmp LB_23848
LB_23847:
	bts r12,4
LB_23848:
	mov r9,r10
	bt r12,4
	jc LB_23851
	btr r12,3
	jmp LB_23852
LB_23851:
	bts r12,3
LB_23852:
	mov rsi,1
	bt r12,3
	jc LB_23849
	mov rsi,0
	bt r9,0
	jc LB_23849
	jmp LB_23850
LB_23849:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_23850:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_23845
	btr r12,2
	jmp LB_23846
LB_23845:
	bts r12,2
LB_23846:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_23705
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f23 %_23705 ⊢ { %_23706 %_23707 } : { %_23706 %_23707 }
 ; {>  %_23704~3':(_opn)◂(_p21558) %_23703~1':_r64 %_23702~0':_stg %_23705~4':_stg %_23687~2':(_lst)◂(_stg) }
; _f23 4' ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_23861
	btr r12,0
	jmp LB_23862
LB_23861:
	bts r12,0
LB_23862:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_23863
	btr r12,4
	jmp LB_23864
LB_23863:
	bts r12,4
LB_23864:
	mov r11,r14
	bt r12,1
	jc LB_23865
	btr r12,5
	jmp LB_23866
LB_23865:
	bts r12,5
LB_23866:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_23859
	btr r12,3
	jmp LB_23860
LB_23859:
	bts r12,3
LB_23860:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_23857
	btr r12,2
	jmp LB_23858
LB_23857:
	bts r12,2
LB_23858:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_23855
	btr r12,1
	jmp LB_23856
LB_23855:
	bts r12,1
LB_23856:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23853
	btr r12,0
	jmp LB_23854
LB_23853:
	bts r12,0
LB_23854:
	add rsp,40
; _f24 { %_23706 %_23707 } ⊢ { %_23708 %_23709 } : { %_23708 %_23709 }
 ; {>  %_23704~3':(_opn)◂(_p21558) %_23703~1':_r64 %_23702~0':_stg %_23707~5':_stg %_23687~2':(_lst)◂(_stg) %_23706~4':_stg }
; _f24 { 4' 5' } ⊢ { 4' 5' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000110.. |},{ 4' 5' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r10
	bt r12,4
	jc LB_23877
	btr r12,1
	jmp LB_23878
LB_23877:
	bts r12,1
LB_23878:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_23875
	btr QWORD [rdi],0
	jmp LB_23876
LB_23875:
	bts QWORD [rdi],0
LB_23876:
	mov r14,r11
	bt r12,5
	jc LB_23881
	btr r12,1
	jmp LB_23882
LB_23881:
	bts r12,1
LB_23882:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_23879
	btr QWORD [rdi],1
	jmp LB_23880
LB_23879:
	bts QWORD [rdi],1
LB_23880:
	call NS_E_24
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_23885
	btr r12,1
	jmp LB_23886
LB_23885:
	bts r12,1
LB_23886:
	mov r10,r14
	bt r12,1
	jc LB_23883
	btr r12,4
	jmp LB_23884
LB_23883:
	bts r12,4
LB_23884:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_23889
	btr r12,1
	jmp LB_23890
LB_23889:
	bts r12,1
LB_23890:
	mov r11,r14
	bt r12,1
	jc LB_23887
	btr r12,5
	jmp LB_23888
LB_23887:
	bts r12,5
LB_23888:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_23873
	btr r12,3
	jmp LB_23874
LB_23873:
	bts r12,3
LB_23874:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_23871
	btr r12,2
	jmp LB_23872
LB_23871:
	bts r12,2
LB_23872:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_23869
	btr r12,1
	jmp LB_23870
LB_23869:
	bts r12,1
LB_23870:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23867
	btr r12,0
	jmp LB_23868
LB_23867:
	bts r12,0
LB_23868:
	add rsp,40
; _f21399 %_23709 ⊢ { %_23710 %_23711 } : { %_23710 %_23711 }
 ; {>  %_23704~3':(_opn)◂(_p21558) %_23709~5':_stg %_23703~1':_r64 %_23702~0':_stg %_23687~2':(_lst)◂(_stg) %_23708~4':_stg }
; _f21399 5' ⊢ { 5' 6' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_23901
	btr r12,0
	jmp LB_23902
LB_23901:
	bts r12,0
LB_23902:
	call NS_E_21399
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_23903
	btr r12,5
	jmp LB_23904
LB_23903:
	bts r12,5
LB_23904:
	mov rcx,r14
	bt r12,1
	jc LB_23905
	btr r12,6
	jmp LB_23906
LB_23905:
	bts r12,6
LB_23906:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_23899
	btr r12,4
	jmp LB_23900
LB_23899:
	bts r12,4
LB_23900:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_23897
	btr r12,3
	jmp LB_23898
LB_23897:
	bts r12,3
LB_23898:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_23895
	btr r12,2
	jmp LB_23896
LB_23895:
	bts r12,2
LB_23896:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_23893
	btr r12,1
	jmp LB_23894
LB_23893:
	bts r12,1
LB_23894:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23891
	btr r12,0
	jmp LB_23892
LB_23891:
	bts r12,0
LB_23892:
	add rsp,48
MTC_LB_23907:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_23908
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °0◂7'
; 6' ⊢ °0◂7'
	btr r12,8
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,rcx
	bt QWORD [rax],17
	jnc LB_23909
	bt QWORD [rax],0
	jc LB_23910
	btr r12,8
	jmp LB_23911
LB_23910:
	bts r12,8
LB_23911:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_23909:
	mov QWORD [st_vct+8*8],rax
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_23912
	btr r12,7
	jmp LB_23913
LB_23912:
	bts r12,7
LB_23913:
LB_23914:
	cmp r15,0
	jz LB_23915
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23914
LB_23915:
; » 0xr0 |~ {  } ⊢ %_23713 : %_23713
 ; {>  %_23710~5':_stg %_23704~3':(_opn)◂(_p21558) %_23703~1':_r64 %_23702~0':_stg %_23712~7':_stg %_23687~2':(_lst)◂(_stg) %_23708~4':_stg }
; 	» 0xr0 _ ⊢ 6' : %_23713
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f21559 { %_23712 %_23713 } ⊢ { %_23714 %_23715 %_23716 } : { %_23714 %_23715 %_23716 }
 ; {>  %_23710~5':_stg %_23704~3':(_opn)◂(_p21558) %_23703~1':_r64 %_23702~0':_stg %_23712~7':_stg %_23713~6':_r64 %_23687~2':(_lst)◂(_stg) %_23708~4':_stg }
; _f21559 { 7' 6' } ⊢ { 6' 7' 8' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000000110.. |},{ 7' 6' } ⊢ { 0' 1' }
	mov r13,rdx
	bt r12,7
	jc LB_23928
	btr r12,0
	jmp LB_23929
LB_23928:
	bts r12,0
LB_23929:
	mov r14,rcx
	bt r12,6
	jc LB_23930
	btr r12,1
	jmp LB_23931
LB_23930:
	bts r12,1
LB_23931:
	call NS_E_21559
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_23932
	btr r12,6
	jmp LB_23933
LB_23932:
	bts r12,6
LB_23933:
	mov rdx,r14
	bt r12,1
	jc LB_23934
	btr r12,7
	jmp LB_23935
LB_23934:
	bts r12,7
LB_23935:
	mov QWORD [st_vct+8*8],r9
	bt r12,3
	jc LB_23938
	btr r12,8
	jmp LB_23939
LB_23938:
	bts r12,8
LB_23939:
	mov rsi,1
	bt r12,8
	jc LB_23936
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_23936
	jmp LB_23937
LB_23936:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_23937:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_23926
	btr r12,5
	jmp LB_23927
LB_23926:
	bts r12,5
LB_23927:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_23924
	btr r12,4
	jmp LB_23925
LB_23924:
	bts r12,4
LB_23925:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_23922
	btr r12,3
	jmp LB_23923
LB_23922:
	bts r12,3
LB_23923:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_23920
	btr r12,2
	jmp LB_23921
LB_23920:
	bts r12,2
LB_23921:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_23918
	btr r12,1
	jmp LB_23919
LB_23918:
	bts r12,1
LB_23919:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23916
	btr r12,0
	jmp LB_23917
LB_23916:
	bts r12,0
LB_23917:
	add rsp,56
; _f24 { %_23714 %_23715 %_23716 } ⊢ { %_23717 %_23718 %_23719 } : { %_23717 %_23718 %_23719 }
 ; {>  %_23710~5':_stg %_23704~3':(_opn)◂(_p21558) %_23715~7':_r64 %_23703~1':_r64 %_23702~0':_stg %_23714~6':_stg %_23716~8':(_opn)◂(_p21558) %_23687~2':(_lst)◂(_stg) %_23708~4':_stg }
; _f24 { 6' 7' 8' } ⊢ { 6' 7' 8' }
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000001110.. |},{ 6' 7' 8' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,rcx
	bt r12,6
	jc LB_23954
	btr r12,1
	jmp LB_23955
LB_23954:
	bts r12,1
LB_23955:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_23952
	btr QWORD [rdi],0
	jmp LB_23953
LB_23952:
	bts QWORD [rdi],0
LB_23953:
	mov r14,rdx
	bt r12,7
	jc LB_23958
	btr r12,1
	jmp LB_23959
LB_23958:
	bts r12,1
LB_23959:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_23956
	btr QWORD [rdi],1
	jmp LB_23957
LB_23956:
	bts QWORD [rdi],1
LB_23957:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_23962
	btr r12,1
	jmp LB_23963
LB_23962:
	bts r12,1
LB_23963:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_23960
	btr QWORD [rdi],2
	jmp LB_23961
LB_23960:
	bts QWORD [rdi],2
LB_23961:
	call NS_E_24
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_23966
	btr r12,1
	jmp LB_23967
LB_23966:
	bts r12,1
LB_23967:
	mov rcx,r14
	bt r12,1
	jc LB_23964
	btr r12,6
	jmp LB_23965
LB_23964:
	bts r12,6
LB_23965:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_23970
	btr r12,1
	jmp LB_23971
LB_23970:
	bts r12,1
LB_23971:
	mov rdx,r14
	bt r12,1
	jc LB_23968
	btr r12,7
	jmp LB_23969
LB_23968:
	bts r12,7
LB_23969:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_23974
	btr r12,1
	jmp LB_23975
LB_23974:
	bts r12,1
LB_23975:
	mov QWORD [st_vct+8*8],r14
	bt r12,1
	jc LB_23972
	btr r12,8
	jmp LB_23973
LB_23972:
	bts r12,8
LB_23973:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_23950
	btr r12,5
	jmp LB_23951
LB_23950:
	bts r12,5
LB_23951:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_23948
	btr r12,4
	jmp LB_23949
LB_23948:
	bts r12,4
LB_23949:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_23946
	btr r12,3
	jmp LB_23947
LB_23946:
	bts r12,3
LB_23947:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_23944
	btr r12,2
	jmp LB_23945
LB_23944:
	bts r12,2
LB_23945:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_23942
	btr r12,1
	jmp LB_23943
LB_23942:
	bts r12,1
LB_23943:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_23940
	btr r12,0
	jmp LB_23941
LB_23940:
	bts r12,0
LB_23941:
	add rsp,56
; ∎ {  }
 ; {>  %_23710~5':_stg %_23704~3':(_opn)◂(_p21558) %_23719~8':(_opn)◂(_p21558) %_23718~7':_r64 %_23703~1':_r64 %_23702~0':_stg %_23717~6':_stg %_23687~2':(_lst)◂(_stg) %_23708~4':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_23976
	mov rdi,r11
	call dlt
LB_23976:
	bt r12,3
	jc LB_23977
	mov rdi,r9
	call dlt
LB_23977:
	bt r12,8
	jc LB_23978
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_23978:
	bt r12,7
	jc LB_23979
	mov rdi,rdx
	call dlt
LB_23979:
	bt r12,1
	jc LB_23980
	mov rdi,r14
	call dlt
LB_23980:
	bt r12,0
	jc LB_23981
	mov rdi,r13
	call dlt
LB_23981:
	bt r12,6
	jc LB_23982
	mov rdi,rcx
	call dlt
LB_23982:
	bt r12,2
	jc LB_23983
	mov rdi,r8
	call dlt
LB_23983:
	bt r12,4
	jc LB_23984
	mov rdi,r10
	call dlt
LB_23984:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_23908:
	mov r15,0
LB_23986:
	cmp r15,0
	jz LB_23987
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_23986
LB_23987:
; ∎ {  }
 ; {>  %_23710~5':_stg %_23704~3':(_opn)◂(_p21558) %_23703~1':_r64 %_23702~0':_stg %_23711~6':(_opn)◂(_stg) %_23687~2':(_lst)◂(_stg) %_23708~4':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_23988
	mov rdi,r11
	call dlt
LB_23988:
	bt r12,3
	jc LB_23989
	mov rdi,r9
	call dlt
LB_23989:
	bt r12,1
	jc LB_23990
	mov rdi,r14
	call dlt
LB_23990:
	bt r12,0
	jc LB_23991
	mov rdi,r13
	call dlt
LB_23991:
	bt r12,6
	jc LB_23992
	mov rdi,rcx
	call dlt
LB_23992:
	bt r12,2
	jc LB_23993
	mov rdi,r8
	call dlt
LB_23993:
	bt r12,4
	jc LB_23994
	mov rdi,r10
	call dlt
LB_23994:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_23985:
MTC_LB_23842:
section .data
	NS_E_DYN_19962:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_19962
	NS_E_DYN_19965:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_19965
	NS_E_DYN_19966:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_19966
	NS_E_DYN_19967:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_19967
	NS_E_DYN_19968:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_19968
	NS_E_DYN_19982:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_19982
	NS_E_DYN_20025:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20025
	NS_E_DYN_20035:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20035
	NS_E_DYN_20036:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20036
	NS_E_DYN_20037:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20037
	NS_E_DYN_20255:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20255
	NS_E_DYN_20294:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20294
	NS_E_DYN_20333:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20333
	NS_E_DYN_20372:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20372
	NS_E_DYN_20403:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20403
	NS_E_DYN_20404:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20404
	NS_E_DYN_20405:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20405
	NS_E_DYN_20532:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20532
	NS_E_DYN_20591:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20592:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20613:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20614:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20615:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_20616:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_20617:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_20618:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 5
	NS_E_DYN_20619:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 6
	NS_E_DYN_20620:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 7
	NS_E_DYN_20621:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 8
	NS_E_DYN_20622:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 9
	NS_E_DYN_20623:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20624:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20625:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20626:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20627:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20628:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20629:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20630:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20631:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_20632:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20633:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20634:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_20635:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20636:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20637:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20638:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20639:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20640:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20641:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20642:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20643:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20644:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20645:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_20646:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_20647:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20648:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20649:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_20650:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20651:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20652:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_20653:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20654:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20655:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20656:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20657:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20658:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20659:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20660:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20661:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20662:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20663:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_20664:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_20665:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_20666:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20667:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20668:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_20669:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20670:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20671:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_20672:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_20674:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_20675:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_20676:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20676
	NS_E_DYN_20677:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20677
	NS_E_DYN_20678:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20678
	NS_E_DYN_20679:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_20679
	NS_E_DYN_21298:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_21298
	NS_E_DYN_21399:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_21399
	CST_DYN_21461:
		dq 0x0000_0001_00_82_ffff
		dq 1
	CST_DYN_23720:
		dq 0x0000_0001_00_82_ffff
		dq 1
