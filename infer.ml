module Sgn :
sig
  type t
  val ini : unit -> t
end
 = struct
  type t = int
  let sgn_N = ref 0
  let ini () =
    let n = !sgn_N in
    sgn_N := n+1;
    n
end
type t = int
and tm =
  | App of tm * tm
  | Val of int
  | Prm of int
  | Abs of int * tm
  | Let of int * tm * tm
and ty =
  | TyVal of int
  | TyPrm of int
  | Imp of ty * ty
  | FAll of (int list) * ty
and cxt = (int * ty) Hashtbl.t
and sbst = (int * ty) Hashtbl.t
let tyV = ref 0
let new_tyV () =
  let v = !tyV in
  tyV := v+1;
  v
let rec sbst_app s y =
  ( match y with
    | TyVal i ->
      (try
         let a = Hashtbl.find s i in
         ty
       with _ -> y)
    | _ -> y
  )
exception Fail
let rec occur y i =
  ( match y with
    | TyVal j -> i=j
    | TyPrm _ -> false
    | TyImp (y0,y1) -> (occur y0 i)||(occur y1 i)
    | _ -> raise Fail
  )
let rec unify (y0:ty) (y1:ty) : sbst =
  ( match y0,y1 with
    | TyVal i0,TyVal i1 ->
      let q = Hashtbl.create 10 in
      if i0=i1
      then Hashtbl.create 10
      else
        let i2 = new_tyV () in
        let s0 = Hashtbl.add q i0 (TyVal i2) in
        let s1 = Hashtbl.add q i1 (TyVal i2) in
        s1
    | TyVal i0,TyPrm p0 ->
      let q = Hashtbl.create 10 in
      Hashtbl.add q i0 (TyPrm p0);
      q
    | TyPrm p0,TyVal i0 ->
      let q = Hashtbl.create 10 in
      Hashtbl.add q i0 (TyPrm p0);
      q
    | TyPrm p0,TyPrm p1 -> if p0=p1 then [] else raise Fail
    | Imp(y2,y3),Imp(y4,y5) ->
      let (s0,s1) = (unify y2 y3,unify y4 y5) in
      let s2 = unify_sbst s0 s1 in
      s2
    | TyVal i0,Imp(y2,y3) ->
      if occur i0 y1
      then raise Fail
      else
        let q = Hashtbl.create 10 in
        Hashtbl.add q i0 y1;
        q
    | Imp(y2,y3),TyVal i ->
      if occur i y0
      then raise Fail
      else let q = Hashtbl.create 10 in
        Hashtbl.add q i0 y0;
        q
    | _ -> raise Fail
  )
and unify_sbst s0 s1 =
  let p = Hashtbl.create 10 in
  Hashtbl.iter
    (fun i y ->
       (try
       let w = ))( match s0,s1 with
    | [],_ -> s1
    | _,[] -> s0
    | None::tl0,hd1::tl1 -> hd1::(unify_sbst tl0 tl1)
    | hd0::tl0,None::tl1 -> hd0::(unify_sbst tl0 tl1)
    | (Some x0)::tl0,(Some x1)::tl1 -> (unify x0 x1))
let w (c:cxt) (e:tm) : sbst * ty =
