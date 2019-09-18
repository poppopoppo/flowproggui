open Util
module Rcd_Ptn = struct
  type 'a t =
    | R of ('a t) array
    | Ro of ('a t) array * 'a
    | A of 'a
    | Ro_Lb of ((string * 'a t) array) * 'a
    | R_Lb of (string * 'a t) array
  type path = lb list
  and lb = Lb of string | Idx of int
  let print_lb l =
    ( match l with
      | Lb s -> s
      | Idx i -> string_of_int i )
  let rec print f p =
    ( match p with
      | A r -> f r
      | R r -> "{ "^(Util.string_of_list " " (print f) (Array.to_list r))^" }"
      | Ro(rs,rt) -> "{ "^(Util.string_of_list " " (print f) (Array.to_list rs))^" < "^(f rt)^" }"
      | R_Lb rs -> "{> "^(Util.string_of_list " " (fun (lb,ri) -> lb^"~"^(print f ri)) (Array.to_list rs))^" }"
      | Ro_Lb(rs,rt) -> "{> "^(Util.string_of_list " " (fun (lb,ri) -> lb^"~"^(print f ri)) (Array.to_list rs))^" < "^(f rt)^" }"
    )
  let rec to_list p =
    ( match p with
      | A r -> [r]
      | R rs -> Array.fold_left (fun l r -> (to_list r) @ l) [] rs
      | Ro (rs,rt) -> rt::(Array.fold_left (fun l r -> (to_list r) @ l) [] rs)
      | _ -> [] )
  let p_a p =
    ( match p with
      | A r -> r
      | _ -> err "p_a:0" )
  let rec map f p =
    ( match p with
      | A r -> A (f r)
      | R rs -> R (Array.map (map f) rs)
      | Ro (rs,rt) -> Ro(Array.map (map f) rs,f rt)
      | R_Lb rs -> R_Lb(Array.map (fun (lb,r) -> (lb,map f r)) rs)
      | Ro_Lb(rs,rt) -> Ro_Lb(Array.map (fun (lb,r) -> (lb,map f r)) rs,f rt)
    )
  let rec get_path i p =
    let s = "⟦"^(Util.string_of_list "," print_lb i)^"⟧" in
    ( match i with
      | [] -> p
      | hd::tl ->
        ( match hd,p with
          | Idx hd,R rs ->
            if hd<(Array.length rs) then get_path tl rs.(hd)
            else err ("get_path 0:"^s)
          | Idx hd,Ro (rs,_) ->
            if hd<(Array.length rs) then get_path tl rs.(hd)
            else err ("get_path 1:"^s)
          | _ -> err ("get_path 2:"^s))
    )
  let rec set_path i p0 p1 =
    ( match i with
      | [] -> p1
      | hd::tl ->
        ( match hd,p0 with
          | Idx hd,R rs ->
            if hd<(Array.length rs)
            then
              R (Array.mapi
                   (fun i x -> if i=hd then set_path tl x p1 else x) rs)
            else err "get_path 0"
          | Idx hd,Ro (rs,rt) ->
            if hd<(Array.length rs)
            then
              let rs0 =
                (Array.mapi
                   (fun i x -> if i=hd then set_path tl x p1 else x)
                   rs) in
              Ro(rs0,rt)
            else err "get_path 1"
          | _ -> err "get_path 2")
    )
end
module Types = struct
  type level = int
  type prm =
    | Vct | Opn | Lst | Zn | N | Sgn | Stg | Z_u
    | Z_n of int | Axm of Sgn.t | Inj| Cho | Z_d of Sgn.t
    | Grm | EqT of string | Name of string
  type v_p = Sgn.t
  type ('y, 'k) v_t = | WC of 'k | V of 'k * level | Q of 'k * level | Ln of 'y
  and v = (t, unit) v_t
  and t =
    | Abs of v ref * t
    | Var of v ref | App of t * t
    | Imp of t * t | Prm of prm | Rcd of t_rcd
    | Rcd_Lb of t_rcd_lb | Rec of t_rec ref
  and v_rcd = (t_rcd, unit) v_t
  and v_rcd_lb = (t_rcd_lb, StgSet.t) v_t
  and t_rec = | CP of t * t_rcd | P of t * t * t_rcd | Rec_WC
  and t_rcd = | Cns of t * t_rcd | Uo of v_rcd ref | U
  and t_rcd_lb = | Cns_Lb of string * t * t_rcd_lb | Uo_Lb of v_rcd_lb ref | U_Lb
  type print = { rl : (t_rec ref) list; vl : (v ref) list; }
  let v_vct:((v ref) list ref) = ref []
  let v_rcd_lb_vct:((v_rcd_lb ref) list ref) = ref []
  let newvar () =
    let v = ref (WC ()) in
    v_vct := !v_vct@[v];
    v
  let newvar_l l =
    let v = ref (V ((),l)) in
    v_vct := !v_vct@[v];
    v
  let newvar_q l =
    let v = ref (Q ((),l)) in
    v_vct := !v_vct@[v];
    v
  let print_prm p =
    ( match p with
      | Vct -> "◃" | Opn -> "‹›" | Lst -> "⟦⟧" | Zn -> "ℤn"
      | N -> "ℕ" | Sgn -> "&" | Stg -> "ℙ" | Grm -> "Σ"
      | Z_u -> "ℤ_u" | Z_n n -> "ℤ_n["^(string_of_int n)^"]"
      | Axm p -> "p"^(Sgn.print p) | Inj -> "↑" | Cho -> "↓"
      | Z_d p -> "ℤ_d_"^(Sgn.print p) | EqT s -> s^"( = _)"
      | Name n -> n )
  let rec print_v v_vct v =
    (try (fst @@ BatList.findi (fun _ vi -> vi==v) !v_vct)
     with _ -> v_vct := !v_vct@[v]; print_v v_vct v)
  let rec print (rl:(t_rec ref list ref)) y =
    ( match y with
      | Var v ->
        let i = print_v v_vct v in
        ( match !v with
          | WC _-> "_"
          | V (_,l) -> "v"^(string_of_int i)^"''("^(string_of_int l)^")"
          | Q (_,l) -> "t"^(string_of_int i)^"'("^(string_of_int l)^")"
          | Ln y -> print rl y )
      | App(y0,y1) -> "("^(print rl y0)^")◂("^(print rl y1)^")"
      | Imp(y0,y1) -> (print rl y0)^"→"^(print rl y1)
      | Prm p -> print_prm p
      | Rcd r -> "{ "^(print_rcd rl r)^"}"
      | Rcd_Lb r ->
        "{> "^(print_rcd_lb rl r)^"}"
      | Rec r ->
        ( try
            let (i,_) = BatList.findi (fun _ p -> r==p) !rl in
            "@["^(string_of_int i)^"]"
          with Not_found ->
            rl := (!rl@[r]);
            let (i,_) = BatList.findi (fun _ p -> r==p) !rl in
            "@["^(string_of_int i)^"]."^(print_rec rl r)
        )
      | Abs(v,y) ->
        let i =fst @@ (BatList.findi (fun _ vi -> vi==v) !v_vct)in
        "∀["^(string_of_int i)^"]."^(print rl y)
    )
  and print_rec_a rl r =
    ( match !r with
      | CP(t0,_) -> "@."^(print rl t0)
      | P(t0,_,_) -> "@."^(print rl t0)
      | _ -> "@._" )
  and print_rec rl r =
    ( match !r with
      | CP(t0,t1) -> (print rl t0)^" ≃ ∐["^(print_rcd rl t1)^"]"
      | P(t0,tv,t1) -> (print rl t0)^" ≃ ∏["^(print rl tv)^" ⊢ "^(print_rcd rl t1)^"]"
      | _ -> "_" )
  and print_rcd rl r =
    ( match r with
      | U -> ""
      | Uo { contents = Ln r0 } -> print_rcd rl r0
      | Uo _ -> "<"
      | Cns(t0,t1) -> (print rl t0)^" "^(print_rcd rl t1) )
  and print_nr nr = "{> "^(StgSet.fold (fun lb p -> p^lb^"~| ") nr "")^"<}"
  and print_rcd_lb rl r =
    ( match r with
      | U_Lb -> ""
      | Uo_Lb v ->
        ( match !v with
          | Ln r0 ->  print_rcd_lb rl r0
          | WC nr -> "< _l"^(string_of_int (print_v v_rcd_lb_vct v))^"::"^(print_nr nr)
          | V (nr,l) -> "< l"^(string_of_int (print_v v_rcd_lb_vct v))^"''("^(string_of_int l)^")::"^(print_nr nr)
          | Q (nr,l) -> "< l"^(string_of_int (print_v v_rcd_lb_vct v))^"'("^(string_of_int l)^")::"^(print_nr nr) )
      | Cns_Lb(lb,t0,t1) -> lb^"~"^(print rl t0)^" "^(print_rcd_lb rl t1))
  let rec path i y : t =
    ( match i,y with
      | [],y -> y
      | (Rcd_Ptn.Idx hd)::tl,Rcd r -> path tl (path_rcd hd r)
      | _ -> err "path:0")
  and path_rcd j r =
    ( match j,r with
      | _,Uo { contents = Ln r0 } -> path_rcd j r0
      | 0,Cns(t0,_) -> t0
      | _,Cns(_,t1) -> path_rcd (j-1) t1
      | _ -> err "path_rcd" )
  let rec get_agl_i i y =
    ( match y with
      | Var { contents = Ln y0 } -> get_agl_i i y0
      | Rec { contents = CP(_,rs) } -> path_rcd i rs
      | _ -> err "get_agl_i 1" )
  let rec get_agl a i y =
    ( match i,y with
      | [],_ -> a
      | hd::tl,Rcd r -> Rcd (get_agl_rcd a hd tl r)
      | _ -> err "get_agl:0" )
  and get_agl_rcd a hd tl r =
    let open Rcd_Ptn in
    ( match hd,r with
      | _,Uo { contents = Ln r0 } -> get_agl_rcd a hd tl r0
      | Idx 0,Cns(t0,t1) -> Cns(get_agl a tl t0,t1)
      | Idx i,Cns(t0,t1) -> Cns(t0,get_agl_rcd a (Idx (i-1)) tl t1)
      | _ -> err "get_agl_rcd" )
  let new_wc () = newvar ()
  let rcd_cl l = List.fold_right (fun x r -> Cns(x,r)) l U
  let rcd_op l = List.fold_right (fun x r -> Cns(x,r)) l (Uo (ref (WC ())))
  let rec rcd_cns l t =
    ( match t with
      | Rcd t -> List.fold_right (fun x r -> Cns(x,r)) l t
      | Var { contents = Ln y } -> rcd_cns l y
      | _ -> err ("rcd_cns:"^(print (ref []) t)) )
  let rec get_lbs s r =
    ( match r with
      | U_Lb -> s
      | Uo_Lb { contents = Ln rt } -> get_lbs s rt
      | Cns_Lb(lb,_,rt) -> get_lbs (StgSet.add lb s) rt
      | _ -> s )
  let rcd_cl_lb l = List.fold_right (fun (lb,x) r -> Cns_Lb(lb,x,r)) l U_Lb
  let rec rcd_cns_lb l t =
    let s1 = List.fold_left (fun s (lb,_) -> StgSet.add lb s) StgSet.empty l in
    ( match t with
      | Rcd_Lb r ->
        let rec lp r =
          ( match r with
            | Cns_Lb(lb,y0,y1) ->
              if List.exists (fun (l,_) -> l=lb) l then err "rcd_cns_lb 0"
              else
                Cns_Lb(lb,y0,lp y1)
            | U_Lb -> List.fold_right (fun (n,x) r -> Cns_Lb(n,x,r)) l U_Lb
            | Uo_Lb v ->
              ( match !v with
                | Ln y -> lp y
                | V (nr,lv) ->
                  let y =
                    List.fold_right
                      (fun (n,x) r -> Cns_Lb(n,x,r))
                      l (Uo_Lb v) in
                  v := V(StgSet.union s1 nr,lv); y
                | _ -> err "rcd_cnd_lb 2" )) in
        lp r
      | Var v ->
        ( match !v with
          | Ln y -> rcd_cns_lb l y
          | _ -> err "rcd_cns_lb 3" )
      | _ -> err "rcd_cns_lb 4" )
  let zn v = Rec (ref (CP(App(Prm Zn,v),Cns(Rcd U,Cns(Rcd U,U)))))
  let opn v = Rec (ref (CP(App(Prm Opn,v),rcd_cl [(Rcd U);v])))
  let lst v =
    let rec y = ref(CP(App(Prm Lst,v),Cns((Rcd U),Cns(Rcd(Cns(v,Cns(Rec y,U))),U)))) in
    Rec y
  let coprd_cl a l =
    if (List.length l)>0 then CP(a,rcd_cl l)
    else err "coprd_cl"
  let coprd_op a l =
    if (List.length l)>0 then CP(a,rcd_op l)
    else err "coprd_op"
  let prd_cl a s l =
    if (List.length l)>0 then P(a,s,rcd_cl l)
    else err "prd_cl"
  let prd_op a s l =
    if (List.length l)>0 then P(a,s,rcd_op l)
    else err "prd_op"
  let rec abs a xs =
    ( match xs with
      | [] -> a
      | x::tl ->
        let a0 = abs a tl in
        let _ = mk_abs (ref []) x a0 in
        Abs(x,a0))
  and mk_abs rl x a =
    ( match a with
      | Abs(_,y0) -> mk_abs rl x y0
      | Var v ->
        ( match !v with
          | Q ((),-2) -> v := Ln (Var x)
          | Q ((),q) when q<(-2) -> v := Q ((),q+1)
          | Ln y -> mk_abs rl x y
          | _ -> () )
      | Imp(y0,y1)
      | App(y0,y1) -> mk_abs rl x y0; mk_abs rl x y1
      | Rcd r -> mk_abs_rcd rl x r
      | Rcd_Lb r -> mk_abs_rcd_lb rl x r
      | Rec r ->
        if List.exists (fun x -> x==r) !rl then ()
        else
          let _ = rl := r::!rl in
          mk_abs_rec rl x r
      | _ -> () )
  and mk_abs_rcd rl x r =
    ( match r with
      | Cns(y0,y1) -> mk_abs rl x y0; mk_abs_rcd rl x y1
      | U -> ()
      | Uo { contents = Ln y } -> mk_abs_rcd rl x y
      | _ -> () )
  and mk_abs_rcd_lb rl x r =
    ( match r with
      | Cns_Lb(_,y0,y1) -> mk_abs rl x y0; mk_abs_rcd_lb rl x y1
      | U_Lb -> ()
      | Uo_Lb { contents = Ln y } -> mk_abs_rcd_lb rl x y
      | _ -> () )
  and mk_abs_rec rl x r =
    ( match !r with
      | CP(y0,y1) -> mk_abs rl x y0; mk_abs_rcd rl x y1
      | P(y0,y1,y2) -> mk_abs rl x y0; mk_abs rl x y1; mk_abs_rcd rl x y2
      | _ -> ()
    )
end
module Tkn = struct
  type ('p, 'r) t =
    | Rcd of (('p, 'r) t) array
    | Rcd_Lb of ((string * ('p, 'r) t) array)
    | Tkn of ('p, 'r) tkn
  and ('p, 'r) tkn =
    | Name of string | Etr of ('p, 'r) etr | Stg of string | Z of int
    | Exn of string | P of ('p array) * (('p, 'r) t)
    | Zn of int * int | Sgn of Sgn.t | CoP of int * (('p, 'r) t)
    | Ast of Peg.ast | Vct of (('p, 'r) t , ('p, 'r) t) Hashtbl.t
  and ('p, 'r) etr =
    | Grm of Peg.grammar * string | Frgn of string
    | Clj of 'p * (('p, 'r) t)
    | Pls | Mlt | Mns | Exn_Ini | Fnc of 'p
    | Cmp | Eq | Inj of int | Cho of int | Fix
  exception Tkn_exn of string
  let rec print k =
    ( match k with
      | Rcd rs -> "{"^(Array.fold_left (fun s r -> s^" "^(print r)) "" rs)^"}"
      | Rcd_Lb rs ->
        "{>"^(Array.fold_left (fun s (l,r) -> s^" "^l^"~"^(print r)) "" rs)^"}"
      | Tkn v ->
        ( match v with
          | Name n -> n
          | Exn s -> "?."^"\""^s^"\""
          | Stg s ->
            if (String.length s)>=20
            then let s0 = String.sub s 0 20 in ("(\""^s0^"\""^"..)")
            else "\""^(String.escaped s)^"\""
          | Z z -> (string_of_int z)
          | Zn (z0,z1) -> "ℤ["^(string_of_int z1)^"]."^(string_of_int z0)
          | Sgn p -> "&."^(Sgn.print p)
          | CoP(i,ki) -> "∐["^(string_of_int i)^","^(print ki)^"]"
          | P (_,_) -> err "print"
          | Ast a -> Peg.print_ast a
          | Vct v ->
            let s0 =
              Hashtbl.fold
                ( fun b k s0 -> s0^" "^(print b)^"~"^(print k))
                v "#.{" in
            s0^" }"
          | Etr e -> print_etr e
        ))
  and print_etr e =
    ( match e with
      | Pls -> "+" | Mlt -> "*" | Mns -> "-" | Cmp -> "≤" | Eq -> "="
      | Inj i -> "∐["^(string_of_int i)^"]" | Cho i -> "∏["^(string_of_int i)^"]"
      | Fix -> "@" | Exn_Ini -> "?"
      | Fnc _ -> "Fnc"
      | Clj (_,_) -> "Clj"
      | Frgn n -> n
      | Grm (_,n) -> "Grm."^n )

  let vct_op v k a0 =
    if Hashtbl.mem v k
    then
      let a1 = Hashtbl.find v k in
      ( match a0 with
        | Tkn(CoP(0,Rcd [||])) -> ( Hashtbl.remove v k; a1)
        | _ -> ( Hashtbl.remove v k; Hashtbl.add v k a0; a1))
    else
      ( match a0 with
        | Tkn(CoP(0,Rcd [||])) -> Tkn(CoP(0,Rcd [||]))
        | _ -> (Hashtbl.add v k a0; Tkn(CoP(0,Rcd [||]))))
  let rec of_reg_ptn p =
    let open Rcd_Ptn in
    ( match p with
      | A a -> a
      | R rs -> Rcd (Array.map of_reg_ptn rs)
      | Ro (rs,rt) ->
        ( match rt with
          | Rcd rts -> Rcd ((Array.map of_reg_ptn rs) |+| rts)
          | _ -> err "of_reg_ptn 0" )
      | R_Lb rs -> Rcd_Lb (Array.map (fun (l,r) -> (l,of_reg_ptn r)) rs)
      | Ro_Lb (rs,rt) ->
        ( match rt with
          | Rcd_Lb rts -> Rcd_Lb ((Array.map (fun (l,r) -> (l,of_reg_ptn r)) rs) |+| rts)
          | _ -> err "of_reg_ptn 0" ))
  let rec get_path i k =
    ( match i,k with
      | [],_ -> k
      | hd::tl,Rcd rs -> get_path tl rs.(hd)
      | _ -> err "get_path 0"
    )
  let rec get_agl i k =
    ( match i,k with
      | [],_ -> agl k
      | (Rcd_Ptn.Idx hd)::tl,Rcd rs ->
        let (rs,j,_) =
          Array.fold_left
            (fun (rs,j,i) r ->
               if i=hd then
                 let (j,ki) = get_agl tl r in
                 (rs |+| [|ki|],j,i+1)
               else (rs |+| [|r|],j,i+1))
            ([||],0,0) rs in
        (j,Rcd rs)
      | _ -> err "get_agl:0" )
  and agl k =
    ( match k with
      | Tkn (CoP(m1,kx)) -> (m1,kx)
      | Tkn (Z z) -> ((if z=0 then 0 else 1),Rcd [||])
      | Tkn (Zn(z0,_)) -> ((if z0=0 then 0 else 1),Rcd [||])
      | _ -> err ("err 19:"^(print k)) )
end
module Ast = struct
  open Types
  type name = string
  type mdl = name * (glb_etr list)
  and scm = Types.t
  and mdl_gma = scm StgMap.t
  and glb_etr =
    | Etr of string * Types.t * Types.t * etr
    | Flow of flow
    | Etr_Clq of (string * Types.t * Types.t * etr) list
    | Flow_Clq of flow list
    | Gram of Peg.grammar
  and flow =
    | Def_Abs of name * args
    | Def_Prd of name * args * ((Types.t * name) list)
    | Def_CoPrd of name * args * ((Types.t * name) list)
    | Def_Fnt of name * (name list)
    | Def_EqT of name * args * Types.t
  and args = name list
  and exp_rcd =
    | Agl_Op of exp_rcd
    | Rot | Rcd of exp_rcd array
    | Rcd_Lb of (exp_rcd option) * (string * (exp_rcd option)) array
    | App of exp_rcd * exp_rcd | Prj of exp_rcd * Rcd_Ptn.lb
    | Atm of exp_atm
  and exp_atm =
    | Z of int | Zn of (int * int)
    | Fnc of (etr, r) Tkn.etr
    | Name of string | Stg of string
  and nd =
    | IR_Id of ptn * (ptn array)
    | IR_Call of (r * ptn) * ptn
    | IR_Glb_Call of string * ptn * ptn
    | IR_Out of r * ptn
    | IR_Glb_Out of string * ptn
    | IR_Clj of r * ptn * pt
    | IR_Exp of exp_rcd * ptn * ptn
    | IR_Prd of r * (r Rcd_Ptn.t) * (pt array)
  and r = Types.v ref
  and fnc = (etr, r) Tkn.etr
  and ptn = r Rcd_Ptn.t
  and tkn = (etr, r) Tkn.t
  and pt = ir_code ref
  and etr = ptn * pt
  and ir_code =
    | Seq of nd * ir_code
    | Ret of ptn
    | Agl of r * ((ptn * ir_code) array)
    | IL_Call of r * ptn
    | IL_Glb_Call of fnc * ptn
  type line =
    | End | Line of exp_rcd | Line_Agl of Rcd_Ptn.path * exp_rcd
  module VHash = Hashtbl.Make (struct type t = v ref let equal = (==) let hash = Hashtbl.hash end)
  type st = tkn VHash.t
  type idx = int VHash.t
  type cs_f =
    | CS_f of ((r * tkn) list) * pt
    | CS_f_il of pt
  type cs = cs_f Stack.t
  type ns = (string * Types.v ref) list ref
  type ns_t = (string * Types.v ref) list ref
  type ns_e = (string * tkn) list ref
  type ns_grm = (string * Types.t_rec ref) list ref
  type rm = (string * Types.v ref) list ref
  type ns_v = (string * etr) list ref
  let rm:rm = ref []
  let ns:ns = ref []
  let ns_t:ns_t = ref []
  let ns_e:(ns_e) = ref []
  let ns_grm:ns_grm = ref []
  let ns_v:ns_v = ref []
  type ir_mdl = {
    mutable ns_v : (string * etr) list;
    mutable ns : (string * Types.v ref) list;
    mutable ns_e : (string * tkn) list;
    mutable ns_t : (string * Types.v ref) list;
  }
  type et = ir_mdl * tkn
  type inst = {
    al:(v ref * v ref) list;
    al_rcd:(v_rcd ref * v_rcd ref) list;
    al_rcd_lb : (v_rcd_lb ref * v_rcd_lb ref) list;
    rl : (t_rec ref * t_rec ref) list;
  }
  let print_v v =
    ( try let (n,_) = List.find (fun (_,w) -> v==w) !rm in n
      with _ -> "_r"^(string_of_int (Types.print_v v_vct v)))
  let print_st st =
    (VHash.fold
       (fun k v s ->
          s^" "^(print_v k)^"~"^(Tkn.print v))
       st "{> ")^" }\n"
  let rec print_mdl (n,g) =
    let s0 = "§§ "^n^"\n" in
    let rec lp g =
      ( match g with
        | [] -> "§§.\n"
        | hd::tl ->
          let s1 =
            ( match hd with
              | Etr(n,_,_,_) -> "§ .."^n^"\n"
              | Flow f -> "¶ "^(print_flow f)
              | Etr_Clq _ -> "§ @. .. "^"\n"
              | Flow_Clq _ -> "¶ @. .."^"\n"
              | Gram g -> "¶+ℙ "^"\n"^(Peg.print g) ) in
          s1^(lp tl)) in
    s0^(lp g)
  and print_flow f =
    ( match f with
      | (Def_Abs(n,a)) -> let sa = print_args a in n^sa^"\n"
      | (Def_CoPrd(n,a,ps)) ->
        let ss =
          List.fold_left
            (fun ss (y,n) ->
               ss^"\t∐ "^(Types.print (ref []) y)^" : "^n^"\n")
            "" ps in
        let sa = print_args a in
        n^sa^" ≃ "^ss
      |  _ -> "¶"^"\n" )
  and print_args l =
    if l=[] then "" else List.fold_left (fun s _ -> s^"'") "◂" l
  let tk_agl a =
    let i = ref [] in
    let b = ref false in
    let rec lp p a =
      ( match a with
        | Agl_Op r -> i := p; b := true; r
        | Rcd r -> Rcd (Array.mapi (fun i r -> lp ((Rcd_Ptn.Idx i)::p) r) r)
        | _ -> a ) in
    let a = lp [] a in
    if !b then (!i,a) else err "tk_agl:0"
end

let rtl = " : "
let op0 = " \\ "
open Ast
let rec pnt_ptn r = Rcd_Ptn.print print_reg r
and print_etr ((r,p):etr) =
  "\t|» "^(pnt_ptn r)^"\n"^(print_ir !p)
and print_ir p0 =
  ( match p0 with
    | Seq (o,p1) -> "\t"^(print_nd o)^"\n"^(print_ir p1)
    | Ret r -> "\t∎ "^(Rcd_Ptn.print print_reg r)^"\n"
    | Agl (r,ps) -> "\t∠ "^(pnt_ptn (Rcd_Ptn.A r))^"\n"^(print_ir_coprds ps)
    | IL_Glb_Call(n,r) -> "\t"^(Tkn.print_etr n)^"\t"^(pnt_ptn r)^" ⊢|"
    | IL_Call(f,x) -> "\t"^(print_reg f)^","^(pnt_ptn x)^" ⊢|"
  )
and print_line p0 =
  ( match p0 with
    | Seq (o,_) -> (print_nd o)^"\n"
    | Ret r -> "∎ "^(pnt_ptn r)^"\n"
    | Agl (r,_) -> "∠ "^(print_reg r)^"\n"
    | IL_Call(f,x) -> "◂ "^(print_reg f)^","^(pnt_ptn x)^" ⊢|\n"
    | IL_Glb_Call(n,r) -> (Tkn.print_etr n)^"\t"^(pnt_ptn r)^" ⊢|" )
and print_ir_coprds ps =
  Array.fold_left
    (fun s (r,p) ->
       s^"\t∐ "^(pnt_ptn r)^"\n"^(print_ir p))
    "" ps
and print_nd o =
  ( match o with
    | IR_Clj (_,_,_) -> "||»"
    | IR_Prd (_,_,_) -> "∆ "
    | IR_Id(r,rs) -> "$ "^(pnt_ptn r)^" ⊢ "^(Arr.fld_l (fun s r -> s^","^(pnt_ptn r)) "" rs)^rtl^(Arr.fld_l (fun s r -> s^","^(print_ty r)) "" rs)
    | IR_Out(_,_) -> "|◂"
    | IR_Glb_Out(n,_) -> n^" |⊢"
    | IR_Glb_Call(n,x,y) -> n^" "^(pnt_ptn x)^" ⊢ "^(pnt_ptn y)^rtl^(print_ty y)
    | IR_Call((f,x),y) -> "◂ "^(print_reg f)^" , "^(pnt_ptn x)^" ⊢ "^(pnt_ptn y)^rtl^(print_ty y)
    | IR_Exp(e,r0,r1) -> "» "^(print_exp e)^" |~ "^(pnt_ptn r0)^" ⊢ "^(pnt_ptn r1)^rtl^(print_ty r1)
  )
and print_exp e =
  ( match e with
    | Agl_Op e -> "∠"^(print_exp e)
    | Rot -> "$"
    | Rcd es -> "{ "^(Array.fold_left (fun s e -> s^" "^(print_exp e)) "" es)^" }"
    | Rcd_Lb (o,es) ->
      let so =
        ( match o with
          | None -> "}"
          | Some e -> "< "^(print_exp e)^" }" ) in
      let s0 =
        Array.fold_left
          (fun s (l,e) ->
             match e with
             | None -> s^" "^l^"~|"
             | Some e -> s^" "^l^"~"^(print_exp e))
          "{>" es in
      s0^so
    | App (e0,e1) ->
      "("^(print_exp e0)^"◂"^(print_exp e1)^")"
    | Prj(e0,l) -> (print_exp e0)^"◃"^(Rcd_Ptn.print_lb l)
    | Atm a ->
      ( match a with
        | Z i -> string_of_int i
        | Zn(z0,z1) -> "ℤ["^(string_of_int z1)^"]."^(string_of_int z0)
        | Name s -> s
        | Stg s -> "\""^s^"\""
        | Fnc k -> Tkn.print_etr k ))
and print_reg r =
  (try
     let (n,_) = Lst.find (fun (_,v) -> r==v) !rm in
     n
   with _ -> "_r"^(string_of_int (Types.print_v Types.v_vct r)) )
and print_ty r = Rcd_Ptn.print (fun v -> Types.print (ref []) (Types.Var v)) r
let rtn p =
  ( match !p with
    | Seq(IR_Call ((_,_),y),p1) -> (y,p1)
    | Seq(IR_Glb_Call(_,_,y),p1) -> (y,p1)
    | _ -> err "etr:0" )
let get_r st r =
  let open Tkn in
  let k =  (try VHash.find st r with _ -> err ("get_r 0:")) in
  let _ = VHash.remove st r in
  ( match k with
    | Tkn(Exn s) -> raise (Tkn_exn s)
    | _ -> k )
let rec get_reg_ptn (st:st) r =
  let open Rcd_Ptn in
  let open Tkn in
  ( match r with
    | A r0 -> get_r st r0
    | R rs ->
      let ks =
        Array.fold_left
          (fun ks r0 ->
             let ki = get_reg_ptn st r0 in
             ks |+| [|ki|]) [||] rs in
      Rcd ks
    | Ro (rs,rt) ->
      let ks =
        Array.fold_left
          (fun ks r0 -> ks |+| [|get_reg_ptn st r0|])
          [||] rs in
      let kts = get_r st rt in
      ( match kts with
        | Rcd l -> Rcd (ks |+| l)
        | _ -> err "get_reg_ptn 0")
    | R_Lb rs ->
      let ks =
        Array.fold_left
          (fun ks (lb,r0) ->
             let ki = get_reg_ptn st r0 in
             ks |+| [|(lb,ki)|]) [||] rs in
      Rcd_Lb ks
    | _ -> err "get_reg_ptn"
  )
let get_reg_ptn_exn st r =
  let open Tkn in
  ( try get_reg_ptn st r
    with | Tkn_exn s -> Tkn(Exn s) )
let print m =
  let s_ns =
    List.fold_left
      (fun s_ns (n,v) -> s_ns^"` "^n^" : "^(Types.print (ref []) (Types.Var v))^"\n")
      "" m.ns in
  let s_ns_e =
    List.fold_left
      (fun s_ns_e (n,k) -> s_ns_e^"§ "^n^"="^(Tkn.print k)^"\n")
      "" m.ns_e in
  let s_ns_t =
    List.fold_left
      (fun s_ns_t (n,t) -> s_ns_t^"¶ "^n^"="^(Types.print (ref []) (Types.Var t))^"\n")
      "" m.ns_t in
  let s_ns_v =
    List.fold_left
      (fun s_ns_v (n,p) ->
         let v = List.assoc n m.ns in
         let p0 = Types.print (ref []) (Types.Var v) in
         let sf = "§ "^n^" : "^p0 in
         let sc = print_etr p in
         s_ns_v^sf^"\n"^sc)
      "" m.ns_v in
  s_ns^s_ns_e^s_ns_t^s_ns_v
let set_r (st:st) r k =
  VHash.add st r k
let rec set_reg_ptn (st:st) r k =
  let open Rcd_Ptn in
  let open Tkn in
  ( match r with
    | A r -> set_r st r k
    | R rs ->
      ( match k with
        | Tkn _ -> err "set_reg_ptn 1"
        | Rcd l ->
          let _ =
            Array.fold_left
              (fun i r ->
                 let _ = set_reg_ptn st r l.(i) in
                 i+1)
              0 rs in
          ()
        | Rcd_Lb _ -> err "set_reg_ptn 3" )
    | Ro (rs,rt) ->
      ( match k with
        | Tkn _ -> err "set_reg_ptn 0"
        | Rcd l ->
          let i =
            Array.fold_left
              (fun i r ->
                 let _ = set_reg_ptn st r l.(i) in
                 i+1)
              0 rs in
          let ln = Array.length l in
          if i=ln
          then set_r st rt (Rcd [||])
          else set_r st rt (Rcd(Array.init (ln-i) (fun n -> l.(i+n))))
        | _ -> err "set_reg_ptn 4"
      )
    | R_Lb rs ->
      ( match k with
        | Tkn _ -> err "set_reg_ptn 1"
        | Rcd_Lb l ->
          let _ =
            Array.fold_left
              (fun i (lb,r) ->
                 let (_,ri) =
                   BatArray.find (fun (l0,_) -> l0=lb) l in
                 let _ = set_reg_ptn st r ri in
                 i+1)
              0 rs in
          ()
        | _ -> err "set_reg_ptn 3" )
    | _ -> err "set_reg_ptn 0"
  )
let rec set_cs_k (st:st) l =
  ( match l with
    | [] -> ()
    | (r,k)::tl -> set_r st r k; set_cs_k st tl )
let get_cs_k st = VHash.fold (fun r k l -> VHash.remove st r; (r,k)::l) st []
let free_st st = VHash.clear st
let rec run m p0 (st:st) cs =
  let s0 = (print_st st)^(print_line p0)^"~~~~~~~~~~~~~~~~~~~~\n" in
  Util.pnt true s0;
  ( try
      ( match p0 with
        | Ret r ->
          let k = get_reg_ptn_exn st r in
          if Stack.is_empty cs then k
          else
            let hd = Stack.pop cs in
            ( match hd with
              | CS_f_il pe ->
                let (r0,p1) = rtn pe in
                let _ = set_reg_ptn st r0 k in
                run m p1 st cs
              | CS_f (l,pe) ->
                let (r0,p1) = rtn pe in
                let _ = free_st st in
                let _ = set_cs_k st l in
                let _ = set_reg_ptn st r0 k in
                run m p1 st cs
            )
        | Agl (ra,ps) ->
          ( try
              let k0 = get_reg_ptn st (Rcd_Ptn.A ra) in
              let open Tkn in
              let (j,k1) = agl k0 in
              let (rx,pr) = ps.(j) in
              let _ = set_reg_ptn st rx k1 in
              run m pr st cs
            with Tkn.Tkn_exn s ->
              ret m st cs (Tkn.Tkn(Tkn.Exn s)))
        | IL_Glb_Call(n,r) ->
          let kx = get_reg_ptn_exn st r in
          let y = app m (Tkn.Tkn(Tkn.Etr n)) kx in
          ( match y with
            | `Tkn k ->
              if Stack.is_empty cs then k
              else
                let hd = Stack.pop cs in
                ( match hd with
                  | CS_f_il pe ->
                    let (r0,p1) = rtn pe in
                    let _ = set_reg_ptn st r0 k in
                    run m p1 st cs
                  | CS_f (l,pe) ->
                    let (r0,p1) = rtn pe in
                    let _ = free_st st in
                    let _ = set_cs_k st l in
                    let _ = set_reg_ptn st r0 k in
                    run m p1 st cs
                )
            | `Fnc p ->
              let _ = get_cs_k st in
              let (re,p1) = p in
              let _ = set_reg_ptn st re kx in
              run m !p1 st cs )
        | IL_Call(f,x) ->
          let kx = get_reg_ptn_exn st x in
          let kf = get_reg_ptn_exn st (Rcd_Ptn.A f) in
          let y = app m kf kx in
          ( match y with
            | `Tkn k ->
              if Stack.is_empty cs then k
              else
                let hd = Stack.pop cs in
                ( match hd with
                  | CS_f_il pe ->
                    let (r0,p1) = rtn pe in
                    let _ = set_reg_ptn st r0 k in
                    run m p1 st cs
                  | CS_f (l,pe) ->
                    let (r0,p1) = rtn pe in
                    let _ = free_st st in
                    let _ = set_cs_k st l in
                    let _ = set_reg_ptn st r0 k in
                    run m p1 st cs
                )
            | `Fnc p ->
              let _ = get_cs_k st in
              let (re,p1) = p in
              let _ = set_reg_ptn st re kx in
              run m !p1 st cs )
        | Seq (o,p1) ->
          ( match o with
            | IR_Prd (_,_,_) -> err "err 10"
            | IR_Clj (_,_,_) -> err "err 11"
            | IR_Exp (e,_,r1) ->
              let k =
                ( match e with
                  | Atm a ->
                    ( match a with
                      | Z i -> Tkn.Z i | Zn (z0,z1) -> Tkn.Zn(z0,z1)
                      | Name n -> Tkn.Name n
                      | Stg s -> Tkn.Stg s
                      | Fnc f -> Tkn.Etr f
                    )
                  | _ -> err "run x8" ) in
              let _ = set_reg_ptn st r1 (Tkn.Tkn k) in
              run m p1 st cs
            | IR_Id (r1,r2) ->
              let k1 = get_reg_ptn_exn st r1 in
              (* Util.pnt true ((Tkn.print k1)^"\n"); *)
              let _ = Array.fold_left (fun _ r -> set_reg_ptn st r k1) () r2 in
              run m p1 st cs
            | IR_Call ((r1,rp2),rp0) ->
              let k_f = get_reg_ptn_exn st (Rcd_Ptn.A r1) in
              let kx = get_reg_ptn_exn st rp2 in
              let y = app m k_f kx in
              ( match y with
                | `Tkn y ->
                  let _ = set_reg_ptn st rp0 y in
                  run m p1 st cs
                | `Fnc (re,p1) ->
                  let l = get_cs_k st in
                  let _ = set_reg_ptn st re kx in
                  Stack.push (CS_f(l,ref p0)) cs;
                  run m !p1 st cs )
            | IR_Glb_Call (n,x,y) ->
              let kx = get_reg_ptn_exn st x in
              let ky = app m (Tkn.Tkn(Tkn.Name n)) kx in
              ( match ky with
                | `Tkn ky ->
                  let _ = set_reg_ptn st y ky in
                  run m p1 st cs
                | `Fnc (re,p1) ->
                  let l = get_cs_k st in
                  let _ = set_reg_ptn st re kx in
                  Stack.push (CS_f(l,ref p0)) cs;
                  run m !p1 st cs )
            | IR_Out (_,_) -> err "run a4"
            | IR_Glb_Out(_,_) -> err "run a5"
          )
      )
    with
    | Failure e ->
      let s0 = (print_st st)^(print_line p0) in
      err ("run x:Failure "^e^"\n"^s0)
    | _ ->
      let s0 = (print_st st)^(print_line p0) in
      err s0 )
and ret m st cs k =
  if Stack.is_empty cs then k
  else
    let hd = Stack.pop cs in
    ( match hd with
      | CS_f_il pe ->
        let (r0,p1) = rtn pe in
        let _ = set_reg_ptn st r0 k in
        run m p1 st cs
      | CS_f (l,pe) ->
        let (r0,p1) = rtn pe in
        let _ = free_st st in
        let _ = set_cs_k st l in
        let _ = set_reg_ptn st r0 k in
        run m p1 st cs
    )
and app m f x =
  let open Tkn in
  ( match f,x with
    | Tkn(Exn s0),Tkn(Exn s1) -> `Tkn(Tkn(Exn ("◂ "^s0^","^s1)))
    | Tkn (Exn s),_
    | _,Tkn(Exn s) ->`Tkn(Tkn(Exn s))
    | Tkn Etr e,_ ->
      ( match e,x with
        | Mns,Tkn (Z z) -> `Tkn (Tkn (Z (-z)))
        | Mns,Tkn (Zn(z0,z1)) -> `Tkn(Tkn(Zn(z1-(z0 mod z1),z1)))
        | Inj i,_ -> `Tkn (Tkn (CoP(i,x)))
        | (Cho _),_ -> err "err 7"
        | Exn_Ini,Tkn(Stg s) -> `Tkn(Tkn(Exn s))
        | Fix,_ -> err "err 9"
        | (Fnc pa),_ -> `Fnc pa
        | (Clj (_,_)),_ -> err "run 3"
        | Pls,Rcd [|(Tkn Z z1);(Tkn Z z2)|] -> `Tkn (Tkn (Z (z1+z2)))
        | Pls,Rcd [|(Tkn Zn(z1,z2));(Tkn Zn(z3,z4))|] when z2=z4 ->
          `Tkn (Tkn (Zn((z1+z3) mod z2,z2)))
        | Mlt,Rcd [|(Tkn Z z1);(Tkn Z z2)|] -> `Tkn (Tkn (Z (z1*z2)))
        | Mlt,Rcd [|(Tkn Zn(z1,z2));(Tkn Zn(z3,z4))|] when z2=z4 ->
          `Tkn (Tkn (Zn((z1*z3) mod z2,z2)))
        | Cmp,Rcd [|(Tkn Z z1);(Tkn Z z2)|] ->
          let b = if z1<=z2 then 1 else 0 in
          `Tkn (Tkn (Zn(b,2)))
        | Eq,Rcd [|x;y|] ->
          let b = if x=y then 1 else 0 in
          `Tkn (Tkn (Zn (b,2)))
        | (Grm (g,n)),Tkn Stg s ->
          let (a,s0) = Peg.parse g n s in
          ( match a with
            | None -> `Tkn (Rcd [| (Tkn(CoP(0,Rcd [||]))); (Tkn(Stg s0)) |])
            | Some a -> `Tkn(Rcd [|(Tkn(CoP(1,Tkn(Ast a))));(Tkn(Stg s0))|])
          )
        | (Frgn f),_ ->
          `Tkn(frgn f x)
        | _ -> err "app 0"      )
    | Tkn.Tkn (Tkn.Name n),_ ->
      let e =
        ( try (Tkn.Tkn(Tkn.Etr(Tkn.Fnc(List.assoc n m.ns_v))))
          with Not_found ->
            ( try List.assoc n m.ns_e
              with _ -> err "app 7"            )) in
      app m e x
    | _ -> err "app:1"
  )
and frgn f x =
  let open Tkn in
  ( match f with
    | "&" ->
      ( match x with
        | Tkn.Rcd [||] -> Tkn.Tkn(Tkn.Sgn (sgn ()))
        | _ -> err "app 3" )
    | "⊵" ->
      ( match x with
        | Tkn.Rcd [|Tkn.Rcd[|Tkn.Tkn Tkn.Vct v;k|];a0|] ->
          let a1 = Tkn.vct_op v k a0 in
          Tkn.Rcd [|Rcd[|(Tkn (Vct v));k|];a1|]
        | _ -> err "app 8" )
    | "#" ->
      ( match x with
        | Tkn.Rcd [||] -> Tkn.Tkn(Vct (Hashtbl.create 10))
        | _ -> err "app 3" )
    | "pnt" ->
      let s = Tkn.print x in
      Util.pnt true ("pnt:"^s^"\n");
      Tkn.Rcd [||]
    | "read" ->
      ( match x with
        | Tkn.Tkn(Tkn.Stg s) ->
          let l = Util.load_file s in
          Tkn.Tkn (Tkn.Stg l)
        | _ -> err "read 0" )
    | _ -> err "frgn 0"
  )
open Types
let rec occurs rl v1 =
  function
  | Var v2 ->
    if v1 == v2 then true
    else
      ( match !v2 with
        | V (k,l1) ->
          let ml = (match !v1 with V (_,l) -> min l l1 | _ -> l1) in
          v2 := V (k,ml); false
        | WC _ ->
          ( match !v1 with
            | V (k,l) -> v2 := V (k,l); false
            | _ -> false )
        | Ln t1 -> occurs rl v1 t1
        | Q _ -> err "occurs:0" )
  | App(t1,t2)
  | Imp(t1,t2) -> (occurs rl v1 t1) || (occurs rl v1 t2)
  | Rcd l1 -> occurs_rcd rl v1 l1
  | Rcd_Lb l1 -> occurs_rcd_lb rl v1 l1
  | Rec rp ->
    if List.exists (fun p -> rp==p) rl then false
    else occurs_rec (rp::rl) v1 rp
  | _ -> false
and occurs_rcd rl v1 l1 =
  ( match l1 with
    | U -> false
    | Uo t ->
      ( match !t with
        | Ln t0 -> occurs_rcd rl v1 t0
        | _ -> false )
    | Cns(t1,t2) -> (occurs rl v1 t1)||(occurs_rcd rl v1 t2))
and rcd_occurs (v1:v_rcd ref) (l1:t_rcd) =
  ( match l1 with
    | U -> false
    | Uo t ->
      ( match !t with
        | V (k,l1) ->
          let ml = (match !v1 with V (_,l) -> min l l1 | _ -> l1) in
          t := V (k,ml);
          false
        | WC _ ->
          ( match !v1 with
            | V (k,l) -> t := V (k,l); false
            | _ -> false )
        | Ln t1 -> rcd_occurs v1 t1
        | Q _ -> err "occurs:0" )
    | Cns(_,t2) -> rcd_occurs v1 t2)
and occurs_rcd_lb rl (v1:v ref) (l1:t_rcd_lb) =
  ( match l1 with
    | U_Lb -> false
    | Uo_Lb t ->
      ( match !t with
        | V (k,l1) ->
          let ml = (match !v1 with V (_,l) -> min l l1 | _ -> l1) in
          t := V (k,ml);
          false
        | WC _ -> false
        | Ln t1 -> occurs_rcd_lb rl v1 t1
        | Q _ -> err "occurs:0" )
    | Cns_Lb(_,t1,t2) -> (occurs rl v1 t1)||(occurs_rcd_lb rl v1 t2))
and rcd_lb_occurs (v1:v_rcd_lb ref) (l1:t_rcd_lb) =
  ( match l1 with
    | U_Lb -> false
    | Uo_Lb t ->
      if t==v1 then true
      else
        ( match !t with
          | Ln t0 -> rcd_lb_occurs v1 t0
          | V (nr0,l0) ->
            ( match !v1 with
              | V (nr1,l1) ->
                let l2 = min l0 l1 in
                let nr2 = StgSet.union nr0 nr1 in
                t := V(nr2,l2); false
              | _ -> err "rcd_lb_occurs 1" )
          | _ -> err "rcd_lb_occurs 0" )
    | Cns_Lb(_,t1,t2) ->
      let lv =
        ( match !v1 with
          | V (_,l1) -> l1
          | _ -> err "rcd_lb_occurs 2" ) in
      let _ = occurs [] (newvar_l lv) t1 in
      rcd_lb_occurs v1 t2 )
and occurs_rec pl v1 rp =
  ( match !rp with
    | CP(_,cp) -> occurs_rcd pl v1 cp
    | P(_,_,p) -> occurs_rcd pl v1 p
    | _ -> err "occurs_rec:0" )
let rec unify ru t0 t1 =
  let h = ref [] in
  let se = (Types.print h t0)^" ~ "^(Types.print h t1) in
  Util.pnt true ("enter unify:"^se^"\n");
  if t0==t1 then ()
  else
    ( match t0,t1 with
      | Var v1,t2
      | t2,Var v1 ->
        ( match !v1 with
          | Ln t3 -> unify ru t2 t3
          | _ ->
            ( match t2 with
              | Rec rv ->
                let _ = occurs_rec [rv] v1 rv in
                v1 := Ln t2;
                ()
              | Var { contents=Ln t2 } -> unify ru (Var v1) t2
              | Var v2 ->
                if v1==v2 then ()
                else
                  let b = occurs [] v1 t2 in
                  if b then err ("unify:0:"^se)
                  else v1 := (Ln t2); ()
              | _ ->
                let b = occurs [] v1 t2 in
                if b then err ("unify:0:"^se)
                else v1 := (Ln t2); ()
            )
        )
      | App(t2,t3),App(t4,t5)
      | Imp(t2,t3),Imp(t4,t5) -> unify ru t2 t4; unify ru t3 t5
      | Prm p1,Prm p2 -> if p1=p2 then () else err ("unify:1:"^se)
      | Rec v1,Rec v2 ->
        if v1==v2 then ()
        else if List.exists (fun (x1,x2) -> (x1==v1&&x2==v2)||(x1==v2&&x2==v1)) ru then ()
        else unify_rec ((v1,v2)::ru) v1 v2
      | Rcd l1,Rcd l2 -> unify_rcd ru l1 l2
      | Rcd_Lb l1,Rcd_Lb l2 -> unify_rcd_lb ru l1 l2
      | _ -> err ("unify:2"^se)
    )
and unify_rcd ru l1 l2 =
  ( match l1,l2 with
    | U,U -> ()
    | Uo t1,l3
    | l3,Uo t1 ->
      ( match !t1 with
        | Ln t3 -> unify_rcd ru l3 t3
        | _ ->
          let b = rcd_occurs t1 l3 in
          if b then err "unify_rcd: 0"
          else t1 := (Ln l3); ()
      )
    | Cns(t1,t2),Cns(t3,t4) -> unify ru t1 t3; unify_rcd ru t2 t4
    | _ -> err "unify_rcd:1" )
and find_lb ru t0 (b:string) l1 =
  ( match l1 with
    | U_Lb -> err "find_lb 0"
    | Uo_Lb t1 ->
      ( match !t1 with
        | Ln t3 -> find_lb ru t0 b t3
        | V (nr,l) ->
          if StgSet.mem b nr then err "find_lb 1"
          else
            let nr = StgSet.add b nr in
            let v = ref (V(nr,l)) in
            let _ = occurs [] (newvar_l l) t0 in
            t1 := Ln (Cns_Lb(b,t0,Uo_Lb v))
        | _ -> err "find_lb 2" )
    | Cns_Lb(b1,t1,t2) ->
      if b = b1 then unify ru t0 t1 else find_lb ru t0 b t2 )

and unify_rcd_lb ru l1 l2 =
  let rec f_l l1 l2 =
    ( match l1 with
      | U_Lb -> ()
      | Uo_Lb t1 ->
        ( match !t1 with
          | Ln t2 -> f_l t2 l2
          | _ -> () )
      | Cns_Lb(b1,t1,t2) ->
        let _ = find_lb ru t1 b1 l2 in
        f_l t2 l2 ) in
  let _ = f_l l1 l2 in
  let _ = f_l l2 l1 in
  let rec f_tl l1 l2 =
    ( match l1,l2 with
      | Cns_Lb(_,_,t0) , l3 | l3 , Cns_Lb(_,_,t0) -> f_tl t0 l3
      | U_Lb,U_Lb -> ()
      | Uo_Lb { contents = Ln y }, l3
      | l3,Uo_Lb { contents = Ln y } -> f_tl y l3
      | Uo_Lb v0, l3
      | l3,Uo_Lb v0 ->
        if l3==(Uo_Lb v0) then ()
        else
          let b = rcd_lb_occurs v0 l3 in
          if b then err "unify_rcd_lb:0"
          else v0 := (Ln l3); ()) in
  let _ = f_tl l1 l2 in
  ()
and unify_rec ru v1 v2 =
  ( match !v1,!v2 with
    | CP(t1,t2),CP(t3,t4) -> unify ru t1 t3; unify_rcd ru t2 t4
    | P(t1,t2,t3),P(t4,t5,t6) -> unify ru t1 t4; unify ru t2 t5; unify_rcd ru t3 t6
    | _ -> err "unify_rec:0" )
let rec gen rl l y =
  ( match y with
    | Var v ->
      ( match !v with
        | WC _ -> ()
        | V (k,l0) -> if l<l0 then v := (Q (k,l))
        | Q _ -> ()
        | Ln y1 -> gen rl l y1 )
    | App(t2,t3)
    | Imp(t2,t3) -> gen rl l t2; gen rl l t3
    | Rec v1 ->
      if List.exists (fun v -> v==v1) !rl then ()
      else (rl := !rl@[v1]; gen_rec rl l v1)
    | Rcd l1 -> gen_rcd rl l l1
    | Rcd_Lb l1 -> gen_rcd_lb rl l l1
    | _ -> ()
  )
and gen_rec rl l v1 =
  ( match !v1 with
    | CP(t0,r0) -> gen rl l t0; gen_rcd rl l r0
    | P(t0,t1,r0) -> gen rl l t0; gen rl l t1; gen_rcd rl l r0
    | _ -> err "gen_rec:0" )
and gen_rcd rl l r =
  ( match r with
    | U -> ()
    | Uo v ->
      ( match !v with
        | WC _ -> ()
        | V (k,l0) -> if l<l0 then v := (Q (k,l))
        | Q _ -> ()
        | Ln y1 -> gen_rcd rl l y1 )
    | Cns(t0,t1) -> gen rl l t0; gen_rcd rl l t1 )
and gen_rcd_lb rl l r =
  ( match r with
    | U_Lb -> ()
    | Uo_Lb v ->
      ( match !v with
        | V (k,l0) -> if l<l0 then v := (Q (k,l))
        | WC _ -> ()
        | Q _ -> ()
        | Ln y1 -> gen_rcd_lb rl l y1 )
    | Cns_Lb(_,t0,t1) -> gen rl l t0; gen_rcd_lb rl l t1 )
let inst_ini () = { al = []; al_rcd = []; al_rcd_lb = []; rl = []; }
let rec inst l i y =
  ( match y with
    | App(Var {contents = Ln y0 },y1) -> inst l i (App(y0,y1))
    | App(Abs(v,y0),y1) ->
      let (y2,i) = inst l i y0 in
      let (y3,i) = inst l i y1 in
      let v0 = List.assq v i.al in
      v0 := Ln y3;
      (y2,i)
    | Var v ->
      ( match !v with
        | Q _ ->
          ( try (Var (List.assq v i.al),i)
            with Not_found ->
              let v0 = newvar_l l in
              let i = { i with al = (v,v0)::i.al } in
              (Var v0,i))
        | Ln y -> inst l i y
        | WC _ -> v := Types.V ((),l); (y,i)
        | _ -> (y,i))
    | App (y1,y2) ->
      let (y1,i) = inst l i y1 in
      let (y2,i) = inst l i y2 in
      (App(y1,y2),i)
    | Imp (y1,y2) ->
      let (y1,i) = inst l i y1 in
      let (y2,i) = inst l i y2 in
      (Imp(y1,y2),i)
    | Rcd r -> let (r,i) = (inst_rcd l i r) in (Rcd r,i)
    | Rcd_Lb r ->
      let (r,i) = (inst_rcd_lb l i r) in
      (Rcd_Lb r,i)
    | Rec r0 ->
      ( try (Rec (List.assq r0 i.rl),i)
        with Not_found ->
          let r1 = ref Rec_WC in
          let i0 = { i with rl = (r0,r1)::i.rl } in
          let (r2,i) = inst_rec l i0 r0 in
          r1 := r2;
          (Rec r1,i))
    | _ -> (y,i))
and inst_rcd l (i:inst) r =
  ( match r with
    | U -> (r,i)
    | Uo v ->
      ( match !v with
        | Q _ ->
          ( try (Uo (List.assq v i.al_rcd),i)
            with Not_found ->
              let v0 = ref (Types.V ((),l)) in
              let i = { i with al_rcd = (v,v0)::i.al_rcd } in
              (Uo v0,i))
        | Ln y -> inst_rcd l i y
        | WC _-> v := Types.V ((),l); (r,i)
        | _ -> (r,i))
    | Cns(t1,t2) ->
      let (t1i,i) = inst l i t1 in
      let (t2i,i) = inst_rcd l i t2 in
      (Cns(t1i,t2i),i))
and inst_rcd_lb l (i:inst) r =
  ( match r with
    | U_Lb -> (r,i)
    | Uo_Lb v ->
      ( match !v with
        | Q (k,l) ->
          ( try (Uo_Lb (List.assq v i.al_rcd_lb),i)
            with Not_found ->
              let v0 = ref (Types.V (k,l)) in
              let i = { i with al_rcd_lb = (v,v0)::i.al_rcd_lb } in
              (Uo_Lb v0,i))
        | Ln y -> inst_rcd_lb l i y
        | WC k -> v := Types.V (k,l); (r,i)
        | _ -> (r,i))
    | Cns_Lb(b,t1,t2) ->
      let (t1i,i) = inst l i t1 in
      let (t2i,i) = inst_rcd_lb l i t2 in
      (Cns_Lb(b,t1i,t2i),i) )
and inst_rec l i r =
  ( match !r with
    | CP(t0,t1) ->
      let (t0i,i) = inst l i t0 in
      let (t1i,i) = inst_rcd l i t1 in
      (CP(t0i,t1i),i)
    | P(t0,t1,t2) ->
      let (t0i,i) = inst l i t0 in
      let (t1i,i) = inst l i t1 in
      let (t2i,i) = inst_rcd l i t2 in
      (Types.P(t0i,t1i,t2i),i)
    | _ -> err "inst_rec:0" )
let inst l y = fst @@ inst l (inst_ini ()) y
let gen_rm (l:int) rm = SgnMap.map (fun y -> gen (ref []) l y) rm
let rec inst_ptn l (rp:ptn) : Types.t =
  let open Rcd_Ptn in
  ( match rp with
    | R rs -> Rcd(rcd_cl (Array.to_list (Array.map (fun r -> inst_ptn l r) rs)))
    | Ro(rs,rt) ->
      let yt = inst l (Var rt) in
      unify [] yt (Rcd(Uo(ref (WC()))));
      Rcd(rcd_cns (Array.to_list(Array.map (fun r -> inst_ptn l r) rs)) yt)
    | R_Lb rs ->
      Rcd_Lb(rcd_cl_lb (Array.fold_left (fun ys (lb,r) -> ys@[(lb,inst_ptn l r)]) [] rs))
    | Ro_Lb (rs,rt) ->
      let (ls,ys) =
        Array.fold_left
          (fun (ls,ys) (lb,r) ->
             (StgSet.add lb ls,ys@[(lb,inst_ptn l r)]))
          (StgSet.empty,[]) rs in
      let yt = inst l (Var rt) in
      unify [] yt (Rcd_Lb(Uo_Lb(ref (V(ls,l)))));
      let yr = rcd_cns_lb ys yt in
      Rcd_Lb yr
    | A r -> inst l (Var r) )
let rec slv_etr m l (r0,p0) =
  let y0 = inst_ptn (l+1) r0 in
  (y0,slv m (l+1) !p0)
and slv m l p0 =
  Util.pnt true ("enter slv:"^(print_line p0)^"\n");
  let open Rcd_Ptn in
  ( match p0 with
    | Ret r ->
      let y = inst_ptn (l+1) r in
      let _ = gen (ref []) l y in
      y
    | IL_Glb_Call(e,r) ->
      let ye = inst (l+1) (slv_exp_atm m (Atm (Fnc e))) in
      let yr = inst_ptn (l+1) r in
      let yy = Var(newvar_l (l+1)) in
      unify [] (Imp(yr,yy)) ye;
      gen (ref []) l ye;
      yy
    | IL_Call(f,x) ->
      let yf = inst_ptn (l+1) (Rcd_Ptn.A f) in
      let yr = inst_ptn (l+1) x in
      let yy = Var(newvar_l (l+1)) in
      unify [] (Imp(yr,yy)) yf;
      gen (ref []) l yf;
      yy
    | Agl(ra,ps) ->
      let ta = inst (l+1) (Var ra) in
      let ts = Array.init (Array.length ps) (fun _ -> Var (newvar_l (l+1))) in
      let _ = unify [] ta (Rec (ref (coprd_cl (Var (newvar_l (l+1))) (Array.to_list ts)))) in
      let (_,ys) =
        Array.fold_left
          ( fun (j,ys) (r,p) ->
              let ti = inst_ptn (l+1) r in
              let _ = unify [] ti ts.(j) in
              let _ = gen (ref []) l ti in
              let y1 = slv m l p in
              (j+1,ys |+| [|y1|]) )
          (0,[||]) ps in
      let tts = Array.map (fun y -> inst (l+1) y) ys in
      let rrt = Var (newvar_l (l+1)) in
      let _ = List.fold_left (fun y1 y2 -> unify [] y1 y2; y2) rrt (Array.to_list tts) in
      let _ = gen (ref []) l rrt in
      rrt
    | Seq(o,p1) ->
      let _ =
        ( match o with
          | IR_Clj (_,_,_) -> err "slv:0"
          | IR_Prd (_,_,_) -> err "slv:1"
          | IR_Id (r,rs) ->
            let ts = Array.map (fun r -> inst_ptn (l+1) r) rs in
            let t = inst_ptn (l+1) r in
            let _ = List.fold_left (fun y1 y2 -> unify [] y1 y2; y2) t (Array.to_list ts) in
            Util.pnt true "test 0";
            let _ = Array.map (fun t -> gen (ref []) l t) ts in
            ()
          | IR_Call((f,x),y) ->
            let tf = inst_ptn (l+1) (A f) in
            let tx = inst_ptn (l+1) x in
            let ty = inst_ptn (l+1) y in
            unify [] tf (Imp(tx,ty));
            gen (ref []) l ty
          | IR_Glb_Call(n,x,y) ->
            let tf = inst (l+1) (Var(List.assoc n m.ns)) in
            let tx = inst_ptn (l+1) x in
            let ty = inst_ptn (l+1) y in
            unify [] tf (Imp(tx,ty));
            gen (ref []) l ty
          | IR_Out (_,_) -> err "slv x1"
          | IR_Glb_Out (_,_) -> err "slv x2"
          | IR_Exp(a,_,r1) ->
            let tk = inst_ptn (l+1) r1 in
            let _ = unify [] tk (inst (l+1) (slv_exp_atm m a)) in
            gen (ref []) l tk
        ) in
      (*  Util.Timer.pnt "slv t2"; *)
      slv m l p1
  )
and slv_exp_atm m a =
  let open Types in
  ( match a with
    | Atm a ->
      ( match a with
        | Stg _ -> Prm Types.Stg
        | Z _ -> zn (Prm Z_u)
        | Zn(_,_) -> zn (Var (newvar()))
        | Fnc f ->
          ( match f with
            | Tkn.Pls -> let y = zn (Var (newvar())) in Imp(Rcd (rcd_cl [y;y]),y)
            | Tkn.Mlt -> let y = zn (Var (newvar())) in Imp(Rcd (rcd_cl [y;y]),y)
            | Tkn.Mns -> let y = zn (Var (newvar())) in Imp(y,y)
            | Tkn.Cmp -> let (y0,y1) = (zn (Prm Z_u),zn (Prm (Z_n 2))) in Imp(Rcd(rcd_cl [y0;y0]),y1)
            | Tkn.Eq -> let y = Var (newvar()) in Imp(Rcd(rcd_cl [y;y]),y)
            | Tkn.Frgn n -> Var(List.assoc n m.ns)
            | Tkn.Exn_Ini -> let y = Var (newvar()) in Imp(Prm Stg,y)
            | _ -> err "slv_exp_atm 0" )
        | Name n ->
          ( try Var(List.assoc n m.ns)
            with _ -> err ("slv_exp_atm 3:"^n) ))
    | _ -> err "slv_exp_atm 1" )

and slv_rule m (_,ps,_) = Rcd (slv_ps m ps)
and slv_ps m ps =
  ( match ps with
    | [] -> U
    | hd::tl -> Cns(slv_pattern m hd,slv_ps m tl))
and slv_pattern m p =
  let open Peg in
  ( match p with
    | List a -> lst (slv_pattern_atm m a)
    | Option a -> opn (slv_pattern_atm m a)
    | Atm a -> slv_pattern_atm m a )
and slv_pattern_atm m a =
  ( match a with
    | Peg.Text _ -> Rcd U
    | Peg.Name n ->
      let k = List.assoc n m.ns_e in
      ( match k with
        | Tkn.Tkn(Tkn.Etr(Tkn.Grm(_,_))) ->
          Types.Var(List.assoc n m.ns_t)
        | _ -> err "slv_pattern_atm 0" )
    | Peg.Var v ->
      let (n,_,_) = !v in
      let y  = List.assoc n !ns_grm in
      Rec y
    | Peg.Any -> Prm Stg )

let rec mk_ir_mdl el =
  let open Tkn in
  let m = { ns_v =[]; ns = []; ns_e = []; ns_t = [] } in
  m.ns_e <- ("‹›",Tkn(Etr(Inj 0)))::m.ns_e;
  m.ns <- ("‹›",ref (Ln(Imp(Rcd U,opn (Var(newvar_q (-1)))))))::m.ns;
  m.ns_e <- ("‹",Tkn(Etr(Tkn.Inj 1)))::m.ns_e;
  let v = Var (newvar()) in
  m.ns <- ("‹",ref(Ln(Imp(v,opn v))))::m.ns;
  m.ns_e <- ("⟦⟧",Tkn(Etr(Tkn.Inj 0)))::m.ns_e;
  m.ns <- ("⟦⟧",ref(Ln(Imp(Rcd U,lst (Var(newvar_q (-1)))))))::m.ns;
  m.ns_e <- ("⟦",Tkn(Etr(Tkn.Inj 1)))::m.ns_e;
  let v = Var (newvar_q (-1)) in
  let y = lst v in
  m.ns <- ("⟦",ref(Ln(Imp(Rcd (rcd_cl [v;y]),y))))::m.ns;
  m.ns_e <- ("&",Tkn(Etr(Tkn.Frgn "&")))::m.ns_e;
  m.ns <- ("&",ref(Ln(Imp(Rcd U,Prm Sgn))))::m.ns;
  m.ns_e <- ("⊵",Tkn(Etr(Tkn.Frgn "⊵")))::m.ns_e;
  let t_b = Var (newvar_q (-1)) in
  let t_k = Var (newvar_q (-1)) in
  let t_o = opn t_k in
  let t_v = App(App(Prm Vct,t_o),t_b) in
  let t_s = Types.Rcd(rcd_cl [Types.Rcd(rcd_cl [t_v;t_b]);t_o]) in
  m.ns <- ("⊵",ref(Ln(Imp(t_s,t_s))))::m.ns;
  m.ns_e <- ("#",Tkn(Etr(Tkn.Frgn "#")))::m.ns_e;
  let t_b = Var (newvar_q (-1)) in
  let t_k = Var (newvar_q (-1)) in
  let t_o = opn t_k in
  let t_v = App(App(Prm Vct,t_o),t_b) in
  m.ns <- ("#",ref(Ln(Imp(Rcd U,t_v))))::m.ns;
  m.ns_e <- ("read",Tkn(Etr(Tkn.Frgn "read")))::m.ns_e;
  m.ns <- ("read",ref(Ln(Imp(Prm Stg,Prm Stg))))::m.ns;
  m.ns_e <- ("pnt",Tkn(Etr(Tkn.Frgn "pnt")))::m.ns_e;
  m.ns <- ("pnt",ref(Ln(Imp(Var (newvar_q (-1)),Rcd U))))::m.ns;
  mk_ir_mdl_etr m el
and mk_ir_mdl_etr m el =
  ( match el with
    | [] -> m
    | e::tl ->
      let _ =
        ( match e with
          | Etr(n,_,_,p) ->
            let p = mk_ir_etr p in
            let (y0,y1) = slv_etr m (-1) p in
            let _ = gen (ref []) (-1) y0 in
            let y = Imp(y0,y1) in
            m.ns_v <- (n,p)::m.ns_v;
            m.ns <- (n,ref(Ln y))::m.ns
          | Etr_Clq q ->
            let _ =
              List.fold_left
                (fun _ (n,_,_,p) ->
                   m.ns_v <- (n,mk_ir_etr p)::m.ns_v;
                   m.ns <- (n,newvar_l (-1))::m.ns )
                () q in
            let _ =
              List.fold_left
                (fun _ (n,_,_,_) ->
                   let p = List.assoc n m.ns_v in
                   let (y0,y1) = slv_etr m (-1) p in
                   let y1 = Imp(y0,y1) in
                   let v0 = List.assoc n m.ns in
                   unify [] (Var v0) y1)
                () q in
            let _ =
              List.fold_left
                (fun _ (n,_,_,_) ->
                   let v0 = List.assoc n m.ns in
                   gen (ref []) (-1) (Var v0) )
                () q in
            ()
          | Flow f ->
            ( match f with
              | Ast.Def_CoPrd (n,a,ps) ->
                let v = newvar () in
                m.ns_t <- (n,v)::m.ns_t;
                let a = List.map (fun _ -> newvar_q (-1)) a in
                let (ys,_) = List.split ps in
                let ya = List.fold_left (fun ya v -> App(ya,Var v)) (Prm(Name n)) a in
                let y0 = (coprd_cl ya ys) in
                let y1 = Rec (ref y0) in
                let y2 = abs y1 a in
                v := Ln y2;
                let _ =
                  List.fold_left
                    (fun i (t,n) ->
                       let tc = Imp(t,y1) in
                       m.ns <- (n,ref (Ln tc))::m.ns;
                       m.ns_e <- (n,Tkn.Tkn(Tkn.Etr(Tkn.Inj i)))::m.ns_e;
                       (i+1))
                    0 ps in
                ()
              | Ast.Def_Abs _ -> ()
              | Ast.Def_EqT (_,_,_) -> ()
              | _ -> err "slv_flows 1" )
          | Flow_Clq q ->
            let _ =
              List.fold_left
                ( fun _ f ->
                    ( match f with
                      | Ast.Def_CoPrd (n,a,ps) ->
                        let v = newvar () in
                        m.ns_t <- (n,v)::m.ns_t;
                        let a = List.map (fun _ -> newvar_q (-1)) a in
                        let (ys,_) = List.split ps in
                        let ya = List.fold_left (fun ya v -> App(ya,Var v)) (Prm(Name n)) a in
                        let y0 = (coprd_cl ya ys) in
                        let y1 = Rec (ref y0) in
                        let y2 = abs y1 a in
                        v := Ln y2;
                        let _ =
                          List.fold_left
                            (fun i (t,n) ->
                               let tc = Imp(t,y1) in
                               m.ns <- (n,ref (Ln tc))::m.ns;
                               m.ns_e <- (n,Tkn.Tkn(Tkn.Etr(Tkn.Inj i)))::m.ns_e;
                               (i+1))
                            0 ps in
                        ()
                      | Ast.Def_Abs _ -> ()
                      | Ast.Def_EqT (_,_,_) -> ()
                      | _ -> err "slv_flows 1" )
                )
                () q in
            ()
          | Gram g ->
            let _  =
              List.fold_left
                (fun _ (n,_,_) ->
                   m.ns_t <- (n,newvar ())::m.ns_t;
                   m.ns_e <- (n,Tkn.Tkn(Tkn.Etr(Tkn.Grm(g,n))))::m.ns_e )
                () g in
            let _ =
              List.fold_left
                (fun _ (n,_,rs) ->
                   let y = coprd_cl (App(Prm Grm,Prm (Name n))) (List.map (fun (r,_) -> slv_rule m r) rs) in
                   let v = List.assoc n m.ns_t in
                   v := Ln (Rec (ref y));
                   m.ns <- (n,ref (Ln(Imp(Prm Stg,Rcd(rcd_cl [Var v;(Prm Stg)])))))::m.ns
                ) () g in
            ()
        ) in
      mk_ir_mdl_etr m tl
  )
and ir_of_exp r0 r1 e =
  let open Ast in
  let open Rcd_Ptn in
  let rec lp r0 e =
    ( match e with
      | Rot -> ([],r0)
      | Rcd [||] -> ([],R [||])
      | App(Atm(Name n),e2) ->
        let v = newvar () in
        let (l2,r2) = lp r0 e2 in
        let n1 = IR_Glb_Call(n,r2,A v) in
        (l2@[n1],A v)
      | App (e1,e2) ->
        let (v1,v2,v3) = (newvar (),newvar (),newvar ()) in
        let n0 = IR_Id(r0,[|A v1;A v2|]) in
        let (l1,r1) = lp (A v1) e1 in
        let (l2,r2) = lp (A v2) e2 in
        ( match r1 with
          | A r1 ->
            let n1 = IR_Call((r1,r2),A v3) in
            ([n0]@l1@l2@[n1],A v3)
          | _ -> err "ir_of_exp 5" )
      | Prj(e0,Idx i) ->
        let (l0,r1) = lp r0 e0 in
        let vs = Array.init (i+1) (fun _ -> newvar ()) in
        let vt = newvar () in
        vt := Ln(Rcd(Uo(ref (WC()))));
        let rs = Array.map (fun v -> A v) vs in
        let n0 = IR_Id(r1,[|Ro(rs,vt)|]) in
        (l0@[n0],A vs.(i))
      | Prj(e0,Lb lb) ->
        let (l0,r1) = lp r0 e0 in
        let vs = [|newvar ()|] in
        let vt = newvar () in
        let rs = Array.map (fun v -> (lb,A v)) vs in
        let n0 = IR_Id(r1,[|Ro_Lb(rs,vt)|]) in
        (l0@[n0],A vs.(0))
      | Agl_Op _ -> err "ir_of_exp 3"
      | Atm a ->
        let v = newvar () in
        let p1 = IR_Exp(Atm a,r0,A v) in
        ([p1],A v)
      | Rcd es ->
        let vs = Array.map (fun _ -> newvar ()) es in
        let rs0 = Array.map (fun v -> Rcd_Ptn.A v) vs in
        let n0 = IR_Id(r0,rs0) in
        let (ns,_,rs1) =
          Array.fold_left
            (fun (ns,i,rs1) e ->
               let (l,ri) = lp rs0.(i) e in
               (ns@l,i+1,rs1 |+| [|ri|]))
            ([],0,[||]) es in
        ((n0::ns),R rs1)
      | Rcd_Lb (None,es) ->
        let vs = Array.map (fun _ -> newvar ()) es in
        let rs0 = Array.map (fun v -> Rcd_Ptn.A v) vs in
        let n0 = IR_Id(r0,rs0) in
        let (ns,_,rs1) =
          Array.fold_left
            (fun (ns,i,rs1) (lb,e) ->
               ( match e with
                 | Some e ->
                   let (l,ri) = lp rs0.(i) e in
                   (ns@l,i+1,rs1 |+| [|(lb,ri)|])
                 | None -> err "ir_of_exp 9" ))
            ([],0,[||]) es in
        ((n0::ns),R_Lb rs1)
      | Rcd_Lb(_,_) -> err "ir_of_exp 8"
    ) in
  let (l,r2) = lp r0 e in
  l@[IR_Id(r2,[|r1|])]
and mk_ir rv p0 =
  ( match p0 with
    | Ret r ->
      let r = csm_ptn_rv r rv in
      Ret r
    | IL_Glb_Call(n,r) ->
      let r = csm_ptn_rv r rv in
      IL_Glb_Call(n,r)
    | IL_Call(f,x) ->
      let f = csm_rv f rv in
      let x  = csm_ptn_rv x rv in
      IL_Call(f,x)
    | Agl(ra,ps) ->
      let ra = csm_rv ra rv in
      let ps =
        Array.fold_left
          ( fun ps (r,p) ->
              let rv = Hashtbl.copy rv in
              let _ = crt_ptn_rv r rv in
              let pi = mk_ir rv p in
              ps |+| [|(r,pi)|] )
          [||] ps in
      Agl(ra,ps)
    | Seq(o,p1) ->
      ( match o with
        | IR_Clj (_,_,_) -> err "slv:0"
        | IR_Prd (_,_,_) -> err "slv:1"
        | IR_Id (r,rs) ->
          let r = csm_ptn_rv r rv in
          let _ = Array.map (fun r -> crt_ptn_rv r rv) rs in
          let p1 = mk_ir rv p1 in
          Seq(IR_Id(r,rs),p1)
        | IR_Call((f,x),y) ->
          let f = csm_rv f rv in
          let x = csm_ptn_rv x rv in
          let _ = crt_ptn_rv y rv in
          let p1 = mk_ir rv p1 in
          Seq(IR_Call((f,x),y),p1)
        | IR_Glb_Call(_,_,_) -> err "slv x0"
        | IR_Out (_,_) -> err "slv x1"
        | IR_Glb_Out (_,_) -> err "slv x2"
        | IR_Exp(a,r0,r1) ->
          let r0 = csm_ptn_rv r0 rv in
          let _ = crt_ptn_rv r1 rv in
          let l = ir_of_exp r0 r1 a in
          let p1 = mk_ir rv p1 in
          let p = List.fold_right (fun n p -> Seq(n,p)) l p1 in
          p
      )
  )
and csm_rv r rv =
  let (s,_) = List.find (fun (_,v) -> v==r) !Ast.rm in
  let v = Hashtbl.find rv s in
  Hashtbl.remove rv s;
  v
and csm_ptn_rv r rv = Rcd_Ptn.map (fun r0 -> csm_rv r0 rv) r
and crt_rv r rv =
  let (s,_) = List.find (fun (_,v) -> v==r) !Ast.rm in
  if Hashtbl.mem rv s then err "crt_rv 0"
  else Hashtbl.add rv s r
and crt_ptn_rv r rv = Rcd_Ptn.map (fun r0 -> crt_rv r0 rv) r
and mk_ir_etr (r0,p0) =
  let rv = Hashtbl.create 10 in
  let _ = crt_ptn_rv r0 rv in
  let p = mk_ir rv !p0 in
  (r0,ref p)
    (*
let rec mk_idx e =
  let s = VHash.create 10 in
  let i = VHash.create 10 in
  let (r0,p0) = e in
  let ri0 = idx_crt_ptn s i r0 in
  let rec lp s p0 =
    ( match p0 with
      | Ret r -> idx_csm_ptn s i r
      | IL_Glb_Call(n,r) -> idx_csm_ptn s i r
      | IL_Call(f,x) ->
        idx_csm s i f;
        idx_csm_ptn s i x
      | Agl(ra,ps) ->
        idx_csm s i ra;
        Array.fold_left
          ( fun _ (r,p) ->
              let s = VHash.copy s in
              idx_crt_ptn s i r;
              lp s p )
          () ps
      | Seq(o,p1) ->
        let _ =
          ( match o with
            | IR_Clj (_,_,_) -> err "slv:0"
            | IR_Prd (_,_,_) -> err "slv:1"
            | IR_Id (r,rs) ->
              idx_csm_ptn s i r;
              Array.fold_left (fun _ r -> idx_crt_ptn s i r) () rs
            | IR_Call((f,x),y) ->
              idx_csm s i f;
              idx_csm_ptn s i x;
              idx_crt_ptn s i y
            | IR_Glb_Call(_,_,_) -> err "slv x0"
            | IR_Out (_,_) -> err "slv x1"
            | IR_Glb_Out (_,_) -> err "slv x2"
            | IR_Exp(a,r0,r1) ->
              idx_csm_ptn s i r0;
              idx_crt_ptn s i r1
          ) in
        lp s p1
    ) in
  lp s !p0;
  i
and idx_crt_ptn s i r = let _ = Rcd_Ptn.map (fun v -> idx_crt s i v) r in ()
and idx_crt s i v =
  if VHash.mem s v then err "idx_crt 0"
  else
    let n = idx_min s 0 in
    (VHash.add s v n; VHash.add i v n)
and idx_csm_ptn s i r =
  let _ = Rcd_Ptn.map (fun v -> idx_csm s i v) r in ()
and idx_csm s i v =
  if VHash.mem s v
  then
    VHash.remove s v
  else err "idx_csm 0"
and idx_min s i =
  let b =
    VHash.fold
      (fun _ j b -> if j=i then true else b) s false in
  if b then idx_min s (i+1) else i
*)
open Rcd_Ptn
let emt_flg = true

let rec emt m =
  "//  src = r8 dst = r9 tmp = r10\n"^
  "// src = r8 i = r9 tmp = r10\n"^
  ".intel_syntax noprefix\n"^
  ".global main\n"^
  (emt_el m m.ns_v)^(rpc_r ())
and emt_pnt_ptn s r = Rcd_Ptn.print (fun v -> (string_of_int (idx s v))^"\'") r
and emt_el m el =
  ( match el with
    | [] -> ""
    | (n,e)::tl ->
      let s0 = emt_etr m e in
      let s1 = emt_el m tl in
      n^":\n"^s0^s1 )
and cmt s = if emt_flg then "# "^s^"\n" else ""
and emt_etr _ e =
  let s = Hashtbl.create 10 in
  let (r0,p0) = e in
  let _ = idx_crt_ptn s r0 in
  let c0 = cmt ("\t|» "^(emt_pnt_ptn s r0)) in
  c0^(emt_ir s !p0)
and pnt_idx s = Hashtbl.fold (fun n v q -> q^" "^(string_of_int n)^"~"^(Ast.print_v v)) s ""
and emt_ir s p =
  pnt true ("enter emt_ir:"^(pnt_idx s)^","^(print_line p)^"\n");
  ( match p with
    | Ret r -> emt_ret s r
    | Seq(n,p1) ->
      let s0 =
        ( match n with
          | IR_Id(r,rs) -> emt_id s r rs
          | IR_Call((f,x),y) -> emt_call s f x y
          | IR_Glb_Call(n,r0,r1) -> emt_gl_call s n r0 r1
          | IR_Exp(e,r0,r1) -> emt_exp s e r0 r1
          | _ -> err "emt_etr 0" ) in
      s0^(emt_ir s p1)
    | Agl(r,ps) -> emt_agl s r ps
    | IL_Call(f,r) -> emt_il_call s f r
    | IL_Glb_Call(n,r) -> emt_il_glb_call s n r )
and idx_crt_ptn s r = Rcd_Ptn.map (fun v -> idx_crt s v) r
and idx_crt s v =
  let n = idx_min 0 s in
  Hashtbl.add s n v;
  n
and idx_csm s v =
  let i = idx s v in
  Hashtbl.remove s i
and idx_csm_ptn s r = let _ = Rcd_Ptn.map (fun v -> idx_csm s v) r in ()
and idx_add s = let v = newvar () in idx_crt s v
and idx_min i s =
  if Hashtbl.mem s i then idx_min (i+1) s else i
and emt_id s r rs =
  let s0 =
    Array.fold_left
      (fun s0 ri -> let _ = idx_crt_ptn s ri in s0^(rpc_ptn s r ri)) "" rs in
  let c0 =
    cmt ("\t$ "^(emt_pnt_ptn s r)^" ⊢ "^(Array.fold_left (fun b r -> b^","^(emt_pnt_ptn s r)) "" rs)^
         rtl^(Arr.fld_l (fun s r -> s^","^(print_ty r)) "" rs)) in
  let s1 = rm_ptn s r in
  idx_csm_ptn s r;
  c0^s0^s1
and idx i v =
  let i = Hashtbl.fold (fun n v0 m -> if v0==v then n else m) i (-1) in
  if i=(-1) then err ("idx 0:"^(string_of_int i)) else i
and rm_ptn s r =
  ( match r with
    | A v ->
      let r0 = reg (idx s v) in
      "\tmov r8,"^r0^"\n"^
      "\tcall rmv_r\n"
    | R rs ->
      Array.fold_left
        (fun s0 r -> s0^(rm_ptn s r)) "" rs
    | Ro (rs,rt) ->
      let s0 =
        Array.fold_left
          (fun s0 r -> s0^(rm_ptn s r)) "" rs in
      let s1 =
        let r0 = reg (idx s rt) in
        "\tmov r8,"^r0^"\n"^
        "\tcall rmv_r\n" in
      s0^s1
    | _ -> "rm_ptn:0" )
and rpc_ptn s r0 r1 =
  ( match r0 with
    | A v0 ->
      ( match r1 with
        | A v1 ->
          let r0 = reg (idx s v0) in
          let r1 = reg (idx s v1) in
          "\tmov r8,"^r0^"\n"^
          "\tcall rpc_r\n"^
          "\tmov "^r1^",r9\n"
        | R r -> rpc_a_r s v0 r
        | Ro (r,rt) -> rpc_a_ro s v0 r rt
        | R_Lb _ -> ""
        | Ro_Lb(_,_) -> "" )
    | R r ->
      ( match r1 with
        | A v0 -> rpc_r_a s r v0
        | R r0 -> rpc_r_r s r r0
        | Ro(rs,rt) -> rpc_r_ro s r rs rt
        | _ -> err "rpc_ptn 0" )
    | Ro (_,_) ->
      ( match r1 with
        | A _ -> ""
        | R _ -> ""
        | Ro (_,_) -> ""
        | _ -> err "rpc_ptn 1" )
    | R_Lb _ ->
      ( match r1 with
        | A _ -> ""
        | R_Lb _ -> ""
        | Ro_Lb(_,_) -> ""
        | _ -> err "rpc_ptn 2" )
    | Ro_Lb(_,_) ->
      ( match r1 with
        | A _ -> ""
        | R_Lb _ -> ""
        | Ro_Lb(_,_) -> ""
        | _ -> err "rpc_ptn 3" ))
and rpc_a_r _ _ _ = "rpc_a_r\n"
and rpc_r_a _ _ _ = "rpc_r_a\n"
and rpc_a_ro _ _ _ _ = "rpc_a_ro\n"
and rpc_ro_a _ _ _ _ = "rpc_ro_a\n"
and rpc_r_r _ _ _ = "rpc_r_r\n"
and rpc_r_ro _ _ _ _ = "rpc_r_ro\n"
and idx_rm s i = Hashtbl.remove s i
and rpc_r () = load_file "rpc_r.s"

and reg i =
  if i=0 then "rax"
  else if i=1 then "rdi"
  else if i=2 then "rsi"
  else if i=3 then "rdx"
  else if i=4 then "rcx"
  else if i=5 then "r12"
  else if i=6 then "r13"
  else if i=7 then "r14"
  else if i=8 then "r15"
  else  "[r11+"^(string_of_int (9-i))^"]"
and call_fun f = "call "^f^"\n"
and emt_call s f x y =
  let _ = idx_crt_ptn s y in
  let c0 =
    cmt ("\t◂ "^(emt_pnt_ptn s (Rcd_Ptn.A f))^","^(emt_pnt_ptn s x)^" ⊢ "^(emt_pnt_ptn s y)
         ^rtl^(print_ty y)) in
  idx_csm s f; idx_csm_ptn s x;
  c0
and emt_gl_call s n x y =
  let _ = idx_crt_ptn s y in
  let c0 =
    cmt ("\t"^n^(emt_pnt_ptn s x)^" ⊢ "^(emt_pnt_ptn s y)^rtl^(print_ty y)) in
  idx_csm_ptn s x;
  c0
and emt_ret s r =
  let c0 = cmt ("\t∎ "^(emt_pnt_ptn s r)) in
  idx_csm_ptn s r;
  c0
and emt_exp s _ r0 r1 =
  let _ = idx_crt_ptn s r1 in
  let c0 = cmt ("\t» "^".. |~ "^(emt_pnt_ptn s r0)^" ⊢ "^(emt_pnt_ptn s r1)) in
  idx_csm_ptn s r0;
  c0
and emt_agl s ra ps =
  let c0 = cmt ("\t∠ "^(emt_pnt_ptn s (Rcd_Ptn.A ra))) in
  idx_csm s ra;
  let l0 = "agl_"^(Sgn.print (sgn ())) in
  let (_,a0) =
    Array.fold_left
      (fun (i,a) (r,p) ->
         let s = Hashtbl.copy s in
         let _ = idx_crt_ptn s r in
         let ci = cmt ("\t∐ "^(emt_pnt_ptn s r)) in
         let li = l0^"_"^(string_of_int i)^":\n" in
         let ai = emt_ir s p in
         (i+1,a^ci^li^ai) )
      (0,c0) ps in
  a0
and emt_il_call s f x =
  let c0 = cmt ("\t◂ "^(emt_pnt_ptn s (Rcd_Ptn.A f))^(emt_pnt_ptn s x)^" ⊢|") in
  idx_csm s f; idx_csm_ptn s x;
  c0
and emt_il_glb_call s n r =
  let c0 = cmt ("\t"^(Tkn.print_etr n)^" "^(emt_pnt_ptn s r)^" ⊢|") in
  let _ = idx_csm_ptn s r in
  c0
