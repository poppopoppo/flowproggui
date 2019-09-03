open Util
module Rcd_Ptn = struct
  type 'a t =
    | P_R of ('a t) array
    | P_Ro of ('a t) array * 'a
    | P_A of 'a
  let rec print f p =
    ( match p with
      | P_A r -> f r
      | P_R r -> "{ "^(Util.string_of_list " " (print f) (Array.to_list r))^" }"
      | P_Ro(rs,rt) -> "{ "^(Util.string_of_list " " (print f) (Array.to_list rs))^" < "^(f rt)^" }"
    )
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
    let s = "⟦"^(Util.string_of_list "," string_of_int i)^"⟧" in
    ( match i with
      | [] -> p
      | hd::tl ->
        ( match p with
          | P_R rs ->
            if hd<(Array.length rs) then get_path tl rs.(hd)
            else err ("get_path 0:"^s)
          | P_Ro (rs,_) ->
            if hd<(Array.length rs) then get_path tl rs.(hd)
            else err ("get_path 1:"^s)
          | _ -> err ("get_path 2:"^s))
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
                     (fun i x -> if i=hd then set_path tl x p1 else x)
                     rs)
            else err "get_path 0"
          | P_Ro (rs,rt) ->
            if hd<(Array.length rs)
            then
              let rs0 =
                (Array.mapi
                   (fun i x -> if i=hd then set_path tl x p1 else x)
                   rs) in
              P_Ro(rs0,rt)
            else err "get_path 1"
          | _ -> err "get_path 2")
    )
end
module Level : sig
  type t
  val set : int -> unit
  val get : unit -> int
  val inc : unit -> unit
  val dec : unit -> unit
end = struct
  type t = int
  let lv = ref 0
  let set i = lv:=i
  let get _ = !lv
  let inc () = lv := !lv+1
  let dec () = lv := !lv-1
end
module Types = struct
  type level = int
  type prm =
    | Vct | Opn | Lst | Zn | N | Sgn | Stg | Z_u
    | Z_n of int | Axm of Sgn.t | Inj| Cho | Z_d of Sgn.t
    | EqT of string | Name of string
  type v_p = Sgn.t
  type 'y v_t = | WC | V of level | Q of level | Ln of 'y
  and v = t v_t
  and t =
    | Var of v ref | App of t * t
    | Imp of t * t | Prm of prm | Rcd of t_rcd
    | Rcd_Lb of t_rcd_lb | Rec of t_rec ref
  and v_rcd = t_rcd v_t
  and v_rcd_lb = t_rcd_lb v_t
  and t_rec = | CP of t * t_rcd | P of t * t * t_rcd | Rec_WC
  and t_rcd = | Cns of t * t_rcd | Uo of v_rcd ref | U
  and t_rcd_lb = | Cns_Lb of string * t * t_rcd_lb | Uo_Lb of v_rcd_lb ref | U_Lb
  type print = { rl : (t_rec ref) list; vl : (v ref) list; }
  let v_vct:((v ref) list ref) = ref []
  let newvar () =
    let v = ref WC in
    v_vct := !v_vct@[v];
    v
  let newvar_l l =
    let v = ref (V l) in
    v_vct := !v_vct@[v];
    v
  let newvar_q l =
    let v = ref (Q l) in
    v_vct := !v_vct@[v];
    v
  let print_prm p =
    ( match p with
      | Vct -> "◃"
      | Opn -> "‹›"
      | Lst -> "⟦⟧"
      | Zn -> "ℤn"
      | N -> "ℕ"
      | Sgn -> "&"
      | Stg -> "ℙ"
      | Z_u -> "ℤ_u"
      | Z_n n -> "ℤ_n["^(string_of_int n)^"]"
      | Axm p -> "p"^(Sgn.print p)
      | Inj -> "↑"
      | Cho -> "↓"
      | Z_d p -> "ℤ_d_"^(Sgn.print p)
      | EqT s -> s^"( = _)"
      | Name n -> n )
  let rec print (rl:(t_rec ref list ref)) y =
    (* Util.pnt true ("enter Types.print:0:"^
                   (string_of_int (List.length !rl))^"\n"); *)
    ( match y with
      | Var v ->
        let i =
          ( try fst @@ (BatList.findi (fun _ vi -> vi==v) !v_vct)
            with _ -> err "Types.print:e0" ) in
        (* Util.pnt true ("enter Types.print:1:"^(string_of_int i)^"\n") *)
        ( match !v with
          | WC -> "_"
          | V l ->
            "v"^(string_of_int i)^"''("^(string_of_int l)^")"
          | Q l -> "t"^(string_of_int i)^"'("^(string_of_int l)^")"
          | Ln y -> print rl y )
      | App(y0,y1) -> "("^(print rl y0)^")◂("^(print rl y1)^")"
      | Imp(y0,y1) -> (print rl y0)^"→"^(print rl y1)
      | Prm p -> print_prm p
      | Rcd r -> "{ "^(print_rcd rl r)^"}"
      | Rcd_Lb _ -> "rcd_lb"
      | Rec r ->
        (* Util.pnt true ("Types.print:c1:\n"); *)
        ( try
            let (i,_) = BatList.findi (fun _ p -> r==p) !rl in
            (* Util.pnt true ("Types.print:c3:"^(string_of_int i)^"\n"); *)
            "@["^(string_of_int i)^"]"
          with Not_found ->
            (* Util.pnt true ("Types.print:c2:\n"); *)
            rl := (!rl@[r]);
            let (i,_) = BatList.findi (fun _ p -> r==p) !rl in
            "@["^(string_of_int i)^"]."^(print_rec rl r)
        )
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
  let rec path i y : t =
    ( match i,y with
      | [],y -> y
      | hd::tl,Rcd r -> path tl (path_rcd hd r)
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
      | Rec r ->
        ( match !r with
          | CP(_,rs) -> path_rcd i rs
          | _ -> err "get_agl_i 0" )
      | _ -> err "get_agl_i 1" )
  let rec get_agl a i y =
    ( match i,y with
      | [],_ -> a
      | hd::tl,Rcd r -> Rcd (get_agl_rcd a hd tl r)
      | _ -> err "get_agl:0" )
  and get_agl_rcd a hd tl r =
    ( match hd,r with
      | _,Uo { contents = Ln r0 } -> get_agl_rcd a hd tl r0
      | 0,Cns(t0,t1) -> Cns(get_agl a tl t0,t1)
      | _,Cns(t0,t1) -> Cns(t0,get_agl_rcd a (hd-1) tl t1)
      | _ -> err "get_agl_rcd" )
  let new_wc () = newvar ()
  let rcd_cl l = List.fold_right (fun x r -> Cns(x,r)) l U
  let rcd_op l = List.fold_right (fun x r -> Cns(x,r)) l (Uo (ref WC))
  let rec rcd_cns l t =
    ( match t with
      | Rcd t -> List.fold_right (fun x r -> Cns(x,r)) l t
      | Var { contents = Ln y } -> rcd_cns l y
      | _ -> err ("rcd_cns:"^(print (ref []) t)) )
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
end
module Ast = struct
  type name = string
  type mdl = name * (glb_etr list)
  and scm = Types.t
  and mdl_gma = scm StgMap.t
  and glb_etr =
    | Etr of string * Types.t * Types.t * code
    | Flow of flow
    | Etr_Clq of ((string * Types.t * Types.t * code) list)
    | Flow_Clq of flow list
    | Gram of Peg.grammar
  and flow =
    | Def_Abs of name * args
    | Def_Prd of name * args * ((Types.t * name) list)
    | Def_CoPrd of name * args * ((Types.t * name) list)
    | Def_Fnt of name * (name list)
    | Def_EqT of name * args * Types.t
  and args = name list
  and arg =
    | Arg_V of string
    | Arg_Rcd of arg list
  and code =
    | E of exp_rcd | V of code * code | H of (code list)
    | A of exp_rcd * (int list) * (code list)
    | P of exp_rcd * (code list) | F of exp_rcd * int * code
  and exp_rcd =
    | Agl_Op of exp_rcd
    | Rot | Rcd of exp_rcd array
    | App of exp_rcd * exp_rcd | Prj of exp_rcd * int
    | Atm of exp_atm
  and exp_atm =
    | Z of int | Pls | Mlt | Mns | Cmp | Eq | Fix
    | Exn | Name of string | Inj of int | Cho of int | Stg of string
  type line =
    | End | Line of exp_rcd | Line_Agl of int list * exp_rcd
  let rec print_mdl _ (n,g) =
    let s0 = "§§ "^n^" ≒ \n" in
    let rec lp g =
      ( match g with
        | [] -> "§§.\n"
        | hd::tl ->
          let s1 =
            ( match hd with
              | Etr(n,_,_,_) -> "§ "^n^"\n"
              | Flow f -> print_flow f
              | Etr_Clq _ -> "§ @ "^"\n"
              | Flow_Clq _ -> "¶ @"^"\n"
              | Gram g -> "¶+ℙ"^"\n"^(Peg.print g) ) in
          s1^(lp tl)) in
    s0^(lp g)
  and print_flow f =
    ( match f with
      | (Def_Abs(n,_)) -> "¶ "^n^"\n"
      | (Def_CoPrd(n,_,_)) -> "¶ "^n^" ≃ ∐ "^"\n"
      |  _ -> "¶"^"\n" )
  let tk_agl a =
    let i = ref [] in
    let b = ref false in
    let rec lp p a =
      ( match a with
        | Agl_Op r -> i := p; b := true; r
        | Rcd r -> Rcd (Array.mapi (fun i r -> lp (i::p) r) r)
        | _ -> a ) in
    let a = lp [] a in
    if !b then (!i,a) else err "tk_agl:0"
end
module Tkn = struct
  type ('p, 'r) t =
    | Rcd of (('p, 'r) t) array
    | Tkn of ('p, 'r) tkn
  and ('p, 'r) tkn =
    | Name of string | Stg of string | Z of int
    | Zn of int * int | Sgn of Sgn.t | CoP of int * (('p, 'r) t)
    | P of ('p array) * (('p, 'r) t) | Pls | Mlt | Mns
    | Cmp | Eq | Inj of int | Cho of int | Fix
    | Exn | Fnc of 'p | Clj of 'p * (('p, 'r) t)
    | Ast of Peg.ast | Vct of (('p, 'r) t , ('p, 'r) t) Hashtbl.t
  let rec print k =
    pnt true "enter Tkn.print\n";
    ( try
        ( match k with
          | Rcd rs ->
            pnt true "Tkn.print x1\n";
            ( try "{"^(Array.fold_left (fun s r -> s^" "^(print r)) "" rs)^"}"
              with _ -> err "Tkn.print 6")
          | Tkn v ->
            pnt true "Tkn.print x3\n";
            ( match v with
              | Name n -> n
              | Stg s ->
                if (String.length s)>=20
                then let s0 = String.sub s 0 20 in ("(\""^s0^"\""^"..)")
                else "\""^(String.escaped s)^"\""
              | Z z -> (string_of_int z)
              | Zn (z0,z1) -> "ℤ["^(string_of_int z1)^"]."^(string_of_int z0)
              | Sgn p ->
                pnt true "Tkn.print x0\n";
                ( try "&."^(Sgn.print p) with _ -> err "Tkn.print 0")
              | CoP(i,ki) -> "∐["^(string_of_int i)^","^(print ki)^"]"
              | P (_,_) -> err "print"
              | Pls -> "+"
              | Mlt -> "*"
              | Mns -> "-"
              | Cmp -> "≤"
              | Eq -> "="
              | Inj i -> "↑["^(string_of_int i)^"]"
              | Cho i -> "↓["^(string_of_int i)^"]"
              | Fix -> "@"
              | Exn -> "¿"
              | Fnc _ -> "Fnc"
              | Clj (_,_) -> "Clj"
              | Ast a -> Peg.print_ast a
              | Vct v ->
                let s0 =
                  Hashtbl.fold
                    ( fun b k s0 ->
                        s0^" "^(print b)^"~"^(print k))
                    v "#.{" in
                s0^" }"
            ))
      with _ -> err "Tkn.print 8" )
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
      | P_A a -> a
      | P_R rs -> Rcd (Array.map of_reg_ptn rs)
      | P_Ro (rs,rt) ->
        ( match rt with
          | Rcd rts -> Rcd ((Array.map of_reg_ptn rs) |+| rts)
          | _ -> err "of_reg_ptn 0" ))
  let rec get_path i k =
    ( match i,k with
      | [],_ -> k
      | hd::tl,Rcd rs -> get_path tl rs.(hd)
      | _ -> err "get_path 0"
    )
  let rec get_agl i k =
    (try
       ( match i,k with
         | [],_ -> agl k
         | hd::tl,Rcd rs ->
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
     with _ -> err ("get_agl:1:["^(Util.string_of_list "," string_of_int i)^"]"))
  and agl k =
    ( match k with
      | Tkn (CoP(m1,kx)) -> (m1,kx)
      | Tkn (Z z) -> ((if z=0 then 0 else 1),Rcd [||])
      | Tkn (Zn(z0,_)) -> ((if z0=0 then 0 else 1),Rcd [||])
      | _ -> err ("err 19:"^(print k)) )
end
module IR = struct
  open Rcd_Ptn
  type ('r, 'p) nd =
    | Id of 'r * ('r array) | Prj of 'r * (('r array) * 'r)
    | Cns of (('r array) * 'r) * 'r | Rm of 'r
    | Call of ('r Rcd_Ptn.t) * 'r * ('r Rcd_Ptn.t)
    | Ini of 'r * (('p, 'r) Tkn.t)
  type pt = Name of string | DName of Sgn.t
  module PtMap = Map.Make(struct type t = pt let compare = compare end)
  type ('r ,'c ,'p) t =
    | Etr of ('r Rcd_Ptn.t) * 'c
    | Clj of 'r * ('r Rcd_Ptn.t) * 'c * 'c
    | Prd of 'r * ('r Rcd_Ptn.t) * ('c array) * 'c
    | Agl of ('r Rcd_Ptn.t) * (int list) * (('r Rcd_Ptn.t * 'c) array) * ('r Rcd_Ptn.t * 'c)
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
  type mdl = {
    flow : (Ast.flow list) list;
    grm : Peg.grammar list;
    ir_vct : ir_vct;
    rm : Types.t SgnMap.t;
    ns_t : Types.t StgMap.t;
  }
  type et = mdl * pt * (Sgn.t Rcd_Ptn.t) * (pt, Sgn.t) Tkn.t
  let rtl = " : "
  let op0 = " \\ "
  let rec print_ir h rm iv p0 =
    ( match PtMap.find p0 iv with
      | Etr(r,p1) ->
        "\t »"^op0^(Rcd_Ptn.print print_reg r)^rtl^(Rcd_Ptn.print (print_ty h rm) r)^"\n"
        ^(print_ir h rm iv p1)
      | Clj (_,_,_,p1) ->
        "\t|»"^op0^"\n"^(print_ir h rm iv p1)
      | Prd (_,_,_,p1) -> " ∏ : "^"\n"^(print_ir h rm iv p1)
      | Agl (ra,i,ps,(rr,p1)) ->
        "\t ∠["^(Util.string_of_list "," string_of_int i)^"]"^op0^(Rcd_Ptn.print print_reg ra)^" ⊢ "^(Rcd_Ptn.print print_reg rr)^rtl^(Rcd_Ptn.print (print_ty h rm) rr)^"\n"^
        (Array.fold_left (fun s (r,p) -> s^"\t ∐"^op0^(Rcd_Ptn.print print_reg r)^"\n"^(print_ir h rm iv p)) "" ps)^
        (print_ir h rm iv p1)
      | Seq (o,p1) -> "\t"^(print_nd h rm o)^"\n"^(print_ir h rm iv p1)
      | Ret r -> "\t ∎"^op0^(Rcd_Ptn.print print_reg r)^"\n" )
  and print_nd h rm o =
    ( match o with
      | Id(r,rs) ->
        " $"^op0^(print_reg r)^" ⊢ "^(Array.fold_left (fun s r -> s^","^(print_reg r)) "" rs)^rtl^(Array.fold_left (fun s r -> s^","^(print_ty h rm r)) "" rs)
      | Prj(r,(rs,rt)) -> "◃"^op0^(print_reg r)^" ⊢ "^(Array.fold_left (fun s r -> s^" "^(print_reg r)) "" rs)^" < "^(print_reg rt)
      | Cns(_,_) -> "¬◃"^op0
      | Rm r -> "~|"^op0^(print_reg r)^" ⊢ "
      | Call(y,f,x) -> " ◂"^op0^(print_reg f)^" , "^(Rcd_Ptn.print print_reg x)^" ⊢ "^(Rcd_Ptn.print print_reg y)
      | Ini(r,k) -> "|~"^op0^(Tkn.print k)^" ⊢ "^(print_reg r)^rtl^(Rcd_Ptn.print (print_ty h rm) (P_A r))
    )
  and print_reg r = "r"^(Sgn.print r)
  and print_ty _ rm r = Types.print (ref []) (SgnMap.find r rm)
  let rec print_op iv p0 =
    ( match PtMap.find p0 iv with
      | Etr(r,_) ->
        "\t »"^op0^(Rcd_Ptn.print print_reg r)^"\n"
      | Clj (_,_,_,_) ->
        "\t|»"^op0^"\n"
      | Prd (_,_,_,_) -> " ∏ : "^"\n"
      | Agl (ra,i,ps,(rr,_)) ->
        "\t ∠["^(Util.string_of_list "," string_of_int i)^"]"^op0^(Rcd_Ptn.print print_reg ra)^" ⊢ "^(Rcd_Ptn.print print_reg rr)^"\n"^
        (Array.fold_left
           (fun s (r,_) -> s^"\t ∐"^op0^(Rcd_Ptn.print print_reg r)^"\n") "" ps)
      | Seq (o,_) -> "\t"^(print_op_nd o)^"\n"
      | Ret r -> "\t ∎"^op0^(Rcd_Ptn.print print_reg r)^"\n" )
  and print_op_nd o =
    ( match o with
      | Id(r,rs) ->
        " $"^op0^(print_reg r)^" ⊢ "^(Array.fold_left (fun s r -> s^","^(print_reg r)) "" rs)
      | Prj(r,(rs,rt)) -> "◃"^op0^(print_reg r)^" ⊢ "^(Array.fold_left (fun s r -> s^" "^(print_reg r)) "" rs)^" < "^(print_reg rt)
      | Cns(_,_) -> "¬◃"^op0
      | Rm r -> "~|"^op0^(print_reg r)^" ⊢ "
      | Call(y,f,x) -> " ◂"^op0^(print_reg f)^" , "^(Rcd_Ptn.print print_reg x)^" ⊢ "^(Rcd_Ptn.print print_reg y)
      | Ini(r,k) -> "|~"^op0^(Tkn.print k)^" ⊢ "^(print_reg r)
    )
  let rec get_rm_ptn rm rp : Types.t =
    ( match rp with
      | Rcd_Ptn.P_A r -> (try (SgnMap.find r rm) with _ -> err "get_rm_ptn:0")
      | Rcd_Ptn.P_R rs ->
        let ts = Array.map (get_rm_ptn rm) rs in
        Types.Rcd(Types.rcd_cl (Array.to_list ts))
      | Rcd_Ptn.P_Ro (rs,rt) ->
        let ts = Array.map (get_rm_ptn rm) rs in
        let tt = (try (SgnMap.find rt rm) with Not_found -> err "get_rm_ptn:1") in
        Types.Rcd (Types.rcd_cns (Array.to_list ts) tt)
    )
  let find ev p = try PtMap.find ev p with _ -> err "find:0"
  let rec ret ev p =
    ( match (try find p ev with _ -> err "ret:0") with
          | Ret r -> r
          | Seq (_,p1) -> ret ev p1
          | Agl (_,_,_,(_,p1)) -> ret ev p1
          | Etr (_,p1) -> ret ev p1
          | Clj(_,_,_,p1) -> ret ev p1
          | Prd (_,_,_,p1) -> ret ev p1 )
  let etr ev p =
    ( match (try find p ev with _ -> err "etr:0") with
          | Etr (r,p1) -> (r,p1)
          | _ -> err "etr:1" )
  let rtn ev p =
    ( match find p ev with
      | Etr (r,p1) -> (r,p1)
      | Agl(_,_,_,(rr,p1)) -> (rr,p1)
      | Seq (Call (y,_,_),p1) -> (y,p1)
      | _ -> err "etr:0" )
  let get_r st r =
    let k =  (try SgnMap.find r st with _ -> err "get_r 0") in
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
  let print m =
    let s0 =
      List.fold_left
        (fun s0 fs -> List.fold_left (fun s0 f -> s0^(Ast.print_flow f)) s0 fs) "" m.flow in
    let s1 = List.fold_left (fun s0 g -> s0^(Peg.print g)) "" m.grm in
    let s2 =
      PtMap.fold
        (fun p _ s2 ->
           ( match p with
             | Name n ->
               let (r0,_) = etr m.ir_vct p in
               let r1 = ret m.ir_vct p in
               let (y0,y1) = (get_rm_ptn m.rm r0,get_rm_ptn m.rm r1) in
               let h = ref [] in
               let p0 = Types.print (ref []) y0 in
               let p1 = Types.print (ref []) y1 in
               let sf = "§ "^n^" : "^p0^" ⊢ "^p1 in
               let sc = print_ir h m.rm m.ir_vct (Name n) in
               s2^sf^" ≒ \n"^sc
             | DName _ -> s2 ))
        m.ir_vct "" in
    s0^s1^s2
  let set_r (st:(_ SgnMap.t)) r k = SgnMap.add r k st
  let rec set_reg_ptn (st:(_ SgnMap.t)) r (k:(_ Tkn.t)) =
    let open Rcd_Ptn in
    let open Tkn in
    ( try
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
                if i=ln
                then
                  let st = set_r st rt (Rcd [||]) in
                  st
                else
                  let lt =
                    ( try Array.init (ln-i) (fun n -> l.(i+n))
                      with _ -> err "set_reg_ptn:1" ) in
                  let st = set_r st rt (Rcd lt) in
                  st
            )
        )
      with | Failure s -> err s | _ -> err "set_reg_ptn:3" )
  let rec set_cs_k st l =
    ( match l with
      | [] -> st
      | (r,k)::tl ->
        let st = set_r st r k in
        set_cs_k st tl )
  let get_cs_k st =
    let l = SgnMap.fold (fun r k l -> (r,k)::l) st [] in
    (l,SgnMap.empty)
  let free_st _ = SgnMap.empty
  let rec run m p0 (st:(_ SgnMap.t)) (cs:(((pt,Sgn.t) cs_f) Stack.t)) =
    Util.pnt true ("enter run:"^(print_op m.ir_vct p0)^"\n");
    let open Rcd_Ptn in
    let open Tkn in
    ( match find p0 m.ir_vct with
      | Etr _ -> err "run:0"
      | Ret r ->
        let (k,st) = get_reg_ptn st r in
        if Stack.is_empty cs then k
        else
          let hd = Stack.pop cs in
          ( match hd with
            | CS_f_il pe ->
              let (r0,p1) = rtn m.ir_vct pe in
              let st = set_reg_ptn st r0 k in
              run m p1 st cs
            | CS_f (l,pe) ->
              let (r0,p1) = rtn m.ir_vct pe in
              let st = free_st st in
              let st = set_cs_k st l in
              let st = set_reg_ptn st r0 k in
              run m p1 st cs
          )
      | Agl (ra,i,ps,(_,_)) ->
        let (k0,st) = get_reg_ptn st ra in
        let open Tkn in
        let (j,k1) = get_agl i k0 in
        let (rx,pr) = ps.(j) in
        let st = set_reg_ptn st rx k1 in
        Stack.push (CS_f_il p0) cs;
        run m pr st cs
      | Prd (_,_,_,_) -> err "err 10"
      | Clj (_,_,_,_) -> err "err 11"
      | Seq (o,p1) ->
        ( match o with
          | Ini (r0,k) ->
            let st = set_r st r0 k in
            run m p1 st cs
          | Id (r1,r2) ->
            let (k1,st) = get_r st r1 in
            let st = Array.fold_left (fun st r -> set_r st r k1) st r2 in
            run m p1 st cs
          | Rm r0 ->
            let (_,st) = get_r st r0 in
            run m p1 st cs
          | Prj(r0,(rs,rt)) ->
            let (k0,st) = get_r st r0 in
            let st = set_reg_ptn st (P_Ro (Array.map (fun x -> P_A x) rs,rt)) k0 in
            run m p1 st cs
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
                run m p1 st cs
              | _ -> err "run: Cns" )
          | Call (rp0,r1,rp2) ->
            let (k_f,st) = get_r st r1 in
            let (kx,st) = get_reg_ptn st rp2 in
            let y = app m k_f kx in
            ( match y with
              | `Tkn y ->
                let st = set_reg_ptn st rp0 y in
                run m p1 st cs
              | `Fnc p ->
                let (l,st) = get_cs_k st in
                let (re,p1) = etr m.ir_vct p in
                let st = set_reg_ptn st re kx in
                Stack.push (CS_f(l,p0)) cs;
                run m p1 st cs )
        )
    )
  and app m f x =
    let open Tkn in
    ( match f,x with
      | Tkn Mns,Tkn (Z z) -> `Tkn (Tkn (Z (-z)))
      | Tkn Mns,Tkn (Zn(z0,z1)) -> `Tkn(Tkn(Zn(z1-(z0 mod z1),z1)))
      | Tkn Inj i,_ -> `Tkn (Tkn (CoP(i,x)))
      | Tkn (Cho _),_ -> err "err 7"
      | Tkn Exn,_ -> err "err 8"
      | Tkn Fix,_ -> err "err 9"
      | Tkn (Fnc pa),_ -> `Fnc pa
      | Tkn (Clj (_,_)),_ -> err "run 3"
      | Tkn Pls,Rcd [|(Tkn Z z1);(Tkn Z z2)|] -> `Tkn (Tkn (Z (z1+z2)))
      | Tkn Pls,Rcd [|(Tkn Zn(z1,z2));(Tkn Zn(z3,z4))|] when z2=z4 ->
        `Tkn (Tkn (Zn((z1+z3) mod z2,z2)))
      | Tkn Mlt,Rcd [|(Tkn Z z1);(Tkn Z z2)|] -> `Tkn (Tkn (Z (z1*z2)))
      | Tkn Mlt,Rcd [|(Tkn Zn(z1,z2));(Tkn Zn(z3,z4))|] when z2=z4 ->
        `Tkn (Tkn (Zn((z1*z3) mod z2,z2)))
      | Tkn Cmp,Rcd [|(Tkn Z z1);(Tkn Z z2)|] ->
        let b = if z1<=z2 then 1 else 0 in
        `Tkn (Tkn (Zn(b,2)))
      | Tkn Eq,Rcd [|x;y|] ->
        let b = if x=y then 1 else 0 in
        `Tkn (Tkn (Zn (b,2)))
      | Tkn (Tkn.Name n),_ ->
        ( match n with
          | "‹›" -> app m (Tkn (Inj 0)) x
          | "‹" -> app m (Tkn(Inj 1)) x
          | "⟦⟧" -> app m (Tkn(Inj 0)) x
          | "⟦" -> app m (Tkn(Inj 1)) x
          | "&" ->
            ( match x with
              | Rcd [||] -> `Tkn(Tkn (Tkn.Sgn (sgn ())))
              | _ -> err "app 3" )
          | "⊵" ->
            ( match x with
              | Rcd [|Rcd[|Tkn Vct v;k|];a0|] ->
                let a1 = Tkn.vct_op v k a0 in
                `Tkn(Rcd [|Rcd[|(Tkn (Vct v));k|];a1|])
              | _ -> err "app 8" )
          | "#" -> `Tkn(Tkn(Vct (Hashtbl.create 10)))
          | "pnt" ->
            let s = Tkn.print x in
            Util.pnt true ("pnt:"^s^"\n");
            `Tkn(Rcd [||])
          | "read" ->
            ( match x with
              | Tkn (Stg s) ->
                let l = Util.load_file s in
                `Tkn(Tkn (Stg l))
              | _ -> err "app:5" )
          | _ ->
            ( try
                let g = List.find (List.exists (fun (n0,_,_) -> n=n0)) m.grm in
                ( match x with
                  | Tkn (Stg s) ->
                    let (a,s0) = Peg.parse g n s in
                    ( match a with
                      | None -> `Tkn (Rcd [| (Tkn(CoP(0,Rcd [||]))); (Tkn(Stg s0)) |])
                      | Some a -> `Tkn(Rcd [|(Tkn(CoP(1,Tkn(Ast a))));(Tkn(Stg s0))|])
                    )
                  | _ -> err "app:0" )
              with
              | Failure s ->
                Util.pnt true ("not grammar:"^s^"\n");
                `Fnc ((Name n):pt)
              | Stack_overflow -> err "parse:stack overflow"
              | _ ->
                Util.pnt true ("not grammar:x\n");
                `Fnc ((Name n):pt)
            ))
      | _ -> err "app:1"
    )
  let rec seq ev p1 p2 =
    let c1 = find p1 ev in
    let c2 = find p2 ev in
    ( match c1 with
      | Ret _ ->
        let ev = PtMap.add p1 c2 ev in
        ev
      | Seq (_,p3) ->
        seq ev p3 p2
      | Agl (_,_,_,(_,p3)) ->
        seq ev p3 p2
      | _ -> err "seq 0")
  let rec free_idx h0 v0 r =
    let ri = Rcd_Ptn.map (fun r -> SgnMap.find r h0) r in
    let rec f_r ri =
      ( match ri with
        | P_A i -> IntSet.remove i v0
        | P_R rs ->
          Array.fold_left
            (fun _ r -> f_r r)
            v0 rs
        | P_Ro (rs,rt) ->
          let v0 = Array.fold_left
              (fun _ r -> f_r r)
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
      | Ret _ -> (h0,v0)
      | Agl(r0,_,ps,(rr,p1)) ->
        let v0 = free_idx h0 v0 r0 in
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
        (fun (_,rs) -> rs.(i))
        rp0 in
    let rr = (Array.init n (fun i -> rpi i)) in
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
  let rec mk_rm rp =
    ( match rp with
      | P_R rs ->
        let a1 =
          Array.fold_left
            (fun a r ->
               let a1 = mk_rm r in
               a @ a1 )
            [] rs in
        a1
      | P_Ro (rs,rt) ->
        let a1 =
          Array.fold_left
            (fun a r ->
               let a1 = mk_rm r in
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
        let rr = P_A (sgn ()) in
        let (la,_,ev) =
          List.fold_left
            (fun (la,i,ev) c ->
               let rp = (P_A (sgn())) in
               let pi = DName (sgn ()) in
               let (ev,_,_) = vh_of_ast ev pi rp c in
               let la = la |+| [|(rp,pi)|] in
               (la,i+1,ev))
            ([||],0,ev) l in
        let p2 = DName (sgn ()) in
        let n2 = Agl(r1,ix,la,(rr,p2)) in
        let ev = PtMap.add p1 n2 ev in
        let ev = PtMap.add p2 (Ret rr) ev in
        (ev,p2,rr)
      | F (_,_,_) -> err "vm2:a4"
    )
  and vh_of_exp_ptn ev p0 r0 e0 =
    let open Ast in
    ( match e0 with
      | Rot ->
        let ev = PtMap.add p0 (Ret r0) ev in
        (ev,p0,r0)
      | Rcd [||] ->
        let k = Tkn.Rcd [||] in
        let v1 = sgn () in
        let r1 = P_A v1 in
        let p1 = DName (sgn ()) in
        let ev = PtMap.add p0 (Seq(Ini(v1,k),p1)) ev in
        let ev = PtMap.add p1 (Ret r1) ev in
        (ev,p1,r1)
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
            let (ev,pf,rf) = vh_of_exp_ptn ev p1 r1 e1 in
            let (ev,px,rx) = vh_of_exp_ptn ev pf r2 e2 in
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
                     let c0 = mk_rm r in
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
                     let c0 = mk_rm r in
                     (c0 @ a,j+1))
                ([],0) rs in
            let (ev,p3) = seqs ev p2 cl rs.(i) in
            (ev,p3,rs.(i))
          | P_A r1 ->
            let rs = Array.init (i+1) (fun _ -> sgn ()) in
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
                     let c0 = mk_rm (P_A r) in
                     (c0 @ a,j+1))
                ([],0) rs in
            let (ev,p4) = seqs ev p3 cl (P_A rs.(i)) in
            (ev,p4,P_A rs.(i))
        )
      | Atm a -> vh_of_exp ev p0 a
      | Agl_Op _ -> err "Agl_Op:0"
    )
  and vh_of_exp ev p e =
    let open Ast in
    let k =
      ( match e with
        | Ast.Z z -> Tkn.Z z
        | Ast.Pls -> Tkn.Pls
        | Ast.Mlt -> Tkn.Mlt
        | Ast.Mns -> Tkn.Mns
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
  let c_m_of_g g =
    let m0 =
      BatList.fold_left
        (fun ev e ->
           ( match e with
             | Ast.Etr (n,_,_,f) ->
               let r0 = P_A (sgn ()) in
               let pn = Name n in
               let (ev,_,_) = vh_of_ast ev pn r0 f in
               ev
             | Ast.Etr_Clq l ->
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
    | Agl of ('r Rcd_Ptn.t) * (int list) * (('r Rcd_Ptn.t * pt) array) * (('r Rcd_Ptn.t) * pt)
    | Nd of ('r, 'p) IR.nd
  type t = ((r,  pt) op) array
  type etr_vct = (int IR.PtMap.t * (r Rcd_Ptn.t)) * t
  let save_etr_vct _ = ()
  let save_tkn _ _ = ()
  let load_tkn _ = ()
  let rec asm_of_ir nm ev p0 j =
    let c0 = IR.find p0 ev in
    ( match c0 with
      | IR.Ret r -> (IR.PtMap.add p0 j nm,[|Ret r|],j+1)
      | IR.Agl (ra,i,ps,(rr,pr)) ->
        let (nm,a0,psi,j0) = Array.fold_left
            (fun (nm,a0,psi,j0) (ri,pi) ->
               let nm = IR.PtMap.add pi j0 nm in
               let (nm,a1,j0) = asm_of_ir nm ev pi j0 in
               (nm,a0 |+| a1,psi |+| [|(ri,j0)|],j0))
            (nm,[||],[||],j+1) ps in
        let (nm,ar,n) = asm_of_ir nm ev pr j0 in
        (nm,[|(Agl(ra,i,psi,(rr,j0)))|] |+| a0 |+| ar,n)
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
        (fun p _ (a,j,nm) ->
           ( match p with
             | IR.Name _ ->
               let nm = IR.PtMap.add p j nm in
               let (nm,a,j) = asm_of_ir nm ev p j in
               (a,j,nm)
             | IR.DName _ -> (a,j,nm)))
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
  open Types
  open IR
  let rec occurs rl v1 = function
    | Var v2 ->
      if v1 == v2 then true
      else
        ( match !v2 with
          | V l1 ->
            let ml = (match !v1 with V l -> min l l1 | _ -> l1) in
            v2 := V ml; false
          | WC ->
            ( match !v1 with
              | V l -> v2 := V l; false
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
  and occurs_rcd rl (v1:v ref) (l1:t_rcd) =
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
          | V l1 ->
            let ml = (match !v1 with V l -> min l l1 | _ -> l1) in
            t := V ml;
            false
          | WC ->
            ( match !v1 with
              | V l -> t := V l; false
              | _ -> false )
          | Ln t1 -> rcd_occurs v1 t1
          | Q _ -> err "occurs:0" )
      | Cns(_,t2) -> rcd_occurs v1 t2)
  and occurs_rcd_lb rl (v1:v ref) (l1:t_rcd_lb) =
    ( match l1 with
      | U_Lb -> false
      | Uo_Lb t ->
        ( match !t with
          | V l1 ->
            let ml = (match !v1 with V l -> min l l1 | _ -> l1) in
            t := V ml;
            false
          | WC -> false
          | Ln t1 -> occurs_rcd_lb rl v1 t1
          | Q _ -> err "occurs:0" )
      | Cns_Lb(_,t1,t2) -> (occurs rl v1 t1)||(occurs_rcd_lb rl v1 t2))
  and rcd_lb_occurs (v1:v_rcd_lb ref) (l1:t_rcd_lb) =
    ( match l1 with
      | U_Lb -> false
      | Uo_Lb t ->
        ( match !t with
          | Ln t0 -> rcd_lb_occurs v1 t0
          | _ -> false )
      | Cns_Lb(_,_,t2) -> rcd_lb_occurs v1 t2)
  and occurs_rec pl v1 rp =
    ( match !rp with
      | CP(_,cp) -> occurs_rcd pl v1 cp
      | P(_,_,p) -> occurs_rcd pl v1 p
      | _ -> err "occurs_rec:0" )
  let rec unify ru t0 t1 =
    let h = ref [] in
    let se = (Types.print h t0)^" ~ "^(Types.print h t1) in
    (* Util.pnt true ("enter unify:"^se^"\n"); *)
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
  and tl_rcd_lb l1 =
    ( match l1 with
      | U_Lb -> `Tl_U
      | Uo_Lb t0  ->
        ( match !t0 with
          | Ln t1 -> tl_rcd_lb t1
          | _ -> `Tl_Uo t0 )
      | Cns_Lb(_,_,l2) -> tl_rcd_lb l2 )
  and find_lb (b:string) l1 =
    ( match l1 with
      | U_Lb -> `U
      | Uo_Lb t1 ->
        ( match !t1 with
          | Ln t3 -> find_lb b t3
          | _ ->
            let w1 = Var (newvar ()) in
            t1 := Ln (Cns_Lb(b,w1,Uo_Lb (ref WC)));
            `Lb w1
        )
      | Cns_Lb(b1,t1,t2) ->
        if b = b1 then `Lb t1 else find_lb b t2 )
  and unify_rcd_lb ru l1 l2 =
    let rec f_l l1 =
      ( match l1 with
        | U_Lb -> ()
        | Uo_Lb t1 ->
          ( match !t1 with
            | Ln t2 -> f_l t2
            | _ -> ()
          )
        | Cns_Lb(b1,t1,t2) ->
          let _ =
            ( match find_lb b1 l2 with
              | `U -> err "unify_rcd_lb:0"
              | `Lb t -> unify ru t t1 ) in
          f_l t2 ) in
    let _ = f_l l1 in
    let rec f_r l1 =
      ( match l1 with
        | U_Lb -> ()
        | Uo_Lb t1 ->
          ( match !t1 with
            | Ln t2 -> f_r t2
            | _ -> () )
        | Cns_Lb(b1,_,t2) ->
          let _ =
            ( match find_lb b1 l2 with
              | `U -> err "unify_rcd_lb:0"
              | `Lb _ -> () ) in
          f_r t2
      ) in
    let _ = f_r l2 in
    let rec f_tl l1 l2 =
      ( match l1,l2 with
        | Cns_Lb(_,_,t0),l3 | l3,Cns_Lb(_,_,t0) -> f_tl t0 l3
        | U_Lb,U_Lb -> ()
        | Uo_Lb v0,l3 | l3,Uo_Lb v0 ->
          ( match !v0 with
            | Ln l4 -> f_tl l3 l4
            | _ ->
              let b = rcd_lb_occurs v0 l3 in
              if b then err "unify_rcd_lb:0"
              else v0 := (Ln l3); ())
      ) in
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
          | WC -> ()
          | V l0 -> if l<l0 then v := (Q l)
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
          | WC -> ()
          | V l0 -> if l<l0 then v := (Q l)
          | Q _ -> ()
          | Ln y1 -> gen_rcd rl l y1 )
      | Cns(t0,t1) -> gen rl l t0; gen_rcd rl l t1 )
  and gen_rcd_lb rl l r =
    ( match r with
      | U_Lb -> ()
      | Uo_Lb v ->
        ( match !v with
          | V l0 -> if l<l0 then v := (Q l)
          | WC -> ()
          | Q _ -> ()
          | Ln y1 -> gen_rcd_lb rl l y1 )
      | Cns_Lb(_,t0,t1) -> gen rl l t0; gen_rcd_lb rl l t1 )
  type inst = {
    al:(v ref * v ref) list;
    al_rcd:(v_rcd ref * v_rcd ref) list;
    al_rcd_lb : (v_rcd_lb ref * v_rcd_lb ref) list;
    rl : (t_rec ref * t_rec ref) list;
  }
  let inst_ini () = { al = []; al_rcd = []; al_rcd_lb = []; rl = []; }
  let rec inst l i y =
    (* Util.pnt true "inst:0\n";
       Util.pnt true ("enter inst:"^(Types.print (ref []) y)^"\n"); *)
    ( match y with
      | Var v ->
        ( match !v with
          | Q _ ->
            ( try (Var (List.assq v i.al),i)
              with Not_found ->
                let v0 = newvar_l l in
                let i = { i with al = (v,v0)::i.al } in
                (Var v0,i))
          | Ln y -> inst l i y
          | WC -> v := Types.V l; (y,i)
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
      | Rcd_Lb r -> let (r,i) = (inst_rcd_lb l i r) in (Rcd_Lb r,i)
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
                let v0 = ref (Types.V l) in
                let i = { i with al_rcd = (v,v0)::i.al_rcd } in
                (Uo v0,i))
          | Ln y -> inst_rcd l i y
          | WC -> v := Types.V l; (r,i)
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
          | Q _ ->
            ( try (Uo_Lb (List.assq v i.al_rcd_lb),i)
              with Not_found ->
                let v0 = ref (Types.V l) in
                let i = { i with al_rcd_lb = (v,v0)::i.al_rcd_lb } in
                (Uo_Lb v0,i))
          | Ln y -> inst_rcd_lb l i y
          | WC -> v := Types.V l; (r,i)
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
  let gen_rm (l:int) rm = SgnMap.map (fun y -> gen (ref []) l y) rm
  let rec slv m l (p0:pt) =
    let open Rcd_Ptn in
    Util.pnt true ("enter slv:"^(print_op m.ir_vct p0)^"\n");
    Util.Timer.pnt "slv-t0";
    ( match (try (find p0 m.ir_vct) with _ -> err "slv:4") with
          | Etr(r,p1) ->
            let _ = Rcd_Ptn.map (fun r -> inst l (inst_ini ()) (SgnMap.find r m.rm)) r in
            slv m l p1
          | Clj (_,_,_,_) -> err "slv:0"
          | Prd (_,_,_,_) -> err "slv:1"
          | Agl(ra,i,ps,(rr,pr)) ->
            let (ta,_) = inst (l+1) (inst_ini ()) (get_rm_ptn m.rm ra) in
            let ts = Array.init (Array.length ps) (fun _ -> Var (newvar_l (l+1))) in
            let _ = unify [] (Types.path i ta) (Rec (ref (coprd_cl (Var (newvar_l (l+1))) (Array.to_list ts)))) in
            let _ =
              Array.fold_left
                ( fun j (r,p) ->
                    let (ti,_) = inst (l+1) (inst_ini()) (get_rm_ptn m.rm r) in
                    let _ = unify [] ti (get_agl (ts.(j)) i ta) in
                    let _ = gen_rm l m.rm in
                    let _ = slv m l p in
                    j+1 )
                0 ps in
            let tts = Array.map (fun (_,p) -> fst @@ inst (l+1) (inst_ini()) (get_rm_ptn m.rm (ret m.ir_vct p))) ps in
            let (rrt,_) = inst (l+1) (inst_ini()) (get_rm_ptn m.rm rr) in
            let _ = List.fold_left (fun y1 y2 -> unify [] y1 y2; y2) rrt (Array.to_list tts) in
            let _ = gen_rm l m.rm in
            slv m l pr
          | Ret _ -> ()
          | Seq(o,p1) ->
            let _ =
              ( match o with
                | Id (r,rs) ->
                  Timer.pnt "id 0";
                  let ts = Array.map (fun r -> fst @@ inst (l+1) (inst_ini()) (SgnMap.find r m.rm)) rs in
                  Timer.pnt "id 1";
                  let (t,_) = inst (l+1) (inst_ini()) (SgnMap.find r m.rm) in
                  Timer.pnt "id 2";
                  let _ = List.fold_left (fun y1 y2 -> unify [] y1 y2; y2) t (Array.to_list ts) in
                  Timer.pnt "id 3";
                  let _ = gen_rm l m.rm in
                  Timer.pnt "id 0";
                  ()
                | Prj(r0,(rs,rt)) ->
                  let (t0,_) = inst (l+1) (inst_ini()) (SgnMap.find r0 m.rm) in
                  let ts = Array.map (fun r -> fst @@ inst (l+1) (inst_ini()) (SgnMap.find r m.rm)) rs in
                  let (tr,_) = inst (l+1) (inst_ini()) (SgnMap.find rt m.rm) in
                  let _ = unify [] tr (Rcd (Types.Uo (ref (Types.V (l+1))))) in
                  let _ = unify [] t0 (Rcd (rcd_cns (Array.to_list ts) tr)) in
                  let _ = gen_rm l m.rm in ()
                | Cns((rs,rt),r0) ->
                  let (t0,_) = inst (l+1) (inst_ini()) (SgnMap.find r0 m.rm) in
                  let ts = Array.map (fun r -> fst @@ inst (l+1) (inst_ini()) (SgnMap.find r m.rm)) rs in
                  let (tr,_) = inst (l+1) (inst_ini()) (SgnMap.find rt m.rm) in
                  let _ = unify [] t0 (Rcd (rcd_cns (Array.to_list ts) tr)) in
                  let _ = gen_rm l m.rm in ()
                | Rm _ -> ()
                | Call(y,f,x) ->
                  let (ty,_) = inst (l+1) (inst_ini ()) (get_rm_ptn m.rm y) in
                  let (tx,_) = inst (l+1) (inst_ini ()) (get_rm_ptn m.rm x) in
                  let (tf,_) = inst (l+1) (inst_ini ()) (SgnMap.find f m.rm) in
                  let _ = unify [] tf (Imp(tx,ty)) in ()
                | Ini(r,k) ->
                  ( try
                      let (tk,_) = inst (l+1) (inst_ini ()) (get_rm_ptn m.rm (P_A r)) in
                      unify [] tk (fst @@ (inst (l+1) (inst_ini ()) (slv_tkn m k)))
                    with Not_found -> err "slv:7" )
              ) in
            Util.Timer.pnt "slv t2";
            slv m l p1
    )
  and slv_tkn m k =
    Util.pnt true ("enter slv_tkn:0"^(Tkn.print k)^"\n");
    let open Types in
    let open Tkn in
    ( match k with
      | Rcd rs -> Rcd(rcd_cl (Array.to_list (Array.map (slv_tkn m) rs)))
      | Tkn a ->
        ( match a with
          | Stg _ -> Prm Types.Stg
          | Z _ -> zn (Prm Z_u)
          | Zn(_,_) -> zn (Var (newvar()))
          | Sgn _ -> Prm Sgn
          | Pls -> let y = zn (Var (newvar())) in Imp(Rcd (rcd_cl [y;y]),y)
          | Mlt -> let y = zn (Var (newvar())) in Imp(Rcd (rcd_cl [y;y]),y)
          | Mns -> let y = zn (Var (newvar())) in Imp(y,y)
          | Cmp -> let (y0,y1) = (zn (Prm Z_u),zn (Prm (Z_n 2))) in Imp(Rcd(rcd_cl [y0;y0]),y1)
          | Eq -> let y = Var (newvar()) in Imp(Rcd(rcd_cl [y;y]),y)
          | Name n ->
            ( try slv_name m n
              with
              | Failure s ->
                Util.pnt true (s^"\n");
                let (r0,_) = etr m.ir_vct (Name n) in
                let r1 = ret m.ir_vct (Name n) in
                Imp(get_rm_ptn m.rm r0,get_rm_ptn m.rm r1)
              | _ ->
                let (r0,_) = etr m.ir_vct (Name n) in
                let r1 = ret m.ir_vct (Name n) in
                Imp(get_rm_ptn m.rm r0,get_rm_ptn m.rm r1 ))
          | _ -> Var (newvar()) ))
  and slv_name m n =
    ( match n with
      | "‹›" -> let v = Var (newvar()) in Imp(Rcd U,opn v)
      | "‹" -> let v = Var (newvar()) in Imp(v,opn v)
      | "⟦⟧" -> let v = Var (newvar()) in Imp(Rcd U,lst v)
      | "⟦" ->
        let v = Var (newvar()) in
        let y = lst v in
        Imp(Rcd (rcd_cl [v;y]),y)
      | "&" -> Imp(Rcd U,Prm Sgn)
      | "read" -> Imp(Prm Stg,Prm Stg)
      | "pnt" -> Imp(Var (newvar()),Rcd U)
      | "⊵" ->
        let t_b = Var (newvar ()) in
        let t_k = Var (newvar ()) in
        let t_o = opn t_k in
        let t_v = App(App(Prm Vct,t_o),t_b) in
        let t_s = Rcd(rcd_cl [Rcd(rcd_cl [t_v;t_b]);t_o]) in
        Imp(t_s,t_s)
      | "#" ->
        let t_b = Var (newvar ()) in
        let t_k = Var (newvar ()) in
        let t_o = opn t_k in
        let t_v = App(App(Prm Vct,t_o),t_b) in
        Imp(Rcd U,t_v)
      | _ ->
        ( try
            Util.pnt true "slv_name:0\n";
            let y = StgMap.find n m.ns_t in
            Util.pnt true "slv_name:1\n";
            let y0 = Imp(Prm Stg,Rcd(rcd_cl[(opn y);(Prm Stg)])) in
            Util.pnt true "slv_name:2\n";
            y0
          with Failure s -> err ("slv_name:e0"^s) )
    )
  and slv_grm gs yl n =
    ( try
        let y = List.assoc n !yl in
        Rec y
      with Not_found ->
        let (_,(n,_,rs)) =
          ( try
              BatList.find_map
                (fun g -> try Some (find_grm g n) with _ -> None) gs
            with _ -> err ("slv_grm:0:"^n))
        in
        let y = ref Rec_WC in
        yl := (n,y)::!yl;
        let y0 = coprd_cl (Prm (Name n)) (List.map (fun (r,_) -> slv_rule gs yl r) rs) in
        y := y0;
        Rec y )
  and find_grm g n =
    BatList.find_map
      (fun (n0,v,rs) -> if n=n0 then Some(g,(n0,v,rs)) else None)
      g
  and slv_rule gs yl (_,ps,_) = Rcd (slv_ps gs yl ps)
  and slv_ps gs yl ps =
    ( match ps with
      | [] -> U
      | hd::tl -> Cns(slv_pattern gs yl hd,slv_ps gs yl tl))
  and slv_pattern gs yl p =
    let open Peg in
    ( match p with
      | List a -> lst (slv_pattern_atm gs yl a)
      | Option a -> opn (slv_pattern_atm gs yl a)
      | Atm a -> slv_pattern_atm gs yl a )
  and slv_pattern_atm gs yl a =
    ( match a with
      | Peg.Text _ -> Rcd U
      | Peg.Name n -> slv_grm gs yl n
      | Peg.Var _ -> err "slv_pattern_atm:0"
      | Peg.Any -> Prm Stg )
  let slv_ns_t m0 =
    let ns0 = StgMap.empty in
    let ns0 = StgMap.add "‹›" (opn (Var (newvar_q (-1)))) ns0 in
    let ns0 = StgMap.add "⟦⟧" (lst (Var (newvar_q (-1)))) ns0 in
    let rec slv_grms ns0 yl (gs:Peg.grammar list) =
      Util.pnt true "enter slv_grms:\n";
      ( match gs with
        | [] -> ns0
        | g::tl ->
          let (ns0,yl) =
            List.fold_left
              (fun (ns0,yl) (n,_,_) ->
                 let y = ref Rec_WC in
                 (StgMap.add n (Rec y) ns0,(n,y)::yl))
              (ns0,yl) g in
          let _ =
            List.fold_left
              (fun _ (n,_,rs) ->
                 let y = coprd_cl (Prm (Name n)) (List.map (fun (r,_) -> slv_rule [g] (ref yl) r) rs) in
                 let v = List.assoc n yl in
                 v := y
              ) () g in
          slv_grms ns0 yl tl
      ) in
    let ns0 = slv_grms ns0 [] m0.grm in
    { m0 with ns_t = ns0 }
end
let rec init_rm rm iv =
  let open IR in
  let open Rcd_Ptn in
  PtMap.fold
    (fun _ e rm ->
       (* Util.pnt true ("enter init_rm:"^(print_op iv p)^"\n"); *)
       ( match e with
         | Etr (r,_) -> init_rm_r rm r
         | Clj(r,_,_,_) -> init_rm_r rm (P_A r)
         | Prd (r,_,_,_) -> init_rm_r rm (P_A r)
         | Agl (_,_,ps,(r1,_)) -> init_rm_r (Array.fold_left (fun rm (r,_) -> init_rm_r rm r) rm ps) r1
         | Seq(n,_) ->
           ( match n with
             | Id(_,rs) -> Array.fold_left (fun rm r -> init_rm_r rm (P_A r)) rm rs
             | Cns(_,r) -> init_rm_r rm (P_A r)
             | Call(y,_,_) -> init_rm_r rm y
             | Ini(r,_) -> init_rm_r rm (P_A r)
             | Prj(_,(rs,rt)) -> init_rm_r (Array.fold_left (fun rm r -> init_rm_r rm (P_A r)) rm rs) (P_A rt)
             | Rm _ -> rm )
         | Ret _ -> rm
       ))
    iv rm
and init_rm_r (rm:Types.t SgnMap.t) r =
  List.fold_left
    (fun rm r -> try (let _ = SgnMap.find r rm in rm) with _ -> SgnMap.add r (Types.Var (Types.newvar ())) rm)
    rm (Rcd_Ptn.to_list r)
let rec filter_mdl g =
  ( match g with
    | [] -> ([],[],[])
    | hd::tl ->
      let (lf,lg,el) = filter_mdl tl in
      let open Ast in
      ( match hd with
        | Flow f -> ([f]::lf,lg,el)
        | Etr(n,_,_,c) -> (lf,lg,(`Etr(n,c))::el)
        | Etr_Clq q -> (lf,lg,(`Clq(List.map (fun (n,_,_,c) -> (n,c)) q))::el)
        | Flow_Clq q -> (q::lf,lg,el)
        | Gram g -> (lf,g::lg,el) ))
let mk_ir_vct el =
  let open IR in
  let open Rcd_Ptn in
  BatList.fold_left
    (fun ev e ->
       ( match e with
         | `Etr(n,f) ->
           let p0 = DName (sgn ()) in
           let r0 = Rcd_Ptn.P_A (sgn ()) in
           let ev = PtMap.add (Name n) (Etr (r0,p0)) ev in
           let (ev,_,_) = vh_of_ast ev p0 r0 f in
           ev
         | `Clq l ->
           BatList.fold_left
             (fun ev (n,f) ->
                let p0 = DName (sgn ()) in
                let r0 = P_A (sgn ()) in
                let ev = PtMap.add (Name n) (Etr (r0,p0)) ev in
                let (ev,_,_) = vh_of_ast ev p0 r0 f in
                ev )
             ev l
         | _ -> err "err10"))
    PtMap.empty el
let rec slv_mdl m (el:_ list) : unit =
  let open IR in
  ( match el with
    | [] -> ()
    | (`Etr(n,_))::tl ->
      let _ = Typing.slv m 0 (Name n) in
      let _ = Typing.gen_rm (-1) m.rm in
      slv_mdl m tl
    | (`Clq q)::tl ->
      let ql =
        List.fold_left
          (fun ql (n,_) ->
             let ((r0,p0),r1) = try (IR.etr m.ir_vct (Name n),IR.ret m.ir_vct (Name n)) with _ -> err "slv_mdl:0" in
             let _ = Typing.inst 0 (Typing.inst_ini ()) (IR.get_rm_ptn m.rm r0) in
             let _ = Typing.inst 0 (Typing.inst_ini ()) (IR.get_rm_ptn m.rm r1) in
             ql@[p0])
          [] q in
      let _ = List.map (fun x -> Typing.slv m 0 x) ql in
      let _ = Typing.gen_rm (-1) m.rm in
      slv_mdl m tl )
let ir_of_ast g =
  let open IR in
  let (fl,gl,el) = filter_mdl g in
  let ir_vct = mk_ir_vct el in
  let rm = init_rm (SgnMap.empty) ir_vct in
  let m = { flow = fl; grm = gl; ir_vct = ir_vct; rm = rm; ns_t = StgMap.empty } in
  let m = Typing.slv_ns_t m in
  let _ = slv_mdl m el in
  m
