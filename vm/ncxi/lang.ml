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
module RSet = struct
  type t = bool array
  let ini () = Array.make 64 false
  let min_0 v =
    let rec lp i =
      if i=64 then err "RSet.min 0"
      else
        let b = v.(i) in
        if b=false then i else lp (i+1) in
    lp 0
  let max_1 v =
    let rec lp i =
      if i=(-1) then (-1)
      else
        let b = v.(i) in
        if b=true then i else lp (i-1) in
    lp 63
  let or_v v0 v1 = Array.init 64 (fun i -> v0.(i)||v1.(i))
  let and_v v0 v1 = Array.init 64 (fun i -> v0.(i)&&v1.(i))
  let not_v v0 = Array.init 64 (fun i -> not v0.(i))
  let sub_f b0 b1 =
    ( match b0,b1 with
      | _,true -> false
      | _ -> b0 )
  let sub v0 v1 = Array.init 64 (fun i -> sub_f v0.(i) v1.(i))
  let is_zero v = not(Array.fold_left (fun b x -> b||x) false v)
end
module Rcd_Ptn = struct
  type 'a t =
    | R of ('a t) array
    | A of 'a
  let rec print f p =
    ( match p with
      | A r -> f r
      | R r -> "{ "^(Util.string_of_list " " (print f) (Array.to_list r))^" }" )
  let rec to_list p =
    ( match p with
      | A r -> [r]
      | R rs -> Array.fold_left (fun l r -> (to_list r) @ l) [] rs
      (*| _ -> [] *))
  let rec map f p =
    ( match p with
      | A r -> A (f r)
      | R rs -> R (Array.map (map f) rs) )
end
module RP = Rcd_Ptn
module Types = struct
  type level = int
  type v_p = Sgn.t
  type ('y, 'k) v_t =
    | WC of 'k | V of 'k * level | Q of 'k * level | Ln of 'y
    | N of name | N_Ln of name * 'y
  and v = (t, unit) v_t
  and k =
    | K1 of {
        hd : Sgn.t;
        mutable ps : int;
        mutable tl : k array;
      }
    | Q1 of Sgn.t
  and k_e =
    | Ax1 of k
    | App1 of k_e * k_e
    | Abs1 of Sgn.t * k_e
    | A1 of Sgn.t
  and t =
    | Abs of v ref * t
    | Var of v ref | App of t * t
    | Axm of Sgn.t
    | Imp of t * t | Rcd of t_rcd
  and v_rcd = (t_rcd, unit) v_t
  and t_rcd = | Cns of t * t_rcd | Uo of v_rcd ref | U
  type print = { vl : (v ref) list; }
  type rm = (string * v ref) list ref
  let rm:rm = ref []
  let v_vct:((v ref) list ref) = ref []
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
  let rec print y =
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
          | Ln y -> print y
          | N n -> pnt_name n
          | N_Ln (n,y) -> (pnt_name n)^"(="^(print y)^")" )
      | App(y0,y1) -> "("^(print y0)^")◂("^(print y1)^")"
      | Imp(y0,y1) -> (print y0)^"→"^(print y1)
      | Rcd r -> "{ "^(print_rcd r)^"}"
      | Abs(v,y) ->
        let i =fst @@ (BatList.findi (fun _ vi -> vi==v) !v_vct)in
        "∀["^(string_of_int i)^"]."^(print y)
    )
  and print_t y = print y
  and print_rcd r =
    ( match r with
      | U -> ""
      | Uo { contents = Ln r0 } -> print_rcd r0
      | Uo _ -> "<"
      | Cns(t0,t1) -> (print t0)^" "^(print_rcd t1) )
  and print_nr nr = "{> "^(StgSet.fold (fun lb p -> p^lb^"~| ") nr "")^"<}"
  let new_wc () = newvar ()
  let rcd_cl l = List.fold_right (fun x r -> Cns(x,r)) l U
  let rcd_op l = List.fold_right (fun x r -> Cns(x,r)) l (Uo (ref (WC ())))
  let unt () = Rcd U
  let rec rcd_cns l t =
    ( match t with
      | Rcd t -> List.fold_right (fun x r -> Cns(x,r)) l t
      | Var { contents = Ln y } -> rcd_cns l y
      | _ -> err ("rcd_cns:"^(print t)) )
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
      | _ -> () )
  and mk_abs_rcd rl x r =
    ( match r with
      | Cns(y0,y1) -> mk_abs rl x y0; mk_abs_rcd rl x y1
      | U -> ()
      | Uo { contents = Ln y } -> mk_abs_rcd rl x y
      | _ -> () )
end
let lb () = "LB_"^(Sgn.print (sgn ()))
module R = struct
  type t = r_atm RP.t
  and r_atm =
    | Idx of int
    | Agl of int * int * t
    | AglStt of int * int * t
    | Etr of int * t
  type subst = (int * int) list
  let rec print a = RP.print print_atm a
  and print_atm a =
    ( match a with
      | Idx i -> (string_of_int i)^"\'"
      | Agl(ia,_,i) -> (string_of_int ia)^"\'◂"^(print i)
      | AglStt(i0,_,r) -> "°"^(string_of_int i0)^"◂"^(print r)
      | Etr(ie,i) -> (string_of_int ie)^"[◂]"^(print i) )
end
type v_r = R.t ref
let pnt_v_r v = R.print !v

module Cst = struct
  type t =
    | S8 of string
    | R64 of int64
  let print c =
    ( match c with
      | S8 s -> "\""^(String.escaped s)^"\""
      | R64 x -> "0xr"^(Int64.format "%x" x))
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
  type stt_name = Stt_Name of abs_name | Stt_Axm of Sgn.t
  type axm0 = stt_name ref
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
    | Rcd of exp_rcd array
    | App of exp_rcd * exp_rcd
    | ExpCst of Cst.t | Name of axm0
  and r = Types.v ref
  and r_p = Sgn.t
  and r_n = R_N of string | R_Ax of r_a
  and r_a = R_A of Sgn.t | R_WC of Sgn.t
  and r_n_v = r_n ref
  and ptn = r_n_v RP.t
  and pt = ir_code ref
  and etr = ptn * pt
  and mtc_ptn = ptn * (r_n_v * eq ref) list * ((v_p list * v_p list) option)
  and ptn_eq = ptn
  and eq =
    | Eq_Agl of Sgn.t * int * int * ptn
    | Eq_Agl_N of axm0 * ptn
    | P_Cst of cst
  and mtc_v_k = (r_a * mtc_v_k_atm) RP.t
  and mtc_v_k_atm =
    | Mtc_R of mtc_v_k
    | Mtc_R_Top
    | Mtc_R_Cst of cst
    | Mtc_R_Agl of int * int * mtc_v_k

  and mtc_v_set = mtc_v_set_ptn list
  and mtc_v_set_ptn = mtc_v_set_atm RP.t
  and mtc_v_set_atm =
    | Mtc_Agl of int * int * mtc_v_set_ptn
    | Mtc_Cst
    | Mtc_Top
  and cst =
    | P_N of axm0
    | P_Z of int
    | P_R64 of int64
    | P_R2 of bool
    | P_Stg of string
  and p_sig = string
  and ir_code =
    | Seq of nd * ir_code
    | Ret of ptn
    | Exn of r_n_v
    | Mtc of ptn * ((mtc_ptn * ir_code) array)
    | IL_Glb_Call of axm0 * ptn
    | Clj of ptn * ir_code
  and nd =
    | IR_Id of id_t ref
    | IR_Glb_Call of axm0 * ptn * ptn
    | IR_Glb_Out of axm0 * ptn
    | IR_Out of r_n_v * ptn
    | IR_Exp of exp_rcd * ptn * ptn
    | IR_S8 of s8_t ref
  and s8_t =
    | IR_S8_C of s8_ptn list * (r_n_v array) * (r_n_v array)
    | IR_S8_T of s8_ptn list * r_a array * r_a
  and id_t =
    | IR_Id_C of ptn * (ptn array)
    | IR_Id_Ax of (Sgn.t * id_v array) RP.t
  and id_v =
    | Id_Rl of r_a RP.t
    | Id_UnRl of Sgn.t * path
    | Id_WC
  and path = int list
  and s8_ptn =
      S8_Txt of string
    | S8_Name of axm0 | S8_Var of int
  type line =
    | End | Line of exp_rcd
  type grm = etr Grm.t
  type ns = (string * Types.v ref) list ref
  type ns_t = (string * Types.v ref) list ref
  type inst = {
    al:(v ref * v ref) list;
    al_rcd:(v_rcd ref * v_rcd ref) list;
  }
  type e_k = Sgn.t * e_k_v
  and e_k_v =
    | Etr_V of R.t * R.t
    | Ctr of int * int
    | Prs
    | Cst_Stt of Cst.t
    | Cst_Dyn
    | E_K_WC
  type ns_m_k =
    | M_WC | M_Prm of string
  type ns_v =
    { mutable root : (ns_v ref) option;
      mutable ns_p : (string * Sgn.t) list;
      mutable ns_t : (string * Types.v ref) list;
      mutable ns_m : (string * ns_v ref) list;
      mutable ns_m_t : (string * ns_m_k ref) list;
    }
  type g_ns_v = {
    mutable ns : (Sgn.t * Types.v ref) list;
    mutable ns_e : (Sgn.t * e_k_v ref) list;
    mutable ns_r_t : (Sgn.t * Types.v ref) list;
    mutable ns_r_i : (Sgn.t * v_r) list;
  }
  type glb_ns_v =
    { mutable ns_e_vct : (e_k ref * Types.v ref) list;
    }
  let init_ns () =
    { root=None; ns_p=[];  ns_t=[]; ns_m=[]; ns_m_t=[];  }
  let init_gns () =
    { ns=[]; ns_e=[]; ns_r_t=[]; ns_r_i=[]  }
  module Axm = struct
    let _emt_q = sgn ()
    let _app = sgn ()
    let _out = sgn ()
    let _emt = sgn ()
    let _fop = sgn ()
    let _frd = sgn ()
    let _fwt = sgn ()
    let _pp_v = sgn ()
    let _wt = sgn ()
    let _rd = sgn ()
    let _cd = sgn ()
    let _err = sgn ()
    let _setge = sgn ()
    let _add = sgn ()
    let _mov = sgn ()
    let _mov_x = sgn ()
    let _sub = sgn ()
    let _dec = sgn ()
    let _inc = sgn ()
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
  let pnt_stt_name n =
    ( match n with
      | Stt_Name n -> pnt_name n
      | Stt_Axm a when a=Axm._app -> "_app"
      | Stt_Axm a when a=Axm._emt -> "_emt"
      | Stt_Axm a when a=Axm._some -> "_some"
      | Stt_Axm a when a=Axm._none -> "_none"
      | Stt_Axm a when a=Axm._cns -> "_cns"
      | Stt_Axm a when a=Axm._nil -> "_nil"
      | Stt_Axm a when a=Axm._sgn -> "_sgn"
      | Stt_Axm a when a=Axm._pp_v -> "_pp_v"
      | Stt_Axm a -> "_f"^(Sgn.print a)
    )
  let rec pnt_ptn r =
    Rcd_Ptn.print (fun r -> pnt_r r) r
  and pnt_r r =
    ( match !r with
      | R_N n -> "%"^n
      | R_Ax a -> pnt_r_a a )
  and pnt_r_a a =
    ( match a with
      | (R_A p) -> "%_"^(Sgn.print p)
      | R_WC p -> "_("^(Sgn.print p)^")" )
  (*
let print_v v =
    ( try let (n,_) = List.find (fun (_,w) -> v==w) !Types.rm in n
      with _ -> "_r"^(string_of_int (Types.print_v Types.v_vct v)))
*)
  let rec print_test e =
    ( match e with
      | Eq_Agl(p,i,i_n,r) -> "_c"^(Sgn.print p)^"(°"^(string_of_int i)^"<"^(string_of_int i_n)^")◂"^(pnt_ptn r)
      | Eq_Agl_N(n,r) -> (pnt_stt_name !n)^"◂"^(pnt_ptn r)
      | P_Cst c -> pnt_cst c )
  and pnt_cst c =
    ( match c with
      | P_N n -> pnt_stt_name !n
      | P_Stg s -> "\""^s^"\""
      | P_Z z -> (string_of_int z)
      | P_R64 x -> "0xr"^(Int64.format "%x" x)
      | P_R2 false -> "0x2r0"
      | P_R2 true -> "0x2r1" )
  let print_mtc p =
    let (r,es,_) = p in
    let s0 = pnt_ptn r in
    let s1 =
      List.fold_left
        ( fun s1 (v,e) ->
            let sv = s1^","^(pnt_r v)^"=" in
            let st = print_test !e in
            sv^st )
        "" es in
    s0^" ,"^s1
  let rec print_mtc_v_k p =
    RP.print
      ( fun (n,a) ->
          ( match a with
            | Mtc_R r -> (pnt_r_a n)^"(="^(print_mtc_v_k r)^")"
            | Mtc_R_Top -> (pnt_r_a n)
            | Mtc_R_Cst c -> (pnt_r_a n)^"(="^(pnt_cst c)^")"
            | Mtc_R_Agl(i0,_,r) -> (pnt_r_a n)^"(=°"^(string_of_int i0)^"◂"^(print_mtc_v_k r)^")"
          ))
      p
  let rec print_mtc_set p =
    RP.print
      ( fun a ->
          match a with
          | Mtc_Cst -> "_*"
          | Mtc_Top -> "_"
          | Mtc_Agl(i0,_,r) -> "°"^(string_of_int i0)^"◂"^(print_mtc_set r) )
      p

  let mk_idx r =
    ( match !r with
      | R_Ax p -> p
      | _ -> err "mk_idx 0" )
  let rec mk_idx_ptn r =
    ( match r with
      | RP.A { contents=R_Ax p } -> RP.A p
      | RP.R rs -> RP.R (Array.map mk_idx_ptn rs)
      | _ -> err "mk_idx_ptn 0" )
  let mtc_is_empty ms =
    ( match ms with
      | [] -> true
      | _ -> false )
  let rec mk_mtc_v_k_ptn p0 p1 =
    ( match p0,p1 with
      | _,RP.A a ->
        ( match a with
          | R_A p
          | R_WC p -> ([(p0,a)],RP.A(p,Mtc_R_Top)) )
      | RP.A a0,RP.R rs1 ->
        ( match a0 with
          | R_A p -> ([],RP.A(p,Mtc_R(RP.R(Array.map mk_mtc_v_k rs1))))
          | R_WC _ -> err "mk_mtc_v_k 0" )
      | RP.R rs0,RP.R rs1 ->
        let (_,l0,rsp) =
          Array.fold_left
            ( fun (i,l0,rsp) ri0 ->
                let ri1 = rs1.(i) in
                let (l1,ri_k) = mk_mtc_v_k_ptn ri0 ri1 in
                (i+1,l0@l1,rsp |+| [|ri_k|]))
            (0,[],[||]) rs0 in
        (l0,RP.R rsp) )
  and mk_mtc_v_k p0 =
    ( match p0 with
      | RP.R rs -> RP.R (Array.map mk_mtc_v_k rs)
      | RP.A p -> RP.A(p,Mtc_R_Top) )
  and mk_mtc_v_k_eq p0 v0 e0 =
    Util.pnt true ("enter mk_mtc_v_k_eq:"^(print_mtc_v_k p0)^","^(pnt_r_a v0)^","^(print_test e0)^"\n");
    ( match p0 with
      | RP.R rs -> RP.R(Array.map (fun r -> mk_mtc_v_k_eq r v0 e0) rs)
      | RP.A(q0,ra) ->
        if q0=v0 then
          let ra0 =
            ( match ra,e0 with
              | Mtc_R_Top,_ ->
                ( match e0 with
                  | Eq_Agl(_,i0,i_n,ra) ->
                    Mtc_R_Agl(i0,i_n,mk_mtc_v_k(mk_idx_ptn ra))
                  | P_Cst c0 -> Mtc_R_Cst c0
                  | _ -> err "mk_mtc_v_k_eq 3" )
              | Mtc_R_Cst c0,P_Cst c1 ->
                if c0=c1 then Mtc_R_Cst c0
                else err "mk_mtc_v_k_eq 4"
              | Mtc_R_Agl(i0,i_n,ra0),Eq_Agl(_,i1,i_n1,ra1) ->
                if i0=i1&&i_n=i_n1 then
                  Mtc_R_Agl(i0,i_n,mk_mtc_v_k_eq_and ra0 ra1)
                else err "mk_mtc_v_k_eq 5"
              | _ -> err "mk_mtc_v_k_eq 6"
            ) in
          RP.A(q0,ra0)
        else
          ( match ra with
            | Mtc_R r0 -> RP.A(q0,Mtc_R(mk_mtc_v_k_eq r0 v0 e0))
            | Mtc_R_Agl(i0,i_n,r0) -> RP.A(q0,Mtc_R_Agl(i0,i_n,mk_mtc_v_k_eq r0 v0 e0))
            | _ -> p0 ) )
  and mk_mtc_v_k_eq_and ra e0 =
    Util.pnt true ("enter mk_mtc_v_k_eq_and:"^(print_mtc_v_k ra)^","^(pnt_ptn e0)^"\n");
    ( match ra,e0 with
      | RP.R rs0,RP.R rs1 ->
        let (_,a) =
          Array.fold_left
            ( fun (i,a) ri0 ->
                let ri1 = rs1.(i) in
                let p1 = mk_mtc_v_k_eq_and ri0 ri1 in
                (i+1,a |+| [|p1|]) )
            (0,[||]) rs0 in
        RP.R a
      | RP.A(q0,Mtc_R r),_ -> RP.A(q0,Mtc_R(mk_mtc_v_k_eq_and r e0))
      | RP.A(q0,Mtc_R_Top),_ -> RP.A(q0,Mtc_R(mk_mtc_v_k(mk_idx_ptn e0)))
      | RP.A(q0,Mtc_R_Cst c),RP.A a -> RP.A(q0,Mtc_R(RP.A(mk_idx a,Mtc_R_Cst c)))
      | RP.A(q0,Mtc_R_Agl(i0,i_n,ra)),RP.A a -> RP.A(q0,Mtc_R(RP.A(mk_idx a,Mtc_R_Agl(i0,i_n,ra))))
      | _ -> err "mk_mtc_v_k_eq_and 2"
    )
  let rec mtc_and ms0 ms1 =
    ( match ms0 with
      | ms0_hd::ms0_tl ->
        let l0 = mtc_and_ptn_lst ms0_hd ms1 in
        let l1 = mtc_and ms0_tl ms1 in
        l0@l1
      | [] -> [] )
  and mtc_and_ptn_lst p0 ms1 =
    ( match ms1 with
      | ms1_hd::ms1_tl ->
        let l1 = mtc_and_ptn_lst p0 ms1_tl in
        ( match mtc_and_ptn_ptn p0 ms1_hd with
          | Some a0 -> a0::l1
          | None -> l1 )
      | [] -> [] )
  and mtc_and_ptn_ptn p0 p1 =
    ( match p0,p1 with
      | RP.A(Mtc_Top),p1
      | p1,RP.A(Mtc_Top) -> Some p1
      | RP.A(Mtc_Agl(_,_,_)),RP.R _
      | RP.R _,RP.A(Mtc_Agl(_,_,_)) -> None
      | RP.A(Mtc_Agl(ia0,ian0,ra0)),RP.A(Mtc_Agl(ia1,ian1,ra1)) ->
        if ia0=ia1&&ian0=ian1 then
          ( match mtc_and_ptn_ptn ra0 ra1 with
            | Some a0 ->  Some(RP.A(Mtc_Agl(ia0,ian1,a0)))
            | None -> None )
        else None
      | RP.R rs0,RP.R rs1 ->
        let (_,a) =
          Array.fold_left
            ( fun (i,a) ri0 ->
                ( match a with
                  | Some a0 ->
                    let ri1 = rs1.(i) in
                    ( match mtc_and_ptn_ptn ri0 ri1 with
                      | Some p1 ->
                        (i+1,Some(a0 |+| [|p1|]))
                      | None -> (i+1,None) )
                  | None -> (i+1,None) ))
            (0,Some [||]) rs0 in
        ( match a with
          | Some a0 -> Some (RP.R a0)
          | None -> None )
      | _ -> err "mtc_and_ptn_ptn 1"     )
  let rec mk_mtc_set p =
    ( match p with
      | RP.A(_,Mtc_R_Top) -> RP.A Mtc_Top
      | RP.A(_,Mtc_R_Cst _) -> RP.A Mtc_Cst
      | RP.A(_,Mtc_R r) -> mk_mtc_set r
      | RP.A(_,Mtc_R_Agl(i0,i_n,r)) -> RP.A(Mtc_Agl(i0,i_n,mk_mtc_set r))
      | RP.R rs -> RP.R(Array.map mk_mtc_set rs)
    )
  let rec mtc_sub_ms ms0 ms1 =
    List.fold_left
      ( fun ms2 p1 -> mtc_sub_ms_ptn ms2 p1)
      ms0 ms1
  and mtc_sub_ms_ptn ms0 p1 =
    List.fold_left
      (fun ms2 p0 -> ms2@(mtc_sub_ptn_ptn p0 p1))
      [] ms0

  and mtc_sub ms0 ms1 =
    ( match ms0,ms1 with
      | [],_ -> []
      | ms0_hd::ms0_tl,_ ->
        let l0 = mtc_sub_ptn_lst ms0_hd ms1 in
        let l1 = mtc_sub ms0_tl ms1 in
        l0@l1 )
  and mtc_sub_ptn_lst p0 ms1 =
    ( match ms1 with
      | [] -> [p0]
      | ms1_hd::ms1_tl ->
        let l0 = mtc_sub_ptn_ptn p0 ms1_hd in
        let l1 = mtc_sub l0 ms1_tl in
        l1
    )
  and mtc_sub_ptn_ptn p0 p1 =
    let c0 = (print_mtc_set p0)^","^(print_mtc_set p1)^"\n" in
    ( match p0,p1 with
      | _,RP.A Mtc_Top -> []
      | RP.A Mtc_Top,RP.A(Mtc_Agl(i0,i_n,pa)) ->
        let rec l0 i =
          if i<i_n then
            if i=i0 then l0 (i+1)
            else
              let a_i = RP.A(Mtc_Agl(i,i_n,RP.A Mtc_Top)) in
              a_i::(l0 (i+1))
          else [] in
        let l0 = l0 0 in
        let l1 = mtc_sub_ptn_ptn (RP.A Mtc_Top) pa in
        let l1 = List.map (fun a -> RP.A(Mtc_Agl(i0,i_n,a))) l1 in
        l0@l1
      | RP.A(Mtc_Agl(i0,i0_n,pa0)),RP.A(Mtc_Agl(i1,i1_n,pa1)) ->
        if i0_n=i1_n then
          if i0=i1 then
            let l0 = mtc_sub_ptn_ptn pa0 pa1 in
            let l0 = List.map ( fun a -> RP.A(Mtc_Agl(i0,i0_n,a))) l0 in
            l0
          else
            [p0]
        else err "mtc_sub_ptn_ptn 0"
      | RP.R _,RP.A(Mtc_Agl _) -> err "mtc_sub_ptn_ptn 5"
      | _,RP.A(Mtc_Cst) -> [p0]
      | RP.A(Mtc_Top),RP.R rs1 ->
        let rs0 = Array.map (fun _ -> RP.A Mtc_Top) rs1 in
        mtc_sub_ptn_ptn (RP.R rs0) (RP.R rs1)
      | RP.A(Mtc_Agl _),RP.R _ -> err "mtc_sub_ptn_ptn 6"
      | RP.R rs0,RP.R rs1 ->
        let rs_b = Array.mapi (fun i r -> mtc_sub_ptn_ptn r rs1.(i)) rs0 in
        let n = Array.length rs_b in
        let (_,l0) =
          Array.fold_left
            ( fun (i,l0) li ->
                let ai =
                  List.map
                    (fun a -> RP.R(Array.init n (fun j -> if i=j then a else RP.A Mtc_Top)))
                    li in
                (i+1,l0@ai) )
            (0,[]) rs_b in
        l0
      | _ -> err ("mtc_sub_ptn_ptn 7:"^c0) )
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
                  | None -> err @@ "find_ns 2:"^(pnt_name n) )
              | _ -> err "find_ns 3" )))
  let get_ns gns n = ( try List.assoc n gns.ns with _ -> err "get_ns 0" )
  let get_ns_p ns n =
    find_ns `Fst ns n (fun ns n -> try Some(List.assoc n ns.ns_p) with _ -> None)
  let get_ns_t ns n =
    find_ns `Fst ns n (fun ns n -> try Some(List.assoc n ns.ns_t) with _ -> None)
  let get_ns_m_t ns n =
    find_ns `Fst ns n (fun ns n -> try Some(List.assoc n ns.ns_m_t) with _ -> None)
  let get_ns_m ns n =
    find_ns `Fst ns n (fun ns n -> try Some(List.assoc n ns.ns_m) with _ -> None)
  let get_ns_e gns n = List.assoc n gns.ns_e
  (* find_ns `Fst ns n (fun ns n -> try Some(List.assoc n ns.ns_e) with _ -> None) *)
  let slv_ns0 ns n0 =
    ( match !n0 with
      | Stt_Name n ->
        let p = get_ns_p ns n in
        n0 := Stt_Axm p;
        p
      | Stt_Axm p -> p )
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
               ss^"\t∐ "^(Types.print y)^" : "^n^"\n")
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

let rec print_etr ((r,p):etr) =
  " "^(pnt_ptn r)^"\n"^(print_ir !p)
and print_ir p0 =
  ( match p0 with
    | Seq (o,p1) -> "\t"^(print_nd o)^"\n"^(print_ir p1)
    | Ret r -> "\t∎ "^(pnt_ptn r)^"\n"
    | Exn r -> "\t∎| "^(pnt_r r)^"\n"
    | Mtc(r,ps) -> "\t\\\\ "^(pnt_ptn r)^"\n"^(print_ir_mtc ps)
    | IL_Glb_Call(n,r) -> "\t"^(pnt_stt_name !n)^"\t"^(pnt_ptn r)^" ⊢|\n"
    | Clj _ -> err "print_ir 0"
  )
and print_line p0 =
  Util.pnt true "F0\n";
  ( match p0 with
    | Seq (o,_) -> (print_nd o)^"\n"
    | Ret r -> "∎ "^(pnt_ptn r)^"\n"
    | Exn r -> "∎| "^(pnt_r r)^"\n"
    | Mtc(r,_) -> "\t\\\\ "^(pnt_ptn r)^"\n"
    | IL_Glb_Call(n,r) -> (pnt_stt_name !n)^"\t"^(pnt_ptn r)^" ⊢|\n"
    | Clj _ -> err "print_line 0"  )
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
and pnt_mtc_ptn e = print_mtc e
and pnt_s8_ptn p =
  ( match p with
    | S8_Txt s -> "\""^s^"\""
    | S8_Name n -> pnt_stt_name !n
    | S8_Var i -> (string_of_int i)^"\'" )
and print_nd o =
  ( match o with
    | IR_S8 { contents=IR_S8_C(pl,rs0,rs1) } ->
      "» _^ "^(Arr.fld_l (fun s r -> s^","^(pnt_r r)) "" rs0)^" ⊢ "^(Arr.fld_l (fun s r -> s^","^(pnt_r r)) "" rs1)^"\n"^
      "\t"^(List.fold_left (fun s p -> s^" "^(pnt_s8_ptn p)) "" pl)^" //\n"
    | IR_S8 { contents=IR_S8_T(pl,rs0,_) } ->
      "» _^ "^(Arr.fld_l (fun s r -> s^","^(pnt_r_a r)) "" rs0)^" ⊢ ..\n"^
      "\t"^(List.fold_left (fun s p -> s^" "^(pnt_s8_ptn p)) "" pl)^" //\n"
    | IR_Id id ->
      ( match !id with
        | IR_Id_C(r,rs) -> "$ "^(pnt_ptn r)^" ⊢ "^(Arr.fld_l (fun s r -> s^","^(pnt_ptn r)) "" rs)^rtl^(Arr.fld_l (fun s r -> s^","^(pnt_ptn r)) "" rs)
        | IR_Id_Ax al ->
          RP.print
            ( fun (_,as0) ->
                Array.fold_left
                  ( fun s0 a ->
                      match a with
                      | Id_UnRl(p0,l) -> s0^",$< %_"^(Sgn.print p0)^","^(List.fold_left (fun s p -> s^","^(string_of_int p)) "" l)
                      | Id_Rl p0 -> s0^",>$ "^(RP.print pnt_r_a p0)
                      |            Id_WC -> s0^"$_"       )
                  "" as0 )
            al  )
    | IR_Out(_,_) -> "|◂"
    | IR_Glb_Out(n,_) -> (pnt_stt_name !n)^" |⊢"
    | IR_Glb_Call(n,x,y) -> (pnt_stt_name !n)^" "^(pnt_ptn x)^" ⊢ "^(pnt_ptn y)^rtl^(pnt_ptn y)
    | IR_Exp(e,r0,r1) -> "» "^(print_exp e)^" |~ "^(pnt_ptn r0)^" ⊢ "^(pnt_ptn r1)^rtl^(pnt_ptn r1)
  )
and print_exp e =
  ( match e with
    | Rcd es -> "{ "^(Array.fold_left (fun s e -> s^" "^(print_exp e)) "" es)^" }"
    | App (e0,e1) -> "("^(print_exp e0)^"◂"^(print_exp e1)^")"
    | Name s -> pnt_stt_name !s
    | ExpCst a -> Cst.print a )
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
        | Q _ -> err "occurs:q1"
        | N_Ln (_,t1) -> rcd_occurs v1 t1
        | N _ -> err "occurs n2" )
    | Cns(_,t2) -> rcd_occurs v1 t2)
let rec unify ru t0 t1 =
  let se = (Types.print t0)^" ~ "^(Types.print t1) in
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
      | Rcd l1,Rcd l2 -> unify_rcd ru l1 l2
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
    | Rcd l1 -> gen_rcd rl l l1
    | _ -> ()
  )
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
let inst_ini () = { al = []; al_rcd = []; }
let rec inst l (i:Ast.inst) (y:Types.t) =
  (* pnt true "enter inst\n"; *)
  ( match y with
    | App(Var ({contents = Ln(Abs(v,y0))} as v0),y1) ->
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

let inst l y = fst @@ inst l (inst_ini ()) y
let gen_rm (l:int) rm = SgnMap.map (fun y -> gen (ref []) l y) rm
let rec inst_ptn gns l (rp:ptn) : Types.t =
  let open Rcd_Ptn in
  ( match rp with
    | R rs -> Rcd(rcd_cl (Array.to_list (Array.map (fun r -> inst_ptn gns l r) rs)))
    | A r -> inst_v_r gns l r )
and inst_v_r gns l r =
  ( match !r with
    | R_Ax p -> inst_idx_ptn gns l p
    | _ -> err "inst_v_r 0" )
and inst_idx_ptn gns l p =
  ( match p with
    | R_A p
    | R_WC p ->
      let v =
        ( try List.assoc p gns.ns_r_t
          with _ ->
            let v = newvar () in
            gns.ns_r_t <- (p,v)::gns.ns_r_t;
            v ) in
      inst l (Var v))
let rec inst_mtc_ptn gns ns l (r,es,_) =
  let y0 = inst_ptn gns l r in
  let _ =
    List.fold_left
      (fun _ (r,e) ->
         let y_v = inst_v_r gns l r in
         let ye = inst_mtc_atm gns ns l e in
         let _ = unify [] y_v ye in
         () )
      () es in
  y0
and inst_mtc_atm gns (ns:ns_v) l e =
  let open Types in
  ( match !e with
    | Eq_Agl(_,_,_,_) -> err "inst_mtc_atm 0"
    | Eq_Agl_N(n,r) ->
      let p = slv_ns0 ns n in
      let f = List.assoc p gns.ns_e in
      ( match !f with
        | Ctr(i0,i_n) ->
          e := Eq_Agl(p,i0,i_n,r);
          let yn = inst l (Var (get_ns gns p)) in
          let yr = inst_ptn gns l r in
          let v0 = newvar_l l in
          let _ = unify [] (Imp(yr,Var v0)) yn in
          (Var v0)
        | _ -> err "inst_mtc_atm 2" )
    | P_Cst c ->
      ( match c with
        | P_Z _ -> App(Axm Axm.z_n,(Axm Axm.z_u))
        | P_R64 _ -> Axm Axm.r64
        | P_N _ -> err "inst_mtc_atm 1"
        | P_R2 _ -> Axm Axm.r2
        | P_Stg _ -> Axm Axm.stg ))
and slv (gns:g_ns_v) (ns:ns_v) l p0 =
  Util.pnt true ("enter slv:"^(print_line p0)^"\n");
  ( match p0 with
    | Ret r ->
      let y = inst_ptn gns (l+1) r in
      let _ = gen (ref []) l y in
      y
    | Exn r ->
      let y = inst_v_r gns (l+1) r in
      let _ = unify []  (Axm Axm.exn_p) y in
      let _ = gen (ref []) l y in
      Var (newvar_q l)
    | IL_Glb_Call(n,r) ->
      let pf = slv_ns0 ns n in
      let y_e =
        ( try Var(get_ns gns pf)
          with _ -> err ("slv IL_Glb_Call 3:")) in
      let ye = inst (l+1) y_e in
      let yr = inst_ptn gns (l+1) r in
      let yy = Var(newvar_l (l+1)) in
      unify [] (Imp(yr,yy)) ye;
      gen (ref []) l ye;
      Util.pnt true ("test 4:"^"\n");
      yy
    | Mtc(ra,pns) ->
      let ta = inst_ptn gns (l+1) ra in
      let _ =
        Array.fold_left
          ( fun _ (e,_
                  ) ->
            let ti = inst_mtc_ptn gns ns (l+1) e in
            let _ = unify [] ti ta in
            () )
          () pns in
      let _ = gen (ref []) l ta in
      let (_,ys) =
        Array.fold_left
          ( fun (j,ys) (_,p) ->
              let y1 = slv gns ns l p in
              (j+1,ys |+| [|y1|]) )
          (0,[||]) pns in
      let tts = Array.map (fun y -> inst (l+1) y) ys in
      let rrt = Var (newvar_l (l+1)) in
      let _ = List.fold_left (fun y1 y2 -> unify [] y1 y2; y2) rrt (Array.to_list tts) in
      let _ = gen (ref []) l rrt in
      rrt
    | Clj _ -> err "slv:0"
    | Seq(o,p1) ->
      let _ =
        ( match o with
          | IR_S8 { contents =IR_S8_C(pl,rs0,rs1) } ->
            let rec mn pl =
              ( match pl with
                | (S8_Var i)::tl -> max i (mn tl)
                | _::tl -> mn tl
                | [] -> (-1) ) in
            let mn = mn pl in
            if mn>=(Array.length rs0) then err "emt_ir IR_S8 0"
            else
              let ts0 = Array.map (fun r -> inst_v_r gns (l+1) r) rs0 in
              let ts1 = Array.map (fun r -> inst_v_r gns (l+1) r) rs1 in
              let _ = Array.map (fun t -> unify [] t (Axm Axm.stg)) ts0 in
              let _ = Array.map (fun t -> unify [] t (Axm Axm.stg)) ts1 in
              ()
          | IR_Id id ->
            ( match !id with
              | IR_Id_C(r,rs) ->
                let ts = Array.map (fun r -> inst_ptn gns (l+1) r) rs in
                let t = inst_ptn gns (l+1) r in
                let _ = List.fold_left (fun y1 y2 -> unify [] y1 y2; y2) t (Array.to_list ts) in
                Util.pnt true "test 0";
                let _ = Array.map (fun t -> gen (ref []) l t) ts in
                ()
              | IR_Id_Ax _ -> err "slv id 0" )
          | IR_Glb_Call(n,x,y) ->
            Util.pnt true "F0\n";
            let pf = slv_ns0 ns n in
            Util.pnt true "F0\n";
            let tf = inst (l+1) (Var( try get_ns gns pf with _ -> err "slv_exp_atm 6")) in
            Util.pnt true "F0\n";
            let tx = inst_ptn gns (l+1) x in
            Util.pnt true "F0\n";
            let ty = inst_ptn gns (l+1) y in
            Util.pnt true "F0\n";
            unify [] tf (Imp(tx,ty));
            Util.pnt true "F0\n";
            gen (ref []) l ty
          | IR_Out (_,_) -> err "slv x1"
          | IR_Glb_Out (o,x) ->
            let pf = slv_ns0 ns o in
            let tx = inst_ptn gns (l+1) x in
            let yo = get_ns gns pf in
            let _ = unify [] (inst (l+1) (Var yo)) (App(Axm Axm.out_p,tx)) in
            gen (ref []) l tx
          | IR_Exp(a,_,r1) ->
            Util.pnt true "X\n";
            let tk = inst_ptn gns (l+1) r1 in
            Util.pnt true "X\n";
            let _ = unify [] tk (inst (l+1) (slv_exp_atm gns ns a)) in
            Util.pnt true "X\n";
            gen (ref []) l tk
          | _ -> err "slv Seq 0"
        ) in
      slv gns ns l p1
  )
and slv_exp_atm gns (ns:ns_v) a =
  Util.pnt true "X\n";
  let open Types in
  ( match a with
    | Name n ->
      let pf = slv_ns0 ns n in
      Util.pnt true "X\n";
      ( try Var(get_ns gns pf)
        with | Failure e -> err (e^":slv_exp_atm 3:") | _ -> err "slv_exp_atm 4" )
    | ExpCst (Cst.R64 _) -> Axm Axm.r64
    | ExpCst (Cst.S8 _) -> Axm Axm.stg
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
    | Rcd r -> Rcd(mk_vars_rcd rl ns f l r) )
and mk_vars_rcd rl ns f l r =
  let open Types in
  ( match r with
    | Cns(y0,r0) -> Cns(mk_vars rl ns f l y0,mk_vars_rcd rl ns f l r0)
    | Uo { contents = Ln r0 } -> Uo { contents = Ln (mk_vars_rcd rl ns f l r0) }
    | Uo v -> Uo v
    | U -> U )
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
(*let rec idx_crt_ptn s r = Rcd_Ptn.map (fun v -> idx_crt s v) r
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
*)
let mk_r_p p =
  ( match p with
    | R_A p -> p
    | _ -> err "mk_r_p 0" )
let mk_v_r () =
  let p = R_Ax(R_A (sgn ())) in
  let v = ref p in
  v
let rec ir_of_exp r0 r1 e =
  let open Ast in
  let open Rcd_Ptn in
  let lp = ir_of_exp in
  ( match e with
    | Rcd [||] -> []
    | App(Name n,e2) ->
      let v1 = mk_v_r () in
      let l2 = lp r0 (RP.A v1) e2 in
      let n1 = IR_Glb_Call(n,RP.A v1,r1) in
      l2@[n1]
    | App (e1,e2) ->
      let v0 = mk_v_r () in
      let v1 = mk_v_r () in
      let v0_r = mk_v_r () in
      let v1_r = mk_v_r () in
      let n0 = IR_Id(ref(IR_Id_C(r0,[|A v0;A v1|]))) in
      let l1 = lp (A v0) (A v0_r) e1 in
      let l2 = lp (A v1) (A v1_r) e2 in
      let n1 = IR_Glb_Call(ref(Stt_Axm Axm._app),RP.R[|RP.A v0_r;RP.A v1_r|],r1) in
      [n0]@l1@l2@[n1]
    | ExpCst a ->
      let p1 = IR_Exp(ExpCst a,r0,r1) in
      [p1]
    | Name n ->
      let p1 = IR_Exp(Name n,r0,r1) in
      [p1]
    | Rcd es ->
      let vs = Array.map (fun _ -> mk_v_r ()) es in
      let rs0 = Array.map (fun v -> Rcd_Ptn.A v) vs in
      let n0 = IR_Id(ref(IR_Id_C(r0,rs0))) in
      let (ns,_,rs1) =
        Array.fold_left
          (fun (ns,i,rs1) e ->
             let ri = RP.A (mk_v_r ()) in
             let l = lp rs0.(i) ri e in
             (ns@l,i+1,rs1 |+| [|ri|]))
          ([],0,[||]) es in
      (n0::ns)@[IR_Id(ref(IR_Id_C(R rs1,[|r1|])))]
  )


and mrg_idx_ptn r0 r1 =
  ( match r0,r1 with
    | _,RP.A(R_WC _) -> mrg_idx_ptn_wc r0
    | RP.A (i0,a0),_ ->
      RP.A (i0,a0 |+| [|Id_Rl r1|])
    | RP.R rs0,RP.A(R_A i1) ->
      RP.R(Array.mapi (fun i r -> mrg_idx_ptn_unrl [i] r i1) rs0)
    | RP.R rs0,RP.R rs1 ->
      RP.R(Array.mapi (fun i ri -> mrg_idx_ptn ri rs1.(i)) rs0 ))
and mrg_idx_ptn_wc r0 =
  ( match r0 with
    | RP.A (i0,a0) -> RP.A(i0,a0 |+| [|Id_WC|])
    | RP.R rs -> RP.R(Array.map mrg_idx_ptn_wc rs) )
and mrg_idx_ptn_unrl p r i1 =
  ( match r with
    | RP.A (i0,a0) -> RP.A(i0,a0 |+| [|Id_UnRl(i1,p)|])
    | RP.R rs ->
      RP.R(Array.mapi (fun j r -> mrg_idx_ptn_unrl (p@[j]) r i1) rs)
      (*| _ -> err "mrg_idx_ptn_unrl 0" *) )
and ir_of_id r rs =
  let ri = mk_idx_ptn r in
  let rsi = Array.map mk_idx_ptn rs in
  let rp = RP.map
      ( fun i ->
          ( match i with
            | R_A i -> (i,[||])
            | _ -> err "ir_of_id 0" )) ri in
  Array.fold_left ( fun rr rii -> mrg_idx_ptn rr rii) rp rsi

and slv_r rv p0 =
  let c_l = "enter slv_r:"^(print_line p0) in
  Util.pnt true c_l;
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
    | Mtc(ra,ps) ->
      let ra = csm_ptn_rv ra rv in
      let ps =
        Array.fold_left
          ( fun ps (e,p) ->
              let rv = Hashtbl.copy rv in
              let e = crt_mtc_ptn_rv e rv in
              let pi = slv_r rv p in
              ps |+| [|(e,pi)|] )
          [||] ps in
      Mtc(ra,ps)
    | Clj _ -> err "slv_r:0"
    | Seq(o,p1) ->
      ( match o with
        | IR_S8 { contents=IR_S8_C(pl,rs0,rs1) } ->
          let rs0 = Array.map (fun r -> csm_rv r rv) rs0 in
          let _ = Array.map (fun r -> crt_rv (ref []) r rv) rs1 in
          let p1 = slv_r rv p1 in
          Seq(IR_S8{ contents=IR_S8_C(pl,rs0,rs1) },p1)
        | IR_Id { contents=IR_Id_C(r,rs) } ->
          let r = csm_ptn_rv r rv in
          let _ = Array.map (fun r -> crt_ptn_rv r rv) rs in
          let l = ir_of_id r rs in
          let p1 = slv_r rv p1 in
          Seq(IR_Id { contents=IR_Id_Ax l },p1)
        | IR_Glb_Call(e,x,y) ->
          let x = csm_ptn_rv x rv in
          let _ = crt_ptn_rv y rv in
          let p1 = slv_r rv p1 in
          Seq(IR_Glb_Call(e,x,y),p1)
        | IR_Out (_,_) -> err "slv_r x3"
        | IR_Glb_Out (o,x) ->
          let x = csm_ptn_rv x rv in
          let p1 = slv_r rv p1 in
          Seq(IR_Glb_Out(o,x),p1)
        | IR_Exp(a,r0,r1) ->
          let r0 = csm_ptn_rv r0 rv in
          let _ = crt_ptn_rv r1 rv in
          let l = ir_of_exp r0 r1 a in
          let p1 = slv_r rv p1 in
          let p = List.fold_right (fun n p -> Seq(n,p)) l p1 in
          p
        | _ -> err "slv_r 2"
      )
  )
and pnt_rv rv =
  (Hashtbl.fold
     (fun _ v e -> e^(pnt_v_r v))
     rv "{> ")^" }"
and csm_rv r rv =
  ( match !r with
    | R_N n ->
      let r0 = ( try Hashtbl.find rv n with _ -> err ("csm_rv 1:"^n)) in
      r := R_Ax(R_A r0);
      Hashtbl.remove rv n;
      r
    | _ -> err "csm_rv 0" )
and csm_ptn_rv r rv = Rcd_Ptn.map (fun r0 -> csm_rv r0 rv) r
and crt_rv dl r rv =
  ( match !r with
    | R_N n ->
      let p = sgn () in
      let r0 = R_Ax(R_A p) in
      Hashtbl.add rv n p;
      r := r0;
      r
    | R_Ax(R_WC p) ->
      dl := p::!dl;
      r
    | _ -> err "crt_rv 0" )
and crt_ptn_rv r rv =
  let dl = ref [] in
  let r = Rcd_Ptn.map (fun r0 -> crt_rv dl r0 rv) r in
  (!dl,r)
and crt_mtc_ptn_rv (r,es,_) rv  =
  Util.pnt true "enter crt_mtc_ptn_rv \n";
  let rv0 = Hashtbl.create 10 in
  let (dl,_) = crt_ptn_rv r rv0 in
  let (dl,es) =
    List.fold_left
      (fun (dl,es) (v0,e) ->
         let v1 = csm_rv v0 rv0 in
         ( match !e with
           | Eq_Agl(_,_,_,_) -> err "crt_mtc_ptn_rv 0"
           | Eq_Agl_N(_,r) ->
             let (dl1,_) = crt_ptn_rv r rv0 in
             (dl1@dl,es@[(v1,e)])
           | P_Cst _ -> ((mk_r_p(mk_idx v1))::dl,es@[(v1,e)]) ))
      (dl,[]) es in
  let d =
    Hashtbl.fold
      ( fun n r d ->
          Hashtbl.add rv n r; (r::d))
      rv0 [] in
  (r,es,Some (dl,d))
and slv_r_etr (r0,p0) =
  let rv = Hashtbl.create 10 in
  let _ = crt_ptn_rv r0 rv in
  let p = slv_r rv !p0 in
  (r0,ref p)
type iv = (Sgn.t, R.t) Hashtbl.t
let pnt_iv gns iv =
  Hashtbl.fold
    (fun p r e ->
       let v = List.assoc p gns.ns_r_t in
       e^" %_"^(Sgn.print p)^"~"^(R.print r)^":"^(Types.print (Var v)) )
    iv ""
let rec rset_iv iv =
  let s = RSet.ini () in
  Hashtbl.fold
    ( fun _ i _ ->
        let _ = rset_ptn s i in
        () )
    iv ();
  s
and rset_ptn (s:RSet.t) r = RP.map (rset_ptn_atm s) r
and rset_ptn_atm (s:RSet.t) i =
  ( match i with
    | R.Idx i when i<0 -> ()
    | R.Idx i -> s.(i)<-true
    | R.Agl(ra,_,r) -> s.(ra)<-true; let _ = (rset_ptn s r) in ()
    | R.Etr(re,r) -> s.(re)<-true; let _ = rset_ptn s r in ()
    | R.AglStt(_,_,r) -> let _ = rset_ptn s r in ()   )
and idx_min l =
  let rec lp i =
    if List.exists (fun j -> i=j) l then (lp (i+1)) else i in
  lp 0
and alc_idx (s:RSet.t) v =
  ( match !v with
    | Ln y
    | N_Ln(_,y) -> alc_idx_ty s y
    | Q(_,_) ->
      let im = RSet.min_0 s in
      s.(im)<-true;
      RP.A(R.Idx im)
    | _ -> err "alc_idx 0" )
and alc_idx_ty (s:RSet.t) y =
  ( match y with
    | Var v ->
      let p1= alc_idx s v in
      p1
    | Rcd rs ->
      let rec lp rs =
        ( match rs with
          | Cns(hd,tl) ->
            let p = alc_idx_ty s hd in
            let lt1 = lp tl in
            [|p|] |+| lt1
          | Uo { contents=Ln tl }
          | Uo { contents=N_Ln(_,tl) } -> lp tl
          | U -> [||]
          | _ -> err "alc_idx_ty 0" ) in
      let lx = lp rs in
      RP.R lx
    | _ ->
      let im = RSet.min_0 s in
      s.(im)<-true;
      RP.A(R.Idx im) )
let mk_idx_iv_wc iv i0 p0 =
  let s0 = rset_iv iv in
  let s1 = RSet.ini () in
  let _ = rset_ptn s1 i0 in
  if (RSet.is_zero (RSet.and_v s0 s1)) then
    let rec lp i0 p0 =
      ( match (p0,i0) with
        | (RP.A((R_A pa)),_) -> Hashtbl.add iv pa i0
        | (RP.A((R_WC pa)),_) -> Hashtbl.add iv pa (RP.A(R.Idx (-1)))
        | (RP.R rs0,RP.R rs1) ->
          let _ = Array.mapi (fun i r -> lp rs1.(i) r) rs0 in
          ()
        | _ -> err "mk_idx_iv_wc 1" ) in
    lp i0 p0
  else err "mk_idx_iv_wc 3"

let mk_idx_iv iv i0 p0 =
  let s0 = rset_iv iv in
  let s1 = RSet.ini () in
  let _ = rset_ptn s1 i0 in
  if (RSet.is_zero (RSet.and_v s0 s1)) then
    let rec lp i0 p0 =
      ( match (p0,i0) with
        | (RP.A((R_A pa)),_) -> Hashtbl.add iv pa i0
        | (RP.A((R_WC pa)),_) -> Hashtbl.add iv pa i0
        | (RP.R rs0,RP.R rs1) ->
          let _ = Array.mapi (fun i r -> lp rs1.(i) r) rs0 in
          ()
        | _ -> err "mk_idx_iv 1" ) in
    lp i0 p0
  else err "mk_idx_iv 0"
let rec csm_iv r iv =
  ( match r with
    | R_A p ->
      let i0 = (try Hashtbl.find iv p with _ -> err "csm_iv 2" ) in
      Hashtbl.remove iv p;
      i0
    | _ -> err "csm_rv 0" )
and csm_ptn_iv r iv =
  ( match r with
    | RP.A a -> csm_iv a iv
    | RP.R rs -> RP.R(Array.map (fun r -> csm_ptn_iv r iv) rs))
and crt_iv gns r iv =
  ( match r with
    | R_A p ->
      let v = List.assoc p gns.ns_r_t in
      let i0 = alc_idx (rset_iv iv) v in
      ( Hashtbl.add iv p i0; gns.ns_r_i <- (p,ref i0)::gns.ns_r_i; i0 )
    | R_WC _ -> RP.A(R.Idx (-1)) )
and crt_ptn_iv gns r rv =
  ( match r with
    | RP.A a -> crt_iv gns a rv
    | RP.R rs -> RP.R(Array.map (fun r -> crt_ptn_iv gns r rv) rs) )
and crt_mtc_ptn_iv gns (r,es) rv  =
  let _ = crt_ptn_iv gns (mk_idx_ptn r) rv in
  let es =
    List.fold_left
      (fun es (v0,e) ->
         let v1 = csm_iv (mk_idx v0) rv in
         ( match !e with
           | Eq_Agl(_,_,_,r)
           | Eq_Agl_N(_,r) ->
             let _ = crt_ptn_iv gns (mk_idx_ptn r) rv in
             es@[(v1,e)]
           | P_Cst _ -> es@[(v1,e)] ))
      [] es in
  (r,es)
    (*
let rec slv_idx ns iv p0 =
  ( match p0 with
    | Ret r -> let _ = csm_ptn_iv (mk_idx_ptn r) iv in ()
    | Exn r ->
      let _ = csm_iv (mk_idx r) iv in
      ()
    | IL_Glb_Call(_,r) ->
      let _ = csm_ptn_iv (mk_idx_ptn r) iv in
      ()
    | Mtc(ra,ps) ->
      let _ = csm_ptn_iv (mk_idx_ptn ra) iv in
      let _ =
        Array.fold_left
          ( fun _ (e,p) ->
              let iv = Hashtbl.copy iv in
              let _ = crt_mtc_ptn_iv ns e iv in
              let _ = slv_idx ns iv p in
              ())
          () ps in
      ()
    | Seq(o,p1) ->
      let _ =
        ( match o with
          | IR_S8 { contents=IR_S8_C(_,rs0,rs1) } ->
            let _ = Array.map (fun r -> csm_iv (mk_idx r) iv) rs0 in
            let _ = Array.map (fun r -> crt_iv ns (mk_idx r) iv) rs1 in
            ()
          | IR_Id { contents=IR_Id_C(r,rs) } ->
            let _ = csm_ptn_iv (mk_idx_ptn r) iv in
            let _ = Array.map (fun r -> crt_ptn_iv ns (mk_idx_ptn r) iv) rs in
            ()
          | IR_Glb_Call(_,x,y) ->
            let _ = csm_ptn_iv (mk_idx_ptn x) iv in
            let _ = crt_ptn_iv ns (mk_idx_ptn y) iv in
            ()
          | IR_Out (_,_) -> err "slv_r x3"
          | IR_Glb_Out (_,x) ->
            let _ = csm_ptn_iv (mk_idx_ptn x) iv in
            ()
          | IR_Exp(_,r0,r1) ->
            let _ = csm_ptn_iv (mk_idx_ptn r0) iv in
            let _ = crt_ptn_iv ns (mk_idx_ptn r1) iv in
            ()
          | _ -> err "slv_idx 2"
        ) in
      let _ = slv_idx ns iv p1 in
      ()
    | _ -> err "slv_idx 3"
  )
and slv_idx_etr ns (r0,p0) =
  let iv = Hashtbl.create 10 in
  let i0 = crt_ptn_iv ns (mk_idx_ptn r0) iv in
  let _ = slv_idx ns iv !p0 in
  (i0,iv)*)
let emt_flg = true
let cmt s = if emt_flg then "; "^s^"\n" else ""
let x86_reg_lst = [
  "r13"; "r14"; "r15"; "r8"; "r9"; "r10"; "r11"; "rcx"; "rdx"; ]
let emt_reg_x86 n =
  if n<9 then List.nth x86_reg_lst n
  else "QWORD [st_vct+8*"^(string_of_int n)^"]"
let push_all =
  "\tpush r14\n"^
  "\tpush r15\n"^
  "\tpush rdx\n"^
  "\tpush rcx\n"^
  "\tpush r8\n"^
  "\tpush r9\n"^
  "\tpush r10\n"^
  "\tpush r11\n"^
  "\tpush r13\n"
let pop_all =
  "\tpop r13\n"^
  "\tpop r11\n"^
  "\tpop r10\n"^
  "\tpop r9\n"^
  "\tpop r8\n"^
  "\tpop rcx\n"^
  "\tpop rdx\n"^
  "\tpop r15\n"^
  "\tpop r14\n"
let mov_all () =
  List.fold_left
    (fun (i,s) xr -> (i+1,s^"\tmov QWORD [st_vct+8*"^(string_of_int i)^"],"^xr^"\n") )
    (0,"") x86_reg_lst
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
(*
let rec mov_regs s i =
  if i<9&&(s.(i)=true)
  then
    "\tmov QWORD [regs_vct+8*"^(string_of_int i)^"],"^(emt_reg_x86 i)^"\n"^
    (mov_regs s (i+1))
  else ""
let set_regs s =
  Hashtbl.fold
    ( fun i _ e ->
        if i<9 then
          e^
          "\tmov "^(emt_reg_x86 i)^",QWORD [regs_vct+8*"^(string_of_int i)^"]\n"
        else
          e )
    s ""
*)
let cf_set i =
  let l0 = lb () in
  let l1 = lb () in
  "\tjc "^l0^"\n"^
  "\tbtr r12,"^(string_of_int i)^"\n"^
  "\tjmp "^l1^"\n"^
  l0^":\n"^
  "\tbts r12,"^(string_of_int i)^"\n"^
  l1^":\n"
let rec set_regs s i =
  if i<9&&(s.(i)=true)
  then
    "\tmov "^(emt_reg_x86 i)^",QWORD [regs_vct+8*"^(string_of_int i)^"]\n"^
    (set_regs s (i+1))
  else ""
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
  let lb1 = lb () in
  let lb2 = lb () in
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
  "\tbt r11,0\n"^
  "\tjc "^lb0^"\n"^
  "\tbt r10,0\n"^
  "\tjc "^lb1^"\n"^
  "\tbts r10,0\n"^
  "\tjmp "^lb2^"\n"^
  lb0^":\n"^
  "\tpush r10\n"^
  "\tcall mlc_ln\n"^
  "\tpop r10\n"^
  "\tmov QWORD [rax+8*1],r10\n"^
  "\tbts rax,0\n"^
  "\tmov r10,rax\n"^
  "\tjmp "^lb2^"\n"^
  lb1^":\n"^
  "\tpush r10\n"^
  "\tcall mlc_ln\n"^
  "\tpop r10\n"^
  "\tmov QWORD [rax+8*1],r10\n"^
  "\tbtr QWORD [rax],0\n"^
  "\tbts rax,0\n"^
  "\tmov r10,rax\n"^
  "\tjmp "^lb2^"\n"^
  lb2^":\n"^
  "\tpush r10\n"^
  "\tmov rdi,rdx\n"^
  "\tmov rax,0\n"^
  "\tcall free\n"^
  "\tmov rdi,3\n"^
  "\tcall mlc\n"^
  "\tpop QWORD [rax+8*3]\n"^
  "\tbtr QWORD [rax],0\n"^
  "\tbtr QWORD [rax],2\n"^
  "\tpop QWORD [rax+8*1]\n"^
  "\tpop QWORD [rax+8*2]\n"^
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
  "\tbtr QWORD [rax],0\n"^
  "\tmov r10,unt\n"^
  "\tmov r11,0x0100_0000_0000_0001\n"^
  "\tadd r10,r11\n"^
  "\tmov QWORD [rax+8*3],r10\n"^
  "\tpop QWORD [rax+8*1]\n"^
  "\tpop QWORD [rax+8*2]\n"^
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
            (emt_ptn_grm i ns ep f r 0)^
            "NS_E_"^(Sgn.print ep)^"_MTC_"^(string_of_int i)^"_succeed:\n"^
            "\tpop r8\n"^
            "\tpush rdi\n"^
            "\tpush rdx\n"^
            "\tmov rdi,"^(string_of_int rn)^"\n"^
            "\tcall mlc\n"^
            "\tmov rdi,rax\n"^
            (prs_set_i (rn-1))^
            "\tmov r10,0x"^(Printf.sprintf "%02x" i)^"00_0000_0000_0001\n"^
            "\tadd rdi,r10\n"^
            "\tmov r10,rdi\n"^
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
            (emt_ptn_grm i ns ep f r 0)^
            "NS_E_"^(Sgn.print ep)^"_MTC_"^(string_of_int i)^"_succeed:\n"^
            "\tpop r8\n"^
            "\tjmp NS_E_"^(Sgn.print ep)^"_succeed\n"^
            "NS_E_"^(Sgn.print ep)^"_MTC_"^(string_of_int i)^"_failed:\n"^
            "\tpop rsi\n"^
            (lp (i+1) tl)
          | [] ->
            "\tjmp NS_E_"^(Sgn.print ep)^"_failed\n" ) in
      lp 0 l )
and emt_ptn_grm i ns ep f r j =
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
                  let lb_c = lb () in
                  if ib<lbs
                  then
                    "\tmov r11,0\n"^
                    "\tmov r11b,BYTE [rdi+rsi+8*1+"^(string_of_int ib)^"]\n"^
                    "\tcmp r11b,"^(string_of_int (Char.code bs.[ib]))^"\n"^
                    "\tjz "^lb_c^"\n"^
                    "\tpush rdi\n"^
                    "\tpush rdx\n"^
                    (prs_dec_i (j-1))^
                    "\tpop rdx\n"^
                    "\tpop rdi\n"^
                    "\tjmp NS_E_"^(Sgn.print ep)^"_MTC_"^(string_of_int i)^"_failed\n"^
                    lb_c^":\n"^
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
                ( match !mf with
                  | M_Prm "grm" ->
                    let epf = List.assoc "prs" ns.ns_p in
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
                ( match !mf with
                  | M_Prm "grm" ->
                    let epf = List.assoc "prs" ns.ns_p in
                    (*let ma = List.assoc "prs" !mp.ns_e in *)
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
                ( match !mf with
                  | M_Prm "grm" ->
                    let epf = List.assoc "prs" ns.ns_p in
                    (*let ma = List.assoc "prs" !mp.ns_e in
                      let (epf,_ ) = !ma in*)
                    l0^":\n"^
                    es^
                    "\tcall NS_E_"^(Sgn.print epf)^"_ETR_TBL\n"^
                    l1^":\n"^
                    "\tmov rax,1\n"
                  | _ -> err "emt_ptn 5" )
            ) ) in
      e_p^(emt_ptn_grm i ns ep f tl (j+1))
    | [] ->
      "" )
let rec emt_m gns (ns:ns_v ref) ld el =
  let tbs = String.make ld '\t' in
  ( match el with
    | [] -> ("","","","")
    | e::tl ->
      let (e0,e1,e2,pp) =
        ( match e with
          | Mdl_Ln(_,n) ->
            let ns1 = get_ns_m !ns (EndN n) in
            let ns1 = !ns1 in
            !ns.ns_p <- ns1.ns_p @ !ns.ns_p;
            !ns.ns_t <- ns1.ns_t @ !ns.ns_t;
            !ns.ns_m <- ns1.ns_m@ !ns.ns_m;
            !ns.ns_m_t <- ns1.ns_m_t@ !ns.ns_m_t;
            ("","","","§ "^n^"._")
          | Mdl(n,el0) ->
            !ns.ns_m_t <- (n,ref Ast.M_WC):: !ns.ns_m_t;
            let ns_1 = ref(init_ns ()) in
            !ns_1.root <- (Some ns);
            !ns.ns_m <- (n,ns_1)::!ns.ns_m;
            let (e0,e1,e2,pp) = emt_m gns ns_1 (ld+1) el0 in
            (e0,e1,e2,tbs^"§§ "^n^"\n"^pp^tbs^"§§.\n")
          | Etr(n,_,_,(r0,p0)) ->
            let (r0,p0) = slv_r_etr (r0,p0) in
            let y0 = inst_ptn gns 0 r0 in
            let y1 = slv gns !ns 0 !p0 in
            let y = Imp(y0,y1) in
            let _ = gen (ref []) (-1) y in
            let pp =
              tbs^"§ "^n^" : "^(Types.print_t y0)^" ⊢ "^(Types.print_t y1)^"\n" in
            let iv0 = Hashtbl.create 10 in
            let i0 = crt_ptn_iv gns (mk_idx_ptn r0) iv0 in
            (*let (i0,s0) = slv_idx_etr !ns (r0,p0) in *)
            let i1 = alc_idx_ty (RSet.ini ()) y1 in
            let ep = sgn () in
            !ns.ns_p <- (n,ep)::!ns.ns_p;
            gns.ns_e <- (ep,ref(Etr_V(i0,i1)))::gns.ns_e;
            gns.ns <- (ep,ref(Ln y))::gns.ns;
            let c0 = cmt ("\t|» "^(emt_ptn i0)) in
            (*let l2 = "_"^(emt_name (l0,n)) in *)
            let l_e = "NS_E_"^(Sgn.print ep) in
            let l2 = "NS_E_RDI_"^(Sgn.print ep) in
            let e_p = emt_ir i1 gns ns iv0 !p0 in
            let e0 =
              l_e^":\n"^
              c0^
              l2^":\n"^
              e_p in
            let se =
              "\tNS_E_DYN_"^(Sgn.print ep)^":\n"^
              "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
              "\t\tdq "^l_e^"\n" in
            (se,e0,"",pp)
          | Etr_Abs(_,_,_) -> err "emt_m etr_abs 0"
          (* let l = ref [] in
             let ys = mk_vars (ref []) !ns `Etr l y0 in
             let yd = mk_vars (ref []) !ns `Etr l y1 in
             let v = ref(Ln(Imp(ys,yd))) in
             !ns.ns <- (n,v)::!ns.ns;
             (*!ns.ns_e <- (n,ref(sgn (),Etr_V(Rcd_Ptn.A (0,v))))::!ns.ns_e; *)
             let pp =
             tbs^"§ "^n^" : "^(Types.print_t ys)^" ⊢ "^(Types.print_t yd)^"\n" in
             ("","","",pp)*)
          | Etr_Eq(n0,n1) ->
            ( match n1 with
              | Cst(Cst.R64 r0) ->
                let ep = sgn () in
                !ns.ns_p <- (n0,ep)::!ns.ns_p;
                gns.ns <- (ep,ref(Ln(Axm Axm.r64)))::gns.ns;
                gns.ns_e <- (ep,ref(Cst_Stt(Cst.R64 r0)))::gns.ns_e;
                let pp =
                  tbs^"§ "^n0^" = "^"0xr"^(Int64.format "%x" r0)^"\n" in
                ("","","",pp)
              | Cst(Cst.S8 s0) ->
                let ep = sgn () in
                !ns.ns_p <- (n0,ep)::!ns.ns_p;
                gns.ns <- (ep,ref(Ln(Axm Axm.stg)))::gns.ns;
                gns.ns_e <- (ep,ref(Cst_Stt(Cst.S8 s0)))::gns.ns_e;
                let pp =
                  tbs^"§ "^n0^" = "^"\""^(String.escaped s0)^"\""^"\n" in
                ("","","",pp)
              | ExStg f0 ->
                let ep = sgn () in
                !ns.ns_p <- (n0,ep)::!ns.ns_p;
                let s0 = Util.load_file f0 in
                gns.ns <- (ep,ref(Ln(Axm Axm.stg)))::gns.ns;
                gns.ns_e <- (ep,ref(Cst_Stt(Cst.S8 s0)))::gns.ns_e;
                let pp =
                  tbs^"§ "^n0^" = .. "^"\""^(String.escaped f0)^"\""^"\n" in
                ("","","",pp)
              | EqLn nl ->
                let ep = get_ns_p !ns nl in
                !ns.ns_p <- (n0,ep)::!ns.ns_p;
                let pp =
                  tbs^"§ "^n0^" = "^(pnt_name nl)^"\n" in
                ("","","",pp)
              | SttArg i ->
                let ep = sgn () in
                !ns.ns_p <- (n0,ep)::!ns.ns_p;
                let s0 = Sys.argv.(i) in
                gns.ns <- (ep,ref(Ln(Axm Axm.stg)))::gns.ns;
                gns.ns_e <- (ep,ref(Cst_Stt(Cst.S8 s0)))::gns.ns_e;
                let pp =
                  tbs^"§ "^n0^" = "^"\""^(String.escaped s0)^"\""^"\n" in
                ("","","",pp)
              | ExStgArg i ->
                let ep = sgn () in
                !ns.ns_p <- (n0,ep)::!ns.ns_p;
                let s0 = Util.load_file (Sys.argv.(i)) in
                gns.ns <- (ep,ref(Ln(Axm Axm.stg)))::gns.ns;
                gns.ns_e <- (ep,ref(Cst_Stt(Cst.S8 s0)))::gns.ns_e;
                let pp =
                  tbs^"§ "^n0^" = "^"\""^(String.escaped s0)^"\""^"\n" in
                ("","","",pp))
          | Etr_Out_Abs(n,y0) ->
            let ep = sgn () in
            !ns.ns_p <- (n,ep)::!ns.ns_p;
            let l = ref [] in
            let ys = mk_vars (ref []) !ns `Etr l y0 in
            let v = ref(Ln(App(Axm Axm.out_p,ys))) in
            gns.ns <- (ep,v)::gns.ns;
            (*!ns.ns_e <- (n,ref(sgn (),Etr_V(Rcd_Ptn.A (0,v))))::!ns.ns_e; *)
            let pp =
              tbs^"§ "^n^" : "^(Types.print_t ys)^" |⊢ \n" in
            ("","","",pp)
          | Etr_Glb(n,p) ->
            let rv0 = Hashtbl.create 10 in
            let p0 = slv_r rv0 !p in
            let y1 = slv gns !ns 0 p0 in
            let _ = gen (ref []) (-1) y1 in
            let pp =
              tbs^"§ "^n^" : "^(Types.print_t y1)^"\n" in
            let ep = sgn () in
            !ns.ns_p <- (n,ep)::!ns.ns_p;
            gns.ns_e <- (ep,ref(Cst_Dyn))::gns.ns_e;
            gns.ns <- (ep,ref(Ln y1))::gns.ns;
            let i1 = RP.R[||] in
            let s = Hashtbl.create 10 in
            let e_p =
              "NS_E_"^(Sgn.print ep)^":\n"^
              "NS_E_RDI_"^(Sgn.print ep)^":\n"^
              (emt_ir i1 gns ns s p0) in
            let se =
              (*"\t_dyn_"^(emt_name (l0,n))^":\n"^ *)
              "\tCST_DYN_"^(Sgn.print ep)^":\n"^
              (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
              "\t\tdq 0x0001_0001_00_82_ffff\n"^
              "\t\tdq 1\n" in
            let sx =
              "\tcall NS_E_"^(Sgn.print ep)^"\n" in
            (se,e_p,sx,pp)
          | Etr_Clq q ->
            let l_0 =
              List.fold_left
                (fun l_0 (n,_,_,(r0,p0)) ->
                   let (r0,p0) = slv_r_etr (r0,p0) in
                   let ep = sgn () in
                   !ns.ns_p <- (n,ep)::!ns.ns_p;
                   let y0 = inst_ptn gns 0 r0 in
                   let y1 = newvar_l 0 in
                   let y2 = newvar () in
                   y2 := Ln(Imp(y0,Var y1));
                   gns.ns <-  (ep,y2)::gns.ns;
                   (n,y2,y1,p0,r0,ep)::l_0 )
                [] q in
            let l_1 =
              List.fold_left
                ( fun l (n,y2,y0,p0,r0,ep) ->
                    let y1 = slv gns !ns 0 !p0 in
                    (n,y2,y0,y1,p0,r0,ep)::l )
                [] l_0 in
            let l_2 =
              List.fold_left
                ( fun l (n,y2,y0,y1,p0,r0,ep) ->
                    let _ = unify [] (Var y0) (inst 0 y1) in
                    gen (ref []) (-1) (Var y2);
                    let iv0 = Hashtbl.create 10 in
                    let i0 = crt_ptn_iv gns (mk_idx_ptn r0) iv0 in
                    (*let (i0,s0) = slv_idx_etr !ns (r0,p0) in*)
                    let s1 = Hashtbl.create 10 in
                    let i1 = alc_idx_ty (rset_iv s1) y1 in
                    gns.ns_e <- (ep,ref(Etr_V(i0, i1)))::gns.ns_e;
                    (n,y2,y0,y1,p0,r0,i0,i1,iv0,ep)::l )
                [] l_1 in
            List.fold_left
              ( fun (e_0,e_1,e_2,pp) (n,_,y0,y1,p0,_,i0,i1,s0,ep) ->
                  let e_p = emt_ir i1 gns ns s0 !p0 in
                  let pp =
                    pp^tbs^"\t@."^n^" : "^(Types.print_t (Var y0))^" ⊢ "^(Types.print_t y1)^"\n" in
                  let c0 = cmt ("\t|» "^(emt_ptn i0)) in
                  let l_e = "NS_E_"^(Sgn.print ep) in
                  let l_e_rdi = "NS_E_RDI_"^(Sgn.print ep) in
                  let e0 =
                    l_e^":\n"
                    ^c0^
                    l_e_rdi^":\n"^
                    e_p in
                  let se =
                    "\tNS_E_DYN_"^(Sgn.print ep)^":\n"^
                    (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
                    "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
                    "\t\tdq "^l_e^"\n" in
                  (e_0^se,e_1^e0,e_2,pp) )
              ("","","",tbs^"§ \n") l_2
          | Flow f ->
            ( match f with
              | Ast.Def_CoPrd (n,a,ds) ->
                let (_,vs) = List.split a in
                let ds = List.map (fun (y,c) -> (mk_vars (ref []) !ns `Abs (ref a) y,c)) ds in
                let yp = sgn () in
                let ya = List.fold_left (fun ya (_,v) -> App(ya,Var v)) (Axm yp) a in
                let yt = List.fold_left (fun yt (_,v) -> Abs(v,yt)) ya a in
                !ns.ns_t <- (n,ref(Ln yt))::!ns.ns_t;
                let dl = List.length ds in
                let (_,es,pp0) =
                  List.fold_left
                    ( fun (i,s,pp0) (t,n) ->
                        let tc = Imp(t,ya) in
                        let epi = sgn () in
                        !ns.ns_p <- (n,epi)::!ns.ns_p;
                        gns.ns_e <- (epi,ref(Ctr(i,dl)))::gns.ns_e;
                        gns.ns <- (epi,ref (Ln tc))::gns.ns;
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
                        let dl = List.length ds in
                        let (_,eq,pp0) =
                          List.fold_left
                            (fun (i,eq,pp0) (t,n) ->
                               let tc = Imp(t,yt) in
                               let epi = sgn () in
                               !ns.ns_p <- (n,epi)::!ns.ns_p;
                               gns.ns_e <- (epi,ref(Ctr(i,dl)))::gns.ns_e;
                               gns.ns <- (epi,ref (Ln tc))::gns.ns;
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
          | Grm_Abs _ -> err "Grm_Abs 0"
          (*let open Rcd_Ptn in
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
            !ns_g.ns_e <- ("prs",ref(epf,Ast.Etr_V(RP.R [||],RP.R [||])))::!ns_g.ns_e;
            let eq0 =
            "\tNS_E_DYN_"^(Sgn.print epf)^":\n"^
            (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
            "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
            "\t\tdq NS_E_"^(Sgn.print epf)^"\n" in
            let e0 =
            ( match n with
              | _ -> err "emt_m g9"
            ) in
            (eq0,e0,"",tbs^"¶¶+ℙ "^n^"\n") *)
          | Gram g ->
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
                        let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;(App(Axm Axm.opn,Axm t_p))])) in
                        let epv = sgn () in
                        !ns_g.ns_p <- ("prs",epv)::!ns_g.ns_p;
                        gns.ns <- (epv,(ref(Ln yp)))::gns.ns;
                        gns.ns_e <- (epv,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|])))::gns.ns_e;
                        gv@[`P(n,rs,t_p,epv,ns_g)]
                      | Grm.Act(n,rs) ->
                        !ns.ns_m_t <- (n,ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
                        let ns_g = ref(init_ns ()) in
                        !ns_g.root <- Some ns;
                        !ns.ns_m <- (n,ns_g)::!ns.ns_m;
                        let t_v = newvar_l 0 in
                        !ns_g.ns_t <- ("t",t_v)::!ns_g.ns_t;
                        let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;(App(Axm Axm.opn,Var t_v))])) in
                        let epv = sgn () in
                        gns.ns <- (epv,(ref(Ln yp)))::gns.ns;
                        !ns_g.ns_p <- ("prs",epv)::!ns_g.ns_p;
                        gns.ns_e <- (epv,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|])))::gns.ns_e;
                        gv@[`V(n,rs,t_v,epv,ns_g)]
                    ))
                [] g in
            let gv_0 =
              List.fold_left
                ( fun gv_0 rsi ->
                    match rsi with
                    | `P(n,rs,t_p,epv,ns_g) ->
                      let rsl = List.length rs in
                      let ya = Axm t_p in
                      let (_,rts) =
                        List.fold_left
                          (fun (i,rts) (nc,_,r) ->
                             let t = mk_var_grm !ns_g r in
                             let tc = Imp(t,ya) in
                             let epv_i = sgn () in
                             !ns_g.ns_p <- (nc,epv_i)::!ns_g.ns_p;
                             gns.ns <- (epv_i,ref (Ln tc))::gns.ns;
                             gns.ns_e <-  (epv_i,ref(Ctr(i,rsl)))::gns.ns_e;
                             (i+1,rts@[(t,epv_i)]))
                          (0,[]) rs in
                      gv_0@[`P(n,rs,rts,t_p,epv,ns_g)]
                    | `V(n,rs,t_v,epv,ns_g) ->
                      let rts =
                        List.fold_left
                          ( fun rts ((r0,p0),_,r) ->
                              let y = mk_var_grm !ns_g r in
                              let (r0,p0) = slv_r_etr (r0,p0) in
                              let y0 = inst_ptn gns 0 r0 in
                              let _ = unify [] y y0 in
                              let y1 = slv gns !ns 0 !p0 in
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
                    | `P(n,rs,rts,_,epv,ns_g) ->
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
                        (emt_prs !ns_g epv (`P rs)) in
                      pnt true "grm x\n";
                      let eq0 =
                        "\tNS_E_DYN_"^(Sgn.print epv)^":\n"^
                        (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
                        "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
                        "\t\tdq NS_E_"^(Sgn.print epv)^"\n" in
                      (es0,es1^eq^eq0,pp^ppi)
                    | `V(n,rs,rts,_,epv,ns_g) ->
                      let ppi = Grm.print_etr_act (n,rs) in
                      let _ = List.combine rs rts in
                      let es0 =
                        es0^
                        (emt_prs !ns_g epv (`V rs)) in
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
      let (et0,et1,et2,ppt) = emt_m gns ns ld tl in
      (e0^et0,e1^et1,e2^et2,pp^ppt)
  )

and init_prm () =
  let ns = ref (init_ns ()) in
  let gns = init_gns () in
  !ns.ns_m_t <- ("_chr",ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
  let ns_g = ref(init_ns ()) in
  !ns_g.root <- (Some ns);
  !ns.ns_m <- ("_chr",ns_g)::!ns.ns_m;
  !ns_g.ns_t <- ("t",ref(Ln(Axm Axm.stg)))::!ns_g.ns_t;
  let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;App(Axm Axm.opn,Axm Axm.stg)])) in
  let epf = sgn () in
  !ns.ns_p <- ("prs",epf)::!ns.ns_p;
  gns.ns <- (epf,ref(Ln yp))::gns.ns;
  gns.ns_e <- (epf,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|])))::gns.ns_e;
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

  !ns.ns_m_t <- ("_dgt",ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
  let ns_g = ref(init_ns ()) in
  !ns_g.root <- (Some ns);
  !ns.ns_m <- ("_dgt",ns_g)::!ns.ns_m;
  !ns_g.ns_t <- ("t",ref(Ln(Axm Axm.stg)))::!ns_g.ns_t;
  let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;App(Axm Axm.opn,Axm Axm.stg)])) in
  let epf = sgn () in
  !ns.ns_p <- ("prs",epf)::!ns.ns_p;
  gns.ns <- (epf,ref(Ln yp))::gns.ns;
  gns.ns_e <- (epf,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|])))::gns.ns_e;
  let se_dgt =
    "\tNS_E_DYN_"^(Sgn.print epf)^":\n"^
    (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
    "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
    "\t\tdq NS_E_"^(Sgn.print epf)^"\n" in
  let l0 = "NS_E_"^(Sgn.print epf)^"_LB_0" in
  let l_e = "NS_E_"^(Sgn.print epf) in
  let l_e_rdi = "NS_E_RDI_"^(Sgn.print epf) in
  let l_e_tbl = "NS_E_"^(Sgn.print epf)^"_ETR_TBL" in
  let em_dgt =
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
    "\tret\n" in

  !ns.ns_m_t <- ("_dgt",ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
  let ns_g = ref(init_ns ()) in
  !ns_g.root <- (Some ns);
  !ns.ns_m <- ("_u_al",ns_g)::!ns.ns_m;
  !ns_g.ns_t <- ("t",ref(Ln(Axm Axm.stg)))::!ns_g.ns_t;
  let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;App(Axm Axm.opn,Axm Axm.stg)])) in
  let epf = sgn () in
  !ns.ns_p <- ("prs",epf)::!ns.ns_p;
  gns.ns <- (epf,ref(Ln yp))::gns.ns;
  gns.ns_e <- (epf,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|])))::gns.ns_e;
  let se_u_al =
    "\tNS_E_DYN_"^(Sgn.print epf)^":\n"^
    (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
    "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
    "\t\tdq NS_E_"^(Sgn.print epf)^"\n" in
  let l0 = "NS_E_"^(Sgn.print epf)^"_LB_0" in
  let l_e = "NS_E_"^(Sgn.print epf) in
  let l_e_rdi = "NS_E_RDI_"^(Sgn.print epf) in
  let l_e_tbl = "NS_E_"^(Sgn.print epf)^"_ETR_TBL" in
  let em_u_al =
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
    "\tret\n" in

  !ns.ns_m_t <- ("_dgt",ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
  let ns_g = ref(init_ns ()) in
  !ns_g.root <- (Some ns);
  !ns.ns_m <- ("_l_al",ns_g)::!ns.ns_m;
  !ns_g.ns_t <- ("t",ref(Ln(Axm Axm.stg)))::!ns_g.ns_t;
  let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;App(Axm Axm.opn,Axm Axm.stg)])) in
  let epf = sgn () in
  !ns.ns_p <- ("prs",epf)::!ns.ns_p;
  gns.ns <- (epf,ref(Ln yp))::gns.ns;
  gns.ns_e <- (epf,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|])))::gns.ns_e;
  let se_l_al =
    "\tNS_E_DYN_"^(Sgn.print epf)^":\n"^
    (*"\t\tdb 0,0b1,0,0b1,0b10000000,0,0,0b1\n"^ *)
    "\t\tdq 0b00000000_00000001_00000000_00000001_10000000_00000000_00000000_00000001\n"^
    "\t\tdq NS_E_"^(Sgn.print epf)^"\n" in
  let l0 = "NS_E_"^(Sgn.print epf)^"_LB_0" in
  let l_e = "NS_E_"^(Sgn.print epf) in
  let l_e_rdi = "NS_E_RDI_"^(Sgn.print epf) in
  let l_e_tbl = "NS_E_"^(Sgn.print epf)^"_ETR_TBL" in
  let em_l_al =
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
    "\tret\n" in

  let v = ref(Ln(App(Axm Axm.out_p,Axm Axm.stg))) in
  !ns.ns_p <- ("_emt",Ast.Axm._emt)::!ns.ns_p;
  gns.ns <- (Ast.Axm._emt,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._emt,ref(Etr_V(RP.A(R.Idx 0),RP.R[||])))::gns.ns_e;
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
  let v = ref(Ln(Imp(Var v_q,Var v_q))) in
  !ns.ns_p <- ("_emt_q",Ast.Axm._emt_q)::!ns.ns_p;
  gns.ns <- (Ast.Axm._emt_q,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._emt_q,ref(Etr_V(RP.A(R.Idx 0),RP.A(R.Idx 0))))::gns.ns_e;
  let se_emt_q = "" in
  let em_emt_q =
    "NS_E_ID_"^(Sgn.print Ast.Axm._emt_q)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._emt_q)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._emt_q)^":\n"^
    push_all^
    "\tmov rdi,r13\n"^
    "\tmov rsi,0\n"^
    "\tbt r12,0\n"^
    "\tsetc sil\n"^
    "\tcall pp_v\n"^
    "\tpush rax\n"^
    "\tmov rdi,rax\n"^
    "\tmov rax,0\n"^
    "\tadd rdi,8\n"^
    "\tmov rsi,rdi\n"^
    "\tmov rdi,fmt_emt_q\n"^
    "\tcall printf\n"^
    "\tpop rdi\n"^
    "\tmov rax,0\n"^
    "\tcall free\n"^
    pop_all^
    "\tret\n" in
  let v_q = newvar_q (-1) in
  let v = ref(Ln(Imp(Var v_q,Rcd(rcd_cl [Var v_q;Axm Axm.stg])))) in
  !ns.ns_p <- ("_pp_v",Ast.Axm._pp_v)::!ns.ns_p;
  gns.ns_e <- (Ast.Axm._pp_v,ref(Etr_V(RP.A(R.Idx 0),RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|])))::gns.ns_e;
  gns.ns <- (Ast.Axm._pp_v,v)::gns.ns;
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
  !ns.ns_p <- ("_none",Ast.Axm._none)::!ns.ns_p;
  gns.ns_e <- (Ast.Axm._none,ref(Ctr(1,2)))::gns.ns_e;
  gns.ns <- (Ast.Axm._none,v)::gns.ns;
  let q0 = newvar_q (-1) in
  let v = ref(Ln(Imp(Var q0,App(Axm Axm.opn,Var q0)))) in
  !ns.ns_p <- ("_some",Ast.Axm._some)::!ns.ns_p;
  gns.ns_e <- (Ast.Axm._some,ref(Ctr(0,2)))::gns.ns_e;
  gns.ns <- (Ast.Axm._some,v)::gns.ns;

  !ns.ns_t <- ("_lst",ref(Ln(Axm Axm.lst)))::!ns.ns_t;
  let q0 = newvar_q (-1) in
  let v = ref(Ln(Imp(unt (),App(Axm Axm.lst,Var q0)))) in
  !ns.ns_p <- ("_nil",Ast.Axm._nil)::!ns.ns_p;
  gns.ns_e <- (Ast.Axm._nil,ref(Ctr(1,2)))::gns.ns_e;
  gns.ns <- (Ast.Axm._nil,v)::gns.ns;
  let q0 = newvar_q (-1) in
  let v = ref(Ln(Imp(Rcd(rcd_cl [Var q0;App(Axm Axm.lst,Var q0)]),App(Axm Axm.lst,Var q0)))) in
  !ns.ns_p <- ("_cns",Ast.Axm._cns)::!ns.ns_p;
  gns.ns_e <- (Ast.Axm._cns,ref(Ctr(0,2)))::gns.ns_e;
  gns.ns <- (Ast.Axm._cns,v)::gns.ns;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64;Axm Axm.r64])))) in
  !ns.ns_p <- ("_setge",Ast.Axm._setge)::!ns.ns_p;
  gns.ns <- (Ast.Axm._setge,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._setge,ref(E_K_WC))::gns.ns_e;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64])))) in
  !ns.ns_p <- ("_add",Ast.Axm._add)::!ns.ns_p;
  gns.ns <- (Ast.Axm._add,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._add,ref(E_K_WC))::gns.ns_e;

  let v = ref(Ln(Imp(Axm Axm.r64,Axm Axm.r64))) in
  !ns.ns_p <- ("_inc",Ast.Axm._inc)::!ns.ns_p;
  gns.ns <- (Ast.Axm._inc,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._inc,ref(E_K_WC))::gns.ns_e;

  let v = ref(Ln(Imp(Axm Axm.r64,Axm Axm.r64))) in
  !ns.ns_p <- ("_dec",Ast.Axm._dec)::!ns.ns_p;
  gns.ns <- (Ast.Axm._dec,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._dec,ref(E_K_WC))::gns.ns_e;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64])))) in
  !ns.ns_p <- ("_mov",Ast.Axm._mov)::!ns.ns_p;
  gns.ns <- (Ast.Axm._mov,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._mov,ref(E_K_WC))::gns.ns_e;

  let v = ref(Ln(Imp(Axm Axm.r64,Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64])))) in
  !ns.ns_p <- ("_mov_x",Ast.Axm._mov_x)::!ns.ns_p;
  gns.ns <- (Ast.Axm._mov_x,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._mov_x,ref(E_K_WC))::gns.ns_e;

  (se_emt_q^se_chr^se_dgt^se_u_al^se_l_al^se_emt^se_pp_v,em_emt_q^em_chr^em_dgt^em_l_al^em_u_al^em_emt^em_pp_v,ns,gns)
and emt_exe m =
  let (se_p,em_p,ns,gns) = (init_prm ()) in
  let (se,em,sx,pp) = (emt_m gns ns 0 m) in
  (*let epf = get_ep !ns f in*)
  let ex =
    "%include \"cmu.s\"\n"^
    "main:\n"^
    "\tmov r12,0\n"^
    "\tnot r12\n"^
    "\tcall SFLS_init\n"^
    sx^
    (*"\tmov rdi,0\n"^
      "\tcall mlc\n"^
      "\tmov rdi,rax\n"^
      "\tclc\n"^
      "\tcmp rdi,0\n"^ *)
    (*"\tcall NS_E_RDI_"^(Sgn.print epf)^"\n"^ *)
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
and mov_r s0 i1 i0 =
  if i1<0&&s0.(i0)&&(not s0.(i1)) then
    let l0 = lb () in
    ( s0.(i0)<-false;
      "\tbt r12,"^(string_of_int i0)^"\n"^
      "\tjc "^l0^"\n"^
      "\tmov rdi,"^(emt_reg_x86 i0)^"\n"^
      "\tcall dlt\n"^
      l0^":\n" )
  else if i0=i1&&s0.(i0) then ""
  else if s0.(i0)&&(not s0.(i1)) then
    let l0 = lb () in
    let l1 = lb () in
    ( s0.(i0)<-false; s0.(i1)<-true;
      if i1<9 then
        "\tmov "^(emt_reg_x86 i1)^","^(emt_reg_x86 i0)^"\n"^
        "\tbt r12,"^(string_of_int i0)^"\n"^
        "\tjc "^l0^"\n"^
        "\tbtr r12,"^(string_of_int i1)^"\n"^
        "\tjmp "^l1^"\n"^
        l0^":\n"^
        "\tbts r12,"^(string_of_int i1)^"\n"^
        l1^":\n"
      else
        "\tmov rdi,"^(emt_reg_x86 i0)^"\n"^
        "\tmov "^(emt_reg_x86 i1)^",rdi\n"^
        "\tbt r12,"^(string_of_int i0)^"\n"^
        "\tjc "^l0^"\n"^
        "\tbtr r12,"^(string_of_int i1)^"\n"^
        "\tjmp "^l1^"\n"^
        l0^":\n"^
        "\tbts r12,"^(string_of_int i1)^"\n"^
        l1^":\n"
    )
  else err "mov r 0"
and push_iv iv =
  let s0 = rset_iv iv in
  let (_,n,e0,e1) =
    Array.fold_left
      (fun (i,n,e0,e1) b ->
         if b then
           if i<9 then
             let e0 =
               e0^
               "\tmov QWORD [rsp+8+8*"^(string_of_int n)^"],"^(emt_reg_x86 i)^"\n" in
             let e1 =
               "\tmov "^(emt_reg_x86 i)^",QWORD [rsp+8+8*"^(string_of_int n)^"]\n"^
               "\tbt QWORD [rsp],"^(string_of_int i)^"\n"^
               (cf_set i)^
               e1 in
             (i+1,n+1,e0,e1)
           else
             let e0 =
               e0^
               "\tmov rdi,"^(emt_reg_x86 i)^"\n"^
               "\tmov QWORD [rsp+8+8*"^(string_of_int n)^"],rdi\n" in
             let e1 =
               "\tmov rdi,QWORD [rsp+8+8*"^(string_of_int n)^"]\n"^
               "\tmov "^(emt_reg_x86 i)^",rdi\n"^
               "\tbt QWORD [rsp],"^(string_of_int i)^"\n"^
               (cf_set i)^
               e1 in
             (i+1,n+1,e0,e1)
         else (i+1,n,e0,e1) )
      (0,0,"","") s0 in
  let e_0 =
    "; push_iv \n"^
    "\tsub rsp,"^(string_of_int (8*(n+1)))^"\n"^
    e0^
    "\tmov QWORD [rsp],r12\n" in
  let e_1 =
    "; pop_iv\n"^
    (*"\tmov r12,QWORD [rsp]\n"^ *)
    e1^
    "\tadd rsp,"^(string_of_int (8*(n+1)))^"\n" in
  (e_0,e_1)
and dlt_iv iv =
  let s0 = rset_iv iv in
  let e0 =
    Hashtbl.fold
      (fun _ r e ->
         let ei = dlt_ptn s0 r in
         e^ei )
      iv "" in
  e0
and dlt_ptn s0 i0 =
  ( match i0 with
    | RP.A(R.Idx i0) ->
      if s0.(i0) then
        let l0 = lb () in
        ( s0.(i0)<-false;
          "\tbt r12,"^(string_of_int i0)^"\n"^
          "\tjc "^l0^"\n"^
          "\tmov rdi,"^(emt_reg_x86 i0)^"\n"^
          "\tcall dlt\n"^
          l0^":\n" )
      else err "dlt_ptn 0"
    | RP.A(R.Agl(ia,_,pa)) ->
      ( s0.(ia)<-false;
        (dlt_ptn s0 pa) )
    | RP.A(R.AglStt(_,_,pa)) ->
      dlt_ptn s0 pa
    | RP.A(R.Etr(ie,pe)) ->
      ( s0.(ie)<-false;
        (dlt_ptn s0 pe))
    | RP.R rs ->
      Array.fold_left
        (fun e ri ->
           e^
           (dlt_ptn s0 ri))
        "" rs )
(* and emt_mov_ptn_to_r iv0 (i0:R.t) r1 =
   let s0 = rset_iv iv0 in
   let rec lp i0 r1 =
   ( match i0,r1 with
   | _,RP.A(R_A pa) -> Hashtbl.add iv0 pa i0; ""
   | _,RP.A(R_WC _) -> ""
   | RP.A(R.Idx i_0),RP.A(R.Idx i1) ->
      if i_0=i1 then ([],[]) else ([],[(i0,i1)])
    | _,RP.A(R.Idx i1) -> ([],[(i0,i1)])
    | RP.A(R.Idx i0),_ -> ([(i0,i1)],[])
    | RP.R rs0,RP.R rs1 ->
      let (_,l0,l1) =
        Array.fold_left
          ( fun (i,l0,l1) ri0 ->
              let (l0_0,l1_0) = lp ri0 rs1.(i) in
              (i+1,l0@l0_0,l1@l1_0) )
          (0,[],[]) rs0 in
      (l0,l1)
    | RP.A(R.Agl(ia0,ra0)),RP.A(R.Agl(ia1,ra1)) ->
      let (l0,l1) = lp ra0 ra1 in
      (l0,(RP.A(R.Idx ia0),ia1)::l1)
    | _ -> err "emt_mov_ptn_to_ptn 0" ) in
   let (l1,l0) = lp i0 i1 in *)
and emt_mov_ptn_to_ptn (s0:RSet.t) (i0:R.t) (i1:R.t) =
  let c_l = "; _emt_mov_ptn_to_ptn "^(R.print i0)^" ⊢ "^(R.print i1)^"\n" in
  let rec lp i0 i1 =
    ( match i0,i1 with
      | RP.A(R.Idx i_0),RP.A(R.Idx i1) ->
        if i_0=i1 then ([],[]) else ([],[(i0,i1)])
      | _,RP.A(R.Idx i1) -> ([],[(i0,i1)])
      | RP.A(R.Idx i0),_ -> ([(i0,i1)],[])
      | RP.R rs0,RP.R rs1 ->
        let (_,l0,l1) =
          Array.fold_left
            ( fun (i,l0,l1) ri0 ->
                let (l0_0,l1_0) = lp ri0 rs1.(i) in
                (i+1,l0@l0_0,l1@l1_0) )
            (0,[],[]) rs0 in
        (l0,l1)
      | RP.A(R.Agl(ia0,_,ra0)),RP.A(R.Agl(ia1,_,ra1)) ->
        let (l0,l1) = lp ra0 ra1 in
        (l0,(RP.A(R.Idx ia0),ia1)::l1)
      | _ -> err "emt_mov_ptn_to_ptn 0" ) in
  let (l1,l0) = lp i0 i1 in
  (*let s0 = RSet.ini () in
    let _ = rset_ptn s0 i0 in*)
  let s1 = RSet.ini () in
  let _ = rset_ptn s1 i1 in
  let rec lp_0 lt l0 e0 =
    ( match l0 with
      | [] -> (lt,e0)
      | _ ->
        let (lt,l0,e0) = lp_f0 lt l0 e0 in
        lp_0 lt l0 e0 )
  and lp_f0 lt l0 e0 =
    ( match l0 with
      | (RP.A(R.Idx i0),i1)::tl when i0=i1 ->
        let e1 =
          mov_r s0 i1 i0 in
        (lt,tl,e0^e1)
      | (p0,i1)::[] ->
        if s0.(i1)=true then
          let s3 = RSet.or_v s0 s1 in
          let i2 = RSet.min_0 s3 in
          let em = mov_r s0 i2 i1 in
          let lt = (i1,i2)::lt in
          let e1 =
            em^
            (mov_rl_ptn s0 i1 (subst_ptn lt p0)) in
          (lt,[],e0^e1)
        else
          let e1 =
            (mov_rl_ptn s0 i1 (subst_ptn lt p0)) in
          (lt,[],e0^e1)
      | (p0,i1)::tl ->
        if s0.(i1)=true then
          let (lt,l0,e1) = lp_f0 lt tl e0 in
          (lt,(p0,i1)::l0,e1)
        else
          let e1 =
            (mov_rl_ptn s0 i1 (subst_ptn lt p0)) in
          (lt,tl,e0^e1)
      | _ -> err "emt_mov_ptn_to_ptn 1" ) in
  let rec lp_1 lt l1 e0 =
    ( match l1 with
      | [] -> (lt,e0)
      | _ ->
        let (lt,l1,e0) = lp_f1 lt l1 e0 in
        lp_1 lt l1 e0 )
  and lp_f1 lt l1 e0 =
    ( match l1 with
      | (i0,p1)::[] ->
        let s_p1 = RSet.ini () in
        let _ = rset_ptn s_p1 p1 in
        let s_a0 = RSet.and_v s0 s_p1 in
        if RSet.is_zero s_a0 then
          let e1 =
            (mov_unrl_ptn s0 p1 (subst lt i0)) in
          (lt,[],e0^e1)
        else
          let s_o0 = RSet.or_v s0 s1 in
          let (_,lx) =
            Array.fold_left
              (fun (i,lx) b ->
                 if b then
                   let ix = RSet.min_0 s_o0 in
                   ( s_o0.(ix)<-true;
                     (i+1,(i,ix)::lx) )
                 else
                   (i+1,lx))
              (0,[]) s_a0 in
          let em =
            List.fold_left
              ( fun e1 (i,ix) ->
                  e1^
                  (mov_r s0 ix i))
              "" lx in
          let lt = lx@lt in
          let e1 =
            em^
            (mov_unrl_ptn s0 p1 (subst lt i0)) in
          (lt,[],e0^e1)
      | (i0,p1)::tl ->
        let s_p1 = RSet.ini () in
        let _ = rset_ptn s_p1 p1 in
        let s_a0 = RSet.and_v s0 s_p1 in
        if RSet.is_zero s_a0 then
          let (lt,l0,e1) = lp_f1 lt tl e0 in
          (lt,(i0,p1)::l0,e1)
        else
          let e1 =
            (mov_unrl_ptn s0 p1 (subst lt i0)) in
          (lt,tl,e0^e1)
      | _ -> err "emt_mov_ptn_to_ptn 1" ) in
  let (lt,e_rl) = lp_0 [] l0 "" in
  let (_,e_unrl) = lp_1 lt l1 "" in
  c_l^e_rl^e_unrl
and subst (lt:R.subst) (i0:int) =
  ( try List.assoc i0 lt with _ -> i0 )
and subst_ptn lt (p0:R.r_atm RP.t) = RP.map (subst_ptn_atm lt) p0
and subst_ptn_atm lt (a0:R.r_atm) =
  ( match a0 with
    | R.Idx i0 -> R.Idx (subst lt i0)
    | R.Agl(ia,i_n,pa) -> R.Agl(subst lt ia,i_n,subst_ptn lt pa)
    | R.AglStt(ia,i_n,pa) -> R.AglStt(ia,i_n,subst_ptn lt pa)
    | R.Etr(ie,pe) -> R.Etr(subst lt ie,subst_ptn lt pe) )
and mov_rl_ptn s0 i1 p0 =
  if i1<0 then
    dlt_ptn s0 p0
  else
    ( match p0 with
      | RP.A(R.Idx i0) ->
        (mov_r s0 i1 i0)
      | RP.A(R.Agl(ia,_,pa)) ->
        if s0.(ia) then
          let l0 = lb () in
          let l1 = lb () in
          let e0 = mov_rl_ptn s0 i1 pa in
          s0.(ia)<-false;
          s0.(i1)<-true;
          e0^
          "\tmov rsi,0\n"^
          "\tbt r12,"^(string_of_int i1)^"\n"^
          "\tjc "^l0^"\n"^
          "\tbts rsi,17\n"^
          "\tbt "^(emt_reg_x86 i1)^",0\n"^
          "\tjc "^l0^"\n"^
          "\tjmp "^l1^"\n"^
          l0^":\n"^
          "\tmov rax,rbx\n"^
          "\tmov rbx,QWORD [rbx]\n"^
          "\tmov rdi,0x0001_0001_0000_fffe\n"^
          "\tor rdi,rsi\n"^
          "\tmov QWORD [rax],rdi\n"^
          "\tmov QWORD [rax+8*1],"^(emt_reg_x86 i1)^"\n"^
          "\tmov "^(emt_reg_x86 i1)^",rax\n"^
          "\tbtr r12,"^(string_of_int i1)^"\n"^
          l1^":\n"^
          "\tmov rax,"^(emt_reg_x86 ia)^"\n"^
          "\tshl rax,56\n"^
          "\tor rax,1\n"^
          "\tmov rdi,rax\n"^
          "\tor "^(emt_reg_x86 i1)^",rdi\n"
        else err "mov_rl_ptn 0"
      | RP.R rs ->
        let e0 =
          "\tmov rax,rbx\n"^
          "\tmov rbx,QWORD [rbx]\n"^
          "\tmov rdi,0x0001_"^(Printf.sprintf "%04x" (Array.length rs))^"_0000_ffff\n"^
          "\tmov QWORD [rax],rdi\n"^
          "\tmov "^(emt_reg_x86 i1)^",rax\n"^
          "\tbtr r12,"^(string_of_int i1)^"\n" in
        s0.(i1)<-true;
        let im = RSet.min_0 s0 in
        let (_,e1) =
          Array.fold_left
            (fun (i,e1) ri ->
               let l0 = lb () in
               let l1 = lb () in
               s0.(im)<-false;
               let e1_0 = mov_rl_ptn s0 im ri in (*lp ri in *)
               let e1 =
                 e1^
                 e1_0^
                 "\tmov rdi,"^(emt_reg_x86 i1)^"\n"^
                 "\tmov QWORD [rdi+8*1+8*"^(string_of_int i)^"],"^(emt_reg_x86 im)^"\n"^
                 "\tbt r12,"^(string_of_int im)^"\n"^
                 "\tjc "^l0^"\n"^
                 "\tbtr QWORD [rdi],"^(string_of_int i)^"\n"^
                 "\tjmp "^l1^"\n"^
                 l0^":\n"^
                 "\tbts QWORD [rdi],"^(string_of_int i)^"\n"^
                 l1^":\n" in
               (i+1,e1))
            (0,"") rs in
        s0.(im)<-false;
        e0^
        e1
      | _ -> err "mov_rl_ptn 2" )
and mov_unrl_ptn s0 p1 i0 =
  if s0.(i0) then
    ( match p1 with
      | RP.A(R.Idx i1) -> (mov_r s0 i1 i0)
      | RP.A(R.Agl(ia,_,pa)) ->
        if (not s0.(ia)) then
          let l0 = lb () in
          ( s0.(ia)<-true;
            let e0 =
              "\tmov "^(emt_reg_x86 ia)^","^(emt_reg_x86 i0)^"\n"^
              "\tshr "^(emt_reg_x86 ia)^",56\n"^
              "\tbts r12,"^(string_of_int ia)^"\n"^
              "\tmov rax,0x00ff_ffff_ffff_fffe\n"^
              "\tand rax,"^(emt_reg_x86 i0)^"\n"^
              "\tbt rax,17\n"^
              "\tjnc "^l0^"\n"^
              "\tbt QWORD [rax],0\n"^
              (cf_set i0)^
              "\tmov "^(emt_reg_x86 i0)^",QWORD [rax+8*1]\n"^
              "\tmov QWORD [rax],rbx\n"^
              "\tmov rbx,rax\n"^
              l0^":\n"^
              (mov_unrl_ptn s0 pa i0) in
            e0 )
        else err "mov_unrl_ptn 0"
      | RP.R rs ->
        let s1 = Array.copy s0 in
        let _ = rset_ptn s1 p1 in
        let im = RSet.min_0 s1 in
        let (_,e1) =
          Array.fold_left
            ( fun (i,e1) ri ->
                s0.(im)<-true;
                let e1_0 = mov_unrl_ptn s0 ri im in
                let e1 =
                  e1^
                  "\tmov rdi,"^(emt_reg_x86 i0)^"\n"^
                  "\tmov "^(emt_reg_x86 im)^",QWORD [rdi+8*1+8*"^(string_of_int i)^"]\n"^
                  "\tbt QWORD [rdi],"^(string_of_int i)^"\n"^
                  (cf_set im)^
                  e1_0 in
                (i+1,e1))
            (0,"") rs in
        s0.(i0)<-false;
        e1^
        "\tmov rdi,"^(emt_reg_x86 i0)^"\n"^
        "\tmov QWORD [rdi],rbx\n"^
        "\tmov rbx,rdi\n"
      | _ -> err "mov_rl_ptn 2" )
  else err "mov_unrl_ptn 2"

and mk_idx_k iv p =
  ( match p with
    | RP.A(_,Mtc_R r) -> mk_idx_k iv r
    | RP.A(_,Mtc_R_Agl(i0,i_n,ra)) -> RP.A(R.AglStt(i0,i_n,mk_idx_k iv ra))
    | RP.A(pa,Mtc_R_Top) -> Hashtbl.find iv (mk_r_p pa)
    | RP.A(pa,Mtc_R_Cst _) -> Hashtbl.find iv (mk_r_p pa)
    | RP.R rs -> RP.R(Array.map (mk_idx_k iv) rs) )
and emt_ir i1 gns ns iv p =
  pnt true ("enter emt_ir:"^(print_line p)^"\n");
  let c_l = "; "^(print_line p)^" ; {> "^(pnt_iv gns iv)^" }\n" in
  ( match p with
    | Ret r ->
      let ir = csm_ptn_iv (mk_idx_ptn r) iv in
      let c0 = cmt ("\t∎ "^(emt_ptn ir)) in
      let e0 = dlt_iv iv in
      let s0 = RSet.ini () in
      let _ = rset_ptn s0 ir in
      let e1 = emt_mov_ptn_to_ptn s0 ir i1 in
      c_l^c0^e0^e1^
      "\tret\n"
    | Exn _ -> err "emt_ir Exn 0"
    (*let i = idx s r in
      let _ = idx_csm s r in
      "\tmov rbx,"^(emt_reg_x86 i)^"\n"^
      "\tbt r12,"^(string_of_int i)^"\n"^
      "\tjmp err\n" *)
    | Mtc(r,ps) ->
      let psl = Array.to_list ps in
      (*let rec emt_mtc_set_ptn iv0 i0 p0 =
        ( match i0,p0 with
          | _,RP.A(R_A pa) -> Hashtbl.add iv0 pa i0; ""
          | _,RP.A(R_WC _) -> ""
          | RP.R irs0,RP.R ips ->
            let (_,e0) =
              Array.fold_left
                ( fun (i,e0) ri ->
                    let ei = emt_mtc_set_ptn iv0 ips.(i) ri in
                    (i+1,e0^ei) )
                (0,"") irs0 in
            e0
          | RP.A(Idx i0),RP.R ips ->

            let rec emt_mk_mtc_ptn iv0 k0 =
        ( match k0 with
          | RP.A(R_A p0,rm) ->
            ( try
                let i0 = Hashtbl.find p0 iv0 in
                let _ = set_mk_mtc_ptn iv0 i0 rm in
                ""
              with _ ->
                let ya = inst_idx_ptn gns 0 (R_A p0) in
                  let _ = gen (ref []) (-1) ya in
                  let iya = alc_idx_ty (rset_iv iv0) ya in
                    let _ = mk_idx_iv iv0 iya (mk_idx_ptn ra) in
                let _ = set_mk_mtc_ptn iv0 iya rm in

            )) *)
      let rec emt_mtc_ps psl =
        ( match psl with
          | ((ri,es,Some (dl,d)),p)::psl_tl ->
            let ivi = Hashtbl.copy iv in
            let d_l =
              List.fold_left
                ( fun dl p ->
                    let y = inst_idx_ptn gns 0 (R_A p) in
                    let _ = gen (ref []) (-1) y in
                    let iy = alc_idx_ty (rset_iv ivi) y in
                    Hashtbl.add ivi p iy;
                    (p,iy)::dl )
                [] d in
            let d_l = List.rev d_l in
            let e0 = emt_ir i1 gns ns ivi p in
            let (q0,er) = emt_mtc_ps psl_tl in
            let lbi = "MTC_"^(lb ()) in
            let e1 =
              lbi^":\n"^
              e0 in
            ((ri,es,dl,d_l,lbi)::q0,e1^er)
          | [] -> ([],"")
          | _ -> err "emt_mtc_ps 0"        ) in
      let (psl,e_s) = emt_mtc_ps psl in
      let rec emt_mtc iv0 h0 s0 k0 l0 psl ir =
        let e_cv = print_mtc_v_k k0 in
        Util.pnt true ("enter emt_mtc: "^e_cv^"\n");
        ( match psl with
          | (ri,[],dl,d_l,lbi)::_ ->
            let _ = mk_idx_iv iv0 ir (mk_idx_ptn ri) in
            let e_c0 = "; "^(List.fold_left ( fun s i -> s^"/"^(string_of_int i)) "" h0)^"/\n" in
            let s1 = rset_iv iv0 in
            let e_d_l =
              List.fold_left
                ( fun e_d_l p ->
                    let ii = csm_iv (R_A p) iv0 in
                    let ei = dlt_ptn s1 ii in
                    e_d_l^ei )
                "" dl in
            let e_dl =
              List.fold_left
                ( fun e_dl (p,ip) ->
                    let s0 = rset_iv iv0 in
                    let ii = csm_iv (R_A p) iv0 in
                    let ei = emt_mov_ptn_to_ptn s0 ii ip in
                    Hashtbl.add iv0 p ip;
                    e_dl^ei)
                "" d_l in
            Util.pnt true e_c0;
            e_d_l^e_dl^
            e_c0^
            "\tjmp "^lbi^"\n"
(*let k1 = mk_mtc_v_k_eq_and k0 ri in
            pnt true "X4\n";
            emt_mtc_eq iv0 h0 0 s0 k1 l0  p psl_tl dl d_l lbi*)
          | (ri,es,dl,d_l,lbi)::psl_tl ->
            let _ = mk_idx_iv iv0 ir (mk_idx_ptn ri) in
            let e_c0 = "; "^(List.fold_left ( fun s i -> s^"/"^(string_of_int i)) "" h0)^"/\n" in
            Util.pnt true e_c0;
            let k1 = mk_mtc_v_k_eq_and k0 ri in
            pnt true "X4\n";
            emt_mtc_eq iv0 h0 0 s0 k1 l0 es p psl_tl dl d_l lbi
          | [] ->
            if l0=[] then "; mtc x 1"
            else err "emt_mtc 0" )
      and emt_mtc_eq iv0 h0 i s0 k1 l0 es p psl_tl dl d_l lbi =
        Util.pnt true "enter emt_mtc_eq:\n";
        ( match es with
          | (vx,pa)::[] ->
            Util.pnt true "E 0:\n";
            let k2 = mk_mtc_v_k_eq k1 (mk_idx vx) !pa in
            let iv_t = Hashtbl.copy iv0 in
            let ix = csm_iv (mk_idx vx) iv_t in
            let ik = mk_idx_k iv0 k1 in
            let s1 = rset_iv iv0 in
            let e_d_l =
              List.fold_left
                ( fun e_d_l p ->
                    let ii = csm_iv (R_A p) iv0 in
                    let ei = dlt_ptn s1 ii in
                    e_d_l^ei )
                "" dl in
            let e_dl =
              List.fold_left
                ( fun e_dl (p,ip) ->
                    let s0 = rset_iv iv0 in
                    let ii = csm_iv (R_A p) iv0 in
                    let ei = emt_mov_ptn_to_ptn s0 ii ip in
                    (*Hashtbl.add iv0 p ip;*)
                    e_dl^ei )
                "" d_l in
            let lb0 = lb () in
            ( match !pa with
              | Eq_Agl(_,_,_,_) -> ";Eq_Agl\n"
              (*let ya = inst_idx_ptn gns 0 (mk_idx_ptn ra) in
                let _ = gen (ref []) (-1) ya in
                let iya = alc_idx_ty (rset_iv iv0) ya in
                  let _ = mk_idx_iv iv0 iya (mk_idx_ptn ra) in
                  let*)
              | P_Cst c0 ->
                ( match c0 with
                  | P_R64 x0 ->
                    ( match ix with
                      | RP.A(R.Idx ix0) ->
                        let ec =
                          "\tmov QWORD rax,0x"^(Int64.format "%x" x0)^"\n"^
                          "\tcmp rax,"^(emt_reg_x86 ix0)^"\n"^
                          "\tjnz "^lb0^"\n"^
                          e_d_l^e_dl^
                          "\tjmp "^lbi^"\n"^
                          lb0^":\n"
                        in
                        pnt true "X0\n";
                        pnt true "X1\n";
                        let e0 = "; "^(List.fold_left (fun s i -> s^"/"^(string_of_int i)) "" (i::h0))^"\n" in
                        let ms0 = mk_mtc_set k2 in
                        let l1 = mtc_sub l0 [ms0] in
                        let e2 = emt_mtc iv0 (i::h0) s0 k1 l1 psl_tl ik in
                        e0^ec^e2
                      | _ -> err "emt_mtc_eq 4" )
                  | _ -> err "emt_mtc_eq 5" )
              | _ -> err "emt_mtc_eq 1" )
          | (vx,pa)::es_tl ->
            pnt true "X2\n";
            let ik = mk_idx_k iv0 k1 in
            let k2 = mk_mtc_v_k_eq k1 (mk_idx vx) !pa in
            pnt true "X3\n";
            let e0 = "; "^(List.fold_left (fun s i -> s^"/"^(string_of_int i)) "" (i::h0))^"\n" in
            let ms0 = mk_mtc_set k2 in
            let l1 = mtc_sub l0 [ms0] in
            let l2 = mtc_and l0 [ms0] in
            let iv_t = Hashtbl.copy iv0 in
            let e1 = emt_mtc_eq iv0 h0 (i+1) s0 k2 l2 es_tl p psl_tl dl d_l lbi in
            let e2 = emt_mtc iv_t (i::h0) s0 k1 l1 psl_tl ik in
            e0^e1^e2
          | [] -> "" ) in
      let ir = csm_ptn_iv (mk_idx_ptn r) iv in
      let s0 = rset_iv iv in
      let iv_0 = Hashtbl.copy iv in
      (emt_mtc iv_0 [] s0 (mk_mtc_v_k (mk_idx_ptn r)) [RP.A Mtc_Top] psl ir)^
      e_s
    | IL_Glb_Call (n,x) ->
      let ix = csm_ptn_iv (mk_idx_ptn x) iv in
      let c0 = cmt ("\t"^(pnt_stt_name !n)^" "^(emt_ptn ix)^" ⊢| ") in
      let fp = slv_ns0 !ns n in
      let f = get_ns_e gns fp in
      ( match !f with
        | Ctr(j,i_n) ->
          let e0 = dlt_iv iv in
          let s1 = RSet.ini () in
          let _ = rset_ptn s1 ix in
          let im = RSet.min_0 s1 in
          s1.(im)<-true;
          let icx = RP.A(R.Agl(im,i_n,ix)) in
          let e1 =
            c_l^
            c0^
            e0^
            "\tmov "^(emt_reg_x86 im)^","^(string_of_int j)^
            "\tbts r12,"^(string_of_int im)^"\n"^
            (emt_mov_ptn_to_ptn s1 icx i1)^
            "\tret\n" in
          e1
        | Etr_V(f_i0,_) ->
          let e0 = dlt_iv iv in
          let s0 = RSet.ini () in
          let _ = rset_ptn s0 ix in
          (* let im = RSet.min_0 s0 in
             s0.(im)<-true;
             let icx = RP.A(R.Agl(im,ix)) in *)
          let e1 =
            c_l^
            c0^
            e0^
            (emt_mov_ptn_to_ptn s0 ix f_i0)^
            "\tjmp NS_E_"^(Sgn.print fp)^"\n"
          in
          e1
        | _ -> "; ir_glb_call\n" )
    | Seq(n,p1) ->
      let s0 =
        ( match n with
          | IR_Id{ contents=IR_Id_C(_,_) } -> err "emt_ir IR_Id 0"
          (*let ir = idx_ptn s r in
            let c0 =
            cmt ("\t$ "^(emt_ptn ir)^" ⊢ "^(Array.fold_left ( fun b r -> b^","^(pnt_ptn r)) "" rs)^
                 rtl^(Arr.fld_l (fun s r -> s^","^(pnt_ptn r)) "" rs)) in
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
            c0^e0^e1*)
          (*| IR_Call((f,x),y) ->
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
              let c0 = cmt ("\t◂ "^(emt_ptn (A i_f))^","^cx^" ⊢ "^cy^rtl^(pnt_ptn y)) in
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
            ) *)
          | IR_Glb_Call(n,x,y) ->
            let ep = slv_ns0 !ns n in
            let af = !(get_ns_e gns ep) in
            let yf = get_ns gns ep in
            let v0 = newvar () in
            let v1 = newvar () in
            let _ = unify [] (Imp(Var v0,Var v1)) (inst 0 (Var yf)) in
            let _ = gen (ref []) (-1) (Var v0) in
            let _ = gen (ref []) (-1) (Var v1) in
            ( match af with
              (*  | a when a=Ast.Axm._sgn ->
                  let open Rcd_Ptn in
                  let ix = csm_ptn_iv x iv in
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
                  | _ -> err "emt_ir err 1" ) *)
              | af ->
                ( match af with
                  | Ctr(j,i_n) ->
                    let im = RSet.min_0 (rset_iv iv) in
                    let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                    let icx = RP.A(R.Agl(im,i_n,ix)) in
                    let _ = mk_idx_iv iv icx (mk_idx_ptn y) in
                    let c0 = "; "^(pnt_stt_name !n)^" "^(emt_ptn ix)^" ⊢ "^(emt_ptn icx)^"\n" in
                    let e1 =
                      c_l^
                      c0^
                      "\tmov "^(emt_reg_x86 im)^","^(string_of_int j)^"\n"^
                      "\tbts r12,"^(string_of_int im)^"\n" in
                    e1
                  | Etr_V(f_i0,f_i1) ->
                    let y0_p = inst_ptn gns 0 y in
                    let _ = gen (ref []) (-1) y0_p in
                    let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                    let iv0 = Hashtbl.copy iv in
                    let (e_0,e_1) = push_iv iv0 in
                    let iy = alc_idx_ty (rset_iv iv) y0_p in
                    let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                    let s0 = RSet.ini () in
                    let _ = rset_ptn s0 ix in
                    let s1 = RSet.ini () in
                    let _ = rset_ptn s1 f_i1 in
                    let e_c0 = (emt_mov_ptn_to_ptn s0 ix f_i0) in
                    let e_c1 = (emt_mov_ptn_to_ptn s1 f_i1 iy) in
                    let c0 = "; "^(pnt_stt_name !n)^" "^(emt_ptn ix)^" ⊢ "^(emt_ptn iy)^"\n" in
                    let e1 =
                      c_l^
                      c0^
                      e_0^
                      e_c0^
                      "\tcall NS_E_"^(Sgn.print ep)^"\n"^
                      e_c1^
                      e_1
                    in
                    e1
                  | E_K_WC ->
                    ( match ep with
                      | ep when ep=Ast.Axm._add ->
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                            let _ = mk_idx_iv iv ix (mk_idx_ptn y) in
                            if x1<9 then
                              c_l^
                              "\tadd "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                            else
                              c_l^
                              "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                              "\tadd "^(emt_reg_x86 x0)^",rdi\n"
                          | RP.A(R.Idx xp) ->
                            let s0 = rset_iv iv in
                            s0.(xp)<-true;
                            let im = RSet.min_0 s0 in                            let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                            let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                            c_l^
                            "\tmov rax,"^(emt_reg_x86 xp)^"\n"^
                            "\tmov QWORD [rax],rbx\n"^
                            "\tmov rbx,rax\n"^
                            "\tmov rax,QWORD [rbx+8*1]\n"^
                            "\tmov rdi,QWORD [rbx+8*2]\n"^
                            "\tadd rdi,rax\n"^
                            "\tmov "^(emt_reg_x86 xp)^",rdi\n"^
                            "\tmov "^(emt_reg_x86 im)^",rax\n"^
                            "\tbts r12,"^(string_of_int xp)^"\n"^
                            "\tbts r12,"^(string_of_int im)^"\n"
                          | _ -> err "emt_ir _add 0" )
                      | ep when ep=Ast.Axm._inc ->
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.A(R.Idx x0) ->
                            let _ = mk_idx_iv iv ix (mk_idx_ptn y) in
                              c_l^
                              "\tadd "^(emt_reg_x86 x0)^",1\n"
                          | _ -> err "emt_ir _inc 0" )
                      | ep when ep=Ast.Axm._dec ->
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.A(R.Idx x0) ->
                            let _ = mk_idx_iv iv ix (mk_idx_ptn y) in
                            c_l^
                            "\tsub "^(emt_reg_x86 x0)^",1\n"
                          | _ -> err "emt_ir _inc 0" )
                      | ep when ep=Ast.Axm._setge ->
                        let s0 = rset_iv iv in
                        let im = RSet.min_0 s0 in
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                            let iy = RP.R [|RP.A(R.Idx x0);RP.A(R.Idx x1);RP.A(R.Idx im)|] in
                        let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                            if x1<9 then
                              c_l^
                              "\tcmp "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"^
                              "\tmov rsi,0\n"^
                              "\tsetge sil\n"^
                              "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                              "\tbts r12,"^(string_of_int im)^"\n"
                            else
                              c_l^
                              "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                              "\tcmp "^(emt_reg_x86 x0)^",rdi\n"^
                              "\tmov rsi,0\n"^
                              "\tsetge sil\n"^
                              "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                              "\tbts r12,"^(string_of_int im)^"\n"
                          | RP.A(R.Idx xp) ->
                            let s0 = rset_iv iv in
                            s0.(xp)<-true;
                            let im0 = RSet.min_0 s0 in
                            s0.(im0)<-true;
                            let im1 = RSet.min_0 s0 in
                            let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im0);RP.A(R.Idx im1)|] in
                            let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                            c_l^
                            "\tmov rax,"^(emt_reg_x86 xp)^"\n"^
                            "\tmov QWORD [rax],rbx\n"^
                            "\tmov rbx,rax\n"^
                            "\tmov rax,QWORD [rbx+8*1]\n"^
                            "\tmov rdi,QWORD [rbx+8*2]\n"^
                            "\tcmp rax,rdi\n"^
                            "\tmov rsi,0\n"^
                            "\tsetge sil\n"^
                            "\tmov "^(emt_reg_x86 im1)^",rsi\n"^
                            "\tbts r12,"^(string_of_int im1)^"\n"^
                            "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                            "\tmov "^(emt_reg_x86 im0)^",rdi\n"^
                            "\tbts r12,"^(string_of_int xp)^"\n"^
                            "\tbts r12,"^(string_of_int im0)^"\n"
                          | _ -> err "emt_ir _setge 0" )
                      | ep when ep=Ast.Axm._mov ->
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                            let _ = mk_idx_iv iv ix (mk_idx_ptn y) in
                            if x1<9 then
                              c_l^
                              "\tmov "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                            else
                              c_l^
                              "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                              "\tmov "^(emt_reg_x86 x0)^",rdi\n"
                          | RP.A(R.Idx xp) ->
                            let s0 = rset_iv iv in
                            s0.(xp)<-true;
                            let im = RSet.min_0 s0 in
                            let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                            let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                            c_l^
                            "\tmov rax,"^(emt_reg_x86 xp)^"\n"^
                            "\tmov QWORD [rax],rbx\n"^
                            "\tmov rbx,rax\n"^
                            "\tmov rax,QWORD [rbx+8*1]\n"^
                            "\tmov rdi,QWORD [rbx+8*2]\n"^
                            "\tmov rdi,rax\n"^
                            "\tmov "^(emt_reg_x86 xp)^",rdi\n"^
                            "\tmov "^(emt_reg_x86 im)^",rax\n"^
                            "\tbts r12,"^(string_of_int xp)^"\n"^
                            "\tbts r12,"^(string_of_int im)^"\n"
                          | _ -> err "emt_ir _mov 0" )
                      | ep when ep=Ast.Axm._mov_x ->
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.A(R.Idx x0) ->
                            let s0 = rset_iv iv in
                            s0.(x0)<-true;
                            let im = RSet.min_0 s0 in
                            let iy = RP.R [|RP.A(R.Idx x0);RP.A(R.Idx im)|] in
                            let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                            if x0<9&&im<9 then
                              c_l^
                              "\tmov "^(emt_reg_x86 im)^","^(emt_reg_x86 x0)^"\n"
                            else
                              c_l^
                              "\tmov rdi,"^(emt_reg_x86 x0)^"\n"^
                              "\tmov "^(emt_reg_x86 im)^",rdi\n"
                          | _ -> err "emt_ir _mov_x 0" )
                      | _ -> err "emt_ir _prm 0" )
                  | _ -> err "met_ir etr 3"
                )
            )
          | IR_Glb_Out(_,_) -> err "emt_ir IR_Glb_Out 0"
          (*let (ep,_) = !(get_ns_e !ns o) in
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
            lb0^":\n" *)
          | IR_Exp(Ast.ExpCst(Cst.S8 c),RP.R [||],RP.A y) ->
            let im = RSet.min_0 (rset_iv iv) in
            let iy = RP.A(R.Idx im) in
            let _ = mk_idx_iv iv iy (mk_idx_ptn (RP.A y)) in
            let bs = Bytes.of_string c in
            let sl = Bytes.length bs in
            let c0 = cmt ("\t» "^(print_exp (Ast.ExpCst(Cst.S8 c)))^" _ ⊢ "^(R.print (RP.A(R.Idx im)))^rtl^(pnt_ptn (RP.A y))) in
            let lc = Util.fmt_of_string c in
            let (_,e_l) =
              List.fold_left
                (fun (i,e_l) si ->
                   let e_i =
                     "\tmov rax,"^si^"\n"^
                     "\tmov QWORD [rdi+8*1+8*"^(string_of_int i)^"],rax\n" in
                   (i+1,e_l^e_i))
                (0,"") lc in

            let e0 =
              c0^
              push_all^
              "\tmov rdi,"^(string_of_int sl)^"\n"^
              "\tcall mlc_s8\n"^
              pop_all^
              "\tmov rdi,rax\n"^
              e_l^
              "\tmov "^(emt_reg_x86 im)^",rdi\n"^
              "\tbtr r12,"^(string_of_int im)^"\n" in
            e0
          | IR_Exp(Ast.ExpCst(Cst.R64 x),RP.R[||],RP.A y) ->
            let im = RSet.min_0 (rset_iv iv) in
            let iy = RP.A(R.Idx im) in
            let _ = mk_idx_iv iv iy (mk_idx_ptn (RP.A y)) in
            let c0 = cmt ("\t» "^(print_exp (ExpCst(Cst.R64 x)))^" _ ⊢ "^(emt_ptn iy)^rtl^(pnt_ptn (RP.A y))) in
            c_l^
            c0^
            ( if im<9 then
                "\tmov rdi,0x"^(Int64.format "%x" x)^"\n"^
                "\tmov "^(emt_reg_x86 im)^",rdi\n"
              else
                "\tmov "^(emt_reg_x86 im)^",0x"^(Int64.format "%x" x)^"\n" )^
            "\tbts r12,"^(string_of_int im)^"\n"
          (*let ir = idx_crt s r in
            let im = idx_min 0 s in
            let rm = emt_reg_x86 im in
            let e0 =
            "\tmov QWORD "^rm^",0x"^(Int64.format "%x" x)^"\n"^
            (*"\tmov QWORD "^(emt_reg_x86 ir)^","^rm^"\n"*)
            (mov_idx im ir)
            (* "\tbts r12,"^(string_of_int ir)^"\n" *)
            ^"\tor r12,"^(emt_0b ir)^"\n" in
            c0^e0
          *)
          | IR_Exp(Ast.Name _,_,Rcd_Ptn.A _) -> err "emt_ir T2"
          (*let (epf,_) = (try !(get_ns_e !ns f) with _ -> err "emt_ir a2") in
            let ir = idx_crt s r in
            let c0 = cmt ("\t» "^(pnt_name f)^" _ ⊢ "^(emt_ptn (Rcd_Ptn.A ir))^rtl^(pnt_ptn (Rcd_Ptn.A r))) in
            let im = idx_min 0 s in
            let rm = emt_reg_x86 im in
            let e0 =
            "\tmov QWORD [tmp],rbx\n"^
            "\tmov rbx,0x0001000000000000\n"^
            "\tadd QWORD [NS_E_DYN_"^(Sgn.print epf)^"],rbx\n"^
            "\tmov rbx,QWORD [tmp]\n"^
            "\tmov QWORD "^rm^",NS_E_DYN_"^(Sgn.print epf)^"\n"^
            (mov_idx im ir)
            (* "\tbts r12,"^(string_of_int ir)^"\n" *)
            ^"\tand r12,~"^(emt_0b ir)^"\n" in
            c0^e0 *)
          | IR_S8 { contents=IR_S8_C(_,_,_) } -> err "emt_ir T3"
          (* let lb_x = lb () in
             let lb_m = lb () in
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
             Array.fold_left
              (fun (i,e_a) c ->
                 let lb_c0 = lb () in
                 let e_i =
                   "\tmov r14,"^(emt_reg_x86 is0.(i))^"\n"^
                   "\tmov QWORD [ir_s8_vct+8*"^(string_of_int i)^"],r14\n"^
                   "\tmov r14,[r14]\n"^
                   "\tmov r15,r14\n"^
                   "\tshl r14,16\n"^
                   "\tshr r14,48\n"^
                   "\tshl r14,3\n"^
                   "\tand r15,0b111\n"^
                   "\tcmp r15,0\n"^
                   "\tjnz "^lb_c0^"\n"^
                   "\tmov r15,0b1000\n"^
                   lb_c0^":\n"^
                   "\tsub r14,r15\n"^
                   "\tmov QWORD [ir_s8_len_vct+8*"^(string_of_int i)^"],r14\n"^
                   "\timul r14,"^(string_of_int c)^"\n"^
                   "\tadd rbx,r14\n" in
                 (i+1,e_a^e_i)) (0,"") rc0 in
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
               ( fun e_p p ->
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
                     "\tmov rbx,QWORD [ir_s8_len_vct+8*"^(string_of_int i)^"]\n"^
                     "\tadd r15,8\n"^
                     "\tpush rax\n"^
                     lb_0^":\n"^
                     "\tmov al,BYTE [r15]\n"^
                     "\tcmp rbx,0\n"^
                     "\tjz "^lb_1^"\n"^
                     "\tmov BYTE [r13+8*1+r14],al\n"^
                     "\tadd r14,1\n"^
                     "\tadd r15,1\n"^
                     "\tsub rbx,1\n"^
                     "\tjmp "^lb_0^"\n"^
                     lb_1^":\n"^
                     "\tpop rax\n"
                   | Ast.S8_Name n ->
                     let e = get_ns_e !ns n in
                     ( match !e with
                       | (_,Cst_Stt(Cst.S8 s)) ->
                         let l_s = String.length s in
                         let bl = l_s / 8 in
                         (*let m = l_s mod 8 in*)
                         let (lc,ml) = Util.fmt_of_string_m s in
                         let (_,e_l) =
                           List.fold_left
                             (fun (i,e_l) si ->
                                let e_i =
                                  "\tmov rbx,"^si^"\n"^
                                  "\tmov QWORD [r13+r14+8*1+8*"^(string_of_int i)^"],rbx\n" in
                                (i+1,e_l^e_i))
                             (0,"") lc in
                         let (_,e_m) =
                           List.fold_left
                             (fun (i,e_m) sj ->
                                let e_i =
                                  "\tmov rbx,0x"^sj^"\n"^
                                  "\tmov BYTE [r13+r14+8*1+8*"^(string_of_int bl)^"+"^(string_of_int i)^"],bl\n" in
                                (i+1,e_m^e_i))
                             (0,"") ml in
                         e_p^
                         "; \""^(pnt_name n)^"\"\n"^
                         (*(lp 0)*)
                         e_l^
                         e_m^
                         "\tadd r14,"^(string_of_int l_s)^"\n"
                       | _ -> err "emt_ir _^ 0" ) )
               "" pl
             )^
             "; //\n"^
             "\tmov rbx,QWORD [r13]\n"^
             "\tand rbx,0b111\n"^
             "\tcmp rbx,0\n"^
             "\tjnz "^lb_m^"\n"^
             "\tmov rbx,0b1000\n"^
             lb_m^":\n"^
             lb_x^":\n"^
             "\tmov BYTE [r13+8*1+r14],0\n"^
             "\tsub rbx,1\n"^
             "\tadd r14,1\n"^
             "\tcmp rbx,0\n"^
             "\tjnz "^lb_x^"\n"^
             "\tmov "^(emt_reg_x86 ir1.(0))^",r13\n"^
             "\tbtr r12,"^(string_of_int ir1.(0))^"\n" in
             e0^e_a^e_1 *)
          | _ -> err "emt_etr 0" ) in
      s0^(emt_ir i1 gns ns iv p1)
    | _ -> err "emt_ir T4"
  )
and emt_ptn r = R.print r (*
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
    | A (Idx (-2)) -> err "emt_get_ptn 0"
    | A i ->
      let v =
        ( try Hashtbl.find s i with _ -> err ("emt_get_ptn 1:"^(pnt_s s)^","^(idx dst)^","^(emt_ptn r))) in
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
    | "rax" -> "al" | "rdi" -> "dil" | "rsi" -> "sil" | "rdx" -> "dl"
    | "rcx" -> "cl" | "r8" ->  "r8b" | "r9" -> "r9b" | "r10" -> "r10b"
    | "r11" -> "r11b" | _ ->  err "rb 0" )
*)
