let pnt s =
  print_string (s^"\n");flush stdout
let _ = pnt "test"
module Exp = struct
  type vh =
    | Seq of vh * vh
    | Canon of vh list
    | Exp of t
    | CoPrd of vh list
  and t =
    | Z of int
    | Plus of t * t
    | Mult of t * t
    | Gl_call of string
    | Rcd of t list
    | Root
    | App of t * t
    | L_App of t * t
    | Agl of t
    | Exn of string
  type gl_cod = string
  type glb_etr = string * vh
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
    | Z of (int option)
    | Rcd of t list
    | Exn of exn
    | CoPrd of (int * t)
    | CoPrdMix of {
        mix:t list;
        agl_flg : bool
      }
    | Unknown
    | IO of Exp.vh
  and exn =
    | Typing_Error of string
    | Error of string
end
type buf =
  | Evo of Exp.vh
  | Glb of Exp.glb_etr
  | Glb_mode of string * St.t

type evo_mode = Calc | Glb
type evo_rtn =
  | Nml of St.t
  | AglMix of St.t list
  | Agl of int * St.t
type rcd_rtn =
  | RcdNml of St.t list
  | RcdAglMix of St.t list list
  | RcdAgl of int * St.t list

let rec evo (g:Glb_St.t) (s:St.t) (a:Exp.t) : evo_rtn =
  match a with
  | Exp.Z z -> Nml (St.Z (Some z))
  | Exp.Plus (x,y) ->
    ( match (evo g s x,evo g s y) with
      | (Nml (St.Z x),Nml (St.Z y)) ->
        ( match (x,y) with
          | (Some x,Some y) -> Nml (St.Z (Some (x+y)))
          | _ -> Nml (St.Z None)
        )
      | _ -> raise @@ Failure "error:evo:type is unmatched"
    )
  | Exp.Mult (x,y) ->
    ( match (evo g s x,evo g s y) with
      | (Nml (St.Z x),Nml (St.Z y)) ->
        ( match (x,y) with
          | (Some x,Some y) -> Nml (St.Z (Some (x*y)))
          | _ -> Nml (St.Z None)
        )
      | _ -> raise @@ Failure "error:evo:type is unmatched"
    )
  | Exp.Gl_call n ->
    let f = List.assoc n g in
    Nml (St.IO f)
  | Exp.Rcd r ->
    let r' = List.map (evo g s) r in
    let r'' =
      (List.fold_left
         (fun l x ->
            match (l,x) with
            | (RcdNml l,Nml x) -> RcdNml (l@[x])
            | (RcdNml l,AglMix x) -> RcdAglMix (List.map (fun a -> l@[a]) x)
            | (RcdAglMix ll,Nml x) -> RcdAglMix (List.map (fun l -> l@[x]) ll)
            | (RcdAglMix _,AglMix _) ->
              raise @@ Failure "error:evo:type is unmatched"
            | _ -> raise @@ Failure "error:evo:Rcd:test"
         ) (RcdNml []) r') in
    ( match r'' with
      | RcdNml l -> Nml (St.Rcd l)
      | RcdAglMix ll -> AglMix (List.map (fun l -> St.Rcd l) ll)
      | RcdAgl (i,l) -> Agl (i,St.Rcd l)
    )
  | Exp.Root -> Nml s
  | Exp.App (f,x) ->
    ( match (evo g s f,evo g s x) with
      | (Nml (St.IO f),x) -> evo_vh g x f
      | (Nml (St.Rcd l),Nml (St.Z (Some z))) -> Nml (List.nth l z)
      | _ -> raise @@ Failure "error:evo_vh:App:type unmatched"
    )
  | Exp.L_App (f,x) ->
    ( match (evo g s f,evo g s x) with
      | (Nml (St.IO f),x) -> evo_vh g x f
      | (Nml (St.Rcd l),Nml (St.Z (Some z))) -> Nml (List.nth l z)
      | _ -> raise @@ Failure "error:evo_vh:App:type unmatched"
    )
  | Exp.Agl e ->
    ( match evo g s e with
      | Nml (St.Z (Some z)) ->
        if (z=0)
        then Agl (0,(St.Rcd []))
        else Agl (1,(St.Rcd []))
      | Nml (St.Z None) -> AglMix [St.Rcd [];St.Rcd []]
      | Nml (St.Rcd _) ->
        raise @@ Failure "error:∠ can not apply to record type"
      | Nml (St.Exn x) -> Nml (St.Exn x)
      | Nml (St.CoPrd (i,x)) -> Agl (i,x)
      | Nml (St.CoPrdMix l) -> AglMix l.mix
      | Nml St.Unknown -> Nml St.Unknown
      | _ -> raise @@ Failure "error:evo:Exp.Agl:double angle"
    )
  | Exp.Exn s -> Nml (St.Exn (St.Error s))
and evo_vh (g:Glb_St.t) (s:evo_rtn) (a:Exp.vh) : evo_rtn =
  match a with
  | Exp.Seq (f0,f1) ->
    let s' = evo_vh g s f0 in
    let s'' = evo_vh g s' f1 in
    s''
  | Exp.Canon _ -> raise @@ Failure "error:evo_vh:Canon"
  | Exp.Exp e ->
    ( match s with
      | Nml v -> evo g v e
      | Agl _ -> raise @@ Failure "error:evo_vh:Exp:angle"
      | AglMix _ -> raise @@ Failure "error:evo_vh:Exp:AglMix"
    )
  | Exp.CoPrd _ -> raise @@ Failure "error:evo_vh:CoPrd"
let debug_flg = ref true
let pnt s = if !debug_flg=true then print_string s;flush stdout

type sol_flg = Comma | Plane
let rec string_of_list f p l =
  match l with
  | [] -> ""
  | x::[] -> p x
  | x::tl -> (p x)^f^(string_of_list f p tl)
let rec string_of_st d s =
  match s with
  | St.Z z ->
    ( match z with
      | Some z -> ("ℤ:"^(string_of_int z))
      | None -> ("ℤ:?")
    )
  | St.Rcd l ->
    let m = (string_of_list " " (string_of_st (d+1)) l) in
    if d=0 then m else ("{ "^m^" }")
  | St.Exn x ->
    (match x with
     | St.Typing_Error e -> "exn("^e^")"
     | St.Error e -> "exn("^e^")"
    )
  | St.CoPrd (i,x) ->
    ("["^(string_of_int i)^"]|"^(string_of_st (d+1) x))
  | St.CoPrdMix l -> "[ "^(string_of_list "|" (string_of_st (d+1)) l.mix)^" ]"
  | St.Unknown -> "??:?"
  | St.IO _ -> "IO:?"
let string_of_gl_st s = "gl_state # "^(string_of_list "," (fun (n,_) -> (n^"≒ ? ")) s)

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
