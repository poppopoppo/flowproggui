open Util
module Rcd_Ptn = struct
  type 'a t =
    | P_R of ('a t) array
    | P_Ro of ('a t) array * 'a
    | P_A of 'a
  let rec to_list p =
    ( match p with
      | P_A r -> [r]
      | P_R rs -> Array.fold_left (fun l r -> (to_list r) @ l) [] rs
      | P_Ro (rs,rt) -> rt::(Array.fold_left (fun l r -> (to_list r) @ l) [] rs)
    )
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
    | Val of Sgn.t
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
  let rec (<*) s e =
    ( match e with
      | Prm _ -> e
      | Val i -> ( try SgnMap.find i s with _ -> e)
      | App(e1,e2) -> App(s<*e1,s<*e2)
    )
  let ( *~ ) s0 s1 =
    SgnMap.merge
      (fun _ oa ob ->
         match oa,ob with
         | None,_ -> ob
         | Some a,_ -> Some (s1<*a))
      s0 s1
  let (<*~) s c = List.map (fun (e0,e1) -> (s<*e0,s<*e1)) c
  let rec ftvs e =
    let s0 = SgnSet.empty in
    ( match e with
      | Prm _ -> s0
      | Val i -> SgnSet.add i s0
      | App (e1,e2) -> SgnSet.union (ftvs e1) (ftvs e2)
    )
  let ftv j e = SgnSet.mem j (ftvs e)
  let rec unify = function
    | [] -> SgnMap.empty
    | (e0,e1)::tl ->
      ( match e0,e1 with
        | Prm p0,Prm p1 ->
          if p0=p1 then unify tl else err "unify:0"
        | Val v0,Val v1 ->
          if v0=v1 then unify tl
          else
            let v2 = vsgn () in
            let s0 = cxt_ini+~(v0,v2)+~(v1,v2) in
            s0*~(unify (s0<*~tl))
        | Val v0,_ ->
          if (ftv v0 e1) then err "unify:1"
          else (cxt_ini+~(v0,e1))*~(unify w (s0<*~tl))
        | _,Val v1 ->
          if (ftv v1 e0) then err "unify:2"
          else (cxt_ini+~(v1,e0))*~(unify w (s0<*~tl))
        | App(e1,e2),App(e3,e4) -> unify ((e1,e3)::(e2,e4)::tl)
        | _ -> err ("unify:3:"^(print (fun _ -> "_") e0)^"~"^(print (fun _ -> "_") e1))
      )
  let rec unifys_cxt l =
    ( match l with
      | [] -> []
      | _::[] -> []
      | h1::h2::tl -> (h1,h2)::(unifys_cxt (h2::tl))
    )
  let unifys (l:('a t) list) : ('a cxt) = unify (unifys_cxt l)
end
module Types = struct
  type level = int
  type prm =
    | Vct | Opn | Lst
    | Zn | N | Sgn | Stg | Z_u
    | Z_n of int | Axm of Sgn.t
    | Inj| Cho | Z_d of Sgn.t
  type v_p = Sgn.t
  type v =
    | V_Var of Sgn.t * level
    | Link of t
  and vm = v SgnMap.t
  and t =
    | WC
    | Var of v ref
    | QVar of Sgn.t
    | App of t * t
    | Imp of t * t
    | Prm of prm
    | Rcd of t_rcd
    | Rcd_Lb of t_rcd_lb
    | Rec of (Sgn.t ref) * (t_rec ref)
  and t_rec =
    | CP of t * t_co_prd
    | P of t * t* t_prd
  and t_co_prd =
    | CoPrd of t * t_to_prd
    | Tl_CP of t
    | U_CP
  and t_co_prd =
    | Prd of t * t_to_prd
    | Tl_P of t
    | U_P
  and t_rcd =
    | Cns of t * t_rcd
    | Tl of t
    | U
  and t_rcd_lb =
    | Cns_Lb of string * t * t_rcd
    | Tl_Lb of t
    | U_Lb
  let rcd_cl l = List.fold_right (fun x r -> x**r) l unt
  let rcd_op l = List.fold_right (fun x r -> x**r) l ((vsgn())**(vsgn()))
  let rcd_cns l t = List.fold_right (fun x r -> x**r) l t
  let lb_rcd_cl l =
    List.fold_right
      (fun (l,y) r -> ((Prm (Lb l))<+y)**r) l lb_unt
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
  and scm = scm_hd * Types.ty
  and scm_hd = SgnSet.t
  and mdl_gma = scm StgMap.t
  and glb_etr =
    | Etr of string * scm_hd * Types.ty * Types.ty * code
    | Flow of flow
    | Etr_Clq of scm_hd * ((string * Types.ty * Types.ty * code) list)
    | Flow_Clq of flow list
  and flow =
    | Def_Abs of name * args
    | Def_Prd of name * args * ((Types.ty * name) list)
    | Def_CoPrd of name * args * ((Types.ty * name) list)
    | Def_Fnt of name * (name list)
    | Def_EqT of name * args * Types.ty
  and args = Types.ty list
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
    | Fnc of 'p (* jmp_ptr arg_ptr *)
    | Clj of 'p * (('p, 'r) t) (* jmp_ptr arg0 { arg0 x } *)
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
  type ('r ,'c ,'p) t =
    | Etr of ('r Rcd_Ptn.t) * 'c
    | Clj of 'r * ('r Rcd_Ptn.t) * 'c * 'c
    | Prd of 'r * ('r Rcd_Ptn.t) * ('c array) * 'c
    | Agl of 'r * (('r Rcd_Ptn.t * 'c) array) * ('r Rcd_Ptn.t * 'c)
    | Seq of (('r, 'p) nd) * 'c
    | Ret of 'r Rcd_Ptn.t
  type ('r, 'c, 'p) c_m = (('r, 'c, 'p) t) PtMap.t
  type ir_vct = (Sgn.t, pt, pt) c_m
  type ir = (Sgn.t, pt, pt) t
  type st = ((pt, Sgn.t) Tkn.t) SgnMap.t
  type ('c , 'r) cs_f =
    | CS_f of ((Sgn.t * (pt, 'r) Tkn.t) list) * 'c
    | CS_f_il of 'c
  type ('c, 'r) cs = (('c, 'r) cs_f) Stack.t
  type km = Ast.scm StgMap.t
  type rm = Ast.scm SgnMap.t
  let find ev p = PtMap.find ev p
  let rec ret ev p =
    ( match find p ev with
      | Ret r -> r
      | Seq (_,p1) -> ret ev p1
      | Agl (_,_,(_,p1)) -> ret ev p1
      | Etr (_,p1) -> ret ev p1
      | Clj(_,_,_,p1) -> ret ev p1
      | Prd (_,_,_,p1) -> ret ev p1 )
  let etr ev p =
    ( match find p ev with
      | Etr (r,p1) -> (r,p1)
      | _ -> err "etr:0" )
  let rtn ev p =
    ( match find p ev with
      | Etr (r,p1) -> (r,p1)
      | Agl(_,_,(rr,p1)) -> (rr,p1)
      | Seq (Call (y,_,_),p1) -> (y,p1)
      | _ -> err "etr:0" )
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
  let rec run (ev:ir_vct) p0 (st:(_ SgnMap.t)) (cs:(((pt,Sgn.t) cs_f) Stack.t)) =
    let open Rcd_Ptn in
    let open Tkn in
    ( match find p0 ev with
      | Etr _ -> err "run:0"
      | Ret r ->
        let (k,st) = get_reg_ptn st r in
        if Stack.is_empty cs then k
        else
          let hd = Stack.pop cs in
          ( match hd with
            | CS_f_il pe ->
              let (r0,p1) = rtn ev pe in
              let st = set_reg_ptn st r0 k in
              run ev p1 st cs
            | CS_f (l,pe) ->
              let (r0,p1) = rtn ev pe in
              let st = free_st st in
              let st = set_cs_k st l in
              let st = set_reg_ptn st r0 k in
              run ev p1 st cs
            | _ -> err "vm1.run:0"
          )
      | Agl (ra,ps,(rr,p1)) ->
        let (k0,st) = get_r st ra in
        let open Tkn in
        ( match k0 with
          | Tkn (CoP(m1,kx)) ->
            let (rx,pr) = ps.(m1) in
            let st = set_reg_ptn st rx kx in
            Stack.push (CS_f_il p0) cs;
            run ev pr st cs
          | Tkn (Z z) ->
            let m1 = if z=0 then 0 else 1 in
            let (rx,pr) = ps.(m1) in
            let kx = Rcd [||] in
            let st = set_reg_ptn st rx kx in
            Stack.push (CS_f_il p0) cs;
            run ev pr st cs
          | _ -> err "err 19" )
      | Prd (_,_,_,_) -> err "err 10"
      | Clj (_,_,_,_) -> err "err 11"
      | Seq (o,p1) ->
        ( match o with
          | Ini (r0,k) ->
            let st = set_r st r0 k in
            run ev p1 st cs
          | Id (r1,r2) ->
            let (k1,st) = get_r st r1 in
            let st = Array.fold_left (fun st r -> set_r st r k1) st r2 in
            run ev p1 st cs
          | Rm r0 ->
            let (_,st) = get_r st r0 in
            run ev p1 st cs
          | Prj(r0,(rs,rt)) ->
            let (k0,st) = get_r st r0 in
            let st = set_reg_ptn st (P_Ro (Array.map (fun x -> P_A x) rs,rt)) k0 in
            run ev p1 st cs
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
                run ev p1 st cs
              | _ -> err "run: Cns" )
          | Call (rp0,r1,rp2) ->
            let (k_f,st) = get_r st r1 in
            let (kx,st) = get_reg_ptn st rp2 in
            let open Tkn in
            ( match rp0,k_f,kx with
              | P_A r0,Tkn Mns,Tkn (Z z) ->
                let st = set_r st r0 (Tkn (Z (-z))) in
                run ev p1 st cs
              | _,Tkn Inj i,_ ->
                let st = set_reg_ptn st rp0 (Tkn (CoP(i,kx))) in
                run ev p1 st cs
              | _,Tkn (Cho _),_ -> err "err 7"
              | _,Tkn Exn,_ -> err "err 8"
              | _,Tkn Fix,_ -> err "err 9"
              | _,Tkn (Fnc pa),_ ->
                let (l,st) = get_cs_k st in
                let (re,p1) = etr ev pa in
                let st = set_reg_ptn st re kx in
                Stack.push (CS_f(l,p0)) cs;
                run ev pa st cs
              | _,Tkn (Clj (_,_)),_ -> err "run 3"
              | P_A r0,Tkn Pls,Rcd [|(Tkn Z z1);(Tkn Z z2)|] ->
                let st = set_r st r0 (Tkn (Z (z1+z2))) in
                run ev p1 st cs
              | P_A r0,Tkn Mlt,Rcd [|(Tkn Z z1);(Tkn Z z2)|] ->
                let st = set_r st r0 (Tkn (Z (z1*z2))) in
                run ev p1 st cs
              | P_A r0,Tkn Cmp,Rcd [|(Tkn Z z1);(Tkn Z z2)|] ->
                let b = if z1<=z2 then 1 else 0 in
                let st = set_r st r0 (Tkn (Z b)) in
                run ev p1 st cs
              | P_A r0,Tkn Eq,Rcd [|x;y|] ->
                let b = if x=y then 1 else 0 in
                let st = set_r st r0 (Tkn (Zn (b,2))) in
                run ev p1 st cs
              | _ -> err "err 38"
            )
        )
    )
  let rec seq ev p1 p2 =
    let c1 = find p1 ev in
    let c2 = find p2 ev in
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
    let c = find p ev in
    ( match c with
      | Etr (r0,p1) ->
        let (h0,v0) = add_idx h0 v0 r0 in
        mk_idx h0 v0 ev p1
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
      | Clj(_,_,_,_) -> err "g 3"
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
        (ev,p)
      | hd::tl ->
        let p0 = DName (sgn ()) in
        let (ev,p1) = seqs ev p0 tl r in
        let ev = PtMap.add p (Seq(hd,p0)) ev in
        (ev,p1) )
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
        let (l,rr) = rpc (Array.length es) r0 in
        let (ev,p1) = seqs ev p0 l (P_R rr) in
        let (_,ev,p2,rs) =
          Array.fold_left
            (fun (i,ev,p2,rs) e ->
               let (ev,p2,r1) = vh_of_exp_ptn ev p2 rr.(i) e in
               (i+1,ev,p2,rs |+| [|r1|]))
            (0,ev,p1,[||]) es in
        let ev = PtMap.add p2 (Ret (P_R rs)) ev in
        (ev,p2,P_R rs)
      | App (e1,e2) ->
        let (l,rr) = rpc 2 r0 in
        let (ev,p1) = seqs ev p0 l (P_R rr) in
        ( match rr with
          | [| r1 ; r2 |] ->
            let (ev,pf,rf) = vh_of_exp ev p1 r1 e1 in
            let (ev,px,rx) = vh_of_exp_ptn ev pf rf e2 in
            let r3 = P_A (sgn()) in
            let p3 = DName (sgn ()) in
            let n2 = Call (r3,p_a rf,rx) in
            let ev = PtMap.add px (Seq(n2,p3)) ev in
            let ev = PtMap.add p3 (Ret r3) ev in
            (ev,p3,r3)
          | _ -> err "err 45" )
      | Prj (e,i) ->
        let (ev,p1,r1) = vh_of_exp_ptn ev p0 r0 e in
        ( match r1 with
          | P_R rs ->
            let (cl,_) =
              Array.fold_left
                (fun (a,j) r ->
                   if i=j then (a,j+1)
                   else
                     let c0 = rm r in
                     (c0 @ a,j+1))
                ([],0) rs in
            let (ev,p2) = seqs ev p1 cl rs.(i) in
            (ev,p2,rs.(i))
          | P_Ro (rs,rt) ->
            let p2 = DName (sgn ()) in
            let ev = PtMap.add p1 (Seq(Rm rt,p2)) ev in
            let (cl,_) =
              Array.fold_left
                (fun (a,j) r ->
                   if i=j then (a,j+1)
                   else
                     let c0 = rm r in
                     (c0 @ a,j+1))
                ([],0) rs in
            let (ev,p3) = seqs ev p2 cl rs.(i) in
            (ev,p3,rs.(i))
          | P_A r1 ->
            let rs = Array.init (i-1) (fun i -> sgn ()) in
            let rt = sgn () in
            let p2 = DName (sgn ()) in
            let ev = PtMap.add p1 (Seq(Prj(r1,(rs,rt)),p2)) ev in
            let p3 = DName (sgn ()) in
            let ev = PtMap.add p2 (Seq(Rm rt,p3)) ev in
            let (cl,_) =
              Array.fold_left
                (fun (a,j) r ->
                   if i=j then (a,j+1)
                   else
                     let c0 = rm (P_A r) in
                     (c0 @ a,j+1))
                ([],0) rs in
            let (ev,p4) = seqs ev p3 cl (P_A rs.(i)) in
            (ev,p4,P_A rs.(i))
        )
      | Atm a -> vh_of_exp ev p0 r0 a
    )
  and vh_of_exp ev p r e =
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
    let r0 = sgn () in
    let r1 = P_A r0 in
    let p1 = DName (sgn ()) in
    let ev = PtMap.add p (Seq(Ini(r0,Tkn.Tkn k),p1)) ev in
    let ev = PtMap.add p1 (Ret r1) ev in
    (ev,p1,r1)
  let c_m_of_g ev g =
    let m0 =
      BatList.fold_left
        (fun ev e ->
           ( match e with
             | Ast.Etr (n,_,_,_,f) ->
               let r0 = P_A (sgn ()) in
               let pn = Name n in
               let (ev,_,_) = vh_of_ast ev pn r0 f in
               ev
             | Etr_Clq(_,l) ->
               BatList.fold_left
                 (fun ev (name,_,_,f) ->
                    let r0 = P_A (sgn ()) in
                    let pn = Name name in
                    let (ev,_,_) = vh_of_ast ev pn r0 f in
                    ev)
                 ev l
             | _ -> err "err10"))
        PtMap.empty g in
    m0
end
module Asm = struct
  type pt = int
  type r = int
  type ('r, 'p) op =
    | Etr of 'r Rcd_Ptn.t
    | Ret of 'r Rcd_Ptn.t
    | Agl of 'r * (('r Rcd_Ptn.t * pt) array) * (('r Rcd_Ptn.t) * pt)
    | Nd of ('r, 'p) IR.nd
  type t = ((r,  pt) op) array
  type etr_vct = (int IR.PtMap.t * (r Rcd_Ptn.t)) * t
  let save_etr_vct ev = ()
  let save_tkn k p = ()
  let load_tkn _ = ()
  let rec asm_of_ir nm ev p0 j =
    let c0 = IR.find p0 ev in
    ( match c0 with
      | IR.Ret r -> (IR.PtMap.add p0 j nm,[|Ret r|],j+1)
      | IR.Agl (ra,ps,(rr,pr)) ->
        let (nm,a0,psi,j0) = Array.fold_left
            (fun (nm,a0,psi,j0) (ri,pi) ->
               let nm = IR.PtMap.add pi j0 nm in
               let (nm,a1,j0) = asm_of_ir nm ev pi j0 in
               (nm,a0 |+| a1,psi |+| [|(ri,j0)|],j0))
            (nm,[||],[||],j+1) ps in
        let (nm,ar,n) = asm_of_ir nm ev pr j0 in
        (nm,[|(Agl(ra,psi,(rr,j0)))|] |+| a0 |+| ar,n)
      | IR.Seq (o,p1) ->
        let nm = IR.PtMap.add p0 j nm in
        let (nm,a0,n0) = asm_of_ir nm ev p1 (j+1) in
        (nm,[|Nd o|] |+| a0,n0)
      | _ -> err "asm_of_ir:0"
    )
  let rec asm_of_c_m ev =
    let nm = IR.PtMap.empty in
    let (a,_,nm) =
      IR.PtMap.fold
        (fun p o (a,j,nm) ->
           ( match p with
             | IR.Name n ->
               let nm = IR.PtMap.add p j nm in
               let (nm,a,j) = asm_of_ir nm ev p j in
               (a,j,nm)
             | IR.DName d -> (a,j,nm)))
        ev ([||],0,nm) in
    (a,nm)
  and asm_of_ini nm a0 =
    Array.map
      (fun n0 ->
         ( match n0 with
           | Nd IR.Ini(r0,k0) -> Nd (IR.Ini(r0,asm_tkn nm k0))
           | _ -> n0))
      a0
  and asm_tkn nm k0 =
    let open Tkn in
    ( match k0 with
      | Rcd l -> Rcd (Array.map (asm_tkn nm) l)
      | Tkn tk ->
        let tki =
          ( match tk with
            | Fnc p -> Fnc(IR.PtMap.find p nm)
            | Clj (p,k1) -> Clj(IR.PtMap.find p nm,asm_tkn nm k1)
            | _ -> tk
          ) in
        Tkn tki
    )
end
module Typing = struct
  open Tm open Types
  open Rcd_Ptn open Ast open IR
  let rec occurs v1 = function
    | Var v2 when v1 == v2 -> true
    | Var v2 ->
      ( match !v2 with
        | V_Var (p1,l1) ->
          let ml = (match !v1 with V_Var (_,l) -> min l l' | _ -> l') in
          v2 := V_Var (p1,ml);
          false
        | Link t1 -> occurs v1 t1 )
    | App(t1,t2)
    | Imp(t1,t2) -> occurs v1 t1; occurs v1 t2
    | Rcd l1 -> occurs_rcd l1
    | Rcd_Lb l1 -> occurs_rcd_lb l1
    | Rec rp -> occurs_rec rp
  let unify t0 t1 =
    ( match t0,t1 with
      | Val vp1,t2
      | t2,Val vp1 ->
        ( match get_v vm vp1 with
          | V_Val(v1,l1) ->
            ( match t2 with
              | Rec(rp,rv) ->
                let _ = occurs_rec v1 rv in
                vp1 := Link (Ret(rp,rv));
                ()
              | _ ->
                let b = occurs v1 rv in
                if b then err "unify: 0"
                else vp1 := (Link t2); ()
            )
          | Link t3 -> unify t2 t3
        )
      | App(t2,t3),App(t4,t5)
      | Imp(t2,t3),Imp(t4,t5) -> unify t2 t4; unify t3 t5
      | Prm p1,Prm p2 -> if p1=p2 then vm else err "unify:1"
      | Rec(p1,v1),Rec(p2,v2) ->
        if p1=p2 then unify_rec rm v1 v2
        else
          let p3 = sgn () in
          p1 := p3; p2 := p3;
          unify_rec rm v1 v2
      | Rcd l1,Rcd l2 -> unify_rcd l1 l2
      | Rcd_Lb l1,Rcd_Lb l2 -> unify_rcd l1 l2
      | -> false
    )
  let gen l y =
    ( match y with
      | Var v ->
        ( match !v with
          | V_Var (v1,l) -> QVar v1
          | Link y1 -> gen l y1 )
      | App(t2,t3)
      | Imp(t2,t3) -> gen l t2; gen l t3
      | Prm p1,Prm p2 -> if p1=p2 then vm else err "unify:1"
      | Rec(p1,v1) -> gen_rec v1
      | Rcd l1 -> gen_rcd l l1
      | Rcd_Lb l1 -> gen_rcd_lb l l1
      | _ -> y
    )
  let inst l y =
    let rec loop al = function
      | QVar p1 ->
        ( try (List.assoc p1 al,al)
          with Not_found ->
            let v1 = sgn () in
            (Var (ref (V_Var(v1,l))),(name,tv)::subst))
      | TVar {contents = Link ty} -> loop subst ty
      | TArrow (ty1,ty2) ->
        let (ty1,subst) = loop subst ty1 in
        let (ty2,subst) = loop subst ty2 in
        (TArrow (ty1,ty2), subst)
      | ty -> (ty, subst)
    in fun ty -> fst (loop [] ty)
  let subst_scm s ((a,e):(SgnSet.t * _)) =
    let open Tm in
    let s1 =
      SgnMap.fold
        (fun k v r ->
           if SgnSet.mem k a then r
           else SgnMap.add k v r)
        SgnMap.empty s in
    (a,s1<*e)
  let get_rm rm r =
    inst (SgnMap.find r rm)
  let get_scm rm r = SgnMap.find r rm
  let subst_rm s rm =
    SgnMap.map
      (fun q -> subst_scm s q)
      rm
  let ftvs_scm (a,e) = SgnSet.diff (Tm.ftvs e) a
  let ftvs_rm rm =
    SgnMap.fold
      (fun _ v r -> SgnSet.union (ftvs_scm v) r)
      rm SgnSet.empty
  let gen rm v =
    let (h,y) = SgnMap.find v rm in
    let h = (SgnSet.inter (ftvs_rm rm) (ftvs_scm (h,y))) in
    SgnMap.add v (h,y) rm
  let gens rm vs = List.fold_left (fun rm v -> gen rm v) rm vs
  let rec get_ptn rm rp =
    ( match rp with
      | Rcd_Ptn.P_A r -> get rm r
      | Rcd_Ptn.P_R rs ->
        let ts = Array.map (get_ptn rm) rs in
        Types.rcd_cl (Array.to_list ts)
      | Rcd_Ptn.P_Ro (rs,rt) ->
        let ts = Array.map (get_ptn rm) rs in
        let tt = get_rm rm rt in
        Types.rcd_cns (Array.to_list ts) tt
    )
  let rec slv l rm c0 p0 =
    ( match find c0 p0 with
      | Etr(r,p1) ->
        let (rm,_) = new_val_ptn (l+1) rm r in
        slv (l+1) rm c0 p1
      | Clj (_,_,_,_) -> err "slv:0"
      | Prd (_,_,_,_) -> err "slv:1"
      | Agl(ra,ps,(rr,pr)) ->
        let ta = inst (l+1) rm ra in
        let ts =
          Array.fold_left
            (fun (rm,ts) (r,_) ->
               let (rm,ti) = new_val_ptn (l+1) rm r in
               (rm,ts |+| [|ti|]))
            (rm,[||]) ps in
        let (s0,t0) = unify [(ta,coprd_cl ts)] in
        let rm = subst_rm s0 rm in
        let rm = gen l rm (*
          Array.fold_left
            (fun (r,_) -> gen_ptn l rm r) rm rs in *) in
        let rm =
          Array.fold_left
            (fun rm (_,p) -> slv l rm c0 p) rm ps in
        let tts = Array.map (fun (_,p) -> inst_ptn (l+1) rm (ret c0 p)) in
        let (rm,rrt) = new_val_ptn (l+1) rm rr in
        let (s1,t1) = unifys (rrt::(Array.to_list tts)) in
        let rm = subst_rm s1 rm in
        let rm = gen l rm in
        let rm slv l rm c0 pr
          | Ret r -> rm
          | Seq(o,p1) ->
            ( match o with
              | Id (r,rs) ->
                let (rm,ts) = new_val_rs (l+1) rm rs in
                let t = inst (l+1) rm r in
                let (s0,t0) = unifys @@ t::(Array.to_list ts) in
                let rm = subst_rm s0 rm in
                let rm =
                  Array.fold_left
                    (fun r -> gen l rm r) rm rs in
                slv l rm c0 tl
              | Prj(r0,(rs,rt)) ->
                let (rm,ts) = new_val_rs (l+1) rm rs in
                let t = inst (l+1) rm r in
                let (s0,t0) = unifys @@ t::(Array.to_list ts) in
                let rm = subst_rm s0 rm in
                let rm =
                  Array.fold_left
                    (fun r -> gen l rm r) rm rs in
                slv l rm c0 tl
              | Cns((rs,rt),r0) ->
                let (rm,ts) = new_val_rs (l+1) rm rs in
                let t = inst (l+1) rm r in
                let (s0,t0) = unifys @@ t::(Array.to_list ts) in
                let rm = subst_rm s0 rm in
                let rm =
                  Array.fold_left
                    (fun r -> gen l rm r) rm rs in
                slv l rm c0 tl
              | Rm r -> slv l rm c0 tl
              | Call(y,f,x) ->
                slv l rm c0 tl
              | Ini(r,k) ->
                slv l rm c0 tl
            )
    )
  let rec gnr rm ev p =
    ( match IR.find p ev with
      | IR.Etr (r,p1) -> []
      | IR.Agl (ra,ps,(rr,pr)) ->
        let ta = get rm ra in
        let ts = Array.to_list (Array.map (fun (r,_) -> get_ptn rm r) ps) in
        let c = [(ta,CPo(vsgn(),ts))] in
        let c =
          Array.fold_left (fun c0 (r,p) -> c0 @ gnr rm ev p) c ps in
        let trs = Array.map (fun (_,p) -> get_ptn rm (ret ev p)) ps in
        let tt = get_ptn rm rr in
        let cl = unifys_cxt (Array.to_list ([|tt|] |+| trs)) in
        let c = c @ cl in
        let cr = gnr rm ev pr in
        c @ cr
      | Ret _ -> (cxt_ini,rm)
      | Seq (o,p1) ->
        let (rm,s0) =
          ( match o with
            | Id (r0,rs) ->
              unifys_cxt @@ (get_ptn rm r0)::(Array.to_list (Array.map (get__ptn rm) rs))
            | Prj (r0,(rs,rt)) ->
              let t0 = get rm r0 in
              let ts = Array.to_list @@ Array.map (fun r -> get rm r) rs in
              let tt = get rm rt in
              [(t0,rcd_op (ts,tt))]
            | Cns ((rs,rt),r0) ->
              let t0 = get rm r0 in
              let ts = Array.to_list @@ Array.map (fun r -> get rm r) rs in
              let tt = get rm rt in
              [(t0,rcd_op (ts,tt))]
            | Rm _ -> (rm,cxt_ini)
            | Call (y,f,x) ->
              let (ty,tf,tx) = (get_ptn rm y,get rm f,get_ptn_rm rm x) in
              [(tf,Imp tx ty)]
            | Ini (r,k) ->
              [(get rm r,gnr_tkn ev k)]
          ) in
        gnr rm ev p1
    )
  and gnr_tkn ev k =
    let open Tm in
    let open Tkn in
    ( match k with
      | Rcd l -> rcd_cl (Array.map (gnr_tkn km) l)
      | Tkn k ->
        ( match k with
          | Stg _ -> Prm Tm.Stg
          | Z _ -> (Prm Zn)<+(Prm Z_u)
          | Zn(_,z1) -> (Prm Zn)<+(vsgn ())
          | Sgn _ -> Prm Sgn
          | CoP (i,k0) ->
            let t0 = gnr_tkn ev k0 in
            let l0 = List.init (fun _ -> vsgn ()) (i-2) in
            let l1 = l0 @ [t0] in
            coprd_op l1
          | P (_,_) -> err "err t0"
          | Pls ->
            let t0 = zn () in
            imp (rcd_cl [t0;t0]) t0
          | Mlt ->
            let t0 = zn () in
            imp (rcd_cl [t0;t0]) t0
          | Mns ->
            let t0 = zn () in
            imp t0 t0
          | Cmp ->
            let v0 = vsgn () in
            imp (rcd_cl [z;z]) ((Prm Zn)<+(Prm (Z_n 2)))
          | Eq ->
            let v0 = vsgn () in
            imp (rcd_cl [v0;v0]) ((Prm Zn)<+(Prm (Z_n 2)))
          | Inj i ->
            let t0 = vsgn () in
            let ts = vsgn () in
            let l0 = List.init (fun _ -> vsgn ()) (i-1) in
            let l1 = l0 @ [t0] in
            imp t0 (coprd_op ts l1)
          | Cho _ -> err "err t2"
          | Fix ->
            let (a,b) = (sgn(),sgn()) in
            let (va,vb) = (Val a,Val b) in
            let h = SgnSet.add b (SgnSet.add a SgnSet.empty) in
            (h,imp (imp ((imp a b) (imp a b))) (imp a b))
          | Exn ->
            let a = sgn () in
            let va = Val a in
            (SgnSet.add a SgnSet.empty,imp (Prm Stg) a)
          | Fnc p ->
            let (re,p) = etr ev p in
            let rr = ret ev p in
            let (h0,te) = inst2 (get_ptn rm re) in
            let (h1,tr) = inst2 (get_ptn rm rr) in
            let t = (SgnSet.union h0 h1,imp te tr) in
            t
          | Clj _ -> err "t3"
        )
    )
end
