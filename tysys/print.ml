open Types
open Util
let dbg = true

let tabs d = String.make d '\t'
let rec print_tm e =
  ( match e with
    | Prm p ->
      if p=imp then "→"
      else if p=rcd then "{"
      else if p=z then "ℤ"
      else if p=rcd_end then "{}"
      else if e=stg then "ℾ"
      else if p=fld then "<>"
      else if p=unfld then "><"
      else if e=pZ then "pℤ"
      else if p=inA then "+"
      else if p=outA then "-"
      else if e=sgn_sgn then "&"
      else "p"^(Sgn.print p)
    | Val v -> "t"^(Sgn.print v)^"'"
    | App(App(em,e1),e2) ->
      ( match em with
        | Prm p ->
          if p=imp then ("("^(print_tm e1)^"→"^(print_tm e2)^")")
          else if p=tpl then ("{ "^(print_rcd e))
          else if p=prd then "↓[ "^(print_prd e)
          else if p=coprd then "↑[ "^(print_coprd e)
          else ("("^(print_tm (Prm p))^"◂"^(print_tm e1)^"◂"^(print_tm e2)^")")
        | App(Prm p,x) ->
          if p=unv_coprd then
            ( match x with
              | Val v -> "∐[ "^(print_coprd_unv v e)
              | Prm p1 ->
                if p1=typ_inj then "↑[ "^(print_coprd_inj e)
                else "∐[ "^(print_coprd_prm (Prm p1) e)
              | _ -> "("^(print_tm em)^"◂"^(print_tm e1)^"◂"^(print_tm e2)^")"
            )
          else "("^(print_tm em)^"◂"^(print_tm e1)^"◂"^(print_tm e2)^")"
        | _ -> "("^(print_tm em)^"◂"^(print_tm e1)^"◂"^(print_tm e2)^")"
      )
    | App (e1,e2) -> ("("^(print_tm e1)^"◂"^(print_tm e2)^")")
  )
and print_coprd_unv v e =
  ( match e with
    | App(App(App(Prm p,Val v1),e1),e2) ->
      if p=unv_coprd && v=v1 then (print_tm e1)^" "^(print_coprd_unv v e2)
      else raise @@ Failure "print_prd_unv:0"
    | Prm p ->
      if p=coprd_end then "]"
      else raise @@ Failure "print_coprd_unv:1"
    | Val _ -> "<]"
    | _ -> raise @@ Failure "print_coprd_unv:2" )
and print_coprd_inj e =
  ( match e with
    | App(App(App(Prm p,Prm p1),e1),e2) ->
      if p=unv_coprd && typ_inj=p1 then (print_tm e1)^" "^(print_coprd_inj e2)
      else raise @@ Failure "print_coprd_inj:0"
    | Prm p ->
      if p=coprd_end then "]"
      else raise @@ Failure "print_coprd_inj:1"
    | Val _ -> "<]"
    | _ -> raise @@ Failure "print_coprd_inj:2" )
and print_coprd_prm p e =
  ( match e with
    | App(App(App(Prm p1,p2),e1),e2) ->
      if p1=unv_coprd && p=p2 then (print_tm e1)^" "^(print_coprd_prm p e2)
      else raise @@ Failure "print_prd_prm:0"
    | Prm p ->
      if p=coprd_end then "]"
      else raise @@ Failure "print_coprd_prm:1"
    | Val _ -> "<]"
    | _ -> raise @@ Failure "print_coprd_prm:2" )
and print_rcd e =
  ( match e with
    | App(App(Prm p,e1),e2) ->
      if p=tpl then (print_tm e1)^" "^(print_rcd e2)
      else raise @@ Failure "print_rcd:0"
    | Prm p ->
      if p=rcd_end then "}"
      else raise @@ Failure "print_rcd:1"
    | Val _ -> "<}"
    | _ -> raise @@ Failure "print_rcd:2" )
and print_prd e =
  ( match e with
    | App(App(Prm p,e1),e2) ->
      if p=prd then (print_tm e1)^" "^(print_prd e2)
      else raise @@ Failure "print_prd:0"
    | Prm p ->
      if p=prd_end then "]"
      else raise @@ Failure "print_prd:1"
    | Val _ -> "<]"
    | _ -> raise @@ Failure "print_prd:2" )
and print_coprd e =
  ( match e with
    | App(App(Prm p,e1),e2) ->
      if p=coprd then (print_tm e1)^" "^(print_coprd e2)
      else raise @@ Failure "print_prd:0"
    | Prm p ->
      if p=coprd_end then "]"
      else raise @@ Failure "print_coprd:1"
    | Val _ -> "<]"
    | _ -> raise @@ Failure "print_coprd:2" )
let print_c c = List.fold_left (fun s (x,y) -> s^","^((print_tm x)^"~"^(print_tm y))) "" c
let print_cxt c =
  SgnMap.fold
    (fun i v r -> r^(print_tm (Val i))^" -> "^(print_tm v)^"\n")
    c ""
let rec print_rec_scm (c,y) =
  let p = print_scm_hd c in
  "["^p^"] ∀ "^(print_tm y)
and print_scm_hd h =
  let bs = SgnMap.bindings h in
  let p = string_of_list ","
      (fun (k,v) ->
         let v0 =
           ( match v with
             | None -> ""
             | Some x -> "≃"^(print_tm x)
           ) in
         "t"^(Sgn.print k)^"'"^v0)
      bs in
  p
let print_mdl_gma (g:mdl_gma) : string =
  StgMap.fold
    (fun k (h,v) r ->
       r^(print_scm_hd h)^" "^k^":"^(print_tm v)^"\n")
    g ""
let print_typ_gma (g:typ_gma) : string =
  SgnMap.fold
    (fun k (y1,y2) r ->
       r^(Sgn.print k)^". "^(print_tm y1)^"≃"^(print_tm y2)^"\n")
    g ""
let rec string_of_typ d x =
  let ex= if d=0 then "! " else "" in
  match x with
  | Typ_Rcd [] -> if d=0 then "" else "{}"
  | Typ_Rcd r ->
    if d=0
    then (Util.string_of_list " " (string_of_typ (d+1)) r)
    else "{ "^(Util.string_of_list " " (string_of_typ (d+1)) r)^" }"
  | Typ_Imp (src,dst) -> ex^"("^(string_of_typ (d+1) src)^"→"^(string_of_typ (d+1) dst)^")"
  | Typ_Val x -> ex^"t"^(string_of_int x)^"'"
  | Typ_Name n -> ex^n
  | Typ_App (p1,p2) -> (string_of_typ 1 p1)^"◂"^(string_of_typ 1 p2)
  | Typ_CoPrd c -> "↑["^(Util.string_of_list "¦" (string_of_typ 1) c)^"<]"
  | Typ_Null -> "∅"
  | _ -> raise @@ Failure ("error:string_of_typ:")

let rec string_of_tkn d s =
  let ex= if d=0 then "! " else "" in
  let v =
    ( match s with
      | Tkn_Z z ->
        ex^(string_of_int z)
      | Tkn_Rcd [] -> if d=0 then "" else "{}"
      | Tkn_Rcd l ->
        let m = (Util.string_of_list " " (string_of_tkn (d+1)) l) in
        if d=0 then m else ("{ "^m^" }")
      | Tkn_Exn x -> ex^"?◂("^x^")"
      | Tkn_CoPrd c ->
        ex^"∐\'◂{"^(Util.string_of_list "¦" (string_of_tkn 1) c)^"}"
      (*    | Pure (i,v) -> ex^"\\∐["^(string_of_int i)^"]"^(string_of_tkn 1 v) *)
      | Tkn_Prd _ -> ex^"Tkn_Prd"
      | Tkn_Null -> ex^"∅"
      | Tkn_Btm -> ex^"⊥"
      | Tkn_IO_Inj i -> ex^"\\∐["^(string_of_int i)^"]"
      | Tkn_IO_Cho i -> ex^"\\∏["^(string_of_int i)^"]"
      | Tkn_IO_Sgn -> "&"
      | Tkn_IO_Code (_,_,_,_) -> ex^"io"
      | Tkn_Sgn i -> ex^"p"^(string_of_int i)^"\'"
      | Tkn_Stg s -> "\""^s^"\""
      | _ -> "¿"
    ) in
  v
let string_of_st (x:st) : string =
  "` "^(string_of_typ 0 (fst x))^" : "^(string_of_tkn 0 (snd x))

let rec string_of_code d x =
  match x with
  | Seq (c1,Code_Exp(_,o,_)) -> (string_of_code d c1)^"» "^(string_of_opr o)
  | Code_Exp (_,o,_) -> (tabs d)^"» "^(string_of_opr o)^"\n"
  | Seq (c1,c2) -> (string_of_code d c1)^(string_of_code d c2)
  | Canon l ->
    let pre = (tabs (d+1))^"⁅ "^(Util.string_of_list ((tabs (d+1))^"¦ ") (string_of_code (d+1)) l)^"\n"^(tabs d)^"⁆" in
    pre
  | Code_CoPrd ((t,o,_),l) ->
    let pre = (tabs d)^"» ` "^(print_tm t)^" : "^(string_of_opr o)^"\n" in
    let mid = (tabs (d+1))^"∐ "^(Util.string_of_list ((tabs (d+1))^"∐ ") (string_of_code (d+1)) l)^(tabs d)^"∇" in
    pre^mid
  | Code_Prd ((t,o,_),l) ->
    let pre = (tabs d)^"» ` "^(print_tm t)^" : "^(string_of_opr o)^"\n" in
    let mid = (tabs (d+1))^"∏ "^(Util.string_of_list ((tabs (d+1))^"∏ ") (string_of_code (d+1)) l)^(tabs d)^"∇" in
    pre^mid
  | Code_IO ((t,o,_),_,c0) ->
    let pre = (tabs (d+1))^"|» ` "^(print_tm t)^" : "^(string_of_opr o)^"\n" in
    let mid = string_of_code (d+1) c0 in
    pre^mid
and string_of_opr x =
  match x with
  | Agl e -> "∠["^(string_of_opr e)^"]"
  | Opr_Z z -> string_of_int z
  | Opr_Name n -> n
  | Opr_Rcd l -> "{"^(Util.string_of_list " " string_of_opr l)^"}"
  | Opr_App (f,x) -> "("^(string_of_opr f)^"◂"^(string_of_opr x)^")"
  | Prj (f,x) -> "("^(string_of_opr f)^"◃"^(string_of_int x)^")"
  | Opr_Inj i -> "↑["^(string_of_int i)^"]"
  | Opr_Cho i -> "↓["^(string_of_int i)^"]"
  | Opr_Stg s -> "\""^s^"\""

let string_of_glb_etr f e =
  ( match e with
    | Etr (h,(n,s,d,c)) ->
      let p0 = "§ "^n^" : "^(print_scm_hd h)^" ∀ "^(print_tm s)^" ⊢ "^(print_tm d) in
      let p1 = " ≒ \n\t.» "^(string_of_code 1 c)^"\n" in
      if f then p0^p1 else p0
    | Etr_Clq(h,l) ->
      let p = List.fold_left
          ( fun r (n,s,d,c) ->
              let p0 = "@ "^n^" : "^(print_tm s)^" ⊢ "^(print_tm d) in
              let p1 = " ≒ \n\t.» "^(string_of_code 1 c)^"\n\t" in
              if f then r^p0^p1 else r^p0^"\n\t" )
          "" l in
      "§ "^(print_scm_hd h)^"∀ "^p
    | Flow(Def_CoPrd (n,_,l)) ->
      "¶ "^n^" ≃ "^(Util.string_of_list " ∐ " (fun (t,c) -> (print_tm t)^" : "^c) l)
    | Flow(Def_Prd (n,_,l)) ->
      "¶ "^n^" ≃ "^(Util.string_of_list " ∐ " (fun (t,c) -> (print_tm t)^" : "^c) l)
    | _ -> "¶ _ ≃ _"
  )

let string_of_gl_st (s:gl_st) =
  (Util.string_of_list "\n" (string_of_glb_etr true) s)

let string_of_mdl f (name,_,l) =
  ("§§ "^name^" ≒ \n"^
   (Util.string_of_list "\n" (string_of_glb_etr f) l)^"\n§§.\n")
let rec print_vh c =
  ( match c with
    | V (c1,c2) -> "V("^(print_vh c1)^","^(print_vh c2)^")"
    | H (c1,c2) -> "H("^(print_vh c1)^","^(print_vh c2)^")"
    | E n -> "E("^(print_nd n)^")"
    | P (n,l) -> "P("^(print_nd n)^",["^(string_of_list "," print_vh l)^"])"
    | A(n,p,l) -> "A("^(print_nd n)^",["^(string_of_list "," string_of_int p)^"],["^
                  (string_of_list "," print_vh l)^"])"
    | F (n,i,c1) -> "F("^(print_nd n)^","^(string_of_int i)^","^(print_vh c1)^")"
  )
and print_nd n =
  ( match n with
    | Exp_Z z -> "Exp_Z("^(string_of_int z)^")"
    | Exp_Name s -> "Exp_Name("^s^")"
    | Exp_App (n1,n2) -> "("^(print_nd n1)^"◂"^(print_nd n2)^")"
    | Exp_Tns(n1,n2) -> "<"^(print_nd n1)^"¦"^(print_nd n2)^">"
    | PrjL n1 -> "PrjL("^(print_nd n1)^")"
    | PrjR n1 -> "PrjR("^(print_nd n1)^")"
    | Inj i -> "↑["^(string_of_int i)^"]"
    | Cho i -> "↓["^(string_of_int i)^"]"
    | Exp_Stg s -> "Exp_Stg("^s^")"
  )

let rec string_of_lst s =
  match s with
  | Lst_Unt -> "{}"
  | Lst_Exn s -> "?◂"^"\""^s^"\""
  | Lst_Tns (s1,s2) -> "<"^(string_of_lst s1)^"¦"^(string_of_lst s2)^">"
  | Lst_Vct _ -> "?◂"^"Lst_Vct"
  | Lst_CoPrd (i,s1) -> "↑["^(string_of_int i)^"]◂"^(string_of_lst s1)
  | Lst_Prd _ -> "?◂Lst_Prd"
  | Lst_Code (Arg_Rcd(as0,i),c) ->
    let p1 = (print_code_i c) in
    let p2 =
      if as0=[] then ""
      else "◂{"^(string_of_list " " string_of_lst as0) in
    let p3 =
      if i=0 then ""
      else List.fold_left (^) "" (BatList.init i (fun _ -> " _")) in
    "\\"^p1^p2^p3^"}"
  | Lst_Code (Arg_Mno None,c) -> print_code_i c
  | Lst_Code (Arg_Mno (Some x),c) -> "\\"^(string_of_lst x)^"◂"^(print_code_i c)
  | Lst_Sgn v -> "&."^(Sgn.print v)
  | Lst_Z (z1,_) -> string_of_int z1
  | Lst_Stg w -> "\""^w^"\""
and print_code_i c =
  ( match c with
    | C_VH c -> "\\"^(print_vh c)
    | C_Name n -> "\\"^n
    | C_Inj i -> "↑["^(string_of_int i)^"]"
    | C_Cho i -> "↓["^(string_of_int i)^"]"
    | C_Agl -> "∠" )
let rec print_tkn_s v =
  ( match v with
    | TknS_Stg s -> "\""^s^"\""
    | TknS_Tns (v1,v2) -> "<"^(print_tkn_s v1)^","^(print_tkn_s v2)^">"
    | TknS_Z z -> (string_of_int z)
    | TknS_Plg p -> "&["^(Sgn.print p)^"]"
  )
    let rec print_nd_s n =
  ( match n with
    | Z_S z -> (string_of_int z)
    | Gl_S p when p=nd_unt -> "{}"
    | Agl_S n1 -> "∠("^(print_nd_s n1)^")"
    | Gl_S p when p=nd_rot -> "$"
    | Gl_S p -> "&"^(Sgn.print p)
    | App_S (n1,n2) -> "("^(print_nd_s n1)^"◂"^(print_nd_s n2)^")"
    | Tns_S(n1,n2) -> "<"^(print_nd_s n1)^"¦"^(print_nd_s n2)^">"
    | PL_S n1 -> (print_nd_s n1)^"◃0"
    | PR_S n1 -> (print_nd_s n1)^"◃1"
    | Inj_S i -> "↑["^(string_of_int i)^"]"
    | Cho_S i -> "↓["^(string_of_int i)^"]"
    | Stg_S s -> "\""^s^"\""
  )
(*
let rec print_net_lst k =
  ( match k with
    | LST_Unt -> "{}"
    | Lst_TnsL k1 -> "<"^(print_net_lst k1)^"¦"
    | Lst_TnsR k1 -> "¦"^(print_net_lst k1)^">"
    | Lst_Exn s -> "?["^s^"]"
    | Lst_CoPrd (j,k1) ->
      "↑["^(string_of_int j)^","^(print_net_lst k1)^"]"
    | Lst_Prd (p1,p2) -> "↓["^(Sgn.print p1)^","^(Sgn.print p2)^"]"
    | Lst_Code (p1,p2) -> "+["^(Sgn.print p1)^","^(Sgn.print p2)^"]"
    | Lst_Sgn p1 -> "&["^(Sgn.print p1)^"]"
    | Lst_Z (z1,z2) ->
      "Z["^(string_of_int z1)^","^(string_of_int z2)^"]"
    | Lst_Stg s -> "\""^s^"\""
  )
*)
