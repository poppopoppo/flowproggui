open Types
open Print
open Util
let b = true
let pnt x s = if x then (print_string s;flush stdout)
let rec ri (y:tm) (i:int) : tm =
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
let cxt_ini (():unit) : cxt = SgnMap.empty
let cxt_add (i:_) (e:_) c = SgnMap.add i e c
let ( +~ ) c (i,e) = cxt_add i e c
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
let (<*) b y = subst b y
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
let cmpS s0 s1 =
  SgnMap.merge
    (fun _ oa ob ->
       match oa,ob with
       | None,_ -> ob
       | Some a,_ -> Some (subst s1 a))
    s0 s1
let ( *~ ) s0 s1 = cmpS s0 s1
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
  (pnt true ("enter unify:"^(print_c c)^"\n"));
  let c =
    ( match c with
      | [] -> SgnMap.empty
      | (e0,e1)::tl ->
        ( match e0,e1 with
          | Prm p0,Prm p1 ->
            if p0=p1 then unify tl else raise @@ Failure "unify:0"
          | Val v0,Val v1 ->
            if v0=v1 then SgnMap.empty
            else
              let v2 = Sgn.ini () in
              let s0 = cxt_add v0 (Val v2) (cxt_ini ()) in
              let s1 = cxt_add v1 (Val v2) s0 in
              cmp_subst [s1;(unify (subst_c s1 tl))]
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
          | App(e1,e2),App(e3,e4) -> unify ([(e1,e3);(e2,e4)]@tl)
          | _ -> raise @@ Failure ("unify:3:"^(print_tm e0)^"~"^(print_tm e1))
        )
    ) in
  (pnt true ("return unify:"^(print_cxt c)^"\n"));
  c
let rec unifys_cxt l =
  ( match l with
    | [] -> []
    | _::[] -> []
    | h1::h2::tl -> (h1,h2)::(unifys_cxt (h2::tl))
  )
let unifys l = unify (unifys_cxt l)
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
let inst_scm (a,y) =
  let m = SgnMap.fold (fun k _ r -> SgnMap.add k (Val (Sgn.ini())) r ) a SgnMap.empty in
  subst m y
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
    | Code_CoPrd ((_,e1,_),_) ->
      let agl = agl e1 in
      ( match agl with
        | None -> raise @@ Failure "typing:14"
        | Some _-> raise @@ Failure "typing:19"
        (* let r = (SgnMap.empty,Val r0) in
           let (s1,h1,y1) = typing_opr r None e1 in
           let ys = List.map typing l in
           let (scms,ps) = List.split ys in
           let (srcs,dsts) = List.split ps in
           let rec us l =
           ( match l with
            | [] -> []
            | hd::[] -> []
            | h1::h2::tl -> (h1,h2)::(us (h2::tl)) ) in
           let v1 = unify (us dsts) in *)
      )
    | Code_Prd (_,_) -> raise (Failure "typing:2")
    | Code_IO ((_,e1,_),_,c1) ->
      let (_,(s1,d1)) = typing c1 in
      let r0 = Sgn.ini () in
      let r = (SgnMap.empty,Val r0) in
      let a0 = Sgn.ini () in
      let a = (SgnMap.empty,Val a0) in
      let (b1,_,y1) = typing_opr r (Some a) e1 in
      let v = unify [(y1,s1)] in
      let b2 = cmp_subst [b1;v] in
      (SgnMap.empty,(subst b2 (Val r0),subst b2 ((Val a0)-*d1)))
    | _ -> raise @@ Failure "typing:29"
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
        if n="$" then (SgnMap.empty,SgnMap.empty,inst_scm r)
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
      | _ -> raise (Failure "ypin")
    ) in
  let (x,h,z) = q in
  pnt true ((Sgn.print lb)^" return typing_opr:("^(print_cxt x)^","^(print_scm_hd h)^","^(print_tm z)^")\n");
  q
type agl = Agl_None | Agl_N of int | Agl_Scm of rec_scm
let rec typingM  (c:code) (src:tm) (dst:tm) : cxt =
  ( match c with
    | Code_Exp (_,e,_) ->
      let r = (SgnMap.empty,src) in
      let s1 = typing_oprM r None Agl_None e dst in
      pnt true (("Code_Exp:"^(print_tm src)^","^(print_cxt s1)^","^(print_tm dst)^"\n"));
      s1
    | Seq (c1,c2) ->
      let y2 = Sgn.ini() in
      let b2 = typingM c2 (Val y2) dst in
      let b1 = typingM c1 src (subst b2 (Val y2)) in
      cmp_subst [b2;b1]
    | Canon l ->
      let ds = List.map (fun _ -> Val (Sgn.ini ())) l in
      let b0 = unify [(rcd_cl ds,dst)] in
      let ys = List.map
          (fun (c,d) ->
             let s = Sgn.ini () in
             (Val s,typingM c (Val s) (subst b0 d)))
          (List.combine l ds) in
      let b1 = unify [(src,rcd_cl (List.map (fun (s,b) -> subst b s) ys))] in
      cmp_subst ([b0]@(snd (List.split ys))@[b1])
    | Code_CoPrd ((_,e1,_),l) ->
      let agl = agl e1 in
      ( match agl with
        | None -> raise @@ Failure "typing:14"
        | Some _->
          let bs = List.map
              (fun c ->
                 let (vs,vd) = (Sgn.ini(),Sgn.ini()) in
                 ((vs,vd),typingM c (Val vs) (Val vd))) l in
          let rec f0 l =
            ( match l with
              | [] -> []
              | ((_,vd),b)::[] -> [(subst b (Val vd),dst)]
              | ((vs1,_),b1)::h2::tl ->
                (subst b1 (Val vs1),dst)::(f0 (h2::tl))) in
          let b0 = unify (f0 bs) in
          b0
      )
    | Code_Prd (_,_) -> raise (Failure "typing:2")
    | Code_IO ((_,e1,_),_,c1) ->
      let (v1,v2,v3) = (Sgn.ini(),Sgn.ini(),Sgn.ini ()) in
      let b0 = unify [(dst,(Val v1)-*(Val v2))] in
      let b1 = typingM c1 (Val v3) (subst b0 (Val v2)) in
      let bt = cmp_subst [b0;b1] in
      let b2 = typing_oprM
          (SgnMap.empty,(subst bt src))
          (Some (SgnMap.empty,subst bt (Val v1)))
          Agl_None e1 (subst bt (Val v3)) in
      cmp_subst [bt;b2]
    | _ -> raise @@ Failure "typingM:14"
  )
(* $ ? ?' ?'' .. >< *)
and typing_oprM (r:rec_scm) (a:rec_scm option) (agl:agl) o y : cxt =
  let lb = Sgn.ini () in
  pnt true ((Sgn.print lb)^" enter typing_opr:"^(print_rec_scm r)^(Print.string_of_opr o)^"\n");
  let q =
    ( match o with
      | Agl e1 ->
        ( match agl with
          | Agl_None -> raise @@ Failure "typing_oprM:20"
          | Agl_N i ->
            let v1 = Sgn.ini () in
            let y1 = coprd_cl (List.map (fun x -> Val x) (sgns i)) in
            let y_unfld = (Val v1)-*y1 in
            let agl_scm = (Agl_Scm (SgnMap.empty,y_unfld)) in
            typing_oprM r a agl_scm (Opr_App(Opr_Name "><",e1)) y
          | _ -> raise @@ Failure "typing_oprM:22" )
      | Opr_Z _ -> unify [(y,Prm z)]
      | Opr_Rcd l ->
        let y1 = List.fold_right
            (fun x q -> Opr_App(Opr_App(Opr_Name "⊗",x),q))
            l (Opr_Name "}") in
        typing_oprM r a agl y1 y
      | Opr_Name n ->
        if n="$" then unify [(inst_scm r,y)]
        else if n="?" then
          ( match a with
            | None -> raise (Failure "typing_opr:11")
            | Some a -> unify [(inst_scm a,y)]
          )
        else if n="+" then unify [((rcd_cl [(Prm z);(Prm z)])-*(Prm z),y)]
        else if n="=" then let a = Sgn.ini () in unify [((rcd_cl [Val a;Val a])-*(Prm z),y)]
        else if n="⊗" then
          let (a,b) = (Sgn.ini (),Sgn.ini ()) in
          unify [((Val a)-*((Val b)-*((Val a)**(Val b))),y)]
        else if n="}" then unify [(Prm rcd_end,y)]
        else if n="><" then
          ( match agl with
            | Agl_Scm m -> unify [(y,inst_scm m)]
            | _ -> raise (Failure "typing_oprM:21") )
        else raise (Failure "typing:4")
      | Opr_App (e1,e2) ->
        let v1 = Sgn.ini () in
        let s1 = typing_oprM r a agl e1 ((Val v1)-*y) in
        let s2 = typing_oprM (subst_rec_scm s1 r) a agl e2 (subst s1 (Val v1)) in
        cmp_subst [s1;s2]
      | Prj (e1,i) ->
        pnt true ("Prj:"^(string_of_opr e1)^","^(string_of_int i)^"\n");
        let rec yx j =
          if j=0 then []
          else (Val (Sgn.ini()))::(yx (j-1)) in
        let rs = rcd_op (yx (i+1)) in
        let s1 = typing_oprM r a agl e1 rs in
        let s2 = unify [(ri (subst s1 rs) i,subst s1 y)] in
        cmp_subst [s1;s2]
      | Opr_Stg _ -> unify [(y,Prm stg)]
      | _ -> raise (Failure "typing_oprM:20")
    ) in
  pnt true ((Sgn.print lb)^" return typing_opr:("^(print_cxt q)^"\n");
  q
let selfS b s =
  ( match s with
    | None -> None
    | Some (n,y) -> Some (n,subst b y))
let rec typing_vh g (m:(string * tm) option) c s0 d0 =
  pnt true ("enter typing_vh:"^(Print.print_vh c)^","^(print_tm s0)^","^(print_tm d0)^"\n");
  ( match c with
    | V (c1,c2) ->
      let v0 = Sgn.ini() in
      let b2 = typing_vh g m c2 (Val v0) d0 in
      let b1 = typing_vh g (selfS b2 m) c1 s0 (subst b2 (Val v0)) in
      b2*~b1
    | H (c1,c2) ->
      pnt true ("H:1");
      let (y1,y2,y3,y4) = (Val (Sgn.ini()),Val (Sgn.ini()),Val(Sgn.ini()),Val(Sgn.ini())) in
      let b0 = unify [(y1**y2,d0)] in
      pnt true ("H:2");
      let (b1,b2) = (typing_vh g (selfS b0 m) c1 y3 (subst b0 y1),typing_vh g (selfS b0 m) c2 y4 (subst b0 y2)) in
      pnt true ("H:3");
      let b3 = unify [(s0,(subst b1 y3)**(subst b2 y4))] in
      b0*~b1*~b2*~b3
    | E e1 -> typing_nd g m e1 (SgnMap.empty,s0) d0
    | F (e1,i,c1) ->
      let (v_dst,v_src) = (Sgn.ini (),Sgn.ini()) in
      let vs_in = sgns i in
      let y_rtn = List.fold_right (fun x r -> (Val x)-*r) vs_in (Val v_dst) in
      let b0 = unify [(d0,y_rtn)] in
      let b1 = typing_vh g (selfS b0 m)
          c1
          (rcd_cl ((Val v_src)::(List.map (fun x -> (b0<*(Val x))) vs_in)))
          (b0<*(Val v_dst)) in
      let bt = b0*~b1 in
      let b2 = typing_nd g (selfS bt m) e1 (SgnMap.empty,bt<*s0) (bt<*(Val v_src)) in
      bt*~b2
    | CP (e1,e2,l) ->
      pnt true "CP:0\n";
      let (vs0,vs1) = (List.map (fun _ -> Sgn.ini()) l,List.map (fun _ -> Sgn.ini()) l) in
      let bs = List.map
          (fun ((v0,v1),c) -> typing_vh g m c (rcd_cl [(Val v0);(Val v1)]) d0)
          (List.combine (List.combine vs0 vs1) l) in
      pnt true "CP:1\n";
      let bx = unify
          ((unifys_cxt (List.map (fun b -> subst b d0) bs))@
           (unifys_cxt
              (List.map
                 (fun (v,b) -> b<*(Val v))
                 (List.combine vs1 bs)))@
           (unifys_cxt (List.map (fun b -> selfS b m) bs))) in
      pnt true "CP:2\n";
      let e3 = List.fold_right
          (fun x q -> Exp_App(Exp_App(Exp_Name "⊗",x),q))
          [e1;e2] (Exp_Name "}") in
      let y0 = coprd_cl
          (List.map
             (fun (b,v) -> (b*~bx)<*(Val v))
             (List.combine bs vs0)) in
      let b4 = typing_nd g (selfS bx (selfS (List.hd bs) m)) e3
          (SgnMap.empty,s0)
          (rcd_cl
             [ y0;
               (((List.hd bs)*~bx)<*(Val (List.hd vs1)))
             ]
          ) in
      cmp_subst (bs@[bx]@[b4])
    | A (e1,p,l) ->
      let vs0 = List.map (fun _ -> Sgn.ini()) l in
      let rec a p v =
        ( match p with
          | [] -> Val v
          | i::tl ->
            rcd_op
              (BatList.init
                 (i+1)
                 (fun j ->
                    if i=j then a tl v
                    else Val (Sgn.ini())))
        ) in
      let vt = Sgn.ini () in
      let a0 = a p vt in
      let bs = List.map
          (fun (v0,c) ->
             typing_vh g m c (((cxt_ini())+~(vt,(Val v0)))<*a0) d0)
          (List.combine vs0 l) in
      pnt true "CP:1\n";
      let p0 = Prm (Sgn.ini ()) in
      let bx = unify
          ((unifys_cxt (List.map (fun b -> b<*d0) bs))@
           (unifys_cxt
              (List.map
                 (fun b -> b<*(((cxt_ini())+~(vt,p0))<*a0))
                 bs))@
           (unifys_cxt (List.map (fun b -> selfS b m) bs))) in
      pnt true "CP:2\n";
      let y0 = coprd_cl
          (List.map
             (fun (b,v) -> (b*~bx)<*(Val v))
             (List.combine bs vs0)) in
      let b4 = typing_nd g (selfS bx (selfS (List.hd bs) m)) e1
          (SgnMap.empty,s0)
          (((List.hd bs)*~bx)<*(((cxt_ini ())+~(vt,y0))<*a0)) in
      cmp_subst (bs@[bx]@[b4])
    | P (e1,l) ->
      let n = List.length l in
      let (vs_dst,vs_src) = (sgns n,sgns n) in
      let b0 = unify [(d0,prd_cl (List.map (fun x -> Val x) vs_dst))] in
      let bs = List.map
          (fun ((vs,vd),c) -> typing_vh g (selfS b0 m) c (subst b0 (Val vs)) (subst b0 (Val vd)))
          (List.combine (List.combine vs_src vs_dst) l) in
      let b1 = unify
          (unifys_cxt
             (List.map (fun (b,v) -> (b0*~b)<*(Val v)) (List.combine bs vs_src))@
           (unifys_cxt (List.map (fun b -> selfS b m) bs))) in
      let b2 = typing_nd g
          (selfS b0*~b1 m)
          e1 (SgnMap.empty,s0) ((b0*~(List.hd bs)*~b1)<*(Val (List.hd vs_src))) in
      cmp_subst ([b0]@bs@[b1]@[b2])
  )
and typing_nd g m (e:nd) r d =
  let q =
    ( match e with
      | Exp_Z _ -> unify [(d,Prm z)]
      | Exp_Name n ->
        let f n =
          if n="$" then unify [(inst_scm r,d)]
          else if n="+" then unify [((rcd_cl [(Prm z);(Prm z)])-*(Prm z),d)]
          else if n="=" then
            let a = Sgn.ini () in
            unify [((rcd_cl [Val a;Val a])-*(Prm z),d)]
          else if n="⊗" then
            let (a,b) = (Sgn.ini (),Sgn.ini ()) in
            unify [((Val a)-*((Val b)-*((Val a)**(Val b))),d)]
          else if n="}" then unify [(Prm rcd_end,d)]
          else if n="@" then
            let f = Val (Sgn.ini ()) in
            unify [(d,(f-*f)-*f)]
            (* else if n="><" then
               ( match agl with
                | Agl_Scm m -> unify [(y,inst_scm m)]
                | _ -> raise (Failure "typing_oprM:21") ) *)
          else
            let y =
              ( try
                  BatList.find_map
                    (fun e ->
                       ( match e with
                         | Etr (name,_,src,dst,_) ->
                           if name=n then Some (src-*dst) else None
                         | _ -> None ))
                    g
                with _ -> raise (Failure "typing_opr:34")) in
            unify [(d,y)] in
        ( match m with
          | None -> f n
          | Some (name,y) ->
            if name=n then y
            else f n )
      | Exp_App (e1,e2) ->
        let v1 = Sgn.ini () in
        let s1 = typing_nd g e1 r ((Val v1)-*d) in
        let s2 = typing_nd g e2 (subst_rec_scm s1 r) (subst s1 (Val v1)) in
        cmp_subst [s1;s2]
      | PrjL e1 ->
        let (v1,v2) = (Sgn.ini (),Sgn.ini()) in
        let p = (Val v1)**(Val v2) in
        let s1 = typing_nd g e1 r p in
        let v3 = v1 in
        let s2 = unify [(s1<*(Val v3),s1<*d)] in
        s1*~s2
      | PrjR e1 ->
        let (v1,v2) = (Sgn.ini (),Sgn.ini()) in
        let p = (Val v1)**(Val v2) in
        let s1 = typing_nd g e1 r p in
        let v3 = v2 in
        let s2 = unify [(s1<*(Val v3),s1<*d)] in
        s1*~s2
      | Inj i1 ->
        let v0 = Sgn.ini () in
        let l = BatList.init
            (i1+1) (fun j -> if j=i1 then (Val v0) else Val (Sgn.ini())) in
        unify [(d,(Val v0)-*(coprd_op l))]
      | Cho i1 ->
        let v0 = Sgn.ini () in
        let l = BatList.init
            (i1+1) (fun j -> if j=i1 then (Val v0) else Val (Sgn.ini())) in
        unify [(d,(prd_op l)-*(Val v0))]
      | Exp_Stg _ -> unify [(d,Prm stg)]
    ) in
  q
let rec vh_of_code c =
  ( match c with
    | Code_Exp (_,e,_) -> E (nd_of_opr e)
    | Seq (c1,c2) -> V (vh_of_code c1,vh_of_code c2)
    | Canon l -> List.fold_right (fun x r -> H(vh_of_code x,r)) l id
    | Code_Agl (e1,e2,l) ->
      let (d1,d2) = (nd_of_opr e1,nd_of_opr e2) in
      let lh = List.map vh_of_code l in
      CP(d1,d2,lh)
    | Code_Prd ((_,e1,_),l) ->
      P(nd_of_opr e1,List.map vh_of_code l)
    | Code_CoPrd((_,e1,_),l) ->
      ( match agl e1 with
        | None -> raise (Failure "vh_of_code:3")
        | Some p -> A(nd_of_opr e1,p,List.map vh_of_code l)
      )
    | Code_IO ((_,e1,_),i,c1) -> F(nd_of_opr e1,i,vh_of_code c1)
  )
and nd_of_opr o =
  match o with
  | Opr_Z z -> Exp_Z z
  | Opr_Name n -> Exp_Name n
  | Opr_Rcd l ->
    let y1 = List.fold_right
        (fun x q -> Opr_App(Opr_App(Opr_Name "⊗",x),q))
        l (Opr_Name "}") in
    nd_of_opr y1
  | Opr_App (e1,e2) -> Exp_App (nd_of_opr e1,nd_of_opr e2)
  | Prj (e1,i) ->
    let rec prj i x =
      if i=0 then PrjL x
      else prj (i-1) (PrjR x) in
    prj i (nd_of_opr e1)
  | Opr_Stg s -> Exp_Stg s
  | Opr_Inj i -> Inj i
  | Opr_Cho i -> Cho i
  | Agl e -> nd_of_opr e
let typing_mdl m =
  let (name,arg,l) = m in
  let l0 =
    List.fold_left
      (fun g e ->
         ( match e with
           | Etr (f,h,_,_,c) ->
             let (src,dst) = (Val (Sgn.ini()),Val(Sgn.ini())) in
             let b0 = typing_vh g (vh_of_code c) src dst in
             let r = Etr (f,h,subst b0 src,subst b0 dst,c) in
             g@[r]
           | _ -> g@[e] ))
      [] l in
  (name,arg,l0)
