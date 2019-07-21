open Types
let err s = raise (Failure s)
let opn_err e o =
  ( match o with
    | Some x -> x
    | None -> err e )
let ( *| ) o e = opn_err e o
let ( |+| ) a b = Array.append a b
(* type plc = Plc of Sgn.t *)
type 'a rcd_ptn =
  | P_Rc of 'a array
  | P_Ro of 'a array * 'a
  | P_A of 'a
type plc = int * int
type reg = int
type reg_ptn = reg rcd_ptn
type nd =
  | Spt of regs * reg (* from heap to reg *)
  | Cns of reg * regs (* from reg to heap *)
  | Prj of int * reg * reg
  | Rm of reg
  | Id_R of regs * reg
  | Id_M of reg * reg
  | Agl of reg_ptn * reg_ptn * (int list) * (int array)
  | Call of reg_ptn * reg * reg_ptn
  | HCall of (src array) * ((reg * src) array)
  | Prd of reg * src * src * (plc array)
  | Nd_Clj of reg * src * src * plc
  | Ini_Tkn of reg * tkn
and src =
  | Src_Rcd of reg array
  | Src_Mno of reg
and regs = reg array
and asm = ( * (nd array)) array
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
and ptr = tkn ref
type st = (tkn option array) * (cs Stack.t)
and cs =
  | CS of plc * src * st_h (* return-plc * return-reg *)
  | CS_L of plc * src * st_h * (tkn option S_Ref.t)
  | CS_R of plc * src * st_h * (tkn option S_Ref.t)
and st_h = (reg * tkn) list
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
let rec free_r rv r = free_k rv (get_r rv r) *| "free_r 0"
and free_p rv p = free_k rv !p
and free_k rv k = k
let free_rs rv rs =
  let rl = Array.map (fun x -> free_r rv x) rs in
  rl
let free_src rv s =
  ( match s with
    | Src_Mno r -> free_r rv r
    | Src_Rcd rs -> free_rs rv rs )
let free_v rv =
  Array.mapi
    (fun i _ -> free_r rv i)
    rv
let alc_r rv =
  let r =
    Array.fold_left
      (fun i k ->
         ( match i,k with
           | Idx i,None -> `Alc i
           | Idx i,Some _ -> `Idx (i+1)
           | `Alc i,_ -> `Alc i ))
      rv in
  ( match r with
    | `Idx i -> (Array.append rv [|None|],i)
    | `Alc i -> (rv,i))
let add_r rv k =
  let (rv1,r) = alc_r rv in
  let _ = set_r rv1 r k in
  (rv1,r)
let add_nd a n = Array.append a [|n|]
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
          let k2 = (get_r rv r2) *| "run 0" in
          let _ = set_r rv r1 k2 in
          run a p0 (n0+1) rv cs
        | Rm r0 ->
          let _ = free_r rv r0 in
          run a p0 (n0+1) rv cs
        | Agl_RM (rs0,r1,ps) ->
          let m0 = ref 0 in
          let k2 =
            ( match get_r rv rs1.(i) *| "err 21" with
              | Tkn_CoP(m1,p3) ->
                let kx = free_p rv p3 *| "err 18" in
                m0 := m1; kx
              | Tkn_Z z ->
                if z=0 then ( m0 := 0; Tkn_Unt)
                else ( m0:=1; Tkn_Unt)
              | _ -> err "err 19" ) in
          let l = to_list rv in
          let _ = set_rs rv 0 k2 in
          Stack.push (CS((p0,n0+1),Src_Rcd rs0,l)) cs;
          run a ps.(!m0) 0 rv cs
        | Agl_MM (r0,r1,ps) ->
          let m0 = ref 0 in
          let k2 =
            ( match get_r rv rs1.(i) *| "err 21" with
              | Tkn_CoP(m1,p3) ->
                let kx = free_p rv p3 *| "err 18" in
                m0:=m1; kx
              | Tkn_Z z ->
                if z=0 then (m0:=0; Tkn_Unt)
                else (m0:=1; Tkn_Unt)
              | _ -> err "err 19" ) in
          let l = to_list rv in
          let _ = set_rs rv 0 k2 in
          Stack.push (CS((p0,n0+1),Src_Mno r0,l)) cs;
          run a ps.(!m0) 0 rv cs
        | Agl_RR (rs0,rs1,j,ps) ->
          let m0 = ref 0 in
          let k2 =
            Array.mapi
              (fun i k ->
                 if i=j then
                   ( match get_r rv rs1.(i) *| "err 21" with
                     | Tkn_CoP(m1,p3) ->
                       let kx = free_p rv p3 *| "err 18" in
                       m0 := m1; kx
                     | Tkn_Z z ->
                       if z=0 then ( m0 := 0; Tkn_Unt)
                       else ( m0 := 1; Tkn_Unt)
                     | _ -> err "err 19" )
                 else
                   (get_r rv rs1.(i)) *| "err 20" )
              rs1 in
          let l = to_list rv in
          let _ = set_rs rv (Array.init (Array.length k2) (fun i -> i)) k2 in
          Stack.push (CS((p0,n0+1),Src_Rcd rs0,l)) cs;
          run a ps.(!m0) 0 rv cs
        | Agl_MR (r0,rs1,j,ps) ->
          let m0 = ref 0 in
          let k2 =
            Array.mapi
              (fun i k ->
                 if i=j then
                   ( match get_r rv rs1.(i) *| "err 21" with
                     | Tkn_CoP(m1,p3) ->
                       let kx = free_p rv p3 *| "err 18" in
                       m0 := m1; kx
                     | Tkn_Z z ->
                       if z=0 then ( m0 := 0; Tkn_Unt)
                       else ( m0 := 1; Tkn_Unt)
                     | _ -> err "err 19" )
                 else
                   free_k rv (get_r rv rs1.(i)) *| "err 20" )
              rs1 in
          let l = to_list rv in
          let _ = set_rs rv (Array.init (Array.length k2) (fun i -> i)) k2 in
          Stack.push (CS((p0,n0+1),Src_Mno r0,l)) cs;
          run a ps.(!m0) 0 rv cs
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
              let _ = set_rs rv (Array.init (Array.length k2) (fun i -> i)) k2 in
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
              let _ = set_rs rv (Array.init (Array.length k2) (fun i -> i)) k2 in
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
        | Prj(i,r1,r2) ->
          let k0 = get_r rv r2 in
          ( match k0 with
            | Some Rcd c ->
              let k = get_p rv c.(i) in
              ( match k with
                | None -> err "err 11"
                | Some k ->
                  set_r rv r1 k;
                  run a p0 (n0+1) rv cs )
            | _ -> err "err 12" )
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
            )
        | Src_Rcd rs0 ->
          let ks0 = free_rs rv rs0 in
          let _ = free_v rv in
          if (Stack.is_empty cs) then Rcd (Array.map (fun k -> Ptr_Hp (ref k)) ks0)
          else
            let hd = Stack.pop cs in
            ( match hd with
              | CS ((p0,n0),Src_Rcd rs1,l) ->
                set_list_r rv l;
                let _ = set_rs rv rs1 (Array.map (fun x -> Some x) ks0) in
                run a p0 n0 rv cs
              | CS_A ((p0,n0),Src_Rcd rs1) ->
                let _ = set_rs rv rs1 (Array.map (fun x -> Some x) ks0) in
                run a p0 n0 rv cs
              | _ -> err "err 16"
            )      )
  )

type code =
  | V of code * code
  | H of code array
  | E of exp rcd_ptn
  | P of exp * (code array)
  | A of (exp rcd_ptn) * (int list) * (code array)
  | F of exp * int * code
and exp =
  | Prj of int * exp
  | Inj of int
  | Cho of int
  | Rot
  | Unt
  | Atm of atm
  | Z of int
  | Stg of string
  | App of exp * exp
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
let rec asm_of_code tb a p0 rv r0 c =
  (* Util.pnt true (
     "enter asm_of_code"^
     (print_asm a)^","^
     (pnt_plc p0)^","^(pnt_reg r0)^"\n"); *)
  let _ = Core.Hashtbl.add tb ~key:v0 ~data:(p0,r0) in
  let f0 = get_code c v0 in
  ( match f0 with
    | V (v1,v2) ->
      let (a1,s1) = asm_of_code tb a rv r0 v1 in
      let (a2,s2) = asm_of_code tb a rv s1 v2 in
      (a2,s2)
    | H _ -> err "vm2:a1"
    | E_M e1 ->
      let (a1,r1,_) = asm_of_exp tb a p0 rv r0 e1 in
      (a1,r1)
    | P (_,_) -> raise (Failure "vm2:a2")
    | A (n1,l) ->
      (* Util.pnt true "vm2:d1\n"; *)
      let (p1,r1,ra) = asm_of_exp tb a rv r0 n1 in
      ( match r1,ra with
        | Src_Mno r1,Some ra ->
          (* Util.pnt true "vm2:d0\n"; *)
          let ps = List.map (fun _ -> plc ()) l in
          let pa = Array.of_list ps in
          let r2 = add_r rv Tkn_Unt in
          let np = plc () in
          let _ = asm_add a p1 (Agl(r2,ra,pa)) in
          let lp = List.combine ps l in
          let _ = List.map (fun (pf,f) -> asm_of_code tb a pf (rv,rh) r1 c f) lp in
          let _ = asm_add a np (Ret r2) in
          (plc_to np)
        | _ -> raise (Failure "vm2:a3")
      )
    | F_S (_,_,_) -> raise (Failure "vm2:a4")
  )
and asm_of_exp tb rv r0 n0 =
  (* Util.pnt true ("enter asm_of_tns_tl:"^(Print.print_tns_s n0)^"\n"); *)
  ( match !n0 with
    | Prj (i,n1) ->
      let (a1,rr,_) = asm_of_exp tb rv r0 n1 in
      ( match rr with
        | Src_Mno r ->
          let _ = free_r rv r
        let (rv,r1) = add_r rv Tkn_Unt in
        let a2 = a1 |+| [|Prj(r1,i,r)|] in
        (a2,rv,r1,None)
      | Src_Rcd rs ->
        let (a1,_) =
          Array.fold_left
            (fun (a,j) r ->
               if i=j then (a,j+1)
               else
                 let _ = free_r rv r in
                 let a1 = a |+| [|Rm(r)|] in
                 (a1,j+1))
            rs in
        (a1,rv,rs.(i),None)
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
      | Agl n1 ->
        let (p1,r2,_) = asm_of_tns_tl tb a p0 (rv,rh) r0 c n1 in
        (p1,r2,Some r2)
      | Rot ->
        let r1 = add_k_r rv Tkn_Unt in
        let np = plc () in
        let _ = asm_add a p0 (Op(Id(r1,r0),np)) in
        let _ = free_r (rv,rh) r0 in
        (* Util.pnt true "test0\n"; *)
        (np,r1,None)
      | Unt ->
        let r1 = add_k_r rv Tkn_Unt in
        let np = plc () in
        let _ = asm_add a p0 (Op(Ini_Tkn(r1,Tkn_Unt),np)) in
        (np,r1,None)
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
