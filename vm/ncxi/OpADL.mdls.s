%include "cmu.s"
main:
	mov r12,~0
	call SFLS_init
	call NS_E_31801
	call NS_E_32613
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
NS_E_30760:
NS_E_RDI_30760:
NS_E_30760_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_30761
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_30761:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30763:
NS_E_RDI_30763:
NS_E_30763_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_30763_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_30763_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30764:
NS_E_RDI_30764:
NS_E_30764_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_30764_LB_0
	cmp r11,57
	ja NS_E_30764_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_30764_LB_0:
	mov rax,0
	ret
NS_E_30766:
NS_E_RDI_30766:
NS_E_30766_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_30766_LB_0
	cmp r11,122
	ja NS_E_30766_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_30766_LB_0:
	mov rax,0
	ret
NS_E_30765:
NS_E_RDI_30765:
NS_E_30765_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_30765_LB_0
	cmp r11,90
	ja NS_E_30765_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_30765_LB_0:
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
NS_E_30762:
NS_E_RDI_30762:
NS_E_30762_ETR_TBL:
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
	jz NS_E_30762_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_30762_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_30780:
; 	|» { 0' 1' }
NS_E_RDI_30780:
MTC_LB_30781:
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_30782
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_30783
	bt QWORD [rax],0
	jc LB_30784
	btr r12,1
	jmp LB_30785
LB_30784:
	bts r12,1
LB_30785:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_30783:
	push r14
	mov r14,rax
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_30788
	btr r12,4
	jmp LB_30789
LB_30788:
	bts r12,4
LB_30789:
	mov r8,r10
	bt r12,4
	jc LB_30786
	btr r12,2
	jmp LB_30787
LB_30786:
	bts r12,2
LB_30787:
	mov rdi,r14
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_30792
	btr r12,4
	jmp LB_30793
LB_30792:
	bts r12,4
LB_30793:
	mov r9,r10
	bt r12,4
	jc LB_30790
	btr r12,3
	jmp LB_30791
LB_30790:
	bts r12,3
LB_30791:
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_30794:
	cmp r15,0
	jz LB_30795
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30794
LB_30795:
; _f38 %_30767 ⊢ %_30771 : %_30771
 ; {>  %_30769~2':_r64 %_30770~3':(_lst)◂(_r64) %_30767~0':_r64 }
	add r13,1
; _f30780 { %_30771 %_30770 } ⊢ { %_30772 %_30773 } : { %_30772 %_30773 }
 ; {>  %_30769~2':_r64 %_30771~0':_r64 %_30770~3':(_lst)◂(_r64) }
; _f30780 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_30798
	btr r12,1
	jmp LB_30799
LB_30798:
	bts r12,1
LB_30799:
	call NS_E_30780
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_30796
	btr r12,2
	jmp LB_30797
LB_30796:
	bts r12,2
LB_30797:
	add rsp,16
; _f37 %_30772 ⊢ %_30774 : %_30774
 ; {>  %_30769~2':_r64 %_30773~1':_stg %_30772~0':_r64 }
	sub r13,1
; _f16 { %_30773 %_30774 %_30769 } ⊢ { %_30775 %_30776 %_30777 } : { %_30775 %_30776 %_30777 }
 ; {>  %_30769~2':_r64 %_30773~1':_stg %_30774~0':_r64 }
; _f16 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_30800
	btr r12,3
	jmp LB_30801
LB_30800:
	bts r12,3
LB_30801:
	mov r14,r13
	bt r12,0
	jc LB_30802
	btr r12,1
	jmp LB_30803
LB_30802:
	bts r12,1
LB_30803:
	mov r13,r9
	bt r12,3
	jc LB_30804
	btr r12,0
	jmp LB_30805
LB_30804:
	bts r12,0
LB_30805:
	call NS_E_16
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_30776 %_30775 }
 ; {>  %_30775~0':_stg %_30776~1':_r64 %_30777~2':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_30806
	mov rdi,r8
	call dlt
LB_30806:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_30807
	btr r12,2
	jmp LB_30808
LB_30807:
	bts r12,2
LB_30808:
	mov r14,r13
	bt r12,0
	jc LB_30809
	btr r12,1
	jmp LB_30810
LB_30809:
	bts r12,1
LB_30810:
	mov r13,r8
	bt r12,2
	jc LB_30811
	btr r12,0
	jmp LB_30812
LB_30811:
	bts r12,0
LB_30812:
	ret
MTC_LB_30782:
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_30813
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r14
	bt QWORD [rax],17
	jnc LB_30814
	bt QWORD [rax],0
	jc LB_30815
	btr r12,1
	jmp LB_30816
LB_30815:
	bts r12,1
LB_30816:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_30814:
	push r14
	mov r14,rax
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r14
LB_30817:
	cmp r15,0
	jz LB_30818
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_30817
LB_30818:
; _f14 %_30767 ⊢ { %_30778 %_30779 } : { %_30778 %_30779 }
 ; {>  %_30767~0':_r64 }
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
; ∎ { %_30778 %_30779 }
 ; {>  %_30778~0':_r64 %_30779~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_30813:
NS_E_30823:
; 	|» 0'
NS_E_RDI_30823:
; » 0xr0 |~ {  } ⊢ %_30820 : %_30820
 ; {>  %_30819~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_30820
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f30780 { %_30820 %_30819 } ⊢ { %_30821 %_30822 } : { %_30821 %_30822 }
 ; {>  %_30819~0':(_lst)◂(_r64) %_30820~1':_r64 }
; _f30780 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_30824
	btr r12,2
	jmp LB_30825
LB_30824:
	bts r12,2
LB_30825:
	mov r14,r13
	bt r12,0
	jc LB_30826
	btr r12,1
	jmp LB_30827
LB_30826:
	bts r12,1
LB_30827:
	mov r13,r8
	bt r12,2
	jc LB_30828
	btr r12,0
	jmp LB_30829
LB_30828:
	bts r12,0
LB_30829:
	call NS_E_30780
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_30822
 ; {>  %_30822~1':_stg %_30821~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_30830
	mov rdi,r13
	call dlt
LB_30830:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_30831
	btr r12,0
	jmp LB_30832
LB_30831:
	bts r12,0
LB_30832:
	ret
NS_E_30833:
NS_E_RDI_30833:
NS_E_30833_ETR_TBL:
NS_E_30833_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_30873
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_30873
	jmp LB_30874
LB_30873:
	jmp NS_E_30833_MTC_0_failed
LB_30874:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_30834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30878
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30879
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30879:
	jmp NS_E_30833_MTC_0_failed
LB_30878:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30866
	btr r12,1
	jmp LB_30867
LB_30866:
	bts r12,1
LB_30867:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30864
	btr r12,0
	jmp LB_30865
LB_30864:
	bts r12,0
LB_30865:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_30861
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_30881
	btr r12,2
	jmp LB_30882
LB_30881:
	bts r12,2
LB_30882:
	mov r13,r14
	bt r12,1
	jc LB_30883
	btr r12,0
	jmp LB_30884
LB_30883:
	bts r12,0
LB_30884:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f30823 %_30836 ⊢ %_30837 : %_30837
 ; {>  %_30836~0':(_lst)◂(_r64) }
; _f30823 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_30823
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_30837 ⊢ %_30838 : %_30838
 ; {>  %_30837~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_30838
 ; {>  %_30838~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30859
	btr r12,3
	jmp LB_30860
LB_30859:
	bts r12,3
LB_30860:
	mov r8,0
	bts r12,2
	ret
LB_30861:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30863
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_30862
LB_30863:
	add rsp,8
	ret
NS_E_30833_MTC_0_failed:
	add rsp,32
	pop r14
LB_30862:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30834:
NS_E_RDI_30834:
NS_E_30834_ETR_TBL:
NS_E_30834_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_30909
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_30909
	jmp LB_30910
LB_30909:
	jmp NS_E_30834_MTC_0_failed
LB_30910:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_30835_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30914
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30915
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30915:
	jmp NS_E_30834_MTC_0_failed
LB_30914:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_30834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30920
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_30921
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_30921:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30922
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30922:
	jmp NS_E_30834_MTC_0_failed
LB_30920:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_30902
	btr r12,2
	jmp LB_30903
LB_30902:
	bts r12,2
LB_30903:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30900
	btr r12,1
	jmp LB_30901
LB_30900:
	bts r12,1
LB_30901:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30898
	btr r12,0
	jmp LB_30899
LB_30898:
	bts r12,0
LB_30899:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_30895
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_30924
	btr r12,3
	jmp LB_30925
LB_30924:
	bts r12,3
LB_30925:
	mov r14,r8
	bt r12,2
	jc LB_30926
	btr r12,1
	jmp LB_30927
LB_30926:
	bts r12,1
LB_30927:
	mov r8,r13
	bt r12,0
	jc LB_30928
	btr r12,2
	jmp LB_30929
LB_30928:
	bts r12,2
LB_30929:
	mov r13,r9
	bt r12,3
	jc LB_30930
	btr r12,0
	jmp LB_30931
LB_30930:
	bts r12,0
LB_30931:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_30839 %_30840 } ⊢ %_30841 : %_30841
 ; {>  %_30839~0':_r64 %_30840~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_30841 ⊢ %_30842 : %_30842
 ; {>  %_30841~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_30842
 ; {>  %_30842~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_30889
	btr r12,2
	jmp LB_30890
LB_30889:
	bts r12,2
LB_30890:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_30887
	btr QWORD [rdi],0
	jmp LB_30888
LB_30887:
	bts QWORD [rdi],0
LB_30888:
	mov r8,r14
	bt r12,1
	jc LB_30893
	btr r12,2
	jmp LB_30894
LB_30893:
	bts r12,2
LB_30894:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_30891
	btr QWORD [rdi],1
	jmp LB_30892
LB_30891:
	bts QWORD [rdi],1
LB_30892:
	mov rsi,1
	bt r12,3
	jc LB_30885
	mov rsi,0
	bt r9,0
	jc LB_30885
	jmp LB_30886
LB_30885:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_30886:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_30895:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30897
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_30896
LB_30897:
	add rsp,8
	ret
NS_E_30834_MTC_0_failed:
	add rsp,48
	pop r14
LB_30896:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_30944
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_30944
	jmp LB_30945
LB_30944:
	jmp NS_E_30834_MTC_1_failed
LB_30945:
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
	jc LB_30937
	btr r12,0
	jmp LB_30938
LB_30937:
	bts r12,0
LB_30938:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30934
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_30843 : %_30843
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_30843 ⊢ %_30844 : %_30844
 ; {>  %_30843~°1◂{  }:(_lst)◂(t8225'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_30844
 ; {>  %_30844~°0◂°1◂{  }:(_opn)◂((_lst)◂(t8228'(0))) }
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
	jc LB_30932
	mov rsi,0
	bt r9,0
	jc LB_30932
	jmp LB_30933
LB_30932:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_30933:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_30934:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30936
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_30935
LB_30936:
	add rsp,8
	ret
NS_E_30834_MTC_1_failed:
	add rsp,16
	pop r14
LB_30935:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_30760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30966
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_30834_MTC_2_failed
LB_30966:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_30834_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_30971
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_30972
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_30972:
	jmp NS_E_30834_MTC_2_failed
LB_30971:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_30961
	btr r12,1
	jmp LB_30962
LB_30961:
	bts r12,1
LB_30962:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_30959
	btr r12,0
	jmp LB_30960
LB_30959:
	bts r12,0
LB_30960:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_30956
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_30845 %_30846 } ⊢ %_30847 : %_30847
 ; {>  %_30846~1':(_lst)◂(_r64) %_30845~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_30847 ⊢ %_30848 : %_30848
 ; {>  %_30847~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_30848
 ; {>  %_30848~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_30950
	btr r12,2
	jmp LB_30951
LB_30950:
	bts r12,2
LB_30951:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_30948
	btr QWORD [rdi],0
	jmp LB_30949
LB_30948:
	bts QWORD [rdi],0
LB_30949:
	mov r8,r14
	bt r12,1
	jc LB_30954
	btr r12,2
	jmp LB_30955
LB_30954:
	bts r12,2
LB_30955:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_30952
	btr QWORD [rdi],1
	jmp LB_30953
LB_30952:
	bts QWORD [rdi],1
LB_30953:
	mov rsi,1
	bt r12,3
	jc LB_30946
	mov rsi,0
	bt r9,0
	jc LB_30946
	jmp LB_30947
LB_30946:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_30947:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_30956:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30958
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_30957
LB_30958:
	add rsp,8
	ret
NS_E_30834_MTC_2_failed:
	add rsp,32
	pop r14
LB_30957:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_30835:
NS_E_RDI_30835:
NS_E_30835_ETR_TBL:
NS_E_30835_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_30986
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_30986
	jmp LB_30987
LB_30986:
	jmp NS_E_30835_MTC_0_failed
LB_30987:
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
	jc LB_30979
	btr r12,0
	jmp LB_30980
LB_30979:
	bts r12,0
LB_30980:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30976
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_30849 : %_30849
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_30849
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_30849 ⊢ %_30850 : %_30850
 ; {>  %_30849~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30850
 ; {>  %_30850~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30974
	btr r12,3
	jmp LB_30975
LB_30974:
	bts r12,3
LB_30975:
	mov r8,0
	bts r12,2
	ret
LB_30976:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30978
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_30977
LB_30978:
	add rsp,8
	ret
NS_E_30835_MTC_0_failed:
	add rsp,16
	pop r14
LB_30977:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_31000
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_31000
	jmp LB_31001
LB_31000:
	jmp NS_E_30835_MTC_1_failed
LB_31001:
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
	jc LB_30993
	btr r12,0
	jmp LB_30994
LB_30993:
	bts r12,0
LB_30994:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_30990
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_30851 : %_30851
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_30851
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_30851 ⊢ %_30852 : %_30852
 ; {>  %_30851~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30852
 ; {>  %_30852~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_30988
	btr r12,3
	jmp LB_30989
LB_30988:
	bts r12,3
LB_30989:
	mov r8,0
	bts r12,2
	ret
LB_30990:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_30992
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_30991
LB_30992:
	add rsp,8
	ret
NS_E_30835_MTC_1_failed:
	add rsp,16
	pop r14
LB_30991:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_31014
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_31014
	jmp LB_31015
LB_31014:
	jmp NS_E_30835_MTC_2_failed
LB_31015:
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
	jc LB_31007
	btr r12,0
	jmp LB_31008
LB_31007:
	bts r12,0
LB_31008:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31004
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_30853 : %_30853
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_30853
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_30853 ⊢ %_30854 : %_30854
 ; {>  %_30853~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30854
 ; {>  %_30854~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31002
	btr r12,3
	jmp LB_31003
LB_31002:
	bts r12,3
LB_31003:
	mov r8,0
	bts r12,2
	ret
LB_31004:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31006
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31005
LB_31006:
	add rsp,8
	ret
NS_E_30835_MTC_2_failed:
	add rsp,16
	pop r14
LB_31005:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_31028
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_31028
	jmp LB_31029
LB_31028:
	jmp NS_E_30835_MTC_3_failed
LB_31029:
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
	jc LB_31021
	btr r12,0
	jmp LB_31022
LB_31021:
	bts r12,0
LB_31022:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31018
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_30855 : %_30855
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_30855
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_30855 ⊢ %_30856 : %_30856
 ; {>  %_30855~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30856
 ; {>  %_30856~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31016
	btr r12,3
	jmp LB_31017
LB_31016:
	bts r12,3
LB_31017:
	mov r8,0
	bts r12,2
	ret
LB_31018:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31020
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31019
LB_31020:
	add rsp,8
	ret
NS_E_30835_MTC_3_failed:
	add rsp,16
	pop r14
LB_31019:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_31042
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_31042
	jmp LB_31043
LB_31042:
	jmp NS_E_30835_MTC_4_failed
LB_31043:
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
	jc LB_31035
	btr r12,0
	jmp LB_31036
LB_31035:
	bts r12,0
LB_31036:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31032
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_30857 : %_30857
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_30857
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_30857 ⊢ %_30858 : %_30858
 ; {>  %_30857~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_30858
 ; {>  %_30858~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31030
	btr r12,3
	jmp LB_31031
LB_31030:
	bts r12,3
LB_31031:
	mov r8,0
	bts r12,2
	ret
LB_31032:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31034
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31033
LB_31034:
	add rsp,8
	ret
NS_E_30835_MTC_4_failed:
	add rsp,16
	pop r14
LB_31033:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_31044:
NS_E_RDI_31044:
NS_E_31044_ETR_TBL:
NS_E_31044_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_30760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31080
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31044_MTC_0_failed
LB_31080:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31075
	btr r12,0
	jmp LB_31076
LB_31075:
	bts r12,0
LB_31076:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31072
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_31046 : %_31046
 ; {>  %_31045~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_31046
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_31047 : %_31047
 ; {>  %_31046~1':_r64 %_31045~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_31047
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f32 { %_31045 %_31046 } ⊢ { %_31048 %_31049 %_31050 } : { %_31048 %_31049 %_31050 }
 ; {>  %_31047~2':_r64 %_31046~1':_r64 %_31045~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f32 { %_31047 %_31048 } ⊢ { %_31051 %_31052 %_31053 } : { %_31051 %_31052 %_31053 }
 ; {>  %_31050~3':_r64 %_31047~2':_r64 %_31048~0':_r64 %_31049~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_31056:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_31057
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_31057
LB_31058:
	cmp r15,0
	jz LB_31059
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31058
LB_31059:
; _some %_31052 ⊢ %_31054 : %_31054
 ; {>  %_31052~0':_r64 %_31049~1':_r64 %_31051~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_31054
 ; {>  %_31054~°0◂0':(_opn)◂(_r64) %_31049~1':_r64 %_31051~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_31060
	mov rdi,r14
	call dlt
LB_31060:
	bt r12,2
	jc LB_31061
	mov rdi,r8
	call dlt
LB_31061:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31062
	btr r12,3
	jmp LB_31063
LB_31062:
	bts r12,3
LB_31063:
	mov r8,0
	bts r12,2
	ret
MTC_LB_31057:
LB_31065:
	cmp r15,0
	jz LB_31066
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31065
LB_31066:
; _none {  } ⊢ %_31055 : %_31055
 ; {>  %_31050~3':_r64 %_31053~4':_r64 %_31052~0':_r64 %_31049~1':_r64 %_31051~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_31055
 ; {>  %_31055~°1◂{  }:(_opn)◂(t8303'(0)) %_31050~3':_r64 %_31053~4':_r64 %_31052~0':_r64 %_31049~1':_r64 %_31051~2':_r64 }
; 	∎ °1◂{  }
	bt r12,3
	jc LB_31067
	mov rdi,r9
	call dlt
LB_31067:
	bt r12,4
	jc LB_31068
	mov rdi,r10
	call dlt
LB_31068:
	bt r12,0
	jc LB_31069
	mov rdi,r13
	call dlt
LB_31069:
	bt r12,1
	jc LB_31070
	mov rdi,r14
	call dlt
LB_31070:
	bt r12,2
	jc LB_31071
	mov rdi,r8
	call dlt
LB_31071:
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
MTC_LB_31064:
LB_31072:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31074
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31073
LB_31074:
	add rsp,8
	ret
NS_E_31044_MTC_0_failed:
	add rsp,16
	pop r14
LB_31073:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_31082:
NS_E_RDI_31082:
NS_E_31082_ETR_TBL:
NS_E_31082_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_30760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31118
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31082_MTC_0_failed
LB_31118:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31113
	btr r12,0
	jmp LB_31114
LB_31113:
	bts r12,0
LB_31114:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31110
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_31084 : %_31084
 ; {>  %_31083~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_31084
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_31085 : %_31085
 ; {>  %_31083~0':_r64 %_31084~1':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_31085
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f32 { %_31083 %_31084 } ⊢ { %_31086 %_31087 %_31088 } : { %_31086 %_31087 %_31088 }
 ; {>  %_31083~0':_r64 %_31085~2':_r64 %_31084~1':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f32 { %_31085 %_31086 } ⊢ { %_31089 %_31090 %_31091 } : { %_31089 %_31090 %_31091 }
 ; {>  %_31086~0':_r64 %_31088~3':_r64 %_31087~1':_r64 %_31085~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_31094:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_31095
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_31095
LB_31096:
	cmp r15,0
	jz LB_31097
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31096
LB_31097:
; _some %_31090 ⊢ %_31092 : %_31092
 ; {>  %_31087~1':_r64 %_31090~0':_r64 %_31089~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_31092
 ; {>  %_31092~°0◂0':(_opn)◂(_r64) %_31087~1':_r64 %_31089~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_31098
	mov rdi,r14
	call dlt
LB_31098:
	bt r12,2
	jc LB_31099
	mov rdi,r8
	call dlt
LB_31099:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31100
	btr r12,3
	jmp LB_31101
LB_31100:
	bts r12,3
LB_31101:
	mov r8,0
	bts r12,2
	ret
MTC_LB_31095:
LB_31103:
	cmp r15,0
	jz LB_31104
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31103
LB_31104:
; _none {  } ⊢ %_31093 : %_31093
 ; {>  %_31088~3':_r64 %_31087~1':_r64 %_31090~0':_r64 %_31091~4':_r64 %_31089~2':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_31093
 ; {>  %_31093~°1◂{  }:(_opn)◂(t8330'(0)) %_31088~3':_r64 %_31087~1':_r64 %_31090~0':_r64 %_31091~4':_r64 %_31089~2':_r64 }
; 	∎ °1◂{  }
	bt r12,3
	jc LB_31105
	mov rdi,r9
	call dlt
LB_31105:
	bt r12,1
	jc LB_31106
	mov rdi,r14
	call dlt
LB_31106:
	bt r12,0
	jc LB_31107
	mov rdi,r13
	call dlt
LB_31107:
	bt r12,4
	jc LB_31108
	mov rdi,r10
	call dlt
LB_31108:
	bt r12,2
	jc LB_31109
	mov rdi,r8
	call dlt
LB_31109:
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
MTC_LB_31102:
LB_31110:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31112
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31111
LB_31112:
	add rsp,8
	ret
NS_E_31082_MTC_0_failed:
	add rsp,16
	pop r14
LB_31111:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_31120:
NS_E_RDI_31120:
NS_E_31120_ETR_TBL:
NS_E_31120_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_30760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31156
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31120_MTC_0_failed
LB_31156:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31151
	btr r12,0
	jmp LB_31152
LB_31151:
	bts r12,0
LB_31152:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31148
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_31122 : %_31122
 ; {>  %_31121~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_31122
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_31123 : %_31123
 ; {>  %_31121~0':_r64 %_31122~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_31123
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f32 { %_31121 %_31122 } ⊢ { %_31124 %_31125 %_31126 } : { %_31124 %_31125 %_31126 }
 ; {>  %_31121~0':_r64 %_31122~1':_r64 %_31123~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f32 { %_31123 %_31124 } ⊢ { %_31127 %_31128 %_31129 } : { %_31127 %_31128 %_31129 }
 ; {>  %_31125~1':_r64 %_31126~3':_r64 %_31124~0':_r64 %_31123~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_31132:
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_31133
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_31133
LB_31134:
	cmp r15,0
	jz LB_31135
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31134
LB_31135:
; _some %_31128 ⊢ %_31130 : %_31130
 ; {>  %_31125~1':_r64 %_31127~2':_r64 %_31128~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_31130
 ; {>  %_31130~°0◂0':(_opn)◂(_r64) %_31125~1':_r64 %_31127~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_31136
	mov rdi,r14
	call dlt
LB_31136:
	bt r12,2
	jc LB_31137
	mov rdi,r8
	call dlt
LB_31137:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31138
	btr r12,3
	jmp LB_31139
LB_31138:
	bts r12,3
LB_31139:
	mov r8,0
	bts r12,2
	ret
MTC_LB_31133:
LB_31141:
	cmp r15,0
	jz LB_31142
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31141
LB_31142:
; _none {  } ⊢ %_31131 : %_31131
 ; {>  %_31125~1':_r64 %_31126~3':_r64 %_31127~2':_r64 %_31129~4':_r64 %_31128~0':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_31131
 ; {>  %_31125~1':_r64 %_31126~3':_r64 %_31127~2':_r64 %_31131~°1◂{  }:(_opn)◂(t8357'(0)) %_31129~4':_r64 %_31128~0':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_31143
	mov rdi,r14
	call dlt
LB_31143:
	bt r12,3
	jc LB_31144
	mov rdi,r9
	call dlt
LB_31144:
	bt r12,2
	jc LB_31145
	mov rdi,r8
	call dlt
LB_31145:
	bt r12,4
	jc LB_31146
	mov rdi,r10
	call dlt
LB_31146:
	bt r12,0
	jc LB_31147
	mov rdi,r13
	call dlt
LB_31147:
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
MTC_LB_31140:
LB_31148:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31150
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31149
LB_31150:
	add rsp,8
	ret
NS_E_31120_MTC_0_failed:
	add rsp,16
	pop r14
LB_31149:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_31158:
NS_E_RDI_31158:
NS_E_31158_ETR_TBL:
NS_E_31158_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_31120_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31173
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31158_MTC_0_failed
LB_31173:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31168
	btr r12,0
	jmp LB_31169
LB_31168:
	bts r12,0
LB_31169:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31165
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_31159 ⊢ %_31160 : %_31160
 ; {>  %_31159~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_31160
 ; {>  %_31160~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31163
	btr r12,3
	jmp LB_31164
LB_31163:
	bts r12,3
LB_31164:
	mov r8,0
	bts r12,2
	ret
LB_31165:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31167
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31166
LB_31167:
	add rsp,8
	ret
NS_E_31158_MTC_0_failed:
	add rsp,16
	pop r14
LB_31166:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_31082_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31185
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31158_MTC_1_failed
LB_31185:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31180
	btr r12,0
	jmp LB_31181
LB_31180:
	bts r12,0
LB_31181:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31177
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_31161 ⊢ %_31162 : %_31162
 ; {>  %_31161~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_31162
 ; {>  %_31162~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31175
	btr r12,3
	jmp LB_31176
LB_31175:
	bts r12,3
LB_31176:
	mov r8,0
	bts r12,2
	ret
LB_31177:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31179
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31178
LB_31179:
	add rsp,8
	ret
NS_E_31158_MTC_1_failed:
	add rsp,16
	pop r14
LB_31178:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_31187:
NS_E_RDI_31187:
NS_E_31187_ETR_TBL:
NS_E_31187_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_31158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31235
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31187_MTC_0_failed
LB_31235:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_31188_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31240
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31241
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31241:
	jmp NS_E_31187_MTC_0_failed
LB_31240:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_31230
	btr r12,1
	jmp LB_31231
LB_31230:
	bts r12,1
LB_31231:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31228
	btr r12,0
	jmp LB_31229
LB_31228:
	bts r12,0
LB_31229:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_31225
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_31190 %_31191 } ⊢ %_31192 : %_31192
 ; {>  %_31190~0':_r64 %_31191~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f30823 %_31192 ⊢ %_31193 : %_31193
 ; {>  %_31192~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f30823 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_31211
	btr r12,2
	jmp LB_31212
LB_31211:
	bts r12,2
LB_31212:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_31217
	btr r12,3
	jmp LB_31218
LB_31217:
	bts r12,3
LB_31218:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_31215
	btr QWORD [rdi],0
	jmp LB_31216
LB_31215:
	bts QWORD [rdi],0
LB_31216:
	mov r9,r14
	bt r12,1
	jc LB_31221
	btr r12,3
	jmp LB_31222
LB_31221:
	bts r12,3
LB_31222:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_31219
	btr QWORD [rdi],1
	jmp LB_31220
LB_31219:
	bts QWORD [rdi],1
LB_31220:
	mov rsi,1
	bt r12,0
	jc LB_31213
	mov rsi,0
	bt r13,0
	jc LB_31213
	jmp LB_31214
LB_31213:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_31214:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_30823
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_31193 ⊢ %_31194 : %_31194
 ; {>  %_31193~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_31194
 ; {>  %_31194~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31223
	btr r12,3
	jmp LB_31224
LB_31223:
	bts r12,3
LB_31224:
	mov r8,0
	bts r12,2
	ret
LB_31225:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31227
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31226
LB_31227:
	add rsp,8
	ret
NS_E_31187_MTC_0_failed:
	add rsp,32
	pop r14
LB_31226:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_31188:
NS_E_RDI_31188:
NS_E_31188_ETR_TBL:
NS_E_31188_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_31189_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31263
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31188_MTC_0_failed
LB_31263:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_31188_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31268
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31269
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31269:
	jmp NS_E_31188_MTC_0_failed
LB_31268:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_31258
	btr r12,1
	jmp LB_31259
LB_31258:
	bts r12,1
LB_31259:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31256
	btr r12,0
	jmp LB_31257
LB_31256:
	bts r12,0
LB_31257:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_31253
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_31195 %_31196 } ⊢ %_31197 : %_31197
 ; {>  %_31196~1':(_lst)◂(_r64) %_31195~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_31197 ⊢ %_31198 : %_31198
 ; {>  %_31197~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_31198
 ; {>  %_31198~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_31247
	btr r12,2
	jmp LB_31248
LB_31247:
	bts r12,2
LB_31248:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_31245
	btr QWORD [rdi],0
	jmp LB_31246
LB_31245:
	bts QWORD [rdi],0
LB_31246:
	mov r8,r14
	bt r12,1
	jc LB_31251
	btr r12,2
	jmp LB_31252
LB_31251:
	bts r12,2
LB_31252:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_31249
	btr QWORD [rdi],1
	jmp LB_31250
LB_31249:
	bts QWORD [rdi],1
LB_31250:
	mov rsi,1
	bt r12,3
	jc LB_31243
	mov rsi,0
	bt r9,0
	jc LB_31243
	jmp LB_31244
LB_31243:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_31244:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_31253:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31255
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31254
LB_31255:
	add rsp,8
	ret
NS_E_31188_MTC_0_failed:
	add rsp,32
	pop r14
LB_31254:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_31273
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_31199 : %_31199
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_31199 ⊢ %_31200 : %_31200
 ; {>  %_31199~°1◂{  }:(_lst)◂(t8401'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_31200
 ; {>  %_31200~°0◂°1◂{  }:(_opn)◂((_lst)◂(t8404'(0))) }
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
	jc LB_31271
	mov rsi,0
	bt r9,0
	jc LB_31271
	jmp LB_31272
LB_31271:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r9
	mov r9,rax
	btr r12,3
LB_31272:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_31273:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31275
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31274
LB_31275:
	add rsp,8
	ret
NS_E_31188_MTC_1_failed:
	add rsp,0
	pop r14
LB_31274:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_31189:
NS_E_RDI_31189:
NS_E_31189_ETR_TBL:
NS_E_31189_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_31158_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31286
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31189_MTC_0_failed
LB_31286:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31281
	btr r12,0
	jmp LB_31282
LB_31281:
	bts r12,0
LB_31282:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31278
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_31201 ⊢ %_31202 : %_31202
 ; {>  %_31201~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_31202
 ; {>  %_31202~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31276
	btr r12,3
	jmp LB_31277
LB_31276:
	bts r12,3
LB_31277:
	mov r8,0
	bts r12,2
	ret
LB_31278:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31280
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31279
LB_31280:
	add rsp,8
	ret
NS_E_31189_MTC_0_failed:
	add rsp,16
	pop r14
LB_31279:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_31044_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31305
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31189_MTC_1_failed
LB_31305:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31300
	btr r12,0
	jmp LB_31301
LB_31300:
	bts r12,0
LB_31301:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31297
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; 	» "P0" _ ⊢ 1' : %_31204
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_30_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; _f20 %_31204 ⊢ %_31205 : %_31205
 ; {>  %_31204~1':_stg %_31203~0':_r64 }
; _f20 1' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_31290
	btr r12,0
	jmp LB_31291
LB_31290:
	bts r12,0
LB_31291:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_31292
	btr r12,1
	jmp LB_31293
LB_31292:
	bts r12,1
LB_31293:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_31288
	btr r12,0
	jmp LB_31289
LB_31288:
	bts r12,0
LB_31289:
	add rsp,16
; _some %_31203 ⊢ %_31206 : %_31206
 ; {>  %_31203~0':_r64 %_31205~1':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_31206
 ; {>  %_31206~°0◂0':(_opn)◂(_r64) %_31205~1':_stg }
; 	∎ °0◂0'
	bt r12,1
	jc LB_31294
	mov rdi,r14
	call dlt
LB_31294:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31295
	btr r12,3
	jmp LB_31296
LB_31295:
	bts r12,3
LB_31296:
	mov r8,0
	bts r12,2
	ret
LB_31297:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31299
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31298
LB_31299:
	add rsp,8
	ret
NS_E_31189_MTC_1_failed:
	add rsp,16
	pop r14
LB_31298:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_31320
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_31320
	jmp LB_31321
LB_31320:
	jmp NS_E_31189_MTC_2_failed
LB_31321:
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
	jc LB_31313
	btr r12,0
	jmp LB_31314
LB_31313:
	bts r12,0
LB_31314:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31310
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 	» "P1" _ ⊢ 0' : %_31207
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_31_50
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; _f20 %_31207 ⊢ %_31208 : %_31208
 ; {>  %_31207~0':_stg }
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
; » 0xr5f |~ {  } ⊢ %_31209 : %_31209
 ; {>  %_31208~0':_stg }
; 	» 0xr5f _ ⊢ 1' : %_31209
	mov rdi,0x5f
	mov r14,rdi
	bts r12,1
; _some %_31209 ⊢ %_31210 : %_31210
 ; {>  %_31208~0':_stg %_31209~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_31210
 ; {>  %_31210~°0◂1':(_opn)◂(_r64) %_31208~0':_stg }
; 	∎ °0◂1'
	bt r12,0
	jc LB_31307
	mov rdi,r13
	call dlt
LB_31307:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_31308
	btr r12,3
	jmp LB_31309
LB_31308:
	bts r12,3
LB_31309:
	mov r8,0
	bts r12,2
	ret
LB_31310:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31312
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31311
LB_31312:
	add rsp,8
	ret
NS_E_31189_MTC_2_failed:
	add rsp,16
	pop r14
LB_31311:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_31322:
NS_E_RDI_31322:
NS_E_31322_ETR_TBL:
NS_E_31322_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_31342
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_31342
	jmp LB_31343
LB_31342:
	jmp NS_E_31322_MTC_0_failed
LB_31343:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_31188_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31347
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31348
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31348:
	jmp NS_E_31322_MTC_0_failed
LB_31347:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_31335
	btr r12,1
	jmp LB_31336
LB_31335:
	bts r12,1
LB_31336:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31333
	btr r12,0
	jmp LB_31334
LB_31333:
	bts r12,0
LB_31334:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_31330
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_31350
	btr r12,2
	jmp LB_31351
LB_31350:
	bts r12,2
LB_31351:
	mov r13,r14
	bt r12,1
	jc LB_31352
	btr r12,0
	jmp LB_31353
LB_31352:
	bts r12,0
LB_31353:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f30823 %_31323 ⊢ %_31324 : %_31324
 ; {>  %_31323~0':(_lst)◂(_r64) }
; _f30823 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_30823
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_31324 ⊢ %_31325 : %_31325
 ; {>  %_31324~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_31325
 ; {>  %_31325~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31328
	btr r12,3
	jmp LB_31329
LB_31328:
	bts r12,3
LB_31329:
	mov r8,0
	bts r12,2
	ret
LB_31330:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31332
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31331
LB_31332:
	add rsp,8
	ret
NS_E_31322_MTC_0_failed:
	add rsp,32
	pop r14
LB_31331:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31364
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31322_MTC_1_failed
LB_31364:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31359
	btr r12,0
	jmp LB_31360
LB_31359:
	bts r12,0
LB_31360:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31356
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_31326 ⊢ %_31327 : %_31327
 ; {>  %_31326~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_31327
 ; {>  %_31327~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31354
	btr r12,3
	jmp LB_31355
LB_31354:
	bts r12,3
LB_31355:
	mov r8,0
	bts r12,2
	ret
LB_31356:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31358
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31357
LB_31358:
	add rsp,8
	ret
NS_E_31322_MTC_1_failed:
	add rsp,16
	pop r14
LB_31357:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_31367:
NS_E_RDI_31367:
NS_E_31367_ETR_TBL:
NS_E_31367_TBL:
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
LB_31375:
	jmp LB_31372
LB_31371:
	add r14,1
LB_31372:
	cmp r14,r10
	jge LB_31373
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_31371
	cmp al,10
	jz LB_31371
	cmp al,32
	jz LB_31371
LB_31373:
	push r10
	push rsi
	call NS_E_31187_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_31374
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_31376
	bts QWORD [rax],0
LB_31376:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_31375
LB_31374:
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
	jc LB_31369
	btr QWORD [rdi],0
LB_31369:
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
NS_E_31367_MTC_0_failed:
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
NS_E_31380:
NS_E_RDI_31380:
NS_E_31380_ETR_TBL:
NS_E_31380_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_31483
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_31483
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_31483
	jmp LB_31484
LB_31483:
	jmp NS_E_31380_MTC_0_failed
LB_31484:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_31381_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31488
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31489
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31489:
	jmp NS_E_31380_MTC_0_failed
LB_31488:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_31380_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31494
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_31495
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_31495:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31496
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31496:
	jmp NS_E_31380_MTC_0_failed
LB_31494:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_31476
	btr r12,2
	jmp LB_31477
LB_31476:
	bts r12,2
LB_31477:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_31474
	btr r12,1
	jmp LB_31475
LB_31474:
	bts r12,1
LB_31475:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31472
	btr r12,0
	jmp LB_31473
LB_31472:
	bts r12,0
LB_31473:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_31469
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_31498
	btr r12,3
	jmp LB_31499
LB_31498:
	bts r12,3
LB_31499:
	mov r13,r14
	bt r12,1
	jc LB_31500
	btr r12,0
	jmp LB_31501
LB_31500:
	bts r12,0
LB_31501:
	mov r10,r8
	bt r12,2
	jc LB_31502
	btr r12,4
	jmp LB_31503
LB_31502:
	bts r12,4
LB_31503:
	mov rdi,r10
	mov r11,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_31506
	btr r12,5
	jmp LB_31507
LB_31506:
	bts r12,5
LB_31507:
	mov r14,r11
	bt r12,5
	jc LB_31504
	btr r12,1
	jmp LB_31505
LB_31504:
	bts r12,1
LB_31505:
	mov rdi,r10
	mov r11,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_31510
	btr r12,5
	jmp LB_31511
LB_31510:
	bts r12,5
LB_31511:
	mov r8,r11
	bt r12,5
	jc LB_31508
	btr r12,2
	jmp LB_31509
LB_31508:
	bts r12,2
LB_31509:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_31386 : %_31386
 ; {>  %_31384~1':_r64 %_31383~0':_r64 %_31385~2':(_lst)◂(_p31377) }
; 	» 0xr2 _ ⊢ 3' : %_31386
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f33 { %_31386 %_31383 } ⊢ { %_31387 %_31388 } : { %_31387 %_31388 }
 ; {>  %_31384~1':_r64 %_31383~0':_r64 %_31385~2':(_lst)◂(_p31377) %_31386~3':_r64 }
	add r9,r13
; _f31378 %_31387 ⊢ %_31389 : %_31389
 ; {>  %_31388~0':_r64 %_31384~1':_r64 %_31385~2':(_lst)◂(_p31377) %_31387~3':_r64 }
; _f31378 3' ⊢ °0◂3'
; _cns { %_31389 %_31385 } ⊢ %_31390 : %_31390
 ; {>  %_31389~°0◂3':_p31377 %_31388~0':_r64 %_31384~1':_r64 %_31385~2':(_lst)◂(_p31377) }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_31384 %_31390 } ⊢ %_31391 : %_31391
 ; {>  %_31390~°0◂{ °0◂3' 2' }:(_lst)◂(_p31377) %_31388~0':_r64 %_31384~1':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_31391
 ; {>  %_31391~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p31377) }) %_31388~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_31448
	mov rdi,r13
	call dlt
LB_31448:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_31449
	btr r12,0
	jmp LB_31450
LB_31449:
	bts r12,0
LB_31450:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_31453
	btr r12,4
	jmp LB_31454
LB_31453:
	bts r12,4
LB_31454:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_31451
	btr QWORD [rdi],0
	jmp LB_31452
LB_31451:
	bts QWORD [rdi],0
LB_31452:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_31463
	btr r12,1
	jmp LB_31464
LB_31463:
	bts r12,1
LB_31464:
	mov rsi,1
	bt r12,1
	jc LB_31461
	mov rsi,0
	bt r14,0
	jc LB_31461
	jmp LB_31462
LB_31461:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_31462:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_31459
	btr QWORD [rdi],0
	jmp LB_31460
LB_31459:
	bts QWORD [rdi],0
LB_31460:
	mov r14,r8
	bt r12,2
	jc LB_31467
	btr r12,1
	jmp LB_31468
LB_31467:
	bts r12,1
LB_31468:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_31465
	btr QWORD [rdi],1
	jmp LB_31466
LB_31465:
	bts QWORD [rdi],1
LB_31466:
	mov rsi,1
	bt r12,4
	jc LB_31457
	mov rsi,0
	bt r10,0
	jc LB_31457
	jmp LB_31458
LB_31457:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_31458:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_31455
	btr QWORD [rdi],1
	jmp LB_31456
LB_31455:
	bts QWORD [rdi],1
LB_31456:
	mov r8,0
	bts r12,2
	ret
LB_31469:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31471
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31470
LB_31471:
	add rsp,8
	ret
NS_E_31380_MTC_0_failed:
	add rsp,48
	pop r14
LB_31470:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "##"
	add r14,2
	cmp r14,r10
	jg LB_31547
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_31547
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_31547
	jmp LB_31548
LB_31547:
	jmp NS_E_31380_MTC_1_failed
LB_31548:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_cmt
	push r10
	call NS_E_31382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31552
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31553
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31553:
	jmp NS_E_31380_MTC_1_failed
LB_31552:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; cmt
	push r10
	call NS_E_31380_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31558
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_31559
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_31559:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31560
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31560:
	jmp NS_E_31380_MTC_1_failed
LB_31558:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_31540
	btr r12,2
	jmp LB_31541
LB_31540:
	bts r12,2
LB_31541:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_31538
	btr r12,1
	jmp LB_31539
LB_31538:
	bts r12,1
LB_31539:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31536
	btr r12,0
	jmp LB_31537
LB_31536:
	bts r12,0
LB_31537:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_31533
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' { 1' 2' } }
	mov r9,r13
	bt r12,0
	jc LB_31562
	btr r12,3
	jmp LB_31563
LB_31562:
	bts r12,3
LB_31563:
	mov r13,r14
	bt r12,1
	jc LB_31564
	btr r12,0
	jmp LB_31565
LB_31564:
	bts r12,0
LB_31565:
	mov r10,r8
	bt r12,2
	jc LB_31566
	btr r12,4
	jmp LB_31567
LB_31566:
	bts r12,4
LB_31567:
	mov rdi,r10
	mov r11,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_31570
	btr r12,5
	jmp LB_31571
LB_31570:
	bts r12,5
LB_31571:
	mov r14,r11
	bt r12,5
	jc LB_31568
	btr r12,1
	jmp LB_31569
LB_31568:
	bts r12,1
LB_31569:
	mov rdi,r10
	mov r11,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_31574
	btr r12,5
	jmp LB_31575
LB_31574:
	bts r12,5
LB_31575:
	mov r8,r11
	bt r12,5
	jc LB_31572
	btr r12,2
	jmp LB_31573
LB_31572:
	bts r12,2
LB_31573:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_31395 : %_31395
 ; {>  %_31392~0':_r64 %_31393~1':_r64 %_31394~2':(_lst)◂(_p31377) }
; 	» 0xr2 _ ⊢ 3' : %_31395
	mov rdi,0x2
	mov r9,rdi
	bts r12,3
; _f33 { %_31395 %_31392 } ⊢ { %_31396 %_31397 } : { %_31396 %_31397 }
 ; {>  %_31392~0':_r64 %_31393~1':_r64 %_31395~3':_r64 %_31394~2':(_lst)◂(_p31377) }
	add r9,r13
; _f31378 %_31396 ⊢ %_31398 : %_31398
 ; {>  %_31393~1':_r64 %_31396~3':_r64 %_31394~2':(_lst)◂(_p31377) %_31397~0':_r64 }
; _f31378 3' ⊢ °0◂3'
; _cns { %_31398 %_31394 } ⊢ %_31399 : %_31399
 ; {>  %_31398~°0◂3':_p31377 %_31393~1':_r64 %_31394~2':(_lst)◂(_p31377) %_31397~0':_r64 }
; _cns { °0◂3' 2' } ⊢ °0◂{ °0◂3' 2' }
; _some { %_31393 %_31399 } ⊢ %_31400 : %_31400
 ; {>  %_31393~1':_r64 %_31399~°0◂{ °0◂3' 2' }:(_lst)◂(_p31377) %_31397~0':_r64 }
; _some { 1' °0◂{ °0◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °0◂3' 2' } }
; ∎ %_31400
 ; {>  %_31400~°0◂{ 1' °0◂{ °0◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p31377) }) %_31397~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °0◂3' 2' } }
	bt r12,0
	jc LB_31512
	mov rdi,r13
	call dlt
LB_31512:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °0◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_31513
	btr r12,0
	jmp LB_31514
LB_31513:
	bts r12,0
LB_31514:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_31517
	btr r12,4
	jmp LB_31518
LB_31517:
	bts r12,4
LB_31518:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_31515
	btr QWORD [rdi],0
	jmp LB_31516
LB_31515:
	bts QWORD [rdi],0
LB_31516:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_31527
	btr r12,1
	jmp LB_31528
LB_31527:
	bts r12,1
LB_31528:
	mov rsi,1
	bt r12,1
	jc LB_31525
	mov rsi,0
	bt r14,0
	jc LB_31525
	jmp LB_31526
LB_31525:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_31526:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_31523
	btr QWORD [rdi],0
	jmp LB_31524
LB_31523:
	bts QWORD [rdi],0
LB_31524:
	mov r14,r8
	bt r12,2
	jc LB_31531
	btr r12,1
	jmp LB_31532
LB_31531:
	bts r12,1
LB_31532:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_31529
	btr QWORD [rdi],1
	jmp LB_31530
LB_31529:
	bts QWORD [rdi],1
LB_31530:
	mov rsi,1
	bt r12,4
	jc LB_31521
	mov rsi,0
	bt r10,0
	jc LB_31521
	jmp LB_31522
LB_31521:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_31522:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_31519
	btr QWORD [rdi],1
	jmp LB_31520
LB_31519:
	bts QWORD [rdi],1
LB_31520:
	mov r8,0
	bts r12,2
	ret
LB_31533:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31535
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31534
LB_31535:
	add rsp,8
	ret
NS_E_31380_MTC_1_failed:
	add rsp,48
	pop r14
LB_31534:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_30760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31650
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31380_MTC_2_failed
LB_31650:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt
	push r10
	call NS_E_31380_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31655
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31656
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31656:
	jmp NS_E_31380_MTC_2_failed
LB_31655:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_31645
	btr r12,1
	jmp LB_31646
LB_31645:
	bts r12,1
LB_31646:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31643
	btr r12,0
	jmp LB_31644
LB_31643:
	bts r12,0
LB_31644:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_31640
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_31658
	btr r12,3
	jmp LB_31659
LB_31658:
	bts r12,3
LB_31659:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_31662
	btr r12,4
	jmp LB_31663
LB_31662:
	bts r12,4
LB_31663:
	mov r14,r10
	bt r12,4
	jc LB_31660
	btr r12,1
	jmp LB_31661
LB_31660:
	bts r12,1
LB_31661:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_31666
	btr r12,4
	jmp LB_31667
LB_31666:
	bts r12,4
LB_31667:
	mov r8,r10
	bt r12,4
	jc LB_31664
	btr r12,2
	jmp LB_31665
LB_31664:
	bts r12,2
LB_31665:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
MTC_LB_31576:
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_31577
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_31578
	bt QWORD [rax],0
	jc LB_31579
	btr r12,2
	jmp LB_31580
LB_31579:
	bts r12,2
LB_31580:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_31578:
	push r8
	mov r8,rax
	mov rdi,r8
	mov r11,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_31583
	btr r12,5
	jmp LB_31584
LB_31583:
	bts r12,5
LB_31584:
	mov r9,r11
	bt r12,5
	jc LB_31581
	btr r12,3
	jmp LB_31582
LB_31581:
	bts r12,3
LB_31582:
	mov rdi,r8
	mov r11,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_31587
	btr r12,5
	jmp LB_31588
LB_31587:
	bts r12,5
LB_31588:
	mov r10,r11
	bt r12,5
	jc LB_31585
	btr r12,4
	jmp LB_31586
LB_31585:
	bts r12,4
LB_31586:
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	pop r8
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_31577
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r9
	bt QWORD [rax],17
	jnc LB_31589
	bt QWORD [rax],0
	jc LB_31590
	btr r12,3
	jmp LB_31591
LB_31590:
	bts r12,3
LB_31591:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_31589:
	push r9
	mov r9,rax
	mov r11,r9
	bt r12,3
	jc LB_31592
	btr r12,5
	jmp LB_31593
LB_31592:
	bts r12,5
LB_31593:
	pop r9
LB_31594:
	cmp r15,0
	jz LB_31595
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31594
LB_31595:
; » 0xr1 |~ {  } ⊢ %_31407 : %_31407
 ; {>  %_31401~0':_r64 %_31405~4':(_lst)◂(_p31377) %_31402~1':_r64 %_31406~5':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_31407
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f33 { %_31406 %_31407 } ⊢ { %_31408 %_31409 } : { %_31408 %_31409 }
 ; {>  %_31401~0':_r64 %_31405~4':(_lst)◂(_p31377) %_31402~1':_r64 %_31406~5':_r64 %_31407~2':_r64 }
	add r11,r8
; _f33 { %_31402 %_31409 } ⊢ { %_31410 %_31411 } : { %_31410 %_31411 }
 ; {>  %_31401~0':_r64 %_31405~4':(_lst)◂(_p31377) %_31402~1':_r64 %_31409~2':_r64 %_31408~5':_r64 }
	add r14,r8
; _f31379 %_31408 ⊢ %_31412 : %_31412
 ; {>  %_31401~0':_r64 %_31411~2':_r64 %_31405~4':(_lst)◂(_p31377) %_31410~1':_r64 %_31408~5':_r64 }
; _f31379 5' ⊢ °1◂5'
; _cns { %_31412 %_31405 } ⊢ %_31413 : %_31413
 ; {>  %_31401~0':_r64 %_31412~°1◂5':_p31377 %_31411~2':_r64 %_31405~4':(_lst)◂(_p31377) %_31410~1':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_31410 %_31413 } ⊢ %_31414 : %_31414
 ; {>  %_31401~0':_r64 %_31413~°0◂{ °1◂5' 4' }:(_lst)◂(_p31377) %_31411~2':_r64 %_31410~1':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_31414
 ; {>  %_31401~0':_r64 %_31411~2':_r64 %_31414~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p31377) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_31596
	mov rdi,r13
	call dlt
LB_31596:
	bt r12,2
	jc LB_31597
	mov rdi,r8
	call dlt
LB_31597:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_31600
	btr r12,0
	jmp LB_31601
LB_31600:
	bts r12,0
LB_31601:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_31598
	btr QWORD [rdi],0
	jmp LB_31599
LB_31598:
	bts QWORD [rdi],0
LB_31599:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_31610
	btr r12,1
	jmp LB_31611
LB_31610:
	bts r12,1
LB_31611:
	mov rsi,1
	bt r12,1
	jc LB_31608
	mov rsi,0
	bt r14,0
	jc LB_31608
	jmp LB_31609
LB_31608:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_31609:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_31606
	btr QWORD [rdi],0
	jmp LB_31607
LB_31606:
	bts QWORD [rdi],0
LB_31607:
	mov r14,r10
	bt r12,4
	jc LB_31614
	btr r12,1
	jmp LB_31615
LB_31614:
	bts r12,1
LB_31615:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_31612
	btr QWORD [rdi],1
	jmp LB_31613
LB_31612:
	bts QWORD [rdi],1
LB_31613:
	mov rsi,1
	bt r12,0
	jc LB_31604
	mov rsi,0
	bt r13,0
	jc LB_31604
	jmp LB_31605
LB_31604:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r13
	mov r13,rax
	btr r12,0
LB_31605:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_31602
	btr QWORD [rdi],1
	jmp LB_31603
LB_31602:
	bts QWORD [rdi],1
LB_31603:
	mov r8,0
	bts r12,2
	ret
MTC_LB_31577:
LB_31617:
	cmp r15,0
	jz LB_31618
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_31617
LB_31618:
; » 0xr1 |~ {  } ⊢ %_31415 : %_31415
 ; {>  %_31401~0':_r64 %_31403~2':(_lst)◂(_p31377) %_31402~1':_r64 }
; 	» 0xr1 _ ⊢ 3' : %_31415
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f33 { %_31402 %_31415 } ⊢ { %_31416 %_31417 } : { %_31416 %_31417 }
 ; {>  %_31401~0':_r64 %_31403~2':(_lst)◂(_p31377) %_31402~1':_r64 %_31415~3':_r64 }
	add r14,r9
; _f31379 %_31417 ⊢ %_31418 : %_31418
 ; {>  %_31401~0':_r64 %_31416~1':_r64 %_31417~3':_r64 %_31403~2':(_lst)◂(_p31377) }
; _f31379 3' ⊢ °1◂3'
; _cns { %_31418 %_31403 } ⊢ %_31419 : %_31419
 ; {>  %_31401~0':_r64 %_31416~1':_r64 %_31403~2':(_lst)◂(_p31377) %_31418~°1◂3':_p31377 }
; _cns { °1◂3' 2' } ⊢ °0◂{ °1◂3' 2' }
; _some { %_31416 %_31419 } ⊢ %_31420 : %_31420
 ; {>  %_31401~0':_r64 %_31416~1':_r64 %_31419~°0◂{ °1◂3' 2' }:(_lst)◂(_p31377) }
; _some { 1' °0◂{ °1◂3' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂3' 2' } }
; ∎ %_31420
 ; {>  %_31401~0':_r64 %_31420~°0◂{ 1' °0◂{ °1◂3' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p31377) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂3' 2' } }
	bt r12,0
	jc LB_31619
	mov rdi,r13
	call dlt
LB_31619:
; _emt_mov_ptn_to_ptn:{| 01110.. |},°0◂{ 1' °0◂{ °1◂3' 2' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_31620
	btr r12,0
	jmp LB_31621
LB_31620:
	bts r12,0
LB_31621:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_31624
	btr r12,4
	jmp LB_31625
LB_31624:
	bts r12,4
LB_31625:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_31622
	btr QWORD [rdi],0
	jmp LB_31623
LB_31622:
	bts QWORD [rdi],0
LB_31623:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_31634
	btr r12,1
	jmp LB_31635
LB_31634:
	bts r12,1
LB_31635:
	mov rsi,1
	bt r12,1
	jc LB_31632
	mov rsi,0
	bt r14,0
	jc LB_31632
	jmp LB_31633
LB_31632:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_31633:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_31630
	btr QWORD [rdi],0
	jmp LB_31631
LB_31630:
	bts QWORD [rdi],0
LB_31631:
	mov r14,r8
	bt r12,2
	jc LB_31638
	btr r12,1
	jmp LB_31639
LB_31638:
	bts r12,1
LB_31639:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_31636
	btr QWORD [rdi],1
	jmp LB_31637
LB_31636:
	bts QWORD [rdi],1
LB_31637:
	mov rsi,1
	bt r12,4
	jc LB_31628
	mov rsi,0
	bt r10,0
	jc LB_31628
	jmp LB_31629
LB_31628:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r10
	mov r10,rax
	btr r12,4
LB_31629:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_31626
	btr QWORD [rdi],1
	jmp LB_31627
LB_31626:
	bts QWORD [rdi],1
LB_31627:
	mov r8,0
	bts r12,2
	ret
MTC_LB_31616:
LB_31640:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31642
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31641
LB_31642:
	add rsp,8
	ret
NS_E_31380_MTC_2_failed:
	add rsp,32
	pop r14
LB_31641:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_31676
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_31421 : %_31421
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_31422 : %_31422
 ; {>  %_31421~°1◂{  }:(_lst)◂(t8527'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_31422
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_31422 %_31421 } ⊢ %_31423 : %_31423
 ; {>  %_31421~°1◂{  }:(_lst)◂(t8527'(0)) %_31422~0':_r64 }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_31423
 ; {>  %_31423~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t8531'(0)) }) }
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
	jc LB_31670
	btr r12,1
	jmp LB_31671
LB_31670:
	bts r12,1
LB_31671:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_31668
	btr QWORD [rdi],0
	jmp LB_31669
LB_31668:
	bts QWORD [rdi],0
LB_31669:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_31674
	mov rsi,0
	bt r14,0
	jc LB_31674
	jmp LB_31675
LB_31674:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r14
	mov r14,rax
	btr r12,1
LB_31675:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_31672
	btr QWORD [rdi],1
	jmp LB_31673
LB_31672:
	bts QWORD [rdi],1
LB_31673:
	mov r8,0
	bts r12,2
	ret
LB_31676:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31678
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31677
LB_31678:
	add rsp,8
	ret
NS_E_31380_MTC_3_failed:
	add rsp,0
	pop r14
LB_31677:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_31381:
NS_E_RDI_31381:
NS_E_31381_ETR_TBL:
NS_E_31381_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "#]"
	add r14,2
	cmp r14,r10
	jg LB_31691
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_31691
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_31691
	jmp LB_31692
LB_31691:
	jmp NS_E_31381_MTC_0_failed
LB_31692:
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
	jc LB_31684
	btr r12,0
	jmp LB_31685
LB_31684:
	bts r12,0
LB_31685:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31681
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_31424 : %_31424
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_31424
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _some %_31424 ⊢ %_31425 : %_31425
 ; {>  %_31424~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_31425
 ; {>  %_31425~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31679
	btr r12,3
	jmp LB_31680
LB_31679:
	bts r12,3
LB_31680:
	mov r8,0
	bts r12,2
	ret
LB_31681:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31683
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31682
LB_31683:
	add rsp,8
	ret
NS_E_31381_MTC_0_failed:
	add rsp,16
	pop r14
LB_31682:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "[#"
	add r14,2
	cmp r14,r10
	jg LB_31711
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,91
	jnz LB_31711
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_31711
	jmp LB_31712
LB_31711:
	jmp NS_E_31381_MTC_1_failed
LB_31712:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; blk_cmt
	push r10
	call NS_E_31381_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31716
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31717
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31717:
	jmp NS_E_31381_MTC_1_failed
LB_31716:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; blk_cmt
	push r10
	call NS_E_31381_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31722
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_31723
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_31723:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31724
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31724:
	jmp NS_E_31381_MTC_1_failed
LB_31722:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_31704
	btr r12,2
	jmp LB_31705
LB_31704:
	bts r12,2
LB_31705:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_31702
	btr r12,1
	jmp LB_31703
LB_31702:
	bts r12,1
LB_31703:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31700
	btr r12,0
	jmp LB_31701
LB_31700:
	bts r12,0
LB_31701:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_31697
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_31726
	btr r12,3
	jmp LB_31727
LB_31726:
	bts r12,3
LB_31727:
	mov r14,r8
	bt r12,2
	jc LB_31728
	btr r12,1
	jmp LB_31729
LB_31728:
	bts r12,1
LB_31729:
	mov r8,r13
	bt r12,0
	jc LB_31730
	btr r12,2
	jmp LB_31731
LB_31730:
	bts r12,2
LB_31731:
	mov r13,r9
	bt r12,3
	jc LB_31732
	btr r12,0
	jmp LB_31733
LB_31732:
	bts r12,0
LB_31733:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_31428 : %_31428
 ; {>  %_31427~1':_r64 %_31426~0':_r64 }
; 	» 0xr2 _ ⊢ 2' : %_31428
	mov rdi,0x2
	mov r8,rdi
	bts r12,2
; _f33 { %_31428 %_31426 } ⊢ { %_31429 %_31430 } : { %_31429 %_31430 }
 ; {>  %_31427~1':_r64 %_31426~0':_r64 %_31428~2':_r64 }
	add r8,r13
; _f33 { %_31429 %_31427 } ⊢ { %_31431 %_31432 } : { %_31431 %_31432 }
 ; {>  %_31430~0':_r64 %_31427~1':_r64 %_31429~2':_r64 }
	add r8,r14
; _some %_31431 ⊢ %_31433 : %_31433
 ; {>  %_31430~0':_r64 %_31432~1':_r64 %_31431~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_31433
 ; {>  %_31430~0':_r64 %_31432~1':_r64 %_31433~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,0
	jc LB_31693
	mov rdi,r13
	call dlt
LB_31693:
	bt r12,1
	jc LB_31694
	mov rdi,r14
	call dlt
LB_31694:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_31695
	btr r12,3
	jmp LB_31696
LB_31695:
	bts r12,3
LB_31696:
	mov r8,0
	bts r12,2
	ret
LB_31697:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31699
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31698
LB_31699:
	add rsp,8
	ret
NS_E_31381_MTC_1_failed:
	add rsp,48
	pop r14
LB_31698:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_30760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31748
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31381_MTC_2_failed
LB_31748:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; blk_cmt
	push r10
	call NS_E_31381_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31753
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31754
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31754:
	jmp NS_E_31381_MTC_2_failed
LB_31753:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_31743
	btr r12,1
	jmp LB_31744
LB_31743:
	bts r12,1
LB_31744:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31741
	btr r12,0
	jmp LB_31742
LB_31741:
	bts r12,0
LB_31742:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_31738
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_31436 : %_31436
 ; {>  %_31434~0':_r64 %_31435~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_31436
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f33 { %_31436 %_31435 } ⊢ { %_31437 %_31438 } : { %_31437 %_31438 }
 ; {>  %_31436~2':_r64 %_31434~0':_r64 %_31435~1':_r64 }
	add r8,r14
; _some %_31437 ⊢ %_31439 : %_31439
 ; {>  %_31437~2':_r64 %_31438~1':_r64 %_31434~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_31439
 ; {>  %_31438~1':_r64 %_31434~0':_r64 %_31439~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_31734
	mov rdi,r14
	call dlt
LB_31734:
	bt r12,0
	jc LB_31735
	mov rdi,r13
	call dlt
LB_31735:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_31736
	btr r12,3
	jmp LB_31737
LB_31736:
	bts r12,3
LB_31737:
	mov r8,0
	bts r12,2
	ret
LB_31738:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31740
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31739
LB_31740:
	add rsp,8
	ret
NS_E_31381_MTC_2_failed:
	add rsp,32
	pop r14
LB_31739:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_31382:
NS_E_RDI_31382:
NS_E_31382_ETR_TBL:
NS_E_31382_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_31768
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_31768
	jmp LB_31769
LB_31768:
	jmp NS_E_31382_MTC_0_failed
LB_31769:
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
	jc LB_31761
	btr r12,0
	jmp LB_31762
LB_31761:
	bts r12,0
LB_31762:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_31758
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_31440 : %_31440
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_31440
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_31440 ⊢ %_31441 : %_31441
 ; {>  %_31440~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_31441
 ; {>  %_31441~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_31756
	btr r12,3
	jmp LB_31757
LB_31756:
	bts r12,3
LB_31757:
	mov r8,0
	bts r12,2
	ret
LB_31758:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31760
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31759
LB_31760:
	add rsp,8
	ret
NS_E_31382_MTC_0_failed:
	add rsp,16
	pop r14
LB_31759:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_30760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31784
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31382_MTC_1_failed
LB_31784:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line_cmt
	push r10
	call NS_E_31382_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31789
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31790
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31790:
	jmp NS_E_31382_MTC_1_failed
LB_31789:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_31779
	btr r12,1
	jmp LB_31780
LB_31779:
	bts r12,1
LB_31780:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31777
	btr r12,0
	jmp LB_31778
LB_31777:
	bts r12,0
LB_31778:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_31774
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; » 0xr1 |~ {  } ⊢ %_31444 : %_31444
 ; {>  %_31442~0':_r64 %_31443~1':_r64 }
; 	» 0xr1 _ ⊢ 2' : %_31444
	mov rdi,0x1
	mov r8,rdi
	bts r12,2
; _f33 { %_31444 %_31443 } ⊢ { %_31445 %_31446 } : { %_31445 %_31446 }
 ; {>  %_31442~0':_r64 %_31444~2':_r64 %_31443~1':_r64 }
	add r8,r14
; _some %_31445 ⊢ %_31447 : %_31447
 ; {>  %_31442~0':_r64 %_31446~1':_r64 %_31445~2':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_31447
 ; {>  %_31442~0':_r64 %_31447~°0◂2':(_opn)◂(_r64) %_31446~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_31770
	mov rdi,r13
	call dlt
LB_31770:
	bt r12,1
	jc LB_31771
	mov rdi,r14
	call dlt
LB_31771:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_31772
	btr r12,3
	jmp LB_31773
LB_31772:
	bts r12,3
LB_31773:
	mov r8,0
	bts r12,2
	ret
LB_31774:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_31776
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_31775
LB_31776:
	add rsp,8
	ret
NS_E_31382_MTC_1_failed:
	add rsp,32
	pop r14
LB_31775:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_31801:
NS_E_RDI_31801:
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
; _f20 %_31792 ⊢ %_31793 : %_31793
 ; {>  %_31792~0':_stg }
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
; » 0xr0 |~ {  } ⊢ %_31794 : %_31794
 ; {>  %_31793~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_31794
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f31380 { %_31793 %_31794 } ⊢ { %_31795 %_31796 %_31797 } : { %_31795 %_31796 %_31797 }
 ; {>  %_31794~1':_r64 %_31793~0':_stg }
; _f31380 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_31380
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_31802
	btr r12,4
	jmp LB_31803
LB_31802:
	bts r12,4
LB_31803:
	mov r8,r9
	bt r12,3
	jc LB_31806
	btr r12,2
	jmp LB_31807
LB_31806:
	bts r12,2
LB_31807:
	mov rsi,1
	bt r12,2
	jc LB_31804
	mov rsi,0
	bt r8,0
	jc LB_31804
	jmp LB_31805
LB_31804:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov QWORD [rax+8*1],r8
	mov r8,rax
	btr r12,2
LB_31805:
	mov rax,r10
	shl rax,56
	or rax,1
	mov rdi,rax
	or r8,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f20 { %_31795 %_31796 %_31797 } ⊢ { %_31798 %_31799 %_31800 } : { %_31798 %_31799 %_31800 }
 ; {>  %_31797~2':(_opn)◂({ _r64 (_lst)◂(_p31377) }) %_31796~1':_r64 %_31795~0':_stg }
; _f20 { 0' 1' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ 0'
	mov r9,r13
	bt r12,0
	jc LB_31808
	btr r12,3
	jmp LB_31809
LB_31808:
	bts r12,3
LB_31809:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_31812
	btr r12,4
	jmp LB_31813
LB_31812:
	bts r12,4
LB_31813:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_31810
	btr QWORD [rdi],0
	jmp LB_31811
LB_31810:
	bts QWORD [rdi],0
LB_31811:
	mov r10,r14
	bt r12,1
	jc LB_31816
	btr r12,4
	jmp LB_31817
LB_31816:
	bts r12,4
LB_31817:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_31814
	btr QWORD [rdi],1
	jmp LB_31815
LB_31814:
	bts QWORD [rdi],1
LB_31815:
	mov r10,r8
	bt r12,2
	jc LB_31820
	btr r12,4
	jmp LB_31821
LB_31820:
	bts r12,4
LB_31821:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_31818
	btr QWORD [rdi],2
	jmp LB_31819
LB_31818:
	bts QWORD [rdi],2
LB_31819:
	call NS_E_20
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' 2' }
	mov r9,r13
	bt r12,0
	jc LB_31822
	btr r12,3
	jmp LB_31823
LB_31822:
	bts r12,3
LB_31823:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*0]
	bt QWORD [rdi],0
	jc LB_31826
	btr r12,4
	jmp LB_31827
LB_31826:
	bts r12,4
LB_31827:
	mov r13,r10
	bt r12,4
	jc LB_31824
	btr r12,0
	jmp LB_31825
LB_31824:
	bts r12,0
LB_31825:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*1]
	bt QWORD [rdi],1
	jc LB_31830
	btr r12,4
	jmp LB_31831
LB_31830:
	bts r12,4
LB_31831:
	mov r14,r10
	bt r12,4
	jc LB_31828
	btr r12,1
	jmp LB_31829
LB_31828:
	bts r12,1
LB_31829:
	mov rdi,r9
	mov r10,QWORD [rdi+8*1+8*2]
	bt QWORD [rdi],2
	jc LB_31834
	btr r12,4
	jmp LB_31835
LB_31834:
	bts r12,4
LB_31835:
	mov r8,r10
	bt r12,4
	jc LB_31832
	btr r12,2
	jmp LB_31833
LB_31832:
	bts r12,2
LB_31833:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_31799~1':_r64 %_31800~2':(_opn)◂({ _r64 (_lst)◂(_p31377) }) %_31798~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_31836
	mov rdi,r14
	call dlt
LB_31836:
	bt r12,2
	jc LB_31837
	mov rdi,r8
	call dlt
LB_31837:
	bt r12,0
	jc LB_31838
	mov rdi,r13
	call dlt
LB_31838:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_31840:
NS_E_RDI_31840:
NS_E_31840_ETR_TBL:
NS_E_31840_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	push r10
	call NS_E_31842_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31912
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31840_MTC_0_failed
LB_31912:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; glb_etr_lst
	push r10
	call NS_E_31840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31917
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31918
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31918:
	jmp NS_E_31840_MTC_0_failed
LB_31917:
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
	jc LB_31906
	btr QWORD [rdi],1
LB_31906:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31907
	btr QWORD [rdi],0
LB_31907:
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
NS_E_31840_MTC_0_failed:
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
NS_E_31840_MTC_1_failed:
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
NS_E_31842:
NS_E_RDI_31842:
NS_E_31842_ETR_TBL:
NS_E_31842_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_32123
LB_32122:
	add r14,1
LB_32123:
	cmp r14,r10
	jge LB_32124
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32122
	cmp al,10
	jz LB_32122
	cmp al,32
	jz LB_32122
LB_32124:
	add r14,4
	cmp r14,r10
	jg LB_32127
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_32127
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_32127
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_32127
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_32127
	jmp LB_32128
LB_32127:
	jmp NS_E_31842_MTC_0_failed
LB_32128:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_32130
LB_32129:
	add r14,1
LB_32130:
	cmp r14,r10
	jge LB_32131
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32129
	cmp al,10
	jz LB_32129
	cmp al,32
	jz LB_32129
LB_32131:
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32132
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32133
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32133:
	jmp NS_E_31842_MTC_0_failed
LB_32132:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_32136
LB_32135:
	add r14,1
LB_32136:
	cmp r14,r10
	jge LB_32137
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32135
	cmp al,10
	jz LB_32135
	cmp al,32
	jz LB_32135
LB_32137:
	add r14,1
	cmp r14,r10
	jg LB_32142
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_32142
	jmp LB_32143
LB_32142:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32139
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32139:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32140
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32140:
	jmp NS_E_31842_MTC_0_failed
LB_32143:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_32145
LB_32144:
	add r14,1
LB_32145:
	cmp r14,r10
	jge LB_32146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32144
	cmp al,10
	jz LB_32144
	cmp al,32
	jz LB_32144
LB_32146:
	push r10
	call NS_E_31846_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32147
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32148
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32148:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32149
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32149:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32150
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32150:
	jmp NS_E_31842_MTC_0_failed
LB_32147:
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
	jc LB_32117
	btr QWORD [rdi],3
LB_32117:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_32118
	btr QWORD [rdi],2
LB_32118:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32119
	btr QWORD [rdi],1
LB_32119:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32120
	btr QWORD [rdi],0
LB_32120:
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
NS_E_31842_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167\194\167"
	jmp LB_32088
LB_32087:
	add r14,1
LB_32088:
	cmp r14,r10
	jge LB_32089
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32087
	cmp al,10
	jz LB_32087
	cmp al,32
	jz LB_32087
LB_32089:
	add r14,4
	cmp r14,r10
	jg LB_32092
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_32092
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_32092
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_32092
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_32092
	jmp LB_32093
LB_32092:
	jmp NS_E_31842_MTC_1_failed
LB_32093:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_32095
LB_32094:
	add r14,1
LB_32095:
	cmp r14,r10
	jge LB_32096
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32094
	cmp al,10
	jz LB_32094
	cmp al,32
	jz LB_32094
LB_32096:
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32097
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32098
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32098:
	jmp NS_E_31842_MTC_1_failed
LB_32097:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; glb_etr_lst
	jmp LB_32101
LB_32100:
	add r14,1
LB_32101:
	cmp r14,r10
	jge LB_32102
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32100
	cmp al,10
	jz LB_32100
	cmp al,32
	jz LB_32100
LB_32102:
	push r10
	call NS_E_31840_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32103
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32104
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32104:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32105
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32105:
	jmp NS_E_31842_MTC_1_failed
LB_32103:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\136\142\226\136\142"
	jmp LB_32108
LB_32107:
	add r14,1
LB_32108:
	cmp r14,r10
	jge LB_32109
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32107
	cmp al,10
	jz LB_32107
	cmp al,32
	jz LB_32107
LB_32109:
	add r14,6
	cmp r14,r10
	jg LB_32115
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_32115
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_32115
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_32115
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_32115
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_32115
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_32115
	jmp LB_32116
LB_32115:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32111
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32111:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32112
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32112:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32113
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32113:
	jmp NS_E_31842_MTC_1_failed
LB_32116:
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
	jc LB_32082
	btr QWORD [rdi],3
LB_32082:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_32083
	btr QWORD [rdi],2
LB_32083:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32084
	btr QWORD [rdi],1
LB_32084:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32085
	btr QWORD [rdi],0
LB_32085:
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
NS_E_31842_MTC_1_failed:
	add rsp,64
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_32053
LB_32052:
	add r14,1
LB_32053:
	cmp r14,r10
	jge LB_32054
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32052
	cmp al,10
	jz LB_32052
	cmp al,32
	jz LB_32052
LB_32054:
	add r14,2
	cmp r14,r10
	jg LB_32057
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_32057
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_32057
	jmp LB_32058
LB_32057:
	jmp NS_E_31842_MTC_2_failed
LB_32058:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_32060
LB_32059:
	add r14,1
LB_32060:
	cmp r14,r10
	jge LB_32061
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32059
	cmp al,10
	jz LB_32059
	cmp al,32
	jz LB_32059
LB_32061:
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32062
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32063
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32063:
	jmp NS_E_31842_MTC_2_failed
LB_32062:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_32066
LB_32065:
	add r14,1
LB_32066:
	cmp r14,r10
	jge LB_32067
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32065
	cmp al,10
	jz LB_32065
	cmp al,32
	jz LB_32065
LB_32067:
	add r14,1
	cmp r14,r10
	jg LB_32072
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_32072
	jmp LB_32073
LB_32072:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32069
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32069:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32070
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32070:
	jmp NS_E_31842_MTC_2_failed
LB_32073:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; cst
	jmp LB_32075
LB_32074:
	add r14,1
LB_32075:
	cmp r14,r10
	jge LB_32076
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32074
	cmp al,10
	jz LB_32074
	cmp al,32
	jz LB_32074
LB_32076:
	push r10
	call NS_E_31844_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32077
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32078
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32078:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32079
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32079:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32080
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32080:
	jmp NS_E_31842_MTC_2_failed
LB_32077:
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
	jc LB_32047
	btr QWORD [rdi],3
LB_32047:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_32048
	btr QWORD [rdi],2
LB_32048:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32049
	btr QWORD [rdi],1
LB_32049:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32050
	btr QWORD [rdi],0
LB_32050:
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
NS_E_31842_MTC_2_failed:
	add rsp,64
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_32018
LB_32017:
	add r14,1
LB_32018:
	cmp r14,r10
	jge LB_32019
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32017
	cmp al,10
	jz LB_32017
	cmp al,32
	jz LB_32017
LB_32019:
	add r14,2
	cmp r14,r10
	jg LB_32022
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_32022
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_32022
	jmp LB_32023
LB_32022:
	jmp NS_E_31842_MTC_3_failed
LB_32023:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_32025
LB_32024:
	add r14,1
LB_32025:
	cmp r14,r10
	jge LB_32026
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32024
	cmp al,10
	jz LB_32024
	cmp al,32
	jz LB_32024
LB_32026:
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32027
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32028
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32028:
	jmp NS_E_31842_MTC_3_failed
LB_32027:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\194\171"
	jmp LB_32031
LB_32030:
	add r14,1
LB_32031:
	cmp r14,r10
	jge LB_32032
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32030
	cmp al,10
	jz LB_32030
	cmp al,32
	jz LB_32030
LB_32032:
	add r14,2
	cmp r14,r10
	jg LB_32037
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_32037
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_32037
	jmp LB_32038
LB_32037:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32034
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32034:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32035
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32035:
	jmp NS_E_31842_MTC_3_failed
LB_32038:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; op_lines
	jmp LB_32040
LB_32039:
	add r14,1
LB_32040:
	cmp r14,r10
	jge LB_32041
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32039
	cmp al,10
	jz LB_32039
	cmp al,32
	jz LB_32039
LB_32041:
	push r10
	call NS_E_31852_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32042
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32043
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32043:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32044
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32044:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32045
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32045:
	jmp NS_E_31842_MTC_3_failed
LB_32042:
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
	jc LB_32012
	btr QWORD [rdi],3
LB_32012:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_32013
	btr QWORD [rdi],2
LB_32013:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32014
	btr QWORD [rdi],1
LB_32014:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32015
	btr QWORD [rdi],0
LB_32015:
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
NS_E_31842_MTC_3_failed:
	add rsp,64
	pop r14
; c4
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\167"
	jmp LB_31985
LB_31984:
	add r14,1
LB_31985:
	cmp r14,r10
	jge LB_31986
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_31984
	cmp al,10
	jz LB_31984
	cmp al,32
	jz LB_31984
LB_31986:
	add r14,2
	cmp r14,r10
	jg LB_31989
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_31989
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_31989
	jmp LB_31990
LB_31989:
	jmp NS_E_31842_MTC_4_failed
LB_31990:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_31992
LB_31991:
	add r14,1
LB_31992:
	cmp r14,r10
	jge LB_31993
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_31991
	cmp al,10
	jz LB_31991
	cmp al,32
	jz LB_31991
LB_31993:
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31994
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31995
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31995:
	jmp NS_E_31842_MTC_4_failed
LB_31994:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; reg_ptn
	jmp LB_31998
LB_31997:
	add r14,1
LB_31998:
	cmp r14,r10
	jge LB_31999
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_31997
	cmp al,10
	jz LB_31997
	cmp al,32
	jz LB_31997
LB_31999:
	push r10
	call NS_E_31864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32000
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32001
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32001:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32002
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32002:
	jmp NS_E_31842_MTC_4_failed
LB_32000:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; op_lines
	jmp LB_32005
LB_32004:
	add r14,1
LB_32005:
	cmp r14,r10
	jge LB_32006
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32004
	cmp al,10
	jz LB_32004
	cmp al,32
	jz LB_32004
LB_32006:
	push r10
	call NS_E_31852_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32007
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32008
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32008:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32009
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32009:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32010
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32010:
	jmp NS_E_31842_MTC_4_failed
LB_32007:
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
	jc LB_31979
	btr QWORD [rdi],3
LB_31979:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_31980
	btr QWORD [rdi],2
LB_31980:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_31981
	btr QWORD [rdi],1
LB_31981:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31982
	btr QWORD [rdi],0
LB_31982:
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
NS_E_31842_MTC_4_failed:
	add rsp,64
	pop r14
; c5
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\194\182"
	jmp LB_31950
LB_31949:
	add r14,1
LB_31950:
	cmp r14,r10
	jge LB_31951
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_31949
	cmp al,10
	jz LB_31949
	cmp al,32
	jz LB_31949
LB_31951:
	add r14,2
	cmp r14,r10
	jg LB_31954
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_31954
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_31954
	jmp LB_31955
LB_31954:
	jmp NS_E_31842_MTC_5_failed
LB_31955:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_31957
LB_31956:
	add r14,1
LB_31957:
	cmp r14,r10
	jge LB_31958
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_31956
	cmp al,10
	jz LB_31956
	cmp al,32
	jz LB_31956
LB_31958:
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31959
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31960
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31960:
	jmp NS_E_31842_MTC_5_failed
LB_31959:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_31963
LB_31962:
	add r14,1
LB_31963:
	cmp r14,r10
	jge LB_31964
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_31962
	cmp al,10
	jz LB_31962
	cmp al,32
	jz LB_31962
LB_31964:
	add r14,1
	cmp r14,r10
	jg LB_31969
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_31969
	jmp LB_31970
LB_31969:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_31966
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_31966:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31967
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31967:
	jmp NS_E_31842_MTC_5_failed
LB_31970:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; name
	jmp LB_31972
LB_31971:
	add r14,1
LB_31972:
	cmp r14,r10
	jge LB_31973
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_31971
	cmp al,10
	jz LB_31971
	cmp al,32
	jz LB_31971
LB_31973:
	push r10
	call NS_E_31846_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31974
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_31975
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_31975:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_31976
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_31976:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31977
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31977:
	jmp NS_E_31842_MTC_5_failed
LB_31974:
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
	jc LB_31944
	btr QWORD [rdi],3
LB_31944:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_31945
	btr QWORD [rdi],2
LB_31945:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_31946
	btr QWORD [rdi],1
LB_31946:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31947
	btr QWORD [rdi],0
LB_31947:
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
NS_E_31842_MTC_5_failed:
	add rsp,64
	pop r14
; c6
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\182"
	jmp LB_31925
LB_31924:
	add r14,1
LB_31925:
	cmp r14,r10
	jge LB_31926
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_31924
	cmp al,10
	jz LB_31924
	cmp al,32
	jz LB_31924
LB_31926:
	add r14,2
	cmp r14,r10
	jg LB_31929
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_31929
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_31929
	jmp LB_31930
LB_31929:
	jmp NS_E_31842_MTC_6_failed
LB_31930:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_31932
LB_31931:
	add r14,1
LB_31932:
	cmp r14,r10
	jge LB_31933
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_31931
	cmp al,10
	jz LB_31931
	cmp al,32
	jz LB_31931
LB_31933:
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31934
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31935
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31935:
	jmp NS_E_31842_MTC_6_failed
LB_31934:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dta_def
	jmp LB_31938
LB_31937:
	add r14,1
LB_31938:
	cmp r14,r10
	jge LB_31939
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_31937
	cmp al,10
	jz LB_31937
	cmp al,32
	jz LB_31937
LB_31939:
	push r10
	call NS_E_31848_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_31940
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_31941
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_31941:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_31942
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_31942:
	jmp NS_E_31842_MTC_6_failed
LB_31940:
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
	jc LB_31920
	btr QWORD [rdi],2
LB_31920:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_31921
	btr QWORD [rdi],1
LB_31921:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_31922
	btr QWORD [rdi],0
LB_31922:
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
NS_E_31842_MTC_6_failed:
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
NS_E_31844:
NS_E_RDI_31844:
NS_E_31844_ETR_TBL:
NS_E_31844_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_30762_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32172
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31844_MTC_0_failed
LB_32172:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_32180
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_32180
	jmp LB_32181
LB_32180:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32178
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32178:
	jmp NS_E_31844_MTC_0_failed
LB_32181:
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
	jc LB_32166
	btr QWORD [rdi],1
LB_32166:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32167
	btr QWORD [rdi],0
LB_32167:
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
NS_E_31844_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_30833_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32164
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31844_MTC_1_failed
LB_32164:
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
	jc LB_32159
	btr QWORD [rdi],0
LB_32159:
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
NS_E_31844_MTC_1_failed:
	add rsp,16
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_31846_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32157
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31844_MTC_2_failed
LB_32157:
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
	jc LB_32152
	btr QWORD [rdi],0
LB_32152:
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
NS_E_31844_MTC_2_failed:
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
NS_E_31846:
NS_E_RDI_31846:
NS_E_31846_ETR_TBL:
NS_E_31846_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	push r10
	call NS_E_31322_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32227
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31846_MTC_0_failed
LB_32227:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_32235
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_32235
	jmp LB_32236
LB_32235:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32233
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32233:
	jmp NS_E_31846_MTC_0_failed
LB_32236:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_31846_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32240
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32241
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32241:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32242
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32242:
	jmp NS_E_31846_MTC_0_failed
LB_32240:
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
	jc LB_32220
	btr QWORD [rdi],2
LB_32220:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32221
	btr QWORD [rdi],1
LB_32221:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32222
	btr QWORD [rdi],0
LB_32222:
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
NS_E_31846_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; word
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32203
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31846_MTC_1_failed
LB_32203:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	add r14,1
	cmp r14,r10
	jg LB_32211
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_32211
	jmp LB_32212
LB_32211:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32209
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32209:
	jmp NS_E_31846_MTC_1_failed
LB_32212:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	push r10
	call NS_E_31846_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32216
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32217
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32217:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32218
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32218:
	jmp NS_E_31846_MTC_1_failed
LB_32216:
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
	jc LB_32196
	btr QWORD [rdi],2
LB_32196:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32197
	btr QWORD [rdi],1
LB_32197:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32198
	btr QWORD [rdi],0
LB_32198:
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
NS_E_31846_MTC_1_failed:
	add rsp,48
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32194
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31846_MTC_2_failed
LB_32194:
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
	jc LB_32189
	btr QWORD [rdi],0
LB_32189:
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
NS_E_31846_MTC_2_failed:
	add rsp,16
	pop r14
; c3
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	push r10
	call NS_E_31322_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32187
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31846_MTC_3_failed
LB_32187:
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
	jc LB_32182
	btr QWORD [rdi],0
LB_32182:
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
NS_E_31846_MTC_3_failed:
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
NS_E_31848:
NS_E_RDI_31848:
NS_E_31848_ETR_TBL:
NS_E_31848_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\136\144"
	add r14,3
	cmp r14,r10
	jg LB_32256
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_32256
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_32256
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_32256
	jmp LB_32257
LB_32256:
	jmp NS_E_31848_MTC_0_failed
LB_32257:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32261
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32262
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32262:
	jmp NS_E_31848_MTC_0_failed
LB_32261:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	add r14,1
	cmp r14,r10
	jg LB_32271
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_32271
	jmp LB_32272
LB_32271:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32268
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32268:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32269
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32269:
	jmp NS_E_31848_MTC_0_failed
LB_32272:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	push r10
	call NS_E_31856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32276
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32277
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32277:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32278
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32278:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32279
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32279:
	jmp NS_E_31848_MTC_0_failed
LB_32276:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	push r10
	call NS_E_31850_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32284
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_32285
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_32285:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32286
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32286:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32287
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32287:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32288
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32288:
	jmp NS_E_31848_MTC_0_failed
LB_32284:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; dta_def_coprd
	push r10
	call NS_E_31850_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32293
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_32294
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_32294:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_32295
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_32295:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32296
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32296:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32297
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32297:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32298
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32298:
	jmp NS_E_31848_MTC_0_failed
LB_32293:
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
	jc LB_32244
	btr QWORD [rdi],5
LB_32244:
	mov rax,QWORD [rsp+16*5+8*1]
	mov [rdi+8*1+8*5],rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_32245
	btr QWORD [rdi],4
LB_32245:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_32246
	btr QWORD [rdi],3
LB_32246:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_32247
	btr QWORD [rdi],2
LB_32247:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32248
	btr QWORD [rdi],1
LB_32248:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32249
	btr QWORD [rdi],0
LB_32249:
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
NS_E_31848_MTC_0_failed:
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
NS_E_31850:
NS_E_RDI_31850:
NS_E_31850_ETR_TBL:
NS_E_31850_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_32308
LB_32307:
	add r14,1
LB_32308:
	cmp r14,r10
	jge LB_32309
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32307
	cmp al,10
	jz LB_32307
	cmp al,32
	jz LB_32307
LB_32309:
	add r14,3
	cmp r14,r10
	jg LB_32312
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_32312
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_32312
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_32312
	jmp LB_32313
LB_32312:
	jmp NS_E_31850_MTC_0_failed
LB_32313:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_32315
LB_32314:
	add r14,1
LB_32315:
	cmp r14,r10
	jge LB_32316
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32314
	cmp al,10
	jz LB_32314
	cmp al,32
	jz LB_32314
LB_32316:
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32317
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32318
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32318:
	jmp NS_E_31850_MTC_0_failed
LB_32317:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_32321
LB_32320:
	add r14,1
LB_32321:
	cmp r14,r10
	jge LB_32322
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32320
	cmp al,10
	jz LB_32320
	cmp al,32
	jz LB_32320
LB_32322:
	add r14,1
	cmp r14,r10
	jg LB_32327
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_32327
	jmp LB_32328
LB_32327:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32324
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32324:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32325
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32325:
	jmp NS_E_31850_MTC_0_failed
LB_32328:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_32330
LB_32329:
	add r14,1
LB_32330:
	cmp r14,r10
	jge LB_32331
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32329
	cmp al,10
	jz LB_32329
	cmp al,32
	jz LB_32329
LB_32331:
	push r10
	call NS_E_31856_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32332
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32333
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32333:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32334
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32334:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32335
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32335:
	jmp NS_E_31850_MTC_0_failed
LB_32332:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dta_def_coprd
	jmp LB_32338
LB_32337:
	add r14,1
LB_32338:
	cmp r14,r10
	jge LB_32339
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32337
	cmp al,10
	jz LB_32337
	cmp al,32
	jz LB_32337
LB_32339:
	push r10
	call NS_E_31850_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32340
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_32341
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_32341:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32342
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32342:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32343
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32343:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32344
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32344:
	jmp NS_E_31850_MTC_0_failed
LB_32340:
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
	jc LB_32301
	btr QWORD [rdi],4
LB_32301:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_32302
	btr QWORD [rdi],3
LB_32302:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_32303
	btr QWORD [rdi],2
LB_32303:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32304
	btr QWORD [rdi],1
LB_32304:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32305
	btr QWORD [rdi],0
LB_32305:
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
NS_E_31850_MTC_0_failed:
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
NS_E_31850_MTC_1_failed:
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
NS_E_31852:
NS_E_RDI_31852:
NS_E_31852_ETR_TBL:
NS_E_31852_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_32413
LB_32412:
	add r14,1
LB_32413:
	cmp r14,r10
	jge LB_32414
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32412
	cmp al,10
	jz LB_32412
	cmp al,32
	jz LB_32412
LB_32414:
	push r10
	call NS_E_31846_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32415
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31852_MTC_0_failed
LB_32415:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn
	jmp LB_32418
LB_32417:
	add r14,1
LB_32418:
	cmp r14,r10
	jge LB_32419
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32417
	cmp al,10
	jz LB_32417
	cmp al,32
	jz LB_32417
LB_32419:
	push r10
	call NS_E_31864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32420
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32421
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32421:
	jmp NS_E_31852_MTC_0_failed
LB_32420:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_32424
LB_32423:
	add r14,1
LB_32424:
	cmp r14,r10
	jge LB_32425
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32423
	cmp al,10
	jz LB_32423
	cmp al,32
	jz LB_32423
LB_32425:
	add r14,3
	cmp r14,r10
	jg LB_32430
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_32430
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_32430
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_32430
	jmp LB_32431
LB_32430:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32427
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32427:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32428
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32428:
	jmp NS_E_31852_MTC_0_failed
LB_32431:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_32433
LB_32432:
	add r14,1
LB_32433:
	cmp r14,r10
	jge LB_32434
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32432
	cmp al,10
	jz LB_32432
	cmp al,32
	jz LB_32432
LB_32434:
	push r10
	call NS_E_31864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32435
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32436
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32436:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32437
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32437:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32438
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32438:
	jmp NS_E_31852_MTC_0_failed
LB_32435:
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
	jc LB_32407
	btr QWORD [rdi],3
LB_32407:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_32408
	btr QWORD [rdi],2
LB_32408:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32409
	btr QWORD [rdi],1
LB_32409:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32410
	btr QWORD [rdi],0
LB_32410:
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
NS_E_31852_MTC_0_failed:
	add rsp,64
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_32369
LB_32368:
	add r14,1
LB_32369:
	cmp r14,r10
	jge LB_32370
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32368
	cmp al,10
	jz LB_32368
	cmp al,32
	jz LB_32368
LB_32370:
	add r14,1
	cmp r14,r10
	jg LB_32373
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_32373
	jmp LB_32374
LB_32373:
	jmp NS_E_31852_MTC_1_failed
LB_32374:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_32376
LB_32375:
	add r14,1
LB_32376:
	cmp r14,r10
	jge LB_32377
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32375
	cmp al,10
	jz LB_32375
	cmp al,32
	jz LB_32375
LB_32377:
	push r10
	call NS_E_31864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32378
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32379
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32379:
	jmp NS_E_31852_MTC_1_failed
LB_32378:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_32382
LB_32381:
	add r14,1
LB_32382:
	cmp r14,r10
	jge LB_32383
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32381
	cmp al,10
	jz LB_32381
	cmp al,32
	jz LB_32381
LB_32383:
	add r14,3
	cmp r14,r10
	jg LB_32388
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_32388
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_32388
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_32388
	jmp LB_32389
LB_32388:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32385
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32385:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32386
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32386:
	jmp NS_E_31852_MTC_1_failed
LB_32389:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; reg_ptn
	jmp LB_32391
LB_32390:
	add r14,1
LB_32391:
	cmp r14,r10
	jge LB_32392
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32390
	cmp al,10
	jz LB_32390
	cmp al,32
	jz LB_32390
LB_32392:
	push r10
	call NS_E_31864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32393
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32394
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32394:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32395
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32395:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32396
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32396:
	jmp NS_E_31852_MTC_1_failed
LB_32393:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; cmm_reg_ptn
	jmp LB_32399
LB_32398:
	add r14,1
LB_32399:
	cmp r14,r10
	jge LB_32400
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32398
	cmp al,10
	jz LB_32398
	cmp al,32
	jz LB_32398
LB_32400:
	push r10
	call NS_E_31854_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32401
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_32402
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_32402:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_32403
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_32403:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32404
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32404:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32405
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32405:
	jmp NS_E_31852_MTC_1_failed
LB_32401:
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
	jc LB_32362
	btr QWORD [rdi],4
LB_32362:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_32363
	btr QWORD [rdi],3
LB_32363:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_32364
	btr QWORD [rdi],2
LB_32364:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32365
	btr QWORD [rdi],1
LB_32365:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32366
	btr QWORD [rdi],0
LB_32366:
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
NS_E_31852_MTC_1_failed:
	add rsp,80
	pop r14
; c2
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_32350
LB_32349:
	add r14,1
LB_32350:
	cmp r14,r10
	jge LB_32351
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32349
	cmp al,10
	jz LB_32349
	cmp al,32
	jz LB_32349
LB_32351:
	add r14,3
	cmp r14,r10
	jg LB_32354
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_32354
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_32354
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_32354
	jmp LB_32355
LB_32354:
	jmp NS_E_31852_MTC_2_failed
LB_32355:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_32357
LB_32356:
	add r14,1
LB_32357:
	cmp r14,r10
	jge LB_32358
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32356
	cmp al,10
	jz LB_32356
	cmp al,32
	jz LB_32356
LB_32358:
	push r10
	call NS_E_31864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32359
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32360
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32360:
	jmp NS_E_31852_MTC_2_failed
LB_32359:
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
	jc LB_32346
	btr QWORD [rdi],1
LB_32346:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32347
	btr QWORD [rdi],0
LB_32347:
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
NS_E_31852_MTC_2_failed:
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
NS_E_31854:
NS_E_RDI_31854:
NS_E_31854_ETR_TBL:
NS_E_31854_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ","
	jmp LB_32444
LB_32443:
	add r14,1
LB_32444:
	cmp r14,r10
	jge LB_32445
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32443
	cmp al,10
	jz LB_32443
	cmp al,32
	jz LB_32443
LB_32445:
	add r14,1
	cmp r14,r10
	jg LB_32448
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_32448
	jmp LB_32449
LB_32448:
	jmp NS_E_31854_MTC_0_failed
LB_32449:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn
	jmp LB_32451
LB_32450:
	add r14,1
LB_32451:
	cmp r14,r10
	jge LB_32452
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32450
	cmp al,10
	jz LB_32450
	cmp al,32
	jz LB_32450
LB_32452:
	push r10
	call NS_E_31864_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32453
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32454
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32454:
	jmp NS_E_31854_MTC_0_failed
LB_32453:
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
	jc LB_32440
	btr QWORD [rdi],1
LB_32440:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32441
	btr QWORD [rdi],0
LB_32441:
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
NS_E_31854_MTC_0_failed:
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
NS_E_31856:
NS_E_RDI_31856:
NS_E_31856_ETR_TBL:
NS_E_31856_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_imp
	push r10
	call NS_E_31858_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32461
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31856_MTC_0_failed
LB_32461:
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
	jc LB_32456
	btr QWORD [rdi],0
LB_32456:
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
NS_E_31856_MTC_0_failed:
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
NS_E_31858:
NS_E_RDI_31858:
NS_E_31858_ETR_TBL:
NS_E_31858_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_app
	jmp LB_32475
LB_32474:
	add r14,1
LB_32475:
	cmp r14,r10
	jge LB_32476
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32474
	cmp al,10
	jz LB_32474
	cmp al,32
	jz LB_32474
LB_32476:
	push r10
	call NS_E_31860_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32477
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31858_MTC_0_failed
LB_32477:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\134\146"
	jmp LB_32480
LB_32479:
	add r14,1
LB_32480:
	cmp r14,r10
	jge LB_32481
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32479
	cmp al,10
	jz LB_32479
	cmp al,32
	jz LB_32479
LB_32481:
	add r14,3
	cmp r14,r10
	jg LB_32485
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_32485
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_32485
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_32485
	jmp LB_32486
LB_32485:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32483
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32483:
	jmp NS_E_31858_MTC_0_failed
LB_32486:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_imp
	jmp LB_32488
LB_32487:
	add r14,1
LB_32488:
	cmp r14,r10
	jge LB_32489
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32487
	cmp al,10
	jz LB_32487
	cmp al,32
	jz LB_32487
LB_32489:
	push r10
	call NS_E_31858_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32490
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32491
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32491:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32492
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32492:
	jmp NS_E_31858_MTC_0_failed
LB_32490:
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
	jc LB_32470
	btr QWORD [rdi],2
LB_32470:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32471
	btr QWORD [rdi],1
LB_32471:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32472
	btr QWORD [rdi],0
LB_32472:
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
NS_E_31858_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_app
	jmp LB_32466
LB_32465:
	add r14,1
LB_32466:
	cmp r14,r10
	jge LB_32467
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32465
	cmp al,10
	jz LB_32465
	cmp al,32
	jz LB_32465
LB_32467:
	push r10
	call NS_E_31860_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32468
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31858_MTC_1_failed
LB_32468:
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
	jc LB_32463
	btr QWORD [rdi],0
LB_32463:
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
NS_E_31858_MTC_1_failed:
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
NS_E_31860:
NS_E_RDI_31860:
NS_E_31860_ETR_TBL:
NS_E_31860_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_32506
LB_32505:
	add r14,1
LB_32506:
	cmp r14,r10
	jge LB_32507
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32505
	cmp al,10
	jz LB_32505
	cmp al,32
	jz LB_32505
LB_32507:
	push r10
	call NS_E_31862_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32508
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31860_MTC_0_failed
LB_32508:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\151\130"
	jmp LB_32511
LB_32510:
	add r14,1
LB_32511:
	cmp r14,r10
	jge LB_32512
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32510
	cmp al,10
	jz LB_32510
	cmp al,32
	jz LB_32510
LB_32512:
	add r14,3
	cmp r14,r10
	jg LB_32516
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_32516
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_32516
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_32516
	jmp LB_32517
LB_32516:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32514
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32514:
	jmp NS_E_31860_MTC_0_failed
LB_32517:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; type_atm
	jmp LB_32519
LB_32518:
	add r14,1
LB_32519:
	cmp r14,r10
	jge LB_32520
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32518
	cmp al,10
	jz LB_32518
	cmp al,32
	jz LB_32518
LB_32520:
	push r10
	call NS_E_31862_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32521
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32522
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32522:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32523
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32523:
	jmp NS_E_31860_MTC_0_failed
LB_32521:
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
	jc LB_32501
	btr QWORD [rdi],2
LB_32501:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32502
	btr QWORD [rdi],1
LB_32502:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32503
	btr QWORD [rdi],0
LB_32503:
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
NS_E_31860_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; type_atm
	jmp LB_32497
LB_32496:
	add r14,1
LB_32497:
	cmp r14,r10
	jge LB_32498
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32496
	cmp al,10
	jz LB_32496
	cmp al,32
	jz LB_32496
LB_32498:
	push r10
	call NS_E_31862_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32499
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31860_MTC_1_failed
LB_32499:
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
	jc LB_32494
	btr QWORD [rdi],0
LB_32494:
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
NS_E_31860_MTC_1_failed:
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
NS_E_31862:
NS_E_RDI_31862:
NS_E_31862_ETR_TBL:
NS_E_31862_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32530
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31862_MTC_0_failed
LB_32530:
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
	jc LB_32525
	btr QWORD [rdi],0
LB_32525:
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
NS_E_31862_MTC_0_failed:
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
NS_E_31864:
NS_E_RDI_31864:
NS_E_31864_ETR_TBL:
NS_E_31864_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_32544
LB_32543:
	add r14,1
LB_32544:
	cmp r14,r10
	jge LB_32545
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32543
	cmp al,10
	jz LB_32543
	cmp al,32
	jz LB_32543
LB_32545:
	add r14,1
	cmp r14,r10
	jg LB_32548
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_32548
	jmp LB_32549
LB_32548:
	jmp NS_E_31864_MTC_0_failed
LB_32549:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; reg_ptn_lst
	jmp LB_32551
LB_32550:
	add r14,1
LB_32551:
	cmp r14,r10
	jge LB_32552
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32550
	cmp al,10
	jz LB_32550
	cmp al,32
	jz LB_32550
LB_32552:
	push r10
	call NS_E_31866_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32553
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32554
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32554:
	jmp NS_E_31864_MTC_0_failed
LB_32553:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_32557
LB_32556:
	add r14,1
LB_32557:
	cmp r14,r10
	jge LB_32558
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32556
	cmp al,10
	jz LB_32556
	cmp al,32
	jz LB_32556
LB_32558:
	add r14,1
	cmp r14,r10
	jg LB_32563
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_32563
	jmp LB_32564
LB_32563:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_32560
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_32560:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32561
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32561:
	jmp NS_E_31864_MTC_0_failed
LB_32564:
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
	jc LB_32539
	btr QWORD [rdi],2
LB_32539:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_32540
	btr QWORD [rdi],1
LB_32540:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32541
	btr QWORD [rdi],0
LB_32541:
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
NS_E_31864_MTC_0_failed:
	add rsp,48
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; reg
	jmp LB_32535
LB_32534:
	add r14,1
LB_32535:
	cmp r14,r10
	jge LB_32536
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32534
	cmp al,10
	jz LB_32534
	cmp al,32
	jz LB_32534
LB_32536:
	push r10
	call NS_E_31868_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32537
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31864_MTC_1_failed
LB_32537:
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
	jc LB_32532
	btr QWORD [rdi],0
LB_32532:
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
NS_E_31864_MTC_1_failed:
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
NS_E_31866:
NS_E_RDI_31866:
NS_E_31866_ETR_TBL:
NS_E_31866_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; reg
	jmp LB_32570
LB_32569:
	add r14,1
LB_32570:
	cmp r14,r10
	jge LB_32571
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32569
	cmp al,10
	jz LB_32569
	cmp al,32
	jz LB_32569
LB_32571:
	push r10
	call NS_E_31868_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32572
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31866_MTC_0_failed
LB_32572:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; reg_ptn_lst
	jmp LB_32575
LB_32574:
	add r14,1
LB_32575:
	cmp r14,r10
	jge LB_32576
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32574
	cmp al,10
	jz LB_32574
	cmp al,32
	jz LB_32574
LB_32576:
	push r10
	call NS_E_31866_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32577
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32578
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32578:
	jmp NS_E_31866_MTC_0_failed
LB_32577:
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
	jc LB_32566
	btr QWORD [rdi],1
LB_32566:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32567
	btr QWORD [rdi],0
LB_32567:
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
NS_E_31866_MTC_0_failed:
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
NS_E_31866_MTC_1_failed:
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
NS_E_31868:
NS_E_RDI_31868:
NS_E_31868_ETR_TBL:
NS_E_31868_TBL:
; c0
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_32604
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_32604
	jmp LB_32605
LB_32604:
	jmp NS_E_31868_MTC_0_failed
LB_32605:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32609
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_32610
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_32610:
	jmp NS_E_31868_MTC_0_failed
LB_32609:
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
	jc LB_32596
	btr QWORD [rdi],1
LB_32596:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_32597
	btr QWORD [rdi],0
LB_32597:
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
NS_E_31868_MTC_0_failed:
	add rsp,32
	pop r14
; c1
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	jmp LB_32592
LB_32591:
	add r14,1
LB_32592:
	cmp r14,r10
	jge LB_32593
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_32591
	cmp al,10
	jz LB_32591
	cmp al,32
	jz LB_32591
LB_32593:
	push r10
	call NS_E_31187_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_32594
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp NS_E_31868_MTC_1_failed
LB_32594:
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
	jc LB_32589
	btr QWORD [rdi],0
LB_32589:
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
NS_E_31868_MTC_1_failed:
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
	jg LB_32587
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_32587
	jmp LB_32588
LB_32587:
	jmp NS_E_31868_MTC_2_failed
LB_32588:
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
	jc LB_32580
	btr QWORD [rdi],0
LB_32580:
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
NS_E_31868_MTC_2_failed:
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
NS_E_32613:
NS_E_RDI_32613:
; 	» "a" _ ⊢ 0' : %_32612
	mov rdi,1
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_61
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ {  }
 ; {>  %_32612~0':_stg }
; 	∎ {  }
	bt r12,0
	jc LB_32614
	mov rdi,r13
	call dlt
LB_32614:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
section .data
	NS_E_DYN_30760:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30760
	NS_E_DYN_30763:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30763
	NS_E_DYN_30764:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30764
	NS_E_DYN_30765:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30765
	NS_E_DYN_30766:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30766
	NS_E_DYN_30780:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30780
	NS_E_DYN_30823:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30823
	NS_E_DYN_30833:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30833
	NS_E_DYN_30834:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30834
	NS_E_DYN_30835:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_30835
	NS_E_DYN_31044:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31044
	NS_E_DYN_31082:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31082
	NS_E_DYN_31120:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31120
	NS_E_DYN_31158:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31158
	NS_E_DYN_31187:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31187
	NS_E_DYN_31188:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31188
	NS_E_DYN_31189:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31189
	NS_E_DYN_31322:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31322
	NS_E_DYN_31368:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31367:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31367
	NS_E_DYN_31378:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31379:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_31380:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31380
	NS_E_DYN_31381:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31381
	NS_E_DYN_31382:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31382
	CST_DYN_31801:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_31869:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31870:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_31840:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31840
	NS_E_DYN_31871:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31872:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_31873:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_31874:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_31875:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_31876:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 5
	NS_E_DYN_31877:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 6
	NS_E_DYN_31842:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31842
	NS_E_DYN_31878:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31879:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_31880:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_31844:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31844
	NS_E_DYN_31881:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31882:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_31883:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_31884:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_31846:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31846
	NS_E_DYN_31885:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31848:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31848
	NS_E_DYN_31886:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31887:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_31850:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31850
	NS_E_DYN_31888:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31889:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_31890:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_31852:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31852
	NS_E_DYN_31891:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31854:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31854
	NS_E_DYN_31892:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31856:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31856
	NS_E_DYN_31893:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31894:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_31858:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31858
	NS_E_DYN_31895:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31896:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_31860:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31860
	NS_E_DYN_31897:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31862:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31862
	NS_E_DYN_31898:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31899:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_31864:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31864
	NS_E_DYN_31900:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31901:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_31866:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31866
	NS_E_DYN_31902:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_31903:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_31904:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_31868:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_31868
	CST_DYN_32613:
		dq 0x0000_0001_00_82_ffff
		dq 1
