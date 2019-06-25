open Types
open Print
open Util
let b = true
let pnt x s = if x then (print_string s;flush stdout)
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
  pnt false ("cmp_subst:"^(string_of_list "*>" print_cxt sl)^"\n");
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
  pnt false ("cmp_subst$"^(print_cxt r)^"\n");
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

let inst_scm (a,y) =
  let m = SgnMap.fold (fun k _ r -> SgnMap.add k (Val (Sgn.ini())) r ) a SgnMap.empty in
  subst m y

exception Typing_Error
let ftvs_mdl_scm ((a,e):mdl_scm) : SgnSet.t = SgnSet.diff (ftvs e) (set_of_map a)
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
let rec typing_vh g (gv:mdl_gma) c s0 d0 =
  pnt true ("enter typing_vh:"^(Print.print_mdl_gma gv)^(Print.print_vh c)^","^(print_tm s0)^","^(print_tm d0)^"\n");
  ( match c with
    | V (c1,c2) ->
      let v0 = Sgn.ini() in
      let b2 = typing_vh g gv c2 (Val v0) d0 in
      let b1 = typing_vh g (b2<**gv) c1 s0 (b2<*(Val v0)) in
      b2*~b1
    | H (c1,c2) ->
      pnt true ("H:1");
      let (y1,y2,y3,y4) = (Val (Sgn.ini()),Val (Sgn.ini()),Val(Sgn.ini()),Val(Sgn.ini())) in
      let b0 = unify [(y1**y2,d0)] in
      pnt true ("H:2");
      let (b1,b2) =
        (typing_vh g (b0<**gv) c1 y3 (b0<*y1),
         typing_vh g (b0<**gv) c2 y4 (b0<*y2)) in
      pnt true ("H:3");
      let b3 = unify [(s0,(b1<*y3)**(b2<*y4))] in
      b0*~b1*~b2*~b3
    | E e1 -> typing_nd g gv e1 (SgnMap.empty,s0) d0
    | F (e1,i,c1) ->
      let (v_dst,v_src) = (Sgn.ini (),Sgn.ini()) in
      let vs_in = sgns i in
      let y_rtn = List.fold_right (fun x r -> (Val x)-*r) vs_in (Val v_dst) in
      let b0 = unify [(d0,y_rtn)] in
      let b1 = typing_vh g (b0<**gv)
          c1
          (rcd_cl ((Val v_src)::(List.map (fun x -> (b0<*(Val x))) vs_in)))
          (b0<*(Val v_dst)) in
      let bt = b0*~b1 in
      let b2 = typing_nd g (bt<**gv) e1 (SgnMap.empty,bt<*s0) (bt<*(Val v_src)) in
      bt*~b2
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
      let as0 = List.map (fun v -> a p v) vs0 in
      pnt true "CP:1\n";
      let bp = List.fold_left
          (fun b (a0,c) ->
             b*~(typing_vh g
                   (b<**gv) c
                   (b<*a0) (b<*d0)))
          (cxt_ini ()) (List.combine as0 l) in
      let p0 = Prm (Sgn.ini ()) in
      let bx =
        (unifys
           (List.map
              (fun (a,v) -> (((cxt_ini())+~(v,p0))*~bp)<*a)
              (List.combine as0 vs0))) in
      pnt true "CP:2\n";
      let y0 = coprd_cl
          (List.map
             (fun v -> (bp*~bx)<*(Val v))
             vs0) in
      let b4 = typing_nd g ((bp*~bx)<**gv) e1
          (SgnMap.empty,s0)
          ((((cxt_ini ())+~(List.hd vs0,y0))*~bp*~bx)<*(List.hd as0)) in
      bp*~bx*~b4
    | P (e1,l) ->
      let n = List.length l in
      let (vs_dst,vs_src) = (sgns n,sgns n) in
      let b0 = unify [(d0,prd_cl (List.map (fun x -> Val x) vs_dst))] in
      let bp = List.fold_left
          (fun b ((vs,vd),c) ->
             b*~(typing_vh g (b<**gv) c (b<*(Val vs)) (b<*(Val vd))))
          b0 (List.combine (List.combine vs_src vs_dst) l) in
      let b1 =
        (unifys
           (List.map (fun v -> (b0*~bp)<*(Val v)) vs_src)) in
      let bt = b0*~bp*~b1 in
      let b2 = typing_nd g
          (bt<**gv)
          e1 (SgnMap.empty,bt<*s0) (bt<*(Val (List.hd vs_src))) in
      bt*~b2
  )
and typing_nd g gv (e:nd) r d =
  let lb0 = Sgn.ini () in
  pnt true ("enter typing_nd "^(Sgn.print lb0)^":"^
            (print_mdl_gma gv)^","^(print_nd e)^","^
            (print_rec_scm r)^","^(print_tm d)^"\n");
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
                         | Etr (_,(name,src,dst,_)) ->
                           if name=n then Some (src-*dst) else None
                         | _ -> None ))
                    g
                with _ -> raise (Failure "typing_opr:34")) in
            unify [(d,y)] in
        ( try
            let (h,y) = StgMap.find n gv in
            unify [(d,inst_scm (h,y))]
          with _ -> f n )
      | Exp_App (e1,e2) ->
        let v1 = Sgn.ini () in
        let s1 = typing_nd g gv e1 r ((Val v1)-*d) in
        let s2 = typing_nd g (s1<**gv) e2 (subst_mdl_scm s1 r) (s1<*(Val v1)) in
        cmp_subst [s1;s2]
      | PrjL e1 ->
        let (v1,v2) = (Sgn.ini (),Sgn.ini()) in
        let p = (Val v1)**(Val v2) in
        let s1 = typing_nd g gv e1 r p in
        let v3 = v1 in
        let s2 = unify [(s1<*(Val v3),s1<*d)] in
        s1*~s2
      | PrjR e1 ->
        let (v1,v2) = (Sgn.ini (),Sgn.ini()) in
        let p = (Val v1)**(Val v2) in
        let s1 = typing_nd g gv e1 r p in
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
  pnt true ("return typing_vh"^(Sgn.print lb0)^":"^
            (print_cxt q)^"\n");
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
  | Agl e -> nd_of_opr e
let typing_mdl m =
  let (name,arg,l) = m in
  let l0 =
    List.fold_left
      (fun g e ->
         ( match e with
           | Etr (h,(f,_,_,c)) ->
             let (src,dst) = (Val (Sgn.ini()),Val(Sgn.ini())) in
             let b0 = typing_vh g StgMap.empty (vh_of_code c) src dst in
             let r = Etr(h,(f,subst b0 src,subst b0 dst,c)) in
             g@[r]
           | Etr_Clq (_,l) ->
             let d = List.length l in
             let (vs,ds) = (sgns d,sgns d) in
             let vp = List.combine vs ds in
             let m = List.fold_left
                 (fun r ((vs,vd),(f,_,_,_)) ->
                    StgMap.add f (SgnMap.empty,((Val vs)-*(Val vd))) r)
                 StgMap.empty (List.combine vp l) in
             let b = List.fold_left
                 ( fun b ((vs,vd),(_,_,_,c)) ->
                     let b0 = typing_vh g (b<**m) (vh_of_code c) (Val vs) (Val vd) in
                     b*~b0 )
                 (cxt_ini()) (List.combine vp l) in
             let r = Etr_Clq
                 (SgnMap.empty,
                  (List.map
                     (fun ((vs,vd),(f,_,_,c)) ->
                        (f,b<*(Val vs),b<*(Val vd),c))
                     (List.combine vp l))) in
             g@[r]
           | _ -> g@[e] ))
      [] l in
  (name,arg,l0)
