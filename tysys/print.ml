open Types
let dbg = true

let tabs d = String.make d '\t'

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
  | Code_Exp (dst,o,_) -> (tabs d)^"» ` "^(string_of_typ 0 dst)^" : "^(string_of_opr o)^"\n"
  | Seq (c1,c2) -> (string_of_code d c1)^(string_of_code d c2)
  | Canon l ->
    let pre = (tabs (d+1))^"⁅ "^(Util.string_of_list ("\n"^(tabs (d+1))^"¦ ") (string_of_code (d+1)) l)^"\n"^(tabs d)^"⁆" in
    pre
  | Code_CoPrd ((t,o,_),l) ->
    let pre = (tabs d)^"» ` "^(string_of_typ 0 t)^" : "^(string_of_opr o)^"\n" in
    let mid = (tabs (d+1))^"∐ "^(Util.string_of_list ((tabs (d+1))^"∐ ") (string_of_code (d+1)) l)^(tabs d)^"∇" in
    pre^mid
  | Code_Prd ((t,o,_),l) ->
    let pre = (tabs d)^"» ` "^(string_of_typ 0 t)^" : "^(string_of_opr o)^"\n" in
    let mid = (tabs (d+1))^"∏ "^(Util.string_of_list ((tabs (d+1))^"∏ ") (string_of_code (d+1)) l)^(tabs d)^"∇" in
    pre^mid
  | Code_IO (_,(t,o,_),c0) ->
    let pre = (tabs (d+1))^"|» ` "^(string_of_typ 0 t)^" : "^(string_of_opr o)^"\n" in
    let mid = string_of_code (d+1) c0 in
    pre^mid
and string_of_opr x =
  match x with
  | Agl e -> "∠["^(string_of_opr e)^"]"
  | Opr_Z z -> string_of_int z
  | Opr_Name n -> n
  | Opr_Rcd l -> "{"^(Util.string_of_list " " string_of_opr l)^"}"
  | Root _ -> "$"
  | App (f,x) -> "("^(string_of_opr f)^"◂"^(string_of_opr x)^")"
  | Prj (f,x) -> "("^(string_of_opr f)^"◃"^(string_of_opr x)^")"
  | Opr_Exn -> "?"
  | Opr_Stg s -> "\""^s^"\""
  | _ -> "_"


let string_of_glb_etr e =
  ( match e with
    | Etr (n,s,d,c) ->
      ("§ "^n^" : "^(string_of_typ 0 s)^" ⊢ "^(string_of_typ 0 d)^" ≒ \n\t.» ")^
      (string_of_code 1 c)^"\n"
    | Flow(Def_CoPrd (n,_,l)) ->
      "¶ "^n^" ≃ "^(Util.string_of_list " ∐ " (fun (t,c) -> (string_of_typ 0 t)^" : "^c) l)
    | Flow(Def_Prd (n,_,l)) ->
      "¶ "^n^" ≃ "^(Util.string_of_list " ∐ " (fun (t,c) -> (string_of_typ 0 t)^" : "^c) l)
    | _ -> "¶ _ ≃ _"
  )

let string_of_gl_st (s:gl_st) =
  (Util.string_of_list "\n" string_of_glb_etr s)

let string_of_mdl (name,_,l) =
  ("§§ "^name^" ≒ \n"^
   (Util.string_of_list "\n" string_of_glb_etr l)^"\n§§.\n")
