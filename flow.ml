let pnt (b:bool) s =
  if b
  then (print_string (s^"\n");flush stdout)
  else ()
let _ = pnt true ""
let rec string_of_list f p l =
  match l with
  | [] -> ""
  | x::[] -> p x
  | x::tl -> (p x)^f^(string_of_list f p tl)

module Plc = struct
  type t =
    | Z
    | Rcd of t list
    | IO of t * t
    | Btm
    | Top
    | For_All of { xs:(string list); co_p:t; p:t }
    | CoPrd of { name:name; xs:string list; cns:(string * Plc.t) list }
    | Prd of { name:name; xs:string list; cns:(string * Plc.t) list }
    | Val of string
  and name = { xs:(t list); name:string }
  let rec string_of d x =
    match x with
    | Z -> "ℤ"
    | Rcd r ->
      if d=0
      then (string_of_list " " (string_of (d+1)) r)
      else "{ "^(string_of_list " " (string_of (d+1)) r)^" }"
    | Name n ->
      ( match n.xs with
      | [] -> n.name
      | _ -> n.name^"◂"^(string_of_list "◂" (string_of 0) n.xs)
      )
    | Top -> "?"
    | IO (src,dst) -> "("^(string_of (d+1) src)^"→"^(string_of (d+1) dst)^")"
    | Btm -> "⊥"
    | Val x -> "?"^x
    | For_All f ->
      "∀"^(string_of_list " " (fun x -> x) f.xs)^
      "."^(string_of 0 f.co_p)^"→"^(string_of 0 f.p)
    | _ -> raise @@ Failure "error:Plc.string_of"
end

module Code = struct
  type t =
    | Seq of t * t
    | Canon of t list
    | Opr of { src:Plc.t; dst:Plc.t; opr:opr }
    | CoPrd of { pre:t; post:t list }
    | Prd of { pre:t list; post:t }
  and opr =
    | Agl of opr
    | Z of int
    | Plus of opr * opr
    | Mult of opr * opr
    | Gl_call of string
    | Rcd of opr list
    | Root of int
    | App of opr * opr
    | Prj of opr * opr
    | IO of t
    | Exn of string
  let rec src (c:t) : Plc.t =
    match c with
    | Seq (s,d) -> src s
    | Canon l -> Plc.Rcd (List.map src l)
    | Opr o -> o.src
    | CoPrd j -> src j.pre
    | Prd j -> src (List.hd j.pre)
  let rec string_of x =
    match x with
    | Seq (a,b) -> (string_of a)^"\n» "^(string_of b)
    | Canon l -> "{~ "^(string_of_list " ¦ " string_of l)^" }"
    | Opr o -> "` "^(Plc.string_of 0 o.dst)^" : "^(string_of_opr o.opr)
    | CoPrd l -> (string_of l.pre)^(string_of_list "∐" string_of l.post)
    | Prd l -> (string_of_list "∏" string_of l.pre)^(string_of l.post)
  and string_of_opr x =
    match x with
    | Agl e -> "∠["^(string_of_opr e)^"]"
    | Z z -> string_of_int z
    | Plus (e1,e2) -> "("^(string_of_opr e1)^"+"^(string_of_opr e2)^")"
    | Mult (e1,e2) -> "("^(string_of_opr e1)^"*"^(string_of_opr e2)^")"
    | Gl_call n -> "#"^n
    | Rcd l -> "{"^(string_of_list " " string_of_opr l)^"}"
    | Root i -> "$"^(String.make i '\'')
    | App (f,x) -> "‡"^(string_of_opr f)^"."^(string_of_opr x)
    | App (f,x) -> "("^(string_of_opr f)^"◂"^(string_of_opr x)
    | Prj (f,x) -> "("^(string_of_opr f)^"◃"^(string_of_opr x)
    | IO c -> ".» "^(string_of c)
    | Exn s -> "¡"^s

end

module Glb_St = struct
  type glb_etr =
    | Etr of etr
    | Flow of flow
  and etr = { name : string; src:Plc.t; dst:Plc.t; code:Code.t }
  and flow =
    | CoPrd of { xs:string list; name:string; cns:(string * Plc.t) list }
    | Prd of { xs:string list; name:string; cns:(string * Plc.t) list }
  type t = glb_etr list
  let string_of (s:t) =
    let f gs =
      ( match gs with
        | Gl_Etr g ->
          ("§ "^g.name^" : "^(Plc.string_of 0 g.src)^" ⊢ "^(Plc.string_of 0 g.dst)^" ≒ ? ")
        | CoPrd g ->
          "¶ "^g.name^" ≃ "^(string_of_list "∐" (fun (n,_) -> n) g.cns)^" ≒ ?"
        | Prd g ->
          "¶ "^g.name^" ≃ "^(string_of_list "∏" (fun (n,_) -> n) g.cns)^" ≒ ?"
      )  in
    "gl_state # "^(string_of_list "," f s)

  let rec assoc (g:t) (k:key) : rtn =
    ( match g with
      | [] -> raise @@ Failure ("error:Glb_St:assoc:not found global entry "^n)
      | h::t ->
        ( match h with
          | Gl_Etr h ->
            if h.name=n
            then (None,Gl_Etr h)
            else assoc t n
          | CoPrd d ->
            ( try
                pnt true ("pnt:assoc:{n d.name}= {"^n^" "^d.name^" }");
                let (i,_) = BatList.findi (fun _ (k,_) -> n=k) d.cns in
                (Some i,CoPrd d)
              with | Not_found -> assoc t n )
          | Prd d ->
            ( try
                pnt true ("pnt:assoc:{n d.name}= {"^n^" "^d.name^" }");
                let (i,_) = BatList.findi (fun _ (k,_) -> n=k) d.cns in
                (Some i,Prd d)
              with | Not_found -> assoc t n )

        )
    )
end
module St = struct
  type t = { plc:Plc.t; tkn:tkn }
  and tkn =
    | Exn of string
    | Z of { z:(int option); agl_flg:bool }
    | Rcd of tkn list
    | CoPrd of { st:(tkn option) list; agl_flg : bool }
    | Prd of { st:t; gl_st:Glb_St.t; roots:t list; codes:Code.t list }
    | Unknown
    | IO of io
  and io =
    | Code of { gl_st:Glb_St.t; roots:t list; code : Code.t }
    | Inj of { name:Plc.name; f:int }
    | Cho of { name:Plc.name; f:int }
  let rec tkn_of_plc (p:Plc.t) : tkn =
    ( match p with
      | Plc.Z -> Z { z=None; agl_flg=false }
      | Rcd r -> Rcd (List.map tkn_of_plc r)
      | Name _ -> Unknown
      | IO (_,_) -> Unknown
      | Btm -> Unknown
      | For_All _ -> Unknown
      | _ -> Unknown
    )
  let rec string_of_tkn d s =
    match s with
    | Z z ->
      ( match z.z with
        | Some z -> (string_of_int z)
        | None -> "?"
      )
    | Rcd l ->
      let m = (string_of_list " " (string_of_tkn (d+1)) l) in
      if d=0 then ("{ "^m^" }") else ("{ "^m^" }")
    | Exn x -> "exn("^x^")"
    | CoPrd c ->
      "∐[ "^(string_of_list ","
                 (fun x ->
                    match x with
                    | None -> "⊥"
                    | Some x -> string_of_tkn 1 x.tkn)
                 c.st)^" ]"
    | Prd p -> "?"
    | Unknown -> "?"
    | IO io -> "io"

  let string_of (x:t) : string =
    "` "^(Plc.string_of 0 x.plc)^" : "^(string_of_tkn 0 x.tkn)
end

let rec tkn_in_plc (g:Glb_St.t) (p:Plc.t) (t:St.tkn) : bool =
  match p with
  | Z ->
    ( match t with
      | Exn _ -> true
      | Z _ -> true
      | Rcd _ -> false
      | CoPrd c -> false
      | Prd _ -> false
      | Unknown -> true
      | IO _ -> false
    )
  | Rcd r ->
    ( match t with
      | Exn _ -> true
      | Unknown -> true
      | Z _ -> false
      | Rcd v ->
        ( try
            List.for_all (fun (x,y) -> tkn_in_plc x y) (List.combine r v)
          with | Invalid_argument _ -> false )
      | _ -> false
    )
  | Name n ->
    ( match t with
      | Exn _ -> true
      | Z _ -> true
      | Rcd _ -> false
      | Unknown -> true
      | IO _ -> false

      | Exn _ -> true
      | CoPrd c ->
      let a = Glb_St.assoc n in
      let bind = List.combine a.xs n.xs in
      List.forall (fun (x,y) -> ) (List.combine a.cns c.cns)
      | CoPrd of { xs:string list; name:string; cns:(string * Plc.t) list }

        | CoPrd of { st:(t option) list; agl_flg : bool }

      | Unknown -> true
      | _ -> false
    )
  | IO (src,dst) ->
    ( match t with
      | Exn _ -> true
      | Unknown -> true
      | IO io ->
        ( match io with
          | Code c ->
            if c.src=src && c.dst=dst
            then true else false
          | Inj j ->
            if src=(snd (List.nth j.cns j.i)) && dst=(Plc.Name j.name)
            then true else false
          | Cho j ->
            if dst=(snd (List.nth j.cns j.i)) && src=(Plc.Name j.name)
            then true else false
        )
      | _ -> false
    )
  | Btm -> false
  | For_All _ -> false
  | _ -> false

let string_of_plc_tkn (b:bool) (p:Plc.t) (v:St.tkn) : string =
  if b
  then "` "^(Plc.string_of 0 p)^" : "^(St.string_of_tkn 0 v)
  else "` "^(Plc.string_of 0 p)^" ¬: "^(St.string_of_tkn 0 v)


module Buffer = struct
  type t =
    | Evo of Code.t
    | Glb of Glb_St.glb_etr
    | Glb_mode of { name : string; src : Plc.t; dst : Plc.t }
    | End
  exception End
end
type evo_mode = Calc | Glb

type rcd_rtn =
  | RcdNml of St.t list
  | RcdAglMix of string * (St.t list list)
  | RcdAgl of string * int * St.t list

let rec evo (g:Glb_St.t) (rs:St.t list) (s:St.t) (a:Code.opr) : St.t =
  ( match a with
    | Code.Z z -> { plc=a.dst; tkn=St.Z (Some z) }
    | Code.App (f,x) ->
      ( match (evo g rs s f,evo g rs s x) with
        | (St.IO f,x) ->
          let (src,_) = (St.src f,St.dst f) in
          if (tkn_in_plc src x)
          then (
            match f with
            | St.Code f -> evo_code g f.roots x f.code
            | St.Inj j ->
              CoPrd { name=j.name; st=St.Pure (j.i,x); agl_flg=false }
            | St.Cho j ->
              ( match x with
                | St.Prd p ->
                  evo_code p.gl_st p.roots p.st (List.nth p.codes j.i)
                | _ -> raise @@ Failure "error:Flow.evo:L_App:Cho:type unmatched"
              )
          )
          else raise @@ Failure (
              "error:Flow.evo:L_App:type unmatched\n"^
              (string_of_plc_tkn false src x))
        | (St.Rcd l,St.Z (Some z)) -> (List.nth l z)
        | _ -> raise @@ Failure "error:Flow.evo:L_App:type unmatched"
      )
    | Code.Prj (f,x) ->
      ( match (evo g rs s f,evo g rs s x) with
        | ((St.Rcd l),(St.Z (Some z))) -> (List.nth l z)
        | (f',x') -> raise @@ Failure
            ("error:Flow.evo:L_Prj:type unmatched\n"^
             (St.string_of 0 f')^" ◃ "^(St.string_of 0 x'))
      )
    | Code.Plus (x,y) ->
      ( match (evo g rs s x,evo g rs s y) with
        | (St.Z x,St.Z y) ->
          ( match (x,y) with
            | (Some x,Some y) -> (St.Z (Some (x+y)))
            | _ -> (St.Z None)
          )
        | (x,y) ->
          let (px,py) = (St.string_of 0 x,St.string_of 0 y) in
          let msg = "error:evo:type is unmatched\n"^px^" + "^py^"\n" in
          raise @@ Failure msg
      )
    | Code.Mult (x,y) ->
      ( match (evo g rs s x,evo g rs s y) with
        | (St.Z x,St.Z y) ->
          ( match (x,y) with
            | (Some x,Some y) -> (St.Z (Some (x*y)))
            | _ -> (St.Z None)
          )
        | (x,y) ->
          let (px,py) = (St.string_of 0 x,St.string_of 0 y) in
          let msg = "error:evo:type is unmatched\n"^px^" * "^py^"\n" in
          raise @@ Failure msg
      )
    | Code.Gl_call n ->
      ( try
          let (i,f) = Glb_St.assoc g n in
          match (i,f) with
          | (_,Gl_Etr f) -> St.IO (St.Code { src=f.src; dst=f.dst; roots=[]; code=f.code })
          | (Some i,Dta_Def (Data.CoPrd c)) ->
            St.IO (St.Inj { i=i; name=c.name; cns=c.cns })
          | _ -> raise @@ Failure "error:evo:Gl_call:option"
        with
        | Not_found -> raise @@ Failure ("error:evo:global name "^n^" is not found")
      )
    | Code.Rcd r ->
      let r' = List.map (evo g rs s) r in
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
          St.CoPrd { name=n; st=St.Mix (List.map (fun l -> St.Rcd l) ll); agl_flg=true }
        | RcdAgl (n,i,l) ->
          St.CoPrd { name=n; st=St.Pure (i,St.Rcd l); agl_flg=true }
      )
    | Code.Agl e ->
      let s' = evo g rs s e in
      ( match s' with
        | St.CoPrd c ->
          if c.agl_flg
          then raise @@ Failure "error:evo_top:Agl"
          else St.CoPrd { c with agl_flg=true }
        | St.Z None ->
          St.CoPrd { name="ℤ"; st=St.Mix [St.Rcd [];St.Rcd []]; agl_flg=true }
        | St.Z (Some z) ->
          if z=0
          then St.CoPrd { name="ℤ"; st=St.Pure (0,St.Rcd []); agl_flg=true }
          else St.CoPrd { name="ℤ"; st=St.Pure (1,St.Rcd []); agl_flg=true }
        | _ -> raise @@ Failure "error:evo_top:Agl:CoPrd"
      )
    | Code.Root i ->
      ( try
          List.nth (s::rs) i
        with
        | _ -> raise @@ Failure
            ("error:evo:Code.Root "^(string_of_int i)^"\n"^
             "[ "^(string_of_list " ; " (St.string_of 0) (s::rs))^"]")
      )
    | Code.IO f ->
      St.IO (St.Code { src=Plc.Mt; dst=Plc.Mt; roots=(s::rs); code=f })
    | Code.Exn e -> St.Exn (St.Error e)
  )
and evo_code (g:Glb_St.t) (rs:St.t list)(s:St.t) (a:Code.t) : St.t =
  ( match a with
    | Code.Seq (f0,f1) ->
      let s' = evo_code g rs s f0 in
      let s'' = evo_code g rs s' f1 in
      s''
    | Code.Canon l ->
      ( match s with
        | St.Rcd v ->
          St.Rcd (List.map (fun (t,x) -> evo_code g rs x t) (List.combine l v))
        | _ -> raise @@ Failure "error:evo_code:Canon"
      )
    | Code.Opr o ->
      if (tkn_in_plc o.src s.tkn)
      then
        let s' = evo g rs s.tkn o.opr in
        if (tkn_in_plc o.dst s')
        then { plc=o.dst; tkn=s' }
        else raise @@ Failure "error:evo_code:Opr:place theck error"
      else raise @@ Failure
          ("error:evo_code:Exp:tkn unmatched to place\n"^
           (string_of_plc_tkn o.dst s'))
    | Code.CoPrd l ->
      ( match s with
        | St.CoPrd c ->
          if c.agl_flg
          then ( match c.st with
              | St.Pure (i,p) -> evo_code g rs p (List.nth l i)
              | St.Mix m ->
                St.CoPrd { name=c.name;
                           st=St.Mix (List.map (fun (x,f) -> evo_code g rs x f) (List.combine m l));
                           agl_flg=false
                         }
            )
          else raise @@ Failure "error:evo_code:CoPrd:c.agl_flg=false"
        | _ -> raise @@ Failure "error:evo_code:CoPrd"
      )
  )

let check_io (g : Glb_St.t) (rs : St.t list) (c : Code.t) (src:Plc.t) (dst:Plc.t) : bool =
  let (s,_) = (tkn_of_plc src,tkn_of_plc dst) in
  let v = evo_code g rs s c in
  tkn_in_plc dst v

let print_st st =
  print_string ("state # "^(St.string_of 0 st)^"\n");flush stdout
