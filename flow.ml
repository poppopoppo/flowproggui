let pnt s =
  print_string (s^"\n");flush stdout
let _ = pnt "test"
module Typ = struct
  type 'k t =
    | Z
    | Rcd of ('k t) list
    | Ax of 'k
end
module Exp = struct
  type t =
    | End
    | Seq of arr * t
    | Prd of t list
    | CoPrd of t list
  and arr =
    | Canon of arr list
    | Exp of gl_call
  and gl_call =
    | Poly of poly
    | Ax of string
    | Rcd of gl_call list
  and poly =
    | Val of int list
    | Z of int
    | Plus of poly * poly
    | Mult of poly * poly
  type gl_cod = string
end
module St = struct
  type t =
    | Z of int
    | Rcd of t list
end
let rec rcd_val v s =
  match (v,s) with
  | ([],St.Z z) ->  z
  | (h::t,St.Rcd l) -> rcd_val t (List.nth l h)
  | _ -> raise @@ Failure "error:rcd_val:"
let rec calc_poly s p =
  match p with
  | Exp.Val v -> rcd_val v s
  | Exp.Z z -> z
  | Exp.Plus (x,y) -> (calc_poly s x)+(calc_poly s y)
  | Exp.Mult (x,y) -> (calc_poly s x)*(calc_poly s y)
let rec calc (s:St.t) (a:Exp.arr) : St.t =
  match (s,a) with
  | (St.Z _,Exp.Canon _) -> raise @@ Failure "error:calc:type is unmatched"
  | (St.Rcd l,Exp.Canon o) ->
    St.Rcd (List.map (fun (s,a) -> calc s a) (List.combine l o))
  | (s,Exp.Exp (Exp.Poly p)) -> St.Z (calc_poly s p)
  | _ -> raise @@ Failure "error:calc:not defined"

let debug_flg = ref true
let pnt s = if !debug_flg=true then print_string s;flush stdout

type sol_flg = Comma | Plane
let rec string_of_list f p l =
  match l with
  | [] -> ""
  | x::[] -> p x
  | x::tl -> match f with
    |Comma -> (p x)^","^(string_of_list f p tl)
    | Plane -> (p x)^" "^(string_of_list f p tl)
let rec string_of_st s =
  match s with
  | St.Z z -> string_of_int z
  | St.Rcd l -> "{ "^(string_of_list Plane string_of_st l)^"}"
let print_st st =
  print_string ("state # "^(string_of_st st)^"\n");flush stdout

let load (s:string) =
  try
    let reg = Str.regexp ".+\\.st" in
    if (Str.string_match reg s 0)
    then
      let f = open_in s in
      let s0 = Marshal.from_channel f  in
      let _ = close_in f in
      let _ = Sys.remove s in
      s0
    else raise @@ Failure ("error:load: can't load "^s^". file prefix need to be st")
  with | Failure err -> raise @@ Failure err
       | err -> pnt "error:load\n"; raise err
let save (st:St.t) s =
  let reg = Str.regexp ".+\\.st" in
  if (Str.string_match reg s 0)
  then let f = open_out s in
    let _ = Marshal.to_channel f st [] in
    ()
  else raise @@ Failure "error:load: can't save to s. file prefix need to be st"
