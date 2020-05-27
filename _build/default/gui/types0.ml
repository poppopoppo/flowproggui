
type glb_etr =
  | Etr of etr
  | Def_Prd of prd
  | Def_CoPrd of coprd
and etr = string * typ * typ * code
(* <name> : <src> ⊢ <dst> ≒ <code> *)
and prd = string * ((typ * string) list)
and coprd = string *  ((typ * string) list)
and gl_st = glb_etr list
and typ =
  | Typ_App of typ * typ
  | DepTyp of opr * typ
  | Typ_Exn
  | Typ_Z
  | Typ_Sgn
  | Typ_Rcd of typ list
  | Typ_IO of typ * typ
  | Typ_Btm
  | Typ_Top
  | Typ_Null
  | Typ_For_All of string * typ
  | Typ_CoPrd of typ list
  | Typ_Prd of typ list
  | Typ_Name of string
  | Typ_Val of string

and code =
  | Id of typ
  | Seq of code * code
  | Canon of code list
  | Opr of typ * typ * opr
  | Code_CoPrd of code * (code list)
  | Code_Prd of (code list) * code
and opr =
  | Agl of opr
  | Opr_Z of int
  | Plus of opr * opr
  | Mult of opr * opr
  | Gl_call of string
  | Opr_Rcd of opr list
  | Root
  | Eq of opr * opr
  | App of opr * opr
  | Prj of opr * opr
  | Opr_Exn of string
  | Const of st
  | Opr_Sgn_Ini
and st = typ * tkn
and tkn =
  | Tkn_Exn of string
  | Tkn_Z of int
  | Tkn_Rcd of tkn list
  | Tkn_CoPrd of tkn list
  | Tkn_Prd of st * (code list)
  | Tkn_Null
  | Tkn_Btm
  | Tkn_IO of io
  | Tkn_Agl of tkn
  | Tkn_Sgn of int
and io =
  | IO_Code of gl_st * code
  | IO_Inj of int
  | IO_Cho of int
  | IO_Sgn
type mdl = string * (glb_etr list)
type buffer =
  | Evo of code
  | End
exception End
