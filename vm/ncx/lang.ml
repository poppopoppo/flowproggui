open Util
type name =
  | EndN of string
  | DotN of string * name
let rec pnt_name n =
  ( match n with
    | EndN n -> n
    | DotN (m,n) -> m^"."^(pnt_name n))
let rec emt_name = function
  | EndN n -> "_"^n
  | DotN (m,n) -> m^"_"^(emt_name n)
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
  (* type prm =
     | Vct | Opn | Lst | Zn | N | Sgn | Stg | Z_u
     | Z_n of int | Axm of Sgn.t | Inj| Cho | Z_d of Sgn.t
     | Grm | EqT of string | Name of name *)
  type v_p = Sgn.t
  type ('y, 'k) v_t =
    | WC of 'k | V of 'k * level | Q of 'k * level | Ln of 'y
    | N of name | N_Ln of name * 'y
  and v = (t, unit) v_t
  and t =
    | Abs of v ref * t
    | Var of v ref | App of t * t
    | Axm of Sgn.t
    | Imp of t * t | Rcd of t_rcd
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
  module Axm = struct
    let nat = sgn ()
    let v = sgn ()
    let z_n = sgn ()
    let fd = sgn ()
    let z_u = sgn ()
    let r64 = sgn ()
    let r2 = sgn ()
    let zn = sgn ()
    let lst = sgn ()
    let opn = sgn ()
    let sgn_p = sgn ()
    let stg = sgn ()
    let out_p = sgn ()
    let exn_p = sgn ()
  end
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

  let rec print_v v_vct v =
    ( try (fst @@ BatList.findi (fun _ vi -> vi==v) !v_vct)
      with _ -> v_vct := !v_vct@[v]; print_v v_vct v)
  let rec print (rl:(t_rec ref list ref)) y =
    ( match y with
      | Axm p when p=Axm.r64 -> "_r64"
      | Axm p when p=Axm.lst -> "_lst"
      | Axm p when p=Axm.opn -> "_opn"
      | Axm p when p=Axm.sgn_p -> "_sgn"
      | Axm p when p=Axm.stg -> "_stg"
      | Axm p when p=Axm.out_p -> "_out"
      | Axm p when p=Axm.exn_p -> "_exn"
      | Axm p when p=Axm.v -> "_v"
      | Axm p when p=Axm.fd -> "_fd"
      | Axm p -> "_p"^(Sgn.print p)
      | Var v ->
        let i = print_v v_vct v in
        ( match !v with
          | WC _-> "_"
          | V (_,l) -> "v"^(string_of_int i)^"''("^(string_of_int l)^")"
          | Q (_,l) -> "t"^(string_of_int i)^"'("^(string_of_int l)^")"
          | Ln y -> print rl y
          | N n -> pnt_name n
          | N_Ln (n,y) -> (pnt_name n)^"(="^(print rl y)^")" )
      | App(y0,y1) -> "("^(print rl y0)^")◂("^(print rl y1)^")"
      | Imp(y0,y1) -> (print rl y0)^"→"^(print rl y1)
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
  and print_t y = print (ref []) y
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
          | Q (nr,l) -> "< l"^(string_of_int (print_v v_rcd_lb_vct v))^"'("^(string_of_int l)^")::"^(print_nr nr)
          | N n -> pnt_name n
          | N_Ln (n,y) -> (pnt_name n)^"(="^(print_rcd_lb rl y)^")" )
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
  let unt () = Rcd U
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
  let zn _ = Axm Axm.z_n
  let opn v = App(Axm Axm.opn,v)
  let lst v = App(Axm Axm.lst,v)

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
let lb () = "LB_"^(Sgn.print (sgn ()))
module Mtc = struct
  type v = Types.v ref
  type ptn = (v Rcd_Ptn.t) * (v * eq) list
  and ptn_eq = (v Rcd_Ptn.t)
  and eq =
    | Eq_Agl of int * ptn_eq
    | Eq_Agl_N of name * ptn_eq
    | P_Cst of cst
  and cst =
    | P_N of name
    | P_Z of int
    | P_R64 of int64
    | P_R2 of bool
    | P_Stg of string
  and p_sig = string
  and vl =
    | Any of v
    | Agl of v * int * vl_ptn
  and vl_ptn = vl Rcd_Ptn.t
  and set = vl_ptn list
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
      | Eq_Agl_N(n,r) -> (pnt_name n)^"◂"^(Rcd_Ptn.print print_v r)
      | P_Cst c ->
        ( match c with
          | P_N n -> pnt_name n
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
module Cst = struct
  type t =
    | S8 of string
    | R64 of int64
end
module Grm = struct
  type rle_flg = Synt | Lex
  type 'a t = ('a etr) list
  and 'a etr =
    | Cnc of string * ((string * rle_flg * rle) list)
    | Act of string * (('a * rle_flg * rle) list)
  and rle = ptn list
  and ptn =
    | Lst of atm
    | Opn of atm
    | Atm of atm
  and atm =
    | Txt of string
    | Name of name
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
  and print_etr_act (n,rs) =
    "\t@."^n^" : _ \n"^
    (List.fold_left
       (fun s (_,f,r) ->
          s^"\t"^(print_rle_flg f)^" "^(print_rle r)^"\n"^
          " ⊢ ..\n"^
          "..\n\t∎\n" )
       "" rs )
  and print_rle_flg = ( function
      | Synt -> "\t∐* "
      | Lex -> "\t∐ " )
  and print_rle r =
    List.fold_left
      (fun s p ->
         let s0 =
           match p with
           | Atm Txt x -> "\""^(String.escaped x)^"\""
           | Atm Name n -> pnt_name n
           | Lst Txt x -> "⟦\""^(String.escaped x)^"\"⟧"
           | Lst Name n -> "⟦"^(pnt_name n)^"⟧"
           | Opn Txt x -> "‹\""^(String.escaped x)^"\"›"
           | Opn Name n -> "‹"^(pnt_name n)^"›" in
         s^" "^s0 )
      "" r

  and mk_tbl l0 rs =
    ( match rs with
      | (_,_,r)::tl ->
        let l1 = mk_tbl_rle l0 r in
        mk_tbl l1 tl
      | [] -> l0
    )
  and mk_tbl_rle l0 r =
    ( match r with
      | p :: tl ->
        ( match p with
          | Lst Name n
          | Opn Name n
          | Atm Name n ->
            if List.exists (fun m -> n=m) l0 then mk_tbl_rle l0 tl
            else mk_tbl_rle (n::l0) tl
          | _ -> mk_tbl_rle l0 tl )
      | [] -> l0 )

end
module Ast = struct
  open Types
  type abs_name = name
  type name = string
  type mdl = string * (glb_etr list)
  and glb_etr =
    | Etr of string * Types.t * Types.t * etr
    | Etr_Abs of string * Types.t * Types.t
    | Etr_Eq of string * eq_def
    | Etr_Clq of (string * Types.t * Types.t * etr) list
    | Etr_Out_Abs of string * Types.t
    | Etr_Glb of string * pt
    | Flow of flow
    | Flow_Clq of flow list
    | Gram of etr Grm.t
    | Grm_Abs of string
    | Mdl of string * glb_etr list
    | Mdl_Ln of bool * string
  and flow =
    | Def_Abs of name * args
    | Def_Prd of name * args * ((Types.t * name) list)
    | Def_CoPrd of name * args * ((Types.t * name) list)
    | Def_Fnt of name * (name list)
    | Def_EqT of string * args * Types.t
  and args = (name * r) list
  and eq_def =
    | Cst of Cst.t
    | ExStg of string | EqLn of abs_name
    | SttArg of int | ExStgArg of int
  and exp_rcd =
    | Rot | Rcd of exp_rcd array
    | Rcd_Lb of (exp_rcd option) * (string * (exp_rcd option)) array
    | App of exp_rcd * exp_rcd | Prj of exp_rcd * Rcd_Ptn.idx
    | Atm of exp_atm
  and exp_atm =
    | Z of int | Zn of (int * int) | R64 of int64
    | R2 of bool
    | Name of abs_name | Stg of string
  and r = Types.v ref
  and mtc = Mtc.ptn
  and ptn = r Rcd_Ptn.t
  and pt = ir_code ref
  and etr = ptn * pt
  and ir_code =
    | Seq of nd * ir_code
    | Ret of ptn
    | Exn of r
    | Mtc of ptn * ((Mtc.ptn * ir_code) array)
    | IL_Call of r * ptn
    | IL_Glb_Call of abs_name * ptn
  and nd =
    | IR_Id of ptn * (ptn array)
    | IR_Call of (r * ptn) * ptn
    | IR_Glb_Call of abs_name * ptn * ptn
    | IR_Out of r * ptn
    | IR_Glb_Out of abs_name * ptn
    | IR_Clj of r * ptn * pt
    | IR_Exp of exp_rcd * ptn * ptn
    | IR_S8 of s8_ptn list * (r array) * (r array)
    | IR_Prd of r * (r Rcd_Ptn.t) * (pt array)
  and s8_ptn = S8_Txt of string | S8_Name of abs_name | S8_Var of int
  type line =
    | End | Line of exp_rcd | Line_Agl of Rcd_Ptn.idx * exp_rcd
  module VHash = Hashtbl.Make (struct type t = v ref let equal = (==) let hash = Hashtbl.hash end)
  type idx = int VHash.t
  type grm = etr Grm.t
  type d =
    | D_CP of args * ((Types.t * name) list)
    | D_Prm
  type ns_d = (string * d) list
  type ns = (string * Types.v ref) list ref
  type ns_t = (string * Types.v ref) list ref
  type ns_e_k = Etr_Adr | Inj of int
  type ns_e = (string * ns_e_k) list ref
  type ns_grm = (string * Types.t_rec ref) list ref
  type rm = Types.rm
  let rm:rm = Types.rm
  let ns:ns = ref []
  let ns_t:ns_t = ref []
  let ns_e:(ns_e) = ref []
  let ns_grm:ns_grm = ref []
  type ir_mdl = {
    mutable ns_v : (string * etr) list;
    mutable ns : (string * Types.v ref) list;
    mutable ns_e : (string * ns_e_k) list;
    mutable ns_t : (string * Types.v ref) list;
    mutable ns_d : ns_d;
    mutable ns_g : grm list;
    mutable ns_m : (string, ir_mdl) Hashtbl.t;
  }
  type inst = {
    al:(v ref * v ref) list;
    al_rcd:(v_rcd ref * v_rcd ref) list;
    al_rcd_lb : (v_rcd_lb ref * v_rcd_lb ref) list;
    rl : (t_rec ref * t_rec ref) list;
  }
  type e_k = Sgn.t * e_k_v
  and e_k_v =
    | Etr_V of (int * r) Rcd_Ptn.t
    | Ctr of int
    | Prs
    | Cst_Stt of Cst.t
    | Cst_Dyn
  type ns_t_k =
    | T_CP of args * ((Types.t * string) list)
    | T_V of Types.v ref
  type ns_m_k =
    | M_WC | M_Prm of string
  type ns_v =
    { mutable root : (ns_v ref) option;
      mutable ns : (string * Types.v ref) list;
      mutable ns_e : (string * e_k ref) list;
      mutable ns_t : (string * Types.v ref) list;
      mutable ns_m : (string * ns_v ref) list;
      mutable ns_m_t : (string * ns_m_k ref) list;
    }
  let init_ns () = { root=None; ns=[]; ns_e=[]; ns_t=[]; ns_m=[]; ns_m_t=[] }
  module Axm = struct
    let _emt = sgn ()
    let _fop = sgn ()
    let _frd = sgn ()
    let _fwt = sgn ()
    let _pp_v = sgn ()
    let _wt = sgn ()
    let _rd = sgn ()
    let _cd = sgn ()
    let _err = sgn ()
    let _add = sgn ()
    let _sub = sgn ()
    let _mul = sgn ()
    let _cmp = sgn ()
    let _eq = sgn ()
    let _scc = sgn ()
    let _cns = sgn ()
    let _nil = sgn ()
    let _none = sgn ()
    let _some = sgn ()
    let _sgn = sgn ()

    let _root = init_ns ()
    let _prm = init_ns ()
    let g_dgt = init_ns ()

  end
  let rec path (m:ir_mdl) l =
    ( match l with
      | [] -> m
      | hd::tl ->
        let m0 = Hashtbl.find m.ns_m hd in
        path m0 tl )
  let rec find_ir_mdl m l0 f =
    ( match l0 with
      | [] -> f m
      | _::tl ->
        let m0 = path m l0 in
        ( try f m0
          with _ -> find_ir_mdl m tl f ) )

  let rec find_ns f ns n g =
    ( match n with
      | EndN n0 ->
        ( match ( try g ns n0 with e -> pnt true (pnt_name n);raise e),f with
              | Some x,_ -> x
              | None,`Fst ->
                ( match ns.root with
                  | Some ns_r -> find_ns `Fst !ns_r n g
                  | None -> err @@ "find_ns 0:"^(pnt_name n) )
              | None,`Snd -> err "find_ns 1" )
      | DotN(m,n0) ->
        ( try
            let ns_m = List.assoc m ns.ns_m in
            find_ns `Snd !ns_m n0 g
          with _ ->
            ( match f with
              | `Fst ->
                ( match ns.root with
                  | Some ns_r -> find_ns `Fst !ns_r n g
                  | None -> err "find_ns 2" )
              | _ -> err "find_ns 3" )))
  let get_ns ns n =
    find_ns `Fst ns n (fun ns n -> try Some(List.assoc n ns.ns) with _ -> None)
  let get_ns_t ns n =
    find_ns `Fst ns n (fun ns n -> try Some(List.assoc n ns.ns_t) with _ -> None)
  let get_ns_m_t ns n =
    find_ns `Fst ns n (fun ns n -> try Some(List.assoc n ns.ns_m_t) with _ -> None)
  let get_ns_m ns n =
    find_ns `Fst ns n (fun ns n -> try Some(List.assoc n ns.ns_m) with _ -> None)
  let get_ns_e ns n =
    find_ns `Fst ns n (fun ns n -> try Some(List.assoc n ns.ns_e) with _ -> None)

  let rec find_m f ns =
    ( try
        f ns
      with _ ->
        ( match ns.root with
          | Some ns_r -> find_m f !ns_r
          | None -> err "find_ns 0" ))
  let print_v v =
    ( try let (n,_) = List.find (fun (_,w) -> v==w) !rm in n
      with _ -> "_r"^(string_of_int (Types.print_v v_vct v)))
  let rec print_mdl (n,g) =
    let s0 = "§§ "^n^"\n" in
    let rec lp g =
      ( match g with
        | [] -> "§§.\n"
        | hd::tl ->
          let s1 =
            ( match hd with
              | Mdl_Ln (_,n) -> "§ "^n^"._\n"
              | Etr(n,_,_,_) -> "§ .."^n^"\n"
              | Etr_Abs(n,_,_) -> "§ "^n^" : .. ⊢ ..\n"
              | Etr_Out_Abs(n,_) -> "§ "^n^" : .. ⊢| \n"
              | Etr_Eq(n0,_) -> "§ "^n0^" = ..\n"
              | Etr_Glb(n,_) -> "§ "^n^" « \n"^"\t..\n"
              | Flow f -> "¶ "^(print_flow f)
              | Etr_Clq _ -> "§ @. .. "^"\n"
              | Flow_Clq _ -> "¶ @. .."^"\n"
              | Gram _ -> "¶¶+ℙ .."^"\n"
              | Grm_Abs n -> "¶¶+ℙ "^n^"\n"
              | Mdl (n,m) -> print_mdl (n,m)           ) in
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
    | Mtc(r,ps) -> "\t\\\\ "^(pnt_ptn r)^"\n"^(print_ir_mtc ps)
    | IL_Glb_Call(n,r) -> "\t"^(pnt_name n)^"\t"^(pnt_ptn r)^" ⊢|\n"
    | IL_Call(f,x) -> "\t"^(print_reg f)^","^(pnt_ptn x)^" ⊢|\n"
  )
and print_line p0 =
  ( match p0 with
    | Seq (o,_) -> (print_nd o)^"\n"
    | Ret r -> "∎ "^(pnt_ptn r)^"\n"
    | Exn r -> "∎| "^(print_reg r)^"\n"
    | Mtc(r,_) -> "\t\\\\ "^(pnt_ptn r)^"\n"
    | IL_Call(f,x) -> "◂ "^(print_reg f)^","^(pnt_ptn x)^" ⊢|\n"
    | IL_Glb_Call(n,r) -> (pnt_name n)^"\t"^(pnt_ptn r)^" ⊢|\n" )
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
    | IR_S8 (pl,rs0,rs1) ->
      let pnt_s8_ptn p =
        ( match p with
          | S8_Txt s -> "\""^s^"\""
          | S8_Name n -> pnt_name n
          | S8_Var i -> (string_of_int i)^"\'" ) in
      "» _^ "^(Arr.fld_l (fun s r -> s^","^(print_reg r)) "" rs0)^" ⊢ "^(Arr.fld_l (fun s r -> s^","^(print_reg r)) "" rs1)^"\n"^
      "\t"^(List.fold_left (fun s p -> s^" "^(pnt_s8_ptn p)) "" pl)^" //\n"
    | IR_Clj (_,_,_) -> "||»"
    | IR_Prd (_,_,_) -> "∆ "
    | IR_Id(r,rs) -> "$ "^(pnt_ptn r)^" ⊢ "^(Arr.fld_l (fun s r -> s^","^(pnt_ptn r)) "" rs)^rtl^(Arr.fld_l (fun s r -> s^","^(print_ty r)) "" rs)
    | IR_Out(_,_) -> "|◂"
    | IR_Glb_Out(n,_) -> (pnt_name n)^" |⊢"
    | IR_Glb_Call(n,x,y) -> (pnt_name n)^" "^(pnt_ptn x)^" ⊢ "^(pnt_ptn y)^rtl^(print_ty y)
    | IR_Call((f,x),y) -> "◂ "^(print_reg f)^" , "^(pnt_ptn x)^" ⊢ "^(pnt_ptn y)^rtl^(print_ty y)
    | IR_Exp(e,r0,r1) -> "» "^(print_exp e)^" |~ "^(pnt_ptn r0)^" ⊢ "^(pnt_ptn r1)^rtl^(print_ty r1)
  )
and print_exp e =
  ( match e with
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
        | Name s -> pnt_name s
        | Stg s -> "\""^(String.escaped s)^"\"" ))
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

let print (m:ir_mdl) =
  let s_ns =
    List.fold_left
      (fun s_ns (n,v) -> s_ns^"§ "^n^" : "^(Types.print (ref []) (Types.Var v))^"\n")
      "" m.ns in
  let s_ns_e =
    List.fold_left
      (fun s_ns_e (n,k) ->
         ( match k with
           | Etr_Adr -> s_ns_e^"§ "^n^"= _ \n"
           | Inj i -> s_ns_e^"§ "^n^"= "^(string_of_int i)^"\'\n" ))
      "" m.ns_e in
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
        | Q _ -> err "occurs:0"
        | N_Ln (_,t1) -> occurs rl v1 t1
        | _ -> err "occurs n0" )
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
        | Q _ -> err "occurs:0"
        | N_Ln (_,t1) -> rcd_occurs v1 t1
        | N _ -> err "occurs n2" )
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
        | Q _ -> err "occurs:0"
        | N_Ln (_,t1) -> occurs_rcd_lb rl v1 t1
        | N _ -> err "occurs n3" )
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
          | N_Ln (_,t3) -> unify ru t2 t3
          | N _ -> err "unify n0"
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
      | Axm p1,Axm p2 -> if p1=p2 then () else err ("unify:1:"^se)
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
        | Ln y1 -> gen rl l y1
        | N_Ln (_,y1) -> gen rl l y1
        | N _ -> err "gen n0"      )
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
        | Ln y1 -> gen_rcd rl l y1
        | N_Ln (_,y1) -> gen_rcd rl l y1
        | N _ -> err "gen_rcd n0"      )
    | Cns(t0,t1) -> gen rl l t0; gen_rcd rl l t1 )
and gen_rcd_lb rl l r =
  ( match r with
    | U_Lb -> ()
    | Uo_Lb v ->
      ( match !v with
        | V (k,l0) -> if l<l0 then v := (Q (k,l))
        | WC _ -> ()
        | Q _ -> ()
        | Ln y1 -> gen_rcd_lb rl l y1
        | N_Ln (_,y1) -> gen_rcd_lb rl l y1
        | N _ -> err "gen_rcd_lb n0"      )
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
and inst_mtc_atm (ns:ns_v) l e =
  let open Types in
  let open Mtc in
  ( match e with
    | Eq_Agl(_,_) -> err "inst_mtc_atm 0"
    | Eq_Agl_N(n,r) ->
      let yn = inst l (Var (try find_ns `Fst ns n (fun ns n -> try Some(List.assoc n ns.ns) with _ -> None)  with _ -> err "inst_mtc_atm 3")) in
      let yr = inst_ptn l r in
      let v0 = newvar_l l in
      let _ = unify [] (Imp(yr,Var v0)) yn in
      (Var v0)
    | P_Cst c ->
      ( match c with
        | P_Z _ -> App(Axm Axm.z_n,(Axm Axm.z_u))
        | P_R64 _ -> Axm Axm.r64
        | P_N _ -> err "inst_mtc_atm 1"
        | P_R2 _ -> Axm Axm.r2
        | P_Stg _ -> Axm Axm.stg ))
and slv (ns:ns_v) l p0 =
  Util.pnt true ("enter slv:"^(print_line p0)^"\n");
  let open Rcd_Ptn in
  ( match p0 with
    | Ret r ->
      let y = inst_ptn (l+1) r in
      let _ = gen (ref []) l y in
      y
    | Exn r ->
      let y = inst (l+1) (Var r) in
      let _ = unify []  (Axm Axm.exn_p) y in
      let _ = gen (ref []) l y in
      Var (newvar_q l)
    | IL_Glb_Call(e,r) ->
      let ye = inst (l+1) (slv_exp_atm ns (Atm (Name e))) in
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
    | Mtc(ra,pns) ->
      let ta = inst_ptn (l+1) ra in
      let _ =
        Array.fold_left
          ( fun _ (e,_) ->
              let ti = inst_mtc_ptn ns (l+1) e in
              let _ = unify [] ti ta in
              () )
          () pns in
      let _ = gen (ref []) l ta in
      let (_,ys) =
        Array.fold_left
          ( fun (j,ys) (_,p) ->
              let y1 = slv ns l p in
              (j+1,ys |+| [|y1|]) )
          (0,[||]) pns in
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
          | IR_S8(pl,rs0,rs1) ->
            let rec mn pl =
              ( match pl with
                | (S8_Var i)::tl -> max i (mn tl)
                | _::tl -> mn tl
                | [] -> (-1) ) in
            let mn = mn pl in
            if mn>=(Array.length rs0) then err "emt_ir IR_S8 0"
            else
              let ts0 = Array.map (fun r -> inst (l+1) (Var r)) rs0 in
              let ts1 = Array.map (fun r -> inst (l+1) (Var r)) rs1 in
              let _ = Array.map (fun t -> unify [] t (Axm Axm.stg)) ts0 in
              let _ = Array.map (fun t -> unify [] t (Axm Axm.stg)) ts1 in
              ()
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
            let tf = inst (l+1) (Var( try get_ns ns n with _ -> err "slv_exp_atm 6")) in
            let tx = inst_ptn (l+1) x in
            let ty = inst_ptn (l+1) y in
            unify [] tf (Imp(tx,ty));
            gen (ref []) l ty
          | IR_Out (_,_) -> err "slv x1"
          | IR_Glb_Out (o,x) ->
            let tx = inst_ptn (l+1) x in
            let yo = get_ns ns o in
            let _ = unify [] (inst (l+1) (Var yo)) (App(Axm Axm.out_p,tx)) in
            gen (ref []) l tx
          | IR_Exp(a,_,r1) ->
            let tk = inst_ptn (l+1) r1 in
            let _ = unify [] tk (inst (l+1) (slv_exp_atm ns a)) in
            gen (ref []) l tk
        ) in
      (*  Util.Timer.pnt "slv t2"; *)
      slv ns l p1
  )
and slv_exp_atm (ns:ns_v) a =
  let open Types in
  ( match a with
    | Atm a ->
      ( match a with
        | R64 _ -> Axm Axm.r64
        | Stg _ -> Axm Axm.stg
        | R2 _ -> Axm Axm.r2 (* Prm(Types.Name "r2") *)
        | Z _ -> App(Axm Axm.z_n,Axm Axm.z_u)
        | Zn(_,_) -> zn (Var (newvar()))
        | Name n ->
          ( try Var(get_ns ns n)
            with _ -> err ("slv_exp_atm 3:") ))
    | _ -> err "slv_exp_atm 1" )

let rec mk_vars rl (ns:ns_v) f l y =
  let open Types in
  ( match y with
    | Axm p -> Axm p
    | Var { contents = N_Ln(EndN n,Axm v) } when v=Axm.v ->
      ( try
          let v = List.assoc n !l in
          Var v
        with _ ->
          if f=`Abs then err "mk_vars 0"
          else
            let v = newvar_q (-1) in
            l := (n,v)::!l;
            Var v )
    | Var { contents = N n } ->
      let v =  get_ns_t ns n in
      mk_vars rl ns f l (Var v)
    | Abs(v,y0) -> Abs(v,mk_vars rl ns f l y0)
    | Var v -> Var v
    | App(y0,y1) -> App(mk_vars rl ns f l y0,mk_vars rl ns f l y1)
    | Imp(y0,y1) -> Imp(mk_vars rl  ns f l y0,mk_vars rl ns f l y1)
    | Rcd r -> Rcd(mk_vars_rcd rl ns f l r)
    | Rcd_Lb r -> Rcd_Lb(mk_vars_rcd_lb rl ns f l r)
    | Rec r ->
      if List.exists (fun x -> x==r) !rl then (Rec r)
      else
        let _ = rl := r::!rl in
        Rec(mk_vars_rec rl ns f l r))
and mk_vars_rcd rl ns f l r =
  let open Types in
  ( match r with
    | Cns(y0,r0) -> Cns(mk_vars rl ns f l y0,mk_vars_rcd rl ns f l r0)
    | Uo { contents = Ln r0 } -> Uo { contents = Ln (mk_vars_rcd rl ns f l r0) }
    | Uo v -> Uo v
    | U -> U )
and mk_vars_rcd_lb rl ns f l r =
  let open Types in
  ( match r with
    | Cns_Lb(lb,y0,r0) -> Cns_Lb(lb,mk_vars rl ns f l y0,mk_vars_rcd_lb rl ns f l r0)
    | Uo_Lb { contents = Ln r0 } -> Uo_Lb { contents = Ln (mk_vars_rcd_lb rl ns f l r0) }
    | Uo_Lb v -> Uo_Lb v
    | U_Lb -> U_Lb )
and mk_vars_rec rl ns f l r =
  let open Types in
  ( match !r with
    | CP(y0,r0) -> r := CP(mk_vars rl ns f l y0,mk_vars_rcd rl ns f l r0); r
    | P(y0,y1,r0) -> r := P(mk_vars rl ns f l y0,mk_vars rl ns f l y1,mk_vars_rcd rl ns f l r0); r
    | Rec_WC -> r )
let rec mk_var_grm ns r =
  let (_,ys) =
    List.fold_left
      ( fun (i,ys) p ->
          let y =
            ( match p with
              | Grm.Lst a -> App(Axm Axm.lst,mk_var_grm_atm ns a)
              | Grm.Opn a -> App(Axm Axm.opn,mk_var_grm_atm ns a)
              | Grm.Atm a -> mk_var_grm_atm ns a ) in
          (i+1,ys@[y])) (0,[]) r in
  Rcd(Types.rcd_cl ys)
and mk_var_grm_atm ns a =
  ( match a with
    | Grm.Txt _ -> Types.Rcd(Types.rcd_cl [])
    | Grm.Name n ->
      let mf = get_ns_m_t ns n in
      let ma = get_ns_m ns n in
      ( match !mf with
        | M_Prm "grm" -> Var(try List.assoc "t" !ma.ns_t with _ -> err ("mk_var_grm_atm 3:"^(pnt_name n)) )
        | _ -> err "mk_var_grm_atm 0" ) )
let rec idx_crt_ptn s r = Rcd_Ptn.map (fun v -> idx_crt s v) r
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

let init_ir_mdl () =
  { ns_v =[]; ns = []; ns_e = []; ns_t = []; ns_d = []; ns_g=[]; ns_m=Hashtbl.create 10 }

let rec ir_of_exp r0 r1 e =
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
        | IR_S8 (pl,rs0,rs1) ->
          let rs0 = Array.map (fun r -> csm_rv r rv) rs0 in
          let _ = Array.map (fun r -> crt_rv r rv) rs1 in
          let p1 = mk_ir rv p1 in
          Seq(IR_S8(pl,rs0,rs1),p1)
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
let emt_flg = true
let cmt s = if emt_flg then "; "^s^"\n" else ""
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
let mov_regs s =
  Hashtbl.fold
    ( fun i _ e ->
        if i<9
        then
          e^
          "\tmov QWORD [regs_vct+8*"^(string_of_int i)^"],"^(emt_reg_x86 i)^"\n"
        else
          e )
    s ""
let set_regs s =
  Hashtbl.fold
    (fun i _ e ->
       if i<9 then
         e^
         "\tmov "^(emt_reg_x86 i)^",QWORD [regs_vct+8*"^(string_of_int i)^"]\n"
       else
         e )
    s ""
let pop_reg q =
  List.fold_left
    (fun e r -> e^"\tpop QWORD "^r^"\n" )
    ";pop_reg\n" q
let cst_stg = ref []

let rec pnt_args f l =
  ( match f,l with
    | `Hd,hd::tl -> " ◂ "^hd^"\'"^(pnt_args `Tl tl)
    | `Tl,hd::tl -> ","^hd^"\'"^(pnt_args `Tl tl)
    | _,[] -> "" )
let rec pnt_vs f l =
  ( match f,l with
    | `Hd,hd::tl -> " ◂ "^(Types.print_t (Var hd))^(pnt_vs `Tl tl)
    | `Tl,hd::tl -> ","^(Types.print_t (Var hd))^(pnt_vs `Tl tl)
    | _,[] -> "" )
let pnt_vs = pnt_vs `Hd
let rec emt_tbl tb =
  let gn = List.length tb in
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
  "\tmov rcx,rsi\n"

and emt_prs ns ep rs =
  pnt true "grm 1\n";
  let tb =
    ( match rs with
      | `P rs -> Grm.mk_tbl [] rs
      | `V rs -> Grm.mk_tbl [] rs ) in
  let e0 = emt_tbl tb in
  let l_e = "NS_E_"^(Sgn.print ep) in
  let l_e_rdi = "NS_E_RDI_"^(Sgn.print ep) in
  let lb0 = "LB_"^(Sgn.print (sgn ())) in
  l_e^":\n"^
  l_e_rdi^":\n"^
  "\tmov rdi,r8\n"^
  "\tmov rsi,r9\n"^
  e0^
  "\tpush QWORD 0\n"^
  "\tjmp "^l_e^"_TBL\n"^
  l_e^"_ETR_TBL:\n"^
  "\tpush QWORD 1\n"^
  l_e^"_TBL:\n"^
  (emt_rle ns ep rs)^
  l_e^"_succeed:\n"^
  "\tpop rbx\n"^
  "\tcmp rbx,0\n"^
  "\tjnz "^l_e^"_succeed_tbl\n"^
  "\tpush rsi\n"^
  "\tpush rdi\n"^
  "\tpush r10\n"^
  "\tpush r11\n"^
  "\tmov rdi,rdx\n"^
  "\tmov rax,0\n"^
  "\tcall free\n"^
  "\tmov rdi,3\n"^
  "\tcall mlc\n"^
  "\tpop r11\n"^
  "\tpop r8\n"^
  "\tmov rsi,[rax]\n"^
  "\tbtr rsi,0\n"^
  "\tbt r11,0\n"^
  "\tjc "^lb0^"\n"^
  "\tbtr rsi,2\n"^
  lb0^":\n"^
  "\tmov [rax],rsi\n"^
  "\tmov QWORD [rax+8*3],r8\n"^
  "\tpop rdi\n"^
  "\tpop rsi\n"^
  "\tmov QWORD [rax+8*1],rdi\n"^
  "\tmov QWORD [rax+8*2],rsi\n"^
  "\tclc\n"^
  "\tret\n"^
  l_e^"_succeed_tbl:\n"^
  "\tret\n"^
  l_e^"_failed:\n"^
  "\tpop rbx\n"^
  "\tcmp rbx,0\n"^
  "\tjnz "^l_e^"_failed_tbl\n"^
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
  l_e^"_failed_tbl:\n"^
  "\tmov rax,0\n"^
  "\tret\n"
and prs_dec_i i =
  let lb0 = "LB_"^(Sgn.print (sgn ())) in
  if i<0 then ""
  else
    "\tmov rsi,QWORD [prs_vct+16*"^(string_of_int i)^"]\n"^
    "\tbt rsi,0\n"^
    "\tjc "^lb0^"\n"^
    "\tmov rdi,QWORD [prs_vct+16*"^(string_of_int i)^"+8*1]\n"^
    "\tcall dec_r\n"^
    lb0^":\n"^
    (prs_dec_i (i-1))
and prs_set_i i =
  let lb0 = "LB_"^(Sgn.print (sgn ())) in
  if i<0 then ""
  else
    "\tmov rsi,QWORD [prs_vct+16*"^(string_of_int i)^"]\n"^
    "\tbt rsi,0\n"^
    "\tjc "^lb0^"\n"^
    "\tbtr QWORD [rdi],"^(string_of_int i)^"\n"^
    lb0^":\n"^
    "\tmov rbx,QWORD [prs_vct+16*"^(string_of_int i)^"+8*1]\n"^
    "\tmov [rdi+8*1+8*"^(string_of_int i)^"],rbx\n"^
    (prs_set_i (i-1))
and emt_rle ns ep l =
  ( match l with
    | `P l ->
      let rec lp i l =
        ( match l with
          | (_,f,r)::tl ->
            let rn = List.length r in
            (*"_"^mn^"_"^n^":\n"^ *)
            "\tpush rsi\n"^
            (emt_ptn i ns ep f r 0)^
            "NS_E_"^(Sgn.print ep)^"_MTC_"^(string_of_int i)^"_succeed:\n"^
            "\tpop r8\n"^
            "\tpush rdi\n"^
            "\tpush rdx\n"^
            "\tmov rdi,"^(string_of_int rn)^"\n"^
            "\tcall mlc\n"^
            "\tmov rdi,rax\n"^
            (prs_set_i (rn-1))^
            "\tpush rdi\n"^
            "\tmov rdi,2\n"^
            "\tcall mlc\n"^
            "\tbtr QWORD [rax],1\n"^
            "\tmov r10,rax\n"^
            "\tpop rax\n"^
            "\tmov QWORD [r10+8*1],"^(string_of_int i)^"\n"^
            "\tmov QWORD [r10+8*2],rax\n"^
            "\tmov r11,0\n"^
            "\tpop rdx\n"^
            "\tpop rdi\n"^
            "\tjmp NS_E_"^(Sgn.print ep)^"_succeed\n"^
            "NS_E_"^(Sgn.print ep)^"_MTC_"^(string_of_int i)^"_failed:\n"^
            "\tpop rsi\n"^
            (lp (i+1) tl)
          | [] ->
            "\tjmp NS_E_"^(Sgn.print ep)^"_failed\n" ) in
      lp 0 l
    | `V l ->
      let rec lp i l =
        ( match l with
          | (_,f,r)::tl ->
            (*"_"^mn^"_"^n^":\n"^ *)
            "\tpush rsi\n"^
            (emt_ptn i ns ep f r 0)^
            "NS_E_"^(Sgn.print ep)^"_MTC_"^(string_of_int i)^"_succeed:\n"^
            "\tpop r8\n"^
            "\tjmp NS_E_"^(Sgn.print ep)^"_succeed\n"^
            "NS_E_"^(Sgn.print ep)^"_MTC_"^(string_of_int i)^"_failed:\n"^
            "\tpop rsi\n"^
            (lp (i+1) tl)
          | [] ->
            "\tjmp NS_E_"^(Sgn.print ep)^"_failed\n" ) in
      lp 0 l )
and emt_ptn i ns ep f r j =
  ( match r with
    | p::tl ->
      let l0 = "_grm_ptn_"^(Sgn.print (sgn ())) in
      let l1 = "_grm_ptn_"^(Sgn.print (sgn ())) in
      let es =
        if f=Grm.Lex then ""
        else
          "\tjmp "^l1^"\n"^
          l0^":\n"^
          "\tadd rsi,1\n"^
          l1^":\n"^
          "\tmov r11b,[rdi+rsi+8*1]\n"^
          "\tcmp r11,9\n"^
          "\tjz "^l0^"\n"^
          "\tcmp r11,10\n"^
          "\tjz "^l0^"\n"^
          "\tcmp r11,32\n"^
          "\tjz "^l0^"\n" in
      let e_p =
        ( match p with
          | Grm.Atm a ->
            pnt true "grm 1\n";
            let lb0 = "LB_"^(Sgn.print (sgn ())) in
            ( match a with
              | Grm.Txt s ->
                let bs = Bytes.of_string s in
                let lbs = Bytes.length bs in
                let rec e_lp0 ib =
                  if ib<lbs
                  then
                    "\tmov r11,0\n"^
                    "\tmov r11b,BYTE [rdi+rsi+8*1+"^(string_of_int ib)^"]\n"^
                    "\tcmp r11b,"^(string_of_int (Char.code bs.[ib]))^"\n"^
                    "\tjz "^lb0^"\n"^
                    "\tpush rdi\n"^
                    "\tpush rdx\n"^
                    (prs_dec_i (j-1))^
                    "\tpop rdx\n"^
                    "\tpop rdi\n"^
                    "\tjmp NS_E_"^(Sgn.print ep)^"_MTC_"^(string_of_int i)^"_failed\n"^
                    lb0^":\n"^
                    (e_lp0 (ib+1))
                  else "" in
                "; \""^(String.escaped s)^"\"\n"^
                es^
                (e_lp0 0)^
                "\tadd rsi,"^(string_of_int lbs)^"\n"^
                "\tmov rbx,0x0001_0000_0000_0000\n"^
                "\tadd QWORD [unt],rbx\n"^
                "\tmov QWORD [prs_vct+16*"^(string_of_int j)^"],0\n"^
                "\tmov QWORD [prs_vct+8*1+16*"^(string_of_int j)^"],unt\n"
              | Grm.Name f ->
                let mf = get_ns_m_t ns f in
                let mp = get_ns_m ns f in
                ( match !mf with
                  | M_Prm "grm" ->
                    let ma = List.assoc "prs" !mp.ns_e in
                    let (epf,_) = !ma in
                    "; "^(pnt_name f)^"\n"^
                    es^
                    "\tcall NS_E_"^(Sgn.print epf)^"_ETR_TBL\n"^
                    "\tcmp rax,0\n"^
                    "\tjnz "^lb0^"\n"^
                    "\tpush rdi\n"^
                    "\tpush rdx\n"^
                    (prs_dec_i (j-1))^
                    "\tpop rdx\n"^
                    "\tpop rdi\n"^
                    "\tjmp NS_E_"^(Sgn.print ep)^"_MTC_"^(string_of_int i)^"_failed\n"^
                    lb0^":\n"^
                    "\tmov QWORD [prs_vct+16*"^(string_of_int j)^"],r11\n"^
                    "\tmov QWORD [prs_vct+8*1+16*"^(string_of_int j)^"],r10\n"
                  | _ -> err "emt_ptn 1" )
            )
          | Grm.Lst a ->
            let l0 = "_grm_lst_"^(Sgn.print (sgn ())) in
            let l1 = "_grm_lst_"^(Sgn.print (sgn ())) in
            ( match a with
              | Grm.Txt s ->
                let bs = Bytes.of_string s in
                let lbs = Bytes.length bs in
                let rec e_lp0 ib =
                  if ib<lbs
                  then
                    "\tmov r11b,[rdi+rsi+8*1+"^(string_of_int ib)^"]\n"^
                    "\tcmp r11,"^(string_of_int (Char.code bs.[ib]))^"\n"^
                    "\tjnz "^l1^"\n"^
                    (e_lp0 (ib+1))
                  else "" in
                l0^":\n"^
                es^
                (e_lp0 0)^
                "\tadd rsi,"^(string_of_int lbs)^"\n"^
                "\tjmp "^l0^"\n"^
                l1^":\n"
              | Grm.Name f ->
                let mf = get_ns_m_t ns f in
                let mp = get_ns_m ns f in
                ( match !mf with
                  | M_Prm "grm" ->
                    let ma = List.assoc "prs" !mp.ns_e in
                    let (epf,_) = !ma in
                    l0^":\n"^
                    es^
                    "\tcall NS_E_"^(Sgn.print epf)^"_ETR_TBL\n"^
                    "\tcmp rax,0\n"^
                    "\tjz "^l1^"\n"^
                    "\tjmp "^l0^"\n"^
                    l1^":\n"^
                    "\tmov rax,1\n"
                  | _ -> err "emt_ptn 5" )
            )
          | Grm.Opn a ->
            let l0 = "_grm_lst_"^(Sgn.print (sgn ())) in
            let l1 = "_grm_lst_"^(Sgn.print (sgn ())) in
            ( match a with
              | Grm.Txt s ->
                let bs = Bytes.of_string s in
                let lbs = Bytes.length bs in
                let rec e_lp0 ib =
                  if ib<lbs
                  then
                    "\tmov r11b,[rdi+rsi+8*1+"^(string_of_int ib)^"]\n"^
                    "\tcmp r11,"^(string_of_int (Char.code bs.[ib]))^"\n"^
                    "\tjnz "^l1^"\n"^
                    (e_lp0 (i+1))
                  else "" in
                l0^":\n"^
                es^
                (e_lp0 0)^
                "\tadd rsi,"^(string_of_int lbs)^"\n"^
                l1^":\n"
              | Grm.Name f ->
                let mf = get_ns_m_t ns f in
                let mp = get_ns_m ns f in
                ( match !mf with
                  | M_Prm "grm" ->
                    let ma = List.assoc "prs" !mp.ns_e in
                    let (epf,_ ) = !ma in
                    l0^":\n"^
                    es^
                    "\tcall NS_E_"^(Sgn.print epf)^"_ETR_TBL\n"^
                    l1^":\n"^
                    "\tmov rax,1\n"
                  | _ -> err "emt_ptn 5" )
            ) ) in
      e_p^(emt_ptn i ns ep f tl (j+1))
    | [] ->
      "" )
let rec emt_m (ns:ns_v ref) ld el =
  let tbs = String.make ld '\t' in
  ( match el with
    | [] -> ("","","","")
    | e::tl ->
      let (e0,e1,e2,pp) =
        ( match e with
          | Mdl_Ln(_,n) ->
            let ns1 = get_ns_m !ns (EndN n) in
            let ns1 = !ns1 in
            !ns.ns <- ns1.ns@ !ns.ns;
            !ns.ns_e <- ns1.ns_e@ !ns.ns_e;
            !ns.ns_t <- ns1.ns_t @ !ns.ns_t;
            !ns.ns_m <- ns1.ns_m@ !ns.ns_m;
            !ns.ns_m_t <- ns1.ns_m_t@ !ns.ns_m_t;
            ("","","","§ "^n^"._")
          | Mdl(n,el0) ->
            !ns.ns_m_t <- (n,ref Ast.M_WC):: !ns.ns_m_t;
            let ns_1 = ref(init_ns ()) in
            !ns_1.root <- (Some ns);
            !ns.ns_m <- (n,ns_1)::!ns.ns_m;
            let (e0,e1,e2,pp) = emt_m ns_1 (ld+1) el0 in
            (e0,e1,e2,tbs^"§§ "^n^"\n"^pp^tbs^"§§.\n")
          | Etr(n,_,_,(r0,p0)) ->
            let (r0,p0) = mk_ir_etr (r0,p0) in
            let y0 = inst_ptn 0 r0 in
            let y1 = slv !ns 0 !p0 in
            let y = Imp(y0,y1) in
            let _ = gen (ref []) (-1) y in
            let pp =
              tbs^"§ "^n^" : "^(Types.print_t y0)^" ⊢ "^(Types.print_t y1)^"\n" in
            let s = Hashtbl.create 10 in
            let i0 = idx_crt_ptn s r0 in
            let iv0 = Rcd_Ptn.map (fun v -> (idx s v,v)) r0 in
            let ep = sgn () in
            !ns.ns_e <- (n,ref(ep,Etr_V iv0))::!ns.ns_e;
            !ns.ns <- (n,ref(Ln y))::!ns.ns;
            let c0 = cmt ("\t|» "^(emt_ptn i0)) in
            let l_0 = "emt_etr_c_"^(lb ()) in
            (*let l2 = "_"^(emt_name (l0,n)) in *)
            let l_e = "NS_E_"^(Sgn.print ep) in
            let l2 = "NS_E_RDI_"^(Sgn.print ep) in
            let (ea,w) = push_reg s x86_reg_lst in
            let e0 =
              (*(emt_name (l0,n))^":\n"^*)
              l_e^":\n"^
              c0^
              "\tjz "^l2^"\n"^
              "\tjc "^l_0^"\n"^
              "\tpush rbx\n"^
              "\tpush rdi\n"^
              "\tmov rbx,rdi\n"^
              "\tmov QWORD [set_ptn_vct+8*1],rbx\n"^
              "\tmov QWORD [set_ptn_vct],0\n"^
              (emt_set_ptn 0 s i0)^
              "\tpop rbx\n"^
              ea^
              "\tmov rdi,rbx\n"^
              "\tcall dec_r\n"^
              (pop_reg w)^
              "\tpop rbx\n"^
              "jmp "^l2^"\n"^
              l_0^":\n"^
              "\tpush rbx\n"^
              "\tmov QWORD [set_ptn_vct+8*1],rdi\n"^
              "\tmov QWORD [set_ptn_vct],1\n"^
              (emt_set_ptn 0 s i0)^
              "\tpop rbx\n"^
              l2^":\n" in
            let e_p = emt_ir ns s !p0 in
            let se =
              "\tNS_E_DYN_"^(Sgn.print ep)^":\n"^
              "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
              "\t\tdq "^l_e^"\n" in
            (se,e0^e_p,"",pp)
          | Etr_Abs(n,y0,y1) ->
            let l = ref [] in
            let ys = mk_vars (ref []) !ns `Etr l y0 in
            let yd = mk_vars (ref []) !ns `Etr l y1 in
            let v = ref(Ln(Imp(ys,yd))) in
            !ns.ns <- (n,v)::!ns.ns;
            !ns.ns_e <- (n,ref(sgn (),Etr_V(Rcd_Ptn.A (0,v))))::!ns.ns_e;
            let pp =
              tbs^"§ "^n^" : "^(Types.print_t ys)^" ⊢ "^(Types.print_t yd)^"\n" in
            ("","","",pp)
          | Etr_Eq(n0,n1) ->
            ( match n1 with
              | Cst(Cst.R64 r0) ->
                !ns.ns <- (n0,ref(Ln(Axm Axm.r64)))::!ns.ns;
                !ns.ns_e <- (n0,ref(sgn (),Cst_Stt(Cst.R64 r0)))::!ns.ns_e;
                let pp =
                  tbs^"§ "^n0^" = "^"0xr"^(Int64.format "%x" r0)^"\n" in
                ("","","",pp)
              | Cst(Cst.S8 s0) ->
                !ns.ns <- (n0,ref(Ln(Axm Axm.stg)))::!ns.ns;
                !ns.ns_e <- (n0,ref(sgn (),Cst_Stt(Cst.S8 s0)))::!ns.ns_e;
                let pp =
                  tbs^"§ "^n0^" = "^"\""^(String.escaped s0)^"\""^"\n" in
                ("","","",pp)
              | ExStg f0 ->
                let s0 = Util.load_file f0 in
                !ns.ns <- (n0,ref(Ln(Axm Axm.stg)))::!ns.ns;
                !ns.ns_e <- (n0,ref(sgn (),Cst_Stt(Cst.S8 s0)))::!ns.ns_e;
                let pp =
                  tbs^"§ "^n0^" = "^"\""^(String.escaped s0)^"\""^"\n" in
                ("","","",pp)
              | EqLn nl ->
                let v = get_ns !ns nl in
                let ep = get_ns_e !ns nl in
                !ns.ns <- (n0,v)::!ns.ns;
                !ns.ns_e <- (n0,ep)::!ns.ns_e;
                let pp =
                  tbs^"§ "^n0^" = "^(pnt_name nl)^"\n" in
                ("","","",pp)
              | SttArg i ->
                let s0 = Sys.argv.(i) in
                !ns.ns <- (n0,ref(Ln(Axm Axm.stg)))::!ns.ns;
                !ns.ns_e <- (n0,ref(sgn (),Cst_Stt(Cst.S8 s0)))::!ns.ns_e;
                let pp =
                  tbs^"§ "^n0^" = "^"\""^(String.escaped s0)^"\""^"\n" in
                ("","","",pp)
              | ExStgArg i ->
                let s0 = Util.load_file (Sys.argv.(i)) in
                !ns.ns <- (n0,ref(Ln(Axm Axm.stg)))::!ns.ns;
                !ns.ns_e <- (n0,ref(sgn (),Cst_Stt(Cst.S8 s0)))::!ns.ns_e;
                let pp =
                  tbs^"§ "^n0^" = "^"\""^(String.escaped s0)^"\""^"\n" in
                ("","","",pp))
          | Etr_Out_Abs(n,y0) ->
            let l = ref [] in
            let ys = mk_vars (ref []) !ns `Etr l y0 in
            let v = ref(Ln(App(Axm Axm.out_p,ys))) in
            !ns.ns <- (n,v)::!ns.ns;
            !ns.ns_e <- (n,ref(sgn (),Etr_V(Rcd_Ptn.A (0,v))))::!ns.ns_e;
            let pp =
              tbs^"§ "^n^" : "^(Types.print_t ys)^" |⊢ \n" in
            ("","","",pp)
          | Etr_Glb(n,p) ->
            let rv0 = Hashtbl.create 10 in
            let p0 = mk_ir rv0 !p in
            let y1 = slv !ns 0 p0 in
            let _ = gen (ref []) (-1) y1 in
            let pp =
              tbs^"§ "^n^" : "^(Types.print_t y1)^"\n" in
            let ep = sgn () in
            !ns.ns_e <- (n,ref(ep,Cst_Dyn))::!ns.ns_e;
            !ns.ns <- (n,ref(Ln y1))::!ns.ns;
            let s = Hashtbl.create 10 in
            let e_p =
              "NS_E_"^(Sgn.print ep)^":\n"^
              "NS_E_RDI_"^(Sgn.print ep)^":\n"^
              (emt_ir ns s p0) in
            let se =
              (*"\t_dyn_"^(emt_name (l0,n))^":\n"^ *)
              "\tCST_DYN_"^(Sgn.print ep)^":\n"^
              (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
              "\t\tdq 0x0001_0001_00_82_ffff\n"^
              "\t\tdq 1\n" in
            let sx =
              "\tcall NS_E_"^(Sgn.print ep)^"\n"^
              "\tmov QWORD [CST_DYN_"^(Sgn.print ep)^"+8*1],rax\n"^
              "\tmov rbx,0\n"^
              "\tsetc bl\n"^
              "\tnot rbx\n"^
              "\tand QWORD [CST_DYN_"^(Sgn.print ep)^"],rbx\n" in
            (se,e_p,sx,pp)
          | Etr_Clq q ->
            let l_0 =
              List.fold_left
                (fun l_0 (n,_,_,(r0,p0)) ->
                   let (r0,p0) = mk_ir_etr (r0,p0) in
                   let s = Hashtbl.create 10 in
                   let _ = idx_crt_ptn s r0 in
                   let iv0 = Rcd_Ptn.map (fun v -> (idx s v,v)) r0 in
                   let ep = sgn () in
                   !ns.ns_e <- (n,ref(ep,Etr_V iv0))::!ns.ns_e;
                   let y0 = inst_ptn 0 r0 in
                   let y1 = newvar_l 0 in
                   let y2 = newvar () in
                   y2 := Ln(Imp(y0,Var y1));
                   !ns.ns <-  (n,y2)::!ns.ns;
                   (n,y2,y1,p0,iv0,ep)::l_0 )
                [] q in
            let l_1 =
              List.fold_left
                (fun l (n,y2,y0,p0,iv0,ep) ->
                   let y1 = slv !ns 0 !p0 in
                   (n,y2,y0,y1,p0,iv0,ep)::l )
                [] l_0 in
            let pp =
              List.fold_left
                ( fun pp (n,y2,y0,y1,_,_,_) ->
                    ( try
                        let _ = unify [] (Var y0) (inst 0 y1) in
                        gen (ref []) (-1) (Var y2);
                        pp^tbs^"\t@."^n^" : "^(Types.print_t (Var y0))^" ⊢ "^(Types.print_t y1)^"\n"
                      with _ -> err "y1:" ))
                "" l_1 in
            List.fold_left
              ( fun (e_0,e_1,e_2,pp) (_,_,_,_,p0,iv0,ep) ->
                  let s = Hashtbl.create 10 in
                  let i0 = Rcd_Ptn.map ( fun (i,v) -> Hashtbl.add s i v; i) iv0 in
                  let c0 = cmt ("\t|» "^(emt_ptn i0)) in
                  let lb0 = "emt_etr_c_"^(lb ()) in
                  let l_e = "NS_E_"^(Sgn.print ep) in
                  let l_e_rdi = "NS_E_RDI_"^(Sgn.print ep) in
                  let (ea,w) = push_reg s x86_reg_lst in
                  let e0 =
                    l_e^":\n"
                    ^c0^
                    "\tjz "^l_e_rdi^"\n"^
                    "\tjc "^lb0^"\n"^
                    "\tpush rbx\n"^
                    "\tmov rbx,rdi\n"^
                    "\tpush rbx\n"^
                    "\tmov QWORD [set_ptn_vct+8*1],rbx\n"^
                    "\tmov QWORD [set_ptn_vct],0\n"^
                    (emt_set_ptn 0 s i0)^
                    "\tpop rbx\n"^
                    ea^
                    "\tmov rdi,rbx\n"^
                    "\tcall dec_r\n"^
                    (pop_reg w)^
                    "\tpop rbx\n"^
                    "jmp "^l_e_rdi^"\n"^
                    lb0^":\n"^
                    "\tpush rbx\n"^
                    "\tmov QWORD [set_ptn_vct+8*1],rdi\n"^
                    "\tmov QWORD [set_ptn_vct],0\n"^
                    (emt_set_ptn 0 s i0)^
                    "\tpop rbx\n"^
                    l_e_rdi^":\n" in
                  let e_p = emt_ir ns s !p0 in
                  let se =
                    "\tNS_E_DYN_"^(Sgn.print ep)^":\n"^
                    (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
                    "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
                    "\t\tdq "^l_e^"\n" in
                  (e_0^se,e_1^e0^e_p,e_2,pp)) ("","","",tbs^"§ \n"^pp) l_1
          | Flow f ->
            ( match f with
              | Ast.Def_CoPrd (n,a,ds) ->
                let (_,vs) = List.split a in
                let ds = List.map (fun (y,c) -> (mk_vars (ref []) !ns `Abs (ref a) y,c)) ds in
                let yp = sgn () in
                let ya = List.fold_left (fun ya (_,v) -> App(ya,Var v)) (Axm yp) a in
                let yt = List.fold_left (fun yt (_,v) -> Abs(v,yt)) ya a in
                !ns.ns_t <- (n,ref(Ln yt))::!ns.ns_t;
                let (_,es,pp0) =
                  List.fold_left
                    ( fun (i,s,pp0) (t,n) ->
                        let tc = Imp(t,ya) in
                        !ns.ns <- (n,ref (Ln tc))::!ns.ns;
                        let epi = sgn () in
                        !ns.ns_e <- (n,ref(epi,Ctr i))::!ns.ns_e;
                        let ppi =
                          tbs^"\t∐ "^n^" : "^(Types.print_t t)^"\n" in
                        let sn =
                          "\tNS_E_DYN_"^(Sgn.print epi)^":\n"^
                          (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
                          "\t\tdq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001\n"^
                          "\t\tdq "^(string_of_int i)^"\n" in
                        (i+1,s^sn,pp0^ppi) )
                    (0,"","") ds in
                (es,"","",tbs^"¶ "^n^(pnt_vs vs)^"\n"^pp0)
              | Ast.Def_Abs (n,a) ->
                let (a0,_) = List.split a in
                !ns.ns_t <- (n,ref(Ln(Axm (sgn ()))))::!ns.ns_t;
                ("","","",tbs^"¶ "^n^(pnt_args `Hd a0)^"\n")
              | Ast.Def_EqT (n,a,y) ->
                let (a0,_) = List.split a in
                let ya = mk_vars (ref []) !ns `Abs (ref a) y in
                let yt = List.fold_left (fun yt (_,v) -> Abs(v,yt)) ya a in
                !ns.ns_t <- (n,ref(Ln yt))::!ns.ns_t;
                ("","","",tbs^"¶ "^n^(pnt_args `Hd a0)^" = "^(Types.print_t ya)^"\n")
              | _ -> err "slv_flows 1" )
          | Flow_Clq q ->
            let dl =
              List.map
                ( fun f ->
                    ( match f with
                      | Ast.Def_CoPrd (n,a,ds) ->
                        let (_,_) = List.split a in
                        let yp = sgn () in
                        let ya = List.fold_left ( fun ya (_,v) -> App(ya,Var v)) (Axm yp) a in
                        let yt = List.fold_left ( fun yt (_,v) -> Abs(v,yt)) ya a in
                        !ns.ns_t <- (n,ref(Ln yt))::!ns.ns_t;
                        `CP(n,a,ds,yt)
                      | Ast.Def_Abs (n,a) -> (`Abs (n,a))
                      | Ast.Def_EqT (n,a,x) -> (`EqT (n,a,x))
                      | _ -> err "slv_flows 1" )
                ) q in
            let (es,pp) =
              List.fold_left
                ( fun (es,pp) f ->
                    ( match f with
                      | `CP (n,a,ds,yt) ->
                        let (_,vs) = List.split a in
                        let ds = List.map (fun (y,c) -> (mk_vars (ref []) !ns `Abs (ref a) y,c)) ds in
                        let (_,eq,pp0) =
                          List.fold_left
                            (fun (i,eq,pp0) (t,n) ->
                               let tc = Imp(t,yt) in
                               !ns.ns <- (n,ref (Ln tc))::!ns.ns;
                               let epi = sgn () in
                               !ns.ns_e <- (n,ref(epi,Ctr i))::!ns.ns_e;
                               let ppi =
                                 tbs^"\t∐ "^n^" : "^(Types.print_t t)^"\n" in
                               let sn =
                                 "\tNS_E_DYN_"^(Sgn.print epi)^":\n"^
                                 (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
                                 "\t\tdq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001\n"^
                                 "\t\tdq "^(string_of_int i)^"\n" in
                               (i+1,eq^sn,pp0^ppi))
                            (0,"","") ds in
                        (es^eq,pp^tbs^"\t@."^n^(pnt_vs vs)^"\n"^pp0)
                      | `Abs (n,a) ->
                        let (a,_) = List.split a in
                        ("",pp^tbs^"\t@."^n^(pnt_args `Hd a)^"\n")
                      | `EqT (_,_,_) -> ("",pp)
                      | _ -> err "slv_flows 1" )
                )
                ("","") dl in
            (es,"","",tbs^"¶\n"^pp)
          | Grm_Abs n ->
            let open Rcd_Ptn in
            !ns.ns_m_t <- (n,ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
            let ns_g = ref(init_ns ()) in
            !ns_g.root <- (Some ns);
            !ns.ns_m <- (n,ns_g)::!ns.ns_m;
            let p_t = sgn () in
            !ns_g.ns_t <- ("t",ref(Ln(Axm p_t)))::!ns_g.ns_t;
            let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;Axm p_t])) in
            !ns_g.ns <- ("prs",ref(Ln yp))::!ns_g.ns;
            let epf = sgn () in
            let ev = R [|A (0,ref(Ln(Axm Axm.stg)));A (1,ref(Ln(Axm Axm.r64)))|] in
            !ns_g.ns_e <- ("prs",ref(epf,Ast.Etr_V ev))::!ns_g.ns_e;
            let eq0 =
              "\tNS_E_DYN_"^(Sgn.print epf)^":\n"^
              (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
              "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
              "\t\tdq NS_E_"^(Sgn.print epf)^"\n" in
            let e0 =
              ( match n with
                | "dgt" ->
                  let l0 = "NS_E_"^(Sgn.print epf)^"_LB_0" in
                  let l_e = "NS_E_"^(Sgn.print epf) in
                  let l_e_rdi = "NS_E_RDI_"^(Sgn.print epf) in
                  let l_e_tbl = "NS_E_"^(Sgn.print epf)^"_ETR_TBL" in
                  l_e^":\n"^
                  l_e_rdi^":\n"^
                  l_e_tbl^":\n"^
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
                | "u_al" ->
                  let l0 = "NS_E_"^(Sgn.print epf)^"_LB_0" in
                  let l_e = "NS_E_"^(Sgn.print epf) in
                  let l_e_rdi = "NS_E_RDI_"^(Sgn.print epf) in
                  let l_e_tbl = "NS_E_"^(Sgn.print epf)^"_ETR_TBL" in
                  l_e^":\n"^
                  l_e_rdi^":\n"^
                  l_e_tbl^":\n"^
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
                | "l_al" ->
                  let l0 = "NS_E_"^(Sgn.print epf)^"_LB_0" in
                  let l_e = "NS_E_"^(Sgn.print epf) in
                  let l_e_rdi = "NS_E_RDI_"^(Sgn.print epf) in
                  let l_e_tbl = "NS_E_"^(Sgn.print epf)^"_ETR_TBL" in
                  l_e^":\n"^
                  l_e_rdi^":\n"^
                  l_e_tbl^":\n"^
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
                | "chr" ->
                  let l0 = "NS_E_"^(Sgn.print epf)^"_LB_0" in
                  let l_e = "NS_E_"^(Sgn.print epf) in
                  let l_e_rdi = "NS_E_RDI_"^(Sgn.print epf) in
                  let l_e_tbl = "NS_E_"^(Sgn.print epf)^"_ETR_TBL" in
                  l_e^":\n"^
                  l_e_rdi^":\n"^
                  l_e_tbl^":\n"^
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
                | _ -> err "emt_m g9"
              ) in
            (eq0,e0,"",tbs^"¶¶+ℙ "^n^"\n")
          | Gram g ->
            let open Rcd_Ptn in
            let gv =
              List.fold_left
                ( fun gv g ->
                    ( match g with
                      | Grm.Cnc (n,rs) ->
                        !ns.ns_m_t <- (n,ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
                        let ns_g = ref(init_ns ()) in
                        !ns_g.root <- Some ns;
                        !ns.ns_m <- (n,ns_g)::!ns.ns_m;
                        let t_p = sgn () in
                        !ns_g.ns_t <- ("t",ref(Ln(Axm t_p)))::!ns_g.ns_t;
                        let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;Axm t_p])) in
                        !ns_g.ns <- ("prs",(ref(Ln yp)))::!ns_g.ns;
                        let epv = sgn () in
                        let ev = R [|A (0,ref(Ln(Axm Axm.stg)));A (1,ref(Ln(Axm Axm.r64)))|] in
                        !ns_g.ns_e <- ("prs",ref(epv,Ast.Etr_V ev))::!ns_g.ns_e;
                        gv@[`P(n,rs,t_p,epv,ns_g)]
                      | Grm.Act(n,rs) ->
                        !ns.ns_m_t <- (n,ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
                        let ns_g = ref(init_ns ()) in
                        !ns_g.root <- Some ns;
                        !ns.ns_m <- (n,ns_g)::!ns.ns_m;
                        let t_v = newvar_l 0 in
                        !ns_g.ns_t <- ("t",t_v)::!ns_g.ns_t;
                        let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;Var t_v])) in
                        !ns_g.ns <- ("prs",(ref(Ln yp)))::!ns_g.ns;
                        let epv = sgn () in
                        let ev = R [|A (0,ref(Ln(Axm Axm.stg)));A (1,ref(Ln(Axm Axm.r64)))|] in
                        !ns_g.ns_e <- ("prs",ref(epv,Ast.Etr_V ev))::!ns_g.ns_e;
                        gv@[`V(n,rs,t_v,epv,ns_g)]
                    ))
                [] g in
            let gv_0 =
              List.fold_left
                ( fun gv_0 rsi ->
                    match rsi with
                    | `P(n,rs,t_p,epv,ns_g) ->
                      let ya = Axm t_p in
                      let (_,rts) =
                        List.fold_left
                          (fun (i,rts) (nc,_,r) ->
                             let t = mk_var_grm !ns r in
                             let tc = Imp(t,ya) in
                             !ns_g.ns <- (nc,ref (Ln tc))::!ns_g.ns;
                             let epv_i = sgn () in
                             !ns_g.ns_e <-  (nc,ref(epv_i,Ctr i))::!ns_g.ns_e;
                             (i+1,rts@[(t,epv_i)]))
                          (0,[]) rs in
                      gv_0@[`P(n,rs,rts,t_p,epv,ns_g)]
                    | `V(n,rs,t_v,epv,ns_g) ->
                      let rts =
                        List.fold_left
                          ( fun rts ((r0,p0),_,r) ->
                              let y = mk_var_grm !ns r in
                              let (r0,p0) = mk_ir_etr (r0,p0) in
                              let y0 = inst_ptn 0 r0 in
                              let _ = unify [] y y0 in
                              let y1 = slv !ns 0 !p0 in
                              let _ = unify [] y1 (App(Axm Types.Axm.opn,Var t_v)) in
                              rts @ [y] )
                          [] rs in
                      gv_0@[`V(n,rs,rts,t_v,epv,ns_g)] )
                [] gv in
            let _ =
              List.fold_left
                (fun _ rsi ->
                   match rsi with
                   | `V(_,_,_,t_v,_,_) ->
                     gen (ref []) (-1) (Var t_v)
                   | _ -> ()) () gv_0 in
            let (es0,es1,pp) =
              List.fold_left
                ( fun (es0,es1,pp) rsi ->
                    match rsi with
                    | `P(n,rs,rts,_,epv,_) ->
                      let ppi = Grm.print_etr (n,rs) in
                      let rsc = List.combine rs rts in
                      let (_,eq,_) =
                        List.fold_left
                          (fun (i,eq,pp0) ((_,_,_),(_,epv_i)) ->
                             let sn =
                               "\tNS_E_DYN_"^(Sgn.print epv_i)^":\n"^
                               (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
                               "\t\tdq 0b00000000_00000001_00000000_00000001_11000000_00000000_00000000_00000001\n"^
                               "\t\tdq "^(string_of_int i)^"\n" in
                             (i+1,eq^sn,pp0))
                          (0,"","") rsc in
                      pnt true "grm x\n";
                      let es0 =
                        es0^
                        (emt_prs !ns epv (`P rs)) in
                      pnt true "grm x\n";
                      let eq0 =
                        "\tNS_E_DYN_"^(Sgn.print epv)^":\n"^
                        (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
                        "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
                        "\t\tdq NS_E_"^(Sgn.print epv)^"\n" in
                      (es0,es1^eq^eq0,pp^ppi)
                    | `V(n,rs,rts,_,epv,_) ->
                      let ppi = Grm.print_etr_act (n,rs) in
                      let _ = List.combine rs rts in
                      let es0 =
                        es0^
                        (emt_prs !ns epv (`V rs)) in
                      pnt true "grm x\n";
                      let eq0 =
                        "\tNS_E_DYN_"^(Sgn.print epv)^":\n"^
                        (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
                        "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
                        "\t\tdq NS_E_"^(Sgn.print epv)^"\n" in
                      (es0,es1^eq0,pp^ppi)
                ) ("","","") gv_0 in
            (es1,es0,"",tbs^"¶+ℙ \n"^pp)
        ) in
      pnt true pp;
      let (et0,et1,et2,ppt) = emt_m ns ld tl in
      (e0^et0,e1^et1,e2^et2,pp^ppt)
  )
and get_ep ns f =
  let af = get_ns_e ns f in
  let (epf,_) = !af in
  epf
and init_prm () =
  let open Rcd_Ptn in
  let ns = ref (init_ns ()) in

  !ns.ns_m_t <- ("_chr",ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
  let ns_g = ref(init_ns ()) in
  !ns_g.root <- (Some ns);
  !ns.ns_m <- ("_chr",ns_g)::!ns.ns_m;
  !ns_g.ns_t <- ("t",ref(Ln(Axm Axm.stg)))::!ns_g.ns_t;
  let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;Axm Axm.stg])) in
  !ns_g.ns <- ("prs",ref(Ln yp))::!ns_g.ns;
  let epf = sgn () in
  let ev = R [|A (0,ref(Ln(Axm Axm.stg)));A (1,ref(Ln(Axm Axm.r64)))|] in
  !ns_g.ns_e <- ("prs",ref(epf,Ast.Etr_V ev))::!ns_g.ns_e;
  let se_chr =
    "\tNS_E_DYN_"^(Sgn.print epf)^":\n"^
    (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
    "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
    "\t\tdq NS_E_"^(Sgn.print epf)^"\n" in
  let l0 = "NS_E_"^(Sgn.print epf)^"_LB_0" in
  let lb1 = "LB_"^(Sgn.print (sgn ())) in
  let lb2 = "LB_"^(Sgn.print (sgn ())) in
  let lb3 = "LB_"^(Sgn.print (sgn ())) in

  let l_e = "NS_E_"^(Sgn.print epf) in
  let l_e_rdi = "NS_E_RDI_"^(Sgn.print epf) in
  let l_e_tbl = "NS_E_"^(Sgn.print epf)^"_ETR_TBL" in
  let em_chr =
    l_e^":\n"^
    l_e_rdi^":\n"^
    l_e_tbl^":\n"^
    "\tmov r11b,[rdi+rsi+8*1]\n"^
    "\tcmp r11,0\n"^
    "\tjz "^l0^"\n"^
    "\tbt r11,7\n"^
    "\tjc "^lb1^"\n"^
    "\tpush rdi\n"^
    "\tpush rsi\n"^
    "\tpush rdx\n"^
    "\tpush r11\n"^
    "\tmov rdi,1\n"^
    "\tcall mlc_s8\n"^
    "\tmov r10,rax\n"^
    "\tpop r11\n"^
    "\tpop rdx\n"^
    "\tpop rsi\n"^
    "\tpop rdi\n"^
    "\tmov QWORD [r10+8*1],0\n"^
    "\tmov BYTE [r10+8*1],r11b\n"^
    "\tmov r11,0\n"^
    "\tadd rsi,1\n"^
    "\tmov rax,1\n"^
    "\tret\n"^
    lb1^":\n"^
    "\tadd rsi,1\n"^
    "\tbt r11,6\n"^
    "\tjc "^lb2^"\n"^
    "\tpush rdi\n"^
    "\tpush rsi\n"^
    "\tpush rdx\n"^
    "\tpush r11\n"^
    "\tmov rdi,2\n"^
    "\tcall mlc_s8\n"^
    "\tmov r10,rax\n"^
    "\tpop r11\n"^
    "\tpop rdx\n"^
    "\tpop rsi\n"^
    "\tpop rdi\n"^
    "\tmov QWORD [r10+8*1],0\n"^
    "\tmov BYTE [r10+8*1],r11b\n"^
    "\tmov r11b,[rdi+rsi+8*1+1]\n"^
    "\tmov BYTE [r10+8*1+1],r11b\n"^
    "\tmov r11,0\n"^
    "\tadd rsi,1\n"^
    "\tmov rax,1\n"^
    "\tret\n"^
    lb2^":\n"^
    "\tadd rsi,1\n"^
    "\tbt r11,5\n"^
    "\tjc "^lb3^"\n"^
    "\tpush rdi\n"^
    "\tpush rsi\n"^
    "\tpush rdx\n"^
    "\tpush r11\n"^
    "\tmov rdi,3\n"^
    "\tcall mlc_s8\n"^
    "\tmov r10,rax\n"^
    "\tpop r11\n"^
    "\tpop rdx\n"^
    "\tpop rsi\n"^
    "\tpop rdi\n"^
    "\tmov QWORD [r10+8*1],0\n"^
    "\tmov BYTE [r10+8*1],r11b\n"^
    "\tmov r11b,[rdi+rsi+8*1+1]\n"^
    "\tmov BYTE [r10+8*1+1],r11b\n"^
    "\tmov r11b,[rdi+rsi+8*1+2]\n"^
    "\tmov BYTE [r10+8*1+2],r11b\n"^
    "\tmov r11,0\n"^
    "\tadd rsi,1\n"^
    "\tmov rax,1\n"^
    "\tret\n"^
    lb3^":\n"^
    "\tadd rsi,1\n"^
    "\tbt r11,5\n"^
    "\tjc "^lb3^"\n"^
    "\tpush rdi\n"^
    "\tpush rsi\n"^
    "\tpush rdx\n"^
    "\tpush r11\n"^
    "\tmov rdi,4\n"^
    "\tcall mlc_s8\n"^
    "\tmov r10,rax\n"^
    "\tpop r11\n"^
    "\tpop rdx\n"^
    "\tpop rsi\n"^
    "\tpop rdi\n"^
    "\tmov QWORD [r10+8*1],0\n"^
    "\tmov BYTE [r10+8*1],r11b\n"^
    "\tmov r11b,[rdi+rsi+8*1+1]\n"^
    "\tmov BYTE [r10+8*1+1],r11b\n"^
    "\tmov r11b,[rdi+rsi+8*1+2]\n"^
    "\tmov BYTE [r10+8*1+2],r11b\n"^
    "\tmov r11b,[rdi+rsi+8*1+3]\n"^
    "\tmov BYTE [r10+8*1+3],r11b\n"^
    "\tmov r11,0\n"^
    "\tadd rsi,1\n"^
    "\tmov rax,1\n"^
    "\tret\n"^
    "\tadd rsi,1\n"^
    "\tmov rax,1\n"^
    "\tret\n"^
    l0^":\n"^
    "\tmov rax,0\n"^
    "\tret\n" in

  let v = ref(Ln(App(Axm Axm.out_p,Axm Axm.stg))) in
  !ns.ns <- ("_emt",v)::!ns.ns;
  !ns.ns_e <- ("_emt",ref(Ast.Axm._emt,Etr_V(Rcd_Ptn.A (0,ref(Ln(Axm Axm.stg))))))::!ns.ns_e;
  let se_emt = "" in
  let em_emt =
    "NS_E_"^(Sgn.print Ast.Axm._emt)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._emt)^":\n"^
    "\tmov rbx,rdi\n"^
    "\tcall emt\n"^
    "\tmov rdi,rbx\n"^
    "\tcall dec_r\n"^
    "\tret\n" in
  (*let vr = Rcd(rcd_cl [Axm Axm.stg;(Imp(Axm Axm.stg,unt ()))]) in
  let v = ref(Ln(App(Axm Axm.out_p,vr))) in
  !ns.ns <- ("_frd",v)::!ns.ns;
  !ns.ns_e <- ("_frd",ref(Ast.Axm._frd,Etr_V(Rcd_Ptn.A (0,ref(Ln(vr))))))::!ns.ns_e;
  let se_emt = "" in
  let em_emt =
    "NS_E_"^(Sgn.print Ast.Axm._emt)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._emt)^":\n"^
    "\tmov rbx,rdi\n"^
    "\tcall emt\n"^
    "\tmov rdi,rbx\n"^
    "\tcall dec_r\n"^
    "\tret\n" in *)

  let v_q = newvar_q (-1) in
  let v = ref(Ln(Imp(Var v_q,Rcd(rcd_cl [Var v_q;Axm Axm.stg])))) in
  !ns.ns <- ("_pp_v",v)::!ns.ns;
  !ns.ns_e <- ("_pp_v",ref(Ast.Axm._pp_v,Etr_V(Rcd_Ptn.A (0,v_q))))::!ns.ns_e;
  let se_pp_v = "" in
  let em_pp_v =
    "NS_E_"^(Sgn.print Ast.Axm._pp_v)^":\n"^
    "\tmov rdi,r8\n"^
    "\tbt r12,0\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._pp_v)^":\n"^
    "\tmov rsi,0\n"^
    "\tsetc sil\n"^
    "\tpush rsi\n"^
    "\tcall pp_v\n"^
    "\tpush rax\n"^
    "\tpush rdi\n"^
    "\tmov rdi,2\n"^
    "\tcall mlc\n"^
    "\tpop QWORD [rax+8*1]\n"^
    "\tpop QWORD [rax+8*2]\n"^
    "\tpop rsi\n"^
    "\tbtr QWORD [rax],0\n"^
    "\tbtr QWORD [rax],1\n"^
    "\tor QWORD [rax],rsi\n"^
    "\tclc\n"^
    "\tret\n" in

  !ns.ns_t <- ("_opn",ref(Ln(Axm Axm.opn)))::!ns.ns_t;
  let q0 = newvar_q (-1) in
  let v = ref(Ln(Imp(unt (),App(Axm Axm.opn,Var q0)))) in
  !ns.ns <- ("_none",v)::!ns.ns;
  !ns.ns_e <- ("_none",ref(Ast.Axm._none,Ctr 1))::!ns.ns_e;
  let q0 = newvar_q (-1) in
  let v = ref(Ln(Imp(Var q0,App(Axm Axm.opn,Var q0)))) in
  !ns.ns <- ("_some",v)::!ns.ns;
  !ns.ns_e <- ("_some",ref(Ast.Axm._some,Ctr 0))::!ns.ns_e;

  (se_chr^se_emt^se_pp_v,em_chr^em_emt^em_pp_v,ns)
and emt_exe m f =
  let (se_p,em_p,ns) = (init_prm ()) in
  let (se,em,sx,pp) = (emt_m ns 0 m) in
  let epf = get_ep !ns f in
  let ex =
    "%include \"cmu.s\"\n"^
    "main:\n"^
    "\tmov r12,0\n"^
    "\tnot r12\n"^
    sx^
    "\tmov rdi,0\n"^
    "\tcall mlc\n"^
    "\tmov rdi,rax\n"^
    "\tclc\n"^
    "\tcmp rdi,0\n"^
    "\tcall NS_E_RDI_"^(Sgn.print epf)^"\n"^
    "\tcall exec_out\n"^
    "\tjmp _end\n"^
    em_p^
    em^
    "section .data\n"^
    se_p^
    se^
    (emt_cst_stg !cst_stg) in
  (ex,pp)

and emt_bytes s =
  pnt true "enter emt_bytes\n";
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
and emt_pnt_ptn s r = Rcd_Ptn.print ( fun v -> (string_of_int (idx s v))^"\'") r
and emt_ptn r = Rcd_Ptn.print ( fun i -> (string_of_int i)^"\'" ) r

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
          | Axm a when a=Axm.r64 ->
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
    | Axm a when a=Axm.r64 -> `C
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
          | Axm a when a=Axm.r64  ->
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
and emt_set_ptn d s r =
  let c0 = "emt_set_ptn "^(emt_ptn r) in
  let open Rcd_Ptn in
  let src d = "QWORD [set_ptn_vct+8*1+16*"^(string_of_int d)^"]" in
  let bt d = "\tbt QWORD [set_ptn_vct+16*"^(string_of_int d)^"],0\n" in
  ( match r with
    | A (-2) -> "; _\n"
    | A i ->
      let l0 = "emt_set_ptn_0_"^(lb ()) in
      let l1 = "emt_set_ptn_1_"^(lb ()) in
      let v = (try Hashtbl.find s i with _ -> err ("emt_set_ptn 0:"^(pnt_s s)^","^(src d)^","^(emt_ptn r))) in
      let open Types in
      let rec tb y =
        ( match y with
          | Var { contents = Ln y0 } -> tb y0
          | Axm a when a=Axm.r64 ->
            (cmt c0)^
            (cmt "unboxed")^
            "\tmov rbx,"^(src d)^"\n"^
            "\tmov "^(emt_reg_x86 i)^",rbx\n"
            ^"\tbts r12,"^(string_of_int i)^"\n"
          (* ^"\tor r12,"^(emt_0b i)^"\n"^"\n" *)
          | Rcd _ ->
            (cmt c0)^
            (cmt "boxed")^
            "\tmov rbx,"^(src d)^"\n"^
            "\tmov r13,0x0001_0000_0000_0000\n"^
            "\tadd [rbx],r13\n"^
            "\tmov "^(emt_reg_x86 i)^",rbx\n"^
            "\tand r12,~"^(emt_0b i)^"\n"
          | Var { contents = _ }
          | _ ->
            (cmt c0)^
            (cmt "unknown")^
            (bt d)^
            "\tjc "^l0^"\n"^
            (*"\tbtr "^tbv^","^(string_of_int i)^"\n"^ *)
            "\tmov rbx,"^(src d)^"\n"^
            (mov_regs s)^
            "\tmov rdi,rbx\n"^
            "\tcall inc_r\n"^
            (set_regs s)^
            "\tmov "^(emt_reg_x86 i)^",rbx\n"^
            "\tand r12,~"^(emt_0b i)^"\n"^
            "\tjmp "^l1^"\n"^
            l0^":\n"^
            "\tmov rbx,"^(src d)^"\n"^
            "\tmov "^(emt_reg_x86 i)^",rbx\n"^
            (* "\tbts "^tbv^","^(string_of_int i)^"\n"^ *)
            "\tor r12,"^(emt_0b i)^"\n"^
            l1^":\n" ) in
      tb (Var v)
    | R rs ->
      let (e0,_) =
        Array.fold_left
          (fun (e0,i) r ->
             let ei =
               "\tmov rbx,"^(src d)^"\n"^
               "\tbt QWORD [rbx],"^(string_of_int i)^"\n"^
               "\tmov r13,[rbx+8*"^(string_of_int (i+1))^"]\n"^
               "\tmov [set_ptn_vct+8*1+16*"^(string_of_int (d+1))^"],r13\n"^
               "\tmov r13,0\n"^
               "\tsetc r13b\n"^
               "\tmov [set_ptn_vct+16*"^(string_of_int (d+1))^"],r13\n"
             in
             let e1 = emt_set_ptn (d+1) s r in
             (e0^ei^e1,i+1))
          ("",0) rs in
      (cmt c0)^e0
    | _ -> ";emt_set_ptn\n" )
and emt_reg_tmp n = "[st_vct_tmp+8*"^(string_of_int n)^"]"
and emt_ptn_set_ptn s sf tbv idx0 idx1 r0 r1 =
  let c0 = "emt_ptn_set_ptn "^(emt_ptn r0)^","^(emt_ptn r1) in
  let open Rcd_Ptn in
  ( match r0,r1 with
    | A i,_ ->
      (cmt c0)^
      "\tmov rbx,"^(idx0 i)^"\n"^
      "\tmov QWORD [set_ptn_vct+8*1],rbx\n"^
      "\tbt r12,"^(string_of_int i)^"\n"^
      "\tmov rbx,0\n"^
      "\tsetc bl\n"^
      "\tmov QWORD [set_ptn_vct],rbx\n"^
      (emt_set_ptn 0 sf r1)
    | R _,A (-2) -> err "emt_ptn_set_ptn -2"
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
and emt_ptn_crt_ptn s r0 r1 =
  pnt true ("enter emt_ptn_crt_ptn:"^(emt_ptn r0)^","^(pnt_ptn r1)^"\n");
  let c0 = "emt_ptn_crt_ptn "^(emt_ptn r0)^","^(pnt_ptn r1) in
  let open Rcd_Ptn in
  ( match r0,r1 with
    | A i,_ ->
      let i1 = idx_crt_ptn s r1 in
      (cmt c0)^
      "\tmov rbx,"^(emt_reg_x86 i)^"\n"^
      "\tmov QWORD [set_ptn_vct+8*1],rbx\n"^
      "\tbt r12,"^(string_of_int i)^"\n"^
      "\tmov rbx,0\n"^
      "\tsetc bl\n"^
      "\tmov QWORD [set_ptn_vct],rbx\n"^
      (emt_set_ptn 0 s i1)
    | R _,A v ->
      if List.exists (fun (s,w) -> w==v&&s="_") !Ast.rm then cmt c0
      else
        let (i,eg) = emt_get_crt_ptn s "r12" emt_reg_x86 r0 in
        let e0 =
          eg^
          "\tand r12,~"^(emt_0b i)^"\n" in
        Hashtbl.add s i v;
        (cmt c0)^e0
    | R rs0,R rs1 ->
      let (_,e0) =
        Array.fold_left
          (fun (i,e0) ri ->
             let e1 =
               emt_ptn_crt_ptn s ri rs1.(i) in
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
           "\tbt r12,"^(string_of_int i0)^"\n"^
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
        ( match BatList.find_opt (fun (i0,_) -> i=i0) al with
          | None ->
            (cmt c0)^
            "\tmov rbx,"^(idx i)^"\n"^
            "\tmov QWORD [set_ptn_vct+8*1],rbx\n"^
            "\tbt r12,"^(string_of_int i)^"\n"^
            "\tmov rbx,0\n"^
            "\tsetc bl\n"^
            "\tmov QWORD [set_ptn_vct],rbx\n"^
            (emt_set_ptn 0 s r1)
          | Some (_,i1) ->
            (cmt c0)^
            "\tmov rbx,"^(idx i1)^"\n"^
            "\tmov QWORD [set_ptn_vct+8*1],rbx\n"^
            "\tbt r12,"^(string_of_int i)^"\n"^
            "\tmov rbx,0\n"^
            "\tsetc bl\n"^
            "\tmov QWORD [set_ptn_vct],rbx\n"^
            (emt_set_ptn 0 s r1) )
      | R _,A (-2) ->
        (cmt c0)
      | R _,A i ->
        let e0 =
          "\tpush "^tbv^"\n"^
          (emt_get_ptn s "r12" idx r0 i)^
          "\tpop "^tbv^"\n"^
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
             | Axm a when a=Axm.r64 ->
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
      | Axm a when a=Axm.r64 ->
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
and emt_ir  ns s p =
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
      let src i = "QWORD [set_ptn_vct+8*1+16*"^(string_of_int i)^"]" in
      let bt i = "\tbt QWORD [set_ptn_vct+16*"^(string_of_int i)^"],0\n" in
      let idx i = "QWORD [mtc_vct_0+8*1+16*"^(string_of_int i)^"]" in
      let r12 i = "QWORD [mtc_vct_0+16*"^(string_of_int i)^"]" in
      let rec emt_mtc_set s r0 r1 =
        let c0 = "; emt_mtc_set\n" in
        let open Rcd_Ptn in
        ( match r0,r1 with
          | A i,_ ->
            let i1 = idx_crt_ptn s r1 in
            let e0 =
              c0^
              "\tmov rbx,"^(emt_reg_x86 i)^"\n"^
              "\tmov QWORD [set_ptn_vct+8*1],rbx\n"^
              "\tbt r12,"^(string_of_int i)^"\n"^
              "\tmov rbx,0\n"^
              "\tsetc bl\n"^
              "\tmov QWORD [set_ptn_vct],rbx\n"^
              (emt_mtc_set_ptn 0 s i1) in
            (e0,[])
          | R rs,A v ->
            if List.exists (fun (s,w) -> w==v&&s="_") !Ast.rm
            then (cmt c0,[])
            else (cmt c0,[(rs,v)])
          | R rs0,R rs1 ->
            let (_,e0,gl0) =
              Array.fold_left
                (fun (i,e0,gl0) ri ->
                   let (e1,gl) =
                     emt_mtc_set s ri rs1.(i) in
                   (i+1,e0^e1,gl0@gl) )
                (0,"",[]) rs0 in
            ((cmt c0)^e0,gl0)
          | _,_ -> err "emt_mtc_set 0 " )
      and emt_mtc_set_ptn d s r =
        let open Rcd_Ptn in
        ( match r with
          | A (-2) -> "; _\n"
          | A i ->
            let l0 = lb () in
            let l1 = lb () in
            (bt d)^
            "\tjc "^l0^"\n"^
            "\tmov rbx,"^(src d)^"\n"^
            "\tmov "^(idx i)^",rbx\n"^
            "\tmov "^(r12 i)^",0\n"^
            "\tjmp "^l1^"\n"^
            l0^":\n"^
            "\tmov rbx,"^(src d)^"\n"^
            "\tmov "^(idx i)^",rbx\n"^
            "\tmov "^(r12 i)^",1\n"^
            l1^":\n"
          | R rs ->
            let (e0,_) =
              Array.fold_left
                ( fun (e0,i) r ->
                    let ei =
                      "\tmov rbx,"^(src d)^"\n"^
                      "\tbt QWORD [rbx],"^(string_of_int i)^"\n"^
                      "\tmov r13,[rbx+8*"^(string_of_int (i+1))^"]\n"^
                      "\tmov [set_ptn_vct+8*1+16*"^(string_of_int (d+1))^"],r13\n"^
                      "\tmov r13,0\n"^
                      "\tsetc r13b\n"^
                      "\tmov [set_ptn_vct+16*"^(string_of_int (d+1))^"],r13\n"
                    in
                    let e1 = emt_mtc_set_ptn (d+1) s r in
                    (e0^ei^e1,i+1))
                ("",0) rs in
            (cmt c0)^e0
          | _ -> ";emt_set_ptn\n" ) in
      let (_,a0) =
        Array.fold_left
          ( fun (i,a) ((ri,es),p) ->
              let s = Hashtbl.copy s in
              let s_i = Hashtbl.create 10 in
              let ci = cmt ("\t∐\\ "^(Mtc.print (ri,es))) in
              let (ei,gl) = emt_mtc_set s_i i0 ri in
              let l_f = lb () in
              let exs =
                List.fold_left
                  (fun exs (vx,pa) ->
                     let open Mtc in
                     let c0 = cmt ((print_v vx)^"="^(print_test pa)) in
                     let ix = idx_csm s_i vx in
                     ( match pa with
                       | Eq_Agl_N(n,r) ->
                         let f = try get_ns_e !ns n with _ -> err "emt_ir a0" in
                         let ir = idx_crt_ptn s_i r in
                         ( match !f with
                           | (_,Ast.Ctr i) ->
                             let lb_c0 = lb () in
                             exs^
                             c0^
                             "\tmov rbx,"^(idx ix)^"\n"^
                             "\tmov r13,rbx\n"^
                             "\tshr r13,56\n"^
                             "\tcmp r13,"^(string_of_int i)^"\n"^
                             "\tjnz "^l_f^"\n"^
                             "\tmov r13,rbx\n"^
                             "\tmov r14,0x00ff_ffff_ffff_fffe\n"^
                             "\tand r13,r14\n"^
                             "\tbt QWORD [r13],16\n"^
                             "\tjc "^lb_c0^"\n"^
                             "\tbt QWORD [r13],17\n"^
                             "\tjnc "^lb_c0^"\n"^
                             "\tmov r13,QWORD [r13+8*1]\n"^
                             lb_c0^":\n"^
                             "\tmov QWORD [set_ptn_vct],0\n"^
                             "\tmov QWORD [set_ptn_vct+8*1],r13\n"^
                             (emt_mtc_set_ptn 0 s_i ir)
                           | _ -> err "emt_ir f" )
                       | P_Cst c ->
                         ( match c with
                           | P_Stg s0 ->
                             let bs = Bytes.of_string s0 in
                             let sl = Bytes.length bs in
                             let bl = sl / 8 in
                             let rl = bl+1 in
                             let m = sl mod 8 in
                             let rec lp i =
                               if i=bl
                               then
                                 let s_i = String.sub s0 (8*i) m in
                                 "\tmov rbx,`"^(String.escaped s_i)^"`\n"^
                                 "\tmov QWORD r13,[r14+8*"^(string_of_int (i+1))^"]\n"^
                                 "\tcmp rbx,r13\n"^
                                 "\tjnz "^l_f^"\n"
                               else
                                 let s_i = String.sub s0 (8*i) 8 in
                                 "\tmov rbx,`"^(String.escaped s_i)^"`\n"^
                                 "\tmov QWORD r13,[r14+8*"^(string_of_int (i+1))^"]\n"^
                                 "\tcmp rbx,r13\n"^
                                 "\tjnz "^l_f^"\n"^
                                 (lp (i+1)) in
                             exs^
                             c0^
                             "\tmov r14,"^(idx ix)^"\n"^
                             "\tmov rbx,[r14]\n"^
                             "\tshr rbx,32\n"^
                             "\tand rbx,0xffff\n"^
                             "\tcmp rbx,"^(string_of_int rl)^"\n"^
                             "\tjnz "^l_f^"\n"^
                             (lp 0)
                           | P_R64 x ->
                             exs^
                             c0^
                             "\tmov r14,"^(idx ix)^"\n"^
                             "\tmov QWORD rbx,0x"^(Int64.format "%x" x)^"\n"^
                             "\tcmp r14,rbx\n"^
                             "\tjnz "^l_f^"\n"
                           | _ -> err "emt_ir mtc 1"
                         )
                       | _ -> err "emt_ir:mtc:0" ))
                  (a^ci^ei) es in
              let e_t =
                Hashtbl.fold
                  (fun i v e_t ->
                     let lb_i = lb () in
                     let lb_i_c = lb () in
                     let lb_inc_r_blk = lb () in
                     let i_s = idx_crt s v in
                     e_t^
                     "\tmov r13,"^(idx i)^"\n"^
                     "\tmov "^(emt_reg_x86 i_s)^",r13\n"^
                     "\tmov rbx,"^(r12 i)^"\n"^
                     "\tbt rbx,0\n"^
                     "\tjc "^lb_i^"\n"^
                     "\tbtr r12,"^(string_of_int i_s)^"\n"^
                     "\tbt r13,0\n"^
                     "\tjnc "^lb_inc_r_blk^"\n"^
                     "\tmov r14,0x00ff_ffff_ffff_fffe\n"^
                     "\tand r13,r14\n"^
                     lb_inc_r_blk^":\n"^
                     "\tmov r14,0x0001_0000_0000_0000\n"^
                     "\tadd QWORD [r13],r14\n"^
                     "\tjmp "^lb_i_c^"\n"^
                     lb_i^":\n"^
                     "\tbts r12,"^(string_of_int i_s)^"\n"^
                     lb_i_c^":\n" )
                  s_i exs in
              let e_gl =
                List.fold_left
                  (fun e_gl (rs,v) ->
                     let (i,eg) = emt_get_crt_ptn s "r12" emt_reg_x86 (Rcd_Ptn.R rs) in
                     Hashtbl.add s i v;
                     e_gl^
                     eg^
                     "\tand r12,~"^(emt_0b i)^"\n" )
                  e_t gl in
              let e_d0 = mov_regs s in
              let e_d =
                List.fold_left
                  ( fun e_d i ->
                      let lb0 = lb () in
                      Hashtbl.remove s i;
                      e_d^
                      "\tbt r12,"^(string_of_int i)^"\n"^
                      "\tjc "^lb0^"\n"^
                      "\tmov rdi,QWORD [regs_vct+8*"^(string_of_int i)^"]\n"^
                      "\tcall dec_r\n"^
                      lb0^":\n" )
                  (e_gl^e_d0) (Rcd_Ptn.to_list i0) in
              let e_d1 = set_regs s in
              let e1 = emt_ir ns s p in
              let e2 =
                e_d^
                e_d1^
                e1^
                l_f^":\n" in
              (i+1,e2))
          (0,"") ps in
      let _ = idx_csm_ptn s r in
      c0^a0^
      "\tjmp err\n"
    | IL_Glb_Call(n,x) ->
      let ix = idx_ptn s x in
      let c0 = cmt ("\t"^(pnt_name n)^" "^(emt_ptn ix)^" ⊢| ") in
      let f = get_ns_e !ns n in
      ( match !f with
        | (a,_) when a=Ast.Axm._add ->
          let open Rcd_Ptn in
          let _ = Hashtbl.copy s in
          let v0 = newvar () in
          let v1 = newvar () in
          let xt = R [|A v0;A v1|] in
          let p = idx_crt_ptn s xt in
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
        | (a,_) when a=Ast.Axm._mul ->
          let open Rcd_Ptn in
          let _ = Hashtbl.copy s in
          let v0 = newvar () in
          let v1 = newvar () in
          let xt = R [|A v0;A v1|] in
          let p = idx_crt_ptn s xt in
          let ix = idx_csm_ptn s x in
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
        | (a,_) when a=Ast.Axm._sub ->
          let open Rcd_Ptn in

          let v0 = newvar () in
          let v1 = newvar () in
          let xt = R [|A v0;A v1|] in
          let p = idx_crt_ptn s xt in
          let ix = idx_csm_ptn s x in
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
        | (a,_) when a=Ast.Axm._cmp ->
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
        | (ep,af) ->
          let open Rcd_Ptn in
          ( match af with
            | Ctr j ->
              let v = newvar () in
              let v_i = newvar () in
              let i_i = idx_crt s v_i in
              let ix = idx_ptn s x in
              let ec =
                (clear emt_reg_x86 s) in
              let e0 =
                "\tmov QWORD "^(emt_reg_x86 i_i)^","^(string_of_int j)^"\n"^
                "\tbts r12,"^(string_of_int i_i)^"\n"^
                (emt_ptn_crt_ptn s (R [|A i_i;ix|]) (A v)) in
              let _ = idx s v in
              let _ = idx_csm s v_i in
              let _ = emt_dec_ptn s emt_reg_x86 ix in
              let _ = idx_csm_ptn s x in
              e0^ec
            | Etr_V ivf ->
              let sf = Hashtbl.create 10 in
              let i0 = Rcd_Ptn.map (fun (i,v) -> Hashtbl.add sf i v; i) ivf in
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
              let c0 = cmt ("\t"^(pnt_name  n)^" "^cx^" ⊢| ") in
              c0^e1^em^
              (emt_ptn_set_ptn sf sf "r12" emt_reg_x86 emt_reg_x86 ixa i0)^
              dec_x^
              "\tjmp NS_E_"^(Sgn.print ep)^"\n"
            | _ -> "; ir_glb_call\n" ) )
    | IL_Call(_,_) ->
      "; il_call\n"
    | Seq(n,p1) ->
      let s0 =
        ( match n with
          | IR_Id(r,rs) ->
            let ir = idx_ptn s r in
            let c0 =
              cmt ("\t$ "^(emt_ptn ir)^" ⊢ "^(Array.fold_left (fun b r -> b^","^(pnt_ptn r)) "" rs)^
                   rtl^(Arr.fld_l (fun s r -> s^","^(print_ty r)) "" rs)) in
            let (_,e0) =
              Array.fold_left
                ( fun (i,e0) ri ->
                    let e1 =
                      emt_ptn_crt_ptn s ir ri in
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
                  "\tmov r13,QWORD [tmp]\n"^
                  "\tmov QWORD [set_ptn_vct+8*1],r13\n"^
                  (emt_set_ptn 0 s_e (A iy))^
                  (emt_dec s_e "[tmp]" (inst_ptn 0 y))^
                  "\tjmp "^l_1^"\n"^
                  l_0^":\n"^
                  sp^
                  "\tmov r13,QWORD [tmp]\n"^
                  "\tmov QWORD [set_ptn_vct+8*1],r13\n"^
                  "\tmov rbx,1\n"^
                  "\tmov QWORD [set_ptn_vct],rbx\n"^
                  (emt_set_ptn 0 s_e (A iy))^
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
            let ix = idx_ptn s x in
            let (ep,af) = !(get_ns_e !ns n) in
            ( match ep,af with
              | a,_ when a=Ast.Axm._add ->
                ( try
                    let open Rcd_Ptn in
                    let iy = idx_crt_ptn s y in
                    let c0 = cmt ("\t"^(pnt_name n)^" "^(emt_ptn ix)^" ⊢ "^(emt_ptn iy)^rtl^(print_ty y)) in
                    let v0 = ref (Ln (Axm Axm.r64)) in
                    let v1 = ref (Ln (Axm Axm.r64)) in
                    let xt = R [|A v0;A v1|] in
                    let p = idx_crt_ptn s xt in
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
                    "\tpop r14\n"^
                    "\tmov QWORD [set_ptn_vct+8*1],rbx\n"^
                    "\tmov rbx,1\n"^
                    "\tmov QWORD [set_ptn_vct],rbx\n"^
                    (emt_set_ptn 0 s iy)^
                    "\tpop rbx\n"
                  with _ -> err "emt_ir 11\n" )
              | a,_ when a=Ast.Axm._mul ->
                ( try
                    let open Rcd_Ptn in
                    let iy = idx_crt_ptn s y in
                    let v0 = ref (Ln (Axm Axm.r64)) in
                    let v1 = ref (Ln (Axm Axm.r64)) in
                    let xt = R [|A v0;A v1|] in
                    let p = idx_crt_ptn s xt in
                    let c0 = cmt ("\t"^(pnt_name n)^" "^(emt_ptn ix)^" ⊢ "^(emt_ptn iy)^rtl^(print_ty y)) in
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
                    "\tmov QWORD [set_ptn_vct+8*1],rbx\n"^
                    "\tmov rbx,1\n"^
                    "\tmov QWORD [set_ptn_vct],rbx\n"^
                    (emt_set_ptn 0 s iy)^
                    "\tpop rbx\n"
                  with _ -> err "emt_ir 12" )
              | a,_ when a=Ast.Axm._cns ->
                let open Rcd_Ptn in
                ( match y with
                  | A v ->
                    let v_i = newvar () in
                    let i_i = idx_crt s v_i in
                    let ix = idx_ptn s x in
                    (* let v_a = newvar () in
                       let vx = (ref(Ln(inst_ptn 0 x))) in *)
                    let e0 =
                      "; cns \n"^
                      "\tmov QWORD "^(emt_reg_x86 i_i)^",1\n"^
                      "\tbts r12,"^(string_of_int i_i)^"\n"^
                      (emt_ptn_crt_ptn s (R [|A i_i;ix|]) (A v)) in
                    let _ = idx_csm s v_i in
                    let ed = emt_dec_ptn s emt_reg_x86 ix in
                    let _ = idx_csm_ptn s x in
                    e0^ed
                  |_ -> err "emt_ir cns" )
              | a,_ when a=Ast.Axm._nil ->
                let open Rcd_Ptn in
                ( match y with
                  | A v ->
                    let v_i = newvar () in
                    let i_i = idx_crt s v_i in
                    let ix = idx_ptn s x in
                    let e0 =
                      "; nil \n"^
                      "\tmov QWORD "^(emt_reg_x86 i_i)^",0\n"^
                      "\tbts r12,"^(string_of_int i_i)^"\n"^
                      (emt_ptn_crt_ptn s (R [|A i_i;ix|]) (A v)) in
                    let _ = idx_csm s v_i in
                    let ed = emt_dec_ptn s emt_reg_x86 ix in
                    let _ = idx_csm_ptn s x in
                    e0^ed
                  |_ -> err "emt_ir ⟦⟧" )
              | a,_ when a=Ast.Axm._sgn ->
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
              | a,_ when a=Ast.Axm._eq ->
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
              | a,_ when a=Ast.Axm._err ->
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
              | ep,af ->
                let open Rcd_Ptn in
                ( match af with
                  | Ctr j ->
                    ( match y with
                      | A v ->
                        ( match x with
                          | A vx ->
                            let ix = idx_csm s vx in
                            let er0 = mov_regs s in
                            let er1 = set_regs s in
                            let iy = idx_crt s v in
                            let lb_ctr0 = lb () in
                            let lb_ctr1 = lb () in
                            let lb_ctr2 = lb () in
                            "\tbtr r12,"^(string_of_int iy)^"\n"^
                            "\tmov rbx,"^(emt_reg_x86 ix)^"\n"^
                            "\tbt r12,"^(string_of_int ix)^"\n"^
                            "\tjc "^lb_ctr0^"\n"^
                            "\tbt rbx,0\n"^
                            "\tjc "^lb_ctr1^"\n"^
                            "\tmov r13,0x"^(Printf.sprintf "%02x" j)^"00_0000_0000_0001\n"^
                            "\tadd rbx,r13\n"^
                            "\tmov "^(emt_reg_x86 iy)^",rbx\n"^
                            "\tjmp "^lb_ctr2^"\n"^
                            lb_ctr0^":\n"^
                            er0^
                            "\tmov rdi,1\n"^
                            "\tcall mlc\n"^
                            "\tmov QWORD [rax+8*1],rbx\n"^
                            "\tbts QWORD [rax],17\n"^
                            "\tmov r13,0x"^(Printf.sprintf "%02x" j)^"00_0000_0000_0001\n"^
                            "\tadd rax,r13\n"^
                            "\tmov "^(emt_reg_x86 iy)^",rax\n"^
                            er1^
                            "\tjmp "^lb_ctr2^"\n"^
                            lb_ctr1^":\n"^
                            er0^
                            "\tmov rdi,1\n"^
                            "\tcall mlc\n"^
                            "\tmov QWORD [rax+8*1],rbx\n"^
                            "\tbts QWORD [rax],17\n"^
                            "\tbtr QWORD [rax],0\n"^
                            "\tmov r13,0x"^(Printf.sprintf "%02x" j)^"00_0000_0000_0001\n"^
                            "\tadd rax,r13\n"^
                            "\tmov "^(emt_reg_x86 iy)^",rax\n"^
                            er1^
                            lb_ctr2^":\n"
                          | R [||] ->
                            let iy = idx_crt s v in
                            "\tbtr r12,"^(string_of_int iy)^"\n"^
                            "\tmov rbx,0x0001_0000_0000_0000\n"^
                            "\tadd QWORD [unt],rbx\n"^
                            "\tlea QWORD rbx,[unt]\n"^
                            "\tmov "^(emt_reg_x86 iy)^",rbx\n"^
                            "\tmov rbx,0x"^(Printf.sprintf "%02x" j)^"00_0000_0000_0001\n"^
                            "\tadd "^(emt_reg_x86 iy)^",rbx\n"

                          | _ ->
                            let (iy,e0) = emt_get_crt_ptn s "r12" emt_reg_x86 (idx_ptn s x) in
                            Hashtbl.add s iy v;
                            let ed = emt_dec_ptn s emt_reg_x86 (idx_ptn s x) in
                            let _ = idx_csm_ptn s x in
                            "\tbtr r12,"^(string_of_int iy)^"\n"^
                            e0^
                            "\tmov r13,0x"^(Printf.sprintf "%02x" j)^"00_0000_0000_0001\n"^
                            "\tadd "^(emt_reg_x86 iy)^",r13\n"^
                            ed )
                      |_ -> err "emt_ir inj" )
                  | Etr_V ivf ->
                    let sf = Hashtbl.create 10 in
                    let i0 = Rcd_Ptn.map (fun (i,v) -> Hashtbl.add sf i v; i) ivf in
                    let _ = pnt true ((pnt_s sf)^","^(pnt_s s)^"\n") in
                    let ix = idx_ptn s x in
                    let cx = emt_ptn ix in
                    let (e1,sl) = push_ex s x in
                    let al = emt_ptn_1p s ix i0 in
                    let ixa = mov_ptn ix al in
                    let em = emt_ptn_mov s emt_reg_x86 al in
                    let _ =
                      Rcd_Ptn.map
                        (fun (n,v0) ->
                           if Hashtbl.mem s n then err "emt_ir v0"
                           else
                             Hashtbl.add s n v0) ivf in
                    let ex0 =
                      (emt_ptn_set_ptn s s "r12" emt_reg_x86 emt_reg_x86 ixa i0) in

                    let dec_x = emt_dec_ptn s emt_reg_x86 ixa in
                    let _ = Rcd_Ptn.map (fun n -> Hashtbl.remove s n) ixa in
                    let _ = Hashtbl.clear s in
                    let sp = pop_ex s sl in
                    let iy = idx_crt_ptn s y in
                    let cy = emt_ptn iy in
                    let c0 = cmt ("\t"^(pnt_name n)^" "^cx^" ⊢ "^cy^rtl^(print_ty y)) in
                    let l_0 = "call_c_"^(lb ()) in
                    let l_1 = "call_nc_"^(lb ()) in
                    c0^e1^em^
                    ex0^
                    dec_x^
                    "\tcall NS_E_"^(Sgn.print ep)^"\n"^
                    "\tmov QWORD [tmp],rax\n"^
                    "\tjc "^l_0^"\n"^
                    sp^
                    "\tmov rbx,[tmp]\n"^
                    "\tpush rbx\n"^
                    "\tmov QWORD [set_ptn_vct+8*1],rbx\n"^
                    "\tmov rbx,0\n"^
                    "\tmov QWORD [set_ptn_vct],rbx\n"^
                    (emt_set_ptn 0 s iy)^
                    (mov_regs s)^
                    "\tpop rdi\n"^
                    "\tcall dec_r\n"^
                    (set_regs s)^
                    "\tjmp "^l_1^"\n"^
                    l_0^":\n"^
                    sp^
                    "\tmov rbx,[tmp]\n"^
                    "\tmov QWORD [set_ptn_vct+8*1],rbx\n"^
                    "\tmov rbx,1\n"^
                    "\tmov QWORD [set_ptn_vct],rbx\n"^
                    (emt_set_ptn 0 s iy)^
                    l_1^":\n"
                  | _ -> err "met_ir etr 3"
                )
            )
          | IR_Glb_Out(o,x) ->
            let (ep,_) = !(get_ns_e !ns o) in
            let i = idx_min 0 s in
            let ix = idx_ptn s x in
            let e_0 = emt_get_ptn s "r12" emt_reg_x86 ix i in
            let e_1 = emt_dec_ptn s emt_reg_x86 ix in
            let _ = idx_csm_ptn s x in
            let (ep0,l) = push_reg s x86_reg_lst in
            let ep1 = pop_reg l in
            let lb0 = "LB_"^(Sgn.print (sgn ())) in
            e_0^
            "\tmov rbx,0\n"^
            "\tsetc bl\n"^
            "\tmov r14,QWORD [out_tp_p]\n"^
            "\tshl r14,3\n"^
            "\tmov QWORD [out_vct+r14+2*r14],rbx\n"^
            "\tmov rbx,"^(emt_reg_x86 i)^"\n"^
            "\tmov QWORD [out_vct+r14+2*r14+8*1],rbx\n"^
            "\tmov rbx,QWORD NS_E_RDI_"^(Sgn.print ep)^"\n"^
            "\tmov QWORD [out_vct+r14+2*r14+8*2],rbx\n"^
            "\tadd QWORD [out_tp_p],1\n"^
            "\tand QWORD [out_tp_p],0xff\n"^
            "\tadd QWORD [out_n],1\n"^
            e_1^
            "\tmov rbx,QWORD [out_n]\n"^
            "\tcmp rbx,128\n"^
            "\tjnz "^lb0^"\n"^
            ep0^
            "\tcall exec_out\n"^
            ep1^
            lb0^":\n"
          | IR_Exp(Ast.Atm(Ast.Stg c),_,Rcd_Ptn.A r) ->
            let bs = Bytes.of_string c in
            let (ep,l) = push_reg s x86_reg_lst in
            let sl = Bytes.length bs in
            let bl = sl / 8 in
            let m = sl mod 8 in
            let ir = idx_crt s r in
            let c0 = cmt ("\t» "^(print_exp (Ast.Atm(Ast.Stg c)))^" |~ "^(emt_ptn (Rcd_Ptn.A ir))^rtl^(print_ty (Rcd_Ptn.A r))) in
            let rec lp_m i =
              if i=m then ""
              else
                "\tmov BYTE [rdi+8*1+rsi],"^(string_of_int(Char.code c.[8*bl+i]))^"\n"^
                "\tadd rsi,1\n"^
                (lp_m (i+1))            in
            let rec lp i =
              if i=bl
              then
                "\tmov QWORD [rdi+8*1+rsi],0\n"^
                (lp_m 0)
              else
                let s_i = String.sub c (8*i) 8 in
                "\tmov rbx,`"^(String.escaped s_i)^"`\n"^
                "\tmov QWORD [rdi+8*1+rsi],rbx\n"^
                "\tadd rsi,8\n"^
                (lp (i+1)) in
            let e0 =
              ep^
              (*"\tmov rdi,"^(string_of_int ((sl+mx)/8))^"\n"^ *)
              "\tmov rdi,"^(string_of_int sl)^"\n"^
              "\tcall mlc_s8\n"^
              "\tmov rdi,rax\n"^
              "\tmov rsi,0\n"^
              (lp 0)^
              "\tmov rbx,rdi\n"^
              (pop_reg l)^
              "\tmov "^(emt_reg_x86 ir)^",rbx\n"^
              (* "\tbts r12,"^(string_of_int ir)^"\n" *)
              "\tand r12,~"^(emt_0b ir)^"\n" in
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
          | IR_Exp(Ast.Atm(Name f),_,Rcd_Ptn.A r) ->
            let (epf,_) = (try !(get_ns_e !ns f) with _ -> err "emt_ir a2") in
            let ir = idx_crt s r in
            let c0 = cmt ("\t» "^(pnt_name f)^" _ ⊢ "^(emt_ptn (Rcd_Ptn.A ir))^rtl^(print_ty (Rcd_Ptn.A r))) in
            let im = idx_min 0 s in
            let rm = emt_reg_x86 im in
            let e0 =
              "\tmov QWORD [tmp],rbx\n"^
              "\tmov rbx,0x0001000000000000\n"^
              "\tadd QWORD [NS_E_DYN_"^(Sgn.print epf)^"],rbx\n"^
              "\tmov rbx,QWORD [tmp]\n"^
              "\tmov QWORD "^rm^",NS_E_DYN_"^(Sgn.print epf)^"\n"^
              (*"\tmov QWORD "^(emt_reg ir)^","^rm^"\n" *)
              (mov_idx im ir)
              (* "\tbts r12,"^(string_of_int ir)^"\n" *)
              ^"\tand r12,~"^(emt_0b ir)^"\n" in
            c0^e0
          | IR_S8 (pl,rs0,rs1) ->
            let c0 = cmt ("» _^ ..") in
            let rc0 = Array.map (fun _ -> 0) rs0 in
            let (ep0,l) = push_reg s x86_reg_lst in
            let ep1 = pop_reg l in
            let ir = idx_crt s rs1.(0) in
            let is0 = Array.map (fun v -> idx_csm s v) rs0 in
            let ir1 =
              Array.mapi
                (fun i v ->
                   if i=0 then ir
                   else
                     let i0 = is0.(i-1) in
                     Hashtbl.add s i0 v; i0 ) rs1 in
            let rec len l =
              ( match l with
                | [] -> 0
                | hd::tl ->
                  let n_hd =
                    ( match hd with
                      | S8_Txt s -> String.length s
                      | S8_Name n ->
                        let e = get_ns_e !ns n in
                        ( match !e with
                          | (_,Cst_Stt(Cst.S8 s0)) -> String.length s0
                          | _ -> err "emt_ir _^ 0" )
                      | S8_Var i -> rc0.(i) <- rc0.(i)+1; 0 ) in
                  n_hd+(len tl)
              ) in
            let len0 = len pl in
            let e0 =
              c0^
              ep0^
              "\tmov rbx,"^(string_of_int len0)^"\n"^
              "\tmov r15,0\n"^
              "\tmov r13,0\n" in
            let (_,e_a) =
              (Array.fold_left
                 (fun (i,e_a) c ->
                    let e_i =
                      "\tmov r14,"^(emt_reg_x86 is0.(i))^"\n"^
                      "\tmov r14,[r14]\n"^
                      "\tmov r15,r14\n"^
                      "\tshl r14,16\n"^
                      "\tshr r14,48\n"^
                      "\tshl r14,3\n"^
                      "\tand r15,0b111\n"^
                      "\tsub r14,r15\n"^
                      "\timul r14,"^(string_of_int c)^"\n"^
                      "\tadd rbx,r14\n" in
                    (i+1,e_a^e_i)) (0,"") rc0) in
            let e_1 =
              "\tmov r14,rbx\n"^
              "\tand r14,0b111\n"^
              "\tmov r15,0b1000\n"^
              "\tsub r15,r14\n"^
              "\tmov rdi,rbx\n"^
              "\tshr rdi,3\n"^
              "\tadd rdi,1\n"^
              "\tcall mlc\n"^
              "\tmov r13,[rax]\n"^
              "\tand r13,~0xffff\n"^
              "\tadd r13,r15\n"^
              "\tbts r13,16\n"^
              "\tmov [rax],r13\n"^
              "\tmov r13,rax\n"^
              ep1^
              "\tmov r14,0\n"^
              (List.fold_left
                 (fun e_p p ->
                    match p with
                    | Ast.S8_Txt s ->
                      let l_s = String.length s in
                      let rec lp i =
                        if i<l_s
                        then
                          "\tmov BYTE [r13+8*1+r14],"^(string_of_int(Char.code s.[i]))^"\n"^
                          "\tadd r14,1\n"^
                          (lp (i+1))
                        else "" in
                      e_p^
                      "; \""^(String.escaped s)^"\"\n"^
                      (lp 0)
                    | Ast.S8_Var i ->
                      let lb_0 = "LB_"^(Sgn.print (sgn ())) in
                      let lb_1 = "LB_"^(Sgn.print (sgn ())) in
                      e_p^
                      "; "^(string_of_int i)^"\'\n"^
                      "\tmov r15,"^(emt_reg_x86 is0.(i))^"\n"^
                      "\tadd r15,8\n"^
                      lb_0^":\n"^
                      "\tmov bl,[r15]\n"^
                      "\tcmp rbx,0\n"^
                      "\tjz "^lb_1^"\n"^
                      "\tmov BYTE [r13+8*1+r14],bl\n"^
                      "\tadd r14,1\n"^
                      "\tadd r15,1\n"^
                      "\tjmp "^lb_0^"\n"^
                      lb_1^":\n"
                    | Ast.S8_Name n ->
                      let e = get_ns_e !ns n in
                      ( match !e with
                        | (_,Cst_Stt(Cst.S8 s)) ->
                          let l_s = String.length s in
                          let rec lp i =
                            if i<l_s
                            then
                              "\tmov BYTE [r13+8*1+r14],"^(string_of_int(Char.code s.[i]))^"\n"^
                              "\tadd r14,1\n"^
                              (lp (i+1))
                            else "" in
                          e_p^
                          "; \""^(String.escaped s)^"\"\n"^
                          (lp 0)
                        | _ -> err "emt_ir _^ 0" ) )
                 "" pl
              )^
              "; //\n"^
              "\tmov BYTE [r13+8*1+r14],0\n"^
              "\tmov "^(emt_reg_x86 ir1.(0))^",r13\n"^
              "\tbtr r12,"^(string_of_int ir1.(0))^"\n" in
            e0^e_a^e_1
          | _ -> err "emt_etr 0" ) in
      s0^(emt_ir ns s p1) )
