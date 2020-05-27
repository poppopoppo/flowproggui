global main 
main:
  mov rax,123
	mov rax,rsp
	add rax,1 
	mov rax,QWORD [rax]
  ret
