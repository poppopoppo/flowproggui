module Sgn :
sig
  type t
  val ini : unit -> t
  val print : t -> string
end
= struct
  type t = int
  let sgn_N = ref 0
  let ini () =
    let n = !sgn_N in
    sgn_N := n+1;
    n
  let print x = (string_of_int x)
end
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
    | Tm l -> "{"^(List.fold_left (fun r x -> r^" "^(print_tm x)) "" l)^" }"
  )
let print_cxt c =
  Hashtbl.fold
    (fun i v r -> r^"X"^(Sgn.print i)^" -> "^(print_tm v)^"\n")
    c ""
let cxt_ini () = Hashtbl.create 10
let cxt_add c i e =
  let c = Hashtbl.copy c in
  (Hashtbl.add c i e);
  c
let rec subst_i i a e =
  ( match e with
    | Prm _ -> e
    | Val j -> if i=j then a else e
    | Tm l -> Tm (List.map (subst_i i a) l)
  )
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
        Hashtbl.iter (fun i e -> Hashtbl.add c0 i (subst hd e))
          c0;
        Hashtbl.iter
          (fun i e ->
             if Hashtbl.mem c0 i then ()
             else Hashtbl.add c0 i e )
          hd;
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
          | Prm p0,Prm p1 ->
            if p0=p1 then unify tl else raise Fail
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

module SgnSet = Set.Make(struct type t = Sgn.t let compare = compare end)

module Exp = struct
  type t =
    | ValE of Sgn.t
    | App of t * t
    | Abs of Sgn.t * t
    | Let of Sgn.t * t * t
  type scm = SgnSet.t * tm
  type gma = (Sgn.t ,scm) Hashtbl.t
  let print_scm (a,y) =
    let s0 = SgnSet.fold (fun x r -> r^","^(Sgn.print x)) a "" in
    let s1 = print_tm y in
    "∀"^s0^"."^s1
  let print_gma g =
    Hashtbl.fold
      (fun k c r -> r^","^(print_scm c)^":"^("x"^(Sgn.print k)))
      g ""
  let gma_ini () : gma = Hashtbl.create 10
  let gma_add g i c =
    let g = Hashtbl.copy g in
    Hashtbl.add g i c;
    g
  let rec subst_scm s (a,e) : scm =
    ( match e with
      | Prm _ -> (a,e)
      | Val i ->
        if SgnSet.mem i a then (a,e)
        else
          (try
             let v = Hashtbl.find s i in
             (a,v)
           with _ -> (a,e) )
      | Tm l -> (a,Tm (List.map (fun x -> snd(subst_scm s (a,x))) l))
    )
  let ftvs_scm ((a,e):scm) : SgnSet.t = SgnSet.diff (ftvs e) a
  let ftvs_gma g : SgnSet.t =
    let g = Hashtbl.copy g in
    let s0 = SgnSet.empty in
    Hashtbl.fold (fun k v r -> SgnSet.union (ftvs_scm v) r) g s0
  let subst_gma (c:cxt) (g:gma) : gma =
    let g = Hashtbl.copy g in
    let c = Hashtbl.copy c in
    Hashtbl.iter
      (fun i (u,y) ->
         let c0 = cxt_ini () in
         Hashtbl.iter
           (fun k v ->
              if (SgnSet.mem k u) then ()
              else Hashtbl.add c0 k v)
           c;
         Hashtbl.add g i (subst_scm c0 (u,y)))
      g;
    g
  let imp = Sgn.ini ()
  let rec w (g:gma) (e:t) : (cxt * tm) =
    pnt false ("w:"^(print_gma g)^"\n");
    let r =
      ( match g,e with
        | _,ValE i ->
          let (u,m) = Hashtbl.find g i in
          let y = SgnSet.fold (fun j r -> subst_i j (Val (Sgn.ini ())) r) u m in
          (cxt_ini (),y)
        | _,(App (e1,e2)) ->
          let (s1,y1) = w g e1 in
          let (s2,y2) = w (subst_gma s1 g) e2 in
          let b = Sgn.ini () in
          let v = unify [(subst s2 y1,Tm[Prm imp;y2;Val b])] in
          (cmp_subst [s1;s2;v],subst v (Val b))
        | _,(Abs(x,e1)) ->
          let b = Sgn.ini() in
          let (s,y) = w (gma_add g x (SgnSet.empty,(Val b))) e1 in
          (s,Tm[Prm imp;subst s (Val b);y])
        | _,(Let(x,e1,e2)) ->
          let (s1,y1) = w g e1 in
          let an = SgnSet.diff (ftvs (SgnSet.empty,y1)) (ftvs_gma (subst_gma s1 g)) in
          let (s2,y2) = w (gma_add (subst_gma s1 g) x (an,y1)) e2 in
          (cmp_subst [s1;s2],y2)
      ) in
    pnt true ("w > "^(print_cxt (fst r))^","^(print_tm (snd r))^"\n");
    r
end
type code =
  | Exp of exp
  | Rtn
  | Seq of code * code
  | Canon of (code list)
  | Code_CoPrd of exp * (code list)
  | Code_Prd of exp * (code list)
  | Code_IO of exp * code
and exp =
  | Agl of opr
  | Opr_Z of int
  | Opr_Name of string
  | Opr_Rcd of opr list
  | Root
  | Arg
  | App of opr * opr
  | Prj of opr * int
type def_scm = (Sgn.t,def option) Hashtbl.t * ty
and def =
  | Def_CoPrd of ty list
  | Def_Prd of ty list
  | Def_Exp of ty
and ty =
  | ValT of Sgn.t
  | PrmT of Sgn.t
  | Imp of ty * ty
let rec ftvs y =
  let s0 = SgnSet.empty in
  ( match y with
    | ValT v -> SgnSet.add v s0
    | PrmT _ -> s0
    | Imp (y1,y2) -> SgnSet.union (ftvs y1) (ftvs y2)
  )
type def_gma = (Sgn.t ,def_scm) Hashtbl.t
type def_cxt = (Sgn.t,ty) Hashtbl.t
let rec ty_of_tm e =
  ( match e with
    | Val v -> ValT v
    | Prm p -> PrmT p
    | Tm ((Prm p)::e1::e2::[]) ->
      if p=imp then Imp (ty_of_tm e1,ty_of_tm e2)
      else raise Fail
    | _ -> raise Fail
  )
let rec tm_of_ty e =
  ( match e with
    | ValT v -> Val v
    | PrmT p -> Prm p
    | Imp (e1,e2) -> Tm [(Prm imp);(tm_of_ty e1);(tm_of_ty e2)]
    | _ -> raise Fail
  )
let def_scm_of (c,m) =
  let d = Hashtbl.create 10 in
  SgnSet.iter
    (fun i v -> Hashtbl.add d i None) c;
  (d,ty_of_tm m)
let of_def_scm (c,y) =
  let s = SgnSet.empty in
  Hashtbl.iter
    (fun i v -> SgnSet.add s i) c;
  (s,tm_of_ty y)
let of_def_gma g =
  let g0 = Hashtbl.create 10 in
  Hashtbl.iter
    (fun i v -> Hashtbl.add g0 i (of_def_scm v)) g;
  g0
let of_def_cxt s =
  let s0 = Hashtbl.create 10 in
  Hashtbl.iter
    (fun i v -> Hashtbl.add s0 i (of_def_scm v)) s;
  s0
let ftvs_scm (d,y) =
  let (a,_) = of_def_scm (d,y) in
  SgnSet.diff (ftvs y) a
let hm g e = w (of_def_gma g) (tm_of_ty e)
let root = Sgn.ini ()
let arg = Sgn.ini ()
let sgn_of_name = [("ℤ",Sgn.ini())]
let typing (g:def_gma) c : (def_cxt * ty) =
  ( match c with
    | Exp e1 -> typing g e1
    | Rtn ->
      let a = Sgn.ini () in
      (cxt_ini (),Imp (ValT a;ValT a))
    | Seq (c0,c1) ->
      let (s1,y1) = typing g c0 in
      let an = SgnSet.diff (ftvs_scm (SgnSet.empty,y1)) (ftvs_gma (subst_gma s1 g)) in
      let (s2,y2) = typing (gma_add (subst_gma s1 g) root (an,y1)) c1 in
      (cmp_subst [s1;s2],y2)
    | Code_IO (e1,c1) ->
      let b = Sgn.ini () in
      let (s1,y1) = typing_exp (gma_add g arg (SgnSet.empty,(Val b))) e1 in
      (s,Tm[Prm imp;subst s (Val b);y])
    | Code_CoPrd _ ->
      (*
        ∐ c1 ∐ c2 : y1→y3 y2→y3
        ∇ : a∀ { a a } → a
      *)
    | _ -> raise Fail
  )
and typing_exp g e =
  ( match e with
    | Agl e1 -> raise Fail
    | Opr_Z _-> (cxt_ini (),Prm(List.assoc sgn_of_name "ℤ"))
    | Opr_Name n -> (cxt_ini (),Prm(List.assoc sgn_of_name n ))
    | Opr_Rcd r ->
      (* {a0 a1 a2 .. an} = {}.[n] ◂a0◂a1◂a2◂..◂an
          {}.[n] = a0,a1,a2,..an∀ a0→a1→a2→a3→a4→..→an→{a0 a1 a2 .. an} *)
    | Root ->
    | Arg ->
    | App (e1,e2) ->
    | Prj (e1,i) ->
  )
