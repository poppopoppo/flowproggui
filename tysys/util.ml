let pnt (b:bool) s =
  if b
  then (print_string s;flush stdout)
  else ()
let _ = pnt true ""

let rec string_of_list f p l =
  match l with
  | [] -> ""
  | x::[] -> p x
  | x::tl -> (p x)^f^(string_of_list f p tl)
exception OPEN_IN
exception P_F
let open_in_close (s:string) (p:Pervasives.in_channel -> 'a) : 'a =
  let f = (try open_in s with _ -> raise @@ OPEN_IN) in
  let v = (try p f with _ -> raise @@ P_F) in
  close_in f;v
let open_out_close (s:string) (p:Pervasives.out_channel -> 'a) : 'a =
  let f = open_out s in
  let v = p f in
  close_out f;v
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
