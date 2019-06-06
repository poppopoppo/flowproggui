type name = string
type mdl = name * args * (glb_etr list)
and glb_etr =
  | Etr of etr
  | Flow of flow
  | Etr_Clq of etr list
  | Flow_Clq of flow list
and flow =
  | Def_Abs of name * args
  | Def_Prd of name * args * ((typ * name) list)
  | Def_CoPrd of name * args * ((typ * name) list)
  | Def_Fnt of name list
  | Def_Eqv of name * args * typ
and args = arg list
and arg =
  | Arg_Val of string
  | Arg_Rcd of arg list
and etr = string * typ * typ * code
(* <name> : <src> ⊢ <dst> ≒ <code> *)

and gl_st = glb_etr list
and typ =
  | Typ_App of typ * typ
  | DepTyp of opr * typ
  | Typ_Exn
  | Typ_Z
  | Typ_Sgn
  | Typ_Stg
  | Typ_Opn of typ
  | Typ_Opn_Vct of typ * typ
  | Typ_Vct of typ * typ
  | Typ_Rcd of typ list
  | Typ_IO of typ * typ
  | Typ_Btm
  | Typ_Top
  | Typ_Null
  | Typ_For_All of string * typ
  | Typ_CoPrd of typ list
  | Typ_Prd of typ list
  | Typ_Name of name
  | Typ_Val of string
and st = typ * tkn
and code =
  | Rtn of int
  | Seq of top_exp * code
  | Canon of (code list) * code
  | Code_CoPrd of top_exp * (code list) * code
  | Code_Prd of top_exp * (code list) * code
  | Code_IO of int * top_exp * code * code
and top_exp = typ * opr * ((name * opr) list)
and opr =
  | Agl of opr
  | Opr_Z of int
  | Opr_Name of string
  | Opr_Rcd of opr list
  | Root of int
  | Self of int
  | App of opr * opr
  | Prj of opr * opr
  | Cast of opr
  | Opr_None
  | Opr_Some of opr
  | Opr_Exn
  | Opr_Stg of string
and tkn =
  | Tkn_Exn of string
  | Tkn_Z of int
  | Tkn_Rcd of tkn list
  | Tkn_CoPrd of tkn list
  | Tkn_Prd of st * (code list)
  | Tkn_Null
  | Tkn_Btm
  | Tkn_IO_Inj of int
  | Tkn_IO_Cho of int
  | Tkn_IO_Sgn
  | Tkn_IO_Code of st *  code
  | Tkn_IO_Plus
  | Tkn_IO_Mult
  | Tkn_Arg of int
  | Tkn_Agl of tkn
  | Tkn_Sgn of int
  | Tkn_Stg of string
type buffer =
  | Evo of code
  | End
exception End
