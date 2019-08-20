let dbg = true
open Types
exception Null
let dbg_stp = false

let rec code_of_vh g c p f =
  ( match f with
    | V(f1,f2) ->
      let (p1,p2) = (sgn(),sgn()) in
      let c1 = code_of_vh g c p1 f1 in
      let c2 = code_of_vh g c1 p2 f2 in
      let c3 = add_code c2 p (V_S(p1,p2)) in
      c3
    | H(f1,f2) ->
      let (p1,p2) = (sgn(),sgn()) in
      let c1 = code_of_vh g c p1 f1 in
      let c2 = code_of_vh g c1 p2 f2 in
      let c3 = add_code c2 p (H_S(p1,p2)) in
      c3
    | E n ->
      let n1 = code_of_nd g n in
      let s1 = tns_of_nd n1 in
      add_code c p (E_S s1)
    | P (n,l) ->
      let (c1,lp) = List.fold_left
          (fun (c,l) x ->
             let p = sgn () in
             let c1 = code_of_vh g c p x in
             (c1,l@[p]))
          (c,[]) l in
      let n1 = code_of_nd g n in
      let s1 = tns_of_nd n1 in
      let n1 = P_S(s1,lp) in
      add_code c1 p n1
    | A(n,_,l) ->
      let (c1,lp) = BatList.fold_left
          (fun (c,l) x ->
             let p = sgn () in
             let c1 = code_of_vh g c p x in
             (c1,l@[p]))
          (c,[]) l in
      let n1 = code_of_nd g n in
      let s1 = tns_of_nd n1 in
      let n1 = A_S(s1,lp) in
      add_code c1 p n1
    | F(n,i,q) ->
      let p1 = sgn () in
      let c1 = code_of_vh g c p1 q in
      let n1 = code_of_nd g n in
      let s1 = tns_of_nd n1 in
      let n1 = F_S(s1,i,p1) in
      add_code c1 p n1
  )
and gl_vct g =
  let nm =
    BatList.fold_left
      (fun nm e ->
         match e with
         | Etr(_,(name,_,_,_)) ->
           StgMap.add name (`GN (sgn())) nm
         | Etr_Clq(_,l) ->
           BatList.fold_left
             (fun r (name,_,_,_) ->
                StgMap.add name (`GN (sgn())) r)
             nm l
         | _ -> raise (Failure "err10") )
      StgMap.empty g in
  let c = BatList.fold_left
      (fun c0 e ->
         match e with
         | Etr(_,(name,_,_,f)) ->
           let w =
             try (StgMap.find name nm)
             with _ -> raise (Failure "err9.1") in
           ( match w with
             | `GN p ->
               let c1 = code_of_vh nm c0 p (Ty.vh_of_code f) in
               c1
             | _ -> raise (Failure "err12") )
         | Etr_Clq(_,l) ->
           BatList.fold_left
             (fun c0 (name,_,_,f) ->
                let q =
                  try (StgMap.find name nm)
                  with _ -> raise (Failure "err:p1") in
                ( match q with
                  | `GN p ->
                    let c1 = code_of_vh nm c0 p (Ty.vh_of_code f) in
                    c1
                  | _ -> raise (Failure "err12") ))
             c0 l
         | _ -> raise (Failure "err10") )
      (ini_code()) g in
  (nm,c)
and code_of_nd g (n:nd) =
  let w = code_of_nd g in
  ( match n with
    | Exp_Z z -> Z_S z
    | Exp_App (Exp_Name "∠",n2) ->
      Agl_S (w n2)
    | Exp_Name s ->
      if s="}" then Gl_S nd_unt
      else if s="⊗" then Gl_S nd_tns
      else if s="+" then Gl_S nd_pls
      else if s="-" then Gl_S nd_mns
      else if s="*" then Gl_S nd_mlt
      else if s="=" then Gl_S nd_eq
      else if s="@" then Gl_S nd_fix
      else if s="$" then Gl_S nd_rot
      else if s="?" then Gl_S nd_anm
      else if s="&" then Gl_S nd_sgn_ini
      else if s="std_le" then Gl_S nd_std_le
      else
        let q =
          try StgMap.find s g
          with _ -> raise (Failure ("err:q1:"^s)) in
        ( match q with
          | `GN p -> Gl_S p
          | _ -> raise (Failure "err11") )
    | Exp_App (n1,n2) ->
      App_S(w n1,w n2)
    | Exp_Tns (n1,n2) ->
      Tns_S(w n1,w n2)
    | PrjL n1 -> PL_S(w n1)
    | PrjR n1 -> PR_S(w n1)
    | Inj i -> Inj_S i
    | Cho i -> Cho_S i
    | Exp_Stg s -> Stg_S s )
let gl_call g n =
  (* Util.pnt false ("enter gl_call:"^n^","^(string_of_gl_st g)^"\n"); *)
  ( try
      BatList.find_map
        (fun x ->
           match x with
           | Etr (_,(name,_,_,c)) when name=n -> Some c
           | Etr_Clq (_,l) ->
             ( try
                 let c =
                   BatList.find_map
                     (fun (name,_,_,c) -> if name=n then Some c else None)
                     l in
                 Some c
               with _ -> None )
           | _ -> None )
        g
    with _ -> raise (Failure "imp.gl_call:1"))

let mk_code g f =
  let (nm,c) = gl_vct g in
  let p = sgn () in
  let c1 = code_of_vh nm c p f in
  (c1,p)

let mrg_agl (o1:int option) (o2:int option) : int option =
  ( match o1,o2 with
    | Some i,None -> Some i
    | None,Some i -> Some i
    | None,None -> None
    | _ -> raise (Failure "mrg_agl") )
