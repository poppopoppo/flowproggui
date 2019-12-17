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
	call NS_E_11699
	call NS_E_16496
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
NS_E_8701:
NS_E_RDI_8701:
NS_E_8701_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_8702
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_8702:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_8704:
NS_E_RDI_8704:
NS_E_8704_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_8704_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_8704_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_8705:
NS_E_RDI_8705:
NS_E_8705_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_8705_LB_0
	cmp r11,57
	ja NS_E_8705_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_8705_LB_0:
	mov rax,0
	ret
NS_E_8707:
NS_E_RDI_8707:
NS_E_8707_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_8707_LB_0
	cmp r11,122
	ja NS_E_8707_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_8707_LB_0:
	mov rax,0
	ret
NS_E_8706:
NS_E_RDI_8706:
NS_E_8706_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_8706_LB_0
	cmp r11,90
	ja NS_E_8706_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_8706_LB_0:
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
	mov eax,[r14+4]
	lea r8,[r8-1+r13]
	cmp r8,rax
	jge err_s8_ge
	mov eax,[r9+4]
	lea r10,[r10-1+r13]
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
	mov eax,DWORD [rdi+4]
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
	mov eax,DWORD [rdi+4]
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
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
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
NS_E_8703:
NS_E_RDI_8703:
NS_E_8703_ETR_TBL:
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
	jz NS_E_8703_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_8703_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_8714:
; 	|» { 0' 1' }
NS_E_RDI_8714:
MTC_LB_8715:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_8716
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_8717
	bt QWORD [rdi],0
	jc LB_8718
	btr r12,2
	jmp LB_8719
LB_8718:
	bts r12,2
LB_8719:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8717:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_8720:
	cmp r15,0
	jz LB_8721
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8720
LB_8721:
; ∎ %_8708
 ; {>  %_8708~0':(_lst)◂(t4650'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_8716:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_8722
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_8723
	bt QWORD [rdi],0
	jc LB_8724
	btr r12,4
	jmp LB_8725
LB_8724:
	bts r12,4
LB_8725:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8723:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_8728
	btr r12,5
	jmp LB_8729
LB_8728:
	bts r12,5
LB_8729:
	mov r8,r11
	bt r12,5
	jc LB_8726
	btr r12,2
	jmp LB_8727
LB_8726:
	bts r12,2
LB_8727:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_8732
	btr r12,5
	jmp LB_8733
LB_8732:
	bts r12,5
LB_8733:
	mov r9,r11
	bt r12,5
	jc LB_8730
	btr r12,3
	jmp LB_8731
LB_8730:
	bts r12,3
LB_8731:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_8734:
	cmp r15,0
	jz LB_8735
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8734
LB_8735:
; _cns { %_8710 %_8708 } ⊢ %_8712 : %_8712
 ; {>  %_8710~2':t4650'(-1) %_8708~0':(_lst)◂(t4650'(-1)) %_8711~3':(_lst)◂(t4650'(-1)) }
; _cns { 2' 0' } ⊢ °0◂{ 2' 0' }
; _f8714 { %_8712 %_8711 } ⊢ %_8713 : %_8713
 ; {>  %_8712~°0◂{ 2' 0' }:(_lst)◂(t4650'(-1)) %_8711~3':(_lst)◂(t4650'(-1)) }
; _f8714 { °0◂{ 2' 0' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °0◂{ 2' 0' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_8736
	btr r12,1
	jmp LB_8737
LB_8736:
	bts r12,1
LB_8737:
	mov r9,r13
	bt r12,0
	jc LB_8738
	btr r12,3
	jmp LB_8739
LB_8738:
	bts r12,3
LB_8739:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r8
	bt r12,2
	jc LB_8744
	btr r12,4
	jmp LB_8745
LB_8744:
	bts r12,4
LB_8745:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_8742
	btr QWORD [rdi],0
	jmp LB_8743
LB_8742:
	bts QWORD [rdi],0
LB_8743:
	mov r10,r9
	bt r12,3
	jc LB_8748
	btr r12,4
	jmp LB_8749
LB_8748:
	bts r12,4
LB_8749:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_8746
	btr QWORD [rdi],1
	jmp LB_8747
LB_8746:
	bts QWORD [rdi],1
LB_8747:
	mov rsi,1
	bt r12,0
	jc LB_8740
	mov rsi,0
	bt r13,0
	jc LB_8740
	jmp LB_8741
LB_8740:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_8741:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_8714
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_8713
 ; {>  %_8713~0':(_lst)◂(t4650'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_8722:
NS_E_8753:
; 	|» 0'
NS_E_RDI_8753:
; _nil {  } ⊢ %_8751 : %_8751
 ; {>  %_8750~0':(_lst)◂(t4671'(-1)) }
; _nil {  } ⊢ °1◂{  }
; _f8714 { %_8751 %_8750 } ⊢ %_8752 : %_8752
 ; {>  %_8751~°1◂{  }:(_lst)◂(t4668'(0)) %_8750~0':(_lst)◂(t4671'(-1)) }
; _f8714 { °1◂{  } 0' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},{ °1◂{  } 0' } ⊢ { 0' 1' }
	mov r14,r13
	bt r12,0
	jc LB_8754
	btr r12,1
	jmp LB_8755
LB_8754:
	bts r12,1
LB_8755:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_8756
	mov rsi,0
	bt r13,0
	jc LB_8756
	jmp LB_8757
LB_8756:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_8757:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	call NS_E_8714
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_8752
 ; {>  %_8752~0':(_lst)◂(t4671'(-1)) }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
NS_E_8771:
; 	|» { 0' 1' }
NS_E_RDI_8771:
MTC_LB_8772:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_8773
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_8774
	bt QWORD [rdi],0
	jc LB_8775
	btr r12,4
	jmp LB_8776
LB_8775:
	bts r12,4
LB_8776:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8774:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_8779
	btr r12,5
	jmp LB_8780
LB_8779:
	bts r12,5
LB_8780:
	mov r8,r11
	bt r12,5
	jc LB_8777
	btr r12,2
	jmp LB_8778
LB_8777:
	bts r12,2
LB_8778:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_8783
	btr r12,5
	jmp LB_8784
LB_8783:
	bts r12,5
LB_8784:
	mov r9,r11
	bt r12,5
	jc LB_8781
	btr r12,3
	jmp LB_8782
LB_8781:
	bts r12,3
LB_8782:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_8785:
	cmp r15,0
	jz LB_8786
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8785
LB_8786:
; _f44 %_8758 ⊢ %_8762 : %_8762
 ; {>  %_8758~0':_r64 %_8760~2':_r64 %_8761~3':(_lst)◂(_r64) }
	add r13,1
; _f8771 { %_8762 %_8761 } ⊢ { %_8763 %_8764 } : { %_8763 %_8764 }
 ; {>  %_8762~0':_r64 %_8760~2':_r64 %_8761~3':(_lst)◂(_r64) }
; _f8771 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_8789
	btr r12,1
	jmp LB_8790
LB_8789:
	bts r12,1
LB_8790:
	call NS_E_8771
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_8787
	btr r12,2
	jmp LB_8788
LB_8787:
	bts r12,2
LB_8788:
	add rsp,16
; _f43 %_8763 ⊢ %_8765 : %_8765
 ; {>  %_8763~0':_r64 %_8764~1':_stg %_8760~2':_r64 }
	sub r13,1
; _f21 { %_8764 %_8765 %_8760 } ⊢ { %_8766 %_8767 %_8768 } : { %_8766 %_8767 %_8768 }
 ; {>  %_8764~1':_stg %_8765~0':_r64 %_8760~2':_r64 }
; _f21 { 1' 0' 2' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 1' 0' 2' } ⊢ { 0' 1' 2' }
	mov r9,r14
	bt r12,1
	jc LB_8791
	btr r12,3
	jmp LB_8792
LB_8791:
	bts r12,3
LB_8792:
	mov r14,r13
	bt r12,0
	jc LB_8793
	btr r12,1
	jmp LB_8794
LB_8793:
	bts r12,1
LB_8794:
	mov r13,r9
	bt r12,3
	jc LB_8795
	btr r12,0
	jmp LB_8796
LB_8795:
	bts r12,0
LB_8796:
	call NS_E_21
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_8767 %_8766 }
 ; {>  %_8766~0':_stg %_8768~2':_r64 %_8767~1':_r64 }
; 	∎ { 1' 0' }
	bt r12,2
	jc LB_8797
	mov rdi,r8
	call dlt
LB_8797:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_8798
	btr r12,2
	jmp LB_8799
LB_8798:
	bts r12,2
LB_8799:
	mov r14,r13
	bt r12,0
	jc LB_8800
	btr r12,1
	jmp LB_8801
LB_8800:
	bts r12,1
LB_8801:
	mov r13,r8
	bt r12,2
	jc LB_8802
	btr r12,0
	jmp LB_8803
LB_8802:
	bts r12,0
LB_8803:
	ret
MTC_LB_8773:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_8804
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_8805
	bt QWORD [rdi],0
	jc LB_8806
	btr r12,2
	jmp LB_8807
LB_8806:
	bts r12,2
LB_8807:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_8805:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_8808:
	cmp r15,0
	jz LB_8809
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_8808
LB_8809:
; _f19 %_8758 ⊢ { %_8769 %_8770 } : { %_8769 %_8770 }
 ; {>  %_8758~0':_r64 }
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
; ∎ { %_8769 %_8770 }
 ; {>  %_8769~0':_r64 %_8770~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_8804:
NS_E_8814:
; 	|» 0'
NS_E_RDI_8814:
; » 0xr0 |~ {  } ⊢ %_8811 : %_8811
 ; {>  %_8810~0':(_lst)◂(_r64) }
; 	» 0xr0 _ ⊢ 1' : %_8811
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f8771 { %_8811 %_8810 } ⊢ { %_8812 %_8813 } : { %_8812 %_8813 }
 ; {>  %_8810~0':(_lst)◂(_r64) %_8811~1':_r64 }
; _f8771 { 1' 0' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 1' 0' } ⊢ { 0' 1' }
	mov r8,r14
	bt r12,1
	jc LB_8815
	btr r12,2
	jmp LB_8816
LB_8815:
	bts r12,2
LB_8816:
	mov r14,r13
	bt r12,0
	jc LB_8817
	btr r12,1
	jmp LB_8818
LB_8817:
	bts r12,1
LB_8818:
	mov r13,r8
	bt r12,2
	jc LB_8819
	btr r12,0
	jmp LB_8820
LB_8819:
	bts r12,0
LB_8820:
	call NS_E_8771
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_8813
 ; {>  %_8813~1':_stg %_8812~0':_r64 }
; 	∎ 1'
	bt r12,0
	jc LB_8821
	mov rdi,r13
	call dlt
LB_8821:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_8822
	btr r12,0
	jmp LB_8823
LB_8822:
	bts r12,0
LB_8823:
	ret
NS_E_8824:
NS_E_RDI_8824:
NS_E_8824_ETR_TBL:
NS_E_8824_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\""
	add r14,1
	cmp r14,r10
	jg LB_8865
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_8865
	jmp LB_8866
LB_8865:
	jmp LB_8855
LB_8866:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_seq
	push r10
	call NS_E_8825_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8870
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8871
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8871:
	jmp LB_8855
LB_8870:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8858
	btr r12,1
	jmp LB_8859
LB_8858:
	bts r12,1
LB_8859:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8856
	btr r12,0
	jmp LB_8857
LB_8856:
	bts r12,0
LB_8857:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8852
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_8873
	btr r12,2
	jmp LB_8874
LB_8873:
	bts r12,2
LB_8874:
	mov r13,r14
	bt r12,1
	jc LB_8875
	btr r12,0
	jmp LB_8876
LB_8875:
	bts r12,0
LB_8876:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f8814 %_8827 ⊢ %_8828 : %_8828
 ; {>  %_8827~0':(_lst)◂(_r64) }
; _f8814 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_8814
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_8828 ⊢ %_8829 : %_8829
 ; {>  %_8828~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_8829
 ; {>  %_8829~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8850
	btr r12,3
	jmp LB_8851
LB_8850:
	bts r12,3
LB_8851:
	mov r8,0
	bts r12,2
	ret
LB_8852:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8854
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8853
LB_8854:
	add rsp,8
	ret
LB_8855:
	add rsp,32
	pop r14
LB_8853:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_8825:
NS_E_RDI_8825:
NS_E_8825_ETR_TBL:
NS_E_8825_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_8902
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_8902
	jmp LB_8903
LB_8902:
	jmp LB_8890
LB_8903:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; stg_ltr_sp
	push r10
	call NS_E_8826_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8907
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8908
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8908:
	jmp LB_8890
LB_8907:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; stg_ltr_seq
	push r10
	call NS_E_8825_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8913
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_8914
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_8914:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8915
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8915:
	jmp LB_8890
LB_8913:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_8895
	btr r12,2
	jmp LB_8896
LB_8895:
	bts r12,2
LB_8896:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8893
	btr r12,1
	jmp LB_8894
LB_8893:
	bts r12,1
LB_8894:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8891
	btr r12,0
	jmp LB_8892
LB_8891:
	bts r12,0
LB_8892:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_8887
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_8917
	btr r12,3
	jmp LB_8918
LB_8917:
	bts r12,3
LB_8918:
	mov r14,r8
	bt r12,2
	jc LB_8919
	btr r12,1
	jmp LB_8920
LB_8919:
	bts r12,1
LB_8920:
	mov r8,r13
	bt r12,0
	jc LB_8921
	btr r12,2
	jmp LB_8922
LB_8921:
	bts r12,2
LB_8922:
	mov r13,r9
	bt r12,3
	jc LB_8923
	btr r12,0
	jmp LB_8924
LB_8923:
	bts r12,0
LB_8924:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_8830 %_8831 } ⊢ %_8832 : %_8832
 ; {>  %_8830~0':_r64 %_8831~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_8832 ⊢ %_8833 : %_8833
 ; {>  %_8832~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_8833
 ; {>  %_8833~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_8881
	btr r12,2
	jmp LB_8882
LB_8881:
	bts r12,2
LB_8882:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_8879
	btr QWORD [rdi],0
	jmp LB_8880
LB_8879:
	bts QWORD [rdi],0
LB_8880:
	mov r8,r14
	bt r12,1
	jc LB_8885
	btr r12,2
	jmp LB_8886
LB_8885:
	bts r12,2
LB_8886:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_8883
	btr QWORD [rdi],1
	jmp LB_8884
LB_8883:
	bts QWORD [rdi],1
LB_8884:
	mov rsi,1
	bt r12,3
	jc LB_8877
	mov rsi,0
	bt r9,0
	jc LB_8877
	jmp LB_8878
LB_8877:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8878:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8887:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8889
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8888
LB_8889:
	add rsp,8
	ret
LB_8890:
	add rsp,48
	pop r14
LB_8888:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_8938
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_8938
	jmp LB_8939
LB_8938:
	jmp LB_8930
LB_8939:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8931
	btr r12,0
	jmp LB_8932
LB_8931:
	bts r12,0
LB_8932:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8927
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_8834 : %_8834
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_8834 ⊢ %_8835 : %_8835
 ; {>  %_8834~°1◂{  }:(_lst)◂(t4729'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_8835
 ; {>  %_8835~°0◂°1◂{  }:(_opn)◂((_lst)◂(t4732'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_8925
	mov rsi,0
	bt r9,0
	jc LB_8925
	jmp LB_8926
LB_8925:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8926:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8927:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8929
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8928
LB_8929:
	add rsp,8
	ret
LB_8930:
	add rsp,16
	pop r14
LB_8928:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_8701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8961
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8953
LB_8961:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; stg_ltr_seq
	push r10
	call NS_E_8825_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_8966
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_8967
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_8967:
	jmp LB_8953
LB_8966:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_8956
	btr r12,1
	jmp LB_8957
LB_8956:
	bts r12,1
LB_8957:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8954
	btr r12,0
	jmp LB_8955
LB_8954:
	bts r12,0
LB_8955:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_8950
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_8836 %_8837 } ⊢ %_8838 : %_8838
 ; {>  %_8837~1':(_lst)◂(_r64) %_8836~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_8838 ⊢ %_8839 : %_8839
 ; {>  %_8838~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_8839
 ; {>  %_8839~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_8944
	btr r12,2
	jmp LB_8945
LB_8944:
	bts r12,2
LB_8945:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_8942
	btr QWORD [rdi],0
	jmp LB_8943
LB_8942:
	bts QWORD [rdi],0
LB_8943:
	mov r8,r14
	bt r12,1
	jc LB_8948
	btr r12,2
	jmp LB_8949
LB_8948:
	bts r12,2
LB_8949:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_8946
	btr QWORD [rdi],1
	jmp LB_8947
LB_8946:
	bts QWORD [rdi],1
LB_8947:
	mov rsi,1
	bt r12,3
	jc LB_8940
	mov rsi,0
	bt r9,0
	jc LB_8940
	jmp LB_8941
LB_8940:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_8941:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_8950:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8952
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8951
LB_8952:
	add rsp,8
	ret
LB_8953:
	add rsp,32
	pop r14
LB_8951:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_8826:
NS_E_RDI_8826:
NS_E_8826_ETR_TBL:
NS_E_8826_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\\"
	add r14,1
	cmp r14,r10
	jg LB_8982
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,92
	jnz LB_8982
	jmp LB_8983
LB_8982:
	jmp LB_8974
LB_8983:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8975
	btr r12,0
	jmp LB_8976
LB_8975:
	bts r12,0
LB_8976:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8971
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5c |~ {  } ⊢ %_8840 : %_8840
 ; {>  }
; 	» 0xr5c _ ⊢ 0' : %_8840
	mov rdi,0x5c
	mov r13,rdi
	bts r12,0
; _some %_8840 ⊢ %_8841 : %_8841
 ; {>  %_8840~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_8841
 ; {>  %_8841~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8969
	btr r12,3
	jmp LB_8970
LB_8969:
	bts r12,3
LB_8970:
	mov r8,0
	bts r12,2
	ret
LB_8971:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8973
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8972
LB_8973:
	add rsp,8
	ret
LB_8974:
	add rsp,16
	pop r14
LB_8972:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\""
	add r14,1
	cmp r14,r10
	jg LB_8997
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,34
	jnz LB_8997
	jmp LB_8998
LB_8997:
	jmp LB_8989
LB_8998:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_8990
	btr r12,0
	jmp LB_8991
LB_8990:
	bts r12,0
LB_8991:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_8986
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr22 |~ {  } ⊢ %_8842 : %_8842
 ; {>  }
; 	» 0xr22 _ ⊢ 0' : %_8842
	mov rdi,0x22
	mov r13,rdi
	bts r12,0
; _some %_8842 ⊢ %_8843 : %_8843
 ; {>  %_8842~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_8843
 ; {>  %_8843~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8984
	btr r12,3
	jmp LB_8985
LB_8984:
	bts r12,3
LB_8985:
	mov r8,0
	bts r12,2
	ret
LB_8986:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_8988
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_8987
LB_8988:
	add rsp,8
	ret
LB_8989:
	add rsp,16
	pop r14
LB_8987:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "n"
	add r14,1
	cmp r14,r10
	jg LB_9012
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,110
	jnz LB_9012
	jmp LB_9013
LB_9012:
	jmp LB_9004
LB_9013:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9005
	btr r12,0
	jmp LB_9006
LB_9005:
	bts r12,0
LB_9006:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9001
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_8844 : %_8844
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_8844
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _some %_8844 ⊢ %_8845 : %_8845
 ; {>  %_8844~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_8845
 ; {>  %_8845~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_8999
	btr r12,3
	jmp LB_9000
LB_8999:
	bts r12,3
LB_9000:
	mov r8,0
	bts r12,2
	ret
LB_9001:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9003
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9002
LB_9003:
	add rsp,8
	ret
LB_9004:
	add rsp,16
	pop r14
LB_9002:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "t"
	add r14,1
	cmp r14,r10
	jg LB_9027
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,116
	jnz LB_9027
	jmp LB_9028
LB_9027:
	jmp LB_9019
LB_9028:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9020
	btr r12,0
	jmp LB_9021
LB_9020:
	bts r12,0
LB_9021:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9016
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr9 |~ {  } ⊢ %_8846 : %_8846
 ; {>  }
; 	» 0xr9 _ ⊢ 0' : %_8846
	mov rdi,0x9
	mov r13,rdi
	bts r12,0
; _some %_8846 ⊢ %_8847 : %_8847
 ; {>  %_8846~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_8847
 ; {>  %_8847~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9014
	btr r12,3
	jmp LB_9015
LB_9014:
	bts r12,3
LB_9015:
	mov r8,0
	bts r12,2
	ret
LB_9016:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9018
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9017
LB_9018:
	add rsp,8
	ret
LB_9019:
	add rsp,16
	pop r14
LB_9017:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "0"
	add r14,1
	cmp r14,r10
	jg LB_9042
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,48
	jnz LB_9042
	jmp LB_9043
LB_9042:
	jmp LB_9034
LB_9043:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9035
	btr r12,0
	jmp LB_9036
LB_9035:
	bts r12,0
LB_9036:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9031
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_8848 : %_8848
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_8848
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_8848 ⊢ %_8849 : %_8849
 ; {>  %_8848~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_8849
 ; {>  %_8849~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9029
	btr r12,3
	jmp LB_9030
LB_9029:
	bts r12,3
LB_9030:
	mov r8,0
	bts r12,2
	ret
LB_9031:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9033
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9032
LB_9033:
	add rsp,8
	ret
LB_9034:
	add rsp,16
	pop r14
LB_9032:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9044:
NS_E_RDI_9044:
NS_E_9044_ETR_TBL:
NS_E_9044_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_8701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9081
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9075
LB_9081:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9076
	btr r12,0
	jmp LB_9077
LB_9076:
	bts r12,0
LB_9077:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9072
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr30 |~ {  } ⊢ %_9046 : %_9046
 ; {>  %_9045~0':_r64 }
; 	» 0xr30 _ ⊢ 1' : %_9046
	mov rdi,0x30
	mov r14,rdi
	bts r12,1
; » 0xr39 |~ {  } ⊢ %_9047 : %_9047
 ; {>  %_9046~1':_r64 %_9045~0':_r64 }
; 	» 0xr39 _ ⊢ 2' : %_9047
	mov rdi,0x39
	mov r8,rdi
	bts r12,2
; _f38 { %_9045 %_9046 } ⊢ { %_9048 %_9049 %_9050 } : { %_9048 %_9049 %_9050 }
 ; {>  %_9046~1':_r64 %_9045~0':_r64 %_9047~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_9047 %_9048 } ⊢ { %_9051 %_9052 %_9053 } : { %_9051 %_9052 %_9053 }
 ; {>  %_9049~1':_r64 %_9050~3':_r64 %_9048~0':_r64 %_9047~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_9056:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_9057
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_9057
LB_9058:
	cmp r15,0
	jz LB_9059
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9058
LB_9059:
; _some %_9052 ⊢ %_9054 : %_9054
 ; {>  %_9049~1':_r64 %_9051~2':_r64 %_9052~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9054
 ; {>  %_9049~1':_r64 %_9054~°0◂0':(_opn)◂(_r64) %_9051~2':_r64 }
; 	∎ °0◂0'
	bt r12,1
	jc LB_9060
	mov rdi,r14
	call dlt
LB_9060:
	bt r12,2
	jc LB_9061
	mov rdi,r8
	call dlt
LB_9061:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9062
	btr r12,3
	jmp LB_9063
LB_9062:
	bts r12,3
LB_9063:
	mov r8,0
	bts r12,2
	ret
MTC_LB_9057:
	mov r15,0
LB_9065:
	cmp r15,0
	jz LB_9066
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9065
LB_9066:
; _none {  } ⊢ %_9055 : %_9055
 ; {>  %_9049~1':_r64 %_9050~3':_r64 %_9051~2':_r64 %_9052~0':_r64 %_9053~4':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_9055
 ; {>  %_9055~°1◂{  }:(_opn)◂(t4808'(0)) %_9049~1':_r64 %_9050~3':_r64 %_9051~2':_r64 %_9052~0':_r64 %_9053~4':_r64 }
; 	∎ °1◂{  }
	bt r12,1
	jc LB_9067
	mov rdi,r14
	call dlt
LB_9067:
	bt r12,3
	jc LB_9068
	mov rdi,r9
	call dlt
LB_9068:
	bt r12,2
	jc LB_9069
	mov rdi,r8
	call dlt
LB_9069:
	bt r12,0
	jc LB_9070
	mov rdi,r13
	call dlt
LB_9070:
	bt r12,4
	jc LB_9071
	mov rdi,r10
	call dlt
LB_9071:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_9064:
LB_9072:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9074
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9073
LB_9074:
	add rsp,8
	ret
LB_9075:
	add rsp,16
	pop r14
LB_9073:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9083:
NS_E_RDI_9083:
NS_E_9083_ETR_TBL:
NS_E_9083_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_8701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9120
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9114
LB_9120:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9115
	btr r12,0
	jmp LB_9116
LB_9115:
	bts r12,0
LB_9116:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9111
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr61 |~ {  } ⊢ %_9085 : %_9085
 ; {>  %_9084~0':_r64 }
; 	» 0xr61 _ ⊢ 1' : %_9085
	mov rdi,0x61
	mov r14,rdi
	bts r12,1
; » 0xr7a |~ {  } ⊢ %_9086 : %_9086
 ; {>  %_9085~1':_r64 %_9084~0':_r64 }
; 	» 0xr7a _ ⊢ 2' : %_9086
	mov rdi,0x7a
	mov r8,rdi
	bts r12,2
; _f38 { %_9084 %_9085 } ⊢ { %_9087 %_9088 %_9089 } : { %_9087 %_9088 %_9089 }
 ; {>  %_9085~1':_r64 %_9086~2':_r64 %_9084~0':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_9086 %_9087 } ⊢ { %_9090 %_9091 %_9092 } : { %_9090 %_9091 %_9092 }
 ; {>  %_9089~3':_r64 %_9086~2':_r64 %_9087~0':_r64 %_9088~1':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_9095:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_9096
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_9096
LB_9097:
	cmp r15,0
	jz LB_9098
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9097
LB_9098:
; _some %_9091 ⊢ %_9093 : %_9093
 ; {>  %_9091~0':_r64 %_9090~2':_r64 %_9088~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9093
 ; {>  %_9093~°0◂0':(_opn)◂(_r64) %_9090~2':_r64 %_9088~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_9099
	mov rdi,r8
	call dlt
LB_9099:
	bt r12,1
	jc LB_9100
	mov rdi,r14
	call dlt
LB_9100:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9101
	btr r12,3
	jmp LB_9102
LB_9101:
	bts r12,3
LB_9102:
	mov r8,0
	bts r12,2
	ret
MTC_LB_9096:
	mov r15,0
LB_9104:
	cmp r15,0
	jz LB_9105
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9104
LB_9105:
; _none {  } ⊢ %_9094 : %_9094
 ; {>  %_9092~4':_r64 %_9089~3':_r64 %_9091~0':_r64 %_9090~2':_r64 %_9088~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_9094
 ; {>  %_9092~4':_r64 %_9089~3':_r64 %_9091~0':_r64 %_9090~2':_r64 %_9094~°1◂{  }:(_opn)◂(t4835'(0)) %_9088~1':_r64 }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_9106
	mov rdi,r10
	call dlt
LB_9106:
	bt r12,3
	jc LB_9107
	mov rdi,r9
	call dlt
LB_9107:
	bt r12,0
	jc LB_9108
	mov rdi,r13
	call dlt
LB_9108:
	bt r12,2
	jc LB_9109
	mov rdi,r8
	call dlt
LB_9109:
	bt r12,1
	jc LB_9110
	mov rdi,r14
	call dlt
LB_9110:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_9103:
LB_9111:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9113
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9112
LB_9113:
	add rsp,8
	ret
LB_9114:
	add rsp,16
	pop r14
LB_9112:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9122:
NS_E_RDI_9122:
NS_E_9122_ETR_TBL:
NS_E_9122_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; _byt
	push r10
	call NS_E_8701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9159
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9153
LB_9159:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9154
	btr r12,0
	jmp LB_9155
LB_9154:
	bts r12,0
LB_9155:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9150
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; » 0xr41 |~ {  } ⊢ %_9124 : %_9124
 ; {>  %_9123~0':_r64 }
; 	» 0xr41 _ ⊢ 1' : %_9124
	mov rdi,0x41
	mov r14,rdi
	bts r12,1
; » 0xr5a |~ {  } ⊢ %_9125 : %_9125
 ; {>  %_9123~0':_r64 %_9124~1':_r64 }
; 	» 0xr5a _ ⊢ 2' : %_9125
	mov rdi,0x5a
	mov r8,rdi
	bts r12,2
; _f38 { %_9123 %_9124 } ⊢ { %_9126 %_9127 %_9128 } : { %_9126 %_9127 %_9128 }
 ; {>  %_9123~0':_r64 %_9124~1':_r64 %_9125~2':_r64 }
	cmp r13,r14
	mov rsi,0
	setge sil
	mov r9,rsi
	bts r12,3
; _f38 { %_9125 %_9126 } ⊢ { %_9129 %_9130 %_9131 } : { %_9129 %_9130 %_9131 }
 ; {>  %_9126~0':_r64 %_9128~3':_r64 %_9127~1':_r64 %_9125~2':_r64 }
	cmp r8,r13
	mov rsi,0
	setge sil
	mov r10,rsi
	bts r12,4
MTC_LB_9134:
	mov r15,0
	mov QWORD rax,0x1
	cmp rax,r9
	jnz MTC_LB_9135
	mov QWORD rax,0x1
	cmp rax,r10
	jnz MTC_LB_9135
LB_9136:
	cmp r15,0
	jz LB_9137
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9136
LB_9137:
; _some %_9130 ⊢ %_9132 : %_9132
 ; {>  %_9130~0':_r64 %_9129~2':_r64 %_9127~1':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9132
 ; {>  %_9132~°0◂0':(_opn)◂(_r64) %_9129~2':_r64 %_9127~1':_r64 }
; 	∎ °0◂0'
	bt r12,2
	jc LB_9138
	mov rdi,r8
	call dlt
LB_9138:
	bt r12,1
	jc LB_9139
	mov rdi,r14
	call dlt
LB_9139:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9140
	btr r12,3
	jmp LB_9141
LB_9140:
	bts r12,3
LB_9141:
	mov r8,0
	bts r12,2
	ret
MTC_LB_9135:
	mov r15,0
LB_9143:
	cmp r15,0
	jz LB_9144
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9143
LB_9144:
; _none {  } ⊢ %_9133 : %_9133
 ; {>  %_9131~4':_r64 %_9130~0':_r64 %_9129~2':_r64 %_9128~3':_r64 %_9127~1':_r64 }
; _none {  } ⊢ °1◂{  }
; ∎ %_9133
 ; {>  %_9131~4':_r64 %_9130~0':_r64 %_9129~2':_r64 %_9128~3':_r64 %_9127~1':_r64 %_9133~°1◂{  }:(_opn)◂(t4862'(0)) }
; 	∎ °1◂{  }
	bt r12,4
	jc LB_9145
	mov rdi,r10
	call dlt
LB_9145:
	bt r12,0
	jc LB_9146
	mov rdi,r13
	call dlt
LB_9146:
	bt r12,2
	jc LB_9147
	mov rdi,r8
	call dlt
LB_9147:
	bt r12,3
	jc LB_9148
	mov rdi,r9
	call dlt
LB_9148:
	bt r12,1
	jc LB_9149
	mov rdi,r14
	call dlt
LB_9149:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
MTC_LB_9142:
LB_9150:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9152
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9151
LB_9152:
	add rsp,8
	ret
LB_9153:
	add rsp,16
	pop r14
LB_9151:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9161:
NS_E_RDI_9161:
NS_E_9161_ETR_TBL:
NS_E_9161_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_u
	push r10
	call NS_E_9122_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9177
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9171
LB_9177:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9172
	btr r12,0
	jmp LB_9173
LB_9172:
	bts r12,0
LB_9173:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9168
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9162 ⊢ %_9163 : %_9163
 ; {>  %_9162~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9163
 ; {>  %_9163~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9166
	btr r12,3
	jmp LB_9167
LB_9166:
	bts r12,3
LB_9167:
	mov r8,0
	bts r12,2
	ret
LB_9168:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9170
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9169
LB_9170:
	add rsp,8
	ret
LB_9171:
	add rsp,16
	pop r14
LB_9169:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_l
	push r10
	call NS_E_9083_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9190
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9184
LB_9190:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9185
	btr r12,0
	jmp LB_9186
LB_9185:
	bts r12,0
LB_9186:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9181
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9164 ⊢ %_9165 : %_9165
 ; {>  %_9164~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9165
 ; {>  %_9165~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9179
	btr r12,3
	jmp LB_9180
LB_9179:
	bts r12,3
LB_9180:
	mov r8,0
	bts r12,2
	ret
LB_9181:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9183
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9182
LB_9183:
	add rsp,8
	ret
LB_9184:
	add rsp,16
	pop r14
LB_9182:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9192:
NS_E_RDI_9192:
NS_E_9192_ETR_TBL:
NS_E_9192_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ch_a
	push r10
	call NS_E_9161_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9237
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9229
LB_9237:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_9193_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9242
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9243
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9243:
	jmp LB_9229
LB_9242:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9232
	btr r12,1
	jmp LB_9233
LB_9232:
	bts r12,1
LB_9233:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9230
	btr r12,0
	jmp LB_9231
LB_9230:
	bts r12,0
LB_9231:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9226
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_9195 %_9196 } ⊢ %_9197 : %_9197
 ; {>  %_9196~1':(_lst)◂(_r64) %_9195~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _f8814 %_9197 ⊢ %_9198 : %_9198
 ; {>  %_9197~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _f8814 °0◂{ 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_9212
	btr r12,2
	jmp LB_9213
LB_9212:
	bts r12,2
LB_9213:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_9218
	btr r12,3
	jmp LB_9219
LB_9218:
	bts r12,3
LB_9219:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r9
	bt r12,3
	jc LB_9216
	btr QWORD [rdi],0
	jmp LB_9217
LB_9216:
	bts QWORD [rdi],0
LB_9217:
	mov r9,r14
	bt r12,1
	jc LB_9222
	btr r12,3
	jmp LB_9223
LB_9222:
	bts r12,3
LB_9223:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r9
	bt r12,3
	jc LB_9220
	btr QWORD [rdi],1
	jmp LB_9221
LB_9220:
	bts QWORD [rdi],1
LB_9221:
	mov rsi,1
	bt r12,0
	jc LB_9214
	mov rsi,0
	bt r13,0
	jc LB_9214
	jmp LB_9215
LB_9214:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_9215:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	call NS_E_8814
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_9198 ⊢ %_9199 : %_9199
 ; {>  %_9198~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_9199
 ; {>  %_9199~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9224
	btr r12,3
	jmp LB_9225
LB_9224:
	bts r12,3
LB_9225:
	mov r8,0
	bts r12,2
	ret
LB_9226:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9228
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9227
LB_9228:
	add rsp,8
	ret
LB_9229:
	add rsp,32
	pop r14
LB_9227:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9193:
NS_E_RDI_9193:
NS_E_9193_ETR_TBL:
NS_E_9193_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word_hd
	push r10
	call NS_E_9194_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9266
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9258
LB_9266:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; word_tl
	push r10
	call NS_E_9193_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9271
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9272
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9272:
	jmp LB_9258
LB_9271:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9261
	btr r12,1
	jmp LB_9262
LB_9261:
	bts r12,1
LB_9262:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9259
	btr r12,0
	jmp LB_9260
LB_9259:
	bts r12,0
LB_9260:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9255
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_9200 %_9201 } ⊢ %_9202 : %_9202
 ; {>  %_9200~0':_r64 %_9201~1':(_lst)◂(_r64) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_9202 ⊢ %_9203 : %_9203
 ; {>  %_9202~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_9203
 ; {>  %_9203~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_9249
	btr r12,2
	jmp LB_9250
LB_9249:
	bts r12,2
LB_9250:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_9247
	btr QWORD [rdi],0
	jmp LB_9248
LB_9247:
	bts QWORD [rdi],0
LB_9248:
	mov r8,r14
	bt r12,1
	jc LB_9253
	btr r12,2
	jmp LB_9254
LB_9253:
	bts r12,2
LB_9254:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_9251
	btr QWORD [rdi],1
	jmp LB_9252
LB_9251:
	bts QWORD [rdi],1
LB_9252:
	mov rsi,1
	bt r12,3
	jc LB_9245
	mov rsi,0
	bt r9,0
	jc LB_9245
	jmp LB_9246
LB_9245:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9246:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9255:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9257
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9256
LB_9257:
	add rsp,8
	ret
LB_9258:
	add rsp,32
	pop r14
LB_9256:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_9276
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_9204 : %_9204
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_9204 ⊢ %_9205 : %_9205
 ; {>  %_9204~°1◂{  }:(_lst)◂(t4906'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_9205
 ; {>  %_9205~°0◂°1◂{  }:(_opn)◂((_lst)◂(t4909'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_9274
	mov rsi,0
	bt r9,0
	jc LB_9274
	jmp LB_9275
LB_9274:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_9275:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_9276:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9278
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9277
LB_9278:
	add rsp,8
	ret
LB_9279:
	add rsp,0
	pop r14
LB_9277:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9194:
NS_E_RDI_9194:
NS_E_9194_ETR_TBL:
NS_E_9194_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ch_a
	push r10
	call NS_E_9161_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9291
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9285
LB_9291:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9286
	btr r12,0
	jmp LB_9287
LB_9286:
	bts r12,0
LB_9287:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9282
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9206 ⊢ %_9207 : %_9207
 ; {>  %_9206~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9207
 ; {>  %_9207~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9280
	btr r12,3
	jmp LB_9281
LB_9280:
	bts r12,3
LB_9281:
	mov r8,0
	bts r12,2
	ret
LB_9282:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9284
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9283
LB_9284:
	add rsp,8
	ret
LB_9285:
	add rsp,16
	pop r14
LB_9283:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dgt
	push r10
	call NS_E_9044_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9304
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9298
LB_9304:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9299
	btr r12,0
	jmp LB_9300
LB_9299:
	bts r12,0
LB_9300:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9295
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9208 ⊢ %_9209 : %_9209
 ; {>  %_9208~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9209
 ; {>  %_9209~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9293
	btr r12,3
	jmp LB_9294
LB_9293:
	bts r12,3
LB_9294:
	mov r8,0
	bts r12,2
	ret
LB_9295:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9297
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9296
LB_9297:
	add rsp,8
	ret
LB_9298:
	add rsp,16
	pop r14
LB_9296:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_9319
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_9319
	jmp LB_9320
LB_9319:
	jmp LB_9311
LB_9320:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9312
	btr r12,0
	jmp LB_9313
LB_9312:
	bts r12,0
LB_9313:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9308
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr5f |~ {  } ⊢ %_9210 : %_9210
 ; {>  }
; 	» 0xr5f _ ⊢ 0' : %_9210
	mov rdi,0x5f
	mov r13,rdi
	bts r12,0
; _some %_9210 ⊢ %_9211 : %_9211
 ; {>  %_9210~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_9211
 ; {>  %_9211~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9306
	btr r12,3
	jmp LB_9307
LB_9306:
	bts r12,3
LB_9307:
	mov r8,0
	bts r12,2
	ret
LB_9308:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9310
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9309
LB_9310:
	add rsp,8
	ret
LB_9311:
	add rsp,16
	pop r14
LB_9309:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9321:
NS_E_RDI_9321:
NS_E_9321_ETR_TBL:
NS_E_9321_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "_"
	add r14,1
	cmp r14,r10
	jg LB_9342
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_9342
	jmp LB_9343
LB_9342:
	jmp LB_9332
LB_9343:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word_tl
	push r10
	call NS_E_9193_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9347
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_9348
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_9348:
	jmp LB_9332
LB_9347:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_9335
	btr r12,1
	jmp LB_9336
LB_9335:
	bts r12,1
LB_9336:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9333
	btr r12,0
	jmp LB_9334
LB_9333:
	bts r12,0
LB_9334:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_9329
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_9350
	btr r12,2
	jmp LB_9351
LB_9350:
	bts r12,2
LB_9351:
	mov r13,r14
	bt r12,1
	jc LB_9352
	btr r12,0
	jmp LB_9353
LB_9352:
	bts r12,0
LB_9353:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f8814 %_9322 ⊢ %_9323 : %_9323
 ; {>  %_9322~0':(_lst)◂(_r64) }
; _f8814 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_8814
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_9323 ⊢ %_9324 : %_9324
 ; {>  %_9323~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_9324
 ; {>  %_9324~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9327
	btr r12,3
	jmp LB_9328
LB_9327:
	bts r12,3
LB_9328:
	mov r8,0
	bts r12,2
	ret
LB_9329:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9331
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9330
LB_9331:
	add rsp,8
	ret
LB_9332:
	add rsp,32
	pop r14
LB_9330:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_9365
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9359
LB_9365:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9360
	btr r12,0
	jmp LB_9361
LB_9360:
	bts r12,0
LB_9361:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_9356
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _some %_9325 ⊢ %_9326 : %_9326
 ; {>  %_9325~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_9326
 ; {>  %_9326~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_9354
	btr r12,3
	jmp LB_9355
LB_9354:
	bts r12,3
LB_9355:
	mov r8,0
	bts r12,2
	ret
LB_9356:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_9358
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_9357
LB_9358:
	add rsp,8
	ret
LB_9359:
	add rsp,16
	pop r14
LB_9357:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9368:
NS_E_RDI_9368:
NS_E_9368_ETR_TBL:
NS_E_9368_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; ⟦ word ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_9377:
	jmp LB_9374
LB_9373:
	add r14,1
LB_9374:
	cmp r14,r10
	jge LB_9375
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_9373
	cmp al,10
	jz LB_9373
	cmp al,32
	jz LB_9373
LB_9375:
	push r10
	push rsi
	call NS_E_9192_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_9376
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_9378
	bts QWORD [rax],0
LB_9378:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_9377
LB_9376:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0001_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_9371
	btr QWORD [rdi],0
LB_9371:
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
LB_9370:
	add rsp,16
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_9390:
; 	|» 0'
NS_E_RDI_9390:
MTC_LB_9391:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9392
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9393
	bt QWORD [rdi],0
	jc LB_9394
	btr r12,3
	jmp LB_9395
LB_9394:
	bts r12,3
LB_9395:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9393:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_9398
	btr r12,4
	jmp LB_9399
LB_9398:
	bts r12,4
LB_9399:
	mov r14,r10
	bt r12,4
	jc LB_9396
	btr r12,1
	jmp LB_9397
LB_9396:
	bts r12,1
LB_9397:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_9402
	btr r12,4
	jmp LB_9403
LB_9402:
	bts r12,4
LB_9403:
	mov r8,r10
	bt r12,4
	jc LB_9400
	btr r12,2
	jmp LB_9401
LB_9400:
	bts r12,2
LB_9401:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9404:
	cmp r15,0
	jz LB_9405
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9404
LB_9405:
; _f9390 %_9384 ⊢ %_9385 : %_9385
 ; {>  %_9383~1':_stg %_9384~2':_p9379 }
; _f9390 2' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_9408
	btr r12,0
	jmp LB_9409
LB_9408:
	bts r12,0
LB_9409:
	call NS_E_9390
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_9406
	btr r12,1
	jmp LB_9407
LB_9406:
	bts r12,1
LB_9407:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "."
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ %_9388
 ; {>  %_9388~2':_stg %_9387~0':_stg %_9386~1':_stg }
; 	∎ 2'
	bt r12,0
	jc LB_9410
	mov rdi,r13
	call dlt
LB_9410:
	bt r12,1
	jc LB_9411
	mov rdi,r14
	call dlt
LB_9411:
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_9412
	btr r12,0
	jmp LB_9413
LB_9412:
	bts r12,0
LB_9413:
	ret
MTC_LB_9392:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9414
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9415
	bt QWORD [rdi],0
	jc LB_9416
	btr r12,2
	jmp LB_9417
LB_9416:
	bts r12,2
LB_9417:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9415:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_9418
	btr r12,1
	jmp LB_9419
LB_9418:
	bts r12,1
LB_9419:
LB_9420:
	cmp r15,0
	jz LB_9421
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9420
LB_9421:
; ∎ %_9389
 ; {>  %_9389~1':_stg }
; 	∎ 1'
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9422
	btr r12,0
	jmp LB_9423
LB_9422:
	bts r12,0
LB_9423:
	ret
MTC_LB_9414:
NS_E_9533:
; 	|» 0'
NS_E_RDI_9533:
MTC_LB_9534:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9535
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9536
	bt QWORD [rdi],0
	jc LB_9537
	btr r12,2
	jmp LB_9538
LB_9537:
	bts r12,2
LB_9538:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9536:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_9539
	btr r12,1
	jmp LB_9540
LB_9539:
	bts r12,1
LB_9540:
LB_9541:
	cmp r15,0
	jz LB_9542
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9541
LB_9542:
; 	» "??r" _ ⊢ 0' : %_9528
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_72_3f_3f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_9528
 ; {>  %_9528~0':_stg %_9527~1':_r64 }
; 	∎ 0'
	bt r12,1
	jc LB_9543
	mov rdi,r14
	call dlt
LB_9543:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_9535:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9544
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9545
	bt QWORD [rdi],0
	jc LB_9546
	btr r12,2
	jmp LB_9547
LB_9546:
	bts r12,2
LB_9547:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9545:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_9548
	btr r12,1
	jmp LB_9549
LB_9548:
	bts r12,1
LB_9549:
LB_9550:
	cmp r15,0
	jz LB_9551
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9550
LB_9551:
; 	» ".." _ ⊢ 0' : %_9530
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_2e_2e
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_9530
 ; {>  %_9530~0':_stg %_9529~1':_stg }
; 	∎ 0'
	bt r12,1
	jc LB_9552
	mov rdi,r14
	call dlt
LB_9552:
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_9544:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz MTC_LB_9553
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °2◂1'
; 0' ⊢ °2◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9554
	bt QWORD [rdi],0
	jc LB_9555
	btr r12,2
	jmp LB_9556
LB_9555:
	bts r12,2
LB_9556:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9554:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_9557
	btr r12,1
	jmp LB_9558
LB_9557:
	bts r12,1
LB_9558:
LB_9559:
	cmp r15,0
	jz LB_9560
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9559
LB_9560:
; _f9390 %_9531 ⊢ %_9532 : %_9532
 ; {>  %_9531~1':_p9379 }
; _f9390 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9561
	btr r12,0
	jmp LB_9562
LB_9561:
	bts r12,0
LB_9562:
	call NS_E_9390
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_9532
 ; {>  %_9532~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_9553:
NS_E_9599:
; 	|» 0'
NS_E_RDI_9599:
MTC_LB_9600:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9601
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9602
	bt QWORD [rdi],0
	jc LB_9603
	btr r12,3
	jmp LB_9604
LB_9603:
	bts r12,3
LB_9604:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9602:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_9607
	btr r12,4
	jmp LB_9608
LB_9607:
	bts r12,4
LB_9608:
	mov r14,r10
	bt r12,4
	jc LB_9605
	btr r12,1
	jmp LB_9606
LB_9605:
	bts r12,1
LB_9606:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_9611
	btr r12,4
	jmp LB_9612
LB_9611:
	bts r12,4
LB_9612:
	mov r8,r10
	bt r12,4
	jc LB_9609
	btr r12,2
	jmp LB_9610
LB_9609:
	bts r12,2
LB_9610:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9613:
	cmp r15,0
	jz LB_9614
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9613
LB_9614:
; _f9591 %_9593 ⊢ %_9595 : %_9595
 ; {>  %_9593~1':_p9443 %_9594~2':(_lst)◂(_p9443) }
; _f9591 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9617
	btr r12,0
	jmp LB_9618
LB_9617:
	bts r12,0
LB_9618:
	call NS_E_9591
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9615
	btr r12,2
	jmp LB_9616
LB_9615:
	bts r12,2
LB_9616:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_9597
 ; {>  %_9597~1':_stg %_9596~0':_stg %_9594~2':(_lst)◂(_p9443) }
; 	∎ 1'
	bt r12,0
	jc LB_9619
	mov rdi,r13
	call dlt
LB_9619:
	bt r12,2
	jc LB_9620
	mov rdi,r8
	call dlt
LB_9620:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9621
	btr r12,0
	jmp LB_9622
LB_9621:
	bts r12,0
LB_9622:
	ret
MTC_LB_9601:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9623
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9624
	bt QWORD [rdi],0
	jc LB_9625
	btr r12,1
	jmp LB_9626
LB_9625:
	bts r12,1
LB_9626:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9624:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9627:
	cmp r15,0
	jz LB_9628
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9627
LB_9628:
; 	» "" _ ⊢ 0' : %_9598
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_9598
 ; {>  %_9598~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_9623:
NS_E_9591:
; 	|» 0'
NS_E_RDI_9591:
MTC_LB_9629:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9630
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9631
	bt QWORD [rdi],0
	jc LB_9632
	btr r12,2
	jmp LB_9633
LB_9632:
	bts r12,2
LB_9633:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9631:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_9634
	btr r12,1
	jmp LB_9635
LB_9634:
	bts r12,1
LB_9635:
LB_9636:
	cmp r15,0
	jz LB_9637
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9636
LB_9637:
; _f9599 %_9584 ⊢ %_9585 : %_9585
 ; {>  %_9584~1':(_lst)◂(_p9443) }
; _f9599 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9638
	btr r12,0
	jmp LB_9639
LB_9638:
	bts r12,0
LB_9639:
	call NS_E_9599
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_9587
 ; {>  %_9586~0':_stg %_9587~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_9640
	mov rdi,r13
	call dlt
LB_9640:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9641
	btr r12,0
	jmp LB_9642
LB_9641:
	bts r12,0
LB_9642:
	ret
MTC_LB_9630:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9643
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9644
	bt QWORD [rdi],0
	jc LB_9645
	btr r12,2
	jmp LB_9646
LB_9645:
	bts r12,2
LB_9646:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9644:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_9647
	btr r12,1
	jmp LB_9648
LB_9647:
	bts r12,1
LB_9648:
LB_9649:
	cmp r15,0
	jz LB_9650
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9649
LB_9650:
MTC_LB_9651:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9652
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂{  }
; 1' ⊢ °0◂{  }
	btr r12,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_9653
	bt QWORD [rdi],0
	jc LB_9654
	btr r12,0
	jmp LB_9655
LB_9654:
	bts r12,0
LB_9655:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9653:
	mov r13,rdi
; 0' ⊢ {  }
	mov rdi,r13
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9656:
	cmp r15,0
	jz LB_9657
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9656
LB_9657:
; 	» "_ " _ ⊢ 0' : %_9589
	mov rdi,2
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_20_5f
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_9589
 ; {>  %_9589~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_9652:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9658
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_9659
	bt QWORD [rdi],0
	jc LB_9660
	btr r12,2
	jmp LB_9661
LB_9660:
	bts r12,2
LB_9661:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9659:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_9662
	btr r12,0
	jmp LB_9663
LB_9662:
	bts r12,0
LB_9663:
LB_9664:
	cmp r15,0
	jz LB_9665
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9664
LB_9665:
; ∎ %_9590
 ; {>  %_9590~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_9658:
MTC_LB_9643:
NS_E_9582:
; 	|» 0'
NS_E_RDI_9582:
MTC_LB_9666:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9667
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂{ 1' 2' }
; 0' ⊢ °0◂{ 1' 2' }
	btr r12,3
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9668
	bt QWORD [rdi],0
	jc LB_9669
	btr r12,3
	jmp LB_9670
LB_9669:
	bts r12,3
LB_9670:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9668:
	mov r9,rdi
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_9673
	btr r12,4
	jmp LB_9674
LB_9673:
	bts r12,4
LB_9674:
	mov r14,r10
	bt r12,4
	jc LB_9671
	btr r12,1
	jmp LB_9672
LB_9671:
	bts r12,1
LB_9672:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_9677
	btr r12,4
	jmp LB_9678
LB_9677:
	bts r12,4
LB_9678:
	mov r8,r10
	bt r12,4
	jc LB_9675
	btr r12,2
	jmp LB_9676
LB_9675:
	bts r12,2
LB_9676:
	mov rdi,r9
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9679:
	cmp r15,0
	jz LB_9680
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9679
LB_9680:
; _f9574 %_9576 ⊢ %_9578 : %_9578
 ; {>  %_9577~2':(_lst)◂(_p9442) %_9576~1':_p9442 }
; _f9574 1' ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9683
	btr r12,0
	jmp LB_9684
LB_9683:
	bts r12,0
LB_9684:
	call NS_E_9574
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_9681
	btr r12,2
	jmp LB_9682
LB_9681:
	bts r12,2
LB_9682:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_9580
 ; {>  %_9577~2':(_lst)◂(_p9442) %_9579~0':_stg %_9580~1':_stg }
; 	∎ 1'
	bt r12,2
	jc LB_9685
	mov rdi,r8
	call dlt
LB_9685:
	bt r12,0
	jc LB_9686
	mov rdi,r13
	call dlt
LB_9686:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9687
	btr r12,0
	jmp LB_9688
LB_9687:
	bts r12,0
LB_9688:
	ret
MTC_LB_9667:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9689
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂{  }
; 0' ⊢ °1◂{  }
	btr r12,1
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9690
	bt QWORD [rdi],0
	jc LB_9691
	btr r12,1
	jmp LB_9692
LB_9691:
	bts r12,1
LB_9692:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9690:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_9693:
	cmp r15,0
	jz LB_9694
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9693
LB_9694:
; 	» "" _ ⊢ 0' : %_9581
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r13,rdi
	btr r12,0
; ∎ %_9581
 ; {>  %_9581~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_9689:
NS_E_9574:
; 	|» 0'
NS_E_RDI_9574:
MTC_LB_9695:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9696
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °0◂1'
; 0' ⊢ °0◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9697
	bt QWORD [rdi],0
	jc LB_9698
	btr r12,2
	jmp LB_9699
LB_9698:
	bts r12,2
LB_9699:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9697:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_9700
	btr r12,1
	jmp LB_9701
LB_9700:
	bts r12,1
LB_9701:
LB_9702:
	cmp r15,0
	jz LB_9703
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9702
LB_9703:
; _f9582 %_9564 ⊢ %_9565 : %_9565
 ; {>  %_9564~1':(_lst)◂(_p9442) }
; _f9582 1' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9704
	btr r12,0
	jmp LB_9705
LB_9704:
	bts r12,0
LB_9705:
	call NS_E_9582
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "{ "
	mov rsi,0x_7b
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "}"
	mov rsi,0x_7d
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ %_9567
 ; {>  %_9566~0':_stg %_9567~1':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_9706
	mov rdi,r13
	call dlt
LB_9706:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9707
	btr r12,0
	jmp LB_9708
LB_9707:
	bts r12,0
LB_9708:
	ret
MTC_LB_9696:
	mov r15,0
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9709
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ °1◂1'
; 0' ⊢ °1◂1'
	btr r12,2
	mov rax,r13
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r13
	bt QWORD [rdi],17
	jnc LB_9710
	bt QWORD [rdi],0
	jc LB_9711
	btr r12,2
	jmp LB_9712
LB_9711:
	bts r12,2
LB_9712:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9710:
	mov r8,rdi
	mov r14,r8
	bt r12,2
	jc LB_9713
	btr r12,1
	jmp LB_9714
LB_9713:
	bts r12,1
LB_9714:
LB_9715:
	cmp r15,0
	jz LB_9716
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9715
LB_9716:
MTC_LB_9717:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9718
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °0◂0'
; 1' ⊢ °0◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_9719
	bt QWORD [rdi],0
	jc LB_9720
	btr r12,2
	jmp LB_9721
LB_9720:
	bts r12,2
LB_9721:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9719:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_9722
	btr r12,0
	jmp LB_9723
LB_9722:
	bts r12,0
LB_9723:
LB_9724:
	cmp r15,0
	jz LB_9725
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9724
LB_9725:
; _f9533 %_9569 ⊢ %_9570 : %_9570
 ; {>  %_9569~0':_p9445 }
; _f9533 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_9533
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r13
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "%[ "
	mov rsi,0x_25
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5b
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r13
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " ] "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_5d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; ∎ %_9572
 ; {>  %_9572~1':_stg %_9571~0':_stg }
; 	∎ 1'
	bt r12,0
	jc LB_9726
	mov rdi,r13
	call dlt
LB_9726:
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_9727
	btr r12,0
	jmp LB_9728
LB_9727:
	bts r12,0
LB_9728:
	ret
MTC_LB_9718:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_9729
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ °1◂0'
; 1' ⊢ °1◂0'
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_9730
	bt QWORD [rdi],0
	jc LB_9731
	btr r12,2
	jmp LB_9732
LB_9731:
	bts r12,2
LB_9732:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9730:
	mov r8,rdi
	mov r13,r8
	bt r12,2
	jc LB_9733
	btr r12,0
	jmp LB_9734
LB_9733:
	bts r12,0
LB_9734:
LB_9735:
	cmp r15,0
	jz LB_9736
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_9735
LB_9736:
; ∎ %_9573
 ; {>  %_9573~0':_stg }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_9729:
MTC_LB_9709:
NS_E_9992:
; 	|» { 0' 1' }
NS_E_RDI_9992:
MTC_LB_9993:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_9994
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' }
; 1' ⊢ °0◂{ 2' 3' 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_9995
	bt QWORD [rdi],0
	jc LB_9996
	btr r12,5
	jmp LB_9997
LB_9996:
	bts r12,5
LB_9997:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_9995:
	mov r11,rdi
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_10000
	btr r12,6
	jmp LB_10001
LB_10000:
	bts r12,6
LB_10001:
	mov r8,rcx
	bt r12,6
	jc LB_9998
	btr r12,2
	jmp LB_9999
LB_9998:
	bts r12,2
LB_9999:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_10004
	btr r12,6
	jmp LB_10005
LB_10004:
	bts r12,6
LB_10005:
	mov r9,rcx
	bt r12,6
	jc LB_10002
	btr r12,3
	jmp LB_10003
LB_10002:
	bts r12,3
LB_10003:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_10008
	btr r12,6
	jmp LB_10009
LB_10008:
	bts r12,6
LB_10009:
	mov r10,rcx
	bt r12,6
	jc LB_10006
	btr r12,4
	jmp LB_10007
LB_10006:
	bts r12,4
LB_10007:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10010:
	cmp r15,0
	jz LB_10011
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10010
LB_10011:
; _f9992 { %_9961 %_9965 } ⊢ { %_9966 %_9967 } : { %_9966 %_9967 }
 ; {>  %_9965~4':_p9447 %_9963~2':(_lst)◂(_p9449) %_9964~3':_p9448 %_9961~0':_r64 }
; _f9992 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10016
	btr r12,1
	jmp LB_10017
LB_10016:
	bts r12,1
LB_10017:
	call NS_E_9992
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_10014
	btr r12,3
	jmp LB_10015
LB_10014:
	bts r12,3
LB_10015:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10012
	btr r12,2
	jmp LB_10013
LB_10012:
	bts r12,2
LB_10013:
	add rsp,24
MTC_LB_10018:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10019
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °0◂4'
; 3' ⊢ °0◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_10020
	bt QWORD [rdi],0
	jc LB_10021
	btr r12,5
	jmp LB_10022
LB_10021:
	bts r12,5
LB_10022:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10020:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_10023
	btr r12,4
	jmp LB_10024
LB_10023:
	bts r12,4
LB_10024:
LB_10025:
	cmp r15,0
	jz LB_10026
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10025
LB_10026:
; _f9992 { %_9966 %_9968 } ⊢ { %_9969 %_9970 } : { %_9969 %_9970 }
 ; {>  %_9963~2':(_lst)◂(_p9449) %_9967~1':_stg %_9966~0':_r64 %_9968~4':_p9447 }
; _f9992 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10031
	btr r12,1
	jmp LB_10032
LB_10031:
	bts r12,1
LB_10032:
	call NS_E_9992
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_10033
	btr r12,3
	jmp LB_10034
LB_10033:
	bts r12,3
LB_10034:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10029
	btr r12,2
	jmp LB_10030
LB_10029:
	bts r12,2
LB_10030:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10027
	btr r12,1
	jmp LB_10028
LB_10027:
	bts r12,1
LB_10028:
	add rsp,24
; » _^ ..
	xor rax,rax
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9969 %_9973 }
 ; {>  %_9963~2':(_lst)◂(_p9449) %_9969~0':_r64 %_9972~3':_stg %_9971~1':_stg %_9973~4':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_10035
	mov rdi,r8
	call dlt
LB_10035:
	bt r12,3
	jc LB_10036
	mov rdi,r9
	call dlt
LB_10036:
	bt r12,1
	jc LB_10037
	mov rdi,r14
	call dlt
LB_10037:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10038
	btr r12,1
	jmp LB_10039
LB_10038:
	bts r12,1
LB_10039:
	ret
MTC_LB_10019:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10040
; _emt_mov_ptn_to_ptn:{| 11110.. |},3' ⊢ °1◂4'
; 3' ⊢ °1◂4'
	btr r12,5
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_10041
	bt QWORD [rdi],0
	jc LB_10042
	btr r12,5
	jmp LB_10043
LB_10042:
	bts r12,5
LB_10043:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10041:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_10044
	btr r12,4
	jmp LB_10045
LB_10044:
	bts r12,4
LB_10045:
LB_10046:
	cmp r15,0
	jz LB_10047
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10046
LB_10047:
; _f9929 { %_9966 %_9974 } ⊢ { %_9975 %_9976 } : { %_9975 %_9976 }
 ; {>  %_9963~2':(_lst)◂(_p9449) %_9974~4':_p9446 %_9967~1':_stg %_9966~0':_r64 }
; _f9929 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10052
	btr r12,1
	jmp LB_10053
LB_10052:
	bts r12,1
LB_10053:
	call NS_E_9929
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_10054
	btr r12,3
	jmp LB_10055
LB_10054:
	bts r12,3
LB_10055:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10050
	btr r12,2
	jmp LB_10051
LB_10050:
	bts r12,2
LB_10051:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10048
	btr r12,1
	jmp LB_10049
LB_10048:
	bts r12,1
LB_10049:
	add rsp,24
; » _^ ..
	xor rax,rax
	add rax,9
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; "\226\136\144 .. .\n"
	mov rsi,0x_2e_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; 1'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9975 %_9979 }
 ; {>  %_9979~4':_stg %_9977~1':_stg %_9963~2':(_lst)◂(_p9449) %_9975~0':_r64 %_9978~3':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_10056
	mov rdi,r14
	call dlt
LB_10056:
	bt r12,2
	jc LB_10057
	mov rdi,r8
	call dlt
LB_10057:
	bt r12,3
	jc LB_10058
	mov rdi,r9
	call dlt
LB_10058:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10059
	btr r12,1
	jmp LB_10060
LB_10059:
	bts r12,1
LB_10060:
	ret
MTC_LB_10040:
MTC_LB_9994:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10061
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' }
; 1' ⊢ °1◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10062
	bt QWORD [rdi],0
	jc LB_10063
	btr r12,4
	jmp LB_10064
LB_10063:
	bts r12,4
LB_10064:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10062:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_10067
	btr r12,5
	jmp LB_10068
LB_10067:
	bts r12,5
LB_10068:
	mov r8,r11
	bt r12,5
	jc LB_10065
	btr r12,2
	jmp LB_10066
LB_10065:
	bts r12,2
LB_10066:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_10071
	btr r12,5
	jmp LB_10072
LB_10071:
	bts r12,5
LB_10072:
	mov r9,r11
	bt r12,5
	jc LB_10069
	btr r12,3
	jmp LB_10070
LB_10069:
	bts r12,3
LB_10070:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10073:
	cmp r15,0
	jz LB_10074
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10073
LB_10074:
MTC_LB_10075:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10076
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_10077
	bt QWORD [rdi],0
	jc LB_10078
	btr r12,4
	jmp LB_10079
LB_10078:
	bts r12,4
LB_10079:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10077:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_10080
	btr r12,1
	jmp LB_10081
LB_10080:
	bts r12,1
LB_10081:
LB_10082:
	cmp r15,0
	jz LB_10083
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10082
LB_10083:
; _f9992 { %_9961 %_9982 } ⊢ { %_9983 %_9984 } : { %_9983 %_9984 }
 ; {>  %_9982~1':_p9447 %_9980~2':(_lst)◂(_p9449) %_9961~0':_r64 }
; _f9992 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_9992
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10084
	btr r12,2
	jmp LB_10085
LB_10084:
	bts r12,2
LB_10085:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9983 %_9986 }
 ; {>  %_9983~0':_r64 %_9980~2':(_lst)◂(_p9449) %_9985~1':_stg %_9986~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_10086
	mov rdi,r8
	call dlt
LB_10086:
	bt r12,1
	jc LB_10087
	mov rdi,r14
	call dlt
LB_10087:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10088
	btr r12,1
	jmp LB_10089
LB_10088:
	bts r12,1
LB_10089:
	ret
MTC_LB_10076:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10090
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_10091
	bt QWORD [rdi],0
	jc LB_10092
	btr r12,4
	jmp LB_10093
LB_10092:
	bts r12,4
LB_10093:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10091:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_10094
	btr r12,1
	jmp LB_10095
LB_10094:
	bts r12,1
LB_10095:
LB_10096:
	cmp r15,0
	jz LB_10097
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10096
LB_10097:
; _f9929 { %_9961 %_9987 } ⊢ { %_9988 %_9989 } : { %_9988 %_9989 }
 ; {>  %_9980~2':(_lst)◂(_p9449) %_9961~0':_r64 %_9987~1':_p9446 }
; _f9929 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_9929
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10098
	btr r12,2
	jmp LB_10099
LB_10098:
	bts r12,2
LB_10099:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,10
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; "\226\136\144. .. .\n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_2e
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+1],sil
	add rdi,10
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9988 %_9991 }
 ; {>  %_9990~1':_stg %_9980~2':(_lst)◂(_p9449) %_9988~0':_r64 %_9991~3':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_10100
	mov rdi,r14
	call dlt
LB_10100:
	bt r12,2
	jc LB_10101
	mov rdi,r8
	call dlt
LB_10101:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10102
	btr r12,1
	jmp LB_10103
LB_10102:
	bts r12,1
LB_10103:
	ret
MTC_LB_10090:
MTC_LB_10061:
NS_E_9960:
; 	|» { 0' { 1' 2' 3' } }
NS_E_RDI_9960:
; _f9574 %_9932 ⊢ %_9934 : %_9934
 ; {>  %_9932~2':_p9442 %_9931~1':_p9451 %_9933~3':_p9443 %_9930~0':_r64 }
; _f9574 2' ⊢ 2'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10110
	btr r12,0
	jmp LB_10111
LB_10110:
	bts r12,0
LB_10111:
	call NS_E_9574
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_10112
	btr r12,2
	jmp LB_10113
LB_10112:
	bts r12,2
LB_10113:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_10108
	btr r12,3
	jmp LB_10109
LB_10108:
	bts r12,3
LB_10109:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10106
	btr r12,1
	jmp LB_10107
LB_10106:
	bts r12,1
LB_10107:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10104
	btr r12,0
	jmp LB_10105
LB_10104:
	bts r12,0
LB_10105:
	add rsp,32
; _f9591 %_9933 ⊢ %_9935 : %_9935
 ; {>  %_9934~2':_stg %_9931~1':_p9451 %_9933~3':_p9443 %_9930~0':_r64 }
; _f9591 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10120
	btr r12,0
	jmp LB_10121
LB_10120:
	bts r12,0
LB_10121:
	call NS_E_9591
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_10122
	btr r12,3
	jmp LB_10123
LB_10122:
	bts r12,3
LB_10123:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_10118
	btr r12,2
	jmp LB_10119
LB_10118:
	bts r12,2
LB_10119:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_10116
	btr r12,1
	jmp LB_10117
LB_10116:
	bts r12,1
LB_10117:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10114
	btr r12,0
	jmp LB_10115
LB_10114:
	bts r12,0
LB_10115:
	add rsp,32
MTC_LB_10124:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10125
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °0◂4'
; 1' ⊢ °0◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10126
	bt QWORD [rdi],0
	jc LB_10127
	btr r12,5
	jmp LB_10128
LB_10127:
	bts r12,5
LB_10128:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10126:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_10129
	btr r12,4
	jmp LB_10130
LB_10129:
	bts r12,4
LB_10130:
LB_10131:
	cmp r15,0
	jz LB_10132
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10131
LB_10132:
; _f9390 %_9936 ⊢ %_9937 : %_9937
 ; {>  %_9936~4':_p9379 %_9934~2':_stg %_9935~3':_stg %_9930~0':_r64 }
; _f9390 4' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_10139
	btr r12,0
	jmp LB_10140
LB_10139:
	bts r12,0
LB_10140:
	call NS_E_9390
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10141
	btr r12,1
	jmp LB_10142
LB_10141:
	bts r12,1
LB_10142:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_10137
	btr r12,3
	jmp LB_10138
LB_10137:
	bts r12,3
LB_10138:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10135
	btr r12,2
	jmp LB_10136
LB_10135:
	bts r12,2
LB_10136:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10133
	btr r12,0
	jmp LB_10134
LB_10133:
	bts r12,0
LB_10134:
	add rsp,32
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_9930 %_9941 }
 ; {>  %_9938~1':_stg %_9941~4':_stg %_9940~3':_stg %_9930~0':_r64 %_9939~2':_stg }
; 	∎ { 0' 4' }
	bt r12,1
	jc LB_10143
	mov rdi,r14
	call dlt
LB_10143:
	bt r12,3
	jc LB_10144
	mov rdi,r9
	call dlt
LB_10144:
	bt r12,2
	jc LB_10145
	mov rdi,r8
	call dlt
LB_10145:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10146
	btr r12,1
	jmp LB_10147
LB_10146:
	bts r12,1
LB_10147:
	ret
MTC_LB_10125:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10148
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °1◂4'
; 1' ⊢ °1◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10149
	bt QWORD [rdi],0
	jc LB_10150
	btr r12,5
	jmp LB_10151
LB_10150:
	bts r12,5
LB_10151:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10149:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_10152
	btr r12,4
	jmp LB_10153
LB_10152:
	bts r12,4
LB_10153:
LB_10154:
	cmp r15,0
	jz LB_10155
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10154
LB_10155:
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "$ "
	mov rsi,0x_24
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_9930 %_9945 }
 ; {>  %_9944~3':_stg %_9945~1':_stg %_9943~2':_stg %_9942~4':_r64 %_9930~0':_r64 }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_10156
	mov rdi,r9
	call dlt
LB_10156:
	bt r12,2
	jc LB_10157
	mov rdi,r8
	call dlt
LB_10157:
	bt r12,4
	jc LB_10158
	mov rdi,r10
	call dlt
LB_10158:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10148:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_10159
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °2◂{  }
; 1' ⊢ °2◂{  }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10160
	bt QWORD [rdi],0
	jc LB_10161
	btr r12,4
	jmp LB_10162
LB_10161:
	bts r12,4
LB_10162:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10160:
	mov r10,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10163:
	cmp r15,0
	jz LB_10164
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10163
LB_10164:
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "\226\151\130 "
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_97
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_82
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_9930 %_9948 }
 ; {>  %_9947~3':_stg %_9948~1':_stg %_9930~0':_r64 %_9946~2':_stg }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_10165
	mov rdi,r9
	call dlt
LB_10165:
	bt r12,2
	jc LB_10166
	mov rdi,r8
	call dlt
LB_10166:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10159:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_10167
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °3◂4'
; 1' ⊢ °3◂4'
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10168
	bt QWORD [rdi],0
	jc LB_10169
	btr r12,5
	jmp LB_10170
LB_10169:
	bts r12,5
LB_10170:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10168:
	mov r11,rdi
	mov r10,r11
	bt r12,5
	jc LB_10171
	btr r12,4
	jmp LB_10172
LB_10171:
	bts r12,4
LB_10172:
LB_10173:
	cmp r15,0
	jz LB_10174
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10173
LB_10174:
; _f9533 %_9949 ⊢ %_9950 : %_9950
 ; {>  %_9934~2':_stg %_9949~4':_p9445 %_9935~3':_stg %_9930~0':_r64 }
; _f9533 4' ⊢ 1'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 000010.. |},4' ⊢ 0'
	mov r13,r10
	bt r12,4
	jc LB_10181
	btr r12,0
	jmp LB_10182
LB_10181:
	bts r12,0
LB_10182:
	call NS_E_9533
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10183
	btr r12,1
	jmp LB_10184
LB_10183:
	bts r12,1
LB_10184:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_10179
	btr r12,3
	jmp LB_10180
LB_10179:
	bts r12,3
LB_10180:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10177
	btr r12,2
	jmp LB_10178
LB_10177:
	bts r12,2
LB_10178:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10175
	btr r12,0
	jmp LB_10176
LB_10175:
	bts r12,0
LB_10176:
	add rsp,32
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; "\194\187 "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_9930 %_9954 }
 ; {>  %_9953~3':_stg %_9952~2':_stg %_9954~4':_stg %_9951~1':_stg %_9930~0':_r64 }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_10185
	mov rdi,r9
	call dlt
LB_10185:
	bt r12,2
	jc LB_10186
	mov rdi,r8
	call dlt
LB_10186:
	bt r12,1
	jc LB_10187
	mov rdi,r14
	call dlt
LB_10187:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10188
	btr r12,1
	jmp LB_10189
LB_10188:
	bts r12,1
LB_10189:
	ret
MTC_LB_10167:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_10190
; _emt_mov_ptn_to_ptn:{| 11110.. |},1' ⊢ °4◂{ 4' 5' }
; 1' ⊢ °4◂{ 4' 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10191
	bt QWORD [rdi],0
	jc LB_10192
	btr r12,6
	jmp LB_10193
LB_10192:
	bts r12,6
LB_10193:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10191:
	mov rcx,rdi
; 6' ⊢ { 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_10196
	btr r12,7
	jmp LB_10197
LB_10196:
	bts r12,7
LB_10197:
	mov r10,rdx
	bt r12,7
	jc LB_10194
	btr r12,4
	jmp LB_10195
LB_10194:
	bts r12,4
LB_10195:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_10200
	btr r12,7
	jmp LB_10201
LB_10200:
	bts r12,7
LB_10201:
	mov r11,rdx
	bt r12,7
	jc LB_10198
	btr r12,5
	jmp LB_10199
LB_10198:
	bts r12,5
LB_10199:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10202:
	cmp r15,0
	jz LB_10203
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10202
LB_10203:
; » _^ ..
	xor rax,rax
	add rax,6
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,5
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	add rax,3
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "\194\187 _^ "
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_bb
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_5f
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_5e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+5],sil
	add rdi,6
; 0'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " \226\138\162 "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 1'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; "//\n"
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2f
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; ∎ { %_9930 %_9959 }
 ; {>  %_9956~5':(_lst)◂(_p9452) %_9958~3':_stg %_9955~4':_r64 %_9959~1':_stg %_9930~0':_r64 %_9957~2':_stg }
; 	∎ { 0' 1' }
	bt r12,5
	jc LB_10204
	mov rdi,r11
	call dlt
LB_10204:
	bt r12,3
	jc LB_10205
	mov rdi,r9
	call dlt
LB_10205:
	bt r12,4
	jc LB_10206
	mov rdi,r10
	call dlt
LB_10206:
	bt r12,2
	jc LB_10207
	mov rdi,r8
	call dlt
LB_10207:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10190:
NS_E_9929:
; 	|» { 0' 1' }
NS_E_RDI_9929:
MTC_LB_10208:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10209
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' 4' } 5' }
; 1' ⊢ °0◂{ { 2' 3' 4' } 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10210
	bt QWORD [rdi],0
	jc LB_10211
	btr r12,6
	jmp LB_10212
LB_10211:
	bts r12,6
LB_10212:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10210:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_10225
	btr r12,7
	jmp LB_10226
LB_10225:
	bts r12,7
LB_10226:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_10215
	btr r12,5
	jmp LB_10216
LB_10215:
	bts r12,5
LB_10216:
	mov r8,r11
	bt r12,5
	jc LB_10213
	btr r12,2
	jmp LB_10214
LB_10213:
	bts r12,2
LB_10214:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_10219
	btr r12,5
	jmp LB_10220
LB_10219:
	bts r12,5
LB_10220:
	mov r9,r11
	bt r12,5
	jc LB_10217
	btr r12,3
	jmp LB_10218
LB_10217:
	bts r12,3
LB_10218:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_10223
	btr r12,5
	jmp LB_10224
LB_10223:
	bts r12,5
LB_10224:
	mov r10,r11
	bt r12,5
	jc LB_10221
	btr r12,4
	jmp LB_10222
LB_10221:
	bts r12,4
LB_10222:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_10229
	btr r12,7
	jmp LB_10230
LB_10229:
	bts r12,7
LB_10230:
	mov r11,rdx
	bt r12,7
	jc LB_10227
	btr r12,5
	jmp LB_10228
LB_10227:
	bts r12,5
LB_10228:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10231:
	cmp r15,0
	jz LB_10232
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10231
LB_10232:
; _f9960 { %_9913 %_9915 } ⊢ { %_9917 %_9918 } : { %_9917 %_9918 }
 ; {>  %_9915~{ 2' 3' 4' }:{ _p9451 _p9442 _p9443 } %_9913~0':_r64 %_9916~5':_p9446 }
; _f9960 { 0' { 2' 3' 4' } } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 101110.. |},{ 0' { 2' 3' 4' } } ⊢ { 0' { 1' 2' 3' } }
	mov r14,r8
	bt r12,2
	jc LB_10235
	btr r12,1
	jmp LB_10236
LB_10235:
	bts r12,1
LB_10236:
	mov r8,r9
	bt r12,3
	jc LB_10237
	btr r12,2
	jmp LB_10238
LB_10237:
	bts r12,2
LB_10238:
	mov r9,r10
	bt r12,4
	jc LB_10239
	btr r12,3
	jmp LB_10240
LB_10239:
	bts r12,3
LB_10240:
	call NS_E_9960
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*0]
	bt QWORD rax,5
	jc LB_10233
	btr r12,5
	jmp LB_10234
LB_10233:
	bts r12,5
LB_10234:
	add rsp,16
; _f9929 { %_9917 %_9916 } ⊢ { %_9919 %_9920 } : { %_9919 %_9920 }
 ; {>  %_9918~1':_stg %_9917~0':_r64 %_9916~5':_p9446 }
; _f9929 { 0' 5' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_10243
	btr r12,1
	jmp LB_10244
LB_10243:
	bts r12,1
LB_10244:
	call NS_E_9929
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_10245
	btr r12,2
	jmp LB_10246
LB_10245:
	bts r12,2
LB_10246:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10241
	btr r12,1
	jmp LB_10242
LB_10241:
	bts r12,1
LB_10242:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9919 %_9923 }
 ; {>  %_9919~0':_r64 %_9922~2':_stg %_9923~3':_stg %_9921~1':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_10247
	mov rdi,r8
	call dlt
LB_10247:
	bt r12,1
	jc LB_10248
	mov rdi,r14
	call dlt
LB_10248:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10249
	btr r12,1
	jmp LB_10250
LB_10249:
	bts r12,1
LB_10250:
	ret
MTC_LB_10209:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10251
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10252
	bt QWORD [rdi],0
	jc LB_10253
	btr r12,3
	jmp LB_10254
LB_10253:
	bts r12,3
LB_10254:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10252:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_10255
	btr r12,2
	jmp LB_10256
LB_10255:
	bts r12,2
LB_10256:
LB_10257:
	cmp r15,0
	jz LB_10258
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10257
LB_10258:
; _f9992 { %_9913 %_9924 } ⊢ { %_9925 %_9926 } : { %_9925 %_9926 }
 ; {>  %_9913~0':_r64 %_9924~2':_p9447 }
; _f9992 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10259
	btr r12,1
	jmp LB_10260
LB_10259:
	bts r12,1
LB_10260:
	call NS_E_9992
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_9925 %_9926 }
 ; {>  %_9925~0':_r64 %_9926~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10251:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_10261
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂2'
; 1' ⊢ °2◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10262
	bt QWORD [rdi],0
	jc LB_10263
	btr r12,3
	jmp LB_10264
LB_10263:
	bts r12,3
LB_10264:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10262:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_10265
	btr r12,2
	jmp LB_10266
LB_10265:
	bts r12,2
LB_10266:
LB_10267:
	cmp r15,0
	jz LB_10268
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10267
LB_10268:
; 	» "\226\136\142 ..\n" _ ⊢ 1' : %_9928
	mov rdi,7
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_0a_2e_2e_20_8e_88_e2
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_9913 %_9928 }
 ; {>  %_9913~0':_r64 %_9927~2':_p9442 %_9928~1':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_10269
	mov rdi,r8
	call dlt
LB_10269:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10261:
NS_E_9912:
; 	|» { 0' 1' }
NS_E_RDI_9912:
MTC_LB_10270:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10271
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10272
	bt QWORD [rdi],0
	jc LB_10273
	btr r12,5
	jmp LB_10274
LB_10273:
	bts r12,5
LB_10274:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10272:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_10283
	btr r12,6
	jmp LB_10284
LB_10283:
	bts r12,6
LB_10284:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10277
	btr r12,4
	jmp LB_10278
LB_10277:
	bts r12,4
LB_10278:
	mov r8,r10
	bt r12,4
	jc LB_10275
	btr r12,2
	jmp LB_10276
LB_10275:
	bts r12,2
LB_10276:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10281
	btr r12,4
	jmp LB_10282
LB_10281:
	bts r12,4
LB_10282:
	mov r9,r10
	bt r12,4
	jc LB_10279
	btr r12,3
	jmp LB_10280
LB_10279:
	bts r12,3
LB_10280:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_10287
	btr r12,6
	jmp LB_10288
LB_10287:
	bts r12,6
LB_10288:
	mov r10,rcx
	bt r12,6
	jc LB_10285
	btr r12,4
	jmp LB_10286
LB_10285:
	bts r12,4
LB_10286:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10289:
	cmp r15,0
	jz LB_10290
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10289
LB_10290:
; _f9912 { %_9901 %_9905 } ⊢ { %_9906 %_9907 } : { %_9906 %_9907 }
 ; {>  %_9904~3':t5242'(-1) %_9903~2':_stg %_9901~0':t5134'(-1) %_9905~4':(_lst)◂({ _stg t5242'(-1) }) }
; _f9912 { 0' 4' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10295
	btr r12,1
	jmp LB_10296
LB_10295:
	bts r12,1
LB_10296:
	call NS_E_9912
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_10293
	btr r12,3
	jmp LB_10294
LB_10293:
	bts r12,3
LB_10294:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10291
	btr r12,2
	jmp LB_10292
LB_10291:
	bts r12,2
LB_10292:
	add rsp,24
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "..\n"
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9906 %_9910 }
 ; {>  %_9908~2':_stg %_9906~0':t5134'(-1) %_9904~3':t5242'(-1) %_9910~4':_stg %_9909~1':_stg }
; 	∎ { 0' 4' }
	bt r12,2
	jc LB_10297
	mov rdi,r8
	call dlt
LB_10297:
	bt r12,3
	jc LB_10298
	mov rdi,r9
	call dlt
LB_10298:
	bt r12,1
	jc LB_10299
	mov rdi,r14
	call dlt
LB_10299:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10300
	btr r12,1
	jmp LB_10301
LB_10300:
	bts r12,1
LB_10301:
	ret
MTC_LB_10271:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10302
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10303
	bt QWORD [rdi],0
	jc LB_10304
	btr r12,2
	jmp LB_10305
LB_10304:
	bts r12,2
LB_10305:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10303:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10306:
	cmp r15,0
	jz LB_10307
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10306
LB_10307:
; 	» "" _ ⊢ 1' : %_9911
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_9901 %_9911 }
 ; {>  %_9911~1':_stg %_9901~0':t5134'(-1) }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10302:
NS_E_9900:
; 	|» { 0' 1' }
NS_E_RDI_9900:
MTC_LB_10308:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10309
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' 4' } 5' }
; 1' ⊢ °0◂{ { 2' 3' 4' } 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10310
	bt QWORD [rdi],0
	jc LB_10311
	btr r12,6
	jmp LB_10312
LB_10311:
	bts r12,6
LB_10312:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10310:
	mov rcx,rdi
; 6' ⊢ { { 2' 3' 4' } 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_10325
	btr r12,7
	jmp LB_10326
LB_10325:
	bts r12,7
LB_10326:
; 7' ⊢ { 2' 3' 4' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_10315
	btr r12,5
	jmp LB_10316
LB_10315:
	bts r12,5
LB_10316:
	mov r8,r11
	bt r12,5
	jc LB_10313
	btr r12,2
	jmp LB_10314
LB_10313:
	bts r12,2
LB_10314:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_10319
	btr r12,5
	jmp LB_10320
LB_10319:
	bts r12,5
LB_10320:
	mov r9,r11
	bt r12,5
	jc LB_10317
	btr r12,3
	jmp LB_10318
LB_10317:
	bts r12,3
LB_10318:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_10323
	btr r12,5
	jmp LB_10324
LB_10323:
	bts r12,5
LB_10324:
	mov r10,r11
	bt r12,5
	jc LB_10321
	btr r12,4
	jmp LB_10322
LB_10321:
	bts r12,4
LB_10322:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_10329
	btr r12,7
	jmp LB_10330
LB_10329:
	bts r12,7
LB_10330:
	mov r11,rdx
	bt r12,7
	jc LB_10327
	btr r12,5
	jmp LB_10328
LB_10327:
	bts r12,5
LB_10328:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10331:
	cmp r15,0
	jz LB_10332
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10331
LB_10332:
; _f9591 %_9886 ⊢ %_9889 : %_9889
 ; {>  %_9886~3':_p9443 %_9883~0':_r64 %_9888~5':(_lst)◂({ _stg _p9443 _p9446 }) %_9887~4':_p9446 %_9885~2':_stg }
; _f9591 3' ⊢ 1'
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_10341
	btr r12,0
	jmp LB_10342
LB_10341:
	bts r12,0
LB_10342:
	call NS_E_9591
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10343
	btr r12,1
	jmp LB_10344
LB_10343:
	bts r12,1
LB_10344:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_10339
	btr r12,5
	jmp LB_10340
LB_10339:
	bts r12,5
LB_10340:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_10337
	btr r12,4
	jmp LB_10338
LB_10337:
	bts r12,4
LB_10338:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10335
	btr r12,2
	jmp LB_10336
LB_10335:
	bts r12,2
LB_10336:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10333
	btr r12,0
	jmp LB_10334
LB_10333:
	bts r12,0
LB_10334:
	add rsp,40
; _f9900 { %_9883 %_9888 } ⊢ { %_9890 %_9891 } : { %_9890 %_9891 }
 ; {>  %_9883~0':_r64 %_9888~5':(_lst)◂({ _stg _p9443 _p9446 }) %_9887~4':_p9446 %_9885~2':_stg %_9889~1':_stg }
; _f9900 { 0' 5' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_10351
	btr r12,1
	jmp LB_10352
LB_10351:
	bts r12,1
LB_10352:
	call NS_E_9900
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_10353
	btr r12,3
	jmp LB_10354
LB_10353:
	bts r12,3
LB_10354:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_10349
	btr r12,4
	jmp LB_10350
LB_10349:
	bts r12,4
LB_10350:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10347
	btr r12,2
	jmp LB_10348
LB_10347:
	bts r12,2
LB_10348:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10345
	btr r12,1
	jmp LB_10346
LB_10345:
	bts r12,1
LB_10346:
	add rsp,32
; _f9929 { %_9890 %_9887 } ⊢ { %_9892 %_9893 } : { %_9892 %_9893 }
 ; {>  %_9890~0':_r64 %_9887~4':_p9446 %_9885~2':_stg %_9891~3':_stg %_9889~1':_stg }
; _f9929 { 0' 4' } ⊢ { 0' 4' }
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10361
	btr r12,1
	jmp LB_10362
LB_10361:
	bts r12,1
LB_10362:
	call NS_E_9929
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 4' }
	mov r10,r14
	bt r12,1
	jc LB_10363
	btr r12,4
	jmp LB_10364
LB_10363:
	bts r12,4
LB_10364:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_10359
	btr r12,3
	jmp LB_10360
LB_10359:
	bts r12,3
LB_10360:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10357
	btr r12,2
	jmp LB_10358
LB_10357:
	bts r12,2
LB_10358:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10355
	btr r12,1
	jmp LB_10356
LB_10355:
	bts r12,1
LB_10356:
	add rsp,32
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r10
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r11,rax
	btr r12,5
	mov rdi,rax
	add rdi,8
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r10
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 3'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9892 %_9898 }
 ; {>  %_9894~2':_stg %_9898~5':_stg %_9897~3':_stg %_9895~1':_stg %_9896~4':_stg %_9892~0':_r64 }
; 	∎ { 0' 5' }
	bt r12,2
	jc LB_10365
	mov rdi,r8
	call dlt
LB_10365:
	bt r12,3
	jc LB_10366
	mov rdi,r9
	call dlt
LB_10366:
	bt r12,1
	jc LB_10367
	mov rdi,r14
	call dlt
LB_10367:
	bt r12,4
	jc LB_10368
	mov rdi,r10
	call dlt
LB_10368:
; _emt_mov_ptn_to_ptn:{| 1000010.. |},{ 0' 5' } ⊢ { 0' 1' }
	mov r14,r11
	bt r12,5
	jc LB_10369
	btr r12,1
	jmp LB_10370
LB_10369:
	bts r12,1
LB_10370:
	ret
MTC_LB_10309:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10371
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10372
	bt QWORD [rdi],0
	jc LB_10373
	btr r12,2
	jmp LB_10374
LB_10373:
	bts r12,2
LB_10374:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10372:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10375:
	cmp r15,0
	jz LB_10376
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10375
LB_10376:
; 	» "" _ ⊢ 1' : %_9899
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_9883 %_9899 }
 ; {>  %_9883~0':_r64 %_9899~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10371:
NS_E_9882:
; 	|» { 0' 1' }
NS_E_RDI_9882:
MTC_LB_10377:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10378
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10379
	bt QWORD [rdi],0
	jc LB_10380
	btr r12,4
	jmp LB_10381
LB_10380:
	bts r12,4
LB_10381:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10379:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_10384
	btr r12,5
	jmp LB_10385
LB_10384:
	bts r12,5
LB_10385:
	mov r8,r11
	bt r12,5
	jc LB_10382
	btr r12,2
	jmp LB_10383
LB_10382:
	bts r12,2
LB_10383:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_10388
	btr r12,5
	jmp LB_10389
LB_10388:
	bts r12,5
LB_10389:
	mov r9,r11
	bt r12,5
	jc LB_10386
	btr r12,3
	jmp LB_10387
LB_10386:
	bts r12,3
LB_10387:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10390:
	cmp r15,0
	jz LB_10391
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10390
LB_10391:
; _f9591 %_9865 ⊢ %_9867 : %_9867
 ; {>  %_9865~2':_p9443 %_9866~3':_p9446 %_9863~0':_r64 }
; _f9591 2' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10396
	btr r12,0
	jmp LB_10397
LB_10396:
	bts r12,0
LB_10397:
	call NS_E_9591
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10398
	btr r12,1
	jmp LB_10399
LB_10398:
	bts r12,1
LB_10399:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_10394
	btr r12,3
	jmp LB_10395
LB_10394:
	bts r12,3
LB_10395:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10392
	btr r12,0
	jmp LB_10393
LB_10392:
	bts r12,0
LB_10393:
	add rsp,24
; _f9929 { %_9863 %_9866 } ⊢ { %_9868 %_9869 } : { %_9868 %_9869 }
 ; {>  %_9867~1':_stg %_9866~3':_p9446 %_9863~0':_r64 }
; _f9929 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10402
	btr r12,1
	jmp LB_10403
LB_10402:
	bts r12,1
LB_10403:
	call NS_E_9929
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_10404
	btr r12,2
	jmp LB_10405
LB_10404:
	bts r12,2
LB_10405:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10400
	btr r12,1
	jmp LB_10401
LB_10400:
	bts r12,1
LB_10401:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; " "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9868 %_9872 }
 ; {>  %_9871~2':_stg %_9870~1':_stg %_9868~0':_r64 %_9872~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_10406
	mov rdi,r8
	call dlt
LB_10406:
	bt r12,1
	jc LB_10407
	mov rdi,r14
	call dlt
LB_10407:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10408
	btr r12,1
	jmp LB_10409
LB_10408:
	bts r12,1
LB_10409:
	ret
MTC_LB_10378:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10410
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10411
	bt QWORD [rdi],0
	jc LB_10412
	btr r12,3
	jmp LB_10413
LB_10412:
	bts r12,3
LB_10413:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10411:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_10414
	btr r12,2
	jmp LB_10415
LB_10414:
	bts r12,2
LB_10415:
LB_10416:
	cmp r15,0
	jz LB_10417
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10416
LB_10417:
; _f9533 %_9873 ⊢ %_9874 : %_9874
 ; {>  %_9873~2':_p9445 %_9863~0':_r64 }
; _f9533 2' ⊢ 1'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10420
	btr r12,0
	jmp LB_10421
LB_10420:
	bts r12,0
LB_10421:
	call NS_E_9533
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10422
	btr r12,1
	jmp LB_10423
LB_10422:
	bts r12,1
LB_10423:
; pop_iv
	mov rax,QWORD [rsp]
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10418
	btr r12,0
	jmp LB_10419
LB_10418:
	bts r12,0
LB_10419:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_9863 %_9876 }
 ; {>  %_9876~2':_stg %_9875~1':_stg %_9863~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_10424
	mov rdi,r14
	call dlt
LB_10424:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10425
	btr r12,1
	jmp LB_10426
LB_10425:
	bts r12,1
LB_10426:
	ret
MTC_LB_10410:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_10427
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂2'
; 1' ⊢ °2◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10428
	bt QWORD [rdi],0
	jc LB_10429
	btr r12,3
	jmp LB_10430
LB_10429:
	bts r12,3
LB_10430:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10428:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_10431
	btr r12,2
	jmp LB_10432
LB_10431:
	bts r12,2
LB_10432:
LB_10433:
	cmp r15,0
	jz LB_10434
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10433
LB_10434:
; _f9929 { %_9863 %_9877 } ⊢ { %_9878 %_9879 } : { %_9878 %_9879 }
 ; {>  %_9877~2':_p9446 %_9863~0':_r64 }
; _f9929 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10435
	btr r12,1
	jmp LB_10436
LB_10435:
	bts r12,1
LB_10436:
	call NS_E_9929
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,5
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; " \194\171 \n"
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_ab
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+4],sil
	add rdi,5
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9878 %_9881 }
 ; {>  %_9880~1':_stg %_9878~0':_r64 %_9881~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_10437
	mov rdi,r14
	call dlt
LB_10437:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10438
	btr r12,1
	jmp LB_10439
LB_10438:
	bts r12,1
LB_10439:
	ret
MTC_LB_10427:
NS_E_9862:
; 	|» { 0' 1' }
NS_E_RDI_9862:
MTC_LB_10440:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10441
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' 5' 6' 7' }
; 1' ⊢ °0◂{ 2' 3' 4' 5' 6' 7' }
	btr r12,8
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10442
	bt QWORD [rdi],0
	jc LB_10443
	btr r12,8
	jmp LB_10444
LB_10443:
	bts r12,8
LB_10444:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10442:
	mov QWORD [st_vct+8*8],rdi
; 8' ⊢ { 2' 3' 4' 5' 6' 7' }
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],0
	jc LB_10447
	btr r12,9
	jmp LB_10448
LB_10447:
	bts r12,9
LB_10448:
	mov r8,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_10445
	btr r12,2
	jmp LB_10446
LB_10445:
	bts r12,2
LB_10446:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],1
	jc LB_10451
	btr r12,9
	jmp LB_10452
LB_10451:
	bts r12,9
LB_10452:
	mov r9,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_10449
	btr r12,3
	jmp LB_10450
LB_10449:
	bts r12,3
LB_10450:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],2
	jc LB_10455
	btr r12,9
	jmp LB_10456
LB_10455:
	bts r12,9
LB_10456:
	mov r10,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_10453
	btr r12,4
	jmp LB_10454
LB_10453:
	bts r12,4
LB_10454:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],3
	jc LB_10459
	btr r12,9
	jmp LB_10460
LB_10459:
	bts r12,9
LB_10460:
	mov r11,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_10457
	btr r12,5
	jmp LB_10458
LB_10457:
	bts r12,5
LB_10458:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],4
	jc LB_10463
	btr r12,9
	jmp LB_10464
LB_10463:
	bts r12,9
LB_10464:
	mov rcx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_10461
	btr r12,6
	jmp LB_10462
LB_10461:
	bts r12,6
LB_10462:
	mov rdi,QWORD [st_vct+8*8]
	mov rax,QWORD [rdi+8*1+8*5]
	mov QWORD [st_vct+8*9],rax
	bt QWORD [rdi],5
	jc LB_10467
	btr r12,9
	jmp LB_10468
LB_10467:
	bts r12,9
LB_10468:
	mov rdx,QWORD [st_vct+8*9]
	bt r12,9
	jc LB_10465
	btr r12,7
	jmp LB_10466
LB_10465:
	bts r12,7
LB_10466:
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10469:
	cmp r15,0
	jz LB_10470
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10469
LB_10470:
; _f9591 %_9836 ⊢ %_9842 : %_9842
 ; {>  %_9840~6':(_opn)◂(_p9433) %_9837~3':_p9446 %_9841~7':_p9433 %_9834~0':_r64 %_9836~2':_p9443 %_9839~5':_p9435 %_9838~4':_p9434 }
; _f9591 2' ⊢ 1'
; push_iv 
	sub rsp,56
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp+8+8*5],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10483
	btr r12,0
	jmp LB_10484
LB_10483:
	bts r12,0
LB_10484:
	call NS_E_9591
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10485
	btr r12,1
	jmp LB_10486
LB_10485:
	bts r12,1
LB_10486:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*5]
	bt QWORD rax,7
	jc LB_10481
	btr r12,7
	jmp LB_10482
LB_10481:
	bts r12,7
LB_10482:
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_10479
	btr r12,6
	jmp LB_10480
LB_10479:
	bts r12,6
LB_10480:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_10477
	btr r12,5
	jmp LB_10478
LB_10477:
	bts r12,5
LB_10478:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_10475
	btr r12,4
	jmp LB_10476
LB_10475:
	bts r12,4
LB_10476:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_10473
	btr r12,3
	jmp LB_10474
LB_10473:
	bts r12,3
LB_10474:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10471
	btr r12,0
	jmp LB_10472
LB_10471:
	bts r12,0
LB_10472:
	add rsp,56
; _f9929 { %_9834 %_9837 } ⊢ { %_9843 %_9844 } : { %_9843 %_9844 }
 ; {>  %_9840~6':(_opn)◂(_p9433) %_9837~3':_p9446 %_9842~1':_stg %_9841~7':_p9433 %_9834~0':_r64 %_9839~5':_p9435 %_9838~4':_p9434 }
; _f9929 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp+8+8*4],rdx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10497
	btr r12,1
	jmp LB_10498
LB_10497:
	bts r12,1
LB_10498:
	call NS_E_9929
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_10499
	btr r12,2
	jmp LB_10500
LB_10499:
	bts r12,2
LB_10500:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*4]
	bt QWORD rax,7
	jc LB_10495
	btr r12,7
	jmp LB_10496
LB_10495:
	bts r12,7
LB_10496:
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_10493
	btr r12,6
	jmp LB_10494
LB_10493:
	bts r12,6
LB_10494:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_10491
	btr r12,5
	jmp LB_10492
LB_10491:
	bts r12,5
LB_10492:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_10489
	btr r12,4
	jmp LB_10490
LB_10489:
	bts r12,4
LB_10490:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10487
	btr r12,1
	jmp LB_10488
LB_10487:
	bts r12,1
LB_10488:
	add rsp,48
; _f9862 { %_9843 %_9841 } ⊢ { %_9845 %_9846 } : { %_9845 %_9846 }
 ; {>  %_9840~6':(_opn)◂(_p9433) %_9842~1':_stg %_9841~7':_p9433 %_9844~2':_stg %_9843~0':_r64 %_9839~5':_p9435 %_9838~4':_p9434 }
; _f9862 { 0' 7' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_10511
	btr r12,1
	jmp LB_10512
LB_10511:
	bts r12,1
LB_10512:
	call NS_E_9862
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_10513
	btr r12,3
	jmp LB_10514
LB_10513:
	bts r12,3
LB_10514:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_10509
	btr r12,6
	jmp LB_10510
LB_10509:
	bts r12,6
LB_10510:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_10507
	btr r12,5
	jmp LB_10508
LB_10507:
	bts r12,5
LB_10508:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_10505
	btr r12,4
	jmp LB_10506
LB_10505:
	bts r12,4
LB_10506:
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10503
	btr r12,2
	jmp LB_10504
LB_10503:
	bts r12,2
LB_10504:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10501
	btr r12,1
	jmp LB_10502
LB_10501:
	bts r12,1
LB_10502:
	add rsp,48
; » _^ ..
	xor rax,rax
	add rax,11
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rdx,rax
	btr r12,7
	mov rdi,rax
	add rdi,8
; "\226\136\144 .. \226\138\162 "
	mov rsi,0x_e2_20_2e_2e_20_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+2],sil
	add rdi,11
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9845 %_9850 }
 ; {>  %_9850~7':_stg %_9849~3':_stg %_9840~6':(_opn)◂(_p9433) %_9848~2':_stg %_9847~1':_stg %_9839~5':_p9435 %_9838~4':_p9434 %_9845~0':_r64 }
; 	∎ { 0' 7' }
	bt r12,3
	jc LB_10515
	mov rdi,r9
	call dlt
LB_10515:
	bt r12,6
	jc LB_10516
	mov rdi,rcx
	call dlt
LB_10516:
	bt r12,2
	jc LB_10517
	mov rdi,r8
	call dlt
LB_10517:
	bt r12,1
	jc LB_10518
	mov rdi,r14
	call dlt
LB_10518:
	bt r12,5
	jc LB_10519
	mov rdi,r11
	call dlt
LB_10519:
	bt r12,4
	jc LB_10520
	mov rdi,r10
	call dlt
LB_10520:
; _emt_mov_ptn_to_ptn:{| 100000010.. |},{ 0' 7' } ⊢ { 0' 1' }
	mov r14,rdx
	bt r12,7
	jc LB_10521
	btr r12,1
	jmp LB_10522
LB_10521:
	bts r12,1
LB_10522:
	ret
MTC_LB_10441:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10523
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' 5' 6' }
; 1' ⊢ °1◂{ 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10524
	bt QWORD [rdi],0
	jc LB_10525
	btr r12,7
	jmp LB_10526
LB_10525:
	bts r12,7
LB_10526:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10524:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_10529
	btr r12,8
	jmp LB_10530
LB_10529:
	bts r12,8
LB_10530:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10527
	btr r12,2
	jmp LB_10528
LB_10527:
	bts r12,2
LB_10528:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_10533
	btr r12,8
	jmp LB_10534
LB_10533:
	bts r12,8
LB_10534:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10531
	btr r12,3
	jmp LB_10532
LB_10531:
	bts r12,3
LB_10532:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_10537
	btr r12,8
	jmp LB_10538
LB_10537:
	bts r12,8
LB_10538:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10535
	btr r12,4
	jmp LB_10536
LB_10535:
	bts r12,4
LB_10536:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_10541
	btr r12,8
	jmp LB_10542
LB_10541:
	bts r12,8
LB_10542:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10539
	btr r12,5
	jmp LB_10540
LB_10539:
	bts r12,5
LB_10540:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_10545
	btr r12,8
	jmp LB_10546
LB_10545:
	bts r12,8
LB_10546:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10543
	btr r12,6
	jmp LB_10544
LB_10543:
	bts r12,6
LB_10544:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10547:
	cmp r15,0
	jz LB_10548
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10547
LB_10548:
; _f9591 %_9851 ⊢ %_9856 : %_9856
 ; {>  %_9852~3':_p9446 %_9851~2':_p9443 %_9855~6':(_opn)◂(_p9433) %_9834~0':_r64 %_9853~4':_p9434 %_9854~5':_p9435 }
; _f9591 2' ⊢ 1'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_10559
	btr r12,0
	jmp LB_10560
LB_10559:
	bts r12,0
LB_10560:
	call NS_E_9591
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10561
	btr r12,1
	jmp LB_10562
LB_10561:
	bts r12,1
LB_10562:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_10557
	btr r12,6
	jmp LB_10558
LB_10557:
	bts r12,6
LB_10558:
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_10555
	btr r12,5
	jmp LB_10556
LB_10555:
	bts r12,5
LB_10556:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_10553
	btr r12,4
	jmp LB_10554
LB_10553:
	bts r12,4
LB_10554:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_10551
	btr r12,3
	jmp LB_10552
LB_10551:
	bts r12,3
LB_10552:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10549
	btr r12,0
	jmp LB_10550
LB_10549:
	bts r12,0
LB_10550:
	add rsp,48
; _f9929 { %_9834 %_9852 } ⊢ { %_9857 %_9858 } : { %_9857 %_9858 }
 ; {>  %_9852~3':_p9446 %_9855~6':(_opn)◂(_p9433) %_9834~0':_r64 %_9853~4':_p9434 %_9856~1':_stg %_9854~5':_p9435 }
; _f9929 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp+8+8*2],r11
	mov QWORD [rsp+8+8*3],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10571
	btr r12,1
	jmp LB_10572
LB_10571:
	bts r12,1
LB_10572:
	call NS_E_9929
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_10573
	btr r12,2
	jmp LB_10574
LB_10573:
	bts r12,2
LB_10574:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*3]
	bt QWORD rax,6
	jc LB_10569
	btr r12,6
	jmp LB_10570
LB_10569:
	bts r12,6
LB_10570:
	mov r11,QWORD [rsp+8+8*2]
	bt QWORD rax,5
	jc LB_10567
	btr r12,5
	jmp LB_10568
LB_10567:
	bts r12,5
LB_10568:
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_10565
	btr r12,4
	jmp LB_10566
LB_10565:
	bts r12,4
LB_10566:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10563
	btr r12,1
	jmp LB_10564
LB_10563:
	bts r12,1
LB_10564:
	add rsp,40
; » _^ ..
	xor rax,rax
	add rax,12
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; "\226\136\144. .. \226\138\162 "
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_e2
	mov BYTE [rdi+8*1+0],sil
	mov rsi,0x_8a
	mov BYTE [rdi+8*1+1],sil
	mov rsi,0x_a2
	mov BYTE [rdi+8*1+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*1+3],sil
	add rdi,12
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9857 %_9861 }
 ; {>  %_9855~6':(_opn)◂(_p9433) %_9861~3':_stg %_9853~4':_p9434 %_9857~0':_r64 %_9854~5':_p9435 %_9859~1':_stg %_9860~2':_stg }
; 	∎ { 0' 3' }
	bt r12,6
	jc LB_10575
	mov rdi,rcx
	call dlt
LB_10575:
	bt r12,4
	jc LB_10576
	mov rdi,r10
	call dlt
LB_10576:
	bt r12,5
	jc LB_10577
	mov rdi,r11
	call dlt
LB_10577:
	bt r12,1
	jc LB_10578
	mov rdi,r14
	call dlt
LB_10578:
	bt r12,2
	jc LB_10579
	mov rdi,r8
	call dlt
LB_10579:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10580
	btr r12,1
	jmp LB_10581
LB_10580:
	bts r12,1
LB_10581:
	ret
MTC_LB_10523:
NS_E_9833:
; 	|» { 0' 1' }
NS_E_RDI_9833:
MTC_LB_10582:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10583
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' 4' 5' 6' }
; 1' ⊢ °0◂{ 2' 3' 4' 5' 6' }
	btr r12,7
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10584
	bt QWORD [rdi],0
	jc LB_10585
	btr r12,7
	jmp LB_10586
LB_10585:
	bts r12,7
LB_10586:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10584:
	mov rdx,rdi
; 7' ⊢ { 2' 3' 4' 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_10589
	btr r12,8
	jmp LB_10590
LB_10589:
	bts r12,8
LB_10590:
	mov r8,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10587
	btr r12,2
	jmp LB_10588
LB_10587:
	bts r12,2
LB_10588:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_10593
	btr r12,8
	jmp LB_10594
LB_10593:
	bts r12,8
LB_10594:
	mov r9,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10591
	btr r12,3
	jmp LB_10592
LB_10591:
	bts r12,3
LB_10592:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*2]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],2
	jc LB_10597
	btr r12,8
	jmp LB_10598
LB_10597:
	bts r12,8
LB_10598:
	mov r10,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10595
	btr r12,4
	jmp LB_10596
LB_10595:
	bts r12,4
LB_10596:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*3]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],3
	jc LB_10601
	btr r12,8
	jmp LB_10602
LB_10601:
	bts r12,8
LB_10602:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10599
	btr r12,5
	jmp LB_10600
LB_10599:
	bts r12,5
LB_10600:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*4]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],4
	jc LB_10605
	btr r12,8
	jmp LB_10606
LB_10605:
	bts r12,8
LB_10606:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_10603
	btr r12,6
	jmp LB_10604
LB_10603:
	bts r12,6
LB_10604:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10607:
	cmp r15,0
	jz LB_10608
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10607
LB_10608:
; _f9833 { %_9817 %_9823 } ⊢ { %_9824 %_9825 } : { %_9824 %_9825 }
 ; {>  %_9817~0':_r64 %_9822~5':(_opn)◂(_p9432) %_9820~3':_p9434 %_9823~6':_p9432 %_9819~2':(_opn)◂(_stg) %_9821~4':_p9435 }
; _f9833 { 0' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,40
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp+8+8*2],r10
	mov QWORD [rsp+8+8*3],r11
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_10617
	btr r12,1
	jmp LB_10618
LB_10617:
	bts r12,1
LB_10618:
	call NS_E_9833
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*3]
	bt QWORD rax,5
	jc LB_10615
	btr r12,5
	jmp LB_10616
LB_10615:
	bts r12,5
LB_10616:
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_10613
	btr r12,4
	jmp LB_10614
LB_10613:
	bts r12,4
LB_10614:
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_10611
	btr r12,3
	jmp LB_10612
LB_10611:
	bts r12,3
LB_10612:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10609
	btr r12,2
	jmp LB_10610
LB_10609:
	bts r12,2
LB_10610:
	add rsp,40
; » _^ ..
	xor rax,rax
	add rax,7
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov rcx,rax
	btr r12,6
	mov rdi,rax
	add rdi,8
; "\226\136\144 ..\n"
	mov rsi,0x_e2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_88
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_90
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+3],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+4],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+5],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+6],sil
	add rdi,7
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9824 %_9827 }
 ; {>  %_9826~1':_stg %_9827~6':_stg %_9824~0':_r64 %_9822~5':(_opn)◂(_p9432) %_9820~3':_p9434 %_9819~2':(_opn)◂(_stg) %_9821~4':_p9435 }
; 	∎ { 0' 6' }
	bt r12,1
	jc LB_10619
	mov rdi,r14
	call dlt
LB_10619:
	bt r12,5
	jc LB_10620
	mov rdi,r11
	call dlt
LB_10620:
	bt r12,3
	jc LB_10621
	mov rdi,r9
	call dlt
LB_10621:
	bt r12,2
	jc LB_10622
	mov rdi,r8
	call dlt
LB_10622:
	bt r12,4
	jc LB_10623
	mov rdi,r10
	call dlt
LB_10623:
; _emt_mov_ptn_to_ptn:{| 10000010.. |},{ 0' 6' } ⊢ { 0' 1' }
	mov r14,rcx
	bt r12,6
	jc LB_10624
	btr r12,1
	jmp LB_10625
LB_10624:
	bts r12,1
LB_10625:
	ret
MTC_LB_10583:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10626
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{ 2' 3' 4' 5' }
; 1' ⊢ °1◂{ 2' 3' 4' 5' }
	btr r12,6
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10627
	bt QWORD [rdi],0
	jc LB_10628
	btr r12,6
	jmp LB_10629
LB_10628:
	bts r12,6
LB_10629:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10627:
	mov rcx,rdi
; 6' ⊢ { 2' 3' 4' 5' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_10632
	btr r12,7
	jmp LB_10633
LB_10632:
	bts r12,7
LB_10633:
	mov r8,rdx
	bt r12,7
	jc LB_10630
	btr r12,2
	jmp LB_10631
LB_10630:
	bts r12,2
LB_10631:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_10636
	btr r12,7
	jmp LB_10637
LB_10636:
	bts r12,7
LB_10637:
	mov r9,rdx
	bt r12,7
	jc LB_10634
	btr r12,3
	jmp LB_10635
LB_10634:
	bts r12,3
LB_10635:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_10640
	btr r12,7
	jmp LB_10641
LB_10640:
	bts r12,7
LB_10641:
	mov r10,rdx
	bt r12,7
	jc LB_10638
	btr r12,4
	jmp LB_10639
LB_10638:
	bts r12,4
LB_10639:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*3]
	mov rdx,rax
	bt QWORD [rdi],3
	jc LB_10644
	btr r12,7
	jmp LB_10645
LB_10644:
	bts r12,7
LB_10645:
	mov r11,rdx
	bt r12,7
	jc LB_10642
	btr r12,5
	jmp LB_10643
LB_10642:
	bts r12,5
LB_10643:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10646:
	cmp r15,0
	jz LB_10647
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10646
LB_10647:
; » _^ ..
	xor rax,rax
	add rax,9
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
	mov rdi,rax
	add rdi,8
; "\226\136\144. .. \n"
	mov rsi,0x_20_2e_2e_20_2e_90_88_e2
	mov QWORD [rdi+8*0],rsi
	mov rsi,0x_0a
	mov BYTE [rdi+8*1+0],sil
	add rdi,9
; ∎ { %_9817 %_9832 }
 ; {>  %_9817~0':_r64 %_9830~4':_p9435 %_9831~5':(_opn)◂(_p9432) %_9829~3':_p9434 %_9832~1':_stg %_9828~2':(_opn)◂(_stg) }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_10648
	mov rdi,r10
	call dlt
LB_10648:
	bt r12,5
	jc LB_10649
	mov rdi,r11
	call dlt
LB_10649:
	bt r12,3
	jc LB_10650
	mov rdi,r9
	call dlt
LB_10650:
	bt r12,2
	jc LB_10651
	mov rdi,r8
	call dlt
LB_10651:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10626:
NS_E_9816:
; 	|» { 0' 1' }
NS_E_RDI_9816:
MTC_LB_10652:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10653
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂2'
; 1' ⊢ °0◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10654
	bt QWORD [rdi],0
	jc LB_10655
	btr r12,3
	jmp LB_10656
LB_10655:
	bts r12,3
LB_10656:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10654:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_10657
	btr r12,2
	jmp LB_10658
LB_10657:
	bts r12,2
LB_10658:
LB_10659:
	cmp r15,0
	jz LB_10660
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10659
LB_10660:
; _f9833 { %_9808 %_9810 } ⊢ { %_9811 %_9812 } : { %_9811 %_9812 }
 ; {>  %_9810~2':_p9432 %_9808~0':_r64 }
; _f9833 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10661
	btr r12,1
	jmp LB_10662
LB_10661:
	bts r12,1
LB_10662:
	call NS_E_9833
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_9811 %_9812 }
 ; {>  %_9812~1':_stg %_9811~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10653:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10663
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10664
	bt QWORD [rdi],0
	jc LB_10665
	btr r12,3
	jmp LB_10666
LB_10665:
	bts r12,3
LB_10666:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10664:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_10667
	btr r12,2
	jmp LB_10668
LB_10667:
	bts r12,2
LB_10668:
LB_10669:
	cmp r15,0
	jz LB_10670
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10669
LB_10670:
; _f9862 { %_9808 %_9813 } ⊢ { %_9814 %_9815 } : { %_9814 %_9815 }
 ; {>  %_9808~0':_r64 %_9813~2':_p9433 }
; _f9862 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10671
	btr r12,1
	jmp LB_10672
LB_10671:
	bts r12,1
LB_10672:
	call NS_E_9862
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ { %_9814 %_9815 }
 ; {>  %_9815~1':_stg %_9814~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10663:
NS_E_9807:
; 	|» { 0' 1' }
NS_E_RDI_9807:
MTC_LB_10673:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10674
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ { 2' 3' } 4' }
; 1' ⊢ °0◂{ { 2' 3' } 4' }
	btr r12,5
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10675
	bt QWORD [rdi],0
	jc LB_10676
	btr r12,5
	jmp LB_10677
LB_10676:
	bts r12,5
LB_10677:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10675:
	mov r11,rdi
; 5' ⊢ { { 2' 3' } 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_10686
	btr r12,6
	jmp LB_10687
LB_10686:
	bts r12,6
LB_10687:
; 6' ⊢ { 2' 3' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_10680
	btr r12,4
	jmp LB_10681
LB_10680:
	bts r12,4
LB_10681:
	mov r8,r10
	bt r12,4
	jc LB_10678
	btr r12,2
	jmp LB_10679
LB_10678:
	bts r12,2
LB_10679:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_10684
	btr r12,4
	jmp LB_10685
LB_10684:
	bts r12,4
LB_10685:
	mov r9,r10
	bt r12,4
	jc LB_10682
	btr r12,3
	jmp LB_10683
LB_10682:
	bts r12,3
LB_10683:
	mov rdi,rcx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_10690
	btr r12,6
	jmp LB_10691
LB_10690:
	bts r12,6
LB_10691:
	mov r10,rcx
	bt r12,6
	jc LB_10688
	btr r12,4
	jmp LB_10689
LB_10688:
	bts r12,4
LB_10689:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10692:
	cmp r15,0
	jz LB_10693
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10692
LB_10693:
; _f9816 { %_9793 %_9796 } ⊢ { %_9798 %_9799 } : { %_9798 %_9799 }
 ; {>  %_9795~2':_stg %_9797~4':(_lst)◂({ _stg _p9431 }) %_9793~0':_r64 %_9796~3':_p9431 }
; _f9816 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10698
	btr r12,1
	jmp LB_10699
LB_10698:
	bts r12,1
LB_10699:
	call NS_E_9816
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_10696
	btr r12,4
	jmp LB_10697
LB_10696:
	bts r12,4
LB_10697:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10694
	btr r12,2
	jmp LB_10695
LB_10694:
	bts r12,2
LB_10695:
	add rsp,24
; _f9807 { %_9798 %_9797 } ⊢ { %_9800 %_9801 } : { %_9800 %_9801 }
 ; {>  %_9795~2':_stg %_9798~0':_r64 %_9799~1':_stg %_9797~4':(_lst)◂({ _stg _p9431 }) }
; _f9807 { 0' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10704
	btr r12,1
	jmp LB_10705
LB_10704:
	bts r12,1
LB_10705:
	call NS_E_9807
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_10706
	btr r12,3
	jmp LB_10707
LB_10706:
	bts r12,3
LB_10707:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10702
	btr r12,2
	jmp LB_10703
LB_10702:
	bts r12,2
LB_10703:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10700
	btr r12,1
	jmp LB_10701
LB_10700:
	bts r12,1
LB_10701:
	add rsp,24
; » _^ ..
	xor rax,rax
	add rax,2
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r9
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r10,rax
	btr r12,4
	mov rdi,rax
	add rdi,8
; "@."
	mov rsi,0x_40
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_2e
	mov BYTE [rdi+8*0+1],sil
	add rdi,2
; 0'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 2'
	push rcx
	mov rsi,r9
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9800 %_9805 }
 ; {>  %_9804~3':_stg %_9805~4':_stg %_9803~1':_stg %_9800~0':_r64 %_9802~2':_stg }
; 	∎ { 0' 4' }
	bt r12,3
	jc LB_10708
	mov rdi,r9
	call dlt
LB_10708:
	bt r12,1
	jc LB_10709
	mov rdi,r14
	call dlt
LB_10709:
	bt r12,2
	jc LB_10710
	mov rdi,r8
	call dlt
LB_10710:
; _emt_mov_ptn_to_ptn:{| 100010.. |},{ 0' 4' } ⊢ { 0' 1' }
	mov r14,r10
	bt r12,4
	jc LB_10711
	btr r12,1
	jmp LB_10712
LB_10711:
	bts r12,1
LB_10712:
	ret
MTC_LB_10674:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10713
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10714
	bt QWORD [rdi],0
	jc LB_10715
	btr r12,2
	jmp LB_10716
LB_10715:
	bts r12,2
LB_10716:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10714:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10717:
	cmp r15,0
	jz LB_10718
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10717
LB_10718:
; 	» "" _ ⊢ 1' : %_9806
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_9793 %_9806 }
 ; {>  %_9793~0':_r64 %_9806~1':_stg }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10713:
NS_E_9792:
; 	|» { 0' 1' }
NS_E_RDI_9792:
MTC_LB_10719:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10720
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10721
	bt QWORD [rdi],0
	jc LB_10722
	btr r12,4
	jmp LB_10723
LB_10722:
	bts r12,4
LB_10723:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10721:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_10726
	btr r12,5
	jmp LB_10727
LB_10726:
	bts r12,5
LB_10727:
	mov r8,r11
	bt r12,5
	jc LB_10724
	btr r12,2
	jmp LB_10725
LB_10724:
	bts r12,2
LB_10725:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_10730
	btr r12,5
	jmp LB_10731
LB_10730:
	bts r12,5
LB_10731:
	mov r9,r11
	bt r12,5
	jc LB_10728
	btr r12,3
	jmp LB_10729
LB_10728:
	bts r12,3
LB_10729:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10732:
	cmp r15,0
	jz LB_10733
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10732
LB_10733:
MTC_LB_10734:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10735
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °0◂1'
; 3' ⊢ °0◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_10736
	bt QWORD [rdi],0
	jc LB_10737
	btr r12,4
	jmp LB_10738
LB_10737:
	bts r12,4
LB_10738:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10736:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_10739
	btr r12,1
	jmp LB_10740
LB_10739:
	bts r12,1
LB_10740:
LB_10741:
	cmp r15,0
	jz LB_10742
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10741
LB_10742:
; _f44 %_9750 ⊢ %_9755 : %_9755
 ; {>  %_9754~1':(_lst)◂(_p9427) %_9752~2':_stg %_9750~0':_r64 }
	add r13,1
; _f9749 { %_9755 %_9754 } ⊢ { %_9756 %_9757 } : { %_9756 %_9757 }
 ; {>  %_9755~0':_r64 %_9754~1':(_lst)◂(_p9427) %_9752~2':_stg }
; _f9749 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_9749
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10743
	btr r12,2
	jmp LB_10744
LB_10743:
	bts r12,2
LB_10744:
	add rsp,16
; _f43 %_9756 ⊢ %_9758 : %_9758
 ; {>  %_9752~2':_stg %_9756~0':_r64 %_9757~1':_stg }
	sub r13,1
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,1
	add rax,7
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_10745:
	cmp rax,0
	jz LB_10746
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_10745
LB_10746:
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
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 0*"\t"
	mov rax,r13
LB_10747:
	cmp rax,0
	jz LB_10748
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_10747
LB_10748:
; "\t"
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
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
; ∎ { %_9759 %_9762 }
 ; {>  %_9761~1':_stg %_9759~0':_r64 %_9762~3':_stg %_9760~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_10749
	mov rdi,r14
	call dlt
LB_10749:
	bt r12,2
	jc LB_10750
	mov rdi,r8
	call dlt
LB_10750:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10751
	btr r12,1
	jmp LB_10752
LB_10751:
	bts r12,1
LB_10752:
	ret
MTC_LB_10735:
	mov r15,0
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10753
; _emt_mov_ptn_to_ptn:{| 10110.. |},3' ⊢ °1◂1'
; 3' ⊢ °1◂1'
	btr r12,4
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_10754
	bt QWORD [rdi],0
	jc LB_10755
	btr r12,4
	jmp LB_10756
LB_10755:
	bts r12,4
LB_10756:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10754:
	mov r10,rdi
	mov r14,r10
	bt r12,4
	jc LB_10757
	btr r12,1
	jmp LB_10758
LB_10757:
	bts r12,1
LB_10758:
LB_10759:
	cmp r15,0
	jz LB_10760
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10759
LB_10760:
; _f9390 %_9763 ⊢ %_9764 : %_9764
 ; {>  %_9752~2':_stg %_9763~1':_p9379 %_9750~0':_r64 }
; _f9390 1' ⊢ 1'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 010.. |},1' ⊢ 0'
	mov r13,r14
	bt r12,1
	jc LB_10765
	btr r12,0
	jmp LB_10766
LB_10765:
	bts r12,0
LB_10766:
	call NS_E_9390
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_10767
	btr r12,1
	jmp LB_10768
LB_10767:
	bts r12,1
LB_10768:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_10763
	btr r12,2
	jmp LB_10764
LB_10763:
	bts r12,2
LB_10764:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_10761
	btr r12,0
	jmp LB_10762
LB_10761:
	bts r12,0
LB_10762:
	add rsp,24
; » _^ ..
	xor rax,rax
	mov rsi,r13
	imul rsi,1
	add rax,rsi
	add rax,5
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,3
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0*"\t"
	mov rax,r13
LB_10769:
	cmp rax,0
	jz LB_10770
	mov rsi,0x_09
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
	sub rax,1
	jmp LB_10769
LB_10770:
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
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; " = "
	mov rsi,0x_20
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_3d
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	add rdi,3
; 2'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; "\n"
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+0],sil
	add rdi,1
; ∎ { %_9765 %_9768 }
 ; {>  %_9767~1':_stg %_9766~2':_stg %_9768~3':_stg %_9765~0':_r64 }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_10771
	mov rdi,r14
	call dlt
LB_10771:
	bt r12,2
	jc LB_10772
	mov rdi,r8
	call dlt
LB_10772:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10773
	btr r12,1
	jmp LB_10774
LB_10773:
	bts r12,1
LB_10774:
	ret
MTC_LB_10753:
MTC_LB_10720:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10775
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂2'
; 1' ⊢ °1◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10776
	bt QWORD [rdi],0
	jc LB_10777
	btr r12,3
	jmp LB_10778
LB_10777:
	bts r12,3
LB_10778:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10776:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_10779
	btr r12,2
	jmp LB_10780
LB_10779:
	bts r12,2
LB_10780:
LB_10781:
	cmp r15,0
	jz LB_10782
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10781
LB_10782:
; _f9807 { %_9750 %_9769 } ⊢ { %_9770 %_9771 } : { %_9770 %_9771 }
 ; {>  %_9769~2':(_lst)◂({ _stg _p9431 }) %_9750~0':_r64 }
; _f9807 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10783
	btr r12,1
	jmp LB_10784
LB_10783:
	bts r12,1
LB_10784:
	call NS_E_9807
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,8
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; "\194\167\194\167+s8\n"
	mov rsi,0x_0a_38_73_2b_a7_c2_a7_c2
	mov QWORD [rdi+8*0],rsi
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9770 %_9773 }
 ; {>  %_9772~1':_stg %_9773~2':_stg %_9770~0':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_10785
	mov rdi,r14
	call dlt
LB_10785:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10786
	btr r12,1
	jmp LB_10787
LB_10786:
	bts r12,1
LB_10787:
	ret
MTC_LB_10775:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz MTC_LB_10788
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °2◂{ 2' 3' }
; 1' ⊢ °2◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,2
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10789
	bt QWORD [rdi],0
	jc LB_10790
	btr r12,4
	jmp LB_10791
LB_10790:
	bts r12,4
LB_10791:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10789:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_10794
	btr r12,5
	jmp LB_10795
LB_10794:
	bts r12,5
LB_10795:
	mov r8,r11
	bt r12,5
	jc LB_10792
	btr r12,2
	jmp LB_10793
LB_10792:
	bts r12,2
LB_10793:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_10798
	btr r12,5
	jmp LB_10799
LB_10798:
	bts r12,5
LB_10799:
	mov r9,r11
	bt r12,5
	jc LB_10796
	btr r12,3
	jmp LB_10797
LB_10796:
	bts r12,3
LB_10797:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10800:
	cmp r15,0
	jz LB_10801
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10800
LB_10801:
; _f9882 { %_9750 %_9775 } ⊢ { %_9776 %_9777 } : { %_9776 %_9777 }
 ; {>  %_9774~2':_stg %_9775~3':_p9429 %_9750~0':_r64 }
; _f9882 { 0' 3' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10804
	btr r12,1
	jmp LB_10805
LB_10804:
	bts r12,1
LB_10805:
	call NS_E_9882
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_10802
	btr r12,2
	jmp LB_10803
LB_10802:
	bts r12,2
LB_10803:
	add rsp,16
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
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
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9776 %_9780 }
 ; {>  %_9776~0':_r64 %_9780~3':_stg %_9779~1':_stg %_9778~2':_stg }
; 	∎ { 0' 3' }
	bt r12,1
	jc LB_10806
	mov rdi,r14
	call dlt
LB_10806:
	bt r12,2
	jc LB_10807
	mov rdi,r8
	call dlt
LB_10807:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10808
	btr r12,1
	jmp LB_10809
LB_10808:
	bts r12,1
LB_10809:
	ret
MTC_LB_10788:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz MTC_LB_10810
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °3◂2'
; 1' ⊢ °3◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,3
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10811
	bt QWORD [rdi],0
	jc LB_10812
	btr r12,3
	jmp LB_10813
LB_10812:
	bts r12,3
LB_10813:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10811:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_10814
	btr r12,2
	jmp LB_10815
LB_10814:
	bts r12,2
LB_10815:
LB_10816:
	cmp r15,0
	jz LB_10817
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10816
LB_10817:
; _f9900 { %_9750 %_9781 } ⊢ { %_9782 %_9783 } : { %_9782 %_9783 }
 ; {>  %_9781~2':(_lst)◂({ _stg _p9443 _p9446 }) %_9750~0':_r64 }
; _f9900 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10818
	btr r12,1
	jmp LB_10819
LB_10818:
	bts r12,1
LB_10819:
	call NS_E_9900
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; » _^ ..
	xor rax,rax
	add rax,4
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r8,rax
	btr r12,2
	mov rdi,rax
	add rdi,8
; "\194\167 \n"
	mov rsi,0x_c2
	mov BYTE [rdi+8*0+0],sil
	mov rsi,0x_a7
	mov BYTE [rdi+8*0+1],sil
	mov rsi,0x_20
	mov BYTE [rdi+8*0+2],sil
	mov rsi,0x_0a
	mov BYTE [rdi+8*0+3],sil
	add rdi,4
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9782 %_9785 }
 ; {>  %_9784~1':_stg %_9782~0':_r64 %_9785~2':_stg }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_10820
	mov rdi,r14
	call dlt
LB_10820:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10821
	btr r12,1
	jmp LB_10822
LB_10821:
	bts r12,1
LB_10822:
	ret
MTC_LB_10810:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz MTC_LB_10823
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °4◂{ 2' 3' }
; 1' ⊢ °4◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,4
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10824
	bt QWORD [rdi],0
	jc LB_10825
	btr r12,4
	jmp LB_10826
LB_10825:
	bts r12,4
LB_10826:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10824:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_10829
	btr r12,5
	jmp LB_10830
LB_10829:
	bts r12,5
LB_10830:
	mov r8,r11
	bt r12,5
	jc LB_10827
	btr r12,2
	jmp LB_10828
LB_10827:
	bts r12,2
LB_10828:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_10833
	btr r12,5
	jmp LB_10834
LB_10833:
	bts r12,5
LB_10834:
	mov r9,r11
	bt r12,5
	jc LB_10831
	btr r12,3
	jmp LB_10832
LB_10831:
	bts r12,3
LB_10832:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10835:
	cmp r15,0
	jz LB_10836
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10835
LB_10836:
; » _^ ..
	xor rax,rax
	add rax,3
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,1
	add rax,3
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
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
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
; ∎ { %_9750 %_9789 }
 ; {>  %_9789~1':_stg %_9787~3':_p9430 %_9788~2':_stg %_9750~0':_r64 }
; 	∎ { 0' 1' }
	bt r12,3
	jc LB_10837
	mov rdi,r9
	call dlt
LB_10837:
	bt r12,2
	jc LB_10838
	mov rdi,r8
	call dlt
LB_10838:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10823:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz MTC_LB_10839
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °5◂2'
; 1' ⊢ °5◂2'
	btr r12,3
	mov rax,r14
	shr rax,56
	cmp rax,5
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10840
	bt QWORD [rdi],0
	jc LB_10841
	btr r12,3
	jmp LB_10842
LB_10841:
	bts r12,3
LB_10842:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10840:
	mov r9,rdi
	mov r8,r9
	bt r12,3
	jc LB_10843
	btr r12,2
	jmp LB_10844
LB_10843:
	bts r12,2
LB_10844:
LB_10845:
	cmp r15,0
	jz LB_10846
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10845
LB_10846:
; » _^ ..
	xor rax,rax
	add rax,7
	add rax,1
	add rax,3
	mov rdi,rax
	call mlc_s8
	mov r14,rax
	btr r12,1
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
; ∎ { %_9750 %_9791 }
 ; {>  %_9790~2':(_lst)◂({ _stg _p9430 }) %_9750~0':_r64 %_9791~1':_stg }
; 	∎ { 0' 1' }
	bt r12,2
	jc LB_10847
	mov rdi,r8
	call dlt
LB_10847:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10839:
NS_E_9749:
; 	|» { 0' 1' }
NS_E_RDI_9749:
MTC_LB_10848:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_10849
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10850
	bt QWORD [rdi],0
	jc LB_10851
	btr r12,2
	jmp LB_10852
LB_10851:
	bts r12,2
LB_10852:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10850:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10853:
	cmp r15,0
	jz LB_10854
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10853
LB_10854:
; 	» "" _ ⊢ 1' : %_9739
	mov rdi,0
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*0],rax
	mov r14,rdi
	btr r12,1
; ∎ { %_9737 %_9739 }
 ; {>  %_9739~1':_stg %_9737~0':_r64 }
; 	∎ { 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_10849:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_10855
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_10856
	bt QWORD [rdi],0
	jc LB_10857
	btr r12,4
	jmp LB_10858
LB_10857:
	bts r12,4
LB_10858:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_10856:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_10861
	btr r12,5
	jmp LB_10862
LB_10861:
	bts r12,5
LB_10862:
	mov r8,r11
	bt r12,5
	jc LB_10859
	btr r12,2
	jmp LB_10860
LB_10859:
	bts r12,2
LB_10860:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_10865
	btr r12,5
	jmp LB_10866
LB_10865:
	bts r12,5
LB_10866:
	mov r9,r11
	bt r12,5
	jc LB_10863
	btr r12,3
	jmp LB_10864
LB_10863:
	bts r12,3
LB_10864:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_10867:
	cmp r15,0
	jz LB_10868
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_10867
LB_10868:
; _f9792 { %_9737 %_9740 } ⊢ { %_9742 %_9743 } : { %_9742 %_9743 }
 ; {>  %_9740~2':_p9427 %_9737~0':_r64 %_9741~3':(_lst)◂(_p9427) }
; _f9792 { 0' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_10871
	btr r12,1
	jmp LB_10872
LB_10871:
	bts r12,1
LB_10872:
	call NS_E_9792
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*0]
	bt QWORD rax,3
	jc LB_10869
	btr r12,3
	jmp LB_10870
LB_10869:
	bts r12,3
LB_10870:
	add rsp,16
; _f9749 { %_9742 %_9741 } ⊢ { %_9744 %_9745 } : { %_9744 %_9745 }
 ; {>  %_9743~1':_stg %_9742~0':_r64 %_9741~3':(_lst)◂(_p9427) }
; _f9749 { 0' 3' } ⊢ { 0' 2' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10875
	btr r12,1
	jmp LB_10876
LB_10875:
	bts r12,1
LB_10876:
	call NS_E_9749
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 2' }
	mov r8,r14
	bt r12,1
	jc LB_10877
	btr r12,2
	jmp LB_10878
LB_10877:
	bts r12,2
LB_10878:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_10873
	btr r12,1
	jmp LB_10874
LB_10873:
	bts r12,1
LB_10874:
	add rsp,16
; » _^ ..
	xor rax,rax
	mov rsi,r14
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rsi,r8
	mov esi,DWORD [rsi+4]
	add rax,rsi
	mov rdi,rax
	call mlc_s8
	mov r9,rax
	btr r12,3
	mov rdi,rax
	add rdi,8
; 0'
	push rcx
	mov rsi,r14
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; 1'
	push rcx
	mov rsi,r8
	mov ecx,DWORD [rsi+4]
	add rsi,8
	cld
	rep movsb
	pop rcx
; ∎ { %_9744 %_9748 }
 ; {>  %_9747~2':_stg %_9744~0':_r64 %_9746~1':_stg %_9748~3':_stg }
; 	∎ { 0' 3' }
	bt r12,2
	jc LB_10879
	mov rdi,r8
	call dlt
LB_10879:
	bt r12,1
	jc LB_10880
	mov rdi,r14
	call dlt
LB_10880:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_10881
	btr r12,1
	jmp LB_10882
LB_10881:
	bts r12,1
LB_10882:
	ret
MTC_LB_10855:
NS_E_10886:
NS_E_RDI_10886:
NS_E_10886_ETR_TBL:
NS_E_10886_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_10990
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_10990
	jmp LB_10991
LB_10990:
	jmp LB_10982
LB_10991:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10983
	btr r12,0
	jmp LB_10984
LB_10983:
	bts r12,0
LB_10984:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_10979
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_10890 : %_10890
 ; {>  }
; 	» 0xr1 _ ⊢ 0' : %_10890
	mov rdi,0x1
	mov r13,rdi
	bts r12,0
; _some %_10890 ⊢ %_10891 : %_10891
 ; {>  %_10890~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_10891
 ; {>  %_10891~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_10977
	btr r12,3
	jmp LB_10978
LB_10977:
	bts r12,3
LB_10978:
	mov r8,0
	bts r12,2
	ret
LB_10979:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10981
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10980
LB_10981:
	add rsp,8
	ret
LB_10982:
	add rsp,16
	pop r14
LB_10980:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_8701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11006
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10998
LB_11006:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_10886_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11011
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11012
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11012:
	jmp LB_10998
LB_11011:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11001
	btr r12,1
	jmp LB_11002
LB_11001:
	bts r12,1
LB_11002:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_10999
	btr r12,0
	jmp LB_11000
LB_10999:
	bts r12,0
LB_11000:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_10995
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f44 %_10893 ⊢ %_10894 : %_10894
 ; {>  %_10893~1':_r64 %_10892~0':_r64 }
	add r14,1
; _some %_10894 ⊢ %_10895 : %_10895
 ; {>  %_10894~1':_r64 %_10892~0':_r64 }
; _some 1' ⊢ °0◂1'
; ∎ %_10895
 ; {>  %_10895~°0◂1':(_opn)◂(_r64) %_10892~0':_r64 }
; 	∎ °0◂1'
	bt r12,0
	jc LB_10992
	mov rdi,r13
	call dlt
LB_10992:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂1' ⊢ 2'◂3'
	mov r9,r14
	bt r12,1
	jc LB_10993
	btr r12,3
	jmp LB_10994
LB_10993:
	bts r12,3
LB_10994:
	mov r8,0
	bts r12,2
	ret
LB_10995:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_10997
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_10996
LB_10997:
	add rsp,8
	ret
LB_10998:
	add rsp,32
	pop r14
LB_10996:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_10887:
NS_E_RDI_10887:
NS_E_10887_ETR_TBL:
NS_E_10887_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; " "
	add r14,1
	cmp r14,r10
	jg LB_11029
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,32
	jnz LB_11029
	jmp LB_11030
LB_11029:
	jmp LB_11019
LB_11030:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_10887_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11034
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11035
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11035:
	jmp LB_11019
LB_11034:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11022
	btr r12,1
	jmp LB_11023
LB_11022:
	bts r12,1
LB_11023:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11020
	btr r12,0
	jmp LB_11021
LB_11020:
	bts r12,0
LB_11021:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_11016
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_11037
	btr r12,2
	jmp LB_11038
LB_11037:
	bts r12,2
LB_11038:
	mov r13,r14
	bt r12,1
	jc LB_11039
	btr r12,0
	jmp LB_11040
LB_11039:
	bts r12,0
LB_11040:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f44 %_10896 ⊢ %_10897 : %_10897
 ; {>  %_10896~0':_r64 }
	add r13,1
; _some %_10897 ⊢ %_10898 : %_10898
 ; {>  %_10897~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_10898
 ; {>  %_10898~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11014
	btr r12,3
	jmp LB_11015
LB_11014:
	bts r12,3
LB_11015:
	mov r8,0
	bts r12,2
	ret
LB_11016:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11018
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11017
LB_11018:
	add rsp,8
	ret
LB_11019:
	add rsp,32
	pop r14
LB_11017:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\t"
	add r14,1
	cmp r14,r10
	jg LB_11056
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,9
	jnz LB_11056
	jmp LB_11057
LB_11056:
	jmp LB_11046
LB_11057:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line_spc
	push r10
	call NS_E_10887_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11061
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11062
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11062:
	jmp LB_11046
LB_11061:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11049
	btr r12,1
	jmp LB_11050
LB_11049:
	bts r12,1
LB_11050:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11047
	btr r12,0
	jmp LB_11048
LB_11047:
	bts r12,0
LB_11048:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_11043
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_11064
	btr r12,2
	jmp LB_11065
LB_11064:
	bts r12,2
LB_11065:
	mov r13,r14
	bt r12,1
	jc LB_11066
	btr r12,0
	jmp LB_11067
LB_11066:
	bts r12,0
LB_11067:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f44 %_10899 ⊢ %_10900 : %_10900
 ; {>  %_10899~0':_r64 }
	add r13,1
; _some %_10900 ⊢ %_10901 : %_10901
 ; {>  %_10900~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_10901
 ; {>  %_10901~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11041
	btr r12,3
	jmp LB_11042
LB_11041:
	bts r12,3
LB_11042:
	mov r8,0
	bts r12,2
	ret
LB_11043:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11045
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11044
LB_11045:
	add rsp,8
	ret
LB_11046:
	add rsp,32
	pop r14
LB_11044:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_11070
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; » 0xr0 |~ {  } ⊢ %_10902 : %_10902
 ; {>  }
; 	» 0xr0 _ ⊢ 0' : %_10902
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some %_10902 ⊢ %_10903 : %_10903
 ; {>  %_10902~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_10903
 ; {>  %_10903~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11068
	btr r12,3
	jmp LB_11069
LB_11068:
	bts r12,3
LB_11069:
	mov r8,0
	bts r12,2
	ret
LB_11070:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11072
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11071
LB_11072:
	add rsp,8
	ret
LB_11073:
	add rsp,0
	pop r14
LB_11071:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_10888:
NS_E_RDI_10888:
NS_E_10888_ETR_TBL:
NS_E_10888_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_10887_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11153
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11100
LB_11153:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_11161
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_11161
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_11161
	jmp LB_11162
LB_11161:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11159
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11159:
	jmp LB_11100
LB_11162:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_10887_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11117
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11118
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11118:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11119
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11119:
	jmp LB_11101
LB_11117:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_11129
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_11129
	jmp LB_11130
LB_11129:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11125
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11125:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11126
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11126:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11127
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11127:
	jmp LB_11101
LB_11130:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_10889_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11134
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11135
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11135:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11136
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11136:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11137
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11137:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11138
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11138:
	jmp LB_11101
LB_11134:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; lines
	push r10
	call NS_E_10888_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11143
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_11144
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_11144:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11145
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11145:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11146
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11146:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11147
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11147:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11148
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11148:
	jmp LB_11101
LB_11143:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_11112
	btr r12,5
	jmp LB_11113
LB_11112:
	bts r12,5
LB_11113:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_11110
	btr r12,4
	jmp LB_11111
LB_11110:
	bts r12,4
LB_11111:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11108
	btr r12,3
	jmp LB_11109
LB_11108:
	bts r12,3
LB_11109:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11106
	btr r12,2
	jmp LB_11107
LB_11106:
	bts r12,2
LB_11107:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11104
	btr r12,1
	jmp LB_11105
LB_11104:
	bts r12,1
LB_11105:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11102
	btr r12,0
	jmp LB_11103
LB_11102:
	bts r12,0
LB_11103:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_11097
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' { 3' 4' } }
	mov rcx,r8
	bt r12,2
	jc LB_11163
	btr r12,6
	jmp LB_11164
LB_11163:
	bts r12,6
LB_11164:
	mov r8,r10
	bt r12,4
	jc LB_11165
	btr r12,2
	jmp LB_11166
LB_11165:
	bts r12,2
LB_11166:
	mov rdx,r14
	bt r12,1
	jc LB_11167
	btr r12,7
	jmp LB_11168
LB_11167:
	bts r12,7
LB_11168:
	mov r14,rcx
	bt r12,6
	jc LB_11169
	btr r12,1
	jmp LB_11170
LB_11169:
	bts r12,1
LB_11170:
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_11173
	btr r12,6
	jmp LB_11174
LB_11173:
	bts r12,6
LB_11174:
	mov r9,rcx
	bt r12,6
	jc LB_11171
	btr r12,3
	jmp LB_11172
LB_11171:
	bts r12,3
LB_11172:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_11177
	btr r12,6
	jmp LB_11178
LB_11177:
	bts r12,6
LB_11178:
	mov r10,rcx
	bt r12,6
	jc LB_11175
	btr r12,4
	jmp LB_11176
LB_11175:
	bts r12,4
LB_11176:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_10909 : %_10909
 ; {>  %_10907~3':_r64 %_10904~0':_r64 %_10905~1':_r64 %_10906~2':_r64 %_10908~4':(_lst)◂(_p10883) }
; 	» 0xr3 _ ⊢ 5' : %_10909
	mov rdi,0x3
	mov r11,rdi
	bts r12,5
; _f39 { %_10909 %_10904 } ⊢ { %_10910 %_10911 } : { %_10910 %_10911 }
 ; {>  %_10907~3':_r64 %_10904~0':_r64 %_10905~1':_r64 %_10906~2':_r64 %_10909~5':_r64 %_10908~4':(_lst)◂(_p10883) }
	add r11,r13
; _f39 { %_10910 %_10905 } ⊢ { %_10912 %_10913 } : { %_10912 %_10913 }
 ; {>  %_10911~0':_r64 %_10907~3':_r64 %_10910~5':_r64 %_10905~1':_r64 %_10906~2':_r64 %_10908~4':(_lst)◂(_p10883) }
	add r11,r14
; _f39 { %_10912 %_10906 } ⊢ { %_10914 %_10915 } : { %_10914 %_10915 }
 ; {>  %_10911~0':_r64 %_10907~3':_r64 %_10912~5':_r64 %_10906~2':_r64 %_10913~1':_r64 %_10908~4':(_lst)◂(_p10883) }
	add r11,r8
; _f10884 %_10914 ⊢ %_10916 : %_10916
 ; {>  %_10914~5':_r64 %_10911~0':_r64 %_10907~3':_r64 %_10915~2':_r64 %_10913~1':_r64 %_10908~4':(_lst)◂(_p10883) }
; _f10884 5' ⊢ °0◂5'
; _cns { %_10916 %_10908 } ⊢ %_10917 : %_10917
 ; {>  %_10911~0':_r64 %_10907~3':_r64 %_10916~°0◂5':_p10883 %_10915~2':_r64 %_10913~1':_r64 %_10908~4':(_lst)◂(_p10883) }
; _cns { °0◂5' 4' } ⊢ °0◂{ °0◂5' 4' }
; _some { %_10907 %_10917 } ⊢ %_10918 : %_10918
 ; {>  %_10911~0':_r64 %_10907~3':_r64 %_10917~°0◂{ °0◂5' 4' }:(_lst)◂(_p10883) %_10915~2':_r64 %_10913~1':_r64 }
; _some { 3' °0◂{ °0◂5' 4' } } ⊢ °0◂{ 3' °0◂{ °0◂5' 4' } }
; ∎ %_10918
 ; {>  %_10911~0':_r64 %_10918~°0◂{ 3' °0◂{ °0◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p10883) }) %_10915~2':_r64 %_10913~1':_r64 }
; 	∎ °0◂{ 3' °0◂{ °0◂5' 4' } }
	bt r12,0
	jc LB_11074
	mov rdi,r13
	call dlt
LB_11074:
	bt r12,2
	jc LB_11075
	mov rdi,r8
	call dlt
LB_11075:
	bt r12,1
	jc LB_11076
	mov rdi,r14
	call dlt
LB_11076:
; _emt_mov_ptn_to_ptn:{| 0001110.. |},°0◂{ 3' °0◂{ °0◂5' 4' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_11077
	btr r12,0
	jmp LB_11078
LB_11077:
	bts r12,0
LB_11078:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_11081
	btr r12,1
	jmp LB_11082
LB_11081:
	bts r12,1
LB_11082:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_11079
	btr QWORD [rdi],0
	jmp LB_11080
LB_11079:
	bts QWORD [rdi],0
LB_11080:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r13,r11
	bt r12,5
	jc LB_11091
	btr r12,0
	jmp LB_11092
LB_11091:
	bts r12,0
LB_11092:
	mov rsi,1
	bt r12,0
	jc LB_11089
	mov rsi,0
	bt r13,0
	jc LB_11089
	jmp LB_11090
LB_11089:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_11090:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_11087
	btr QWORD [rdi],0
	jmp LB_11088
LB_11087:
	bts QWORD [rdi],0
LB_11088:
	mov r13,r10
	bt r12,4
	jc LB_11095
	btr r12,0
	jmp LB_11096
LB_11095:
	bts r12,0
LB_11096:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_11093
	btr QWORD [rdi],1
	jmp LB_11094
LB_11093:
	bts QWORD [rdi],1
LB_11094:
	mov rsi,1
	bt r12,1
	jc LB_11085
	mov rsi,0
	bt r14,0
	jc LB_11085
	jmp LB_11086
LB_11085:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11086:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_11083
	btr QWORD [rdi],1
	jmp LB_11084
LB_11083:
	bts QWORD [rdi],1
LB_11084:
	mov r8,0
	bts r12,2
	ret
LB_11097:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11099
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11098
LB_11099:
	add rsp,8
	ret
LB_11101:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_11100:
	add rsp,96
	pop r14
LB_11098:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_10887_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11232
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11204
LB_11232:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "##"
	add r14,2
	cmp r14,r10
	jg LB_11240
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,35
	jnz LB_11240
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,35
	jnz LB_11240
	jmp LB_11241
LB_11240:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11238
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11238:
	jmp LB_11204
LB_11241:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line
	push r10
	call NS_E_10886_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11217
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11218
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11218:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11219
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11219:
	jmp LB_11205
LB_11217:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lines
	push r10
	call NS_E_10888_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11224
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11225
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11225:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11226
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11226:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11227
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11227:
	jmp LB_11205
LB_11224:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11212
	btr r12,3
	jmp LB_11213
LB_11212:
	bts r12,3
LB_11213:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11210
	btr r12,2
	jmp LB_11211
LB_11210:
	bts r12,2
LB_11211:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11208
	btr r12,1
	jmp LB_11209
LB_11208:
	bts r12,1
LB_11209:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11206
	btr r12,0
	jmp LB_11207
LB_11206:
	bts r12,0
LB_11207:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_11201
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' { 2' 3' } }
	mov r10,r14
	bt r12,1
	jc LB_11242
	btr r12,4
	jmp LB_11243
LB_11242:
	bts r12,4
LB_11243:
	mov r14,r8
	bt r12,2
	jc LB_11244
	btr r12,1
	jmp LB_11245
LB_11244:
	bts r12,1
LB_11245:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r9
	bt r12,3
	jc LB_11246
	btr r12,4
	jmp LB_11247
LB_11246:
	bts r12,4
LB_11247:
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_11250
	btr r12,5
	jmp LB_11251
LB_11250:
	bts r12,5
LB_11251:
	mov r8,r11
	bt r12,5
	jc LB_11248
	btr r12,2
	jmp LB_11249
LB_11248:
	bts r12,2
LB_11249:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_11254
	btr r12,5
	jmp LB_11255
LB_11254:
	bts r12,5
LB_11255:
	mov r9,r11
	bt r12,5
	jc LB_11252
	btr r12,3
	jmp LB_11253
LB_11252:
	bts r12,3
LB_11253:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr2 |~ {  } ⊢ %_10923 : %_10923
 ; {>  %_10920~1':_r64 %_10919~0':_r64 %_10921~2':_r64 %_10922~3':(_lst)◂(_p10883) }
; 	» 0xr2 _ ⊢ 4' : %_10923
	mov rdi,0x2
	mov r10,rdi
	bts r12,4
; _f39 { %_10923 %_10919 } ⊢ { %_10924 %_10925 } : { %_10924 %_10925 }
 ; {>  %_10920~1':_r64 %_10923~4':_r64 %_10919~0':_r64 %_10921~2':_r64 %_10922~3':(_lst)◂(_p10883) }
	add r10,r13
; _f39 { %_10924 %_10920 } ⊢ { %_10926 %_10927 } : { %_10926 %_10927 }
 ; {>  %_10920~1':_r64 %_10925~0':_r64 %_10921~2':_r64 %_10922~3':(_lst)◂(_p10883) %_10924~4':_r64 }
	add r10,r14
; _f10884 %_10926 ⊢ %_10928 : %_10928
 ; {>  %_10927~1':_r64 %_10925~0':_r64 %_10921~2':_r64 %_10922~3':(_lst)◂(_p10883) %_10926~4':_r64 }
; _f10884 4' ⊢ °0◂4'
; _cns { %_10928 %_10922 } ⊢ %_10929 : %_10929
 ; {>  %_10927~1':_r64 %_10925~0':_r64 %_10921~2':_r64 %_10928~°0◂4':_p10883 %_10922~3':(_lst)◂(_p10883) }
; _cns { °0◂4' 3' } ⊢ °0◂{ °0◂4' 3' }
; _some { %_10921 %_10929 } ⊢ %_10930 : %_10930
 ; {>  %_10927~1':_r64 %_10925~0':_r64 %_10929~°0◂{ °0◂4' 3' }:(_lst)◂(_p10883) %_10921~2':_r64 }
; _some { 2' °0◂{ °0◂4' 3' } } ⊢ °0◂{ 2' °0◂{ °0◂4' 3' } }
; ∎ %_10930
 ; {>  %_10927~1':_r64 %_10925~0':_r64 %_10930~°0◂{ 2' °0◂{ °0◂4' 3' } }:(_opn)◂({ _r64 (_lst)◂(_p10883) }) }
; 	∎ °0◂{ 2' °0◂{ °0◂4' 3' } }
	bt r12,1
	jc LB_11179
	mov rdi,r14
	call dlt
LB_11179:
	bt r12,0
	jc LB_11180
	mov rdi,r13
	call dlt
LB_11180:
; _emt_mov_ptn_to_ptn:{| 001110.. |},°0◂{ 2' °0◂{ °0◂4' 3' } } ⊢ 2'◂3'
	mov r13,r9
	bt r12,3
	jc LB_11181
	btr r12,0
	jmp LB_11182
LB_11181:
	bts r12,0
LB_11182:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r8
	bt r12,2
	jc LB_11185
	btr r12,1
	jmp LB_11186
LB_11185:
	bts r12,1
LB_11186:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_11183
	btr QWORD [rdi],0
	jmp LB_11184
LB_11183:
	bts QWORD [rdi],0
LB_11184:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov r8,r10
	bt r12,4
	jc LB_11195
	btr r12,2
	jmp LB_11196
LB_11195:
	bts r12,2
LB_11196:
	mov rsi,1
	bt r12,2
	jc LB_11193
	mov rsi,0
	bt r8,0
	jc LB_11193
	jmp LB_11194
LB_11193:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_11194:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r14
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_11191
	btr QWORD [rdi],0
	jmp LB_11192
LB_11191:
	bts QWORD [rdi],0
LB_11192:
	mov r8,r13
	bt r12,0
	jc LB_11199
	btr r12,2
	jmp LB_11200
LB_11199:
	bts r12,2
LB_11200:
	mov rdi,r14
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_11197
	btr QWORD [rdi],1
	jmp LB_11198
LB_11197:
	bts QWORD [rdi],1
LB_11198:
	mov rsi,1
	bt r12,1
	jc LB_11189
	mov rsi,0
	bt r14,0
	jc LB_11189
	jmp LB_11190
LB_11189:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11190:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_11187
	btr QWORD [rdi],1
	jmp LB_11188
LB_11187:
	bts QWORD [rdi],1
LB_11188:
	mov r8,0
	bts r12,2
	ret
LB_11201:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11203
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11202
LB_11203:
	add rsp,8
	ret
LB_11205:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_11204:
	add rsp,64
	pop r14
LB_11202:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_10886_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11327
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11319
LB_11327:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lines
	push r10
	call NS_E_10888_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11332
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11333
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11333:
	jmp LB_11319
LB_11332:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11322
	btr r12,1
	jmp LB_11323
LB_11322:
	bts r12,1
LB_11323:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11320
	btr r12,0
	jmp LB_11321
LB_11320:
	bts r12,0
LB_11321:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_11316
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' { 1' 2' } }
	mov r9,r14
	bt r12,1
	jc LB_11335
	btr r12,3
	jmp LB_11336
LB_11335:
	bts r12,3
LB_11336:
; 3' ⊢ { 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_11339
	btr r12,4
	jmp LB_11340
LB_11339:
	bts r12,4
LB_11340:
	mov r14,r10
	bt r12,4
	jc LB_11337
	btr r12,1
	jmp LB_11338
LB_11337:
	bts r12,1
LB_11338:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_11343
	btr r12,4
	jmp LB_11344
LB_11343:
	bts r12,4
LB_11344:
	mov r8,r10
	bt r12,4
	jc LB_11341
	btr r12,2
	jmp LB_11342
LB_11341:
	bts r12,2
LB_11342:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f39 { %_10932 %_10931 } ⊢ { %_10934 %_10935 } : { %_10934 %_10935 }
 ; {>  %_10931~0':_r64 %_10933~2':(_lst)◂(_p10883) %_10932~1':_r64 }
	add r14,r13
MTC_LB_11256:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11257
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_11258
	bt QWORD [rdi],0
	jc LB_11259
	btr r12,5
	jmp LB_11260
LB_11259:
	bts r12,5
LB_11260:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11258:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_11263
	btr r12,6
	jmp LB_11264
LB_11263:
	bts r12,6
LB_11264:
	mov r9,rcx
	bt r12,6
	jc LB_11261
	btr r12,3
	jmp LB_11262
LB_11261:
	bts r12,3
LB_11262:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_11267
	btr r12,6
	jmp LB_11268
LB_11267:
	bts r12,6
LB_11268:
	mov r10,rcx
	bt r12,6
	jc LB_11265
	btr r12,4
	jmp LB_11266
LB_11265:
	bts r12,4
LB_11266:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11257
; _emt_mov_ptn_to_ptn:{| 111110.. |},3' ⊢ °1◂5'
; 3' ⊢ °1◂5'
	btr r12,6
	mov rax,r9
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r9
	bt QWORD [rdi],17
	jnc LB_11269
	bt QWORD [rdi],0
	jc LB_11270
	btr r12,6
	jmp LB_11271
LB_11270:
	bts r12,6
LB_11271:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11269:
	mov rcx,rdi
	mov r11,rcx
	bt r12,6
	jc LB_11272
	btr r12,5
	jmp LB_11273
LB_11272:
	bts r12,5
LB_11273:
LB_11274:
	cmp r15,0
	jz LB_11275
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11274
LB_11275:
; _f39 { %_10938 %_10935 } ⊢ { %_10939 %_10940 } : { %_10939 %_10940 }
 ; {>  %_10934~1':_r64 %_10938~5':_r64 %_10935~0':_r64 %_10937~4':(_lst)◂(_p10883) }
	add r11,r13
; _f10885 %_10939 ⊢ %_10941 : %_10941
 ; {>  %_10934~1':_r64 %_10940~0':_r64 %_10939~5':_r64 %_10937~4':(_lst)◂(_p10883) }
; _f10885 5' ⊢ °1◂5'
; _cns { %_10941 %_10937 } ⊢ %_10942 : %_10942
 ; {>  %_10934~1':_r64 %_10940~0':_r64 %_10941~°1◂5':_p10883 %_10937~4':(_lst)◂(_p10883) }
; _cns { °1◂5' 4' } ⊢ °0◂{ °1◂5' 4' }
; _some { %_10934 %_10942 } ⊢ %_10943 : %_10943
 ; {>  %_10934~1':_r64 %_10940~0':_r64 %_10942~°0◂{ °1◂5' 4' }:(_lst)◂(_p10883) }
; _some { 1' °0◂{ °1◂5' 4' } } ⊢ °0◂{ 1' °0◂{ °1◂5' 4' } }
; ∎ %_10943
 ; {>  %_10940~0':_r64 %_10943~°0◂{ 1' °0◂{ °1◂5' 4' } }:(_opn)◂({ _r64 (_lst)◂(_p10883) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂5' 4' } }
	bt r12,0
	jc LB_11276
	mov rdi,r13
	call dlt
LB_11276:
; _emt_mov_ptn_to_ptn:{| 0100110.. |},°0◂{ 1' °0◂{ °1◂5' 4' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r13,r14
	bt r12,1
	jc LB_11279
	btr r12,0
	jmp LB_11280
LB_11279:
	bts r12,0
LB_11280:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_11277
	btr QWORD [rdi],0
	jmp LB_11278
LB_11277:
	bts QWORD [rdi],0
LB_11278:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r11
	bt r12,5
	jc LB_11289
	btr r12,1
	jmp LB_11290
LB_11289:
	bts r12,1
LB_11290:
	mov rsi,1
	bt r12,1
	jc LB_11287
	mov rsi,0
	bt r14,0
	jc LB_11287
	jmp LB_11288
LB_11287:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11288:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_11285
	btr QWORD [rdi],0
	jmp LB_11286
LB_11285:
	bts QWORD [rdi],0
LB_11286:
	mov r14,r10
	bt r12,4
	jc LB_11293
	btr r12,1
	jmp LB_11294
LB_11293:
	bts r12,1
LB_11294:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_11291
	btr QWORD [rdi],1
	jmp LB_11292
LB_11291:
	bts QWORD [rdi],1
LB_11292:
	mov rsi,1
	bt r12,0
	jc LB_11283
	mov rsi,0
	bt r13,0
	jc LB_11283
	jmp LB_11284
LB_11283:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_11284:
	mov rax,0x0000_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_11281
	btr QWORD [rdi],1
	jmp LB_11282
LB_11281:
	bts QWORD [rdi],1
LB_11282:
	mov r8,0
	bts r12,2
	ret
MTC_LB_11257:
	mov r15,0
LB_11296:
	cmp r15,0
	jz LB_11297
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11296
LB_11297:
; _f10885 %_10935 ⊢ %_10944 : %_10944
 ; {>  %_10934~1':_r64 %_10933~2':(_lst)◂(_p10883) %_10935~0':_r64 }
; _f10885 0' ⊢ °1◂0'
; _cns { %_10944 %_10933 } ⊢ %_10945 : %_10945
 ; {>  %_10934~1':_r64 %_10944~°1◂0':_p10883 %_10933~2':(_lst)◂(_p10883) }
; _cns { °1◂0' 2' } ⊢ °0◂{ °1◂0' 2' }
; _some { %_10934 %_10945 } ⊢ %_10946 : %_10946
 ; {>  %_10934~1':_r64 %_10945~°0◂{ °1◂0' 2' }:(_lst)◂(_p10883) }
; _some { 1' °0◂{ °1◂0' 2' } } ⊢ °0◂{ 1' °0◂{ °1◂0' 2' } }
; ∎ %_10946
 ; {>  %_10946~°0◂{ 1' °0◂{ °1◂0' 2' } }:(_opn)◂({ _r64 (_lst)◂(_p10883) }) }
; 	∎ °0◂{ 1' °0◂{ °1◂0' 2' } }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 1' °0◂{ °1◂0' 2' } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r14
	bt r12,1
	jc LB_11300
	btr r12,4
	jmp LB_11301
LB_11300:
	bts r12,4
LB_11301:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_11298
	btr QWORD [rdi],0
	jmp LB_11299
LB_11298:
	bts QWORD [rdi],0
LB_11299:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r14,r13
	bt r12,0
	jc LB_11310
	btr r12,1
	jmp LB_11311
LB_11310:
	bts r12,1
LB_11311:
	mov rsi,1
	bt r12,1
	jc LB_11308
	mov rsi,0
	bt r14,0
	jc LB_11308
	jmp LB_11309
LB_11308:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11309:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_11306
	btr QWORD [rdi],0
	jmp LB_11307
LB_11306:
	bts QWORD [rdi],0
LB_11307:
	mov r14,r8
	bt r12,2
	jc LB_11314
	btr r12,1
	jmp LB_11315
LB_11314:
	bts r12,1
LB_11315:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_11312
	btr QWORD [rdi],1
	jmp LB_11313
LB_11312:
	bts QWORD [rdi],1
LB_11313:
	mov rsi,1
	bt r12,4
	jc LB_11304
	mov rsi,0
	bt r10,0
	jc LB_11304
	jmp LB_11305
LB_11304:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_11305:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_11302
	btr QWORD [rdi],1
	jmp LB_11303
LB_11302:
	bts QWORD [rdi],1
LB_11303:
	mov r8,0
	bts r12,2
	ret
MTC_LB_11295:
LB_11316:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11318
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11317
LB_11318:
	add rsp,8
	ret
LB_11319:
	add rsp,32
	pop r14
LB_11317:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_11353
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_10947 : %_10947
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; » 0xr0 |~ {  } ⊢ %_10948 : %_10948
 ; {>  %_10947~°1◂{  }:(_lst)◂(t5593'(0)) }
; 	» 0xr0 _ ⊢ 0' : %_10948
	mov rdi,0x0
	mov r13,rdi
	bts r12,0
; _some { %_10948 %_10947 } ⊢ %_10949 : %_10949
 ; {>  %_10948~0':_r64 %_10947~°1◂{  }:(_lst)◂(t5593'(0)) }
; _some { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; ∎ %_10949
 ; {>  %_10949~°0◂{ 0' °1◂{  } }:(_opn)◂({ _r64 (_lst)◂(t5597'(0)) }) }
; 	∎ °0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_11347
	btr r12,1
	jmp LB_11348
LB_11347:
	bts r12,1
LB_11348:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_11345
	btr QWORD [rdi],0
	jmp LB_11346
LB_11345:
	bts QWORD [rdi],0
LB_11346:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_11351
	mov rsi,0
	bt r14,0
	jc LB_11351
	jmp LB_11352
LB_11351:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11352:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_11349
	btr QWORD [rdi],1
	jmp LB_11350
LB_11349:
	bts QWORD [rdi],1
LB_11350:
	mov r8,0
	bts r12,2
	ret
LB_11353:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11355
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11354
LB_11355:
	add rsp,8
	ret
LB_11356:
	add rsp,0
	pop r14
LB_11354:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_10889:
NS_E_RDI_10889:
NS_E_10889_ETR_TBL:
NS_E_10889_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; line_spc
	push r10
	call NS_E_10887_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11394
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11364
LB_11394:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\]"
	add r14,2
	cmp r14,r10
	jg LB_11402
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_11402
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,93
	jnz LB_11402
	jmp LB_11403
LB_11402:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11400
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11400:
	jmp LB_11364
LB_11403:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_10887_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11377
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11378
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11378:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11379
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11379:
	jmp LB_11365
LB_11377:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_11389
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_11389
	jmp LB_11390
LB_11389:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11385
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11385:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11386
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11386:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11387
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11387:
	jmp LB_11365
LB_11390:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11372
	btr r12,3
	jmp LB_11373
LB_11372:
	bts r12,3
LB_11373:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11370
	btr r12,2
	jmp LB_11371
LB_11370:
	bts r12,2
LB_11371:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11368
	btr r12,1
	jmp LB_11369
LB_11368:
	bts r12,1
LB_11369:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11366
	btr r12,0
	jmp LB_11367
LB_11366:
	bts r12,0
LB_11367:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_11361
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } 1' {  } }
	mov r10,r14
	bt r12,1
	jc LB_11404
	btr r12,4
	jmp LB_11405
LB_11404:
	bts r12,4
LB_11405:
	mov r14,r8
	bt r12,2
	jc LB_11406
	btr r12,1
	jmp LB_11407
LB_11406:
	bts r12,1
LB_11407:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_10952 : %_10952
 ; {>  %_10951~1':_r64 %_10950~0':_r64 }
; 	» 0xr3 _ ⊢ 2' : %_10952
	mov rdi,0x3
	mov r8,rdi
	bts r12,2
; _f39 { %_10952 %_10950 } ⊢ { %_10953 %_10954 } : { %_10953 %_10954 }
 ; {>  %_10952~2':_r64 %_10951~1':_r64 %_10950~0':_r64 }
	add r8,r13
; _f39 { %_10953 %_10951 } ⊢ { %_10955 %_10956 } : { %_10955 %_10956 }
 ; {>  %_10953~2':_r64 %_10954~0':_r64 %_10951~1':_r64 }
	add r8,r14
; _some %_10955 ⊢ %_10957 : %_10957
 ; {>  %_10954~0':_r64 %_10955~2':_r64 %_10956~1':_r64 }
; _some 2' ⊢ °0◂2'
; ∎ %_10957
 ; {>  %_10957~°0◂2':(_opn)◂(_r64) %_10954~0':_r64 %_10956~1':_r64 }
; 	∎ °0◂2'
	bt r12,0
	jc LB_11357
	mov rdi,r13
	call dlt
LB_11357:
	bt r12,1
	jc LB_11358
	mov rdi,r14
	call dlt
LB_11358:
; _emt_mov_ptn_to_ptn:{| 0010.. |},°0◂2' ⊢ 2'◂3'
	mov r9,r8
	bt r12,2
	jc LB_11359
	btr r12,3
	jmp LB_11360
LB_11359:
	bts r12,3
LB_11360:
	mov r8,0
	bts r12,2
	ret
LB_11361:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11363
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11362
LB_11363:
	add rsp,8
	ret
LB_11365:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_11364:
	add rsp,64
	pop r14
LB_11362:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; line_spc
	push r10
	call NS_E_10887_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11470
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11417
LB_11470:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\\["
	add r14,2
	cmp r14,r10
	jg LB_11478
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,92
	jnz LB_11478
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_11478
	jmp LB_11479
LB_11478:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11476
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11476:
	jmp LB_11417
LB_11479:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; line_spc
	push r10
	call NS_E_10887_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11434
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11435
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11435:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11436
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11436:
	jmp LB_11418
LB_11434:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_11446
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_11446
	jmp LB_11447
LB_11446:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11442
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11442:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11443
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11443:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11444
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11444:
	jmp LB_11418
LB_11447:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; cmt_lines
	push r10
	call NS_E_10889_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11451
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11452
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11452:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11453
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11453:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11454
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11454:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11455
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11455:
	jmp LB_11418
LB_11451:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; cmt_lines
	push r10
	call NS_E_10889_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11460
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_11461
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_11461:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_11462
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_11462:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_11463
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_11463:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11464
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11464:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11465
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11465:
	jmp LB_11418
LB_11460:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_11429
	btr r12,5
	jmp LB_11430
LB_11429:
	bts r12,5
LB_11430:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_11427
	btr r12,4
	jmp LB_11428
LB_11427:
	bts r12,4
LB_11428:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_11425
	btr r12,3
	jmp LB_11426
LB_11425:
	bts r12,3
LB_11426:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11423
	btr r12,2
	jmp LB_11424
LB_11423:
	bts r12,2
LB_11424:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11421
	btr r12,1
	jmp LB_11422
LB_11421:
	bts r12,1
LB_11422:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11419
	btr r12,0
	jmp LB_11420
LB_11419:
	bts r12,0
LB_11420:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_11414
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { 0' {  } 1' {  } 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_11480
	btr r12,6
	jmp LB_11481
LB_11480:
	bts r12,6
LB_11481:
	mov r9,r11
	bt r12,5
	jc LB_11482
	btr r12,3
	jmp LB_11483
LB_11482:
	bts r12,3
LB_11483:
	mov r11,r8
	bt r12,2
	jc LB_11484
	btr r12,5
	jmp LB_11485
LB_11484:
	bts r12,5
LB_11485:
	mov r8,r10
	bt r12,4
	jc LB_11486
	btr r12,2
	jmp LB_11487
LB_11486:
	bts r12,2
LB_11487:
	mov r10,r14
	bt r12,1
	jc LB_11488
	btr r12,4
	jmp LB_11489
LB_11488:
	bts r12,4
LB_11489:
	mov r14,r11
	bt r12,5
	jc LB_11490
	btr r12,1
	jmp LB_11491
LB_11490:
	bts r12,1
LB_11491:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr3 |~ {  } ⊢ %_10962 : %_10962
 ; {>  %_10959~1':_r64 %_10960~2':_r64 %_10961~3':_r64 %_10958~0':_r64 }
; 	» 0xr3 _ ⊢ 4' : %_10962
	mov rdi,0x3
	mov r10,rdi
	bts r12,4
; _f39 { %_10962 %_10958 } ⊢ { %_10963 %_10964 } : { %_10963 %_10964 }
 ; {>  %_10962~4':_r64 %_10959~1':_r64 %_10960~2':_r64 %_10961~3':_r64 %_10958~0':_r64 }
	add r10,r13
; _f39 { %_10963 %_10959 } ⊢ { %_10965 %_10966 } : { %_10965 %_10966 }
 ; {>  %_10959~1':_r64 %_10963~4':_r64 %_10964~0':_r64 %_10960~2':_r64 %_10961~3':_r64 }
	add r10,r14
; _f39 { %_10965 %_10960 } ⊢ { %_10967 %_10968 } : { %_10967 %_10968 }
 ; {>  %_10965~4':_r64 %_10964~0':_r64 %_10960~2':_r64 %_10966~1':_r64 %_10961~3':_r64 }
	add r10,r8
; _f39 { %_10967 %_10961 } ⊢ { %_10969 %_10970 } : { %_10969 %_10970 }
 ; {>  %_10968~2':_r64 %_10964~0':_r64 %_10966~1':_r64 %_10961~3':_r64 %_10967~4':_r64 }
	add r10,r9
; _some %_10969 ⊢ %_10971 : %_10971
 ; {>  %_10968~2':_r64 %_10964~0':_r64 %_10969~4':_r64 %_10966~1':_r64 %_10970~3':_r64 }
; _some 4' ⊢ °0◂4'
; ∎ %_10971
 ; {>  %_10971~°0◂4':(_opn)◂(_r64) %_10968~2':_r64 %_10964~0':_r64 %_10966~1':_r64 %_10970~3':_r64 }
; 	∎ °0◂4'
	bt r12,2
	jc LB_11408
	mov rdi,r8
	call dlt
LB_11408:
	bt r12,0
	jc LB_11409
	mov rdi,r13
	call dlt
LB_11409:
	bt r12,1
	jc LB_11410
	mov rdi,r14
	call dlt
LB_11410:
	bt r12,3
	jc LB_11411
	mov rdi,r9
	call dlt
LB_11411:
; _emt_mov_ptn_to_ptn:{| 000010.. |},°0◂4' ⊢ 2'◂3'
	mov r9,r10
	bt r12,4
	jc LB_11412
	btr r12,3
	jmp LB_11413
LB_11412:
	bts r12,3
LB_11413:
	mov r8,0
	bts r12,2
	ret
LB_11414:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11416
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11415
LB_11416:
	add rsp,8
	ret
LB_11418:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_11417:
	add rsp,96
	pop r14
LB_11415:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; line
	push r10
	call NS_E_10886_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11506
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11498
LB_11506:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cmt_lines
	push r10
	call NS_E_10889_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11511
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11512
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11512:
	jmp LB_11498
LB_11511:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11501
	btr r12,1
	jmp LB_11502
LB_11501:
	bts r12,1
LB_11502:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11499
	btr r12,0
	jmp LB_11500
LB_11499:
	bts r12,0
LB_11500:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_11495
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f39 { %_10972 %_10973 } ⊢ { %_10974 %_10975 } : { %_10974 %_10975 }
 ; {>  %_10973~1':_r64 %_10972~0':_r64 }
	add r13,r14
; _some %_10974 ⊢ %_10976 : %_10976
 ; {>  %_10975~1':_r64 %_10974~0':_r64 }
; _some 0' ⊢ °0◂0'
; ∎ %_10976
 ; {>  %_10975~1':_r64 %_10976~°0◂0':(_opn)◂(_r64) }
; 	∎ °0◂0'
	bt r12,1
	jc LB_11492
	mov rdi,r14
	call dlt
LB_11492:
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11493
	btr r12,3
	jmp LB_11494
LB_11493:
	bts r12,3
LB_11494:
	mov r8,0
	bts r12,2
	ret
LB_11495:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11497
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11496
LB_11497:
	add rsp,8
	ret
LB_11498:
	add rsp,32
	pop r14
LB_11496:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_11536:
; 	|» { 0' 1' 2' 3' 4' }
NS_E_RDI_11536:
MTC_LB_11537:
	mov r15,0
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11538
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_11539
	bt QWORD [rdi],0
	jc LB_11540
	btr r12,7
	jmp LB_11541
LB_11540:
	bts r12,7
LB_11541:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11539:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_11544
	btr r12,8
	jmp LB_11545
LB_11544:
	bts r12,8
LB_11545:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11542
	btr r12,5
	jmp LB_11543
LB_11542:
	bts r12,5
LB_11543:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_11548
	btr r12,8
	jmp LB_11549
LB_11548:
	bts r12,8
LB_11549:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_11546
	btr r12,6
	jmp LB_11547
LB_11546:
	bts r12,6
LB_11547:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11550:
	cmp r15,0
	jz LB_11551
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11550
LB_11551:
MTC_LB_11552:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11553
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °1◂4'
; 5' ⊢ °1◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_11554
	bt QWORD [rdi],0
	jc LB_11555
	btr r12,7
	jmp LB_11556
LB_11555:
	bts r12,7
LB_11556:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11554:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_11557
	btr r12,4
	jmp LB_11558
LB_11557:
	bts r12,4
LB_11558:
LB_11559:
	cmp r15,0
	jz LB_11560
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11559
LB_11560:
; _f41 %_11521 ⊢ { %_11522 %_11523 } : { %_11522 %_11523 }
 ; {>  %_11515~1':_r64 %_11521~4':_r64 %_11516~2':_stg %_11514~0':_stg %_11520~6':(_lst)◂(_p10883) %_11517~3':_r64 }
	mov r11,r10
	bts r12,5
; _f23 { %_11523 %_11514 %_11515 %_11516 %_11517 } ⊢ { %_11524 %_11525 %_11526 %_11527 %_11528 } : { %_11524 %_11525 %_11526 %_11527 %_11528 }
 ; {>  %_11515~1':_r64 %_11523~5':_r64 %_11516~2':_stg %_11522~4':_r64 %_11514~0':_stg %_11520~6':(_lst)◂(_p10883) %_11517~3':_r64 }
; _f23 { 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 5' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp+8+8*1],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 1111010.. |},{ 5' 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,r9
	bt r12,3
	jc LB_11565
	btr r12,4
	jmp LB_11566
LB_11565:
	bts r12,4
LB_11566:
	mov r9,r8
	bt r12,2
	jc LB_11567
	btr r12,3
	jmp LB_11568
LB_11567:
	bts r12,3
LB_11568:
	mov r8,r14
	bt r12,1
	jc LB_11569
	btr r12,2
	jmp LB_11570
LB_11569:
	bts r12,2
LB_11570:
	mov r14,r13
	bt r12,0
	jc LB_11571
	btr r12,1
	jmp LB_11572
LB_11571:
	bts r12,1
LB_11572:
	mov r13,r11
	bt r12,5
	jc LB_11573
	btr r12,0
	jmp LB_11574
LB_11573:
	bts r12,0
LB_11574:
	call NS_E_23
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 5' }
	mov r11,r10
	bt r12,4
	jc LB_11575
	btr r12,5
	jmp LB_11576
LB_11575:
	bts r12,5
LB_11576:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*1]
	bt QWORD rax,6
	jc LB_11563
	btr r12,6
	jmp LB_11564
LB_11563:
	bts r12,6
LB_11564:
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_11561
	btr r12,4
	jmp LB_11562
LB_11561:
	bts r12,4
LB_11562:
	add rsp,24
; _f11536 { %_11525 %_11526 %_11527 %_11528 %_11520 } ⊢ { %_11529 %_11530 } : { %_11529 %_11530 }
 ; {>  %_11527~3':_stg %_11524~0':_r64 %_11526~2':_r64 %_11528~5':_r64 %_11522~4':_r64 %_11525~1':_stg %_11520~6':(_lst)◂(_p10883) }
; _f11536 { 1' 2' 3' 5' 6' } ⊢ { 1' 2' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 01110110.. |},{ 1' 2' 3' 5' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r13,r14
	bt r12,1
	jc LB_11581
	btr r12,0
	jmp LB_11582
LB_11581:
	bts r12,0
LB_11582:
	mov r14,r8
	bt r12,2
	jc LB_11583
	btr r12,1
	jmp LB_11584
LB_11583:
	bts r12,1
LB_11584:
	mov r8,r9
	bt r12,3
	jc LB_11585
	btr r12,2
	jmp LB_11586
LB_11585:
	bts r12,2
LB_11586:
	mov r9,r11
	bt r12,5
	jc LB_11587
	btr r12,3
	jmp LB_11588
LB_11587:
	bts r12,3
LB_11588:
	mov r10,rcx
	bt r12,6
	jc LB_11589
	btr r12,4
	jmp LB_11590
LB_11589:
	bts r12,4
LB_11590:
	call NS_E_11536
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 1' 2' }
	mov r8,r14
	bt r12,1
	jc LB_11591
	btr r12,2
	jmp LB_11592
LB_11591:
	bts r12,2
LB_11592:
	mov r14,r13
	bt r12,0
	jc LB_11593
	btr r12,1
	jmp LB_11594
LB_11593:
	bts r12,1
LB_11594:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*1]
	bt QWORD rax,4
	jc LB_11579
	btr r12,4
	jmp LB_11580
LB_11579:
	bts r12,4
LB_11580:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11577
	btr r12,0
	jmp LB_11578
LB_11577:
	bts r12,0
LB_11578:
	add rsp,24
; ∎ { %_11529 %_11530 }
 ; {>  %_11524~0':_r64 %_11522~4':_r64 %_11530~2':_stg %_11529~1':_stg }
; 	∎ { 1' 2' }
	bt r12,0
	jc LB_11595
	mov rdi,r13
	call dlt
LB_11595:
	bt r12,4
	jc LB_11596
	mov rdi,r10
	call dlt
LB_11596:
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ { 0' 1' }
	mov r13,r14
	bt r12,1
	jc LB_11597
	btr r12,0
	jmp LB_11598
LB_11597:
	bts r12,0
LB_11598:
	mov r14,r8
	bt r12,2
	jc LB_11599
	btr r12,1
	jmp LB_11600
LB_11599:
	bts r12,1
LB_11600:
	ret
MTC_LB_11553:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11601
; _emt_mov_ptn_to_ptn:{| 11110110.. |},5' ⊢ °0◂4'
; 5' ⊢ °0◂4'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_11602
	bt QWORD [rdi],0
	jc LB_11603
	btr r12,7
	jmp LB_11604
LB_11603:
	bts r12,7
LB_11604:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11602:
	mov rdx,rdi
	mov r10,rdx
	bt r12,7
	jc LB_11605
	btr r12,4
	jmp LB_11606
LB_11605:
	bts r12,4
LB_11606:
LB_11607:
	cmp r15,0
	jz LB_11608
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11607
LB_11608:
; _f39 { %_11515 %_11531 } ⊢ { %_11532 %_11533 } : { %_11532 %_11533 }
 ; {>  %_11515~1':_r64 %_11531~4':_r64 %_11516~2':_stg %_11514~0':_stg %_11520~6':(_lst)◂(_p10883) %_11517~3':_r64 }
	add r14,r10
; _f11536 { %_11514 %_11532 %_11516 %_11517 %_11520 } ⊢ { %_11534 %_11535 } : { %_11534 %_11535 }
 ; {>  %_11532~1':_r64 %_11516~2':_stg %_11514~0':_stg %_11520~6':(_lst)◂(_p10883) %_11533~4':_r64 %_11517~3':_r64 }
; _f11536 { 0' 1' 2' 3' 6' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 11110010.. |},{ 0' 1' 2' 3' 6' } ⊢ { 0' 1' 2' 3' 4' }
	mov r10,rcx
	bt r12,6
	jc LB_11611
	btr r12,4
	jmp LB_11612
LB_11611:
	bts r12,4
LB_11612:
	call NS_E_11536
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*0]
	bt QWORD rax,4
	jc LB_11609
	btr r12,4
	jmp LB_11610
LB_11609:
	bts r12,4
LB_11610:
	add rsp,16
; ∎ { %_11534 %_11535 }
 ; {>  %_11534~0':_stg %_11535~1':_stg %_11533~4':_r64 }
; 	∎ { 0' 1' }
	bt r12,4
	jc LB_11613
	mov rdi,r10
	call dlt
LB_11613:
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	ret
MTC_LB_11601:
MTC_LB_11538:
	mov r15,0
LB_11615:
	cmp r15,0
	jz LB_11616
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11615
LB_11616:
; ∎ { %_11514 %_11516 }
 ; {>  %_11515~1':_r64 %_11516~2':_stg %_11518~4':(_lst)◂(_p10883) %_11514~0':_stg %_11517~3':_r64 }
; 	∎ { 0' 2' }
	bt r12,1
	jc LB_11617
	mov rdi,r14
	call dlt
LB_11617:
	bt r12,4
	jc LB_11618
	mov rdi,r10
	call dlt
LB_11618:
	bt r12,3
	jc LB_11619
	mov rdi,r9
	call dlt
LB_11619:
; _emt_mov_ptn_to_ptn:{| 1010.. |},{ 0' 2' } ⊢ { 0' 1' }
	mov r14,r8
	bt r12,2
	jc LB_11620
	btr r12,1
	jmp LB_11621
LB_11620:
	bts r12,1
LB_11621:
	ret
MTC_LB_11614:
NS_E_11637:
; 	|» 0'
NS_E_RDI_11637:
; » 0xr0 |~ {  } ⊢ %_11623 : %_11623
 ; {>  %_11622~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_11623
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _f10888 { %_11622 %_11623 } ⊢ { %_11624 %_11625 %_11626 } : { %_11624 %_11625 %_11626 }
 ; {>  %_11623~1':_r64 %_11622~0':_stg }
; _f10888 { 0' 1' } ⊢ { 0' 1' 2' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_10888
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_11638
	btr r12,4
	jmp LB_11639
LB_11638:
	bts r12,4
LB_11639:
	mov r8,r9
	bt r12,3
	jc LB_11642
	btr r12,2
	jmp LB_11643
LB_11642:
	bts r12,2
LB_11643:
	mov rsi,1
	bt r12,2
	jc LB_11640
	mov rsi,0
	bt r8,0
	jc LB_11640
	jmp LB_11641
LB_11640:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_11641:
	mov rax,r10
	shl rax,56
	or rax,1
	or r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
MTC_LB_11644:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11645
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_11646
	bt QWORD [rdi],0
	jc LB_11647
	btr r12,5
	jmp LB_11648
LB_11647:
	bts r12,5
LB_11648:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11646:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_11651
	btr r12,6
	jmp LB_11652
LB_11651:
	bts r12,6
LB_11652:
	mov r9,rcx
	bt r12,6
	jc LB_11649
	btr r12,3
	jmp LB_11650
LB_11649:
	bts r12,3
LB_11650:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_11655
	btr r12,6
	jmp LB_11656
LB_11655:
	bts r12,6
LB_11656:
	mov r10,rcx
	bt r12,6
	jc LB_11653
	btr r12,4
	jmp LB_11654
LB_11653:
	bts r12,4
LB_11654:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11657:
	cmp r15,0
	jz LB_11658
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11657
LB_11658:
; _f19 %_11627 ⊢ { %_11629 %_11630 } : { %_11629 %_11630 }
 ; {>  %_11628~4':(_lst)◂(_p10883) %_11625~1':_r64 %_11627~3':_r64 %_11624~0':_stg }
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
	jc LB_11665
	btr r12,0
	jmp LB_11666
LB_11665:
	bts r12,0
LB_11666:
	call NS_E_19
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 3' }
	mov r8,r13
	bt r12,0
	jc LB_11667
	btr r12,2
	jmp LB_11668
LB_11667:
	bts r12,2
LB_11668:
	mov r9,r14
	bt r12,1
	jc LB_11669
	btr r12,3
	jmp LB_11670
LB_11669:
	bts r12,3
LB_11670:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*2]
	bt QWORD rax,4
	jc LB_11663
	btr r12,4
	jmp LB_11664
LB_11663:
	bts r12,4
LB_11664:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_11661
	btr r12,1
	jmp LB_11662
LB_11661:
	bts r12,1
LB_11662:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_11659
	btr r12,0
	jmp LB_11660
LB_11659:
	bts r12,0
LB_11660:
	add rsp,32
; » 0xr0 |~ {  } ⊢ %_11631 : %_11631
 ; {>  %_11628~4':(_lst)◂(_p10883) %_11630~3':_stg %_11629~2':_r64 %_11625~1':_r64 %_11624~0':_stg }
; 	» 0xr0 _ ⊢ 5' : %_11631
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; » 0xr0 |~ {  } ⊢ %_11632 : %_11632
 ; {>  %_11628~4':(_lst)◂(_p10883) %_11630~3':_stg %_11631~5':_r64 %_11629~2':_r64 %_11625~1':_r64 %_11624~0':_stg }
; 	» 0xr0 _ ⊢ 6' : %_11632
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f11536 { %_11624 %_11631 %_11630 %_11632 %_11628 } ⊢ { %_11633 %_11634 } : { %_11633 %_11634 }
 ; {>  %_11628~4':(_lst)◂(_p10883) %_11630~3':_stg %_11631~5':_r64 %_11629~2':_r64 %_11632~6':_r64 %_11625~1':_r64 %_11624~0':_stg }
; _f11536 { 0' 5' 3' 6' 4' } ⊢ { 0' 3' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp+8+8*1],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10011110.. |},{ 0' 5' 3' 6' 4' } ⊢ { 0' 1' 2' 3' 4' }
	mov r14,r11
	bt r12,5
	jc LB_11675
	btr r12,1
	jmp LB_11676
LB_11675:
	bts r12,1
LB_11676:
	mov r8,r9
	bt r12,3
	jc LB_11677
	btr r12,2
	jmp LB_11678
LB_11677:
	bts r12,2
LB_11678:
	mov r9,rcx
	bt r12,6
	jc LB_11679
	btr r12,3
	jmp LB_11680
LB_11679:
	bts r12,3
LB_11680:
	call NS_E_11536
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 3' }
	mov r9,r14
	bt r12,1
	jc LB_11681
	btr r12,3
	jmp LB_11682
LB_11681:
	bts r12,3
LB_11682:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*1]
	bt QWORD rax,2
	jc LB_11673
	btr r12,2
	jmp LB_11674
LB_11673:
	bts r12,2
LB_11674:
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_11671
	btr r12,1
	jmp LB_11672
LB_11671:
	bts r12,1
LB_11672:
	add rsp,24
; _some %_11634 ⊢ %_11635 : %_11635
 ; {>  %_11629~2':_r64 %_11625~1':_r64 %_11633~0':_stg %_11634~3':_stg }
; _some 3' ⊢ °0◂3'
; ∎ { %_11633 %_11635 }
 ; {>  %_11629~2':_r64 %_11635~°0◂3':(_opn)◂(_stg) %_11625~1':_r64 %_11633~0':_stg }
; 	∎ { 0' °0◂3' }
	bt r12,2
	jc LB_11683
	mov rdi,r8
	call dlt
LB_11683:
	bt r12,1
	jc LB_11684
	mov rdi,r14
	call dlt
LB_11684:
; _emt_mov_ptn_to_ptn:{| 10010.. |},{ 0' °0◂3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11687
	btr r12,1
	jmp LB_11688
LB_11687:
	bts r12,1
LB_11688:
	mov rsi,1
	bt r12,1
	jc LB_11685
	mov rsi,0
	bt r14,0
	jc LB_11685
	jmp LB_11686
LB_11685:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11686:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	ret
MTC_LB_11645:
	mov r15,0
LB_11690:
	cmp r15,0
	jz LB_11691
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11690
LB_11691:
; _none {  } ⊢ %_11636 : %_11636
 ; {>  %_11625~1':_r64 %_11626~2':(_opn)◂({ _r64 (_lst)◂(_p10883) }) %_11624~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ { %_11624 %_11636 }
 ; {>  %_11636~°1◂{  }:(_opn)◂(t5784'(0)) %_11625~1':_r64 %_11626~2':(_opn)◂({ _r64 (_lst)◂(_p10883) }) %_11624~0':_stg }
; 	∎ { 0' °1◂{  } }
	bt r12,1
	jc LB_11692
	mov rdi,r14
	call dlt
LB_11692:
	bt r12,2
	jc LB_11693
	mov rdi,r8
	call dlt
LB_11693:
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' °1◂{  } } ⊢ { 0' 1' }
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_11694
	mov rsi,0
	bt r14,0
	jc LB_11694
	jmp LB_11695
LB_11694:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_11695:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	ret
MTC_LB_11689:
NS_E_11699:
NS_E_RDI_11699:
; » _^ ..
	xor rax,rax
	add rax,10
	add rax,7
	add rax,4
	add rax,6
	add rax,4
	add rax,6
	add rax,4
	add rax,3
	add rax,7
	add rax,19
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
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
; _f11637 %_11696 ⊢ { %_11697 %_11698 } : { %_11697 %_11698 }
 ; {>  %_11696~0':_stg }
; _f11637 0' ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_11637
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ {  }
 ; {>  %_11698~1':(_opn)◂(_stg) %_11697~0':_stg }
; 	∎ {  }
	bt r12,1
	jc LB_11700
	mov rdi,r14
	call dlt
LB_11700:
	bt r12,0
	jc LB_11701
	mov rdi,r13
	call dlt
LB_11701:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
NS_E_11702:
NS_E_RDI_11702:
NS_E_11702_ETR_TBL:
NS_E_11702_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; prm_word
	jmp LB_11731
LB_11730:
	add r14,1
LB_11731:
	cmp r14,r10
	jge LB_11732
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11730
	cmp al,10
	jz LB_11730
	cmp al,32
	jz LB_11730
LB_11732:
	push r10
	call NS_E_9321_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11733
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11723
LB_11733:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "."
	jmp LB_11736
LB_11735:
	add r14,1
LB_11736:
	cmp r14,r10
	jge LB_11737
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11735
	cmp al,10
	jz LB_11735
	cmp al,32
	jz LB_11735
LB_11737:
	add r14,1
	cmp r14,r10
	jg LB_11741
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_11741
	jmp LB_11742
LB_11741:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11739
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11739:
	jmp LB_11723
LB_11742:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_11744
LB_11743:
	add r14,1
LB_11744:
	cmp r14,r10
	jge LB_11745
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11743
	cmp al,10
	jz LB_11743
	cmp al,32
	jz LB_11743
LB_11745:
	push r10
	call NS_E_11702_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11746
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11747
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11747:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11748
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11748:
	jmp LB_11723
LB_11746:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11728
	btr r12,2
	jmp LB_11729
LB_11728:
	bts r12,2
LB_11729:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11726
	btr r12,1
	jmp LB_11727
LB_11726:
	bts r12,1
LB_11727:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11724
	btr r12,0
	jmp LB_11725
LB_11724:
	bts r12,0
LB_11725:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_11720
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_11750
	btr r12,3
	jmp LB_11751
LB_11750:
	bts r12,3
LB_11751:
	mov r14,r8
	bt r12,2
	jc LB_11752
	btr r12,1
	jmp LB_11753
LB_11752:
	bts r12,1
LB_11753:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f9380 { %_11703 %_11704 } ⊢ %_11705 : %_11705
 ; {>  %_11704~1':_p9379 %_11703~0':_stg }
; _f9380 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_11705 ⊢ %_11706 : %_11706
 ; {>  %_11705~°0◂{ 0' 1' }:_p9379 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_11706
 ; {>  %_11706~°0◂°0◂{ 0' 1' }:(_opn)◂(_p9379) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_11714
	btr r12,2
	jmp LB_11715
LB_11714:
	bts r12,2
LB_11715:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_11712
	btr QWORD [rdi],0
	jmp LB_11713
LB_11712:
	bts QWORD [rdi],0
LB_11713:
	mov r8,r14
	bt r12,1
	jc LB_11718
	btr r12,2
	jmp LB_11719
LB_11718:
	bts r12,2
LB_11719:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_11716
	btr QWORD [rdi],1
	jmp LB_11717
LB_11716:
	bts QWORD [rdi],1
LB_11717:
	mov rsi,1
	bt r12,3
	jc LB_11710
	mov rsi,0
	bt r9,0
	jc LB_11710
	jmp LB_11711
LB_11710:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11711:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11720:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11722
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11721
LB_11722:
	add rsp,8
	ret
LB_11723:
	add rsp,48
	pop r14
LB_11721:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_11765
LB_11764:
	add r14,1
LB_11765:
	cmp r14,r10
	jge LB_11766
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11764
	cmp al,32
	jz LB_11764
LB_11766:
	push r10
	call NS_E_9321_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11767
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11761
LB_11767:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11762
	btr r12,0
	jmp LB_11763
LB_11762:
	bts r12,0
LB_11763:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_11758
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9381 %_11707 ⊢ %_11708 : %_11708
 ; {>  %_11707~0':_stg }
; _f9381 0' ⊢ °1◂0'
; _some %_11708 ⊢ %_11709 : %_11709
 ; {>  %_11708~°1◂0':_p9379 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_11709
 ; {>  %_11709~°0◂°1◂0':(_opn)◂(_p9379) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11756
	btr r12,3
	jmp LB_11757
LB_11756:
	bts r12,3
LB_11757:
	mov rsi,1
	bt r12,3
	jc LB_11754
	mov rsi,0
	bt r9,0
	jc LB_11754
	jmp LB_11755
LB_11754:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11755:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11758:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11760
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11759
LB_11760:
	add rsp,8
	ret
LB_11761:
	add rsp,16
	pop r14
LB_11759:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_11769:
NS_E_RDI_11769:
NS_E_11769_ETR_TBL:
NS_E_11769_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_8703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11794
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11786
LB_11794:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "r"
	add r14,1
	cmp r14,r10
	jg LB_11802
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,114
	jnz LB_11802
	jmp LB_11803
LB_11802:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11800
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11800:
	jmp LB_11786
LB_11803:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11789
	btr r12,1
	jmp LB_11790
LB_11789:
	bts r12,1
LB_11790:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11787
	btr r12,0
	jmp LB_11788
LB_11787:
	bts r12,0
LB_11788:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_11783
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f9500 %_11770 ⊢ %_11771 : %_11771
 ; {>  %_11770~0':_r64 }
; _f9500 0' ⊢ °0◂0'
; _some %_11771 ⊢ %_11772 : %_11772
 ; {>  %_11771~°0◂0':_p9445 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_11772
 ; {>  %_11772~°0◂°0◂0':(_opn)◂(_p9445) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11781
	btr r12,3
	jmp LB_11782
LB_11781:
	bts r12,3
LB_11782:
	mov rsi,1
	bt r12,3
	jc LB_11779
	mov rsi,0
	bt r9,0
	jc LB_11779
	jmp LB_11780
LB_11779:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11780:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11783:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11785
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11784
LB_11785:
	add rsp,8
	ret
LB_11786:
	add rsp,32
	pop r14
LB_11784:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	push r10
	call NS_E_8824_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11817
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11811
LB_11817:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11812
	btr r12,0
	jmp LB_11813
LB_11812:
	bts r12,0
LB_11813:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_11808
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9501 %_11773 ⊢ %_11774 : %_11774
 ; {>  %_11773~0':_stg }
; _f9501 0' ⊢ °1◂0'
; _some %_11774 ⊢ %_11775 : %_11775
 ; {>  %_11774~°1◂0':_p9445 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_11775
 ; {>  %_11775~°0◂°1◂0':(_opn)◂(_p9445) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11806
	btr r12,3
	jmp LB_11807
LB_11806:
	bts r12,3
LB_11807:
	mov rsi,1
	bt r12,3
	jc LB_11804
	mov rsi,0
	bt r9,0
	jc LB_11804
	jmp LB_11805
LB_11804:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11805:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11808:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11810
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11809
LB_11810:
	add rsp,8
	ret
LB_11811:
	add rsp,16
	pop r14
LB_11809:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	push r10
	call NS_E_11702_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11832
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11826
LB_11832:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11827
	btr r12,0
	jmp LB_11828
LB_11827:
	bts r12,0
LB_11828:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_11823
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9502 %_11776 ⊢ %_11777 : %_11777
 ; {>  %_11776~0':_p9379 }
; _f9502 0' ⊢ °2◂0'
; _some %_11777 ⊢ %_11778 : %_11778
 ; {>  %_11777~°2◂0':_p9445 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_11778
 ; {>  %_11778~°0◂°2◂0':(_opn)◂(_p9445) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11821
	btr r12,3
	jmp LB_11822
LB_11821:
	bts r12,3
LB_11822:
	mov rsi,1
	bt r12,3
	jc LB_11819
	mov rsi,0
	bt r9,0
	jc LB_11819
	jmp LB_11820
LB_11819:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11820:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11823:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11825
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11824
LB_11825:
	add rsp,8
	ret
LB_11826:
	add rsp,16
	pop r14
LB_11824:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_11835:
NS_E_RDI_11835:
NS_E_11835_ETR_TBL:
NS_E_11835_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\n"
	jmp LB_11842
LB_11841:
	add r14,1
LB_11842:
	cmp r14,r10
	jge LB_11843
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11841
	cmp al,32
	jz LB_11841
LB_11843:
	add r14,1
	cmp r14,r10
	jg LB_11846
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_11846
	jmp LB_11847
LB_11846:
	jmp LB_11837
LB_11847:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ "\n" ⟧
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov rsi,0x01_00_0000_0000_0001
	or rdi,rsi
LB_11852:
	jmp LB_11849
LB_11848:
	add r14,1
LB_11849:
	cmp r14,r10
	jge LB_11850
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11848
	cmp al,32
	jz LB_11848
LB_11850:
	add r14,1
	cmp r14,r10
	jg LB_11851
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_11851
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov [rax+8*1],rsi
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_11852
LB_11851:
	sub r14,1
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11838
	btr QWORD [rdi],1
LB_11838:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11839
	btr QWORD [rdi],0
LB_11839:
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
LB_11837:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_11862:
; 	|» { 0' 1' }
NS_E_RDI_11862:
MTC_LB_11863:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz MTC_LB_11864
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °0◂{ 2' 3' }
; 1' ⊢ °0◂{ 2' 3' }
	btr r12,4
	mov rax,r14
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11865
	bt QWORD [rdi],0
	jc LB_11866
	btr r12,4
	jmp LB_11867
LB_11866:
	bts r12,4
LB_11867:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11865:
	mov r10,rdi
; 4' ⊢ { 2' 3' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_11870
	btr r12,5
	jmp LB_11871
LB_11870:
	bts r12,5
LB_11871:
	mov r8,r11
	bt r12,5
	jc LB_11868
	btr r12,2
	jmp LB_11869
LB_11868:
	bts r12,2
LB_11869:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_11874
	btr r12,5
	jmp LB_11875
LB_11874:
	bts r12,5
LB_11875:
	mov r9,r11
	bt r12,5
	jc LB_11872
	btr r12,3
	jmp LB_11873
LB_11872:
	bts r12,3
LB_11873:
	mov rdi,r10
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11876:
	cmp r15,0
	jz LB_11877
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11876
LB_11877:
; _f9497 { %_11856 %_11858 } ⊢ %_11860 : %_11860
 ; {>  %_11859~3':(_lst)◂(_p9444) %_11856~0':_p9444 %_11858~2':_p9444 }
; _f9497 { 0' 2' } ⊢ °2◂{ 0' 2' }
; _f11862 { %_11860 %_11859 } ⊢ %_11861 : %_11861
 ; {>  %_11860~°2◂{ 0' 2' }:_p9444 %_11859~3':(_lst)◂(_p9444) }
; _f11862 { °2◂{ 0' 2' } 3' } ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10110.. |},{ °2◂{ 0' 2' } 3' } ⊢ { 0' 1' }
	mov r14,r9
	bt r12,3
	jc LB_11878
	btr r12,1
	jmp LB_11879
LB_11878:
	bts r12,1
LB_11879:
	mov r9,r13
	bt r12,0
	jc LB_11880
	btr r12,3
	jmp LB_11881
LB_11880:
	bts r12,3
LB_11881:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r10,r9
	bt r12,3
	jc LB_11886
	btr r12,4
	jmp LB_11887
LB_11886:
	bts r12,4
LB_11887:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_11884
	btr QWORD [rdi],0
	jmp LB_11885
LB_11884:
	bts QWORD [rdi],0
LB_11885:
	mov r10,r8
	bt r12,2
	jc LB_11890
	btr r12,4
	jmp LB_11891
LB_11890:
	bts r12,4
LB_11891:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_11888
	btr QWORD [rdi],1
	jmp LB_11889
LB_11888:
	bts QWORD [rdi],1
LB_11889:
	mov rsi,1
	bt r12,0
	jc LB_11882
	mov rsi,0
	bt r13,0
	jc LB_11882
	jmp LB_11883
LB_11882:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_11883:
	mov rax,0x0200_0000_0000_0001
	or r13,rax
	call NS_E_11862
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; ∎ %_11861
 ; {>  %_11861~0':_p9444 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11864:
	mov r15,0
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz MTC_LB_11892
; _emt_mov_ptn_to_ptn:{| 110.. |},1' ⊢ °1◂{  }
; 1' ⊢ °1◂{  }
	btr r12,2
	mov rax,r14
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r14
	bt QWORD [rdi],17
	jnc LB_11893
	bt QWORD [rdi],0
	jc LB_11894
	btr r12,2
	jmp LB_11895
LB_11894:
	bts r12,2
LB_11895:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_11893:
	mov r8,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_11896:
	cmp r15,0
	jz LB_11897
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_11896
LB_11897:
; ∎ %_11856
 ; {>  %_11856~0':_p9444 }
; 	∎ 0'
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	ret
MTC_LB_11892:
NS_E_11898:
NS_E_RDI_11898:
NS_E_11898_ETR_TBL:
NS_E_11898_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_11945
LB_11944:
	add r14,1
LB_11945:
	cmp r14,r10
	jge LB_11946
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11944
	cmp al,10
	jz LB_11944
	cmp al,32
	jz LB_11944
LB_11946:
	add r14,1
	cmp r14,r10
	jg LB_11949
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_11949
	jmp LB_11950
LB_11949:
	jmp LB_11937
LB_11950:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn_lst
	jmp LB_11952
LB_11951:
	add r14,1
LB_11952:
	cmp r14,r10
	jge LB_11953
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11951
	cmp al,10
	jz LB_11951
	cmp al,32
	jz LB_11951
LB_11953:
	push r10
	call NS_E_11899_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11954
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11955
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11955:
	jmp LB_11937
LB_11954:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_11958
LB_11957:
	add r14,1
LB_11958:
	cmp r14,r10
	jge LB_11959
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11957
	cmp al,10
	jz LB_11957
	cmp al,32
	jz LB_11957
LB_11959:
	add r14,1
	cmp r14,r10
	jg LB_11964
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_11964
	jmp LB_11965
LB_11964:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_11961
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_11961:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_11962
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_11962:
	jmp LB_11937
LB_11965:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_11942
	btr r12,2
	jmp LB_11943
LB_11942:
	bts r12,2
LB_11943:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_11940
	btr r12,1
	jmp LB_11941
LB_11940:
	bts r12,1
LB_11941:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11938
	btr r12,0
	jmp LB_11939
LB_11938:
	bts r12,0
LB_11939:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_11934
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_11966
	btr r12,3
	jmp LB_11967
LB_11966:
	bts r12,3
LB_11967:
	mov r13,r14
	bt r12,1
	jc LB_11968
	btr r12,0
	jmp LB_11969
LB_11968:
	bts r12,0
LB_11969:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9491 %_11902 ⊢ %_11903 : %_11903
 ; {>  %_11902~0':(_lst)◂(_p9442) }
; _f9491 0' ⊢ °0◂0'
; _some %_11903 ⊢ %_11904 : %_11904
 ; {>  %_11903~°0◂0':_p9442 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_11904
 ; {>  %_11904~°0◂°0◂0':(_opn)◂(_p9442) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11932
	btr r12,3
	jmp LB_11933
LB_11932:
	bts r12,3
LB_11933:
	mov rsi,1
	bt r12,3
	jc LB_11930
	mov rsi,0
	bt r9,0
	jc LB_11930
	jmp LB_11931
LB_11930:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11931:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11934:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11936
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11935
LB_11936:
	add rsp,8
	ret
LB_11937:
	add rsp,48
	pop r14
LB_11935:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; src
	jmp LB_11981
LB_11980:
	add r14,1
LB_11981:
	cmp r14,r10
	jge LB_11982
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_11980
	cmp al,10
	jz LB_11980
	cmp al,32
	jz LB_11980
LB_11982:
	push r10
	call NS_E_11901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_11983
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11977
LB_11983:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11978
	btr r12,0
	jmp LB_11979
LB_11978:
	bts r12,0
LB_11979:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_11974
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9492 %_11905 ⊢ %_11906 : %_11906
 ; {>  %_11905~0':_p9440 }
; _f9492 0' ⊢ °1◂0'
; _some %_11906 ⊢ %_11907 : %_11907
 ; {>  %_11906~°1◂0':_p9442 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_11907
 ; {>  %_11907~°0◂°1◂0':(_opn)◂(_p9442) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_11972
	btr r12,3
	jmp LB_11973
LB_11972:
	bts r12,3
LB_11973:
	mov rsi,1
	bt r12,3
	jc LB_11970
	mov rsi,0
	bt r9,0
	jc LB_11970
	jmp LB_11971
LB_11970:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11971:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11974:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11976
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11975
LB_11976:
	add rsp,8
	ret
LB_11977:
	add rsp,16
	pop r14
LB_11975:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_11899:
NS_E_RDI_11899:
NS_E_11899_ETR_TBL:
NS_E_11899_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; src_ptn
	jmp LB_12004
LB_12003:
	add r14,1
LB_12004:
	cmp r14,r10
	jge LB_12005
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12003
	cmp al,10
	jz LB_12003
	cmp al,32
	jz LB_12003
LB_12005:
	push r10
	call NS_E_11898_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12006
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11998
LB_12006:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn_lst
	jmp LB_12009
LB_12008:
	add r14,1
LB_12009:
	cmp r14,r10
	jge LB_12010
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12008
	cmp al,10
	jz LB_12008
	cmp al,32
	jz LB_12008
LB_12010:
	push r10
	call NS_E_11899_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12011
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12012
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12012:
	jmp LB_11998
LB_12011:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12001
	btr r12,1
	jmp LB_12002
LB_12001:
	bts r12,1
LB_12002:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_11999
	btr r12,0
	jmp LB_12000
LB_11999:
	bts r12,0
LB_12000:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_11995
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_11908 %_11909 } ⊢ %_11910 : %_11910
 ; {>  %_11909~1':(_lst)◂(_p9442) %_11908~0':_p9442 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_11910 ⊢ %_11911 : %_11911
 ; {>  %_11910~°0◂{ 0' 1' }:(_lst)◂(_p9442) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_11911
 ; {>  %_11911~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p9442)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_11989
	btr r12,2
	jmp LB_11990
LB_11989:
	bts r12,2
LB_11990:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_11987
	btr QWORD [rdi],0
	jmp LB_11988
LB_11987:
	bts QWORD [rdi],0
LB_11988:
	mov r8,r14
	bt r12,1
	jc LB_11993
	btr r12,2
	jmp LB_11994
LB_11993:
	bts r12,2
LB_11994:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_11991
	btr QWORD [rdi],1
	jmp LB_11992
LB_11991:
	bts QWORD [rdi],1
LB_11992:
	mov rsi,1
	bt r12,3
	jc LB_11985
	mov rsi,0
	bt r9,0
	jc LB_11985
	jmp LB_11986
LB_11985:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_11986:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_11995:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_11997
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_11996
LB_11997:
	add rsp,8
	ret
LB_11998:
	add rsp,32
	pop r14
LB_11996:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_12016
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_11912 : %_11912
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_11912 ⊢ %_11913 : %_11913
 ; {>  %_11912~°1◂{  }:(_lst)◂(t5890'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_11913
 ; {>  %_11913~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5893'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_12014
	mov rsi,0
	bt r9,0
	jc LB_12014
	jmp LB_12015
LB_12014:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12015:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12016:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12018
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12017
LB_12018:
	add rsp,8
	ret
LB_12019:
	add rsp,0
	pop r14
LB_12017:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_11900:
NS_E_RDI_11900:
NS_E_11900_ETR_TBL:
NS_E_11900_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_12057
LB_12056:
	add r14,1
LB_12057:
	cmp r14,r10
	jge LB_12058
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12056
	cmp al,10
	jz LB_12056
	cmp al,32
	jz LB_12056
LB_12058:
	add r14,1
	cmp r14,r10
	jg LB_12061
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_12061
	jmp LB_12062
LB_12061:
	jmp LB_12035
LB_12062:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src
	jmp LB_12044
LB_12043:
	add r14,1
LB_12044:
	cmp r14,r10
	jge LB_12045
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12043
	cmp al,10
	jz LB_12043
	cmp al,32
	jz LB_12043
LB_12045:
	push r10
	call NS_E_11901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12046
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12047
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12047:
	jmp LB_12036
LB_12046:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; src_tl
	jmp LB_12050
LB_12049:
	add r14,1
LB_12050:
	cmp r14,r10
	jge LB_12051
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12049
	cmp al,10
	jz LB_12049
	cmp al,32
	jz LB_12049
LB_12051:
	push r10
	call NS_E_11900_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12052
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12053
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12053:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12054
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12054:
	jmp LB_12036
LB_12052:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12041
	btr r12,2
	jmp LB_12042
LB_12041:
	bts r12,2
LB_12042:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12039
	btr r12,1
	jmp LB_12040
LB_12039:
	bts r12,1
LB_12040:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12037
	btr r12,0
	jmp LB_12038
LB_12037:
	bts r12,0
LB_12038:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12032
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_12063
	btr r12,3
	jmp LB_12064
LB_12063:
	bts r12,3
LB_12064:
	mov r14,r8
	bt r12,2
	jc LB_12065
	btr r12,1
	jmp LB_12066
LB_12065:
	bts r12,1
LB_12066:
	mov r8,r13
	bt r12,0
	jc LB_12067
	btr r12,2
	jmp LB_12068
LB_12067:
	bts r12,2
LB_12068:
	mov r13,r9
	bt r12,3
	jc LB_12069
	btr r12,0
	jmp LB_12070
LB_12069:
	bts r12,0
LB_12070:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9492 %_11914 ⊢ %_11916 : %_11916
 ; {>  %_11914~0':_p9440 %_11915~1':(_lst)◂(_p9442) }
; _f9492 0' ⊢ °1◂0'
; _cns { %_11916 %_11915 } ⊢ %_11917 : %_11917
 ; {>  %_11916~°1◂0':_p9442 %_11915~1':(_lst)◂(_p9442) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_11917 ⊢ %_11918 : %_11918
 ; {>  %_11917~°0◂{ °1◂0' 1' }:(_lst)◂(_p9442) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_11918
 ; {>  %_11918~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p9442)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_12026
	btr r12,2
	jmp LB_12027
LB_12026:
	bts r12,2
LB_12027:
	mov rsi,1
	bt r12,2
	jc LB_12024
	mov rsi,0
	bt r8,0
	jc LB_12024
	jmp LB_12025
LB_12024:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_12025:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_12022
	btr QWORD [rdi],0
	jmp LB_12023
LB_12022:
	bts QWORD [rdi],0
LB_12023:
	mov r8,r14
	bt r12,1
	jc LB_12030
	btr r12,2
	jmp LB_12031
LB_12030:
	bts r12,2
LB_12031:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_12028
	btr QWORD [rdi],1
	jmp LB_12029
LB_12028:
	bts QWORD [rdi],1
LB_12029:
	mov rsi,1
	bt r12,3
	jc LB_12020
	mov rsi,0
	bt r9,0
	jc LB_12020
	jmp LB_12021
LB_12020:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12021:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12032:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12034
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12033
LB_12034:
	add rsp,8
	ret
LB_12036:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_12035:
	add rsp,48
	pop r14
LB_12033:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_12073
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_11919 : %_11919
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_11919 ⊢ %_11920 : %_11920
 ; {>  %_11919~°1◂{  }:(_lst)◂(t5904'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_11920
 ; {>  %_11920~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5907'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_12071
	mov rsi,0
	bt r9,0
	jc LB_12071
	jmp LB_12072
LB_12071:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12072:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12073:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12075
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12074
LB_12075:
	add rsp,8
	ret
LB_12076:
	add rsp,0
	pop r14
LB_12074:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_11901:
NS_E_RDI_11901:
NS_E_11901_ETR_TBL:
NS_E_11901_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "%["
	jmp LB_12092
LB_12091:
	add r14,1
LB_12092:
	cmp r14,r10
	jge LB_12093
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12091
	cmp al,10
	jz LB_12091
	cmp al,32
	jz LB_12091
LB_12093:
	add r14,2
	cmp r14,r10
	jg LB_12096
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,37
	jnz LB_12096
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,91
	jnz LB_12096
	jmp LB_12097
LB_12096:
	jmp LB_12084
LB_12097:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_12099
LB_12098:
	add r14,1
LB_12099:
	cmp r14,r10
	jge LB_12100
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12098
	cmp al,10
	jz LB_12098
	cmp al,32
	jz LB_12098
LB_12100:
	push r10
	call NS_E_11769_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12101
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12102
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12102:
	jmp LB_12084
LB_12101:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "]"
	jmp LB_12105
LB_12104:
	add r14,1
LB_12105:
	cmp r14,r10
	jge LB_12106
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12104
	cmp al,10
	jz LB_12104
	cmp al,32
	jz LB_12104
LB_12106:
	add r14,1
	cmp r14,r10
	jg LB_12111
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,93
	jnz LB_12111
	jmp LB_12112
LB_12111:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12108
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12108:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12109
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12109:
	jmp LB_12084
LB_12112:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12089
	btr r12,2
	jmp LB_12090
LB_12089:
	bts r12,2
LB_12090:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12087
	btr r12,1
	jmp LB_12088
LB_12087:
	bts r12,1
LB_12088:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12085
	btr r12,0
	jmp LB_12086
LB_12085:
	bts r12,0
LB_12086:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12081
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_12113
	btr r12,3
	jmp LB_12114
LB_12113:
	bts r12,3
LB_12114:
	mov r13,r14
	bt r12,1
	jc LB_12115
	btr r12,0
	jmp LB_12116
LB_12115:
	bts r12,0
LB_12116:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9487 %_11921 ⊢ %_11922 : %_11922
 ; {>  %_11921~0':_p9445 }
; _f9487 0' ⊢ °0◂0'
; _some %_11922 ⊢ %_11923 : %_11923
 ; {>  %_11922~°0◂0':_p9440 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_11923
 ; {>  %_11923~°0◂°0◂0':(_opn)◂(_p9440) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12079
	btr r12,3
	jmp LB_12080
LB_12079:
	bts r12,3
LB_12080:
	mov rsi,1
	bt r12,3
	jc LB_12077
	mov rsi,0
	bt r9,0
	jc LB_12077
	jmp LB_12078
LB_12077:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12078:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12081:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12083
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12082
LB_12083:
	add rsp,8
	ret
LB_12084:
	add rsp,48
	pop r14
LB_12082:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_12141
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_12141
	jmp LB_12142
LB_12141:
	jmp LB_12124
LB_12142:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; prm_word
	push r10
	call NS_E_9321_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12133
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12134
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12134:
	jmp LB_12125
LB_12133:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12128
	btr r12,1
	jmp LB_12129
LB_12128:
	bts r12,1
LB_12129:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12126
	btr r12,0
	jmp LB_12127
LB_12126:
	bts r12,0
LB_12127:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12121
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_12143
	btr r12,2
	jmp LB_12144
LB_12143:
	bts r12,2
LB_12144:
	mov r13,r14
	bt r12,1
	jc LB_12145
	btr r12,0
	jmp LB_12146
LB_12145:
	bts r12,0
LB_12146:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9488 %_11924 ⊢ %_11925 : %_11925
 ; {>  %_11924~0':_stg }
; _f9488 0' ⊢ °1◂0'
; _some %_11925 ⊢ %_11926 : %_11926
 ; {>  %_11925~°1◂0':_p9440 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_11926
 ; {>  %_11926~°0◂°1◂0':(_opn)◂(_p9440) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12119
	btr r12,3
	jmp LB_12120
LB_12119:
	bts r12,3
LB_12120:
	mov rsi,1
	bt r12,3
	jc LB_12117
	mov rsi,0
	bt r9,0
	jc LB_12117
	jmp LB_12118
LB_12117:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12118:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12121:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12123
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12122
LB_12123:
	add rsp,8
	ret
LB_12125:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_12124:
	add rsp,32
	pop r14
LB_12122:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; prm_word
	jmp LB_12158
LB_12157:
	add r14,1
LB_12158:
	cmp r14,r10
	jge LB_12159
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12157
	cmp al,10
	jz LB_12157
	cmp al,32
	jz LB_12157
LB_12159:
	push r10
	call NS_E_9321_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12160
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12154
LB_12160:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12155
	btr r12,0
	jmp LB_12156
LB_12155:
	bts r12,0
LB_12156:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12151
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9488 %_11927 ⊢ %_11928 : %_11928
 ; {>  %_11927~0':_stg }
; _f9488 0' ⊢ °1◂0'
; _some %_11928 ⊢ %_11929 : %_11929
 ; {>  %_11928~°1◂0':_p9440 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_11929
 ; {>  %_11929~°0◂°1◂0':(_opn)◂(_p9440) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12149
	btr r12,3
	jmp LB_12150
LB_12149:
	bts r12,3
LB_12150:
	mov rsi,1
	bt r12,3
	jc LB_12147
	mov rsi,0
	bt r9,0
	jc LB_12147
	jmp LB_12148
LB_12147:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12148:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12151:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12153
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12152
LB_12153:
	add rsp,8
	ret
LB_12154:
	add rsp,16
	pop r14
LB_12152:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12162:
NS_E_RDI_12162:
NS_E_12162_ETR_TBL:
NS_E_12162_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_12212
LB_12211:
	add r14,1
LB_12212:
	cmp r14,r10
	jge LB_12213
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12211
	cmp al,10
	jz LB_12211
	cmp al,32
	jz LB_12211
LB_12213:
	add r14,1
	cmp r14,r10
	jg LB_12216
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_12216
	jmp LB_12217
LB_12216:
	jmp LB_12204
LB_12217:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn_lst
	jmp LB_12219
LB_12218:
	add r14,1
LB_12219:
	cmp r14,r10
	jge LB_12220
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12218
	cmp al,10
	jz LB_12218
	cmp al,32
	jz LB_12218
LB_12220:
	push r10
	call NS_E_12163_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12221
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12222
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12222:
	jmp LB_12204
LB_12221:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "}"
	jmp LB_12225
LB_12224:
	add r14,1
LB_12225:
	cmp r14,r10
	jge LB_12226
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12224
	cmp al,10
	jz LB_12224
	cmp al,32
	jz LB_12224
LB_12226:
	add r14,1
	cmp r14,r10
	jg LB_12231
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_12231
	jmp LB_12232
LB_12231:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12228
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12228:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12229
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12229:
	jmp LB_12204
LB_12232:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12209
	btr r12,2
	jmp LB_12210
LB_12209:
	bts r12,2
LB_12210:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12207
	btr r12,1
	jmp LB_12208
LB_12207:
	bts r12,1
LB_12208:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12205
	btr r12,0
	jmp LB_12206
LB_12205:
	bts r12,0
LB_12206:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12201
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_12233
	btr r12,3
	jmp LB_12234
LB_12233:
	bts r12,3
LB_12234:
	mov r13,r14
	bt r12,1
	jc LB_12235
	btr r12,0
	jmp LB_12236
LB_12235:
	bts r12,0
LB_12236:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9493 %_12168 ⊢ %_12169 : %_12169
 ; {>  %_12168~0':(_lst)◂(_p9443) }
; _f9493 0' ⊢ °0◂0'
; _some %_12169 ⊢ %_12170 : %_12170
 ; {>  %_12169~°0◂0':_p9443 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_12170
 ; {>  %_12170~°0◂°0◂0':(_opn)◂(_p9443) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12199
	btr r12,3
	jmp LB_12200
LB_12199:
	bts r12,3
LB_12200:
	mov rsi,1
	bt r12,3
	jc LB_12197
	mov rsi,0
	bt r9,0
	jc LB_12197
	jmp LB_12198
LB_12197:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12198:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12201:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12203
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12202
LB_12203:
	add rsp,8
	ret
LB_12204:
	add rsp,48
	pop r14
LB_12202:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dst
	jmp LB_12248
LB_12247:
	add r14,1
LB_12248:
	cmp r14,r10
	jge LB_12249
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12247
	cmp al,10
	jz LB_12247
	cmp al,32
	jz LB_12247
LB_12249:
	push r10
	call NS_E_12167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12250
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12244
LB_12250:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12245
	btr r12,0
	jmp LB_12246
LB_12245:
	bts r12,0
LB_12246:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12241
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9494 %_12171 ⊢ %_12172 : %_12172
 ; {>  %_12171~0':_p9441 }
; _f9494 0' ⊢ °1◂0'
; _some %_12172 ⊢ %_12173 : %_12173
 ; {>  %_12172~°1◂0':_p9443 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12173
 ; {>  %_12173~°0◂°1◂0':(_opn)◂(_p9443) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12239
	btr r12,3
	jmp LB_12240
LB_12239:
	bts r12,3
LB_12240:
	mov rsi,1
	bt r12,3
	jc LB_12237
	mov rsi,0
	bt r9,0
	jc LB_12237
	jmp LB_12238
LB_12237:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12238:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12241:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12243
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12242
LB_12243:
	add rsp,8
	ret
LB_12244:
	add rsp,16
	pop r14
LB_12242:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12163:
NS_E_RDI_12163:
NS_E_12163_ETR_TBL:
NS_E_12163_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_12271
LB_12270:
	add r14,1
LB_12271:
	cmp r14,r10
	jge LB_12272
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12270
	cmp al,10
	jz LB_12270
	cmp al,32
	jz LB_12270
LB_12272:
	push r10
	call NS_E_12162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12273
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12265
LB_12273:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dst_ptn_lst
	jmp LB_12276
LB_12275:
	add r14,1
LB_12276:
	cmp r14,r10
	jge LB_12277
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12275
	cmp al,10
	jz LB_12275
	cmp al,32
	jz LB_12275
LB_12277:
	push r10
	call NS_E_12163_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12278
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12279
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12279:
	jmp LB_12265
LB_12278:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12268
	btr r12,1
	jmp LB_12269
LB_12268:
	bts r12,1
LB_12269:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12266
	btr r12,0
	jmp LB_12267
LB_12266:
	bts r12,0
LB_12267:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12262
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_12174 %_12175 } ⊢ %_12176 : %_12176
 ; {>  %_12175~1':(_lst)◂(_p9443) %_12174~0':_p9443 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_12176 ⊢ %_12177 : %_12177
 ; {>  %_12176~°0◂{ 0' 1' }:(_lst)◂(_p9443) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_12177
 ; {>  %_12177~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p9443)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_12256
	btr r12,2
	jmp LB_12257
LB_12256:
	bts r12,2
LB_12257:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_12254
	btr QWORD [rdi],0
	jmp LB_12255
LB_12254:
	bts QWORD [rdi],0
LB_12255:
	mov r8,r14
	bt r12,1
	jc LB_12260
	btr r12,2
	jmp LB_12261
LB_12260:
	bts r12,2
LB_12261:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_12258
	btr QWORD [rdi],1
	jmp LB_12259
LB_12258:
	bts QWORD [rdi],1
LB_12259:
	mov rsi,1
	bt r12,3
	jc LB_12252
	mov rsi,0
	bt r9,0
	jc LB_12252
	jmp LB_12253
LB_12252:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12253:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12262:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12264
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12263
LB_12264:
	add rsp,8
	ret
LB_12265:
	add rsp,32
	pop r14
LB_12263:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_12283
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_12178 : %_12178
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_12178 ⊢ %_12179 : %_12179
 ; {>  %_12178~°1◂{  }:(_lst)◂(t5992'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12179
 ; {>  %_12179~°0◂°1◂{  }:(_opn)◂((_lst)◂(t5995'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_12281
	mov rsi,0
	bt r9,0
	jc LB_12281
	jmp LB_12282
LB_12281:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12282:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12283:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12285
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12284
LB_12285:
	add rsp,8
	ret
LB_12286:
	add rsp,0
	pop r14
LB_12284:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12165:
NS_E_RDI_12165:
NS_E_12165_ETR_TBL:
NS_E_12165_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_12309
LB_12308:
	add r14,1
LB_12309:
	cmp r14,r10
	jge LB_12310
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12308
	cmp al,10
	jz LB_12308
	cmp al,32
	jz LB_12308
LB_12310:
	add r14,1
	cmp r14,r10
	jg LB_12313
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_12313
	jmp LB_12314
LB_12313:
	jmp LB_12287
LB_12314:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_12296
LB_12295:
	add r14,1
LB_12296:
	cmp r14,r10
	jge LB_12297
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12295
	cmp al,10
	jz LB_12295
	cmp al,32
	jz LB_12295
LB_12297:
	push r10
	call NS_E_12162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12298
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12299
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12299:
	jmp LB_12288
LB_12298:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_ptn_tl
	jmp LB_12302
LB_12301:
	add r14,1
LB_12302:
	cmp r14,r10
	jge LB_12303
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12301
	cmp al,10
	jz LB_12301
	cmp al,32
	jz LB_12301
LB_12303:
	push r10
	call NS_E_12165_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12304
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12305
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12305:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12306
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12306:
	jmp LB_12288
LB_12304:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0003_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12291
	btr QWORD [rdi],2
LB_12291:
	mov rax,QWORD [rsp+16*2+8*1]
	mov [rdi+8*1+8*2],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12292
	btr QWORD [rdi],1
LB_12292:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12293
	btr QWORD [rdi],0
LB_12293:
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
LB_12288:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_12287:
	add rsp,48
	pop r14
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,[rdi]
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
LB_12289:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12166:
NS_E_RDI_12166:
NS_E_12166_ETR_TBL:
NS_E_12166_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ","
	jmp LB_12352
LB_12351:
	add r14,1
LB_12352:
	cmp r14,r10
	jge LB_12353
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12351
	cmp al,10
	jz LB_12351
	cmp al,32
	jz LB_12351
LB_12353:
	add r14,1
	cmp r14,r10
	jg LB_12356
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_12356
	jmp LB_12357
LB_12356:
	jmp LB_12330
LB_12357:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst
	jmp LB_12339
LB_12338:
	add r14,1
LB_12339:
	cmp r14,r10
	jge LB_12340
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12338
	cmp al,10
	jz LB_12338
	cmp al,32
	jz LB_12338
LB_12340:
	push r10
	call NS_E_12167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12341
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12342
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12342:
	jmp LB_12331
LB_12341:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; dst_tl
	jmp LB_12345
LB_12344:
	add r14,1
LB_12345:
	cmp r14,r10
	jge LB_12346
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12344
	cmp al,10
	jz LB_12344
	cmp al,32
	jz LB_12344
LB_12346:
	push r10
	call NS_E_12166_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12347
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12348
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12348:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12349
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12349:
	jmp LB_12331
LB_12347:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12336
	btr r12,2
	jmp LB_12337
LB_12336:
	bts r12,2
LB_12337:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12334
	btr r12,1
	jmp LB_12335
LB_12334:
	bts r12,1
LB_12335:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12332
	btr r12,0
	jmp LB_12333
LB_12332:
	bts r12,0
LB_12333:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12327
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_12358
	btr r12,3
	jmp LB_12359
LB_12358:
	bts r12,3
LB_12359:
	mov r14,r8
	bt r12,2
	jc LB_12360
	btr r12,1
	jmp LB_12361
LB_12360:
	bts r12,1
LB_12361:
	mov r8,r13
	bt r12,0
	jc LB_12362
	btr r12,2
	jmp LB_12363
LB_12362:
	bts r12,2
LB_12363:
	mov r13,r9
	bt r12,3
	jc LB_12364
	btr r12,0
	jmp LB_12365
LB_12364:
	bts r12,0
LB_12365:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9494 %_12182 ⊢ %_12184 : %_12184
 ; {>  %_12183~1':(_lst)◂(_p9443) %_12182~0':_p9441 }
; _f9494 0' ⊢ °1◂0'
; _cns { %_12184 %_12183 } ⊢ %_12185 : %_12185
 ; {>  %_12183~1':(_lst)◂(_p9443) %_12184~°1◂0':_p9443 }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _some %_12185 ⊢ %_12186 : %_12186
 ; {>  %_12185~°0◂{ °1◂0' 1' }:(_lst)◂(_p9443) }
; _some °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; ∎ %_12186
 ; {>  %_12186~°0◂°0◂{ °1◂0' 1' }:(_opn)◂((_lst)◂(_p9443)) }
; 	∎ °0◂°0◂{ °1◂0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ °1◂0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_12321
	btr r12,2
	jmp LB_12322
LB_12321:
	bts r12,2
LB_12322:
	mov rsi,1
	bt r12,2
	jc LB_12319
	mov rsi,0
	bt r8,0
	jc LB_12319
	jmp LB_12320
LB_12319:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_12320:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_12317
	btr QWORD [rdi],0
	jmp LB_12318
LB_12317:
	bts QWORD [rdi],0
LB_12318:
	mov r8,r14
	bt r12,1
	jc LB_12325
	btr r12,2
	jmp LB_12326
LB_12325:
	bts r12,2
LB_12326:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_12323
	btr QWORD [rdi],1
	jmp LB_12324
LB_12323:
	bts QWORD [rdi],1
LB_12324:
	mov rsi,1
	bt r12,3
	jc LB_12315
	mov rsi,0
	bt r9,0
	jc LB_12315
	jmp LB_12316
LB_12315:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12316:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12327:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12329
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12328
LB_12329:
	add rsp,8
	ret
LB_12331:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_12330:
	add rsp,48
	pop r14
LB_12328:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_12368
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_12187 : %_12187
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_12187 ⊢ %_12188 : %_12188
 ; {>  %_12187~°1◂{  }:(_lst)◂(t6006'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12188
 ; {>  %_12188~°0◂°1◂{  }:(_opn)◂((_lst)◂(t6009'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_12366
	mov rsi,0
	bt r9,0
	jc LB_12366
	jmp LB_12367
LB_12366:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12367:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12368:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12370
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12369
LB_12370:
	add rsp,8
	ret
LB_12371:
	add rsp,0
	pop r14
LB_12369:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12167:
NS_E_RDI_12167:
NS_E_12167_ETR_TBL:
NS_E_12167_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "%"
	add r14,1
	cmp r14,r10
	jg LB_12396
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,37
	jnz LB_12396
	jmp LB_12397
LB_12396:
	jmp LB_12379
LB_12397:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12388
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12389
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12389:
	jmp LB_12380
LB_12388:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12383
	btr r12,1
	jmp LB_12384
LB_12383:
	bts r12,1
LB_12384:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12381
	btr r12,0
	jmp LB_12382
LB_12381:
	bts r12,0
LB_12382:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12376
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_12398
	btr r12,2
	jmp LB_12399
LB_12398:
	bts r12,2
LB_12399:
	mov r13,r14
	bt r12,1
	jc LB_12400
	btr r12,0
	jmp LB_12401
LB_12400:
	bts r12,0
LB_12401:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9490 %_12189 ⊢ %_12190 : %_12190
 ; {>  %_12189~0':_stg }
; _f9490 0' ⊢ °1◂0'
; _some %_12190 ⊢ %_12191 : %_12191
 ; {>  %_12190~°1◂0':_p9441 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12191
 ; {>  %_12191~°0◂°1◂0':(_opn)◂(_p9441) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12374
	btr r12,3
	jmp LB_12375
LB_12374:
	bts r12,3
LB_12375:
	mov rsi,1
	bt r12,3
	jc LB_12372
	mov rsi,0
	bt r9,0
	jc LB_12372
	jmp LB_12373
LB_12372:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12373:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12376:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12378
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12377
LB_12378:
	add rsp,8
	ret
LB_12380:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_12379:
	add rsp,32
	pop r14
LB_12377:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; word
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12415
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12409
LB_12415:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12410
	btr r12,0
	jmp LB_12411
LB_12410:
	bts r12,0
LB_12411:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12406
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9490 %_12192 ⊢ %_12193 : %_12193
 ; {>  %_12192~0':_stg }
; _f9490 0' ⊢ °1◂0'
; _some %_12193 ⊢ %_12194 : %_12194
 ; {>  %_12193~°1◂0':_p9441 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12194
 ; {>  %_12194~°0◂°1◂0':(_opn)◂(_p9441) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12404
	btr r12,3
	jmp LB_12405
LB_12404:
	bts r12,3
LB_12405:
	mov rsi,1
	bt r12,3
	jc LB_12402
	mov rsi,0
	bt r9,0
	jc LB_12402
	jmp LB_12403
LB_12402:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12403:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12406:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12408
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12407
LB_12408:
	add rsp,8
	ret
LB_12409:
	add rsp,16
	pop r14
LB_12407:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "_"
	add r14,1
	cmp r14,r10
	jg LB_12430
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_12430
	jmp LB_12431
LB_12430:
	jmp LB_12422
LB_12431:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12423
	btr r12,0
	jmp LB_12424
LB_12423:
	bts r12,0
LB_12424:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12419
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f9489 {  } ⊢ %_12195 : %_12195
 ; {>  }
; _f9489 {  } ⊢ °0◂{  }
; _some %_12195 ⊢ %_12196 : %_12196
 ; {>  %_12195~°0◂{  }:_p9441 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_12196
 ; {>  %_12196~°0◂°0◂{  }:(_opn)◂(_p9441) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_12417
	mov rsi,0
	bt r9,0
	jc LB_12417
	jmp LB_12418
LB_12417:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12418:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12419:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12421
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12420
LB_12421:
	add rsp,8
	ret
LB_12422:
	add rsp,16
	pop r14
LB_12420:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12432:
NS_E_RDI_12432:
NS_E_12432_ETR_TBL:
NS_E_12432_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; type_atm
	jmp LB_12510
LB_12509:
	add r14,1
LB_12510:
	cmp r14,r10
	jge LB_12511
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12509
	cmp al,10
	jz LB_12509
	cmp al,32
	jz LB_12509
LB_12511:
	push r10
	call NS_E_12435_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12512
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12502
LB_12512:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; type_app_tl
	jmp LB_12515
LB_12514:
	add r14,1
LB_12515:
	cmp r14,r10
	jge LB_12516
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12514
	cmp al,10
	jz LB_12514
	cmp al,32
	jz LB_12514
LB_12516:
	push r10
	call NS_E_12434_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12517
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12518
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12518:
	jmp LB_12502
LB_12517:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_tl
	jmp LB_12521
LB_12520:
	add r14,1
LB_12521:
	cmp r14,r10
	jge LB_12522
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12520
	cmp al,10
	jz LB_12520
	cmp al,32
	jz LB_12520
LB_12522:
	push r10
	call NS_E_12433_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12523
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12524
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12524:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12525
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12525:
	jmp LB_12502
LB_12523:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12507
	btr r12,2
	jmp LB_12508
LB_12507:
	bts r12,2
LB_12508:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12505
	btr r12,1
	jmp LB_12506
LB_12505:
	bts r12,1
LB_12506:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12503
	btr r12,0
	jmp LB_12504
LB_12503:
	bts r12,0
LB_12504:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12499
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' 2' }
; _f11862 { %_12437 %_12438 } ⊢ %_12440 : %_12440
 ; {>  %_12438~1':(_lst)◂(_p9444) %_12437~0':_p9444 %_12439~2':(_opn)◂(_p9444) }
; _f11862 { 0' 1' } ⊢ 0'
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_11862
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_12470
	btr r12,2
	jmp LB_12471
LB_12470:
	bts r12,2
LB_12471:
	add rsp,16
MTC_LB_12472:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_12473
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °0◂1'
; 2' ⊢ °0◂1'
	btr r12,3
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_12474
	bt QWORD [rdi],0
	jc LB_12475
	btr r12,3
	jmp LB_12476
LB_12475:
	bts r12,3
LB_12476:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12474:
	mov r9,rdi
	mov r14,r9
	bt r12,3
	jc LB_12477
	btr r12,1
	jmp LB_12478
LB_12477:
	bts r12,1
LB_12478:
LB_12479:
	cmp r15,0
	jz LB_12480
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12479
LB_12480:
; _f9496 { %_12440 %_12441 } ⊢ %_12442 : %_12442
 ; {>  %_12440~0':_p9444 %_12441~1':_p9444 }
; _f9496 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_12442 ⊢ %_12443 : %_12443
 ; {>  %_12442~°1◂{ 0' 1' }:_p9444 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_12443
 ; {>  %_12443~°0◂°1◂{ 0' 1' }:(_opn)◂(_p9444) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_12485
	btr r12,2
	jmp LB_12486
LB_12485:
	bts r12,2
LB_12486:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_12483
	btr QWORD [rdi],0
	jmp LB_12484
LB_12483:
	bts QWORD [rdi],0
LB_12484:
	mov r8,r14
	bt r12,1
	jc LB_12489
	btr r12,2
	jmp LB_12490
LB_12489:
	bts r12,2
LB_12490:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_12487
	btr QWORD [rdi],1
	jmp LB_12488
LB_12487:
	bts QWORD [rdi],1
LB_12488:
	mov rsi,1
	bt r12,3
	jc LB_12481
	mov rsi,0
	bt r9,0
	jc LB_12481
	jmp LB_12482
LB_12481:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12482:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
MTC_LB_12473:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz MTC_LB_12491
; _emt_mov_ptn_to_ptn:{| 1010.. |},2' ⊢ °1◂{  }
; 2' ⊢ °1◂{  }
	btr r12,1
	mov rax,r8
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_12492
	bt QWORD [rdi],0
	jc LB_12493
	btr r12,1
	jmp LB_12494
LB_12493:
	bts r12,1
LB_12494:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_12492:
	mov r14,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_12495:
	cmp r15,0
	jz LB_12496
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_12495
LB_12496:
; _some %_12440 ⊢ %_12444 : %_12444
 ; {>  %_12440~0':_p9444 }
; _some 0' ⊢ °0◂0'
; ∎ %_12444
 ; {>  %_12444~°0◂0':(_opn)◂(_p9444) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12497
	btr r12,3
	jmp LB_12498
LB_12497:
	bts r12,3
LB_12498:
	mov r8,0
	bts r12,2
	ret
MTC_LB_12491:
LB_12499:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12501
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12500
LB_12501:
	add rsp,8
	ret
LB_12502:
	add rsp,48
	pop r14
LB_12500:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12433:
NS_E_RDI_12433:
NS_E_12433_ETR_TBL:
NS_E_12433_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\134\146"
	jmp LB_12540
LB_12539:
	add r14,1
LB_12540:
	cmp r14,r10
	jge LB_12541
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12539
	cmp al,10
	jz LB_12539
	cmp al,32
	jz LB_12539
LB_12541:
	add r14,3
	cmp r14,r10
	jg LB_12544
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_12544
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,134
	jnz LB_12544
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,146
	jnz LB_12544
	jmp LB_12545
LB_12544:
	jmp LB_12534
LB_12545:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_12547
LB_12546:
	add r14,1
LB_12547:
	cmp r14,r10
	jge LB_12548
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12546
	cmp al,10
	jz LB_12546
	cmp al,32
	jz LB_12546
LB_12548:
	push r10
	call NS_E_12432_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12549
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12550
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12550:
	jmp LB_12534
LB_12549:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12537
	btr r12,1
	jmp LB_12538
LB_12537:
	bts r12,1
LB_12538:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12535
	btr r12,0
	jmp LB_12536
LB_12535:
	bts r12,0
LB_12536:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12531
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_12552
	btr r12,2
	jmp LB_12553
LB_12552:
	bts r12,2
LB_12553:
	mov r13,r14
	bt r12,1
	jc LB_12554
	btr r12,0
	jmp LB_12555
LB_12554:
	bts r12,0
LB_12555:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_12445 ⊢ %_12446 : %_12446
 ; {>  %_12445~0':_p9444 }
; _some 0' ⊢ °0◂0'
; _some %_12446 ⊢ %_12447 : %_12447
 ; {>  %_12446~°0◂0':(_opn)◂(_p9444) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_12447
 ; {>  %_12447~°0◂°0◂0':(_opn)◂((_opn)◂(_p9444)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12529
	btr r12,3
	jmp LB_12530
LB_12529:
	bts r12,3
LB_12530:
	mov rsi,1
	bt r12,3
	jc LB_12527
	mov rsi,0
	bt r9,0
	jc LB_12527
	jmp LB_12528
LB_12527:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12528:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12531:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12533
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12532
LB_12533:
	add rsp,8
	ret
LB_12534:
	add rsp,32
	pop r14
LB_12532:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_12558
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_12448 : %_12448
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_12448 ⊢ %_12449 : %_12449
 ; {>  %_12448~°1◂{  }:(_opn)◂(t6100'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12449
 ; {>  %_12449~°0◂°1◂{  }:(_opn)◂((_opn)◂(t6103'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_12556
	mov rsi,0
	bt r9,0
	jc LB_12556
	jmp LB_12557
LB_12556:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12557:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12558:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12560
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12559
LB_12560:
	add rsp,8
	ret
LB_12561:
	add rsp,0
	pop r14
LB_12559:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12434:
NS_E_RDI_12434:
NS_E_12434_ETR_TBL:
NS_E_12434_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\151\130"
	jmp LB_12583
LB_12582:
	add r14,1
LB_12583:
	cmp r14,r10
	jge LB_12584
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12582
	cmp al,10
	jz LB_12582
	cmp al,32
	jz LB_12582
LB_12584:
	add r14,3
	cmp r14,r10
	jg LB_12587
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_12587
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_12587
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_12587
	jmp LB_12588
LB_12587:
	jmp LB_12575
LB_12588:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type_atm
	jmp LB_12590
LB_12589:
	add r14,1
LB_12590:
	cmp r14,r10
	jge LB_12591
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12589
	cmp al,10
	jz LB_12589
	cmp al,32
	jz LB_12589
LB_12591:
	push r10
	call NS_E_12435_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12592
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12593
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12593:
	jmp LB_12575
LB_12592:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; type_app_tl
	jmp LB_12596
LB_12595:
	add r14,1
LB_12596:
	cmp r14,r10
	jge LB_12597
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12595
	cmp al,10
	jz LB_12595
	cmp al,32
	jz LB_12595
LB_12597:
	push r10
	call NS_E_12434_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12598
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12599
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12599:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12600
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12600:
	jmp LB_12575
LB_12598:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12580
	btr r12,2
	jmp LB_12581
LB_12580:
	bts r12,2
LB_12581:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12578
	btr r12,1
	jmp LB_12579
LB_12578:
	bts r12,1
LB_12579:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12576
	btr r12,0
	jmp LB_12577
LB_12576:
	bts r12,0
LB_12577:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12572
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_12602
	btr r12,3
	jmp LB_12603
LB_12602:
	bts r12,3
LB_12603:
	mov r14,r8
	bt r12,2
	jc LB_12604
	btr r12,1
	jmp LB_12605
LB_12604:
	bts r12,1
LB_12605:
	mov r8,r13
	bt r12,0
	jc LB_12606
	btr r12,2
	jmp LB_12607
LB_12606:
	bts r12,2
LB_12607:
	mov r13,r9
	bt r12,3
	jc LB_12608
	btr r12,0
	jmp LB_12609
LB_12608:
	bts r12,0
LB_12609:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_12450 %_12451 } ⊢ %_12452 : %_12452
 ; {>  %_12451~1':(_lst)◂(_p9444) %_12450~0':_p9444 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_12452 ⊢ %_12453 : %_12453
 ; {>  %_12452~°0◂{ 0' 1' }:(_lst)◂(_p9444) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_12453
 ; {>  %_12453~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p9444)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_12566
	btr r12,2
	jmp LB_12567
LB_12566:
	bts r12,2
LB_12567:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_12564
	btr QWORD [rdi],0
	jmp LB_12565
LB_12564:
	bts QWORD [rdi],0
LB_12565:
	mov r8,r14
	bt r12,1
	jc LB_12570
	btr r12,2
	jmp LB_12571
LB_12570:
	bts r12,2
LB_12571:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_12568
	btr QWORD [rdi],1
	jmp LB_12569
LB_12568:
	bts QWORD [rdi],1
LB_12569:
	mov rsi,1
	bt r12,3
	jc LB_12562
	mov rsi,0
	bt r9,0
	jc LB_12562
	jmp LB_12563
LB_12562:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12563:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12572:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12574
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12573
LB_12574:
	add rsp,8
	ret
LB_12575:
	add rsp,48
	pop r14
LB_12573:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_12612
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_12454 : %_12454
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_12454 ⊢ %_12455 : %_12455
 ; {>  %_12454~°1◂{  }:(_lst)◂(t6113'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12455
 ; {>  %_12455~°0◂°1◂{  }:(_opn)◂((_lst)◂(t6116'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_12610
	mov rsi,0
	bt r9,0
	jc LB_12610
	jmp LB_12611
LB_12610:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12611:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12612:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12614
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12613
LB_12614:
	add rsp,8
	ret
LB_12615:
	add rsp,0
	pop r14
LB_12613:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12435:
NS_E_RDI_12435:
NS_E_12435_ETR_TBL:
NS_E_12435_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "{"
	jmp LB_12631
LB_12630:
	add r14,1
LB_12631:
	cmp r14,r10
	jge LB_12632
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12630
	cmp al,10
	jz LB_12630
	cmp al,32
	jz LB_12630
LB_12632:
	add r14,1
	cmp r14,r10
	jg LB_12635
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,123
	jnz LB_12635
	jmp LB_12636
LB_12635:
	jmp LB_12623
LB_12636:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; ⟦ type ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_12641:
	jmp LB_12638
LB_12637:
	add r14,1
LB_12638:
	cmp r14,r10
	jge LB_12639
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12637
	cmp al,10
	jz LB_12637
	cmp al,32
	jz LB_12637
LB_12639:
	push r10
	push rsi
	call NS_E_12432_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_12640
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_12642
	bts QWORD [rax],0
LB_12642:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_12641
LB_12640:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
; "}"
	jmp LB_12644
LB_12643:
	add r14,1
LB_12644:
	cmp r14,r10
	jge LB_12645
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12643
	cmp al,10
	jz LB_12643
	cmp al,32
	jz LB_12643
LB_12645:
	add r14,1
	cmp r14,r10
	jg LB_12650
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,125
	jnz LB_12650
	jmp LB_12651
LB_12650:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12647
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12647:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12648
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12648:
	jmp LB_12623
LB_12651:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12628
	btr r12,2
	jmp LB_12629
LB_12628:
	bts r12,2
LB_12629:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12626
	btr r12,1
	jmp LB_12627
LB_12626:
	bts r12,1
LB_12627:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12624
	btr r12,0
	jmp LB_12625
LB_12624:
	bts r12,0
LB_12625:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12620
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_12652
	btr r12,3
	jmp LB_12653
LB_12652:
	bts r12,3
LB_12653:
	mov r13,r14
	bt r12,1
	jc LB_12654
	btr r12,0
	jmp LB_12655
LB_12654:
	bts r12,0
LB_12655:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f8753 %_12456 ⊢ %_12457 : %_12457
 ; {>  %_12456~0':(_lst)◂(_p9444) }
; _f8753 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_8753
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _f9495 %_12457 ⊢ %_12458 : %_12458
 ; {>  %_12457~0':(_lst)◂(_p9444) }
; _f9495 0' ⊢ °0◂0'
; _some %_12458 ⊢ %_12459 : %_12459
 ; {>  %_12458~°0◂0':_p9444 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_12459
 ; {>  %_12459~°0◂°0◂0':(_opn)◂(_p9444) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12618
	btr r12,3
	jmp LB_12619
LB_12618:
	bts r12,3
LB_12619:
	mov rsi,1
	bt r12,3
	jc LB_12616
	mov rsi,0
	bt r9,0
	jc LB_12616
	jmp LB_12617
LB_12616:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12617:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12620:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12622
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12621
LB_12622:
	add rsp,8
	ret
LB_12623:
	add rsp,48
	pop r14
LB_12621:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "("
	jmp LB_12669
LB_12668:
	add r14,1
LB_12669:
	cmp r14,r10
	jge LB_12670
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12668
	cmp al,10
	jz LB_12668
	cmp al,32
	jz LB_12668
LB_12670:
	add r14,1
	cmp r14,r10
	jg LB_12673
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,40
	jnz LB_12673
	jmp LB_12674
LB_12673:
	jmp LB_12661
LB_12674:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; type
	jmp LB_12676
LB_12675:
	add r14,1
LB_12676:
	cmp r14,r10
	jge LB_12677
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12675
	cmp al,10
	jz LB_12675
	cmp al,32
	jz LB_12675
LB_12677:
	push r10
	call NS_E_12432_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12678
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12679
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12679:
	jmp LB_12661
LB_12678:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ")"
	jmp LB_12682
LB_12681:
	add r14,1
LB_12682:
	cmp r14,r10
	jge LB_12683
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12681
	cmp al,10
	jz LB_12681
	cmp al,32
	jz LB_12681
LB_12683:
	add r14,1
	cmp r14,r10
	jg LB_12688
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,41
	jnz LB_12688
	jmp LB_12689
LB_12688:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_12685
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_12685:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12686
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12686:
	jmp LB_12661
LB_12689:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_12666
	btr r12,2
	jmp LB_12667
LB_12666:
	bts r12,2
LB_12667:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12664
	btr r12,1
	jmp LB_12665
LB_12664:
	bts r12,1
LB_12665:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12662
	btr r12,0
	jmp LB_12663
LB_12662:
	bts r12,0
LB_12663:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_12658
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_12690
	btr r12,3
	jmp LB_12691
LB_12690:
	bts r12,3
LB_12691:
	mov r13,r14
	bt r12,1
	jc LB_12692
	btr r12,0
	jmp LB_12693
LB_12692:
	bts r12,0
LB_12693:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_12460 ⊢ %_12461 : %_12461
 ; {>  %_12460~0':_p9444 }
; _some 0' ⊢ °0◂0'
; ∎ %_12461
 ; {>  %_12461~°0◂0':(_opn)◂(_p9444) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12656
	btr r12,3
	jmp LB_12657
LB_12656:
	bts r12,3
LB_12657:
	mov r8,0
	bts r12,2
	ret
LB_12658:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12660
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12659
LB_12660:
	add rsp,8
	ret
LB_12661:
	add rsp,48
	pop r14
LB_12659:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; var
	jmp LB_12705
LB_12704:
	add r14,1
LB_12705:
	cmp r14,r10
	jge LB_12706
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12704
	cmp al,10
	jz LB_12704
	cmp al,32
	jz LB_12704
LB_12706:
	push r10
	call NS_E_12436_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12707
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12701
LB_12707:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12702
	btr r12,0
	jmp LB_12703
LB_12702:
	bts r12,0
LB_12703:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12698
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9499 %_12462 ⊢ %_12463 : %_12463
 ; {>  %_12462~0':_stg }
; _f9499 0' ⊢ °4◂0'
; _some %_12463 ⊢ %_12464 : %_12464
 ; {>  %_12463~°4◂0':_p9444 }
; _some °4◂0' ⊢ °0◂°4◂0'
; ∎ %_12464
 ; {>  %_12464~°0◂°4◂0':(_opn)◂(_p9444) }
; 	∎ °0◂°4◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°4◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12696
	btr r12,3
	jmp LB_12697
LB_12696:
	bts r12,3
LB_12697:
	mov rsi,1
	bt r12,3
	jc LB_12694
	mov rsi,0
	bt r9,0
	jc LB_12694
	jmp LB_12695
LB_12694:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12695:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12698:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12700
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12699
LB_12700:
	add rsp,8
	ret
LB_12701:
	add rsp,16
	pop r14
LB_12699:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_12720
LB_12719:
	add r14,1
LB_12720:
	cmp r14,r10
	jge LB_12721
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_12719
	cmp al,10
	jz LB_12719
	cmp al,32
	jz LB_12719
LB_12721:
	push r10
	call NS_E_11702_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12722
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12716
LB_12722:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12717
	btr r12,0
	jmp LB_12718
LB_12717:
	bts r12,0
LB_12718:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_12713
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9498 %_12465 ⊢ %_12466 : %_12466
 ; {>  %_12465~0':_p9379 }
; _f9498 0' ⊢ °3◂0'
; _some %_12466 ⊢ %_12467 : %_12467
 ; {>  %_12466~°3◂0':_p9444 }
; _some °3◂0' ⊢ °0◂°3◂0'
; ∎ %_12467
 ; {>  %_12467~°0◂°3◂0':(_opn)◂(_p9444) }
; 	∎ °0◂°3◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°3◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12711
	btr r12,3
	jmp LB_12712
LB_12711:
	bts r12,3
LB_12712:
	mov rsi,1
	bt r12,3
	jc LB_12709
	mov rsi,0
	bt r9,0
	jc LB_12709
	jmp LB_12710
LB_12709:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_12710:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_12713:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12715
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12714
LB_12715:
	add rsp,8
	ret
LB_12716:
	add rsp,16
	pop r14
LB_12714:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12436:
NS_E_RDI_12436:
NS_E_12436_ETR_TBL:
NS_E_12436_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_12737
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12729
LB_12737:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_12745
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_12745
	jmp LB_12746
LB_12745:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_12743
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_12743:
	jmp LB_12729
LB_12746:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_12732
	btr r12,1
	jmp LB_12733
LB_12732:
	bts r12,1
LB_12733:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_12730
	btr r12,0
	jmp LB_12731
LB_12730:
	bts r12,0
LB_12731:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_12726
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_12468 ⊢ %_12469 : %_12469
 ; {>  %_12468~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_12469
 ; {>  %_12469~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_12724
	btr r12,3
	jmp LB_12725
LB_12724:
	bts r12,3
LB_12725:
	mov r8,0
	bts r12,2
	ret
LB_12726:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_12728
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_12727
LB_12728:
	add rsp,8
	ret
LB_12729:
	add rsp,32
	pop r14
LB_12727:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12747:
NS_E_RDI_12747:
NS_E_12747_ETR_TBL:
NS_E_12747_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_13155
LB_13154:
	add r14,1
LB_13155:
	cmp r14,r10
	jge LB_13156
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13154
	cmp al,10
	jz LB_13154
	cmp al,32
	jz LB_13154
LB_13156:
	push r10
	call NS_E_12748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13157
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13149
LB_13157:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; file
	jmp LB_13160
LB_13159:
	add r14,1
LB_13160:
	cmp r14,r10
	jge LB_13161
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13159
	cmp al,10
	jz LB_13159
	cmp al,32
	jz LB_13159
LB_13161:
	push r10
	call NS_E_12747_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13162
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13163
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13163:
	jmp LB_13149
LB_13162:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13152
	btr r12,1
	jmp LB_13153
LB_13152:
	bts r12,1
LB_13153:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13150
	btr r12,0
	jmp LB_13151
LB_13150:
	bts r12,0
LB_13151:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13146
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_12787 %_12788 } ⊢ %_12789 : %_12789
 ; {>  %_12787~0':_p9427 %_12788~1':(_lst)◂(_p9427) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_12789 ⊢ %_12790 : %_12790
 ; {>  %_12789~°0◂{ 0' 1' }:(_lst)◂(_p9427) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_12790
 ; {>  %_12790~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p9427)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_13140
	btr r12,2
	jmp LB_13141
LB_13140:
	bts r12,2
LB_13141:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_13138
	btr QWORD [rdi],0
	jmp LB_13139
LB_13138:
	bts QWORD [rdi],0
LB_13139:
	mov r8,r14
	bt r12,1
	jc LB_13144
	btr r12,2
	jmp LB_13145
LB_13144:
	bts r12,2
LB_13145:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_13142
	btr QWORD [rdi],1
	jmp LB_13143
LB_13142:
	bts QWORD [rdi],1
LB_13143:
	mov rsi,1
	bt r12,3
	jc LB_13136
	mov rsi,0
	bt r9,0
	jc LB_13136
	jmp LB_13137
LB_13136:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13137:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13146:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13148
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13147
LB_13148:
	add rsp,8
	ret
LB_13149:
	add rsp,32
	pop r14
LB_13147:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13167
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_12791 : %_12791
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_12791 ⊢ %_12792 : %_12792
 ; {>  %_12791~°1◂{  }:(_lst)◂(t6242'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12792
 ; {>  %_12792~°0◂°1◂{  }:(_opn)◂((_lst)◂(t6245'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_13165
	mov rsi,0
	bt r9,0
	jc LB_13165
	jmp LB_13166
LB_13165:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13166:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13167:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13169
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13168
LB_13169:
	add rsp,8
	ret
LB_13170:
	add rsp,0
	pop r14
LB_13168:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12748:
NS_E_RDI_12748:
NS_E_12748_ETR_TBL:
NS_E_12748_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167\194\167+s8"
	jmp LB_13189
LB_13188:
	add r14,1
LB_13189:
	cmp r14,r10
	jge LB_13190
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13188
	cmp al,10
	jz LB_13188
	cmp al,32
	jz LB_13188
LB_13190:
	add r14,7
	cmp r14,r10
	jg LB_13193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+0]
	cmp al,194
	jnz LB_13193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+1]
	cmp al,167
	jnz LB_13193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+2]
	cmp al,194
	jnz LB_13193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+3]
	cmp al,167
	jnz LB_13193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+4]
	cmp al,43
	jnz LB_13193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+5]
	cmp al,115
	jnz LB_13193
	mov rax,0
	mov al,BYTE [r13+r14+8*1-7+6]
	cmp al,56
	jnz LB_13193
	jmp LB_13194
LB_13193:
	jmp LB_13176
LB_13194:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_body
	jmp LB_13183
LB_13182:
	add r14,1
LB_13183:
	cmp r14,r10
	jge LB_13184
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13182
	cmp al,10
	jz LB_13182
	cmp al,32
	jz LB_13182
LB_13184:
	push r10
	call NS_E_12749_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13185
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13186
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13186:
	jmp LB_13177
LB_13185:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13180
	btr r12,1
	jmp LB_13181
LB_13180:
	bts r12,1
LB_13181:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13178
	btr r12,0
	jmp LB_13179
LB_13178:
	bts r12,0
LB_13179:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13173
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_13195
	btr r12,2
	jmp LB_13196
LB_13195:
	bts r12,2
LB_13196:
	mov r13,r14
	bt r12,1
	jc LB_13197
	btr r12,0
	jmp LB_13198
LB_13197:
	bts r12,0
LB_13198:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_12793 ⊢ %_12794 : %_12794
 ; {>  %_12793~0':_p9427 }
; _some 0' ⊢ °0◂0'
; ∎ %_12794
 ; {>  %_12794~°0◂0':(_opn)◂(_p9427) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13171
	btr r12,3
	jmp LB_13172
LB_13171:
	bts r12,3
LB_13172:
	mov r8,0
	bts r12,2
	ret
LB_13173:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13175
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13174
LB_13175:
	add rsp,8
	ret
LB_13177:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13176:
	add rsp,32
	pop r14
LB_13174:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13200
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_12795
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_12795 ⊢ %_12796 : %_12796
 ; {>  %_12795~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_12797 : %_12797
 ; {>  %_12796~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_12797
 ; {>  %_12796~0':_stg %_12797~°1◂{  }:(_opn)◂(t6255'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_13199
	mov rdi,r13
	call dlt
LB_13199:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_13200:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13202
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13201
LB_13202:
	add rsp,8
	ret
LB_13203:
	add rsp,0
	pop r14
LB_13201:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\194\167\194\167"
	jmp LB_13239
LB_13238:
	add r14,1
LB_13239:
	cmp r14,r10
	jge LB_13240
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13238
	cmp al,10
	jz LB_13238
	cmp al,32
	jz LB_13238
LB_13240:
	add r14,4
	cmp r14,r10
	jg LB_13243
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,194
	jnz LB_13243
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,167
	jnz LB_13243
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,194
	jnz LB_13243
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,167
	jnz LB_13243
	jmp LB_13244
LB_13243:
	jmp LB_13217
LB_13244:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_13226
LB_13225:
	add r14,1
LB_13226:
	cmp r14,r10
	jge LB_13227
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13225
	cmp al,10
	jz LB_13225
	cmp al,32
	jz LB_13225
LB_13227:
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13228
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13229
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13229:
	jmp LB_13218
LB_13228:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mdl_etr_def
	jmp LB_13232
LB_13231:
	add r14,1
LB_13232:
	cmp r14,r10
	jge LB_13233
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13231
	cmp al,10
	jz LB_13231
	cmp al,32
	jz LB_13231
LB_13233:
	push r10
	call NS_E_12750_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13234
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13235
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13235:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13236
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13236:
	jmp LB_13218
LB_13234:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13223
	btr r12,2
	jmp LB_13224
LB_13223:
	bts r12,2
LB_13224:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13221
	btr r12,1
	jmp LB_13222
LB_13221:
	bts r12,1
LB_13222:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13219
	btr r12,0
	jmp LB_13220
LB_13219:
	bts r12,0
LB_13220:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_13214
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_13245
	btr r12,3
	jmp LB_13246
LB_13245:
	bts r12,3
LB_13246:
	mov r14,r8
	bt r12,2
	jc LB_13247
	btr r12,1
	jmp LB_13248
LB_13247:
	bts r12,1
LB_13248:
	mov r8,r13
	bt r12,0
	jc LB_13249
	btr r12,2
	jmp LB_13250
LB_13249:
	bts r12,2
LB_13250:
	mov r13,r9
	bt r12,3
	jc LB_13251
	btr r12,0
	jmp LB_13252
LB_13251:
	bts r12,0
LB_13252:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9454 { %_12798 %_12799 } ⊢ %_12800 : %_12800
 ; {>  %_12799~1':_p9428 %_12798~0':_stg }
; _f9454 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_12800 ⊢ %_12801 : %_12801
 ; {>  %_12800~°0◂{ 0' 1' }:_p9427 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_12801
 ; {>  %_12801~°0◂°0◂{ 0' 1' }:(_opn)◂(_p9427) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_13208
	btr r12,2
	jmp LB_13209
LB_13208:
	bts r12,2
LB_13209:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_13206
	btr QWORD [rdi],0
	jmp LB_13207
LB_13206:
	bts QWORD [rdi],0
LB_13207:
	mov r8,r14
	bt r12,1
	jc LB_13212
	btr r12,2
	jmp LB_13213
LB_13212:
	bts r12,2
LB_13213:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_13210
	btr QWORD [rdi],1
	jmp LB_13211
LB_13210:
	bts QWORD [rdi],1
LB_13211:
	mov rsi,1
	bt r12,3
	jc LB_13204
	mov rsi,0
	bt r9,0
	jc LB_13204
	jmp LB_13205
LB_13204:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13205:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13214:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13216
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13215
LB_13216:
	add rsp,8
	ret
LB_13218:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13217:
	add rsp,48
	pop r14
LB_13215:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13254
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 1" _ ⊢ 0' : %_12802
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_31
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_12802 ⊢ %_12803 : %_12803
 ; {>  %_12802~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_12804 : %_12804
 ; {>  %_12803~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_12804
 ; {>  %_12804~°1◂{  }:(_opn)◂(t6267'(0)) %_12803~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_13253
	mov rdi,r13
	call dlt
LB_13253:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_13254:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13256
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13255
LB_13256:
	add rsp,8
	ret
LB_13257:
	add rsp,0
	pop r14
LB_13255:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\167"
	jmp LB_13276
LB_13275:
	add r14,1
LB_13276:
	cmp r14,r10
	jge LB_13277
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13275
	cmp al,10
	jz LB_13275
	cmp al,32
	jz LB_13275
LB_13277:
	add r14,2
	cmp r14,r10
	jg LB_13280
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_13280
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,167
	jnz LB_13280
	jmp LB_13281
LB_13280:
	jmp LB_13263
LB_13281:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_etr_body
	jmp LB_13270
LB_13269:
	add r14,1
LB_13270:
	cmp r14,r10
	jge LB_13271
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13269
	cmp al,10
	jz LB_13269
	cmp al,32
	jz LB_13269
LB_13271:
	push r10
	call NS_E_12758_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13272
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13273
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13273:
	jmp LB_13264
LB_13272:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13267
	btr r12,1
	jmp LB_13268
LB_13267:
	bts r12,1
LB_13268:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13265
	btr r12,0
	jmp LB_13266
LB_13265:
	bts r12,0
LB_13266:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13260
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_13282
	btr r12,2
	jmp LB_13283
LB_13282:
	bts r12,2
LB_13283:
	mov r13,r14
	bt r12,1
	jc LB_13284
	btr r12,0
	jmp LB_13285
LB_13284:
	bts r12,0
LB_13285:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_12805 ⊢ %_12806 : %_12806
 ; {>  %_12805~0':_p9427 }
; _some 0' ⊢ °0◂0'
; ∎ %_12806
 ; {>  %_12806~°0◂0':(_opn)◂(_p9427) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13258
	btr r12,3
	jmp LB_13259
LB_13258:
	bts r12,3
LB_13259:
	mov r8,0
	bts r12,2
	ret
LB_13260:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13262
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13261
LB_13262:
	add rsp,8
	ret
LB_13264:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13263:
	add rsp,32
	pop r14
LB_13261:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13287
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 2" _ ⊢ 0' : %_12807
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_32
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_12807 ⊢ %_12808 : %_12808
 ; {>  %_12807~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_12809 : %_12809
 ; {>  %_12808~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_12809
 ; {>  %_12808~0':_stg %_12809~°1◂{  }:(_opn)◂(t6277'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_13286
	mov rdi,r13
	call dlt
LB_13286:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_13287:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13289
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13288
LB_13289:
	add rsp,8
	ret
LB_13290:
	add rsp,0
	pop r14
LB_13288:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\182"
	jmp LB_13309
LB_13308:
	add r14,1
LB_13309:
	cmp r14,r10
	jge LB_13310
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13308
	cmp al,10
	jz LB_13308
	cmp al,32
	jz LB_13308
LB_13310:
	add r14,2
	cmp r14,r10
	jg LB_13313
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_13313
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,182
	jnz LB_13313
	jmp LB_13314
LB_13313:
	jmp LB_13296
LB_13314:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dt_etr
	jmp LB_13303
LB_13302:
	add r14,1
LB_13303:
	cmp r14,r10
	jge LB_13304
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13302
	cmp al,10
	jz LB_13302
	cmp al,32
	jz LB_13302
LB_13304:
	push r10
	call NS_E_12752_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13305
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13306
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13306:
	jmp LB_13297
LB_13305:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13300
	btr r12,1
	jmp LB_13301
LB_13300:
	bts r12,1
LB_13301:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13298
	btr r12,0
	jmp LB_13299
LB_13298:
	bts r12,0
LB_13299:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13293
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_13315
	btr r12,2
	jmp LB_13316
LB_13315:
	bts r12,2
LB_13316:
	mov r13,r14
	bt r12,1
	jc LB_13317
	btr r12,0
	jmp LB_13318
LB_13317:
	bts r12,0
LB_13318:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_12810 ⊢ %_12811 : %_12811
 ; {>  %_12810~0':_p9427 }
; _some 0' ⊢ °0◂0'
; ∎ %_12811
 ; {>  %_12811~°0◂0':(_opn)◂(_p9427) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13291
	btr r12,3
	jmp LB_13292
LB_13291:
	bts r12,3
LB_13292:
	mov r8,0
	bts r12,2
	ret
LB_13293:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13295
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13294
LB_13295:
	add rsp,8
	ret
LB_13297:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13296:
	add rsp,32
	pop r14
LB_13294:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12749:
NS_E_RDI_12749:
NS_E_12749_ETR_TBL:
NS_E_12749_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_etr
	jmp LB_13354
LB_13353:
	add r14,1
LB_13354:
	cmp r14,r10
	jge LB_13355
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13353
	cmp al,10
	jz LB_13353
	cmp al,32
	jz LB_13353
LB_13355:
	push r10
	call NS_E_12774_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13356
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13348
LB_13356:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ⟦ grm_etr ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_13362:
	jmp LB_13359
LB_13358:
	add r14,1
LB_13359:
	cmp r14,r10
	jge LB_13360
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13358
	cmp al,10
	jz LB_13358
	cmp al,32
	jz LB_13358
LB_13360:
	push r10
	push rsi
	call NS_E_12774_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_13361
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_13363
	bts QWORD [rax],0
LB_13363:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_13362
LB_13361:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13351
	btr r12,1
	jmp LB_13352
LB_13351:
	bts r12,1
LB_13352:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13349
	btr r12,0
	jmp LB_13350
LB_13349:
	bts r12,0
LB_13350:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13345
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' } 2' }
	mov r8,r14
	bt r12,1
	jc LB_13364
	btr r12,2
	jmp LB_13365
LB_13364:
	bts r12,2
LB_13365:
	mov r9,r13
	bt r12,0
	jc LB_13366
	btr r12,3
	jmp LB_13367
LB_13366:
	bts r12,3
LB_13367:
; 3' ⊢ { 0' 1' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_13370
	btr r12,4
	jmp LB_13371
LB_13370:
	bts r12,4
LB_13371:
	mov r13,r10
	bt r12,4
	jc LB_13368
	btr r12,0
	jmp LB_13369
LB_13368:
	bts r12,0
LB_13369:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_13374
	btr r12,4
	jmp LB_13375
LB_13374:
	bts r12,4
LB_13375:
	mov r14,r10
	bt r12,4
	jc LB_13372
	btr r12,1
	jmp LB_13373
LB_13372:
	bts r12,1
LB_13373:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f8753 %_12813 ⊢ %_12814 : %_12814
 ; {>  %_12812~{ 0' 1' }:{ _stg _p9431 } %_12813~2':(_lst)◂({ _stg _p9431 }) }
; _f8753 2' ⊢ 2'
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0010.. |},2' ⊢ 0'
	mov r13,r8
	bt r12,2
	jc LB_13323
	btr r12,0
	jmp LB_13324
LB_13323:
	bts r12,0
LB_13324:
	call NS_E_8753
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 2'
	mov r8,r13
	bt r12,0
	jc LB_13325
	btr r12,2
	jmp LB_13326
LB_13325:
	bts r12,2
LB_13326:
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_13321
	btr r12,1
	jmp LB_13322
LB_13321:
	bts r12,1
LB_13322:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_13319
	btr r12,0
	jmp LB_13320
LB_13319:
	bts r12,0
LB_13320:
	add rsp,24
; _cns { %_12812 %_12814 } ⊢ %_12815 : %_12815
 ; {>  %_12812~{ 0' 1' }:{ _stg _p9431 } %_12814~2':(_lst)◂({ _stg _p9431 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f9455 %_12815 ⊢ %_12816 : %_12816
 ; {>  %_12815~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p9431 }) }
; _f9455 °0◂{ { 0' 1' } 2' } ⊢ °1◂°0◂{ { 0' 1' } 2' }
; _some %_12816 ⊢ %_12817 : %_12817
 ; {>  %_12816~°1◂°0◂{ { 0' 1' } 2' }:_p9427 }
; _some °1◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°1◂°0◂{ { 0' 1' } 2' }
; ∎ %_12817
 ; {>  %_12817~°0◂°1◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p9427) }
; 	∎ °0◂°1◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°1◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_13335
	btr r12,5
	jmp LB_13336
LB_13335:
	bts r12,5
LB_13336:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_13333
	btr QWORD [rdi],0
	jmp LB_13334
LB_13333:
	bts QWORD [rdi],0
LB_13334:
	mov r11,r14
	bt r12,1
	jc LB_13339
	btr r12,5
	jmp LB_13340
LB_13339:
	bts r12,5
LB_13340:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_13337
	btr QWORD [rdi],1
	jmp LB_13338
LB_13337:
	bts QWORD [rdi],1
LB_13338:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_13331
	btr QWORD [rdi],0
	jmp LB_13332
LB_13331:
	bts QWORD [rdi],0
LB_13332:
	mov r10,r8
	bt r12,2
	jc LB_13343
	btr r12,4
	jmp LB_13344
LB_13343:
	bts r12,4
LB_13344:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_13341
	btr QWORD [rdi],1
	jmp LB_13342
LB_13341:
	bts QWORD [rdi],1
LB_13342:
	mov rsi,1
	bt r12,3
	jc LB_13329
	mov rsi,0
	bt r9,0
	jc LB_13329
	jmp LB_13330
LB_13329:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13330:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_13327
	mov rsi,0
	bt r9,0
	jc LB_13327
	jmp LB_13328
LB_13327:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13328:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13345:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13347
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13346
LB_13347:
	add rsp,8
	ret
LB_13348:
	add rsp,32
	pop r14
LB_13346:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13377
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "grm_etr 0" _ ⊢ 0' : %_12818
	mov rdi,9
	call mlc_s8
	mov rdi,rax
	mov rax,0x_20_72_74_65_5f_6d_72_67
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_30
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_12818 ⊢ %_12819 : %_12819
 ; {>  %_12818~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_12820 : %_12820
 ; {>  %_12819~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_12820
 ; {>  %_12819~0':_stg %_12820~°1◂{  }:(_opn)◂(t6296'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_13376
	mov rdi,r13
	call dlt
LB_13376:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_13377:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13379
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13378
LB_13379:
	add rsp,8
	ret
LB_13380:
	add rsp,0
	pop r14
LB_13378:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12750:
NS_E_RDI_12750:
NS_E_12750_ETR_TBL:
NS_E_12750_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_13401
LB_13400:
	add r14,1
LB_13401:
	cmp r14,r10
	jge LB_13402
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13400
	cmp al,10
	jz LB_13400
	cmp al,32
	jz LB_13400
LB_13402:
	add r14,1
	cmp r14,r10
	jg LB_13405
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_13405
	jmp LB_13406
LB_13405:
	jmp LB_13388
LB_13406:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; name
	jmp LB_13395
LB_13394:
	add r14,1
LB_13395:
	cmp r14,r10
	jge LB_13396
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13394
	cmp al,10
	jz LB_13394
	cmp al,32
	jz LB_13394
LB_13396:
	push r10
	call NS_E_11702_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13397
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13398
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13398:
	jmp LB_13389
LB_13397:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13392
	btr r12,1
	jmp LB_13393
LB_13392:
	bts r12,1
LB_13393:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13390
	btr r12,0
	jmp LB_13391
LB_13390:
	bts r12,0
LB_13391:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13385
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_13407
	btr r12,2
	jmp LB_13408
LB_13407:
	bts r12,2
LB_13408:
	mov r13,r14
	bt r12,1
	jc LB_13409
	btr r12,0
	jmp LB_13410
LB_13409:
	bts r12,0
LB_13410:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9461 %_12821 ⊢ %_12822 : %_12822
 ; {>  %_12821~0':_p9379 }
; _f9461 0' ⊢ °1◂0'
; _some %_12822 ⊢ %_12823 : %_12823
 ; {>  %_12822~°1◂0':_p9428 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12823
 ; {>  %_12823~°0◂°1◂0':(_opn)◂(_p9428) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13383
	btr r12,3
	jmp LB_13384
LB_13383:
	bts r12,3
LB_13384:
	mov rsi,1
	bt r12,3
	jc LB_13381
	mov rsi,0
	bt r9,0
	jc LB_13381
	jmp LB_13382
LB_13381:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13382:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13385:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13387
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13386
LB_13387:
	add rsp,8
	ret
LB_13389:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13388:
	add rsp,32
	pop r14
LB_13386:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; mdl_glb_etr
	jmp LB_13422
LB_13421:
	add r14,1
LB_13422:
	cmp r14,r10
	jge LB_13423
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13421
	cmp al,10
	jz LB_13421
	cmp al,32
	jz LB_13421
LB_13423:
	push r10
	call NS_E_12751_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13424
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13418
LB_13424:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13419
	btr r12,0
	jmp LB_13420
LB_13419:
	bts r12,0
LB_13420:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13415
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9460 %_12824 ⊢ %_12825 : %_12825
 ; {>  %_12824~0':(_lst)◂(_p9427) }
; _f9460 0' ⊢ °0◂0'
; _some %_12825 ⊢ %_12826 : %_12826
 ; {>  %_12825~°0◂0':_p9428 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_12826
 ; {>  %_12826~°0◂°0◂0':(_opn)◂(_p9428) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_13413
	btr r12,3
	jmp LB_13414
LB_13413:
	bts r12,3
LB_13414:
	mov rsi,1
	bt r12,3
	jc LB_13411
	mov rsi,0
	bt r9,0
	jc LB_13411
	jmp LB_13412
LB_13411:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13412:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13415:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13417
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13416
LB_13417:
	add rsp,8
	ret
LB_13418:
	add rsp,16
	pop r14
LB_13416:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13427
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "mdl_etr_def 0" _ ⊢ 0' : %_12827
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_5f_72_74_65_5f_6c_64_6d
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_66_65_64
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_12827 ⊢ %_12828 : %_12828
 ; {>  %_12827~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_12829 : %_12829
 ; {>  %_12828~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_12829
 ; {>  %_12828~0':_stg %_12829~°1◂{  }:(_opn)◂(t6311'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_13426
	mov rdi,r13
	call dlt
LB_13426:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_13427:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13429
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13428
LB_13429:
	add rsp,8
	ret
LB_13430:
	add rsp,0
	pop r14
LB_13428:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12751:
NS_E_RDI_12751:
NS_E_12751_ETR_TBL:
NS_E_12751_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\142\226\136\142"
	jmp LB_13440
LB_13439:
	add r14,1
LB_13440:
	cmp r14,r10
	jge LB_13441
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13439
	cmp al,10
	jz LB_13439
	cmp al,32
	jz LB_13439
LB_13441:
	add r14,6
	cmp r14,r10
	jg LB_13444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+0]
	cmp al,226
	jnz LB_13444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+1]
	cmp al,136
	jnz LB_13444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+2]
	cmp al,142
	jnz LB_13444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+3]
	cmp al,226
	jnz LB_13444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+4]
	cmp al,136
	jnz LB_13444
	mov rax,0
	mov al,BYTE [r13+r14+8*1-6+5]
	cmp al,142
	jnz LB_13444
	jmp LB_13445
LB_13444:
	jmp LB_13436
LB_13445:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13437
	btr r12,0
	jmp LB_13438
LB_13437:
	bts r12,0
LB_13438:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13433
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_12830 : %_12830
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_12830 ⊢ %_12831 : %_12831
 ; {>  %_12830~°1◂{  }:(_lst)◂(t6315'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12831
 ; {>  %_12831~°0◂°1◂{  }:(_opn)◂((_lst)◂(t6318'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_13431
	mov rsi,0
	bt r9,0
	jc LB_13431
	jmp LB_13432
LB_13431:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13432:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13433:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13435
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13434
LB_13435:
	add rsp,8
	ret
LB_13436:
	add rsp,16
	pop r14
LB_13434:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; glb_etr
	jmp LB_13465
LB_13464:
	add r14,1
LB_13465:
	cmp r14,r10
	jge LB_13466
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13464
	cmp al,10
	jz LB_13464
	cmp al,32
	jz LB_13464
LB_13466:
	push r10
	call NS_E_12748_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13467
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13459
LB_13467:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mdl_glb_etr
	jmp LB_13470
LB_13469:
	add r14,1
LB_13470:
	cmp r14,r10
	jge LB_13471
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13469
	cmp al,10
	jz LB_13469
	cmp al,32
	jz LB_13469
LB_13471:
	push r10
	call NS_E_12751_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13472
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13473
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13473:
	jmp LB_13459
LB_13472:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13462
	btr r12,1
	jmp LB_13463
LB_13462:
	bts r12,1
LB_13463:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13460
	btr r12,0
	jmp LB_13461
LB_13460:
	bts r12,0
LB_13461:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_13456
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_12832 %_12833 } ⊢ %_12834 : %_12834
 ; {>  %_12832~0':_p9427 %_12833~1':(_lst)◂(_p9427) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_12834 ⊢ %_12835 : %_12835
 ; {>  %_12834~°0◂{ 0' 1' }:(_lst)◂(_p9427) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_12835
 ; {>  %_12835~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p9427)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_13450
	btr r12,2
	jmp LB_13451
LB_13450:
	bts r12,2
LB_13451:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_13448
	btr QWORD [rdi],0
	jmp LB_13449
LB_13448:
	bts QWORD [rdi],0
LB_13449:
	mov r8,r14
	bt r12,1
	jc LB_13454
	btr r12,2
	jmp LB_13455
LB_13454:
	bts r12,2
LB_13455:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_13452
	btr QWORD [rdi],1
	jmp LB_13453
LB_13452:
	bts QWORD [rdi],1
LB_13453:
	mov rsi,1
	bt r12,3
	jc LB_13446
	mov rsi,0
	bt r9,0
	jc LB_13446
	jmp LB_13447
LB_13446:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13447:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13456:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13458
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13457
LB_13458:
	add rsp,8
	ret
LB_13459:
	add rsp,32
	pop r14
LB_13457:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12752:
NS_E_RDI_12752:
NS_E_12752_ETR_TBL:
NS_E_12752_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_13530
LB_13529:
	add r14,1
LB_13530:
	cmp r14,r10
	jge LB_13531
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13529
	cmp al,10
	jz LB_13529
	cmp al,32
	jz LB_13529
LB_13531:
	add r14,1
	cmp r14,r10
	jg LB_13534
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_13534
	jmp LB_13535
LB_13534:
	jmp LB_13496
LB_13535:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_13507
LB_13506:
	add r14,1
LB_13507:
	cmp r14,r10
	jge LB_13508
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13506
	cmp al,10
	jz LB_13506
	cmp al,32
	jz LB_13506
LB_13508:
	add r14,1
	cmp r14,r10
	jg LB_13512
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_13512
	jmp LB_13513
LB_13512:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13510
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13510:
	jmp LB_13497
LB_13513:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_13515
LB_13514:
	add r14,1
LB_13515:
	cmp r14,r10
	jge LB_13516
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13514
	cmp al,10
	jz LB_13514
	cmp al,32
	jz LB_13514
LB_13516:
	push r10
	call NS_E_12753_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13517
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13518
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13518:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13519
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13519:
	jmp LB_13497
LB_13517:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_13522
LB_13521:
	add r14,1
LB_13522:
	cmp r14,r10
	jge LB_13523
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13521
	cmp al,10
	jz LB_13521
	cmp al,32
	jz LB_13521
LB_13523:
	push r10
	call NS_E_12756_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13524
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_13525
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_13525:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13526
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13526:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13527
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13527:
	jmp LB_13497
LB_13524:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_13504
	btr r12,3
	jmp LB_13505
LB_13504:
	bts r12,3
LB_13505:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13502
	btr r12,2
	jmp LB_13503
LB_13502:
	bts r12,2
LB_13503:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13500
	btr r12,1
	jmp LB_13501
LB_13500:
	bts r12,1
LB_13501:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13498
	btr r12,0
	jmp LB_13499
LB_13498:
	bts r12,0
LB_13499:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_13493
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_13536
	btr r12,4
	jmp LB_13537
LB_13536:
	bts r12,4
LB_13537:
	mov r8,r9
	bt r12,3
	jc LB_13538
	btr r12,2
	jmp LB_13539
LB_13538:
	bts r12,2
LB_13539:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_13542
	btr r12,3
	jmp LB_13543
LB_13542:
	bts r12,3
LB_13543:
	mov r13,r9
	bt r12,3
	jc LB_13540
	btr r12,0
	jmp LB_13541
LB_13540:
	bts r12,0
LB_13541:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_13546
	btr r12,3
	jmp LB_13547
LB_13546:
	bts r12,3
LB_13547:
	mov r14,r9
	bt r12,3
	jc LB_13544
	btr r12,1
	jmp LB_13545
LB_13544:
	bts r12,1
LB_13545:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_12836 %_12837 } ⊢ %_12838 : %_12838
 ; {>  %_12837~2':(_lst)◂({ _stg _p9430 }) %_12836~{ 0' 1' }:{ _stg _p9430 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _f9459 %_12838 ⊢ %_12839 : %_12839
 ; {>  %_12838~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p9430 }) }
; _f9459 °0◂{ { 0' 1' } 2' } ⊢ °5◂°0◂{ { 0' 1' } 2' }
; _some %_12839 ⊢ %_12840 : %_12840
 ; {>  %_12839~°5◂°0◂{ { 0' 1' } 2' }:_p9427 }
; _some °5◂°0◂{ { 0' 1' } 2' } ⊢ °0◂°5◂°0◂{ { 0' 1' } 2' }
; ∎ %_12840
 ; {>  %_12840~°0◂°5◂°0◂{ { 0' 1' } 2' }:(_opn)◂(_p9427) }
; 	∎ °0◂°5◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°5◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_13483
	btr r12,5
	jmp LB_13484
LB_13483:
	bts r12,5
LB_13484:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_13481
	btr QWORD [rdi],0
	jmp LB_13482
LB_13481:
	bts QWORD [rdi],0
LB_13482:
	mov r11,r14
	bt r12,1
	jc LB_13487
	btr r12,5
	jmp LB_13488
LB_13487:
	bts r12,5
LB_13488:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_13485
	btr QWORD [rdi],1
	jmp LB_13486
LB_13485:
	bts QWORD [rdi],1
LB_13486:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_13479
	btr QWORD [rdi],0
	jmp LB_13480
LB_13479:
	bts QWORD [rdi],0
LB_13480:
	mov r10,r8
	bt r12,2
	jc LB_13491
	btr r12,4
	jmp LB_13492
LB_13491:
	bts r12,4
LB_13492:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_13489
	btr QWORD [rdi],1
	jmp LB_13490
LB_13489:
	bts QWORD [rdi],1
LB_13490:
	mov rsi,1
	bt r12,3
	jc LB_13477
	mov rsi,0
	bt r9,0
	jc LB_13477
	jmp LB_13478
LB_13477:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13478:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_13475
	mov rsi,0
	bt r9,0
	jc LB_13475
	jmp LB_13476
LB_13475:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13476:
	mov rax,0x0500_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13493:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13495
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13494
LB_13495:
	add rsp,8
	ret
LB_13497:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13496:
	add rsp,64
	pop r14
LB_13494:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; dt_etr_body
	jmp LB_13565
LB_13564:
	add r14,1
LB_13565:
	cmp r14,r10
	jge LB_13566
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13564
	cmp al,10
	jz LB_13564
	cmp al,32
	jz LB_13564
LB_13566:
	push r10
	call NS_E_12753_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13567
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13561
LB_13567:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13562
	btr r12,0
	jmp LB_13563
LB_13562:
	bts r12,0
LB_13563:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_13558
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_13569
	btr r12,2
	jmp LB_13570
LB_13569:
	bts r12,2
LB_13570:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_13573
	btr r12,3
	jmp LB_13574
LB_13573:
	bts r12,3
LB_13574:
	mov r13,r9
	bt r12,3
	jc LB_13571
	btr r12,0
	jmp LB_13572
LB_13571:
	bts r12,0
LB_13572:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_13577
	btr r12,3
	jmp LB_13578
LB_13577:
	bts r12,3
LB_13578:
	mov r14,r9
	bt r12,3
	jc LB_13575
	btr r12,1
	jmp LB_13576
LB_13575:
	bts r12,1
LB_13576:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9458 %_12841 ⊢ %_12842 : %_12842
 ; {>  %_12841~{ 0' 1' }:{ _stg _p9430 } }
; _f9458 { 0' 1' } ⊢ °4◂{ 0' 1' }
; _some %_12842 ⊢ %_12843 : %_12843
 ; {>  %_12842~°4◂{ 0' 1' }:_p9427 }
; _some °4◂{ 0' 1' } ⊢ °0◂°4◂{ 0' 1' }
; ∎ %_12843
 ; {>  %_12843~°0◂°4◂{ 0' 1' }:(_opn)◂(_p9427) }
; 	∎ °0◂°4◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°4◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_13552
	btr r12,2
	jmp LB_13553
LB_13552:
	bts r12,2
LB_13553:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_13550
	btr QWORD [rdi],0
	jmp LB_13551
LB_13550:
	bts QWORD [rdi],0
LB_13551:
	mov r8,r14
	bt r12,1
	jc LB_13556
	btr r12,2
	jmp LB_13557
LB_13556:
	bts r12,2
LB_13557:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_13554
	btr QWORD [rdi],1
	jmp LB_13555
LB_13554:
	bts QWORD [rdi],1
LB_13555:
	mov rsi,1
	bt r12,3
	jc LB_13548
	mov rsi,0
	bt r9,0
	jc LB_13548
	jmp LB_13549
LB_13548:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13549:
	mov rax,0x0400_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13558:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13560
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13559
LB_13560:
	add rsp,8
	ret
LB_13561:
	add rsp,16
	pop r14
LB_13559:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13580
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "dt_etr 0" _ ⊢ 0' : %_12844
	mov rdi,8
	call mlc_s8
	mov rdi,rax
	mov rax,0x_30_20_72_74_65_5f_74_64
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_00_00
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_12844 ⊢ %_12845 : %_12845
 ; {>  %_12844~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_12846 : %_12846
 ; {>  %_12845~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_12846
 ; {>  %_12846~°1◂{  }:(_opn)◂(t6342'(0)) %_12845~0':_stg }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_13579
	mov rdi,r13
	call dlt
LB_13579:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_13580:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13582
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13581
LB_13582:
	add rsp,8
	ret
LB_13583:
	add rsp,0
	pop r14
LB_13581:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12753:
NS_E_RDI_12753:
NS_E_12753_ETR_TBL:
NS_E_12753_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; word
	jmp LB_13617
LB_13616:
	add r14,1
LB_13617:
	cmp r14,r10
	jge LB_13618
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13616
	cmp al,10
	jz LB_13616
	cmp al,32
	jz LB_13616
LB_13618:
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13619
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13598
LB_13619:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_13622
LB_13621:
	add r14,1
LB_13622:
	cmp r14,r10
	jge LB_13623
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13621
	cmp al,10
	jz LB_13621
	cmp al,32
	jz LB_13621
LB_13623:
	push r10
	call NS_E_12755_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13624
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13625
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13625:
	jmp LB_13598
LB_13624:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "="
	jmp LB_13628
LB_13627:
	add r14,1
LB_13628:
	cmp r14,r10
	jge LB_13629
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13627
	cmp al,10
	jz LB_13627
	cmp al,32
	jz LB_13627
LB_13629:
	add r14,1
	cmp r14,r10
	jg LB_13634
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_13634
	jmp LB_13635
LB_13634:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13631
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13631:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13632
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13632:
	jmp LB_13598
LB_13635:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_13609
LB_13608:
	add r14,1
LB_13609:
	cmp r14,r10
	jge LB_13610
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13608
	cmp al,10
	jz LB_13608
	cmp al,32
	jz LB_13608
LB_13610:
	push r10
	call NS_E_12432_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13611
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_13612
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_13612:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13613
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13613:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13614
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13614:
	jmp LB_13599
LB_13611:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_13606
	btr r12,3
	jmp LB_13607
LB_13606:
	bts r12,3
LB_13607:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13604
	btr r12,2
	jmp LB_13605
LB_13604:
	bts r12,2
LB_13605:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13602
	btr r12,1
	jmp LB_13603
LB_13602:
	bts r12,1
LB_13603:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13600
	btr r12,0
	jmp LB_13601
LB_13600:
	bts r12,0
LB_13601:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_13595
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_13636
	btr r12,4
	jmp LB_13637
LB_13636:
	bts r12,4
LB_13637:
	mov r8,r9
	bt r12,3
	jc LB_13638
	btr r12,2
	jmp LB_13639
LB_13638:
	bts r12,2
LB_13639:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f9466 %_12849 ⊢ %_12850 : %_12850
 ; {>  %_12847~0':_stg %_12848~1':_p12754 %_12849~2':_p9444 }
; _f9466 2' ⊢ °1◂2'
; _some { %_12847 %_12850 } ⊢ %_12851 : %_12851
 ; {>  %_12847~0':_stg %_12850~°1◂2':_p9430 %_12848~1':_p12754 }
; _some { 0' °1◂2' } ⊢ °0◂{ 0' °1◂2' }
; ∎ %_12851
 ; {>  %_12851~°0◂{ 0' °1◂2' }:(_opn)◂({ _stg _p9430 }) %_12848~1':_p12754 }
; 	∎ °0◂{ 0' °1◂2' }
	bt r12,1
	jc LB_13584
	mov rdi,r14
	call dlt
LB_13584:
; _emt_mov_ptn_to_ptn:{| 1010.. |},°0◂{ 0' °1◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_13587
	btr r12,1
	jmp LB_13588
LB_13587:
	bts r12,1
LB_13588:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_13585
	btr QWORD [rdi],0
	jmp LB_13586
LB_13585:
	bts QWORD [rdi],0
LB_13586:
	mov r14,r8
	bt r12,2
	jc LB_13593
	btr r12,1
	jmp LB_13594
LB_13593:
	bts r12,1
LB_13594:
	mov rsi,1
	bt r12,1
	jc LB_13591
	mov rsi,0
	bt r14,0
	jc LB_13591
	jmp LB_13592
LB_13591:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_13592:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_13589
	btr QWORD [rdi],1
	jmp LB_13590
LB_13589:
	bts QWORD [rdi],1
LB_13590:
	mov r8,0
	bts r12,2
	ret
LB_13595:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13597
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13596
LB_13597:
	add rsp,8
	ret
LB_13599:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13598:
	add rsp,64
	pop r14
LB_13596:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,112
; word
	jmp LB_13686
LB_13685:
	add r14,1
LB_13686:
	cmp r14,r10
	jge LB_13687
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13685
	cmp al,10
	jz LB_13685
	cmp al,32
	jz LB_13685
LB_13687:
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13688
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13670
LB_13688:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; dt_args
	jmp LB_13691
LB_13690:
	add r14,1
LB_13691:
	cmp r14,r10
	jge LB_13692
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13690
	cmp al,10
	jz LB_13690
	cmp al,32
	jz LB_13690
LB_13692:
	push r10
	call NS_E_12755_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13693
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13694
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13694:
	jmp LB_13670
LB_13693:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\136\144"
	jmp LB_13697
LB_13696:
	add r14,1
LB_13697:
	cmp r14,r10
	jge LB_13698
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13696
	cmp al,10
	jz LB_13696
	cmp al,32
	jz LB_13696
LB_13698:
	add r14,3
	cmp r14,r10
	jg LB_13703
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_13703
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_13703
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_13703
	jmp LB_13704
LB_13703:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13700
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13700:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13701
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13701:
	jmp LB_13670
LB_13704:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; word
	jmp LB_13706
LB_13705:
	add r14,1
LB_13706:
	cmp r14,r10
	jge LB_13707
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13705
	cmp al,10
	jz LB_13705
	cmp al,32
	jz LB_13705
LB_13707:
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13708
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_13709
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_13709:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13710
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13710:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13711
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13711:
	jmp LB_13670
LB_13708:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; ":"
	jmp LB_13714
LB_13713:
	add r14,1
LB_13714:
	cmp r14,r10
	jge LB_13715
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13713
	cmp al,10
	jz LB_13713
	cmp al,32
	jz LB_13713
LB_13715:
	add r14,1
	cmp r14,r10
	jg LB_13722
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_13722
	jmp LB_13723
LB_13722:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_13717
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_13717:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_13718
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_13718:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13719
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13719:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13720
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13720:
	jmp LB_13670
LB_13723:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; type
	jmp LB_13725
LB_13724:
	add r14,1
LB_13725:
	cmp r14,r10
	jge LB_13726
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13724
	cmp al,10
	jz LB_13724
	cmp al,32
	jz LB_13724
LB_13726:
	push r10
	call NS_E_12432_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13727
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_13728
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_13728:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_13729
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_13729:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_13730
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_13730:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13731
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13731:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13732
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13732:
	jmp LB_13670
LB_13727:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
; dt_etr_coprd
	jmp LB_13735
LB_13734:
	add r14,1
LB_13735:
	cmp r14,r10
	jge LB_13736
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13734
	cmp al,10
	jz LB_13734
	cmp al,32
	jz LB_13734
LB_13736:
	push r10
	call NS_E_12757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13737
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*5]
	bt rsi,0
	jc LB_13738
	mov rdi,QWORD [rsp+16*5+8*1]
	call dlt
LB_13738:
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_13739
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_13739:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_13740
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_13740:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_13741
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_13741:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13742
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13742:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13743
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13743:
	jmp LB_13670
LB_13737:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*6],rax
	mov QWORD [rsp+8*1+16*6],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*6]
	bt rax,0
	jc LB_13683
	btr r12,6
	jmp LB_13684
LB_13683:
	bts r12,6
LB_13684:
	mov rax,QWORD [rsp+16*6+8*1]
	mov rcx,rax
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_13681
	btr r12,5
	jmp LB_13682
LB_13681:
	bts r12,5
LB_13682:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_13679
	btr r12,4
	jmp LB_13680
LB_13679:
	bts r12,4
LB_13680:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_13677
	btr r12,3
	jmp LB_13678
LB_13677:
	bts r12,3
LB_13678:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13675
	btr r12,2
	jmp LB_13676
LB_13675:
	bts r12,2
LB_13676:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13673
	btr r12,1
	jmp LB_13674
LB_13673:
	bts r12,1
LB_13674:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13671
	btr r12,0
	jmp LB_13672
LB_13671:
	bts r12,0
LB_13672:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,112
	push rdi
	push rsi
	push LB_13667
; _emt_mov_ptn_to_ptn:{| 11111110.. |},{ 0' 1' 2' 3' 4' 5' 6' } ⊢ { 0' 1' {  } 2' {  } 3' 4' }
	mov rdx,r10
	bt r12,4
	jc LB_13745
	btr r12,7
	jmp LB_13746
LB_13745:
	bts r12,7
LB_13746:
	mov r10,rcx
	bt r12,6
	jc LB_13747
	btr r12,4
	jmp LB_13748
LB_13747:
	bts r12,4
LB_13748:
	mov rcx,r9
	bt r12,3
	jc LB_13749
	btr r12,6
	jmp LB_13750
LB_13749:
	bts r12,6
LB_13750:
	mov r9,r11
	bt r12,5
	jc LB_13751
	btr r12,3
	jmp LB_13752
LB_13751:
	bts r12,3
LB_13752:
	mov r11,r8
	bt r12,2
	jc LB_13753
	btr r12,5
	jmp LB_13754
LB_13753:
	bts r12,5
LB_13754:
	mov r8,rcx
	bt r12,6
	jc LB_13755
	btr r12,2
	jmp LB_13756
LB_13755:
	bts r12,2
LB_13756:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_12854 %_12855 } %_12856 } ⊢ %_12857 : %_12857
 ; {>  %_12853~1':_p12754 %_12856~4':(_lst)◂({ _stg _p9444 }) %_12854~2':_stg %_12855~3':_p9444 %_12852~0':_stg }
; _cns { { 2' 3' } 4' } ⊢ °0◂{ { 2' 3' } 4' }
; _f9465 %_12857 ⊢ %_12858 : %_12858
 ; {>  %_12853~1':_p12754 %_12857~°0◂{ { 2' 3' } 4' }:(_lst)◂({ _stg _p9444 }) %_12852~0':_stg }
; _f9465 °0◂{ { 2' 3' } 4' } ⊢ °0◂°0◂{ { 2' 3' } 4' }
; _some { %_12852 %_12858 } ⊢ %_12859 : %_12859
 ; {>  %_12853~1':_p12754 %_12858~°0◂°0◂{ { 2' 3' } 4' }:_p9430 %_12852~0':_stg }
; _some { 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
; ∎ %_12859
 ; {>  %_12853~1':_p12754 %_12859~°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }:(_opn)◂({ _stg _p9430 }) }
; 	∎ °0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } }
	bt r12,1
	jc LB_13640
	mov rdi,r14
	call dlt
LB_13640:
; _emt_mov_ptn_to_ptn:{| 101110.. |},°0◂{ 0' °0◂°0◂{ { 2' 3' } 4' } } ⊢ 2'◂3'
	mov r14,r9
	bt r12,3
	jc LB_13641
	btr r12,1
	jmp LB_13642
LB_13641:
	bts r12,1
LB_13642:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r13
	bt r12,0
	jc LB_13645
	btr r12,5
	jmp LB_13646
LB_13645:
	bts r12,5
LB_13646:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_13643
	btr QWORD [rdi],0
	jmp LB_13644
LB_13643:
	bts QWORD [rdi],0
LB_13644:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rcx,r8
	bt r12,2
	jc LB_13657
	btr r12,6
	jmp LB_13658
LB_13657:
	bts r12,6
LB_13658:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_13655
	btr QWORD [rdi],0
	jmp LB_13656
LB_13655:
	bts QWORD [rdi],0
LB_13656:
	mov rcx,r14
	bt r12,1
	jc LB_13661
	btr r12,6
	jmp LB_13662
LB_13661:
	bts r12,6
LB_13662:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_13659
	btr QWORD [rdi],1
	jmp LB_13660
LB_13659:
	bts QWORD [rdi],1
LB_13660:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_13653
	btr QWORD [rdi],0
	jmp LB_13654
LB_13653:
	bts QWORD [rdi],0
LB_13654:
	mov r13,r10
	bt r12,4
	jc LB_13665
	btr r12,0
	jmp LB_13666
LB_13665:
	bts r12,0
LB_13666:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_13663
	btr QWORD [rdi],1
	jmp LB_13664
LB_13663:
	bts QWORD [rdi],1
LB_13664:
	mov rsi,1
	bt r12,5
	jc LB_13651
	mov rsi,0
	bt r11,0
	jc LB_13651
	jmp LB_13652
LB_13651:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_13652:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rsi,1
	bt r12,5
	jc LB_13649
	mov rsi,0
	bt r11,0
	jc LB_13649
	jmp LB_13650
LB_13649:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_13650:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_13647
	btr QWORD [rdi],1
	jmp LB_13648
LB_13647:
	bts QWORD [rdi],1
LB_13648:
	mov r8,0
	bts r12,2
	ret
LB_13667:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13669
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13668
LB_13669:
	add rsp,8
	ret
LB_13670:
	add rsp,112
	pop r14
LB_13668:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12755:
NS_E_RDI_12755:
NS_E_12755_ETR_TBL:
NS_E_12755_TBL:
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\151\130"
	jmp LB_13771
LB_13770:
	add r14,1
LB_13771:
	cmp r14,r10
	jge LB_13772
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13770
	cmp al,10
	jz LB_13770
	cmp al,32
	jz LB_13770
LB_13772:
	add r14,3
	cmp r14,r10
	jg LB_13775
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_13775
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_13775
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_13775
	jmp LB_13776
LB_13775:
	jmp LB_13757
LB_13776:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; var
	jmp LB_13765
LB_13764:
	add r14,1
LB_13765:
	cmp r14,r10
	jge LB_13766
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13764
	cmp al,10
	jz LB_13764
	cmp al,32
	jz LB_13764
LB_13766:
	push r10
	call NS_E_12436_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13767
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13768
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13768:
	jmp LB_13758
LB_13767:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0002_0000_ffff
	mov QWORD [rdi],rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13761
	btr QWORD [rdi],1
LB_13761:
	mov rax,QWORD [rsp+16*1+8*1]
	mov [rdi+8*1+8*1],rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13762
	btr QWORD [rdi],0
LB_13762:
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
LB_13758:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13757:
	add rsp,32
	pop r14
; _
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,rbx
	mov rbx,[rdi]
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
LB_13759:
	add rsp,0
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12756:
NS_E_RDI_12756:
NS_E_12756_ETR_TBL:
NS_E_12756_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_13830
LB_13829:
	add r14,1
LB_13830:
	cmp r14,r10
	jge LB_13831
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13829
	cmp al,10
	jz LB_13829
	cmp al,32
	jz LB_13829
LB_13831:
	add r14,1
	cmp r14,r10
	jg LB_13834
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_13834
	jmp LB_13835
LB_13834:
	jmp LB_13796
LB_13835:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_13807
LB_13806:
	add r14,1
LB_13807:
	cmp r14,r10
	jge LB_13808
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13806
	cmp al,10
	jz LB_13806
	cmp al,32
	jz LB_13806
LB_13808:
	add r14,1
	cmp r14,r10
	jg LB_13812
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_13812
	jmp LB_13813
LB_13812:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13810
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13810:
	jmp LB_13797
LB_13813:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dt_etr_body
	jmp LB_13815
LB_13814:
	add r14,1
LB_13815:
	cmp r14,r10
	jge LB_13816
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13814
	cmp al,10
	jz LB_13814
	cmp al,32
	jz LB_13814
LB_13816:
	push r10
	call NS_E_12753_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13817
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13818
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13818:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13819
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13819:
	jmp LB_13797
LB_13817:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; qlq_dt_etr
	jmp LB_13822
LB_13821:
	add r14,1
LB_13822:
	cmp r14,r10
	jge LB_13823
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13821
	cmp al,10
	jz LB_13821
	cmp al,32
	jz LB_13821
LB_13823:
	push r10
	call NS_E_12756_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13824
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_13825
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_13825:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13826
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13826:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13827
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13827:
	jmp LB_13797
LB_13824:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_13804
	btr r12,3
	jmp LB_13805
LB_13804:
	bts r12,3
LB_13805:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13802
	btr r12,2
	jmp LB_13803
LB_13802:
	bts r12,2
LB_13803:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13800
	btr r12,1
	jmp LB_13801
LB_13800:
	bts r12,1
LB_13801:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13798
	btr r12,0
	jmp LB_13799
LB_13798:
	bts r12,0
LB_13799:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_13793
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } { 0' 1' } 2' }
	mov r10,r8
	bt r12,2
	jc LB_13836
	btr r12,4
	jmp LB_13837
LB_13836:
	bts r12,4
LB_13837:
	mov r8,r9
	bt r12,3
	jc LB_13838
	btr r12,2
	jmp LB_13839
LB_13838:
	bts r12,2
LB_13839:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ { 0' 1' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_13842
	btr r12,3
	jmp LB_13843
LB_13842:
	bts r12,3
LB_13843:
	mov r13,r9
	bt r12,3
	jc LB_13840
	btr r12,0
	jmp LB_13841
LB_13840:
	bts r12,0
LB_13841:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_13846
	btr r12,3
	jmp LB_13847
LB_13846:
	bts r12,3
LB_13847:
	mov r14,r9
	bt r12,3
	jc LB_13844
	btr r12,1
	jmp LB_13845
LB_13844:
	bts r12,1
LB_13845:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_12862 %_12863 } ⊢ %_12864 : %_12864
 ; {>  %_12863~2':(_lst)◂({ _stg _p9430 }) %_12862~{ 0' 1' }:{ _stg _p9430 } }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_12864 ⊢ %_12865 : %_12865
 ; {>  %_12864~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p9430 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_12865
 ; {>  %_12865~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p9430 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_13783
	btr r12,5
	jmp LB_13784
LB_13783:
	bts r12,5
LB_13784:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_13781
	btr QWORD [rdi],0
	jmp LB_13782
LB_13781:
	bts QWORD [rdi],0
LB_13782:
	mov r11,r14
	bt r12,1
	jc LB_13787
	btr r12,5
	jmp LB_13788
LB_13787:
	bts r12,5
LB_13788:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_13785
	btr QWORD [rdi],1
	jmp LB_13786
LB_13785:
	bts QWORD [rdi],1
LB_13786:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_13779
	btr QWORD [rdi],0
	jmp LB_13780
LB_13779:
	bts QWORD [rdi],0
LB_13780:
	mov r10,r8
	bt r12,2
	jc LB_13791
	btr r12,4
	jmp LB_13792
LB_13791:
	bts r12,4
LB_13792:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_13789
	btr QWORD [rdi],1
	jmp LB_13790
LB_13789:
	bts QWORD [rdi],1
LB_13790:
	mov rsi,1
	bt r12,3
	jc LB_13777
	mov rsi,0
	bt r9,0
	jc LB_13777
	jmp LB_13778
LB_13777:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13778:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13793:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13795
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13794
LB_13795:
	add rsp,8
	ret
LB_13797:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13796:
	add rsp,64
	pop r14
LB_13794:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13850
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_12866 : %_12866
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_12866 ⊢ %_12867 : %_12867
 ; {>  %_12866~°1◂{  }:(_lst)◂(t6369'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12867
 ; {>  %_12867~°0◂°1◂{  }:(_opn)◂((_lst)◂(t6372'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_13848
	mov rsi,0
	bt r9,0
	jc LB_13848
	jmp LB_13849
LB_13848:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13849:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13850:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13852
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13851
LB_13852:
	add rsp,8
	ret
LB_13853:
	add rsp,0
	pop r14
LB_13851:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12757:
NS_E_RDI_12757:
NS_E_12757_ETR_TBL:
NS_E_12757_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "\226\136\144"
	jmp LB_13918
LB_13917:
	add r14,1
LB_13918:
	cmp r14,r10
	jge LB_13919
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13917
	cmp al,10
	jz LB_13917
	cmp al,32
	jz LB_13917
LB_13919:
	add r14,3
	cmp r14,r10
	jg LB_13922
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_13922
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_13922
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_13922
	jmp LB_13923
LB_13922:
	jmp LB_13873
LB_13923:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; word
	jmp LB_13886
LB_13885:
	add r14,1
LB_13886:
	cmp r14,r10
	jge LB_13887
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13885
	cmp al,10
	jz LB_13885
	cmp al,32
	jz LB_13885
LB_13887:
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13888
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13889
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13889:
	jmp LB_13874
LB_13888:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ":"
	jmp LB_13892
LB_13891:
	add r14,1
LB_13892:
	cmp r14,r10
	jge LB_13893
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13891
	cmp al,10
	jz LB_13891
	cmp al,32
	jz LB_13891
LB_13893:
	add r14,1
	cmp r14,r10
	jg LB_13898
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_13898
	jmp LB_13899
LB_13898:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13895
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13895:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13896
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13896:
	jmp LB_13874
LB_13899:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; type
	jmp LB_13901
LB_13900:
	add r14,1
LB_13901:
	cmp r14,r10
	jge LB_13902
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13900
	cmp al,10
	jz LB_13900
	cmp al,32
	jz LB_13900
LB_13902:
	push r10
	call NS_E_12432_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13903
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_13904
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_13904:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13905
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13905:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13906
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13906:
	jmp LB_13874
LB_13903:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dt_etr_coprd
	jmp LB_13909
LB_13908:
	add r14,1
LB_13909:
	cmp r14,r10
	jge LB_13910
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13908
	cmp al,10
	jz LB_13908
	cmp al,32
	jz LB_13908
LB_13910:
	push r10
	call NS_E_12757_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_13911
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_13912
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_13912:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_13913
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_13913:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_13914
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_13914:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13915
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13915:
	jmp LB_13874
LB_13911:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_13883
	btr r12,4
	jmp LB_13884
LB_13883:
	bts r12,4
LB_13884:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_13881
	btr r12,3
	jmp LB_13882
LB_13881:
	bts r12,3
LB_13882:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13879
	btr r12,2
	jmp LB_13880
LB_13879:
	bts r12,2
LB_13880:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13877
	btr r12,1
	jmp LB_13878
LB_13877:
	bts r12,1
LB_13878:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13875
	btr r12,0
	jmp LB_13876
LB_13875:
	bts r12,0
LB_13876:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_13870
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_13924
	btr r12,5
	jmp LB_13925
LB_13924:
	bts r12,5
LB_13925:
	mov r8,r10
	bt r12,4
	jc LB_13926
	btr r12,2
	jmp LB_13927
LB_13926:
	bts r12,2
LB_13927:
	mov r10,r14
	bt r12,1
	jc LB_13928
	btr r12,4
	jmp LB_13929
LB_13928:
	bts r12,4
LB_13929:
	mov r14,r9
	bt r12,3
	jc LB_13930
	btr r12,1
	jmp LB_13931
LB_13930:
	bts r12,1
LB_13931:
	mov r9,r13
	bt r12,0
	jc LB_13932
	btr r12,3
	jmp LB_13933
LB_13932:
	bts r12,3
LB_13933:
	mov r13,r10
	bt r12,4
	jc LB_13934
	btr r12,0
	jmp LB_13935
LB_13934:
	bts r12,0
LB_13935:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _cns { { %_12868 %_12869 } %_12870 } ⊢ %_12871 : %_12871
 ; {>  %_12868~0':_stg %_12869~1':_p9444 %_12870~2':(_lst)◂({ _stg _p9444 }) }
; _cns { { 0' 1' } 2' } ⊢ °0◂{ { 0' 1' } 2' }
; _some %_12871 ⊢ %_12872 : %_12872
 ; {>  %_12871~°0◂{ { 0' 1' } 2' }:(_lst)◂({ _stg _p9444 }) }
; _some °0◂{ { 0' 1' } 2' } ⊢ °0◂°0◂{ { 0' 1' } 2' }
; ∎ %_12872
 ; {>  %_12872~°0◂°0◂{ { 0' 1' } 2' }:(_opn)◂((_lst)◂({ _stg _p9444 })) }
; 	∎ °0◂°0◂{ { 0' 1' } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ { 0' 1' } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_13860
	btr r12,5
	jmp LB_13861
LB_13860:
	bts r12,5
LB_13861:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_13858
	btr QWORD [rdi],0
	jmp LB_13859
LB_13858:
	bts QWORD [rdi],0
LB_13859:
	mov r11,r14
	bt r12,1
	jc LB_13864
	btr r12,5
	jmp LB_13865
LB_13864:
	bts r12,5
LB_13865:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_13862
	btr QWORD [rdi],1
	jmp LB_13863
LB_13862:
	bts QWORD [rdi],1
LB_13863:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_13856
	btr QWORD [rdi],0
	jmp LB_13857
LB_13856:
	bts QWORD [rdi],0
LB_13857:
	mov r10,r8
	bt r12,2
	jc LB_13868
	btr r12,4
	jmp LB_13869
LB_13868:
	bts r12,4
LB_13869:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_13866
	btr QWORD [rdi],1
	jmp LB_13867
LB_13866:
	bts QWORD [rdi],1
LB_13867:
	mov rsi,1
	bt r12,3
	jc LB_13854
	mov rsi,0
	bt r9,0
	jc LB_13854
	jmp LB_13855
LB_13854:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13855:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13870:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13872
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13871
LB_13872:
	add rsp,8
	ret
LB_13874:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13873:
	add rsp,80
	pop r14
LB_13871:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_13938
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _nil {  } ⊢ %_12873 : %_12873
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_12873 ⊢ %_12874 : %_12874
 ; {>  %_12873~°1◂{  }:(_lst)◂(t6383'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_12874
 ; {>  %_12874~°0◂°1◂{  }:(_opn)◂((_lst)◂(t6386'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_13936
	mov rsi,0
	bt r9,0
	jc LB_13936
	jmp LB_13937
LB_13936:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13937:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13938:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13940
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13939
LB_13940:
	add rsp,8
	ret
LB_13941:
	add rsp,0
	pop r14
LB_13939:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12758:
NS_E_RDI_12758:
NS_E_12758_ETR_TBL:
NS_E_12758_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "@"
	jmp LB_14032
LB_14031:
	add r14,1
LB_14032:
	cmp r14,r10
	jge LB_14033
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14031
	cmp al,10
	jz LB_14031
	cmp al,32
	jz LB_14031
LB_14033:
	add r14,1
	cmp r14,r10
	jg LB_14036
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_14036
	jmp LB_14037
LB_14036:
	jmp LB_13979
LB_14037:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_13994
LB_13993:
	add r14,1
LB_13994:
	cmp r14,r10
	jge LB_13995
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_13993
	cmp al,10
	jz LB_13993
	cmp al,32
	jz LB_13993
LB_13995:
	add r14,1
	cmp r14,r10
	jg LB_13999
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_13999
	jmp LB_14000
LB_13999:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_13997
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_13997:
	jmp LB_13980
LB_14000:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_14002
LB_14001:
	add r14,1
LB_14002:
	cmp r14,r10
	jge LB_14003
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14001
	cmp al,10
	jz LB_14001
	cmp al,32
	jz LB_14001
LB_14003:
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14004
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14005
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14005:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14006
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14006:
	jmp LB_13980
LB_14004:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_14009
LB_14008:
	add r14,1
LB_14009:
	cmp r14,r10
	jge LB_14010
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14008
	cmp al,10
	jz LB_14008
	cmp al,32
	jz LB_14008
LB_14010:
	push r10
	call NS_E_12162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14011
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14012
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14012:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14013
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14013:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14014
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14014:
	jmp LB_13980
LB_14011:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_14017
LB_14016:
	add r14,1
LB_14017:
	cmp r14,r10
	jge LB_14018
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14016
	cmp al,10
	jz LB_14016
	cmp al,32
	jz LB_14016
LB_14018:
	push r10
	call NS_E_12761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14019
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14020
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14020:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14021
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14021:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14022
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14022:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14023
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14023:
	jmp LB_13980
LB_14019:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
; ⟦ qlq_etr ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_14029:
	jmp LB_14026
LB_14025:
	add r14,1
LB_14026:
	cmp r14,r10
	jge LB_14027
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14025
	cmp al,10
	jz LB_14025
	cmp al,32
	jz LB_14025
LB_14027:
	push r10
	push rsi
	call NS_E_12759_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_14028
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_14030
	bts QWORD [rax],0
LB_14030:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_14029
LB_14028:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*5],0
	mov QWORD [rsp+8*1+16*5],rsi
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_13991
	btr r12,5
	jmp LB_13992
LB_13991:
	bts r12,5
LB_13992:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_13989
	btr r12,4
	jmp LB_13990
LB_13989:
	bts r12,4
LB_13990:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_13987
	btr r12,3
	jmp LB_13988
LB_13987:
	bts r12,3
LB_13988:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_13985
	btr r12,2
	jmp LB_13986
LB_13985:
	bts r12,2
LB_13986:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_13983
	btr r12,1
	jmp LB_13984
LB_13983:
	bts r12,1
LB_13984:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_13981
	btr r12,0
	jmp LB_13982
LB_13981:
	bts r12,0
LB_13982:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_13976
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } {  } 0' 1' 2' 3' }
	mov rcx,r9
	bt r12,3
	jc LB_14038
	btr r12,6
	jmp LB_14039
LB_14038:
	bts r12,6
LB_14039:
	mov r9,r11
	bt r12,5
	jc LB_14040
	btr r12,3
	jmp LB_14041
LB_14040:
	bts r12,3
LB_14041:
	mov r11,r8
	bt r12,2
	jc LB_14042
	btr r12,5
	jmp LB_14043
LB_14042:
	bts r12,5
LB_14043:
	mov r8,r10
	bt r12,4
	jc LB_14044
	btr r12,2
	jmp LB_14045
LB_14044:
	bts r12,2
LB_14045:
	mov r10,r14
	bt r12,1
	jc LB_14046
	btr r12,4
	jmp LB_14047
LB_14046:
	bts r12,4
LB_14047:
	mov r14,rcx
	bt r12,6
	jc LB_14048
	btr r12,1
	jmp LB_14049
LB_14048:
	bts r12,1
LB_14049:
	mov rcx,r13
	bt r12,0
	jc LB_14050
	btr r12,6
	jmp LB_14051
LB_14050:
	bts r12,6
LB_14051:
	mov r13,r11
	bt r12,5
	jc LB_14052
	btr r12,0
	jmp LB_14053
LB_14052:
	bts r12,0
LB_14053:
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f8753 %_12878 ⊢ %_12879 : %_12879
 ; {>  %_12878~3':(_lst)◂({ _stg _p9443 _p9446 }) %_12875~0':_stg %_12877~2':_p9446 %_12876~1':_p9443 }
; _f8753 3' ⊢ 3'
; push_iv 
	sub rsp,32
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00010.. |},3' ⊢ 0'
	mov r13,r9
	bt r12,3
	jc LB_13948
	btr r12,0
	jmp LB_13949
LB_13948:
	bts r12,0
LB_13949:
	call NS_E_8753
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 3'
	mov r9,r13
	bt r12,0
	jc LB_13950
	btr r12,3
	jmp LB_13951
LB_13950:
	bts r12,3
LB_13951:
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_13946
	btr r12,2
	jmp LB_13947
LB_13946:
	bts r12,2
LB_13947:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_13944
	btr r12,1
	jmp LB_13945
LB_13944:
	bts r12,1
LB_13945:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_13942
	btr r12,0
	jmp LB_13943
LB_13942:
	bts r12,0
LB_13943:
	add rsp,32
; _cns { { %_12875 %_12876 %_12877 } %_12879 } ⊢ %_12880 : %_12880
 ; {>  %_12879~3':(_lst)◂({ _stg _p9443 _p9446 }) %_12875~0':_stg %_12877~2':_p9446 %_12876~1':_p9443 }
; _cns { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _f9457 %_12880 ⊢ %_12881 : %_12881
 ; {>  %_12880~°0◂{ { 0' 1' 2' } 3' }:(_lst)◂({ _stg _p9443 _p9446 }) }
; _f9457 °0◂{ { 0' 1' 2' } 3' } ⊢ °3◂°0◂{ { 0' 1' 2' } 3' }
; _some %_12881 ⊢ %_12882 : %_12882
 ; {>  %_12881~°3◂°0◂{ { 0' 1' 2' } 3' }:_p9427 }
; _some °3◂°0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_12882
 ; {>  %_12882~°0◂°3◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p9427) }
; 	∎ °0◂°3◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°3◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_13952
	btr r12,4
	jmp LB_13953
LB_13952:
	bts r12,4
LB_13953:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_13962
	btr r12,6
	jmp LB_13963
LB_13962:
	bts r12,6
LB_13963:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_13960
	btr QWORD [rdi],0
	jmp LB_13961
LB_13960:
	bts QWORD [rdi],0
LB_13961:
	mov rcx,r14
	bt r12,1
	jc LB_13966
	btr r12,6
	jmp LB_13967
LB_13966:
	bts r12,6
LB_13967:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_13964
	btr QWORD [rdi],1
	jmp LB_13965
LB_13964:
	bts QWORD [rdi],1
LB_13965:
	mov rcx,r8
	bt r12,2
	jc LB_13970
	btr r12,6
	jmp LB_13971
LB_13970:
	bts r12,6
LB_13971:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_13968
	btr QWORD [rdi],2
	jmp LB_13969
LB_13968:
	bts QWORD [rdi],2
LB_13969:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_13958
	btr QWORD [rdi],0
	jmp LB_13959
LB_13958:
	bts QWORD [rdi],0
LB_13959:
	mov r11,r10
	bt r12,4
	jc LB_13974
	btr r12,5
	jmp LB_13975
LB_13974:
	bts r12,5
LB_13975:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_13972
	btr QWORD [rdi],1
	jmp LB_13973
LB_13972:
	bts QWORD [rdi],1
LB_13973:
	mov rsi,1
	bt r12,3
	jc LB_13956
	mov rsi,0
	bt r9,0
	jc LB_13956
	jmp LB_13957
LB_13956:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13957:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov rsi,1
	bt r12,3
	jc LB_13954
	mov rsi,0
	bt r9,0
	jc LB_13954
	jmp LB_13955
LB_13954:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_13955:
	mov rax,0x0300_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_13976:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_13978
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_13977
LB_13978:
	add rsp,8
	ret
LB_13980:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_13979:
	add rsp,96
	pop r14
LB_13977:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_14073
LB_14072:
	add r14,1
LB_14073:
	cmp r14,r10
	jge LB_14074
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14072
	cmp al,10
	jz LB_14072
	cmp al,32
	jz LB_14072
LB_14074:
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14075
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14067
LB_14075:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_etr_def
	jmp LB_14078
LB_14077:
	add r14,1
LB_14078:
	cmp r14,r10
	jge LB_14079
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14077
	cmp al,10
	jz LB_14077
	cmp al,32
	jz LB_14077
LB_14079:
	push r10
	call NS_E_12760_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14080
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14081
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14081:
	jmp LB_14067
LB_14080:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14070
	btr r12,1
	jmp LB_14071
LB_14070:
	bts r12,1
LB_14071:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14068
	btr r12,0
	jmp LB_14069
LB_14068:
	bts r12,0
LB_14069:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14064
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f9456 { %_12883 %_12884 } ⊢ %_12885 : %_12885
 ; {>  %_12883~0':_stg %_12884~1':_p9429 }
; _f9456 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_12885 ⊢ %_12886 : %_12886
 ; {>  %_12885~°2◂{ 0' 1' }:_p9427 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_12886
 ; {>  %_12886~°0◂°2◂{ 0' 1' }:(_opn)◂(_p9427) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_14058
	btr r12,2
	jmp LB_14059
LB_14058:
	bts r12,2
LB_14059:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_14056
	btr QWORD [rdi],0
	jmp LB_14057
LB_14056:
	bts QWORD [rdi],0
LB_14057:
	mov r8,r14
	bt r12,1
	jc LB_14062
	btr r12,2
	jmp LB_14063
LB_14062:
	bts r12,2
LB_14063:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_14060
	btr QWORD [rdi],1
	jmp LB_14061
LB_14060:
	bts QWORD [rdi],1
LB_14061:
	mov rsi,1
	bt r12,3
	jc LB_14054
	mov rsi,0
	bt r9,0
	jc LB_14054
	jmp LB_14055
LB_14054:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14055:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14064:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14066
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14065
LB_14066:
	add rsp,8
	ret
LB_14067:
	add rsp,32
	pop r14
LB_14065:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_14084
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; 	» "lc_etr_body 0" _ ⊢ 0' : %_12887
	mov rdi,13
	call mlc_s8
	mov rdi,rax
	mov rax,0x_62_5f_72_74_65_5f_63_6c
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_30_20_79_64_6f
	mov QWORD [rdi+8*1+8*1],rax
	mov r13,rdi
	btr r12,0
; _f26 %_12887 ⊢ %_12888 : %_12888
 ; {>  %_12887~0':_stg }
; _f26 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _none {  } ⊢ %_12889 : %_12889
 ; {>  %_12888~0':_stg }
; _none {  } ⊢ °1◂{  }
; ∎ %_12889
 ; {>  %_12888~0':_stg %_12889~°1◂{  }:(_opn)◂(t6409'(0)) }
; 	∎ °1◂{  }
	bt r12,0
	jc LB_14083
	mov rdi,r13
	call dlt
LB_14083:
; _emt_mov_ptn_to_ptn:{| 0.. |},°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,1
	bts r12,2
	ret
LB_14084:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14086
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14085
LB_14086:
	add rsp,8
	ret
LB_14087:
	add rsp,0
	pop r14
LB_14085:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12759:
NS_E_RDI_12759:
NS_E_12759_ETR_TBL:
NS_E_12759_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "@"
	jmp LB_14115
LB_14114:
	add r14,1
LB_14115:
	cmp r14,r10
	jge LB_14116
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14114
	cmp al,10
	jz LB_14114
	cmp al,32
	jz LB_14114
LB_14116:
	add r14,1
	cmp r14,r10
	jg LB_14119
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_14119
	jmp LB_14120
LB_14119:
	jmp LB_14103
LB_14120:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_14122
LB_14121:
	add r14,1
LB_14122:
	cmp r14,r10
	jge LB_14123
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14121
	cmp al,10
	jz LB_14121
	cmp al,32
	jz LB_14121
LB_14123:
	add r14,1
	cmp r14,r10
	jg LB_14127
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_14127
	jmp LB_14128
LB_14127:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14125
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14125:
	jmp LB_14103
LB_14128:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_14130
LB_14129:
	add r14,1
LB_14130:
	cmp r14,r10
	jge LB_14131
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14129
	cmp al,10
	jz LB_14129
	cmp al,32
	jz LB_14129
LB_14131:
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14132
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14133
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14133:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14134
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14134:
	jmp LB_14103
LB_14132:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; dst_ptn
	jmp LB_14137
LB_14136:
	add r14,1
LB_14137:
	cmp r14,r10
	jge LB_14138
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14136
	cmp al,10
	jz LB_14136
	cmp al,32
	jz LB_14136
LB_14138:
	push r10
	call NS_E_12162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14139
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14140
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14140:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14141
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14141:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14142
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14142:
	jmp LB_14103
LB_14139:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; lc_code
	jmp LB_14145
LB_14144:
	add r14,1
LB_14145:
	cmp r14,r10
	jge LB_14146
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14144
	cmp al,10
	jz LB_14144
	cmp al,32
	jz LB_14144
LB_14146:
	push r10
	call NS_E_12761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14147
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14148
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14148:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14149
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14149:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14150
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14150:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14151
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14151:
	jmp LB_14103
LB_14147:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_14112
	btr r12,4
	jmp LB_14113
LB_14112:
	bts r12,4
LB_14113:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14110
	btr r12,3
	jmp LB_14111
LB_14110:
	bts r12,3
LB_14111:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14108
	btr r12,2
	jmp LB_14109
LB_14108:
	bts r12,2
LB_14109:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14106
	btr r12,1
	jmp LB_14107
LB_14106:
	bts r12,1
LB_14107:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14104
	btr r12,0
	jmp LB_14105
LB_14104:
	bts r12,0
LB_14105:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_14100
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_14153
	btr r12,5
	jmp LB_14154
LB_14153:
	bts r12,5
LB_14154:
	mov r8,r10
	bt r12,4
	jc LB_14155
	btr r12,2
	jmp LB_14156
LB_14155:
	bts r12,2
LB_14156:
	mov r10,r14
	bt r12,1
	jc LB_14157
	btr r12,4
	jmp LB_14158
LB_14157:
	bts r12,4
LB_14158:
	mov r14,r9
	bt r12,3
	jc LB_14159
	btr r12,1
	jmp LB_14160
LB_14159:
	bts r12,1
LB_14160:
	mov r9,r13
	bt r12,0
	jc LB_14161
	btr r12,3
	jmp LB_14162
LB_14161:
	bts r12,3
LB_14162:
	mov r13,r11
	bt r12,5
	jc LB_14163
	btr r12,0
	jmp LB_14164
LB_14163:
	bts r12,0
LB_14164:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_12890 %_12891 %_12892 } ⊢ %_12893 : %_12893
 ; {>  %_12891~1':_p9443 %_12892~2':_p9446 %_12890~0':_stg }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_12893
 ; {>  %_12893~°0◂{ 0' 1' 2' }:(_opn)◂({ _stg _p9443 _p9446 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_14090
	btr r12,4
	jmp LB_14091
LB_14090:
	bts r12,4
LB_14091:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_14088
	btr QWORD [rdi],0
	jmp LB_14089
LB_14088:
	bts QWORD [rdi],0
LB_14089:
	mov r10,r14
	bt r12,1
	jc LB_14094
	btr r12,4
	jmp LB_14095
LB_14094:
	bts r12,4
LB_14095:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_14092
	btr QWORD [rdi],1
	jmp LB_14093
LB_14092:
	bts QWORD [rdi],1
LB_14093:
	mov r10,r8
	bt r12,2
	jc LB_14098
	btr r12,4
	jmp LB_14099
LB_14098:
	bts r12,4
LB_14099:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_14096
	btr QWORD [rdi],2
	jmp LB_14097
LB_14096:
	bts QWORD [rdi],2
LB_14097:
	mov r8,0
	bts r12,2
	ret
LB_14100:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14102
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14101
LB_14102:
	add rsp,8
	ret
LB_14103:
	add rsp,80
	pop r14
LB_14101:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12760:
NS_E_RDI_12760:
NS_E_12760_ETR_TBL:
NS_E_12760_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "="
	jmp LB_14185
LB_14184:
	add r14,1
LB_14185:
	cmp r14,r10
	jge LB_14186
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14184
	cmp al,10
	jz LB_14184
	cmp al,32
	jz LB_14184
LB_14186:
	add r14,1
	cmp r14,r10
	jg LB_14189
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_14189
	jmp LB_14190
LB_14189:
	jmp LB_14172
LB_14190:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; cst
	jmp LB_14179
LB_14178:
	add r14,1
LB_14179:
	cmp r14,r10
	jge LB_14180
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14178
	cmp al,10
	jz LB_14178
	cmp al,32
	jz LB_14178
LB_14180:
	push r10
	call NS_E_11769_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14181
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14182
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14182:
	jmp LB_14173
LB_14181:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14176
	btr r12,1
	jmp LB_14177
LB_14176:
	bts r12,1
LB_14177:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14174
	btr r12,0
	jmp LB_14175
LB_14174:
	bts r12,0
LB_14175:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14169
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_14191
	btr r12,2
	jmp LB_14192
LB_14191:
	bts r12,2
LB_14192:
	mov r13,r14
	bt r12,1
	jc LB_14193
	btr r12,0
	jmp LB_14194
LB_14193:
	bts r12,0
LB_14194:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9463 %_12894 ⊢ %_12895 : %_12895
 ; {>  %_12894~0':_p9445 }
; _f9463 0' ⊢ °1◂0'
; _some %_12895 ⊢ %_12896 : %_12896
 ; {>  %_12895~°1◂0':_p9429 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12896
 ; {>  %_12896~°0◂°1◂0':(_opn)◂(_p9429) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14167
	btr r12,3
	jmp LB_14168
LB_14167:
	bts r12,3
LB_14168:
	mov rsi,1
	bt r12,3
	jc LB_14165
	mov rsi,0
	bt r9,0
	jc LB_14165
	jmp LB_14166
LB_14165:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14166:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14169:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14171
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14170
LB_14171:
	add rsp,8
	ret
LB_14173:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14172:
	add rsp,32
	pop r14
LB_14170:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\171"
	jmp LB_14215
LB_14214:
	add r14,1
LB_14215:
	cmp r14,r10
	jge LB_14216
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14214
	cmp al,10
	jz LB_14214
	cmp al,32
	jz LB_14214
LB_14216:
	add r14,2
	cmp r14,r10
	jg LB_14219
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_14219
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,171
	jnz LB_14219
	jmp LB_14220
LB_14219:
	jmp LB_14202
LB_14220:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_code
	jmp LB_14209
LB_14208:
	add r14,1
LB_14209:
	cmp r14,r10
	jge LB_14210
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14208
	cmp al,10
	jz LB_14208
	cmp al,32
	jz LB_14208
LB_14210:
	push r10
	call NS_E_12761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14211
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14212
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14212:
	jmp LB_14203
LB_14211:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14206
	btr r12,1
	jmp LB_14207
LB_14206:
	bts r12,1
LB_14207:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14204
	btr r12,0
	jmp LB_14205
LB_14204:
	bts r12,0
LB_14205:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14199
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_14221
	btr r12,2
	jmp LB_14222
LB_14221:
	bts r12,2
LB_14222:
	mov r13,r14
	bt r12,1
	jc LB_14223
	btr r12,0
	jmp LB_14224
LB_14223:
	bts r12,0
LB_14224:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9464 %_12897 ⊢ %_12898 : %_12898
 ; {>  %_12897~0':_p9446 }
; _f9464 0' ⊢ °2◂0'
; _some %_12898 ⊢ %_12899 : %_12899
 ; {>  %_12898~°2◂0':_p9429 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_12899
 ; {>  %_12899~°0◂°2◂0':(_opn)◂(_p9429) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14197
	btr r12,3
	jmp LB_14198
LB_14197:
	bts r12,3
LB_14198:
	mov rsi,1
	bt r12,3
	jc LB_14195
	mov rsi,0
	bt r9,0
	jc LB_14195
	jmp LB_14196
LB_14195:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14196:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14199:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14201
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14200
LB_14201:
	add rsp,8
	ret
LB_14203:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14202:
	add rsp,32
	pop r14
LB_14200:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; dst_ptn
	jmp LB_14244
LB_14243:
	add r14,1
LB_14244:
	cmp r14,r10
	jge LB_14245
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14243
	cmp al,10
	jz LB_14243
	cmp al,32
	jz LB_14243
LB_14245:
	push r10
	call NS_E_12162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14246
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14238
LB_14246:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_14249
LB_14248:
	add r14,1
LB_14249:
	cmp r14,r10
	jge LB_14250
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14248
	cmp al,10
	jz LB_14248
	cmp al,32
	jz LB_14248
LB_14250:
	push r10
	call NS_E_12761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14251
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14252
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14252:
	jmp LB_14238
LB_14251:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14241
	btr r12,1
	jmp LB_14242
LB_14241:
	bts r12,1
LB_14242:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14239
	btr r12,0
	jmp LB_14240
LB_14239:
	bts r12,0
LB_14240:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14235
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f9462 { %_12900 %_12901 } ⊢ %_12902 : %_12902
 ; {>  %_12900~0':_p9443 %_12901~1':_p9446 }
; _f9462 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_12902 ⊢ %_12903 : %_12903
 ; {>  %_12902~°0◂{ 0' 1' }:_p9429 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_12903
 ; {>  %_12903~°0◂°0◂{ 0' 1' }:(_opn)◂(_p9429) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_14229
	btr r12,2
	jmp LB_14230
LB_14229:
	bts r12,2
LB_14230:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_14227
	btr QWORD [rdi],0
	jmp LB_14228
LB_14227:
	bts QWORD [rdi],0
LB_14228:
	mov r8,r14
	bt r12,1
	jc LB_14233
	btr r12,2
	jmp LB_14234
LB_14233:
	bts r12,2
LB_14234:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_14231
	btr QWORD [rdi],1
	jmp LB_14232
LB_14231:
	bts QWORD [rdi],1
LB_14232:
	mov rsi,1
	bt r12,3
	jc LB_14225
	mov rsi,0
	bt r9,0
	jc LB_14225
	jmp LB_14226
LB_14225:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14226:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14235:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14237
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14236
LB_14237:
	add rsp,8
	ret
LB_14238:
	add rsp,32
	pop r14
LB_14236:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12761:
NS_E_RDI_12761:
NS_E_12761_ETR_TBL:
NS_E_12761_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\226\136\142"
	jmp LB_14274
LB_14273:
	add r14,1
LB_14274:
	cmp r14,r10
	jge LB_14275
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14273
	cmp al,10
	jz LB_14273
	cmp al,32
	jz LB_14273
LB_14275:
	add r14,3
	cmp r14,r10
	jg LB_14278
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14278
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_14278
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,142
	jnz LB_14278
	jmp LB_14279
LB_14278:
	jmp LB_14261
LB_14279:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_14268
LB_14267:
	add r14,1
LB_14268:
	cmp r14,r10
	jge LB_14269
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14267
	cmp al,10
	jz LB_14267
	cmp al,32
	jz LB_14267
LB_14269:
	push r10
	call NS_E_11898_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14270
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14271
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14271:
	jmp LB_14262
LB_14270:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14265
	btr r12,1
	jmp LB_14266
LB_14265:
	bts r12,1
LB_14266:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14263
	btr r12,0
	jmp LB_14264
LB_14263:
	bts r12,0
LB_14264:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14258
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_14280
	btr r12,2
	jmp LB_14281
LB_14280:
	bts r12,2
LB_14281:
	mov r13,r14
	bt r12,1
	jc LB_14282
	btr r12,0
	jmp LB_14283
LB_14282:
	bts r12,0
LB_14283:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9505 %_12904 ⊢ %_12905 : %_12905
 ; {>  %_12904~0':_p9442 }
; _f9505 0' ⊢ °2◂0'
; _some %_12905 ⊢ %_12906 : %_12906
 ; {>  %_12905~°2◂0':_p9446 }
; _some °2◂0' ⊢ °0◂°2◂0'
; ∎ %_12906
 ; {>  %_12906~°0◂°2◂0':(_opn)◂(_p9446) }
; 	∎ °0◂°2◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°2◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14256
	btr r12,3
	jmp LB_14257
LB_14256:
	bts r12,3
LB_14257:
	mov rsi,1
	bt r12,3
	jc LB_14254
	mov rsi,0
	bt r9,0
	jc LB_14254
	jmp LB_14255
LB_14254:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14255:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14258:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14260
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14259
LB_14260:
	add rsp,8
	ret
LB_14262:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14261:
	add rsp,32
	pop r14
LB_14259:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; lc_mtc
	jmp LB_14295
LB_14294:
	add r14,1
LB_14295:
	cmp r14,r10
	jge LB_14296
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14294
	cmp al,10
	jz LB_14294
	cmp al,32
	jz LB_14294
LB_14296:
	push r10
	call NS_E_12769_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14297
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14291
LB_14297:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14292
	btr r12,0
	jmp LB_14293
LB_14292:
	bts r12,0
LB_14293:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_14288
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9504 %_12907 ⊢ %_12908 : %_12908
 ; {>  %_12907~0':_p9447 }
; _f9504 0' ⊢ °1◂0'
; _some %_12908 ⊢ %_12909 : %_12909
 ; {>  %_12908~°1◂0':_p9446 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12909
 ; {>  %_12909~°0◂°1◂0':(_opn)◂(_p9446) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14286
	btr r12,3
	jmp LB_14287
LB_14286:
	bts r12,3
LB_14287:
	mov rsi,1
	bt r12,3
	jc LB_14284
	mov rsi,0
	bt r9,0
	jc LB_14284
	jmp LB_14285
LB_14284:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14285:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14288:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14290
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14289
LB_14290:
	add rsp,8
	ret
LB_14291:
	add rsp,16
	pop r14
LB_14289:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; lc_line
	jmp LB_14330
LB_14329:
	add r14,1
LB_14330:
	cmp r14,r10
	jge LB_14331
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14329
	cmp al,10
	jz LB_14329
	cmp al,32
	jz LB_14329
LB_14331:
	push r10
	call NS_E_12762_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14332
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14324
LB_14332:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; lc_code
	jmp LB_14335
LB_14334:
	add r14,1
LB_14335:
	cmp r14,r10
	jge LB_14336
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14334
	cmp al,10
	jz LB_14334
	cmp al,32
	jz LB_14334
LB_14336:
	push r10
	call NS_E_12761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14337
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14338
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14338:
	jmp LB_14324
LB_14337:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14327
	btr r12,1
	jmp LB_14328
LB_14327:
	bts r12,1
LB_14328:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14325
	btr r12,0
	jmp LB_14326
LB_14325:
	bts r12,0
LB_14326:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14321
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { { 0' 1' 2' } 3' }
	mov r9,r14
	bt r12,1
	jc LB_14340
	btr r12,3
	jmp LB_14341
LB_14340:
	bts r12,3
LB_14341:
	mov r10,r13
	bt r12,0
	jc LB_14342
	btr r12,4
	jmp LB_14343
LB_14342:
	bts r12,4
LB_14343:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_14346
	btr r12,5
	jmp LB_14347
LB_14346:
	bts r12,5
LB_14347:
	mov r13,r11
	bt r12,5
	jc LB_14344
	btr r12,0
	jmp LB_14345
LB_14344:
	bts r12,0
LB_14345:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_14350
	btr r12,5
	jmp LB_14351
LB_14350:
	bts r12,5
LB_14351:
	mov r14,r11
	bt r12,5
	jc LB_14348
	btr r12,1
	jmp LB_14349
LB_14348:
	bts r12,1
LB_14349:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_14354
	btr r12,5
	jmp LB_14355
LB_14354:
	bts r12,5
LB_14355:
	mov r8,r11
	bt r12,5
	jc LB_14352
	btr r12,2
	jmp LB_14353
LB_14352:
	bts r12,2
LB_14353:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f9503 { %_12910 %_12911 } ⊢ %_12912 : %_12912
 ; {>  %_12910~{ 0' 1' 2' }:{ _p9451 _p9442 _p9443 } %_12911~3':_p9446 }
; _f9503 { { 0' 1' 2' } 3' } ⊢ °0◂{ { 0' 1' 2' } 3' }
; _some %_12912 ⊢ %_12913 : %_12913
 ; {>  %_12912~°0◂{ { 0' 1' 2' } 3' }:_p9446 }
; _some °0◂{ { 0' 1' 2' } 3' } ⊢ °0◂°0◂{ { 0' 1' 2' } 3' }
; ∎ %_12913
 ; {>  %_12913~°0◂°0◂{ { 0' 1' 2' } 3' }:(_opn)◂(_p9446) }
; 	∎ °0◂°0◂{ { 0' 1' 2' } 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°0◂{ { 0' 1' 2' } 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_14299
	btr r12,4
	jmp LB_14300
LB_14299:
	bts r12,4
LB_14300:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_14307
	btr r12,6
	jmp LB_14308
LB_14307:
	bts r12,6
LB_14308:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_14305
	btr QWORD [rdi],0
	jmp LB_14306
LB_14305:
	bts QWORD [rdi],0
LB_14306:
	mov rcx,r14
	bt r12,1
	jc LB_14311
	btr r12,6
	jmp LB_14312
LB_14311:
	bts r12,6
LB_14312:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_14309
	btr QWORD [rdi],1
	jmp LB_14310
LB_14309:
	bts QWORD [rdi],1
LB_14310:
	mov rcx,r8
	bt r12,2
	jc LB_14315
	btr r12,6
	jmp LB_14316
LB_14315:
	bts r12,6
LB_14316:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_14313
	btr QWORD [rdi],2
	jmp LB_14314
LB_14313:
	bts QWORD [rdi],2
LB_14314:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_14303
	btr QWORD [rdi],0
	jmp LB_14304
LB_14303:
	bts QWORD [rdi],0
LB_14304:
	mov r11,r10
	bt r12,4
	jc LB_14319
	btr r12,5
	jmp LB_14320
LB_14319:
	bts r12,5
LB_14320:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_14317
	btr QWORD [rdi],1
	jmp LB_14318
LB_14317:
	bts QWORD [rdi],1
LB_14318:
	mov rsi,1
	bt r12,3
	jc LB_14301
	mov rsi,0
	bt r9,0
	jc LB_14301
	jmp LB_14302
LB_14301:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14302:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14321:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14323
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14322
LB_14323:
	add rsp,8
	ret
LB_14324:
	add rsp,32
	pop r14
LB_14322:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12762:
NS_E_RDI_12762:
NS_E_12762_ETR_TBL:
NS_E_12762_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; "$"
	jmp LB_14421
LB_14420:
	add r14,1
LB_14421:
	cmp r14,r10
	jge LB_14422
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14420
	cmp al,10
	jz LB_14420
	cmp al,32
	jz LB_14420
LB_14422:
	add r14,1
	cmp r14,r10
	jg LB_14425
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,36
	jnz LB_14425
	jmp LB_14426
LB_14425:
	jmp LB_14376
LB_14426:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_14389
LB_14388:
	add r14,1
LB_14389:
	cmp r14,r10
	jge LB_14390
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14388
	cmp al,10
	jz LB_14388
	cmp al,32
	jz LB_14388
LB_14390:
	push r10
	call NS_E_11898_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14391
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14392
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14392:
	jmp LB_14377
LB_14391:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_14395
LB_14394:
	add r14,1
LB_14395:
	cmp r14,r10
	jge LB_14396
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14394
	cmp al,10
	jz LB_14394
	cmp al,32
	jz LB_14394
LB_14396:
	add r14,3
	cmp r14,r10
	jg LB_14401
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14401
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_14401
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_14401
	jmp LB_14402
LB_14401:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14398
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14398:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14399
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14399:
	jmp LB_14377
LB_14402:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_14404
LB_14403:
	add r14,1
LB_14404:
	cmp r14,r10
	jge LB_14405
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14403
	cmp al,10
	jz LB_14403
	cmp al,32
	jz LB_14403
LB_14405:
	push r10
	call NS_E_12162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14406
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14407
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14407:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14408
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14408:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14409
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14409:
	jmp LB_14377
LB_14406:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_ptn_tl
	jmp LB_14412
LB_14411:
	add r14,1
LB_14412:
	cmp r14,r10
	jge LB_14413
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14411
	cmp al,10
	jz LB_14411
	cmp al,32
	jz LB_14411
LB_14413:
	push r10
	call NS_E_12165_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14414
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14415
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14415:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14416
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14416:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14417
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14417:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14418
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14418:
	jmp LB_14377
LB_14414:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_14386
	btr r12,4
	jmp LB_14387
LB_14386:
	bts r12,4
LB_14387:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14384
	btr r12,3
	jmp LB_14385
LB_14384:
	bts r12,3
LB_14385:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14382
	btr r12,2
	jmp LB_14383
LB_14382:
	bts r12,2
LB_14383:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14380
	btr r12,1
	jmp LB_14381
LB_14380:
	bts r12,1
LB_14381:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14378
	btr r12,0
	jmp LB_14379
LB_14378:
	bts r12,0
LB_14379:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_14373
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } 0' {  } 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_14427
	btr r12,5
	jmp LB_14428
LB_14427:
	bts r12,5
LB_14428:
	mov r8,r10
	bt r12,4
	jc LB_14429
	btr r12,2
	jmp LB_14430
LB_14429:
	bts r12,2
LB_14430:
	mov r10,r14
	bt r12,1
	jc LB_14431
	btr r12,4
	jmp LB_14432
LB_14431:
	bts r12,4
LB_14432:
	mov r14,r9
	bt r12,3
	jc LB_14433
	btr r12,1
	jmp LB_14434
LB_14433:
	bts r12,1
LB_14434:
	mov r9,r13
	bt r12,0
	jc LB_14435
	btr r12,3
	jmp LB_14436
LB_14435:
	bts r12,3
LB_14436:
	mov r13,r10
	bt r12,4
	jc LB_14437
	btr r12,0
	jmp LB_14438
LB_14437:
	bts r12,0
LB_14438:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr1 |~ {  } ⊢ %_12917 : %_12917
 ; {>  %_12914~0':_p9442 %_12915~1':_p9443 %_12916~2':_p12164 }
; 	» 0xr1 _ ⊢ 3' : %_12917
	mov rdi,0x1
	mov r9,rdi
	bts r12,3
; _f9515 %_12917 ⊢ %_12918 : %_12918
 ; {>  %_12914~0':_p9442 %_12917~3':_r64 %_12915~1':_p9443 %_12916~2':_p12164 }
; _f9515 3' ⊢ °1◂3'
; _some { %_12918 %_12914 %_12915 } ⊢ %_12919 : %_12919
 ; {>  %_12914~0':_p9442 %_12915~1':_p9443 %_12918~°1◂3':_p9451 %_12916~2':_p12164 }
; _some { °1◂3' 0' 1' } ⊢ °0◂{ °1◂3' 0' 1' }
; ∎ %_12919
 ; {>  %_12919~°0◂{ °1◂3' 0' 1' }:(_opn)◂({ _p9451 _p9442 _p9443 }) %_12916~2':_p12164 }
; 	∎ °0◂{ °1◂3' 0' 1' }
	bt r12,2
	jc LB_14356
	mov rdi,r8
	call dlt
LB_14356:
; _emt_mov_ptn_to_ptn:{| 11010.. |},°0◂{ °1◂3' 0' 1' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_14357
	btr r12,4
	jmp LB_14358
LB_14357:
	bts r12,4
LB_14358:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r10
	bt r12,4
	jc LB_14363
	btr r12,2
	jmp LB_14364
LB_14363:
	bts r12,2
LB_14364:
	mov rsi,1
	bt r12,2
	jc LB_14361
	mov rsi,0
	bt r8,0
	jc LB_14361
	jmp LB_14362
LB_14361:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_14362:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_14359
	btr QWORD [rdi],0
	jmp LB_14360
LB_14359:
	bts QWORD [rdi],0
LB_14360:
	mov r8,r13
	bt r12,0
	jc LB_14367
	btr r12,2
	jmp LB_14368
LB_14367:
	bts r12,2
LB_14368:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_14365
	btr QWORD [rdi],1
	jmp LB_14366
LB_14365:
	bts QWORD [rdi],1
LB_14366:
	mov r8,r14
	bt r12,1
	jc LB_14371
	btr r12,2
	jmp LB_14372
LB_14371:
	bts r12,2
LB_14372:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_14369
	btr QWORD [rdi],2
	jmp LB_14370
LB_14369:
	bts QWORD [rdi],2
LB_14370:
	mov r8,0
	bts r12,2
	ret
LB_14373:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14375
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14374
LB_14375:
	add rsp,8
	ret
LB_14377:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14376:
	add rsp,80
	pop r14
LB_14374:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,96
; "\226\151\130"
	jmp LB_14531
LB_14530:
	add r14,1
LB_14531:
	cmp r14,r10
	jge LB_14532
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14530
	cmp al,10
	jz LB_14530
	cmp al,32
	jz LB_14530
LB_14532:
	add r14,3
	cmp r14,r10
	jg LB_14535
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14535
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_14535
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_14535
	jmp LB_14536
LB_14535:
	jmp LB_14472
LB_14536:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; src_ptn
	jmp LB_14487
LB_14486:
	add r14,1
LB_14487:
	cmp r14,r10
	jge LB_14488
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14486
	cmp al,10
	jz LB_14486
	cmp al,32
	jz LB_14486
LB_14488:
	push r10
	call NS_E_11898_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14489
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14490
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14490:
	jmp LB_14473
LB_14489:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ","
	jmp LB_14493
LB_14492:
	add r14,1
LB_14493:
	cmp r14,r10
	jge LB_14494
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14492
	cmp al,10
	jz LB_14492
	cmp al,32
	jz LB_14492
LB_14494:
	add r14,1
	cmp r14,r10
	jg LB_14499
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,44
	jnz LB_14499
	jmp LB_14500
LB_14499:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14496
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14496:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14497
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14497:
	jmp LB_14473
LB_14500:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; src_ptn
	jmp LB_14502
LB_14501:
	add r14,1
LB_14502:
	cmp r14,r10
	jge LB_14503
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14501
	cmp al,10
	jz LB_14501
	cmp al,32
	jz LB_14501
LB_14503:
	push r10
	call NS_E_11898_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14504
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14505
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14505:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14506
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14506:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14507
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14507:
	jmp LB_14473
LB_14504:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; "\226\138\162"
	jmp LB_14510
LB_14509:
	add r14,1
LB_14510:
	cmp r14,r10
	jge LB_14511
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14509
	cmp al,10
	jz LB_14509
	cmp al,32
	jz LB_14509
LB_14511:
	add r14,3
	cmp r14,r10
	jg LB_14518
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14518
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_14518
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_14518
	jmp LB_14519
LB_14518:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14513
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14513:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14514
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14514:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14515
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14515:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14516
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14516:
	jmp LB_14473
LB_14519:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*4],0
	mov QWORD [rsp+8*1+16*4],rax
; dst_ptn
	jmp LB_14521
LB_14520:
	add r14,1
LB_14521:
	cmp r14,r10
	jge LB_14522
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14520
	cmp al,10
	jz LB_14520
	cmp al,32
	jz LB_14520
LB_14522:
	push r10
	call NS_E_12162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14523
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*4]
	bt rsi,0
	jc LB_14524
	mov rdi,QWORD [rsp+16*4+8*1]
	call dlt
LB_14524:
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14525
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14525:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14526
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14526:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14527
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14527:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14528
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14528:
	jmp LB_14473
LB_14523:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*5],rax
	mov QWORD [rsp+8*1+16*5],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*5]
	bt rax,0
	jc LB_14484
	btr r12,5
	jmp LB_14485
LB_14484:
	bts r12,5
LB_14485:
	mov rax,QWORD [rsp+16*5+8*1]
	mov r11,rax
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_14482
	btr r12,4
	jmp LB_14483
LB_14482:
	bts r12,4
LB_14483:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14480
	btr r12,3
	jmp LB_14481
LB_14480:
	bts r12,3
LB_14481:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14478
	btr r12,2
	jmp LB_14479
LB_14478:
	bts r12,2
LB_14479:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14476
	btr r12,1
	jmp LB_14477
LB_14476:
	bts r12,1
LB_14477:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14474
	btr r12,0
	jmp LB_14475
LB_14474:
	bts r12,0
LB_14475:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,96
	push rdi
	push rsi
	push LB_14469
; _emt_mov_ptn_to_ptn:{| 1111110.. |},{ 0' 1' 2' 3' 4' 5' } ⊢ { {  } 0' {  } 1' {  } 2' }
	mov rcx,r8
	bt r12,2
	jc LB_14537
	btr r12,6
	jmp LB_14538
LB_14537:
	bts r12,6
LB_14538:
	mov r8,r11
	bt r12,5
	jc LB_14539
	btr r12,2
	jmp LB_14540
LB_14539:
	bts r12,2
LB_14540:
	mov r11,r14
	bt r12,1
	jc LB_14541
	btr r12,5
	jmp LB_14542
LB_14541:
	bts r12,5
LB_14542:
	mov r14,r9
	bt r12,3
	jc LB_14543
	btr r12,1
	jmp LB_14544
LB_14543:
	bts r12,1
LB_14544:
	mov r9,r13
	bt r12,0
	jc LB_14545
	btr r12,3
	jmp LB_14546
LB_14545:
	bts r12,3
LB_14546:
	mov r13,r11
	bt r12,5
	jc LB_14547
	btr r12,0
	jmp LB_14548
LB_14547:
	bts r12,0
LB_14548:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 6' ⊢ {  }
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f9516 {  } ⊢ %_12923 : %_12923
 ; {>  %_12922~2':_p9443 %_12921~1':_p9442 %_12920~0':_p9442 }
; _f9516 {  } ⊢ °2◂{  }
; _nil {  } ⊢ %_12924 : %_12924
 ; {>  %_12923~°2◂{  }:_p9451 %_12922~2':_p9443 %_12921~1':_p9442 %_12920~0':_p9442 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_12921 %_12924 } ⊢ %_12925 : %_12925
 ; {>  %_12923~°2◂{  }:_p9451 %_12922~2':_p9443 %_12921~1':_p9442 %_12924~°1◂{  }:(_lst)◂(t6456'(0)) %_12920~0':_p9442 }
; _cns { 1' °1◂{  } } ⊢ °0◂{ 1' °1◂{  } }
; _cns { %_12920 %_12925 } ⊢ %_12926 : %_12926
 ; {>  %_12923~°2◂{  }:_p9451 %_12922~2':_p9443 %_12920~0':_p9442 %_12925~°0◂{ 1' °1◂{  } }:(_lst)◂(_p9442) }
; _cns { 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂{ 0' °0◂{ 1' °1◂{  } } }
; _f9491 %_12926 ⊢ %_12927 : %_12927
 ; {>  %_12923~°2◂{  }:_p9451 %_12922~2':_p9443 %_12926~°0◂{ 0' °0◂{ 1' °1◂{  } } }:(_lst)◂(_p9442) }
; _f9491 °0◂{ 0' °0◂{ 1' °1◂{  } } } ⊢ °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }
; _some { %_12923 %_12927 %_12922 } ⊢ %_12928 : %_12928
 ; {>  %_12923~°2◂{  }:_p9451 %_12922~2':_p9443 %_12927~°0◂°0◂{ 0' °0◂{ 1' °1◂{  } } }:_p9442 }
; _some { °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; ∎ %_12928
 ; {>  %_12928~°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }:(_opn)◂({ _p9451 _p9442 _p9443 }) }
; 	∎ °0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °2◂{  } °0◂°0◂{ 0' °0◂{ 1' °1◂{  } } } 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rsi,1
	bt r12,4
	jc LB_14441
	mov rsi,0
	bt r10,0
	jc LB_14441
	jmp LB_14442
LB_14441:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_14442:
	mov rax,0x0200_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_14439
	btr QWORD [rdi],0
	jmp LB_14440
LB_14439:
	bts QWORD [rdi],0
LB_14440:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov r11,r13
	bt r12,0
	jc LB_14451
	btr r12,5
	jmp LB_14452
LB_14451:
	bts r12,5
LB_14452:
	mov rdi,r10
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_14449
	btr QWORD [rdi],0
	jmp LB_14450
LB_14449:
	bts QWORD [rdi],0
LB_14450:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov r13,r14
	bt r12,1
	jc LB_14459
	btr r12,0
	jmp LB_14460
LB_14459:
	bts r12,0
LB_14460:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_14457
	btr QWORD [rdi],0
	jmp LB_14458
LB_14457:
	bts QWORD [rdi],0
LB_14458:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_14463
	mov rsi,0
	bt r13,0
	jc LB_14463
	jmp LB_14464
LB_14463:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_14464:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_14461
	btr QWORD [rdi],1
	jmp LB_14462
LB_14461:
	bts QWORD [rdi],1
LB_14462:
	mov rsi,1
	bt r12,5
	jc LB_14455
	mov rsi,0
	bt r11,0
	jc LB_14455
	jmp LB_14456
LB_14455:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_14456:
	mov rax,0x0000_0000_0000_0001
	or r11,rax
	mov rdi,r10
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_14453
	btr QWORD [rdi],1
	jmp LB_14454
LB_14453:
	bts QWORD [rdi],1
LB_14454:
	mov rsi,1
	bt r12,4
	jc LB_14447
	mov rsi,0
	bt r10,0
	jc LB_14447
	jmp LB_14448
LB_14447:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_14448:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rsi,1
	bt r12,4
	jc LB_14445
	mov rsi,0
	bt r10,0
	jc LB_14445
	jmp LB_14446
LB_14445:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_14446:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_14443
	btr QWORD [rdi],1
	jmp LB_14444
LB_14443:
	bts QWORD [rdi],1
LB_14444:
	mov r10,r8
	bt r12,2
	jc LB_14467
	btr r12,4
	jmp LB_14468
LB_14467:
	bts r12,4
LB_14468:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_14465
	btr QWORD [rdi],2
	jmp LB_14466
LB_14465:
	bts QWORD [rdi],2
LB_14466:
	mov r8,0
	bts r12,2
	ret
LB_14469:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14471
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14470
LB_14471:
	add rsp,8
	ret
LB_14473:
	add rsp,96
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14472:
	add rsp,96
	pop r14
LB_14470:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "\194\187"
	jmp LB_14577
LB_14576:
	add r14,1
LB_14577:
	cmp r14,r10
	jge LB_14578
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14576
	cmp al,10
	jz LB_14576
	cmp al,32
	jz LB_14576
LB_14578:
	add r14,2
	cmp r14,r10
	jg LB_14581
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,194
	jnz LB_14581
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,187
	jnz LB_14581
	jmp LB_14582
LB_14581:
	jmp LB_14564
LB_14582:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_line
	jmp LB_14571
LB_14570:
	add r14,1
LB_14571:
	cmp r14,r10
	jge LB_14572
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14570
	cmp al,10
	jz LB_14570
	cmp al,32
	jz LB_14570
LB_14572:
	push r10
	call NS_E_12763_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14573
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14574
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14574:
	jmp LB_14565
LB_14573:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14568
	btr r12,1
	jmp LB_14569
LB_14568:
	bts r12,1
LB_14569:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14566
	btr r12,0
	jmp LB_14567
LB_14566:
	bts r12,0
LB_14567:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_14561
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } { 0' 1' 2' } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
	mov r9,r14
	bt r12,1
	jc LB_14583
	btr r12,3
	jmp LB_14584
LB_14583:
	bts r12,3
LB_14584:
; 3' ⊢ { 0' 1' 2' }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_14587
	btr r12,4
	jmp LB_14588
LB_14587:
	bts r12,4
LB_14588:
	mov r13,r10
	bt r12,4
	jc LB_14585
	btr r12,0
	jmp LB_14586
LB_14585:
	bts r12,0
LB_14586:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_14591
	btr r12,4
	jmp LB_14592
LB_14591:
	bts r12,4
LB_14592:
	mov r14,r10
	bt r12,4
	jc LB_14589
	btr r12,1
	jmp LB_14590
LB_14589:
	bts r12,1
LB_14590:
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*2]
	mov r10,rax
	bt QWORD [rdi],2
	jc LB_14595
	btr r12,4
	jmp LB_14596
LB_14595:
	bts r12,4
LB_14596:
	mov r8,r10
	bt r12,4
	jc LB_14593
	btr r12,2
	jmp LB_14594
LB_14593:
	bts r12,2
LB_14594:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _some %_12929 ⊢ %_12930 : %_12930
 ; {>  %_12929~{ 0' 1' 2' }:{ _p9451 _p9442 _p9443 } }
; _some { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; ∎ %_12930
 ; {>  %_12930~°0◂{ 0' 1' 2' }:(_opn)◂({ _p9451 _p9442 _p9443 }) }
; 	∎ °0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_14551
	btr r12,4
	jmp LB_14552
LB_14551:
	bts r12,4
LB_14552:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_14549
	btr QWORD [rdi],0
	jmp LB_14550
LB_14549:
	bts QWORD [rdi],0
LB_14550:
	mov r10,r14
	bt r12,1
	jc LB_14555
	btr r12,4
	jmp LB_14556
LB_14555:
	bts r12,4
LB_14556:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_14553
	btr QWORD [rdi],1
	jmp LB_14554
LB_14553:
	bts QWORD [rdi],1
LB_14554:
	mov r10,r8
	bt r12,2
	jc LB_14559
	btr r12,4
	jmp LB_14560
LB_14559:
	bts r12,4
LB_14560:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_14557
	btr QWORD [rdi],2
	jmp LB_14558
LB_14557:
	bts QWORD [rdi],2
LB_14558:
	mov r8,0
	bts r12,2
	ret
LB_14561:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14563
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14562
LB_14563:
	add rsp,8
	ret
LB_14565:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14564:
	add rsp,32
	pop r14
LB_14562:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; name
	jmp LB_14624
LB_14623:
	add r14,1
LB_14624:
	cmp r14,r10
	jge LB_14625
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14623
	cmp al,10
	jz LB_14623
	cmp al,32
	jz LB_14623
LB_14625:
	push r10
	call NS_E_11702_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14626
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14614
LB_14626:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_ptn
	jmp LB_14629
LB_14628:
	add r14,1
LB_14629:
	cmp r14,r10
	jge LB_14630
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14628
	cmp al,10
	jz LB_14628
	cmp al,32
	jz LB_14628
LB_14630:
	push r10
	call NS_E_11898_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14631
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14632
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14632:
	jmp LB_14614
LB_14631:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_14635
LB_14634:
	add r14,1
LB_14635:
	cmp r14,r10
	jge LB_14636
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14634
	cmp al,10
	jz LB_14634
	cmp al,32
	jz LB_14634
LB_14636:
	add r14,3
	cmp r14,r10
	jg LB_14641
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14641
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_14641
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_14641
	jmp LB_14642
LB_14641:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14638
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14638:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14639
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14639:
	jmp LB_14614
LB_14642:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_14644
LB_14643:
	add r14,1
LB_14644:
	cmp r14,r10
	jge LB_14645
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14643
	cmp al,10
	jz LB_14643
	cmp al,32
	jz LB_14643
LB_14645:
	push r10
	call NS_E_12162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14646
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14647
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14647:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14648
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14648:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14649
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14649:
	jmp LB_14614
LB_14646:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14621
	btr r12,3
	jmp LB_14622
LB_14621:
	bts r12,3
LB_14622:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14619
	btr r12,2
	jmp LB_14620
LB_14619:
	bts r12,2
LB_14620:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14617
	btr r12,1
	jmp LB_14618
LB_14617:
	bts r12,1
LB_14618:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14615
	btr r12,0
	jmp LB_14616
LB_14615:
	bts r12,0
LB_14616:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_14611
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' {  } 2' }
	mov r10,r8
	bt r12,2
	jc LB_14651
	btr r12,4
	jmp LB_14652
LB_14651:
	bts r12,4
LB_14652:
	mov r8,r9
	bt r12,3
	jc LB_14653
	btr r12,2
	jmp LB_14654
LB_14653:
	bts r12,2
LB_14654:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f9514 %_12931 ⊢ %_12934 : %_12934
 ; {>  %_12933~2':_p9443 %_12932~1':_p9442 %_12931~0':_p9379 }
; _f9514 0' ⊢ °0◂0'
; _some { %_12934 %_12932 %_12933 } ⊢ %_12935 : %_12935
 ; {>  %_12934~°0◂0':_p9451 %_12933~2':_p9443 %_12932~1':_p9442 }
; _some { °0◂0' 1' 2' } ⊢ °0◂{ °0◂0' 1' 2' }
; ∎ %_12935
 ; {>  %_12935~°0◂{ °0◂0' 1' 2' }:(_opn)◂({ _p9451 _p9442 _p9443 }) }
; 	∎ °0◂{ °0◂0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ °0◂0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_14601
	btr r12,4
	jmp LB_14602
LB_14601:
	bts r12,4
LB_14602:
	mov rsi,1
	bt r12,4
	jc LB_14599
	mov rsi,0
	bt r10,0
	jc LB_14599
	jmp LB_14600
LB_14599:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_14600:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_14597
	btr QWORD [rdi],0
	jmp LB_14598
LB_14597:
	bts QWORD [rdi],0
LB_14598:
	mov r10,r14
	bt r12,1
	jc LB_14605
	btr r12,4
	jmp LB_14606
LB_14605:
	bts r12,4
LB_14606:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_14603
	btr QWORD [rdi],1
	jmp LB_14604
LB_14603:
	bts QWORD [rdi],1
LB_14604:
	mov r10,r8
	bt r12,2
	jc LB_14609
	btr r12,4
	jmp LB_14610
LB_14609:
	bts r12,4
LB_14610:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_14607
	btr QWORD [rdi],2
	jmp LB_14608
LB_14607:
	bts QWORD [rdi],2
LB_14608:
	mov r8,0
	bts r12,2
	ret
LB_14611:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14613
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14612
LB_14613:
	add rsp,8
	ret
LB_14614:
	add rsp,64
	pop r14
LB_14612:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12763:
NS_E_RDI_12763:
NS_E_12763_ETR_TBL:
NS_E_12763_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "_^"
	jmp LB_14713
LB_14712:
	add r14,1
LB_14713:
	cmp r14,r10
	jge LB_14714
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14712
	cmp al,10
	jz LB_14712
	cmp al,32
	jz LB_14712
LB_14714:
	add r14,2
	cmp r14,r10
	jg LB_14717
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,95
	jnz LB_14717
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,94
	jnz LB_14717
	jmp LB_14718
LB_14717:
	jmp LB_14680
LB_14718:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; lc_exp_s8_sd
	jmp LB_14691
LB_14690:
	add r14,1
LB_14691:
	cmp r14,r10
	jge LB_14692
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14690
	cmp al,10
	jz LB_14690
	cmp al,32
	jz LB_14690
LB_14692:
	push r10
	call NS_E_12764_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14693
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14694
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14694:
	jmp LB_14681
LB_14693:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; ⟦ s8_ptn ⟧
	mov rsi,rbx
	mov rbx,[rsi]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rsi],rdi
	mov rdi,0x01_00_0000_0000_0001
	or rsi,rdi
LB_14700:
	jmp LB_14697
LB_14696:
	add r14,1
LB_14697:
	cmp r14,r10
	jge LB_14698
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14696
	cmp al,10
	jz LB_14696
	cmp al,32
	jz LB_14696
LB_14698:
	push r10
	push rsi
	call NS_E_12765_ETR_TBL
	pop rsi
	pop r10
	cmp r8,0
	jnz LB_14699
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_fffc
	mov QWORD [rax],rdi
	mov [rax+8*2],rsi
	bt r12,3
	jnc LB_14701
	bts QWORD [rax],0
LB_14701:
	mov QWORD [rax+8*1],r9
	mov rdi,0x00_00_0000_0000_0001
	or rax,rdi
	mov rsi,rax
	jmp LB_14700
LB_14699:
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rsi
; "//"
	jmp LB_14703
LB_14702:
	add r14,1
LB_14703:
	cmp r14,r10
	jge LB_14704
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14702
	cmp al,10
	jz LB_14702
	cmp al,32
	jz LB_14702
LB_14704:
	add r14,2
	cmp r14,r10
	jg LB_14710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,47
	jnz LB_14710
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,47
	jnz LB_14710
	jmp LB_14711
LB_14710:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14706
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14706:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14707
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14707:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14708
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14708:
	jmp LB_14681
LB_14711:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14688
	btr r12,3
	jmp LB_14689
LB_14688:
	bts r12,3
LB_14689:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14686
	btr r12,2
	jmp LB_14687
LB_14686:
	bts r12,2
LB_14687:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14684
	btr r12,1
	jmp LB_14685
LB_14684:
	bts r12,1
LB_14685:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14682
	btr r12,0
	jmp LB_14683
LB_14682:
	bts r12,0
LB_14683:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_14677
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } { 0' 1' 2' } 3' {  } }
	mov r10,r9
	bt r12,3
	jc LB_14719
	btr r12,4
	jmp LB_14720
LB_14719:
	bts r12,4
LB_14720:
	mov r9,r8
	bt r12,2
	jc LB_14721
	btr r12,3
	jmp LB_14722
LB_14721:
	bts r12,3
LB_14722:
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov r10,r14
	bt r12,1
	jc LB_14723
	btr r12,4
	jmp LB_14724
LB_14723:
	bts r12,4
LB_14724:
; 4' ⊢ { 0' 1' 2' }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_14727
	btr r12,5
	jmp LB_14728
LB_14727:
	bts r12,5
LB_14728:
	mov r13,r11
	bt r12,5
	jc LB_14725
	btr r12,0
	jmp LB_14726
LB_14725:
	bts r12,0
LB_14726:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_14731
	btr r12,5
	jmp LB_14732
LB_14731:
	bts r12,5
LB_14732:
	mov r14,r11
	bt r12,5
	jc LB_14729
	btr r12,1
	jmp LB_14730
LB_14729:
	bts r12,1
LB_14730:
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*2]
	mov r11,rax
	bt QWORD [rdi],2
	jc LB_14735
	btr r12,5
	jmp LB_14736
LB_14735:
	bts r12,5
LB_14736:
	mov r8,r11
	bt r12,5
	jc LB_14733
	btr r12,2
	jmp LB_14734
LB_14733:
	bts r12,2
LB_14734:
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f9518 { %_12936 %_12939 } ⊢ %_12940 : %_12940
 ; {>  %_12938~2':_p9443 %_12936~0':_r64 %_12937~1':_p9442 %_12939~3':(_lst)◂(_p9452) }
; _f9518 { 0' 3' } ⊢ °4◂{ 0' 3' }
; _some { %_12940 %_12937 %_12938 } ⊢ %_12941 : %_12941
 ; {>  %_12938~2':_p9443 %_12937~1':_p9442 %_12940~°4◂{ 0' 3' }:_p9451 }
; _some { °4◂{ 0' 3' } 1' 2' } ⊢ °0◂{ °4◂{ 0' 3' } 1' 2' }
; ∎ %_12941
 ; {>  %_12941~°0◂{ °4◂{ 0' 3' } 1' 2' }:(_opn)◂({ _p9451 _p9442 _p9443 }) }
; 	∎ °0◂{ °4◂{ 0' 3' } 1' 2' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂{ °4◂{ 0' 3' } 1' 2' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_14655
	btr r12,4
	jmp LB_14656
LB_14655:
	bts r12,4
LB_14656:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rcx,r13
	bt r12,0
	jc LB_14663
	btr r12,6
	jmp LB_14664
LB_14663:
	bts r12,6
LB_14664:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_14661
	btr QWORD [rdi],0
	jmp LB_14662
LB_14661:
	bts QWORD [rdi],0
LB_14662:
	mov rcx,r10
	bt r12,4
	jc LB_14667
	btr r12,6
	jmp LB_14668
LB_14667:
	bts r12,6
LB_14668:
	mov rdi,r11
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_14665
	btr QWORD [rdi],1
	jmp LB_14666
LB_14665:
	bts QWORD [rdi],1
LB_14666:
	mov rsi,1
	bt r12,5
	jc LB_14659
	mov rsi,0
	bt r11,0
	jc LB_14659
	jmp LB_14660
LB_14659:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r11
	mov QWORD [rax+8*1],rdi
	mov r11,rax
	btr r12,5
LB_14660:
	mov rax,0x0400_0000_0000_0001
	or r11,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_14657
	btr QWORD [rdi],0
	jmp LB_14658
LB_14657:
	bts QWORD [rdi],0
LB_14658:
	mov r11,r14
	bt r12,1
	jc LB_14671
	btr r12,5
	jmp LB_14672
LB_14671:
	bts r12,5
LB_14672:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_14669
	btr QWORD [rdi],1
	jmp LB_14670
LB_14669:
	bts QWORD [rdi],1
LB_14670:
	mov r11,r8
	bt r12,2
	jc LB_14675
	btr r12,5
	jmp LB_14676
LB_14675:
	bts r12,5
LB_14676:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_14673
	btr QWORD [rdi],2
	jmp LB_14674
LB_14673:
	bts QWORD [rdi],2
LB_14674:
	mov r8,0
	bts r12,2
	ret
LB_14677:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14679
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14678
LB_14679:
	add rsp,8
	ret
LB_14681:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14680:
	add rsp,64
	pop r14
LB_14678:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; cst
	jmp LB_14766
LB_14765:
	add r14,1
LB_14766:
	cmp r14,r10
	jge LB_14767
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14765
	cmp al,10
	jz LB_14765
	cmp al,32
	jz LB_14765
LB_14767:
	push r10
	call NS_E_11769_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14768
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14756
LB_14768:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "_"
	jmp LB_14771
LB_14770:
	add r14,1
LB_14771:
	cmp r14,r10
	jge LB_14772
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14770
	cmp al,10
	jz LB_14770
	cmp al,32
	jz LB_14770
LB_14772:
	add r14,1
	cmp r14,r10
	jg LB_14776
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_14776
	jmp LB_14777
LB_14776:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14774
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14774:
	jmp LB_14756
LB_14777:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; "\226\138\162"
	jmp LB_14779
LB_14778:
	add r14,1
LB_14779:
	cmp r14,r10
	jge LB_14780
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14778
	cmp al,10
	jz LB_14778
	cmp al,32
	jz LB_14778
LB_14780:
	add r14,3
	cmp r14,r10
	jg LB_14785
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14785
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_14785
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_14785
	jmp LB_14786
LB_14785:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14782
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14782:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14783
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14783:
	jmp LB_14756
LB_14786:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst_ptn
	jmp LB_14788
LB_14787:
	add r14,1
LB_14788:
	cmp r14,r10
	jge LB_14789
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14787
	cmp al,10
	jz LB_14787
	cmp al,32
	jz LB_14787
LB_14789:
	push r10
	call NS_E_12162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14790
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14791
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14791:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14792
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14792:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14793
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14793:
	jmp LB_14756
LB_14790:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14763
	btr r12,3
	jmp LB_14764
LB_14763:
	bts r12,3
LB_14764:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14761
	btr r12,2
	jmp LB_14762
LB_14761:
	bts r12,2
LB_14762:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14759
	btr r12,1
	jmp LB_14760
LB_14759:
	bts r12,1
LB_14760:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14757
	btr r12,0
	jmp LB_14758
LB_14757:
	bts r12,0
LB_14758:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_14753
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' {  } {  } 1' }
	mov r10,r14
	bt r12,1
	jc LB_14795
	btr r12,4
	jmp LB_14796
LB_14795:
	bts r12,4
LB_14796:
	mov r14,r9
	bt r12,3
	jc LB_14797
	btr r12,1
	jmp LB_14798
LB_14797:
	bts r12,1
LB_14798:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9517 %_12942 ⊢ %_12944 : %_12944
 ; {>  %_12942~0':_p9445 %_12943~1':_p9443 }
; _f9517 0' ⊢ °3◂0'
; _nil {  } ⊢ %_12945 : %_12945
 ; {>  %_12944~°3◂0':_p9451 %_12943~1':_p9443 }
; _nil {  } ⊢ °1◂{  }
; _f9491 %_12945 ⊢ %_12946 : %_12946
 ; {>  %_12945~°1◂{  }:(_lst)◂(t6485'(0)) %_12944~°3◂0':_p9451 %_12943~1':_p9443 }
; _f9491 °1◂{  } ⊢ °0◂°1◂{  }
; _some { %_12944 %_12946 %_12943 } ⊢ %_12947 : %_12947
 ; {>  %_12946~°0◂°1◂{  }:_p9442 %_12944~°3◂0':_p9451 %_12943~1':_p9443 }
; _some { °3◂0' °0◂°1◂{  } 1' } ⊢ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; ∎ %_12947
 ; {>  %_12947~°0◂{ °3◂0' °0◂°1◂{  } 1' }:(_opn)◂({ _p9451 _p9442 _p9443 }) }
; 	∎ °0◂{ °3◂0' °0◂°1◂{  } 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ °3◂0' °0◂°1◂{  } 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_14741
	btr r12,2
	jmp LB_14742
LB_14741:
	bts r12,2
LB_14742:
	mov rsi,1
	bt r12,2
	jc LB_14739
	mov rsi,0
	bt r8,0
	jc LB_14739
	jmp LB_14740
LB_14739:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_14740:
	mov rax,0x0300_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_14737
	btr QWORD [rdi],0
	jmp LB_14738
LB_14737:
	bts QWORD [rdi],0
LB_14738:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_14747
	mov rsi,0
	bt r8,0
	jc LB_14747
	jmp LB_14748
LB_14747:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_14748:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_14745
	mov rsi,0
	bt r8,0
	jc LB_14745
	jmp LB_14746
LB_14745:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_14746:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_14743
	btr QWORD [rdi],1
	jmp LB_14744
LB_14743:
	bts QWORD [rdi],1
LB_14744:
	mov r8,r14
	bt r12,1
	jc LB_14751
	btr r12,2
	jmp LB_14752
LB_14751:
	bts r12,2
LB_14752:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_14749
	btr QWORD [rdi],2
	jmp LB_14750
LB_14749:
	bts QWORD [rdi],2
LB_14750:
	mov r8,0
	bts r12,2
	ret
LB_14753:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14755
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14754
LB_14755:
	add rsp,8
	ret
LB_14756:
	add rsp,64
	pop r14
LB_14754:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12764:
NS_E_RDI_12764:
NS_E_12764_ETR_TBL:
NS_E_12764_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "_"
	jmp LB_14852
LB_14851:
	add r14,1
LB_14852:
	cmp r14,r10
	jge LB_14853
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14851
	cmp al,10
	jz LB_14851
	cmp al,32
	jz LB_14851
LB_14853:
	add r14,1
	cmp r14,r10
	jg LB_14856
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,95
	jnz LB_14856
	jmp LB_14857
LB_14856:
	jmp LB_14828
LB_14857:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_14837
LB_14836:
	add r14,1
LB_14837:
	cmp r14,r10
	jge LB_14838
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14836
	cmp al,10
	jz LB_14836
	cmp al,32
	jz LB_14836
LB_14838:
	add r14,3
	cmp r14,r10
	jg LB_14842
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14842
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_14842
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_14842
	jmp LB_14843
LB_14842:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14840
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14840:
	jmp LB_14829
LB_14843:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst
	jmp LB_14845
LB_14844:
	add r14,1
LB_14845:
	cmp r14,r10
	jge LB_14846
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14844
	cmp al,10
	jz LB_14844
	cmp al,32
	jz LB_14844
LB_14846:
	push r10
	call NS_E_12167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14847
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14848
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14848:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14849
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14849:
	jmp LB_14829
LB_14847:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14834
	btr r12,2
	jmp LB_14835
LB_14834:
	bts r12,2
LB_14835:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14832
	btr r12,1
	jmp LB_14833
LB_14832:
	bts r12,1
LB_14833:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14830
	btr r12,0
	jmp LB_14831
LB_14830:
	bts r12,0
LB_14831:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_14825
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } {  } 0' }
	mov r9,r13
	bt r12,0
	jc LB_14858
	btr r12,3
	jmp LB_14859
LB_14858:
	bts r12,3
LB_14859:
	mov r13,r8
	bt r12,2
	jc LB_14860
	btr r12,0
	jmp LB_14861
LB_14860:
	bts r12,0
LB_14861:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; » 0xr0 |~ {  } ⊢ %_12949 : %_12949
 ; {>  %_12948~0':_p9441 }
; 	» 0xr0 _ ⊢ 1' : %_12949
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; _nil {  } ⊢ %_12950 : %_12950
 ; {>  %_12948~0':_p9441 %_12949~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f9491 %_12950 ⊢ %_12951 : %_12951
 ; {>  %_12948~0':_p9441 %_12950~°1◂{  }:(_lst)◂(t6493'(0)) %_12949~1':_r64 }
; _f9491 °1◂{  } ⊢ °0◂°1◂{  }
; _nil {  } ⊢ %_12952 : %_12952
 ; {>  %_12948~0':_p9441 %_12951~°0◂°1◂{  }:_p9442 %_12949~1':_r64 }
; _nil {  } ⊢ °1◂{  }
; _f9494 %_12948 ⊢ %_12953 : %_12953
 ; {>  %_12952~°1◂{  }:(_lst)◂(t6497'(0)) %_12948~0':_p9441 %_12951~°0◂°1◂{  }:_p9442 %_12949~1':_r64 }
; _f9494 0' ⊢ °1◂0'
; _cns { %_12953 %_12952 } ⊢ %_12954 : %_12954
 ; {>  %_12952~°1◂{  }:(_lst)◂(t6497'(0)) %_12953~°1◂0':_p9443 %_12951~°0◂°1◂{  }:_p9442 %_12949~1':_r64 }
; _cns { °1◂0' °1◂{  } } ⊢ °0◂{ °1◂0' °1◂{  } }
; _f9493 %_12954 ⊢ %_12955 : %_12955
 ; {>  %_12954~°0◂{ °1◂0' °1◂{  } }:(_lst)◂(_p9443) %_12951~°0◂°1◂{  }:_p9442 %_12949~1':_r64 }
; _f9493 °0◂{ °1◂0' °1◂{  } } ⊢ °0◂°0◂{ °1◂0' °1◂{  } }
; _some { %_12949 %_12951 %_12955 } ⊢ %_12956 : %_12956
 ; {>  %_12955~°0◂°0◂{ °1◂0' °1◂{  } }:_p9443 %_12951~°0◂°1◂{  }:_p9442 %_12949~1':_r64 }
; _some { 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; ∎ %_12956
 ; {>  %_12956~°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }:(_opn)◂({ _r64 _p9442 _p9443 }) }
; 	∎ °0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 1' °0◂°1◂{  } °0◂°0◂{ °1◂0' °1◂{  } } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r14
	bt r12,1
	jc LB_14801
	btr r12,2
	jmp LB_14802
LB_14801:
	bts r12,2
LB_14802:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_14799
	btr QWORD [rdi],0
	jmp LB_14800
LB_14799:
	bts QWORD [rdi],0
LB_14800:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_14807
	mov rsi,0
	bt r8,0
	jc LB_14807
	jmp LB_14808
LB_14807:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_14808:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_14805
	mov rsi,0
	bt r8,0
	jc LB_14805
	jmp LB_14806
LB_14805:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_14806:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_14803
	btr QWORD [rdi],1
	jmp LB_14804
LB_14803:
	bts QWORD [rdi],1
LB_14804:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r14,r13
	bt r12,0
	jc LB_14819
	btr r12,1
	jmp LB_14820
LB_14819:
	bts r12,1
LB_14820:
	mov rsi,1
	bt r12,1
	jc LB_14817
	mov rsi,0
	bt r14,0
	jc LB_14817
	jmp LB_14818
LB_14817:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_14818:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_14815
	btr QWORD [rdi],0
	jmp LB_14816
LB_14815:
	bts QWORD [rdi],0
LB_14816:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_14823
	mov rsi,0
	bt r14,0
	jc LB_14823
	jmp LB_14824
LB_14823:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_14824:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r8
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_14821
	btr QWORD [rdi],1
	jmp LB_14822
LB_14821:
	bts QWORD [rdi],1
LB_14822:
	mov rsi,1
	bt r12,2
	jc LB_14813
	mov rsi,0
	bt r8,0
	jc LB_14813
	jmp LB_14814
LB_14813:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_14814:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rsi,1
	bt r12,2
	jc LB_14811
	mov rsi,0
	bt r8,0
	jc LB_14811
	jmp LB_14812
LB_14811:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_14812:
	mov rax,0x0000_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_14809
	btr QWORD [rdi],2
	jmp LB_14810
LB_14809:
	bts QWORD [rdi],2
LB_14810:
	mov r8,0
	bts r12,2
	ret
LB_14825:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14827
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14826
LB_14827:
	add rsp,8
	ret
LB_14829:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_14828:
	add rsp,48
	pop r14
LB_14826:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src
	jmp LB_14915
LB_14914:
	add r14,1
LB_14915:
	cmp r14,r10
	jge LB_14916
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14914
	cmp al,10
	jz LB_14914
	cmp al,32
	jz LB_14914
LB_14916:
	push r10
	call NS_E_11901_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14917
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14903
LB_14917:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; src_tl
	jmp LB_14920
LB_14919:
	add r14,1
LB_14920:
	cmp r14,r10
	jge LB_14921
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14919
	cmp al,10
	jz LB_14919
	cmp al,32
	jz LB_14919
LB_14921:
	push r10
	call NS_E_11900_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14922
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14923
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14923:
	jmp LB_14903
LB_14922:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\138\162"
	jmp LB_14926
LB_14925:
	add r14,1
LB_14926:
	cmp r14,r10
	jge LB_14927
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14925
	cmp al,10
	jz LB_14925
	cmp al,32
	jz LB_14925
LB_14927:
	add r14,3
	cmp r14,r10
	jg LB_14932
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_14932
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_14932
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_14932
	jmp LB_14933
LB_14932:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14929
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14929:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14930
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14930:
	jmp LB_14903
LB_14933:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
; dst
	jmp LB_14935
LB_14934:
	add r14,1
LB_14935:
	cmp r14,r10
	jge LB_14936
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14934
	cmp al,10
	jz LB_14934
	cmp al,32
	jz LB_14934
LB_14936:
	push r10
	call NS_E_12167_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14937
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14938
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14938:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14939
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14939:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14940
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14940:
	jmp LB_14903
LB_14937:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; dst_tl
	jmp LB_14943
LB_14942:
	add r14,1
LB_14943:
	cmp r14,r10
	jge LB_14944
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14942
	cmp al,10
	jz LB_14942
	cmp al,32
	jz LB_14942
LB_14944:
	push r10
	call NS_E_12166_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14945
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_14946
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_14946:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_14947
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_14947:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_14948
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_14948:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_14949
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_14949:
	jmp LB_14903
LB_14945:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_14912
	btr r12,4
	jmp LB_14913
LB_14912:
	bts r12,4
LB_14913:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_14910
	btr r12,3
	jmp LB_14911
LB_14910:
	bts r12,3
LB_14911:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_14908
	btr r12,2
	jmp LB_14909
LB_14908:
	bts r12,2
LB_14909:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_14906
	btr r12,1
	jmp LB_14907
LB_14906:
	bts r12,1
LB_14907:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14904
	btr r12,0
	jmp LB_14905
LB_14904:
	bts r12,0
LB_14905:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_14900
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' {  } 2' 3' }
	mov r11,r9
	bt r12,3
	jc LB_14951
	btr r12,5
	jmp LB_14952
LB_14951:
	bts r12,5
LB_14952:
	mov r9,r10
	bt r12,4
	jc LB_14953
	btr r12,3
	jmp LB_14954
LB_14953:
	bts r12,3
LB_14954:
	mov r10,r8
	bt r12,2
	jc LB_14955
	btr r12,4
	jmp LB_14956
LB_14955:
	bts r12,4
LB_14956:
	mov r8,r11
	bt r12,5
	jc LB_14957
	btr r12,2
	jmp LB_14958
LB_14957:
	bts r12,2
LB_14958:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _f9492 %_12957 ⊢ %_12961 : %_12961
 ; {>  %_12959~2':_p9441 %_12960~3':(_lst)◂(_p9443) %_12958~1':(_lst)◂(_p9442) %_12957~0':_p9440 }
; _f9492 0' ⊢ °1◂0'
; _f9494 %_12959 ⊢ %_12962 : %_12962
 ; {>  %_12959~2':_p9441 %_12961~°1◂0':_p9442 %_12960~3':(_lst)◂(_p9443) %_12958~1':(_lst)◂(_p9442) }
; _f9494 2' ⊢ °1◂2'
; _cns { %_12961 %_12958 } ⊢ %_12963 : %_12963
 ; {>  %_12962~°1◂2':_p9443 %_12961~°1◂0':_p9442 %_12960~3':(_lst)◂(_p9443) %_12958~1':(_lst)◂(_p9442) }
; _cns { °1◂0' 1' } ⊢ °0◂{ °1◂0' 1' }
; _cns { %_12962 %_12960 } ⊢ %_12964 : %_12964
 ; {>  %_12962~°1◂2':_p9443 %_12963~°0◂{ °1◂0' 1' }:(_lst)◂(_p9442) %_12960~3':(_lst)◂(_p9443) }
; _cns { °1◂2' 3' } ⊢ °0◂{ °1◂2' 3' }
; _f9491 %_12963 ⊢ %_12965 : %_12965
 ; {>  %_12963~°0◂{ °1◂0' 1' }:(_lst)◂(_p9442) %_12964~°0◂{ °1◂2' 3' }:(_lst)◂(_p9443) }
; _f9491 °0◂{ °1◂0' 1' } ⊢ °0◂°0◂{ °1◂0' 1' }
; _f9493 %_12964 ⊢ %_12966 : %_12966
 ; {>  %_12965~°0◂°0◂{ °1◂0' 1' }:_p9442 %_12964~°0◂{ °1◂2' 3' }:(_lst)◂(_p9443) }
; _f9493 °0◂{ °1◂2' 3' } ⊢ °0◂°0◂{ °1◂2' 3' }
; » 0xr1 |~ {  } ⊢ %_12967 : %_12967
 ; {>  %_12966~°0◂°0◂{ °1◂2' 3' }:_p9443 %_12965~°0◂°0◂{ °1◂0' 1' }:_p9442 }
; 	» 0xr1 _ ⊢ 4' : %_12967
	mov rdi,0x1
	mov r10,rdi
	bts r12,4
; _some { %_12967 %_12965 %_12966 } ⊢ %_12968 : %_12968
 ; {>  %_12966~°0◂°0◂{ °1◂2' 3' }:_p9443 %_12967~4':_r64 %_12965~°0◂°0◂{ °1◂0' 1' }:_p9442 }
; _some { 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; ∎ %_12968
 ; {>  %_12968~°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }:(_opn)◂({ _r64 _p9442 _p9443 }) }
; 	∎ °0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂{ 4' °0◂°0◂{ °1◂0' 1' } °0◂°0◂{ °1◂2' 3' } } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_14862
	btr r12,5
	jmp LB_14863
LB_14862:
	bts r12,5
LB_14863:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r10
	bt r12,4
	jc LB_14866
	btr r12,6
	jmp LB_14867
LB_14866:
	bts r12,6
LB_14867:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_14864
	btr QWORD [rdi],0
	jmp LB_14865
LB_14864:
	bts QWORD [rdi],0
LB_14865:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r10,r13
	bt r12,0
	jc LB_14878
	btr r12,4
	jmp LB_14879
LB_14878:
	bts r12,4
LB_14879:
	mov rsi,1
	bt r12,4
	jc LB_14876
	mov rsi,0
	bt r10,0
	jc LB_14876
	jmp LB_14877
LB_14876:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_14877:
	mov rax,0x0100_0000_0000_0001
	or r10,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_14874
	btr QWORD [rdi],0
	jmp LB_14875
LB_14874:
	bts QWORD [rdi],0
LB_14875:
	mov r10,r14
	bt r12,1
	jc LB_14882
	btr r12,4
	jmp LB_14883
LB_14882:
	bts r12,4
LB_14883:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_14880
	btr QWORD [rdi],1
	jmp LB_14881
LB_14880:
	bts QWORD [rdi],1
LB_14881:
	mov rsi,1
	bt r12,6
	jc LB_14872
	mov rsi,0
	bt rcx,0
	jc LB_14872
	jmp LB_14873
LB_14872:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_14873:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_14870
	mov rsi,0
	bt rcx,0
	jc LB_14870
	jmp LB_14871
LB_14870:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_14871:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_14868
	btr QWORD [rdi],1
	jmp LB_14869
LB_14868:
	bts QWORD [rdi],1
LB_14869:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov r13,r8
	bt r12,2
	jc LB_14894
	btr r12,0
	jmp LB_14895
LB_14894:
	bts r12,0
LB_14895:
	mov rsi,1
	bt r12,0
	jc LB_14892
	mov rsi,0
	bt r13,0
	jc LB_14892
	jmp LB_14893
LB_14892:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_14893:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_14890
	btr QWORD [rdi],0
	jmp LB_14891
LB_14890:
	bts QWORD [rdi],0
LB_14891:
	mov r13,r11
	bt r12,5
	jc LB_14898
	btr r12,0
	jmp LB_14899
LB_14898:
	bts r12,0
LB_14899:
	mov rdi,rcx
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_14896
	btr QWORD [rdi],1
	jmp LB_14897
LB_14896:
	bts QWORD [rdi],1
LB_14897:
	mov rsi,1
	bt r12,6
	jc LB_14888
	mov rsi,0
	bt rcx,0
	jc LB_14888
	jmp LB_14889
LB_14888:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_14889:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rsi,1
	bt r12,6
	jc LB_14886
	mov rsi,0
	bt rcx,0
	jc LB_14886
	jmp LB_14887
LB_14886:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rcx
	mov QWORD [rax+8*1],rdi
	mov rcx,rax
	btr r12,6
LB_14887:
	mov rax,0x0000_0000_0000_0001
	or rcx,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_14884
	btr QWORD [rdi],2
	jmp LB_14885
LB_14884:
	bts QWORD [rdi],2
LB_14885:
	mov r8,0
	bts r12,2
	ret
LB_14900:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14902
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14901
LB_14902:
	add rsp,8
	ret
LB_14903:
	add rsp,80
	pop r14
LB_14901:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12765:
NS_E_RDI_12765:
NS_E_12765_ETR_TBL:
NS_E_12765_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_ptn_line
	jmp LB_14970
LB_14969:
	add r14,1
LB_14970:
	cmp r14,r10
	jge LB_14971
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14969
	cmp al,10
	jz LB_14969
	cmp al,32
	jz LB_14969
LB_14971:
	push r10
	call NS_E_12767_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14972
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14966
LB_14972:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14967
	btr r12,0
	jmp LB_14968
LB_14967:
	bts r12,0
LB_14968:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_14963
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9519 %_12969 ⊢ %_12970 : %_12970
 ; {>  %_12969~0':_stg }
; _f9519 0' ⊢ °0◂0'
; _some %_12970 ⊢ %_12971 : %_12971
 ; {>  %_12970~°0◂0':_p9452 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_12971
 ; {>  %_12971~°0◂°0◂0':(_opn)◂(_p9452) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14961
	btr r12,3
	jmp LB_14962
LB_14961:
	bts r12,3
LB_14962:
	mov rsi,1
	bt r12,3
	jc LB_14959
	mov rsi,0
	bt r9,0
	jc LB_14959
	jmp LB_14960
LB_14959:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14960:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14963:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14965
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14964
LB_14965:
	add rsp,8
	ret
LB_14966:
	add rsp,16
	pop r14
LB_14964:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_14985
LB_14984:
	add r14,1
LB_14985:
	cmp r14,r10
	jge LB_14986
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14984
	cmp al,10
	jz LB_14984
	cmp al,32
	jz LB_14984
LB_14986:
	push r10
	call NS_E_8824_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_14987
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14981
LB_14987:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14982
	btr r12,0
	jmp LB_14983
LB_14982:
	bts r12,0
LB_14983:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_14978
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9519 %_12972 ⊢ %_12973 : %_12973
 ; {>  %_12972~0':_stg }
; _f9519 0' ⊢ °0◂0'
; _some %_12973 ⊢ %_12974 : %_12974
 ; {>  %_12973~°0◂0':_p9452 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_12974
 ; {>  %_12974~°0◂°0◂0':(_opn)◂(_p9452) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14976
	btr r12,3
	jmp LB_14977
LB_14976:
	bts r12,3
LB_14977:
	mov rsi,1
	bt r12,3
	jc LB_14974
	mov rsi,0
	bt r9,0
	jc LB_14974
	jmp LB_14975
LB_14974:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14975:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14978:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14980
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14979
LB_14980:
	add rsp,8
	ret
LB_14981:
	add rsp,16
	pop r14
LB_14979:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_15000
LB_14999:
	add r14,1
LB_15000:
	cmp r14,r10
	jge LB_15001
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_14999
	cmp al,10
	jz LB_14999
	cmp al,32
	jz LB_14999
LB_15001:
	push r10
	call NS_E_11702_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15002
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14996
LB_15002:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_14997
	btr r12,0
	jmp LB_14998
LB_14997:
	bts r12,0
LB_14998:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_14993
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9520 %_12975 ⊢ %_12976 : %_12976
 ; {>  %_12975~0':_p9379 }
; _f9520 0' ⊢ °1◂0'
; _some %_12976 ⊢ %_12977 : %_12977
 ; {>  %_12976~°1◂0':_p9452 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_12977
 ; {>  %_12977~°0◂°1◂0':(_opn)◂(_p9452) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_14991
	btr r12,3
	jmp LB_14992
LB_14991:
	bts r12,3
LB_14992:
	mov rsi,1
	bt r12,3
	jc LB_14989
	mov rsi,0
	bt r9,0
	jc LB_14989
	jmp LB_14990
LB_14989:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_14990:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_14993:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_14995
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_14994
LB_14995:
	add rsp,8
	ret
LB_14996:
	add rsp,16
	pop r14
LB_14994:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; s8_fmt
	jmp LB_15021
LB_15020:
	add r14,1
LB_15021:
	cmp r14,r10
	jge LB_15022
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15020
	cmp al,10
	jz LB_15020
	cmp al,32
	jz LB_15020
LB_15022:
	push r10
	call NS_E_12766_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15023
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15017
LB_15023:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15018
	btr r12,0
	jmp LB_15019
LB_15018:
	bts r12,0
LB_15019:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_15014
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { { 0' 1' } }
	mov r8,r13
	bt r12,0
	jc LB_15025
	btr r12,2
	jmp LB_15026
LB_15025:
	bts r12,2
LB_15026:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_15029
	btr r12,3
	jmp LB_15030
LB_15029:
	bts r12,3
LB_15030:
	mov r13,r9
	bt r12,3
	jc LB_15027
	btr r12,0
	jmp LB_15028
LB_15027:
	bts r12,0
LB_15028:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_15033
	btr r12,3
	jmp LB_15034
LB_15033:
	bts r12,3
LB_15034:
	mov r14,r9
	bt r12,3
	jc LB_15031
	btr r12,1
	jmp LB_15032
LB_15031:
	bts r12,1
LB_15032:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9521 %_12978 ⊢ %_12979 : %_12979
 ; {>  %_12978~{ 0' 1' }:{ _p9453 _r64 } }
; _f9521 { 0' 1' } ⊢ °2◂{ 0' 1' }
; _some %_12979 ⊢ %_12980 : %_12980
 ; {>  %_12979~°2◂{ 0' 1' }:_p9452 }
; _some °2◂{ 0' 1' } ⊢ °0◂°2◂{ 0' 1' }
; ∎ %_12980
 ; {>  %_12980~°0◂°2◂{ 0' 1' }:(_opn)◂(_p9452) }
; 	∎ °0◂°2◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°2◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15008
	btr r12,2
	jmp LB_15009
LB_15008:
	bts r12,2
LB_15009:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15006
	btr QWORD [rdi],0
	jmp LB_15007
LB_15006:
	bts QWORD [rdi],0
LB_15007:
	mov r8,r14
	bt r12,1
	jc LB_15012
	btr r12,2
	jmp LB_15013
LB_15012:
	bts r12,2
LB_15013:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15010
	btr QWORD [rdi],1
	jmp LB_15011
LB_15010:
	bts QWORD [rdi],1
LB_15011:
	mov rsi,1
	bt r12,3
	jc LB_15004
	mov rsi,0
	bt r9,0
	jc LB_15004
	jmp LB_15005
LB_15004:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15005:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15014:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15016
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15015
LB_15016:
	add rsp,8
	ret
LB_15017:
	add rsp,16
	pop r14
LB_15015:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12766:
NS_E_RDI_12766:
NS_E_12766_ETR_TBL:
NS_E_12766_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_8703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15054
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15046
LB_15054:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "d'"
	add r14,2
	cmp r14,r10
	jg LB_15062
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,100
	jnz LB_15062
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_15062
	jmp LB_15063
LB_15062:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15060
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15060:
	jmp LB_15046
LB_15063:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15049
	btr r12,1
	jmp LB_15050
LB_15049:
	bts r12,1
LB_15050:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15047
	btr r12,0
	jmp LB_15048
LB_15047:
	bts r12,0
LB_15048:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15043
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f9523 {  } ⊢ %_12982 : %_12982
 ; {>  %_12981~0':_r64 }
; _f9523 {  } ⊢ °1◂{  }
; _some { %_12982 %_12981 } ⊢ %_12983 : %_12983
 ; {>  %_12982~°1◂{  }:_p9453 %_12981~0':_r64 }
; _some { °1◂{  } 0' } ⊢ °0◂{ °1◂{  } 0' }
; ∎ %_12983
 ; {>  %_12983~°0◂{ °1◂{  } 0' }:(_opn)◂({ _p9453 _r64 }) }
; 	∎ °0◂{ °1◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °1◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_15037
	mov rsi,0
	bt r14,0
	jc LB_15037
	jmp LB_15038
LB_15037:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_15038:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_15035
	btr QWORD [rdi],0
	jmp LB_15036
LB_15035:
	bts QWORD [rdi],0
LB_15036:
	mov r14,r13
	bt r12,0
	jc LB_15041
	btr r12,1
	jmp LB_15042
LB_15041:
	bts r12,1
LB_15042:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_15039
	btr QWORD [rdi],1
	jmp LB_15040
LB_15039:
	bts QWORD [rdi],1
LB_15040:
	mov r8,0
	bts r12,2
	ret
LB_15043:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15045
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15044
LB_15045:
	add rsp,8
	ret
LB_15046:
	add rsp,32
	pop r14
LB_15044:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_8703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15083
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15075
LB_15083:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "x'"
	add r14,2
	cmp r14,r10
	jg LB_15091
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,120
	jnz LB_15091
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,39
	jnz LB_15091
	jmp LB_15092
LB_15091:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15089
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15089:
	jmp LB_15075
LB_15092:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15078
	btr r12,1
	jmp LB_15079
LB_15078:
	bts r12,1
LB_15079:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15076
	btr r12,0
	jmp LB_15077
LB_15076:
	bts r12,0
LB_15077:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15072
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f9524 {  } ⊢ %_12985 : %_12985
 ; {>  %_12984~0':_r64 }
; _f9524 {  } ⊢ °2◂{  }
; _some { %_12985 %_12984 } ⊢ %_12986 : %_12986
 ; {>  %_12984~0':_r64 %_12985~°2◂{  }:_p9453 }
; _some { °2◂{  } 0' } ⊢ °0◂{ °2◂{  } 0' }
; ∎ %_12986
 ; {>  %_12986~°0◂{ °2◂{  } 0' }:(_opn)◂({ _p9453 _r64 }) }
; 	∎ °0◂{ °2◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °2◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_15066
	mov rsi,0
	bt r14,0
	jc LB_15066
	jmp LB_15067
LB_15066:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_15067:
	mov rax,0x0200_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_15064
	btr QWORD [rdi],0
	jmp LB_15065
LB_15064:
	bts QWORD [rdi],0
LB_15065:
	mov r14,r13
	bt r12,0
	jc LB_15070
	btr r12,1
	jmp LB_15071
LB_15070:
	bts r12,1
LB_15071:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_15068
	btr QWORD [rdi],1
	jmp LB_15069
LB_15068:
	bts QWORD [rdi],1
LB_15069:
	mov r8,0
	bts r12,2
	ret
LB_15072:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15074
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15073
LB_15074:
	add rsp,8
	ret
LB_15075:
	add rsp,32
	pop r14
LB_15073:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _scf_d
	push r10
	call NS_E_8703_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15112
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15104
LB_15112:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_15120
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_15120
	jmp LB_15121
LB_15120:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15118
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15118:
	jmp LB_15104
LB_15121:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15107
	btr r12,1
	jmp LB_15108
LB_15107:
	bts r12,1
LB_15108:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15105
	btr r12,0
	jmp LB_15106
LB_15105:
	bts r12,0
LB_15106:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15101
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f9522 {  } ⊢ %_12988 : %_12988
 ; {>  %_12987~0':_r64 }
; _f9522 {  } ⊢ °0◂{  }
; _some { %_12988 %_12987 } ⊢ %_12989 : %_12989
 ; {>  %_12988~°0◂{  }:_p9453 %_12987~0':_r64 }
; _some { °0◂{  } 0' } ⊢ °0◂{ °0◂{  } 0' }
; ∎ %_12989
 ; {>  %_12989~°0◂{ °0◂{  } 0' }:(_opn)◂({ _p9453 _r64 }) }
; 	∎ °0◂{ °0◂{  } 0' }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂{ °0◂{  } 0' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_15095
	mov rsi,0
	bt r14,0
	jc LB_15095
	jmp LB_15096
LB_15095:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_15096:
	mov rax,0x0000_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_15093
	btr QWORD [rdi],0
	jmp LB_15094
LB_15093:
	bts QWORD [rdi],0
LB_15094:
	mov r14,r13
	bt r12,0
	jc LB_15099
	btr r12,1
	jmp LB_15100
LB_15099:
	bts r12,1
LB_15100:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_15097
	btr QWORD [rdi],1
	jmp LB_15098
LB_15097:
	bts QWORD [rdi],1
LB_15098:
	mov r8,0
	bts r12,2
	ret
LB_15101:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15103
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15102
LB_15103:
	add rsp,8
	ret
LB_15104:
	add rsp,32
	pop r14
LB_15102:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12767:
NS_E_RDI_12767:
NS_E_12767_ETR_TBL:
NS_E_12767_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "`"
	add r14,1
	cmp r14,r10
	jg LB_15137
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,96
	jnz LB_15137
	jmp LB_15138
LB_15137:
	jmp LB_15127
LB_15138:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; line
	push r10
	call NS_E_12768_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15142
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15143
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15143:
	jmp LB_15127
LB_15142:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15130
	btr r12,1
	jmp LB_15131
LB_15130:
	bts r12,1
LB_15131:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15128
	btr r12,0
	jmp LB_15129
LB_15128:
	bts r12,0
LB_15129:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15124
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_15145
	btr r12,2
	jmp LB_15146
LB_15145:
	bts r12,2
LB_15146:
	mov r13,r14
	bt r12,1
	jc LB_15147
	btr r12,0
	jmp LB_15148
LB_15147:
	bts r12,0
LB_15148:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f8814 %_12990 ⊢ %_12991 : %_12991
 ; {>  %_12990~0':(_lst)◂(_r64) }
; _f8814 0' ⊢ 0'
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
	call NS_E_8814
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 0'
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _some %_12991 ⊢ %_12992 : %_12992
 ; {>  %_12991~0':_stg }
; _some 0' ⊢ °0◂0'
; ∎ %_12992
 ; {>  %_12992~°0◂0':(_opn)◂(_stg) }
; 	∎ °0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15122
	btr r12,3
	jmp LB_15123
LB_15122:
	bts r12,3
LB_15123:
	mov r8,0
	bts r12,2
	ret
LB_15124:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15126
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15125
LB_15126:
	add rsp,8
	ret
LB_15127:
	add rsp,32
	pop r14
LB_15125:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12768:
NS_E_RDI_12768:
NS_E_12768_ETR_TBL:
NS_E_12768_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\n"
	add r14,1
	cmp r14,r10
	jg LB_15170
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_15170
	jmp LB_15171
LB_15170:
	jmp LB_15162
LB_15171:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15163
	btr r12,0
	jmp LB_15164
LB_15163:
	bts r12,0
LB_15164:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_15159
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; » 0xra |~ {  } ⊢ %_12993 : %_12993
 ; {>  }
; 	» 0xra _ ⊢ 0' : %_12993
	mov rdi,0xa
	mov r13,rdi
	bts r12,0
; _nil {  } ⊢ %_12994 : %_12994
 ; {>  %_12993~0':_r64 }
; _nil {  } ⊢ °1◂{  }
; _cns { %_12993 %_12994 } ⊢ %_12995 : %_12995
 ; {>  %_12993~0':_r64 %_12994~°1◂{  }:(_lst)◂(t6554'(0)) }
; _cns { 0' °1◂{  } } ⊢ °0◂{ 0' °1◂{  } }
; _some %_12995 ⊢ %_12996 : %_12996
 ; {>  %_12995~°0◂{ 0' °1◂{  } }:(_lst)◂(_r64) }
; _some °0◂{ 0' °1◂{  } } ⊢ °0◂°0◂{ 0' °1◂{  } }
; ∎ %_12996
 ; {>  %_12996~°0◂°0◂{ 0' °1◂{  } }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂{ 0' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r14,r13
	bt r12,0
	jc LB_15153
	btr r12,1
	jmp LB_15154
LB_15153:
	bts r12,1
LB_15154:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_15151
	btr QWORD [rdi],0
	jmp LB_15152
LB_15151:
	bts QWORD [rdi],0
LB_15152:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r14,rax
	btr r12,1
	mov rsi,1
	bt r12,1
	jc LB_15157
	mov rsi,0
	bt r14,0
	jc LB_15157
	jmp LB_15158
LB_15157:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r14
	mov QWORD [rax+8*1],rdi
	mov r14,rax
	btr r12,1
LB_15158:
	mov rax,0x0100_0000_0000_0001
	or r14,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_15155
	btr QWORD [rdi],1
	jmp LB_15156
LB_15155:
	bts QWORD [rdi],1
LB_15156:
	mov rsi,1
	bt r12,3
	jc LB_15149
	mov rsi,0
	bt r9,0
	jc LB_15149
	jmp LB_15150
LB_15149:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15150:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15159:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15161
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15160
LB_15161:
	add rsp,8
	ret
LB_15162:
	add rsp,16
	pop r14
LB_15160:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; _byt
	push r10
	call NS_E_8701_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15193
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15185
LB_15193:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; line
	push r10
	call NS_E_12768_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15198
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15199
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15199:
	jmp LB_15185
LB_15198:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15188
	btr r12,1
	jmp LB_15189
LB_15188:
	bts r12,1
LB_15189:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15186
	btr r12,0
	jmp LB_15187
LB_15186:
	bts r12,0
LB_15187:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15182
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_12997 %_12998 } ⊢ %_12999 : %_12999
 ; {>  %_12998~1':(_lst)◂(_r64) %_12997~0':_r64 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_12999 ⊢ %_13000 : %_13000
 ; {>  %_12999~°0◂{ 0' 1' }:(_lst)◂(_r64) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13000
 ; {>  %_13000~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_r64)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15176
	btr r12,2
	jmp LB_15177
LB_15176:
	bts r12,2
LB_15177:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15174
	btr QWORD [rdi],0
	jmp LB_15175
LB_15174:
	bts QWORD [rdi],0
LB_15175:
	mov r8,r14
	bt r12,1
	jc LB_15180
	btr r12,2
	jmp LB_15181
LB_15180:
	bts r12,2
LB_15181:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15178
	btr QWORD [rdi],1
	jmp LB_15179
LB_15178:
	bts QWORD [rdi],1
LB_15179:
	mov rsi,1
	bt r12,3
	jc LB_15172
	mov rsi,0
	bt r9,0
	jc LB_15172
	jmp LB_15173
LB_15172:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15173:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15182:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15184
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15183
LB_15184:
	add rsp,8
	ret
LB_15185:
	add rsp,32
	pop r14
LB_15183:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12769:
NS_E_RDI_12769:
NS_E_12769_ETR_TBL:
NS_E_12769_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\136\144."
	jmp LB_15239
LB_15238:
	add r14,1
LB_15239:
	cmp r14,r10
	jge LB_15240
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15238
	cmp al,10
	jz LB_15238
	cmp al,32
	jz LB_15238
LB_15240:
	add r14,4
	cmp r14,r10
	jg LB_15243
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_15243
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_15243
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_15243
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_15243
	jmp LB_15244
LB_15243:
	jmp LB_15217
LB_15244:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_15226
LB_15225:
	add r14,1
LB_15226:
	cmp r14,r10
	jge LB_15227
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15225
	cmp al,10
	jz LB_15225
	cmp al,32
	jz LB_15225
LB_15227:
	push r10
	call NS_E_12770_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15228
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15229
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15229:
	jmp LB_15218
LB_15228:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_15232
LB_15231:
	add r14,1
LB_15232:
	cmp r14,r10
	jge LB_15233
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15231
	cmp al,10
	jz LB_15231
	cmp al,32
	jz LB_15231
LB_15233:
	push r10
	call NS_E_12761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15234
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15235
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15235:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15236
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15236:
	jmp LB_15218
LB_15234:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15223
	btr r12,2
	jmp LB_15224
LB_15223:
	bts r12,2
LB_15224:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15221
	btr r12,1
	jmp LB_15222
LB_15221:
	bts r12,1
LB_15222:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15219
	btr r12,0
	jmp LB_15220
LB_15219:
	bts r12,0
LB_15220:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_15214
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_15245
	btr r12,3
	jmp LB_15246
LB_15245:
	bts r12,3
LB_15246:
	mov r14,r8
	bt r12,2
	jc LB_15247
	btr r12,1
	jmp LB_15248
LB_15247:
	bts r12,1
LB_15248:
	mov r8,r13
	bt r12,0
	jc LB_15249
	btr r12,2
	jmp LB_15250
LB_15249:
	bts r12,2
LB_15250:
	mov r13,r9
	bt r12,3
	jc LB_15251
	btr r12,0
	jmp LB_15252
LB_15251:
	bts r12,0
LB_15252:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_13003 : %_13003
 ; {>  %_13002~1':_p9446 %_13001~0':(_lst)◂(_p9449) }
; _nil {  } ⊢ °1◂{  }
; _f9509 %_13002 ⊢ %_13004 : %_13004
 ; {>  %_13003~°1◂{  }:(_lst)◂(t6569'(0)) %_13002~1':_p9446 %_13001~0':(_lst)◂(_p9449) }
; _f9509 1' ⊢ °1◂1'
; _f9507 { %_13003 %_13004 } ⊢ %_13005 : %_13005
 ; {>  %_13003~°1◂{  }:(_lst)◂(t6569'(0)) %_13001~0':(_lst)◂(_p9449) %_13004~°1◂1':_p9448 }
; _f9507 { °1◂{  } °1◂1' } ⊢ °1◂{ °1◂{  } °1◂1' }
; _some %_13005 ⊢ %_13006 : %_13006
 ; {>  %_13001~0':(_lst)◂(_p9449) %_13005~°1◂{ °1◂{  } °1◂1' }:_p9447 }
; _some °1◂{ °1◂{  } °1◂1' } ⊢ °0◂°1◂{ °1◂{  } °1◂1' }
; ∎ %_13006
 ; {>  %_13006~°0◂°1◂{ °1◂{  } °1◂1' }:(_opn)◂(_p9447) %_13001~0':(_lst)◂(_p9449) }
; 	∎ °0◂°1◂{ °1◂{  } °1◂1' }
	bt r12,0
	jc LB_15201
	mov rdi,r13
	call dlt
LB_15201:
; _emt_mov_ptn_to_ptn:{| 010.. |},°0◂°1◂{ °1◂{  } °1◂1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_15206
	mov rsi,0
	bt r13,0
	jc LB_15206
	jmp LB_15207
LB_15206:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_15207:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_15204
	btr QWORD [rdi],0
	jmp LB_15205
LB_15204:
	bts QWORD [rdi],0
LB_15205:
	mov r13,r14
	bt r12,1
	jc LB_15212
	btr r12,0
	jmp LB_15213
LB_15212:
	bts r12,0
LB_15213:
	mov rsi,1
	bt r12,0
	jc LB_15210
	mov rsi,0
	bt r13,0
	jc LB_15210
	jmp LB_15211
LB_15210:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_15211:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_15208
	btr QWORD [rdi],1
	jmp LB_15209
LB_15208:
	bts QWORD [rdi],1
LB_15209:
	mov rsi,1
	bt r12,3
	jc LB_15202
	mov rsi,0
	bt r9,0
	jc LB_15202
	jmp LB_15203
LB_15202:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15203:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15214:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15216
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15215
LB_15216:
	add rsp,8
	ret
LB_15218:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15217:
	add rsp,48
	pop r14
LB_15215:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "\226\136\144"
	jmp LB_15283
LB_15282:
	add r14,1
LB_15283:
	cmp r14,r10
	jge LB_15284
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15282
	cmp al,10
	jz LB_15282
	cmp al,32
	jz LB_15282
LB_15284:
	add r14,3
	cmp r14,r10
	jg LB_15287
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15287
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_15287
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_15287
	jmp LB_15288
LB_15287:
	jmp LB_15273
LB_15288:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_line
	jmp LB_15290
LB_15289:
	add r14,1
LB_15290:
	cmp r14,r10
	jge LB_15291
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15289
	cmp al,10
	jz LB_15289
	cmp al,32
	jz LB_15289
LB_15291:
	push r10
	call NS_E_12770_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15292
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15293
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15293:
	jmp LB_15273
LB_15292:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_15296
LB_15295:
	add r14,1
LB_15296:
	cmp r14,r10
	jge LB_15297
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15295
	cmp al,10
	jz LB_15295
	cmp al,32
	jz LB_15295
LB_15297:
	push r10
	call NS_E_12761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15298
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15299
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15299:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15300
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15300:
	jmp LB_15273
LB_15298:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_mtc
	jmp LB_15303
LB_15302:
	add r14,1
LB_15303:
	cmp r14,r10
	jge LB_15304
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15302
	cmp al,10
	jz LB_15302
	cmp al,32
	jz LB_15302
LB_15304:
	push r10
	call NS_E_12769_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15305
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15306
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15306:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15307
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15307:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15308
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15308:
	jmp LB_15273
LB_15305:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15280
	btr r12,3
	jmp LB_15281
LB_15280:
	bts r12,3
LB_15281:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15278
	btr r12,2
	jmp LB_15279
LB_15278:
	bts r12,2
LB_15279:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15276
	btr r12,1
	jmp LB_15277
LB_15276:
	bts r12,1
LB_15277:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15274
	btr r12,0
	jmp LB_15275
LB_15274:
	bts r12,0
LB_15275:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_15270
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } 0' 1' 2' }
	mov r10,r8
	bt r12,2
	jc LB_15310
	btr r12,4
	jmp LB_15311
LB_15310:
	bts r12,4
LB_15311:
	mov r8,r9
	bt r12,3
	jc LB_15312
	btr r12,2
	jmp LB_15313
LB_15312:
	bts r12,2
LB_15313:
	mov r9,r14
	bt r12,1
	jc LB_15314
	btr r12,3
	jmp LB_15315
LB_15314:
	bts r12,3
LB_15315:
	mov r14,r10
	bt r12,4
	jc LB_15316
	btr r12,1
	jmp LB_15317
LB_15316:
	bts r12,1
LB_15317:
	mov r10,r13
	bt r12,0
	jc LB_15318
	btr r12,4
	jmp LB_15319
LB_15318:
	bts r12,4
LB_15319:
	mov r13,r9
	bt r12,3
	jc LB_15320
	btr r12,0
	jmp LB_15321
LB_15320:
	bts r12,0
LB_15321:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_13010 : %_13010
 ; {>  %_13008~1':_p9446 %_13009~2':_p9447 %_13007~0':(_lst)◂(_p9449) }
; _nil {  } ⊢ °1◂{  }
; _f9509 %_13008 ⊢ %_13011 : %_13011
 ; {>  %_13010~°1◂{  }:(_lst)◂(t6579'(0)) %_13008~1':_p9446 %_13009~2':_p9447 %_13007~0':(_lst)◂(_p9449) }
; _f9509 1' ⊢ °1◂1'
; _f9506 { %_13010 %_13011 %_13009 } ⊢ %_13012 : %_13012
 ; {>  %_13010~°1◂{  }:(_lst)◂(t6579'(0)) %_13009~2':_p9447 %_13011~°1◂1':_p9448 %_13007~0':(_lst)◂(_p9449) }
; _f9506 { °1◂{  } °1◂1' 2' } ⊢ °0◂{ °1◂{  } °1◂1' 2' }
; _some %_13012 ⊢ %_13013 : %_13013
 ; {>  %_13012~°0◂{ °1◂{  } °1◂1' 2' }:_p9447 %_13007~0':(_lst)◂(_p9449) }
; _some °0◂{ °1◂{  } °1◂1' 2' } ⊢ °0◂°0◂{ °1◂{  } °1◂1' 2' }
; ∎ %_13013
 ; {>  %_13013~°0◂°0◂{ °1◂{  } °1◂1' 2' }:(_opn)◂(_p9447) %_13007~0':(_lst)◂(_p9449) }
; 	∎ °0◂°0◂{ °1◂{  } °1◂1' 2' }
	bt r12,0
	jc LB_15253
	mov rdi,r13
	call dlt
LB_15253:
; _emt_mov_ptn_to_ptn:{| 0110.. |},°0◂°0◂{ °1◂{  } °1◂1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov rsi,1
	bt r12,0
	jc LB_15258
	mov rsi,0
	bt r13,0
	jc LB_15258
	jmp LB_15259
LB_15258:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_15259:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r13
	bt r12,0
	jc LB_15256
	btr QWORD [rdi],0
	jmp LB_15257
LB_15256:
	bts QWORD [rdi],0
LB_15257:
	mov r13,r14
	bt r12,1
	jc LB_15264
	btr r12,0
	jmp LB_15265
LB_15264:
	bts r12,0
LB_15265:
	mov rsi,1
	bt r12,0
	jc LB_15262
	mov rsi,0
	bt r13,0
	jc LB_15262
	jmp LB_15263
LB_15262:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r13
	mov QWORD [rax+8*1],rdi
	mov r13,rax
	btr r12,0
LB_15263:
	mov rax,0x0100_0000_0000_0001
	or r13,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r13
	bt r12,0
	jc LB_15260
	btr QWORD [rdi],1
	jmp LB_15261
LB_15260:
	bts QWORD [rdi],1
LB_15261:
	mov r13,r8
	bt r12,2
	jc LB_15268
	btr r12,0
	jmp LB_15269
LB_15268:
	bts r12,0
LB_15269:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r13
	bt r12,0
	jc LB_15266
	btr QWORD [rdi],2
	jmp LB_15267
LB_15266:
	bts QWORD [rdi],2
LB_15267:
	mov rsi,1
	bt r12,3
	jc LB_15254
	mov rsi,0
	bt r9,0
	jc LB_15254
	jmp LB_15255
LB_15254:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15255:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15270:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15272
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15271
LB_15272:
	add rsp,8
	ret
LB_15273:
	add rsp,64
	pop r14
LB_15271:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12770:
NS_E_RDI_12770:
NS_E_12770_ETR_TBL:
NS_E_12770_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; mtc_test
	jmp LB_15341
LB_15340:
	add r14,1
LB_15341:
	cmp r14,r10
	jge LB_15342
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15340
	cmp al,10
	jz LB_15340
	cmp al,32
	jz LB_15340
LB_15342:
	push r10
	call NS_E_12771_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15343
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15335
LB_15343:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; mtc_test_tl
	jmp LB_15346
LB_15345:
	add r14,1
LB_15346:
	cmp r14,r10
	jge LB_15347
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15345
	cmp al,10
	jz LB_15345
	cmp al,32
	jz LB_15345
LB_15347:
	push r10
	call NS_E_12772_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15348
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15349
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15349:
	jmp LB_15335
LB_15348:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15338
	btr r12,1
	jmp LB_15339
LB_15338:
	bts r12,1
LB_15339:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15336
	btr r12,0
	jmp LB_15337
LB_15336:
	bts r12,0
LB_15337:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15332
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _cns { %_13014 %_13015 } ⊢ %_13016 : %_13016
 ; {>  %_13015~1':(_lst)◂(_p9449) %_13014~0':_p9449 }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13016 ⊢ %_13017 : %_13017
 ; {>  %_13016~°0◂{ 0' 1' }:(_lst)◂(_p9449) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13017
 ; {>  %_13017~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p9449)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15326
	btr r12,2
	jmp LB_15327
LB_15326:
	bts r12,2
LB_15327:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15324
	btr QWORD [rdi],0
	jmp LB_15325
LB_15324:
	bts QWORD [rdi],0
LB_15325:
	mov r8,r14
	bt r12,1
	jc LB_15330
	btr r12,2
	jmp LB_15331
LB_15330:
	bts r12,2
LB_15331:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15328
	btr QWORD [rdi],1
	jmp LB_15329
LB_15328:
	bts QWORD [rdi],1
LB_15329:
	mov rsi,1
	bt r12,3
	jc LB_15322
	mov rsi,0
	bt r9,0
	jc LB_15322
	jmp LB_15323
LB_15322:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15323:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15332:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15334
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15333
LB_15334:
	add rsp,8
	ret
LB_15335:
	add rsp,32
	pop r14
LB_15333:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_15362
LB_15361:
	add r14,1
LB_15362:
	cmp r14,r10
	jge LB_15363
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15361
	cmp al,32
	jz LB_15361
LB_15363:
	add r14,1
	cmp r14,r10
	jg LB_15366
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_15366
	jmp LB_15367
LB_15366:
	jmp LB_15356
LB_15367:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_15369
LB_15368:
	add r14,1
LB_15369:
	cmp r14,r10
	jge LB_15370
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15368
	cmp al,32
	jz LB_15368
LB_15370:
	add r14,1
	cmp r14,r10
	jg LB_15374
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_15374
	jmp LB_15375
LB_15374:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15372
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15372:
	jmp LB_15356
LB_15375:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15359
	btr r12,1
	jmp LB_15360
LB_15359:
	bts r12,1
LB_15360:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15357
	btr r12,0
	jmp LB_15358
LB_15357:
	bts r12,0
LB_15358:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15353
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_13018 : %_13018
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13018 ⊢ %_13019 : %_13019
 ; {>  %_13018~°1◂{  }:(_lst)◂(t6592'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13019
 ; {>  %_13019~°0◂°1◂{  }:(_opn)◂((_lst)◂(t6595'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_15351
	mov rsi,0
	bt r9,0
	jc LB_15351
	jmp LB_15352
LB_15351:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15352:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15353:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15355
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15354
LB_15355:
	add rsp,8
	ret
LB_15356:
	add rsp,32
	pop r14
LB_15354:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12771:
NS_E_RDI_12771:
NS_E_12771_ETR_TBL:
NS_E_12771_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; src_ptn
	jmp LB_15432
LB_15431:
	add r14,1
LB_15432:
	cmp r14,r10
	jge LB_15433
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15431
	cmp al,10
	jz LB_15431
	cmp al,32
	jz LB_15431
LB_15433:
	push r10
	call NS_E_11898_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15434
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15393
LB_15434:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "\226\138\162"
	jmp LB_15437
LB_15436:
	add r14,1
LB_15437:
	cmp r14,r10
	jge LB_15438
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15436
	cmp al,10
	jz LB_15436
	cmp al,32
	jz LB_15436
LB_15438:
	add r14,3
	cmp r14,r10
	jg LB_15442
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15442
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_15442
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_15442
	jmp LB_15443
LB_15442:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15440
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15440:
	jmp LB_15393
LB_15443:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; name
	jmp LB_15406
LB_15405:
	add r14,1
LB_15406:
	cmp r14,r10
	jge LB_15407
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15405
	cmp al,10
	jz LB_15405
	cmp al,32
	jz LB_15405
LB_15407:
	push r10
	call NS_E_11702_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15408
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15409
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15409:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15410
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15410:
	jmp LB_15394
LB_15408:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; "\226\151\130"
	jmp LB_15413
LB_15412:
	add r14,1
LB_15413:
	cmp r14,r10
	jge LB_15414
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15412
	cmp al,10
	jz LB_15412
	cmp al,32
	jz LB_15412
LB_15414:
	add r14,3
	cmp r14,r10
	jg LB_15420
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15420
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,151
	jnz LB_15420
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,130
	jnz LB_15420
	jmp LB_15421
LB_15420:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15416
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15416:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15417
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15417:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15418
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15418:
	jmp LB_15394
LB_15421:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*3],0
	mov QWORD [rsp+8*1+16*3],rax
; dst_ptn
	jmp LB_15423
LB_15422:
	add r14,1
LB_15423:
	cmp r14,r10
	jge LB_15424
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15422
	cmp al,10
	jz LB_15422
	cmp al,32
	jz LB_15422
LB_15424:
	push r10
	call NS_E_12162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15425
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15426
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15426:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15427
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15427:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15428
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15428:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15429
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15429:
	jmp LB_15394
LB_15425:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_15403
	btr r12,4
	jmp LB_15404
LB_15403:
	bts r12,4
LB_15404:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15401
	btr r12,3
	jmp LB_15402
LB_15401:
	bts r12,3
LB_15402:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15399
	btr r12,2
	jmp LB_15400
LB_15399:
	bts r12,2
LB_15400:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15397
	btr r12,1
	jmp LB_15398
LB_15397:
	bts r12,1
LB_15398:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15395
	btr r12,0
	jmp LB_15396
LB_15395:
	bts r12,0
LB_15396:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_15390
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' {  } 1' {  } 2' }
	mov r11,r8
	bt r12,2
	jc LB_15444
	btr r12,5
	jmp LB_15445
LB_15444:
	bts r12,5
LB_15445:
	mov r8,r10
	bt r12,4
	jc LB_15446
	btr r12,2
	jmp LB_15447
LB_15446:
	bts r12,2
LB_15447:
	mov r10,r14
	bt r12,1
	jc LB_15448
	btr r12,4
	jmp LB_15449
LB_15448:
	bts r12,4
LB_15449:
	mov r14,r11
	bt r12,5
	jc LB_15450
	btr r12,1
	jmp LB_15451
LB_15450:
	bts r12,1
LB_15451:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f9510 { %_13020 %_13021 %_13022 } ⊢ %_13023 : %_13023
 ; {>  %_13021~1':_p9379 %_13020~0':_p9442 %_13022~2':_p9443 }
; _f9510 { 0' 1' 2' } ⊢ °0◂{ 0' 1' 2' }
; _some %_13023 ⊢ %_13024 : %_13024
 ; {>  %_13023~°0◂{ 0' 1' 2' }:_p9449 }
; _some °0◂{ 0' 1' 2' } ⊢ °0◂°0◂{ 0' 1' 2' }
; ∎ %_13024
 ; {>  %_13024~°0◂°0◂{ 0' 1' 2' }:(_opn)◂(_p9449) }
; 	∎ °0◂°0◂{ 0' 1' 2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂°0◂{ 0' 1' 2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_15380
	btr r12,4
	jmp LB_15381
LB_15380:
	bts r12,4
LB_15381:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_15378
	btr QWORD [rdi],0
	jmp LB_15379
LB_15378:
	bts QWORD [rdi],0
LB_15379:
	mov r10,r14
	bt r12,1
	jc LB_15384
	btr r12,4
	jmp LB_15385
LB_15384:
	bts r12,4
LB_15385:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_15382
	btr QWORD [rdi],1
	jmp LB_15383
LB_15382:
	bts QWORD [rdi],1
LB_15383:
	mov r10,r8
	bt r12,2
	jc LB_15388
	btr r12,4
	jmp LB_15389
LB_15388:
	bts r12,4
LB_15389:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_15386
	btr QWORD [rdi],2
	jmp LB_15387
LB_15386:
	bts QWORD [rdi],2
LB_15387:
	mov rsi,1
	bt r12,3
	jc LB_15376
	mov rsi,0
	bt r9,0
	jc LB_15376
	jmp LB_15377
LB_15376:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15377:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15390:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15392
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15391
LB_15392:
	add rsp,8
	ret
LB_15394:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15393:
	add rsp,80
	pop r14
LB_15391:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; mtc_val
	jmp LB_15473
LB_15472:
	add r14,1
LB_15473:
	cmp r14,r10
	jge LB_15474
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15472
	cmp al,32
	jz LB_15472
LB_15474:
	push r10
	call NS_E_12773_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15475
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15465
LB_15475:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "="
	jmp LB_15478
LB_15477:
	add r14,1
LB_15478:
	cmp r14,r10
	jge LB_15479
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15477
	cmp al,32
	jz LB_15477
LB_15479:
	add r14,1
	cmp r14,r10
	jg LB_15483
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,61
	jnz LB_15483
	jmp LB_15484
LB_15483:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15481
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15481:
	jmp LB_15465
LB_15484:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; mtc_val
	jmp LB_15486
LB_15485:
	add r14,1
LB_15486:
	cmp r14,r10
	jge LB_15487
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15485
	cmp al,32
	jz LB_15485
LB_15487:
	push r10
	call NS_E_12773_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15488
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15489
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15489:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15490
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15490:
	jmp LB_15465
LB_15488:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15470
	btr r12,2
	jmp LB_15471
LB_15470:
	bts r12,2
LB_15471:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15468
	btr r12,1
	jmp LB_15469
LB_15468:
	bts r12,1
LB_15469:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15466
	btr r12,0
	jmp LB_15467
LB_15466:
	bts r12,0
LB_15467:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_15462
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' {  } 1' }
	mov r9,r14
	bt r12,1
	jc LB_15492
	btr r12,3
	jmp LB_15493
LB_15492:
	bts r12,3
LB_15493:
	mov r14,r8
	bt r12,2
	jc LB_15494
	btr r12,1
	jmp LB_15495
LB_15494:
	bts r12,1
LB_15495:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; _f9511 { %_13025 %_13026 } ⊢ %_13027 : %_13027
 ; {>  %_13025~0':_p9450 %_13026~1':_p9450 }
; _f9511 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_13027 ⊢ %_13028 : %_13028
 ; {>  %_13027~°1◂{ 0' 1' }:_p9449 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_13028
 ; {>  %_13028~°0◂°1◂{ 0' 1' }:(_opn)◂(_p9449) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15456
	btr r12,2
	jmp LB_15457
LB_15456:
	bts r12,2
LB_15457:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15454
	btr QWORD [rdi],0
	jmp LB_15455
LB_15454:
	bts QWORD [rdi],0
LB_15455:
	mov r8,r14
	bt r12,1
	jc LB_15460
	btr r12,2
	jmp LB_15461
LB_15460:
	bts r12,2
LB_15461:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15458
	btr QWORD [rdi],1
	jmp LB_15459
LB_15458:
	bts QWORD [rdi],1
LB_15459:
	mov rsi,1
	bt r12,3
	jc LB_15452
	mov rsi,0
	bt r9,0
	jc LB_15452
	jmp LB_15453
LB_15452:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15453:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15462:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15464
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15463
LB_15464:
	add rsp,8
	ret
LB_15465:
	add rsp,48
	pop r14
LB_15463:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12772:
NS_E_RDI_12772:
NS_E_12772_ETR_TBL:
NS_E_12772_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; ";"
	jmp LB_15531
LB_15530:
	add r14,1
LB_15531:
	cmp r14,r10
	jge LB_15532
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15530
	cmp al,10
	jz LB_15530
	cmp al,32
	jz LB_15530
LB_15532:
	add r14,1
	cmp r14,r10
	jg LB_15535
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_15535
	jmp LB_15536
LB_15535:
	jmp LB_15509
LB_15536:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; mtc_test
	jmp LB_15518
LB_15517:
	add r14,1
LB_15518:
	cmp r14,r10
	jge LB_15519
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15517
	cmp al,10
	jz LB_15517
	cmp al,32
	jz LB_15517
LB_15519:
	push r10
	call NS_E_12771_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15520
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15521
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15521:
	jmp LB_15510
LB_15520:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; mtc_test_tl
	jmp LB_15524
LB_15523:
	add r14,1
LB_15524:
	cmp r14,r10
	jge LB_15525
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15523
	cmp al,10
	jz LB_15523
	cmp al,32
	jz LB_15523
LB_15525:
	push r10
	call NS_E_12772_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15526
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15527
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15527:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15528
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15528:
	jmp LB_15510
LB_15526:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15515
	btr r12,2
	jmp LB_15516
LB_15515:
	bts r12,2
LB_15516:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15513
	btr r12,1
	jmp LB_15514
LB_15513:
	bts r12,1
LB_15514:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15511
	btr r12,0
	jmp LB_15512
LB_15511:
	bts r12,0
LB_15512:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_15506
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_15537
	btr r12,3
	jmp LB_15538
LB_15537:
	bts r12,3
LB_15538:
	mov r14,r8
	bt r12,2
	jc LB_15539
	btr r12,1
	jmp LB_15540
LB_15539:
	bts r12,1
LB_15540:
	mov r8,r13
	bt r12,0
	jc LB_15541
	btr r12,2
	jmp LB_15542
LB_15541:
	bts r12,2
LB_15542:
	mov r13,r9
	bt r12,3
	jc LB_15543
	btr r12,0
	jmp LB_15544
LB_15543:
	bts r12,0
LB_15544:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _cns { %_13029 %_13030 } ⊢ %_13031 : %_13031
 ; {>  %_13029~0':_p9449 %_13030~1':(_lst)◂(_p9449) }
; _cns { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13031 ⊢ %_13032 : %_13032
 ; {>  %_13031~°0◂{ 0' 1' }:(_lst)◂(_p9449) }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13032
 ; {>  %_13032~°0◂°0◂{ 0' 1' }:(_opn)◂((_lst)◂(_p9449)) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15500
	btr r12,2
	jmp LB_15501
LB_15500:
	bts r12,2
LB_15501:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15498
	btr QWORD [rdi],0
	jmp LB_15499
LB_15498:
	bts QWORD [rdi],0
LB_15499:
	mov r8,r14
	bt r12,1
	jc LB_15504
	btr r12,2
	jmp LB_15505
LB_15504:
	bts r12,2
LB_15505:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15502
	btr QWORD [rdi],1
	jmp LB_15503
LB_15502:
	bts QWORD [rdi],1
LB_15503:
	mov rsi,1
	bt r12,3
	jc LB_15496
	mov rsi,0
	bt r9,0
	jc LB_15496
	jmp LB_15497
LB_15496:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15497:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15506:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15508
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15507
LB_15508:
	add rsp,8
	ret
LB_15510:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15509:
	add rsp,48
	pop r14
LB_15507:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "."
	jmp LB_15556
LB_15555:
	add r14,1
LB_15556:
	cmp r14,r10
	jge LB_15557
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15555
	cmp al,32
	jz LB_15555
LB_15557:
	add r14,1
	cmp r14,r10
	jg LB_15560
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_15560
	jmp LB_15561
LB_15560:
	jmp LB_15550
LB_15561:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\n"
	jmp LB_15563
LB_15562:
	add r14,1
LB_15563:
	cmp r14,r10
	jge LB_15564
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15562
	cmp al,32
	jz LB_15562
LB_15564:
	add r14,1
	cmp r14,r10
	jg LB_15568
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,10
	jnz LB_15568
	jmp LB_15569
LB_15568:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15566
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15566:
	jmp LB_15550
LB_15569:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15553
	btr r12,1
	jmp LB_15554
LB_15553:
	bts r12,1
LB_15554:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15551
	btr r12,0
	jmp LB_15552
LB_15551:
	bts r12,0
LB_15552:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15547
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _nil {  } ⊢ %_13033 : %_13033
 ; {>  }
; _nil {  } ⊢ °1◂{  }
; _some %_13033 ⊢ %_13034 : %_13034
 ; {>  %_13033~°1◂{  }:(_lst)◂(t6616'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13034
 ; {>  %_13034~°0◂°1◂{  }:(_opn)◂((_lst)◂(t6619'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_15545
	mov rsi,0
	bt r9,0
	jc LB_15545
	jmp LB_15546
LB_15545:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15546:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15547:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15549
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15548
LB_15549:
	add rsp,8
	ret
LB_15550:
	add rsp,32
	pop r14
LB_15548:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12773:
NS_E_RDI_12773:
NS_E_12773_ETR_TBL:
NS_E_12773_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15585
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15577
LB_15585:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; "'"
	add r14,1
	cmp r14,r10
	jg LB_15593
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,39
	jnz LB_15593
	jmp LB_15594
LB_15593:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15591
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15591:
	jmp LB_15577
LB_15594:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15580
	btr r12,1
	jmp LB_15581
LB_15580:
	bts r12,1
LB_15581:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15578
	btr r12,0
	jmp LB_15579
LB_15578:
	bts r12,0
LB_15579:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15574
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _f9513 %_13035 ⊢ %_13036 : %_13036
 ; {>  %_13035~0':_stg }
; _f9513 0' ⊢ °1◂0'
; _some %_13036 ⊢ %_13037 : %_13037
 ; {>  %_13036~°1◂0':_p9450 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13037
 ; {>  %_13037~°0◂°1◂0':(_opn)◂(_p9450) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15572
	btr r12,3
	jmp LB_15573
LB_15572:
	bts r12,3
LB_15573:
	mov rsi,1
	bt r12,3
	jc LB_15570
	mov rsi,0
	bt r9,0
	jc LB_15570
	jmp LB_15571
LB_15570:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15571:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15574:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15576
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15575
LB_15576:
	add rsp,8
	ret
LB_15577:
	add rsp,32
	pop r14
LB_15575:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; cst
	push r10
	call NS_E_11769_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15608
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15602
LB_15608:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15603
	btr r12,0
	jmp LB_15604
LB_15603:
	bts r12,0
LB_15604:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_15599
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9512 %_13038 ⊢ %_13039 : %_13039
 ; {>  %_13038~0':_p9445 }
; _f9512 0' ⊢ °0◂0'
; _some %_13039 ⊢ %_13040 : %_13040
 ; {>  %_13039~°0◂0':_p9450 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13040
 ; {>  %_13040~°0◂°0◂0':(_opn)◂(_p9450) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15597
	btr r12,3
	jmp LB_15598
LB_15597:
	bts r12,3
LB_15598:
	mov rsi,1
	bt r12,3
	jc LB_15595
	mov rsi,0
	bt r9,0
	jc LB_15595
	jmp LB_15596
LB_15595:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15596:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15599:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15601
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15600
LB_15601:
	add rsp,8
	ret
LB_15602:
	add rsp,16
	pop r14
LB_15600:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12774:
NS_E_RDI_12774:
NS_E_12774_ETR_TBL:
NS_E_12774_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; "@"
	jmp LB_15631
LB_15630:
	add r14,1
LB_15631:
	cmp r14,r10
	jge LB_15632
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15630
	cmp al,10
	jz LB_15630
	cmp al,32
	jz LB_15630
LB_15632:
	add r14,1
	cmp r14,r10
	jg LB_15635
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,64
	jnz LB_15635
	jmp LB_15636
LB_15635:
	jmp LB_15621
LB_15636:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "."
	jmp LB_15638
LB_15637:
	add r14,1
LB_15638:
	cmp r14,r10
	jge LB_15639
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15637
	cmp al,10
	jz LB_15637
	cmp al,32
	jz LB_15637
LB_15639:
	add r14,1
	cmp r14,r10
	jg LB_15643
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,46
	jnz LB_15643
	jmp LB_15644
LB_15643:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15641
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15641:
	jmp LB_15621
LB_15644:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; word
	jmp LB_15646
LB_15645:
	add r14,1
LB_15646:
	cmp r14,r10
	jge LB_15647
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15645
	cmp al,10
	jz LB_15645
	cmp al,32
	jz LB_15645
LB_15647:
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15648
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15649
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15649:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15650
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15650:
	jmp LB_15621
LB_15648:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_def
	jmp LB_15653
LB_15652:
	add r14,1
LB_15653:
	cmp r14,r10
	jge LB_15654
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15652
	cmp al,10
	jz LB_15652
	cmp al,32
	jz LB_15652
LB_15654:
	push r10
	call NS_E_12775_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15655
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15656
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15656:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15657
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15657:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15658
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15658:
	jmp LB_15621
LB_15655:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15628
	btr r12,3
	jmp LB_15629
LB_15628:
	bts r12,3
LB_15629:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15626
	btr r12,2
	jmp LB_15627
LB_15626:
	bts r12,2
LB_15627:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15624
	btr r12,1
	jmp LB_15625
LB_15624:
	bts r12,1
LB_15625:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15622
	btr r12,0
	jmp LB_15623
LB_15622:
	bts r12,0
LB_15623:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_15618
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { {  } {  } 0' 1' }
	mov r10,r14
	bt r12,1
	jc LB_15660
	btr r12,4
	jmp LB_15661
LB_15660:
	bts r12,4
LB_15661:
	mov r14,r9
	bt r12,3
	jc LB_15662
	btr r12,1
	jmp LB_15663
LB_15662:
	bts r12,1
LB_15663:
	mov r9,r13
	bt r12,0
	jc LB_15664
	btr r12,3
	jmp LB_15665
LB_15664:
	bts r12,3
LB_15665:
	mov r13,r8
	bt r12,2
	jc LB_15666
	btr r12,0
	jmp LB_15667
LB_15666:
	bts r12,0
LB_15667:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some { %_13041 %_13042 } ⊢ %_13043 : %_13043
 ; {>  %_13042~1':_p9431 %_13041~0':_stg }
; _some { 0' 1' } ⊢ °0◂{ 0' 1' }
; ∎ %_13043
 ; {>  %_13043~°0◂{ 0' 1' }:(_opn)◂({ _stg _p9431 }) }
; 	∎ °0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15612
	btr r12,2
	jmp LB_15613
LB_15612:
	bts r12,2
LB_15613:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15610
	btr QWORD [rdi],0
	jmp LB_15611
LB_15610:
	bts QWORD [rdi],0
LB_15611:
	mov r8,r14
	bt r12,1
	jc LB_15616
	btr r12,2
	jmp LB_15617
LB_15616:
	bts r12,2
LB_15617:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15614
	btr QWORD [rdi],1
	jmp LB_15615
LB_15614:
	bts QWORD [rdi],1
LB_15615:
	mov r8,0
	bts r12,2
	ret
LB_15618:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15620
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15619
LB_15620:
	add rsp,8
	ret
LB_15621:
	add rsp,64
	pop r14
LB_15619:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12775:
NS_E_RDI_12775:
NS_E_12775_ETR_TBL:
NS_E_12775_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_act
	jmp LB_15679
LB_15678:
	add r14,1
LB_15679:
	cmp r14,r10
	jge LB_15680
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15678
	cmp al,10
	jz LB_15678
	cmp al,32
	jz LB_15678
LB_15680:
	push r10
	call NS_E_12776_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15681
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15675
LB_15681:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15676
	btr r12,0
	jmp LB_15677
LB_15676:
	bts r12,0
LB_15677:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_15672
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9468 %_13044 ⊢ %_13045 : %_13045
 ; {>  %_13044~0':_p9433 }
; _f9468 0' ⊢ °1◂0'
; _some %_13045 ⊢ %_13046 : %_13046
 ; {>  %_13045~°1◂0':_p9431 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13046
 ; {>  %_13046~°0◂°1◂0':(_opn)◂(_p9431) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15670
	btr r12,3
	jmp LB_15671
LB_15670:
	bts r12,3
LB_15671:
	mov rsi,1
	bt r12,3
	jc LB_15668
	mov rsi,0
	bt r9,0
	jc LB_15668
	jmp LB_15669
LB_15668:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15669:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15672:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15674
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15673
LB_15674:
	add rsp,8
	ret
LB_15675:
	add rsp,16
	pop r14
LB_15673:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_etr_cnc
	jmp LB_15694
LB_15693:
	add r14,1
LB_15694:
	cmp r14,r10
	jge LB_15695
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15693
	cmp al,10
	jz LB_15693
	cmp al,32
	jz LB_15693
LB_15695:
	push r10
	call NS_E_12784_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15696
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15690
LB_15696:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15691
	btr r12,0
	jmp LB_15692
LB_15691:
	bts r12,0
LB_15692:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_15687
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9467 %_13047 ⊢ %_13048 : %_13048
 ; {>  %_13047~0':_p9432 }
; _f9467 0' ⊢ °0◂0'
; _some %_13048 ⊢ %_13049 : %_13049
 ; {>  %_13048~°0◂0':_p9431 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13049
 ; {>  %_13049~°0◂°0◂0':(_opn)◂(_p9431) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15685
	btr r12,3
	jmp LB_15686
LB_15685:
	bts r12,3
LB_15686:
	mov rsi,1
	bt r12,3
	jc LB_15683
	mov rsi,0
	bt r9,0
	jc LB_15683
	jmp LB_15684
LB_15683:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15684:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15687:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15689
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15688
LB_15689:
	add rsp,8
	ret
LB_15690:
	add rsp,16
	pop r14
LB_15688:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12776:
NS_E_RDI_12776:
NS_E_12776_ETR_TBL:
NS_E_12776_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; grm_ord_end
	jmp LB_15747
LB_15746:
	add r14,1
LB_15747:
	cmp r14,r10
	jge LB_15748
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15746
	cmp al,10
	jz LB_15746
	cmp al,32
	jz LB_15746
LB_15748:
	push r10
	call NS_E_12783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15749
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15725
LB_15749:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_15734
LB_15733:
	add r14,1
LB_15734:
	cmp r14,r10
	jge LB_15735
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15733
	cmp al,10
	jz LB_15733
	cmp al,32
	jz LB_15733
LB_15735:
	push r10
	call NS_E_12778_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15736
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15737
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15737:
	jmp LB_15726
LB_15736:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_15740
LB_15739:
	add r14,1
LB_15740:
	cmp r14,r10
	jge LB_15741
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15739
	cmp al,10
	jz LB_15739
	cmp al,32
	jz LB_15739
LB_15741:
	push r10
	call NS_E_12777_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15742
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15743
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15743:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15744
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15744:
	jmp LB_15726
LB_15742:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15731
	btr r12,2
	jmp LB_15732
LB_15731:
	bts r12,2
LB_15732:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15729
	btr r12,1
	jmp LB_15730
LB_15729:
	bts r12,1
LB_15730:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15727
	btr r12,0
	jmp LB_15728
LB_15727:
	bts r12,0
LB_15728:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_15722
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { 0' 1' { 2' 3' 4' } }
	mov r11,r8
	bt r12,2
	jc LB_15751
	btr r12,5
	jmp LB_15752
LB_15751:
	bts r12,5
LB_15752:
; 5' ⊢ { 2' 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_15755
	btr r12,6
	jmp LB_15756
LB_15755:
	bts r12,6
LB_15756:
	mov r8,rcx
	bt r12,6
	jc LB_15753
	btr r12,2
	jmp LB_15754
LB_15753:
	bts r12,2
LB_15754:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_15759
	btr r12,6
	jmp LB_15760
LB_15759:
	bts r12,6
LB_15760:
	mov r9,rcx
	bt r12,6
	jc LB_15757
	btr r12,3
	jmp LB_15758
LB_15757:
	bts r12,3
LB_15758:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*2]
	mov rcx,rax
	bt QWORD [rdi],2
	jc LB_15763
	btr r12,6
	jmp LB_15764
LB_15763:
	bts r12,6
LB_15764:
	mov r10,rcx
	bt r12,6
	jc LB_15761
	btr r12,4
	jmp LB_15762
LB_15761:
	bts r12,4
LB_15762:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
; _f9472 { %_13052 %_13053 %_13050 %_13051 %_13054 } ⊢ %_13055 : %_13055
 ; {>  %_13053~3':_p9446 %_13052~2':_p9443 %_13051~1':_p9435 %_13054~4':(_opn)◂(_p9433) %_13050~0':_p9434 }
; _f9472 { 2' 3' 0' 1' 4' } ⊢ °1◂{ 2' 3' 0' 1' 4' }
; _some %_13055 ⊢ %_13056 : %_13056
 ; {>  %_13055~°1◂{ 2' 3' 0' 1' 4' }:_p9433 }
; _some °1◂{ 2' 3' 0' 1' 4' } ⊢ °0◂°1◂{ 2' 3' 0' 1' 4' }
; ∎ %_13056
 ; {>  %_13056~°0◂°1◂{ 2' 3' 0' 1' 4' }:(_opn)◂(_p9433) }
; 	∎ °0◂°1◂{ 2' 3' 0' 1' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°1◂{ 2' 3' 0' 1' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_15698
	btr r12,5
	jmp LB_15699
LB_15698:
	bts r12,5
LB_15699:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r8
	bt r12,2
	jc LB_15704
	btr r12,6
	jmp LB_15705
LB_15704:
	bts r12,6
LB_15705:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_15702
	btr QWORD [rdi],0
	jmp LB_15703
LB_15702:
	bts QWORD [rdi],0
LB_15703:
	mov rcx,r11
	bt r12,5
	jc LB_15708
	btr r12,6
	jmp LB_15709
LB_15708:
	bts r12,6
LB_15709:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_15706
	btr QWORD [rdi],1
	jmp LB_15707
LB_15706:
	bts QWORD [rdi],1
LB_15707:
	mov rcx,r13
	bt r12,0
	jc LB_15712
	btr r12,6
	jmp LB_15713
LB_15712:
	bts r12,6
LB_15713:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_15710
	btr QWORD [rdi],2
	jmp LB_15711
LB_15710:
	bts QWORD [rdi],2
LB_15711:
	mov rcx,r14
	bt r12,1
	jc LB_15716
	btr r12,6
	jmp LB_15717
LB_15716:
	bts r12,6
LB_15717:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_15714
	btr QWORD [rdi],3
	jmp LB_15715
LB_15714:
	bts QWORD [rdi],3
LB_15715:
	mov rcx,r10
	bt r12,4
	jc LB_15720
	btr r12,6
	jmp LB_15721
LB_15720:
	bts r12,6
LB_15721:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_15718
	btr QWORD [rdi],4
	jmp LB_15719
LB_15718:
	bts QWORD [rdi],4
LB_15719:
	mov rsi,1
	bt r12,3
	jc LB_15700
	mov rsi,0
	bt r9,0
	jc LB_15700
	jmp LB_15701
LB_15700:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15701:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15722:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15724
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15723
LB_15724:
	add rsp,8
	ret
LB_15726:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15725:
	add rsp,48
	pop r14
LB_15723:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord
	jmp LB_15806
LB_15805:
	add r14,1
LB_15806:
	cmp r14,r10
	jge LB_15807
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15805
	cmp al,10
	jz LB_15805
	cmp al,32
	jz LB_15805
LB_15807:
	push r10
	call NS_E_12782_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15808
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15796
LB_15808:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_15811
LB_15810:
	add r14,1
LB_15811:
	cmp r14,r10
	jge LB_15812
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15810
	cmp al,10
	jz LB_15810
	cmp al,32
	jz LB_15810
LB_15812:
	push r10
	call NS_E_12778_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15813
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15814
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15814:
	jmp LB_15796
LB_15813:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_etr_act_act
	jmp LB_15817
LB_15816:
	add r14,1
LB_15817:
	cmp r14,r10
	jge LB_15818
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15816
	cmp al,10
	jz LB_15816
	cmp al,32
	jz LB_15816
LB_15818:
	push r10
	call NS_E_12777_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15819
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15820
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15820:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15821
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15821:
	jmp LB_15796
LB_15819:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_act
	jmp LB_15824
LB_15823:
	add r14,1
LB_15824:
	cmp r14,r10
	jge LB_15825
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15823
	cmp al,10
	jz LB_15823
	cmp al,32
	jz LB_15823
LB_15825:
	push r10
	call NS_E_12776_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15826
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15827
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15827:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15828
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15828:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15829
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15829:
	jmp LB_15796
LB_15826:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15803
	btr r12,3
	jmp LB_15804
LB_15803:
	bts r12,3
LB_15804:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15801
	btr r12,2
	jmp LB_15802
LB_15801:
	bts r12,2
LB_15802:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15799
	btr r12,1
	jmp LB_15800
LB_15799:
	bts r12,1
LB_15800:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15797
	btr r12,0
	jmp LB_15798
LB_15797:
	bts r12,0
LB_15798:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_15793
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' { 2' 3' 4' } 5' }
	mov r11,r9
	bt r12,3
	jc LB_15831
	btr r12,5
	jmp LB_15832
LB_15831:
	bts r12,5
LB_15832:
	mov rcx,r8
	bt r12,2
	jc LB_15833
	btr r12,6
	jmp LB_15834
LB_15833:
	bts r12,6
LB_15834:
; 6' ⊢ { 2' 3' 4' }
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*0]
	mov rdx,rax
	bt QWORD [rdi],0
	jc LB_15837
	btr r12,7
	jmp LB_15838
LB_15837:
	bts r12,7
LB_15838:
	mov r8,rdx
	bt r12,7
	jc LB_15835
	btr r12,2
	jmp LB_15836
LB_15835:
	bts r12,2
LB_15836:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*1]
	mov rdx,rax
	bt QWORD [rdi],1
	jc LB_15841
	btr r12,7
	jmp LB_15842
LB_15841:
	bts r12,7
LB_15842:
	mov r9,rdx
	bt r12,7
	jc LB_15839
	btr r12,3
	jmp LB_15840
LB_15839:
	bts r12,3
LB_15840:
	mov rdi,rcx
	mov rax,QWORD [rdi+8*1+8*2]
	mov rdx,rax
	bt QWORD [rdi],2
	jc LB_15845
	btr r12,7
	jmp LB_15846
LB_15845:
	bts r12,7
LB_15846:
	mov r10,rdx
	bt r12,7
	jc LB_15843
	btr r12,4
	jmp LB_15844
LB_15843:
	bts r12,4
LB_15844:
	mov rdi,rcx
	mov [rdi],rbx
	mov rbx,rdi
; _f9471 { %_13059 %_13060 %_13057 %_13058 %_13061 %_13062 } ⊢ %_13063 : %_13063
 ; {>  %_13059~2':_p9443 %_13058~1':_p9435 %_13060~3':_p9446 %_13057~0':_p9434 %_13062~5':_p9433 %_13061~4':(_opn)◂(_p9433) }
; _f9471 { 2' 3' 0' 1' 4' 5' } ⊢ °0◂{ 2' 3' 0' 1' 4' 5' }
; _some %_13063 ⊢ %_13064 : %_13064
 ; {>  %_13063~°0◂{ 2' 3' 0' 1' 4' 5' }:_p9433 }
; _some °0◂{ 2' 3' 0' 1' 4' 5' } ⊢ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; ∎ %_13064
 ; {>  %_13064~°0◂°0◂{ 2' 3' 0' 1' 4' 5' }:(_opn)◂(_p9433) }
; 	∎ °0◂°0◂{ 2' 3' 0' 1' 4' 5' }
; _emt_mov_ptn_to_ptn:{| 1111110.. |},°0◂°0◂{ 2' 3' 0' 1' 4' 5' } ⊢ 2'◂3'
	mov rcx,r9
	bt r12,3
	jc LB_15765
	btr r12,6
	jmp LB_15766
LB_15765:
	bts r12,6
LB_15766:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0006_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rdx,r8
	bt r12,2
	jc LB_15771
	btr r12,7
	jmp LB_15772
LB_15771:
	bts r12,7
LB_15772:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rdx
	bt r12,7
	jc LB_15769
	btr QWORD [rdi],0
	jmp LB_15770
LB_15769:
	bts QWORD [rdi],0
LB_15770:
	mov rdx,rcx
	bt r12,6
	jc LB_15775
	btr r12,7
	jmp LB_15776
LB_15775:
	bts r12,7
LB_15776:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rdx
	bt r12,7
	jc LB_15773
	btr QWORD [rdi],1
	jmp LB_15774
LB_15773:
	bts QWORD [rdi],1
LB_15774:
	mov rdx,r13
	bt r12,0
	jc LB_15779
	btr r12,7
	jmp LB_15780
LB_15779:
	bts r12,7
LB_15780:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rdx
	bt r12,7
	jc LB_15777
	btr QWORD [rdi],2
	jmp LB_15778
LB_15777:
	bts QWORD [rdi],2
LB_15778:
	mov rdx,r14
	bt r12,1
	jc LB_15783
	btr r12,7
	jmp LB_15784
LB_15783:
	bts r12,7
LB_15784:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rdx
	bt r12,7
	jc LB_15781
	btr QWORD [rdi],3
	jmp LB_15782
LB_15781:
	bts QWORD [rdi],3
LB_15782:
	mov rdx,r10
	bt r12,4
	jc LB_15787
	btr r12,7
	jmp LB_15788
LB_15787:
	bts r12,7
LB_15788:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rdx
	bt r12,7
	jc LB_15785
	btr QWORD [rdi],4
	jmp LB_15786
LB_15785:
	bts QWORD [rdi],4
LB_15786:
	mov rdx,r11
	bt r12,5
	jc LB_15791
	btr r12,7
	jmp LB_15792
LB_15791:
	bts r12,7
LB_15792:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*5],rdx
	bt r12,7
	jc LB_15789
	btr QWORD [rdi],5
	jmp LB_15790
LB_15789:
	bts QWORD [rdi],5
LB_15790:
	mov rsi,1
	bt r12,3
	jc LB_15767
	mov rsi,0
	bt r9,0
	jc LB_15767
	jmp LB_15768
LB_15767:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15768:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15793:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15795
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15794
LB_15795:
	add rsp,8
	ret
LB_15796:
	add rsp,64
	pop r14
LB_15794:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12777:
NS_E_RDI_12777:
NS_E_12777_ETR_TBL:
NS_E_12777_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; ";"
	jmp LB_15901
LB_15900:
	add r14,1
LB_15901:
	cmp r14,r10
	jge LB_15902
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15900
	cmp al,10
	jz LB_15900
	cmp al,32
	jz LB_15900
LB_15902:
	add r14,1
	cmp r14,r10
	jg LB_15905
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_15905
	jmp LB_15906
LB_15905:
	jmp LB_15864
LB_15906:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; "\226\138\162"
	jmp LB_15908
LB_15907:
	add r14,1
LB_15908:
	cmp r14,r10
	jge LB_15909
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15907
	cmp al,10
	jz LB_15907
	cmp al,32
	jz LB_15907
LB_15909:
	add r14,3
	cmp r14,r10
	jg LB_15913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_15913
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_15913
	jmp LB_15914
LB_15913:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15911
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15911:
	jmp LB_15864
LB_15914:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
; dst_ptn
	jmp LB_15877
LB_15876:
	add r14,1
LB_15877:
	cmp r14,r10
	jge LB_15878
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15876
	cmp al,10
	jz LB_15876
	cmp al,32
	jz LB_15876
LB_15878:
	push r10
	call NS_E_12162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15879
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15880
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15880:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15881
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15881:
	jmp LB_15865
LB_15879:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; lc_code
	jmp LB_15884
LB_15883:
	add r14,1
LB_15884:
	cmp r14,r10
	jge LB_15885
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15883
	cmp al,10
	jz LB_15883
	cmp al,32
	jz LB_15883
LB_15885:
	push r10
	call NS_E_12761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15886
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15887
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15887:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15888
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15888:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15889
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15889:
	jmp LB_15865
LB_15886:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_act
	jmp LB_15892
LB_15891:
	add r14,1
LB_15892:
	cmp r14,r10
	jge LB_15893
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15891
	cmp al,10
	jz LB_15891
	cmp al,32
	jz LB_15891
LB_15893:
	push r10
	call NS_E_12776_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15894
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_15895
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_15895:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_15896
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_15896:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15897
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15897:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15898
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15898:
	jmp LB_15865
LB_15894:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_15874
	btr r12,4
	jmp LB_15875
LB_15874:
	bts r12,4
LB_15875:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_15872
	btr r12,3
	jmp LB_15873
LB_15872:
	bts r12,3
LB_15873:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15870
	btr r12,2
	jmp LB_15871
LB_15870:
	bts r12,2
LB_15871:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15868
	btr r12,1
	jmp LB_15869
LB_15868:
	bts r12,1
LB_15869:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15866
	btr r12,0
	jmp LB_15867
LB_15866:
	bts r12,0
LB_15867:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_15861
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { {  } {  } 0' 1' 2' }
	mov r11,r8
	bt r12,2
	jc LB_15915
	btr r12,5
	jmp LB_15916
LB_15915:
	bts r12,5
LB_15916:
	mov r8,r10
	bt r12,4
	jc LB_15917
	btr r12,2
	jmp LB_15918
LB_15917:
	bts r12,2
LB_15918:
	mov r10,r14
	bt r12,1
	jc LB_15919
	btr r12,4
	jmp LB_15920
LB_15919:
	bts r12,4
LB_15920:
	mov r14,r9
	bt r12,3
	jc LB_15921
	btr r12,1
	jmp LB_15922
LB_15921:
	bts r12,1
LB_15922:
	mov r9,r13
	bt r12,0
	jc LB_15923
	btr r12,3
	jmp LB_15924
LB_15923:
	bts r12,3
LB_15924:
	mov r13,r11
	bt r12,5
	jc LB_15925
	btr r12,0
	jmp LB_15926
LB_15925:
	bts r12,0
LB_15926:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13067 ⊢ %_13068 : %_13068
 ; {>  %_13067~2':_p9433 %_13066~1':_p9446 %_13065~0':_p9443 }
; _some 2' ⊢ °0◂2'
; _some { %_13065 %_13066 %_13068 } ⊢ %_13069 : %_13069
 ; {>  %_13066~1':_p9446 %_13065~0':_p9443 %_13068~°0◂2':(_opn)◂(_p9433) }
; _some { 0' 1' °0◂2' } ⊢ °0◂{ 0' 1' °0◂2' }
; ∎ %_13069
 ; {>  %_13069~°0◂{ 0' 1' °0◂2' }:(_opn)◂({ _p9443 _p9446 (_opn)◂(_p9433) }) }
; 	∎ °0◂{ 0' 1' °0◂2' }
; _emt_mov_ptn_to_ptn:{| 1110.. |},°0◂{ 0' 1' °0◂2' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r10,r13
	bt r12,0
	jc LB_15849
	btr r12,4
	jmp LB_15850
LB_15849:
	bts r12,4
LB_15850:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r10
	bt r12,4
	jc LB_15847
	btr QWORD [rdi],0
	jmp LB_15848
LB_15847:
	bts QWORD [rdi],0
LB_15848:
	mov r10,r14
	bt r12,1
	jc LB_15853
	btr r12,4
	jmp LB_15854
LB_15853:
	bts r12,4
LB_15854:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r10
	bt r12,4
	jc LB_15851
	btr QWORD [rdi],1
	jmp LB_15852
LB_15851:
	bts QWORD [rdi],1
LB_15852:
	mov r10,r8
	bt r12,2
	jc LB_15859
	btr r12,4
	jmp LB_15860
LB_15859:
	bts r12,4
LB_15860:
	mov rsi,1
	bt r12,4
	jc LB_15857
	mov rsi,0
	bt r10,0
	jc LB_15857
	jmp LB_15858
LB_15857:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r10
	mov QWORD [rax+8*1],rdi
	mov r10,rax
	btr r12,4
LB_15858:
	mov rax,0x0000_0000_0000_0001
	or r10,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r10
	bt r12,4
	jc LB_15855
	btr QWORD [rdi],2
	jmp LB_15856
LB_15855:
	bts QWORD [rdi],2
LB_15856:
	mov r8,0
	bts r12,2
	ret
LB_15861:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15863
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15862
LB_15863:
	add rsp,8
	ret
LB_15865:
	add rsp,80
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15864:
	add rsp,80
	pop r14
LB_15862:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\138\162"
	jmp LB_15964
LB_15963:
	add r14,1
LB_15964:
	cmp r14,r10
	jge LB_15965
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15963
	cmp al,10
	jz LB_15963
	cmp al,32
	jz LB_15963
LB_15965:
	add r14,3
	cmp r14,r10
	jg LB_15968
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_15968
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,138
	jnz LB_15968
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,162
	jnz LB_15968
	jmp LB_15969
LB_15968:
	jmp LB_15942
LB_15969:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; dst_ptn
	jmp LB_15951
LB_15950:
	add r14,1
LB_15951:
	cmp r14,r10
	jge LB_15952
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15950
	cmp al,10
	jz LB_15950
	cmp al,32
	jz LB_15950
LB_15952:
	push r10
	call NS_E_12162_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15953
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15954
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15954:
	jmp LB_15943
LB_15953:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; lc_code
	jmp LB_15957
LB_15956:
	add r14,1
LB_15957:
	cmp r14,r10
	jge LB_15958
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15956
	cmp al,10
	jz LB_15956
	cmp al,32
	jz LB_15956
LB_15958:
	push r10
	call NS_E_12761_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15959
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_15960
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_15960:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15961
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15961:
	jmp LB_15943
LB_15959:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_15948
	btr r12,2
	jmp LB_15949
LB_15948:
	bts r12,2
LB_15949:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15946
	btr r12,1
	jmp LB_15947
LB_15946:
	bts r12,1
LB_15947:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15944
	btr r12,0
	jmp LB_15945
LB_15944:
	bts r12,0
LB_15945:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_15939
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' 1' }
	mov r9,r14
	bt r12,1
	jc LB_15970
	btr r12,3
	jmp LB_15971
LB_15970:
	bts r12,3
LB_15971:
	mov r14,r8
	bt r12,2
	jc LB_15972
	btr r12,1
	jmp LB_15973
LB_15972:
	bts r12,1
LB_15973:
	mov r8,r13
	bt r12,0
	jc LB_15974
	btr r12,2
	jmp LB_15975
LB_15974:
	bts r12,2
LB_15975:
	mov r13,r9
	bt r12,3
	jc LB_15976
	btr r12,0
	jmp LB_15977
LB_15976:
	bts r12,0
LB_15977:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _none {  } ⊢ %_13072 : %_13072
 ; {>  %_13070~0':_p9443 %_13071~1':_p9446 }
; _none {  } ⊢ °1◂{  }
; _some { %_13070 %_13071 %_13072 } ⊢ %_13073 : %_13073
 ; {>  %_13070~0':_p9443 %_13072~°1◂{  }:(_opn)◂(t6669'(0)) %_13071~1':_p9446 }
; _some { 0' 1' °1◂{  } } ⊢ °0◂{ 0' 1' °1◂{  } }
; ∎ %_13073
 ; {>  %_13073~°0◂{ 0' 1' °1◂{  } }:(_opn)◂({ _p9443 _p9446 (_opn)◂(t6672'(0)) }) }
; 	∎ °0◂{ 0' 1' °1◂{  } }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂{ 0' 1' °1◂{  } } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_15929
	btr r12,2
	jmp LB_15930
LB_15929:
	bts r12,2
LB_15930:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_15927
	btr QWORD [rdi],0
	jmp LB_15928
LB_15927:
	bts QWORD [rdi],0
LB_15928:
	mov r8,r14
	bt r12,1
	jc LB_15933
	btr r12,2
	jmp LB_15934
LB_15933:
	bts r12,2
LB_15934:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_15931
	btr QWORD [rdi],1
	jmp LB_15932
LB_15931:
	bts QWORD [rdi],1
LB_15932:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov rsi,1
	bt r12,2
	jc LB_15937
	mov rsi,0
	bt r8,0
	jc LB_15937
	jmp LB_15938
LB_15937:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r8
	mov QWORD [rax+8*1],rdi
	mov r8,rax
	btr r12,2
LB_15938:
	mov rax,0x0100_0000_0000_0001
	or r8,rax
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r8
	bt r12,2
	jc LB_15935
	btr QWORD [rdi],2
	jmp LB_15936
LB_15935:
	bts QWORD [rdi],2
LB_15936:
	mov r8,0
	bts r12,2
	ret
LB_15939:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15941
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15940
LB_15941:
	add rsp,8
	ret
LB_15943:
	add rsp,48
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15942:
	add rsp,48
	pop r14
LB_15940:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12778:
NS_E_RDI_12778:
NS_E_12778_ETR_TBL:
NS_E_12778_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; "!|"
	jmp LB_15998
LB_15997:
	add r14,1
LB_15998:
	cmp r14,r10
	jge LB_15999
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15997
	cmp al,10
	jz LB_15997
	cmp al,32
	jz LB_15997
LB_15999:
	add r14,2
	cmp r14,r10
	jg LB_16002
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+0]
	cmp al,33
	jnz LB_16002
	mov rax,0
	mov al,BYTE [r13+r14+8*1-2+1]
	cmp al,124
	jnz LB_16002
	jmp LB_16003
LB_16002:
	jmp LB_15985
LB_16003:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_rle_cut
	jmp LB_15992
LB_15991:
	add r14,1
LB_15992:
	cmp r14,r10
	jge LB_15993
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_15991
	cmp al,10
	jz LB_15991
	cmp al,32
	jz LB_15991
LB_15993:
	push r10
	call NS_E_12779_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_15994
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_15995
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_15995:
	jmp LB_15986
LB_15994:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_15989
	btr r12,1
	jmp LB_15990
LB_15989:
	bts r12,1
LB_15990:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_15987
	btr r12,0
	jmp LB_15988
LB_15987:
	bts r12,0
LB_15988:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_15982
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_16004
	btr r12,2
	jmp LB_16005
LB_16004:
	bts r12,2
LB_16005:
	mov r13,r14
	bt r12,1
	jc LB_16006
	btr r12,0
	jmp LB_16007
LB_16006:
	bts r12,0
LB_16007:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9476 %_13074 ⊢ %_13075 : %_13075
 ; {>  %_13074~0':_p9436 }
; _f9476 0' ⊢ °0◂0'
; _some %_13075 ⊢ %_13076 : %_13076
 ; {>  %_13075~°0◂0':_p9435 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13076
 ; {>  %_13076~°0◂°0◂0':(_opn)◂(_p9435) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_15980
	btr r12,3
	jmp LB_15981
LB_15980:
	bts r12,3
LB_15981:
	mov rsi,1
	bt r12,3
	jc LB_15978
	mov rsi,0
	bt r9,0
	jc LB_15978
	jmp LB_15979
LB_15978:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_15979:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_15982:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_15984
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_15983
LB_15984:
	add rsp,8
	ret
LB_15986:
	add rsp,32
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_15985:
	add rsp,32
	pop r14
LB_15983:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_16027
LB_16026:
	add r14,1
LB_16027:
	cmp r14,r10
	jge LB_16028
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16026
	cmp al,10
	jz LB_16026
	cmp al,32
	jz LB_16026
LB_16028:
	push r10
	call NS_E_12780_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16029
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16021
LB_16029:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle
	jmp LB_16032
LB_16031:
	add r14,1
LB_16032:
	cmp r14,r10
	jge LB_16033
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16031
	cmp al,10
	jz LB_16031
	cmp al,32
	jz LB_16031
LB_16033:
	push r10
	call NS_E_12778_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16034
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16035
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16035:
	jmp LB_16021
LB_16034:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16024
	btr r12,1
	jmp LB_16025
LB_16024:
	bts r12,1
LB_16025:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16022
	btr r12,0
	jmp LB_16023
LB_16022:
	bts r12,0
LB_16023:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16018
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f9477 { %_13077 %_13078 } ⊢ %_13079 : %_13079
 ; {>  %_13077~0':_p9437 %_13078~1':_p9435 }
; _f9477 { 0' 1' } ⊢ °1◂{ 0' 1' }
; _some %_13079 ⊢ %_13080 : %_13080
 ; {>  %_13079~°1◂{ 0' 1' }:_p9435 }
; _some °1◂{ 0' 1' } ⊢ °0◂°1◂{ 0' 1' }
; ∎ %_13080
 ; {>  %_13080~°0◂°1◂{ 0' 1' }:(_opn)◂(_p9435) }
; 	∎ °0◂°1◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°1◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_16012
	btr r12,2
	jmp LB_16013
LB_16012:
	bts r12,2
LB_16013:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_16010
	btr QWORD [rdi],0
	jmp LB_16011
LB_16010:
	bts QWORD [rdi],0
LB_16011:
	mov r8,r14
	bt r12,1
	jc LB_16016
	btr r12,2
	jmp LB_16017
LB_16016:
	bts r12,2
LB_16017:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_16014
	btr QWORD [rdi],1
	jmp LB_16015
LB_16014:
	bts QWORD [rdi],1
LB_16015:
	mov rsi,1
	bt r12,3
	jc LB_16008
	mov rsi,0
	bt r9,0
	jc LB_16008
	jmp LB_16009
LB_16008:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16009:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16018:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16020
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16019
LB_16020:
	add rsp,8
	ret
LB_16021:
	add rsp,32
	pop r14
LB_16019:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_16039
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f9478 {  } ⊢ %_13081 : %_13081
 ; {>  }
; _f9478 {  } ⊢ °2◂{  }
; _some %_13081 ⊢ %_13082 : %_13082
 ; {>  %_13081~°2◂{  }:_p9435 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_13082
 ; {>  %_13082~°0◂°2◂{  }:(_opn)◂(_p9435) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16037
	mov rsi,0
	bt r9,0
	jc LB_16037
	jmp LB_16038
LB_16037:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16038:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16039:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16041
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16040
LB_16041:
	add rsp,8
	ret
LB_16042:
	add rsp,0
	pop r14
LB_16040:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12779:
NS_E_RDI_12779:
NS_E_12779_ETR_TBL:
NS_E_12779_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; grm_ptn
	jmp LB_16062
LB_16061:
	add r14,1
LB_16062:
	cmp r14,r10
	jge LB_16063
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16061
	cmp al,10
	jz LB_16061
	cmp al,32
	jz LB_16061
LB_16063:
	push r10
	call NS_E_12780_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16064
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16056
LB_16064:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; grm_rle_cut
	jmp LB_16067
LB_16066:
	add r14,1
LB_16067:
	cmp r14,r10
	jge LB_16068
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16066
	cmp al,10
	jz LB_16066
	cmp al,32
	jz LB_16066
LB_16068:
	push r10
	call NS_E_12779_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16069
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16070
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16070:
	jmp LB_16056
LB_16069:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16059
	btr r12,1
	jmp LB_16060
LB_16059:
	bts r12,1
LB_16060:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16057
	btr r12,0
	jmp LB_16058
LB_16057:
	bts r12,0
LB_16058:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16053
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
; _f9479 { %_13083 %_13084 } ⊢ %_13085 : %_13085
 ; {>  %_13083~0':_p9437 %_13084~1':_p9436 }
; _f9479 { 0' 1' } ⊢ °0◂{ 0' 1' }
; _some %_13085 ⊢ %_13086 : %_13086
 ; {>  %_13085~°0◂{ 0' 1' }:_p9436 }
; _some °0◂{ 0' 1' } ⊢ °0◂°0◂{ 0' 1' }
; ∎ %_13086
 ; {>  %_13086~°0◂°0◂{ 0' 1' }:(_opn)◂(_p9436) }
; 	∎ °0◂°0◂{ 0' 1' }
; _emt_mov_ptn_to_ptn:{| 110.. |},°0◂°0◂{ 0' 1' } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r8,r13
	bt r12,0
	jc LB_16047
	btr r12,2
	jmp LB_16048
LB_16047:
	bts r12,2
LB_16048:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r8
	bt r12,2
	jc LB_16045
	btr QWORD [rdi],0
	jmp LB_16046
LB_16045:
	bts QWORD [rdi],0
LB_16046:
	mov r8,r14
	bt r12,1
	jc LB_16051
	btr r12,2
	jmp LB_16052
LB_16051:
	bts r12,2
LB_16052:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r8
	bt r12,2
	jc LB_16049
	btr QWORD [rdi],1
	jmp LB_16050
LB_16049:
	bts QWORD [rdi],1
LB_16050:
	mov rsi,1
	bt r12,3
	jc LB_16043
	mov rsi,0
	bt r9,0
	jc LB_16043
	jmp LB_16044
LB_16043:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16044:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16053:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16055
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16054
LB_16055:
	add rsp,8
	ret
LB_16056:
	add rsp,32
	pop r14
LB_16054:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_16074
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _f9480 {  } ⊢ %_13087 : %_13087
 ; {>  }
; _f9480 {  } ⊢ °1◂{  }
; _some %_13087 ⊢ %_13088 : %_13088
 ; {>  %_13087~°1◂{  }:_p9436 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13088
 ; {>  %_13088~°0◂°1◂{  }:(_opn)◂(_p9436) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16072
	mov rsi,0
	bt r9,0
	jc LB_16072
	jmp LB_16073
LB_16072:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16073:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16074:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16076
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16075
LB_16076:
	add rsp,8
	ret
LB_16077:
	add rsp,0
	pop r14
LB_16075:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12780:
NS_E_RDI_12780:
NS_E_12780_ETR_TBL:
NS_E_12780_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,48
; "\226\159\166"
	jmp LB_16093
LB_16092:
	add r14,1
LB_16093:
	cmp r14,r10
	jge LB_16094
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16092
	cmp al,10
	jz LB_16092
	cmp al,32
	jz LB_16092
LB_16094:
	add r14,3
	cmp r14,r10
	jg LB_16097
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16097
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_16097
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,166
	jnz LB_16097
	jmp LB_16098
LB_16097:
	jmp LB_16085
LB_16098:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_ptn_atm
	jmp LB_16100
LB_16099:
	add r14,1
LB_16100:
	cmp r14,r10
	jge LB_16101
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16099
	cmp al,10
	jz LB_16099
	cmp al,32
	jz LB_16099
LB_16101:
	push r10
	call NS_E_12781_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16102
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16103
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16103:
	jmp LB_16085
LB_16102:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; "\226\159\167"
	jmp LB_16106
LB_16105:
	add r14,1
LB_16106:
	cmp r14,r10
	jge LB_16107
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16105
	cmp al,10
	jz LB_16105
	cmp al,32
	jz LB_16105
LB_16107:
	add r14,3
	cmp r14,r10
	jg LB_16112
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16112
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,159
	jnz LB_16112
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,167
	jnz LB_16112
	jmp LB_16113
LB_16112:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16109
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16109:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16110
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16110:
	jmp LB_16085
LB_16113:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*2],0
	mov QWORD [rsp+8*1+16*2],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16090
	btr r12,2
	jmp LB_16091
LB_16090:
	bts r12,2
LB_16091:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16088
	btr r12,1
	jmp LB_16089
LB_16088:
	bts r12,1
LB_16089:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16086
	btr r12,0
	jmp LB_16087
LB_16086:
	bts r12,0
LB_16087:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,48
	push rdi
	push rsi
	push LB_16082
; _emt_mov_ptn_to_ptn:{| 1110.. |},{ 0' 1' 2' } ⊢ { {  } 0' {  } }
	mov r9,r13
	bt r12,0
	jc LB_16114
	btr r12,3
	jmp LB_16115
LB_16114:
	bts r12,3
LB_16115:
	mov r13,r14
	bt r12,1
	jc LB_16116
	btr r12,0
	jmp LB_16117
LB_16116:
	bts r12,0
LB_16117:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _f9481 %_13089 ⊢ %_13090 : %_13090
 ; {>  %_13089~0':_p9438 }
; _f9481 0' ⊢ °0◂0'
; _some %_13090 ⊢ %_13091 : %_13091
 ; {>  %_13090~°0◂0':_p9437 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13091
 ; {>  %_13091~°0◂°0◂0':(_opn)◂(_p9437) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16080
	btr r12,3
	jmp LB_16081
LB_16080:
	bts r12,3
LB_16081:
	mov rsi,1
	bt r12,3
	jc LB_16078
	mov rsi,0
	bt r9,0
	jc LB_16078
	jmp LB_16079
LB_16078:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16079:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16082:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16084
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16083
LB_16084:
	add rsp,8
	ret
LB_16085:
	add rsp,48
	pop r14
LB_16083:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; grm_ptn_atm
	jmp LB_16129
LB_16128:
	add r14,1
LB_16129:
	cmp r14,r10
	jge LB_16130
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16128
	cmp al,10
	jz LB_16128
	cmp al,32
	jz LB_16128
LB_16130:
	push r10
	call NS_E_12781_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16131
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16125
LB_16131:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16126
	btr r12,0
	jmp LB_16127
LB_16126:
	bts r12,0
LB_16127:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16122
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9482 %_13092 ⊢ %_13093 : %_13093
 ; {>  %_13092~0':_p9438 }
; _f9482 0' ⊢ °1◂0'
; _some %_13093 ⊢ %_13094 : %_13094
 ; {>  %_13093~°1◂0':_p9437 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13094
 ; {>  %_13094~°0◂°1◂0':(_opn)◂(_p9437) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16120
	btr r12,3
	jmp LB_16121
LB_16120:
	bts r12,3
LB_16121:
	mov rsi,1
	bt r12,3
	jc LB_16118
	mov rsi,0
	bt r9,0
	jc LB_16118
	jmp LB_16119
LB_16118:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16119:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16122:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16124
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16123
LB_16124:
	add rsp,8
	ret
LB_16125:
	add rsp,16
	pop r14
LB_16123:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12781:
NS_E_RDI_12781:
NS_E_12781_ETR_TBL:
NS_E_12781_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; stg_ltr
	jmp LB_16144
LB_16143:
	add r14,1
LB_16144:
	cmp r14,r10
	jge LB_16145
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16143
	cmp al,10
	jz LB_16143
	cmp al,32
	jz LB_16143
LB_16145:
	push r10
	call NS_E_8824_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16146
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16140
LB_16146:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16141
	btr r12,0
	jmp LB_16142
LB_16141:
	bts r12,0
LB_16142:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16137
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9484 %_13095 ⊢ %_13096 : %_13096
 ; {>  %_13095~0':_stg }
; _f9484 0' ⊢ °1◂0'
; _some %_13096 ⊢ %_13097 : %_13097
 ; {>  %_13096~°1◂0':_p9438 }
; _some °1◂0' ⊢ °0◂°1◂0'
; ∎ %_13097
 ; {>  %_13097~°0◂°1◂0':(_opn)◂(_p9438) }
; 	∎ °0◂°1◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°1◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16135
	btr r12,3
	jmp LB_16136
LB_16135:
	bts r12,3
LB_16136:
	mov rsi,1
	bt r12,3
	jc LB_16133
	mov rsi,0
	bt r9,0
	jc LB_16133
	jmp LB_16134
LB_16133:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16134:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16137:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16139
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16138
LB_16139:
	add rsp,8
	ret
LB_16140:
	add rsp,16
	pop r14
LB_16138:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; name
	jmp LB_16159
LB_16158:
	add r14,1
LB_16159:
	cmp r14,r10
	jge LB_16160
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16158
	cmp al,10
	jz LB_16158
	cmp al,32
	jz LB_16158
LB_16160:
	push r10
	call NS_E_11702_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16161
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16155
LB_16161:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16156
	btr r12,0
	jmp LB_16157
LB_16156:
	bts r12,0
LB_16157:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16152
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { 0' }
; _f9483 %_13098 ⊢ %_13099 : %_13099
 ; {>  %_13098~0':_p9379 }
; _f9483 0' ⊢ °0◂0'
; _some %_13099 ⊢ %_13100 : %_13100
 ; {>  %_13099~°0◂0':_p9438 }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13100
 ; {>  %_13100~°0◂°0◂0':(_opn)◂(_p9438) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16150
	btr r12,3
	jmp LB_16151
LB_16150:
	bts r12,3
LB_16151:
	mov rsi,1
	bt r12,3
	jc LB_16148
	mov rsi,0
	bt r9,0
	jc LB_16148
	jmp LB_16149
LB_16148:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16149:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16152:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16154
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16153
LB_16154:
	add rsp,8
	ret
LB_16155:
	add rsp,16
	pop r14
LB_16153:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12782:
NS_E_RDI_12782:
NS_E_12782_ETR_TBL:
NS_E_12782_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144*"
	jmp LB_16172
LB_16171:
	add r14,1
LB_16172:
	cmp r14,r10
	jge LB_16173
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16171
	cmp al,10
	jz LB_16171
	cmp al,32
	jz LB_16171
LB_16173:
	add r14,4
	cmp r14,r10
	jg LB_16176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_16176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_16176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_16176
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,42
	jnz LB_16176
	jmp LB_16177
LB_16176:
	jmp LB_16168
LB_16177:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16169
	btr r12,0
	jmp LB_16170
LB_16169:
	bts r12,0
LB_16170:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16165
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f9474 {  } ⊢ %_13101 : %_13101
 ; {>  }
; _f9474 {  } ⊢ °1◂{  }
; _some %_13101 ⊢ %_13102 : %_13102
 ; {>  %_13101~°1◂{  }:_p9434 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13102
 ; {>  %_13102~°0◂°1◂{  }:(_opn)◂(_p9434) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16163
	mov rsi,0
	bt r9,0
	jc LB_16163
	jmp LB_16164
LB_16163:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16164:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16165:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16167
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16166
LB_16167:
	add rsp,8
	ret
LB_16168:
	add rsp,16
	pop r14
LB_16166:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144#"
	jmp LB_16187
LB_16186:
	add r14,1
LB_16187:
	cmp r14,r10
	jge LB_16188
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16186
	cmp al,10
	jz LB_16186
	cmp al,32
	jz LB_16186
LB_16188:
	add r14,4
	cmp r14,r10
	jg LB_16191
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_16191
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_16191
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_16191
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,35
	jnz LB_16191
	jmp LB_16192
LB_16191:
	jmp LB_16183
LB_16192:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16184
	btr r12,0
	jmp LB_16185
LB_16184:
	bts r12,0
LB_16185:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16180
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f9475 {  } ⊢ %_13103 : %_13103
 ; {>  }
; _f9475 {  } ⊢ °2◂{  }
; _some %_13103 ⊢ %_13104 : %_13104
 ; {>  %_13103~°2◂{  }:_p9434 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_13104
 ; {>  %_13104~°0◂°2◂{  }:(_opn)◂(_p9434) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16178
	mov rsi,0
	bt r9,0
	jc LB_16178
	jmp LB_16179
LB_16178:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16179:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16180:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16182
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16181
LB_16182:
	add rsp,8
	ret
LB_16183:
	add rsp,16
	pop r14
LB_16181:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144"
	jmp LB_16202
LB_16201:
	add r14,1
LB_16202:
	cmp r14,r10
	jge LB_16203
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16201
	cmp al,10
	jz LB_16201
	cmp al,32
	jz LB_16201
LB_16203:
	add r14,3
	cmp r14,r10
	jg LB_16206
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+0]
	cmp al,226
	jnz LB_16206
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+1]
	cmp al,136
	jnz LB_16206
	mov rax,0
	mov al,BYTE [r13+r14+8*1-3+2]
	cmp al,144
	jnz LB_16206
	jmp LB_16207
LB_16206:
	jmp LB_16198
LB_16207:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16199
	btr r12,0
	jmp LB_16200
LB_16199:
	bts r12,0
LB_16200:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16195
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f9473 {  } ⊢ %_13105 : %_13105
 ; {>  }
; _f9473 {  } ⊢ °0◂{  }
; _some %_13105 ⊢ %_13106 : %_13106
 ; {>  %_13105~°0◂{  }:_p9434 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_13106
 ; {>  %_13106~°0◂°0◂{  }:(_opn)◂(_p9434) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16193
	mov rsi,0
	bt r9,0
	jc LB_16193
	jmp LB_16194
LB_16193:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16194:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16195:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16197
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16196
LB_16197:
	add rsp,8
	ret
LB_16198:
	add rsp,16
	pop r14
LB_16196:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12783:
NS_E_RDI_12783:
NS_E_12783_ETR_TBL:
NS_E_12783_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.*"
	jmp LB_16217
LB_16216:
	add r14,1
LB_16217:
	cmp r14,r10
	jge LB_16218
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16216
	cmp al,10
	jz LB_16216
	cmp al,32
	jz LB_16216
LB_16218:
	add r14,5
	cmp r14,r10
	jg LB_16221
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_16221
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_16221
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_16221
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_16221
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,42
	jnz LB_16221
	jmp LB_16222
LB_16221:
	jmp LB_16213
LB_16222:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16214
	btr r12,0
	jmp LB_16215
LB_16214:
	bts r12,0
LB_16215:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16210
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f9474 {  } ⊢ %_13107 : %_13107
 ; {>  }
; _f9474 {  } ⊢ °1◂{  }
; _some %_13107 ⊢ %_13108 : %_13108
 ; {>  %_13107~°1◂{  }:_p9434 }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13108
 ; {>  %_13108~°0◂°1◂{  }:(_opn)◂(_p9434) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16208
	mov rsi,0
	bt r9,0
	jc LB_16208
	jmp LB_16209
LB_16208:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16209:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16210:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16212
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16211
LB_16212:
	add rsp,8
	ret
LB_16213:
	add rsp,16
	pop r14
LB_16211:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144.#"
	jmp LB_16232
LB_16231:
	add r14,1
LB_16232:
	cmp r14,r10
	jge LB_16233
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16231
	cmp al,10
	jz LB_16231
	cmp al,32
	jz LB_16231
LB_16233:
	add r14,5
	cmp r14,r10
	jg LB_16236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+0]
	cmp al,226
	jnz LB_16236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+1]
	cmp al,136
	jnz LB_16236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+2]
	cmp al,144
	jnz LB_16236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+3]
	cmp al,46
	jnz LB_16236
	mov rax,0
	mov al,BYTE [r13+r14+8*1-5+4]
	cmp al,35
	jnz LB_16236
	jmp LB_16237
LB_16236:
	jmp LB_16228
LB_16237:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16229
	btr r12,0
	jmp LB_16230
LB_16229:
	bts r12,0
LB_16230:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16225
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f9475 {  } ⊢ %_13109 : %_13109
 ; {>  }
; _f9475 {  } ⊢ °2◂{  }
; _some %_13109 ⊢ %_13110 : %_13110
 ; {>  %_13109~°2◂{  }:_p9434 }
; _some °2◂{  } ⊢ °0◂°2◂{  }
; ∎ %_13110
 ; {>  %_13110~°0◂°2◂{  }:(_opn)◂(_p9434) }
; 	∎ °0◂°2◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°2◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16223
	mov rsi,0
	bt r9,0
	jc LB_16223
	jmp LB_16224
LB_16223:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16224:
	mov rax,0x0200_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16225:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16227
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16226
LB_16227:
	add rsp,8
	ret
LB_16228:
	add rsp,16
	pop r14
LB_16226:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,16
; "\226\136\144."
	jmp LB_16247
LB_16246:
	add r14,1
LB_16247:
	cmp r14,r10
	jge LB_16248
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16246
	cmp al,10
	jz LB_16246
	cmp al,32
	jz LB_16246
LB_16248:
	add r14,4
	cmp r14,r10
	jg LB_16251
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+0]
	cmp al,226
	jnz LB_16251
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+1]
	cmp al,136
	jnz LB_16251
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+2]
	cmp al,144
	jnz LB_16251
	mov rax,0
	mov al,BYTE [r13+r14+8*1-4+3]
	cmp al,46
	jnz LB_16251
	jmp LB_16252
LB_16251:
	jmp LB_16243
LB_16252:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16244
	btr r12,0
	jmp LB_16245
LB_16244:
	bts r12,0
LB_16245:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,16
	push rdi
	push rsi
	push LB_16240
; _emt_mov_ptn_to_ptn:{| 10.. |},{ 0' } ⊢ { {  } }
; 0' ⊢ {  }
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; _f9473 {  } ⊢ %_13111 : %_13111
 ; {>  }
; _f9473 {  } ⊢ °0◂{  }
; _some %_13111 ⊢ %_13112 : %_13112
 ; {>  %_13111~°0◂{  }:_p9434 }
; _some °0◂{  } ⊢ °0◂°0◂{  }
; ∎ %_13112
 ; {>  %_13112~°0◂°0◂{  }:(_opn)◂(_p9434) }
; 	∎ °0◂°0◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°0◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16238
	mov rsi,0
	bt r9,0
	jc LB_16238
	jmp LB_16239
LB_16238:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16239:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16240:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16242
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16241
LB_16242:
	add rsp,8
	ret
LB_16243:
	add rsp,16
	pop r14
LB_16241:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12784:
NS_E_RDI_12784:
NS_E_12784_ETR_TBL:
NS_E_12784_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,64
; grm_ord_end
	jmp LB_16308
LB_16307:
	add r14,1
LB_16308:
	cmp r14,r10
	jge LB_16309
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16307
	cmp al,10
	jz LB_16307
	cmp al,32
	jz LB_16307
LB_16309:
	push r10
	call NS_E_12783_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16310
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16276
LB_16310:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_16287
LB_16286:
	add r14,1
LB_16287:
	cmp r14,r10
	jge LB_16288
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16286
	cmp al,10
	jz LB_16286
	cmp al,32
	jz LB_16286
LB_16288:
	push r10
	call NS_E_12786_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16289
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16290
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16290:
	jmp LB_16277
LB_16289:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_16293
LB_16292:
	add r14,1
LB_16293:
	cmp r14,r10
	jge LB_16294
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16292
	cmp al,10
	jz LB_16292
	cmp al,32
	jz LB_16292
LB_16294:
	push r10
	call NS_E_12778_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16295
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16296
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16296:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16297
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16297:
	jmp LB_16277
LB_16295:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_16300
LB_16299:
	add r14,1
LB_16300:
	cmp r14,r10
	jge LB_16301
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16299
	cmp al,10
	jz LB_16299
	cmp al,32
	jz LB_16299
LB_16301:
	push r10
	call NS_E_12785_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16302
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16303
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16303:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16304
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16304:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16305
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16305:
	jmp LB_16277
LB_16302:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_16284
	btr r12,3
	jmp LB_16285
LB_16284:
	bts r12,3
LB_16285:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16282
	btr r12,2
	jmp LB_16283
LB_16282:
	bts r12,2
LB_16283:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16280
	btr r12,1
	jmp LB_16281
LB_16280:
	bts r12,1
LB_16281:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16278
	btr r12,0
	jmp LB_16279
LB_16278:
	bts r12,0
LB_16279:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,64
	push rdi
	push rsi
	push LB_16273
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2' 3' } ⊢ { 0' 1' 2' 3' }
; _f9470 { %_13114 %_13113 %_13115 %_13116 } ⊢ %_13117 : %_13117
 ; {>  %_13113~0':_p9434 %_13116~3':(_opn)◂(_p9432) %_13115~2':_p9435 %_13114~1':(_opn)◂(_stg) }
; _f9470 { 1' 0' 2' 3' } ⊢ °1◂{ 1' 0' 2' 3' }
; _some %_13117 ⊢ %_13118 : %_13118
 ; {>  %_13117~°1◂{ 1' 0' 2' 3' }:_p9432 }
; _some °1◂{ 1' 0' 2' 3' } ⊢ °0◂°1◂{ 1' 0' 2' 3' }
; ∎ %_13118
 ; {>  %_13118~°0◂°1◂{ 1' 0' 2' 3' }:(_opn)◂(_p9432) }
; 	∎ °0◂°1◂{ 1' 0' 2' 3' }
; _emt_mov_ptn_to_ptn:{| 11110.. |},°0◂°1◂{ 1' 0' 2' 3' } ⊢ 2'◂3'
	mov r10,r9
	bt r12,3
	jc LB_16253
	btr r12,4
	jmp LB_16254
LB_16253:
	bts r12,4
LB_16254:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov r11,r14
	bt r12,1
	jc LB_16259
	btr r12,5
	jmp LB_16260
LB_16259:
	bts r12,5
LB_16260:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],r11
	bt r12,5
	jc LB_16257
	btr QWORD [rdi],0
	jmp LB_16258
LB_16257:
	bts QWORD [rdi],0
LB_16258:
	mov r11,r13
	bt r12,0
	jc LB_16263
	btr r12,5
	jmp LB_16264
LB_16263:
	bts r12,5
LB_16264:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],r11
	bt r12,5
	jc LB_16261
	btr QWORD [rdi],1
	jmp LB_16262
LB_16261:
	bts QWORD [rdi],1
LB_16262:
	mov r11,r8
	bt r12,2
	jc LB_16267
	btr r12,5
	jmp LB_16268
LB_16267:
	bts r12,5
LB_16268:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],r11
	bt r12,5
	jc LB_16265
	btr QWORD [rdi],2
	jmp LB_16266
LB_16265:
	bts QWORD [rdi],2
LB_16266:
	mov r11,r10
	bt r12,4
	jc LB_16271
	btr r12,5
	jmp LB_16272
LB_16271:
	bts r12,5
LB_16272:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],r11
	bt r12,5
	jc LB_16269
	btr QWORD [rdi],3
	jmp LB_16270
LB_16269:
	bts QWORD [rdi],3
LB_16270:
	mov rsi,1
	bt r12,3
	jc LB_16255
	mov rsi,0
	bt r9,0
	jc LB_16255
	jmp LB_16256
LB_16255:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16256:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16273:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16275
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16274
LB_16275:
	add rsp,8
	ret
LB_16277:
	add rsp,64
	pop r14
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
LB_16276:
	add rsp,64
	pop r14
LB_16274:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,80
; grm_ord
	jmp LB_16351
LB_16350:
	add r14,1
LB_16351:
	cmp r14,r10
	jge LB_16352
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16350
	cmp al,10
	jz LB_16350
	cmp al,32
	jz LB_16350
LB_16352:
	push r10
	call NS_E_12782_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16353
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16339
LB_16353:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; cnc_cn
	jmp LB_16356
LB_16355:
	add r14,1
LB_16356:
	cmp r14,r10
	jge LB_16357
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16355
	cmp al,10
	jz LB_16355
	cmp al,32
	jz LB_16355
LB_16357:
	push r10
	call NS_E_12786_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16358
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16359
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16359:
	jmp LB_16339
LB_16358:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
; grm_rle
	jmp LB_16362
LB_16361:
	add r14,1
LB_16362:
	cmp r14,r10
	jge LB_16363
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16361
	cmp al,10
	jz LB_16361
	cmp al,32
	jz LB_16361
LB_16363:
	push r10
	call NS_E_12778_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16364
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16365
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16365:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16366
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16366:
	jmp LB_16339
LB_16364:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*2],rax
	mov QWORD [rsp+8*1+16*2],r9
; grm_etr_cnc_seq
	jmp LB_16369
LB_16368:
	add r14,1
LB_16369:
	cmp r14,r10
	jge LB_16370
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16368
	cmp al,10
	jz LB_16368
	cmp al,32
	jz LB_16368
LB_16370:
	push r10
	call NS_E_12785_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16371
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16372
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16372:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16373
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16373:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16374
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16374:
	jmp LB_16339
LB_16371:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*3],rax
	mov QWORD [rsp+8*1+16*3],r9
; grm_etr_cnc
	jmp LB_16377
LB_16376:
	add r14,1
LB_16377:
	cmp r14,r10
	jge LB_16378
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16376
	cmp al,10
	jz LB_16376
	cmp al,32
	jz LB_16376
LB_16378:
	push r10
	call NS_E_12784_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16379
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*3]
	bt rsi,0
	jc LB_16380
	mov rdi,QWORD [rsp+16*3+8*1]
	call dlt
LB_16380:
	mov rsi,QWORD [rsp+16*2]
	bt rsi,0
	jc LB_16381
	mov rdi,QWORD [rsp+16*2+8*1]
	call dlt
LB_16381:
	mov rsi,QWORD [rsp+16*1]
	bt rsi,0
	jc LB_16382
	mov rdi,QWORD [rsp+16*1+8*1]
	call dlt
LB_16382:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16383
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16383:
	jmp LB_16339
LB_16379:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*4],rax
	mov QWORD [rsp+8*1+16*4],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*4]
	bt rax,0
	jc LB_16348
	btr r12,4
	jmp LB_16349
LB_16348:
	bts r12,4
LB_16349:
	mov rax,QWORD [rsp+16*4+8*1]
	mov r10,rax
	mov rax,QWORD [rsp+16*3]
	bt rax,0
	jc LB_16346
	btr r12,3
	jmp LB_16347
LB_16346:
	bts r12,3
LB_16347:
	mov rax,QWORD [rsp+16*3+8*1]
	mov r9,rax
	mov rax,QWORD [rsp+16*2]
	bt rax,0
	jc LB_16344
	btr r12,2
	jmp LB_16345
LB_16344:
	bts r12,2
LB_16345:
	mov rax,QWORD [rsp+16*2+8*1]
	mov r8,rax
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16342
	btr r12,1
	jmp LB_16343
LB_16342:
	bts r12,1
LB_16343:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16340
	btr r12,0
	jmp LB_16341
LB_16340:
	bts r12,0
LB_16341:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,80
	push rdi
	push rsi
	push LB_16336
; _emt_mov_ptn_to_ptn:{| 111110.. |},{ 0' 1' 2' 3' 4' } ⊢ { 0' 1' 2' 3' 4' }
; _f9469 { %_13120 %_13119 %_13121 %_13122 %_13123 } ⊢ %_13124 : %_13124
 ; {>  %_13121~2':_p9435 %_13123~4':_p9432 %_13119~0':_p9434 %_13122~3':(_opn)◂(_p9432) %_13120~1':(_opn)◂(_stg) }
; _f9469 { 1' 0' 2' 3' 4' } ⊢ °0◂{ 1' 0' 2' 3' 4' }
; _some %_13124 ⊢ %_13125 : %_13125
 ; {>  %_13124~°0◂{ 1' 0' 2' 3' 4' }:_p9432 }
; _some °0◂{ 1' 0' 2' 3' 4' } ⊢ °0◂°0◂{ 1' 0' 2' 3' 4' }
; ∎ %_13125
 ; {>  %_13125~°0◂°0◂{ 1' 0' 2' 3' 4' }:(_opn)◂(_p9432) }
; 	∎ °0◂°0◂{ 1' 0' 2' 3' 4' }
; _emt_mov_ptn_to_ptn:{| 111110.. |},°0◂°0◂{ 1' 0' 2' 3' 4' } ⊢ 2'◂3'
	mov r11,r9
	bt r12,3
	jc LB_16312
	btr r12,5
	jmp LB_16313
LB_16312:
	bts r12,5
LB_16313:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0005_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rcx,r14
	bt r12,1
	jc LB_16318
	btr r12,6
	jmp LB_16319
LB_16318:
	bts r12,6
LB_16319:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*0],rcx
	bt r12,6
	jc LB_16316
	btr QWORD [rdi],0
	jmp LB_16317
LB_16316:
	bts QWORD [rdi],0
LB_16317:
	mov rcx,r13
	bt r12,0
	jc LB_16322
	btr r12,6
	jmp LB_16323
LB_16322:
	bts r12,6
LB_16323:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*1],rcx
	bt r12,6
	jc LB_16320
	btr QWORD [rdi],1
	jmp LB_16321
LB_16320:
	bts QWORD [rdi],1
LB_16321:
	mov rcx,r8
	bt r12,2
	jc LB_16326
	btr r12,6
	jmp LB_16327
LB_16326:
	bts r12,6
LB_16327:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*2],rcx
	bt r12,6
	jc LB_16324
	btr QWORD [rdi],2
	jmp LB_16325
LB_16324:
	bts QWORD [rdi],2
LB_16325:
	mov rcx,r11
	bt r12,5
	jc LB_16330
	btr r12,6
	jmp LB_16331
LB_16330:
	bts r12,6
LB_16331:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*3],rcx
	bt r12,6
	jc LB_16328
	btr QWORD [rdi],3
	jmp LB_16329
LB_16328:
	bts QWORD [rdi],3
LB_16329:
	mov rcx,r10
	bt r12,4
	jc LB_16334
	btr r12,6
	jmp LB_16335
LB_16334:
	bts r12,6
LB_16335:
	mov rdi,r9
	mov QWORD [rdi+8*1+8*4],rcx
	bt r12,6
	jc LB_16332
	btr QWORD [rdi],4
	jmp LB_16333
LB_16332:
	bts QWORD [rdi],4
LB_16333:
	mov rsi,1
	bt r12,3
	jc LB_16314
	mov rsi,0
	bt r9,0
	jc LB_16314
	jmp LB_16315
LB_16314:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16315:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16336:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16338
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16337
LB_16338:
	add rsp,8
	ret
LB_16339:
	add rsp,80
	pop r14
LB_16337:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12785:
NS_E_RDI_12785:
NS_E_12785_ETR_TBL:
NS_E_12785_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; ";"
	jmp LB_16398
LB_16397:
	add r14,1
LB_16398:
	cmp r14,r10
	jge LB_16399
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16397
	cmp al,10
	jz LB_16397
	cmp al,32
	jz LB_16397
LB_16399:
	add r14,1
	cmp r14,r10
	jg LB_16402
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,59
	jnz LB_16402
	jmp LB_16403
LB_16402:
	jmp LB_16392
LB_16403:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*0],0
	mov QWORD [rsp+8*1+16*0],rax
; grm_etr_cnc
	jmp LB_16405
LB_16404:
	add r14,1
LB_16405:
	cmp r14,r10
	jge LB_16406
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16404
	cmp al,10
	jz LB_16404
	cmp al,32
	jz LB_16404
LB_16406:
	push r10
	call NS_E_12784_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16407
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16408
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16408:
	jmp LB_16392
LB_16407:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*1],rax
	mov QWORD [rsp+8*1+16*1],r9
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16395
	btr r12,1
	jmp LB_16396
LB_16395:
	bts r12,1
LB_16396:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16393
	btr r12,0
	jmp LB_16394
LB_16393:
	bts r12,0
LB_16394:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16389
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { {  } 0' }
	mov r8,r13
	bt r12,0
	jc LB_16410
	btr r12,2
	jmp LB_16411
LB_16410:
	bts r12,2
LB_16411:
	mov r13,r14
	bt r12,1
	jc LB_16412
	btr r12,0
	jmp LB_16413
LB_16412:
	bts r12,0
LB_16413:
; 2' ⊢ {  }
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13126 ⊢ %_13127 : %_13127
 ; {>  %_13126~0':_p9432 }
; _some 0' ⊢ °0◂0'
; _some %_13127 ⊢ %_13128 : %_13128
 ; {>  %_13127~°0◂0':(_opn)◂(_p9432) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13128
 ; {>  %_13128~°0◂°0◂0':(_opn)◂((_opn)◂(_p9432)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16387
	btr r12,3
	jmp LB_16388
LB_16387:
	bts r12,3
LB_16388:
	mov rsi,1
	bt r12,3
	jc LB_16385
	mov rsi,0
	bt r9,0
	jc LB_16385
	jmp LB_16386
LB_16385:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16386:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16389:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16391
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16390
LB_16391:
	add rsp,8
	ret
LB_16392:
	add rsp,32
	pop r14
LB_16390:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_16416
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_13129 : %_13129
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_13129 ⊢ %_13130 : %_13130
 ; {>  %_13129~°1◂{  }:(_opn)◂(t6750'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13130
 ; {>  %_13130~°0◂°1◂{  }:(_opn)◂((_opn)◂(t6753'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16414
	mov rsi,0
	bt r9,0
	jc LB_16414
	jmp LB_16415
LB_16414:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16415:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16416:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16418
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16417
LB_16418:
	add rsp,8
	ret
LB_16419:
	add rsp,0
	pop r14
LB_16417:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_12786:
NS_E_RDI_12786:
NS_E_12786_ETR_TBL:
NS_E_12786_TBL:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,32
; word
	jmp LB_16433
LB_16432:
	add r14,1
LB_16433:
	cmp r14,r10
	jge LB_16434
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16432
	cmp al,10
	jz LB_16432
	cmp al,32
	jz LB_16432
LB_16434:
	push r10
	call NS_E_9192_ETR_TBL
	pop r10
	cmp r8,0
	jz LB_16435
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16427
LB_16435:
	mov rax,0
	bt r12,3
	setc al
	mov QWORD [rsp+16*0],rax
	mov QWORD [rsp+8*1+16*0],r9
; ":"
	jmp LB_16438
LB_16437:
	add r14,1
LB_16438:
	cmp r14,r10
	jge LB_16439
	mov al,[r13+r14+8*1]
	cmp al,9
	jz LB_16437
	cmp al,10
	jz LB_16437
	cmp al,32
	jz LB_16437
LB_16439:
	add r14,1
	cmp r14,r10
	jg LB_16443
	mov rax,0
	mov al,BYTE [r13+r14+8*1-1+0]
	cmp al,58
	jnz LB_16443
	jmp LB_16444
LB_16443:
	mov rsi,QWORD [rsp+16*0]
	bt rsi,0
	jc LB_16441
	mov rdi,QWORD [rsp+16*0+8*1]
	call dlt
LB_16441:
	jmp LB_16427
LB_16444:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [rsp+16*1],0
	mov QWORD [rsp+8*1+16*1],rax
	mov rdi,r13
	mov rsi,r14
	mov rax,QWORD [rsp+16*1]
	bt rax,0
	jc LB_16430
	btr r12,1
	jmp LB_16431
LB_16430:
	bts r12,1
LB_16431:
	mov rax,QWORD [rsp+16*1+8*1]
	mov r14,rax
	mov rax,QWORD [rsp+16*0]
	bt rax,0
	jc LB_16428
	btr r12,0
	jmp LB_16429
LB_16428:
	bts r12,0
LB_16429:
	mov rax,QWORD [rsp+16*0+8*1]
	mov r13,rax
	add rsp,32
	push rdi
	push rsi
	push LB_16424
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' {  } }
; 1' ⊢ {  }
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
; _some %_13131 ⊢ %_13132 : %_13132
 ; {>  %_13131~0':_stg }
; _some 0' ⊢ °0◂0'
; _some %_13132 ⊢ %_13133 : %_13133
 ; {>  %_13132~°0◂0':(_opn)◂(_stg) }
; _some °0◂0' ⊢ °0◂°0◂0'
; ∎ %_13133
 ; {>  %_13133~°0◂°0◂0':(_opn)◂((_opn)◂(_stg)) }
; 	∎ °0◂°0◂0'
; _emt_mov_ptn_to_ptn:{| 10.. |},°0◂°0◂0' ⊢ 2'◂3'
	mov r9,r13
	bt r12,0
	jc LB_16422
	btr r12,3
	jmp LB_16423
LB_16422:
	bts r12,3
LB_16423:
	mov rsi,1
	bt r12,3
	jc LB_16420
	mov rsi,0
	bt r9,0
	jc LB_16420
	jmp LB_16421
LB_16420:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16421:
	mov rax,0x0000_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16424:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16426
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16425
LB_16426:
	add rsp,8
	ret
LB_16427:
	add rsp,32
	pop r14
LB_16425:
	mov r10d,DWORD [r13+4]
	push r14
	sub rsp,0
	mov rdi,r13
	mov rsi,r14
	add rsp,0
	push rdi
	push rsi
	push LB_16447
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
; _none {  } ⊢ %_13134 : %_13134
 ; {>  }
; _none {  } ⊢ °1◂{  }
; _some %_13134 ⊢ %_13135 : %_13135
 ; {>  %_13134~°1◂{  }:(_opn)◂(t6762'(0)) }
; _some °1◂{  } ⊢ °0◂°1◂{  }
; ∎ %_13135
 ; {>  %_13135~°0◂°1◂{  }:(_opn)◂((_opn)◂(t6765'(0))) }
; 	∎ °0◂°1◂{  }
; _emt_mov_ptn_to_ptn:{| 0.. |},°0◂°1◂{  } ⊢ 2'◂3'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov r9,rax
	btr r12,3
	mov rsi,1
	bt r12,3
	jc LB_16445
	mov rsi,0
	bt r9,0
	jc LB_16445
	jmp LB_16446
LB_16445:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16446:
	mov rax,0x0100_0000_0000_0001
	or r9,rax
	mov r8,0
	bts r12,2
	ret
LB_16447:
	pop r14
	pop r13
	bts r12,1
	btr r12,0
	cmp r8,0
	jz LB_16449
	pop r14
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	jmp LB_16448
LB_16449:
	add rsp,8
	ret
LB_16450:
	add rsp,0
	pop r14
LB_16448:
	mov rax,0x0000_0000_0000_ffff
	mov rdi,rbx
	mov rbx,[rdi]
	mov QWORD [rdi],rax
	mov r9,rdi
	mov r8,1
	btr r12,3
	bts r12,2
	ret
NS_E_16496:
NS_E_RDI_16496:
; » _^ ..
	xor rax,rax
	add rax,9
	add rax,15
	add rax,13
	add rax,10
	add rax,9
	add rax,7
	add rax,10
	add rax,11
	add rax,10
	add rax,10
	mov rdi,rax
	call mlc_s8
	mov r13,rax
	btr r12,0
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
; » 0xr0 |~ {  } ⊢ %_16452 : %_16452
 ; {>  %_16451~0':_stg }
; 	» 0xr0 _ ⊢ 1' : %_16452
	mov rdi,0x0
	mov r14,rdi
	bts r12,1
; » _f15 |~ {  } ⊢ %_16453 : %_16453
 ; {>  %_16452~1':_r64 %_16451~0':_stg }
; 	» _args _ ⊢ 2' : %_16453
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
MTC_LB_16497:
	mov r15,0
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz MTC_LB_16498
; _emt_mov_ptn_to_ptn:{| 1110.. |},2' ⊢ °0◂{ 3' 4' }
; 2' ⊢ °0◂{ 3' 4' }
	btr r12,5
	mov rax,r8
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r8
	bt QWORD [rdi],17
	jnc LB_16499
	bt QWORD [rdi],0
	jc LB_16500
	btr r12,5
	jmp LB_16501
LB_16500:
	bts r12,5
LB_16501:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_16499:
	mov r11,rdi
; 5' ⊢ { 3' 4' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_16504
	btr r12,6
	jmp LB_16505
LB_16504:
	bts r12,6
LB_16505:
	mov r9,rcx
	bt r12,6
	jc LB_16502
	btr r12,3
	jmp LB_16503
LB_16502:
	bts r12,3
LB_16503:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_16508
	btr r12,6
	jmp LB_16509
LB_16508:
	bts r12,6
LB_16509:
	mov r10,rcx
	bt r12,6
	jc LB_16506
	btr r12,4
	jmp LB_16507
LB_16506:
	bts r12,4
LB_16507:
	mov rdi,r11
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz MTC_LB_16498
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ °0◂{ 5' 6' }
; 4' ⊢ °0◂{ 5' 6' }
	btr r12,7
	mov rax,r10
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r10
	bt QWORD [rdi],17
	jnc LB_16510
	bt QWORD [rdi],0
	jc LB_16511
	btr r12,7
	jmp LB_16512
LB_16511:
	bts r12,7
LB_16512:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_16510:
	mov rdx,rdi
; 7' ⊢ { 5' 6' }
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*0]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],0
	jc LB_16515
	btr r12,8
	jmp LB_16516
LB_16515:
	bts r12,8
LB_16516:
	mov r11,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_16513
	btr r12,5
	jmp LB_16514
LB_16513:
	bts r12,5
LB_16514:
	mov rdi,rdx
	mov rax,QWORD [rdi+8*1+8*1]
	mov QWORD [st_vct+8*8],rax
	bt QWORD [rdi],1
	jc LB_16519
	btr r12,8
	jmp LB_16520
LB_16519:
	bts r12,8
LB_16520:
	mov rcx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_16517
	btr r12,6
	jmp LB_16518
LB_16517:
	bts r12,6
LB_16518:
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz MTC_LB_16498
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °1◂{  }
; 6' ⊢ °1◂{  }
	btr r12,7
	mov rax,rcx
	shr rax,56
	cmp rax,1
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rcx
	bt QWORD [rdi],17
	jnc LB_16521
	bt QWORD [rdi],0
	jc LB_16522
	btr r12,7
	jmp LB_16523
LB_16522:
	bts r12,7
LB_16523:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_16521:
	mov rdx,rdi
; 7' ⊢ {  }
	mov rdi,rdx
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
LB_16524:
	cmp r15,0
	jz LB_16525
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_16524
LB_16525:
; _f25 %_16456 ⊢ { %_16458 %_16459 } : { %_16458 %_16459 }
 ; {>  %_16454~3':_stg %_16456~5':_stg %_16452~1':_r64 %_16451~0':_stg }
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
	jc LB_16532
	btr r12,0
	jmp LB_16533
LB_16532:
	bts r12,0
LB_16533:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 2' 4' }
	mov r8,r13
	bt r12,0
	jc LB_16534
	btr r12,2
	jmp LB_16535
LB_16534:
	bts r12,2
LB_16535:
	mov r10,r14
	bt r12,1
	jc LB_16536
	btr r12,4
	jmp LB_16537
LB_16536:
	bts r12,4
LB_16537:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*2]
	bt QWORD rax,3
	jc LB_16530
	btr r12,3
	jmp LB_16531
LB_16530:
	bts r12,3
LB_16531:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16528
	btr r12,1
	jmp LB_16529
LB_16528:
	bts r12,1
LB_16529:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16526
	btr r12,0
	jmp LB_16527
LB_16526:
	bts r12,0
LB_16527:
	add rsp,32
; _f11637 %_16459 ⊢ { %_16460 %_16461 } : { %_16460 %_16461 }
 ; {>  %_16454~3':_stg %_16459~4':_stg %_16458~2':_stg %_16452~1':_r64 %_16451~0':_stg }
; _f11637 4' ⊢ { 4' 5' }
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
	jc LB_16546
	btr r12,0
	jmp LB_16547
LB_16546:
	bts r12,0
LB_16547:
	call NS_E_11637
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_16548
	btr r12,4
	jmp LB_16549
LB_16548:
	bts r12,4
LB_16549:
	mov r11,r14
	bt r12,1
	jc LB_16550
	btr r12,5
	jmp LB_16551
LB_16550:
	bts r12,5
LB_16551:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_16544
	btr r12,3
	jmp LB_16545
LB_16544:
	bts r12,3
LB_16545:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_16542
	btr r12,2
	jmp LB_16543
LB_16542:
	bts r12,2
LB_16543:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16540
	btr r12,1
	jmp LB_16541
LB_16540:
	bts r12,1
LB_16541:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16538
	btr r12,0
	jmp LB_16539
LB_16538:
	bts r12,0
LB_16539:
	add rsp,40
MTC_LB_16552:
	mov r15,0
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz MTC_LB_16553
; _emt_mov_ptn_to_ptn:{| 1111110.. |},5' ⊢ °0◂6'
; 5' ⊢ °0◂6'
	btr r12,7
	mov rax,r11
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,r11
	bt QWORD [rdi],17
	jnc LB_16554
	bt QWORD [rdi],0
	jc LB_16555
	btr r12,7
	jmp LB_16556
LB_16555:
	bts r12,7
LB_16556:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_16554:
	mov rdx,rdi
	mov rcx,rdx
	bt r12,7
	jc LB_16557
	btr r12,6
	jmp LB_16558
LB_16557:
	bts r12,6
LB_16558:
LB_16559:
	cmp r15,0
	jz LB_16560
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_16559
LB_16560:
; » 0xr0 |~ {  } ⊢ %_16463 : %_16463
 ; {>  %_16454~3':_stg %_16460~4':_stg %_16462~6':_stg %_16458~2':_stg %_16452~1':_r64 %_16451~0':_stg }
; 	» 0xr0 _ ⊢ 5' : %_16463
	mov rdi,0x0
	mov r11,rdi
	bts r12,5
; _f12747 { %_16462 %_16463 } ⊢ { %_16464 %_16465 %_16466 } : { %_16464 %_16465 %_16466 }
 ; {>  %_16463~5':_r64 %_16454~3':_stg %_16460~4':_stg %_16462~6':_stg %_16458~2':_stg %_16452~1':_r64 %_16451~0':_stg }
; _f12747 { 6' 5' } ⊢ { 5' 6' 7' }
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
	jc LB_16571
	btr r12,0
	jmp LB_16572
LB_16571:
	bts r12,0
LB_16572:
	mov r14,r11
	bt r12,5
	jc LB_16573
	btr r12,1
	jmp LB_16574
LB_16573:
	bts r12,1
LB_16574:
	call NS_E_12747
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 5' 6' 7' }
	mov r11,r13
	bt r12,0
	jc LB_16575
	btr r12,5
	jmp LB_16576
LB_16575:
	bts r12,5
LB_16576:
	mov rcx,r14
	bt r12,1
	jc LB_16577
	btr r12,6
	jmp LB_16578
LB_16577:
	bts r12,6
LB_16578:
	mov rdx,r9
	bt r12,3
	jc LB_16581
	btr r12,7
	jmp LB_16582
LB_16581:
	bts r12,7
LB_16582:
	mov rsi,1
	bt r12,7
	jc LB_16579
	mov rsi,0
	bt rdx,0
	jc LB_16579
	jmp LB_16580
LB_16579:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,rdx
	mov QWORD [rax+8*1],rdi
	mov rdx,rax
	btr r12,7
LB_16580:
	mov rax,r8
	shl rax,56
	or rax,1
	or rdx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_16569
	btr r12,4
	jmp LB_16570
LB_16569:
	bts r12,4
LB_16570:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_16567
	btr r12,3
	jmp LB_16568
LB_16567:
	bts r12,3
LB_16568:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_16565
	btr r12,2
	jmp LB_16566
LB_16565:
	bts r12,2
LB_16566:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16563
	btr r12,1
	jmp LB_16564
LB_16563:
	bts r12,1
LB_16564:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16561
	btr r12,0
	jmp LB_16562
LB_16561:
	bts r12,0
LB_16562:
	add rsp,48
MTC_LB_16583:
	mov r15,0
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_16584
; _emt_mov_ptn_to_ptn:{| 111111110.. |},7' ⊢ °0◂8'
; 7' ⊢ °0◂8'
	btr r12,9
	mov rax,rdx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rdx
	bt QWORD [rdi],17
	jnc LB_16585
	bt QWORD [rdi],0
	jc LB_16586
	btr r12,9
	jmp LB_16587
LB_16586:
	bts r12,9
LB_16587:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_16585:
	mov QWORD [st_vct+8*9],rdi
	mov rdi,QWORD [st_vct+8*9]
	mov QWORD [st_vct+8*8],rdi
	bt r12,9
	jc LB_16588
	btr r12,8
	jmp LB_16589
LB_16588:
	bts r12,8
LB_16589:
LB_16590:
	cmp r15,0
	jz LB_16591
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_16590
LB_16591:
; » 0xr0 |~ {  } ⊢ %_16468 : %_16468
 ; {>  %_16467~8':(_lst)◂(_p9427) %_16454~3':_stg %_16464~5':_stg %_16460~4':_stg %_16465~6':_r64 %_16458~2':_stg %_16452~1':_r64 %_16451~0':_stg }
; 	» 0xr0 _ ⊢ 7' : %_16468
	mov rdi,0x0
	mov rdx,rdi
	bts r12,7
; _f9749 { %_16468 %_16467 } ⊢ { %_16469 %_16470 } : { %_16469 %_16470 }
 ; {>  %_16467~8':(_lst)◂(_p9427) %_16454~3':_stg %_16464~5':_stg %_16460~4':_stg %_16468~7':_r64 %_16465~6':_r64 %_16458~2':_stg %_16452~1':_r64 %_16451~0':_stg }
; _f9749 { 7' 8' } ⊢ { 7' 8' }
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
; _emt_mov_ptn_to_ptn:{| 0000000110.. |},{ 7' 8' } ⊢ { 0' 1' }
	mov r13,rdx
	bt r12,7
	jc LB_16606
	btr r12,0
	jmp LB_16607
LB_16606:
	bts r12,0
LB_16607:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_16608
	btr r12,1
	jmp LB_16609
LB_16608:
	bts r12,1
LB_16609:
	call NS_E_9749
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 7' 8' }
	mov rdx,r13
	bt r12,0
	jc LB_16610
	btr r12,7
	jmp LB_16611
LB_16610:
	bts r12,7
LB_16611:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_16612
	btr r12,8
	jmp LB_16613
LB_16612:
	bts r12,8
LB_16613:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_16604
	btr r12,6
	jmp LB_16605
LB_16604:
	bts r12,6
LB_16605:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_16602
	btr r12,5
	jmp LB_16603
LB_16602:
	bts r12,5
LB_16603:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_16600
	btr r12,4
	jmp LB_16601
LB_16600:
	bts r12,4
LB_16601:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_16598
	btr r12,3
	jmp LB_16599
LB_16598:
	bts r12,3
LB_16599:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_16596
	btr r12,2
	jmp LB_16597
LB_16596:
	bts r12,2
LB_16597:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16594
	btr r12,1
	jmp LB_16595
LB_16594:
	bts r12,1
LB_16595:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16592
	btr r12,0
	jmp LB_16593
LB_16592:
	bts r12,0
LB_16593:
	add rsp,64
; » _^ ..
	xor rax,rax
	add rax,6
	mov rsi,QWORD [st_vct+8*8]
	mov esi,DWORD [rsi+4]
	add rax,rsi
	add rax,4
	mov rdi,rax
	call mlc_s8
	mov QWORD [st_vct+8*9],rax
	btr r12,9
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
	mov rsi,QWORD [st_vct+8*8]
	mov ecx,DWORD [rsi+4]
	add rsi,8
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
; _f26 %_16472 ⊢ %_16473 : %_16473
 ; {>  %_16454~3':_stg %_16472~9':_stg %_16464~5':_stg %_16471~8':_stg %_16460~4':_stg %_16469~7':_r64 %_16465~6':_r64 %_16458~2':_stg %_16452~1':_r64 %_16451~0':_stg }
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
	jc LB_16632
	btr r12,0
	jmp LB_16633
LB_16632:
	bts r12,0
LB_16633:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 9'
	mov rdi,r13
	mov QWORD [st_vct+8*9],rdi
	bt r12,0
	jc LB_16634
	btr r12,9
	jmp LB_16635
LB_16634:
	bts r12,9
LB_16635:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdi,QWORD [rsp+8+8*8]
	mov QWORD [st_vct+8*8],rdi
	bt rax,8
	jc LB_16630
	btr r12,8
	jmp LB_16631
LB_16630:
	bts r12,8
LB_16631:
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_16628
	btr r12,7
	jmp LB_16629
LB_16628:
	bts r12,7
LB_16629:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_16626
	btr r12,6
	jmp LB_16627
LB_16626:
	bts r12,6
LB_16627:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_16624
	btr r12,5
	jmp LB_16625
LB_16624:
	bts r12,5
LB_16625:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_16622
	btr r12,4
	jmp LB_16623
LB_16622:
	bts r12,4
LB_16623:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_16620
	btr r12,3
	jmp LB_16621
LB_16620:
	bts r12,3
LB_16621:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_16618
	btr r12,2
	jmp LB_16619
LB_16618:
	bts r12,2
LB_16619:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16616
	btr r12,1
	jmp LB_16617
LB_16616:
	bts r12,1
LB_16617:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16614
	btr r12,0
	jmp LB_16615
LB_16614:
	bts r12,0
LB_16615:
	add rsp,80
; ∎ {  }
 ; {>  %_16473~9':_stg %_16454~3':_stg %_16464~5':_stg %_16471~8':_stg %_16460~4':_stg %_16469~7':_r64 %_16465~6':_r64 %_16458~2':_stg %_16452~1':_r64 %_16451~0':_stg }
; 	∎ {  }
	bt r12,9
	jc LB_16636
	mov rdi,QWORD [st_vct+8*9]
	call dlt
LB_16636:
	bt r12,3
	jc LB_16637
	mov rdi,r9
	call dlt
LB_16637:
	bt r12,5
	jc LB_16638
	mov rdi,r11
	call dlt
LB_16638:
	bt r12,8
	jc LB_16639
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_16639:
	bt r12,4
	jc LB_16640
	mov rdi,r10
	call dlt
LB_16640:
	bt r12,7
	jc LB_16641
	mov rdi,rdx
	call dlt
LB_16641:
	bt r12,6
	jc LB_16642
	mov rdi,rcx
	call dlt
LB_16642:
	bt r12,2
	jc LB_16643
	mov rdi,r8
	call dlt
LB_16643:
	bt r12,1
	jc LB_16644
	mov rdi,r14
	call dlt
LB_16644:
	bt r12,0
	jc LB_16645
	mov rdi,r13
	call dlt
LB_16645:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_16584:
	mov r15,0
LB_16647:
	cmp r15,0
	jz LB_16648
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_16647
LB_16648:
; 	» "H0\n" _ ⊢ 8' : %_16474
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_30_48
	mov QWORD [rdi+8*1+8*0],rax
	mov QWORD [st_vct+8*8],rdi
	btr r12,8
; _f26 %_16474 ⊢ %_16475 : %_16475
 ; {>  %_16454~3':_stg %_16464~5':_stg %_16460~4':_stg %_16474~8':_stg %_16466~7':(_opn)◂((_lst)◂(_p9427)) %_16465~6':_r64 %_16458~2':_stg %_16452~1':_r64 %_16451~0':_stg }
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
	jc LB_16665
	btr r12,0
	jmp LB_16666
LB_16665:
	bts r12,0
LB_16666:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 8'
	mov rdi,r13
	mov QWORD [st_vct+8*8],rdi
	bt r12,0
	jc LB_16667
	btr r12,8
	jmp LB_16668
LB_16667:
	bts r12,8
LB_16668:
; pop_iv
	mov rax,QWORD [rsp]
	mov rdx,QWORD [rsp+8+8*7]
	bt QWORD rax,7
	jc LB_16663
	btr r12,7
	jmp LB_16664
LB_16663:
	bts r12,7
LB_16664:
	mov rcx,QWORD [rsp+8+8*6]
	bt QWORD rax,6
	jc LB_16661
	btr r12,6
	jmp LB_16662
LB_16661:
	bts r12,6
LB_16662:
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_16659
	btr r12,5
	jmp LB_16660
LB_16659:
	bts r12,5
LB_16660:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_16657
	btr r12,4
	jmp LB_16658
LB_16657:
	bts r12,4
LB_16658:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_16655
	btr r12,3
	jmp LB_16656
LB_16655:
	bts r12,3
LB_16656:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_16653
	btr r12,2
	jmp LB_16654
LB_16653:
	bts r12,2
LB_16654:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16651
	btr r12,1
	jmp LB_16652
LB_16651:
	bts r12,1
LB_16652:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16649
	btr r12,0
	jmp LB_16650
LB_16649:
	bts r12,0
LB_16650:
	add rsp,72
; ∎ {  }
 ; {>  %_16454~3':_stg %_16464~5':_stg %_16460~4':_stg %_16466~7':(_opn)◂((_lst)◂(_p9427)) %_16465~6':_r64 %_16458~2':_stg %_16452~1':_r64 %_16451~0':_stg %_16475~8':_stg }
; 	∎ {  }
	bt r12,3
	jc LB_16669
	mov rdi,r9
	call dlt
LB_16669:
	bt r12,5
	jc LB_16670
	mov rdi,r11
	call dlt
LB_16670:
	bt r12,4
	jc LB_16671
	mov rdi,r10
	call dlt
LB_16671:
	bt r12,7
	jc LB_16672
	mov rdi,rdx
	call dlt
LB_16672:
	bt r12,6
	jc LB_16673
	mov rdi,rcx
	call dlt
LB_16673:
	bt r12,2
	jc LB_16674
	mov rdi,r8
	call dlt
LB_16674:
	bt r12,1
	jc LB_16675
	mov rdi,r14
	call dlt
LB_16675:
	bt r12,0
	jc LB_16676
	mov rdi,r13
	call dlt
LB_16676:
	bt r12,8
	jc LB_16677
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_16677:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_16646:
MTC_LB_16553:
	mov r15,0
LB_16679:
	cmp r15,0
	jz LB_16680
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_16679
LB_16680:
; 	» "H1\n" _ ⊢ 6' : %_16476
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_0a_31_48
	mov QWORD [rdi+8*1+8*0],rax
	mov rcx,rdi
	btr r12,6
; _f26 %_16476 ⊢ %_16477 : %_16477
 ; {>  %_16454~3':_stg %_16476~6':_stg %_16460~4':_stg %_16458~2':_stg %_16452~1':_r64 %_16461~5':(_opn)◂(_stg) %_16451~0':_stg }
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
	jc LB_16693
	btr r12,0
	jmp LB_16694
LB_16693:
	bts r12,0
LB_16694:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 6'
	mov rcx,r13
	bt r12,0
	jc LB_16695
	btr r12,6
	jmp LB_16696
LB_16695:
	bts r12,6
LB_16696:
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_16691
	btr r12,5
	jmp LB_16692
LB_16691:
	bts r12,5
LB_16692:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_16689
	btr r12,4
	jmp LB_16690
LB_16689:
	bts r12,4
LB_16690:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_16687
	btr r12,3
	jmp LB_16688
LB_16687:
	bts r12,3
LB_16688:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_16685
	btr r12,2
	jmp LB_16686
LB_16685:
	bts r12,2
LB_16686:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16683
	btr r12,1
	jmp LB_16684
LB_16683:
	bts r12,1
LB_16684:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16681
	btr r12,0
	jmp LB_16682
LB_16681:
	bts r12,0
LB_16682:
	add rsp,56
; ∎ {  }
 ; {>  %_16454~3':_stg %_16477~6':_stg %_16460~4':_stg %_16458~2':_stg %_16452~1':_r64 %_16461~5':(_opn)◂(_stg) %_16451~0':_stg }
; 	∎ {  }
	bt r12,3
	jc LB_16697
	mov rdi,r9
	call dlt
LB_16697:
	bt r12,6
	jc LB_16698
	mov rdi,rcx
	call dlt
LB_16698:
	bt r12,4
	jc LB_16699
	mov rdi,r10
	call dlt
LB_16699:
	bt r12,2
	jc LB_16700
	mov rdi,r8
	call dlt
LB_16700:
	bt r12,1
	jc LB_16701
	mov rdi,r14
	call dlt
LB_16701:
	bt r12,5
	jc LB_16702
	mov rdi,r11
	call dlt
LB_16702:
	bt r12,0
	jc LB_16703
	mov rdi,r13
	call dlt
LB_16703:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_16678:
MTC_LB_16498:
	mov r15,0
LB_16705:
	cmp r15,0
	jz LB_16706
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_16705
LB_16706:
; _f12747 { %_16451 %_16452 } ⊢ { %_16478 %_16479 %_16480 } : { %_16478 %_16479 %_16480 }
 ; {>  %_16453~2':(_lst)◂(_stg) %_16452~1':_r64 %_16451~0':_stg }
; _f12747 { 0' 1' } ⊢ { 0' 1' 3' }
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 0' 1' }
	call NS_E_12747
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 0' 1' 3' }
	mov r10,r9
	bt r12,3
	jc LB_16709
	btr r12,4
	jmp LB_16710
LB_16709:
	bts r12,4
LB_16710:
	mov r9,r10
	bt r12,4
	jc LB_16713
	btr r12,3
	jmp LB_16714
LB_16713:
	bts r12,3
LB_16714:
	mov rsi,1
	bt r12,3
	jc LB_16711
	mov rsi,0
	bt r9,0
	jc LB_16711
	jmp LB_16712
LB_16711:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,r9
	mov QWORD [rax+8*1],rdi
	mov r9,rax
	btr r12,3
LB_16712:
	mov rax,r8
	shl rax,56
	or rax,1
	or r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_16707
	btr r12,2
	jmp LB_16708
LB_16707:
	bts r12,2
LB_16708:
	add rsp,16
; 	» "OpADL.mdls" _ ⊢ 4' : %_16481
	mov rdi,10
	call mlc_s8
	mov rdi,rax
	mov rax,0x_64_6d_2e_4c_44_41_70_4f
	mov QWORD [rdi+8*1+8*0],rax
	mov rax,0x_00_00_00_00_00_00_73_6c
	mov QWORD [rdi+8*1+8*1],rax
	mov r10,rdi
	btr r12,4
; _f25 %_16481 ⊢ { %_16482 %_16483 } : { %_16482 %_16483 }
 ; {>  %_16478~0':_stg %_16453~2':(_lst)◂(_stg) %_16480~3':(_opn)◂((_lst)◂(_p9427)) %_16481~4':_stg %_16479~1':_r64 }
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
	jc LB_16723
	btr r12,0
	jmp LB_16724
LB_16723:
	bts r12,0
LB_16724:
	call NS_E_25
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 4' 5' }
	mov r10,r13
	bt r12,0
	jc LB_16725
	btr r12,4
	jmp LB_16726
LB_16725:
	bts r12,4
LB_16726:
	mov r11,r14
	bt r12,1
	jc LB_16727
	btr r12,5
	jmp LB_16728
LB_16727:
	bts r12,5
LB_16728:
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_16721
	btr r12,3
	jmp LB_16722
LB_16721:
	bts r12,3
LB_16722:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_16719
	btr r12,2
	jmp LB_16720
LB_16719:
	bts r12,2
LB_16720:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16717
	btr r12,1
	jmp LB_16718
LB_16717:
	bts r12,1
LB_16718:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16715
	btr r12,0
	jmp LB_16716
LB_16715:
	bts r12,0
LB_16716:
	add rsp,40
; _f26 { %_16482 %_16483 } ⊢ { %_16484 %_16485 } : { %_16484 %_16485 }
 ; {>  %_16478~0':_stg %_16482~4':_stg %_16453~2':(_lst)◂(_stg) %_16480~3':(_opn)◂((_lst)◂(_p9427)) %_16483~5':_stg %_16479~1':_r64 }
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
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r10
	bt r12,4
	jc LB_16739
	btr r12,1
	jmp LB_16740
LB_16739:
	bts r12,1
LB_16740:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_16737
	btr QWORD [rdi],0
	jmp LB_16738
LB_16737:
	bts QWORD [rdi],0
LB_16738:
	mov r14,r11
	bt r12,5
	jc LB_16743
	btr r12,1
	jmp LB_16744
LB_16743:
	bts r12,1
LB_16744:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_16741
	btr QWORD [rdi],1
	jmp LB_16742
LB_16741:
	bts QWORD [rdi],1
LB_16742:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 4' 5' }
; 0' ⊢ { 4' 5' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_16747
	btr r12,1
	jmp LB_16748
LB_16747:
	bts r12,1
LB_16748:
	mov r10,r14
	bt r12,1
	jc LB_16745
	btr r12,4
	jmp LB_16746
LB_16745:
	bts r12,4
LB_16746:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_16751
	btr r12,1
	jmp LB_16752
LB_16751:
	bts r12,1
LB_16752:
	mov r11,r14
	bt r12,1
	jc LB_16749
	btr r12,5
	jmp LB_16750
LB_16749:
	bts r12,5
LB_16750:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_16735
	btr r12,3
	jmp LB_16736
LB_16735:
	bts r12,3
LB_16736:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_16733
	btr r12,2
	jmp LB_16734
LB_16733:
	bts r12,2
LB_16734:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16731
	btr r12,1
	jmp LB_16732
LB_16731:
	bts r12,1
LB_16732:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16729
	btr r12,0
	jmp LB_16730
LB_16729:
	bts r12,0
LB_16730:
	add rsp,40
; _f11637 %_16485 ⊢ { %_16486 %_16487 } : { %_16486 %_16487 }
 ; {>  %_16478~0':_stg %_16485~5':_stg %_16453~2':(_lst)◂(_stg) %_16480~3':(_opn)◂((_lst)◂(_p9427)) %_16484~4':_stg %_16479~1':_r64 }
; _f11637 5' ⊢ { 5' 6' }
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
	jc LB_16763
	btr r12,0
	jmp LB_16764
LB_16763:
	bts r12,0
LB_16764:
	call NS_E_11637
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ { 5' 6' }
	mov r11,r13
	bt r12,0
	jc LB_16765
	btr r12,5
	jmp LB_16766
LB_16765:
	bts r12,5
LB_16766:
	mov rcx,r14
	bt r12,1
	jc LB_16767
	btr r12,6
	jmp LB_16768
LB_16767:
	bts r12,6
LB_16768:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_16761
	btr r12,4
	jmp LB_16762
LB_16761:
	bts r12,4
LB_16762:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_16759
	btr r12,3
	jmp LB_16760
LB_16759:
	bts r12,3
LB_16760:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_16757
	btr r12,2
	jmp LB_16758
LB_16757:
	bts r12,2
LB_16758:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16755
	btr r12,1
	jmp LB_16756
LB_16755:
	bts r12,1
LB_16756:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16753
	btr r12,0
	jmp LB_16754
LB_16753:
	bts r12,0
LB_16754:
	add rsp,48
MTC_LB_16769:
	mov r15,0
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz MTC_LB_16770
; _emt_mov_ptn_to_ptn:{| 11111110.. |},6' ⊢ °0◂7'
; 6' ⊢ °0◂7'
	btr r12,8
	mov rax,rcx
	shr rax,56
	cmp rax,0
	jnz err_bug
	mov rdi,0x00ff_ffff_ffff_fffe
	and rdi,rcx
	bt QWORD [rdi],17
	jnc LB_16771
	bt QWORD [rdi],0
	jc LB_16772
	btr r12,8
	jmp LB_16773
LB_16772:
	bts r12,8
LB_16773:
	mov rax,rdi
	mov QWORD [gbg_vct+8*r15],rdi
	add r15,1
	mov rdi,QWORD [rdi+8*1]
LB_16771:
	mov QWORD [st_vct+8*8],rdi
	mov rdx,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_16774
	btr r12,7
	jmp LB_16775
LB_16774:
	bts r12,7
LB_16775:
LB_16776:
	cmp r15,0
	jz LB_16777
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_16776
LB_16777:
; » 0xr0 |~ {  } ⊢ %_16489 : %_16489
 ; {>  %_16486~5':_stg %_16478~0':_stg %_16488~7':_stg %_16453~2':(_lst)◂(_stg) %_16480~3':(_opn)◂((_lst)◂(_p9427)) %_16484~4':_stg %_16479~1':_r64 }
; 	» 0xr0 _ ⊢ 6' : %_16489
	mov rdi,0x0
	mov rcx,rdi
	bts r12,6
; _f12747 { %_16488 %_16489 } ⊢ { %_16490 %_16491 %_16492 } : { %_16490 %_16491 %_16492 }
 ; {>  %_16486~5':_stg %_16478~0':_stg %_16488~7':_stg %_16489~6':_r64 %_16453~2':(_lst)◂(_stg) %_16480~3':(_opn)◂((_lst)◂(_p9427)) %_16484~4':_stg %_16479~1':_r64 }
; _f12747 { 7' 6' } ⊢ { 6' 7' 8' }
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
	jc LB_16790
	btr r12,0
	jmp LB_16791
LB_16790:
	bts r12,0
LB_16791:
	mov r14,rcx
	bt r12,6
	jc LB_16792
	btr r12,1
	jmp LB_16793
LB_16792:
	bts r12,1
LB_16793:
	call NS_E_12747
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ 0' 1' 2'◂3' } ⊢ { 6' 7' 8' }
	mov rcx,r13
	bt r12,0
	jc LB_16794
	btr r12,6
	jmp LB_16795
LB_16794:
	bts r12,6
LB_16795:
	mov rdx,r14
	bt r12,1
	jc LB_16796
	btr r12,7
	jmp LB_16797
LB_16796:
	bts r12,7
LB_16797:
	mov rdi,r9
	mov QWORD [st_vct+8*8],rdi
	bt r12,3
	jc LB_16800
	btr r12,8
	jmp LB_16801
LB_16800:
	bts r12,8
LB_16801:
	mov rsi,1
	bt r12,8
	jc LB_16798
	mov rsi,0
	bt QWORD [st_vct+8*8],0
	jc LB_16798
	jmp LB_16799
LB_16798:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0002_fffe
	or rdi,rsi
	mov QWORD [rax],rdi
	mov rdi,QWORD [st_vct+8*8]
	mov QWORD [rax+8*1],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
LB_16799:
	mov rax,r8
	shl rax,56
	or rax,1
	or QWORD [st_vct+8*8],rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_16788
	btr r12,5
	jmp LB_16789
LB_16788:
	bts r12,5
LB_16789:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_16786
	btr r12,4
	jmp LB_16787
LB_16786:
	bts r12,4
LB_16787:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_16784
	btr r12,3
	jmp LB_16785
LB_16784:
	bts r12,3
LB_16785:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_16782
	btr r12,2
	jmp LB_16783
LB_16782:
	bts r12,2
LB_16783:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16780
	btr r12,1
	jmp LB_16781
LB_16780:
	bts r12,1
LB_16781:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16778
	btr r12,0
	jmp LB_16779
LB_16778:
	bts r12,0
LB_16779:
	add rsp,56
; _f26 { %_16490 %_16491 %_16492 } ⊢ { %_16493 %_16494 %_16495 } : { %_16493 %_16494 %_16495 }
 ; {>  %_16486~5':_stg %_16478~0':_stg %_16453~2':(_lst)◂(_stg) %_16480~3':(_opn)◂((_lst)◂(_p9427)) %_16484~4':_stg %_16490~6':_stg %_16479~1':_r64 %_16492~8':(_opn)◂((_lst)◂(_p9427)) %_16491~7':_r64 }
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
	mov rbx,[rax]
	mov rdi,0x0000_0003_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,rcx
	bt r12,6
	jc LB_16816
	btr r12,1
	jmp LB_16817
LB_16816:
	bts r12,1
LB_16817:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*0],r14
	bt r12,1
	jc LB_16814
	btr QWORD [rdi],0
	jmp LB_16815
LB_16814:
	bts QWORD [rdi],0
LB_16815:
	mov r14,rdx
	bt r12,7
	jc LB_16820
	btr r12,1
	jmp LB_16821
LB_16820:
	bts r12,1
LB_16821:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*1],r14
	bt r12,1
	jc LB_16818
	btr QWORD [rdi],1
	jmp LB_16819
LB_16818:
	bts QWORD [rdi],1
LB_16819:
	mov r14,QWORD [st_vct+8*8]
	bt r12,8
	jc LB_16824
	btr r12,1
	jmp LB_16825
LB_16824:
	bts r12,1
LB_16825:
	mov rdi,r13
	mov QWORD [rdi+8*1+8*2],r14
	bt r12,1
	jc LB_16822
	btr QWORD [rdi],2
	jmp LB_16823
LB_16822:
	bts QWORD [rdi],2
LB_16823:
	call NS_E_26
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 6' 7' 8' }
; 0' ⊢ { 6' 7' 8' }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_16828
	btr r12,1
	jmp LB_16829
LB_16828:
	bts r12,1
LB_16829:
	mov rcx,r14
	bt r12,1
	jc LB_16826
	btr r12,6
	jmp LB_16827
LB_16826:
	bts r12,6
LB_16827:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_16832
	btr r12,1
	jmp LB_16833
LB_16832:
	bts r12,1
LB_16833:
	mov rdx,r14
	bt r12,1
	jc LB_16830
	btr r12,7
	jmp LB_16831
LB_16830:
	bts r12,7
LB_16831:
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*2]
	mov r14,rax
	bt QWORD [rdi],2
	jc LB_16836
	btr r12,1
	jmp LB_16837
LB_16836:
	bts r12,1
LB_16837:
	mov rdi,r14
	mov QWORD [st_vct+8*8],rdi
	bt r12,1
	jc LB_16834
	btr r12,8
	jmp LB_16835
LB_16834:
	bts r12,8
LB_16835:
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*5]
	bt QWORD rax,5
	jc LB_16812
	btr r12,5
	jmp LB_16813
LB_16812:
	bts r12,5
LB_16813:
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_16810
	btr r12,4
	jmp LB_16811
LB_16810:
	bts r12,4
LB_16811:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_16808
	btr r12,3
	jmp LB_16809
LB_16808:
	bts r12,3
LB_16809:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_16806
	btr r12,2
	jmp LB_16807
LB_16806:
	bts r12,2
LB_16807:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_16804
	btr r12,1
	jmp LB_16805
LB_16804:
	bts r12,1
LB_16805:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_16802
	btr r12,0
	jmp LB_16803
LB_16802:
	bts r12,0
LB_16803:
	add rsp,56
; ∎ {  }
 ; {>  %_16486~5':_stg %_16494~7':_r64 %_16478~0':_stg %_16495~8':(_opn)◂((_lst)◂(_p9427)) %_16453~2':(_lst)◂(_stg) %_16480~3':(_opn)◂((_lst)◂(_p9427)) %_16484~4':_stg %_16479~1':_r64 %_16493~6':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_16838
	mov rdi,r11
	call dlt
LB_16838:
	bt r12,7
	jc LB_16839
	mov rdi,rdx
	call dlt
LB_16839:
	bt r12,0
	jc LB_16840
	mov rdi,r13
	call dlt
LB_16840:
	bt r12,8
	jc LB_16841
	mov rdi,QWORD [st_vct+8*8]
	call dlt
LB_16841:
	bt r12,2
	jc LB_16842
	mov rdi,r8
	call dlt
LB_16842:
	bt r12,3
	jc LB_16843
	mov rdi,r9
	call dlt
LB_16843:
	bt r12,4
	jc LB_16844
	mov rdi,r10
	call dlt
LB_16844:
	bt r12,1
	jc LB_16845
	mov rdi,r14
	call dlt
LB_16845:
	bt r12,6
	jc LB_16846
	mov rdi,rcx
	call dlt
LB_16846:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_16770:
	mov r15,0
LB_16848:
	cmp r15,0
	jz LB_16849
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_16848
LB_16849:
; ∎ {  }
 ; {>  %_16486~5':_stg %_16478~0':_stg %_16453~2':(_lst)◂(_stg) %_16480~3':(_opn)◂((_lst)◂(_p9427)) %_16484~4':_stg %_16487~6':(_opn)◂(_stg) %_16479~1':_r64 }
; 	∎ {  }
	bt r12,5
	jc LB_16850
	mov rdi,r11
	call dlt
LB_16850:
	bt r12,0
	jc LB_16851
	mov rdi,r13
	call dlt
LB_16851:
	bt r12,2
	jc LB_16852
	mov rdi,r8
	call dlt
LB_16852:
	bt r12,3
	jc LB_16853
	mov rdi,r9
	call dlt
LB_16853:
	bt r12,4
	jc LB_16854
	mov rdi,r10
	call dlt
LB_16854:
	bt r12,6
	jc LB_16855
	mov rdi,rcx
	call dlt
LB_16855:
	bt r12,1
	jc LB_16856
	mov rdi,r14
	call dlt
LB_16856:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_16847:
MTC_LB_16704:
section .data
	NS_E_DYN_8701:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_8701
	NS_E_DYN_8704:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_8704
	NS_E_DYN_8705:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_8705
	NS_E_DYN_8706:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_8706
	NS_E_DYN_8707:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_8707
	NS_E_DYN_8714:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_8714
	NS_E_DYN_8753:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_8753
	NS_E_DYN_8771:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_8771
	NS_E_DYN_8814:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_8814
	NS_E_DYN_8824:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_8824
	NS_E_DYN_8825:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_8825
	NS_E_DYN_8826:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_8826
	NS_E_DYN_9044:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9044
	NS_E_DYN_9083:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9083
	NS_E_DYN_9122:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9122
	NS_E_DYN_9161:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9161
	NS_E_DYN_9192:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9192
	NS_E_DYN_9193:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9193
	NS_E_DYN_9194:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9194
	NS_E_DYN_9321:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9321
	NS_E_DYN_9380:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_9381:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_9390:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9390
	NS_E_DYN_9425:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_9426:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_9506:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_9507:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_9508:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_9509:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_9510:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_9511:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_9512:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_9513:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_9514:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_9515:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_9516:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_9517:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_9518:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 4
	NS_E_DYN_9519:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_9520:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_9521:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_9522:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_9523:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_9524:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 2
	NS_E_DYN_9525:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 3
	NS_E_DYN_9533:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9533
	NS_E_DYN_9599:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9599
	NS_E_DYN_9591:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9591
	NS_E_DYN_9582:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9582
	NS_E_DYN_9574:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9574
	NS_E_DYN_9992:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9992
	NS_E_DYN_9960:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9960
	NS_E_DYN_9929:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9929
	NS_E_DYN_9912:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9912
	NS_E_DYN_9900:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9900
	NS_E_DYN_9882:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9882
	NS_E_DYN_9862:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9862
	NS_E_DYN_9833:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9833
	NS_E_DYN_9816:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9816
	NS_E_DYN_9807:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9807
	NS_E_DYN_9792:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9792
	NS_E_DYN_9749:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_9749
	NS_E_DYN_10884:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_10885:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_10886:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10886
	NS_E_DYN_10887:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10887
	NS_E_DYN_10888:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10888
	NS_E_DYN_10889:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_10889
	NS_E_DYN_11536:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11536
	NS_E_DYN_11637:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11637
	CST_DYN_11699:
		dq 0x0000_0001_00_82_ffff
		dq 1
	NS_E_DYN_11702:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11702
	NS_E_DYN_11769:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11769
	NS_E_DYN_11854:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 0
	NS_E_DYN_11855:
		dq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001
		dq 1
	NS_E_DYN_11862:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11862
	NS_E_DYN_11898:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11898
	NS_E_DYN_11899:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11899
	NS_E_DYN_11900:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11900
	NS_E_DYN_11901:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_11901
	NS_E_DYN_12162:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12162
	NS_E_DYN_12163:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12163
	NS_E_DYN_12166:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12166
	NS_E_DYN_12167:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12167
	NS_E_DYN_12432:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12432
	NS_E_DYN_12433:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12433
	NS_E_DYN_12434:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12434
	NS_E_DYN_12435:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12435
	NS_E_DYN_12436:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12436
	NS_E_DYN_12747:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12747
	NS_E_DYN_12748:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12748
	NS_E_DYN_12749:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12749
	NS_E_DYN_12750:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12750
	NS_E_DYN_12751:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12751
	NS_E_DYN_12752:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12752
	NS_E_DYN_12753:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12753
	NS_E_DYN_12756:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12756
	NS_E_DYN_12757:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12757
	NS_E_DYN_12758:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12758
	NS_E_DYN_12759:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12759
	NS_E_DYN_12760:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12760
	NS_E_DYN_12761:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12761
	NS_E_DYN_12762:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12762
	NS_E_DYN_12763:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12763
	NS_E_DYN_12764:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12764
	NS_E_DYN_12765:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12765
	NS_E_DYN_12766:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12766
	NS_E_DYN_12767:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12767
	NS_E_DYN_12768:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12768
	NS_E_DYN_12769:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12769
	NS_E_DYN_12770:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12770
	NS_E_DYN_12771:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12771
	NS_E_DYN_12772:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12772
	NS_E_DYN_12773:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12773
	NS_E_DYN_12774:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12774
	NS_E_DYN_12775:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12775
	NS_E_DYN_12776:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12776
	NS_E_DYN_12777:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12777
	NS_E_DYN_12778:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12778
	NS_E_DYN_12779:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12779
	NS_E_DYN_12780:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12780
	NS_E_DYN_12781:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12781
	NS_E_DYN_12782:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12782
	NS_E_DYN_12783:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12783
	NS_E_DYN_12784:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12784
	NS_E_DYN_12785:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12785
	NS_E_DYN_12786:
		dq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001
		dq NS_E_12786
	CST_DYN_16496:
		dq 0x0000_0001_00_82_ffff
		dq 1
