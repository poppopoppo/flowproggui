; .intel_syntax noprefix
; r9 = tmp0  r10 = tmp1 r11 = tmp2
; [r9] = 32,32 ref-count,len
; [r9+1] = tag_bit list ; right to left
extern free
extern printf
extern malloc
extern sprintf
section .bss
  str_ret: resb 100
section .data
  str_tkn: db "tkn: ",0
  str_hw: db "Hello World!!",10,0
  str_dbg: db "DBG:%d",10,0
  fmt64: db "0x%llx",0
  str_r64: db "0x%llx FEFEF",0
  fmt64_spc: db "0x%llx ",0
  fmt32: db "%d",0
  fmt_nl: db 10,0
  fmt_ref: db "(%d)*{| ",0
;  fmt: db "%d",10,0
  blk_l: db "{| ",0
  blk_r: db "|} ",0
  spc: db " ",0

section .text
global _start               ; _startを指名
_start:
  jmp main
dbg:
  push rax
  push rdi
  push rsi
  push rdx
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
  pop rdx
  pop rsi
  pop rdi
  pop rax
  ret
_test:
  call pnt_str_ret
  mov rdi,0xff
  stc
  mov rsi,str_ret
  push rdi
  call pnt
  pop rdi
  mov rdi,str_ret
  mov rax,0
  call printf
  mov rdi,fmt_nl
  mov rax,0
  call printf
  mov rdi,5
  call mlc
  mov rdi,rax
  mov QWORD [rdi+8*1],0xf4
  push rdi
  mov rsi,str_ret
  clc
  push rdi
  call pnt
  pop rdi
  pop rdi
  call pnt_str_ret
  call inc_r_p
  push rdi
  mov rsi,str_ret
  clc
  push rdi
  call pnt
  pop rdi
  pop rdi
  call pnt_str_ret
  call dec_r_p
  push rdi
  mov rsi,str_ret
  clc
  push rdi
  call pnt
  pop rdi
  pop rdi
  call pnt_str_ret
  mov rsi,2
  mov rdx,0xffa0
  stc
  call exc
  push rdi
  mov rsi,str_ret
  clc
  push rdi
  call pnt
  pop rdi
  pop rdi
  call pnt_str_ret
  push rdi
  call dcp
  mov rdi,rax
  push rax
  mov rsi,str_ret
  clc
  push rdi
  call pnt
  pop rdi
  pop rdi
  pop rdx
  mov rsi,3
  clc
  call exc
  mov rsi,str_ret
  clc
  push rdi
  call pnt
  pop rdi
  pop rdi
  call pnt_str_ret
  jmp _end
_loop:
  mov rdi, fmt32
  mov rsi, r12
  call   printf               ; printfをコール
  mov rdi,fmt_nl
  call printf
  add    r12,1               ; rdxに１加算
  cmp r12,100
  jne _loop
_end:
  mov rax,1
  mov rbx,0
  int 0x80

mlc:
  push rdi
  add rdi,1
  imul rdi,8
  call malloc
  pop rdi
  xor r9,r9
  add r9,1
  shl r9,16
  add r9,rdi
  shl r9,16
  shl r9,16
  add r9,0xffff
  mov [rax],r9
  ret
chk_t0_inc:
  push r9
  jc chk_t0_inc_end
  jmp inc_r_p
chk_t0_inc_end:
  pop r9
  ret
; rdi~src cf~tag_bit
chk_inc:
  jc chk_inc_end
  jmp inc_r_p
chk_inc_end:
  ret
inc_r_p:
  ; increment ref-count
  push rdi
  mov r9,[rdi]
  ror QWORD r9,48
  add QWORD r9,1
  rol QWORD r9,48
  mov [rdi],r9
  ; mov to temporary register
  mov r10,r9
  mov r11,r9
  ; prepared for loop
  lea r9,[rdi+8*1]
  shl r10,16
  shr r10,48
inc_r_p_lp:
  cmp r10,0
  je inc_r_p_end
  sub r10,1
  rcr r11,1
  jc inc_r_p_lp_nxt
  push r9
  push r10
  push r11
  mov rdi,[r9]
  call inc_r_p
  pop r11
  pop r10
  pop r9
inc_r_p_lp_nxt:
  lea r9,[r9+8*1]
  jmp inc_r_p_lp
inc_r_p_end:
  pop rdi
  mov rax,rdi
  ret
set_cf:
  rcl r9,1
  mov rax,r9
  rcr r9,1
  ret
cf_call:
  jnc cf_call_end
  call rdi
cf_call_end:
  ret
inc_r_p_n:
  ; increment ref-count
  push rdi
  mov r9,[rdi]
  ror QWORD r9,48
  add QWORD r9,rsi
  rol QWORD r9,48
  mov [rdi],r9
  ; mov to temporary register
  mov r10,r9
  mov r11,r9
  ; prepared for loop
  lea r9,[rdi+8*1]
  shl r10,16
  shr r10,48
inc_r_p_n_lp:
  cmp r10,0
  je inc_r_p_n_end
  sub r10,1
  rcr r11,1
  jc inc_r_p_n_lp_nxt
  push r9
  push r10
  push r11
  mov rdi,[r9]
  call inc_r_p_n
  pop r11
  pop r10
  pop r9
inc_r_p_n_lp_nxt:
  lea r9,[r9+8*1]
  jmp inc_r_p_n_lp
inc_r_p_n_end:
  pop rdi
  mov rax,rdi
  ret


chk_t0_dec:
  push r9
  jc chk_t0_dec_end
  jmp dec_r_p
chk_t0_dec_end:
  pop r9
  mov r10,[r9]
  shr r10,32
  cmp r10,0
  jne chk_t0_dec_end_lv
  push rdi
  mov rdi,r9
  call free
  pop rdi
chk_t0_dec_end_lv:
  ret

dec_r:
  push rdi
  ; decrement ref-count
  mov r9,[rdi]
  mov r11,r9
  shr r11,48
  ror QWORD r9,48
  sub QWORD r9,1
  rol QWORD r9,48
  mov [rdi],r9
  cmp r11,0
  jne dec_r_end
  ; mov to temporary register
  mov r10,r9
  mov r11,r9
  ; prepared for loop
  lea r9,[rdi+8*1]
  shl r10,16
  shr r10,48
dec_r_lp:
  cmp r10,0
  je dec_r_lp_end
  sub r10,1
  rcr r11,1
  jc dec_r_lp_nxt
  push r11
  push r10
  push r9
  mov rdi,[r9]
  call dec_r
  pop r9
  pop r10
  pop r11
dec_r_lp_nxt:
  lea r9,[r9+8*1]
  jmp dec_r_lp
dec_r_lp_end:
 pop rdi
 call free
 ret
dec_r_end:
  pop rdi
  ret

inc_r:
  ; increment ref-count
  mov r9,[rdi]
  ror QWORD r9,48
  add QWORD r9,1
  rol QWORD r9,48
  mov [rdi],r9
  ret

dec_r_p:
  push rdi
  ; decrement ref-count
  mov r9,[rdi]
  ror QWORD r9,48
  sub QWORD r9,1
  rol QWORD r9,48
  mov [rdi],r9
  ; mov to temporary register
  mov r10,r9
  mov r11,r9
  ; prepared for loop
  lea r9,[rdi+8*1]
  shl r10,16
  shr r10,48
dec_r_p_lp:
  cmp r10,0
  je dec_r_p_end
  sub r10,1
  rcr r11,1
  jc dec_r_p_lp_nxt
  push r11
  push r10
  push r9
  mov rdi,[r9]
  call dec_r_p
  pop r9
  pop r10
  pop r11
dec_r_p_lp_nxt:
  lea r9,[r9+8*1]
  jmp dec_r_p_lp
dec_r_p_end:
  pop rdi
  mov r9,[rdi]
  shr r9,48
  cmp r9,0
  jne dec_r_p_end_lv
  call free
dec_r_p_end_lv:
  mov rax,rdi
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
  mov r9,[rdi]
  btr r9,rsi
  mov [rdi],r9
  lea r10,[rdi+8*rsi+8*1]
  mov rax,[r10]
  mov [r10],rdx
  mov [rdi+8*rsi+8*1],rdx
  ret
exc_cf:
  mov r9,[rdi]
  bts r9,rsi
  mov [rdi],r9
  lea r10,[rdi+8*rsi+8*1]
  mov rax,[r10]
  mov [r10],rdx
  mov [rdi+8*rsi+8*1],rdx
  ret
; rdi ~ src-dta rsi~dst-str
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
  lea rsi,[rsi+1*rax]
  mov rax,rsi
  ret
pnt_r_p:
  push rdi
  mov rdi,9
  call dbg
  pop rdi
  mov r10,[rdi]
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
  lea rsi,[rsi+1*rax]
  call pnt_str_ret
  mov r9,[rdi]
  mov r11,r9
  shl r9,16
  shr r9,48
  ; prepared for loop
  lea rdi,[rdi+8*1]
pnt_r_p_lp:
  push rdi
  mov rdi,11
  call dbg
  pop rdi
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
  lea rdi,[rdi+8*1]
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
  lea rdi,[rdi+8*1]
  jmp pnt_r_p_lp
pnt_r_p_end:
  push rsi
  push rax
  mov rdi,rsi
  mov rsi,blk_r
  mov rax,0
  call sprintf
  mov rdx,rax
  pop rax
  pop rsi
  lea rsi,[rsi+1*rdx]
  mov rax,rsi
  ret
