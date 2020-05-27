open Types
let err s = raise (Failure s)
let opn_err e o =
  ( match o with
    | Some x -> x
    | None -> err e )
let ( *| ) o e = opn_err e o
let ( |+| ) a b = Array.append a b
(* type plc = Plc of Sgn.t *)
let unt () = [| |]
type 'a rcd_ptn =
  | P_Rc of ('a rcd_ptn) array
  | P_Ro of ('a rcd_ptn ) array * 'a
  | P_A of 'a
type plc = int * int
type reg = int
type reg_ptn = reg rcd_ptn
type nd =
  | Id of reg_ptn * reg_ptn
  | Rpc of regs * reg
  | Prj of (int list) * reg_ptn * reg_ptn
  | Rm of reg
  | Agl of reg_ptn * reg_ptn * (int list) * (int array)
  | Call of reg_ptn * reg * reg_ptn
  | HCall of (src array) * ((reg * src) array)
  | Prd of reg * src * src * (plc array)
  | Nd_Clj of reg * src * src * plc
  | Ini of reg * tkn
and src =
  | Src_Rcd of reg array
  | Src_Mno of reg
and regs = reg array
and asm = (reg_ptn * reg_ptn * (nd array)) array
and rcd_tkn =
  | Rcd_Rcd of rcd_tkn array
  | Rcd_Tkn of tkn
and tkn =
  | Tkn_Stg of string
  | Tkn_Z of int
  | Tkn_Bol of bool
  | Tkn_Sgn of Sgn.t
  | Tkn_CoP of int * (rcd_tkn)
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
  | Fnc of int (* jmp_ptr arg_ptr *)
  | Clj of int * (rcd_tkn) (* jmp_ptr arg0 { arg0 x } *)
and ptr = tkn ref
type tkn_ptn = tkn rcd_ptn
type st = (rcd_tkn option array) * (cs Stack.t)
and reg_ptr =
  | Rp_A of int
  | Rp_R of int
and cs =
  | CS of plc * reg_ptn * st_h (* return-plc * return-reg *)
  | CS_L of plc * reg_ptn * st_h * (tkn option S_Ref.t)
  | CS_R of plc * reg_ptn * st_h * (tkn option S_Ref.t)
and st_h = ((reg * (rcd_tkn)) list)
let get_r rv r =
  let k = (!rv).(r) in
  (!rv).(r)<-None;
  k
let get_rs rv rs =
  Array.map (fun r -> get_r rv r) rs
let set_r rv r k0 =
  let k1 = (!rv).(r) in
  ( match k1 with
    | None -> (!rv).(r)<-k1
    | Some _ -> err "set_r 0" )
let set_rs rv rs ks =
  Array.mapi
    (fun i k ->
       ( match k with
         | None -> ()
         | Some k -> set_r rv rs.(i) k))
    ks
let free_r rv r = (get_r rv r) *| "free_r 0"
let free_rs rv rs =
  let rl = Array.map (fun x -> free_r rv x) rs in
  rl (*
let free_src rv s =
  ( match s with
    | Src_Mno r -> free_r rv r
    | Src_Rcd rs -> free_rs rv rs ) *)
let free_v rv =
  Array.mapi
    (fun i _ -> free_r rv i)
    !rv
let alc_r rv =
  let r =
    Array.fold_left
      (fun i k ->
         ( match i,k with
           | `Idx i,None -> `Alc i
           | `Idx i,Some _ -> `Idx (i+1)
           | `Alc i,_ -> `Alc i ))
      (`Idx 0) !rv in
  ( match r with
    | `Idx i -> rv := (Array.append !rv [|None|]); i
    | `Alc i -> i )
let add_r rv k =
  let r = alc_r rv in
  let _ = set_r rv r k in
  r
let rec get_ptn rv rp ap ai =
  ( match ai with
    | `None ->
      ( match rp with
        | P_Rc as0 ->
          Rcd_Rcd (Array.map (fun r -> get_ptn rv r ap `None) as0)
        | P_Ro (as0,a1) ->
          let (xs0,x1) = (
            Array.map (fun r -> get_ptn rv r ap `None) as0,
            get_r rv a1 *| "get_ptn 2") in
          ( match x1 with
            | Rcd_Rcd xt -> Rcd_Rcd (xs0 |+| xt)
            | _ -> err "get_ptn 4" )
        | P_A a0 -> (get_r rv a0 *| "get_ptn 3"))
    | `Some [] ->
      ( match rp with
        | P_Rc _ -> err "get ptn 5"
        | P_Ro _ -> err "get_ptn 6"
        | P_A a0 ->
          ( match get_r rv a0 *| "err 28" with
            | Rcd_Tkn Tkn_CoP(m1,p3) ->
              let kx = p3 in
              ap := m1; kx
            | Rcd_Tkn Tkn_Z z ->
              if z=0 then ( ap := 0; Rcd_Rcd [| |] )
              else ( ap:= 1; Rcd_Rcd [| |])
            | _ -> err "err 19" )
      )
    | `Some (hd::tl) ->
      ( match rp with
        | P_Rc as0 ->
          Rcd_Rcd ( Array.mapi
                      (fun i r ->
                         if i=hd then
                           get_ptn rv r ap (`Some tl)
                         else
                           get_ptn rv r ap `None )
                      as0 )
        | P_Ro (as0,a1)->
          let (xs0,x1) = (
            ( Array.mapi
                (fun i r ->
                   if i=hd then
                     get_ptn rv r ap (`Some tl)
                   else
                     get_ptn rv r ap `None )
                as0 ),
            get_r rv a1 *| "get_ptn 2") in
          ( match x1 with
            | Rcd_Rcd xt -> Rcd_Rcd (xs0 |+| xt)
            | _ -> err "get_ptn 4" )
        | _ -> err "get_ptn 6" )
  )
let rec alc_ptn rv rp =
  ( match rp with
    | P_A _ ->
      let r = alc_r rv in
      P_A r
    | P_Rc rs ->
      let rs1 = Array.map
          (fun ri ->
             let r = alc_ptn rv ri in
             r) rs in
      P_Rc rs1
    | P_Ro (rs,rt) ->
      let rs1 = Array.map
          (fun ri ->
             let r = alc_ptn rv ri in
             r) rs in
      let rt1 = alc_r rv in
      P_Ro(rs1,rt1) )
let rec set_ptn rv rp kp =
  ( match rp,kp with
    | P_A r,Rcd_Tkn k -> set_r rv r k
    | P_Rc rs,Rcd_Rcd ks ->
      let _ = Array.mapi (fun i r -> set_ptn rv r (ks.(i))) rs in
      ()
    | P_Ro (rs,r0),Rcd_Rcd ks ->
      let l = Array.length rs in
      let (ks0,ks1) = (BatArray.head ks l,BatArray.tail ks l) in
      let _ = Array.mapi (fun i r -> set_ptn rv r ks0.(i)) rs in
      set_r rv r0 (Rcd_Rcd ks1)
    | _ -> err "set_ptn 0" )
let rec add_ptn rv kp =
  ( match kp with
    | Rcd_Tkn k ->
      let r = (add_r rv k) in
      P_A r
    | Rcd_Rcd ks ->
      let rp =
        Array.fold_left
          (fun rp r ->
             let ri = add_ptn rv r in
             rp |+| [|ri|])
          [||] ks in
      P_Rc rp )
let rec rsv_ptn rv rp =
  let rp1 = alc_ptn rv rp in
  unt_ptn rv rp1
and unt_ptn rv rp =
  ( match rp with
    | P_A r -> set_r rv r (unt ())
    | P_Rc rs ->
      let _ = Array.map (fun x -> unt_ptn rv x) rs in
      ()
    | P_Ro (rs,rt) ->
      let _ = Array.map (fun x -> unt_ptn rv x) rs in
      set_r rv rt (unt ()) )
let rec get_idx is kp =
  ( match is,kp with
    | [],_ -> kp
    | hd::tl,Rcd_Rcd ps -> get_idx tl ps.(hd)
    | _ -> err "get_idx" )
let add_nd a n = Array.append a [|n|]
let clear_v v = Array.map (fun _ -> None) v
let to_list rv =
  let (_,l) =
    Array.fold_left
      (fun (i,l) k ->
         ( match k with
           | None -> (i+1,l)
           | Some k -> (i+1,(i,k)::l)))
      (0,[]) !rv in
  l
let set_list_r rv l =
  let _ = List.fold_left
      (fun _ (r,k) -> set_r rv r k)
      () l in
  ()
let rec run a p0 n0 rv cs =
  let (rs0,rd0,ap0) = a.(p0) in
  ( try
      let o0 = ap0.(n0) in
      ( match o0 with
        | Id (r1,r2) ->
          let k2 = (get_ptn rv r2 (ref 0) `None) in
          let _ = set_ptn rv r1 k2 in
          run a p0 (n0+1) rv cs
        | Rpc (rs,r1) ->
          let k1 = get_r rv r1 in
          let _ = set_rs rs k1 in
          run a p0 (n0+1) rv cs
        | Rm r0 ->
          let _ = free_r rv r0 in
          run a p0 (n0+1) rv cs
        | Agl (rp1,rp2,is,ps) ->
          let m0 = ref 0 in
          let kp = get_ptn rv rp2 m0 (`Some is) in
          let l = to_list rv in
          let (sp,dp,ax) = a.(ps.(!m0)) in
          let _ = set_ptn rv sp kp in
          Stack.push (CS((p0,n0+1),rp1,l)) cs;
          run a ps.(!m0) 0 rv cs
        | Call (rp0,r1,rp2) ->
          let k_f = get_r rv r1 *| "err 23" in
          let kx = (get_ptn rv rp2 (ref 0) `None) in
          ( match rp0,k_f,kx with
            | P_A r0,Rcd_Tkn Tkn_Fnc Mns,Rcd_Tkn Tkn_Z z ->
              let _ = set_r rv r0 (Tkn_Z (-z)) in
              run a p0 (n0+1) rv cs
            | P_A r0,Rcd_Tkn Tkn_Fnc Inj i,kx ->
              let _ = set_r rv r0 (Tkn_CoP (i,kx)) in
              run a p0 (n0+1) rv cs
            | _,Rcd_Tkn Tkn_Fnc Cho _,_ -> err "err 7"
            | _,Rcd_Tkn Tkn_Fnc Exn,_ -> err "err 8"
            | _,Rcd_Tkn Tkn_Fnc Fix,_ -> err "err 9"
            | _,Rcd_Tkn Tkn_Fnc Fnc pa,kx ->
              let l = to_list rv in
              let (sp,_,_) = a.(pa) in
              let _ = set_ptn rv sp kx in
              Stack.push (CS((p0,n0+1), rp0,l)) cs;
              run a pa 0 rv cs
            | _,Rcd_Tkn Tkn_Fnc Clj (pa,l0),kx -> err "run 3"
            | P_A r0,Rcd_Tkn Tkn_Fnc Pls,Rcd_Rcd [|(Rcd_Tkn Tkn_Z z1);(Rcd_Tkn Tkn_Z z2)|] ->
              let _ = set_r rv r0 (Tkn_Z (z1+z2)) in
              run a p0 (n0+1) rv cs
            | P_A r0,Rcd_Tkn Tkn_Fnc Mlt,Rcd_Rcd [|(Rcd_Tkn Tkn_Z z1);(Rcd_Tkn Tkn_Z z2)|] ->
              let _ = set_r rv r0 (Tkn_Z (z1*z2)) in
              run a p0 (n0+1) rv cs
            | P_A r0,Rcd_Tkn Tkn_Fnc Cmp,Rcd_Rcd [|(Rcd_Tkn Tkn_Z z1);(Rcd_Tkn Tkn_Z z2)|] ->
              let b = if z1<=z2 then 1 else 0 in
              let _ = set_r rv r0 (Tkn_Z b) in
              run a p0 (n0+1) rv cs
            | P_A r0,Rcd_Tkn Tkn_Fnc Eq,Rcd_Rcd [|x;y|] ->
              let b = if x=y then 1 else 0 in
              let _ = set_r rv r0 (Tkn_Z b) in
              run a p0 (n0+1) rv cs
            | _ -> err "err 38"
          )
        | HCall (_,_) ->
          (* let (y1,y2) = (sgn(),sgn()) in
             let (kf1,kx1,kf2,kx2) = (get_k v f1,get_k *) raise (Failure "vm1.run:7")
        | Prd (r0,rs1,rs2,ps) -> err "err 10"
        | Nd_Clj (r0,rs1,rs2,p0) -> err "err 11"
        | Ini (r0,k) ->
          let _ = set_r rv r0 k in
          run a p0 (n0+1) rv cs
        | Prj(i,r1,r2) ->
          let k0 = get_ptn rv r2 (ref 0) `None in
          let ki = get_idx i k0 in
          let _ = set_ptn rv r1 ki in
          run a p0 (n0+1) rv cs
      )
    with _ ->
      (
        let k0 = get_ptn rv rs0 (ref 0) `None in
        let hd = Stack.pop cs in
        ( match hd with
          | CS ((p0,n0),r1,l) ->
            set_list_r rv l;
            let _ = set_ptn rv r1 k0 in
            run a p0 n0 rv cs
          | _ -> raise (Failure "vm1.run:0")
        )
      )
  )
type code =
  | V of code * code
  | H of code array
  | E of exp_ptn
  | P of exp_ptn * (code array)
  | A of (exp_ptn) * (int list) * (code array)
  | F of exp_ptn * int * code
and exp_ptn =
  | Exp_Rcd of exp_ptn array
  | Exp_Atm of exp
and exp =
  | Prj of int * exp_ptn
  | Inj of int
  | Cho of int
  | Rot
  | Atm of atm
  | Z of int
  | Stg of string
  | App of exp * exp_ptn
and atm =
  | Pls
  | Mlt
  | Mns
  | Cmp
  | Eq
  | Fix
  | Exn
  | Etr of name
and name = string
and asm_name = (int, (src * (nd array))) Hashtbl.t
module Net = struct
  type reg = Reg of Sgn.t
  type reg_ptn = reg rcd_ptn
  type nd =
    | Id of reg_ptn * reg_ptn
    | Prj of int * reg_ptn * reg_ptn
    | Rm of reg
    | Agl of reg_ptn * reg_ptn * (int list) * (pt array)
    | Call of reg_ptn * reg * reg_ptn
    | HCall of (src array) * ((reg * src) array)
    | Prd of reg * reg_ptn * reg_ptn * (pt array)
    | Nd_Clj of reg * reg_ptn * reg_ptn * pt
    | Ini of reg * tkn
  and regs = reg array
  and pt_nd = Ret of reg_ptn | Nxt of nd * pt
  and pt = pt_nd ref
end
let p_a r =
  ( match r with
    | P_A r -> r
    | _ -> err "p_a 0" )
let reg () = Reg (sgn ())
let ret p =
  ( match !p with
    | Net.Ret rp -> rp
    | _ -> err "ret 0" )
let rec net_of_code rv r0 c =
  ( match c with
    | V (v1,v2) ->
      let (pm0,pm1) = net_of_code rv r0 v1 in
      let r1 = ret pm1 in
      let (pm2,pm3) = net_of_code rv r1 v2 in
      pm1 := !pm2;
      (pm0,pm3)
    | H _ -> raise (Failure "vm2:a1")
    | E n1 ->
      let (p1,p2) = net_of_exp rv r0 n1 in
      (p1,p2)
    | P (_,_) -> raise (Failure "vm2:a2")
    | A (n1,ix,l) ->
      let (p1,p2) = net_of_exp r0 n1 in
      let ai = ref 0 in
      let kp = get_ptn r1 ai (`Some ix) in
      let rvc = clear (Array.copy rv) in
      let (rvc1,rp) = add_ptn rvc kp in
      let la = Array.map
          (fun c ->
             let rvc = clear (Array.copy rv) in
             let (rvc1,rp) = add_ptn rvc kp in
             net_of_code tb a (rvc1,rh) rp c ) in
      let (p0_1,p0_2) = la.(0) in
      ( match !p0_2,!p2 with
        | Ret rp,Ret rp2 ->
          let rp1 = alc_ptn rv rp in
          let p3 = ref (Ret rp1) in
          p4 := Nxt(Agl(rp1,rp2,ix,Array.map fst la),p3);
          (p1,p4)
        | _ -> err "err 45" )
    | F (_,_,_) -> raise (Failure "vm2:a4")
  )
and asm_of_rm rv rp =
  ( match rp with
    | P_Rc rs ->
      Array.fold_left
        (fun a r ->
           let a1 = asm_of_rm rv r in
           a |+| a1 )
        (unt ()) rs
    | P_Ro (rs,rt) ->
      let a1 =
        Array.fold_left
          (fun a r ->
             let a1 = asm_of_rm rv r in
             a |+| a1 )
          (unt ()) rs in
      let a2 = [|Rm(rt)|] in
      a1 |+| a2

    | P_A r ->
      [| Rm(r) |]
  )
and net_of_exp rv r0 n0 =
  (* Util.pnt true ("enter asm_of_tns_tl:"^(Print.print_tns_s n0)^"\n"); *)
  ( match !n0 with
    | Prj (i,n1) ->
      let (p1,p2) = net_of_exp rv r0 n1 in
      let rp0 = ret p2 in
      let rp1 = new_ptn (idx [i] rp0) in
      let p3 = Ret rp1 in
      let p4 = Nxt(Prj(i,rp1,rp0),ref p3) in
      (p1,p3)
    | Inj i ->
      let k = Tkn_Fnc (Inj i) in
      let r1 = reg () in
      let p1 = ref (Ret (P_A r1)) in

      let p2 = Nxt(Ini (r1,k),p1) in
      (ref p2,p1)
    | Cho i -> err "err 23"
    | Rot ->
      let p = ref (Ret (P_A r0)) in
      (p,p)
    | Atm Pls ->
      let k = Tkn_Fnc Pls in
      let r1 = reg () in
      let p1 = Ret (P_A r1) in
      let p2 = Nxt(Ini (r1,k),ref p1) in
      (ref p2,ref p1)
    | Atm Mlt ->
      let k = Tkn_Fnc Mlt in
      let r1 = reg () in
      let p1 = Ret (P_A r1) in
      let p2 = Nxt(Ini (r1,k),ref p1) in
      (ref p2,ref p1)
    | Atm Mns ->
      let k = Tkn_Fnc Mns in
      let r1 = reg () in
      let p1 = Ret (P_A r1) in
      let p2 = Nxt(Ini (r1,k),ref p1) in
      (p2,ref p1)
    | Atm Cmp ->
      let k = Tkn_Fnc Cmp in
      let r1 = reg () in
      let p1 = Ret (P_A r1) in
      let p2 = Nxt(Ini (r1,k),ref p1) in
      (ref p2,p1)
    | Atm Eq ->
      let k = Tkn_Fnc Eq in
      let r1 = reg () in
      let p1 = Ret (P_A r1) in
      let p2 = Nxt(Ini (r1,k),ref p1) in
      (p2,p1)
    | Atm Fix ->
      let k = Tkn_Fnc Fix in
      let r1 = reg () in
      let p1 = Ret (P_A r1) in
      let p2 = Nxt(Ini (r1,k),ref p1) in
      (ref p2,p1)
    | Atm (Etr _) -> err "err 34"
    | Z z ->
      let k = Tkn_Z z in
      let r1 = reg () in
      let p1 = Ret (P_A r1) in
      let p2 = Nxt(Ini (r1,k),ref p1) in
      (ref p2,p1)
    | Stg s ->
      let k = Tkn_Stg s in
      let r1 = reg () in
      let p1 = Ret (P_A r1) in
      let p2 = Nxt(Ini (r1,k),ref p1) in
      (ref p2,p1)
    | App (f,x) ->
      let (pr1,pr2) = rpc 2 r0 in
      ( match ret pr2 with
        | P_Rc [| r1 ; r2 |] ->
          let (p1,p2) = net_of_exp r1 f in
          let (p3,p4) = net_of_exp_ptn r2 x in
          let (r3,r4) = (ret p2,ret p4) in
          pr2 := p1; p2 := p4;
          let r5 = reg () in
          let n1 = Ret (P_A r5) in
          let n2 = Call (P_A r5,p_a r3,r4) in
          let p3 = Nxt(n2,ref n1) in
          (ref p3,n1)
        | _ -> err "err 45" )
  )
