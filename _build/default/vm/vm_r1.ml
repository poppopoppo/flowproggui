open Types
let err s = raise (Failure s)
(* type plc = Plc of Sgn.t *)
type plc = int * int
type reg = Sgn.t
type nd =
  | Spt of regs * reg (* from heap to reg *)
  | Cns of reg * regs (* from reg to heap *)
  | Rm of reg
  | Id_R of regs * reg
  | Id_M of reg * reg
  | Agl_M of reg * reg * (plc array)
  | Agl_R of regs * reg * (plc array)
  | Call_MM of reg * reg * reg
  | Call_MR of reg * reg * regs
  | Call_RM of regs * reg * reg
  | Call_RR of regs * reg * regs
  | HCall of (src array) * ((reg * src) array)
  | Prd of reg * src * src * (plc array)
  | Nd_Clj of reg * src * src * plc
  | Ini_Tkn of reg * tkn
and src =
  | Src_Rcd of reg array
  | Src_Mno of reg
and regs = reg array
and asm = (src * (nd array)) array
and tkn =
  | Tkn_Unt
  | Rcd of ptr array
  | Tkn_Stg of string
  | Tkn_Z of int
  | Tkn_Bol of bool
  | Tkn_Sgn of Sgn.t
  | Tkn_CoP of int * ptr
  | Tkn_P of (plc array) * ptr * ptr
  | Tkn_Fnc of tkn_fnc
and tkn_fnc =
  | Pls
  | Mlt
  | Mns
  | Cmp
  | Eq
  | Inj of int
  | Cho of int
  | Fix
  | Exn
  | Fnc of plc (* jmp_ptr arg_ptr *)
  | Clj of plc * ptr (* jmp_ptr arg0 { arg0 x } *)
and ptr = Ptr_Reg of reg | Ptr_Hp of tkn ref
type st = (tkn option array) * (cs Stack.t)
and cs =
  | CS of plc * src * st_h (* return-plc * return-reg *)
  | CS_A of plc * src
  | CS_L of plc * src * st_h * (tkn option S_Ref.t)
  | CS_R of plc * src * st_h * (tkn option S_Ref.t)
and st_h = (reg * tkn) list

type code =
  | V of code * code
  | H of code array
  | E of exp
  | P of exp * code array
  | A of exp * code array
  | F of exp * int * code
and exp =
  | Prj of int * exp
  | Inj of int
  | Cho of int
  | Agl of exp
  | Rot
  | Unt
  | Atm of atm
  | Z of int
  | Stg of string
  | Rcd of exp array
  | App of exp * exp
and atm =
  | Pls
  | Mlt
  | Mns
  | Cmp
  | Eq
  | Fix
  | Exn
  | Etr of name
and name = string
