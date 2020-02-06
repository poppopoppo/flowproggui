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
        if b then i else lp (i-1) in
    lp 63
  let pnt v =
    let m = max_1 v in
    let s = String.init (m+1)
        (fun i -> if v.(i) then '1' else '0' ) in
    "{| "^s^"0.. |}"
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
  and v = (t, Sgn.t) v_t
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
    let arr = sgn ()
    let ext = sgn ()
    let nat = sgn ()
    let v = sgn ()
    let z_n = sgn ()
    let fd = sgn ()
    let z_u = sgn ()
    let r64 = sgn ()
    let r32 = sgn ()
    let r16 = sgn ()
    let r2 = sgn ()
    let zn = sgn ()
    let lst = sgn ()
    let opn = sgn ()
    let sum = sgn ()
    let sgn_p = sgn ()
    let stg = sgn ()
    let out_p = sgn ()
    let exn_p = sgn ()
  end
  let newvar () =
    let v = ref (WC (sgn())) in
    v
  let newvar_l l =
    let v = ref (V (sgn(),l)) in
    v
  let newvar_q l =
    let v = ref (Q (sgn(),l)) in
    v
  let print_v v =
    ( match !v with 
      | WC p
      | V(p,_) 
      | Q(p,_) ->  (Sgn.print p)^"'" 
      | N n -> pnt_name n 
      | N_Ln(n,_) -> pnt_name n 
      | Ln _ -> "_'" )
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
        (*Util.pnt true "P t1\n"; *)
        let i = print_v v in
        ( match !v with
          | WC _-> "_"
          | V (_,l) -> "v"^i^"''("^(string_of_int l)^")"
          | Q (_,l) -> "t"^i^"'("^(string_of_int l)^")"
          | Ln y ->
            (*Util.pnt true "P t2\n";*)
            print y
          | N n -> pnt_name n
          | N_Ln (n,y) ->
            (*Util.pnt true "P t3\n";*)
            (pnt_name n)^"(="^(print y)^")" )
      | App(y0,y1) ->
        (*Util.pnt true "P t4\n";*)
        "("^(print y0)^")◂("^(print y1)^")"
      | Imp(y0,y1) ->
        (*Util.pnt true "P t5\n";*)
        (print y0)^"→"^(print y1)
      | Rcd r -> "{ "^(print_rcd r)^"}"
      | Abs(v,y) ->
        (*Util.pnt true "P t0\n";*)
        "∀["^(print_v v)^"]."^(print y)
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
          | Q (_,-2) -> v := Ln (Var x)
          | Q (_,q) when q<(-2) -> v := Q (sgn(),q+1)
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
    | AglUnn of int * t array
    | Etr of int * t
  and r_t =
    | T_Q | T_C | T_NC
  and mov_t = M_Dlt | M_Gbg
  type subst = (int * int) list
  let rec print a = RP.print print_atm a
  and print_atm a =
    ( match a with
      | Idx i -> (string_of_int i)^"\'"
      | Agl(ia,_,i) -> (string_of_int ia)^"\'◂"^(print i)
      | AglStt(i0,_,r) -> "°"^(string_of_int i0)^"◂"^(print r)
      | AglUnn(ia,rs) -> (string_of_int ia)^"\'◂ ∐[ "^(Array.fold_left (fun s r -> s^" "^(print r)) "" rs)^" ]"
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
  type rle_flg = Synt | Lex | Line
  type 'a t = ('a etr) list
  and 'a etr =
    | Cnc of string * etr_cnc list
    | Act of string * (('a etr_act) list)
  and etr_cnc =
    | Cnc_End of cn * rle_flg * rle* (rle option)
    | Cnc_Seq of cn * rle_flg * rle* (rle option) * etr_cnc list
  and cn =
    | CN of string
    | CN_A
  and 'a etr_act =
    | Act_End of 'a * rle_flg * rle * (rle option)
    | Act_Seq of 'a * rle_flg * rle * (rle option) * ('a etr_act) list
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
    (print_etr_lst rs)
  and print_etr_lst rs =
    (List.fold_left
       (fun s g -> s^(print_etr_cnc g) )
       "" rs )
  and print_etr_cnc =
    ( function
      | Cnc_End(rn,f,r,rc) ->
        let p_rc =
          ( match rc with
            | Some rc -> "!| "^(print_rle rc)
            | None -> "" ) in
        ( match rn with
          | CN rn ->
            "\t"^(print_rle_flg f)^rn^" : "^(print_rle r)^p_rc^"\n"
          | CN_A ->
            "\t"^(print_rle r)^p_rc^"\n" )
      | Cnc_Seq(rn,f,r,rc,g) ->
        let p_rc =
          ( match rc with
            | Some rc -> "!| "^(print_rle rc)
            | None -> "" ) in
        ( match rn with
          | CN rn ->
            "\t"^(print_rle_flg f)^rn^" : "^(print_rle r)^p_rc^" ;\n"^(print_etr_lst g)
          | CN_A ->
            "\t"^(print_rle_flg f)^(print_rle r)^p_rc^" ;\n"^(print_etr_lst g) )
    )
  and print_etr_act_lst rs =
    (List.fold_left
       (fun s g ->
          ( match g with
            | Act_End(_,f,r,rc) ->
              let p_rc =
                ( match rc with
                  | Some rc -> "!| "^(print_rle rc)
                  | None -> "" ) in
              s^"\t"^(print_rle_flg f)^" "^(print_rle r)^p_rc^" ⊢ ..\n"^
              "..\n\t∎\n"
            | Act_Seq(_,f,r,rc,g) ->
              let p_rc =
                ( match rc with
                  | Some rc -> "!| "^(print_rle rc)
                  | None -> "" ) in
              s^"\t"^(print_rle_flg f)^" "^(print_rle r)^p_rc^" ⊢ ..\n"^
              "..\n\t∎\n"^(print_etr_act_lst g)) )
       "" rs )
  and print_etr_act (n,rs) =
    "\t@."^n^" : _ \n"^(print_etr_act_lst rs)

  and print_rle_flg = ( function
      | Synt -> "\t∐* "
      | Lex -> "\t∐ "
      | Line -> "\t∐#" )
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
    | Gram of grm
    | Grm_Abs of string
    | Mdl of string * glb_etr list
    | Mdl_Eq of string * abs_name
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
  and mtc_ptn = (r_n_v * eq ref) list * ((v_p list * v_p list) option)
  and eq =
    | Eq_Agl of Sgn.t * int * int * ptn
    | Eq_Agl_N of axm0 * ptn
    | P_Cst of cst
    | Eq_V of r_n_v
  and mtc_v_k = (r_a * mtc_v_k_atm) RP.t
  and mtc_v_k_atm =
    | Mtc_R of mtc_v_k
    | Mtc_R_Top
    | Mtc_R_Cst of cst
    | Mtc_R_Agl of int * int * mtc_v_k
  and env = (Sgn.t, mtc_v_set_ptn) Hashtbl.t
  and env_set = env list
  and mtc_v_set = mtc_v_set_ptn list
  and mtc_v_set_ptn = (mtc_v_set_atm) RP.t
  and env_v = mtc_v_set_ptn array
  and env_t = Sgn.t array
  and mtc_v_set_atm =
    | Mtc_Agl of int * int * (mtc_v_set_ptn)
    | Mtc_Cst
    | Mtc_Top
    | Mtc_Ln of Sgn.t
  and cst =
    | P_N of axm0
    | P_R64 of int64
    | P_Stg of string
  and p_sig = string
  and ir_code =
    | Seq of nd * ir_code
    | Ret of ptn
    | Exn of r_n_v
    | Mtc of ((mtc_ptn * ir_code) array)
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
    | S8_Name of axm0 | S8_Var of int | S8_Var_D of int 
    | S8_For_Txt of int * string
  and grm = (Sgn.t * Sgn.t * Sgn.t * r_n_v * etr) Grm.t
  type line =
    | End | Line of exp_rcd
  type ns = (string * Types.v ref) list ref
  type ns_t = (string * Types.v ref) list ref
  type inst = {
    mutable al:(v ref * v ref) list;
    al_rcd:(v_rcd ref * v_rcd ref) list;
  }
  type e_k = Sgn.t * e_k_v
  and e_k_v =
    | Etr_V of R.t * R.t * int 
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
  type ns_vct_t = 
    | Prs_Dst | Etr_Dst 
  type g_ns_v = {
    mutable ns_vct_n : int;
    mutable ns_vct : (R.t * Types.v ref * ns_vct_t) array;
    mutable ns : (Sgn.t * Types.v ref) list;
    mutable ns_e : (Sgn.t * e_k_v ref) list;
    mutable ns_c : (Sgn.t * string) list;
    mutable ns_r_t : (Sgn.t * Types.v ref) list;
    mutable ns_r_i : (Sgn.t * v_r) list;
  }
  type glb_ns_v =
    { mutable ns_e_vct : (e_k ref * Types.v ref) list;
    }
  let gbg_n = ref 0

  let init_ns () =
    { root=None; ns_p=[];  ns_t=[]; ns_m=[]; ns_m_t=[];  }
  let init_gns () =
    { ns_vct_n=0; ns_vct=Array.make 1024 (RP.R[||],newvar (),Etr_Dst); ns=[]; ns_e=[]; ns_c=[]; ns_r_t=[]; ns_r_i=[];
    }
  module Axm = struct
    let _rpc = sgn ()
    let _mk_arr = sgn ()
    let _exc_q = sgn ()
    let _set_q = sgn ()
    let _lod_q = sgn ()
    let _get_q = sgn ()
    let _write = sgn ()
    let _cd = sgn ()
    let _args = sgn ()
    let _in_l = sgn ()
    let _in_r = sgn ()
    let _ext = sgn ()
    let _mlc_s8 = sgn ()
    let _lds = sgn ()
    let _sts = sgn ()
    let _ecs = sgn ()
    let _rep_movsb = sgn ()
    let _s8_len = sgn () 
    let _in0 = sgn ()
    let _in_fn = sgn ()
    let _emt_s8_to = sgn () 
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
    let _or = sgn () 
    let _and = sgn () 
    let _shr = sgn () 
    let _shl = sgn () 
    let _mov = sgn ()
    let _mov_x = sgn ()
    let _sub = sgn ()
    let _dec = sgn ()
    let _inc = sgn ()
    let _imul = sgn ()
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
  let mk_idx r =
    ( match !r with
      | R_Ax p -> p
      | _ -> err "mk_idx 0" )
  let mk_r_p p =
    ( match p with
      | R_A p -> p
      | _ -> err "mk_r_p 0" )
  let mk_v_r () =
    let p = R_Ax(R_A (sgn ())) in
    let v = ref p in
    v
  let rec mk_idx_ptn r =
    ( match r with
      | RP.A { contents=R_Ax p } -> RP.A p
      | RP.R rs -> RP.R (Array.map mk_idx_ptn rs)
      | _ -> err "mk_idx_ptn 0" )
  let rec print_test e =
    ( match e with
      | Eq_Agl(p,i,i_n,r) -> "_c"^(Sgn.print p)^"(°"^(string_of_int i)^"<"^(string_of_int i_n)^")◂"^(pnt_ptn r)
      | Eq_Agl_N(n,r) -> (pnt_stt_name !n)^"◂"^(pnt_ptn r)
      | P_Cst c -> pnt_cst c
      | Eq_V ve -> pnt_r ve )
  and pnt_cst c =
    ( match c with
      | P_N n -> pnt_stt_name !n
      | P_Stg s -> "\""^s^"\""
      | P_R64 x -> "0xr"^(Int64.format "%x" x)
     )
  let print_mtc p =
    let (es,_) = p in
    let s1 =
      List.fold_left
        ( fun s1 (v,e) ->
            let sv = s1^","^(pnt_r v)^"=" in
            let st = print_test !e in
            sv^st )
        "" es in
    s1

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
          | Mtc_Agl(i0,_,r) -> "°"^(string_of_int i0)^"◂"^(print_mtc_set r)
          | Mtc_Ln p -> "%_"^(Sgn.print p)      )
      p
  let mtc_is_empty ms =
    ( match ms with
      | [] -> true
      | _ -> false )
  let init_env_set iv =
    let a = Hashtbl.create 10 in
    let _ =
      Hashtbl.iter (fun p _ -> Hashtbl.add a p (RP.A(Mtc_Top))) iv in
    [a]
  let pnt_env_set hv =
    List.fold_left
      (fun s h ->
         let s_h =
           Hashtbl.fold
             (fun p a s ->
                s^" %_"^(Sgn.print p)^"~"^(print_mtc_set a))
             h "" in
         s^"|{> "^s_h^" }" )
      "" hv
  let rec get_env_set_ptn h0 p0 =
    let v = Hashtbl.find h0 p0 in
    get_env_set_ptn_lp h0 v
  and get_env_set_ptn_lp h0 v =
    ( match v with
      | RP.A(Mtc_Ln p0) -> get_env_set_ptn h0 p0
      | RP.A _ -> v
      | RP.R rs -> RP.R(Array.map (get_env_set_ptn_lp h0) rs) )

  let rec evo_env_set es0 (p:r_p) e =
    ( match e with
      | Eq_Agl(_,i0,i_n,pa) ->
        let es0_f = List.map (fun h -> Hashtbl.copy h) es0 in
        let f0 h0 =
          let pi = get_env_set_ptn h0 p in
          Hashtbl.remove h0 p;
          Hashtbl.add h0 p
            (RP.A(Mtc_Agl(i0,i_n,(RP.map (fun x -> Mtc_Ln x) (RP.map (fun x -> mk_r_p x) (mk_idx_ptn pa))))));
          ( match evo_env_set_eq_agl_and h0 pi i0 i_n pa with
            | true -> [h0]
            | false -> [] ) in
        let f0_f h0 =
          let pi = get_env_set_ptn h0 p in
          let l0 = evo_env_set_eq_agl_sub pi i0 i_n pa in
          let l1 =
            List.map
              ( fun v ->
                  let hi = Hashtbl.copy h0 in
                  Hashtbl.remove hi p;
                  Hashtbl.add hi p v;
                  hi )
              l0 in
          l1 in
        let es1 =
          List.fold_left
            (fun es1 h0 -> (f0 h0)@es1)
            [] es0 in
        let es1_f =
          List.fold_left
            (fun es1_f h0 -> (f0_f h0)@es1_f)
            [] es0_f in
        (es1,es1_f)
      | P_Cst _ ->
        let es1_f = List.map (fun h -> Hashtbl.copy h) es0 in
        let es1 =
          List.map
            ( fun h0 ->
                if Hashtbl.mem h0 p then h0
                else
                  (Hashtbl.add h0 p (RP.A Mtc_Cst); h0) )
            es0 in
        (es1,es1_f)
      | _ -> err "evo_env_set 0" )
  and evo_env_set_eq_agl_sub p0 i0 i_n pa =
    mtc_sub_ptn_ptn p0 (RP.A(Mtc_Agl(i0,i_n,RP.map (fun _ -> Mtc_Top) pa)))
  and evo_env_set_eq_agl_and h0 p0 i0 i_n pa =
    ( match p0 with
      | RP.A Mtc_Top ->
        let _ = RP.map (fun p -> Hashtbl.add h0 (mk_r_p (mk_idx p)) (RP.A Mtc_Top)) pa in
        true
      | RP.A(Mtc_Agl(i0_a,i_n_a,pa_a)) ->
        if i0_a=i0&&i_n_a=i_n then
          evo_env_set_eq_and h0 pa_a pa
        else false
      | _ -> false )
  and evo_env_set_eq_and h0 pa_a pa =
    ( match pa_a,pa with
      | RP.A Mtc_Top,_ ->
        let _ = RP.map (fun p -> Hashtbl.add h0 (mk_r_p (mk_idx p)) (RP.A Mtc_Top)) pa in
        true
      | _,RP.A p0 ->
        Hashtbl.add h0 (mk_r_p(mk_idx p0)) pa_a;
        true
      | RP.R rs0,RP.R rs1 ->
        let (_,b) =
          Array.fold_left
            (fun (i,b) ri -> (i+1,b&&(evo_env_set_eq_and h0 ri rs1.(i)))) (0,false) rs0 in
        b
      | _ -> false )
  and mk_mtc_v_k_ptn p0 p1 =
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
    (*Util.Log.add ("enter mk_mtc_v_k_eq:"^(print_mtc_v_k p0)^","^(pnt_r_a v0)^","^(print_test e0)^"\n");*)
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
    (*Util.Log.add ("enter mk_mtc_v_k_eq_and:"^(print_mtc_v_k ra)^","^(pnt_ptn e0)^"\n"); *)
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
  and mtc_and ms0 ms1 =
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
  and mk_mtc_set p =
    ( match p with
      | RP.A(_,Mtc_R_Top) -> RP.A Mtc_Top
      | RP.A(_,Mtc_R_Cst _) -> RP.A Mtc_Cst
      | RP.A(_,Mtc_R r) -> mk_mtc_set r
      | RP.A(_,Mtc_R_Agl(i0,i_n,r)) -> RP.A(Mtc_Agl(i0,i_n,mk_mtc_set r))
      | RP.R rs -> RP.R(Array.map mk_mtc_set rs)
    )
  (*and mtc_sub_ms ms0 ms1 =
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
    ) *)
  and mtc_sub_ptn_ptn p0 p1 =
    let c0 = (print_mtc_set p0)^","^(print_mtc_set p1)^"\n" in
    ( match p0,p1 with
      | _,RP.A Mtc_Top
      | _,RP.A (Mtc_Ln _) -> []
      | RP.A(Mtc_Ln _),RP.A(Mtc_Agl(i0,i_n,pa))
      | RP.A Mtc_Top,RP.A(Mtc_Agl(i0,i_n,pa)) ->
        Util.Log.add @@ "sub 0:"^(string_of_int i0)^","^(string_of_int i_n)^"\n";
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
                    (fun a -> RP.R(Array.init n (fun j -> if i=j then a else rs0.(j))))
                    li in
                (i+1,l0@ai) )
            (0,[]) rs_b in
        l0
      | _ -> err ("mtc_sub_ptn_ptn 7:"^c0) )

  let rec mk_vct t es =
    let h = Hashtbl.create 10 in
    let _ =
      List.fold_right
        ( fun (p,e) _ ->
            let p = mk_r_p(mk_idx p) in
            ( match !e with
              | Eq_Agl(_,i0,i_n,pa) ->
                let p0 = mk_f0 h pa in
                Hashtbl.add h p (RP.A(Mtc_Agl(i0,i_n,p0)));
                ()
              | _ -> err "mk_vct 0" ))
        es () in
    let v =
      Array.map
        (fun p ->
           ( try
               let a = Hashtbl.find h p in a
             with _ -> RP.A(Mtc_Ln p) )) t in
    v
  and mk_f0 h pa =
    ( match pa with
      | RP.A v ->
        let q = mk_r_p(mk_idx v) in
        ( try
            let p = Hashtbl.find h q in
            let _ = Hashtbl.remove h q in
            p
          with _ ->
            RP.A(Mtc_Ln q) )
      | RP.R rs -> RP.R(Array.map (mk_f0 h) rs)
    )
  and sub_vct v0 v1 =
    let rs_b = Array.mapi (fun i r -> mtc_sub_ptn_ptn r v1.(i)) v0 in
    let n = Array.length rs_b in
    let (_,l0) =
      Array.fold_left
        ( fun (i,l0) li ->
            let ai =
              List.map
                (fun a -> Array.init n (fun j -> if i=j then a else v0.(j)))
                li in
            (i+1,l0@ai) )
        (0,[]) rs_b in
    l0
  and sub_lst_vct vl v1 =
    List.fold_left
      (fun vl1 v0 ->
         vl1@(sub_vct v0 v1))
      [] vl
  and pnt_vct v0 =
    let (_,s) =
      Array.fold_left
        (fun (i,s) p -> (i+1,s^"%"^(string_of_int i)^"~"^(print_mtc_set p)^","))
        (0,"") v0 in
    "[ "^s^" ]"
  and pnt_m_set vl =
    (List.fold_left (fun s v -> s^"|"^(pnt_vct v)) "{" vl)^"}"
  let rec find_ns f ns n g =
    ( match n with
      | EndN n0 ->
        ( match ( try g ns n0 with e -> Util.Log.add (pnt_name n);raise e),f with
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
  let get_ns_e gns n = (try List.assoc n gns.ns_e with _ -> err "get_ns_e 0" )
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
  let print_v v = "_r"^(Types.print_v v)
  let rec print_mdl (n,g) =
    let s0 = "§§ "^n^"\n" in
    let rec lp g =
      ( match g with
        | [] -> "§§.\n"
        | hd::tl ->
          let s1 =
            ( match hd with
              | Mdl_Ln (_,n) -> "§§ "^n^"._\n"
              | Mdl_Eq (n,m) -> "§§ "^n^" = "^(pnt_name m)
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
    | Mtc ps -> (print_ir_mtc ps)
    | IL_Glb_Call(n,r) -> "\t"^(pnt_stt_name !n)^"\t"^(pnt_ptn r)^" ⊢|\n"
    | Clj _ -> err "print_ir 0"
  )
and print_line p0 =
  ( match p0 with
    | Seq (o,_) -> (print_nd o)^"\n"
    | Ret r -> "∎ "^(pnt_ptn r)^"\n"
    | Exn r -> "∎| "^(pnt_r r)^"\n"
    | Mtc ps -> 
      Array.fold_left (fun s (m,_) -> s^" ∐ "^(pnt_mtc_ptn m)) "" ps 
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
    | S8_Txt s -> "\""^(String.escaped s)^"\""
    | S8_Name n -> pnt_stt_name !n
    | S8_Var i -> (string_of_int i)^"\'"
    | S8_Var_D i -> (string_of_int i)^"d'"
    | S8_For_Txt (i,s) -> (string_of_int i)^"\'*"^"\""^(String.escaped s)^"\"")
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
  (*Util.pnt true "enter unify:";*)
  let se = (Types.print t0)^" ~ "^(Types.print t1) in
  Util.Log.add ("enter unify:"^se^"\n");
  (*  Util.pnt true ("enter unify:"^se^"\n"); *)
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
  (*Util.Log.add "enter gen:\n";*)
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
let inst_ini () = {  al = []; al_rcd = []; }
let rec inst l (i:Ast.inst) (y:Types.t) =
  let _ = Types.print y in 
  (*Util.Log.add @@ "enter inst:"^c^"\n";*)
  ( match y with
    (*| App(Var ({contents = Ln(Abs(v,y0))} as v0),y1) ->
      ( try (Var (List.assq v0 i.al),i)
        with Not_found ->
          let v1 = newvar_l l in
          let i = { i with al = (v0,v1)::i.al } in
          let (y2,i) = inst l i y0 in
          let (y3,i) = inst l i y1 in
          let vt = ( try List.assq v i.al with _ -> err "inst a0") in
          vt := Ln y3;
          v1 := Ln y2;
          (Var v1,i))*)
    | App(Var {contents = Ln y0 },y1) -> inst l i (App(y0,y1))
    | App(Abs(v,y0),y1) ->
      let vq = newvar_q (-1) in 
      i.al<-(v,vq)::i.al;
      let (y2,i) = inst l i y0 in
      let (y3,i) = inst l i y1 in
      (*let v0 = (try List.assq v i.al with _ -> err "inst a1") in
        v0 := Ln y3;
        (y2,i)*)
      vq := (Ln y3);
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
        | WC _ -> v := Types.V (sgn(),l); (y,i)
        | _ -> (y,i))
    | App(Axm a,y2) -> 
      let (y2,i) = inst l i y2 in
      (App(Axm a,y2),i)
    | App (y1,y2) ->
      let (y1,i) = inst l i y1 in
      let (y2,i) = inst l i y2 in
      ( match y1 with 
        | Abs(_,_) -> inst l i (App(y1,y2)) 
        | _ -> (App(y1,y2),i) )
    | Imp (y1,y2) ->
      let (y1,i) = inst l i y1 in
      let (y2,i) = inst l i y2 in
      (Imp(y1,y2),i)
    | Rcd r -> let (r,i) = (inst_rcd l i r) in (Rcd r,i)
    | Axm a -> (Types.Axm a,i)
    | Abs(v,y) -> (Abs(v,y),i) )
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
let rec inst_mtc_ptn gns ns l (es,_) =
  let _ =
    List.fold_left
      (fun _ (r,e) ->
         let y_v = inst_v_r gns (l+1) r in
         let ye = inst_mtc_atm gns ns (l+1) e in
         let _ = unify [] y_v ye in
         let _ = gen (ref []) l y_v in
         () )
      () es in
  ()
and inst_mtc_atm gns (ns:ns_v) l e =
  let open Types in
  ( match !e with
    | Eq_Agl(_,_,_,_) -> err "inst_mtc_atm 0"
    | Eq_Agl_N(n,r) ->
      let p = slv_ns0 ns n in
      let f = (try List.assoc p gns.ns_e with _ -> err "inst_mtc_atm 3") in
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
        | P_R64 _ -> Axm Axm.r64
        | P_N n -> 
          let p = slv_ns0 ns n in
          let yn = inst l (Var (get_ns gns p)) in
          yn 
        | P_Stg _ -> Axm Axm.stg )
    | Eq_V ve ->
      let y_ve = inst_v_r gns l ve in
      y_ve
  )
and slv (gns:g_ns_v) (ns:ns_v) l p0 =
  Util.Log.add ("enter slv:"^(print_line p0)^"\n");
  ( match p0 with
    | Ret r ->
      let y = inst_ptn gns (l+1) r in
      let _ = gen (ref []) l y in
      y
    | Exn _ ->
      (*let y = inst_v_r gns (l+1) r in
        let _ = unify []  (Axm Axm.exn_p) y in
        let _ = gen (ref []) l y in*)
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
      Util.Log.add ("test 4:"^"\n");
      yy
    | Mtc pns ->
      Util.Log.add "slv Mtc 3\n";
      let _ =
        Array.fold_left
          ( fun _ (e,_) ->
              let _ = inst_mtc_ptn gns ns l e in
              () )
          () pns in
      Util.Log.add "slv Mtc 4\n";
      let (_,ys) =
        Array.fold_left
          ( fun (j,ys) (_,p) ->
              let y1 = slv gns ns l p in
              (j+1,ys |+| [|y1|]) )
          (0,[||]) pns in
      Util.Log.add "slv Mtc 5\n";
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
            let sl = Array.length rs0 in
            if (sl+1)=(Array.length rs1) then
              let ts0 = Array.map (fun r -> inst_v_r gns (l+1) r) rs0 in
              let ts1 = Array.map (fun r -> inst_v_r gns (l+1) r) rs1 in
              let _ =
                List.fold_left
                  ( fun _ p ->
                      match p with
                      | (S8_Var i) ->
                        let _ = unify [] (try ts0.(i) with _ -> err "IR_S8 bd 0") (Axm Axm.stg) in
                        ()
                      | S8_For_Txt(i,_) ->
                        let _ = unify [] (try ts0.(i) with _ -> err "IR_S8 bd 1") (Axm Axm.r64) in
                        ()
                      | S8_Var_D i -> 
                        let _ = unify [] (try ts0.(i) with _ -> err "IR_S8 bd 0") (Axm Axm.r64) in
                        ()
                      | _ -> () )
                  () pl in
              let _ = Array.mapi (fun i t -> unify [] t ts1.(i)) ts0 in
              let _ = unify [] ts1.(sl) (Axm Axm.stg) in
              let _ = Array.map (fun t -> gen (ref []) l t) ts1 in
              ()
            else err "IR_S8 bd 2"
          | IR_Id id ->
            ( match !id with
              | IR_Id_C(r,rs) ->
                let ts = Array.map (fun r -> inst_ptn gns (l+1) r) rs in
                let t = inst_ptn gns (l+1) r in
                let _ = List.fold_left (fun y1 y2 -> unify [] y1 y2; y2) t (Array.to_list ts) in
                Util.Log.add "test 0";
                let _ = Array.map (fun t -> gen (ref []) l t) ts in
                ()
              | IR_Id_Ax _ -> err "slv id 0" )
          | IR_Glb_Call(n,x,y) ->
            (*Util.pnt true "E0\n";*)
            let pf = slv_ns0 ns n in
            let tf = inst (l+1) (Var( try get_ns gns pf with _ -> err "slv_exp_atm 6")) in
            let tx = inst_ptn gns (l+1) x in
            let ty = inst_ptn gns (l+1) y in
            unify [] tf (Imp(tx,ty));
            (*Util.pnt true "E5\n";*)
            gen (ref []) l ty
          | IR_Out (_,_) -> err "slv x1"
          | IR_Glb_Out (o,x) ->
            let pf = slv_ns0 ns o in
            let tx = inst_ptn gns (l+1) x in
            let yo = get_ns gns pf in
            let _ = unify [] (inst (l+1) (Var yo)) (App(Axm Axm.out_p,tx)) in
            gen (ref []) l tx
          | IR_Exp(a,_,r1) ->
            let tk = inst_ptn gns (l+1) r1 in
            let _ = unify [] tk (inst (l+1) (slv_exp_atm gns ns a)) in
            gen (ref []) l tk
          | _ -> err "slv Seq 0"
        ) in
      slv gns ns l p1
  )
and slv_exp_atm gns (ns:ns_v) a =
  let open Types in
  ( match a with
    | Name n ->
      let pf = slv_ns0 ns n in
      Util.Log.add "X\n";
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
  Util.Log.add c_l;
  ( match p0 with
    | Ret r ->
      let r = csm_ptn_rv r rv in
      Ret r
    | Exn r ->
      (*let r = csm_rv r rv in*)
      Exn r
    | IL_Glb_Call(n,r) ->
      let r = csm_ptn_rv r rv in
      IL_Glb_Call(n,r)
    | Mtc ps ->
      let ps =
        Array.fold_left
          ( fun ps (e,p) ->
              let rv = Hashtbl.copy rv in
              let e = crt_mtc_ptn_rv e rv in
              let pi = slv_r rv p in
              ps |+| [|(e,pi)|] )
          [||] ps in
      Mtc ps
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
          let _ = Array.map ( fun r -> crt_ptn_rv r rv) rs in
          (*let l = ir_of_id r rs in*)
          let p1 = slv_r rv p1 in
          Seq(IR_Id { contents=IR_Id_C(r,rs) },p1)
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
     (fun n v e -> e^","^n^"=%"^(Sgn.print v))
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
      if Hashtbl.mem rv n then err @@ "crt_rv 0:"^(pnt_rv rv)^",%"^n^"is exist"
      else
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
and crt_mtc_ptn_rv (es,_) rv  =
  Util.Log.add @@ "enter crt_mtc_ptn_rv:"^(pnt_rv rv);
  let (dl,es) =
    List.fold_left
      (fun (dl,es) (v0,e) ->
         ( match !e with
           | Eq_Agl(_,_,_,_) -> err "crt_mtc_ptn_rv 0"
           | Eq_Agl_N(_,r) ->
             let v1 = csm_rv v0 rv in
             let (dl1,_) = crt_ptn_rv r rv in
             (dl1@dl,es@[(v1,e)])
           | P_Cst _ ->
             let rv_t = Hashtbl.copy rv in
             let v1 = csm_rv v0 rv_t in
             (dl,es@[(v1,e)])
           | Eq_V ve ->
             let rv_t = Hashtbl.copy rv in
             let v1 = csm_rv v0 rv_t in
             let _ = csm_rv ve rv_t in
             (dl,es@[(v1,e)])
         ))
      ([],[]) es in
  let d =
    Hashtbl.fold
      ( fun _ r d ->
          (r::d))
      rv [] in
  (es,Some (dl,d))
and slv_r_etr (r0,p0) =
  let rv = Hashtbl.create 10 in
  let _ = crt_ptn_rv r0 rv in
  let p = slv_r rv !p0 in
  (r0,ref p)
and slv_r_grm_etr n r c s (r0,p0) =
  let rv = Hashtbl.create 10 in
  let _ = Hashtbl.add rv "_n" n in
  let _ = Hashtbl.add rv "_r" r in
  let _ = Hashtbl.add rv "_c" c in
  ( match s with 
    | Some s -> 
      let _ = crt_rv (ref []) s rv in 
      let _ = crt_ptn_rv r0 rv in
      let p = slv_r rv !p0 in
      (r0,ref p)
    | None -> 
      let _ = crt_ptn_rv r0 rv in
      let p = slv_r rv !p0 in
      (r0,ref p) )
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
    | R.AglUnn(ra,rs) -> s.(ra)<-true; Array.fold_left (fun _ r -> let _ = rset_ptn s r in ()) () rs
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
    | _ -> err @@ "alc_idx 0:"^(Types.print (Var v)) )
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
      let i0 = (try Hashtbl.find iv p with _ -> err @@ "csm_iv 2:%"^(Sgn.print p) ) in
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
let emt_flg = true
let cmt s = if emt_flg then "; "^s^"\n" else ""
let x86_reg_lst = [
  "r13"; "r14"; "r8"; "r9"; "r10"; "r11"; "rcx"; "rdx"; ]
let emt_reg_x86 n =
  if n<8 then (try List.nth x86_reg_lst n with _ -> err "emt_rg_x86 0" )
  else "QWORD [st_vct+8*"^(string_of_int n)^"]"
let push_all =
  "\tpush r14\n"^
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
        if i<8
        then
          e^
          "\tmov QWORD [regs_vct+8*"^(string_of_int i)^"],"^(emt_reg_x86 i)^"\n"
        else
          e )
    s ""
let alc_blk_r i = 
  "\tmov rax,QWORD [SFLS_TBL+8*"^(string_of_int i)^"]\n"^
  "\tmov rdi,QWORD [rax]\n"^
  "\tmov QWORD [SFLS_TBL+8*"^(string_of_int i)^"],rdi\n" 
let free_blk_r = 
  "\tmovzx rax,BYTE [rdi+3]\n"^
  "\tmov rsi,QWORD [SFLS_TBL+8*rax]\n"^
  "\tmov QWORD [rdi],rsi\n"^
  "\tmov QWORD [SFLS_TBL+8*rax],rdi\n"
let alc_blk0 =
  "\tmov rax,rbx\n"^
  "\tmov rbx,[rax]\n"
let alc_blk0_rdi =
  "\tmov rdi,rbx\n"^
  "\tmov rbx,[rdi]\n"
let alc_blk0_rsi =
  "\tmov rsi,rbx\n"^
  "\tmov rbx,[rsi]\n"
let free_blk0 =
  "\tmov [rdi],rbx\n"^
  "\tmov rbx,rdi\n"
let free_blk0_rax =
  "\tmov [rax],rbx\n"^
  "\tmov rbx,rax\n"
let alc_blk n =
  "\tmov rax,[SFLS_HD+8*"^(string_of_int n)^"]\n"^
  "\tmov rdi,[rax]\n"^
  "\tmov [SFLS_HD+8*"^(string_of_int n)^"],rdi\n"
let free_blk n =
  "\tmov rax,[SFLS_HD+8*"^(string_of_int n)^"]\n"^
  "\tmov [rdi],rax\n"^
  "\tmov [SFLS_HD+8*"^(string_of_int n)^"],rdi\n"
let free_blk_n =
  "\tmovzx rsi,BYTE [rdi+4]\n"^
  "\tmov rax,[SFLS_HD+8*rsi]\n"^
  "\tmov [rdi],rax\n"^
  "\tmov [SFLS_HD+8*rsi],rdi\n"
type blk_t = blk_col * (int option)
and blk_col =
  | Blk_Opq of int
  | Blk_Ln of bool
  | Blk_Rcd of bool array
  | Blk_Arr of int
let fmt_b b =
  if b then "1" else "0"
let fmt_bl bl =
  let (_,f) =
    Array.fold_left
      (fun (i,f) b ->
         (i+1,(fmt_b b)^f ))
      (0,"") bl in
  f
let mk_hdr (t,a) =
  ( match a with
    | Some j ->
      ( match t with
        | Blk_Opq l ->
          "0x"^(Printf.sprintf "%08x" l)^"_"^(Printf.sprintf "%02x" j)^"_"^(Printf.sprintf "%02x" (int_of_string "0b10000001"))^"_0000"
        | Blk_Ln b ->
          "0x"^(Printf.sprintf "%08x" 1)^"_"^(Printf.sprintf "%02x" j)^"_"^(Printf.sprintf "%02x" (int_of_string "0b10000010"))^"_000"^(fmt_b b)
        | Blk_Rcd bl ->
          let l = Array.length bl in
          "0x"^(Printf.sprintf "%08x" l)^"_"^(Printf.sprintf "%02x" j)^"_"^(Printf.sprintf "%02x" (int_of_string "0b10000000"))^"_"^
          (Printf.sprintf "%04x" (int_of_string ("0b"^(fmt_bl bl))))
        | Blk_Arr l ->
          "0x"^(Printf.sprintf "%08x" l)^"_"^(Printf.sprintf "%02x" j)^"_"^(Printf.sprintf "%02x" (int_of_string "0b10000100"))^"_0000" )
    | None ->
      ( match t with
        | Blk_Opq l ->
          "0x"^(Printf.sprintf "%08x" l)^"_00_"^(Printf.sprintf "%02x" (int_of_string "0b00000001"))^"_0000"
        | Blk_Ln b ->
          "0x"^(Printf.sprintf "%08x" 1)^"_00_"^(Printf.sprintf "%02x" (int_of_string "0b00000010"))^"_fff"^(fmt_b b)
        | Blk_Rcd bl ->
          let l = Array.length bl in
          "0x"^(Printf.sprintf "%08x" l)^"_00_"^(Printf.sprintf "%02x" (int_of_string "0b00000000"))^"_"^
          (Printf.sprintf "%04x" (int_of_string ("0b"^(fmt_bl bl))))
        | Blk_Arr l ->
          "0x"^(Printf.sprintf "%08x" l)^"_00_"^(Printf.sprintf "%02x" (int_of_string "0b00000100"))^"_0000" )
  )
let cf_set i =
  let l0 = lb () in
  let l1 = lb () in
  "\tjc "^l0^"\n"^
  "\tbtr r12,"^(string_of_int i)^"\n"^
  "\tclc\n"^
  "\tjmp "^l1^"\n"^
  l0^":\n"^
  "\tbts r12,"^(string_of_int i)^"\n"^
  "\tstc\n"^
  l1^":\n"

let emt_n0b n =
  let r0 = 1 in
  let r1 = r0 lsl n in
  let r2 = int_of_string "0xffff" in
  r1 lxor r2
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

let emt_etr_id i0 i1 p = 
  let sp = Sgn.print p in 
  "NS_E_DST_ID_"^sp^": dq "^(string_of_int i1)^"\n"^
  "NS_E_SRC_ID_"^sp^": dq "^(string_of_int i0)^"\n"^
  "NS_E_"^sp^":\n"^
  "NS_E_RDI_"^sp^":\n"^
  "NS_E_"^sp^"_ETR_TBL:\n"

let rec emt_prs gns ns ep rs =
  (emt_etr_id 0 1 ep)^
  (emt_rle gns ns rs)
and prs_dec_i i =
  let lb0 = lb () in
  if i<0 then ""
  else
    "\tmov rsi,QWORD [rsp+16*"^(string_of_int i)^"]\n"^
    "\tbt rsi,0\n"^
    "\tjc "^lb0^"\n"^
    "\tmov rdi,QWORD [rsp+16*"^(string_of_int i)^"+8*1]\n"^
    "\tcall dlt\n"^
    lb0^":\n"^
    (prs_dec_i (i-1))
and prs_dec_i_cut sp =
  ( match sp with
    | [] -> ""
    | (rni,_)::tl ->
      (prs_dec_i (rni-1))^
      "\tadd rsp,"^(string_of_int (rni*16))^"\n"^
      "\tpop "^(emt_reg_x86 1)^"\n"^
      (prs_dec_i_cut tl)
  ) 
and get_size n = 
  if n=0 then 0 
  else if n=1 then 1  
  else if n<=3 then 2 
  else if n<=7 then 3 
  else if n<=15 then 4 
  else err "get_size 0" 
and prs_set_i sp rn j =
  let e0 =
    (alc_blk_r (get_size rn))^
    "\tmov rdi,rax\n"^
    "\tmov rax,0x0000_"^(Printf.sprintf "%04x" rn)^"_"^(Printf.sprintf "%02x" (get_size rn))^"00_ffff\n"^
    "\tmov QWORD [rdi],rax\n" in
  let rec lp0 i =
    let lb0 = lb () in
    if i<0 then ""
    else
      "\tmov rax,QWORD [rsp+16*"^(string_of_int i)^"]\n"^
      "\tbt rax,0\n"^
      "\tjc "^lb0^"\n"^
      "\tbtr QWORD [rdi],"^(string_of_int i)^"\n"^
      lb0^":\n"^
      "\tmov rax,QWORD [rsp+16*"^(string_of_int i)^"+8*1]\n"^
      "\tmov [rdi+8*1+8*"^(string_of_int i)^"],rax\n"^
      (lp0 (i-1)) in
  let e1 =
    e0^
    (lp0 (rn-1))^
    "\tmov rax,0x"^(Printf.sprintf "%02x" j)^"00_0000_0000_0001\n"^
    "\tor rdi,rax\n"^
    "\tadd rsp,"^(string_of_int ((rn*16)+8))^"\n" in
  let rec lp1 sp =
    ( match sp with
      | [] -> ""
      | (rni,ii)::tl ->
        let bs = get_size rni in 
        "\tpush rdi\n"^
        (alc_blk_r bs)^
        "\tmov rdi,rax\n"^
        "\tpop QWORD [rdi+8+8*"^(string_of_int rni)^"]\n"^
        "\tmov rax,0x0000_"^(Printf.sprintf "%04x" (rni+1))^"_"^(Printf.sprintf "%02x" bs)^"00_"^(Printf.sprintf "%04x" (emt_n0b rni))^"\n"^
        "\tmov QWORD [rdi],rax\n"^
        (*"\tadd rsp,8\n"^*)
        (lp0 (rni-1))^
        "\tmov rax,0x"^(Printf.sprintf "%02x" ii)^"00_0000_0000_0001\n"^
        "\tor rdi,rax\n"^
        "\tadd rsp,"^(string_of_int ((rni*16)+8))^"\n"^
        (lp1 tl)
    ) in
  e1^
  (lp1 sp)
and emt_rle gns ns l =
  ( match l with
    | `P l ->
      let rec lp sp i l =
        ( match l with
          | e::tl ->
            ( match e with
              | Grm.Cnc_Seq(cn,f,r,rc,q) ->
                let rn = List.length r in
                (*"_"^mn^"_"^n^":\n"^ *)
                let cn =
                  ( match cn with
                    | Grm.CN_A -> "_" | Grm.CN cn -> cn ) in
                (*let lb1 = lb () in*)
                let lbn = lb () in
                ( match rc with
                  | None ->
                    let eq = lp sp 0 q in
                    "; "^cn^"\n"^
                    "\tmov r10d,DWORD [r13+4]\n"^
                    "\tpush "^(emt_reg_x86 1)^"\n"^
                    "\tsub rsp,"^(string_of_int (rn*16))^"\n"^
                    (emt_ptn_grm lbn i ns f r 0)^
                    eq^
                    (prs_dec_i (rn-1))^
                    lbn^":\n"^
                    "\tadd rsp,"^(string_of_int (rn*16))^"\n"^
                    "\tpop "^(emt_reg_x86 1)^"\n"^
                    (lp sp (i+1) tl)
                  | Some rc ->
                    let lbnc = lb () in
                    let rnc = List.length rc in
                    let eq = lp sp 0 q in
                    "; "^cn^"\n"^
                    "\tmov r10d,DWORD [r13+4]\n"^
                    "\tpush "^(emt_reg_x86 1)^"\n"^
                    "\tsub rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                    (emt_ptn_grm lbn i ns f r 0)^
                    (emt_ptn_grm lbnc i ns f rc rn)^
                    eq^
                    (prs_dec_i (rn+rnc-1))^
                    lbnc^":\n"^
                    "\tadd rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                    "\tpop "^(emt_reg_x86 1)^"\n"^
                    (prs_dec_i_cut sp)^
                    (alc_blk_r 0)^
                    "\tmov rdi,rax\n"^
                    "\tmov rax,0x0000_0000_0000_ffff\n"^
                    "\tmov QWORD [rdi],rax\n"^
                    "\tmov "^(emt_reg_x86 3)^",rdi\n"^
                    "\tmov "^(emt_reg_x86 2)^",1\n"^
                    "\tbtr r12,3\n"^
                    "\tbts r12,2\n"^
                    "\tret\n"^
                    lbn^":\n"^
                    "\tadd rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                    "\tpop "^(emt_reg_x86 1)^"\n"^
                    (lp sp (i+1) tl)
                )
              | Grm.Cnc_End(cn,f,r,rc) ->
                let rn = List.length r in
                (*"_"^mn^"_"^n^":\n"^ *)
                let lbn = lb () in
                let cn =
                  ( match cn with
                    | Grm.CN_A -> "_" | Grm.CN cn -> cn ) in
                ( match rc with
                  | None ->
                    "; "^cn^"\n"^
                    "\tmov r10d,DWORD [r13+4]\n"^
                    "\tpush "^(emt_reg_x86 1)^"\n"^
                    "\tsub rsp,"^(string_of_int (rn*16))^"\n"^
                    (emt_ptn_grm lbn i ns f r 0)^
                    (prs_set_i sp rn i)^
                    "\tmov "^(emt_reg_x86 2)^",0\n"^
                    "\tmov "^(emt_reg_x86 3)^",rdi\n"^
                    "\tbtr r12,3\n"^
                    "\tbts r12,2\n"^
                    "\tret\n"^
                    lbn^":\n"^
                    "\tadd rsp,"^(string_of_int (rn*16))^"\n"^
                    "\tpop "^(emt_reg_x86 1)^"\n"^
                    (lp sp (i+1) tl)
                  | Some rc ->
                    let rnc = List.length rc in
                    let lbnc = lb () in
                    "; "^cn^"\n"^
                    "\tmov r10d,DWORD [r13+4]\n"^
                    "\tpush "^(emt_reg_x86 1)^"\n"^
                    "\tsub rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                    (emt_ptn_grm lbn i ns f r 0)^
                    (emt_ptn_grm lbnc i ns f rc rn)^
                    (prs_set_i sp (rn+rnc) i)^
                    "\tmov "^(emt_reg_x86 2)^",0\n"^
                    "\tmov "^(emt_reg_x86 3)^",rdi\n"^
                    "\tbtr r12,3\n"^
                    "\tbts r12,2\n"^
                    "\tret\n"^
                    lbnc^":\n"^
                    "\tadd rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                    "\tpop "^(emt_reg_x86 1)^"\n"^
                    (prs_dec_i_cut sp)^
                    (alc_blk_r 0)^
                    "\tmov rdi,rax\n"^
                    "\tmov rax,0x0000_0000_"^(Printf.sprintf "%02x" 0)^"_00_ffff\n"^
                    "\tmov QWORD [rdi],rax\n"^
                    "\tmov "^(emt_reg_x86 3)^",rdi\n"^
                    "\tmov "^(emt_reg_x86 2)^",1\n"^
                    "\tbtr r12,3\n"^
                    "\tbts r12,2\n"^
                    "\tret\n"^
                    lbn^":\n"^
                    "\tadd rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                    "\tpop "^(emt_reg_x86 1)^"\n"^
                    (lp sp (i+1) tl)
                )
            )
          | [] ->
            if sp=[] then
              (alc_blk_r 0)^
              "\tmov rdi,rax\n"^
              "\tmov rax,0x0000_0000_"^(Printf.sprintf "%02x" 0)^"00_ffff\n"^
              "\tmov QWORD [rdi],rax\n"^
              "\tmov "^(emt_reg_x86 3)^",rdi\n"^
              "\tmov "^(emt_reg_x86 2)^",1\n"^
              "\tbtr r12,3\n"^
              "\tbts r12,2\n"^
              "\tret\n"
            else "" ) in
      lp [] 0 l
    | `V (t_v,l) ->
      let rec lp lb_p ps i l =
        ( match l with
          | e::tl ->
            ( match e with
              | Grm.Act_Seq ((p_n,p_r,_,p_s,(re,pi)),f,r,rc,al) -> 
                let lb_x = lb () in 
                let lb_x1 = lb () in 
                let e_al = lp (Some lb_x) ps 0 al in 
                ( match rc with
                  | None ->
                    (*Util.pnt true "V None 0\n";*)
                    let rn = List.length r in
                    let iv0 = Hashtbl.create 10 in
                    let i_e_s = RP.R[|RP.R(Array.init rn (fun i -> RP.A(R.Idx i)));RP.A(R.Idx rn)|] in
                    let i0 = crt_ptn_iv gns (mk_idx_ptn (RP.R[|re;RP.A p_s|])) iv0 in
                    let s0 = rset_iv iv0 in 
                    let i_n = RSet.min_0 s0 in 
                    s0.(i_n)<-true;
                    let i_r = RSet.min_0 s0 in 
                    s0.(i_r)<-true;
                    let _ = Hashtbl.add iv0 p_n (RP.A(R.Idx i_n)) in
                    let _ = Hashtbl.add iv0 p_r (RP.A(R.Idx i_r)) in
                    let i1 = RP.A(R.Agl(2,2,RP.A(R.Idx 3))) in
                    let pvi = gns.ns_vct_n in 
                    gns.ns_vct.(pvi)<-(i1,ref(Ln(App(Axm Axm.opn,Var t_v))),Prs_Dst);
                    gns.ns_vct_n<-pvi+1;
                    let e_pi = emt_ir i1 gns ns iv0 !pi in
                    (*Util.pnt true "V None 00\n";*)
                    let lb1 = lb () in
                    let lb1_0 = lb () in
                    let lb1_1 = lb () in
                    let s_e_s = RSet.ini () in
                    let rec e_s i =
                      if i<0 then ""
                      else
                        ( s_e_s.(i)<-true;
                          "\tmov rax,QWORD [rsp+16*"^(string_of_int i)^"]\n"^
                          "\tbt rax,0\n"^
                          (cf_set i)^
                          "\tmov rax,QWORD [rsp+16*"^(string_of_int i)^"+8*1]\n"^
                          "\tmov "^(emt_reg_x86 i)^",rax\n"^
                          (e_s (i-1)) ) in
                    s_e_s.(rn)<-true;
                    let lbn = lb () in
                    let e0 =
                      "\tmov r10d,DWORD [r13+4]\n"^ 
                      "\tpush "^(emt_reg_x86 1)^"\n"^
                      "\tsub rsp,"^(string_of_int (rn*16))^"\n"^
                      (emt_ptn_grm lbn i ns f r 0)^
                      "\tpush r10\n"^
                      e_al^
                      lb_x^":\n"^
                      "\tpop r10\n"^
                      "\tcmp "^(emt_reg_x86 2)^",0\n"^
                      "\tjz "^lb_x1^"\n"^
                      "\tmov rdi,"^(emt_reg_x86 3)^"\n"^
                      free_blk_r^
                      (prs_dec_i (rn-1))^
                      "\tjmp "^lbn^"\n"^
                      lb_x1^":\n"^
                      "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
                      "\tmov rsi,"^(emt_reg_x86 1)^"\n"^
                      "\tmov "^(emt_reg_x86 rn)^","^(emt_reg_x86 3)^"\n"^
                      "\tbt r12,3\n"^
                      (cf_set rn)^
                      (e_s (rn-1))^
                      "\tadd rsp,"^(string_of_int (rn*16))^"\n"^
                      "\tpush rdi\n"^
                      "\tpush rsi\n"^
                      "\tpush "^(string_of_int pvi)^"\n"^
                      "\tpush "^lb1^"\n"^
                      "\tpush "^lb1^"\n" in
                    let e1 =
                      e0^
                      (emt_mov_ptn_to_ptn R.M_Dlt s_e_s i_e_s i0)^
                      "\tmov rax,QWORD [rsp+8*3]\n"^
                      "\tmov "^(emt_reg_x86 i_r)^",rax\n"^
                      "\tmov rax,QWORD [rsp+8*5]\n"^
                      "\tmov "^(emt_reg_x86 i_n)^",rax\n"^
                      "\tbts r12,"^(string_of_int i_n)^"\n"^
                      "\tbts r12,"^(string_of_int i_r)^"\n"^
                      e_pi^
                      lb1^":\n"^
                      "\tadd rsp,16\n"^
                      "\tpop "^(emt_reg_x86 1)^"\n"^
                      "\tpop "^(emt_reg_x86 0)^"\n"^
                      "\tbts r12,1\n"^
                      "\tbtr r12,0\n"^
                      "\tcmp "^(emt_reg_x86 2)^",0\n"^
                      "\tjz "^lb1_1^"\n"^
                      "\tpop "^(emt_reg_x86 1)^"\n"^
                      "\tmov rdi,"^(emt_reg_x86 3)^"\n"^
                      free_blk_r^
                      "\tjmp "^lb1_0^"\n"^
                      lb1_1^":\n"^
                      "\tadd rsp,8\n"^
                      ( match lb_p with
                        | Some lb_p -> "\tjmp "^lb_p^"\n"
                        | None -> "\tret\n" )^
                      lbn^":\n"^
                      "\tadd rsp,"^(string_of_int (rn*16))^"\n"^
                      "\tpop r14\n"^
                      lb1_0^":\n" in
                    e1^
                    (lp lb_p ps (i+1) tl)
                  | Some rc ->
                    (*Util.pnt true "V None 1\n";*)
                    let rn = List.length r in
                    let rnc = List.length rc in
                    let iv0 = Hashtbl.create 10 in
                    let i_e_s = RP.R[|RP.R(Array.init (rn+rnc) (fun i -> RP.A(R.Idx i)));RP.A(R.Idx (rn+rnc))|] in
                    let i0 = crt_ptn_iv gns (mk_idx_ptn (RP.R[|re;RP.A p_s|])) iv0 in
                    let s0 = rset_iv iv0 in 
                    let i_n = RSet.min_0 s0 in 
                    s0.(i_n)<-true;
                    let i_r = RSet.min_0 s0 in 
                    let _ = Hashtbl.add iv0 p_n (RP.A(R.Idx i_n)) in
                    let _ = Hashtbl.add iv0 p_r (RP.A(R.Idx i_r)) in
                    let i1 = RP.A(R.Agl(2,2,RP.A(R.Idx 3))) in
                    let pvi = gns.ns_vct_n in 
                    gns.ns_vct.(pvi)<-(i1,ref(Ln(App(Axm Axm.opn,Var t_v))),Prs_Dst);
                    gns.ns_vct_n<-pvi+1;
                    let e_pi = emt_ir i1 gns ns iv0 !pi in
                    (*Util.pnt true "V None 2\n";*)
                    let lb1 = lb () in
                    let lb1_0 = lb () in
                    let lb1_1 = lb () in
                    let s_e_s = RSet.ini () in
                    let rec e_s i =
                      if i<0 then ""
                      else
                        ( s_e_s.(i)<-true;
                          "\tmov rax,QWORD [rsp+16*"^(string_of_int i)^"]\n"^
                          "\tbt rax,0\n"^
                          (cf_set i)^
                          "\tmov rax,QWORD [rsp+16*"^(string_of_int i)^"+8*1]\n"^
                          "\tmov "^(emt_reg_x86 i)^",rax\n"^
                          (e_s (i-1)) ) in
                    s_e_s.(rn+rnc)<-true;
                    let lbn = lb () in
                    let lbnc = lb () in
                    let lbnc_0 = lb () in 
                    let e0 =
                      "\tmov r10d,DWORD [r13+4]\n"^
                      "\tpush "^(emt_reg_x86 1)^"\n"^
                      "\tsub rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                      (emt_ptn_grm lbn i ns f r 0)^
                      (emt_ptn_grm lbnc i ns f rc rn)^
                      "\tpush r10\n"^
                      e_al^
                      lb_x^":\n"^
                      "\tpop r10\n"^
                      "\tcmp "^(emt_reg_x86 2)^",0\n"^
                      "\tjz "^lb_x1^"\n"^
                      "\tmov rdi,"^(emt_reg_x86 3)^"\n"^
                      free_blk_r^
                      (prs_dec_i (rn-1))^
                      "\tjmp "^lbn^"\n"^
                      lb_x1^":\n"^
                      "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
                      "\tmov rsi,"^(emt_reg_x86 1)^"\n"^
                      "\tmov "^(emt_reg_x86 (rn+rnc))^","^(emt_reg_x86 3)^"\n"^
                      "\tbt r12,3\n"^
                      (cf_set (rn+rnc))^
                      (e_s ((rn+rnc)-1))^
                      "\tadd rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                      "\tpush rdi\n"^
                      "\tpush rsi\n"^
                      "\tpush "^(string_of_int pvi)^"\n"^
                      "\tpush "^lb1^"\n"^
                      "\tpush "^lb1^"\n" in
                    let e1 =
                      e0^
                      (emt_mov_ptn_to_ptn R.M_Dlt s_e_s i_e_s i0)^
                      "\tmov rax,QWORD [rsp+8*3]\n"^
                      "\tmov "^(emt_reg_x86 i_r)^",rax\n"^
                      "\tmov rax,QWORD [rsp+8*5]\n"^
                      "\tmov "^(emt_reg_x86 i_n)^",rax\n"^
                      "\tbts r12,"^(string_of_int i_n)^"\n"^
                      "\tbts r12,"^(string_of_int i_r)^"\n"^
                      e_pi^
                      lb1^":\n"^
                      "\tadd rsp,16\n"^
                      "\tpop "^(emt_reg_x86 1)^"\n"^
                      "\tpop "^(emt_reg_x86 0)^"\n"^
                      "\tbts r12,1\n"^
                      "\tbtr r12,0\n"^
                      "\tcmp "^(emt_reg_x86 2)^",0\n"^
                      "\tjz "^lb1_1^"\n"^
                      "\tpop "^(emt_reg_x86 1)^"\n"^
                      "\tjmp "^lbnc_0^"\n"^
                      lb1_1^":\n"^
                      "\tadd rsp,8\n"^
                      ( match lb_p with
                        | Some lb_p -> "\tjmp "^lb_p^"\n"
                        | None -> "\tret\n" )^
                      lbnc^":\n"^
                      "\tadd rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                      "\tpop "^(emt_reg_x86 1)^"\n"^
                      (prs_dec_i_cut ps)^
                      (alc_blk_r 0)^
                      "\tmov rdi,rax\n"^
                      "\tmov rax,0x0000_0000_"^(Printf.sprintf "%02x" 0)^"00_ffff\n"^
                      "\tmov QWORD [rdi],rax\n"^
                      "\tmov "^(emt_reg_x86 3)^",rdi\n"^
                      "\tmov "^(emt_reg_x86 2)^",1\n"^
                      "\tbtr r12,3\n"^
                      "\tbts r12,2\n"^
                      lbnc_0^":\n"^
                      ( match lb_p with
                        | Some lb_p -> "\tjmp "^lb_p^"\n"
                        | None -> "\tret\n" )^
                      lbn^":\n"^
                      "\tadd rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                      "\tpop "^(emt_reg_x86 1)^"\n"^
                      lb1_0^":\n" in
                    e1^
                    (lp lb_p ps (i+1) tl)                )
              | Grm.Act_End((p_n,p_r,_,_,(re,pi)),f,r,rc) ->
                ( match rc with
                  | None ->
                    (*Util.pnt true "V None 0\n";*)
                    let rn = List.length r in
                    let iv0 = Hashtbl.create 10 in
                    let i_e_s = RP.R(Array.init rn (fun i -> RP.A(R.Idx i))) in
                    let i0 = crt_ptn_iv gns (mk_idx_ptn re) iv0 in
                    let s0 = rset_iv iv0 in 
                    let i_n = RSet.min_0 s0 in 
                    s0.(i_n)<-true;
                    let i_r = RSet.min_0 s0 in 
                    let _ = Hashtbl.add iv0 p_n (RP.A(R.Idx i_n)) in
                    let _ = Hashtbl.add iv0 p_r (RP.A(R.Idx i_r)) in
                    let i1 = RP.A(R.Agl(2,2,RP.A(R.Idx 3))) in
                    let pvi = gns.ns_vct_n in 
                    gns.ns_vct.(pvi)<-(i1,ref(Ln(App(Axm Axm.opn,Var t_v))),Prs_Dst);
                    gns.ns_vct_n<-pvi+1;
                    let e_pi = emt_ir i1 gns ns iv0 !pi in
                    (*Util.pnt true "V None 00\n";*)
                    let lb1 = lb () in
                    let lb1_0 = lb () in
                    let lb1_1 = lb () in
                    let s_e_s = RSet.ini () in
                    let rec e_s i =
                      if i<0 then ""
                      else
                        ( s_e_s.(i)<-true;
                          "\tmov rax,QWORD [rsp+16*"^(string_of_int i)^"]\n"^
                          "\tbt rax,0\n"^
                          (cf_set i)^
                          "\tmov rax,QWORD [rsp+16*"^(string_of_int i)^"+8*1]\n"^
                          "\tmov "^(emt_reg_x86 i)^",rax\n"^
                          (e_s (i-1)) ) in
                    let lbn = lb () in
                    let e0 =
                      "\tmov r10d,DWORD [r13+4]\n"^ 
                      "\tpush "^(emt_reg_x86 1)^"\n"^
                      "\tsub rsp,"^(string_of_int (rn*16))^"\n"^
                      (emt_ptn_grm lbn i ns f r 0)^
                      "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
                      "\tmov rsi,"^(emt_reg_x86 1)^"\n"^
                      (e_s (rn-1))^
                      "\tadd rsp,"^(string_of_int (rn*16))^"\n"^
                      "\tpush rdi\n"^
                      "\tpush rsi\n"^
                      "\tpush "^(string_of_int pvi)^"\n"^
                      "\tpush "^lb1^"\n"^
                      "\tpush "^lb1^"\n" in
                    let e1 =
                      e0^
                      (emt_mov_ptn_to_ptn R.M_Dlt s_e_s i_e_s i0)^
                      "\tmov rax,QWORD [rsp+8*3]\n"^
                      "\tmov "^(emt_reg_x86 i_r)^",rax\n"^
                      "\tmov rax,QWORD [rsp+8*5]\n"^
                      "\tmov "^(emt_reg_x86 i_n)^",rax\n"^
                      "\tbts r12,"^(string_of_int i_n)^"\n"^
                      "\tbts r12,"^(string_of_int i_r)^"\n"^
                      e_pi^
                      lb1^":\n"^
                      "\tadd rsp,16\n"^
                      "\tpop "^(emt_reg_x86 1)^"\n"^
                      "\tpop "^(emt_reg_x86 0)^"\n"^
                      "\tbts r12,1\n"^
                      "\tbtr r12,0\n"^
                      "\tcmp "^(emt_reg_x86 2)^",0\n"^
                      "\tjz "^lb1_1^"\n"^
                      "\tpop "^(emt_reg_x86 1)^"\n"^
                      "\tmov rdi,"^(emt_reg_x86 3)^"\n"^
                      free_blk_r^
                      "\tjmp "^lb1_0^"\n"^
                      lb1_1^":\n"^
                      "\tadd rsp,8\n"^
                      ( match lb_p with
                        | Some lb_p -> "\tjmp "^lb_p^"\n"
                        | None -> "\tret\n" )^
                      lbn^":\n"^
                      "\tadd rsp,"^(string_of_int (rn*16))^"\n"^
                      "\tpop r14\n"^
                      lb1_0^":\n" in
                    e1^
                    (lp lb_p ps (i+1) tl)
                  | Some rc ->
                    (*Util.pnt true "V None 1\n";*)
                    let rn = List.length r in
                    let rnc = List.length rc in
                    let iv0 = Hashtbl.create 10 in
                    let i_e_s = RP.R(Array.init (rn+rnc) (fun i -> RP.A(R.Idx i))) in
                    let i0 = crt_ptn_iv gns (mk_idx_ptn re) iv0 in
                    let s0 = rset_iv iv0 in 
                    let i_n = RSet.min_0 s0 in 
                    s0.(i_n)<-true;
                    let i_r = RSet.min_0 s0 in 
                    let _ = Hashtbl.add iv0 p_n (RP.A(R.Idx i_n)) in
                    let _ = Hashtbl.add iv0 p_r (RP.A(R.Idx i_r)) in
                    let i1 = RP.A(R.Agl(2,2,RP.A(R.Idx 3))) in
                    let pvi = gns.ns_vct_n in 
                    gns.ns_vct.(pvi)<-(i1,ref(Ln(App(Axm Axm.opn,Var t_v))),Prs_Dst);
                    gns.ns_vct_n<-pvi+1;
                    let e_pi = emt_ir i1 gns ns iv0 !pi in
                    (*Util.pnt true "V None 2\n";*)
                    let lb1 = lb () in
                    let lb1_0 = lb () in
                    let lb1_1 = lb () in
                    let s_e_s = RSet.ini () in
                    let rec e_s i =
                      if i<0 then ""
                      else
                        ( s_e_s.(i)<-true;
                          "\tmov rax,QWORD [rsp+16*"^(string_of_int i)^"]\n"^
                          "\tbt rax,0\n"^
                          (cf_set i)^
                          "\tmov rax,QWORD [rsp+16*"^(string_of_int i)^"+8*1]\n"^
                          "\tmov "^(emt_reg_x86 i)^",rax\n"^
                          (e_s (i-1)) ) in
                    let lbn = lb () in
                    let lbnc = lb () in
                    let lbnc_0 = lb () in 
                    let e0 =
                      "\tmov r10d,DWORD [r13+4]\n"^
                      "\tpush "^(emt_reg_x86 1)^"\n"^
                      "\tsub rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                      (emt_ptn_grm lbn i ns f r 0)^
                      (emt_ptn_grm lbnc i ns f rc rn)^
                      "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
                      "\tmov rsi,"^(emt_reg_x86 1)^"\n"^
                      (e_s ((rn+rnc)-1))^
                      "\tadd rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                      "\tpush rdi\n"^
                      "\tpush rsi\n"^
                      "\tpush "^(string_of_int pvi)^"\n"^
                      "\tpush "^lb1^"\n"^
                      "\tpush "^lb1^"\n" in
                    let e1 =
                      e0^
                      (emt_mov_ptn_to_ptn R.M_Dlt s_e_s i_e_s i0)^
                      "\tmov rax,QWORD [rsp+8*3]\n"^
                      "\tmov "^(emt_reg_x86 i_r)^",rax\n"^
                      "\tmov rax,QWORD [rsp+8*5]\n"^
                      "\tmov "^(emt_reg_x86 i_n)^",rax\n"^
                      "\tbts r12,"^(string_of_int i_n)^"\n"^
                      "\tbts r12,"^(string_of_int i_r)^"\n"^
                      e_pi^
                      lb1^":\n"^
                      "\tadd rsp,16\n"^
                      "\tpop "^(emt_reg_x86 1)^"\n"^
                      "\tpop "^(emt_reg_x86 0)^"\n"^
                      "\tbts r12,1\n"^
                      "\tbtr r12,0\n"^
                      "\tcmp "^(emt_reg_x86 2)^",0\n"^
                      "\tjz "^lb1_1^"\n"^
                      "\tpop "^(emt_reg_x86 1)^"\n"^
                      "\tjmp "^lbnc_0^"\n"^
                      lb1_1^":\n"^
                      "\tadd rsp,8\n"^
                      ( match lb_p with
                        | Some lb_p -> "\tjmp "^lb_p^"\n"
                        | None -> "\tret\n" )^
                      lbnc^":\n"^
                      "\tadd rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                      "\tpop "^(emt_reg_x86 1)^"\n"^
                      (prs_dec_i_cut ps)^
                      (alc_blk_r 0)^
                      "\tmov rdi,rax\n"^
                      "\tmov rax,0x0000_0000_"^(Printf.sprintf "%02x" 0)^"00_ffff\n"^
                      "\tmov QWORD [rdi],rax\n"^
                      "\tmov "^(emt_reg_x86 3)^",rdi\n"^
                      "\tmov "^(emt_reg_x86 2)^",1\n"^
                      "\tbtr r12,3\n"^
                      "\tbts r12,2\n"^
                      lbnc_0^":\n"^
                      ( match lb_p with
                        | Some lb_p -> "\tjmp "^lb_p^"\n"
                        | None -> "\tret\n" )^
                      lbn^":\n"^
                      "\tadd rsp,"^(string_of_int ((rn+rnc)*16))^"\n"^
                      "\tpop "^(emt_reg_x86 1)^"\n"^
                      lb1_0^":\n" in
                    e1^
                    (lp lb_p ps (i+1) tl)                )
            )
          | [] ->
            (alc_blk_r 0)^
            "\tmov rdi,0x0000_0000_0000_ffff\n"^
            "\tmov QWORD [rax],rdi\n"^
            "\tmov "^(emt_reg_x86 3)^",rax\n"^
            "\tmov "^(emt_reg_x86 2)^",1\n"^
            "\tbtr r12,3\n"^
            "\tbts r12,2\n"^
            ( match lb_p with
              | Some lb_p -> "\tjmp "^lb_p^"\n"
              | None -> "\tret\n" ) ) in
      lp None [] 0 l )
and emt_ptn_grm lbn i ns f r j =
  ( match r with
    | p::tl ->
      let l0 = lb () in
      let l1 = lb () in
      let l2 = lb () in
      let es =
        if f=Grm.Lex then ""
        else if f=Grm.Synt then
          "\tjmp "^l1^"\n"^
          l0^":\n"^
          "\tadd "^(emt_reg_x86 1)^",1\n"^
          l1^":\n"^
          "\tcmp r14,r10\n"^
          "\tjge "^l2^"\n"^
          "\tmov al,[r13+r14+8*1]\n"^
          "\tcmp al,9\n"^
          "\tjz "^l0^"\n"^
          "\tcmp al,10\n"^
          "\tjz "^l0^"\n"^
          "\tcmp al,32\n"^
          "\tjz "^l0^"\n"^
          l2^":\n"
        else
          "\tjmp "^l1^"\n"^
          l0^":\n"^
          "\tadd "^(emt_reg_x86 1)^",1\n"^
          l1^":\n"^
          "\tcmp r14,r10\n"^
          "\tjge "^l2^"\n"^
          "\tmov al,[r13+r14+8*1]\n"^
          "\tcmp al,9\n"^
          "\tjz "^l0^"\n"^
          "\tcmp al,32\n"^
          "\tjz "^l0^"\n"^
          l2^":\n" in
      let e_p =
        ( match p with
          | Grm.Atm a ->
            let lb0 = lb () in
            ( match a with
              | Grm.Txt s ->
                let bs = Bytes.of_string s in
                let lbs = Bytes.length bs in
                let e_d = prs_dec_i (j-1) in
                let lb_f = lb () in
                let lb_t = lb () in
                let rec e_lp0 ib =
                  if ib<lbs
                  then
                    "\tmovzx rax,BYTE [r13+r14+8*1+"^(string_of_int ib)^"-"^(string_of_int lbs)^"]\n"^
                    "\tcmp al,"^(string_of_int (Char.code bs.[ib]))^"\n"^
                    "\tjnz "^lb_f^"\n"^
                    (e_lp0 (ib+1))
                  else "" in
                "; \""^(String.escaped s)^"\"\n"^
                es^
                "\tadd r14,"^(string_of_int lbs)^"\n"^
                "\tcmp r14,r10\n"^
                "\tjg "^lb_f^"\n"^
                (e_lp0 0)^
                "\tjmp "^lb_t^"\n"^
                lb_f^":\n"^
                e_d^
                "\tjmp "^lbn^"\n"^
                lb_t^":\n"^
                (alc_blk_r 0)^
                "\tmov rdi,0x0000_0000_0000_ffff\n"^
                "\tmov QWORD [rax],rdi\n"^
                "\tmov QWORD [rsp+16*"^(string_of_int j)^"],0\n"^
                "\tmov QWORD [rsp+8*1+16*"^(string_of_int j)^"],rax\n"
              | Grm.Name f ->
                let mf = get_ns_m_t !ns f in
                let m_ns = get_ns_m !ns f in
                ( match !mf with
                  | M_Prm "grm" ->
                    let epf = List.assoc "prs" !m_ns.ns_p in
                    "; "^(pnt_name f)^"\n"^
                    es^
                    "\tpush r10\n"^
                    "\tcall NS_E_"^(Sgn.print epf)^"_ETR_TBL\n"^
                    "\tpop r10\n"^
                    "\tcmp "^(emt_reg_x86 2)^",0\n"^
                    "\tjz "^lb0^"\n"^
                    "\tmov rdi,"^(emt_reg_x86 3)^"\n"^
                    free_blk_r^
                    (prs_dec_i (j-1))^
                    "\tjmp "^lbn^"\n"^
                    lb0^":\n"^
                    "\tmov rax,0\n"^
                    "\tbt r12,3\n"^
                    "\tsetc al\n"^
                    "\tmov QWORD [rsp+16*"^(string_of_int j)^"],rax\n"^
                    "\tmov QWORD [rsp+8*1+16*"^(string_of_int j)^"],"^(emt_reg_x86 3)^"\n"
                  | _ -> err "emt_ptn 1" )
            )
          | Grm.Lst a ->
            let lb_t = lb () in
            let lb_0 = lb () in
            ( match a with
              | Grm.Txt s ->
                let bs = Bytes.of_string s in
                let lbs = Bytes.length bs in
                let rec e_lp0 ib =
                  if ib<lbs
                  then
                    "\tmov rax,0\n"^
                    "\tmov al,BYTE [r13+r14+8*1-"^(string_of_int lbs)^"+"^(string_of_int ib)^"]\n"^
                    "\tcmp al,"^(string_of_int (Char.code bs.[ib]))^"\n"^
                    "\tjnz "^lb_t^"\n"^
                    (e_lp0 (ib+1))
                  else "" in
                "; ⟦ \""^(String.escaped s)^"\" ⟧\n"^
                (alc_blk_r 0)^
                "\tmov r8,rax\n"^
                "\tmov rsi,0x0000_0000_0000_ffff\n"^
                "\tmov QWORD [r8],rsi\n"^
                "\tmov rsi,0x01_00_0000_0000_0001\n"^
                "\tor r8,rsi\n"^
                lb_0^":\n"^
                es^
                "\tadd r14,"^(string_of_int lbs)^"\n"^
                "\tcmp r14,r10\n"^
                "\tjg "^lb_t^"\n"^
                (e_lp0 0)^
                (alc_blk_r 2)^
                "\tmov rdi,0x0000_0002_"^(Printf.sprintf "%02x" 2)^"00_fffc\n"^
                "\tmov QWORD [rax],rdi\n"^
                "\tmov [rax+8*2],r8\n"^
                "\tmov r8,rax\n"^
                (alc_blk_r 0)^
                "\tmov rdi,0x0000_0000_"^(Printf.sprintf "%02x" 0)^"00_ffff\n"^
                "\tmov QWORD [rax],rdi\n"^
                "\tmov [r8+8*1],rax\n"^
                "\tmov rdi,0x00_00_0000_0000_0001\n"^
                "\tor r8,rdi\n"^
                "\tjmp "^lb_0^"\n"^
                lb_t^":\n"^
                "\tsub r14,"^(string_of_int lbs)^"\n"^
                "\tmov QWORD [rsp+16*"^(string_of_int j)^"],0\n"^
                "\tmov QWORD [rsp+8*1+16*"^(string_of_int j)^"],r8\n"
              | Grm.Name f ->
                let mf = get_ns_m_t !ns f in
                let m_ns = get_ns_m !ns f in
                let lb_nc = lb () in
                ( match !mf with
                  | M_Prm "grm" ->
                    let epf = List.assoc "prs" !m_ns.ns_p in
                    "; ⟦ "^(pnt_name f)^" ⟧\n"^
                    (alc_blk_r 0)^
                    "\tmov rdi,0x0000_0000_0000_ffff\n"^
                    "\tmov QWORD [rax],rdi\n"^
                    "\tmov rdi,0x01_00_0000_0000_0001\n"^
                    "\tor rax,rdi\n"^
                    "\tmov r8,rax\n"^
                    lb_0^":\n"^
                    es^
                    "\tpush r8\n"^
                    "\tpush r10\n"^
                    "\tcall NS_E_"^(Sgn.print epf)^"_ETR_TBL\n"^
                    "\tpop r10\n"^
                    "\tpop rcx\n"^
                    "\tcmp "^(emt_reg_x86 2)^",0\n"^
                    "\tjnz "^lb_t^"\n"^
                    (alc_blk_r 2)^
                    "\tmov rdi,0x0000_0002_"^(Printf.sprintf "%02x" 2)^"00_fffc\n"^
                    "\tmov QWORD [rax],rdi\n"^
                    "\tmov QWORD [rax+8*2],rcx\n"^
                    "\tbt r12,3\n"^
                    "\tjnc "^lb_nc^"\n"^
                    "\tbts QWORD [rax],0\n"^
                    lb_nc^":\n"^
                    "\tmov QWORD [rax+8*1],"^(emt_reg_x86 3)^"\n"^
                    "\tmov rdi,0x00_00_0000_0000_0001\n"^
                    "\tor rax,rdi\n"^
                    "\tmov r8,rax\n"^
                    "\tjmp "^lb_0^"\n"^
                    lb_t^":\n"^
                    "\tmov rdi,"^(emt_reg_x86 3)^"\n"^
                    free_blk_r^
                    "\tmov QWORD [rsp+16*"^(string_of_int j)^"],0\n"^
                    "\tmov QWORD [rsp+8*1+16*"^(string_of_int j)^"],rcx\n"
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
                let mf = get_ns_m_t !ns f in
                ( match !mf with
                  | M_Prm "grm" ->
                    let epf = List.assoc "prs" !ns.ns_p in
                    (*let ma = List.assoc "prs" !mp.ns_e in
                      let (epf,_ ) = !ma in*)
                    l0^":\n"^
                    es^
                    "\tcall NS_E_"^(Sgn.print epf)^"_ETR_TBL\n"^
                    l1^":\n"^
                    "\tmov rax,1\n"
                  | _ -> err "emt_ptn 5" )
            ) ) in
      e_p^(emt_ptn_grm lbn i ns f tl (j+1))
    | [] -> "" )
and emt_m gns (ns:ns_v ref) ld (el:Ast.glb_etr list) =
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
          | Mdl_Eq(n,m) ->
            let nsm = get_ns_m !ns m in
            let nsm_t = get_ns_m_t !ns m in
            !ns.ns_m_t <- (n,nsm_t):: !ns.ns_m_t;
            !ns.ns_m <- (n,nsm)::!ns.ns_m;
            ("","","",tbs^"§§ "^n^" = "^(pnt_name m)^"\n")
          | Mdl(n,el0) ->
            !ns.ns_m_t <- (n,ref Ast.M_WC):: !ns.ns_m_t;
            let ns_1 = ref(init_ns ()) in
            !ns_1.root <- (Some ns);
            !ns.ns_m <- (n,ns_1)::!ns.ns_m;
            let (e0,e1,e2,pp) = emt_m gns ns_1 (ld+1) el0 in
            (e0,e1,e2,tbs^"§§ "^n^"\n"^pp^tbs^"§§.\n")
          | Etr(n,_,_,(r0,p0)) ->
            Util.pnt true @@ "Etr "^n^"\n";
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
            let pvi = gns.ns_vct_n in 
            !ns.ns_p <- (n,ep)::!ns.ns_p;
            gns.ns_e <- (ep,ref(Etr_V(i0,i1,pvi)))::gns.ns_e;
            gns.ns <- (ep,ref(Ln y))::gns.ns;
            gns.ns_vct.(pvi)<-(i1,ref(Ln y1),Etr_Dst);
            gns.ns_vct_n<-pvi+1;
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
            ("",e0,"",pp)
          | Etr_Abs(_,_,_) -> err "emt_m etr_abs 0"
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
              )
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
              "\t\tdq 0x0000_0001_00_82_ffff\n"^
              "\t\tdq 1\n" in
            let sx =
              "\tcall NS_E_"^(Sgn.print ep)^"\n" in
            (se,e_p,sx,pp)
          | Etr_Clq q ->
            let (l_0,_) =
              List.fold_left
                (fun (l_0,nl) (n,_,_,(r0,p0)) ->
                   if List.exists (fun m -> n=m) nl then err "Etr_Clq 0"
                   else
                     let ep = sgn () in
                     !ns.ns_p <- (n,ep)::!ns.ns_p;
                     let (r0,p0) = slv_r_etr (r0,p0) in
                     let y0 = inst_ptn gns 0 r0 in
                     let y1 = newvar_l 0 in
                     let y2 = newvar () in
                     y2 := Ln(Imp(y0,Var y1));
                     gns.ns <-  (ep,y2)::gns.ns;
                     ((n,y2,y1,p0,r0,ep)::l_0,n::nl) )
                ([],[]) q in
            let l_1 =
              List.fold_left
                ( fun l (n,y2,y1,p0,r0,ep) ->
                    (*Util.pnt true @@ "Etr "^n^"\n";*)
                    let y1_x = slv gns !ns 0 !p0 in
                    let _ = unify [] (Var y1) (inst 0 y1_x) in
                    (n,y2,y1,y1_x,p0,r0,ep)::l )
                [] l_0 in
            let l_2 =
              List.fold_left
                ( fun l (n,y2,y1,y1_x,p0,r0,ep) ->
                    (*Util.Log.add "l_2:0\n";*)
                    gen (ref []) (-1) (Var y2);
                    gen (ref []) (-1) (Var y1);
                    let iv0 = Hashtbl.create 10 in
                    let i0 = crt_ptn_iv gns (mk_idx_ptn r0) iv0 in
                    let s1 = Hashtbl.create 10 in
                    let i1 = alc_idx_ty (rset_iv s1) y1_x in
                    let pvi = gns.ns_vct_n in 
                    gns.ns_vct.(pvi)<-(i1,y1,Etr_Dst);
                    gns.ns_vct_n<-pvi+1;
                    gns.ns_e <- (ep,ref(Etr_V(i0,i1,pvi)))::gns.ns_e;
                    (n,y2,y1,y1_x,p0,r0,i0,i1,iv0,ep)::l )
                [] l_1 in
            List.fold_left
              ( fun (e_0,e_1,e_2,pp) (n,y2,_,_,p0,_,i0,i1,s0,ep) ->
                  let e_p = emt_ir i1 gns ns s0 !p0 in
                  let pp =
                    pp^tbs^"\t@."^n^" : "^(Types.print_t (Var y2))^"\n" in
                  let c0 = cmt ("\t|» "^(emt_ptn i0)) in
                  let l_e = "NS_E_"^(Sgn.print ep) in
                  let l_e_rdi = "NS_E_RDI_"^(Sgn.print ep) in
                  let e0 =
                    l_e^":\n"
                    ^c0^
                    l_e_rdi^":\n"^
                    e_p in
                  (e_0,e_1^e0,e_2,pp) )
              ("","","",tbs^"§ \n") l_2
          | Flow f ->
            ( match f with
              | Ast.Def_CoPrd (n,a,ds) ->
                let (_,vs) = List.split a in
                let ds = List.map (fun (y,c) -> (mk_vars (ref []) !ns `Abs (ref a) y,c)) ds in
                let yp = sgn () in
                let ya = List.fold_left (fun ya (_,v) -> App(ya,Var v)) (Axm yp) a in
                (*let yt = List.fold_left (fun yt (_,v) -> Abs(v,yt)) ya a in
                  !ns.ns_t <- (n,ref(Ln yt))::!ns.ns_t;*)
                !ns.ns_t <- (n,ref(Ln(Axm yp)))::!ns.ns_t;
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
                        (i+1,s,pp0^ppi) )
                    (0,"","") ds in
                (es,"","",tbs^"¶ "^n^(pnt_vs vs)^"\n"^pp0)
              | Ast.Def_Abs (n,a) ->
                let (a0,_) = List.split a in
                !ns.ns_t <- (n,ref(Ln(Axm (sgn ()))))::!ns.ns_t;
                ("","","",tbs^"¶ "^n^(pnt_args `Hd a0)^"\n")
              | Ast.Def_EqT (n,a,y) ->
                let (a0,_) = List.split a in
                let ya = mk_vars (ref []) !ns `Abs (ref a) y in
                let yt = List.fold_right ( fun (_,v) yt -> Abs(v,yt)) a ya in
                !ns.ns_t <- (n,ref(Ln yt))::!ns.ns_t;
                ("","","",tbs^"¶ "^n^(pnt_args `Hd a0)^" = "^(Types.print_t ya)^"\n")
              | _ -> err "slv_flows 1" )
          | Flow_Clq q ->
            let nl = ref [] in
            let dl =
              List.map
                ( fun f ->
                    ( match f with
                      | Ast.Def_CoPrd (n,a,ds) ->
                        if List.exists (fun m -> n=m) !nl then err "Flow_Clq 0"
                        else
                          ( nl := n::!nl;
                            let (_,_) = List.split a in
                            let yp = sgn () in
                            let ya = List.fold_left ( fun ya (_,v) -> App(ya,Var v)) (Axm yp) a in
                            (*let yt = List.fold_left ( fun yt (_,v) -> Abs(v,yt)) ya a in
                              !ns.ns_t <- (n,ref(Ln yt))::!ns.ns_t;*)
                            !ns.ns_t <- (n,ref(Ln(Axm yp)))::!ns.ns_t;
                            `CP(n,a,ds,ya) )
                      | Ast.Def_Abs (n,a) -> (`Abs (n,a))
                      | Ast.Def_EqT (n,a,y) ->
                        if List.exists (fun m -> n=m) !nl then err "Flow_Clq 1"
                        else
                          ( nl := n::!nl;
                            let v = newvar () in
                            !ns.ns_t <- (n,v)::!ns.ns_t;
                            (`EqT (n,a,y,v)) )
                      | _ -> err "slv_flows 1" )
                ) q in
            let (es,pp) =
              List.fold_left
                ( fun (es,pp) f ->
                    ( match f with
                      | `CP (n,a,ds,ya) ->
                        let (_,vs) = List.split a in
                        let ds = List.map (fun (y,c) -> (mk_vars (ref []) !ns `Abs (ref a) y,c)) ds in
                        let dl = List.length ds in
                        let (_,eq,pp0) =
                          List.fold_left
                            (fun (i,eq,pp0) (t,n) ->
                               let tc = Imp(t,ya) in
                               let epi = sgn () in
                               !ns.ns_p <- (n,epi)::!ns.ns_p;
                               gns.ns_e <- (epi,ref(Ctr(i,dl)))::gns.ns_e;
                               gns.ns <- (epi,ref (Ln tc))::gns.ns;
                               let ppi =
                                 tbs^"\t∐ "^n^" : "^(Types.print_t t)^"\n" in
                               (i+1,eq,pp0^ppi))
                            (0,"","") ds in
                        (es^eq,pp^tbs^"\t@."^n^(pnt_vs vs)^"\n"^pp0)
                      | `Abs (n,a) ->
                        let (a,_) = List.split a in
                        ("",pp^tbs^"\t@."^n^(pnt_args `Hd a)^"\n")
                      | `EqT (n,a,y,v) ->
                        let (_,_) = List.split a in
                        let ya = mk_vars (ref []) !ns `Abs (ref a) y in
                        let yt = List.fold_right (fun (_,v) yt -> Abs(v,yt)) a ya in
                        v := (Ln yt);
                        ("",pp^tbs^"\t@."^n^" = ..\n")
                      | _ -> err "slv_flows 1" )
                )
                ("","") dl in
            (es,"","",tbs^"¶\n"^pp)
          | Grm_Abs _ -> err "Grm_Abs 0"
          | Gram (g:Ast.grm) ->
            let nl = ref [] in
            let nla n =
              if List.exists (fun m -> n=m) !nl then err "Etr_Clq 0"
              else
                nl := n::!nl in
            let gv =
              List.fold_left
                ( fun gv g ->
                    ( match g with
                      | Grm.Cnc (n,rs) ->
                        let _ = (nla n) in
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
                        gns.ns_e <- (epv,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|],(-1))))::gns.ns_e;
                        gv@[`P(n,rs,t_p,epv,ns_g)]
                      | Grm.Act(n,rs) ->
                        let _ = nla n in
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
                        gns.ns_e <- (epv,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|],(-1))))::gns.ns_e;
                        gv@[`V(n,rs,t_v,epv,ns_g)]
                    ))
                [] g in
            let gv_0 =
              List.fold_left
                ( fun gv_0 rsi ->
                    match rsi with
                    | `P(n,rs,t_p,epv,ns_g) ->
                      let rsl = List.length rs in
                      let rec f0 i rsl t_p cn e =
                        ( match e with
                          | Grm.Cnc_Seq(nc,_,r,rc,l) ->
                            let r =
                              ( match rc with
                                | Some rc -> r@rc
                                | None -> r ) in
                            let nc =
                              ( match nc with
                                | Grm.CN nc -> nc
                                | Grm.CN_A -> cn^"_c"^(string_of_int i)) in
                            let t = mk_var_grm !ns_g r in
                            let tc = Imp(t,Axm t_p) in
                            let epv_i = sgn () in
                            !ns_g.ns_p <- (nc,epv_i)::!ns_g.ns_p;
                            gns.ns <- (epv_i,ref (Ln tc))::gns.ns;
                            gns.ns_e <-  (epv_i,ref(Ctr(i,rsl)))::gns.ns_e;
                            let rsl0 = List.length l in
                            let t_p0 = sgn () in
                            !ns_g.ns_t <- (nc^"_t",ref(Ln(Axm t_p0)))::!ns_g.ns_t;
                            let l0 = List.mapi (fun i e -> f0 i rsl0 t_p0 nc e) l in
                            (nc,t_p,t,epv_i,`Seq l0)
                          | Grm.Cnc_End(nc,_,r,rc) ->
                            let r =
                              ( match rc with
                                | Some rc -> r@rc
                                | None -> r ) in
                            let nc =
                              ( match nc with
                                | Grm.CN nc -> nc
                                | Grm.CN_A -> cn^"_c"^(string_of_int i)) in
                            let t = mk_var_grm !ns_g r in
                            let tc = Imp(t,Axm t_p) in
                            let epv_i = sgn () in
                            !ns_g.ns_p <- (nc,epv_i)::!ns_g.ns_p;
                            gns.ns <- (epv_i,ref (Ln tc))::gns.ns;
                            gns.ns_e <-  (epv_i,ref(Ctr(i,rsl)))::gns.ns_e;
                            (nc,t_p,t,epv_i,`End) ) in
                      let rts = List.mapi
                          ( fun i e ->
                              let (_,_,t,epv_i,_) = f0 i rsl t_p "" e in
                              (t,epv_i)) rs in
                      gv_0@[`P(n,rs,rts,t_p,epv,ns_g)]
                    | `V(n,rs,t_v,epv,ns_g) ->
                      let rec rts_f lv t_v rs =
                        List.fold_left
                          ( fun rts e ->
                              ( match e with
                                | Grm.Act_Seq((p_n,p_r,p_c,p_s,(r0,p0)),_,r,rc,al) ->
                                  let t_x = newvar_l (lv+1) in 
                                  let _ = rts_f (lv+1) t_x al in 
                                  let r =
                                    ( match rc with
                                      | Some rc -> r@rc
                                      | None -> r ) in
                                  let y = inst lv (mk_var_grm !ns_g r) in
                                  let (r0,p0) = slv_r_grm_etr p_n p_r p_c (Some p_s) (r0,p0) in
                                  let y0 = inst_ptn gns lv r0 in
                                  gns.ns_r_t<-(p_n,ref(Ln(Axm Axm.r64)))::gns.ns_r_t;
                                  gns.ns_r_t<-(p_r,ref(Ln(Axm Axm.r64)))::gns.ns_r_t;
                                  gns.ns_r_t<-(p_c,ref(Ln(Axm Axm.r64)))::gns.ns_r_t;
                                  let y_s = inst_v_r gns (lv+1) p_s in 
                                  let _ = unify [] y_s (Var t_x) in 
                                  let _ = gen (ref []) lv y_s in 
                                  let _ = unify [] y y0 in
                                  (*let _ = gen (ref []) (-1) y_s in 
                                    let _ = gen (ref []) (-1) y in *)
                                  let y1 = slv gns !ns lv !p0 in
                                  let _ = unify [] (inst lv y1) (App(Axm Types.Axm.opn,Var t_v)) in
                                  rts @ [y]
                                | Grm.Act_End((p_n,p_r,p_c,_,(r0,p0)),_,r,rc) ->
                                  let r =
                                    ( match rc with
                                      | Some rc -> r@rc
                                      | None -> r ) in
                                  let y = inst lv (mk_var_grm !ns_g r) in
                                  let (r0,p0) = slv_r_grm_etr p_n p_r p_c None (r0,p0) in
                                  let y0 = inst_ptn gns lv r0 in
                                  gns.ns_r_t<-(p_n,ref(Ln(Axm Axm.r64)))::gns.ns_r_t;
                                  gns.ns_r_t<-(p_r,ref(Ln(Axm Axm.r64)))::gns.ns_r_t;
                                  gns.ns_r_t<-(p_c,ref(Ln(Axm Axm.r64)))::gns.ns_r_t;
                                  let _ = unify [] y y0 in
                                  (*let _ = gen (ref []) (-1) y in *)
                                  let y1 = slv gns !ns lv !p0 in
                                  let _ = unify [] (inst lv y1) (App(Axm Types.Axm.opn,Var t_v)) in
                                  rts @ [y] ) )
                          [] rs in
                      let rts = rts_f 0 t_v rs in
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
                    | `P(n,rs,_,_,epv,ns_g) ->
                      let ppi = Grm.print_etr (n,rs) in
                      let es0 =
                        es0^ 
                        (emt_prs gns ns_g epv (`P rs)) in
                      (es0,es1(*^eq^eq0*),pp^ppi)
                    | `V(n,rs,rts,t_v,epv,ns_g) ->
                      let ppi = Grm.print_etr_act (n,rs) in
                      let _ = List.combine rs rts in
                      let es0 =
                        es0^
                        (emt_prs gns ns_g epv (`V (t_v,rs))) in
                      (es0,es1,pp^ppi)
                ) ("","","") gv_0 in
            (es1,es0,"",tbs^"¶+ℙ \n"^pp)
        ) in
      Util.Log.add pp;
      let (et0,et1,et2,ppt) = emt_m gns ns ld tl in
      (e0^et0,e1^et1,e2^et2,pp^ppt)
  )

and init_prm () =
  let ns = ref (init_ns ()) in
  let gns = init_gns () in

  !ns.ns_t <- ("_r64",ref(Ln(Axm Axm.r64)))::!ns.ns_t;
  !ns.ns_t <- ("_s8",ref(Ln(Axm Axm.stg)))::!ns.ns_t;
  !ns.ns_t <- ("_sgn",ref(Ln(Axm Axm.sgn_p)))::!ns.ns_t;

  !ns.ns_m_t <- ("_byt",ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
  let ns_g = ref(init_ns ()) in
  !ns_g.root <- (Some ns);
  !ns.ns_m <- ("_byt",ns_g)::!ns.ns_m;
  !ns_g.ns_t <- ("t",ref(Ln(Axm Axm.r64)))::!ns_g.ns_t;
  let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;App(Axm Axm.opn,Axm Axm.r64)])) in
  let epf = sgn () in
  !ns_g.ns_p <- ("prs",epf)::!ns.ns_p;
  gns.ns <- (epf,ref(Ln yp))::gns.ns;
  gns.ns_e <- (epf,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|],(-1))))::gns.ns_e;
  let l_e = "NS_E_"^(Sgn.print epf) in
  let l_e_rdi = "NS_E_RDI_"^(Sgn.print epf) in
  let l_e_tbl = "NS_E_"^(Sgn.print epf)^"_ETR_TBL" in
  let l0 = lb () in
  let emt_byt =
    l_e^":\n"^
    l_e_rdi^":\n"^
    l_e_tbl^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tmov rsi,"^(emt_reg_x86 1)^"\n"^
    "\tcall byt\n"^
    "\tjnc "^l0^"\n"^
    "\tadd "^(emt_reg_x86 1)^",1\n"^
    "\tmov "^(emt_reg_x86 2)^",0\n"^
    "\tmov "^(emt_reg_x86 3)^",rax\n"^
    "\tbts r12,3\n"^
    "\tbts r12,2\n"^
    "\tret\n"^
    l0^":\n"^
    "\tmov "^(emt_reg_x86 2)^",1\n"^
    (alc_blk_r 0)^
    "\tmov rdi,0x0000_0000_"^(Printf.sprintf "%02x" 0)^"00_ffff\n"^
    "\tmov QWORD [rax],rdi\n"^
    "\tmov "^(emt_reg_x86 3)^",rax\n"^
    "\tbtr r12,3\n"^
    "\tbts r12,2\n"^
    "\tret\n"
  in

  !ns.ns_m_t <- ("_scf_d",ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
  let ns_g = ref(init_ns ()) in
  !ns_g.root <- (Some ns);
  !ns.ns_m <- ("_scf_d",ns_g)::!ns.ns_m;
  !ns_g.ns_t <- ("t",ref(Ln(Axm Axm.r64)))::!ns_g.ns_t;
  let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;App(Axm Axm.opn,Axm Axm.r64)])) in
  let epf = sgn () in
  !ns_g.ns_p <- ("prs",epf)::!ns.ns_p;
  gns.ns <- (epf,ref(Ln yp))::gns.ns;
  gns.ns_e <- (epf,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|],(-1))))::gns.ns_e;
  let l0 = "NS_E_"^(Sgn.print epf)^"_LB_0" in
  let l_e = "NS_E_"^(Sgn.print epf) in
  let l_e_rdi = "NS_E_RDI_"^(Sgn.print epf) in
  let l_e_tbl = "NS_E_"^(Sgn.print epf)^"_ETR_TBL" in
  let em =
    l_e^":\n"^
    l_e_rdi^":\n"^
    l_e_tbl^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tmov rsi,"^(emt_reg_x86 1)^"\n"^
    push_all^
    "\tcall scf_d\n"^
    pop_all^
    "\tcmp rdi,0\n"^
    "\tjz "^l0^"\n"^
    "\tmov "^(emt_reg_x86 1)^",rsi\n"^
    "\tmov "^(emt_reg_x86 2)^",0\n"^
    "\tmov "^(emt_reg_x86 3)^",rax\n"^
    "\tbts r12,3\n"^
    "\tbts r12,2\n"^
    "\tret\n"^
    l0^":\n"^
    "\tmov "^(emt_reg_x86 2)^",1\n"^
    (alc_blk_r 0)^
    "\tmov rsi,0x0000_0000_0000_ffff\n"^
    "\tmov QWORD [rax],rsi\n"^
    "\tmov "^(emt_reg_x86 3)^",rax\n"^
    "\tbtr r12,3\n"^
    "\tbts r12,2\n"^
    "\tret\n" in
  gns.ns_c<-(epf,em)::gns.ns_c;

  !ns.ns_m_t <- ("_chr",ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
  let ns_g = ref(init_ns ()) in
  !ns_g.root <- (Some ns);
  !ns.ns_m <- ("_chr",ns_g)::!ns.ns_m;
  !ns_g.ns_t <- ("t",ref(Ln(Axm Axm.stg)))::!ns_g.ns_t;
  let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;App(Axm Axm.opn,Axm Axm.stg)])) in
  let epf = sgn () in
  !ns_g.ns_p <- ("prs",epf)::!ns.ns_p;
  gns.ns <- (epf,ref(Ln yp))::gns.ns;
  gns.ns_e <- (epf,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|],(-1))))::gns.ns_e;
  let l0 = "NS_E_"^(Sgn.print epf)^"_LB_0" in
  let l_e = "NS_E_"^(Sgn.print epf) in
  let l_e_rdi = "NS_E_RDI_"^(Sgn.print epf) in
  let l_e_tbl = "NS_E_"^(Sgn.print epf)^"_ETR_TBL" in
  let em_chr =
    l_e^":\n"^
    l_e_rdi^":\n"^
    l_e_tbl^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tmov rsi,"^(emt_reg_x86 1)^"\n"^
    "\tcall prs_chr\n"^
    "\tmov "^(emt_reg_x86 0)^",rdi\n"^
    "\tmov "^(emt_reg_x86 1)^",rsi\n"^
    "\tbt rax,63\n"^
    "\tjc "^l0^"\n"^
    "\tmov "^(emt_reg_x86 2)^",0\n"^
    "\tmov "^(emt_reg_x86 3)^",rax\n"^
    "\tbtr r12,3\n"^
    "\tbts r12,2\n"^
    "\tret\n"^
    l0^":\n"^
    "\tmov "^(emt_reg_x86 2)^",1\n"^
    (alc_blk_r 0)^
    "\tmov rsi,0x0000_0000_0000_ffff\n"^
    "\tmov QWORD [rax],rsi\n"^
    "\tmov "^(emt_reg_x86 3)^",rax\n"^
    "\tbtr r12,3\n"^
    "\tbts r12,2\n"^
    "\tret\n" in

  !ns.ns_m_t <- ("_dgt",ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
  let ns_g = ref(init_ns ()) in
  !ns_g.root <- (Some ns);
  !ns.ns_m <- ("_dgt",ns_g)::!ns.ns_m;
  !ns_g.ns_t <- ("t",ref(Ln(Axm Axm.stg)))::!ns_g.ns_t;
  let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;App(Axm Axm.opn,Axm Axm.stg)])) in
  let epf = sgn () in
  !ns_g.ns_p <- ("prs",epf)::!ns.ns_p;
  gns.ns <- (epf,ref(Ln yp))::gns.ns;
  gns.ns_e <- (epf,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|],(-1))))::gns.ns_e;
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

  !ns.ns_m_t <- ("_u_al",ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
  let ns_g = ref(init_ns ()) in
  !ns_g.root <- (Some ns);
  !ns.ns_m <- ("_u_al",ns_g)::!ns.ns_m;
  !ns_g.ns_t <- ("t",ref(Ln(Axm Axm.stg)))::!ns_g.ns_t;
  let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;App(Axm Axm.opn,Axm Axm.stg)])) in
  let epf = sgn () in
  !ns_g.ns_p <- ("prs",epf)::!ns.ns_p;
  gns.ns <- (epf,ref(Ln yp))::gns.ns;
  gns.ns_e <- (epf,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|],(-1))))::gns.ns_e;
  let l0 = lb () in
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

  !ns.ns_m_t <- ("_l_al",ref(Ast.M_Prm "grm"))::!ns.ns_m_t;
  let ns_g = ref(init_ns ()) in
  !ns_g.root <- (Some ns);
  !ns.ns_m <- ("_l_al",ns_g)::!ns.ns_m;
  !ns_g.ns_t <- ("t",ref(Ln(Axm Axm.stg)))::!ns_g.ns_t;
  let yp = Imp(Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.stg;Axm Axm.r64;App(Axm Axm.opn,Axm Axm.stg)])) in
  let epf = sgn () in
  !ns_g.ns_p <- ("prs",epf)::!ns.ns_p;
  gns.ns <- (epf,ref(Ln yp))::gns.ns;
  gns.ns_e <- (epf,ref(Ast.Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Agl(2,2,RP.A(R.Idx 3)))|],(-1))))::gns.ns_e;
  let l0 = lb () in
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
  let v = ref(Ln(Imp(Types.Rcd(rcd_cl []),Types.Axm Types.Axm.stg))) in
  !ns.ns_p <- ("_in0",Ast.Axm._in0)::!ns.ns_p;
  gns.ns <- (Ast.Axm._in0,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._in0,ref(Etr_V(RP.R[||],RP.A(R.Idx 0),(-1))))::gns.ns_e;
  let em_in0 =
    "NS_E_ID_"^(Sgn.print Ast.Axm._in0)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._in0)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._in0)^":\n"^
    "\tmov rdi,[in0]\n"^
    "\tcall rpc_s8\n"^
    "\tmov "^(emt_reg_x86 0)^",rax\n"^
    "\tbtr r12,0\n"^
    "\tret\n" in

  let v = ref(Ln(App(Axm Axm.lst,Types.Axm Types.Axm.stg))) in
  !ns.ns_p <- ("_args",Ast.Axm._args)::!ns.ns_p;
  gns.ns <- (Ast.Axm._args,v)::gns.ns;

  let v = ref(Ln(Imp(Types.Axm Types.Axm.stg,Rcd(rcd_cl [Types.Axm Types.Axm.stg;Types.Axm Types.Axm.stg])))) in
  !ns.ns_p <- ("_in_fn",Ast.Axm._in_fn)::!ns.ns_p;
  gns.ns <- (Ast.Axm._in_fn,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._in_fn,ref(Etr_V(RP.A(R.Idx 0),RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],(-1))))::gns.ns_e;
  let em_in_fn =
    "NS_E_ID_"^(Sgn.print Ast.Axm._in_fn)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._in_fn)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._in_fn)^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tpush "^(emt_reg_x86 0)^"\n"^
    "\tcall in_fn\n"^
    "\tmov "^(emt_reg_x86 1)^",rax\n"^
    "\tpop "^(emt_reg_x86 0)^"\n"^
    "\tbtr r12,1\n"^
    "\tret\n" in
  gns.ns_c <- (Ast.Axm._in_fn,em_in_fn)::gns.ns_c;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Types.Axm Types.Axm.stg;Types.Axm Types.Axm.stg]),Rcd(rcd_cl [Types.Axm Types.Axm.stg;Types.Axm Types.Axm.stg])))) in
  !ns.ns_p <- ("_emt_s8_to",Ast.Axm._emt_s8_to)::!ns.ns_p;
  gns.ns <- (Ast.Axm._emt_s8_to,v)::gns.ns;
  gns.ns_e <- 
  (Ast.Axm._emt_s8_to,ref(Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],(-1))))::gns.ns_e;
  let em_emt_s8_to =
    "NS_E_ID_"^(Sgn.print Ast.Axm._emt_s8_to)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._emt_s8_to)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._emt_s8_to)^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tmov rax,2\n"^
    "\tmov rsi,0x42\n"^
    "\tadd rdi,8\n"^
    "\tsyscall\n"^
    "\tpush rax\n"^
    "\tmov rdi,rax\n"^
    "\tmov rsi,r14\n"^
    "\tmov edx,DWORD [r14+4]\n"^
    "\tadd rsi,8\n"^
    "\tmov rax,1\n"^
    "\tsyscall\n"^
    "\tpop rdi\n"^
    "\tmov rax,3\n"^
    "\tsyscall\n"^
    "\tret\n" in
  gns.ns_c <- (Ast.Axm._emt_s8_to,em_emt_s8_to)::gns.ns_c;

  let v = ref(Ln(Imp(Types.Axm Types.Axm.stg,Types.Axm Types.Axm.stg))) in
  !ns.ns_p <- ("_cd",Ast.Axm._cd)::!ns.ns_p;
  gns.ns <- (Ast.Axm._cd,v)::gns.ns;
  gns.ns_e <- 
  (Ast.Axm._cd,ref(Etr_V(RP.A(R.Idx 0),RP.A(R.Idx 0),(-1))))::gns.ns_e;
  let em_cd =
    "NS_E_ID_"^(Sgn.print Ast.Axm._cd)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._cd)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._cd)^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tadd rdi,8\n"^
    "\tmov QWORD [rsp_tmp],rsp\n"^
    "\tand rsp,~0xf\n"^
    "\tcall system\n"^
    "\tmov rsp,QWORD [rsp_tmp]\n"^
    "\tret\n" in
  gns.ns_c <- (Ast.Axm._cd,em_cd)::gns.ns_c;

  let v = ref(Ln(Imp(Types.Axm Types.Axm.r64,Rcd(rcd_cl [Types.Axm Types.Axm.r64;Types.Axm Types.Axm.stg])))) in
  !ns.ns_p <- ("_mlc_s8",Ast.Axm._mlc_s8)::!ns.ns_p;
  gns.ns <- (Ast.Axm._mlc_s8,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._mlc_s8,ref(Etr_V(RP.A(R.Idx 0),RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],(-1))))::gns.ns_e;
  let _ = "" in
  let em =
    "NS_E_ID_"^(Sgn.print Ast.Axm._mlc_s8)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._mlc_s8)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._mlc_s8)^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tpush "^(emt_reg_x86 0)^"\n"^
    "\tcall mlc_s8\n"^
    "\tmov "^(emt_reg_x86 1)^",rax\n"^
    "\tpop "^(emt_reg_x86 0)^"\n"^
    "\tbtr r12,1\n"^
    "\tret\n" in
  gns.ns_c <- (Ast.Axm._mlc_s8,em)::gns.ns_c;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Types.Axm Types.Axm.stg;Types.Axm Types.Axm.r64]),Rcd(rcd_cl [Types.Axm Types.Axm.stg;Types.Axm Types.Axm.r64;Types.Axm Types.Axm.r64])))) in
  !ns.ns_p <- ("_lds",Ast.Axm._lds)::!ns.ns_p;
  gns.ns <- (Ast.Axm._lds,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._lds,ref(Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Idx 2)|],(-1))))::gns.ns_e;
  let _ = "" in
  let em =
    "NS_E_ID_"^(Sgn.print Ast.Axm._lds)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._lds)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._lds)^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tmov rsi,"^(emt_reg_x86 1)^"\n"^
    "\tmov eax,DWORD [rdi+4]\n"^
    "\tcmp rsi,rax\n"^
    "\tjge err_s8_ge\n"^
    "\tmovzx rax,BYTE [rdi+8+rsi]\n"^
    "\tmov "^(emt_reg_x86 2)^",rax\n"^
    "\tbts r12,2\n"^
    "\tret\n" in
  gns.ns_c <- (Ast.Axm._lds,em)::gns.ns_c;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Types.Axm Types.Axm.stg;Types.Axm Types.Axm.r64;Types.Axm Types.Axm.r64]),Rcd(rcd_cl [Types.Axm Types.Axm.stg;Types.Axm Types.Axm.r64;Types.Axm Types.Axm.r64])))) in
  !ns.ns_p <- ("_sts",Ast.Axm._sts)::!ns.ns_p;
  gns.ns <- (Ast.Axm._sts,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._sts,ref(Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Idx 2)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Idx 2)|],(-1))))::gns.ns_e;
  let _ = "" in
  let em =
    "NS_E_ID_"^(Sgn.print Ast.Axm._sts)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._sts)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._sts)^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tmov rsi,"^(emt_reg_x86 1)^"\n"^
    "\tmov eax,DWORD [rdi+4]\n"^
    "\tcmp rsi,rax\n"^
    "\tjge err_s8_ge\n"^
    "\tmov rax,"^(emt_reg_x86 2)^"\n"^
    "\tmov BYTE [rdi+8+rsi],al\n"^
    "\tret\n" in
  gns.ns_c <- (Ast.Axm._sts,em)::gns.ns_c;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Types.Axm Types.Axm.stg;Types.Axm Types.Axm.r64;Types.Axm Types.Axm.r64]),Rcd(rcd_cl [Types.Axm Types.Axm.stg;Types.Axm Types.Axm.r64;Types.Axm Types.Axm.r64])))) in
  !ns.ns_p <- ("_ecs",Ast.Axm._sts)::!ns.ns_p;
  gns.ns <- (Ast.Axm._ecs,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._ecs,ref(Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Idx 2)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Idx 2)|],(-1))))::gns.ns_e;
  let _ = "" in
  let em =
    "NS_E_ID_"^(Sgn.print Ast.Axm._ecs)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._ecs)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._ecs)^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tmov rsi,"^(emt_reg_x86 1)^"\n"^
    "\tmov eax,DWORD [rdi+4]\n"^
    "\tcmp rsi,rax\n"^
    "\tjge err_s8_ge\n"^
    "\tmov rax,"^(emt_reg_x86 2)^"\n"^
    "\txchg al,BYTE [rdi+8+rsi]\n"^
    "\tand rax,0xff\n"^
    "\tret\n" in
  gns.ns_c <- (Ast.Axm._ecs,em)::gns.ns_c;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Types.Axm Types.Axm.r64; Types.Axm Types.Axm.stg;Types.Axm Types.Axm.r64; Types.Axm Types.Axm.stg;Types.Axm Types.Axm.r64]),Rcd(rcd_cl [Types.Axm Types.Axm.r64; Types.Axm Types.Axm.stg;Types.Axm Types.Axm.r64; Types.Axm Types.Axm.stg;Types.Axm Types.Axm.r64])))) in
  !ns.ns_p <- ("_rep_movsb",Ast.Axm._rep_movsb)::!ns.ns_p;
  gns.ns <- (Ast.Axm._rep_movsb,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._rep_movsb,ref(Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Idx 2);RP.A(R.Idx 3);RP.A(R.Idx 4)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Idx 2);RP.A(R.Idx 3);RP.A(R.Idx 4)|],(-1))))::gns.ns_e;
  let _ = "" in
  let em =
    (* r13=count r14=src r8=src-ofs r9=dst r10=dst-ofs *)
    "NS_E_ID_"^(Sgn.print Ast.Axm._rep_movsb)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._rep_movsb)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._rep_movsb)^":\n"^
    "\tmov eax,[r14+4]\n"^
    "\tlea r8,[r8-1+r13]\n"^
    (*"\tadd r8,r13\n"^*)
    "\tcmp r8,rax\n"^
    "\tjge err_s8_ge\n"^
    "\tmov eax,[r9+4]\n"^
    "\tlea r10,[r10-1+r13]\n"^
    "\tcmp r10,rax\n"^
    "\tjge err_s8_ge\n"^
    "\tlea rsi,[r14+8+r8]\n"^
    "\tlea rdi,[r9+8+r10]\n"^
    "\tmov rcx,r13\n"^
    "\tstd\n"^
    "\trep movsb\n"^
    "\tcld\n"^
    "\tadd r8,1\n"^
    "\tadd r10,1\n"^
    "\tret\n" in
  gns.ns_c <- (Ast.Axm._rep_movsb,em)::gns.ns_c;

  let v = ref(Ln(Imp(Types.Axm Types.Axm.stg,Rcd(rcd_cl [Types.Axm Types.Axm.stg;Types.Axm Types.Axm.r64])))) in
  !ns.ns_p <- ("_s8_len",Ast.Axm._s8_len)::!ns.ns_p;
  gns.ns <- (Ast.Axm._s8_len,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._s8_len,ref(Etr_V(RP.A(R.Idx 0),RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],(-1))))::gns.ns_e;
  let em_s8_len =
    "NS_E_ID_"^(Sgn.print Ast.Axm._s8_len)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._s8_len)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._s8_len)^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tmov edi,DWORD [rdi+4]\n"^
    "\tmov "^(emt_reg_x86 1)^",rdi\n"^
    "\tbts r12,1\n"^
    "\tret\n" in
  gns.ns_c <- (Ast.Axm._s8_len,em_s8_len)::gns.ns_c;

  let v_q = newvar_q (-1) in
  let v = ref(Ln(Imp(Var v_q,Var v_q))) in
  !ns.ns_p <- ("_emt_q",Ast.Axm._emt_q)::!ns.ns_p;
  !ns.ns_p <- ("_emt",Ast.Axm._emt_q)::!ns.ns_p;
  gns.ns <- (Ast.Axm._emt_q,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._emt_q,ref(Etr_V(RP.A(R.Idx 0),RP.A(R.Idx 0),(-1))))::gns.ns_e;
  let em_emt_q =
    "NS_E_ID_"^(Sgn.print Ast.Axm._emt_q)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._emt_q)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._emt_q)^":\n"^
    "\tmov rdi,fmt_emt\n"^
    "\txor rax,rax\n"^
    "\tmov QWORD [rsp_tmp],rsp\n"^
    "\tand rsp,~0xf\n"^
    "\tcall printf\n"^
    "\tmov rsp,QWORD [rsp_tmp]\n"^
    "\tmov rdi,r13\n"^
    "\tbt r12,0\n"^
    "\tcall pp0\n"^
    "\tmov rdi,fmt_nl\n"^
    "\txor rax,rax\n"^
    "\tmov QWORD [rsp_tmp],rsp\n"^
    "\tand rsp,~0xf\n"^
    "\tcall printf\n"^
    "\tmov rsp,QWORD [rsp_tmp]\n"^
    "\tret\n" in
  let v_q = newvar_q (-1) in
  let v = ref(Ln(Imp(Var v_q,Rcd(rcd_cl [Var v_q;Axm Axm.stg])))) in
  !ns.ns_p <- ("_pp_v",Ast.Axm._pp_v)::!ns.ns_p;
  gns.ns_e <- (Ast.Axm._pp_v,ref(Etr_V(RP.A(R.Idx 0),RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],(-1))))::gns.ns_e;
  gns.ns <- (Ast.Axm._pp_v,v)::gns.ns;
  let em_pp_v =
    "NS_E_"^(Sgn.print Ast.Axm._pp_v)^":\n"^
    "\tmov rdi,r13\n"^
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

  !ns.ns_t <- ("_sum",ref(Ln(Axm Axm.sum)))::!ns.ns_t;
  let q0 = newvar_q (-1) in
  let q1 = newvar_q (-1) in
  let v = ref(Ln(Imp(Var q0,App(App(Axm Axm.sum,Var q0),Var q1)))) in
  !ns.ns_p <- ("_in_l",Ast.Axm._in_l)::!ns.ns_p;
  gns.ns_e <- (Ast.Axm._in_l,ref(Ctr(0,2)))::gns.ns_e;
  gns.ns <- (Ast.Axm._in_l,v)::gns.ns;
  let v = ref(Ln(Imp(Var q1,App(App(Axm Axm.sum,Var q0),Var q1)))) in
  !ns.ns_p <- ("_in_r",Ast.Axm._in_r)::!ns.ns_p;
  gns.ns_e <- (Ast.Axm._in_r,ref(Ctr(1,2)))::gns.ns_e;
  gns.ns <- (Ast.Axm._in_r,v)::gns.ns;

  !ns.ns_t <- ("_arr",ref(Ln(Axm Axm.arr)))::!ns.ns_t;
  !ns.ns_p <- ("_mk_arr",Ast.Axm._mk_arr)::!ns.ns_p;
  let q0 = newvar_q (-1) in
  gns.ns <- (Ast.Axm._mk_arr,ref(Ln(Imp(Axm Axm.r64,Rcd(rcd_cl [Axm Axm.r64;App(Axm Axm.arr,Var q0)])))))::gns.ns;
  gns.ns_e <- (Ast.Axm._mk_arr,ref(Etr_V(RP.A(R.Idx 0),RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],(-1))))::gns.ns_e;
  let em_mk_arr =
    "NS_E_ID_"^(Sgn.print Ast.Axm._mk_arr)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._mk_arr)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._mk_arr)^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tpush "^(emt_reg_x86 0)^"\n"^
    "\tcall mk_arr\n"^
    "\tmov "^(emt_reg_x86 1)^",rax\n"^
    "\tpop "^(emt_reg_x86 0)^"\n"^
    "\tbtr r12,1\n"^
    "\tret\n" in
  gns.ns_c <- (Ast.Axm._mk_arr,em_mk_arr)::gns.ns_c;

  !ns.ns_p <- ("_set_q",Ast.Axm._set_q)::!ns.ns_p;
  let q0 = newvar_q (-1) in
  gns.ns <- (Ast.Axm._set_q,ref(Ln(Imp(Rcd(rcd_cl [App(Axm Axm.arr,Var q0);Axm Axm.r64;Var q0]),Rcd(rcd_cl [App(Axm Axm.arr,Var q0);Axm Axm.r64])))))::gns.ns;
  gns.ns_e <- (Ast.Axm._set_q,ref(Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Idx 2)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],(-1))))::gns.ns_e;
  let em_set_q =
    let lb0 = lb () in
    let lb_err = lb () in 
    let lb_err0 = lb () in 
    "NS_E_ID_"^(Sgn.print Ast.Axm._set_q)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._set_q)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._set_q)^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tmov rax,"^(emt_reg_x86 1)^"\n"^
    "\tmov esi,DWORD [rdi+4]\n"^
    "\tcmp rax,rsi\n"^
    "\tjge "^lb_err^"\n"^
    (*"\tmov rsi,QWORD [rdi+8+8*rax]\n"^
      "\tnot rsi\n"^
      "\txor rsi,rsp\n"^
      "\tmov rsi,[rsi]\n"^ *)
    "\tbt QWORD [rdi+8+8*rax],63\n"^
    "\tjnc "^lb_err0^"\n"^
    "\tbt r12,"^(string_of_int 2)^"\n"^
    "\tjc "^lb0^"\n"^
    "\tmov rsi,"^(emt_reg_x86 2)^"\n"^
    "\tmov QWORD [rdi+8+8*rax],rsi\n"^
    "\tret\n"^
    lb0^":\n"^
    (alc_blk_r 1)^
    "\tmov QWORD [r13+8+8*r14],rax\n"^
    "\tmov QWORD [rax+8],r8\n"^
    "\tmov rdi,0x0000_0001_"^(Printf.sprintf "%02x" 1)^"02_ffff\n"^
    "\tmov QWORD [rax],rdi\n"^
    "\tret\n"^
    lb_err^":\n"^
    "\tmov rdi,rax\n"^
    "\tbt r12,1\n"^
    "\tcall pp0\n"^
    "\tmov QWORD [err_n],3\n"^
    "\tjmp err\n"^
    lb_err0^":\n"^
    "\tmov QWORD [err_n],7\n"^
    "\tjmp err\n" in
  gns.ns_c <- (Ast.Axm._set_q,em_set_q)::gns.ns_c;

  !ns.ns_p <- ("_lod_q",Ast.Axm._lod_q)::!ns.ns_p;
  let q0 = newvar_q (-1) in
  gns.ns <- (Ast.Axm._lod_q,ref(Ln(Imp(Rcd(rcd_cl [App(Axm Axm.arr,Var q0);Axm Axm.r64]),Rcd(rcd_cl [App(Axm Axm.arr,Var q0);Axm Axm.r64;Var q0])))))::gns.ns;
  gns.ns_e <- (Ast.Axm._lod_q,ref(Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Idx 2)|],(-1))))::gns.ns_e;
  let em_lod_q =
    let lb0 = lb () in
    let lb1 = lb () in
    let lba = lb () in 
    let lb_err = lb () in
    let lb_err0 = lb () in 
    "NS_E_ID_"^(Sgn.print Ast.Axm._lod_q)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._lod_q)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._lod_q)^":\n"^
    "\tpush "^(emt_reg_x86 0)^"\n"^
    "\tpush "^(emt_reg_x86 1)^"\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tmov rax,"^(emt_reg_x86 1)^"\n"^
    "\tmov esi,DWORD [rdi+4]\n"^
    "\tcmp rax,rsi\n"^
    "\tjge "^lb_err^"\n"^
    "\tmov rdi,QWORD [rdi+8+8*rax]\n"^
    "\tbt rdi,0\n"^
    "\tjc "^lba^"\n"^
    "\tmov rax,[rdi]\n"^
    "\tbt QWORD rax,17\n"^
    "\tjnc "^lb0^"\n"^
    "\tbt QWORD rax,0\n"^
    (cf_set 2)^
    "\tmov rdi,QWORD [rdi+8]\n"^
    "\tcall dcp\n"^
    "\tjmp "^lb1^"\n"^
    lba^":\n"^
    "\tcmp rdi,NULL\n"^
    "\tjz "^lb_err0^"\n"^
    lb0^":\n"^
    "\tbtr r12,"^(string_of_int 2)^"\n"^
    "\tclc\n"^
    "\tcall dcp\n"^
    lb1^":\n"^
    "\tmov "^(emt_reg_x86 2)^",rax\n"^
    "\tpop "^(emt_reg_x86 1)^"\n"^
    "\tpop "^(emt_reg_x86 0)^"\n"^
    "\tret\n"^
    lb_err^":\n"^
    "\tmov rdi,rax\n"^
    "\tbt r12,1\n"^
    "\tcall pp0\n"^
    "\tmov QWORD [err_n],4\n"^
    "\tjmp err\n"^
     lb_err0^":\n"^
     "\tmov QWORD [err_n],8\n"^
    "\tjmp err\n" in
  gns.ns_c <- (Ast.Axm._lod_q,em_lod_q)::gns.ns_c;

  !ns.ns_p <- ("_get_q",Ast.Axm._get_q)::!ns.ns_p;
  let q0 = newvar_q (-1) in
  gns.ns <- (Ast.Axm._get_q,ref(Ln(Imp(Rcd(rcd_cl [App(Axm Axm.arr,Var q0);Axm Axm.r64]),Rcd(rcd_cl [App(Axm Axm.arr,Var q0);Axm Axm.r64;Var q0])))))::gns.ns;
  gns.ns_e <- (Ast.Axm._get_q,ref(Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Idx 2)|],(-1))))::gns.ns_e;
  let em_get_q =
    let lb0 = lb () in
    let lb1 = lb () in
    let lba = lb () in 
    let lb_err0 = lb () in 
    let lb_err1 = lb () in 
    "NS_E_ID_"^(Sgn.print Ast.Axm._get_q)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._get_q)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._get_q)^":\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tmov rax,"^(emt_reg_x86 1)^"\n"^
    "\tmov esi,DWORD [rdi+4]\n"^
    "\tcmp rax,rsi\n"^
    "\tjge "^lb_err0^"\n"^
    "\tmov rsi,QWORD [rdi+8+8*rax]\n"^
    "\tmov QWORD [rdi+8+8*rax],NULL\n"^
    "\tmov rdi,rsi\n"^
    "\tbt rdi,0\n"^
    "\tjc "^lba^"\n"^
    "\tmov rax,[rdi]\n"^
    "\tbt rax,17\n"^
    "\tjnc "^lb0^"\n"^
    "\tbt QWORD rax,0\n"^
    (cf_set 2)^
    "\tmov rsi,QWORD [rdi+8]\n"^
    "\tpush rsi\n"^
    free_blk_r^
    "\tpop rdi\n"^
    "\tjmp "^lb1^"\n"^
    lba^":\n"^
    "\tcmp rdi,NULL\n"^
    "\tjz "^lb_err1^"\n"^
    lb0^":\n"^
    "\tbtr r12,"^(string_of_int 2)^"\n"^
    lb1^":\n"^
    "\tmov "^(emt_reg_x86 2)^",rdi\n"^
    "\tret\n"^
    lb_err0^":\n"^
    "\tmov QWORD [err_n],5\n"^
    "\tjmp err\n"^
    lb_err1^":\n"^
    "\tmov QWORD [err_n],8\n"^
    "\tjmp err\n" in
  gns.ns_c <- (Ast.Axm._get_q,em_get_q)::gns.ns_c;

  !ns.ns_p <- ("_eq",Ast.Axm._eq)::!ns.ns_p;
  let q0 = newvar_q (-1) in
  gns.ns <- (Ast.Axm._eq,ref(Ln(Imp(Rcd(rcd_cl [App(Axm Axm.arr,Var q0);Axm Axm.r64]),Rcd(rcd_cl [App(Axm Axm.arr,Var q0);Axm Axm.r64;Var q0])))))::gns.ns;
  gns.ns_e <- (Ast.Axm._eq,ref(Etr_V(RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1)|],RP.R[|RP.A(R.Idx 0);RP.A(R.Idx 1);RP.A(R.Idx 2)|],(-1))))::gns.ns_e;
  let em_eq =
    let lb0 = lb () in
    let lb1 = lb () in
    "NS_E_ID_"^(Sgn.print Ast.Axm._eq)^": dq 0\n"^
    "NS_E_"^(Sgn.print Ast.Axm._eq)^":\n"^
    "NS_E_RDI_"^(Sgn.print Ast.Axm._eq)^":\n"^
    "\tpush "^(emt_reg_x86 0)^"\n"^
    "\tpush "^(emt_reg_x86 1)^"\n"^
    "\tmov rdi,"^(emt_reg_x86 0)^"\n"^
    "\tmov rax,"^(emt_reg_x86 1)^"\n"^
    "\tmov esi,DWORD [rdi+4]\n"^
    "\tcmp rax,rsi\n"^
    "\tjge err\n"^
    "\tmov rdi,QWORD [rdi+8+8*rax]\n"^
    "\tbt rdi,0\n"^
    "\tjc "^lb0^"\n"^
    "\tbt QWORD [rdi],17\n"^
    "\tjnc "^lb0^"\n"^
    "\tbt QWORD [rdi],0\n"^
    (cf_set 2)^
    "\tmov rdi,QWORD [rdi+8]\n"^
    "\tcall dcp\n"^
    "\tjmp "^lb1^"\n"^
    lb0^":\n"^
    "\tbtr r12,"^(string_of_int 2)^"\n"^
    "\tclc\n"^
    "\tcall dcp\n"^
    lb1^":\n"^
    "\tmov "^(emt_reg_x86 2)^",rax\n"^
    "\tpop "^(emt_reg_x86 1)^"\n"^
    "\tpop "^(emt_reg_x86 0)^"\n"^
    "\tret\n" in
  gns.ns_c <- (Ast.Axm._eq,em_eq)::gns.ns_c;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64;Axm Axm.r64])))) in
  !ns.ns_p <- ("_setge",Ast.Axm._setge)::!ns.ns_p;
  gns.ns <- (Ast.Axm._setge,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._setge,ref(E_K_WC))::gns.ns_e;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64])))) in
  !ns.ns_p <- ("_add",Ast.Axm._add)::!ns.ns_p;
  gns.ns <- (Ast.Axm._add,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._add,ref(E_K_WC))::gns.ns_e;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64])))) in
  !ns.ns_p <- ("_shr",Ast.Axm._shr)::!ns.ns_p;
  gns.ns <- (Ast.Axm._shr,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._shr,ref(E_K_WC))::gns.ns_e;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64])))) in
  !ns.ns_p <- ("_shl",Ast.Axm._shl)::!ns.ns_p;
  gns.ns <- (Ast.Axm._shl,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._shl,ref(E_K_WC))::gns.ns_e;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64])))) in
  !ns.ns_p <- ("_or",Ast.Axm._or)::!ns.ns_p;
  gns.ns <- (Ast.Axm._or,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._or,ref(E_K_WC))::gns.ns_e;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64])))) in
  !ns.ns_p <- ("_and",Ast.Axm._and)::!ns.ns_p;
  gns.ns <- (Ast.Axm._and,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._and,ref(E_K_WC))::gns.ns_e;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64])))) in
  !ns.ns_p <- ("_sub",Ast.Axm._sub)::!ns.ns_p;
  gns.ns <- (Ast.Axm._sub,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._sub,ref(E_K_WC))::gns.ns_e;

  let v = ref(Ln(Imp(Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64]),Rcd(rcd_cl [Axm Axm.r64;Axm Axm.r64])))) in
  !ns.ns_p <- ("_imul",Ast.Axm._imul)::!ns.ns_p;
  gns.ns <- (Ast.Axm._imul,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._imul,ref(E_K_WC))::gns.ns_e;

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

  let q = newvar_q (-1) in
  let v = ref(Ln(Imp(Var q,Rcd(rcd_cl [Var q;Var q])))) in
  !ns.ns_p <- ("_rpc",Ast.Axm._rpc)::!ns.ns_p;
  gns.ns <- (Ast.Axm._rpc,v)::gns.ns;
  gns.ns_e <- (Ast.Axm._rpc,ref(E_K_WC))::gns.ns_e;

  ("",em_in0^em_emt_q^emt_byt^em_chr^em_dgt^em_l_al^em_u_al^em_pp_v,ns,gns)


and args_init =
  "pop r14 ; number of args
  pop rdi ; program name
  call mk_s8\n"^
  "\tmov r8,rax\n"^
  (alc_blk_r 2)^
  " mov r13,rax
    or rax,1
    mov [args],rax
    mov rcx,0x0000_0002_0200_fffc
    mov [r13],rcx
    mov [r13+8],r8
  args_lp:
    cmp r14,1
    jz args_end
    pop rdi
  call mk_s8
    mov r10,rax
    "^
  (alc_blk_r 2)^
  " mov r8,rax
    mov r9,r8
    or r9,1
    mov [r13+16],r9
    mov r13,r8
    mov rcx,0x0000_0002_0200_fffc
    mov [r13],rcx
    mov [r13+8],r10
    sub r14,1
    jmp args_lp
  args_end:
  "^
  (alc_blk_r 0)^
  " mov rcx,0x0000_0000_0000_ffff
    mov [rax],rcx
    mov rcx,0x0100_0000_0000_0001
    or rax,rcx
    mov [r13+16],rax
"
and mov_lb b i j = 
  if b then "MOV_"^(string_of_int i)^"_"^(string_of_int j) 
  else "NULL" 
and emt_mov_etr i j pi pj = 
  let s0 = RSet.ini () in 
  let _ = rset_ptn s0 pi in 
  "MOV_"^(string_of_int i)^"_"^(string_of_int j)^":\n"^
  (emt_mov_ptn_to_ptn R.M_Dlt s0 pi pj)^
  "\tjmp QWORD [rsp]\n"
and emt_mov_tbl v n = 
  let vl = Array.length v in 
  let vv = Array.make (n*n) None in 
  let ov = Array.make n 0 in 
  Util.pnt true @@ "EM "^(string_of_int n)^"\n";
  let f o i = 
    let (pi,vi,vti) = v.(i) in 
    let t = ref true in 
    let j = ref 0 in
    let o0 = o in 
    let o = ref o0 in 
    let oM = ref o0 in 
    let em = ref "" in
    while !t&&(!j<vl) do  
      let o0 = !o in
      let j0 = !j in 
      let (pj,vj,_) = v.(j0) in
      let b = 
        ( match vti with 
          | Etr_Dst -> 
            ( try 
                let _ = unify [] (inst 0 (Var vi)) (inst 0 (Var vj)) in
                true 
              with _ -> false ) 
          | _ -> false ) in
      ( match b with 
        | true -> 
          ov.(i)<-(o0-j0);
          vv.(o0)<-(Some(i,j0));
          em := 
            !em ^
            ( let s0 = RSet.ini () in 
              let _ = rset_ptn s0 pi in 
              "MOV_"^(string_of_int i)^"_"^(string_of_int j0)^":\n"^
              (emt_mov_ptn_to_ptn R.M_Dlt s0 pi pj)^
              "\tjmp QWORD [rsp]\n" );
          t := false; 
          j := j0+1; o := o0+1; oM := o0+1;
          () 
        | false -> 
          j := j0+1 ) 
    done;
    while !j<vl do 
      let o0 = !o in 
      let j0 = !j in 
      let (pj,vj,_) = v.(j0) in
      let b = 
        ( match vti with 
          | Etr_Dst -> 
            ( try 
                let _ = unify [] (inst 0 (Var vi)) (inst 0 (Var vj)) in
                true 
              with _ -> false ) 
          | _ -> false ) in
      ( match b with 
        | true -> 
          vv.(o0)<-(Some(i,j0));
          em := 
            !em^
            ( let s0 = RSet.ini () in 
              let _ = rset_ptn s0 pi in 
              "MOV_"^(string_of_int i)^"_"^(string_of_int j0)^":\n"^
              (emt_mov_ptn_to_ptn R.M_Dlt s0 pi pj)^
              "\tjmp QWORD [rsp]\n" );
          j := j0+1; o := o0+1; oM := o0+1; 
          () 
        | false -> 
          ov.(i)<-o0-j0;
          vv.(o0)<-None;
          j := j0+1; o := o0+1; 
          () ) 
    done; 
    (!oM,!em) in
  let rec g o i em0 = 
    (*Util.pnt true @@ "g:"^(string_of_int i)^"\n";*)
    if i=n then (o,em0) 
    else 
      let (oM,em1) = f o i in 
      g oM (i+1) (em0^em1) in 
  let (o,em) = g 0 0 "" in 
  let vv = Array.sub vv 0 o in 
  let (e0,_) = 
    Array.fold_left 
      (fun (e0,k) a -> 
         if o<=k then (e0,k+1) 
         else 
           match a with 
           | Some(i,j) -> (e0^"\tdq "^(mov_lb true i j)^"\n",k+1) 
           | None -> (e0^"\tdq NULL\n",k+1))
      ("",0) vv in
  let (ed,_) = 
    Array.fold_left 
      ( fun (ed,i) o -> 
          (ed^"%define MOV_OFS_"^(string_of_int i)^" "^(string_of_int o)^"\n",i+1))
      ("",0) ov in 
  (ed,em,"MOV_TBL:\n"^e0)
and emt_exe m =
  let (se_p,em_p,ns,gns) = (init_prm ()) in
  let (se,em,sx,pp) = (emt_m gns ns 0 m) in
  let (ed_t,em_t,et_t) = emt_mov_tbl (Array.sub gns.ns_vct 0 gns.ns_vct_n) gns.ns_vct_n in 
  Util.pnt true pp;  
  let _ = Util.load_file "cmu.s" in 
  let ex = 
    ed_t^
    (*cmu_s^*) 
    "%include \"cmu.s\"\n"^
    "main:\n"^
    "\tmov r12,~0\n"^
    "\tcall SFLS_X_INIT\n"^
    args_init^
    sx^
    "\tcall exec_out\n"^
    "\tjmp _end\n"^
    em_p^
    (List.fold_right (fun (_,e) s -> e^s) gns.ns_c "")^
    em^
    em_t^
    "section .data\n"^
    et_t^
    se_p^
    se^
    (emt_cst_stg !cst_stg) in
  (ex,pp)

and emt_bytes s =
  (*Util.Log.add "enter emt_bytes\n";*)
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
  (*Util.Log.add "enter emt_cst_stg\n";*)
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
and mov_r m s0 i1 i0 =
  (*Util.Log.add @@ "enter mov_r:"^(RSet.pnt s0)^","^(string_of_int i1)^","^(string_of_int i0)^"\n";*)
  if i1<0&&s0.(i0)&&(not s0.(i1))&&m=R.M_Dlt then
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
    ( s0.(i0)<-(if m=R.M_Dlt then false else true); s0.(i1)<-true;
      if i1<8 then
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
  else err @@ "mov r 0:"^(RSet.pnt s0)^","^(string_of_int i0)^","^(string_of_int i1)
and push_iv iv =
  let s0 = rset_iv iv in
  let (_,n,e0,e1) =
    Array.fold_left
      (fun (i,n,e0,e1) b ->
         if b then
           if i<8 then
             let e0 =
               e0^
               "\tmov QWORD [rsp+8+8*"^(string_of_int n)^"],"^(emt_reg_x86 i)^"\n" in
             let e1 =
               "\tmov "^(emt_reg_x86 i)^",QWORD [rsp+8+8*"^(string_of_int n)^"]\n"^
               "\tbt QWORD rax,"^(string_of_int i)^"\n"^
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
               "\tbt rax,"^(string_of_int i)^"\n"^
               (cf_set i)^
               e1 in
             (i+1,n+1,e0,e1)
         else (i+1,n,e0,e1) )
      (0,0,"","") s0 in
  let n_s = 8*(n+1) in
  (*if (n_s mod 16)=0 then*)
  let e_0 =
    "; push_iv \n"^
    "\tsub rsp,"^(string_of_int n_s)^"\n"^
    e0^
    "\tmov QWORD [rsp],r12\n" in
  let e_1 =
    "; pop_iv\n"^
    (*"\tmov r12,QWORD [rsp]\n"^ *)
    "\tmov rax,QWORD [rsp]\n"^
    e1^
    "\tadd rsp,"^(string_of_int n_s)^"\n" in
  (e_0,e_1)
and dlt_iv iv =
  let s0 = rset_iv iv in
  let e0 =
    Hashtbl.fold
      (fun _ r e ->
         let ei = dlt_ptn R.M_Dlt s0 r in
         e^ei )
      iv "" in
  e0
and add_gbg () =
  "\tmov QWORD [gbg_vct+8*r15],rdi\n"^
  "\tadd r15,1\n"
and dlt_gbg () =
  let lb0 = (lb ()) in
  let lb1 = lb () in
  lb0^":\n"^
  "\tcmp r15,0\n"^
  "\tjz "^lb1^"\n"^
  "\tmov rdi,QWORD [gbg_vct-8+8*r15]\n"^
  "\tcall dlt_gbg\n"^
  "\tsub r15,1\n"^
  "\tjmp "^lb0^"\n"^
  lb1^":\n"
and dlt_ptn m s0 i0 =
  ( match i0 with
    | RP.A(R.Idx i0) ->
      if s0.(i0) then
        let l0 = lb () in
        ( s0.(i0)<-false;
          "\tbt r12,"^(string_of_int i0)^"\n"^
          "\tjc "^l0^"\n"^
          "\tmov rdi,"^(emt_reg_x86 i0)^"\n"^
          (if m=R.M_Dlt then "\tcall dlt\n" else (add_gbg ()))^
          l0^":\n" )
      else err "dlt_ptn 0"
    | RP.A(R.Agl(ia,_,pa)) ->
      ( s0.(ia)<-false;
        (dlt_ptn m s0 pa) )
    | RP.A(R.AglStt(_,_,pa)) ->
      dlt_ptn m s0 pa
    | RP.A(R.AglUnn(ia,rs)) ->
      let lb0 = lb () in
      let lb1 = lb () in
      let e0 =
        "\tmov rdi,"^(emt_reg_x86 ia)^"\n"^
        "\tjmp ["^lb0^"+rdi]\n"^
        lb0^":\n" in
      let (_,e1) =
        Array.fold_left (fun (i,s) _ -> (i+1,s^"\tdq "^lb0^"_"^(string_of_int i)^"\n")) (0,"") rs in
      let (_,e2) =
        Array.fold_left (fun (i,s) ri -> (i+1,s^lb0^"_"^(string_of_int i)^":\n"^(dlt_ptn m s0 ri)^"\tjmp "^lb1^"\n")) (0,"") rs in
      e0^e1^e2^
      lb1^":\n"
    | RP.A(R.Etr(ie,pe)) ->
      ( s0.(ie)<-false;
        (dlt_ptn m s0 pe))
    | RP.R rs ->
      Array.fold_left
        (fun e ri ->
           e^
           (dlt_ptn m s0 ri))
        "" rs )
and emt_mov_ptn_to_ptn (m:R.mov_t) (s0:RSet.t) (i0:R.t) (i1:R.t) =
  let c_l = "; _emt_mov_ptn_to_ptn:"^(RSet.pnt s0)^","^(R.print i0)^" ⊢ "^(R.print i1)^"\n" in
  (*Util.Log.add c_l;*)
  let _ =
    if m=R.M_Gbg then
      let s_t = RSet.ini () in
      let _ = rset_ptn s_t i1 in
      if not(RSet.is_zero (RSet.and_v s0 s_t)) then err "_emt_mov_ptn_to_ptn gbg 0"
      else () in
  let rec lp i0 i1 =
    ( match i0,i1 with
      | RP.A(R.Idx i_0),RP.A(R.Idx i1) ->
        if i_0=i1 then ([],[],[]) else ([],[(i0,i1)],[])
      | _,RP.A(R.Idx i1) -> ([],[(i0,i1)],[])
      | RP.A(R.Idx i0),_ -> ([(i0,i1)],[],[])
      | RP.R rs0,RP.R rs1 ->
        let (_,l0,l1,l2) =
          Array.fold_left
            ( fun (i,l0,l1,l2) ri0 ->
                let (l0_0,l1_0,l2_0) = lp ri0 rs1.(i) in
                (i+1,List.rev_append l0_0 l0,List.rev_append l1_0 l1,List.rev_append l2_0 l2) )
            (0,[],[],[]) rs0 in
        (l0,l1,l2)
      | RP.A(R.Agl(ia0,i_n0,ra0)),RP.A(R.Agl(ia1,i_n1,ra1)) ->
        if i_n0=i_n1 then
          let (l0,l1,l2) = lp ra0 ra1 in
          (l0,(RP.A(R.Idx ia0),ia1)::l1,l2)
        else err "emt_mov_ptn_to_ptn lp 1"
      | RP.A(R.AglStt(ii0,i_n0,ra0)),RP.A(R.Agl(ia1,i_n1,ra1)) ->
        if i_n0=i_n1 then
          let (l0,l1,l2) = lp ra0 ra1 in
          (l0,l1,(ii0,ia1)::l2)
        else err "emt_mov_ptn_to_ptn lp 2"
      | _ -> err "emt_mov_ptn_to_ptn lp 0" ) in
  let (l1,l0,l2) = lp i0 i1 in
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
    (*Util.pnt true "lp_f0\n";*)
    ( match l0 with
      | (RP.A(R.Idx i0),i1)::tl when i0=i1 ->
        let e1 =
          mov_r m s0 i1 i0 in
        (lt,tl,e0^e1)
      | (p0,i1)::[] when m=R.M_Dlt ->
        if s0.(i1)=true then
          let s3 = RSet.or_v s0 s1 in
          let i2 = RSet.min_0 s3 in
          let em = mov_r m s0 i2 i1 in
          let lt = (i1,i2)::lt in
          let e1 =
            em^
            (mov_rl_ptn m s0 i1 (subst_ptn lt p0)) in
          (lt,[],e0^e1)
        else
          let e1 =
            (mov_rl_ptn m s0 i1 (subst_ptn lt p0)) in
          (lt,[],e0^e1)
      | (p0,i1)::tl when m=R.M_Dlt ->
        if s0.(i1)=true then
          let (lt,l0,e1) = lp_f0 lt tl e0 in
          (lt,(p0,i1)::l0,e1)
        else
          let e1 =
            (mov_rl_ptn m s0 i1 (subst_ptn lt p0)) in
          (lt,tl,e0^e1)
      | _ -> err "emt_mov_ptn_to_ptn 1" ) in
  let rec lp_1 lt l1 e0 =
    ( match l1 with
      | [] -> (lt,e0)
      | _ ->
        let (lt,l1,e0) = lp_f1 lt l1 e0 in
        lp_1 lt l1 e0 )
  and lp_f1 lt l1 e0 =
    (*Util.pnt true "lp_f1\n";*)
    ( match l1 with
      | (i0,p1)::[] ->
        let s_p1 = RSet.ini () in
        let _ = rset_ptn s_p1 p1 in
        let s_a0 = RSet.and_v s0 s_p1 in
        if RSet.is_zero s_a0 then
          let e1 =
            (mov_unrl_ptn m s0 p1 (subst lt i0)) in
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
                  (mov_r m s0 ix i))
              "" lx in
          let lt = List.rev_append lx lt in
          let e1 =
            em^
            (mov_unrl_ptn m s0 p1 (subst lt i0)) in
          (lt,[],e0^e1)
      | (i0,p1)::tl ->
        let s_p1 = RSet.ini () in
        let _ = rset_ptn s_p1 p1 in
        let s_a0 = RSet.and_v s0 s_p1 in
        ( match RSet.is_zero s_a0 with
          | false ->
            let (lt,l0,e1) = lp_f1 lt tl e0 in
            (lt,(i0,p1)::l0,e1)
          | true ->
            let e1 =
              (mov_unrl_ptn m s0 p1 (subst lt i0)) in
            (lt,tl,e0^e1) )
      | _ -> err "emt_mov_ptn_to_ptn 1" ) in
  let rec lp_f2 l1 =
    ( match l1 with
      | (ii,i0)::tl ->
        if not(s0.(i0)) then
          let e0 = "\tmov "^(emt_reg_x86 i0)^","^(string_of_int ii)^"\n"^
                   "\tbts r12,"^(string_of_int i0)^"\n" in
          let e1 = lp_f2 tl in
          e0^e1
        else err "lp_f2 0"
      | [] -> "" ) in
  let (lt,e_rl) = lp_0 [] l0 "" in
  let (_,e_unrl) = lp_1 lt l1 "" in
  let e2 = lp_f2 l2 in
  c_l^e_rl^e_unrl^e2
and subst (lt:R.subst) (i0:int) =
  ( try List.assoc i0 lt with _ -> i0 )
and subst_ptn lt (p0:R.r_atm RP.t) = RP.map (subst_ptn_atm lt) p0
and subst_ptn_atm lt (a0:R.r_atm) =
  ( match a0 with
    | R.Idx i0 -> R.Idx (subst lt i0)
    | R.Agl(ia,i_n,pa) -> R.Agl(subst lt ia,i_n,subst_ptn lt pa)
    | R.AglStt(ia,i_n,pa) -> R.AglStt(ia,i_n,subst_ptn lt pa)
    | R.AglUnn(ia,rs) -> R.AglUnn(ia,Array.map (subst_ptn lt) rs)
    | R.Etr(ie,pe) -> R.Etr(subst lt ie,subst_ptn lt pe) )
and mov_rl_ptn m s0 i1 p0 =
  if i1<0&&m=R.M_Dlt then
    dlt_ptn m s0 p0
  else if m=R.M_Dlt then
    ( match p0 with
      | RP.A(R.Idx i0) ->
        (mov_r m s0 i1 i0)
      | RP.A(R.Agl(ia,_,pa)) ->
        if s0.(ia) then
          let l0 = lb () in
          let l1 = lb () in
          let e0 = mov_rl_ptn m s0 i1 pa in
          s0.(ia)<-(if m=R.M_Dlt then false else true);
          s0.(i1)<-true;
          e0^
          "\tmov rdi,0x0000_0001_0102_ffff\n"^
          "\tbt r12,"^(string_of_int i1)^"\n"^
          "\tjc "^l0^"\n"^
          "\tand rdi,~0x1\n"^
          "\tbt "^(emt_reg_x86 i1)^",0\n"^
          "\tjc "^l0^"\n"^
          "\tjmp "^l1^"\n"^
          l0^":\n"^
          "\tpush rdi\n"^
          (alc_blk_r 1)^
          "\tpop QWORD [rax]\n"^
          "\tmov rdi,"^(emt_reg_x86 i1)^"\n"^
          "\tmov QWORD [rax+8*1],rdi\n"^
          "\tmov "^(emt_reg_x86 i1)^",rax\n"^
          "\tbtr r12,"^(string_of_int i1)^"\n"^
          l1^":\n"^
          "\tmov rax,"^(emt_reg_x86 ia)^"\n"^
          "\tshl rax,56\n"^
          "\tor rax,1\n"^
          "\tor "^(emt_reg_x86 i1)^",rax\n"
        else err "mov_rl_ptn 0"
      | RP.A(R.AglUnn(ia,ps)) ->
        if s0.(ia)&&false then
          let l0 = lb () in
          let l1 = lb () in
          let lb0 = lb () in
          let lb1 = lb () in
          let s0_t = Array.copy s0 in
          let e0 =
            "\tmov rdi,"^(emt_reg_x86 ia)^"\n"^
            "\tjmp ["^lb0^"+rdi]\n"^
            lb0^":\n" in
          let (_,e1) =
            Array.fold_left (fun (i,s) _ -> (i+1,s^"\tdq "^lb0^"_"^(string_of_int i)^"\n")) (0,"") ps in
          let (_,es) =
            Array.fold_left
              (fun (j,es) pi ->
                 let si = Array.copy s0_t in
                 let ei = mov_rl_ptn m si i1 pi in
                 let _ = Array.mapi (fun i _ -> s0.(i)<-(s0.(i)&&si.(i))) si in
                 (j+1,es^lb0^"_"^(string_of_int j)^":\n"^ei^"\tjmp "^lb1^"\n") )
              (0,"") ps in
          s0.(ia)<-false;
          s0.(i1)<-true;
          e0^
          e1^
          es^
          "\tmov rsi,1\n"^
          "\tbt r12,"^(string_of_int i1)^"\n"^
          "\tjc "^l0^"\n"^
          "\tmov rsi,0\n"^
          "\tbt "^(emt_reg_x86 i1)^",0\n"^
          "\tjc "^l0^"\n"^
          "\tjmp "^l1^"\n"^
          l0^":\n"^
          (alc_blk_r 1)^
          "\tmov rdi,0x0000_0001_0002_fffe\n"^
          "\tor rdi,rsi\n"^
          "\tmov QWORD [rax],rdi\n"^
          "\tmov rdi,"^(emt_reg_x86 i1)^"\n"^
          "\tmov QWORD [rax+8*1],rdi\n"^
          "\tmov "^(emt_reg_x86 i1)^",rax\n"^
          "\tbtr r12,"^(string_of_int i1)^"\n"^
          l1^":\n"^
          "\tmov rax,"^(emt_reg_x86 ia)^"\n"^
          "\tshl rax,56\n"^
          "\tor rax,1\n"^
          "\tmov rdi,rax\n"^
          "\tor "^(emt_reg_x86 i1)^",rdi\n"
        else err "mov_rl_ptn 0"
      | RP.A(R.AglStt(ii,_,pa)) ->
        let l0 = lb () in
        let l1 = lb () in
        let e0 = mov_rl_ptn m s0 i1 pa in
        s0.(i1)<-true;
        e0^
        "\tmov rdi,0x0000_0001_0102_ffff\n"^
        "\tbt r12,"^(string_of_int i1)^"\n"^
        "\tjc "^l0^"\n"^
        "\tand rdi,~0x1\n"^
        "\tbt "^(emt_reg_x86 i1)^",0\n"^
        "\tjc "^l0^"\n"^
        "\tjmp "^l1^"\n"^
        l0^":\n"^
        "\tpush rdi\n"^
        (alc_blk_r 1)^
        "\tpop QWORD [rax]\n"^
        "\tmov rdi,"^(emt_reg_x86 i1)^"\n"^
        "\tmov QWORD [rax+8*1],rdi\n"^
        "\tmov "^(emt_reg_x86 i1)^",rax\n"^
        "\tbtr r12,"^(string_of_int i1)^"\n"^
        l1^":\n"^
        "\tmov rax,0x"^(Printf.sprintf "%02x" ii)^"00_0000_0000_0001\n"^
        "\tor "^(emt_reg_x86 i1)^",rax\n"
      | RP.R rs ->
        let bs = get_size (Array.length rs) in 
        let e0 =
          (alc_blk_r bs)^
          "\tmov rdi,0x0000_"^(Printf.sprintf "%04x" (Array.length rs))^"_"^(Printf.sprintf "%02x" bs)^"00_ffff\n"^
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
               let e1_0 = mov_rl_ptn m s0 im ri in (*lp ri in *)
               let e1 =
                 e1^
                 e1_0^
                 "\tmov rdi,"^(emt_reg_x86 i1)^"\n"^
                 "\tmov rsi,"^(emt_reg_x86 im)^"\n"^
                 "\tmov QWORD [rdi+8*1+8*"^(string_of_int i)^"],rsi\n"^
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
  else err "mov_rl_ptn 3"
and mov_unrl_ptn m s0 p1 i0 =
  let c0 = "; "^(string_of_int i0)^"' ⊢ "^(R.print p1)^"\n" in
  (*Util.Log.add @@ c0;*)
  if s0.(i0) then
    ( match p1 with
      | RP.A(R.Idx i1) ->
        (mov_r m s0 i1 i0)
      | RP.A(R.AglStt(ii,_,pa)) ->
        let l0 = lb () in
        let s1 = Array.copy s0 in
        let _ = rset_ptn s1 pa in
        let im = RSet.min_0 s1 in
        s0.(im)<-true;
        let e0 =
          "\tbtr r12,"^(string_of_int im)^"\n"^
          "\tmov rax,"^(emt_reg_x86 i0)^"\n"^
          "\tshr rax,56\n"^
          "\tcmp rax,"^(string_of_int ii)^"\n"^
          "\tjnz err_bug\n"^
          "\tmov rdi,0x00ff_ffff_ffff_fffe\n"^
          "\tand rdi,"^(emt_reg_x86 i0)^"\n"^
          "\tbt QWORD [rdi],17\n"^
          "\tjnc "^l0^"\n"^
          "\tbt QWORD [rdi],0\n"^
          (cf_set im)^
          (if m=R.M_Dlt then
             "\tmov rax,QWORD [rdi+8*1]\n"^
             "\tpush rax\n"^
             free_blk_r^
             "\tpoo rdi\n"
           else
             let e_d0 = add_gbg () in
             "\tmov rax,rdi"^"\n"^
             e_d0^
             "\tmov rdi,QWORD [rdi+8*1]\n")^
          l0^":\n" in
        let e1 =
          e0^
          "\tmov "^(emt_reg_x86 im)^",rdi\n"^
          (mov_unrl_ptn m s0 pa im) in
        s0.(im)<-false;
        s0.(i0)<-(if m=R.M_Dlt then false else true);
        c0^
        e1
      | RP.A(R.Agl(ia,_,pa)) ->
        if (not s0.(ia)) then
          let s1 = Array.copy s0 in
          let _ = rset_ptn s1 pa in
          s1.(ia)<-true;
          let im = RSet.min_0 s1 in
          let l0 = lb () in
          ( s0.(im)<-true;
            let e0 =
              "\tbtr r12,"^(string_of_int im)^"\n"^
              "\tmov "^(emt_reg_x86 ia)^","^(emt_reg_x86 i0)^"\n"^
              "\tshr "^(emt_reg_x86 ia)^",56\n"^
              "\tbts r12,"^(string_of_int ia)^"\n"^
              "\tmov rax,0x00ff_ffff_ffff_fffe\n"^
              "\tand rax,"^(emt_reg_x86 i0)^"\n"^
              "\tbt QWORD [rax],17\n"^
              "\tjnc "^l0^"\n"^
              "\tbt QWORD [rax],0\n"^
              (cf_set im)^
              (if m=R.M_Dlt then
                 "\tmov rdi,QWORD [rax+8*1]\n"^
                 "\tpush rdi\n"^
                 "\tmov rdi,rax\n"^
                 free_blk_r^
                 "\tpop rax\n"
               else
                 "\tmov rdi,rax"^"\n"^
                 (add_gbg ())^
                 "\tmov rax,QWORD [rax+8*1]\n")^
              l0^":\n" in
            let e1 =
              e0^
              "\tmov "^(emt_reg_x86 im)^",rax\n"^
              (mov_unrl_ptn m s0 pa im) in
            s0.(im)<-false;
            s0.(i0)<-(if m=R.M_Dlt then false else true);
            c0^e1 )
        else err "mov_unrl_ptn 0"
      | RP.R rs ->
        let s1 = Array.copy s0 in
        let _ = rset_ptn s1 p1 in
        let im = RSet.min_0 s1 in
        let (_,e1) =
          Array.fold_left
            ( fun (i,e1) ri ->
                s0.(im)<-true;
                let e1_0 = mov_unrl_ptn m s0 ri im in
                s0.(im)<-false;
                let e1 =
                  e1^
                  "\tmov rdi,"^(emt_reg_x86 i0)^"\n"^
                  "\tmov rax,QWORD [rdi+8*1+8*"^(string_of_int i)^"]\n"^
                  "\tmov "^(emt_reg_x86 im)^",rax\n"^
                  "\tbt QWORD [rdi],"^(string_of_int i)^"\n"^
                  (cf_set im)^
                  e1_0 in
                (i+1,e1))
            (0,"") rs in
        s0.(i0)<-(if m=R.M_Dlt then false else true);
        c0^e1^
        "\tmov rdi,"^(emt_reg_x86 i0)^"\n"^
        (if m=R.M_Dlt then
           free_blk_r
         else
           (add_gbg ()))
      | _ -> err @@ "mov_unrl_ptn 3:"^c0 )
  else err @@ "mov_unrl_ptn 2:"^c0

and mk_idx_k iv p =
  ( match p with
    | RP.A(_,Mtc_R r) -> mk_idx_k iv r
    | RP.A(_,Mtc_R_Agl(i0,i_n,ra)) -> RP.A(R.AglStt(i0,i_n,mk_idx_k iv ra))
    | RP.A(pa,Mtc_R_Top) -> Hashtbl.find iv (mk_r_p pa)
    | RP.A(pa,Mtc_R_Cst _) -> Hashtbl.find iv (mk_r_p pa)
    | RP.R rs -> RP.R(Array.map (mk_idx_k iv) rs) )
and emt_ir i1 gns (ns:ns_v ref) iv p =
  (* Util.Log.add ("enter emt_ir:"^(print_line p)^"\n"); *)
  let c_l = "; "^(print_line p)^" ; {> "^(pnt_iv gns iv)^" }\n" in
  ( match p with
    | Ret r ->
      let ir = csm_ptn_iv (mk_idx_ptn r) iv in
      let c0 = cmt ("\t∎ "^(emt_ptn ir)) in
      let e0 = dlt_iv iv in
      let s0 = RSet.ini () in
      let _ = rset_ptn s0 ir in
      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 ir i1 in
      c_l^c0^e0^e1^
      "\tret\n"
    | Exn _ ->
      "\tmov QWORD [err_n],-1\n"^
      "\tjmp err\n"
    | Mtc ps ->
      let psl = Array.to_list ps in
      let rec emt_mtc pv0 iv0 k0 psl lb0 =
        (*Util.Log.add ("enter emt_mtc:"^(pnt_m_set k0)^"\n");*)
        ( match psl with
          | ((es,_),p)::psl_tl ->
            let lb1 = "MTC_"^(lb ()) in
            let k1 =
              ( try
                  let vm0 = mk_vct pv0 es in
                  (*Util.Log.add @@ "S0"^(pnt_vct vm0)^"\n";*)
                  sub_lst_vct k0 vm0
                with _ -> k0 ) in
            let ivi = Hashtbl.copy iv0 in
            let (dl,e_eq) = emt_mtc_eq ivi es lb1 in
            let e_d = dlt_gbg () in
            let _ =
              List.fold_left (fun _ p -> Hashtbl.remove ivi p) () dl in
            let e0 = emt_ir i1 gns ns ivi p in
            let e1 = emt_mtc pv0 iv0 k1 psl_tl lb1 in
            lb0^":\n"^
            "\tmov r15,0\n"^
            e_eq^
            e_d^
            e0^
            e1
          | [] ->
            if k0=[] then lb0^":\n"
            else err @@ "emt_mtc 0:non exh"^(pnt_m_set k0) )
      and emt_mtc_eq iv0 es lb1 =
        (*Util.Log.add @@ "enter emt_mtc_eq:"^(pnt_iv gns iv0)^"\n";*)
        ( match es with
          | [] -> ([],"")
          | (vx,pa)::es_tl ->
            let px = mk_r_p(mk_idx vx) in
            let ix = Hashtbl.find iv0 px in
            ( match !pa with
              | Eq_Agl(_,i0,i_n,ra) ->
                let ya = inst_ptn gns 0 ra in
                let _ = gen (ref []) (-1) ya in
                let iya = alc_idx_ty (rset_iv iv0) ya in
                ( match ix with
                  | RP.A(R.Agl(ia,_,pa)) ->
                    let em = emt_mov_ptn_to_ptn R.M_Gbg (rset_iv iv0) pa iya in
                    let _ = mk_idx_iv iv0 iya (mk_idx_ptn ra) in
                    let e0 =
                      "\tmov rax,"^(emt_reg_x86 ia)^"\n"^
                      "\tcmp rax,"^(string_of_int i0)^"\n"^
                      "\tjnz "^lb1^"\n"^
                      em in
                    let (dl,e1) = emt_mtc_eq iv0 es_tl lb1 in
                    (px::dl,e0^e1)
                  | RP.A(R.Idx a) ->
                    let em = emt_mov_ptn_to_ptn R.M_Gbg (rset_iv iv0) ix (RP.A(R.AglStt(i0,i_n,iya))) in
                    let _ = mk_idx_iv iv0 iya (mk_idx_ptn ra) in
                    let e0 =
                      "\tmov rax,"^(emt_reg_x86 a)^"\n"^
                      "\tshr rax,56\n"^
                      "\tcmp rax,"^(string_of_int i0)^"\n"^
                      "\tjnz "^lb1^"\n"^
                      em in
                    let (dl,e1) = emt_mtc_eq iv0 es_tl lb1 in
                    (px::dl,e0^e1)
                  | _ -> err "emt_mtc_eq a0" )
              | P_Cst c0 ->
                ( match c0 with
                  | P_R64 x0 ->
                    ( match ix with
                      | RP.A(R.Idx ix0) ->
                        let e0 =
                          "\tmov QWORD rax,0x"^(Int64.format "%x" x0)^"\n"^
                          "\tcmp rax,"^(emt_reg_x86 ix0)^"\n"^
                          "\tjnz "^lb1^"\n" in
                        let (dl,e1) = emt_mtc_eq iv0 es_tl lb1 in
                        (dl,e0^e1)
                      | _ -> err "emt_mtc_eq 4" )
                  | P_N { contents=Stt_Axm p } -> 
                    let f = (try List.assoc p gns.ns_e with _ -> err "inst_mtc_atm 3") in
                    ( match !f with 
                      | Cst_Stt c -> 
                        ( match c with 
                        | Cst.R64 x0 ->
                          ( match ix with
                            | RP.A(R.Idx ix0) ->
                            let e0 =
                            "\tmov QWORD rax,0x"^(Int64.format "%x" x0)^"\n"^
                           "\tcmp rax,"^(emt_reg_x86 ix0)^"\n"^
                           "\tjnz "^lb1^"\n" in
                         let (dl,e1) = emt_mtc_eq iv0 es_tl lb1 in
                         (dl,e0^e1)
                            | _ -> err "emt_mtc_eq 5" )
                      | _ -> err "emt_mtc_q 6" )
                    | _ -> err "emt_met_eq 7" )
                  | _ -> err "emt_mtc_eq 5" )
              | Eq_V ve ->
                let py = mk_r_p(mk_idx ve) in
                let iy = Hashtbl.find iv0 py in
                ( match ix,iy with
                  | RP.A(R.Idx ix0),RP.A(R.Idx iy0) ->
                    let (dl,e1) = emt_mtc_eq iv0 es_tl lb1 in
                    let e0 =
                      "\tmov rdi,"^(emt_reg_x86 ix0)^"\n"^
                      "\tmov rsi,"^(emt_reg_x86 iy0)^"\n"^
                      "\tbt r12,"^(string_of_int ix0)^"\n"^
                      "\tcall eq\n"^
                      "\tjnz "^lb1^"\n" in
                    (dl,e0^e1)
                  | _ -> err "Eq_V 0" )
              | _ -> err "emt_mtc_eq 1" ) ) in
      let iv_0 = Hashtbl.copy iv in
      let pv0 = BatArray.of_list(Hashtbl.fold (fun p _ l -> p::l) iv_0 []) in
      let v0 = Array.map (fun _ -> RP.A Mtc_Top) pv0 in
      (emt_mtc pv0 iv_0 [v0] psl ("MTC_"^(lb ())))
    | IL_Glb_Call (n,x) ->
      let ep = slv_ns0 !ns n in
      let af = !(get_ns_e gns ep) in
      let yf = get_ns gns ep in 
      let v0 = newvar () in
      let v1 = newvar () in
      let _ = unify [] (Imp(Var v0,Var v1)) (inst 0 (Var yf)) in
      let _ = gen (ref []) (-1) (Var v0) in
      let _ = gen (ref []) (-1) (Var v1) in
      ( match af with
        | af ->
          ( match af with
            | Ctr(j,i_n) ->
              let ix = csm_ptn_iv (mk_idx_ptn x) iv in
              let icx = RP.A(R.AglStt(j,i_n,ix)) in
              let c0 = "; "^(pnt_stt_name !n)^" "^(emt_ptn ix)^" ⊢|\n" in
              let e0 = dlt_iv iv in
              let s0 = RSet.ini () in
              let _ = rset_ptn s0 icx in
              let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 icx i1 in
              c_l^c0^e0^e1^
              "\tret\n"
            | Etr_V(f_i0,_,pvi) ->
              let ix = csm_ptn_iv (mk_idx_ptn x) iv in
              let e0 = dlt_iv iv in
              let s0 = RSet.ini () in
              let _ = rset_ptn s0 ix in
              let e_c0 = (emt_mov_ptn_to_ptn R.M_Dlt s0 ix f_i0) in
              let c0 = "; "^(pnt_stt_name !n)^" "^(emt_ptn ix)^" ⊢|\n" in
              c_l^
              c0^
              e0^
              e_c0^
              "\tmov rdi,[rsp+16]\n"^
              "\tmov rax,QWORD [MOV_TBL+8*MOV_OFS_"^(string_of_int pvi)^"+8*rdi]\n"^
              "\tmov [rsp],rax\n"^
              "\tjmp NS_E_"^(Sgn.print ep)^"\n"
            | E_K_WC ->
              ( match ep with
                | ep when ep=Ast.Axm._add ->
                  let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                  let e0 = dlt_iv iv in
                  let s0 = RSet.ini () in
                  ( match ix with
                    | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                      let _ = rset_ptn s0 ix in
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 ix i1 in
                      e0^
                      (if x1<8 then
                         c_l^
                         "\tadd "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                       else
                         c_l^
                         "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                         "\tadd "^(emt_reg_x86 x0)^",rdi\n")^
                      e1^
                      "\tret\n"
                    | RP.A(R.Idx xp) ->
                      let im = RSet.min_0 s0 in
                      let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                      let _ = rset_ptn s0 iy in
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 iy i1 in
                      e0^
                      c_l^
                      "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                      "\tmov rax,QWORD [rdi+8*1]\n"^
                      "\tmov rsi,QWORD [rdi+8*2]\n"^
                      "\tadd rax,rsi\n"^
                      "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                      "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                      free_blk_r^
                      "\tbts r12,"^(string_of_int xp)^"\n"^
                      "\tbts r12,"^(string_of_int im)^"\n"^
                      e1^
                      "\tret\n"
                    | _ -> err "emt_ir _add 0" )
                | ep when ep=Ast.Axm._sub ->
                  let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                  let e0 = dlt_iv iv in
                  let s0 = RSet.ini () in
                  ( match ix with
                    | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                      let _ = rset_ptn s0 ix in
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 ix i1 in
                      e0^
                      (if x1<8 then
                         c_l^
                         "\tsub "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                       else
                         c_l^
                         "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                         "\tsub "^(emt_reg_x86 x0)^",rdi\n")^
                      e1^
                      "\tret\n"
                    | RP.A(R.Idx xp) ->
                      let im = RSet.min_0 s0 in
                      let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                      let _ = rset_ptn s0 iy in
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 iy i1 in
                      e0^
                      c_l^
                      "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                      "\tmov rax,QWORD [rdi+8*1]\n"^
                      "\tmov rsi,QWORD [rdi+8*2]\n"^
                      "\tsub rax,rsi\n"^
                      "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                      "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                      free_blk_r^
                      "\tbts r12,"^(string_of_int xp)^"\n"^
                      "\tbts r12,"^(string_of_int im)^"\n"^
                      e1^
                      "\tret\n"
                    | _ -> err "emt_ir _sub 0" )
                | ep when ep=Ast.Axm._imul ->
                  let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                  let e0 = dlt_iv iv in
                  let s0 = RSet.ini () in
                  ( match ix with
                    | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                      let _ = rset_ptn s0 ix in 
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 ix i1 in
                      e0^
                      (if x1<8 then
                         c_l^
                         "\timul "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                       else
                         c_l^
                         "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                         "\tadd "^(emt_reg_x86 x0)^",rdi\n")^
                      e1^
                      "\tret\n"
                    | RP.A(R.Idx xp) ->

                      let im = RSet.min_0 s0 in
                      let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                      let _ = rset_ptn s0 iy in 
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 iy i1 in
                      e0^
                      (c_l^
                       "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                       "\tmov rax,QWORD [rdi+8*1]\n"^
                       "\tmov rsi,QWORD [rdi+8*2]\n"^
                       "\timul rax,rsi\n"^
                       "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                       "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                       free_blk_r^
                       "\tbts r12,"^(string_of_int xp)^"\n"^
                       "\tbts r12,"^(string_of_int im)^"\n")^
                      e1^
                      "\tret\n"
                    | _ -> err "emt_ir _imul 0" )
                | ep when ep=Ast.Axm._and ->
                  let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                  let e0 = dlt_iv iv in
                  let s0 = RSet.ini () in
                  ( match ix with
                    | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                      let _ = rset_ptn s0 ix in
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 ix i1 in
                      e0^
                      (if x1<8 then
                         c_l^
                         "\tand "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                       else
                         c_l^
                         "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                         "\tadd "^(emt_reg_x86 x0)^",rdi\n")^
                      e1^
                      "\tret\n"
                    | RP.A(R.Idx xp) ->
                      let im = RSet.min_0 s0 in
                      let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                      let _ = rset_ptn s0 iy in
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 iy i1 in
                      e0^
                      c_l^
                      "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                      "\tmov rax,QWORD [rdi+8*1]\n"^
                      "\tmov rsi,QWORD [rdi+8*2]\n"^
                      "\tand rax,rsi\n"^
                      "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                      "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                      free_blk_r^
                      "\tbts r12,"^(string_of_int xp)^"\n"^
                      "\tbts r12,"^(string_of_int im)^"\n"^
                      e1^
                      "\tret\n"
                    | _ -> err "emt_ir _and 0" )
                  | ep when ep=Ast.Axm._or ->
                  let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                  let e0 = dlt_iv iv in
                  let s0 = RSet.ini () in
                  ( match ix with
                    | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                      let _ = rset_ptn s0 ix in
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 ix i1 in
                      e0^
                      (if x1<8 then
                         c_l^
                         "\tor "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                       else
                         c_l^
                         "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                         "\tor "^(emt_reg_x86 x0)^",rdi\n")^
                      e1^
                      "\tret\n"
                    | RP.A(R.Idx xp) ->
                      let im = RSet.min_0 s0 in
                      let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                      let _ = rset_ptn s0 iy in
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 iy i1 in
                      e0^
                      c_l^
                      "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                      "\tmov rax,QWORD [rdi+8*1]\n"^
                      "\tmov rsi,QWORD [rdi+8*2]\n"^
                      "\tor rax,rsi\n"^
                      "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                      "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                      free_blk_r^
                      "\tbts r12,"^(string_of_int xp)^"\n"^
                      "\tbts r12,"^(string_of_int im)^"\n"^
                      e1^
                      "\tret\n"
                    | _ -> err "emt_ir _or 0" )
                | ep when ep=Ast.Axm._shr ->
                  let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                  let e0 = dlt_iv iv in
                  let s0 = RSet.ini () in
                  ( match ix with
                    | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                      let _ = rset_ptn s0 ix in
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 ix i1 in
                      e0^
                      c_l^
                    "\tpush rcx\n"^
                         "\tmov rcx,"^(emt_reg_x86 x1)^"\n"^
                         "\tmov rdi,"^(emt_reg_x86 x0)^"\n"^ 
                      "\tshr rdi,cl\n"^
                      "\tpop rcx\n"^
                      "\tmov "^(emt_reg_x86 x0)^",rdi\n"^
                      e1^
                      "\tret\n"
                    | RP.A(R.Idx xp) ->
                      let im = RSet.min_0 s0 in
                      let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                      let _ = rset_ptn s0 iy in
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 iy i1 in
                      e0^
                      c_l^
                      "\tpush rcx\n"^
                      "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                      "\tmov rax,QWORD [rdi+8*1]\n"^
                      "\tmov rcx,QWORD [rdi+8*2]\n"^
                      "\tshr rax,cl\n"^
                      "\tmov rsi,rcx\n"^
                      "\tpop rcx\n"^
                      "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                      "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                      free_blk_r^
                      "\tbts r12,"^(string_of_int xp)^"\n"^
                      "\tbts r12,"^(string_of_int im)^"\n"^
                      e1^
                      "\tret\n"
                    | _ -> err "emt_ir _shr 0" )
                | ep when ep=Ast.Axm._shl ->
                  let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                  let e0 = dlt_iv iv in
                  let s0 = RSet.ini () in
                  ( match ix with
                    | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                      let _ = rset_ptn s0 ix in
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 ix i1 in
                      e0^
                      c_l^
                    "\tpush rcx\n"^
                         "\tmov rcx,"^(emt_reg_x86 x1)^"\n"^
                         "\tmov rdi,"^(emt_reg_x86 x0)^"\n"^ 
                      "\tshl rdi,cl\n"^
                      "\tpop rcx\n"^
                      "\tmov "^(emt_reg_x86 x0)^",rdi\n"^
                      e1^
                      "\tret\n"
                    | RP.A(R.Idx xp) ->
                      let im = RSet.min_0 s0 in
                      let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                      let _ = rset_ptn s0 iy in
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 iy i1 in
                      e0^
                      c_l^
                      "\tpush rcx\n"^
                      "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                      "\tmov rax,QWORD [rdi+8*1]\n"^
                      "\tmov rcx,QWORD [rdi+8*2]\n"^
                      "\tshl rax,cl\n"^
                      "\tmov rsi,rcx\n"^
                      "\tpop rcx\n"^
                      "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                      "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                      free_blk_r^
                      "\tbts r12,"^(string_of_int xp)^"\n"^
                      "\tbts r12,"^(string_of_int im)^"\n"^
                      e1^
                      "\tret\n"
                    | _ -> err "emt_ir _add 0" )
                | ep when ep=Ast.Axm._inc ->
                  let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                  let e0 = dlt_iv iv in
                  let s0 = RSet.ini () in
                  ( match ix with
                    | RP.A(R.Idx x0) ->
                      let _ = rset_ptn s0 ix in 
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 ix i1 in
                      c_l^
                      e0^
                      "\tadd "^(emt_reg_x86 x0)^",1\n"^
                      e1^
                      "\tret\n"
                    | _ -> err "emt_ir _inc 0" )
                | ep when ep=Ast.Axm._dec ->
                  let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                  let e0 = dlt_iv iv in
                  let s0 = RSet.ini () in
                  ( match ix with
                    | RP.A(R.Idx x0) ->
                      let _ = rset_ptn s0 ix in 
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 ix i1 in
                      e0^
                      c_l^
                      "\tsub "^(emt_reg_x86 x0)^",1\n"^
                      e1^
                      "\tret\n"
                    | _ -> err "emt_ir _inc 0" )
                | ep when ep=Ast.Axm._setge ->
                  let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                  let e0 = dlt_iv iv in
                  let s0 = RSet.ini () in
                  ( match ix with
                    | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                      let st = rset_iv iv in
                      let im = RSet.min_0 st in
                      let iy = RP.R [|RP.A(R.Idx x0);RP.A(R.Idx x1);RP.A(R.Idx im)|] in
                      let _ = rset_ptn s0 iy in 
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 iy i1 in
                      e0^
                      (if x1<8 then
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
                         "\tbts r12,"^(string_of_int im)^"\n")^
                      e1^
                      "\tret\n"
                    | RP.A(R.Idx xp) ->
                      let st = rset_iv iv in
                      st.(xp)<-true;
                      let im0 = RSet.min_0 st in
                      st.(im0)<-true;
                      let im1 = RSet.min_0 st in
                      let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im0);RP.A(R.Idx im1)|] in
                      let _ = rset_ptn s0 iy in 
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 iy i1 in
                      e0^
                      c_l^
                      "\tmov rax,"^(emt_reg_x86 xp)^"\n"^
                      "\tmov rsi,QWORD [rax+8*1]\n"^
                      "\tmov rdi,QWORD [rax+8*2]\n"^
                      "\tmov "^(emt_reg_x86 xp)^",rsi\n"^
                      "\tmov "^(emt_reg_x86 im0)^",rdi\n"^
                      "\tcmp rsi,rdi\n"^
                      "\tmov rsi,0\n"^
                      "\tsetge sil\n"^
                      "\tmov "^(emt_reg_x86 im1)^",rsi\n"^
                      "\tmov rdi,rax\n"^
                      free_blk_r^
                      "\tbts r12,"^(string_of_int im1)^"\n"^
                      "\tbts r12,"^(string_of_int xp)^"\n"^
                      "\tbts r12,"^(string_of_int im0)^"\n"^
                      e1^
                      "\tret\n"
                    | _ -> err "emt_ir _setge 0" )
                | ep when ep=Ast.Axm._mov ->
                  let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                  let e0 = dlt_iv iv in
                  let s0 = RSet.ini () in
                  ( match ix with
                    | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                      let _ = rset_ptn s0 ix in 
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 ix i1 in
                      e0^
                      (if x1<8 then
                         c_l^
                         "\tmov "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                       else
                         c_l^
                         "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                         "\tmov "^(emt_reg_x86 x0)^",rdi\n")^
                      e1^
                      "\tret\n"
                    | RP.A(R.Idx xp) ->
                      let st = rset_iv iv in
                      st.(xp)<-true;
                      let im = RSet.min_0 st in
                      let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                      let _ = rset_ptn s0 iy in 
                      let e1 = emt_mov_ptn_to_ptn R.M_Dlt s0 iy i1 in
                      e0^
                      c_l^
                      "\tmov rax,"^(emt_reg_x86 xp)^"\n"^
                      "\tmov rdi,QWORD [rax+8*2]\n"^
                      "\tmov "^(emt_reg_x86 xp)^",rdi\n"^
                      "\tmov "^(emt_reg_x86 im)^",rdi\n"^
                      "\tbts r12,"^(string_of_int xp)^"\n"^
                      "\tbts r12,"^(string_of_int im)^"\n"^
                      "\tmov rdi,rax\n"^
                      free_blk_r^
                      e1^
                      "\tret\n"
                    | _ -> err "emt_ir _mov 0" )
                | _ -> err "emt_ir _prm 0" )
            | _ -> err "met_ir etr 3"
          )
      )
    | Seq(n,p1) ->
      let s0 =
        ( match n with
          | IR_Id{ contents=IR_Id_C(r,[|r0|]) } ->
            Util.Log.add "Id 0\n";
            let sv = rset_iv iv in
            let ir = csm_ptn_iv (mk_idx_ptn r) iv in
            let y0 = inst_ptn gns 0 r0 in 
            let _ = gen (ref 0) (-1) y0 in 
            let ir0 = alc_idx_ty (rset_iv iv) y0 in
            let e_c0 = emt_mov_ptn_to_ptn R.M_Dlt sv ir ir0 in
            let _ = mk_idx_iv iv ir0 (mk_idx_ptn r0) in 
            e_c0
          | IR_Id{ contents=IR_Id_C(r,[|r0;r1|]) } ->
            let sv = rset_iv iv in
            let ir = csm_ptn_iv (mk_idx_ptn r) iv in
            let im0 = RSet.min_0 sv in
            sv.(im0)<-true;
            let im1 = RSet.min_0 sv in
            sv.(im0)<-false;
            let _ = mk_idx_iv iv (RP.A(R.Idx im0)) (mk_idx_ptn r0) in
            let e_c0 = (emt_mov_ptn_to_ptn R.M_Dlt sv ir (RP.A(R.Idx im0))) in
            let (e_0,e_1) = push_iv iv in
            let ee =
              e_c0^
              e_0^
              "\tmov rdi,"^(emt_reg_x86 im0)^"\n"^
              "\tbt r12,"^(string_of_int im0)^"\n"^
              (cf_set im1)^
              "\tcall dcp\n"^
              "\tmov "^(emt_reg_x86 im1)^",rax\n"^
              e_1 in
            let _ = mk_idx_iv iv (RP.A(R.Idx im1)) (mk_idx_ptn r1) in
            ee
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
              | af ->
                ( match af with
                  | Ctr(j,i_n) ->
                    let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                    let icx = RP.A(R.AglStt(j,i_n,ix)) in
                    let _ = mk_idx_iv iv icx (mk_idx_ptn y) in
                    let c0 = "; "^(pnt_stt_name !n)^" "^(emt_ptn ix)^" ⊢ "^(emt_ptn icx)^"\n" in
                    let e1 =
                      c_l^
                      c0 in
                    e1
                  | Etr_V(f_i0,f_i1,pvi) ->
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
                    let e_c0 = (emt_mov_ptn_to_ptn R.M_Dlt s0 ix f_i0) in
                    let e_c1 = (emt_mov_ptn_to_ptn R.M_Dlt s1 f_i1 iy) in
                    let c0 = "; "^(pnt_stt_name !n)^" "^(emt_ptn ix)^" ⊢ "^(emt_ptn iy)^"\n" in
                    let lbj = lb () in 
                    let e1 =
                      c_l^
                      c0^
                      e_0^
                      e_c0^
                      "\tpush "^(string_of_int pvi)^"\n"^
                      "\tpush "^lbj^"\n"^
                      "\tcall NS_E_"^(Sgn.print ep)^"\n"^
                      lbj^":\n"^
                      "\tadd rsp,16\n"^
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
                            if x1<8 then
                              c_l^
                              "\tadd "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                            else
                              c_l^
                              "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                              "\tadd "^(emt_reg_x86 x0)^",rdi\n"
                          | RP.A(R.Idx xp) ->
                            let s0 = rset_iv iv in
                            s0.(xp)<-true;
                            let im = RSet.min_0 s0 in
                            let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                            let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                            c_l^
                            "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                            "\tmov rax,QWORD [rdi+8*1]\n"^
                            "\tmov rsi,QWORD [rdi+8*2]\n"^
                            "\tadd rax,rsi\n"^
                            "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                            "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                            free_blk_r^
                            "\tbts r12,"^(string_of_int xp)^"\n"^
                            "\tbts r12,"^(string_of_int im)^"\n"
                          | _ -> err "emt_ir _add 0" )
                        | ep when ep=Ast.Axm._sub ->
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                            let _ = mk_idx_iv iv ix (mk_idx_ptn y) in
                            if x1<8 then
                              c_l^
                              "\tsub "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                            else
                              c_l^
                              "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                              "\tsub "^(emt_reg_x86 x0)^",rdi\n"
                          | RP.A(R.Idx xp) ->
                            let s0 = rset_iv iv in
                            s0.(xp)<-true;
                            let im = RSet.min_0 s0 in
                            let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                            let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                            c_l^
                            "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                            "\tmov rax,QWORD [rdi+8*1]\n"^
                            "\tmov rsi,QWORD [rdi+8*2]\n"^
                            "\tsub rax,rsi\n"^
                            "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                            "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                            free_blk_r^
                            "\tbts r12,"^(string_of_int xp)^"\n"^
                            "\tbts r12,"^(string_of_int im)^"\n"
                          | _ -> err "emt_ir _sub 0" )
                      | ep when ep=Ast.Axm._imul ->
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                            let _ = mk_idx_iv iv ix (mk_idx_ptn y) in
                            (*if x1<8 then
                              c_l^
                              "\timul "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                            else*)
                              c_l^
                              "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                              "\tmov rsi,"^(emt_reg_x86 x0)^"\n"^
                              "\timul rsi,rdi\n"^
                              "\tmov "^(emt_reg_x86 x0)^",rsi\n"
                          | RP.A(R.Idx xp) ->
                            let s0 = rset_iv iv in
                            s0.(xp)<-true;
                            let im = RSet.min_0 s0 in
                            let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                            let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                            c_l^
                            "\tmov rax,"^(emt_reg_x86 xp)^"\n"^
                            "\tmov rdi,QWORD [rax+8*1]\n"^
                            "\tmov rsi,QWORD [rax+8*2]\n"^
                            "\timul rdi,rsi\n"^
                            "\tmov "^(emt_reg_x86 xp)^",rdi\n"^
                            "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                            "\tmov rdi,rax\n"^
                            free_blk_r^
                            "\tbts r12,"^(string_of_int xp)^"\n"^
                            "\tbts r12,"^(string_of_int im)^"\n"
                          | _ -> err "emt_ir _imul 0" )
                      | ep when ep=Ast.Axm._shr ->
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                            let _ = mk_idx_iv iv ix (mk_idx_ptn y) in
                              c_l^
                              "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                              "\tmov rsi,"^(emt_reg_x86 x0)^"\n"^ 
                              "\tpush rcx\n"^
                              "\tmov rcx,rdi\n"^
                              "\tshr rsi,cl\n"^
                              "\tpop rcx\n"^
                              "\tmov "^(emt_reg_x86 x0)^",rsi\n"
                          | RP.A(R.Idx xp) ->
                            let s0 = rset_iv iv in
                            s0.(xp)<-true;
                            let im = RSet.min_0 s0 in
                            let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                            let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                            c_l^
                            "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                            "\tmov rax,QWORD [rdi+8*1]\n"^
                            "\tmov rsi,QWORD [rdi+8*2]\n"^
                            "\tpush rcx\n"^
                            "\tmov rcx,rsi\n"^
                            "\tshr rax,cl\n"^
                            "\tpop rcx\n"^
                            "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                            "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                            free_blk_r^
                            "\tbts r12,"^(string_of_int xp)^"\n"^
                            "\tbts r12,"^(string_of_int im)^"\n"
                          | _ -> err "emt_ir _shr 0" )
                      | ep when ep=Ast.Axm._shl ->
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                            let _ = mk_idx_iv iv ix (mk_idx_ptn y) in
                              c_l^
                              "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                              "\tmov rsi,"^(emt_reg_x86 x0)^"\n"^ 
                              "\tpush rcx\n"^
                              "\tmov rcx,rdi\n"^
                              "\tshl rsi,cl\n"^
                              "\tpop rcx\n"^
                              "\tmov "^(emt_reg_x86 x0)^",rsi\n"
                          | RP.A(R.Idx xp) ->
                            let s0 = rset_iv iv in
                            s0.(xp)<-true;
                            let im = RSet.min_0 s0 in
                            let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                            let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                            c_l^
                            "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                            "\tmov rax,QWORD [rdi+8*1]\n"^
                            "\tmov rsi,QWORD [rdi+8*2]\n"^
                            "\tpush rcx\n"^
                            "\tmov rcx,rsi\n"^
                            "\tshl rax,cl\n"^
                            "\tpop rcx\n"^
                            "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                            "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                            free_blk_r^
                            "\tbts r12,"^(string_of_int xp)^"\n"^
                            "\tbts r12,"^(string_of_int im)^"\n"
                          | _ -> err "emt_ir _shl 0" )
                    | ep when ep=Ast.Axm._or ->
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                            let _ = mk_idx_iv iv ix (mk_idx_ptn y) in
                            if x1<8 then
                              c_l^
                              "\tor "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                            else
                              c_l^
                              "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                              "\tor "^(emt_reg_x86 x0)^",rdi\n"
                          | RP.A(R.Idx xp) ->
                            let s0 = rset_iv iv in
                            s0.(xp)<-true;
                            let im = RSet.min_0 s0 in
                            let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                            let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                            c_l^
                            "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                            "\tmov rax,QWORD [rdi+8*1]\n"^
                            "\tmov rsi,QWORD [rdi+8*2]\n"^
                            "\tor rax,rsi\n"^
                            "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                            "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                            free_blk_r^
                            "\tbts r12,"^(string_of_int xp)^"\n"^
                            "\tbts r12,"^(string_of_int im)^"\n"
                          | _ -> err "emt_ir _or 0" )
                      | ep when ep=Ast.Axm._and ->
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                            let _ = mk_idx_iv iv ix (mk_idx_ptn y) in
                            if x1<8 then
                              c_l^
                              "\tand "^(emt_reg_x86 x0)^","^(emt_reg_x86 x1)^"\n"
                            else
                              c_l^
                              "\tmov rdi,"^(emt_reg_x86 x1)^"\n"^
                              "\tand "^(emt_reg_x86 x0)^",rdi\n"
                          | RP.A(R.Idx xp) ->
                            let s0 = rset_iv iv in
                            s0.(xp)<-true;
                            let im = RSet.min_0 s0 in
                            let iy = RP.R [|RP.A(R.Idx xp);RP.A(R.Idx im)|] in
                            let _ = mk_idx_iv iv iy (mk_idx_ptn y) in
                            c_l^
                            "\tmov rdi,"^(emt_reg_x86 xp)^"\n"^
                            "\tmov rax,QWORD [rdi+8*1]\n"^
                            "\tmov rsi,QWORD [rdi+8*2]\n"^
                            "\tand rax,rsi\n"^
                            "\tmov "^(emt_reg_x86 xp)^",rax\n"^
                            "\tmov "^(emt_reg_x86 im)^",rsi\n"^
                            free_blk_r^
                            "\tbts r12,"^(string_of_int xp)^"\n"^
                            "\tbts r12,"^(string_of_int im)^"\n"
                          | _ -> err "emt_ir _and 0" )
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
                            if x1<8 then
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
                            "\tmov rsi,QWORD [rax+8*1]\n"^
                            "\tmov rdi,QWORD [rax+8*2]\n"^
                            "\tmov "^(emt_reg_x86 xp)^",rsi\n"^
                            "\tmov "^(emt_reg_x86 im0)^",rdi\n"^
                            "\tcmp rsi,rdi\n"^
                            "\tmov rsi,0\n"^
                            "\tsetge sil\n"^
                            "\tmov "^(emt_reg_x86 im1)^",rsi\n"^
                            "\tmov rdi,rax\n"^
                            free_blk_r^
                            "\tbts r12,"^(string_of_int im1)^"\n"^
                            "\tbts r12,"^(string_of_int xp)^"\n"^
                            "\tbts r12,"^(string_of_int im0)^"\n"
                          | _ -> err "emt_ir _setge 0" )
                      | ep when ep=Ast.Axm._mov ->
                        let ix = csm_ptn_iv (mk_idx_ptn x) iv in
                        ( match ix with
                          | RP.R[|RP.A(R.Idx x0);RP.A(R.Idx x1)|] ->
                            let _ = mk_idx_iv iv ix (mk_idx_ptn y) in
                            if x1<8 then
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
                            "\tmov rdi,QWORD [rax+8*2]\n"^
                            "\tmov "^(emt_reg_x86 xp)^",rdi\n"^
                            "\tmov "^(emt_reg_x86 im)^",rdi\n"^
                            "\tbts r12,"^(string_of_int xp)^"\n"^
                            "\tbts r12,"^(string_of_int im)^"\n"^
                            "\tmov rdi,rax\n"^
                            free_blk_r
                          | _ -> err "emt_ir _mov 0" )
                      | _ -> err "emt_ir _prm 0" )
                  | _ -> err "met_ir etr 3"
                )
            )
          | IR_Glb_Out(_,_) -> err "emt_ir IR_Glb_Out 0"
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
                ( fun (i,e_l) si ->
                    let e_i =
                      "\tmov rax,"^si^"\n"^
                      "\tmov QWORD [rdi+8*1+8*"^(string_of_int i)^"],rax\n" in
                    (i+1,e_l^e_i))
                (0,"") lc in

            let e0 =
              c0^
              "\tmov rdi,"^(string_of_int sl)^"\n"^
              "\tcall mlc_s8\n"^
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
            ( if im<8 then
                "\tmov rdi,0x"^(Int64.format "%x" x)^"\n"^
                "\tmov "^(emt_reg_x86 im)^",rdi\n"
              else
                "\tmov "^(emt_reg_x86 im)^",0x"^(Int64.format "%x" x)^"\n" )^
            "\tbts r12,"^(string_of_int im)^"\n"
          | IR_Exp(Ast.Name n,_,Rcd_Ptn.A y) ->
            ( match !n with 
              | Stt_Axm p when p = Ast.Axm._args -> 
                let im = RSet.min_0 (rset_iv iv) in
                let iy = RP.A(R.Idx im) in
                let _ = mk_idx_iv iv iy (mk_idx_ptn (RP.A y)) in
                let c0 = cmt ("\t» _args _ ⊢ "^(emt_ptn iy)^rtl^(pnt_ptn (RP.A y))) in
                c_l^
                c0^
                push_all^
                "\tmov rdi,[args]\n"^
                "\tclc\n"^
                "\tcall dcp\n"^
                pop_all^
                "\tmov "^(emt_reg_x86 im)^",rax\n"^
                "\tbtr r12,"^(string_of_int im)^"\n"
              | _ -> 
                let p = slv_ns0 !ns n in
                let e = get_ns_e gns p in
                ( match !e with 
                  | Cst_Stt Cst.R64 x -> 
                    let im = RSet.min_0 (rset_iv iv) in
                    let iy = RP.A(R.Idx im) in
                    let _ = mk_idx_iv iv iy (mk_idx_ptn (RP.A y)) in
                    let c0 = cmt ("\t» "^(print_exp (ExpCst(Cst.R64 x)))^" _ ⊢ "^(emt_ptn iy)^rtl^(pnt_ptn (RP.A y))) in
                    c_l^
                    c0^
                    ( if im<8 then
                        "\tmov rdi,0x"^(Int64.format "%x" x)^"\n"^
                        "\tmov "^(emt_reg_x86 im)^",rdi\n"
                      else
                        "\tmov "^(emt_reg_x86 im)^",0x"^(Int64.format "%x" x)^"\n" )^
                    "\tbts r12,"^(string_of_int im)^"\n"
                  | _ -> err "emt_ir exp x0" ) )
          | IR_S8 { contents=IR_S8_C(pl,rs0,rs1) } ->
            let ls0 = Array.length rs0 in
            let s0 = rset_iv iv in 
            let im = RSet.min_0 (rset_iv iv) in
            s0.(im)<-true;
            let c0 = cmt ("» _^ ..") in
            let ir0 =
              Array.mapi
                ( fun i v ->
                    let j = csm_iv (mk_idx v) iv in
                    let _ = mk_idx_iv iv j (RP.A(mk_idx rs1.(i))) in
                    ( match j with
                      | RP.A(R.Idx i) -> i
                      | _ -> err "emt_ir S8 x0" )                  )
                rs0 in
            let _ = mk_idx_iv iv (RP.A(R.Idx im)) (RP.A(mk_idx rs1.(ls0))) in
            let d_n = ref 0 in 
            let (e_l,e_x) =
              List.fold_left
                (fun (e_l,e_x) p ->
                   match p with
                   | S8_Txt s ->
                     let sl = String.length s in
                     let e_l =
                       e_l^
                       "\tadd rax,"^(string_of_int sl)^"\n" in
                     let (lc,lm) = Util.fmt_of_string_m s in
                     let (i,e_m) =
                       List.fold_left
                         ( fun (i,e_m) si ->
                             let e_i =
                               "\tmov rsi,"^si^"\n"^
                               "\tmov QWORD [rdi+8*"^(string_of_int i)^"],rsi\n" in
                             (i+1,e_m^e_i))
                         (0,"") lc in
                     let (_,e_lm) =
                       List.fold_left
                         ( fun (j,e_lm) si ->
                             let e_i =
                               "\tmov rsi,"^si^"\n"^
                               "\tmov BYTE [rdi+8*"^(string_of_int i)^"+"^(string_of_int j)^"],sil\n" in
                             (j+1,e_lm^e_i))
                         (0,"") lm in
                     let e_x =
                       e_x^
                       "; \""^(String.escaped s)^"\"\n"^
                       e_m^
                       e_lm^
                       "\tadd rdi,"^(string_of_int sl)^"\n" in
                     (e_l,e_x)
                   | S8_Name n ->
                     let p = slv_ns0 !ns n in
                     let e = get_ns_e gns p in
                     ( match !e with
                       | Cst_Stt(Cst.S8 s) ->
                         let sl = String.length s in
                         let e_l =
                           e_l^
                           "\tadd rax,"^(string_of_int sl)^"\n" in
                         let (lc,lm) = Util.fmt_of_string_m s in
                         let (i,e_m) =
                           List.fold_left
                             ( fun (i,e_m) si ->
                                 let e_i =
                                   "\tmov rsi,"^si^"\n"^
                                   "\tmov QWORD [rdi+8*"^(string_of_int i)^"],rsi\n" in
                                 (i+1,e_m^e_i))
                             (0,"") lc in
                         let (_,e_lm) =
                           List.fold_left
                             ( fun (j,e_lm) si ->
                                 let e_i =
                                   "\tmov rsi,"^si^"\n"^
                                   "\tmov BYTE [rdi+8*"^(string_of_int i)^"+"^(string_of_int j)^"],sil\n" in
                                 (j+1,e_lm^e_i))
                             (0,"") lm in
                         let e_x =
                           e_x^
                           "; \""^(String.escaped s)^"\"\n"^
                           e_m^
                           e_lm^
                           "\tadd rdi,"^(string_of_int sl)^"\n" in
                         (e_l,e_x)
                       | _ -> err "emt_ir _^ 0" )
                   | S8_Var i ->
                     let e_l =
                       e_l^
                       "\tmov rsi,"^(emt_reg_x86 ir0.(i))^"\n"^
                       "\tmov esi,DWORD [rsi+4]\n"^
                       "\tadd rax,rsi\n" in
                     let e_x =
                       e_x^
                       "; "^(string_of_int i)^"\'\n"^
                       "\tpush rcx\n"^
                       "\tmov rsi,"^(emt_reg_x86 ir0.(i))^"\n"^
                       "\tmov ecx,DWORD [rsi+4]\n"^
                       "\tadd rsi,8\n"^
                       "\tcld\n"^
                       "\trep movsb\n"^
                       "\tpop rcx\n" in
                     (e_l,e_x)
                   | S8_Var_D i ->
                     d_n := !d_n + 1;
                     let im_p = RSet.min_0 s0 in 
                     s0.(im_p)<-true; 
                     let im_l = RSet.min_0 s0 in 
                     s0.(im_l)<-true; 
                     let e_l = 
                       e_l^
                       "\tsub rsp,124\n"^
                       "\tmov rdi,rsp\n"^
                       "\tpush rax\n"^
                       push_all^
                       "\tmov rdx,"^(emt_reg_x86 ir0.(i))^"\n"^
                       "\txor rax,rax\n"^
                       "\tmov rsi,fmt_d\n"^
                       "\tmov QWORD [rsp_tmp],rsp\n"^
                       "\tand rsp,~0xf\n"^
                       "\tcall sprintf\n"^
                       "\tmov rsp,QWORD [rsp_tmp]\n"^
                       pop_all^
                       "\tpop rsi\n"^
                       "\tmov "^(emt_reg_x86 im_p)^",rsp\n"^
                       "\tmov "^(emt_reg_x86 im_l)^",rax\n"^
                       "\tadd rax,rsi\n" in
                     let e_x =
                       e_x^
                       "; "^(string_of_int i)^"\'\n"^
                       "\tpush rcx\n"^
                       "\tmov rsi,"^(emt_reg_x86 im_p)^"\n"^
                       "\tmov rcx,"^(emt_reg_x86 im_l)^"\n"^
                       "\tcld\n"^
                       "\trep movsb\n"^
                       "\tpop rcx\n" in
                     (e_l,e_x)
                   | S8_For_Txt(i,s) ->
                     let sl = String.length s in
                     let e_l =
                       e_l^
                       "\tmov rsi,"^(emt_reg_x86 ir0.(i))^"\n"^
                       "\timul rsi,"^(string_of_int sl)^"\n"^
                       "\tadd rax,rsi\n" in
                     let lb0 = lb () in
                     let lb1 = lb () in
                     let (lc,lm) = Util.fmt_of_string_m s in
                     let (i,e_m) =
                       List.fold_left
                         ( fun (i,e_m) si ->
                             let e_i =
                               "\tmov rsi,"^si^"\n"^
                               "\tmov QWORD [rdi+8*"^(string_of_int i)^"],rsi\n" in
                             (i+1,e_m^e_i))
                         (0,"") lc in
                     let (_,e_lm) =
                       List.fold_left
                         ( fun (j,e_lm) si ->
                             let e_i =
                               "\tmov rsi,"^si^"\n"^
                               "\tmov BYTE [rdi+8*"^(string_of_int i)^"+"^(string_of_int j)^"],sil\n" in
                             (j+1,e_lm^e_i))
                         (0,"") lm in
                     let e_x =
                       e_x^
                       "; "^(string_of_int i)^"*\""^(String.escaped s)^"\"\n"^
                       "\tmov rax,"^(emt_reg_x86 ir0.(i))^"\n"^
                       lb0^":\n"^
                       "\tcmp rax,0\n"^
                       "\tjz "^lb1^"\n"^
                       e_m^
                       e_lm^
                       "\tadd rdi,"^(string_of_int sl)^"\n"^
                       "\tsub rax,1\n"^
                       "\tjmp "^lb0^"\n"^
                       lb1^":\n" in
                     (e_l,e_x) )
                ("","") pl in
            c0^
            "\txor rax,rax\n"^
            e_l^
            "\tmov rdi,rax\n"^
            "\tcall mlc_s8\n"^
            "\tmov "^(emt_reg_x86 im)^",rax\n"^
            "\tbtr r12,"^(string_of_int im)^"\n"^
            "\tmov rdi,rax\n"^
            "\tadd rdi,8\n"^
            e_x^
            "\tadd rsp,"^(string_of_int (124* !d_n))^"\n"
          | _ -> err "emt_etr 0" ) in
      s0^(emt_ir i1 gns ns iv p1)
    | _ -> err "emt_ir T4"
  )
and emt_ptn r = R.print r
let emt_0b n =
  let s = String.make (n+1) '0' in
  Bytes.set s 0 '1';
  "0b"^s
and rb r =
  ( match r with
    | "rax" -> "al" | "rdi" -> "dil" | "rsi" -> "sil" | "rdx" -> "dl"
    | "rcx" -> "cl" | "r8" ->  "r8b" | "r9" -> "r9b" | "r10" -> "r10b"
    | "r11" -> "r11b" | _ ->  err "rb 0" )
