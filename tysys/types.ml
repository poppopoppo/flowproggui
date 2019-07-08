module Sgn :
sig
  type t
  val ini : unit -> t
  val print : t -> string
end
= struct
  type t = int
  let sgn_N = ref 0
  let ini () =
    let n = !sgn_N in
    sgn_N := n+1;
    n
  let print x = (string_of_int x)
end
let sgn = Sgn.ini
let rec sgns n = if n=0 then [] else (Sgn.ini ())::(sgns (n-1))
type valP =
  | VName of string
  | VSgn of Sgn.t
  | PSgn of Sgn.t
module SgnSet = Set.Make(struct type t = Sgn.t let compare = compare end)
module StgSet = Set.Make(struct type t = string let compare = compare end)
module SgnMap = Map.Make(struct type t = Sgn.t let compare = compare end)
module StgMap = Map.Make(struct type t = string let compare = compare end)
module IntMap = Map.Make(struct type t = int let compare = compare end)
module ValMap = Map.Make(struct type t = valP let compare = compare end)
module ValSet = Set.Make(struct type t = valP let compare = compare end)
let set_of_map m = SgnMap.fold (fun k _ r -> SgnSet.add k r) m SgnSet.empty
let map_of_set s = SgnSet.fold (fun k r -> SgnMap.add k None r) s SgnMap.empty
let set_of m = StgMap.fold (fun k _ r -> StgSet.add k r) m StgSet.empty
let map_of s = StgSet.fold (fun k r -> StgMap.add k None r) s StgMap.empty
type tm =
  | Prm of Sgn.t
  | Val of Sgn.t
  | App of tm * tm
type 'v tmP =
  | ValP of 'v
  | AppP of 'v tmP * 'v tmP

type 'v prm_set = 'v -> bool
let std_prm v =
  ( match v with
    | VName _ -> true
    | PSgn _ -> true
    | VSgn _ -> false )
let vsgn () = Val (sgn ())
let psgn () = Prm (sgn ())
let imp = Sgn.ini ()  (* → *)
let tpl = Sgn.ini () (* ** *)
let prd = Sgn.ini ()  (* *& *)
let unv_prd = Sgn.ini ()
let pol_prd = sgn()
let coprd = Sgn.ini ()
let vct = psgn ()
let opn = psgn ()
let lst = psgn ()
let pZ = psgn ()
let nat = psgn ()
let sgn_sgn = psgn ()
let stg = psgn ()
let unv_coprd = sgn ()
let typ_inj = sgn ()
let typ_cho = sgn ()
let pol_coprd = sgn ()
let prd_end  = Sgn.ini ()
let coprd_end = Sgn.ini ()
let rcd = Sgn.ini ()
let rcd_end = Sgn.ini ()
let rcd_edo = Sgn.ini ()
let z = Sgn.ini ()
let arg = Sgn.ini ()
let root = Sgn.ini ()
let fld = Sgn.ini ()
let unfld = Sgn.ini ()
let inA = sgn ()
let outA = sgn ()
let gl_e = sgn ()
let exn_plg = sgn ()
let inj = sgn ()
let cho = sgn ()
let stg_plg = sgn ()
type cxt = tm SgnMap.t
type cxtP = (valP tmP) ValMap.t
type c = (tm * tm) list
type cP = (valP tmP * valP tmP) list
let (<+) x y = App(x,y)
let (-*) x y = (Prm imp)<+x<+y
let ( ** ) x y = (Prm tpl)<+x<+y
let rcd_cl l = List.fold_right (fun x r -> x**r) l (Prm rcd_end)
let rcd_op l = List.fold_right (fun x r -> x**r) l (Val (Sgn.ini()))
let ( *| ) x y = (Prm coprd)<+x<+y
let coprd_unv u x y = ((Prm unv_coprd)<+u<+x<+y)
let ( *|=) x y = coprd_unv (Prm typ_inj) x y
let ( *& ) x y = (Prm prd)<+x<+y
let coprd_cl l = List.fold_right (fun x r -> x*|r) l (Prm coprd_end)
let coprd_cl_unv u l =
  List.fold_right (fun x r -> coprd_unv u x r) l (Prm coprd_end)
let coprd_cl_inj l = coprd_cl_unv (Prm typ_inj) l
let coprd_op l = List.fold_right (fun x r -> x*|r) l (vsgn())
let coprd_op_unv u l =
  List.fold_right (fun x r -> coprd_unv u x r) l (vsgn())
let coprd_op_inj l = coprd_op_unv (Prm typ_inj) l
let prd_cl l = List.fold_right (fun x r -> x*&r) l (Prm prd_end)
let prd_op l = List.fold_right (fun x r -> x*&r) l (vsgn())
let pZ_ini y = (Prm unfld)<+(rcd_cl [y;pZ])
type typ_gma = (tm * tm) SgnMap.t
type typ_env = (tm * tm) list
type name = string
type mdl_glb = ((tm * tm) SgnMap.t) * ((tm * tm) StgMap.t)
type mdl = name * args * (glb_etr list)
and mdl_scm = mdl_scm_hd * tm
and mdl_scm_hd = (tm option) SgnMap.t
and mdl_gma = mdl_scm StgMap.t
and glb_etr =
  | Etr of mdl_scm_hd * etr_body
  | Flow of flow
  | Etr_Clq of mdl_scm_hd * (etr_body list)
  | Flow_Clq of flow list
  | Gram of Peg.grammar
and etr_body = string * tm * tm * code
and flow =
  | Def_Abs of name * args
  | Def_Prd of name * args * ((tm * name) list)
  | Def_CoPrd of name * args * ((tm * name) list)
  | Def_Fnt of name * (name list)
  | Def_Fnt_Dep of name * int * name
  | Def_Eqv of name * args * tm
and args = tm list
and etr = string * mdl_scm_hd * tm * tm * code
(* <name> : [scm_hd]∀ <src> ⊢ <dst> ≒ <code> *)
and gl_st = glb_etr list
and typ =
  | Typ_App of typ * typ
  | Typ_Vct of typ * typ
  | Typ_Rcd of typ list
  | Typ_Imp of typ * typ
  | Typ_Null
  | Typ_CoPrd of typ list
  | Typ_Prd of typ list
  | Typ_Name of name
  (* ℤ & ℾ ◃ ‹› *)
  | Typ_Val of int
and st = typ * tkn
and code =
  | Code_Exp of exp
  | Seq of code * code
  | Canon of (code list)
  | Code_CoPrd of exp * (code list)
  | Code_Prd of exp * (code list)
  | Code_IO of exp * int * code
and exp = tm * opr * ((name * opr) list)
and opr =
  | Agl of opr
  | Opr_Z of int
  | Opr_Name of string
  | Opr_Rcd of opr list
  | Opr_App of opr * opr
  | Prj of opr * int
  | Opr_Inj of int
  | Opr_Cho of int
  | Opr_Stg of string
and tkn =
  | Tkn_Null
  | Tkn_Btm
  | Tkn_Exn of string
  | Tkn_IO_Exn
  | Tkn_Rcd of tkn list
  | Tkn_Vct_ini
  | Tkn_Vct of tkn * ((tkn * tkn) list)
  | Tkn_CoPrd of tkn list
  | Tkn_IO_Inj of int
  | Tkn_Prd of tkn * (code list)
  | Tkn_IO_Cho of int
  | Tkn_IO_Code of (tkn list) * int * exp *  code
  | Tkn_Sgn of int
  | Tkn_IO_Sgn
  | Tkn_Z of int
  | Tkn_Fin of int * int
  | Tkn_None
  | Tkn_Some of tkn
  | Tkn_IO_Plus
  | Tkn_IO_Mult
  | Tkn_IO_Minus
  | Tkn_IO_Eq
  | Tkn_Stg of string

type vh =
  | V of vh * vh
  | H of vh * vh
  | E of nd
  | P of nd * (vh list)
  | A of nd * path * (vh list)
  | F of nd * int * vh (* { exp ? } |» vh *)
(* F of nd * int * vh { exp ? ?' ?'' .. } |» vh *)
and path = int list
and nd =
  | Exp_Z of int
  | Exp_Name of string
  | Exp_App of nd * nd
  | Exp_Tns of nd * nd
  | PrjL of nd
  | PrjR of nd
  | Inj of int
  | Cho of int
  | Exp_Stg of string
let id = E (Exp_Name "$")
type tkn_s =
  | TknS_Stg of string
  | TknS_Tns of tkn_s * tkn_s
  | TknS_Z of int
  | TknS_Plg of Sgn.t

type code_p =
  | V_S of Sgn.t * Sgn.t
  | H_S of Sgn.t * Sgn.t
  | E_S of nd_p
  | P_S of nd_p * (Sgn.t list)
  | A_S of nd_p * path * (Sgn.t list)
  | F_S of nd_p * int * Sgn.t
and nd_p =
  | Z_S of int
  | Gl_S of Sgn.t
  | Prm_S of string
  | Tns_S of nd_p * nd_p
  | App_S of nd_p * nd_p
  | PL_S of nd_p
  | PR_S of nd_p
  | Inj_S of int
  | Cho_S of int
  | Stg_S of string
and tns_p =
  | PL_x of path
  | Inj_x of int
  | Cho_x of int
  | Plg_x of Sgn.t
  | Z_x of int
  | Stg_x of string
  | TnsT of Sgn.t * Sgn.t
  | AppT of Sgn.t * Sgn.t
and tns = tns_p SgnMap.t * Sgn.t
and code_x =
  | V_X of Sgn.t * Sgn.t
  | H_X of Sgn.t * Sgn.t
  | E_X of tns 
  | P_X of tns * (Sgn.t list)
  | A_X of tns * path * (Sgn.t list)
  | F_X of tns * int * Sgn.t
let clj = sgn ()
let ( <*> ) x y = TknS_Tns(x,y)
type code_s = code_p SgnMap.t
type et = code_s * Sgn.t * tkn_s
type lst =
  | Lst_Unt
  | Lst_Exn of string
  | Lst_Tns of lst * lst
  | Lst_Vct of lst * ((lst * lst) list)
  | Lst_CoPrd of int * lst
  | Lst_Prd of lst * (vh list)
  | Lst_Code of lst_arg * code_i
  | Lst_Sgn of Sgn.t
  | Lst_Z of int * int
  | Lst_Stg of string
and lst_arg =
  | Arg_Rcd of (lst list) * int
  | Arg_Mno of lst option
and code_i =
  | C_VH of vh
  | C_Name of string
  | C_Inj of int
  | C_Cho of int
  | C_Agl
let lst_nil = Lst_Unt
let list_of_lst s =
  ( try
      let rec l s =
        ( match s with
          | x when x=lst_nil -> []
          | Lst_Tns(s1,s2) -> s1::(l s2)
          | _ -> raise (Failure "") ) in
      Some (l s)
    with _ -> None )
let lst_of_list l =
  List.fold_right
    (fun x r -> Lst_Tns (x,r)) l lst_nil
type nd_eval = lst * (int option)
type buffer =
  | Evo of nd
  | End
exception End
let rec path p e : tm option =
  ( match p with
    | [] -> Some e
    | hd::tl ->
      let e1 = rcd_nth hd e in
      path tl e1
  )
and rcd_nth n e =
  ( match e with
    | App(App(Prm p,e1),e2) ->
      if p=tpl then if n=0 then e1 else rcd_nth (n-1) e2
      else raise @@ Failure "rcd_nth:1"
    | _ -> raise @@ Failure "rcd_nth:2"
  )
