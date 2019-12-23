; .intel_syntax noprefix
; r9 = tmp0  r10 = tmp1 r11 = tmp2
; [r9] = 32,32 ref-count,len
; [r9+1] = tag_bit list ; right to left
; r15 gbg_n
; r12 tbv
; r13 heap
; r14 tmp-tbv
; rbx SSS top
bits 64

%define NULL ~0
%define SFLS_MAX 16000
%define SFLS_NULL 0xffff_ffff_ffff_0000
%define S8_NULL 0xffff_ffff_ffff_0001
%define EMT_MAX 20000
extern exit
extern free
extern printf
extern malloc
extern sprintf
extern sscanf
extern strtol
extern strtoul
extern isspace
extern strlen
section .bss
  args: resq 1
  SFLS_HD: resb 8*8
  SFLS_TOP: resb 8*1
  SFLS_BTM: resb 8*1
  ;SFLS_VCT1: resb 8*2*SFLS_MAX
  ;SFLS_VCT2: resb 8*4*SFLS_MAX
  SFLS_VCT: resb 8*8*SFLS_MAX
  ;SFLS_VCT4: resb 8*16*SFLS_MAX
  ir_s8_len_vct: resb 8*32
  ir_s8_vct: resb 8*32
  st_vct: resb 400
  ;st_vct_tmp: resb 400
  regs_vct: resb 8*10
  free_vct: resb 8*16
  tmp: resb 80
  tmp_pop: resb 8
  tmp_push: resb 8
  r_n_tmp: resq 1 
  r_r_tmp: resq 1 
  dyn_call_vct: resb 16
  str_ret: resb 256
  out_vct: resb (8+8+8)*32
  ;prs_vct: resb (8+8) * 64
  ;set_ptn_vct: resb (8+8) * 16
  ;mtc_vct_0: resb (8+8) * 32
  ;mtc_vct_1: resb (8+8) * 32
  ;mtc_vct_2: resb (8+8) * 32
  ;mtc_vct_3: resb (8+8) * 32
  ;mtc_vct_4: resb (8+8) * 32
  ;mtc_vct_5: resb (8+8) * 32
  ;mtc_vct_6: resb (8+8) * 32
  ;mtc_vct_7: resb (8+8) * 32
  ;mtc_vct_8: resb (8+8) * 32
  ;mtc_vct_9: resb (8+8) * 32
  ;mtc_vct_10: resb (8+8) * 32
  ;mtc_vct_11: resb (8+8) * 32
  fmt_s_r0: resb 256
  ;fmt_d_r0: resb 4
  in0: resq 1
  gbg_vct: resq 64
  stat: resb 144
  struc STAT
    .st_dev         resq 1
    .st_ino         resq 1
    .st_mode        resd 1
    .st_nlink       resd 1
    .st_uid         resd 1
    .st_gid         resd 1
    .st_rdev        resq 1
    .pad1           resq 1
    .st_size        resq 1
    .st_blksize     resd 1
    .pad2 resd 1
    .st_blocks      resq 1
    .st_atime       resq 1
    .st_atime_nsec  resq 1
    .st_mtime       resq 1
    .st_mtime_nsec  resq 1
    .st_ctime       resq 1
    .st_ctime_nsec  resq 1
    .__unused4  resd 1
    .__unused5  resd 1
  endstruc

section .data
  err_n: dq 0
  out_n: dq 0
  out_bs_p: dq 0
  out_tp_p: dq 0
  str_tkn: db "tkn: ",0
  str_err: db "err: ",0
  str_dbg: db "DBG:%d",10,0
  fmt64: db "0x%llx",0
  fmtr64: db "0xr","0x%llx",0
  str_r64: db "0x%llx FEFEF",0
  fmt_emt_q: db "_emt_q:%s",10,0
  fmt_emt: db "_emt:",0
  fmt_nl: db 10,0
  fmt64_spc: db "0x%llx ",0
  fmt_d: db "%d",0
  fmt_x: db "%x",0
  fmt_x_r0: dq 0
  fmt_o: db "%o",0
  fmt_o_r0: dq 0
  fmt_c: db "%c",0
  fmt_c_r0: dq 0
  fmt_s: db "%s",0
  fmt_ref: db "(%llx)*",0
  vct_l: db "|{",0
  vct_r: db "}|",0
;  fmt: db "%d",10,0
  blk_l: db "{ ",0
  blk_r: db "} ",0
  ln_l: db "[ ",0
  ln_r: db " ] ",0
  arr_l: db "{| ",0
  arr_r: db "|} ",0
  arr_null: db " _ ",0
  spc: db " ",0
  agl_fmt: db "°%d◂",0
  fmt_s8: db `\"%s\"`,0
  fmt_line: db `%s\n`,0
  fmt_err_line: db `err:%d\n`,0
  fmt_dbg: db `dbg:%s\n`,0
  fmt_err: db "err",0
  ;cst_stg_test: db `\194\187\194\187 Foo \226\136\128 Baa \194\167\194\182 \t \t \n`,0,0,0,0,0
  ;cst_stg_test0: db `\u263a`
  ;cst_stg_test1: db `\xe2\x98\xba`
  ;stg0: db `\194\187`
  ;s8_0: db "43444",0
  ;test_fn: db "OpADL.mdls",0

  rsp_tmp: dq 0
  gbg_ptr: dq gbg_vct
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
  ;mov rax,1
  ;mov rbx,0
  ;int 0x80
  mov rdi,0
  call exit
mlc:
  push rdx
  push rcx
  push r8
  push r9
  push r10
  push r11
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
  pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  ret

SFLS_init:
  mov QWORD [SFLS_TOP],SFLS_VCT
  mov QWORD rbx,SFLS_VCT
  mov rdi,0
  mov rsi,SFLS_VCT
SFLS_lp:
  cmp rdi,SFLS_MAX
  jz SFLS_end
  mov rdx,rsi
  add rsi,8*8
  add rdi,1
  mov QWORD [rdx],rsi
  jmp SFLS_lp
SFLS_end:
  mov rax,SFLS_NULL
  mov QWORD [rsi],rax
  mov QWORD [SFLS_BTM],rdx
  ret

mk_s8: ; rdi=C-string
  push rdi
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  xor rax,rax
  call strlen
  mov rsp,QWORD [rsp_tmp]
  push rax
  mov rdi,rax
  call mlc_s8
  pop rcx
  pop rsi
  mov rdi,rax
  add rdi,8
  cld
  rep movsb
  ret

dlt_gbg:
  bt rdi,0
  jnc dlt_gbg_blk
  mov rax,0x00ff_ffff_ffff_fffe
  and rdi,rax
dlt_gbg_blk:
  bt QWORD [rdi],16
  jc dlt_gbg_opq
  mov [rdi],rbx
  mov rbx,rdi
  ret
dlt_gbg_opq:
  mov rax,0
  push rsi
  push rdx
  push rcx
  push r8
  push r9
  push r10
  push r11
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call free
  mov rsp,QWORD [rsp_tmp]
  pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  ret

dlt: ; rdi=src
  bt rdi,0
  jnc dlt_blk
  mov rax,0x00ff_ffff_ffff_fffe
  and rdi,rax
dlt_blk:
  bt QWORD [rdi],16
  jc dlt_opq
  bt QWORD [rdi],18
  jc dlt_arr
  push rdx
  push rsi
  mov eax,DWORD [rdi+4]
  mov rsi,[rdi]
  mov rdx,0
dlt_lp:
  cmp rdx,rax
  je dlt_lp_end
  rcr rsi,1
  jc dlt_lp_nxt
  push rdi
  push rsi
  push rax
  push rdx
  mov rdi,[rdi+8*1+8*rdx]
  call dlt
  pop rdx
  pop rax
  pop rsi
  pop rdi
dlt_lp_nxt:
  add rdx,1
  jmp dlt_lp
dlt_lp_end:
  pop rsi
  pop rdx
  mov QWORD [rdi],rbx
  mov rbx,rdi
  ret
dlt_opq:
  mov rax,0
  push rsi
  push rdx
  push rcx
  push r8
  push r9
  push r10
  push r11
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call free
  mov rsp,QWORD [rsp_tmp]
  pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  ret

dlt_arr:
  mov esi,DWORD [rdi+4]
  mov rax,0
dlt_arr_lp:
  cmp rsi,rax
  je dlt_arr_lp_end
  push rdi
  mov rdi,[rdi+8*1+8*rax]
  cmp rdi,NULL
  jz dlt_arr_lp_nxt
  push rsi
  push rax
  clc
  call dlt
  pop rax
  pop rsi
dlt_arr_lp_nxt:
  pop rdi
  add rax,1
  jmp dlt_arr_lp
dlt_arr_lp_end:
  mov QWORD [rdi],rbx
  mov rbx,rdi
  ret

dec_r:
  bt rdi,0
  jnc dec_r_blk
  mov rax,0x00ff_ffff_ffff_fffe
  and rdi,rax
dec_r_blk:
  push rdi
  mov rsi,0x0000_ffff_0000_0000
  and rsi,QWORD [rdi]
  cmp rsi,0
  jz dec_r_end
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
  mov rsi,0x0000_ffff_0000_0000
  and rsi,QWORD [rdi]
  cmp rsi,0
  jz inc_r_unt
  mov rsi,0x0001_0000_0000_0000
  add QWORD [rdi],rsi
inc_r_unt:
  ret

; rdi ~ src cf~tag
; rax ~ dst
dcp:
  jc dcp_r64
  bt rdi,0
  jnc dcp_blk
  mov rsi,rdi
  mov rdx,0x00ff_ffff_ffff_fffe
  mov rcx,0xff00_0000_0000_0001
  and rdi,rdx
  and rsi,rcx
  push rsi
  call dcp_blk
  pop rdi
  or rax,rdi
  ret
dcp_blk:
  bt QWORD [rdi],16
  jc rpc_s8
  bt QWORD [rdi],18
  jc rpc_arr
  mov rsi,rbx
  mov rbx,[rbx]
  mov rdx,[rdi]
  mov [rsi],rdx
  mov r8,[rdi]
  shr rdx,32
  mov r9,0
dcp_blk_lp:
  cmp rdx,r9
  jz dcp_end
  rcr r8,1
  push rdi
  push r8
  push rdx
  push rsi
  push r9
  mov rdi,[rdi+8+8*r9]
  call dcp
  pop r9
  pop rsi
  mov [rsi+8+8*r9],rax
  pop rdx
  pop r8
  pop rdi
  add r9,1
  jmp dcp_blk_lp
dcp_end:
  clc
  mov rax,rsi
  ret
dcp_r64:
  mov rax,rdi
  stc
  ret

rpc_opq:
  mov esi,DWORD [rdi+4]
  ;shr rsi,32
  push rdi
  push rsi
  mov rdi,rsi
  call mlc
  pop rsi
  pop rdi
  mov r11,[rdi]
  mov [rax],r11
  mov r10,0
rpc_opq_lp:
  cmp r10,rsi
  je dcp_end
  mov r9,[rdi+8*r10+8*1]
  mov [rax+8*r10+8*1],r9
  add r10,1
  jmp rpc_opq_lp

rpc_ln:
  push rdi
  bt QWORD [rdi],0
  mov rdi,[rdi+8*1]
  call dcp
  push rax
  call mlc_ln
  pop QWORD [rax+8*1]
  pop rdi
  mov rsi,[rdi]
  mov [rax],rsi
  jmp dcp_end

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

pp_v: ; rdi=value rsi=cf ⊢ rax=ret_stg
  ;push rdi
  ;push rsi
  ;mov rdi,10000
  ;xor rax,rax
  ;call malloc
  ;pop rsi
  ;pop rdi
  bt rsi,0
  ;mov rsi,rax
  ;push rsi
  mov rsi,str_ret
  call pp
  ;mov rsi,QWORD [rsp]
  ;sub rax,rsi
  sub rax,str_ret
  push rax
  mov rdi,rax
  call mlc_s8
  pop rcx
  mov rsi,str_ret
  mov rdi,rax
  add rdi,8
  ;mov rdx,rsi
  cld
  rep movsb
  ;push rax
  ;mov rdi,rdx
  ;xor rax,rax
  ;call free
  ;pop rax
  ret

mlc_s8: ; rdi=size of bytes
  push rdx
  push rcx
  push r8
  push r9
  push r10
  push r11
  mov rsi,rdi
  shl rsi,32
  bts rsi,16
  push rsi
  and rdi,~0b0111
  add rdi,16
  xor rax,rax
  push rdi
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call malloc
  mov rsp,QWORD [rsp_tmp]
  pop rdi
  pop QWORD [rax]
  mov QWORD [rax-8*1+rdi],0
  pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  ret

pp: ; rdi=tkn cf ⊢ rsi=dst
  jc pp_end
  jmp pp_r_p
pp_end:
  push rsi
  mov rdx,rdi
  mov rdi,rsi
  mov rsi,fmt64
  mov rax,0
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call sprintf
  mov rsp,QWORD [rsp_tmp]
  pop rsi
  add rax,rsi
  ret
pp_r_p:
  bt rdi,0
  jnc pp_r_p_ref
  mov rdx,rdi
  shr rdx,56
  push rdi
  push rsi
  mov rdi,rsi
  mov rsi,agl_fmt
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call sprintf
  mov rsp,QWORD [rsp_tmp]
  ;push rax
  ;mov QWORD [rsp_tmp],rsp
  ;mov rdi,str_ret
  ;xor rax,rax
  ;call printf
  ;mov rsp,QWORD [rsp_tmp]
  ;pop rax
  pop rsi
  pop rdi
  add rsi,rax
  mov r10,0x00ff_ffff_ffff_fffe
  and rdi,r10
pp_r_p_ref:
  mov r10,[rdi]
  push rdi
  push rsi
  mov rdx,rdi
  mov rdi,rsi
  mov rsi,fmt_ref
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call sprintf
  mov rsp,QWORD [rsp_tmp]
  pop rsi
  pop rdi
  add rsi,rax

  mov r10,[rdi]
  bt r10,16
  jc pp_opq
  bt r10,17
  jc pp_ln
  push rdi
  push rsi
  mov rdi,rsi
  mov rsi,blk_l
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call sprintf
  mov rsp,QWORD [rsp_tmp]
  pop rsi
  pop rdi
  add rsi,rax
  mov r10,[rdi]
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
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call sprintf
  mov rsp,QWORD [rsp_tmp]
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
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call sprintf
  mov rsp,QWORD [rsp_tmp]
  pop rsi
  add rax,rsi
  ret
pp_opq:
  mov BYTE [rsi],34
  add rsi,1
  mov edx,DWORD [rdi+4]
  mov rax,0
pp_opq_lp:
  cmp rax,rdx
  jz pp_opq_lp_end
  mov cl,[rdi+8+rax]
  cmp cl,0
  jz pp_opq_lp_null
  mov BYTE [rsi],cl
  add rsi,1
  add rax,1
  jmp pp_opq_lp
pp_opq_lp_null:
  mov BYTE [rsi],92
  mov BYTE [rsi+1],48
  add rsi,2
  add rax,1
  jmp pp_opq_lp
pp_opq_lp_end:
  mov BYTE [rsi],34
  add rsi,1
  mov BYTE [rsi],0
  mov rax,rsi
  ret

pp_ln:
  push rdi
  push rsi
  mov rdi,rsi
  mov rsi,ln_l
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call sprintf
  mov rsp,QWORD [rsp_tmp]
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
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call sprintf
  mov rsp,QWORD [rsp_tmp]
  pop rsi
  add rax,rsi
  ret

pp0: ; rdi=tkn cf ⊢ rsi=dst
  jc pp0_end
  jmp pp0_r_p
pp0_end:
  mov rsi,rdi
  mov rdi,fmt64
  mov rax,0
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
  ret
pp0_r_p:
  bt rdi,0
  jnc pp0_r_p_ref
  mov rsi,rdi
  shr rsi,56
  push rdi
  mov rdi,agl_fmt
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
  pop rdi
  mov r10,0x00ff_ffff_ffff_fffe
  and rdi,r10
pp0_r_p_ref:
  push rdi
  mov rsi,rdi
  mov rdi,fmt_ref
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
  pop rdi
  mov r10,[rdi]
  bt QWORD [rdi],16
  jc pp0_opq
  bt QWORD [rdi],17
  jc pp0_ln
  bt QWORD [rdi],18
  jc pp0_arr
  push rdi
  mov rdi,blk_l
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
  pop rdi
  mov r10,[rdi]
  mov r9,r10
  shr r9,32
  add rdi,8
pp0_r_p_lp:
  cmp r9,0
  je pp0_r_p_end
  sub r9,1
  rcr r10,1
  jc pp0_r_p_lp_nxt
  push r9
  push r10
  push rdi
  mov rdi,[rdi]
  call pp0_r_p
  pop rdi
  pop r10
  pop r9
  add rdi,8
  jmp pp0_r_p_lp
pp0_r_p_lp_nxt:
  push rdi
  push r9
  push r10
  mov rsi,[rdi]
  mov rdi,fmt64_spc
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
  pop r10
  pop r9
  pop rdi
  add rdi,8
  jmp pp0_r_p_lp
pp0_r_p_end:
  mov rdi,blk_r
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
  ret


pp0_opq:
  mov rax,[rdi]
  shr rax,30
  add rax,4
  sub rsp,rax
  mov rsi,rsp
  push rax
  push rsi
  call pp_opq
  pop rsi
  xor rax,rax
  mov rdi,fmt_s
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
  pop rax
  add rsp,rax
  ret

pp0_ln:
  push rdi
  mov rdi,ln_l
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
  pop rdi
  bt QWORD [rdi],0
  mov rdi,QWORD [rdi+8]
  call pp0
  mov rdi,ln_r
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
  ret

pp0_arr:
  push rdi
  mov rdi,arr_l
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
  pop rdi
  mov r10,[rdi]
  mov r9,r10
  shr r9,32
  add rdi,8
  pp0_arr_r_p_lp:
  cmp r9,0
  je pp0_arr_r_p_end
  sub r9,1
  push rdi
  mov rdi,[rdi]
  cmp rdi,NULL
  jz pp0_arr_r_p_lp_nxt
  push r9
  push r10
  clc
  call pp0_r_p
  pop r10
  pop r9
  pop rdi
  add rdi,8
  jmp pp0_arr_r_p_lp
  pp0_arr_r_p_lp_nxt:
  push r9
  push r10
  mov rdi,arr_null
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
  pop r10
  pop r9
  pop rdi
  add rdi,8
  jmp pp0_arr_r_p_lp
  pp0_arr_r_p_end:
  mov rdi,arr_r
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
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

eq: ; rdi=rsi xf
  jnc eq_nc
  cmp rdi,rsi
  ret
eq_nc: ; rdi=rsi ⊢ zf
  push rcx
  bt QWORD rdi,0
  jnc eq_ref
  mov rax,~0x00ff_ffff_ffff_ffff
  and rax,rdi
  mov rcx,~0x00ff_ffff_ffff_ffff
  and rcx,rsi
  cmp rax,rcx
  jz eq_nc_t
  pop rcx
  ret
eq_nc_t:
  mov rax,0x00ff_ffff_ffff_fffe
  and rdi,rax
  and rsi,rax
eq_ref:
  bt QWORD [rdi],16
  jc eq_opq
  bt QWORD [rdi],18
  jc eq_arr
  mov eax,DWORD [rdi+4]
  xor rdx,rdx
eq_blk_lp:
  cmp rcx,rax
  jz eq_blk_lp_end
  bt QWORD [rdi],rcx
  push rdi
  push rsi
  push rax
  push rcx
  mov rdi,QWORD [rdi+8+8*rcx]
  mov rsi,QWORD [rsi+8+8*rcx]
  call eq
  pop rcx
  pop rax
  pop rsi
  pop rdi
  jnz eq_blk_lp_end
  add rcx,1
  jmp eq_blk_lp
eq_blk_lp_end:
  pop rcx
  ret

eq_opq:
  mov eax,DWORD [rdi+4]
  mov ecx,DWORD [rsi+4]
  cmp rax,rcx
  jnz eq_opq_end
eq_opq_lp:
  cmp rcx,0
  jz eq_opq_end
  mov al,BYTE [rsi+7+rcx]
  cmp al,BYTE [rdi+7+rcx]
  jnz eq_opq_end
  sub rcx,1
  jmp eq_opq_lp
eq_opq_end:
  pop rcx
  ret

eq_arr:
  mov eax,DWORD [rdi+4]
  mov ecx,DWORD [rsi+4]
  cmp rax,rcx
  jnz eq_arr_end
  xor rcx,rcx
  cmp rcx,1
eq_arr_end:
  ret

emt: ; rdi s8
  mov rax,0
  add rdi,8
  call printf
  ret

err_bug:
  mov QWORD [err_n],1
  jmp err
err_s8_ge:
  mov QWORD [err_n],0
  jmp err
err:
  mov rdi,fmt_err_line
  mov rsi,QWORD [err_n]
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
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

prs_chr: ; rdi=dst_stg rsi=offset ⊢ rdi rsi rax= chr | ~0x0
  push rdx
  mov dl,[rdi+rsi+8*1]
  bt rdx,7
  jc prs_chr_2
  push rdi
  push rsi
  push rdx
  mov rdi,1
  call mlc_s8
  pop rdx
  pop rsi
  pop rdi
  mov BYTE [rax+8*1],dl
  add rsi,1
  stc
  pop rdx
  ret
prs_chr_2:
  bt rdx,6
  jnc prs_chr_null
  bt rdx,5
  jc prs_chr_3
  push rdi
  push rsi
  push rdx
  mov rdi,2
  call mlc_s8
  pop rdx
  pop rsi
  pop rdi
  mov QWORD [rax+8*1],0
  mov BYTE [rax+8*1],dl
  mov dl,[rdi+rsi+8*1+1]
  mov BYTE [rax+8*1+1],dl
  add rsi,2
  stc
  pop rdx
  ret
prs_chr_3:
  bt rdx,4
  jc prs_chr_4
  push rdi
  push rsi
  push rdx
  mov rdi,3
  call mlc_s8
  pop rdx
  pop rsi
  pop rdi
  mov QWORD [rax+8*1],0
  mov BYTE [rax+8*1],dl
  mov dl,[rdi+rsi+8*1+1]
  mov BYTE [rax+8*1+1],dl
  mov dl,[rdi+rsi+8*1+2]
  mov BYTE [rax+8*1+2],dl
  add rsi,3
  pop rdx
  stc
  ret
prs_chr_4:
  push rdi
  push rsi
  push rdx
  mov rdi,4
  call mlc_s8
  pop rdx
  pop rsi
  pop rdi
  mov QWORD [rax+8*1],0
  mov BYTE [rax+8*1],dl
  mov dl,[rdi+rsi+8*1+1]
  mov BYTE [rax+8*1+1],dl
  mov dl,[rdi+rsi+8*1+2]
  mov BYTE [rax+8*1+2],dl
  mov dl,[rdi+rsi+8*1+3]
  mov BYTE [rax+8*1+3],dl
  add rsi,4
  ret
prs_chr_null:
  mov rax,~0
  ret
byt: ; rdi=stg rsi=offset
  mov eax,DWORD [rdi+4]
  ;free_blk0 rax,32
  cmp rsi,rax
  jge byt_bound_err
  ;xor rax,rax
  movzx rax,BYTE [rdi+8*1+rsi]
  stc
  ret
byt_bound_err:
  clc
  ret

in_fn: ; rdi=filename
  mov rax,2
  mov rsi,2
  add rdi,8
  syscall
  push rax ; [rsp]=fd
  mov rdi,rax
  mov rax,5
  mov rsi,stat
  syscall
  mov rdi,[stat + STAT.st_size]
  call mlc_s8
  mov rdi,QWORD [rsp]
  push rax ; [rsp]=buf
  mov rsi,rax
  add rsi,8
  mov rax,0
  mov rdx,[stat+STAT.st_size]
  syscall
  mov rax,3
  mov rdi,QWORD [rsp+8]
  syscall
  mov rax,QWORD [rsp]
  add rsp,16
  ret

in0_init:
  mov rax,5
  mov rsi,stat
  mov rdi,0
  syscall
  mov rdi,[stat + STAT.st_size]
  push rdi
  call mlc_s8
  pop rdx
  push rax
  mov rsi,rax
  add rsi,8
  mov rax,0
  mov rdi,0
  syscall
  pop rdi
  mov QWORD [in0],rdi
  add rdi,8
  mov rax,0
  ;call printf
  ret

rpc_s8: ; rdi=src
  push rcx
  mov esi,[rdi+4]
  ;shr rsi,32
  push rdi
  push rsi
  mov rdi,rsi
  call mlc_s8
  pop rcx
  pop rsi
  mov rdi,rax
  add rdi,8
  add rsi,8
  cld
  rep movsb
  pop rcx
  ret

rpc_arr:
  push rdi
  mov edi,DWORD [rdi+4]
  push rdi
  call mk_arr
  pop rsi
  pop rdi
  mov rcx,rax
rpc_arr_lp:
  cmp rsi,0
  jz rpc_arr_end
  push rcx
  push rsi
  push rdi
  mov rdi,QWORD [rdi+8*rsi]
  clc
  call dcp
  pop rdi
  pop rsi
  pop rcx
  mov QWORD [rcx+8*rsi],rax
  sub rsi,1
  jmp rpc_arr_lp
rpc_arr_end:
  mov rax,rcx
  ret


; rdi=stg rsi=offset0 ⊢ rdi rsi=offset1 rax=dst
scf_d:
  push rsi
  lea rdi,[rdi+8+rsi]
  push rdi
  mov dil,BYTE [rdi]
  and rdi,0xff
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call isspace
  mov rsp,QWORD [rsp_tmp]
  cmp rax,0
  jz scf_d_scf
  add rsp,16
  mov rdi,0
  ret
scf_d_scf:
  mov rdi,QWORD [rsp]
  sub rsp,8
  mov rsi,rsp
  mov rdx,10
  mov rax,0
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call strtoul
  mov rsp,QWORD [rsp_tmp]
  pop rdx
  pop rdi
  pop rsi
  sub rdx,rdi
  jz scf_d_err
  add rsi,rdx
  mov rdi,1
  ret
scf_d_err:
  mov rdi,0
  ret
scf_x:
  ;
  push rdi
  push rsi
  mov QWORD [rsp_tmp],rsp
  lea rdi,[rdi+8+rsi]
  mov rsi,fmt_x
  mov rdx,fmt_x_r0
  mov rax,0
  and rsp,~0xf
  call sscanf
  mov rsp,QWORD [rsp_tmp]
  pop rsi
  pop rdi
  add rsi,rax
  mov rax,QWORD [fmt_x_r0]
  ret
scf_o:
  push rdi
  push rsi
  lea rdi,[rdi+8+rsi]
  mov rsi,fmt_o
  mov rdx,fmt_o_r0
  mov rax,0
  call sscanf
  pop rsi
  pop rdi
  add rsi,rax
  mov rax,[fmt_o_r0]
  ret
scf_c:
  push rdi
  push rsi
  lea rdi,[rdi+8+rsi]
  mov rsi,fmt_c
  mov rdx,fmt_c_r0
  mov rax,0
  call sscanf
  pop rsi
  pop rdi
  add rsi,rax
  mov rax,[fmt_c_r0]
  ret
scf_s:
  push rdi
  push rsi
  lea rdi,[rdi+8+rsi]
  mov rsi,fmt_s
  mov rdx,fmt_s_r0
  mov rax,0
  call sscanf
  pop rsi
  pop rdi
  add rsi,rax
  mov rax,fmt_s_r0
  ret

scf_sl:
  mov rax,[rdi]
  lea rdi,[rdi+8+rsi]
  push rdi
  shr rax,31
  mov rdi,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call malloc
  mov rsp,QWORD [rsp_tmp]
  pop rdi
  mov rdx,rax
  mov al,BYTE [rdi]
  cmp al,34
  jnz scf_sl_err
scf_sl_lp:
  mov al,[rdi+1+rcx]
  cmp al,34
  jz scf_sl_lp_end
  cmp al,92
  jz scf_sl_lp_esc
  mov BYTE [rdx+rcx],al
  add rcx,1
  jmp scf_sl_lp
scf_sl_lp_esc:
  mov al,[rdi+2+rcx]
  cmp al,92
  jz scf_sl_lp_esc_esc
  cmp al,34
  jz scf_sl_lp_esc_dqt
  cmp al,78
  jz scf_sl_lp_esc_n
  cmp al,116
  jz scf_sl_lp_esc_t
  cmp al,48
  jz scf_sl_lp_esc_null
  jmp scf_sl_err
scf_sl_lp_esc_esc:
  mov BYTE [rdx+rcx],92
  add rcx,2
  jmp scf_sl_lp
scf_sl_lp_esc_dqt:
  mov BYTE [rdx+rcx],34
  add rcx,2
  jmp scf_sl_lp
scf_sl_lp_esc_n:
  mov BYTE [rdx+rcx],10
  add rcx,2
  jmp scf_sl_lp
scf_sl_lp_esc_t:
  mov BYTE [rdx+rcx],9
  add rcx,2
  jmp scf_sl_lp
scf_sl_lp_esc_null:
  mov BYTE [rdx+rcx],0
  add rcx,2
  jmp scf_sl_lp
scf_sl_lp_end:
  mov rdi,rcx
  add rsi,rcx
  push rsi
  push rcx
  push rdx
  call mlc_s8
  pop rdx
  pop rcx
  mov rsi,rdx
  lea rdi,[rax+8]
  cld
  rep movsb
  push rax
  mov rdi,rsi
  call free
  pop rax
  pop rsi
  ret
scf_sl_err:
  mov rax,~0
  ret

scf_wd:
  mov rdx,0
  mov rcx,0
  mov al,[rdi+8+rsi]
  cmp al,65
  setge cl
  cmp al,90
  setle dl
  and cl,dl
  cmp al,97
  setge dl
  ;jmp scf_wd_err
scf_wd_A:
  cmp al,90
  ;jle scf_wd_Z

;scf_lwd:
;scf_uwd:

emt_q: ; rdi=tkn rsi=cf
  call pp_v
  push rax
  mov rsi,rax
  add rsi,8
  mov rdi,fmt_emt_q
  mov rax,0
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call printf
  mov rsp,QWORD [rsp_tmp]
  pop rdi
  mov rax,0
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call free
  mov rsp,QWORD [rsp_tmp]
  ret

mk_vct: ; rdi=size
  push rdi
  shl rdi,1
  lea rdi,[8*rdi+16]
  push rdi
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call malloc
  mov rsp,QWORD [rsp_tmp]
  pop rdi
  pop rdx
  sub rdx,16
  mov rsi,rdi
  shl rsi,32
  add rsi,0x4_0000
  mov QWORD [rax],rsi
  lea rsi,[rax+16]
  mov QWORD [rax+8],rsi
  mov QWORD [rax+16],rdx
  lea rsi,[rax+32]
  mov QWORD [rax+24],rsi


mk_arr:
  push rdi
  lea rdi,[8*rdi+8]
  xor rax,rax
  mov QWORD [rsp_tmp],rsp
  and rsp,~0xf
  call malloc
  mov rsp,QWORD [rsp_tmp]
  pop rdi
  mov rsi,rdi
  shl rdi,32
  add rdi,0x4_0000
  mov QWORD [rax],rdi
  xor rcx,rcx
mk_arr_lp:
  cmp rcx,rsi
  jz mk_arr_lp_end
  mov QWORD [rax+8+8*rcx],NULL
  add rcx,1
  jmp mk_arr_lp
mk_arr_lp_end:
  ret
