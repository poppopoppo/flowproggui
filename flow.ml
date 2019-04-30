let pnt s =
  print_string (s^"\n");flush stdout
let _ = pnt "test"
module Exp = struct
  type t =
    | End
    | Prd of t list
  and exp =
    | Seq of exp * exp
    | Canon of exp list
    | Z of int
    | Plus of exp * exp
    | Mult of exp * exp
    | Gl_call of string
    | Rcd of exp list
    | Root
    | App of exp * exp
    | L_App of exp * exp
    | Agl of exp
    | CoPrd of exp * exp
  type gl_cod = string
  type glb_etr = string * exp
  type buf = Evo of exp | Glb of glb_etr
end
module Glb_St = struct
  type t = Exp.glb_etr list
end
module Typ = struct
  type t =
    | Z
    | Rcd of t list
    | Exn
    | CoPrd of t list
end
module St = struct
  type t =
    | Z of int
    | Rcd of t list
    | Exn of exn
    | CoPrd of (int * t)
  and exn =
    | Typing_Error of string
    | Error of string
end

let evo (g:Glb_St.t)(s:St.t) (a:Exp.exp) : St.t =
  let agl_flg = ref None in
  let rec evo_r g s a =
    match a with
    | Exp.Seq (e1,e2) ->
      let s' = evo_r g s e1 in
      let s'' = evo_r g s' e2 in
      s''
    | Exp.Canon l ->
      (match s with
       | St.Rcd r -> St.Rcd (List.map (fun (s,a) -> evo_r g s a) (List.combine r l))
       | St.Exn x -> St.Exn x
       | _ -> raise @@ Failure "error:evo:type is unmatched"
      )
    | Exp.Z z -> St.Z z
    | Exp.Plus (x,y) ->
      let (x,y) = (evo_r g s x,evo_r g s y) in
      (match (x,y) with
       | (St.Z x,St.Z y) -> St.Z (x+y)
       | _ -> raise @@ Failure "error:evo:type is unmatched" )
    | Exp.Mult (x,y) ->
      let (x,y) = (evo_r g s x,evo_r g s y) in
      (match (x,y) with
       | (St.Z x,St.Z y) -> St.Z (x*y)
       | _ -> raise @@ Failure "error:evo:type is unmatched" )

    | Exp.Gl_call g -> raise @@ Failure ("error:evo:Gl_call "^g)
    | Exp.Rcd r -> St.Rcd (List.map (fun a -> evo_r g s a) r)
    | Exp.Root -> s
    | Exp.App (Exp.Gl_call a,x) ->
      let (f,x) = (List.assoc a g,evo_r g s x) in
      evo_r g x f
    | Exp.App (f,x) ->
      (match (evo_r g s f,evo_r g s x) with
       | (St.Rcd l,St.Z z) -> List.nth l z
       | _ -> raise @@ Failure "error:evo:App"
      )
    | Exp.L_App (Exp.Gl_call a,x) ->
      (
        try
          let (f,x) = (List.assoc a g,evo_r g s x) in
          evo_r g x f
        with Not_found -> raise @@  Failure ("error:evo:L_App:Not_found:"^a)
      )
    | Exp.L_App (f,x) ->
      (match (evo_r g s f,evo_r g s x) with
       | (St.Rcd l,St.Z z) -> List.nth l z
       | _ -> raise @@ Failure "error:evo:L_App"
      )
    | Exp.Agl e ->
      (
        match !agl_flg with
        | None -> (
            match evo_r g s e with
            | St.Z z ->
              if (z=0)
              then (agl_flg:=(Some 0);(St.Rcd []))
              else (agl_flg:=(Some 1);(St.Rcd []))
            | St.Rcd _ -> St.Exn (St.Typing_Error "error:∠ can not apply to record type")
            | St.Exn x -> St.Exn x
            | St.CoPrd (i,x) -> (agl_flg:=(Some i);x)
          )
        | Some _ -> raise @@ Failure "error:evo:Exp.Agl:syntax error. can't exist double angle operator"
      )
    | Exp.CoPrd (e0,e1) ->
      (
        match s with
        | St.CoPrd (i,x) ->
          if i=0 then (evo_r g x e0)
          else if i=1 then (evo_r g x e1)
          else (St.Exn (St.Error "error:Coprd:St.CoPrd"))
        | St.Exn x -> St.Exn x
        | St.Z z ->
          (if (z=0)
           then (evo_r g (St.Rcd []) e0)
           else (evo_r g (St.Rcd []) e1)
          )
        | _ -> St.Exn (St.Error "error:Coprd:St.Exn")
      ) in
  let s' = evo_r g s a in
  match !agl_flg with
  | None -> s'
  | Some i -> St.CoPrd (i,s')

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
let rec string_of_st d s =
  match s with
  | St.Z z -> string_of_int z
  | St.Rcd l ->
    let m = (string_of_list Plane (string_of_st (d+1)) l) in
    if d=0 then m else ("{ "^m^" }")
  | St.Exn x ->
    (match x with
     | St.Typing_Error e -> "exn("^e^")"
     | St.Error e -> "exn("^e^")"
    )
  | St.CoPrd (i,x) ->
    ("["^(string_of_int i)^"]|"^(string_of_st (d+1) x))
let string_of_gl_st s = "gl_state # "^(string_of_list Comma (fun (n,_) -> (n^"≒ ? ")) s)

let print_st st =
  print_string ("state # "^(string_of_st 0 st)^"\n");flush stdout

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
