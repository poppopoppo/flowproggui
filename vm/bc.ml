type reg = int
type bc = op array
and op =
  | Prj of int * (int array)
  | Rcd of (int array) * ini
  | Ini of rcd_tkn * int
  | Id of int * (int array)
  | Call of (int array) * int * (int array)
  | Agl of (int array) * int * (int array)
  | Ret of int * (int array)
type vct = rcd_tkn array
let to_bin bc = 0
let of_bin bs = 0
