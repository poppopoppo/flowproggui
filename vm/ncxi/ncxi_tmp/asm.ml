(*
open Rcd_Ptn
type ptn = int Rcd_Ptn.t
type t = line array
and r =
  | Acm of int | Arg of int | Tmp of int
  | Tbv| R_N of string
and plc = Rg of r | Pt of src * src
and src = | Plc of plc | Cst of cst
and dst = plc
and cst = | Dgt of int | Frm of string
and lr = L | R
and line =
  | Lb of string
  | Mov of dst * src
  | Pop of dst
  | Push of src
  | Call of string
  | Ret
  | Jmp of string
  | Jc of bool * string
  | Rot of { lr: lr; cf: rot_t; d: dst; cl : src }
  | CF_Set of bool
  | CF_Neg
  | BT of dst * src * bit_t
  | Cmp of src * src
  | Je of bool * string
  | Add of dst * src
  | Sub of dst * src
  | Neg of dst
  | Xor of dst * src
  | Or of dst * src
  | And of dst * src
  | Not of dst
  | Mlc of dst * src
  | Free of src
  | Cmt of string
  | Txt of string
  | Usr of string * (StgSet.t option) * (ptn array) * idx * (dst array) * (src array)
and rot_t = Rot_C | Rot_NC | Sht
and bit_t = BT_1 | BT_0 | BT_N | BT_T | BT_CF
let emt_plc d =
  ( match d with
    | Rg Tbv -> "rax"
    | Rg (Acm i) ->
      if i=0 then "rdi"
      else if i=1 then "rsi"
      else if i=2 then "rdx"
      else if i=3 then "rcx"
      else if i=4 then "r8"
      else  "[r12-"^(string_of_int (5-i))^"]"
    | Rg (Arg i) -> "[r13-"^(string_of_int i)^"]"
    | Rg (Tmp i) ->
      if i=0 then "r9"
      else if i=1 then "r10"
      else if i=2 then "r11"
      else "[r14-"^(string_of_int i)^"]"
    | Rg (R_N n) -> n
    | Pt (s0,o) -> "["^(emt_dst s0)^"+"^(emt_dst o)^"]" )
let emt_dst d = emt_plc d
let emt_src s =
  ( match s with
    | Plc p -> emt_plc p
    | S_Cst (C_Dgt i) -> string_of_int i
    | S_Cst (C_Frm s) -> s )
let rec emt_x86 as0 p0 =
  if (Array.length as0)<=p0 then ""
  else
    let e0 = emt_line as0.(p0) in
    e0^(emt_x86 as0 (p0+1))
and emt_line l0 =
  ( match l0 with
    | Lb s -> s^":\n"
    | Mov(D_Pt p0,S_Pt p1) ->
      let a0 = [Mov(Rg(Tmp 0),Plc(Pt p1));Mov(Pt p0,Plc(Rg(Tmp 0)))] in
      emt_x86 a0 0
    | Mov(d,s) -> "\tmov "^(emt_dst d)^","^(emt_src s)^"\n"
    | Pop d -> "\tpop "^(emt_dst d)^"\n"
    | Push s -> "\tpush "^(emt_src s)^"\n"
    | Call s -> "\tcall "^s^"\n"
    | Ret -> "\tret\n"
    | Jmp s -> "\tjmp s\n"
    | Jc (true,s) -> "\tjc "^s^"\n"
    | Jc (false,s) -> "\tjnc "^s^"\n"
    | Rot { lr=lr; cf=cf; d=d; cl=cl } ->
      let t0 = emt_dst (D_Rg(Tmp 0)) in
      let t1 = emt_dst (D_Rg(TMp 1)) in
      let d = emt_dst d in
      let e0 =
        "\tmov "^t0^",rcx\n"^
        "\tmov rcx,"^(emt_src cl)^"\n"^
        "\tmov "^t1^","^d^"\n" in
      let e1 =
        ( match lr,cf with
          | L,Rot_NC -> "\trol "^t1^",cl\n"
          | R,Rot_NC ->  "\tror "^t1^",cl\n"
          | L,Rot_C -> "\trcl "^t1^",cl\n"
          | R,Rot_C -> "\trcr "^t1^",cl\n"
          | L,Sht -> "\tshl "^t1^",cl\n"
          | R,Sht -> "\tshr "^t1^",cl\n" ) in
      let e2 =
        "\tmov "^d^","^t1^"\n"^
        "\tmov rcx,"^t0 in
      e0^e1^e2
    | CF_Set true -> "\tstc\n"
    | CF_Set false -> "\tclc\n"
    | CF_Neg -> "\tcmc\n"
    | BT (d,s,b) ->
      let t0 = Rg(Tmp 0) in
      let t1 = Rg(Tmp 1) in
      let a0 = [Mov(t0,Plc d);Mov(t1,s)] in
      let e0 = emt_x86 a0 0 in
      let e1 =
        ( match b with
          | BT_1 -> "\tbts "^(emt_dst t0)^","^(emt_dst t1)^"\n"
          | BT_0 -> "\tbtr "^(emt_dst t0)^","^(emt_dst t1)^"\n"
          | BT_N -> "\tbtc "^(emt_dst t0)^","^(emt_dst t1)^"\n"
          | BT_T -> "\tbt "^(emt_dst t0)^","^(emt_dst t1)^"\n"
          | BT_CF ->
            let l0 = "bt_cf_"^(Sgn.print (sgn ())) in
            "\tjc "^l0^"\n"^
            "\tbtr "^(emt_dst t0)^","^(emt_dst t1)^"\n"^
              l0^":\n"^
            "\tbts "^(emt_dst t0)^","^(emt_dst t1)^"\n"
            ) in
      let e2 = emt_x86 [Mov(d,Plc t0)] 0 in
      e0^e1^e2
    | Cmp(s0,s1) -> "\tcmp "^(emt_src s0)^","^(emt_src s1)
    | Je (true,s) -> "\tje "^s^"\n"
    | Je (false,s) -> "\tjne "^s^"\n"
    | Add (d,s) -> "\tadd "^(emt_dst d)^","^(emt_src s)^"\n"
    | Sub (d,s) -> "\tsub "^(emt_dst d)^","^(emt_src s)^"\n"
    | Neg d -> "\tneg "^(emt_dst d)^"\n"
    | Xor (d,s) -> "\txor "^(emt_dst d)^","^(emt_src s)^"\n"
    | Or (d,s) -> "\tor "^(emt_dst d)^","^(emt_src s)^"\n"
    | And (d,s) -> "\tand "^(emt_dst d)^","^(emt_src s)^"\n"
    | Not d -> "\rnot "^(emt_dst d)^"\n"
    | Mlc (d,s) ->
      let t0 = Rg(Tmp 0) in
      let t1 = Rg(Tmp 1) in
      let e0 =
        "\tmov "^(emt_dst t0)^",rdi\n"^
        "\tmov "^(emt_dst t1)^",rax\n"^
        "\tmov rdi,"^(emt_src s)^"\n"^
        "\timul rdi,8\n"^
        "\tcall malloc\n"^
        "\tmov "^(emt_dst d)^",rax\n"^
        "\tmov rdi,"^(emt_dst t0)^"\n"^
        "\tmov rax,"^(emt_dst t1)^"\n" in
      e0
    | Usr ("new",None,[||],[|d|],[|s|]) ->
    | Usr ("inc",None,[||],[|d|],[||]) ->
    | Usr ("dec",None,[||],[|d|],[||]) ->
    | Usr ("mov_idx_r",None,[|p|],[|d|],[|s|]) ->
    | Usr ("mov_p_r",None,[|p|],[|d|],[||]) ->
    | Usr ("id_r_ptn") ->
    | Usr ("id_ptn_r") ->
    | Usr ("push_s",None,[|A n|],[||],[||]) ->
    | Usr ("pop_s",None,[||],[||],[||]) ->
    | Usr ("clear",Some s,[||],[||],[||]) ->
    | Usr ("set_arg",None,[|p|],[||],[||]) ->
    | Usr ("get_arg",None,[||],[|d|],[||]) ->
    | Usr ("ir_ret",)
    | Usr ("ir_id")
    | Usr ("ir_call")
    | Usr ("ir_glb_call")
    | Usr ("ir_agl")
    | Usr ("ir_exp")
    | Usr ("ir_il_call")
    | Usr ("ir_il_glb_call")
    | Cmt s -> "# "^s^"\n"
    | Free d ->
      let t0 = Rg(Tmp 0) in
      let t1 = Rg(Tmp 1) in
      let e0 =
        "\tmov "^(emt_dst t0)^",rdi\n"^
        "\tmov "^(emt_dst t1)^",rax\n"^
        "\tmov rdi,"^(emt_src s)^"\n"^
        "\tcall free\n"^
        "\tmov rdi,"^(emt_dst t0)^"\n"^
        "\tmov rax,"^(emt_dst t1)^"\n" in
      e0 )
let inc_r_p i p =
  let a0 = get_r_p i p in
  a0^
  "call chk_t0_inc\n"
and mov_r_t0 i =
  [
    BT(Rg Tbv,Cst(Dgt i),BT_T);
    Mov(Rg(Tmp 0),Plc(Rg(Acm i)))
  ]
and mov_t0_r i =
  [
    BT(Rg Tbv,Cst(Dgt i),BT_CF);
    Mov(Rg(Acm i),Plc(Rg(Tmp 0)))
  ]
and get_r_p i p =
  let a0 = mov_r_t0 i in
  (emt_x86 a0)^(get_t_p p)
and get_t0_p p =
  ( match p with
    | End -> ""
    | Idx (j,tl) ->
      let a0 = [
        BT(Pt(Plc(Rg(Tmp 0)),Cst(Dgt 1)),Cst(Dgt j),BT_T);
        Mov(Rg(Tmp 0),Plc(Pt(Plc(Rg(Tmp 0)),Plc(Cst(Dgt (j+2))))));
      ] in
      let a1 = get_t0_p tl in
      emt_x86 (a0 |+| a1)
    | Tl j ->

    | _ -> "get_t_p\n" )
and mov_t0_ptn p r =
  ( match r with
    | A i -> (get_t0_p p)^(mov_t0_r i)
    | R rs ->
      let a0 = [
        Push (Plc(Rg(Tmp 0)))
      ] in
      let (e1,_) =
        Array.fold_left
          (fun (a1,i) r -> (rpc_t0_ptn (p@[Idx i]) r,i+1)) "" rs in
      let a1 = [
        Pop (Rg(Tmp 0))
      ] in
      (emt_x86 a0)^e1^(emt_x86 a1)
    | Ro (rs,it) ->
      let (a0,i) =
        Array.fold_left (fun (a0,i) r -> (rpc_a_ptn (p@[i]) i0 r,i+1)) "" rs in
      let a1 =
        "\tmov "^tmp0^","^r0^"\n"^
        (mov_path (p@[Tl i]))^
        "\tmov "^(reg it)^","^tmp1^"\n"
      in a0^a1
    | _ -> "rpc_a_ptn\n" )
*)
