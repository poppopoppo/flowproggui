open Types
let rec typing (c:code) : (typ*typ) =
  let in_typ =
    ( match c with
      | Rtn _ -> Typ_Btm
      | Seq (_,_) -> Typ_Btm
      | Canon (l,_) -> Typ_Rcd (List.map (fun x -> fst (typing x)) l)
      | Code_CoPrd (_,_,_) -> Typ_Btm
      | Code_Prd (_,_,_) -> Typ_Btm
      | Code_IO (_,_,_,_) -> Typ_Btm ) in
  let out_typ =
    ( match c with
      | Rtn _ -> Typ_Top
      | Seq (_,_) -> Typ_Top
      | Canon (_,_) -> Typ_Top
      | Code_CoPrd (_,_,_) -> Typ_Top
      | Code_Prd (_,_,_) -> Typ_Top
      | Code_IO (_,_,_,_) ->Typ_Top ) in
  (in_typ,out_typ)
