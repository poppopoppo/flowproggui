(*
type tkn =
  | Tkn_Unt
  | Tkn_Stg of string
  | Tkn_Z of int
  | Tkn_Bol of bool
  | Tkn_Sgn of Sgn.t
  | Tkn_Tns of Sgn.t * Sgn.t
  | Tkn_InjL of Sgn.t
  | Tkn_InjR of Sgn.t
type st = (Sgn.t , tkn) Hashtbl.t
let get_k v p =
  ( try
      let k = Hashtbl.find v p in
      Hashtbl.remove v p;
      k
    with _ -> raise (Failure "vm0.get:0"))
let set_k v p k =
  Hashtbl.remove v p;
  Hashtbl.add v p k
type gst = st * (cs Stack.t)
and cs =
  | CS of Sgn.t * st
  | CS_L of Sgn.t * st * (Mutex.t * (st option ref))
  | CS_R of Sgn.t * st * (Mutex.t * (st option ref))
type op =
  | Id of Sgn.t * Sgn.t
  | Rm of Sgn.t
  | Agl of Sgn.t * Sgn.t
  | Prd of Sgn.t * Sgn.t
  | Fnc of Sgn.t * Sgn.t
  | PrjL of Sgn.t * Sgn.t
  | PrjR of Sgn.t * Sgn.t
  | InjL of Sgn.t * Sgn.t
  | InjR of Sgn.t * Sgn.t
  | ChoL of Sgn.t * Sgn.t
  | ChoR of Sgn.t * Sgn.t
  | Cns of Sgn.t * (Sgn.t * Sgn.t)
  | Call of Sgn.t * (Sgn.t * Sgn.t)
  | HCall of Sgn.t * (Sgn.t * Sgn.t) * (Sgn.t * Sgn.t)
  | Ini_Z of Sgn.t * int
  | Ini_Stg of Sgn.t * string
  | Ini_Bol of Sgn.t * bool
  | Ini_Sgn of Sgn.t
  | Eq of Sgn.t * (Sgn.t * Sgn.t)
  | Rpc of (Sgn.t * Sgn.t) * Sgn.t
  | Fix of Sgn.t * Sgn.t
  | Add of Sgn.t * (Sgn.t * Sgn.t)
  | Mul of Sgn.t * (Sgn.t * Sgn.t)
  | Sub of Sgn.t * (Sgn.t * Sgn.t)
  | Cmp of Sgn.t * (Sgn.t * Sgn.t)
  | Exn of Sgn.t * Sgn.t
type asm = (Sgn.t, pt) Hashtbl.t
and pt =
  | Ret
  | Op of op * Sgn.t
let get_pt a p =
  Hashtbl.find a p
let rec run a p gv =
  let ox = get_pt a p in
  let (v,cs) = gv in
  ( match ox with
    | Ret ->
  ( match o with
    | Id (p1,p2) ->
      let k2 = get_k v p2 in
      set_k v p1 k2;
      run a p gv
    | Agl (p1,p2) ->
      let k1 = get_k v p1 in
      ( match k1 with
        | Tkn_InjL p3 ->
          let k2 = get_k v p3 in
          set_k v p1 k2;
          run a )
| Prd of Sgn.t * Sgn.t
| Fnc of Sgn.t * Sgn.t
| PrjL of Sgn.t * Sgn.t
| PrjR of Sgn.t * Sgn.t
| InjL of Sgn.t * Sgn.t
| InjR of Sgn.t * Sgn.t
| ChoL of Sgn.t * Sgn.t
| ChoR of Sgn.t * Sgn.t
| Cns of Sgn.t * (Sgn.t * Sgn.t)
| Call of Sgn.t * (Sgn.t * Sgn.t)
| HCall of Sgn.t * (Sgn.t * Sgn.t) * (Sgn.t * Sgn.t)
| Ini_Z of Sgn.t * int
| Ini_Stg of Sgn.t * string
| Ini_Bol of Sgn.t * bool
| Ini_Sgn of Sgn.t
| Eq of Sgn.t * (Sgn.t * Sgn.t)
| Rpc of (Sgn.t * Sgn.t) * Sgn.t
| Fix of Sgn.t * Sgn.t
| Add of Sgn.t * (Sgn.t * Sgn.t)
| Mul of Sgn.t * (Sgn.t * Sgn.t)
| Sub of Sgn.t * (Sgn.t * Sgn.t)
| Cmp of Sgn.t * (Sgn.t * Sgn.t)
| Exn of Sgn.t * Sgn.t
*)
