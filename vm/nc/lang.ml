open Util
module Rcd_Ptn = struct
  open Util
  type 'a t =
    | R of ('a t) array
    | Ro of ('a t) array * 'a
    | A of 'a
    | Ro_Lb of ((string * 'a t) array) * 'a
    | R_Lb of (string * 'a t) array
  type idx =
    | End
    | Idx of int * idx
    | Lb of string * idx
    | Tl of int
    | Tl_Lb of StgSet.t
  let rec print_lb l =
    ( match l with
      | End -> ""
      | Lb (s,tl) -> "◃"^s^(print_lb tl)
      | Idx (i,tl) -> "◃"^(string_of_int i)^(print_lb tl)
      | Tl i -> "◃|"^(string_of_int i)
      | Tl_Lb s -> "◃|[ "^(StgSet.fold (fun l q -> l^" "^q) s "")^"]" )
  let rec print f p =
    ( match p with
      | A r -> f r
      | R r -> "{ "^(Util.string_of_list " " (print f) (Array.to_list r))^" }"
      | Ro(rs,rt) -> "{ "^(Util.string_of_list " " (print f) (Array.to_list rs))^" < "^(f rt)^" }"
      | R_Lb rs -> "{> "^(Util.string_of_list " " (fun (lb,ri) -> lb^"~"^(print f ri)) (Array.to_list rs))^" }"
      | Ro_Lb(rs,rt) -> "{> "^(Util.string_of_list " " (fun (lb,ri) -> lb^"~"^(print f ri)) (Array.to_list rs))^" < "^(f rt)^" }" )
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
      | Ro_Lb(rs,rt) -> Ro_Lb(Array.map (fun (lb,r) -> (lb,map f r)) rs,f rt) )
  let rec get_path i p =
    let s = print_lb i in
    ( match i,p with
      | End,_ -> p
      | Idx (hd,tl),R rs ->
        if hd<(Array.length rs) then get_path tl rs.(hd)
        else err ("get_path 0:"^s)
      | Idx (hd,tl),Ro (rs,_) ->
        if hd<(Array.length rs) then get_path tl rs.(hd)
        else err ("get_path 1:"^s)
      | _ -> err ("get_path 2:"^s) )
  let rec set_path i p0 p1 =
    ( match i,p0 with
      | End,_ -> p1
      | Idx (hd,tl),R rs ->
        if hd<(Array.length rs)
        then
          R (Array.mapi
               (fun i x -> if i=hd then set_path tl x p1 else x) rs)
        else err "get_path 0"
      | Idx (hd,tl),Ro (rs,rt) ->
        if hd<(Array.length rs)
        then
          let rs0 =
            (Array.mapi
               (fun i x -> if i=hd then set_path tl x p1 else x)
               rs) in
          Ro(rs0,rt)
        else err "get_path 1"
      | _ -> err "get_path 2" )
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
  type rm = (string * v ref) list ref
  let rm:rm = ref []
  let v_vct:((v ref) list ref) = ref []
  let v_rcd_lb_vct:((v_rcd_lb ref) list ref) = ref []
  let v_wc:v ref = ref (WC ())
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

  let rec to_rcd_ptn y =
    ( match y with
      | Rcd r ->
        let rec lp r =
          ( match r with
            | Cns(y0,y1) ->
              let (l,o) = lp y1 in
              ((to_rcd_ptn y0)::l,o)
            | U -> ([],None)
            | Uo { contents = Ln y } -> lp y
            | Uo v -> ([],Some (Rcd (Uo v))) ) in
        let (l,o) = lp r in
        ( match o with
          | None -> Rcd_Ptn.R (Array.of_list l)
          | Some v -> Rcd_Ptn.Ro (Array.of_list l,v) )
      | Rcd_Lb r ->
        let rec lp r =
          ( match r with
            | Cns_Lb(lb,y0,y1) ->
              let (l,o) = lp y1 in
              ((lb,to_rcd_ptn y0)::l,o)
            | U_Lb -> ([],None)
            | Uo_Lb { contents = Ln y } -> lp y
            | Uo_Lb v -> ([],Some (Rcd_Lb (Uo_Lb v))) ) in
        let (l,o) = lp r in
        ( match o with
          | None -> Rcd_Ptn.R_Lb (Array.of_list l)
          | Some v -> Rcd_Ptn.Ro_Lb (Array.of_list l,v) )
      | Var { contents = Ln y0 } -> to_rcd_ptn y0
      | _ -> Rcd_Ptn.A y )
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
      | Rcd_Ptn.End,y -> y
      | (Rcd_Ptn.Idx (hd,tl)),Rcd r -> path tl (path_rcd hd r)
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
      | Rcd_Ptn.End,_ -> a
      | Rcd_Ptn.Idx(i,tl),Rcd r -> Rcd (get_agl_rcd a i tl r)
      | _ -> err "get_agl:0" )
  and get_agl_rcd a hd tl r =
    ( match hd,r with
      | _,Uo { contents = Ln r0 } -> get_agl_rcd a hd tl r0
      | 0,Cns(t0,t1) -> Cns(get_agl a tl t0,t1)
      | i,Cns(t0,t1) -> Cns(t0,get_agl_rcd a (i-1) tl t1)
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
  let r2 () =
    let rec r = ref(CP(Prm(Name "r2"),Cns(Rec r,Cns(Rec r,U)))) in
    Rec r
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
    | R64 of int64 | R2 of bool
    | Tkn_N of string | Etr of ('p, 'r) etr | Stg of string | Z of int
    | Exn of string | P of ('p array) * (('p, 'r) t)
    | Zn of int * int | Sgn of Sgn.t | CoP of int * (('p, 'r) t)
    | Ast of Peg.ast | Vct of (('p, 'r) t , ('p, 'r) t) Hashtbl.t
  and ('p, 'r) etr =
    | Grm of Peg.grammar * string | Etr_N of string
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
          | R64 x -> "0xr"^(Int64.format "%x" x)
          | R2 false -> "0x2r0"
          | R2 true -> "0x2r1"
          | Tkn_N n -> n
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
      | Etr_N n -> n
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
      | Rcd_Ptn.End,_ -> agl k
      | Rcd_Ptn.Idx (hd,tl),Rcd rs ->
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
module Mtc = struct
  type v = Types.v ref
  type ptn = (v Rcd_Ptn.t) * (v * eq) list
  and ptn_eq = (v Rcd_Ptn.t)
  and eq =
    | Eq_Agl of int * ptn_eq
    | Eq_Agl_N of string * ptn_eq
    | P_Cst of cst
  and cst =
    | P_N of string
    | P_Z of int
    | P_R64 of int64
    | P_R2 of bool
    | P_Stg of string
  and p_sig = string
  (* let rec unify p0 p1 =
     let open Rcd_Ptn in
     ( match p0,p1 with
      | A a0,A a1 ->
      | R r0,R r1 -> R(Array.map_i (fun i ri -> unify ri r1.(i)) r0)
      |       ) *)
  let print_v v =
    ( try let (n,_) = List.find (fun (_,w) -> v==w) !Types.rm in n
      with _ -> "_r"^(string_of_int (Types.print_v Types.v_vct v)))
  let print_test e =
    ( match e with
      | Eq_Agl(i,r) -> "∠["^(string_of_int i)^"]◂"^(Rcd_Ptn.print print_v r)
      | Eq_Agl_N(n,r) -> n^"◂"^(Rcd_Ptn.print print_v r)
      | P_Cst c ->
        ( match c with
          | P_N n -> n
          | P_Stg s -> "\""^s^"\""
          | P_Z z -> (string_of_int z)
          | P_R64 x -> "0xr"^(Int64.format "%x" x)
          | P_R2 false -> "0x2r0"
          | P_R2 true -> "0x2r1" ))
  let print p =
    let (r,es) = p in
    let s0 = Rcd_Ptn.print print_v r in
    let s1 =
      List.fold_left
        (fun s1 (v,e) ->
           let sv = s1^","^(print_v v)^"=" in
           let st = print_test e in
           sv^st )
        "" es in
    s0^" ,"^s1
end
module Grm = struct
  type rle_flg = Synt | Lex
  type t = etr list
  and etr = name * ((name * rle_flg * rle) list)
  and rle = ptn list
  and ptn =
    | Lst of atm
    | Opn of atm
    | Atm of atm
  and atm =
    | Txt of string
    | Name of name
  and name = string
  (* { s8 r64 } ⊢ { s8 r64 ast } *)
  (* { rdi rsi } ⊢ { rdi rsi rax } *)
  (* { rdi rsi rdx } ⊢ *)
  let rec print g =
    List.fold_left (fun s e -> s^(print_etr e)) "" g
  and print_etr (n,rs) =
    "\t@."^n^"\n"^
    (List.fold_left
       (fun s (rn,f,r) ->
          s^"\t"^(print_rle_flg f)^rn^" : "^(print_rle r)^"\n" )
       "" rs )
  and print_rle_flg = ( function
      | Synt -> "\t∐ "
      | Lex -> "\t∐* " )
  and print_rle r =
    List.fold_left
      (fun s p ->
         let s0 =
           match p with
           | Atm Txt x -> "\""^(String.escaped x)^"\""
           | Atm Name n -> n
           | Lst Txt x -> "⟦\""^(String.escaped x)^"\"⟧"
           | Lst Name n -> "⟦"^n^"⟧"
           | Opn Txt x -> "‹\""^(String.escaped x)^"\"›"
           | Opn Name n -> "‹"^n^"›" in
         s^" "^s0      )
      "" r
  let rec emt g =
    let gv = Array.of_list g in
    let gn = Array.length gv in
    let e0 =
      "_grm_init_tbl:\n"^
      "\tmov rbx,rdi\n"^
      "\tmov r14,rsi\n"^
      "\tmov rdx,[rdi]\n"^
      "\tmov rcx,rdx\n"^
      "\tshl rcx,16\n"^
      "\tshr rcx,48\n"^
      "\tshl rcx,3\n"^
      "\tand rdx,0xf\n"^
      "\tsub rcx,rdx\n"^
      "\tshl rcx,1\n"^
      "\timul rcx,"^(string_of_int gn)^"\n"^
      "\tmov rdi,rcx\n"^
      "\tmov rax,0\n"^
      "\tcall malloc\n"^
      "\tmov rdi,rbx\n"^
      "\tmov rsi,r14\n"^
      "\tmov rdx,rax\n"^
      "\tmov rcx,rsi\n"^
      "\tret\n" in
    e0^(emt_etr gv 0)
  and emt_etr gv i =
    let gl = Array.length gv in
    if i<gl
    then
      let (n,l) = gv.(i) in
      let l0 = "_grm_lb_"^n^"_"^(Sgn.print (sgn ())) in
      let en =
        if n="dgt" then
          "_"^n^"_etr_tbl:\n"^
          "\tmov r11b,[rdi+rsi+8*1]\n"^
          "\tcmp r11,48\n"^
          "\tjb "^l0^"\n"^
          "\tcmp r11,57\n"^
          "\tja "^l0^"\n"^
          "\tadd rsi,1\n"^
          "\tmov rax,1\n"^
          "\tret\n"^
          l0^":\n"^
          "\tmov rax,0\n"^
          "\tret\n"
        else if n="u_al"
        then
          "_"^n^"_etr_tbl:\n"^
          "\tmov r11b,[rdi+rsi+8*1]\n"^
          "\tcmp r11,65\n"^
          "\tjb "^l0^"\n"^
          "\tcmp r11,90\n"^
          "\tja "^l0^"\n"^
          "\tadd rsi,1\n"^
          "\tmov rax,1\n"^
          "\tret\n"^
          l0^":\n"^
          "\tmov rax,0\n"^
          "\tret\n"
        else if n="l_al"
        then
          "_"^n^"_etr_tbl:\n"^
          "\tmov r11b,[rdi+rsi+8*1]\n"^
          "\tcmp r11,97\n"^
          "\tjb "^l0^"\n"^
          "\tcmp r11,122\n"^
          "\tja "^l0^"\n"^
          "\tadd rsi,1\n"^
          "\tmov rax,1\n"^
          "\tret\n"^
          l0^":\n"^
          "\tmov rax,0\n"^
          "\tret\n"
        else if n="chr"
        then
          "_"^n^"_etr_tbl:\n"^
          "\tmov r11b,[rdi+rsi+8*1]\n"^
          "\tadd rsi,1\n"^
          "\tbt r11,7\n"^
          "\tjnc "^l0^"\n"^
          "\tadd rsi,1\n"^
          "\tbt r11,6\n"^
          "\tjnc "^l0^"\n"^
          "\tadd rsi,1\n"^
          "\tbt r11,5\n"^
          "\tjnc "^l0^"\n"^
          "\tadd rsi,1\n"^
          "\tmov rax,1\n"^
          "\tret\n"^
          l0^":\n"^
          "\tmov rax,0\n"^
          "\tret\n"
        else
          "_"^n^"_etr_tbl:\n"^
          "\tpush QWORD 1\n"^
          "\tjmp _"^n^"_tbl\n"^
          n^":\n"^
          "_"^n^":\n"^
          "\tmov rdi,r8\n"^
          "\tmov rsi,r9\n"^
          "\tcall _grm_init_tbl\n"^
          "\tpush QWORD 0\n"^
          "_"^n^"_tbl:\n"^
          (emt_rle n l)^
          "_"^n^"_succeed:\n"^
          "\tpop rbx\n"^
          "\tcmp rbx,0\n"^
          "\tjnz _"^n^"_succeed_tbl\n"^
          "\tpush rsi\n"^
          "\tpush rdi\n"^
          "\tmov rdi,rdx\n"^
          "\tmov rax,0\n"^
          "\tcall free\n"^
          "\tmov rdi,3\n"^
          "\tcall mlc\n"^
          "\tmov rsi,[rax]\n"^
          "\tbtr rsi,0\n"^
          "\tmov [rax],rsi\n"^
          "\tmov QWORD [rax+8*3],1\n"^
          "\tpop rdi\n"^
          "\tpop rsi\n"^
          "\tmov QWORD [rax+8*1],rdi\n"^
          "\tmov QWORD [rax+8*2],rsi\n"^
          "\tclc\n"^
          "\tret\n"^
          "_"^n^"_succeed_tbl:\n"^
          "\tmov rax,1\n"^
          "\tret\n"^
          "_"^n^"_failed:\n"^
          "\tpop rbx\n"^
          "\tcmp rbx,0\n"^
          "\tjnz _"^n^"_failed_tbl\n"^
          "\tpush rsi\n"^
          "\tpush rdi\n"^
          "\tmov rdi,rdx\n"^
          "\tmov rax,0\n"^
          "\tcall free\n"^
          "\tmov rdi,3\n"^
          "\tcall mlc\n"^
          "\tmov rsi,[rax]\n"^
          "\tbtr rsi,0\n"^
          "\tmov [rax],rsi\n"^
          "\tmov QWORD [rax+8*3],0\n"^
          "\tpop rdi\n"^
          "\tpop rsi\n"^
          "\tmov QWORD [rax+8*1],rdi\n"^
          "\tmov QWORD [rax+8*2],rsi\n"^
          "\tclc\n"^
          "\tret\n"^
          "_"^n^"_failed_tbl:\n"^
          "\tmov rax,0\n"^
          "\tret\n"
      in
      en^(emt_etr gv (i+1))
    else ""
  and emt_rle en l =
    ( match l with
      | (n,Lex,r)::tl ->
        "_"^en^"_"^n^":\n"^
        "\tpush rsi\n"^
        (emt_ptn_lex en n r)^
        "_"^en^"_"^n^"_succeed:\n"^
        "\tpop r8\n"^
        "\tjmp "^"_"^en^"_succeed\n"^
        "_"^en^"_"^n^"_failed:\n"^
        "\tpop rsi\n"^
        (emt_rle en tl)
      | (n,Synt,_)::_ -> "; "^n^"\n"
      | [] ->
        "\tjmp "^"_"^en^"_failed\n" )
  and emt_ptn_lex en rn r =
    ( match r with
      | p::tl ->
        let ep =
          ( match p with
            | Atm a ->
              ( match a with
                | Txt s ->
                  let bs = Bytes.of_string s in
                  let lbs = Bytes.length bs in
                  let rec e_lp0 i =
                    if i<lbs
                    then
                      "\tmov r11b,[rdi+rsi+8*1+"^(string_of_int i)^"]\n"^
                      "\tcmp r11,"^(string_of_int (Char.code bs.[i]))^"\n"^
                      "\tjnz _"^en^"_"^rn^"_failed\n"^
                      (e_lp0 (i+1))
                    else "" in
                  (e_lp0 0)^
                  "\tadd rsi,"^(string_of_int lbs)^"\n"
                | Name n ->
                  "\tcall "^"_"^n^"_etr_tbl\n"^
                  "\tcmp rax,0\n"^
                  "\tjz _"^en^"_"^rn^"_failed\n"
              )
            | Lst a ->
              let l0 = "_grm_lst_"^(Sgn.print (sgn ())) in
              let l1 = "_grm_lst_"^(Sgn.print (sgn ())) in
              ( match a with
                | Txt s ->
                  let bs = Bytes.of_string s in
                  let lbs = Bytes.length bs in
                  let rec e_lp0 i =
                    if i<lbs
                    then
                      "\tmov r11b,[rdi+rsi+8*1+"^(string_of_int i)^"]\n"^
                      "\tcmp r11,"^(string_of_int (Char.code bs.[i]))^"\n"^
                      "\tjnz "^l1^"\n"^
                      (e_lp0 (i+1))
                    else "" in
                  l0^":\n"^
                  (e_lp0 0)^
                  "\tadd rsi,"^(string_of_int lbs)^"\n"^
                  "\tjmp "^l0^"\n"^
                  l1^":\n"
                | Name n ->
                  l0^":\n"^
                  "\tcall "^"_"^n^"_etr_tbl\n"^
                  "\tcmp rax,0\n"^
                  "\tjz "^l1^"\n"^
                  "\tjmp "^l0^"\n"^
                  l1^":\n"^
                  "\tmov rax,1\n" )
            | Opn a ->
              let l0 = "_grm_lst_"^(Sgn.print (sgn ())) in
              let l1 = "_grm_lst_"^(Sgn.print (sgn ())) in
              ( match a with
                | Txt s ->
                  let bs = Bytes.of_string s in
                  let lbs = Bytes.length bs in
                  let rec e_lp0 i =
                    if i<lbs
                    then
                      "\tmov r11b,[rdi+rsi+8*1+"^(string_of_int i)^"]\n"^
                      "\tcmp r11,"^(string_of_int (Char.code bs.[i]))^"\n"^
                      "\tjnz "^l1^"\n"^
                      (e_lp0 (i+1))
                    else "" in
                  l0^":\n"^
                  (e_lp0 0)^
                  "\tadd rsi,"^(string_of_int lbs)^"\n"^
                  l1^":\n"
                | Name n ->
                  l0^":\n"^
                  "\tcall "^"_"^n^"_etr_tbl\n"^
                  l1^":\n"^
                  "\tmov rax,1\n" ) ) in
        ep^(emt_ptn_lex en rn tl)
      | [] -> "" )
end
module Ast = struct
  open Types
  type name = string
  type mdl = name * (glb_etr list)
  and scm = Types.t
  and mdl_gma = scm StgMap.t
  and glb_etr =
    | Etr of string * Types.t * Types.t * etr
    | Etr_Out_Abs of string * Types.t
    | Etr_Abs of string * Types.t * Types.t
    | Flow of flow
    | Etr_Clq of (string * Types.t * Types.t * etr) list
    | Flow_Clq of flow list
    | Gram of Grm.t
  and flow =
    | Def_Abs of name * args
    | Def_Prd of name * args * ((Types.t * name) list)
    | Def_CoPrd of name * args * ((Types.t * name) list)
    | Def_Fnt of name * (name list)
    | Def_EqT of name * args * Types.t
  and args = (name * r) list
  and exp_rcd =
    | Agl_Op of exp_rcd
    | Rot | Rcd of exp_rcd array
    | Rcd_Lb of (exp_rcd option) * (string * (exp_rcd option)) array
    | App of exp_rcd * exp_rcd | Prj of exp_rcd * Rcd_Ptn.idx
    | Atm of exp_atm
  and exp_atm =
    | Z of int | Zn of (int * int) | R64 of int64
    | R2 of bool
    | Fnc of (etr, r) Tkn.etr
    | Name of string | Stg of string
  and r = Types.v ref
  and fnc = (etr, r) Tkn.etr
  and mtc = Mtc.ptn
  and ptn = r Rcd_Ptn.t
  and tkn = (etr, r) Tkn.t
  and pt = ir_code ref
  and etr = ptn * pt
  and ir_code =
    | Seq of nd * ir_code
    | Ret of ptn
    | Exn of r
    | Agl of r * ((ptn * ir_code) array)
    | Mtc of ptn * ((Mtc.ptn * ir_code) array)
    | IL_Call of r * ptn
    | IL_Glb_Call of fnc * ptn
  and nd =
    | IR_Id of ptn * (ptn array)
    | IR_Call of (r * ptn) * ptn
    | IR_Glb_Call of fnc * ptn * ptn
    | IR_Out of r * ptn
    | IR_Glb_Out of string * ptn
    | IR_Clj of r * ptn * pt
    | IR_Exp of exp_rcd * ptn * ptn
    | IR_Prd of r * (r Rcd_Ptn.t) * (pt array)
  type line =
    | End | Line of exp_rcd | Line_Agl of Rcd_Ptn.idx * exp_rcd
  module VHash = Hashtbl.Make (struct type t = v ref let equal = (==) let hash = Hashtbl.hash end)
  type st = tkn VHash.t
  type idx = int VHash.t
  type cs_f =
    | CS_f of ((r * tkn) list) * pt
    | CS_f_il of pt
  type cs = cs_f Stack.t
  type d =
    | D_CP of args * ((Types.t * name) list)
    | D_Prm
  type ns_d = (string * d) list
  type ns = (string * Types.v ref) list ref
  type ns_t = (string * Types.v ref) list ref
  type ns_e = (string * tkn) list ref
  type ns_grm = (string * Types.t_rec ref) list ref
  type rm = Types.rm
  type ns_v = (string * etr) list ref
  let rm:rm = Types.rm
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
    mutable ns_d : ns_d;
    mutable ns_g : Grm.etr list;
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
              | Etr_Abs(n,_,_) -> "§ "^n^" : .. ⊢ ..\n"
              | Etr_Out_Abs(n,_) -> "§ "^n^" : .. ⊢| \n"
              | Flow f -> "¶ "^(print_flow f)
              | Etr_Clq _ -> "§ @. .. "^"\n"
              | Flow_Clq _ -> "¶ @. .."^"\n"
              | Gram g -> "¶+ℙ "^"\n"^(Grm.print g) ) in
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
    let i = ref Rcd_Ptn.End in
    let b = ref false in
    let rec lp p a =
      ( match a with
        | Agl_Op r -> i := p; b := true; r
        | Rcd r -> Rcd (Array.mapi (fun i r -> lp (Rcd_Ptn.Idx (i,p)) r) r)
        | _ -> a ) in
    let a = lp Rcd_Ptn.End a in
    if !b then (!i,a) else err "tk_agl:0"
end
let rtl = " : "
let op0 = " \\ "
open Ast
let rec pnt_ptn r = Rcd_Ptn.print print_reg r
and print_etr ((r,p):etr) =
  " "^(pnt_ptn r)^"\n"^(print_ir !p)
and print_ir p0 =
  ( match p0 with
    | Seq (o,p1) -> "\t"^(print_nd o)^"\n"^(print_ir p1)
    | Ret r -> "\t∎ "^(Rcd_Ptn.print print_reg r)^"\n"
    | Exn r -> "\t∎| "^(print_reg r)^"\n"
    | Agl (r,ps) -> "\t∠ "^(pnt_ptn (Rcd_Ptn.A r))^"\n"^(print_ir_coprds ps)
    | Mtc(r,ps) -> "\t\\\\ "^(pnt_ptn r)^"\n"^(print_ir_mtc ps)
    | IL_Glb_Call(n,r) -> "\t"^(Tkn.print_etr n)^"\t"^(pnt_ptn r)^" ⊢|\n"
    | IL_Call(f,x) -> "\t"^(print_reg f)^","^(pnt_ptn x)^" ⊢|\n"
  )
and print_line p0 =
  ( match p0 with
    | Seq (o,_) -> (print_nd o)^"\n"
    | Ret r -> "∎ "^(pnt_ptn r)^"\n"
    | Exn r -> "∎| "^(print_reg r)^"\n"
    | Agl (r,_) -> "∠ "^(print_reg r)^"\n"
    | Mtc(r,_) -> "\t\\\\ "^(pnt_ptn r)^"\n"
    | IL_Call(f,x) -> "◂ "^(print_reg f)^","^(pnt_ptn x)^" ⊢|\n"
    | IL_Glb_Call(n,r) -> (Tkn.print_etr n)^"\t"^(pnt_ptn r)^" ⊢|\n" )
and print_ir_coprds ps =
  Array.fold_left
    (fun s (r,p) ->
       s^"\t∐ "^(pnt_ptn r)^"\n"^(print_ir p))
    "" ps
and print_ir_mtc ps =
  Array.fold_left
    (fun s (e,p) ->
       s^"\t∐\\ "^(pnt_mtc_ptn e)^"\n"^(print_ir p))
    "" ps
and pnt_mtc_ptn e = Mtc.print e
and print_nd o =
  ( match o with
    | IR_Clj (_,_,_) -> "||»"
    | IR_Prd (_,_,_) -> "∆ "
    | IR_Id(r,rs) -> "$ "^(pnt_ptn r)^" ⊢ "^(Arr.fld_l (fun s r -> s^","^(pnt_ptn r)) "" rs)^rtl^(Arr.fld_l (fun s r -> s^","^(print_ty r)) "" rs)
    | IR_Out(_,_) -> "|◂"
    | IR_Glb_Out(n,_) -> n^" |⊢"
    | IR_Glb_Call(n,x,y) -> (Tkn.print_etr n)^" "^(pnt_ptn x)^" ⊢ "^(pnt_ptn y)^rtl^(print_ty y)
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
        | R64 x -> "0xr"^(Int64.format "%x" x)
        | R2 false -> "0x2r0" | R2 true -> "0x2r1"
        | Z i -> string_of_int i
        | Zn(z0,z1) -> "ℤ["^(string_of_int z1)^"]."^(string_of_int z0)
        | Name s -> s
        | Stg s -> "\""^(String.escaped s)^"\""
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
      (fun s_ns (n,v) -> s_ns^"§ "^n^" : "^(Types.print (ref []) (Types.Var v))^"\n")
      "" m.ns in
  let s_ns_e =
    List.fold_left
      (fun s_ns_e (n,k) -> s_ns_e^"§ "^n^"="^(Tkn.print k)^"\n")
      "" m.ns_e in
  (* let s_ns_t =
     List.fold_left
      (fun s_ns_t (n,t) -> s_ns_t^"¶ "^n^"="^(Types.print (ref []) (Types.Var t))^"\n")
      "" m.ns_t in *)
  let s_ns_d =
    List.fold_left
      ( fun s_ns_t (n,t) ->
          match t with
          | D_CP(a,ps) ->
            let s0 = List.fold_left ( fun s0 (_,v) -> s0^(Types.print (ref []) (Types.Var v))^",") "" a in
            let s1= List.fold_left ( fun s1 (y,n) -> s1^"\t∐ "^n^" : "^(Types.print (ref []) y)^"\n") "" ps in
            s_ns_t^"¶ "^n^" ◂ "^s0^"\n"^s1
          | D_Prm ->
            s_ns_t^"¶ "^n^" :: _ \n" )
      "" m.ns_d in
  let s_ns_v =
    List.fold_left
      (fun s_ns_v (n,p) ->
         let v = ( try List.assoc n m.ns with _ -> err "print m0" ) in
         let p0 = Types.print (ref []) (Types.Var v) in
         let sf = "§ "^n^" : "^p0 in
         let sc = print_etr p in
         s_ns_v^sf^"\n"^sc)
      "" m.ns_v in
  s_ns^s_ns_e^s_ns_d^s_ns_v
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
        | Exn _ -> err "run exn 0"
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
        | Mtc (_,_) -> err "run mtc"
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
                      | R64 x -> Tkn.R64 x | R2 b -> Tkn.R2 b
                      | Name n -> Tkn.Tkn_N n
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
              let ky = app m (Tkn.Tkn (Tkn.Etr n)) kx in
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
        | (Etr_N f),_ ->
          frgn m f x
        | _ -> err "app 0"      )
    | Tkn.Tkn (Tkn.Tkn_N n),_ ->
      let e =
        ( try (Tkn.Tkn(Tkn.Etr(Tkn.Fnc(List.assoc n m.ns_v))))
          with Not_found ->
            ( try List.assoc n m.ns_e
              with _ -> err "app 7"            )) in
      app m e x
    | _ -> err "app:1"
  )
and frgn m f x =
  let open Tkn in
  ( match f with
    | "&" ->
      ( match x with
        | Tkn.Rcd [||] -> `Tkn(Tkn.Tkn(Tkn.Sgn (sgn ())))
        | _ -> err "app 3" )
    | "⊵" ->
      ( match x with
        | Tkn.Rcd [|Tkn.Rcd[|Tkn.Tkn Tkn.Vct v;k|];a0|] ->
          let a1 = Tkn.vct_op v k a0 in
          `Tkn(Tkn.Rcd [|Rcd[|(Tkn (Vct v));k|];a1|])
        | _ -> err "app 8" )
    | "#" ->
      ( match x with
        | Tkn.Rcd [||] -> `Tkn(Tkn.Tkn(Vct (Hashtbl.create 10)))
        | _ -> err "app 3" )
    | "pnt" ->
      let s = Tkn.print x in
      Util.pnt true ("pnt:"^s^"\n");
      `Tkn(Tkn.Rcd [||])
    | "read" ->
      ( match x with
        | Tkn.Tkn(Tkn.Stg s) ->
          let l = Util.load_file s in
          `Tkn(Tkn.Tkn (Tkn.Stg l))
        | _ -> err "read 0" )
    | n ->
      ( try `Fnc(List.assoc n m.ns_v)
        with Not_found -> app m (List.assoc n m.ns_e) x )
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
and lv_v v =
  ( match !v with
    | V (_,l) -> l
    | _ -> err "lv_v 0" )
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
and occurs_rec rl v1 rp =
  ( match !rp with
    | CP(y,cp) ->
      let _ = occurs rl v1 y in
      occurs_rcd rl v1 cp
    | P(y,_,p) ->
      let _ = occurs rl v1 y in
      occurs_rcd rl v1 p
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
  (* pnt true "enter inst\n"; *)
  ( match y with
    | App(Var ({contents = Ln(Abs(v,y0))} as v0),y1) ->
      pnt true ("inst "^(print_reg v0));
      ( try (Var (List.assq v0 i.al),i)
        with Not_found ->
          let v1 = newvar_l l in
          let i = { i with al = (v0,v1)::i.al } in
          let (y2,i) = inst l i y0 in
          let (y3,i) = inst l i y1 in
          let vt = List.assq v i.al in
          vt := Ln y3;
          v1 := Ln y2;
          (Var v1,i))
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
let rec inst_mtc_ptn m l (r,es) =
  let y0 = inst_ptn l r in
  let _ =
    List.fold_left
      (fun _ (v,e) ->
         let ye = inst_mtc_atm m l e in
         let _ = unify [] (Var v) ye in
         () )
      () es in
  y0
and inst_mtc_atm m l e =
  let open Types in
  let open Mtc in
  ( match e with
    | Eq_Agl(_,_) -> err "inst_mtc_atm 0"
    | Eq_Agl_N(n,r) ->
      let yn = inst l (Var (try List.assoc n m.ns with _ -> err "inst_mtc_atm 3")) in
      let yr = inst_ptn l r in
      let v0 = newvar_l l in
      let _ = unify [] (Imp(yr,Var v0)) yn in
      (Var v0)
    | P_Cst c ->
      ( match c with
        | P_Z _ -> zn (Prm Z_u)
        | P_R64 _ -> Prm(Name "r64")
        | P_N _ -> err "inst_mtc_atm 1"
        | P_R2 _ -> r2 ()
        | P_Stg _ -> Prm Types.Stg ))
and slv m l p0 =
  Util.pnt true ("enter slv:"^(print_line p0)^"\n");
  let open Rcd_Ptn in
  ( match p0 with
    | Ret r ->
      let y = inst_ptn (l+1) r in
      let _ = gen (ref []) l y in
      y
    | Exn r ->
      let y = inst (l+1) (Var r) in
      let _ = unify []  (Prm(Name "exn")) y in
      let _ = gen (ref []) l y in
      Var (newvar_q l)
    | IL_Glb_Call(e,r) ->
      let ye = inst (l+1) (slv_exp_atm m (Atm (Fnc e))) in
      let yr = inst_ptn (l+1) r in
      let yy = Var(newvar_l (l+1)) in
      unify [] (Imp(yr,yy)) ye;
      gen (ref []) l ye;
      Util.pnt true ("test 4:"^"\n");
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
    | Mtc(ra,ps) ->
      let ta = inst_ptn (l+1) ra in
      (* let ts = Array.init (Array.length ps) (fun _ -> Var (newvar_l (l+1))) in *)
      (* let _ = unify [] ta (Rec (ref (coprd_cl (Var (newvar_l (l+1))) (Array.to_list ts)))) in *)
      let _ =
        Array.fold_left
          (fun _ (e,_) ->
             let ti = inst_mtc_ptn m (l+1) e in
             let _ = unify [] ti ta in
             () )
          () ps in
      let _ = gen (ref []) l ta in
      let (_,ys) =
        Array.fold_left
          ( fun (j,ys) (_,p) ->
              (* let ti = inst_mtc_ptn (l+1) r in
                 let _ = unify [] ti ts.(j) in
                 let _ = gen (ref []) l ti in *)
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
            let tf = inst (l+1) (slv_exp_atm m (Atm (Fnc n))) in
            let tx = inst_ptn (l+1) x in
            let ty = inst_ptn (l+1) y in
            unify [] tf (Imp(tx,ty));
            gen (ref []) l ty
          | IR_Out (_,_) -> err "slv x1"
          | IR_Glb_Out (o,x) ->
            let tx = inst_ptn (l+1) x in
            let yo = List.assoc o m.ns in
            let _ = unify [] (inst (l+1) (Var yo)) (App(Prm(Name "-"),tx)) in
            gen (ref []) l tx
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
        | R64 _ -> Prm (Types.Name "r64")
        | Stg _ -> Prm Types.Stg
        | R2 _ -> r2 () (* Prm(Types.Name "r2") *)
        | Z _ -> zn (Prm Z_u)
        | Zn(_,_) -> zn (Var (newvar()))
        | Fnc f ->
          ( match f with
            | Tkn.Pls -> let y = zn (Var (newvar())) in Imp(Rcd (rcd_cl [y;y]),y)
            | Tkn.Mlt -> let y = zn (Var (newvar())) in Imp(Rcd (rcd_cl [y;y]),y)
            | Tkn.Mns -> let y = zn (Var (newvar())) in Imp(y,y)
            | Tkn.Cmp -> let (y0,y1) = (zn (Prm Z_u),zn (Prm (Z_n 2))) in Imp(Rcd(rcd_cl [y0;y0]),y1)
            | Tkn.Eq -> let y = Var (newvar()) in Imp(Rcd(rcd_cl [y;y]),y)
            | Tkn.Etr_N n -> Var(try List.assoc n m.ns with _ -> err "slv_exp_atm 6")
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
      let k = ( try List.assoc n m.ns_e with _ -> err "slv_pattern_atm 4") in
      ( match k with
        | Tkn.Tkn(Tkn.Etr(Tkn.Grm(_,_))) ->
          Types.Var(List.assoc n m.ns_t)
        | _ -> err "slv_pattern_atm 0" )
    | Peg.Var v ->
      let (n,_,_) = !v in
      let y  = (try List.assoc n !ns_grm with _ -> err "slv_pattern_atm 5") in
      Rec y
    | Peg.Any -> Prm Stg )
let rec mk_vars rl m f l y =
  let open Types in
  ( match y with
    | Prm (EqT n) ->
      ( try
          let v = List.assoc n !l in
          Var v
        with _ ->
          if f=`Abs then err "mk_vars 0"
          else
            let v = newvar_q (-1) in
            l := (n,v)::!l;
            Var v )
    | Prm(Name n) ->
      if List.exists (fun (m,_) -> n=m) m.ns_d then Prm(Name n)
      else err "mk_vars 3"
    (* ( try
        let v = List.assoc n m.ns_t in
        Var v
                        with _ -> err "mk_vars 2" ) *)
    | Abs(v,y0) -> Abs(v,mk_vars rl m f l y0)
    | Var v -> Var v
    | App(y0,y1) -> App(mk_vars rl m f l y0,mk_vars rl m f l y1)
    | Imp(y0,y1) -> Imp(mk_vars rl m f l y0,mk_vars rl m f l y1)
    | Prm p -> Prm p
    | Rcd r -> Rcd(mk_vars_rcd rl m f l r)
    | Rcd_Lb r -> Rcd_Lb(mk_vars_rcd_lb rl m f l r)
    | Rec r ->
      if List.exists (fun x -> x==r) !rl then (Rec r)
      else
        let _ = rl := r::!rl in
        Rec(mk_vars_rec rl m f l r))
and mk_vars_rcd rl m f l r =
  let open Types in
  ( match r with
    | Cns(y0,r0) -> Cns(mk_vars rl m f l y0,mk_vars_rcd rl m f l r0)
    | Uo { contents = Ln r0 } -> Uo { contents = Ln (mk_vars_rcd rl m f l r0) }
    | Uo v -> Uo v
    | U -> U )
and mk_vars_rcd_lb rl m f l r =
  let open Types in
  ( match r with
    | Cns_Lb(lb,y0,r0) -> Cns_Lb(lb,mk_vars rl m f l y0,mk_vars_rcd_lb rl m f l r0)
    | Uo_Lb { contents = Ln r0 } -> Uo_Lb { contents = Ln (mk_vars_rcd_lb rl m f l r0) }
    | Uo_Lb v -> Uo_Lb v
    | U_Lb -> U_Lb )
and mk_vars_rec rl m f l r =
  let open Types in
  ( match !r with
    | CP(y0,r0) -> r := CP(mk_vars rl m f l y0,mk_vars_rcd rl m f l r0); r
    | P(y0,y1,r0) -> r := P(mk_vars rl m f l y0,mk_vars rl m f l y1,mk_vars_rcd rl m f l r0); r
    | Rec_WC -> r )
let rec mk_ir_mdl el =
  let open Tkn in
  let m = { ns_v =[]; ns = []; ns_e = []; ns_t = []; ns_d = []; ns_g=[] } in
  m.ns_t <- ("r64",ref(Ln(Prm(Name "r64"))))::m.ns_t;
  m.ns_t <- ("ℤ",ref(Ln(Prm(Name "ℤ"))))::m.ns_t;
  m.ns_t <- ("ℙ",ref(Ln(Prm(Name "ℙ"))))::m.ns_t;
  m.ns_d <- ("r64",D_Prm)::m.ns_d;
  m.ns_d <- ("ℤ",D_Prm)::m.ns_d;
  m.ns_d <- ("ℙ",D_Prm)::m.ns_d;
  (* m.ns_e <- ("‹›",Tkn(Etr(Inj 0)))::m.ns_e;
     m.ns <- ("‹›",ref (Ln(Imp(Rcd U,opn (Var(newvar_q (-1)))))))::m.ns;
     m.ns_e <- ("‹",Tkn(Etr(Tkn.Inj 1)))::m.ns_e;
     let v = Var (newvar()) in
     m.ns <- ("‹",ref(Ln(Imp(v,opn v))))::m.ns; *)
  m.ns_e <- ("nil",Tkn(Etr(Tkn.Inj 0)))::m.ns_e;
  m.ns <- ("nil",ref(Ln(Imp(Rcd U,lst (Var(newvar_q (-1)))))))::m.ns;
  m.ns_e <- ("cns",Tkn(Etr(Tkn.Inj 1)))::m.ns_e;
  let v = Var (newvar_q (-1)) in
  let y = lst v in
  m.ns <- ("cns",ref(Ln(Imp(Rcd (rcd_cl [v;y]),y))))::m.ns;
  m.ns_e <- ("scc",Tkn(Etr(Tkn.Etr_N "scc")))::m.ns_e;
  m.ns <- ("scc",ref(Ln(Imp(Rcd(rcd_cl[Prm Stg;Prm Stg]),Prm Stg))))::m.ns;
  (* m.ns_e <- ("s",Tkn(Etr(Tkn.Etr_N "&")))::m.ns_e;
     m.ns <- ("&",ref(Ln(Imp(Rcd U,Prm Sgn))))::m.ns;
     m.ns_e <- ("⊵",Tkn(Etr(Tkn.Etr_N "⊵")))::m.ns_e;
     let t_b = Var (newvar_q (-1)) in
     let t_k = Var (newvar_q (-1)) in
     let t_o = opn t_k in
     let t_v = App(App(Prm Vct,t_o),t_b) in
     let t_s = Types.Rcd(rcd_cl [Types.Rcd(rcd_cl [t_v;t_b]);t_o]) in
     m.ns <- ("⊵",ref(Ln(Imp(t_s,t_s))))::m.ns;
     m.ns_e <- ("#",Tkn(Etr(Tkn.Etr_N "#")))::m.ns_e;
     let t_b = Var (newvar_q (-1)) in
     let t_k = Var (newvar_q (-1)) in
     let t_o = opn t_k in
     let t_v = App(App(Prm Vct,t_o),t_b) in
     m.ns <- ("#",ref(Ln(Imp(Rcd U,t_v))))::m.ns; *)
  m.ns_e <- ("read",Tkn(Etr(Tkn.Etr_N "read")))::m.ns_e;
  m.ns <- ("read",ref(Ln(Imp(Prm Stg,Prm Stg))))::m.ns;
  m.ns_e <- ("pnt",Tkn(Etr(Tkn.Etr_N "pnt")))::m.ns_e;
  m.ns <- ("pnt",ref(Ln(Imp(Var (newvar_q (-1)),Rcd U))))::m.ns;
  m.ns_e<-("add",Tkn(Etr(Tkn.Etr_N "add")))::m.ns_e;
  m.ns <- ("add",ref(Ln(Imp(Rcd(rcd_cl [Types.Prm(Types.Name "r64");Types.Prm(Types.Name "r64")]),Types.Prm(Types.Name "r64")))))::m.ns;
  m.ns_e<-("sub",Tkn(Etr(Tkn.Etr_N "sub")))::m.ns_e;
  m.ns <- ("sub",ref(Ln(Imp(Rcd(rcd_cl [Types.Prm(Types.Name "r64");Types.Prm(Types.Name "r64")]),Types.Prm(Types.Name "r64")))))::m.ns;
  m.ns_e<-("mul",Tkn(Etr(Tkn.Etr_N "mul")))::m.ns_e;
  m.ns <- ("mul",ref(Ln(Imp(Rcd(rcd_cl [Types.Prm(Types.Name "r64");Types.Prm(Types.Name "r64")]),Types.Prm(Types.Name "r64")))))::m.ns;
  m.ns_e<-("cmp",Tkn(Etr(Tkn.Etr_N "cmp")))::m.ns_e;
  m.ns <- ("cmp",ref(Ln(Imp(Rcd(rcd_cl [Types.Prm(Types.Name "r64");Types.Prm(Types.Name "r64")]),Rcd(rcd_cl [r2 ();r2 ()])))))::m.ns;
  m.ns_g <- ("chr",[])::m.ns_g;
  m.ns_g <- ("dgt",[])::m.ns_g;
  m.ns_g <- ("u_al",[])::m.ns_g;
  m.ns_g <- ("l_al",[])::m.ns_g;
  mk_ir_mdl_etr m el
and mk_ir_mdl_etr m el =
  ( match el with
    | [] -> m
    | e::tl ->
      let _ =
        ( match e with
          | Etr(n,_,_,(r0,p0)) ->
            pnt true "test x1";
            let (r0,p0) = mk_ir_etr (r0,p0) in
            let y0 = inst_ptn 0 r0 in
            let y1 = slv m 0 !p0 in
            let y = Imp(y0,y1) in
            let _ = gen (ref []) (-1) y in
            m.ns_v <- (n,(r0,p0))::m.ns_v;
            m.ns_e<-(n,Tkn.Tkn(Tkn.Etr(Tkn.Etr_N n)))::m.ns_e;
            m.ns <- (n,ref(Ln y))::m.ns
          | Etr_Abs(n,y0,y1) ->
            let l = ref [] in
            let ys = mk_vars (ref []) m `Etr l y0 in
            let yd = mk_vars (ref []) m `Etr l y1 in
            m.ns <- (n,ref(Ln(Imp(ys,yd))))::m.ns;
            m.ns_e<-(n,Tkn.Tkn(Tkn.Etr(Tkn.Etr_N n)))::m.ns_e
          | Etr_Out_Abs(n,y0) ->
            let l = ref [] in
            let ys = mk_vars (ref []) m `Etr l y0 in
            m.ns <- (n,ref(Ln(App(Prm(Name "-"),ys))))::m.ns;
            m.ns_e<-(n,Tkn.Tkn(Tkn.Etr(Tkn.Etr_N n)))::m.ns_e
          | Etr_Clq q ->
            pnt true "test x0\n";
            let l0 =
              List.fold_left
                (fun l0 (n,_,_,(r0,p0)) ->
                   let (r0,p0) = mk_ir_etr (r0,p0) in
                   m.ns_v <- (n,(r0,p0))::m.ns_v;
                   m.ns_e<-(n,Tkn.Tkn(Tkn.Etr(Tkn.Etr_N n)))::m.ns_e;
                   let y0 = inst_ptn 0 r0 in
                   let y1 = newvar_l 0 in
                   let y2 = newvar () in
                   y2 := Ln(Imp(y0,Var y1));
                   m.ns <- (n,y2)::m.ns;
                   (n,y1)::l0 )
                [] q in
            let l1 =
              List.fold_left
                (fun l (n,_,_,_) ->
                   let (_,p0) = (try List.assoc n m.ns_v with _ -> err "mk_ir_mdl_etr 4") in
                   let y1 = slv m 0 !p0 in
                   (n,y1)::l )
                [] q in
            let _ =
              List.fold_left
                (fun _ (n,_,_,_) ->
                   ( try
                       let (y1_0,y1_1) =
                         (List.assoc n l0,List.assoc n l1) in
                       let _ = unify [] (Var y1_0) (inst 0 y1_1) in
                       let v0 = List.assoc n m.ns in
                       gen (ref []) (-1) (Var v0)
                     with _ -> err "y1:" ))
                () q in
            ()
          | Flow f ->
            ( match f with
              | Ast.Def_CoPrd (n,a,ps) ->
                let ps = List.map (fun (y,c) -> (mk_vars (ref []) m `Abs (ref a) y,c)) ps in
                m.ns_d <- (n,D_CP (a,ps))::m.ns_d;
                (*let (ys,_) = List.split ps in
                  let v = newvar () in
                   m.ns_t <- (n,v)::m.ns_t; *)
                let ya = List.fold_left (fun ya (_,v) -> App(ya,Var v)) (Prm(Name n)) a in
                (*let y0 = (coprd_cl ya ys) in
                  let y1 = Rec (ref y0) in
                  let (_,vs) = List.split a in
                  let y2 = abs y1 vs in
                  v := Ln y2; *)
                let _ =
                  List.fold_left
                    ( fun i (t,n) ->
                        let tc = Imp(t,ya) in
                        m.ns <- (n,ref (Ln tc))::m.ns;
                        m.ns_e <- (n,Tkn.Tkn(Tkn.Etr(Tkn.Inj i)))::m.ns_e;
                        (i+1) )
                    0 ps in
                ()
              | Ast.Def_Abs (n,_) ->
                m.ns_d <- (n,D_Prm)::m.ns_d;
                ()
              | Ast.Def_EqT (_,_,_) -> ()
              | _ -> err "slv_flows 1" )
          | Flow_Clq q ->
            let dl =
              List.fold_left
                ( fun dl f ->
                    ( match f with
                      | Ast.Def_CoPrd (n,_,_) ->
                        let v = newvar () in
                        m.ns_t <- (n,v)::m.ns_t;
                        (n,D_Prm)::dl
                      | Ast.Def_Abs _ -> dl
                      | Ast.Def_EqT (_,_,_) -> dl
                      | _ -> err "slv_flows 1" )
                )
                [] q in
            let _ =
              List.fold_left
                ( fun _ f ->
                    ( match f with
                      | Ast.Def_CoPrd (n,a,ps) ->
                        let ns_d0 = m.ns_d in
                        m.ns_d <- dl@m.ns_d;
                        let ps = List.map (fun (y,c) -> (mk_vars (ref []) m `Abs (ref a) y,c)) ps in
                        (* let v = List.assoc n m.ns_t in
                           let (ys,_) = List.split ps in *)
                        let ya = List.fold_left (fun ya (_,v) -> App(ya,Var v)) (Prm(Name n)) a in
                        (* let y0 = (coprd_cl ya ys) in
                           let y1 = Rec (ref y0) in
                           let (_,vs) = List.split a in
                           let y2 = abs y1 vs in
                           v := Ln y2; *)
                        m.ns_d <- (n,D_CP(a,ps))::ns_d0;
                        let _ =
                          List.fold_left
                            (fun i (t,n) ->
                               let tc = Imp(t,ya) in
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
                (fun _ (n,_) ->
                   m.ns_t <- (n,newvar ())::m.ns_t;
                   m.ns_e <- (n,Tkn.Tkn(Tkn.Etr(Tkn.Etr_N n)))::m.ns_e )
                () g in
            let _ =
              List.fold_left
                (fun _ (n,rs) ->
                   (* let y = coprd_cl (App(Prm Grm,Prm (Name n))) (List.map (fun (r,_) -> slv_rule m r) rs) in *)
                   m.ns_g <- (n,rs)::m.ns_g;
                   let y = Prm(Name n) in
                   let v = List.assoc n m.ns_t in
                   v := Ln y;
                   (* m.ns <- (n,ref (Ln(Imp(Prm Stg,Rcd(rcd_cl [Var v;(Prm Stg)])))))::m.ns *)
                   let yp = Imp(Rcd(rcd_cl [Prm Stg;Prm(Name "r64")]),Rcd(rcd_cl [Prm Stg;Prm(Name "r64");Prm(Name n)])) in
                   m.ns <- (n,ref(Ln yp))::m.ns
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
        let n1 = IR_Glb_Call(Tkn.Etr_N n,r2,A v) in
        (l2@[n1],A v)
      | App(Atm(Fnc e),e2) ->
        let v = newvar () in
        let (l2,r2) = lp r0 e2 in
        let n1 = IR_Glb_Call(e,r2,A v) in
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
      | Prj(e0,Idx (i,End)) ->
        let (l0,r1) = lp r0 e0 in
        let vs = Array.init (i+1) (fun _ -> newvar ()) in
        let vt = newvar () in
        vt := Ln(Rcd(Uo(ref (WC()))));
        let rs = Array.map (fun v -> A v) vs in
        let n0 = IR_Id(r1,[|Ro(rs,vt)|]) in
        (l0@[n0],A vs.(i))
      | Prj(e0,Lb (lb,End)) ->
        let (l0,r1) = lp r0 e0 in
        let vs = [|newvar ()|] in
        let vt = newvar () in
        let rs = Array.map (fun v -> (lb,A v)) vs in
        let n0 = IR_Id(r1,[|Ro_Lb(rs,vt)|]) in
        (l0@[n0],A vs.(0))
      | Prj(_,_) -> err "ir_of_exp 8"
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
  pnt true ("enter mk_ir :"^(pnt_rv rv)^(print_line p0)^"\n");
  ( match p0 with
    | Ret r ->
      let r = csm_ptn_rv r rv in
      Ret r
    | Exn r ->
      let r = csm_rv r rv in
      Exn r
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
    | Mtc(ra,ps) ->
      let ra = csm_ptn_rv ra rv in
      let ps =
        Array.fold_left
          ( fun ps (e,p) ->
              let rv = Hashtbl.copy rv in
              let e = crt_mtc_ptn_rv e rv in
              let pi = mk_ir rv p in
              ps |+| [|(e,pi)|] )
          [||] ps in
      Mtc(ra,ps)
    | Seq(o,p1) ->
      ( match o with
        | IR_Clj (_,_,_) -> err "mk_ir:0"
        | IR_Prd (_,_,_) -> err "mk_ir:1"
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
        | IR_Glb_Call(e,x,y) ->
          let x = csm_ptn_rv x rv in
          let _ = crt_ptn_rv y rv in
          let p1 = mk_ir rv p1 in
          Seq(IR_Glb_Call(e,x,y),p1)
        | IR_Out (_,_) -> err "mk_ir x3"
        | IR_Glb_Out (o,x) ->
          let x = csm_ptn_rv x rv in
          let p1 = mk_ir rv p1 in
          Seq(IR_Glb_Out(o,x),p1)
        | IR_Exp(a,r0,r1) ->
          let r0 = csm_ptn_rv r0 rv in
          let _ = crt_ptn_rv r1 rv in
          let l = ir_of_exp r0 r1 a in
          let p1 = mk_ir rv p1 in
          let p = List.fold_right (fun n p -> Seq(n,p)) l p1 in
          p
      )
  )
and pnt_rv rv =
  (Hashtbl.fold
     (fun n v e -> e^" "^n^"\'~"^(Ast.print_v v))
     rv "{> ")^" }"
and csm_rv r rv =
  let (s,_) =
    ( try List.find (fun (_,v) -> v==r) !Ast.rm
      with _ -> err "csm_rv:0" )  in
  if s="_" then newvar ()
  else
    let v =
      ( try Hashtbl.find rv s
        with _ -> err ("csm_rv:1:"^s^(print_reg r)^","^(pnt_rv rv)) ) in
    Hashtbl.remove rv s;
    v
and csm_ptn_rv r rv = Rcd_Ptn.map (fun r0 -> csm_rv r0 rv) r
and crt_rv r rv =
  let (s,_) = ( try List.find (fun (_,v) -> v==r) !Ast.rm with _ -> err "crt_rv 4" ) in
  if s="_" then ()
  else if Hashtbl.mem rv s then err "crt_rv 0"
  else Hashtbl.add rv s r
and crt_ptn_rv r rv = Rcd_Ptn.map (fun r0 -> crt_rv r0 rv) r
and crt_mtc_ptn_rv (r,es) rv  =
  let open Mtc in
  let _ = Rcd_Ptn.map (fun v -> crt_rv v rv) r in
  let es =
    List.fold_left
      (fun es (v0,e) ->
         let v1 = csm_rv v0 rv in
         ( match e with
           | Eq_Agl(_,_) -> err "crt_mtc_ptn_rv 0"
           | Eq_Agl_N(_,r) ->
             let _ = Rcd_Ptn.map (fun v -> crt_rv v rv) r in
             es@[(v1,e)]
           | P_Cst _ -> es@[(v1,e)] ))
      [] es in
  (r,es)
and mk_ir_etr (r0,p0) =
  let rv = Hashtbl.create 10 in
  let _ = crt_ptn_rv r0 rv in
  let p = mk_ir rv !p0 in
  (r0,ref p)
let x86_reg_lst = [
  "r8"; "r9"; "r10"; "r11"; "rcx"; "rdx"; "rsi"; "rdi"; "rax";  ]
let emt_reg_x86 n =
  if n<9 then List.nth x86_reg_lst n
  else "[st_vct+8*"^(string_of_int (n-9))^"]"
(* let mk_reg_lst s =
   Hashtbl.fold
    (fun n _ l ->
    let emt_reg_) *)
let idx_x86 s =
  let (i,_) = BatList.findi (fun _ t -> s=t) x86_reg_lst in
  i
let push_reg s l =
  List.fold_left
    (fun (e,q) r ->
       let i = idx_x86 r in
       if Hashtbl.mem s i
       then
         let e0 =
           "\tpush QWORD "^r^"\n" in
         (e^e0,r::q)
       else (e,q))
    (";push_reg\n",[]) l
let pop_reg q =
  List.fold_left
    (fun e r -> e^"\tpop QWORD "^r^"\n" )
    ";pop_reg\n" q
let emt_flg = true
let cst_stg = ref []
let rec emt m f =
  let (se,em) = (emt_mdl m m.ns_v) in
  let eg = Grm.emt m.ns_g in
  let ef = emt_d m in
  "%include \"cmu.s\"\n"^
  "main:\n"^
  "\tmov r15,0\n"^
  "\tmov r14,0\n"^
  "\tmov r13,0\n"^
  "\tmov r12,0\n"^
  "\tnot r12\n"^
  "\txor rax,rax\n"^
  "\tmov rdi,0\n"^
  "\tcall mlc\n"^
  "\tmov rdi,rax\n"^
  "\tclc\n"^
  "\tcmp rdi,0\n"^
  "\tcall "^f^"\n"^
  "\tmov rdi,rax\n"^
  "\tmov rsi,str_ret\n"^
  "\tcall pnt\n"^
  "\tcall pnt_str_ret\n"^
  "\tjmp _end\n"^
  em^
  eg^
  "section .data\n"^
  se^
  ef^
  (emt_cst_stg !cst_stg)
and emt_d m =
  List.fold_left
    ( fun s0 (n,e) ->
        let open Tkn in
        match e with
        | Tkn(Etr(Tkn.Inj i)) ->
          if List.exists (fun (n0,_) -> n=n0) m.ns_v then s0
          else
            let sn =
              "\t_dyn_"^n^":\n"^
              (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
              "\t\tdq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001\n"^
              "\t\tdq "^(string_of_int i)^"\n" in
            s0^sn
        | _ ->
          if List.exists (fun (n0,_) -> n=n0) m.ns_v then s0
          else
            let sn =
              "\t_dyn_"^n^":\n"^
              (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
              "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
              "\t\tdq 0\n" in
            s0^sn )
    "" m.ns_e
and emt_bytes s =
  let l = Bytes.length s in
  if l=0 then ""
  else
    let rec lp i =
      if i<l
      then
        (string_of_int (Char.code s.[i]))^","^(lp (i+1))
      else "" in
    lp 0
and emt_cst_stg cs =
  pnt true "enter emt_cst_stg\n";
  ( match cs with
    | [] -> ""
    | (p,s)::tl ->
      let rec st i =
        if i=0 then ""
        else if i=1 then "0"
        else "0,"^(st (i-1)) in
      let mx = 8-((Bytes.length s) mod 8) in
      let s_e = emt_bytes s in
      "\tcst_stg_"^(Sgn.print p)^": db "^s_e^(st mx)^"\n"^(emt_cst_stg tl) )
and emt_pnt_ptn s r = Rcd_Ptn.print (fun v -> (string_of_int (idx s v))^"\'") r
and emt_ptn r = Rcd_Ptn.print (fun i -> (string_of_int i)^"\'") r
and emt_mdl m el =
  let open Rcd_Ptn in
  let ih =
    List.fold_left
      (fun ih (n,(r0,_)) ->
         let s = Hashtbl.create 10 in
         let i0 = idx_crt_ptn s r0 in
         pnt true ("emt_mdl p0:"^n^","^(pnt_s s)^","^(emt_ptn i0)^"\n");
         (n,(i0,s))::ih )
      [] el in
  let ih =
    List.fold_left
      (fun ih (n,_) ->
         let s = Hashtbl.create 10 in
         let v0 = (ref(Ln(Prm Stg))) in
         let v1 = (ref(Ln(Prm(Name "r64")))) in
         let _ = R[|A v0;A v1|] in
         Hashtbl.add s 0 v0; Hashtbl.add s 1 v1;
         let i0 = R[|A 0;A 1|] in
         (n,(i0,s))::ih )
      ih m.ns_g in
  emt_el ih m el
and emt_el ih m el =
  ( match el with
    | [] -> ("","")
    | (n,(_,p0))::tl ->
      let (i0,s0) = ( try List.assoc n ih with _ -> err "emt_el 3") in
      let s = Hashtbl.copy s0 in
      let c0 = cmt ("\t|» "^(emt_ptn i0)) in
      let l0 = "emt_etr_c_"^(lb ()) in
      let l2 = "_"^n in
      let (se1,s1) = emt_el ih m tl in
      let (ea,w) = push_reg s x86_reg_lst in
      let e0 =
        n^":\n"^c0^
        "\tjz "^l2^"\n"^
        "\tjc "^l0^"\n"^
        "\tpush rbx\n"^
        "\tmov rbx,rdi\n"^
        "\tpush rbx\n"^
        (emt_set_ptn "" s "r12" emt_reg_x86 "rbx" i0)^
        "\tpop rbx\n"^
        ea^
        "\tmov rdi,rbx\n"^
        "\tcall dec_r\n"^
        (pop_reg w)^
        "\tpop rbx\n"^
        "jmp "^l2^"\n"^
        l0^":\n"^
        "\tpush rbx\n"^
        "\tmov rbx,rdi\n"^
        (emt_set_ptn "" s "r12" emt_reg_x86 "rbx" i0)^
        "\tpop rbx\n"^
        l2^":\n" in
      let ep = emt_ir m ih s !p0 in
      let se =
        "\t_dyn_"^n^":\n"^
        (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
        "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
        "\t\tdq "^n^"\n" in
      (se1^se,e0^ep^s1) )
and cmt s = if emt_flg then "; "^s^"\n" else ""
and pnt_idx s = Hashtbl.fold (fun n v q -> q^" "^(string_of_int n)^"~"^(Ast.print_v v)) s ""
and mov_idx i0 i1 =
  if i0<9 then "\tmov QWORD "^(emt_reg_x86 i1)^","^(emt_reg_x86 i0)^"\n"
  else
    "\tpush r14\n"^
    "\tmov QWORD r14,"^(emt_reg_x86 i0)^"\n"^
    "\tmov QWORD "^(emt_reg_x86 i1)^",r14\n"^
    "\tpop r14\n"
and emt_get_ptn s tbv idx r dst =
  pnt true "enter emt_get_ptn\n";
  let c0 = "emt_get_ptn "^(emt_ptn r) in
  let open Rcd_Ptn in
  ( match r with
    | A (-2) -> err "emt_get_ptn 0"
    | A i ->
      let v = (try Hashtbl.find s i with _ -> err ("emt_get_ptn 1:"^(pnt_s s)^","^(idx dst)^","^(emt_ptn r))) in
      let open Types in
      let rec tb y =
        ( match y with
          | Var { contents = Ln y0 } -> tb y0
          | Rec { contents = CP(Prm(Name "r2"),_) }
          | Prm(Name "r64") ->
            (cmt c0)^
            (mov_idx i dst)^
            "\tstc\n"
          | Rcd _ ->
            (cmt c0)^
            ( if (idx i)="rdi"
              then
                "\tcall inc_r\n"^
                "\tmov "^(idx dst)^",rdi\n"
              else
                "\tpush rdi\n"^
                "\tmov rdi,"^(idx i)^"\n"^
                "\tcall inc_r\n"^
                "\tmov "^(idx i)^",rdi\n"^
                "\tpop rdi\n"^
                (mov_idx i dst)
            )^
            "\tclc\n"
          | Var { contents = _ }
          | _ ->
            let l0 = "emt_get_ptn_0_"^(lb ()) in
            let l1 = "emt_get_ptn_1_"^(lb ()) in
            (cmt c0)^
            "\tbt r12,"^(string_of_int i)^"\n"^
            "\tjc "^l0^"\n"^
            (*"\tbtr "^tbv^","^(string_of_int i)^"\n"^ *)
            "; boxed\n"^
            ( if (idx i)="rdi"
              then
                "\tcall inc_r\n"
              else
                "\tpush rdi\n"^
                "\tmov rdi,"^(idx i)^"\n"^
                "\tcall inc_r\n"^
                "\tmov "^(idx i)^",rdi\n"^
                "\tpop rdi\n"
            )^
            "\tclc\n"^
            "\tjmp "^l1^"\n"^
            l0^":\n"^
            "; unboxed\n"^
            "\tstc\n"^
            l1^":\n"^
            (if 8<i
             then if (idx dst)="rbx"
               then
                 "\tpush r14\n"^
                 "\tmov QWORD r14,"^(idx i)^"\n"^
                 "\tmov QWORD "^(idx dst)^",r14\n"^
                 "\tpop r14\n"
               else
                 "\tpush rbx\n"^
                 "\tmov QWORD rbx,"^(idx i)^"\n"^
                 "\tmov QWORD "^(idx dst)^",rbx\n"^
                 "\tpop rbx\n"
             else
               (mov_idx i dst))
        ) in
      tb (Var v)
    | R rs ->
      let l = Array.length rs in
      let (ea,p) = push_reg s x86_reg_lst in
      let e0 =
        "\tpush rbx\n"^
        "\tpush r14\n"^
        ea^
        "\tmov rdi,"^(string_of_int l)^"\n"^
        "\tcall mlc\n"^
        "\tmov rbx,rax\n"^
        (pop_reg p) in
      let (e1,_) =
        Array.fold_left
          (fun (e1,i) r ->
             let (ep,l) = push_reg s ["rax";"rdi";"rsi";"rdx"] in
             let ei0 =
               "\tpush rbx\n"^
               (emt_get_ptn s tbv idx r dst)^
               ep^
               "\tmov rdx,"^(idx dst)^"\n"^
               "\tpop rdi\n"^
               "\tmov rbx,rdi\n"^
               "\tmov rsi,"^(string_of_int i)^"\n"^
               "\tcall exc\n"^
               (pop_reg l) in
             (e1^ei0,i+1))
          (e0,0) rs in
      (cmt c0)^
      e1^
      "\tmov "^(idx dst)^",rbx\n"^
      "\tpop r14\n"^
      "\tpop rbx\n"^
      "\tclc\n"
    | _ -> "; emt_get_ptn\n" )

and cf_from_ty y =
  ( match y with
    | Var { contents = Ln y0 } -> cf_from_ty y0
    | Rec { contents = CP(Prm(Name "r2"),_) }
    | Prm(Name "r64") -> `C
    | Rcd _ -> `NC
    | Var { contents = _ }
    | _ -> `V )
and emt_get_crt_ptn s _ idx r =
  pnt true "enter emt_get_crt_ptn\n";
  let c0 = "emt_get_crt_ptn "^(emt_ptn r) in
  let open Rcd_Ptn in
  ( match r with
    | A (-2) -> err "emt_get_ptn 0"
    | A i ->
      let v = (try Hashtbl.find s i with _ -> err ("emt_get_crt_ptn 1:"^(pnt_s s)^","^(emt_ptn r))) in
      let open Types in
      let rec tb y =
        ( match y with
          | Var { contents = Ln y0 } -> tb y0
          | Rec { contents = CP(Prm(Name "r2"),_) }
          | Prm(Name "r64") ->
            let m = idx_min 0 s in
            let e0 =
              (cmt c0)^
              (mov_idx i m)^
              "\tstc\n" in
            (m,e0)
          | Rcd _ ->
            let m = idx_min 0 s in
            let e0 = (cmt c0)^
                     ( if (idx i)="rdi"
                       then
                         "\tcall inc_r\n"^
                         "\tmov "^(idx m)^",rdi\n"
                       else
                         "\tpush rdi\n"^
                         "\tmov rdi,"^(idx i)^"\n"^
                         "\tcall inc_r\n"^
                         "\tmov "^(idx i)^",rdi\n"^
                         "\tpop rdi\n"^
                         (mov_idx i m)
                     )^
                     "\tclc\n" in
            (m,e0)
          | Var { contents = _ }
          | _ ->
            let m = idx_min 0 s in
            let l0 = "emt_get_crt_ptn_0_"^(lb ()) in
            let l1 = "emt_get_crt_ptn_1_"^(lb ()) in
            let e0 =
              (cmt c0)^
              "\tbt r12,"^(string_of_int i)^"\n"^
              "\tjc "^l0^"\n"^
              (*"\tbtr "^tbv^","^(string_of_int i)^"\n"^ *)
              "; boxed\n"^
              ( if (idx i)="rdi"
                then
                  "\tcall inc_r\n"
                else
                  "\tpush rdi\n"^
                  "\tmov rdi,"^(idx i)^"\n"^
                  "\tcall inc_r\n"^
                  "\tmov "^(idx i)^",rdi\n"^
                  "\tpop rdi\n"
              )^
              "\tclc\n"^
              "\tjmp "^l1^"\n"^
              l0^":\n"^
              "; unboxed\n"^
              "\tstc\n"^
              l1^":\n"^
              (mov_idx i m) in
            (m,e0)
        ) in
      tb (Var v)
    | R rs ->
      let (ea,p) = push_reg s x86_reg_lst in
      let ep = pop_reg p in
      let v = newvar () in
      let m = idx_crt s v in
      let l = Array.length rs in
      let e0 =
        ea^
        "\tmov rdi,"^(string_of_int l)^"\n"^
        "\tcall mlc\n"^
        "\tmov "^(idx m)^",rax\n"^
        ep in
      let (e1,_) =
        Array.fold_left
          (fun (e1,i) r ->
             (* let (ep,l) = push_reg s ["rax";"rdi";"rsi";"rdx"] in *)
             let (m0,e0) = emt_get_crt_ptn s "r12" idx r in
             let ei0 =
               "; test x1\n"^
               ea^
               "\tpush QWORD "^(idx m)^"\n"^
               e0^
               "; test x0\n"^
               "\tmov rdx,"^(idx m0)^"\n"^
               "\tpop rdi\n"^
               "\tmov rsi,"^(string_of_int i)^"\n"^
               "\tcall exc\n"^
               "\tmov "^(idx m)^",rdi\n"^
               ep in
             (e1^ei0,i+1))
          (e0,0) rs in
      let _ = idx_csm s v in
      let e2 =
        (cmt c0)^
        e1^
        "\tclc\n" in
      (m,e2)
    | _ -> ((-1),"; emt_get_crt_ptn\n") )
and emt_set_ptn bt s tbv idx src r =
  pnt true "enter emt_set_ptn \n";
  let c0 = "emt_set_ptn "^(emt_ptn r) in
  pnt true c0;
  let open Rcd_Ptn in
  ( match r with
    | A (-2) ->
      pnt true "dbg -2\n";
      (cmt c0)
    | A i ->
      pnt true "dbg 1\n";
      let l0 = "emt_set_ptn_0_"^(lb ()) in
      let l1 = "emt_set_ptn_1_"^(lb ()) in
      let v = (try Hashtbl.find s i with _ -> err ("emt_set_ptn 0:"^(pnt_s s)^","^src^","^(emt_ptn r))) in
      let open Types in
      let rec tb y =
        ( match y with
          | Var { contents = Ln y0 } -> tb y0
          | Rec { contents = CP(Prm(Name "r2"),_) }
          | Prm(Name "r64") ->
            (cmt c0)^
            (cmt "unboxed")^
            "\tmov "^(idx i)^","^src^"\n"
          (* ^"\tbts "^tbv^","^(string_of_int i)^ *)
          (* ^"\tor r12,"^(emt_0b i)^"\n"^"\n" *)
          | Rcd _ ->
            (cmt c0)^
            (cmt "boxed")^
            ( if (idx i)="rdi"
              then
                "\tmov rdi,"^src^"\n"^
                "\tcall inc_r\n"^
                "; test 2\n"^
                "\tmov "^(idx i)^",rdi\n"
              else
                "\tpush rdi\n"^
                "\tmov rdi,"^src^"\n"^
                "\tcall inc_r\n"^
                "; test 1\n"^
                "\tmov "^(idx i)^",rdi\n"^
                "\tpop rdi\n" )^
            (*"\tbtr "^tbv^","^(string_of_int i)^"\n"^ *)
            "\tand "^tbv^",~"^(emt_0b i)^"\n"
          | Var { contents = _ }
          | _ ->
            (cmt c0)^
            (cmt "unknown")^
            bt^
            "\tjc "^l0^"\n"^
            (*"\tbtr "^tbv^","^(string_of_int i)^"\n"^ *)
            ( if (idx i)="rdi"
              then
                "\tmov rdi,"^src^"\n"^
                "\tcall inc_r\n"^
                "\tmov "^(idx i)^",rdi\n"
              else
                "\tpush rdi\n"^
                "\tmov rdi,"^src^"\n"^
                "\tcall inc_r\n"^
                "\tmov "^(idx i)^",rdi\n"^
                "\tpop rdi\n"
            )^
            "\tand "^tbv^",~"^(emt_0b i)^"\n"^
            "\tjmp "^l1^"\n"^
            l0^":\n"^
            "\tmov "^(idx i)^","^src^"\n"^
            (* "\tbts "^tbv^","^(string_of_int i)^"\n"^ *)
            "\tor "^tbv^","^(emt_0b i)^"\n"^
            l1^":\n" ) in
      tb (Var v)
    | R rs ->
      let i0 = idx_min 0 s in
      let r0 =
        if i0<9 then idx i0 else "r14" in
      let (e0,_) =
        Array.fold_left
          (fun (e0,i) r ->
             let ei =
               (* "\tpush "^src^"\n"^ *)
               if i0<9 then
                 "\tpush "^src^"\n"^
                 "\tmov "^r0^",["^src^"]\n"^
                 "\tbt "^r0^","^(string_of_int i)^"\n"^
                 "\tmov "^src^",["^src^"+8*"^(string_of_int (i+1))^"]\n"
               else
                 "\tpush "^src^"\n"^
                 "\tpush r14\n"^
                 "\tmov "^r0^",["^src^"]\n"^
                 "\tbt "^r0^","^(string_of_int i)^"\n"^
                 "\tmov "^src^",["^src^"+8*"^(string_of_int (i+1))^"]\n"^
                 "\tpop r14\n"
             in
             let e1 = emt_set_ptn "" s tbv idx src r in
             let e2 =
               "\tpop "^src^"\n" in
             (e0^ei^e1^e2,i+1))
          ("",0) rs in
      bt^(cmt c0)^e0
    | _ -> ";emt_set_ptn\n" )
and emt_reg_tmp n = "[st_vct_tmp+8*"^(string_of_int n)^"]"
and emt_ptn_set_ptn s sf tbv idx0 idx1 r0 r1 =
  pnt true ("enter emt_ptn_set_ptn:"^(emt_ptn r0)^","^(emt_ptn r1)^"\n");
  let c0 = "emt_ptn_set_ptn "^(emt_ptn r0)^","^(emt_ptn r1) in
  let open Rcd_Ptn in
  ( match r0,r1 with
    | A i,_ ->
      let bt =
        "\tbt r12,"^(string_of_int i)^"\n" in
      (cmt c0)^(emt_set_ptn bt sf tbv idx1 (idx0 i) r1)
    | R _,A (-2) ->
      (cmt c0)
    | R _,A i ->
      let e0 =
        "\tpush "^tbv^"\n"^
        (emt_get_ptn s "r12" idx0 r0 i)^
        "\tpop "^tbv^"\n"^
        (* "\tbtr "^tbv^","^(string_of_int i)^"\n" *)
        "\tand "^tbv^",~"^(emt_0b i)^"\n" in
      (cmt c0)^e0
    | R rs0,R rs1 ->
      let (_,e0) =
        Array.fold_left
          (fun (i,e0) ri ->
             let e1 =
               emt_ptn_set_ptn s sf tbv idx0 idx1 ri rs1.(i) in
             (i+1,e0^e1) )
          (0,"") rs0 in
      (cmt c0)^e0
    | _,_ -> "; emt_ptn_set_ptn\n" )
and emt_ptn_crt_ptn s tbv idx r0 r1 =
  pnt true ("enter emt_ptn_crt_ptn:"^(emt_ptn r0)^","^(pnt_ptn r1)^"\n");
  let c0 = "emt_ptn_crt_ptn "^(emt_ptn r0)^","^(pnt_ptn r1) in
  let open Rcd_Ptn in
  ( match r0,r1 with
    | A i,_ ->
      let bt =
        "\tbt r12,"^(string_of_int i)^"\n" in
      let i1 = idx_crt_ptn s r1 in
      (cmt c0)^(emt_set_ptn bt s tbv idx (idx i) i1)
    | R _,A v ->
      if List.exists (fun (s,w) -> w==v&&s="_") !Ast.rm then cmt c0
      else
        (* let i = idx_min 0 s in *)
        let (i,eg) = emt_get_crt_ptn s "r12" idx r0 in
        let e0 =
          eg^
          (* "\tbtr "^tbv^","^(string_of_int i)^"\n" *)
          "\tand "^tbv^",~"^(emt_0b i)^"\n" in
        Hashtbl.add s i v;
        (cmt c0)^e0
    | R rs0,R rs1 ->
      let (_,e0) =
        Array.fold_left
          (fun (i,e0) ri ->
             let e1 =
               emt_ptn_crt_ptn s tbv idx ri rs1.(i) in
             (i+1,e0^e1) )
          (0,"") rs0 in
      (cmt c0)^e0
    | _,_ -> "; emt_ptn_set_ptn\n" )
and push_ex s x =
  let s0 = Hashtbl.copy s in
  let _ = idx_csm_ptn s0 x in
  let (es,l) = push_s_ex s0 in
  let _ =
    List.map (fun (n,_) -> Hashtbl.remove s n) l in
  (es,l)
and pop_ex s l =
  let c0 = cmt ("pop_ex") in
  let e0 =
    "\tmov QWORD r12,[rsp]\n"^
    "\tmov QWORD [tmp_pop],r14\n" in
  let ln = List.length l in
  let (e1,_) =
    List.fold_left
      (fun (e1,i) (n,v) ->
         let e2 =
           if n<9 then
             "\tmov QWORD "^(emt_reg_x86 n)^",[rsp+8*"^(string_of_int (i+1))^"]\n"
           else
             "\tmov r14,[rsp+8*"^(string_of_int (i+1))^"]\n"^
             "\tmov "^(emt_reg_x86 n)^",r14\n" in
         if Hashtbl.mem s n then err "pop_ex 0"
         else
           (Hashtbl.add s n v; (e1^e2,i+1)))
      ("",0) l in
  c0^e0^e1^
  "\tadd rsp,"^(string_of_int (8*(ln+1)))^"\n"^
  "\tmov QWORD r14,[tmp_pop]\n"
and push_s_ex s =
  let c0 = cmt ("push_s_ex "^(pnt_s s)) in
  let ln = BatHashtbl.length s in
  let ea =
    "\tsub rsp,"^(string_of_int (8*(ln+1)))^"\n"^
    "\tmov QWORD [tmp_push],r14\n"  in
  let (e0,_,l) =
    Hashtbl.fold
      (fun n v (e0,i,l) ->
         let e1 =
           if n<9 then
             "\tmov QWORD [rsp+8*"^(string_of_int (ln-i))^"],"^(emt_reg_x86 n)^"\n"
           else
             "\tmov r14,"^(emt_reg_x86 n)^"\n"^
             "\tmov QWORD [rsp+8*"^(string_of_int (ln-i))^"],r14\n" in
         let l = (n,v)::l in
         (e0^e1,i+1,l))
      s ("",0,[]) in
  let e1 =
    "\tmov QWORD [rsp],r12\n"^
    "\tmov QWORD r14,[tmp_push]\n" in
  (c0^ea^e0^e1,l)
and emt_ptn_1p s (r0:int Rcd_Ptn.t) (r1:int Rcd_Ptn.t) =
  let l0 = Rcd_Ptn.to_list r0 in
  let l1 = Rcd_Ptn.to_list r1 in
  let h0 = Hashtbl.create 10 in
  let _ = List.map (fun i -> Hashtbl.add h0 i (newvar ())) l0 in
  let _ = List.map (fun i -> Hashtbl.add h0 i (newvar ())) l1 in
  let al =
    List.fold_left
      (fun al i ->
         if List.exists (fun j -> i=j) l1
         then
           let v = Hashtbl.find s i in
           let _ = Hashtbl.remove s i in
           let n = idx_crt h0 (newvar ()) in
           let _ = Hashtbl.add s n v in
           (i,n)::al
         else al )
      [] l0 in
  al
and emt_ptn_mov s idx al =
  List.fold_left
    (fun el (i0,i1) ->
       ( match cf_from_ty (Var (Hashtbl.find s i1)) with
         | `C ->
           el^
           "\tmov "^(idx i1)^","^(idx i0)^"\n"^
           "\tbts r12,"^(string_of_int i1)^"\n"
         | `NC ->
           el^
           "\tmov "^(idx i1)^","^(idx i0)^"\n"^
           "\tbtr r12,"^(string_of_int i1)^"\n"
         | `V ->
           let l0 = lb () in
           el^
           "\tbts r12,"^(string_of_int i1)^"\n"^
           "\tmov "^(idx i1)^","^(idx i0)^"\n"^
           "\tbt "^(idx i0)^","^(string_of_int i0)^"\n"^
           "\tjc "^l0^"\n"^
           "\tand r12,~"^(emt_0b i1)^"\n"^
           l0^":\n" ) )
    "; emt_ptn_mov\n" al
and mov_ptn r al =
  Rcd_Ptn.map (fun i0 -> try List.assoc i0 al with _ -> i0) r
and emt_ptn_set_ptn_1p s tbv idx r0 r1 =
  let al = emt_ptn_1p s r0 r1 in
  let c0 = "emt_ptn_set_ptn_1p "^(emt_ptn r0)^","^(emt_ptn r1) in
  let el =
    List.fold_left
      (fun el (i0,i1) ->
         el^
         "\tmov "^(idx i1)^","^(idx i0)^"\n" )
      "" al in
  let open Rcd_Ptn in
  let rec lp r0 r1 =
    ( match r0,r1 with
      | A i,_ ->
        let bt =
          "\tbt r12,"^(string_of_int i)^"\n" in
        ( match BatList.find_opt (fun (i0,_) -> i=i0) al with
          | None ->
            (cmt c0)^(emt_set_ptn bt s tbv idx (idx i) r1)
          | Some (_,i1) ->
            (cmt c0)^(emt_set_ptn bt s tbv idx (idx i1) r1) )
      | R _,A (-2) ->
        (cmt c0)
      | R _,A i ->
        let e0 =
          "\tpush "^tbv^"\n"^
          (emt_get_ptn s "r12" idx r0 i)^
          "\tpop "^tbv^"\n"^
          (* "\tbtr "^tbv^","^(string_of_int i)^"\n" *)
          "\tand "^tbv^",~"^(emt_0b i)^"\n" in
        (cmt c0)^e0
      | R rs0,R rs1 ->
        let (_,e0) =
          Array.fold_left
            (fun (i,e0) ri ->
               let e1 =
                 lp ri rs1.(i) in
               (i+1,e0^e1) )
            (0,"") rs0 in
        (cmt c0)^e0
      | _,_ -> "; emt_ptn_set_ptn\n" ) in
  el^(lp r0 r1)
and emt_dec_ptn s idx r =
  pnt true "enter emt_dec_ptn \n";
  let l = Rcd_Ptn.to_list r in
  let e0 =
    List.fold_left
      (fun e0 n ->
         let l0 = "emt_dec_ptn_0_"^(lb ()) in
         let (e2,l) = push_reg s x86_reg_lst in
         let v = Hashtbl.find s n in
         let rec tb y =
           ( match y with
             | Var { contents = Ln y0 } -> tb y0
             | Rec { contents = CP(Prm(Name "r2"),_) }
             | Prm(Name "r64") ->
               e0^
               (cmt "unboxed")
             | Rcd _ ->
               e0^
               (cmt "boxed")^
               e2^
               "\tmov rdi,"^(idx n)^"\n"^
               "\tcall dec_r\n"^
               (pop_reg l)
             | Var { contents = _ }
             | _ ->
               e0^
               (cmt "unknown")^
               "\tbt r12,"^(string_of_int n)^"\n"^
               "\tjc "^l0^"\n"^
               (* "\tbts r12,"^(string_of_int n)^"\n"^ *)
               e2^
               "\tmov rdi,"^(idx n)^"\n"^
               "\tcall dec_r\n"^
               (pop_reg l)^
               l0^":\n" ) in
         tb (Var v) )
      "" l in
  (cmt ("; emt_dec_ptn "^(emt_ptn r)))^e0
and emt_dec s src y =
  let l0 = lb () in
  let (e2,l) = push_reg s x86_reg_lst in
  let rec tb y =
    ( match y with
      | Var { contents = Ln y0 } -> tb y0
      | Rec { contents = CP(Prm(Name "r2"),_) }
      | Prm(Name "r64") ->
        (cmt "unboxed")
      | Rcd _ ->
        (cmt "boxed")^
        e2^
        "\tmov rdi,"^src^"\n"^
        "\tcall dec_r\n"^
        (pop_reg l)
      | Var { contents = _ }
      | _ ->
        (cmt "unknown")^
        "\tjc "^l0^"\n"^
        (* "\tbts r12,"^(string_of_int n)^"\n"^ *)
        e2^
        "\tmov rdi,"^src^"\n"^
        "\tcall dec_r\n"^
        (pop_reg l)^
        l0^":\n" ) in
  (cmt ("; emt_dec "))^(tb y)
and emt_reg i = (* "[r12-8*"^(string_of_int (i+1))^"]" *) "[st_vct+8*"^(string_of_int i)^"]"
and pnt_s s =
  Hashtbl.fold
    (fun n v e -> e^" "^(string_of_int n)^"\'~"^(Ast.print_v v))
    s ""
and clear idx s =
  Hashtbl.fold
    (fun n _ e ->
       Hashtbl.remove s n;
       let l0 = "clear_"^(lb ()) in
       let ex =
         "\tbt r12,"^(string_of_int n)^"\n"^
         "\tjc "^l0^"\n" in
       let (e0,l) = push_reg s x86_reg_lst in
       let e1 =
         "\tmov rdi,"^(idx n)^"\n"^
         "\tcall dec_r\n"^
         (pop_reg l)^
         l0^":\n" in
       e^ex^e0^e1 )
    s (";clear "^(pnt_s s)^"\n")
and push_s idx s =
  let c0 = cmt ("push_s "^(pnt_s s)) in
  let ln = BatHashtbl.length s in
  let ea =
    "\tsub rsp,"^(string_of_int (8*(ln+1)))^"\n"^
    "\tpush r14\n"  in
  let (e0,_,l) =
    Hashtbl.fold
      (fun n _ (e0,i,l) ->
         let e1 =
           if n<9 then
             "\tmov QWORD [rsp+8*"^(string_of_int (ln-i))^"],"^(idx n)^"\n"
           else
             "\tmov r14,"^(idx n)^"\n"^
             "\tmov QWORD [rsp+8*"^(string_of_int (ln-i))^"],r14\n" in
         let l = n::l in
         (e0^e1,i+1,l))
      s ("",0,[]) in
  let e1 =
    "\tmov QWORD [rsp],r12\n"^
    "\tpop r14\n" in
  (c0^ea^e0^e1,l)
(* let (e0,l) =
   Hashtbl.fold
   (fun n _ (e0,l) ->
     let e1 =
       "\tpush QWORD "^(idx n)^"\n" in
     let l = n::l in
     (e0^e1,l))
   s ("",[]) in
   let e1 =
   "\tpush r12\n"
   (*^"\trcl r12,1\n"^
   "\tadd r15,1\n"^
   "\trcr r12,1\n" *) in
   (c0^e0^e1,l) *)
and pop_s idx l =
  let c0 = cmt ("pop_s") in
  let e0 =
    "\tmov QWORD r12,[rsp]\n"^
    "\tpush r14\n"  in
  let ln = List.length l in
  let (e1,_) =
    List.fold_left
      (fun (e1,i) n ->
         let e2 =
           if n<9 then
             "\tmov QWORD "^(idx n)^",[rsp+8*"^(string_of_int (i+1))^"]\n"
           else
             "\tmov r14,[rsp+8*"^(string_of_int (i+1))^"]\n"^
             "\tmov "^(idx n)^",r14\n" in
         (e1^e2,i+1))
      ("",0) l in
  c0^e0^e1^
  "\tadd rsp,"^(string_of_int (8*(ln+1)))^"\n"^
  "\tpop r14\n"
(* let e0 =
   (* "\trcl r12,1\n"^
   "\tsub r15,1\n"^
     "\trcr r12,1\n"^ *)
   "\tpop r12\n" in
   let e1 =
   List.fold_left
    (fun e1 n ->
       e1^
       "\tpop QWORD "^(idx n)^"\n" ) "" l in
   c0^e0^e1 *)
and idx_sub s1 s0 =
  Hashtbl.iter
    (fun k _ ->
       if Hashtbl.mem s0 k
       then
         Hashtbl.remove s1 k
       else
         ())
    s1
and emt_0b n =
  let s = String.make (n+1) '0' in
  Bytes.set s 0 '1';
  "0b"^s
and rb r =
  ( match r with
    | "rax" -> "al"
    | "rdi" -> "dil"
    | "rsi" -> "sil"
    | "rdx" -> "dl"
    | "rcx" -> "cl"
    | "r8" ->  "r8b"
    | "r9" -> "r9b"
    | "r10" -> "r10b"
    | "r11" -> "r11b"
    | _ ->  err "rb 0" )
and csn = "r15"
and emt_agl = "; emt_agl\n"
and lb () = "lb_"^(Sgn.print (sgn ()))
and pnt_reg _ n =
  "\tpushf\n"^
  " push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11\n"^
  "\tmov rdi,"^(emt_reg_x86 n)^"\n"^
  "\tmov rsi,str_ret\n"^
  "; test 0\n"^
  "\tbt r12,"^(string_of_int n)^"\n"^
  "\tcall pnt\n"^
  "\tcall pnt_str_ret\n"^
  " pop r11
  pop r10
  pop r9
  pop r8
pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax\n"^
  "\tpopf\n"
and pnt_r_c _ r =
  "\tpushf\n"^
  " push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11\n"^
  "\tmov rdi,"^r^"\n"^
  "\tmov rsi,str_ret\n"^
  "\tstc\n"^
  "\tcall pnt\n"^
  "\tcall pnt_str_ret\n"^
  " pop r11
  pop r10
  pop r9
  pop r8
pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax\n"^
  "\tpopf\n"
and pnt_r_nc _ r =
  "\tpushf\n"^
  " push rax
    push rdi
    push rsi
    push rdx
    push rcx
  push r8
    push r9
    push r10
    push r11\n"^
  "\tmov rdi,"^r^"\n"^
  "\tmov rsi,str_ret\n"^
  "\tclc\n"^
  "\tcall pnt\n"^
  "\tcall pnt_str_ret\n"^
  " pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax\n"^
  "\tpopf\n"

and emt_st s =
  let e0 =
    "\tpushf\n"^
    " push rax
    push rdi
    push rsi
    push rdx
  push rcx
    push r8
    push r9
    push r10
    push r11\n" in
  let ep =
    " pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rax\n"^
    "\tpopf\n" in
  let e1 =
    Hashtbl.fold
      (fun n _ e1 ->
         let e2 =
           e0^
           "\tmov rdi,"^(emt_reg_x86 n)^"\n"^
           "\tmov rsi,str_ret\n"^
           "\tbt r12,"^(string_of_int n)^"\n"^
           "\tcall pnt\n"^
           "\tcall pnt_str_ret\n"^
           "mov rsi,"^(string_of_int n)^"\n"^
           "
           mov rdi,str_dbg
           mov rax,0
           call printf\n"^
           ep in
         e1^e2 )
      s "" in
  e0^
  e1^
  ep
and emt_ir m ih s p =
  pnt true ("enter emt_ir:"^(pnt_idx s)^","^(print_line p)^"\n");
  ( match p with
    | Ret r ->
      let s0 = Hashtbl.copy s in
      let ed = emt_dec_ptn s0 emt_reg_x86 (idx_ptn s0 r) in
      let i0 = idx_ptn s r in
      let (m0,eg) = emt_get_crt_ptn s0 "r12" emt_reg_x86 i0 in
      let c0 = cmt ("\t∎ "^(emt_ptn i0)) in
      let _ = idx_csm_ptn s r in
      let l0 = "ret_"^(lb ()) in
      pnt true "test x9\n";
      c0^
      eg^
      "\tjc "^l0^"\n"^
      "\tpush "^(emt_reg_x86 m0)^"\n"^
      ed^
      "\tpop "^(emt_reg_x86 m0)^"\n"^
      "\tclc\n"^
      (clear emt_reg_x86 s)^
      "\tmov rax,"^(emt_reg_x86 m0)^"\n"^
      "\tret\n"^
      l0^":\n"^
      (clear emt_reg_x86 s)^
      "\tmov rax,"^(emt_reg_x86 m0)^"\n"^
      "\tstc\n"^
      "\tret\n"
    | Exn r ->
      let i = idx s r in
      let _ = idx_csm s r in
      "\tmov rbx,"^(emt_reg_x86 i)^"\n"^
      "\tbt r12,"^(string_of_int i)^"\n"^
      "\tjmp err\n"
    | Mtc(r,ps) ->
      let i0 = idx_ptn s r in
      let c0 = cmt ("\t? "^(emt_ptn i0)) in
      let (_,a0) =
        Array.fold_left
          (fun (i,a) ((ri,es),p) ->
             let s = Hashtbl.copy s in
             let s0 = Hashtbl.copy s in
             let ci = cmt ("\t∐\\ "^(Mtc.print (ri,es))) in
             pnt true ci;
             let ei = emt_ptn_crt_ptn s "r12" emt_reg_x86 i0 ri in
             pnt true "dbg x0\n";
             pnt true "dbg x0\n";

             let l_f = "mtc_"^(string_of_int i)^"_"^(lb ()) in
             let exs =
               List.fold_left
                 (fun exs (vx,pa) ->
                    let open Mtc in
                    let c0 = cmt ((print_v vx)^"="^(print_test pa)) in
                    pnt true c0;
                    let ix = idx s vx in
                    let l_ef = "failed_"^(lb ()) in
                    ( match pa with
                      | Eq_Agl_N(n,r) ->
                        let f = (try List.assoc n m.ns_e with _ -> err "emt_ir a0") in
                        let s1 = Hashtbl.copy s in
                        let _ = idx_sub s1 s0 in
                        let ec = clear emt_reg_x86 s1 in
                        let rt = idx_crt_ptn s r in
                        let _ = emt_dec_ptn s emt_reg_x86 (Rcd_Ptn.A ix) in
                        let ed1 = emt_dec_ptn s emt_reg_x86 (Rcd_Ptn.A ix) in
                        let v1 = newvar () in
                        let i1 = idx_crt s v1 in
                        let r1 = (emt_reg_x86 i1) in
                        let bt =
                          "\tbt r12,"^(string_of_int i1)^"\n" in
                        let es =
                          (emt_set_ptn bt s "r12" emt_reg_x86 r1 rt) in
                        let _ = idx_csm s vx in
                        let _ = idx_csm s v1 in
                        let li = "test_"^(lb ()) in
                        ( match f with
                          | Tkn.Tkn(Tkn.Etr(Tkn.Inj i)) ->
                            pnt true "dbg 2\n";
                            let e0 =
                              exs^
                              c0^
                              "\tmov "^r1^",["^(emt_reg_x86 ix)^"+8*1]\n"^
                              "\tcmp "^r1^","^(string_of_int i)^"\n"^
                              "\tjnz "^l_ef^"\n"^
                              "\tjmp "^li^"\n"^
                              l_ef^":\n"^
                              ";test 0\n"^
                              (* ed0^ *)
                              ec^
                              "\tjmp "^l_f^"\n"^
                              li^":\n"^
                              (* "\tmov "^r1^",["^(emt_reg_x86 ix)^"]\n"^ *)
                              "\tmov "^r1^",["^(emt_reg_x86 ix)^"+8*2]\n"^
                              es^
                              ed1 in
                            e0
                          | _ -> err "emt_ir 15" )
                      | P_Cst c ->
                        let s1 = Hashtbl.copy s in
                        let _ = idx_sub s1 s0 in
                        let ec = clear emt_reg_x86 s1 in
                        ( match c with
                          | P_Stg s0 ->
                            let bs = Bytes.of_string s0 in
                            let bl = Bytes.length bs in
                            let rl = (bl/8)+1 in
                            let p = sgn () in
                            cst_stg := (p,bs)::!cst_stg;
                            let li = "test_s8_"^(lb ()) in
                            let ed =
                              (emt_dec_ptn s emt_reg_x86 (Rcd_Ptn.A ix)) in
                            let _ = idx_csm s vx in
                            let rec ef i =
                              if i=rl then ""
                              else
                                "\tmov QWORD rdi,[cst_stg_"^(Sgn.print p)^"+8*"^(string_of_int i)^"]\n"^
                                "\tmov QWORD rsi,["^(emt_reg_x86 ix)^"+8*"^(string_of_int (i+1))^"]\n"^
                                "\tcmp rdi,rsi\n"^
                                "\tjnz "^l_ef^"\n"^
                                (ef (i+1)) in
                            let e0 =
                              c0^
                              "\tpush rdi\n"^
                              "\tpush rsi\n"^
                              (ef 0)^
                              "\tjmp "^li^"\n"^
                              l_ef^":\n"^
                              (* ed^ *)
                              ec^
                              "\tpop rsi\n"^
                              "\tpop rdi\n"^
                              "\tjmp "^l_f^"\n"^
                              li^":\n"^
                              ed^
                              "\tpop rsi\n"^
                              "\tpop rdi\n"
                            in
                            exs^e0
                          | P_R64 x ->
                            let li = "test_r64_"^(lb ()) in
                            let im = idx_min 0 s in
                            let rm = emt_reg_x86 im in
                            let ed =
                              (emt_dec_ptn s emt_reg_x86 (Rcd_Ptn.A ix)) in
                            let _ = idx_csm s vx in
                            let e0 =
                              c0^
                              "\tmov QWORD "^rm^",0x"^(Int64.format "%x" x)^"\n"^
                              "\tcmp "^(emt_reg_x86 ix)^","^rm^"\n"^
                              "\tjnz "^l_ef^"\n"^
                              "\tjmp "^li^"\n"^
                              l_ef^":\n"^
                              (* ed^ *)
                              ec^
                              "\tjmp "^l_f^"\n"^
                              li^":\n"^
                              ed in
                            exs^e0
                          | _ ->
                            exs^
                            c0 )
                      | _ -> err "emt_ir:mtc:0" ))
                 "" es in
             let ed = (emt_dec_ptn s emt_reg_x86 i0) in
             let _ = idx_csm_ptn s r in
             let e1 = emt_ir m ih s p in
             pnt true "test x9\n";
             let e2 =
               a^
               ci^
               ei^
               exs^
               ed^
               e1^
               l_f^":\n" in
             pnt true "test x9\n";

             (i+1,e2))
          (0,"") ps in
      pnt true "test x8\n";

      let _ = idx_csm_ptn s r in
      c0^a0
    | Agl(r,ps) ->
      let vj = newvar () in
      let _ = idx_crt_ptn s (Rcd_Ptn.A vj) in
      let ij = (idx s vj) in
      let _ = emt_reg_x86 ij in
      let va = ref (Ln (r2 ())) in
      let _ = idx_crt_ptn s (Rcd_Ptn.A va) in
      let ia = (idx s va) in
      let ra = emt_reg_x86 ia in
      let i0 = idx_ptn s (Rcd_Ptn.A r) in
      let c0 = cmt ("\t∠ "^(emt_ptn i0)) in
      let l0 = "agl_"^(Sgn.print (sgn ())) in
      let l_0 = lb () in
      let em0 =
        (emt_get_ptn s "r12" emt_reg_x86 i0 ia) in
      let _ = idx_csm_ptn s (Rcd_Ptn.A r) in
      let e0 =
        em0^
        "\tcmp "^ra^",0\n"^
        "\tje "^l_0^"\n"^
        "\txor "^ra^","^ra^"\n"^
        "\nbts r12,"^(string_of_int ia)^"\n"^
        "\tjmp "^l0^"_1\n"^
        l_0^":\n"^
        "\nbts r12,"^(string_of_int ia)^"\n"^
        "\tjmp "^l0^"_0\n" in
      let (_,a0) =
        Array.fold_left
          (fun (i,a) (r,p) ->
             let s = Hashtbl.copy s in
             let ii = idx_crt_ptn s r in
             let ci = cmt ("\t∐ "^(emt_ptn ii)) in
             let yi = inst_ptn 0 r in
             vj := Ln yi;
             let e0 =
               ci^
               l0^"_"^(string_of_int i)^":\n"^
               (emt_set_ptn "" s "r12" emt_reg_x86 ra ii)^
               (emt_dec_ptn s emt_reg_x86 (Rcd_Ptn.A ij)) in
             let _ = idx_csm_ptn s (Rcd_Ptn.A vj) in
             let _ = idx_csm_ptn s (Rcd_Ptn.A va) in
             let e1 =
               e0^
               (emt_ir m ih s p) in
             (i+1,a^e1) )
          (0,c0^e0) ps in
      a0
    | IL_Glb_Call(n,x) ->
      ( match n with
        | Tkn.Etr_N "add" ->
          let open Rcd_Ptn in
          let ix = idx_ptn s x in
          let _ = Hashtbl.copy s in
          let v0 = newvar () in
          let v1 = newvar () in
          let xt = R [|A v0;A v1|] in
          let p = idx_crt_ptn s xt in
          let c0 = cmt ("\t"^(Tkn.print_etr n)^" "^(emt_ptn ix)^" ⊢| ") in
          let e0 =
            c0^
            (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p)^
            (emt_dec_ptn s emt_reg_x86 ix) in
          let _ = idx_csm_ptn s x in
          let i0 = idx s v0 in
          let i1 = idx s v1 in
          let _ = idx_csm_ptn s xt in
          e0^
          "\tpush rbx\n"^
          "\tpush r14\n"^
          "\tmov rbx,"^(emt_reg_x86 i0)^"\n"^
          "\tmov r14,"^(emt_reg_x86 i1)^"\n"^
          "\tadd rbx,r14\n"^
          "\tpop r14\n"^
          (clear emt_reg_x86 s)^
          "\tstc\n"^
          "\tpop rax\n"^
          "\tret\n"
        | Tkn.Etr_N "mul" ->
          let open Rcd_Ptn in
          let _ = Hashtbl.copy s in
          let v0 = newvar () in
          let v1 = newvar () in
          let xt = R [|A v0;A v1|] in
          let p = idx_crt_ptn s xt in
          let ix = idx_csm_ptn s x in
          let c0 = cmt ("\t"^(Tkn.print_etr n)^" "^(emt_ptn ix)^" ⊢| ") in
          let i0 = idx s v0 in
          let i1 = idx s v1 in
          let _ = idx_csm_ptn s xt in
          c0^
          (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p)^
          (emt_dec_ptn s emt_reg_x86 ix)^
          "\tpush rbx\n"^
          "\tpush r14\n"^
          "\tmov rbx,"^(emt_reg_x86 i0)^"\n"^
          "\tmov r14,"^(emt_reg_x86 i1)^"\n"^
          "\timul rbx,r14\n"^
          (clear emt_reg_x86 s)^
          "\tstc\n"^
          "\tpop r14\n"^
          "\tpop rax\n"
        | Tkn.Etr_N "sub" ->
          let open Rcd_Ptn in

          let v0 = newvar () in
          let v1 = newvar () in
          let xt = R [|A v0;A v1|] in
          let p = idx_crt_ptn s xt in
          let ix = idx_csm_ptn s x in
          let c0 = cmt ("\t"^(Tkn.print_etr n)^" "^(emt_ptn ix)^" ⊢| ") in
          let i0 = idx s v0 in
          let i1 = idx s v1 in
          let r0 = emt_reg_x86 i0 in
          let r1 = emt_reg_x86 i1 in
          let _ = idx_csm_ptn s xt in
          if (max i0 i1)<9 then
            c0^
            (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p)^
            (emt_dec_ptn s emt_reg_x86 ix)^
            "\tsub "^r0^","^r1^"\n"^
            "\tpush "^r0^"\n"^
            (clear emt_reg_x86 s)^
            "\tstc\n"^
            "\tpop rax\n"^
            "\tret\n"
          else
            c0^
            (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p)^
            (emt_dec_ptn s emt_reg_x86 ix)^
            "\tpush rbx\n"^
            "\tpush r14\n"^
            "\tmov rbx,"^r0^"\n"^
            "\tmov r14,"^r1^"\n"^
            "\tsub rbx,r14\n"^
            (clear emt_reg_x86 s)^
            "\tstc\n"^
            "\tpop r14\n"^
            "\tpop rax\n"^
            "\tret\n"
        | Tkn.Etr_N "cmp" ->
          let open Rcd_Ptn in
          let _ = Hashtbl.copy s in
          let v0 = newvar () in
          let v1 = newvar () in
          let xt = R [|A v0;A v1|] in
          let p = idx_crt_ptn s xt in
          let ix = idx_csm_ptn s x in
          let v2 = newvar () in
          let v3 = newvar () in
          let yt = R [|A v2;A v3|] in
          let py = idx_crt_ptn s yt in
          let i0 = idx s v0 in
          let i1 = idx s v1 in
          let i2 = idx s v2 in
          let i3 = idx s v3 in
          let r0 = emt_reg_x86 i0 in
          let r1 = emt_reg_x86 i1 in
          let r2 = emt_reg_x86 i2 in
          let r3 = emt_reg_x86 i3 in
          let _ = idx_csm_ptn s yt in
          let c0 = cmt ("\t"^(Tkn.print_etr n)^" "^(emt_ptn ix)^" ⊢| ") in
          let lg = lb () in
          if (max i2 i3)<9 then
            let e0 =
              c0^
              (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p) in
            let _ = idx_csm_ptn s xt in
            e0^
            (emt_dec_ptn s emt_reg_x86 ix)^
            "\txor "^r2^","^r2^"\n"^
            "\txor "^r3^","^r3^"\n"^
            "\tcmp "^r0^","^r1^"\n"^
            "\tsetz "^(rb r2)^"\n"^
            "\tmov "^r0^",1\n"^
            "\tjle "^lg^"\n"^
            (* "\tcmovg "^r3^","^r0^"\n"^ *)
            "\tmov "^r3^","^r0^"\n"^
            lg^":\n"^
            "\tor r12,"^(emt_0b i2)^"\n"^
            "\tor r12,"^(emt_0b i3)^"\n"^
            "\tpush rbx\n"^
            (emt_get_ptn s "r12" emt_reg_x86 py i0)^
            "\tmov rbx,"^(emt_reg_x86 i0)^"\n"^
            (clear emt_reg_x86 s)^
            "\tmov rax,rbx\n"^
            "\tpop rbx\n"^
            "\tclc\n"^
            "\tret\n"
          else
            let e0 =
              c0^
              (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p) in
            let _ = idx_csm_ptn s xt in
            e0^
            (emt_dec_ptn s emt_reg_x86 ix)^
            "\tpush rbx\n"^
            "\tpush r14\n"^
            "\tpush r15\n"^
            "\tmov rbx,"^(emt_reg_x86 i0)^"\n"^
            "\tmov r14,"^(emt_reg_x86 i1)^"\n"^
            "\tcmp rbx,r14\n"^
            "\tmov r14,0\n"^
            "\tmov r15,1\n"^
            "\tmov rbx,0\n"^
            "\tsetz bl\n"^
            "\tcmovg r14,r15\n"^
            "\tpop r15\n"^
            "\tmov "^(emt_reg_x86 i2)^",rbx\n"^
            "\tmov "^(emt_reg_x86 i3)^",r14\n"^
            "\tpop r14\n"^
            "\tpop rbx\n"^
            "\tor r12,"^(emt_0b i2)^"\n"^
            "\tor r12,"^(emt_0b i3)^"\n"^
            "\tpush rbx\n"^
            (emt_get_ptn s "r12" emt_reg_x86 py i0)^
            "\tmov rbx,"^(emt_reg_x86 i0)^"\n"^
            (clear emt_reg_x86 s)^
            "\tmov rax,rbx\n"^
            "\tpop rbx\n"^
            "\tclc\n"^
            "\tret\n"
        | Tkn.Etr_N f ->
          let (i0,sf0) = (try List.assoc f ih with _ -> err "emt_ir a1") in
          let sf = Hashtbl.copy sf0 in
          let _ = pnt true ((pnt_s sf)^","^(pnt_s s)^"\n") in
          let ix = idx_ptn s x in
          let cx = emt_ptn ix in
          let s0 = Hashtbl.copy s in
          let _ = idx_csm_ptn s0 x in
          let e1 = clear emt_reg_x86 s0 in
          let al = emt_ptn_1p s ix i0 in
          let ixa = mov_ptn ix al in
          let em = emt_ptn_mov s emt_reg_x86 al in
          let _ = Rcd_Ptn.map (fun n -> Hashtbl.add sf n (Hashtbl.find s n)) ixa in
          let dec_x = emt_dec_ptn sf emt_reg_x86 ixa in
          let _ = Rcd_Ptn.map (fun n -> Hashtbl.remove s n) ixa in
          (* let e0 =
             "\nmov r14,0\n"^
             "\nnot r14\n"^
             (emt_ptn_set_ptn s sf "r14" emt_reg_x86 emt_reg_tmp ix i0)^
             dec_x in *)
          let c0 = cmt ("\t"^(Tkn.print_etr n)^" "^cx^" ⊢| ") in
          c0^e1^em^
          (emt_ptn_set_ptn sf sf "r12" emt_reg_x86 emt_reg_x86 ixa i0)^
          dec_x^
          "\tjmp _"^f^"\n"
        | _ -> "; ir_glb_call\n" )
    | IL_Call(_,_) ->
      "; il_call\n"
    | Seq(n,p1) ->
      let s0 =
        ( match n with
          | IR_Id(r,rs) ->
            let ir = idx_ptn s r in
            let _ = emt_st s in
            let c0 =
              cmt ("\t$ "^(emt_ptn ir)^" ⊢ "^(Array.fold_left (fun b r -> b^","^(pnt_ptn r)) "" rs)^
                   rtl^(Arr.fld_l (fun s r -> s^","^(print_ty r)) "" rs)) in
            let (_,e0) =
              Array.fold_left
                ( fun (i,e0) ri ->
                    let e1 =
                      emt_ptn_crt_ptn s "r12" emt_reg_x86 ir ri in
                    (i+1,e0^e1) )
                (0,"") rs in
            let e1 =
              emt_dec_ptn s emt_reg_x86 ir in
            let _ = idx_csm_ptn s r in
            c0^e0^e1
          | IR_Call((f,x),y) ->
            let open Rcd_Ptn in
            ( match y with
              | A v ->
                let i_f = idx s f in
                let s_e = Hashtbl.copy s in
                let s_i = Hashtbl.copy s in
                let iy = idx_crt s v in
                let _ = idx_csm s f in
                let _ = idx_csm_ptn s x in
                let v_i = newvar () in
                let i_i__i = idx_crt s_i v_i in
                let ix__i = idx_ptn s_i x in
                Hashtbl.add s_i iy v;
                let e0__i =
                  "\tmov QWORD "^(emt_reg_x86 i_i__i)^",QWORD [rbx+8*1]\n"^
                  "\tbts r12,"^(string_of_int i_i__i)^"\n"^
                  (emt_ptn_set_ptn s_i s_i "r12" emt_reg_x86 emt_reg_x86 (R [|A i_i__i;ix__i|]) (A iy)) in
                let _ = idx_csm s_i v_i in
                let ed = emt_dec_ptn s_i emt_reg_x86 ix__i in
                let _ = idx_csm_ptn s_i x in
                let ed_f = emt_dec_ptn s_i emt_reg_x86 (A i_f) in
                let e_i =
                  e0__i^ed^ed_f^
                  "\tmov rbx,QWORD [dyn_call_vct]\n" in

                let ix = idx_ptn s_e x in
                let cx = emt_ptn ix in
                let (e1,sl) = push_ex s_e (R[|A f; x|]) in
                let im = idx_crt s_e (newvar ()) in
                let ex0 =
                  (emt_ptn_set_ptn s_e s_e "r12" emt_reg_x86 emt_reg_x86 ix (A im)) in
                let dec_x = emt_dec_ptn s_e emt_reg_x86 ix in
                let e_ed_f = emt_dec_ptn s_e emt_reg_x86 (A i_f) in
                let _ = Hashtbl.clear s_e in
                let sp = pop_ex s_e sl in
                Hashtbl.add s_e iy v;
                let cy = emt_ptn (A iy) in
                let c0 = cmt ("\t◂ "^(emt_ptn (A i_f))^","^cx^" ⊢ "^cy^rtl^(print_ty y)) in
                let l_0 = "call_c_"^(lb ()) in
                let l_1 = "call_nc_"^(lb ()) in
                let e_e =
                  c0^e1^
                  ex0^
                  dec_x^
                  e_ed_f^
                  "\tmov rdi,QWORD "^(emt_reg_x86 im)^"\n"^
                  "\tmov rax,QWORD [rbx+8*1]\n"^
                  "\tstc\n"^
                  "\tmov rbx,QWORD [dyn_call_vct]\n"^
                  "\tcall rax\n"^
                  "\tmov QWORD [tmp],rax\n"^
                  "\tjc "^l_0^"\n"^
                  sp^
                  "\tclc\n"^
                  (emt_set_ptn "" s_e "r12" emt_reg_x86 "[tmp]" (A iy))^
                  (emt_dec s_e "[tmp]" (inst_ptn 0 y))^
                  "\tjmp "^l_1^"\n"^
                  l_0^":\n"^
                  sp^
                  "\tstc\n"^
                  (emt_set_ptn "" s_e "r12" emt_reg_x86 "[tmp]" (A iy))^
                  l_1^":\n" in
                let l0 = "ir_dyn_call_0_"^(lb ()) in
                let l1 = "ir_dyn_call_1_"^(lb ()) in
                let _ = "ir_dyn_call_2_"^(lb ()) in
                let _ = "ir_dyn_call_3_"^(lb ()) in
                let e0 =
                  "\tmov QWORD [dyn_call_vct],rbx\n"^
                  "\tmov rbx,QWORD "^(emt_reg_x86 i_f)^"\n"^
                  "\tbt QWORD [rbx],30\n"^
                  "\tjc "^l0^"\n"^
                  e_e^
                  "\tjmp "^l1^"\n"^
                  l0^":\n"^
                  e_i^
                  l1^":\n" in
                e0
              | _ -> "; dyn call\n"
            )
          | IR_Glb_Call(n,x,y) ->
            ( match n with
              | Tkn.Etr_N "add" ->
                ( try
                    let open Rcd_Ptn in
                    let iy = idx_crt_ptn s y in
                    let v0 = ref (Ln (Prm(Name "r64"))) in
                    let v1 = ref (Ln (Prm(Name "r64"))) in
                    let xt = R [|A v0;A v1|] in
                    let p = idx_crt_ptn s xt in
                    let ix = idx_ptn s x in
                    let c0 = cmt ("\t"^(Tkn.print_etr n)^" "^(emt_ptn ix)^" ⊢ "^(emt_ptn iy)^rtl^(print_ty y)) in
                    let i0 = idx s v0 in
                    let i1 = idx s v1 in
                    let e0 =
                      (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p) in
                    let _ = idx_csm_ptn s xt in
                    let e1 =
                      c0^
                      e0^
                      (emt_dec_ptn s emt_reg_x86 ix) in
                    let _ = idx_csm_ptn s x in
                    e1^
                    "\tpush rbx\n"^
                    "\tpush r14\n"^
                    "\tmov rbx,"^(emt_reg_x86 i0)^"\n"^
                    "\tmov r14,"^(emt_reg_x86 i1)^"\n"^
                    "\tadd rbx,r14\n"^
                    "\tstc\n"^
                    "\tpop r14\n"^
                    (emt_set_ptn "" s "r12" emt_reg_x86 "rbx" iy)^
                    "\tpop rbx\n"
                  with _ -> err "emt_ir 11\n" )
              | Tkn.Etr_N "mul" ->
                ( try
                    let open Rcd_Ptn in
                    let iy = idx_crt_ptn s y in
                    let v0 = ref (Ln (Prm(Name "r64"))) in
                    let v1 = ref (Ln (Prm(Name "r64"))) in
                    let xt = R [|A v0;A v1|] in
                    let p = idx_crt_ptn s xt in
                    let ix = idx_ptn s x in
                    let c0 = cmt ("\t"^(Tkn.print_etr n)^" "^(emt_ptn ix)^" ⊢ "^(emt_ptn iy)^rtl^(print_ty y)) in
                    let i0 = idx s v0 in
                    let i1 = idx s v1 in
                    let e0 =
                      (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p) in
                    let _ = idx_csm_ptn s xt in
                    let e1 =
                      c0^
                      e0^
                      (emt_dec_ptn s emt_reg_x86 ix) in
                    let _ = idx_csm_ptn s x in
                    e1^
                    "\tpush rbx\n"^
                    "\tpush r14\n"^
                    "\tmov rbx,"^(emt_reg_x86 i0)^"\n"^
                    "\tmov r14,"^(emt_reg_x86 i1)^"\n"^
                    "\timul rbx,r14\n"^
                    "\tstc\n"^
                    "\tpop r14\n"^
                    (emt_set_ptn "" s "r12" emt_reg_x86 "rbx" iy)^
                    "\tpop rbx\n"
                  with _ -> err "emt_ir 12" )
              | Tkn.Etr_N "sub" ->
                ( try
                    let open Rcd_Ptn in
                    let iy = idx_crt_ptn s y in
                    let v0 = ref (Ln (Prm(Name "r64"))) in
                    let v1 = ref (Ln (Prm(Name "r64"))) in
                    let xt = R [|A v0;A v1|] in
                    let p = idx_crt_ptn s xt in
                    let ix = idx_ptn s x in
                    let c0 = cmt ("\t"^(Tkn.print_etr n)^" "^(emt_ptn ix)^" ⊢ "^(emt_ptn iy)^rtl^(print_ty y)) in
                    let i0 = idx s v0 in
                    let i1 = idx s v1 in
                    let r0 = emt_reg_x86 i0 in
                    let r1 = emt_reg_x86 i1 in
                    ( match ix with
                      | R [| A x0; A x1 |] ->
                        let e0 =
                          if (max i0 i1)<9 then
                            let e0 =
                              (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p) in
                            let _ = idx_csm_ptn s xt in
                            let e1 =
                              e0^
                              (emt_dec_ptn s emt_reg_x86 ix) in
                            let _ = idx_csm_ptn s x in
                            e1^
                            "\tsub "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"^
                            "\tstc\n"^
                            (emt_set_ptn "" s "r12" emt_reg_x86 (emt_reg_x86 x0) iy)
                          else
                            let e0 =
                              (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p) in
                            let _ = idx_csm_ptn s xt in
                            let e1 =
                              e0^
                              (emt_dec_ptn s emt_reg_x86 ix) in
                            let _ = idx_csm_ptn s x in
                            e1^
                            "\tpush rbx\n"^
                            "\tpush r14\n"^
                            "\tmov rbx,"^r0^"\n"^
                            "\tmov r14,"^r1^"\n"^
                            "\tsub rbx,r14\n"^
                            "\tstc\n"^
                            "\tpop r14\n"^
                            (emt_set_ptn "" s "r12" emt_reg_x86 "rbx" iy)^
                            "\tpop rbx\n" in
                        c0^e0
                      | _ ->
                        let e0 =
                          if (max i0 i1)<9 then
                            let e0 =
                              (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p) in
                            let _ = idx_csm_ptn s xt in
                            let e1 =
                              e0^
                              (emt_dec_ptn s emt_reg_x86 ix) in
                            let _ = idx_csm_ptn s x in
                            e1^
                            "\tsub "^r0^","^r1^"\n"^
                            "\tstc\n"^
                            (emt_set_ptn "" s "r12" emt_reg_x86 r0 iy)
                          else
                            let e0 =
                              (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p) in
                            let _ = idx_csm_ptn s xt in
                            let e1 =
                              e0^
                              (emt_dec_ptn s emt_reg_x86 ix) in
                            let _ = idx_csm_ptn s x in
                            e1^
                            "\tpush rbx\n"^
                            "\tpush r14\n"^
                            "\tmov rbx,"^r0^"\n"^
                            "\tmov r14,"^r1^"\n"^
                            "\tsub rbx,r14\n"^
                            "\tstc\n"^
                            "\tpop r14\n"^
                            (emt_set_ptn "" s "r12" emt_reg_x86 "rbx" iy)^
                            "\tpop rbx\n" in
                        c0^e0
                    )
                  with _ -> err "emt_ir 13" )
              | Tkn.Etr_N "cmp" ->
                let open Rcd_Ptn in
                let v0 = ref (Ln (Prm(Name "r64"))) in
                let v1 = ref (Ln (Prm(Name "r64"))) in
                let xt = R [|A v0;A v1|] in
                let p = idx_crt_ptn s xt in
                let ix = idx_ptn s x in
                let dec_x = (emt_dec_ptn s emt_reg_x86 ix) in
                let _ = idx_csm_ptn s x in
                let v2 = newvar () in
                let v3 = newvar () in
                let yt = R [|A v2;A v3|] in
                let py = idx_crt_ptn s yt in
                let i0 = idx s v0 in
                let i1 = idx s v1 in
                let i2 = idx s v2 in
                let i3 = idx s v3 in
                let r0 = emt_reg_x86 i0 in
                let r1 = emt_reg_x86 i1 in
                let r2 = emt_reg_x86 i2 in
                let r3 = emt_reg_x86 i3 in
                let lg = lb () in
                if (max i2 i3)<9 then
                  let e0 =
                    (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p) in
                  let _ = idx_csm_ptn s xt in
                  let iy = idx_crt_ptn s y in
                  let _ = idx_csm_ptn s yt in
                  let c0 = cmt ("\t"^(Tkn.print_etr n)^" "^(emt_ptn ix)^" ⊢ "^(emt_ptn iy)^rtl^(print_ty y)) in
                  c0^
                  e0^
                  dec_x^
                  "\tcmp "^r0^","^r1^"\n"^
                  "\tmov "^r2^",0\n"^
                  "\tmov "^r3^",0\n"^
                  "\tsetz "^(rb r2)^"\n"^
                  "\tmov "^r0^",1\n"^
                  "\tjle "^lg^"\n"^
                  (* "\tcmovg "^r3^","^r0^"\n"^ *)
                  "\tmov "^r3^","^r0^"\n"^
                  lg^":\n"^
                  (* "\tor r12,"^(emt_0b i2)^"\n"^
                     "\tor r12,"^(emt_0b i3)^"\n"^ *)
                  (* "\tbts r12,"^(string_of_int i2)^"\n"^
                     "\tbts r12,"^(string_of_int i3)^"\n"^ *)
                  (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 py iy)
                else
                  let e0 =
                    (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ix p) in
                  let _ = idx_csm_ptn s xt in
                  let iy = idx_crt_ptn s y in
                  let _ = idx_csm_ptn s yt in
                  let c0 = cmt ("\t"^(Tkn.print_etr n)^" "^(emt_ptn ix)^" ⊢ "^(emt_ptn iy)^rtl^(print_ty y)) in
                  c0^
                  e0^
                  dec_x^
                  "\tpush rbx\n"^
                  "\tpush r14\n"^
                  "\tpush r15\n"^
                  "\tmov rbx,"^(emt_reg_x86 i0)^"\n"^
                  "\tmov r14,"^(emt_reg_x86 i1)^"\n"^
                  "\tcmp rbx,r14\n"^
                  "\tmov r14,0\n"^
                  "\tmov r15,1\n"^
                  "\tmov rbx,0\n"^
                  "\tsetz bl\n"^
                  "\tcmovg r14,r15\n"^
                  "\tpop r15\n"^
                  "\tmov "^(emt_reg_x86 i2)^",rbx\n"^
                  "\tmov "^(emt_reg_x86 i3)^",r14\n"^
                  "\tpop r14\n"^
                  "\tpop rbx\n"^
                  (* )"\tbts r12,"^(string_of_int i2)^"\n"^ *)
                  (* "\tbts r12,"^(string_of_int i3)^"\n"^ *)
                  (* ^"\tor r12,"^(emt_0b i2)^"\n"^
                     "\tor r12,"^(emt_0b i3)^"\n"^ *)
                  (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 py iy)
              | Tkn.Etr_N "scc" ->
                let open Rcd_Ptn in
                ( match y with
                  | A v ->
                    let (i0,i1,e_0) =
                      ( match x with
                        | R [|A x0;A x1|] ->
                          let i0 = idx s x0 in
                          let i1 = idx s x1 in
                          (i0,i1,"")
                        | A vx ->
                          let v0 = newvar () in
                          let v1 = newvar () in
                          let ix = idx s vx in
                          let e0 =
                            emt_ptn_crt_ptn s "r12" emt_reg_x86 (A ix) (R [|A v0; A v1|]) in
                          let ed =
                            emt_dec_ptn s emt_reg_x86 (A ix) in
                          let _ = idx_csm s vx in
                          let i0 = idx s v0 in
                          let i1 = idx s v1 in
                          (i0,i1,e0^ed)
                        | _ -> err "emt_ir scc 1" ) in
                    let (ep,l) =
                      push_reg s x86_reg_lst in
                    let ed = emt_dec_ptn s emt_reg_x86 (R [|A i0;A i1|]) in
                    let iv = idx_crt s v in
                    let _ = Hashtbl.remove s i0 in
                    let _ = Hashtbl.remove s i1 in
                    let rv = emt_reg_x86 iv in
                    let c0 = cmt ("\t"^(Tkn.print_etr n)
                                  ^" "^(emt_ptn (R [|A i0;A i1|]))
                                  ^" ⊢ "^(emt_ptn (A iv))^rtl^(print_ty (A v))) in
                    let l_0 = "scc_0_"^(lb ()) in
                    let l_1 = "scc_1_"^(lb ()) in
                    let l_2 = "scc_2_"^(lb ()) in
                    c0^
                    e_0^
                    "\tmov QWORD [tmp],rbx\n"^
                    "\tmov QWORD [tmp+8*1],r14\n"^
                    "\tmov QWORD [tmp+8*2],r15\n"^
                    "\tmov QWORD rbx,"^(emt_reg_x86 i0)^"\n"^
                    "\tmov QWORD r14,"^(emt_reg_x86 i1)^"\n"^
                    ep^
                    "\tmov r15,[rbx]\n"^
                    "\tadd r15,[r14]\n"^
                    "\tand r15,0xffff\n"^
                    "\tmov r8,[rbx]\n"^
                    "\tmov r9,[r14]\n"^
                    "\tshr r8,48\n"^
                    "\tshr r9,48\n"^
                    "\tmov rax,0\n"^
                    "\tmov rdi,r8\n"^
                    "\tadd rdi,r9\n"^
                    "\tbt r15,3\n"^
                    "\tjnc "^l_0^"\n"^
                    "\tbtr r15,3\n"^
                    "\tadd rdi,1\n"^
                    l_0^":\n"^
                    "\tcall mlc\n"^
                    "\tbtr r12,"^(string_of_int iv)^"\n"^
                    "\tmov QWORD rdi,[rax]\n"^
                    "\tbts rdi,16\n"^
                    "\tand rdi,~0xffff\n"^
                    "\tadd rdi,r15\n"^
                    "\tmov QWORD [rax],rdi\n"^
                    "\tmov r15,0\n"^
                    "\tmov r8,0\n"^
                    l_1^":\n"^
                    "\tmov r15b,BYTE [rbx+r8+8*1]\n"^
                    "\tmov BYTE [rax+r8+8*1],r15b\n"^
                    "\tadd r8,1\n"^
                    "\tcmp r15,0\n"^
                    "\tjnz "^l_1^"\n"^
                    "\tmov r9,0\n"^
                    "\tsub r8,1\n"^
                    "\tlea r8,[rax+r8]\n"^
                    l_2^":\n"^
                    "\tmov r15b,BYTE [r14+r9+8*1]\n"^
                    "\tmov BYTE [r8+r9+8*1],r15b\n"^
                    "\tadd r9,1\n"^
                    "\tcmp r15,0\n"^
                    "\tjnz "^l_2^"\n"^
                    "\tmov "^rv^",rax\n"^
                    (pop_reg l)^
                    ed^
                    "\tmov QWORD rbx,[tmp]\n"^
                    "\tmov QWORD r14,[tmp+8*1]\n"^
                    "\tmov QWORD r15,[tmp+8*2]\n"
                  | _ -> err "emt_ir scc 0:" )
              | Tkn.Etr_N "cns" ->
                let open Rcd_Ptn in
                ( match y with
                  | A v ->
                    let _ = emt_st s in
                    let v_i = newvar () in
                    let i_i = idx_crt s v_i in
                    let ix = idx_ptn s x in
                    (* let v_a = newvar () in
                       let vx = (ref(Ln(inst_ptn 0 x))) in *)
                    let e0 =
                      "\tmov QWORD "^(emt_reg_x86 i_i)^",1\n"^
                      "\tbts r12,"^(string_of_int i_i)^"\n"^
                      (emt_ptn_crt_ptn s "r12" emt_reg_x86 (R [|A i_i;ix|]) (A v)) in
                    let _ = idx_csm s v_i in
                    let ed = emt_dec_ptn s emt_reg_x86 ix in
                    let _ = idx_csm_ptn s x in
                    e0^ed
                  |_ -> err "emt_ir cns" )
              | Tkn.Etr_N "nil" ->
                let open Rcd_Ptn in
                ( match y with
                  | A v ->
                    let _ = emt_st s in
                    let v_i = newvar () in
                    let i_i = idx_crt s v_i in
                    let ix = idx_ptn s x in
                    let e0 =
                      "\tmov QWORD "^(emt_reg_x86 i_i)^",0\n"^
                      "\tbts r12,"^(string_of_int i_i)^"\n"^
                      (emt_ptn_crt_ptn s "r12" emt_reg_x86 (R [|A i_i;ix|]) (A v)) in
                    let _ = idx_csm s v_i in
                    let ed = emt_dec_ptn s emt_reg_x86 ix in
                    let _ = idx_csm_ptn s x in
                    e0^ed
                  |_ -> err "emt_ir ⟦⟧" )
              | Tkn.Etr_N "sgn" ->
                let open Rcd_Ptn in
                ( match y with
                  | A vy ->
                    ( match x with
                      | R [||] ->
                        let iy = idx_crt s vy in
                        let e0 =
                          "\tmov rbx,[sgn_ctr]\n"^
                          "\tmov "^(emt_reg_x86 iy)^",rbx\n"^
                          "\tbts r12,"^(string_of_int iy)^"\n"^
                          "\tadd rbx,1\n"^
                          "\tmov [sgn_ctr],rbx\n" in
                        e0
                      | A vx ->
                        let ix = idx_csm s vx in
                        let (ep,l) = push_reg s x86_reg_lst in
                        let iy = idx_crt s vy in
                        let e0 =
                          ep^
                          "\tmov rdi,"^(emt_reg_x86 ix)^"\n"^
                          "\tcall dec_r\n"^
                          (pop_reg l)^
                          "\tmov rbx,[sgn_ctr]\n"^
                          "\tmov "^(emt_reg_x86 iy)^",rbx\n"^
                          "\tbts r12,"^(string_of_int iy)^"\n"^
                          "\tadd rbx,1\n"^
                          "\tmov [sgn_ctr],rbx\n" in
                        e0
                      | _ -> err "emt_ir sgn 1"
                    )
                  | _ -> err "emt_ir sgn 0" )
              | Tkn.Etr_N "eq" ->
                let open Rcd_Ptn in
                let l0 = "_eq_0_"^(lb ()) in
                let l1 = "_eq_1_"^(lb ()) in
                let l2 = "_eq_2_"^(lb ()) in
                let l3 = "_eq_3_"^(lb ()) in
                ( match y with
                  | A vy ->
                    ( match x with
                      | R[|A vx0;A vx1|] ->
                        let ix0 = idx s vx0 in
                        let ix1 = idx s vx1 in
                        let _ = idx_csm_ptn s x in
                        let (ep,l) = push_reg s x86_reg_lst in
                        let iy = idx_crt s vy in
                        let e0 =
                          ep^
                          "\tmov rbx,"^(emt_reg_x86 ix0)^"\n"^
                          "\tmov r14,"^(emt_reg_x86 ix1)^"\n"^
                          "\tmov rdi,rbx\n"^
                          "\tmov rsi,r14\n"^
                          "\tmov rdx,0\n"^
                          "\tmov rcx,0\n"^
                          "\tbt r12,"^(string_of_int ix0)^"\n"^
                          "\tsetc dl\n"^
                          "\tbt r12,"^(string_of_int ix1)^"\n"^
                          "\tsetc cl\n"^
                          "\tpush rdi\n"^
                          "\tpush rsi\n"^
                          "\tcall eq\n"^
                          "\tmov [tmp],rax\n"^
                          "\tpop rdi\n"^
                          "\tbt r12,"^(string_of_int ix0)^"\n"^
                          "\tjc "^l2^"\n"^
                          "\tcall dec_r\n"^
                          l2^":\n"^
                          "\tpop rdi\n"^
                          "\tbt r12,"^(string_of_int ix1)^"\n"^
                          "\tjc "^l3^"\n"^
                          "\tcall dec_r\n"^
                          l3^":\n"^
                          "\tmov rax,[tmp]\n"^
                          "\tbt rax,0\n"^
                          "\tjc "^l0^"\n"^
                          "\tmov rdi,[c_0]\n"^
                          "\tmov r11,0x0001000000000000\n"^
                          "\tadd rdi,r11\n"^
                          "\tmov QWORD [c_0],rdi\n"^
                          "\tmov "^(emt_reg_x86 iy)^",c_0\n"^
                          "\tbtr r12,"^(string_of_int iy)^"\n"^
                          "\tjmp "^l1^"\n"^
                          l0^":\n"^
                          "\tmov rdi,[c_1]\n"^
                          "\tmov r11,0x0001000000000000\n"^
                          "\tadd rdi,r11\n"^
                          "\tmov QWORD [c_1],rdi\n"^
                          "\tmov "^(emt_reg_x86 iy)^",c_1\n"^
                          "\tbtr r12,"^(string_of_int iy)^"\n"^
                          l1^":\n"^
                          (pop_reg l) in
                        e0
                      | A vx ->
                        let ix = idx s vx in
                        let rx = emt_reg_x86 ix in
                        let _ = idx_csm_ptn s x in
                        let (ep,l) = push_reg s x86_reg_lst in
                        let iy = idx_crt s vy in
                        ep^
                        "\tmov rbx,"^rx^"\n"^
                        "\tmov rax,[rbx]\n"^
                        "\tmov rdi,[rbx+8*1]\n"^
                        "\tmov rsi,[rbx+8*2]\n"^
                        "\tmov rdx,0\n"^
                        "\tmov rcx,0\n"^
                        "\trcr rax,1\n"^
                        "\tsetc dl\n"^
                        "\trcr rax,1\n"^
                        "\tsetc cl\n"^
                        "\tcall eq\n"^
                        "\tmov [tmp],rax\n"^
                        "\tmov rdi,rbx\n"^
                        "\tcall dec_r\n"^
                        "\tmov rax,[tmp]\n"^
                        "\tbt rax,0\n"^
                        "\tjc "^l0^"\n"^
                        "\tmov rdi,[c_0]\n"^
                        "\tmov r11,0x0001000000000000\n"^
                        "\tadd rdi,r11\n"^
                        "\tmov QWORD [c_0],rdi\n"^
                        "\tmov "^(emt_reg_x86 iy)^",c_0\n"^
                        "\tbtr r12,"^(string_of_int iy)^"\n"^
                        "\tjmp "^l1^"\n"^
                        l0^":\n"^
                        "\tmov rdi,[c_1]\n"^
                        "\tmov r11,0x0001000000000000\n"^
                        "\tadd rdi,r11\n"^
                        "\tmov QWORD [c_1],rdi\n"^
                        "\tmov "^(emt_reg_x86 iy)^",c_1\n"^
                        "\tbtr r12,"^(string_of_int iy)^"\n"^
                        l1^":\n"^
                        (pop_reg l)
                      | _ -> err "emt_ir eq 1" )
                  | _ -> err "emt_ir eq 0" )
              | Tkn.Etr_N "err" ->
                let open Rcd_Ptn in
                ( match x with
                  | A vx ->
                    ( match y with
                      | A v ->
                        let ix = idx s vx in
                        let rx = emt_reg_x86 ix in
                        let _ = idx_csm s vx in
                        let (ep,l) = push_reg s x86_reg_lst in
                        let iy = idx_crt s v in
                        let e0 =
                          ep^
                          "\tmov rbx,"^rx^"\n"^
                          "\tmov rdi,2\n"^
                          "\tcall mlc\n"^
                          "\tmov rdx,0x0001000200000001\n"^
                          "\tmov [rax],rdx\n"^
                          "\tmov QWORD [rax+8*1],0\n"^
                          "\tmov [rax+8*2],rbx\n"^
                          "\tbtr r12,"^(string_of_int iy)^"\n"^
                          "\tmov "^(emt_reg_x86 iy)^",rax\n"^
                          (pop_reg l) in
                        e0
                      |_ -> err "emt_ir err 0" )
                  | _ -> err "emt_ir err 1" )
              | Tkn.Etr_N f ->
                let af = (try List.assoc f m.ns_e with _ -> err "emt_ir a2") in
                let open Rcd_Ptn in
                ( match af with
                  | Tkn.Tkn(Tkn.Etr(Tkn.Inj j)) ->
                    ( match y with
                      | A v ->
                        let _ = emt_st s in
                        let v_i = newvar () in
                        let i_i = idx_crt s v_i in
                        let ix = idx_ptn s x in
                        (* let v_a = newvar () in
                           let vx = (ref(Ln(inst_ptn 0 x))) in *)
                        let e0 =
                          "\tmov QWORD "^(emt_reg_x86 i_i)^","^(string_of_int j)^"\n"^
                          "\tbts r12,"^(string_of_int i_i)^"\n"^
                          (emt_ptn_crt_ptn s "r12" emt_reg_x86 (R [|A i_i;ix|]) (A v)) in
                        let _ = idx_csm s v_i in
                        let ed = emt_dec_ptn s emt_reg_x86 ix in
                        let _ = idx_csm_ptn s x in
                        e0^ed
                      |_ -> err "emt_ir inj" )
                  | _ ->
                    let es0 = emt_st s in
                    let (i0,sf0) = (try List.assoc f ih with _ -> err "emt_ir a3") in
                    let sf = Hashtbl.copy sf0 in
                    let _ = pnt true ((pnt_s sf)^","^(pnt_s s)^"\n") in
                    let ix = idx_ptn s x in
                    let cx = emt_ptn ix in
                    (* let s0 = Hashtbl.copy s in *)
                    let (e1,sl) = push_ex s x in
                    (* let _ = idx_csm_ptn s0 x in
                       let (e1,sl) = push_s emt_reg_x86 s0 in *)
                    let al = emt_ptn_1p s ix i0 in
                    let ixa = mov_ptn ix al in
                    let em = emt_ptn_mov s emt_reg_x86 al in
                    let _ =
                      Rcd_Ptn.map
                        (fun n ->
                           let v0 = ( try Hashtbl.find sf0 n with _ -> err "emt_ir v2" ) in
                           if Hashtbl.mem s n then err "emt_ir v0"
                           else
                             Hashtbl.add s n v0) i0 in
                    let ex0 =
                      (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ixa i0) in
                    (* let _ =
                       Rcd_Ptn.map
                        (fun n ->
                           Hashtbl.add sf n (Hashtbl.find s n)) ixa in *)
                    let dec_x = emt_dec_ptn s emt_reg_x86 ixa in
                    let _ = Rcd_Ptn.map (fun n -> Hashtbl.remove s n) ixa in
                    let _ = Hashtbl.clear s in
                    let sp = pop_ex s sl in
                    let iy = idx_crt_ptn s y in
                    let cy = emt_ptn iy in
                    let c0 = cmt ("\t"^(Tkn.print_etr n)^" "^cx^" ⊢ "^cy^rtl^(print_ty y)) in
                    let l_0 = "call_c_"^(lb ()) in
                    let l_1 = "call_nc_"^(lb ()) in
                    c0^es0^e1^em^
                    ex0^
                    dec_x^
                    "\tcall _"^f^"\n"^
                    (*(pnt_reg s 8)^ *)
                    "\tmov QWORD [tmp],rax\n"^
                    "\tjc "^l_0^"\n"^
                    "\tclc\n"^
                    sp^
                    "\tmov rbx,[tmp]\n"^
                    (emt_set_ptn "" s "r12" emt_reg_x86 "rbx" iy)^
                    (emt_dec s "rbx" (inst_ptn 0 y))^
                    "\tjmp "^l_1^"\n"^
                    l_0^":\n"^
                    sp^
                    "\tmov rbx,[tmp]\n"^
                    "\tstc\n"^
                    (emt_set_ptn "" s "r12" emt_reg_x86 "rbx" iy)^
                    l_1^":\n"
                )
              | _ -> err "emt_ir etr 0"
            )
          | IR_Glb_Out(o,x) ->
            let open Rcd_Ptn in
            ( match o with
              | "emt" ->
                ( match x with
                  | A vx ->
                    let ix = idx s vx in
                    let rx = emt_reg_x86 ix in
                    let _ = idx_csm s vx in
                    let (ep,l) = push_reg s x86_reg_lst in
                    let e0 =
                      ep^
                      "\tmov rbx,"^rx^"\n"^
                      "\tmov rdi,rbx\n"^
                      "\tcall emt\n"^
                      "\tmov rdi,rbx\n"^
                      "\tcall dec_r\n"^
                      (pop_reg l) in
                    e0
                  | _ -> err "emt_ir emt 0" )
              | _ -> err "emt_ir emt 1"
            )
          | IR_Exp(Ast.Atm(Ast.Stg c),_,Rcd_Ptn.A r) ->
            let bs = Bytes.of_string c in
            let p = sgn () in
            cst_stg := (p,bs)::!cst_stg;
            let (ep,l) = push_reg s x86_reg_lst in
            let sl = Bytes.length bs in
            pnt true "test s0\n";
            let m = sl mod 8 in
            let mx = 8-m in
            let ir = idx_crt s r in
            let c0 = cmt ("\t» "^(print_exp (Ast.Atm(Ast.Stg c)))^" |~ "^(emt_ptn (Rcd_Ptn.A ir))^rtl^(print_ty (Rcd_Ptn.A r))) in
            let im = idx_min 0 s in
            let rm = emt_reg_x86 im in
            let rec erp i =
              if i=0
              then
                "\tmov rsi,[cst_stg_"^(Sgn.print p)^"+8*"^(string_of_int i)^"]\n"^
                "\tmov [rdi+8*"^(string_of_int (i+1))^"],rsi\n"
              else
                "\tmov rsi,[cst_stg_"^(Sgn.print p)^"+8*"^(string_of_int i)^"]\n"^
                "\tmov [rdi+8*"^(string_of_int (i+1))^"],rsi\n"^
                (erp (i-1)) in
            pnt true "test s1\n";
            let e0 =
              ep^
              "\tmov rdi,"^(string_of_int ((sl+mx)/8))^"\n"^
              "\tcall mlc\n"^
              "\tmov rdi,rax\n"^
              (erp (sl/8))^
              "\tmov rdx,[rdi]\n"^
              "\tand rdx,~0xFFFF\n"^
              "\tor rdx,0x10000\n"^
              "\tadd rdx,"^(string_of_int mx)^"\n"^
              "\tmov [rdi],rdx\n"^
              "\tmov QWORD "^rm^",rdi\n"^
              (pop_reg l)^
              (mov_idx im ir)
              (* "\tbts r12,"^(string_of_int ir)^"\n" *)
              ^"\tand r12,~"^(emt_0b ir)^"\n" in
            pnt true "test s2\n";
            c0^e0
          | IR_Exp(Ast.Atm(Ast.R64 x),_,Rcd_Ptn.A r) ->
            let ir = idx_crt s r in
            let c0 = cmt ("\t» "^(print_exp (Ast.Atm(Ast.R64 x)))^" |~ "^(emt_ptn (Rcd_Ptn.A ir))^rtl^(print_ty (Rcd_Ptn.A r))) in
            let im = idx_min 0 s in
            let rm = emt_reg_x86 im in
            let e0 =
              "\tmov QWORD "^rm^",0x"^(Int64.format "%x" x)^"\n"^
              (*"\tmov QWORD "^(emt_reg_x86 ir)^","^rm^"\n"*)
              (mov_idx im ir)
              (* "\tbts r12,"^(string_of_int ir)^"\n" *)
              ^"\tor r12,"^(emt_0b ir)^"\n" in
            c0^e0
          | IR_Exp(Ast.Atm(Ast.R2 x),_,Rcd_Ptn.A r) ->
            let b = if x then "1" else "0" in
            let ir = idx_crt s r in
            let c0 = cmt ("\t» "^(print_exp (Ast.Atm(Ast.R2 x)))^" |~ "^(emt_ptn (Rcd_Ptn.A ir))^rtl^(print_ty (Rcd_Ptn.A r))) in
            let im = idx_min 0 s in
            let rm = emt_reg_x86 im in
            let e0 =
              "\tmov QWORD "^rm^",0x"^b^"\n"^
              (*"\tmov QWORD "^(emt_reg ir)^","^rm^"\n" *)
              (mov_idx im ir)
              (* "\tbts r12,"^(string_of_int ir)^"\n" *)
              ^"\tor r12,"^(emt_0b ir)^"\n" in
            c0^e0
          | IR_Exp(Ast.Atm(Name n),_,Rcd_Ptn.A r) ->
            let ir = idx_crt s r in
            let c0 = cmt ("\t» "^n^" _ ⊢ "^(emt_ptn (Rcd_Ptn.A ir))^rtl^(print_ty (Rcd_Ptn.A r))) in
            let im = idx_min 0 s in
            let rm = emt_reg_x86 im in
            let e0 =
              "\tmov QWORD [tmp],rbx\n"^
              "\tmov rbx,0x0001000000000000\n"^
              "\tadd QWORD [_dyn_"^n^"],rbx\n"^
              "\tmov rbx,QWORD [tmp]\n"^
              "\tmov QWORD "^rm^",_dyn_"^n^"\n"^
              (*"\tmov QWORD "^(emt_reg ir)^","^rm^"\n" *)
              (mov_idx im ir)
              (* "\tbts r12,"^(string_of_int ir)^"\n" *)
              ^"\tand r12,~"^(emt_0b ir)^"\n" in
            c0^e0
          | _ -> err "emt_etr 0" ) in
      s0^(emt_ir m ih s p1) )

and idx_crt_ptn s r = Rcd_Ptn.map (fun v -> idx_crt s v) r
and idx_crt s v =
  if List.exists (fun (s,w) -> w==v&&s="_") !Ast.rm then (-2)
  else
    let n = idx_min 0 s in
    Hashtbl.add s n v;
    n
and idx_ini r =
  let open Rcd_Ptn in
  let rec lp n r =
    ( match r with
      | A _ -> (n+1,A n)
      | R rs ->
        let (n,rs) =
          Array.fold_left
            (fun (n,rs) r ->
               let (n0,r) = lp n r in
               (n0,rs |+| [|r|]))
            (n,[||]) rs in
        (n,R rs)
      | Ro (rs,_) ->
        let (n,rs) =
          Array.fold_left
            (fun (n,rs) r ->
               let (n0,r) = lp n r in
               (n0,rs |+| [|r|]))
            (n,[||]) rs in
        (n+1,Ro(rs,n))
      | R_Lb rs ->
        let (n,rs) =
          Array.fold_left
            (fun (n,rs) (lb,r) ->
               let (n0,r) = lp n r in
               (n0,rs |+| [|(lb,r)|]))
            (n,[||]) rs in
        (n,R_Lb rs)
      | Ro_Lb (rs,_) ->
        let (n,rs) =
          Array.fold_left
            (fun (n,rs) (lb,r) ->
               let (n0,r) = lp n r in
               (n0,rs |+| [|(lb,r)|]))
            (n,[||]) rs in
        (n+1,Ro_Lb (rs,n))
    ) in
  lp 0 r
and idx_csm s (v:_ v_t ref) =
  let i = idx s v in
  if i=(-2) then i
  else
    ( Hashtbl.remove s i; i )
and idx s v =
  let i = Hashtbl.fold (fun n v0 m -> if v0==v then n else m) s (-1) in
  if i=(-1) then err ("idx 0:"^(string_of_int i)) else i
and idx_csm_ptn s r = Rcd_Ptn.map (fun v -> idx_csm s v) r
and idx_add s = let v = newvar () in idx_crt s v
and idx_min i s =
  if Hashtbl.mem s i then idx_min (i+1) s else i
and idx_ptn s r = Rcd_Ptn.map (idx s) r
and reg i =
  if i=0 then "rax"
  else if i=1 then "rdi"
  else if i=2 then "rsi"
  else if i=3 then "rdx"
  else if i=4 then "rcx"
  else if i=5 then "r8"
  else  "[r12+"^(string_of_int (6-i))^"]"
and tmp0 = "r10"
and tmp1 = "r11"
and tbv = "r9"
and reg_idx s v = reg (idx s v)

and call_fun f = "call "^f^"\n"
