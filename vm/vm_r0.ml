(*
open Types
let err s = raise (Failure s)
let opn_err e o =
  ( match o with
    | Some x -> x
    | None -> err e )
let ( *| ) o e = opn_err e o
let ( |+| ) a b = Array.append a b
(* type plc = Plc of Sgn.t *)
let unt () = Array.make 0 (fun _ -> ())
type 'a rcd_ptn =
  | P_Rc of ('a rcd_ptn) array
  | P_Ro of ('a rcd_ptn ) array * 'a
  | P_A of 'a
type plc = int * int
type reg = int
type reg_ptn = reg rcd_ptn
type nd =
  | Id of reg_ptn * reg_ptn
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
and st_h = (reg * tkn) list * ((reg * (rcd_tkn)) list)
let get_r rv r =
  let k = rv.(r) in
  rv.(r)<-None;
  k
let get_rs rv rs =
  Array.map (fun r -> get_r rv r) rs
let get_p rv p = !p
let set_r rv r k0=
  let k1 = rv.(r) in
  ( match k1 with
    | None -> rv.(r)<-k1
    | Some _ -> err "set_r 0" )
let set_rs rv rs ks =
  Array.mapi
    (fun i k ->
       ( match k with
         | None -> ()
         | Some k -> set_r rv rs.(i) k))
    ks
let free_r rv r = (get_r rv r) *| "free_r 0"
and free_p rv p : tkn = !p
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
    rv
let alc_r rv =
  let r =
    Array.fold_left
      (fun i k ->
         ( match i,k with
           | `Idx i,None -> `Alc i
           | `Idx i,Some _ -> `Idx (i+1)
           | `Alc i,_ -> `Alc i ))
      (`Idx 0) rv in
  ( match r with
    | `Idx i -> rv := (Array.append !rv [|None|]); i
    | `Alc i -> i )
let add_r rv k =
  let (rv1,r) = alc_r rv in
  let _ = set_r rv1 r k in
  (rv1,r)
let rec get_ptn (rv:rcd_tkn option array) rt rp ap ai =
  ( match ai with
    | `None ->
      ( match rp with
        | P_Rc as0 ->
          Rcd_Rcd (Array.map (fun r -> get_ptn rv rt r ap `None) as0)
        | P_Ro (as0,a1) ->
          let (xs0,x1) = (
            Array.map (fun r -> get_ptn rv rt r ap `None) as0,
            get_r rt a1 *| "get_ptn 2") in
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
            | Tkn_CoP(m1,p3) ->
              let kx = p3 in
              ap := m1; kx
            | Tkn_Z z ->
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
                           get_ptn rv rt r ap (`Some tl)
                         else
                           get_ptn rv rt r ap `None )
                      as0 )
        | P_Ro (as0,a1)->
          let (xs0,x1) = (
            ( Array.mapi
                (fun i r ->
                   if i=hd then
                     get_ptn rv rt r ap (`Some tl)
                   else
                     get_ptn rv rt r ap `None )
                as0 ),
            get_r rt a1 *| "get_ptn 2") in
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
      let (_,rs1) = Array.fold_left
          (fun (i,rs1) ->
             let r = alc_ptn rv rs.(i) in
             (i+1,rs1 |+| r)) in
      P_Rc rs1
    | P_Ro (rs,rt) ->
      let (_,rs1) = Array.fold_left
          (fun (i,rs1) ->
             let r = alc_ptn rv rs.(i) in
             (i+1,rs1 |+| r)) in
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
      let (rv,r) = (add_r rv k) in
      (rv,P_A r)
    | Rcd_Rcd ks ->
      let (_,rv,rp) =
        Array.fold_left
          (fun (i,rv,rp) r ->
             let (rv,ri) = add_ptn rv ks.(i) in
             (i+1,rv,rp |+| ri))
          (0,rv,[||]) ks in
      (rv,P_Rc rp))
let rec get_idx is kp =
  ( match is,kp with
    | [],_ -> kp
    | hd::tl,Rcd_Rcd ps -> get_idx tl ps.(hd)
    | _ -> err "get_idx" )
let add_nd a n = Array.append a [|n|]
let clear_v v = Array.map (fun _ -> None) v
let to_list rv rt =
  let (_,l) =
    Array.fold_left
      (fun (i,l) k ->
         ( match k with
           | None -> (i+1,l)
           | Some k -> (i+1,(i,k)::l)))
      (0,[]) rv in
  let (_,lt) =
    Array.fold_left
      (fun (i,l) k ->
         ( match k with
           | None -> (i+1,l)
           | Some k -> (i+1,(i,k)::l)))
      (0,[]) rt in
  (l,lt)
let set_list_r rv rt (l,lt) =
  let _ = List.fold_left
      (fun _ (r,k) -> set_r rv r k)
      () l in
  let _ = List.fold_left
      (fun _ (r,k) -> set_r rt r k)
      () lt in
  ()
let rec run a p0 n0 rv rt cs =
  let (rs0,rd0,ap0) = a.(p0) in
  ( try
      let o0 = ap0.(n0) in
      ( match o0 with
        | Id (r1,r2) ->
          let k2 = (get_ptn rv rt r2 (ref 0) `None) in
          let _ = set_ptn rv rt r1 k2 in
          run a p0 (n0+1) rv rt cs
        | Rm r0 ->
          let _ = free_r rv r0 in
          run a p0 (n0+1) rv rt cs
        | Agl (rp1,rp2,is,ps) ->
          let m0 = ref 0 in
          let kp = get_ptn rv rt rp2 m0 (`Some is) in
          let l = to_list rv rt in
          let (sp,dp,ax) = a.(ps.(!m0)) in
          let _ = set_ptn rv rt sp kp in
          Stack.push (CS((p0,n0+1),rp1,l)) cs;
          run a ps.(!m0) 0 rv rt cs
        | Call (rp0,r1,rp2) ->
          let k_f = get_r rv r1 *| "err 23" in
          let kx = (get_ptn rv rt rp2 (ref 0) `None) in
          ( match rp0,k_f,kx with
            | P_A r0,Tkn_Fnc Mns,Rcd_Tkn Tkn_Z z ->
              let _ = set_r rv r0 (Tkn_Z (-z)) in
              run a p0 (n0+1) rv rt cs
            | P_A r0,Tkn_Fnc Inj i,kx ->
              let _ = set_r rv r0 (Tkn_CoP (i,kx)) in
              run a p0 (n0+1) rv rt cs
            | _,Tkn_Fnc Cho _,_ -> err "err 7"
            | _,Tkn_Fnc Exn,_ -> err "err 8"
            | _,Tkn_Fnc Fix,_ -> err "err 9"
            | _,Tkn_Fnc Fnc pa,kx ->
              let l = to_list rv rt in
              let (sp,_,_) = a.(pa) in
              let _ = set_ptn rv rt sp kx in
              Stack.push (CS((p0,n0+1), rp0,l)) cs;
              run a pa 0 rv rt cs
            | _,Tkn_Fnc Clj (pa,l0),kx -> err "run 3"
            | P_A r0,Tkn_Fnc Pls,Rcd_Rcd [|(Rcd_Tkn Tkn_Z z1);(Rcd_Tkn Tkn_Z z2)|] ->
              let _ = set_r rv r0 (Tkn_Z (z1+z2)) in
              run a p0 (n0+1) rv rt cs
            | P_A r0,Tkn_Fnc Mlt,Rcd_Rcd [|(Rcd_Tkn Tkn_Z z1);(Rcd_Tkn Tkn_Z z2)|] ->
              let _ = set_r rv r0 (Tkn_Z (z1*z2)) in
              run a p0 (n0+1) rv rt cs
            | P_A r0,Tkn_Fnc Cmp,Rcd_Rcd [|(Rcd_Tkn Tkn_Z z1);(Rcd_Tkn Tkn_Z z2)|] ->
              let b = if z1<=z2 then 1 else 0 in
              let _ = set_r rv r0 (Tkn_Z b) in
              run a p0 (n0+1) rv rt cs
            | P_A r0,Tkn_Fnc Eq,Rcd_Rcd [|x;y|] ->
              let b = if x=y then 1 else 0 in
              let _ = set_r rv r0 (Tkn_Z b) in
              run a p0 (n0+1) rv rt cs
            | _ -> err "err 38"
          )
        | HCall (_,_) ->
          (* let (y1,y2) = (sgn(),sgn()) in
             let (kf1,kx1,kf2,kx2) = (get_k v f1,get_k *) raise (Failure "vm1.run:7")
        | Prd (r0,rs1,rs2,ps) -> err "err 10"
        | Nd_Clj (r0,rs1,rs2,p0) -> err "err 11"
        | Ini (r0,k) ->
          let _ = set_r rv r0 k in
          run a p0 (n0+1) rv rt cs
        | Prj(i,r1,r2) ->
          let k0 = get_ptn rv rt r2 (ref 0) `None in
          let ki = get_idx i k0 in
          let _ = set_ptn rv rt r1 ki in
          run a p0 (n0+1) rv rt cs
      )
    with _ ->
      (
        let k0 = get_ptn rv rt rs0 (ref 0) `None in
        let hd = Stack.pop cs in
        ( match hd with
          | CS ((p0,n0),r1,l) ->
            set_list_r rv rt l;
            let _ = set_ptn rv rt r1 k0 in
            run a p0 n0 rv rt cs
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
  | Unt
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
  type nd =
    | Id of reg_ptn * reg_ptn
    | Prj of (int list) * reg_ptn * reg_ptn
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
let rec net_of_code tb a p0 (rv,rh) r0 c =
  let _ = Core.Hashtbl.add tb ~key:v0 ~data:(p0,r0) in
  ( match c with
    | V (v1,v2) ->
      let (pm0,pm1,_) = net_of_code tb a p0 (rv,rh) r0 v1 in
      ( match !pm1 with
        | Ret r1 ->
          let (pm2,pm3) = net_of_code tb a (rv,rh) r1 v2 in
          pm1 := !pm2;
          (pm0,pm3)
        | _ -> err "net_of_code 0")
    | H (_,_) -> raise (Failure "vm2:a1")
    | E n1 ->
      let (p1,p2,_) = net_of_exp tb a (rv,rh) r0 n1 in
      (p1,p2)
    | P (_,_) -> raise (Failure "vm2:a2")
    | A (n1,ix,l) ->
      let (p1,p2) = net_of_exp tb am rv r0 n1 in
      let ai = ref 0 in
      let kp = get_ptn rv rt r1 ai (`Some ix) in
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
    | F_S (_,_,_) -> raise (Failure "vm2:a4")
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
    | P_A r -> [|Rm(r)|]
  )
and asm_of_exp tb rv rt r0 n0 =
  (* Util.pnt true ("enter asm_of_tns_tl:"^(Print.print_tns_s n0)^"\n"); *)
  ( match !n0 with
    | Prj (i,n1) ->
      let (p1,p2) = asm_of_exp tb rv r0 n1 in
      ( match r1 with
        | P_Rc ps ->
          let (a2,_) =
            Array.fold_left
              (fun (a,j) r ->
                 if i=j then (a,j+1)
                 else
                   let _ = free_ptn rv r in
                   let a1 = asm_of_rm rv r in
                   (a |+| a1,j+1))
              rs in
          (a1 |+| a2,rv,rt,ps.(i),None)
        | P_Ro (ps,r0) ->
          let (a2,_) =
            Array.fold_left
              (fun (a,j) r ->
                 if i=j then (a,j+1)
                 else
                   let _ = free_ptn rv1 r in
                   let a1 = asm_of_rm rv1 r in
                   (a |+| a1,j+1))
              rs in
          let _ = free_r rv1 r0 in
          let a3 = [|Rm r0|] in
          (a1 |+| (a2 |+| a3),rv1,ps.(i),None)
        | P_A r0 ->
          let _ = free_r rv1 r0 in
          let (rv2,r1) = add_r rv1 Tkn_Unt in
          (a1 |+| (Prj(i,r1,r0)),rv2,P_A r1,None)
      )
    | Inj i ->
      ( match r0 with
        | Src_Mno r0 ->
          let _ = free_r rv r0 in
          let (rv,r1) = add_r rv Tkn_Unt in
          let o1 = Ini_Tkn(r1,Tkn_Fnc (Inj i)) in
          ([|o1|],rv,r1,None)
        | Src_Rcd rs ->
          let _ = free_rs rv rs in
          let r1 = add_r rv Tkn_Unt in
          let o1 = Ini_Tkn(r1,Tkn_Fnc (Inj i)) in
          ([|o1|],rv,r1,None))
    | Cho i -> err "err 23"
    | Rot ->
      (ref (Ret r0),ref (Ret r0))
    | Unt ->
      let r1 = add_r rv Tkn_Unt in
      let p1 =  Ini (r1,Tkn_Unt) in
      (ref p1,ref (Ret (P_A r1)))
    | Plg q1 when q1=nd_pls ->
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
*)
