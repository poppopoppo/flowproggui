type app =
  | Val of int
  | App of app * app
and typ =
  | Typ_Prm of int
  | Typ_Val of int
  | Imp of typ * typ
let shift y i =
  ( match y with
    | Typ_Prm  -> y
    | Typ_Val j -> Typ_Val i+j
    | Imp (a0,a1) -> Imp (shift a0 i,shift a1 i)
  )
let subst a0 p =
  let (f,(i,a1)) = (subst,p) in
  ( match a0 with
    | Val j ->
      if i=j
      then a1 else a0
    | App(b0,b1) -> App(f b0 p,f b1 p)
  )
let subst_typ t0 (i,t1) =
  let f = subst_typ in
  ( match t0 with
    | Typ_Prm _ -> t0
    | Typ_Val j -> if i=j then t1 else t0
    | Imp (s0,s1) -> Imp(f s0 (i,t1),f s1 (i,t1))
  )
type cxt = (typ option) list
let rec add c (i,t) =
  ( match c with
    | [] -> if i=0 then [Some t] else None::(add [] (i-1,t))
    | hd::tl ->
      if i=0
      then (Some t)::tl
      else hd::(add tl (i-1,t))
  )
let new_typ_val c =
  let new_val y =
    ( match y with
      | Typ_Prm _ -> 0
      | Typ_Val i -> i+1
      | Imp (a0,a1) -> (max (new_val a0) (new_val a1))
    ) in
  List.fold_left
    (fun a b ->
       (match b with
        | None -> a
        | Some b -> max (new_val b) a))
    0 c
let typing (c:cxt) (a:app) : (cxt * typ) =
  ( match a with
    | Val t ->
      if (List.length c)=<t
      then
        let q = new_typ_val c in
        (add c (t,Typ_Val q),Typ_Val q)
      else (c,List.nth c t)
    | App (a0,a1) ->
      
