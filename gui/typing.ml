open Types
exception Typing_Error
let rec typing (g:gl_st) (c:code) : (typ * typ) =
  ( match c with
    | Rtn ->
      ( match src with
        | None -> (Typ_Val i,Typ_Val i)
        | Some t -> (t,t)
      )
    | Seq (e0,c0) ->
      let (s0,d0) = typing_exp g i src e0 in
      let (_,d1) = typing g i (Some d0) c0 in
      (s0,d1)
    | Canon (l,c) ->
      ( match src with
        | None ->
          let (srcs,dsts) =
            List.split (List.map (typing g i None) l) in
          let (_,d0) = typing g i (Some (Typ_Rcd dsts)) c in
          (Typ_Rcd srcs,d0)
        | Some t0 ->
          ( match t0 with
            | Typ_Rcd r ->
              let q = List.combine r l in
              let w =
                List.map
                  (fun (x,y) -> typing g i (Some x) y)
                  q in
              let (srcs,dsts) = List.split w in
              let (_,d0) = typing g i (Some (Typ_Rcd dsts)) c in
              (Typ_Rcd srcs,d0)
            | _ -> raise Typing_Error
          )
      )
    | Code_CoPrd ((_,o,_),l,c) ->
      let (s0,ds) = typing_agl g i src o in
      let q = List.combine ds l in

      (Typ_Val i,Typ_Val i)
    | Code_Prd (_,_,_) -> (Typ_Val i,Typ_Val i)
    | Code_IO (_,_,_,_) -> (Typ_Val i,Typ_Val i)
  )
and typing_exp g i (src:typ option) (e:top_exp) : (typ * typ) =
  let (_,o,_) = e in
  typing_opr g i src o
and typing_opr g i src o =
  ( match o with
    | Agl _ -> raise Typing_Error
    | Opr_Z _ ->
      ( match src with
        | None -> (Typ_Val i,Typ_Name "ℤ")
        | Some t0 -> (t0,Typ_Name "ℤ")
      )
    | Opr_Name n0 ->
      ( match src with
        | None -> (Typ_Val i,typing_name g n0)
        | Some t0 -> (t0,typing_name g n0)
      )
    | Opr_Rcd r ->
      let r0 = List.map (typing_opr g i None) r in
      let (s0,d0) = List.split r0 in
      (Typ_Rcd s0,Typ_Rcd d0)
    | Opr_Vct (_,_) -> (Typ_Val i,Typ_Val i)
    | Root _ -> (Typ_Val i,Typ_Val i)
    | Self _ -> (Typ_Val i,Typ_Val i)
    | App (_,_) -> (Typ_Val i,Typ_Val i)
    | Prj (_,_) -> (Typ_Val i,Typ_Val i)
    | Cast _ -> (Typ_Val i,Typ_Val i)
    | Opr_None -> (Typ_Val i,Typ_Val i)
    | Opr_Some _ -> (Typ_Val i,Typ_Val i)
    | Opr_Exn -> (Typ_Val i,Typ_Val i)
    | Opr_Stg _ -> (Typ_Val i,Typ_Val i)
  )
and typing_name g n =
  match g with
  | [] -> raise Typing_Error
  | (Etr (name,src,dst,_)) :: tl ->
    if n=name
    then Typ_Imp (src,dst)
    else typing_name tl n
  | _ -> raise Typing_Error
