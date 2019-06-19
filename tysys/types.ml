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
module SgnSet = Set.Make(struct type t = Sgn.t let compare = compare end)
module SgnMap = Map.Make(struct type t = Sgn.t let compare = compare end)
type tm =
  | Prm of Sgn.t
  | Val of Sgn.t
  | App of tm * tm
let imp = Sgn.ini ()
let tpl = Sgn.ini ()
let prd = Sgn.ini ()
let coprd = Sgn.ini ()
let rcd = Sgn.ini ()
let rcd_end = Sgn.ini ()
let rcd_edo = Sgn.ini ()
let z = Sgn.ini ()
let stg = Sgn.ini ()
let arg = Sgn.ini ()
let root = Sgn.ini ()
type cxt = tm SgnMap.t
type c = (tm * tm) list
let (<+) x y = App(x,y)
let (-*) x y = (Prm imp)<+x<+y
let ( ** ) x y = (Prm tpl)<+x<+y
let rcd_cl l = List.fold_right (fun x r -> x**r) l (Prm rcd_end)
let rcd_op l = List.fold_right (fun x r -> x**r) l (Val (Sgn.ini()))

type name = string
type mdl = name * args * (glb_etr list)
and glb_etr =
  | Etr of etr
  | Flow of flow
  | Etr_Clq of etr list
  | Flow_Clq of flow list
  | Gram of Peg.grammar
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
and etr = string * tm * tm * code
(* <name> : <src> ⊢ <dst> ≒ <code> *)
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
  | Code_IO of exp * code
and exp = typ * opr * ((name * opr) list)
and opr =
  | Agl of opr
  | Opr_Z of int
  | Opr_Name of string
  | Opr_Rcd of opr list
  | Opr_App of opr * opr
  | Prj of opr * int
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
type buffer =
  | Evo of code
  | End
exception End
