
%define sys_signal 	48
%define SIGINT			2
%define sys_time	13
 
extern usleep
extern printf
 
section .text
	global _start
 
	_sig_handler:
		mov ebx, end_time
		mov eax, sys_time
		int 0x80
		mov eax, dword [start_time]
		mov ebx, dword [end_time]
		sub ebx, eax
		mov ax, 100
		div ebx
		push ebx
		push p_time
		call printf
		push 0x1
		mov eax, 1
		push eax
		int 0x80
		ret
 
	_start:
		mov ebx, start_time
		mov eax, sys_time
		int 0x80
		mov ecx, _sig_handler
		mov ebx, SIGINT
		mov eax, sys_signal
		int 0x80
		xor edi, edi
		.looper:
			push 500000
			call usleep
			push edi
			push p_cnt
			call printf
			inc edi
		jmp .looper
 
section .data
p_time	db "The program has run for %d seconds.",13,10,0
p_cnt		db "%d",13,10,0
 
section .bss
start_time	resd 1
end_time		resd 1
