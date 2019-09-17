
//  src = r8 dst = r9 tmp = r10
// src = r8 i = r9 tmp = r10
.intel_syntax noprefix
.global main

rpc_r:
  mov r10,r8
  shr r10,1
  jnc rpc_r_ptr
rpc_r_v:
  mov r9,r8
  jmp rpc_r_end
rpc_r_ptr:
    mov r9,[r8]
    add r9,1
    mov [r8],r9
  shr r9,32
  push r8
rpc_r_ptr_lp:
  add r8,1
  cmp r9,0
  pop r9
  je rpc_r_end
  sub r9,1
  mov r10,[r8]
  shr r10,1
  jc rpc_r_ptr_lp
  push r8
  push r9
  mov r8,[r8]
  call rpc_r_inc_ptr
  pop r9
  pop r8
  jmp rpc_r_ptr_lp
rpc_r_inc_ptr:
  mov r9,[r8]
  add r9,1
  mov [r8],r9
  shr r9,32
rpc_r_inc_ptr_lp:
  add r8,1
  cmp r9,0
  je rpc_r_inc_ptr_end
  sub r9,1
  mov r10,[r8]
  shr r10,1
  jc rpc_r_inc_ptr_lp
  push r8
  push r9
  mov r8,[r8]
  call rpc_r_inc_ptr
  pop r9
  pop r8
  jmp rpc_r_inc_ptr_lp
rpc_r_inc_ptr_end:
  ret
rpc_r_end:
  ret
