let dbg = true
open Types
open Print
exception Null
let dbg_stp = false
let ini_code () = SgnHash.create 10
let add_code c p v =
  SgnHash.remove c p;
  SgnHash.add c p v;
  c
let get_code c p =
  SgnHash.find c p
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
let rec evo_vh (g:gl_st) (s:lst) (a:vh) : lst =
  Util.pnt false ("enter evo_vh:"^
                  (*(string_of_gl_st g)^"\n"^*)
                  (string_of_lst s)^"\n"^
                  (print_vh a)^"\n");
  ( match a with
    | E e ->
      ( match evo_nd g s e with
        | (s1,None) -> s1
        | _ -> raise (Failure "evo_vh:4"))
    | V (c1,c2) ->
      let s1 = evo_vh g s c1 in
      evo_vh g s1 c2
    | H (c1,c2) ->
      ( match s with
        | Lst_Tns (x1,x2) ->
          let s1 = evo_vh g x1 c1 in
          let s2 = evo_vh g x2 c2 in
          Lst_Tns (s1,s2)
        | _ -> raise @@ Failure "error:evo_code:Canon"
      )
    | A (e1,_,l) ->
      let s1 = evo_nd g s e1 in
      ( match s1 with
        | (_,None) -> raise @@ Failure "error:evo_nd:1"
        | (s1,Some j) ->
          evo_vh g s1 (List.nth l j))
    | P (e1,l) ->
      let s0 = evo_nd g s e1 in
      ( match s0 with
        | (s1,None) -> Lst_Prd (s1,l)
        | _ -> raise (Failure "evo_vh:4"))
    | F (e1,i,c0) ->
      let s1 = evo_nd g s e1 in
      ( match s1 with
        | (s1,None) -> Lst_Code (Arg_Rcd([s1],i),C_VH c0)
        | _ -> raise (Failure "evo_vh:4"))
  )
and evo_nd g s e : nd_eval =
  Util.pnt false ("enter evo_nd:"^
                  (*(string_of_gl_st g)^"\n"^*)
                  (string_of_lst s)^"\n"^
                  (print_nd e)^"\n");
  let agl_flg = ref None in
  let rec v e =
    Util.pnt false ("enter v:"^(print_nd e)^"\n");
    ( match e with
      | Exp_Z z -> Lst_Z (z,0)
      | Exp_Name n ->
        if n="$" then s
        else if n="+" then Lst_Code(Arg_Mno None,C_Name "+")
        else if n="*" then Lst_Code(Arg_Mno None,C_Name "*")
        else if n="-" then Lst_Code(Arg_Mno None,C_Name "-")
        else if n="=" then Lst_Code(Arg_Rcd([],2),C_Name "=")
        else if n="&" then Lst_Code(Arg_Mno None,C_Name "&")
        else if n="⊗" then Lst_Code(Arg_Rcd([],2),C_Name "⊗")
        else if n="}" then Lst_Unt
        else if n="@" then Lst_Code(Arg_Mno None,C_Name "@")
        else if n="∠" then Lst_Code(Arg_Mno None,C_Agl)
        else if n="?" then Lst_Code(Arg_Mno None,C_Name "?")
        else
          ( try
              let c = Ty.vh_of_code (gl_call g n) in
              Lst_Code(Arg_Mno None,C_VH c)
            with _ -> Lst_Exn "exn8.0")
      | Exp_App (e1,e2) ->
        let (s1,s2) = (v e1,v e2) in
        Util.pnt false ("Exp_App:"^(string_of_lst s1)^","^
                        (string_of_lst s2)^"\n");
        ( match s1 with
          | Lst_Code(Arg_Mno None,f) ->
            ( match f with
              | C_Name "+" ->
                ( match list_of_lst s2 with
                  | Some [Lst_Z(z1,_);Lst_Z(z2,_)] -> Lst_Z(z1+z2,0)
                  | Some as2 ->
                    let p = Util.string_of_list "," string_of_lst as2 in
                    Lst_Exn ("exn7:"^p)
                  | None -> Lst_Exn "exn7.1")
              | C_Name "*" ->
                ( match list_of_lst s2 with
                  | Some [Lst_Z(z1,_);Lst_Z(z2,_)] -> Lst_Z(z1*z2,0)
                  | _ -> Lst_Exn "exn7.2" )
              | C_Name "-" ->
                ( match s2 with
                  | Lst_Z(z1,_) -> Lst_Z(-z1,0)
                  | _ -> Lst_Exn "exn7.3" )
              | C_Name "&" ->
                ( match s2 with
                  | Lst_Unt -> Lst_Sgn (sgn())
                  | _ -> Lst_Exn "exn7.4")
              | C_Name "?" ->
                ( match s2 with
                  | Lst_Stg s -> Lst_Exn s
                  | _ -> Lst_Exn "exn7.7")
              | C_Agl ->
                ( match s2 with
                  | Lst_Code(Arg_Mno (Some x),C_Inj j) ->
                    agl_flg := Some j;
                    x
                  | Lst_Z(z,_) ->
                    if (z=0) then
                      ((agl_flg:=(Some 0)); lst_nil)
                    else (agl_flg:=(Some 1); lst_nil)
                  | _ -> Lst_Exn "exn7.6" )
              | C_VH c -> evo_vh g s2 c
              | C_Inj j -> Lst_Code(Arg_Mno (Some s2),C_Inj j)
              | _ -> Lst_Exn "exn7.4"
            )
          | Lst_Code(Arg_Rcd(as0,k),f) ->
            if k=0 then Lst_Exn "exn2"
            else if k=1 then
              ( match (as0@[s2]),f with
                | [x1;x2],(C_Name "⊗") -> Lst_Tns (x1,x2)
                | [x1;x2],(C_Name "=") ->
                  if x1=x2 then Lst_Z (1,0) else Lst_Z(0,0)
                | as1,C_VH c -> evo_vh g (lst_of_list as1) c
                | _ -> Lst_Exn "exn3"
              )
            else Lst_Code(Arg_Rcd(as0@[s2],k-1),f)
          | _-> Lst_Exn "exn9"
        )
      | Exp_Tns (e1,e2) ->
        Lst_Tns (v e1,v e2)
      | PrjL e1 ->
        let a = v e1 in
        ( match a with
          | Lst_Tns (a1,_) ->
            a1
          | _ -> Lst_Exn "exn3")
      | PrjR e1 ->
        let a = v e1 in
        ( match a with
          | Lst_Tns (_,a2) ->
            a2
          | _ -> Lst_Exn "exn4")
      | Inj i -> Lst_Code(Arg_Mno None,C_Inj i)
      | Cho i -> Lst_Code(Arg_Mno None,C_Cho i)
      | Exp_Stg s -> Lst_Stg s
    ) in
  let v = v e in
  (v,!agl_flg)
let mk_code g f =
  let (nm,c) = gl_vct g in
  let p = sgn () in
  let c1 = code_of_vh nm c p f in
  (c1,p)
let tkn_of_list (l:tkn_s list) : tkn_s =
  List.fold_right
    (fun x r -> TknS_Tns(x,r))
    l (TknS_Plg nd_unt)
let rec list_of_tkn v =
  ( match v with
    | TknS_Plg p when p=&nd_unt -> []
    | TknS_Tns(x,y) ->
      let t = list_of_tkn y in
      x::t
    | _ -> raise (Failure "list_of_tkn"))
let mrg_agl (o1:int option) (o2:int option) : int option =
  ( match o1,o2 with
    | Some i,None -> Some i
    | None,Some i -> Some i
    | None,None -> None
    | _ -> raise (Failure "mrg_agl") )
let rec evo_tkn (s:tkn_s ref) (a:(code_s ref)) (f:Sgn.t) : tkn_s ref =
  (* Util.pnt false ("enter evo_vh:"^
                  (*(string_of_gl_st g)^"\n"^*)
                  (print_tkn_s s)^"\n"^
                  "\n"); *)
  let w =
    try get_code !a f
    with _ -> raise (Failure "err:w1") in
  ( match w with
    | E_S e ->
      let s1 = evo_nd_tkn s a e in
      ref s1
    | V_S (c1,c2) ->
      let s1 = evo_tkn s a c1 in
      evo_tkn s1 a c2
    | H_S (c1,c2) ->
      ( match !s with
        | TknS_Tns (x1,x2) ->
          let s1 = evo_tkn (ref x1) a c1 in
          let s2 = evo_tkn (ref x2) a c2 in
          ref (TknS_Tns (!s1,!s2))
        | _ -> raise @@ Failure "error:evo_code:Canon"
      )
    | A_S (e1,l) ->
      let s1 = evo_nd_tkn_agl s a e1 in
      ( match s1 with
        | (_,None) -> raise @@ Failure "error:evo_nd:1"
        | (s1,Some j) ->
          evo_tkn (ref s1) a (List.nth l j))
    | P_S (e1,l) ->
      let s0 = evo_nd_tkn s a e1 in
      let lp = List.map (fun x -> TknS_Plg x) l in
      ref (TknS_Tns(s0,tkn_of_list lp))
    | F_S (e1,i,c0) ->
      let s1 = evo_nd_tkn s a e1 in
      ref (tkn_of_list [
          (TknS_Plg clj);(tkn_of_list [s1]);
          (TknS_Z i);(TknS_Plg c0) ] )
  )
and evo_nd_tkn s a p1 : tkn_s =
  (* Util.pnt dbg_stp ("enter evo_nd_tkn:"^(print_tkn_s s)^","^
                 (print_nd_s e)^"\n"); *)
  (*  Util.pnt false ("enter v:"^(print_nd_s e)^"\n"); *)
  let e = !p1 in
  ( match e with
    | Z_x z -> TknS_Z z
    | Plg_x p ->
      if p=&nd_rot then !s
      else TknS_Plg p
    | Agl_x _ ->
      raise (Failure "err.a1")
    | AppT (e1,e2) ->
      let s1 = evo_nd_tkn s a e1 in
      (* Util.pnt false ("Exp_App:"^(print_tkn_s s1)^","^
                     (print_tkn_s s2)^"\n"); *)
      let f0 s1 =
        ( match s1 with
          | TknS_Plg p when p=&nd_pls ->
            let s2 = evo_nd_tkn s a e2 in
            ( match s2 with
              | TknS_Tns(TknS_Z z1,TknS_Tns(TknS_Z z2,TknS_Plg p)) when p=nd_unt ->
                TknS_Z (z1+z2)
              | _ -> raise (Failure "err4"))
          | TknS_Plg p when p=&nd_std_le ->
            let s2 = evo_nd_tkn s a e2 in
            ( match s2 with
              | TknS_Tns(TknS_Z z1,TknS_Tns(TknS_Z z2,TknS_Plg p)) when p=nd_unt ->
                if z1<=z2 then TknS_Z 1
                else TknS_Z 0
              | _ -> raise (Failure "err4"))
          | TknS_Plg p when p=&nd_mlt ->
            let s2 = evo_nd_tkn s a e2 in
            let s2l = list_of_tkn s2 in
            ( match s2l with
              | (TknS_Z z1)::(TknS_Z z2)::[] ->
                TknS_Z (z1*z2)
              | _ -> raise (Failure "err5"))
            (*
          | TknS_Plg p when p=&nd_tns ->
          let r = TknS_Tns(TknS_Plg nd_tns,s2) in
          (r,o3)
        | TknS_Tns(TknS_Plg p,_) when p=&nd_tns ->
          (TknS_Tns(s1,s2),o3) *)
          | TknS_Plg p when p=&nd_mns ->
            let s2 = evo_nd_tkn s a e2 in
            ( match s2 with
              | TknS_Z z -> TknS_Z(-z)
              | _ -> raise (Failure "err6"))
          | TknS_Plg p when p=&nd_eq ->
            let s2 = evo_nd_tkn s a e2 in
            let r = TknS_Tns(TknS_Plg nd_eq,s2) in
            r
          | TknS_Tns(TknS_Plg p,s1) when p=&nd_eq ->
            let s2 = evo_nd_tkn s a e2 in
            if s1=s2 then TknS_Z 1 else TknS_Z 0
          | TknS_Plg p when p=&nd_sgn_ini ->
            let s2 = evo_nd_tkn s a e2 in
            ( match s2 with
              | TknS_Plg p when p=&nd_unt -> TknS_Plg (sgn())
              | _ -> raise (Failure "err6"))
          | TknS_Plg p when p=&nd_anm ->
            let s2 = evo_nd_tkn s a e2 in
            ( match s2 with
              | TknS_Tns(TknS_Plg p1,TknS_Stg s) when p1=&stg_plg ->
                TknS_Tns(TknS_Plg exn_plg,TknS_Stg s)
              | _ -> raise (Failure "err6"))
          | TknS_Tns(TknS_Plg p,TknS_Z _) when p=&inj ->
            let s2 = evo_nd_tkn s a e2 in
            TknS_Tns(s1,s2)
          | TknS_Tns(TknS_Plg p,_) when p =&clj ->
            let s2 = evo_nd_tkn s a e2 in
            let f = list_of_tkn s1 in
            ( match f with
              | _::as0::(TknS_Z i0)::(TknS_Plg p0)::[] ->
                let as0l = list_of_tkn as0 in
                if i0=1 then
                  !(evo_tkn (ref (tkn_of_list (as0l@[s2]))) a p0)
                else
                  let r = tkn_of_list
                      [(TknS_Plg clj);(tkn_of_list (as0l@[s2]));
                       (TknS_Z(i0-1));(TknS_Plg p0) ] in
                  r
              | _ ->
                let r = TknS_Tns(TknS_Plg exn_plg,TknS_Stg "exn7.4") in
                r
            )
          | TknS_Tns(TknS_Plg p1,TknS_Z i) when p1 =& cho ->
            let s2 = evo_nd_tkn s a e2 in
            ( match s2 with
              | TknS_Tns(s3,s4) ->
                let l = list_of_tkn s4 in
                let vl = List.nth l i in
                (match vl with
                 | TknS_Plg p ->
                   !(evo_tkn (ref s3) a p)
                 | _ -> raise (Failure "err9.1"))
              | _ -> raise (Failure "err10.1"))
          | TknS_Plg p ->
            let s2 = evo_nd_tkn s a e2 in
            !(evo_tkn (ref s2) a p)
          | _ -> raise (Failure "err8.1")
        ) in
      f0 s1
    | TnsT(e1,e2) ->
      let (r1,r2) = (evo_nd_tkn s a e1,evo_nd_tkn s a e2) in
      TknS_Tns(r1,r2)
    | PL_x e1 ->
      let a = evo_nd_tkn s a e1 in
      ( match a with
        | TknS_Tns (a1,_) ->
          a1
        | _ -> TknS_Tns(TknS_Plg exn_plg,TknS_Stg "exn3"))
    | PR_x e1 ->
      let a = evo_nd_tkn s a e1 in
      ( match a with
        | TknS_Tns (_,a2) ->
          a2
        | _ -> TknS_Tns(TknS_Plg exn_plg,TknS_Stg "exn4"))
    | Inj_x i ->
      TknS_Tns(TknS_Plg inj,TknS_Z i)
    | Cho_x i ->
      TknS_Tns(TknS_Plg cho,TknS_Z i)
    | Stg_x s ->
      TknS_Tns(TknS_Plg stg_plg,TknS_Stg s)
  )
(* Util.pnt dbg_stp ("return evo_nd_tkn:"^(print_tkn_s v)^"\n"); *)
(* let _ =  if dbg_stp then (read_line ()) else "" in *)
and evo_nd_tkn_agl s a p1 : (tkn_s * (int option)) =
  (* Util.pnt dbg_stp ("enter evo_nd_tkn:"^(print_tkn_s s)^","^
                 (print_nd_s e)^"\n"); *)
  (*  Util.pnt false ("enter v:"^(print_nd_s e)^"\n"); *)
  let e = !p1 in
  ( match e with
    | Z_x z -> (TknS_Z z,None)
    | Plg_x p ->
      if p=&nd_rot then (!s,None)
      else (TknS_Plg p,None)
    | Agl_x e1 ->
      let s2 = evo_nd_tkn s a e1 in
      ( match s2 with
        | TknS_Z z ->
          if (z=0) then
            (TknS_Plg nd_unt,Some 0)
          else (TknS_Plg nd_unt,Some 1)
        | TknS_Tns(TknS_Tns(TknS_Plg p1,TknS_Z i),s3) when p1=&inj ->
          (s3,Some i)
        | _ -> raise (Failure "err6.1"))
    | AppT (e1,e2) ->
      let s1 = evo_nd_tkn s a e1 in
      (* Util.pnt false ("Exp_App:"^(print_tkn_s s1)^","^
                     (print_tkn_s s2)^"\n"); *)
      let f0 s1 =
        ( match s1 with
          | TknS_Plg p when p=&nd_pls ->
            let s2 = evo_nd_tkn s a e2 in
            ( match s2 with
              | TknS_Tns(TknS_Z z1,TknS_Tns(TknS_Z z2,TknS_Plg p)) when p=nd_unt ->
                (TknS_Z (z1+z2),None)
              | _ -> raise (Failure "err4"))
          | TknS_Plg p when p=&nd_std_le ->
            let s2 = evo_nd_tkn s a e2 in
            ( match s2 with
              | TknS_Tns(TknS_Z z1,TknS_Tns(TknS_Z z2,TknS_Plg p)) when p=nd_unt ->
                if z1<=z2 then (TknS_Z 1,None)
                else (TknS_Z 0,None)
              | _ -> raise (Failure "err4"))
          | TknS_Plg p when p=&nd_mlt ->
            let s2 = evo_nd_tkn s a e2 in
            let s2l = list_of_tkn s2 in
            ( match s2l with
              | (TknS_Z z1)::(TknS_Z z2)::[] ->
                (TknS_Z (z1*z2),None)
              | _ -> raise (Failure "err5"))
          (*
        | TknS_Plg p when p=&nd_tns ->
        let r = TknS_Tns(TknS_Plg nd_tns,s2) in
        (r,o3)
      | TknS_Tns(TknS_Plg p,_) when p=&nd_tns ->
        (TknS_Tns(s1,s2),o3) *)
          | TknS_Plg p when p=&nd_mns ->
            let s2 = evo_nd_tkn s a e2 in
            ( match s2 with
              | TknS_Z z -> (TknS_Z(-z),None)
              | _ -> raise (Failure "err6"))
          | TknS_Plg p when p=&nd_eq ->
            let s2 = evo_nd_tkn s a e2 in
            let r = TknS_Tns(TknS_Plg nd_eq,s2) in
            (r,None)
          | TknS_Tns(TknS_Plg p,s1) when p=&nd_eq ->
            let s2 = evo_nd_tkn s a e2 in
            if s1=s2 then (TknS_Z 1,None) else (TknS_Z 0,None)
          | TknS_Plg p when p=&nd_sgn_ini ->
            let s2 = evo_nd_tkn s a e2 in
            ( match s2 with
              | TknS_Plg p when p=&nd_unt -> (TknS_Plg (sgn()),None)
              | _ -> raise (Failure "err6"))
          | TknS_Plg p when p=&nd_anm ->
            let s2 = evo_nd_tkn s a e2 in
            ( match s2 with
              | TknS_Tns(TknS_Plg p1,TknS_Stg s) when p1=&stg_plg ->
                (TknS_Tns(TknS_Plg exn_plg,TknS_Stg s),None)
              | _ -> raise (Failure "err6"))
          | TknS_Tns(TknS_Plg p,TknS_Z _) when p=&inj ->
            let s2 = evo_nd_tkn s a e2 in
            (TknS_Tns(s1,s2),None)
          | TknS_Tns(TknS_Plg p,_) when p =&clj ->
            let s2 = evo_nd_tkn s a e2 in
            let f = list_of_tkn s1 in
            ( match f with
              | _::as0::(TknS_Z i0)::(TknS_Plg p0)::[] ->
                let as0l = list_of_tkn as0 in
                if i0=1 then
                  (!(evo_tkn (ref (tkn_of_list (as0l@[s2]))) a p0),None)
                else
                  let r = tkn_of_list
                      [(TknS_Plg clj);(tkn_of_list (as0l@[s2]));
                       (TknS_Z(i0-1));(TknS_Plg p0) ] in
                  (r,None)
              | _ ->
                let r = TknS_Tns(TknS_Plg exn_plg,TknS_Stg "exn7.4") in
                (r,None)
            )
          | TknS_Tns(TknS_Plg p1,TknS_Z i) when p1 =& cho ->
            let s2 = evo_nd_tkn s a e2 in
            ( match s2 with
              | TknS_Tns(s3,s4) ->
                let l = list_of_tkn s4 in
                let vl = List.nth l i in
                (match vl with
                 | TknS_Plg p ->
                   (!(evo_tkn (ref s3) a p),None)
                 | _ -> raise (Failure "err9.1"))
              | _ -> raise (Failure "err10.1"))
          | TknS_Plg p ->
            let s2 = evo_nd_tkn s a e2 in
            (!(evo_tkn (ref s2) a p),None)
          | _ -> raise (Failure "err8.1")
        ) in
      f0 s1
    | TnsT(e1,e2) ->
      let ((r1,o1),(r2,o2)) = (evo_nd_tkn_agl s a e1,evo_nd_tkn_agl s a e2) in
      (TknS_Tns(r1,r2),(mrg_agl o1 o2))
    | PL_x e1 ->
      let a = evo_nd_tkn s a e1 in
      ( match a with
        | TknS_Tns (a1,_) ->
          (a1,None)
        | _ -> (TknS_Tns(TknS_Plg exn_plg,TknS_Stg "exn3"),None))
    | PR_x e1 ->
      let a = evo_nd_tkn s a e1 in
      ( match a with
        | TknS_Tns (_,a2) ->
          (a2,None)
        | _ -> (TknS_Tns(TknS_Plg exn_plg,TknS_Stg "exn4"),None))
    | Inj_x i ->
      (TknS_Tns(TknS_Plg inj,TknS_Z i),None)
    | Cho_x i ->
      (TknS_Tns(TknS_Plg cho,TknS_Z i),None)
    | Stg_x s ->
      (TknS_Tns(TknS_Plg stg_plg,TknS_Stg s),None)
  )
