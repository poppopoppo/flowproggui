rpc_r:
  rcr r8
  jnc rpc_r_ptr
rpc_r_v:
  rcl r8
  mov r9,r8
  jmp rpc_r_end
rpc_r_ptr:
  rcl r8
  mov r9,[r8]
  add r9,1
  mov [r8],r9
  shr r9,32
  push r8
  jmp rpc_r_ptr_lp
rpc_r_ptr_lp_seq:
  rcl [r8]
rpc_r_ptr_lp:
  add r8,1
  cmp r9,0
  pop r9
  je rpc_r_end
  sub r9,1
  rcr [r8]
  jc rpc_r_ptr_lp_seq
  rcl [r8]
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
  jmp rpc_r_inc_ptr_lp
rpc_inc_ptr_lp_seq:
  rcl [r8]
rpc_r_inc_ptr_lp:
  add r8,1
  cmp r9,0
  je rpc_r_end
  sub r9,1
  rcr [r8]
  jc rpc_r_inc_ptr_lp_seq
  rcl [r8]
  push r8
  push r9
  mov r8,[r8]
  call rpc_r_inc_ptr
  pop r9
  pop r8
  jmp rpc_r_inc_ptr_lp
rpc_r_end:
  ret
