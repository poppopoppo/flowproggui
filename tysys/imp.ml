
let dbg = true
open Types
open Print
exception Null
let gl_call g n =
  Util.pnt true ("enter gl_call:"^n^","^(string_of_gl_st g)^"\n");
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
