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
let rec sgns n = if n=0 then [] else (Sgn.ini ())::(sgns (n-1))
module SgnSet = Set.Make(struct type t = Sgn.t let compare = compare end)
module StgSet = Set.Make(struct type t = string let compare = compare end)
module SgnMap = Map.Make(struct type t = Sgn.t let compare = compare end)
module StgMap = Map.Make(struct type t = string let compare = compare end)
let set_of_map m = SgnMap.fold (fun k _ r -> SgnSet.add k r) m SgnSet.empty
let map_of_set s = SgnSet.fold (fun k r -> SgnMap.add k None r) s SgnMap.empty
let set_of m = StgMap.fold (fun k _ r -> StgSet.add k r) m StgSet.empty
let map_of s = StgSet.fold (fun k r -> StgMap.add k None r) s StgMap.empty
type tm =
  | Prm of Sgn.t
  | Val of Sgn.t
  | App of tm * tm
let imp = Sgn.ini ()
let tpl = Sgn.ini ()
let prd = Sgn.ini ()
let coprd = Sgn.ini ()
let prd_end  = Sgn.ini ()
let coprd_end = Sgn.ini ()
let rcd = Sgn.ini ()
let rcd_end = Sgn.ini ()
let rcd_edo = Sgn.ini ()
let z = Sgn.ini ()
let stg = Sgn.ini ()
let arg = Sgn.ini ()
let root = Sgn.ini ()
let fld = Sgn.ini ()
let unfld = Sgn.ini ()
let pZ = Sgn.ini ()
type cxt = tm SgnMap.t
type c = (tm * tm) list
let (<+) x y = App(x,y)
let (-*) x y = (Prm imp)<+x<+y
let ( ** ) x y = (Prm tpl)<+x<+y
let rcd_cl l = List.fold_right (fun x r -> x**r) l (Prm rcd_end)
let rcd_op l = List.fold_right (fun x r -> x**r) l (Val (Sgn.ini()))
let ( *| ) x y = (Prm coprd)<+x<+y
let ( *& ) x y = (Prm prd)<+x<+y
let coprd_cl l = List.fold_right (fun x r -> x*|r) l (Prm coprd_end)
let coprd_op l = List.fold_right (fun x r -> x*|r) l (Val (Sgn.ini()))
let prd_cl l = List.fold_right (fun x r -> x*&r) l (Prm prd_end)
let prd_op l = List.fold_right (fun x r -> x*&r) l (Val (Sgn.ini()))
type name = string
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
  | Def_Prd of name * args * ((typ * name) list)
  | Def_CoPrd of name * args * ((typ * name) list)
  | Def_Fnt of name * (name list)
  | Def_Fnt_Dep of name * int * name
  | Def_Eqv of name * args * typ
and args = arg list
and arg =
  | Arg_Val of int
  | Arg_Rcd of arg list
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
and exp = typ * opr * ((name * opr) list)
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
  | PrjL of nd
  | PrjR of nd
  | Inj of int
  | Cho of int
  | Exp_Stg of string
let id = E (Exp_Name "$")
type buffer =
  | Evo of code
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
