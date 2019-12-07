%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_29945
	call NS_E_30757
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
	pop r14
	ret
NS_E_28968:
NS_E_RDI_28968:
NS_E_28968_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_28969
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_28969:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_28971:
NS_E_RDI_28971:
NS_E_28971_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_28971_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_28971_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_28972:
NS_E_RDI_28972:
NS_E_28972_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_28972_LB_0
	cmp r11,57
	ja NS_E_28972_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_28972_LB_0:
	mov rax,0
	ret
NS_E_28974:
NS_E_RDI_28974:
NS_E_28974_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_28974_LB_0
	cmp r11,122
	ja NS_E_28974_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_28974_LB_0:
	mov rax,0
	ret
NS_E_28973:
NS_E_RDI_28973:
NS_E_28973_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_28973_LB_0
	cmp r11,90
	ja NS_E_28973_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_28973_LB_0:
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
	mov rdi,r13
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
	mov rax,r8
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
	mov rax,r8
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
	mov r8,rax
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
NS_E_28970:
NS_E_RDI_28970:
NS_E_28970_ETR_TBL:
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
	jz NS_E_28970_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_28970_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_28988:
; 	|» { 0' 1' }
NS_E_RDI_28988:
MTC_LB_28989:
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_28990
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_28991
	bt QWORD [rax],0
	jc LB_28992
	btr r12,1
	jmp LB_28993
LB_28992:
	bts r12,1
LB_28993:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_28991:
	push r14
	mov r14,rax
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_28996
	btr r12,4
	jmp LB_28997
LB_28996:
	bts r12,4
LB_28997:
	mov r8,r10
	bt r12,4
	jc LB_28994
	btr r12,2
	jmp LB_28995
LB_28994:
	bts r12,2
LB_28995:
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_29000
	btr r12,4
	jmp LB_29001
LB_29000:
	bts r12,4
LB_29001:
	mov r9,r10
	bt r12,4
	jc LB_28998
	btr r12,3
	jmp LB_28999
LB_28998:
	bts r12,3
LB_28999:
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_29002:
	cmp r15,0
	jz LB_29003
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29002
LB_29003:
; _f38 %_28975 ⊢ %_28979 : %_28979
 ; {>  %_28977~2':_r64 %_28978~3':(_lst)◂(_r64) %_28975~0':_r64 }
	add r13,1
; _f28988 { %_28979 %_28978 } ⊢ { %_28980 %_28981 } : { %_28980 %_28981 }
 ; {>  %_28977~2':_r64 %_28979~0':_r64 %_28978~3':(_lst)◂(_r64) }
; _f28988 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_29006
	btr r12,1
	jmp LB_29007
LB_29006:
	bts r12,1
LB_29007:
	call NS_E_28988
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_29004
	btr r12,2
	jmp LB_29005
LB_29004:
	bts r12,2
LB_29005:
	add rsp,16
; _f37 %_28980 ⊢ %_28982 : %_28982
 ; {>  %_28981~1':_stg %_28977~2':_r64 %_28980~0':_r64 }
	sub r13,1
; _f16 { %_28981 %_28982 %_28977 } ⊢ { %_28983 %_28984 %_28985 } : { %_28983 %_28984 %_28985 }
 ; {>  %_28981~1':_stg %_28982~0':_r64 %_28977~2':_r64 }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_29008
	btr r12,3
	jmp LB_29009
LB_29008:
	bts r12,3
LB_29009:
	mov r14,r13
	bt r12,0
	jc LB_29010
	btr r12,1
	jmp LB_29011
LB_29010:
	bts r12,1
LB_29011:
	mov r13,r9
	bt r12,3
	jc LB_29012
	btr r12,0
	jmp LB_29013
LB_29012:
	bts r12,0
LB_29013:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_28984 %_28983 }
 ; {>  %_28984~1':_r64 %_28983~0':_stg %_28985~2':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_29014
	mov rdi,r8
	call dlt
LB_29014:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_29015
	btr r12,2
	jmp LB_29016
LB_29015:
	bts r12,2
LB_29016:
	mov r14,r13
	bt r12,0
	jc LB_29017
	btr r12,1
	jmp LB_29018
LB_29017:
	bts r12,1
LB_29018:
	mov r13,r8
	bt r12,2
	jc LB_29019
	btr r12,0
	jmp LB_29020
LB_29019:
	bts r12,0
LB_29020:
	ret
MTC_LB_28990:
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_29021
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_29022
	bt QWORD [rax],0
	jc LB_29023
	btr r12,1
	jmp LB_29024
LB_29023:
	bts r12,1
LB_29024:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_29022:
	push r14
	mov r14,rax
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_29025:
	cmp r15,0
	jz LB_29026
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29025
LB_29026:
; _f14 %_28975 ⊢ { %_28986 %_28987 } : { %_28986 %_28987 }
 ; {>  %_28975~0':_r64 }
; _f14 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_14
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_28986 %_28987 }
 ; {>  %_28986~0':_r64 %_28987~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_29021:
NS_E_29031:
; 	|» 0'
NS_E_RDI_29031:
; » 0xr0 |~ {  } ⊢ %_29028 : %_29028
 ; {>  %_29027~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_29028
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f28988 { %_29028 %_29027 } ⊢ { %_29029 %_29030 } : { %_29029 %_29030 }
 ; {>  %_29027~0':(_lst)◂(_r64) %_29028~1':_r64 }
; _f28988 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_29032
	btr r12,2
	jmp LB_29033
LB_29032:
	bts r12,2
LB_29033:
	mov r14,r13
	bt r12,0
	jc LB_29034
	btr r12,1
	jmp LB_29035
LB_29034:
	bts r12,1
LB_29035:
	mov r13,r8
	bt r12,2
	jc LB_29036
	btr r12,0
	jmp LB_29037
LB_29036:
	bts r12,0
LB_29037:
	call NS_E_28988
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_29030
 ; {>  %_29030~1':_stg %_29029~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_29038
	mov rdi,r13
	call dlt
LB_29038:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_29039
	btr r12,0
	jmp LB_29040
LB_29039:
	bts r12,0
LB_29040:
	ret
NS_E_29041:
NS_E_RDI_29041:
NS_E_29041_ETR_TBL:
NS_E_29041_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_29081
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_29081
	jmp LB_29082
LB_29081:
	jmp NS_E_29041_MTC_0_failed
LB_29082:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_29042_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29086
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29087
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29087:
	jmp NS_E_29041_MTC_0_failed
LB_29086:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_29074
	btr r12,1
	jmp LB_29075
LB_29074:
	bts r12,1
LB_29075:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29072
	btr r12,0
	jmp LB_29073
LB_29072:
	bts r12,0
LB_29073:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_29069
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_29089
	btr r12,2
	jmp LB_29090
LB_29089:
	bts r12,2
LB_29090:
	mov r13,r14
	bt r12,1
	jc LB_29091
	btr r12,0
	jmp LB_29092
LB_29091:
	bts r12,0
LB_29092:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f29031 %_29044 ⊢ %_29045 : %_29045
 ; {>  %_29044~0':(_lst)◂(_r64) }
; _f29031 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_29031
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_29045 ⊢ %_29046 : %_29046
 ; {>  %_29045~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_29046
 ; {>  %_29046~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29067
	btr r12,3
	jmp LB_29068
LB_29067:
	bts r12,3
LB_29068:
	mov r8,0
	bts r12,2
	ret
LB_29069:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29071
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29070
LB_29071:
	add rsp,8
	ret
NS_E_29041_MTC_0_failed:
	add rsp,32
	pop r14
LB_29070:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29042:
NS_E_RDI_29042:
NS_E_29042_ETR_TBL:
NS_E_29042_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_29117
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_29117
	jmp LB_29118
LB_29117:
	jmp NS_E_29042_MTC_0_failed
LB_29118:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_29043_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29122
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29123
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29123:
	jmp NS_E_29042_MTC_0_failed
LB_29122:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_29042_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29128
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_29129
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_29129:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29130
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29130:
	jmp NS_E_29042_MTC_0_failed
LB_29128:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_29110
	btr r12,2
	jmp LB_29111
LB_29110:
	bts r12,2
LB_29111:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_29108
	btr r12,1
	jmp LB_29109
LB_29108:
	bts r12,1
LB_29109:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29106
	btr r12,0
	jmp LB_29107
LB_29106:
	bts r12,0
LB_29107:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_29103
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_29132
	btr r12,3
	jmp LB_29133
LB_29132:
	bts r12,3
LB_29133:
	mov r14,r8
	bt r12,2
	jc LB_29134
	btr r12,1
	jmp LB_29135
LB_29134:
	bts r12,1
LB_29135:
	mov r8,r13
	bt r12,0
	jc LB_29136
	btr r12,2
	jmp LB_29137
LB_29136:
	bts r12,2
LB_29137:
	mov r13,r9
	bt r12,3
	jc LB_29138
	btr r12,0
	jmp LB_29139
LB_29138:
	bts r12,0
LB_29139:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_29047 %_29048 } ⊢ %_29049 : %_29049
 ; {>  %_29047~0':_r64 %_29048~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_29049 ⊢ %_29050 : %_29050
 ; {>  %_29049~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_29050
 ; {>  %_29050~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_29097
	btr r12,2
	jmp LB_29098
LB_29097:
	bts r12,2
LB_29098:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_29095
	btr QWORD [rdi],0
	jmp LB_29096
LB_29095:
	bts QWORD [rdi],0
LB_29096:
	mov r8,r14
	bt r12,1
	jc LB_29101
	btr r12,2
	jmp LB_29102
LB_29101:
	bts r12,2
LB_29102:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_29099
	btr QWORD [rdi],1
	jmp LB_29100
LB_29099:
	bts QWORD [rdi],1
LB_29100:
	mov rsi,1
	bt r12,3
	jc LB_29093
	mov rsi,0
	bt r9,0
	jc LB_29093
	jmp LB_29094
LB_29093:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_29094:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_29103:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29105
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29104
LB_29105:
	add rsp,8
	ret
NS_E_29042_MTC_0_failed:
	add rsp,48
	pop r14
LB_29104:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_29152
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_29152
	jmp LB_29153
LB_29152:
	jmp NS_E_29042_MTC_1_failed
LB_29153:
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
	jc LB_29145
	btr r12,0
	jmp LB_29146
LB_29145:
	bts r12,0
LB_29146:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29142
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_29051 : %_29051
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_29051 ⊢ %_29052 : %_29052
 ; {>  %_29051~°1◂{  }:(_lst)◂(t7749'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_29052
 ; {>  %_29052~°0◂°1◂{  }:(_opn)◂((_lst)◂(t7752'(0))) }
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
	jc LB_29140
	mov rsi,0
	bt r9,0
	jc LB_29140
	jmp LB_29141
LB_29140:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_29141:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_29142:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29144
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29143
LB_29144:
	add rsp,8
	ret
NS_E_29042_MTC_1_failed:
	add rsp,16
	pop r14
LB_29143:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_28968_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29174
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29042_MTC_2_failed
LB_29174:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_29042_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29179
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29180
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29180:
	jmp NS_E_29042_MTC_2_failed
LB_29179:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_29169
	btr r12,1
	jmp LB_29170
LB_29169:
	bts r12,1
LB_29170:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29167
	btr r12,0
	jmp LB_29168
LB_29167:
	bts r12,0
LB_29168:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_29164
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_29053 %_29054 } ⊢ %_29055 : %_29055
 ; {>  %_29053~0':_r64 %_29054~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_29055 ⊢ %_29056 : %_29056
 ; {>  %_29055~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_29056
 ; {>  %_29056~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_29158
	btr r12,2
	jmp LB_29159
LB_29158:
	bts r12,2
LB_29159:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_29156
	btr QWORD [rdi],0
	jmp LB_29157
LB_29156:
	bts QWORD [rdi],0
LB_29157:
	mov r8,r14
	bt r12,1
	jc LB_29162
	btr r12,2
	jmp LB_29163
LB_29162:
	bts r12,2
LB_29163:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_29160
	btr QWORD [rdi],1
	jmp LB_29161
LB_29160:
	bts QWORD [rdi],1
LB_29161:
	mov rsi,1
	bt r12,3
	jc LB_29154
	mov rsi,0
	bt r9,0
	jc LB_29154
	jmp LB_29155
LB_29154:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_29155:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_29164:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29166
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29165
LB_29166:
	add rsp,8
	ret
NS_E_29042_MTC_2_failed:
	add rsp,32
	pop r14
LB_29165:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29043:
NS_E_RDI_29043:
NS_E_29043_ETR_TBL:
NS_E_29043_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_29194
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_29194
	jmp LB_29195
LB_29194:
	jmp NS_E_29043_MTC_0_failed
LB_29195:
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
	jc LB_29187
	btr r12,0
	jmp LB_29188
LB_29187:
	bts r12,0
LB_29188:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29184
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_29057 : %_29057
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_29057
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_29057 ⊢ %_29058 : %_29058
 ; {>  %_29057~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29058
 ; {>  %_29058~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29182
	btr r12,3
	jmp LB_29183
LB_29182:
	bts r12,3
LB_29183:
	mov r8,0
	bts r12,2
	ret
LB_29184:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29186
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29185
LB_29186:
	add rsp,8
	ret
NS_E_29043_MTC_0_failed:
	add rsp,16
	pop r14
LB_29185:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_29208
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_29208
	jmp LB_29209
LB_29208:
	jmp NS_E_29043_MTC_1_failed
LB_29209:
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
	jc LB_29201
	btr r12,0
	jmp LB_29202
LB_29201:
	bts r12,0
LB_29202:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29198
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_29059 : %_29059
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_29059
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_29059 ⊢ %_29060 : %_29060
 ; {>  %_29059~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29060
 ; {>  %_29060~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29196
	btr r12,3
	jmp LB_29197
LB_29196:
	bts r12,3
LB_29197:
	mov r8,0
	bts r12,2
	ret
LB_29198:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29200
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29199
LB_29200:
	add rsp,8
	ret
NS_E_29043_MTC_1_failed:
	add rsp,16
	pop r14
LB_29199:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_29222
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_29222
	jmp LB_29223
LB_29222:
	jmp NS_E_29043_MTC_2_failed
LB_29223:
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
	jc LB_29215
	btr r12,0
	jmp LB_29216
LB_29215:
	bts r12,0
LB_29216:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29212
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_29061 : %_29061
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_29061
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_29061 ⊢ %_29062 : %_29062
 ; {>  %_29061~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29062
 ; {>  %_29062~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29210
	btr r12,3
	jmp LB_29211
LB_29210:
	bts r12,3
LB_29211:
	mov r8,0
	bts r12,2
	ret
LB_29212:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29214
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29213
LB_29214:
	add rsp,8
	ret
NS_E_29043_MTC_2_failed:
	add rsp,16
	pop r14
LB_29213:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_29236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_29236
	jmp LB_29237
LB_29236:
	jmp NS_E_29043_MTC_3_failed
LB_29237:
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
	jc LB_29229
	btr r12,0
	jmp LB_29230
LB_29229:
	bts r12,0
LB_29230:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29226
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_29063 : %_29063
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_29063
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_29063 ⊢ %_29064 : %_29064
 ; {>  %_29063~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29064
 ; {>  %_29064~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29224
	btr r12,3
	jmp LB_29225
LB_29224:
	bts r12,3
LB_29225:
	mov r8,0
	bts r12,2
	ret
LB_29226:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29228
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29227
LB_29228:
	add rsp,8
	ret
NS_E_29043_MTC_3_failed:
	add rsp,16
	pop r14
LB_29227:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_29250
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_29250
	jmp LB_29251
LB_29250:
	jmp NS_E_29043_MTC_4_failed
LB_29251:
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
	jc LB_29243
	btr r12,0
	jmp LB_29244
LB_29243:
	bts r12,0
LB_29244:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29240
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_29065 : %_29065
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_29065
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_29065 ⊢ %_29066 : %_29066
 ; {>  %_29065~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29066
 ; {>  %_29066~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29238
	btr r12,3
	jmp LB_29239
LB_29238:
	bts r12,3
LB_29239:
	mov r8,0
	bts r12,2
	ret
LB_29240:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29242
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29241
LB_29242:
	add rsp,8
	ret
NS_E_29043_MTC_4_failed:
	add rsp,16
	pop r14
LB_29241:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29252:
NS_E_RDI_29252:
NS_E_29252_ETR_TBL:
NS_E_29252_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_28968_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29288
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29252_MTC_0_failed
LB_29288:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29283
	btr r12,0
	jmp LB_29284
LB_29283:
	bts r12,0
LB_29284:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29280
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_29254 : %_29254
 ; {>  %_29253~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_29254
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_29255 : %_29255
 ; {>  %_29254~1':_r64 %_29253~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_29255
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f32 { %_29253 %_29254 } ⊢ { %_29256 %_29257 %_29258 } : { %_29256 %_29257 %_29258 }
 ; {>  %_29254~1':_r64 %_29253~0':_r64 %_29255~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f32 { %_29255 %_29256 } ⊢ { %_29259 %_29260 %_29261 } : { %_29259 %_29260 %_29261 }
 ; {>  %_29256~0':_r64 %_29258~3':_r64 %_29257~1':_r64 %_29255~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_29264:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_29265
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_29265
LB_29266:
	cmp r15,0
	jz LB_29267
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29266
LB_29267:
; _some %_29260 ⊢ %_29262 : %_29262
 ; {>  %_29260~0':_r64 %_29259~2':_r64 %_29257~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29262
 ; {>  %_29259~2':_r64 %_29262~°0◂0':(_opn)◂(_r64) %_29257~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_29268
	mov rdi,r8
	call dlt
LB_29268:
	bt r12,1
	jc LB_29269
	mov rdi,r14
	call dlt
LB_29269:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29270
	btr r12,3
	jmp LB_29271
LB_29270:
	bts r12,3
LB_29271:
	mov r8,0
	bts r12,2
	ret
MTC_LB_29265:
LB_29273:
	cmp r15,0
	jz LB_29274
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29273
LB_29274:
; _none {  } ⊢ %_29263 : %_29263
 ; {>  %_29261~4':_r64 %_29260~0':_r64 %_29258~3':_r64 %_29259~2':_r64 %_29257~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_29263
 ; {>  %_29263~°1◂{  }:(_opn)◂(t7827'(0)) %_29261~4':_r64 %_29260~0':_r64 %_29258~3':_r64 %_29259~2':_r64 %_29257~1':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_29275
	mov rdi,r10
	call dlt
LB_29275:
	bt r12,0
	jc LB_29276
	mov rdi,r13
	call dlt
LB_29276:
	bt r12,3
	jc LB_29277
	mov rdi,r9
	call dlt
LB_29277:
	bt r12,2
	jc LB_29278
	mov rdi,r8
	call dlt
LB_29278:
	bt r12,1
	jc LB_29279
	mov rdi,r14
	call dlt
LB_29279:
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
MTC_LB_29272:
LB_29280:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29282
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29281
LB_29282:
	add rsp,8
	ret
NS_E_29252_MTC_0_failed:
	add rsp,16
	pop r14
LB_29281:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29290:
NS_E_RDI_29290:
NS_E_29290_ETR_TBL:
NS_E_29290_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_28968_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29326
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29290_MTC_0_failed
LB_29326:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29321
	btr r12,0
	jmp LB_29322
LB_29321:
	bts r12,0
LB_29322:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29318
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_29292 : %_29292
 ; {>  %_29291~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_29292
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_29293 : %_29293
 ; {>  %_29292~1':_r64 %_29291~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_29293
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f32 { %_29291 %_29292 } ⊢ { %_29294 %_29295 %_29296 } : { %_29294 %_29295 %_29296 }
 ; {>  %_29293~2':_r64 %_29292~1':_r64 %_29291~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f32 { %_29293 %_29294 } ⊢ { %_29297 %_29298 %_29299 } : { %_29297 %_29298 %_29299 }
 ; {>  %_29294~0':_r64 %_29293~2':_r64 %_29296~3':_r64 %_29295~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_29302:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_29303
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_29303
LB_29304:
	cmp r15,0
	jz LB_29305
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29304
LB_29305:
; _some %_29298 ⊢ %_29300 : %_29300
 ; {>  %_29298~0':_r64 %_29297~2':_r64 %_29295~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29300
 ; {>  %_29297~2':_r64 %_29300~°0◂0':(_opn)◂(_r64) %_29295~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_29306
	mov rdi,r8
	call dlt
LB_29306:
	bt r12,1
	jc LB_29307
	mov rdi,r14
	call dlt
LB_29307:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29308
	btr r12,3
	jmp LB_29309
LB_29308:
	bts r12,3
LB_29309:
	mov r8,0
	bts r12,2
	ret
MTC_LB_29303:
LB_29311:
	cmp r15,0
	jz LB_29312
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29311
LB_29312:
; _none {  } ⊢ %_29301 : %_29301
 ; {>  %_29298~0':_r64 %_29297~2':_r64 %_29299~4':_r64 %_29296~3':_r64 %_29295~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_29301
 ; {>  %_29298~0':_r64 %_29297~2':_r64 %_29299~4':_r64 %_29296~3':_r64 %_29301~°1◂{  }:(_opn)◂(t7854'(0)) %_29295~1':_r64 }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_29313
	mov rdi,r13
	call dlt
LB_29313:
	bt r12,2
	jc LB_29314
	mov rdi,r8
	call dlt
LB_29314:
	bt r12,4
	jc LB_29315
	mov rdi,r10
	call dlt
LB_29315:
	bt r12,3
	jc LB_29316
	mov rdi,r9
	call dlt
LB_29316:
	bt r12,1
	jc LB_29317
	mov rdi,r14
	call dlt
LB_29317:
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
MTC_LB_29310:
LB_29318:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29320
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29319
LB_29320:
	add rsp,8
	ret
NS_E_29290_MTC_0_failed:
	add rsp,16
	pop r14
LB_29319:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29328:
NS_E_RDI_29328:
NS_E_29328_ETR_TBL:
NS_E_29328_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_28968_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29364
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29328_MTC_0_failed
LB_29364:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29359
	btr r12,0
	jmp LB_29360
LB_29359:
	bts r12,0
LB_29360:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29356
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_29330 : %_29330
 ; {>  %_29329~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_29330
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_29331 : %_29331
 ; {>  %_29330~1':_r64 %_29329~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_29331
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f32 { %_29329 %_29330 } ⊢ { %_29332 %_29333 %_29334 } : { %_29332 %_29333 %_29334 }
 ; {>  %_29330~1':_r64 %_29329~0':_r64 %_29331~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f32 { %_29331 %_29332 } ⊢ { %_29335 %_29336 %_29337 } : { %_29335 %_29336 %_29337 }
 ; {>  %_29332~0':_r64 %_29334~3':_r64 %_29333~1':_r64 %_29331~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_29340:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_29341
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_29341
LB_29342:
	cmp r15,0
	jz LB_29343
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29342
LB_29343:
; _some %_29336 ⊢ %_29338 : %_29338
 ; {>  %_29335~2':_r64 %_29333~1':_r64 %_29336~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29338
 ; {>  %_29338~°0◂0':(_opn)◂(_r64) %_29335~2':_r64 %_29333~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_29344
	mov rdi,r8
	call dlt
LB_29344:
	bt r12,1
	jc LB_29345
	mov rdi,r14
	call dlt
LB_29345:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29346
	btr r12,3
	jmp LB_29347
LB_29346:
	bts r12,3
LB_29347:
	mov r8,0
	bts r12,2
	ret
MTC_LB_29341:
LB_29349:
	cmp r15,0
	jz LB_29350
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29349
LB_29350:
; _none {  } ⊢ %_29339 : %_29339
 ; {>  %_29335~2':_r64 %_29334~3':_r64 %_29333~1':_r64 %_29336~0':_r64 %_29337~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_29339
 ; {>  %_29339~°1◂{  }:(_opn)◂(t7881'(0)) %_29335~2':_r64 %_29334~3':_r64 %_29333~1':_r64 %_29336~0':_r64 %_29337~4':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_29351
	mov rdi,r8
	call dlt
LB_29351:
	bt r12,3
	jc LB_29352
	mov rdi,r9
	call dlt
LB_29352:
	bt r12,1
	jc LB_29353
	mov rdi,r14
	call dlt
LB_29353:
	bt r12,0
	jc LB_29354
	mov rdi,r13
	call dlt
LB_29354:
	bt r12,4
	jc LB_29355
	mov rdi,r10
	call dlt
LB_29355:
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
MTC_LB_29348:
LB_29356:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29358
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29357
LB_29358:
	add rsp,8
	ret
NS_E_29328_MTC_0_failed:
	add rsp,16
	pop r14
LB_29357:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29366:
NS_E_RDI_29366:
NS_E_29366_ETR_TBL:
NS_E_29366_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_29328_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29381
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29366_MTC_0_failed
LB_29381:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29376
	btr r12,0
	jmp LB_29377
LB_29376:
	bts r12,0
LB_29377:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29373
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_29367 ⊢ %_29368 : %_29368
 ; {>  %_29367~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29368
 ; {>  %_29368~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29371
	btr r12,3
	jmp LB_29372
LB_29371:
	bts r12,3
LB_29372:
	mov r8,0
	bts r12,2
	ret
LB_29373:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29375
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29374
LB_29375:
	add rsp,8
	ret
NS_E_29366_MTC_0_failed:
	add rsp,16
	pop r14
LB_29374:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_29290_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29393
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29366_MTC_1_failed
LB_29393:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29388
	btr r12,0
	jmp LB_29389
LB_29388:
	bts r12,0
LB_29389:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29385
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_29369 ⊢ %_29370 : %_29370
 ; {>  %_29369~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29370
 ; {>  %_29370~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29383
	btr r12,3
	jmp LB_29384
LB_29383:
	bts r12,3
LB_29384:
	mov r8,0
	bts r12,2
	ret
LB_29385:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29387
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29386
LB_29387:
	add rsp,8
	ret
NS_E_29366_MTC_1_failed:
	add rsp,16
	pop r14
LB_29386:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29395:
NS_E_RDI_29395:
NS_E_29395_ETR_TBL:
NS_E_29395_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_29366_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29443
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29395_MTC_0_failed
LB_29443:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_29396_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29448
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29449
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29449:
	jmp NS_E_29395_MTC_0_failed
LB_29448:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_29438
	btr r12,1
	jmp LB_29439
LB_29438:
	bts r12,1
LB_29439:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29436
	btr r12,0
	jmp LB_29437
LB_29436:
	bts r12,0
LB_29437:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_29433
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_29398 %_29399 } ⊢ %_29400 : %_29400
 ; {>  %_29399~1':(_lst)◂(_r64) %_29398~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f29031 %_29400 ⊢ %_29401 : %_29401
 ; {>  %_29400~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f29031 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_29419
	btr r12,2
	jmp LB_29420
LB_29419:
	bts r12,2
LB_29420:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_29425
	btr r12,3
	jmp LB_29426
LB_29425:
	bts r12,3
LB_29426:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_29423
	btr QWORD [rdi],0
	jmp LB_29424
LB_29423:
	bts QWORD [rdi],0
LB_29424:
	mov r9,r14
	bt r12,1
	jc LB_29429
	btr r12,3
	jmp LB_29430
LB_29429:
	bts r12,3
LB_29430:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_29427
	btr QWORD [rdi],1
	jmp LB_29428
LB_29427:
	bts QWORD [rdi],1
LB_29428:
	mov rsi,1
	bt r12,0
	jc LB_29421
	mov rsi,0
	bt r13,0
	jc LB_29421
	jmp LB_29422
LB_29421:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_29422:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_29031
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_29401 ⊢ %_29402 : %_29402
 ; {>  %_29401~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_29402
 ; {>  %_29402~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29431
	btr r12,3
	jmp LB_29432
LB_29431:
	bts r12,3
LB_29432:
	mov r8,0
	bts r12,2
	ret
LB_29433:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29435
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29434
LB_29435:
	add rsp,8
	ret
NS_E_29395_MTC_0_failed:
	add rsp,32
	pop r14
LB_29434:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29396:
NS_E_RDI_29396:
NS_E_29396_ETR_TBL:
NS_E_29396_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_29397_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29471
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29396_MTC_0_failed
LB_29471:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_29396_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29476
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29477
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29477:
	jmp NS_E_29396_MTC_0_failed
LB_29476:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_29466
	btr r12,1
	jmp LB_29467
LB_29466:
	bts r12,1
LB_29467:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29464
	btr r12,0
	jmp LB_29465
LB_29464:
	bts r12,0
LB_29465:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_29461
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_29403 %_29404 } ⊢ %_29405 : %_29405
 ; {>  %_29404~1':(_lst)◂(_r64) %_29403~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_29405 ⊢ %_29406 : %_29406
 ; {>  %_29405~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_29406
 ; {>  %_29406~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_29455
	btr r12,2
	jmp LB_29456
LB_29455:
	bts r12,2
LB_29456:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_29453
	btr QWORD [rdi],0
	jmp LB_29454
LB_29453:
	bts QWORD [rdi],0
LB_29454:
	mov r8,r14
	bt r12,1
	jc LB_29459
	btr r12,2
	jmp LB_29460
LB_29459:
	bts r12,2
LB_29460:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_29457
	btr QWORD [rdi],1
	jmp LB_29458
LB_29457:
	bts QWORD [rdi],1
LB_29458:
	mov rsi,1
	bt r12,3
	jc LB_29451
	mov rsi,0
	bt r9,0
	jc LB_29451
	jmp LB_29452
LB_29451:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_29452:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_29461:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29463
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29462
LB_29463:
	add rsp,8
	ret
NS_E_29396_MTC_0_failed:
	add rsp,32
	pop r14
LB_29462:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_29481
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_29407 : %_29407
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_29407 ⊢ %_29408 : %_29408
 ; {>  %_29407~°1◂{  }:(_lst)◂(t7925'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_29408
 ; {>  %_29408~°0◂°1◂{  }:(_opn)◂((_lst)◂(t7928'(0))) }
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
	jc LB_29479
	mov rsi,0
	bt r9,0
	jc LB_29479
	jmp LB_29480
LB_29479:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_29480:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_29481:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29483
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29482
LB_29483:
	add rsp,8
	ret
NS_E_29396_MTC_1_failed:
	add rsp,0
	pop r14
LB_29482:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29397:
NS_E_RDI_29397:
NS_E_29397_ETR_TBL:
NS_E_29397_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_29366_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29494
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29397_MTC_0_failed
LB_29494:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29489
	btr r12,0
	jmp LB_29490
LB_29489:
	bts r12,0
LB_29490:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29486
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_29409 ⊢ %_29410 : %_29410
 ; {>  %_29409~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29410
 ; {>  %_29410~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29484
	btr r12,3
	jmp LB_29485
LB_29484:
	bts r12,3
LB_29485:
	mov r8,0
	bts r12,2
	ret
LB_29486:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29488
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29487
LB_29488:
	add rsp,8
	ret
NS_E_29397_MTC_0_failed:
	add rsp,16
	pop r14
LB_29487:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_29252_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29513
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29397_MTC_1_failed
LB_29513:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29508
	btr r12,0
	jmp LB_29509
LB_29508:
	bts r12,0
LB_29509:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29505
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; 	» "P0" _ ⊢ 1' : %_29412
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_30_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f20 %_29412 ⊢ %_29413 : %_29413
 ; {>  %_29412~1':_stg %_29411~0':_r64 }
; _f20 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_29498
	btr r12,0
	jmp LB_29499
LB_29498:
	bts r12,0
LB_29499:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_29500
	btr r12,1
	jmp LB_29501
LB_29500:
	bts r12,1
LB_29501:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_29496
	btr r12,0
	jmp LB_29497
LB_29496:
	bts r12,0
LB_29497:
	add rsp,16
; _some %_29411 ⊢ %_29414 : %_29414
 ; {>  %_29413~1':_stg %_29411~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29414
 ; {>  %_29413~1':_stg %_29414~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_29502
	mov rdi,r14
	call dlt
LB_29502:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29503
	btr r12,3
	jmp LB_29504
LB_29503:
	bts r12,3
LB_29504:
	mov r8,0
	bts r12,2
	ret
LB_29505:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29507
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29506
LB_29507:
	add rsp,8
	ret
NS_E_29397_MTC_1_failed:
	add rsp,16
	pop r14
LB_29506:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_29528
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_29528
	jmp LB_29529
LB_29528:
	jmp NS_E_29397_MTC_2_failed
LB_29529:
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
	jc LB_29521
	btr r12,0
	jmp LB_29522
LB_29521:
	bts r12,0
LB_29522:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29518
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 	» "P1" _ ⊢ 0' : %_29415
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_31_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f20 %_29415 ⊢ %_29416 : %_29416
 ; {>  %_29415~0':_stg }
; _f20 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » 0xr5f |~ {  } ⊢ %_29417 : %_29417
 ; {>  %_29416~0':_stg }
; 	» 0xr5f _ ⊢ 1' : %_29417
	mov rdi,0x5f
	mov r14,rdi
	bts r12,1
; _some %_29417 ⊢ %_29418 : %_29418
 ; {>  %_29416~0':_stg %_29417~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_29418
 ; {>  %_29416~0':_stg %_29418~°0◂1':(_opn)◂(_r64) }
; 	∎ °0◂1'
	bt r12,0
	jc LB_29515
	mov rdi,r13
	call dlt
LB_29515:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_29516
	btr r12,3
	jmp LB_29517
LB_29516:
	bts r12,3
LB_29517:
	mov r8,0
	bts r12,2
	ret
LB_29518:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29520
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29519
LB_29520:
	add rsp,8
	ret
NS_E_29397_MTC_2_failed:
	add rsp,16
	pop r14
LB_29519:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29530:
NS_E_RDI_29530:
NS_E_29530_ETR_TBL:
NS_E_29530_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_29550
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_29550
	jmp LB_29551
LB_29550:
	jmp NS_E_29530_MTC_0_failed
LB_29551:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_29396_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29555
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29556
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29556:
	jmp NS_E_29530_MTC_0_failed
LB_29555:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_29543
	btr r12,1
	jmp LB_29544
LB_29543:
	bts r12,1
LB_29544:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29541
	btr r12,0
	jmp LB_29542
LB_29541:
	bts r12,0
LB_29542:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_29538
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_29558
	btr r12,2
	jmp LB_29559
LB_29558:
	bts r12,2
LB_29559:
	mov r13,r14
	bt r12,1
	jc LB_29560
	btr r12,0
	jmp LB_29561
LB_29560:
	bts r12,0
LB_29561:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f29031 %_29531 ⊢ %_29532 : %_29532
 ; {>  %_29531~0':(_lst)◂(_r64) }
; _f29031 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_29031
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_29532 ⊢ %_29533 : %_29533
 ; {>  %_29532~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_29533
 ; {>  %_29533~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29536
	btr r12,3
	jmp LB_29537
LB_29536:
	bts r12,3
LB_29537:
	mov r8,0
	bts r12,2
	ret
LB_29538:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29540
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29539
LB_29540:
	add rsp,8
	ret
NS_E_29530_MTC_0_failed:
	add rsp,32
	pop r14
LB_29539:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29572
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29530_MTC_1_failed
LB_29572:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29567
	btr r12,0
	jmp LB_29568
LB_29567:
	bts r12,0
LB_29568:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29564
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_29534 ⊢ %_29535 : %_29535
 ; {>  %_29534~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_29535
 ; {>  %_29535~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29562
	btr r12,3
	jmp LB_29563
LB_29562:
	bts r12,3
LB_29563:
	mov r8,0
	bts r12,2
	ret
LB_29564:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29566
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29565
LB_29566:
	add rsp,8
	ret
NS_E_29530_MTC_1_failed:
	add rsp,16
	pop r14
LB_29565:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29575:
NS_E_RDI_29575:
NS_E_29575_ETR_TBL:
NS_E_29575_TBL:
; c0
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
LB_29583:
	jmp LB_29580
LB_29579:
	add r14,1
LB_29580:
	cmp r14,r10
	jge LB_29581
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_29579
	cmp al,10
	jz LB_29579
	cmp al,32
	jz LB_29579
LB_29581:
	push r10
	push rsi
	call NS_E_29395_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_29582
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_29584
	bts QWORD [rax],0
LB_29584:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_29583
LB_29582:
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
	jc LB_29577
	btr QWORD [rdi],0
LB_29577:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29575_MTC_0_failed:
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
NS_E_29588:
NS_E_RDI_29588:
NS_E_29588_ETR_TBL:
NS_E_29588_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_29675
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_29675
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_29675
	jmp LB_29676
LB_29675:
	jmp NS_E_29588_MTC_0_failed
LB_29676:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_29589_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29680
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29681
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29681:
	jmp NS_E_29588_MTC_0_failed
LB_29680:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_29588_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29686
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_29687
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_29687:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29688
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29688:
	jmp NS_E_29588_MTC_0_failed
LB_29686:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_29668
	btr r12,2
	jmp LB_29669
LB_29668:
	bts r12,2
LB_29669:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_29666
	btr r12,1
	jmp LB_29667
LB_29666:
	bts r12,1
LB_29667:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29664
	btr r12,0
	jmp LB_29665
LB_29664:
	bts r12,0
LB_29665:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_29661
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_29690
	btr r12,3
	jmp LB_29691
LB_29690:
	bts r12,3
LB_29691:
	mov r14,r8
	bt r12,2
	jc LB_29692
	btr r12,1
	jmp LB_29693
LB_29692:
	bts r12,1
LB_29693:
	mov r8,r13
	bt r12,0
	jc LB_29694
	btr r12,2
	jmp LB_29695
LB_29694:
	bts r12,2
LB_29695:
	mov r13,r9
	bt r12,3
	jc LB_29696
	btr r12,0
	jmp LB_29697
LB_29696:
	bts r12,0
LB_29697:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_29593 : %_29593
 ; {>  %_29592~1':(_lst)◂(_p29585) %_29591~0':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_29593
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f33 { %_29593 %_29591 } ⊢ { %_29594 %_29595 } : { %_29594 %_29595 }
 ; {>  %_29592~1':(_lst)◂(_p29585) %_29591~0':_r64 %_29593~2':_r64 }
	add r8,r13
; _f29586 %_29594 ⊢ %_29596 : %_29596
 ; {>  %_29595~0':_r64 %_29592~1':(_lst)◂(_p29585) %_29594~2':_r64 }
; _f29586 2' ⊢ °0◂2'
; _cns { %_29596 %_29592 } ⊢ %_29597 : %_29597
 ; {>  %_29596~°0◂2':_p29585 %_29595~0':_r64 %_29592~1':(_lst)◂(_p29585) }
; _cns { °0◂2' 1' } ⊢ °0◂{ °0◂2' 1' }
; _some %_29597 ⊢ %_29598 : %_29598
 ; {>  %_29597~°0◂{ °0◂2' 1' }:(_lst)◂(_p29585) %_29595~0':_r64 }
; _some °0◂{ °0◂2' 1' } ⊢ °0◂°0◂{ °0◂2' 1' }
; ∎ %_29598
 ; {>  %_29595~0':_r64 %_29598~°0◂°0◂{ °0◂2' 1' }:(_opn)◂((_lst)◂(_p29585)) }
; 	∎ °0◂°0◂{ °0◂2' 1' }
	bt r12,0
	jc LB_29648
	mov rdi,r13
	call dlt
LB_29648:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °0◂2' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r8
	bt r12,2
	jc LB_29655
	btr r12,0
	jmp LB_29656
LB_29655:
	bts r12,0
LB_29656:
	mov rsi,1
	bt r12,0
	jc LB_29653
	mov rsi,0
	bt r13,0
	jc LB_29653
	jmp LB_29654
LB_29653:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_29654:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_29651
	btr QWORD [rdi],0
	jmp LB_29652
LB_29651:
	bts QWORD [rdi],0
LB_29652:
	mov r13,r14
	bt r12,1
	jc LB_29659
	btr r12,0
	jmp LB_29660
LB_29659:
	bts r12,0
LB_29660:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_29657
	btr QWORD [rdi],1
	jmp LB_29658
LB_29657:
	bts QWORD [rdi],1
LB_29658:
	mov rsi,1
	bt r12,3
	jc LB_29649
	mov rsi,0
	bt r9,0
	jc LB_29649
	jmp LB_29650
LB_29649:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_29650:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_29661:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29663
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29662
LB_29663:
	add rsp,8
	ret
NS_E_29588_MTC_0_failed:
	add rsp,48
	pop r14
LB_29662:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "##"
	add r14,2
	cmp r14,r10
	jg LB_29725
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_29725
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_29725
	jmp LB_29726
LB_29725:
	jmp NS_E_29588_MTC_1_failed
LB_29726:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_cmt
	push r10
	call NS_E_29590_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29730
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29731
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29731:
	jmp NS_E_29588_MTC_1_failed
LB_29730:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_29588_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29736
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_29737
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_29737:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29738
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29738:
	jmp NS_E_29588_MTC_1_failed
LB_29736:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_29718
	btr r12,2
	jmp LB_29719
LB_29718:
	bts r12,2
LB_29719:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_29716
	btr r12,1
	jmp LB_29717
LB_29716:
	bts r12,1
LB_29717:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29714
	btr r12,0
	jmp LB_29715
LB_29714:
	bts r12,0
LB_29715:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_29711
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_29740
	btr r12,3
	jmp LB_29741
LB_29740:
	bts r12,3
LB_29741:
	mov r14,r8
	bt r12,2
	jc LB_29742
	btr r12,1
	jmp LB_29743
LB_29742:
	bts r12,1
LB_29743:
	mov r8,r13
	bt r12,0
	jc LB_29744
	btr r12,2
	jmp LB_29745
LB_29744:
	bts r12,2
LB_29745:
	mov r13,r9
	bt r12,3
	jc LB_29746
	btr r12,0
	jmp LB_29747
LB_29746:
	bts r12,0
LB_29747:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_29601 : %_29601
 ; {>  %_29600~1':(_lst)◂(_p29585) %_29599~0':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_29601
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f33 { %_29601 %_29599 } ⊢ { %_29602 %_29603 } : { %_29602 %_29603 }
 ; {>  %_29601~2':_r64 %_29600~1':(_lst)◂(_p29585) %_29599~0':_r64 }
	add r8,r13
; _f29586 %_29602 ⊢ %_29604 : %_29604
 ; {>  %_29602~2':_r64 %_29603~0':_r64 %_29600~1':(_lst)◂(_p29585) }
; _f29586 2' ⊢ °0◂2'
; _cns { %_29604 %_29600 } ⊢ %_29605 : %_29605
 ; {>  %_29604~°0◂2':_p29585 %_29603~0':_r64 %_29600~1':(_lst)◂(_p29585) }
; _cns { °0◂2' 1' } ⊢ °0◂{ °0◂2' 1' }
; _some %_29605 ⊢ %_29606 : %_29606
 ; {>  %_29603~0':_r64 %_29605~°0◂{ °0◂2' 1' }:(_lst)◂(_p29585) }
; _some °0◂{ °0◂2' 1' } ⊢ °0◂°0◂{ °0◂2' 1' }
; ∎ %_29606
 ; {>  %_29603~0':_r64 %_29606~°0◂°0◂{ °0◂2' 1' }:(_opn)◂((_lst)◂(_p29585)) }
; 	∎ °0◂°0◂{ °0◂2' 1' }
	bt r12,0
	jc LB_29698
	mov rdi,r13
	call dlt
LB_29698:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °0◂2' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r8
	bt r12,2
	jc LB_29705
	btr r12,0
	jmp LB_29706
LB_29705:
	bts r12,0
LB_29706:
	mov rsi,1
	bt r12,0
	jc LB_29703
	mov rsi,0
	bt r13,0
	jc LB_29703
	jmp LB_29704
LB_29703:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_29704:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_29701
	btr QWORD [rdi],0
	jmp LB_29702
LB_29701:
	bts QWORD [rdi],0
LB_29702:
	mov r13,r14
	bt r12,1
	jc LB_29709
	btr r12,0
	jmp LB_29710
LB_29709:
	bts r12,0
LB_29710:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_29707
	btr QWORD [rdi],1
	jmp LB_29708
LB_29707:
	bts QWORD [rdi],1
LB_29708:
	mov rsi,1
	bt r12,3
	jc LB_29699
	mov rsi,0
	bt r9,0
	jc LB_29699
	jmp LB_29700
LB_29699:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_29700:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_29711:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29713
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29712
LB_29713:
	add rsp,8
	ret
NS_E_29588_MTC_1_failed:
	add rsp,48
	pop r14
LB_29712:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_28968_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29810
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29588_MTC_2_failed
LB_29810:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt
	push r10
	call NS_E_29588_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29815
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29816
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29816:
	jmp NS_E_29588_MTC_2_failed
LB_29815:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_29805
	btr r12,1
	jmp LB_29806
LB_29805:
	bts r12,1
LB_29806:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29803
	btr r12,0
	jmp LB_29804
LB_29803:
	bts r12,0
LB_29804:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_29800
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
MTC_LB_29748:
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_29749
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_29750
	bt QWORD [rax],0
	jc LB_29751
	btr r12,1
	jmp LB_29752
LB_29751:
	bts r12,1
LB_29752:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_29750:
	push r14
	mov r14,rax
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_29755
	btr r12,4
	jmp LB_29756
LB_29755:
	bts r12,4
LB_29756:
	mov r8,r10
	bt r12,4
	jc LB_29753
	btr r12,2
	jmp LB_29754
LB_29753:
	bts r12,2
LB_29754:
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_29759
	btr r12,4
	jmp LB_29760
LB_29759:
	bts r12,4
LB_29760:
	mov r9,r10
	bt r12,4
	jc LB_29757
	btr r12,3
	jmp LB_29758
LB_29757:
	bts r12,3
LB_29758:
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_29749
; _emt_mov_ptn_to_ptn:{| 11110.. |},2' ⊢ °1◂4'
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_29761
	bt QWORD [rax],0
	jc LB_29762
	btr r12,2
	jmp LB_29763
LB_29762:
	bts r12,2
LB_29763:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_29761:
	push r8
	mov r8,rax
	mov r10,r8
	bt r12,2
	jc LB_29764
	btr r12,4
	jmp LB_29765
LB_29764:
	bts r12,4
LB_29765:
	pop r8
LB_29766:
	cmp r15,0
	jz LB_29767
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29766
LB_29767:
; » 0xr1 |~ {  } ⊢ %_29612 : %_29612
 ; {>  %_29610~3':(_lst)◂(_p29585) %_29607~0':_r64 %_29611~4':_r64 }
; 	» 0xr1 _ ⊢ 1' : %_29612
	mov rdi,0x1
	mov r14,rdi
	bts r12,1
; _f33 { %_29611 %_29612 } ⊢ { %_29613 %_29614 } : { %_29613 %_29614 }
 ; {>  %_29612~1':_r64 %_29610~3':(_lst)◂(_p29585) %_29607~0':_r64 %_29611~4':_r64 }
	add r10,r14
; _f29587 %_29613 ⊢ %_29615 : %_29615
 ; {>  %_29610~3':(_lst)◂(_p29585) %_29607~0':_r64 %_29614~1':_r64 %_29613~4':_r64 }
; _f29587 4' ⊢ °1◂4'
; _cns { %_29615 %_29610 } ⊢ %_29616 : %_29616
 ; {>  %_29610~3':(_lst)◂(_p29585) %_29615~°1◂4':_p29585 %_29607~0':_r64 %_29614~1':_r64 }
; _cns { °1◂4' 3' } ⊢ °0◂{ °1◂4' 3' }
; _some %_29616 ⊢ %_29617 : %_29617
 ; {>  %_29616~°0◂{ °1◂4' 3' }:(_lst)◂(_p29585) %_29607~0':_r64 %_29614~1':_r64 }
; _some °0◂{ °1◂4' 3' } ⊢ °0◂°0◂{ °1◂4' 3' }
; ∎ %_29617
 ; {>  %_29607~0':_r64 %_29614~1':_r64 %_29617~°0◂°0◂{ °1◂4' 3' }:(_opn)◂((_lst)◂(_p29585)) }
; 	∎ °0◂°0◂{ °1◂4' 3' }
	bt r12,0
	jc LB_29768
	mov rdi,r13
	call dlt
LB_29768:
	bt r12,1
	jc LB_29769
	mov rdi,r14
	call dlt
LB_29769:
; _emt_mov_ptn_to_ptn:{| 000110.. |},°0◂°0◂{ °1◂4' 3' } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_29770
	btr r12,0
	jmp LB_29771
LB_29770:
	bts r12,0
LB_29771:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r10
	bt r12,4
	jc LB_29778
	btr r12,1
	jmp LB_29779
LB_29778:
	bts r12,1
LB_29779:
	mov rsi,1
	bt r12,1
	jc LB_29776
	mov rsi,0
	bt r14,0
	jc LB_29776
	jmp LB_29777
LB_29776:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_29777:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_29774
	btr QWORD [rdi],0
	jmp LB_29775
LB_29774:
	bts QWORD [rdi],0
LB_29775:
	mov r14,r13
	bt r12,0
	jc LB_29782
	btr r12,1
	jmp LB_29783
LB_29782:
	bts r12,1
LB_29783:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_29780
	btr QWORD [rdi],1
	jmp LB_29781
LB_29780:
	bts QWORD [rdi],1
LB_29781:
	mov rsi,1
	bt r12,3
	jc LB_29772
	mov rsi,0
	bt r9,0
	jc LB_29772
	jmp LB_29773
LB_29772:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_29773:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_29749:
LB_29785:
	cmp r15,0
	jz LB_29786
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_29785
LB_29786:
; » 0xr1 |~ {  } ⊢ %_29618 : %_29618
 ; {>  %_29608~1':(_lst)◂(_p29585) %_29607~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_29618
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f29587 %_29618 ⊢ %_29619 : %_29619
 ; {>  %_29618~2':_r64 %_29608~1':(_lst)◂(_p29585) %_29607~0':_r64 }
; _f29587 2' ⊢ °1◂2'
; _cns { %_29619 %_29608 } ⊢ %_29620 : %_29620
 ; {>  %_29619~°1◂2':_p29585 %_29608~1':(_lst)◂(_p29585) %_29607~0':_r64 }
; _cns { °1◂2' 1' } ⊢ °0◂{ °1◂2' 1' }
; _some %_29620 ⊢ %_29621 : %_29621
 ; {>  %_29607~0':_r64 %_29620~°0◂{ °1◂2' 1' }:(_lst)◂(_p29585) }
; _some °0◂{ °1◂2' 1' } ⊢ °0◂°0◂{ °1◂2' 1' }
; ∎ %_29621
 ; {>  %_29607~0':_r64 %_29621~°0◂°0◂{ °1◂2' 1' }:(_opn)◂((_lst)◂(_p29585)) }
; 	∎ °0◂°0◂{ °1◂2' 1' }
	bt r12,0
	jc LB_29787
	mov rdi,r13
	call dlt
LB_29787:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °1◂2' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r8
	bt r12,2
	jc LB_29794
	btr r12,0
	jmp LB_29795
LB_29794:
	bts r12,0
LB_29795:
	mov rsi,1
	bt r12,0
	jc LB_29792
	mov rsi,0
	bt r13,0
	jc LB_29792
	jmp LB_29793
LB_29792:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_29793:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_29790
	btr QWORD [rdi],0
	jmp LB_29791
LB_29790:
	bts QWORD [rdi],0
LB_29791:
	mov r13,r14
	bt r12,1
	jc LB_29798
	btr r12,0
	jmp LB_29799
LB_29798:
	bts r12,0
LB_29799:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_29796
	btr QWORD [rdi],1
	jmp LB_29797
LB_29796:
	bts QWORD [rdi],1
LB_29797:
	mov rsi,1
	bt r12,3
	jc LB_29788
	mov rsi,0
	bt r9,0
	jc LB_29788
	jmp LB_29789
LB_29788:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_29789:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_29784:
LB_29800:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29802
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29801
LB_29802:
	add rsp,8
	ret
NS_E_29588_MTC_2_failed:
	add rsp,32
	pop r14
LB_29801:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_29820
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_29622 : %_29622
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_29622 ⊢ %_29623 : %_29623
 ; {>  %_29622~°1◂{  }:(_lst)◂(t8044'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_29623
 ; {>  %_29623~°0◂°1◂{  }:(_opn)◂((_lst)◂(t8047'(0))) }
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
	jc LB_29818
	mov rsi,0
	bt r9,0
	jc LB_29818
	jmp LB_29819
LB_29818:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_29819:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_29820:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29822
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29821
LB_29822:
	add rsp,8
	ret
NS_E_29588_MTC_3_failed:
	add rsp,0
	pop r14
LB_29821:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29589:
NS_E_RDI_29589:
NS_E_29589_ETR_TBL:
NS_E_29589_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "#]"
	add r14,2
	cmp r14,r10
	jg LB_29835
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_29835
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_29835
	jmp LB_29836
LB_29835:
	jmp NS_E_29589_MTC_0_failed
LB_29836:
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
	jc LB_29828
	btr r12,0
	jmp LB_29829
LB_29828:
	bts r12,0
LB_29829:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29825
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_29624 : %_29624
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_29624
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _some %_29624 ⊢ %_29625 : %_29625
 ; {>  %_29624~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29625
 ; {>  %_29625~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29823
	btr r12,3
	jmp LB_29824
LB_29823:
	bts r12,3
LB_29824:
	mov r8,0
	bts r12,2
	ret
LB_29825:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29827
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29826
LB_29827:
	add rsp,8
	ret
NS_E_29589_MTC_0_failed:
	add rsp,16
	pop r14
LB_29826:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_29855
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_29855
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_29855
	jmp LB_29856
LB_29855:
	jmp NS_E_29589_MTC_1_failed
LB_29856:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_29589_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29860
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29861
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29861:
	jmp NS_E_29589_MTC_1_failed
LB_29860:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; blk_cmt
	push r10
	call NS_E_29589_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29866
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_29867
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_29867:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29868
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29868:
	jmp NS_E_29589_MTC_1_failed
LB_29866:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_29848
	btr r12,2
	jmp LB_29849
LB_29848:
	bts r12,2
LB_29849:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_29846
	btr r12,1
	jmp LB_29847
LB_29846:
	bts r12,1
LB_29847:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29844
	btr r12,0
	jmp LB_29845
LB_29844:
	bts r12,0
LB_29845:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_29841
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_29870
	btr r12,3
	jmp LB_29871
LB_29870:
	bts r12,3
LB_29871:
	mov r14,r8
	bt r12,2
	jc LB_29872
	btr r12,1
	jmp LB_29873
LB_29872:
	bts r12,1
LB_29873:
	mov r8,r13
	bt r12,0
	jc LB_29874
	btr r12,2
	jmp LB_29875
LB_29874:
	bts r12,2
LB_29875:
	mov r13,r9
	bt r12,3
	jc LB_29876
	btr r12,0
	jmp LB_29877
LB_29876:
	bts r12,0
LB_29877:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_29628 : %_29628
 ; {>  %_29627~1':_r64 %_29626~0':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_29628
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f33 { %_29628 %_29626 } ⊢ { %_29629 %_29630 } : { %_29629 %_29630 }
 ; {>  %_29627~1':_r64 %_29626~0':_r64 %_29628~2':_r64 }
	add r8,r13
; _f33 { %_29629 %_29627 } ⊢ { %_29631 %_29632 } : { %_29631 %_29632 }
 ; {>  %_29627~1':_r64 %_29630~0':_r64 %_29629~2':_r64 }
	add r8,r14
; _some %_29631 ⊢ %_29633 : %_29633
 ; {>  %_29632~1':_r64 %_29631~2':_r64 %_29630~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_29633
 ; {>  %_29633~°0◂2':(_opn)◂(_r64) %_29632~1':_r64 %_29630~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_29837
	mov rdi,r14
	call dlt
LB_29837:
	bt r12,0
	jc LB_29838
	mov rdi,r13
	call dlt
LB_29838:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_29839
	btr r12,3
	jmp LB_29840
LB_29839:
	bts r12,3
LB_29840:
	mov r8,0
	bts r12,2
	ret
LB_29841:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29843
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29842
LB_29843:
	add rsp,8
	ret
NS_E_29589_MTC_1_failed:
	add rsp,48
	pop r14
LB_29842:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_28968_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29892
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29589_MTC_2_failed
LB_29892:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; blk_cmt
	push r10
	call NS_E_29589_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29897
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29898
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29898:
	jmp NS_E_29589_MTC_2_failed
LB_29897:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_29887
	btr r12,1
	jmp LB_29888
LB_29887:
	bts r12,1
LB_29888:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29885
	btr r12,0
	jmp LB_29886
LB_29885:
	bts r12,0
LB_29886:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_29882
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_29636 : %_29636
 ; {>  %_29635~1':_r64 %_29634~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_29636
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f33 { %_29636 %_29635 } ⊢ { %_29637 %_29638 } : { %_29637 %_29638 }
 ; {>  %_29635~1':_r64 %_29634~0':_r64 %_29636~2':_r64 }
	add r8,r14
; _some %_29637 ⊢ %_29639 : %_29639
 ; {>  %_29634~0':_r64 %_29638~1':_r64 %_29637~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_29639
 ; {>  %_29639~°0◂2':(_opn)◂(_r64) %_29634~0':_r64 %_29638~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_29878
	mov rdi,r13
	call dlt
LB_29878:
	bt r12,1
	jc LB_29879
	mov rdi,r14
	call dlt
LB_29879:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_29880
	btr r12,3
	jmp LB_29881
LB_29880:
	bts r12,3
LB_29881:
	mov r8,0
	bts r12,2
	ret
LB_29882:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29884
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29883
LB_29884:
	add rsp,8
	ret
NS_E_29589_MTC_2_failed:
	add rsp,32
	pop r14
LB_29883:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29590:
NS_E_RDI_29590:
NS_E_29590_ETR_TBL:
NS_E_29590_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_29912
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_29912
	jmp LB_29913
LB_29912:
	jmp NS_E_29590_MTC_0_failed
LB_29913:
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
	jc LB_29905
	btr r12,0
	jmp LB_29906
LB_29905:
	bts r12,0
LB_29906:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_29902
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_29640 : %_29640
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_29640
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_29640 ⊢ %_29641 : %_29641
 ; {>  %_29640~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_29641
 ; {>  %_29641~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_29900
	btr r12,3
	jmp LB_29901
LB_29900:
	bts r12,3
LB_29901:
	mov r8,0
	bts r12,2
	ret
LB_29902:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29904
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29903
LB_29904:
	add rsp,8
	ret
NS_E_29590_MTC_0_failed:
	add rsp,16
	pop r14
LB_29903:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_28968_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29928
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29590_MTC_1_failed
LB_29928:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_cmt
	push r10
	call NS_E_29590_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_29933
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_29934
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_29934:
	jmp NS_E_29590_MTC_1_failed
LB_29933:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_29923
	btr r12,1
	jmp LB_29924
LB_29923:
	bts r12,1
LB_29924:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_29921
	btr r12,0
	jmp LB_29922
LB_29921:
	bts r12,0
LB_29922:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_29918
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_29644 : %_29644
 ; {>  %_29643~1':_r64 %_29642~0':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_29644
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f33 { %_29644 %_29643 } ⊢ { %_29645 %_29646 } : { %_29645 %_29646 }
 ; {>  %_29644~2':_r64 %_29643~1':_r64 %_29642~0':_r64 }
	add r8,r14
; _some %_29645 ⊢ %_29647 : %_29647
 ; {>  %_29646~1':_r64 %_29645~2':_r64 %_29642~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_29647
 ; {>  %_29647~°0◂2':(_opn)◂(_r64) %_29646~1':_r64 %_29642~0':_r64 }
; 	∎ °0◂2'
	bt r12,1
	jc LB_29914
	mov rdi,r14
	call dlt
LB_29914:
	bt r12,0
	jc LB_29915
	mov rdi,r13
	call dlt
LB_29915:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_29916
	btr r12,3
	jmp LB_29917
LB_29916:
	bts r12,3
LB_29917:
	mov r8,0
	bts r12,2
	ret
LB_29918:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_29920
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_29919
LB_29920:
	add rsp,8
	ret
NS_E_29590_MTC_1_failed:
	add rsp,32
	pop r14
LB_29919:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_29945:
NS_E_RDI_29945:
; » _^ ..
	mov rax,18
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "## FOIJJFI  \n"
	mov rsi,0x_4a_4a_49_4f_46_20_23_23
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_46
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_49
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+4],sil
	add rdi,13
; "[##]"
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_23
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_23
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r13,rax
	btr r12,0
; _f20 %_29936 ⊢ %_29937 : %_29937
 ; {>  %_29936~0':_stg }
; _f20 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » 0xr0 |~ {  } ⊢ %_29938 : %_29938
 ; {>  %_29937~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_29938
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f29588 { %_29937 %_29938 } ⊢ { %_29939 %_29940 %_29941 } : { %_29939 %_29940 %_29941 }
 ; {>  %_29937~0':_stg %_29938~1':_r64 }
; _f29588 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_29588
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_29946
	btr r12,4
	jmp LB_29947
LB_29946:
	bts r12,4
LB_29947:
	mov r8,r9
	bt r12,3
	jc LB_29950
	btr r12,2
	jmp LB_29951
LB_29950:
	bts r12,2
LB_29951:
	mov rsi,1
	bt r12,2
	jc LB_29948
	mov rsi,0
	bt r8,0
	jc LB_29948
	jmp LB_29949
LB_29948:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_29949:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f20 { %_29939 %_29940 %_29941 } ⊢ { %_29942 %_29943 %_29944 } : { %_29942 %_29943 %_29944 }
 ; {>  %_29940~1':_r64 %_29939~0':_stg %_29941~2':(_opn)◂((_lst)◂(_p29585)) }
; _f20 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_29952
	btr r12,3
	jmp LB_29953
LB_29952:
	bts r12,3
LB_29953:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_29956
	btr r12,4
	jmp LB_29957
LB_29956:
	bts r12,4
LB_29957:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_29954
	btr QWORD [rdi],0
	jmp LB_29955
LB_29954:
	bts QWORD [rdi],0
LB_29955:
	mov r10,r14
	bt r12,1
	jc LB_29960
	btr r12,4
	jmp LB_29961
LB_29960:
	bts r12,4
LB_29961:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_29958
	btr QWORD [rdi],1
	jmp LB_29959
LB_29958:
	bts QWORD [rdi],1
LB_29959:
	mov r10,r8
	bt r12,2
	jc LB_29964
	btr r12,4
	jmp LB_29965
LB_29964:
	bts r12,4
LB_29965:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_29962
	btr QWORD [rdi],2
	jmp LB_29963
LB_29962:
	bts QWORD [rdi],2
LB_29963:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_29966
	btr r12,3
	jmp LB_29967
LB_29966:
	bts r12,3
LB_29967:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_29970
	btr r12,4
	jmp LB_29971
LB_29970:
	bts r12,4
LB_29971:
	mov r13,r10
	bt r12,4
	jc LB_29968
	btr r12,0
	jmp LB_29969
LB_29968:
	bts r12,0
LB_29969:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_29974
	btr r12,4
	jmp LB_29975
LB_29974:
	bts r12,4
LB_29975:
	mov r14,r10
	bt r12,4
	jc LB_29972
	btr r12,1
	jmp LB_29973
LB_29972:
	bts r12,1
LB_29973:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_29978
	btr r12,4
	jmp LB_29979
LB_29978:
	bts r12,4
LB_29979:
	mov r8,r10
	bt r12,4
	jc LB_29976
	btr r12,2
	jmp LB_29977
LB_29976:
	bts r12,2
LB_29977:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_29942~0':_stg %_29944~2':(_opn)◂((_lst)◂(_p29585)) %_29943~1':_r64 }
; 	∎ {  }
	bt r12,0
	jc LB_29980
	mov rdi,r13
	call dlt
LB_29980:
	bt r12,2
	jc LB_29981
	mov rdi,r8
	call dlt
LB_29981:
	bt r12,1
	jc LB_29982
	mov rdi,r14
	call dlt
LB_29982:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_29984:
NS_E_RDI_29984:
NS_E_29984_ETR_TBL:
NS_E_29984_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	push r10
	call NS_E_29986_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30056
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29984_MTC_0_failed
LB_30056:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_lst
	push r10
	call NS_E_29984_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30061
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30062
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30062:
	jmp NS_E_29984_MTC_0_failed
LB_30061:
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
	jc LB_30050
	btr QWORD [rdi],1
LB_30050:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30051
	btr QWORD [rdi],0
LB_30051:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29984_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29984_MTC_1_failed:
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
NS_E_29986:
NS_E_RDI_29986:
NS_E_29986_ETR_TBL:
NS_E_29986_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_30267
LB_30266:
	add r14,1
LB_30267:
	cmp r14,r10
	jge LB_30268
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30266
	cmp al,10
	jz LB_30266
	cmp al,32
	jz LB_30266
LB_30268:
	add r14,4
	cmp r14,r10
	jg LB_30271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_30271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_30271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_30271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_30271
	jmp LB_30272
LB_30271:
	jmp NS_E_29986_MTC_0_failed
LB_30272:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_30274
LB_30273:
	add r14,1
LB_30274:
	cmp r14,r10
	jge LB_30275
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30273
	cmp al,10
	jz LB_30273
	cmp al,32
	jz LB_30273
LB_30275:
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30276
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30277
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30277:
	jmp NS_E_29986_MTC_0_failed
LB_30276:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_30280
LB_30279:
	add r14,1
LB_30280:
	cmp r14,r10
	jge LB_30281
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30279
	cmp al,10
	jz LB_30279
	cmp al,32
	jz LB_30279
LB_30281:
	add r14,1
	cmp r14,r10
	jg LB_30286
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_30286
	jmp LB_30287
LB_30286:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30283
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30283:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30284
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30284:
	jmp NS_E_29986_MTC_0_failed
LB_30287:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_30289
LB_30288:
	add r14,1
LB_30289:
	cmp r14,r10
	jge LB_30290
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30288
	cmp al,10
	jz LB_30288
	cmp al,32
	jz LB_30288
LB_30290:
	push r10
	call NS_E_29990_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30291
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30292
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30292:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30293
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30293:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30294
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30294:
	jmp NS_E_29986_MTC_0_failed
LB_30291:
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
	jc LB_30261
	btr QWORD [rdi],3
LB_30261:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_30262
	btr QWORD [rdi],2
LB_30262:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30263
	btr QWORD [rdi],1
LB_30263:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30264
	btr QWORD [rdi],0
LB_30264:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29986_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_30232
LB_30231:
	add r14,1
LB_30232:
	cmp r14,r10
	jge LB_30233
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30231
	cmp al,10
	jz LB_30231
	cmp al,32
	jz LB_30231
LB_30233:
	add r14,4
	cmp r14,r10
	jg LB_30236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_30236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_30236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_30236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_30236
	jmp LB_30237
LB_30236:
	jmp NS_E_29986_MTC_1_failed
LB_30237:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_30239
LB_30238:
	add r14,1
LB_30239:
	cmp r14,r10
	jge LB_30240
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30238
	cmp al,10
	jz LB_30238
	cmp al,32
	jz LB_30238
LB_30240:
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30241
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30242
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30242:
	jmp NS_E_29986_MTC_1_failed
LB_30241:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; glb_etr_lst
	jmp LB_30245
LB_30244:
	add r14,1
LB_30245:
	cmp r14,r10
	jge LB_30246
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30244
	cmp al,10
	jz LB_30244
	cmp al,32
	jz LB_30244
LB_30246:
	push r10
	call NS_E_29984_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30247
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30248
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30248:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30249
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30249:
	jmp NS_E_29986_MTC_1_failed
LB_30247:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\136\142\226\136\142"
	jmp LB_30252
LB_30251:
	add r14,1
LB_30252:
	cmp r14,r10
	jge LB_30253
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30251
	cmp al,10
	jz LB_30251
	cmp al,32
	jz LB_30251
LB_30253:
	add r14,6
	cmp r14,r10
	jg LB_30259
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_30259
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_30259
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_30259
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_30259
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_30259
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_30259
	jmp LB_30260
LB_30259:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30255
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30255:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30256
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30256:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30257
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30257:
	jmp NS_E_29986_MTC_1_failed
LB_30260:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0004_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_30226
	btr QWORD [rdi],3
LB_30226:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_30227
	btr QWORD [rdi],2
LB_30227:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30228
	btr QWORD [rdi],1
LB_30228:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30229
	btr QWORD [rdi],0
LB_30229:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29986_MTC_1_failed:
	add rsp,64
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_30197
LB_30196:
	add r14,1
LB_30197:
	cmp r14,r10
	jge LB_30198
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30196
	cmp al,10
	jz LB_30196
	cmp al,32
	jz LB_30196
LB_30198:
	add r14,2
	cmp r14,r10
	jg LB_30201
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_30201
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_30201
	jmp LB_30202
LB_30201:
	jmp NS_E_29986_MTC_2_failed
LB_30202:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_30204
LB_30203:
	add r14,1
LB_30204:
	cmp r14,r10
	jge LB_30205
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30203
	cmp al,10
	jz LB_30203
	cmp al,32
	jz LB_30203
LB_30205:
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30206
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30207
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30207:
	jmp NS_E_29986_MTC_2_failed
LB_30206:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_30210
LB_30209:
	add r14,1
LB_30210:
	cmp r14,r10
	jge LB_30211
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30209
	cmp al,10
	jz LB_30209
	cmp al,32
	jz LB_30209
LB_30211:
	add r14,1
	cmp r14,r10
	jg LB_30216
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_30216
	jmp LB_30217
LB_30216:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30213
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30213:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30214
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30214:
	jmp NS_E_29986_MTC_2_failed
LB_30217:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; cst
	jmp LB_30219
LB_30218:
	add r14,1
LB_30219:
	cmp r14,r10
	jge LB_30220
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30218
	cmp al,10
	jz LB_30218
	cmp al,32
	jz LB_30218
LB_30220:
	push r10
	call NS_E_29988_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30221
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30222
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30222:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30223
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30223:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30224
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30224:
	jmp NS_E_29986_MTC_2_failed
LB_30221:
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
	jc LB_30191
	btr QWORD [rdi],3
LB_30191:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_30192
	btr QWORD [rdi],2
LB_30192:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30193
	btr QWORD [rdi],1
LB_30193:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30194
	btr QWORD [rdi],0
LB_30194:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29986_MTC_2_failed:
	add rsp,64
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_30162
LB_30161:
	add r14,1
LB_30162:
	cmp r14,r10
	jge LB_30163
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30161
	cmp al,10
	jz LB_30161
	cmp al,32
	jz LB_30161
LB_30163:
	add r14,2
	cmp r14,r10
	jg LB_30166
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_30166
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_30166
	jmp LB_30167
LB_30166:
	jmp NS_E_29986_MTC_3_failed
LB_30167:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_30169
LB_30168:
	add r14,1
LB_30169:
	cmp r14,r10
	jge LB_30170
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30168
	cmp al,10
	jz LB_30168
	cmp al,32
	jz LB_30168
LB_30170:
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30171
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30172
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30172:
	jmp NS_E_29986_MTC_3_failed
LB_30171:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\194\171"
	jmp LB_30175
LB_30174:
	add r14,1
LB_30175:
	cmp r14,r10
	jge LB_30176
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30174
	cmp al,10
	jz LB_30174
	cmp al,32
	jz LB_30174
LB_30176:
	add r14,2
	cmp r14,r10
	jg LB_30181
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_30181
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_30181
	jmp LB_30182
LB_30181:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30178
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30178:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30179
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30179:
	jmp NS_E_29986_MTC_3_failed
LB_30182:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; op_lines
	jmp LB_30184
LB_30183:
	add r14,1
LB_30184:
	cmp r14,r10
	jge LB_30185
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30183
	cmp al,10
	jz LB_30183
	cmp al,32
	jz LB_30183
LB_30185:
	push r10
	call NS_E_29996_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30186
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30187
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30187:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30188
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30188:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30189
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30189:
	jmp NS_E_29986_MTC_3_failed
LB_30186:
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
	jc LB_30156
	btr QWORD [rdi],3
LB_30156:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_30157
	btr QWORD [rdi],2
LB_30157:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30158
	btr QWORD [rdi],1
LB_30158:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30159
	btr QWORD [rdi],0
LB_30159:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29986_MTC_3_failed:
	add rsp,64
	pop r14
; c4
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_30129
LB_30128:
	add r14,1
LB_30129:
	cmp r14,r10
	jge LB_30130
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30128
	cmp al,10
	jz LB_30128
	cmp al,32
	jz LB_30128
LB_30130:
	add r14,2
	cmp r14,r10
	jg LB_30133
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_30133
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_30133
	jmp LB_30134
LB_30133:
	jmp NS_E_29986_MTC_4_failed
LB_30134:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_30136
LB_30135:
	add r14,1
LB_30136:
	cmp r14,r10
	jge LB_30137
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30135
	cmp al,10
	jz LB_30135
	cmp al,32
	jz LB_30135
LB_30137:
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30138
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30139
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30139:
	jmp NS_E_29986_MTC_4_failed
LB_30138:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; reg_ptn
	jmp LB_30142
LB_30141:
	add r14,1
LB_30142:
	cmp r14,r10
	jge LB_30143
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30141
	cmp al,10
	jz LB_30141
	cmp al,32
	jz LB_30141
LB_30143:
	push r10
	call NS_E_30008_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30144
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30145
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30145:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30146
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30146:
	jmp NS_E_29986_MTC_4_failed
LB_30144:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; op_lines
	jmp LB_30149
LB_30148:
	add r14,1
LB_30149:
	cmp r14,r10
	jge LB_30150
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30148
	cmp al,10
	jz LB_30148
	cmp al,32
	jz LB_30148
LB_30150:
	push r10
	call NS_E_29996_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30151
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30152
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30152:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30153
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30153:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30154
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30154:
	jmp NS_E_29986_MTC_4_failed
LB_30151:
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
	jc LB_30123
	btr QWORD [rdi],3
LB_30123:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_30124
	btr QWORD [rdi],2
LB_30124:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30125
	btr QWORD [rdi],1
LB_30125:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30126
	btr QWORD [rdi],0
LB_30126:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0400_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29986_MTC_4_failed:
	add rsp,64
	pop r14
; c5
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\182"
	jmp LB_30094
LB_30093:
	add r14,1
LB_30094:
	cmp r14,r10
	jge LB_30095
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30093
	cmp al,10
	jz LB_30093
	cmp al,32
	jz LB_30093
LB_30095:
	add r14,2
	cmp r14,r10
	jg LB_30098
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_30098
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_30098
	jmp LB_30099
LB_30098:
	jmp NS_E_29986_MTC_5_failed
LB_30099:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_30101
LB_30100:
	add r14,1
LB_30101:
	cmp r14,r10
	jge LB_30102
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30100
	cmp al,10
	jz LB_30100
	cmp al,32
	jz LB_30100
LB_30102:
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30103
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30104
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30104:
	jmp NS_E_29986_MTC_5_failed
LB_30103:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_30107
LB_30106:
	add r14,1
LB_30107:
	cmp r14,r10
	jge LB_30108
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30106
	cmp al,10
	jz LB_30106
	cmp al,32
	jz LB_30106
LB_30108:
	add r14,1
	cmp r14,r10
	jg LB_30113
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_30113
	jmp LB_30114
LB_30113:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30110
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30110:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30111
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30111:
	jmp NS_E_29986_MTC_5_failed
LB_30114:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_30116
LB_30115:
	add r14,1
LB_30116:
	cmp r14,r10
	jge LB_30117
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30115
	cmp al,10
	jz LB_30115
	cmp al,32
	jz LB_30115
LB_30117:
	push r10
	call NS_E_29990_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30118
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30119
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30119:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30120
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30120:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30121
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30121:
	jmp NS_E_29986_MTC_5_failed
LB_30118:
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
	jc LB_30088
	btr QWORD [rdi],3
LB_30088:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_30089
	btr QWORD [rdi],2
LB_30089:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30090
	btr QWORD [rdi],1
LB_30090:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30091
	btr QWORD [rdi],0
LB_30091:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0500_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29986_MTC_5_failed:
	add rsp,64
	pop r14
; c6
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\182"
	jmp LB_30069
LB_30068:
	add r14,1
LB_30069:
	cmp r14,r10
	jge LB_30070
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30068
	cmp al,10
	jz LB_30068
	cmp al,32
	jz LB_30068
LB_30070:
	add r14,2
	cmp r14,r10
	jg LB_30073
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_30073
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_30073
	jmp LB_30074
LB_30073:
	jmp NS_E_29986_MTC_6_failed
LB_30074:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_30076
LB_30075:
	add r14,1
LB_30076:
	cmp r14,r10
	jge LB_30077
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30075
	cmp al,10
	jz LB_30075
	cmp al,32
	jz LB_30075
LB_30077:
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30078
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30079
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30079:
	jmp NS_E_29986_MTC_6_failed
LB_30078:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dta_def
	jmp LB_30082
LB_30081:
	add r14,1
LB_30082:
	cmp r14,r10
	jge LB_30083
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30081
	cmp al,10
	jz LB_30081
	cmp al,32
	jz LB_30081
LB_30083:
	push r10
	call NS_E_29992_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30084
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30085
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30085:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30086
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30086:
	jmp NS_E_29986_MTC_6_failed
LB_30084:
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
	jc LB_30064
	btr QWORD [rdi],2
LB_30064:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30065
	btr QWORD [rdi],1
LB_30065:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30066
	btr QWORD [rdi],0
LB_30066:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0600_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29986_MTC_6_failed:
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
NS_E_29988:
NS_E_RDI_29988:
NS_E_29988_ETR_TBL:
NS_E_29988_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_28970_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30316
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29988_MTC_0_failed
LB_30316:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_30324
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_30324
	jmp LB_30325
LB_30324:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30322
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30322:
	jmp NS_E_29988_MTC_0_failed
LB_30325:
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
	jc LB_30310
	btr QWORD [rdi],1
LB_30310:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30311
	btr QWORD [rdi],0
LB_30311:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29988_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_29041_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30308
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29988_MTC_1_failed
LB_30308:
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
	jc LB_30303
	btr QWORD [rdi],0
LB_30303:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29988_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_29990_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30301
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29988_MTC_2_failed
LB_30301:
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
	jc LB_30296
	btr QWORD [rdi],0
LB_30296:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29988_MTC_2_failed:
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
NS_E_29990:
NS_E_RDI_29990:
NS_E_29990_ETR_TBL:
NS_E_29990_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	push r10
	call NS_E_29530_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30371
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29990_MTC_0_failed
LB_30371:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_30379
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_30379
	jmp LB_30380
LB_30379:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30377
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30377:
	jmp NS_E_29990_MTC_0_failed
LB_30380:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_29990_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30384
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30385
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30385:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30386
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30386:
	jmp NS_E_29990_MTC_0_failed
LB_30384:
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
	jc LB_30364
	btr QWORD [rdi],2
LB_30364:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30365
	btr QWORD [rdi],1
LB_30365:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30366
	btr QWORD [rdi],0
LB_30366:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29990_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30347
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29990_MTC_1_failed
LB_30347:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_30355
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_30355
	jmp LB_30356
LB_30355:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30353
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30353:
	jmp NS_E_29990_MTC_1_failed
LB_30356:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_29990_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30360
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30361
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30361:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30362
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30362:
	jmp NS_E_29990_MTC_1_failed
LB_30360:
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
	jc LB_30340
	btr QWORD [rdi],2
LB_30340:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30341
	btr QWORD [rdi],1
LB_30341:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30342
	btr QWORD [rdi],0
LB_30342:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29990_MTC_1_failed:
	add rsp,48
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30338
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29990_MTC_2_failed
LB_30338:
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
	jc LB_30333
	btr QWORD [rdi],0
LB_30333:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29990_MTC_2_failed:
	add rsp,16
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	push r10
	call NS_E_29530_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30331
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29990_MTC_3_failed
LB_30331:
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
	jc LB_30326
	btr QWORD [rdi],0
LB_30326:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0300_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29990_MTC_3_failed:
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
NS_E_29992:
NS_E_RDI_29992:
NS_E_29992_ETR_TBL:
NS_E_29992_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\136\144"
	add r14,3
	cmp r14,r10
	jg LB_30400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_30400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_30400
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_30400
	jmp LB_30401
LB_30400:
	jmp NS_E_29992_MTC_0_failed
LB_30401:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30405
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30406
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30406:
	jmp NS_E_29992_MTC_0_failed
LB_30405:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	add r14,1
	cmp r14,r10
	jg LB_30415
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_30415
	jmp LB_30416
LB_30415:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30412
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30412:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30413
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30413:
	jmp NS_E_29992_MTC_0_failed
LB_30416:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	push r10
	call NS_E_30000_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30420
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30421
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30421:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30422
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30422:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30423
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30423:
	jmp NS_E_29992_MTC_0_failed
LB_30420:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	push r10
	call NS_E_29994_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30428
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_30429
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_30429:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30430
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30430:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30431
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30431:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30432
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30432:
	jmp NS_E_29992_MTC_0_failed
LB_30428:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; dta_def_coprd
	push r10
	call NS_E_29994_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30437
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_30438
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_30438:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_30439
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_30439:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30440
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30440:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30441
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30441:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30442
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30442:
	jmp NS_E_29992_MTC_0_failed
LB_30437:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0006_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_30388
	btr QWORD [rdi],5
LB_30388:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_30389
	btr QWORD [rdi],4
LB_30389:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_30390
	btr QWORD [rdi],3
LB_30390:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_30391
	btr QWORD [rdi],2
LB_30391:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30392
	btr QWORD [rdi],1
LB_30392:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30393
	btr QWORD [rdi],0
LB_30393:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,96
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29992_MTC_0_failed:
	add rsp,96
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
NS_E_29994:
NS_E_RDI_29994:
NS_E_29994_ETR_TBL:
NS_E_29994_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_30452
LB_30451:
	add r14,1
LB_30452:
	cmp r14,r10
	jge LB_30453
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30451
	cmp al,10
	jz LB_30451
	cmp al,32
	jz LB_30451
LB_30453:
	add r14,3
	cmp r14,r10
	jg LB_30456
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_30456
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_30456
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_30456
	jmp LB_30457
LB_30456:
	jmp NS_E_29994_MTC_0_failed
LB_30457:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_30459
LB_30458:
	add r14,1
LB_30459:
	cmp r14,r10
	jge LB_30460
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30458
	cmp al,10
	jz LB_30458
	cmp al,32
	jz LB_30458
LB_30460:
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30461
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30462
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30462:
	jmp NS_E_29994_MTC_0_failed
LB_30461:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_30465
LB_30464:
	add r14,1
LB_30465:
	cmp r14,r10
	jge LB_30466
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30464
	cmp al,10
	jz LB_30464
	cmp al,32
	jz LB_30464
LB_30466:
	add r14,1
	cmp r14,r10
	jg LB_30471
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_30471
	jmp LB_30472
LB_30471:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30468
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30468:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30469
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30469:
	jmp NS_E_29994_MTC_0_failed
LB_30472:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_30474
LB_30473:
	add r14,1
LB_30474:
	cmp r14,r10
	jge LB_30475
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30473
	cmp al,10
	jz LB_30473
	cmp al,32
	jz LB_30473
LB_30475:
	push r10
	call NS_E_30000_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30476
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30477
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30477:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30478
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30478:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30479
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30479:
	jmp NS_E_29994_MTC_0_failed
LB_30476:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	jmp LB_30482
LB_30481:
	add r14,1
LB_30482:
	cmp r14,r10
	jge LB_30483
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30481
	cmp al,10
	jz LB_30481
	cmp al,32
	jz LB_30481
LB_30483:
	push r10
	call NS_E_29994_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30484
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_30485
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_30485:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30486
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30486:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30487
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30487:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30488
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30488:
	jmp NS_E_29994_MTC_0_failed
LB_30484:
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
	jc LB_30445
	btr QWORD [rdi],4
LB_30445:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_30446
	btr QWORD [rdi],3
LB_30446:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_30447
	btr QWORD [rdi],2
LB_30447:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30448
	btr QWORD [rdi],1
LB_30448:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30449
	btr QWORD [rdi],0
LB_30449:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,80
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29994_MTC_0_failed:
	add rsp,80
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29994_MTC_1_failed:
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
NS_E_29996:
NS_E_RDI_29996:
NS_E_29996_ETR_TBL:
NS_E_29996_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_30557
LB_30556:
	add r14,1
LB_30557:
	cmp r14,r10
	jge LB_30558
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30556
	cmp al,10
	jz LB_30556
	cmp al,32
	jz LB_30556
LB_30558:
	push r10
	call NS_E_29990_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30559
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_29996_MTC_0_failed
LB_30559:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_30562
LB_30561:
	add r14,1
LB_30562:
	cmp r14,r10
	jge LB_30563
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30561
	cmp al,10
	jz LB_30561
	cmp al,32
	jz LB_30561
LB_30563:
	push r10
	call NS_E_30008_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30564
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30565
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30565:
	jmp NS_E_29996_MTC_0_failed
LB_30564:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_30568
LB_30567:
	add r14,1
LB_30568:
	cmp r14,r10
	jge LB_30569
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30567
	cmp al,10
	jz LB_30567
	cmp al,32
	jz LB_30567
LB_30569:
	add r14,3
	cmp r14,r10
	jg LB_30574
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_30574
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_30574
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_30574
	jmp LB_30575
LB_30574:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30571
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30571:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30572
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30572:
	jmp NS_E_29996_MTC_0_failed
LB_30575:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_30577
LB_30576:
	add r14,1
LB_30577:
	cmp r14,r10
	jge LB_30578
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30576
	cmp al,10
	jz LB_30576
	cmp al,32
	jz LB_30576
LB_30578:
	push r10
	call NS_E_30008_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30579
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30580
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30580:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30581
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30581:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30582
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30582:
	jmp NS_E_29996_MTC_0_failed
LB_30579:
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
	jc LB_30551
	btr QWORD [rdi],3
LB_30551:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_30552
	btr QWORD [rdi],2
LB_30552:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30553
	btr QWORD [rdi],1
LB_30553:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30554
	btr QWORD [rdi],0
LB_30554:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,64
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29996_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_30513
LB_30512:
	add r14,1
LB_30513:
	cmp r14,r10
	jge LB_30514
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30512
	cmp al,10
	jz LB_30512
	cmp al,32
	jz LB_30512
LB_30514:
	add r14,1
	cmp r14,r10
	jg LB_30517
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_30517
	jmp LB_30518
LB_30517:
	jmp NS_E_29996_MTC_1_failed
LB_30518:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_30520
LB_30519:
	add r14,1
LB_30520:
	cmp r14,r10
	jge LB_30521
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30519
	cmp al,10
	jz LB_30519
	cmp al,32
	jz LB_30519
LB_30521:
	push r10
	call NS_E_30008_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30522
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30523
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30523:
	jmp NS_E_29996_MTC_1_failed
LB_30522:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_30526
LB_30525:
	add r14,1
LB_30526:
	cmp r14,r10
	jge LB_30527
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30525
	cmp al,10
	jz LB_30525
	cmp al,32
	jz LB_30525
LB_30527:
	add r14,3
	cmp r14,r10
	jg LB_30532
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_30532
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_30532
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_30532
	jmp LB_30533
LB_30532:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30529
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30529:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30530
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30530:
	jmp NS_E_29996_MTC_1_failed
LB_30533:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_30535
LB_30534:
	add r14,1
LB_30535:
	cmp r14,r10
	jge LB_30536
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30534
	cmp al,10
	jz LB_30534
	cmp al,32
	jz LB_30534
LB_30536:
	push r10
	call NS_E_30008_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30537
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30538
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30538:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30539
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30539:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30540
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30540:
	jmp NS_E_29996_MTC_1_failed
LB_30537:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; cmm_reg_ptn
	jmp LB_30543
LB_30542:
	add r14,1
LB_30543:
	cmp r14,r10
	jge LB_30544
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30542
	cmp al,10
	jz LB_30542
	cmp al,32
	jz LB_30542
LB_30544:
	push r10
	call NS_E_29998_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30545
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_30546
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_30546:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_30547
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_30547:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30548
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30548:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30549
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30549:
	jmp NS_E_29996_MTC_1_failed
LB_30545:
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
	jc LB_30506
	btr QWORD [rdi],4
LB_30506:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_30507
	btr QWORD [rdi],3
LB_30507:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_30508
	btr QWORD [rdi],2
LB_30508:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30509
	btr QWORD [rdi],1
LB_30509:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30510
	btr QWORD [rdi],0
LB_30510:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,80
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29996_MTC_1_failed:
	add rsp,80
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_30494
LB_30493:
	add r14,1
LB_30494:
	cmp r14,r10
	jge LB_30495
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30493
	cmp al,10
	jz LB_30493
	cmp al,32
	jz LB_30493
LB_30495:
	add r14,3
	cmp r14,r10
	jg LB_30498
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_30498
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_30498
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_30498
	jmp LB_30499
LB_30498:
	jmp NS_E_29996_MTC_2_failed
LB_30499:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_30501
LB_30500:
	add r14,1
LB_30501:
	cmp r14,r10
	jge LB_30502
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30500
	cmp al,10
	jz LB_30500
	cmp al,32
	jz LB_30500
LB_30502:
	push r10
	call NS_E_30008_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30503
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30504
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30504:
	jmp NS_E_29996_MTC_2_failed
LB_30503:
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
	jc LB_30490
	btr QWORD [rdi],1
LB_30490:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30491
	btr QWORD [rdi],0
LB_30491:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29996_MTC_2_failed:
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
NS_E_29998:
NS_E_RDI_29998:
NS_E_29998_ETR_TBL:
NS_E_29998_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	jmp LB_30588
LB_30587:
	add r14,1
LB_30588:
	cmp r14,r10
	jge LB_30589
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30587
	cmp al,10
	jz LB_30587
	cmp al,32
	jz LB_30587
LB_30589:
	add r14,1
	cmp r14,r10
	jg LB_30592
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_30592
	jmp LB_30593
LB_30592:
	jmp NS_E_29998_MTC_0_failed
LB_30593:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_30595
LB_30594:
	add r14,1
LB_30595:
	cmp r14,r10
	jge LB_30596
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30594
	cmp al,10
	jz LB_30594
	cmp al,32
	jz LB_30594
LB_30596:
	push r10
	call NS_E_30008_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30597
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30598
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30598:
	jmp NS_E_29998_MTC_0_failed
LB_30597:
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
	jc LB_30584
	btr QWORD [rdi],1
LB_30584:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30585
	btr QWORD [rdi],0
LB_30585:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_29998_MTC_0_failed:
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
NS_E_30000:
NS_E_RDI_30000:
NS_E_30000_ETR_TBL:
NS_E_30000_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_imp
	push r10
	call NS_E_30002_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30605
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_30000_MTC_0_failed
LB_30605:
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
	jc LB_30600
	btr QWORD [rdi],0
LB_30600:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30000_MTC_0_failed:
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
NS_E_30002:
NS_E_RDI_30002:
NS_E_30002_ETR_TBL:
NS_E_30002_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_app
	jmp LB_30619
LB_30618:
	add r14,1
LB_30619:
	cmp r14,r10
	jge LB_30620
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30618
	cmp al,10
	jz LB_30618
	cmp al,32
	jz LB_30618
LB_30620:
	push r10
	call NS_E_30004_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30621
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_30002_MTC_0_failed
LB_30621:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\134\146"
	jmp LB_30624
LB_30623:
	add r14,1
LB_30624:
	cmp r14,r10
	jge LB_30625
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30623
	cmp al,10
	jz LB_30623
	cmp al,32
	jz LB_30623
LB_30625:
	add r14,3
	cmp r14,r10
	jg LB_30629
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_30629
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_30629
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_30629
	jmp LB_30630
LB_30629:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30627
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30627:
	jmp NS_E_30002_MTC_0_failed
LB_30630:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_imp
	jmp LB_30632
LB_30631:
	add r14,1
LB_30632:
	cmp r14,r10
	jge LB_30633
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30631
	cmp al,10
	jz LB_30631
	cmp al,32
	jz LB_30631
LB_30633:
	push r10
	call NS_E_30002_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30634
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30635
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30635:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30636
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30636:
	jmp NS_E_30002_MTC_0_failed
LB_30634:
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
	jc LB_30614
	btr QWORD [rdi],2
LB_30614:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30615
	btr QWORD [rdi],1
LB_30615:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30616
	btr QWORD [rdi],0
LB_30616:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30002_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_30610
LB_30609:
	add r14,1
LB_30610:
	cmp r14,r10
	jge LB_30611
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30609
	cmp al,10
	jz LB_30609
	cmp al,32
	jz LB_30609
LB_30611:
	push r10
	call NS_E_30004_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30612
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_30002_MTC_1_failed
LB_30612:
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
	jc LB_30607
	btr QWORD [rdi],0
LB_30607:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30002_MTC_1_failed:
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
NS_E_30004:
NS_E_RDI_30004:
NS_E_30004_ETR_TBL:
NS_E_30004_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_30650
LB_30649:
	add r14,1
LB_30650:
	cmp r14,r10
	jge LB_30651
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30649
	cmp al,10
	jz LB_30649
	cmp al,32
	jz LB_30649
LB_30651:
	push r10
	call NS_E_30006_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30652
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_30004_MTC_0_failed
LB_30652:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\151\130"
	jmp LB_30655
LB_30654:
	add r14,1
LB_30655:
	cmp r14,r10
	jge LB_30656
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30654
	cmp al,10
	jz LB_30654
	cmp al,32
	jz LB_30654
LB_30656:
	add r14,3
	cmp r14,r10
	jg LB_30660
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_30660
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_30660
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_30660
	jmp LB_30661
LB_30660:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30658
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30658:
	jmp NS_E_30004_MTC_0_failed
LB_30661:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_atm
	jmp LB_30663
LB_30662:
	add r14,1
LB_30663:
	cmp r14,r10
	jge LB_30664
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30662
	cmp al,10
	jz LB_30662
	cmp al,32
	jz LB_30662
LB_30664:
	push r10
	call NS_E_30006_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30665
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30666
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30666:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30667
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30667:
	jmp NS_E_30004_MTC_0_failed
LB_30665:
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
	jc LB_30645
	btr QWORD [rdi],2
LB_30645:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30646
	btr QWORD [rdi],1
LB_30646:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30647
	btr QWORD [rdi],0
LB_30647:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30004_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_30641
LB_30640:
	add r14,1
LB_30641:
	cmp r14,r10
	jge LB_30642
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30640
	cmp al,10
	jz LB_30640
	cmp al,32
	jz LB_30640
LB_30642:
	push r10
	call NS_E_30006_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30643
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_30004_MTC_1_failed
LB_30643:
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
	jc LB_30638
	btr QWORD [rdi],0
LB_30638:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30004_MTC_1_failed:
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
NS_E_30006:
NS_E_RDI_30006:
NS_E_30006_ETR_TBL:
NS_E_30006_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30674
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_30006_MTC_0_failed
LB_30674:
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
	jc LB_30669
	btr QWORD [rdi],0
LB_30669:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30006_MTC_0_failed:
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
NS_E_30008:
NS_E_RDI_30008:
NS_E_30008_ETR_TBL:
NS_E_30008_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_30688
LB_30687:
	add r14,1
LB_30688:
	cmp r14,r10
	jge LB_30689
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30687
	cmp al,10
	jz LB_30687
	cmp al,32
	jz LB_30687
LB_30689:
	add r14,1
	cmp r14,r10
	jg LB_30692
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_30692
	jmp LB_30693
LB_30692:
	jmp NS_E_30008_MTC_0_failed
LB_30693:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_30695
LB_30694:
	add r14,1
LB_30695:
	cmp r14,r10
	jge LB_30696
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30694
	cmp al,10
	jz LB_30694
	cmp al,32
	jz LB_30694
LB_30696:
	push r10
	call NS_E_30010_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30697
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30698
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30698:
	jmp NS_E_30008_MTC_0_failed
LB_30697:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_30701
LB_30700:
	add r14,1
LB_30701:
	cmp r14,r10
	jge LB_30702
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30700
	cmp al,10
	jz LB_30700
	cmp al,32
	jz LB_30700
LB_30702:
	add r14,1
	cmp r14,r10
	jg LB_30707
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_30707
	jmp LB_30708
LB_30707:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30704
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30704:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30705
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30705:
	jmp NS_E_30008_MTC_0_failed
LB_30708:
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
	jc LB_30683
	btr QWORD [rdi],2
LB_30683:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30684
	btr QWORD [rdi],1
LB_30684:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30685
	btr QWORD [rdi],0
LB_30685:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,48
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30008_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_30679
LB_30678:
	add r14,1
LB_30679:
	cmp r14,r10
	jge LB_30680
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30678
	cmp al,10
	jz LB_30678
	cmp al,32
	jz LB_30678
LB_30680:
	push r10
	call NS_E_30012_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30681
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_30008_MTC_1_failed
LB_30681:
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
	jc LB_30676
	btr QWORD [rdi],0
LB_30676:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30008_MTC_1_failed:
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
NS_E_30010:
NS_E_RDI_30010:
NS_E_30010_ETR_TBL:
NS_E_30010_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg
	jmp LB_30714
LB_30713:
	add r14,1
LB_30714:
	cmp r14,r10
	jge LB_30715
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30713
	cmp al,10
	jz LB_30713
	cmp al,32
	jz LB_30713
LB_30715:
	push r10
	call NS_E_30012_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30716
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_30010_MTC_0_failed
LB_30716:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn_lst
	jmp LB_30719
LB_30718:
	add r14,1
LB_30719:
	cmp r14,r10
	jge LB_30720
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30718
	cmp al,10
	jz LB_30718
	cmp al,32
	jz LB_30718
LB_30720:
	push r10
	call NS_E_30010_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30721
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30722
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30722:
	jmp NS_E_30010_MTC_0_failed
LB_30721:
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
	jc LB_30710
	btr QWORD [rdi],1
LB_30710:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30711
	btr QWORD [rdi],0
LB_30711:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30010_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	add rsp,0
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30010_MTC_1_failed:
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
NS_E_30012:
NS_E_RDI_30012:
NS_E_30012_ETR_TBL:
NS_E_30012_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_30748
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_30748
	jmp LB_30749
LB_30748:
	jmp NS_E_30012_MTC_0_failed
LB_30749:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30753
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30754
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30754:
	jmp NS_E_30012_MTC_0_failed
LB_30753:
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
	jc LB_30740
	btr QWORD [rdi],1
LB_30740:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30741
	btr QWORD [rdi],0
LB_30741:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,32
	add rsp,8
	mov rax,0x0000_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30012_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_30736
LB_30735:
	add r14,1
LB_30736:
	cmp r14,r10
	jge LB_30737
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_30735
	cmp al,10
	jz LB_30735
	cmp al,32
	jz LB_30735
LB_30737:
	push r10
	call NS_E_29395_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30738
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_30012_MTC_1_failed
LB_30738:
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
	jc LB_30733
	btr QWORD [rdi],0
LB_30733:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0100_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30012_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_30731
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_30731
	jmp LB_30732
LB_30731:
	jmp NS_E_30012_MTC_2_failed
LB_30732:
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
	jc LB_30724
	btr QWORD [rdi],0
LB_30724:
	mov rax,QWORD [rsp+16*0+8*1]
	mov [rdi+8*1+8*0],rax
	add rsp,16
	add rsp,8
	mov rax,0x0200_0000_0000_0001
	or rdi,rax
	mov r8,0
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30012_MTC_2_failed:
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
NS_E_30757:
NS_E_RDI_30757:
; 	» "a" _ ⊢ 0' : %_30756
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ {  }
 ; {>  %_30756~0':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_30758
	mov rdi,r13
	call dlt
LB_30758:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_28968:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_28968
	NS_E_DYN_28971:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_28971
	NS_E_DYN_28972:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_28972
	NS_E_DYN_28973:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_28973
	NS_E_DYN_28974:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_28974
	NS_E_DYN_28988:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_28988
	NS_E_DYN_29031:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29031
	NS_E_DYN_29041:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29041
	NS_E_DYN_29042:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29042
	NS_E_DYN_29043:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29043
	NS_E_DYN_29252:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29252
	NS_E_DYN_29290:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29290
	NS_E_DYN_29328:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29328
	NS_E_DYN_29366:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29366
	NS_E_DYN_29395:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29395
	NS_E_DYN_29396:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29396
	NS_E_DYN_29397:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29397
	NS_E_DYN_29530:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29530
	NS_E_DYN_29576:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_29575:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29575
	NS_E_DYN_29586:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_29587:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_29588:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29588
	NS_E_DYN_29589:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29589
	NS_E_DYN_29590:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29590
	CST_DYN_29945:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_30013:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30014:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_29984:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29984
	NS_E_DYN_30015:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30016:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_30017:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_30018:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_30019:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_30020:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 5
	NS_E_DYN_30021:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 6
	NS_E_DYN_29986:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29986
	NS_E_DYN_30022:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30023:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_30024:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_29988:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29988
	NS_E_DYN_30025:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30026:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_30027:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_30028:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_29990:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29990
	NS_E_DYN_30029:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_29992:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29992
	NS_E_DYN_30030:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30031:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_29994:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29994
	NS_E_DYN_30032:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30033:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_30034:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_29996:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29996
	NS_E_DYN_30035:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_29998:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_29998
	NS_E_DYN_30036:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30000:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30000
	NS_E_DYN_30037:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30038:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_30002:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30002
	NS_E_DYN_30039:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30040:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_30004:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30004
	NS_E_DYN_30041:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30006:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30006
	NS_E_DYN_30042:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30043:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_30008:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30008
	NS_E_DYN_30044:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30045:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_30010:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30010
	NS_E_DYN_30046:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_30047:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_30048:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_30012:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30012
	CST_DYN_30757:
		dq 0x0000_0001_00_82_ffff
		dq 1
