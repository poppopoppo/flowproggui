(*
module Reg
  sig
    type t
    val compare : t -> t -> int
    val eq : t -> t -> bool
    val nth : int -> t
    val rax : t
    val rcx : t
    val rdx : t
    val rbx : t
    val rsi : t
    val rdi : t
    val r8 : t
    val r9 : t
    val r10 : t
    val r11 : t
    val r12 : t
    val r13 : t
    val r14 : t
    val r15 : t
  end
= struct
  type t = int
  let compare x y = compare_int x y
  let eq x y = eq_int (x mod 14) (y mod 14)
  let nth n = n mod 14
  let rax = 0
  let rcx = 1
  let rdx = 2
  let rbx = 3
  let rsi = 4
  let rdi = 5
  let r8 = 6
  let r9 = 7
  let r10 = 8
  let r11 = 9
  let r12 = 10
  let r13 = 11
  let r14 = 12
  let r15 = 13
end
module RegMap = Map.Make(struct type t = Reg.t let compare = Reg.compare end)
type k =
  | K_Int of int
  | K_Tns of Sgn.t * Sgn.t
  | K_Sgn of Sgn.t
  | K_Char of char
type k_pkt = (Sgn.t , k) Hashtbl.t
let k_unt = sgn ()
module St =
sig
  type t
  type reg
  val reg : int -> reg
  val ini : unit -> t
  val get : t -> reg -> k
  val set : t -> reg -> k -> unit
  val zf : reg
  val sf : reg
end = struct
  type t = k array
  let n = 50
  let reg i = i mod 50
  let ini () = Array.make 50 (K_Sgn k_unt)
  let get v i = v.(i mod 50)
  let set v i k = v.(i mod 50)<-k
  let zf = 14
  let sf = 15
  let agl_flg = 16
end
module M = struct
  type t = St.t * int * ((Sgn.t * k) DynArray.t) * ((Sgn.t * int) Stack.t)
  type op =
    | Jmp of cnd * reg * Sgn.t
    | JmpD of cnd * reg * reg
    | Call of Sgn.t
    | CallD of reg
    | Pop of reg
    | Push of src
    | Cmp of reg * src
    | Get of reg * reg
    | Set of reg * src
    | Mov of reg * src
    | Add of reg * src
    | Mul of reg * src
    | Sub of reg * src
  and src =
    | Src_Reg of reg
    | Src_Im of k
  and cnd =
    | Cnd_None
    | Cnd_e
    | Cnd_g
    | Cnd_ge
    | Cnd_l
    | Cnd_le
  type asm = cdp SgnMap.t
  and cdp =
    | Ret
    | Op of op * Sgn.t
  let src rs s =
    ( match s with
      | Src_Reg r -> St.get rs r
      | Src_Im k -> k )
  let jmp j r = true
  let run (c:asm) (p:Sgn.t) (v:t) : t =
    let (rs,sp,s,cs) = v in
    let d0 = SgnMap.find p c in
    ( match d0 with
      | Ret ->
        if (Stack.is_empty cs) then v
        else
          let hd = Stack.pop cs in
          run c hd (rs,sp,s,cs)
      | Op (o0,np) ->
        ( match o0 with
          | Jmp (j,r0,p1) ->
            if jmp j r0 then run c p1 (rs,sp,s,cs)
            else run c np (rs,sp,s,cs)
          | JmpD (j,r0,r1) ->
            if jmp j r0 then
              ( match St.get rs r0 with
                | K_Sgn p0 ->
                  run c p0 (rs,sp,s,cs)
                | _ -> raise (Failure "run-0") )
            else run c np (rs,sp,s,cs)
          | Call p1 ->
            Stack.push (np,0) cs;
            run c p1 (rs,sp,s,cs)
          | CallD r0 ->
            ( match St.get rs r0 with
              | K_Sgn p0 ->
                Stack.puth (np,0) cs;
                run c p0 (rs,sp,s,cs)
              | _ -> raise (Failure "run-0") )
          | Pop r0 ->
            if sp=0 then raise (Failure "run-1")
            else
              let hd = DynArray.get s (sp-1) in
              DynArray.delete s (sp-1);
              St.set rs r0 hd;
              run c np (rs,sp-1,s,cs)
          | Push s0 ->
            let k0 = src s0 in
            DynArray.set s sp k0;
            run c np (rs,sp+1,s,cs)
          | Cmp (r0,s0) ->
            let k0 = St.get rs r0 in
            let k1 = src s0 in
            ( match k0,k1 with
              | K_Int z0,K_Int z1 ->
                St.set rs r0 (K_Int z0-z1);
                run c np (rs,sp,s,cs)
              | _ -> raise (Failure "run-2") )
          | Get (rx,r0) ->
            let kx = St.get rs rx in
            ( match kx with
              | K_Int z ->
                let k0 =
                  ( try DynArray.get s (sp-z-1)
                    with _ -> raise (Failure "run.3") ) in
                St.set rs r0 k0;
                run c np (rs,sp,s,cs)
              | _ -> raise (Failure "run4") )
          | Set (rx,s0) ->
            let kx = St.get rs rx in
            let k0 = src s0 in
            ( match kx with
              | K_Int z ->
                let s1 =
                  ( try DynArray.set s (sp-z-1) k0
                    with _ -> raise (Failure "run.4")) in
                run c np (rs,sp,s,cs)
              | _ -> raise (Failure "run5") )
          | Mov (r0,s0) ->
            let k0 = src s0 in
            St.set rs r0 k0;
            run c np (rs,sp,s,cs)
          | Add (r0,s0) ->
            let k0 = St.get rs r0 in
            let k1 = src s0 in
            ( match k0,k1 with
              | K_Int z0,K_Int z1 ->
                St.set rs r0 (K_Int z0+z1);
                run c np (rs,sp,s,cs)
              | _ -> raise (Failure "run-2") )
          | Mul (r0,s0) ->
            let k0 = St.get rs r0 in
            let k1 = src s0 in
            ( match k0,k1 with
              | K_Int z0,K_Int z1 ->
                St.set rs r0 (K_Int z0*z1);
                run c np (rs,sp,s,cs)
              | _ -> raise (Failure "run-2") )
          | Sub (r0,s0) ->
            let k0 = St.get rs r0 in
            let k1 = src s0 in
            ( match k0,k1 with
              | K_Int z0,K_Int z1 ->
                St.set rs r0 (K_Int z0-z1);
                run c np (rs,sp,s,cs)
              | _ -> raise (Failure "run-2") )
        )
end
let rec m_t_of_code m p_src p_dst c pc =
  let e = SgnMap.find c pc in
  ( match e with
    | V_S (p1,p2) ->
      let q1 = sgn () in
      let m1 = m_t_of_code m p_src q1 c p1 in
      let m2 = m_t_of_code m1 q1 p_dst c p2 in
      m2
    | H_S (p1,p2) ->
      let m1 = m_t_of_code m p_src p_dst c p1 in
      m1
    | E_S n1 ->
      let m1 = m_t_of_nd m p_src p_dst n1 in
      m1
    | P_S (n1,l) ->
      let m1 = m_t_of_nd m p_src p_dst n1 in
      m1
    | A_S (n1,l) ->
      let m1 =
        List.fold_left
          (fun (lp,m1) p0 ->
             let q = sgn () in
             (lp@[q],m_t_of_code m1 q p_dst c p0))
          m l in
      m1
    | F_S (n1,a,p1) ->
      let m1 = m_t_of_nd m p_src p_dst n1 in
      m1
  )
let rec m_t_of_nd m p_src p_dst n =
  | PL_x _ -> m
  | PR_x _ -> m
  | Inj_x _ -> m
  | Cho_x _ -> m
  | Plg_x _ -> m
  | Z_x _ -> m
  | Stg_x _ -> m
  | TnsT (n1,_) ->
    let m1 = m_t_of_nd m p_src p_dst n1 in
    m1
  | AppT (_,_) -> m
let stg_end = sgn ()
let rec stk_of_tkn v =
  ( match v with
    | TknS_Z z -> [(sgn(),K_Int z)]
    | TknS_Stg s ->
      let sl = BatString.to_list s in
      let sl = List.map (fun x -> (sgn(),x)) sl in
      sl@[(sgn(),K_Sgn stg_end)]
    | TknS_Plg p -> [(sgn(),K_Sgn p)]
    | TknS_Tns (v1,v2) ->
  )
module M_pkt = struct
  type t = St.t * int * (k_pkt DynArray.t) * ((Sgn.t * int) Stack.t)
  type op =
    | Jmp of cnd * reg * Sgn.t
    | JmpD of cnd * reg * reg
    | Call of Sgn.t
    | CallD of reg
    | Pop of reg
    | Push of src
    | Cmp of reg * src
    | Get of reg * reg
    | Set of reg * src
    | Mov of reg * src
    | Add of reg * src
    | Mul of reg * src
    | Sub of reg * src
  and src =
    | Src_Reg of reg
    | Src_Im of k
  and cnd =
    | Cnd_None
    | Cnd_e
    | Cnd_g
    | Cnd_ge
    | Cnd_l
    | Cnd_le
end
*)
