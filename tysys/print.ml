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
      else if p=stg then "ℾ"
      else "p"^(Sgn.print p)
    | Val v -> "t"^(Sgn.print v)^"'"
    | App(App(Prm p,e1),e2) ->
      if p=imp then ("("^(print_tm e1)^"→"^(print_tm e2)^")")
      else if p=tpl then ("{ "^(print_rcd e))
      else if p=prd then "↓[ "^(print_prd e)
      else if p=coprd then "↑[ "^(print_coprd e)
      else ("("^(print_tm (Prm p))^"◂"^(print_tm e1)^"◂"^(print_tm e2)^")")
    | App (e1,e2) -> ("("^(print_tm e1)^"◂"^(print_tm e2)^")")
  )
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
    let pre = (tabs d)^"» ` "^(string_of_typ 0 t)^" : "^(string_of_opr o)^"\n" in
    let mid = (tabs (d+1))^"∐ "^(Util.string_of_list ((tabs (d+1))^"∐ ") (string_of_code (d+1)) l)^(tabs d)^"∇" in
    pre^mid
  | Code_Prd ((t,o,_),l) ->
    let pre = (tabs d)^"» ` "^(string_of_typ 0 t)^" : "^(string_of_opr o)^"\n" in
    let mid = (tabs (d+1))^"∏ "^(Util.string_of_list ((tabs (d+1))^"∏ ") (string_of_code (d+1)) l)^(tabs d)^"∇" in
    pre^mid
  | Code_IO ((t,o,_),_,c0) ->
    let pre = (tabs (d+1))^"|» ` "^(string_of_typ 0 t)^" : "^(string_of_opr o)^"\n" in
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
      "¶ "^n^" ≃ "^(Util.string_of_list " ∐ " (fun (t,c) -> (string_of_typ 0 t)^" : "^c) l)
    | Flow(Def_Prd (n,_,l)) ->
      "¶ "^n^" ≃ "^(Util.string_of_list " ∐ " (fun (t,c) -> (string_of_typ 0 t)^" : "^c) l)
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
    | PrjL n1 -> "PrjL("^(print_nd n1)^")"
    | PrjR n1 -> "PrjR("^(print_nd n1)^")"
    | Inj i -> "↑["^(string_of_int i)^"]"
    | Cho i -> "↓["^(string_of_int i)^"]"
    | Exp_Stg s -> "Exp_Stg("^s^")"
  )
