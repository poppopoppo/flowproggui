open Types
open Util
let dbg = true
type 'a rcd_ptn =
  | P_R of ('a rcd_ptn ) array * 'a
  | P_A of 'a
  type 'p rcd_tkn =
    | Rcd_Rcd of 'p rcd_tkn array
    | Rcd_Tkn of 'p tkn
  and 'p tkn =
    | Tkn_Stg of string
    | Tkn_Z of int
    | Tkn_Z2 of bool
    | Tkn_Sgn of Sgn.t
    | Tkn_CoP of int * ('p rcd_tkn)
    | Tkn_P of ('p array) * ('p rcd_tkn)
    | Tkn_Fnc of 'p tkn_fnc
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
    | Fnc of 'p (* jmp_ptr arg_ptr *)
    | Clj of 'p * ('p rcd_tkn) (* jmp_ptr arg0 { arg0 x } *)
type reg = Reg of Sgn.t
type regs = reg array
type reg_ptn = reg rcd_ptn
let rec map_rcd_ptn f p =
  ( match p with
    | P_A a -> P_A (f a)
    | P_R (ps,pt) -> P_Ro (Array.map (map_rcd_ptn f) ps,f pt)
  )
let rec print_rcd_ptn f rp =
  ( match rp with
    | P_A r -> f r
    | P_R (ps,pt) ->
      "{ "^(Util.string_of_list " " (print_rcd_ptn f) (Array.to_list ps))^"<"^(f pt)^" }"
  )
module type R_T = sig
  type reg
  type 'k st_v
  val reg : 'k st_v -> reg
  val ini_st_v : unit -> 'k st_v
  val print_reg : reg -> string
  val print_st_v : ('k -> string) -> 'k st_v -> string
  val get_r : 'k st_v -> reg -> 'k option
  val set_r : 'k st_v -> reg -> 'k -> unit
  val free_v : 'k st_v -> ((reg * 'k) list)
  val copy_v : 'k st_v -> 'k st_v
  val add_r : 'k st_v -> 'k -> reg
end
module Reg_Sgn = struct
  type reg = Reg of Sgn.t
  type 'k st_v = (reg , 'k) Hashtbl.t
  let reg _ = Reg (sgn ())
  let ini_st_v () = Hashtbl.create 10
  let print_reg r =
    ( match r with
      | Reg r -> "r"^(Sgn.print r)
    )
  let print_st_v f v =
    Hashtbl.fold
      (fun r k s ->
         s^","^(print_reg r)^"~"^(f k))
      v ""
  let get_r rv r =
    let k =
      ( try Some (Hashtbl.find rv r)
        with _ -> None ) in
    Hashtbl.remove rv r;
    k
  let set_r rv r k0 =
    let k1 = get_r rv r in
    ( match k1 with
      | None -> Hashtbl.add rv r k0
      | Some _ -> err "set_r 0" )
  let free_v rv =
    Hashtbl.fold
      (fun r k l ->
         Hashtbl.remove rv r;
         (r,k)::l)
      rv []
  let copy_v rv = Hashtbl.copy rv
  let alc_r _ = reg ()
  let add_r rv k =
    let r = alc_r rv in
    let _ = set_r rv r k in
    r
end
module Reg_Int = struct
  type reg = int
  type 'k st_v = (('k option) array) ref
  let reg v =
    let r =
      Array.fold_left
        (fun i k ->
           ( match k,i with
             | None,`N i -> `S i
             | Some _,`N i -> `N (i+1)
             | _,`S i -> `S i
           ))
        (`N 0) !v in
    ( match r with
      | `S i -> i
      | `N i ->
        v := !v |+| [|None|];
        i )
  let ini_st_v () = ref [||]
  let print_reg r = "r"^(string_of_int r)
  let print_st_v f v =
    "{' "^
    (Util.string_of_list " "
       (fun k ->
          match k with
          | None -> "_"
          | Some k -> (f k))
       (Array.to_list !v))^
    "}"
  let get_r v r =
    let k =
      ( try (!v).(r)
        with _ -> None ) in
    (!v).(r)<-None;
    k
  let set_r v r k =
    ( match (!v).(r) with
      | None ->
        (!v).(r)<-(Some k)
      | Some _ -> err "set_r 0" )
  let free_v v =
    let (l,_) =
      Array.fold_left
        (fun (l,i) k ->
           ( match k with
             | None -> (l,i+1)
             | Some k ->
               (!v).(i)<-None;
               ((i,k)::l,i+1)))
        ([],0) !v in
    l
  let copy_v v = ref (Array.copy ! v)
  let add_r v k =
    let r = reg v in
    set_r v r k;
    r
end
module Net (R : R_T) = struct
  include R
  type regs = reg array
  type reg_ptn = reg rcd_ptn
  and ptr = tkn ref
  and nd =
    | Id of reg * regs
    | Prj of reg * regs
    | Cns of regs * reg
    | Rm of reg
    | Agl of reg * reg_ptn * (asm array)
    | Call of reg_ptn * reg * reg_ptn
    | Prd of reg * regs * regs * (pt array)
    | Nd_Clj of reg * regs * regs * pt
    | Ini of reg * (asm rcd_tkn)
    | Ret of reg_ptn
  and asm = reg_ptn * (nd array ref)
  and pt = int
  type code =
    | V of code * code
    | H of code * code
    | type rcd_tkn_v = rcd_tkn R.st_v
  type cs_v = (reg * rcd_tkn) list
  type tkn_ptn = tkn rcd_ptn
  type st = rcd_tkn_v * (cs Stack.t)
  and cs =
    | CS_il of pt * regs
    | CS of pt * regs * cs_v (* return-plc * return-reg *)
    | CS_L of pt * regs * cs_v * (tkn option S_Ref.t)
    | CS_R of pt * regs * cs_v * (tkn option S_Ref.t)
  type et = pt * reg * (rcd_tkn st_v) * rcd_tkn
  let st_ini () = (R.ini_st_v (),Stack.create ())
  let p_a r =
    ( match r with
      | P_A r -> r
      | _ -> err "p_a 0" )
  let reg v = R.reg v
  let rec print_asm d a =
    Array.fold_left
      (fun s o -> s^(print_nd d o))
      "" a
  and print_line a = print_nd 0 a.(0)
  and print_nd d n1 =
    ( match n1 with
      | Id (r1,rs) -> d^"id "^(print_reg r1)^" ⊢ "^(Util.string_of_list " " print_reg (Array.of_list rs))^"\n"
      | Prj (r0,rs) -> d^"prj "^(print_reg r1)^" ⊢ "^(Util.string_of_list " " print_reg (Array.of_list rs))^" <\n"
      | Rm r0 -> d^"rm "^(print_reg r0)^"\n"
      | Agl (r0,rs,ps) ->
        d^"agl "^(Util.string_of_list " " string_of_int (Array.of_list ps))^(print_reg r0)^(Util.string_of_list " " print_reg (Array.of_list rs))^"\n"
      | Call (r0,r1,r2) ->
        d^"call "
      | HCall (_,_) -> err "print_asm 0"
      | Prd (_,_,_,_) -> err "print_asm 1"
      | Nd_Clj (_,_,_,_) -> err "print_asm 2"
      | Ini (r0,k) ->
        d^"ini "^(print_rcd_tkn k)^" \\ "^(print_reg r0)^"\n"
    )
  and print_arr r0 r1 =
    "\\ "^(print_rcd_ptn print_reg r0)^" ⊢ "^(print_rcd_ptn print_reg r1)^"\n"
  and print_reg r = R.print_reg r
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
  let get_r rv r = R.get_r rv r
  let get_rs rv rs =
    Array.map (fun r -> get_r rv r *| "get_rs 0") rs
  let set_r rv r k0 = R.set_r rv r k0
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
    rl
  let free_v rv = R.free_v rv
  let set_v rv l =
    List.fold_left
      (fun _ (r,k) ->
         R.set_r rv r k)
      () l
  let alc_r v = reg v
  let add_r rv k = R.add_r rv k
  let rec get_ptn rv rp =
    ( match rp with
      | P_Ro (as0,a1) ->
        let (xs0,x1) = (
          Array.map (fun r -> get_ptn rv r ap `None) as0,
          get_r rv a1 *| "get_ptn 2") in
        ( match x1 with
          | Rcd_Rcd xt -> Rcd_Rcd (xs0 |+| xt)
          | _ -> err "get_ptn 4" )
      | P_A a0 -> (get_r rv a0 *| "get_ptn 3"))
  let rec alc_ptn v rp =
    ( match rp with
      | P_A _ ->
        let r = reg v in
        P_A r
      | P_R (rs,_) ->
        let rs1 = Array.map
            (fun ri ->
               let r = alc_ptn v ri in
               r) rs in
        let rt1 = reg v in
        P_R(rs1,rt1) )
  let rec set_ptn rv rp kp =
    ( match rp,kp with
      | P_A r,k -> set_r rv r k
      | P_R (rs,r0),Rcd_Rcd ks ->
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
        P_R rp )
  let rec unt_ptn v0 rp =
    ( match rp with
      | P_A r ->
        let _ = set_r v0 r (Rcd_Rcd [||]) in
        ()
      | P_Ro (rs,rt) ->
        let _ = Array.map (unt_ptn v0) rs in
        unt_ptn v0 (P_A rt)
    )
  let rec get_idx is kp =
    ( match is,kp with
      | [],_ -> kp
      | hd::tl,Rcd_Rcd ps -> get_idx tl ps.(hd)
      | _ -> err "get_idx" )
  (* let evo p0 rv cs = () *)
  and run c p0 rv cs =
    ( match c.(p0) with
      | Ret rs ->
        let ks = get_rs rv rs in
        if Stack.is_empty cs then ks
        else
          let hd = Stack.pop cs in
          ( match hd with
            | CS_il (p1,r0) ->
              let _ = free_rs rv r0 ks in
              run c p1 rv cs
            | CS (p1,r0,l) ->
              let _ = free_v rv in
              let _ = set_rs rv r0 ks in
              let _ = set_v rv l in
              run c p1 rv cs
            | _ -> raise (Failure "vm1.run:0")
          )
      | Id (r1,r2) ->
        let k1 = get_r rv r1 in
        let _ = Array.map (fun r -> set_r rv r k1) r2 in
        run c p1 rv cs
      | Rm r0 ->
        let _ = free_r rv r0 in
        run c p1 rv cs
      | Agl (r0,ps) ->
        let m0 = ref 0 in
        let k0 = get_r rv r0 *| "err 28" in
        ( match k0 with
          | Rcd_Tkn Tkn_CoP(m1,p3) ->
            let kx = p3 in
            let _ = set_r rv r0 kx in
            Stack.push (CS_il(p0+1));
            run ps.(m1) rv cs
          | Rcd_Tkn Tkn_Z z ->
            let m1 = if z=0 then 0 else 1 in
            let kx = Rcd_Rcd [||] in
            let _ = set_r rv r0 kx in
            Stack.push (CS_il(p0+1));
            run ps.(m1) rv cs
          | _ -> err "err 19" )
      | Call (rp0,r1,rp2) ->
        let k_f = get_r rv r1 *| "err 23" in
        let kx = (get_rs rv rp2 (ref 0) `None) in
        ( match rp0,k_f,kx with
          | [|r0|],Rcd_Tkn Tkn_Fnc Mns,[|Rcd_Tkn Tkn_Z z|] ->
            let _ = set_r rv r0 (Rcd_Tkn (Tkn_Z (-z))) in
            run c (p0+1) rv cs
          | [|r0|],Rcd_Tkn Tkn_Fnc Inj i,[|kx|] ->
            let _ = set_r rv r0 (Rcd_Tkn (Tkn_CoP (i,kx))) in
            run (p0+1) rv cs
          | _,Rcd_Tkn Tkn_Fnc Cho _,_ -> err "err 7"
          | _,Rcd_Tkn Tkn_Fnc Exn,_ -> err "err 8"
          | _,Rcd_Tkn Tkn_Fnc Fix,_ -> err "err 9"
          | _,Rcd_Tkn Tkn_Fnc (Fnc (pa,ps)),_ ->
            let l = R.free_v rv in
            let _ = set_rs rv ps kx in
            Stack.push (CS(p1,rp0,l)) cs;
            run c pa rv cs
          | _,Rcd_Tkn Tkn_Fnc (Clj (_,_,_)),_ -> err "run 3"
          | [|r0|],Rcd_Tkn Tkn_Fnc Pls,[|(Rcd_Tkn Tkn_Z z1);(Rcd_Tkn Tkn_Z z2)|] ->
            let _ = set_r rv r0 (Rcd_Tkn (Tkn_Z (z1+z2))) in
            run c (p0+1) rv cs
          | [|r0|],Rcd_Tkn Tkn_Fnc Mlt,[|(Rcd_Tkn Tkn_Z z1);(Rcd_Tkn Tkn_Z z2)|] ->
            let _ = set_r rv r0 (Rcd_Tkn (Tkn_Z (z1*z2))) in
            run c (p0+1) rv cs
          | [|r0|],Rcd_Tkn Tkn_Fnc Cmp,[|(Rcd_Tkn Tkn_Z z1);(Rcd_Tkn Tkn_Z z2)|] ->
            let b = if z1<=z2 then 1 else 0 in
            let _ = set_r rv r0 (Rcd_Tkn (Tkn_Z b)) in
            run c (p0+1) rv cs
          | [|r0|],Rcd_Tkn Tkn_Fnc Eq,[|x;y|] ->
            let b = if x=y then 1 else 0 in
            let _ = set_r rv r0 (Rcd_Tkn (Tkn_Z b)) in
            run c (p0;1) rv cs
          | _ -> err "err 38"
        )
      | HCall (_,_) -> err "vm1.run:7"
      | Prd (_,_,_,_) -> err "err 10"
      | Nd_Clj (_,_,_,_) -> err "err 11"
      | Ini (r0,k) ->
        let _ = set_r rv r0 k in
        run c p0+1 rv cs
      | Prj(r0,rs) ->
        let k0 = get_r rv r0 in
        ( match r0 with
          | Rcd_Rcd rs1 ->
            Array.mapi (fun i r -> set_r rv r rs1.(i)) rs
          | _ -> err "err 19" )
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
      | P_R (rs1,rt1),P_R (rs2,rt2) ->
        P_R (Array.mapi (fun i r -> mrg_ptn m r (rs2.(i))) rs1,(m rt1 rt2))
      | _ -> err "mrg_ptn 0"
    )
  let rec app_ptn (f:'a->'b) (rp:('a rcd_ptn)) : ('b rcd_ptn) =
    ( match rp with
      | P_A r -> P_A (f r)
      | P_R (rs,rt) -> P_R(Array.map (app_ptn f) rs,f rt)
    )
  let rec mrg_ptns (rps:('a rcd_ptn) list) : ('a array) rcd_ptn =
    ( match rps with
      | [] -> err "mrg_ptns 0"
      | p0::[] -> app_ptn (fun x -> [|x|]) p0
      | p0::p1::tl -> mrg_ptn (fun x a -> [|x|] |+| a) p0 (mrg_ptns (p1::tl))
    )
end
module NetSgn = Net(Reg_Sgn)
module NetInt = Net(Reg_Int)
open NetSgn
let rpc v0 (n:int) r0 =
  let rs = Array.init n (fun _ -> alc_ptn v0 r0) in
  let rsm = mrg_ptns (Array.to_list rs) in
  let f = fun x r -> (x,r) in
  let rsmp = mrg_ptn f r0 rsm in
  let rec f r0 =
    ( match r0 with
      | P_A (r,rs) ->
        [|Id(r,rs)|]
      | P_R (rr,(rt0,rts)) ->
        let x0 =
          Array.fold_left
            (fun x r -> (f r) |+| x)
            [||] rr in
        let x1 = Rpc(rts,rt0) in
        [|x1|] |+| x0
    ) in
  (rs,f rsmp)
let rec asm_of_rm rp =
  ( match rp with
    | P_R (rs,rt) ->
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
  let v0 = ini_st_v () in
  let nm =
    BatList.fold_left
      (fun nm e ->
         match e with
         | Types.Etr(_,(name,_,_,_)) ->
           let r0 = P_A (reg v0) in
           StgMap.add name ((ref (Ret (P_R ([||],[||])))),r0) nm
         | Etr_Clq(_,l) ->
           BatList.fold_left
             (fun r (name,_,_,_) ->
                let r0 = P_A (reg v0) in
                StgMap.add name ((ref (Ret (P_R ([||].[||])))),r0) r)
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
and net_of_code v0 nm r0 c =
  Util.pnt dbg ("enter net_of_code :");
  ( match c with
    | V (v1,v2) ->
      let (c1,p1) = net_of_code v0 nm r0 v1 in
      let (c2,p2) = net_of_code v0 nm p1 v2 in
      (c2,p2)
    | H _ -> raise (Failure "vm2:a1")
    | E n1 ->
      net_of_exp_ptn v0 nm r0 n1 inssss
    | P (_,_) -> raise (Failure "vm2:a2")
    | A (n1,ix,l) ->
      let (p1,p2) = net_of_exp_ptn nm r0 n1 in
      let r2 = ret p2 in
      let la = Array.map
          (fun c ->
             let rp = alc_ptn v0 r2 in
             (rp,net_of_code nm rp c))
          l in
      let (_,(_,p0_2)) = la.(0) in
      let r3 = ret p0_2 in
      let r4 = alc_ptn v0 r3 in
      let n1 = Agl (r4,r2,ix,Array.map (fun (rp,(p,_)) -> (p,rp)) la) in
      let n2 = Ret r4 in
      let p4 = ref n2 in
      let p5 = (Nxt(n1,p4)) in
      p2 := p5;
      (p1,p4)
    | F (_,_,_) -> err "vm2:a4"
  )
and net_of_exp_ptn v0 nm r0 n0 =
  Util.pnt dbg ("enter net_of_exp_ptn 0:"^(print_exp_ptn n0)^"\n");
  let (p0,p1) =
    ( match n0 with
      | Exp_Atm e0 -> net_of_exp v0 nm r0 e0
      | Exp_Rcd [||] ->
        let k = Rcd_Rcd [||] in
        let r1 = reg v0 in
        let p1 = P_A r1 in
        ([|Ini(r1,k)|],p1)
      | Exp_Rcd es ->
        let (rs,l) = rpc (Array.length es) r0 in
        let pps = Array.mapi (fun i e -> net_of_exp_ptn v0 nm rs.(i) e) es in
        let rs1 = Array.map (fun (_,p) -> ret p2) pps in
        let (ps0,ps1) = cmps (Array.to_list pps) in
        ps1 := (Ret (P_Rc rs1));
        cmp l1 (ps0,ps1)
    ) in
  Util.pnt dbg ("return net_of_exp_ptn 0:"^(print_asm "" p0));
  (p0,p1)
and net_of_exp v0 nm r0 n0 =
  (* Util.pnt true ("enter asm_of_tns_tl:"^(Print.print_tns_s n0)^"\n"); *)
  ( match n0 with
    | Rot ->
      ([||],r0)
    | Prj (i,n1) ->
      let (c1,p1) = net_of_exp_ptn v0 nm r0 n1 in
      ( match p1 with
        | P_R (rs,rt) ->
          let rc1 = Array.fold_left
              (fun (a,j) r ->
                 if i=j then (a,j+1)
                 else (a |+| rm r,j+1))
              rs in
          (c1 |+| rc1 |+| [|Rm rt|],rs.(i))
        | P_A r1 ->
          let a1 = Array.init (fun i -> reg v0 (i-1) in
          let o1 = Prj(r1,a1) in
          (c1 |+| [|o1|],P_A(a1.(i)))
      )
    | Atm a ->
      let k =
        ( match a with
          | Cho _ -> err "err 23"
          | Inj i -> Tkn_Fnc (Inj i)
          | Pls -> Tkn_Fnc Pls
          | Mlt -> Tkn_Fnc Mlt
          | Mns -> Tkn_Fnc Mns
          | Cmp -> Tkn_Fnc Cmp
          | Eq -> Tkn_Fnc Eq
          | Fix -> Tkn_Fnc Fix
          | Exn -> err "err 36"
          | Etr s ->
            let (p0,r0) = StgMap.find s nm in
            Tkn_Fnc (Fnc(p0,r0))
          | Z z -> Tkn_Z z
          | Stg s -> Tkn_Stg s
        ) in
      let r1 = reg v0 in
      let p1 = P_A r1 in
      ([|(Ini(r1,Rcd_Tkn k))|],p1)
    | App (f,x) ->
      let (prs,pl) = rpc v0 2 r0 in
      ( match prs with
        | [| r1 ; r2 |] ->
          let (cf,pf) = net_of_exp v0 nm r1 f in
          let (cx,px) = net_of_exp_ptn v0 nm r2 x in
          let r3 = reg v0 in
          let n2 = Call ([|r3|],p_a pf,p_a px) in
          (cf |+| cx |+| [|n2|],P_A r3)
        | _ -> err "err 45" )
  )
let rec idx_g nm =
  Util.pnt dbg "enter idx_g\n";
  let v0 = NetInt.ini_st_v () in
  let (nm1,h0) =
    StgMap.fold
      (fun _ (p,r) (nm1,h0) ->
         let _ = NetInt.free_v v0 in
         let _ = add_idx h0 v0 r in
         let pi = ref (NetInt.Ret (P_A 0)) in
         let nm1 = [|(p,(pi,r))|] |+| nm1 in
         (nm1,h0))
      nm ([||],Hashtbl.create 10) in
  let _ = Array.map
      (fun (p,(pi,r)) ->
         let _ = NetInt.free_v v0 in
         let ri = to_idx h0 r in
         (* Util.pnt dbg ("z 0:"^(NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^"\n"); *)
         let _ = NetInt.unt_ptn v0 ri in
         (* Util.pnt dbg ("z 1:"^(NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^"\n"); *)
         let _ = mk_h nm1 h0 v0 p in
         let pi1 = idx_of_net nm1 h0 p in
         (pi := !pi1; ()))
      nm1 in
  (nm1,h0,v0)
and mk_h nm0 h0 v0 p0 =
  Util.pnt dbg ("enter mk_h:"^
                (NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^","^
                (NetSgn.print_line p0)^"\n");
  ( match !p0 with
    | Ret r0 ->
      let _ = free_idx h0 v0 r0 in
      ()
    | Nxt(n1,p1) ->
      ( match n1 with
        | Id (r0,r1) ->
          let _ = free_idx h0 v0 r1 in
          let _ = add_idx h0 v0 r0 in
          mk_h nm0 h0 v0 p1
        | Prj (_,r0,r1) ->
          let _ = free_idx h0 v0 r1 in
          let _ = add_idx h0 v0 r0 in
          mk_h nm0 h0 v0 p1
        | Rm r0 ->
          let _ = free_idx h0 v0 (P_A r0) in
          mk_h nm0 h0 v0 p1
        | Rpc (rs0,r1) ->
          let _ = free_idx h0 v0 (P_A r1) in
          let _ = add_idx h0 v0 (P_Rc (Array.map (fun r -> P_A r) rs0)) in
          mk_h nm0 h0 v0 p1
        | Agl(r0,r1,_,ps) ->
          let _ = free_idx h0 v0 r1 in
          let _ =
            Array.map
              (fun (p,r0) ->
                 let _ = add_idx h0 v0 r0 in
                 mk_h nm0 h0 v0 p)
              ps in
          let _ = add_idx h0 v0 r0 in
          mk_h nm0 h0 v0 p1
        | Call(r0,r1,r2) ->
          let _ = free_idx h0 v0 (P_A r1) in
          let _ = free_idx h0 v0 r2 in
          let _ = add_idx h0 v0 r0 in
          mk_h nm0 h0 v0 p1
        | HCall(_,_) -> err "g 1"
        | Prd (_,_,_,_) -> err "g 2"
        | Nd_Clj(_,_,_,_) -> err "g 3"
        | Ini (r0,_) ->
          let _ = add_idx h0 v0 (P_A r0) in
          mk_h nm0 h0 v0 p1
      )
  )
and free_idx h0 v0 r =
  Util.pnt dbg ("enter free_idx:"^
                (NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^","^
                (print_rcd_ptn NetSgn.print_reg r)^"\n");
  let ri = to_idx h0 r in
  Util.pnt dbg ("ri="^(print_rcd_ptn NetInt.print_reg ri)^"\n");
  let _ = NetInt.get_ptn v0 ri (ref 0) `None in
  Util.pnt dbg ("v0="^(NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^"\n");
  ()
and add_idx h0 v0 r0 =
  Util.pnt dbg ("enter add_idx:"^
                (NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^","^
                (print_rcd_ptn NetSgn.print_reg r0)^"\n");
  ( match r0 with
    | P_A r ->
      let ri = NetInt.add_r v0 (NetInt.Rcd_Rcd [||]) in
      Hashtbl.add h0 r ri;
      ()
    | P_Rc rs ->
      let _ = Array.map (add_idx h0 v0) rs in
      ()
    | P_Ro (rs,rt) ->
      let _ = Array.map (add_idx h0 v0) rs in
      add_idx h0 v0 (P_A rt)
  );
  Util.pnt dbg ("v0="^(NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^"\n")
and idx_of_net m0 h0 p0 =
  ( match !p0 with
    | Ret r0 ->
      let ri0 = to_idx h0 r0 in
      ref (NetInt.Ret ri0)
    | Nxt(n1,p1) ->
      ( match n1 with
        | Id (r0,r1) ->
          let ri1 = to_idx h0 r1 in
          let ri0 = to_idx h0 r0 in
          let pi1 = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Id(ri0,ri1),pi1))
        | Prj (i,r0,r1) ->
          let ri1 = to_idx h0 r1 in
          let ri0 = to_idx h0 r0 in
          let pi1 = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Prj(i,ri0,ri1),pi1))
        | Rm r0 ->
          let ri0 = Hashtbl.find h0 r0 in
          let pi1 = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Rm ri0,pi1))
        | Rpc (rs0,r1) ->
          let ri1 = Hashtbl.find h0 r1 in
          let rsi0 = Array.map (Hashtbl.find h0) rs0 in
          let pi1 = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Rpc(rsi0,ri1),pi1))
        | Agl(r0,r1,is,ps) ->
          let ri1 = to_idx h0 r1 in
          let ri0 = to_idx h0 r0 in
          let psi =
            Array.map
              (fun (p,r0) ->
                 let r0i = to_idx h0 r0 in
                 let pi = idx_of_net m0 h0 p in
                 (pi,r0i))
              ps in
          let pi1 = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Agl(ri0,ri1,is,psi),pi1))
        | Call(r0,r1,r2) ->
          let ri1 = Hashtbl.find h0 r1 in
          let ri2 = to_idx h0 r2 in
          let ri0 = to_idx h0 r0 in
          let pi1 = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Call(ri0,ri1,ri2),pi1))
        | HCall(_,_) -> err "g 1"
        | Prd (_,_,_,_) -> err "g 2"
        | Nd_Clj(_,_,_,_) -> err "g 3"
        | Ini (r0,k) ->
          let ri0 = Hashtbl.find h0 r0 in
          let ki = idx_tkn m0 h0 k in
          let p1i = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Ini(ri0,ki),p1i))
      )
  )
and to_idx h0 r0 =
  map_rcd_ptn
    (fun x ->
       let ri = Hashtbl.find h0 x in
       ri)
    r0
and idx_tkn m0 h0 k =
  ( match k with
    | Rcd_Rcd l -> NetInt.Rcd_Rcd (Array.map (idx_tkn m0 h0) l)
    | Rcd_Tkn tk ->
      let tki =
        ( match tk with
          | Tkn_CoP (i,k1) ->
            (NetInt.Tkn_CoP(i,idx_tkn m0 h0 k1))
          | Tkn_P (_,_) -> err "idx_tkn 0"
          | Tkn_Fnc f ->
            let fi =
              ( match f with
                | Fnc (p0,r0) ->
                  let (pi0,_) = List.assq p0 (Array.to_list m0) in
                  let ri0 = to_idx h0 r0 in
                  (NetInt.Fnc (pi0,ri0))
                | Clj (_,_,_) -> err "idx_tkn 1"
                | Pls -> NetInt.Pls
                | Mlt -> NetInt.Mlt
                | Mns -> NetInt.Mns
                | Cmp -> NetInt.Cmp
                | Eq -> NetInt.Eq
                | Inj i -> NetInt.Inj i
                | Cho i -> NetInt.Cho i
                | Fix -> NetInt.Fix
                | Exn -> NetInt.Exn
              ) in
            (NetInt.Tkn_Fnc fi)
          | Tkn_Z z -> NetInt.Tkn_Z z
          | Tkn_Stg s -> NetInt.Tkn_Stg s
          | Tkn_Bol b -> NetInt.Tkn_Bol b
          | Tkn_Sgn p -> NetInt.Tkn_Sgn p
        ) in
      NetInt.Rcd_Tkn tki
  )
