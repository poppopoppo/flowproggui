open Util
module Rcd_Ptn = struct
  type 'a t =
    | P_R of ('a t) array
    | P_Ro of ('a t) array * 'a
    | P_A of 'a
  let p_a p =
    ( match p with
      | P_A r -> r
      | _ -> err "p_a:0" )
  let rec map f p =
    ( match p with
      | P_A r -> P_A (f r)
      | P_R rs -> P_R (Array.map (map f) rs)
      | P_Ro (rs,rt) -> P_Ro(Array.map (map f) rs,f rt))
  let rec get_path i p =
    ( match i with
      | [] -> p
      | hd::tl ->
        ( match p with
          | P_R rs ->
            if hd<(Array.length rs) then get_path tl rs.(hd)
            else err "get_path 0"
          | P_Ro (rs,rt) ->
            if hd<(Array.length rs) then get_path tl rs.(hd)
            else err "get_path 1"
          | _ -> err "get_path 2")
    )
  let rec set_path i p0 p1 =
    ( match i with
      | [] -> p1
      | hd::tl ->
        ( match p0 with
          | P_R rs ->
            if hd<(Array.length rs)
            then
              P_R (Array.mapi
                     (fun i x -> if i=hd then x else set_path tl x p1)
                     rs)
            else err "get_path 0"
          | P_Ro (rs,rt) ->
            if hd<(Array.length rs)
            then
              let rs0 =
                (Array.mapi
                   (fun i x -> if i=hd then x else set_path tl x p1)
                   rs) in
              P_Ro(rs0,rt)
            else err "get_path 1"
          | _ -> err "get_path 2")
    )
end
module Tm = struct
  type v = Sgn.t
  module ValMap = SgnMap
  type 'p t =
    | Prm of 'p
    | Val of v
    | App of 'p t * 'p t
  type 'p cxt = ('p t) ValMap.t
  let rec print f x =
    ( match x with
      | Prm p -> "p"^(f p)
      | Val v -> "t"^(Sgn.print v)
      | App (x0,x1) -> "("^(print f x0)^")"^"◂"^"("^(print f x1)^")")
  let (<+) x y = App(x,y)
  let vsgn () = Val (sgn ())
  let cxt_ini = SgnMap.empty
  let cxt_add i e c = SgnMap.add i e c
  let ( +~ ) c (i,e) = cxt_add i e c
  let rec subst s e =
    ( match e with
      | Prm _ -> e
      | Val i -> ( try SgnMap.find i s with _ -> e)
      | App(e1,e2) -> App(subst s e1,subst s e2)
    )
  let ( <* ) = subst
  let ( *~ ) s0 s1 =
    SgnMap.merge
      (fun _ oa ob ->
         match oa,ob with
         | None,_ -> ob
         | Some a,_ -> Some (s1<*a))
      s0 s1
  let subst_c s c = List.map (fun (e0,e1) -> (s<*e0,s<*e1)) c
  let (<*~) s c = subst_c s c
  let rec ftvs e =
    let s0 = SgnSet.empty in
    ( match e with
      | Prm _ -> s0
      | Val i -> SgnSet.add i s0
      | App (e1,e2) -> SgnSet.union (ftvs e1) (ftvs e2)
    )
  let ftv j e = SgnSet.mem j (ftvs e)
  let rec unify w c =
    (* (pnt false ("enter unify:"^(print_c c)^"\n")); *)
    let c =
      ( match c with
        | [] -> SgnMap.empty
        | (e0,e1)::tl ->
          ( match e0,e1 with
            | Prm p0,Prm p1 ->
              if p0=p1 then unify w tl else err "unify:0"
            | Val v0,Val v1 ->
              let (vf0,vf1) = (SgnSet.mem v0 w,SgnSet.mem v1 w) in
              if vf0&&vf1 then if v0=v1 then unify w tl else err "unify:5"
              else if vf0&&(not vf1) then
                let s0 = cxt_ini+~(v1,Val v0) in
                s0*~(unify w (s0<*~tl))
              else if vf1&&(not vf0) then
                let s0 = cxt_ini+~(v0,Val v1) in
                s0*~(unify w (s0<*~tl))
              else
                let v2 = sgn() in
                let s0 = cxt_ini+~(v0,(Val v2))+~(v1,Val v2) in
                s0*~(unify w (s0<*~tl))
            | Val v0,_ ->
              if SgnSet.mem v0 w then (err "unify:9")
              else if (ftv v0 e1) then (err "unify:1")
              else
                let s0 = cxt_ini+~(v0,e1) in
                s0*~(unify w (s0<*~tl))
            | _,Val v1 ->
              if SgnSet.mem v1 w then (err "unify:10")
              else if (ftv v1 e0) then (err "unify:2")
              else
                let s0 = cxt_ini+~(v1,e0) in
                s0*~(unify w (s0<*~tl))
            | App(e1,e2),App(e3,e4) -> unify w ((e1,e3)::(e2,e4)::tl)
            | _ -> err ("unify:3:"^(print (fun _ -> "_") e0)^"~"^(print (fun _ -> "_") e1))
          )
      ) in
    (* (pnt false ("return unify:"^(print_cxt c)^"\n")); *)
    c

  let rec unifys_cxt l =
    ( match l with
      | [] -> []
      | _::[] -> []
      | h1::h2::tl -> (h1,h2)::(unifys_cxt (h2::tl))
    )
  let unifys w l = unify w (unifys_cxt l)
end
module Types = struct
  open Tm
  type prm =
    | Imp | Tpl | Prd | Prd_U | CoPrd | CoPrd_U | Vct | Opn | Lst
    | Zn | N | Sgn | Stg
    | Ul | Ur | In | Out | Iso | Z_n of int | Axm of Sgn.t
    | Inj| Cho | Z_d of Sgn.t
  type t = prm Tm.t
  let (-*) x y = (Prm Imp)<+x<+y
  let ( ** ) x y = (Prm Tpl)<+x<+y
  let psgn () = Prm (Axm (sgn ()))
  let rcd_cl l = List.fold_right (fun x r -> x**r) l ((Prm Ul)**(Prm Ur))
  let rcd_op l = List.fold_right (fun x r -> x**r) l ((vsgn())**(vsgn()))
  let rcd_cns l t = List.fold_right (fun x r -> x**r) l t
  let ( *| ) x y = (Prm CoPrd)<+x<+y
  let ( *& ) x y = (Prm Prd)<+x<+y
  let coprd_cl a l =
    if (List.length l)>0 then
      let t0 = List.fold_right (fun x r -> x*|r) l (Prm CoPrd_U) in
      (Prm Iso)<+a<+t0
    else err "coprd_cl"
  let coprd_op a l =
    if (List.length l)>0 then
      let t0 = List.fold_right (fun x r -> x*|r) l (vsgn()) in
      (Prm Iso)<+a<+t0
    else err "coprd_op"
  let prd_cl a l =
    if (List.length l)>0 then
      let t0 = List.fold_right (fun x r -> x*|r) l (Prm Prd_U) in
      (Prm Iso)<+a<+t0
    else err "prd_cl"
  let prd_op a l =
    if (List.length l)>0 then
      let t0 = List.fold_right (fun x r -> x*|r) l (vsgn()) in
      (Prm Iso)<+a<+t0
    else err "prd_op"
end
module Ast = struct
  type name = string
  type mdl = name * args * (glb_etr list)
  and scm = scm_hd * Types.t
  and scm_hd = SgnSet.t
  and mdl_gma = scm StgMap.t
  and glb_etr =
    | Etr of string * scm_hd * Types.t * Types.t * code
    | Flow of flow
    | Etr_Clq of scm_hd * ((string * Types.t * Types.t * code) list)
    | Flow_Clq of flow list
  and flow =
    | Def_Abs of name * args
    | Def_Prd of name * args * ((Types.t * name) list)
    | Def_CoPrd of name * args * ((Types.t * name) list)
    | Def_Fnt of name * (name list)
    | Def_EqT of name * args * Types.t
  and args = Types.t list
  (* <name> : [scm_hd]∀ <src> ⊢ <dst> ≒ <code> *)
  and code =
    | E of exp_rcd
    | V of code * code
    | H of (code list)
    | A of exp_rcd * (int list) * (code list)
    | P of exp_rcd * (code list)
    | F of exp_rcd * int * code
  and exp_rcd =
    | Rot
    | Rcd of exp_rcd array
    | App of exp_atm * exp_rcd
    | Prj of exp_rcd * int
    | Atm of exp_atm
  and exp_atm =
    | Z of int
    | Pls
    | Mlt
    | Mns
    | Cmp
    | Eq
    | Fix
    | Exn
    | Name of string
    | Inj of int
    | Cho of int
    | Stg of string
end
module Tkn = struct
  type ('p, 'r) t =
    | Rcd of (('p, 'r) t) array
    | Tkn of ('p, 'r) tkn
  and ('p, 'r) tkn =
    | Name of string
    | Stg of string
    | Z of int
    | Zn of int * int
    | Sgn of Sgn.t
    | CoP of int * (('p, 'r) t)
    | P of ('p array) * (('p, 'r) t)
    | Pls
    | Mlt
    | Mns
    | Cmp
    | Eq
    | Inj of int
    | Cho of int
    | Fix
    | Exn
    | Fnc of 'r Rcd_Ptn.t * 'p (* jmp_ptr arg_ptr *)
    | Clj of 'r Rcd_Ptn.t * 'p * (('p, 'r) t) (* jmp_ptr arg0 { arg0 x } *)
  let rec of_reg_ptn p =
    let open Rcd_Ptn in
    ( match p with
      | P_A a -> a
      | P_R rs -> Rcd (Array.map of_reg_ptn rs)
      | P_Ro (rs,rt) ->
        ( match rt with
          | Rcd rts -> Rcd ((Array.map of_reg_ptn rs) |+| rts)
          | _ -> err "of_reg_ptn 0" ))
end
module IR = struct
  open Rcd_Ptn
  type ('r, 'p) nd =
    | Id of 'r * ('r array)
    | Prj of 'r * (('r array) * 'r)
    | Cns of (('r array) * 'r) * 'r
    | Rm of 'r
    | Call of ('r Rcd_Ptn.t) * 'r * ('r Rcd_Ptn.t)
    | Ini of 'r * (('p, 'r) Tkn.t)
  type pt = Name of string | DName of Sgn.t
  module PtMap = Map.Make(struct type t = pt let compare = compare end)
  type ('c , 'r) etr = 'r Rcd_Ptn.t * 'c
  type ('r ,'c ,'p) t =
    | Seq of (('r, 'p) nd) * 'c
    | Agl of 'r * ((('c, 'r) etr) array) * ('c, 'r) etr
    | Prd of 'r * ('r Rcd_Ptn.t) * ('c array) * ('r Rcd_Ptn.t * 'c)
    | Nd_Clj of 'r * ('r Rcd_Ptn.t) * 'c * 'c
    | Ret of 'r Rcd_Ptn.t
  type ('r, 'c, 'p) c_m = (('r, 'c, 'p) t * ('r Rcd_Ptn.t)) PtMap.t
  type ir_vct = (Sgn.t, pt, pt) c_m
  type ir = (Sgn.t, pt, pt) t
  type st = ((pt, Sgn.t) Tkn.t) SgnMap.t
  type ('c , 'r) cs_f =
    | CS_f of ((Sgn.t * (pt, 'r) Tkn.t) list) * (('c, 'r) etr)
    | CS_f_il of (('c, 'r) etr)
  type ('c, 'r) cs = (('c, 'r) cs_f) Stack.t
  type km = Ast.scm StgMap.t
  type rm = Ast.scm SgnMap.t
  let get_r st r =
    let k = SgnMap.find r st in
    let st = SgnMap.remove r st in
    (k,st)
  let rec get_reg_ptn st r : (_ Tkn.t * _) =
    let open Rcd_Ptn in
    let open Tkn in
    ( match r with
      | P_A r0 ->
        let (k,st) = get_r st r0 in
        (k,st)
      | P_R rs ->
        let (ks,st) =
          Array.fold_left
            (fun (ks,st) r0 ->
               let (k,st) = get_reg_ptn st r0 in
               (ks |+| [|k|],st))
            ([||],st) rs in
        (Rcd ks,st)
      | P_Ro (rs,rt) ->
        let (ks,st) =
          Array.fold_left
            (fun (ks,st) r0 ->
               let (k,st) = get_reg_ptn st r0 in
               (ks |+| [|k|],st))
            ([||],st) rs in
        let (kts,st) = get_r st rt in
        ( match kts with
          | Rcd l -> (Rcd (ks |+| l),st)
          | _ -> err "get_reg_ptn 0")
    )
  let set_r (st:(_ SgnMap.t)) r k =
    let st = SgnMap.add r k st in
    st
  let rec set_reg_ptn (st:(_ SgnMap.t)) r (k:(_ Tkn.t)) =
    let open Rcd_Ptn in
    let open Tkn in
    ( match r with
      | P_A r -> set_r st r k
      | P_R rs ->
        ( match k with
          | Tkn _ -> err "set_reg_ptn 0"
          | Rcd l ->
            let (st,_) =
              Array.fold_left
                (fun (st,i) r ->
                   let st = set_reg_ptn st r l.(i) in
                   (st,i+1) )
                (st,0) rs in
            st)
      | P_Ro (rs,rt) ->
        ( match k with
          | Tkn _ -> err "set_reg_ptn 0"
          | Rcd l ->
            let (st,i) =
              Array.fold_left
                (fun (st,i) r ->
                   let st = set_reg_ptn st r l.(i) in
                   (st,i+1) )
                (st,0) rs in
            let ln = Array.length l in
            let lt = Array.init (ln-i-1) (fun n -> l.(i+n)) in
            let st = set_r st rt (Rcd lt) in
            st
        )
    )
  let rec set_cs_k st l =
    ( match l with
      | [] -> st
      | (r,k)::tl ->
        let st = set_r st r k in
        set_cs_k st tl )
  let get_cs_k st =
    let l =
      SgnMap.fold
        (fun r k l ->
           (r,k)::l)
        st [] in
    (l,SgnMap.empty)
  let free_st st = SgnMap.empty
  let find_etr ev p = PtMap.find ev p
  let rec run (ev:(_ PtMap.t)) c (st:(_ SgnMap.t)) (cs:(_ Stack.t)) =
    let open Rcd_Ptn in
    let open Tkn in
    ( match c with
      | Ret r ->
        let (k,st) = get_reg_ptn st r in
        if Stack.is_empty cs then k
        else
          let hd = Stack.pop cs in
          ( match hd with
            | CS_f_il (r0,p1) ->
              let c = find_etr p1 ev in
              let st = free_st st in
              let st = set_reg_ptn st r0 k in
              run ev c st cs
            | CS_f (l,(r0,p1)) ->
              let c = find_etr p1 ev in
              let st = free_st st in
              let st = set_cs_k st l in
              let st = set_reg_ptn st r0 k in
              run ev c st cs
            | _ -> err "vm1.run:0"
          )
      | Agl (ra,ps,p0) ->
        let (k0,st) = get_r st ra in
        let open Tkn in
        ( match k0 with
          | Tkn (CoP(m1,kx)) ->
            let (rx,pr) = ps.(m1) in
            let c = find_etr pr ev in
            let st = set_reg_ptn st rx kx in
            Stack.push (CS_f_il p0) cs;
            run ev c st cs
          | Tkn (Z z) ->
            let m1 = if z=0 then 0 else 1 in
            let (rx,pr) = ps.(m1) in
            let c = find_etr pr ev in
            let kx = Rcd [||] in
            let st = set_reg_ptn st rx kx in
            Stack.push (CS_f_il p0) cs;
            run ev c st cs
          | _ -> err "err 19" )
      | Prd (_,_,_,_) -> err "err 10"
      | Nd_Clj (_,_,_,_) -> err "err 11"
      | Seq (o,p1) ->
        let c0 = find_etr p1 ev in
        ( match o with
          | Ini (r0,k) ->
            let st = set_r st r0 k in
            run ev c0 st cs
          | Id (r1,r2) ->
            let (k1,st) = get_r st r1 in
            let st = Array.fold_left (fun st r -> set_r st r k1) st r2 in
            run ev c0 st cs
          | Rm r0 ->
            let (_,st) = get_r st r0 in
            run ev c0 st cs
          | Prj(r0,(rs,rt)) ->
            let (k0,st) = get_r st r0 in
            let st = set_reg_ptn st (P_Ro (Array.map (fun x -> P_A x) rs,rt)) k0 in
            run ev c0 st cs
          | Cns ((rs,rt),r1) ->
            let (ks,st) =
              Array.fold_left
                (fun (ks,st) r ->
                   let (k,st) = get_r st r in
                   (ks |+| [|k|],st))
                ([||],st) rs in
            let (kt,st) = get_r st rt in
            ( match kt with
              | Rcd l ->
                let kr = Rcd (ks |+| l) in
                let st = set_r st r1 kr in
                run ev c0 st cs
              | _ -> err "run: Cns" )
          | Call (rp0,r1,rp2) ->
            let (k_f,st) = get_r st r1 in
            let (kx,st) = get_reg_ptn st rp2 in
            let open Tkn in
            ( match rp0,k_f,kx with
              | P_A r0,Tkn Mns,Tkn (Z z) ->
                let st = set_r st r0 (Tkn (Z (-z))) in
                run ev c0 st cs
              | _,Tkn Inj i,_ ->
                let st = set_reg_ptn st rp0 (Tkn (CoP(i,kx))) in
                run ev c0 st cs
              | _,Tkn (Cho _),_ -> err "err 7"
              | _,Tkn Exn,_ -> err "err 8"
              | _,Tkn Fix,_ -> err "err 9"
              | _,Tkn (Fnc (r0,pa)),_ ->
                let (l,st) = get_cs_k st in
                let st = set_reg_ptn st r0 kx in
                Stack.push (CS_f(l,(rp0,p1))) cs;
                let c0 = find_etr pa ev in
                run ev c0 st cs
              | _,Tkn (Clj (_,_,_)),_ -> err "run 3"
              | P_A r0,Tkn Pls,Rcd [|(Tkn Z z1);(Tkn Z z2)|] ->
                let st = set_r st r0 (Tkn (Z (z1+z2))) in
                run ev c0 st cs
              | P_A r0,Tkn Mlt,Rcd [|(Tkn Z z1);(Tkn Z z2)|] ->
                let st = set_r st r0 (Tkn (Z (z1*z2))) in
                run ev c0 st cs
              | P_A r0,Tkn Cmp,Rcd [|(Tkn Z z1);(Tkn Z z2)|] ->
                let b = if z1<=z2 then 1 else 0 in
                let st = set_r st r0 (Tkn (Z b)) in
                run ev c0 st cs
              | P_A r0,Tkn Eq,Rcd [|x;y|] ->
                let b = if x=y then 1 else 0 in
                let st = set_r st r0 (Tkn (Zn (b,2))) in
                run ev c0 st cs
              | _ -> err "err 38"
            )
        )
    )
  let rec seq ev p1 p2 =
    let c1 = find_etr p1 ev in
    let c2 = find_etr p2 ev in
    ( match c1 with
      | Ret _ ->
        let ev = PtMap.add p1 c2 ev in
        ev
      | Seq (n,p3) ->
        seq ev p3 p2
      | Agl (ra,ps,(rr,p3)) ->
        seq ev p3 p2
      | _ -> err "seq 0")
  let rec free_idx h0 v0 r =
    let ri = Rcd_Ptn.map (fun r -> SgnMap.find r h0) r in
    let rec f_r ri =
      ( match ri with
        | P_A i -> IntSet.remove i v0
        | P_R rs ->
          Array.fold_left
            (fun v0 r -> f_r r)
            v0 rs
        | P_Ro (rs,rt) ->
          let v0 = Array.fold_left
              (fun v0 r -> f_r r)
              v0 rs in
          IntSet.remove rt v0
      ) in
    f_r ri
  and add_idx h0 v0 r0 =
    ( match r0 with
      | P_A r ->
        let (ri,v0) = add_i v0 in
        let h0 = SgnMap.add r ri h0 in
        (h0,v0)
      | P_R rs ->
        Array.fold_left
          (fun (h0,v0) r -> add_idx h0 v0 r)
          (h0,v0) rs
      | P_Ro (rs,rt) ->
        let (h0,v0) = Array.fold_left
            (fun (h0,v0) r -> add_idx h0 v0 r)
            (h0,v0) rs in
        let (ri,v0) = add_i v0 in
        let h0 = SgnMap.add rt ri h0 in
        (h0,v0)
    )
  and add_i v0 =
    let rec add_i_i i =
      if (IntSet.mem i v0) then add_i_i (i+1) else i in
    let i = add_i_i 0 in
    let v0 = IntSet.add i v0 in
    (i,v0)
  let copy_vct v0 = v0
  let rec mk_idx (h0:(_ SgnMap.t)) v0 ev (p:pt) =
    let c = find_etr p ev in
    ( match c with
      | Ret r0 -> (h0,v0)
      | Agl(r0,ps,(rr,p1)) ->
        let v0 = free_idx h0 v0 (P_A r0) in
        let h0:(_ SgnMap.t) =
          Array.fold_left
            (fun h0 (ri,p) ->
               let v0 = copy_vct v0 in
               let (h0,v0) = add_idx h0 v0 ri in
               let (h0,_) = mk_idx h0 v0 ev p in
               h0 )
            h0 ps in
        let (h0,v0) = add_idx h0 v0 rr in
        mk_idx h0 v0 ev p1
      | Prd (_,_,_,_) -> err "g 2"
      | Nd_Clj(_,_,_,_) -> err "g 3"
      | Seq(n1,p1) ->
        ( match n1 with
          | Id (r0,rs) ->
            let (h0,v0) = add_idx h0 v0 (P_R (Array.map (fun x -> P_A x) rs)) in
            let v0 = free_idx h0 v0 (P_A r0) in
            mk_idx h0 v0 ev p1
          | Prj (r0,(rs,rt)) ->
            let (h0,v0) = add_idx h0 v0 (P_R (Array.map (fun x -> P_A x) rs)) in
            let (h0,v0) = add_idx h0 v0 (P_A rt) in
            let v0 = free_idx h0 v0 (P_A r0) in
            mk_idx h0 v0 ev p1
          | Cns ((rs,rt),r1) ->
            let (h0,v0) = add_idx h0 v0 (P_A r1) in
            let v0 = free_idx h0 v0 (P_R (Array.map (fun x -> P_A x) rs)) in
            let v0 = free_idx h0 v0 (P_A rt) in
            mk_idx h0 v0 ev p1
          | Rm r0 ->
            let v0 = free_idx h0 v0 (P_A r0) in
            mk_idx h0 v0 ev p1
          | Call(r0,r1,r2) ->
            let (h0,v0) = add_idx h0 v0 r0 in
            let v0 = free_idx h0 v0 (P_A r1) in
            let v0 = free_idx h0 v0 r2 in
            mk_idx h0 v0 ev p1
          | Ini (r0,_) ->
            let (h0,v0) = add_idx h0 v0 (P_A r0) in
            mk_idx h0 v0 ev p1
        )
    )
  let rec seqs ev p l r =
    ( match l with
      | [] ->
        let ev = PtMap.add p (Ret r) ev in
        ev
      | hd::tl ->
        let p0 = DName (sgn ()) in
        let ev = seqs ev p0 tl r in
        let ev = PtMap.add p (Seq(hd,p0)) ev in
        ev )
  let rpc n r0 =
    let rp0 =
      Rcd_Ptn.map
        (fun r -> (r,Array.init n (fun _ -> sgn ())))
        r0 in
    let rpi i =
      Rcd_Ptn.map
        (fun (r,rs) -> rs.(i))
        rp0 in
    let rr = (Array.init n (fun i -> rpi i)) in
    let pd = DName (sgn ()) in
    let rec f r0 =
      ( match r0 with
        | P_A (r,rs) ->
          [Id(r,rs)]
        | P_R rs ->
          let cs =
            Array.fold_left
              (fun c r -> (f r) @ c)
              [] rs in
          cs
        | P_Ro (rr,(rt0,rts)) ->
          let cs =
            Array.fold_left
              (fun c r -> (f r) @ c)
              [] rr in
          (Id(rt0,rts))::cs
      ) in
    ((f rp0),rr)
  let rec rm rp =
    let pd = DName (sgn ()) in
    ( match rp with
      | P_R rs ->
        let a1 =
          Array.fold_left
            (fun a r ->
               let a1 = rm r in
               a @ a1 )
            [] rs in
        a1
      | P_Ro (rs,rt) ->
        let a1 =
          Array.fold_left
            (fun a r ->
               let a1 = rm r in
               a @ a1 )
            [] rs in
        (Rm rt)::a1
      | P_A r -> [(Rm r)]
    )
  let rec vh_of_ast ev (p:pt) r0 c =
    let open Ast in
    ( match c with
      | V (a1,a2) ->
        let (ev,p1,r1) = vh_of_ast ev p r0 a1 in
        let (ev,p2,r2) = vh_of_ast ev p1 r1 a2 in
        (ev,p2,r2)
      | H _ -> err "vm2:a1"
      | E n1 ->
        vh_of_exp_ptn ev p r0 n1
      | P (_,_) -> err "vm2:a2"
      | A (n1,ix,l) ->
        let (ev,p1,r1) = vh_of_exp_ptn ev p r0 n1 in
        let ra = get_path ix r1 in
        let rr = P_A (sgn ()) in
        let (la,_,ev) =
          List.fold_left
            (fun (la,i,ev) c ->
               let rp = (P_A (sgn())) in
               let p2 = set_path ix r1 rp in
               let pi = DName (sgn ()) in
               let (ev,pir,r1) = vh_of_ast ev pi p2 c in
               let la = la |+| [|(rp,pi)|] in
               (la,i+1,ev))
            ([||],0,ev) l in
        let p2 = DName (sgn ()) in
        let n2 = Agl(p_a ra,la,(rr,p2)) in
        let ev = PtMap.add p1 n2 ev in
        let ev = PtMap.add p2 (Ret rr) ev in
        (ev,p2,rr)
      | F (_,_,_) -> err "vm2:a4"
    )
  and vh_of_exp_ptn ev p0 r0 e0 =
    let open Ast in
    ( match e0 with
      | Rot ->
        let p1 = DName (sgn ()) in
        let ev = PtMap.add p1 (Ret r0) ev in
        (ev,p1,r0)
      | Rcd [||] ->
        let k = Tkn.Rcd [||] in
        let v1 = sgn () in
        let r1 = P_A v1 in
        let p1 = DName (sgn ()) in
        let p2 = DName (sgn ()) in
        let ev = PtMap.add p1 (Seq(Ini(v1,k),p2)) ev in
        let ev = PtMap.add p2 (Ret r1) ev in
        (ev,p2,r1)
      | Rcd es ->
        let (c0,rs) = rpc (Array.length es) r0 in
        let pps = Array.mapi (fun i e -> vh_of_exp_ptn rs.(i) e) es in
        let (ps,rps) = List.split (Array.to_list pps) in
        let c1 = List.fold_left (fun c1 cx -> seq c1 cx) c0 ps in
        let rr = P_R(Array.of_list rps) in
        (seq c1 (Ret rr),rr)
      | App (e1,e2) ->
        let (c0,p0) = rpc v0 2 r0 in
        ( match p0 with
          | [| r1 ; r2 |] ->
            let (cf,pf) = net_of_exp v0 nm r1 f in
            let (cx,px) = net_of_exp_ptn v0 nm r2 x in
            let r3 = P_A (sgn()) in
            let n2 = Call (r3,p_a pf,px) in
            (seq (seq cf cx) (Seq(n2,Ret r3)),r3)
          | _ -> err "err 45" )
      | Prj (e,i) ->
        let (c1,p1) = net_of_exp_ptn r0 n1 in
        ( match p1 with
          | P_R rs ->
            let rc1 = Array.fold_left
                (fun (a,j) r ->
                   if i=j then (a,j+1)
                   else
                     let c0 = rm r in
                     (seq c0 a,j+1))
                (Ret rs.(i)) rs in
            (seq c1 rc1,rs.(i))
          | P_Ro (rs,rt) ->
            let rc1 = Array.fold_left
                (fun (a,j) r ->
                   if i=j then (a,j+1)
                   else
                     let c0 = rm r in
                     (seq c0 a,j+1))
                (Seq(Rm rt,Ret rs.(i))) rs in
            (seq c1 rc1,rs.(i))
          | P_A r1 ->
            let a1 = Array.init (fun i -> sgn ()) (i-1) in
            let r2 = sgn () in
            let c1 = Prj(r1,(a1,r2)) in
            let rc1 = Array.fold_left
                (fun (a,j) r ->
                   if i=j then (a,j+1)
                   else
                     let c0 =  r in
                     (Seq(Rm r,a),j+1))
                (Seq(Rm r2,Ret (P_A a1.(i)))) a1 in
            (seq c1 rc1,P_A a1.(i),P_A a1.(i))
        )
      | Atm a -> vh_of_exp a
    )
  and vh_of_exp e =
    let k =
      ( match e with
        | Ast.Z z -> Tkn.Z z
        | Ast.Pls -> Tkn.Pls
        | Ast.Mlt -> Tkn.Mlt
        | Mns -> Tkn.Mns
        | Cmp -> Tkn.Cmp
        | Eq -> Tkn.Eq
        | Fix -> Tkn.Fix
        | Exn -> Tkn.Exn
        | Name n -> Tkn.Name n
        | Inj i -> Tkn.Inj i
        | Cho i -> Tkn.Cho i
        | Stg s -> Tkn.Stg s
      ) in
    let r1 = sgn () in
    let p1 = P_A r1 in
    (Seq(Ini(r1,Rcd_Tkn k),Ret p1),p1)
  let c_m_of_g g =
    let m0 =
      BatList.fold_left
        (fun m0 e ->
           ( match e with
             | Types.Etr (_,(name,_,_,f)) ->
               let r0 = P_A (sgn ()) in
               let (m0,c0,p0) = vh_of_code m0 r0 f in
               PtMap.add (Name name) c0 m0
             | Etr_Clq(_,l) ->
               BatList.fold_left
                 (fun r (name,_,_,f) ->
                    let r0 = P_A (sgn ()) in
                    let (c0,p0) = vh_of_code nm r0 f in
                    StgMap.add (Name name) c0 m0)
                 m0 l
             | _ -> err "err10"))
        PtMap.empty g in
    m0
end
module Asm = struct
  type pt = int
  type r = int
  type ('r, 'p) op =
    | Ret of 'r Rcd_Ptn.t
    | Agl of 'r * (('r Rcd_Ptn.t * 'c) array) * ('r Rcd_Ptn.t) * pt
    | Ini of 'r * ('p rcd_tkn)
    | Nd of 'r pt IR.nd
  type t = ((r, r) op) array
  type etr_vct = (int PtMap.t * (r Rcd_Ptn.t)) * t
  let save_etr_vct ev = ()
  let save_tkn k p = ()
  let load_tkn _ = ()
  let rec asm_of_ir j c0 =
    let open IR in
    ( match c0 with
      | Ret r -> ([|Asm.Ret r|],j+1)
      | Agl (ra,ps,rr,pr) ->
        let as0 = Array.map (fun (_,p) -> p) ps in
        let rs = Array.map fst ps in
        let ls = Array.map Array.length as0 in
        let (a0,ls,_,j0) = Array.fold_left
            (fun (a0,ls,i,j0) ai ->
               let (a0,j0) = asm_of_ir j0 p0 in
               let ls = ls |+| [|(rs.(i),j0)|] in
               (a0 |+| ai,ls,i+1,j0))
            ([||],[||],0,j+1) as0 in
        let (ar,n) = asm_of_ir j0 pr in
        ([|(Agl,ra,psi,rr,j0)|] |+| a0 |+| pr,n)
      | Nd (o,c1) ->
        let (a0,n0) = asm_of_ir (j+1) c1 in
        ([|o|] |+| a0,n0)
    )
  let rec asm_of_c_m m0 =
    let v0 = ini_st_v () in
    let (mi0,a0,j0) =
      PtMap.fold
        (fun s c (mi0,a0,j0) ->
           let (a1,j1) = asm_of_ir j0 c in
           let mi0 = PtMap.add s j0 mi0 in
           (mi0,a0 |+| a1,j1))
        m0 (PtMap.empty,[||],0) in
    (mi0,asm_of_ini mi0 a0S)
  and asm_of_ini mi0 a0 =
    Array.map
      (fun n0 ->
         ( match n0 with
           | Ini(r0,k0) -> Ini(r0,asm_tkn mi0 k0)
           | _ -> n0))
      a0
  and asm_tkn mi0 k0 =
    let open Tkn in
    ( match k0 with
      | Rcd l -> Rcd (Array.map (asm_tkn mi0) l)
      | Tkn tk ->
        let tki =
          ( match tk with
            | Fnc p -> Fnc(PtMap.find p mi0)
            | Clj (p,k1) -> Clj(PtMap.find p mi0,asm_tkn mi0 k1)
            | _ -> tk
          ) in
        Tkn tki
    )
end
module Typing = struct
  let inst (a,y) =
    let m = SgnSet.fold
        (fun k r -> SgnMap.add k (vsgn()) r)
        a SgnSet.empty in
    m<*y
  let subst_scm s (a,e) =
    let s1 =
      SgnMap.fold
        (fun k v r ->
           if SgnMap.mem k a then r
           else SgnMap.add k v r)
        SgnMap.empty s in
    (a,s1<*e)
  let get_rm rm r =
    SgnMap.find rm r
  let subst_rm s rm =
    SgnMap.map
      (fun q -> subst_scm s q)
      rm
  let subst_km s km =
    StgMap.map
      (fun q -> subst_scm s q)
      rm
  let ftvs_scm (a,e) = SgnSet.diff (ftvs e) a
  let ftvs_km g =
    StgMap.fold
      (fun _ v r -> SgnSet.union (ftvs_scm v) r)
      g SgnSet.empty
  let gen km rm y =
    (SgnSet.inter (ftvs_km km) (ftvs_scm (SgnMap.empty,y)))
  let rec get_reg_ptn_rm rm rp =
    ( match rp with
      | P_A r -> get_rm rm r
      | P_R (rs,rt) ->
        let ts = Array.map (get_reg_ptn rm) rs in
        let tt = get_rm rm rt in
        rcd_cns ts tt
    )
  let unifys_reg_ptn rm rps =
    let ts = List.map (fun x -> inst @ get_reg_ptn_rm rm x) rps in
    let s = unifys ts in
    s
  let rec typing_asm km rm c =
    ( match c with
      | Nd (e,c1) ->
        let s0 =
          ( match e with
            | Id (r0,rs) ->
              let s0 = unifys (Array.map (fun r -> inst (get_rm rm r)) (Array.to_list ([|r0|] |+| rs))) in
              s0
            | Prj (r0,rs,rt) ->
              let ts = Array.map (fun r -> inst (get_rm rm r)) rs in
              let t0 = inst (get_rm rm rt) in
              let s0 = unify [(get_rm rm r0,rcd ts t0)] in
              s0
            | Cns (rs,rt,r0) ->
              let ts = Array.map (fun r -> inst (get_rm rm r)) rs in
              let t0 = inst (get_rm rm rt) in
              let s0 = unify [(inst @ get_rm rm r0,rcd_cns ts t0)] in
              s0
            | Rm r0 -> cxt_ini ()
            | Agl (ra,rp,ps) ->
              let t0 = coprd_op (vsgn ()) [(vsgn ())] in
              let s0 = unify [(t0,get_rm rm ra)] in
              let s1 = Array.fold_left
                  (fun s1 p ->
                     let s2 = typing_asm (subst_km s1 km) (subst_rm s1 rm) p in
                     s1 *~ s2)
                  s0 ps in
              let rps = Array.map ret ps in
              let s2 = unifys_reg_ptn (subst_rm s1 rm) (Array.to_list (rp |+| rps)) in
              s1 *~ s2
            | Call (y,f,x) ->
              let (ty,tf,tx) = (inst @ get_ptn_rm rm y,inst @ get_rm f,inst @ get_ptn_rm rm x) in
              let s0 = unify [(tf,imp tx ty)] in
              s0
            | Ini (r,k) ->
              let s0 = unify [(inst @ get_rm rm r,typing_rcd_tkn km k)] in
              s0 ) in
        typing_asm (subst_km s0 km) (subst_rm s0 rm) c
      | Ret r0 ->
        cxt_ini ()
    )
  and typing_rcd_tkn km k =
    let open Unify in
    let open Tkn in
    ( match k with
      | Rcd l -> rcd_cl (Array.map (typing_rcd_tkn km) l)
      | Tkn k ->
        ( match k with
          | Stg _ -> Prm Unify.Stg
          | Z _ -> Prm Unify.Z
          | Zn(_,z1) -> Prm (Unify.Z z1)
          | Sgn _ -> Prm Unify.Sgn
          | CoP (i,k0) ->
            let t0 = typing_rcd_tkn km k0 in
            let l0 = List.init (fun _ -> vsgn ()) (i-2) in
            let l1 = l0 @ [t0] in
            coprd_op l1
          | P (_,_) -> err "err t0"
          | Pls -> imp (rcd_cl [(zn ());(zn ())]) (zn ())
          | Mlt -> imp (rcd_cl [(zn ());(zn ())]) (zn ())
          | Mns -> imp (zn ()) (zn ())
          | Cmp ->
            let v0 = vsgn () in
            imp (rcd_cl [z;z]) (Prm (Zn 2))
          | Eq ->
            let v0 = vsgn () in
            imp (rcd_cl [v0;v0]) (Prm (Zn 2))
          | Inj i ->
            let t0 = vsgn () in
            let l0 = List.init (fun _ -> vsgn ()) (i-1) in
            let l1 = l0 @ [t0] in
            imp t0 (coprd_op l1)
          | Cho _ -> err "err t2"
          | Fix ->
            let (a,b) = (vsgn(),vsgn()) in
            imp (imp ((imp a b) (imp a b))) (imp a b)
          | Exn ->
            let a = vsgn () in
            imp (Prm Stg) a
          | Fnc _ -> err "t4"
          | Clj _ -> err "t3"
        )
    )
end
