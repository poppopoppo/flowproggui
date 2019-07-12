(*
type tkn =
  | Tkn_Unt
  | Tkn_Stg of string
  | Tkn_Z of int
  | Tkn_Bol of bool
  | Tkn_Sgn of Sgn.t
  | Tkn_Tns of Sgn.t * Sgn.t
  | Tkn_CoP of bool * Sgn.t
  | Tkn_Pls
  | Tkn_Mlt
  | Tkn_Mns
  | Tkn_Cmp
  | Tkn_Eq
  | Tkn_Inj of bool
  | Tkn_Cho of bool
  | Tkn_Fix
  | Tkn_Exn
  | Tkn_Fnc of Sgn.t * Sgn.t (* jmp_ptr arg_ptr *)
type rcd_tkn =
  | Rcd of rcd_tkn list
  | Atm of tkn
type st = (Sgn.t , tkn) Hashtbl.t
type st_y =
  (Sgn.t ,int) Hashtbl.t
  * ((Sgn.t,string) Hashtbl.t)
  * ((Sgn.t,Sgn.t) Hashtbl.t)
let get_k v p =
  ( try
      let k = Hashtbl.find v p in
      Hashtbl.remove v p;
      k
    with _ -> raise (Failure "vm0.get:0"))
let get_k_list v r =
  let rec f_i r0 =
    let k0 = get_k v r0 in
    ( match k0 with
      | Tkn_Unt -> []
      | Tkn_Tns(r1,r2) ->
        let k1 = get_k v r1 in
        k1::(f_i r2)
      | _ -> raise (Failure "vm1.get_k_list:0")
    ) in
  f_i r
let rec get_k_rcd v r =
  let k0 = get_k v r in
  ( match k0 with
    | Tkn_Unt -> Rcd []
    | Tkn_Tns(r1,r2) ->
      let k1 = get_k_rcd v r1 in
      let k2 = get_k_rcd v r2 in
      ( match k2 with [
          | Rcd l -> Rcd (k1::l)
          | _ -> raise (Failure "get_k_rcd"))
    | a -> Atm a )
let set_k v p k =
  Hashtbl.remove v p;
  Hashtbl.add v p k
type gst = st * (cs Stack.t)
and cs =
  | CS of Sgn.t * Sgn.t
  | CS_L of Sgn.t * Sgn.t * (Mutex.t * (st option ref))
  | CS_R of Sgn.t * Sgn.t * (Mutex.t * (st option ref))
type op =
  | Id of Sgn.t * Sgn.t
  | Rm of Sgn.t
  | Agl of Sgn.t * Sgn.t
  | Prd of Sgn.t * Sgn.t
  | Fnc of Sgn.t * Sgn.t
  | Spt of (Sgn.t * Sgn.t) * Sgn.t
  | Rpc of (Sgn.t * Sgn.t) * Sgn.t
  | Cns of Sgn.t * (Sgn.t * Sgn.t)
  | Call of Sgn.t * (Sgn.t * Sgn.t) (* y <- f ◂ x *)
  | HCall of Sgn.t * (Sgn.t * Sgn.t) * (Sgn.t * Sgn.t)
  | Ini_Tkn of Sgn.t * tkn
  | Ini_Sgn of Sgn.t

type asm = (Sgn.t, pt) Hashtbl.t
type asm_op = asm * Sgn.t
and pt =
  | Ret of Sgn.t
  | Op of op * Sgn.t
let get_pt a p =
  Hashtbl.find a p
let rec run a p gv =
  let ox = get_pt a p in
  let (v,cs) = gv in
  ( match ox with
    | Ret r0 ->
      let k0 = get_k v r0 in
      if (Stack.is_empty cs) then gv
      else
        let hd = Stack.pop cs in
        ( match hd with
          | CS (p0,r1) ->
            set_k v r1 k0;
            run a p0 gv
          | _ -> raise (Failure "vm1.run:0") )
    | Op (o0,np) ->
      ( match o0 with
        | Id (p1,p2) ->
          let k2 = get_k v p2 in
          set_k v p1 k2;
          run a np gv
        | Agl (r0,p0) ->
          let k1 = get_k v r0 in
          ( match k1 with
            | Tkn_CoP (true,r3) ->
              let k2 = get_k v r3 in
              set_k v r0 k2;
              run a p0 gv
            | Tkn_CoP(false,r3) ->
              let k2 = get_k v r3 in
              set_k v r0 k2;
              run a np gv )
        | Call (y,f,x) ->
          let k_f = get_k v f in
          ( match k_f with
            | Tkn_Pls ->
              let k_xl = get_k_list v x in
              ( match k_xl with
                | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                  set_k v y (Tkn_Z (z1+z2));
                  run a np gv
                | _ -> raise (Failure "vm1.run:2") )
            | Tkn_Mlt ->
              let k_xl = get_k_list v x in
              ( match k_xl with
                | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                  set_k v y (Tkn_Z (z1*z2));
                  run a np gv
                | _ -> raise (Failure "vm1.run:3") )
            | Tkn_Mns ->
              let k_xl = get_k_list v x in
              ( match k_xl with
                | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                  set_k v y (Tkn_Z (z1-z2));
                  run a np gv
                | _ -> raise (Failure "vm1.run:2") )
            | Tkn_Cmp ->
              let k_xl = get_k_list v x in
              ( match k_xl with
                | (Tkn_Z z1)::(Tkn_Z z2)::[] ->
                  set_k v y (Tkn_Bol (z1<=z2));
                  run a np gv
                | _ -> raise (Failure "vm1.run:2") )
            | Tkn_Eq ->
              let k_r = get_k_rcd v x in
              ( match k_r with
                | Rcd (x1::x2::[]) ->
                  if x1=x2 then
                    ( set_k v y (Tkn_Bol true);
                      run a np gv )
                  else
                    ( set_k v y (Tkn_Bol false);
                      run a np gv )
                | _ -> raise (Failure "vm1.run:3"))
            | Tkn_Inj b ->
              let k0 = get_k v x in

            | Tkn_Cho b
            | Tkn_Fix
            | Tkn_Exn
            | Tkn_Fnc          )
        | HCall of Sgn.t * (Sgn.t * Sgn.t) * (Sgn.t * Sgn.t)
        | Prd (of Sgn.t * Sgn.t
              | Fnc of Sgn.t * Sgn.t
              | PrjL of Sgn.t * Sgn.t
              | PrjR of Sgn.t * Sgn.t
              | InjL of Sgn.t * Sgn.t
              | InjR of Sgn.t * Sgn.t
              | ChoL of Sgn.t * Sgn.t
              | ChoR of Sgn.t * Sgn.t
              | Cns of Sgn.t * (Sgn.t * Sgn.t)
              | Ini_Z of Sgn.t * int
              | Ini_Stg of Sgn.t * string
              | Ini_Bol of Sgn.t * bool
              | Ini_Sgn of Sgn.t
              | Eq of Sgn.t * (Sgn.t * Sgn.t)
              | Rpc of (Sgn.t * Sgn.t) * Sgn.t
              | Fix of Sgn.t * Sgn.t
              | Add of Sgn.t * (Sgn.t * Sgn.t)
              | Mul of Sgn.t * (Sgn.t * Sgn.t)
              | Sub of Sgn.t * (Sgn.t * Sgn.t)
              | Cmp of Sgn.t * (Sgn.t * Sgn.t)
              | Exn of Sgn.t * Sgn.t
                       *)
