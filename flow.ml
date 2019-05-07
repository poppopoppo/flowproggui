let pnt s =
  print_string (s^"\n");flush stdout
let _ = pnt ""
let rec string_of_list f p l =
  match l with
  | [] -> ""
  | x::[] -> p x
  | x::tl -> (p x)^f^(string_of_list f p tl)

module Plc = struct
  type t =
    | Z
    | Rcd of t list
    | Exn
    | Name of string
    | PM
    | Mt
  let rec string_of x =
    match x with
    | Z -> "ℤ"
    | Rcd r -> "{ "^(string_of_list " " string_of r)^" }"
    | Exn -> "¿=(Exn)"
    | Name n -> n
    | PM -> "?+"
    | Mt -> "?"
end

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

end

module Data = struct
  type t =
      CoPrd of {
        name : string;
        cns : (string * Plc.t) list
      }
end

module Glb_St = struct
  type glb_etr =
    | Gl_Etr of {
        name : string;
        src : Plc.t;
        dst : Plc.t;
        code : Exp.vh
      }
    | Dta_Def of Data.t
  type t = glb_etr list
  let rec assoc (g:t) (n:string) : (int option * glb_etr) =
    ( match g with
      | [] -> raise @@ Failure ("error:Glb_St:assoc:not found global entry "^n)
      | h::t ->
        ( match h with
          | Gl_Etr h ->
            if h.name=n
            then (None,Gl_Etr h)
            else assoc t n
          | Dta_Def (Data.CoPrd d) ->
            try
              pnt ("pnt:assoc:{n d.name}= {"^n^" "^d.name^" }");
              let (i,_) = BatList.findi (fun _ (k,_) -> n=k) d.cns in
              (Some i,Dta_Def (Data.CoPrd d))
            with | Not_found -> assoc t n
        )
    )
end

module St = struct
  type t =
    | Z of (int option)
    | Rcd of t list
    | Exn of exn
    | CoPrd of {
        name : string;
        st : coprd;
        agl_flg : bool
      }
    | Unknown
    | IO of Exp.vh
    | Inj of (int * Data.t)
  and coprd =
    | Pure of (int * t)
    | Mix of t list
  and exn =
    | Typing_Error of string
    | Error of string
end
type buf =
  | Evo of Exp.vh
  | Glb of Glb_St.glb_etr
  | Glb_mode of string * St.t
  | Def of Data.t
type evo_mode = Calc | Glb

type rcd_rtn =
  | RcdNml of St.t list
  | RcdAglMix of string * (St.t list list)
  | RcdAgl of string * int * St.t list

let rec evo (g:Glb_St.t) (s:St.t) (a:Exp.t) : St.t =
  match a with
  | Exp.Z z -> St.Z (Some z)
  | Exp.App (f,x) ->
    ( match (evo g s f,evo g s x) with
      | (St.IO f,x) -> evo_vh g x f
      | (St.Rcd l,St.Z (Some z)) -> (List.nth l z)
      | (St.Inj (i,c),x) ->
        ( match c with
          | Data.CoPrd c ->
            CoPrd {
              name=c.name;
              st=St.Pure (i,x);
              agl_flg=false
            }
        )
      | _ -> raise @@ Failure "error:evo:App:type unmatched"
    )
  | Exp.L_App (f,x) ->
    ( match (evo g s f,evo g s x) with
      | ((St.IO f),x) -> evo_vh g x f
      | (St.Inj (i,c),x) ->
        ( match c with
          | Data.CoPrd c ->
            CoPrd {
              name=c.name;
              st=St.Pure (i,x);
              agl_flg=false
            }
        )
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
        let (i,f) = Glb_St.assoc g n in
        match (i,f) with
        | (_,Gl_Etr f) -> (St.IO f.code)
        | (Some i,Dta_Def f) -> St.Inj (i,f)
        | _ -> raise @@ Failure "error:evo:Gl_call:option"
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
                    | St.Pure (i,v) -> RcdAgl (c.name,i,l@[v])
                    | St.Mix m -> RcdAglMix (c.name,(List.map (fun a -> l@[a]) m))
                  else RcdNml (l@[St.CoPrd c])
                | x -> RcdNml (l@[x])
              )
            | RcdAgl (n,i,v) ->
              ( match x with
                | St.CoPrd c ->
                  if c.agl_flg
                  then raise @@ Failure "error:evo_top:RcdAgl"
                  else  RcdAgl (n,i,v@[St.CoPrd c])
                | x -> RcdAgl (n,i,v@[x])
              )
            | RcdAglMix (n,m) ->
              ( match x with
                | St.CoPrd c ->
                  if c.agl_flg
                  then raise @@ Failure "error:evo_top:RcdAglMix"
                  else RcdAglMix (n,(List.map (fun w -> w@[St.CoPrd c]) m))
                | x -> RcdAglMix (n,(List.map (fun w -> w@[x]) m))
              )
         ) (RcdNml []) r') in
    ( match r'' with
      | RcdNml l -> (St.Rcd l)
      | RcdAglMix (n,ll) ->
        St.CoPrd {
          name=n;
          st=St.Mix (List.map (fun l -> St.Rcd l) ll);
          agl_flg=true
        }
      | RcdAgl (n,i,l) ->
        St.CoPrd {
          name=n;
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
        St.CoPrd { name="Z"; st=St.Mix [St.Rcd [];St.Rcd []]; agl_flg=true }
      | St.Z (Some z) ->
        if z=0
        then St.CoPrd { name="Z"; st=St.Pure (0,St.Rcd []); agl_flg=true }
        else St.CoPrd { name="Z"; st=St.Pure (1,St.Rcd []); agl_flg=true }
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
                name=c.name;
                st=St.Mix (List.map (fun (x,f) -> evo_vh g x f) (List.combine m l));
                agl_flg=false
              }
          )
        else raise @@ Failure "error:evo_vh:CoPrd:c.agl_flg=false"
      | _ -> raise @@ Failure "error:evo_vh:CoPrd"
    )
let debug_flg = ref true
let pnt s = if !debug_flg=true then print_string s;flush stdout

let rec string_of_st d s =
  match s with
  | St.Z z ->
    ( match z with
      | Some z -> ("ℤ:"^(string_of_int z))
      | None -> ("ℤ:?")
    )
  | St.Rcd l ->
    let m = (string_of_list " " (string_of_st (d+1)) l) in
    if d=0 then ("{ "^m^" }") else ("{ "^m^" }")
  | St.Exn x ->
    (match x with
     | St.Typing_Error e -> "exn("^e^")"
     | St.Error e -> "exn("^e^")"
    )
  | St.CoPrd c -> c.name^":?"
    (*
    ( match c.st with
      | St.Pure (i,x) -> ("["^(string_of_int i)^"]|"^(string_of_st (d+1) x))
      | St.Mix m -> string_of_list "∐" (string_of_st (d+1)) m
    )
    *)
  | St.Unknown -> "??:?"
  | St.IO _ -> "IO:?"
  | St.Inj (_,c) ->
    ( match c with
      | Data.CoPrd c -> ("??→"^c.name^":?")
    )
let string_of_gl_st (s:Glb_St.t) =
  let f gs =
    ( match gs with
    | Glb_St.Gl_Etr g -> 
    ("§ "^g.name^" : "^(Plc.string_of g.src)^" ⊢ "^(Plc.string_of g.dst)^" ≒ ? ")
    | Glb_St.Dta_Def (Data.CoPrd g) ->
      "¶ "^g.name^" = "^(string_of_list "|" (fun (n,_) -> n) g.cns)^" ≒ ?"
    )  in
  "gl_state # "^(string_of_list "," f s)

let print_st st =
  print_string ("state # "^(string_of_st 0 st)^"\n");flush stdout
