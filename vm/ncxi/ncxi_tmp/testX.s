section .text
global _start
_start: mov eax, 4
        mov ebx, 1
        mov ecx, mesg
        mov edx, size
        int 0x80
exit:   mov eax, 1
        int 0x80
section .data
mesg    db      'KingKong',0xa
size    equ     $-mesg
