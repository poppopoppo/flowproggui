section .text 
global _start 
square:                                
        mov     rax, rdi
        mov rcx,7378697629483820647
        imul    rcx
        mov     rax, rdx
        shr     rax, 63
        sar     rdx, 2
        add     rax, rdx
        ret
div10:
        mov rsi,0xcccc_cccc_cccc_cccd
        mov rax,rdi 
        mul rsi 
        mov rax,rdx 
        shr rax,3
        ret
_start: 
	mov rdi,14000
	call div10
	mov rdi,rax 
        mov rax,60 
        syscall 


