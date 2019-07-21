open Types
open Print
let string_of_list m f l = List.fold_left (fun r x -> r^m^(f x)) "" l
let b = true
let pnt x s = if x then (print_string s;flush stdout)
let rec ri y i =
  pnt true ("enter ri:"^(print_tm y)^","^(string_of_int i));
  let x =
    ( match y with
      | App(App(Prm b,hd),tl) ->
        if b=tpl then
          if i=0 then hd
          else ri tl (i-1)
        else raise @@ Failure "ri:0"
      | _ -> raise @@ Failure "ri:1"
    ) in
  pnt true ("return ri:"^(print_tm x)^"\n");
  x
let cxt_ini () = SgnMap.empty
let cxt_add c i e = (SgnMap.add c i e)
let rec subst_i (i:Sgn.t) (a:tm) (e:tm) : tm  =
  ( match e with
    | Prm _ -> e
    | Val j -> if i=j then a else e
    | App (e1,e2) -> App (subst_i i a e1,subst_i i a e2)
  )
let rec subst (s:cxt) (e:tm) : tm =
  ( match e with
    | Prm _ -> e
    | Val i -> ( try SgnMap.find i s with _ -> e)
    | App(e1,e2) -> App(subst s e1,subst s e2)
  )
let rec subst_c s c =
  ( match c with
    | [] -> []
    | (e0,e1)::tl -> (subst s e0,subst s e1)::(subst_c s tl)
  )
let rec cmp_subst (sl:cxt list) : cxt =
  pnt true ("cmp_subst:"^(string_of_list "*>" print_cxt sl)^"\n");
  let r =
    ( match sl with
      | [] -> SgnMap.empty
      | hd::tl ->
        let s1 = cmp_subst tl in
        SgnMap.merge
          (fun _ oa ob ->
             match oa,ob with
             | None,_ -> ob
             | Some a,_ -> Some (subst s1 a))
          hd s1
    ) in
  pnt true ("cmp_subst$"^(print_cxt r)^"\n");
  r
let rec ftvs (e:tm) : SgnSet.t =
  let s0 = SgnSet.empty in
  ( match e with
    | Prm _ -> s0
    | Val i -> SgnSet.add i s0
    | App (e1,e2) -> SgnSet.union (ftvs e1) (ftvs e2)
  )
let ftv j e = SgnSet.mem j (ftvs e)

exception Fail
let rec unify (c:c) : cxt =
  (pnt false ("enter unify:"^(print_c c)^"\n"));
  let c =
    ( match c with
      | [] -> SgnMap.empty
      | (e0,e1)::tl ->
        ( match e0,e1 with
          | Prm p0,Prm p1 ->
            if p0=p1 then unify tl else raise @@ Failure "unify:0"
          | Val v0,_ ->
            if (ftv v0 e1) then (raise @@ Failure "unify:1")
            else
              let s0 = cxt_add v0 e1 (cxt_ini ()) in
              cmp_subst [s0;(unify (subst_c s0 tl))]
          | _,Val v1 ->
            if (ftv v1 e0) then (raise @@ Failure "unify:2")
            else
              let s0 = cxt_add v1 e0 (cxt_ini ()) in
              cmp_subst [s0;(unify (subst_c s0 tl))]
          | App(e1,e2),App(e3,e4) ->            unify ([(e1,e3);(e2,e4)]@tl)
          | _ -> raise @@ Failure "unify:3"
        )
    ) in
  (pnt false ("return unify:"^(print_cxt c)^"\n"));
  c
module Exp = struct
  type t =
    | ValE of Sgn.t
    | AppE of t * t
    | Abs of Sgn.t * t
    | Let of Sgn.t * t * t
    | Rcd of t list
  let rcd_ini = Sgn.ini ()
  type scm = SgnSet.t * tm
  type gma = scm SgnMap.t
  let print_scm (a,y) =
    let s0 = SgnSet.fold (fun x r -> r^","^(Sgn.print x)) a "" in
    let s1 = print_tm y in
    "∀"^s0^"."^s1
  let print_gma g =
    SgnMap.fold
      (fun k c r -> r^","^(print_scm c)^":"^("x"^(Sgn.print k)))
      g ""
  let gma_ini () : gma = SgnMap.empty
  let gma_add g i c = SgnMap.add i c g
  let subst_scm s (a,e) : scm =
    let s1 =
      SgnMap.fold
        (fun k v r ->
           if SgnSet.mem k a then r
           else SgnMap.add k v r)
        SgnMap.empty s in
    (a,subst s1 e)
  let ftvs_scm ((a,e):scm) : SgnSet.t = SgnSet.diff (ftvs e) a
  let ftvs_gma g : SgnSet.t =
    let s0 = SgnSet.empty in
    SgnMap.fold (fun _ v r -> SgnSet.union (ftvs_scm v) r) g s0
  let subst_gma (c:cxt) (g:gma) : gma =
    SgnMap.fold
      (fun i (u,y) r->
         let q =
           SgnMap.fold
             (fun k v r ->
                if (SgnSet.mem k u) then r
                else SgnMap.add k v r)
             c SgnMap.empty in
         SgnMap.add i (subst_scm q (u,y)) r)
      g SgnMap.empty
  let scm_of_rcd (n:int) : scm =
    let xs =
      let rec f n = if n=0 then [] else (Sgn.ini())::(f (n-1)) in
      f n in
    let r = List.fold_left (fun r x -> (r<+(Val x))) (Val rcd) xs in
    let y = List.fold_right (fun x r -> (((Prm imp)<+(Val x))<+r)) xs r in
    let a = List.fold_left (fun r x -> SgnSet.add x r) SgnSet.empty xs in
    (a,y)
  let rec w (g:gma) (e:t) : (cxt * tm) =
    pnt false ("w:"^(print_gma g)^"\n");
    let r =
      ( match g,e with
        | _,ValE i ->
          let (u,m) = SgnMap.find i g in
          let y = SgnSet.fold (fun j r -> subst_i j (Val (Sgn.ini ())) r) u m in
          (cxt_ini (),y)
        | _,(AppE (e1,e2)) ->
          let (s1,y1) = w g e1 in
          let (s2,y2) = w (subst_gma s1 g) e2 in
          let b = Sgn.ini () in
          let v = unify [(subst s2 y1,((Prm imp)<+y2)<+Val b)] in
          (cmp_subst [s1;s2;v],subst v (Val b))
        | _,(Abs(x,e1)) ->
          let b = Sgn.ini() in
          let (s,y) = w (gma_add g x (SgnSet.empty,(Val b))) e1 in
          (s,((Prm imp)<+(subst s (Val b)))<+y)
        | _,(Let(x,e1,e2)) ->
          let (s1,y1) = w g e1 in
          let an = SgnSet.diff (ftvs y1) (ftvs_gma (subst_gma s1 g)) in
          let (s2,y2) = w (gma_add (subst_gma s1 g) x (an,y1)) e2 in
          (cmp_subst [s1;s2],y2)
        | _,Rcd l ->
          let c = Sgn.ini () in
          let e1 = List.fold_left (fun r x -> AppE(r,x)) (ValE c) l in
          let y = scm_of_rcd (List.length l) in
          w (gma_add g c y) e1
      ) in
    pnt true ("w > "^(print_cxt (fst r))^","^(print_tm (snd r))^"\n");
    r
end
let z = Sgn.ini ()
open Types
exception Typing_Error
let rec typing (c:code) : (tm * tm) =
  ( match c with
    | Code_Exp (_,e,_) ->
      let r0 = Sgn.ini () in
      let r = (SgnSet.empty,Val r0) in
      let (s1,y1) = typing_opr r None e in
      pnt true (("Code_Exp:"^(print_tm (Val r0))^","^(print_cxt s1)^","^(print_tm y1)^"\n"));
      (try (subst s1 (Val r0),y1) with _ -> raise @@ Failure "typing:7")
    | Seq (c1,c2) ->
      let (s2,d2) = typing c2 in
      let (s1,d1) = typing c1 in
      let v = unify [(s2,d1)] in
      (subst v s1,subst v d2)
    | Canon l ->
      let ys = List.map typing l in
      let (ss,ds) = List.split ys in
      (rcd_cl ss,rcd_cl ds)
    | Code_CoPrd (_,_) -> raise (Failure "typing:1")
    | Code_Prd (_,_) -> raise (Failure "typing:2")
    | Code_IO ((_,e1,_),c1) ->
      let (s1,d1) = typing c1 in
      let r0 = Sgn.ini () in
      let r = (SgnSet.empty,Val r0) in
      let a0 = Sgn.ini () in
      let a = (SgnSet.empty,Val a0) in
      let (b1,y1) = typing_opr r (Some a) e1 in
      let v = unify [(y1,s1)] in
      let b2 = cmp_subst [b1;v] in
      (subst b2 (Val r0),subst b2 ((Val a0)-*d1))
  )
and typing_opr (r:Exp.scm) (a:Exp.scm option) o : (cxt * tm) =
  let lb = Sgn.ini () in
  pnt true ((Sgn.print lb)^" enter typing_opr:"^(Exp.print_scm r)^(Print.string_of_opr o)^"\n");
  let q =
    ( match o with
      | Agl _ -> raise Typing_Error
      | Opr_Z _ -> (SgnMap.empty,Prm z)
      | Opr_Rcd l ->
        let y1 =
          List.fold_right
            (fun x q ->
               Opr_App(Opr_App(Opr_Name "⊗",x),q))
            l (Opr_Name "}") in
        typing_opr r a y1
      | Opr_Name n ->
        if n="$" then (SgnMap.empty,snd r)
        else if n="?" then
          ( match a with
            | None -> raise (Failure "typing_opr:11")
            | Some a -> (SgnMap.empty,snd a)
          )
        else if n="+" then (SgnMap.empty,(rcd_cl [(Prm z);(Prm z)])-*(Prm z))
        else if n="=" then let a = Sgn.ini () in (SgnMap.empty,(rcd_cl [Val a;Val a])-*(Prm z))
        else if n="⊗" then
          let (a,b) = (Sgn.ini (),Sgn.ini ()) in
          (SgnMap.empty,(Val a)-*((Val b)-*((Val a)**(Val b))))
        else if n="}" then (SgnMap.empty,Prm rcd_end)
        else raise (Failure "typing:4")
      | Opr_App (e1,e2) ->
        let (s1,y1) = typing_opr r a e1 in
        let (s2,y2) = typing_opr (Exp.subst_scm s1 r) a e2 in
        let b = Sgn.ini () in
        let v = unify [(subst s2 y1,y2-*(Val b))] in
        (cmp_subst [s1;s2;v],subst v (Val b))
      | Prj (e1,i) ->
        pnt true ("Prj:"^(string_of_opr e1)^","^(string_of_int i)^"\n");
        let (s1,y1) = typing_opr r a e1 in
        let rec yx j =
          if j=0 then []
          else (Val (Sgn.ini()))::(yx (j-1)) in
        let rs = rcd_op (yx (i+1)) in
        let v = unify [(y1,rs)] in
        (cmp_subst [s1;v],ri (subst v y1) i)
      | Opr_Stg _ ->
        (SgnMap.empty,Prm stg)
    ) in
  pnt true ((Sgn.print lb)^" return typing_opr:("^(print_cxt (fst q))^","^(print_tm (snd q))^")\n");
  q
