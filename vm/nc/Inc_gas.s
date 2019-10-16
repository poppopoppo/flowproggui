#include "mem.s"
main: 
MISMATCH: "        mov r15,0"
MISMATCH: "        mov r14,0"
MISMATCH: "        mov r13,0"
        movq %rsp, $r12
        leaq -8*200(%rsp),%rsp
MISMATCH: "        mov r9,0"
MISMATCH: "        not r9"
MISMATCH: "        mov [r12],r9"
        xorq %rax,%rax
        movq $0,%rdi
        call mlc
        movq %rax,%rdi
        clc
        call test5
        movq %rax,%rdi
        movq $str_ret, %rsi
        call pnt
        call pnt_str_ret
        jmp _end
test5: 
#       |» {  }
        jc emt_etr_c_lb_0
        pushq %rdi
# emt_set_ptn {  }
        popq %rdi
        call dec_r
jmp emt_etr_start_lb_1
emt_etr_c_lb_0: 
# emt_set_ptn {  }
emt_etr_start_lb_1: 
#       » 0xr14 |~ 0' : r64
MISMATCH: "        mov r9,0x14"
MISMATCH: "        mov [r12-8*1],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,0"
MISMATCH: "        mov [r12],r9"
#       $ 0' ⊢ ,0' : ,r64
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_2
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_3
lb_2: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_3: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_4
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_4: 
#       » 0xra |~ 1' : r64
MISMATCH: "        mov r9,0xa"
MISMATCH: "        mov [r12-8*2],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,1"
MISMATCH: "        mov [r12],r9"
#       $ 1' ⊢ ,1' : ,r64
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_5
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_6
lb_5: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_6: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_7
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_7: 
#       » 0xr0 |~ 2' : r64
MISMATCH: "        mov r9,0x0"
MISMATCH: "        mov [r12-8*3],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,2"
MISMATCH: "        mov [r12],r9"
#       $ 2' ⊢ ,2' : ,r64
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_8
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_9
lb_8: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_9: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_10
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_10: 
#       tak { 0' 1' 2' } ⊢ 0' : r64
# emt_get_ptn { 0' 1' 2' }
        movq $3,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdx
        popq %rdi
        movq $2,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
# push_s 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        push r9"
        pushf
MISMATCH: "        add r15,1"
        popf
MISMATCH: "        mov r9,0"
MISMATCH: "        not r9"
MISMATCH: "        mov [r12],r9"
        call tak
# pop_s
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12],r9"
        pushf
MISMATCH: "        sub r15,1"
        popf
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_12
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_13
lb_12: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_13: 
        popq %rdi
        popf
        jc lb_11
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_11: 
#       ∎ 0'
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        pushq %rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
MISMATCH: "        push r9"
#clear 
MISMATCH: "        pop r9"
MISMATCH: "        rcr r9,1"
        popq %rax
        ret
test4: 
#       |» {  }
        jc emt_etr_c_lb_14
        pushq %rdi
# emt_set_ptn {  }
        popq %rdi
        call dec_r
jmp emt_etr_start_lb_15
emt_etr_c_lb_14: 
# emt_set_ptn {  }
emt_etr_start_lb_15: 
#       » 0xr5 |~ 0' : r64
MISMATCH: "        mov r9,0x5"
MISMATCH: "        mov [r12-8*1],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,0"
MISMATCH: "        mov [r12],r9"
#       $ 0' ⊢ ,0' : ,r64
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_16
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_17
lb_16: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_17: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_18
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_18: 
#       fact 0' ⊢ 0' : r64
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdi
# push_s 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        push r9"
        pushf
MISMATCH: "        add r15,1"
        popf
MISMATCH: "        mov r9,0"
MISMATCH: "        not r9"
MISMATCH: "        mov [r12],r9"
        call fact
# pop_s
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12],r9"
        pushf
MISMATCH: "        sub r15,1"
        popf
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_20
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_21
lb_20: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_21: 
        popq %rdi
        popf
        jc lb_19
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_19: 
#       ∎ 0'
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        pushq %rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
MISMATCH: "        push r9"
#clear 
MISMATCH: "        pop r9"
MISMATCH: "        rcr r9,1"
        popq %rax
        ret
tak: 
#       |» { 0' 1' 2' }
        jc emt_etr_c_lb_22
        pushq %rdi
# emt_set_ptn { 0' 1' 2' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_136
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_137
lb_136: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_137: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_138
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_139
lb_138: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_139: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,2"
        movq 8*3(%rdi),%rdi
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_140
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_141
lb_140: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_141: 
        popq %rdi
        popq %rdi
        call dec_r
jmp emt_etr_start_lb_23
emt_etr_c_lb_22: 
# emt_set_ptn { 0' 1' 2' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_130
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_131
lb_130: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_131: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_132
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_133
lb_132: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_133: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,2"
        movq 8*3(%rdi),%rdi
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_134
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_135
lb_134: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_135: 
        popq %rdi
emt_etr_start_lb_23: 
#       $ 0' ⊢ ,0',3' : ,r64,r64
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_24
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_25
lb_24: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_25: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_26
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_27
lb_26: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_27: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_28
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_28: 
#       $ 1' ⊢ ,1',4' : ,r64,r64
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_29
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_30
lb_29: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_30: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 4'
        movq %rdi,r12-8*5
        jc lb_31
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,4"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_32
lb_31: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,4"
MISMATCH: "        mov [r12],r10"
lb_32: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_33
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_33: 
#       cmp { 3' 4' } ⊢ { 3' 4' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
# emt_get_ptn { 3' 4' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 3'
        movq r12-8*4,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 4'
        movq r12-8*5,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,4"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn { 5' 6' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 5'
        movq %rdi,r12-8*6
        jc lb_40
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,5"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_41
lb_40: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,5"
MISMATCH: "        mov [r12],r10"
lb_41: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 6'
        movq %rdi,r12-8*7
        jc lb_42
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,6"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_43
lb_42: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,6"
MISMATCH: "        mov [r12],r10"
lb_43: 
        popq %rdi
        popq %rdi
        popf
        jc lb_35
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_35: 
MISMATCH: "        mov r9,[r12-8*6]"
MISMATCH: "        mov r10,[r12-8*7]"
        pushq %rdi
MISMATCH: "        push r9"
MISMATCH: "        push r10"
        movq $2,%rdi
        call mlc
MISMATCH: "        pop r10"
MISMATCH: "        pop r9"
        popq %rdi
MISMATCH: "        cmp r9,r10"
MISMATCH: "        mov r9,0"
MISMATCH: "        setz r9b"
MISMATCH: "        mov r10,0"
        jle cmp_jb_lb_34
MISMATCH: "        mov r10,1"
cmp_jb_lb_34: 
MISMATCH: "        mov [rax+8*1],r9"
MISMATCH: "        mov [rax+8*2],r10"
        clc
        movq %rax,%rdi
        pushq %rdi
# emt_set_ptn { 3' 4' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_36
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_37
lb_36: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_37: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 4'
        movq %rdi,r12-8*5
        jc lb_38
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,4"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_39
lb_38: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,4"
MISMATCH: "        mov [r12],r10"
lb_39: 
        popq %rdi
        popq %rdi
        clc
        call dec_r
#       ∠ 4'
# emt_get_ptn 4'
        movq r12-8*5,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,4"
        cmpq $0,%rax
        movq %rax,%rdi
        je lb_45
        movq $0,%rdi
        stc
        jmp agl_44_1
lb_45: 
        movq $1,%rdi
        stc
        jmp agl_44_0
#       ∐ 4'
agl_44_0: 
        pushf
        pushq %rdi
# emt_set_ptn 4'
        movq %rdi,r12-8*5
        jc lb_51
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,4"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_52
lb_51: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,4"
MISMATCH: "        mov [r12],r10"
lb_52: 
        popq %rdi
        popf
        jc lb_46
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_46: 
#       ∎ 2'
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        pushq %rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
MISMATCH: "        push r9"
#clear  3'~b 4'~c 0'~x 1'~y
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        jc clear_lb_47
        movq r12-8*4,%rdi
        call dec_r
clear_lb_47: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,4"
        jc clear_lb_48
        movq r12-8*5,%rdi
        call dec_r
clear_lb_48: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        jc clear_lb_49
        movq r12-8*1,%rdi
        call dec_r
clear_lb_49: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        jc clear_lb_50
        movq r12-8*2,%rdi
        call dec_r
clear_lb_50: 
MISMATCH: "        pop r9"
MISMATCH: "        rcr r9,1"
        popq %rax
        ret
#       ∐ 4'
agl_44_1: 
        pushf
        pushq %rdi
# emt_set_ptn 4'
        movq %rdi,r12-8*5
        jc lb_128
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,4"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_129
lb_128: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,4"
MISMATCH: "        mov [r12],r10"
lb_129: 
        popq %rdi
        popf
        jc lb_53
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_53: 
#       $ 0' ⊢ ,0',5' : ,r64,r64
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_54
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_55
lb_54: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_55: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 5'
        movq %rdi,r12-8*6
        jc lb_56
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,5"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_57
lb_56: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,5"
MISMATCH: "        mov [r12],r10"
lb_57: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_58
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_58: 
#       » 0xr1 |~ 6' : r64
MISMATCH: "        mov r9,0x1"
MISMATCH: "        mov [r12-8*7],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,6"
MISMATCH: "        mov [r12],r9"
#       $ 6' ⊢ ,6' : ,r64
# emt_get_ptn 6'
        movq r12-8*7,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,6"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 6'
        movq %rdi,r12-8*7
        jc lb_59
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,6"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_60
lb_59: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,6"
MISMATCH: "        mov [r12],r10"
lb_60: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_61
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_61: 
#       sub { 5' 6' } ⊢ 5' : r64
# emt_get_ptn { 5' 6' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 5'
        movq r12-8*6,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,5"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 6'
        movq r12-8*7,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,6"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn { 6' 7' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 6'
        movq %rdi,r12-8*7
        jc lb_65
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,6"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_66
lb_65: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,6"
MISMATCH: "        mov [r12],r10"
lb_66: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 7'
        movq %rdi,r12-8*8
        jc lb_67
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,7"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_68
lb_67: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,7"
MISMATCH: "        mov [r12],r10"
lb_68: 
        popq %rdi
        popq %rdi
        popf
        jc lb_62
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_62: 
MISMATCH: "        mov r9,[r12-8*7]"
MISMATCH: "        mov r10,[r12-8*8]"
MISMATCH: "        sub r9,r10"
        movq $r9, %rdi
        stc
# emt_set_ptn 5'
        movq %rdi,r12-8*6
        jc lb_63
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,5"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_64
lb_63: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,5"
MISMATCH: "        mov [r12],r10"
lb_64: 
#       $ 2' ⊢ ,2',6' : ,r64,r64
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_69
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_70
lb_69: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_70: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 6'
        movq %rdi,r12-8*7
        jc lb_71
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,6"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_72
lb_71: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,6"
MISMATCH: "        mov [r12],r10"
lb_72: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_73
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_73: 
#       $ 1' ⊢ ,1',7' : ,r64,r64
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_74
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_75
lb_74: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_75: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 7'
        movq %rdi,r12-8*8
        jc lb_76
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,7"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_77
lb_76: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,7"
MISMATCH: "        mov [r12],r10"
lb_77: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_78
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_78: 
#       tak { 5' 7' 6' } ⊢ 5' : r64
# emt_get_ptn { 5' 7' 6' }
        movq $3,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 5'
        movq r12-8*6,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,5"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 7'
        movq r12-8*8,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,7"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 6'
        movq r12-8*7,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,6"
        movq %rax,%rdx
        popq %rdi
        movq $2,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
# push_s  2'~z 3'~b 4'~c 0'~x 1'~y
MISMATCH: "        mov r9,[r12-8*3]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*4]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*5]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*1]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*2]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        push r9"
        pushf
MISMATCH: "        add r15,1"
        popf
MISMATCH: "        mov r9,0"
MISMATCH: "        not r9"
MISMATCH: "        mov [r12],r9"
        call tak
# pop_s
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*2],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*1],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*5],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*4],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*3],r9"
        pushf
MISMATCH: "        sub r15,1"
        popf
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn 5'
        movq %rdi,r12-8*6
        jc lb_80
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,5"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_81
lb_80: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,5"
MISMATCH: "        mov [r12],r10"
lb_81: 
        popq %rdi
        popf
        jc lb_79
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_79: 
#       $ 1' ⊢ ,1',6' : ,r64,r64
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_82
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_83
lb_82: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_83: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 6'
        movq %rdi,r12-8*7
        jc lb_84
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,6"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_85
lb_84: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,6"
MISMATCH: "        mov [r12],r10"
lb_85: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_86
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_86: 
#       » 0xr1 |~ 7' : r64
MISMATCH: "        mov r9,0x1"
MISMATCH: "        mov [r12-8*8],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,7"
MISMATCH: "        mov [r12],r9"
#       $ 7' ⊢ ,7' : ,r64
# emt_get_ptn 7'
        movq r12-8*8,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,7"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 7'
        movq %rdi,r12-8*8
        jc lb_87
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,7"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_88
lb_87: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,7"
MISMATCH: "        mov [r12],r10"
lb_88: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_89
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_89: 
#       sub { 6' 7' } ⊢ 6' : r64
# emt_get_ptn { 6' 7' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 6'
        movq r12-8*7,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,6"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 7'
        movq r12-8*8,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,7"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn { 7' 8' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 7'
        movq %rdi,r12-8*8
        jc lb_93
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,7"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_94
lb_93: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,7"
MISMATCH: "        mov [r12],r10"
lb_94: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 8'
        movq %rdi,r12-8*9
        jc lb_95
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,8"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_96
lb_95: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,8"
MISMATCH: "        mov [r12],r10"
lb_96: 
        popq %rdi
        popq %rdi
        popf
        jc lb_90
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_90: 
MISMATCH: "        mov r9,[r12-8*8]"
MISMATCH: "        mov r10,[r12-8*9]"
MISMATCH: "        sub r9,r10"
        movq $r9, %rdi
        stc
# emt_set_ptn 6'
        movq %rdi,r12-8*7
        jc lb_91
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,6"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_92
lb_91: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,6"
MISMATCH: "        mov [r12],r10"
lb_92: 
#       $ 2' ⊢ ,2',7' : ,r64,r64
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_97
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_98
lb_97: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_98: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 7'
        movq %rdi,r12-8*8
        jc lb_99
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,7"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_100
lb_99: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,7"
MISMATCH: "        mov [r12],r10"
lb_100: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_101
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_101: 
#       $ 0' ⊢ ,0',8' : ,r64,r64
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_102
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_103
lb_102: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_103: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 8'
        movq %rdi,r12-8*9
        jc lb_104
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,8"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_105
lb_104: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,8"
MISMATCH: "        mov [r12],r10"
lb_105: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_106
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_106: 
#       tak { 6' 7' 8' } ⊢ 6' : r64
# emt_get_ptn { 6' 7' 8' }
        movq $3,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 6'
        movq r12-8*7,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,6"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 7'
        movq r12-8*8,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,7"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 8'
        movq r12-8*9,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,8"
        movq %rax,%rdx
        popq %rdi
        movq $2,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
# push_s  2'~z 3'~b 5'~r0 4'~c 0'~x 1'~y
MISMATCH: "        mov r9,[r12-8*3]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*4]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*6]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*5]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*1]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*2]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        push r9"
        pushf
MISMATCH: "        add r15,1"
        popf
MISMATCH: "        mov r9,0"
MISMATCH: "        not r9"
MISMATCH: "        mov [r12],r9"
        call tak
# pop_s
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*2],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*1],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*5],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*6],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*4],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*3],r9"
        pushf
MISMATCH: "        sub r15,1"
        popf
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn 6'
        movq %rdi,r12-8*7
        jc lb_108
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,6"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_109
lb_108: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,6"
MISMATCH: "        mov [r12],r10"
lb_109: 
        popq %rdi
        popf
        jc lb_107
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_107: 
#       » 0xr1 |~ 7' : r64
MISMATCH: "        mov r9,0x1"
MISMATCH: "        mov [r12-8*8],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,7"
MISMATCH: "        mov [r12],r9"
#       $ 7' ⊢ ,7' : ,r64
# emt_get_ptn 7'
        movq r12-8*8,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,7"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 7'
        movq %rdi,r12-8*8
        jc lb_110
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,7"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_111
lb_110: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,7"
MISMATCH: "        mov [r12],r10"
lb_111: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_112
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_112: 
#       sub { 2' 7' } ⊢ 2' : r64
# emt_get_ptn { 2' 7' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 7'
        movq r12-8*8,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,7"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn { 7' 8' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 7'
        movq %rdi,r12-8*8
        jc lb_116
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,7"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_117
lb_116: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,7"
MISMATCH: "        mov [r12],r10"
lb_117: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 8'
        movq %rdi,r12-8*9
        jc lb_118
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,8"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_119
lb_118: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,8"
MISMATCH: "        mov [r12],r10"
lb_119: 
        popq %rdi
        popq %rdi
        popf
        jc lb_113
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_113: 
MISMATCH: "        mov r9,[r12-8*8]"
MISMATCH: "        mov r10,[r12-8*9]"
MISMATCH: "        sub r9,r10"
        movq $r9, %rdi
        stc
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_114
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_115
lb_114: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_115: 
#       tak { 2' 0' 1' } ⊢ 0' : r64
# emt_get_ptn { 2' 0' 1' }
        movq $3,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdx
        popq %rdi
        movq $2,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
# push_s  6'~r1 3'~b 5'~r0 4'~c
MISMATCH: "        mov r9,[r12-8*7]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*4]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*6]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*5]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        push r9"
        pushf
MISMATCH: "        add r15,1"
        popf
MISMATCH: "        mov r9,0"
MISMATCH: "        not r9"
MISMATCH: "        mov [r12],r9"
        call tak
# pop_s
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*5],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*6],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*4],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*7],r9"
        pushf
MISMATCH: "        sub r15,1"
        popf
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_121
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_122
lb_121: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_122: 
        popq %rdi
        popf
        jc lb_120
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_120: 
#       tak { 5' 6' 0' } ⊢ 0' : r64
# emt_get_ptn { 5' 6' 0' }
        movq $3,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 5'
        movq r12-8*6,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,5"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 6'
        movq r12-8*7,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,6"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdx
        popq %rdi
        movq $2,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
# push_s  3'~b 4'~c
MISMATCH: "        mov r9,[r12-8*4]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*5]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        push r9"
        pushf
MISMATCH: "        add r15,1"
        popf
MISMATCH: "        mov r9,0"
MISMATCH: "        not r9"
MISMATCH: "        mov [r12],r9"
        call tak
# pop_s
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*5],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*4],r9"
        pushf
MISMATCH: "        sub r15,1"
        popf
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_124
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_125
lb_124: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_125: 
        popq %rdi
        popf
        jc lb_123
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_123: 
#       ∎ 0'
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        pushq %rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
MISMATCH: "        push r9"
#clear  3'~b 4'~c
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        jc clear_lb_126
        movq r12-8*4,%rdi
        call dec_r
clear_lb_126: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,4"
        jc clear_lb_127
        movq r12-8*5,%rdi
        call dec_r
clear_lb_127: 
MISMATCH: "        pop r9"
MISMATCH: "        rcr r9,1"
        popq %rax
        ret
fact: 
#       |» 0'
        jc emt_etr_c_lb_142
        pushq %rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_205
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_206
lb_205: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_206: 
        popq %rdi
        call dec_r
jmp emt_etr_start_lb_143
emt_etr_c_lb_142: 
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_203
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_204
lb_203: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_204: 
emt_etr_start_lb_143: 
#       $ 0' ⊢ ,0',1' : ,r64,r64
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_144
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_145
lb_144: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_145: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_146
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_147
lb_146: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_147: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_148
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_148: 
#       » 0xr0 |~ 2' : r64
MISMATCH: "        mov r9,0x0"
MISMATCH: "        mov [r12-8*3],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,2"
MISMATCH: "        mov [r12],r9"
#       $ 2' ⊢ ,2' : ,r64
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_149
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_150
lb_149: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_150: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_151
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_151: 
#       cmp { 0' 2' } ⊢ { 0' 2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
# emt_get_ptn { 0' 2' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn { 3' 4' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_158
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_159
lb_158: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_159: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 4'
        movq %rdi,r12-8*5
        jc lb_160
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,4"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_161
lb_160: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,4"
MISMATCH: "        mov [r12],r10"
lb_161: 
        popq %rdi
        popq %rdi
        popf
        jc lb_153
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_153: 
MISMATCH: "        mov r9,[r12-8*4]"
MISMATCH: "        mov r10,[r12-8*5]"
        pushq %rdi
MISMATCH: "        push r9"
MISMATCH: "        push r10"
        movq $2,%rdi
        call mlc
MISMATCH: "        pop r10"
MISMATCH: "        pop r9"
        popq %rdi
MISMATCH: "        cmp r9,r10"
MISMATCH: "        mov r9,0"
MISMATCH: "        setz r9b"
MISMATCH: "        mov r10,0"
        jle cmp_jb_lb_152
MISMATCH: "        mov r10,1"
cmp_jb_lb_152: 
MISMATCH: "        mov [rax+8*1],r9"
MISMATCH: "        mov [rax+8*2],r10"
        clc
        movq %rax,%rdi
        pushq %rdi
# emt_set_ptn { 0' 2' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_154
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_155
lb_154: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_155: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_156
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_157
lb_156: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_157: 
        popq %rdi
        popq %rdi
        clc
        call dec_r
#       ∠ 0'
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        cmpq $0,%rax
        movq %rax,%rdi
        je lb_163
        movq $0,%rdi
        stc
        jmp agl_162_1
lb_163: 
        movq $1,%rdi
        stc
        jmp agl_162_0
#       ∐ 0'
agl_162_0: 
        pushf
        pushq %rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_192
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_193
lb_192: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_193: 
        popq %rdi
        popf
        jc lb_164
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_164: 
#       » 0xr1 |~ 3' : r64
MISMATCH: "        mov r9,0x1"
MISMATCH: "        mov [r12-8*4],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,3"
MISMATCH: "        mov [r12],r9"
#       $ 3' ⊢ ,3' : ,r64
# emt_get_ptn 3'
        movq r12-8*4,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_165
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_166
lb_165: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_166: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_167
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_167: 
#       $ 1' ⊢ ,1',4' : ,r64,r64
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_168
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_169
lb_168: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_169: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 4'
        movq %rdi,r12-8*5
        jc lb_170
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,4"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_171
lb_170: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,4"
MISMATCH: "        mov [r12],r10"
lb_171: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_172
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_172: 
#       sub { 1' 3' } ⊢ 1' : r64
# emt_get_ptn { 1' 3' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 3'
        movq r12-8*4,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn { 3' 5' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_176
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_177
lb_176: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_177: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 5'
        movq %rdi,r12-8*6
        jc lb_178
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,5"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_179
lb_178: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,5"
MISMATCH: "        mov [r12],r10"
lb_179: 
        popq %rdi
        popq %rdi
        popf
        jc lb_173
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_173: 
MISMATCH: "        mov r9,[r12-8*4]"
MISMATCH: "        mov r10,[r12-8*6]"
MISMATCH: "        sub r9,r10"
        movq $r9, %rdi
        stc
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_174
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_175
lb_174: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_175: 
#       fact 1' ⊢ 1' : r64
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdi
# push_s  2'~c 4'~x2 0'~b
MISMATCH: "        mov r9,[r12-8*3]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*5]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*1]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        push r9"
        pushf
MISMATCH: "        add r15,1"
        popf
MISMATCH: "        mov r9,0"
MISMATCH: "        not r9"
MISMATCH: "        mov [r12],r9"
        call fact
# pop_s
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*1],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*5],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*3],r9"
        pushf
MISMATCH: "        sub r15,1"
        popf
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_181
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_182
lb_181: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_182: 
        popq %rdi
        popf
        jc lb_180
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_180: 
#       mul { 4' 1' } ⊢ 1' : r64
# emt_get_ptn { 4' 1' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 4'
        movq r12-8*5,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,4"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn { 3' 4' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_186
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_187
lb_186: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_187: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 4'
        movq %rdi,r12-8*5
        jc lb_188
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,4"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_189
lb_188: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,4"
MISMATCH: "        mov [r12],r10"
lb_189: 
        popq %rdi
        popq %rdi
        popf
        jc lb_183
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_183: 
MISMATCH: "        mov r9,[r12-8*4]"
MISMATCH: "        mov r10,[r12-8*5]"
MISMATCH: "        imul r9,r10"
        movq $r9, %rdi
        stc
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_184
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_185
lb_184: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_185: 
#       ∎ 1'
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        pushq %rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
MISMATCH: "        push r9"
#clear  2'~c 0'~b
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        jc clear_lb_190
        movq r12-8*3,%rdi
        call dec_r
clear_lb_190: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        jc clear_lb_191
        movq r12-8*1,%rdi
        call dec_r
clear_lb_191: 
MISMATCH: "        pop r9"
MISMATCH: "        rcr r9,1"
        popq %rax
        ret
#       ∐ 0'
agl_162_1: 
        pushf
        pushq %rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_201
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_202
lb_201: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_202: 
        popq %rdi
        popf
        jc lb_194
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_194: 
#       » 0xr1 |~ 3' : r64
MISMATCH: "        mov r9,0x1"
MISMATCH: "        mov [r12-8*4],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,3"
MISMATCH: "        mov [r12],r9"
#       $ 3' ⊢ ,3' : ,r64
# emt_get_ptn 3'
        movq r12-8*4,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_195
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_196
lb_195: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_196: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_197
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_197: 
#       ∎ 3'
# emt_get_ptn 3'
        movq r12-8*4,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        pushq %rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
MISMATCH: "        push r9"
#clear  2'~c 0'~b 1'~x1
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        jc clear_lb_198
        movq r12-8*3,%rdi
        call dec_r
clear_lb_198: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        jc clear_lb_199
        movq r12-8*1,%rdi
        call dec_r
clear_lb_199: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        jc clear_lb_200
        movq r12-8*2,%rdi
        call dec_r
clear_lb_200: 
MISMATCH: "        pop r9"
MISMATCH: "        rcr r9,1"
        popq %rax
        ret
f0: 
#       |» 0'
        jc emt_etr_c_lb_207
        pushq %rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_258
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_259
lb_258: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_259: 
        popq %rdi
        call dec_r
jmp emt_etr_start_lb_208
emt_etr_c_lb_207: 
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_256
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_257
lb_256: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_257: 
emt_etr_start_lb_208: 
#       $ 0' ⊢ ,0',1' : ,r64,r64
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_209
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_210
lb_209: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_210: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_211
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_212
lb_211: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_212: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_213
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_213: 
#       » 0xr0 |~ 2' : r64
MISMATCH: "        mov r9,0x0"
MISMATCH: "        mov [r12-8*3],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,2"
MISMATCH: "        mov [r12],r9"
#       $ 2' ⊢ ,2' : ,r64
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_214
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_215
lb_214: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_215: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_216
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_216: 
#       cmp { 0' 2' } ⊢ { 0' 2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
# emt_get_ptn { 0' 2' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn { 3' 4' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_223
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_224
lb_223: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_224: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 4'
        movq %rdi,r12-8*5
        jc lb_225
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,4"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_226
lb_225: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,4"
MISMATCH: "        mov [r12],r10"
lb_226: 
        popq %rdi
        popq %rdi
        popf
        jc lb_218
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_218: 
MISMATCH: "        mov r9,[r12-8*4]"
MISMATCH: "        mov r10,[r12-8*5]"
        pushq %rdi
MISMATCH: "        push r9"
MISMATCH: "        push r10"
        movq $2,%rdi
        call mlc
MISMATCH: "        pop r10"
MISMATCH: "        pop r9"
        popq %rdi
MISMATCH: "        cmp r9,r10"
MISMATCH: "        mov r9,0"
MISMATCH: "        setz r9b"
MISMATCH: "        mov r10,0"
        jle cmp_jb_lb_217
MISMATCH: "        mov r10,1"
cmp_jb_lb_217: 
MISMATCH: "        mov [rax+8*1],r9"
MISMATCH: "        mov [rax+8*2],r10"
        clc
        movq %rax,%rdi
        pushq %rdi
# emt_set_ptn { 0' 2' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_219
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_220
lb_219: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_220: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_221
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_222
lb_221: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_222: 
        popq %rdi
        popq %rdi
        clc
        call dec_r
#       ∠ 0'
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        cmpq $0,%rax
        movq %rax,%rdi
        je lb_228
        movq $0,%rdi
        stc
        jmp agl_227_1
lb_228: 
        movq $1,%rdi
        stc
        jmp agl_227_0
#       ∐ 0'
agl_227_0: 
        pushf
        pushq %rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_245
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_246
lb_245: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_246: 
        popq %rdi
        popf
        jc lb_229
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_229: 
#       » 0xr1 |~ 3' : r64
MISMATCH: "        mov r9,0x1"
MISMATCH: "        mov [r12-8*4],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,3"
MISMATCH: "        mov [r12],r9"
#       $ 3' ⊢ ,3' : ,r64
# emt_get_ptn 3'
        movq r12-8*4,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_230
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_231
lb_230: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_231: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_232
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_232: 
#       sub { 1' 3' } ⊢ 1' : r64
# emt_get_ptn { 1' 3' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 3'
        movq r12-8*4,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn { 3' 4' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_236
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_237
lb_236: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_237: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 4'
        movq %rdi,r12-8*5
        jc lb_238
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,4"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_239
lb_238: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,4"
MISMATCH: "        mov [r12],r10"
lb_239: 
        popq %rdi
        popq %rdi
        popf
        jc lb_233
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_233: 
MISMATCH: "        mov r9,[r12-8*4]"
MISMATCH: "        mov r10,[r12-8*5]"
MISMATCH: "        sub r9,r10"
        movq $r9, %rdi
        stc
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_234
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_235
lb_234: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_235: 
#       f0 1' ⊢ 1' : r64
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdi
# push_s  2'~c 0'~b0
MISMATCH: "        mov r9,[r12-8*3]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12-8*1]"
MISMATCH: "        push r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        push r9"
        pushf
MISMATCH: "        add r15,1"
        popf
MISMATCH: "        mov r9,0"
MISMATCH: "        not r9"
MISMATCH: "        mov [r12],r9"
        call f0
# pop_s
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*1],r9"
MISMATCH: "        pop r9"
MISMATCH: "        mov [r12-8*3],r9"
        pushf
MISMATCH: "        sub r15,1"
        popf
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_241
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_242
lb_241: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_242: 
        popq %rdi
        popf
        jc lb_240
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_240: 
#       ∎ 1'
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        pushq %rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
MISMATCH: "        push r9"
#clear  2'~c 0'~b0
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        jc clear_lb_243
        movq r12-8*3,%rdi
        call dec_r
clear_lb_243: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        jc clear_lb_244
        movq r12-8*1,%rdi
        call dec_r
clear_lb_244: 
MISMATCH: "        pop r9"
MISMATCH: "        rcr r9,1"
        popq %rax
        ret
#       ∐ 0'
agl_227_1: 
        pushf
        pushq %rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_254
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_255
lb_254: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_255: 
        popq %rdi
        popf
        jc lb_247
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_247: 
#       » 0xr0 |~ 3' : r64
MISMATCH: "        mov r9,0x0"
MISMATCH: "        mov [r12-8*4],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,3"
MISMATCH: "        mov [r12],r9"
#       $ 3' ⊢ ,3' : ,r64
# emt_get_ptn 3'
        movq r12-8*4,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_248
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_249
lb_248: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_249: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_250
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_250: 
#       ∎ 3'
# emt_get_ptn 3'
        movq r12-8*4,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        pushq %rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
MISMATCH: "        push r9"
#clear  2'~c 0'~b1 1'~x1
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        jc clear_lb_251
        movq r12-8*3,%rdi
        call dec_r
clear_lb_251: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        jc clear_lb_252
        movq r12-8*1,%rdi
        call dec_r
clear_lb_252: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        jc clear_lb_253
        movq r12-8*2,%rdi
        call dec_r
clear_lb_253: 
MISMATCH: "        pop r9"
MISMATCH: "        rcr r9,1"
        popq %rax
        ret
test3: 
#       |» {  }
        jc emt_etr_c_lb_260
        pushq %rdi
# emt_set_ptn {  }
        popq %rdi
        call dec_r
jmp emt_etr_start_lb_261
emt_etr_c_lb_260: 
# emt_set_ptn {  }
emt_etr_start_lb_261: 
#       » 0x2r1 |~ 0' : @[0].r2 ≃ ∐[@[0] @[0] ]
MISMATCH: "        mov r9,0x1"
MISMATCH: "        mov [r12-8*1],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,0"
MISMATCH: "        mov [r12],r9"
#       $ 0' ⊢ ,0' : ,@[0].r2 ≃ ∐[@[0] @[0] ]
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_262
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_263
lb_262: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_263: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_264
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_264: 
#       » 0xrff |~ 1' : r64
MISMATCH: "        mov r9,0xff"
MISMATCH: "        mov [r12-8*2],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,1"
MISMATCH: "        mov [r12],r9"
#       $ 1' ⊢ ,1' : ,r64
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_265
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_266
lb_265: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_266: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_267
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_267: 
#       » 0xrff |~ 2' : r64
MISMATCH: "        mov r9,0xff"
MISMATCH: "        mov [r12-8*3],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,2"
MISMATCH: "        mov [r12],r9"
#       $ 2' ⊢ ,2' : ,r64
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_268
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_269
lb_268: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_269: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_270
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_270: 
#       cmp { 1' 2' } ⊢ { 1' 2' } : { @[0].r2 ≃ ∐[@[0] @[0] ] @[0].r2 ≃ ∐[@[0] @[0] ] }
# emt_get_ptn { 1' 2' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn { 3' 4' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_277
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_278
lb_277: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_278: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 4'
        movq %rdi,r12-8*5
        jc lb_279
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,4"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_280
lb_279: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,4"
MISMATCH: "        mov [r12],r10"
lb_280: 
        popq %rdi
        popq %rdi
        popf
        jc lb_272
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_272: 
MISMATCH: "        mov r9,[r12-8*4]"
MISMATCH: "        mov r10,[r12-8*5]"
        pushq %rdi
MISMATCH: "        push r9"
MISMATCH: "        push r10"
        movq $2,%rdi
        call mlc
MISMATCH: "        pop r10"
MISMATCH: "        pop r9"
        popq %rdi
MISMATCH: "        cmp r9,r10"
MISMATCH: "        mov r9,0"
MISMATCH: "        setz r9b"
MISMATCH: "        mov r10,0"
        jle cmp_jb_lb_271
MISMATCH: "        mov r10,1"
cmp_jb_lb_271: 
MISMATCH: "        mov [rax+8*1],r9"
MISMATCH: "        mov [rax+8*2],r10"
        clc
        movq %rax,%rdi
        pushq %rdi
# emt_set_ptn { 1' 2' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_273
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_274
lb_273: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_274: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_275
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_276
lb_275: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_276: 
        popq %rdi
        popq %rdi
        clc
        call dec_r
#       ∠ 1'
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        cmpq $0,%rax
        movq %rax,%rdi
        je lb_282
        movq $0,%rdi
        stc
        jmp agl_281_1
lb_282: 
        movq $1,%rdi
        stc
        jmp agl_281_0
#       ∐ 1'
agl_281_0: 
        pushf
        pushq %rdi
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_286
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_287
lb_286: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_287: 
        popq %rdi
        popf
        jc lb_283
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_283: 
#       ∎ 1'
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        pushq %rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
MISMATCH: "        push r9"
#clear  2'~c 0'~b0
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        jc clear_lb_284
        movq r12-8*3,%rdi
        call dec_r
clear_lb_284: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        jc clear_lb_285
        movq r12-8*1,%rdi
        call dec_r
clear_lb_285: 
MISMATCH: "        pop r9"
MISMATCH: "        rcr r9,1"
        popq %rax
        ret
#       ∐ 1'
agl_281_1: 
        pushf
        pushq %rdi
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_291
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_292
lb_291: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_292: 
        popq %rdi
        popf
        jc lb_288
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_288: 
#       ∎ 1'
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        pushq %rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
MISMATCH: "        push r9"
#clear  2'~c 0'~b0
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        jc clear_lb_289
        movq r12-8*3,%rdi
        call dec_r
clear_lb_289: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        jc clear_lb_290
        movq r12-8*1,%rdi
        call dec_r
clear_lb_290: 
MISMATCH: "        pop r9"
MISMATCH: "        rcr r9,1"
        popq %rax
        ret
test2: 
#       |» {  }
        jc emt_etr_c_lb_293
        pushq %rdi
# emt_set_ptn {  }
        popq %rdi
        call dec_r
jmp emt_etr_start_lb_294
emt_etr_c_lb_293: 
# emt_set_ptn {  }
emt_etr_start_lb_294: 
#       » 0xrffff |~ 0' : r64
MISMATCH: "        mov r9,0xffff"
MISMATCH: "        mov [r12-8*1],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,0"
MISMATCH: "        mov [r12],r9"
#       $ 0' ⊢ ,0' : ,r64
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_295
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_296
lb_295: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_296: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_297
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_297: 
#       » 0xrffffccccafab0000 |~ 1' : r64
MISMATCH: "        mov r9,0xffffccccafab0000"
MISMATCH: "        mov [r12-8*2],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,1"
MISMATCH: "        mov [r12],r9"
#       $ 1' ⊢ ,1' : ,r64
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_298
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_299
lb_298: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_299: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_300
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_300: 
#       » 0xra |~ 2' : r64
MISMATCH: "        mov r9,0xa"
MISMATCH: "        mov [r12-8*3],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,2"
MISMATCH: "        mov [r12],r9"
#       $ 2' ⊢ ,2' : ,r64
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_301
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_302
lb_301: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_302: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_303
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_303: 
#       » 0xr18 |~ 3' : r64
MISMATCH: "        mov r9,0x18"
MISMATCH: "        mov [r12-8*4],r9"
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bts r9,3"
MISMATCH: "        mov [r12],r9"
#       $ 3' ⊢ ,3' : ,r64
# emt_get_ptn 3'
        movq r12-8*4,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_304
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_305
lb_304: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_305: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_306
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_306: 
#       mul { 3' 2' } ⊢ 2' : r64
# emt_get_ptn { 3' 2' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 3'
        movq r12-8*4,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
        pushf
        pushq %rdi
# emt_set_ptn { 3' 4' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_310
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_311
lb_310: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_311: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 4'
        movq %rdi,r12-8*5
        jc lb_312
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,4"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_313
lb_312: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,4"
MISMATCH: "        mov [r12],r10"
lb_313: 
        popq %rdi
        popq %rdi
        popf
        jc lb_307
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_307: 
MISMATCH: "        mov r9,[r12-8*4]"
MISMATCH: "        mov r10,[r12-8*5]"
MISMATCH: "        imul r9,r10"
        movq $r9, %rdi
        stc
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_308
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_309
lb_308: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_309: 
#       ∎ { 0' 2' }
# emt_get_ptn { 0' 2' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 2'
        movq r12-8*3,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        pushq %rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
MISMATCH: "        push r9"
#clear  1'~y
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        jc clear_lb_314
        movq r12-8*2,%rdi
        call dec_r
clear_lb_314: 
MISMATCH: "        pop r9"
MISMATCH: "        rcr r9,1"
        popq %rax
        ret
test0: 
#       |» {  }
        jc emt_etr_c_lb_315
        pushq %rdi
# emt_set_ptn {  }
        popq %rdi
        call dec_r
jmp emt_etr_start_lb_316
emt_etr_c_lb_315: 
# emt_set_ptn {  }
emt_etr_start_lb_316: 
#       $ { {  } {  } } ⊢ ,0',1',2' : ,{ { } { } },{ { } { } },{ { } { } }
# emt_get_ptn { {  } {  } }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn {  }
        movq $0,%rdi
        call mlc
        clc
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn {  }
        movq $0,%rdi
        call mlc
        clc
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_317
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_318
lb_317: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_318: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 1'
        movq %rdi,r12-8*2
        jc lb_319
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,1"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_320
lb_319: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,1"
MISMATCH: "        mov [r12],r10"
lb_320: 
        popq %rax
        popq %rdi
        btq $0,%rax
        pushq %rdi
        pushq %rax
# emt_set_ptn 2'
        movq %rdi,r12-8*3
        jc lb_321
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,2"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_322
lb_321: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,2"
MISMATCH: "        mov [r12],r10"
lb_322: 
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_323
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_323: 
#       $ 0' ⊢ ,{ 0' 3' } : ,{ { } { } }
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdi
        movq $0,%rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
        movq $r9, %rax
MISMATCH: "        rcr r9,1"
        pushq %rdi
        pushq %rax
# emt_set_ptn { 0' 3' }
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,0"
        movq 8*1(%rdi),%rdi
# emt_set_ptn 0'
        movq %rdi,r12-8*1
        jc lb_324
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,0"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_325
lb_324: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,0"
MISMATCH: "        mov [r12],r10"
lb_325: 
        popq %rdi
        pushq %rdi
MISMATCH: "        mov r9,[rdi]"
MISMATCH: "        bt r9,1"
        movq 8*2(%rdi),%rdi
# emt_set_ptn 3'
        movq %rdi,r12-8*4
        jc lb_326
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        btr r10,3"
MISMATCH: "        mov [r12],r10"
        call inc_r
        movq %rdi,%rax
        jmp lb_327
lb_326: 
MISMATCH: "        mov r10,[r12]"
MISMATCH: "        bts r10,3"
MISMATCH: "        mov [r12],r10"
lb_327: 
        popq %rdi
        popq %rax
        popq %rdi
        btq $0,%rax
        jc lb_328
        pushq %rdi
        call dec_r
        popq %rdi
        clc
lb_328: 
#       ∎ { 0' 1' }
# emt_get_ptn { 0' 1' }
        movq $2,%rdi
        call mlc
        pushq %rax
# emt_get_ptn 0'
        movq r12-8*1,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,0"
        movq %rax,%rdx
        popq %rdi
        movq $0,%rsi
        pushq %rdi
        call exc
        popq %rax
        pushq %rax
# emt_get_ptn 1'
        movq r12-8*2,%rax
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,1"
        movq %rax,%rdx
        popq %rdi
        movq $1,%rsi
        pushq %rdi
        call exc
        popq %rax
        clc
        pushq %rax
MISMATCH: "        mov r9,0"
MISMATCH: "        rcl r9,1"
MISMATCH: "        push r9"
#clear  2'~r2 3'~r4
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,2"
        jc clear_lb_329
        movq r12-8*3,%rdi
        call dec_r
clear_lb_329: 
MISMATCH: "        mov r9,[r12]"
MISMATCH: "        bt r9,3"
        jc clear_lb_330
        movq r12-8*4,%rdi
        call dec_r
clear_lb_330: 
MISMATCH: "        pop r9"
MISMATCH: "        rcr r9,1"
        popq %rax
        ret

