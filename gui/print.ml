open Types
let dbg = true

let tabs d = String.make d '\t'

let rec string_of_typ d x =
  let ex= if d=0 then "! " else "" in
  match x with
  | Typ_Z -> ex^"ℤ"
  | Typ_Sgn -> "|&|"
  | Typ_Stg -> "string"
  | Typ_Rcd [] -> if d=0 then "" else "{}"
  | Typ_Rcd r ->
    if d=0
    then (Util.string_of_list " " (string_of_typ (d+1)) r)
    else "{ "^(Util.string_of_list " " (string_of_typ (d+1)) r)^" }"
  | Typ_Top -> ex^"Top"
  | Typ_Null -> ex^"Null"
  | Typ_IO (src,dst) -> ex^"("^(string_of_typ (d+1) src)^"→"^(string_of_typ (d+1) dst)^")"
  | Typ_Btm -> ex^"⊥"
  | Typ_Val x -> ex^x^"'"
  | Typ_Name n -> ex^n
  | Typ_For_All (x,t) ->
    x^"∀ "^(string_of_typ 0 t)
  | Typ_App (p1,p2) -> (string_of_typ 1 p1)^"◂"^(string_of_typ 1 p2)
  | Typ_CoPrd c -> "∐\'◂{"^(Util.string_of_list " " (string_of_typ 1) c)^"}"
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
      | Tkn_Exn x -> ex^"exn("^x^")"
      | Tkn_CoPrd c ->
        ex^"∐\'◂{"^(Util.string_of_list "¦" (string_of_tkn 1) c)^"}"
      (*    | Pure (i,v) -> ex^"\\∐["^(string_of_int i)^"]"^(string_of_tkn 1 v) *)
      | Tkn_Prd _ -> ex^"Tkn_Prd"
      | Tkn_Null -> ex^"∅"
      | Tkn_Btm -> ex^"⊥"
      | Tkn_IO _ -> ex^"io"
      | Tkn_Agl c -> ex^"∠["^(string_of_tkn (d+1) c)^"]"
      | Tkn_Sgn i -> ex^"¿p"^(string_of_int i)
      | Tkn_Stg s -> "\""^s^"\""
    ) in
  v

let string_of_st (x:st) : string =
  "` "^(string_of_typ 0 (fst x))^" : "^(string_of_tkn 0 (snd x))

let rec string_of_code d x =
  match x with
  | Id _ -> ""
  | Seq (a,Opr (dst,o)) -> (string_of_code d a)^"\n"^(tabs d)^"» "^"` "^(string_of_typ 0 dst)^" : "^(string_of_opr o)^" »."
  | Seq (a,b) -> (string_of_code d a)^"\n"^(tabs d)^"» "^(string_of_code d b)
  | Canon l -> "\n"^(tabs (d+1))^"⁅ "^(Util.string_of_list ("\n"^(tabs (d+1))^"¦ ") (string_of_code (d+1)) l)^"\n"^(tabs d)^"⁆\n"
  | Opr (dst,o) -> "` "^(string_of_typ 0 dst)^" : "^(string_of_opr o)
  | Code_CoPrd (c,l) -> (string_of_code d c)^"\n"^(tabs (d+1))^"∐ "^(Util.string_of_list ("\n"^(tabs (d+1))^"∐ ") (string_of_code (d+1)) l)^"\n"^(tabs d)^"∇"
  | Code_Prd (l,c) -> (Util.string_of_list "\n\t∏ " (string_of_code (d+1)) l)^(string_of_code (d+1) c)^"\n∆\n"

and string_of_opr x =
  match x with
  | Agl e -> "∠["^(string_of_opr e)^"]"
  | Opr_Z z -> string_of_int z
  | Plus (e1,e2) -> "("^(string_of_opr e1)^"+"^(string_of_opr e2)^")"
  | Mult (e1,e2) -> "("^(string_of_opr e1)^"*"^(string_of_opr e2)^")"
  | Minus e1 -> "(-"^(string_of_opr e1)
  | Opr_Name n -> n
  | Opr_Rcd l -> "{"^(Util.string_of_list " " string_of_opr l)^"}"
  | Root -> "$"
  | App (f,x) -> "("^(string_of_opr f)^"◂"^(string_of_opr x)^")"
  | Prj (f,x) -> "("^(string_of_opr f)^"◃"^(string_of_opr x)^")"
  | Opr_Exn s -> "¡"^s
  | Const v -> string_of_st v
  | Eq (e1,e2) -> "("^(string_of_opr e1)^"="^(string_of_opr e2)^")"
  | Opr_Sgn_Ini -> "&"
  | Opr_Stg s -> "\""^s^"\""


let string_of_glb_etr e =
  ( match e with
    | Etr (n,s,d,c) ->
      ("§ "^n^" : "^(string_of_typ 0 s)^" ⊢ "^(string_of_typ 0 d)^" ≒ \n\t.» ")^
      (string_of_code 1 c)^"\n"
    | Def_CoPrd (n,l) ->
      "¶ "^n^" ≃ "^(Util.string_of_list " ∐ " (fun (t,c) -> (string_of_typ 0 t)^" : "^c) l)
    | Def_Prd (n,l) ->
      "¶ "^n^" ≃ "^(Util.string_of_list " ∐ " (fun (t,c) -> (string_of_typ 0 t)^" : "^c) l)
  )

let string_of_gl_st (s:gl_st) =
  (Util.string_of_list "\n" string_of_glb_etr s)

let string_of_mdl (name,l) =
  ("§§ "^name^" ≒ \n"^
   (Util.string_of_list "\n" string_of_glb_etr l)^"\n§§.\n")
