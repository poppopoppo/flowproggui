let pnt (b:bool) s =
  if b
  then (print_string s;flush stdout)
  else ()
let _ = pnt true ""
let string_of_array f p l =
  BatArray.fold_left
    ( fun a b -> a^p^(f b)) l
let rec string_of_list f p l =
  match l with
  | [] -> ""
  | x::[] -> p x
  | x::tl -> (p x)^f^(string_of_list f p tl)
let open_in_close (s:string) (p:Pervasives.in_channel -> 'a) : 'a =
  let f = open_in s in
  let v = p f in
  close_in f;v
let open_out_close (s:string) (p:Pervasives.out_channel -> 'a) : 'a =
  let f = open_out s in
  let v = p f in
  close_out f;v
