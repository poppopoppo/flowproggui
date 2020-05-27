open Types
let rec typ_in_typ (g:gl_st) t0 t1 : bool =
  let r = typ_in_typ g in
  ( match t0 with
    | Typ_App (q0,q1) ->
      ( match t1 with
        | Typ_App (a0,a1) -> (r q0 a0)&&(r q1 a1)
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> true
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> true
      )
    | DepTyp (do1,dt1) ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_Exn ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_Z ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_Sgn ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_Rcd l ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_IO (q0,q1) ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_Btm ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_Top ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_Null ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_For_All (s0,a0) ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_CoPrd l0 ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_Prd l0 ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_Name n0 ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
    | Typ_Val x0 ->
      ( match t1 with
        | Typ_App (a0,a1) -> false
        | DepTyp (do0,dt0) -> false
        | Typ_Exn -> false
        | Typ_Z -> false
        | Typ_Sgn -> false
        | Typ_Rcd l -> false
        | Typ_IO (a0,a1) -> false
        | Typ_Btm -> false
        | Typ_Top -> false
        | Typ_Null -> false
        | Typ_For_All (s,a) -> false
        | Typ_CoPrd l -> false
        | Typ_Prd l -> false
        | Typ_Name n -> false
        | Typ_Val x -> false
      )
  )
