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
  regs_vct: resb 8*10
  tmp: resb 80
  tmp_pop: resb 8
  tmp_push: resb 8
  dyn_call_vct: resb 16
  str_ret: resb 1000
  out_vct: resb (8+8+8)*256
  prs_vct: resb (8+8) * 64
  set_ptn_vct: resb (8+8) * 16
  mtc_vct_0: resb (8+8) * 32
  mtc_vct_1: resb (8+8) * 32
  mtc_vct_2: resb (8+8) * 32
  mtc_vct_3: resb (8+8) * 32
  mtc_vct_4: resb (8+8) * 32
  mtc_vct_5: resb (8+8) * 32
  mtc_vct_6: resb (8+8) * 32
  mtc_vct_7: resb (8+8) * 32
  mtc_vct_8: resb (8+8) * 32
  mtc_vct_9: resb (8+8) * 32
  mtc_vct_10: resb (8+8) * 32
  mtc_vct_11: resb (8+8) * 32

section .data
  out_n: dq 0
  out_bs_p: dq 0
  out_tp_p: dq 0
  str_tkn: db "tkn: ",0
  str_err: db "err: ",0
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
  ln_l: db "[| ",0
  ln_r: db "|] ",0
  spc: db " ",0
  agl_fmt: db "°%d◂",0
  fmt_s8: db `\"%s\"`,0
  fmt_line: db `%s\n`,0
  fmt_err_line: db `err:%s\n`,0
  fmt_dbg: db `dbg:%s\n`,0
  fmt_err: db "err",0
  cst_stg_test: db `\194\187\194\187 Foo \226\136\128 Baa \194\167\194\182 \t \t \n`,0,0,0,0,0
  cst_stg_test0: db `\u263a`
  cst_stg_test1: db `\xe2\x98\xba`
  stg0: db `\194\187`
; dynamic entries
  etr0: db 0,0b1,0,0b1,0b10000000,0,0,0b1,0,0,0,0,0,0,0,0
; global constants
  unt: dq 0x0001_0000_0000_ffff
; global variables
  sgn_ctr: dq 0
  c_0:
    dq 0x000100020000fffd
    dq 0
    dq c_0_unt
  c_0_unt: dq 0x000200000000ffff
  c_1:
    dq 0x000100020000fffd
    dq 1
    dq c_1_unt
  c_1_unt: dq 0x000200000000ffff
section .text
global _start               ; _startを指名
_start:
  jmp main

_end:
  mov rax,1
  mov rbx,0
  int 0x80

mlc:
  mov rax,0x00010000
  add rax,rdi
  shl rax,32
  add rax,0xffff
  push rax
  mov rax,0
  add rdi,1
  shl rdi,3
  call malloc
  pop rdi
  mov [rax],rdi
  ret

dec_r:
  bt rdi,0
  jnc dec_r_blk
  mov rax,0x00ff_ffff_ffff_fffe
  and rdi,rax
dec_r_blk:
  push rdi
  ; decrement ref-count
  mov rax,[rdi]
  mov rsi,0x0001000000000000
  sub rax,rsi
  mov rsi,rax
  shr rsi,48
  mov [rdi],rax
  cmp rsi,0
  jne dec_r_end
  bt rax,16
  jc dec_r_lp_end
  mov rdx,rax
  mov rsi,rax
  lea rax,[rdi+8*1]
  shl rdx,16
  shr rdx,48
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
  bt rdi,0
  jnc inc_r_blk
  mov rsi,0x00ff_ffff_ffff_fffe
  and rdi,rsi
inc_r_blk:
  mov rsi,0x0001_0000_0000_0000
  add QWORD [rdi],rsi
  ret

; rdi ~ src cf~tag
; rax ~ dst
dcp:
  push rdi
  mov rdi,0
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
  jc exc_c
  btr QWORD [rdi],rsi
  jmp exc_nc
exc_c:
  bts QWORD [rdi],rsi
exc_nc:
  mov QWORD rax,[rdi+8*1+8*rsi+8*1]
  mov QWORD [rdi+8*1+8*rsi],rdx
  ret

pnt_v: ; rdi=value ⊢ rax=ret_stg
  push rdi
  mov rsi,str_ret
  call pnt
  sub rax,str_ret
  push rax
  mov rdi,rax
  call mlc_s8
  pop rdi
  mov rdx,rdi
  shr rdi,3
  xor rsi,rsi
pnt_v_lp:
  mov r8,QWORD [str_ret+8*rsi]
  mov QWORD [rax+8*1+8*rsi],r8
  cmp rsi,rdi
  jz pnt_v_tl
  add rsi,1
  jmp pnt_v_lp
pnt_v_tl:
  and rdx,0b0111
  mov rcx,0b1000
  sub rcx,rdx
  shl rcx,3
  mov r8,~0
  shr r8,cl
  and QWORD [rax+8*1+8*rsi],r8
  pop rdi
  ret

pp_v: ; rdi=value ⊢ rax=ret_stg
  push rdi
  mov rsi,str_ret
  call pp
  ;push rax
  ;mov rdi,fmt_dbg
  ;mov rsi,str_ret
  ;mov rax,0
  ;call printf
  ;pop rax
  sub rax,str_ret
  push rax
  mov rdi,rax
  call mlc_s8
  pop rdi
  mov rdx,rdi
  shr rdi,3
  xor rsi,rsi
pp_v_lp:
  mov r8,QWORD [str_ret+8*rsi]
  mov QWORD [rax+8*1+8*rsi],r8
  cmp rsi,rdi
  jz pp_v_tl
  add rsi,1
  jmp pp_v_lp
pp_v_tl:
  mov r8,0
  and rdx,0b0111
  cmp rdx,0
  jz pp_v_tl_0
  mov rcx,0b1000
  sub rcx,rdx
  shl rcx,3
  mov r8,~0
  shr r8,cl
pp_v_tl_0:
  and QWORD [rax+8*1+8*rsi],r8
  push rax
  mov rdi,fmt_dbg
  lea rsi,[rax+8*1]
  mov rax,0
  call printf
  pop rax
  pop rdi
  ret

mlc_s8: ; rdi=size of bytes
  mov rsi,rdi
  and rsi,~0b0111
  add rsi,16
  push rdi
  mov rdi,rsi
  xor rax,rax
  call malloc
  pop rdi
  mov rsi,rdi
  mov rdx,0b1000
  and rsi,0b0111
  sub rdx,rsi
  and rdi,~0b0111
  add rdi,0b1000
  shl rdi,29
  add rdx,rdi
  bts rdx,16
  mov rdi,0x0001_0000_0000_0000
  add rdx,rdi
  mov QWORD [rax],rdx
  ret

pp: ; rdi=tkn rsi=dst
  jc pp_end
  jmp pp_r_p
pp_end:
  push rsi
  mov rdx,rdi
  mov rdi,rsi
  mov rsi,fmt64
  mov rax,0
  call sprintf
  pop rsi
  add rax,rsi
  ret
pp_r_p:
  bt rdi,0
  jnc pp_r_p_blk
  mov rdx,rdi
  shr rdx,56
  push rdi
  push rsi
  mov rdi,rsi
  mov rsi,agl_fmt
  xor rax,rax
  call sprintf
  pop rsi
  pop rdi
  add rsi,rax
  mov r10,0x00ff_ffff_ffff_fffe
  and rdi,r10
pp_r_p_blk:
  mov r10,[rdi]
  shr r10,48
  push rdi
  push rsi
  mov rdi,rsi
  mov rsi,fmt_ref
  mov rdx,r10
  xor rax,rax
  call sprintf
  pop rsi
  pop rdi
  add rsi,rax
pp_r_p_n_agl:
  mov r10,[rdi]
  bt r10,16
  jc pp_opq
  bt r10,17
  jc pp_ln
  mov r9,r10
  shr r9,32
  and r9,0xffff
  add rdi,8
pp_r_p_lp:
  cmp r9,0
  je pp_r_p_end
  sub r9,1
  rcr r10,1
  jc pp_r_p_lp_nxt
  push r9
  push r10
  push rdi
  mov rdi,[rdi]
  call pp_r_p
  pop rdi
  pop r10
  pop r9
  mov rsi,rax
  add rdi,8
  jmp pp_r_p_lp
pp_r_p_lp_nxt:
  push rdi
  push rsi
  push r9
  push r10
  mov rdx,[rdi]
  mov rdi,rsi
  mov rsi,fmt64_spc
  mov rax,0
  call sprintf
  pop r10
  pop r9
  pop rsi
  pop rdi
  add rsi,rax
  add rdi,8
  jmp pp_r_p_lp
pp_r_p_end:
  push rsi
  mov rdi,rsi
  mov rsi,blk_r
  mov rax,0
  call sprintf
  pop rsi
  add rax,rsi
  ret
pp_opq:
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
pp_ln:
  push rdi
  push rsi
  mov rdi,rsi
  mov rsi,ln_l
  xor rax,rax
  call sprintf
  pop rsi
  add rsi,rax
  pop rdi
  bt QWORD [rdi],0
  mov rdi,QWORD [rdi+8]
  call pp
  push rax
  mov rdi,rax
  mov rsi,ln_r
  mov rax,0
  call sprintf
  pop rsi
  add rax,rsi
  ret

rpc_ref: ; rdi=ref ⊢ rax=dst-ref
  mov rsi,[rdi]
  shr rsi,32
  and rsi,0xffff
  push rdi
  push rsi
  mov rdi,rsi
  call mlc
  pop rsi
  pop rdi
  bt QWORD [rdi],16
  jc rpc_ref_s8
  mov rdx,[rdi]
  mov rcx,~0xffff_0000_0000_0000
  and rdx,rcx
  mov rcx,0x0001_0000_0000_0000
  add rdx,rcx
  mov QWORD [rax],rdx
  mov rdx,[rdi]
rpc_ref_lp:
  cmp rsi,0
  jz rpc_ref_end
  mov rcx,[rdi+8*rsi]
  mov [rax+8*rsi],rcx
  rcr rdx,1
  sub rsi,1
  jc rpc_ref_lp
  mov r11,[rcx]
  mov r10,0x0001_0000_0000_0000
  add r11,r10
  mov [rcx],r11
  jmp rpc_ref_lp
rpc_ref_end:
  ret
rpc_ref_s8:
  mov rdx,[rdi]
  mov rcx,~0xffff_0000_0000_0000
  and rdx,rcx
  mov rcx,0x0001_0000_0000_0000
  add rdx,rcx
  mov QWORD [rax],rdx
rpc_ref_lp_s8:
  cmp rsi,0
  jz rpc_ref_end
  mov rcx,[rdi+8*rsi]
  mov [rax+8*rsi],rcx
  sub rsi,1
  jmp rpc_ref_lp_s8

mlc_ln:
  mov rdi,1
  call mlc
  mov rdi,[rax]
  bts rdi,17
  mov [rax],rdi
  ret

pnt:
  mov rdx,0
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
  mov rdx,rsi
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
  push rdx
  mov rdi,rsi
  mov rsi,fmt_ref
  mov rdx,r10
  mov rax,0
  ;mov rdi,fmt_ref
  ;mov rsi,r10
  ;call printf
  call sprintf
  pop rdx
  add rdx,rax
  pop r10
  pop rdx
  pop rsi
  pop rdi
  ;lea rsi,[rsi+1*rax]
  add rsi,rax
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
eq: ; rdi=rsi rdx= c0 rcx = c1
  bt rdx,0
  jnc eq_nc_b
  bt rcx,0
  jnc eq_c_nc
  cmp rdi,rsi
  mov rax,0
  setc al
  ret
eq_c_nc:
  mov rax,0
  ret
eq_nc_b:
  bt rcx,0
  jnc eq_nc_nc
  mov rax,0
  ret
eq_nc_nc: ; rdi=rsi ⊢ zf
  mov r11,[rdi]
  bt r11,16
  jc eq_opq_nc
  mov r10,[rsi]
  bt r10,16
  jc eq_blk_opq
eq_blk_blk:
  mov r9,r11
  mov r10,0x0000ffff00000000
  and r9,r10
  shr r9,32
  add rdi,8
  add rsi,8
eq_blk_blk_lp:
  cmp r9,0
  jz eq_opq_opq_lp_end_t
  sub r9,1
  mov rdx,0
  mov rcx,0
  rcr r11,1
  rcl rdx,1
  rcr r10,1
  rcl rcx,1
  push r10
  push r11
  push r9
  push rdi
  push rsi
  mov rdi,[rdi]
  mov rsi,[rsi]
  call eq
  pop rsi
  pop rdi
  pop r9
  pop r11
  pop r10
  bt rax,0
  jnc eq_blk_blk_lp_end_f
  add rdi,8
  add rsi,8
  jmp eq_blk_blk_lp
eq_blk_blk_lp_end_t:
  mov rax,1
  ret
eq_blk_blk_lp_end_f:
  mov rax,0
  ret
eq_blk_opq:
  mov rax,0
  ret
eq_opq_nc:
  mov rdx,[rsi]
  bt rdx,16
  jc eq_opq_opq
eq_opq_opq:
  mov rcx,rdx
  mov r11,0x0000ffff00000000
  and rcx,r11
  shr rcx,32
  add rdi,8
  add rsi,8
eq_opq_opq_lp:
  cmp rcx,0
  jz eq_opq_opq_lp_end_t
  sub rcx,1
  mov rax,[rdi]
  mov rdx,[rsi]
  cmp rax,rdx
  jnz eq_opq_opq_lp_end_f
  add rdi,8
  add rsi,8
  jmp eq_opq_opq_lp
eq_opq_opq_lp_end_t:
  mov rax,1
  ret
eq_opq_opq_lp_end_f:
  mov rax,0
  ret
neq:
  ret

emt: ; rdi s8
  mov rax,0
  add rdi,8
  call printf
  ret
err:
  mov rdi,rbx
  mov rsi,str_ret
  call pnt
  mov rdi,fmt_err_line
  mov rsi,str_ret
  mov rax,0
  call printf
  ;mov rdi,fmt_nl
  ;mov rax,0
  ;call printf
  ;mov rdi,fmt_line
  ;mov rsi,cst_stg_test1
  mov rax,1
  mov rbx,0
  int 0x80
exec_out:
exec_out_lp:
  mov rbx,QWORD [out_n]
  cmp rbx,0
  jz exec_out_end
  sub rbx,1
  mov QWORD [out_n],rbx
  mov r14,QWORD [out_bs_p]
  mov rax,r14
  shl rax,3
  mov rdx,QWORD [out_vct+rax+2*rax]
  mov rdi,QWORD [out_vct+rax+2*rax+8*1]
  mov rsi,QWORD [out_vct+rax+2*rax+8*2]
  add r14,1
  and r14,0xff
  mov QWORD [out_bs_p],r14
  bt rdx,0
  call rsi
  jmp exec_out_lp
exec_out_end:
  ret
