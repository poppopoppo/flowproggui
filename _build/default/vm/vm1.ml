(*)
type reg = Sgn.t
type plc = Sgn.t
type tkn =
  | Tkn_Unt
  | Tkn_Stg of string
  | Tkn_Z of int
  | Tkn_Bol of bool
  | Tkn_Sgn of Sgn.t
  | Tkn_Tns of reg * reg
  | Tkn_CoP of bool * reg
  | Tkn_P of plc * plc
  | Tkn_Pls
  | Tkn_Mlt
  | Tkn_Mns
  | Tkn_Cmp
  | Tkn_Eq
  | Tkn_Inj of bool
  | Tkn_Cho of bool
  | Tkn_Fix
  | Tkn_Exn
  | Tkn_Fnc of plc * reg (* jmp_ptr arg_ptr *)
  | Tkn_Clj of plc * reg * reg (* jmp_ptr arg0 { arg0 x } *)
type rcd_tkn =
  | Rcd of rcd_tkn list
  | Atm of tkn
type st = (reg , tkn) Hashtbl.t
type st_y =
  (Sgn.t ,int) Hashtbl.t
  * ((Sgn.t,string) Hashtbl.t)
  * ((Sgn.t,Sgn.t) Hashtbl.t)
let st_ini () : st = Hashtbl.create 10
let get_k v p =
  ( try
      let k = Hashtbl.find v p in
      Hashtbl.remove v p;
      k
    with _ -> raise (Failure "vm0.get:0"))
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
let set_k_rcd v p r =
  ( match r with
    | Atm a ->
      set_k v p a
    | Rcd l ->
      let r0 = sgn () in
      set_k v r0 Tkn_Unt;
      let rs =
        List.fold_right
          (fun v r0 ->
             let r1 = sgn () in
             set_k_rcd v r1 v;
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
type gst = st * ((cs * st) Stack.t)
and cs =
  | CS of plc * reg (* return-plc * return-reg *)
  | CS_L of plc * reg * (tkn option S_Ref.t)
  | CS_R of plc * reg * (tkn option S_Ref.t)
type op =
  | Id of reg * reg
  | Rm of reg
  | Agl of reg * plc
  | Prd of reg * reg * (plc * plc)
  | Fnc of reg * (reg * reg * plc) (* f * (src0 * src1 * f-ptr) *)
  | Spt of (reg * reg) * reg
  | Rpc of (reg * reg) * reg
  | Cns of reg * (reg * reg)
  | Call of reg * (reg * reg) (* y <- f ◂ x *)
  | HCall of reg * (reg * reg) * (reg * reg) (* y <- (0f◂x0) (f1◂x1) *)
  | Ini_Tkn of reg * tkn
  | Ini_Sgn of reg
  | Axm of (reg list) * (reg list)
type reg_tx = string
type plc_tx = string
type asm = (plc, pt) Hashtbl.t
and pt =
  | Ret of reg
  | Op of op * plc
type op_tx =
  | Id_Tx of reg_tx * reg_tx
  | Rm_Tx of reg_tx
  | Agl_Tx of reg_tx * plc_tx
  | Prd_Tx of reg_tx * (reg_tx * (plc_tx * plc_tx))
  | Fnc_Tx of reg_tx * (reg_tx * plc_tx) (* f * (src0 * src1 * f-ptr) *)
  | Spt_Tx of (reg_tx * reg_tx) * reg_tx
  | Rpc_Tx of (reg_tx * reg_tx) * reg_tx
  | Cns_Tx of reg_tx * (reg_tx * reg_tx)
  | Call_Tx of reg_tx * (reg_tx * reg_tx) (* y <- f ◂ x *)
  | HCall_Tx of reg_tx * (reg_tx * reg_tx) * (reg_tx * reg_tx)
  | Ini_Tkn_Tx of reg_tx * tkn
  | Ini_Sgn_Tx of reg_tx
  | Axm_Tx of (reg_tx list) * (reg_tx list)
type asm_tx =
  (plc_tx , (reg_tx * op_tx list * reg_tx)) Hashtbl.t
type cxt = (string,reg) Hashtbl.t
let asm_get a p =
  Hashtbl.find a p
let asm_set a p o =
  Hashtbl.replace a p o
let cxt_get c s =
  Hashtbl.find c s
let cxt_set c s =
  if Hashtbl.mem c s then (raise (Failure "vm1.cxt_set:0"))
  else
    let r = sgn () in
    Hashtbl.add c s r;
    r
let rec asm_of_tx tx p0 =
  let tt = Hashtbl.fold
    (fun px (sx,l,dx) r ->
       let p = sgn () in
       let s = sgn () in
       Hashtbl.add r px (p,s);
       r )
    tx (Hashtbl.create 10) in
and asm_of_list tt a p0 c d l =
  ( match l with
    | [] ->
      let r0 = cxt_get c d in
      asm_set a p0 (Ret r0);
      p0
    | hd::tl ->
      let p1 = sgn () in
      ( match hd with
        | Id_Tx (x1,x2) ->
          let r2 = cxt_get c x2 in
          let r1 = cxt_set c x1 in
          asm_set a p0 (Op(Id(r1,r2),p1))
        | Rm_Tx x1 ->
          let r1 = cxt_get c x1 in
          asm_set a p0 (Op(Rm r1,p1))
        | Agl_Tx (x,p) ->
          let r1 = cxt_get c x in
          let px = asm_get a p in
          asm_set a p0 (Op(Agl(r1,px),p1))
        | Prd_Tx _ -> raise (Failure "vm1.x1")
        | Fnc_Tx (x1,(x2,x3,xp0)) ->
          let (r2,r3) = (cxt_get c x2,cxt_get c x3) in
          let r1 = cxt_set c x1 in
          let p0 = asm_get a xp0 in
          asm_set a p0 (Op(Fnc(r1,(r2,r3,p0)),p1))
        | Spt_Tx ((x1,x2),x3) ->
          let r3 = cxt_get c x3 in
          let (r1,r2) = (cxt_set c x1,cxt_set c x2) in
          asm_set a p0 (Op(Spt((r1,r2),r3),p1))
        | Rpc_Tx ((x1,x2),x3) ->
          let r3 = cxt_get c x3 in
          let (r1,r2) = (cxt_set c x1,cxt_set c x2) in
          asm_set a p0 (Op(Rpc((r1,r2),r3),p1))
        | Cns_Tx (x1,(x2,x3)) ->
          let (r2,r3) = (cxt_get c x2,cxt_get c x3) in
          let r1 = cxt_set c x1 in
          asm_set a p0 (Op(Cns(r1,(r2,r3)),p1))
        | Call_Tx (x1,(x2,x3)) ->
          let (r2,r3) = (cxt_get c x2,cxt_get c x3) in
          let r1 = cxt_set c x1 in
          asm_set a p0 (Op(Call(r1,(r2,r3)),p1))
        | HCall_Tx (x1,(x2,x3),(x4,x5)) -> raise (Failure "err:x1")
        | While_Tx (x1,(x2,px1)) -> raise (Failure "err:x2")
        | Ini_Tkn_Tx (x1,k1) ->
          let r1 = cxt_set c x1 in
          asm_set a p0 (Op(Ini_Tkn(r1,k1),p1))
        | Ini_Sgn_Tx x1 ->
          let r1 = cxt_set c x1 in
          asm_set a p0 (Op(Ini_Sgn r1,p1))
      )
  )
let asm_of_tx a ax =
  Hashtbl.iter
    (fun x r -> )
let get_pt a p =
    Hashtbl.find a p
let rec run a p v cs =
  let ox = get_pt a p in
  ( match ox with
    | Ret r0 ->
      let k0 = get_k_rcd v r0 in
      if (Stack.is_empty cs) then k0
      else
        let (hd,v0) = Stack.pop cs in
        ( match hd with
          | CS (p0,r1) ->
            set_k_rcd v0 r1 k0;
            Hashtbl.clear v;
            run a p0 v0 cs
          | _ -> raise (Failure "vm1.run:0") )
    | Op (o0,np) ->
      ( match o0 with
        | Id (p1,p2) ->
          let k2 = get_k v p2 in
          set_k v p1 k2;
          run a np v cs
        | Agl (r0,p0) ->
          let k1 = get_k v r0 in
          ( match k1 with
            | Tkn_CoP (true,r3) ->
              let k2 = get_k v r3 in
              set_k v r0 k2;
              run a p0 v cs
            | Tkn_CoP(false,r3) ->
              let k2 = get_k v r3 in
              set_k v r0 k2;
              run a np v cs)
        | Rm r0 ->
          let _ = get_k_rcd v r0 in
          run a np v cs
        | Call (y,f,x) ->
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
              let k_xl = get_k_list v x in
              ( match k_xl with
                | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                  set_k v y (Tkn_Z (z1-z2));
                  run a np v cs
                | _ -> raise (Failure "vm1.run:2") )
            | Tkn_Cmp ->
              let k_xl = get_k_list v x in
              ( match k_xl with
                | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                  set_k v y (Tkn_Bol (z1<=z2));
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
              Stack.push cs (CS(np,y),v);
              run a p0 v1 cs
            | Tkn_Clj (p0,r0,r1) ->
              let k0 = get_k_rcd v x in
              let k1 = get_k_rcd v r0 in
              let v1 = st_ini () in
              set_k_rcd v1 r1 (Rcd [k0;k1]);
              Stack.push cs (CS(np,y),v);
              run a p0 v1 cs
          )
        | HCall (_,(_,_),(_,_)) -> raise (Failure "vm1.run:7")
        | Prd (r0,(r1,(p0,p1))) -> raise (Failure "vm1.run:8")
        | Fnc (r0,(r1,r2,p0)) ->
          let k0 = get_k_rcd v r1 in
          let r3 = sgn () in
          set_k_rcd v r3 k0;
          set_k v r0 (Tkn_Clj(p0,r3,r2));
          run a np v cs
        | Cns (r0,(r1,r2)) ->
          let (r3,r4) = (fresh r1,fresh r2) in
          set_k v r0 (Tkn_Cns(r3,r4));
          run a np v cs
        | Ini_Sgn r0 ->
          set_k v r0 (Tkn_Sgn(sgn()));
          run a np v cs
        | Ini_Tkn (r0,v) ->
          set_k v r0 v;
          run a np v cs
        | Rpc ((r0,r1),r2) ->
          let k0 = get_k_rcd v r2 in
          set_k_rcd v r0 k0;
          set_k_rcd v r1 k0;
          run a np v cs
      )
  )
let rec asm_of_tkn_s a0 p0 r0 x0 =
  ( match x0 with
    | TknS_Stg s ->
  )
*)
