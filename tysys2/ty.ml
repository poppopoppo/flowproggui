open Types
open Print
let b = true
let pnt x s = if x then (print_string s;flush stdout)
let sgn () = Sgn.ini ()
let vsgn () = Val (sgn ())
let rec agl (e:opr) : (int list) option =
  ( match e with
    | Agl _ -> Some []
    | Opr_Rcd l ->
      ( try
          let (i,a) =
            BatList.findi
              (fun _ x ->
                 match x with
                 | None -> false
                 | _ -> true)
              (List.map agl l) in
          ( match a with
            | None -> None
            | Some a -> Some (i::a)
          )
        with | Failure err -> raise (Failure (err^"agl:1:"^(string_of_opr e)))
             | Not_found -> None)
    | _ -> None
  )
let cxt_ini : cxt = SgnMap.empty
let cxt_add (i:_) (e:_) c = SgnMap.add i e c
let ( +~ ) c (i,e) = cxt_add i e c
let rec subst (s:cxt) (e:tm) : tm =
  ( match e with
    | Prm _ -> e
    | Val i -> ( try SgnMap.find i s with _ -> e)
    | App(e1,e2) -> App(subst s e1,subst s e2)
  )
let (<*) b y = subst b y
let subst_c s c = List.map (fun (e0,e1) -> (s<*e0,s<*e1)) c
let (<*~) s c = subst_c s c
let cmpS s0 s1 =
  SgnMap.merge
    (fun _ oa ob ->
       match oa,ob with
       | None,_ -> ob
       | Some a,_ -> Some (s1<*a))
    s0 s1
let ( *~ ) s0 s1 = cmpS s0 s1
let cmp_subst (sl:cxt list) : cxt =
  List.fold_left cmpS cxt_ini sl
let rec ftvs (e:tm) : SgnSet.t =
  let s0 = SgnSet.empty in
  ( match e with
    | Prm _ -> s0
    | Val i -> SgnSet.add i s0
    | App (e1,e2) -> SgnSet.union (ftvs e1) (ftvs e2)
  )
let ftv j e = SgnSet.mem j (ftvs e)
exception Fail
type rnk = SgnSet.t
let rec unify w (c:c) : cxt =
  (pnt false ("enter unify:"^(print_c c)^"\n"));
  let c =
    ( match c with
      | [] -> SgnMap.empty
      | (e0,e1)::tl ->
        ( match e0,e1 with
          | Prm p0,Prm p1 ->
            if p0=p1 then unify w tl else raise @@ Failure "unify:0"
          | Val v0,Val v1 ->
            if v0=v1 then unify w tl
            else
            if SgnSet.mem v0 w then
              let s0 = cxt_ini+~(v1,Val v0) in
              s0*~(unify w (s0<*~tl))
            else if SgnSet.mem v1 w then
              let s0 = cxt_ini+~(v0,Val v1) in
              s0*~(unify w (s0<*~tl))
            else
              let v2 = sgn() in
              let s0 = cxt_ini+~(v0,(Val v2))+~(v1,Val v2) in
              s0*~(unify w (s0<*~tl))
          | Val v0,_ ->
            if SgnSet.mem v0 w then (raise @@ Failure "unify:9")
            else if (ftv v0 e1) then (raise @@ Failure "unify:1")
            else
              let s0 = cxt_ini+~(v0,e1) in
              s0*~(unify w (s0<*~tl))
          | _,Val v1 ->
            if SgnSet.mem v1 w then (raise @@ Failure "unify:10")
            else if (ftv v1 e0) then (raise @@ Failure "unify:2")
            else
              let s0 = cxt_ini+~(v1,e0) in
              s0*~(unify w (s0<*~tl))
          | App(e1,e2),App(e3,e4) -> unify w ((e1,e3)::(e2,e4)::tl)
          | _ -> raise @@ Failure ("unify:3:"^(print_tm e0)^"~"^(print_tm e1))
        )
    ) in
  (pnt false ("return unify:"^(print_cxt c)^"\n"));
  c
let rec unifys_cxt l =
  ( match l with
    | [] -> []
    | _::[] -> []
    | h1::h2::tl -> (h1,h2)::(unifys_cxt (h2::tl))
  )
let unifys w l = unify w (unifys_cxt l)
open Types
let inst_scm (a,y) =
  let m = SgnMap.fold
      (fun k _ r -> SgnMap.add k (Val (sgn())) r )
      a SgnMap.empty in
  m<*y
exception Typing_Error
let ftvs_mdl_scm (a,e) = SgnSet.diff (ftvs e) (set_of_map a)
let subst_mdl_scm (s:cxt) ((a,e):mdl_scm) : mdl_scm =
  let s1 =
    SgnMap.fold
      (fun k v r ->
         if SgnMap.mem k a then r
         else SgnMap.add k v r)
      SgnMap.empty s in
  (a,s1<*e)
let ftvs_mdl_gma (g:mdl_gma) =
  StgMap.fold (fun _ v r -> SgnSet.union (ftvs_mdl_scm v) r) g SgnSet.empty
let subst_mdl_gma (c:cxt) (g:mdl_gma) =
  StgMap.fold
    (fun i (u,y) r-> StgMap.add i (subst_mdl_scm c (u,y)) r)
    g StgMap.empty
let (<**) c g = subst_mdl_gma c g
let gen (g:mdl_gma) (y:tm) : mdl_scm_hd =
  map_of_set (SgnSet.inter (ftvs_mdl_gma g) (ftvs_mdl_scm (SgnMap.empty,y)))

let typ_env = [
  (Prm pZ,coprd_cl_unv (Prm pZ) [Prm rcd_end;Prm rcd_end]);
  let v = vsgn () in
  ((Prm lst)<+v,coprd_cl_unv (Prm lst) [Prm rcd_end;(rcd_cl [v;Prm lst])])
]
let typ_gma_to g = SgnMap.map (fun (y1,y2) -> Some (y1-*y2)) g
let subst_typ_gma s g = SgnMap.map (fun (y1,y2) -> (s<*y1,s<*y2)) g
let (<*^) s g =
  SgnMap.fold
    (fun k v r ->
       let (k0,y0) = (s<*(Val k),s<*v) in
       ( match k0 with
         | Val v1 -> SgnMap.add v1 y0 r
         | _ ->
           let p =
             ("subst_agl_gma:2:"^
              (print_tm (Val k))^","^(print_tm k0)^","^
              (print_tm v)^","^(print_tm y0)^"\n") in
           pnt true p;
           raise (Failure p)
       )
    ) g SgnMap.empty
let (<*%) s g : typ_gma = subst_typ_gma s g
let unify_typ_gma g1 g2 =
  let gm = SgnMap.merge
      (fun _ v1 v2 ->
         ( match v1,v2 with
           | None,_ -> None
           | _,None -> None
           | Some (y1,y2),Some (y3,y4) ->
             Some ((y1,y3),(y2,y4))))
      g1 g2 in
  let r = unify SgnSet.empty
      (SgnMap.fold (fun _ ((y1,y3),(y2,y4)) r -> (y1,y3)::(y2,y4)::r) gm []) in
  r
let unify_glb_gma g1 g2 =
  let gm = SgnMap.merge
      (fun _ v1 v2 ->
         ( match v1,v2 with
           | None,_ -> None
           | _,None -> None
           | Some y1,Some y3 ->
             Some (y1,y3)))
      g1 g2 in
  let r = unify SgnSet.empty
      (SgnMap.fold (fun _ (y1,y3) r -> (y1,y3)::r) gm []) in
  r
let mrg_typ_gma ga0 ga1 =
  let b0 = unify_typ_gma ga0 ga1 in
  let ga2 =
    SgnMap.merge
      (fun _ a0 a1 ->
         ( match a0,a1 with
           | None,Some (a1,a2) -> Some (b0<*a1,b0<*a2)
           | Some (a1,a2),_ -> Some (b0<*a1,b0<*a2)
           | _ -> None
         ))
      ga0 ga1 in
  (ga2,b0)

let mrg_glb_gma ga0 ga1 =
  let b0 = unify_glb_gma ga0 ga1 in
  let ga2 =
    SgnMap.merge
      (fun _ a0 a1 ->
         ( match a0,a1 with
           | None,Some a1 -> Some (b0<*a1)
           | Some a1,_ -> Some (b0<*a1)
           | _ -> None
         ))
      ga0 ga1 in
  (ga2,b0)
let typ_gma_of (g:(tm option) SgnMap.t) : (tm * tm) SgnMap.t =
  SgnMap.fold
    (fun k h r ->
       match h with
       | None -> r
       | Some y -> SgnMap.add k (Val k,y) r)
    g SgnMap.empty
let mrg_iso_lst il =
  let ilg = assoc_group il in
  
let rec typing_vh (g:typ_env*mdl_glb) (tg:typ_env) (gv:mdl_gma) c s0 d0 : (cxt * iso_lst) =
  let lb0 = sgn() in
  pnt true ("enter typing_vh:"^(Sgn.print lb0)^
            (Print.print_mdl_gma gv)^(Print.print_vh c)^","^
            (print_tm s0)^","^(print_tm d0)^"\n");
  let q =
    ( match c with
      | V (c1,c2) ->
        let v0 = sgn() in
        let (b2,ga2) = typing_vh g tg gv c2 (Val v0) d0 in
        let (b1,ga1) = typing_vh g tg (b2<**gv) c1 (b2<*s0) (b2<*(Val v0)) in
        let (ga3,b3) = mrg_typ_gma ga1 ga2 in
        (b2*~b1*~b3,ga3)
      | H (c1,c2) ->
        pnt true ("H:1");
        let (y1,y2,y3,y4) = (vsgn (),vsgn(),vsgn(),vsgn()) in
        let b0 = unify SgnSet.empty [(y1**y2,d0)] in
        pnt true ("H:2");
        let ((b1,ga1),(b2,ga2)) =
          (typing_vh g tg (b0<**gv) c1 y3 (b0<*y1),
           typing_vh g tg (b0<**gv) c2 y4 (b0<*y2)) in
        pnt true ("H:3");
        let b3 = unify SgnSet.empty [(s0,(b1<*y3)**(b2<*y4))] in
        let (ga3,b4) = mrg_typ_gma ga1 ga2 in
        (b0*~b1*~b2*~b3*~b4,ga3)
      | E e1 -> typing_nd g tg gv e1 (SgnMap.empty,s0) d0
      | F (e1,i,c1) ->
        let (v_dst,v_src) = (sgn(),sgn()) in
        let vs_in = sgns i in
        let y_rtn = List.fold_right
            (fun x r -> (Val x)-*r) vs_in (Val v_dst) in
        let b0 = unify SgnSet.empty [(d0,y_rtn)] in
        let (b1,ga1) = typing_vh g tg (b0<**gv)
            c1
            (rcd_cl ((Val v_src)::(List.map (fun x -> (b0<*(Val x))) vs_in)))
            (b0<*(Val v_dst)) in
        let bt = b0*~b1 in
        let (b2,ga2) = typing_nd g tg (bt<**gv) e1 (SgnMap.empty,bt<*s0) (bt<*(Val v_src)) in
        let (ga3,b4) = mrg_typ_gma ga1 ga2 in
        (bt*~b2*~b4,ga3)
      | A (e1,p,l) ->
        ( try
            let vs0 = List.map (fun _ -> sgn()) l in
            let rec a p v =
              ( match p with
                | [] -> Val v
                | i::tl ->
                  let l = BatList.init (i+1)
                      (fun j -> if i=j then a tl v else vsgn()) in
                  rcd_op l
              ) in
            let as0 = List.map (fun v -> a p v) vs0 in
            pnt true "CP:1\n";
            let (bp,ga1) = List.fold_left
                (fun (b,ga) (a0,c) ->
                   let (bt,gat) =
                     (typing_vh g tg (b<**gv) c (b<*a0) (b<*d0)) in
                   let (ga3,b4) = mrg_typ_gma ga gat in
                   (b*~bt*~b4,ga3))
                (cxt_ini,SgnMap.empty) (List.combine as0 l) in
            let p0 = Prm (sgn()) in
            let bx =
              (unifys SgnSet.empty
                 (List.map
                    (fun (a,v) -> ((cxt_ini+~(v,p0))*~bp)<*a)
                    (List.combine as0 vs0))) in
            pnt true "CP:2\n";
            let y0 = coprd_cl_unv (vsgn())
                (List.map
                   (fun v -> (bp*~bx)<*(Val v))
                   vs0) in
            let (b4,ga2) = typing_nd g tg
                (StgMap.add "∠"
                   (SgnMap.empty,(vsgn())-*y0)
                   ((bp*~bx)<**gv))
                e1 (SgnMap.empty,(bp*~bx)<*s0)
                (((cxt_ini+~(List.hd vs0,y0))*~bp*~bx)<*(List.hd as0)) in
            let (ga3,b5) = mrg_typ_gma ga1 ga2 in
            pnt true ("test 3:"^(print_scm_hd (typ_gma_to ga1))^","^
                      (print_scm_hd (typ_gma_to ga3))^"\n");
            (bp*~bx*~b4*~b5,ga3)
          with e -> raise e)
      | P (e1,l) ->
        let n = List.length l in
        let (vs_dst,vs_src) = (sgns n,sgns n) in
        let va = sgn() in
        let yp = prd_cl (List.map (fun x -> Val x) vs_dst) in
        let b0 = unify SgnSet.empty [(d0,Val va)] in
        let ga0 = SgnMap.add va (Val va,yp) SgnMap.empty in
        let (bp,ga1) = List.fold_left
            (fun (b,ga) ((vs,vd),c) ->
               let (bt,gat) =
                 (typing_vh g tg (b<**gv) c (b<*(Val vs)) (b<*(Val vd))) in
               let (ga3,b4) = mrg_typ_gma ga gat in
               (b*~bt*~b4,ga3))
            (b0,SgnMap.empty) (List.combine (List.combine vs_src vs_dst) l) in
        let (g2,bg) = mrg_typ_gma ga0 ga1 in
        let b1 =
          (unifys SgnSet.empty
             (List.map (fun v -> (b0*~bp*~bg)<*(Val v)) vs_src)) in
        let bt = b0*~bp*~bg*~b1 in
        let (b2,ga2) = typing_nd g tg
            (bt<**gv)
            e1 (SgnMap.empty,bt<*s0) (bt<*(Val (List.hd vs_src))) in
        let (ga3,b4) = mrg_typ_gma g2 ga2 in
        pnt true ("test4"^(Sgn.print lb0)^":"^
                  (print_scm_hd (typ_gma_to ga3))^"\n");
        (bt*~b2*~b4,ga3)
    ) in
  pnt true ("return typing_vh"^(Sgn.print lb0)^":"^
            (print_cxt (fst q))^","^
            (print_scm_hd (typ_gma_to (snd q)))^","^
            "\n");
  q
and typing_nd (g:typ_env*mdl_glb) tg gv (e:nd) r d : (cxt * typ_gma)=
  let lb0 = sgn() in
  pnt true ("enter typing_nd "^(Sgn.print lb0)^":gv="^
            (print_mdl_gma gv)^",e="^(print_nd e)^",r="^
            (print_rec_scm r)^",d="^(print_tm d)^"\n");
  let emp x = (x,SgnMap.empty) in
  let q =
    ( match e with
      | Exp_Z _ ->
        emp @@ unify SgnSet.empty
          [(d,Prm pZ)]
      | Exp_Name n ->
        let f n =
          if n="$" then emp @@ unify SgnSet.empty [(inst_scm r,d)]
          else if n="+" then
            let _ = vsgn () in
            let z = Prm pZ in
            emp @@ unify SgnSet.empty [((rcd_cl [z;z])-*z,d)]
          else if n="*" then
            let _ = vsgn () in
            let z = Prm pZ in
            emp @@ unify SgnSet.empty [((rcd_cl [z;z])-*z,d)]
          else if n="-" then
            let _ = vsgn () in
            let z = Prm pZ in
            emp @@ unify SgnSet.empty [(z-*z,d)]
          else if n="=" then
            let a = sgn() in
            emp (unify SgnSet.empty [((rcd_cl [Val a;Val a])-*(Prm z),d)])
          else if n="⊗" then
            let (a,b) = (sgn(),sgn()) in
            emp @@ unify SgnSet.empty [((Val a)-*((Val b)-*((Val a)**(Val b))),d)]
          else if n="}" then emp @@ unify SgnSet.empty [(Prm rcd_end,d)]
          else if n="@" then
            let f = vsgn() in
            emp @@ unify SgnSet.empty [(d,(f-*f)-*f)]
          else
            (* let y =
               ( try
                  BatList.find_map
                    (fun e ->
                       ( match e with
                         | Etr (_,(name,src,dst,_)) ->
                           if name=n then Some (src-*dst) else None
                         | _ -> None ))
                    g
                with _ -> raise (Failure "typing_opr:34")) in
               emp @@ unify SgnSet.empty [(d,y)]*)
            let (_,(h,mg)) = g in
            let (src,dst) =
              (try
                 StgMap.find n mg
               with _ -> raise (Failure "test1")) in
            (unify SgnSet.empty [(d,src-*dst)],
             h)
        in
        ( try
            if n="∠" then
              let (v1,v2) = (sgn(),sgn()) in
              let (_,y) = StgMap.find n gv in
              (unify SgnSet.empty
                 [(d,(Val v1)-*(Val v2));(d,y)],
               SgnMap.add v1 (Val v1,Val v2) SgnMap.empty)
            else let (_,y) = StgMap.find n gv in
              emp @@ unify SgnSet.empty [(d,y)]
          with _ -> f n )
      | Exp_App (e1,e2) ->
        let v1 = sgn () in
        let (s1,ga1) = typing_nd g tg gv e1 r ((Val v1)-*d) in
        let (s2,ga2) = typing_nd g tg (s1<**gv) e2
            (subst_mdl_scm s1 r) (s1<*(Val v1)) in
        let s3 = s1*~s2 in
        let (ga1s,ga2s) = (s3<*%ga1,s3<*%ga2) in
        let (gax,s4) = mrg_typ_gma ga1s ga2s in
        pnt true ("Exp_App:"^(print_scm_hd (typ_gma_to ga1))^","^
                  (print_tm (s3<*((Val v1)-*d)))^","^
                  (print_scm_hd (typ_gma_to ga2))^","^
                  (print_tm (s3<*((Val v1))))^","^
                  (print_cxt s3)^"\n");
        pnt true ("Exp_App:"^(print_scm_hd (typ_gma_to ga1s))^","^
                  (print_tm (s3<*((Val v1)-*d)))^","^
                  (print_scm_hd (typ_gma_to ga2s))^","^
                  (print_tm (s3<*((Val v1))))^","^
                  (print_cxt s3)^"\n");
        pnt true ("Exp_App:"^(print_scm_hd (typ_gma_to gax))^","^
                  (print_tm ((s3*~s4)<*((Val v1)-*d)))^","^
                  (print_tm ((s3*~s4)<*((Val v1))))^","^
                  (print_cxt (s3*~s4))^","^
                  (print_cxt s4)^"\n");
        (s3*~s4,gax)
      | PrjL e1 ->
        let (v1,v2) = (sgn(),sgn()) in
        let p = (Val v1)**(Val v2) in
        let (s1,ga1) = typing_nd g tg gv e1 r p in
        let s2 = unify SgnSet.empty [(s1<*(Val v1),s1<*d)] in
        (s1*~s2,ga1)
      | PrjR e1 ->
        let (v1,v2) = (sgn(),sgn()) in
        let p = (Val v1)**(Val v2) in
        let (s1,ga1) = typing_nd g tg gv e1 r p in
        let s2 = unify SgnSet.empty [(s1<*(Val v2),s1<*d)] in
        (s1*~s2,ga1)
      | Inj i1 ->
        let (v0,v1) = (sgn(),sgn()) in
        let l = BatList.init
            (i1+1) (fun j -> if j=i1 then (Val v0) else vsgn()) in
        let ga = SgnMap.add v1 (Val v1,(coprd_op_inj l)) SgnMap.empty in
        (unify SgnSet.empty
           [(d,(Val v0)-*(Val v1))],ga)
      | Cho i1 ->
        let (v0,v1) = (sgn(),sgn()) in
        let l = BatList.init
            (i1+1) (fun j -> if j=i1 then (Val v0) else vsgn()) in
        let ga = SgnMap.add v1 (Val v1,(prd_op l)) SgnMap.empty in
        (unify SgnSet.empty [(d,(Val v1)-*(Val v0))],ga)
      | Exp_Stg _ -> emp @@ unify SgnSet.empty [(d,Prm stg)]
    ) in
  pnt true ("return typing_nd"^(Sgn.print lb0)^":"^
            (print_cxt (fst q))^","^
            (print_scm_hd (typ_gma_to (snd q)))^","^
            "\n");
  q
let rec vh_of_code c =
  ( match c with
    | Code_Exp (_,e,_) -> E (nd_of_opr e)
    | Seq (c1,c2) -> V (vh_of_code c1,vh_of_code c2)
    | Canon l -> List.fold_right (fun x r -> H(vh_of_code x,r)) l id
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
  | Agl e -> Exp_App(Exp_Name "∠",nd_of_opr e)
let typing_mdl (m:mdl) : (mdl * mdl_glb) =
  let (name,arg,l) = m in
  let (m0,mx) =
    List.fold_left
      (fun (g,(gl,((h:(tm*tm)SgnMap.t),(gs:(tm*tm)StgMap.t)))) e ->
         ( match e with
           | Etr (_,(f,_,_,c)) ->
             let (src,dst) = (vsgn(),vsgn()) in
             let (b0,ga) = typing_vh (gl,(h,gs)) typ_env StgMap.empty
                 (vh_of_code c) src dst in
             let (h1,ga1,b1) =
               SgnMap.fold
                 (fun k1 (y1,y2) (h1,ga1,b1) ->
                    ( match y1,y2 with
                      | Val k2,_ ->
                        (SgnMap.add k2 y2 h1,
                         SgnMap.add k1 (y1,y2) ga1,
                         b1)
                      | _ ->
                        ( try
                            let bt =
                              BatList.find_map
                                (fun (x1,x2) ->
                                   ( try
                                       Some (unify SgnSet.empty [(x1,y1);(x2,y2)])
                                     with _ -> None))
                                typ_env in
                            (bt<*^h1,bt<*%ga1,b1*~bt)
                          with _ -> raise (Failure ("typing_mdl:"^(print_tm y1)^(print_tm y2)))
                        )))
                 ga (SgnMap.empty,SgnMap.empty,cxt_ini) in
             let (src1,dst1) = ((b0*~b1)<*src,(b0*~b1)<*dst) in
             let r = Etr(SgnMap.map (fun v -> Some v) h1,
                         (f,src1,dst1,c)) in
             let (gax,_) = mrg_typ_gma h ga1 in
             (g@[r],(gl,(gax,StgMap.add f (src1,dst1) gs)))
           | Etr_Clq (_,l) ->
             let d = List.length l in
             let (vs,ds) = (sgns d,sgns d) in
             let vp = List.combine vs ds in
             let vpl = List.combine vp l in
             let m = List.fold_left
                 (fun r ((vs,vd),(f,_,_,_)) ->
                    StgMap.add f (SgnMap.empty,((Val vs)-*(Val vd))) r)
                 StgMap.empty vpl in
             let (b,ga) = List.fold_left
                 (fun (b,gat) ((vs,vd),(_,_,_,c)) ->
                    let (b0,ga) = typing_vh (gl,(h,gs)) typ_env
                        (b<**m) (vh_of_code c) (b<*(Val vs)) (b<*(Val vd)) in
                    let (gax,b3) = mrg_typ_gma (b0<*%gat) ga in
                    (b*~b0*~b3,gax))
                 (cxt_ini,SgnMap.empty) vpl in
             let (g1,ga1,b1) =
               SgnMap.fold
                 (fun k1 (y1,y2) (g1,ga1,b1) ->
                    ( match y1,y2 with
                      | Val k2,_ ->
                        (SgnMap.add k2 y2 g1,
                         SgnMap.add k1 (y1,y2) ga1,b1)
                      | _ ->
                        ( try
                            let bt =
                              BatList.find_map
                                (fun (x1,x2) ->
                                   ( try
                                       Some (unify SgnSet.empty [(x1,y1);(x2,y2)])
                                     with _ -> None))
                                typ_env in
                            (bt<*^g1,bt<*%ga1,b*~bt)
                          with _ -> raise (Failure ("typing_mdl:"^(print_tm y1)^(print_tm y2)))
                        )))
                 ga (SgnMap.empty,SgnMap.empty,cxt_ini) in
             let b2 = b*~b1 in
             let r = Etr_Clq
                 (SgnMap.map (fun v -> Some v) g1,
                  (List.map
                     (fun ((vs,vd),(f,_,_,c)) ->
                        (f,b2<*(Val vs),b2<*(Val vd),c))
                     vpl)) in
             let (gax,_) = mrg_typ_gma h ga1 in
             let gs1 =
               List.fold_left
                 (fun gs1 ((vs,vd),(f,_,_,_)) ->
                    StgMap.add f (b2<*(Val vs),b2<*(Val vd)) gs1)
                 gs vpl in
             (g@[r],(gl,(gax,gs1)))
           | _ -> (g@[e],(gl,(h,gs))) ))
      ([],([],(SgnMap.empty,StgMap.empty))) l in
  ((name,arg,m0),snd mx)
