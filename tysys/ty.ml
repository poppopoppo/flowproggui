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
open Types
type scm = SgnSet.t * tm
type gma = scm SgnMap.t
let print_scm (a,y) =
  let s0 = SgnSet.fold (fun x r -> r^","^(Sgn.print x)) a "" in
  let s1 = print_tm y in
  s0^"∀ "^s1
let print_gma g =
  SgnMap.fold (fun k c r -> r^","^(print_scm c)^":"^("x"^(Sgn.print k))) g ""
let subst_scm s (a,e) : scm =
  let s1 =
    SgnMap.fold
      (fun k v r ->
         if SgnSet.mem k a then r
         else SgnMap.add k v r)
      SgnMap.empty s in
  (a,subst s1 e)
let subst_rec_scm (s:cxt) ((a,e):rec_scm) : rec_scm =
  let s1 =
    SgnMap.fold
      (fun k v r ->
         if SgnMap.mem k a then r
         else SgnMap.add k v r)
      SgnMap.empty s in
  (a,subst s1 e)
let ftvs_scm ((a,e):scm) : SgnSet.t = SgnSet.diff (ftvs e) a
let ftvs_rec_scm (a,e) = SgnSet.diff (ftvs e) (set_of_map a)
let ftvs_gma g : SgnSet.t = SgnMap.fold (fun _ v r -> SgnSet.union (ftvs_scm v) r) g SgnSet.empty
let ftvs_rec_gma g = SgnMap.fold (fun _ v r -> SgnSet.union (ftvs_rec_scm v) r) g SgnSet.empty
let subst_gma (c:cxt) (g:gma) : gma =
  SgnMap.fold
    (fun i (u,y) r-> SgnMap.add i (subst_scm c (u,y)) r)
    g SgnMap.empty
let subst_rec_gma (c:cxt) (g:rec_gma) : rec_gma =
  SgnMap.fold
    (fun i (u,y) r-> SgnMap.add i (subst_rec_scm c (u,y)) r)
    g SgnMap.empty
exception Typing_Error
let rec typing (c:code) : (rec_scm_hd * (tm * tm)) =
  ( match c with
    | Code_Exp (_,e,_) ->
      let r0 = Sgn.ini () in
      let r = (SgnMap.empty,Val r0) in
      let (s1,h1,y1) = typing_opr r None e in
      pnt true (("Code_Exp:"^(print_tm (Val r0))^","^(print_cxt s1)^","^(print_tm y1)^"\n"));
      (try (h1,(subst s1 (Val r0),y1)) with _ -> raise @@ Failure "typing:7")
    | Seq (c1,c2) ->
      let (h2,(s2,d2)) = typing c2 in
      let (h1,(s1,d1)) = typing c1 in
      let v = unify [(s2,d1)] in
      (map_of_set (SgnSet.union (set_of_map h1) (set_of_map h2)),(subst v s1,subst v d2))
    | Canon l ->
      let ys = List.map typing l in
      let (hs,ws) = List.split ys in
      let (ss,ds) = List.split ws in
      (map_of_set (List.fold_left (fun r x -> SgnSet.union r (set_of_map x)) SgnSet.empty hs)
      ,(rcd_cl ss,rcd_cl ds))
    | Code_CoPrd (e1,l) ->
      let agl = agl e1 in
      ( match agl with
        | None -> raise @@ Failure "typing:14"
        | Some agl->
          let r = (SgnMap.empty,Val r0) in
          let (s1,h1,y1) = typing_opr r None e1 in
          let ys = List.map typing l in
          let (scms,ps) = List.split ys in
          let (srcs,dsts) = List.split ps in
          let rec us l =
            ( match l with
              | [] -> []
              | hd::[] -> []
              | h1::h2::tl -> (h1,h2)::(us (h2::tl)) ) in
          let v1 = unify (us dsts) in
          
      )
    | Code_Prd (_,_) -> raise (Failure "typing:2")
    | Code_IO ((_,e1,_),c1) ->
      let (_,(s1,d1)) = typing c1 in
      let r0 = Sgn.ini () in
      let r = (SgnMap.empty,Val r0) in
      let a0 = Sgn.ini () in
      let a = (SgnMap.empty,Val a0) in
      let (b1,_,y1) = typing_opr r (Some a) e1 in
      let v = unify [(y1,s1)] in
      let b2 = cmp_subst [b1;v] in
      (SgnMap.empty,(subst b2 (Val r0),subst b2 ((Val a0)-*d1)))
  )
and typing_opr (r:rec_scm) (a:rec_scm option) o : (cxt * rec_scm_hd * tm) =
  let lb = Sgn.ini () in
  pnt true ((Sgn.print lb)^" enter typing_opr:"^(print_rec_scm r)^(Print.string_of_opr o)^"\n");
  let q =
    ( match o with
      | Agl _ -> raise Typing_Error
      | Opr_Z _ -> (SgnMap.empty,SgnMap.empty,Prm z)
      | Opr_Rcd l ->
        let y1 =
          List.fold_right
            (fun x q ->
               Opr_App(Opr_App(Opr_Name "⊗",x),q))
            l (Opr_Name "}") in
        typing_opr r a y1
      | Opr_Name n ->
        if n="$" then (SgnMap.empty,SgnMap.empty,snd r)
        else if n="?" then
          ( match a with
            | None -> raise (Failure "typing_opr:11")
            | Some a -> (SgnMap.empty,SgnMap.empty,snd a)
          )
        else if n="+" then (SgnMap.empty,SgnMap.empty,(rcd_cl [(Prm z);(Prm z)])-*(Prm z))
        else if n="=" then let a = Sgn.ini () in (SgnMap.empty,SgnMap.empty,(rcd_cl [Val a;Val a])-*(Prm z))
        else if n="⊗" then
          let (a,b) = (Sgn.ini (),Sgn.ini ()) in
          (SgnMap.empty,SgnMap.empty,(Val a)-*((Val b)-*((Val a)**(Val b))))
        else if n="}" then (SgnMap.empty,SgnMap.empty,Prm rcd_end)
        else raise (Failure "typing:4")
      | Opr_App (e1,e2) ->
        let (s1,h1,y1) = typing_opr r a e1 in
        let (s2,h2,y2) = typing_opr (subst_rec_scm s1 r) a e2 in
        let b = Sgn.ini () in
        let v = unify [(subst s2 y1,y2-*(Val b))] in
        (cmp_subst [s1;s2;v],map_of_set (SgnSet.union (set_of_map h1) (set_of_map h2)),subst v (Val b))
      | Prj (e1,i) ->
        pnt true ("Prj:"^(string_of_opr e1)^","^(string_of_int i)^"\n");
        let (s1,h1,y1) = typing_opr r a e1 in
        let rec yx j =
          if j=0 then []
          else (Val (Sgn.ini()))::(yx (j-1)) in
        let rs = rcd_op (yx (i+1)) in
        let v = unify [(y1,rs)] in
        (cmp_subst [s1;v],h1,ri (subst v y1) i)
      | Opr_Stg _ ->
        (SgnMap.empty,SgnMap.empty,Prm stg)
    ) in
  let (x,h,z) = q in
  pnt true ((Sgn.print lb)^" return typing_opr:("^(print_cxt x)^","^(print_scm_hd h)^","^(print_tm z)^")\n");
  q
