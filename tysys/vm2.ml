open Types
type reg = Sgn.t
type plc = Sgn.t
type tkn =
  | Tkn_Unt
  | Tkn_Stg of string
  | Tkn_Z of int
  | Tkn_Bol of bool
  | Tkn_Sgn of Sgn.t
  | Tkn_Ln of reg
  | Tkn_Tns of reg * reg
  | Tkn_CoP of int * reg
  | Tkn_P of (plc array) * reg * reg
  | Tkn_Pls
  | Tkn_Mlt
  | Tkn_Mns
  | Tkn_Cmp
  | Tkn_Eq
  | Tkn_Inj of int
  | Tkn_Cho of int
  | Tkn_Fix
  | Tkn_Exn
  | Tkn_Fnc of plc * reg (* jmp_ptr arg_ptr *)
  | Tkn_Clj of plc * reg * reg (* jmp_ptr arg0 { arg0 x } *)
type rcd_tkn =
  | Rcd of rcd_tkn list
  | Atm of tkn
type st = (reg , tkn) Hashtbl.t

type gst = st * (cs Stack.t)
and cs =
| CS of plc * reg * st (* return-plc * return-reg *)
| CS_A of plc * reg
| CS_L of plc * reg * st * (tkn option S_Ref.t)
| CS_R of plc * reg * st * (tkn option S_Ref.t)
type op =
| Id of reg * reg
| Rm of reg
| Clj of reg * reg * reg * plc (* f * (src0 * src1 * f-ptr) *)
| Prd of reg * reg * reg * (plc array)
| Agl of reg * reg * (plc array)
| Spt of (reg * reg) * reg
| Rpc of (reg * reg) * reg
| Cns of reg * (reg * reg)
| Call of reg * (reg * reg) (* y <- f ◂ x *)
| HCall of reg * (src * reg) * (src * reg) (* y <- (0f◂x0) (f1◂x1) *)
| Ini_Tkn of reg * tkn
| Ini_Sgn of reg
| Axm of (reg list) * (reg list)
and src =
| Reg of reg
| Im of tkn
type asm = (plc, pt) Hashtbl.t
and pt =
| Ret of reg
| Op of op * plc

let rec print_asm a =
  Hashtbl.fold
    (fun p o s ->
       ( match o with
         | Ret r ->
           s^"p"^(Sgn.print p)^" @ ret : r"^(Sgn.print r)^"\n"
         | Op (o,np) ->
           let s0 = print_op a o in
           s^"p"^(Sgn.print p)^" ⊢ p"^(Sgn.print np)^" @ "^s0
       ))
    a "" (*
let rec print_asm a =
let a0 = Hashtbl.copy a in
let rec print_asm_i p =
  ( try
      let o = asm_get a0 p in
      ( match o with
        | Ret r ->
          Hashtbl.remove a0 p;
          "p"^(Sgn.print p)^" @ ret : r"^(Sgn.print r)^"\n"
        | Op (o,np) ->
          Hashtbl.remove a0 p;
          let s0 = print_op a0 o in
          let s1 = print_asm_i np in
          "p"^(Sgn.print p)^" ⊢ p"^(Sgn.print np)^" @ "^s0^s1
      )
    with _ -> "" ) in
Hashtbl.fold
  (fun k _ s ->
     let s0 = print_asm_i k in
     s^s0)
  a0 ""
*)
and pnt_reg r = "r"^(Sgn.print r)
and pnt_plc p = "p"^(Sgn.print p)
and pnt_arr rs rd =
  " : "^(Util.string_of_list " " pnt_reg rs)^" ⊢ "^(Util.string_of_list " " pnt_reg rd)^"\n"
and print_op _ o =
  ( match o with
    | Id (r0,r1) -> "id"^(pnt_arr [r0] [r1])
    | Rm r0 -> "rm"^(pnt_arr [r0] [])
    | Clj (r0,r1,r2,p1) -> "clj "^(pnt_reg r2)^" "^(pnt_plc p1)^(pnt_arr [r1] [r0])
    | Prd (r0,r1,r2,ps) ->
      "prd "^(pnt_reg r2)^" ["^
      (Util.string_of_list " " pnt_plc (Array.to_list ps))^"]"^
      (pnt_arr [r1] [r0])
    | Agl (rs,r1,ps) ->
      let s0 = List.map pnt_plc (Array.to_list ps) in
      let s1 = List.fold_left
          (fun s1 sa ->
             s1^" "^sa)
          "" s0 in
      "∠ "^(pnt_reg r1)^" ["^s1^"]"^(pnt_arr [] [rs])
    | Spt ((r0,r1),r2) ->
      "spt"^(pnt_arr [r2] [r0;r1])
    | Rpc ((r0,r1),r2) ->
      "rpc"^(pnt_arr [r2] [r0;r1])
    | Cns (r0,(r1,r2)) ->
      "cns"^(pnt_arr [r1;r2] [r0])
    | Call (r0,(r1,r2)) ->
      "call"^(pnt_arr [r1;r2] [r0])
    | HCall (r0,(_,r1),(_,r2)) ->
      "hcall"^(pnt_arr [r1;r2] [r0])
    | Ini_Tkn (r0,k0) ->
      "ini_tkn "^(print_k k0)^(pnt_arr [] [r0])
    | Ini_Sgn r0 ->
      "ini_sgn"^(pnt_arr [] [r0])
    | Axm (rs0,rs1) ->
      "axm"^(pnt_arr rs0 rs1)
  )
and print_k k =
  ( match k with
    | Tkn_Unt -> "{}"
    | Tkn_Stg s -> "\""^s^"\""
    | Tkn_Z z -> string_of_int z
    | Tkn_Bol b -> if b then "t" else "f"
    | Tkn_Sgn p -> "&"^(Sgn.print p)
    | Tkn_Ln p -> "l"^(Sgn.print p)
    | Tkn_Tns (r1,r2) -> "<"^(pnt_reg r1)^"¦"^(pnt_reg r2)^">"
    | Tkn_CoP (i,r0) -> "∠["^(string_of_int i)^","^(pnt_reg r0)^"]"
    | Tkn_P (_,r0,r1) -> "\\["^(pnt_reg r0)^","^(pnt_reg r1)^"]"
    | Tkn_Pls -> "+"
    | Tkn_Mlt  -> "*"
    | Tkn_Mns -> "-"
    | Tkn_Cmp -> "<="
    | Tkn_Eq -> "="
    | Tkn_Inj i -> "∠["^(string_of_int i)^"]"
    | Tkn_Cho i -> "\\["^(string_of_int i)^"]"
    | Tkn_Fix -> "@"
    | Tkn_Exn -> "?"
    | Tkn_Fnc (p1,r1) -> "→["^(pnt_plc p1)^","^(pnt_reg r1)^"]"
    | Tkn_Clj (_,_,_) -> "tkn-clj"
  )
let st_ini () : st = Hashtbl.create 10
let get_k v p =
  ( try
      let k = Hashtbl.find v p in
      Hashtbl.remove v p;
      k
    with _ -> raise (Failure ("vm0.get_k:"^(pnt_reg p))))
let get_k_list v r =
  let rec f_i r0 =
    let k0 = get_k v r0 in
    ( match k0 with
      | Tkn_Unt -> []
      | Tkn_Tns(r1,r2) ->
        let k1 = get_k v r1 in
        k1::(f_i r2)
      | _ -> raise (Failure "vm1.get_k_list:0")
    ) in
  f_i r
let rec get_k_rcd v r =
  let k0 = get_k v r in
  ( match k0 with
    | Tkn_Unt -> Rcd []
    | Tkn_Tns(r1,r2) ->
      let k1 = get_k_rcd v r1 in
      let k2 = get_k_rcd v r2 in
      ( match k2 with
        | Rcd l -> Rcd (k1::l)
        | _ -> raise (Failure "get_k_rcd"))
    | a -> Atm a )
let set_k v p k =
  Hashtbl.remove v p;
  Hashtbl.add v p k
let rec set_k_rcd v p r =
  ( match r with
    | Atm a ->
      set_k v p a
    | Rcd l ->
      let r0 = sgn () in
      set_k v r0 Tkn_Unt;
      let rs =
        List.fold_right
          (fun k r0 ->
             let r1 = sgn () in
             set_k_rcd v r1 k;
             let r2 = sgn () in
             set_k v r2 (Tkn_Tns(r1,r0));
             r2 )
          l r0 in
      let k = get_k v rs in
      set_k v p k
  )
let fresh v r0 =
  let r1 = sgn () in
  let k0 = get_k_rcd v r0 in
  set_k_rcd v r1 k0;
  r1
let src a s =
  ( match s with
    | Reg r -> get_k a r
    | Im k -> k )
let asm_ini () = Hashtbl.create 10
let asm_add a p o = Hashtbl.add a p o
let asm_get a p =
  ( try
      Hashtbl.find a p
    with _ -> raise (Failure "vm2.asm_get:0"))
let rec run a p v cs =
  Util.pnt true ("enter vm2.run:\n");
  let ox = asm_get a p in
  ( match ox with
    | Ret r0 ->
      Util.pnt true ("ret "^(pnt_reg r0)^"\n");
      let k0 = get_k_rcd v r0 in
      if (Stack.is_empty cs) then k0
      else
        let hd = Stack.pop cs in
        ( match hd with
          | CS (p0,r1,v0) ->
            set_k_rcd v0 r1 k0;
            Hashtbl.clear v;
            run a p0 v0 cs
          | CS_A (p0,r1) ->
            set_k_rcd v r1 k0;
            run a p0 v cs
          | _ -> raise (Failure "vm1.run:0") )
    | Op (o0,np) ->
      Util.pnt true ((print_op a o0)^"\n");
      ( match o0 with
        | Id (p1,p2) ->
          let k2 = get_k v p2 in
          set_k v p1 k2;
          run a np v cs
        | Rm r0 ->
          let _ = get_k_rcd v r0 in
          run a np v cs
        | Agl (r0,r1,ps) ->
          let k1 = get_k v r1 in
          ( match k1 with
            | Tkn_CoP (i,r3) ->
              let k2 = get_k v r3 in
              set_k v r1 k2;
              Stack.push (CS_A (np,r0)) cs;
              run a ps.(i) v cs
            | Tkn_Z z ->
              if z=0 then
                ( set_k v r1 Tkn_Unt;
                  Stack.push (CS_A (np,r0)) cs;
                  run a ps.(0) v cs )
              else
                ( set_k v r1 Tkn_Unt;
                  Stack.push (CS_A (np,r0)) cs;
                  run a ps.(1) v cs )
            | _ -> raise (Failure "vm2:x0")
          )
        | Call (y,(f,x)) ->
          let k_f = get_k v f in
          ( match k_f with
            | Tkn_Pls ->
              let k_xl = get_k_list v x in
              ( match k_xl with
                | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                  set_k v y (Tkn_Z (z1+z2));
                  run a np v cs
                | _ -> raise (Failure "vm1.run:2") )
            | Tkn_Mlt ->
              let k_xl = get_k_list v x in
              ( match k_xl with
                | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                  set_k v y (Tkn_Z (z1*z2));
                  run a np v cs
                | _ -> raise (Failure "vm1.run:3") )
            | Tkn_Mns ->
              let k = get_k v x in
              ( match k with
                | (Tkn_Z z1) ->
                  set_k v y (Tkn_Z (-z1));
                  run a np v cs
                | _ -> raise (Failure "vm1.run:2") )
            | Tkn_Cmp ->
              let k_xl = get_k_list v x in
              ( match k_xl with
                | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                  let b = if z1<=z2 then 1 else 0 in
                  set_k v y (Tkn_Z b);
                  run a np v cs
                | _ -> raise (Failure "vm1.run:2") )
            | Tkn_Eq ->
              let k_r = get_k_rcd v x in
              ( match k_r with
                | Rcd (x1::x2::[]) ->
                  if x1=x2 then
                    ( set_k v y (Tkn_Bol true);
                      run a np v cs)
                  else
                    ( set_k v y (Tkn_Bol false);
                      run a np v cs)
                | _ -> raise (Failure "vm1.run:3"))
            | Tkn_Inj b ->
              let k0 = get_k v x in
              let r0 = sgn () in
              set_k v r0 k0;
              set_k v y (Tkn_CoP (b,r0));
              run a np v cs
            | Tkn_Cho _ -> raise (Failure "vm1.run:4")
            | Tkn_Fix -> raise (Failure "vm1.run:5")
            | Tkn_Exn -> raise (Failure "vm1.run:6")
            | Tkn_Fnc (p0,r0)->
              let k0 = get_k_rcd v x in
              let v1 = st_ini () in
              set_k_rcd v1 r0 k0;
              Stack.push (CS(np,y,v)) cs;
              run a p0 v1 cs
            | Tkn_Clj (p0,r0,r1) ->
              let k0 = get_k_rcd v x in
              let k1 = get_k_rcd v r0 in
              let v1 = st_ini () in
              set_k_rcd v1 r1 (Rcd [k0;k1]);
              Stack.push (CS(np,y,v)) cs;
              run a p0 v1 cs
            | _ -> raise (Failure "vm2:run9")
          )
        | HCall (_,(_,_),(_,_)) ->
          (* let (y1,y2) = (sgn(),sgn()) in
             let (kf1,kx1,kf2,kx2) = (get_k v f1,get_k *) raise (Failure "vm1.run:7")
        | Prd (r0,r1,r2,ps) ->
          let k0 = get_k_rcd v r1 in
          let r3 = sgn () in
          set_k_rcd v r3 k0;
          set_k v r0 (Tkn_P(ps,r3,r2));
          run a np v cs
        | Clj (r0,r1,r2,p0) ->
          let k0 = get_k_rcd v r1 in
          let r3 = sgn () in
          set_k_rcd v r3 k0;
          set_k v r0 (Tkn_Clj(p0,r3,r2));
          run a np v cs
        | Cns (r0,(r1,r2)) ->
          (* let (r3,r4) = (fresh v r1,fresh v r2) in *)
          let (r3,r4) = (r1,r2) in
          set_k v r0 (Tkn_Tns(r3,r4));
          run a np v cs
        | Ini_Sgn r0 ->
          set_k v r0 (Tkn_Sgn(sgn()));
          run a np v cs
        | Ini_Tkn (r0,k) ->
          set_k v r0 k;
          run a np v cs
        | Rpc ((r0,r1),r2) ->
          let k0 = get_k_rcd v r2 in
          set_k_rcd v r0 k0;
          set_k_rcd v r1 k0;
          run a np v cs
        | Spt((r1,r2),r3) ->
          let k0 = get_k v r3 in
          ( match k0 with
            | Tkn_Tns(r4,r5) ->
              let (k1,k2) = (get_k v r4,get_k v r5) in
              set_k v r1 k1; set_k v r2 k2;
              run a np v cs
            | _ -> raise (Failure "vm2.run:00")
          )
        | Axm(_,_) -> raise (Failure "vm2.run:01")
      )
  )
type asm_of_code = asm * plc * reg * code_s * Sgn.t
(* asm * src-plc * root-reg * src-code * src-start-ptr *)
let rec asm_of_code tb a p0 r0 c v0 =
  Util.pnt true "enter asm_of_code\n";
  Hashtbl.add tb v0 (p0,r0);
  let f0 = get_code c v0 in
  ( match f0 with
    | V_S (v1,v2) ->
      let pm0 = asm_of_code tb a p0 r0 c v1 in
      let o1 =
        ( try Hashtbl.find a pm0
          with _ -> raise (Failure "vm2.asm_of_code:0")) in
      ( match o1 with
        | Ret r1 ->
          Hashtbl.remove a pm0;
          let pm1 = asm_of_code tb a pm0 r1 c v2 in
          pm1
        | _ -> raise (Failure "vm2:a0")
      )
    | H_S (_,_) -> raise (Failure "vm2:a1")
    | E_S n1 ->
      let (p1,r2,_) = asm_of_tns_tl tb a p0 r0 c n1 in
      asm_add a p1 (Ret r2);
      p1
    | P_S (_,_) -> raise (Failure "vm2:a2")
    | A_S (n1,l) ->
      Util.pnt true "vm2:d1\n";
      let (p1,r1,ra) = asm_of_tns_tl tb a p0 r0 c n1 in
      ( match ra with
        | Some ra ->
          Util.pnt true "vm2:d0\n";
          let ps = List.map (fun _ -> sgn ()) l in
          let pa = Array.of_list ps in
          let r2 = sgn () in
          let np = sgn () in
          asm_add a p1 (Op(Agl(r2,ra,pa),np));
          let lp = List.combine ps l in
          let _ = List.map (fun (pf,f) -> asm_of_code tb a pf r1 c f) lp in
          asm_add a np (Ret r2);
          np
        | _ -> raise (Failure "vm2:a3")
      )
    | F_S (_,_,_) -> raise (Failure "vm2:a4")
  )
and asm_of_tns_tl tb a p0 r0 c n0 : (plc * reg * (reg option))=
  Util.pnt true ("enter asm_of_tns_tl:"^(Print.print_tns_s n0)^"\n");
  ( match !n0 with
    | PL_x n1 ->
      let (np0,rr,_) = asm_of_tns_tl tb a p0 r0 c n1 in
      let (r1,r2) = (sgn (),sgn ()) in
      let (np1,np2) = (sgn (),sgn ()) in
      asm_add a np0 (Op(Spt((r1,r2),rr),np1));
      asm_add a np1 (Op(Rm r2,np2));
      (np1,r1,None)
    | PR_x n1 ->
      let (np0,rr,_) = asm_of_tns_tl tb a p0 r0 c n1 in
      let (r1,r2) = (sgn (),sgn ()) in
      let (np1,np2) = (sgn (),sgn ()) in
      asm_add a np0 (Op(Spt((r1,r2),rr),np1));
      asm_add a np1 (Op(Rm r1,np2));
      (np1,r2,None)
    | Inj_x i ->
      let r1 = sgn () in
      let np0 = sgn () in
      asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Inj i),np0));
      (np0,r1,None)
    | Cho_x i ->
      let r1 = sgn () in
      let np0 = sgn () in
      asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Cho i),np0));
      (np0,r1,None)
    | Agl_x n1 ->
      let (p1,r2,_) = asm_of_tns_tl tb a p0 r0 c n1 in
      (p1,r2,Some r2)
    | Rot_x ->
      let r1 = sgn () in
      let np = sgn () in
      asm_add a p0 (Op(Id(r1,r0),np));
      Util.pnt true "test0\n";
      (np,r1,None)
    | Unt_x ->
      let r1 = sgn () in
      let np = sgn () in
      asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Unt),np));
      (np,r1,None)
    | Plg_x q1 when q1=nd_pls ->
      let r1 = sgn () in
      let np = sgn () in
      asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Pls),np));
      (np,r1,None)
    | Plg_x q1 when q1=nd_mlt ->
      let r1 = sgn () in
      let np = sgn () in
      asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Mlt),np));
      (np,r1,None)
    | Plg_x q1 when q1=nd_mns ->
      let r1 = sgn () in
      let np = sgn () in
      asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Mns),np));
      (np,r1,None)
    | Plg_x q1 when q1=nd_std_le ->
      let r1 = sgn () in
      let np = sgn () in
      asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Cmp),np));
      (np,r1,None)
    | Plg_x q1 when q1=nd_eq ->
      let r1 = sgn () in
      let np = sgn () in
      asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Eq),np));
      (np,r1,None)
    | Plg_x q1 ->
      let r1 = sgn () in
      let np = sgn () in
      ( try
          let (p2,r2) =
            ( try Hashtbl.find tb q1
              with _ -> raise (Failure "vm2.asm_of_tns_tl:0")) in
          asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Fnc(p2,r2)),np));
          (np,r1,None)
        with _ ->
          let p2 = sgn () in
          let r2 = sgn () in
          let _ = asm_of_code tb a p2 r2 c q1 in
          asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Fnc(p2,r2)),np));
          (np,r1,None))
    | Z_x z ->
      let r1 = sgn () in
      let np = sgn () in
      asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Z z),np));
      (np,r1,None)
    | Stg_x s ->
      let r1 = sgn () in
      let np = sgn () in
      asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Stg s),np));
      (np,r1,None)
    | TnsT (n1,n2) ->
      let (r0_0,r0_1,p0x) = (sgn (),sgn (),sgn ()) in
      asm_add a p0 (Op(Rpc((r0_0,r0_1),r0),p0x));
      let (np1,nr1,o1) = asm_of_tns_tl tb a p0x r0_0 c n1 in
      let (np2,nr2,o2) = asm_of_tns_tl tb a np1 r0_1 c n2 in
      let o3 =
        ( match o1,o2 with
          | Some ro ,_ -> Some ro
          | _, Some ro -> Some ro
          | _,_ -> None ) in
      let p3 = sgn () in
      let r4 = sgn () in
      asm_add a np2 (Op(Cns(r4,(nr1,nr2)),p3));
      (p3,r4,o3)
    (*
      let (p1,r1) = (sgn (),sgn ()) in
      let (np1,nr1,o1) = asm_of_tns_tl tb a p1 r1 c n1 in
      let (p2,r2) = (sgn (),sgn ()) in
      let (np2,nr2,o2) = asm_of_tns_tl tb a p2 r2 c n2 in
      let o3 =
        ( match o1,o2 with
          | Some ro ,_ -> Some ro
          | _, Some ro -> Some ro
          | _,_ -> None ) in
      let p3 = sgn () in
      let p4 = sgn () in
      let (r3,r4,r5) = (sgn (),sgn (),sgn ()) in
      asm_add a p0 (Op(Rpc((r3,r4),r0),p3));
      asm_add a p3
        (Op(
            HCall(r5,(Im(Tkn_Fnc(np1,nr1)),r3),(Im(Tkn_Fnc(np2,nr2)),r4)),
            p4));
      (p4,r5,o3) *)
    | AppT (n1,n2) ->
      let (r0_0,r0_1,p0x) = (sgn (),sgn (),sgn ()) in
      asm_add a p0 (Op(Rpc((r0_0,r0_1),r0),p0x));
      let (np1,nr1,_) = asm_of_tns_tl tb a p0x r0_0 c n1 in
      let (np2,nr2,_) = asm_of_tns_tl tb a np1 r0_1 c n2 in
      let p3 = sgn () in
      let r4 = sgn () in
      asm_add a np2 (Op(Call(r4,(nr1,nr2)),p3));
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
        ( try Hashtbl.find tb q1
          with _ -> raise (Failure "vm2.k_rcd_of_tkn_s")) in
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
let rec tkn_s_of_k tb v r =
  ( match get_k v r with
    | Tkn_Unt -> TknS_Unt
    | Tkn_Stg s -> TknS_Stg s
    | Tkn_Z z -> TknS_Z z
    | Tkn_Bol b -> TknS_Z (if b then 1 else 0)
    | Tkn_Sgn p -> TknS_Plg p
    | Tkn_Ln r1 -> tkn_s_of_k tb v r1
    | Tkn_Tns (r1,r2) -> TknS_Tns(tkn_s_of_k tb v r1,tkn_s_of_k tb v r2)
    | Tkn_CoP (i,r1) -> TknS_Tns(TknS_Inj i,tkn_s_of_k tb v r1)
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
