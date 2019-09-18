//  src = r8 dst = r9 tmp = r10
// src = r8 i = r9 tmp = r10
.intel_syntax noprefix
.global main
fact:
# 	|» 0'
# 	$ 0' ⊢ ,1',2' : ,@[0].(ℤn)◂(ℤ_u) ≃ ∐[{ } { } ],@[0].(ℤn)◂(ℤ_u) ≃ ∐[{ } { } ]
	mov r8,rax
	call rpc_r
	mov rdi,r9
	mov r8,rax
	call rpc_r
	mov rsi,r9
	mov r8,rax
	call rmv_r
# 	∠ 1'
# 	∐ 0'
agl_0_0:
# 	» .. |~ 0' ⊢ 1'
# 	$ 1' ⊢ ,0' : ,@[0].(ℤn)◂(ℤ_u) ≃ ∐[{ } { } ]
	mov r8,rdi
	call rpc_r
	mov rax,r9
	mov r8,rdi
	call rmv_r
# 	∎ 0'
# 	∐ 0'
agl_0_1:
# 	$ 2' ⊢ ,1',3' : ,@[0].(ℤn)◂(ℤ_u) ≃ ∐[{ } { } ],@[0].(ℤn)◂(ℤ_u) ≃ ∐[{ } { } ]
	mov r8,rsi
	call rpc_r
	mov rdi,r9
	mov r8,rsi
	call rpc_r
	mov rdx,r9
	mov r8,rsi
	call rmv_r
# 	» .. |~ 1' ⊢ 2'
# 	$ 3' ⊢ ,1',4' : ,@[0].t52'(0) ≃ ∐[{ } { } ],@[0].t52'(0) ≃ ∐[{ } { } ]
	mov r8,rdx
	call rpc_r
	mov rdi,r9
	mov r8,rdx
	call rpc_r
	mov rcx,r9
	mov r8,rdx
	call rmv_r
# 	$ 4' ⊢ ,3',5' : ,@[0].t53'(0) ≃ ∐[{ } { } ],@[0].t53'(0) ≃ ∐[{ } { } ]
	mov r8,rcx
	call rpc_r
	mov rdx,r9
	mov r8,rcx
	call rpc_r
	mov r12,r9
	mov r8,rcx
	call rmv_r
# 	» .. |~ 3' ⊢ 4'
# 	$ 5' ⊢ ,3',6' : ,@[0].t55'(0) ≃ ∐[{ } { } ],@[0].t55'(0) ≃ ∐[{ } { } ]
	mov r8,r12
	call rpc_r
	mov rdx,r9
	mov r8,r12
	call rpc_r
	mov r13,r9
	mov r8,r12
	call rmv_r
# 	$ 6' ⊢ ,5',7' : ,@[0].t56'(0) ≃ ∐[{ } { } ],@[0].t56'(0) ≃ ∐[{ } { } ]
	mov r8,r13
	call rpc_r
	mov r12,r9
	mov r8,r13
	call rpc_r
	mov r14,r9
	mov r8,r13
	call rmv_r
# 	» .. |~ 5' ⊢ 6'
# 	» .. |~ 7' ⊢ 5'
# 	◂ 6',5' ⊢ 7' : @[0].(ℤn)◂(ℤ_u) ≃ ∐[{ } { } ]
# 	◂ 4',{ 3' 7' } ⊢ 5' : @[0].(ℤn)◂(ℤ_u) ≃ ∐[{ } { } ]
# 	fact5' ⊢ 3' : @[0].(ℤn)◂(ℤ_u) ≃ ∐[{ } { } ]
# 	◂ 2',{ 1' 3' } ⊢ 4' : @[0].(ℤn)◂(ℤ_u) ≃ ∐[{ } { } ]
# 	$ 4' ⊢ ,1' : ,@[0].(ℤn)◂(t63'(0)) ≃ ∐[{ } { } ]
	mov r8,rcx
	call rpc_r
	mov rdi,r9
	mov r8,rcx
	call rmv_r
# 	∎ 1'
f0:
# 	|» 0'
# 	∎ 0'
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
