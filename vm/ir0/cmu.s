; .intel_syntax noprefix
; r9 = tmp0  r10 = tmp1 r11 = tmp2
; [r9] = 32,32 ref-count,len
; [r9+1] = tag_bit list ; right to left
; r15 call stack depth
; r12 tbv
; r13 heap
; r14 tmp-tbv
bits 64
extern free
extern printf
extern malloc
extern sprintf
section .bss
  st_vct: resb 400
  st_vct_tmp: resb 400
  tmp: resb 80
  str_ret: resb 1000
section .data
  str_tkn: db "tkn: ",0
  str_dbg: db "DBG:%d",10,0
  fmt64: db "0x%llx",0
  fmtr64: db "0xr","0x%llx",0
  str_r64: db "0x%llx FEFEF",0
  fmt64_spc: db "0x%llx ",0
  fmt32: db "%d",0
  fmt_nl: db 10,0
  fmt_ref: db "(%d)*{| ",0
;  fmt: db "%d",10,0
  blk_l: db "{| ",0
  blk_r: db "|} ",0
  spc: db " ",0
  fmt_s8: db `\"%s\" `, 0

section .text
global _start               ; _startを指名
_start:
  jmp main
hw:
  push rax
  push rdi
  push rsi
  push rdx
  push rcx
  push r8
  push r9
  push r10
  push r11
  mov rsi,-1
  mov rdi,str_dbg
  mov rax,0
  call printf
  pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
  ret
dbg:
  push rax
  push rdi
  push rsi
  push rdx
  push rcx
  push r8
  push r9
  push r10
  push r11
  mov rsi,rdi
  mov rdi,str_dbg
  mov rax,0
  call printf
  pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
  ret
pnt_str_ret:
  push rax
  push rdi
  push rsi
  push rdx
  push rcx
  push r8
  push r9
  push r10
  push r11
  mov rdi,str_tkn
  mov rax,0
  call printf
  mov rdi,str_ret
  mov rax,0
  call printf
  mov rdi,fmt_nl
  mov rax,0
  call printf
  pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax
  ret
_end:
  mov rax,1
  mov rbx,0
  int 0x80

mlc:
  ; add heap counter
  add r13,rdi
  add r13,1
  ;
  mov rax,0x00010000
  ;xor rax,rax
  ;add rax,1
  ;shl rax,16
  add rax,rdi
  shl rax,32
  add rax,0xffff
  add rdi,1
  ;imul rdi,8
  shl rdi,3
  push rax
  mov rax,0
  call malloc
  pop rdi
  mov [rax],rdi
  ret

dec_r:
  push rdi
  ; decrement ref-count
  mov rax,[rdi]
  mov rsi,0x0001000000000000
  sub rax,rsi
  mov rsi,rax
  shr rsi,48
  ;sub rsi,1
  ;ror QWORD rax,48
  ;sub QWORD rax,1
  ;rol QWORD rax,48
  mov [rdi],rax
  cmp rsi,0
  jne dec_r_end
  bt rax,16
  jc dec_r_lp_end
  ; free blk
  ; mov to temporary register
  mov rdx,rax
  mov rsi,rax
  ; prepared for loop
  lea rax,[rdi+8*1]
  shl rdx,16
  shr rdx,48
  ;pushf
  sub r13,r10
  sub r13,1
  ;popf
dec_r_lp:
  cmp rdx,0
  je dec_r_lp_end
  sub rdx,1
  rcr rsi,1
  jc dec_r_lp_nxt
  push rsi
  push rdx
  push rax
  mov rdi,[rax]
  call dec_r
  pop rax
  pop rdx
  pop rsi
dec_r_lp_nxt:
  lea rax,[rax+8*1]
  jmp dec_r_lp
dec_r_lp_end:
 pop rdi
 mov rax,0
 call free
 ret
dec_r_end:
  pop rdi
  ret

inc_r:
  ; increment ref-count
  push rax
  push rsi
  mov rax,[rdi]
  ;ror QWORD rax,48
  mov rsi,0x0001000000000000
  add rax,rsi
  ;rol QWORD rax,48
  mov [rdi],rax
  pop rsi
  pop rax
  ret

; rdi ~ src cf~tag
; rax ~ dst
dcp:
  push rdi
  mov rdi,0
  call dbg
  pop rdi
  jc dcp_r64
dcp_blk:
  mov r9,[rdi]
  shl r9,16
  shr r9,48
  push rdi
  push r9
  mov rdi,r9
  call mlc
  pop r9
  pop rdi
  mov r11,[rdi]
  mov r10,r9
  shl r11,48
  shr r11,48
  mov rdx,[rax]
  shr rdx,16
  shl rdx,16
  add rdx,r11
  mov [rax],rdx
  mov rsi,0
dcp_blk_lp:
  push rdi
  mov rdi,2
  call dbg
  pop rdi
  cmp rsi,r10
  je dcp_end
  rcr r11,1
  jc dcp_blk_lp_nxt
  push r11
  push r10
  push r9
  push rax
  push rsi
  push rdi
  mov rdi,[r9+8*rsi+8*1]
  call dcp_blk
  mov r9,rax
  pop rax
  mov [rax+8*rsi+8*1],r9
  pop rdi
  pop rsi
  pop rax
  pop r9
  pop r10
  pop r11
dcp_blk_lp_nxt:
  push rdi
  mov rdi,4
  call dbg
  pop rdi
  mov rdx,[rdi+8*rsi+8*1]
  mov [rax+8*rsi+8*1],rdx
  add rsi,1
  jmp dcp_blk_lp
dcp_end:
  clc
  ret
dcp_r64:
  mov rax,rdi
  stc
  ret
; rdi ~ src-blk rsi~idx rdx~dst-dta cf~tag-of-dta
; rax ~ src.(idx)
exc:
  jc exc_cf
  mov rax,[rdi]
  btr rax,rsi
  mov [rdi],rax
  mov QWORD [rdi+8*rsi+8*1],rdx
  mov QWORD rax,[rdi+8*rsi+8*1]
  ret
exc_cf:
  mov rax,[rdi]
  bts rax,rsi
  mov [rdi],rax
  mov QWORD rax,[rdi+8*rsi+8*1]
  mov QWORD [rdi+8*rsi+8*1],rdx
  ret
; rdi ~ src-dta rsi~dst-str
pnt_tkn:
  pushf
  push rdi
  mov rsi,str_ret
  call pnt
  call pnt_str_ret
  pop rdi
  popf
  ret
pnt:
  jc pnt_end
  jmp pnt_r_p
pnt_end:
  push rsi
  mov rdx,rdi
  mov rdi,rsi
  mov rsi,fmt64
  mov rax,0
  call sprintf
  pop rsi
  ;add rsi,rax
  ;mov rax,rsi
  add rax,rsi
  ret
pnt_r_p:
  mov r10,[rdi]
  bt r10,16
  jc pnt_opq
  shr r10,48
  push rdi
  push rsi
  push rdx
  push r10
  mov rdi,rsi
  mov rsi,fmt_ref
  mov rdx,r10
  mov rax,0
  ;mov rdi,fmt_ref
  ;mov rsi,r10
  ;call printf
  call sprintf
  pop r10
  pop rdx
  pop rsi
  pop rdi
  ;lea rsi,[rsi+1*rax]
  add rsi,rax
  call pnt_str_ret
  mov r9,[rdi]
  mov r11,r9
  shl r9,16
  shr r9,48
  ; prepared for loop
  ;lea rdi,[rdi+8*1]
  add rdi,8
pnt_r_p_lp:
  cmp r9,0
  je pnt_r_p_end
  sub r9,1
  rcr r11,1
  jc pnt_r_p_lp_nxt
  push r9
  push r10
  push r11
  push rdi
  push rsi
  mov rdi,[rdi]
  call pnt_r_p
  pop rsi
  pop rdi
  pop r11
  pop r10
  pop r9
  mov rsi,rax
  ;lea rdi,[rdi+8*1]
  add rdi,8
  jmp pnt_r_p_lp
pnt_r_p_lp_nxt:
  push rdi
  push rsi
  push r9
  push r10
  push r11
  mov rdx,[rdi]
  mov rdi,rsi
  mov rsi,fmt64_spc
  mov rax,0
  ;mov rsi,[rdi]
  ;mov rdi,fmt64_spc
  call sprintf
  ;call printf
  pop r11
  pop r10
  pop r9
  pop rsi
  pop rdi
  lea rsi,[rsi+1*rax]
  ;lea rdi,[rdi+8*1]
  add rdi,8
  jmp pnt_r_p_lp
pnt_r_p_end:
  push rsi
  ;push rax
  mov rdi,rsi
  mov rsi,blk_r
  mov rax,0
  call sprintf
  ;mov rdx,rax
  ;pop rax
  pop rsi
  ;lea rsi,[rsi+1*rdx]
  add rax,rsi
  ;mov rax,rsi
  ret
pnt_opq:
  push rsi
  mov rdx,rdi
  add rdx,8
  mov rdi,rsi
  mov rsi,fmt_s8
  mov rax,0
  call sprintf
  pop rsi
  add rax,rsi
  ret
eq_nc_nc: ; rdi=rsi ⊢ zf
  cmp rdi,rsi
  ret
eq_c_c:
  push rax
  push rdx
  mov rax,[rdi]
  bt rax,16
  jc eq_s8_c
  mov rdx,[rsi]
  bt rdx,16
  jc neq
  push r9
  push r10
  mov r9,rax
  mov r10,rdx
eq_s8_c:
neq:
  ret
