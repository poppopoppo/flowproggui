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
  | Axm of Sgn.t
