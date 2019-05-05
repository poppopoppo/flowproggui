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
    | Agl of t
    | Z of int
    | Plus of t * t
    | Mult of t * t
    | Gl_call of string
    | Rcd of t list
    | Root
    | App of t * t
    | L_App of t * t
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
    | CoPrd of {
        st : coprd;
        agl_flg : bool
      }
    | Unknown
    | IO of Exp.vh
  and coprd =
    | Pure of (int * t)
    | Mix of t list
  and exn =
    | Typing_Error of string
    | Error of string
end
type buf =
  | Evo of Exp.vh
  | Glb of Exp.glb_etr
  | Glb_mode of string * St.t

type evo_mode = Calc | Glb

type rcd_rtn =
  | RcdNml of St.t list
  | RcdAglMix of St.t list list
  | RcdAgl of int * St.t list

let rec evo (g:Glb_St.t) (s:St.t) (a:Exp.t) : St.t =
  match a with
  | Exp.Z z -> St.Z (Some z)
  | Exp.App (f,x) ->
    ( match (evo g s f,evo g s x) with
      | (St.IO f,x) -> evo_vh g x f
      | (St.Rcd l,St.Z (Some z)) -> (List.nth l z)
      | _ -> raise @@ Failure "error:evo:App:type unmatched"
    )
  | Exp.L_App (f,x) ->
    ( match (evo g s f,evo g s x) with
      | ((St.IO f),x) -> evo_vh g x f
      | ((St.Rcd l),(St.Z (Some z))) -> (List.nth l z)
      | _ -> raise @@ Failure "error:evo:L_App:type unmatched"
    )
  | Exp.Plus (x,y) ->
    ( match (evo g s x,evo g s y) with
      | (St.Z x,St.Z y) ->
        ( match (x,y) with
          | (Some x,Some y) -> (St.Z (Some (x+y)))
          | _ -> (St.Z None)
        )
      | _ -> raise @@ Failure "error:evo:type is unmatched"
    )
  | Exp.Mult (x,y) ->
    ( match (evo g s x,evo g s y) with
      | (St.Z x,St.Z y) ->
        ( match (x,y) with
          | (Some x,Some y) -> (St.Z (Some (x*y)))
          | _ -> (St.Z None)
        )
      | _ -> raise @@ Failure "error:evo:type is unmatched"
    )
  | Exp.Gl_call n ->
    ( try
      let f = List.assoc n g in
      (St.IO f)
    with
    | Not_found -> raise @@ Failure ("error:evo:global name "^n^" is not found")
    )
  | Exp.Rcd r ->
    let r' = List.map (evo g s) r in
    let r'' =
      (List.fold_left
         (fun l x ->
            match l with
            | RcdNml l ->
              ( match x with
                | St.CoPrd c ->
                  if c.agl_flg
                  then match c.st with
                    | St.Pure (i,v) -> RcdAgl (i,l@[v])
                    | St.Mix m -> RcdAglMix (List.map (fun a -> l@[a]) m)
                  else RcdNml (l@[St.CoPrd c])
                | x -> RcdNml (l@[x])
              )
            | RcdAgl (i,v) ->
              ( match x with
                | St.CoPrd c ->
                  if c.agl_flg
                  then raise @@ Failure "error:evo_top:RcdAgl"
                  else  RcdAgl (i,v@[St.CoPrd c])
                | x -> RcdAgl (i,v@[x])
              )
            | RcdAglMix m ->
              ( match x with
                | St.CoPrd c ->
                  if c.agl_flg
                  then raise @@ Failure "error:evo_top:RcdAglMix"
                  else RcdAglMix (List.map (fun w -> w@[St.CoPrd c]) m)
                | x -> RcdAglMix (List.map (fun w -> w@[x]) m)
              )
         ) (RcdNml []) r') in
    ( match r'' with
      | RcdNml l -> (St.Rcd l)
      | RcdAglMix ll ->
        St.CoPrd {
          st=St.Mix (List.map (fun l -> St.Rcd l) ll);
          agl_flg=true
        }
      | RcdAgl (i,l) ->
        St.CoPrd {
          st=St.Pure (i,St.Rcd l);
          agl_flg=true
        }
    )
  | Exp.Agl e ->
    let s' = evo g s e in
    ( match s' with
      | St.CoPrd c ->
        if c.agl_flg
        then raise @@ Failure "error:evo_top:Agl"
        else St.CoPrd { c with agl_flg=true }
      | St.Z None ->
        St.CoPrd { st=St.Mix [St.Rcd [];St.Rcd []]; agl_flg=true }
      | St.Z (Some z) ->
        if z=0
        then St.CoPrd { st=St.Pure (0,St.Rcd []); agl_flg=true }
        else St.CoPrd { st=St.Pure (1,St.Rcd []); agl_flg=true }
      | _ -> raise @@ Failure "error:evo_top:Agl:CoPrd"
    )
  | Exp.Root -> s
  | Exp.Exn s -> St.Exn (St.Error s)
and evo_vh (g:Glb_St.t) (s:St.t) (a:Exp.vh) : St.t =
  match a with
  | Exp.Seq (f0,f1) ->
    let s' = evo_vh g s f0 in
    let s'' = evo_vh g s' f1 in
    s''
  | Exp.Canon _ -> raise @@ Failure "error:evo_vh:Canon"
  | Exp.Exp e -> evo g s e
  | Exp.CoPrd l ->
    ( match s with
      | St.CoPrd c ->
        if c.agl_flg
        then ( match c.st with
            | St.Pure (i,p) -> evo_vh g p (List.nth l i)
            | St.Mix m ->
              St.CoPrd {
                st=St.Mix (List.map (fun (x,f) -> evo_vh g x f) (List.combine m l));
                agl_flg=false
              }
          )
        else raise @@ Failure "error:evo_vh:CoPrd:c.agl_flg=false"
      | _ -> raise @@ Failure "error:evo_vh:CoPrd"
    )
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
  | St.CoPrd c ->
    ( match c.st with
      | St.Pure (i,x) -> ("["^(string_of_int i)^"]|"^(string_of_st (d+1) x))
      | St.Mix m -> string_of_list "∐" (string_of_st (d+1)) m
    )
  | St.Unknown -> "??:?"
  | St.IO _ -> "IO:?"
let string_of_gl_st s = "gl_state # "^(string_of_list "," (fun (n,_) -> (n^"≒ ? ")) s)

let print_st st =
  print_string ("state # "^(string_of_st 0 st)^"\n");flush stdout
