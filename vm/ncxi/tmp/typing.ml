let inst (a,y) =
  let m = SgnSet.fold
      (fun k r -> SgnMap.add k (vsgn()) r)
      a SgnSet.empty in
  m<*y
let subst_scm s (a,e) =
  let s1 =
    SgnMap.fold
      (fun k v r ->
         if SgnMap.mem k a then r
         else SgnMap.add k v r)
      SgnMap.empty s in
  (a,s1<*e)
let get_rm rm r =
  SgnMap.find rm r
let subst_rm s rm =
  SgnMap.map
    (fun q -> subst_scm s q)
    rm
let subst_km s km =
StgMap.map
  (fun q -> subst_scm s q)
  rm
let ftvs_scm (a,e) = SgnSet.diff (ftvs e) a
let ftvs_km g =
  StgMap.fold
    (fun _ v r -> SgnSet.union (ftvs_scm v) r)
    g SgnSet.empty
let gen km rm y =
  (SgnSet.inter (ftvs_km km) (ftvs_scm (SgnMap.empty,y)))
let rec get_reg_ptn_rm rm rp =
  ( match rp with
    | P_A r -> get_rm rm r
    | P_R (rs,rt) ->
      let ts = Array.map (get_reg_ptn rm) rs in
      let tt = get_rm rm rt in
      rcd_cns ts tt
  )
let unifys_reg_ptn rm rps =
  let ts = List.map (fun x -> inst @ get_reg_ptn_rm rm x) rps in
  let s = unifys ts in
  s
let rec typing_asm km rm c =
  ( match c with
    | Nd (e,c1) ->
      let s0 =
        ( match e with
          | Id (r0,rs) ->
            let s0 = unifys (Array.map (fun r -> inst (get_rm rm r)) (Array.to_list ([|r0|] |+| rs))) in
            s0
          | Prj (r0,rs,rt) ->
            let ts = Array.map (fun r -> inst (get_rm rm r)) rs in
            let t0 = inst (get_rm rm rt) in
            let s0 = unify [(get_rm rm r0,rcd ts t0)] in
            s0
          | Cns (rs,rt,r0) ->
            let ts = Array.map (fun r -> inst (get_rm rm r)) rs in
            let t0 = inst (get_rm rm rt) in
            let s0 = unify [(inst @ get_rm rm r0,rcd_cns ts t0)] in
            s0
          | Rm r0 -> cxt_ini ()
          | Agl (ra,rp,ps) ->
            let t0 = coprd_op (vsgn ()) [(vsgn ())] in
            let s0 = unify [(t0,get_rm rm ra)] in
            let s1 = Array.fold_left
                (fun s1 p ->
                   let s2 = typing_asm (subst_km s1 km) (subst_rm s1 rm) p in
                   s1 *~ s2)
                s0 ps in
            let rps = Array.map ret ps in
            let s2 = unifys_reg_ptn (subst_rm s1 rm) (Array.to_list (rp |+| rps)) in
            s1 *~ s2
          | Call (y,f,x) ->
            let (ty,tf,tx) = (inst @ get_ptn_rm rm y,inst @ get_rm f,inst @ get_ptn_rm rm x) in
            let s0 = unify [(tf,imp tx ty)] in
            s0
          | Ini (r,k) ->
            let s0 = unify [(inst @ get_rm rm r,typing_rcd_tkn km k)] in
            s0 ) in
      typing_asm (subst_km s0 km) (subst_rm s0 rm) c
    | Ret r0 ->
      cxt_ini ()
  )
and typing_rcd_tkn km k =
  let open Unify in
  let open Tkn in
  ( match k with
    | Rcd l -> rcd_cl (Array.map (typing_rcd_tkn km) l)
    | Tkn k ->
      ( match k with
        | Stg _ -> Prm Unify.Stg
        | Z _ -> Prm Unify.Z
        | Zn(_,z1) -> Prm (Unify.Z z1)
        | Sgn _ -> Prm Unify.Sgn
        | CoP (i,k0) ->
          let t0 = typing_rcd_tkn km k0 in
          let l0 = List.init (fun _ -> vsgn ()) (i-2) in
          let l1 = l0 @ [t0] in
          coprd_op l1
        | P (_,_) -> err "err t0"
        | Pls -> imp (rcd_cl [(zn ());(zn ())]) (zn ())
        | Mlt -> imp (rcd_cl [(zn ());(zn ())]) (zn ())
        | Mns -> imp (zn ()) (zn ())
        | Cmp ->
          let v0 = vsgn () in
          imp (rcd_cl [z;z]) (Prm (Zn 2))
        | Eq ->
          let v0 = vsgn () in
          imp (rcd_cl [v0;v0]) (Prm (Zn 2))
        | Inj i ->
          let t0 = vsgn () in
          let l0 = List.init (fun _ -> vsgn ()) (i-1) in
          let l1 = l0 @ [t0] in
          imp t0 (coprd_op l1)
        | Cho _ -> err "err t2"
        | Fix ->
          let (a,b) = (vsgn(),vsgn()) in
          imp (imp ((imp a b) (imp a b))) (imp a b)
        | Exn ->
          let a = vsgn () in
          imp (Prm Stg) a
        | Fnc _ -> err "t4"
        | Clj _ -> err "t3"
      )
end
  )
                          )
