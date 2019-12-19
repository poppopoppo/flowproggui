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
	call NS_E_1740
	call exec_out
	jmp _end
NS_E_ID_36: dq 0
NS_E_36:
NS_E_RDI_36:
	mov rdi,[in0]
	call rpc_s8
	mov r13,rax
	btr r12,0
	ret
NS_E_ID_38: dq 0
NS_E_38:
NS_E_RDI_38:
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
NS_E_1704:
NS_E_RDI_1704:
NS_E_1704_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call byt
	jnc LB_1705
	add r14,1
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
LB_1705:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rax,0x0000_0000_0000_ffff
	mov QWORD [rdi],rax
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1707:
NS_E_RDI_1707:
NS_E_1707_ETR_TBL:
	mov rdi,r13
	mov rsi,r14
	call prs_chr
	mov r13,rdi
	mov r14,rsi
	bt rax,63
	jc NS_E_1707_LB_0
	mov r8,0
	mov r9,rax
	btr r12,3
	bts r12,2
	ret
NS_E_1707_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1708:
NS_E_RDI_1708:
NS_E_1708_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,48
	jb NS_E_1708_LB_0
	cmp r11,57
	ja NS_E_1708_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1708_LB_0:
	mov rax,0
	ret
NS_E_1710:
NS_E_RDI_1710:
NS_E_1710_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,97
	jb NS_E_1710_LB_0
	cmp r11,122
	ja NS_E_1710_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1710_LB_0:
	mov rax,0
	ret
NS_E_1709:
NS_E_RDI_1709:
NS_E_1709_ETR_TBL:
	mov r11b,[rdi+rsi+8*1]
	cmp r11,65
	jb NS_E_1709_LB_0
	cmp r11,90
	ja NS_E_1709_LB_0
	add rsi,1
	mov rax,1
	ret
NS_E_1709_LB_0:
	mov rax,0
	ret
NS_E_45:
	mov rdi,r13
	bt r12,0
NS_E_RDI_45:
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
NS_E_ID_59: dq 0
NS_E_59:
NS_E_RDI_59:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_1716
	bt QWORD [rdi],17
	jnc LB_1716
	bt QWORD [rdi],0
	jc LB_1718
	btr r12,2
	clc
	jmp LB_1719
LB_1718:
	bts r12,2
	stc
LB_1719:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_1717
LB_1716:
	btr r12,2
	clc
	call dcp
LB_1717:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_23: dq 0
NS_E_23:
NS_E_RDI_23:
	push r13
	push r14
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rdi,QWORD [rdi+8+8*rax]
	bt rdi,0
	jc LB_1712
	bt QWORD [rdi],17
	jnc LB_1712
	bt QWORD [rdi],0
	jc LB_1714
	btr r12,2
	clc
	jmp LB_1715
LB_1714:
	bts r12,2
	stc
LB_1715:
	mov rdi,QWORD [rdi+8]
	call dcp
	jmp LB_1713
LB_1712:
	btr r12,2
	clc
	call dcp
LB_1713:
	mov r8,rax
	pop r14
	pop r13
	ret
NS_E_ID_22: dq 0
NS_E_22:
NS_E_RDI_22:
	mov rdi,r13
	mov rax,r14
	mov esi,DWORD [rdi+4]
	cmp rax,rsi
	jge err
	mov rsi,QWORD [rdi+8+8*rax]
	not rsi
	xor rsi,rsp
	mov rsi,[rsi]
	bt r12,2
	jc LB_1711
	mov rsi,r8
	mov QWORD [rdi+8+8*rax],rsi
	ret
LB_1711:
	mov rsi,rbx
	mov rbx,[rsi]
	mov QWORD [rdi+8+8*rax],rsi
	mov rax,r8
	mov QWORD [rsi+8],rax
	mov rax,0x0000_0001_0002_ffff
	mov QWORD [rsi],rax
	ret
NS_E_ID_20: dq 0
NS_E_20:
NS_E_RDI_20:
	mov rdi,r13
	push r13
	call mk_arr
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_35: dq 0
NS_E_35:
NS_E_RDI_35:
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
NS_E_ID_34: dq 0
NS_E_34:
NS_E_RDI_34:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	xchg al,BYTE [rdi+8+rsi]
	and rax,0xff
	ret
NS_E_ID_33: dq 0
NS_E_33:
NS_E_RDI_33:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	mov rax,r8
	mov BYTE [rdi+8+rsi],al
	ret
NS_E_ID_32: dq 0
NS_E_32:
NS_E_RDI_32:
	mov rdi,r13
	mov rsi,r14
	mov eax,DWORD [rdi+4]
	cmp rsi,rax
	jge err_s8_ge
	movzx rax,BYTE [rdi+8+rsi]
	mov r8,rax
	bts r12,2
	ret
NS_E_ID_31: dq 0
NS_E_31:
NS_E_RDI_31:
	mov rdi,r13
	push r13
	call mlc_s8
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_ID_37: dq 0
NS_E_37:
NS_E_RDI_37:
	mov rdi,r13
	push r13
	call in_fn
	mov r14,rax
	pop r13
	btr r12,1
	ret
NS_E_1706:
NS_E_RDI_1706:
NS_E_1706_ETR_TBL:
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
	jz NS_E_1706_LB_0
	mov r14,rsi
	mov r8,0
	mov r9,rax
	bts r12,3
	bts r12,2
	ret
NS_E_1706_LB_0:
	mov r8,1
	mov rdi,rbx
	mov rbx,[rdi]
	mov rsi,0x0000_0000_0000_ffff
	mov QWORD [rdi],rsi
	mov r9,rdi
	btr r12,3
	bts r12,2
	ret
NS_E_1740:
NS_E_RDI_1740:
; » 0xr2 |~ {  } ⊢ %_1720 : %_1720
 ; {>  }
; 	» 0xr2 _ ⊢ 0' : %_1720
	mov rdi,0x2
	mov r13,rdi
	bts r12,0
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 1'
	mov r14,r13
	bt r12,0
	jc LB_1741
	btr r12,1
	jmp LB_1742
LB_1741:
	bts r12,1
LB_1742:
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r14
	mov QWORD [rsp],r12
	mov rdi,r14
	bt r12,1
	jc LB_1745
	btr r12,2
	clc
	jmp LB_1746
LB_1745:
	bts r12,2
	stc
LB_1746:
	call dcp
	mov r8,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r14,QWORD [rsp+8+8*0]
	bt QWORD rax,1
	jc LB_1743
	btr r12,1
	clc
	jmp LB_1744
LB_1743:
	bts r12,1
	stc
LB_1744:
	add rsp,16
; _f38 { %_1721 %_1722 } ⊢ { %_1723 %_1724 } : { %_1723 %_1724 }
 ; {>  %_1722~2':_r64 %_1721~1':_r64 }
; _f38 { 1' 2' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0110.. |},{ 1' 2' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r14
	bt r12,1
	jc LB_1749
	btr r12,3
	jmp LB_1750
LB_1749:
	bts r12,3
LB_1750:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_1747
	btr QWORD [rdi],0
	jmp LB_1748
LB_1747:
	bts QWORD [rdi],0
LB_1748:
	mov r9,r8
	bt r12,2
	jc LB_1753
	btr r12,3
	jmp LB_1754
LB_1753:
	bts r12,3
LB_1754:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_1751
	btr QWORD [rdi],1
	jmp LB_1752
LB_1751:
	bts QWORD [rdi],1
LB_1752:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_1755
	btr r12,2
	jmp LB_1756
LB_1755:
	bts r12,2
LB_1756:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1759
	btr r12,3
	clc
	jmp LB_1760
LB_1759:
	bts r12,3
	stc
LB_1760:
	mov r13,r9
	bt r12,3
	jc LB_1757
	btr r12,0
	jmp LB_1758
LB_1757:
	bts r12,0
LB_1758:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1763
	btr r12,3
	clc
	jmp LB_1764
LB_1763:
	bts r12,3
	stc
LB_1764:
	mov r14,r9
	bt r12,3
	jc LB_1761
	btr r12,1
	jmp LB_1762
LB_1761:
	bts r12,1
LB_1762:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 2'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r8,rax
	btr r12,2
	mov r9,r13
	bt r12,0
	jc LB_1767
	btr r12,3
	jmp LB_1768
LB_1767:
	bts r12,3
LB_1768:
	mov rdi,r8
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_1765
	btr QWORD [rdi],0
	jmp LB_1766
LB_1765:
	bts QWORD [rdi],0
LB_1766:
	mov r9,r14
	bt r12,1
	jc LB_1771
	btr r12,3
	jmp LB_1772
LB_1771:
	bts r12,3
LB_1772:
	mov rdi,r8
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_1769
	btr QWORD [rdi],1
	jmp LB_1770
LB_1769:
	bts QWORD [rdi],1
LB_1770:
; push_iv 
	sub rsp,16
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp],r12
	mov rdi,r8
	bt r12,2
	jc LB_1775
	btr r12,3
	clc
	jmp LB_1776
LB_1775:
	bts r12,3
	stc
LB_1776:
	call dcp
	mov r9,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1773
	btr r12,2
	clc
	jmp LB_1774
LB_1773:
	bts r12,2
	stc
LB_1774:
	add rsp,16
; _f38 { %_1725 %_1726 } ⊢ { %_1727 %_1728 } : { %_1727 %_1728 }
 ; {>  %_1726~3':{ _r64 _r64 } %_1725~2':{ _r64 _r64 } }
; _f38 { 2' 3' } ⊢ { { 0' 1' } { 2' 3' } }
; push_iv 
	sub rsp,8
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00110.. |},{ 2' 3' } ⊢ 0'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r14,r8
	bt r12,2
	jc LB_1779
	btr r12,1
	jmp LB_1780
LB_1779:
	bts r12,1
LB_1780:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_1777
	btr QWORD [rdi],0
	jmp LB_1778
LB_1777:
	bts QWORD [rdi],0
LB_1778:
	mov r14,r9
	bt r12,3
	jc LB_1783
	btr r12,1
	jmp LB_1784
LB_1783:
	bts r12,1
LB_1784:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_1781
	btr QWORD [rdi],1
	jmp LB_1782
LB_1781:
	bts QWORD [rdi],1
LB_1782:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { { 0' 1' } { 2' 3' } }
	mov r10,r13
	bt r12,0
	jc LB_1785
	btr r12,4
	jmp LB_1786
LB_1785:
	bts r12,4
LB_1786:
; 4' ⊢ { { 0' 1' } { 2' 3' } }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1795
	btr r12,5
	clc
	jmp LB_1796
LB_1795:
	bts r12,5
	stc
LB_1796:
; 5' ⊢ { 0' 1' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov r8,rax
	bt QWORD [rdi],0
	jc LB_1789
	btr r12,2
	clc
	jmp LB_1790
LB_1789:
	bts r12,2
	stc
LB_1790:
	mov r13,r8
	bt r12,2
	jc LB_1787
	btr r12,0
	jmp LB_1788
LB_1787:
	bts r12,0
LB_1788:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov r8,rax
	bt QWORD [rdi],1
	jc LB_1793
	btr r12,2
	clc
	jmp LB_1794
LB_1793:
	bts r12,2
	stc
LB_1794:
	mov r14,r8
	bt r12,2
	jc LB_1791
	btr r12,1
	jmp LB_1792
LB_1791:
	bts r12,1
LB_1792:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1805
	btr r12,5
	clc
	jmp LB_1806
LB_1805:
	bts r12,5
	stc
LB_1806:
; 5' ⊢ { 2' 3' }
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*0]
	mov rcx,rax
	bt QWORD [rdi],0
	jc LB_1799
	btr r12,6
	clc
	jmp LB_1800
LB_1799:
	bts r12,6
	stc
LB_1800:
	mov r8,rcx
	bt r12,6
	jc LB_1797
	btr r12,2
	jmp LB_1798
LB_1797:
	bts r12,2
LB_1798:
	mov rdi,r11
	mov rax,QWORD [rdi+8*1+8*1]
	mov rcx,rax
	bt QWORD [rdi],1
	jc LB_1803
	btr r12,6
	clc
	jmp LB_1804
LB_1803:
	bts r12,6
	stc
LB_1804:
	mov r9,rcx
	bt r12,6
	jc LB_1801
	btr r12,3
	jmp LB_1802
LB_1801:
	bts r12,3
LB_1802:
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	add rsp,8
; _emt_mov_ptn_to_ptn:{| 11110.. |},{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } ⊢ 4'
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r10,rax
	btr r12,4
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0004_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_1809
	btr QWORD [rdi],0
	jmp LB_1810
LB_1809:
	bts QWORD [rdi],0
LB_1810:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,6
	jc LB_1811
	btr QWORD [rdi],1
	jmp LB_1812
LB_1811:
	bts QWORD [rdi],1
LB_1812:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*2],rsi
	bt r12,6
	jc LB_1813
	btr QWORD [rdi],2
	jmp LB_1814
LB_1813:
	bts QWORD [rdi],2
LB_1814:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*3],rsi
	bt r12,6
	jc LB_1815
	btr QWORD [rdi],3
	jmp LB_1816
LB_1815:
	bts QWORD [rdi],3
LB_1816:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,5
	jc LB_1807
	btr QWORD [rdi],0
	jmp LB_1808
LB_1807:
	bts QWORD [rdi],0
LB_1808:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0001_0000_ffff
	mov QWORD [rax],rdi
	mov r11,rax
	btr r12,5
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rcx,rax
	btr r12,6
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov rdx,rax
	btr r12,7
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,7
	jc LB_1821
	btr QWORD [rdi],0
	jmp LB_1822
LB_1821:
	bts QWORD [rdi],0
LB_1822:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov rdx,rax
	btr r12,7
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
	mov rdi,rdx
	mov rsi,QWORD [st_vct+8*8]
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,8
	jc LB_1825
	btr QWORD [rdi],0
	jmp LB_1826
LB_1825:
	bts QWORD [rdi],0
LB_1826:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0000_0000_ffff
	mov QWORD [rax],rdi
	mov QWORD [st_vct+8*8],rax
	btr r12,8
	mov rdi,rdx
	mov rsi,QWORD [st_vct+8*8]
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,8
	jc LB_1827
	btr QWORD [rdi],1
	jmp LB_1828
LB_1827:
	bts QWORD [rdi],1
LB_1828:
	mov rdi,rcx
	mov rsi,rdx
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,7
	jc LB_1823
	btr QWORD [rdi],1
	jmp LB_1824
LB_1823:
	bts QWORD [rdi],1
LB_1824:
	mov rdi,r11
	mov rsi,rcx
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,6
	jc LB_1819
	btr QWORD [rdi],0
	jmp LB_1820
LB_1819:
	bts QWORD [rdi],0
LB_1820:
	mov rdi,r10
	mov rsi,r11
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,5
	jc LB_1817
	btr QWORD [rdi],1
	jmp LB_1818
LB_1817:
	bts QWORD [rdi],1
LB_1818:
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
	mov rdi,r10
	bt r12,4
	jc LB_1839
	btr r12,5
	clc
	jmp LB_1840
LB_1839:
	bts r12,5
	stc
LB_1840:
	call dcp
	mov r11,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_1837
	btr r12,4
	clc
	jmp LB_1838
LB_1837:
	bts r12,4
	stc
LB_1838:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_1835
	btr r12,3
	clc
	jmp LB_1836
LB_1835:
	bts r12,3
	stc
LB_1836:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1833
	btr r12,2
	clc
	jmp LB_1834
LB_1833:
	bts r12,2
	stc
LB_1834:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1831
	btr r12,1
	clc
	jmp LB_1832
LB_1831:
	bts r12,1
	stc
LB_1832:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1829
	btr r12,0
	clc
	jmp LB_1830
LB_1829:
	bts r12,0
	stc
LB_1830:
	add rsp,48
; _f38 { %_1729 %_1730 } ⊢ { %_1731 %_1732 } : { %_1731 %_1732 }
 ; {>  %_1730~5':{ { { } { } { } { } } { { { } { { } { } } } } } %_1728~{ 2' 3' }:{ _r64 _r64 } %_1729~4':{ { { } { } { } { } } { { { } { { } { } } } } } %_1727~{ 0' 1' }:{ _r64 _r64 } }
; _f38 { 4' 5' } ⊢ { { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } }
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
	jc LB_1851
	btr r12,1
	jmp LB_1852
LB_1851:
	bts r12,1
LB_1852:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,1
	jc LB_1849
	btr QWORD [rdi],0
	jmp LB_1850
LB_1849:
	bts QWORD [rdi],0
LB_1850:
	mov r14,r11
	bt r12,5
	jc LB_1855
	btr r12,1
	jmp LB_1856
LB_1855:
	bts r12,1
LB_1856:
	mov rdi,r13
	mov rsi,r14
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,1
	jc LB_1853
	btr QWORD [rdi],1
	jmp LB_1854
LB_1853:
	bts QWORD [rdi],1
LB_1854:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } }
; 0' ⊢ { { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } } }
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*0]
	mov r14,rax
	bt QWORD [rdi],0
	jc LB_1879
	btr r12,1
	clc
	jmp LB_1880
LB_1879:
	bts r12,1
	stc
LB_1880:
; 1' ⊢ { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*0]
	mov r8,rax
	bt QWORD [rdi],0
	jc LB_1865
	btr r12,2
	clc
	jmp LB_1866
LB_1865:
	bts r12,2
	stc
LB_1866:
; 2' ⊢ { {  } {  } {  } {  } }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1857
	btr r12,3
	clc
	jmp LB_1858
LB_1857:
	bts r12,3
	stc
LB_1858:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1859
	btr r12,3
	clc
	jmp LB_1860
LB_1859:
	bts r12,3
	stc
LB_1860:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*2]
	mov r9,rax
	bt QWORD [rdi],2
	jc LB_1861
	btr r12,3
	clc
	jmp LB_1862
LB_1861:
	bts r12,3
	stc
LB_1862:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*3]
	mov r9,rax
	bt QWORD [rdi],3
	jc LB_1863
	btr r12,3
	clc
	jmp LB_1864
LB_1863:
	bts r12,3
	stc
LB_1864:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*1]
	mov r8,rax
	bt QWORD [rdi],1
	jc LB_1877
	btr r12,2
	clc
	jmp LB_1878
LB_1877:
	bts r12,2
	stc
LB_1878:
; 2' ⊢ { { {  } { {  } {  } } } }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1875
	btr r12,3
	clc
	jmp LB_1876
LB_1875:
	bts r12,3
	stc
LB_1876:
; 3' ⊢ { {  } { {  } {  } } }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1867
	btr r12,4
	clc
	jmp LB_1868
LB_1867:
	bts r12,4
	stc
LB_1868:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1873
	btr r12,4
	clc
	jmp LB_1874
LB_1873:
	bts r12,4
	stc
LB_1874:
; 4' ⊢ { {  } {  } }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1869
	btr r12,5
	clc
	jmp LB_1870
LB_1869:
	bts r12,5
	stc
LB_1870:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1871
	btr r12,5
	clc
	jmp LB_1872
LB_1871:
	bts r12,5
	stc
LB_1872:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov rax,QWORD [rdi+8*1+8*1]
	mov r14,rax
	bt QWORD [rdi],1
	jc LB_1903
	btr r12,1
	clc
	jmp LB_1904
LB_1903:
	bts r12,1
	stc
LB_1904:
; 1' ⊢ { { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*0]
	mov r8,rax
	bt QWORD [rdi],0
	jc LB_1889
	btr r12,2
	clc
	jmp LB_1890
LB_1889:
	bts r12,2
	stc
LB_1890:
; 2' ⊢ { {  } {  } {  } {  } }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1881
	btr r12,3
	clc
	jmp LB_1882
LB_1881:
	bts r12,3
	stc
LB_1882:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1883
	btr r12,3
	clc
	jmp LB_1884
LB_1883:
	bts r12,3
	stc
LB_1884:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*2]
	mov r9,rax
	bt QWORD [rdi],2
	jc LB_1885
	btr r12,3
	clc
	jmp LB_1886
LB_1885:
	bts r12,3
	stc
LB_1886:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*3]
	mov r9,rax
	bt QWORD [rdi],3
	jc LB_1887
	btr r12,3
	clc
	jmp LB_1888
LB_1887:
	bts r12,3
	stc
LB_1888:
; 3' ⊢ {  }
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov rax,QWORD [rdi+8*1+8*1]
	mov r8,rax
	bt QWORD [rdi],1
	jc LB_1901
	btr r12,2
	clc
	jmp LB_1902
LB_1901:
	bts r12,2
	stc
LB_1902:
; 2' ⊢ { { {  } { {  } {  } } } }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1899
	btr r12,3
	clc
	jmp LB_1900
LB_1899:
	bts r12,3
	stc
LB_1900:
; 3' ⊢ { {  } { {  } {  } } }
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*0]
	mov r10,rax
	bt QWORD [rdi],0
	jc LB_1891
	btr r12,4
	clc
	jmp LB_1892
LB_1891:
	bts r12,4
	stc
LB_1892:
; 4' ⊢ {  }
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r9
	mov rax,QWORD [rdi+8*1+8*1]
	mov r10,rax
	bt QWORD [rdi],1
	jc LB_1897
	btr r12,4
	clc
	jmp LB_1898
LB_1897:
	bts r12,4
	stc
LB_1898:
; 4' ⊢ { {  } {  } }
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*0]
	mov r11,rax
	bt QWORD [rdi],0
	jc LB_1893
	btr r12,5
	clc
	jmp LB_1894
LB_1893:
	bts r12,5
	stc
LB_1894:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov rax,QWORD [rdi+8*1+8*1]
	mov r11,rax
	bt QWORD [rdi],1
	jc LB_1895
	btr r12,5
	clc
	jmp LB_1896
LB_1895:
	bts r12,5
	stc
LB_1896:
; 5' ⊢ {  }
	mov rdi,r11
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r10
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r9
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r14
	mov [rdi],rbx
	mov rbx,rdi
	mov rdi,r13
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_1847
	btr r12,3
	clc
	jmp LB_1848
LB_1847:
	bts r12,3
	stc
LB_1848:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1845
	btr r12,2
	clc
	jmp LB_1846
LB_1845:
	bts r12,2
	stc
LB_1846:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1843
	btr r12,1
	clc
	jmp LB_1844
LB_1843:
	bts r12,1
	stc
LB_1844:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1841
	btr r12,0
	clc
	jmp LB_1842
LB_1841:
	bts r12,0
	stc
LB_1842:
	add rsp,40
; 	» "HHH" _ ⊢ 4' : %_1733
	mov rdi,3
	call mlc_s8
	mov rdi,rax
	mov rax,0x_00_00_00_00_00_48_48_48
	mov QWORD [rdi+8*1+8*0],rax
	mov r10,rdi
	btr r12,4
; _emt_mov_ptn_to_ptn:{| 111110.. |},4' ⊢ 5'
	mov r11,r10
	bt r12,4
	jc LB_1905
	btr r12,5
	jmp LB_1906
LB_1905:
	bts r12,5
LB_1906:
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r11
	mov QWORD [rsp],r12
	mov rdi,r11
	bt r12,5
	jc LB_1917
	btr r12,6
	clc
	jmp LB_1918
LB_1917:
	bts r12,6
	stc
LB_1918:
	call dcp
	mov rcx,rax
; pop_iv
	mov rax,QWORD [rsp]
	mov r11,QWORD [rsp+8+8*4]
	bt QWORD rax,5
	jc LB_1915
	btr r12,5
	clc
	jmp LB_1916
LB_1915:
	bts r12,5
	stc
LB_1916:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_1913
	btr r12,3
	clc
	jmp LB_1914
LB_1913:
	bts r12,3
	stc
LB_1914:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1911
	btr r12,2
	clc
	jmp LB_1912
LB_1911:
	bts r12,2
	stc
LB_1912:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1909
	btr r12,1
	clc
	jmp LB_1910
LB_1909:
	bts r12,1
	stc
LB_1910:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1907
	btr r12,0
	clc
	jmp LB_1908
LB_1907:
	bts r12,0
	stc
LB_1908:
	add rsp,48
; _f38 %_1734 ⊢ %_1736 : %_1736
 ; {>  %_1728~{ 2' 3' }:{ _r64 _r64 } %_1735~6':_stg %_1727~{ 0' 1' }:{ _r64 _r64 } %_1732~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_1731~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_1734~5':_stg }
; _f38 5' ⊢ 4'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],rcx
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 0000010.. |},5' ⊢ 0'
	mov r13,r11
	bt r12,5
	jc LB_1929
	btr r12,0
	jmp LB_1930
LB_1929:
	bts r12,0
LB_1930:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 4'
	mov r10,r13
	bt r12,0
	jc LB_1931
	btr r12,4
	jmp LB_1932
LB_1931:
	bts r12,4
LB_1932:
; pop_iv
	mov rax,QWORD [rsp]
	mov rcx,QWORD [rsp+8+8*4]
	bt QWORD rax,6
	jc LB_1927
	btr r12,6
	clc
	jmp LB_1928
LB_1927:
	bts r12,6
	stc
LB_1928:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_1925
	btr r12,3
	clc
	jmp LB_1926
LB_1925:
	bts r12,3
	stc
LB_1926:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1923
	btr r12,2
	clc
	jmp LB_1924
LB_1923:
	bts r12,2
	stc
LB_1924:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1921
	btr r12,1
	clc
	jmp LB_1922
LB_1921:
	bts r12,1
	stc
LB_1922:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1919
	btr r12,0
	clc
	jmp LB_1920
LB_1919:
	bts r12,0
	stc
LB_1920:
	add rsp,48
; _f38 %_1735 ⊢ %_1737 : %_1737
 ; {>  %_1728~{ 2' 3' }:{ _r64 _r64 } %_1735~6':_stg %_1727~{ 0' 1' }:{ _r64 _r64 } %_1732~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_1731~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_1736~4':_stg }
; _f38 6' ⊢ 5'
; push_iv 
	sub rsp,48
	mov QWORD [rsp+8+8*0],r13
	mov QWORD [rsp+8+8*1],r14
	mov QWORD [rsp+8+8*2],r8
	mov QWORD [rsp+8+8*3],r9
	mov QWORD [rsp+8+8*4],r10
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 00000010.. |},6' ⊢ 0'
	mov r13,rcx
	bt r12,6
	jc LB_1943
	btr r12,0
	jmp LB_1944
LB_1943:
	bts r12,0
LB_1944:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 5'
	mov r11,r13
	bt r12,0
	jc LB_1945
	btr r12,5
	jmp LB_1946
LB_1945:
	bts r12,5
LB_1946:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_1941
	btr r12,4
	clc
	jmp LB_1942
LB_1941:
	bts r12,4
	stc
LB_1942:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_1939
	btr r12,3
	clc
	jmp LB_1940
LB_1939:
	bts r12,3
	stc
LB_1940:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1937
	btr r12,2
	clc
	jmp LB_1938
LB_1937:
	bts r12,2
	stc
LB_1938:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1935
	btr r12,1
	clc
	jmp LB_1936
LB_1935:
	bts r12,1
	stc
LB_1936:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1933
	btr r12,0
	clc
	jmp LB_1934
LB_1933:
	bts r12,0
	stc
LB_1934:
	add rsp,48
MTC_LB_1947:
	mov r15,0
	mov rdi,r10
	mov rsi,r11
	bt r12,4
	call eq
	jnz MTC_LB_1948
LB_1949:
	cmp r15,0
	jz LB_1950
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1949
LB_1950:
; _f38 %_1727 ⊢ %_1738 : %_1738
 ; {>  %_1728~{ 2' 3' }:{ _r64 _r64 } %_1727~{ 0' 1' }:{ _r64 _r64 } %_1732~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_1731~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } }
; _f38 { 0' 1' } ⊢ { 0' 1' }
; push_iv 
	sub rsp,24
	mov QWORD [rsp+8+8*0],r8
	mov QWORD [rsp+8+8*1],r9
	mov QWORD [rsp],r12
; _emt_mov_ptn_to_ptn:{| 110.. |},{ 0' 1' } ⊢ 0'
	mov r8,r13
	bt r12,0
	jc LB_1955
	btr r12,2
	jmp LB_1956
LB_1955:
	bts r12,2
LB_1956:
	mov rax,rbx
	mov rbx,[rax]
	mov rdi,0x0000_0002_0000_ffff
	mov QWORD [rax],rdi
	mov r13,rax
	btr r12,0
	mov r9,r8
	bt r12,2
	jc LB_1959
	btr r12,3
	jmp LB_1960
LB_1959:
	bts r12,3
LB_1960:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*0],rsi
	bt r12,3
	jc LB_1957
	btr QWORD [rdi],0
	jmp LB_1958
LB_1957:
	bts QWORD [rdi],0
LB_1958:
	mov r9,r14
	bt r12,1
	jc LB_1963
	btr r12,3
	jmp LB_1964
LB_1963:
	bts r12,3
LB_1964:
	mov rdi,r13
	mov rsi,r9
	mov QWORD [rdi+8*1+8*1],rsi
	bt r12,3
	jc LB_1961
	btr QWORD [rdi],1
	jmp LB_1962
LB_1961:
	bts QWORD [rdi],1
LB_1962:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ { 0' 1' }
	mov r8,r13
	bt r12,0
	jc LB_1965
	btr r12,2
	jmp LB_1966
LB_1965:
	bts r12,2
LB_1966:
; 2' ⊢ { 0' 1' }
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*0]
	mov r9,rax
	bt QWORD [rdi],0
	jc LB_1969
	btr r12,3
	clc
	jmp LB_1970
LB_1969:
	bts r12,3
	stc
LB_1970:
	mov r13,r9
	bt r12,3
	jc LB_1967
	btr r12,0
	jmp LB_1968
LB_1967:
	bts r12,0
LB_1968:
	mov rdi,r8
	mov rax,QWORD [rdi+8*1+8*1]
	mov r9,rax
	bt QWORD [rdi],1
	jc LB_1973
	btr r12,3
	clc
	jmp LB_1974
LB_1973:
	bts r12,3
	stc
LB_1974:
	mov r14,r9
	bt r12,3
	jc LB_1971
	btr r12,1
	jmp LB_1972
LB_1971:
	bts r12,1
LB_1972:
	mov rdi,r8
	mov [rdi],rbx
	mov rbx,rdi
; pop_iv
	mov rax,QWORD [rsp]
	mov r9,QWORD [rsp+8+8*1]
	bt QWORD rax,3
	jc LB_1953
	btr r12,3
	clc
	jmp LB_1954
LB_1953:
	bts r12,3
	stc
LB_1954:
	mov r8,QWORD [rsp+8+8*0]
	bt QWORD rax,2
	jc LB_1951
	btr r12,2
	clc
	jmp LB_1952
LB_1951:
	bts r12,2
	stc
LB_1952:
	add rsp,24
; ∎ {  }
 ; {>  %_1728~{ 2' 3' }:{ _r64 _r64 } %_1738~{ 0' 1' }:{ _r64 _r64 } %_1732~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_1731~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } }
; 	∎ {  }
	bt r12,2
	jc LB_1975
	mov rdi,r8
	call dlt
LB_1975:
	bt r12,3
	jc LB_1976
	mov rdi,r9
	call dlt
LB_1976:
	bt r12,0
	jc LB_1977
	mov rdi,r13
	call dlt
LB_1977:
	bt r12,1
	jc LB_1978
	mov rdi,r14
	call dlt
LB_1978:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_1948:
	mov r15,0
LB_1980:
	cmp r15,0
	jz LB_1981
	mov rdi,QWORD [gbg_vct-8+8*r15],
	call dlt_gbg
	sub r15,1
	jmp LB_1980
LB_1981:
; _f38 %_1737 ⊢ %_1739 : %_1739
 ; {>  %_1737~5':_stg %_1728~{ 2' 3' }:{ _r64 _r64 } %_1727~{ 0' 1' }:{ _r64 _r64 } %_1732~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_1731~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_1736~4':_stg }
; _f38 5' ⊢ 5'
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
	jc LB_1992
	btr r12,0
	jmp LB_1993
LB_1992:
	bts r12,0
LB_1993:
	call NS_E_38
; _emt_mov_ptn_to_ptn:{| 10.. |},0' ⊢ 5'
	mov r11,r13
	bt r12,0
	jc LB_1994
	btr r12,5
	jmp LB_1995
LB_1994:
	bts r12,5
LB_1995:
; pop_iv
	mov rax,QWORD [rsp]
	mov r10,QWORD [rsp+8+8*4]
	bt QWORD rax,4
	jc LB_1990
	btr r12,4
	clc
	jmp LB_1991
LB_1990:
	bts r12,4
	stc
LB_1991:
	mov r9,QWORD [rsp+8+8*3]
	bt QWORD rax,3
	jc LB_1988
	btr r12,3
	clc
	jmp LB_1989
LB_1988:
	bts r12,3
	stc
LB_1989:
	mov r8,QWORD [rsp+8+8*2]
	bt QWORD rax,2
	jc LB_1986
	btr r12,2
	clc
	jmp LB_1987
LB_1986:
	bts r12,2
	stc
LB_1987:
	mov r14,QWORD [rsp+8+8*1]
	bt QWORD rax,1
	jc LB_1984
	btr r12,1
	clc
	jmp LB_1985
LB_1984:
	bts r12,1
	stc
LB_1985:
	mov r13,QWORD [rsp+8+8*0]
	bt QWORD rax,0
	jc LB_1982
	btr r12,0
	clc
	jmp LB_1983
LB_1982:
	bts r12,0
	stc
LB_1983:
	add rsp,48
; ∎ {  }
 ; {>  %_1739~5':_stg %_1728~{ 2' 3' }:{ _r64 _r64 } %_1727~{ 0' 1' }:{ _r64 _r64 } %_1732~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_1731~{ { {  } {  } {  } {  } } { { {  } { {  } {  } } } } }:{ { { } { } { } { } } { { { } { { } { } } } } } %_1736~4':_stg }
; 	∎ {  }
	bt r12,5
	jc LB_1996
	mov rdi,r11
	call dlt
LB_1996:
	bt r12,2
	jc LB_1997
	mov rdi,r8
	call dlt
LB_1997:
	bt r12,3
	jc LB_1998
	mov rdi,r9
	call dlt
LB_1998:
	bt r12,0
	jc LB_1999
	mov rdi,r13
	call dlt
LB_1999:
	bt r12,1
	jc LB_2000
	mov rdi,r14
	call dlt
LB_2000:
	bt r12,4
	jc LB_2001
	mov rdi,r10
	call dlt
LB_2001:
; _emt_mov_ptn_to_ptn:{| 0.. |},{  } ⊢ {  }
	ret
MTC_LB_1979:
section .data
	CST_DYN_1740:
		dq 0x0000_0001_00_82_ffff
		dq 1
