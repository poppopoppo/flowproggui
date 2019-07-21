
type 'p tkn =
  | Tkn_Unt
  | Tkn_Stg of string
  | Tkn_Z of int
  | Tkn_Bol of bool
  | Tkn_Sgn of Sgn.t
  | Tkn_Ln of 'p
  | Tkn_Tns of 'p * 'p
  | Tkn_CoP of int * 'p
  | Tkn_P of (plc array) * 'p * 'p
  | Tkn_Pls
  | Tkn_Mlt
  | Tkn_Mns
  | Tkn_Cmp
  | Tkn_Eq
  | Tkn_Inj of int
  | Tkn_Cho of int
  | Tkn_Fix
  | Tkn_Exn
  | Tkn_Fnc of plc * 'p (* jmp_ptr arg_ptr *)
  | Tkn_Clj of plc * ptr * 'p (* jmp_ptr arg0 { arg0 x } *)
type 'p tkn_rcd =
  | Rcd of ('p array)
  | Rcd_Ln of 'p
  | Rcd_Atm of 'p tkn
module VM0 = struct
  type plc = Plc of Sgn.t
  type code =
    | V of plc * plc
    | H of plc * plc
    | E of tns
    | P of tns * (plc array)
    | A of tns * (plc array)
    | F of tns * int * plc
  and tns =
    | PL of tns
    | PR of tns
    | Inj of int
    | Cho of int
    | Agl of tns
    | Rot
    | Unt
    | Sgn of Sgn.t
    | Z of int
    | Stg of string
    | Tns of tns * tns
    | App of tns * tns
end
module VM1 = struct
  type plc = Plc of Sgn.t
  type reg = Reg of Sgn.t
  type tkn = plc tkn_rcd
  type nd =
    | Spt of (reg array) * reg (* from heap to reg *)
    | Cns of reg * (reg array) (* from reg to heap *)
    | Rm of reg
    | Rpc of (reg array) * reg
    | Id of reg * reg
    | Agl of (reg array) * reg * (plc array)
    | Call of (reg array) * reg * (reg array)
    | HCall of ((reg array) array) * ((reg * (reg array)) array)
    | Prd of reg * (reg array) * (reg array) * (plc array)
    | Clj of reg * (reg array) * (reg array) * plc
    | Ini_Tkn of reg * tkn
end
module VM2 = struct
  (* type plc = Plc of Sgn.t *)
  type plc = int
  type reg = int
  type nd =
    | Spt of (reg array) * reg (* from heap to reg *)
    | Cns of reg * (reg array) (* from reg to heap *)
    | Rm of reg
    | Rpc of (reg array) * reg
    | Id of reg * reg
    | Agl of (reg array) * reg * (plc array)
    | Call of (reg array) * reg * (reg array)
    | HCall of ((reg array) array) * ((reg * (reg array)) array)
    | Prd of reg * (reg array) * (reg array) * (plc array)
    | Clj of reg * (reg array) * (reg array) * plc
    | Ini_Tkn of reg * tkn
  type asm = ((reg array) * (nd array)) array
  and tkn =
    | Rcd of tkn array|
    | Tkn_Stg of string
    | Tkn_Z of int
    | Tkn_Bol of bool
    | Tkn_Sgn of Sgn.t
    | Tkn_Ln of tkn ref
    | Tkn_CoP of int * ptr
    | Tkn_P of (plc array) * ptr * ptr
    | Tkn_Pls
    | Tkn_Mlt
    | Tkn_Mns
    | Tkn_Cmp
    | Tkn_Eq
    | Tkn_Inj of int
    | Tkn_Cho of int
    | Tkn_Fix
    | Tkn_Exn
    | Tkn_Fnc of plc (* jmp_ptr arg_ptr *)
    | Tkn_Clj of plc * ptr (* jmp_ptr arg0 { arg0 x } *)
  and ptr = Ptr_Reg of reg | Ptr_Hp of tkn ref
  type st = tkn * (cs Stack.t)
  and cs =
    | CS of plc * (reg array) * st_h (* return-plc * return-reg *)
    | CS_A of plc * (reg array)
    | CS_L of plc * (reg array) * st_h * (tkn option S_Ref.t)
    | CS_R of plc * (reg array) * st_h * (tkn option S_Ref.t)
  and st_h = (reg * tkn) list
  let rec run a p0 n0 (k0,cs) =
    let (rs0,ap0) = a.(p0) in
    ( try
        let o0 = ap0.(n0) in
        ( match o0 with
          | Id (r1,r2) ->
            let k2 = get_r (v,h) r2 in
            ( match k2 with
              | Some k2 ->
                let _ = set_r (v,h) r1 k2 in
                run a np (v,h) cs
              | None -> raise (Failure "vm2.run:10"))
          | Rm r0 ->
            let _ = free_r (v,h) r0 in
            run a np (v,h) cs
          | Agl (rs0,r1,ps) ->
            let k1 = get_k_r v r1 in
            ( match k1 with
              | Some Tkn_CoP (i,p3) ->
                let k2 = get_k_p (v,h) p3 in
                ( match k2 with
                  | Some k2 ->
                    let _ = set_k_r v r1 k2 in
                    Stack.push (CS_A (np,rs0)) cs;
                    run a ps.(i) (v,h) cs
                  | _ -> raise (Failure "vm2.run:11"))
              | Some Tkn_Z z ->
                if z=0 then
                  ( let _ = set_k_r v r1 Tkn_Unt in
                    Stack.push (CS_A (np,r0)) cs;
                    run a ps.(0) (v,h) cs )
                else
                  ( let _ = set_k_r v r1 Tkn_Unt in
                    Stack.push (CS_A (np,r0)) cs;
                    run a ps.(1) (v,h) cs )
              | _ -> raise (Failure "vm2:x0")
            )
          | Call (ys,(f,xs)) ->
            let k_f = get_k_r v f in
            ( match k_f with
              | Some k_f ->
                ( match k_f with
                  | Tkn_Pls ->
                    let k_xl = free_r (v,h) x in
                    ( match k_xl with
                      | Some Rcd ((Atm Tkn_Z z1)::(Atm Tkn_Z z2)::[]) ->
                        let _ = set_k_r v y (Tkn_Z (z1+z2)) in
                        run a np (v,h) cs
                      | _ -> raise (Failure "vm1.run:2") )
                  | Tkn_Mlt ->
                    let k_xl = free_r (v,h) x in
                    ( match k_xl with
                      | Some Rcd  ((Atm Tkn_Z z1)::(Atm Tkn_Z z2)::[]) ->
                        let _ = set_k_r v y (Tkn_Z (z1*z2)) in
                        run a np (v,h) cs
                      | _ -> raise (Failure "vm1.run:3") )
                  | Tkn_Mns ->
                    let k = get_k_r v x in
                    ( match k with
                      | Some (Tkn_Z z1) ->
                        let _ = set_k_r v y (Tkn_Z (-z1)) in
                        run a np (v,h) cs
                      | _ -> raise (Failure "vm1.run:2") )
                  | Tkn_Cmp ->
                    let k_xl = free_r (v,h) x in
                    ( match k_xl with
                      | Some Rcd ((Atm Tkn_Z z1)::(Atm Tkn_Z z2)::[]) ->
                        let b = if z1<=z2 then 1 else 0 in
                        let _ = set_k_r v y (Tkn_Z b) in
                        run a np (v,h) cs
                      | _ -> raise (Failure "vm1.run:2") )
                  | Tkn_Eq ->
                    let k_r = free_r (v,h) x in
                    ( match k_r with
                      | Some Rcd (x1::x2::[]) ->
                        if x1=x2 then
                          ( let _ = set_k_r v y (Tkn_Bol true) in
                            run a np (v,h) cs)
                        else
                          ( let _ = set_k_r v y (Tkn_Bol false) in
                            run a np (v,h) cs)
                      | _ -> raise (Failure "vm1.run:3"))
                  | Tkn_Inj b ->
                    let k0 = get_k_r v x in
                    ( match k0 with
                      | Some k0 ->
                        let r0 = add_k_r v k0 in
                        let _ = set_k_r v y (Tkn_CoP (b,Ptr_Reg r0)) in
                        run a np (v,h) cs
                      | _ -> raise (Failure "vm1.run:13"))
                  | Tkn_Cho _ -> raise (Failure "vm1.run:4")
                  | Tkn_Fix -> raise (Failure "vm1.run:5")
                  | Tkn_Exn -> raise (Failure "vm1.run:6")
                  | Tkn_Fnc t0 ->
                    let k0 = free_r (v,h) x in
                    ( match k0 with
                      | Some k0 ->
                        let l = to_list v in
                        (* let _ = free_v (v,h) in *)
                        let _ = set_k_rcd_r (v,h) r0 k0 in
                        Stack.push (CS(np,y,l)) cs;
                        (* Util.pnt dbg ("call : "^(pnt_plc t0)^","
                                       ^(pnt_reg r0)^","^
                                       (print_k_rcd k0)^"\n"); *)
                        run a t0 (v,h) cs
                      | None -> raise @@ Failure ("vm3.run:gkr:2"))
                  | Tkn_Clj (t0,p0) ->
                    let k0 = free_r (v,h) x in
                    ( match k0 with
                      | Some k0 ->
                        let k1 = free (v,h) p0 in
                        ( match k1 with
                          | Some k1 ->
                            let l = to_list v in
                            (* let _ = free_v (v,h) in *)
                            let _ = set_k_rcd_r (v,h) r1 (Rcd [k0;k1]) in
                            Stack.push (CS(np,y,l)) cs;
                            run a t0 (v,h) cs
                          | None -> raise @@ Failure ("vm3.run:gkr:4"))
                      | _ -> raise @@ Failure ("vm3.run:gkr:3"))
                  | _ -> raise (Failure "vm2:run9")
                )
              | _ -> raise (Failure "vm2.run:15")
            )
          | HCall (_,_) ->
            (* let (y1,y2) = (sgn(),sgn()) in
               let (kf1,kx1,kf2,kx2) = (get_k v f1,get_k *) raise (Failure "vm1.run:7")
          | Prd (r0,rs1,rs2,ps) ->
            let k0 = free_r (v,h) r1 in
            ( match k0 with
              | Some k0 ->
                let l3 = add_k_rcd_h h k0 in
                let _ = set_k_r v r0 (Tkn_P(ps,Ptr_Hp l3,Ptr_Reg r2)) in
                run a np (v,h) cs
              | None -> raise @@ Failure ("vm3.run:gkr:5"))
          | Clj (r0,rs1,rs2,p0) ->
            let k0 = free_r (v,h) r1 in
            ( match k0 with
              | Some k0 ->
                let l3 = add_k_rcd_h h k0 in
                let _ = set_k_r v r0 (Tkn_Clj(p0,Ptr_Hp l3,r2)) in
                run a np (v,h) cs
              | _ -> raise @@ Failure ("vm3.run:gkr:6"))
          | Cns (r0,rs1) ->
            let _ = set_k_r v r0 (Tkn_Tns(Ptr_Reg r1,Ptr_Reg r2)) in
            run a np (v,h) cs
          | Ini_Tkn (r0,k) ->
            let _ = set_k_r v r0 k in
            run a np (v,h) cs
          | Rpc (rs0,r2) ->
            let rpc () =
              let k0 = free_r (v,h) r2 in
              ( match k0 with
                | Some k0 ->
                  let l0 = add_k_rcd_h h k0 in
                  let _ = ln h l0 in
                  let _ = set_k_r v r0 (Tkn_Ln l0) in
                  let _ = set_k_r v r1 (Tkn_Ln l0) in
                  run a np (v,h) cs
                | _ ->
                  (* Util.pnt dbg ("enter vm2.run:"^(pnt_plc p)^","^(print_st (v,h))^"\n"); *)
                  raise @@ Failure ("vm3.run:gkr:7")) in
            rpc ()
          | Spt(rs1,r2) ->
            let spt () =
              let k0 = get_k_r v r3 in
              let rec spt k0 =
                ( match k0 with
                  | Some Tkn_Tns(p4,p5) ->
                    let k1 = free (v,h) p4 in
                    let k2 = free (v,h) p5 in
                    ( match k1,k2 with
                      | Some k1,Some k2 ->
                        let _ = set_k_rcd_r (v,h) r1 k1 in
                        let _ = set_k_rcd_r (v,h) r2 k2 in
                        ()
                      | _,_ -> raise (Failure "vm2.run:14"))
                  | Some Tkn_Ln l1 ->
                    let k1 = get_k_h h l1 in
                    spt k1
                  | _ -> raise (Failure "vm2.run:00")
                ) in
              spt k0;
              run a np (v,h) cs in
            spt ()
          | Axm(_,_) -> raise (Failure "vm2.run:01")
        )
    )
  | _ -> raise (Failure ("vm2.run:17"^(pnt_plc p)))
)
|   | (Ret r0) ->
  (* Util.pnt dbg ("ret "^(pnt_reg r0)^"\n"); *)
  let k0 = free_r (v,h) r0 in
  let _ = free_v (v,h) in
  ( match k0 with
    | Some k0 ->
      if (Stack.is_empty cs) then k0
      else
        let hd = Stack.pop cs in
        ( match hd with
          | CS (p0,r1,l) ->
            set_list_r v l;
            let _ = set_k_rcd_r (v,h) r1 k0 in
            run a p0 (v,h) cs
          | CS_A (p0,r1) ->
            let _ = set_k_rcd_r (v,h) r1 k0 in
            run a p0 (v,h) cs
          | _ -> raise (Failure "vm1.run:0") )
    | None -> raise @@ Failure ("vm3.run:get_k_rcd:1")
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

end
