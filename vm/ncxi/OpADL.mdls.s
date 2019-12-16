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
	call NS_E_56502
	call NS_E_61011
	call exec_out
	jmp _end
NS_E_ID_24: dq 0
NS_E_24:
NS_E_RDI_24:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_26: dq 0
NS_E_26:
NS_E_RDI_26:
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
NS_E_54729:
NS_E_RDI_54729:
NS_E_54729_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_54730
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_54730:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_54732:
NS_E_RDI_54732:
NS_E_54732_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_54732_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_54732_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_54733:
NS_E_RDI_54733:
NS_E_54733_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_54733_LB_0
	cmp r11,57
	ja NS_E_54733_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_54733_LB_0:
	mov rax,0
	ret
NS_E_54735:
NS_E_RDI_54735:
NS_E_54735_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_54735_LB_0
	cmp r11,122
	ja NS_E_54735_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_54735_LB_0:
	mov rax,0
	ret
NS_E_54734:
NS_E_RDI_54734:
NS_E_54734_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_54734_LB_0
	cmp r11,90
	ja NS_E_54734_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_54734_LB_0:
	mov rax,0
	ret
NS_E_33:
	mov rdi,r13
	bt r12,0
NS_E_RDI_33:
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
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
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
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
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
NS_E_ID_21: dq 0
NS_E_21:
NS_E_RDI_21:
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rdi]
	shr rax,32
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
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
	mov rax,QWORD [rdi+8+rsi]
	and rax,0xff
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_19: dq 0
NS_E_19:
NS_E_RDI_19:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_25: dq 0
NS_E_25:
NS_E_RDI_25:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_54731:
NS_E_RDI_54731:
NS_E_54731_ETR_TBL:
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
	jz NS_E_54731_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_54731_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_54742:
; 	|» { 0' 1' }
NS_E_RDI_54742:
MTC_LB_54743:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_54744
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
	jnc LB_54745
	bt QWORD [rax],0
	jc LB_54746
	btr r12,2
	jmp LB_54747
LB_54746:
	bts r12,2
LB_54747:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_54745:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_54748:
	cmp r15,0
	jz LB_54749
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_54748
LB_54749:
; ∎ %_54736
 ; {>  %_54736~0':(_lst)◂(t18096'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_54744:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_54750
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
	jnc LB_54751
	bt QWORD [rax],0
	jc LB_54752
	btr r12,4
	jmp LB_54753
LB_54752:
	bts r12,4
LB_54753:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_54751:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_54756
	btr r12,5
	jmp LB_54757
LB_54756:
	bts r12,5
LB_54757:
	mov r8,r11
	bt r12,5
	jc LB_54754
	btr r12,2
	jmp LB_54755
LB_54754:
	bts r12,2
LB_54755:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_54760
	btr r12,5
	jmp LB_54761
LB_54760:
	bts r12,5
LB_54761:
	mov r9,r11
	bt r12,5
	jc LB_54758
	btr r12,3
	jmp LB_54759
LB_54758:
	bts r12,3
LB_54759:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_54762:
	cmp r15,0
	jz LB_54763
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_54762
LB_54763:
; _cns { %_54738 %_54736 } ⊢ %_54740 : %_54740
 ; {>  %_54738~2':t18096'(-1) %_54736~0':(_lst)◂(t18096'(-1)) %_54739~3':(_lst)◂(t18096'(-1)) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f54742 { %_54740 %_54739 } ⊢ %_54741 : %_54741
 ; {>  %_54740~°0◂{ 2' 0' }:(_lst)◂(t18096'(-1)) %_54739~3':(_lst)◂(t18096'(-1)) }
; _f54742 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_54764
	btr r12,1
	jmp LB_54765
LB_54764:
	bts r12,1
LB_54765:
	mov r9,r13
	bt r12,0
	jc LB_54766
	btr r12,3
	jmp LB_54767
LB_54766:
	bts r12,3
LB_54767:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_54772
	btr r12,4
	jmp LB_54773
LB_54772:
	bts r12,4
LB_54773:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_54770
	btr QWORD [rdi],0
	jmp LB_54771
LB_54770:
	bts QWORD [rdi],0
LB_54771:
	mov r10,r9
	bt r12,3
	jc LB_54776
	btr r12,4
	jmp LB_54777
LB_54776:
	bts r12,4
LB_54777:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_54774
	btr QWORD [rdi],1
	jmp LB_54775
LB_54774:
	bts QWORD [rdi],1
LB_54775:
	mov rsi,1
	bt r12,0
	jc LB_54768
	mov rsi,0
	bt r13,0
	jc LB_54768
	jmp LB_54769
LB_54768:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_54769:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_54742
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_54741
 ; {>  %_54741~0':(_lst)◂(t18096'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_54750:
NS_E_54781:
; 	|» 0'
NS_E_RDI_54781:
; _nil {  } ⊢ %_54779 : %_54779
 ; {>  %_54778~0':(_lst)◂(t18117'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f54742 { %_54779 %_54778 } ⊢ %_54780 : %_54780
 ; {>  %_54779~°1◂{  }:(_lst)◂(t18114'(0)) %_54778~0':(_lst)◂(t18117'(-1)) }
; _f54742 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_54782
	btr r12,1
	jmp LB_54783
LB_54782:
	bts r12,1
LB_54783:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_54784
	mov rsi,0
	bt r13,0
	jc LB_54784
	jmp LB_54785
LB_54784:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_54785:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_54742
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_54780
 ; {>  %_54780~0':(_lst)◂(t18117'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_54799:
; 	|» { 0' 1' }
NS_E_RDI_54799:
MTC_LB_54800:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_54801
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
	jnc LB_54802
	bt QWORD [rax],0
	jc LB_54803
	btr r12,4
	jmp LB_54804
LB_54803:
	bts r12,4
LB_54804:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_54802:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_54807
	btr r12,5
	jmp LB_54808
LB_54807:
	bts r12,5
LB_54808:
	mov r8,r11
	bt r12,5
	jc LB_54805
	btr r12,2
	jmp LB_54806
LB_54805:
	bts r12,2
LB_54806:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_54811
	btr r12,5
	jmp LB_54812
LB_54811:
	bts r12,5
LB_54812:
	mov r9,r11
	bt r12,5
	jc LB_54809
	btr r12,3
	jmp LB_54810
LB_54809:
	bts r12,3
LB_54810:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_54813:
	cmp r15,0
	jz LB_54814
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_54813
LB_54814:
; _f44 %_54786 ⊢ %_54790 : %_54790
 ; {>  %_54788~2':_r64 %_54789~3':(_lst)◂(_r64) %_54786~0':_r64 }
	add r13,1
; _f54799 { %_54790 %_54789 } ⊢ { %_54791 %_54792 } : { %_54791 %_54792 }
 ; {>  %_54788~2':_r64 %_54789~3':(_lst)◂(_r64) %_54790~0':_r64 }
; _f54799 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_54817
	btr r12,1
	jmp LB_54818
LB_54817:
	bts r12,1
LB_54818:
	call NS_E_54799
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_54815
	btr r12,2
	jmp LB_54816
LB_54815:
	bts r12,2
LB_54816:
	add rsp,16
; _f43 %_54791 ⊢ %_54793 : %_54793
 ; {>  %_54788~2':_r64 %_54792~1':_stg %_54791~0':_r64 }
	sub r13,1
; _f21 { %_54792 %_54793 %_54788 } ⊢ { %_54794 %_54795 %_54796 } : { %_54794 %_54795 %_54796 }
 ; {>  %_54788~2':_r64 %_54793~0':_r64 %_54792~1':_stg }
; _f21 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_54819
	btr r12,3
	jmp LB_54820
LB_54819:
	bts r12,3
LB_54820:
	mov r14,r13
	bt r12,0
	jc LB_54821
	btr r12,1
	jmp LB_54822
LB_54821:
	bts r12,1
LB_54822:
	mov r13,r9
	bt r12,3
	jc LB_54823
	btr r12,0
	jmp LB_54824
LB_54823:
	bts r12,0
LB_54824:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_54795 %_54794 }
 ; {>  %_54796~2':_r64 %_54794~0':_stg %_54795~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_54825
	mov rdi,r8
	call dlt
LB_54825:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_54826
	btr r12,2
	jmp LB_54827
LB_54826:
	bts r12,2
LB_54827:
	mov r14,r13
	bt r12,0
	jc LB_54828
	btr r12,1
	jmp LB_54829
LB_54828:
	bts r12,1
LB_54829:
	mov r13,r8
	bt r12,2
	jc LB_54830
	btr r12,0
	jmp LB_54831
LB_54830:
	bts r12,0
LB_54831:
	ret
MTC_LB_54801:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_54832
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
	jnc LB_54833
	bt QWORD [rax],0
	jc LB_54834
	btr r12,2
	jmp LB_54835
LB_54834:
	bts r12,2
LB_54835:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_54833:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_54836:
	cmp r15,0
	jz LB_54837
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_54836
LB_54837:
; _f19 %_54786 ⊢ { %_54797 %_54798 } : { %_54797 %_54798 }
 ; {>  %_54786~0':_r64 }
; _f19 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_54797 %_54798 }
 ; {>  %_54798~1':_stg %_54797~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_54832:
NS_E_54842:
; 	|» 0'
NS_E_RDI_54842:
; » 0xr0 |~ {  } ⊢ %_54839 : %_54839
 ; {>  %_54838~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_54839
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f54799 { %_54839 %_54838 } ⊢ { %_54840 %_54841 } : { %_54840 %_54841 }
 ; {>  %_54839~1':_r64 %_54838~0':(_lst)◂(_r64) }
; _f54799 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_54843
	btr r12,2
	jmp LB_54844
LB_54843:
	bts r12,2
LB_54844:
	mov r14,r13
	bt r12,0
	jc LB_54845
	btr r12,1
	jmp LB_54846
LB_54845:
	bts r12,1
LB_54846:
	mov r13,r8
	bt r12,2
	jc LB_54847
	btr r12,0
	jmp LB_54848
LB_54847:
	bts r12,0
LB_54848:
	call NS_E_54799
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_54841
 ; {>  %_54840~0':_r64 %_54841~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_54849
	mov rdi,r13
	call dlt
LB_54849:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_54850
	btr r12,0
	jmp LB_54851
LB_54850:
	bts r12,0
LB_54851:
	ret
NS_E_54852:
NS_E_RDI_54852:
NS_E_54852_ETR_TBL:
NS_E_54852_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_54893
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_54893
	jmp LB_54894
LB_54893:
	jmp LB_54883
LB_54894:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_54853_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_54898
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_54899
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_54899:
	jmp LB_54883
LB_54898:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_54886
	btr r12,1
	jmp LB_54887
LB_54886:
	bts r12,1
LB_54887:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_54884
	btr r12,0
	jmp LB_54885
LB_54884:
	bts r12,0
LB_54885:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_54880
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_54901
	btr r12,2
	jmp LB_54902
LB_54901:
	bts r12,2
LB_54902:
	mov r13,r14
	bt r12,1
	jc LB_54903
	btr r12,0
	jmp LB_54904
LB_54903:
	bts r12,0
LB_54904:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f54842 %_54855 ⊢ %_54856 : %_54856
 ; {>  %_54855~0':(_lst)◂(_r64) }
; _f54842 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_54842
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_54856 ⊢ %_54857 : %_54857
 ; {>  %_54856~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_54857
 ; {>  %_54857~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_54878
	btr r12,3
	jmp LB_54879
LB_54878:
	bts r12,3
LB_54879:
	mov r8,0
	bts r12,2
	ret
LB_54880:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_54882
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_54881
LB_54882:
	add rsp,8
	ret
LB_54883:
	add rsp,32
	pop r14
LB_54881:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_54853:
NS_E_RDI_54853:
NS_E_54853_ETR_TBL:
NS_E_54853_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_54930
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_54930
	jmp LB_54931
LB_54930:
	jmp LB_54918
LB_54931:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_54854_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_54935
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_54936
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_54936:
	jmp LB_54918
LB_54935:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_54853_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_54941
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_54942
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_54942:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_54943
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_54943:
	jmp LB_54918
LB_54941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_54923
	btr r12,2
	jmp LB_54924
LB_54923:
	bts r12,2
LB_54924:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_54921
	btr r12,1
	jmp LB_54922
LB_54921:
	bts r12,1
LB_54922:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_54919
	btr r12,0
	jmp LB_54920
LB_54919:
	bts r12,0
LB_54920:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_54915
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_54945
	btr r12,3
	jmp LB_54946
LB_54945:
	bts r12,3
LB_54946:
	mov r14,r8
	bt r12,2
	jc LB_54947
	btr r12,1
	jmp LB_54948
LB_54947:
	bts r12,1
LB_54948:
	mov r8,r13
	bt r12,0
	jc LB_54949
	btr r12,2
	jmp LB_54950
LB_54949:
	bts r12,2
LB_54950:
	mov r13,r9
	bt r12,3
	jc LB_54951
	btr r12,0
	jmp LB_54952
LB_54951:
	bts r12,0
LB_54952:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_54858 %_54859 } ⊢ %_54860 : %_54860
 ; {>  %_54858~0':_r64 %_54859~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_54860 ⊢ %_54861 : %_54861
 ; {>  %_54860~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_54861
 ; {>  %_54861~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_54909
	btr r12,2
	jmp LB_54910
LB_54909:
	bts r12,2
LB_54910:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_54907
	btr QWORD [rdi],0
	jmp LB_54908
LB_54907:
	bts QWORD [rdi],0
LB_54908:
	mov r8,r14
	bt r12,1
	jc LB_54913
	btr r12,2
	jmp LB_54914
LB_54913:
	bts r12,2
LB_54914:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_54911
	btr QWORD [rdi],1
	jmp LB_54912
LB_54911:
	bts QWORD [rdi],1
LB_54912:
	mov rsi,1
	bt r12,3
	jc LB_54905
	mov rsi,0
	bt r9,0
	jc LB_54905
	jmp LB_54906
LB_54905:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_54906:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_54915:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_54917
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_54916
LB_54917:
	add rsp,8
	ret
LB_54918:
	add rsp,48
	pop r14
LB_54916:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_54966
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_54966
	jmp LB_54967
LB_54966:
	jmp LB_54958
LB_54967:
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
	jc LB_54959
	btr r12,0
	jmp LB_54960
LB_54959:
	bts r12,0
LB_54960:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_54955
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_54862 : %_54862
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_54862 ⊢ %_54863 : %_54863
 ; {>  %_54862~°1◂{  }:(_lst)◂(t18175'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_54863
 ; {>  %_54863~°0◂°1◂{  }:(_opn)◂((_lst)◂(t18178'(0))) }
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
	jc LB_54953
	mov rsi,0
	bt r9,0
	jc LB_54953
	jmp LB_54954
LB_54953:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_54954:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_54955:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_54957
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_54956
LB_54957:
	add rsp,8
	ret
LB_54958:
	add rsp,16
	pop r14
LB_54956:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_54729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_54989
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_54981
LB_54989:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_54853_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_54994
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_54995
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_54995:
	jmp LB_54981
LB_54994:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_54984
	btr r12,1
	jmp LB_54985
LB_54984:
	bts r12,1
LB_54985:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_54982
	btr r12,0
	jmp LB_54983
LB_54982:
	bts r12,0
LB_54983:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_54978
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_54864 %_54865 } ⊢ %_54866 : %_54866
 ; {>  %_54864~0':_r64 %_54865~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_54866 ⊢ %_54867 : %_54867
 ; {>  %_54866~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_54867
 ; {>  %_54867~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_54972
	btr r12,2
	jmp LB_54973
LB_54972:
	bts r12,2
LB_54973:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_54970
	btr QWORD [rdi],0
	jmp LB_54971
LB_54970:
	bts QWORD [rdi],0
LB_54971:
	mov r8,r14
	bt r12,1
	jc LB_54976
	btr r12,2
	jmp LB_54977
LB_54976:
	bts r12,2
LB_54977:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_54974
	btr QWORD [rdi],1
	jmp LB_54975
LB_54974:
	bts QWORD [rdi],1
LB_54975:
	mov rsi,1
	bt r12,3
	jc LB_54968
	mov rsi,0
	bt r9,0
	jc LB_54968
	jmp LB_54969
LB_54968:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_54969:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_54978:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_54980
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_54979
LB_54980:
	add rsp,8
	ret
LB_54981:
	add rsp,32
	pop r14
LB_54979:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_54854:
NS_E_RDI_54854:
NS_E_54854_ETR_TBL:
NS_E_54854_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_55010
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_55010
	jmp LB_55011
LB_55010:
	jmp LB_55002
LB_55011:
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
	jc LB_55003
	btr r12,0
	jmp LB_55004
LB_55003:
	bts r12,0
LB_55004:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_54999
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_54868 : %_54868
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_54868
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_54868 ⊢ %_54869 : %_54869
 ; {>  %_54868~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_54869
 ; {>  %_54869~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_54997
	btr r12,3
	jmp LB_54998
LB_54997:
	bts r12,3
LB_54998:
	mov r8,0
	bts r12,2
	ret
LB_54999:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55001
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55000
LB_55001:
	add rsp,8
	ret
LB_55002:
	add rsp,16
	pop r14
LB_55000:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_55025
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_55025
	jmp LB_55026
LB_55025:
	jmp LB_55017
LB_55026:
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
	jc LB_55018
	btr r12,0
	jmp LB_55019
LB_55018:
	bts r12,0
LB_55019:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55014
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_54870 : %_54870
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_54870
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_54870 ⊢ %_54871 : %_54871
 ; {>  %_54870~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_54871
 ; {>  %_54871~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55012
	btr r12,3
	jmp LB_55013
LB_55012:
	bts r12,3
LB_55013:
	mov r8,0
	bts r12,2
	ret
LB_55014:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55016
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55015
LB_55016:
	add rsp,8
	ret
LB_55017:
	add rsp,16
	pop r14
LB_55015:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_55040
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_55040
	jmp LB_55041
LB_55040:
	jmp LB_55032
LB_55041:
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
	jc LB_55033
	btr r12,0
	jmp LB_55034
LB_55033:
	bts r12,0
LB_55034:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55029
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_54872 : %_54872
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_54872
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_54872 ⊢ %_54873 : %_54873
 ; {>  %_54872~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_54873
 ; {>  %_54873~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55027
	btr r12,3
	jmp LB_55028
LB_55027:
	bts r12,3
LB_55028:
	mov r8,0
	bts r12,2
	ret
LB_55029:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55031
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55030
LB_55031:
	add rsp,8
	ret
LB_55032:
	add rsp,16
	pop r14
LB_55030:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_55055
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_55055
	jmp LB_55056
LB_55055:
	jmp LB_55047
LB_55056:
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
	jc LB_55048
	btr r12,0
	jmp LB_55049
LB_55048:
	bts r12,0
LB_55049:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55044
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_54874 : %_54874
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_54874
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_54874 ⊢ %_54875 : %_54875
 ; {>  %_54874~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_54875
 ; {>  %_54875~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55042
	btr r12,3
	jmp LB_55043
LB_55042:
	bts r12,3
LB_55043:
	mov r8,0
	bts r12,2
	ret
LB_55044:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55046
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55045
LB_55046:
	add rsp,8
	ret
LB_55047:
	add rsp,16
	pop r14
LB_55045:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_55070
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_55070
	jmp LB_55071
LB_55070:
	jmp LB_55062
LB_55071:
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
	jc LB_55063
	btr r12,0
	jmp LB_55064
LB_55063:
	bts r12,0
LB_55064:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55059
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_54876 : %_54876
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_54876
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_54876 ⊢ %_54877 : %_54877
 ; {>  %_54876~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_54877
 ; {>  %_54877~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55057
	btr r12,3
	jmp LB_55058
LB_55057:
	bts r12,3
LB_55058:
	mov r8,0
	bts r12,2
	ret
LB_55059:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55061
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55060
LB_55061:
	add rsp,8
	ret
LB_55062:
	add rsp,16
	pop r14
LB_55060:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55072:
NS_E_RDI_55072:
NS_E_55072_ETR_TBL:
NS_E_55072_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_54729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55109
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55103
LB_55109:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55104
	btr r12,0
	jmp LB_55105
LB_55104:
	bts r12,0
LB_55105:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55100
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_55074 : %_55074
 ; {>  %_55073~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_55074
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_55075 : %_55075
 ; {>  %_55073~0':_r64 %_55074~1':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_55075
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f38 { %_55073 %_55074 } ⊢ { %_55076 %_55077 %_55078 } : { %_55076 %_55077 %_55078 }
 ; {>  %_55073~0':_r64 %_55074~1':_r64 %_55075~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_55075 %_55076 } ⊢ { %_55079 %_55080 %_55081 } : { %_55079 %_55080 %_55081 }
 ; {>  %_55077~1':_r64 %_55076~0':_r64 %_55078~3':_r64 %_55075~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_55084:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_55085
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_55085
LB_55086:
	cmp r15,0
	jz LB_55087
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55086
LB_55087:
; _some %_55080 ⊢ %_55082 : %_55082
 ; {>  %_55077~1':_r64 %_55080~0':_r64 %_55079~2':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55082
 ; {>  %_55077~1':_r64 %_55079~2':_r64 %_55082~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_55088
	mov rdi,r14
	call dlt
LB_55088:
	bt r12,2
	jc LB_55089
	mov rdi,r8
	call dlt
LB_55089:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55090
	btr r12,3
	jmp LB_55091
LB_55090:
	bts r12,3
LB_55091:
	mov r8,0
	bts r12,2
	ret
MTC_LB_55085:
	mov r15,0
LB_55093:
	cmp r15,0
	jz LB_55094
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55093
LB_55094:
; _none {  } ⊢ %_55083 : %_55083
 ; {>  %_55077~1':_r64 %_55080~0':_r64 %_55081~4':_r64 %_55079~2':_r64 %_55078~3':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_55083
 ; {>  %_55083~°1◂{  }:(_opn)◂(t18254'(0)) %_55077~1':_r64 %_55080~0':_r64 %_55081~4':_r64 %_55079~2':_r64 %_55078~3':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_55095
	mov rdi,r14
	call dlt
LB_55095:
	bt r12,0
	jc LB_55096
	mov rdi,r13
	call dlt
LB_55096:
	bt r12,4
	jc LB_55097
	mov rdi,r10
	call dlt
LB_55097:
	bt r12,2
	jc LB_55098
	mov rdi,r8
	call dlt
LB_55098:
	bt r12,3
	jc LB_55099
	mov rdi,r9
	call dlt
LB_55099:
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
MTC_LB_55092:
LB_55100:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55102
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55101
LB_55102:
	add rsp,8
	ret
LB_55103:
	add rsp,16
	pop r14
LB_55101:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55111:
NS_E_RDI_55111:
NS_E_55111_ETR_TBL:
NS_E_55111_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_54729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55148
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55142
LB_55148:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55143
	btr r12,0
	jmp LB_55144
LB_55143:
	bts r12,0
LB_55144:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55139
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_55113 : %_55113
 ; {>  %_55112~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_55113
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_55114 : %_55114
 ; {>  %_55113~1':_r64 %_55112~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_55114
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f38 { %_55112 %_55113 } ⊢ { %_55115 %_55116 %_55117 } : { %_55115 %_55116 %_55117 }
 ; {>  %_55113~1':_r64 %_55114~2':_r64 %_55112~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_55114 %_55115 } ⊢ { %_55118 %_55119 %_55120 } : { %_55118 %_55119 %_55120 }
 ; {>  %_55114~2':_r64 %_55117~3':_r64 %_55116~1':_r64 %_55115~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_55123:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_55124
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_55124
LB_55125:
	cmp r15,0
	jz LB_55126
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55125
LB_55126:
; _some %_55119 ⊢ %_55121 : %_55121
 ; {>  %_55118~2':_r64 %_55119~0':_r64 %_55116~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55121
 ; {>  %_55118~2':_r64 %_55121~°0◂0':(_opn)◂(_r64) %_55116~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_55127
	mov rdi,r8
	call dlt
LB_55127:
	bt r12,1
	jc LB_55128
	mov rdi,r14
	call dlt
LB_55128:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55129
	btr r12,3
	jmp LB_55130
LB_55129:
	bts r12,3
LB_55130:
	mov r8,0
	bts r12,2
	ret
MTC_LB_55124:
	mov r15,0
LB_55132:
	cmp r15,0
	jz LB_55133
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55132
LB_55133:
; _none {  } ⊢ %_55122 : %_55122
 ; {>  %_55118~2':_r64 %_55119~0':_r64 %_55117~3':_r64 %_55116~1':_r64 %_55120~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_55122
 ; {>  %_55118~2':_r64 %_55119~0':_r64 %_55117~3':_r64 %_55116~1':_r64 %_55122~°1◂{  }:(_opn)◂(t18281'(0)) %_55120~4':_r64 }
; 	∎ °1◂{  }
	bt r12,2
	jc LB_55134
	mov rdi,r8
	call dlt
LB_55134:
	bt r12,0
	jc LB_55135
	mov rdi,r13
	call dlt
LB_55135:
	bt r12,3
	jc LB_55136
	mov rdi,r9
	call dlt
LB_55136:
	bt r12,1
	jc LB_55137
	mov rdi,r14
	call dlt
LB_55137:
	bt r12,4
	jc LB_55138
	mov rdi,r10
	call dlt
LB_55138:
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
MTC_LB_55131:
LB_55139:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55141
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55140
LB_55141:
	add rsp,8
	ret
LB_55142:
	add rsp,16
	pop r14
LB_55140:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55150:
NS_E_RDI_55150:
NS_E_55150_ETR_TBL:
NS_E_55150_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_54729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55187
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55181
LB_55187:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55182
	btr r12,0
	jmp LB_55183
LB_55182:
	bts r12,0
LB_55183:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55178
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_55152 : %_55152
 ; {>  %_55151~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_55152
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_55153 : %_55153
 ; {>  %_55152~1':_r64 %_55151~0':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_55153
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f38 { %_55151 %_55152 } ⊢ { %_55154 %_55155 %_55156 } : { %_55154 %_55155 %_55156 }
 ; {>  %_55153~2':_r64 %_55152~1':_r64 %_55151~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_55153 %_55154 } ⊢ { %_55157 %_55158 %_55159 } : { %_55157 %_55158 %_55159 }
 ; {>  %_55156~3':_r64 %_55153~2':_r64 %_55155~1':_r64 %_55154~0':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_55162:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_55163
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_55163
LB_55164:
	cmp r15,0
	jz LB_55165
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55164
LB_55165:
; _some %_55158 ⊢ %_55160 : %_55160
 ; {>  %_55158~0':_r64 %_55157~2':_r64 %_55155~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55160
 ; {>  %_55157~2':_r64 %_55155~1':_r64 %_55160~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,2
	jc LB_55166
	mov rdi,r8
	call dlt
LB_55166:
	bt r12,1
	jc LB_55167
	mov rdi,r14
	call dlt
LB_55167:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55168
	btr r12,3
	jmp LB_55169
LB_55168:
	bts r12,3
LB_55169:
	mov r8,0
	bts r12,2
	ret
MTC_LB_55163:
	mov r15,0
LB_55171:
	cmp r15,0
	jz LB_55172
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55171
LB_55172:
; _none {  } ⊢ %_55161 : %_55161
 ; {>  %_55158~0':_r64 %_55157~2':_r64 %_55156~3':_r64 %_55155~1':_r64 %_55159~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_55161
 ; {>  %_55158~0':_r64 %_55157~2':_r64 %_55156~3':_r64 %_55155~1':_r64 %_55159~4':_r64 %_55161~°1◂{  }:(_opn)◂(t18308'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_55173
	mov rdi,r13
	call dlt
LB_55173:
	bt r12,2
	jc LB_55174
	mov rdi,r8
	call dlt
LB_55174:
	bt r12,3
	jc LB_55175
	mov rdi,r9
	call dlt
LB_55175:
	bt r12,1
	jc LB_55176
	mov rdi,r14
	call dlt
LB_55176:
	bt r12,4
	jc LB_55177
	mov rdi,r10
	call dlt
LB_55177:
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
MTC_LB_55170:
LB_55178:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55180
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55179
LB_55180:
	add rsp,8
	ret
LB_55181:
	add rsp,16
	pop r14
LB_55179:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55189:
NS_E_RDI_55189:
NS_E_55189_ETR_TBL:
NS_E_55189_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_55150_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55205
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55199
LB_55205:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55200
	btr r12,0
	jmp LB_55201
LB_55200:
	bts r12,0
LB_55201:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55196
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_55190 ⊢ %_55191 : %_55191
 ; {>  %_55190~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55191
 ; {>  %_55191~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55194
	btr r12,3
	jmp LB_55195
LB_55194:
	bts r12,3
LB_55195:
	mov r8,0
	bts r12,2
	ret
LB_55196:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55198
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55197
LB_55198:
	add rsp,8
	ret
LB_55199:
	add rsp,16
	pop r14
LB_55197:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_55111_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55218
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55212
LB_55218:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55213
	btr r12,0
	jmp LB_55214
LB_55213:
	bts r12,0
LB_55214:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55209
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_55192 ⊢ %_55193 : %_55193
 ; {>  %_55192~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55193
 ; {>  %_55193~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55207
	btr r12,3
	jmp LB_55208
LB_55207:
	bts r12,3
LB_55208:
	mov r8,0
	bts r12,2
	ret
LB_55209:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55211
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55210
LB_55211:
	add rsp,8
	ret
LB_55212:
	add rsp,16
	pop r14
LB_55210:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55220:
NS_E_RDI_55220:
NS_E_55220_ETR_TBL:
NS_E_55220_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_55189_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55265
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55257
LB_55265:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_55221_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55270
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55271
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55271:
	jmp LB_55257
LB_55270:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_55260
	btr r12,1
	jmp LB_55261
LB_55260:
	bts r12,1
LB_55261:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55258
	btr r12,0
	jmp LB_55259
LB_55258:
	bts r12,0
LB_55259:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_55254
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_55223 %_55224 } ⊢ %_55225 : %_55225
 ; {>  %_55223~0':_r64 %_55224~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f54842 %_55225 ⊢ %_55226 : %_55226
 ; {>  %_55225~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f54842 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_55240
	btr r12,2
	jmp LB_55241
LB_55240:
	bts r12,2
LB_55241:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_55246
	btr r12,3
	jmp LB_55247
LB_55246:
	bts r12,3
LB_55247:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_55244
	btr QWORD [rdi],0
	jmp LB_55245
LB_55244:
	bts QWORD [rdi],0
LB_55245:
	mov r9,r14
	bt r12,1
	jc LB_55250
	btr r12,3
	jmp LB_55251
LB_55250:
	bts r12,3
LB_55251:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_55248
	btr QWORD [rdi],1
	jmp LB_55249
LB_55248:
	bts QWORD [rdi],1
LB_55249:
	mov rsi,1
	bt r12,0
	jc LB_55242
	mov rsi,0
	bt r13,0
	jc LB_55242
	jmp LB_55243
LB_55242:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_55243:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_54842
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_55226 ⊢ %_55227 : %_55227
 ; {>  %_55226~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_55227
 ; {>  %_55227~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55252
	btr r12,3
	jmp LB_55253
LB_55252:
	bts r12,3
LB_55253:
	mov r8,0
	bts r12,2
	ret
LB_55254:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55256
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55255
LB_55256:
	add rsp,8
	ret
LB_55257:
	add rsp,32
	pop r14
LB_55255:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55221:
NS_E_RDI_55221:
NS_E_55221_ETR_TBL:
NS_E_55221_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_55222_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55294
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55286
LB_55294:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_55221_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55299
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55300
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55300:
	jmp LB_55286
LB_55299:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_55289
	btr r12,1
	jmp LB_55290
LB_55289:
	bts r12,1
LB_55290:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55287
	btr r12,0
	jmp LB_55288
LB_55287:
	bts r12,0
LB_55288:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_55283
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_55228 %_55229 } ⊢ %_55230 : %_55230
 ; {>  %_55228~0':_r64 %_55229~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_55230 ⊢ %_55231 : %_55231
 ; {>  %_55230~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_55231
 ; {>  %_55231~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_55277
	btr r12,2
	jmp LB_55278
LB_55277:
	bts r12,2
LB_55278:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_55275
	btr QWORD [rdi],0
	jmp LB_55276
LB_55275:
	bts QWORD [rdi],0
LB_55276:
	mov r8,r14
	bt r12,1
	jc LB_55281
	btr r12,2
	jmp LB_55282
LB_55281:
	bts r12,2
LB_55282:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_55279
	btr QWORD [rdi],1
	jmp LB_55280
LB_55279:
	bts QWORD [rdi],1
LB_55280:
	mov rsi,1
	bt r12,3
	jc LB_55273
	mov rsi,0
	bt r9,0
	jc LB_55273
	jmp LB_55274
LB_55273:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_55274:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_55283:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55285
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55284
LB_55285:
	add rsp,8
	ret
LB_55286:
	add rsp,32
	pop r14
LB_55284:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_55304
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_55232 : %_55232
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_55232 ⊢ %_55233 : %_55233
 ; {>  %_55232~°1◂{  }:(_lst)◂(t18352'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_55233
 ; {>  %_55233~°0◂°1◂{  }:(_opn)◂((_lst)◂(t18355'(0))) }
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
	jc LB_55302
	mov rsi,0
	bt r9,0
	jc LB_55302
	jmp LB_55303
LB_55302:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_55303:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_55304:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55306
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55305
LB_55306:
	add rsp,8
	ret
LB_55307:
	add rsp,0
	pop r14
LB_55305:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55222:
NS_E_RDI_55222:
NS_E_55222_ETR_TBL:
NS_E_55222_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_55189_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55319
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55313
LB_55319:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55314
	btr r12,0
	jmp LB_55315
LB_55314:
	bts r12,0
LB_55315:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55310
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_55234 ⊢ %_55235 : %_55235
 ; {>  %_55234~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55235
 ; {>  %_55235~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55308
	btr r12,3
	jmp LB_55309
LB_55308:
	bts r12,3
LB_55309:
	mov r8,0
	bts r12,2
	ret
LB_55310:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55312
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55311
LB_55312:
	add rsp,8
	ret
LB_55313:
	add rsp,16
	pop r14
LB_55311:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_55072_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55332
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55326
LB_55332:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55327
	btr r12,0
	jmp LB_55328
LB_55327:
	bts r12,0
LB_55328:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55323
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_55236 ⊢ %_55237 : %_55237
 ; {>  %_55236~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55237
 ; {>  %_55237~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55321
	btr r12,3
	jmp LB_55322
LB_55321:
	bts r12,3
LB_55322:
	mov r8,0
	bts r12,2
	ret
LB_55323:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55325
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55324
LB_55325:
	add rsp,8
	ret
LB_55326:
	add rsp,16
	pop r14
LB_55324:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_55347
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_55347
	jmp LB_55348
LB_55347:
	jmp LB_55339
LB_55348:
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
	jc LB_55340
	btr r12,0
	jmp LB_55341
LB_55340:
	bts r12,0
LB_55341:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55336
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_55238 : %_55238
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_55238
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_55238 ⊢ %_55239 : %_55239
 ; {>  %_55238~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55239
 ; {>  %_55239~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55334
	btr r12,3
	jmp LB_55335
LB_55334:
	bts r12,3
LB_55335:
	mov r8,0
	bts r12,2
	ret
LB_55336:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55338
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55337
LB_55338:
	add rsp,8
	ret
LB_55339:
	add rsp,16
	pop r14
LB_55337:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55349:
NS_E_RDI_55349:
NS_E_55349_ETR_TBL:
NS_E_55349_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_55370
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_55370
	jmp LB_55371
LB_55370:
	jmp LB_55360
LB_55371:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_55221_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55375
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55376
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55376:
	jmp LB_55360
LB_55375:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_55363
	btr r12,1
	jmp LB_55364
LB_55363:
	bts r12,1
LB_55364:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55361
	btr r12,0
	jmp LB_55362
LB_55361:
	bts r12,0
LB_55362:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_55357
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_55378
	btr r12,2
	jmp LB_55379
LB_55378:
	bts r12,2
LB_55379:
	mov r13,r14
	bt r12,1
	jc LB_55380
	btr r12,0
	jmp LB_55381
LB_55380:
	bts r12,0
LB_55381:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f54842 %_55350 ⊢ %_55351 : %_55351
 ; {>  %_55350~0':(_lst)◂(_r64) }
; _f54842 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_54842
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_55351 ⊢ %_55352 : %_55352
 ; {>  %_55351~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_55352
 ; {>  %_55352~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55355
	btr r12,3
	jmp LB_55356
LB_55355:
	bts r12,3
LB_55356:
	mov r8,0
	bts r12,2
	ret
LB_55357:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55359
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55358
LB_55359:
	add rsp,8
	ret
LB_55360:
	add rsp,32
	pop r14
LB_55358:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55393
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55387
LB_55393:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55388
	btr r12,0
	jmp LB_55389
LB_55388:
	bts r12,0
LB_55389:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55384
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_55353 ⊢ %_55354 : %_55354
 ; {>  %_55353~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_55354
 ; {>  %_55354~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55382
	btr r12,3
	jmp LB_55383
LB_55382:
	bts r12,3
LB_55383:
	mov r8,0
	bts r12,2
	ret
LB_55384:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55386
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55385
LB_55386:
	add rsp,8
	ret
LB_55387:
	add rsp,16
	pop r14
LB_55385:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55396:
NS_E_RDI_55396:
NS_E_55396_ETR_TBL:
NS_E_55396_TBL:
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
LB_55405:
	jmp LB_55402
LB_55401:
	add r14,1
LB_55402:
	cmp r14,r10
	jge LB_55403
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_55401
	cmp al,10
	jz LB_55401
	cmp al,32
	jz LB_55401
LB_55403:
	push r10
	push rsi
	call NS_E_55220_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_55404
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_55406
	bts QWORD [rax],0
LB_55406:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_55405
LB_55404:
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
	jc LB_55399
	btr QWORD [rdi],0
LB_55399:
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
LB_55398:
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
NS_E_55548:
; 	|» 0'
NS_E_RDI_55548:
MTC_LB_55549:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_55550
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_55551
	bt QWORD [rax],0
	jc LB_55552
	btr r12,3
	jmp LB_55553
LB_55552:
	bts r12,3
LB_55553:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55551:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_55556
	btr r12,4
	jmp LB_55557
LB_55556:
	bts r12,4
LB_55557:
	mov r14,r10
	bt r12,4
	jc LB_55554
	btr r12,1
	jmp LB_55555
LB_55554:
	bts r12,1
LB_55555:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_55560
	btr r12,4
	jmp LB_55561
LB_55560:
	bts r12,4
LB_55561:
	mov r8,r10
	bt r12,4
	jc LB_55558
	btr r12,2
	jmp LB_55559
LB_55558:
	bts r12,2
LB_55559:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_55562:
	cmp r15,0
	jz LB_55563
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55562
LB_55563:
MTC_LB_55564:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_55565
; _emt_mov_ptn_to_ptn:{| 0110.. |},2' ⊢ °0◂0'
; 2' ⊢ °0◂0'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_55566
	bt QWORD [rax],0
	jc LB_55567
	btr r12,3
	jmp LB_55568
LB_55567:
	bts r12,3
LB_55568:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55566:
	mov r9,rax
	mov r13,r9
	bt r12,3
	jc LB_55569
	btr r12,0
	jmp LB_55570
LB_55569:
	bts r12,0
LB_55570:
LB_55571:
	cmp r15,0
	jz LB_55572
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55571
LB_55572:
; _f55520 %_55524 ⊢ %_55525 : %_55525
 ; {>  %_55522~1':_stg %_55524~0':(_lst)◂(_p55413) }
; _f55520 0' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_55520
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_55573
	btr r12,1
	jmp LB_55574
LB_55573:
	bts r12,1
LB_55574:
	add rsp,16
; 	» "JJ\n" _ ⊢ 2' : %_55526
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_4a_4a
	mov QWORD [rdi+8*1+8*0],rax
	mov r8,rdi
	btr r12,2
; » _^ ..
	mov rax,13
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r8
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*2],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r8
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*2]
	cld
	rep movsb
	pop rcx
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
; //
	mov r9,rax
	btr r12,3
; ∎ %_55530
 ; {>  %_55529~2':_stg %_55528~0':_stg %_55530~3':_stg %_55527~1':_stg }
; 	∎ 3'
	bt r12,2
	jc LB_55575
	mov rdi,r8
	call dlt
LB_55575:
	bt r12,0
	jc LB_55576
	mov rdi,r13
	call dlt
LB_55576:
	bt r12,1
	jc LB_55577
	mov rdi,r14
	call dlt
LB_55577:
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_55578
	btr r12,0
	jmp LB_55579
LB_55578:
	bts r12,0
LB_55579:
	ret
MTC_LB_55565:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_55580
; _emt_mov_ptn_to_ptn:{| 0110.. |},2' ⊢ °1◂0'
; 2' ⊢ °1◂0'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_55581
	bt QWORD [rax],0
	jc LB_55582
	btr r12,3
	jmp LB_55583
LB_55582:
	bts r12,3
LB_55583:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55581:
	mov r9,rax
	mov r13,r9
	bt r12,3
	jc LB_55584
	btr r12,0
	jmp LB_55585
LB_55584:
	bts r12,0
LB_55585:
LB_55586:
	cmp r15,0
	jz LB_55587
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55586
LB_55587:
; » _^ ..
	mov rax,11
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; " = .."
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; //
	mov r8,rax
	btr r12,2
; ∎ %_55533
 ; {>  %_55531~0':_p55407 %_55533~2':_stg %_55532~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_55588
	mov rdi,r13
	call dlt
LB_55588:
	bt r12,1
	jc LB_55589
	mov rdi,r14
	call dlt
LB_55589:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_55590
	btr r12,0
	jmp LB_55591
LB_55590:
	bts r12,0
LB_55591:
	ret
MTC_LB_55580:
MTC_LB_55550:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_55592
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_55593
	bt QWORD [rax],0
	jc LB_55594
	btr r12,2
	jmp LB_55595
LB_55594:
	bts r12,2
LB_55595:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55593:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_55596
	btr r12,1
	jmp LB_55597
LB_55596:
	bts r12,1
LB_55597:
LB_55598:
	cmp r15,0
	jz LB_55599
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55598
LB_55599:
; » _^ ..
	mov rax,16
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167\194\167+s8 @..."
	mov rsi,0x_20_38_73_2b_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_40
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+3],sil
	add rdi,12
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_55535
 ; {>  %_55534~1':(_lst)◂({ _stg _p55417 }) %_55535~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_55600
	mov rdi,r14
	call dlt
LB_55600:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_55592:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_55601
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂{ 1' 2' }
; 0' ⊢ °2◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_55602
	bt QWORD [rax],0
	jc LB_55603
	btr r12,3
	jmp LB_55604
LB_55603:
	bts r12,3
LB_55604:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55602:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_55607
	btr r12,4
	jmp LB_55608
LB_55607:
	bts r12,4
LB_55608:
	mov r14,r10
	bt r12,4
	jc LB_55605
	btr r12,1
	jmp LB_55606
LB_55605:
	bts r12,1
LB_55606:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_55611
	btr r12,4
	jmp LB_55612
LB_55611:
	bts r12,4
LB_55612:
	mov r8,r10
	bt r12,4
	jc LB_55609
	btr r12,2
	jmp LB_55610
LB_55609:
	bts r12,2
LB_55610:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_55613:
	cmp r15,0
	jz LB_55614
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55613
LB_55614:
; » _^ ..
	mov rax,7
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_55539
 ; {>  %_55539~0':_stg %_55537~2':_p55415 %_55538~1':_stg }
; 	∎ 0'
	bt r12,2
	jc LB_55615
	mov rdi,r8
	call dlt
LB_55615:
	bt r12,1
	jc LB_55616
	mov rdi,r14
	call dlt
LB_55616:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_55601:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz MTC_LB_55617
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °3◂1'
; 0' ⊢ °3◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_55618
	bt QWORD [rax],0
	jc LB_55619
	btr r12,2
	jmp LB_55620
LB_55619:
	bts r12,2
LB_55620:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55618:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_55621
	btr r12,1
	jmp LB_55622
LB_55621:
	bts r12,1
LB_55622:
LB_55623:
	cmp r15,0
	jz LB_55624
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55623
LB_55624:
; » _^ ..
	mov rax,11
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\167 @..."
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_40
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_55541
 ; {>  %_55541~0':_stg %_55540~1':(_lst)◂({ _stg _p55429 _p55432 }) }
; 	∎ 0'
	bt r12,1
	jc LB_55625
	mov rdi,r14
	call dlt
LB_55625:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_55617:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz MTC_LB_55626
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °4◂{ 1' 2' }
; 0' ⊢ °4◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_55627
	bt QWORD [rax],0
	jc LB_55628
	btr r12,3
	jmp LB_55629
LB_55628:
	bts r12,3
LB_55629:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55627:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_55632
	btr r12,4
	jmp LB_55633
LB_55632:
	bts r12,4
LB_55633:
	mov r14,r10
	bt r12,4
	jc LB_55630
	btr r12,1
	jmp LB_55631
LB_55630:
	bts r12,1
LB_55631:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_55636
	btr r12,4
	jmp LB_55637
LB_55636:
	bts r12,4
LB_55637:
	mov r8,r10
	bt r12,4
	jc LB_55634
	btr r12,2
	jmp LB_55635
LB_55634:
	bts r12,2
LB_55635:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_55638:
	cmp r15,0
	jz LB_55639
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55638
LB_55639:
; » _^ ..
	mov rax,7
	mov rdi,0
	mov rsi,0
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\182 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_55545
 ; {>  %_55545~0':_stg %_55543~2':_p55416 %_55544~1':_stg }
; 	∎ 0'
	bt r12,2
	jc LB_55640
	mov rdi,r8
	call dlt
LB_55640:
	bt r12,1
	jc LB_55641
	mov rdi,r14
	call dlt
LB_55641:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_55626:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,5
	jnz MTC_LB_55642
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °5◂1'
; 0' ⊢ °5◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,5
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_55643
	bt QWORD [rax],0
	jc LB_55644
	btr r12,2
	jmp LB_55645
LB_55644:
	bts r12,2
LB_55645:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55643:
	mov r8,rax
	mov r14,r8
	bt r12,2
	jc LB_55646
	btr r12,1
	jmp LB_55647
LB_55646:
	bts r12,1
LB_55647:
LB_55648:
	cmp r15,0
	jz LB_55649
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55648
LB_55649:
; » _^ ..
	mov rax,11
	mov rdi,0
	mov rsi,0
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "\194\182 @..."
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_b6
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_40
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; //
	mov r13,rax
	btr r12,0
; ∎ %_55547
 ; {>  %_55546~1':(_lst)◂({ _stg _p55416 }) %_55547~0':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_55650
	mov rdi,r14
	call dlt
LB_55650:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_55642:
NS_E_55520:
; 	|» 0'
NS_E_RDI_55520:
MTC_LB_55651:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_55652
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_55653
	bt QWORD [rax],0
	jc LB_55654
	btr r12,1
	jmp LB_55655
LB_55654:
	bts r12,1
LB_55655:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55653:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_55656:
	cmp r15,0
	jz LB_55657
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55656
LB_55657:
; 	» "" _ ⊢ 0' : %_55512
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_55512
 ; {>  %_55512~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_55652:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_55658
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r13
	bt QWORD [rax],17
	jnc LB_55659
	bt QWORD [rax],0
	jc LB_55660
	btr r12,3
	jmp LB_55661
LB_55660:
	bts r12,3
LB_55661:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_55659:
	mov r9,rax
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_55664
	btr r12,4
	jmp LB_55665
LB_55664:
	bts r12,4
LB_55665:
	mov r14,r10
	bt r12,4
	jc LB_55662
	btr r12,1
	jmp LB_55663
LB_55662:
	bts r12,1
LB_55663:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_55668
	btr r12,4
	jmp LB_55669
LB_55668:
	bts r12,4
LB_55669:
	mov r8,r10
	bt r12,4
	jc LB_55666
	btr r12,2
	jmp LB_55667
LB_55666:
	bts r12,2
LB_55667:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_55670:
	cmp r15,0
	jz LB_55671
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_55670
LB_55671:
; _f55548 %_55513 ⊢ %_55515 : %_55515
 ; {>  %_55514~2':(_lst)◂(_p55413) %_55513~1':_p55413 }
; _f55548 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_55674
	btr r12,0
	jmp LB_55675
LB_55674:
	bts r12,0
LB_55675:
	call NS_E_55548
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_55672
	btr r12,2
	jmp LB_55673
LB_55672:
	bts r12,2
LB_55673:
	add rsp,16
; _f55520 %_55514 ⊢ %_55516 : %_55516
 ; {>  %_55514~2':(_lst)◂(_p55413) %_55515~0':_stg }
; _f55520 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_55678
	btr r12,0
	jmp LB_55679
LB_55678:
	bts r12,0
LB_55679:
	call NS_E_55520
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_55680
	btr r12,1
	jmp LB_55681
LB_55680:
	bts r12,1
LB_55681:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_55676
	btr r12,0
	jmp LB_55677
LB_55676:
	bts r12,0
LB_55677:
	add rsp,16
; » _^ ..
	mov rax,0
	mov rdi,0
	mov rsi,0
	mov rdi,r13
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,r14
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*1],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*1]
	cld
	rep movsb
	pop rcx
; //
	mov r8,rax
	btr r12,2
; ∎ %_55519
 ; {>  %_55518~1':_stg %_55517~0':_stg %_55519~2':_stg }
; 	∎ 2'
	bt r12,1
	jc LB_55682
	mov rdi,r14
	call dlt
LB_55682:
	bt r12,0
	jc LB_55683
	mov rdi,r13
	call dlt
LB_55683:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_55684
	btr r12,0
	jmp LB_55685
LB_55684:
	bts r12,0
LB_55685:
	ret
MTC_LB_55658:
NS_E_55689:
NS_E_RDI_55689:
NS_E_55689_ETR_TBL:
NS_E_55689_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_55793
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_55793
	jmp LB_55794
LB_55793:
	jmp LB_55785
LB_55794:
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
	jc LB_55786
	btr r12,0
	jmp LB_55787
LB_55786:
	bts r12,0
LB_55787:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_55782
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_55693 : %_55693
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_55693
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_55693 ⊢ %_55694 : %_55694
 ; {>  %_55693~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55694
 ; {>  %_55694~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55780
	btr r12,3
	jmp LB_55781
LB_55780:
	bts r12,3
LB_55781:
	mov r8,0
	bts r12,2
	ret
LB_55782:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55784
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55783
LB_55784:
	add rsp,8
	ret
LB_55785:
	add rsp,16
	pop r14
LB_55783:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_54729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55809
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55801
LB_55809:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_55689_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55814
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55815
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55815:
	jmp LB_55801
LB_55814:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_55804
	btr r12,1
	jmp LB_55805
LB_55804:
	bts r12,1
LB_55805:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55802
	btr r12,0
	jmp LB_55803
LB_55802:
	bts r12,0
LB_55803:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_55798
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f44 %_55696 ⊢ %_55697 : %_55697
 ; {>  %_55695~0':_r64 %_55696~1':_r64 }
	add r14,1
; _some %_55697 ⊢ %_55698 : %_55698
 ; {>  %_55695~0':_r64 %_55697~1':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_55698
 ; {>  %_55698~°0◂1':(_opn)◂(_r64) %_55695~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_55795
	mov rdi,r13
	call dlt
LB_55795:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_55796
	btr r12,3
	jmp LB_55797
LB_55796:
	bts r12,3
LB_55797:
	mov r8,0
	bts r12,2
	ret
LB_55798:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55800
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55799
LB_55800:
	add rsp,8
	ret
LB_55801:
	add rsp,32
	pop r14
LB_55799:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55690:
NS_E_RDI_55690:
NS_E_55690_ETR_TBL:
NS_E_55690_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_55832
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_55832
	jmp LB_55833
LB_55832:
	jmp LB_55822
LB_55833:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_55690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55837
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55838
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55838:
	jmp LB_55822
LB_55837:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_55825
	btr r12,1
	jmp LB_55826
LB_55825:
	bts r12,1
LB_55826:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55823
	btr r12,0
	jmp LB_55824
LB_55823:
	bts r12,0
LB_55824:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_55819
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_55840
	btr r12,2
	jmp LB_55841
LB_55840:
	bts r12,2
LB_55841:
	mov r13,r14
	bt r12,1
	jc LB_55842
	btr r12,0
	jmp LB_55843
LB_55842:
	bts r12,0
LB_55843:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f44 %_55699 ⊢ %_55700 : %_55700
 ; {>  %_55699~0':_r64 }
	add r13,1
; _some %_55700 ⊢ %_55701 : %_55701
 ; {>  %_55700~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55701
 ; {>  %_55701~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55817
	btr r12,3
	jmp LB_55818
LB_55817:
	bts r12,3
LB_55818:
	mov r8,0
	bts r12,2
	ret
LB_55819:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55821
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55820
LB_55821:
	add rsp,8
	ret
LB_55822:
	add rsp,32
	pop r14
LB_55820:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_55859
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_55859
	jmp LB_55860
LB_55859:
	jmp LB_55849
LB_55860:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_55690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55864
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55865
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55865:
	jmp LB_55849
LB_55864:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_55852
	btr r12,1
	jmp LB_55853
LB_55852:
	bts r12,1
LB_55853:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55850
	btr r12,0
	jmp LB_55851
LB_55850:
	bts r12,0
LB_55851:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_55846
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_55867
	btr r12,2
	jmp LB_55868
LB_55867:
	bts r12,2
LB_55868:
	mov r13,r14
	bt r12,1
	jc LB_55869
	btr r12,0
	jmp LB_55870
LB_55869:
	bts r12,0
LB_55870:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f44 %_55702 ⊢ %_55703 : %_55703
 ; {>  %_55702~0':_r64 }
	add r13,1
; _some %_55703 ⊢ %_55704 : %_55704
 ; {>  %_55703~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55704
 ; {>  %_55704~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55844
	btr r12,3
	jmp LB_55845
LB_55844:
	bts r12,3
LB_55845:
	mov r8,0
	bts r12,2
	ret
LB_55846:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55848
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55847
LB_55848:
	add rsp,8
	ret
LB_55849:
	add rsp,32
	pop r14
LB_55847:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_55873
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_55705 : %_55705
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_55705
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_55705 ⊢ %_55706 : %_55706
 ; {>  %_55705~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55706
 ; {>  %_55706~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_55871
	btr r12,3
	jmp LB_55872
LB_55871:
	bts r12,3
LB_55872:
	mov r8,0
	bts r12,2
	ret
LB_55873:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55875
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55874
LB_55875:
	add rsp,8
	ret
LB_55876:
	add rsp,0
	pop r14
LB_55874:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55691:
NS_E_RDI_55691:
NS_E_55691_ETR_TBL:
NS_E_55691_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_55690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55956
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55903
LB_55956:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_55964
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_55964
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_55964
	jmp LB_55965
LB_55964:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55962
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55962:
	jmp LB_55903
LB_55965:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_55690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55920
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_55921
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_55921:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55922
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55922:
	jmp LB_55904
LB_55920:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_55932
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_55932
	jmp LB_55933
LB_55932:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_55928
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_55928:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_55929
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_55929:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55930
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55930:
	jmp LB_55904
LB_55933:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_55692_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55937
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_55938
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_55938:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_55939
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_55939:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_55940
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_55940:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55941
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55941:
	jmp LB_55904
LB_55937:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_55691_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_55946
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_55947
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_55947:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_55948
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_55948:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_55949
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_55949:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_55950
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_55950:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_55951
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_55951:
	jmp LB_55904
LB_55946:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_55915
	btr r12,5
	jmp LB_55916
LB_55915:
	bts r12,5
LB_55916:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_55913
	btr r12,4
	jmp LB_55914
LB_55913:
	bts r12,4
LB_55914:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_55911
	btr r12,3
	jmp LB_55912
LB_55911:
	bts r12,3
LB_55912:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_55909
	btr r12,2
	jmp LB_55910
LB_55909:
	bts r12,2
LB_55910:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_55907
	btr r12,1
	jmp LB_55908
LB_55907:
	bts r12,1
LB_55908:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_55905
	btr r12,0
	jmp LB_55906
LB_55905:
	bts r12,0
LB_55906:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_55900
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_55966
	btr r12,6
	jmp LB_55967
LB_55966:
	bts r12,6
LB_55967:
	mov r8,r10
	bt r12,4
	jc LB_55968
	btr r12,2
	jmp LB_55969
LB_55968:
	bts r12,2
LB_55969:
	mov rdx,r14
	bt r12,1
	jc LB_55970
	btr r12,7
	jmp LB_55971
LB_55970:
	bts r12,7
LB_55971:
	mov r14,rcx
	bt r12,6
	jc LB_55972
	btr r12,1
	jmp LB_55973
LB_55972:
	bts r12,1
LB_55973:
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_55976
	btr r12,6
	jmp LB_55977
LB_55976:
	bts r12,6
LB_55977:
	mov r9,rcx
	bt r12,6
	jc LB_55974
	btr r12,3
	jmp LB_55975
LB_55974:
	bts r12,3
LB_55975:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_55980
	btr r12,6
	jmp LB_55981
LB_55980:
	bts r12,6
LB_55981:
	mov r10,rcx
	bt r12,6
	jc LB_55978
	btr r12,4
	jmp LB_55979
LB_55978:
	bts r12,4
LB_55979:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_55712 : %_55712
 ; {>  %_55708~1':_r64 %_55710~3':_r64 %_55711~4':(_lst)◂(_p55686) %_55709~2':_r64 %_55707~0':_r64 }
; 	» 0xr3 _ ⊢ 5' : %_55712
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f39 { %_55712 %_55707 } ⊢ { %_55713 %_55714 } : { %_55713 %_55714 }
 ; {>  %_55712~5':_r64 %_55708~1':_r64 %_55710~3':_r64 %_55711~4':(_lst)◂(_p55686) %_55709~2':_r64 %_55707~0':_r64 }
	add r11,r13
; _f39 { %_55713 %_55708 } ⊢ { %_55715 %_55716 } : { %_55715 %_55716 }
 ; {>  %_55713~5':_r64 %_55708~1':_r64 %_55710~3':_r64 %_55714~0':_r64 %_55711~4':(_lst)◂(_p55686) %_55709~2':_r64 }
	add r11,r14
; _f39 { %_55715 %_55709 } ⊢ { %_55717 %_55718 } : { %_55717 %_55718 }
 ; {>  %_55715~5':_r64 %_55710~3':_r64 %_55714~0':_r64 %_55711~4':(_lst)◂(_p55686) %_55709~2':_r64 %_55716~1':_r64 }
	add r11,r8
; _f55687 %_55717 ⊢ %_55719 : %_55719
 ; {>  %_55718~2':_r64 %_55710~3':_r64 %_55714~0':_r64 %_55711~4':(_lst)◂(_p55686) %_55717~5':_r64 %_55716~1':_r64 }
; _f55687 5' ⊢ °0◂5'
; _cns { %_55719 %_55711 } ⊢ %_55720 : %_55720
 ; {>  %_55719~°0◂5':_p55686 %_55718~2':_r64 %_55710~3':_r64 %_55714~0':_r64 %_55711~4':(_lst)◂(_p55686) %_55716~1':_r64 }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_55710 %_55720 } ⊢ %_55721 : %_55721
 ; {>  %_55718~2':_r64 %_55710~3':_r64 %_55720~°0◂{ °0◂5' 4' }:(_lst)◂(_p55686) %_55714~0':_r64 %_55716~1':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_55721
 ; {>  %_55721~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p55686) }) %_55718~2':_r64 %_55714~0':_r64 %_55716~1':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,2
	jc LB_55877
	mov rdi,r8
	call dlt
LB_55877:
	bt r12,0
	jc LB_55878
	mov rdi,r13
	call dlt
LB_55878:
	bt r12,1
	jc LB_55879
	mov rdi,r14
	call dlt
LB_55879:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_55880
	btr r12,0
	jmp LB_55881
LB_55880:
	bts r12,0
LB_55881:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_55884
	btr r12,1
	jmp LB_55885
LB_55884:
	bts r12,1
LB_55885:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_55882
	btr QWORD [rdi],0
	jmp LB_55883
LB_55882:
	bts QWORD [rdi],0
LB_55883:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_55894
	btr r12,0
	jmp LB_55895
LB_55894:
	bts r12,0
LB_55895:
	mov rsi,1
	bt r12,0
	jc LB_55892
	mov rsi,0
	bt r13,0
	jc LB_55892
	jmp LB_55893
LB_55892:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_55893:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_55890
	btr QWORD [rdi],0
	jmp LB_55891
LB_55890:
	bts QWORD [rdi],0
LB_55891:
	mov r13,r10
	bt r12,4
	jc LB_55898
	btr r12,0
	jmp LB_55899
LB_55898:
	bts r12,0
LB_55899:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_55896
	btr QWORD [rdi],1
	jmp LB_55897
LB_55896:
	bts QWORD [rdi],1
LB_55897:
	mov rsi,1
	bt r12,1
	jc LB_55888
	mov rsi,0
	bt r14,0
	jc LB_55888
	jmp LB_55889
LB_55888:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_55889:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_55886
	btr QWORD [rdi],1
	jmp LB_55887
LB_55886:
	bts QWORD [rdi],1
LB_55887:
	mov r8,0
	bts r12,2
	ret
LB_55900:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_55902
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_55901
LB_55902:
	add rsp,8
	ret
LB_55904:
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
LB_55903:
	add rsp,96
	pop r14
LB_55901:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_55690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56035
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56007
LB_56035:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_56043
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_56043
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_56043
	jmp LB_56044
LB_56043:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56041
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56041:
	jmp LB_56007
LB_56044:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_55689_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56020
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56021
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56021:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56022
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56022:
	jmp LB_56008
LB_56020:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_55691_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56027
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56028
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56028:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56029
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56029:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56030
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56030:
	jmp LB_56008
LB_56027:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_56015
	btr r12,3
	jmp LB_56016
LB_56015:
	bts r12,3
LB_56016:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_56013
	btr r12,2
	jmp LB_56014
LB_56013:
	bts r12,2
LB_56014:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56011
	btr r12,1
	jmp LB_56012
LB_56011:
	bts r12,1
LB_56012:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56009
	btr r12,0
	jmp LB_56010
LB_56009:
	bts r12,0
LB_56010:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_56004
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_56045
	btr r12,4
	jmp LB_56046
LB_56045:
	bts r12,4
LB_56046:
	mov r14,r8
	bt r12,2
	jc LB_56047
	btr r12,1
	jmp LB_56048
LB_56047:
	bts r12,1
LB_56048:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_56049
	btr r12,4
	jmp LB_56050
LB_56049:
	bts r12,4
LB_56050:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_56053
	btr r12,5
	jmp LB_56054
LB_56053:
	bts r12,5
LB_56054:
	mov r8,r11
	bt r12,5
	jc LB_56051
	btr r12,2
	jmp LB_56052
LB_56051:
	bts r12,2
LB_56052:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_56057
	btr r12,5
	jmp LB_56058
LB_56057:
	bts r12,5
LB_56058:
	mov r9,r11
	bt r12,5
	jc LB_56055
	btr r12,3
	jmp LB_56056
LB_56055:
	bts r12,3
LB_56056:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_55726 : %_55726
 ; {>  %_55725~3':(_lst)◂(_p55686) %_55722~0':_r64 %_55723~1':_r64 %_55724~2':_r64 }
; 	» 0xr2 _ ⊢ 4' : %_55726
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f39 { %_55726 %_55722 } ⊢ { %_55727 %_55728 } : { %_55727 %_55728 }
 ; {>  %_55725~3':(_lst)◂(_p55686) %_55722~0':_r64 %_55723~1':_r64 %_55726~4':_r64 %_55724~2':_r64 }
	add r10,r13
; _f39 { %_55727 %_55723 } ⊢ { %_55729 %_55730 } : { %_55729 %_55730 }
 ; {>  %_55728~0':_r64 %_55725~3':(_lst)◂(_p55686) %_55723~1':_r64 %_55727~4':_r64 %_55724~2':_r64 }
	add r10,r14
; _f55687 %_55729 ⊢ %_55731 : %_55731
 ; {>  %_55730~1':_r64 %_55728~0':_r64 %_55725~3':(_lst)◂(_p55686) %_55729~4':_r64 %_55724~2':_r64 }
; _f55687 4' ⊢ °0◂4'
; _cns { %_55731 %_55725 } ⊢ %_55732 : %_55732
 ; {>  %_55730~1':_r64 %_55728~0':_r64 %_55725~3':(_lst)◂(_p55686) %_55731~°0◂4':_p55686 %_55724~2':_r64 }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_55724 %_55732 } ⊢ %_55733 : %_55733
 ; {>  %_55730~1':_r64 %_55728~0':_r64 %_55732~°0◂{ °0◂4' 3' }:(_lst)◂(_p55686) %_55724~2':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_55733
 ; {>  %_55730~1':_r64 %_55728~0':_r64 %_55733~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p55686) }) }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,1
	jc LB_55982
	mov rdi,r14
	call dlt
LB_55982:
	bt r12,0
	jc LB_55983
	mov rdi,r13
	call dlt
LB_55983:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_55984
	btr r12,0
	jmp LB_55985
LB_55984:
	bts r12,0
LB_55985:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_55988
	btr r12,1
	jmp LB_55989
LB_55988:
	bts r12,1
LB_55989:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_55986
	btr QWORD [rdi],0
	jmp LB_55987
LB_55986:
	bts QWORD [rdi],0
LB_55987:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_55998
	btr r12,2
	jmp LB_55999
LB_55998:
	bts r12,2
LB_55999:
	mov rsi,1
	bt r12,2
	jc LB_55996
	mov rsi,0
	bt r8,0
	jc LB_55996
	jmp LB_55997
LB_55996:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_55997:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_55994
	btr QWORD [rdi],0
	jmp LB_55995
LB_55994:
	bts QWORD [rdi],0
LB_55995:
	mov r8,r13
	bt r12,0
	jc LB_56002
	btr r12,2
	jmp LB_56003
LB_56002:
	bts r12,2
LB_56003:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_56000
	btr QWORD [rdi],1
	jmp LB_56001
LB_56000:
	bts QWORD [rdi],1
LB_56001:
	mov rsi,1
	bt r12,1
	jc LB_55992
	mov rsi,0
	bt r14,0
	jc LB_55992
	jmp LB_55993
LB_55992:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_55993:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_55990
	btr QWORD [rdi],1
	jmp LB_55991
LB_55990:
	bts QWORD [rdi],1
LB_55991:
	mov r8,0
	bts r12,2
	ret
LB_56004:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56006
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56005
LB_56006:
	add rsp,8
	ret
LB_56008:
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
LB_56007:
	add rsp,64
	pop r14
LB_56005:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_55689_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56130
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56122
LB_56130:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_55691_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56135
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56136
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56136:
	jmp LB_56122
LB_56135:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56125
	btr r12,1
	jmp LB_56126
LB_56125:
	bts r12,1
LB_56126:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56123
	btr r12,0
	jmp LB_56124
LB_56123:
	bts r12,0
LB_56124:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_56119
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_56138
	btr r12,3
	jmp LB_56139
LB_56138:
	bts r12,3
LB_56139:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_56142
	btr r12,4
	jmp LB_56143
LB_56142:
	bts r12,4
LB_56143:
	mov r14,r10
	bt r12,4
	jc LB_56140
	btr r12,1
	jmp LB_56141
LB_56140:
	bts r12,1
LB_56141:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_56146
	btr r12,4
	jmp LB_56147
LB_56146:
	bts r12,4
LB_56147:
	mov r8,r10
	bt r12,4
	jc LB_56144
	btr r12,2
	jmp LB_56145
LB_56144:
	bts r12,2
LB_56145:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f39 { %_55735 %_55734 } ⊢ { %_55737 %_55738 } : { %_55737 %_55738 }
 ; {>  %_55735~1':_r64 %_55736~2':(_lst)◂(_p55686) %_55734~0':_r64 }
	add r14,r13
MTC_LB_56059:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_56060
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
	jnc LB_56061
	bt QWORD [rax],0
	jc LB_56062
	btr r12,5
	jmp LB_56063
LB_56062:
	bts r12,5
LB_56063:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_56061:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_56066
	btr r12,6
	jmp LB_56067
LB_56066:
	bts r12,6
LB_56067:
	mov r9,rcx
	bt r12,6
	jc LB_56064
	btr r12,3
	jmp LB_56065
LB_56064:
	bts r12,3
LB_56065:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_56070
	btr r12,6
	jmp LB_56071
LB_56070:
	bts r12,6
LB_56071:
	mov r10,rcx
	bt r12,6
	jc LB_56068
	btr r12,4
	jmp LB_56069
LB_56068:
	bts r12,4
LB_56069:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_56060
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
	jnc LB_56072
	bt QWORD [rax],0
	jc LB_56073
	btr r12,6
	jmp LB_56074
LB_56073:
	bts r12,6
LB_56074:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_56072:
	mov rcx,rax
	mov r11,rcx
	bt r12,6
	jc LB_56075
	btr r12,5
	jmp LB_56076
LB_56075:
	bts r12,5
LB_56076:
LB_56077:
	cmp r15,0
	jz LB_56078
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56077
LB_56078:
; _f39 { %_55741 %_55738 } ⊢ { %_55742 %_55743 } : { %_55742 %_55743 }
 ; {>  %_55741~5':_r64 %_55738~0':_r64 %_55740~4':(_lst)◂(_p55686) %_55737~1':_r64 }
	add r11,r13
; _f55688 %_55742 ⊢ %_55744 : %_55744
 ; {>  %_55742~5':_r64 %_55740~4':(_lst)◂(_p55686) %_55737~1':_r64 %_55743~0':_r64 }
; _f55688 5' ⊢ °1◂5'
; _cns { %_55744 %_55740 } ⊢ %_55745 : %_55745
 ; {>  %_55744~°1◂5':_p55686 %_55740~4':(_lst)◂(_p55686) %_55737~1':_r64 %_55743~0':_r64 }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_55737 %_55745 } ⊢ %_55746 : %_55746
 ; {>  %_55745~°0◂{ °1◂5' 4' }:(_lst)◂(_p55686) %_55737~1':_r64 %_55743~0':_r64 }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_55746
 ; {>  %_55746~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p55686) }) %_55743~0':_r64 }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_56079
	mov rdi,r13
	call dlt
LB_56079:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_56082
	btr r12,0
	jmp LB_56083
LB_56082:
	bts r12,0
LB_56083:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_56080
	btr QWORD [rdi],0
	jmp LB_56081
LB_56080:
	bts QWORD [rdi],0
LB_56081:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_56092
	btr r12,1
	jmp LB_56093
LB_56092:
	bts r12,1
LB_56093:
	mov rsi,1
	bt r12,1
	jc LB_56090
	mov rsi,0
	bt r14,0
	jc LB_56090
	jmp LB_56091
LB_56090:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_56091:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_56088
	btr QWORD [rdi],0
	jmp LB_56089
LB_56088:
	bts QWORD [rdi],0
LB_56089:
	mov r14,r10
	bt r12,4
	jc LB_56096
	btr r12,1
	jmp LB_56097
LB_56096:
	bts r12,1
LB_56097:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_56094
	btr QWORD [rdi],1
	jmp LB_56095
LB_56094:
	bts QWORD [rdi],1
LB_56095:
	mov rsi,1
	bt r12,0
	jc LB_56086
	mov rsi,0
	bt r13,0
	jc LB_56086
	jmp LB_56087
LB_56086:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_56087:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_56084
	btr QWORD [rdi],1
	jmp LB_56085
LB_56084:
	bts QWORD [rdi],1
LB_56085:
	mov r8,0
	bts r12,2
	ret
MTC_LB_56060:
	mov r15,0
LB_56099:
	cmp r15,0
	jz LB_56100
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56099
LB_56100:
; _f55688 %_55738 ⊢ %_55747 : %_55747
 ; {>  %_55736~2':(_lst)◂(_p55686) %_55738~0':_r64 %_55737~1':_r64 }
; _f55688 0' ⊢ °1◂0'
; _cns { %_55747 %_55736 } ⊢ %_55748 : %_55748
 ; {>  %_55736~2':(_lst)◂(_p55686) %_55747~°1◂0':_p55686 %_55737~1':_r64 }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_55737 %_55748 } ⊢ %_55749 : %_55749
 ; {>  %_55748~°0◂{ °1◂0' 2' }:(_lst)◂(_p55686) %_55737~1':_r64 }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_55749
 ; {>  %_55749~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p55686) }) }
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
	jc LB_56103
	btr r12,4
	jmp LB_56104
LB_56103:
	bts r12,4
LB_56104:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_56101
	btr QWORD [rdi],0
	jmp LB_56102
LB_56101:
	bts QWORD [rdi],0
LB_56102:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_56113
	btr r12,1
	jmp LB_56114
LB_56113:
	bts r12,1
LB_56114:
	mov rsi,1
	bt r12,1
	jc LB_56111
	mov rsi,0
	bt r14,0
	jc LB_56111
	jmp LB_56112
LB_56111:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_56112:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_56109
	btr QWORD [rdi],0
	jmp LB_56110
LB_56109:
	bts QWORD [rdi],0
LB_56110:
	mov r14,r8
	bt r12,2
	jc LB_56117
	btr r12,1
	jmp LB_56118
LB_56117:
	bts r12,1
LB_56118:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_56115
	btr QWORD [rdi],1
	jmp LB_56116
LB_56115:
	bts QWORD [rdi],1
LB_56116:
	mov rsi,1
	bt r12,4
	jc LB_56107
	mov rsi,0
	bt r10,0
	jc LB_56107
	jmp LB_56108
LB_56107:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_56108:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_56105
	btr QWORD [rdi],1
	jmp LB_56106
LB_56105:
	bts QWORD [rdi],1
LB_56106:
	mov r8,0
	bts r12,2
	ret
MTC_LB_56098:
LB_56119:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56121
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56120
LB_56121:
	add rsp,8
	ret
LB_56122:
	add rsp,32
	pop r14
LB_56120:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_56156
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_55750 : %_55750
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_55751 : %_55751
 ; {>  %_55750~°1◂{  }:(_lst)◂(t18586'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_55751
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_55751 %_55750 } ⊢ %_55752 : %_55752
 ; {>  %_55751~0':_r64 %_55750~°1◂{  }:(_lst)◂(t18586'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_55752
 ; {>  %_55752~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t18590'(0)) }) }
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
	jc LB_56150
	btr r12,1
	jmp LB_56151
LB_56150:
	bts r12,1
LB_56151:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_56148
	btr QWORD [rdi],0
	jmp LB_56149
LB_56148:
	bts QWORD [rdi],0
LB_56149:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_56154
	mov rsi,0
	bt r14,0
	jc LB_56154
	jmp LB_56155
LB_56154:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_56155:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_56152
	btr QWORD [rdi],1
	jmp LB_56153
LB_56152:
	bts QWORD [rdi],1
LB_56153:
	mov r8,0
	bts r12,2
	ret
LB_56156:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56158
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56157
LB_56158:
	add rsp,8
	ret
LB_56159:
	add rsp,0
	pop r14
LB_56157:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_55692:
NS_E_RDI_55692:
NS_E_55692_ETR_TBL:
NS_E_55692_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_55690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56197
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56167
LB_56197:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_56205
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_56205
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_56205
	jmp LB_56206
LB_56205:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56203
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56203:
	jmp LB_56167
LB_56206:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_55690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56180
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56181
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56181:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56182
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56182:
	jmp LB_56168
LB_56180:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_56192
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_56192
	jmp LB_56193
LB_56192:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56188
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56188:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56189
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56189:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56190
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56190:
	jmp LB_56168
LB_56193:
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
	jc LB_56175
	btr r12,3
	jmp LB_56176
LB_56175:
	bts r12,3
LB_56176:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_56173
	btr r12,2
	jmp LB_56174
LB_56173:
	bts r12,2
LB_56174:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56171
	btr r12,1
	jmp LB_56172
LB_56171:
	bts r12,1
LB_56172:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56169
	btr r12,0
	jmp LB_56170
LB_56169:
	bts r12,0
LB_56170:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_56164
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_56207
	btr r12,4
	jmp LB_56208
LB_56207:
	bts r12,4
LB_56208:
	mov r14,r8
	bt r12,2
	jc LB_56209
	btr r12,1
	jmp LB_56210
LB_56209:
	bts r12,1
LB_56210:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_55755 : %_55755
 ; {>  %_55753~0':_r64 %_55754~1':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_55755
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f39 { %_55755 %_55753 } ⊢ { %_55756 %_55757 } : { %_55756 %_55757 }
 ; {>  %_55755~2':_r64 %_55753~0':_r64 %_55754~1':_r64 }
	add r8,r13
; _f39 { %_55756 %_55754 } ⊢ { %_55758 %_55759 } : { %_55758 %_55759 }
 ; {>  %_55757~0':_r64 %_55756~2':_r64 %_55754~1':_r64 }
	add r8,r14
; _some %_55758 ⊢ %_55760 : %_55760
 ; {>  %_55759~1':_r64 %_55758~2':_r64 %_55757~0':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_55760
 ; {>  %_55759~1':_r64 %_55757~0':_r64 %_55760~°0◂2':(_opn)◂(_r64) }
; 	∎ °0◂2'
	bt r12,1
	jc LB_56160
	mov rdi,r14
	call dlt
LB_56160:
	bt r12,0
	jc LB_56161
	mov rdi,r13
	call dlt
LB_56161:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_56162
	btr r12,3
	jmp LB_56163
LB_56162:
	bts r12,3
LB_56163:
	mov r8,0
	bts r12,2
	ret
LB_56164:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56166
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56165
LB_56166:
	add rsp,8
	ret
LB_56168:
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
LB_56167:
	add rsp,64
	pop r14
LB_56165:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_55690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56273
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56220
LB_56273:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_56281
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_56281
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_56281
	jmp LB_56282
LB_56281:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56279
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56279:
	jmp LB_56220
LB_56282:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_55690_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56237
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56238
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56238:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56239
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56239:
	jmp LB_56221
LB_56237:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_56249
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_56249
	jmp LB_56250
LB_56249:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56245
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56245:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56246
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56246:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56247
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56247:
	jmp LB_56221
LB_56250:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_55692_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56254
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_56255
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_56255:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56256
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56256:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56257
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56257:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56258
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56258:
	jmp LB_56221
LB_56254:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_55692_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56263
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_56264
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_56264:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_56265
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_56265:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_56266
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_56266:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56267
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56267:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56268
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56268:
	jmp LB_56221
LB_56263:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_56232
	btr r12,5
	jmp LB_56233
LB_56232:
	bts r12,5
LB_56233:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_56230
	btr r12,4
	jmp LB_56231
LB_56230:
	bts r12,4
LB_56231:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_56228
	btr r12,3
	jmp LB_56229
LB_56228:
	bts r12,3
LB_56229:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_56226
	btr r12,2
	jmp LB_56227
LB_56226:
	bts r12,2
LB_56227:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56224
	btr r12,1
	jmp LB_56225
LB_56224:
	bts r12,1
LB_56225:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56222
	btr r12,0
	jmp LB_56223
LB_56222:
	bts r12,0
LB_56223:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_56217
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_56283
	btr r12,6
	jmp LB_56284
LB_56283:
	bts r12,6
LB_56284:
	mov r9,r11
	bt r12,5
	jc LB_56285
	btr r12,3
	jmp LB_56286
LB_56285:
	bts r12,3
LB_56286:
	mov r11,r8
	bt r12,2
	jc LB_56287
	btr r12,5
	jmp LB_56288
LB_56287:
	bts r12,5
LB_56288:
	mov r8,r10
	bt r12,4
	jc LB_56289
	btr r12,2
	jmp LB_56290
LB_56289:
	bts r12,2
LB_56290:
	mov r10,r14
	bt r12,1
	jc LB_56291
	btr r12,4
	jmp LB_56292
LB_56291:
	bts r12,4
LB_56292:
	mov r14,r11
	bt r12,5
	jc LB_56293
	btr r12,1
	jmp LB_56294
LB_56293:
	bts r12,1
LB_56294:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_55765 : %_55765
 ; {>  %_55763~2':_r64 %_55761~0':_r64 %_55762~1':_r64 %_55764~3':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_55765
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f39 { %_55765 %_55761 } ⊢ { %_55766 %_55767 } : { %_55766 %_55767 }
 ; {>  %_55765~4':_r64 %_55763~2':_r64 %_55761~0':_r64 %_55762~1':_r64 %_55764~3':_r64 }
	add r10,r13
; _f39 { %_55766 %_55762 } ⊢ { %_55768 %_55769 } : { %_55768 %_55769 }
 ; {>  %_55766~4':_r64 %_55763~2':_r64 %_55762~1':_r64 %_55767~0':_r64 %_55764~3':_r64 }
	add r10,r14
; _f39 { %_55768 %_55763 } ⊢ { %_55770 %_55771 } : { %_55770 %_55771 }
 ; {>  %_55763~2':_r64 %_55769~1':_r64 %_55767~0':_r64 %_55764~3':_r64 %_55768~4':_r64 }
	add r10,r8
; _f39 { %_55770 %_55764 } ⊢ { %_55772 %_55773 } : { %_55772 %_55773 }
 ; {>  %_55769~1':_r64 %_55767~0':_r64 %_55771~2':_r64 %_55764~3':_r64 %_55770~4':_r64 }
	add r10,r9
; _some %_55772 ⊢ %_55774 : %_55774
 ; {>  %_55769~1':_r64 %_55772~4':_r64 %_55773~3':_r64 %_55767~0':_r64 %_55771~2':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_55774
 ; {>  %_55769~1':_r64 %_55773~3':_r64 %_55767~0':_r64 %_55771~2':_r64 %_55774~°0◂4':(_opn)◂(_r64) }
; 	∎ °0◂4'
	bt r12,1
	jc LB_56211
	mov rdi,r14
	call dlt
LB_56211:
	bt r12,3
	jc LB_56212
	mov rdi,r9
	call dlt
LB_56212:
	bt r12,0
	jc LB_56213
	mov rdi,r13
	call dlt
LB_56213:
	bt r12,2
	jc LB_56214
	mov rdi,r8
	call dlt
LB_56214:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_56215
	btr r12,3
	jmp LB_56216
LB_56215:
	bts r12,3
LB_56216:
	mov r8,0
	bts r12,2
	ret
LB_56217:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56219
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56218
LB_56219:
	add rsp,8
	ret
LB_56221:
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
LB_56220:
	add rsp,96
	pop r14
LB_56218:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_55689_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56309
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56301
LB_56309:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_55692_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56314
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56315
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56315:
	jmp LB_56301
LB_56314:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56304
	btr r12,1
	jmp LB_56305
LB_56304:
	bts r12,1
LB_56305:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56302
	btr r12,0
	jmp LB_56303
LB_56302:
	bts r12,0
LB_56303:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_56298
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f39 { %_55775 %_55776 } ⊢ { %_55777 %_55778 } : { %_55777 %_55778 }
 ; {>  %_55775~0':_r64 %_55776~1':_r64 }
	add r13,r14
; _some %_55777 ⊢ %_55779 : %_55779
 ; {>  %_55777~0':_r64 %_55778~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_55779
 ; {>  %_55779~°0◂0':(_opn)◂(_r64) %_55778~1':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_56295
	mov rdi,r14
	call dlt
LB_56295:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56296
	btr r12,3
	jmp LB_56297
LB_56296:
	bts r12,3
LB_56297:
	mov r8,0
	bts r12,2
	ret
LB_56298:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56300
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56299
LB_56300:
	add rsp,8
	ret
LB_56301:
	add rsp,32
	pop r14
LB_56299:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56339:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_56339:
MTC_LB_56340:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_56341
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
	jnc LB_56342
	bt QWORD [rax],0
	jc LB_56343
	btr r12,7
	jmp LB_56344
LB_56343:
	bts r12,7
LB_56344:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_56342:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_56347
	btr r12,8
	jmp LB_56348
LB_56347:
	bts r12,8
LB_56348:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_56345
	btr r12,5
	jmp LB_56346
LB_56345:
	bts r12,5
LB_56346:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_56351
	btr r12,8
	jmp LB_56352
LB_56351:
	bts r12,8
LB_56352:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_56349
	btr r12,6
	jmp LB_56350
LB_56349:
	bts r12,6
LB_56350:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_56353:
	cmp r15,0
	jz LB_56354
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56353
LB_56354:
MTC_LB_56355:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_56356
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
	jnc LB_56357
	bt QWORD [rax],0
	jc LB_56358
	btr r12,7
	jmp LB_56359
LB_56358:
	bts r12,7
LB_56359:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_56357:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_56360
	btr r12,4
	jmp LB_56361
LB_56360:
	bts r12,4
LB_56361:
LB_56362:
	cmp r15,0
	jz LB_56363
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56362
LB_56363:
; _f41 %_56324 ⊢ { %_56325 %_56326 } : { %_56325 %_56326 }
 ; {>  %_56324~4':_r64 %_56319~2':_stg %_56318~1':_r64 %_56317~0':_stg %_56323~6':(_lst)◂(_p55686) %_56320~3':_r64 }
	mov r11,r10
	bts r12,5
; _f23 { %_56326 %_56317 %_56318 %_56319 %_56320 } ⊢ { %_56327 %_56328 %_56329 %_56330 %_56331 } : { %_56327 %_56328 %_56329 %_56330 %_56331 }
 ; {>  %_56325~4':_r64 %_56319~2':_stg %_56318~1':_r64 %_56317~0':_stg %_56326~5':_r64 %_56323~6':(_lst)◂(_p55686) %_56320~3':_r64 }
; _f23 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_56368
	btr r12,4
	jmp LB_56369
LB_56368:
	bts r12,4
LB_56369:
	mov r9,r8
	bt r12,2
	jc LB_56370
	btr r12,3
	jmp LB_56371
LB_56370:
	bts r12,3
LB_56371:
	mov r8,r14
	bt r12,1
	jc LB_56372
	btr r12,2
	jmp LB_56373
LB_56372:
	bts r12,2
LB_56373:
	mov r14,r13
	bt r12,0
	jc LB_56374
	btr r12,1
	jmp LB_56375
LB_56374:
	bts r12,1
LB_56375:
	mov r13,r11
	bt r12,5
	jc LB_56376
	btr r12,0
	jmp LB_56377
LB_56376:
	bts r12,0
LB_56377:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_56378
	btr r12,5
	jmp LB_56379
LB_56378:
	bts r12,5
LB_56379:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_56366
	btr r12,6
	jmp LB_56367
LB_56366:
	bts r12,6
LB_56367:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_56364
	btr r12,4
	jmp LB_56365
LB_56364:
	bts r12,4
LB_56365:
	add rsp,24
; _f56339 { %_56328 %_56329 %_56330 %_56331 %_56323 } ⊢ { %_56332 %_56333 } : { %_56332 %_56333 }
 ; {>  %_56329~2':_r64 %_56325~4':_r64 %_56330~3':_stg %_56328~1':_stg %_56327~0':_r64 %_56323~6':(_lst)◂(_p55686) %_56331~5':_r64 }
; _f56339 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_56384
	btr r12,0
	jmp LB_56385
LB_56384:
	bts r12,0
LB_56385:
	mov r14,r8
	bt r12,2
	jc LB_56386
	btr r12,1
	jmp LB_56387
LB_56386:
	bts r12,1
LB_56387:
	mov r8,r9
	bt r12,3
	jc LB_56388
	btr r12,2
	jmp LB_56389
LB_56388:
	bts r12,2
LB_56389:
	mov r9,r11
	bt r12,5
	jc LB_56390
	btr r12,3
	jmp LB_56391
LB_56390:
	bts r12,3
LB_56391:
	mov r10,rcx
	bt r12,6
	jc LB_56392
	btr r12,4
	jmp LB_56393
LB_56392:
	bts r12,4
LB_56393:
	call NS_E_56339
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_56394
	btr r12,2
	jmp LB_56395
LB_56394:
	bts r12,2
LB_56395:
	mov r14,r13
	bt r12,0
	jc LB_56396
	btr r12,1
	jmp LB_56397
LB_56396:
	bts r12,1
LB_56397:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_56382
	btr r12,4
	jmp LB_56383
LB_56382:
	bts r12,4
LB_56383:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_56380
	btr r12,0
	jmp LB_56381
LB_56380:
	bts r12,0
LB_56381:
	add rsp,24
; ∎ { %_56332 %_56333 }
 ; {>  %_56325~4':_r64 %_56333~2':_stg %_56332~1':_stg %_56327~0':_r64 }
; 	∎ { 1' 2' }
	bt r12,4
	jc LB_56398
	mov rdi,r10
	call dlt
LB_56398:
	bt r12,0
	jc LB_56399
	mov rdi,r13
	call dlt
LB_56399:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_56400
	btr r12,0
	jmp LB_56401
LB_56400:
	bts r12,0
LB_56401:
	mov r14,r8
	bt r12,2
	jc LB_56402
	btr r12,1
	jmp LB_56403
LB_56402:
	bts r12,1
LB_56403:
	ret
MTC_LB_56356:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_56404
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
	jnc LB_56405
	bt QWORD [rax],0
	jc LB_56406
	btr r12,7
	jmp LB_56407
LB_56406:
	bts r12,7
LB_56407:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_56405:
	mov rdx,rax
	mov r10,rdx
	bt r12,7
	jc LB_56408
	btr r12,4
	jmp LB_56409
LB_56408:
	bts r12,4
LB_56409:
LB_56410:
	cmp r15,0
	jz LB_56411
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56410
LB_56411:
; _f39 { %_56318 %_56334 } ⊢ { %_56335 %_56336 } : { %_56335 %_56336 }
 ; {>  %_56319~2':_stg %_56334~4':_r64 %_56318~1':_r64 %_56317~0':_stg %_56323~6':(_lst)◂(_p55686) %_56320~3':_r64 }
	add r14,r10
; _f56339 { %_56317 %_56335 %_56319 %_56320 %_56323 } ⊢ { %_56337 %_56338 } : { %_56337 %_56338 }
 ; {>  %_56319~2':_stg %_56317~0':_stg %_56336~4':_r64 %_56335~1':_r64 %_56323~6':(_lst)◂(_p55686) %_56320~3':_r64 }
; _f56339 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_56414
	btr r12,4
	jmp LB_56415
LB_56414:
	bts r12,4
LB_56415:
	call NS_E_56339
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_56412
	btr r12,4
	jmp LB_56413
LB_56412:
	bts r12,4
LB_56413:
	add rsp,16
; ∎ { %_56337 %_56338 }
 ; {>  %_56337~0':_stg %_56336~4':_r64 %_56338~1':_stg }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_56416
	mov rdi,r10
	call dlt
LB_56416:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_56404:
MTC_LB_56341:
	mov r15,0
LB_56418:
	cmp r15,0
	jz LB_56419
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56418
LB_56419:
; ∎ { %_56317 %_56319 }
 ; {>  %_56321~4':(_lst)◂(_p55686) %_56319~2':_stg %_56318~1':_r64 %_56317~0':_stg %_56320~3':_r64 }
; 	∎ { 0' 2' }
	bt r12,4
	jc LB_56420
	mov rdi,r10
	call dlt
LB_56420:
	bt r12,1
	jc LB_56421
	mov rdi,r14
	call dlt
LB_56421:
	bt r12,3
	jc LB_56422
	mov rdi,r9
	call dlt
LB_56422:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_56423
	btr r12,1
	jmp LB_56424
LB_56423:
	bts r12,1
LB_56424:
	ret
MTC_LB_56417:
NS_E_56440:
; 	|» 0'
NS_E_RDI_56440:
; » 0xr0 |~ {  } ⊢ %_56426 : %_56426
 ; {>  %_56425~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_56426
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f55691 { %_56425 %_56426 } ⊢ { %_56427 %_56428 %_56429 } : { %_56427 %_56428 %_56429 }
 ; {>  %_56425~0':_stg %_56426~1':_r64 }
; _f55691 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_55691
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_56441
	btr r12,4
	jmp LB_56442
LB_56441:
	bts r12,4
LB_56442:
	mov r8,r9
	bt r12,3
	jc LB_56445
	btr r12,2
	jmp LB_56446
LB_56445:
	bts r12,2
LB_56446:
	mov rsi,1
	bt r12,2
	jc LB_56443
	mov rsi,0
	bt r8,0
	jc LB_56443
	jmp LB_56444
LB_56443:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_56444:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_56447:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_56448
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
	jnc LB_56449
	bt QWORD [rax],0
	jc LB_56450
	btr r12,5
	jmp LB_56451
LB_56450:
	bts r12,5
LB_56451:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_56449:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_56454
	btr r12,6
	jmp LB_56455
LB_56454:
	bts r12,6
LB_56455:
	mov r9,rcx
	bt r12,6
	jc LB_56452
	btr r12,3
	jmp LB_56453
LB_56452:
	bts r12,3
LB_56453:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_56458
	btr r12,6
	jmp LB_56459
LB_56458:
	bts r12,6
LB_56459:
	mov r10,rcx
	bt r12,6
	jc LB_56456
	btr r12,4
	jmp LB_56457
LB_56456:
	bts r12,4
LB_56457:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_56460:
	cmp r15,0
	jz LB_56461
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56460
LB_56461:
; _f19 %_56430 ⊢ { %_56432 %_56433 } : { %_56432 %_56433 }
 ; {>  %_56430~3':_r64 %_56428~1':_r64 %_56431~4':(_lst)◂(_p55686) %_56427~0':_stg }
; _f19 3' ⊢ { 2' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_56468
	btr r12,0
	jmp LB_56469
LB_56468:
	bts r12,0
LB_56469:
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_56470
	btr r12,2
	jmp LB_56471
LB_56470:
	bts r12,2
LB_56471:
	mov r9,r14
	bt r12,1
	jc LB_56472
	btr r12,3
	jmp LB_56473
LB_56472:
	bts r12,3
LB_56473:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_56466
	btr r12,4
	jmp LB_56467
LB_56466:
	bts r12,4
LB_56467:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_56464
	btr r12,1
	jmp LB_56465
LB_56464:
	bts r12,1
LB_56465:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_56462
	btr r12,0
	jmp LB_56463
LB_56462:
	bts r12,0
LB_56463:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_56434 : %_56434
 ; {>  %_56432~2':_r64 %_56433~3':_stg %_56428~1':_r64 %_56431~4':(_lst)◂(_p55686) %_56427~0':_stg }
; 	» 0xr0 _ ⊢ 5' : %_56434
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_56435 : %_56435
 ; {>  %_56434~5':_r64 %_56432~2':_r64 %_56433~3':_stg %_56428~1':_r64 %_56431~4':(_lst)◂(_p55686) %_56427~0':_stg }
; 	» 0xr0 _ ⊢ 6' : %_56435
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f56339 { %_56427 %_56434 %_56433 %_56435 %_56431 } ⊢ { %_56436 %_56437 } : { %_56436 %_56437 }
 ; {>  %_56434~5':_r64 %_56432~2':_r64 %_56435~6':_r64 %_56433~3':_stg %_56428~1':_r64 %_56431~4':(_lst)◂(_p55686) %_56427~0':_stg }
; _f56339 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_56478
	btr r12,1
	jmp LB_56479
LB_56478:
	bts r12,1
LB_56479:
	mov r8,r9
	bt r12,3
	jc LB_56480
	btr r12,2
	jmp LB_56481
LB_56480:
	bts r12,2
LB_56481:
	mov r9,rcx
	bt r12,6
	jc LB_56482
	btr r12,3
	jmp LB_56483
LB_56482:
	bts r12,3
LB_56483:
	call NS_E_56339
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_56484
	btr r12,3
	jmp LB_56485
LB_56484:
	bts r12,3
LB_56485:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_56476
	btr r12,2
	jmp LB_56477
LB_56476:
	bts r12,2
LB_56477:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_56474
	btr r12,1
	jmp LB_56475
LB_56474:
	bts r12,1
LB_56475:
	add rsp,24
; _some %_56437 ⊢ %_56438 : %_56438
 ; {>  %_56432~2':_r64 %_56437~3':_stg %_56436~0':_stg %_56428~1':_r64 }
; _some 3' ⊢ °0◂3'
; ∎ { %_56436 %_56438 }
 ; {>  %_56432~2':_r64 %_56438~°0◂3':(_opn)◂(_stg) %_56436~0':_stg %_56428~1':_r64 }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_56486
	mov rdi,r8
	call dlt
LB_56486:
	bt r12,1
	jc LB_56487
	mov rdi,r14
	call dlt
LB_56487:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_56490
	btr r12,1
	jmp LB_56491
LB_56490:
	bts r12,1
LB_56491:
	mov rsi,1
	bt r12,1
	jc LB_56488
	mov rsi,0
	bt r14,0
	jc LB_56488
	jmp LB_56489
LB_56488:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_56489:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_56448:
	mov r15,0
LB_56493:
	cmp r15,0
	jz LB_56494
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56493
LB_56494:
; _none {  } ⊢ %_56439 : %_56439
 ; {>  %_56428~1':_r64 %_56429~2':(_opn)◂({ _r64 (_lst)◂(_p55686) }) %_56427~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ { %_56427 %_56439 }
 ; {>  %_56439~°1◂{  }:(_opn)◂(t18777'(0)) %_56428~1':_r64 %_56429~2':(_opn)◂({ _r64 (_lst)◂(_p55686) }) %_56427~0':_stg }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_56495
	mov rdi,r14
	call dlt
LB_56495:
	bt r12,2
	jc LB_56496
	mov rdi,r8
	call dlt
LB_56496:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_56497
	mov rsi,0
	bt r14,0
	jc LB_56497
	jmp LB_56498
LB_56497:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_56498:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_56492:
NS_E_56502:
NS_E_RDI_56502:
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
; _f56440 %_56499 ⊢ { %_56500 %_56501 } : { %_56500 %_56501 }
 ; {>  %_56499~0':_stg }
; _f56440 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_56440
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_56501~1':(_opn)◂(_stg) %_56500~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_56503
	mov rdi,r14
	call dlt
LB_56503:
	bt r12,0
	jc LB_56504
	mov rdi,r13
	call dlt
LB_56504:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_56505:
NS_E_RDI_56505:
NS_E_56505_ETR_TBL:
NS_E_56505_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; prm_word
	jmp LB_56534
LB_56533:
	add r14,1
LB_56534:
	cmp r14,r10
	jge LB_56535
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56533
	cmp al,10
	jz LB_56533
	cmp al,32
	jz LB_56533
LB_56535:
	push r10
	call NS_E_55349_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56536
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56526
LB_56536:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_56539
LB_56538:
	add r14,1
LB_56539:
	cmp r14,r10
	jge LB_56540
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56538
	cmp al,10
	jz LB_56538
	cmp al,32
	jz LB_56538
LB_56540:
	add r14,1
	cmp r14,r10
	jg LB_56544
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_56544
	jmp LB_56545
LB_56544:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56542
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56542:
	jmp LB_56526
LB_56545:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_56547
LB_56546:
	add r14,1
LB_56547:
	cmp r14,r10
	jge LB_56548
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56546
	cmp al,10
	jz LB_56546
	cmp al,32
	jz LB_56546
LB_56548:
	push r10
	call NS_E_56505_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56549
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56550
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56550:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56551
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56551:
	jmp LB_56526
LB_56549:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_56531
	btr r12,2
	jmp LB_56532
LB_56531:
	bts r12,2
LB_56532:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56529
	btr r12,1
	jmp LB_56530
LB_56529:
	bts r12,1
LB_56530:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56527
	btr r12,0
	jmp LB_56528
LB_56527:
	bts r12,0
LB_56528:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_56523
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_56553
	btr r12,3
	jmp LB_56554
LB_56553:
	bts r12,3
LB_56554:
	mov r14,r8
	bt r12,2
	jc LB_56555
	btr r12,1
	jmp LB_56556
LB_56555:
	bts r12,1
LB_56556:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55408 { %_56506 %_56507 } ⊢ %_56508 : %_56508
 ; {>  %_56507~1':_p55407 %_56506~0':_stg }
; _f55408 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_56508 ⊢ %_56509 : %_56509
 ; {>  %_56508~°0◂{ 0' 1' }:_p55407 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_56509
 ; {>  %_56509~°0◂°0◂{ 0' 1' }:(_opn)◂(_p55407) }
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
	jc LB_56517
	btr r12,2
	jmp LB_56518
LB_56517:
	bts r12,2
LB_56518:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_56515
	btr QWORD [rdi],0
	jmp LB_56516
LB_56515:
	bts QWORD [rdi],0
LB_56516:
	mov r8,r14
	bt r12,1
	jc LB_56521
	btr r12,2
	jmp LB_56522
LB_56521:
	bts r12,2
LB_56522:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_56519
	btr QWORD [rdi],1
	jmp LB_56520
LB_56519:
	bts QWORD [rdi],1
LB_56520:
	mov rsi,1
	bt r12,3
	jc LB_56513
	mov rsi,0
	bt r9,0
	jc LB_56513
	jmp LB_56514
LB_56513:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56514:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56523:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56525
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56524
LB_56525:
	add rsp,8
	ret
LB_56526:
	add rsp,48
	pop r14
LB_56524:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_56568
LB_56567:
	add r14,1
LB_56568:
	cmp r14,r10
	jge LB_56569
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56567
	cmp al,32
	jz LB_56567
LB_56569:
	push r10
	call NS_E_55349_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56570
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56564
LB_56570:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56565
	btr r12,0
	jmp LB_56566
LB_56565:
	bts r12,0
LB_56566:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56561
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55409 %_56510 ⊢ %_56511 : %_56511
 ; {>  %_56510~0':_stg }
; _f55409 0' ⊢ °1◂0'
; _some %_56511 ⊢ %_56512 : %_56512
 ; {>  %_56511~°1◂0':_p55407 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_56512
 ; {>  %_56512~°0◂°1◂0':(_opn)◂(_p55407) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56559
	btr r12,3
	jmp LB_56560
LB_56559:
	bts r12,3
LB_56560:
	mov rsi,1
	bt r12,3
	jc LB_56557
	mov rsi,0
	bt r9,0
	jc LB_56557
	jmp LB_56558
LB_56557:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56558:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56561:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56563
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56562
LB_56563:
	add rsp,8
	ret
LB_56564:
	add rsp,16
	pop r14
LB_56562:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56572:
NS_E_RDI_56572:
NS_E_56572_ETR_TBL:
NS_E_56572_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_54731_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56597
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56589
LB_56597:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_56605
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_56605
	jmp LB_56606
LB_56605:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56603
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56603:
	jmp LB_56589
LB_56606:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56592
	btr r12,1
	jmp LB_56593
LB_56592:
	bts r12,1
LB_56593:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56590
	btr r12,0
	jmp LB_56591
LB_56590:
	bts r12,0
LB_56591:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_56586
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55485 %_56573 ⊢ %_56574 : %_56574
 ; {>  %_56573~0':_r64 }
; _f55485 0' ⊢ °0◂0'
; _some %_56574 ⊢ %_56575 : %_56575
 ; {>  %_56574~°0◂0':_p55431 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_56575
 ; {>  %_56575~°0◂°0◂0':(_opn)◂(_p55431) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56584
	btr r12,3
	jmp LB_56585
LB_56584:
	bts r12,3
LB_56585:
	mov rsi,1
	bt r12,3
	jc LB_56582
	mov rsi,0
	bt r9,0
	jc LB_56582
	jmp LB_56583
LB_56582:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56583:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56586:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56588
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56587
LB_56588:
	add rsp,8
	ret
LB_56589:
	add rsp,32
	pop r14
LB_56587:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_54852_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56620
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56614
LB_56620:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56615
	btr r12,0
	jmp LB_56616
LB_56615:
	bts r12,0
LB_56616:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56611
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55486 %_56576 ⊢ %_56577 : %_56577
 ; {>  %_56576~0':_stg }
; _f55486 0' ⊢ °1◂0'
; _some %_56577 ⊢ %_56578 : %_56578
 ; {>  %_56577~°1◂0':_p55431 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_56578
 ; {>  %_56578~°0◂°1◂0':(_opn)◂(_p55431) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56609
	btr r12,3
	jmp LB_56610
LB_56609:
	bts r12,3
LB_56610:
	mov rsi,1
	bt r12,3
	jc LB_56607
	mov rsi,0
	bt r9,0
	jc LB_56607
	jmp LB_56608
LB_56607:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56608:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56611:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56613
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56612
LB_56613:
	add rsp,8
	ret
LB_56614:
	add rsp,16
	pop r14
LB_56612:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_56505_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56635
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56629
LB_56635:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56630
	btr r12,0
	jmp LB_56631
LB_56630:
	bts r12,0
LB_56631:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56626
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55487 %_56579 ⊢ %_56580 : %_56580
 ; {>  %_56579~0':_p55407 }
; _f55487 0' ⊢ °2◂0'
; _some %_56580 ⊢ %_56581 : %_56581
 ; {>  %_56580~°2◂0':_p55431 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_56581
 ; {>  %_56581~°0◂°2◂0':(_opn)◂(_p55431) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56624
	btr r12,3
	jmp LB_56625
LB_56624:
	bts r12,3
LB_56625:
	mov rsi,1
	bt r12,3
	jc LB_56622
	mov rsi,0
	bt r9,0
	jc LB_56622
	jmp LB_56623
LB_56622:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56623:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56626:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56628
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56627
LB_56628:
	add rsp,8
	ret
LB_56629:
	add rsp,16
	pop r14
LB_56627:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56638:
NS_E_RDI_56638:
NS_E_56638_ETR_TBL:
NS_E_56638_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\n"
	jmp LB_56645
LB_56644:
	add r14,1
LB_56645:
	cmp r14,r10
	jge LB_56646
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56644
	cmp al,32
	jz LB_56644
LB_56646:
	add r14,1
	cmp r14,r10
	jg LB_56649
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_56649
	jmp LB_56650
LB_56649:
	jmp LB_56640
LB_56650:
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
LB_56655:
	jmp LB_56652
LB_56651:
	add r14,1
LB_56652:
	cmp r14,r10
	jge LB_56653
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56651
	cmp al,32
	jz LB_56651
LB_56653:
	add r14,1
	cmp r14,r10
	jg LB_56654
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_56654
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
	jmp LB_56655
LB_56654:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56641
	btr QWORD [rdi],1
LB_56641:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56642
	btr QWORD [rdi],0
LB_56642:
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
LB_56640:
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
NS_E_56665:
; 	|» { 0' 1' }
NS_E_RDI_56665:
MTC_LB_56666:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_56667
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
	jnc LB_56668
	bt QWORD [rax],0
	jc LB_56669
	btr r12,4
	jmp LB_56670
LB_56669:
	bts r12,4
LB_56670:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_56668:
	mov r10,rax
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_56673
	btr r12,5
	jmp LB_56674
LB_56673:
	bts r12,5
LB_56674:
	mov r8,r11
	bt r12,5
	jc LB_56671
	btr r12,2
	jmp LB_56672
LB_56671:
	bts r12,2
LB_56672:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_56677
	btr r12,5
	jmp LB_56678
LB_56677:
	bts r12,5
LB_56678:
	mov r9,r11
	bt r12,5
	jc LB_56675
	btr r12,3
	jmp LB_56676
LB_56675:
	bts r12,3
LB_56676:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_56679:
	cmp r15,0
	jz LB_56680
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56679
LB_56680:
; _f55482 { %_56659 %_56661 } ⊢ %_56663 : %_56663
 ; {>  %_56662~3':(_lst)◂(_p55430) %_56659~0':_p55430 %_56661~2':_p55430 }
; _f55482 { 0' 2' } ⊢ °1◂{ 0' 2' }
; _f56665 { %_56663 %_56662 } ⊢ %_56664 : %_56664
 ; {>  %_56662~3':(_lst)◂(_p55430) %_56663~°1◂{ 0' 2' }:_p55430 }
; _f56665 { °1◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °1◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_56681
	btr r12,1
	jmp LB_56682
LB_56681:
	bts r12,1
LB_56682:
	mov r9,r13
	bt r12,0
	jc LB_56683
	btr r12,3
	jmp LB_56684
LB_56683:
	bts r12,3
LB_56684:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_56689
	btr r12,4
	jmp LB_56690
LB_56689:
	bts r12,4
LB_56690:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_56687
	btr QWORD [rdi],0
	jmp LB_56688
LB_56687:
	bts QWORD [rdi],0
LB_56688:
	mov r10,r8
	bt r12,2
	jc LB_56693
	btr r12,4
	jmp LB_56694
LB_56693:
	bts r12,4
LB_56694:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_56691
	btr QWORD [rdi],1
	jmp LB_56692
LB_56691:
	bts QWORD [rdi],1
LB_56692:
	mov rsi,1
	bt r12,0
	jc LB_56685
	mov rsi,0
	bt r13,0
	jc LB_56685
	jmp LB_56686
LB_56685:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_56686:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_56665
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_56664
 ; {>  %_56664~0':_p55430 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_56667:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_56695
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
	jnc LB_56696
	bt QWORD [rax],0
	jc LB_56697
	btr r12,2
	jmp LB_56698
LB_56697:
	bts r12,2
LB_56698:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_56696:
	mov r8,rax
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_56699:
	cmp r15,0
	jz LB_56700
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_56699
LB_56700:
; ∎ %_56659
 ; {>  %_56659~0':_p55430 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_56695:
NS_E_56701:
NS_E_RDI_56701:
NS_E_56701_ETR_TBL:
NS_E_56701_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_56748
LB_56747:
	add r14,1
LB_56748:
	cmp r14,r10
	jge LB_56749
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56747
	cmp al,10
	jz LB_56747
	cmp al,32
	jz LB_56747
LB_56749:
	add r14,1
	cmp r14,r10
	jg LB_56752
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_56752
	jmp LB_56753
LB_56752:
	jmp LB_56740
LB_56753:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_56755
LB_56754:
	add r14,1
LB_56755:
	cmp r14,r10
	jge LB_56756
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56754
	cmp al,10
	jz LB_56754
	cmp al,32
	jz LB_56754
LB_56756:
	push r10
	call NS_E_56702_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56757
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56758
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56758:
	jmp LB_56740
LB_56757:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_56761
LB_56760:
	add r14,1
LB_56761:
	cmp r14,r10
	jge LB_56762
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56760
	cmp al,10
	jz LB_56760
	cmp al,32
	jz LB_56760
LB_56762:
	add r14,1
	cmp r14,r10
	jg LB_56767
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_56767
	jmp LB_56768
LB_56767:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56764
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56764:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56765
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56765:
	jmp LB_56740
LB_56768:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_56745
	btr r12,2
	jmp LB_56746
LB_56745:
	bts r12,2
LB_56746:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56743
	btr r12,1
	jmp LB_56744
LB_56743:
	bts r12,1
LB_56744:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56741
	btr r12,0
	jmp LB_56742
LB_56741:
	bts r12,0
LB_56742:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_56737
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_56769
	btr r12,3
	jmp LB_56770
LB_56769:
	bts r12,3
LB_56770:
	mov r13,r14
	bt r12,1
	jc LB_56771
	btr r12,0
	jmp LB_56772
LB_56771:
	bts r12,0
LB_56772:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55477 %_56705 ⊢ %_56706 : %_56706
 ; {>  %_56705~0':(_lst)◂(_p55428) }
; _f55477 0' ⊢ °0◂0'
; _some %_56706 ⊢ %_56707 : %_56707
 ; {>  %_56706~°0◂0':_p55428 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_56707
 ; {>  %_56707~°0◂°0◂0':(_opn)◂(_p55428) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56735
	btr r12,3
	jmp LB_56736
LB_56735:
	bts r12,3
LB_56736:
	mov rsi,1
	bt r12,3
	jc LB_56733
	mov rsi,0
	bt r9,0
	jc LB_56733
	jmp LB_56734
LB_56733:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56734:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56737:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56739
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56738
LB_56739:
	add rsp,8
	ret
LB_56740:
	add rsp,48
	pop r14
LB_56738:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; src
	jmp LB_56784
LB_56783:
	add r14,1
LB_56784:
	cmp r14,r10
	jge LB_56785
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56783
	cmp al,10
	jz LB_56783
	cmp al,32
	jz LB_56783
LB_56785:
	push r10
	call NS_E_56704_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56786
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56780
LB_56786:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56781
	btr r12,0
	jmp LB_56782
LB_56781:
	bts r12,0
LB_56782:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56777
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55478 %_56708 ⊢ %_56709 : %_56709
 ; {>  %_56708~0':_p55426 }
; _f55478 0' ⊢ °1◂0'
; _some %_56709 ⊢ %_56710 : %_56710
 ; {>  %_56709~°1◂0':_p55428 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_56710
 ; {>  %_56710~°0◂°1◂0':(_opn)◂(_p55428) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56775
	btr r12,3
	jmp LB_56776
LB_56775:
	bts r12,3
LB_56776:
	mov rsi,1
	bt r12,3
	jc LB_56773
	mov rsi,0
	bt r9,0
	jc LB_56773
	jmp LB_56774
LB_56773:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56774:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56777:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56779
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56778
LB_56779:
	add rsp,8
	ret
LB_56780:
	add rsp,16
	pop r14
LB_56778:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56702:
NS_E_RDI_56702:
NS_E_56702_ETR_TBL:
NS_E_56702_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; src_ptn
	jmp LB_56807
LB_56806:
	add r14,1
LB_56807:
	cmp r14,r10
	jge LB_56808
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56806
	cmp al,10
	jz LB_56806
	cmp al,32
	jz LB_56806
LB_56808:
	push r10
	call NS_E_56701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56809
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56801
LB_56809:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_56812
LB_56811:
	add r14,1
LB_56812:
	cmp r14,r10
	jge LB_56813
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56811
	cmp al,10
	jz LB_56811
	cmp al,32
	jz LB_56811
LB_56813:
	push r10
	call NS_E_56702_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56814
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56815
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56815:
	jmp LB_56801
LB_56814:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56804
	btr r12,1
	jmp LB_56805
LB_56804:
	bts r12,1
LB_56805:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56802
	btr r12,0
	jmp LB_56803
LB_56802:
	bts r12,0
LB_56803:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_56798
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_56711 %_56712 } ⊢ %_56713 : %_56713
 ; {>  %_56712~1':(_lst)◂(_p55428) %_56711~0':_p55428 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_56713 ⊢ %_56714 : %_56714
 ; {>  %_56713~°0◂{ 0' 1' }:(_lst)◂(_p55428) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_56714
 ; {>  %_56714~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p55428)) }
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
	jc LB_56792
	btr r12,2
	jmp LB_56793
LB_56792:
	bts r12,2
LB_56793:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_56790
	btr QWORD [rdi],0
	jmp LB_56791
LB_56790:
	bts QWORD [rdi],0
LB_56791:
	mov r8,r14
	bt r12,1
	jc LB_56796
	btr r12,2
	jmp LB_56797
LB_56796:
	bts r12,2
LB_56797:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_56794
	btr QWORD [rdi],1
	jmp LB_56795
LB_56794:
	bts QWORD [rdi],1
LB_56795:
	mov rsi,1
	bt r12,3
	jc LB_56788
	mov rsi,0
	bt r9,0
	jc LB_56788
	jmp LB_56789
LB_56788:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56789:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56798:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56800
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56799
LB_56800:
	add rsp,8
	ret
LB_56801:
	add rsp,32
	pop r14
LB_56799:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_56819
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_56715 : %_56715
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_56715 ⊢ %_56716 : %_56716
 ; {>  %_56715~°1◂{  }:(_lst)◂(t18883'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_56716
 ; {>  %_56716~°0◂°1◂{  }:(_opn)◂((_lst)◂(t18886'(0))) }
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
	jc LB_56817
	mov rsi,0
	bt r9,0
	jc LB_56817
	jmp LB_56818
LB_56817:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56818:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56819:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56821
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56820
LB_56821:
	add rsp,8
	ret
LB_56822:
	add rsp,0
	pop r14
LB_56820:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56703:
NS_E_RDI_56703:
NS_E_56703_ETR_TBL:
NS_E_56703_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_56860
LB_56859:
	add r14,1
LB_56860:
	cmp r14,r10
	jge LB_56861
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56859
	cmp al,10
	jz LB_56859
	cmp al,32
	jz LB_56859
LB_56861:
	add r14,1
	cmp r14,r10
	jg LB_56864
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_56864
	jmp LB_56865
LB_56864:
	jmp LB_56838
LB_56865:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_56847
LB_56846:
	add r14,1
LB_56847:
	cmp r14,r10
	jge LB_56848
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56846
	cmp al,10
	jz LB_56846
	cmp al,32
	jz LB_56846
LB_56848:
	push r10
	call NS_E_56704_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56849
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56850
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56850:
	jmp LB_56839
LB_56849:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_56853
LB_56852:
	add r14,1
LB_56853:
	cmp r14,r10
	jge LB_56854
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56852
	cmp al,10
	jz LB_56852
	cmp al,32
	jz LB_56852
LB_56854:
	push r10
	call NS_E_56703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56855
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56856
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56856:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56857
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56857:
	jmp LB_56839
LB_56855:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_56844
	btr r12,2
	jmp LB_56845
LB_56844:
	bts r12,2
LB_56845:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56842
	btr r12,1
	jmp LB_56843
LB_56842:
	bts r12,1
LB_56843:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56840
	btr r12,0
	jmp LB_56841
LB_56840:
	bts r12,0
LB_56841:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_56835
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_56866
	btr r12,3
	jmp LB_56867
LB_56866:
	bts r12,3
LB_56867:
	mov r14,r8
	bt r12,2
	jc LB_56868
	btr r12,1
	jmp LB_56869
LB_56868:
	bts r12,1
LB_56869:
	mov r8,r13
	bt r12,0
	jc LB_56870
	btr r12,2
	jmp LB_56871
LB_56870:
	bts r12,2
LB_56871:
	mov r13,r9
	bt r12,3
	jc LB_56872
	btr r12,0
	jmp LB_56873
LB_56872:
	bts r12,0
LB_56873:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55478 %_56717 ⊢ %_56719 : %_56719
 ; {>  %_56718~1':(_lst)◂(_p55428) %_56717~0':_p55426 }
; _f55478 0' ⊢ °1◂0'
; _cns { %_56719 %_56718 } ⊢ %_56720 : %_56720
 ; {>  %_56719~°1◂0':_p55428 %_56718~1':(_lst)◂(_p55428) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_56720 ⊢ %_56721 : %_56721
 ; {>  %_56720~°0◂{ °1◂0' 1' }:(_lst)◂(_p55428) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_56721
 ; {>  %_56721~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p55428)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_56829
	btr r12,2
	jmp LB_56830
LB_56829:
	bts r12,2
LB_56830:
	mov rsi,1
	bt r12,2
	jc LB_56827
	mov rsi,0
	bt r8,0
	jc LB_56827
	jmp LB_56828
LB_56827:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_56828:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_56825
	btr QWORD [rdi],0
	jmp LB_56826
LB_56825:
	bts QWORD [rdi],0
LB_56826:
	mov r8,r14
	bt r12,1
	jc LB_56833
	btr r12,2
	jmp LB_56834
LB_56833:
	bts r12,2
LB_56834:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_56831
	btr QWORD [rdi],1
	jmp LB_56832
LB_56831:
	bts QWORD [rdi],1
LB_56832:
	mov rsi,1
	bt r12,3
	jc LB_56823
	mov rsi,0
	bt r9,0
	jc LB_56823
	jmp LB_56824
LB_56823:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56824:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56835:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56837
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56836
LB_56837:
	add rsp,8
	ret
LB_56839:
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
LB_56838:
	add rsp,48
	pop r14
LB_56836:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_56876
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_56722 : %_56722
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_56722 ⊢ %_56723 : %_56723
 ; {>  %_56722~°1◂{  }:(_lst)◂(t18897'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_56723
 ; {>  %_56723~°0◂°1◂{  }:(_opn)◂((_lst)◂(t18900'(0))) }
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
	jc LB_56874
	mov rsi,0
	bt r9,0
	jc LB_56874
	jmp LB_56875
LB_56874:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56875:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56876:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56878
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56877
LB_56878:
	add rsp,8
	ret
LB_56879:
	add rsp,0
	pop r14
LB_56877:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56704:
NS_E_RDI_56704:
NS_E_56704_ETR_TBL:
NS_E_56704_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "%["
	jmp LB_56895
LB_56894:
	add r14,1
LB_56895:
	cmp r14,r10
	jge LB_56896
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56894
	cmp al,10
	jz LB_56894
	cmp al,32
	jz LB_56894
LB_56896:
	add r14,2
	cmp r14,r10
	jg LB_56899
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_56899
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_56899
	jmp LB_56900
LB_56899:
	jmp LB_56887
LB_56900:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_56902
LB_56901:
	add r14,1
LB_56902:
	cmp r14,r10
	jge LB_56903
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56901
	cmp al,10
	jz LB_56901
	cmp al,32
	jz LB_56901
LB_56903:
	push r10
	call NS_E_56572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56904
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56905
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56905:
	jmp LB_56887
LB_56904:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_56908
LB_56907:
	add r14,1
LB_56908:
	cmp r14,r10
	jge LB_56909
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56907
	cmp al,10
	jz LB_56907
	cmp al,32
	jz LB_56907
LB_56909:
	add r14,1
	cmp r14,r10
	jg LB_56914
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_56914
	jmp LB_56915
LB_56914:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_56911
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_56911:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56912
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56912:
	jmp LB_56887
LB_56915:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_56892
	btr r12,2
	jmp LB_56893
LB_56892:
	bts r12,2
LB_56893:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56890
	btr r12,1
	jmp LB_56891
LB_56890:
	bts r12,1
LB_56891:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56888
	btr r12,0
	jmp LB_56889
LB_56888:
	bts r12,0
LB_56889:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_56884
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_56916
	btr r12,3
	jmp LB_56917
LB_56916:
	bts r12,3
LB_56917:
	mov r13,r14
	bt r12,1
	jc LB_56918
	btr r12,0
	jmp LB_56919
LB_56918:
	bts r12,0
LB_56919:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55473 %_56724 ⊢ %_56725 : %_56725
 ; {>  %_56724~0':_p55431 }
; _f55473 0' ⊢ °0◂0'
; _some %_56725 ⊢ %_56726 : %_56726
 ; {>  %_56725~°0◂0':_p55426 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_56726
 ; {>  %_56726~°0◂°0◂0':(_opn)◂(_p55426) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56882
	btr r12,3
	jmp LB_56883
LB_56882:
	bts r12,3
LB_56883:
	mov rsi,1
	bt r12,3
	jc LB_56880
	mov rsi,0
	bt r9,0
	jc LB_56880
	jmp LB_56881
LB_56880:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56881:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56884:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56886
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56885
LB_56886:
	add rsp,8
	ret
LB_56887:
	add rsp,48
	pop r14
LB_56885:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_56944
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_56944
	jmp LB_56945
LB_56944:
	jmp LB_56927
LB_56945:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_55349_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56936
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_56937
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_56937:
	jmp LB_56928
LB_56936:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_56931
	btr r12,1
	jmp LB_56932
LB_56931:
	bts r12,1
LB_56932:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56929
	btr r12,0
	jmp LB_56930
LB_56929:
	bts r12,0
LB_56930:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_56924
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_56946
	btr r12,2
	jmp LB_56947
LB_56946:
	bts r12,2
LB_56947:
	mov r13,r14
	bt r12,1
	jc LB_56948
	btr r12,0
	jmp LB_56949
LB_56948:
	bts r12,0
LB_56949:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55474 %_56727 ⊢ %_56728 : %_56728
 ; {>  %_56727~0':_stg }
; _f55474 0' ⊢ °1◂0'
; _some %_56728 ⊢ %_56729 : %_56729
 ; {>  %_56728~°1◂0':_p55426 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_56729
 ; {>  %_56729~°0◂°1◂0':(_opn)◂(_p55426) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56922
	btr r12,3
	jmp LB_56923
LB_56922:
	bts r12,3
LB_56923:
	mov rsi,1
	bt r12,3
	jc LB_56920
	mov rsi,0
	bt r9,0
	jc LB_56920
	jmp LB_56921
LB_56920:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56921:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56924:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56926
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56925
LB_56926:
	add rsp,8
	ret
LB_56928:
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
LB_56927:
	add rsp,32
	pop r14
LB_56925:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; prm_word
	jmp LB_56961
LB_56960:
	add r14,1
LB_56961:
	cmp r14,r10
	jge LB_56962
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_56960
	cmp al,10
	jz LB_56960
	cmp al,32
	jz LB_56960
LB_56962:
	push r10
	call NS_E_55349_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_56963
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56957
LB_56963:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_56958
	btr r12,0
	jmp LB_56959
LB_56958:
	bts r12,0
LB_56959:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_56954
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55474 %_56730 ⊢ %_56731 : %_56731
 ; {>  %_56730~0':_stg }
; _f55474 0' ⊢ °1◂0'
; _some %_56731 ⊢ %_56732 : %_56732
 ; {>  %_56731~°1◂0':_p55426 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_56732
 ; {>  %_56732~°0◂°1◂0':(_opn)◂(_p55426) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_56952
	btr r12,3
	jmp LB_56953
LB_56952:
	bts r12,3
LB_56953:
	mov rsi,1
	bt r12,3
	jc LB_56950
	mov rsi,0
	bt r9,0
	jc LB_56950
	jmp LB_56951
LB_56950:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_56951:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_56954:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_56956
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_56955
LB_56956:
	add rsp,8
	ret
LB_56957:
	add rsp,16
	pop r14
LB_56955:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56965:
NS_E_RDI_56965:
NS_E_56965_ETR_TBL:
NS_E_56965_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "{"
	jmp LB_57015
LB_57014:
	add r14,1
LB_57015:
	cmp r14,r10
	jge LB_57016
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57014
	cmp al,10
	jz LB_57014
	cmp al,32
	jz LB_57014
LB_57016:
	add r14,1
	cmp r14,r10
	jg LB_57019
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_57019
	jmp LB_57020
LB_57019:
	jmp LB_57007
LB_57020:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_57022
LB_57021:
	add r14,1
LB_57022:
	cmp r14,r10
	jge LB_57023
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57021
	cmp al,10
	jz LB_57021
	cmp al,32
	jz LB_57021
LB_57023:
	push r10
	call NS_E_56966_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57024
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57025
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57025:
	jmp LB_57007
LB_57024:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_57028
LB_57027:
	add r14,1
LB_57028:
	cmp r14,r10
	jge LB_57029
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57027
	cmp al,10
	jz LB_57027
	cmp al,32
	jz LB_57027
LB_57029:
	add r14,1
	cmp r14,r10
	jg LB_57034
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_57034
	jmp LB_57035
LB_57034:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57031
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57031:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57032
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57032:
	jmp LB_57007
LB_57035:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57012
	btr r12,2
	jmp LB_57013
LB_57012:
	bts r12,2
LB_57013:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57010
	btr r12,1
	jmp LB_57011
LB_57010:
	bts r12,1
LB_57011:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57008
	btr r12,0
	jmp LB_57009
LB_57008:
	bts r12,0
LB_57009:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57004
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_57036
	btr r12,3
	jmp LB_57037
LB_57036:
	bts r12,3
LB_57037:
	mov r13,r14
	bt r12,1
	jc LB_57038
	btr r12,0
	jmp LB_57039
LB_57038:
	bts r12,0
LB_57039:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55479 %_56971 ⊢ %_56972 : %_56972
 ; {>  %_56971~0':(_lst)◂(_p55429) }
; _f55479 0' ⊢ °0◂0'
; _some %_56972 ⊢ %_56973 : %_56973
 ; {>  %_56972~°0◂0':_p55429 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_56973
 ; {>  %_56973~°0◂°0◂0':(_opn)◂(_p55429) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57002
	btr r12,3
	jmp LB_57003
LB_57002:
	bts r12,3
LB_57003:
	mov rsi,1
	bt r12,3
	jc LB_57000
	mov rsi,0
	bt r9,0
	jc LB_57000
	jmp LB_57001
LB_57000:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57001:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57004:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57006
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57005
LB_57006:
	add rsp,8
	ret
LB_57007:
	add rsp,48
	pop r14
LB_57005:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dst
	jmp LB_57051
LB_57050:
	add r14,1
LB_57051:
	cmp r14,r10
	jge LB_57052
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57050
	cmp al,10
	jz LB_57050
	cmp al,32
	jz LB_57050
LB_57052:
	push r10
	call NS_E_56970_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57053
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57047
LB_57053:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57048
	btr r12,0
	jmp LB_57049
LB_57048:
	bts r12,0
LB_57049:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57044
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55480 %_56974 ⊢ %_56975 : %_56975
 ; {>  %_56974~0':_p55427 }
; _f55480 0' ⊢ °1◂0'
; _some %_56975 ⊢ %_56976 : %_56976
 ; {>  %_56975~°1◂0':_p55429 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_56976
 ; {>  %_56976~°0◂°1◂0':(_opn)◂(_p55429) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57042
	btr r12,3
	jmp LB_57043
LB_57042:
	bts r12,3
LB_57043:
	mov rsi,1
	bt r12,3
	jc LB_57040
	mov rsi,0
	bt r9,0
	jc LB_57040
	jmp LB_57041
LB_57040:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57041:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57044:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57046
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57045
LB_57046:
	add rsp,8
	ret
LB_57047:
	add rsp,16
	pop r14
LB_57045:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56966:
NS_E_RDI_56966:
NS_E_56966_ETR_TBL:
NS_E_56966_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_57074
LB_57073:
	add r14,1
LB_57074:
	cmp r14,r10
	jge LB_57075
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57073
	cmp al,10
	jz LB_57073
	cmp al,32
	jz LB_57073
LB_57075:
	push r10
	call NS_E_56965_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57076
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57068
LB_57076:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_57079
LB_57078:
	add r14,1
LB_57079:
	cmp r14,r10
	jge LB_57080
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57078
	cmp al,10
	jz LB_57078
	cmp al,32
	jz LB_57078
LB_57080:
	push r10
	call NS_E_56966_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57081
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57082
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57082:
	jmp LB_57068
LB_57081:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57071
	btr r12,1
	jmp LB_57072
LB_57071:
	bts r12,1
LB_57072:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57069
	btr r12,0
	jmp LB_57070
LB_57069:
	bts r12,0
LB_57070:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_57065
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_56977 %_56978 } ⊢ %_56979 : %_56979
 ; {>  %_56977~0':_p55429 %_56978~1':(_lst)◂(_p55429) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_56979 ⊢ %_56980 : %_56980
 ; {>  %_56979~°0◂{ 0' 1' }:(_lst)◂(_p55429) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_56980
 ; {>  %_56980~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p55429)) }
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
	jc LB_57059
	btr r12,2
	jmp LB_57060
LB_57059:
	bts r12,2
LB_57060:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_57057
	btr QWORD [rdi],0
	jmp LB_57058
LB_57057:
	bts QWORD [rdi],0
LB_57058:
	mov r8,r14
	bt r12,1
	jc LB_57063
	btr r12,2
	jmp LB_57064
LB_57063:
	bts r12,2
LB_57064:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_57061
	btr QWORD [rdi],1
	jmp LB_57062
LB_57061:
	bts QWORD [rdi],1
LB_57062:
	mov rsi,1
	bt r12,3
	jc LB_57055
	mov rsi,0
	bt r9,0
	jc LB_57055
	jmp LB_57056
LB_57055:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57056:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57065:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57067
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57066
LB_57067:
	add rsp,8
	ret
LB_57068:
	add rsp,32
	pop r14
LB_57066:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_57086
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_56981 : %_56981
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_56981 ⊢ %_56982 : %_56982
 ; {>  %_56981~°1◂{  }:(_lst)◂(t18985'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_56982
 ; {>  %_56982~°0◂°1◂{  }:(_opn)◂((_lst)◂(t18988'(0))) }
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
	jc LB_57084
	mov rsi,0
	bt r9,0
	jc LB_57084
	jmp LB_57085
LB_57084:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57085:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57086:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57088
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57087
LB_57088:
	add rsp,8
	ret
LB_57089:
	add rsp,0
	pop r14
LB_57087:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56968:
NS_E_RDI_56968:
NS_E_56968_ETR_TBL:
NS_E_56968_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_57112
LB_57111:
	add r14,1
LB_57112:
	cmp r14,r10
	jge LB_57113
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57111
	cmp al,10
	jz LB_57111
	cmp al,32
	jz LB_57111
LB_57113:
	add r14,1
	cmp r14,r10
	jg LB_57116
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_57116
	jmp LB_57117
LB_57116:
	jmp LB_57090
LB_57117:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_57099
LB_57098:
	add r14,1
LB_57099:
	cmp r14,r10
	jge LB_57100
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57098
	cmp al,10
	jz LB_57098
	cmp al,32
	jz LB_57098
LB_57100:
	push r10
	call NS_E_56965_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57101
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57102
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57102:
	jmp LB_57091
LB_57101:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_57105
LB_57104:
	add r14,1
LB_57105:
	cmp r14,r10
	jge LB_57106
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57104
	cmp al,10
	jz LB_57104
	cmp al,32
	jz LB_57104
LB_57106:
	push r10
	call NS_E_56968_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57107
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57108
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57108:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57109
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57109:
	jmp LB_57091
LB_57107:
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
	jc LB_57094
	btr QWORD [rdi],2
LB_57094:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57095
	btr QWORD [rdi],1
LB_57095:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57096
	btr QWORD [rdi],0
LB_57096:
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
LB_57091:
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
LB_57090:
	add rsp,48
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
LB_57092:
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
NS_E_56969:
NS_E_RDI_56969:
NS_E_56969_ETR_TBL:
NS_E_56969_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ","
	jmp LB_57155
LB_57154:
	add r14,1
LB_57155:
	cmp r14,r10
	jge LB_57156
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57154
	cmp al,10
	jz LB_57154
	cmp al,32
	jz LB_57154
LB_57156:
	add r14,1
	cmp r14,r10
	jg LB_57159
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_57159
	jmp LB_57160
LB_57159:
	jmp LB_57133
LB_57160:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_57142
LB_57141:
	add r14,1
LB_57142:
	cmp r14,r10
	jge LB_57143
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57141
	cmp al,10
	jz LB_57141
	cmp al,32
	jz LB_57141
LB_57143:
	push r10
	call NS_E_56970_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57144
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57145
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57145:
	jmp LB_57134
LB_57144:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_57148
LB_57147:
	add r14,1
LB_57148:
	cmp r14,r10
	jge LB_57149
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57147
	cmp al,10
	jz LB_57147
	cmp al,32
	jz LB_57147
LB_57149:
	push r10
	call NS_E_56969_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57150
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57151
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57151:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57152
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57152:
	jmp LB_57134
LB_57150:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57139
	btr r12,2
	jmp LB_57140
LB_57139:
	bts r12,2
LB_57140:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57137
	btr r12,1
	jmp LB_57138
LB_57137:
	bts r12,1
LB_57138:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57135
	btr r12,0
	jmp LB_57136
LB_57135:
	bts r12,0
LB_57136:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57130
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_57161
	btr r12,3
	jmp LB_57162
LB_57161:
	bts r12,3
LB_57162:
	mov r14,r8
	bt r12,2
	jc LB_57163
	btr r12,1
	jmp LB_57164
LB_57163:
	bts r12,1
LB_57164:
	mov r8,r13
	bt r12,0
	jc LB_57165
	btr r12,2
	jmp LB_57166
LB_57165:
	bts r12,2
LB_57166:
	mov r13,r9
	bt r12,3
	jc LB_57167
	btr r12,0
	jmp LB_57168
LB_57167:
	bts r12,0
LB_57168:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55480 %_56985 ⊢ %_56987 : %_56987
 ; {>  %_56985~0':_p55427 %_56986~1':(_lst)◂(_p55429) }
; _f55480 0' ⊢ °1◂0'
; _cns { %_56987 %_56986 } ⊢ %_56988 : %_56988
 ; {>  %_56987~°1◂0':_p55429 %_56986~1':(_lst)◂(_p55429) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_56988 ⊢ %_56989 : %_56989
 ; {>  %_56988~°0◂{ °1◂0' 1' }:(_lst)◂(_p55429) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_56989
 ; {>  %_56989~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p55429)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_57124
	btr r12,2
	jmp LB_57125
LB_57124:
	bts r12,2
LB_57125:
	mov rsi,1
	bt r12,2
	jc LB_57122
	mov rsi,0
	bt r8,0
	jc LB_57122
	jmp LB_57123
LB_57122:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_57123:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_57120
	btr QWORD [rdi],0
	jmp LB_57121
LB_57120:
	bts QWORD [rdi],0
LB_57121:
	mov r8,r14
	bt r12,1
	jc LB_57128
	btr r12,2
	jmp LB_57129
LB_57128:
	bts r12,2
LB_57129:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_57126
	btr QWORD [rdi],1
	jmp LB_57127
LB_57126:
	bts QWORD [rdi],1
LB_57127:
	mov rsi,1
	bt r12,3
	jc LB_57118
	mov rsi,0
	bt r9,0
	jc LB_57118
	jmp LB_57119
LB_57118:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57119:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57130:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57132
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57131
LB_57132:
	add rsp,8
	ret
LB_57134:
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
LB_57133:
	add rsp,48
	pop r14
LB_57131:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_57171
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_56990 : %_56990
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_56990 ⊢ %_56991 : %_56991
 ; {>  %_56990~°1◂{  }:(_lst)◂(t18999'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_56991
 ; {>  %_56991~°0◂°1◂{  }:(_opn)◂((_lst)◂(t19002'(0))) }
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
	jc LB_57169
	mov rsi,0
	bt r9,0
	jc LB_57169
	jmp LB_57170
LB_57169:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57170:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57171:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57173
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57172
LB_57173:
	add rsp,8
	ret
LB_57174:
	add rsp,0
	pop r14
LB_57172:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_56970:
NS_E_RDI_56970:
NS_E_56970_ETR_TBL:
NS_E_56970_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_57199
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_57199
	jmp LB_57200
LB_57199:
	jmp LB_57182
LB_57200:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57191
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57192
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57192:
	jmp LB_57183
LB_57191:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57186
	btr r12,1
	jmp LB_57187
LB_57186:
	bts r12,1
LB_57187:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57184
	btr r12,0
	jmp LB_57185
LB_57184:
	bts r12,0
LB_57185:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_57179
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_57201
	btr r12,2
	jmp LB_57202
LB_57201:
	bts r12,2
LB_57202:
	mov r13,r14
	bt r12,1
	jc LB_57203
	btr r12,0
	jmp LB_57204
LB_57203:
	bts r12,0
LB_57204:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55476 %_56992 ⊢ %_56993 : %_56993
 ; {>  %_56992~0':_stg }
; _f55476 0' ⊢ °1◂0'
; _some %_56993 ⊢ %_56994 : %_56994
 ; {>  %_56993~°1◂0':_p55427 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_56994
 ; {>  %_56994~°0◂°1◂0':(_opn)◂(_p55427) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57177
	btr r12,3
	jmp LB_57178
LB_57177:
	bts r12,3
LB_57178:
	mov rsi,1
	bt r12,3
	jc LB_57175
	mov rsi,0
	bt r9,0
	jc LB_57175
	jmp LB_57176
LB_57175:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57176:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57179:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57181
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57180
LB_57181:
	add rsp,8
	ret
LB_57183:
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
LB_57182:
	add rsp,32
	pop r14
LB_57180:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57218
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57212
LB_57218:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57213
	btr r12,0
	jmp LB_57214
LB_57213:
	bts r12,0
LB_57214:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57209
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55476 %_56995 ⊢ %_56996 : %_56996
 ; {>  %_56995~0':_stg }
; _f55476 0' ⊢ °1◂0'
; _some %_56996 ⊢ %_56997 : %_56997
 ; {>  %_56996~°1◂0':_p55427 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_56997
 ; {>  %_56997~°0◂°1◂0':(_opn)◂(_p55427) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57207
	btr r12,3
	jmp LB_57208
LB_57207:
	bts r12,3
LB_57208:
	mov rsi,1
	bt r12,3
	jc LB_57205
	mov rsi,0
	bt r9,0
	jc LB_57205
	jmp LB_57206
LB_57205:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57206:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57209:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57211
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57210
LB_57211:
	add rsp,8
	ret
LB_57212:
	add rsp,16
	pop r14
LB_57210:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_57233
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_57233
	jmp LB_57234
LB_57233:
	jmp LB_57225
LB_57234:
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
	jc LB_57226
	btr r12,0
	jmp LB_57227
LB_57226:
	bts r12,0
LB_57227:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57222
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55475 {  } ⊢ %_56998 : %_56998
 ; {>  }
; _f55475 {  } ⊢ °0◂{  }
; _some %_56998 ⊢ %_56999 : %_56999
 ; {>  %_56998~°0◂{  }:_p55427 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_56999
 ; {>  %_56999~°0◂°0◂{  }:(_opn)◂(_p55427) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_57220
	mov rsi,0
	bt r9,0
	jc LB_57220
	jmp LB_57221
LB_57220:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57221:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57222:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57224
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57223
LB_57224:
	add rsp,8
	ret
LB_57225:
	add rsp,16
	pop r14
LB_57223:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57235:
NS_E_RDI_57235:
NS_E_57235_ETR_TBL:
NS_E_57235_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; type_atm
	jmp LB_57309
LB_57308:
	add r14,1
LB_57309:
	cmp r14,r10
	jge LB_57310
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57308
	cmp al,10
	jz LB_57308
	cmp al,32
	jz LB_57308
LB_57310:
	push r10
	call NS_E_57238_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57311
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57301
LB_57311:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_57314
LB_57313:
	add r14,1
LB_57314:
	cmp r14,r10
	jge LB_57315
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57313
	cmp al,10
	jz LB_57313
	cmp al,32
	jz LB_57313
LB_57315:
	push r10
	call NS_E_57237_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57316
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57317
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57317:
	jmp LB_57301
LB_57316:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_57320
LB_57319:
	add r14,1
LB_57320:
	cmp r14,r10
	jge LB_57321
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57319
	cmp al,10
	jz LB_57319
	cmp al,32
	jz LB_57319
LB_57321:
	push r10
	call NS_E_57236_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57322
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57323
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57323:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57324
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57324:
	jmp LB_57301
LB_57322:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57306
	btr r12,2
	jmp LB_57307
LB_57306:
	bts r12,2
LB_57307:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57304
	btr r12,1
	jmp LB_57305
LB_57304:
	bts r12,1
LB_57305:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57302
	btr r12,0
	jmp LB_57303
LB_57302:
	bts r12,0
LB_57303:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57298
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; _f56665 { %_57240 %_57241 } ⊢ %_57243 : %_57243
 ; {>  %_57240~0':_p55430 %_57242~2':(_opn)◂(_p55430) %_57241~1':(_lst)◂(_p55430) }
; _f56665 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_56665
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_57269
	btr r12,2
	jmp LB_57270
LB_57269:
	bts r12,2
LB_57270:
	add rsp,16
MTC_LB_57271:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_57272
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °0◂1'
; 2' ⊢ °0◂1'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_57273
	bt QWORD [rax],0
	jc LB_57274
	btr r12,3
	jmp LB_57275
LB_57274:
	bts r12,3
LB_57275:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_57273:
	mov r9,rax
	mov r14,r9
	bt r12,3
	jc LB_57276
	btr r12,1
	jmp LB_57277
LB_57276:
	bts r12,1
LB_57277:
LB_57278:
	cmp r15,0
	jz LB_57279
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_57278
LB_57279:
; _f55481 { %_57243 %_57244 } ⊢ %_57245 : %_57245
 ; {>  %_57243~0':_p55430 %_57244~1':_p55430 }
; _f55481 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57245 ⊢ %_57246 : %_57246
 ; {>  %_57245~°0◂{ 0' 1' }:_p55430 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57246
 ; {>  %_57246~°0◂°0◂{ 0' 1' }:(_opn)◂(_p55430) }
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
	jc LB_57284
	btr r12,2
	jmp LB_57285
LB_57284:
	bts r12,2
LB_57285:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_57282
	btr QWORD [rdi],0
	jmp LB_57283
LB_57282:
	bts QWORD [rdi],0
LB_57283:
	mov r8,r14
	bt r12,1
	jc LB_57288
	btr r12,2
	jmp LB_57289
LB_57288:
	bts r12,2
LB_57289:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_57286
	btr QWORD [rdi],1
	jmp LB_57287
LB_57286:
	bts QWORD [rdi],1
LB_57287:
	mov rsi,1
	bt r12,3
	jc LB_57280
	mov rsi,0
	bt r9,0
	jc LB_57280
	jmp LB_57281
LB_57280:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57281:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_57272:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_57290
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,r8
	bt QWORD [rax],17
	jnc LB_57291
	bt QWORD [rax],0
	jc LB_57292
	btr r12,1
	jmp LB_57293
LB_57292:
	bts r12,1
LB_57293:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_57291:
	mov r14,rax
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_57294:
	cmp r15,0
	jz LB_57295
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_57294
LB_57295:
; _some %_57243 ⊢ %_57247 : %_57247
 ; {>  %_57243~0':_p55430 }
; _some 0' ⊢ °0◂0'
; ∎ %_57247
 ; {>  %_57247~°0◂0':(_opn)◂(_p55430) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57296
	btr r12,3
	jmp LB_57297
LB_57296:
	bts r12,3
LB_57297:
	mov r8,0
	bts r12,2
	ret
MTC_LB_57290:
LB_57298:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57300
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57299
LB_57300:
	add rsp,8
	ret
LB_57301:
	add rsp,48
	pop r14
LB_57299:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57236:
NS_E_RDI_57236:
NS_E_57236_ETR_TBL:
NS_E_57236_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_57339
LB_57338:
	add r14,1
LB_57339:
	cmp r14,r10
	jge LB_57340
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57338
	cmp al,10
	jz LB_57338
	cmp al,32
	jz LB_57338
LB_57340:
	add r14,3
	cmp r14,r10
	jg LB_57343
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_57343
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_57343
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_57343
	jmp LB_57344
LB_57343:
	jmp LB_57333
LB_57344:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_57346
LB_57345:
	add r14,1
LB_57346:
	cmp r14,r10
	jge LB_57347
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57345
	cmp al,10
	jz LB_57345
	cmp al,32
	jz LB_57345
LB_57347:
	push r10
	call NS_E_57235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57348
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57349
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57349:
	jmp LB_57333
LB_57348:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57336
	btr r12,1
	jmp LB_57337
LB_57336:
	bts r12,1
LB_57337:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57334
	btr r12,0
	jmp LB_57335
LB_57334:
	bts r12,0
LB_57335:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_57330
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_57351
	btr r12,2
	jmp LB_57352
LB_57351:
	bts r12,2
LB_57352:
	mov r13,r14
	bt r12,1
	jc LB_57353
	btr r12,0
	jmp LB_57354
LB_57353:
	bts r12,0
LB_57354:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57248 ⊢ %_57249 : %_57249
 ; {>  %_57248~0':_p55430 }
; _some 0' ⊢ °0◂0'
; _some %_57249 ⊢ %_57250 : %_57250
 ; {>  %_57249~°0◂0':(_opn)◂(_p55430) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57250
 ; {>  %_57250~°0◂°0◂0':(_opn)◂((_opn)◂(_p55430)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57328
	btr r12,3
	jmp LB_57329
LB_57328:
	bts r12,3
LB_57329:
	mov rsi,1
	bt r12,3
	jc LB_57326
	mov rsi,0
	bt r9,0
	jc LB_57326
	jmp LB_57327
LB_57326:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57327:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57330:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57332
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57331
LB_57332:
	add rsp,8
	ret
LB_57333:
	add rsp,32
	pop r14
LB_57331:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_57357
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_57251 : %_57251
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_57251 ⊢ %_57252 : %_57252
 ; {>  %_57251~°1◂{  }:(_opn)◂(t19093'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57252
 ; {>  %_57252~°0◂°1◂{  }:(_opn)◂((_opn)◂(t19096'(0))) }
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
	jc LB_57355
	mov rsi,0
	bt r9,0
	jc LB_57355
	jmp LB_57356
LB_57355:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57356:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57357:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57359
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57358
LB_57359:
	add rsp,8
	ret
LB_57360:
	add rsp,0
	pop r14
LB_57358:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57237:
NS_E_RDI_57237:
NS_E_57237_ETR_TBL:
NS_E_57237_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_57382
LB_57381:
	add r14,1
LB_57382:
	cmp r14,r10
	jge LB_57383
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57381
	cmp al,10
	jz LB_57381
	cmp al,32
	jz LB_57381
LB_57383:
	add r14,3
	cmp r14,r10
	jg LB_57386
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_57386
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_57386
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_57386
	jmp LB_57387
LB_57386:
	jmp LB_57374
LB_57387:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_57389
LB_57388:
	add r14,1
LB_57389:
	cmp r14,r10
	jge LB_57390
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57388
	cmp al,10
	jz LB_57388
	cmp al,32
	jz LB_57388
LB_57390:
	push r10
	call NS_E_57238_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57391
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57392
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57392:
	jmp LB_57374
LB_57391:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_57395
LB_57394:
	add r14,1
LB_57395:
	cmp r14,r10
	jge LB_57396
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57394
	cmp al,10
	jz LB_57394
	cmp al,32
	jz LB_57394
LB_57396:
	push r10
	call NS_E_57237_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57397
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57398
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57398:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57399
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57399:
	jmp LB_57374
LB_57397:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57379
	btr r12,2
	jmp LB_57380
LB_57379:
	bts r12,2
LB_57380:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57377
	btr r12,1
	jmp LB_57378
LB_57377:
	bts r12,1
LB_57378:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57375
	btr r12,0
	jmp LB_57376
LB_57375:
	bts r12,0
LB_57376:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57371
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_57401
	btr r12,3
	jmp LB_57402
LB_57401:
	bts r12,3
LB_57402:
	mov r14,r8
	bt r12,2
	jc LB_57403
	btr r12,1
	jmp LB_57404
LB_57403:
	bts r12,1
LB_57404:
	mov r8,r13
	bt r12,0
	jc LB_57405
	btr r12,2
	jmp LB_57406
LB_57405:
	bts r12,2
LB_57406:
	mov r13,r9
	bt r12,3
	jc LB_57407
	btr r12,0
	jmp LB_57408
LB_57407:
	bts r12,0
LB_57408:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_57253 %_57254 } ⊢ %_57255 : %_57255
 ; {>  %_57253~0':_p55430 %_57254~1':(_lst)◂(_p55430) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57255 ⊢ %_57256 : %_57256
 ; {>  %_57255~°0◂{ 0' 1' }:(_lst)◂(_p55430) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57256
 ; {>  %_57256~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p55430)) }
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
	jc LB_57365
	btr r12,2
	jmp LB_57366
LB_57365:
	bts r12,2
LB_57366:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_57363
	btr QWORD [rdi],0
	jmp LB_57364
LB_57363:
	bts QWORD [rdi],0
LB_57364:
	mov r8,r14
	bt r12,1
	jc LB_57369
	btr r12,2
	jmp LB_57370
LB_57369:
	bts r12,2
LB_57370:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_57367
	btr QWORD [rdi],1
	jmp LB_57368
LB_57367:
	bts QWORD [rdi],1
LB_57368:
	mov rsi,1
	bt r12,3
	jc LB_57361
	mov rsi,0
	bt r9,0
	jc LB_57361
	jmp LB_57362
LB_57361:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57362:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57371:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57373
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57372
LB_57373:
	add rsp,8
	ret
LB_57374:
	add rsp,48
	pop r14
LB_57372:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_57411
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_57257 : %_57257
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57257 ⊢ %_57258 : %_57258
 ; {>  %_57257~°1◂{  }:(_lst)◂(t19106'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57258
 ; {>  %_57258~°0◂°1◂{  }:(_opn)◂((_lst)◂(t19109'(0))) }
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
	jc LB_57409
	mov rsi,0
	bt r9,0
	jc LB_57409
	jmp LB_57410
LB_57409:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57410:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57411:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57413
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57412
LB_57413:
	add rsp,8
	ret
LB_57414:
	add rsp,0
	pop r14
LB_57412:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57238:
NS_E_RDI_57238:
NS_E_57238_ETR_TBL:
NS_E_57238_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "("
	jmp LB_57428
LB_57427:
	add r14,1
LB_57428:
	cmp r14,r10
	jge LB_57429
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57427
	cmp al,10
	jz LB_57427
	cmp al,32
	jz LB_57427
LB_57429:
	add r14,1
	cmp r14,r10
	jg LB_57432
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_57432
	jmp LB_57433
LB_57432:
	jmp LB_57420
LB_57433:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_57435
LB_57434:
	add r14,1
LB_57435:
	cmp r14,r10
	jge LB_57436
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57434
	cmp al,10
	jz LB_57434
	cmp al,32
	jz LB_57434
LB_57436:
	push r10
	call NS_E_57235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57437
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57438
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57438:
	jmp LB_57420
LB_57437:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_57441
LB_57440:
	add r14,1
LB_57441:
	cmp r14,r10
	jge LB_57442
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57440
	cmp al,10
	jz LB_57440
	cmp al,32
	jz LB_57440
LB_57442:
	add r14,1
	cmp r14,r10
	jg LB_57447
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_57447
	jmp LB_57448
LB_57447:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57444
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57444:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57445
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57445:
	jmp LB_57420
LB_57448:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57425
	btr r12,2
	jmp LB_57426
LB_57425:
	bts r12,2
LB_57426:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57423
	btr r12,1
	jmp LB_57424
LB_57423:
	bts r12,1
LB_57424:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57421
	btr r12,0
	jmp LB_57422
LB_57421:
	bts r12,0
LB_57422:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57417
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_57449
	btr r12,3
	jmp LB_57450
LB_57449:
	bts r12,3
LB_57450:
	mov r13,r14
	bt r12,1
	jc LB_57451
	btr r12,0
	jmp LB_57452
LB_57451:
	bts r12,0
LB_57452:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57259 ⊢ %_57260 : %_57260
 ; {>  %_57259~0':_p55430 }
; _some 0' ⊢ °0◂0'
; ∎ %_57260
 ; {>  %_57260~°0◂0':(_opn)◂(_p55430) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57415
	btr r12,3
	jmp LB_57416
LB_57415:
	bts r12,3
LB_57416:
	mov r8,0
	bts r12,2
	ret
LB_57417:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57419
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57418
LB_57419:
	add rsp,8
	ret
LB_57420:
	add rsp,48
	pop r14
LB_57418:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; var
	jmp LB_57464
LB_57463:
	add r14,1
LB_57464:
	cmp r14,r10
	jge LB_57465
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57463
	cmp al,10
	jz LB_57463
	cmp al,32
	jz LB_57463
LB_57465:
	push r10
	call NS_E_57239_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57466
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57460
LB_57466:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57461
	btr r12,0
	jmp LB_57462
LB_57461:
	bts r12,0
LB_57462:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57457
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55484 %_57261 ⊢ %_57262 : %_57262
 ; {>  %_57261~0':_stg }
; _f55484 0' ⊢ °3◂0'
; _some %_57262 ⊢ %_57263 : %_57263
 ; {>  %_57262~°3◂0':_p55430 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_57263
 ; {>  %_57263~°0◂°3◂0':(_opn)◂(_p55430) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57455
	btr r12,3
	jmp LB_57456
LB_57455:
	bts r12,3
LB_57456:
	mov rsi,1
	bt r12,3
	jc LB_57453
	mov rsi,0
	bt r9,0
	jc LB_57453
	jmp LB_57454
LB_57453:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57454:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57457:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57459
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57458
LB_57459:
	add rsp,8
	ret
LB_57460:
	add rsp,16
	pop r14
LB_57458:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_57479
LB_57478:
	add r14,1
LB_57479:
	cmp r14,r10
	jge LB_57480
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57478
	cmp al,10
	jz LB_57478
	cmp al,32
	jz LB_57478
LB_57480:
	push r10
	call NS_E_56505_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57481
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57475
LB_57481:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57476
	btr r12,0
	jmp LB_57477
LB_57476:
	bts r12,0
LB_57477:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57472
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55483 %_57264 ⊢ %_57265 : %_57265
 ; {>  %_57264~0':_p55407 }
; _f55483 0' ⊢ °2◂0'
; _some %_57265 ⊢ %_57266 : %_57266
 ; {>  %_57265~°2◂0':_p55430 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_57266
 ; {>  %_57266~°0◂°2◂0':(_opn)◂(_p55430) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57470
	btr r12,3
	jmp LB_57471
LB_57470:
	bts r12,3
LB_57471:
	mov rsi,1
	bt r12,3
	jc LB_57468
	mov rsi,0
	bt r9,0
	jc LB_57468
	jmp LB_57469
LB_57468:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57469:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57472:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57474
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57473
LB_57474:
	add rsp,8
	ret
LB_57475:
	add rsp,16
	pop r14
LB_57473:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57239:
NS_E_RDI_57239:
NS_E_57239_ETR_TBL:
NS_E_57239_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57496
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57488
LB_57496:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_57504
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_57504
	jmp LB_57505
LB_57504:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57502
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57502:
	jmp LB_57488
LB_57505:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57491
	btr r12,1
	jmp LB_57492
LB_57491:
	bts r12,1
LB_57492:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57489
	btr r12,0
	jmp LB_57490
LB_57489:
	bts r12,0
LB_57490:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_57485
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57267 ⊢ %_57268 : %_57268
 ; {>  %_57267~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_57268
 ; {>  %_57268~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57483
	btr r12,3
	jmp LB_57484
LB_57483:
	bts r12,3
LB_57484:
	mov r8,0
	bts r12,2
	ret
LB_57485:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57487
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57486
LB_57487:
	add rsp,8
	ret
LB_57488:
	add rsp,32
	pop r14
LB_57486:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57506:
NS_E_RDI_57506:
NS_E_57506_ETR_TBL:
NS_E_57506_TBL:
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
LB_57871:
	jmp LB_57868
LB_57867:
	add r14,1
LB_57868:
	cmp r14,r10
	jge LB_57869
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57867
	cmp al,10
	jz LB_57867
	cmp al,32
	jz LB_57867
LB_57869:
	push r10
	push rsi
	call NS_E_57507_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_57870
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_57872
	bts QWORD [rax],0
LB_57872:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_57871
LB_57870:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57865
	btr r12,0
	jmp LB_57866
LB_57865:
	bts r12,0
LB_57866:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_57861
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f54781 %_57548 ⊢ %_57549 : %_57549
 ; {>  %_57548~0':(_lst)◂(_p55413) }
; _f54781 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_54781
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_57549 ⊢ %_57550 : %_57550
 ; {>  %_57549~0':(_lst)◂(_p55413) }
; _some 0' ⊢ °0◂0'
; ∎ %_57550
 ; {>  %_57550~°0◂0':(_opn)◂((_lst)◂(_p55413)) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57859
	btr r12,3
	jmp LB_57860
LB_57859:
	bts r12,3
LB_57860:
	mov r8,0
	bts r12,2
	ret
LB_57861:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57863
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57862
LB_57863:
	add rsp,8
	ret
LB_57864:
	add rsp,16
	pop r14
LB_57862:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57507:
NS_E_RDI_57507:
NS_E_57507_ETR_TBL:
NS_E_57507_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167+s8"
	jmp LB_57903
LB_57902:
	add r14,1
LB_57903:
	cmp r14,r10
	jge LB_57904
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57902
	cmp al,10
	jz LB_57902
	cmp al,32
	jz LB_57902
LB_57904:
	add r14,7
	cmp r14,r10
	jg LB_57907
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_57907
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_57907
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_57907
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_57907
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_57907
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_57907
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_57907
	jmp LB_57908
LB_57907:
	jmp LB_57882
LB_57908:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr
	jmp LB_57891
LB_57890:
	add r14,1
LB_57891:
	cmp r14,r10
	jge LB_57892
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57890
	cmp al,10
	jz LB_57890
	cmp al,32
	jz LB_57890
LB_57892:
	push r10
	call NS_E_57534_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57893
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57894
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57894:
	jmp LB_57883
LB_57893:
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
LB_57900:
	jmp LB_57897
LB_57896:
	add r14,1
LB_57897:
	cmp r14,r10
	jge LB_57898
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57896
	cmp al,10
	jz LB_57896
	cmp al,32
	jz LB_57896
LB_57898:
	push r10
	push rsi
	call NS_E_57534_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_57899
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_57901
	bts QWORD [rax],0
LB_57901:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_57900
LB_57899:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57888
	btr r12,2
	jmp LB_57889
LB_57888:
	bts r12,2
LB_57889:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57886
	btr r12,1
	jmp LB_57887
LB_57886:
	bts r12,1
LB_57887:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57884
	btr r12,0
	jmp LB_57885
LB_57884:
	bts r12,0
LB_57885:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57879
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_57909
	btr r12,3
	jmp LB_57910
LB_57909:
	bts r12,3
LB_57910:
	mov r14,r8
	bt r12,2
	jc LB_57911
	btr r12,1
	jmp LB_57912
LB_57911:
	bts r12,1
LB_57912:
	mov r8,r13
	bt r12,0
	jc LB_57913
	btr r12,2
	jmp LB_57914
LB_57913:
	bts r12,2
LB_57914:
	mov r13,r9
	bt r12,3
	jc LB_57915
	btr r12,0
	jmp LB_57916
LB_57915:
	bts r12,0
LB_57916:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_57553 : %_57553
 ; {>  %_57551~0':_p57533 %_57552~1':(_lst)◂(_p57533) }
; _nil {  } ⊢ °1◂{  }
; _f55441 %_57553 ⊢ %_57554 : %_57554
 ; {>  %_57551~0':_p57533 %_57553~°1◂{  }:(_lst)◂(t19219'(0)) %_57552~1':(_lst)◂(_p57533) }
; _f55441 °1◂{  } ⊢ °1◂°1◂{  }
; _some %_57554 ⊢ %_57555 : %_57555
 ; {>  %_57551~0':_p57533 %_57552~1':(_lst)◂(_p57533) %_57554~°1◂°1◂{  }:_p55413 }
; _some °1◂°1◂{  } ⊢ °0◂°1◂°1◂{  }
; ∎ %_57555
 ; {>  %_57551~0':_p57533 %_57555~°0◂°1◂°1◂{  }:(_opn)◂(_p55413) %_57552~1':(_lst)◂(_p57533) }
; 	∎ °0◂°1◂°1◂{  }
	bt r12,0
	jc LB_57873
	mov rdi,r13
	call dlt
LB_57873:
	bt r12,1
	jc LB_57874
	mov rdi,r14
	call dlt
LB_57874:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_57877
	mov rsi,0
	bt r9,0
	jc LB_57877
	jmp LB_57878
LB_57877:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57878:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_57875
	mov rsi,0
	bt r9,0
	jc LB_57875
	jmp LB_57876
LB_57875:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57876:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57879:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57881
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57880
LB_57881:
	add rsp,8
	ret
LB_57883:
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
LB_57882:
	add rsp,48
	pop r14
LB_57880:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_57952
LB_57951:
	add r14,1
LB_57952:
	cmp r14,r10
	jge LB_57953
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57951
	cmp al,10
	jz LB_57951
	cmp al,32
	jz LB_57951
LB_57953:
	add r14,4
	cmp r14,r10
	jg LB_57956
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_57956
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_57956
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_57956
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_57956
	jmp LB_57957
LB_57956:
	jmp LB_57930
LB_57957:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_57939
LB_57938:
	add r14,1
LB_57939:
	cmp r14,r10
	jge LB_57940
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57938
	cmp al,10
	jz LB_57938
	cmp al,32
	jz LB_57938
LB_57940:
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57941
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57942
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57942:
	jmp LB_57931
LB_57941:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_57945
LB_57944:
	add r14,1
LB_57945:
	cmp r14,r10
	jge LB_57946
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57944
	cmp al,10
	jz LB_57944
	cmp al,32
	jz LB_57944
LB_57946:
	push r10
	call NS_E_57508_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57947
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_57948
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_57948:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57949
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57949:
	jmp LB_57931
LB_57947:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_57936
	btr r12,2
	jmp LB_57937
LB_57936:
	bts r12,2
LB_57937:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57934
	btr r12,1
	jmp LB_57935
LB_57934:
	bts r12,1
LB_57935:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57932
	btr r12,0
	jmp LB_57933
LB_57932:
	bts r12,0
LB_57933:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_57927
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_57958
	btr r12,3
	jmp LB_57959
LB_57958:
	bts r12,3
LB_57959:
	mov r14,r8
	bt r12,2
	jc LB_57960
	btr r12,1
	jmp LB_57961
LB_57960:
	bts r12,1
LB_57961:
	mov r8,r13
	bt r12,0
	jc LB_57962
	btr r12,2
	jmp LB_57963
LB_57962:
	bts r12,2
LB_57963:
	mov r13,r9
	bt r12,3
	jc LB_57964
	btr r12,0
	jmp LB_57965
LB_57964:
	bts r12,0
LB_57965:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55440 { %_57556 %_57557 } ⊢ %_57558 : %_57558
 ; {>  %_57556~0':_stg %_57557~1':_p55414 }
; _f55440 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57558 ⊢ %_57559 : %_57559
 ; {>  %_57558~°0◂{ 0' 1' }:_p55413 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57559
 ; {>  %_57559~°0◂°0◂{ 0' 1' }:(_opn)◂(_p55413) }
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
	jc LB_57921
	btr r12,2
	jmp LB_57922
LB_57921:
	bts r12,2
LB_57922:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_57919
	btr QWORD [rdi],0
	jmp LB_57920
LB_57919:
	bts QWORD [rdi],0
LB_57920:
	mov r8,r14
	bt r12,1
	jc LB_57925
	btr r12,2
	jmp LB_57926
LB_57925:
	bts r12,2
LB_57926:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_57923
	btr QWORD [rdi],1
	jmp LB_57924
LB_57923:
	bts QWORD [rdi],1
LB_57924:
	mov rsi,1
	bt r12,3
	jc LB_57917
	mov rsi,0
	bt r9,0
	jc LB_57917
	jmp LB_57918
LB_57917:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_57918:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_57927:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57929
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57928
LB_57929:
	add rsp,8
	ret
LB_57931:
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
LB_57930:
	add rsp,48
	pop r14
LB_57928:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_57984
LB_57983:
	add r14,1
LB_57984:
	cmp r14,r10
	jge LB_57985
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57983
	cmp al,10
	jz LB_57983
	cmp al,32
	jz LB_57983
LB_57985:
	add r14,2
	cmp r14,r10
	jg LB_57988
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_57988
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_57988
	jmp LB_57989
LB_57988:
	jmp LB_57971
LB_57989:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_57978
LB_57977:
	add r14,1
LB_57978:
	cmp r14,r10
	jge LB_57979
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_57977
	cmp al,10
	jz LB_57977
	cmp al,32
	jz LB_57977
LB_57979:
	push r10
	call NS_E_57516_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_57980
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_57981
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_57981:
	jmp LB_57972
LB_57980:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_57975
	btr r12,1
	jmp LB_57976
LB_57975:
	bts r12,1
LB_57976:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_57973
	btr r12,0
	jmp LB_57974
LB_57973:
	bts r12,0
LB_57974:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_57968
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_57990
	btr r12,2
	jmp LB_57991
LB_57990:
	bts r12,2
LB_57991:
	mov r13,r14
	bt r12,1
	jc LB_57992
	btr r12,0
	jmp LB_57993
LB_57992:
	bts r12,0
LB_57993:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57560 ⊢ %_57561 : %_57561
 ; {>  %_57560~0':_p55413 }
; _some 0' ⊢ °0◂0'
; ∎ %_57561
 ; {>  %_57561~°0◂0':(_opn)◂(_p55413) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57966
	btr r12,3
	jmp LB_57967
LB_57966:
	bts r12,3
LB_57967:
	mov r8,0
	bts r12,2
	ret
LB_57968:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57970
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57969
LB_57970:
	add rsp,8
	ret
LB_57972:
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
LB_57971:
	add rsp,32
	pop r14
LB_57969:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_58005
LB_58004:
	add r14,1
LB_58005:
	cmp r14,r10
	jge LB_58006
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58004
	cmp al,10
	jz LB_58004
	cmp al,32
	jz LB_58004
LB_58006:
	add r14,2
	cmp r14,r10
	jg LB_58009
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_58009
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_58009
	jmp LB_58010
LB_58009:
	jmp LB_57999
LB_58010:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_58012
LB_58011:
	add r14,1
LB_58012:
	cmp r14,r10
	jge LB_58013
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58011
	cmp al,10
	jz LB_58011
	cmp al,32
	jz LB_58011
LB_58013:
	push r10
	call NS_E_57510_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58014
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58015
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58015:
	jmp LB_57999
LB_58014:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58002
	btr r12,1
	jmp LB_58003
LB_58002:
	bts r12,1
LB_58003:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58000
	btr r12,0
	jmp LB_58001
LB_58000:
	bts r12,0
LB_58001:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_57996
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_58017
	btr r12,2
	jmp LB_58018
LB_58017:
	bts r12,2
LB_58018:
	mov r13,r14
	bt r12,1
	jc LB_58019
	btr r12,0
	jmp LB_58020
LB_58019:
	bts r12,0
LB_58020:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57562 ⊢ %_57563 : %_57563
 ; {>  %_57562~0':_p55413 }
; _some 0' ⊢ °0◂0'
; ∎ %_57563
 ; {>  %_57563~°0◂0':(_opn)◂(_p55413) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_57994
	btr r12,3
	jmp LB_57995
LB_57994:
	bts r12,3
LB_57995:
	mov r8,0
	bts r12,2
	ret
LB_57996:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_57998
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_57997
LB_57998:
	add rsp,8
	ret
LB_57999:
	add rsp,32
	pop r14
LB_57997:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57508:
NS_E_RDI_57508:
NS_E_57508_ETR_TBL:
NS_E_57508_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_58041
LB_58040:
	add r14,1
LB_58041:
	cmp r14,r10
	jge LB_58042
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58040
	cmp al,10
	jz LB_58040
	cmp al,32
	jz LB_58040
LB_58042:
	add r14,1
	cmp r14,r10
	jg LB_58045
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_58045
	jmp LB_58046
LB_58045:
	jmp LB_58028
LB_58046:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_58035
LB_58034:
	add r14,1
LB_58035:
	cmp r14,r10
	jge LB_58036
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58034
	cmp al,10
	jz LB_58034
	cmp al,32
	jz LB_58034
LB_58036:
	push r10
	call NS_E_56505_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58037
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58038
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58038:
	jmp LB_58029
LB_58037:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58032
	btr r12,1
	jmp LB_58033
LB_58032:
	bts r12,1
LB_58033:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58030
	btr r12,0
	jmp LB_58031
LB_58030:
	bts r12,0
LB_58031:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_58025
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_58047
	btr r12,2
	jmp LB_58048
LB_58047:
	bts r12,2
LB_58048:
	mov r13,r14
	bt r12,1
	jc LB_58049
	btr r12,0
	jmp LB_58050
LB_58049:
	bts r12,0
LB_58050:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55447 %_57564 ⊢ %_57565 : %_57565
 ; {>  %_57564~0':_p55407 }
; _f55447 0' ⊢ °1◂0'
; _some %_57565 ⊢ %_57566 : %_57566
 ; {>  %_57565~°1◂0':_p55414 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57566
 ; {>  %_57566~°0◂°1◂0':(_opn)◂(_p55414) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_58023
	btr r12,3
	jmp LB_58024
LB_58023:
	bts r12,3
LB_58024:
	mov rsi,1
	bt r12,3
	jc LB_58021
	mov rsi,0
	bt r9,0
	jc LB_58021
	jmp LB_58022
LB_58021:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58022:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58025:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58027
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58026
LB_58027:
	add rsp,8
	ret
LB_58029:
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
LB_58028:
	add rsp,32
	pop r14
LB_58026:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_58062
LB_58061:
	add r14,1
LB_58062:
	cmp r14,r10
	jge LB_58063
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58061
	cmp al,10
	jz LB_58061
	cmp al,32
	jz LB_58061
LB_58063:
	push r10
	call NS_E_57509_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58064
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58058
LB_58064:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58059
	btr r12,0
	jmp LB_58060
LB_58059:
	bts r12,0
LB_58060:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_58055
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55446 %_57567 ⊢ %_57568 : %_57568
 ; {>  %_57567~0':(_lst)◂(_p55413) }
; _f55446 0' ⊢ °0◂0'
; _some %_57568 ⊢ %_57569 : %_57569
 ; {>  %_57568~°0◂0':_p55414 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57569
 ; {>  %_57569~°0◂°0◂0':(_opn)◂(_p55414) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_58053
	btr r12,3
	jmp LB_58054
LB_58053:
	bts r12,3
LB_58054:
	mov rsi,1
	bt r12,3
	jc LB_58051
	mov rsi,0
	bt r9,0
	jc LB_58051
	jmp LB_58052
LB_58051:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58052:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58055:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58057
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58056
LB_58057:
	add rsp,8
	ret
LB_58058:
	add rsp,16
	pop r14
LB_58056:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57509:
NS_E_RDI_57509:
NS_E_57509_ETR_TBL:
NS_E_57509_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_58075
LB_58074:
	add r14,1
LB_58075:
	cmp r14,r10
	jge LB_58076
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58074
	cmp al,10
	jz LB_58074
	cmp al,32
	jz LB_58074
LB_58076:
	add r14,6
	cmp r14,r10
	jg LB_58079
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_58079
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_58079
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_58079
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_58079
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_58079
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_58079
	jmp LB_58080
LB_58079:
	jmp LB_58071
LB_58080:
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
	jc LB_58072
	btr r12,0
	jmp LB_58073
LB_58072:
	bts r12,0
LB_58073:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_58068
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_57570 : %_57570
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57570 ⊢ %_57571 : %_57571
 ; {>  %_57570~°1◂{  }:(_lst)◂(t19244'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57571
 ; {>  %_57571~°0◂°1◂{  }:(_opn)◂((_lst)◂(t19247'(0))) }
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
	jc LB_58066
	mov rsi,0
	bt r9,0
	jc LB_58066
	jmp LB_58067
LB_58066:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58067:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58068:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58070
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58069
LB_58070:
	add rsp,8
	ret
LB_58071:
	add rsp,16
	pop r14
LB_58069:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; glb_etr
	jmp LB_58100
LB_58099:
	add r14,1
LB_58100:
	cmp r14,r10
	jge LB_58101
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58099
	cmp al,10
	jz LB_58099
	cmp al,32
	jz LB_58099
LB_58101:
	push r10
	call NS_E_57507_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58102
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58094
LB_58102:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_58105
LB_58104:
	add r14,1
LB_58105:
	cmp r14,r10
	jge LB_58106
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58104
	cmp al,10
	jz LB_58104
	cmp al,32
	jz LB_58104
LB_58106:
	push r10
	call NS_E_57509_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58107
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58108
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58108:
	jmp LB_58094
LB_58107:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58097
	btr r12,1
	jmp LB_58098
LB_58097:
	bts r12,1
LB_58098:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58095
	btr r12,0
	jmp LB_58096
LB_58095:
	bts r12,0
LB_58096:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_58091
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_57572 %_57573 } ⊢ %_57574 : %_57574
 ; {>  %_57573~1':(_lst)◂(_p55413) %_57572~0':_p55413 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57574 ⊢ %_57575 : %_57575
 ; {>  %_57574~°0◂{ 0' 1' }:(_lst)◂(_p55413) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57575
 ; {>  %_57575~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p55413)) }
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
	jc LB_58085
	btr r12,2
	jmp LB_58086
LB_58085:
	bts r12,2
LB_58086:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_58083
	btr QWORD [rdi],0
	jmp LB_58084
LB_58083:
	bts QWORD [rdi],0
LB_58084:
	mov r8,r14
	bt r12,1
	jc LB_58089
	btr r12,2
	jmp LB_58090
LB_58089:
	bts r12,2
LB_58090:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_58087
	btr QWORD [rdi],1
	jmp LB_58088
LB_58087:
	bts QWORD [rdi],1
LB_58088:
	mov rsi,1
	bt r12,3
	jc LB_58081
	mov rsi,0
	bt r9,0
	jc LB_58081
	jmp LB_58082
LB_58081:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58082:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58091:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58093
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58092
LB_58093:
	add rsp,8
	ret
LB_58094:
	add rsp,32
	pop r14
LB_58092:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57510:
NS_E_RDI_57510:
NS_E_57510_ETR_TBL:
NS_E_57510_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_58165
LB_58164:
	add r14,1
LB_58165:
	cmp r14,r10
	jge LB_58166
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58164
	cmp al,10
	jz LB_58164
	cmp al,32
	jz LB_58164
LB_58166:
	add r14,1
	cmp r14,r10
	jg LB_58169
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_58169
	jmp LB_58170
LB_58169:
	jmp LB_58131
LB_58170:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_58142
LB_58141:
	add r14,1
LB_58142:
	cmp r14,r10
	jge LB_58143
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58141
	cmp al,10
	jz LB_58141
	cmp al,32
	jz LB_58141
LB_58143:
	add r14,1
	cmp r14,r10
	jg LB_58147
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_58147
	jmp LB_58148
LB_58147:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58145
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58145:
	jmp LB_58132
LB_58148:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_58150
LB_58149:
	add r14,1
LB_58150:
	cmp r14,r10
	jge LB_58151
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58149
	cmp al,10
	jz LB_58149
	cmp al,32
	jz LB_58149
LB_58151:
	push r10
	call NS_E_57511_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58152
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58153
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58153:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58154
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58154:
	jmp LB_58132
LB_58152:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_58157
LB_58156:
	add r14,1
LB_58157:
	cmp r14,r10
	jge LB_58158
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58156
	cmp al,10
	jz LB_58156
	cmp al,32
	jz LB_58156
LB_58158:
	push r10
	call NS_E_57514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58159
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58160
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58160:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58161
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58161:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58162
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58162:
	jmp LB_58132
LB_58159:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58139
	btr r12,3
	jmp LB_58140
LB_58139:
	bts r12,3
LB_58140:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58137
	btr r12,2
	jmp LB_58138
LB_58137:
	bts r12,2
LB_58138:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58135
	btr r12,1
	jmp LB_58136
LB_58135:
	bts r12,1
LB_58136:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58133
	btr r12,0
	jmp LB_58134
LB_58133:
	bts r12,0
LB_58134:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_58128
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_58171
	btr r12,4
	jmp LB_58172
LB_58171:
	bts r12,4
LB_58172:
	mov r8,r9
	bt r12,3
	jc LB_58173
	btr r12,2
	jmp LB_58174
LB_58173:
	bts r12,2
LB_58174:
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_58177
	btr r12,3
	jmp LB_58178
LB_58177:
	bts r12,3
LB_58178:
	mov r13,r9
	bt r12,3
	jc LB_58175
	btr r12,0
	jmp LB_58176
LB_58175:
	bts r12,0
LB_58176:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_58181
	btr r12,3
	jmp LB_58182
LB_58181:
	bts r12,3
LB_58182:
	mov r14,r9
	bt r12,3
	jc LB_58179
	btr r12,1
	jmp LB_58180
LB_58179:
	bts r12,1
LB_58180:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_57576 %_57577 } ⊢ %_57578 : %_57578
 ; {>  %_57577~2':(_lst)◂({ _stg _p55416 }) %_57576~{ 0' 1' }:{ _stg _p55416 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f55445 %_57578 ⊢ %_57579 : %_57579
 ; {>  %_57578~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p55416 }) }
; _f55445 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_57579 ⊢ %_57580 : %_57580
 ; {>  %_57579~°5◂°0◂{ { 0' 1' } 2' }:_p55413 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_57580
 ; {>  %_57580~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p55413) }
; 	∎ °0◂°5◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°5◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_58118
	btr r12,5
	jmp LB_58119
LB_58118:
	bts r12,5
LB_58119:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_58116
	btr QWORD [rdi],0
	jmp LB_58117
LB_58116:
	bts QWORD [rdi],0
LB_58117:
	mov r11,r14
	bt r12,1
	jc LB_58122
	btr r12,5
	jmp LB_58123
LB_58122:
	bts r12,5
LB_58123:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_58120
	btr QWORD [rdi],1
	jmp LB_58121
LB_58120:
	bts QWORD [rdi],1
LB_58121:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_58114
	btr QWORD [rdi],0
	jmp LB_58115
LB_58114:
	bts QWORD [rdi],0
LB_58115:
	mov r10,r8
	bt r12,2
	jc LB_58126
	btr r12,4
	jmp LB_58127
LB_58126:
	bts r12,4
LB_58127:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_58124
	btr QWORD [rdi],1
	jmp LB_58125
LB_58124:
	bts QWORD [rdi],1
LB_58125:
	mov rsi,1
	bt r12,3
	jc LB_58112
	mov rsi,0
	bt r9,0
	jc LB_58112
	jmp LB_58113
LB_58112:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58113:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_58110
	mov rsi,0
	bt r9,0
	jc LB_58110
	jmp LB_58111
LB_58110:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58111:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58128:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58130
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58129
LB_58130:
	add rsp,8
	ret
LB_58132:
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
LB_58131:
	add rsp,64
	pop r14
LB_58129:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_58200
LB_58199:
	add r14,1
LB_58200:
	cmp r14,r10
	jge LB_58201
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58199
	cmp al,10
	jz LB_58199
	cmp al,32
	jz LB_58199
LB_58201:
	push r10
	call NS_E_57511_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58202
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58196
LB_58202:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58197
	btr r12,0
	jmp LB_58198
LB_58197:
	bts r12,0
LB_58198:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_58193
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_58204
	btr r12,2
	jmp LB_58205
LB_58204:
	bts r12,2
LB_58205:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_58208
	btr r12,3
	jmp LB_58209
LB_58208:
	bts r12,3
LB_58209:
	mov r13,r9
	bt r12,3
	jc LB_58206
	btr r12,0
	jmp LB_58207
LB_58206:
	bts r12,0
LB_58207:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_58212
	btr r12,3
	jmp LB_58213
LB_58212:
	bts r12,3
LB_58213:
	mov r14,r9
	bt r12,3
	jc LB_58210
	btr r12,1
	jmp LB_58211
LB_58210:
	bts r12,1
LB_58211:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55444 %_57581 ⊢ %_57582 : %_57582
 ; {>  %_57581~{ 0' 1' }:{ _stg _p55416 } }
; _f55444 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_57582 ⊢ %_57583 : %_57583
 ; {>  %_57582~°4◂{ 0' 1' }:_p55413 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_57583
 ; {>  %_57583~°0◂°4◂{ 0' 1' }:(_opn)◂(_p55413) }
; 	∎ °0◂°4◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°4◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_58187
	btr r12,2
	jmp LB_58188
LB_58187:
	bts r12,2
LB_58188:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_58185
	btr QWORD [rdi],0
	jmp LB_58186
LB_58185:
	bts QWORD [rdi],0
LB_58186:
	mov r8,r14
	bt r12,1
	jc LB_58191
	btr r12,2
	jmp LB_58192
LB_58191:
	bts r12,2
LB_58192:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_58189
	btr QWORD [rdi],1
	jmp LB_58190
LB_58189:
	bts QWORD [rdi],1
LB_58190:
	mov rsi,1
	bt r12,3
	jc LB_58183
	mov rsi,0
	bt r9,0
	jc LB_58183
	jmp LB_58184
LB_58183:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58184:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58193:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58195
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58194
LB_58195:
	add rsp,8
	ret
LB_58196:
	add rsp,16
	pop r14
LB_58194:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57511:
NS_E_RDI_57511:
NS_E_57511_ETR_TBL:
NS_E_57511_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; word
	jmp LB_58247
LB_58246:
	add r14,1
LB_58247:
	cmp r14,r10
	jge LB_58248
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58246
	cmp al,10
	jz LB_58246
	cmp al,32
	jz LB_58246
LB_58248:
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58249
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58228
LB_58249:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_58252
LB_58251:
	add r14,1
LB_58252:
	cmp r14,r10
	jge LB_58253
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58251
	cmp al,10
	jz LB_58251
	cmp al,32
	jz LB_58251
LB_58253:
	push r10
	call NS_E_57513_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58254
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58255
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58255:
	jmp LB_58228
LB_58254:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_58258
LB_58257:
	add r14,1
LB_58258:
	cmp r14,r10
	jge LB_58259
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58257
	cmp al,10
	jz LB_58257
	cmp al,32
	jz LB_58257
LB_58259:
	add r14,1
	cmp r14,r10
	jg LB_58264
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_58264
	jmp LB_58265
LB_58264:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58261
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58261:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58262
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58262:
	jmp LB_58228
LB_58265:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_58239
LB_58238:
	add r14,1
LB_58239:
	cmp r14,r10
	jge LB_58240
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58238
	cmp al,10
	jz LB_58238
	cmp al,32
	jz LB_58238
LB_58240:
	push r10
	call NS_E_57235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58241
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58242
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58242:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58243
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58243:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58244
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58244:
	jmp LB_58229
LB_58241:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58236
	btr r12,3
	jmp LB_58237
LB_58236:
	bts r12,3
LB_58237:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58234
	btr r12,2
	jmp LB_58235
LB_58234:
	bts r12,2
LB_58235:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58232
	btr r12,1
	jmp LB_58233
LB_58232:
	bts r12,1
LB_58233:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58230
	btr r12,0
	jmp LB_58231
LB_58230:
	bts r12,0
LB_58231:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_58225
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_58266
	btr r12,4
	jmp LB_58267
LB_58266:
	bts r12,4
LB_58267:
	mov r8,r9
	bt r12,3
	jc LB_58268
	btr r12,2
	jmp LB_58269
LB_58268:
	bts r12,2
LB_58269:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55452 %_57586 ⊢ %_57587 : %_57587
 ; {>  %_57586~2':_p55430 %_57585~1':_p57512 %_57584~0':_stg }
; _f55452 2' ⊢ °1◂2'
; _some { %_57584 %_57587 } ⊢ %_57588 : %_57588
 ; {>  %_57585~1':_p57512 %_57584~0':_stg %_57587~°1◂2':_p55416 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_57588
 ; {>  %_57585~1':_p57512 %_57588~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p55416 }) }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_58214
	mov rdi,r14
	call dlt
LB_58214:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_58217
	btr r12,1
	jmp LB_58218
LB_58217:
	bts r12,1
LB_58218:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_58215
	btr QWORD [rdi],0
	jmp LB_58216
LB_58215:
	bts QWORD [rdi],0
LB_58216:
	mov r14,r8
	bt r12,2
	jc LB_58223
	btr r12,1
	jmp LB_58224
LB_58223:
	bts r12,1
LB_58224:
	mov rsi,1
	bt r12,1
	jc LB_58221
	mov rsi,0
	bt r14,0
	jc LB_58221
	jmp LB_58222
LB_58221:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_58222:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_58219
	btr QWORD [rdi],1
	jmp LB_58220
LB_58219:
	bts QWORD [rdi],1
LB_58220:
	mov r8,0
	bts r12,2
	ret
LB_58225:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58227
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58226
LB_58227:
	add rsp,8
	ret
LB_58229:
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
LB_58228:
	add rsp,64
	pop r14
LB_58226:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,112
; word
	jmp LB_58316
LB_58315:
	add r14,1
LB_58316:
	cmp r14,r10
	jge LB_58317
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58315
	cmp al,10
	jz LB_58315
	cmp al,32
	jz LB_58315
LB_58317:
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58318
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58300
LB_58318:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_58321
LB_58320:
	add r14,1
LB_58321:
	cmp r14,r10
	jge LB_58322
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58320
	cmp al,10
	jz LB_58320
	cmp al,32
	jz LB_58320
LB_58322:
	push r10
	call NS_E_57513_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58323
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58324
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58324:
	jmp LB_58300
LB_58323:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_58327
LB_58326:
	add r14,1
LB_58327:
	cmp r14,r10
	jge LB_58328
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58326
	cmp al,10
	jz LB_58326
	cmp al,32
	jz LB_58326
LB_58328:
	add r14,3
	cmp r14,r10
	jg LB_58333
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_58333
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_58333
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_58333
	jmp LB_58334
LB_58333:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58330
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58330:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58331
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58331:
	jmp LB_58300
LB_58334:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_58336
LB_58335:
	add r14,1
LB_58336:
	cmp r14,r10
	jge LB_58337
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58335
	cmp al,10
	jz LB_58335
	cmp al,32
	jz LB_58335
LB_58337:
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58338
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58339
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58339:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58340
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58340:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58341
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58341:
	jmp LB_58300
LB_58338:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_58344
LB_58343:
	add r14,1
LB_58344:
	cmp r14,r10
	jge LB_58345
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58343
	cmp al,10
	jz LB_58343
	cmp al,32
	jz LB_58343
LB_58345:
	add r14,1
	cmp r14,r10
	jg LB_58352
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_58352
	jmp LB_58353
LB_58352:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_58347
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_58347:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58348
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58348:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58349
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58349:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58350
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58350:
	jmp LB_58300
LB_58353:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_58355
LB_58354:
	add r14,1
LB_58355:
	cmp r14,r10
	jge LB_58356
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58354
	cmp al,10
	jz LB_58354
	cmp al,32
	jz LB_58354
LB_58356:
	push r10
	call NS_E_57235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58357
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_58358
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_58358:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_58359
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_58359:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58360
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58360:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58361
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58361:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58362
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58362:
	jmp LB_58300
LB_58357:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_58365
LB_58364:
	add r14,1
LB_58365:
	cmp r14,r10
	jge LB_58366
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58364
	cmp al,10
	jz LB_58364
	cmp al,32
	jz LB_58364
LB_58366:
	push r10
	call NS_E_57515_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58367
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_58368
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_58368:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_58369
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_58369:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_58370
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_58370:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58371
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58371:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58372
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58372:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58373
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58373:
	jmp LB_58300
LB_58367:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_58313
	btr r12,6
	jmp LB_58314
LB_58313:
	bts r12,6
LB_58314:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_58311
	btr r12,5
	jmp LB_58312
LB_58311:
	bts r12,5
LB_58312:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_58309
	btr r12,4
	jmp LB_58310
LB_58309:
	bts r12,4
LB_58310:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58307
	btr r12,3
	jmp LB_58308
LB_58307:
	bts r12,3
LB_58308:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58305
	btr r12,2
	jmp LB_58306
LB_58305:
	bts r12,2
LB_58306:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58303
	btr r12,1
	jmp LB_58304
LB_58303:
	bts r12,1
LB_58304:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58301
	btr r12,0
	jmp LB_58302
LB_58301:
	bts r12,0
LB_58302:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_58297
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_58375
	btr r12,7
	jmp LB_58376
LB_58375:
	bts r12,7
LB_58376:
	mov r10,rcx
	bt r12,6
	jc LB_58377
	btr r12,4
	jmp LB_58378
LB_58377:
	bts r12,4
LB_58378:
	mov rcx,r9
	bt r12,3
	jc LB_58379
	btr r12,6
	jmp LB_58380
LB_58379:
	bts r12,6
LB_58380:
	mov r9,r11
	bt r12,5
	jc LB_58381
	btr r12,3
	jmp LB_58382
LB_58381:
	bts r12,3
LB_58382:
	mov r11,r8
	bt r12,2
	jc LB_58383
	btr r12,5
	jmp LB_58384
LB_58383:
	bts r12,5
LB_58384:
	mov r8,rcx
	bt r12,6
	jc LB_58385
	btr r12,2
	jmp LB_58386
LB_58385:
	bts r12,2
LB_58386:
; 5' ⊢ {  }
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { { %_57591 %_57592 } %_57593 } ⊢ %_57594 : %_57594
 ; {>  %_57593~4':(_lst)◂({ _stg _p55430 }) %_57589~0':_stg %_57591~2':_stg %_57590~1':_p57512 %_57592~3':_p55430 }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f55451 %_57594 ⊢ %_57595 : %_57595
 ; {>  %_57594~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p55430 }) %_57589~0':_stg %_57590~1':_p57512 }
; _f55451 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_57589 %_57595 } ⊢ %_57596 : %_57596
 ; {>  %_57589~0':_stg %_57590~1':_p57512 %_57595~°0◂°0◂{ { 2' 3' } 4' }:_p55416 }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_57596
 ; {>  %_57590~1':_p57512 %_57596~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p55416 }) }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_58270
	mov rdi,r14
	call dlt
LB_58270:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_58271
	btr r12,1
	jmp LB_58272
LB_58271:
	bts r12,1
LB_58272:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_58275
	btr r12,5
	jmp LB_58276
LB_58275:
	bts r12,5
LB_58276:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_58273
	btr QWORD [rdi],0
	jmp LB_58274
LB_58273:
	bts QWORD [rdi],0
LB_58274:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rcx,r8
	bt r12,2
	jc LB_58287
	btr r12,6
	jmp LB_58288
LB_58287:
	bts r12,6
LB_58288:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_58285
	btr QWORD [rdi],0
	jmp LB_58286
LB_58285:
	bts QWORD [rdi],0
LB_58286:
	mov rcx,r14
	bt r12,1
	jc LB_58291
	btr r12,6
	jmp LB_58292
LB_58291:
	bts r12,6
LB_58292:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_58289
	btr QWORD [rdi],1
	jmp LB_58290
LB_58289:
	bts QWORD [rdi],1
LB_58290:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_58283
	btr QWORD [rdi],0
	jmp LB_58284
LB_58283:
	bts QWORD [rdi],0
LB_58284:
	mov r13,r10
	bt r12,4
	jc LB_58295
	btr r12,0
	jmp LB_58296
LB_58295:
	bts r12,0
LB_58296:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_58293
	btr QWORD [rdi],1
	jmp LB_58294
LB_58293:
	bts QWORD [rdi],1
LB_58294:
	mov rsi,1
	bt r12,5
	jc LB_58281
	mov rsi,0
	bt r11,0
	jc LB_58281
	jmp LB_58282
LB_58281:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_58282:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_58279
	mov rsi,0
	bt r11,0
	jc LB_58279
	jmp LB_58280
LB_58279:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_58280:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_58277
	btr QWORD [rdi],1
	jmp LB_58278
LB_58277:
	bts QWORD [rdi],1
LB_58278:
	mov r8,0
	bts r12,2
	ret
LB_58297:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58299
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58298
LB_58299:
	add rsp,8
	ret
LB_58300:
	add rsp,112
	pop r14
LB_58298:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57513:
NS_E_RDI_57513:
NS_E_57513_ETR_TBL:
NS_E_57513_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_58401
LB_58400:
	add r14,1
LB_58401:
	cmp r14,r10
	jge LB_58402
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58400
	cmp al,10
	jz LB_58400
	cmp al,32
	jz LB_58400
LB_58402:
	add r14,3
	cmp r14,r10
	jg LB_58405
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_58405
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_58405
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_58405
	jmp LB_58406
LB_58405:
	jmp LB_58387
LB_58406:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_58395
LB_58394:
	add r14,1
LB_58395:
	cmp r14,r10
	jge LB_58396
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58394
	cmp al,10
	jz LB_58394
	cmp al,32
	jz LB_58394
LB_58396:
	push r10
	call NS_E_57239_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58397
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58398
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58398:
	jmp LB_58388
LB_58397:
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
	jc LB_58391
	btr QWORD [rdi],1
LB_58391:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58392
	btr QWORD [rdi],0
LB_58392:
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
LB_58388:
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
LB_58387:
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
LB_58389:
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
NS_E_57514:
NS_E_RDI_57514:
NS_E_57514_ETR_TBL:
NS_E_57514_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_58460
LB_58459:
	add r14,1
LB_58460:
	cmp r14,r10
	jge LB_58461
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58459
	cmp al,10
	jz LB_58459
	cmp al,32
	jz LB_58459
LB_58461:
	add r14,1
	cmp r14,r10
	jg LB_58464
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_58464
	jmp LB_58465
LB_58464:
	jmp LB_58426
LB_58465:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_58437
LB_58436:
	add r14,1
LB_58437:
	cmp r14,r10
	jge LB_58438
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58436
	cmp al,10
	jz LB_58436
	cmp al,32
	jz LB_58436
LB_58438:
	add r14,1
	cmp r14,r10
	jg LB_58442
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_58442
	jmp LB_58443
LB_58442:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58440
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58440:
	jmp LB_58427
LB_58443:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_58445
LB_58444:
	add r14,1
LB_58445:
	cmp r14,r10
	jge LB_58446
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58444
	cmp al,10
	jz LB_58444
	cmp al,32
	jz LB_58444
LB_58446:
	push r10
	call NS_E_57511_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58447
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58448
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58448:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58449
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58449:
	jmp LB_58427
LB_58447:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_58452
LB_58451:
	add r14,1
LB_58452:
	cmp r14,r10
	jge LB_58453
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58451
	cmp al,10
	jz LB_58451
	cmp al,32
	jz LB_58451
LB_58453:
	push r10
	call NS_E_57514_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58454
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58455
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58455:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58456
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58456:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58457
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58457:
	jmp LB_58427
LB_58454:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58434
	btr r12,3
	jmp LB_58435
LB_58434:
	bts r12,3
LB_58435:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58432
	btr r12,2
	jmp LB_58433
LB_58432:
	bts r12,2
LB_58433:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58430
	btr r12,1
	jmp LB_58431
LB_58430:
	bts r12,1
LB_58431:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58428
	btr r12,0
	jmp LB_58429
LB_58428:
	bts r12,0
LB_58429:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_58423
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_58466
	btr r12,4
	jmp LB_58467
LB_58466:
	bts r12,4
LB_58467:
	mov r8,r9
	bt r12,3
	jc LB_58468
	btr r12,2
	jmp LB_58469
LB_58468:
	bts r12,2
LB_58469:
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_58472
	btr r12,3
	jmp LB_58473
LB_58472:
	bts r12,3
LB_58473:
	mov r13,r9
	bt r12,3
	jc LB_58470
	btr r12,0
	jmp LB_58471
LB_58470:
	bts r12,0
LB_58471:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_58476
	btr r12,3
	jmp LB_58477
LB_58476:
	bts r12,3
LB_58477:
	mov r14,r9
	bt r12,3
	jc LB_58474
	btr r12,1
	jmp LB_58475
LB_58474:
	bts r12,1
LB_58475:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_57599 %_57600 } ⊢ %_57601 : %_57601
 ; {>  %_57599~{ 0' 1' }:{ _stg _p55416 } %_57600~2':(_lst)◂({ _stg _p55416 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_57601 ⊢ %_57602 : %_57602
 ; {>  %_57601~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p55416 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_57602
 ; {>  %_57602~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p55416 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_58413
	btr r12,5
	jmp LB_58414
LB_58413:
	bts r12,5
LB_58414:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_58411
	btr QWORD [rdi],0
	jmp LB_58412
LB_58411:
	bts QWORD [rdi],0
LB_58412:
	mov r11,r14
	bt r12,1
	jc LB_58417
	btr r12,5
	jmp LB_58418
LB_58417:
	bts r12,5
LB_58418:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_58415
	btr QWORD [rdi],1
	jmp LB_58416
LB_58415:
	bts QWORD [rdi],1
LB_58416:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_58409
	btr QWORD [rdi],0
	jmp LB_58410
LB_58409:
	bts QWORD [rdi],0
LB_58410:
	mov r10,r8
	bt r12,2
	jc LB_58421
	btr r12,4
	jmp LB_58422
LB_58421:
	bts r12,4
LB_58422:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_58419
	btr QWORD [rdi],1
	jmp LB_58420
LB_58419:
	bts QWORD [rdi],1
LB_58420:
	mov rsi,1
	bt r12,3
	jc LB_58407
	mov rsi,0
	bt r9,0
	jc LB_58407
	jmp LB_58408
LB_58407:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58408:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58423:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58425
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58424
LB_58425:
	add rsp,8
	ret
LB_58427:
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
LB_58426:
	add rsp,64
	pop r14
LB_58424:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_58480
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_57603 : %_57603
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57603 ⊢ %_57604 : %_57604
 ; {>  %_57603~°1◂{  }:(_lst)◂(t19291'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57604
 ; {>  %_57604~°0◂°1◂{  }:(_opn)◂((_lst)◂(t19294'(0))) }
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
	jc LB_58478
	mov rsi,0
	bt r9,0
	jc LB_58478
	jmp LB_58479
LB_58478:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58479:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58480:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58482
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58481
LB_58482:
	add rsp,8
	ret
LB_58483:
	add rsp,0
	pop r14
LB_58481:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57515:
NS_E_RDI_57515:
NS_E_57515_ETR_TBL:
NS_E_57515_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_58548
LB_58547:
	add r14,1
LB_58548:
	cmp r14,r10
	jge LB_58549
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58547
	cmp al,10
	jz LB_58547
	cmp al,32
	jz LB_58547
LB_58549:
	add r14,3
	cmp r14,r10
	jg LB_58552
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_58552
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_58552
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_58552
	jmp LB_58553
LB_58552:
	jmp LB_58503
LB_58553:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_58516
LB_58515:
	add r14,1
LB_58516:
	cmp r14,r10
	jge LB_58517
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58515
	cmp al,10
	jz LB_58515
	cmp al,32
	jz LB_58515
LB_58517:
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58518
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58519
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58519:
	jmp LB_58504
LB_58518:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_58522
LB_58521:
	add r14,1
LB_58522:
	cmp r14,r10
	jge LB_58523
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58521
	cmp al,10
	jz LB_58521
	cmp al,32
	jz LB_58521
LB_58523:
	add r14,1
	cmp r14,r10
	jg LB_58528
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_58528
	jmp LB_58529
LB_58528:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58525
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58525:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58526
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58526:
	jmp LB_58504
LB_58529:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_58531
LB_58530:
	add r14,1
LB_58531:
	cmp r14,r10
	jge LB_58532
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58530
	cmp al,10
	jz LB_58530
	cmp al,32
	jz LB_58530
LB_58532:
	push r10
	call NS_E_57235_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58533
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58534
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58534:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58535
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58535:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58536
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58536:
	jmp LB_58504
LB_58533:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_58539
LB_58538:
	add r14,1
LB_58539:
	cmp r14,r10
	jge LB_58540
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58538
	cmp al,10
	jz LB_58538
	cmp al,32
	jz LB_58538
LB_58540:
	push r10
	call NS_E_57515_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58541
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_58542
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_58542:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58543
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58543:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58544
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58544:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58545
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58545:
	jmp LB_58504
LB_58541:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_58513
	btr r12,4
	jmp LB_58514
LB_58513:
	bts r12,4
LB_58514:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58511
	btr r12,3
	jmp LB_58512
LB_58511:
	bts r12,3
LB_58512:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58509
	btr r12,2
	jmp LB_58510
LB_58509:
	bts r12,2
LB_58510:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58507
	btr r12,1
	jmp LB_58508
LB_58507:
	bts r12,1
LB_58508:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58505
	btr r12,0
	jmp LB_58506
LB_58505:
	bts r12,0
LB_58506:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_58500
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_58554
	btr r12,5
	jmp LB_58555
LB_58554:
	bts r12,5
LB_58555:
	mov r8,r10
	bt r12,4
	jc LB_58556
	btr r12,2
	jmp LB_58557
LB_58556:
	bts r12,2
LB_58557:
	mov r10,r14
	bt r12,1
	jc LB_58558
	btr r12,4
	jmp LB_58559
LB_58558:
	bts r12,4
LB_58559:
	mov r14,r9
	bt r12,3
	jc LB_58560
	btr r12,1
	jmp LB_58561
LB_58560:
	bts r12,1
LB_58561:
	mov r9,r13
	bt r12,0
	jc LB_58562
	btr r12,3
	jmp LB_58563
LB_58562:
	bts r12,3
LB_58563:
	mov r13,r10
	bt r12,4
	jc LB_58564
	btr r12,0
	jmp LB_58565
LB_58564:
	bts r12,0
LB_58565:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { { %_57605 %_57606 } %_57607 } ⊢ %_57608 : %_57608
 ; {>  %_57606~1':_p55430 %_57605~0':_stg %_57607~2':(_lst)◂({ _stg _p55430 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_57608 ⊢ %_57609 : %_57609
 ; {>  %_57608~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p55430 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_57609
 ; {>  %_57609~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p55430 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_58490
	btr r12,5
	jmp LB_58491
LB_58490:
	bts r12,5
LB_58491:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_58488
	btr QWORD [rdi],0
	jmp LB_58489
LB_58488:
	bts QWORD [rdi],0
LB_58489:
	mov r11,r14
	bt r12,1
	jc LB_58494
	btr r12,5
	jmp LB_58495
LB_58494:
	bts r12,5
LB_58495:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_58492
	btr QWORD [rdi],1
	jmp LB_58493
LB_58492:
	bts QWORD [rdi],1
LB_58493:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_58486
	btr QWORD [rdi],0
	jmp LB_58487
LB_58486:
	bts QWORD [rdi],0
LB_58487:
	mov r10,r8
	bt r12,2
	jc LB_58498
	btr r12,4
	jmp LB_58499
LB_58498:
	bts r12,4
LB_58499:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_58496
	btr QWORD [rdi],1
	jmp LB_58497
LB_58496:
	bts QWORD [rdi],1
LB_58497:
	mov rsi,1
	bt r12,3
	jc LB_58484
	mov rsi,0
	bt r9,0
	jc LB_58484
	jmp LB_58485
LB_58484:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58485:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58500:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58502
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58501
LB_58502:
	add rsp,8
	ret
LB_58504:
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
LB_58503:
	add rsp,80
	pop r14
LB_58501:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_58568
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_57610 : %_57610
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57610 ⊢ %_57611 : %_57611
 ; {>  %_57610~°1◂{  }:(_lst)◂(t19305'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57611
 ; {>  %_57611~°0◂°1◂{  }:(_opn)◂((_lst)◂(t19308'(0))) }
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
	jc LB_58566
	mov rsi,0
	bt r9,0
	jc LB_58566
	jmp LB_58567
LB_58566:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58567:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58568:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58570
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58569
LB_58570:
	add rsp,8
	ret
LB_58571:
	add rsp,0
	pop r14
LB_58569:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57516:
NS_E_RDI_57516:
NS_E_57516_ETR_TBL:
NS_E_57516_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "@"
	jmp LB_58636
LB_58635:
	add r14,1
LB_58636:
	cmp r14,r10
	jge LB_58637
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58635
	cmp al,10
	jz LB_58635
	cmp al,32
	jz LB_58635
LB_58637:
	add r14,1
	cmp r14,r10
	jg LB_58640
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_58640
	jmp LB_58641
LB_58640:
	jmp LB_58583
LB_58641:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_58598
LB_58597:
	add r14,1
LB_58598:
	cmp r14,r10
	jge LB_58599
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58597
	cmp al,10
	jz LB_58597
	cmp al,32
	jz LB_58597
LB_58599:
	add r14,1
	cmp r14,r10
	jg LB_58603
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_58603
	jmp LB_58604
LB_58603:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58601
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58601:
	jmp LB_58584
LB_58604:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_58606
LB_58605:
	add r14,1
LB_58606:
	cmp r14,r10
	jge LB_58607
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58605
	cmp al,10
	jz LB_58605
	cmp al,32
	jz LB_58605
LB_58607:
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58608
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58609
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58609:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58610
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58610:
	jmp LB_58584
LB_58608:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_58613
LB_58612:
	add r14,1
LB_58613:
	cmp r14,r10
	jge LB_58614
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58612
	cmp al,10
	jz LB_58612
	cmp al,32
	jz LB_58612
LB_58614:
	push r10
	call NS_E_56965_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58615
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58616
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58616:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58617
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58617:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58618
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58618:
	jmp LB_58584
LB_58615:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_58621
LB_58620:
	add r14,1
LB_58621:
	cmp r14,r10
	jge LB_58622
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58620
	cmp al,10
	jz LB_58620
	cmp al,32
	jz LB_58620
LB_58622:
	push r10
	call NS_E_57520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58623
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_58624
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_58624:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58625
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58625:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58626
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58626:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58627
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58627:
	jmp LB_58584
LB_58623:
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
LB_58633:
	jmp LB_58630
LB_58629:
	add r14,1
LB_58630:
	cmp r14,r10
	jge LB_58631
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58629
	cmp al,10
	jz LB_58629
	cmp al,32
	jz LB_58629
LB_58631:
	push r10
	push rsi
	call NS_E_57518_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_58632
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_58634
	bts QWORD [rax],0
LB_58634:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_58633
LB_58632:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_58595
	btr r12,5
	jmp LB_58596
LB_58595:
	bts r12,5
LB_58596:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_58593
	btr r12,4
	jmp LB_58594
LB_58593:
	bts r12,4
LB_58594:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58591
	btr r12,3
	jmp LB_58592
LB_58591:
	bts r12,3
LB_58592:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58589
	btr r12,2
	jmp LB_58590
LB_58589:
	bts r12,2
LB_58590:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58587
	btr r12,1
	jmp LB_58588
LB_58587:
	bts r12,1
LB_58588:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58585
	btr r12,0
	jmp LB_58586
LB_58585:
	bts r12,0
LB_58586:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_58580
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_58642
	btr r12,6
	jmp LB_58643
LB_58642:
	bts r12,6
LB_58643:
	mov r9,r11
	bt r12,5
	jc LB_58644
	btr r12,3
	jmp LB_58645
LB_58644:
	bts r12,3
LB_58645:
	mov r11,r8
	bt r12,2
	jc LB_58646
	btr r12,5
	jmp LB_58647
LB_58646:
	bts r12,5
LB_58647:
	mov r8,r10
	bt r12,4
	jc LB_58648
	btr r12,2
	jmp LB_58649
LB_58648:
	bts r12,2
LB_58649:
	mov r10,r14
	bt r12,1
	jc LB_58650
	btr r12,4
	jmp LB_58651
LB_58650:
	bts r12,4
LB_58651:
	mov r14,rcx
	bt r12,6
	jc LB_58652
	btr r12,1
	jmp LB_58653
LB_58652:
	bts r12,1
LB_58653:
	mov rcx,r13
	bt r12,0
	jc LB_58654
	btr r12,6
	jmp LB_58655
LB_58654:
	bts r12,6
LB_58655:
	mov r13,r11
	bt r12,5
	jc LB_58656
	btr r12,0
	jmp LB_58657
LB_58656:
	bts r12,0
LB_58657:
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_57616 : %_57616
 ; {>  %_57612~0':_stg %_57614~2':_p55432 %_57613~1':_p55429 %_57615~3':(_lst)◂(_p57517) }
; _nil {  } ⊢ °1◂{  }
; _f55443 %_57616 ⊢ %_57617 : %_57617
 ; {>  %_57616~°1◂{  }:(_lst)◂(t19317'(0)) %_57612~0':_stg %_57614~2':_p55432 %_57613~1':_p55429 %_57615~3':(_lst)◂(_p57517) }
; _f55443 °1◂{  } ⊢ °3◂°1◂{  }
; _some %_57617 ⊢ %_57618 : %_57618
 ; {>  %_57617~°3◂°1◂{  }:_p55413 %_57612~0':_stg %_57614~2':_p55432 %_57613~1':_p55429 %_57615~3':(_lst)◂(_p57517) }
; _some °3◂°1◂{  } ⊢ °0◂°3◂°1◂{  }
; ∎ %_57618
 ; {>  %_57618~°0◂°3◂°1◂{  }:(_opn)◂(_p55413) %_57612~0':_stg %_57614~2':_p55432 %_57613~1':_p55429 %_57615~3':(_lst)◂(_p57517) }
; 	∎ °0◂°3◂°1◂{  }
	bt r12,0
	jc LB_58572
	mov rdi,r13
	call dlt
LB_58572:
	bt r12,2
	jc LB_58573
	mov rdi,r8
	call dlt
LB_58573:
	bt r12,1
	jc LB_58574
	mov rdi,r14
	call dlt
LB_58574:
	bt r12,3
	jc LB_58575
	mov rdi,r9
	call dlt
LB_58575:
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°3◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_58578
	mov rsi,0
	bt r9,0
	jc LB_58578
	jmp LB_58579
LB_58578:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58579:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_58576
	mov rsi,0
	bt r9,0
	jc LB_58576
	jmp LB_58577
LB_58576:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58577:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58580:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58582
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58581
LB_58582:
	add rsp,8
	ret
LB_58584:
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
LB_58583:
	add rsp,96
	pop r14
LB_58581:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_58677
LB_58676:
	add r14,1
LB_58677:
	cmp r14,r10
	jge LB_58678
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58676
	cmp al,10
	jz LB_58676
	cmp al,32
	jz LB_58676
LB_58678:
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58679
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58671
LB_58679:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_58682
LB_58681:
	add r14,1
LB_58682:
	cmp r14,r10
	jge LB_58683
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58681
	cmp al,10
	jz LB_58681
	cmp al,32
	jz LB_58681
LB_58683:
	push r10
	call NS_E_57519_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58684
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58685
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58685:
	jmp LB_58671
LB_58684:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58674
	btr r12,1
	jmp LB_58675
LB_58674:
	bts r12,1
LB_58675:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58672
	btr r12,0
	jmp LB_58673
LB_58672:
	bts r12,0
LB_58673:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_58668
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f55442 { %_57619 %_57620 } ⊢ %_57621 : %_57621
 ; {>  %_57619~0':_stg %_57620~1':_p55415 }
; _f55442 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_57621 ⊢ %_57622 : %_57622
 ; {>  %_57621~°2◂{ 0' 1' }:_p55413 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_57622
 ; {>  %_57622~°0◂°2◂{ 0' 1' }:(_opn)◂(_p55413) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_58662
	btr r12,2
	jmp LB_58663
LB_58662:
	bts r12,2
LB_58663:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_58660
	btr QWORD [rdi],0
	jmp LB_58661
LB_58660:
	bts QWORD [rdi],0
LB_58661:
	mov r8,r14
	bt r12,1
	jc LB_58666
	btr r12,2
	jmp LB_58667
LB_58666:
	bts r12,2
LB_58667:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_58664
	btr QWORD [rdi],1
	jmp LB_58665
LB_58664:
	bts QWORD [rdi],1
LB_58665:
	mov rsi,1
	bt r12,3
	jc LB_58658
	mov rsi,0
	bt r9,0
	jc LB_58658
	jmp LB_58659
LB_58658:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58659:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58668:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58670
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58669
LB_58670:
	add rsp,8
	ret
LB_58671:
	add rsp,32
	pop r14
LB_58669:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57518:
NS_E_RDI_57518:
NS_E_57518_ETR_TBL:
NS_E_57518_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "@"
	jmp LB_58695
LB_58694:
	add r14,1
LB_58695:
	cmp r14,r10
	jge LB_58696
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58694
	cmp al,10
	jz LB_58694
	cmp al,32
	jz LB_58694
LB_58696:
	add r14,1
	cmp r14,r10
	jg LB_58699
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_58699
	jmp LB_58700
LB_58699:
	jmp LB_58687
LB_58700:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_58702
LB_58701:
	add r14,1
LB_58702:
	cmp r14,r10
	jge LB_58703
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58701
	cmp al,10
	jz LB_58701
	cmp al,32
	jz LB_58701
LB_58703:
	add r14,1
	cmp r14,r10
	jg LB_58707
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_58707
	jmp LB_58708
LB_58707:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58705
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58705:
	jmp LB_58687
LB_58708:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_58710
LB_58709:
	add r14,1
LB_58710:
	cmp r14,r10
	jge LB_58711
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58709
	cmp al,10
	jz LB_58709
	cmp al,32
	jz LB_58709
LB_58711:
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58712
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58713
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58713:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58714
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58714:
	jmp LB_58687
LB_58712:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_58717
LB_58716:
	add r14,1
LB_58717:
	cmp r14,r10
	jge LB_58718
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58716
	cmp al,10
	jz LB_58716
	cmp al,32
	jz LB_58716
LB_58718:
	push r10
	call NS_E_56965_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58719
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58720
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58720:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58721
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58721:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58722
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58722:
	jmp LB_58687
LB_58719:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_58725
LB_58724:
	add r14,1
LB_58725:
	cmp r14,r10
	jge LB_58726
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58724
	cmp al,10
	jz LB_58724
	cmp al,32
	jz LB_58724
LB_58726:
	push r10
	call NS_E_57520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58727
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_58728
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_58728:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58729
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58729:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58730
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58730:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58731
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58731:
	jmp LB_58687
LB_58727:
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
	jc LB_58688
	btr QWORD [rdi],4
LB_58688:
	mov rax,QWORD [rsp+16*4+8*1]
	mov [rdi+8*1+8*4],rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58689
	btr QWORD [rdi],3
LB_58689:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58690
	btr QWORD [rdi],2
LB_58690:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58691
	btr QWORD [rdi],1
LB_58691:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58692
	btr QWORD [rdi],0
LB_58692:
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
LB_58687:
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
NS_E_57519:
NS_E_RDI_57519:
NS_E_57519_ETR_TBL:
NS_E_57519_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "="
	jmp LB_58753
LB_58752:
	add r14,1
LB_58753:
	cmp r14,r10
	jge LB_58754
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58752
	cmp al,10
	jz LB_58752
	cmp al,32
	jz LB_58752
LB_58754:
	add r14,1
	cmp r14,r10
	jg LB_58757
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_58757
	jmp LB_58758
LB_58757:
	jmp LB_58740
LB_58758:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_58747
LB_58746:
	add r14,1
LB_58747:
	cmp r14,r10
	jge LB_58748
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58746
	cmp al,10
	jz LB_58746
	cmp al,32
	jz LB_58746
LB_58748:
	push r10
	call NS_E_56572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58749
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58750
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58750:
	jmp LB_58741
LB_58749:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58744
	btr r12,1
	jmp LB_58745
LB_58744:
	bts r12,1
LB_58745:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58742
	btr r12,0
	jmp LB_58743
LB_58742:
	bts r12,0
LB_58743:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_58737
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_58759
	btr r12,2
	jmp LB_58760
LB_58759:
	bts r12,2
LB_58760:
	mov r13,r14
	bt r12,1
	jc LB_58761
	btr r12,0
	jmp LB_58762
LB_58761:
	bts r12,0
LB_58762:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55449 %_57624 ⊢ %_57625 : %_57625
 ; {>  %_57624~0':_p55431 }
; _f55449 0' ⊢ °1◂0'
; _some %_57625 ⊢ %_57626 : %_57626
 ; {>  %_57625~°1◂0':_p55415 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57626
 ; {>  %_57626~°0◂°1◂0':(_opn)◂(_p55415) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_58735
	btr r12,3
	jmp LB_58736
LB_58735:
	bts r12,3
LB_58736:
	mov rsi,1
	bt r12,3
	jc LB_58733
	mov rsi,0
	bt r9,0
	jc LB_58733
	jmp LB_58734
LB_58733:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58734:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58737:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58739
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58738
LB_58739:
	add rsp,8
	ret
LB_58741:
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
LB_58740:
	add rsp,32
	pop r14
LB_58738:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_58783
LB_58782:
	add r14,1
LB_58783:
	cmp r14,r10
	jge LB_58784
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58782
	cmp al,10
	jz LB_58782
	cmp al,32
	jz LB_58782
LB_58784:
	add r14,2
	cmp r14,r10
	jg LB_58787
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_58787
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_58787
	jmp LB_58788
LB_58787:
	jmp LB_58770
LB_58788:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_58777
LB_58776:
	add r14,1
LB_58777:
	cmp r14,r10
	jge LB_58778
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58776
	cmp al,10
	jz LB_58776
	cmp al,32
	jz LB_58776
LB_58778:
	push r10
	call NS_E_57520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58779
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58780
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58780:
	jmp LB_58771
LB_58779:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58774
	btr r12,1
	jmp LB_58775
LB_58774:
	bts r12,1
LB_58775:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58772
	btr r12,0
	jmp LB_58773
LB_58772:
	bts r12,0
LB_58773:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_58767
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_58789
	btr r12,2
	jmp LB_58790
LB_58789:
	bts r12,2
LB_58790:
	mov r13,r14
	bt r12,1
	jc LB_58791
	btr r12,0
	jmp LB_58792
LB_58791:
	bts r12,0
LB_58792:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55450 %_57627 ⊢ %_57628 : %_57628
 ; {>  %_57627~0':_p55432 }
; _f55450 0' ⊢ °2◂0'
; _some %_57628 ⊢ %_57629 : %_57629
 ; {>  %_57628~°2◂0':_p55415 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_57629
 ; {>  %_57629~°0◂°2◂0':(_opn)◂(_p55415) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_58765
	btr r12,3
	jmp LB_58766
LB_58765:
	bts r12,3
LB_58766:
	mov rsi,1
	bt r12,3
	jc LB_58763
	mov rsi,0
	bt r9,0
	jc LB_58763
	jmp LB_58764
LB_58763:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58764:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58767:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58769
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58768
LB_58769:
	add rsp,8
	ret
LB_58771:
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
LB_58770:
	add rsp,32
	pop r14
LB_58768:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_58812
LB_58811:
	add r14,1
LB_58812:
	cmp r14,r10
	jge LB_58813
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58811
	cmp al,10
	jz LB_58811
	cmp al,32
	jz LB_58811
LB_58813:
	push r10
	call NS_E_56965_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58814
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58806
LB_58814:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_58817
LB_58816:
	add r14,1
LB_58817:
	cmp r14,r10
	jge LB_58818
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58816
	cmp al,10
	jz LB_58816
	cmp al,32
	jz LB_58816
LB_58818:
	push r10
	call NS_E_57520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58819
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58820
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58820:
	jmp LB_58806
LB_58819:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58809
	btr r12,1
	jmp LB_58810
LB_58809:
	bts r12,1
LB_58810:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58807
	btr r12,0
	jmp LB_58808
LB_58807:
	bts r12,0
LB_58808:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_58803
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f55448 { %_57630 %_57631 } ⊢ %_57632 : %_57632
 ; {>  %_57630~0':_p55429 %_57631~1':_p55432 }
; _f55448 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57632 ⊢ %_57633 : %_57633
 ; {>  %_57632~°0◂{ 0' 1' }:_p55415 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57633
 ; {>  %_57633~°0◂°0◂{ 0' 1' }:(_opn)◂(_p55415) }
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
	jc LB_58797
	btr r12,2
	jmp LB_58798
LB_58797:
	bts r12,2
LB_58798:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_58795
	btr QWORD [rdi],0
	jmp LB_58796
LB_58795:
	bts QWORD [rdi],0
LB_58796:
	mov r8,r14
	bt r12,1
	jc LB_58801
	btr r12,2
	jmp LB_58802
LB_58801:
	bts r12,2
LB_58802:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_58799
	btr QWORD [rdi],1
	jmp LB_58800
LB_58799:
	bts QWORD [rdi],1
LB_58800:
	mov rsi,1
	bt r12,3
	jc LB_58793
	mov rsi,0
	bt r9,0
	jc LB_58793
	jmp LB_58794
LB_58793:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58794:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58803:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58805
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58804
LB_58805:
	add rsp,8
	ret
LB_58806:
	add rsp,32
	pop r14
LB_58804:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57520:
NS_E_RDI_57520:
NS_E_57520_ETR_TBL:
NS_E_57520_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_58835
LB_58834:
	add r14,1
LB_58835:
	cmp r14,r10
	jge LB_58836
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58834
	cmp al,10
	jz LB_58834
	cmp al,32
	jz LB_58834
LB_58836:
	add r14,3
	cmp r14,r10
	jg LB_58839
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_58839
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_58839
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_58839
	jmp LB_58840
LB_58839:
	jmp LB_58829
LB_58840:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_58842
LB_58841:
	add r14,1
LB_58842:
	cmp r14,r10
	jge LB_58843
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58841
	cmp al,10
	jz LB_58841
	cmp al,32
	jz LB_58841
LB_58843:
	push r10
	call NS_E_56701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58844
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58845
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58845:
	jmp LB_58829
LB_58844:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58832
	btr r12,1
	jmp LB_58833
LB_58832:
	bts r12,1
LB_58833:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58830
	btr r12,0
	jmp LB_58831
LB_58830:
	bts r12,0
LB_58831:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_58826
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_58847
	btr r12,2
	jmp LB_58848
LB_58847:
	bts r12,2
LB_58848:
	mov r13,r14
	bt r12,1
	jc LB_58849
	btr r12,0
	jmp LB_58850
LB_58849:
	bts r12,0
LB_58850:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55490 %_57634 ⊢ %_57635 : %_57635
 ; {>  %_57634~0':_p55428 }
; _f55490 0' ⊢ °2◂0'
; _some %_57635 ⊢ %_57636 : %_57636
 ; {>  %_57635~°2◂0':_p55432 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_57636
 ; {>  %_57636~°0◂°2◂0':(_opn)◂(_p55432) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_58824
	btr r12,3
	jmp LB_58825
LB_58824:
	bts r12,3
LB_58825:
	mov rsi,1
	bt r12,3
	jc LB_58822
	mov rsi,0
	bt r9,0
	jc LB_58822
	jmp LB_58823
LB_58822:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58823:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58826:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58828
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58827
LB_58828:
	add rsp,8
	ret
LB_58829:
	add rsp,32
	pop r14
LB_58827:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_58862
LB_58861:
	add r14,1
LB_58862:
	cmp r14,r10
	jge LB_58863
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58861
	cmp al,10
	jz LB_58861
	cmp al,32
	jz LB_58861
LB_58863:
	push r10
	call NS_E_57528_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58864
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58858
LB_58864:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58859
	btr r12,0
	jmp LB_58860
LB_58859:
	bts r12,0
LB_58860:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_58855
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55489 %_57637 ⊢ %_57638 : %_57638
 ; {>  %_57637~0':_p55433 }
; _f55489 0' ⊢ °1◂0'
; _some %_57638 ⊢ %_57639 : %_57639
 ; {>  %_57638~°1◂0':_p55432 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57639
 ; {>  %_57639~°0◂°1◂0':(_opn)◂(_p55432) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_58853
	btr r12,3
	jmp LB_58854
LB_58853:
	bts r12,3
LB_58854:
	mov rsi,1
	bt r12,3
	jc LB_58851
	mov rsi,0
	bt r9,0
	jc LB_58851
	jmp LB_58852
LB_58851:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_58852:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_58855:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58857
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58856
LB_58857:
	add rsp,8
	ret
LB_58858:
	add rsp,16
	pop r14
LB_58856:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; lc_line
	jmp LB_58878
LB_58877:
	add r14,1
LB_58878:
	cmp r14,r10
	jge LB_58879
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58877
	cmp al,10
	jz LB_58877
	cmp al,32
	jz LB_58877
LB_58879:
	push r10
	call NS_E_57521_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58880
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58872
LB_58880:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_58883
LB_58882:
	add r14,1
LB_58883:
	cmp r14,r10
	jge LB_58884
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58882
	cmp al,10
	jz LB_58882
	cmp al,32
	jz LB_58882
LB_58884:
	push r10
	call NS_E_57520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58885
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58886
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58886:
	jmp LB_58872
LB_58885:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58875
	btr r12,1
	jmp LB_58876
LB_58875:
	bts r12,1
LB_58876:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58873
	btr r12,0
	jmp LB_58874
LB_58873:
	bts r12,0
LB_58874:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_58869
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' 2' } 3' }
	mov r9,r14
	bt r12,1
	jc LB_58888
	btr r12,3
	jmp LB_58889
LB_58888:
	bts r12,3
LB_58889:
	mov r10,r13
	bt r12,0
	jc LB_58890
	btr r12,4
	jmp LB_58891
LB_58890:
	bts r12,4
LB_58891:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_58894
	btr r12,5
	jmp LB_58895
LB_58894:
	bts r12,5
LB_58895:
	mov r13,r11
	bt r12,5
	jc LB_58892
	btr r12,0
	jmp LB_58893
LB_58892:
	bts r12,0
LB_58893:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_58898
	btr r12,5
	jmp LB_58899
LB_58898:
	bts r12,5
LB_58899:
	mov r14,r11
	bt r12,5
	jc LB_58896
	btr r12,1
	jmp LB_58897
LB_58896:
	bts r12,1
LB_58897:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_58902
	btr r12,5
	jmp LB_58903
LB_58902:
	bts r12,5
LB_58903:
	mov r8,r11
	bt r12,5
	jc LB_58900
	btr r12,2
	jmp LB_58901
LB_58900:
	bts r12,2
LB_58901:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57641 ⊢ %_57642 : %_57642
 ; {>  %_57640~{ 0' 1' 2' }:{ _p55437 _p55428 _p55429 } %_57641~3':_p55432 }
; _some 3' ⊢ °0◂3'
; ∎ %_57642
 ; {>  %_57640~{ 0' 1' 2' }:{ _p55437 _p55428 _p55429 } %_57642~°0◂3':(_opn)◂(_p55432) }
; 	∎ °0◂3'
	bt r12,0
	jc LB_58866
	mov rdi,r13
	call dlt
LB_58866:
	bt r12,1
	jc LB_58867
	mov rdi,r14
	call dlt
LB_58867:
	bt r12,2
	jc LB_58868
	mov rdi,r8
	call dlt
LB_58868:
; _emt_mov_ptn_to_ptn:{| 00010.. |},°0◂3' ⊢ 2'◂3'
	mov r8,0
	bts r12,2
	ret
LB_58869:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58871
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58870
LB_58871:
	add rsp,8
	ret
LB_58872:
	add rsp,32
	pop r14
LB_58870:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57521:
NS_E_RDI_57521:
NS_E_57521_ETR_TBL:
NS_E_57521_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; "$"
	jmp LB_58969
LB_58968:
	add r14,1
LB_58969:
	cmp r14,r10
	jge LB_58970
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58968
	cmp al,10
	jz LB_58968
	cmp al,32
	jz LB_58968
LB_58970:
	add r14,1
	cmp r14,r10
	jg LB_58973
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_58973
	jmp LB_58974
LB_58973:
	jmp LB_58924
LB_58974:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_58937
LB_58936:
	add r14,1
LB_58937:
	cmp r14,r10
	jge LB_58938
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58936
	cmp al,10
	jz LB_58936
	cmp al,32
	jz LB_58936
LB_58938:
	push r10
	call NS_E_56701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58939
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58940
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58940:
	jmp LB_58925
LB_58939:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_58943
LB_58942:
	add r14,1
LB_58943:
	cmp r14,r10
	jge LB_58944
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58942
	cmp al,10
	jz LB_58942
	cmp al,32
	jz LB_58942
LB_58944:
	add r14,3
	cmp r14,r10
	jg LB_58949
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_58949
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_58949
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_58949
	jmp LB_58950
LB_58949:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58946
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58946:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58947
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58947:
	jmp LB_58925
LB_58950:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_58952
LB_58951:
	add r14,1
LB_58952:
	cmp r14,r10
	jge LB_58953
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58951
	cmp al,10
	jz LB_58951
	cmp al,32
	jz LB_58951
LB_58953:
	push r10
	call NS_E_56965_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58954
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58955
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58955:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58956
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58956:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58957
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58957:
	jmp LB_58925
LB_58954:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_58960
LB_58959:
	add r14,1
LB_58960:
	cmp r14,r10
	jge LB_58961
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_58959
	cmp al,10
	jz LB_58959
	cmp al,32
	jz LB_58959
LB_58961:
	push r10
	call NS_E_56968_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_58962
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_58963
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_58963:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_58964
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_58964:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_58965
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_58965:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_58966
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_58966:
	jmp LB_58925
LB_58962:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_58934
	btr r12,4
	jmp LB_58935
LB_58934:
	bts r12,4
LB_58935:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_58932
	btr r12,3
	jmp LB_58933
LB_58932:
	bts r12,3
LB_58933:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_58930
	btr r12,2
	jmp LB_58931
LB_58930:
	bts r12,2
LB_58931:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_58928
	btr r12,1
	jmp LB_58929
LB_58928:
	bts r12,1
LB_58929:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_58926
	btr r12,0
	jmp LB_58927
LB_58926:
	bts r12,0
LB_58927:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_58921
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_58975
	btr r12,5
	jmp LB_58976
LB_58975:
	bts r12,5
LB_58976:
	mov r8,r10
	bt r12,4
	jc LB_58977
	btr r12,2
	jmp LB_58978
LB_58977:
	bts r12,2
LB_58978:
	mov r10,r14
	bt r12,1
	jc LB_58979
	btr r12,4
	jmp LB_58980
LB_58979:
	bts r12,4
LB_58980:
	mov r14,r9
	bt r12,3
	jc LB_58981
	btr r12,1
	jmp LB_58982
LB_58981:
	bts r12,1
LB_58982:
	mov r9,r13
	bt r12,0
	jc LB_58983
	btr r12,3
	jmp LB_58984
LB_58983:
	bts r12,3
LB_58984:
	mov r13,r10
	bt r12,4
	jc LB_58985
	btr r12,0
	jmp LB_58986
LB_58985:
	bts r12,0
LB_58986:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_57646 : %_57646
 ; {>  %_57643~0':_p55428 %_57645~2':_p56967 %_57644~1':_p55429 }
; 	» 0xr1 _ ⊢ 3' : %_57646
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f55500 %_57646 ⊢ %_57647 : %_57647
 ; {>  %_57643~0':_p55428 %_57646~3':_r64 %_57645~2':_p56967 %_57644~1':_p55429 }
; _f55500 3' ⊢ °1◂3'
; _some { %_57647 %_57643 %_57644 } ⊢ %_57648 : %_57648
 ; {>  %_57643~0':_p55428 %_57647~°1◂3':_p55437 %_57645~2':_p56967 %_57644~1':_p55429 }
; _some { °1◂3' 0' 1' } ⊢ °0◂{ °1◂3' 0' 1' }
; ∎ %_57648
 ; {>  %_57648~°0◂{ °1◂3' 0' 1' }:(_opn)◂({ _p55437 _p55428 _p55429 }) %_57645~2':_p56967 }
; 	∎ °0◂{ °1◂3' 0' 1' }
	bt r12,2
	jc LB_58904
	mov rdi,r8
	call dlt
LB_58904:
; _emt_mov_ptn_to_ptn:{| 11010.. |},°0◂{ °1◂3' 0' 1' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_58905
	btr r12,4
	jmp LB_58906
LB_58905:
	bts r12,4
LB_58906:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r10
	bt r12,4
	jc LB_58911
	btr r12,2
	jmp LB_58912
LB_58911:
	bts r12,2
LB_58912:
	mov rsi,1
	bt r12,2
	jc LB_58909
	mov rsi,0
	bt r8,0
	jc LB_58909
	jmp LB_58910
LB_58909:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_58910:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_58907
	btr QWORD [rdi],0
	jmp LB_58908
LB_58907:
	bts QWORD [rdi],0
LB_58908:
	mov r8,r13
	bt r12,0
	jc LB_58915
	btr r12,2
	jmp LB_58916
LB_58915:
	bts r12,2
LB_58916:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_58913
	btr QWORD [rdi],1
	jmp LB_58914
LB_58913:
	bts QWORD [rdi],1
LB_58914:
	mov r8,r14
	bt r12,1
	jc LB_58919
	btr r12,2
	jmp LB_58920
LB_58919:
	bts r12,2
LB_58920:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_58917
	btr QWORD [rdi],2
	jmp LB_58918
LB_58917:
	bts QWORD [rdi],2
LB_58918:
	mov r8,0
	bts r12,2
	ret
LB_58921:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_58923
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_58922
LB_58923:
	add rsp,8
	ret
LB_58925:
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
LB_58924:
	add rsp,80
	pop r14
LB_58922:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_59079
LB_59078:
	add r14,1
LB_59079:
	cmp r14,r10
	jge LB_59080
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59078
	cmp al,10
	jz LB_59078
	cmp al,32
	jz LB_59078
LB_59080:
	add r14,3
	cmp r14,r10
	jg LB_59083
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59083
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_59083
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_59083
	jmp LB_59084
LB_59083:
	jmp LB_59020
LB_59084:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_59035
LB_59034:
	add r14,1
LB_59035:
	cmp r14,r10
	jge LB_59036
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59034
	cmp al,10
	jz LB_59034
	cmp al,32
	jz LB_59034
LB_59036:
	push r10
	call NS_E_56701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59037
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59038
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59038:
	jmp LB_59021
LB_59037:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_59041
LB_59040:
	add r14,1
LB_59041:
	cmp r14,r10
	jge LB_59042
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59040
	cmp al,10
	jz LB_59040
	cmp al,32
	jz LB_59040
LB_59042:
	add r14,1
	cmp r14,r10
	jg LB_59047
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_59047
	jmp LB_59048
LB_59047:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59044
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59044:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59045
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59045:
	jmp LB_59021
LB_59048:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_59050
LB_59049:
	add r14,1
LB_59050:
	cmp r14,r10
	jge LB_59051
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59049
	cmp al,10
	jz LB_59049
	cmp al,32
	jz LB_59049
LB_59051:
	push r10
	call NS_E_56701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59052
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59053
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59053:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59054
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59054:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59055
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59055:
	jmp LB_59021
LB_59052:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_59058
LB_59057:
	add r14,1
LB_59058:
	cmp r14,r10
	jge LB_59059
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59057
	cmp al,10
	jz LB_59057
	cmp al,32
	jz LB_59057
LB_59059:
	add r14,3
	cmp r14,r10
	jg LB_59066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_59066
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_59066
	jmp LB_59067
LB_59066:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_59061
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_59061:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59062
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59062:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59063
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59063:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59064
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59064:
	jmp LB_59021
LB_59067:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_59069
LB_59068:
	add r14,1
LB_59069:
	cmp r14,r10
	jge LB_59070
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59068
	cmp al,10
	jz LB_59068
	cmp al,32
	jz LB_59068
LB_59070:
	push r10
	call NS_E_56965_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59071
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_59072
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_59072:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_59073
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_59073:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59074
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59074:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59075
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59075:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59076
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59076:
	jmp LB_59021
LB_59071:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_59032
	btr r12,5
	jmp LB_59033
LB_59032:
	bts r12,5
LB_59033:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_59030
	btr r12,4
	jmp LB_59031
LB_59030:
	bts r12,4
LB_59031:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59028
	btr r12,3
	jmp LB_59029
LB_59028:
	bts r12,3
LB_59029:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59026
	btr r12,2
	jmp LB_59027
LB_59026:
	bts r12,2
LB_59027:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59024
	btr r12,1
	jmp LB_59025
LB_59024:
	bts r12,1
LB_59025:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59022
	btr r12,0
	jmp LB_59023
LB_59022:
	bts r12,0
LB_59023:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_59017
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_59085
	btr r12,6
	jmp LB_59086
LB_59085:
	bts r12,6
LB_59086:
	mov r8,r11
	bt r12,5
	jc LB_59087
	btr r12,2
	jmp LB_59088
LB_59087:
	bts r12,2
LB_59088:
	mov r11,r14
	bt r12,1
	jc LB_59089
	btr r12,5
	jmp LB_59090
LB_59089:
	bts r12,5
LB_59090:
	mov r14,r9
	bt r12,3
	jc LB_59091
	btr r12,1
	jmp LB_59092
LB_59091:
	bts r12,1
LB_59092:
	mov r9,r13
	bt r12,0
	jc LB_59093
	btr r12,3
	jmp LB_59094
LB_59093:
	bts r12,3
LB_59094:
	mov r13,r11
	bt r12,5
	jc LB_59095
	btr r12,0
	jmp LB_59096
LB_59095:
	bts r12,0
LB_59096:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55501 {  } ⊢ %_57652 : %_57652
 ; {>  %_57649~0':_p55428 %_57650~1':_p55428 %_57651~2':_p55429 }
; _f55501 {  } ⊢ °2◂{  }
; _nil {  } ⊢ %_57653 : %_57653
 ; {>  %_57649~0':_p55428 %_57650~1':_p55428 %_57652~°2◂{  }:_p55437 %_57651~2':_p55429 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_57650 %_57653 } ⊢ %_57654 : %_57654
 ; {>  %_57649~0':_p55428 %_57650~1':_p55428 %_57652~°2◂{  }:_p55437 %_57651~2':_p55429 %_57653~°1◂{  }:(_lst)◂(t19365'(0)) }
; _cns { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; _cns { %_57649 %_57654 } ⊢ %_57655 : %_57655
 ; {>  %_57649~0':_p55428 %_57652~°2◂{  }:_p55437 %_57654~°0◂{ 1' °1◂{  } }:(_lst)◂(_p55428) %_57651~2':_p55429 }
; _cns { 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂{ 0' °0◂{ 1' °1◂{  } } }
; _f55477 %_57655 ⊢ %_57656 : %_57656
 ; {>  %_57652~°2◂{  }:_p55437 %_57655~°0◂{ 0' °0◂{ 1' °1◂{  } } }:(_lst)◂(_p55428) %_57651~2':_p55429 }
; _f55477 °0◂{ 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }
; _some { %_57652 %_57656 %_57651 } ⊢ %_57657 : %_57657
 ; {>  %_57652~°2◂{  }:_p55437 %_57656~°0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }:_p55428 %_57651~2':_p55429 }
; _some { °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; ∎ %_57657
 ; {>  %_57657~°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }:(_opn)◂({ _p55437 _p55428 _p55429 }) }
; 	∎ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_58989
	mov rsi,0
	bt r10,0
	jc LB_58989
	jmp LB_58990
LB_58989:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_58990:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_58987
	btr QWORD [rdi],0
	jmp LB_58988
LB_58987:
	bts QWORD [rdi],0
LB_58988:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_58999
	btr r12,5
	jmp LB_59000
LB_58999:
	bts r12,5
LB_59000:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_58997
	btr QWORD [rdi],0
	jmp LB_58998
LB_58997:
	bts QWORD [rdi],0
LB_58998:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r14
	bt r12,1
	jc LB_59007
	btr r12,0
	jmp LB_59008
LB_59007:
	bts r12,0
LB_59008:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_59005
	btr QWORD [rdi],0
	jmp LB_59006
LB_59005:
	bts QWORD [rdi],0
LB_59006:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_59011
	mov rsi,0
	bt r13,0
	jc LB_59011
	jmp LB_59012
LB_59011:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_59012:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_59009
	btr QWORD [rdi],1
	jmp LB_59010
LB_59009:
	bts QWORD [rdi],1
LB_59010:
	mov rsi,1
	bt r12,5
	jc LB_59003
	mov rsi,0
	bt r11,0
	jc LB_59003
	jmp LB_59004
LB_59003:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_59004:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_59001
	btr QWORD [rdi],1
	jmp LB_59002
LB_59001:
	bts QWORD [rdi],1
LB_59002:
	mov rsi,1
	bt r12,4
	jc LB_58995
	mov rsi,0
	bt r10,0
	jc LB_58995
	jmp LB_58996
LB_58995:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_58996:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_58993
	mov rsi,0
	bt r10,0
	jc LB_58993
	jmp LB_58994
LB_58993:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_58994:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_58991
	btr QWORD [rdi],1
	jmp LB_58992
LB_58991:
	bts QWORD [rdi],1
LB_58992:
	mov r10,r8
	bt r12,2
	jc LB_59015
	btr r12,4
	jmp LB_59016
LB_59015:
	bts r12,4
LB_59016:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_59013
	btr QWORD [rdi],2
	jmp LB_59014
LB_59013:
	bts QWORD [rdi],2
LB_59014:
	mov r8,0
	bts r12,2
	ret
LB_59017:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59019
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59018
LB_59019:
	add rsp,8
	ret
LB_59021:
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
LB_59020:
	add rsp,96
	pop r14
LB_59018:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_59125
LB_59124:
	add r14,1
LB_59125:
	cmp r14,r10
	jge LB_59126
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59124
	cmp al,10
	jz LB_59124
	cmp al,32
	jz LB_59124
LB_59126:
	add r14,2
	cmp r14,r10
	jg LB_59129
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_59129
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_59129
	jmp LB_59130
LB_59129:
	jmp LB_59112
LB_59130:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_59119
LB_59118:
	add r14,1
LB_59119:
	cmp r14,r10
	jge LB_59120
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59118
	cmp al,10
	jz LB_59118
	cmp al,32
	jz LB_59118
LB_59120:
	push r10
	call NS_E_57522_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59121
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59122
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59122:
	jmp LB_59113
LB_59121:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59116
	btr r12,1
	jmp LB_59117
LB_59116:
	bts r12,1
LB_59117:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59114
	btr r12,0
	jmp LB_59115
LB_59114:
	bts r12,0
LB_59115:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59109
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } { 0' 1' 2' } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_59131
	btr r12,3
	jmp LB_59132
LB_59131:
	bts r12,3
LB_59132:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_59135
	btr r12,4
	jmp LB_59136
LB_59135:
	bts r12,4
LB_59136:
	mov r13,r10
	bt r12,4
	jc LB_59133
	btr r12,0
	jmp LB_59134
LB_59133:
	bts r12,0
LB_59134:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_59139
	btr r12,4
	jmp LB_59140
LB_59139:
	bts r12,4
LB_59140:
	mov r14,r10
	bt r12,4
	jc LB_59137
	btr r12,1
	jmp LB_59138
LB_59137:
	bts r12,1
LB_59138:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_59143
	btr r12,4
	jmp LB_59144
LB_59143:
	bts r12,4
LB_59144:
	mov r8,r10
	bt r12,4
	jc LB_59141
	btr r12,2
	jmp LB_59142
LB_59141:
	bts r12,2
LB_59142:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57658 ⊢ %_57659 : %_57659
 ; {>  %_57658~{ 0' 1' 2' }:{ _p55437 _p55428 _p55429 } }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_57659
 ; {>  %_57659~°0◂{ 0' 1' 2' }:(_opn)◂({ _p55437 _p55428 _p55429 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_59099
	btr r12,4
	jmp LB_59100
LB_59099:
	bts r12,4
LB_59100:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_59097
	btr QWORD [rdi],0
	jmp LB_59098
LB_59097:
	bts QWORD [rdi],0
LB_59098:
	mov r10,r14
	bt r12,1
	jc LB_59103
	btr r12,4
	jmp LB_59104
LB_59103:
	bts r12,4
LB_59104:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_59101
	btr QWORD [rdi],1
	jmp LB_59102
LB_59101:
	bts QWORD [rdi],1
LB_59102:
	mov r10,r8
	bt r12,2
	jc LB_59107
	btr r12,4
	jmp LB_59108
LB_59107:
	bts r12,4
LB_59108:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_59105
	btr QWORD [rdi],2
	jmp LB_59106
LB_59105:
	bts QWORD [rdi],2
LB_59106:
	mov r8,0
	bts r12,2
	ret
LB_59109:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59111
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59110
LB_59111:
	add rsp,8
	ret
LB_59113:
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
LB_59112:
	add rsp,32
	pop r14
LB_59110:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; name
	jmp LB_59172
LB_59171:
	add r14,1
LB_59172:
	cmp r14,r10
	jge LB_59173
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59171
	cmp al,10
	jz LB_59171
	cmp al,32
	jz LB_59171
LB_59173:
	push r10
	call NS_E_56505_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59174
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59162
LB_59174:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_59177
LB_59176:
	add r14,1
LB_59177:
	cmp r14,r10
	jge LB_59178
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59176
	cmp al,10
	jz LB_59176
	cmp al,32
	jz LB_59176
LB_59178:
	push r10
	call NS_E_56701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59179
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59180
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59180:
	jmp LB_59162
LB_59179:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_59183
LB_59182:
	add r14,1
LB_59183:
	cmp r14,r10
	jge LB_59184
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59182
	cmp al,10
	jz LB_59182
	cmp al,32
	jz LB_59182
LB_59184:
	add r14,3
	cmp r14,r10
	jg LB_59189
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59189
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_59189
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_59189
	jmp LB_59190
LB_59189:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59186
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59186:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59187
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59187:
	jmp LB_59162
LB_59190:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_59192
LB_59191:
	add r14,1
LB_59192:
	cmp r14,r10
	jge LB_59193
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59191
	cmp al,10
	jz LB_59191
	cmp al,32
	jz LB_59191
LB_59193:
	push r10
	call NS_E_56965_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59194
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59195
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59195:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59196
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59196:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59197
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59197:
	jmp LB_59162
LB_59194:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59169
	btr r12,3
	jmp LB_59170
LB_59169:
	bts r12,3
LB_59170:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59167
	btr r12,2
	jmp LB_59168
LB_59167:
	bts r12,2
LB_59168:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59165
	btr r12,1
	jmp LB_59166
LB_59165:
	bts r12,1
LB_59166:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59163
	btr r12,0
	jmp LB_59164
LB_59163:
	bts r12,0
LB_59164:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_59159
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_59199
	btr r12,4
	jmp LB_59200
LB_59199:
	bts r12,4
LB_59200:
	mov r8,r9
	bt r12,3
	jc LB_59201
	btr r12,2
	jmp LB_59202
LB_59201:
	bts r12,2
LB_59202:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55499 %_57660 ⊢ %_57663 : %_57663
 ; {>  %_57662~2':_p55429 %_57660~0':_p55407 %_57661~1':_p55428 }
; _f55499 0' ⊢ °0◂0'
; _some { %_57663 %_57661 %_57662 } ⊢ %_57664 : %_57664
 ; {>  %_57662~2':_p55429 %_57663~°0◂0':_p55437 %_57661~1':_p55428 }
; _some { °0◂0' 1' 2' } ⊢ °0◂{ °0◂0' 1' 2' }
; ∎ %_57664
 ; {>  %_57664~°0◂{ °0◂0' 1' 2' }:(_opn)◂({ _p55437 _p55428 _p55429 }) }
; 	∎ °0◂{ °0◂0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °0◂0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_59149
	btr r12,4
	jmp LB_59150
LB_59149:
	bts r12,4
LB_59150:
	mov rsi,1
	bt r12,4
	jc LB_59147
	mov rsi,0
	bt r10,0
	jc LB_59147
	jmp LB_59148
LB_59147:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_59148:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_59145
	btr QWORD [rdi],0
	jmp LB_59146
LB_59145:
	bts QWORD [rdi],0
LB_59146:
	mov r10,r14
	bt r12,1
	jc LB_59153
	btr r12,4
	jmp LB_59154
LB_59153:
	bts r12,4
LB_59154:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_59151
	btr QWORD [rdi],1
	jmp LB_59152
LB_59151:
	bts QWORD [rdi],1
LB_59152:
	mov r10,r8
	bt r12,2
	jc LB_59157
	btr r12,4
	jmp LB_59158
LB_59157:
	bts r12,4
LB_59158:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_59155
	btr QWORD [rdi],2
	jmp LB_59156
LB_59155:
	bts QWORD [rdi],2
LB_59156:
	mov r8,0
	bts r12,2
	ret
LB_59159:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59161
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59160
LB_59161:
	add rsp,8
	ret
LB_59162:
	add rsp,64
	pop r14
LB_59160:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57522:
NS_E_RDI_57522:
NS_E_57522_ETR_TBL:
NS_E_57522_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "_^"
	jmp LB_59261
LB_59260:
	add r14,1
LB_59261:
	cmp r14,r10
	jge LB_59262
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59260
	cmp al,10
	jz LB_59260
	cmp al,32
	jz LB_59260
LB_59262:
	add r14,2
	cmp r14,r10
	jg LB_59265
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_59265
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_59265
	jmp LB_59266
LB_59265:
	jmp LB_59228
LB_59266:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_59239
LB_59238:
	add r14,1
LB_59239:
	cmp r14,r10
	jge LB_59240
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59238
	cmp al,10
	jz LB_59238
	cmp al,32
	jz LB_59238
LB_59240:
	push r10
	call NS_E_57523_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59241
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59242
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59242:
	jmp LB_59229
LB_59241:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_59248:
	jmp LB_59245
LB_59244:
	add r14,1
LB_59245:
	cmp r14,r10
	jge LB_59246
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59244
	cmp al,10
	jz LB_59244
	cmp al,32
	jz LB_59244
LB_59246:
	push r10
	push rsi
	call NS_E_57524_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_59247
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_59249
	bts QWORD [rax],0
LB_59249:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_59248
LB_59247:
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_59251
LB_59250:
	add r14,1
LB_59251:
	cmp r14,r10
	jge LB_59252
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59250
	cmp al,10
	jz LB_59250
	cmp al,32
	jz LB_59250
LB_59252:
	add r14,2
	cmp r14,r10
	jg LB_59258
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_59258
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_59258
	jmp LB_59259
LB_59258:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59254
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59254:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59255
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59255:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59256
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59256:
	jmp LB_59229
LB_59259:
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
	jc LB_59236
	btr r12,3
	jmp LB_59237
LB_59236:
	bts r12,3
LB_59237:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59234
	btr r12,2
	jmp LB_59235
LB_59234:
	bts r12,2
LB_59235:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59232
	btr r12,1
	jmp LB_59233
LB_59232:
	bts r12,1
LB_59233:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59230
	btr r12,0
	jmp LB_59231
LB_59230:
	bts r12,0
LB_59231:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_59225
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' 2' } 3' {  } }
	mov r10,r9
	bt r12,3
	jc LB_59267
	btr r12,4
	jmp LB_59268
LB_59267:
	bts r12,4
LB_59268:
	mov r9,r8
	bt r12,2
	jc LB_59269
	btr r12,3
	jmp LB_59270
LB_59269:
	bts r12,3
LB_59270:
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov r10,r14
	bt r12,1
	jc LB_59271
	btr r12,4
	jmp LB_59272
LB_59271:
	bts r12,4
LB_59272:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_59275
	btr r12,5
	jmp LB_59276
LB_59275:
	bts r12,5
LB_59276:
	mov r13,r11
	bt r12,5
	jc LB_59273
	btr r12,0
	jmp LB_59274
LB_59273:
	bts r12,0
LB_59274:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_59279
	btr r12,5
	jmp LB_59280
LB_59279:
	bts r12,5
LB_59280:
	mov r14,r11
	bt r12,5
	jc LB_59277
	btr r12,1
	jmp LB_59278
LB_59277:
	bts r12,1
LB_59278:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_59283
	btr r12,5
	jmp LB_59284
LB_59283:
	bts r12,5
LB_59284:
	mov r8,r11
	bt r12,5
	jc LB_59281
	btr r12,2
	jmp LB_59282
LB_59281:
	bts r12,2
LB_59282:
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55503 { %_57665 %_57668 } ⊢ %_57669 : %_57669
 ; {>  %_57668~3':(_lst)◂(_p55438) %_57665~0':_r64 %_57666~1':_p55428 %_57667~2':_p55429 }
; _f55503 { 0' 3' } ⊢ °4◂{ 0' 3' }
; _some { %_57669 %_57666 %_57667 } ⊢ %_57670 : %_57670
 ; {>  %_57669~°4◂{ 0' 3' }:_p55437 %_57666~1':_p55428 %_57667~2':_p55429 }
; _some { °4◂{ 0' 3' } 1' 2' } ⊢ °0◂{ °4◂{ 0' 3' } 1' 2' }
; ∎ %_57670
 ; {>  %_57670~°0◂{ °4◂{ 0' 3' } 1' 2' }:(_opn)◂({ _p55437 _p55428 _p55429 }) }
; 	∎ °0◂{ °4◂{ 0' 3' } 1' 2' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °4◂{ 0' 3' } 1' 2' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_59203
	btr r12,4
	jmp LB_59204
LB_59203:
	bts r12,4
LB_59204:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_59211
	btr r12,6
	jmp LB_59212
LB_59211:
	bts r12,6
LB_59212:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_59209
	btr QWORD [rdi],0
	jmp LB_59210
LB_59209:
	bts QWORD [rdi],0
LB_59210:
	mov rcx,r10
	bt r12,4
	jc LB_59215
	btr r12,6
	jmp LB_59216
LB_59215:
	bts r12,6
LB_59216:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_59213
	btr QWORD [rdi],1
	jmp LB_59214
LB_59213:
	bts QWORD [rdi],1
LB_59214:
	mov rsi,1
	bt r12,5
	jc LB_59207
	mov rsi,0
	bt r11,0
	jc LB_59207
	jmp LB_59208
LB_59207:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_59208:
	mov rax,0x0400_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_59205
	btr QWORD [rdi],0
	jmp LB_59206
LB_59205:
	bts QWORD [rdi],0
LB_59206:
	mov r11,r14
	bt r12,1
	jc LB_59219
	btr r12,5
	jmp LB_59220
LB_59219:
	bts r12,5
LB_59220:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_59217
	btr QWORD [rdi],1
	jmp LB_59218
LB_59217:
	bts QWORD [rdi],1
LB_59218:
	mov r11,r8
	bt r12,2
	jc LB_59223
	btr r12,5
	jmp LB_59224
LB_59223:
	bts r12,5
LB_59224:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_59221
	btr QWORD [rdi],2
	jmp LB_59222
LB_59221:
	bts QWORD [rdi],2
LB_59222:
	mov r8,0
	bts r12,2
	ret
LB_59225:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59227
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59226
LB_59227:
	add rsp,8
	ret
LB_59229:
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
LB_59228:
	add rsp,64
	pop r14
LB_59226:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; cst
	jmp LB_59314
LB_59313:
	add r14,1
LB_59314:
	cmp r14,r10
	jge LB_59315
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59313
	cmp al,10
	jz LB_59313
	cmp al,32
	jz LB_59313
LB_59315:
	push r10
	call NS_E_56572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59316
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59304
LB_59316:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_59319
LB_59318:
	add r14,1
LB_59319:
	cmp r14,r10
	jge LB_59320
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59318
	cmp al,10
	jz LB_59318
	cmp al,32
	jz LB_59318
LB_59320:
	add r14,1
	cmp r14,r10
	jg LB_59324
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_59324
	jmp LB_59325
LB_59324:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59322
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59322:
	jmp LB_59304
LB_59325:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_59327
LB_59326:
	add r14,1
LB_59327:
	cmp r14,r10
	jge LB_59328
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59326
	cmp al,10
	jz LB_59326
	cmp al,32
	jz LB_59326
LB_59328:
	add r14,3
	cmp r14,r10
	jg LB_59333
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59333
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_59333
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_59333
	jmp LB_59334
LB_59333:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59330
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59330:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59331
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59331:
	jmp LB_59304
LB_59334:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_59336
LB_59335:
	add r14,1
LB_59336:
	cmp r14,r10
	jge LB_59337
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59335
	cmp al,10
	jz LB_59335
	cmp al,32
	jz LB_59335
LB_59337:
	push r10
	call NS_E_56965_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59338
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59339
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59339:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59340
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59340:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59341
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59341:
	jmp LB_59304
LB_59338:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59311
	btr r12,3
	jmp LB_59312
LB_59311:
	bts r12,3
LB_59312:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59309
	btr r12,2
	jmp LB_59310
LB_59309:
	bts r12,2
LB_59310:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59307
	btr r12,1
	jmp LB_59308
LB_59307:
	bts r12,1
LB_59308:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59305
	btr r12,0
	jmp LB_59306
LB_59305:
	bts r12,0
LB_59306:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_59301
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_59343
	btr r12,4
	jmp LB_59344
LB_59343:
	bts r12,4
LB_59344:
	mov r14,r9
	bt r12,3
	jc LB_59345
	btr r12,1
	jmp LB_59346
LB_59345:
	bts r12,1
LB_59346:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55502 %_57671 ⊢ %_57673 : %_57673
 ; {>  %_57671~0':_p55431 %_57672~1':_p55429 }
; _f55502 0' ⊢ °3◂0'
; _nil {  } ⊢ %_57674 : %_57674
 ; {>  %_57672~1':_p55429 %_57673~°3◂0':_p55437 }
; _nil {  } ⊢ °1◂{  }
; _f55477 %_57674 ⊢ %_57675 : %_57675
 ; {>  %_57672~1':_p55429 %_57673~°3◂0':_p55437 %_57674~°1◂{  }:(_lst)◂(t19394'(0)) }
; _f55477 °1◂{  } ⊢ °0◂°1◂{  }
; _some { %_57673 %_57675 %_57672 } ⊢ %_57676 : %_57676
 ; {>  %_57675~°0◂°1◂{  }:_p55428 %_57672~1':_p55429 %_57673~°3◂0':_p55437 }
; _some { °3◂0' °0◂°1◂{  } 1' } ⊢ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; ∎ %_57676
 ; {>  %_57676~°0◂{ °3◂0' °0◂°1◂{  } 1' }:(_opn)◂({ _p55437 _p55428 _p55429 }) }
; 	∎ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ °3◂0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_59289
	btr r12,2
	jmp LB_59290
LB_59289:
	bts r12,2
LB_59290:
	mov rsi,1
	bt r12,2
	jc LB_59287
	mov rsi,0
	bt r8,0
	jc LB_59287
	jmp LB_59288
LB_59287:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59288:
	mov rax,0x0300_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_59285
	btr QWORD [rdi],0
	jmp LB_59286
LB_59285:
	bts QWORD [rdi],0
LB_59286:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_59295
	mov rsi,0
	bt r8,0
	jc LB_59295
	jmp LB_59296
LB_59295:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59296:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_59293
	mov rsi,0
	bt r8,0
	jc LB_59293
	jmp LB_59294
LB_59293:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59294:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_59291
	btr QWORD [rdi],1
	jmp LB_59292
LB_59291:
	bts QWORD [rdi],1
LB_59292:
	mov r8,r14
	bt r12,1
	jc LB_59299
	btr r12,2
	jmp LB_59300
LB_59299:
	bts r12,2
LB_59300:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_59297
	btr QWORD [rdi],2
	jmp LB_59298
LB_59297:
	bts QWORD [rdi],2
LB_59298:
	mov r8,0
	bts r12,2
	ret
LB_59301:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59303
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59302
LB_59303:
	add rsp,8
	ret
LB_59304:
	add rsp,64
	pop r14
LB_59302:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57523:
NS_E_RDI_57523:
NS_E_57523_ETR_TBL:
NS_E_57523_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "_"
	jmp LB_59400
LB_59399:
	add r14,1
LB_59400:
	cmp r14,r10
	jge LB_59401
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59399
	cmp al,10
	jz LB_59399
	cmp al,32
	jz LB_59399
LB_59401:
	add r14,1
	cmp r14,r10
	jg LB_59404
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_59404
	jmp LB_59405
LB_59404:
	jmp LB_59376
LB_59405:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_59385
LB_59384:
	add r14,1
LB_59385:
	cmp r14,r10
	jge LB_59386
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59384
	cmp al,10
	jz LB_59384
	cmp al,32
	jz LB_59384
LB_59386:
	add r14,3
	cmp r14,r10
	jg LB_59390
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59390
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_59390
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_59390
	jmp LB_59391
LB_59390:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59388
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59388:
	jmp LB_59377
LB_59391:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_59393
LB_59392:
	add r14,1
LB_59393:
	cmp r14,r10
	jge LB_59394
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59392
	cmp al,10
	jz LB_59392
	cmp al,32
	jz LB_59392
LB_59394:
	push r10
	call NS_E_56970_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59395
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59396
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59396:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59397
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59397:
	jmp LB_59377
LB_59395:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59382
	btr r12,2
	jmp LB_59383
LB_59382:
	bts r12,2
LB_59383:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59380
	btr r12,1
	jmp LB_59381
LB_59380:
	bts r12,1
LB_59381:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59378
	btr r12,0
	jmp LB_59379
LB_59378:
	bts r12,0
LB_59379:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_59373
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_59406
	btr r12,3
	jmp LB_59407
LB_59406:
	bts r12,3
LB_59407:
	mov r13,r8
	bt r12,2
	jc LB_59408
	btr r12,0
	jmp LB_59409
LB_59408:
	bts r12,0
LB_59409:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_57678 : %_57678
 ; {>  %_57677~0':_p55427 }
; 	» 0xr0 _ ⊢ 1' : %_57678
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_57679 : %_57679
 ; {>  %_57677~0':_p55427 %_57678~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f55477 %_57679 ⊢ %_57680 : %_57680
 ; {>  %_57677~0':_p55427 %_57678~1':_r64 %_57679~°1◂{  }:(_lst)◂(t19402'(0)) }
; _f55477 °1◂{  } ⊢ °0◂°1◂{  }
; _nil {  } ⊢ %_57681 : %_57681
 ; {>  %_57677~0':_p55427 %_57678~1':_r64 %_57680~°0◂°1◂{  }:_p55428 }
; _nil {  } ⊢ °1◂{  }
; _f55480 %_57677 ⊢ %_57682 : %_57682
 ; {>  %_57677~0':_p55427 %_57678~1':_r64 %_57681~°1◂{  }:(_lst)◂(t19406'(0)) %_57680~°0◂°1◂{  }:_p55428 }
; _f55480 0' ⊢ °1◂0'
; _cns { %_57682 %_57681 } ⊢ %_57683 : %_57683
 ; {>  %_57678~1':_r64 %_57682~°1◂0':_p55429 %_57681~°1◂{  }:(_lst)◂(t19406'(0)) %_57680~°0◂°1◂{  }:_p55428 }
; _cns { °1◂0' °1◂{  } } ⊢ °0◂{ °1◂0' °1◂{  } }
; _f55479 %_57683 ⊢ %_57684 : %_57684
 ; {>  %_57678~1':_r64 %_57683~°0◂{ °1◂0' °1◂{  } }:(_lst)◂(_p55429) %_57680~°0◂°1◂{  }:_p55428 }
; _f55479 °0◂{ °1◂0' °1◂{  } } ⊢ °0◂°0◂{ °1◂0' °1◂{  } }
; _some { %_57678 %_57680 %_57684 } ⊢ %_57685 : %_57685
 ; {>  %_57678~1':_r64 %_57684~°0◂°0◂{ °1◂0' °1◂{  } }:_p55429 %_57680~°0◂°1◂{  }:_p55428 }
; _some { 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; ∎ %_57685
 ; {>  %_57685~°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }:(_opn)◂({ _r64 _p55428 _p55429 }) }
; 	∎ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r14
	bt r12,1
	jc LB_59349
	btr r12,2
	jmp LB_59350
LB_59349:
	bts r12,2
LB_59350:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_59347
	btr QWORD [rdi],0
	jmp LB_59348
LB_59347:
	bts QWORD [rdi],0
LB_59348:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_59355
	mov rsi,0
	bt r8,0
	jc LB_59355
	jmp LB_59356
LB_59355:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59356:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_59353
	mov rsi,0
	bt r8,0
	jc LB_59353
	jmp LB_59354
LB_59353:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59354:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_59351
	btr QWORD [rdi],1
	jmp LB_59352
LB_59351:
	bts QWORD [rdi],1
LB_59352:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r14,r13
	bt r12,0
	jc LB_59367
	btr r12,1
	jmp LB_59368
LB_59367:
	bts r12,1
LB_59368:
	mov rsi,1
	bt r12,1
	jc LB_59365
	mov rsi,0
	bt r14,0
	jc LB_59365
	jmp LB_59366
LB_59365:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_59366:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_59363
	btr QWORD [rdi],0
	jmp LB_59364
LB_59363:
	bts QWORD [rdi],0
LB_59364:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_59371
	mov rsi,0
	bt r14,0
	jc LB_59371
	jmp LB_59372
LB_59371:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_59372:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_59369
	btr QWORD [rdi],1
	jmp LB_59370
LB_59369:
	bts QWORD [rdi],1
LB_59370:
	mov rsi,1
	bt r12,2
	jc LB_59361
	mov rsi,0
	bt r8,0
	jc LB_59361
	jmp LB_59362
LB_59361:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59362:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_59359
	mov rsi,0
	bt r8,0
	jc LB_59359
	jmp LB_59360
LB_59359:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_59360:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_59357
	btr QWORD [rdi],2
	jmp LB_59358
LB_59357:
	bts QWORD [rdi],2
LB_59358:
	mov r8,0
	bts r12,2
	ret
LB_59373:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59375
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59374
LB_59375:
	add rsp,8
	ret
LB_59377:
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
LB_59376:
	add rsp,48
	pop r14
LB_59374:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; src
	jmp LB_59463
LB_59462:
	add r14,1
LB_59463:
	cmp r14,r10
	jge LB_59464
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59462
	cmp al,10
	jz LB_59462
	cmp al,32
	jz LB_59462
LB_59464:
	push r10
	call NS_E_56704_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59465
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59451
LB_59465:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_59468
LB_59467:
	add r14,1
LB_59468:
	cmp r14,r10
	jge LB_59469
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59467
	cmp al,10
	jz LB_59467
	cmp al,32
	jz LB_59467
LB_59469:
	push r10
	call NS_E_56703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59470
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59471
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59471:
	jmp LB_59451
LB_59470:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_59474
LB_59473:
	add r14,1
LB_59474:
	cmp r14,r10
	jge LB_59475
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59473
	cmp al,10
	jz LB_59473
	cmp al,32
	jz LB_59473
LB_59475:
	add r14,3
	cmp r14,r10
	jg LB_59480
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59480
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_59480
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_59480
	jmp LB_59481
LB_59480:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59477
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59477:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59478
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59478:
	jmp LB_59451
LB_59481:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_59483
LB_59482:
	add r14,1
LB_59483:
	cmp r14,r10
	jge LB_59484
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59482
	cmp al,10
	jz LB_59482
	cmp al,32
	jz LB_59482
LB_59484:
	push r10
	call NS_E_56970_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59485
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59486
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59486:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59487
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59487:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59488
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59488:
	jmp LB_59451
LB_59485:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_59491
LB_59490:
	add r14,1
LB_59491:
	cmp r14,r10
	jge LB_59492
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59490
	cmp al,10
	jz LB_59490
	cmp al,32
	jz LB_59490
LB_59492:
	push r10
	call NS_E_56969_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59493
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_59494
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_59494:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59495
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59495:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59496
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59496:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59497
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59497:
	jmp LB_59451
LB_59493:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_59460
	btr r12,4
	jmp LB_59461
LB_59460:
	bts r12,4
LB_59461:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59458
	btr r12,3
	jmp LB_59459
LB_59458:
	bts r12,3
LB_59459:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59456
	btr r12,2
	jmp LB_59457
LB_59456:
	bts r12,2
LB_59457:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59454
	btr r12,1
	jmp LB_59455
LB_59454:
	bts r12,1
LB_59455:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59452
	btr r12,0
	jmp LB_59453
LB_59452:
	bts r12,0
LB_59453:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_59448
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_59499
	btr r12,5
	jmp LB_59500
LB_59499:
	bts r12,5
LB_59500:
	mov r9,r10
	bt r12,4
	jc LB_59501
	btr r12,3
	jmp LB_59502
LB_59501:
	bts r12,3
LB_59502:
	mov r10,r8
	bt r12,2
	jc LB_59503
	btr r12,4
	jmp LB_59504
LB_59503:
	bts r12,4
LB_59504:
	mov r8,r11
	bt r12,5
	jc LB_59505
	btr r12,2
	jmp LB_59506
LB_59505:
	bts r12,2
LB_59506:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55478 %_57686 ⊢ %_57690 : %_57690
 ; {>  %_57688~2':_p55427 %_57687~1':(_lst)◂(_p55428) %_57686~0':_p55426 %_57689~3':(_lst)◂(_p55429) }
; _f55478 0' ⊢ °1◂0'
; _f55480 %_57688 ⊢ %_57691 : %_57691
 ; {>  %_57688~2':_p55427 %_57687~1':(_lst)◂(_p55428) %_57690~°1◂0':_p55428 %_57689~3':(_lst)◂(_p55429) }
; _f55480 2' ⊢ °1◂2'
; _cns { %_57690 %_57687 } ⊢ %_57692 : %_57692
 ; {>  %_57691~°1◂2':_p55429 %_57687~1':(_lst)◂(_p55428) %_57690~°1◂0':_p55428 %_57689~3':(_lst)◂(_p55429) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _cns { %_57691 %_57689 } ⊢ %_57693 : %_57693
 ; {>  %_57692~°0◂{ °1◂0' 1' }:(_lst)◂(_p55428) %_57691~°1◂2':_p55429 %_57689~3':(_lst)◂(_p55429) }
; _cns { °1◂2' 3' } ⊢ °0◂{ °1◂2' 3' }
; _f55477 %_57692 ⊢ %_57694 : %_57694
 ; {>  %_57692~°0◂{ °1◂0' 1' }:(_lst)◂(_p55428) %_57693~°0◂{ °1◂2' 3' }:(_lst)◂(_p55429) }
; _f55477 °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; _f55479 %_57693 ⊢ %_57695 : %_57695
 ; {>  %_57693~°0◂{ °1◂2' 3' }:(_lst)◂(_p55429) %_57694~°0◂°0◂{ °1◂0' 1' }:_p55428 }
; _f55479 °0◂{ °1◂2' 3' } ⊢ °0◂°0◂{ °1◂2' 3' }
; » 0xr1 |~ {  } ⊢ %_57696 : %_57696
 ; {>  %_57695~°0◂°0◂{ °1◂2' 3' }:_p55429 %_57694~°0◂°0◂{ °1◂0' 1' }:_p55428 }
; 	» 0xr1 _ ⊢ 4' : %_57696
	mov rdi,0x1
	mov r10,rdi
	bts r12,4
; _some { %_57696 %_57694 %_57695 } ⊢ %_57697 : %_57697
 ; {>  %_57695~°0◂°0◂{ °1◂2' 3' }:_p55429 %_57696~4':_r64 %_57694~°0◂°0◂{ °1◂0' 1' }:_p55428 }
; _some { 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; ∎ %_57697
 ; {>  %_57697~°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }:(_opn)◂({ _r64 _p55428 _p55429 }) }
; 	∎ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_59410
	btr r12,5
	jmp LB_59411
LB_59410:
	bts r12,5
LB_59411:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r10
	bt r12,4
	jc LB_59414
	btr r12,6
	jmp LB_59415
LB_59414:
	bts r12,6
LB_59415:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_59412
	btr QWORD [rdi],0
	jmp LB_59413
LB_59412:
	bts QWORD [rdi],0
LB_59413:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r10,r13
	bt r12,0
	jc LB_59426
	btr r12,4
	jmp LB_59427
LB_59426:
	bts r12,4
LB_59427:
	mov rsi,1
	bt r12,4
	jc LB_59424
	mov rsi,0
	bt r10,0
	jc LB_59424
	jmp LB_59425
LB_59424:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_59425:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_59422
	btr QWORD [rdi],0
	jmp LB_59423
LB_59422:
	bts QWORD [rdi],0
LB_59423:
	mov r10,r14
	bt r12,1
	jc LB_59430
	btr r12,4
	jmp LB_59431
LB_59430:
	bts r12,4
LB_59431:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_59428
	btr QWORD [rdi],1
	jmp LB_59429
LB_59428:
	bts QWORD [rdi],1
LB_59429:
	mov rsi,1
	bt r12,6
	jc LB_59420
	mov rsi,0
	bt rcx,0
	jc LB_59420
	jmp LB_59421
LB_59420:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_59421:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_59418
	mov rsi,0
	bt rcx,0
	jc LB_59418
	jmp LB_59419
LB_59418:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_59419:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_59416
	btr QWORD [rdi],1
	jmp LB_59417
LB_59416:
	bts QWORD [rdi],1
LB_59417:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r13,r8
	bt r12,2
	jc LB_59442
	btr r12,0
	jmp LB_59443
LB_59442:
	bts r12,0
LB_59443:
	mov rsi,1
	bt r12,0
	jc LB_59440
	mov rsi,0
	bt r13,0
	jc LB_59440
	jmp LB_59441
LB_59440:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_59441:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_59438
	btr QWORD [rdi],0
	jmp LB_59439
LB_59438:
	bts QWORD [rdi],0
LB_59439:
	mov r13,r11
	bt r12,5
	jc LB_59446
	btr r12,0
	jmp LB_59447
LB_59446:
	bts r12,0
LB_59447:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_59444
	btr QWORD [rdi],1
	jmp LB_59445
LB_59444:
	bts QWORD [rdi],1
LB_59445:
	mov rsi,1
	bt r12,6
	jc LB_59436
	mov rsi,0
	bt rcx,0
	jc LB_59436
	jmp LB_59437
LB_59436:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_59437:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_59434
	mov rsi,0
	bt rcx,0
	jc LB_59434
	jmp LB_59435
LB_59434:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_59435:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_59432
	btr QWORD [rdi],2
	jmp LB_59433
LB_59432:
	bts QWORD [rdi],2
LB_59433:
	mov r8,0
	bts r12,2
	ret
LB_59448:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59450
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59449
LB_59450:
	add rsp,8
	ret
LB_59451:
	add rsp,80
	pop r14
LB_59449:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57524:
NS_E_RDI_57524:
NS_E_57524_ETR_TBL:
NS_E_57524_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_59518
LB_59517:
	add r14,1
LB_59518:
	cmp r14,r10
	jge LB_59519
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59517
	cmp al,10
	jz LB_59517
	cmp al,32
	jz LB_59517
LB_59519:
	push r10
	call NS_E_57526_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59520
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59514
LB_59520:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59515
	btr r12,0
	jmp LB_59516
LB_59515:
	bts r12,0
LB_59516:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_59511
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55504 %_57698 ⊢ %_57699 : %_57699
 ; {>  %_57698~0':_stg }
; _f55504 0' ⊢ °0◂0'
; _some %_57699 ⊢ %_57700 : %_57700
 ; {>  %_57699~°0◂0':_p55438 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57700
 ; {>  %_57700~°0◂°0◂0':(_opn)◂(_p55438) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_59509
	btr r12,3
	jmp LB_59510
LB_59509:
	bts r12,3
LB_59510:
	mov rsi,1
	bt r12,3
	jc LB_59507
	mov rsi,0
	bt r9,0
	jc LB_59507
	jmp LB_59508
LB_59507:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59508:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59511:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59513
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59512
LB_59513:
	add rsp,8
	ret
LB_59514:
	add rsp,16
	pop r14
LB_59512:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_59533
LB_59532:
	add r14,1
LB_59533:
	cmp r14,r10
	jge LB_59534
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59532
	cmp al,10
	jz LB_59532
	cmp al,32
	jz LB_59532
LB_59534:
	push r10
	call NS_E_54852_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59535
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59529
LB_59535:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59530
	btr r12,0
	jmp LB_59531
LB_59530:
	bts r12,0
LB_59531:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_59526
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55504 %_57701 ⊢ %_57702 : %_57702
 ; {>  %_57701~0':_stg }
; _f55504 0' ⊢ °0◂0'
; _some %_57702 ⊢ %_57703 : %_57703
 ; {>  %_57702~°0◂0':_p55438 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57703
 ; {>  %_57703~°0◂°0◂0':(_opn)◂(_p55438) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_59524
	btr r12,3
	jmp LB_59525
LB_59524:
	bts r12,3
LB_59525:
	mov rsi,1
	bt r12,3
	jc LB_59522
	mov rsi,0
	bt r9,0
	jc LB_59522
	jmp LB_59523
LB_59522:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59523:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59526:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59528
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59527
LB_59528:
	add rsp,8
	ret
LB_59529:
	add rsp,16
	pop r14
LB_59527:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_59548
LB_59547:
	add r14,1
LB_59548:
	cmp r14,r10
	jge LB_59549
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59547
	cmp al,10
	jz LB_59547
	cmp al,32
	jz LB_59547
LB_59549:
	push r10
	call NS_E_56505_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59550
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59544
LB_59550:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59545
	btr r12,0
	jmp LB_59546
LB_59545:
	bts r12,0
LB_59546:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_59541
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55505 %_57704 ⊢ %_57705 : %_57705
 ; {>  %_57704~0':_p55407 }
; _f55505 0' ⊢ °1◂0'
; _some %_57705 ⊢ %_57706 : %_57706
 ; {>  %_57705~°1◂0':_p55438 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57706
 ; {>  %_57706~°0◂°1◂0':(_opn)◂(_p55438) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_59539
	btr r12,3
	jmp LB_59540
LB_59539:
	bts r12,3
LB_59540:
	mov rsi,1
	bt r12,3
	jc LB_59537
	mov rsi,0
	bt r9,0
	jc LB_59537
	jmp LB_59538
LB_59537:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59538:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59541:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59543
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59542
LB_59543:
	add rsp,8
	ret
LB_59544:
	add rsp,16
	pop r14
LB_59542:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_59569
LB_59568:
	add r14,1
LB_59569:
	cmp r14,r10
	jge LB_59570
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59568
	cmp al,10
	jz LB_59568
	cmp al,32
	jz LB_59568
LB_59570:
	push r10
	call NS_E_57525_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59571
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59565
LB_59571:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59566
	btr r12,0
	jmp LB_59567
LB_59566:
	bts r12,0
LB_59567:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_59562
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_59573
	btr r12,2
	jmp LB_59574
LB_59573:
	bts r12,2
LB_59574:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_59577
	btr r12,3
	jmp LB_59578
LB_59577:
	bts r12,3
LB_59578:
	mov r13,r9
	bt r12,3
	jc LB_59575
	btr r12,0
	jmp LB_59576
LB_59575:
	bts r12,0
LB_59576:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_59581
	btr r12,3
	jmp LB_59582
LB_59581:
	bts r12,3
LB_59582:
	mov r14,r9
	bt r12,3
	jc LB_59579
	btr r12,1
	jmp LB_59580
LB_59579:
	bts r12,1
LB_59580:
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55506 %_57707 ⊢ %_57708 : %_57708
 ; {>  %_57707~{ 0' 1' }:{ _p55439 _r64 } }
; _f55506 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_57708 ⊢ %_57709 : %_57709
 ; {>  %_57708~°2◂{ 0' 1' }:_p55438 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_57709
 ; {>  %_57709~°0◂°2◂{ 0' 1' }:(_opn)◂(_p55438) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_59556
	btr r12,2
	jmp LB_59557
LB_59556:
	bts r12,2
LB_59557:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_59554
	btr QWORD [rdi],0
	jmp LB_59555
LB_59554:
	bts QWORD [rdi],0
LB_59555:
	mov r8,r14
	bt r12,1
	jc LB_59560
	btr r12,2
	jmp LB_59561
LB_59560:
	bts r12,2
LB_59561:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_59558
	btr QWORD [rdi],1
	jmp LB_59559
LB_59558:
	bts QWORD [rdi],1
LB_59559:
	mov rsi,1
	bt r12,3
	jc LB_59552
	mov rsi,0
	bt r9,0
	jc LB_59552
	jmp LB_59553
LB_59552:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59553:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59562:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59564
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59563
LB_59564:
	add rsp,8
	ret
LB_59565:
	add rsp,16
	pop r14
LB_59563:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57525:
NS_E_RDI_57525:
NS_E_57525_ETR_TBL:
NS_E_57525_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_54731_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59602
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59594
LB_59602:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_59610
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_59610
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_59610
	jmp LB_59611
LB_59610:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59608
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59608:
	jmp LB_59594
LB_59611:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59597
	btr r12,1
	jmp LB_59598
LB_59597:
	bts r12,1
LB_59598:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59595
	btr r12,0
	jmp LB_59596
LB_59595:
	bts r12,0
LB_59596:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59591
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55508 {  } ⊢ %_57711 : %_57711
 ; {>  %_57710~0':_r64 }
; _f55508 {  } ⊢ °1◂{  }
; _some { %_57711 %_57710 } ⊢ %_57712 : %_57712
 ; {>  %_57710~0':_r64 %_57711~°1◂{  }:_p55439 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_57712
 ; {>  %_57712~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p55439 _r64 }) }
; 	∎ °0◂{ °1◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °1◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_59585
	mov rsi,0
	bt r14,0
	jc LB_59585
	jmp LB_59586
LB_59585:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_59586:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_59583
	btr QWORD [rdi],0
	jmp LB_59584
LB_59583:
	bts QWORD [rdi],0
LB_59584:
	mov r14,r13
	bt r12,0
	jc LB_59589
	btr r12,1
	jmp LB_59590
LB_59589:
	bts r12,1
LB_59590:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_59587
	btr QWORD [rdi],1
	jmp LB_59588
LB_59587:
	bts QWORD [rdi],1
LB_59588:
	mov r8,0
	bts r12,2
	ret
LB_59591:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59593
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59592
LB_59593:
	add rsp,8
	ret
LB_59594:
	add rsp,32
	pop r14
LB_59592:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_54731_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59631
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59623
LB_59631:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_59639
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_59639
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_59639
	jmp LB_59640
LB_59639:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59637
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59637:
	jmp LB_59623
LB_59640:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59626
	btr r12,1
	jmp LB_59627
LB_59626:
	bts r12,1
LB_59627:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59624
	btr r12,0
	jmp LB_59625
LB_59624:
	bts r12,0
LB_59625:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59620
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55509 {  } ⊢ %_57714 : %_57714
 ; {>  %_57713~0':_r64 }
; _f55509 {  } ⊢ °2◂{  }
; _some { %_57714 %_57713 } ⊢ %_57715 : %_57715
 ; {>  %_57714~°2◂{  }:_p55439 %_57713~0':_r64 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_57715
 ; {>  %_57715~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p55439 _r64 }) }
; 	∎ °0◂{ °2◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °2◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_59614
	mov rsi,0
	bt r14,0
	jc LB_59614
	jmp LB_59615
LB_59614:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_59615:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_59612
	btr QWORD [rdi],0
	jmp LB_59613
LB_59612:
	bts QWORD [rdi],0
LB_59613:
	mov r14,r13
	bt r12,0
	jc LB_59618
	btr r12,1
	jmp LB_59619
LB_59618:
	bts r12,1
LB_59619:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_59616
	btr QWORD [rdi],1
	jmp LB_59617
LB_59616:
	bts QWORD [rdi],1
LB_59617:
	mov r8,0
	bts r12,2
	ret
LB_59620:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59622
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59621
LB_59622:
	add rsp,8
	ret
LB_59623:
	add rsp,32
	pop r14
LB_59621:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_54731_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59660
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59652
LB_59660:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_59668
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_59668
	jmp LB_59669
LB_59668:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59666
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59666:
	jmp LB_59652
LB_59669:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59655
	btr r12,1
	jmp LB_59656
LB_59655:
	bts r12,1
LB_59656:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59653
	btr r12,0
	jmp LB_59654
LB_59653:
	bts r12,0
LB_59654:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59649
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55507 {  } ⊢ %_57717 : %_57717
 ; {>  %_57716~0':_r64 }
; _f55507 {  } ⊢ °0◂{  }
; _some { %_57717 %_57716 } ⊢ %_57718 : %_57718
 ; {>  %_57716~0':_r64 %_57717~°0◂{  }:_p55439 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_57718
 ; {>  %_57718~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p55439 _r64 }) }
; 	∎ °0◂{ °0◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °0◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_59643
	mov rsi,0
	bt r14,0
	jc LB_59643
	jmp LB_59644
LB_59643:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_59644:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_59641
	btr QWORD [rdi],0
	jmp LB_59642
LB_59641:
	bts QWORD [rdi],0
LB_59642:
	mov r14,r13
	bt r12,0
	jc LB_59647
	btr r12,1
	jmp LB_59648
LB_59647:
	bts r12,1
LB_59648:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_59645
	btr QWORD [rdi],1
	jmp LB_59646
LB_59645:
	bts QWORD [rdi],1
LB_59646:
	mov r8,0
	bts r12,2
	ret
LB_59649:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59651
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59650
LB_59651:
	add rsp,8
	ret
LB_59652:
	add rsp,32
	pop r14
LB_59650:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57526:
NS_E_RDI_57526:
NS_E_57526_ETR_TBL:
NS_E_57526_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_59685
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_59685
	jmp LB_59686
LB_59685:
	jmp LB_59675
LB_59686:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_57527_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59690
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59691
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59691:
	jmp LB_59675
LB_59690:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59678
	btr r12,1
	jmp LB_59679
LB_59678:
	bts r12,1
LB_59679:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59676
	btr r12,0
	jmp LB_59677
LB_59676:
	bts r12,0
LB_59677:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59672
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_59693
	btr r12,2
	jmp LB_59694
LB_59693:
	bts r12,2
LB_59694:
	mov r13,r14
	bt r12,1
	jc LB_59695
	btr r12,0
	jmp LB_59696
LB_59695:
	bts r12,0
LB_59696:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f54842 %_57719 ⊢ %_57720 : %_57720
 ; {>  %_57719~0':(_lst)◂(_r64) }
; _f54842 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_54842
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_57720 ⊢ %_57721 : %_57721
 ; {>  %_57720~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_57721
 ; {>  %_57721~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_59670
	btr r12,3
	jmp LB_59671
LB_59670:
	bts r12,3
LB_59671:
	mov r8,0
	bts r12,2
	ret
LB_59672:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59674
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59673
LB_59674:
	add rsp,8
	ret
LB_59675:
	add rsp,32
	pop r14
LB_59673:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57527:
NS_E_RDI_57527:
NS_E_57527_ETR_TBL:
NS_E_57527_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_59718
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_59718
	jmp LB_59719
LB_59718:
	jmp LB_59710
LB_59719:
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
	jc LB_59711
	btr r12,0
	jmp LB_59712
LB_59711:
	bts r12,0
LB_59712:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_59707
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_57722 : %_57722
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_57722
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_57723 : %_57723
 ; {>  %_57722~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_57722 %_57723 } ⊢ %_57724 : %_57724
 ; {>  %_57723~°1◂{  }:(_lst)◂(t19463'(0)) %_57722~0':_r64 }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_57724 ⊢ %_57725 : %_57725
 ; {>  %_57724~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_57725
 ; {>  %_57725~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_59701
	btr r12,1
	jmp LB_59702
LB_59701:
	bts r12,1
LB_59702:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_59699
	btr QWORD [rdi],0
	jmp LB_59700
LB_59699:
	bts QWORD [rdi],0
LB_59700:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_59705
	mov rsi,0
	bt r14,0
	jc LB_59705
	jmp LB_59706
LB_59705:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_59706:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_59703
	btr QWORD [rdi],1
	jmp LB_59704
LB_59703:
	bts QWORD [rdi],1
LB_59704:
	mov rsi,1
	bt r12,3
	jc LB_59697
	mov rsi,0
	bt r9,0
	jc LB_59697
	jmp LB_59698
LB_59697:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59698:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59707:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59709
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59708
LB_59709:
	add rsp,8
	ret
LB_59710:
	add rsp,16
	pop r14
LB_59708:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_54729_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59741
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59733
LB_59741:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_57527_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59746
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59747
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59747:
	jmp LB_59733
LB_59746:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59736
	btr r12,1
	jmp LB_59737
LB_59736:
	bts r12,1
LB_59737:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59734
	btr r12,0
	jmp LB_59735
LB_59734:
	bts r12,0
LB_59735:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59730
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_57726 %_57727 } ⊢ %_57728 : %_57728
 ; {>  %_57726~0':_r64 %_57727~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57728 ⊢ %_57729 : %_57729
 ; {>  %_57728~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57729
 ; {>  %_57729~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
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
	jc LB_59724
	btr r12,2
	jmp LB_59725
LB_59724:
	bts r12,2
LB_59725:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_59722
	btr QWORD [rdi],0
	jmp LB_59723
LB_59722:
	bts QWORD [rdi],0
LB_59723:
	mov r8,r14
	bt r12,1
	jc LB_59728
	btr r12,2
	jmp LB_59729
LB_59728:
	bts r12,2
LB_59729:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_59726
	btr QWORD [rdi],1
	jmp LB_59727
LB_59726:
	bts QWORD [rdi],1
LB_59727:
	mov rsi,1
	bt r12,3
	jc LB_59720
	mov rsi,0
	bt r9,0
	jc LB_59720
	jmp LB_59721
LB_59720:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59721:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59730:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59732
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59731
LB_59732:
	add rsp,8
	ret
LB_59733:
	add rsp,32
	pop r14
LB_59731:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57528:
NS_E_RDI_57528:
NS_E_57528_ETR_TBL:
NS_E_57528_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_59787
LB_59786:
	add r14,1
LB_59787:
	cmp r14,r10
	jge LB_59788
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59786
	cmp al,10
	jz LB_59786
	cmp al,32
	jz LB_59786
LB_59788:
	add r14,4
	cmp r14,r10
	jg LB_59791
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_59791
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_59791
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_59791
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_59791
	jmp LB_59792
LB_59791:
	jmp LB_59765
LB_59792:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_59774
LB_59773:
	add r14,1
LB_59774:
	cmp r14,r10
	jge LB_59775
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59773
	cmp al,10
	jz LB_59773
	cmp al,32
	jz LB_59773
LB_59775:
	push r10
	call NS_E_57529_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59776
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59777
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59777:
	jmp LB_59766
LB_59776:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_59780
LB_59779:
	add r14,1
LB_59780:
	cmp r14,r10
	jge LB_59781
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59779
	cmp al,10
	jz LB_59779
	cmp al,32
	jz LB_59779
LB_59781:
	push r10
	call NS_E_57520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59782
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59783
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59783:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59784
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59784:
	jmp LB_59766
LB_59782:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59771
	btr r12,2
	jmp LB_59772
LB_59771:
	bts r12,2
LB_59772:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59769
	btr r12,1
	jmp LB_59770
LB_59769:
	bts r12,1
LB_59770:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59767
	btr r12,0
	jmp LB_59768
LB_59767:
	bts r12,0
LB_59768:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_59762
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_59793
	btr r12,3
	jmp LB_59794
LB_59793:
	bts r12,3
LB_59794:
	mov r14,r8
	bt r12,2
	jc LB_59795
	btr r12,1
	jmp LB_59796
LB_59795:
	bts r12,1
LB_59796:
	mov r8,r13
	bt r12,0
	jc LB_59797
	btr r12,2
	jmp LB_59798
LB_59797:
	bts r12,2
LB_59798:
	mov r13,r9
	bt r12,3
	jc LB_59799
	btr r12,0
	jmp LB_59800
LB_59799:
	bts r12,0
LB_59800:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_57732 : %_57732
 ; {>  %_57731~1':_p55432 %_57730~0':(_lst)◂(_p55435) }
; _nil {  } ⊢ °1◂{  }
; _f55494 %_57731 ⊢ %_57733 : %_57733
 ; {>  %_57732~°1◂{  }:(_lst)◂(t19478'(0)) %_57731~1':_p55432 %_57730~0':(_lst)◂(_p55435) }
; _f55494 1' ⊢ °1◂1'
; _f55492 { %_57732 %_57733 } ⊢ %_57734 : %_57734
 ; {>  %_57733~°1◂1':_p55434 %_57732~°1◂{  }:(_lst)◂(t19478'(0)) %_57730~0':(_lst)◂(_p55435) }
; _f55492 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_57734 ⊢ %_57735 : %_57735
 ; {>  %_57734~°1◂{ °1◂{  } °1◂1' }:_p55433 %_57730~0':(_lst)◂(_p55435) }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_57735
 ; {>  %_57735~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂(_p55433) %_57730~0':(_lst)◂(_p55435) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_59749
	mov rdi,r13
	call dlt
LB_59749:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂°1◂{ °1◂{  } °1◂1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_59754
	mov rsi,0
	bt r13,0
	jc LB_59754
	jmp LB_59755
LB_59754:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_59755:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_59752
	btr QWORD [rdi],0
	jmp LB_59753
LB_59752:
	bts QWORD [rdi],0
LB_59753:
	mov r13,r14
	bt r12,1
	jc LB_59760
	btr r12,0
	jmp LB_59761
LB_59760:
	bts r12,0
LB_59761:
	mov rsi,1
	bt r12,0
	jc LB_59758
	mov rsi,0
	bt r13,0
	jc LB_59758
	jmp LB_59759
LB_59758:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_59759:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_59756
	btr QWORD [rdi],1
	jmp LB_59757
LB_59756:
	bts QWORD [rdi],1
LB_59757:
	mov rsi,1
	bt r12,3
	jc LB_59750
	mov rsi,0
	bt r9,0
	jc LB_59750
	jmp LB_59751
LB_59750:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59751:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59762:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59764
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59763
LB_59764:
	add rsp,8
	ret
LB_59766:
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
LB_59765:
	add rsp,48
	pop r14
LB_59763:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_59831
LB_59830:
	add r14,1
LB_59831:
	cmp r14,r10
	jge LB_59832
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59830
	cmp al,10
	jz LB_59830
	cmp al,32
	jz LB_59830
LB_59832:
	add r14,3
	cmp r14,r10
	jg LB_59835
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59835
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_59835
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_59835
	jmp LB_59836
LB_59835:
	jmp LB_59821
LB_59836:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_59838
LB_59837:
	add r14,1
LB_59838:
	cmp r14,r10
	jge LB_59839
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59837
	cmp al,10
	jz LB_59837
	cmp al,32
	jz LB_59837
LB_59839:
	push r10
	call NS_E_57529_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59840
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59841
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59841:
	jmp LB_59821
LB_59840:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_59844
LB_59843:
	add r14,1
LB_59844:
	cmp r14,r10
	jge LB_59845
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59843
	cmp al,10
	jz LB_59843
	cmp al,32
	jz LB_59843
LB_59845:
	push r10
	call NS_E_57520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59846
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59847
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59847:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59848
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59848:
	jmp LB_59821
LB_59846:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_59851
LB_59850:
	add r14,1
LB_59851:
	cmp r14,r10
	jge LB_59852
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59850
	cmp al,10
	jz LB_59850
	cmp al,32
	jz LB_59850
LB_59852:
	push r10
	call NS_E_57528_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59853
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59854
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59854:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59855
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59855:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59856
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59856:
	jmp LB_59821
LB_59853:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59828
	btr r12,3
	jmp LB_59829
LB_59828:
	bts r12,3
LB_59829:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59826
	btr r12,2
	jmp LB_59827
LB_59826:
	bts r12,2
LB_59827:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59824
	btr r12,1
	jmp LB_59825
LB_59824:
	bts r12,1
LB_59825:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59822
	btr r12,0
	jmp LB_59823
LB_59822:
	bts r12,0
LB_59823:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_59818
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_59858
	btr r12,4
	jmp LB_59859
LB_59858:
	bts r12,4
LB_59859:
	mov r8,r9
	bt r12,3
	jc LB_59860
	btr r12,2
	jmp LB_59861
LB_59860:
	bts r12,2
LB_59861:
	mov r9,r14
	bt r12,1
	jc LB_59862
	btr r12,3
	jmp LB_59863
LB_59862:
	bts r12,3
LB_59863:
	mov r14,r10
	bt r12,4
	jc LB_59864
	btr r12,1
	jmp LB_59865
LB_59864:
	bts r12,1
LB_59865:
	mov r10,r13
	bt r12,0
	jc LB_59866
	btr r12,4
	jmp LB_59867
LB_59866:
	bts r12,4
LB_59867:
	mov r13,r9
	bt r12,3
	jc LB_59868
	btr r12,0
	jmp LB_59869
LB_59868:
	bts r12,0
LB_59869:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_57739 : %_57739
 ; {>  %_57738~2':_p55433 %_57737~1':_p55432 %_57736~0':(_lst)◂(_p55435) }
; _nil {  } ⊢ °1◂{  }
; _f55494 %_57737 ⊢ %_57740 : %_57740
 ; {>  %_57738~2':_p55433 %_57737~1':_p55432 %_57736~0':(_lst)◂(_p55435) %_57739~°1◂{  }:(_lst)◂(t19488'(0)) }
; _f55494 1' ⊢ °1◂1'
; _f55491 { %_57739 %_57740 %_57738 } ⊢ %_57741 : %_57741
 ; {>  %_57738~2':_p55433 %_57736~0':(_lst)◂(_p55435) %_57739~°1◂{  }:(_lst)◂(t19488'(0)) %_57740~°1◂1':_p55434 }
; _f55491 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_57741 ⊢ %_57742 : %_57742
 ; {>  %_57741~°0◂{ °1◂{  } °1◂1' 2' }:_p55433 %_57736~0':(_lst)◂(_p55435) }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_57742
 ; {>  %_57736~0':(_lst)◂(_p55435) %_57742~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂(_p55433) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_59801
	mov rdi,r13
	call dlt
LB_59801:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °1◂{  } °1◂1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_59806
	mov rsi,0
	bt r13,0
	jc LB_59806
	jmp LB_59807
LB_59806:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_59807:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_59804
	btr QWORD [rdi],0
	jmp LB_59805
LB_59804:
	bts QWORD [rdi],0
LB_59805:
	mov r13,r14
	bt r12,1
	jc LB_59812
	btr r12,0
	jmp LB_59813
LB_59812:
	bts r12,0
LB_59813:
	mov rsi,1
	bt r12,0
	jc LB_59810
	mov rsi,0
	bt r13,0
	jc LB_59810
	jmp LB_59811
LB_59810:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_59811:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_59808
	btr QWORD [rdi],1
	jmp LB_59809
LB_59808:
	bts QWORD [rdi],1
LB_59809:
	mov r13,r8
	bt r12,2
	jc LB_59816
	btr r12,0
	jmp LB_59817
LB_59816:
	bts r12,0
LB_59817:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r13
	bt r12,0
	jc LB_59814
	btr QWORD [rdi],2
	jmp LB_59815
LB_59814:
	bts QWORD [rdi],2
LB_59815:
	mov rsi,1
	bt r12,3
	jc LB_59802
	mov rsi,0
	bt r9,0
	jc LB_59802
	jmp LB_59803
LB_59802:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59803:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59818:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59820
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59819
LB_59820:
	add rsp,8
	ret
LB_59821:
	add rsp,64
	pop r14
LB_59819:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57529:
NS_E_RDI_57529:
NS_E_57529_ETR_TBL:
NS_E_57529_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; mtc_test
	jmp LB_59889
LB_59888:
	add r14,1
LB_59889:
	cmp r14,r10
	jge LB_59890
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59888
	cmp al,10
	jz LB_59888
	cmp al,32
	jz LB_59888
LB_59890:
	push r10
	call NS_E_57530_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59891
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59883
LB_59891:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_59894
LB_59893:
	add r14,1
LB_59894:
	cmp r14,r10
	jge LB_59895
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59893
	cmp al,10
	jz LB_59893
	cmp al,32
	jz LB_59893
LB_59895:
	push r10
	call NS_E_57531_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59896
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59897
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59897:
	jmp LB_59883
LB_59896:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59886
	btr r12,1
	jmp LB_59887
LB_59886:
	bts r12,1
LB_59887:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59884
	btr r12,0
	jmp LB_59885
LB_59884:
	bts r12,0
LB_59885:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59880
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_57743 %_57744 } ⊢ %_57745 : %_57745
 ; {>  %_57743~0':_p55435 %_57744~1':(_lst)◂(_p55435) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57745 ⊢ %_57746 : %_57746
 ; {>  %_57745~°0◂{ 0' 1' }:(_lst)◂(_p55435) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57746
 ; {>  %_57746~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p55435)) }
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
	jc LB_59874
	btr r12,2
	jmp LB_59875
LB_59874:
	bts r12,2
LB_59875:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_59872
	btr QWORD [rdi],0
	jmp LB_59873
LB_59872:
	bts QWORD [rdi],0
LB_59873:
	mov r8,r14
	bt r12,1
	jc LB_59878
	btr r12,2
	jmp LB_59879
LB_59878:
	bts r12,2
LB_59879:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_59876
	btr QWORD [rdi],1
	jmp LB_59877
LB_59876:
	bts QWORD [rdi],1
LB_59877:
	mov rsi,1
	bt r12,3
	jc LB_59870
	mov rsi,0
	bt r9,0
	jc LB_59870
	jmp LB_59871
LB_59870:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59871:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59880:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59882
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59881
LB_59882:
	add rsp,8
	ret
LB_59883:
	add rsp,32
	pop r14
LB_59881:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_59910
LB_59909:
	add r14,1
LB_59910:
	cmp r14,r10
	jge LB_59911
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59909
	cmp al,32
	jz LB_59909
LB_59911:
	add r14,1
	cmp r14,r10
	jg LB_59914
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_59914
	jmp LB_59915
LB_59914:
	jmp LB_59904
LB_59915:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_59917
LB_59916:
	add r14,1
LB_59917:
	cmp r14,r10
	jge LB_59918
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59916
	cmp al,32
	jz LB_59916
LB_59918:
	add r14,1
	cmp r14,r10
	jg LB_59922
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_59922
	jmp LB_59923
LB_59922:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59920
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59920:
	jmp LB_59904
LB_59923:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59907
	btr r12,1
	jmp LB_59908
LB_59907:
	bts r12,1
LB_59908:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59905
	btr r12,0
	jmp LB_59906
LB_59905:
	bts r12,0
LB_59906:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_59901
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_57747 : %_57747
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57747 ⊢ %_57748 : %_57748
 ; {>  %_57747~°1◂{  }:(_lst)◂(t19501'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57748
 ; {>  %_57748~°0◂°1◂{  }:(_opn)◂((_lst)◂(t19504'(0))) }
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
	jc LB_59899
	mov rsi,0
	bt r9,0
	jc LB_59899
	jmp LB_59900
LB_59899:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59900:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59901:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59903
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59902
LB_59903:
	add rsp,8
	ret
LB_59904:
	add rsp,32
	pop r14
LB_59902:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57530:
NS_E_RDI_57530:
NS_E_57530_ETR_TBL:
NS_E_57530_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; src_ptn
	jmp LB_59980
LB_59979:
	add r14,1
LB_59980:
	cmp r14,r10
	jge LB_59981
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59979
	cmp al,10
	jz LB_59979
	cmp al,32
	jz LB_59979
LB_59981:
	push r10
	call NS_E_56701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59982
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59941
LB_59982:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_59985
LB_59984:
	add r14,1
LB_59985:
	cmp r14,r10
	jge LB_59986
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59984
	cmp al,10
	jz LB_59984
	cmp al,32
	jz LB_59984
LB_59986:
	add r14,3
	cmp r14,r10
	jg LB_59990
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59990
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_59990
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_59990
	jmp LB_59991
LB_59990:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59988
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59988:
	jmp LB_59941
LB_59991:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_59954
LB_59953:
	add r14,1
LB_59954:
	cmp r14,r10
	jge LB_59955
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59953
	cmp al,10
	jz LB_59953
	cmp al,32
	jz LB_59953
LB_59955:
	push r10
	call NS_E_56505_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59956
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59957
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59957:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59958
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59958:
	jmp LB_59942
LB_59956:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_59961
LB_59960:
	add r14,1
LB_59961:
	cmp r14,r10
	jge LB_59962
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59960
	cmp al,10
	jz LB_59960
	cmp al,32
	jz LB_59960
LB_59962:
	add r14,3
	cmp r14,r10
	jg LB_59968
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_59968
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_59968
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_59968
	jmp LB_59969
LB_59968:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59964
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59964:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59965
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59965:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59966
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59966:
	jmp LB_59942
LB_59969:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_59971
LB_59970:
	add r14,1
LB_59971:
	cmp r14,r10
	jge LB_59972
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_59970
	cmp al,10
	jz LB_59970
	cmp al,32
	jz LB_59970
LB_59972:
	push r10
	call NS_E_56965_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_59973
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_59974
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_59974:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_59975
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_59975:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_59976
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_59976:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_59977
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_59977:
	jmp LB_59942
LB_59973:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_59951
	btr r12,4
	jmp LB_59952
LB_59951:
	bts r12,4
LB_59952:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_59949
	btr r12,3
	jmp LB_59950
LB_59949:
	bts r12,3
LB_59950:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_59947
	btr r12,2
	jmp LB_59948
LB_59947:
	bts r12,2
LB_59948:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_59945
	btr r12,1
	jmp LB_59946
LB_59945:
	bts r12,1
LB_59946:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_59943
	btr r12,0
	jmp LB_59944
LB_59943:
	bts r12,0
LB_59944:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_59938
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_59992
	btr r12,5
	jmp LB_59993
LB_59992:
	bts r12,5
LB_59993:
	mov r8,r10
	bt r12,4
	jc LB_59994
	btr r12,2
	jmp LB_59995
LB_59994:
	bts r12,2
LB_59995:
	mov r10,r14
	bt r12,1
	jc LB_59996
	btr r12,4
	jmp LB_59997
LB_59996:
	bts r12,4
LB_59997:
	mov r14,r11
	bt r12,5
	jc LB_59998
	btr r12,1
	jmp LB_59999
LB_59998:
	bts r12,1
LB_59999:
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55495 { %_57749 %_57750 %_57751 } ⊢ %_57752 : %_57752
 ; {>  %_57750~1':_p55407 %_57751~2':_p55429 %_57749~0':_p55428 }
; _f55495 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_57752 ⊢ %_57753 : %_57753
 ; {>  %_57752~°0◂{ 0' 1' 2' }:_p55435 }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_57753
 ; {>  %_57753~°0◂°0◂{ 0' 1' 2' }:(_opn)◂(_p55435) }
; 	∎ °0◂°0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_59928
	btr r12,4
	jmp LB_59929
LB_59928:
	bts r12,4
LB_59929:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_59926
	btr QWORD [rdi],0
	jmp LB_59927
LB_59926:
	bts QWORD [rdi],0
LB_59927:
	mov r10,r14
	bt r12,1
	jc LB_59932
	btr r12,4
	jmp LB_59933
LB_59932:
	bts r12,4
LB_59933:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_59930
	btr QWORD [rdi],1
	jmp LB_59931
LB_59930:
	bts QWORD [rdi],1
LB_59931:
	mov r10,r8
	bt r12,2
	jc LB_59936
	btr r12,4
	jmp LB_59937
LB_59936:
	bts r12,4
LB_59937:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_59934
	btr QWORD [rdi],2
	jmp LB_59935
LB_59934:
	bts QWORD [rdi],2
LB_59935:
	mov rsi,1
	bt r12,3
	jc LB_59924
	mov rsi,0
	bt r9,0
	jc LB_59924
	jmp LB_59925
LB_59924:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_59925:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_59938:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_59940
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_59939
LB_59940:
	add rsp,8
	ret
LB_59942:
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
LB_59941:
	add rsp,80
	pop r14
LB_59939:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; mtc_val
	jmp LB_60021
LB_60020:
	add r14,1
LB_60021:
	cmp r14,r10
	jge LB_60022
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60020
	cmp al,32
	jz LB_60020
LB_60022:
	push r10
	call NS_E_57532_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60023
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60013
LB_60023:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_60026
LB_60025:
	add r14,1
LB_60026:
	cmp r14,r10
	jge LB_60027
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60025
	cmp al,32
	jz LB_60025
LB_60027:
	add r14,1
	cmp r14,r10
	jg LB_60031
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_60031
	jmp LB_60032
LB_60031:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60029
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60029:
	jmp LB_60013
LB_60032:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_60034
LB_60033:
	add r14,1
LB_60034:
	cmp r14,r10
	jge LB_60035
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60033
	cmp al,32
	jz LB_60033
LB_60035:
	push r10
	call NS_E_57532_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60036
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60037
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60037:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60038
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60038:
	jmp LB_60013
LB_60036:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60018
	btr r12,2
	jmp LB_60019
LB_60018:
	bts r12,2
LB_60019:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60016
	btr r12,1
	jmp LB_60017
LB_60016:
	bts r12,1
LB_60017:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60014
	btr r12,0
	jmp LB_60015
LB_60014:
	bts r12,0
LB_60015:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_60010
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_60040
	btr r12,3
	jmp LB_60041
LB_60040:
	bts r12,3
LB_60041:
	mov r14,r8
	bt r12,2
	jc LB_60042
	btr r12,1
	jmp LB_60043
LB_60042:
	bts r12,1
LB_60043:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55496 { %_57754 %_57755 } ⊢ %_57756 : %_57756
 ; {>  %_57754~0':_p55436 %_57755~1':_p55436 }
; _f55496 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_57756 ⊢ %_57757 : %_57757
 ; {>  %_57756~°1◂{ 0' 1' }:_p55435 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_57757
 ; {>  %_57757~°0◂°1◂{ 0' 1' }:(_opn)◂(_p55435) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_60004
	btr r12,2
	jmp LB_60005
LB_60004:
	bts r12,2
LB_60005:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_60002
	btr QWORD [rdi],0
	jmp LB_60003
LB_60002:
	bts QWORD [rdi],0
LB_60003:
	mov r8,r14
	bt r12,1
	jc LB_60008
	btr r12,2
	jmp LB_60009
LB_60008:
	bts r12,2
LB_60009:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_60006
	btr QWORD [rdi],1
	jmp LB_60007
LB_60006:
	bts QWORD [rdi],1
LB_60007:
	mov rsi,1
	bt r12,3
	jc LB_60000
	mov rsi,0
	bt r9,0
	jc LB_60000
	jmp LB_60001
LB_60000:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60001:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60010:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60012
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60011
LB_60012:
	add rsp,8
	ret
LB_60013:
	add rsp,48
	pop r14
LB_60011:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57531:
NS_E_RDI_57531:
NS_E_57531_ETR_TBL:
NS_E_57531_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; ";"
	jmp LB_60079
LB_60078:
	add r14,1
LB_60079:
	cmp r14,r10
	jge LB_60080
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60078
	cmp al,10
	jz LB_60078
	cmp al,32
	jz LB_60078
LB_60080:
	add r14,1
	cmp r14,r10
	jg LB_60083
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_60083
	jmp LB_60084
LB_60083:
	jmp LB_60057
LB_60084:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_60066
LB_60065:
	add r14,1
LB_60066:
	cmp r14,r10
	jge LB_60067
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60065
	cmp al,10
	jz LB_60065
	cmp al,32
	jz LB_60065
LB_60067:
	push r10
	call NS_E_57530_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60068
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60069
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60069:
	jmp LB_60058
LB_60068:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_60072
LB_60071:
	add r14,1
LB_60072:
	cmp r14,r10
	jge LB_60073
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60071
	cmp al,10
	jz LB_60071
	cmp al,32
	jz LB_60071
LB_60073:
	push r10
	call NS_E_57531_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60074
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60075
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60075:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60076
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60076:
	jmp LB_60058
LB_60074:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60063
	btr r12,2
	jmp LB_60064
LB_60063:
	bts r12,2
LB_60064:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60061
	btr r12,1
	jmp LB_60062
LB_60061:
	bts r12,1
LB_60062:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60059
	btr r12,0
	jmp LB_60060
LB_60059:
	bts r12,0
LB_60060:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_60054
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_60085
	btr r12,3
	jmp LB_60086
LB_60085:
	bts r12,3
LB_60086:
	mov r14,r8
	bt r12,2
	jc LB_60087
	btr r12,1
	jmp LB_60088
LB_60087:
	bts r12,1
LB_60088:
	mov r8,r13
	bt r12,0
	jc LB_60089
	btr r12,2
	jmp LB_60090
LB_60089:
	bts r12,2
LB_60090:
	mov r13,r9
	bt r12,3
	jc LB_60091
	btr r12,0
	jmp LB_60092
LB_60091:
	bts r12,0
LB_60092:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _cns { %_57758 %_57759 } ⊢ %_57760 : %_57760
 ; {>  %_57759~1':(_lst)◂(_p55435) %_57758~0':_p55435 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57760 ⊢ %_57761 : %_57761
 ; {>  %_57760~°0◂{ 0' 1' }:(_lst)◂(_p55435) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57761
 ; {>  %_57761~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p55435)) }
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
	jc LB_60048
	btr r12,2
	jmp LB_60049
LB_60048:
	bts r12,2
LB_60049:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_60046
	btr QWORD [rdi],0
	jmp LB_60047
LB_60046:
	bts QWORD [rdi],0
LB_60047:
	mov r8,r14
	bt r12,1
	jc LB_60052
	btr r12,2
	jmp LB_60053
LB_60052:
	bts r12,2
LB_60053:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_60050
	btr QWORD [rdi],1
	jmp LB_60051
LB_60050:
	bts QWORD [rdi],1
LB_60051:
	mov rsi,1
	bt r12,3
	jc LB_60044
	mov rsi,0
	bt r9,0
	jc LB_60044
	jmp LB_60045
LB_60044:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60045:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60054:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60056
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60055
LB_60056:
	add rsp,8
	ret
LB_60058:
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
LB_60057:
	add rsp,48
	pop r14
LB_60055:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "."
	jmp LB_60104
LB_60103:
	add r14,1
LB_60104:
	cmp r14,r10
	jge LB_60105
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60103
	cmp al,32
	jz LB_60103
LB_60105:
	add r14,1
	cmp r14,r10
	jg LB_60108
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_60108
	jmp LB_60109
LB_60108:
	jmp LB_60098
LB_60109:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_60111
LB_60110:
	add r14,1
LB_60111:
	cmp r14,r10
	jge LB_60112
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60110
	cmp al,32
	jz LB_60110
LB_60112:
	add r14,1
	cmp r14,r10
	jg LB_60116
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_60116
	jmp LB_60117
LB_60116:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60114
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60114:
	jmp LB_60098
LB_60117:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60101
	btr r12,1
	jmp LB_60102
LB_60101:
	bts r12,1
LB_60102:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60099
	btr r12,0
	jmp LB_60100
LB_60099:
	bts r12,0
LB_60100:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60095
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_57762 : %_57762
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_57762 ⊢ %_57763 : %_57763
 ; {>  %_57762~°1◂{  }:(_lst)◂(t19525'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57763
 ; {>  %_57763~°0◂°1◂{  }:(_opn)◂((_lst)◂(t19528'(0))) }
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
	jc LB_60093
	mov rsi,0
	bt r9,0
	jc LB_60093
	jmp LB_60094
LB_60093:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60094:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60095:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60097
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60096
LB_60097:
	add rsp,8
	ret
LB_60098:
	add rsp,32
	pop r14
LB_60096:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57532:
NS_E_RDI_57532:
NS_E_57532_ETR_TBL:
NS_E_57532_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60133
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60125
LB_60133:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_60141
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_60141
	jmp LB_60142
LB_60141:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60139
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60139:
	jmp LB_60125
LB_60142:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60128
	btr r12,1
	jmp LB_60129
LB_60128:
	bts r12,1
LB_60129:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60126
	btr r12,0
	jmp LB_60127
LB_60126:
	bts r12,0
LB_60127:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60122
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55498 %_57764 ⊢ %_57765 : %_57765
 ; {>  %_57764~0':_stg }
; _f55498 0' ⊢ °1◂0'
; _some %_57765 ⊢ %_57766 : %_57766
 ; {>  %_57765~°1◂0':_p55436 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57766
 ; {>  %_57766~°0◂°1◂0':(_opn)◂(_p55436) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60120
	btr r12,3
	jmp LB_60121
LB_60120:
	bts r12,3
LB_60121:
	mov rsi,1
	bt r12,3
	jc LB_60118
	mov rsi,0
	bt r9,0
	jc LB_60118
	jmp LB_60119
LB_60118:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60119:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60122:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60124
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60123
LB_60124:
	add rsp,8
	ret
LB_60125:
	add rsp,32
	pop r14
LB_60123:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_56572_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60156
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60150
LB_60156:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60151
	btr r12,0
	jmp LB_60152
LB_60151:
	bts r12,0
LB_60152:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60147
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55497 %_57767 ⊢ %_57768 : %_57768
 ; {>  %_57767~0':_p55431 }
; _f55497 0' ⊢ °0◂0'
; _some %_57768 ⊢ %_57769 : %_57769
 ; {>  %_57768~°0◂0':_p55436 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57769
 ; {>  %_57769~°0◂°0◂0':(_opn)◂(_p55436) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60145
	btr r12,3
	jmp LB_60146
LB_60145:
	bts r12,3
LB_60146:
	mov rsi,1
	bt r12,3
	jc LB_60143
	mov rsi,0
	bt r9,0
	jc LB_60143
	jmp LB_60144
LB_60143:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60144:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60147:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60149
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60148
LB_60149:
	add rsp,8
	ret
LB_60150:
	add rsp,16
	pop r14
LB_60148:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57534:
NS_E_RDI_57534:
NS_E_57534_ETR_TBL:
NS_E_57534_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; "@"
	jmp LB_60165
LB_60164:
	add r14,1
LB_60165:
	cmp r14,r10
	jge LB_60166
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60164
	cmp al,10
	jz LB_60164
	cmp al,32
	jz LB_60164
LB_60166:
	add r14,1
	cmp r14,r10
	jg LB_60169
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_60169
	jmp LB_60170
LB_60169:
	jmp LB_60158
LB_60170:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_60172
LB_60171:
	add r14,1
LB_60172:
	cmp r14,r10
	jge LB_60173
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60171
	cmp al,10
	jz LB_60171
	cmp al,32
	jz LB_60171
LB_60173:
	add r14,1
	cmp r14,r10
	jg LB_60177
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_60177
	jmp LB_60178
LB_60177:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60175
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60175:
	jmp LB_60158
LB_60178:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_60180
LB_60179:
	add r14,1
LB_60180:
	cmp r14,r10
	jge LB_60181
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60179
	cmp al,10
	jz LB_60179
	cmp al,32
	jz LB_60179
LB_60181:
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60182
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60183
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60183:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60184
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60184:
	jmp LB_60158
LB_60182:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_60187
LB_60186:
	add r14,1
LB_60187:
	cmp r14,r10
	jge LB_60188
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60186
	cmp al,10
	jz LB_60186
	cmp al,32
	jz LB_60186
LB_60188:
	push r10
	call NS_E_57536_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60189
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_60190
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_60190:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60191
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60191:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60192
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60192:
	jmp LB_60158
LB_60189:
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
	jc LB_60159
	btr QWORD [rdi],3
LB_60159:
	mov rax,QWORD [rsp+16*3+8*1]
	mov [rdi+8*1+8*3],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60160
	btr QWORD [rdi],2
LB_60160:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60161
	btr QWORD [rdi],1
LB_60161:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60162
	btr QWORD [rdi],0
LB_60162:
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
LB_60158:
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
NS_E_57536:
NS_E_RDI_57536:
NS_E_57536_ETR_TBL:
NS_E_57536_TBL:
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_60206
LB_60205:
	add r14,1
LB_60206:
	cmp r14,r10
	jge LB_60207
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60205
	cmp al,10
	jz LB_60205
	cmp al,32
	jz LB_60205
LB_60207:
	push r10
	call NS_E_57537_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60208
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60194
LB_60208:
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
	jc LB_60203
	btr QWORD [rdi],0
LB_60203:
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
LB_60194:
	add rsp,16
	pop r14
; _
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_60199
LB_60198:
	add r14,1
LB_60199:
	cmp r14,r10
	jge LB_60200
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60198
	cmp al,10
	jz LB_60198
	cmp al,32
	jz LB_60198
LB_60200:
	push r10
	call NS_E_57545_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60201
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60195
LB_60201:
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
	jc LB_60196
	btr QWORD [rdi],0
LB_60196:
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
LB_60195:
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
NS_E_57537:
NS_E_RDI_57537:
NS_E_57537_ETR_TBL:
NS_E_57537_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_60259
LB_60258:
	add r14,1
LB_60259:
	cmp r14,r10
	jge LB_60260
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60258
	cmp al,10
	jz LB_60258
	cmp al,32
	jz LB_60258
LB_60260:
	push r10
	call NS_E_57544_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60261
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60237
LB_60261:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_60246
LB_60245:
	add r14,1
LB_60246:
	cmp r14,r10
	jge LB_60247
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60245
	cmp al,10
	jz LB_60245
	cmp al,32
	jz LB_60245
LB_60247:
	push r10
	call NS_E_57539_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60248
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60249
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60249:
	jmp LB_60238
LB_60248:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_60252
LB_60251:
	add r14,1
LB_60252:
	cmp r14,r10
	jge LB_60253
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60251
	cmp al,10
	jz LB_60251
	cmp al,32
	jz LB_60251
LB_60253:
	push r10
	call NS_E_57538_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60254
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60255
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60255:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60256
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60256:
	jmp LB_60238
LB_60254:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60243
	btr r12,2
	jmp LB_60244
LB_60243:
	bts r12,2
LB_60244:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60241
	btr r12,1
	jmp LB_60242
LB_60241:
	bts r12,1
LB_60242:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60239
	btr r12,0
	jmp LB_60240
LB_60239:
	bts r12,0
LB_60240:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_60234
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_60263
	btr r12,5
	jmp LB_60264
LB_60263:
	bts r12,5
LB_60264:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_60267
	btr r12,6
	jmp LB_60268
LB_60267:
	bts r12,6
LB_60268:
	mov r8,rcx
	bt r12,6
	jc LB_60265
	btr r12,2
	jmp LB_60266
LB_60265:
	bts r12,2
LB_60266:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_60271
	btr r12,6
	jmp LB_60272
LB_60271:
	bts r12,6
LB_60272:
	mov r9,rcx
	bt r12,6
	jc LB_60269
	btr r12,3
	jmp LB_60270
LB_60269:
	bts r12,3
LB_60270:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_60275
	btr r12,6
	jmp LB_60276
LB_60275:
	bts r12,6
LB_60276:
	mov r10,rcx
	bt r12,6
	jc LB_60273
	btr r12,4
	jmp LB_60274
LB_60273:
	bts r12,4
LB_60274:
	mov rdi,r11
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55458 { %_57775 %_57776 %_57773 %_57774 %_57777 } ⊢ %_57778 : %_57778
 ; {>  %_57776~3':_p55432 %_57774~1':_p55421 %_57777~4':(_opn)◂(_p55419) %_57773~0':_p55420 %_57775~2':_p55429 }
; _f55458 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_57778 ⊢ %_57779 : %_57779
 ; {>  %_57778~°1◂{ 2' 3' 0' 1' 4' }:_p55419 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_57779
 ; {>  %_57779~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p55419) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_60210
	btr r12,5
	jmp LB_60211
LB_60210:
	bts r12,5
LB_60211:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_60216
	btr r12,6
	jmp LB_60217
LB_60216:
	bts r12,6
LB_60217:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_60214
	btr QWORD [rdi],0
	jmp LB_60215
LB_60214:
	bts QWORD [rdi],0
LB_60215:
	mov rcx,r11
	bt r12,5
	jc LB_60220
	btr r12,6
	jmp LB_60221
LB_60220:
	bts r12,6
LB_60221:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_60218
	btr QWORD [rdi],1
	jmp LB_60219
LB_60218:
	bts QWORD [rdi],1
LB_60219:
	mov rcx,r13
	bt r12,0
	jc LB_60224
	btr r12,6
	jmp LB_60225
LB_60224:
	bts r12,6
LB_60225:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_60222
	btr QWORD [rdi],2
	jmp LB_60223
LB_60222:
	bts QWORD [rdi],2
LB_60223:
	mov rcx,r14
	bt r12,1
	jc LB_60228
	btr r12,6
	jmp LB_60229
LB_60228:
	bts r12,6
LB_60229:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_60226
	btr QWORD [rdi],3
	jmp LB_60227
LB_60226:
	bts QWORD [rdi],3
LB_60227:
	mov rcx,r10
	bt r12,4
	jc LB_60232
	btr r12,6
	jmp LB_60233
LB_60232:
	bts r12,6
LB_60233:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_60230
	btr QWORD [rdi],4
	jmp LB_60231
LB_60230:
	bts QWORD [rdi],4
LB_60231:
	mov rsi,1
	bt r12,3
	jc LB_60212
	mov rsi,0
	bt r9,0
	jc LB_60212
	jmp LB_60213
LB_60212:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60213:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60234:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60236
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60235
LB_60236:
	add rsp,8
	ret
LB_60238:
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
LB_60237:
	add rsp,48
	pop r14
LB_60235:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; grm_ord
	jmp LB_60318
LB_60317:
	add r14,1
LB_60318:
	cmp r14,r10
	jge LB_60319
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60317
	cmp al,10
	jz LB_60317
	cmp al,32
	jz LB_60317
LB_60319:
	push r10
	call NS_E_57543_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60320
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60308
LB_60320:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_60323
LB_60322:
	add r14,1
LB_60323:
	cmp r14,r10
	jge LB_60324
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60322
	cmp al,10
	jz LB_60322
	cmp al,32
	jz LB_60322
LB_60324:
	push r10
	call NS_E_57539_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60325
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60326
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60326:
	jmp LB_60308
LB_60325:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_60329
LB_60328:
	add r14,1
LB_60329:
	cmp r14,r10
	jge LB_60330
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60328
	cmp al,10
	jz LB_60328
	cmp al,32
	jz LB_60328
LB_60330:
	push r10
	call NS_E_57538_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60331
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60332
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60332:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60333
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60333:
	jmp LB_60308
LB_60331:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_60336
LB_60335:
	add r14,1
LB_60336:
	cmp r14,r10
	jge LB_60337
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60335
	cmp al,10
	jz LB_60335
	cmp al,32
	jz LB_60335
LB_60337:
	push r10
	call NS_E_57537_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60338
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_60339
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_60339:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60340
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60340:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60341
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60341:
	jmp LB_60308
LB_60338:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_60315
	btr r12,3
	jmp LB_60316
LB_60315:
	bts r12,3
LB_60316:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60313
	btr r12,2
	jmp LB_60314
LB_60313:
	bts r12,2
LB_60314:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60311
	btr r12,1
	jmp LB_60312
LB_60311:
	bts r12,1
LB_60312:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60309
	btr r12,0
	jmp LB_60310
LB_60309:
	bts r12,0
LB_60310:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_60305
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_60343
	btr r12,5
	jmp LB_60344
LB_60343:
	bts r12,5
LB_60344:
	mov rcx,r8
	bt r12,2
	jc LB_60345
	btr r12,6
	jmp LB_60346
LB_60345:
	bts r12,6
LB_60346:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_60349
	btr r12,7
	jmp LB_60350
LB_60349:
	bts r12,7
LB_60350:
	mov r8,rdx
	bt r12,7
	jc LB_60347
	btr r12,2
	jmp LB_60348
LB_60347:
	bts r12,2
LB_60348:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_60353
	btr r12,7
	jmp LB_60354
LB_60353:
	bts r12,7
LB_60354:
	mov r9,rdx
	bt r12,7
	jc LB_60351
	btr r12,3
	jmp LB_60352
LB_60351:
	bts r12,3
LB_60352:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_60357
	btr r12,7
	jmp LB_60358
LB_60357:
	bts r12,7
LB_60358:
	mov r10,rdx
	bt r12,7
	jc LB_60355
	btr r12,4
	jmp LB_60356
LB_60355:
	bts r12,4
LB_60356:
	mov rdi,rcx
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55457 { %_57782 %_57783 %_57780 %_57781 %_57784 %_57785 } ⊢ %_57786 : %_57786
 ; {>  %_57782~2':_p55429 %_57781~1':_p55421 %_57785~5':_p55419 %_57783~3':_p55432 %_57784~4':(_opn)◂(_p55419) %_57780~0':_p55420 }
; _f55457 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_57786 ⊢ %_57787 : %_57787
 ; {>  %_57786~°0◂{ 2' 3' 0' 1' 4' 5' }:_p55419 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_57787
 ; {>  %_57787~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p55419) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_60277
	btr r12,6
	jmp LB_60278
LB_60277:
	bts r12,6
LB_60278:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_60283
	btr r12,7
	jmp LB_60284
LB_60283:
	bts r12,7
LB_60284:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rdx
	bt r12,7
	jc LB_60281
	btr QWORD [rdi],0
	jmp LB_60282
LB_60281:
	bts QWORD [rdi],0
LB_60282:
	mov rdx,rcx
	bt r12,6
	jc LB_60287
	btr r12,7
	jmp LB_60288
LB_60287:
	bts r12,7
LB_60288:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rdx
	bt r12,7
	jc LB_60285
	btr QWORD [rdi],1
	jmp LB_60286
LB_60285:
	bts QWORD [rdi],1
LB_60286:
	mov rdx,r13
	bt r12,0
	jc LB_60291
	btr r12,7
	jmp LB_60292
LB_60291:
	bts r12,7
LB_60292:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rdx
	bt r12,7
	jc LB_60289
	btr QWORD [rdi],2
	jmp LB_60290
LB_60289:
	bts QWORD [rdi],2
LB_60290:
	mov rdx,r14
	bt r12,1
	jc LB_60295
	btr r12,7
	jmp LB_60296
LB_60295:
	bts r12,7
LB_60296:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rdx
	bt r12,7
	jc LB_60293
	btr QWORD [rdi],3
	jmp LB_60294
LB_60293:
	bts QWORD [rdi],3
LB_60294:
	mov rdx,r10
	bt r12,4
	jc LB_60299
	btr r12,7
	jmp LB_60300
LB_60299:
	bts r12,7
LB_60300:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rdx
	bt r12,7
	jc LB_60297
	btr QWORD [rdi],4
	jmp LB_60298
LB_60297:
	bts QWORD [rdi],4
LB_60298:
	mov rdx,r11
	bt r12,5
	jc LB_60303
	btr r12,7
	jmp LB_60304
LB_60303:
	bts r12,7
LB_60304:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*5],rdx
	bt r12,7
	jc LB_60301
	btr QWORD [rdi],5
	jmp LB_60302
LB_60301:
	bts QWORD [rdi],5
LB_60302:
	mov rsi,1
	bt r12,3
	jc LB_60279
	mov rsi,0
	bt r9,0
	jc LB_60279
	jmp LB_60280
LB_60279:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60280:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60305:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60307
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60306
LB_60307:
	add rsp,8
	ret
LB_60308:
	add rsp,64
	pop r14
LB_60306:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57538:
NS_E_RDI_57538:
NS_E_57538_ETR_TBL:
NS_E_57538_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; ";"
	jmp LB_60413
LB_60412:
	add r14,1
LB_60413:
	cmp r14,r10
	jge LB_60414
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60412
	cmp al,10
	jz LB_60412
	cmp al,32
	jz LB_60412
LB_60414:
	add r14,1
	cmp r14,r10
	jg LB_60417
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_60417
	jmp LB_60418
LB_60417:
	jmp LB_60376
LB_60418:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_60420
LB_60419:
	add r14,1
LB_60420:
	cmp r14,r10
	jge LB_60421
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60419
	cmp al,10
	jz LB_60419
	cmp al,32
	jz LB_60419
LB_60421:
	add r14,3
	cmp r14,r10
	jg LB_60425
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_60425
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_60425
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_60425
	jmp LB_60426
LB_60425:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60423
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60423:
	jmp LB_60376
LB_60426:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_60389
LB_60388:
	add r14,1
LB_60389:
	cmp r14,r10
	jge LB_60390
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60388
	cmp al,10
	jz LB_60388
	cmp al,32
	jz LB_60388
LB_60390:
	push r10
	call NS_E_56965_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60391
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60392
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60392:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60393
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60393:
	jmp LB_60377
LB_60391:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_60396
LB_60395:
	add r14,1
LB_60396:
	cmp r14,r10
	jge LB_60397
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60395
	cmp al,10
	jz LB_60395
	cmp al,32
	jz LB_60395
LB_60397:
	push r10
	call NS_E_57520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60398
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_60399
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_60399:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60400
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60400:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60401
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60401:
	jmp LB_60377
LB_60398:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_60404
LB_60403:
	add r14,1
LB_60404:
	cmp r14,r10
	jge LB_60405
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60403
	cmp al,10
	jz LB_60403
	cmp al,32
	jz LB_60403
LB_60405:
	push r10
	call NS_E_57537_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60406
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_60407
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_60407:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_60408
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_60408:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60409
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60409:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60410
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60410:
	jmp LB_60377
LB_60406:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_60386
	btr r12,4
	jmp LB_60387
LB_60386:
	bts r12,4
LB_60387:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_60384
	btr r12,3
	jmp LB_60385
LB_60384:
	bts r12,3
LB_60385:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60382
	btr r12,2
	jmp LB_60383
LB_60382:
	bts r12,2
LB_60383:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60380
	btr r12,1
	jmp LB_60381
LB_60380:
	bts r12,1
LB_60381:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60378
	btr r12,0
	jmp LB_60379
LB_60378:
	bts r12,0
LB_60379:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_60373
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_60427
	btr r12,5
	jmp LB_60428
LB_60427:
	bts r12,5
LB_60428:
	mov r8,r10
	bt r12,4
	jc LB_60429
	btr r12,2
	jmp LB_60430
LB_60429:
	bts r12,2
LB_60430:
	mov r10,r14
	bt r12,1
	jc LB_60431
	btr r12,4
	jmp LB_60432
LB_60431:
	bts r12,4
LB_60432:
	mov r14,r9
	bt r12,3
	jc LB_60433
	btr r12,1
	jmp LB_60434
LB_60433:
	bts r12,1
LB_60434:
	mov r9,r13
	bt r12,0
	jc LB_60435
	btr r12,3
	jmp LB_60436
LB_60435:
	bts r12,3
LB_60436:
	mov r13,r11
	bt r12,5
	jc LB_60437
	btr r12,0
	jmp LB_60438
LB_60437:
	bts r12,0
LB_60438:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57790 ⊢ %_57791 : %_57791
 ; {>  %_57790~2':_p55419 %_57788~0':_p55429 %_57789~1':_p55432 }
; _some 2' ⊢ °0◂2'
; _some { %_57788 %_57789 %_57791 } ⊢ %_57792 : %_57792
 ; {>  %_57788~0':_p55429 %_57789~1':_p55432 %_57791~°0◂2':(_opn)◂(_p55419) }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_57792
 ; {>  %_57792~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ _p55429 _p55432 (_opn)◂(_p55419) }) }
; 	∎ °0◂{ 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' °0◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_60361
	btr r12,4
	jmp LB_60362
LB_60361:
	bts r12,4
LB_60362:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_60359
	btr QWORD [rdi],0
	jmp LB_60360
LB_60359:
	bts QWORD [rdi],0
LB_60360:
	mov r10,r14
	bt r12,1
	jc LB_60365
	btr r12,4
	jmp LB_60366
LB_60365:
	bts r12,4
LB_60366:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_60363
	btr QWORD [rdi],1
	jmp LB_60364
LB_60363:
	bts QWORD [rdi],1
LB_60364:
	mov r10,r8
	bt r12,2
	jc LB_60371
	btr r12,4
	jmp LB_60372
LB_60371:
	bts r12,4
LB_60372:
	mov rsi,1
	bt r12,4
	jc LB_60369
	mov rsi,0
	bt r10,0
	jc LB_60369
	jmp LB_60370
LB_60369:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_60370:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_60367
	btr QWORD [rdi],2
	jmp LB_60368
LB_60367:
	bts QWORD [rdi],2
LB_60368:
	mov r8,0
	bts r12,2
	ret
LB_60373:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60375
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60374
LB_60375:
	add rsp,8
	ret
LB_60377:
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
LB_60376:
	add rsp,80
	pop r14
LB_60374:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_60476
LB_60475:
	add r14,1
LB_60476:
	cmp r14,r10
	jge LB_60477
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60475
	cmp al,10
	jz LB_60475
	cmp al,32
	jz LB_60475
LB_60477:
	add r14,3
	cmp r14,r10
	jg LB_60480
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_60480
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_60480
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_60480
	jmp LB_60481
LB_60480:
	jmp LB_60454
LB_60481:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_60463
LB_60462:
	add r14,1
LB_60463:
	cmp r14,r10
	jge LB_60464
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60462
	cmp al,10
	jz LB_60462
	cmp al,32
	jz LB_60462
LB_60464:
	push r10
	call NS_E_56965_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60465
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60466
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60466:
	jmp LB_60455
LB_60465:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_60469
LB_60468:
	add r14,1
LB_60469:
	cmp r14,r10
	jge LB_60470
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60468
	cmp al,10
	jz LB_60468
	cmp al,32
	jz LB_60468
LB_60470:
	push r10
	call NS_E_57520_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60471
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60472
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60472:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60473
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60473:
	jmp LB_60455
LB_60471:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60460
	btr r12,2
	jmp LB_60461
LB_60460:
	bts r12,2
LB_60461:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60458
	btr r12,1
	jmp LB_60459
LB_60458:
	bts r12,1
LB_60459:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60456
	btr r12,0
	jmp LB_60457
LB_60456:
	bts r12,0
LB_60457:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_60451
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_60482
	btr r12,3
	jmp LB_60483
LB_60482:
	bts r12,3
LB_60483:
	mov r14,r8
	bt r12,2
	jc LB_60484
	btr r12,1
	jmp LB_60485
LB_60484:
	bts r12,1
LB_60485:
	mov r8,r13
	bt r12,0
	jc LB_60486
	btr r12,2
	jmp LB_60487
LB_60486:
	bts r12,2
LB_60487:
	mov r13,r9
	bt r12,3
	jc LB_60488
	btr r12,0
	jmp LB_60489
LB_60488:
	bts r12,0
LB_60489:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_57795 : %_57795
 ; {>  %_57794~1':_p55432 %_57793~0':_p55429 }
; _none {  } ⊢ °1◂{  }
; _some { %_57793 %_57794 %_57795 } ⊢ %_57796 : %_57796
 ; {>  %_57794~1':_p55432 %_57793~0':_p55429 %_57795~°1◂{  }:(_opn)◂(t19566'(0)) }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_57796
 ; {>  %_57796~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ _p55429 _p55432 (_opn)◂(t19569'(0)) }) }
; 	∎ °0◂{ 0' 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_60441
	btr r12,2
	jmp LB_60442
LB_60441:
	bts r12,2
LB_60442:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_60439
	btr QWORD [rdi],0
	jmp LB_60440
LB_60439:
	bts QWORD [rdi],0
LB_60440:
	mov r8,r14
	bt r12,1
	jc LB_60445
	btr r12,2
	jmp LB_60446
LB_60445:
	bts r12,2
LB_60446:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_60443
	btr QWORD [rdi],1
	jmp LB_60444
LB_60443:
	bts QWORD [rdi],1
LB_60444:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_60449
	mov rsi,0
	bt r8,0
	jc LB_60449
	jmp LB_60450
LB_60449:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_60450:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_60447
	btr QWORD [rdi],2
	jmp LB_60448
LB_60447:
	bts QWORD [rdi],2
LB_60448:
	mov r8,0
	bts r12,2
	ret
LB_60451:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60453
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60452
LB_60453:
	add rsp,8
	ret
LB_60455:
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
LB_60454:
	add rsp,48
	pop r14
LB_60452:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57539:
NS_E_RDI_57539:
NS_E_57539_ETR_TBL:
NS_E_57539_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; "!|"
	jmp LB_60510
LB_60509:
	add r14,1
LB_60510:
	cmp r14,r10
	jge LB_60511
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60509
	cmp al,10
	jz LB_60509
	cmp al,32
	jz LB_60509
LB_60511:
	add r14,2
	cmp r14,r10
	jg LB_60514
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_60514
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_60514
	jmp LB_60515
LB_60514:
	jmp LB_60497
LB_60515:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_60504
LB_60503:
	add r14,1
LB_60504:
	cmp r14,r10
	jge LB_60505
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60503
	cmp al,10
	jz LB_60503
	cmp al,32
	jz LB_60503
LB_60505:
	push r10
	call NS_E_57540_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60506
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60507
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60507:
	jmp LB_60498
LB_60506:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60501
	btr r12,1
	jmp LB_60502
LB_60501:
	bts r12,1
LB_60502:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60499
	btr r12,0
	jmp LB_60500
LB_60499:
	bts r12,0
LB_60500:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60494
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_60516
	btr r12,2
	jmp LB_60517
LB_60516:
	bts r12,2
LB_60517:
	mov r13,r14
	bt r12,1
	jc LB_60518
	btr r12,0
	jmp LB_60519
LB_60518:
	bts r12,0
LB_60519:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55462 %_57797 ⊢ %_57798 : %_57798
 ; {>  %_57797~0':_p55422 }
; _f55462 0' ⊢ °0◂0'
; _some %_57798 ⊢ %_57799 : %_57799
 ; {>  %_57798~°0◂0':_p55421 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57799
 ; {>  %_57799~°0◂°0◂0':(_opn)◂(_p55421) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60492
	btr r12,3
	jmp LB_60493
LB_60492:
	bts r12,3
LB_60493:
	mov rsi,1
	bt r12,3
	jc LB_60490
	mov rsi,0
	bt r9,0
	jc LB_60490
	jmp LB_60491
LB_60490:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60491:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60494:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60496
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60495
LB_60496:
	add rsp,8
	ret
LB_60498:
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
LB_60497:
	add rsp,32
	pop r14
LB_60495:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_60539
LB_60538:
	add r14,1
LB_60539:
	cmp r14,r10
	jge LB_60540
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60538
	cmp al,10
	jz LB_60538
	cmp al,32
	jz LB_60538
LB_60540:
	push r10
	call NS_E_57541_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60541
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60533
LB_60541:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_60544
LB_60543:
	add r14,1
LB_60544:
	cmp r14,r10
	jge LB_60545
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60543
	cmp al,10
	jz LB_60543
	cmp al,32
	jz LB_60543
LB_60545:
	push r10
	call NS_E_57539_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60546
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60547
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60547:
	jmp LB_60533
LB_60546:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60536
	btr r12,1
	jmp LB_60537
LB_60536:
	bts r12,1
LB_60537:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60534
	btr r12,0
	jmp LB_60535
LB_60534:
	bts r12,0
LB_60535:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60530
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f55463 { %_57800 %_57801 } ⊢ %_57802 : %_57802
 ; {>  %_57801~1':_p55421 %_57800~0':_p55423 }
; _f55463 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_57802 ⊢ %_57803 : %_57803
 ; {>  %_57802~°1◂{ 0' 1' }:_p55421 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_57803
 ; {>  %_57803~°0◂°1◂{ 0' 1' }:(_opn)◂(_p55421) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_60524
	btr r12,2
	jmp LB_60525
LB_60524:
	bts r12,2
LB_60525:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_60522
	btr QWORD [rdi],0
	jmp LB_60523
LB_60522:
	bts QWORD [rdi],0
LB_60523:
	mov r8,r14
	bt r12,1
	jc LB_60528
	btr r12,2
	jmp LB_60529
LB_60528:
	bts r12,2
LB_60529:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_60526
	btr QWORD [rdi],1
	jmp LB_60527
LB_60526:
	bts QWORD [rdi],1
LB_60527:
	mov rsi,1
	bt r12,3
	jc LB_60520
	mov rsi,0
	bt r9,0
	jc LB_60520
	jmp LB_60521
LB_60520:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60521:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60530:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60532
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60531
LB_60532:
	add rsp,8
	ret
LB_60533:
	add rsp,32
	pop r14
LB_60531:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_60551
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f55464 {  } ⊢ %_57804 : %_57804
 ; {>  }
; _f55464 {  } ⊢ °2◂{  }
; _some %_57804 ⊢ %_57805 : %_57805
 ; {>  %_57804~°2◂{  }:_p55421 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_57805
 ; {>  %_57805~°0◂°2◂{  }:(_opn)◂(_p55421) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_60549
	mov rsi,0
	bt r9,0
	jc LB_60549
	jmp LB_60550
LB_60549:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60550:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60551:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60553
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60552
LB_60553:
	add rsp,8
	ret
LB_60554:
	add rsp,0
	pop r14
LB_60552:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57540:
NS_E_RDI_57540:
NS_E_57540_ETR_TBL:
NS_E_57540_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_60574
LB_60573:
	add r14,1
LB_60574:
	cmp r14,r10
	jge LB_60575
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60573
	cmp al,10
	jz LB_60573
	cmp al,32
	jz LB_60573
LB_60575:
	push r10
	call NS_E_57541_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60576
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60568
LB_60576:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_60579
LB_60578:
	add r14,1
LB_60579:
	cmp r14,r10
	jge LB_60580
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60578
	cmp al,10
	jz LB_60578
	cmp al,32
	jz LB_60578
LB_60580:
	push r10
	call NS_E_57540_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60581
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60582
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60582:
	jmp LB_60568
LB_60581:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60571
	btr r12,1
	jmp LB_60572
LB_60571:
	bts r12,1
LB_60572:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60569
	btr r12,0
	jmp LB_60570
LB_60569:
	bts r12,0
LB_60570:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60565
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f55465 { %_57806 %_57807 } ⊢ %_57808 : %_57808
 ; {>  %_57806~0':_p55423 %_57807~1':_p55422 }
; _f55465 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_57808 ⊢ %_57809 : %_57809
 ; {>  %_57808~°0◂{ 0' 1' }:_p55422 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_57809
 ; {>  %_57809~°0◂°0◂{ 0' 1' }:(_opn)◂(_p55422) }
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
	jc LB_60559
	btr r12,2
	jmp LB_60560
LB_60559:
	bts r12,2
LB_60560:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_60557
	btr QWORD [rdi],0
	jmp LB_60558
LB_60557:
	bts QWORD [rdi],0
LB_60558:
	mov r8,r14
	bt r12,1
	jc LB_60563
	btr r12,2
	jmp LB_60564
LB_60563:
	bts r12,2
LB_60564:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_60561
	btr QWORD [rdi],1
	jmp LB_60562
LB_60561:
	bts QWORD [rdi],1
LB_60562:
	mov rsi,1
	bt r12,3
	jc LB_60555
	mov rsi,0
	bt r9,0
	jc LB_60555
	jmp LB_60556
LB_60555:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60556:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60565:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60567
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60566
LB_60567:
	add rsp,8
	ret
LB_60568:
	add rsp,32
	pop r14
LB_60566:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_60586
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f55466 {  } ⊢ %_57810 : %_57810
 ; {>  }
; _f55466 {  } ⊢ °1◂{  }
; _some %_57810 ⊢ %_57811 : %_57811
 ; {>  %_57810~°1◂{  }:_p55422 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57811
 ; {>  %_57811~°0◂°1◂{  }:(_opn)◂(_p55422) }
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
	jc LB_60584
	mov rsi,0
	bt r9,0
	jc LB_60584
	jmp LB_60585
LB_60584:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60585:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60586:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60588
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60587
LB_60588:
	add rsp,8
	ret
LB_60589:
	add rsp,0
	pop r14
LB_60587:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57541:
NS_E_RDI_57541:
NS_E_57541_ETR_TBL:
NS_E_57541_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_60605
LB_60604:
	add r14,1
LB_60605:
	cmp r14,r10
	jge LB_60606
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60604
	cmp al,10
	jz LB_60604
	cmp al,32
	jz LB_60604
LB_60606:
	add r14,3
	cmp r14,r10
	jg LB_60609
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_60609
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_60609
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_60609
	jmp LB_60610
LB_60609:
	jmp LB_60597
LB_60610:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_60612
LB_60611:
	add r14,1
LB_60612:
	cmp r14,r10
	jge LB_60613
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60611
	cmp al,10
	jz LB_60611
	cmp al,32
	jz LB_60611
LB_60613:
	push r10
	call NS_E_57542_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60614
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60615
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60615:
	jmp LB_60597
LB_60614:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_60618
LB_60617:
	add r14,1
LB_60618:
	cmp r14,r10
	jge LB_60619
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60617
	cmp al,10
	jz LB_60617
	cmp al,32
	jz LB_60617
LB_60619:
	add r14,3
	cmp r14,r10
	jg LB_60624
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_60624
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_60624
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_60624
	jmp LB_60625
LB_60624:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60621
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60621:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60622
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60622:
	jmp LB_60597
LB_60625:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60602
	btr r12,2
	jmp LB_60603
LB_60602:
	bts r12,2
LB_60603:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60600
	btr r12,1
	jmp LB_60601
LB_60600:
	bts r12,1
LB_60601:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60598
	btr r12,0
	jmp LB_60599
LB_60598:
	bts r12,0
LB_60599:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_60594
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_60626
	btr r12,3
	jmp LB_60627
LB_60626:
	bts r12,3
LB_60627:
	mov r13,r14
	bt r12,1
	jc LB_60628
	btr r12,0
	jmp LB_60629
LB_60628:
	bts r12,0
LB_60629:
; 3' ⊢ {  }
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55467 %_57812 ⊢ %_57813 : %_57813
 ; {>  %_57812~0':_p55424 }
; _f55467 0' ⊢ °0◂0'
; _some %_57813 ⊢ %_57814 : %_57814
 ; {>  %_57813~°0◂0':_p55423 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57814
 ; {>  %_57814~°0◂°0◂0':(_opn)◂(_p55423) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60592
	btr r12,3
	jmp LB_60593
LB_60592:
	bts r12,3
LB_60593:
	mov rsi,1
	bt r12,3
	jc LB_60590
	mov rsi,0
	bt r9,0
	jc LB_60590
	jmp LB_60591
LB_60590:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60591:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60594:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60596
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60595
LB_60596:
	add rsp,8
	ret
LB_60597:
	add rsp,48
	pop r14
LB_60595:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_60641
LB_60640:
	add r14,1
LB_60641:
	cmp r14,r10
	jge LB_60642
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60640
	cmp al,10
	jz LB_60640
	cmp al,32
	jz LB_60640
LB_60642:
	push r10
	call NS_E_57542_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60643
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60637
LB_60643:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60638
	btr r12,0
	jmp LB_60639
LB_60638:
	bts r12,0
LB_60639:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60634
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55468 %_57815 ⊢ %_57816 : %_57816
 ; {>  %_57815~0':_p55424 }
; _f55468 0' ⊢ °1◂0'
; _some %_57816 ⊢ %_57817 : %_57817
 ; {>  %_57816~°1◂0':_p55423 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57817
 ; {>  %_57817~°0◂°1◂0':(_opn)◂(_p55423) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60632
	btr r12,3
	jmp LB_60633
LB_60632:
	bts r12,3
LB_60633:
	mov rsi,1
	bt r12,3
	jc LB_60630
	mov rsi,0
	bt r9,0
	jc LB_60630
	jmp LB_60631
LB_60630:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60631:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60634:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60636
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60635
LB_60636:
	add rsp,8
	ret
LB_60637:
	add rsp,16
	pop r14
LB_60635:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57542:
NS_E_RDI_57542:
NS_E_57542_ETR_TBL:
NS_E_57542_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_60656
LB_60655:
	add r14,1
LB_60656:
	cmp r14,r10
	jge LB_60657
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60655
	cmp al,10
	jz LB_60655
	cmp al,32
	jz LB_60655
LB_60657:
	push r10
	call NS_E_54852_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60658
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60652
LB_60658:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60653
	btr r12,0
	jmp LB_60654
LB_60653:
	bts r12,0
LB_60654:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60649
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55470 %_57818 ⊢ %_57819 : %_57819
 ; {>  %_57818~0':_stg }
; _f55470 0' ⊢ °1◂0'
; _some %_57819 ⊢ %_57820 : %_57820
 ; {>  %_57819~°1◂0':_p55424 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_57820
 ; {>  %_57820~°0◂°1◂0':(_opn)◂(_p55424) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60647
	btr r12,3
	jmp LB_60648
LB_60647:
	bts r12,3
LB_60648:
	mov rsi,1
	bt r12,3
	jc LB_60645
	mov rsi,0
	bt r9,0
	jc LB_60645
	jmp LB_60646
LB_60645:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60646:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60649:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60651
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60650
LB_60651:
	add rsp,8
	ret
LB_60652:
	add rsp,16
	pop r14
LB_60650:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; name
	jmp LB_60671
LB_60670:
	add r14,1
LB_60671:
	cmp r14,r10
	jge LB_60672
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60670
	cmp al,10
	jz LB_60670
	cmp al,32
	jz LB_60670
LB_60672:
	push r10
	call NS_E_56505_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60673
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60667
LB_60673:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60668
	btr r12,0
	jmp LB_60669
LB_60668:
	bts r12,0
LB_60669:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60664
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f55469 %_57821 ⊢ %_57822 : %_57822
 ; {>  %_57821~0':_p55407 }
; _f55469 0' ⊢ °0◂0'
; _some %_57822 ⊢ %_57823 : %_57823
 ; {>  %_57822~°0◂0':_p55424 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57823
 ; {>  %_57823~°0◂°0◂0':(_opn)◂(_p55424) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60662
	btr r12,3
	jmp LB_60663
LB_60662:
	bts r12,3
LB_60663:
	mov rsi,1
	bt r12,3
	jc LB_60660
	mov rsi,0
	bt r9,0
	jc LB_60660
	jmp LB_60661
LB_60660:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60661:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60664:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60666
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60665
LB_60666:
	add rsp,8
	ret
LB_60667:
	add rsp,16
	pop r14
LB_60665:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57543:
NS_E_RDI_57543:
NS_E_57543_ETR_TBL:
NS_E_57543_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_60684
LB_60683:
	add r14,1
LB_60684:
	cmp r14,r10
	jge LB_60685
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60683
	cmp al,10
	jz LB_60683
	cmp al,32
	jz LB_60683
LB_60685:
	add r14,4
	cmp r14,r10
	jg LB_60688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_60688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_60688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_60688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_60688
	jmp LB_60689
LB_60688:
	jmp LB_60680
LB_60689:
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
	jc LB_60681
	btr r12,0
	jmp LB_60682
LB_60681:
	bts r12,0
LB_60682:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60677
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55460 {  } ⊢ %_57824 : %_57824
 ; {>  }
; _f55460 {  } ⊢ °1◂{  }
; _some %_57824 ⊢ %_57825 : %_57825
 ; {>  %_57824~°1◂{  }:_p55420 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57825
 ; {>  %_57825~°0◂°1◂{  }:(_opn)◂(_p55420) }
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
	jc LB_60675
	mov rsi,0
	bt r9,0
	jc LB_60675
	jmp LB_60676
LB_60675:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60676:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60677:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60679
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60678
LB_60679:
	add rsp,8
	ret
LB_60680:
	add rsp,16
	pop r14
LB_60678:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_60699
LB_60698:
	add r14,1
LB_60699:
	cmp r14,r10
	jge LB_60700
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60698
	cmp al,10
	jz LB_60698
	cmp al,32
	jz LB_60698
LB_60700:
	add r14,4
	cmp r14,r10
	jg LB_60703
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_60703
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_60703
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_60703
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_60703
	jmp LB_60704
LB_60703:
	jmp LB_60695
LB_60704:
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
	jc LB_60696
	btr r12,0
	jmp LB_60697
LB_60696:
	bts r12,0
LB_60697:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60692
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55461 {  } ⊢ %_57826 : %_57826
 ; {>  }
; _f55461 {  } ⊢ °2◂{  }
; _some %_57826 ⊢ %_57827 : %_57827
 ; {>  %_57826~°2◂{  }:_p55420 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_57827
 ; {>  %_57827~°0◂°2◂{  }:(_opn)◂(_p55420) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_60690
	mov rsi,0
	bt r9,0
	jc LB_60690
	jmp LB_60691
LB_60690:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60691:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60692:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60694
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60693
LB_60694:
	add rsp,8
	ret
LB_60695:
	add rsp,16
	pop r14
LB_60693:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_60714
LB_60713:
	add r14,1
LB_60714:
	cmp r14,r10
	jge LB_60715
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60713
	cmp al,10
	jz LB_60713
	cmp al,32
	jz LB_60713
LB_60715:
	add r14,3
	cmp r14,r10
	jg LB_60718
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_60718
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_60718
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_60718
	jmp LB_60719
LB_60718:
	jmp LB_60710
LB_60719:
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
	jc LB_60711
	btr r12,0
	jmp LB_60712
LB_60711:
	bts r12,0
LB_60712:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60707
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55459 {  } ⊢ %_57828 : %_57828
 ; {>  }
; _f55459 {  } ⊢ °0◂{  }
; _some %_57828 ⊢ %_57829 : %_57829
 ; {>  %_57828~°0◂{  }:_p55420 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_57829
 ; {>  %_57829~°0◂°0◂{  }:(_opn)◂(_p55420) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_60705
	mov rsi,0
	bt r9,0
	jc LB_60705
	jmp LB_60706
LB_60705:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60706:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60707:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60709
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60708
LB_60709:
	add rsp,8
	ret
LB_60710:
	add rsp,16
	pop r14
LB_60708:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57544:
NS_E_RDI_57544:
NS_E_57544_ETR_TBL:
NS_E_57544_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_60729
LB_60728:
	add r14,1
LB_60729:
	cmp r14,r10
	jge LB_60730
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60728
	cmp al,10
	jz LB_60728
	cmp al,32
	jz LB_60728
LB_60730:
	add r14,5
	cmp r14,r10
	jg LB_60733
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_60733
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_60733
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_60733
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_60733
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_60733
	jmp LB_60734
LB_60733:
	jmp LB_60725
LB_60734:
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
	jc LB_60726
	btr r12,0
	jmp LB_60727
LB_60726:
	bts r12,0
LB_60727:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60722
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55460 {  } ⊢ %_57830 : %_57830
 ; {>  }
; _f55460 {  } ⊢ °1◂{  }
; _some %_57830 ⊢ %_57831 : %_57831
 ; {>  %_57830~°1◂{  }:_p55420 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57831
 ; {>  %_57831~°0◂°1◂{  }:(_opn)◂(_p55420) }
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
	jc LB_60720
	mov rsi,0
	bt r9,0
	jc LB_60720
	jmp LB_60721
LB_60720:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60721:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60722:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60724
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60723
LB_60724:
	add rsp,8
	ret
LB_60725:
	add rsp,16
	pop r14
LB_60723:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_60744
LB_60743:
	add r14,1
LB_60744:
	cmp r14,r10
	jge LB_60745
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60743
	cmp al,10
	jz LB_60743
	cmp al,32
	jz LB_60743
LB_60745:
	add r14,5
	cmp r14,r10
	jg LB_60748
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_60748
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_60748
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_60748
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_60748
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_60748
	jmp LB_60749
LB_60748:
	jmp LB_60740
LB_60749:
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
	jc LB_60741
	btr r12,0
	jmp LB_60742
LB_60741:
	bts r12,0
LB_60742:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60737
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55461 {  } ⊢ %_57832 : %_57832
 ; {>  }
; _f55461 {  } ⊢ °2◂{  }
; _some %_57832 ⊢ %_57833 : %_57833
 ; {>  %_57832~°2◂{  }:_p55420 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_57833
 ; {>  %_57833~°0◂°2◂{  }:(_opn)◂(_p55420) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_60735
	mov rsi,0
	bt r9,0
	jc LB_60735
	jmp LB_60736
LB_60735:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60736:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60737:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60739
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60738
LB_60739:
	add rsp,8
	ret
LB_60740:
	add rsp,16
	pop r14
LB_60738:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_60759
LB_60758:
	add r14,1
LB_60759:
	cmp r14,r10
	jge LB_60760
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60758
	cmp al,10
	jz LB_60758
	cmp al,32
	jz LB_60758
LB_60760:
	add r14,4
	cmp r14,r10
	jg LB_60763
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_60763
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_60763
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_60763
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_60763
	jmp LB_60764
LB_60763:
	jmp LB_60755
LB_60764:
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
	jc LB_60756
	btr r12,0
	jmp LB_60757
LB_60756:
	bts r12,0
LB_60757:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_60752
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _f55459 {  } ⊢ %_57834 : %_57834
 ; {>  }
; _f55459 {  } ⊢ °0◂{  }
; _some %_57834 ⊢ %_57835 : %_57835
 ; {>  %_57834~°0◂{  }:_p55420 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_57835
 ; {>  %_57835~°0◂°0◂{  }:(_opn)◂(_p55420) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_60750
	mov rsi,0
	bt r9,0
	jc LB_60750
	jmp LB_60751
LB_60750:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60751:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60752:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60754
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60753
LB_60754:
	add rsp,8
	ret
LB_60755:
	add rsp,16
	pop r14
LB_60753:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57545:
NS_E_RDI_57545:
NS_E_57545_ETR_TBL:
NS_E_57545_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_60820
LB_60819:
	add r14,1
LB_60820:
	cmp r14,r10
	jge LB_60821
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60819
	cmp al,10
	jz LB_60819
	cmp al,32
	jz LB_60819
LB_60821:
	push r10
	call NS_E_57544_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60822
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60788
LB_60822:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_60799
LB_60798:
	add r14,1
LB_60799:
	cmp r14,r10
	jge LB_60800
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60798
	cmp al,10
	jz LB_60798
	cmp al,32
	jz LB_60798
LB_60800:
	push r10
	call NS_E_57547_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60801
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60802
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60802:
	jmp LB_60789
LB_60801:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_60805
LB_60804:
	add r14,1
LB_60805:
	cmp r14,r10
	jge LB_60806
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60804
	cmp al,10
	jz LB_60804
	cmp al,32
	jz LB_60804
LB_60806:
	push r10
	call NS_E_57539_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60807
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60808
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60808:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60809
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60809:
	jmp LB_60789
LB_60807:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_60812
LB_60811:
	add r14,1
LB_60812:
	cmp r14,r10
	jge LB_60813
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60811
	cmp al,10
	jz LB_60811
	cmp al,32
	jz LB_60811
LB_60813:
	push r10
	call NS_E_57546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60814
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_60815
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_60815:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60816
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60816:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60817
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60817:
	jmp LB_60789
LB_60814:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_60796
	btr r12,3
	jmp LB_60797
LB_60796:
	bts r12,3
LB_60797:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60794
	btr r12,2
	jmp LB_60795
LB_60794:
	bts r12,2
LB_60795:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60792
	btr r12,1
	jmp LB_60793
LB_60792:
	bts r12,1
LB_60793:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60790
	btr r12,0
	jmp LB_60791
LB_60790:
	bts r12,0
LB_60791:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_60785
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f55456 { %_57837 %_57836 %_57838 %_57839 } ⊢ %_57840 : %_57840
 ; {>  %_57838~2':_p55421 %_57839~3':(_opn)◂(_p55418) %_57836~0':_p55420 %_57837~1':(_opn)◂(_stg) }
; _f55456 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_57840 ⊢ %_57841 : %_57841
 ; {>  %_57840~°1◂{ 1' 0' 2' 3' }:_p55418 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_57841
 ; {>  %_57841~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p55418) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_60765
	btr r12,4
	jmp LB_60766
LB_60765:
	bts r12,4
LB_60766:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_60771
	btr r12,5
	jmp LB_60772
LB_60771:
	bts r12,5
LB_60772:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_60769
	btr QWORD [rdi],0
	jmp LB_60770
LB_60769:
	bts QWORD [rdi],0
LB_60770:
	mov r11,r13
	bt r12,0
	jc LB_60775
	btr r12,5
	jmp LB_60776
LB_60775:
	bts r12,5
LB_60776:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_60773
	btr QWORD [rdi],1
	jmp LB_60774
LB_60773:
	bts QWORD [rdi],1
LB_60774:
	mov r11,r8
	bt r12,2
	jc LB_60779
	btr r12,5
	jmp LB_60780
LB_60779:
	bts r12,5
LB_60780:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_60777
	btr QWORD [rdi],2
	jmp LB_60778
LB_60777:
	bts QWORD [rdi],2
LB_60778:
	mov r11,r10
	bt r12,4
	jc LB_60783
	btr r12,5
	jmp LB_60784
LB_60783:
	bts r12,5
LB_60784:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],r11
	bt r12,5
	jc LB_60781
	btr QWORD [rdi],3
	jmp LB_60782
LB_60781:
	bts QWORD [rdi],3
LB_60782:
	mov rsi,1
	bt r12,3
	jc LB_60767
	mov rsi,0
	bt r9,0
	jc LB_60767
	jmp LB_60768
LB_60767:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60768:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60785:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60787
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60786
LB_60787:
	add rsp,8
	ret
LB_60789:
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
LB_60788:
	add rsp,64
	pop r14
LB_60786:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,80
; grm_ord
	jmp LB_60863
LB_60862:
	add r14,1
LB_60863:
	cmp r14,r10
	jge LB_60864
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60862
	cmp al,10
	jz LB_60862
	cmp al,32
	jz LB_60862
LB_60864:
	push r10
	call NS_E_57543_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60865
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60851
LB_60865:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_60868
LB_60867:
	add r14,1
LB_60868:
	cmp r14,r10
	jge LB_60869
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60867
	cmp al,10
	jz LB_60867
	cmp al,32
	jz LB_60867
LB_60869:
	push r10
	call NS_E_57547_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60870
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60871
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60871:
	jmp LB_60851
LB_60870:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_60874
LB_60873:
	add r14,1
LB_60874:
	cmp r14,r10
	jge LB_60875
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60873
	cmp al,10
	jz LB_60873
	cmp al,32
	jz LB_60873
LB_60875:
	push r10
	call NS_E_57539_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60876
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60877
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60877:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60878
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60878:
	jmp LB_60851
LB_60876:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_60881
LB_60880:
	add r14,1
LB_60881:
	cmp r14,r10
	jge LB_60882
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60880
	cmp al,10
	jz LB_60880
	cmp al,32
	jz LB_60880
LB_60882:
	push r10
	call NS_E_57546_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60883
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_60884
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_60884:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60885
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60885:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60886
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60886:
	jmp LB_60851
LB_60883:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_60889
LB_60888:
	add r14,1
LB_60889:
	cmp r14,r10
	jge LB_60890
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60888
	cmp al,10
	jz LB_60888
	cmp al,32
	jz LB_60888
LB_60890:
	push r10
	call NS_E_57545_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60891
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_60892
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_60892:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_60893
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_60893:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_60894
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_60894:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60895
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60895:
	jmp LB_60851
LB_60891:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_60860
	btr r12,4
	jmp LB_60861
LB_60860:
	bts r12,4
LB_60861:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_60858
	btr r12,3
	jmp LB_60859
LB_60858:
	bts r12,3
LB_60859:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_60856
	btr r12,2
	jmp LB_60857
LB_60856:
	bts r12,2
LB_60857:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60854
	btr r12,1
	jmp LB_60855
LB_60854:
	bts r12,1
LB_60855:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60852
	btr r12,0
	jmp LB_60853
LB_60852:
	bts r12,0
LB_60853:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_60848
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
; _f55455 { %_57843 %_57842 %_57844 %_57845 %_57846 } ⊢ %_57847 : %_57847
 ; {>  %_57842~0':_p55420 %_57843~1':(_opn)◂(_stg) %_57846~4':_p55418 %_57845~3':(_opn)◂(_p55418) %_57844~2':_p55421 }
; _f55455 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_57847 ⊢ %_57848 : %_57848
 ; {>  %_57847~°0◂{ 1' 0' 2' 3' 4' }:_p55418 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_57848
 ; {>  %_57848~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p55418) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_60824
	btr r12,5
	jmp LB_60825
LB_60824:
	bts r12,5
LB_60825:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_60830
	btr r12,6
	jmp LB_60831
LB_60830:
	bts r12,6
LB_60831:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_60828
	btr QWORD [rdi],0
	jmp LB_60829
LB_60828:
	bts QWORD [rdi],0
LB_60829:
	mov rcx,r13
	bt r12,0
	jc LB_60834
	btr r12,6
	jmp LB_60835
LB_60834:
	bts r12,6
LB_60835:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_60832
	btr QWORD [rdi],1
	jmp LB_60833
LB_60832:
	bts QWORD [rdi],1
LB_60833:
	mov rcx,r8
	bt r12,2
	jc LB_60838
	btr r12,6
	jmp LB_60839
LB_60838:
	bts r12,6
LB_60839:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_60836
	btr QWORD [rdi],2
	jmp LB_60837
LB_60836:
	bts QWORD [rdi],2
LB_60837:
	mov rcx,r11
	bt r12,5
	jc LB_60842
	btr r12,6
	jmp LB_60843
LB_60842:
	bts r12,6
LB_60843:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_60840
	btr QWORD [rdi],3
	jmp LB_60841
LB_60840:
	bts QWORD [rdi],3
LB_60841:
	mov rcx,r10
	bt r12,4
	jc LB_60846
	btr r12,6
	jmp LB_60847
LB_60846:
	bts r12,6
LB_60847:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_60844
	btr QWORD [rdi],4
	jmp LB_60845
LB_60844:
	bts QWORD [rdi],4
LB_60845:
	mov rsi,1
	bt r12,3
	jc LB_60826
	mov rsi,0
	bt r9,0
	jc LB_60826
	jmp LB_60827
LB_60826:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60827:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60848:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60850
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60849
LB_60850:
	add rsp,8
	ret
LB_60851:
	add rsp,80
	pop r14
LB_60849:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57546:
NS_E_RDI_57546:
NS_E_57546_ETR_TBL:
NS_E_57546_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; ";"
	jmp LB_60910
LB_60909:
	add r14,1
LB_60910:
	cmp r14,r10
	jge LB_60911
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60909
	cmp al,10
	jz LB_60909
	cmp al,32
	jz LB_60909
LB_60911:
	add r14,1
	cmp r14,r10
	jg LB_60914
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_60914
	jmp LB_60915
LB_60914:
	jmp LB_60904
LB_60915:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_60917
LB_60916:
	add r14,1
LB_60917:
	cmp r14,r10
	jge LB_60918
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60916
	cmp al,10
	jz LB_60916
	cmp al,32
	jz LB_60916
LB_60918:
	push r10
	call NS_E_57545_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60919
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60920
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60920:
	jmp LB_60904
LB_60919:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60907
	btr r12,1
	jmp LB_60908
LB_60907:
	bts r12,1
LB_60908:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60905
	btr r12,0
	jmp LB_60906
LB_60905:
	bts r12,0
LB_60906:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60901
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_60922
	btr r12,2
	jmp LB_60923
LB_60922:
	bts r12,2
LB_60923:
	mov r13,r14
	bt r12,1
	jc LB_60924
	btr r12,0
	jmp LB_60925
LB_60924:
	bts r12,0
LB_60925:
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57849 ⊢ %_57850 : %_57850
 ; {>  %_57849~0':_p55418 }
; _some 0' ⊢ °0◂0'
; _some %_57850 ⊢ %_57851 : %_57851
 ; {>  %_57850~°0◂0':(_opn)◂(_p55418) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57851
 ; {>  %_57851~°0◂°0◂0':(_opn)◂((_opn)◂(_p55418)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60899
	btr r12,3
	jmp LB_60900
LB_60899:
	bts r12,3
LB_60900:
	mov rsi,1
	bt r12,3
	jc LB_60897
	mov rsi,0
	bt r9,0
	jc LB_60897
	jmp LB_60898
LB_60897:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60898:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60901:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60903
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60902
LB_60903:
	add rsp,8
	ret
LB_60904:
	add rsp,32
	pop r14
LB_60902:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_60928
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_57852 : %_57852
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_57852 ⊢ %_57853 : %_57853
 ; {>  %_57852~°1◂{  }:(_opn)◂(t19647'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57853
 ; {>  %_57853~°0◂°1◂{  }:(_opn)◂((_opn)◂(t19650'(0))) }
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
	jc LB_60926
	mov rsi,0
	bt r9,0
	jc LB_60926
	jmp LB_60927
LB_60926:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60927:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60928:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60930
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60929
LB_60930:
	add rsp,8
	ret
LB_60931:
	add rsp,0
	pop r14
LB_60929:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_57547:
NS_E_RDI_57547:
NS_E_57547_ETR_TBL:
NS_E_57547_TBL:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,32
; word
	jmp LB_60945
LB_60944:
	add r14,1
LB_60945:
	cmp r14,r10
	jge LB_60946
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60944
	cmp al,10
	jz LB_60944
	cmp al,32
	jz LB_60944
LB_60946:
	push r10
	call NS_E_55220_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_60947
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60939
LB_60947:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_60950
LB_60949:
	add r14,1
LB_60950:
	cmp r14,r10
	jge LB_60951
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_60949
	cmp al,10
	jz LB_60949
	cmp al,32
	jz LB_60949
LB_60951:
	add r14,1
	cmp r14,r10
	jg LB_60955
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_60955
	jmp LB_60956
LB_60955:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_60953
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_60953:
	jmp LB_60939
LB_60956:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_60942
	btr r12,1
	jmp LB_60943
LB_60942:
	bts r12,1
LB_60943:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_60940
	btr r12,0
	jmp LB_60941
LB_60940:
	bts r12,0
LB_60941:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_60936
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [rdi],rbx
	mov rbx,rdi
; _some %_57854 ⊢ %_57855 : %_57855
 ; {>  %_57854~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_57855 ⊢ %_57856 : %_57856
 ; {>  %_57855~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_57856
 ; {>  %_57856~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_60934
	btr r12,3
	jmp LB_60935
LB_60934:
	bts r12,3
LB_60935:
	mov rsi,1
	bt r12,3
	jc LB_60932
	mov rsi,0
	bt r9,0
	jc LB_60932
	jmp LB_60933
LB_60932:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60933:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60936:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60938
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60937
LB_60938:
	add rsp,8
	ret
LB_60939:
	add rsp,32
	pop r14
LB_60937:
	mov r10,QWORD [r13]
	shr r10,32
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_60959
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_57857 : %_57857
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_57857 ⊢ %_57858 : %_57858
 ; {>  %_57857~°1◂{  }:(_opn)◂(t19659'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_57858
 ; {>  %_57858~°0◂°1◂{  }:(_opn)◂((_opn)◂(t19662'(0))) }
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
	jc LB_60957
	mov rsi,0
	bt r9,0
	jc LB_60957
	jmp LB_60958
LB_60957:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_60958:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_60959:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_60961
	pop r14
	mov rdi,r9
	mov QWORD [rdi],rbx
	mov rbx,rdi
	jmp LB_60960
LB_60961:
	add rsp,8
	ret
LB_60962:
	add rsp,0
	pop r14
LB_60960:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,QWORD [rbx]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_61011:
NS_E_RDI_61011:
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
; » 0xr0 |~ {  } ⊢ %_60964 : %_60964
 ; {>  %_60963~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_60964
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f15 |~ {  } ⊢ %_60965 : %_60965
 ; {>  %_60964~1':_r64 %_60963~0':_stg }
; 	» _args _ ⊢ 2' : %_60965
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
MTC_LB_61012:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_61013
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
	jnc LB_61014
	bt QWORD [rax],0
	jc LB_61015
	btr r12,5
	jmp LB_61016
LB_61015:
	bts r12,5
LB_61016:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_61014:
	mov r11,rax
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_61019
	btr r12,6
	jmp LB_61020
LB_61019:
	bts r12,6
LB_61020:
	mov r9,rcx
	bt r12,6
	jc LB_61017
	btr r12,3
	jmp LB_61018
LB_61017:
	bts r12,3
LB_61018:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_61023
	btr r12,6
	jmp LB_61024
LB_61023:
	bts r12,6
LB_61024:
	mov r10,rcx
	bt r12,6
	jc LB_61021
	btr r12,4
	jmp LB_61022
LB_61021:
	bts r12,4
LB_61022:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_61013
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
	jnc LB_61025
	bt QWORD [rax],0
	jc LB_61026
	btr r12,7
	jmp LB_61027
LB_61026:
	bts r12,7
LB_61027:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_61025:
	mov rdx,rax
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_61030
	btr r12,8
	jmp LB_61031
LB_61030:
	bts r12,8
LB_61031:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_61028
	btr r12,5
	jmp LB_61029
LB_61028:
	bts r12,5
LB_61029:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_61034
	btr r12,8
	jmp LB_61035
LB_61034:
	bts r12,8
LB_61035:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_61032
	btr r12,6
	jmp LB_61033
LB_61032:
	bts r12,6
LB_61033:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_61013
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
	jnc LB_61036
	bt QWORD [rax],0
	jc LB_61037
	btr r12,7
	jmp LB_61038
LB_61037:
	bts r12,7
LB_61038:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_61036:
	mov rdx,rax
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_61039:
	cmp r15,0
	jz LB_61040
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61039
LB_61040:
; _f25 %_60968 ⊢ { %_60970 %_60971 } : { %_60970 %_60971 }
 ; {>  %_60966~3':_stg %_60964~1':_r64 %_60968~5':_stg %_60963~0':_stg }
; _f25 5' ⊢ { 2' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_61047
	btr r12,0
	jmp LB_61048
LB_61047:
	bts r12,0
LB_61048:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_61049
	btr r12,2
	jmp LB_61050
LB_61049:
	bts r12,2
LB_61050:
	mov r10,r14
	bt r12,1
	jc LB_61051
	btr r12,4
	jmp LB_61052
LB_61051:
	bts r12,4
LB_61052:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_61045
	btr r12,3
	jmp LB_61046
LB_61045:
	bts r12,3
LB_61046:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61043
	btr r12,1
	jmp LB_61044
LB_61043:
	bts r12,1
LB_61044:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61041
	btr r12,0
	jmp LB_61042
LB_61041:
	bts r12,0
LB_61042:
	add rsp,32
; _f56440 %_60971 ⊢ { %_60972 %_60973 } : { %_60972 %_60973 }
 ; {>  %_60971~4':_stg %_60966~3':_stg %_60970~2':_stg %_60964~1':_r64 %_60963~0':_stg }
; _f56440 4' ⊢ { 4' 5' }
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
	jc LB_61061
	btr r12,0
	jmp LB_61062
LB_61061:
	bts r12,0
LB_61062:
	call NS_E_56440
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_61063
	btr r12,4
	jmp LB_61064
LB_61063:
	bts r12,4
LB_61064:
	mov r11,r14
	bt r12,1
	jc LB_61065
	btr r12,5
	jmp LB_61066
LB_61065:
	bts r12,5
LB_61066:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61059
	btr r12,3
	jmp LB_61060
LB_61059:
	bts r12,3
LB_61060:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61057
	btr r12,2
	jmp LB_61058
LB_61057:
	bts r12,2
LB_61058:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61055
	btr r12,1
	jmp LB_61056
LB_61055:
	bts r12,1
LB_61056:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61053
	btr r12,0
	jmp LB_61054
LB_61053:
	bts r12,0
LB_61054:
	add rsp,40
MTC_LB_61067:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_61068
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
	jnc LB_61069
	bt QWORD [rax],0
	jc LB_61070
	btr r12,7
	jmp LB_61071
LB_61070:
	bts r12,7
LB_61071:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_61069:
	mov rdx,rax
	mov rcx,rdx
	bt r12,7
	jc LB_61072
	btr r12,6
	jmp LB_61073
LB_61072:
	bts r12,6
LB_61073:
LB_61074:
	cmp r15,0
	jz LB_61075
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61074
LB_61075:
; » 0xr0 |~ {  } ⊢ %_60975 : %_60975
 ; {>  %_60966~3':_stg %_60972~4':_stg %_60974~6':_stg %_60970~2':_stg %_60964~1':_r64 %_60963~0':_stg }
; 	» 0xr0 _ ⊢ 5' : %_60975
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f57506 { %_60974 %_60975 } ⊢ { %_60976 %_60977 %_60978 } : { %_60976 %_60977 %_60978 }
 ; {>  %_60966~3':_stg %_60972~4':_stg %_60974~6':_stg %_60970~2':_stg %_60964~1':_r64 %_60975~5':_r64 %_60963~0':_stg }
; _f57506 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_61086
	btr r12,0
	jmp LB_61087
LB_61086:
	bts r12,0
LB_61087:
	mov r14,r11
	bt r12,5
	jc LB_61088
	btr r12,1
	jmp LB_61089
LB_61088:
	bts r12,1
LB_61089:
	call NS_E_57506
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_61090
	btr r12,5
	jmp LB_61091
LB_61090:
	bts r12,5
LB_61091:
	mov rcx,r14
	bt r12,1
	jc LB_61092
	btr r12,6
	jmp LB_61093
LB_61092:
	bts r12,6
LB_61093:
	mov rdx,r9
	bt r12,3
	jc LB_61096
	btr r12,7
	jmp LB_61097
LB_61096:
	bts r12,7
LB_61097:
	mov rsi,1
	bt r12,7
	jc LB_61094
	mov rsi,0
	bt rdx,0
	jc LB_61094
	jmp LB_61095
LB_61094:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_61095:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61084
	btr r12,4
	jmp LB_61085
LB_61084:
	bts r12,4
LB_61085:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61082
	btr r12,3
	jmp LB_61083
LB_61082:
	bts r12,3
LB_61083:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61080
	btr r12,2
	jmp LB_61081
LB_61080:
	bts r12,2
LB_61081:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61078
	btr r12,1
	jmp LB_61079
LB_61078:
	bts r12,1
LB_61079:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61076
	btr r12,0
	jmp LB_61077
LB_61076:
	bts r12,0
LB_61077:
	add rsp,48
; _f26 { %_60976 %_60977 %_60978 } ⊢ { %_60979 %_60980 %_60981 } : { %_60979 %_60980 %_60981 }
 ; {>  %_60966~3':_stg %_60972~4':_stg %_60970~2':_stg %_60978~7':(_opn)◂((_lst)◂(_p55413)) %_60976~5':_stg %_60964~1':_r64 %_60977~6':_r64 %_60963~0':_stg }
; _f26 { 5' 6' 7' } ⊢ { 5' 6' 7' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000001110.. |},{ 5' 6' 7' } ⊢ 0'
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_61110
	btr r12,1
	jmp LB_61111
LB_61110:
	bts r12,1
LB_61111:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_61108
	btr QWORD [rdi],0
	jmp LB_61109
LB_61108:
	bts QWORD [rdi],0
LB_61109:
	mov r14,rcx
	bt r12,6
	jc LB_61114
	btr r12,1
	jmp LB_61115
LB_61114:
	bts r12,1
LB_61115:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_61112
	btr QWORD [rdi],1
	jmp LB_61113
LB_61112:
	bts QWORD [rdi],1
LB_61113:
	mov r14,rdx
	bt r12,7
	jc LB_61118
	btr r12,1
	jmp LB_61119
LB_61118:
	bts r12,1
LB_61119:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_61116
	btr QWORD [rdi],2
	jmp LB_61117
LB_61116:
	bts QWORD [rdi],2
LB_61117:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 5' 6' 7' }
; 0' ⊢ { 5' 6' 7' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_61122
	btr r12,1
	jmp LB_61123
LB_61122:
	bts r12,1
LB_61123:
	mov r11,r14
	bt r12,1
	jc LB_61120
	btr r12,5
	jmp LB_61121
LB_61120:
	bts r12,5
LB_61121:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_61126
	btr r12,1
	jmp LB_61127
LB_61126:
	bts r12,1
LB_61127:
	mov rcx,r14
	bt r12,1
	jc LB_61124
	btr r12,6
	jmp LB_61125
LB_61124:
	bts r12,6
LB_61125:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_61130
	btr r12,1
	jmp LB_61131
LB_61130:
	bts r12,1
LB_61131:
	mov rdx,r14
	bt r12,1
	jc LB_61128
	btr r12,7
	jmp LB_61129
LB_61128:
	bts r12,7
LB_61129:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61106
	btr r12,4
	jmp LB_61107
LB_61106:
	bts r12,4
LB_61107:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61104
	btr r12,3
	jmp LB_61105
LB_61104:
	bts r12,3
LB_61105:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61102
	btr r12,2
	jmp LB_61103
LB_61102:
	bts r12,2
LB_61103:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61100
	btr r12,1
	jmp LB_61101
LB_61100:
	bts r12,1
LB_61101:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61098
	btr r12,0
	jmp LB_61099
LB_61098:
	bts r12,0
LB_61099:
	add rsp,48
MTC_LB_61132:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_61133
; _emt_mov_ptn_to_ptn:{| 111111110.. |},7' ⊢ °0◂8'
; 7' ⊢ °0◂8'
	btr r12,9
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rax,0x00ff_ffff_ffff_fffe
	and rax,rdx
	bt QWORD [rax],17
	jnc LB_61134
	bt QWORD [rax],0
	jc LB_61135
	btr r12,9
	jmp LB_61136
LB_61135:
	bts r12,9
LB_61136:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_61134:
	mov QWORD [st_vct+8*9],rax
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_61137
	btr r12,8
	jmp LB_61138
LB_61137:
	bts r12,8
LB_61138:
LB_61139:
	cmp r15,0
	jz LB_61140
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61139
LB_61140:
; _f55520 %_60982 ⊢ %_60983 : %_60983
 ; {>  %_60980~6':_r64 %_60966~3':_stg %_60972~4':_stg %_60970~2':_stg %_60982~8':(_lst)◂(_p55413) %_60964~1':_r64 %_60979~5':_stg %_60963~0':_stg }
; _f55520 8' ⊢ 7'
; push_iv 
	sub rsp,64
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_61155
	btr r12,0
	jmp LB_61156
LB_61155:
	bts r12,0
LB_61156:
	call NS_E_55520
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 7'
	mov rdx,r13
	bt r12,0
	jc LB_61157
	btr r12,7
	jmp LB_61158
LB_61157:
	bts r12,7
LB_61158:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_61153
	btr r12,6
	jmp LB_61154
LB_61153:
	bts r12,6
LB_61154:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_61151
	btr r12,5
	jmp LB_61152
LB_61151:
	bts r12,5
LB_61152:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61149
	btr r12,4
	jmp LB_61150
LB_61149:
	bts r12,4
LB_61150:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61147
	btr r12,3
	jmp LB_61148
LB_61147:
	bts r12,3
LB_61148:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61145
	btr r12,2
	jmp LB_61146
LB_61145:
	bts r12,2
LB_61146:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61143
	btr r12,1
	jmp LB_61144
LB_61143:
	bts r12,1
LB_61144:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61141
	btr r12,0
	jmp LB_61142
LB_61141:
	bts r12,0
LB_61142:
	add rsp,64
; » _^ ..
	mov rax,10
	mov rdi,0
	mov rsi,0
	mov rdi,rdx
	mov rdi,QWORD [rdi]
	shr rdi,32
	mov QWORD [ir_s8_len_vct+8*0],rdi
	imul rdi,1
	add rax,rdi
	mov rdi,rax
	call mlc_s8
	mov rdi,rax
	add rdi,8
; "START\n"
	mov rsi,0x_53
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_41
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_52
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_54
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; 0'
	push rcx
	mov rsi,rdx
	add rsi,8
	mov rcx,QWORD [ir_s8_len_vct+8*0]
	cld
	rep movsb
	pop rcx
; "END\n"
	mov rsi,0x_45
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_4e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_44
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; //
	mov QWORD [st_vct+8*8],rax
	btr r12,8
; _f26 %_60985 ⊢ %_60986 : %_60986
 ; {>  %_60980~6':_r64 %_60984~7':_stg %_60966~3':_stg %_60972~4':_stg %_60970~2':_stg %_60985~8':_stg %_60964~1':_r64 %_60979~5':_stg %_60963~0':_stg }
; _f26 8' ⊢ 8'
; push_iv 
	sub rsp,72
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_61175
	btr r12,0
	jmp LB_61176
LB_61175:
	bts r12,0
LB_61176:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_61177
	btr r12,8
	jmp LB_61178
LB_61177:
	bts r12,8
LB_61178:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_61173
	btr r12,7
	jmp LB_61174
LB_61173:
	bts r12,7
LB_61174:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_61171
	btr r12,6
	jmp LB_61172
LB_61171:
	bts r12,6
LB_61172:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_61169
	btr r12,5
	jmp LB_61170
LB_61169:
	bts r12,5
LB_61170:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61167
	btr r12,4
	jmp LB_61168
LB_61167:
	bts r12,4
LB_61168:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61165
	btr r12,3
	jmp LB_61166
LB_61165:
	bts r12,3
LB_61166:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61163
	btr r12,2
	jmp LB_61164
LB_61163:
	bts r12,2
LB_61164:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61161
	btr r12,1
	jmp LB_61162
LB_61161:
	bts r12,1
LB_61162:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61159
	btr r12,0
	jmp LB_61160
LB_61159:
	bts r12,0
LB_61160:
	add rsp,72
; 	» "H2\n" _ ⊢ 9' : %_60987
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_32_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*9],rdi
	btr r12,9
; _f26 %_60987 ⊢ %_60988 : %_60988
 ; {>  %_60980~6':_r64 %_60984~7':_stg %_60966~3':_stg %_60972~4':_stg %_60986~8':_stg %_60970~2':_stg %_60964~1':_r64 %_60987~9':_stg %_60979~5':_stg %_60963~0':_stg }
; _f26 9' ⊢ 9'
; push_iv 
	sub rsp,80
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rsp+8+8*8],rdi
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000000010.. |},9' ⊢ 0'
	mov r13,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_61197
	btr r12,0
	jmp LB_61198
LB_61197:
	bts r12,0
LB_61198:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_61199
	btr r12,9
	jmp LB_61200
LB_61199:
	bts r12,9
LB_61200:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdi,QWORD [rsp+8+8*8]
	mov QWORD [st_vct+8*8],rdi
	bt rax,8
	jc LB_61195
	btr r12,8
	jmp LB_61196
LB_61195:
	bts r12,8
LB_61196:
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_61193
	btr r12,7
	jmp LB_61194
LB_61193:
	bts r12,7
LB_61194:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_61191
	btr r12,6
	jmp LB_61192
LB_61191:
	bts r12,6
LB_61192:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_61189
	btr r12,5
	jmp LB_61190
LB_61189:
	bts r12,5
LB_61190:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61187
	btr r12,4
	jmp LB_61188
LB_61187:
	bts r12,4
LB_61188:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61185
	btr r12,3
	jmp LB_61186
LB_61185:
	bts r12,3
LB_61186:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61183
	btr r12,2
	jmp LB_61184
LB_61183:
	bts r12,2
LB_61184:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61181
	btr r12,1
	jmp LB_61182
LB_61181:
	bts r12,1
LB_61182:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61179
	btr r12,0
	jmp LB_61180
LB_61179:
	bts r12,0
LB_61180:
	add rsp,80
; ∎ {  }
 ; {>  %_60980~6':_r64 %_60984~7':_stg %_60966~3':_stg %_60972~4':_stg %_60986~8':_stg %_60988~9':_stg %_60970~2':_stg %_60964~1':_r64 %_60979~5':_stg %_60963~0':_stg }
; 	∎ {  }
	bt r12,6
	jc LB_61201
	mov rdi,rcx
	call dlt
LB_61201:
	bt r12,7
	jc LB_61202
	mov rdi,rdx
	call dlt
LB_61202:
	bt r12,3
	jc LB_61203
	mov rdi,r9
	call dlt
LB_61203:
	bt r12,4
	jc LB_61204
	mov rdi,r10
	call dlt
LB_61204:
	bt r12,8
	jc LB_61205
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_61205:
	bt r12,9
	jc LB_61206
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_61206:
	bt r12,2
	jc LB_61207
	mov rdi,r8
	call dlt
LB_61207:
	bt r12,1
	jc LB_61208
	mov rdi,r14
	call dlt
LB_61208:
	bt r12,5
	jc LB_61209
	mov rdi,r11
	call dlt
LB_61209:
	bt r12,0
	jc LB_61210
	mov rdi,r13
	call dlt
LB_61210:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_61133:
	mov r15,0
LB_61212:
	cmp r15,0
	jz LB_61213
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61212
LB_61213:
; 	» "H0\n" _ ⊢ 8' : %_60989
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f26 %_60989 ⊢ %_60990 : %_60990
 ; {>  %_60980~6':_r64 %_60966~3':_stg %_60981~7':(_opn)◂((_lst)◂(_p55413)) %_60972~4':_stg %_60989~8':_stg %_60970~2':_stg %_60964~1':_r64 %_60979~5':_stg %_60963~0':_stg }
; _f26 8' ⊢ 8'
; push_iv 
	sub rsp,72
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp+8+8*6],rcx
	mov QWORD [rsp+8+8*7],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000000010.. |},8' ⊢ 0'
	mov r13,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_61230
	btr r12,0
	jmp LB_61231
LB_61230:
	bts r12,0
LB_61231:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_61232
	btr r12,8
	jmp LB_61233
LB_61232:
	bts r12,8
LB_61233:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_61228
	btr r12,7
	jmp LB_61229
LB_61228:
	bts r12,7
LB_61229:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_61226
	btr r12,6
	jmp LB_61227
LB_61226:
	bts r12,6
LB_61227:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_61224
	btr r12,5
	jmp LB_61225
LB_61224:
	bts r12,5
LB_61225:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61222
	btr r12,4
	jmp LB_61223
LB_61222:
	bts r12,4
LB_61223:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61220
	btr r12,3
	jmp LB_61221
LB_61220:
	bts r12,3
LB_61221:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61218
	btr r12,2
	jmp LB_61219
LB_61218:
	bts r12,2
LB_61219:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61216
	btr r12,1
	jmp LB_61217
LB_61216:
	bts r12,1
LB_61217:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61214
	btr r12,0
	jmp LB_61215
LB_61214:
	bts r12,0
LB_61215:
	add rsp,72
; ∎ {  }
 ; {>  %_60980~6':_r64 %_60966~3':_stg %_60981~7':(_opn)◂((_lst)◂(_p55413)) %_60972~4':_stg %_60970~2':_stg %_60990~8':_stg %_60964~1':_r64 %_60979~5':_stg %_60963~0':_stg }
; 	∎ {  }
	bt r12,6
	jc LB_61234
	mov rdi,rcx
	call dlt
LB_61234:
	bt r12,3
	jc LB_61235
	mov rdi,r9
	call dlt
LB_61235:
	bt r12,7
	jc LB_61236
	mov rdi,rdx
	call dlt
LB_61236:
	bt r12,4
	jc LB_61237
	mov rdi,r10
	call dlt
LB_61237:
	bt r12,2
	jc LB_61238
	mov rdi,r8
	call dlt
LB_61238:
	bt r12,8
	jc LB_61239
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_61239:
	bt r12,1
	jc LB_61240
	mov rdi,r14
	call dlt
LB_61240:
	bt r12,5
	jc LB_61241
	mov rdi,r11
	call dlt
LB_61241:
	bt r12,0
	jc LB_61242
	mov rdi,r13
	call dlt
LB_61242:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_61211:
MTC_LB_61068:
	mov r15,0
LB_61244:
	cmp r15,0
	jz LB_61245
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61244
LB_61245:
; 	» "H1\n" _ ⊢ 6' : %_60991
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f26 %_60991 ⊢ %_60992 : %_60992
 ; {>  %_60973~5':(_opn)◂(_stg) %_60966~3':_stg %_60972~4':_stg %_60991~6':_stg %_60970~2':_stg %_60964~1':_r64 %_60963~0':_stg }
; _f26 6' ⊢ 6'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp+8+8*5],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_61258
	btr r12,0
	jmp LB_61259
LB_61258:
	bts r12,0
LB_61259:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_61260
	btr r12,6
	jmp LB_61261
LB_61260:
	bts r12,6
LB_61261:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_61256
	btr r12,5
	jmp LB_61257
LB_61256:
	bts r12,5
LB_61257:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61254
	btr r12,4
	jmp LB_61255
LB_61254:
	bts r12,4
LB_61255:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61252
	btr r12,3
	jmp LB_61253
LB_61252:
	bts r12,3
LB_61253:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61250
	btr r12,2
	jmp LB_61251
LB_61250:
	bts r12,2
LB_61251:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61248
	btr r12,1
	jmp LB_61249
LB_61248:
	bts r12,1
LB_61249:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61246
	btr r12,0
	jmp LB_61247
LB_61246:
	bts r12,0
LB_61247:
	add rsp,56
; ∎ {  }
 ; {>  %_60973~5':(_opn)◂(_stg) %_60966~3':_stg %_60972~4':_stg %_60992~6':_stg %_60970~2':_stg %_60964~1':_r64 %_60963~0':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_61262
	mov rdi,r11
	call dlt
LB_61262:
	bt r12,3
	jc LB_61263
	mov rdi,r9
	call dlt
LB_61263:
	bt r12,4
	jc LB_61264
	mov rdi,r10
	call dlt
LB_61264:
	bt r12,6
	jc LB_61265
	mov rdi,rcx
	call dlt
LB_61265:
	bt r12,2
	jc LB_61266
	mov rdi,r8
	call dlt
LB_61266:
	bt r12,1
	jc LB_61267
	mov rdi,r14
	call dlt
LB_61267:
	bt r12,0
	jc LB_61268
	mov rdi,r13
	call dlt
LB_61268:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_61243:
MTC_LB_61013:
	mov r15,0
LB_61270:
	cmp r15,0
	jz LB_61271
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61270
LB_61271:
; _f57506 { %_60963 %_60964 } ⊢ { %_60993 %_60994 %_60995 } : { %_60993 %_60994 %_60995 }
 ; {>  %_60965~2':(_lst)◂(_stg) %_60964~1':_r64 %_60963~0':_stg }
; _f57506 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_57506
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_61274
	btr r12,4
	jmp LB_61275
LB_61274:
	bts r12,4
LB_61275:
	mov r9,r10
	bt r12,4
	jc LB_61278
	btr r12,3
	jmp LB_61279
LB_61278:
	bts r12,3
LB_61279:
	mov rsi,1
	bt r12,3
	jc LB_61276
	mov rsi,0
	bt r9,0
	jc LB_61276
	jmp LB_61277
LB_61276:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_61277:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_61272
	btr r12,2
	jmp LB_61273
LB_61272:
	bts r12,2
LB_61273:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_60996
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f25 %_60996 ⊢ { %_60997 %_60998 } : { %_60997 %_60998 }
 ; {>  %_60995~3':(_opn)◂((_lst)◂(_p55413)) %_60993~0':_stg %_60965~2':(_lst)◂(_stg) %_60994~1':_r64 %_60996~4':_stg }
; _f25 4' ⊢ { 4' 5' }
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
	jc LB_61288
	btr r12,0
	jmp LB_61289
LB_61288:
	bts r12,0
LB_61289:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_61290
	btr r12,4
	jmp LB_61291
LB_61290:
	bts r12,4
LB_61291:
	mov r11,r14
	bt r12,1
	jc LB_61292
	btr r12,5
	jmp LB_61293
LB_61292:
	bts r12,5
LB_61293:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61286
	btr r12,3
	jmp LB_61287
LB_61286:
	bts r12,3
LB_61287:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61284
	btr r12,2
	jmp LB_61285
LB_61284:
	bts r12,2
LB_61285:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61282
	btr r12,1
	jmp LB_61283
LB_61282:
	bts r12,1
LB_61283:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61280
	btr r12,0
	jmp LB_61281
LB_61280:
	bts r12,0
LB_61281:
	add rsp,40
; _f26 { %_60997 %_60998 } ⊢ { %_60999 %_61000 } : { %_60999 %_61000 }
 ; {>  %_60998~5':_stg %_60995~3':(_opn)◂((_lst)◂(_p55413)) %_60993~0':_stg %_60965~2':(_lst)◂(_stg) %_60997~4':_stg %_60994~1':_r64 }
; _f26 { 4' 5' } ⊢ { 4' 5' }
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
	jc LB_61304
	btr r12,1
	jmp LB_61305
LB_61304:
	bts r12,1
LB_61305:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_61302
	btr QWORD [rdi],0
	jmp LB_61303
LB_61302:
	bts QWORD [rdi],0
LB_61303:
	mov r14,r11
	bt r12,5
	jc LB_61308
	btr r12,1
	jmp LB_61309
LB_61308:
	bts r12,1
LB_61309:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_61306
	btr QWORD [rdi],1
	jmp LB_61307
LB_61306:
	bts QWORD [rdi],1
LB_61307:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_61312
	btr r12,1
	jmp LB_61313
LB_61312:
	bts r12,1
LB_61313:
	mov r10,r14
	bt r12,1
	jc LB_61310
	btr r12,4
	jmp LB_61311
LB_61310:
	bts r12,4
LB_61311:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_61316
	btr r12,1
	jmp LB_61317
LB_61316:
	bts r12,1
LB_61317:
	mov r11,r14
	bt r12,1
	jc LB_61314
	btr r12,5
	jmp LB_61315
LB_61314:
	bts r12,5
LB_61315:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61300
	btr r12,3
	jmp LB_61301
LB_61300:
	bts r12,3
LB_61301:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61298
	btr r12,2
	jmp LB_61299
LB_61298:
	bts r12,2
LB_61299:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61296
	btr r12,1
	jmp LB_61297
LB_61296:
	bts r12,1
LB_61297:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61294
	btr r12,0
	jmp LB_61295
LB_61294:
	bts r12,0
LB_61295:
	add rsp,40
; _f56440 %_61000 ⊢ { %_61001 %_61002 } : { %_61001 %_61002 }
 ; {>  %_60995~3':(_opn)◂((_lst)◂(_p55413)) %_60993~0':_stg %_60965~2':(_lst)◂(_stg) %_61000~5':_stg %_60994~1':_r64 %_60999~4':_stg }
; _f56440 5' ⊢ { 5' 6' }
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
	jc LB_61328
	btr r12,0
	jmp LB_61329
LB_61328:
	bts r12,0
LB_61329:
	call NS_E_56440
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_61330
	btr r12,5
	jmp LB_61331
LB_61330:
	bts r12,5
LB_61331:
	mov rcx,r14
	bt r12,1
	jc LB_61332
	btr r12,6
	jmp LB_61333
LB_61332:
	bts r12,6
LB_61333:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61326
	btr r12,4
	jmp LB_61327
LB_61326:
	bts r12,4
LB_61327:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61324
	btr r12,3
	jmp LB_61325
LB_61324:
	bts r12,3
LB_61325:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61322
	btr r12,2
	jmp LB_61323
LB_61322:
	bts r12,2
LB_61323:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61320
	btr r12,1
	jmp LB_61321
LB_61320:
	bts r12,1
LB_61321:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61318
	btr r12,0
	jmp LB_61319
LB_61318:
	bts r12,0
LB_61319:
	add rsp,48
MTC_LB_61334:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_61335
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
	jnc LB_61336
	bt QWORD [rax],0
	jc LB_61337
	btr r12,8
	jmp LB_61338
LB_61337:
	bts r12,8
LB_61338:
	mov rdi,rax
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,QWORD [rax+8*1]
LB_61336:
	mov QWORD [st_vct+8*8],rax
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_61339
	btr r12,7
	jmp LB_61340
LB_61339:
	bts r12,7
LB_61340:
LB_61341:
	cmp r15,0
	jz LB_61342
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61341
LB_61342:
; » 0xr0 |~ {  } ⊢ %_61004 : %_61004
 ; {>  %_60995~3':(_opn)◂((_lst)◂(_p55413)) %_60993~0':_stg %_60965~2':(_lst)◂(_stg) %_61001~5':_stg %_61003~7':_stg %_60994~1':_r64 %_60999~4':_stg }
; 	» 0xr0 _ ⊢ 6' : %_61004
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f57506 { %_61003 %_61004 } ⊢ { %_61005 %_61006 %_61007 } : { %_61005 %_61006 %_61007 }
 ; {>  %_60995~3':(_opn)◂((_lst)◂(_p55413)) %_60993~0':_stg %_60965~2':(_lst)◂(_stg) %_61001~5':_stg %_61003~7':_stg %_60994~1':_r64 %_61004~6':_r64 %_60999~4':_stg }
; _f57506 { 7' 6' } ⊢ { 6' 7' 8' }
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
	jc LB_61355
	btr r12,0
	jmp LB_61356
LB_61355:
	bts r12,0
LB_61356:
	mov r14,rcx
	bt r12,6
	jc LB_61357
	btr r12,1
	jmp LB_61358
LB_61357:
	bts r12,1
LB_61358:
	call NS_E_57506
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_61359
	btr r12,6
	jmp LB_61360
LB_61359:
	bts r12,6
LB_61360:
	mov rdx,r14
	bt r12,1
	jc LB_61361
	btr r12,7
	jmp LB_61362
LB_61361:
	bts r12,7
LB_61362:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_61365
	btr r12,8
	jmp LB_61366
LB_61365:
	bts r12,8
LB_61366:
	mov rsi,1
	bt r12,8
	jc LB_61363
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_61363
	jmp LB_61364
LB_61363:
	mov rax,rbx
	mov rbx,QWORD [rbx]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_61364:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_61353
	btr r12,5
	jmp LB_61354
LB_61353:
	bts r12,5
LB_61354:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61351
	btr r12,4
	jmp LB_61352
LB_61351:
	bts r12,4
LB_61352:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61349
	btr r12,3
	jmp LB_61350
LB_61349:
	bts r12,3
LB_61350:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61347
	btr r12,2
	jmp LB_61348
LB_61347:
	bts r12,2
LB_61348:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61345
	btr r12,1
	jmp LB_61346
LB_61345:
	bts r12,1
LB_61346:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61343
	btr r12,0
	jmp LB_61344
LB_61343:
	bts r12,0
LB_61344:
	add rsp,56
; _f26 { %_61005 %_61006 %_61007 } ⊢ { %_61008 %_61009 %_61010 } : { %_61008 %_61009 %_61010 }
 ; {>  %_60995~3':(_opn)◂((_lst)◂(_p55413)) %_60993~0':_stg %_60965~2':(_lst)◂(_stg) %_61007~8':(_opn)◂((_lst)◂(_p55413)) %_61006~7':_r64 %_61001~5':_stg %_61005~6':_stg %_60994~1':_r64 %_60999~4':_stg }
; _f26 { 6' 7' 8' } ⊢ { 6' 7' 8' }
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
	jc LB_61381
	btr r12,1
	jmp LB_61382
LB_61381:
	bts r12,1
LB_61382:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_61379
	btr QWORD [rdi],0
	jmp LB_61380
LB_61379:
	bts QWORD [rdi],0
LB_61380:
	mov r14,rdx
	bt r12,7
	jc LB_61385
	btr r12,1
	jmp LB_61386
LB_61385:
	bts r12,1
LB_61386:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_61383
	btr QWORD [rdi],1
	jmp LB_61384
LB_61383:
	bts QWORD [rdi],1
LB_61384:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_61389
	btr r12,1
	jmp LB_61390
LB_61389:
	bts r12,1
LB_61390:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_61387
	btr QWORD [rdi],2
	jmp LB_61388
LB_61387:
	bts QWORD [rdi],2
LB_61388:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_61393
	btr r12,1
	jmp LB_61394
LB_61393:
	bts r12,1
LB_61394:
	mov rcx,r14
	bt r12,1
	jc LB_61391
	btr r12,6
	jmp LB_61392
LB_61391:
	bts r12,6
LB_61392:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_61397
	btr r12,1
	jmp LB_61398
LB_61397:
	bts r12,1
LB_61398:
	mov rdx,r14
	bt r12,1
	jc LB_61395
	btr r12,7
	jmp LB_61396
LB_61395:
	bts r12,7
LB_61396:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_61401
	btr r12,1
	jmp LB_61402
LB_61401:
	bts r12,1
LB_61402:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_61399
	btr r12,8
	jmp LB_61400
LB_61399:
	bts r12,8
LB_61400:
	mov rdi,r13
	mov QWORD [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_61377
	btr r12,5
	jmp LB_61378
LB_61377:
	bts r12,5
LB_61378:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_61375
	btr r12,4
	jmp LB_61376
LB_61375:
	bts r12,4
LB_61376:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_61373
	btr r12,3
	jmp LB_61374
LB_61373:
	bts r12,3
LB_61374:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_61371
	btr r12,2
	jmp LB_61372
LB_61371:
	bts r12,2
LB_61372:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_61369
	btr r12,1
	jmp LB_61370
LB_61369:
	bts r12,1
LB_61370:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_61367
	btr r12,0
	jmp LB_61368
LB_61367:
	bts r12,0
LB_61368:
	add rsp,56
; ∎ {  }
 ; {>  %_60995~3':(_opn)◂((_lst)◂(_p55413)) %_60993~0':_stg %_60965~2':(_lst)◂(_stg) %_61009~7':_r64 %_61001~5':_stg %_61010~8':(_opn)◂((_lst)◂(_p55413)) %_61008~6':_stg %_60994~1':_r64 %_60999~4':_stg }
; 	∎ {  }
	bt r12,3
	jc LB_61403
	mov rdi,r9
	call dlt
LB_61403:
	bt r12,0
	jc LB_61404
	mov rdi,r13
	call dlt
LB_61404:
	bt r12,2
	jc LB_61405
	mov rdi,r8
	call dlt
LB_61405:
	bt r12,7
	jc LB_61406
	mov rdi,rdx
	call dlt
LB_61406:
	bt r12,5
	jc LB_61407
	mov rdi,r11
	call dlt
LB_61407:
	bt r12,8
	jc LB_61408
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_61408:
	bt r12,6
	jc LB_61409
	mov rdi,rcx
	call dlt
LB_61409:
	bt r12,1
	jc LB_61410
	mov rdi,r14
	call dlt
LB_61410:
	bt r12,4
	jc LB_61411
	mov rdi,r10
	call dlt
LB_61411:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_61335:
	mov r15,0
LB_61413:
	cmp r15,0
	jz LB_61414
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_61413
LB_61414:
; ∎ {  }
 ; {>  %_60995~3':(_opn)◂((_lst)◂(_p55413)) %_60993~0':_stg %_60965~2':(_lst)◂(_stg) %_61001~5':_stg %_61002~6':(_opn)◂(_stg) %_60994~1':_r64 %_60999~4':_stg }
; 	∎ {  }
	bt r12,3
	jc LB_61415
	mov rdi,r9
	call dlt
LB_61415:
	bt r12,0
	jc LB_61416
	mov rdi,r13
	call dlt
LB_61416:
	bt r12,2
	jc LB_61417
	mov rdi,r8
	call dlt
LB_61417:
	bt r12,5
	jc LB_61418
	mov rdi,r11
	call dlt
LB_61418:
	bt r12,6
	jc LB_61419
	mov rdi,rcx
	call dlt
LB_61419:
	bt r12,1
	jc LB_61420
	mov rdi,r14
	call dlt
LB_61420:
	bt r12,4
	jc LB_61421
	mov rdi,r10
	call dlt
LB_61421:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_61412:
MTC_LB_61269:
section .data
	NS_E_DYN_54729:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54729
	NS_E_DYN_54732:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54732
	NS_E_DYN_54733:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54733
	NS_E_DYN_54734:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54734
	NS_E_DYN_54735:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54735
	NS_E_DYN_54742:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54742
	NS_E_DYN_54781:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54781
	NS_E_DYN_54799:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54799
	NS_E_DYN_54842:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54842
	NS_E_DYN_54852:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54852
	NS_E_DYN_54853:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54853
	NS_E_DYN_54854:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_54854
	NS_E_DYN_55072:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55072
	NS_E_DYN_55111:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55111
	NS_E_DYN_55150:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55150
	NS_E_DYN_55189:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55189
	NS_E_DYN_55220:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55220
	NS_E_DYN_55221:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55221
	NS_E_DYN_55222:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55222
	NS_E_DYN_55349:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55349
	NS_E_DYN_55408:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_55409:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_55411:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_55412:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_55491:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_55492:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_55493:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_55494:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_55495:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_55496:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_55497:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_55498:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_55499:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_55500:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_55501:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_55502:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_55503:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_55504:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_55505:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_55506:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_55507:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_55508:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_55509:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_55510:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_55548:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55548
	NS_E_DYN_55520:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55520
	NS_E_DYN_55687:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_55688:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_55689:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55689
	NS_E_DYN_55690:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55690
	NS_E_DYN_55691:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55691
	NS_E_DYN_55692:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_55692
	NS_E_DYN_56339:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56339
	NS_E_DYN_56440:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56440
	CST_DYN_56502:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_56505:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56505
	NS_E_DYN_56572:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56572
	NS_E_DYN_56657:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_56658:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_56665:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56665
	NS_E_DYN_56701:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56701
	NS_E_DYN_56702:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56702
	NS_E_DYN_56703:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56703
	NS_E_DYN_56704:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56704
	NS_E_DYN_56965:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56965
	NS_E_DYN_56966:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56966
	NS_E_DYN_56969:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56969
	NS_E_DYN_56970:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_56970
	NS_E_DYN_57235:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57235
	NS_E_DYN_57236:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57236
	NS_E_DYN_57237:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57237
	NS_E_DYN_57238:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57238
	NS_E_DYN_57239:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57239
	NS_E_DYN_57506:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57506
	NS_E_DYN_57507:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57507
	NS_E_DYN_57508:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57508
	NS_E_DYN_57509:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57509
	NS_E_DYN_57510:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57510
	NS_E_DYN_57511:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57511
	NS_E_DYN_57514:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57514
	NS_E_DYN_57515:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57515
	NS_E_DYN_57516:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57516
	NS_E_DYN_57519:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57519
	NS_E_DYN_57520:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57520
	NS_E_DYN_57521:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57521
	NS_E_DYN_57522:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57522
	NS_E_DYN_57523:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57523
	NS_E_DYN_57524:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57524
	NS_E_DYN_57525:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57525
	NS_E_DYN_57526:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57526
	NS_E_DYN_57527:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57527
	NS_E_DYN_57528:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57528
	NS_E_DYN_57529:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57529
	NS_E_DYN_57530:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57530
	NS_E_DYN_57531:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57531
	NS_E_DYN_57532:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57532
	NS_E_DYN_57537:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57537
	NS_E_DYN_57538:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57538
	NS_E_DYN_57539:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57539
	NS_E_DYN_57540:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57540
	NS_E_DYN_57541:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57541
	NS_E_DYN_57542:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57542
	NS_E_DYN_57543:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57543
	NS_E_DYN_57544:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57544
	NS_E_DYN_57545:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57545
	NS_E_DYN_57546:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57546
	NS_E_DYN_57547:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_57547
	CST_DYN_61011:
		dq 0x0000_0001_00_82_ffff
		dq 1
