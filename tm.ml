open Util
module SgnSet = Set.Make(struct type t = Sgn.t let compare = compare end)
type tm =
  | Prm of Sgn.t
  | Val of Sgn.t
  | Tm of tm list
type cxt = (Sgn.t,tm) Hashtbl.t
type c = (tm * tm) list
let cxt_ini:cxt = Hashtbl.create 10
let rec print_tm e =
  ( match e with
    | Prm p -> "p"^(Sgn.print p)
    | Val v -> "X"^(Sgn.print v)
    | Tm l -> "⟦'"^(List.fold_left (fun r x -> r^" "^(print_tm x)) "" l)^"⟧"
  )
let print_cxt c =
  Hashtbl.fold
    (fun i v r -> r^"X"^(Sgn.print i)^" → "^(print_tm v)^"\n")
    c ""
let cxt_ini () = Hashtbl.create 10
let cxt_add c i e =
  let c = Hashtbl.copy c in
  (Hashtbl.add c i e);
  c
let rec subst s e =
  ( match e with
    | Prm _ -> e
    | Val i ->
      ( try
          let v = Hashtbl.find s i in
          v
        with _ -> e )
    | Tm l -> Tm (List.map (subst s) l)
  )
let rec subst_i i a e = subst (cxt_add (cxt_ini ()) i a) e 
let rec subst_c s c =
  ( match c with
    | [] -> []
    | (e0,e1)::tl -> (subst s e0,subst s e1)::(subst_c s tl)
  )
let cmp_subst sl : cxt =
  pnt true ("cmp_subst:"^(string_of_list "*>" print_cxt sl)^"\n");
  let c = Hashtbl.create 10 in
  let rec f c0 l =
    let c0 = Hashtbl.copy c0 in
    ( match l with
      | [] -> c0
      | hd::tl ->
        Hashtbl.iter (fun i e -> Hashtbl.add c0 i (subst hd e)) c0;
        Hashtbl.iter (fun i e -> if Hashtbl.mem c0 i then () else Hashtbl.add c0 i e ) hd;
        f c0 tl
    ) in
  let r = f c sl in
  pnt true ("cmp_subst$"^(print_cxt r)^"\n");
  r
let rec ftv j e =
  ( match e with
    | Prm _ -> false
    | Val i -> i=j
    | Tm l -> List.exists (ftv j) l
  )
let rec ftvs (e:tm) : SgnSet.t =
  let s0 = SgnSet.empty in
  ( match e with
    | Prm i -> s0
    | Val i -> SgnSet.add i s0
    | Tm l ->
      let sl = List.map (fun x -> ftvs (a,x)) l in
      List.fold_left (fun r x -> SgnSet.union r x) s0 sl
  )
exception Fail
let rec unify (c:c) : cxt =
  let c =
    ( match c with
      | [] -> Hashtbl.create 10
      | (e0,e1)::tl ->
        ( match e0,e1 with
          | Prm p0,Prm p1 -> if p0=p1 then unify tl else raise Fail
          | Val v0,_ ->
            if (ftv v0 e1) then (raise Fail)
            else
              let s0 = cxt_add (cxt_ini ()) v0 e1 in
              cmp_subst [s0;(unify (subst_c s0 tl))]
          | _,Val v1 ->
            if (ftv v1 e0) then (raise Fail)
            else
              let s0 = cxt_add (cxt_ini ()) v1 e0 in
              cmp_subst [s0;(unify (subst_c s0 tl))]
          | Tm l0,Tm l1 ->
            let lp = (try List.combine l0 l1 with _ -> raise Fail) in
            unify (lp@tl)
          | _ -> raise Fail
        )
    ) in
  (pnt true ("unify > "^(print_cxt c)^"\n"));
  c
