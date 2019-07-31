open Types
let dbg = true
type 'a rcd_ptn =
  | P_Rc of ('a rcd_ptn) array
  | P_Ro of ('a rcd_ptn ) array * 'a
  | P_A of 'a
type reg = Reg of Sgn.t
type regs = reg array
type reg_ptn = reg rcd_ptn
type rcd_tkn =
  | Rcd_Rcd of rcd_tkn array
  | Rcd_Tkn of tkn
and tkn =
  | Tkn_Stg of string
  | Tkn_Z of int
  | Tkn_Bol of bool
  | Tkn_Sgn of Sgn.t
  | Tkn_CoP of int * (rcd_tkn)
  | Tkn_P of ((pt * reg_ptn) array) * rcd_tkn
  | Tkn_Fnc of tkn_fnc
and tkn_fnc =
  | Pls
  | Mlt
  | Mns
  | Cmp
  | Eq
  | Inj of int
  | Cho of int
  | Fix
  | Exn
  | Fnc of pt * reg_ptn (* jmp_ptr arg_ptr *)
  | Clj of pt * reg_ptn * (rcd_tkn) (* jmp_ptr arg0 { arg0 x } *)
and ptr = tkn ref
and nd =
  | Id of reg_ptn * reg_ptn
  | Prj of int * reg_ptn * reg_ptn
  | Rm of reg
  | Rpc of regs * reg
  | Agl of reg_ptn * reg_ptn * (int list) * ((pt * reg_ptn) array)
  | Call of reg_ptn * reg * reg_ptn
  | HCall of (reg_ptn array) * ((reg * reg_ptn) array)
  | Prd of reg * reg_ptn * reg_ptn * (pt array)
  | Nd_Clj of reg * reg_ptn * reg_ptn * pt
  | Ini of reg * rcd_tkn
and pt_nd = Ret of reg_ptn | Nxt of nd * pt
and pt = pt_nd ref
type code =
  | V of code * code
  | H of code array
  | E of exp_ptn
  | P of exp_ptn * (code array)
  | A of (exp_ptn) * (int list) * (code array)
  | F of exp_ptn * int * code
and exp_ptn =
  | Exp_Rcd of exp_ptn array
  | Exp_Atm of exp
and exp =
  | Prj of int * exp_ptn
  | Inj of int
  | Cho of int
  | Rot
  | Atm of atm
  | Z of int
  | Stg of string
  | App of exp * exp_ptn
and atm =
  | Pls
  | Mlt
  | Mns
  | Cmp
  | Eq
  | Fix
  | Exn
  | Etr of name
and name = string
type tkn_ptn = tkn rcd_ptn
type st = st_v * (cs Stack.t)
and st_v = (reg, rcd_tkn) Hashtbl.t
and cs =
  | CS of pt * reg_ptn * st_v (* return-plc * return-reg *)
  | CS_L of pt * reg_ptn * st_v * (tkn option S_Ref.t)
  | CS_R of pt * reg_ptn * st_v * (tkn option S_Ref.t)
type et = pt * reg * rcd_tkn
let st_ini () = (Hashtbl.create 10,Stack.create ())
let err s = raise (Failure s)
let ( *| ) o e =
  ( match o with
    | Some x -> x
    | None -> err e )
let ( |+| ) a b = Array.append a b
let unt () = [| |]
let to_sgn r =
  ( match r with
    | Reg r -> r )
let p_a r =
  ( match r with
    | P_A r -> r
    | _ -> err "p_a 0" )
let reg () = Reg (sgn ())
let rec print_asm d a =
  ( match !a with
    | Ret r -> d^"∎ \\ "^(print_rcd_ptn print_reg r)^"\n"
    | Nxt (n1,p2) ->
      let s1 =
        ( match n1 with
          | Id (r1,r2) -> d^"» $ "^(print_arr r2 r1)
          | Prj (i,r0,r1) -> d^"» ◃ "^(string_of_int i)^" "^(print_arr r1 r0)
          | Rm r0 -> d^"» ~| "^(print_arr (P_A r0) (P_Rc [||]))
          | Rpc (rs,r) -> d^"» $+ "^(print_arr (P_A r) (P_Rc (Array.map (fun x -> P_A x) rs)))
          | Agl (r0,r1,is,ps) ->
            let s0 = d^"∐ "^(Util.string_of_list "," string_of_int is)^(print_arr r1 r0) in
            let ss = Array.fold_left
                (fun ss (p,_) ->
                   let s1 = print_asm ("\t"^d) p in
                   ss^s1
                )
                "" ps in
            s0^ss
          | Call (r0,r1,r2) ->
            d^"» ◂ "^(print_arr (P_Rc [|(P_A r1);r2|]) r0)
          | HCall (_,_) -> err "print_asm 0"
          | Prd (_,_,_,_) -> err "print_asm 1"
          | Nd_Clj (_,_,_,_) -> err "print_asm 2"
          | Ini (r0,k) -> d^"» ~ "^(print_rcd_tkn k)^" \\ "^(print_rcd_ptn print_reg (P_A r0))^"\n"
        ) in
      let s2 = print_asm d p2 in
      s1^s2
  )
and print_arr r0 r1 =
  "\\ "^(print_rcd_ptn print_reg r0)^" ⊢ "^(print_rcd_ptn print_reg r1)^"\n"
and print_reg r =
  ( match r with
    | Reg r -> "r"^(Sgn.print r)
  )
and print_rcd_ptn f rp =
  ( match rp with
    | P_A r -> f r
    | P_Rc ps -> "{ "^(Util.string_of_list " " (print_rcd_ptn f) (Array.to_list ps))^" }"
    | P_Ro (ps,pt) ->
      "{ "^(Util.string_of_list " " (print_rcd_ptn f) (Array.to_list ps))^"<"^(f pt)^" }"
  )
and print_rcd_tkn k =
  ( match k with
    | Rcd_Tkn k -> print_tkn k
    | Rcd_Rcd r ->
      "{ "^(Util.string_of_list " " print_rcd_tkn (Array.to_list r))^" }"
  )
and print_tkn k =
  ( match k with
    | Tkn_Stg s -> "\""^s^"\""
    | Tkn_Z z -> string_of_int z
    | Tkn_Bol b -> if b then "t" else "f"
    | Tkn_Sgn p -> "&."^(Sgn.print p)
    | Tkn_CoP (i,r) -> "∠["^(string_of_int i)^","^(print_rcd_tkn r)^"]"
    | Tkn_P (_,_) -> err "print_tkn 0"
    | Tkn_Fnc Pls -> "+"
    | Tkn_Fnc Mlt -> "*"
    | Tkn_Fnc Mns -> "-"
    | Tkn_Fnc Cmp -> ">="
    | Tkn_Fnc Eq -> "="
    | Tkn_Fnc (Inj i) -> "∠["^(string_of_int i)^"]"
    | Tkn_Fnc (Cho i) -> "\\["^(string_of_int i)^"]"
    | Tkn_Fnc Fix -> "@"
    | Tkn_Fnc Exn -> "?"
    | Tkn_Fnc (Fnc(_,_)) -> "→["^"]"
    | Tkn_Fnc (Clj(_,_,_)) -> "|→["^"]"
  )
let rec print_exp_ptn ep =
  ( match ep with
    | Exp_Rcd r -> "{ "^(Util.string_of_list " " print_exp_ptn (Array.to_list r))^" }"
    | Exp_Atm e -> print_exp e
  )
and print_exp e =
  ( match e with
    | Prj (i,ep) -> (print_exp_ptn ep)^"◃"^(string_of_int i)
    | Inj i -> "↑["^(string_of_int i)^"]"
    | Cho i -> "↓["^(string_of_int i)^"]"
    | Rot -> "$"
    | Atm Pls -> "+"
    | Atm Mlt -> "*"
    | Atm Mns -> "-"
    | Atm Cmp -> "≤"
    | Atm Eq -> "="
    | Atm Fix -> "@"
    | Atm Exn -> "?"
    | Atm (Etr s) -> s
    | Z z -> (string_of_int z)
    | Stg s -> "\""^s^"\""
    | App (e1,ep2) -> "("^(print_exp e1)^"◂"^(print_exp_ptn ep2)^")"
  )
let print_g nm =
  StgMap.fold
    (fun n (p,r0) c ->
       c^"§+0 "^n^" \\ "^(print_rcd_ptn print_reg r0)^
       " ≒ \n"^(print_asm "\t" p))
    nm ""
let ret p =
  ( match !p with
    | Ret rp -> rp
    | _ -> err "ret 0" )
let get_r (rv:st_v) r =
  let k =
    ( try Some (Hashtbl.find rv r)
      with _ -> None ) in
  Hashtbl.remove rv r;
  k
let get_rs rv rs =
  Array.map (fun r -> get_r rv r *| "get_rs 0") rs
let set_r rv r k0 =
  let k1 = get_r rv r in
  ( match k1 with
    | None -> Hashtbl.add rv r k0
    | Some _ -> err "set_r 0" )
let set_rs rv rs ks =
  Array.mapi
    (fun i k ->
       ( match k with
         | None -> ()
         | Some k -> set_r rv rs.(i) k))
    ks
let free_r rv r = (get_r rv r) *| "free_r 0"
let free_rs rv rs =
  let rl = Array.map (fun x -> free_r rv x) rs in
  rl (*
let free_src rv s =
  ( match s with
    | Src_Mno r -> free_r rv r
    | Src_Rcd rs -> free_rs rv rs ) *)
let free_v rv = Hashtbl.clear rv
let alc_r _ = reg ()
let add_r rv k =
  let r = alc_r rv in
  let _ = set_r rv r k in
  r
let rec get_ptn rv rp ap ai =
  ( match ai with
    | `None ->
      ( match rp with
        | P_Rc as0 ->
          Rcd_Rcd (Array.map (fun r -> get_ptn rv r ap `None) as0)
        | P_Ro (as0,a1) ->
          let (xs0,x1) = (
            Array.map (fun r -> get_ptn rv r ap `None) as0,
            get_r rv a1 *| "get_ptn 2") in
          ( match x1 with
            | Rcd_Rcd xt -> Rcd_Rcd (xs0 |+| xt)
            | _ -> err "get_ptn 4" )
        | P_A a0 -> (get_r rv a0 *| "get_ptn 3"))
    | `Some [] ->
      ( match rp with
        | P_Rc _ -> err "get ptn 5"
        | P_Ro _ -> err "get_ptn 6"
        | P_A a0 ->
          ( match get_r rv a0 *| "err 28" with
            | Rcd_Tkn Tkn_CoP(m1,p3) ->
              let kx = p3 in
              ap := m1; kx
            | Rcd_Tkn Tkn_Z z ->
              if z=0 then ( ap := 0; Rcd_Rcd [| |] )
              else ( ap:= 1; Rcd_Rcd [| |])
            | _ -> err "err 19" )
      )
    | `Some (hd::tl) ->
      ( match rp with
        | P_Rc as0 ->
          Rcd_Rcd ( Array.mapi
                      (fun i r ->
                         if i=hd then
                           get_ptn rv r ap (`Some tl)
                         else
                           get_ptn rv r ap `None )
                      as0 )
        | P_Ro (as0,a1)->
          let (xs0,x1) = (
            ( Array.mapi
                (fun i r ->
                   if i=hd then
                     get_ptn rv r ap (`Some tl)
                   else
                     get_ptn rv r ap `None )
                as0 ),
            get_r rv a1 *| "get_ptn 2") in
          ( match x1 with
            | Rcd_Rcd xt -> Rcd_Rcd (xs0 |+| xt)
            | _ -> err "get_ptn 4" )
        | _ -> err "get_ptn 6" )
  )
let rec alc_ptn rp =
  ( match rp with
    | P_A _ ->
      let r = reg () in
      P_A r
    | P_Rc rs ->
      let rs1 = Array.map
          (fun ri ->
             let r = alc_ptn ri in
             r) rs in
      P_Rc rs1
    | P_Ro (rs,_) ->
      let rs1 = Array.map
          (fun ri ->
             let r = alc_ptn ri in
             r) rs in
      let rt1 = reg () in
      P_Ro(rs1,rt1) )
let rec set_ptn rv rp kp =
  ( match rp,kp with
    | P_A r,k -> set_r rv r k
    | P_Rc rs,Rcd_Rcd ks ->
      let _ = Array.mapi (fun i r -> set_ptn rv r (ks.(i))) rs in
      ()
    | P_Ro (rs,r0),Rcd_Rcd ks ->
      let l = Array.length rs in
      let (ks0,ks1) = (BatArray.head ks l,BatArray.tail ks l) in
      let _ = Array.mapi (fun i r -> set_ptn rv r ks0.(i)) rs in
      set_r rv r0 (Rcd_Rcd ks1)
    | _ -> err "set_ptn 0" )
let rec add_ptn rv kp =
  ( match kp with
    | Rcd_Tkn k ->
      let r = (add_r rv (Rcd_Tkn k)) in
      P_A r
    | Rcd_Rcd ks ->
      let rp =
        Array.fold_left
          (fun rp r ->
             let ri = add_ptn rv r in
             rp |+| [|ri|])
          [||] ks in
      P_Rc rp )
let rec get_idx is kp =
  ( match is,kp with
    | [],_ -> kp
    | hd::tl,Rcd_Rcd ps -> get_idx tl ps.(hd)
    | _ -> err "get_idx" )
let evo p0 rv cs =
  
let rec run p0 rv cs : rcd_tkn =
  (* Util.pnt dbg "enter run:\n"; *)
  ( match !p0 with
    | Ret r1 ->
      let k1 = get_ptn rv r1 (ref 0) `None in
      if Stack.is_empty cs then k1
      else
        let hd = Stack.pop cs in
        ( match hd with
          | CS (p0,r0,rv1) ->
            let _ = set_ptn rv1 r0 k1 in
            Hashtbl.clear rv;
            run p0 rv1 cs
          | _ -> raise (Failure "vm1.run:0")
        )
    | Nxt (o1,p1) ->
      ( match o1 with
        | Id (r1,r2) ->
          let k2 = (get_ptn rv r2 (ref 0) `None) in
          let _ = set_ptn rv r1 k2 in
          run p1 rv cs
        | Rpc (rs,r1) ->
          let k1 = get_r rv r1 *| "run 0" in
          let _ = set_rs rv rs (Array.init (Array.length rs) (fun _ -> Some k1)) in
          run p1 rv cs
        | Rm r0 ->
          let _ = free_r rv r0 in
          run p1 rv cs
        | Agl (rp1,rp2,is,ps) ->
          let m0 = ref 0 in
          let kp = get_ptn rv rp2 m0 (`Some is) in
          let l = Hashtbl.create 10 in
          let (sp,ax) = ps.(!m0) in
          let _ = set_ptn l ax kp in
          Stack.push (CS(p1,rp1,rv)) cs;
          run sp l cs
        | Call (rp0,r1,rp2) ->
          let k_f = get_r rv r1 *| "err 23" in
          let kx = (get_ptn rv rp2 (ref 0) `None) in
          ( match rp0,k_f,kx with
            | P_A r0,Rcd_Tkn Tkn_Fnc Mns,Rcd_Tkn Tkn_Z z ->
              let _ = set_r rv r0 (Rcd_Tkn (Tkn_Z (-z))) in
              run p1 rv cs
            | P_A r0,Rcd_Tkn Tkn_Fnc Inj i,kx ->
              let _ = set_r rv r0 (Rcd_Tkn (Tkn_CoP (i,kx))) in
              run p1 rv cs
            | _,Rcd_Tkn Tkn_Fnc Cho _,_ -> err "err 7"
            | _,Rcd_Tkn Tkn_Fnc Exn,_ -> err "err 8"
            | _,Rcd_Tkn Tkn_Fnc Fix,_ -> err "err 9"
            | _,Rcd_Tkn Tkn_Fnc (Fnc (pa,ps)),kx ->
              let l = Hashtbl.create 10 in
              let _ = set_ptn l ps kx in
              Stack.push (CS(p1,rp0,rv)) cs;
              run pa l cs
            | _,Rcd_Tkn Tkn_Fnc (Clj (_,_,_)),_ -> err "run 3"
            | P_A r0,Rcd_Tkn Tkn_Fnc Pls,Rcd_Rcd [|(Rcd_Tkn Tkn_Z z1);(Rcd_Tkn Tkn_Z z2)|] ->
              let _ = set_r rv r0 (Rcd_Tkn (Tkn_Z (z1+z2))) in
              run p1 rv cs
            | P_A r0,Rcd_Tkn Tkn_Fnc Mlt,Rcd_Rcd [|(Rcd_Tkn Tkn_Z z1);(Rcd_Tkn Tkn_Z z2)|] ->
              let _ = set_r rv r0 (Rcd_Tkn (Tkn_Z (z1*z2))) in
              run p1 rv cs
            | P_A r0,Rcd_Tkn Tkn_Fnc Cmp,Rcd_Rcd [|(Rcd_Tkn Tkn_Z z1);(Rcd_Tkn Tkn_Z z2)|] ->
              let b = if z1<=z2 then 1 else 0 in
              let _ = set_r rv r0 (Rcd_Tkn (Tkn_Z b)) in
              run p1 rv cs
            | P_A r0,Rcd_Tkn Tkn_Fnc Eq,Rcd_Rcd [|x;y|] ->
              let b = if x=y then 1 else 0 in
              let _ = set_r rv r0 (Rcd_Tkn (Tkn_Z b)) in
              run p1 rv cs
            | _ -> err "err 38"
          )
        | HCall (_,_) ->
          (* let (y1,y2) = (sgn(),sgn()) in
             let (kf1,kx1,kf2,kx2) = (get_k v f1,get_k *) raise (Failure "vm1.run:7")
        | Prd (_,_,_,_) -> err "err 10"
        | Nd_Clj (_,_,_,_) -> err "err 11"
        | Ini (r0,k) ->
          let _ = set_r rv r0 k in
          run p1 rv cs
        | Prj(i,r1,r2) ->
          let k0 = get_ptn rv r2 (ref 0) `None in
          let ki = get_idx [i] k0 in
          let _ = set_ptn rv r1 ki in
          run p1 rv cs
      )
  )
and cmp (p1,p2) (p3,p4) =
  ( match !p2 with
    | Ret _ ->
      p2 := !p3;
      (p1,p4)
    | _ -> err "cmp 0"
  )
and cmps ps =
  ( match ps with
    | [] -> err "cmps 0"
    | (p1,p2)::[] -> (p1,p2)
    | (p1,p2)::(p3,p4)::tl -> cmp (p1,p2) (cmps ((p3,p4)::tl))
  )
let rec mrg_ptn (m:'a->'b->'c) (rp1:'a rcd_ptn) (rp2:'b rcd_ptn) : 'c rcd_ptn =
  ( match rp1,rp2 with
    | P_A r1,P_A r2 ->
      P_A (m r1 r2)
    | P_Rc rs1,P_Rc rs2 ->
      P_Rc (Array.mapi (fun i r -> mrg_ptn m r (rs2.(i))) rs1)
    | P_Ro (rs1,rt1),P_Ro (rs2,rt2) ->
      P_Ro (Array.mapi (fun i r -> mrg_ptn m r (rs2.(i))) rs1,(m rt1 rt2))
    | _ -> err "mrg_ptn 0"
  )
let rec app_ptn (f:'a->'b) (rp:('a rcd_ptn)) : ('b rcd_ptn) =
  ( match rp with
    | P_A r -> P_A (f r)
    | P_Rc rs -> P_Rc (Array.map (app_ptn f) rs)
    | P_Ro (rs,rt) -> P_Ro(Array.map (app_ptn f) rs,f rt)
  )
let rec mrg_ptns (rps:('a rcd_ptn) list) : ('a array) rcd_ptn =
  ( match rps with
    | [] -> err "mrg_ptns 0"
    | p0::[] -> app_ptn (fun x -> [|x|]) p0
    | p0::p1::tl -> mrg_ptn (fun x a -> [|x|] |+| a) p0 (mrg_ptns (p1::tl))
  )
let rpc (n:int) (r0:reg rcd_ptn) =
  let rs = Array.init n (fun _ -> alc_ptn r0) in
  let rsm = mrg_ptns (Array.to_list rs) in
  let f = fun x r -> (x,r) in
  let rsmp = mrg_ptn f r0 rsm in
  let rec f r0 =
    ( match r0 with
      | P_A (r,rs) ->
        [Rpc(rs,r)]
      | P_Rc rr ->
        Array.fold_left
          (fun x r -> (f r)@x)
          [] rr
      | P_Ro (rr,(rt0,rts)) ->
        let x0 =
          Array.fold_left
            (fun x r -> (f r)@x)
            [] rr in
        let x1 = Rpc(rts,rt0) in
        x1::x0
    ) in
  (rs,f rsmp)
let rec asm l r1 =
  ( match l with
    | [] ->
      let p0 = ref (Ret r1) in
      (p0,p0)
    | hd::tl ->
      let (p0,p1) = asm tl r1 in
      let p2 = ref (Nxt(hd,p0)) in
      (p2,p1)
  )
let rec asm_of_rm rp =
  ( match rp with
    | P_Rc rs ->
      Array.fold_left
        (fun a r ->
           let a1 = asm_of_rm r in
           a |+| a1 )
        (unt ()) rs
    | P_Ro (rs,rt) ->
      let a1 =
        Array.fold_left
          (fun a r ->
             let a1 = asm_of_rm r in
             a |+| a1 )
          (unt ()) rs in
      let a2 = [|Rm(rt)|] in
      a1 |+| a2
    | P_A r ->
      [| Rm(r) |]
  )
let rec net_of_g g =
  let nm =
    BatList.fold_left
      (fun nm e ->
         match e with
         | Types.Etr(_,(name,_,_,_)) ->
           let r0 = P_A (reg ()) in
           StgMap.add name ((ref (Ret (P_Rc [||]))),r0) nm
         | Etr_Clq(_,l) ->
           BatList.fold_left
             (fun r (name,_,_,_) ->
                let r0 = P_A (reg ()) in
                StgMap.add name ((ref (Ret (P_Rc [||]))),r0) r)
             nm l
         | _ -> raise (Failure "err10"))
      StgMap.empty g in
  let _ = BatList.fold_left
      (fun _ e ->
         match e with
         | Types.Etr(_,(name,_,_,f)) ->
           let (px,r0) =
             try (StgMap.find name nm)
             with _ -> err "err9.1" in
           let (p0,_) = net_of_code nm r0 (code_of_vh f) in
           px := !p0;
           ()
         | Etr_Clq(_,l) ->
           BatList.fold_left
             (fun _ (name,_,_,f) ->
                let (pq,r0) =
                  try (StgMap.find name nm)
                  with _ -> err "err:p1" in
                let (p0,_) = net_of_code nm r0 (code_of_vh f) in
                pq := !p0;
                ())
             () l
         | _ -> err "err10")
      () g in
  nm
and net_of_code nm r0 c : (pt * pt)=
  Util.pnt dbg ("enter net_of_code :");
  ( match c with
    | V (v1,v2) ->
      let (pm0,pm1) = net_of_code nm r0 v1 in
      let r1 = ret pm1 in
      let (pm2,pm3) = net_of_code nm r1 v2 in
      pm1 := !pm2;
      (pm0,pm3)
    | H _ -> raise (Failure "vm2:a1")
    | E n1 ->
      let (p1,p2) = net_of_exp_ptn nm r0 n1 in
      (p1,p2)
    | P (_,_) -> raise (Failure "vm2:a2")
    | A (n1,ix,l) ->
      let (p1,p2) = net_of_exp_ptn nm r0 n1 in
      let r2 = ret p2 in
      let la = Array.map
          (fun c ->
             let rp = alc_ptn r2 in
             (rp,net_of_code nm rp c))
          l in
      let (_,(_,p0_2)) = la.(0) in
      let r3 = ret p0_2 in
      let r4 = alc_ptn r3 in
      let n1 = Agl (r4,r2,ix,Array.map (fun (rp,(p,_)) -> (p,rp)) la) in
      let n2 = Ret r4 in
      let p4 = ref n2 in
      let p5 = (Nxt(n1,p4)) in
      p2 := p5;
      (p1,p4)
    | F (_,_,_) -> err "vm2:a4"
  )
and net_of_exp_ptn nm r0 n0 : (pt * pt)=
  Util.pnt dbg ("enter net_of_exp_ptn 0:"^(print_exp_ptn n0)^"\n");
  let (p0,p1) =
    ( match n0 with
      | Exp_Atm e0 -> net_of_exp nm r0 e0
      | Exp_Rcd [||] ->
        let k = Rcd_Rcd [||] in
        let r1 = reg () in
        let p1 = ref (Ret (P_A r1)) in
        let p2 = Nxt(Ini (r1,k),p1) in
        (ref p2,p1)
      | Exp_Rcd es ->
        let (rs,l) = rpc (Array.length es) r0 in
        let l1 = asm l (P_Rc rs) in
        let pps = Array.mapi (fun i e -> net_of_exp_ptn nm rs.(i) e) es in
        let rs1 = Array.map (fun (_,p2) -> ret p2) pps in
        let (ps0,ps1) = cmps (Array.to_list pps) in
        ps1 := (Ret (P_Rc rs1));
        cmp l1 (ps0,ps1)
    ) in
  Util.pnt dbg ("return net_of_exp_ptn 0:"^(print_asm "" p0));
  (p0,p1)
and prj is rp =
  ( match is,rp with
    | [],_ -> rp
    | hd::tl,P_Rc rs ->
      prj tl rs.(hd)
    | hd::tl,P_Ro (rs,_) ->
      prj tl rs.(hd)
    | _ -> err "prj 0"
  )
and net_of_exp nm r0 n0 =
  (* Util.pnt true ("enter asm_of_tns_tl:"^(Print.print_tns_s n0)^"\n"); *)
  ( match n0 with
    | Prj (i,n1) ->
      let (p1,p2) = net_of_exp_ptn nm r0 n1 in
      let rp0 = ret p2 in
      let rp1 =
        ( try alc_ptn (prj [i] rp0)
          with _ -> P_A (reg ())) in
      let p3 = ref (Ret rp1) in
      let p4 = Nxt(Prj(i,rp1,rp0),p3) in
      p2 := p4;
      (p1,p3)
    | Inj i ->
      let k = Tkn_Fnc (Inj i) in
      let r1 = reg () in
      let p1 = ref (Ret (P_A r1)) in
      let p2 = Nxt(Ini(r1,Rcd_Tkn k),p1) in
      (ref p2,p1)
    | Cho _ -> err "err 23"
    | Rot ->
      let r1 = alc_ptn r0 in
      let n1 = Id(r1,r0) in
      let p0 = ref (Ret r1) in
      let p1 = ref (Nxt(n1,p0)) in
      (p1,p0)
    | Atm Pls ->
      let k = Tkn_Fnc Pls in
      let r1 = reg () in
      let p1 = ref (Ret (P_A r1)) in
      let p2 = Nxt(Ini (r1,Rcd_Tkn k),p1) in
      (ref p2,p1)
    | Atm Mlt ->
      let k = Tkn_Fnc Mlt in
      let r1 = reg () in
      let p1 = ref (Ret (P_A r1)) in
      let p2 = Nxt(Ini (r1,Rcd_Tkn k),p1) in
      (ref p2,p1)
    | Atm Mns ->
      let k = Tkn_Fnc Mns in
      let r1 = reg () in
      let p1 = ref (Ret (P_A r1)) in
      let p2 = Nxt(Ini (r1,Rcd_Tkn k),p1) in
      (ref p2,p1)
    | Atm Cmp ->
      let k = Tkn_Fnc Cmp in
      let r1 = reg () in
      let p1 = ref (Ret (P_A r1)) in
      let p2 = Nxt(Ini (r1,Rcd_Tkn k),p1) in
      (ref p2,p1)
    | Atm Eq ->
      let k = Tkn_Fnc Eq in
      let r1 = reg () in
      let p1 = ref (Ret (P_A r1)) in
      let p2 = Nxt(Ini (r1,Rcd_Tkn k),p1) in
      (ref p2,p1)
    | Atm Fix ->
      let k = Tkn_Fnc Fix in
      let r1 = reg () in
      let p1 = ref (Ret (P_A r1)) in
      let p2 = Nxt(Ini(r1,Rcd_Tkn k),p1) in
      (ref p2,p1)
    | Atm Exn -> err "err 36"
    | Atm (Etr s) ->
      let (p0,r0) = StgMap.find s nm in
      let k = Tkn_Fnc (Fnc(p0,r0)) in
      let r1 = reg () in
      let p1 = ref (Ret (P_A r1)) in
      let p2 = Nxt(Ini(r1,Rcd_Tkn k),p1) in
      (ref p2,p1)
    | Z z ->
      let k = Tkn_Z z in
      let r1 = reg () in
      let p1 = ref (Ret (P_A r1)) in
      let p2 = Nxt(Ini (r1,Rcd_Tkn k),p1) in
      (ref p2,p1)
    | Stg s ->
      let k = Tkn_Stg s in
      let r1 = reg () in
      let p1 = ref (Ret (P_A r1)) in
      let p2 = Nxt(Ini (r1,Rcd_Tkn k),p1) in
      (ref p2,p1)
    | App (f,x) ->
      let (prs,pl) = rpc 2 r0 in
      let (px3,px4) = asm pl (P_Rc prs) in
      ( match prs with
        | [| r1 ; r2 |] ->
          let (p1,p2) = net_of_exp nm r1 f in
          let (p3,p4) = net_of_exp_ptn nm r2 x in
          let (r3,r4) = (ret p2,ret p4) in
          px4 := !p1; p2 := !p3;
          let r5 = reg () in
          let p5 = ref (Ret (P_A r5)) in
          let n2 = Call (P_A r5,p_a r3,r4) in
          let p6 = ref (Nxt(n2,p5)) in
          p4 := !p6;
          (px3,p5)
        | _ -> err "err 45" )
  )
and code_of_vh f =
  ( match f with
    | Types.C_V(f1,f2) ->
      let c1 = code_of_vh f1 in
      let c2 = code_of_vh f2 in
      V(c1,c2)
    | Types.C_H fs ->
      let cs = List.map code_of_vh fs in
      H (Array.of_list cs)
    | Types.C_E (_,o0,_) ->
      let ap = ref [] in
      let n1 = code_of_nd ap [] o0 in
      E n1
    | C_P (_,_) -> err "code_of_vh 0"
    | C_CoP((_,o0,_),l) ->
      let ap = ref [] in
      let n1 = code_of_nd ap [] o0 in
      let lc = List.map code_of_vh l in
      let la = Array.of_list lc in
      A(n1,!ap,la)
    | C_IO (_,_,_) -> err "code_of_vh 1"
  )
and code_of_nd ap is n =
  ( match n with
    | Agl n1 ->
      let nx2 = code_of_nd ap is n1 in
      ap := is;
      nx2
    | Opr_Z z -> Exp_Atm (Z z)
    | Opr_Name s ->
      if s="+" then Exp_Atm (Atm Pls)
      else if s="-" then Exp_Atm (Atm Mns)
      else if s="*" then Exp_Atm (Atm Mlt)
      else if s="=" then Exp_Atm (Atm Eq)
      else if s="@" then Exp_Atm (Atm Fix)
      else if s="$" then Exp_Atm Rot
      else if s="?" then Exp_Atm (Atm Exn)
      else if s="&" then Exp_Atm (Atm (Etr "&"))
      else if s="std_le" then Exp_Atm (Atm Cmp)
      else Exp_Atm (Atm (Etr s))
    | Opr_Rcd ns ->
      let cs = Array.mapi (fun i x -> code_of_nd ap (is@[i]) x) (Array.of_list ns) in
      Exp_Rcd cs
    | Opr_App (n1,n2) ->
      let (e1,e2) = (code_of_nd ap is n1,code_of_nd ap is n2) in
      ( match e1 with
        | Exp_Atm e1 ->
          Exp_Atm (App(e1,e2))
        | _ -> err "code_of_nd 0" )
    | Prj (o1,i) ->
      let e1 = code_of_nd ap is o1 in
      Exp_Atm(Prj(i,e1))
    | Opr_Inj i ->
      Exp_Atm (Inj i)
    | Opr_Cho i ->
      Exp_Atm (Cho i)
    | Opr_Stg s ->
      Exp_Atm (Stg s)
  )
