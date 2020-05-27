open Types
let err s = raise (Failure s)
(* type plc = Plc of Sgn.t *)
type plc = int * int
type reg = int
type nd =
  | Spt of regs * reg (* from heap to reg *)
  | Cns of reg * regs (* from reg to heap *)
  | Rm of reg
  | Id_R of regs * reg
  | Id_M of reg * reg
  | Agl_M of reg * reg * (plc array)
  | Agl_R of regs * reg * (plc array)
  | Call_MM of reg * reg * reg
  | Call_MR of reg * reg * regs
  | Call_RM of regs * reg * reg
  | Call_RR of regs * reg * regs
  | HCall of (src array) * ((reg * src) array)
  | Prd of reg * src * src * (plc array)
  | Nd_Clj of reg * src * src * plc
  | Ini_Tkn of reg * tkn
and src =
  | Src_Rcd of reg array
  | Src_Mno of reg
and regs = reg array
and asm = (src * (nd array)) array
and tkn =
  | Tkn_Unt
  | Rcd of ptr array
  | Tkn_Stg of string
  | Tkn_Z of int
  | Tkn_Bol of bool
  | Tkn_Sgn of Sgn.t
  | Tkn_CoP of int * ptr
  | Tkn_P of (plc array) * ptr * ptr
  | Tkn_Fnc of tkn_fnc
and tkn_fnc =
  | Pls
  | Mlt
  | Mns
  | Cmp
  | Eq
  | Inj of int
  | Cho of int
  | Fix
  | Exn
  | Fnc of plc (* jmp_ptr arg_ptr *)
  | Clj of plc * ptr (* jmp_ptr arg0 { arg0 x } *)
and ptr = Ptr_Reg of reg | Ptr_Hp of tkn ref
type st = (tkn option array) * (cs Stack.t)
and cs =
  | CS of plc * src * st_h (* return-plc * return-reg *)
  | CS_A of plc * src
  | CS_L of plc * src * st_h * (tkn option S_Ref.t)
  | CS_R of plc * src * st_h * (tkn option S_Ref.t)
and st_h = (reg * tkn) list
let get_r rv r =
  let k = rv.(r) in
  rv.(r)<-None;
  k
let get_rs rv rs =
  Array.map (fun r -> get_r rv r) rs
let get_p rv p =
  ( match p with
    | Ptr_Reg r -> get_r rv r
    | Ptr_Hp l -> Some !l )
let set_r rv r k0=
  let k1 = rv.(r) in
  ( match k1 with
    | None ->
      rv.(r)<-k1
    | Some _ -> raise @@ Failure "set_r 0" )
let set_rs rv r ks =
  Array.mapi
    (fun i k ->
       ( match k with
         | None -> ()
         | Some k -> set_r rv (r+i) k))
    ks
let rec free_r rv r =
  ( match get_r rv r with
    | None -> raise @@ Failure "free_r 0"
    | Some k -> free_k rv k
  )
and free_p rv p =
  ( match p with
    | Ptr_Reg r1 -> (free_r rv r1)
    | Ptr_Hp p1 -> free_k rv !p1 )
and free_k rv k =
  ( match k with
    | Rcd rs ->
      Rcd (Array.mapi
             (fun _ p ->
                let k = free_p rv p in
                Ptr_Hp (ref k))
             rs)
    | Tkn_CoP (i,p) -> Tkn_CoP (i,Ptr_Hp(ref (free_p rv p)))
    | Tkn_P (ps,p1,p2) -> Tkn_P(ps,Ptr_Hp(ref (free_p rv p1)),Ptr_Hp(ref (free_p rv p2)))
    | Tkn_Fnc Clj (t0,p0) -> Tkn_Fnc (Clj(t0,Ptr_Hp(ref (free_p rv p0))))
    | x -> x )
let free_rs rv rs =
  let rl = Array.map (fun x -> free_r rv x) rs in
  rl
let free_v rv =
  Array.map
    (fun k ->
       ( match k with
         | None -> ()
         | Some k ->
           let _ = free_k rv k in
           () ))
    rv
let to_list rv =
  let (_,l) =
    Array.fold_left
      (fun (i,l) k ->
         ( match k with
           | None -> (i+1,l)
           | Some k -> (i+1,(i,k)::l)))
      (0,[]) rv in
  l
let set_list_r rv l =
  List.fold_left
    (fun _ (r,k) -> set_r rv r k)
    () l
let rec run a p0 n0 rv cs =
  let (rs0,ap0) = a.(p0) in
  ( try
      let o0 = ap0.(n0) in
      ( match o0 with
        | Id_M (r1,r2) ->
          let k2 = get_r rv r2 in
          ( match k2 with
            | Some k2 ->
              let _ = set_r rv r1 k2 in
              run a p0 (n0+1) rv cs
            | None -> err "vm2.run:10")
        | Rm r0 ->
          let _ = free_r rv r0 in
          run a p0 (n0+1) rv cs
        | Agl_R (rs0,r1,ps) ->
          let k1 = get_r rv r1 in
          ( match k1 with
            | Some Tkn_CoP (i,p3) ->
              let k2 = get_p rv p3 in
              ( match k2 with
                | Some k2 ->
                  let _ = set_r rv r1 k2 in
                  Stack.push (CS_A ((p0,n0+1),Src_Rcd rs0)) cs;
                  let (p1,_) = ps.(i) in
                  run a p1 0 rv cs
                | _ -> raise (Failure "vm2.run:11"))
            | Some Tkn_Z z ->
              if z=0 then
                ( let _ = set_r rv r1 Tkn_Unt in
                  Stack.push (CS_A ((p0,n0+1),Src_Rcd rs0)) cs;
                  let (p1,_) = ps.(0) in
                  run a p1 0 rv cs )
              else
                ( let _ = set_r rv r1 Tkn_Unt in
                  Stack.push (CS_A ((p0,n0+1),Src_Rcd rs0)) cs;
                  let (p1,_) = ps.(1) in
                  run a p1 0 rv cs )
            | _ -> raise (Failure "vm2:x0")
          )
        | Call_MM(r0,rf,r1) ->
          let k_f = get_r rv rf in
          let kx = get_r rv r1 in
          ( match k_f,kx with
            | Some Tkn_Fnc Mns,Some Tkn_Z z ->
              let _ = set_r rv r0 (Tkn_Z (-z)) in
              run a p0 (n0+1) rv cs
            | Some Tkn_Fnc Inj i,Some kx ->
              let _ = set_r rv r0 (Tkn_CoP (i,Ptr_Hp (ref kx))) in
              run a p0 (n0+1) rv cs
            | Some Tkn_Fnc Cho _,_ -> err "err 7"
            | Some Tkn_Fnc Exn,_ -> err "err 8"
            | Some Tkn_Fnc Fix,_ -> err "err 9"
            | Some Tkn_Fnc Fnc (pa,_),Some kx ->
              let kx = free_k rv kx in
              let l = to_list rv in
              let _ = set_r rv 0 kx in
              Stack.push (CS((p0,n0+1),Src_Mno r0,l)) cs;
              (* Util.pnt dbg ("call : "^(pnt_plc t0)^","
                             ^(pnt_reg r0)^","^
                             (print_k_rcd k0)^"\n"); *)
              run a pa 0 rv cs
            | Some Tkn_Fnc Clj ((pa,_),l0),Some kx ->
              let kx = free_k rv kx in
              let kx0 = free_p rv l0 in
              let l = to_list rv in
              let _ = set_r rv 0 kx0 in
              let _ = set_r rv 1 kx in
              Stack.push (CS((p0,n0+1),Src_Mno r0,l)) cs;
              run a pa 0 rv cs
            | _ -> err "err 8" )
        | Call_MR (r0,rf,rs1) ->
          let k_f = get_r rv rf in
          let ks = get_rs rv rs1 in
          let kl = Array.to_list ks in
          ( match k_f,kl with
            | Some Tkn_Fnc Pls,(Some Tkn_Z z1)::(Some Tkn_Z z2)::[] ->
              let _ = set_r rv r0 (Tkn_Z (z1+z2)) in
              run a p0 (n0+1) rv cs
            | Some Tkn_Fnc Mlt,(Some Tkn_Z z1)::(Some Tkn_Z z2)::[] ->
              let _ = set_r rv r0 (Tkn_Z (z1*z2)) in
              run a p0 (n0+1) rv cs
            | Some Tkn_Fnc Cmp,(Some Tkn_Z z1)::(Some Tkn_Z z2)::[] ->
              let b = if z1<=z2 then 1 else 0 in
              let _ = set_r rv r0 (Tkn_Z b) in
              run a p0 (n0+1) rv cs
            | Some Tkn_Fnc Eq,(Some x)::(Some y)::[] ->
              let (kx,ky) = (free_k rv x,free_k rv y) in
              let b = if kx=ky then 1 else 0 in
              let _ = set_r rv r0 (Tkn_Z b) in
              run a p0 (n0+1) rv cs
            | Some Tkn_Fnc Fnc (pa,_),_ ->
              let k2 = Array.map
                  (fun k ->
                     match k with
                     | None -> None
                     | Some k -> Some (free_k rv k))
                  ks in
              let l = to_list rv in
              let _ = set_rs rv 0 k2 in
              Stack.push (CS((p0,n0+1),Src_Mno r0,l)) cs;
              (* Util.pnt dbg ("call : "^(pnt_plc t0)^","
                             ^(pnt_reg r0)^","^
                             (print_k_rcd k0)^"\n"); *)
              run a pa 0 rv cs
            | _ -> err "err 8" )
        | Call_RM (rs0,rf,r1) ->
          let k_f = get_r rv rf in
          let k1 = get_r rv r1 in
          ( match k_f,k1 with
            | Some Tkn_Fnc Fnc (pa,_),Some kx ->
              let kx = free_k rv kx in
              let l = to_list rv in
              let _ = set_r rv 0 kx in
              Stack.push (CS((p0,n0+1),Src_Rcd rs0,l)) cs;
              (* Util.pnt dbg ("call : "^(pnt_plc t0)^","
                             ^(pnt_reg r0)^","^
                             (print_k_rcd k0)^"\n"); *)
              run a pa 0 rv cs
            | Some Tkn_Fnc Clj ((pa,_),l0),Some kx ->
              let kx = free_k rv kx in
              let kx0 = free_p rv l0 in
              let l = to_list rv in
              let _ = set_r rv 0 kx0 in
              let _ = set_r rv 1 kx in
              Stack.push (CS((p0,n0+1),Src_Rcd rs0,l)) cs;
              run a pa 0 rv cs
            | _ -> err "err 8" )
        | Call_RR (rs0,rf,rs1) ->
          let k_f = get_r rv rf in
          let ks = get_rs rv rs1 in
          ( match k_f,ks with
            | Some Tkn_Fnc Fnc (pa,_),_ ->
              let k2 = Array.map
                  (fun k ->
                     match k with
                     | None -> None
                     | Some k -> Some (free_k rv k))
                  ks in
              let l = to_list rv in
              let _ = set_rs rv 0 k2 in
              Stack.push (CS((p0,n0+1),Src_Rcd rs0,l)) cs;
              (* Util.pnt dbg ("call : "^(pnt_plc t0)^","
                             ^(pnt_reg r0)^","^
                             (print_k_rcd k0)^"\n"); *)
              run a pa 0 rv cs
            | _ -> err "err 8" )
        | HCall (_,_) ->
          (* let (y1,y2) = (sgn(),sgn()) in
             let (kf1,kx1,kf2,kx2) = (get_k v f1,get_k *) raise (Failure "vm1.run:7")
        | Prd (r0,rs1,rs2,ps) -> err "err 10"
        | Nd_Clj (r0,rs1,rs2,p0) -> err "err 11"
        | Cns (r0,rs1) ->
          let rp1 = Array.map (fun r -> Ptr_Reg r) rs1 in
          let _ = set_r rv r0 (Rcd rp1) in
          run a p0 (n0+1) rv cs
        | Ini_Tkn (r0,k) ->
          let _ = set_r rv r0 k in
          run a p0 (n0+1) rv cs
        | Id_R (rs0,r2) ->
          let k0 = get_r rv r2 in
          let _ = Array.map (fun r -> set_r rv r k0) rs0 in
          run a p0 (n0+1) rv cs
        | Spt(rs1,r2) ->
          let k0 = get_r rv r2 in
          ( match k0 with
            | Some Rcd c ->
              let _ =
                Array.mapi
                  (fun i p ->
                     let k = get_p rv p in
                     ( match k with
                       | None -> err "err 11"
                       | Some k ->
                         set_r rv rs1.(i) k ))
                  c in
              run a p0 (n0+1) rv cs
            | _ -> err "err 12" )
      )
    with _ ->
      ( match rs0 with
        | Src_Mno r0 ->
          let k0 = free_r rv r0 in
          let _ = free_v rv in
          if (Stack.is_empty cs) then k0
          else
            let hd = Stack.pop cs in
            ( match hd with
              | CS ((p0,n0),Src_Mno r1,l) ->
                set_list_r rv l;
                let _ = set_r rv r1 k0 in
                run a p0 n0 rv cs
              | CS_A ((p0,n0),Src_Mno r1) ->
                let _ = set_r rv r1 k0 in
                run a p0 n0 rv cs
              | _ -> raise (Failure "vm1.run:0")
            ))
  )
let rec asm_of_code tb a p0 (rv,rh) r0 c v0 =
  (* Util.pnt true (
     "enter asm_of_code"^
     (print_asm a)^","^
     (pnt_plc p0)^","^(pnt_reg r0)^"\n"); *)
  let _ = Core.Hashtbl.add tb ~key:v0 ~data:(p0,r0) in
  let f0 = get_code c v0 in
  ( match f0 with
    | V_S (v1,v2) ->
      let pm0 = asm_of_code tb a p0 (rv,rh) r0 c v1 in
      (* Util.pnt true (print_asm a); *)
      let o1 = Core.Hashtbl.find a pm0 in
      ( match o1 with
        | Some Ret r1 ->
          Core.Hashtbl.remove a pm0;
          let pm1 = asm_of_code tb a (Plc pm0) (rv,rh) r1 c v2 in
          pm1
        | _ -> raise (Failure ("vm2:a0:"^(pnt_plc (Plc pm0)))))
    | H_S (_,_) -> raise (Failure "vm2:a1")
    | E_S n1 ->
      let (p1,r2,_) = asm_of_tns_tl tb a p0 (rv,rh) r0 c n1 in
      (* Util.pnt true "test1\n"; *)
      let _ = asm_add a p1 (Ret r2) in
      (plc_to p1)
    | P_S (_,_) -> raise (Failure "vm2:a2")
    | A_S (n1,l) ->
      (* Util.pnt true "vm2:d1\n"; *)
      let (p1,r1,ra) = asm_of_tns_tl tb a p0 (rv,rh) r0 c n1 in
      ( match ra with
        | Some ra ->
          (* Util.pnt true "vm2:d0\n"; *)
          let ps = List.map (fun _ -> plc ()) l in
          let pa = Array.of_list ps in
          let r2 = add_k_r rv Tkn_Unt in
          let np = plc () in
          let _ = asm_add a p1 (Op(Agl(r2,ra,pa),np)) in
          let lp = List.combine ps l in
          let _ = List.map (fun (pf,f) -> asm_of_code tb a pf (rv,rh) r1 c f) lp in
          let _ = asm_add a np (Ret r2) in
          (plc_to np)
        | _ -> raise (Failure "vm2:a3")
      )
    | F_S (_,_,_) -> raise (Failure "vm2:a4")
  )
and asm_of_tns_tl tb a p0 (rv,rh) r0 c n0 =
  (* Util.pnt true ("enter asm_of_tns_tl:"^(Print.print_tns_s n0)^"\n"); *)
  ( match !n0 with
    | PL_x n1 ->
      let (np0,rr,_) = asm_of_tns_tl tb a p0 (rv,rh) r0 c n1 in
      let r1 = add_k_r rv Tkn_Unt in
      let r2 = add_k_r rv Tkn_Unt in
      let (np1,np2) = (plc (),plc ()) in
      let _ = asm_add a np0 (Op(Spt((r1,r2),rr),np1)) in
      let _ = free_r (rv,rh) rr in
      let _ = asm_add a np1 (Op(Rm r2,np2)) in
      let _ = free_r (rv,rh) r2 in
      (np2,r1,None)
    | PR_x n1 ->
      let (np0,rr,_) = asm_of_tns_tl tb a p0 (rv,rh) r0 c n1 in
      let r1 = add_k_r rv Tkn_Unt in
      let r2 = add_k_r rv Tkn_Unt in
      let (np1,np2) = (plc (),plc ()) in
      let _ = asm_add a np0 (Op(Spt((r1,r2),rr),np1)) in
      let _ = free_r (rv,rh) rr in
      let _ = asm_add a np1 (Op(Rm r1,np2)) in
      let _ = free_r (rv,rh) r1 in
      (np2,r2,None)
    | Inj_x i ->
      let r1 = add_k_r rv Tkn_Unt in
      let np0 = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Inj i),np0)) in
      (np0,r1,None)
    | Cho_x i ->
      let r1 = add_k_r rv Tkn_Unt in
      let np0 = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Cho i),np0)) in
      (np0,r1,None)
    | Agl_x n1 ->
      let (p1,r2,_) = asm_of_tns_tl tb a p0 (rv,rh) r0 c n1 in
      (p1,r2,Some r2)
    | Rot_x ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Id(r1,r0),np)) in
      let _ = free_r (rv,rh) r0 in
      (* Util.pnt true "test0\n"; *)
      (np,r1,None)
    | Unt_x ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Unt),np)) in
      (np,r1,None)
    | Plg_x q1 when q1=nd_pls ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Pls),np)) in
      (np,r1,None)
    | Plg_x q1 when q1=nd_mlt ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Mlt),np)) in
      (np,r1,None)
    | Plg_x q1 when q1=nd_mns ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Mns),np)) in
      (np,r1,None)
    | Plg_x q1 when q1=nd_std_le ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Cmp),np)) in
      (np,r1,None)
    | Plg_x q1 when q1=nd_eq ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Eq),np)) in
      (np,r1,None)
    | Plg_x q1 ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      ( try
          let (t2,r2) =
            ( match Core.Hashtbl.find tb q1 with
              | Some (p2,r2) -> (p2,r2)
              | _ -> raise (Failure "vm2.asm_of_tns_tl:0")) in
          let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Fnc(t2,r2)),np)) in
          (np,r1,None)
        with _ ->
          let p2 = plc () in
          (* let r2 = add_k_r rv Tkn_Unt in*)
          let vl = to_list rv in
          let _ = set_k_r rv 0 Tkn_Unt in
          let _ = asm_of_code tb a p2 (rv,rh) 0 c q1 in
          let _ = to_list rv in
          let _ = set_list_r rv vl in
          let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Fnc(p2,0)),np)) in
          (np,r1,None))
    | Z_x z ->
      (* Util.pnt true "test0\n"; *)
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Z z),np)) in
      (np,r1,None)
    | Stg_x s ->
      let r1 = add_k_r rv Tkn_Unt in
      let np = plc () in
      let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Stg s),np)) in
      (np,r1,None)
    | TnsT (n1,n2) ->
      let r0_0 = add_k_r rv Tkn_Unt in
      let r0_1 = add_k_r rv Tkn_Unt in
      let p0x = plc () in
      let _ = asm_add a p0 (Op(Rpc((r0_0,r0_1),r0),p0x)) in
      let _ = free_r (rv,rh) r0 in
      let (np1,nr1,o1) = asm_of_tns_tl tb a p0x (rv,rh) r0_0 c n1 in
      let (np2,nr2,o2) = asm_of_tns_tl tb a np1 (rv,rh) r0_1 c n2 in
      let o3 =
        ( match o1,o2 with
          | Some ro ,_ -> Some ro
          | _, Some ro -> Some ro
          | _,_ -> None ) in
      let p3 = plc () in
      let r4 = add_k_r rv Tkn_Unt in
      let _ = asm_add a np2 (Op(Cns(r4,(nr1,nr2)),p3)) in
      (p3,r4,o3)
    | AppT (n1,n2) ->
      let r0_0 = add_k_r rv Tkn_Unt in
      let r0_1 = add_k_r rv Tkn_Unt in
      let p0x = plc () in
      let _ = asm_add a p0 (Op(Rpc((r0_0,r0_1),r0),p0x)) in
      let _ = free_r (rv,rh) r0 in
      let (np1,nr1,_) = asm_of_tns_tl tb a p0x (rv,rh) r0_0 c n1 in
      let (np2,nr2,_) = asm_of_tns_tl tb a np1 (rv,rh) r0_1 c n2 in
      let p3 = plc () in
      let r4 = add_k_r rv Tkn_Unt in
      let _ = asm_add a np2 (Op(Call(r4,(nr1,nr2)),p3)) in
      let _ = free_r (rv,rh) nr1 in
      let _ = free_r (rv,rh) nr2 in
      (p3,r4,None)
  )
let rec k_rcd_of_tkn_s tb v =
  ( match v with
    | TknS_Stg s -> Atm (Tkn_Stg s)
    | TknS_Z z -> Atm (Tkn_Z z)
    | TknS_Plg q1 when q1=nd_pls -> Atm Tkn_Pls
    | TknS_Plg q1 when q1=nd_mlt -> Atm Tkn_Mlt
    | TknS_Plg q1 when q1=nd_mns -> Atm Tkn_Mns
    | TknS_Plg q1 when q1=nd_std_le -> Atm Tkn_Cmp
    | TknS_Plg q1 when q1=nd_eq -> Atm Tkn_Eq
    | TknS_Plg q1 ->
      let (p2,r2) =
        ( match Core.Hashtbl.find tb q1 with
          | Some x -> x
          | _ -> raise (Failure "vm2.k_rcd_of_tkn_s")) in
      Atm (Tkn_Fnc(p2,r2))
    | TknS_Unt -> Rcd []
    | TknS_Inj i -> Atm (Tkn_Inj i)
    | TknS_Cho i -> Atm (Tkn_Cho i)
    | TknS_Tns (v1,v2) ->
      let k1 = k_rcd_of_tkn_s tb v1 in
      let k2 = k_rcd_of_tkn_s tb v2 in
      ( match k2 with
        | Rcd l ->
          Rcd (k1::l)
        | _ -> raise (Failure "vm2:s9"))
  )
let rec tkn_s_of_k tb (v,h) p =
  ( match get_k_p (v,h) p with
    | Some x ->
      ( match x with
        | Tkn_Unt -> TknS_Unt
        | Tkn_Stg s -> TknS_Stg s
        | Tkn_Z z -> TknS_Z z
        | Tkn_Bol b -> TknS_Z (if b then 1 else 0)
        | Tkn_Sgn p -> TknS_Plg p
        | Tkn_Ln l1 -> tkn_s_of_k tb (v,h) (Ptr_Hp l1)
        | Tkn_Tns (r1,r2) -> TknS_Tns(tkn_s_of_k tb (v,h) r1,tkn_s_of_k tb (v,h) r2)
        | Tkn_CoP (i,r1) -> TknS_Tns(TknS_Inj i,tkn_s_of_k tb (v,h) r1)
        | Tkn_P (_,_,_) -> raise (Failure "vm2:sk0")
        | Tkn_Pls -> TknS_Plg nd_pls
        | Tkn_Mlt -> TknS_Plg nd_mlt
        | Tkn_Mns -> TknS_Plg nd_mns
        | Tkn_Cmp -> TknS_Plg nd_std_le
        | Tkn_Eq -> TknS_Plg nd_eq
        | Tkn_Inj i -> TknS_Inj i
        | Tkn_Cho i -> TknS_Cho i
        | Tkn_Fix -> raise (Failure "vm2:sk1")
        | Tkn_Exn -> raise (Failure "vm2:sk2")
        | Tkn_Fnc (_,_) -> TknS_Stg "Fnc"
        | Tkn_Clj (_,_,_) -> TknS_Stg "Clj"
      )
    | _ -> raise (Failure "vm2:sk3")
  )
