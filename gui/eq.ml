open Types
let rec eq (v0:tkn) (v1:tkn) : bool =
  ( match v0 with
    | Tkn_Exn s0 ->
      ( match v1 with
        | Tkn_Exn s1 -> s0=s1
        | Tkn_Z _ -> false
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg _ -> false
      )
    | Tkn_Z z1 ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z z0 -> z0=z1
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg _ -> false

      )
    | Tkn_Rcd l1 ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z _ -> false
        | Tkn_Rcd l0 -> List.for_all (fun (x0,x1) -> eq x0 x1) (List.combine l1 l0)
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg _ -> false

      )
    | Tkn_CoPrd _ ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z _ -> false
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg _ -> false

      )
    | Tkn_Prd (_,_) ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z _ -> false
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg _ -> false

      )
    | Tkn_Null ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z _ -> false
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> true
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg _ -> false

      )
    | Tkn_Btm ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z _ -> false
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> true
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg _ -> false

      )
    | Tkn_IO_Inj _ ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z _ -> false
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg _ -> false
      )
    | Tkn_IO_Cho _ ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z _ -> false
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg _ -> false
      )
    | Tkn_IO_Sgn ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z _ -> false
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg _ -> false
      )
    | Tkn_IO_Code (_,_) ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z _ -> false
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg _ -> false
      )
    | Tkn_Agl _ ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z _ -> false
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg _ -> false

    )
    | Tkn_Sgn i0 ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z _ -> false
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn i1 -> i0=i1
        | Tkn_Stg _ -> false
      )
    | Tkn_Stg s0 ->
      ( match v1 with
        | Tkn_Exn _ -> false
        | Tkn_Z _ -> false
        | Tkn_Rcd _ -> false
        | Tkn_CoPrd _ -> false
        | Tkn_Prd (_,_) -> false
        | Tkn_Null -> false
        | Tkn_Btm -> false
        | Tkn_IO_Inj _ -> false
        | Tkn_IO_Cho _ -> false
        | Tkn_IO_Sgn -> false
        | Tkn_IO_Code (_,_) -> false
        | Tkn_Agl _ -> false
        | Tkn_Sgn _ -> false
        | Tkn_Stg s1 -> s0=s1
      )

  )
