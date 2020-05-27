let rec vh_of_ast r0 c =
  ( match c with
    | V (a1,a2) ->
      let (c1,p1) = vh_of_ast r0 a1 in
      let (c2,p2) = vh_of_ast p1 a2 in
      (Vp (c1,c2),p2)
    | H _ -> err "vm2:a1"
    | E n1 ->
      vh_of_exp_ptn r0 n1
    | P (_,_) -> err "vm2:a2"
    | A (n1,ix,l) ->
      let (c1,p1) = vh_of_exp_ptn nm r0 n1 in
      let ra = get_path ix p1 in
      let rr = P_A (reg v0) in
      let la = Array.map
          (fun c ->
             let rp = alc_ptn v0 (P_A (reg v0)) in
             let p2 = set_path ix p1 rp in
             (rp,vh_of_ast p2 c))
          l in
      let n2 = Agl(ra,rr,la) in
      (V(c1,VHn n2),rr)
    | F (_,_,_) -> err "vm2:a4"
  )
and vh_of_exp_ptn r0 p0 =
  ( match p0 with
    | Rot -> (Rp r0,r0)
    | Rcd [||] ->
      let k = Rcd_Rcd [||] in
      let r1 = reg v0 in
      let p1 = P_A r1 in
      ([|Ini(r1,k)|],p1)
    | Rcd es ->
      let (rs,l) = rpc (Array.length es) r0 in
      let pps = Array.mapi (fun i e -> vh_of_exp_ptn v0 nm rs.(i) e) es in
      let (ps,rps) = List.split (Array.to_list pps) in
      let c = Vp(Hp(l,unt),Hp(ps,unt)) in
      (c,P_R(rps,r_unt))
    | App (e1,e2) ->
      let (prs,pl) = rpc v0 2 r0 in
      ( match prs with
        | [| r1 ; r2 |] ->
          let (cf,pf) = net_of_exp v0 nm r1 f in
          let (cx,px) = net_of_exp_ptn v0 nm r2 x in
          let r3 = reg v0 in
          let n2 = Call ([|r3|],p_a pf,p_a px) in
          (cf |+| cx |+| [|n2|],P_A r3)
        | _ -> err "err 45" )
    | Prj (e,i) ->
      let (c1,p1) = net_of_exp_ptn v0 nm r0 n1 in
      ( match p1 with
        | P_R (rs,rt) ->
          let rc1 = Array.fold_left
              (fun (a,j) r ->
                 if i=j then (a,j+1)
                 else (a |+| rm r,j+1))
              rs in
          (c1 |+| rc1 |+| [|Rm rt|],rs.(i))
        | P_A r1 ->
          let a1 = Array.init (fun i -> reg v0 (i-1) in
          let o1 = Prj(r1,a1) in
          (c1 |+| [|o1|],P_A(a1.(i)))
      )
    | Atm a -> vh_of_exp a
  )
and vh_of_exp e =
  let k =
    ( match e with
    | Ast.Z z -> Tkn.Z z
    | Ast.Pls -> Tkn.Pls
    | Ast.Mlt -> Tkn.Mlt
    | Mns -> Tkn.Mns
    | Cmp -> Tkn.Cmp
    | Eq -> Tkn.Eq
    | Fix -> Tkn.Fix
    | Exn -> Tkn.Exn
    | Name n -> Tkn.Name n
    | Inj i -> Tkn.Inj i
    | Cho i -> Tkn.Cho i
    | Stg s -> Tkn.Stg s
    ) in
  let r1 = reg v0 in
  let p1 = P_A r1 in
  (VHn (Ini(r1,Rcd_Tkn k)),p1)
let vh_of_g g =
  let nm =
    BatList.fold_left
      (fun nm e ->
        | Types.Etr (_,(name,_,_,f)) ->
          let r0 = P_A (reg v0) in
          let (c0,p0) = vh_of_code nm r0 f in
          StgMap.add name c0 nm
        | Etr_Clq(_,l) ->
          BatList.fold_left
            (fun r (name,_,_,f) ->
               let r0 = P_A (reg v0) in
               let (c0,p0) = vh_of_code nm r0 f in
               StgMap.add name c0 nm)
            nm l
        | _ -> raise (Failure "err10"))
     StgMap.empty g in
let rec idx_g nm =
  Util.pnt dbg "enter idx_g\n";
  let v0 = NetInt.ini_st_v () in
  let (nm1,h0) =
    StgMap.fold
      (fun _ (p,r) (nm1,h0) ->
         let _ = NetInt.free_v v0 in
         let _ = add_idx h0 v0 r in
         let pi = ref (NetInt.Ret (P_A 0)) in
         let nm1 = [|(p,(pi,r))|] |+| nm1 in
         (nm1,h0))
      nm ([||],Hashtbl.create 10) in
  let _ = Array.map
      (fun (p,(pi,r)) ->
         let _ = NetInt.free_v v0 in
         let ri = to_idx h0 r in
         (* Util.pnt dbg ("z 0:"^(NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^"\n"); *)
         let _ = NetInt.unt_ptn v0 ri in
         (* Util.pnt dbg ("z 1:"^(NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^"\n"); *)
         let _ = mk_h nm1 h0 v0 p in
         let pi1 = idx_of_net nm1 h0 p in
         (pi := !pi1; ()))
      nm1 in
  (nm1,h0,v0)
and mk_h nm0 h0 v0 p0 =
  Util.pnt dbg ("enter mk_h:"^
                (NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^","^
                (NetSgn.print_line p0)^"\n");
  ( match !p0 with
    | Ret r0 ->
      let _ = free_idx h0 v0 r0 in
      ()
    | Nxt(n1,p1) ->
      ( match n1 with
        | Id (r0,r1) ->
          let _ = free_idx h0 v0 r1 in
          let _ = add_idx h0 v0 r0 in
          mk_h nm0 h0 v0 p1
        | Prj (_,r0,r1) ->
          let _ = free_idx h0 v0 r1 in
          let _ = add_idx h0 v0 r0 in
          mk_h nm0 h0 v0 p1
        | Rm r0 ->
          let _ = free_idx h0 v0 (P_A r0) in
          mk_h nm0 h0 v0 p1
        | Rpc (rs0,r1) ->
          let _ = free_idx h0 v0 (P_A r1) in
          let _ = add_idx h0 v0 (P_Rc (Array.map (fun r -> P_A r) rs0)) in
          mk_h nm0 h0 v0 p1
        | Agl(r0,r1,_,ps) ->
          let _ = free_idx h0 v0 r1 in
          let _ =
            Array.map
              (fun (p,r0) ->
                 let _ = add_idx h0 v0 r0 in
                 mk_h nm0 h0 v0 p)
              ps in
          let _ = add_idx h0 v0 r0 in
          mk_h nm0 h0 v0 p1
        | Call(r0,r1,r2) ->
          let _ = free_idx h0 v0 (P_A r1) in
          let _ = free_idx h0 v0 r2 in
          let _ = add_idx h0 v0 r0 in
          mk_h nm0 h0 v0 p1
        | HCall(_,_) -> err "g 1"
        | Prd (_,_,_,_) -> err "g 2"
        | Nd_Clj(_,_,_,_) -> err "g 3"
        | Ini (r0,_) ->
          let _ = add_idx h0 v0 (P_A r0) in
          mk_h nm0 h0 v0 p1
      )
  )
and free_idx h0 v0 r =
  Util.pnt dbg ("enter free_idx:"^
                (NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^","^
                (print_rcd_ptn NetSgn.print_reg r)^"\n");
  let ri = to_idx h0 r in
  Util.pnt dbg ("ri="^(print_rcd_ptn NetInt.print_reg ri)^"\n");
  let _ = NetInt.get_ptn v0 ri (ref 0) `None in
  Util.pnt dbg ("v0="^(NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^"\n");
  ()
and add_idx h0 v0 r0 =
  Util.pnt dbg ("enter add_idx:"^
                (NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^","^
                (print_rcd_ptn NetSgn.print_reg r0)^"\n");
  ( match r0 with
    | P_A r ->
      let ri = NetInt.add_r v0 (NetInt.Rcd_Rcd [||]) in
      Hashtbl.add h0 r ri;
      ()
    | P_Rc rs ->
      let _ = Array.map (add_idx h0 v0) rs in
      ()
    | P_Ro (rs,rt) ->
      let _ = Array.map (add_idx h0 v0) rs in
      add_idx h0 v0 (P_A rt)
  );
  Util.pnt dbg ("v0="^(NetInt.print_st_v (NetInt.print_rcd_tkn) v0)^"\n")
and idx_of_net m0 h0 p0 =
  ( match !p0 with
    | Ret r0 ->
      let ri0 = to_idx h0 r0 in
      ref (NetInt.Ret ri0)
    | Nxt(n1,p1) ->
      ( match n1 with
        | Id (r0,r1) ->
          let ri1 = to_idx h0 r1 in
          let ri0 = to_idx h0 r0 in
          let pi1 = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Id(ri0,ri1),pi1))
        | Prj (i,r0,r1) ->
          let ri1 = to_idx h0 r1 in
          let ri0 = to_idx h0 r0 in
          let pi1 = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Prj(i,ri0,ri1),pi1))
        | Rm r0 ->
          let ri0 = Hashtbl.find h0 r0 in
          let pi1 = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Rm ri0,pi1))
        | Rpc (rs0,r1) ->
          let ri1 = Hashtbl.find h0 r1 in
          let rsi0 = Array.map (Hashtbl.find h0) rs0 in
          let pi1 = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Rpc(rsi0,ri1),pi1))
        | Agl(r0,r1,is,ps) ->
          let ri1 = to_idx h0 r1 in
          let ri0 = to_idx h0 r0 in
          let psi =
            Array.map
              (fun (p,r0) ->
                 let r0i = to_idx h0 r0 in
                 let pi = idx_of_net m0 h0 p in
                 (pi,r0i))
              ps in
          let pi1 = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Agl(ri0,ri1,is,psi),pi1))
        | Call(r0,r1,r2) ->
          let ri1 = Hashtbl.find h0 r1 in
          let ri2 = to_idx h0 r2 in
          let ri0 = to_idx h0 r0 in
          let pi1 = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Call(ri0,ri1,ri2),pi1))
        | HCall(_,_) -> err "g 1"
        | Prd (_,_,_,_) -> err "g 2"
        | Nd_Clj(_,_,_,_) -> err "g 3"
        | Ini (r0,k) ->
          let ri0 = Hashtbl.find h0 r0 in
          let ki = idx_tkn m0 h0 k in
          let p1i = idx_of_net m0 h0 p1 in
          ref (NetInt.Nxt(NetInt.Ini(ri0,ki),p1i))
      )
  )
and to_idx h0 r0 =
  map_rcd_ptn
    (fun x ->
       let ri = Hashtbl.find h0 x in
       ri)
    r0
and idx_tkn m0 h0 k =
  ( match k with
    | Rcd_Rcd l -> NetInt.Rcd_Rcd (Array.map (idx_tkn m0 h0) l)
    | Rcd_Tkn tk ->
      let tki =
        ( match tk with
          | Tkn_CoP (i,k1) ->
            (NetInt.Tkn_CoP(i,idx_tkn m0 h0 k1))
          | Tkn_P (_,_) -> err "idx_tkn 0"
          | Tkn_Fnc f ->
            let fi =
              ( match f with
                | Fnc (p0,r0) ->
                  let (pi0,_) = List.assq p0 (Array.to_list m0) in
                  let ri0 = to_idx h0 r0 in
                  (NetInt.Fnc (pi0,ri0))
                | Clj (_,_,_) -> err "idx_tkn 1"
                | Pls -> NetInt.Pls
                | Mlt -> NetInt.Mlt
                | Mns -> NetInt.Mns
                | Cmp -> NetInt.Cmp
                | Eq -> NetInt.Eq
                | Inj i -> NetInt.Inj i
                | Cho i -> NetInt.Cho i
                | Fix -> NetInt.Fix
                | Exn -> NetInt.Exn
              ) in
            (NetInt.Tkn_Fnc fi)
          | Tkn_Z z -> NetInt.Tkn_Z z
          | Tkn_Stg s -> NetInt.Tkn_Stg s
          | Tkn_Bol b -> NetInt.Tkn_Bol b
          | Tkn_Sgn p -> NetInt.Tkn_Sgn p
        ) in
      NetInt.Rcd_Tkn tki
  )
