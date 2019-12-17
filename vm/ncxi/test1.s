global main 
main:
	mov rdi,0x00_11_22_33_44_55_66_77 
	mov QWORD [rsp],rdi 
	mov rax,~0 
	mov eax,DWORD [rsp+4]
	mov al,BYTE [rsp] 
	mov al,BYTE [rsp+1]
	mov al,BYTE [rsp+2]
	mov al,BYTE [rsp+3]
	movzx rax,BYTE [rsp+4]
	mov al,BYTE [rsp+5]
	mov ax,WORD [rsp+6]
	ret 

